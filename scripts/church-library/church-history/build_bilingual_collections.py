#!/usr/bin/env python3
"""Build aligned draft Church History collections from paired DOCX extractions.

The DOCX files remain the source of truth.  Their structure JSON files are created
by extract_docx_structure.py; Word's document translator supplies a structurally
identical English draft.  This script never publishes or touches Supabase.
"""

from __future__ import annotations

import hashlib
import json
import re
import shutil
import sys
import zipfile
from collections import Counter
from dataclasses import dataclass, field
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
BASE = ROOT / "content" / "church-library" / "church-history"
ANALYSIS = BASE / "_source_analysis"


@dataclass
class Section:
    id: str
    level: int
    title_am: str | None
    title_en: str | None
    parent_id: str
    paragraphs: list[dict] = field(default_factory=list)


@dataclass
class Chapter:
    id: str
    number: int
    source_heading_am: str
    title_am: str
    title_en: str
    kind: str
    sections: list[Section] = field(default_factory=list)


COLLECTIONS = {
    "world": {
        "prefix": "CHW",
        "slug": "world-history",
        "collection": "world-church-history",
        "title_am": "የቤተ ክርስቲያን ታሪክ በዓለም መድረክ",
        "title_en": "Church History on the World Stage",
        "source": "2-Church_History_World_Clean.docx",
        "am_json": "2-Church_History_World_Clean.structure.json",
        "en_json": "Church_History_World_English_Auto.structure.json",
        "merged_stem": "church_history_world",
        "zip": "church-history-world-bilingual-final.zip",
    },
    "ethiopia": {
        "prefix": "CHE",
        "slug": "ethiopia-history",
        "collection": "ethiopian-church-history",
        "title_am": "የኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ቤተ ክርስቲያን ታሪክ",
        "title_en": "History of the Ethiopian Orthodox Tewahedo Church",
        "source": "1-Church_History_Ethiopia_Clean.docx",
        "am_json": "1-Church_History_Ethiopia_Clean.structure.json",
        "en_json": "Church_History_Ethiopia_English_Auto.structure.json",
        "merged_stem": "church_history_ethiopia",
        "zip": "church-history-ethiopia-bilingual-final.zip",
    },
}


HEADING_OVERRIDES = {
    "መቅድም": "Foreword",
    "መግቢያ": "Introduction",
    "ማጠቃለያ": "Conclusion",
    "ዋቢ መጻሕፍት": "References",
    "የሕገ ልቡና ዘመን": "The Era of the Law of Conscience",
    "የሕገ ኦሪት ዘመን": "The Era of the Law of the Torah",
    "የሕገ ወንጌል ዘመን": "The Era of the Law of the Gospel",
    "ጥምቀተ ሐዋርያት": "The Baptism of the Apostles",
    "ሐዋርያት መቼ ቆረቡ": "When Did the Apostles Receive Holy Communion?",
    "የሥርዓተ ምንኩስና አጀማመር": "The Beginning of the Monastic Order",
    "የኒቂያ ጉባኤ": "The Council of Nicaea",
    "የቁስጥንጥንያ ጉባኤ": "The Council of Constantinople",
    "የኤፌሶን ጉባኤ": "The Council of Ephesus",
    "የኬልቄዶን ጉባኤ": "The Council of Chalcedon",
    "ቅዱስ ፍሬምናጦስ (አባ ሰላማ)": "Saint Frumentius (Abba Salama)",
    "ዘጠኙ ቅዱሳን": "The Nine Saints",
    "ተሰዓቱ ቅዱሳን": "The Nine Saints",
    "ቅዱስ ላሊበላ": "Saint Lalibela",
    "ቅዱስ ነአኩቶ ለአብ": "Saint Na’akueto La’ab",
}

SUSPICIOUS = re.compile(
    r"\b(?:Allah|Goa|Swarovski|King of the Jungle|leftist|spam|click here|constitution)\b",
    re.I,
)
ETHIOPIC = re.compile(r"[\u1200-\u137f]")
VERSE = re.compile(r"(?:[A-Za-z]{2,}|[\u1200-\u137f]{2,})\.?\s*\d+\s*[:÷፡]\s*\d+(?:[-–]\d+)?")


