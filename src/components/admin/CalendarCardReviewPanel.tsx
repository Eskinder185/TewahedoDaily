import { useEffect, useMemo, useState } from 'react'
import type { CalendarCardRow } from '../../lib/cms/calendarAdminService'
import type { LinkedCalendarSource } from '../../lib/calendar/resolveCalendarCard'
import { AdminContentReviewTag } from './AdminContentReviewTag'
import { getMezmursForCalendarCardSlug } from '../../lib/recommendations/calendarMezmursData'
import { getKnowledgeArticle } from '../../lib/calendar/calendarKnowledgeRegistry'
import {
  fetchReviewsForContent,
  resolveReviewStatus,
  getReviewNote,
  type AdminContentReviewRecord,
} from '../../lib/cms/adminContentReviewService'
import styles from './CalendarCardReviewPanel.module.css'

interface Props {
  card: CalendarCardRow
  linkedSource?: LinkedCalendarSource | null
}

interface ResourceItem {
  id: string
  type: string
  label: string
  details: string
  referenceKey: string
}

export function CalendarCardReviewPanel({ card, linkedSource }: Props) {
  const [reviewsMap, setReviewsMap] = useState<Map<string, AdminContentReviewRecord>>(new Map())

  // Compile all associated resources for this card
  const resources: ResourceItem[] = useMemo(() => {
    const list: ResourceItem[] = []
    const baseSlug = card.slug || card.id

    // 1. Bible / Scripture Reference
    const scripture = card.scripture_references || linkedSource?.scriptureReferences
    if (scripture) {
      list.push({
        id: `${baseSlug}:scripture:${scripture.trim().toLowerCase().replace(/[^a-z0-9]/g, '-')}`,
        type: 'Scripture',
        label: 'Biblical Reading / Citations',
        details: scripture,
        referenceKey: scripture,
      })
    }

    // 2. Related Mezmurs
    const mezmurs = getMezmursForCalendarCardSlug(card.slug)
    mezmurs.forEach((m) => {
      list.push({
        id: `${baseSlug}:mezmur:${m.mezmur_slug}`,
        type: 'Mezmur',
        label: m.mezmur_title,
        details: `${m.relationship_type.replace(/_/g, ' ')} · ${m.reason_en}`,
        referenceKey: m.mezmur_slug,
      })
    })

    // 3. Knowledge Article
    const article = getKnowledgeArticle(card.slug)
    if (article) {
      list.push({
        id: `${baseSlug}:knowledge:${card.slug}`,
        type: 'Knowledge',
        label: article.title,
        details: article.historicalBackground ? article.historicalBackground.slice(0, 100) + '…' : 'Comprehensive knowledge article',
        referenceKey: card.slug,
      })
    }

    // 4. Synaxarium Source
    if (card.synaxarium_day_slug || (card.ethiopian_month_number && card.ethiopian_day)) {
      const synKey = card.synaxarium_day_slug || `m${card.ethiopian_month_number}-d${card.ethiopian_day}`
      list.push({
        id: `${baseSlug}:synaxarium:${synKey}`,
        type: 'Synaxarium',
        label: 'Synaxarium Commemoration',
        details: card.synaxarium_day_slug ? `Slug: ${card.synaxarium_day_slug}` : `Month ${card.ethiopian_month_number}, Day ${card.ethiopian_day}`,
        referenceKey: synKey,
      })
    }

    // 5. Liturgy / Prayer Guideline
    if (card.source_type === 'observance' || card.source_type === 'fast') {
      list.push({
        id: `${baseSlug}:prayer:guideline`,
        type: 'Prayer',
        label: 'Liturgy & Prayer Guidelines',
        details: 'Prescribed anaphora and canonical prayer rules for this observance.',
        referenceKey: 'prayer-guideline',
      })
    }

    return list
  }, [card, linkedSource])

  // Load reviews for all resource IDs
  useEffect(() => {
    const ids = [card.id, ...resources.map((r) => r.id)]
    fetchReviewsForContent('calendar_resource', ids).then(setReviewsMap)
  }, [card.id, resources])

  // Extract display values
  const title = linkedSource?.title || card.title || 'Untitled Event'
  const titleAm = linkedSource?.titleAmharic || card.title_amharic || '—'
  const dateStr = card.ethiopian_month_number && card.ethiopian_day
    ? `Month ${card.ethiopian_month_number}, Day ${card.ethiopian_day}`
    : card.is_monthly && card.ethiopian_day
    ? `Monthly Day ${card.ethiopian_day}`
    : 'Movable or seasonal date'
  const category = linkedSource?.category || card.category || 'General Observance'
  const explanation = card.summary || card.what_is_it || linkedSource?.summary || '—'
  const fasting = card.fasting_notes || linkedSource?.fastingNotes || 'Standard fasting rules apply.'

  return (
    <div className={styles.panel}>
      <div className={styles.header}>
        <div>
          <h3 className={styles.headingTitle}>Editorial Content Audit & Resource Verification</h3>
          <p className={styles.headingSubtitle}>
            Administrative accuracy check for this calendar card and its linked spiritual resources.
          </p>
        </div>
        <div>
          <AdminContentReviewTag
            contentType="calendar_card"
            contentId={card.id}
            currentStatus={resolveReviewStatus(card.id, reviewsMap)}
            currentNote={getReviewNote(card.id, reviewsMap)}
            onStatusChange={(newStatus, newNote) => {
              setReviewsMap((prev) => {
                const next = new Map(prev)
                next.set(card.id, {
                  content_type: 'calendar_card',
                  content_id: card.id,
                  review_status: newStatus,
                  review_note: newNote,
                  created_at: '',
                  updated_at: '',
                })
                return next
              })
            }}
          />
        </div>
      </div>

      {/* Structured Content Inspection Grid */}
      <div className={styles.auditGrid}>
        <div className={styles.auditItem}>
          <span className={styles.auditLabel}>Event Title & Language</span>
          <span className={styles.auditValue}>
            <strong>{title}</strong>
            <div lang="am" style={{ color: '#8a6414', marginTop: '0.15rem' }}>{titleAm}</div>
          </span>
        </div>

        <div className={styles.auditItem}>
          <span className={styles.auditLabel}>Date & Recurrence</span>
          <span className={styles.auditValue}>{dateStr}</span>
        </div>

        <div className={styles.auditItem}>
          <span className={styles.auditLabel}>Observance Category</span>
          <span className={styles.auditValue}>{category}</span>
        </div>

        <div className={styles.auditItem}>
          <span className={styles.auditLabel}>Fasting & Liturgical Rules</span>
          <span className={styles.auditValue}>{fasting}</span>
        </div>
      </div>

      <div className={styles.auditItem}>
        <span className={styles.auditLabel}>Historical & Theological Explanation</span>
        <span className={styles.auditValue} style={{ whiteSpace: 'pre-wrap' }}>{explanation}</span>
      </div>

      {/* Associated Spiritual Resources Review */}
      <div className={styles.resourcesSection}>
        <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', flexWrap: 'wrap', gap: '0.5rem' }}>
          <h4 className={styles.resourcesTitle}>Associated Resources & Relationships ({resources.length})</h4>
          <span className={styles.disclaimer}>
            Each resource relationship is audited independently of the card itself.
          </span>
        </div>

        {resources.length === 0 ? (
          <p style={{ fontStyle: 'italic', color: '#64748b', fontSize: '0.875rem' }}>
            No associated resources currently linked to this event.
          </p>
        ) : (
          <table className={styles.resourceTable}>
            <thead>
              <tr>
                <th style={{ width: '15%' }}>Type</th>
                <th style={{ width: '35%' }}>Resource Name</th>
                <th style={{ width: '25%' }}>Details</th>
                <th style={{ width: '25%' }}>Relationship Review</th>
              </tr>
            </thead>
            <tbody>
              {resources.map((res) => {
                const status = resolveReviewStatus(res.id, reviewsMap)
                const note = getReviewNote(res.id, reviewsMap)
                return (
                  <tr key={res.id}>
                    <td>
                      <span className={styles.resourceTypeBadge}>{res.type}</span>
                    </td>
                    <td>
                      <strong>{res.label}</strong>
                    </td>
                    <td style={{ fontSize: '0.8125rem', color: '#64748b' }}>
                      {res.details}
                    </td>
                    <td>
                      <AdminContentReviewTag
                        contentType="calendar_resource"
                        contentId={res.id}
                        currentStatus={status}
                        currentNote={note}
                        compact
                        onStatusChange={(newStatus, newNote) => {
                          setReviewsMap((prev) => {
                            const next = new Map(prev)
                            next.set(res.id, {
                              content_type: 'calendar_resource',
                              content_id: res.id,
                              review_status: newStatus,
                              review_note: newNote,
                              created_at: '',
                              updated_at: '',
                            })
                            return next
                          })
                        }}
                      />
                    </td>
                  </tr>
                )
              })}
            </tbody>
          </table>
        )}
      </div>
    </div>
  )
}
