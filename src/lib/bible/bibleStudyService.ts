/**
 * TEWAHEDODAILY — BIBLE PERSONAL STUDY SERVICE
 *
 * Manages verse bookmarks, color highlights, personal notes,
 * and reading history for guests (localStorage) and authenticated users.
 */

export type HighlightColor = 'gold' | 'emerald' | 'sapphire' | 'rose'

export interface BibleBookmark {
  id: string
  bookSlug: string
  chapter: number
  verseNumber: number
  editionCode?: string
  verseText: string
  bookTitle: string
  createdAt: string
}

export interface BibleHighlight {
  id: string
  bookSlug: string
  chapter: number
  verseNumber: number
  color: HighlightColor
  createdAt: string
}

export interface BibleVerseNote {
  id: string
  bookSlug: string
  chapter: number
  verseNumber: number
  noteText: string
  createdAt: string
  updatedAt: string
}

export interface BibleRecentChapter {
  bookSlug: string
  bookName: string
  chapter: number
  timestamp: number
}

const STORAGE_BOOKMARKS = 'td_bible_bookmarks_v1'
const STORAGE_HIGHLIGHTS = 'td_bible_highlights_v1'
const STORAGE_NOTES = 'td_bible_notes_v1'
const STORAGE_RECENTS = 'td_bible_recents_v1'

const EVENT_STUDY_UPDATED = 'td-bible-study-updated'

function getStored<T>(key: string, fallback: T): T {
  try {
    const raw = localStorage.getItem(key)
    return raw ? JSON.parse(raw) : fallback
  } catch {
    return fallback
  }
}

function setStored<T>(key: string, data: T): void {
  try {
    localStorage.setItem(key, JSON.stringify(data))
    window.dispatchEvent(new CustomEvent(EVENT_STUDY_UPDATED, { detail: { key } }))
  } catch {}
}

export const bibleStudyService = {
  // --- BOOKMARKS ---
  getBookmarks(): BibleBookmark[] {
    return getStored<BibleBookmark[]>(STORAGE_BOOKMARKS, [])
  },

  isBookmarked(bookSlug: string, chapter: number, verseNumber: number): boolean {
    const list = this.getBookmarks()
    return list.some(
      (b) => b.bookSlug === bookSlug && b.chapter === chapter && b.verseNumber === verseNumber
    )
  },

  toggleBookmark(
    bookSlug: string,
    chapter: number,
    verseNumber: number,
    verseText: string,
    bookTitle: string
  ): boolean {
    const list = this.getBookmarks()
    const idx = list.findIndex(
      (b) => b.bookSlug === bookSlug && b.chapter === chapter && b.verseNumber === verseNumber
    )

    if (idx >= 0) {
      list.splice(idx, 1)
      setStored(STORAGE_BOOKMARKS, list)
      return false
    } else {
      const newBm: BibleBookmark = {
        id: `bm_${bookSlug}_${chapter}_${verseNumber}`,
        bookSlug,
        chapter,
        verseNumber,
        verseText,
        bookTitle,
        createdAt: new Date().toISOString(),
      }
      list.unshift(newBm)
      setStored(STORAGE_BOOKMARKS, list)
      return true
    }
  },

  // --- HIGHLIGHTS ---
  getHighlights(): BibleHighlight[] {
    return getStored<BibleHighlight[]>(STORAGE_HIGHLIGHTS, [])
  },

  getVerseHighlight(bookSlug: string, chapter: number, verseNumber: number): HighlightColor | null {
    const list = this.getHighlights()
    const h = list.find(
      (item) => item.bookSlug === bookSlug && item.chapter === chapter && item.verseNumber === verseNumber
    )
    return h ? h.color : null
  },

  setVerseHighlight(
    bookSlug: string,
    chapter: number,
    verseNumber: number,
    color: HighlightColor | null
  ): void {
    let list = this.getHighlights()
    list = list.filter(
      (item) => !(item.bookSlug === bookSlug && item.chapter === chapter && item.verseNumber === verseNumber)
    )

    if (color) {
      list.push({
        id: `hl_${bookSlug}_${chapter}_${verseNumber}`,
        bookSlug,
        chapter,
        verseNumber,
        color,
        createdAt: new Date().toISOString(),
      })
    }

    setStored(STORAGE_HIGHLIGHTS, list)
  },

  // --- NOTES ---
  getNotes(): BibleVerseNote[] {
    return getStored<BibleVerseNote[]>(STORAGE_NOTES, [])
  },

  getVerseNote(bookSlug: string, chapter: number, verseNumber: number): BibleVerseNote | null {
    const list = this.getNotes()
    return (
      list.find(
        (n) => n.bookSlug === bookSlug && n.chapter === chapter && n.verseNumber === verseNumber
      ) || null
    )
  },

  saveVerseNote(bookSlug: string, chapter: number, verseNumber: number, noteText: string): void {
    const list = this.getNotes()
    const trimmed = noteText.trim()
    const idx = list.findIndex(
      (n) => n.bookSlug === bookSlug && n.chapter === chapter && n.verseNumber === verseNumber
    )

    if (!trimmed) {
      if (idx >= 0) {
        list.splice(idx, 1)
        setStored(STORAGE_NOTES, list)
      }
      return
    }

    if (idx >= 0) {
      list[idx].noteText = trimmed
      list[idx].updatedAt = new Date().toISOString()
    } else {
      list.unshift({
        id: `note_${bookSlug}_${chapter}_${verseNumber}`,
        bookSlug,
        chapter,
        verseNumber,
        noteText: trimmed,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
      })
    }

    setStored(STORAGE_NOTES, list)
  },

  // --- READING HISTORY ---
  getRecentChapters(): BibleRecentChapter[] {
    return getStored<BibleRecentChapter[]>(STORAGE_RECENTS, [])
  },

  recordChapterRead(bookSlug: string, bookName: string, chapter: number): void {
    let list = this.getRecentChapters()
    list = list.filter((r) => !(r.bookSlug === bookSlug && r.chapter === chapter))
    list.unshift({
      bookSlug,
      bookName,
      chapter,
      timestamp: Date.now(),
    })
    setStored(STORAGE_RECENTS, list.slice(0, 10))
  },
}
