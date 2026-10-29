import { useCallback, useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import type { AppLocale } from '../../lib/i18n/locale'
import { useAuth } from '../../lib/auth/useAuth'
import { WHO_AM_I_CARDS } from '../../lib/play/approvedContent'
import { recordPlayCompletion } from '../../lib/play/progress'
import { syncPlayCompletion } from '../../lib/play/progressSync'
import { localized } from '../../lib/play/types'
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

export function WhoAmIGame({ locale }: { locale: AppLocale }) {
  const { user } = useAuth()
  const [duration, setDuration] = useState(60)
  const [active, setActive] = useState(false)
  const [seconds, setSeconds] = useState(60)
  const [index, setIndex] = useState(0)
  const [correct, setCorrect] = useState(0)
  const [skipped, setSkipped] = useState(0)
  const [finished, setFinished] = useState(false)
  const [motion, setMotion] = useState(false)
  const [category, setCategory] = useState<'all' | 'biblical-people' | 'biblical-locations'>('all')
  const deck = WHO_AM_I_CARDS.filter((card) => category === 'all' || card.category === category)

  const finish = useCallback(() => {
    playTone(660, 0.16)
    setActive(false); setFinished(true)
    const saved = recordPlayCompletion({ game: 'who-am-i', score: correct, maxScore: Math.max(1, correct + skipped), category: 'Who Am I' })
    void syncPlayCompletion(user, { game: 'who-am-i', score: correct, maxScore: Math.max(1, correct + skipped), category: 'Who Am I', progress: saved.progress }).catch(() => undefined)
  }, [correct, skipped, user])
  const mark = useCallback((isCorrect: boolean) => {
    if (!active) return
    playTone(isCorrect ? 520 : 210)
    if (isCorrect) setCorrect((value) => value + 1); else setSkipped((value) => value + 1)
    setIndex((value) => (value + 1) % deck.length)
  }, [active, deck.length])
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
  const start = () => { setSeconds(duration); setIndex(0); setCorrect(0); setSkipped(0); setFinished(false); setActive(true) }
  const requestMotion = async () => {
    const orientation = DeviceOrientationEvent as typeof DeviceOrientationEvent & { requestPermission?: () => Promise<string> }
    if (orientation.requestPermission) {
      const result = await orientation.requestPermission()
      setMotion(result === 'granted')
    } else setMotion(true)
  }

  if (!active && !finished) return <section className={styles.panel}><h2>{locale === 'am' ? 'ምድብና የዙር ጊዜ' : 'Category and round time'}</h2><div className={styles.field}><label htmlFor="who-category">{locale === 'am' ? 'ምድብ' : 'Category'}</label><select id="who-category" value={category} onChange={(event) => setCategory(event.target.value as typeof category)}><option value="all">{locale === 'am' ? 'ሁሉም' : 'All cards'}</option><option value="biblical-people">{locale === 'am' ? 'የመጽሐፍ ቅዱስ ሰዎች' : 'Biblical people'}</option><option value="biblical-locations">{locale === 'am' ? 'የመጽሐፍ ቅዱስ ቦታዎች' : 'Biblical locations'}</option></select></div><div className={styles.choiceRow}>{[60, 90, 120].map((item) => <button key={item} type="button" aria-pressed={duration === item} onClick={() => setDuration(item)}>{item}s</button>)}</div><p>{locale === 'am' ? 'ካርዱን ሌሎች ይግለጹ፤ ስሙን አይናገሩ።' : 'Hold up the card. Other players describe it without saying the name.'}</p><div className={styles.actions}><button className={styles.action} type="button" onClick={start}>{locale === 'am' ? 'ይጀምሩ' : 'Start round'}</button><button className={styles.secondary} type="button" onClick={() => void requestMotion()}>{motion ? 'Tilt enabled' : 'Enable optional tilt'}</button></div></section>
  if (finished) return <section className={`${styles.panel} ${styles.results}`}><p>🎉</p><h2>{locale === 'am' ? 'ዙሩ ተጠናቋል' : 'Round complete'}</h2><p className={styles.score}>{correct}</p><p>{locale === 'am' ? `ያለፉ፦ ${skipped}` : `Skipped: ${skipped}`}</p><div className={styles.actions}><button className={styles.action} type="button" onClick={start}>{locale === 'am' ? 'እንደገና' : 'Play again'}</button><Link className={styles.secondary} to="/play">Game center</Link></div><div className={styles.review}>{deck.map((item) => <article key={item.id}><strong>{localized(item.answer, locale).text}</strong><p>{localized(item.explanation, locale).text}</p><Link to={item.source.route}>{item.source.label}</Link></article>)}</div></section>
  const card = deck[index % deck.length]
  return <section className={`${styles.panel} ${styles.results}`} aria-live="polite"><p><strong>{seconds}s</strong> · ✓ {correct} · ↷ {skipped}</p><div className={styles.questionCard}><p>{locale === 'am' ? 'እኔ ማን ነኝ?' : 'Who am I?'}</p><p className={styles.score}>{localized(card.answer, locale).text}</p><p>{locale === 'am' ? 'ሌሎች ተጫዋቾች ፍንጭ ይስጡ' : 'Other players give clues'}</p></div><div className={styles.actions}><button className={styles.secondary} type="button" onClick={() => mark(false)}>← {locale === 'am' ? 'እለፍ' : 'Skip'}</button><button className={styles.action} type="button" onClick={() => mark(true)}>{locale === 'am' ? 'ትክክል' : 'Correct'} →</button></div><p>{locale === 'am' ? 'ቁልፍ፦ ← እለፍ · →/Space ትክክል' : 'Keyboard: ← skip · → or Space correct'}</p></section>
}
