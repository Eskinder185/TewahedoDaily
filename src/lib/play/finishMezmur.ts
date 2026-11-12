/**
 * Finish the Mezmur — question generation from verified Supabase lyrics
 * (spec Phase 2). Nothing here is invented: every answer is an exact line
 * from a published Mezmur's reviewed lyrics, and the wording and line order
 * are preserved. Three modes: choose the missing line, arrange the words,
 * type the missing line. Easy / medium / hard change how much is revealed.
 */

export type MezmurSong = {
  slug: string
  title: string
  title_amharic: string | null
  title_english: string | null
  primary_language: string | null
  lyrics_amharic: string | null
  lyrics_transliteration: string | null
  lyrics_english: string | null
  youtube_url: string | null
}

export type FmMode = 'choose' | 'arrange' | 'type'
export type FmDifficulty = 'easy' | 'medium' | 'hard'

export type LyricReading = { am: string; tr: string }
export type FmOption = { key: string; am: string; tr: string }

export type FmQuestion = {
  id: string
  mode: FmMode
  difficulty: FmDifficulty
  slug: string
  title: string
  titleAmharic: string | null
  youtubeUrl: string | null
  /** Lines shown before the blank (already cleaned). */
  contextBefore: LyricReading[]
  /** Lines shown after the blank (easy mode only). */
  contextAfter: LyricReading[]
  /** The exact missing line. */
  answer: LyricReading
  /** choose mode: four options including the answer. */
  options?: FmOption[]
  correctKey?: string
  /** arrange mode: the answer's words, and a shuffled presentation order. */
  words?: string[]
  shuffledWords?: string[]
}

/** Repeat and section markers that are not part of the sung text. */
const REPEAT_MARKER = /\s*[/(]?\s*(?:\d+|[፩-፼]+)\s*(?:×|x)?\s*[/)]?\s*$/u
const INLINE_PAREN = /\s*\([^)]*\)\s*/gu
const SECTION_LABEL = /^(?:አ\.?\s*ዝ\.*|አዝ[.…]*|az[.…]*|[0-9/×()]+|[፩-፼/×()]+|[.…]+)$/iu

/** Strip trailing repeat markers and parentheticals; collapse whitespace. */
export function cleanLyricLine(line: string): string {
  let s = line
  // Parentheticals may nest, e.g. "(እስራኤል ተነሳ(2×))"; remove repeatedly.
  for (let i = 0; i < 4; i++) {
    const next = s.replace(INLINE_PAREN, ' ')
    if (next === s) break
    s = next
  }
  s = s.replace(/[()[\]]/gu, ' ')
  // A line may carry several markers (e.g. "… /2/ …/2/"); strip from the end.
  for (let i = 0; i < 3; i++) s = s.replace(REPEAT_MARKER, '')
  return s.replace(/\s+/g, ' ').trim()
}

