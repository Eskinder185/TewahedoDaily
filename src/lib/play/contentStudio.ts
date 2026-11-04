/** Studio envelopes are editorial metadata; content remains the game's own type. */
import { APPROVED_QUESTIONS, HISTORY_TIMELINE, MATCH_PAIRS, WHO_AM_I_CARDS } from './approvedContent'
import { TIMELINE_CHAINS, type TlChain } from './bibleTimeline'
import { bibleAdventureStories, type BibleAdventureStory } from './bibleAdventureStories'
import { PLAY_IMAGES, type PlayImage } from './imageCatalog'
import { usableLines, type MezmurSong } from './finishMezmur'
import { validateQuestionDraft, type QuestionDraft, type QuestionRow, type QuestionStatus } from './questionLibrary'
import type { MatchPair, PlayQuestion, SourceReference, WhoAmICard } from './types'
import { internalSource } from './contentSource'
import { validateCardContent } from './cardContent'
export { internalSource } from './contentSource'

export const STUDIO_GAMES = [
  { id: 'history', en: 'History Quest', am: 'የታሪክ ፈተና', icon: '⛪', schema: 'PlayQuestion', connected: true },
  { id: 'who-am-i', en: 'Who Am I?', am: 'እኔ ማን ነኝ?', icon: '🕊', schema: 'WhoAmICard', connected: false },
  { id: 'match', en: 'Match & Discover', am: 'አዛምድ', icon: '🔗', schema: 'MatchPair[]', connected: false },
  { id: 'bible-timeline', en: 'Bible Timeline Challenge', am: 'የመጽሐፍ ቅዱስ የጊዜ ቅደም ተከተል', icon: '↔', schema: 'TlChain', connected: false },
  { id: 'adventures', en: 'Bible Adventure', am: 'የመጽሐፍ ቅዱስ ጀብዱ', icon: '⛵', schema: 'BibleAdventureStory', connected: false },
  { id: 'finish-the-mezmur', en: 'Finish the Mezmur', am: 'መዝሙሩን ጨርስ', icon: '🎶', schema: 'MezmurSong', connected: false },
  { id: 'trivia', en: 'Bible Tewahedo Trivia', am: 'ጥያቄና መልስ', icon: '❓', schema: 'PlayQuestion', connected: true },
  { id: 'emoji', en: 'Holy Emoji Challenge', am: 'የኢሞጂ ጥያቄ', icon: '😇', schema: 'PlayQuestion', connected: true },
  { id: 'finish-the-verse', en: 'Finish the Verse', am: 'ጥቅሱን ጨርስ', icon: '📖', schema: 'PlayQuestion', connected: true },
  { id: 'feasts', en: 'Church Feast Challenge', am: 'የበዓላት ፈተና', icon: '✠', schema: 'PlayImage[] (feasts)', connected: false },
  { id: 'saints', en: 'Guess the Saint', am: 'ቅዱሱን ይለዩ', icon: '☀', schema: 'PlayImage[] (saints/angels)', connected: false },
  { id: 'icon-memory', en: 'Icon Memory', am: 'የሥዕል ትውስታ', icon: '▦', schema: 'PlayImage[]', connected: false },
] as const
export type StudioGame = typeof STUDIO_GAMES[number]['id']
export type QuizStudioGame = 'history' | 'trivia' | 'emoji' | 'finish-the-verse'
type Content = {
  history: PlayQuestion; trivia: PlayQuestion; emoji: PlayQuestion; 'finish-the-verse': PlayQuestion
  'who-am-i': WhoAmICard; match: MatchPair[]; 'bible-timeline': TlChain; adventures: BibleAdventureStory
  'finish-the-mezmur': MezmurSong; feasts: PlayImage[]; saints: PlayImage[]; 'icon-memory': PlayImage[]
}
export type HistoryStudioEvent = { id: string; year: number; label: { en: string; am?: string }; source: SourceReference }
export type StudioDraft = { game: QuizStudioGame; content: PlayQuestion }
  | { [K in Exclude<StudioGame, QuizStudioGame>]: { game: K; content: Content[K] } }[Exclude<StudioGame, QuizStudioGame>]
  | { game: 'history'; format: 'timeline'; content: HistoryStudioEvent[] }
