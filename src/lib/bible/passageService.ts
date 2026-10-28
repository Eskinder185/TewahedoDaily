/**
 * TEWAHEDODAILY — BIBLE PASSAGE FETCHING SERVICE
 *
 * Retrieves exact verse sequences from Supabase for scripture recommendations
 * and previews. Preserves original translation text, ensures complete passages,
 * supports English, Amharic, and Parallel reading modes, and provides deep links.
 */

import { supabase } from '../supabase/client'
import type { BibleEdition, BibleChapter, SourceBook } from './bibleTypes'

export interface BiblePassageVerse {
  id: string
  verseNumber: number
  text: string
}

export interface BiblePassageResult {
  bookSlug: string
  bookTitleEn: string
  bookTitleAm: string
  chapterNumber: number
  chapterOrdinal: number
  editionCode: string
  editionName: string
  languageCode: string
  requestedRange: { start: number; end: number }
  verses: BiblePassageVerse[]
  isComplete: boolean
  missingVerses: number[]
  readerHref: string
}

export interface BilingualPassageResult {
  amharic?: BiblePassageResult
  english?: BiblePassageResult
  preferredMode: 'en' | 'am' | 'parallel'
}

// In-memory cache to prevent repeated database roundtrips
const passageCache = new Map<string, BiblePassageResult | null>()

/**
 * Fetches a specific verse range for a given book slug, chapter, and edition.
 */
export async function fetchBiblePassage(params: {
  bookSlug: string
  chapterNumber: number
  verseStart: number
  verseEnd?: number
  preferredEdition?: 'am' | 'web'
}): Promise<BiblePassageResult | null> {
  const { bookSlug, chapterNumber, verseStart } = params
  const verseEnd = params.verseEnd || verseStart
  const preferredEdition = params.preferredEdition || 'en'
  const targetEditionCode = preferredEdition === 'am' ? 'am' : 'web'

  const cacheKey = `${bookSlug}:${chapterNumber}:${verseStart}-${verseEnd}:${targetEditionCode}`
  if (passageCache.has(cacheKey)) {
    return passageCache.get(cacheKey) || null
  }

  if (!supabase) {
    return null
  }

  try {
    // 1. Resolve canonical book
    const { data: book, error: bookErr } = await supabase
      .from('bible_canonical_books')
      .select('*')
      .eq('slug', bookSlug)
      .maybeSingle()

    if (bookErr || !book) {
      passageCache.set(cacheKey, null)
      return null
    }

    // 2. Fetch source books and editions for this canonical book
    const { data: sources, error: sourceErr } = await supabase
      .from('bible_source_books')
      .select('*, bible_editions(*)')
      .eq('canonical_book_id', book.id)

    if (sourceErr || !sources || sources.length === 0) {
      passageCache.set(cacheKey, null)
      return null
    }

    // Never show an English edition under the Amharic label (or vice versa).
    const matchedSource = (sources as unknown as (SourceBook & { bible_editions: BibleEdition | null })[]).find((s) => s.bible_editions?.code === targetEditionCode)
    if (!matchedSource) {
      return null
    }

    const edition = matchedSource.bible_editions
    if (!edition) {
      passageCache.set(cacheKey, null)
      return null
    }

    // 3. Find target chapter
    const { data: chapters, error: chapterErr } = await supabase
      .from('bible_chapters')
      .select('*')
      .eq('source_book_id', matchedSource.id)
      .eq('chapter_number', chapterNumber)
      .order('source_order')

    if (chapterErr || !chapters || chapters.length === 0) {
      passageCache.set(cacheKey, null)
      return null
    }

    const chapter = chapters[0] as BibleChapter
    // Ordinal is typically chapter_number unless multi-volume offset exists
    const chapterOrdinal = chapter.chapter_number

    // 4. Fetch the requested verses
    // Build list of expected verse numbers
    const expectedVerseNumbers: number[] = []
    for (let v = verseStart; v <= verseEnd; v++) {
      expectedVerseNumbers.push(v)
    }

    const { data: rawVerses, error: verseErr } = await supabase
      .from('bible_verses')
      .select('id, verse_number, text, source_order')
      .eq('chapter_id', chapter.id)
      .gte('verse_number', verseStart)
      .lte('verse_number', verseEnd)
      .order('verse_number')
      .order('source_order')

    if (verseErr || !rawVerses || rawVerses.length === 0) {
      passageCache.set(cacheKey, null)
      return null
    }

    // Filter out duplicates (if any multiple translations in single volume)
    const verseMap = new Map<number, BiblePassageVerse>()
    for (const rv of rawVerses) {
      if (!verseMap.has(rv.verse_number)) {
        verseMap.set(rv.verse_number, {
          id: rv.id,
          verseNumber: rv.verse_number,
          text: (rv.text || '').trim(),
        })
      }
    }

    const verses = Array.from(verseMap.values()).sort((a, b) => a.verseNumber - b.verseNumber)

    // Check for missing verses in the range
    const foundNumbers = new Set(verses.map((v) => v.verseNumber))
    const missingVerses = expectedVerseNumbers.filter((n) => !foundNumbers.has(n))
    const isComplete = missingVerses.length === 0

    const readerHref = `/bible/${book.slug}/${chapterOrdinal}?edition=${encodeURIComponent(
      edition.code
    )}#verse-${verseStart}`

    const result: BiblePassageResult = {
      bookSlug: book.slug,
      bookTitleEn: book.name_en || book.slug,
      bookTitleAm: book.name_am || book.name_en || book.slug,
      chapterNumber,
      chapterOrdinal,
      editionCode: edition.code,
      editionName: edition.name,
      languageCode: edition.language_code || (edition.code === 'am' ? 'am' : 'en'),
      requestedRange: { start: verseStart, end: verseEnd },
      verses,
      isComplete,
      missingVerses,
      readerHref,
    }

    passageCache.set(cacheKey, result)
    return result
  } catch (cause) {
    if (import.meta.env.DEV) console.error('[passageService] fetch error', cause)
    return null
  }
}

/**
 * Fetches bilingual (Amharic & English) passages in parallel.
 */
export async function fetchBiblePassageBilingual(params: {
  bookSlug: string
  chapterNumber: number
  verseStart: number
  verseEnd?: number
}): Promise<{
  amharic: BiblePassageResult | null
  english: BiblePassageResult | null
}> {
  const [amharic, english] = await Promise.all([
    fetchBiblePassage({ ...params, preferredEdition: 'am' }),
    fetchBiblePassage({ ...params, preferredEdition: 'web' }),
  ])
  return { amharic, english }
}
