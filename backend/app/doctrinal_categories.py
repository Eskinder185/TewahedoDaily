"""EOTC doctrinal category separation: Five Mysteries of Faith vs Seven Sacraments.

Live Search Buddy must not conflate these. Classifications are anchored to the
editorial Faith and Order / Seven Sacraments package paragraph IDs for audit,
but unapproved draft book bodies are NOT published as public RAG evidence.
"""
from __future__ import annotations

from dataclasses import dataclass
import re
from typing import Literal, Optional

DoctrinalCategory = Literal[
    "five_mysteries",
    "seven_sacraments",
    "ambiguous_mysteries",
    "none",
]


@dataclass(frozen=True)
class MysteryItem:
    key: str
    english: str
    amharic: str


@dataclass(frozen=True)
class SacramentItem:
    key: str
    english: str
    amharic: str
    # Faith and Order / Seven Sacraments package anchors (editorial; not public RAG).
    source_paragraph_ids: tuple[str, ...]


# Traditional EOTC Five Mysteries of Faith (ምሥጢራተ ሃይማኖት) — distinct from sacraments.
# Private RAG maps these to F01 chapter sections F01W-S02…S06 for research only.
FIVE_MYSTERIES: tuple[MysteryItem, ...] = (
    MysteryItem("trinity", "Mystery of the Trinity", "ምሥጢረ ሥላሴ"),
    MysteryItem("incarnation", "Mystery of the Incarnation", "ምሥጢረ ሥጋዌ"),
    MysteryItem("baptism", "Mystery of Baptism", "ምሥጢረ ጥምቀት"),
    MysteryItem("eucharist", "Mystery of the Eucharist", "ምሥጢረ ቁርባን"),
    MysteryItem(
        "resurrection",
        "Mystery of the Resurrection of the Dead",
        "ምሥጢረ ትንሣኤ ሙታን",
    ),
)

# Seven Sacraments — Faith and Order F01W-P0165 (corrected "unction"); S01 book title
# "The Seven Sacraments of the Church". Unapproved drafts stay non-public.
SEVEN_SACRAMENTS: tuple[SacramentItem, ...] = (
    SacramentItem("baptism", "Baptism", "ጥምቀት", ("F01W-P0165", "S01-P0008")),
    SacramentItem("confirmation", "Confirmation (Myron)", "ሜሮን", ("F01W-P0165", "S01-P0012")),
    SacramentItem("penance", "Penance", "ንስሐ", ("F01W-P0165", "S01-P0018")),
    SacramentItem("communion", "Holy Communion", "ቅዱስ ቁርባን", ("F01W-P0165", "S01-P0015")),
    SacramentItem(
        "unction",
        "Unction of the Sick",
        "ቅብአት ሕሙማን",
        ("F01W-P0165", "F01W-P0615"),
    ),
    SacramentItem("matrimony", "Matrimony", "ተክሊል", ("F01W-P0165", "S01")),
    SacramentItem("orders", "Holy Orders", "ክህነት", ("F01W-P0165", "S01")),
)

SACRAMENT_LIST_SOURCE = "F01W-P0165"
SACRAMENT_LIST_ENGLISH = (
    "baptism, confirmation, penance, Holy Communion, unction of the sick, "
    "matrimony, and holy orders"
)


def is_five_mysteries_question(message: str) -> bool:
    text = message or ""
    if re.search(
        r"five\s+mysteries|mysteries\s+of\s+(?:the\s+)?faith|"
        r"አምስቱ\s+ም[ሥስ]ጢራት|ምሥጢራተ\s*ሃይማኖት",
        text,
        flags=re.IGNORECASE,
    ):
        return True
    return False


def is_seven_sacraments_question(message: str) -> bool:
    text = message or ""
    if re.search(
        r"seven\s+sacraments?|7\s+sacraments?|"
        r"ሰባቱ\s+ም[ሥስ]ጢራት|ሰባቱ\s+ቁዱሳት|"
        r"sacraments?\s+of\s+the\s+church",
        text,
        flags=re.IGNORECASE,
    ):
        return True
    # Explicit sacrament list questions without "seven"
    if re.search(r"\bwhat\s+are\s+the\s+sacraments\b", text, flags=re.IGNORECASE):
        return True
    if "ምንድን" in text and re.search(r"ቁዱሳት|ሰባት", text):
        return True
    return False


