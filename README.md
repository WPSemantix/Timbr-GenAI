![Timbr logo description](https://timbr.ai/wp-content/uploads/2025/01/logotimbrai230125.png) [![FOSSA Status](https://app.fossa.com/api/projects/custom%2B50508%2Fgithub.com%2FWPSemantix%2Ftimbr_python_http.svg?type=shield&issueType=license)](https://app.fossa.com/projects/custom%2B50508%2Fgithub.com%2FWPSemantix%2Ftimbr_python_http?ref=badge_shield&issueType=license) [![Python 3.9.13](https://img.shields.io/badge/python-3.9-blue.svg)](https://www.python.org/downloads/release/python-3913/)


# Timbr LangChain SDK

The `Timbr LangChain SDK` integrates natural language inputs with Timbr's ontology-driven semantic layer. Leveraging Timbr's robust ontology capabilities, the SDK integates with timbr data models and leverages semantic relationships and annotations, enabling users to query data in a business-friendly language.

It leverages Large Language Models (LLMs) to interpret user queries, generate Timbr SQL, and fetch query results from the database, enabling seamless interaction with any database connected to timbr.

The SDK translates user questions into Timbr SQL, automatically aligning with the ontology's structure. This ensures context-aware results that reflect the underlying semantic relationships.

## Requirements

To use this SDK, ensure you have the following:

- **Python Version**: Python 3.9.13
- **Required Dependencies**:
  ```bash
  langchain==0.3.13
  langchain_community==0.3.13
  langgraph==0.2.70
  pytimbr-api==1.0.5
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

To install the Timbr LLM Connector SDK:

```bash
pip install <timbr_repo>:langchain-timbr
```

Contact your Timbr account manager for repository access.

## Features

- **Multi-LLM Support**: Integrates with OpenAI GPT, Anthropic Claude, Google Gemini, Databricks DBRX/llama, Snowflake Cortex  and Timbr’s native LLM (Or any custom LLM using LangChain interface)
- **SQL Generation**: Generate semantic SQL queries (ontology enriched queries).
- **Knowledge Graph Access**: Interact with ontologies in natural language and retrieve context-aware answers.
- **Streamlined Querying**: Combine natural language inputs with timbr using simple methods like `run_llm_query`.

![Timbr LangGraph Flow](/examples/timbr-langgraph.png)

## LangChain interface

### Timbr SQL Agent 

Create timbr SQL agent that wraps the pipeline to identify the relevant concept and generate the SQL query over the ontology.

**Parameters:**
- **llm**: Language model instance (or a function taking a prompt string and returning an LLM’s response).
- **url**: Timbr server URL.
- **token**: Timbr authentication token.
- **ontology**: Name of the ontology/knowledge graph.
- **schema**: *(Optional)* Name of the schema to query.
- **concept**: *(Optional)* Name of a specific concept to query.
- **concepts_list**: *(Optional)* List of concept options to query.
- **views_list**: *(Optional)* List of view options to query.
- **note**: *(Optional)* Additional note to extend the LLM prompt.
- **retries**: Number of retry attempts if the generated SQL is invalid.
- **should_validate_sql**: Whether to validate the SQL before executing it.

```python
from langchain_timbr import TimbrSqlAgent

agent = TimbrSqlAgent(
    llm=<llm>,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    schema="public",               # optional
    concept="Sales",               # optional
    concepts_list=["Sales","Orders","Customers"],  # optional
    views_list=["sales_view"],     # optional
    note="Focus on US region",     # optional
    retries=2,                     # optional
    should_validate_sql=True       # optional
)

result = agent.run("What are the total sales for last month?")

rows = result["rows"]
sql = result["sql"]
concept = result["concept"]
schema = result["schema"]
error = result.get("error", None)
```

### Identify Concept Chain

Returns the suggested concept to query based on the user question.

**Parameters:**
- **llm**: Language model instance (or a function taking a prompt string and returning an LLM’s response).
- **url**: Timbr server URL.
- **token**: Timbr authentication token.
- **ontology**: Name of the ontology/knowledge graph.
- **concepts_list**: *(Optional)* List of concept options to query.
- **views_list**: *(Optional)* List of view options to query.
- **note**: *(Optional)* Additional note to extend the LLM prompt.

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

result = identify_timbr_concept_chain({ "prompt": "What are the total sales for last month?" })
concept = result["concept"]
schema = result["schema"]
```

### Generate SQL Chain

Returns the suggested SQL based on the user question.

**Parameters:**
- **llm**: Language model instance (or a function taking a prompt string and returning an LLM’s response).
- **url**: Timbr server URL.
- **token**: Timbr authentication token.
- **ontology**: Name of the ontology/knowledge graph.
- **schema**: *(Optional)* Name of the schema to query.
- **concept**: *(Optional)* Name of a specific concept to query.
- **concepts_list**: *(Optional)* List of concept options to query.
- **views_list**: *(Optional)* List of view options to query.
- **note**: *(Optional)* Additional note to extend the LLM prompt.

```python
from langchain_timbr import GenerateTimbrSqlChain

generate_timbr_sql_chain = GenerateTimbrSqlChain(
    llm=<llm>,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    schema="public",      # optional
    concept="Sales",      # optional
    concepts_list=["Sales","Orders"],  # optional
    views_list=["sales_view"],         # optional
    note="We only need sums"           # optional
)

result = generate_timbr_sql_chain({ "prompt": "What are the total sales for last month?" })
sql = result["sql"]
concept = result["concept"]
schema = result["schema"]
```

### Validate SQL Chain

Validates the timbr SQL and re-generate a new one if necessary based on the user question.

**Parameters:**
- **llm**: Language model instance (or a function taking a prompt string and returning an LLM’s response).
- **url**: Timbr server URL.
- **token**: Timbr authentication token.
- **ontology**: Name of the ontology/knowledge graph.
- **schema**: *(Optional)* Name of the schema to query.
- **concept**: *(Optional)* Name of a specific concept to query.
- **concepts_list**: *(Optional)* List of concept options to query.
- **views_list**: *(Optional)* List of view options to query.
- **note**: *(Optional)* Additional note to extend the LLM prompt.
- **retries**: Number of retry attempts if the generated SQL is invalid.

```python
from langchain_timbr import ValidateTimbrSqlChain

validate_timbr_sql_chain = ValidateTimbrSqlChain(
    llm=<llm>,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    schema="public",               # optional
    concept="Sales",               # optional
    concepts_list=["Sales","Orders"],  # optional
    views_list=["sales_view"],         # optional
    note="We only need sums",     # optional
    retries=3
)

result = validate_timbr_sql_chain({
    "prompt": "What are the total sales for last month?",
    "sql": "SELECT SUM(amount) FROM sales WHERE date > current_date - INTERVAL '1 month'"
})

validated_sql = result["sql"]
is_sql_valid = result["is_sql_valid"]
error = result["error"]
concept = result["concept"]
schema = result["schema"]
```

### Execute Query Chain

Calls the Generate SQL Chain and executes the query in timbr. Returns the query results.

**Parameters:**
- **llm**: Language model instance (or a function taking a prompt string and returning an LLM’s response).
- **url**: Timbr server URL.
- **token**: Timbr authentication token.
- **ontology**: Name of the ontology/knowledge graph.
- **schema**: *(Optional)* Name of the schema to query.
- **concept**: *(Optional)* Name of a specific concept to query.
- **concepts_list**: *(Optional)* List of concept options to query.
- **views_list**: *(Optional)* List of view options to query.
- **note**: *(Optional)* Additional note to extend the LLM prompt.
- **retries**: Number of retry attempts if the generated SQL is invalid.
- **should_validate_sql**: Whether to validate the SQL before executing it.

```python
from langchain_timbr import ExecuteTimbrQueryChain

execute_timbr_query_chain = ExecuteTimbrQueryChain(
    llm=<llm>,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    schema="public",              # optional
    concept="Sales",              # optional
    concepts_list=["Sales","Orders"],  # optional
    views_list=["sales_view"],         # optional
    note="We only need sums",     # optional
    retries=3,                    # optional
    should_validate_sql=True      # optional
)

result = execute_timbr_query_chain({ "prompt": "What are the total sales for last month?" })
rows = result["rows"]
sql = result["sql"]
concept = result["concept"]
schema = result["schema"]
error = result.get("error", None)
```

### Generate Answer Chain

Generates answet based on the prompt and query results.

**Parameters:**
from langchain_timbr import GenerateAnswerChain

generate_answer_chain = GenerateAnswerChain(llm=<llm>)

answer_result = generate_answer_chain({
    "prompt": "What are the total sales for last month?",
    "rows": [{"total_sales": 1250000}]
})

answer = answer_result["answer"]
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


## LangGraph interface

### Identify Concept Node

Wraps the **IdentifyTimbrConceptChain** functionality to identify the relevant concept (and schema) based on the latest message in the state.

**Usage Example:**
```python
from langgraph.graph import StateGraph
from langchain_timbr import IdentifyConceptNode

llm_instance = <your_llm_instance>
identify_node = IdentifyConceptNode(
    llm=llm_instance,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    concepts_list=["Sales", "Orders"],
    views_list=["sales_view"]
)

state = StateGraph()
state.messages = [{"content": "What are the total sales for last month?"}]

output = identify_node(state)
print("Identified Concept:", output)
```

### Generate SQL Node

Wraps the **GenerateTimbrSqlChain** functionality to generate SQL from a natural language prompt.
Expects the state to include a `prompt` and returns a payload containing the generated SQL along with the schema and concept.

**Usage Example:**
```python
from langgraph.graph import StateGraph
from langchain_timbr import GenerateTimbrSqlNode

llm_instance = <your_llm_instance>
generate_sql_node = GenerateTimbrSqlNode(
    llm=llm_instance,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    schema="public",
    concept="Sales"
)

state = StateGraph()
state.messages = [{"content": "What are the total sales for last month?"}]

output = generate_sql_node(state)
print("Generated SQL Node Output:", output)
```

### Validate Semantic SQL Node

Wraps the **ValidateTimbrSqlChain** functionality to validate (and optionally adjust) a generated SQL query.
It expects the state to include a `sql` and/or `prompt`, and returns the validated SQL along with its validity status and any error.

**Usage Example:**
```python
from langgraph.graph import StateGraph
from langchain_timbr import ValidateSemanticSqlNode

llm_instance = <your_llm_instance>
validate_sql_node = ValidateSemanticSqlNode(
    llm=llm_instance,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    schema="public",
    concept="Sales",
    retries=3
)

state = StateGraph()
state.sql = "SELECT SUM(amount) FROM sales WHERE date > current_date - INTERVAL '1 month'"
state.prompt = "What are the total sales for last month?"

output = validate_sql_node(state)
print("Validated SQL Node Output:", output)
```

### Execute Semantic SQL Node

Wraps the **ExecuteTimbrQueryChain** functionality to execute the generated SQL query.
It expects the state to include a `prompt` and returns the query result rows.

**Usage Example:**
```python
from langgraph.graph import StateGraph
from langchain_timbr import ExecuteSemanticQueryNode

llm_instance = <your_llm_instance>
execute_query_node = ExecuteSemanticQueryNode(
    llm=llm_instance,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    schema="public",
    concept="Sales"
)

state = StateGraph()
state.messages = [{"content": "What are the total sales for last month?"}]

output = execute_query_node(state)
print("Query Execution Rows:", output)
```

### Generate Response Node

Uses a response template to generate a final human-readable answer based on the SQL, schema, concept, and query rows.

**Usage Example:**
```python
from langchain_timbr import GenerateResponseNode

response_node = GenerateResponseNode()

# Example payload from previous nodes
payload = {
    "sql": "SELECT SUM(amount) FROM sales WHERE date > current_date - INTERVAL '1 month'",
    "schema": "public",
    "concept": "Sales",
    "rows": [{"total_sales": 1250000}]
}

output = response_node(payload)
print("Final Response:", output["response"])
```

## Examples

Explore the [examples/](examples/) directory for detailed use cases, including:

- **Streamlit Integration**: Build a user-friendly app to query Timbr interactively.
- **LangChain Chains**: Use `GenerateTimbrSqlChain`, `ExecuteTimbrQueryChain` & more, for more granular control.
- **Custom Agents**: Create custom agents with LangChain’s `AgentExecutor` to handle complex workflows.
- **LangGraph Nodes**: Use `GenerateTimbrSqlNode` and `ExecuteTimbrQueryNode` & more, for more granular control.

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

## Resources

- [Official Timbr Documentation](https://docs.timbr.ai)

   - [API Documentation](https://docs.timbr.ai/doc/docs/api/)

   - [SQL Reference Documentation](https://docs.timbr.ai/doc/docs/sql/)

- [Tutorials and videos](https://www.youtube.com/playlist?list=PLGgEl0X3EtLkzCVbQmxyVR1l5PM9tG3Uw)

- [Timbr Website](https://timbr.ai)

## Support

For questions or support, please contact your Timbr account manager.

