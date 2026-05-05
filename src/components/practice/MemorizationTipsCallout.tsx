import { useTranslation } from '../../i18n'
import styles from './MemorizationTipsCallout.module.css'

export function MemorizationTipsCallout() {
  const t = useTranslation()

  return (
    <aside className={styles.root} aria-label={t('mezmurPractice.memory.tipsAria')}>
      <p className={styles.title}>{t('mezmurPractice.memory.tipsTitle')}</p>
      <ul className={styles.list}>
        <li>{t('mezmurPractice.memory.tip1')}</li>
        <li>{t('mezmurPractice.memory.tip2')}</li>
        <li>{t('mezmurPractice.memory.tip3')}</li>
        <li>{t('mezmurPractice.memory.tip4')}</li>
      </ul>
    </aside>
  )
}
