import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { detail, type PublicMezmur } from '../../lib/publicContent/service'
import { classificationLabel } from '../../lib/publicContent/labels'
import {
  getMezmursForCalendarCardSlug,
} from '../../lib/recommendations/calendarMezmursData'
import type { CalendarLocaleMode } from '../../lib/calendar/calendarEnrichedContent'
import styles from './CalendarRelatedMezmurs.module.css'

interface Props {
  cardSlug?: string
  fallbackRaw?: string
  lang?: CalendarLocaleMode
}

export function CalendarRelatedMezmurs({ cardSlug, fallbackRaw, lang = 'en' }: Props) {
  const isAmharic = lang === 'am'
  const links = useMemo(() => cardSlug ? getMezmursForCalendarCardSlug(cardSlug) : [], [cardSlug])
  const [published, setPublished] = useState<Map<string, PublicMezmur>>(new Map())
  const [loading, setLoading] = useState(Boolean(cardSlug && links.length))
  useEffect(() => {
    let active = true
    if (!cardSlug || !links.length) return
    void Promise.all(links.map(link => detail(link.mezmur_slug).catch(() => null))).then(items => {
      if (active) { setPublished(new Map(items.filter((item): item is PublicMezmur => Boolean(item)).map(item => [item.slug, item]))); setLoading(false) }
    })
    return () => { active = false }
  }, [cardSlug, links])
  if (loading) return <p role="status" className={styles.empty}>{isAmharic ? 'መዝሙራትን በመፈተሽ ላይ…' : 'Checking published hymns…'}</p>
  const available = links.filter(link => published.has(link.mezmur_slug))

  if (available.length === 0) {
    if (fallbackRaw && fallbackRaw.trim().length > 0) {
      return (
        <div className={styles.empty}>
          <p>{fallbackRaw}</p>
        </div>
      )
    }
    return (
      <p className={styles.empty}>
        {isAmharic
          ? 'ለዚህ ዕለት የተመደቡ መዝሙራት በቅርቡ ይጨመራሉ።'
          : 'Verified hymns for this commemoration will be added soon.'}
      </p>
    )
  }

  return (
    <div className={styles.list}>
      {available.map((link) => {
        const hymn = published.get(link.mezmur_slug)!
        const title = isAmharic && hymn.title_amharic ? hymn.title_amharic : hymn.title
        const reason = isAmharic ? 'ከቀኑ ጋር የተያያዘ፤ ግንኙነቱ ለአርትኦት ይጠብቃል' : `Related to ${link.event_title}; editorial association pending review`
        const badgeText = isAmharic ? 'ተዛማጅ መዝሙር' : 'Related hymn'
        const btnText = isAmharic ? 'መዝሙሩን ይመልከቱ' : 'View Hymn'

        return (
          <div key={`${link.calendar_card_slug}-${link.mezmur_slug}`} className={styles.row}>
            <div className={styles.info}>
              <div className={styles.titleRow}>
                <span className={styles.title}>{title}</span>
                {!isAmharic && hymn.title_amharic && (
                  <span className={styles.titleAm} lang="am">
                    {hymn.title_amharic}
                  </span>
                )}
              </div>
              <div className={styles.metaRow}>
                <span className={styles.badge}>{badgeText}</span>
                {reason && <span className={styles.reason} title={reason}>{reason}</span>}
                {hymn.category && <span className={styles.reason}>{classificationLabel(hymn.category)}</span>}
                {hymn.language && <span className={styles.reason}>{classificationLabel(hymn.language)}</span>}
              </div>
            </div>

            <Link
              to={`/hymns/mezmur/${link.mezmur_slug}`}
              className={styles.viewBtn}
              title={isAmharic ? `${title} መዝሙርን ይመልከቱ` : `View hymn details for ${title}`}
            >
              <span>{btnText}</span>
              <span aria-hidden>→</span>
            </Link>
          </div>
        )
      })}
    </div>
  )
}
