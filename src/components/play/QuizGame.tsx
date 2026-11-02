import { useEffect, useMemo, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import type { AppLocale } from '../../lib/i18n/locale'
import { useAuth } from '../../lib/auth/useAuth'
import { recordPlayCompletion, type PlayAchievement } from '../../lib/play/progress'
import { syncPlayCompletion } from '../../lib/play/progressSync'
import { loadSeen, markSeen, selectUnseen } from '../../lib/play/questionHistory'
import { localized, type LocalizedText, type PlayDifficulty, type PlayGameType, type PlayQuestion } from '../../lib/play/types'
import { VerifiedFallback } from './GameShell'
import { Celebration } from './Celebration'
import { GameProgress } from './GameProgress'
import styles from './GameShell.module.css'
import fb from './AnswerFeedback.module.css'
import g from './PlayGames.module.css'
import { BADGES } from './PlayProgressPanel'

type Answer = { question: PlayQuestion; selected: string; correct: boolean; points: number }

const TIMEOUT_KEY = '__timeout__'

function labelsFor(locale: AppLocale) {
  return locale === 'am'
    ? {
        correct: 'ትክክል', correctBang: 'ትክክል!', notQuite: 'ትክክል አይደለም', timeUp: 'ጊዜ አልቋል',
        yourAnswer: 'የእርስዎ መልስ', correctAnswer: 'ትክክለኛ መልስ', noAnswer: 'መልስ አልተሰጠም',
        source: 'ምንጭ፦ ', englishOnly: 'በእንግሊዝኛ ብቻ', roundComplete: 'ዙሩ ተጠናቋል', wellPlayed: 'ጥሩ ልምምድ!',
        finalScore: 'የመጨረሻ ውጤት', xpEarned: 'የተገኘ XP', outOf: (score: number, max: number) => `${score} ከ ${max}`,
        question: 'ጥያቄ', review: 'መልሶችዎን ይከልሱ', badges: 'ያገኟቸው ምልክቶች', playAgain: 'እንደገና', explore: 'ጨዋታዎችን ያስሱ',
      }
    : {
        correct: 'Correct', correctBang: 'Correct!', notQuite: 'Not quite', timeUp: "Time's up",
        yourAnswer: 'Your answer', correctAnswer: 'Correct answer', noAnswer: 'No answer given',
        source: 'Source: ', englishOnly: 'English only', roundComplete: 'Round complete', wellPlayed: 'Well played!',
        finalScore: 'Final score', xpEarned: 'XP earned', outOf: (score: number, max: number) => `${score} of ${max}`,
        question: 'Question', review: 'Review your answers', badges: 'Badges earned', playAgain: 'Play again', explore: 'Explore games',
      }
}

/** Text with the existing English fallback; the fallback is tagged so it is read and shaped as English. */
function Loc({ value, locale }: { value: LocalizedText; locale: AppLocale }) {
  const item = localized(value, locale)
  return <span lang={item.fallback ? 'en' : undefined}>{item.text}</span>
}

function optionValue(question: PlayQuestion, key: string) {
  return question.options.find((option) => option.key === key)?.text ?? null
}

export function QuizGame({ locale, game, questions, dailyQuestionIndex, initialDifficulty }: { locale: AppLocale; game: PlayGameType; questions: PlayQuestion[]; dailyQuestionIndex?: number; initialDifficulty?: PlayDifficulty }) {
  const { user } = useAuth()
  const categories = useMemo(() => [...new Set(questions.map((q) => q.category))], [questions])
  const [category, setCategory] = useState('all')
  const [difficulty, setDifficulty] = useState<PlayDifficulty>(initialDifficulty ?? 'beginner')
  const [count, setCount] = useState(5)
  const [timed, setTimed] = useState(false)
  const dailyQuestion = dailyQuestionIndex == null || !questions.length ? null : questions[dailyQuestionIndex % questions.length]
  const [round, setRound] = useState<PlayQuestion[] | null>(dailyQuestion ? [dailyQuestion] : null)
  const [index, setIndex] = useState(0)
  const [selected, setSelected] = useState<string | null>(null)
  const [answers, setAnswers] = useState<Answer[]>([])
  const [hints, setHints] = useState(0)
  const [seconds, setSeconds] = useState(30)
  const [result, setResult] = useState<{ score: number; max: number; xp: number; badges: PlayAchievement[] } | null>(null)

  const eligible = useMemo(() => questions.filter((q) =>
    (category === 'all' || q.category === category) &&
    (difficulty === 'challenge' || q.difficulty === difficulty || q.difficulty === 'beginner')
  ), [questions, category, difficulty])

  useEffect(() => {
    if (!round || selected || !timed || result) return
    const timer = window.setTimeout(() => {
      if (seconds <= 1) setSelected('__timeout__')
      else setSeconds(seconds - 1)
    }, 1000)
    return () => window.clearTimeout(timer)
  }, [round, selected, timed, seconds, result])

  const questionRef = useRef<HTMLHeadingElement>(null)
  const resultsRef = useRef<HTMLHeadingElement>(null)
  const nextRef = useRef<HTMLButtonElement>(null)
  const prevView = useRef({ round, index, result })

  // Move focus when the view changes (never on first render, so a daily-challenge page load keeps its focus).
  useEffect(() => {
    const prev = prevView.current
    if (prev.round === round && prev.index === index && prev.result === result) return
    prevView.current = { round, index, result }
    if (result) resultsRef.current?.focus()
    else if (round) questionRef.current?.focus()
  }, [round, index, result])

  // The disabled option buttons drop focus, so land on the next action.
  useEffect(() => {
    if (selected) nextRef.current?.focus()
  }, [selected])

  if (!questions.length) return (
    <div className={styles.empty} role="status">
      <h2>{locale === 'am' ? 'የተገመገመ ይዘት እየተጠበቀ ነው' : 'Waiting for reviewed content'}</h2>
      <p>{locale === 'am' ? 'ያልተረጋገጠ ይዘት አናሳይም። አርታዒ ይዘቱን ካጸደቀ በኋላ ጨዋታው ይከፈታል።' : 'Unverified content is never shown. This game opens after an editor publishes source-linked items.'}</p>
      <Link to="/play">{locale === 'am' ? 'ወደ ጨዋታ ማዕከል' : 'Back to game center'}</Link>
    </div>
  )

  const start = () => {
    if (dailyQuestion) {
      setRound([dailyQuestion]); setIndex(0); setSelected(null); setAnswers([]); setHints(0); setSeconds(30); setResult(null)
      return
    }
    const source = eligible.length ? eligible : questions
    const chosen = selectUnseen(source, (question) => question.id, loadSeen(game), Math.min(count, source.length)).picked
    markSeen(game, chosen.map((question) => question.id))
    setRound(chosen); setIndex(0); setSelected(null); setAnswers([]); setHints(0); setSeconds(30); setResult(null)
  }

  if (!round) return (
    <section className={styles.panel} aria-labelledby="game-setup-title">
      <h2 id="game-setup-title">{locale === 'am' ? 'ዙርዎን ያዘጋጁ' : 'Set up your round'}</h2>
      <VerifiedFallback locale={locale} />
      <div className={styles.setupGrid}>
        <div className={styles.field}><label htmlFor="play-category">{locale === 'am' ? 'ምድብ' : 'Category'}</label><select id="play-category" value={category} onChange={(e) => setCategory(e.target.value)}><option value="all">{locale === 'am' ? 'ሁሉም' : 'All categories'}</option>{categories.map((item) => <option key={item}>{item}</option>)}</select></div>
        <div className={styles.field}><span className={styles.legend}>{locale === 'am' ? 'ደረጃ' : 'Difficulty'}</span><div className={styles.choiceRow}>{(['beginner', 'growing', 'challenge'] as const).map((item) => <button key={item} type="button" aria-pressed={difficulty === item} onClick={() => setDifficulty(item)}>{item}</button>)}</div></div>
        <div className={styles.field}><span className={styles.legend}>{locale === 'am' ? 'የጥያቄ ብዛት' : 'Questions'}</span><div className={styles.choiceRow}>{[5, 10, 20].map((item) => <button key={item} type="button" aria-pressed={count === item} onClick={() => setCount(item)}>{item}</button>)}</div></div>
        <div className={styles.field}><span className={styles.legend}>{locale === 'am' ? 'ጊዜ' : 'Timer'}</span><div className={styles.choiceRow}><button type="button" aria-pressed={!timed} onClick={() => setTimed(false)}>{locale === 'am' ? 'አይ' : 'Off'}</button><button type="button" aria-pressed={timed} onClick={() => setTimed(true)}>30s</button></div></div>
      </div>
      <div className={styles.actions}><button className={styles.action} type="button" onClick={start}>{locale === 'am' ? 'ይጀምሩ' : 'Start round'}</button></div>
    </section>
  )

  const l = labelsFor(locale)

  if (result) return (
    <section className={`${styles.panel} ${styles.results} ${locale === 'am' ? fb.am : ''}`} style={{ position: 'relative', overflow: 'hidden' }} aria-labelledby="quiz-results-title">
      {result.max > 0 && result.score / result.max >= 0.6 ? <Celebration /> : null}
      <p>{l.roundComplete}</p><h2 id="quiz-results-title" className={fb.resultsHeading} ref={resultsRef} tabIndex={-1}>{l.wellPlayed}</h2>
      <div className={g.scoreRow}>
        <div><strong aria-hidden="true">{result.score}/{result.max}</strong><span className={fb.srOnly}>{l.outOf(result.score, result.max)}</span><span aria-hidden="true">{l.finalScore}</span></div>
        <div><strong>+{result.xp}</strong><span>{l.xpEarned}</span></div>
      </div>
      {result.badges.length ? (
        <>
          <p className={fb.badgeHeading} id="quiz-badges">{l.badges}</p>
          <ul className={fb.badgeList} aria-labelledby="quiz-badges">
            {result.badges.map((badge) => <li key={badge}><span aria-hidden="true">{BADGES[badge]?.icon ?? '✦'}</span>{BADGES[badge]?.[locale] ?? badge}</li>)}
          </ul>
        </>
      ) : null}
      <div className={styles.actions}><button className={styles.action} type="button" onClick={start}>{l.playAgain}</button><Link className={styles.secondary} to="/play">{l.explore}</Link></div>
      <h3 className={fb.reviewTitle}>{l.review}</h3>
      <ol className={`${styles.review} ${fb.reviewList}`}>{answers.map((answer, answerIndex) => {
        const timedOut = answer.selected === TIMEOUT_KEY
        const chosen = timedOut ? null : optionValue(answer.question, answer.selected)
        const right = optionValue(answer.question, answer.question.correctKey)
        const explanation = localized(answer.question.explanation, locale)
        return (
          <li key={`${answer.question.id}-${answerIndex}`}>
            <article className={`${fb.reviewItem} ${answer.correct ? fb.feedbackRight : fb.feedbackWrong}`}>
              <p className={fb.reviewStatus}><span className={fb.feedbackIcon} aria-hidden="true">{answer.correct ? '✓' : '✕'}</span>{answer.correct ? l.correct : timedOut ? l.timeUp : l.notQuite}</p>
              <p className={fb.reviewPrompt}><Loc value={answer.question.prompt} locale={locale} /></p>
              <p className={fb.reviewLine}><b>{l.yourAnswer}:</b> {chosen ? <Loc value={chosen} locale={locale} /> : l.noAnswer}</p>
              {answer.correct || !right ? null : <p className={fb.reviewLine}><b>{l.correctAnswer}:</b> <Loc value={right} locale={locale} /></p>}
              <p className={fb.reviewLine}><Loc value={answer.question.explanation} locale={locale} />{explanation.fallback ? <span className={fb.note}>({l.englishOnly})</span> : null}</p>
              <Link className={styles.source} to={answer.question.source.route}>{l.source}{answer.question.source.label}</Link>
            </article>
          </li>
        )
      })}</ol>
    </section>
  )

  const question = round[index]
  const streak = (() => {
    if (selected && selected !== question.correctKey) return 0
    let n = selected ? 1 : 0
    for (let i = answers.length - 1; i >= 0 && answers[i].correct; i--) n++
    return n
  })()
  const answer = (key: string) => {
    if (selected) return
    setSelected(key)
  }
  const next = () => {
    const isCorrect = selected === question.correctKey
    const points = isCorrect ? Math.max(1, 4 - hints) : 0
    const nextAnswers = [...answers, { question, selected: selected || '__timeout__', correct: isCorrect, points }]
    setAnswers(nextAnswers)
    if (index === round.length - 1) {
      const score = nextAnswers.reduce((sum, item) => sum + (item.correct ? 1 : 0), 0)
      const saved = recordPlayCompletion({ game, score, maxScore: round.length, category: category === 'all' ? game : category })
      void syncPlayCompletion(user, { game, score, maxScore: round.length, category: category === 'all' ? game : category, progress: saved.progress }).catch(() => undefined)
      setResult({ score, max: round.length, xp: saved.xpEarned, badges: saved.newAchievements })
    } else {
      setIndex((value) => value + 1); setSelected(null); setHints(0); setSeconds(30)
    }
  }

  const isCorrect = selected === question.correctKey
  const timedOut = selected === TIMEOUT_KEY
  const correctText = optionValue(question, question.correctKey)
  const correctLabel = correctText ? localized(correctText, locale).text : ''
  const announcement = !selected
    ? ''
    : isCorrect
      ? `${l.correctBang}`
      : `${timedOut ? l.timeUp : l.notQuite}. ${l.correctAnswer}: ${correctLabel}.`

  return (
    <section className={locale === 'am' ? fb.am : undefined}>
      <div className={fb.srOnly} role="status" aria-live="polite" aria-atomic="true">{announcement}</div>
      <div className={fb.progressWrap}>
        <GameProgress
          locale={locale}
          current={index + 1}
          total={round.length}
          label={l.question}
          valueText={locale === 'am' ? `${l.question} ${index + 1} ከ ${round.length}` : `${l.question} ${index + 1} of ${round.length}`}
          trailing={timed || streak >= 2 ? (
            <>
              {timed ? <span className={fb.timer}>{seconds}s</span> : null}
              {streak >= 2 ? <span className={styles.streak}>{locale === 'am' ? `${streak} ተከታታይ` : `${streak} in a row`}</span> : null}
            </>
          ) : undefined}
        />
      </div>
      <article className={styles.questionCard}>
        {question.emoji ? <div className={styles.emoji} aria-label="Emoji clues">{question.emoji}</div> : null}
        {question.excerpt ? <p className={styles.excerpt}>{localized(question.excerpt, locale).text}</p> : null}
        <VerifiedFallback locale={locale === 'am' && !question.verifiedLocales.includes('am') ? locale : 'en'} />
        <h2 className={fb.resultsHeading} ref={questionRef} tabIndex={-1}><Loc value={question.prompt} locale={locale} /></h2>
        {question.hints?.length ? <div className={styles.hintRow}><button className={styles.hint} type="button" disabled={hints >= question.hints.length || Boolean(selected)} onClick={() => setHints((value) => value + 1)}>{locale === 'am' ? 'ፍንጭ' : 'Use hint'} ({hints}/{question.hints.length})</button>{question.hints.slice(0, hints).map((hint, hintIndex) => <p className={styles.hintText} key={hintIndex}>{localized(hint, locale).text}</p>)}</div> : null}
        <div className={styles.options}>{question.options.map((item) => {
          const isRight = Boolean(selected) && item.key === question.correctKey
          const isChosen = selected === item.key
          const isWrong = isChosen && !isRight
          return (
            <button key={item.key} className={`${styles.option} ${isRight ? styles.correct : ''} ${isWrong ? styles.incorrect : ''}`} type="button" disabled={Boolean(selected)} onClick={() => answer(item.key)}>
              <span className={fb.optionInner}>
                <span className={fb.optionText}><Loc value={item.text} locale={locale} /></span>
                {isRight ? <span className={`${fb.badge} ${fb.badgeRight}`}><span aria-hidden="true">✓</span>{isChosen ? `${l.yourAnswer} · ${l.correct}` : l.correctAnswer}</span> : null}
                {isWrong ? <span className={`${fb.badge} ${fb.badgeWrong}`}><span aria-hidden="true">✕</span>{l.yourAnswer}</span> : null}
              </span>
            </button>
          )
        })}</div>
        {selected ? <div className={`${styles.feedback} ${isCorrect ? fb.feedbackRight : fb.feedbackWrong} ${fb.feedbackEnter}`}>
          <strong className={fb.feedbackTitle}><span className={fb.feedbackIcon} aria-hidden="true">{isCorrect ? '✓' : '✕'}</span>{isCorrect ? l.correctBang : timedOut ? l.timeUp : l.notQuite}</strong>
          {isCorrect || !correctText ? null : <p className={fb.answerLine}>{l.correctAnswer}: <Loc value={correctText} locale={locale} /></p>}
          <p><Loc value={question.explanation} locale={locale} />{localized(question.explanation, locale).fallback ? <span className={fb.note}>({l.englishOnly})</span> : null}</p>
          <Link className={styles.source} to={question.source.route}>{l.source}{question.source.label}</Link>
          <div className={styles.actions}><button ref={nextRef} className={styles.action} type="button" onClick={next}>{index === round.length - 1 ? (locale === 'am' ? 'ውጤት' : 'See results') : (locale === 'am' ? 'ቀጣይ' : 'Next')}</button></div>
        </div> : null}
      </article>
    </section>
  )
}
