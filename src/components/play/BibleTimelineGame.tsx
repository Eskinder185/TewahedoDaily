import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import type { AppLocale } from '../../lib/i18n/locale'
import { useAuth } from '../../lib/auth/useAuth'
import {
  buildTimelineBank,
  gradeOrder,
  isCorrectOrder,
  scrambledOrder,
  timelineText,
  TL_SIZE,
  type TlDifficulty,
  type TlRound,
} from '../../lib/play/bibleTimeline'
import { loadSeen, markSeen, resetSeen, selectUnseen } from '../../lib/play/questionHistory'
import { recordPlayCompletion } from '../../lib/play/progress'
import { syncPlayCompletion } from '../../lib/play/progressSync'
import { Celebration } from './Celebration'
import { GameHint } from './GameHint'
import { GameProgress } from './GameProgress'
import g from './PlayGames.module.css'

const GAME = 'bible-timeline'
const ROUNDS = 4

const LEVELS: { key: TlDifficulty; en: string; am: string; hint: { en: string; am: string } }[] = [
  { key: 'easy', en: 'Easy', am: 'ቀላል', hint: { en: '3–4 events', am: '3–4 ክስተቶች' } },
  { key: 'medium', en: 'Medium', am: 'መካከለኛ', hint: { en: '5–6 events', am: '5–6 ክስተቶች' } },
  { key: 'hard', en: 'Hard', am: 'ከባድ', hint: { en: '7–8 events', am: '7–8 ክስተቶች' } },
]

