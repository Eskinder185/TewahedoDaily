# TewahedoDaily Decisions

Updated: 2026-10-30

## Release 2026-11-16

- Release integration happens in a separate git worktree built from origin/main; uncommitted work in the shared worktree is copied, never reset or cleaned.
- Generated Mezmur enrichment output is an editorial proposal and stays out of the application release until its purpose, rights, size and approval are documented.
- Merging to main deploys through the Cloudflare Pages Git integration, so a merge needs explicit approval of the deployment effect.
- Synaxarium and Liturgy live under Church Library; their existing /prayers/... routes remain so deep links keep working.

## Architectural

- Preserve existing routes and lazy-loaded page boundaries.
- Reuse existing Play tokens, CSS modules, `GameProgress`, and `GameHint`; do not introduce a second design system for games.
- Bible Timeline content remains local, source-linked, and separate from Bible source tables.
- Church Library structured content follows `books → versions → sections → passages`; public visibility remains publication- and rights-gated.

## Content

- Do not invent Bible, Church Library, author, publication, or translation metadata.
- Timeline events link to the existing Bible reader and use English fallback when an Amharic label is unavailable.
- English and Amharic Library editions are not presented as exact paragraph equivalents unless alignment is verified.

## Security and data

- Guests may use local browser progress; authenticated progression may sync through existing server-side boundaries.
- Church Library originals and covers use signed private-storage URLs; do not expose service-role credentials or public URLs for private objects.
- Draft, reviewed, and published Library content must remain distinct. Do not apply migrations or mutate production data without authorization.

## Media

- Prefer verified relationships and approved uploaded media.
- Legacy assets are fallbacks only when appropriate.
- Do not delete, rename, or relocate uploaded media while resolver work is in progress.

## Validation

- Report tests as verified only when run in the current worktree. Prior agent reports must be labeled as such.
- Prefer focused checks for changed files, then production build when unrelated blockers are understood.
