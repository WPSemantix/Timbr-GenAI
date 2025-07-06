import os
from dotenv import load_dotenv
from snowflake.core import Root
from snowflake.snowpark import Session
import json

# Load environment variables
load_dotenv()

# Snowflake connection parameters
CONNECTION_PARAMETERS = {
    "account": os.environ["SNOWFLAKE_ACCOUNT"],
    "user": os.environ["SNOWFLAKE_USER"],
    "password": os.environ["SNOWFLAKE_PASSWORD"],
    "role": os.environ["SNOWFLAKE_ROLE"],
    "database": os.environ["SNOWFLAKE_DATABASE"],
    "warehouse": os.environ["SNOWFLAKE_WAREHOUSE"],
    "schema": os.environ["SNOWFLAKE_SCHEMA"],
}

COLUMNS = [
    "chunk",
    "chunk_index",
    "relative_path"
]
NUM_CHUNKS = 3

def get_session_and_root():
    session = Session.builder.configs(CONNECTION_PARAMETERS).create()
    root = Root(session)
    return session, root

def get_cortex_service():
    session, root = get_session_and_root()
    svc = root.databases[os.environ["SNOWFLAKE_DATABASE"]].schemas[os.environ["SNOWFLAKE_SCHEMA"]].cortex_search_services[os.environ["SNOWFLAKE_CSS"]]
    return svc, session

def get_similar_chunks_search_service(query):
    svc, _ = get_cortex_service()
    response = svc.search(query, COLUMNS, limit=NUM_CHUNKS)
    print(response.json)
    return response.json()

def create_prompt(myquestion):
    prompt_context = get_similar_chunks_search_service(myquestion)
    prompt = f"""
        You are an expert chat assistance that extracs information from the CONTEXT provided
        between <context> and </context> tags.
        When anwering the question contained between <question> and </question> tags
        be concise and do not hallucinate. Every response for identified review must be with review's Order ID and Customer ID in the response.
        Validate at least once the intended text to be shared that it actually contains the requested words or text, if not please itterate step by step till you have an expected answer or reply NOT in Context otherwise. 
        If you don´t have the information just say so.
        Only answer the question if you can extract it from the CONTEXT provideed.
        
        Do not mention the CONTEXT used in your answer.

        <context>          
        {prompt_context}
        </context>
        <question>  
        {myquestion}
        </question>
        Answer: 
        """
    json_data = json.loads(prompt_context)
    relative_paths = set(item['relative_path'] for item in json_data['results'])
    return prompt, relative_paths

def vector_query(myquestion):
  
    prompt, relative_paths = create_prompt(myquestion)
    _, session = get_cortex_service()
    cmd = """
            select snowflake.cortex.complete(?, ?) as response
          """
    df_response = session.sql(cmd, params=["snowflake-arctic", prompt]).collect()
    res_text = df_response[0].RESPONSE
    return res_text

def test_snow_con():
    try:
        print("Testing Snowflake connection...")
        for k, v in CONNECTION_PARAMETERS.items():
            print(f"{k.capitalize()}: {v}")
        session = Session.builder.configs(CONNECTION_PARAMETERS).create()
        result = session.sql("SELECT CURRENT_VERSION()").collect()
        print(f"✅ Connection successful! Snowflake version: {result[0][0]}")
        session.close()
        return "Connection test passed"
    except Exception as e:
        error_msg = str(e)
        print(f"❌ Connection failed: {error_msg}")
        if "404 Not Found" in error_msg:
            print("\n🔧 Troubleshooting suggestions:")
            print("1. Check if account name is correct (should be like 'ABC12345' not 'ABC12345.snowflakecomputing.com')")
            print("2. Verify the account is in the correct region")
            print("3. Check if the account URL format is correct")
        return f"Connection test failed: {error_msg}"