export function BibleTimelineGame({ locale }: { locale: AppLocale }) {
  const { user } = useAuth()
  const am = locale === 'am'
  const [difficulty, setDifficulty] = useState<TlDifficulty>('easy')
  const [rounds, setRounds] = useState<TlRound[] | null>(null)
  const [index, setIndex] = useState(0)
  const [order, setOrder] = useState<string[]>([])
  const [checked, setChecked] = useState(false)
  const [scores, setScores] = useState<boolean[]>([])
  const [result, setResult] = useState<{ score: number; max: number; xp: number } | null>(null)
  const [exhausted, setExhausted] = useState(false)
  const [announce, setAnnounce] = useState('')
  const [dragId, setDragId] = useState<string | null>(null)
  const [dragOverId, setDragOverId] = useState<string | null>(null)
  const [hintRevealed, setHintRevealed] = useState(false)
  const [focusId, setFocusId] = useState<string | null>(null)
  const listRef = useRef<HTMLOListElement>(null)
  const sessionSeen = useRef(new Set<string>())

  const bank = useMemo(() => buildTimelineBank(difficulty), [difficulty])
  const round = rounds?.[index]
  const byId = useMemo(() => new Map((round?.events ?? []).map((ev) => [ev.id, ev])), [round])

  const begin = useCallback((freshStart = false) => {
    if (freshStart) { resetSeen(GAME); sessionSeen.current.clear() }
    const persisted = loadSeen(GAME)
    // Never repeat a round inside this session, even when the bank runs low.
    const seen = { has: (id: string) => persisted.has(id) || sessionSeen.current.has(id) }
    const sel = selectUnseen(bank.filter((r) => !sessionSeen.current.has(r.id)), (r) => r.id, seen, ROUNDS)
    sel.picked.forEach((r) => sessionSeen.current.add(r.id))
    setRounds(sel.picked)
    setExhausted(sel.exhausted && !freshStart)
    setIndex(0); setScores([]); setChecked(false); setResult(null); setHintRevealed(false)
    if (sel.picked[0]) setOrder(scrambledOrder(sel.picked[0]))
  }, [bank])

  useEffect(() => {
    if (!focusId) return
    listRef.current?.querySelector<HTMLElement>(`[data-move="${focusId}"]`)?.focus()
  }, [focusId, order])

  const move = (id: string, delta: -1 | 1) => {
    const from = order.indexOf(id)
    const to = from + delta
    if (checked || from < 0 || to < 0 || to >= order.length) return
    const next = [...order]
    ;[next[from], next[to]] = [next[to], next[from]]
    setOrder(next)
    setFocusId(`${id}:${delta === -1 ? 'up' : 'down'}`)
    const ev = byId.get(id)
    setAnnounce(`${ev ? timelineText(ev.title, locale) : ''}: ${am ? 'ቦታ' : 'position'} ${to + 1} / ${order.length}`)
  }

  // Pointer-based drag so mouse and touch share one code path.
  const startDrag = (id: string, e: React.PointerEvent) => {
    if (checked) return
    e.preventDefault()
    setDragId(id)
    const onMove = (ev: PointerEvent) => {
      const el = document.elementFromPoint(ev.clientX, ev.clientY)?.closest<HTMLElement>('[data-tl-id]')
      const overId = el?.dataset.tlId
      setDragOverId(overId && overId !== id ? overId : null)
      if (!overId || overId === id) return
      setOrder((cur) => {
        const from = cur.indexOf(id)
        const to = cur.indexOf(overId)
        if (from < 0 || to < 0 || from === to) return cur
        const next = [...cur]
        next.splice(from, 1)
        next.splice(to, 0, id)
        return next
      })
    }
    const end = () => {
      window.removeEventListener('pointermove', onMove)
      window.removeEventListener('pointerup', end)
      window.removeEventListener('pointercancel', end)
      setDragId(null)
      setDragOverId(null)
    }
    window.addEventListener('pointermove', onMove)
    window.addEventListener('pointerup', end)
    window.addEventListener('pointercancel', end)
  }

  const check = () => {
    if (!round) return
    const correct = isCorrectOrder(round, order)
    setChecked(true)
    setScores((s) => [...s, correct])
    setAnnounce(correct ? (am ? 'ትክክል! ቅደም ተከተሉ ትክክል ነው።' : 'Correct! The order is right.') : (am ? 'ገና አይደለም። ትክክለኛው ቅደም ተከተል ታይቷል።' : 'Not quite. The correct order is shown.'))
  }

  const next = () => {
    if (!rounds) return
    if (index < rounds.length - 1) {
      const n = index + 1
      setIndex(n); setChecked(false); setOrder(scrambledOrder(rounds[n]))
      setHintRevealed(false)
      return
    }
    const right = scores.filter(Boolean).length
    markSeen(GAME, rounds.map((r) => r.id))
    const saved = recordPlayCompletion({ game: GAME, score: right, maxScore: rounds.length, category: 'Bible timeline' })
    void syncPlayCompletion(user, { game: GAME, score: right, maxScore: rounds.length, category: GAME, progress: saved.progress }).catch(() => undefined)
    setResult({ score: right, max: rounds.length, xp: saved.xpEarned })
  }

  // ---------- setup ----------
  if (!rounds) {
    return (
      <section className={g.setup} aria-labelledby="tl-setup">
        <div className={g.setupBody}>
          <h2 id="tl-setup">{am ? 'ዙርዎን ይምረጡ' : 'Set up your round'}</h2>
          <p className={g.setupNote}>{am ? 'የመጽሐፍ ቅዱስ ክስተቶችን በተፈጸሙበት ቅደም ተከተል ያስቀምጡ። ያዩዋቸው ዙሮች አይደገሙም።' : 'Put Bible events in the order they happened. You won’t see the same round twice.'}</p>
          <fieldset className={g.optionGroup}>
            <legend>{am ? 'ደረጃ' : 'Challenge'}</legend>
            <div className={g.pills}>
              {LEVELS.map((l) => <button key={l.key} type="button" aria-pressed={difficulty === l.key} onClick={() => setDifficulty(l.key)}>{l[locale]} · {l.hint[locale]}</button>)}
            </div>
          </fieldset>
          <button className={g.primary} type="button" disabled={bank.length === 0} onClick={() => begin(false)}>{am ? 'ይጀምሩ' : 'Start'}</button>
        </div>
      </section>
    )
  }

  // ---------- results ----------
  if (result) {
    const ratio = result.max ? result.score / result.max : 0
    return (
      <section className={g.results} aria-labelledby="tl-results">
        {ratio >= 0.6 ? <Celebration /> : null}
        <p className={g.kicker}>{am ? 'ዙሩ ተጠናቋል' : 'Session complete'}</p>
        <h2 id="tl-results">{ratio === 1 ? (am ? 'ፍጹም!' : 'Perfect timeline!') : ratio >= 0.6 ? (am ? 'በጣም ጥሩ!' : 'Well ordered!') : (am ? 'ጥሩ ልምምድ!' : 'Good practice!')}</h2>
        <div className={g.scoreRow}>
          <div><strong>{result.score}/{result.max}</strong><span>{am ? 'ትክክል' : 'rounds right'}</span></div>
          <div><strong>+{result.xp}</strong><span>XP</span></div>
        </div>
        <div className={g.actions}>
          <button className={g.primary} type="button" onClick={() => begin(false)}>{am ? 'አዲስ ዙሮች' : 'Fresh rounds'}</button>
          <button className={g.secondary} type="button" onClick={() => setRounds(null)}>{am ? 'ደረጃ ይቀይሩ' : 'Change level'}</button>
          <Link className={g.secondary} to="/play">{am ? 'ወደ ጨዋታ ማዕከል' : 'All games'}</Link>
        </div>
        {exhausted ? <p className={g.setupNote} style={{ marginTop: '1rem' }}>{am ? 'በዚህ ደረጃ ያሉትን ዙሮች ሁሉ አይተዋል።' : 'You’ve seen every round at this level.'} <button className={g.secondary} type="button" onClick={() => begin(true)} style={{ marginLeft: '0.5rem' }}>{am ? 'እንደገና ይለማመዱ' : 'Practice again'}</button></p> : null}
      </section>
    )
  }

  // ---------- play ----------
  const r = round!
  const grade = checked ? gradeOrder(r, order) : []
  const correct = checked && scores[index]
  const showAm = am && r.events.some((ev) => !ev.title.am)

  return (
    <section className={g.board} aria-labelledby="tl-q">
      <div className={g.hud}>
      <GameProgress locale={locale} current={index + 1} total={rounds.length} label={am ? 'ዙር' : 'Round'} />
      <ol className={g.dots} aria-label={am ? `ዙር ${index + 1} ከ ${rounds.length}` : `Round ${index + 1} of ${rounds.length}`}>
          {rounds.map((x, i) => <li key={x.id} className={i < scores.length ? (scores[i] ? g.dotRight : g.dotWrong) : i === index ? g.dotNow : ''} />)}
        </ol>
        <div className={g.hudStats}>
          <span><strong>{index + 1}</strong>/{rounds.length}</span>
          <span>{LEVELS.find((l) => l.key === difficulty)![locale]} · {r.events.length}/{TL_SIZE[difficulty].max}</span>
        </div>
      </div>

      <article className={g.tlCard}>
        <p className={g.lyricFrom}>{timelineText(r.chainTitle, locale)}</p>
        <h2 id="tl-q" className={g.tlPrompt}>{am ? 'ከመጀመሪያ እስከ መጨረሻ ያስቀምጡ' : 'Arrange from earliest to latest'}</h2>
        <p className={g.setupNote}>{am ? 'ካርዱን ይጎትቱ ወይም ቀስቶቹን ይጠቀሙ።' : 'Drag a card by its handle, or use the up and down buttons.'}</p>
        <GameHint locale={locale} revealed={hintRevealed} onReveal={() => setHintRevealed(true)}>
          {am ? 'የመጀመሪያው ክስተት በካርዶቹ መጀመሪያ መሆን አለበት።' : `The earliest event is “${timelineText(r.events[0].title, locale)}”.`}
        </GameHint>
        {showAm ? <p className={g.setupNote}>Amharic wording is not available for every event; English is shown for those.</p> : null}

        <ol className={g.tlList} ref={listRef}>
          {order.map((id, pos) => {
            const ev = byId.get(id)!
            const state = !checked ? '' : grade[pos] ? g.tlRight : g.tlWrong
            return (
              <li key={id} data-tl-id={id} className={`${g.tlItem} ${state} ${dragId === id ? g.tlDragging : ''} ${dragOverId === id ? g.tlDropTarget : ''}`}>
                <span className={g.tlNum} aria-hidden="true">{pos + 1}</span>
                <span className={g.tlText} lang={am && ev.title.am ? 'am' : 'en'}>{timelineText(ev.title, locale)}</span>
                {checked ? <span className={g.tlMark} aria-label={grade[pos] ? (am ? 'ትክክል' : 'correct position') : (am ? 'ትክክል አይደለም' : 'wrong position')}>{grade[pos] ? '✓' : '✕'}</span> : (
                  <span className={g.tlControls}>
                    <button type="button" className={g.tlBtn} data-move={`${id}:up`} disabled={pos === 0} onClick={() => move(id, -1)}
                      aria-label={`${am ? 'ወደ ላይ አንቀሳቅስ' : 'Move up'}: ${timelineText(ev.title, locale)}`}>↑</button>
                    <button type="button" className={g.tlBtn} data-move={`${id}:down`} disabled={pos === order.length - 1} onClick={() => move(id, 1)}
                      aria-label={`${am ? 'ወደ ታች አንቀሳቅስ' : 'Move down'}: ${timelineText(ev.title, locale)}`}>↓</button>
                    <span className={g.tlGrip} role="presentation" onPointerDown={(e) => startDrag(id, e)} aria-hidden="true">⠿</span>
                  </span>
                )}
              </li>
            )
          })}
        </ol>

        <p className={g.srOnly} role="status" aria-live="polite">{announce}</p>

        {!checked ? (
          <div className={g.actions} style={{ justifyContent: 'flex-start' }}>
            <button className={g.primary} type="button" onClick={check}>{am ? 'አረጋግጥ' : 'Check order'}</button>
          </div>
        ) : (
          <div className={`${g.feedback} ${correct ? g.feedbackRight : g.feedbackWrong}`}>
            <p className={g.feedbackTitle}>{correct ? (am ? 'ትክክል!' : 'Correct!') : (am ? 'ትክክለኛው ቅደም ተከተል፦' : 'The correct order:')}</p>
            <ol className={g.tlReview}>
              {r.events.map((ev) => (
                <li key={ev.id}>
                  <strong lang={am && ev.title.am ? 'am' : 'en'}>{timelineText(ev.title, locale)}</strong>
                  <span>{ev.note}</span>
                  <Link className={g.sourceLink} to={ev.route}>{ev.ref} →</Link>
                </li>
              ))}
            </ol>
            <button className={g.primary} type="button" autoFocus onClick={next}>
              {index === rounds.length - 1 ? (am ? 'ውጤቱን ይመልከቱ' : 'See results') : (am ? 'ቀጣይ' : 'Next')} →
            </button>
          </div>
        )}
      </article>
    </section>
  )
}
