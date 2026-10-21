"""Drop-in helpers for the Tewahedo AI FastAPI service (deploy to VM401 separately)."""

from .answer_quality import QualityIssue, check_explanation_quality, explanation_looks_bilingual
from .theology_prompt import LITELLM_CHAT_DEFAULTS, build_litellm_messages, build_system_prompt
from .theology_terminology import FIVE_MYSTERIES, FORBIDDEN_TRINITY_LABELS, RELATED_TERMS

__all__ = [
    "FIVE_MYSTERIES",
    "FORBIDDEN_TRINITY_LABELS",
    "RELATED_TERMS",
    "LITELLM_CHAT_DEFAULTS",
    "QualityIssue",
    "build_litellm_messages",
    "build_system_prompt",
    "check_explanation_quality",
    "explanation_looks_bilingual",
]
