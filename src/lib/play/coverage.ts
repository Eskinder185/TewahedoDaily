/**
 * Public-page-to-CMS coverage matrix for Faith Challenges. Every content-driven feature visitors can see appears
 * here with where its data really comes from, where it is managed in the Studio, whether it can be edited, and
 * whether a public adapter exists. Nothing is hidden because it cannot yet be edited: it is shown read-only with
 * its blocker.
 */
import { STUDIO_GAMES, type StudioGame } from './contentStudio'
import { HUB_GAMES, studioIdForHubGame } from './gameCatalog'
import { builtInCounts, builtInOrigin } from './staticContent'

export type Capability = 'yes' | 'partial' | 'no'
export type CoverageRow = {
  id: string
  feature: string
  /** Studio game id this row belongs to, for filtering ("" for page-level rows). */
  game: StudioGame | ''
  source: string
  /** Where to manage it. `view` is a Studio `view` parameter; `game` opens that game's library. */
  cms: { label: string; view?: 'library' | 'settings' | 'campaign'; game?: StudioGame }
  editable: { level: Capability; text: string }
  adapter: { level: Capability; text: string }
  blocker: string
}

const QUIZ: Record<string, true> = { trivia: true, emoji: true, 'finish-the-verse': true, history: true }
const CARD: Record<string, true> = { 'who-am-i': true, match: true }

function contentRow(game: StudioGame): CoverageRow {
  const entry = STUDIO_GAMES.find(item => item.id === game)!
  const origin = builtInOrigin(game)
  const count = builtInCounts()[game]
  const base = { id: `content-${game}`, game, feature: `${entry.en}: questions/items and answers (EN/አማ)`, cms: { label: `Library · ${entry.en}`, view: 'library' as const, game } }
  if (QUIZ[game]) return { ...base,
    source: `${origin.file}; published server questions (play_content_items); ${count} built-in`,
    editable: { level: 'yes', text: 'Server draft → review → approved → published; built-in originals are copied, never changed' },
    adapter: { level: 'yes', text: 'Published-only reader merged with the built-in bank' },
    blocker: 'Live six-state constraints, grants and RLS are UNVERIFIED until isolated staging.' }
  if (CARD[game]) return { ...base,
    source: `${origin.file}; published server cards (play_content_items); ${count} built-in`,
    editable: { level: 'partial', text: 'Single-card server drafts and local copies; publication blocked in UI and service' },
    adapter: { level: 'yes', text: 'Published-only reader merged with the built-in bank' },
    blocker: 'Publishing is blocked pending verified database support for card rows.' }
  if (game === 'finish-the-mezmur') return { ...base,
    source: `${origin.file}`,
    editable: { level: 'partial', text: 'Local editing copy in the Studio; real lyric changes happen in the Hymn CMS' },
    adapter: { level: 'yes', text: 'Game reads published Mezmur records directly' },
    blocker: 'No quiz-row reader exists; publishing a quiz row would not change this game (intentionally blocked).' }
  const blocker = game === 'history' ? '' : game === 'adventures' ? 'No server schema or reader; arbitrary branches and new artwork are unsupported.'
    : game === 'bible-timeline' ? 'No server schema or reader for chains; dates/eras are unsupported.'
      : 'No server schema or reader; artwork must already exist in the media catalog.'
  return { ...base,
    source: `${origin.file}; ${count} built-in`,
    editable: { level: 'partial', text: 'Local draft copies only (browser-local, never published automatically)' },
    adapter: { level: 'no', text: 'Public game reads the built-in bank only' }, blocker }
}

