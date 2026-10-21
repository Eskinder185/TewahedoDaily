# Test results

Date: 2026-10-18 (America/New_York). Local Windows / Python 3.11.9.

The existing baseline suite passed **56 tests** before implementation. The final
suite passed **116 tests**, with zero failures or skips. Existing security,
Search Buddy and audio-duration suites remain intact. Two earlier synthetic
editorial tests were adapted to the stricter approval hierarchy and the split
candidate API; a paragraph flag alone is now explicitly expected to fail closed.

Command from the backend repository root:

```powershell
python -m pytest -q -p no:cacheprovider
```

The complete suite covers all five book parsers and ordered alignment, exact
source IDs/text, English/Amharic Unicode preservation, bounded pagination without
gaps or duplicates, malformed approval types, source/section/bilingual drift,
catalog path escape, separate inline supplements, deterministic UUIDs, every
approval layer, missing/stale/revoked/duplicate grants, and draft exclusion from
approved catalog/search/reading and Search Buddy retrieval.

Synthetic ingestion tests cover English and Amharic success, forged candidate
rejection, safe hydration of stale/untrusted vector hits, duplicate suppression,
required journal/model/local sink, invalid vectors, production-target rejection,
partial upsert failure, retry, pending-batch exclusion, rollback after revocation,
rollback retry, ownership conflicts, and approval revocation during embedding.
Real package execution also verifies that no embedding function is called for
unapproved material. API tests verify private token/feature gates, page bounds,
unknown cursors/targets, strict boolean input and no-store headers.

Existing regressions cover body limits, per-client/global rate limits, trusted
client-header handling, bounded tracking, concurrency/semaphore behavior,
redacted upstream failures, debug routes, upload validation, audio duration and
Search Buddy language/question-focus/Scripture-source behavior.

## Package audit

The independent read-only integration audit passes all seven groups:

1. Manifest hashes and exact companion ZIP bytes/CRC.
2. Reading every package file and parsing all JSON/JSONL/CSV files.
3. All five book exports, exact source/reference alignment and ordered sections.
4. All five external original DOCX hashes/full body XML and immutable references.
5. Nonblank source coverage and all Matthew table coordinates.
6. Unresolved issue queues, five sign-offs and unchanged false approval flags.
7. Revision lineage, reference quotations and separate explanation labels.

Reproduce without modifying the package:

```powershell
$env:PYTHONPATH = 'app'
$env:PYTHONIOENCODING = 'utf-8'
python -m editorial.audit --root content-review --zip content-review.zip
```

`VALIDATION_REPORT.json` contains the captured machine-readable evidence. It
reports 70 manifest-listed files, matching ZIP payloads, 3,398 source records,
3,003 readings, 52 Matthew table positions (five blank), 828 unresolved issues,
five whole-book sign-offs, 335 revision operations and 36 explanation segments.

## Limits

Tests use an in-memory HTTP transport for Qdrant and injected synthetic vectors;
they do not prove compatibility with a deployed Qdrant version, real embedding
quality, multilingual semantic recall, model fluency or frontend layout. No real
Qdrant request, model download, production credential access or deployment ran.
Approval success fixtures contain synthetic text in temporary directories;
the actual package remains unapproved and unchanged.

Structural tests and exact source fidelity cannot certify theology, historical
truth, linguistic correctness, source completeness or original printed pagination.
Human review and an authorized local-server integration evaluation remain required.
