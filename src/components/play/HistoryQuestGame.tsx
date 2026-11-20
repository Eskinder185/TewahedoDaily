import { useEffect, useState } from 'react'
import { SourceLink } from './SourceLink'
import type { AppLocale } from '../../lib/i18n/locale'
import { HISTORY_TIMELINE } from '../../lib/play/approvedContent'
import type { PlayQuestion } from '../../lib/play/types'
import type { HistoryStudioEvent } from '../../lib/play/contentStudio'
import { QuizGame } from './QuizGame'
import { isSourcePublic, publishedLibraryBooks } from '../../lib/play/sourceAvailability'
import styles from './GameShell.module.css'

type Mode = 'choose' | 'timeline' | 'people' | 'mystery' | 'match'

export function HistoryQuestGame({ locale, questions, timeline = HISTORY_TIMELINE, useFallbackHints = true, loading = false }: { locale: AppLocale; questions: PlayQuestion[]; loading?: boolean; timeline?: HistoryStudioEvent[]; useFallbackHints?: boolean }) {
  const [mode, setMode] = useState<Mode>('choose')
  const [order, setOrder] = useState(() => [...timeline].reverse())
  const [checked, setChecked] = useState(false)
  const am = locale === 'am'
  // Questions whose Church Library book is not published online yet stay playable but are called out, never presented as fully sourced.
  const [blocked, setBlocked] = useState(0)
  useEffect(() => {
    let active = true
    void publishedLibraryBooks().then((books) => { if (active) setBlocked(questions.filter((item) => !isSourcePublic(item.source, books)).length) }).catch(() => undefined)
    return () => { active = false }
  }, [questions])
  const sourceNotice = blocked > 0 ? <p role="note" data-history-source-notice className={styles.contentStatus}>{am ? `ከ${questions.length} ጥያቄዎች ${blocked} የሚጠቅሱት እስካሁን በመስመር ላይ ያልታተመ የቤተ ክርስቲያን ቤተ መጻሕፍት መጽሐፍ ነው። ጥቅሳቸው በጽሑፍ ብቻ ይታያል፤ መጽሐፉ እስኪታተም ድረስ ሊታተሙ አይችሉም።` : `${blocked} of ${questions.length} questions cite Church Library books that are not published online yet. Their citations show as plain text, and they cannot be published until those books are.`}</p> : null
  const move = (index: number, direction: -1 | 1) => {
    const target = index + direction
    if (target < 0 || target >= order.length) return
    const next = [...order]; [next[index], next[target]] = [next[target], next[index]]; setOrder(next); setChecked(false)
  }
  if (mode === 'choose') return <section className={styles.panel}><h2>{am ? 'የታሪክ ጨዋታ ይምረጡ' : 'Choose a History Quest mode'}</h2>{sourceNotice}<div className={styles.setupGrid}>{[
    ['timeline', am ? 'የጊዜ መስመር' : 'Timeline Challenge'], ['people', am ? 'ይህ ማን ነበር?' : 'Who Was This?'],
    ['mystery', am ? 'የታሪክ ምስጢር' : 'Historical Mystery'], ['match', am ? 'ክስተቱን ያዛምዱ' : 'Match the Event'],
  ].map(([key,label]) => <button className={styles.option} type="button" key={key} disabled={key === 'timeline' && !timeline.length} onClick={() => setMode(key as Mode)}>{label}</button>)}</div></section>
  if (mode === 'timeline') {
    const correct = order.every((item, index) => index === 0 || order[index - 1].year < item.year)
    return <section className={styles.panel}><button className={styles.secondary} type="button" onClick={() => setMode('choose')}>← {am ? 'ሁነታዎች' : 'Modes'}</button><h2>{am ? 'ክስተቶቹን ከቀድሞ ወደ ኋላ ያደራጁ' : 'Arrange the events from earliest to latest'}</h2><div className={styles.review}>{order.map((item,index) => <article key={item.id}><strong>{am && item.label.am ? item.label.am : item.label.en}</strong>{checked && correct ? <p>{item.year}</p> : null}<div className={styles.actions}><button type="button" disabled={index === 0} onClick={() => move(index,-1)} aria-label={`Move ${am && item.label.am ? item.label.am : item.label.en} earlier`}>↑</button><button type="button" disabled={index === order.length - 1} onClick={() => move(index,1)} aria-label={`Move ${am && item.label.am ? item.label.am : item.label.en} later`}>↓</button></div></article>)}</div><div className={styles.actions}><button className={styles.action} type="button" onClick={() => setChecked(true)}>{am ? 'ቅደም ተከተሉን ያረጋግጡ' : 'Check timeline'}</button></div>{checked ? <div className={styles.feedback} role="status"><strong>{correct ? (am ? 'ትክክል!' : 'Timeline complete!') : (am ? 'እንደገና ያደራጁ።' : 'Not yet—reorder the events and try again.')}</strong>{correct ? <p>{timeline.map(item => `${am && item.label.am ? item.label.am : item.label.en} (${item.year})`).join(' → ')}</p> : null}{correct ? <SourceLink source={timeline[0].source} locale={locale} /> : null}</div> : null}</section>
  }
  const selected = mode === 'people' ? questions.filter((item) => (item.category === 'people' || /ezana|frumentius/.test(item.id))) : mode === 'mystery' ? questions.map((item) => ({ ...item, hints: item.hints?.length ? item.hints : useFallbackHints ? [{ en: `Category: ${item.category}` }, { en: `Source section: ${item.source.label}` }, { en: `The answer is one of the four reviewed choices below.` }] : [] })) : questions
  return <div><button className={styles.secondary} type="button" onClick={() => setMode('choose')}>← {am ? 'ሁነታዎች' : 'Modes'}</button>{sourceNotice}<QuizGame locale={locale} game="history" questions={selected} loading={loading}/></div>
}
