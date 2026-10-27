/**
 * TEWAHEDODAILY — INTERACTIVE BIBLE VERSE ITEM
 *
 * Supports verse bookmarking, 4-color highlights, personal notes,
 * canonical citation copying, and verse sharing.
 */

import { useState, useEffect } from 'react'
import {
  bibleStudyService,
  type HighlightColor,
  type BibleVerseNote,
} from '../../lib/bible/bibleStudyService'
import s from '../../pages/BiblePage.module.css'

interface Props {
  bookSlug: string
  chapterNumber: number
  verseNumber: number
  primaryText: string
  secondaryText?: string
  primaryLang?: string
  secondaryLang?: string
  bookTitle: string
}

export function BibleVerseItem({
  bookSlug,
  chapterNumber,
  verseNumber,
  primaryText,
  secondaryText,
  primaryLang = 'am',
  secondaryLang = 'en',
  bookTitle,
}: Props) {
  const [isBookmarked, setIsBookmarked] = useState(false)
  const [highlight, setHighlight] = useState<HighlightColor | null>(null)
  const [note, setNote] = useState<BibleVerseNote | null>(null)
  const [editingNote, setEditingNote] = useState(false)
  const [noteDraft, setNoteDraft] = useState('')
  const [copied, setCopied] = useState(false)

  const reloadStudyData = () => {
    setIsBookmarked(bibleStudyService.isBookmarked(bookSlug, chapterNumber, verseNumber))
    setHighlight(bibleStudyService.getVerseHighlight(bookSlug, chapterNumber, verseNumber))
    const existingNote = bibleStudyService.getVerseNote(bookSlug, chapterNumber, verseNumber)
    setNote(existingNote)
    setNoteDraft(existingNote?.noteText || '')
  }

  useEffect(() => {
    reloadStudyData()
    const handleUpdate = () => reloadStudyData()
    window.addEventListener('td-bible-study-updated', handleUpdate)
    return () => window.removeEventListener('td-bible-study-updated', handleUpdate)
  }, [bookSlug, chapterNumber, verseNumber])

  const handleToggleBookmark = () => {
    const next = bibleStudyService.toggleBookmark(
      bookSlug,
      chapterNumber,
      verseNumber,
      primaryText,
      bookTitle
    )
    setIsBookmarked(next)
  }

  const handleSetHighlight = (color: HighlightColor | null) => {
    bibleStudyService.setVerseHighlight(bookSlug, chapterNumber, verseNumber, color)
    setHighlight(color)
  }

  const handleSaveNote = () => {
    bibleStudyService.saveVerseNote(bookSlug, chapterNumber, verseNumber, noteDraft)
    setEditingNote(false)
    reloadStudyData()
  }

  const formatCitation = () => {
    return `${bookTitle} ${chapterNumber}:${verseNumber} — "${primaryText}"${
      secondaryText ? ` / "${secondaryText}"` : ''
    } (TewahedoDaily)`
  }

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(formatCitation())
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    } catch {}
  }

  const handleShare = async () => {
    const citation = formatCitation()
    if (navigator.share) {
      try {
        await navigator.share({
          title: `${bookTitle} ${chapterNumber}:${verseNumber}`,
          text: citation,
          url: `${window.location.origin}/bible/${bookSlug}/${chapterNumber}#verse-${verseNumber}`,
        })
      } catch {}
    } else {
      handleCopy()
    }
  }

  const highlightClass =
    highlight === 'gold'
      ? s.highlightGold
      : highlight === 'emerald'
      ? s.highlightEmerald
      : highlight === 'sapphire'
      ? s.highlightSapphire
      : highlight === 'rose'
      ? s.highlightRose
      : ''

  return (
    <li
      id={`verse-${verseNumber}`}
      className={`${s.alignedVerseRow} ${highlightClass}`.trim()}
    >
      {secondaryText ? (
        // Parallel two-column layout
        <div className={s.parallelGrid}>
          <div lang={primaryLang}>
            <span className={s.verseNumberTag}>{verseNumber}</span>
            <span className={primaryLang === 'am' ? s.amharicVerse : s.englishVerse}>
              {primaryText}
            </span>
          </div>
          <div lang={secondaryLang}>
            <span className={s.verseNumberTag}>{verseNumber}</span>
            <span className={secondaryLang === 'am' ? s.amharicVerse : s.englishVerse}>
              {secondaryText}
            </span>
          </div>
        </div>
      ) : (
        // Single edition layout
        <div lang={primaryLang}>
          <span className={s.verseNumberTag}>{verseNumber}</span>
          <span className={primaryLang === 'am' ? s.amharicVerse : s.englishVerse}>
            {primaryText}
          </span>
        </div>
      )}

      {/* Note view if present */}
      {note && !editingNote && (
        <div className={s.verseNoteBox}>
          <strong>📝 Note:</strong> {note.noteText}
        </div>
      )}

      {/* Note editor form */}
      {editingNote && (
        <div className={s.verseNoteBox}>
          <textarea
            value={noteDraft}
            onChange={(e) => setNoteDraft(e.target.value)}
            className={s.verseNoteInput}
            rows={2}
            placeholder="Add personal study note for this verse..."
            autoFocus
          />
          <div style={{ display: 'flex', gap: '0.4rem', marginTop: '0.35rem' }}>
            <button type="button" className={s.verseActionBtn} onClick={handleSaveNote}>
              Save
            </button>
            <button
              type="button"
              className={s.verseActionBtn}
              onClick={() => setEditingNote(false)}
            >
              Cancel
            </button>
          </div>
        </div>
      )}

      {/* Interactive verse toolbar */}
      <div className={s.verseToolbar} role="toolbar" aria-label={`Tools for verse ${verseNumber}`}>
        <button
          type="button"
          className={s.verseActionBtn}
          onClick={handleToggleBookmark}
          title={isBookmarked ? 'Remove Bookmark' : 'Bookmark Verse'}
          aria-pressed={isBookmarked}
        >
          {isBookmarked ? '★ Bookmarked' : '☆ Bookmark'}
        </button>

        {/* Highlight Palette */}
        <button
          type="button"
          className={s.verseActionBtn}
          onClick={() => handleSetHighlight(highlight === 'gold' ? null : 'gold')}
          title="Highlight Gold"
        >
          🟡
        </button>
        <button
          type="button"
          className={s.verseActionBtn}
          onClick={() => handleSetHighlight(highlight === 'emerald' ? null : 'emerald')}
          title="Highlight Emerald"
        >
          🟢
        </button>
        <button
          type="button"
          className={s.verseActionBtn}
          onClick={() => handleSetHighlight(highlight === 'sapphire' ? null : 'sapphire')}
          title="Highlight Sapphire"
        >
          🔵
        </button>
        <button
          type="button"
          className={s.verseActionBtn}
          onClick={() => handleSetHighlight(highlight === 'rose' ? null : 'rose')}
          title="Highlight Rose"
        >
          🟣
        </button>
        {highlight && (
          <button
            type="button"
            className={s.verseActionBtn}
            onClick={() => handleSetHighlight(null)}
            title="Clear Highlight"
          >
            ✕
          </button>
        )}

        {/* Note button */}
        <button
          type="button"
          className={s.verseActionBtn}
          onClick={() => setEditingNote((prev) => !prev)}
          title="Personal Note"
        >
          📝 {note ? 'Edit Note' : 'Add Note'}
        </button>

        {/* Copy button */}
        <button
          type="button"
          className={s.verseActionBtn}
          onClick={handleCopy}
          title="Copy Citation"
        >
          {copied ? '✓ Copied' : '📋 Copy'}
        </button>

        {/* Share button */}
        <button
          type="button"
          className={s.verseActionBtn}
          onClick={handleShare}
          title="Share Verse"
        >
          ↗ Share
        </button>
      </div>
    </li>
  )
}
