import logging
import requests
from dataiku.llm.python import BaseLLM

logger = logging.getLogger(__name__)


class TimbrLLM(BaseLLM):

    async def aprocess_stream(self, query, settings, trace):
        timbr_url = settings.get("timbr_url", "<timbr_url>").rstrip("/")
        agent_name = settings.get("timbr_agent", "<agent_name>")
        api_key = settings.get("timbr_api_key", "<timbr_token>")

        logger.info("settings keys: %s", list(settings.keys()))

        if not api_key:
            yield {
                "chunk": {
                    "text": "Error: Timbr API key not configured in connection settings."
                }
            }
            return

        prompt = query["messages"][-1]["content"]

        try:
            response = requests.post(
                f"{timbr_url}/timbr/openapi/execute/answer",
                headers={
                    "accept": "*/*",
                    "agent": agent_name,
                    "x-api-key": api_key,
                },
                json={"prompt": prompt},
                timeout=120,
            )
            response.raise_for_status()
            data = response.json().get("data", {})
            answer_text = (
                data.get("error")
                or f"{data.get('answer')}"
            )
        except requests.RequestException as e:
            answer_text = f"Error calling Timbr: {e}"

        yield {"chunk": {"text": answer_text}}
