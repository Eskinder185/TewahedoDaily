"""Explain empty Search Buddy book retrieval without opening a public route."""

from __future__ import annotations

from typing import Any, Optional

from .catalog import BookCatalog
from .ingestion import is_approved_for_qdrant
from .library import ApprovedBookLibrary
from .release import ReleaseManifest, paragraph_allowed
from .search_index import BookSearchIndex


def diagnose_package_retrieval(
    catalog: BookCatalog,
    *,
    store=None,
    release: Optional[ReleaseManifest] = None,
    sample_query: str = "Trinity baptism sacrament ሥላሴ ጥምቀት",
) -> dict[str, Any]:
    """Separate approval filtering from parse / index / language issues."""
    paragraphs = list(catalog.iter_paragraphs())
    total = len(paragraphs)
    package_true = sum(1 for p in paragraphs if p.approved_for_ingestion is True)
    unresolved = sum(1 for p in paragraphs if p.unresolved_issue_ids)
    with_am = sum(1 for p in paragraphs if p.has_amharic_source)
    parse_ok = total > 0 and all(p.id and p.document_id for p in paragraphs)

    qdrant_eligible = sum(1 for p in paragraphs if is_approved_for_qdrant(p, store))
    release_eligible = sum(
        1 for p in paragraphs if paragraph_allowed(p, catalog, store)
    )

    library = ApprovedBookLibrary(catalog, store=store, release=release)
    buddy_hits = library.search(sample_query, limit=5)

    # Private editorial lexical index (unapproved drafts included for staff preview).
    private_index = BookSearchIndex(catalog)
    private_en = private_index.search("Trinity", limit=5)
    private_am = private_index.search("ሥላሴ", limit=5)
    if not private_am:
        private_am = private_index.search("ጥምቀት", has_amharic_source=True, limit=5)

    if package_true == 0 and not buddy_hits:
        cause = "approval_filter"
        detail = (
            "All reading records have approved_for_ingestion=false. "
            "Search Buddy retrieval correctly returns no hits. "
            "This is not a parse failure or missing Ethiopic index."
        )
    elif package_true > 0 and qdrant_eligible == 0:
        cause = "approval_chain_incomplete"
        detail = (
            "Some package flags are true but release/sign-off chain or "
            "unresolved issues still block retrieval."
        )
    elif not parse_ok:
        cause = "parse_failure"
        detail = "Catalog paragraphs failed basic identity checks."
    elif not private_en and not private_am:
        cause = "index_unavailable"
        detail = "Private lexical index returned no EN/AM sample hits."
    else:
        cause = "other"
        detail = "See counts; investigate release grants and language filters."

    return {
        "sample_query": sample_query,
        "parsing_ok": parse_ok,
        "paragraph_count": total,
        "approved_for_ingestion_true": package_true,
        "with_unresolved_issues": unresolved,
        "with_amharic_source": with_am,
        "qdrant_gate_eligible": qdrant_eligible,
        "full_release_chain_eligible": release_eligible,
        "search_buddy_hit_count": len(buddy_hits),
        "search_buddy_hits": buddy_hits,
        "private_lexical_english_hits": len(private_en),
        "private_lexical_amharic_hits": len(private_am),
        "private_lexical_sample": {
            "en": [
                {
                    "paragraph_id": h.paragraph_id,
                    "document_id": h.document_id,
                    "score": h.score,
                }
                for h in private_en[:3]
            ],
            "am": [
                {
                    "paragraph_id": h.paragraph_id,
                    "document_id": h.document_id,
                    "score": h.score,
                    "has_amharic_source": h.has_amharic_source,
                }
                for h in private_am[:3]
            ],
        },
        "empty_public_retrieval_cause": cause,
        "detail": detail,
        "public_search_buddy_route": "not_wired",
        "evaluation_scope": "private_editorial_diagnostics_only",
        "flags_mutated": False,
    }
