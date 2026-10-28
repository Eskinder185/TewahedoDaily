"""Write church_faith_and_order_manifest.json from build stats and the JSONL."""
import json
import sys
from collections import Counter
from datetime import datetime, timezone
from pathlib import Path


def main(out_dir: Path) -> None:
    stats = json.loads((out_dir / "_build_stats.json").read_text(encoding="utf-8"))
    recs = [json.loads(l) for l in (out_dir / "church_faith_and_order_search.jsonl").read_text(encoding="utf-8").splitlines() if l.strip()]
    sections = json.loads((out_dir / "church_faith_and_order_sections.json").read_text(encoding="utf-8"))
    aliases = json.loads((out_dir / "church_faith_and_order_aliases.json").read_text(encoding="utf-8"))
    flags = [f for r in recs for f in r["quality_flags"]]
    wc = [r["word_count"] for r in recs]
    per_chapter = Counter(r["chapter"] for r in recs)
    manifest = {
        "document_id": "faith-and-order-of-the-church",
        "title": "The Faith And Order Of The Church",
        "language": "en",
        "source": {
            "filename": "The Faith And Order Of The Church (2)(4).docx",
            "received_as": "The_Faith_And_Order_Of_The_Church_2.docx",
            "sha256": stats["source"]["sha256"],
            "format": "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
            "page_count": stats["source"]["pages_by_section_breaks"],
            "paragraphs_total": stats["source"]["paragraphs_total"],
            "paragraphs_nonempty": stats["source"]["paragraphs_nonempty"],
            "word_count": stats["source"]["words"],
            "tables": 0,
            "headers_footers": "none present (all 51 section headers/footers are empty)",
            "author": None,
            "rights_status": "unknown — must be set by an administrator before public retrieval",
        },
        "page_mapping": {
            "basis": "docx_section_breaks",
            "description": ("The DOCX contains 51 sections; each begins with a rendered page break and no "
                            "section contains a second one, so section N = page N of the source file's own "
                            "layout. Page numbers refer to this file's layout (51 pages), not to any separately "
                            "printed edition. No printed page numbers exist in the file."),
            "reliable_for_this_file": True,
        },
        "processing_summary": {
            "generated_at": datetime.now(timezone.utc).isoformat(timespec="seconds"),
            "pipeline": "build_kb.py (python-docx) — deterministic; same input yields same IDs",
            "chapters": len(stats["chapters"]),
            "sections": len(sections),
            "passages": len(recs),
            "passage_words": {"min": min(wc), "max": max(wc), "mean": round(sum(wc) / len(wc), 1), "total": sum(wc)},
            "target_words_per_passage": "300-600 (paragraphs never split; a short chapter or tail may fall below)",
            "passages_per_chapter": dict(per_chapter),
            "paragraph_merges_across_page_breaks": len(stats["merge_log"]),
            "quality_flags": len(flags),
            "passages_with_quality_flags": sum(1 for r in recs if r["quality_flags"]),
            "scripture_references_in_source": stats["source"]["scripture_reference_count"],
            "scripture_references_in_passages": sum(len(r["scripture_references"]) for r in recs),
            "search_aliases_defined": len(aliases),
            "extraction_quality": "good",
            "extraction_notes": ("Complete text extraction from DOCX (no OCR). 15 sentences split by page breaks "
                                 "were re-joined. One paragraph begins mid-sentence in the source (p. 2) and "
                                 f"{len(flags)} likely source typos are flagged, not corrected. Passages with flags "
                                 "are marked needs_attention for reviewer confirmation."),
            "repairs_applied": [
                "Whitespace normalization (runs of spaces/tabs/non-breaking spaces collapsed)",
                "Re-joined paragraphs split mid-sentence at page breaks (see merge_log)",
                "Re-joined a sentence broken across five list items on p. 40 (Unction of the Sick definition)",
                "ALL-CAPS chapter headings shown in title case in the 'chapter' field (original kept in chapter_source_heading)",
                "Empty Heading-1 paragraphs (layout artifacts) ignored",
            ],
            "not_changed": [
                "No word of source content was corrected, translated, reordered or removed",
                "Likely typos and reference errors are flagged in quality_flags only",
            ],
        },
        "chapters": stats["chapters"],
        "merge_log": stats["merge_log"],
        "outputs": {
            "church_faith_and_order_search.jsonl": "one passage per line (search knowledge base)",
            "church_faith_and_order_sections.json": "section rows for public.church_library_sections",
            "church_faith_and_order_supabase_import.csv": "schema-compatible passage rows; book_id/version_id resolved at import",
            "church_faith_and_order_aliases.json": "multilingual alias vocabulary (search metadata only)",
            "church_faith_and_order_validation.md": "extraction quality and completeness checks",
            "church_faith_and_order_search_tests.md": "retrieval test results",
        },
        "database_target": {
            "tables": ["public.church_library_books (existing row)", "public.church_library_book_versions (existing active version)",
                       "public.church_library_sections", "public.church_library_passages"],
            "column_mapping": {
                "chapter": "church_library_passages.chapter_reference",
                "section": "church_library_passages.locator_label",
                "page_start/page_end": "church_library_passages.page_start / page_end",
                "passage_order": "church_library_passages.passage_order",
                "content": "church_library_passages.content (search_document tsvector maintained by trigger)",
                "search_keywords/search_aliases": "not stored per passage; aliases go to the proposed church_library_search_aliases table",
            },
            "import_tool": "scripts/import-church-library-passages.mjs (dry run by default; --apply needs service-role key)",
            "public_retrieval_after_import": False,
        },
    }
    (out_dir / "church_faith_and_order_manifest.json").write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print("manifest written")


if __name__ == "__main__":
    main(Path(sys.argv[1]))