def is_ambiguous_mysteries_question(message: str) -> bool:
    """Bare 'mysteries' / ምሥጢራት without five/seven — needs clarification."""
    text = (message or "").strip()
    if not text:
        return False
    if is_five_mysteries_question(text) or is_seven_sacraments_question(text):
        return False
    if re.search(
        r"\bwhat\s+are\s+the\s+mysteries\b|"
        r"\bthe\s+mysteries\b|"
        r"\bmysteries\s+of\s+the\s+church\b|"
        r"ም[ሥስ]ጢራት\s*ምን|"
        r"ምንድን\s*ናቸው\s*ም[ሥስ]ጢራት|"
        r"የቤተ\s*ክርስቲያን\s*ም[ሥስ]ጢራት",
        text,
        flags=re.IGNORECASE,
    ):
        return True
    return False


def classify_doctrinal_category(message: str) -> DoctrinalCategory:
    if is_five_mysteries_question(message):
        return "five_mysteries"
    if is_seven_sacraments_question(message):
        return "seven_sacraments"
    if is_ambiguous_mysteries_question(message):
        return "ambiguous_mysteries"
    return "none"


def claims_cross_category_mix(answer: str, category: DoctrinalCategory) -> bool:
    """Heuristic: detect forbidden cross-list substitutions in model output.

    Contrastive disclaimers ("distinct from the seven sacraments") are allowed.
    """
    text = (answer or "").lower()
    if not text:
        return False
    # Strip common contrastive framing so "distinct from X" is not flagged.
    contrast = re.sub(
        r"(distinct from|different from|not (?:the same as|to be confused with)|"
        r"do not (?:replace|substitute|confuse)|ከ.+?የተለየ|"
        r"አይደሉም|rather than).{0,80}",
        " ",
        text,
        flags=re.IGNORECASE,
    )
    if category == "five_mysteries":
        # Listing several sacrament-only items as if they were the five is a mix.
        sacrament_only = (
            "confirmation",
            "myron",
            "penance",
            "unction",
            "matrimony",
            "holy orders",
        )
        hits = sum(1 for s in sacrament_only if s in contrast)
        if hits >= 2:
            return True
        # "are the seven sacraments" / equated lists — not mere mention.
        if re.search(r"\bare the seven sacraments\b|\bfive mysteries are .{0,40}sacrament", contrast):
            return True
    if category == "seven_sacraments":
        mystery_markers = (
            "mystery of the trinity",
            "mystery of the incarnation",
            "resurrection of the dead",
            "ምሥጢረ ሥላሴ",
            "ምሥጢረ ሥጋዌ",
            "ምሥጢረ ትንሣኤ",
        )
        hits = sum(1 for s in mystery_markers if s.lower() in contrast or s in (answer or ""))
        if hits >= 2:
            return True
        if re.search(r"\bare the five mysteries\b|\bseven sacraments are .{0,40}five mysteries", contrast):
            return True
    return False


def five_mysteries_answer(*, prefer_amharic: bool) -> str:
    if prefer_amharic:
        lines = ["አምስቱ ምሥጢራተ ሃይማኖት እነዚህ ናቸው፦"]
        for i, item in enumerate(FIVE_MYSTERIES, 1):
            lines.append(f"{i}. {item.amharic} ({item.english})")
        lines.append(
            "እነዚህ ከሰባቱ ቅዱሳት ምሥጢራት (ሳክራመንቶች) የተለዩ ናቸው። "
            "ጥምቀትና ቁርባን በሁለቱም ዝርዝሮች ውስጥ ይታያሉ፣ ነገር ግን አምስቱ ምሥጢራተ ሃይማኖት "
            "ከሰባቱ ሳክራመንቶች ጋር አንድ አይደሉም።"
        )
        return "\n".join(lines)
    lines = [
        "The Ethiopian Orthodox Tewahedo Church teaches Five Mysteries of Faith:",
    ]
    for i, item in enumerate(FIVE_MYSTERIES, 1):
        lines.append(f"{i}. {item.english} ({item.amharic})")
    lines.append(
        "These are distinct from the Seven Sacraments (ምሥጢራተ ቤተ ክርስቲያን). "
        "Baptism and the Eucharist appear in both teachings for different reasons; "
        "do not replace the Five Mysteries with the seven-sacrament list."
    )
    return "\n".join(lines)


