import { useState } from 'react'
import { Link } from 'react-router-dom'
import type { AppLocale } from '../../lib/i18n/locale'
import { HISTORY_TIMELINE } from '../../lib/play/approvedContent'
import type { PlayQuestion } from '../../lib/play/types'
import { QuizGame } from './QuizGame'
import styles from './GameShell.module.css'

type Mode = 'choose' | 'timeline' | 'people' | 'mystery' | 'match'

export function HistoryQuestGame({ locale, questions }: { locale: AppLocale; questions: PlayQuestion[] }) {
  const [mode, setMode] = useState<Mode>('choose')
  const [order, setOrder] = useState(() => [...HISTORY_TIMELINE].reverse())
  const [checked, setChecked] = useState(false)
  const am = locale === 'am'
  const move = (index: number, direction: -1 | 1) => {
    const target = index + direction
    if (target < 0 || target >= order.length) return
    const next = [...order]; [next[index], next[target]] = [next[target], next[index]]; setOrder(next); setChecked(false)
  }
  if (mode === 'choose') return <section className={styles.panel}><h2>{am ? 'የታሪክ ጨዋታ ይምረጡ' : 'Choose a History Quest mode'}</h2><div className={styles.setupGrid}>{[
    ['timeline', am ? 'የጊዜ መስመር' : 'Timeline Challenge'], ['people', am ? 'ይህ ማን ነበር?' : 'Who Was This?'],
    ['mystery', am ? 'የታሪክ ምስጢር' : 'Historical Mystery'], ['match', am ? 'ክስተቱን ያዛምዱ' : 'Match the Event'],
  ].map(([key,label]) => <button className={styles.option} type="button" key={key} onClick={() => setMode(key as Mode)}>{label}</button>)}</div></section>
  if (mode === 'timeline') {
    const correct = order.every((item, index) => index === 0 || order[index - 1].year < item.year)
    return <section className={styles.panel}><button className={styles.secondary} type="button" onClick={() => setMode('choose')}>← {am ? 'ሁነታዎች' : 'Modes'}</button><h2>{am ? 'ክስተቶቹን ከቀድሞ ወደ ኋላ ያደራጁ' : 'Arrange the events from earliest to latest'}</h2><div className={styles.review}>{order.map((item,index) => <article key={item.id}><strong>{item.label.en}</strong>{checked && correct ? <p>{item.year}</p> : null}<div className={styles.actions}><button type="button" disabled={index === 0} onClick={() => move(index,-1)} aria-label={`Move ${item.label.en} earlier`}>↑</button><button type="button" disabled={index === order.length - 1} onClick={() => move(index,1)} aria-label={`Move ${item.label.en} later`}>↓</button></div></article>)}</div><div className={styles.actions}><button className={styles.action} type="button" onClick={() => setChecked(true)}>{am ? 'ቅደም ተከተሉን ያረጋግጡ' : 'Check timeline'}</button></div>{checked ? <div className={styles.feedback} role="status"><strong>{correct ? (am ? 'ትክክል!' : 'Timeline complete!') : (am ? 'እንደገና ያደራጁ።' : 'Not yet—reorder the events and try again.')}</strong>{correct ? <p>Nicaea (325) → Constantinople (381) → Ephesus (431)</p> : null}{correct ? <Link to={HISTORY_TIMELINE[0].source.route}>{HISTORY_TIMELINE[0].source.label}</Link> : null}</div> : null}</section>
  }
  const selected = mode === 'people' ? questions.filter((item) => /ezana|frumentius/.test(item.id)) : mode === 'mystery' ? questions.map((item) => ({ ...item, hints: [{ en: `Category: ${item.category}` }, { en: `Source section: ${item.source.label}` }, { en: `The answer is one of the four reviewed choices below.` }] })) : questions
  return <div><button className={styles.secondary} type="button" onClick={() => setMode('choose')}>← {am ? 'ሁነታዎች' : 'Modes'}</button><QuizGame locale={locale} game="history" questions={selected}/></div>
}
