import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import type { AppLocale } from '../../lib/i18n/locale'
import { useAuth } from '../../lib/auth/useAuth'
import { recordPlayCompletion } from '../../lib/play/progress'
import { syncPlayCompletion } from '../../lib/play/progressSync'
import { localized, type PlayDifficulty, type PlayGameType, type PlayQuestion } from '../../lib/play/types'
import { VerifiedFallback } from './GameShell'
import { Celebration } from './Celebration'
import styles from './GameShell.module.css'

type Answer = { question: PlayQuestion; selected: string; correct: boolean; points: number }

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
  const [result, setResult] = useState<{ score: number; max: number; xp: number } | null>(null)

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
    const chosen = [...source].sort((a, b) => a.id.localeCompare(b.id)).slice(0, Math.min(count, source.length))
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

  if (result) return (
    <section className={`${styles.panel} ${styles.results}`} style={{ position: 'relative', overflow: 'hidden' }}>
      {result.max > 0 && result.score / result.max >= 0.6 ? <Celebration /> : null}
      <p>{locale === 'am' ? 'ዙሩ ተጠናቋል' : 'Round complete'}</p><h2>{locale === 'am' ? 'ጥሩ ልምምድ!' : 'Well played!'}</h2>
      <p className={styles.score}>{result.score}/{result.max}</p><p>+{result.xp} XP</p>
      <div className={styles.actions}><button className={styles.action} type="button" onClick={start}>{locale === 'am' ? 'እንደገና' : 'Play again'}</button><Link className={styles.secondary} to="/play">{locale === 'am' ? 'ወደ ማዕከል' : 'Game center'}</Link></div>
      <div className={styles.review}>{answers.map((answer, answerIndex) => <article key={`${answer.question.id}-${answerIndex}`}><strong>{answer.correct ? '✓' : '✕'} {localized(answer.question.prompt, locale).text}</strong><p>{localized(answer.question.explanation, locale).text}</p><Link to={answer.question.source.route}>{answer.question.source.label}</Link></article>)}</div>
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
      setResult({ score, max: round.length, xp: saved.xpEarned })
    } else {
      setIndex((value) => value + 1); setSelected(null); setHints(0); setSeconds(30)
    }
  }

  return (
    <section aria-live="polite">
      <div className={styles.progress}><span>{index + 1}/{round.length}{timed ? ` · ${seconds}s` : ''}</span>{streak >= 2 ? <span className={styles.streak}>{locale === 'am' ? `${streak} ተከታታይ` : `${streak} in a row`}</span> : null}<div className={styles.bar}><i style={{ width: `${((index + 1) / round.length) * 100}%` }} /></div></div>
      <article className={styles.questionCard}>
        {question.emoji ? <div className={styles.emoji} aria-label="Emoji clues">{question.emoji}</div> : null}
        {question.excerpt ? <p className={styles.excerpt}>{localized(question.excerpt, locale).text}</p> : null}
        <VerifiedFallback locale={locale === 'am' && !question.verifiedLocales.includes('am') ? locale : 'en'} />
        <h2>{localized(question.prompt, locale).text}</h2>
        {question.hints?.length ? <div className={styles.hintRow}><button className={styles.hint} type="button" disabled={hints >= question.hints.length || Boolean(selected)} onClick={() => setHints((value) => value + 1)}>{locale === 'am' ? 'ፍንጭ' : 'Use hint'} ({hints}/{question.hints.length})</button>{question.hints.slice(0, hints).map((hint, hintIndex) => <p className={styles.hintText} key={hintIndex}>{localized(hint, locale).text}</p>)}</div> : null}
        <div className={styles.options}>{question.options.map((item) => <button key={item.key} className={`${styles.option} ${selected && item.key === question.correctKey ? styles.correct : ''} ${selected === item.key && item.key !== question.correctKey ? styles.incorrect : ''}`} type="button" disabled={Boolean(selected)} onClick={() => answer(item.key)}>{localized(item.text, locale).text}</button>)}</div>
        {selected ? <div className={styles.feedback} role="status"><strong>{selected === question.correctKey ? (locale === 'am' ? 'ትክክል!' : 'Correct!') : (locale === 'am' ? 'እንደገና ይማሩ' : 'Keep learning')}</strong><p>{localized(question.explanation, locale).text}</p><Link className={styles.source} to={question.source.route}>{locale === 'am' ? 'ምንጭ፦ ' : 'Source: '}{question.source.label}</Link><div className={styles.actions}><button className={styles.action} type="button" onClick={next}>{index === round.length - 1 ? (locale === 'am' ? 'ውጤት' : 'See results') : (locale === 'am' ? 'ቀጣይ' : 'Next')}</button></div></div> : null}
      </article>
    </section>
  )
}
