import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import type { AppLocale } from '../../lib/i18n/locale'
import { useAuth } from '../../lib/auth/useAuth'
import { handlePlayImageError, MIN_PICTURE_CHOICES, type PlayImage } from '../../lib/play/imageCatalog'
import { recordPlayCompletion, type PlayAchievement } from '../../lib/play/progress'
import { syncPlayCompletion } from '../../lib/play/progressSync'
import { localized } from '../../lib/play/types'
import { Celebration } from './Celebration'
import { GameProgress } from './GameProgress'
import a11y from './AnswerFeedback.module.css'
import g from './PlayGames.module.css'
import { BADGES } from './PlayProgressPanel'
import m from './PictureQuiz.module.css'

type Mode = 'look' | 'reveal'
type Answer = { item: PlayImage; picked: string; correct: boolean; points: number }

const TILES = 12
const START_OPEN = 3

// Amharic strings reused from QuizGame / PlayProgressPanel are existing; 'ትክክል፦', 'ያልተመለሰ፦' are the existing review labels.
function labelsFor(am: boolean) {
  return am
    ? {
        correctAnswer: 'ትክክለኛ መልስ', yourAnswer: 'የእርስዎ መልስ', notQuite: 'ትክክል አይደለም', correctBang: 'ትክክል!', englishOnly: 'በእንግሊዝኛ ብቻ',
        correct: 'ትክክል', xp: 'የተገኘ XP', points: 'ነጥብ', badges: 'ያገኟቸው ምልክቶች', review: 'መልሶችዎን ይከልሱ', explore: 'ጨዋታዎችን ያስሱ',
        missed: 'ያልተመለሰ፦', right: 'ትክክል፦', question: 'ጥያቄ',
      }
    : {
        correctAnswer: 'Correct answer', yourAnswer: 'Your answer', notQuite: 'Not quite', correctBang: 'Correct!', englishOnly: 'English only',
        correct: 'Correct', xp: 'XP earned', points: 'Points', badges: 'Badges earned', review: 'Review your answers', explore: 'Explore games',
        missed: 'Missed:', right: 'Correct:', question: 'Question',
      }
}

function shuffle<T>(items: T[], random = Math.random): T[] {
  const a = [...items]
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(random() * (i + 1))
    ;[a[i], a[j]] = [a[j], a[i]]
  }
  return a
}

/** Four choices: the answer plus three others of the same kind. */
function choicesFor(item: PlayImage, pool: PlayImage[]) {
  return shuffle([item, ...shuffle(pool.filter((p) => p.id !== item.id)).slice(0, 3)])
}

export type PictureQuizConfig = {
  game: 'feasts' | 'saints'
  pool: PlayImage[]
  prompt: { en: string; am: string }
  noun: { en: string; am: string }
}

