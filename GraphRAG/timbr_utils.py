import os
from openai import OpenAI
from dotenv import load_dotenv
from langchain_openai import ChatOpenAI

from langchain.chains import SequentialChain
from langchain_timbr import ExecuteTimbrQueryChain, GenerateAnswerChain


# Import Snowflake utilities
import snow_utils

# Load environment variables
load_dotenv()


# Get API key with a fallback for testing
openai_api_key = os.getenv("OPENAI_API_KEY")
if not openai_api_key:
    print("Warning: OPENAI_API_KEY environment variable not found.")

# Initialize OpenAI client
client = OpenAI(api_key=openai_api_key)

GRAPH_KEYWORDS = {
    "order", "truck", "location", "franchise", "menu", "loyalty", "customer", "sales",
    "amount", "price", "score", "rating", "stars", "id"
}

VECTOR_KEYWORDS = {
    "mention", "include", "talk about", "describe", "discuss", "contains", "reference"
}

def classify_question(myquestion: str) -> str:
    system_prompt = """
    You are a classifier for a GraphRAG assistant. Your task is to label user questions as:
    - "graph" if the question queries structured data (e.g., orders, trucks, customers, menu items, scores, locations).
    - "vector" if the question queries semantic similarity over review text content (e.g., what reviews mention X, describe Y, or include text about Z).
    - "unrelated" if the question is not about the Tasty Bytes dataset or food truck data at all.

    Label each question with one of: graph, vector, unrelated.

    Examples:
    Q: "which food truck had the most orders done during the last month" → graph
    Q: "list all customers who ordered more than 3 times" → graph
    Q: "share 3 reviews that received a score rating of 5" → graph
    Q: "what locations had the highest number of reviews with 5 stars?" → graph
    Q: "what reviews describe slow service?" → vector
    Q: "reviews that mention beverages or drinks" → vector
    Q: "which reviews talk about burgers?" → vector
    Q: "find reviews that reference dessert" → vector
    Q: "what reviews include negative comments about staff?" → vector
    Q: "what time is sunset in New York?" → unrelated
    Q: "what's the capital of Germany?" → unrelated
    Q: "how many people live in Paris?" → unrelated
    """

    response = client.chat.completions.create(
        model="gpt-4o",
        messages=[
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": f"Q: \"{myquestion}\"\nA:"}
        ],
        temperature=0,
        max_tokens=8000
    )

    label = response.choices[0].message.content.strip().lower()
    return label if label in {"graph", "vector", "unrelated"} else "unknown"

def router_pipeline(myquestion: str) -> str:
    # This function will route the question to the appropriate service
    # and return the answer
    category = classify_question(myquestion)

    if category == "graph":
        answer, sql_query = graph_query(myquestion)
        return f"{answer}\n\n**Executed SQL Query:**\n```sql\n{sql_query}\n```"
    elif category == "vector":
        return snow_utils.vector_query(myquestion)
    else:
        return "Unknown category. Unable to route the question."

def get_answer(myquestion: str) -> str:
   
    answer = router_pipeline(myquestion)
    return answer
    

def graph_query(myquestion: str, context: str = None) -> tuple:
    timbr_url = os.getenv("TIMBR_URL")
    timbr_token = os.getenv("TIMBR_TOKEN")
    timbr_ontology = os.getenv("TIMBR_ONTOLOGY")

    if not timbr_url or not timbr_token or not timbr_ontology:
        raise ValueError("TIMBR_URL, TIMBR_TOKEN, and TIMBR_ONTOLOGY environment variables must be set.")
    
    # N2SQL using timbr LLM - chain
    # invoke timbr
    llm = ChatOpenAI(
            model="gpt-4o", 
            temperature=0, 
            openai_api_key=openai_api_key
            )
    
    execute_timbr_query_chain = ExecuteTimbrQueryChain(
                        llm=llm,
                        url=timbr_url,
                        token=timbr_token,
                        ontology=timbr_ontology,
                        should_validate_sql=True,
                        note="Please use snowflake sql functions"
    )

    generate_answer_chain = GenerateAnswerChain(llm=llm)

    pipeline = SequentialChain(
                    chains=[execute_timbr_query_chain, generate_answer_chain],
                    input_variables=["prompt"],
                    output_variables=["answer", "sql", "rows"]
    )

    result = pipeline.invoke({"prompt": myquestion})

    # Return both the answer and the SQL query
    return result["answer"], result["sql"]
