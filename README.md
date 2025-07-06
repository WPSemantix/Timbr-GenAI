![Timbr logo description](https://timbr.ai/wp-content/uploads/2025/01/logotimbrai230125.png)

# Timbr Gen-AI Examples

This repository provides a collection of examples and reference implementations for working with the Timbr LangChain SDK and related tools. The examples demonstrate how to use Timbr's ontology-driven semantic layer, natural language interfaces, and graph-based orchestration to build advanced data and knowledge applications.

## Example Directories

### 1. [LangChain](./LangChain/)

This folder contains end-to-end and component-level examples for using the Timbr LangChain SDK with natural language queries, SQL generation, and knowledge graph access. Key highlights:

- **`./LangChain/streamlit_app.py`**: Interactive Streamlit web app for querying Timbr using natural language.
- **`./LangChain/timbr_execute_query_chain.py`**: Example of using the Execute Query Chain for NL-to-SQL-to-results workflows.
- **`./LangChain/timbr_generate_sql_chain.py`**: Example of generating Timbr SQL from natural language queries.
- **`./LangChain/timbr_qa_pipeline.py`**: Example pipeline for question answering using Timbr and LangChain.
- **`./LangChain/timbr_sql_agent.py`**: Example of creating and using a Timbr SQL Agent with LangChain.
- **`./LangChain/README.md`**: Detailed instructions, requirements, and usage examples for each script.


### 2. [GraphRAG](./GraphRAG/)

This folder demonstrates how to use Timbr with Graph-based Retrieval-Augmented Generation (GraphRAG) workflows. It includes:

- **`./GraphRAG/app.py`**: Main application for running GraphRAG with Timbr.
- **`./GraphRAG/snow_utils.py`** and **`./GraphRAG/timbr_utils.py`**: Example of utility modules for working with Snowflake and Timbr.
- **`./GraphRAG/data/`**: Example datasets and PDFs for use in the GraphRAG pipeline.
- **`./GraphRAG/images/`**: Architecture and workflow diagrams.
- **`./GraphRAG/setup/`**: SQL scripts and setup instructions for preparing your environment.
- **`./GraphRAG/README.md`**: Overview, requirements, and step-by-step instructions for running GraphRAG examples.

### 3. [LangGraph](./LangGraph/)

This folder provides modular, node-based examples using LangGraph for building conversational and workflow graphs with Timbr. It features:

- **`./LangGraph/timbr_execute_semantic_sql_node.py`**: Node for executing semantic SQL queries.
- **`./LangGraph/timbr_generate_sql_node.py`**: Node for generating Timbr SQL from NL prompts.
- **`./LangGraph/timbr_graph_pipeline.py`**: Example of a full LangGraph pipeline.
- **`./LangGraph/timbr_identify_concept_node.py`**: Node for concept and schema identification.
- **`./LangGraph/timbr_validate_semantic_sql.py`**: Node for validating and adjusting SQL.
- **`./LangGraph/timbr-langgraph.png`**: Visual diagram of the LangGraph workflow.
- **`./LangGraph/README.md`**: Usage, requirements, and code samples for each node and workflow.

---

## Getting Started

1. Review the README in each example subfolder for setup and usage instructions.
2. Install the required dependencies as listed in each example's README.
3. Follow the step-by-step guides to run the apps, pipelines, or workflows.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

## Support

- 📧 [Email](mailto:support@timbr.ai)
- 📖 [Timbr Documentation](https://docs.timbr.ai)
- 📽️ [Tutorials and videos](https://www.youtube.com/playlist?list=PLGgEl0X3EtLkzCVbQmxyVR1l5PM9tG3Uw)
- 🌐 [Timbr Website](https://timbr.ai)
