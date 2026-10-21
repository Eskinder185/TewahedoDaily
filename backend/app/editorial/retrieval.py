from __future__ import annotations

from typing import Any, Optional

from .approval_store import ApprovalStore
from .catalog import BookCatalog
from .release import ReleaseManifest
from .library import ApprovedBookLibrary


def retrieve_for_search_buddy(
    catalog: BookCatalog,
    query: str,
    *,
    store: Optional[ApprovalStore] = None,
    release: Optional[ReleaseManifest] = None,
    language: Optional[str] = None,
    limit: int = 5,
) -> list[dict[str, Any]]:
    """Public Search Buddy book retrieval gate.

    Returns only individually released variants whose complete approval chain
    is valid. Current drafts yield an empty list. Not wired into /api/chat.
    """
    library = ApprovedBookLibrary(catalog, store=store, release=release)
    return library.search(query, language=language, limit=limit)
