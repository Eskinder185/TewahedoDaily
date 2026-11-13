import { useEffect, useMemo, useState } from 'react'
import type { AppLocale } from '../../lib/i18n/locale'
import { useAuth } from '../../lib/auth/useAuth'
import { MATCH_PAIRS } from '../../lib/play/approvedContent'
import { recordPlayCompletion } from '../../lib/play/progress'
import { syncPlayCompletion } from '../../lib/play/progressSync'
import { localized, type MatchPair } from '../../lib/play/types'
import { cardLocale } from '../../lib/play/cardContent'
import { pickBoard } from '../../lib/play/matchBoard'
import { loadSeen, markSeen } from '../../lib/play/questionHistory'
import { newSeed, seededRandom, shuffled } from '../../lib/play/sessionRandom'
import { SourceLink } from './SourceLink'
import { VerifiedFallback } from './GameShell'
import styles from './GameShell.module.css'
import matchStyles from './MatchGame.module.css'

type Card = { key: string; pairId: string; side: 'left' | 'right'; text: string }

export function MatchGame({ locale, pairs = MATCH_PAIRS, preview = false }: { locale: AppLocale; pairs?: readonly MatchPair[]; preview?: boolean }) {
  const { user } = useAuth()
  const [size, setSize] = useState(preview && pairs.length < 4 ? pairs.length : 4)
  const [started, setStarted] = useState(false)
  const [board, setBoard] = useState<MatchPair[]>([])
  const [layoutSeed, setLayoutSeed] = useState(1)
  const [selected, setSelected] = useState<string[]>([])
  const [matched, setMatched] = useState<string[]>([])
  const [moves, setMoves] = useState(0)
  const [timed, setTimed] = useState(false)
  const [seconds, setSeconds] = useState(120)
  const total = board.length
  const am = locale === 'am'

  // Card positions come from the round's own seed, so they stay put across re-renders but differ every round.
  const cards = useMemo<Card[]>(() => shuffled(board.flatMap((pair) => [
    { key: `${pair.id}-left`, pairId: pair.id, side: 'left' as const, text: localized(pair.left, cardLocale(pair.verifiedLocales, locale, preview)).text },
    { key: `${pair.id}-right`, pairId: pair.id, side: 'right' as const, text: localized(pair.right, cardLocale(pair.verifiedLocales, locale, preview)).text },
  ]), seededRandom(layoutSeed)), [board, layoutSeed, locale, preview])

  useEffect(() => {
    if (!started || !timed || matched.length === total || seconds <= 0) return
    const timer = window.setTimeout(() => setSeconds((value) => value - 1), 1000)
    return () => window.clearTimeout(timer)
  }, [matched.length, seconds, total, started, timed])

  const begin = () => {
    // Draw from the whole pool, unseen pairs first, with no two identical labels on one board.
    const next = pickBoard(pairs, size, locale, loadSeen('match'))
    if (!next.length) return
    if (!preview) markSeen('match', next.map((pair) => pair.id))
    setBoard(next); setLayoutSeed(newSeed()); setMatched([]); setSelected([]); setMoves(0); setSeconds(120); setStarted(true)
  }
  const reset = () => { setStarted(false); setBoard([]); setMatched([]); setSelected([]); setMoves(0) }

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
        if (nextMatched.length === total && !preview) {
          const saved = recordPlayCompletion({ game: 'match', score: total, maxScore: total, category: 'Match & Discover' })
          void syncPlayCompletion(user, { game: 'match', score: total, maxScore: total, category: 'Match & Discover', progress: saved.progress }).catch(() => undefined)
        }
      } else window.setTimeout(() => setSelected([]), 650)
    }
  }

  if (!started) {
    const options = preview && pairs.length < 4 ? [pairs.length] : [4, 6, 8]
    return (
      <section className={styles.panel}>
        <h2>{am ? 'የሰሌዳ መጠን' : 'Board size'}</h2>
        <div className={styles.choiceRow}>{options.map((item) => <button key={item} type="button" aria-pressed={size === item} disabled={item > pairs.length || item < 1} onClick={() => setSize(item)}>{item} {am ? 'ጥንድ' : 'pairs'}</button>)}</div>
        <h3>{am ? 'ሰዓት ቆጣሪ' : 'Optional timer'}</h3>
        <div className={styles.choiceRow}><button type="button" aria-pressed={!timed} onClick={() => setTimed(false)}>{am ? 'የለም' : 'Off'}</button><button type="button" aria-pressed={timed} onClick={() => setTimed(true)}>2 min</button></div>
        <p className={matchStyles.poolNote}>{am ? `ከ${pairs.length} ጥንዶች ውስጥ በእያንዳንዱ ዙር የተለያዩ ይመረጣሉ።` : `Each round draws a fresh set from ${pairs.length} pairs.`}</p>
        <div className={styles.actions}><button className={styles.action} type="button" disabled={size < 1 || pairs.length < 1} onClick={begin}>{am ? 'ይጀምሩ' : 'Start matching'}</button></div>
      </section>
    )
  }
  if (timed && seconds <= 0 && matched.length < total) {
    return (
      <section className={`${styles.panel} ${styles.results}`}>
        <h2>{am ? 'ጊዜው አልቋል' : 'Time is up'}</h2>
        <p>{am ? `${matched.length} ጥንዶች አግኝተዋል።` : `You found ${matched.length} of ${total} pairs.`}</p>
        <button className={styles.action} type="button" onClick={reset}>{am ? 'እንደገና' : 'Try again'}</button>
      </section>
    )
  }
  const complete = matched.length === total
  return (
    <section className={styles.panel}>
      {!preview && board.some((pair) => !pair.verifiedLocales.includes(locale)) && <VerifiedFallback locale={locale} />}
      {total < size ? <p className={matchStyles.poolNote} role="note">{am ? `ሰሌዳው ${total} ጥንዶች ብቻ አለው፤ ተመሳሳይ ስም ያላቸው ጥንዶች በአንድ ሰሌዳ አይቀመጡም።` : `This board has ${total} pairs: pairs that share a label are never put on the same board.`}</p> : null}
      <div className={matchStyles.heading}>
        <h2>{complete ? (am ? 'ተጠናቋል!' : 'Discovered!') : (am ? 'ጥንዶቹን ያግኙ' : 'Find the pairs')}</h2>
        <strong>{moves} {am ? 'ሙከራ' : 'moves'}{timed ? ` · ${seconds}s` : ''}</strong>
      </div>
      <div className={matchStyles.grid}>
        {cards.map((card) => {
          const shown = selected.includes(card.key) || matched.includes(card.pairId)
          return <button key={card.key} type="button" aria-pressed={shown} className={shown ? matchStyles.open : ''} disabled={matched.includes(card.pairId)} onClick={() => choose(card)}><span>{shown ? card.text : '✦'}</span></button>
        })}
      </div>
      {complete ? (
        <div className={styles.review}>
          {board.map((pair) => (
            <article key={pair.id}>
              <strong>{localized(pair.left, cardLocale(pair.verifiedLocales, locale, preview)).text} ↔ {localized(pair.right, cardLocale(pair.verifiedLocales, locale, preview)).text}</strong>
              <p>{localized(pair.explanation, cardLocale(pair.verifiedLocales, locale, preview)).text}</p>
              <SourceLink source={pair.source} locale={locale} />
            </article>
          ))}
          <div className={styles.actions}><button className={styles.action} type="button" onClick={reset}>{am ? 'እንደገና' : 'Play again'}</button></div>
        </div>
      ) : null}
    </section>
  )
}
