# TewahedoDaily Project Status

Updated: 2026-10-30

## Verified facts

- The Play routes include `/play/bible-timeline`; the game uses source-linked event data, difficulty-specific rounds, keyboard move controls, pointer drag reordering, hints, progress, XP completion, and local anti-repetition.
- Shared Play primitives exist at `src/components/play/GameProgress.tsx` and `GameHint.tsx`.
- Church Library routes include `/library`, `/library/read/:bookSlug/:sectionKey?`, and `/library/:bookId`.
- Church Library public visibility is gated by `public_retrieval_enabled` and `processing_status = 'ready'`; covers use private signed URLs through `getChurchLibraryCoverSignedUrl`.
- Structured Library documentation records chapter/section reading, bilingual editions, bookmarks, progress, themes, and publication gates, but its migration is documented as not applied/deployed.
- The current worktree has many uncommitted files across Play, Church Library presentation, and media resolution. Ownership is unknown.

## Agent-reported results

- Timeline browser QA reportedly passed desktop/mobile interaction, drag ordering, hints, progress, XP persistence, anti-repetition, Amharic rendering, and reduced-motion checks.
- Timeline logic tests reportedly passed through the local `tsx` runner.
- The Library homepage redesign reportedly passed focused ESLint and diff checks.

## Unresolved / unknown

- A production build was reported blocked by unrelated `mediaResolver` / calendar presentation TypeScript errors; current resolution status is unknown.
- Full repository ESLint status is not clean according to prior reports.
- Supabase migrations, media changes, and structured Library publication state have not been independently verified as deployed.

## Next milestone

Reconcile the current uncommitted media and Play/Library changes, fix or explicitly baseline the build blockers, then run focused browser and production validation before merging.
