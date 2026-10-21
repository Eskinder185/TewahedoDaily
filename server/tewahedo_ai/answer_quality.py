"""Lightweight quality checks for AI *explanation* text only.

Never apply these rewrites to verified Scripture `sources[].verses[].text`.
"""

from __future__ import annotations

import re
from dataclasses import dataclass

from .theology_terminology import FIVE_MYSTERIES, FORBIDDEN_TRINITY_LABELS

_ETHIOPIC_RE = re.compile(r"[\u1200-\u137F]")
# Broken stems / editor remnants (e.g. የሚያጸ_ cleanse) — not normal bilingual paragraphs.
_BROKEN_MERGED_RE = re.compile(
    r"[\u1200-\u137F]+_[A-Za-z]+|[A-Za-z]+_[\u1200-\u137F]+|"
    r"[\u1200-\u137F]{2,}\s*\([^)]*[A-Za-z]{3,}[^)]*\)|"
    r"[\u1200-\u137F]{2,}_\s*[A-Za-z]{3,}"
)
_MARKDOWN_NOISE_RE = re.compile(r"(^|\n)\s{0,3}#{1,6}\s|\*\*[^*]+\*\*|__[^_]+__|```")
_FULL_VERSE_DUMP_RE = re.compile(
    r"(?i)(says?|writes?|reads?|quote[sd]?)\s*[:\"“]|[\"“][^\"”]{80,}[\"”]"
)


@dataclass
class QualityIssue:
    code: str
    message: str
    requires_human_review: bool = True


def check_explanation_quality(answer: str) -> list[QualityIssue]:
    """Flag likely problems in model explanation text (not Scripture rows)."""
    text = (answer or "").strip()
    issues: list[QualityIssue] = []
    if not text:
        issues.append(QualityIssue("empty", "Answer is empty."))
        return issues

    for bad in FORBIDDEN_TRINITY_LABELS:
        if bad in text:
            issues.append(
                QualityIssue(
                    "bad_trinity_label",
                    f"Contains forbidden Trinity label: {bad}",
                )
            )

    if _ETHIOPIC_RE.search(text) and _BROKEN_MERGED_RE.search(text):
        issues.append(
            QualityIssue(
                "amharic_latin_mix",
                "Possible broken Amharic / embedded English editing remnant.",
            )
        )

    if _MARKDOWN_NOISE_RE.search(text):
        issues.append(
            QualityIssue(
                "markdown_noise",
                "Answer contains Markdown markers that should not be shown raw.",
                requires_human_review=False,
            )
        )

    # If answer looks like it dumps long quoted Scripture while teaching.
    if _FULL_VERSE_DUMP_RE.search(text) and len(text) > 900:
        issues.append(
            QualityIssue(
                "possible_verse_duplication",
                "Answer may paste long Bible quotations; prefer citations only when "
                "verified sources are shown separately.",
            )
        )

    # Soft check: Five Mysteries answers should use at least one approved Amharic name.
    lowered = text.lower()
    if "five mysteries" in lowered or "\u12a0\u121d\u1235\u1271 \u121d\u1225\u1322" in text:
        approved_hits = sum(1 for row in FIVE_MYSTERIES if row["am"] in text)
        if approved_hits < 3:
            issues.append(
                QualityIssue(
                    "mysteries_terminology",
                    "Five Mysteries answer may be missing standard Amharic names "
                    "(ምሥጢረ ሥላሴ, ምሥጢረ ሥጋዌ, …).",
                )
            )

    return issues


def explanation_looks_bilingual(answer: str) -> bool:
    text = answer or ""
    has_am = bool(_ETHIOPIC_RE.search(text))
    has_en = bool(re.search(r"[A-Za-z]{4,}", text))
    return has_am and has_en
