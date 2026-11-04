/**
 * Read-only inventory of the content BUILT INTO the public games (static TypeScript banks), so the Studio never
 * shows an existing game as empty. It reads the same exports the public games use and never copies them into a
 * second store: opening an item creates a fresh DRAFT copy in the editor; the built-in original is not changed and
 * editing a copy never alters the deployed site.
 */
import { APPROVED_QUESTIONS, HISTORY_TIMELINE, MATCH_PAIRS, WHO_AM_I_CARDS } from './approvedContent'
import { bibleAdventureStories } from './bibleAdventureStories'
import { TIMELINE_CHAINS } from './bibleTimeline'
import { PLAY_IMAGES, type PlayImage } from './imageCatalog'
import { STUDIO_GAMES, isQuizStudioGame, newHistoryTimelineRecord, newStudioRecord, type StudioGame, type StudioRecord } from './contentStudio'
import type { PlayQuestion } from './types'

export type Text = { en: string; am?: string }
export type BuiltInOrigin = { kind: 'static-ts' | 'supabase'; file: string; note: string }
export type BuiltInItem = {
  key: string
  game: StudioGame
  id: string
  title: Text
  detail: Text
  category?: string
  difficulty?: string
  reference?: string
  /** Locales for which this item has text, from the stored fields (not from a verified-translation claim). */
  locales: Array<'en' | 'am'>
  search: string
}

const ORIGINS: Record<StudioGame, BuiltInOrigin> = {
  trivia: { kind: 'static-ts', file: 'src/lib/play/approvedContent.ts (APPROVED_QUESTIONS)', note: 'Built-in questions plus published server questions (play_content_items)' },
  emoji: { kind: 'static-ts', file: 'src/lib/play/approvedContent.ts (APPROVED_QUESTIONS)', note: 'Built-in questions plus published server questions (play_content_items)' },
  'finish-the-verse': { kind: 'static-ts', file: 'src/lib/play/approvedContent.ts (APPROVED_QUESTIONS)', note: 'Built-in questions plus published server questions (play_content_items)' },
  history: { kind: 'static-ts', file: 'src/lib/play/approvedContent.ts (APPROVED_QUESTIONS, HISTORY_TIMELINE)', note: 'Quiz questions plus the separate councils chronology' },
  'who-am-i': { kind: 'static-ts', file: 'src/lib/play/approvedContent.ts (WHO_AM_I_CARDS)', note: 'Built-in cards; published server cards override matching IDs' },
  match: { kind: 'static-ts', file: 'src/lib/play/approvedContent.ts (MATCH_PAIRS)', note: 'Built-in pairs; published server pairs override matching IDs' },
  'bible-timeline': { kind: 'static-ts', file: 'src/lib/play/bibleTimeline.ts (TIMELINE_CHAINS)', note: 'Static chains only; no server reader' },
  adventures: { kind: 'static-ts', file: 'src/lib/play/bibleAdventureStories.ts (bibleAdventureStories)', note: 'Static stories and artwork only; no server reader' },
  feasts: { kind: 'static-ts', file: 'src/lib/play/imageCatalog.ts (PLAY_IMAGES, feast)', note: 'Static image catalog; artwork resolves through the existing media service' },
  saints: { kind: 'static-ts', file: 'src/lib/play/imageCatalog.ts (PLAY_IMAGES, saint/angel)', note: 'Static image catalog; artwork resolves through the existing media service' },
  'icon-memory': { kind: 'static-ts', file: 'src/lib/play/imageCatalog.ts (PLAY_IMAGES)', note: 'Static image catalog; artwork resolves through the existing media service' },
  'finish-the-mezmur': { kind: 'supabase', file: 'mezmur_public (published Mezmur records)', note: 'Lyrics are derived from published Mezmur records; there is no separate question bank. Edit lyrics in the Hymn CMS.' },
}
export const builtInOrigin = (game: StudioGame): BuiltInOrigin => ORIGINS[game]

const locales = (...texts: Array<Text | undefined>): Array<'en' | 'am'> => {
  const found = new Set<'en' | 'am'>()
  for (const text of texts) { if (text?.en) found.add('en'); if (text?.am) found.add('am') }
  return [...found]
}
const item = (game: StudioGame, id: string, title: Text, detail: Text, extra: Partial<BuiltInItem> = {}): BuiltInItem => ({
  key: `${game}:${id}`, game, id, title, detail, locales: locales(title, detail), ...extra,
  search: `${id} ${title.en} ${title.am || ''} ${detail.en} ${detail.am || ''} ${extra.category || ''} ${extra.reference || ''}`.toLocaleLowerCase(),
})
const answerOf = (question: PlayQuestion): Text => question.options.find(option => option.key === question.correctKey)?.text || { en: '' }
const questionItem = (game: StudioGame, question: PlayQuestion) => item(game, question.id, question.prompt, answerOf(question),
  { category: question.category, difficulty: question.difficulty, reference: question.source.label })
