# TewahedoDaily Project Status

## Database-only Faith Challenges readiness — 2026-11-04

Typed opt-in readers now cover all twelve existing Studio/game formats, including separate History chronology and source-only Finish Mezmur selections. Existing engines/routes remain; no static fallback occurs in that opt-in path. Default runtime remains unchanged until equivalent published data and actual staging authorization are verified. Shared activity draft saves are prepared, publication remains blocked, and no flag/configuration, live database, SQL, import or deployment was changed. See `DATABASE-DRIVEN-PLAY-2026-11-04.md` for inventory, exact files, tests and production blockers.

## Play mode organization — 2026-11-03

Implemented five gameplay modes across public Play and the existing Faith Challenges studio. All twelve routes and engines remain. Game Night has a shared-screen mixed guide plus existing Custom/Join room flows; mixed multiplayer is explicitly unavailable. Added a tested anti-repetition selector foundation, not yet wired into runtime games or RPCs. Existing twelve dedicated editors/previews remain: four server question readers, eight local draft formats, with History chronology local. See `PLAY-MODES-REDESIGN-2026-11-03.md` for exact files, commands, capability limits and staging blockers. No SQL or production changes.

Updated: 2026-10-30

## Verified facts

- The Play routes include `/play/bible-timeline`; the game uses source-linked event data, difficulty-specific rounds, keyboard move controls, pointer drag reordering, hints, progress, XP completion, and local anti-repetition.
- Shared Play primitives exist at `src/components/play/GameProgress.tsx` and `GameHint.tsx`.
- Church Library routes include `/library`, `/library/read/:bookSlug/:sectionKey?`, and `/library/:bookId`.
- Church Library public visibility is gated by `public_retrieval_enabled` and `processing_status = 'ready'`; covers use private signed URLs through `getChurchLibraryCoverSignedUrl`.
- Structured Library documentation records chapter/section reading, bilingual editions, bookmarks, progress, themes, and publication gates, but its migration is documented as not applied/deployed.
- The media/calendar TypeScript errors are fixed locally; the verified Timket catalog path is `calendar/christ/timket-436e0376-1792010746233.webp`.
- The current worktree has many uncommitted files across Play, Church Library presentation, and media resolution. Ownership is unknown.

## Agent-reported results

- Timeline browser QA reportedly passed desktop/mobile interaction, drag ordering, hints, progress, XP persistence, anti-repetition, Amharic rendering, and reduced-motion checks.
- Timeline logic tests reportedly passed through the local `tsx` runner.
- The Library homepage redesign reportedly passed focused ESLint and diff checks.
- Local media validation passed `npx.cmd tsc --noEmit -p tsconfig.app.json`, `npm.cmd run build`, and all 10 checks in `scripts/test-media-resolver.ts`, including six HTTP 200 checks.

## Unresolved / unknown

- A GitHub Actions deployment failure was reported, but has not yet been diagnosed.
- Full repository ESLint status is not clean according to prior reports.
- No production or Supabase changes were performed for the local media validation. Supabase migrations and structured Library publication state have not been independently verified as deployed.

## Next milestone

Reconcile the current uncommitted media and Play/Library changes, investigate the reported GitHub Actions deployment failure, then run focused browser and production validation before merging.
