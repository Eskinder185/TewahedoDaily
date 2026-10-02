import { useMemo, useState } from 'react'
import { MediaPicker } from '../admin/MediaPicker'
import {
  cardImagePreview,
  IMAGE_POSITIONS,
  saveCalendarCardImage,
  sourceTypeBadge,
  type CalendarCardRow,
} from '../../lib/cms/calendarAdminService'
import { formatCardDateRuleDisplay } from '../../lib/calendar/formatCalendarSourceRule'
import type { LinkedCalendarSource } from '../../lib/calendar/resolveCalendarCard'
import {
  calendarMediaFolderPrefix,
  getSuggestedCalendarImagePath,
  suggestCalendarImageAlt,
} from '../../lib/calendar/calendarImagePaths'
import s from '../../pages/admin/Admin.module.css'

type Props = {
  card: CalendarCardRow
  linked: LinkedCalendarSource | null
  missingQueue: CalendarCardRow[]
  onClose: () => void
  onSaved: (saved: CalendarCardRow, nextMissing: CalendarCardRow | null) => void
}

/**
 * Lightweight image-only editor — never edits source identity.
 * Save verifies the exact calendar_cards.id row from Supabase.
 */
export function CalendarCardQuickImageModal({
  card,
  linked,
  missingQueue,
  onClose,
  onSaved,
}: Props) {
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [imagePath, setImagePath] = useState(card.image_path || '')
  const [imageAlt, setImageAlt] = useState(
    card.image_alt ||
      suggestCalendarImageAlt(linked?.title || card.title, linked?.category || card.category) ||
      '',
  )
  const [imagePosition, setImagePosition] = useState(card.image_position || 'center')

  const title = linked?.title || card.title || card.source_slug || 'Calendar Card'
  const amharic = linked?.titleAmharic || card.title_amharic || ''
  const dateRule = formatCardDateRuleDisplay({
    sourceType: card.source_type,
    cardMonth: card.ethiopian_month_number,
    cardDay: card.ethiopian_day,
    isMonthly: card.is_monthly,
    linked,
  })

  const preview = cardImagePreview({
    image_path: imagePath || null,
    image_alt: imageAlt || null,
    title,
  })

  const suggestedPath = useMemo(
    () =>
      getSuggestedCalendarImagePath(
        {
          sourceSlug: card.source_slug,
          cardSlug: card.slug,
          category: linked?.category || card.category,
          cardType: linked?.cardType || card.card_type,
          title,
        },
        { unique: true },
      ),
    [card, linked, title],
  )

  const nextMissing = useMemo(() => {
    const idx = missingQueue.findIndex((row) => row.id === card.id)
    if (idx < 0) return missingQueue.find((row) => row.id !== card.id) || null
    return missingQueue[idx + 1] || missingQueue.find((row) => row.id !== card.id) || null
  }, [missingQueue, card.id])

  async function persist(thenNext: boolean) {
    setBusy(true)
    setError('')
    setSuccess('')
    try {
      const saved = await saveCalendarCardImage(card.id, {
        image_path: imagePath,
        image_alt: imageAlt,
        image_position: imagePosition,
      })
      const lines = [
        'Image saved',
        `Event: ${title}`,
        `Card ID: ${saved.id}`,
        `Image: ${saved.image_path}`,
        saved.status !== 'published'
          ? `Warning: status is “${saved.status}” — public Calendar only shows published cards.`
          : null,
      ].filter(Boolean)
      setSuccess(lines.join('\n'))
      onSaved(saved, thenNext ? nextMissing : null)
      if (!thenNext) {
        // Keep modal open briefly so confirmation is visible; caller may close.
      }
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'Could not save image.')
    } finally {
      setBusy(false)
    }
  }

  return (
    <div
      role="dialog"
      aria-modal="true"
      aria-label="Edit Calendar Image"
      style={{
        position: 'fixed',
        inset: 0,
        zIndex: 80,
        background: 'rgba(20, 14, 8, 0.55)',
        display: 'grid',
        placeItems: 'end center',
        padding: '0.75rem',
      }}
      onClick={(e) => {
        if (e.target === e.currentTarget && !busy) onClose()
      }}
    >
      <section
        className={s.card}
        style={{
          width: 'min(640px, 100%)',
          maxHeight: '92vh',
          overflow: 'auto',
          marginBottom: '0.5rem',
        }}
      >
        <div className={s.heading} style={{ marginBottom: '0.75rem' }}>
          <div>
            <p className={s.eyebrow}>EDIT CALENDAR IMAGE</p>
            <h2 style={{ margin: 0 }}>{title}</h2>
            {amharic ? (
              <p lang="am" className={s.muted} style={{ margin: '0.25rem 0 0' }}>
                {amharic}
              </p>
            ) : null}
          </div>
          <button type="button" disabled={busy} onClick={onClose}>
            Close
          </button>
        </div>

        <div className={s.muted} style={{ display: 'grid', gap: '0.2rem', marginBottom: '0.85rem' }}>
          <span>
            Type: <strong>{sourceTypeBadge(card.source_type)}</strong>
          </span>
          <span>
            Date rule: <strong>{dateRule}</strong>
          </span>
          <span>
            Card ID: <code>{card.id}</code>
          </span>
          {card.source_slug ? (
            <span>
              Source: <code>{card.source_slug}</code>
            </span>
          ) : null}
          <span>Source fields are read-only here.</span>
        </div>

        <div style={{ marginBottom: '0.85rem' }}>
          {preview.url ? (
            <img
              src={preview.url}
              alt={preview.alt}
              style={{
                width: '100%',
                aspectRatio: '4 / 3',
                objectFit: 'cover',
                objectPosition:
                  imagePosition === 'top'
                    ? '50% 0%'
                    : imagePosition === 'top-center'
                      ? '50% 20%'
                      : imagePosition === 'bottom'
                        ? '50% 100%'
                        : '50% 50%',
                borderRadius: 8,
                background: '#1a1410',
              }}
            />
          ) : (
            <div
              className={s.mediaThumbEmpty}
              style={{ width: '100%', aspectRatio: '4 / 3', display: 'grid', placeItems: 'center' }}
            >
              Needs Image
            </div>
          )}
        </div>

        <MediaPicker
          label="Select or upload image"
          folder={calendarMediaFolderPrefix(
            linked?.category || card.category,
            linked?.cardType || card.card_type,
          )}
          suggestedPath={suggestedPath}
          convertToWebp
          value={imagePath}
          altText={imageAlt}
          onChange={({ storagePath, altText }) => {
            setImagePath(storagePath)
            setImageAlt(
              altText ||
                imageAlt ||
                suggestCalendarImageAlt(title, linked?.category || card.category),
            )
            setSuccess('')
          }}
        />

        <div className={s.fields} style={{ marginTop: '0.75rem' }}>
          <label>
            Image position
            <select
              value={imagePosition}
              onChange={(e) => setImagePosition(e.target.value)}
            >
              {IMAGE_POSITIONS.map((pos) => (
                <option key={pos} value={pos}>
                  {pos}
                </option>
              ))}
            </select>
          </label>
          <label>
            Alt text
            <input value={imageAlt} onChange={(e) => setImageAlt(e.target.value)} />
          </label>
        </div>

        {error ? (
          <p role="alert" className={s.error}>
            {error}
          </p>
        ) : null}
        {success ? (
          <pre
            role="status"
            style={{
              whiteSpace: 'pre-wrap',
              fontFamily: 'inherit',
              background: 'rgba(40, 90, 40, 0.12)',
              padding: '0.75rem',
              borderRadius: 8,
            }}
          >
            {success}
          </pre>
        ) : null}

        <div className={s.actions} style={{ marginTop: '1rem', flexWrap: 'wrap' }}>
          <button
            type="button"
            className={s.primary}
            disabled={busy || !imagePath.trim()}
            onClick={() => void persist(false)}
          >
            {busy ? 'Saving…' : 'Save Image'}
          </button>
          <button
            type="button"
            disabled={busy || !imagePath.trim() || !nextMissing}
            onClick={() => void persist(true)}
            title={nextMissing ? `Next: ${nextMissing.title || nextMissing.source_slug}` : 'No more missing'}
          >
            Save &amp; Next Missing
          </button>
          <button type="button" disabled={busy} onClick={onClose}>
            Cancel
          </button>
        </div>
      </section>
    </div>
  )
}

export default CalendarCardQuickImageModal
