import { Link } from 'react-router-dom'
import { SanctuaryHero } from '../components/prayers/SanctuaryHero'
import { PageSection } from '../components/ui/PageSection'
import { useUiLabel } from '../lib/i18n/uiLabels'
import { prayerDetailPath } from '../lib/prayers/prayerSlug'
import { ZEWETER_PRAYERS } from '../lib/prayers/zeweterData'
import styles from './ZeweterTselotPage.module.css'

export function ZeweterTselotPage() {
  const t = useUiLabel()

  return (
    <PageSection variant="tint">
      <nav className={styles.nav} aria-label="Breadcrumb">
        <Link className={styles.crumb} to="/pray">
          {t('navPrayers')}
        </Link>
        <span className={styles.crumbSep} aria-hidden>
          /
        </span>
        <span className={styles.crumbCurrent}>{t('prayerZeweterTitle')}</span>
      </nav>

      <div className={styles.preReader}>
        <SanctuaryHero eyebrow={t('prayerZeweterEyebrow')} title={t('prayerZeweterTitle')}>
          <p>{t('prayerZeweterIntro')}</p>
        </SanctuaryHero>

        <div className={styles.jumpRow}>
          <a href="#zeweter-index" className={styles.jumpChip}>
            Prayer list
          </a>
        </div>
      </div>

      <div className={styles.grid}>
        <aside className={styles.rail} id="zeweter-index" aria-label={t('prayerZeweterNav')}>
          <p className={styles.railLabel}>{t('prayerZeweterNav')}</p>
          <ul className={styles.railList}>
            {ZEWETER_PRAYERS.map((p) => (
              <li key={p.id}>
                <Link className={styles.railBtn} to={prayerDetailPath(p.slug)}>
                  <span className={styles.railTitle}>{p.title}</span>
                  {p.transliterationTitle?.trim() ? (
                    <span className={styles.railSub}>{p.transliterationTitle}</span>
                  ) : null}
                  <span className={styles.railAction}>Read Prayer</span>
                </Link>
              </li>
            ))}
          </ul>
        </aside>
      </div>
    </PageSection>
  )
}
