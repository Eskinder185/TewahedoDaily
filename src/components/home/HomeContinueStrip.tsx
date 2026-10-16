import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import { getGuestRecentViewed } from '../../lib/userContent/guestStorage'
import type { RecentViewedItem } from '../../lib/userContent/types'
import styles from './HomeContinueStrip.module.css'

/**
 * Compact anonymous resume strip — shows local recently viewed items without
 * requiring an account. Hidden when empty so Home stays calm for first visits.
 */
export function HomeContinueStrip() {
  const t = useTranslation()
  const [items, setItems] = useState<RecentViewedItem[]>([])

  useEffect(() => {
    setItems(getGuestRecentViewed().slice(0, 3))
  }, [])

  if (items.length === 0) return null

  return (
    <section className={styles.root} aria-label={t('home.continue.aria')}>
      <div className={styles.inner}>
        <h2 className={styles.title}>{t('home.continue.title')}</h2>
        <ul className={styles.list}>
          {items.map((item) => (
            <li key={`${item.contentType}-${item.contentSlug}`}>
              <Link className={styles.link} to={item.route}>
                <span className={styles.itemTitle}>{item.title}</span>
                <span className={styles.cta} aria-hidden>
                  →
                </span>
              </Link>
            </li>
          ))}
        </ul>
      </div>
    </section>
  )
}
