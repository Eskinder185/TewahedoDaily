import { useState, useMemo } from 'react'
import {
  CALENDAR_MEZMUR_LINKS,
  type CalendarMezmurLink,
} from '../../lib/recommendations/calendarMezmursData'
import { supabase } from '../../lib/supabase/client'
import styles from './CalendarMezmurAdmin.module.css'

export function CalendarMezmurAdmin() {
  const [links, setLinks] = useState<CalendarMezmurLink[]>(() => [...CALENDAR_MEZMUR_LINKS])
  const [activeTab, setActiveTab] = useState<'links' | 'queue' | 'add'>('links')
  const [searchQuery, setSearchQuery] = useState('')
  const [statusFilter, setStatusFilter] = useState<'all' | 'approved' | 'pending_review' | 'rejected'>('all')

  // Form state for adding new association
  const [formCardSlug, setFormCardSlug] = useState('')
  const [formEventTitle, setFormEventTitle] = useState('')
  const [formEventKind, setFormEventKind] = useState<CalendarMezmurLink['event_kind']>('observance')
  const [formMezmurSlug, setFormMezmurSlug] = useState('')
  const [formMezmurTitle, setFormMezmurTitle] = useState('')
  const [formRelType, setFormRelType] = useState<CalendarMezmurLink['relationship_type']>('exact_commemoration')
  const [formPriority, setFormPriority] = useState<number>(1)
  const [formReasonEn, setFormReasonEn] = useState('')
  const [formReasonAm, setFormReasonAm] = useState('')
  const [statusMessage, setStatusMessage] = useState<string | null>(null)

  // Calculate statistics
  const stats = useMemo(() => {
    const total = links.length
    const approved = links.filter((l) => l.review_status === 'approved').length
    const pending = links.filter((l) => l.review_status === 'pending_review').length
    const rejected = links.filter((l) => l.review_status === 'rejected').length
    const uniqueCardsCovered = new Set(links.filter((l) => l.review_status === 'approved').map((l) => l.calendar_card_slug)).size
    return { total, approved, pending, rejected, uniqueCardsCovered }
  }, [links])

  // Filter links
  const filteredLinks = useMemo(() => {
    return links.filter((link) => {
      if (statusFilter !== 'all' && link.review_status !== statusFilter) return false
      if (searchQuery.trim()) {
        const q = searchQuery.toLowerCase()
        const cardMatch = link.calendar_card_slug.toLowerCase().includes(q) || link.event_title.toLowerCase().includes(q)
        const mezmurMatch = link.mezmur_slug.toLowerCase().includes(q) || link.mezmur_title.toLowerCase().includes(q)
        if (!cardMatch && !mezmurMatch) return false
      }
      return true
    })
  }, [links, statusFilter, searchQuery])

  const handleStatusChange = async (cardSlug: string, mezmurSlug: string, newStatus: 'approved' | 'rejected' | 'pending_review') => {
    setLinks((prev) =>
      prev.map((l) =>
        l.calendar_card_slug === cardSlug && l.mezmur_slug === mezmurSlug
          ? { ...l, review_status: newStatus }
          : l
      )
    )

    if (supabase) {
      try {
        await (supabase as any)
          .from('calendar_card_mezmurs')
          .update({ review_status: newStatus, updated_at: new Date().toISOString() })
          .match({ calendar_card_slug: cardSlug, mezmur_slug: mezmurSlug })
      } catch (err) {
        console.warn('Supabase update note: working in local fallback', err)
      }
    }
  }

  const handlePriorityChange = async (cardSlug: string, mezmurSlug: string, newPriority: number) => {
    setLinks((prev) =>
      prev.map((l) =>
        l.calendar_card_slug === cardSlug && l.mezmur_slug === mezmurSlug
          ? { ...l, priority: newPriority }
          : l
      )
    )

    if (supabase) {
      try {
        await (supabase as any)
          .from('calendar_card_mezmurs')
          .update({ priority: newPriority, updated_at: new Date().toISOString() })
          .match({ calendar_card_slug: cardSlug, mezmur_slug: mezmurSlug })
      } catch (err) {
        console.warn('Supabase update note: working in local fallback', err)
      }
    }
  }

  const handleAddAssociation = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!formCardSlug.trim() || !formMezmurSlug.trim()) {
      setStatusMessage('Error: Calendar Card Slug and Mezmur Slug are required.')
      return
    }

    const newLink: CalendarMezmurLink = {
      calendar_card_slug: formCardSlug.trim(),
      event_kind: formEventKind,
      event_title: formEventTitle.trim() || formCardSlug.trim(),
      mezmur_slug: formMezmurSlug.trim(),
      mezmur_title: formMezmurTitle.trim() || formMezmurSlug.trim(),
      relationship_type: formRelType,
      priority: formPriority,
      reason_en: formReasonEn.trim() || 'Verified hymn association',
      reason_am: formReasonAm.trim() || 'የቀኑ ምስጋና መዝሙር',
      review_status: 'approved',
    }

    setLinks((prev) => [newLink, ...prev])
    setStatusMessage(`Successfully linked ${newLink.mezmur_title} to ${newLink.event_title}`)

    if (supabase) {
      try {
        await (supabase as any).from('calendar_card_mezmurs').insert({
          calendar_card_slug: newLink.calendar_card_slug,
          event_kind: newLink.event_kind,
          event_title: newLink.event_title,
          mezmur_slug: newLink.mezmur_slug,
          mezmur_title: newLink.mezmur_title,
          relationship_type: newLink.relationship_type,
          priority: newLink.priority,
          reason_en: newLink.reason_en,
          reason_am: newLink.reason_am,
          review_status: newLink.review_status,
        })
      } catch (err) {
        console.warn('Supabase insert note: working in local fallback', err)
      }
    }

    // Reset form
    setFormCardSlug('')
    setFormEventTitle('')
    setFormMezmurSlug('')
    setFormMezmurTitle('')
    setFormReasonEn('')
    setFormReasonAm('')
  }

  return (
    <div className={styles.container}>
      <header className={styles.header}>
        <h1 className={styles.title}>Calendar & Hymn Link Manager</h1>
        <p className={styles.description}>
          Deterministic, verifiable relationships linking Ethiopian Orthodox calendar cards and commemorations to published Mezmurs.
        </p>
      </header>

      {/* Stats Summary */}
      <div className={styles.statsGrid}>
        <div className={styles.statCard}>
          <span className={styles.statValue}>{stats.total}</span>
          <span className={styles.statLabel}>Total Linked Associations</span>
        </div>
        <div className={styles.statCard}>
          <span className={styles.statValue}>{stats.approved}</span>
          <span className={styles.statLabel}>Approved Matches</span>
        </div>
        <div className={styles.statCard}>
          <span className={styles.statValue}>{stats.uniqueCardsCovered}</span>
          <span className={styles.statLabel}>Covered Calendar Cards</span>
        </div>
        <div className={styles.statCard}>
          <span className={styles.statValue}>{stats.pending}</span>
          <span className={styles.statLabel}>Pending Review Queue</span>
        </div>
      </div>

      {/* Navigation & Controls */}
      <div className={styles.controlsRow}>
        <div className={styles.tabs}>
          <button
            type="button"
            className={`${styles.tabBtn} ${activeTab === 'links' ? styles.tabBtnActive : ''}`}
            onClick={() => setActiveTab('links')}
          >
            Verified Hymn Links ({stats.approved})
          </button>
          <button
            type="button"
            className={`${styles.tabBtn} ${activeTab === 'queue' ? styles.tabBtnActive : ''}`}
            onClick={() => setActiveTab('queue')}
          >
            Review Queue
          </button>
          <button
            type="button"
            className={`${styles.tabBtn} ${activeTab === 'add' ? styles.tabBtnActive : ''}`}
            onClick={() => setActiveTab('add')}
          >
            + Link Hymn to Card
          </button>
        </div>

        {activeTab === 'links' && (
          <div className={styles.filterGroup}>
            <input
              type="text"
              placeholder="Search by card or hymn..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              className={styles.searchInput}
            />
            <select
              value={statusFilter}
              onChange={(e) => setStatusFilter(e.target.value as any)}
              className={styles.selectInput}
            >
              <option value="all">All Statuses</option>
              <option value="approved">Approved</option>
              <option value="pending_review">Pending Review</option>
              <option value="rejected">Rejected</option>
            </select>
          </div>
        )}
      </div>

      {statusMessage && (
        <div style={{ padding: '0.75rem 1rem', background: '#f0fdf4', border: '1px solid #bbf7d0', borderRadius: '6px', color: '#166534', fontSize: '0.875rem' }}>
          {statusMessage}
        </div>
      )}

      {/* Main Content Area */}
      {activeTab === 'links' && (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Priority</th>
                <th>Calendar Event</th>
                <th>Hymn (Mezmur)</th>
                <th>Relationship</th>
                <th>Status</th>
                <th>Reason</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              {filteredLinks.map((link) => (
                <tr key={`${link.calendar_card_slug}-${link.mezmur_slug}`}>
                  <td>
                    <span className={styles.priorityBadge}>{link.priority}</span>
                  </td>
                  <td>
                    <strong>{link.event_title}</strong>
                    <div style={{ fontSize: '0.75rem', color: '#64748b' }}>{link.calendar_card_slug}</div>
                  </td>
                  <td>
                    <a
                      href={`/practice/mezmur/${link.mezmur_slug}`}
                      target="_blank"
                      rel="noreferrer"
                      style={{ color: '#1e293b', fontWeight: 600, textDecoration: 'underline' }}
                    >
                      {link.mezmur_title}
                    </a>
                    {link.mezmur_title_amharic && (
                      <div style={{ fontSize: '0.8125rem', color: '#8a6414' }}>{link.mezmur_title_amharic}</div>
                    )}
                  </td>
                  <td>
                    <span style={{ fontSize: '0.75rem', textTransform: 'capitalize', fontWeight: 600 }}>
                      {link.relationship_type.replace(/_/g, ' ')}
                    </span>
                  </td>
                  <td>
                    <span
                      className={
                        link.review_status === 'approved'
                          ? styles.badgeApproved
                          : link.review_status === 'pending_review'
                          ? styles.badgePending
                          : styles.badgeRejected
                      }
                    >
                      {link.review_status}
                    </span>
                  </td>
                  <td>
                    <div style={{ fontSize: '0.8125rem', maxWidth: '280px' }}>{link.reason_en}</div>
                  </td>
                  <td>
                    <div className={styles.actionsCell}>
                      {link.review_status !== 'approved' && (
                        <button
                          type="button"
                          className={`${styles.actionBtn} ${styles.actionBtnApprove}`}
                          onClick={() => handleStatusChange(link.calendar_card_slug, link.mezmur_slug, 'approved')}
                        >
                          Approve
                        </button>
                      )}
                      {link.review_status !== 'rejected' && (
                        <button
                          type="button"
                          className={`${styles.actionBtn} ${styles.actionBtnReject}`}
                          onClick={() => handleStatusChange(link.calendar_card_slug, link.mezmur_slug, 'rejected')}
                        >
                          Reject
                        </button>
                      )}
                      <select
                        value={link.priority}
                        onChange={(e) => handlePriorityChange(link.calendar_card_slug, link.mezmur_slug, Number(e.target.value))}
                        className={styles.selectInput}
                        style={{ padding: '0.2rem 0.4rem', fontSize: '0.75rem' }}
                      >
                        <option value={1}>P1</option>
                        <option value={2}>P2</option>
                        <option value={3}>P3</option>
                        <option value={4}>P4</option>
                        <option value={5}>P5</option>
                      </select>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}

      {activeTab === 'queue' && (
        <div className={styles.tableContainer}>
          <table className={styles.table}>
            <thead>
              <tr>
                <th>Commemoration</th>
                <th>Slug</th>
                <th>Status</th>
                <th>Editorial Guidance</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><strong>Archangel Uriel (Day 22)</strong></td>
                <td><code>monthly-uriel-monthly</code></td>
                <td><span className={styles.badgePending}>Pending Review</span></td>
                <td>Zero published hymns currently exist for Archangel Uriel in catalog. Requires recording/cataloging an authentic Uriel hymn.</td>
                <td>
                  <button
                    type="button"
                    className={styles.actionBtn}
                    onClick={() => {
                      setFormCardSlug('monthly-uriel-monthly')
                      setFormEventTitle('Archangel Uriel')
                      setFormEventKind('monthly')
                      setActiveTab('add')
                    }}
                  >
                    Attach Hymn
                  </button>
                </td>
              </tr>
              <tr>
                <td><strong>Saint Uriel — Tir 22</strong></td>
                <td><code>observance-uriel-tir</code></td>
                <td><span className={styles.badgePending}>Pending Review</span></td>
                <td>Annual feast of Archangel Uriel. Awaiting verified hymn acquisition.</td>
                <td>
                  <button
                    type="button"
                    className={styles.actionBtn}
                    onClick={() => {
                      setFormCardSlug('observance-uriel-tir')
                      setFormEventTitle('Saint Uriel — Tir')
                      setFormEventKind('observance')
                      setActiveTab('add')
                    }}
                  >
                    Attach Hymn
                  </button>
                </td>
              </tr>
              <tr>
                <td><strong>Saint Uriel — Hamle 22</strong></td>
                <td><code>observance-uriel-hamle</code></td>
                <td><span className={styles.badgePending}>Pending Review</span></td>
                <td>Annual feast of Archangel Uriel. Awaiting verified hymn acquisition.</td>
                <td>
                  <button
                    type="button"
                    className={styles.actionBtn}
                    onClick={() => {
                      setFormCardSlug('observance-uriel-hamle')
                      setFormEventTitle('Saint Uriel — Hamle')
                      setFormEventKind('observance')
                      setActiveTab('add')
                    }}
                  >
                    Attach Hymn
                  </button>
                </td>
              </tr>
              <tr>
                <td><strong>Fast of Judith (Tsome Yodit)</strong></td>
                <td><code>fast-judith-fast</code></td>
                <td><span className={styles.badgePending}>Pending Review</span></td>
                <td>Special ascetic fast. Repentance or fasting hymn recommended.</td>
                <td>
                  <button
                    type="button"
                    className={styles.actionBtn}
                    onClick={() => {
                      setFormCardSlug('fast-judith-fast')
                      setFormEventTitle('Fast of Judith')
                      setFormEventKind('fast')
                      setActiveTab('add')
                    }}
                  >
                    Attach Hymn
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      )}

      {activeTab === 'add' && (
        <form onSubmit={handleAddAssociation} className={styles.formCard}>
          <h2 style={{ fontSize: '1.15rem', margin: 0 }}>Attach Hymn to Calendar Card</h2>
          <div className={styles.formGrid}>
            <div className={styles.formField}>
              <label className={styles.formLabel}>Calendar Card Slug *</label>
              <input
                type="text"
                placeholder="e.g. observance-gabriel-tahsas"
                value={formCardSlug}
                onChange={(e) => setFormCardSlug(e.target.value)}
                className={styles.searchInput}
                required
              />
            </div>
            <div className={styles.formField}>
              <label className={styles.formLabel}>Event Title</label>
              <input
                type="text"
                placeholder="e.g. Saint Gabriel — Tahsas"
                value={formEventTitle}
                onChange={(e) => setFormEventTitle(e.target.value)}
                className={styles.searchInput}
              />
            </div>
            <div className={styles.formField}>
              <label className={styles.formLabel}>Event Kind</label>
              <select
                value={formEventKind}
                onChange={(e) => setFormEventKind(e.target.value as any)}
                className={styles.selectInput}
              >
                <option value="observance">Observance</option>
                <option value="monthly">Monthly Commemoration</option>
                <option value="fast">Fast</option>
                <option value="season">Season</option>
              </select>
            </div>
            <div className={styles.formField}>
              <label className={styles.formLabel}>Mezmur Slug *</label>
              <input
                type="text"
                placeholder="e.g. gebriel-hayal-melake-selam"
                value={formMezmurSlug}
                onChange={(e) => setFormMezmurSlug(e.target.value)}
                className={styles.searchInput}
                required
              />
            </div>
            <div className={styles.formField}>
              <label className={styles.formLabel}>Mezmur Title</label>
              <input
                type="text"
                placeholder="e.g. Gebriel Hayal Melake Selam"
                value={formMezmurTitle}
                onChange={(e) => setFormMezmurTitle(e.target.value)}
                className={styles.searchInput}
              />
            </div>
            <div className={styles.formField}>
              <label className={styles.formLabel}>Relationship Type</label>
              <select
                value={formRelType}
                onChange={(e) => setFormRelType(e.target.value as any)}
                className={styles.selectInput}
              >
                <option value="exact_commemoration">Exact Commemoration (Priority 1)</option>
                <option value="saint_angel">Saint / Angel (Priority 2)</option>
                <option value="feast">Feast (Priority 2)</option>
                <option value="fasting_occasion">Fasting Occasion (Priority 3)</option>
                <option value="liturgical_season">Liturgical Season (Priority 4)</option>
                <option value="thematic">Thematic (Priority 5)</option>
              </select>
            </div>
            <div className={styles.formField}>
              <label className={styles.formLabel}>Priority Ranking (1–5)</label>
              <input
                type="number"
                min={1}
                max={5}
                value={formPriority}
                onChange={(e) => setFormPriority(Number(e.target.value))}
                className={styles.selectInput}
              />
            </div>
          </div>

          <div className={styles.formGrid}>
            <div className={styles.formField}>
              <label className={styles.formLabel}>Reason (English)</label>
              <input
                type="text"
                placeholder="Official feast hymn commemorating..."
                value={formReasonEn}
                onChange={(e) => setFormReasonEn(e.target.value)}
                className={styles.searchInput}
              />
            </div>
            <div className={styles.formField}>
              <label className={styles.formLabel}>Reason (Amharic)</label>
              <input
                type="text"
                placeholder="የበዓሉ ምስጋና መዝሙር..."
                value={formReasonAm}
                onChange={(e) => setFormReasonAm(e.target.value)}
                className={styles.searchInput}
              />
            </div>
          </div>

          <button type="submit" className={styles.formSubmitBtn}>
            Save Association
          </button>
        </form>
      )}
    </div>
  )
}
