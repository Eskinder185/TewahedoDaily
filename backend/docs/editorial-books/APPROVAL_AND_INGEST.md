# Approval workflow and Qdrant gate

## Overlay vs package flags

| Layer | Purpose | Can open Qdrant? |
|-------|---------|------------------|
| `content-review` `approved_for_ingestion` | Authoritative package flag | **Required true** |
| `data/editorial_approvals.json` | Human intent / section-paragraph decisions | Cannot override false package flag; can **deny** package-true |
| Unresolved issue IDs | Blockers | Always block ingest |

Import/validation code **never** sets package flags to true.

## Reviewer steps (local)

1. Enable preview API with token.
2. Open `/admin/editorial-books`, paste token into session storage.
3. Review sections; use **Record overlay approval** for intent.
4. Resolve items in `review/Human_Approval_Queue.json` offline with qualified reviewers.
5. When ready, produce a new editorial export with selective `approved_for_ingestion=true` (manual/authorized process).
6. `GET /api/editorial/ingestion/plan` — confirm `approved_count` matches intent.
7. Run upsert only against a **local/staging** collection via injected client (see `QdrantIngestionPipeline.execute_upsert`). Never target production collections from this workspace by default (`tewahedo_editorial_books_local`).

## Search Buddy leak prevention

`retrieve_for_search_buddy()` filters with `is_approved_for_qdrant`. Current drafts → always `[]`. Tests lock this in.
