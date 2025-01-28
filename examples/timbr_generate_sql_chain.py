from langchain_timbr import GenerateTimbrSqlChain
from langchain_openai import ChatOpenAI

# Set the LLM wrapper with the API key
# You can use the langchain ChatOpenAI/ChatAnthropic from langchain
# or any other LLM model based on langchain_core.language_models.chat.BaseChatModel 
llm = ChatOpenAI(model="gpt-4o", temperature=0, openai_api_key='open-ai-api-key')

generate_timbr_llm_chain = GenerateTimbrSqlChain(
    llm=llm,
    url='https://your-timbr-app.com/',
    token='tk_XXXXXXXXXXXXXXXXXXXXXXXX',
    ontology='timbr_knowledge_graph',
)

result = generate_timbr_llm_chain.invoke({ "prompt": "What are the total sales for last month?" })

# Access the components of the result:
sql = result["sql"]
table = result["table"]