const imageItem = (game: StudioGame, image: PlayImage) => item(game, image.id, image.answer, image.explanation,
  { category: image.kind, reference: image.source.label })

/** Everything the public game for `game` ships with, read-only. */
export function builtInContent(game: StudioGame): BuiltInItem[] {
  switch (game) {
    case 'trivia': case 'emoji': case 'finish-the-verse':
      return APPROVED_QUESTIONS.filter(question => question.game === game).map(question => questionItem(game, question))
    case 'history':
      return [
        ...APPROVED_QUESTIONS.filter(question => question.game === 'history').map(question => questionItem(game, question)),
        ...HISTORY_TIMELINE.map(event => item(game, `timeline-${event.id}`, event.label, { en: `AD ${event.year} · council chronology` }, { category: 'chronology', reference: event.source.label })),
      ]
    case 'who-am-i': return WHO_AM_I_CARDS.map(card => item(game, card.id, card.answer, card.explanation, { category: card.category, reference: card.source.label }))
    case 'match': return MATCH_PAIRS.map(pair => item(game, pair.id, { en: `${pair.left.en} ↔ ${pair.right.en}`, am: pair.left.am && pair.right.am ? `${pair.left.am} ↔ ${pair.right.am}` : undefined }, pair.explanation, { category: pair.category, reference: pair.source.label }))
    case 'bible-timeline': return TIMELINE_CHAINS.map(chain => item(game, chain.id, chain.title, { en: `${chain.events.length} events · ${chain.events.map(event => event.ref).join(', ')}` }, { reference: chain.events[0]?.ref }))
    case 'adventures': return bibleAdventureStories.map(story => item(game, story.id, story.title, story.summary, { reference: story.passage }))
    case 'feasts': return PLAY_IMAGES.filter(image => image.kind === 'feast').map(image => imageItem(game, image))
    case 'saints': return PLAY_IMAGES.filter(image => image.kind !== 'feast').map(image => imageItem(game, image))
    case 'icon-memory': return PLAY_IMAGES.map(image => imageItem(game, image))
    case 'finish-the-mezmur': return []
  }
}

export function builtInCounts(): Record<StudioGame, number> {
  return Object.fromEntries(STUDIO_GAMES.map(game => [game.id, builtInContent(game.id).length])) as Record<StudioGame, number>
}

/**
 * A fresh DRAFT record seeded from one built-in item. The original is cloned (never mutated). Quiz questions get a
 * new unique ID (server rows need one). Every other format KEEPS its stable ID: story, chain, card, pair and image IDs
 * name existing artwork, sources and public identities, and the local draft is never published automatically.
 */
export function recordFromBuiltIn(game: StudioGame, itemId: string, owner: string, id = crypto.randomUUID()): StudioRecord | null {
  const base = newStudioRecord(game, owner, id)
  const named = (name: string): StudioRecord => ({ ...base, name })
  if (isQuizStudioGame(game)) {
    if (game === 'history' && itemId.startsWith('timeline-')) return newHistoryTimelineRecord(owner, id)
    const question = APPROVED_QUESTIONS.find(entry => entry.id === itemId && entry.game === game)
    if (!question) return null
    const copy = structuredClone(question); copy.id = `${game}-${id}`
    return { ...named(`${game} copy of ${question.id}`), draft: { game, content: copy } }
  }
  switch (game) {
    case 'who-am-i': {
      const card = WHO_AM_I_CARDS.find(entry => entry.id === itemId); if (!card) return null
      return { ...named(`Copy of ${card.id}`), draft: { game, content: structuredClone(card) } }
    }
    case 'match': {
      const pair = MATCH_PAIRS.find(entry => entry.id === itemId); if (!pair) return null
      return { ...named(`Copy of ${pair.id}`), draft: { game, content: [structuredClone(pair)] } }
    }
    case 'bible-timeline': {
      const chain = TIMELINE_CHAINS.find(entry => entry.id === itemId); if (!chain) return null
      return { ...named(`Copy of ${chain.id}`), draft: { game, content: structuredClone(chain) } }
    }
    case 'adventures': {
      const story = bibleAdventureStories.find(entry => entry.id === itemId); if (!story) return null
      return { ...named(`Copy of ${story.id}`), draft: { game, content: structuredClone(story) } }
    }
    case 'feasts': case 'saints': case 'icon-memory': {
      const pool = builtInContent(game).map(entry => PLAY_IMAGES.find(image => image.id === entry.id)!).filter(Boolean)
      const start = pool.findIndex(image => image.id === itemId); if (start < 0) return null
      const ordered = [...pool.slice(start), ...pool.slice(0, start)].slice(0, 4)
      return { ...named(`Copy starting at ${itemId}`), draft: { game, content: structuredClone(ordered) } }
    }
    case 'finish-the-mezmur': return null
  }
}