def load(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def q(value: str) -> str:
    return json.dumps(value, ensure_ascii=False)


def slug(text: str, fallback: str) -> str:
    s = text.lower().replace("’", "").replace("'", "")
    s = re.sub(r"[^a-z0-9]+", "-", s).strip("-")
    return (s[:60].rstrip("-") or fallback)


def heading_en(am: str, machine: str) -> str:
    if am in HEADING_OVERRIDES:
        return HEADING_OVERRIDES[am]
    out = machine.strip()
    replacements = {
        "Bishop Swarovski": "Saint Frumentius (Abba Salama)",
        "King of the Jungle": "Emperor Yekuno Amlak",
        "Constitution": "Law of Conscience",
    }
    for old, new in replacements.items():
        out = out.replace(old, new)
    return out


def clean_english(am: str, en: str, index: int, key: str) -> str:
    # Correct one catastrophic translator substitution in the World introduction.
    if "ቅዱስ ጳውሎስ" in am and "Allah" in en:
        return (
            "As the Apostle Saint Paul taught us, “Remember your leaders who spoke the word of God to you; "
            "consider the outcome of their conduct and imitate their faith” (Hebrews 13:7), we study this "
            "teaching so that, remembering the prophets who prophesied, the apostles who taught the Gospel, "
            "and our righteous and martyr fathers who suffered for the honor of the Gospel, we may imitate "
            "their faith and conduct, follow their example, and serve our God well."
        )
    return en.strip()


def classify_kind(am: str) -> str:
    if "ዋቢ" in am or "ማጣቀሻ" in am:
        return "back_matter"
    if "ማጠቃለያ" in am:
        return "conclusion"
    return "chapter"


def build_structure(cfg: dict) -> tuple[list[Chapter], dict, dict]:
    am_doc = load(ANALYSIS / cfg["am_json"])
    en_doc = load(ANALYSIS / cfg["en_json"])
    am = am_doc["paragraphs"]
    en = en_doc["paragraphs"]
    if len(am) != len(en):
        raise ValueError(f"Paragraph mismatch: {len(am)} Amharic, {len(en)} English")
    if [p["style"].lower() for p in am] != [p["style"].lower() for p in en]:
        raise ValueError("DOCX translation did not preserve paragraph styles")

    first_chapter = next(i for i, p in enumerate(am) if p["style"].lower() == "heading 1" and "ምዕራፍ" in p["text"])
    boundaries = [first_chapter] + [i for i, p in enumerate(am) if i > first_chapter and p["style"].lower() == "heading 1"]
    spans = [(0, first_chapter)] + [(start, boundaries[n + 1] if n + 1 < len(boundaries) else len(am)) for n, start in enumerate(boundaries)]
    chapters: list[Chapter] = []
    for chapter_no, (start, end) in enumerate(spans):
        cid = f"{cfg['prefix']}-{chapter_no:03d}"
        if chapter_no == 0:
            title_am, title_en, source_heading, kind = cfg["title_am"], cfg["title_en"], cfg["title_am"], "front_matter"
            body_start = start
        else:
            source_heading = am[start]["text"].strip()
            title_am = source_heading
            title_en = heading_en(source_heading, en[start]["text"])
            kind = classify_kind(source_heading)
            body_start = start + 1
        ch = Chapter(cid, chapter_no, source_heading, title_am, title_en, kind)
        current: Section | None = None
        section_no = 0
        para_no = 0

        def ensure_lead() -> Section:
            nonlocal current, para_no
            if current is None:
                current = Section(f"{cid}-S000", 2, None, None, cid)
                ch.sections.append(current)
                para_no = 0
            return current

        for pos in range(body_start, end):
            pa, pe = am[pos], en[pos]
            style = pa["style"].lower()
            if style.startswith("heading"):
                section_no += 1
                sid = f"{cid}-S{section_no:03d}"
                level = 2 if style in {"heading 1", "heading 2"} else 3
                parent = cid
                if level == 3:
                    prior_h2 = next((s.id for s in reversed(ch.sections) if s.level == 2), cid)
                    parent = prior_h2
                current = Section(sid, level, pa["text"].strip(), heading_en(pa["text"], pe["text"]), parent)
                ch.sections.append(current)
                para_no = 0
                continue
            sec = ensure_lead()
            para_no += 1
            pid = f"{sec.id}-P{para_no:03d}"
            text_am = pa["text"].strip()
            text_en = clean_english(text_am, pe["text"], pos, pid)
            block = "quotation" if style == "quote" else ("list_item" if "list" in style or "bullet" in style else "paragraph")
            flags = []
            if ETHIOPIC.search(text_en): flags.append("residual_ethiopic_in_english")
            if SUSPICIOUS.search(text_en): flags.append("suspicious_machine_translation")
            if abs(len(text_en) - len(text_am)) > max(450, len(text_am) * 2.4): flags.append("large_length_difference")
            sec.paragraphs.append({"id": pid, "am": text_am, "en": text_en, "block_type": block, "source_index": pa["index"], "review_flags": flags})
        chapters.append(ch)
    return chapters, am_doc, en_doc


def frontmatter(cfg: dict, ch: Chapter, lang: str) -> str:
    title = ch.title_am if lang == "am" else ch.title_en
    status = "original" if lang == "am" else "ai_translated_pending_review"
    return "\n".join([
        "---", f"id: {ch.id}", f"collection: {cfg['collection']}", f"language: {lang}",
        f"chapter_number: {ch.number}", f"title: {q(title)}", f"translation_status: {status}",
        "publication_status: draft", "---", "",
    ])


def render_chapter(cfg: dict, ch: Chapter, lang: str, include_frontmatter: bool = True) -> str:
    title = ch.title_am if lang == "am" else ch.title_en
    lines = [frontmatter(cfg, ch, lang)] if include_frontmatter else []
    lines += [f"# {title} {{#{ch.id}}}", ""]
    for sec in ch.sections:
        sec_title = sec.title_am if lang == "am" else sec.title_en
        if sec_title:
            marks = "##" if sec.level == 2 else "###"
            lines += [f"{marks} {sec_title} {{#{sec.id}}}", ""]
        else:
            lines += [f"<!-- section {sec.id} -->", ""]
        for p in sec.paragraphs:
            text = p[lang]
            if p["block_type"] == "quotation": text = "> " + text
            elif p["block_type"] == "list_item" and not re.match(r"^(?:[-*+] |\d+\. )", text): text = "- " + text
            lines += [f"<!-- {p['id']} -->", text, ""]
    return "\n".join(lines).rstrip() + "\n"


def write_json(path: Path, data: object) -> None:
    path.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


def build_collection(name: str, cfg: dict) -> dict:
    chapters, am_doc, en_doc = build_structure(cfg)
    out = BASE / cfg["slug"]
    if out.exists():
        shutil.rmtree(out)
    (out / "am").mkdir(parents=True)
    (out / "en").mkdir(parents=True)

    all_paras = [p for ch in chapters for sec in ch.sections for p in sec.paragraphs]
    all_secs = [sec for ch in chapters for sec in ch.sections]
    flagged = [p for p in all_paras if p["review_flags"]]
    refs = sorted(set(m.group(0) for p in all_paras for lang in ("am", "en") for m in VERSE.finditer(p[lang])))
    files = []
    for ch in chapters:
        base_slug = "introduction" if ch.number == 0 else slug(ch.title_en, f"chapter-{ch.number}")
        filename = f"{ch.number:02d}-{base_slug}.md"
        for lang in ("am", "en"):
            path = out / lang / filename
            path.write_text(render_chapter(cfg, ch, lang), encoding="utf-8")
            files.append(str(path.relative_to(out)).replace("\\", "/"))

    merged = {}
    for lang, label in (("am", "amharic"), ("en", "english")):
        path = out / f"{cfg['merged_stem']}_{label}.md"
        text = "\n".join(render_chapter(cfg, ch, lang) for ch in chapters)
        path.write_text(text, encoding="utf-8")
        merged[lang] = path.name

    bilingual_lines = [f"# {cfg['title_am']} / {cfg['title_en']}", "", "Publication status: **Draft — English requires expert review.**", ""]
    for ch in chapters:
        bilingual_lines += [f"# {ch.title_am} / {ch.title_en} {{#{ch.id}}}", ""]
        for sec in ch.sections:
            if sec.title_am or sec.title_en:
                bilingual_lines += [f"## {sec.title_am or ''} / {sec.title_en or ''} {{#{sec.id}}}", ""]
            for p in sec.paragraphs:
                bilingual_lines += [f"### {p['id']}", "", "**አማርኛ**", "", p["am"], "", "**English**", "", p["en"], ""]
    bilingual = out / f"{cfg['merged_stem']}_bilingual.md"
    bilingual.write_text("\n".join(bilingual_lines).rstrip() + "\n", encoding="utf-8")

    manifest_chapters = []
    for ch in chapters:
        manifest_chapters.append({
            "id": ch.id, "number": ch.number, "kind": ch.kind,
            "titles": {"am": ch.title_am, "en": ch.title_en},
            "source_heading_am": ch.source_heading_am,
            "sections": [{"id": s.id, "parent_id": s.parent_id, "level": s.level, "titles": {"am": s.title_am, "en": s.title_en}, "paragraph_ids": [p["id"] for p in s.paragraphs]} for s in ch.sections],
            "files": {"am": next(f for f in files if f.startswith("am/") and f.startswith(f"am/{ch.number:02d}-")), "en": next(f for f in files if f.startswith("en/") and f.startswith(f"en/{ch.number:02d}-"))},
        })
    manifest = {
        "schema_version": 1, "collection_id": cfg["collection"], "subject": cfg["collection"],
        "titles": {"am": cfg["title_am"], "en": cfg["title_en"]},
        "source_documents": {"am": {"file": cfg["source"], "sha256": am_doc["sha256"]}, "en_draft": {"file": cfg["en_json"], "generated_from": cfg["source"]}},
        "languages": {"am": {"status": "original"}, "en": {"status": "ai_translated_pending_review"}},
        "publication_status": "draft", "review_status": "expert_review_required",
        "chapter_count": len(chapters), "chapter_ids": [c.id for c in chapters],
        "section_ids": [s.id for s in all_secs], "paragraph_ids": [p["id"] for p in all_paras],
        "reading_order": [c.id for c in chapters], "chapters": manifest_chapters,
        "merged_files": {**merged, "bilingual": bilingual.name}, "biblical_references": refs,
        "content_completeness": {"source_nonempty_paragraphs": len(am_doc["paragraphs"]), "structural_headings": len(am_doc["paragraphs"]) - len(all_paras), "aligned_paragraphs": len(all_paras), "missing_translations": 0, "flagged_for_review": len(flagged)},
    }
    write_json(out / "manifest.json", manifest)

    alignments = []
    for ch in chapters:
        alignments.append({"id": ch.id, "type": "chapter", "am": ch.id, "en": ch.id, "status": "aligned"})
        for sec in ch.sections:
            alignments.append({"id": sec.id, "type": "section", "am": sec.id, "en": sec.id, "status": "aligned"})
            for p in sec.paragraphs:
                alignments.append({"id": p["id"], "type": "paragraph", "am": p["id"], "en": p["id"], "status": "aligned", "source_index": p["source_index"], "review_flags": p["review_flags"]})
    write_json(out / "alignment-map.json", {"schema_version": 1, "collection": cfg["collection"], "alignments": alignments})

    flag_counts = Counter(flag for p in flagged for flag in p["review_flags"])
    review_lines = ["# Translation Review", "", "Status: **Draft; expert Amharic/English theological review required before publication.**", "", f"All {len(all_paras)} paragraph blocks have English counterparts and stable matching IDs. The English edition was machine-translated and then structurally reconciled; this report does not claim that historical or theological verification is complete.", "", "## Automated review flags", ""]
    if flag_counts:
        review_lines += [f"- `{k}`: {v}" for k, v in sorted(flag_counts.items())]
    else:
        review_lines += ["- No heuristic flags were raised."]
    review_lines += ["", "## Flagged passages", ""]
    review_lines += [f"- `{p['id']}` (source paragraph {p['source_index']}): {', '.join(p['review_flags'])}" for p in flagged] or ["- None"]
    review_lines += ["", "## Editorial guidance", "", "Review names, Geʽez terminology, councils, quotations, dates, and Scripture references against the Amharic source. Keep IDs unchanged when revising English text. Do not publish until this review is complete.", ""]
    (out / "translation-review.md").write_text("\n".join(review_lines), encoding="utf-8")

    completeness = f"""# Completeness Report

- Source DOCX: `{cfg['source']}`
- Source SHA-256: `{am_doc['sha256']}`
- Source non-empty paragraphs: {len(am_doc['paragraphs'])}
- Source headings represented as Markdown headings: {len(am_doc['paragraphs']) - len(all_paras)}
- Aligned reading paragraphs: {len(all_paras)} Amharic / {len(all_paras)} English
- Chapters/files per language: {len(chapters)}
- Sections per language: {len(all_secs)}
- Missing English counterparts: 0
- Duplicate IDs: 0
- Broken alignment links: 0
- English passages flagged for expert review: {len(flagged)}

The source paragraph sequence was preserved. Heading paragraphs are represented as chapter or section headings rather than counted again as reading paragraphs. No source paragraph was silently discarded.
"""
    (out / "completeness-report.md").write_text(completeness, encoding="utf-8")

    readme = f"""# {cfg['title_en']}

Draft bilingual Church Library collection generated from `{cfg['source']}`.

## Import

1. Review `translation-review.md` and correct the English Markdown without changing IDs.
2. Run the repository validation script before import.
3. Use the existing structured Church Library importer with the files under `am/` and `en/`.
4. Keep `publication_status: draft` until expert review is complete.

`manifest.json` describes reading order and file paths; `alignment-map.json` maps every chapter, section, and paragraph. No database changes, migrations, imports, publication, or deployment are performed by this package.
"""
    (out / "README.md").write_text(readme, encoding="utf-8")

    # Internal deterministic validation before packaging.
    ids = [a["id"] for a in alignments]
    assert len(ids) == len(set(ids)), "duplicate structural IDs"
    assert all(p["am"] and p["en"] for p in all_paras), "empty translation"
    for lang in ("am", "en"):
        assert len(list((out / lang).glob("*.md"))) == len(chapters)
    json.loads((out / "manifest.json").read_text(encoding="utf-8"))
    json.loads((out / "alignment-map.json").read_text(encoding="utf-8"))

    zip_path = BASE / cfg["zip"]
    if zip_path.exists(): zip_path.unlink()
    with zipfile.ZipFile(zip_path, "w", compression=zipfile.ZIP_DEFLATED) as zf:
        for path in sorted(out.rglob("*")):
            if path.is_file(): zf.write(path, Path(cfg["slug"]) / path.relative_to(out))
    with zipfile.ZipFile(zip_path) as zf:
        bad = zf.testzip()
        assert bad is None, f"corrupt ZIP member: {bad}"

    return {"collection": cfg["collection"], "chapters": len(chapters), "sections": len(all_secs), "paragraphs": len(all_paras), "aligned": len(all_paras), "untranslated": 0, "flagged": len(flagged), "zip": str(zip_path)}


def main() -> int:
    results = [build_collection(name, cfg) for name, cfg in COLLECTIONS.items()]
    write_json(BASE / "build-validation-summary.json", {"status": "passed", "supabase_changes": False, "deployments": False, "collections": results})
    print(json.dumps(results, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    sys.exit(main())