def seven_sacraments_answer(*, prefer_amharic: bool) -> str:
    if prefer_amharic:
        lines = [
            "ሰባቱ ቅዱሳት ምሥጢራት (ሳክራመንቶች) እነዚህ ናቸው "
            f"(የማጣቀሻ አንቀጽ {SACRAMENT_LIST_SOURCE})፦"
        ]
        for i, item in enumerate(SEVEN_SACRAMENTS, 1):
            lines.append(f"{i}. {item.amharic} — {item.english}")
        lines.append(
            "ይህ ዝርዝር ከአምስቱ ምሥጢራተ ሃይማኖት የተለየ ነው። "
            "ሙሉ የመጽሐፍ ጽሑፍ ለሕዝብ መልሶች ገና አልተፈቀደም።"
        )
        return "\n".join(lines)
    lines = [
        "According to Faith and Order "
        f"({SACRAMENT_LIST_SOURCE}), there are seven sacraments: "
        f"{SACRAMENT_LIST_ENGLISH}.",
        "Listed:",
    ]
    for i, item in enumerate(SEVEN_SACRAMENTS, 1):
        lines.append(f"{i}. {item.english} ({item.amharic})")
    lines.append(
        "This sacramental list is distinct from the Five Mysteries of Faith "
        "(Trinity, Incarnation, Baptism, Eucharist, Resurrection of the Dead). "
        "Full book paragraph text is not published here until editorial approval; "
        "the classification above preserves the source paragraph identifier."
    )
    return "\n".join(lines)


def ambiguous_mysteries_clarification(*, prefer_amharic: bool) -> str:
    if prefer_amharic:
        return (
            "እባክዎ ያብራሩ፦ አምስቱ ምሥጢራተ ሃይማኖትን ይጠይቃሉ ወይስ ሰባቱ ቅዱሳት ምሥጢራት "
            "(ሳክራመንቶች)ን? እነዚህ ሁለት የተለያዩ ትምህርቶች ናቸው።"
        )
    return (
        "Please clarify: are you asking about the Five Mysteries of Faith "
        "(ምሥጢራተ ሃይማኖት), or the Seven Sacraments of the Church "
        "(ምሥጢራተ ቤተ ክርስቲያን)? These are two distinct teachings."
    )


def try_verified_doctrine_response(message: str) -> Optional[dict]:
    """Deterministic Search Buddy payload for mysteries/sacraments questions."""
    category = classify_doctrinal_category(message)
    if category == "none":
        return None
    prefer_amharic = bool(re.search(r"[\u1200-\u137F]", message or ""))
    if category == "ambiguous_mysteries":
        answer = ambiguous_mysteries_clarification(prefer_amharic=prefer_amharic)
        return {
            "type": "ai",
            "answer": answer,
            "message": answer,
            "doctrine_verified": True,
            "doctrine_category": category,
            "needs_clarification": True,
            "sources": [],
        }
    if category == "five_mysteries":
        answer = five_mysteries_answer(prefer_amharic=prefer_amharic)
        return {
            "type": "ai",
            "answer": answer,
            "message": answer,
            "doctrine_verified": True,
            "doctrine_category": category,
            "verified_doctrine": {
                "category": category,
                "items": [
                    {"key": m.key, "english": m.english, "amharic": m.amharic}
                    for m in FIVE_MYSTERIES
                ],
                "not_category": "seven_sacraments",
            },
            "sources": [],
        }
    # seven_sacraments
    answer = seven_sacraments_answer(prefer_amharic=prefer_amharic)
    return {
        "type": "ai",
        "answer": answer,
        "message": answer,
        "doctrine_verified": True,
        "doctrine_category": category,
        "verified_doctrine": {
            "category": category,
            "list_source_paragraph_id": SACRAMENT_LIST_SOURCE,
            "items": [
                {
                    "key": s.key,
                    "english": s.english,
                    "amharic": s.amharic,
                    "source_paragraph_ids": list(s.source_paragraph_ids),
                }
                for s in SEVEN_SACRAMENTS
            ],
            "not_category": "five_mysteries",
            "editorial_note": (
                "Classification anchored to Faith and Order "
                f"{SACRAMENT_LIST_SOURCE}; full draft book text is not public "
                "until editorial approval."
            ),
        },
        "sources": [],
    }


