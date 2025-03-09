from langgraph.graph import StateGraph
from langchain_openai import ChatOpenAI  # or your preferred LLM
from langchain_timbr import GenerateTimbrSqlNode

llm = ChatOpenAI(model="gpt-4o", temperature=0, openai_api_key="open-ai-api-key")

state = StateGraph()
state.messages = [{"content": "What are the total sales for last month?"}]

generate_sql_node = GenerateTimbrSqlNode(
    llm=llm,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    schema="dtimbr",
    concept="Sales"
)

output = generate_sql_node(state)

sql = output["sql"]
schema = output["schema"]
concept = output["concept"]
