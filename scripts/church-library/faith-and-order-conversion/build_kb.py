"""Build the Faith and Order search knowledge base from the source DOCX.

Usage: python3 -I build_kb.py <source.docx> <out_dir>

Deterministic: the same DOCX always yields the same passages and IDs.
"""
from __future__ import annotations

import csv
import hashlib
import json
import re
import sys
from collections import Counter
from pathlib import Path

import docx
from docx.oxml.ns import qn

sys.path.insert(0, str(Path(__file__).resolve().parent))
from aliases import TOPICS, FIVE_PILLAR_CHAPTER_PATTERN  # noqa: E402

DOCUMENT_ID = "faith-and-order-of-the-church"
TITLE = "The Faith And Order Of The Church"
SOURCE_FILENAME = "The Faith And Order Of The Church (2)(4).docx"
ID_PREFIX = "faith-and-order"
TARGET_MIN, TARGET_MAX = 300, 600
SECTION_BREAK_MIN = 220     # start a new chunk at a sub-heading once this many words are buffered
TAIL_MERGE_MAX = 140        # a chapter's final fragment below this is merged backward
LEAD_IN_MAX_WORDS = 25      # never end a chunk on a short lead-in / label paragraph

# Sub-headings, identified by paragraph index after manual review of the
# document's list structure (first-level list items that are titles, plus two
# Body-text sub-titles). Recorded here so the build is reproducible.
SUBHEADING_INDEXES = {
    88, 108,                                   # Baptism / Resurrection scripture sub-titles
    153, 163, 178, 182,                        # Introduction to Church Sacraments
    209, 217, 224, 227, 230, 233, 248, 261, 269, 284, 287, 290,  # Baptism
    301, 304, 307, 326, 331, 334,              # Confirmation
    345, 349, 359, 376, 383, 390, 410,         # Penance
    416, 427, 435, 438, 483, 500, 547, 583, 588,  # Holy Communion
    611, 633, 647, 654, 657,                   # Unction of the Sick
    663, 667, 679, 687, 695, 704, 725,         # Matrimony
    730, 751, 763, 769, 774, 807, 817,         # Holy Orders
}

# Paragraphs split by a page break (or a broken table) mid-sentence. Each group
# is re-joined with a single space; no words are added or removed.
MERGE_GROUPS = [
    (23, 25), (29, 30), (45, 46), (84, 86), (96, 98), (127, 129), (170, 172),
    (315, 316), (337, 339), (355, 357), (459, 461), (471, 473), (521, 523),
    (614, 615, 616, 618, 619), (770, 772),
]

SMALL_WORDS = {"of", "the", "and", "in", "a", "an", "to", "for", "on", "at", "by", "or"}

BIBLE_BOOKS = (
    r"Genesis|Gen|Exodus|Ex|Lev|Numbers|Num|1\s?Sam|1\s?Kg|2\s?Kg|Isaiah|Is|Jer|Prov|Mall?|"
    r"Matthew|Matt?|Mt|Mark|Mk|Luke|Lk|John|Jn|Acts|Romans|Rome?|[12]\s?Cor|Gal|Eph|Phil|Col|"
    r"1\s?Thess|[12]\.?\s?[Tt]im|Tit|Titus|Heb|James|1\s?Pet|1\s?John"
)
SCRIPTURE_RE = re.compile(
    rf"\b(?:{BIBLE_BOOKS})\b\.?[,:]?\s?\d{{1,3}}(?:\s?[:;.,]\s?f?\d{{1,3}}(?:\s?[-–]\s?\d{{1,3}})?)*"
)

