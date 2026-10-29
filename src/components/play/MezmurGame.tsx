import { useState } from 'react'
import type { AppLocale } from '../../lib/i18n/locale'
import type { PlayQuestion } from '../../lib/play/types'
import { QuizGame } from './QuizGame'
import styles from './GameShell.module.css'

type Mode = NonNullable<PlayQuestion['mode']>

export function MezmurGame({ locale, questions }: { locale: AppLocale; questions: PlayQuestion[] }) {
  const [mode, setMode] = useState<Mode>('finish-lyrics')
  const modes: { key: Mode; en: string; am: string }[] = [
    { key: 'finish-lyrics', en: 'Finish the Lyrics', am: 'ግጥሙን ይጨርሱ' },
    { key: 'missing-word', en: 'Missing Word', am: 'የጎደለው ቃል' },
    { key: 'guess-mezmur', en: 'Guess the Mezmur', am: 'መዝሙሩን ይገምቱ' },
    { key: 'guess-occasion', en: 'Guess the Occasion', am: 'አጋጣሚውን ይገምቱ' },
  ]
  const filtered = questions.filter((item) => (item.mode || 'finish-lyrics') === mode)
  return <div><div className={styles.choiceRow} role="group" aria-label={locale === 'am' ? 'የመዝሙር ጨዋታ ሁነታ' : 'Mezmur game mode'}>{modes.map((item) => <button type="button" key={item.key} aria-pressed={mode === item.key} onClick={() => setMode(item.key)}>{item[locale]}</button>)}</div><QuizGame locale={locale} game="finish-the-mezmur" questions={filtered}/></div>
}
