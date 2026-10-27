import { useState } from 'react'
import {
  saveReviewStatus,
  type ReviewContentType,
  type ReviewStatus,
} from '../../lib/cms/adminContentReviewService'
import { useAuth } from '../../lib/auth/useAuth'
import styles from './AdminContentReviewTag.module.css'

interface Props {
  contentType: ReviewContentType
  contentId: string
  currentStatus?: ReviewStatus
  currentNote?: string | null
  onStatusChange?: (newStatus: ReviewStatus, newNote?: string) => void
  compact?: boolean
  showNoteSnippet?: boolean
}

export function AdminContentReviewTag({
  contentType,
  contentId,
  currentStatus = 'needs_review',
  currentNote,
  onStatusChange,
  compact = false,
  showNoteSnippet = true,
}: Props) {
  const { profile } = useAuth()
  const [status, setStatus] = useState<ReviewStatus>(currentStatus)
  const [note, setNote] = useState<string | null>(currentNote || null)
  const [busy, setBusy] = useState(false)
  const [noteModalOpen, setNoteModalOpen] = useState(false)
  const [tempNote, setTempNote] = useState('')

  const handleToggleStatus = async (targetStatus: ReviewStatus) => {
    if (targetStatus === 'reviewed') {
      // Open modal to allow optional private note
      setTempNote(note || '')
      setNoteModalOpen(true)
      return
    }

    // Direct toggle to needs_review
    setBusy(true)
    try {
      await saveReviewStatus(contentType, contentId, 'needs_review', {
        userId: profile?.id,
        userEmail: profile?.email,
      })
      setStatus('needs_review')
      onStatusChange?.('needs_review', note || undefined)
    } finally {
      setBusy(false)
    }
  }

  const handleSaveReviewed = async () => {
    setBusy(true)
    try {
      const trimmedNote = tempNote.trim() || undefined
      await saveReviewStatus(contentType, contentId, 'reviewed', {
        note: trimmedNote,
        userId: profile?.id,
        userEmail: profile?.email,
      })
      setStatus('reviewed')
      setNote(trimmedNote || null)
      setNoteModalOpen(false)
      onStatusChange?.('reviewed', trimmedNote)
    } finally {
      setBusy(false)
    }
  }

  const isReviewed = status === 'reviewed'

  return (
    <div className={styles.wrapper}>
      {isReviewed ? (
        <span className={styles.badgeReviewed} title="Marked as reviewed by an authorized administrator">
          ✓ Reviewed
        </span>
      ) : (
        <span className={styles.badgeNeedsReview} title="Awaiting editorial content review">
          ⚠️ Needs Review
        </span>
      )}

      {isReviewed ? (
        <button
          type="button"
          disabled={busy}
          className={`${styles.actionBtn} ${styles.actionBtnReviewAgain}`}
          onClick={() => handleToggleStatus('needs_review')}
          title="Mark this item for review again"
        >
          Review Again
        </button>
      ) : (
        <button
          type="button"
          disabled={busy}
          className={`${styles.actionBtn} ${styles.actionBtnMarkReviewed}`}
          onClick={() => handleToggleStatus('reviewed')}
          title="Mark this item as reviewed"
        >
          Mark Reviewed
        </button>
      )}

      {showNoteSnippet && note && !compact && (
        <span className={styles.noteSnippet} title={`Private note: ${note}`}>
          📝 {note}
        </span>
      )}

      {noteModalOpen && (
        <div className={styles.modalOverlay} role="dialog" aria-modal="true">
          <div className={styles.modalBox}>
            <h3 className={styles.modalTitle}>Mark as Reviewed</h3>
            <p style={{ margin: 0, fontSize: '0.8125rem', color: '#64748b' }}>
              Add an optional private editorial note for your records:
            </p>
            <textarea
              className={styles.modalTextarea}
              placeholder="e.g. Verified text accuracy and theological citations..."
              value={tempNote}
              onChange={(e) => setTempNote(e.target.value)}
              autoFocus
            />
            <div className={styles.modalActions}>
              <button
                type="button"
                className={styles.actionBtn}
                onClick={() => setNoteModalOpen(false)}
                disabled={busy}
              >
                Cancel
              </button>
              <button
                type="button"
                className={`${styles.actionBtn} ${styles.actionBtnMarkReviewed}`}
                onClick={handleSaveReviewed}
                disabled={busy}
              >
                Confirm Reviewed
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