# Likely OCR / typing errors. These are FLAGGED, never corrected.
OCR_FLAGS = [
    (r"^, eternally Son", "Paragraph begins mid-sentence; preceding words appear to be missing from the source DOCX."),
    (r"neither convinced in the sense", "'convinced' may be an error for 'conceived'."),
    (r"\(Mk\. 16:6\)", "Quoted verse is Mark 16:16; reference reads 16:6."),
    (r"reveille strange thoughts", "'reveille' is unclear (possibly 'repel' or 'reveal')."),
    (r"all who are in the combs", "'combs' is likely 'tombs' (John 5:28)."),
    (r"take, cat;", "'cat' is likely 'eat'."),
    (r"widow at Nail", "'Nail' is likely 'Nain' (Luke 7:11)."),
    (r"nyatural", "'nyatural' is likely 'natural'."),
    (r"book if life", "'if' is likely 'of'."),
    (r"though Jesus Christ our Lord, though whom", "'though' is likely 'through'."),
    (r"one Chris dynamically", "'Chris' is likely 'Christ'."),
    (r"[Ff]unction of the (?:sick|holy oil)|we have a function from", "'function' is likely 'unction'."),
    (r"\bmairon\b", "'mairon' likely means myron (holy chrism)."),
    (r"meditation of the priest", "'meditation' is likely 'mediation'."),
    (r"audible sings|visible sings", "'sings' is likely 'signs'."),
    (r"not only to lose", "'lose' is likely 'loose' (Matt. 16:19)."),
    (r"the deeper of the prison", "'deeper' is likely 'keeper' (Acts 16:33)."),
    (r"grants the race through", "'race' is likely 'grace'."),
    (r"ask too fast", "'too fast' is likely 'to fast'."),
    (r"examine very sin", "'very' is likely 'every'."),
    (r"filled with puss", "'puss' is likely 'pus'."),
    (r"crowing service", "'crowing' is likely 'crowning'."),
    (r"brought froth bread", "'froth' is likely 'forth' (Gen. 14:18)."),
    (r"grivet you", "'grivet' is likely 'giveth' (John 6:32)."),
    (r"he that eaten of this bread", "'eaten' is likely 'eateth'."),
    (r"supped, saving", "'saving' is likely 'saying'."),
    (r"after having hands on Jesus", "Likely 'after laying hands on Jesus'."),
    (r"from Caliphs", "'Caliphs' is likely 'Caiaphas' (John 18:28)."),
    (r"saying be brought Jesus", "'be' is likely 'he' (John 19:13)."),
    (r"Them said Jesus", "'Them' is likely 'Then' (John 13:27)."),
    (r"Chryksostom", "'Chryksostom' is likely 'Chrysostom'."),
    (r"which is the shade for many", "'shade' is likely 'shed'."),
    (r"Whose eateth", "'Whose' is likely 'Whoso'."),
    (r"he have not life", "'he' is likely 'ye' (John 6:53)."),
    (r"the He remaineth", "'the' is likely 'that'."),
    (r"Irenacus", "'Irenacus' is likely 'Irenaeus'."),
    (r"\(Mall\. 1: 11\)", "'Mall.' is likely 'Mal.' (Malachi)."),
    (r"Matt: 26: 27,18", "Reference likely 'Matt. 26:27,28'."),
    (r"Lord’s side \(John 19: 32\)", "Blood and water from the side is John 19:34; reference reads 19:32."),
    (r"\(John 16: 26\)", "Quoted verse is John 16:29; reference reads 16:26."),
    (r"\(Acts 20: 38\)", "Quoted verse is Acts 20:28; reference reads 20:38."),
    (r"\(Acts 8-17\)", "Reference likely 'Acts 8:17'."),
    (r"\(Acts 14: f23\)", "Reference likely 'Acts 14:23'."),
    (r"By His reaching", "'reaching' is likely 'teaching'."),
    (r"thay twain", "'thay' is likely 'the'."),
    (r"lt not man", "'lt' is likely 'let'."),
    (r"^some church fathers", "List item begins lower-case; a leading word or numbering may be missing."),
    (r"unmarried and windows", "'windows' is likely 'widows' (1 Cor. 7:8)."),
    (r"better to marry an to burn", "'an' is likely 'than'."),
    (r"given 10 priests", "'10' is likely 'to'."),
    (r"not lit to send", "'lit' is likely 'fit'."),
    (r"whose married her", "'whose' is likely 'whoso'."),
    (r"Per, Can any man", "'Per' is likely 'Peter' (Acts 10:47)."),
    (r"\bRome [0-9]", "'Rome' used as abbreviation for Romans."),
    (r"Corinthe", "'Corinthe' is likely 'Corinth'."),
    (r"spirit may be save in", "'save' is likely 'saved'."),
    (r"discriminately", "Possibly 'indiscriminately' intended."),
    (r"bring all this into being", ""),
]
OCR_FLAGS = [(re.compile(p), n) for p, n in OCR_FLAGS if n]


def norm_space(text: str) -> str:
    return re.sub(r"[ \t ]+", " ", text).strip()


def title_case_heading(text: str) -> str:
    """Normalize ALL-CAPS headings for display; mixed-case headings are kept."""
    if text != text.upper():
        return text
    words = text.lower().split()
    out = []
    for i, w in enumerate(words):
        out.append(w if (i > 0 and w in SMALL_WORDS) else w[:1].upper() + w[1:])
    return " ".join(out)


def word_count(text: str) -> int:
    return len(text.split())


