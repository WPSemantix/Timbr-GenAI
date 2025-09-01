from langchain.chains import SequentialChain
from langchain_timbr import ExecuteTimbrQueryChain, GenerateAnswerChain
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

generate_answer_chain = GenerateAnswerChain(
    llm=llm,
    url='https://your-timbr-app.com/',
    token='tk_XXXXXXXXXXXXXXXXXXXXXXXX',
)

pipeline = SequentialChain(
    chains=[execute_timbr_query_chain, generate_answer_chain],
    input_variables=["prompt"],
    output_variables=["answer", "sql"]
)

result = pipeline.invoke({ "prompt": "What are the total sales for last month?" })

print("Answer:", result["answer"])