from langgraph.graph import StateGraph
from langchain_openai import ChatOpenAI  # or your preferred LLM
from langchain_timbr import ValidateSemanticSqlNode

llm = ChatOpenAI(model="gpt-4o", temperature=0, openai_api_key="open-ai-api-key")

state = StateGraph()
state.sql = "SELECT SUM(amount) FROM sales WHERE date > current_date - INTERVAL '1 month'"
state.prompt = "What are the total sales for last month?"

validate_sql_node = ValidateSemanticSqlNode(
    llm=llm,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    schema="dtimbr",
    concept="Sales",
    retries=3
)

output = validate_sql_node(state)
sql = output["sql"]
error = output["error"]
is_sql_valid = output["is_sql_valid"]
