import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import type { AppLocale } from '../../lib/i18n/locale'
import { useAuth } from '../../lib/auth/useAuth'
import { MATCH_PAIRS } from '../../lib/play/approvedContent'
import { recordPlayCompletion } from '../../lib/play/progress'
import { syncPlayCompletion } from '../../lib/play/progressSync'
import { localized, type MatchPair } from '../../lib/play/types'
import { cardLocale } from '../../lib/play/cardContent'
import { VerifiedFallback } from './GameShell'
import styles from './GameShell.module.css'
import matchStyles from './MatchGame.module.css'

type Card = { key: string; pairId: string; side: 'left' | 'right'; text: string }

export function MatchGame({ locale, pairs = MATCH_PAIRS, preview = false }: { locale: AppLocale; pairs?: readonly MatchPair[]; preview?: boolean }) {
  const { user } = useAuth()
  const [size, setSize] = useState(preview && pairs.length < 4 ? pairs.length : 4)
  const [started, setStarted] = useState(false)
  const [selected, setSelected] = useState<string[]>([])
  const [matched, setMatched] = useState<string[]>([])
  const [moves, setMoves] = useState(0)
  const [timed, setTimed] = useState(false)
  const [seconds, setSeconds] = useState(120)
  const cards = useMemo<Card[]>(() => pairs.slice(0, size).flatMap((pair) => [
    { key: `${pair.id}-left`, pairId: pair.id, side: 'left' as const, text: localized(pair.left, cardLocale(pair.verifiedLocales, locale, preview)).text },
    { key: `${pair.id}-right`, pairId: pair.id, side: 'right' as const, text: localized(pair.right, cardLocale(pair.verifiedLocales, locale, preview)).text },
  ]).sort((a, b) => a.key.split('').reverse().join('').localeCompare(b.key.split('').reverse().join(''))), [size, locale, pairs, preview])

  useEffect(() => {
    if (!started || !timed || matched.length === size || seconds <= 0) return
    const timer = window.setTimeout(() => setSeconds((value) => value - 1), 1000)
    return () => window.clearTimeout(timer)
  }, [matched.length, seconds, size, started, timed])

  const choose = (card: Card) => {
    if (selected.includes(card.key) || matched.includes(card.pairId) || selected.length >= 2) return
    const next = [...selected, card.key]
    setSelected(next)
    if (next.length === 2) {
      setMoves((value) => value + 1)
      const first = cards.find((item) => item.key === next[0])!
      if (first.pairId === card.pairId && first.side !== card.side) {
        const nextMatched = [...matched, card.pairId]
        setMatched(nextMatched); setSelected([])
        if (nextMatched.length === size && !preview) {
          const saved = recordPlayCompletion({ game: 'match', score: size, maxScore: size, category: 'Match & Discover' })
          void syncPlayCompletion(user, { game: 'match', score: size, maxScore: size, category: 'Match & Discover', progress: saved.progress }).catch(() => undefined)
        }
      } else window.setTimeout(() => setSelected([]), 650)
    }
  }

  if (!started) return <section className={styles.panel}><h2>{locale === 'am' ? 'የሰሌዳ መጠን' : 'Board size'}</h2><div className={styles.choiceRow}>{(preview && pairs.length < 4 ? [pairs.length] : [4, 6, 8]).map((item) => <button key={item} type="button" aria-pressed={size === item} disabled={item > pairs.length || item < 1} onClick={() => setSize(item)}>{item} {locale === 'am' ? 'ጥንድ' : 'pairs'}</button>)}</div><h3>{locale === 'am' ? 'ሰዓት ቆጣሪ' : 'Optional timer'}</h3><div className={styles.choiceRow}><button type="button" aria-pressed={!timed} onClick={() => setTimed(false)}>{locale === 'am' ? 'የለም' : 'Off'}</button><button type="button" aria-pressed={timed} onClick={() => setTimed(true)}>2 min</button></div><div className={styles.actions}><button className={styles.action} type="button" disabled={size < 1 || pairs.length < size} onClick={() => { setSeconds(120); setStarted(true) }}>{locale === 'am' ? 'ይጀምሩ' : 'Start matching'}</button></div></section>
  if (timed && seconds <= 0 && matched.length < size) return <section className={`${styles.panel} ${styles.results}`}><h2>{locale === 'am' ? 'ጊዜው አልቋል' : 'Time is up'}</h2><p>{locale === 'am' ? `${matched.length} ጥንዶች አግኝተዋል።` : `You found ${matched.length} of ${size} pairs.`}</p><button className={styles.action} type="button" onClick={() => { setStarted(false); setMatched([]); setSelected([]); setMoves(0) }}>{locale === 'am' ? 'እንደገና' : 'Try again'}</button></section>
  const complete = matched.length === size
  return <section className={styles.panel}>{!preview && pairs.slice(0, size).some(pair => !pair.verifiedLocales.includes(locale)) && <VerifiedFallback locale={locale} />}<div className={matchStyles.heading}><h2>{complete ? (locale === 'am' ? 'ተጠናቋል!' : 'Discovered!') : (locale === 'am' ? 'ጥንዶቹን ያግኙ' : 'Find the pairs')}</h2><strong>{moves} {locale === 'am' ? 'ሙከራ' : 'moves'}{timed ? ` · ${seconds}s` : ''}</strong></div><div className={matchStyles.grid}>{cards.map((card) => { const shown = selected.includes(card.key) || matched.includes(card.pairId); return <button key={card.key} type="button" aria-pressed={shown} className={shown ? matchStyles.open : ''} disabled={matched.includes(card.pairId)} onClick={() => choose(card)}><span>{shown ? card.text : '✦'}</span></button> })}</div>{complete ? <div className={styles.review}>{pairs.slice(0, size).map((pair) => <article key={pair.id}><strong>{localized(pair.left, cardLocale(pair.verifiedLocales, locale, preview)).text} ↔ {localized(pair.right, cardLocale(pair.verifiedLocales, locale, preview)).text}</strong><p>{localized(pair.explanation, cardLocale(pair.verifiedLocales, locale, preview)).text}</p><Link to={pair.source.route}>{pair.source.label}</Link></article>)}<div className={styles.actions}><button className={styles.action} type="button" onClick={() => { setStarted(false); setMatched([]); setSelected([]); setMoves(0) }}>{locale === 'am' ? 'እንደገና' : 'Play again'}</button></div></div> : null}</section>
}
