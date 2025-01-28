from langchain_timbr import ExecuteTimbrQueryChain
from langchain_openai import ChatOpenAI

# Set the LLM wrapper with the API key
# You can use the langchain ChatOpenAI/ChatAnthropic from langchain
# or any other LLM model based on langchain_core.language_models.chat.BaseChatModel 
llm = ChatOpenAI(model="gpt-4o", temperature=0, openai_api_key='open-ai-api-key')

execute_timbr_query_chain = ExecuteTimbrQueryChain(
    llm=llm,
    url='https://your-timbr-app.com/',
    token='tk_XXXXXXXXXXXXXXXXXXXXXXXX',
    ontology='timbr_knowledge_graph',
)

result = execute_timbr_query_chain.invoke({ "prompt": "What are the total sales for last month?" })

# Access the components of the result:
rows = result["rows"]
sql = result["sql"]
table = result["table"]