export type StudioRecord = {
  version: 1; id: string; owner: string; name: string; updatedAt: string
  status: QuestionStatus; draft: StudioDraft; remoteId?: string; deletedAt?: string
  stableId?: string; category?: string; difficulty?: 'beginner' | 'growing' | 'challenge'; reviewedAmharic?: boolean; sortOrder?: number
}
export const isQuizStudioGame = (game: string): game is QuizStudioGame => STUDIO_GAMES.some(item => item.id === game && item.connected)
export const isHistoryTimeline = (draft: StudioDraft): draft is Extract<StudioDraft, { format: 'timeline' }> => 'format' in draft && draft.format === 'timeline'
export const isServerStudioDraft = (draft: StudioDraft) => isQuizStudioGame(draft.game) && !isHistoryTimeline(draft)
export const isStudioGame = (value: string | null): value is StudioGame => STUDIO_GAMES.some(game => game.id === value)
export const studioText = (text: { en: string; am?: string }, locale: 'en' | 'am') => text[locale] || text.en
export function sourceOptions(): SourceReference[] {
  const sources = [...APPROVED_QUESTIONS, ...WHO_AM_I_CARDS, ...MATCH_PAIRS, ...PLAY_IMAGES].map(item => item.source)
  for (const chain of TIMELINE_CHAINS) for (const event of chain.events) sources.push({ label: event.ref, route: event.route, kind: 'bible' })
  return [...new Map(sources.map(source => [`${source.route}:${source.label}`, source])).values()]
}
export function templateDraft(game: StudioGame): StudioDraft {
  if (isQuizStudioGame(game)) return { game, content: structuredClone(APPROVED_QUESTIONS.find(item => item.game === game)!) }
  switch (game) {
    case 'who-am-i': return { game, content: structuredClone(WHO_AM_I_CARDS[0]) }
    case 'match': return { game, content: structuredClone(MATCH_PAIRS.slice(0, 4)) }
    case 'bible-timeline': return { game, content: structuredClone(TIMELINE_CHAINS[0]) }
    case 'adventures': return { game, content: structuredClone(bibleAdventureStories[0]) }
    case 'finish-the-mezmur': return { game, content: { slug: '', title: '', title_amharic: '', title_english: '', primary_language: 'am', lyrics_amharic: '', lyrics_transliteration: '', lyrics_english: '', youtube_url: null } }
    case 'feasts': return { game, content: structuredClone(PLAY_IMAGES.filter(item => item.kind === 'feast').slice(0, 4)) }
    case 'saints': return { game, content: structuredClone(PLAY_IMAGES.filter(item => item.kind !== 'feast').slice(0, 4)) }
    case 'icon-memory': return { game, content: structuredClone(PLAY_IMAGES.slice(0, 4)) }
  }
}
const object = (value: unknown): value is Record<string, unknown> => !!value && typeof value === 'object' && !Array.isArray(value)
const filled = (value: unknown): value is string => typeof value === 'string' && value.trim().length > 0 && value.length <= 20000
const slug = (value: unknown) => typeof value === 'string' && /^[a-z0-9]+(?:-[a-z0-9]+)*$/.test(value) && value.length <= 160
function localized(value: unknown, label: string, errors: string[], am = false) {
  if (!object(value) || !filled(value.en) || (am && !filled(value.am)) || (value.am !== undefined && typeof value.am !== 'string')) errors.push(`${label}: English${am ? ' and reviewed Amharic' : ''} text required.`)
}
function source(value: unknown, errors: string[]) {
  if (!object(value) || !filled(value.label) || !internalSource(value.route) || !['bible', 'church-library', 'calendar', 'mezmur'].includes(String(value.kind))) errors.push('Select a valid internal source reference.')
  else {
    const prefixes: Record<string, RegExp> = { bible: /^\/bible(?:[/?#]|$)/, 'church-library': /^\/library(?:[/?#]|$)/, calendar: /^\/calendar(?:[/?#]|$)/, mezmur: /^\/(hymns|practice)(?:[/?#]|$)/ }
    if (!prefixes[String(value.kind)].test(value.route)) errors.push('Source kind must match its destination.')
  }
}
function ids(rows: unknown[], errors: string[]) {
  const values = rows.map(row => object(row) ? row.id : null)
  if (values.some(id => !slug(id)) || new Set(values).size !== values.length) errors.push('Item IDs must be unique lowercase slugs.')
}
export function toQuestionDraft(draft: StudioDraft): QuestionDraft {
  if (!isServerStudioDraft(draft)) throw new Error('This format is not connected to the public question reader.')
  const content = draft.content as PlayQuestion
  return { stable_id: content.id, game_type: draft.game as QuizStudioGame, category: content.category, difficulty: content.difficulty,
    payload: structuredClone(content) as unknown as Record<string, unknown>, source_references: [structuredClone(content.source)] }
}
export function validateStudioDraft(value: unknown, options: { allowMissingImages?: boolean } = {}): string[] {
  const errors: string[] = []
  if (!object(value) || !isStudioGame(String(value.game))) return ['Unknown studio format.']
  if (JSON.stringify(value).length > 500000) return ['Draft exceeds 500 KB.']
  const { game, content } = value
  if ('format' in value) {
    if (game !== 'history' || value.format !== 'timeline' || !Array.isArray(content) || content.length < 3 || content.length > 30) return ['Use 3–30 historical events in the supported local chronology format.']
    ids(content, errors)
    const years: number[] = []
    for (const event of content) {
      if (!object(event)) { errors.push('Invalid historical event.'); continue }
      localized(event.label, 'Historical event', errors); source(event.source, errors)
      if (!Number.isSafeInteger(event.year) || Number(event.year) < 1 || Number(event.year) > 3000) errors.push('Use a documented AD year from 1–3000. Other era/date schemes are unsupported.')
      else years.push(Number(event.year))
    }
    if (new Set(years).size !== years.length) errors.push('Historical years must be distinct; the current grader requires a strict order.')
    return errors
  }
  if (isQuizStudioGame(String(game))) {
    if (!object(content)) return ['Question content is required.']
    errors.push(...validateQuestionDraft(toQuestionDraft(value as StudioDraft)))
    source(content.source, errors)
    if (content.game !== game) errors.push('Question game must match its editor.')
    return errors
  }
  if (game === 'match') {
    if (!Array.isArray(content) || content.length < 1 || content.length > 20) return ['Use 1–20 matching pairs.']
    ids(content, errors)
    for (const pair of content) {
      if (!object(pair)) { errors.push('Invalid pair.'); continue }
      errors.push(...validateCardContent('match', pair))
    }
    for (const language of ['en', 'am']) for (const side of ['left', 'right']) {
      const labels = content.map(pair => object(pair) && object(pair[side]) ? String(pair[side][language] || '').normalize('NFKC').toLocaleLowerCase().trim() : '').filter(Boolean)
      if (new Set(labels).size !== labels.length) errors.push('Matching sides must have distinct labels.')
    }
    return errors
  }
  if (game === 'feasts' || game === 'saints' || game === 'icon-memory') {
    if (!Array.isArray(content) || content.length < 4 || content.length > 12) return ['Use 4–12 existing image cards.']
    if (game === 'icon-memory' && ![4, 6, 8].includes(content.length)) errors.push('Icon Memory supports exactly 4, 6 or 8 pairs.')
    ids(content, errors)
    for (const item of content) {
      if (!object(item)) { errors.push('Invalid image card.'); continue }
      const approved = PLAY_IMAGES.find(image => image.id === item.id)
      const removed = item.src === '' && item.fallbackSrc === ''
      if (!approved || (!removed && (item.src !== approved.src || item.fallbackSrc !== approved.fallbackSrc))) errors.push('Choose media from the existing game image catalog.')
      if (removed && !options.allowMissingImages) errors.push('Replace the removed image before gameplay or publication. / ከጨዋታ ወይም ከህትመት በፊት ምስሉን ይተኩ።')
      if ((game === 'feasts' && item.kind !== 'feast') || (game === 'saints' && item.kind === 'feast')) errors.push('Image kind does not match this game.')
      localized(item.answer, 'Image answer', errors); localized(item.explanation, 'Image explanation', errors); source(item.source, errors)
      if (!filled(item.description) || !['feast', 'saint', 'angel'].includes(String(item.kind))) errors.push('Image description and supported kind required.')
    }
    return errors
  }
  if (!object(content)) return ['Content must match the game schema.']
  if (game === 'finish-the-mezmur') {
    if (!slug(content.slug) || !filled(content.title) || !filled(content.lyrics_amharic)) errors.push('Select a published lyric source with its slug, title and Amharic lyrics.')
    if (typeof content.lyrics_amharic === 'string' && usableLines(content as unknown as MezmurSong).length < 5) errors.push('This game requires five usable lyric lines (at least three words each).')
    if (content.youtube_url && (typeof content.youtube_url !== 'string' || !/^https:\/\/(www\.)?(youtube\.com\/watch\?|youtu\.be\/)/.test(content.youtube_url))) errors.push('Use a supported HTTPS YouTube media link.')
  } else if (game === 'who-am-i') {
    errors.push(...validateCardContent('who-am-i', content))
  } else if (game === 'bible-timeline') {
    if (!slug(content.id)) errors.push('Timeline ID required.')
    localized(content.title, 'Timeline', errors)
    if (!Array.isArray(content.events) || content.events.length < 3 || content.events.length > 50) return [...errors, 'Use 3–50 events.']
    ids(content.events, errors)
    for (const event of content.events) {
      if (!object(event)) { errors.push('Invalid event.'); continue }
      localized(event.title, 'Event', errors)
      if (!filled(event.ref) || !internalSource(event.route) || !String(event.route).startsWith('/bible/') || !filled(event.note)) errors.push('Each event needs a Bible citation, route and explanation.')
    }
  } else if (game === 'adventures') {
    const template = bibleAdventureStories.find(story => story.id === content.id)
    if (!template || template.art !== content.art) errors.push('Choose an existing artwork/story binding.')
    localized(content.title, 'Story', errors); localized(content.summary, 'Summary', errors)
    if (!filled(content.passage)) errors.push('Story passage reference required.')
    if (!Array.isArray(content.scenes) || content.scenes.length !== 3) return [...errors, 'The current Adventure engine requires exactly three linear scenes.']
    for (const [sceneIndex, scene] of content.scenes.entries()) {
      if (!object(scene)) { errors.push('Invalid scene.'); continue }
      localized(scene.title, 'Scene title', errors); localized(scene.narrative, 'Narrative', errors)
      const ref = object(scene.source) ? scene.source : {}
      if (!slug(ref.slug) || !filled(ref.book) || ![ref.chapter, ref.firstVerse, ref.lastVerse].every(n => Number.isInteger(n) && Number(n) > 0)
        || Number(ref.lastVerse) < Number(ref.firstVerse)) errors.push('Scene needs an ordered, positive Scripture citation.')
      const interaction = object(scene.interaction) ? scene.interaction : {}
      const original = template?.scenes[sceneIndex]?.interaction
      if (original) {
        if (interaction.kind !== original.kind) errors.push('Existing artwork requires the template scene interaction.')
        const expectedIds = original.kind === 'discover' ? original.details.map(item => item.id) : original.choices.map(item => item.id)
        const items = interaction.kind === 'discover' ? interaction.details : interaction.choices
        const actualIds = Array.isArray(items) ? items.map(item => object(item) ? item.id : null) : []
        if (actualIds.length !== expectedIds.length || expectedIds.some(id => !actualIds.includes(id))) errors.push('Existing artwork object IDs must match the selected story template.')
        if (original.kind === 'question' && interaction.correctId !== original.correctId) errors.push('This artwork outcome is bound to the template correct choice; new outcomes need an artwork/engine adapter.')
      }
      if ('branches' in scene || 'nextSceneId' in interaction || 'outcomes' in interaction) errors.push('Branch links are unsupported by the current three-scene engine.')
      if (interaction.kind === 'discover') {
        if (!Array.isArray(interaction.details) || interaction.details.length !== 2) errors.push('Discovery scenes require exactly two details.')
        else { ids(interaction.details, errors); for (const detail of interaction.details) { if (object(detail)) { localized(detail.label, 'Discovery label', errors); localized(detail.finding, 'Finding', errors) } } }
      } else if (interaction.kind === 'question') {
        localized(interaction.prompt, 'Scene prompt', errors); localized(interaction.explanation, 'Scene explanation', errors)
        if (!Array.isArray(interaction.choices) || interaction.choices.length < 2 || interaction.choices.length > 6) errors.push('Use 2–6 scene choices.')
        else {
          ids(interaction.choices, errors)
          for (const choice of interaction.choices) if (object(choice)) localized(choice.label, 'Choice', errors)
          if (interaction.choices.some(choice => object(choice) && ('nextSceneId' in choice || 'outcome' in choice))) errors.push('Choice branches are unsupported by the current engine.')
          if (!interaction.choices.some(choice => object(choice) && choice.id === interaction.correctId)) errors.push('The scene correct answer must reference an existing choice.')
        }
      } else errors.push('Unsupported scene interaction or branch. Only discover/question linear scenes are supported.')
    }
  }
  return errors
}
export function fromQuestionRow(row: QuestionRow, owner: string): StudioRecord | null {
  if (!isQuizStudioGame(row.game_type) && row.game_type !== 'who-am-i' && row.game_type !== 'match') return null
  const draft: StudioDraft = row.game_type === 'who-am-i' ? { game: 'who-am-i', content: structuredClone(row.payload) as unknown as WhoAmICard }
    : row.game_type === 'match' ? { game: 'match', content: [structuredClone(row.payload) as unknown as MatchPair] }
      : { game: row.game_type, content: structuredClone(row.payload) as unknown as PlayQuestion }
  if (validateStudioDraft(draft).length) throw new Error('A server question has an incompatible payload. Review it in the existing question library; nothing was changed.')
  const payloadId = draft.game === 'match' ? draft.content[0].id : (draft.content as { id: string }).id
  if (row.stable_id !== payloadId || row.question_id !== row.stable_id) throw new Error('Server question identifiers need reconciliation. Nothing was changed.')
  return { version: 1, id: row.id, remoteId: row.id, owner, name: String((row.payload.prompt as { en?: string })?.en || row.stable_id),
    updatedAt: row.updated_at, status: row.status, draft }
}
export function newStudioRecord(game: StudioGame, owner: string, id = crypto.randomUUID()): StudioRecord {
  const draft = templateDraft(game)
  if (isQuizStudioGame(draft.game)) (draft.content as PlayQuestion).id = `${game}-${id}`
  return { version: 1, id, owner, name: STUDIO_GAMES.find(item => item.id === game)!.en, updatedAt: new Date().toISOString(), status: 'draft', draft }
}
export function newHistoryTimelineRecord(owner: string, id = crypto.randomUUID()): StudioRecord {
  return { ...newStudioRecord('history', owner, id), name: 'History Quest chronology',
    draft: { game: 'history', format: 'timeline', content: structuredClone(HISTORY_TIMELINE) } }
}
export function duplicateStudioRecord(record: StudioRecord, id = crypto.randomUUID()): StudioRecord {
  const copy = structuredClone(record)
  copy.id = id; delete copy.remoteId; delete copy.deletedAt; delete copy.stableId; copy.status = 'draft'; copy.name += ' (copy)'; copy.updatedAt = new Date().toISOString()
  if (isServerStudioDraft(copy.draft)) (copy.draft.content as PlayQuestion).id = `${copy.draft.game}-${id}`
  return copy
}

export function exactVerseFragment(text: string, excerpt: string, answer: string): boolean {
  return !!answer && excerpt.split('____').length === 2 && text.includes(excerpt.replace('____', answer))
}
/** Re-fetch public source evidence before the new studio requests publication.
 * This is a client safeguard, not a replacement for server/editorial approval. */
export async function verifyStudioVerse(draft: StudioDraft, fetchPassage: (params: {
  bookSlug: string; chapterNumber: number; verseStart: number; preferredEdition: 'am' | 'web'
}) => Promise<{ isComplete: boolean; editionCode: string; readerHref: string; verses: { id: string; text: string }[] } | null>) {
  if (draft.game !== 'finish-the-verse') return
  const question = draft.content
  const route = /^\/bible\/([a-z0-9-]+)\/(\d+)(?:[?#]|$)/.exec(question.source.route)
  const citation = /(\d+)[:፥](\d+)/.exec(question.source.label)
  if (!route || !citation) throw new Error('Use an exact book/chapter/verse source before publishing this excerpt.')
  const answer = question.options.find(option => option.key === question.correctKey)?.text
  const declared = new URL(question.source.route, 'https://studio.invalid')
  const declaredEdition = declared.searchParams.get('edition') || 'web'
  if (!['am', 'web'].includes(declaredEdition)) throw new Error('The source edition must be exactly am or web.')
  for (const locale of question.verifiedLocales) {
    const edition = locale === 'am' ? 'am' : 'web'
    const passage = await fetchPassage({ bookSlug: route[1], chapterNumber: Number(citation[1]), verseStart: Number(citation[2]), preferredEdition: edition })
    const matchesReader = passage && declaredEdition !== edition
      ? true : passage && new URL(passage.readerHref, 'https://studio.invalid').pathname === declared.pathname
    if (!passage?.isComplete || !matchesReader || passage.editionCode !== edition || !passage.verses.some(verse => exactVerseFragment(verse.text, question.excerpt?.[locale] || '', answer?.[locale] || ''))) {
      throw new Error(`Cannot verify the ${locale} excerpt against its exact published source. Use the passage picker; publication was not requested.`)
    }
  }
}

/** Local-only drafts never claim approved/published state. Nothing syncs automatically. */
export function studioStorage(storage: Pick<Storage, 'getItem' | 'setItem'>, owner: string, role: string) {
  if (!/^[a-zA-Z0-9-]{1,100}$/.test(owner) || !['editor', 'admin', 'super_admin'].includes(role)) throw new Error('Staff access is required.')
  const key = `tewahedo.studio.drafts.v1.${owner}`
  const validMetadata = (record: Record<string, unknown>) => record.version === 1
    && typeof record.id === 'string' && /^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$/i.test(record.id)
    && typeof record.name === 'string' && !!record.name.trim() && record.name.length <= 500
    && typeof record.updatedAt === 'string' && Number.isFinite(Date.parse(record.updatedAt))
    && (record.category === undefined || (typeof record.category === 'string' && !!record.category.trim() && record.category.length <= 200))
    && (record.difficulty === undefined || ['beginner', 'growing', 'challenge'].includes(String(record.difficulty)))
    && (record.sortOrder === undefined || (Number.isSafeInteger(record.sortOrder) && Number(record.sortOrder) >= 0 && Number(record.sortOrder) <= 100000))
    && (record.reviewedAmharic === undefined || typeof record.reviewedAmharic === 'boolean')
  const all = (): StudioRecord[] => {
    const raw = storage.getItem(key)
    if (!raw) return []
    if (raw.length > 2000000) throw new Error('Local studio storage exceeds its size limit.')
    let values: unknown
    try { values = JSON.parse(raw) } catch { throw new Error('Local studio storage is invalid. Existing data has been preserved.') }
    if (!Array.isArray(values) || values.length > 100) throw new Error('Invalid local draft collection.')
    for (const value of values) {
      if (!object(value) || !validMetadata(value) || value.owner !== owner || value.remoteId
        || (value.deletedAt !== undefined && (typeof value.deletedAt !== 'string' || !Number.isFinite(Date.parse(value.deletedAt))))
        || !['draft', 'archived'].includes(String(value.status)) || validateStudioDraft(value.draft, { allowMissingImages: true }).length) throw new Error('Invalid local draft. Existing data has been preserved.')
    }
    if (new Set(values.map(value => (value as StudioRecord).id)).size !== values.length) throw new Error('Duplicate local draft IDs.')
    return values as StudioRecord[]
  }
  const save = (record: StudioRecord) => {
    if (record.owner !== owner || record.remoteId || record.deletedAt !== undefined || !['draft', 'archived'].includes(record.status)) throw new Error('Local drafts cannot publish or replace a server record.')
    const errors = validateStudioDraft(record.draft, { allowMissingImages: true })
    if (!validMetadata(record) || errors.length) throw new Error(errors.join(' ') || 'Valid draft metadata is required.')
    const current = all()
    if (current.some(item => item.id === record.id && item.deletedAt)) throw new Error('Restore the deleted draft before editing it.')
    const records = current.filter(item => item.id !== record.id)
    records.push(structuredClone(record))
    const raw = JSON.stringify(records)
    if (records.length > 100 || raw.length > 2000000) throw new Error('Local studio storage is full. Export drafts before continuing.')
    storage.setItem(key, raw)
  }
  // One atomic write retains the recovery copy; there is no second-key copy/delete window.
  const changeDeleted = (id: string, deleted: boolean) => {
    const records = all()
    const record = records.find(item => item.id === id)
    if (!record || !!record.deletedAt === deleted) throw new Error('The local draft is no longer available for this action.')
    if (deleted) record.deletedAt = new Date().toISOString()
    else delete record.deletedAt
    const raw = JSON.stringify(records)
    if (raw.length > 2000000) throw new Error('Local studio storage is full. Export drafts before continuing.')
    storage.setItem(key, raw)
    return structuredClone(record)
  }
  return { load: () => all().filter(item => !item.deletedAt), deleted: () => all().filter(item => !!item.deletedAt), save,
    remove: (id: string) => changeDeleted(id, true), restore: (id: string) => changeDeleted(id, false) }
}