/** Normalised form for grading and distractor de-duplication. */
export function normalizeForCompare(line: string): string {
  return cleanLyricLine(line)
    .toLowerCase()
    .replace(/[።፣፤፥፦፧፨!?,.;:"'`’‘“”()/\\-]+/gu, '')
    .replace(/\s+/g, ' ')
    .trim()
}

const isSectionLabel = (cleaned: string) => cleaned === '' || SECTION_LABEL.test(cleaned)
const wordCount = (cleaned: string) => (cleaned ? cleaned.split(/\s+/).length : 0)

export type UsableLine = { index: number; am: string; tr: string; norm: string }

/**
 * Aligned, cleaned, usable lyric lines for a song. A line is usable when it is
 * not a section/repeat label and has at least `minWords` words. Transliteration
 * is kept aligned when its line count matches the Amharic; otherwise it is blank.
 */
export function usableLines(song: MezmurSong, minWords = 3): UsableLine[] {
  const am = (song.lyrics_amharic || '').split(/\r?\n/)
  const trRaw = (song.lyrics_transliteration || '').split(/\r?\n/)
  const amLines = am.map((l) => l.trim())
  const trAligned = trRaw.length === amLines.length ? trRaw.map((l) => l.trim()) : null
  const out: UsableLine[] = []
  amLines.forEach((raw, index) => {
    const cleaned = cleanLyricLine(raw)
    if (isSectionLabel(cleaned) || wordCount(cleaned) < minWords) return
    const tr = trAligned ? cleanLyricLine(trAligned[index]) : ''
    out.push({ index, am: cleaned, tr, norm: normalizeForCompare(raw) })
  })
  return out
}

function mulberry32(seed: number) {
  let a = seed >>> 0
  return () => {
    a |= 0
    a = (a + 0x6d2b79f5) | 0
    let t = Math.imul(a ^ (a >>> 15), 1 | a)
    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296
  }
}

function shuffle<T>(items: T[], random: () => number): T[] {
  const a = [...items]
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(random() * (i + 1))
    ;[a[i], a[j]] = [a[j], a[i]]
  }
  return a
}

const MAX_ARRANGE_WORDS = 8
const MIN_ARRANGE_WORDS = 3

/**
 * Build every possible question for a mode + difficulty across the songs,
 * deduplicated by stable id. The caller then selects a non-repeating subset
 * (see questionHistory.selectUnseen).
 */
export function buildFinishMezmurBank(
  songs: MezmurSong[],
  mode: FmMode,
  difficulty: FmDifficulty,
  random: () => number = Math.random,
): FmQuestion[] {
  const perSong = songs.map((s) => ({ song: s, lines: usableLines(s) }))
  // Global distractor pool: one entry per distinct normalised line.
  const pool = new Map<string, LyricReading>()
  for (const { lines } of perSong) for (const l of lines) if (!pool.has(l.norm)) pool.set(l.norm, { am: l.am, tr: l.tr })
  const poolList = [...pool.entries()]

  const questions: FmQuestion[] = []

  for (const { song, lines } of perSong) {
    if (lines.length < 2) continue
    lines.forEach((line, i) => {
      // Need at least one preceding line for context (so the blank is never the
      // very first line): honours "different sections, not only the first line".
      if (mode !== 'arrange' && i === 0) return

      const contextBefore = lines.slice(Math.max(0, i - 2), i).map((l) => ({ am: l.am, tr: l.tr }))
      const contextAfter = difficulty === 'easy' && i + 1 < lines.length ? [{ am: lines[i + 1].am, tr: lines[i + 1].tr }] : []
      const answer: LyricReading = { am: line.am, tr: line.tr }
      const base = { id: `fm:${song.slug}:${mode}:${line.index}`, mode, difficulty, slug: song.slug, title: song.title, titleAmharic: song.title_amharic, youtubeUrl: song.youtube_url, contextBefore, contextAfter, answer }

      if (mode === 'choose') {
        // Distractors: distinct real lines from other songs, never equal to the answer.
        const distractors = shuffle(poolList.filter(([norm]) => norm !== line.norm), random)
          .slice(0, 3)
          .map(([, reading]) => reading)
        if (distractors.length < 3) return
        const options = shuffle([answer, ...distractors], random).map((reading, k) => ({ key: String(k), am: reading.am, tr: reading.tr }))
        const correctKey = options.find((o) => normalizeForCompare(o.am) === line.norm)!.key
        questions.push({ ...base, options, correctKey })
      } else if (mode === 'arrange') {
        const words = line.am.split(/\s+/).filter(Boolean)
        if (words.length < MIN_ARRANGE_WORDS || words.length > MAX_ARRANGE_WORDS) return
        // Ensure a shuffle that is not already in order.
        let shuffled = shuffle(words, random)
        for (let tries = 0; tries < 4 && shuffled.join(' ') === words.join(' '); tries++) shuffled = shuffle(words, random)
        questions.push({ ...base, words, shuffledWords: shuffled })
      } else {
        questions.push(base)
      }
    })
  }
  return questions
}

/** Deterministic bank for tests / daily challenges. */
export function buildFinishMezmurBankSeeded(songs: MezmurSong[], mode: FmMode, difficulty: FmDifficulty, seed: number) {
  return buildFinishMezmurBank(songs, mode, difficulty, mulberry32(seed))
}

/** Grade a typed answer against the exact line (either reading accepted). */
export function gradeTyped(input: string, answer: LyricReading): boolean {
  const got = normalizeForCompare(input)
  if (!got) return false
  return got === normalizeForCompare(answer.am) || (Boolean(answer.tr) && got === normalizeForCompare(answer.tr))
}

export const FM_MODES: readonly FmMode[] = ['choose', 'arrange', 'type']

/**
 * A round that mixes formats: each slot gets the next format from a freshly shuffled cycle (so a 6-question
 * round has two of each, in a different order every time), preferring questions the player has not seen.
 * A format with no questions at this level is skipped, never faked. Pure; `random` is injectable for tests.
 */
export function selectMixedRound(
  banks: Record<FmMode, FmQuestion[]>,
  seen: { has: (id: string) => boolean },
  count: number,
  random: () => number = Math.random,
): { picked: FmQuestion[]; exhausted: boolean } {
  const shuffled = <T,>(items: T[]) => {
    const a = [...items]
    for (let i = a.length - 1; i > 0; i--) {
      const j = Math.floor(random() * (i + 1))
      ;[a[i], a[j]] = [a[j], a[i]]
    }
    return a
  }
  const queues = new Map<FmMode, FmQuestion[]>()
  for (const mode of FM_MODES) {
    const unique = [...new Map(banks[mode].map((q) => [q.id, q])).values()]
    queues.set(mode, [...shuffled(unique.filter((q) => !seen.has(q.id))), ...shuffled(unique.filter((q) => seen.has(q.id)))])
  }
  const picked: FmQuestion[] = []
  let cycle: FmMode[] = []
  let guard = 0
  while (picked.length < count && guard++ < count * 6) {
    if (!cycle.length) cycle = shuffled(FM_MODES.filter((mode) => (queues.get(mode) ?? []).length > 0))
    if (!cycle.length) break
    const mode = cycle.pop()!
    const next = queues.get(mode)!.shift()
    if (next) picked.push(next)
  }
  const all = FM_MODES.flatMap((mode) => banks[mode])
  const freshLeft = all.filter((q) => !seen.has(q.id)).length
  return { picked, exhausted: picked.some((q) => seen.has(q.id)) && freshLeft < count }
}
