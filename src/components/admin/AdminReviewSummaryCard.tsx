import { useEffect, useState, useMemo } from 'react'
import { Link } from 'react-router-dom'
import {
  getReviewSummary,
  fetchReviewsForContent,
  resolveReviewStatus,
  getReviewNote,
  type ReviewSummary,
  type AdminContentReviewRecord,
} from '../../lib/cms/adminContentReviewService'
import { AdminContentReviewTag } from './AdminContentReviewTag'
import styles from './AdminReviewSummaryCard.module.css'

interface QuickItem {
  id: string
  title: string
  titleAmharic?: string | null
  type: 'mezmur' | 'calendar_card'
  details: string
}

export function AdminReviewSummaryCard() {
  const [summary, setSummary] = useState<ReviewSummary | null>(null)
  const [loading, setLoading] = useState(true)
  const [filter, setFilter] = useState<'all' | 'needs_review' | 'reviewed'>('needs_review')
  const [search, setSearch] = useState('')
  const [page, setPage] = useState(1)
  const pageSize = 8

  // Sample items for quick dashboard review queue
  const [sampleItems, setSampleItems] = useState<QuickItem[]>([])
  const [reviewsMap, setReviewsMap] = useState<Map<string, AdminContentReviewRecord>>(new Map())

  const loadData = async () => {
    setLoading(true)
    try {
      const sum = await getReviewSummary()
      setSummary(sum)

      // Fetch sample cards and hymns for quick dashboard review
      const items: QuickItem[] = [
        { id: '1d5afbd7-0dad-4d2e-b624-698f74a4cd4e', title: 'Enkutatash / Ethiopian New Year', titleAmharic: 'እንቁጣጣሽ', type: 'calendar_card', details: 'Meskerem 1 · Major Feast' },
        { id: 'monthly-annunciation-monthly', title: 'Annunciation / Bisrate Gabriel', titleAmharic: 'ብስራተ ገብርኤል', type: 'calendar_card', details: 'Day 22 · Monthly Commemoration' },
        { id: 'monthly-uriel-monthly', title: 'Archangel Uriel', titleAmharic: 'ቅዱስ ዑራኤል', type: 'calendar_card', details: 'Day 22 · Monthly Commemoration' },
        { id: 'tsige-season', title: 'Zemene Tsige / Season of Flowers', titleAmharic: 'ዘመነ ጽጌ', type: 'calendar_card', details: 'Meskerem 26 – Hidar 5 · Liturgical Season' },
        { id: 'fast-tsige-fast', title: 'Tsige Fast / Fast of the Holy Family', titleAmharic: 'የጽጌ ጾም', type: 'calendar_card', details: 'Voluntary Fast of the Holy Family' },
        { id: 'absera-gebriel', title: 'Absera Gebriel', titleAmharic: 'አብሠራ ገብርኤል', type: 'mezmur', details: 'Annunciation Hymn' },
        { id: 'akilile-tsige-mariyam', title: 'Akilile Tsige Mariyam', titleAmharic: 'አክሊለ ጽጌ ማርያም', type: 'mezmur', details: 'Zemene Tsige Seasonal Marian Hymn' },
        { id: 'tewedaj-yekidus-mikael-mezimurat-liredagn-meta-yeafomiya-eredat-neh-bebe', title: 'Tewedaj Yekidus Mikael Mezimurat', titleAmharic: 'ተወዳጅ የቅዱስ ሚካኤል መዝሙራት', type: 'mezmur', details: 'Archangel Michael Feast Hymn' },
        { id: 'gebriel-hayal-melake-selam', title: 'Gebriel Hayal Melake Selam', titleAmharic: 'ገብርኤል ኃያል መልአከ ሰላም', type: 'mezmur', details: 'Archangel Gabriel Hymn' },
        { id: 'kidane-mihret-emebet', title: 'Kidane Mihret Emebet', titleAmharic: 'ኪዳነ ምሕረት እመቤት', type: 'mezmur', details: 'Kidane Mihret Commemoration Hymn' },
        { id: 'nitsum-tsoma', title: 'Nitsum Tsoma', titleAmharic: 'ንጹም ጾመ', type: 'mezmur', details: 'Great Lent Repentance Hymn' },
        { id: 'awde-amet-le-barko', title: 'Awde Amet le Barko', titleAmharic: 'ዐውደ ዓመት ለባርኮ', type: 'mezmur', details: 'Enkutatash Liturgical Hymn' },
      ]
      setSampleItems(items)

      const cardIds = items.filter((i) => i.type === 'calendar_card').map((i) => i.id)
      const mezmurIds = items.filter((i) => i.type === 'mezmur').map((i) => i.id)

      const [cardReviews, mezmurReviews] = await Promise.all([
        fetchReviewsForContent('calendar_card', cardIds),
        fetchReviewsForContent('mezmur', mezmurIds),
      ])

      const combined = new Map<string, AdminContentReviewRecord>()
      cardReviews.forEach((v, k) => combined.set(k, v))
      mezmurReviews.forEach((v, k) => combined.set(k, v))
      setReviewsMap(combined)
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    loadData()

    const handleUpdate = () => {
      loadData()
    }
    window.addEventListener('td:admin-review-updated', handleUpdate)
    return () => window.removeEventListener('td:admin-review-updated', handleUpdate)
  }, [])

  const filteredItems = useMemo(() => {
    return sampleItems.filter((item) => {
      const status = resolveReviewStatus(item.id, reviewsMap)
      if (filter !== 'all' && status !== filter) return false
      if (search.trim()) {
        const q = search.toLowerCase()
        const matchTitle = item.title.toLowerCase().includes(q)
        const matchAm = (item.titleAmharic || '').toLowerCase().includes(q)
        const matchDetails = item.details.toLowerCase().includes(q)
        if (!matchTitle && !matchAm && !matchDetails) return false
      }
      return true
    })
  }, [sampleItems, reviewsMap, filter, search])

  const totalPages = Math.max(1, Math.ceil(filteredItems.length / pageSize))
  const paginatedItems = filteredItems.slice((page - 1) * pageSize, page * pageSize)

  if (loading && !summary) {
    return <div className={styles.card}>Loading editorial review summary…</div>
  }

  const s = summary || {
    mezmursTotal: 994,
    mezmursReviewed: 0,
    mezmursNeedsReview: 994,
    calendarTotal: 113,
    calendarReviewed: 0,
    calendarNeedsReview: 113,
    overallProgressPct: 0,
  }

  const totalItems = s.mezmursTotal + s.calendarTotal
  const totalReviewed = s.mezmursReviewed + s.calendarReviewed

  return (
    <div className={styles.card}>
      <div className={styles.header}>
        <div className={styles.titleGroup}>
          <h2 className={styles.title}>Editorial Content Review Tracker</h2>
          <p className={styles.subtitle}>
            Administrative audit status for website Mezmurs, calendar cards, and spiritual resources.
          </p>
        </div>
        <div style={{ display: 'flex', gap: '0.5rem' }}>
          <button
            type="button"
            className={styles.shortcutLink}
            onClick={() => loadData()}
            title="Refresh counts from Supabase"
          >
            ↻ Refresh
          </button>
        </div>
      </div>

      {/* Progress Bar */}
      <div className={styles.progressContainer}>
        <div className={styles.progressMeta}>
          <span>Overall Content Review Progress</span>
          <span><strong>{s.overallProgressPct}% Complete</strong> ({totalReviewed} of {totalItems} items audited)</span>
        </div>
        <div className={styles.progressBarTrack}>
          <div
            className={styles.progressBarFill}
            style={{ width: `${Math.min(100, Math.max(0, s.overallProgressPct))}%` }}
          />
        </div>
      </div>

      {/* Statistics Grid */}
      <div className={styles.statsGrid}>
        <div className={styles.statItem}>
          <span className={styles.statNumber}>{s.mezmursTotal}</span>
          <span className={styles.statLabel}>Total Mezmurs</span>
        </div>
        <div className={styles.statItem} style={{ borderLeft: '3px solid #166534' }}>
          <span className={styles.statNumber} style={{ color: '#166534' }}>{s.mezmursReviewed}</span>
          <span className={styles.statLabel}>Mezmurs Reviewed</span>
        </div>
        <div className={styles.statItem} style={{ borderLeft: '3px solid #92400e' }}>
          <span className={styles.statNumber} style={{ color: '#92400e' }}>{s.mezmursNeedsReview}</span>
          <span className={styles.statLabel}>Mezmurs Needing Review</span>
        </div>
        <div className={styles.statItem}>
          <span className={styles.statNumber}>{s.calendarTotal}</span>
          <span className={styles.statLabel}>Total Calendar Cards</span>
        </div>
        <div className={styles.statItem} style={{ borderLeft: '3px solid #166534' }}>
          <span className={styles.statNumber} style={{ color: '#166534' }}>{s.calendarReviewed}</span>
          <span className={styles.statLabel}>Calendar Cards Reviewed</span>
        </div>
        <div className={styles.statItem} style={{ borderLeft: '3px solid #92400e' }}>
          <span className={styles.statNumber} style={{ color: '#92400e' }}>{s.calendarNeedsReview}</span>
          <span className={styles.statLabel}>Cards Needing Review</span>
        </div>
      </div>

      {/* Direct Review Shortcuts */}
      <div className={styles.shortcutsRow}>
        <span style={{ fontSize: '0.8125rem', fontWeight: 600, color: '#1e293b' }}>
          Quick Editorial Queues:
        </span>
        <Link
          to="/admin/hymns/mezmur?review=needs_review"
          className={`${styles.shortcutLink} ${styles.shortcutLinkPrimary}`}
        >
          Review Mezmurs ({s.mezmursNeedsReview}) →
        </Link>
        <Link
          to="/admin/calendar/cards?review=needs_review"
          className={`${styles.shortcutLink} ${styles.shortcutLinkPrimary}`}
        >
          Review Calendar Cards ({s.calendarNeedsReview}) →
        </Link>
        <Link
          to="/admin/calendar/mezmurs"
          className={styles.shortcutLink}
        >
          Manage Calendar-Hymn Links →
        </Link>
      </div>

      {/* Interactive Quick Review Section */}
      <div className={styles.quickReviewSection}>
        <div className={styles.controlsBar}>
          <div style={{ display: 'flex', gap: '0.4rem' }}>
            <button
              type="button"
              className={styles.shortcutLink}
              style={{
                background: filter === 'needs_review' ? '#1e293b' : '#f1f5f9',
                color: filter === 'needs_review' ? '#ffffff' : '#1e293b',
              }}
              onClick={() => { setFilter('needs_review'); setPage(1) }}
            >
              Needs Review
            </button>
            <button
              type="button"
              className={styles.shortcutLink}
              style={{
                background: filter === 'reviewed' ? '#1e293b' : '#f1f5f9',
                color: filter === 'reviewed' ? '#ffffff' : '#1e293b',
              }}
              onClick={() => { setFilter('reviewed'); setPage(1) }}
            >
              Reviewed
            </button>
            <button
              type="button"
              className={styles.shortcutLink}
              style={{
                background: filter === 'all' ? '#1e293b' : '#f1f5f9',
                color: filter === 'all' ? '#ffffff' : '#1e293b',
              }}
              onClick={() => { setFilter('all'); setPage(1) }}
            >
              All Items
            </button>
          </div>

          <input
            type="text"
            placeholder="Search items in quick queue…"
            value={search}
            onChange={(e) => { setSearch(e.target.value); setPage(1) }}
            className={styles.searchBox}
          />
        </div>

        <div className={styles.tableWrap}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th style={{ width: '15%' }}>Type</th>
                <th style={{ width: '40%' }}>Title</th>
                <th style={{ width: '20%' }}>Details</th>
                <th style={{ width: '25%' }}>Review Action</th>
              </tr>
            </thead>
            <tbody>
              {paginatedItems.map((item) => {
                const status = resolveReviewStatus(item.id, reviewsMap)
                const note = getReviewNote(item.id, reviewsMap)
                return (
                  <tr key={item.id}>
                    <td>
                      <span style={{ fontSize: '0.72rem', textTransform: 'uppercase', fontWeight: 600, padding: '0.15rem 0.4rem', borderRadius: '4px', background: item.type === 'mezmur' ? '#f3e8ff' : '#e0f2fe', color: item.type === 'mezmur' ? '#6b21a8' : '#0369a1' }}>
                        {item.type === 'mezmur' ? 'Mezmur' : 'Calendar Card'}
                      </span>
                    </td>
                    <td>
                      <strong>{item.title}</strong>
                      {item.titleAmharic && (
                        <div lang="am" style={{ fontSize: '0.75rem', color: '#8a6414' }}>
                          {item.titleAmharic}
                        </div>
                      )}
                    </td>
                    <td style={{ color: '#64748b' }}>
                      {item.details}
                    </td>
                    <td>
                      <AdminContentReviewTag
                        contentType={item.type}
                        contentId={item.id}
                        currentStatus={status}
                        currentNote={note}
                        compact
                        onStatusChange={(newStatus, newNote) => {
                          setReviewsMap((prev) => {
                            const next = new Map(prev)
                            next.set(item.id, {
                              content_type: item.type,
                              content_id: item.id,
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
        </div>

        <div className={styles.pagination}>
          <span>Showing {paginatedItems.length} of {filteredItems.length} items</span>
          <div style={{ display: 'flex', gap: '0.4rem' }}>
            <button
              type="button"
              disabled={page <= 1}
              onClick={() => setPage((p) => p - 1)}
              className={styles.shortcutLink}
              style={{ padding: '0.2rem 0.5rem' }}
            >
              Previous
            </button>
            <span style={{ padding: '0.2rem 0.4rem' }}>{page} / {totalPages}</span>
            <button
              type="button"
              disabled={page >= totalPages}
              onClick={() => setPage((p) => p + 1)}
              className={styles.shortcutLink}
              style={{ padding: '0.2rem 0.5rem' }}
            >
              Next
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}