def read_paragraphs(path: Path) -> list[dict]:
    d = docx.Document(str(path))
    paras, page = [], 1
    for el in d.element.body.iterchildren():
        if el.tag == qn("w:tbl"):
            raise SystemExit("Unexpected table in source; table handling must be reviewed.")
        if el.tag != qn("w:p"):
            continue
        p = docx.text.paragraph.Paragraph(el, d)
        paras.append({"i": len(paras), "page": page, "style": p.style.name, "text": norm_space(p.text)})
        if el.find(".//" + qn("w:sectPr")) is not None:
            page += 1
    return paras


def apply_merges(paras: list[dict]) -> tuple[list[dict], list[dict]]:
    absorbed, log = {}, []
    for group in MERGE_GROUPS:
        head = paras[group[0]]
        parts = [paras[g]["text"] for g in group]
        for g in group[1:]:
            assert paras[g]["text"], f"merge target {g} empty"
            absorbed[g] = group[0]
        merged = " ".join(parts)
        log.append({"paragraph_indexes": list(group), "pages": sorted({paras[g]["page"] for g in group}),
                    "joined_text_preview": merged[:120]})
        head["text"] = merged
        head["page_end"] = paras[group[-1]]["page"]
    out = [p for p in paras if p["i"] not in absorbed]
    return out, log


def build_units(paras: list[dict]):
    """Return list of chapters: {title, source_heading, order, units:[...]}"""
    chapters, current, section = [], None, None
    for p in paras:
        t = p["text"]
        if p["style"] == "Title":
            continue
        if p["style"].startswith("Heading"):
            if not t:
                continue  # empty heading paragraphs (layout artifacts)
            current = {"title": title_case_heading(t), "source_heading": t, "order": len(chapters) + 1,
                       "page": p["page"], "units": []}
            chapters.append(current)
            section = None
            continue
        if not t:
            continue
        is_sub = p["i"] in SUBHEADING_INDEXES
        if is_sub:
            section = t[:-1].rstrip() if t.endswith(".") else t
        current["units"].append({
            "i": p["i"], "text": t, "words": word_count(t), "section": section,
            "is_subheading": is_sub, "page_start": p["page"], "page_end": p.get("page_end", p["page"]),
        })
    return chapters


def is_lead_in(unit) -> bool:
    return unit["is_subheading"] or unit["words"] <= LEAD_IN_MAX_WORDS or unit["text"].endswith(":") \
        or unit["text"].endswith(":-")


def chunk_chapter(ch) -> list[list[dict]]:
    chunks, cur, cur_words = [], [], 0
    for u in ch["units"]:
        if cur:
            last = cur[-1]
            boundary_ok = not is_lead_in(last)
            if u["is_subheading"] and cur_words >= SECTION_BREAK_MIN:
                chunks.append(cur); cur, cur_words = [], 0
            elif cur_words + u["words"] > TARGET_MAX and cur_words >= TARGET_MIN and boundary_ok:
                chunks.append(cur); cur, cur_words = [], 0
        cur.append(u); cur_words += u["words"]
    if cur:
        chunks.append(cur)
    # merge an undersized tail backwards inside the same chapter
    if len(chunks) > 1 and sum(u["words"] for u in chunks[-1]) < TAIL_MERGE_MAX:
        tail = chunks.pop()
        chunks[-1].extend(tail)
    return chunks


def topics_for(chapter_title: str, section: str | None, content: str):
    hay = f"{chapter_title}\n{section or ''}\n{content}".lower()
    matched = []
    for t in TOPICS:
        if t["topic"] == "five_pillars_of_mystery":
            if re.match(FIVE_PILLAR_CHAPTER_PATTERN, chapter_title):
                matched.append(t)
            continue
        if any(re.search(rx, hay) for rx in t["triggers"]):
            matched.append(t)
    return matched


