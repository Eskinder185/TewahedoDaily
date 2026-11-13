import type { ReactNode } from 'react'

/**
 * One clean line icon per game, drawn in the same single stroke so the cards read as a set.
 * Motifs come from Ethiopian Orthodox church life: the processional cross, the Geʽez book and scroll, the
 * kebero drum, the Axum stele, the haloed saint and the arched icon panel.
 */
const CROSS = (
  <>
    <path d="M24 6v36M6 24h36" />
    <circle cx="24" cy="6" r="2.6" /><circle cx="24" cy="42" r="2.6" /><circle cx="6" cy="24" r="2.6" /><circle cx="42" cy="24" r="2.6" />
    <path d="M24 15l9 9-9 9-9-9z" />
  </>
)

const ICONS: Record<string, ReactNode> = {
  // Open Geʽez book with a small cross above it
  trivia: (
    <>
      <path d="M24 5v7M20.5 8.5h7" />
      <path d="M7 17c6-2.4 12-1.8 17 2 5-3.8 11-4.4 17-2v22c-6-2.4-12-1.8-17 2-5-3.8-11-4.4-17-2z" />
      <path d="M24 19v22" />
    </>
  ),
  // Speech bubble with a cross: decode the clue
  emoji: (
    <>
      <path d="M9 9h30a3 3 0 0 1 3 3v18a3 3 0 0 1-3 3H23l-9 8v-8H9a3 3 0 0 1-3-3V12a3 3 0 0 1 3-3z" />
      <path d="M24 14v13M17.5 20.5h13" />
    </>
  ),
  // Scroll with lines of text
  'finish-the-verse': (
    <>
      <path d="M15 7h24v30a4 4 0 0 1-4 4H13a4 4 0 0 1-4-4v-3h6z" />
      <path d="M15 7a4 4 0 0 0-4 4v23" />
      <path d="M21 15h12M21 21h12M21 27h8" />
    </>
  ),
  // Kebero drum
  'finish-the-mezmur': (
    <>
      <ellipse cx="24" cy="13" rx="13" ry="4.5" />
      <path d="M11 13c2 7 2 14 0 22M37 13c-2 7-2 14 0 22" />
      <path d="M11 35c0 2.5 5.8 4.5 13 4.5S37 37.5 37 35" />
      <path d="M14 18l6 17M24 17.5v22M34 18l-6 17" />
    </>
  ),
  // Axum stele
  history: (
    <>
      <path d="M17 42V11l7-5 7 5v31z" />
      <path d="M21 16h6M21 22h6M21 28h6" />
      <path d="M22 42v-6h4v6" />
      <path d="M11 42h26" />
    </>
  ),
  // Saint with a halo
  'who-am-i': (
    <>
      <circle cx="24" cy="17" r="10.5" />
      <circle cx="24" cy="17" r="5.2" />
      <path d="M10 42c0-8.5 5.8-13 14-13s14 4.5 14 13" />
    </>
  ),
  // Two linked circles with a cross where they meet: things that belong together
  match: (
    <>
      <circle cx="18.5" cy="24" r="12" />
      <circle cx="29.5" cy="24" r="12" />
      <path d="M24 19.5v9M19.8 24h8.4" />
    </>
  ),
  // Processional cross: the feasts
  feasts: CROSS,
  // Arched icon panel with a haloed figure
  saints: (
    <>
      <path d="M9 42V21a15 15 0 0 1 30 0v21z" />
      <circle cx="24" cy="22" r="6.5" />
      <path d="M15.5 40c1.2-5.5 4.4-9 8.5-9s7.3 3.5 8.5 9" />
    </>
  ),
  // Four icon cards, one turned over
  'icon-memory': (
    <>
      <rect x="7" y="7" width="15" height="15" rx="2.5" />
      <rect x="26" y="7" width="15" height="15" rx="2.5" />
      <rect x="7" y="26" width="15" height="15" rx="2.5" />
      <rect x="26" y="26" width="15" height="15" rx="2.5" />
      <path d="M14.5 11v7M11 14.5h7" />
      <circle cx="33.5" cy="14.5" r="2" /><circle cx="14.5" cy="33.5" r="2" />
    </>
  ),
  // Boat with a sail
  adventures: (
    <>
      <path d="M7 31h34l-5 9H12z" />
      <path d="M24 7v24" />
      <path d="M24 10l13 17H24z" />
    </>
  ),
  // Timeline with three events
  'bible-timeline': (
    <>
      <path d="M24 5v3.5M24 15.5v5M24 27.5v5M24 39.5v3.5" />
      <circle cx="24" cy="12" r="3.5" /><circle cx="24" cy="24" r="3.5" /><circle cx="24" cy="36" r="3.5" />
      <path d="M29 12h12M29 24h8M29 36h12M19 24h-8" />
    </>
  ),
}

/** Game ids used by the hub vary slightly (`mezmur` for Finish the Mezmur, `adventure(s)`); map them to one icon. */
const ALIASES: Record<string, string> = { mezmur: 'finish-the-mezmur', adventure: 'adventures' }

/** Only an unknown id gets this plain mark; every real game has its own icon (checked by test:game-icons). */
const FALLBACK = (
  <>
    <circle cx="24" cy="24" r="16" />
    <path d="M24 16v16M16 24h16" />
  </>
)

export function GameIcon({ id }: { id: string }) {
  const key = ALIASES[id] ?? id
  const known = key in ICONS
  const shape = known ? ICONS[key] : FALLBACK
  return (
    <svg viewBox="0 0 48 48" width="64" height="64" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true" focusable="false" data-game-icon={known ? key : 'fallback'}>
      {shape}
    </svg>
  )
}
