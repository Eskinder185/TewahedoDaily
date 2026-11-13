import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import type { AppLocale } from '../../lib/i18n/locale'
import { useAuth } from '../../lib/auth/useAuth'
import { WHO_AM_I_CARDS } from '../../lib/play/approvedContent'
import { recordPlayCompletion } from '../../lib/play/progress'
import { syncPlayCompletion } from '../../lib/play/progressSync'
import { localized, type WhoAmICard } from '../../lib/play/types'
import { cardLocale } from '../../lib/play/cardContent'
import { buildRoundOrder, categoriesOf, categoryLabel } from '../../lib/play/whoAmIDeck'
import { loadSeen, markSeen } from '../../lib/play/questionHistory'
import { SourceLink } from './SourceLink'
import { VerifiedFallback } from './GameShell'
import styles from './GameShell.module.css'

function playTone(frequency: number, duration = 0.09) {
  if (typeof window === 'undefined' || !window.AudioContext) return
  const context = new window.AudioContext()
  const oscillator = context.createOscillator()
  const gain = context.createGain()
  oscillator.frequency.value = frequency
  gain.gain.setValueAtTime(0.035, context.currentTime)
  gain.gain.exponentialRampToValueAtTime(0.001, context.currentTime + duration)
  oscillator.connect(gain); gain.connect(context.destination); oscillator.start(); oscillator.stop(context.currentTime + duration)
  oscillator.addEventListener('ended', () => void context.close())
}

