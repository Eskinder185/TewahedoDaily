import { Link } from 'react-router-dom'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { PageSection } from '../ui/PageSection'
import styles from './HomeModeGateway.module.css'

export function HomeModeGateway() {
  const t = useUiLabel()
  const items = [
    {
      to: '/practice',
      eyebrow: t('navPractice'),
      title: t('practiceHeadTitle'),
      body: 'Practice mezmur, rhythm, and movement with a more guided studio flow.',
    },
    {
      to: '/prayers',
      eyebrow: t('navPray'),
      title: t('navPrayers'),
      body: 'Enter sacred reading with calmer prayer surfaces and shorter paths into the text.',
    },
    {
      to: '/calendar',
      eyebrow: t('navKeepDay'),
      title: t('navTodayPath'),
      body: 'See why today matters through feast, season, observance, and practical next steps.',
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
              <span className={styles.cardCta}>Open {item.eyebrow}</span>
            </Link>
          ))}
        </div>
      </section>
    </PageSection>
  )
}
