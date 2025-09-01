![Timbr logo description](https://timbr.ai/wp-content/uploads/2025/01/logotimbrai230125.png) [![FOSSA Status](https://app.fossa.com/api/projects/custom%2B50508%2Fgithub.com%2FWPSemantix%2Ftimbr_python_http.svg?type=shield&issueType=license)](https://app.fossa.com/projects/custom%2B50508%2Fgithub.com%2FWPSemantix%2Ftimbr_python_http?ref=badge_shield&issueType=license) [![Python 3.9.13](https://img.shields.io/badge/python-3.9-blue.svg)](https://www.python.org/downloads/release/python-3913/)

# Timbr LangChain SDK

The **Timbr LangChain SDK** integrates natural language inputs with Timbr's ontology-driven semantic layer. Leveraging Timbr's robust ontology capabilities, the SDK integrates with Timbr data models and leverages semantic relationships and annotations, enabling users to query data in business-friendly language.

It leverages Large Language Models (LLMs) to interpret user queries, generate Timbr SQL, and fetch query results from the database, enabling seamless interaction with any database connected to Timbr.

The SDK translates user questions into Timbr SQL, automatically aligning with the ontology's structure. This ensures context-aware results that reflect the underlying semantic relationships.

## Requirements

To use this SDK, ensure you have the following:

- **Python Version**: Python 3.9+
- **Required Dependencies**:
  ```bash
  langchain==0.3.25
  langchain_community==0.3.20
  langgraph==0.3.20
  pytimbr-api>=1.0.8
  pydantic==2.10.4
  ```
- **Optional Dependencies (Depending on LLM provider)**:
  ```bash
  langchain-anthropic==0.3.1
  anthropic==0.42.0
  langchain-openai==0.3.16
  openai==1.77.0
  ```

## Installation

### Using pip
```bash
python -m pip install langchain-timbr
```

## Install with selected LLM providers (One of: openai,anthropic,google,snowflake)
```bash
python -m pip install 'langchain-timbr[<your selected providers, separated by comma w/o space]'
```

## Features

- **Multi-LLM Support**: Integrates with OpenAI GPT, Anthropic Claude, Google Gemini, Databricks DBRX/llama, Snowflake Cortex, and Timbr's native LLM (or any custom LLM using the LangChain interface)
- **SQL Generation**: Generate semantic SQL queries (ontology-enriched queries).
- **Knowledge Graph Access**: Interact with ontologies in natural language and retrieve context-aware answers.
- **Streamlined Querying**: Combine natural language inputs with Timbr using simple methods like `run_llm_query`.

## Directory Structure and Key Files

This folder contains example code and utilities for working with the Timbr LangChain SDK. The main files are:

- `streamlit_app.py`: Interactive Streamlit web app for querying Timbr using natural language.
- `timbr_execute_query_chain.py`: Example of using the Execute Query Chain for end-to-end NL-to-SQL-to-results workflows.
- `timbr_generate_sql_chain.py`: Example of generating Timbr SQL from natural language queries.
- `timbr_qa_pipeline.py`: Example pipeline for question answering using Timbr and LangChain.
- `timbr_sql_agent.py`: Example of creating and using a Timbr SQL Agent with LangChain.

## Running the Streamlit App

You can launch the interactive Streamlit app to try out natural language queries against Timbr:

1. Make sure you have installed all required dependencies (see [Requirements](#requirements)).
2. In this directory, run the following command:

   ```powershell
   streamlit run streamlit_app.py
   ```

3. The app will open in your browser. Enter your Timbr credentials and try out queries!

## Quick Start using Timbr API

### 1. Initialize LLM instance

```python
# Using OpenAI provider:
from langchain_openai import ChatOpenAI
llm = ChatOpenAI(
    openai_api_key="<api_key>",
    model_name="gpt-4o", # or any other preferred model
)

# Using Anthropic provider:
from langchain_anthropic import ChatAnthropic
llm = Claude(
    anthropic_api_key="<api_key>",
    model="claude-sonnet-4-20250514", # or any other preferred model
)

# Or any other LLM provider as your wish as ChatGoogleGenerativeAI, ChatSnowflakeCortex, AzureChatOpenAI, etc.
```

### 2. Initialize timbr agent executor

```python
from langchain_timbr import create_timbr_sql_agent

agent_executor = create_timbr_sql_agent(
    llm=llm,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    schema="dtimbr",               # optional
    concept="Sales",               # optional
    concepts_list=["Sales","Orders","Customers"],  # optional
    views_list=["sales_view"],     # optional
    note="Focus on US region",     # optional
    generate_answer=False,         # optional
)
```

### 3. Invoke agent with user question & fetch results

```python
result = agent_executor.invoke("What are the total sales for last month?")

answer = result["answer"] # Relevant when generate_answer is True
rows = result["rows"]
sql = result["sql"]
schema = result["schema"]
concept = result["concept"]
user_metadata = result["user_metadata"] # Token usage metadata - estimated & from llm response
error = result.get("error", None)
```

## LangChain interface

### Timbr SQL Agent 

Create a Timbr SQL agent that wraps the pipeline to identify the relevant concept and generate the SQL query over the ontology.

**Parameters:**

| Parameter | Type / Default | Description |
|-----------|----------------|-------------|
| **llm** | LLM<br />**Required** | Language model instance (or a function taking a prompt string and returning an LLM's response). |
| **url** | str<br />**Required** | Timbr server URL. |
| **token** | str<br />**Required** | Timbr authentication token. |
| **ontology** | str<br />**Required** | Name of the ontology/knowledge graph. |
| **schema** | str<br />Default: None<br />**Optional** | Name of the schema to query. |
| **concept** | str<br />Default: None<br />**Optional** | Name of a specific concept to query. |
| **concepts_list** | List[str] or str<br />Default: None<br />**Optional** | Collection of concepts to include (List of strings, or a string of concept names divided by comma).<br />- If None, empty or '*', all available concepts are used.<br />- If populated, only those concepts will be included in query generation.<br />- If 'none' or 'null', no concepts will be used for the query. |
| **views_list** | List[str] or str<br />Default: None<br />**Optional** | Collection of views/cubes to include (List of strings, or a string of view/cube names divided by comma).<br />- If None, empty or '*', all available views/cubes are used.<br />- If populated, only those views/cubes will be included in query generation.<br />- If 'none' or 'null', no views/cubes will be used for the query. |
| **include_logic_concepts** | bool<br />Default: False<br />**Optional** | Whether to include logic concepts (concepts without unique properties which only inherit from an upper level concept with filter logic) in the query.<br />*Note: This parameter has no effect when `concepts_list` is provided.* |
| **include_tags** | List[str] or str<br />Default: None<br />**Optional** | Specific concept/property tag names to consider when generating the query.<br />- If `None` or empty, no tags are used.<br />- If a single string or list of strings is provided, only those tags (if they exist) will be attached to the prompt.<br />- Use List of strings or a comma-separated string (e.g. `'tag1,tag2'`) to specify multiple tags.<br />- Use `'*'` to include **all** tags. |
| **exclude_properties** | List[str] or str<br />Default: None<br />**Optional** | Collection of properties to exclude from the query (List of strings, or a string of property names divided by comma. entity_id, entity_type & entity_label are excluded by default). |
| **should_validate_sql** | bool<br />Default: True<br />**Optional** | Whether to validate the SQL before executing it. |
| **retries** | int<br />Default: 2<br />**Optional** | Number of retry attempts if the generated SQL is invalid. |
| **max_limit** | int<br />Default: 100<br />**Optional** | Maximum number of rows to return. |
| **retry_if_no_results** | bool<br />Default: False<br />**Optional** | Whether to infer the result value from the SQL query. If the query won't return any rows, it will try to re-generate the SQL query then re-run it. |
| **no_results_max_retries** | int<br />Default: 2<br />**Optional** | Number of retry attempts to infer the result value from the SQL query. |
| **generate_answer** | bool<br />Default: False<br />**Optional** | Whether to generate a natural language answer from the query results. |
| **note** | str<br />Default: None<br />**Optional** | Additional note to extend the LLM prompt. |
| **db_is_case_sensitive** | bool<br />Default: False<br />**Optional** | Whether the database is case sensitive. |
| **graph_depth** | int<br />Default: 1<br />**Optional** | Maximum number of relationship hops to traverse from the source concept during schema exploration. |
| **verify_ssl** | bool<br />Default: True<br />**Optional** | Whether to verify SSL certificates. |
| **is_jwt** | bool<br />Default: False<br />**Optional** | Whether to use JWT authentication. |
| **jwt_tenant_id** | str<br />Default: None<br />**Optional** | Tenant ID for JWT authentication (if applicable). |
| **conn_params** | dict<br />Default: None<br />**Optional** | Extra Timbr connection parameters sent with every request (e.g., 'x-api-impersonate-user'). |

#### Create agent and use with AgentExecutor
```python
from langchain_timbr import TimbrSqlAgent

agent = TimbrSqlAgent(
    llm=<llm>,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    schema="dtimbr",               # optional
    concept="Sales",               # optional
    concepts_list=["Sales","Orders","Customers"],  # optional
    views_list=["sales_view"],     # optional
    note="Focus on US region",     # optional
    retries=2,                     # optional
    should_validate_sql=True       # optional
)

agent_executor = AgentExecutor.from_agent_and_tools(
    agent=agent,
    tools=[],
    verbose=True
)
result = agent_executor.invoke("What are the total sales for last month?")

rows = result["rows"]
sql = result["sql"]
concept = result["concept"]
schema = result["schema"]
error = result.get("error", None)

usage_metadata = result.get("usage_metadata", {})
determine_concept_usage = usage_metadata.get('determine_concept', {})
generate_sql_usage = usage_metadata.get('generate_sql', {})
# Each usage_metadata item contains:
# * 'approximate': Estimated token count calculated before invoking the LLM
# * 'input_tokens'/'output_tokens'/'total_tokens'/etc.: Actual token usage metrics returned by the LLM
```

#### Use create_timbr_sql_agent to get AgentExecutor instance and invoke directly
```python
from langchain_timbr import create_timbr_sql_agent

agent_executor = create_timbr_sql_agent(
    llm=<llm>,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    schema="dtimbr",               # optional
    concept="Sales",               # optional
    concepts_list=["Sales","Orders","Customers"],  # optional
    views_list=["sales_view"],     # optional
    note="Focus on US region",     # optional
)

result = agent_executor.invoke("What are the total sales for last month?")

rows = result["rows"]
sql = result["sql"]
concept = result["concept"]
schema = result["schema"]
error = result.get("error", None)
```

### Identify Concept Chain

Returns the suggested concept to query based on the user question.

**Parameters:**

| Parameter | Type / Default | Description |
|-----------|----------------|-------------|
| **llm** | LLM<br />**Required** | Language model instance (or a function taking a prompt string and returning an LLM's response). |
| **url** | str<br />**Required** | Timbr server URL. |
| **token** | str<br />**Required** | Timbr authentication token. |
| **ontology** | str<br />**Required** | Name of the ontology/knowledge graph. |
| **concepts_list** | List[str] or str<br />Default: None<br />**Optional** | Collection of concepts to include (List of strings, or a string of concept names divided by comma).<br />- If None, empty or '*', all available concepts are used.<br />- If populated, only those concepts will be included in query generation.<br />- If 'none' or 'null', no concepts will be used for the query. |
| **views_list** | List[str] or str<br />Default: None<br />**Optional** | Collection of views/cubes to include (List of strings, or a string of view/cube names divided by comma).<br />- If None, empty or '*', all available views/cubes are used.<br />- If populated, only those views/cubes will be included in query generation.<br />- If 'none' or 'null', no views/cubes will be used for the query. |
| **include_logic_concepts** | bool<br />Default: False<br />**Optional** | Whether to include logic concepts (concepts without unique properties which only inherit from an upper level concept with filter logic) in the query.<br />*Note: This parameter has no effect when `concepts_list` is provided.* |
| **include_tags** | List[str] or str<br />Default: None<br />**Optional** | Specific concept/property tag names to consider when generating the query.<br />- If `None` or empty, no tags are used.<br />- If a single string or list of strings is provided, only those tags (if they exist) will be attached to the prompt.<br />- Use List of strings or a comma-separated string (e.g. `'tag1,tag2'`) to specify multiple tags.<br />- Use `'*'` to include **all** tags. |
| **should_validate_sql** | bool<br />Default: True<br />**Optional** | Whether to validate the identified concept before returning it. |
| **retries** | int<br />Default: 2<br />**Optional** | Number of retry attempts if the identified concept is invalid. |
| **note** | str<br />Default: None<br />**Optional** | Additional note to extend the LLM prompt. |
| **verify_ssl** | bool<br />Default: True<br />**Optional** | Whether to verify SSL certificates. |
| **is_jwt** | bool<br />Default: False<br />**Optional** | Whether to use JWT authentication. |
| **jwt_tenant_id** | str<br />Default: None<br />**Optional** | Tenant ID for JWT authentication (if applicable). |
| **conn_params** | dict<br />Default: None<br />**Optional** | Extra Timbr connection parameters sent with every request (e.g., 'x-api-impersonate-user'). |

```python
from langchain_timbr import IdentifyTimbrConceptChain

identify_timbr_concept_chain = IdentifyTimbrConceptChain(
    llm=<llm>,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    concepts_list=["Sales","Orders"],  # optional
    views_list=["sales_view"],         # optional
    note="Focus on last month's data"  # optional
)

result = identify_timbr_concept_chain.invoke({ "prompt": "What are the total sales for last month?" })
concept = result["concept"]
schema = result["schema"]

usage_metadata = result.get("identify_concept_usage_metadata", {})
determine_concept_usage = usage_metadata.get('determine_concept', {})
# Each usage_metadata item contains:
# * 'approximate': Estimated token count calculated before invoking the LLM
# * 'input_tokens'/'output_tokens'/'total_tokens'/etc.: Actual token usage metrics returned by the LLM
```

### Generate SQL Chain

Returns the suggested SQL based on the user question.

**Parameters:**

| Parameter | Type / Default | Description |
|-----------|----------------|-------------|
| **llm** | LLM<br />**Required** | Language model instance (or a function taking a prompt string and returning an LLM's response). |
| **url** | str<br />**Required** | Timbr server URL. |
| **token** | str<br />**Required** | Timbr authentication token. |
| **ontology** | str<br />**Required** | Name of the ontology/knowledge graph. |
| **schema** | str<br />Default: None<br />**Optional** | Name of the schema to query. |
| **concept** | str<br />Default: None<br />**Optional** | Name of a specific concept to query. |
| **concepts_list** | List[str] or str<br />Default: None<br />**Optional** | Collection of concepts to include (List of strings, or a string of concept names divided by comma).<br />- If None, empty or '*', all available concepts are used.<br />- If populated, only those concepts will be included in query generation.<br />- If 'none' or 'null', no concepts will be used for the query. |
| **views_list** | List[str] or str<br />Default: None<br />**Optional** | Collection of views/cubes to include (List of strings, or a string of view/cube names divided by comma).<br />- If None, empty or '*', all available views/cubes are used.<br />- If populated, only those views/cubes will be included in query generation.<br />- If 'none' or 'null', no views/cubes will be used for the query. |
| **include_logic_concepts** | bool<br />Default: False<br />**Optional** | Whether to include logic concepts (concepts without unique properties which only inherit from an upper level concept with filter logic) in the query.<br />*Note: This parameter has no effect when `concepts_list` is provided.* |
| **include_tags** | List[str] or str<br />Default: None<br />**Optional** | Specific concept/property tag names to consider when generating the query.<br />- If `None` or empty, no tags are used.<br />- If a single string or list of strings is provided, only those tags (if they exist) will be attached to the prompt.<br />- Use List of strings or a comma-separated string (e.g. `'tag1,tag2'`) to specify multiple tags.<br />- Use `'*'` to include **all** tags. |
| **exclude_properties** | List[str] or str<br />Default: None<br />**Optional** | Collection of properties to exclude from the query (List of strings, or a string of property names divided by comma. entity_id, entity_type & entity_label are excluded by default). |
| **should_validate_sql** | bool<br />Default: True<br />**Optional** | Whether to validate the SQL before executing it. |
| **retries** | int<br />Default: 2<br />**Optional** | Number of retry attempts if the generated SQL is invalid. |
| **max_limit** | int<br />Default: 100<br />**Optional** | Maximum number of rows to return. |
| **note** | str<br />Default: None<br />**Optional** | Additional note to extend the LLM prompt. |
| **db_is_case_sensitive** | bool<br />Default: False<br />**Optional** | Whether the database is case sensitive. |
| **graph_depth** | int<br />Default: 1<br />**Optional** | Maximum number of relationship hops to traverse from the source concept during schema exploration. |
| **verify_ssl** | bool<br />Default: True<br />**Optional** | Whether to verify SSL certificates. |
| **is_jwt** | bool<br />Default: False<br />**Optional** | Whether to use JWT authentication. |
| **jwt_tenant_id** | str<br />Default: None<br />**Optional** | Tenant ID for JWT authentication (if applicable). |
| **conn_params** | dict<br />Default: None<br />**Optional** | Extra Timbr connection parameters sent with every request (e.g., 'x-api-impersonate-user'). |

```python
from langchain_timbr import GenerateTimbrSqlChain

generate_timbr_sql_chain = GenerateTimbrSqlChain(
    llm=<llm>,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    schema="dtimbr",      # optional
    concept="Sales",      # optional
    concepts_list=["Sales","Orders"],  # optional
    views_list=["sales_view"],         # optional
    note="We only need sums"           # optional
)

result = generate_timbr_sql_chain.invoke({ "prompt": "What are the total sales for last month?" })
sql = result["sql"]
concept = result["concept"]
schema = result["schema"]

usage_metadata = result.get("generate_sql_usage_metadata", {})
determine_concept_usage = usage_metadata.get('determine_concept', {})
generate_sql_usage = usage_metadata.get('generate_sql', {})
# Each usage_metadata item contains:
# * 'approximate': Estimated token count calculated before invoking the LLM
# * 'input_tokens'/'output_tokens'/'total_tokens'/etc.: Actual token usage metrics returned by the LLM
```

### Validate SQL Chain

Validates the timbr SQL and re-generate a new one if necessary based on the user question.

**Parameters:**

| Parameter | Type / Default | Description |
|-----------|----------------|-------------|
| **llm** | LLM<br />**Required** | Language model instance (or a function taking a prompt string and returning an LLM's response). |
| **url** | str<br />**Required** | Timbr server URL. |
| **token** | str<br />**Required** | Timbr authentication token. |
| **ontology** | str<br />**Required** | Name of the ontology/knowledge graph. |
| **schema** | str<br />Default: None<br />**Optional** | Name of the schema to query. |
| **concept** | str<br />Default: None<br />**Optional** | Name of a specific concept to query. |
| **retries** | int<br />Default: 2<br />**Optional** | Number of retry attempts if the generated SQL is invalid. |
| **concepts_list** | List[str] or str<br />Default: None<br />**Optional** | Collection of concepts to include (List of strings, or a string of concept names divided by comma).<br />- If None, empty or '*', all available concepts are used.<br />- If populated, only those concepts will be included in query generation.<br />- If 'none' or 'null', no concepts will be used for the query. |
| **views_list** | List[str] or str<br />Default: None<br />**Optional** | Collection of views/cubes to include (List of strings, or a string of view/cube names divided by comma).<br />- If None, empty or '*', all available views/cubes are used.<br />- If populated, only those views/cubes will be included in query generation.<br />- If 'none' or 'null', no views/cubes will be used for the query. |
| **include_logic_concepts** | bool<br />Default: False<br />**Optional** | Whether to include logic concepts (concepts without unique properties which only inherit from an upper level concept with filter logic) in the query.<br />*Note: This parameter has no effect when `concepts_list` is provided.* |
| **include_tags** | List[str] or str<br />Default: None<br />**Optional** | Specific concept/property tag names to consider when generating the query.<br />- If `None` or empty, no tags are used.<br />- If a single string or list of strings is provided, only those tags (if they exist) will be attached to the prompt.<br />- Use List of strings or a comma-separated string (e.g. `'tag1,tag2'`) to specify multiple tags.<br />- Use `'*'` to include **all** tags. |
| **exclude_properties** | List[str] or str<br />Default: None<br />**Optional** | Collection of properties to exclude from the query (List of strings, or a string of property names divided by comma. entity_id, entity_type & entity_label are excluded by default). |
| **max_limit** | int<br />Default: 100<br />**Optional** | Maximum number of rows to return. |
| **note** | str<br />Default: None<br />**Optional** | Additional note to extend the LLM prompt. |
| **db_is_case_sensitive** | bool<br />Default: False<br />**Optional** | Whether the database is case sensitive. |
| **graph_depth** | int<br />Default: 1<br />**Optional** | Maximum number of relationship hops to traverse from the source concept during schema exploration. |
| **verify_ssl** | bool<br />Default: True<br />**Optional** | Whether to verify SSL certificates. |
| **is_jwt** | bool<br />Default: False<br />**Optional** | Whether to use JWT authentication. |
| **jwt_tenant_id** | str<br />Default: None<br />**Optional** | Tenant ID for JWT authentication (if applicable). |
| **conn_params** | dict<br />Default: None<br />**Optional** | Extra Timbr connection parameters sent with every request (e.g., 'x-api-impersonate-user'). |

```python
from langchain_timbr import ValidateTimbrSqlChain

validate_timbr_sql_chain = ValidateTimbrSqlChain(
    llm=<llm>,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    schema="dtimbr",               # optional
    concept="Sales",               # optional
    concepts_list=["Sales","Orders"],  # optional
    views_list=["sales_view"],         # optional
    note="We only need sums",     # optional
    retries=3
)

result = validate_timbr_sql_chain.invoke({
    "prompt": "What are the total sales for last month?",
    "sql": "SELECT SUM(amount) FROM sales WHERE date > current_date - INTERVAL '1 month'"
})

validated_sql = result["sql"]
is_sql_valid = result["is_sql_valid"]
error = result["error"]
concept = result["concept"]
schema = result["schema"]

usage_metadata = result.get("validate_sql_usage_metadata", {})
determine_concept_usage = usage_metadata.get('determine_concept', {})
generate_sql_usage = usage_metadata.get('generate_sql', {})
# Each usage_metadata item contains:
# * 'approximate': Estimated token count calculated before invoking the LLM
# * 'input_tokens'/'output_tokens'/'total_tokens'/etc.: Actual token usage metrics returned by the LLM
```

### Execute Query Chain

Calls the Generate SQL Chain and executes the query in timbr. Returns the query results.

**Parameters:**

| Parameter | Type / Default | Description |
|-----------|----------------|-------------|
| **llm** | LLM<br />**Required** | Language model instance (or a function taking a prompt string and returning an LLM's response). |
| **url** | str<br />**Required** | Timbr server URL. |
| **token** | str<br />**Required** | Timbr authentication token. |
| **ontology** | str<br />**Required** | Name of the ontology/knowledge graph. |
| **schema** | str<br />Default: None<br />**Optional** | Name of the schema to query. |
| **concept** | str<br />Default: None<br />**Optional** | Name of a specific concept to query. |
| **concepts_list** | List[str] or str<br />Default: None<br />**Optional** | Collection of concepts to include (List of strings, or a string of concept names divided by comma).<br />- If None, empty or '*', all available concepts are used.<br />- If populated, only those concepts will be included in query generation.<br />- If 'none' or 'null', no concepts will be used for the query. |
| **views_list** | List[str] or str<br />Default: None<br />**Optional** | Collection of views/cubes to include (List of strings, or a string of view/cube names divided by comma).<br />- If None, empty or '*', all available views/cubes are used.<br />- If populated, only those views/cubes will be included in query generation.<br />- If 'none' or 'null', no views/cubes will be used for the query. |
| **include_logic_concepts** | bool<br />Default: False<br />**Optional** | Whether to include logic concepts (concepts without unique properties which only inherit from an upper level concept with filter logic) in the query.<br />*Note: This parameter has no effect when `concepts_list` is provided.* |
| **include_tags** | List[str] or str<br />Default: None<br />**Optional** | Specific concept/property tag names to consider when generating the query.<br />- If `None` or empty, no tags are used.<br />- If a single string or list of strings is provided, only those tags (if they exist) will be attached to the prompt.<br />- Use List of strings or a comma-separated string (e.g. `'tag1,tag2'`) to specify multiple tags.<br />- Use `'*'` to include **all** tags. |
| **exclude_properties** | List[str] or str<br />Default: None<br />**Optional** | Collection of properties to exclude from the query (List of strings, or a string of property names divided by comma. entity_id, entity_type & entity_label are excluded by default). |
| **should_validate_sql** | bool<br />Default: True<br />**Optional** | Whether to validate the SQL before executing it. |
| **retries** | int<br />Default: 2<br />**Optional** | Number of retry attempts if the generated SQL is invalid. |
| **max_limit** | int<br />Default: 100<br />**Optional** | Maximum number of rows to return. |
| **retry_if_no_results** | bool<br />Default: False<br />**Optional** | Whether to infer the result value from the SQL query. If the query won't return any rows, it will try to re-generate the SQL query then re-run it. |
| **no_results_max_retries** | int<br />Default: 2<br />**Optional** | Number of retry attempts to infer the result value from the SQL query. |
| **note** | str<br />Default: None<br />**Optional** | Additional note to extend the LLM prompt. |
| **db_is_case_sensitive** | bool<br />Default: False<br />**Optional** | Whether the database is case sensitive. |
| **graph_depth** | int<br />Default: 1<br />**Optional** | Maximum number of relationship hops to traverse from the source concept during schema exploration. |
| **verify_ssl** | bool<br />Default: True<br />**Optional** | Whether to verify SSL certificates. |
| **is_jwt** | bool<br />Default: False<br />**Optional** | Whether to use JWT authentication. |
| **jwt_tenant_id** | str<br />Default: None<br />**Optional** | Tenant ID for JWT authentication (if applicable). |
| **conn_params** | dict<br />Default: None<br />**Optional** | Extra Timbr connection parameters sent with every request (e.g., 'x-api-impersonate-user'). |

```python
from langchain_timbr import ExecuteTimbrQueryChain

execute_timbr_query_chain = ExecuteTimbrQueryChain(
    llm=<llm>,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    schema="dtimbr",              # optional
    concept="Sales",              # optional
    concepts_list=["Sales","Orders"],  # optional
    views_list=["sales_view"],         # optional
    note="We only need sums",     # optional
    retries=3,                    # optional
    should_validate_sql=True      # optional
)

result = execute_timbr_query_chain.invoke({ "prompt": "What are the total sales for last month?" })
rows = result["rows"]
sql = result["sql"]
concept = result["concept"]
schema = result["schema"]
error = result.get("error", None)

usage_metadata = result.get("execute_timbr_usage_metadata", {})
determine_concept_usage = usage_metadata.get('determine_concept', {})
generate_sql_usage = usage_metadata.get('generate_sql', {})
# Each usage_metadata item contains:
# * 'approximate': Estimated token count calculated before invoking the LLM
# * 'input_tokens'/'output_tokens'/'total_tokens'/etc.: Actual token usage metrics returned by the LLM
```

### Generate Answer Chain

Generates answer based on the prompt and query results.

**Parameters:**

| Parameter | Type / Default | Description |
|-----------|----------------|-------------|
| **llm** | LLM<br />**Required** | Language model instance (or a function taking a prompt string and returning an LLM's response). |
| **url** | str<br />**Required** | Timbr server URL. |
| **token** | str<br />**Required** | Timbr authentication token. |
| **verify_ssl** | bool<br />Default: True<br />**Optional** | Whether to verify SSL certificates. |
| **is_jwt** | bool<br />Default: False<br />**Optional** | Whether to use JWT authentication. |
| **jwt_tenant_id** | str<br />Default: None<br />**Optional** | Tenant ID for JWT authentication (if applicable). |
| **conn_params** | dict<br />Default: None<br />**Optional** | Extra Timbr connection parameters sent with every request (e.g., 'x-api-impersonate-user'). |

```python
from langchain_timbr import GenerateAnswerChain

generate_answer_chain = GenerateAnswerChain(
    llm=<llm>,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
)

answer_result = generate_answer_chain.invoke({
    "prompt": "What are the total sales for last month?",
    "rows": [{"total_sales": 1250000}],
    "sql": "SELECT COUNT(1) AS `total_sales` FROM `dtimbr`.`order`",
})

answer = answer_result["answer"]

usage_metadata = result.get("generate_answer_usage_metadata", {})
answer_question_usage = usage_metadata.get('answer_question', {})
# Each usage_metadata item contains:
# * 'approximate': Estimated token count calculated before invoking the LLM
# * 'input_tokens'/'output_tokens'/'total_tokens'/etc.: Actual token usage metrics returned by the LLM
```

## Examples

- **LangChain Chains**: Use `GenerateTimbrSqlChain`, `ExecuteTimbrQueryChain` & more, for more granular control.
- **Custom Agents**: Create custom agents with LangChain’s `AgentExecutor` to handle complex workflows.

## Timbr Methods Overview

### `get_ontologies`

Fetch a list of available knowledge graphs in the Timbr environment.

```python
ontologies_list = llm_connector.get_ontologies()
```

### `set_ontology`

Set or switch the ontology for subsequent operations.

```python
llm_connector.set_ontology("<ontology_name>")
```

### `determine_concept`

Use the LLM to determine the appropriate concept and schema for a query.

```python
concept_name, schema_name = llm_connector.determine_concept("Show me sales by region.")
```

### `generate_sql`

Generate Timbr SQL for a user query.

```python
sql_query = llm_connector.generate_sql("What is the revenue by product category?", concept_name="sales_data")
```

### `validate_sql`

Validates Timbr SQL.

```python
is_sql_valid, error = llm_connector.validate_sql("What is the revenue by product category?", sql_query="SELECT SUM(revenue) FROM sales GROUP BY product_category")
```

### `run_timbr_query`

Run a Timbr SQL query and fetch results.

```python
results = llm_connector.run_timbr_query("SELECT * FROM sales_data")
```

### `run_llm_query`

Combine SQL generation and execution in a single step.

```python
response = llm_connector.run_llm_query("What are the top 5 products by sales?")
```

## Support

- 📧 [Email](mailto:support@timbr.ai)
- 📖 [Timbr Documentation](https://docs.timbr.ai)
- 📽️ [Tutorials and videos](https://www.youtube.com/playlist?list=PLGgEl0X3EtLkzCVbQmxyVR1l5PM9tG3Uw)
- 🌐 [Timbr Website](https://timbr.ai)
