# Ingestion safety and rollback

Date: 2026-10-18. Production ingestion is disabled by design. No current passage
is eligible; no Qdrant service or embedding provider was contacted during this task.

## Required approval chain

Every condition must hold before a variant can be indexed or publicly retrieved:

1. `Catalog.json.approved_for_ingestion` is the JSON boolean `true`.
2. The catalog's book entry and the book metadata each have
   `approved_for_ingestion: true`, metadata has `final_human_approval: true`, and
   the human approval queue records that book's explicit `approved: true` sign-off.
3. The paragraph's section explicitly has `final_approval: "Approved"`.
4. The reading paragraph has `approved_for_ingestion: true` and no unresolved IDs.
5. No matching paragraph, section or document overlay denial exists.
6. A protected external release manifest explicitly grants the exact variant UUID
   and current content/evidence hash, with reviewer and timezone-aware decision time.

The chain is intentionally conservative and includes the package's requested
whole-book sign-off. Approval for one variant never authorizes its companion
translation, original source or explanation. Structural QA, inherited annotations,
empty issue lists, and overlay approval intent cannot replace this chain.
String values such as `"false"` or `"true"` are rejected, not coerced. Reading issue
IDs must agree exactly with the human unresolved queue; clearing a paragraph's
local issue list cannot conceal a queued hold.

No production release manifest was created. Its schema is:

```json
{
  "schema_version": 1,
  "grants": []
}
```

A future reviewed grant requires `point_id`, `document_id`, `paragraph_id`,
`content_sha256`, `approved_for_ingestion` (literal boolean), `reviewer` and
`decided_at` (ISO timestamp with timezone). Hashes/UUIDs come from canonical
candidates after authorized package approval; never guess them. Duplicate grant
IDs are rejected. There is no approval-generating CLI or automatic human sign-off.

The operator must protect the release file, overlay file and package with
server-side filesystem permissions. This allowlist is not a cryptographic
reviewer identity system. Candidate hashes bind text, language, role, source IDs,
book/section labels, original source records, reference excerpts and revision
evidence. A revision invalidates the old grant. Ingestion reconstructs candidates
from the catalog and rejects caller-forged content attached to an approved ID.

## Local Qdrant preparation

`QdrantIngestionPipeline.plan()` performs no network or embedding work. It currently
reports 6,054 candidates and zero allowed records. `execute_upsert()` returns zero
without calling an embedding function or sink when approval fails.

For a future authorized local experiment, the caller must explicitly provide:

- `ReleaseManifest`, a durable SQLite `journal_path`, and a versioned `embedding_id`;
- an embedding function returning finite, consistently sized numeric vectors;
- a `LocalQdrantSink` targeting numeric loopback at port 6333, using HTTP;
- a pre-created collection named `tewahedo_editorial_books_local`, optionally
  suffixed with `_` and up to 64 lowercase letters, digits or underscores.

Other URLs, hostnames, paths and collection names are rejected. HTTP redirects
are not followed and environment proxy settings are ignored. No production URL,
credentials, automatic collection creation or startup ingestion is configured.
The operator must ensure loopback is a disposable local service and is not
tunneled to production. No code can establish the ownership of an arbitrary
service listening on the operator's loopback port.

Point IDs are UUIDv5 values derived from document, paragraph and variant, matching
Qdrant's supported UUID ID form. Original-source records and every labeled
reading segment remain separate points. English and Amharic can share a future
evaluated multilingual vector space while retaining explicit language/kind
metadata. No linguistic quality or embedding recall claim is made by these tests.
See the official [Qdrant point documentation](https://qdrant.tech/documentation/concepts/points/),
[upsert API](https://api.qdrant.tech/api-reference/points/upsert-points) and
[delete API](https://api.qdrant.tech/api-reference/points/delete-points).

## Deduplication, failures and rollback

The adapter uses `wait=true` and requires completed operations. The journal records
the intended exact points before upsert. A database write lock serializes local
batch changes. A crash or timeout leaves the batch pending, with IDs, payloads
and vectors for recovery. A new batch is blocked while recovery is outstanding.

Retry with the same explicit `batch_id`, model ID, content and deterministic
vectors; UUID upsert makes the retry idempotent. A completed batch replay is a
no-op. A new batch skips points whose full payload/model already match. Conflicting
existing content/model is rejected; stage a new suffixed local collection rather
than overwriting an edition. The journal contains source text/vectors and must
remain private and backed up.

Call `pipeline.rollback(sink, batch_id)` to remove only points newly owned by
that batch. Points skipped as duplicates are not included in its rollback set.
Rollback works for pending or completed batches even after approval is revoked.
It verifies ownership and deletes using both point IDs and a matching `batch_id`
filter. Unknown batches or ownership changes stop rollback. A failed delete leaves
`rollback_pending`; retrying rollback is safe. Completed rollback is a no-op on
repeat. It never drops an entire collection or unrelated records.

Do not mix journals or independent writers for the same collection. Hold package
and release revisions stable while a write runs. The pipeline reloads actual
package/grant state after embedding, but an independent filesystem edit cannot
be atomic with a remote Qdrant transaction. Future public retrieval must recheck
the current approval allowlist on every request. Revocation therefore stops
exposure even before an operator removes old indexed points.

`ApprovedBookLibrary.verify_vector_hits` ignores unapproved/unknown IDs and stale
hashes, then hydrates text from current approved canonical content. It never
returns text supplied by the vector payload. Future Qdrant queries should also
filter approval, language and kind, but a vector payload flag alone is insufficient.

## Search Buddy protections

This task does not change the chat route, request-body limit, per-client/global
rate limits, AI/transcription semaphores, upstream timeout/authentication, error
redaction, CORS policy or debug-route gates. The existing regression suites pass.
Book retrieval is prepared as a helper and remains disconnected from `/api/chat`.
Future prompt wiring must treat retrieved passages as quoted source data, never
as instructions, and preserve existing verified-Scripture/source distinctions.
No public book HTTP endpoint exposes editorial drafts.