export function WhoAmIGame({ locale, cards = WHO_AM_I_CARDS, preview = false }: { locale: AppLocale; cards?: readonly WhoAmICard[]; preview?: boolean }) {
  const { user } = useAuth()
  const am = locale === 'am'
  const [duration, setDuration] = useState(60)
  const [active, setActive] = useState(false)
  const [seconds, setSeconds] = useState(60)
  const [order, setOrder] = useState<WhoAmICard[]>([])
  const [index, setIndex] = useState(0)
  const [correct, setCorrect] = useState(0)
  const [skipped, setSkipped] = useState(0)
  const [finished, setFinished] = useState(false)
  const [shown, setShown] = useState<WhoAmICard[]>([])
  const [motion, setMotion] = useState(false)
  const [category, setCategory] = useState('all')
  const categories = useMemo(() => categoriesOf(cards), [cards])
  const available = category === 'all' ? cards.length : categories.find((item) => item.id === category)?.count ?? 0

  const finish = useCallback((final?: { correct: number; skipped: number }) => {
    const score = final?.correct ?? correct
    const passed = final?.skipped ?? skipped
    playTone(660, 0.16)
    setActive(false); setFinished(true)
    // Cards the player actually reached (the current card counts as seen); the review never reveals the rest.
    const reached = order.slice(0, Math.min(index + 1, order.length))
    setShown(reached)
    if (preview || !order.length) return
    markSeen('who-am-i', reached.map((card) => card.id))
    const saved = recordPlayCompletion({ game: 'who-am-i', score, maxScore: Math.max(1, score + passed), category: 'Who Am I' })
    void syncPlayCompletion(user, { game: 'who-am-i', score, maxScore: Math.max(1, score + passed), category: 'Who Am I', progress: saved.progress }).catch(() => undefined)
  }, [correct, skipped, user, preview, order, index])
  const mark = useCallback((isCorrect: boolean) => {
    if (!active) return
    playTone(isCorrect ? 520 : 210)
    const nextCorrect = correct + (isCorrect ? 1 : 0)
    const nextSkipped = skipped + (isCorrect ? 0 : 1)
    setCorrect(nextCorrect); setSkipped(nextSkipped)
    // The round ends when the timer does, or when every card in the chosen category has been shown.
    if (index + 1 >= order.length) finish({ correct: nextCorrect, skipped: nextSkipped })
    else setIndex(index + 1)
  }, [active, correct, skipped, index, order.length, finish])
  useEffect(() => {
    if (!active) return
    const timer = window.setTimeout(() => {
      if (seconds <= 1) finish()
      else setSeconds(seconds - 1)
    }, 1000)
    return () => window.clearTimeout(timer)
  }, [active, finish, seconds])
  useEffect(() => {
    if (!active) return
    const key = (event: KeyboardEvent) => {
      if (event.key === 'ArrowRight' || event.key === ' ') { event.preventDefault(); mark(true) }
      if (event.key === 'ArrowLeft') { event.preventDefault(); mark(false) }
    }
    window.addEventListener('keydown', key)
    return () => window.removeEventListener('keydown', key)
  }, [active, mark])
  useEffect(() => {
    if (!active || !motion) return
    let last = 0
    const tilt = (event: DeviceOrientationEvent) => {
      if (Date.now() - last < 900 || event.beta == null) return
      if (event.beta > 55) { last = Date.now(); mark(true) }
      if (event.beta < -25) { last = Date.now(); mark(false) }
    }
    window.addEventListener('deviceorientation', tilt)
    return () => window.removeEventListener('deviceorientation', tilt)
  }, [active, mark, motion])
  const start = () => {
    const next = buildRoundOrder(cards, category, loadSeen('who-am-i'))
    if (!next.length) return
    setOrder(next); setSeconds(duration); setIndex(0); setCorrect(0); setSkipped(0); setShown([]); setFinished(false); setActive(true)
  }
  const requestMotion = async () => {
    const orientation = DeviceOrientationEvent as typeof DeviceOrientationEvent & { requestPermission?: () => Promise<string> }
    if (orientation.requestPermission) {
      const result = await orientation.requestPermission()
      setMotion(result === 'granted')
    } else setMotion(true)
  }

  if (!active && !finished) {
    return (
      <section className={styles.panel}>
        <h2>{am ? 'ምድብና የዙር ጊዜ' : 'Category and round time'}</h2>
        <div className={styles.field}>
          <label htmlFor="who-category">{am ? 'ምድብ' : 'Category'}</label>
          <select id="who-category" value={category} onChange={(event) => setCategory(event.target.value)}>
            <option value="all">{am ? 'ሁሉም' : 'All cards'} ({cards.length})</option>
            {categories.map((item) => <option key={item.id} value={item.id}>{categoryLabel(item.id, locale)} ({item.count})</option>)}
          </select>
        </div>
        <div className={styles.choiceRow}>{[60, 90, 120].map((item) => <button key={item} type="button" aria-pressed={duration === item} onClick={() => setDuration(item)}>{item}s</button>)}</div>
        <p>{am ? 'ካርዱን ሌሎች ይግለጹ፤ ስሙን አይናገሩ።' : 'Hold up the card. Other players describe it without saying the name.'}</p>
        <p>{am ? `በእያንዳንዱ ዙር ካርዶቹ በዘፈቀደ ይደረደራሉ፤ ካርድ በአንድ ዙር አይደገምም።` : `Cards are shuffled every round, unseen ones first, and no card repeats within a round (${available} available here).`}</p>
        <div className={styles.actions}>
          <button className={styles.action} type="button" disabled={!available} onClick={start}>{am ? 'ይጀምሩ' : 'Start round'}</button>
          <button className={styles.secondary} type="button" onClick={() => void requestMotion()}>{motion ? 'Tilt enabled' : 'Enable optional tilt'}</button>
        </div>
      </section>
    )
  }
  if (finished) {
    return (
      <section className={`${styles.panel} ${styles.results}`}>
        <p>🎉</p><h2>{am ? 'ዙሩ ተጠናቋል' : 'Round complete'}</h2>
        <p className={styles.score}>{correct}</p>
        <p>{am ? `ያለፉ፦ ${skipped}` : `Skipped: ${skipped}`}</p>
        {shown.length >= order.length && order.length > 0 ? <p role="note">{am ? 'በዚህ ምድብ ያሉትን ሁሉንም ካርዶች አይተዋል።' : 'You went through every card in this category.'}</p> : null}
        <div className={styles.actions}>
          <button className={styles.action} type="button" disabled={!available} onClick={start}>{am ? 'እንደገና' : 'Play again'}</button>
          <Link className={styles.secondary} to="/play">Game center</Link>
        </div>
        <div className={styles.review}>
          {shown.map((item) => (
            <article key={item.id}>
              <strong>{localized(item.answer, cardLocale(item.verifiedLocales, locale, preview)).text}</strong>
              <p>{localized(item.explanation, cardLocale(item.verifiedLocales, locale, preview)).text}</p>
              <SourceLink source={item.source} locale={locale} />
            </article>
          ))}
        </div>
      </section>
    )
  }
  const card = order[Math.min(index, order.length - 1)]
  if (!card) return <p role="status">{am ? 'በዚህ ምድብ ካርዶች የሉም።' : 'No cards in this category.'} <button type="button" onClick={() => { setCategory('all'); setActive(false) }}>{am ? 'ሁሉም ካርዶች' : 'All cards'}</button></p>
  return (
    <section className={`${styles.panel} ${styles.results}`} aria-live="polite">
      {!preview && !card.verifiedLocales.includes(locale) && <VerifiedFallback locale={locale} />}
      {preview && <button type="button" className={styles.secondary} onClick={() => finish()}>{am ? 'የሙከራውን ዙር ጨርስ' : 'End test round'}</button>}
      <p><strong>{seconds}s</strong> · ✓ {correct} · ↷ {skipped} · {Math.min(index + 1, order.length)}/{order.length}</p>
      <div className={styles.questionCard}>
        <p>{am ? 'እኔ ማን ነኝ?' : 'Who am I?'}</p>
        <p className={styles.score}>{localized(card.answer, cardLocale(card.verifiedLocales, locale, preview)).text}</p>
        <p>{am ? 'ሌሎች ተጫዋቾች ፍንጭ ይስጡ' : 'Other players give clues'}</p>
      </div>
      <div className={styles.actions}>
        <button className={styles.secondary} type="button" onClick={() => mark(false)}>← {am ? 'እለፍ' : 'Skip'}</button>
        <button className={styles.action} type="button" onClick={() => mark(true)}>{am ? 'ትክክል' : 'Correct'} →</button>
      </div>
      <p>{am ? 'ቁልፍ፦ ← እለፍ · →/Space ትክክል' : 'Keyboard: ← skip · → or Space correct'}</p>
    </section>
  )
}
