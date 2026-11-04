import { useEffect, useMemo, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import type { AppLocale } from '../../lib/i18n/locale'
import { useAuth } from '../../lib/auth/useAuth'
import { handlePlayImageError, PLAY_IMAGES, type PlayImage } from '../../lib/play/imageCatalog'
import { recordPlayCompletion } from '../../lib/play/progress'
import { syncPlayCompletion } from '../../lib/play/progressSync'
import { localized } from '../../lib/play/types'
import { Celebration } from './Celebration'
import { GameProgress } from './GameProgress'
import g from './PlayGames.module.css'
import m from './IconMemory.module.css'

type Card = { key: string; id: string; face: 'picture' | 'name'; item: PlayImage }

function shuffle<T>(items: T[]): T[] {
  const a = [...items]
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[a[i], a[j]] = [a[j], a[i]]
  }
  return a
}

/** Visual memory: match each holy picture to its name. */
export function IconMemoryGame({ locale, pool = PLAY_IMAGES }: { locale: AppLocale; pool?: PlayImage[] }) {
  const { user } = useAuth()
  const am = locale === 'am'
  const [pairs, setPairs] = useState(Math.min(6, pool.length))
  const [deal, setDeal] = useState(0)
  const [started, setStarted] = useState(false)
  const [open, setOpen] = useState<string[]>([])
  const [matched, setMatched] = useState<string[]>([])
  const [moves, setMoves] = useState(0)
  const [saved, setSaved] = useState<number | null>(null)
  const [announce, setAnnounce] = useState('')

  const cards = useMemo<Card[]>(() => {
    void deal
    const items = shuffle(pool).slice(0, pairs)
    return shuffle(items.flatMap((item) => [
      { key: `${item.id}-p`, id: item.id, face: 'picture' as const, item },
      { key: `${item.id}-n`, id: item.id, face: 'name' as const, item },
    ]))
  }, [pairs, deal, pool])

  const done = matched.length === pairs

  useEffect(() => {
    if (!started || !done || saved !== null) return
    const score = Math.max(1, Math.round((pairs / Math.max(pairs, moves)) * pairs))
    const result = recordPlayCompletion({ game: 'icon-memory', score, maxScore: pairs, category: 'Icons & feasts' })
    void syncPlayCompletion(user, { game: 'icon-memory', score, maxScore: pairs, category: 'icon-memory', progress: result.progress }).catch(() => undefined)
    queueMicrotask(() => setSaved(result.xpEarned))
  }, [done, moves, pairs, saved, started, user])

  // Focus the title when a deal starts or the game completes (the clicked card / button is gone or disabled).
  const headingRef = useRef<HTMLHeadingElement>(null)
  const prevFocus = useRef({ deal, done })
  useEffect(() => {
    const prev = prevFocus.current
    if (prev.deal === deal && prev.done === done) return
    prevFocus.current = { deal, done }
    if (started) headingRef.current?.focus()
  }, [deal, done, started])

  const reset = (again: boolean) => {
    setDeal((d) => d + 1); setOpen([]); setMatched([]); setMoves(0); setSaved(null); setStarted(again); setAnnounce('')
  }

  const matchPrefix = am ? 'ተዛመደ፦' : 'Match:'
  const noMatchText = am ? 'አልተዛመደም' : 'Not a match'

  const flip = (card: Card) => {
    if (open.length === 2 || open.includes(card.key) || matched.includes(card.id)) return
    const next = [...open, card.key]
    setOpen(next)
    if (next.length < 2) { setAnnounce(cardLabel(card)); return }
    setMoves((mv) => mv + 1)
    const first = cards.find((c) => c.key === next[0])!
    if (first.id === card.id && first.face !== card.face) {
      setMatched((mt) => [...mt, card.id])
      setOpen([])
      const total = moves + 1
      setAnnounce(matched.length + 1 === pairs
        ? (am ? `ሁሉም ተዛመዱ፣ ${total} ሙከራ` : `All pairs found in ${total} ${total === 1 ? 'move' : 'moves'}`)
        : `${matchPrefix} ${localized(card.item.answer, locale).text}`)
    } else {
      setAnnounce(noMatchText)
      window.setTimeout(() => setOpen([]), 900)
    }
  }

  const cardLabel = (c: Card) => c.face === 'name' ? localized(c.item.answer, locale).text : c.item.description

  if (!started) {
    return (
      <section className={g.setup} aria-labelledby="mem-setup">
        <div className={g.setupPreview} aria-hidden="true">
          {pool.slice(0, 5).map((p, i) => <img key={p.id} src={p.src} alt="" loading="lazy" onError={(event) => handlePlayImageError(event, p.fallbackSrc)} style={{ ['--i' as string]: i, objectPosition: p.focus }} />)}
        </div>
        <div className={g.setupBody}>
          <h2 id="mem-setup">{am ? 'ሥዕልና ስም ያዛምዱ' : 'Match each picture to its name'}</h2>
          <p className={g.setupNote}>{am ? 'ካርዶችን ይግለጡ፤ እያንዳንዱን የቅዱሳን፣ የመላእክት ወይም የበዓል ሥዕል ከስሙ ጋር ያዛምዱ።' : 'Turn over two cards at a time. Pair every icon of a saint, angel or feast with its name.'}</p>
          <fieldset className={g.optionGroup}>
            <legend>{am ? 'የጥንድ ብዛት' : 'Pairs'}</legend>
            <div className={g.pills}>
              {[4, 6, 8].map((n) => <button key={n} type="button" disabled={n > pool.length} aria-pressed={pairs === n} onClick={() => setPairs(n)}>{n} {am ? 'ጥንድ' : 'pairs'}</button>)}
            </div>
          </fieldset>
          <button className={g.primary} type="button" onClick={() => reset(true)}>{am ? 'ካርዶቹን ያድሉ' : 'Deal the cards'}</button>
        </div>
      </section>
    )
  }

  return (
    <section className={`${g.board} ${am ? m.am : ''}`} aria-labelledby="mem-title">
      {done ? <Celebration /> : null}
      <div className={g.hud}>
        <h2 id="mem-title" className={`${g.hudTitle} ${m.focusTarget}`} ref={headingRef} tabIndex={-1}>{done ? (am ? 'ሁሉም ተዛመዱ!' : 'All pairs found!') : (am ? 'ጥንዶቹን ያግኙ' : 'Find the pairs')}</h2>
        <div className={g.hudStats}>
          <span>{moves} {am ? 'ሙከራ' : moves === 1 ? 'move' : 'moves'}</span>
          {saved !== null ? <span className={g.streak}>+{saved} XP</span> : null}
        </div>
      </div>
      <GameProgress locale={locale} current={matched.length} total={pairs} label={am ? 'የተገኙ ጥንዶች' : 'Pairs found'} valueText={am ? `የተገኙ ጥንዶች ${matched.length} ከ ${pairs}` : `${matched.length} of ${pairs} pairs found`} />
      <p className={g.srOnly} role="status" aria-live="polite" aria-atomic="true">{announce}</p>
      <div className={m.chipRow} aria-hidden="true">
        {announce === noMatchText ? <span className={`${m.chip} ${m.chipWrong}`}><span>✕</span>{noMatchText}</span> : null}
        {announce.startsWith(matchPrefix) ? <span className={`${m.chip} ${m.chipRight}`}><span>✓</span>{announce}</span> : null}
      </div>
      <div className={`${g.memoryGrid} ${pairs > 6 ? g.memoryGridWide : ''}`}>
        {cards.map((c, i) => {
          const shown = open.includes(c.key) || matched.includes(c.id)
          return (
            <button
              key={c.key}
              type="button"
              className={`${g.memoryCard} ${shown ? g.memoryShown : ''} ${matched.includes(c.id) ? g.memoryMatched : ''}`}
              onClick={() => flip(c)}
              disabled={matched.includes(c.id)}
              aria-label={shown ? (matched.includes(c.id) ? `${cardLabel(c)}, ${am ? 'ተዛመደ' : 'matched'}` : cardLabel(c)) : (am ? `ካርድ ${i + 1}፣ የተዘጋ` : `Card ${i + 1}, face down`)}
            >
              <span className={g.memoryInner}>
                <span className={g.memoryBack} aria-hidden="true">✠</span>
                <span className={g.memoryFront} aria-hidden="true">
                  {c.face === 'picture'
                    ? <img src={c.item.src} alt="" loading="lazy" onError={(event) => handlePlayImageError(event, c.item.fallbackSrc)} style={{ objectPosition: c.item.focus }} />
                    : <span className={g.memoryName}><span lang={localized(c.item.answer, locale).fallback ? 'en' : undefined}>{localized(c.item.answer, locale).text}</span>{locale === 'en' && c.item.answer.am ? <small lang="am">{c.item.answer.am}</small> : null}</span>}
                  {matched.includes(c.id) ? <span className={m.mark} aria-hidden="true">✓</span> : null}
                </span>
              </span>
            </button>
          )
        })}
      </div>
      {done ? (
        <div className={g.results}>
          <p className={g.kicker}>{am ? 'ጨዋታው ተጠናቋል' : 'Game complete'}</p>
          <div className={g.scoreRow}>
            <div><strong>{pairs}</strong><span>{am ? 'ጥንድ' : 'Pairs'}</span></div>
            <div><strong>{moves}</strong><span>{am ? 'ሙከራ' : 'Moves'}</span></div>
            <div><strong>{saved !== null ? `+${saved}` : '…'}</strong><span>{am ? 'የተገኘ XP' : 'XP earned'}</span></div>
          </div>
          <div className={g.actions}>
            <button className={g.primary} type="button" onClick={() => reset(true)}>{am ? 'እንደገና ያድሉ' : 'Deal again'}</button>
            <button className={g.secondary} type="button" onClick={() => reset(false)}>{am ? 'የጥንድ ብዛት ይቀይሩ' : 'Change pairs'}</button>
            <Link className={g.secondary} to="/play">{am ? 'ወደ ጨዋታ ማዕከል' : 'All games'}</Link>
          </div>
          <ol className={g.reviewGrid}>
            {cards.filter((c) => c.face === 'picture').map((c) => (
              <li key={c.key} className={g.reviewRight}>
                <img src={c.item.src} alt="" loading="lazy" onError={(event) => handlePlayImageError(event, c.item.fallbackSrc)} style={{ objectPosition: c.item.focus }} />
                <div><strong lang={localized(c.item.answer, locale).fallback ? 'en' : undefined}>{localized(c.item.answer, locale).text}</strong><span lang={localized(c.item.explanation, locale).fallback ? 'en' : undefined}>{localized(c.item.explanation, locale).text}</span><Link to={c.item.source.route}>{c.item.source.label}</Link></div>
              </li>
            ))}
          </ol>
        </div>
      ) : null}
    </section>
  )
}
