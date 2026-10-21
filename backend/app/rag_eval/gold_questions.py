"""Gold questions for private RAG eval against the five editorial books.

Expected references are book/section/topic targets for measurable retrieval —
not claims of official Church approval.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional


@dataclass(frozen=True)
class GoldQuestion:
    qid: str
    language: str  # en | am
    question: str
    intent: str  # what/why/when/who/how
    expected_document_ids: tuple[str, ...]
    expected_keywords_any: tuple[str, ...]
    expected_paragraph_id_prefixes: tuple[str, ...] = ()
    notes: str = ""


GOLD_QUESTIONS: tuple[GoldQuestion, ...] = (
    GoldQuestion(
        qid="en-trinity-what",
        language="en",
        question="What is the Mystery of the Holy Trinity?",
        intent="what",
        expected_document_ids=("F01", "S01"),
        expected_keywords_any=("Trinity", "Father", "Son", "Holy Spirit", "three Persons"),
        notes="Faith and Order / Sacraments Trinity material",
    ),
    GoldQuestion(
        qid="am-trinity-what",
        language="am",
        question="ምሥጢረ ሥላሴ ምንድን ነው?",
        intent="what",
        expected_document_ids=("F01", "S01", "E01", "M01", "W01"),
        expected_keywords_any=("ሥላሴ", "ስላሴ", "አብ", "ወልድ", "መንፈስ"),
        notes="Amharic query should prefer am-source passages when present",
    ),
    GoldQuestion(
        qid="en-baptism-why",
        language="en",
        question="Why did Jesus choose to be baptized in the Jordan River?",
        intent="why",
        expected_document_ids=("F01", "S01", "M01"),
        expected_keywords_any=("baptism", "Baptism", "Jordan", "righteousness", "John"),
    ),
    GoldQuestion(
        qid="am-baptism-why",
        language="am",
        question="ኢየሱስ ክርስቶስ ለምን ተጠመቀ?",
        intent="why",
        expected_document_ids=("F01", "S01", "M01"),
        expected_keywords_any=("ጥምቀት", "ተጠመቀ", "ዮርዳኖስ", "ዮሐንስ"),
    ),
    GoldQuestion(
        qid="en-baptism-when",
        language="en",
        question="At what time was Jesus Christ baptized?",
        intent="when",
        expected_document_ids=("F01", "S01", "M01"),
        expected_keywords_any=("baptism", "Baptism", "thirty", "30", "Jordan", "John"),
    ),
    GoldQuestion(
        qid="en-eucharist-what",
        language="en",
        question="What is the Mystery of the Holy Eucharist?",
        intent="what",
        expected_document_ids=("F01", "S01"),
        expected_keywords_any=("Eucharist", "Communion", "Body", "Blood", "bread", "wine"),
    ),
    GoldQuestion(
        qid="am-eucharist-what",
        language="am",
        question="ምሥጢረ ቁርባን ምንድን ነው?",
        intent="what",
        expected_document_ids=("F01", "S01"),
        expected_keywords_any=("ቁርባን", "ቅዱስ ቁርባን", "ስጋ", "ደም"),
    ),
    GoldQuestion(
        qid="en-incarnation",
        language="en",
        question="Explain the Mystery of the Incarnation according to the Church.",
        intent="what",
        expected_document_ids=("F01", "S01", "M01"),
        expected_keywords_any=("Incarnation", "Word", "human", "nature", "Mary", "Theotokos"),
    ),
    GoldQuestion(
        qid="am-incarnation",
        language="am",
        question="ምሥጢረ ሥጋዌ ምንድን ነው?",
        intent="what",
        expected_document_ids=("F01", "S01", "M01", "E01", "W01"),
        expected_keywords_any=("ሥጋዌ", "ስጋዌ", "ቃል", "ሰው"),
    ),
    GoldQuestion(
        qid="en-five-mysteries",
        language="en",
        question="What are the Five Mysteries of the Church?",
        intent="what",
        expected_document_ids=("F01", "S01"),
        expected_keywords_any=("Trinity", "Incarnation", "Baptism", "Eucharist", "Resurrection"),
    ),
    GoldQuestion(
        qid="am-five-mysteries",
        language="am",
        question="አምስቱ ምሥጢራት ምንድን ናቸው?",
        intent="what",
        expected_document_ids=("F01", "S01"),
        expected_keywords_any=("ምሥጢር", "ሥላሴ", "ሥጋዌ", "ጥምቀት", "ቁርባን", "ትንሣኤ"),
    ),
    GoldQuestion(
        qid="en-ethiopia-history",
        language="en",
        question="How did Christianity begin in Ethiopia?",
        intent="how",
        expected_document_ids=("E01", "W01"),
        expected_keywords_any=("Ethiopia", "Aksum", "Frumentius", "Ezana", "Church"),
    ),
    GoldQuestion(
        qid="en-matthew-andemta",
        language="en",
        question="What does the Andemta commentary say about Matthew's Gospel opening?",
        intent="what",
        expected_document_ids=("M01",),
        expected_keywords_any=("Matthew", "Gospel", "Andemta", "generation", "Abraham"),
    ),
    GoldQuestion(
        qid="en-penance-scope",
        language="en",
        question="Who may receive the sacrament of penance according to Faith and Order?",
        intent="who",
        expected_document_ids=("F01", "S01"),
        expected_keywords_any=("penance", "Penance", "confession", "Christians", "sick"),
    ),
    GoldQuestion(
        qid="en-distractor-dns",
        language="en",
        question="How does DNS translate domain names into IP addresses?",
        intent="how",
        expected_document_ids=(),
        expected_keywords_any=(),
        notes="Negative control — theological corpus should not rank DNS highly",
    ),
)


def questions_for_language(language: Optional[str] = None) -> list[GoldQuestion]:
    if language is None:
        return list(GOLD_QUESTIONS)
    return [q for q in GOLD_QUESTIONS if q.language == language]
