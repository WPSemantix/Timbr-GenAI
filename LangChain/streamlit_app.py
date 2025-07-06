import streamlit as st

from langchain_timbr import TimbrLlmConnector, LlmWrapper, LlmTypes

# Configuration - Replace these with your actual values
###
# Another option is to set these as environment variables as:
# export TIMBR_URL="<your_timbr_url>"
# export TIMBR_TOKEN="<your_timbr_token>"
###
TIMBR_URL = "<your_timbr_url>"
TIMBR_TOKEN = "<your_timbr_token>"

# Streamlit App Title
st.title('Timbr LLM Query Interface')

# LLM Selection
st.sidebar.title("LLM Configuration")
selected_llm = st.sidebar.selectbox("Select LLM", options=[e.name for e in LlmTypes])
api_key = st.sidebar.text_input("API Key", type="password")

if not api_key:
    st.sidebar.warning("Enter your API key to proceed.")
    st.stop()

# Initialize LLM Wrapper and Connector
llm_wrapper = LlmWrapper(
    llm_type=LlmTypes[selected_llm],
    api_key=api_key
)

llm_connector = TimbrLlmConnector(
    url=TIMBR_URL,
    token=TIMBR_TOKEN,
    llm=llm_wrapper
)

# Ontology Selection
###
# Another option is to set these as environment variables as:
# export ONTOLOGY="<your_ontology>"
# then you won't need to select the ontology in the UI and use set_ontology callback
###
ontologies = llm_connector.get_ontologies()
if not ontologies:
    st.warning("No ontologies found. Please check your Timbr configuration.")
    st.stop()

selected_ontology = st.selectbox("Select Ontology", options=ontologies)
if selected_ontology:
    llm_connector.set_ontology(selected_ontology)

# Query Input and Execution
st.write("### Enter your Query")
user_query = st.text_area("Type your question about the data:")

if st.button("Run Query"):
    if not user_query:
        st.error("Please enter a query to execute.")
    else:
        try:
            # Run the query
            response = llm_connector.run_llm_query(user_query)
            
            # Display Results
            st.write("### Query Results")
            st.json(response)
        except Exception as e:
            st.error(f"An error occurred: {e}")