def verified_doctrine_block_for_chat(message: str) -> Optional[str]:
    """Inject into LLM turn instructions if doctrine somehow reaches Gemma."""
    category = classify_doctrinal_category(message)
    if category == "none":
        return None
    if category == "ambiguous_mysteries":
        return (
            "VERIFIED DOCTRINAL ROUTING:\n"
            "The user asked about mysteries without specifying which list. "
            "Ask them to choose Five Mysteries of Faith vs Seven Sacraments. "
            "Do not answer with either full list until they clarify. "
            "Do not invent a combined list."
        )
    if category == "five_mysteries":
        items = "; ".join(f"{m.english} / {m.amharic}" for m in FIVE_MYSTERIES)
        return (
            "VERIFIED DOCTRINAL CATEGORY: FIVE MYSTERIES OF FAITH.\n"
            f"Answer with exactly these five: {items}.\n"
            "Do NOT list the Seven Sacraments (no confirmation/Myron, penance, "
            "unction, matrimony, or holy orders as part of this five). "
            "Do not say the Five Mysteries are the seven sacraments. "
            "Baptism and Eucharist here are mysteries of faith, not a sacrament inventory."
        )
    items = "; ".join(f"{s.english} / {s.amharic}" for s in SEVEN_SACRAMENTS)
    return (
        "VERIFIED DOCTRINAL CATEGORY: SEVEN SACRAMENTS.\n"
        f"Source list paragraph: {SACRAMENT_LIST_SOURCE} — {SACRAMENT_LIST_ENGLISH}.\n"
        f"Answer with exactly these seven: {items}.\n"
        "Do NOT substitute the Five Mysteries of Faith "
        "(Trinity / Incarnation / Resurrection of the Dead as a five-item faith list). "
        "Do not invent additional sacraments. "
        "Do not claim the unapproved book draft was retrieved unless supplied."
    )


def terminology_section_for_system_prompt(category: DoctrinalCategory) -> str:
    """Avoid always injecting Five Mysteries into every chat turn."""
    if category == "seven_sacraments":
        return (
            "ETHIOPIAN ORTHODOX TERMINOLOGY (THIS TURN — SEVEN SACRAMENTS):\n"
            f"- Use the seven sacraments per Faith and Order {SACRAMENT_LIST_SOURCE}: "
            f"{SACRAMENT_LIST_ENGLISH}.\n"
            "- Do not replace this list with the Five Mysteries of Faith.\n"
            "- Never use ቅድስያ ልዑል as the name of the Trinity."
        )
    if category == "five_mysteries":
        return (
            "ETHIOPIAN ORTHODOX TERMINOLOGY (THIS TURN — FIVE MYSTERIES):\n"
            "- 1. Mystery of the Trinity: ምሥጢረ ሥላሴ.\n"
            "- 2. Mystery of the Incarnation: ምሥጢረ ሥጋዌ.\n"
            "- 3. Mystery of Baptism: ምሥጢረ ጥምቀት.\n"
            "- 4. Mystery of the Eucharist: ምሥጢረ ቁርባን.\n"
            "- 5. Mystery of the Resurrection of the Dead: ምሥጢረ ትንሣኤ ሙታን.\n"
            "- Do not list the Seven Sacraments as the answer to this question.\n"
            "- Never use ቅድስያ ልዑል as the name of the Trinity.\n"
            "- Distinguish the Resurrection of Christ from the future "
            "resurrection of the dead."
        )
    if category == "ambiguous_mysteries":
        return (
            "ETHIOPIAN ORTHODOX TERMINOLOGY (THIS TURN):\n"
            "- Ask whether the user means the Five Mysteries of Faith or "
            "the Seven Sacraments. Do not merge the lists."
        )
    # Default: mention both as distinct without forcing either list as the answer.
    return (
        "ETHIOPIAN ORTHODOX TERMINOLOGY:\n"
        "- The Five Mysteries of Faith (ምሥጢራተ ሃይማኖት) and the Seven Sacraments "
        "(ምሥጢራተ ቤተ ክርስቲያን) are distinct teachings — never substitute one for the other.\n"
        "- When naming the Five Mysteries, use: ምሥጢረ ሥላሴ፣ ምሥጢረ ሥጋዌ፣ "
        "ምሥጢረ ጥምቀት፣ ምሥጢረ ቁርባን፣ ምሥጢረ ትንሣኤ ሙታን.\n"
        "- When naming the Seven Sacraments, use Faith and Order "
        f"{SACRAMENT_LIST_SOURCE}: {SACRAMENT_LIST_ENGLISH}.\n"
        "- Never use ቅድስያ ልዑል as the name of the Trinity.\n"
        "- Distinguish the Resurrection of Christ from the future "
        "resurrection of the dead."
    )
