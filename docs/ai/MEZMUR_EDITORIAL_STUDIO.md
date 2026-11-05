# Mezmur Editorial Review Studio

## What changed

The existing Hymns CMS now has an **Editorial Review** tab at `/admin/hymns/mezmur/editorial`. The editor and public hymn pages are unchanged. The new route is restricted to editor, admin, and super admin roles by `RequireCmsRole`. It loads a private offline fixture, shows actual counts from the loaded records, and lets staff compare original lyrics with category evidence in a responsive two-panel workspace. The original text is displayed verbatim; highlighted excerpts are literal substrings of the original field.

The dashboard separates current classifications, completed semantic proposals, unverified local model proposals, and local editorial approvals. The 25 `full_lyrics_reviewed` records from batch 001 are **semantic analyses, not editorial approvals**. The `review_status` CMS tag is also separate. The five documented conflicts remain flagged. A proposed occasion was not added where the source review supplied none. Possible duplicate counts are hints from the version detector, never confirmed relationships.

## Local workflow

1. Run `npm.cmd run build:mezmur-editorial-catalog` from the repository root. This reads the stable 2,531-row source CSV, deep classification CSV, progress metadata, literal evidence CSV, conflict CSV, and compatible version index. It writes only `artifacts/mezmur-editorial-studio/catalog.json`. It verifies the source SHA, every `import_id`, original lyric fields, the 25 completed reviews, and literal evidence.
2. Open the new CMS tab as an editor and select that JSON file. The file is deliberately under `artifacts/`, outside `public/`, and is never requested by a public route. The browser keeps its lyrics in memory only.
3. Search by ID, title, lyric, or category. Filter by status. Review category and occasion separately. Approve a completed semantic category proposal, select another supported category or occasion with a reason, reject with a reason, or defer. Automated suggestions cannot be approved as completed semantic proposals.
4. Export the audit log after reviewing. Local decisions are stored in browser `localStorage` under reviewer ID and source SHA. Restoring an export requires the same source catalog and verifies each event's source ID and original text hash. The report export omits reviewer IDs; the audit export keeps them for authorized internal use.
5. For bulk review, explicitly select records, preview their titles and IDs, read validation warnings, then confirm. Bulk approval is allowed only for a single supported category, high-confidence completed semantic reviews, literal evidence, and records without conflicts or earlier decisions. The last bulk action can be rolled back by appending traceable rollback events. Exports provide recovery if browser storage is lost.

No action in this studio calls Supabase or changes source CSVs, original lyrics, published classifications, or the existing CMS editor. The existing classification RPC remains available to the existing CMS workflow and is intentionally not invoked by the studio.

## Audit contract

Each event stores stable `import_id`, original `mezmur_id` if any, the source CSV SHA, the original lyrics hash, review area, proposal, previous value, selected value, decision, reviewer ID, timestamp, evidence excerpts, method/version, and reason/note. Rollback events point to the event they reverse. The original record is always recoverable from the source CSV and catalog. The report export strips reviewer identity; access to the audit export must stay with authorized staff.

## Server-side blockers and next authorization step

The repository defines `set_mezmur_classification_import(uuid,text[],text[])` for staff and an `admin_content_review` tag table with staff RLS. The RPC replaces classification links but has no per-decision evidence, source hash, prior value, or append-only audit. The tag table only records `needs_review`/`reviewed`; it cannot represent approve/reject/defer per category and occasion. Reusing either as an editorial audit would lose required provenance. A read-only live compatibility probe (`node --env-file-if-exists=.env.local scripts/probe-mezmur-editorial-schema.mjs`) reached Supabase but all four table checks returned HTTP 401 / 42501 with the public key; the staff-only RPC was not advertised to anonymous clients. This is consistent with restricted access but does not establish the deployed schema or staff RLS behavior. An authenticated staff read-only probe is still required.

Before enabling server persistence, authorized maintainers need to verify the deployed `mezmur_data_import` identity and classification link contracts, staff RLS, and actual RPC version. A separate, unapplied migration should add a staff-only append-only editorial decision table keyed by `import_id` and source hash, with category/occasion decision values and evidence; a transactional staff RPC should check current links and the original text hash before any classification write. Tests must prove visitor and noneditor rejection, audit immutability, concurrent edit rejection, rollback, and that published retrieval never exposes reviewer identity or unapproved proposals. That proposal must be reviewed against the live schema before any migration or write is authorized.

## Limits

- The catalog is a snapshot. Reload a newly built catalog when source data changes; events from a different source SHA cannot be restored.
- Browser decisions are local to the current browser profile until exported. They are not human approval in Supabase and do not affect public hymns.
- The 25 semantic reviews contain category proposals but no occasion proposals. AI suggestions for other rows remain unverified. Duplicate flags are possible matches only.
- Search normalizes the loaded snapshot once, then filters the in-memory index using deferred input. The list renders at most 200 matching rows; narrow the query to reach later results. The large lyric corpus is not bundled into the public build.