def main(src: Path, out_dir: Path) -> None:
    out_dir.mkdir(parents=True, exist_ok=True)
    raw = read_paragraphs(src)
    sha256 = hashlib.sha256(src.read_bytes()).hexdigest()
    page_count = raw[-1]["page"] if raw else None
    source_nonempty = [p for p in raw if p["text"]]
    source_words = sum(word_count(p["text"]) for p in raw)
    source_refs = Counter(m.group(0) for p in raw for m in SCRIPTURE_RE.finditer(p["text"]))

    paras, merge_log = apply_merges([dict(p) for p in raw])
    chapters = build_units(paras)

    records, order = [], 0
    for ch in chapters:
        for chunk in chunk_chapter(ch):
            order += 1
            sections = []
            for u in chunk:
                if u["section"] and u["section"] not in sections:
                    sections.append(u["section"])
            content = "\n\n".join(u["text"] for u in chunk)
            topics = topics_for(ch["title"], " ".join(sections), content)
            keywords, aliases = [], []
            for t in topics:
                for k in t["keywords"]:
                    if k not in keywords:
                        keywords.append(k)
                for a in t["aliases"]:
                    if a not in aliases:
                        aliases.append(a)
            flags = []
            for rx, note in OCR_FLAGS:
                for u in chunk:
                    if rx.search(u["text"]):
                        flags.append({"source_paragraph_index": u["i"], "match": rx.search(u["text"]).group(0), "note": note})
            records.append({
                "document_id": DOCUMENT_ID,
                "passage_id": f"{ID_PREFIX}-{order:04d}",
                "title": TITLE,
                "chapter": ch["title"],
                "section": " · ".join(sections) if sections else None,
                "language": "en",
                "source_filename": SOURCE_FILENAME,
                "page_start": min(u["page_start"] for u in chunk),
                "page_end": max(u["page_end"] for u in chunk),
                "passage_order": order,
                "content": content,
                "search_keywords": keywords,
                "search_aliases": aliases,
                "chapter_order": ch["order"],
                "chapter_source_heading": ch["source_heading"],
                "sections": sections,
                "topics": [t["topic"] for t in topics],
                "scripture_references": [m.group(0) for m in SCRIPTURE_RE.finditer(content)],
                "word_count": word_count(content),
                "source_paragraph_range": [chunk[0]["i"], chunk[-1]["i"]],
                "quality_flags": flags,
            })

    # ---- outputs -------------------------------------------------------
    jsonl = out_dir / "church_faith_and_order_search.jsonl"
    with jsonl.open("w", encoding="utf-8", newline="\n") as f:
        for r in records:
            f.write(json.dumps(r, ensure_ascii=False) + "\n")

    # Sections in reading order (for church_library_sections)
    section_rows, seen = [], {}
    for r in records:
        key = (r["chapter"], r["sections"][0] if r["sections"] else None)
        for sec in (r["sections"] or [None]):
            k = (r["chapter"], sec)
            if k not in seen:
                seen[k] = len(section_rows)
                section_rows.append({"section_order": len(section_rows), "chapter_reference": r["chapter"],
                                     "title": sec or r["chapter"], "page_start": r["page_start"], "page_end": r["page_end"]})
            else:
                row = section_rows[seen[k]]
                row["page_end"] = max(row["page_end"], r["page_end"])
        r["_section_key"] = seen[key]

    csv_path = out_dir / "church_faith_and_order_supabase_import.csv"
    cols = ["book_id", "version_id", "section_order", "passage_order", "language", "content", "page_start",
            "page_end", "chapter_reference", "locator_label", "extraction_confidence", "review_status"]
    with csv_path.open("w", encoding="utf-8", newline="") as f:
        w = csv.DictWriter(f, fieldnames=cols, quoting=csv.QUOTE_MINIMAL, lineterminator="\n")
        w.writeheader()
        for r in records:
            w.writerow({
                "book_id": "", "version_id": "",
                "section_order": r["_section_key"],
                "passage_order": r["passage_order"], "language": r["language"], "content": r["content"],
                "page_start": r["page_start"], "page_end": r["page_end"],
                "chapter_reference": r["chapter"],
                "locator_label": r["section"],
                "extraction_confidence": 0.9 if r["quality_flags"] else 1.0,
                "review_status": "needs_attention" if r["quality_flags"] else "pending",
            })
            del r["_section_key"]

    (out_dir / "church_faith_and_order_sections.json").write_text(
        json.dumps(section_rows, ensure_ascii=False, indent=2), encoding="utf-8")

    alias_rows = []
    for t in TOPICS:
        for a in t["aliases"]:
            alias_rows.append({"alias": a, "topic": t["topic"],
                               "script": "ethiopic" if re.search(r"[ሀ-፿]", a) else "latin",
                               "expansion": t["expansion"], "note": t["note"]})
    (out_dir / "church_faith_and_order_aliases.json").write_text(
        json.dumps(alias_rows, ensure_ascii=False, indent=2), encoding="utf-8")

    stats = {
        "source": {"sha256": sha256, "paragraphs_total": len(raw), "paragraphs_nonempty": len(source_nonempty),
                   "words": source_words, "pages_by_section_breaks": page_count,
                   "scripture_reference_count": sum(source_refs.values())},
        "chapters": [{"order": c["order"], "title": c["title"], "source_heading": c["source_heading"],
                      "page": c["page"]} for c in chapters],
        "merge_log": merge_log,
        "records": len(records),
    }
    (out_dir / "_build_stats.json").write_text(json.dumps(stats, ensure_ascii=False, indent=2), encoding="utf-8")
    print(json.dumps({k: v for k, v in stats.items() if k != "merge_log"}, ensure_ascii=False, indent=1))


if __name__ == "__main__":
    main(Path(sys.argv[1]), Path(sys.argv[2]))
