import type { AppLocale } from '../../lib/i18n/locale'
import styles from './GameShell.module.css'

export function DatabaseContentStatus({ locale, state, retry }: { locale: AppLocale; state: 'loading' | 'error' | 'empty' | 'insufficient'; retry: () => void }) {
  const am = locale === 'am'
  return <section className={styles.panel} role={state === 'error' ? 'alert' : 'status'}>
    <p>{state === 'loading' ? (am ? 'የታተሙ ፈተናዎች በመጫን ላይ…' : 'Loading published challenges…')
      : state === 'error' ? (am ? 'ፈተናዎቹን መጫን አልተቻለም።' : 'Challenges could not be loaded. Please try again.')
        : state === 'insufficient' ? (am ? 'የታተመው ይዘት ለዚህ ጨዋታ ገና በቂ አይደለም። ተጨማሪ እስኪታተም ይጠብቁ።' : 'Some published content exists, but not enough yet to start this game. More must be approved and published.')
          : (am ? 'አዲስ ፈተናዎች እየተዘጋጁ ናቸው።' : 'New challenges are being prepared.')}</p>
    {state !== 'loading' && <button type="button" onClick={retry}>{am ? 'እንደገና ይሞክሩ' : 'Retry'}</button>}
  </section>
}
