"""Source-aligned, nonoverlapping real-content chunks for unapproved research."""
from __future__ import annotations

from collections import Counter
from pathlib import Path
import hashlib
import json
import uuid

from editorial.catalog import load_catalog
from editorial.ingestion import build_ingest_candidates
from editorial.release import digest

NAMESPACE = uuid.UUID("ee661830-096b-4acd-b5be-f0eafbbf5168")
RESEARCH = "tewahedo_unapproved_research_v1"


def write_json(path: Path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    tmp = path.with_suffix(path.suffix + ".tmp")
    tmp.write_text(json.dumps(value, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    tmp.replace(path)


def split_exact(text, tokenizer, max_tokens):
    """Partition at tokenizer character offsets; never truncate, overlap or alter text."""
    encoded = tokenizer.encode(text, add_special_tokens=False)
    boundaries = sorted({0, len(text)} | {encoded.offsets[i][0]
                        for i in range(max_tokens, len(encoded.ids), max_tokens)})
    parts = [(a, b) for a, b in zip(boundaries, boundaries[1:]) if b > a]
    assert "".join(text[a:b] for a, b in parts) == text
    return parts


def build_corpus(package: Path, tokenizer, *, max_body_tokens=256):
    catalog = load_catalog(str(package))
    variants = build_ingest_candidates(catalog)
    atoms, omitted = [], []
    for c in variants:
        # F01 original English and edited English substantially duplicate each other.
        # Preserve verbatim originals as evidence, index the reading edition once.
        if c.document_id == "F01" and c.content_kind == "original_source":
            omitted.append(c.point_id)
            continue
        p = catalog.get_paragraph(c.paragraph_id)
        provenance = {
            "reading": p.raw, "source_records": [s.raw for s in p.source_attributions],
            "reference_evidence": list(p.reference_evidence),
            "confidence": [{"source_id": s.unit_id, "confidence": s.raw.get("confidence"),
                            "confidence_definition": s.raw.get("confidence_definition"),
                            "uncertain_spans": s.raw.get("uncertain_spans", [])}
                           for s in p.source_attributions],
        }
        for start, end in split_exact(c.text, tokenizer, max_body_tokens):
            atoms.append({"variant_id": c.point_id, "text": c.text[start:end], "start": start, "end": end,
                          "citation": c.payload, "provenance": provenance})
    # Contextual packing stays within book, section, language and content kind.
    streams = {}
    for atom in atoms:
        p = atom["citation"]
        stream_key = (p["document_id"], p["section_id"], p["language"], p["content_kind"])
        streams.setdefault(stream_key, []).append(atom)
    atoms_for_packing = [a for stream in streams.values() for a in stream]
    groups = []
    current, key, size = [], None, 0
    for atom in atoms_for_packing:
        p = atom["citation"]
        next_key = (p["document_id"], p["section_id"], p["language"], p["content_kind"])
        n = len(tokenizer.encode(atom["text"], add_special_tokens=False).ids)
        if current and (next_key != key or size + n + 2 > max_body_tokens):
            groups.append(current); current, size = [], 0
        key = next_key
        current.append(atom); size += n + 2
    if current: groups.append(current)
    chunks = []
    for group in groups:
        first = group[0]["citation"]
        text, spans = "", []
        for atom in group:
            if text: text += "\n\n"
            offset = len(text)
            text += atom["text"]
            spans.append({**atom, "chunk_start": offset, "chunk_end": len(text)})
        identity = [(s["variant_id"], s["start"], s["end"]) for s in spans]
        cid = str(uuid.uuid5(NAMESPACE, digest(identity)))
        # Context is labeled metadata; it does not alter the source passage.
        context = f"{first['book_title']} / {first['section_title']} / {first['content_kind']}"
        chunks.append({"id": cid, "text": text, "context": context,
                       "document_id": first["document_id"], "book_title": first["book_title"],
                       "section_id": first["section_id"], "section_title": first["section_title"],
                       "language": first["language"], "content_kind": first["content_kind"],
                       "paragraph_ids": list(dict.fromkeys(s["citation"]["paragraph_id"] for s in spans)),
                       "source_unit_ids": list(dict.fromkeys(i for s in spans for i in s["citation"]["source_unit_ids"])),
                       "spans": spans, "text_sha256": hashlib.sha256(text.encode("utf-8")).hexdigest(),
                       "approved_for_ingestion": False, "public_retrieval_eligible": False,
                       "research_only": True, "namespace": RESEARCH,
                       "editorial_status": "UNAPPROVED RESEARCH MATERIAL — not verified theology",
                       "original_approval_flags": [s["citation"]["approved_for_ingestion"] for s in spans]})
    # Atom reconstruction verifies all selected real variant text, including Unicode.
    by_variant = {}
    for atom in atoms: by_variant.setdefault(atom["variant_id"], []).append(atom)
    for c in variants:
        if c.point_id in by_variant:
            assert "".join(a["text"] for a in by_variant[c.point_id]) == c.text
    require_ids = {p.id for p in catalog.iter_paragraphs()}
    assert {i for c in chunks for i in c["paragraph_ids"]} == require_ids
    fingerprint = digest([(c["id"], c["text_sha256"], digest(c["spans"])) for c in chunks])
    stats = {"namespace": RESEARCH, "corpus_sha256": fingerprint,
             "source_manifest_sha256": hashlib.sha256((package / "SHA256SUMS.txt").read_bytes()).hexdigest(),
             "reading_paragraphs": len(require_ids), "candidate_variants": len(variants),
             "indexed_variants": len(by_variant), "omitted_duplicate_f01_originals": len(omitted),
             "chunks": len(chunks), "max_body_tokens": max_body_tokens,
             "by_book": dict(Counter(c["document_id"] for c in chunks)),
             "by_language": dict(Counter(c["language"] for c in chunks)),
             "by_kind": dict(Counter(c["content_kind"] for c in chunks)),
             "all_readings_covered": True, "exact_variant_reconstruction": True,
             "approved_for_ingestion": False, "public_retrieval_eligible": False}
    return chunks, stats
