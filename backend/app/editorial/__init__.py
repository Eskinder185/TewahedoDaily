"""Editorial five-book library helpers (private preview + approval-gated ingest).

Package files under content-review/ are treated as read-only. Human approval
decisions live in a separate overlay store and never auto-flip package flags.
"""

from .approval_store import ApprovalStore
from .catalog import BookCatalog, load_catalog
from .ingestion import IngestCandidate, QdrantIngestionPipeline, build_ingest_candidates, filter_approved
from .library import ApprovedBookLibrary
from .release import ReleaseManifest
from .integrity import verify_package_integrity
from .retrieval import retrieve_for_search_buddy
from .search_index import BookSearchIndex

__all__ = [
    "ApprovalStore",
    "ApprovedBookLibrary",
    "BookCatalog",
    "BookSearchIndex",
    "IngestCandidate",
    "QdrantIngestionPipeline",
    "ReleaseManifest",
    "build_ingest_candidates",
    "filter_approved",
    "load_catalog",
    "retrieve_for_search_buddy",
    "verify_package_integrity",
]
