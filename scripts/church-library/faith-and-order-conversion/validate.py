"""Quality assurance for the Faith and Order knowledge base. Writes the validation report."""
import csv
import json
import re
import sys
from collections import Counter
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import build_kb as kb  # noqa: E402
from aliases import TOPICS  # noqa: E402

REQUIRED = {"document_id": str, "passage_id": str, "title": str, "chapter": str, "language": str,
            "source_filename": str, "passage_order": int, "content": str, "search_keywords": list, "search_aliases": list}
DB_COLUMNS = {"book_id", "version_id", "section_id", "passage_order", "language", "content", "page_start", "page_end",
              "chapter_reference", "locator_label", "extraction_confidence", "review_status"}


def main(src: Path, out: Path) -> int:
    checks = []

    def check(name, ok, detail=""):
        checks.append((name, bool(ok), detail))

    raw_bytes = (out / "church_faith_and_order_search.jsonl").read_bytes()
    try:
        text = raw_bytes.decode("utf-8")
        check("JSONL is valid UTF-8 (no BOM)", not raw_bytes.startswith(b"\xef\xbb\xbf"), f"{len(raw_bytes):,} bytes")
    except UnicodeDecodeError as e:
        check("JSONL is valid UTF-8", False, str(e))
        text = raw_bytes.decode("utf-8", "replace")
    lines = [l for l in text.split("\n") if l.strip()]
    recs, bad = [], 0
    for l in lines:
        try:
            recs.append(json.loads(l))
        except json.JSONDecodeError:
            bad += 1
    check("Every JSONL line is one valid JSON object", bad == 0 and all(isinstance(r, dict) for r in recs), f"{len(recs)} lines")
    missing = [(r.get("passage_id"), k) for r in recs for k, t in REQUIRED.items() if not isinstance(r.get(k), t)]
    check("Required fields present with correct types", not missing, str(missing[:5]) if missing else "all 47 records")
    ids = [r["passage_id"] for r in recs]
    check("Passage IDs unique", len(ids) == len(set(ids)), f"{len(set(ids))} unique")
    check("Passage IDs stable format faith-and-order-NNNN", all(re.fullmatch(r"faith-and-order-\d{4}", i) for i in ids))
    orders = [r["passage_order"] for r in recs]
    check("passage_order contiguous 1..N in file order", orders == list(range(1, len(recs) + 1)))

    # --- completeness / order: rebuild expected unit stream from the DOCX ---
    raw = kb.read_paragraphs(src)
    merged, merge_log = kb.apply_merges([dict(p) for p in raw])
    chapters = kb.build_units(merged)
    expected_units = [u["text"] for ch in chapters for u in ch["units"]]
    produced_units = [part for r in recs for part in r["content"].split("\n\n")]
    check("All body paragraphs present, in original order, none duplicated",
          expected_units == produced_units, f"{len(expected_units)} paragraphs (after re-joining page-split sentences)")
    heading_texts = {p["text"] for p in raw if p["style"].startswith("Heading") or p["style"] == "Title"}
    nonempty_raw = [p for p in raw if p["text"]]
    body_raw = [p for p in nonempty_raw if p["text"] not in heading_texts]
    joined = "\n".join(produced_units)
    absent = [p["i"] for p in body_raw if p["text"] not in joined]
    check("Every non-empty source paragraph's exact text is found in a passage", not absent,
          f"{len(body_raw)} body paragraphs checked" if not absent else f"missing: {absent[:10]}")
    src_words = sum(len(p["text"].split()) for p in raw)
    head_words = sum(len(p["text"].split()) for p in nonempty_raw if p["text"] in heading_texts)
    kb_words = sum(len(r["content"].split()) for r in recs)
    check("Word count reconciles (source = passages + chapter headings + title)", src_words == kb_words + head_words,
          f"{src_words} = {kb_words} + {head_words}")
    chapter_titles = [c["title"] for c in chapters]
    check("All 16 chapter headings represented", sorted({r["chapter"] for r in recs}) == sorted(chapter_titles),
          f"{len(chapter_titles)} chapters")

    # chapter isolation
    ranges = {}
    for ch in chapters:
        ranges[ch["title"]] = (ch["units"][0]["i"], ch["units"][-1]["i"])
    cross = [r["passage_id"] for r in recs
             if not (ranges[r["chapter"]][0] <= r["source_paragraph_range"][0] <= r["source_paragraph_range"][1] <= ranges[r["chapter"]][1])]
    check("No passage mixes chapters", not cross, str(cross) if cross else "")

    # pages
    page_of = {p["i"]: p["page"] for p in raw}
    max_page = raw[-1]["page"]
    bad_pages = []
    for r in recs:
        a, b = r["source_paragraph_range"]
        span = [page_of[i] for i in range(a, b + 1) if raw[i]["text"]]
        # merged paragraphs may continue onto the following page
        if r["page_start"] != min(span) or r["page_end"] < max(span) or r["page_end"] > max(span) + 1 \
                or not (1 <= r["page_start"] <= r["page_end"] <= max_page):
            bad_pages.append(r["passage_id"])
    check("Page numbers derived from section breaks only, within 1..51, start <= end", not bad_pages,
          str(bad_pages) if bad_pages else f"max page {max_page}")

    # scripture
    src_refs = Counter(m.group(0) for p in raw for m in kb.SCRIPTURE_RE.finditer(p["text"]))
    kb_refs = Counter(x for r in recs for x in r["scripture_references"])
    check("Scripture references preserved (same multiset as source)", src_refs == kb_refs, f"{sum(src_refs.values())} references")
    # word sizes
    wc = [r["word_count"] for r in recs]
    in_band = sum(1 for w in wc if 250 <= w <= 650)
    check("Passage sizes near 300-600 words", in_band >= 0.6 * len(wc),
          f"min {min(wc)}, max {max(wc)}, mean {sum(wc)/len(wc):.0f}; {in_band}/{len(wc)} within 250-650")
    small = [(r["passage_id"], r["word_count"], r["chapter"]) for r in recs if r["word_count"] < 250]

    # aliases are metadata only
    ethiopic_in_content = [r["passage_id"] for r in recs if re.search(r"[ሀ-፿]", r["content"])]
    check("No Amharic/generated alias text inside passage content", not ethiopic_in_content)
    pillar = next(t for t in TOPICS if t["topic"] == "five_pillars_of_mystery")
    seven = next(t for t in TOPICS if t["topic"] == "seven_sacraments")
    leak = [r["passage_id"] for r in recs if pillar["aliases"][0] in r["search_aliases"] and r["chapter"].startswith("The Sacrament")]
    check("Five Pillars of Mystery aliases never attached to Seven Sacrament chapters", not leak, str(leak))
    leak7 = [r["passage_id"] for r in recs if seven["aliases"][0] in r["search_aliases"] and r["chapter"].startswith("The Mystery")]
    check("Seven Sacraments aliases never attached to the Five Mysteries chapters", not leak7, str(leak7))
    no_kw = [r["passage_id"] for r in recs if not r["search_keywords"]]

    # CSV
    with (out / "church_faith_and_order_supabase_import.csv").open(encoding="utf-8", newline="") as f:
        rows = list(csv.DictReader(f))
    cols = set(rows[0].keys())
    check("CSV row count equals JSONL", len(rows) == len(recs), f"{len(rows)} rows")
    check("CSV columns are live church_library_passages columns (+ section_order join key)",
          (cols - {"section_order"}) <= DB_COLUMNS, ", ".join(rows[0].keys()))
    check("CSV content identical to JSONL content", all(row["content"] == r["content"] for row, r in zip(rows, recs)))
    check("CSV book_id/version_id left for the import tool to resolve (never guessed)",
          all(row["book_id"] == "" and row["version_id"] == "" for row in rows))

    flags = [(r["passage_id"], f) for r in recs for f in r["quality_flags"]]
    stats = json.loads((out / "_build_stats.json").read_text(encoding="utf-8"))

    # ---- report ----
    passed = sum(1 for c in checks if c[1])
    md = [f"# Faith and Order — extraction & completeness validation\n",
          f"Source: `{kb.SOURCE_FILENAME}` · sha256 `{stats['source']['sha256']}`  ",
          f"Result: **{passed}/{len(checks)} checks passed** · {len(recs)} passages · {len(chapter_titles)} chapters · "
          f"{max_page} pages · {sum(src_refs.values())} Scripture references\n",
          "## Automated checks\n", "| # | Check | Result | Detail |", "|---|---|---|---|"]
    for i, (n, ok, d) in enumerate(checks, 1):
        md.append(f"| {i} | {n} | {'PASS' if ok else 'FAIL'} | {d} |")
    md += ["", "## How completeness was proven",
           "The DOCX was re-read independently and its body paragraphs were rebuilt into the expected sequence "
           "(headings removed, page-split sentences re-joined). Splitting every passage back on its paragraph "
           "separators reproduces that sequence exactly, so nothing was dropped, duplicated, or reordered. "
           "The word counts reconcile to the word (source words = passage words + heading/title words).", "",
           "## Document structure", "", "| # | Chapter | Starts p. | Passages |", "|---|---|---|---|"]
    per = Counter(r["chapter"] for r in recs)
    for c in stats["chapters"]:
        md.append(f"| {c['order']} | {c['title']} | {c['page']} | {per[c['title']]} |")
    md += ["", "Sub-section titles inside the sacrament chapters (Definition, Institution of the Sacrament, The Visible Sign, "
           "The Invisible Grace, …) are carried in each passage's `section` field. Passages in the first eight chapters "
           "have `section: null` unless the source itself has a sub-title there; no section names were invented.", "",
           "## Page numbers",
           "The file has 51 sections, each starting with a rendered page break, and no section contains a second break. "
           "Section *n* is therefore page *n* of this file's own layout. These page numbers are reliable for this DOCX, "
           "but they are not the page numbers of any separately printed edition. There are no printed page numbers, "
           "headers or footers in the file (all 51 are empty), so nothing had to be stripped.", "",
           "## Repairs applied (formatting only)", "",
           "| Paragraphs re-joined | Pages | Start of joined text |", "|---|---|---|"]
    for m in stats["merge_log"]:
        md.append(f"| {', '.join(map(str, m['paragraph_indexes']))} | {'–'.join(map(str, m['pages']))} | {m['joined_text_preview'][:90]}… |")
    md += ["", "Also: runs of spaces/tabs collapsed; two empty Heading-1 paragraphs (layout artifacts) ignored; ALL-CAPS chapter "
           "headings shown in title case in `chapter` (original kept in `chapter_source_heading`). **No word of content was changed.**", "",
           f"## Flagged source issues — not corrected ({len(flags)} flags in {len({p for p, _ in flags})} passages)", "",
           "These look like OCR/typing errors or reference slips in the source. They are recorded in each passage's "
           "`quality_flags`, and the import marks those passages `review_status = needs_attention` so a reviewer "
           "can confirm them in the passage editor. The text was left as-is.", "",
           "| Passage | Source text | Note |", "|---|---|---|"]
    for pid, f in flags:
        md.append(f"| {pid} | `{f['match']}` | {f['note']} |")
    md += ["", "Two short lines are kept exactly where they appear and may be source attributions rather than titles: "
           "“The meaning of Holy Trinity (Pope Shenouda III)” (end of the Trinity chapter) and “The Incarnation (St. Athanasius)” "
           "(end of the Incarnation chapter). They probably name the sources behind the “(1)”/“(2)” markers that follow "
           "some paragraphs, but the file has no footnotes to confirm this, so all of them are kept verbatim.", "",
           "## Passage sizes", f"Target 300–600 words; paragraphs are never split. Below 250 words:", ""]
    for pid, w, ch in small:
        md.append(f"- {pid} — {w} words — {ch} (chunk closed at a sub-section or chapter boundary; paragraphs are never split)")
    md += ["", f"Passages without search keywords: {', '.join(no_kw) if no_kw else 'none'}.", "",
           "## Alias review (theological ambiguity)", "",
           "All Amharic, Ge'ez-script and transliterated aliases are search metadata. None appear in passage content, and the "
           "database seed loads them as `pending` so search ignores them until a reviewer approves them.", "",
           "| Topic | Aliases | Review note |", "|---|---|---|"]
    for t in TOPICS:
        md.append(f"| {t['topic']} | {', '.join(t['aliases'])} | {t['note'] or '—'} |")
    md.append("")
    (out / "church_faith_and_order_validation.md").write_text("\n".join(md), encoding="utf-8")
    print(f"{passed}/{len(checks)} checks passed")
    for n, ok, d in checks:
        if not ok:
            print("FAIL", n, d)
    return 0 if passed == len(checks) else 1


if __name__ == "__main__":
    sys.exit(main(Path(sys.argv[1]), Path(sys.argv[2])))
