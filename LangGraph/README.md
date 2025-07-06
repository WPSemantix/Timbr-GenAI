# LangGraph Interface

The LangGraph interface provides a modular and extensible way to build conversational workflows using the Timbr LangChain SDK. It leverages the power of LangChain's graph-based orchestration to connect multiple nodes—each representing a distinct step in the semantic query pipeline—such as concept identification, SQL generation, validation, execution, and response generation.

With LangGraph, you can:

- **Compose Custom Workflows:** Chain together different nodes to create tailored conversational agents that understand natural language, generate ontology-enriched SQL, and return context-aware answers.
- **Integrate Multiple LLMs:** Seamlessly switch between or combine various large language models (LLMs) like OpenAI GPT, Anthropic Claude, and Timbr's native LLM.
- **Maintain State:** Pass a state object through each node, allowing for complex, multi-turn interactions and context retention.
- **Extend Functionality:** Add your own custom nodes or modify existing ones to fit specific business logic or data sources.

This interface is ideal for developers looking to build advanced, ontology-driven natural language applications that require flexible orchestration and integration with enterprise knowledge graphs.

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

**Important:** You must install the **timbr-langchain** package manually. **Request from your Timbr account manager the `pip install` command for the timbr-langchain library.**

## Directory Structure and Key Files

This folder contains example code and utilities for building graph-based conversational workflows with the Timbr LangChain SDK. The main files are:

- `timbr_execute_semantic_sql_node.py`: Example node for executing semantic SQL queries in a LangGraph workflow.
- `timbr_generate_sql_node.py`: Node for generating Timbr SQL from natural language prompts.
- `timbr_graph_pipeline.py`: Example of composing a full LangGraph pipeline for NL-to-SQL-to-results.
- `timbr_identify_concept_node.py`: Node for identifying the relevant concept and schema from a user query.
- `timbr_validate_semantic_sql.py`: Node for validating and adjusting generated SQL queries.
- `timbr-langgraph.png`: Diagram illustrating the LangGraph workflow and node relationships.

You can use these files as templates to build your own custom graph-based agents and workflows.

## Features

- **Multi-LLM Support**: Integrates with OpenAI GPT, Anthropic Claude, Google Gemini, Databricks DBRX/llama, Snowflake Cortex, and Timbr's native LLM (or any custom LLM using the LangChain interface)
- **SQL Generation**: Generate semantic SQL queries (ontology-enriched queries).
- **Knowledge Graph Access**: Interact with ontologies in natural language and retrieve context-aware answers.
- **Streamlined Querying**: Combine natural language inputs with Timbr using simple methods like `run_llm_query`.

![Timbr LangGraph Flow](./timbr-langgraph.png)

### Identify Concept Node

Wraps the **IdentifyTimbrConceptChain** functionality to identify the relevant concept (and schema) based on the latest message in the state object.

**Usage Example:**
```python
from langgraph.graph import StateGraph
from langchain_timbr import IdentifyConceptNode

llm_instance = <your_llm_instance>  # Replace with your actual LLM instance
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

Wraps the **GenerateTimbrSqlChain** functionality to generate SQL from a natural language prompt. Expects the state to include a `prompt` and returns a payload containing the generated SQL, schema, and concept.

**Usage Example:**
```python
from langgraph.graph import StateGraph
from langchain_timbr import GenerateTimbrSqlNode

llm_instance = <your_llm_instance>  # Replace with your actual LLM instance
generate_sql_node = GenerateTimbrSqlNode(
    llm=llm_instance,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    schema="dtimbr",
    concept="Sales"
)

state = StateGraph()
state.messages = [{"content": "What are the total sales for last month?"}]

output = generate_sql_node(state)
print("Generated SQL Node Output:", output)
```

### Validate Semantic SQL Node

Wraps the **ValidateTimbrSqlChain** functionality to validate (and optionally adjust) a generated SQL query. Expects the state to include a `sql` and/or `prompt`, and returns the validated SQL, its validity status, and any error.

**Usage Example:**
```python
from langgraph.graph import StateGraph
from langchain_timbr import ValidateSemanticSqlNode

llm_instance = <your_llm_instance>  # Replace with your actual LLM instance
validate_sql_node = ValidateSemanticSqlNode(
    llm=llm_instance,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    schema="dtimbr",
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

Wraps the **ExecuteTimbrQueryChain** functionality to execute the generated SQL query. Expects the state to include a `prompt` and returns the query result rows.

**Usage Example:**
```python
from langgraph.graph import StateGraph
from langchain_timbr import ExecuteSemanticQueryNode

llm_instance = <your_llm_instance>  # Replace with your actual LLM instance
execute_query_node = ExecuteSemanticQueryNode(
    llm=llm_instance,
    url="https://your-timbr-app.com/",
    token="tk_XXXXXXXXXXXXXXXXXXXXXXXX",
    ontology="timbr_knowledge_graph",
    schema="dtimbr",
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
    "schema": "dtimbr",
    "concept": "Sales",
    "rows": [{"total_sales": 1250000}]
}

output = response_node(payload)
print("Final Response:", output["response"])
```

## Examples

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

## Support

- 📧 [Email](mailto:support@timbr.ai)
- 📖 [Timbr Documentation](https://docs.timbr.ai)
- 📽️ [Tutorials and videos](https://www.youtube.com/playlist?list=PLGgEl0X3EtLkzCVbQmxyVR1l5PM9tG3Uw)
- 🌐 [Timbr Website](https://timbr.ai)
