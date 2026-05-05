import { Link } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { PageSection } from '../ui/PageSection'
import styles from './HomeModeGateway.module.css'

export function HomeModeGateway() {
  const t = useUiLabel()
  const tt = useTranslation()
  const items = [
    {
      to: '/practice',
      eyebrow: t('navPractice'),
      title: t('practiceHeadTitle'),
      body: tt('home.gateway.practiceBody'),
    },
    {
      to: '/prayers',
      eyebrow: t('navPray'),
      title: t('navPrayers'),
      body: tt('home.gateway.prayersBody'),
    },
    {
      to: '/calendar',
      eyebrow: t('navKeepDay'),
      title: t('navTodayPath'),
      body: tt('home.gateway.calendarBody'),
    },
  ]

  return (
    <PageSection variant="tint">
      <section className={styles.shell} aria-labelledby="home-gateway-title">
        <div className={styles.intro}>
          <p className={styles.eyebrow}>{t('homeGatewayEyebrow')}</p>
          <h2 id="home-gateway-title" className={styles.title}>
            {t('homeGatewayTitle')}
          </h2>
          <p className={styles.deck}>{t('homeGatewayDeck')}</p>
        </div>

        <div className={`${styles.grid} td-stagger`}>
          {items.map((item) => (
            <Link key={item.to} to={item.to} className={styles.card}>
              <p className={styles.cardEyebrow}>{item.eyebrow}</p>
              <h3 className={styles.cardTitle}>{item.title}</h3>
              <p className={styles.cardBody}>{item.body}</p>
              <span className={styles.cardCta}>
                {tt('home.gateway.open', { label: item.eyebrow })}
              </span>
            </Link>
          ))}
        </div>
      </section>
    </PageSection>
  )
}