export function PictureQuizGame({ locale, config }: { locale: AppLocale; config: PictureQuizConfig }) {
  const { user } = useAuth()
  const am = locale === 'am'
  const t = labelsFor(am)
  const [mode, setMode] = useState<Mode>('look')
  const [length, setLength] = useState(Math.min(8, config.pool.length))
  const [round, setRound] = useState<{ item: PlayImage; choices: PlayImage[]; order: number[] }[] | null>(null)
  const [index, setIndex] = useState(0)
  const [picked, setPicked] = useState<string | null>(null)
  const [opened, setOpened] = useState(START_OPEN)
  const [answers, setAnswers] = useState<Answer[]>([])
  const [streak, setStreak] = useState(0)
  const [result, setResult] = useState<{ score: number; max: number; xp: number; badges: PlayAchievement[] } | null>(null)
  const nextRef = useRef<HTMLButtonElement>(null)
  const headingRef = useRef<HTMLHeadingElement>(null)
  const resultsRef = useRef<HTMLHeadingElement>(null)

  const start = useCallback(() => {
    const items = shuffle(config.pool).slice(0, length)
    setRound(items.map((item) => ({ item, choices: choicesFor(item, config.pool), order: shuffle([...Array(TILES).keys()]) })))
    setIndex(0); setPicked(null); setOpened(START_OPEN); setAnswers([]); setStreak(0); setResult(null)
  }, [config.pool, length])

  const current = round?.[index]
  const score = answers.reduce((s, a) => s + a.points, 0)

  useEffect(() => { if (picked) nextRef.current?.focus() }, [picked])
  useEffect(() => { if (round && !picked && !result) headingRef.current?.focus() }, [index, round, picked, result])
  useEffect(() => { if (result) resultsRef.current?.focus() }, [result])

  const choose = (id: string) => {
    if (!current || picked) return
    setPicked(id)
    const correct = id === current.item.id
    const points = correct ? (mode === 'reveal' ? TILES - opened + 1 : 1) : 0
    setAnswers((a) => [...a, { item: current.item, picked: id, correct, points }])
    setStreak((s) => (correct ? s + 1 : 0))
  }

  const next = () => {
    if (!round) return
    if (index < round.length - 1) {
      setIndex((i) => i + 1); setPicked(null); setOpened(START_OPEN)
      return
    }
    const right = answers.filter((a) => a.correct).length
    const saved = recordPlayCompletion({ game: config.game, score: right, maxScore: round.length, category: config.game === 'feasts' ? 'Church feasts' : 'Saints & angels' })
    void syncPlayCompletion(user, { game: config.game, score: right, maxScore: round.length, category: config.game, progress: saved.progress }).catch(() => undefined)
    setResult({ score: right, max: round.length, xp: saved.xpEarned, badges: saved.newAchievements })
  }

  const revealed = useMemo(() => new Set(current?.order.slice(0, picked ? TILES : opened) ?? []), [current, opened, picked])

  // ---------- Not enough pictures ----------
  // A round needs four choices of the same kind; never start one without enough usable, approved pictures.
  if (config.pool.length < MIN_PICTURE_CHOICES) {
    return (
      <section className={g.setup} aria-labelledby="pq-setup">
        <div className={g.setupBody}>
          <h2 id="pq-setup">{am ? "በቂ የተረጋገጡ ሥዕሎች ገና የሉም" : "Not enough pictures yet"}</h2>
          <p className={g.setupNote}>{am ? "ይህ ጨዋታ ዙር ለመስራት ቢያንስ አራት የተረጋገጡ ሥዕሎች ያስፈልገዋል። እባክዎ ቆይተው ይመለሱ።" : "This game needs at least four approved pictures to make a round. Please check back soon."}</p>
          <Link className={g.secondary} to="/play">{t.explore}</Link>
        </div>
      </section>
    )
  }

  // ---------- Setup ----------
  if (!round) {
    return (
      <section className={g.setup} aria-labelledby="pq-setup">
        <div className={g.setupPreview} aria-hidden="true">
          {config.pool.slice(0, 5).map((p, i) => <img key={p.id} src={p.src} alt="" loading="lazy" onError={(event) => handlePlayImageError(event, p.fallbackSrc)} style={{ ['--i' as string]: i, objectPosition: p.focus }} />)}
        </div>
        <div className={g.setupBody}>
          <h2 id="pq-setup">{am ? 'ዙርዎን ይምረጡ' : 'Choose your round'}</h2>
          <p className={g.setupNote}>{am ? `${config.pool.length} የተረጋገጡ ሥዕሎች ከቤተ ክርስቲያን የቀን መቁጠሪያ።` : `${config.pool.length} verified pictures from the TewahedoDaily Church calendar.`}</p>
          <fieldset className={g.optionGroup}>
            <legend>{am ? 'የጨዋታ ዓይነት' : 'How to play'}</legend>
            <div className={g.modeGrid}>
              <button type="button" aria-pressed={mode === 'look'} onClick={() => setMode('look')}>
                <strong>{am ? 'ይመልከቱና ይለዩ' : 'Look & name'}</strong>
                <span>{am ? 'ሙሉውን ሥዕል አይተው ይምረጡ።' : 'See the whole picture, then choose.'}</span>
              </button>
              <button type="button" aria-pressed={mode === 'reveal'} onClick={() => setMode('reveal')}>
                <strong>{am ? 'ሥዕሉን ይግለጡ' : 'Reveal the picture'}</strong>
                <span>{am ? 'ጥቂት ክፍል ብቻ ይታያል። በቶሎ ከመለሱ ብዙ ነጥብ።' : 'Only a few tiles show. Answer early for more points.'}</span>
              </button>
            </div>
          </fieldset>
          <fieldset className={g.optionGroup}>
            <legend>{am ? 'የጥያቄ ብዛት' : 'Round length'}</legend>
            <div className={g.pills}>
              {[5, 8, config.pool.length].filter((n, i, a) => n <= config.pool.length && a.indexOf(n) === i).map((n) => (
                <button key={n} type="button" aria-pressed={length === n} onClick={() => setLength(n)}>{n === config.pool.length ? (am ? `ሁሉም (${n})` : `All ${n}`) : n}</button>
              ))}
            </div>
          </fieldset>
          <button className={g.primary} type="button" onClick={start}>{am ? 'ጨዋታውን ይጀምሩ' : 'Start playing'}</button>
        </div>
      </section>
    )
  }

  // ---------- Results ----------
  if (result) {
    const ratio = result.score / result.max
    return (
      <section className={`${g.results} ${am ? m.am : ''}`} aria-labelledby="pq-results">
        {ratio >= 0.6 ? <Celebration /> : null}
        <p className={g.kicker}>{am ? 'ዙሩ ተጠናቋል' : 'Round complete'}</p>
        <h2 id="pq-results" ref={resultsRef} tabIndex={-1} className={m.focusTarget}>{ratio === 1 ? (am ? 'ፍጹም!' : 'Perfect round!') : ratio >= 0.6 ? (am ? 'በጣም ጥሩ!' : 'Beautifully done!') : (am ? 'ጥሩ ልምምድ!' : 'Good practice!')}</h2>
        <div className={g.scoreRow}>
          <div><strong>{result.score}/{result.max}</strong><span>{t.correct}</span></div>
          <div><strong>+{result.xp}</strong><span>{t.xp}</span></div>
          {mode === 'reveal' ? <div><strong>{score}</strong><span>{t.points}</span></div> : null}
        </div>
        {result.badges.length ? (
          <>
            <p className={m.badgeHeading} id="pq-badges">{t.badges}</p>
            <ul className={m.badgeList} aria-labelledby="pq-badges">
              {result.badges.map((b) => <li key={b}><span aria-hidden="true">{BADGES[b]?.icon ?? '✦'}</span>{BADGES[b]?.[locale] ?? b}</li>)}
            </ul>
          </>
        ) : null}
        <div className={g.actions}>
          <button className={g.primary} type="button" onClick={start}>{am ? 'እንደገና ይጫወቱ' : 'Play again'}</button>
          <button className={g.secondary} type="button" onClick={() => setRound(null)}>{am ? 'ሌላ ዙር' : 'Change round'}</button>
          <Link className={g.secondary} to="/play">{t.explore}</Link>
        </div>
        <h3 className={a11y.reviewTitle}>{t.review}</h3>
        <ol className={g.reviewGrid}>
          {answers.map((a) => {
            const ans = localized(a.item.answer, locale)
            const pickedItem = config.pool.find((p) => p.id === a.picked)
            const mine = pickedItem ? localized(pickedItem.answer, locale) : null
            const why = localized(a.item.explanation, locale)
            return (
              <li key={a.item.id} className={a.correct ? g.reviewRight : g.reviewWrong}>
                <img src={a.item.src} alt="" loading="lazy" onError={(event) => handlePlayImageError(event, a.item.fallbackSrc)} style={{ objectPosition: a.item.focus }} />
                <div>
                  <strong><span aria-hidden="true">{a.correct ? '✓' : '✕'}</span><span className={g.srOnly}>{a.correct ? t.right : t.missed}</span> <span lang={ans.fallback ? 'en' : undefined}>{ans.text}</span></strong>
                  <span className={m.reviewLines}>
                    {a.correct ? null : <span><b>{t.yourAnswer}:</b> <span lang={mine?.fallback ? 'en' : undefined}>{mine?.text ?? a.picked}</span></span>}
                    <span><b>{t.correctAnswer}:</b> <span lang={ans.fallback ? 'en' : undefined}>{ans.text}</span></span>
                    <span><span lang={why.fallback ? 'en' : undefined}>{why.text}</span>{why.fallback && am ? <span className={a11y.note}>({t.englishOnly})</span> : null}</span>
                  </span>
                  <Link to={a.item.source.route}>{a.item.source.label}</Link>
                </div>
              </li>
            )
          })}
        </ol>
      </section>
    )
  }

  // ---------- Play ----------
  const item = current!.item
  const isRight = picked === item.id
  const itemAnswer = localized(item.answer, locale)
  const pickedChoice = picked ? current!.choices.find((c) => c.id === picked) : undefined
  const pickedAnswer = pickedChoice ? localized(pickedChoice.answer, locale) : null
  const why = localized(item.explanation, locale)
  const announce = !picked ? '' : isRight ? `${t.correctBang} ${itemAnswer.text}` : `${t.notQuite}. ${t.yourAnswer}: ${pickedAnswer?.text}. ${t.correctAnswer}: ${itemAnswer.text}`
  return (
    <section className={`${g.board} ${am ? m.am : ''}`} aria-labelledby="pq-q">
      <div className={g.hud}>
        <div className={m.progressStack}>
          <GameProgress
            locale={locale}
            current={index + 1}
            total={round.length}
            label={t.question}
            valueText={am ? `${t.question} ${index + 1} ከ ${round.length}` : `${t.question} ${index + 1} of ${round.length}`}
          />
          {/* Answer history: sighted users see the dots; screen readers get each answered result in order. */}
          <ol className={`${g.dots} ${m.history}`} aria-label={t.yourAnswer}>
            {round.map((r, i) => {
              const a = answers[i]
              return (
                <li key={r.item.id} className={a ? (a.correct ? m.hRight : m.hWrong) : i === index ? m.hNow : ''} aria-hidden={a ? undefined : true}>
                  {a ? (
                    <>
                      <span aria-hidden="true">{a.correct ? '✓' : '✕'}</span>
                      <span className={g.srOnly}>{a.correct ? t.correct : t.notQuite}</span>
                    </>
                  ) : null}
                </li>
              )
            })}
          </ol>
        </div>
        <div className={g.hudStats}>
          <span aria-label={am ? 'ነጥብ' : 'Score'}>✦ {score}</span>
          {streak >= 2 ? <span className={g.streak}>{am ? `${streak} ተከታታይ` : `${streak} in a row`}</span> : null}
        </div>
      </div>

      <p className={a11y.srOnly} role="status" aria-live="polite" aria-atomic="true">{announce}</p>
      <div className={g.stage}>
        <figure className={g.frame}>
          <div className={g.picture}>
            <img key={item.id} src={item.src} width={item.width} height={item.height} alt={picked ? `${itemAnswer.text}. ${item.description}` : item.description} onError={(event) => handlePlayImageError(event, item.fallbackSrc)} style={{ objectPosition: item.focus }} />
            {mode === 'reveal' ? (
              <div className={g.tiles} aria-hidden="true">
                {[...Array(TILES).keys()].map((tile) => <i key={tile} className={revealed.has(tile) ? g.tileOpen : ''} />)}
              </div>
            ) : null}
          </div>
          {mode === 'reveal' && !picked ? (
            <figcaption className={g.revealBar}>
              <span>{am ? `${TILES - opened + 1} ነጥብ በዚህ ጊዜ` : `Worth ${TILES - opened + 1} points now`}</span>
              <button type="button" className={`${g.secondary} ${m.revealMore}`} disabled={opened >= TILES} onClick={() => setOpened((o) => Math.min(TILES, o + 2))}>{am ? 'ተጨማሪ ይግለጡ' : 'Reveal more'}</button>
            </figcaption>
          ) : null}
        </figure>

        <div className={g.questionSide}>
          <h2 id="pq-q" ref={headingRef} tabIndex={-1} className={m.focusTarget}>{config.prompt[locale]}</h2>
          <div className={g.choices}>
            {current!.choices.map((c, i) => {
              const state = !picked ? '' : c.id === item.id ? `${g.choiceRight} ${m.answered}` : c.id === picked ? `${g.choiceWrong} ${m.answered}` : `${g.choiceDim} ${m.readable}`
              const name = localized(c.answer, locale)
              return (
                <button key={c.id} type="button" className={`${g.choice} ${state}`} disabled={Boolean(picked)} onClick={() => choose(c.id)}>
                  <span className={g.choiceKey} aria-hidden="true">{'ABCD'[i]}</span>
                  <span className={m.choiceBody}>
                    <span className={m.choiceText}>
                      <span lang={name.fallback ? 'en' : undefined}>{name.text}</span>
                      {locale === 'en' && c.answer.am ? <small lang="am">{c.answer.am}</small> : null}
                    </span>
                    {picked && c.id === item.id ? <span className={`${a11y.badge} ${a11y.badgeRight}`}><span aria-hidden="true">✓</span>{t.correctAnswer}</span> : null}
                    {picked && c.id === picked && c.id !== item.id ? <span className={`${a11y.badge} ${a11y.badgeWrong}`}><span aria-hidden="true">✕</span>{t.yourAnswer}</span> : null}
                  </span>
                </button>
              )
            })}
          </div>

          {picked ? (
            <div className={`${g.feedback} ${isRight ? g.feedbackRight : g.feedbackWrong} ${a11y.feedbackEnter}`}>
              <p className={`${g.feedbackTitle} ${a11y.feedbackTitle}`}>
                <span className={a11y.feedbackIcon} aria-hidden="true">{isRight ? '✓' : '✕'}</span>
                {isRight ? t.correctBang : (am ? `ይህ ${itemAnswer.text} ነው` : `This is ${itemAnswer.text}`)}
              </p>
              <p><span lang={why.fallback ? 'en' : undefined}>{why.text}</span>{why.fallback && am ? <span className={a11y.note}>({t.englishOnly})</span> : null}{item.when ? <span className={g.when}> · {item.when}</span> : null}</p>
              <Link className={g.sourceLink} to={item.source.route}>{am ? 'ምንጭ፦ ' : 'Source: '}{item.source.label}</Link>
              <button ref={nextRef} className={g.primary} type="button" onClick={next}>
                {index === round.length - 1 ? (am ? 'ውጤቱን ይመልከቱ' : 'See results') : (am ? 'ቀጣይ' : 'Next picture')} →
              </button>
            </div>
          ) : null}
        </div>
      </div>
    </section>
  )
}
