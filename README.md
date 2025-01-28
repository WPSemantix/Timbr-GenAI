![Timbr logo description](https://timbr.ai/wp-content/uploads/2023/06/timbr-ai-l-5-226x60-1.png) [![FOSSA Status](https://app.fossa.com/api/projects/custom%2B50508%2Fgithub.com%2FWPSemantix%2Ftimbr_python_http.svg?type=shield&issueType=license)](https://app.fossa.com/projects/custom%2B50508%2Fgithub.com%2FWPSemantix%2Ftimbr_python_http?ref=badge_shield&issueType=license) [![Python 3.9.13](https://img.shields.io/badge/python-3.9-blue.svg)](https://www.python.org/downloads/release/python-3913/)


# Timbr LangChain SDK

The **Timbr LangChain SDK** integrates natural language inputs with Timbr's ontology-driven semantic layer. Leveraging Timbr's robust ontology capabilities, the SDK integates with timbr data models and leverages semantic relationships and annotations, enabling users to query data in a business-friendly language.

It leverages Large Language Models (LLMs) to interpret user queries, generate Timbr SQL, and fetch query results from the database, enabling seamless interaction with any database connected to timbr.

The SDK translates user questions into Timbr SQL, automatically aligning with the ontology's structure. This ensures context-aware results that reflect the underlying semantic relationships.

## Requirements

To use this SDK, ensure you have the following:

- **Python Version**: Python 3.9.13
- **Required Dependencies**:
  ```bash
  langchain==0.3.13
  langchain_community==0.3.13
  pytimbr-api==1.0.4
  pydantic==2.10.4
  ```
- **Optional Dependencies (Depending on LLM)**:
  ```bash
  langchain-anthropic==0.3.1
  anthropic==0.42.0
  langchain-openai==0.2.14
  openai==1.58.1
  ```

## Installation

Contact your Timbr account manager for repository access.

To install the Timbr LLM Connector SDK run:

```bash
pip install <timbr_repo>:langchain-timbr
```


## Features

- **Multi-LLM Support**: Integrates with OpenAI GPT, Anthropic Claude, Google Gemini, Databricks DBRX/llama, Snowflake Cortex  and Timbr’s native LLM (Or any custom LLM using LangChain interface)
- **SQL Generation**: Generate semantic SQL queries (ontology enriched queries).
- **Knowledge Graph Access**: Interact with ontologies in natural language and retrieve context-aware answers.
- **Streamlined Querying**: Combine natural language inputs with timbr using simple methods like `run_llm_query`.

## LangChain interface

### Timbr SQL Agent 

Create timbr SQL agent that wraps the pipeline to identify the relevant concept and generate the SQL query over the ontology.

```python
from langchain_timbr import create_timbr_sql_agent

agent = create_timbr_sql_agent(
    llm=llm,
    url='https://your-timbr-app.com/',
    token='tk_XXXXXXXXXXXXXXXXXXXXXXXX',
    ontology='timbr_knowledge_graph',
)

result = agent.run("What are the total sales for last month?")

# Access the components of the result:
rows = result["rows"]
sql = result["sql"]
table = result["table"]
```

### Generate SQL Chain

Returns the suggested SQL based on the user question.

```python
from langchain_timbr import GenerateTimbrSqlChain

generate_timbr_llm_chain = GenerateTimbrSqlChain(
    llm=llm,
    url='https://your-timbr-app.com/',
    token='tk_XXXXXXXXXXXXXXXXXXXXXXXX',
    ontology='timbr_knowledge_graph',
)

result = generate_timbr_llm_chain.invoke({ "prompt": "What are the total sales for last month?" })

# Access the components of the result:
sql = result["sql"]
```

### Execute Query Chain

Calls the Generate SQL Chain and executes the query in timbr. Returns the query results.

```python
from langchain_timbr import ExecuteTimbrQueryChain

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
```

## Quick Start using timbr api

### 1. Initialize the LLM Wrapper

```python
from langchain_timbr import LlmWrapper, LlmTypes

llm_wrapper = LlmWrapper(
    llm_type=LlmTypes.OpenAI,
    api_key="<your_api_key>"
)
```

### 2. Connect to Timbr

```python
from langchain_timbr import TimbrLlmConnector

llm_connector = TimbrLlmConnector(
    url="<timbr_url>",
    token="<timbr_token>",
    llm=llm_wrapper
)
```

### 3. Work with Ontologies

```python
# Fetch available ontologies
ontologies = llm_connector.get_ontologies()
print("Available Ontologies:", ontologies)

# Set the ontology to use
llm_connector.set_ontology("your_ontology")
```

### 4. Generate SQL Queries and Fetch Results

```python
# Generate SQL for a user query
sql_query = llm_connector.generate_sql("What are the total sales by region?")
print("Generated SQL:", sql_query)

# Run the query and fetch results
data = llm_connector.run_timbr_query(sql_query)
print("Query Results:", data)
```

### 5. Full Workflow with Natural Language Query

```python
# Directly run a natural language query
data = llm_connector.run_llm_query("What are the total sales for last month?")
print("Results:", data)
```

## Examples

Explore the [examples/](examples/) directory for detailed use cases, including:

- **Streamlit Integration**: Build a user-friendly app to query Timbr interactively.
- **LangChain Chains**: Use `GenerateTimbrSqlChain` and `ExecuteTimbrQueryChain` for more granular control.
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

### `determine_table`

Use the LLM to determine the appropriate table for a query.

```python
table_name = llm_connector.determine_table("Show me sales by region.")
```

### `generate_sql`

Generate Timbr SQL for a user query.

```python
sql_query = llm_connector.generate_sql("What is the revenue by product category?", table_name="sales_data")
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

## Resources

- [Official Timbr Documentation](https://docs.timbr.ai)

   - [API Documentation](https://docs.timbr.ai/doc/docs/api/)

   - [SQL Reference Documentation](https://docs.timbr.ai/doc/docs/sql/)

- [Tutorials and videos](https://www.youtube.com/playlist?list=PLGgEl0X3EtLkzCVbQmxyVR1l5PM9tG3Uw)

- [Timbr Website](https://timbr.ai)



## Support

Please contact your Timbr account manager For questions or support.


