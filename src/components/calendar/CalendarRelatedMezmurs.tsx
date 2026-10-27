import { Link } from 'react-router-dom'
import {
  getMezmursForCalendarCardSlug,
  type CalendarMezmurLink,
} from '../../lib/recommendations/calendarMezmursData'
import type { CalendarLocaleMode } from '../../lib/calendar/calendarEnrichedContent'
import styles from './CalendarRelatedMezmurs.module.css'

interface Props {
  cardSlug?: string
  fallbackRaw?: string
  lang?: CalendarLocaleMode
}

function relationshipLabel(type: CalendarMezmurLink['relationship_type'], isAmharic: boolean): string {
  switch (type) {
    case 'exact_commemoration':
      return isAmharic ? 'የበዓሉ መዝሙር' : 'Feast Hymn'
    case 'saint_angel':
      return isAmharic ? 'የቅዱሱ ምስጋና' : 'Saint Hymn'
    case 'feast':
      return isAmharic ? 'የበዓል ምስጋና' : 'Feast Hymn'
    case 'liturgical_season':
      return isAmharic ? 'የወቅቱ መዝሙር' : 'Seasonal Hymn'
    case 'fasting_occasion':
      return isAmharic ? 'የጾም መዝሙር' : 'Fast Hymn'
    case 'thematic':
    default:
      return isAmharic ? 'የምስጋና መዝሙር' : 'Hymn'
  }
}

export function CalendarRelatedMezmurs({ cardSlug, fallbackRaw, lang = 'en' }: Props) {
  const isAmharic = lang === 'am'
  const links = cardSlug ? getMezmursForCalendarCardSlug(cardSlug) : []

  if (links.length === 0) {
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
      {links.map((link) => {
        const title = isAmharic && link.mezmur_title_amharic ? link.mezmur_title_amharic : link.mezmur_title
        const reason = isAmharic && link.reason_am ? link.reason_am : link.reason_en
        const badgeText = relationshipLabel(link.relationship_type, isAmharic)
        const btnText = isAmharic ? 'መዝሙሩን ይመልከቱ' : 'View Hymn'

        return (
          <div key={`${link.calendar_card_slug}-${link.mezmur_slug}`} className={styles.row}>
            <div className={styles.info}>
              <div className={styles.titleRow}>
                <span className={styles.title}>{title}</span>
                {!isAmharic && link.mezmur_title_amharic && (
                  <span className={styles.titleAm} lang="am">
                    {link.mezmur_title_amharic}
                  </span>
                )}
              </div>
              <div className={styles.metaRow}>
                <span className={styles.badge}>{badgeText}</span>
                {reason && <span className={styles.reason} title={reason}>{reason}</span>}
              </div>
            </div>

            <Link
              to={`/practice/mezmur/${link.mezmur_slug}`}
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
