from langgraph.graph import StateGraph
from langchain_openai import ChatOpenAI  # or your preferred LLM
from langchain_timbr import IdentifyConceptNode

# Initialize the LLM instance
llm = ChatOpenAI(model="gpt-4o", temperature=0, openai_api_key="open-ai-api-key")

state = StateGraph()
state.messages = [{"content": "What are the total sales for last month?"}]

# Initialize the Identify Concept Node
identify_node = IdentifyConceptNode(
    llm=llm,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    concepts_list=["Sales", "Orders"],
    views_list=["sales_view"]
)

output = identify_node(state)
schema = output["schema"]
concept = output["concept"]