export function coverageRows(): CoverageRow[] {
  const rows: CoverageRow[] = []
  rows.push(
    { id: 'hub-cards', game: '', feature: `Hub game cards: title, description, short facts, thumbnail, order (${HUB_GAMES.length} games)`,
      source: 'src/lib/play/gameCatalog.ts (HUB_GAMES) + artwork in src/lib/play/imageCatalog.ts (GAME_ART)', cms: { label: 'Game settings', view: 'settings' },
      editable: { level: 'partial', text: 'Local proposal per game with accurate card preview; not published' }, adapter: { level: 'no', text: 'The hub reads gameCatalog.ts directly' },
      blocker: 'Needs a reviewed settings table, RLS and a public reader (docs/ai/proposed-migrations/20261104_play_game_settings_proposal.md).' },
    { id: 'hub-sections', game: '', feature: 'Hub categories (Icons & feasts, Scripture, Mezmur, History, Family & group) and the All filter',
      source: 'src/lib/play/gameCatalog.ts (HUB_SECTIONS)', cms: { label: 'Game settings · category list', view: 'settings' },
      editable: { level: 'no', text: 'Read-only; each game shows its category' }, adapter: { level: 'no', text: 'Built-in only' }, blocker: 'Same settings store as game cards.' },
    { id: 'hub-modes', game: '', feature: 'Five play modes (Knowledge Battle, Timeline & Discovery, Visual Discovery, Complete the Word, Story Adventure)',
      source: 'src/lib/play/gameModes.ts (GAME_MODES)', cms: { label: 'Mode filter in the Library', view: 'library' },
      editable: { level: 'no', text: 'Read-only grouping used for filtering' }, adapter: { level: 'no', text: 'Built-in only' }, blocker: 'Presentation grouping; no store.' },
    { id: 'hub-levels', game: '', feature: 'Difficulty availability (Beginner / Growing / Challenge) on level-aware games',
      source: 'HUB_GAMES `levels` flag; question difficulty fields', cms: { label: 'Game settings · difficulty', view: 'settings' },
      editable: { level: 'partial', text: 'Local proposal; question difficulty is editable per item' }, adapter: { level: 'no', text: 'Built-in only' }, blocker: 'Settings store (see game cards).' },
    { id: 'hub-copy', game: '', feature: 'Hub hero, introductions and section copy',
      source: 'src/pages/play/PlayHubPage.tsx (inline bilingual text)', cms: { label: 'Listed here; not editable', view: 'settings' },
      editable: { level: 'no', text: 'Read-only: text lives in the page component' }, adapter: { level: 'no', text: 'Inline in the page' }, blocker: 'Needs extraction into the settings store before it can be managed.' },
    { id: 'instructions', game: '', feature: 'Per-game instructions',
      source: 'Inline inside each game component (no shared field)', cms: { label: 'Game settings · instructions', view: 'settings' },
      editable: { level: 'partial', text: 'Local proposal field; no public field exists yet' }, adapter: { level: 'no', text: 'None' }, blocker: 'Games must be changed to read a shared instructions field.' },
    { id: 'game-night', game: '', feature: 'Game Night: room settings (category, difficulty, 5/10/20 questions) and private question bank',
      source: 'src/pages/play/GameNightPage.tsx; play_private.game_night_questions (database)', cms: { label: 'Listed here; managed outside the Studio', view: 'settings' },
      editable: { level: 'no', text: 'Read-only on purpose: answers are private until reveal' }, adapter: { level: 'yes', text: 'Room RPCs read only reviewed private questions' },
      blocker: 'Private question provisioning is a separate reviewed workflow; Studio never reads or writes the private bank.' },
  )
  for (const hub of HUB_GAMES) {
    const row = contentRow(studioIdForHubGame(hub.id))
    row.source += '; opt-in play_content_items typed activity reader'
    row.adapter = { level: 'partial', text: 'Database-only adapter implemented for staging; default runtime remains as documented above until cutover verification.' }
    row.blocker += ' Activity publication and production cutover remain BLOCKED; no live content/RLS verification.'
    rows.push(row)
  }
  rows.push(
    { id: 'history-chronology', game: 'history', feature: 'History Quest: councils chronology (events and years)', source: 'src/lib/play/approvedContent.ts (HISTORY_TIMELINE)',
      cms: { label: 'Library · History Quest (chronology)', view: 'library', game: 'history' }, editable: { level: 'partial', text: 'Local chronology copy only' },
      adapter: { level: 'partial', text: 'Opt-in typed activity reader; no static chronology in database-only mode' }, blocker: 'Activity schema/publication still requires approval and staging; AD years only.' },
    { id: 'artwork', game: '', feature: 'Game artwork and image catalog (feasts, saints, angels)', source: 'src/lib/play/imageCatalog.ts via the existing media service',
      cms: { label: 'Library · image games, Game settings · thumbnail', view: 'library' }, editable: { level: 'partial', text: 'Choose existing catalog images; no upload path' },
      adapter: { level: 'no', text: 'Built-in catalog only' }, blocker: 'New artwork needs the existing media/upload workflow and a catalog adapter.' },
    { id: 'campaign', game: '', feature: 'Generated Bible question campaign (local drafts)', source: 'artifacts/faith-challenges/** (local, git-ignored)',
      cms: { label: 'Campaign drafts', view: 'campaign' }, editable: { level: 'partial', text: 'Review decisions kept locally; export validated drafts for the import tool' },
      adapter: { level: 'yes', text: 'Only via /admin/play/import as DRAFTS, then the normal six-state workflow' }, blocker: 'Generated Amharic stays unverified until a person reviews it; nothing is approved or published automatically.' },
  )
  return rows
}
