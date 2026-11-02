import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import type { AppLocale } from '../../lib/i18n/locale'
import { useAuth } from '../../lib/auth/useAuth'
import {
  buildFinishMezmurBank,
  gradeTyped,
  type FmDifficulty,
  type FmMode,
  type FmQuestion,
  type MezmurSong,
} from '../../lib/play/finishMezmur'
import { fetchMezmurLyrics } from '../../lib/play/mezmurLyricsSource'
import { loadSeen, markSeen, resetSeen, selectUnseen } from '../../lib/play/questionHistory'
import { recordPlayCompletion } from '../../lib/play/progress'
import { syncPlayCompletion } from '../../lib/play/progressSync'
import { Celebration } from './Celebration'
import g from './PlayGames.module.css'

const GAME = 'finish-the-mezmur'
const ROUND = 6

type Reading = 'amharic' | 'transliteration'
type Answered = { q: FmQuestion; correct: boolean }

const MODES: { key: FmMode; en: string; am: string; hint: { en: string; am: string } }[] = [
  { key: 'choose', en: 'Choose the line', am: 'መስመሩን ይምረጡ', hint: { en: 'Pick the missing lyric from four real lines.', am: 'የጎደለውን ግጥም ከአራት እውነተኛ መስመሮች ይምረጡ።' } },
  { key: 'arrange', en: 'Arrange the words', am: 'ቃላቱን ያስተካክሉ', hint: { en: 'Put the scrambled words back in order.', am: 'የተበጣጠሱ ቃላትን በቅደም ተከተል ያስቀምጡ።' } },
  { key: 'type', en: 'Type the line', am: 'መስመሩን ይጻፉ', hint: { en: 'Type the missing lyric from memory.', am: 'የጎደለውን ግጥም ከማስታወስ ይጻፉ።' } },
]
const LEVELS: { key: FmDifficulty; en: string; am: string }[] = [
  { key: 'easy', en: 'Easy', am: 'ቀላል' },
  { key: 'medium', en: 'Medium', am: 'መካከለኛ' },
  { key: 'hard', en: 'Hard', am: 'ከባድ' },
]

function LyricLine({ reading, line, className }: { reading: Reading; line: { am: string; tr: string }; className?: string }) {
  return (
    <span className={className} lang={reading === 'amharic' ? 'am' : undefined}>
      {reading === 'amharic' ? line.am : line.tr || line.am}
    </span>
  )
}

export function FinishMezmurGame({ locale }: { locale: AppLocale }) {
  const { user } = useAuth()
  const am = locale === 'am'
  const [songs, setSongs] = useState<MezmurSong[] | null>(null)
  const [loadError, setLoadError] = useState(false)
  const [mode, setMode] = useState<FmMode>('choose')
  const [difficulty, setDifficulty] = useState<FmDifficulty>('easy')
  const [reading, setReading] = useState<Reading>(am ? 'amharic' : 'transliteration')
  const [round, setRound] = useState<FmQuestion[] | null>(null)
  const [index, setIndex] = useState(0)
  const [answers, setAnswers] = useState<Answered[]>([])
  const [exhausted, setExhausted] = useState(false)

  // Per-question interaction state
  const [picked, setPicked] = useState<string | null>(null)
  const [arranged, setArranged] = useState<number[]>([])
  const [typed, setTyped] = useState('')
  const [revealed, setRevealed] = useState(false)
  const [result, setResult] = useState<{ score: number; max: number; xp: number } | null>(null)
  const nextRef = useRef<HTMLButtonElement>(null)
  const loadRequest = useRef(0)

  const loadLyrics = useCallback(() => {
    const request = ++loadRequest.current
    setSongs(null)
    setLoadError(false)
    void fetchMezmurLyrics({ sample: 240 }).then((data) => {
      if (request !== loadRequest.current) return
      if (data.length < 4) setLoadError(true)
      else setSongs(data)
    }).catch(() => { if (request === loadRequest.current) setLoadError(true) })
  }, [])

  useEffect(() => {
    loadLyrics()
    return () => { loadRequest.current += 1 }
  }, [loadLyrics])

  const bank = useMemo(() => (songs ? buildFinishMezmurBank(songs, mode, difficulty) : []), [songs, mode, difficulty])

  const begin = useCallback((freshStart = false) => {
    if (freshStart) resetSeen(GAME)
    const sel = selectUnseen(bank, (q) => q.id, loadSeen(GAME), ROUND)
    setRound(sel.picked)
    setExhausted(sel.exhausted && !freshStart)
    setIndex(0); setAnswers([]); setPicked(null); setArranged([]); setTyped(''); setRevealed(false); setResult(null)
  }, [bank])

  const current = round?.[index]

  useEffect(() => { if (picked || revealed) nextRef.current?.focus() }, [picked, revealed])

  const commit = (correct: boolean) => {
    if (!current) return
    setAnswers((a) => [...a, { q: current, correct }])
  }

  const next = () => {
    if (!round) return
    if (index < round.length - 1) {
      setIndex((i) => i + 1); setPicked(null); setArranged([]); setTyped(''); setRevealed(false)
      return
    }
    const right = answers.filter((a) => a.correct).length
    markSeen(GAME, round.map((q) => q.id))
    const saved = recordPlayCompletion({ game: GAME, score: right, maxScore: round.length, category: 'Mezmur lyrics' })
    void syncPlayCompletion(user, { game: GAME, score: right, maxScore: round.length, category: GAME, progress: saved.progress }).catch(() => undefined)
    setResult({ score: right, max: round.length, xp: saved.xpEarned })
  }

  // ---------- loading / empty ----------
  if (loadError) {
    return (
      <div className={g.results} role="status">
        <p className={g.kicker}>{am ? 'ይዘት' : 'Content'}</p>
        <h2>{am ? 'ግጥሞች አሁን አልተገኙም' : 'Lyrics are not available right now'}</h2>
        <p className={g.setupNote}>{am ? 'የተረጋገጡ የመዝሙር ግጥሞችን ማምጣት አልተቻለም። እባክዎ ቆይተው ይሞክሩ።' : 'Could not load verified Mezmur lyrics. Please try again shortly — the game never shows unverified text.'}</p>
        <div className={g.actions}>
          <button className={g.primary} type="button" onClick={loadLyrics}>{am ? 'ደግመው ይሞክሩ' : 'Try again'}</button>
          <Link className={g.secondary} to="/play">{am ? 'ወደ ጨዋታ ማዕከል' : 'All games'}</Link>
        </div>
      </div>
    )
  }
  if (!songs) {
    return <div className={g.results} role="status"><p className={g.kicker}>{am ? 'በመጫን ላይ' : 'Loading'}</p><h2>{am ? 'የተረጋገጡ ግጥሞችን በማምጣት ላይ…' : 'Loading verified lyrics…'}</h2></div>
  }

  // ---------- setup ----------
  if (!round) {
    const available = bank.length
    return (
      <section className={g.setup} aria-labelledby="fm-setup">
        <div className={g.setupPreview} aria-hidden="true">
          <span style={{ position: 'absolute', inset: 0, display: 'grid', placeItems: 'center', color: '#e7d39d', fontFamily: 'var(--font-display)', fontSize: '2.4rem', textAlign: 'center', padding: '1.5rem', lineHeight: 1.3 }}>
            ♫ {am ? 'መዝሙሩን ይጨርሱ' : 'Finish the Mezmur'}
          </span>
        </div>
        <div className={g.setupBody}>
          <h2 id="fm-setup">{am ? 'ዙርዎን ይምረጡ' : 'Set up your round'}</h2>
          <p className={g.setupNote}>{am ? `ከ${songs.length} የተረጋገጡ መዝሙራት የተዘጋጁ ${available} ጥያቄዎች። ያዩዋቸው አይደገሙም።` : `${available} questions from ${songs.length} verified Mezmurs. You won’t see the same one twice.`}</p>
          <fieldset className={g.optionGroup}>
            <legend>{am ? 'የጨዋታ ዓይነት' : 'How to play'}</legend>
            <div className={g.modeGrid}>
              {MODES.map((m) => (
                <button key={m.key} type="button" aria-pressed={mode === m.key} onClick={() => setMode(m.key)}>
                  <strong>{m[locale]}</strong><span>{m.hint[locale]}</span>
                </button>
              ))}
            </div>
          </fieldset>
          <fieldset className={g.optionGroup}>
            <legend>{am ? 'ደረጃ' : 'Challenge'}</legend>
            <div className={g.pills}>
              {LEVELS.map((l) => <button key={l.key} type="button" aria-pressed={difficulty === l.key} onClick={() => setDifficulty(l.key)}>{l[locale]}</button>)}
            </div>
          </fieldset>
          <fieldset className={g.optionGroup}>
            <legend>{am ? 'ንባብ' : 'Reading'}</legend>
            <div className={g.pills}>
              <button type="button" aria-pressed={reading === 'amharic'} onClick={() => setReading('amharic')} lang="am">አማርኛ</button>
              <button type="button" aria-pressed={reading === 'transliteration'} onClick={() => setReading('transliteration')}>Transliteration</button>
            </div>
          </fieldset>
          <button className={g.primary} type="button" disabled={available === 0} onClick={() => begin(false)}>
            {available === 0 ? (am ? 'በዚህ ደረጃ ጥያቄ የለም' : 'No questions at this level') : (am ? 'ይጀምሩ' : 'Start round')}
          </button>
        </div>
      </section>
    )
  }

  // ---------- results ----------
  if (result) {
    const ratio = result.max ? result.score / result.max : 0
    return (
      <section className={g.results} aria-labelledby="fm-results">
        {ratio >= 0.6 ? <Celebration /> : null}
        <p className={g.kicker}>{am ? 'ዙሩ ተጠናቋል' : 'Round complete'}</p>
        <h2 id="fm-results">{ratio === 1 ? (am ? 'ፍጹም!' : 'Perfect round!') : ratio >= 0.6 ? (am ? 'በጣም ጥሩ!' : 'Well sung!') : (am ? 'ጥሩ ልምምድ!' : 'Good practice!')}</h2>
        <div className={g.scoreRow}>
          <div><strong>{result.score}/{result.max}</strong><span>{am ? 'ትክክል' : 'correct'}</span></div>
          <div><strong>+{result.xp}</strong><span>XP</span></div>
        </div>
        <div className={g.actions}>
          <button className={g.primary} type="button" onClick={() => begin(false)}>{am ? 'አዲስ ጥያቄዎች' : 'Fresh questions'}</button>
          <button className={g.secondary} type="button" onClick={() => setRound(null)}>{am ? 'ሁነታ ይቀይሩ' : 'Change mode'}</button>
          <Link className={g.secondary} to="/play">{am ? 'ወደ ጨዋታ ማዕከል' : 'All games'}</Link>
        </div>
        {exhausted ? <p className={g.setupNote} style={{ marginTop: '1rem' }}>{am ? 'በዚህ ደረጃ ያሉትን ሁሉንም ጥያቄዎች አይተዋል። “እንደገና ይለማመዱ” ለመጀመር።' : 'You’ve seen every question at this level. Practice again to replay them.'} <button className={g.secondary} type="button" onClick={() => begin(true)} style={{ marginLeft: '0.5rem' }}>{am ? 'እንደገና ይለማመዱ' : 'Practice again'}</button></p> : null}
        <ol className={g.reviewGrid} style={{ gridTemplateColumns: '1fr' }}>
          {answers.map((a, i) => (
            <li key={a.q.id + i} className={a.correct ? g.reviewRight : g.reviewWrong} style={{ gridTemplateColumns: '1fr' }}>
              <div>
                <strong><span aria-hidden="true">{a.correct ? '✓' : '✕'}</span> <LyricLine reading={reading} line={a.q.answer} /></strong>
                <span>{am ? 'ከ' : 'from'} “{a.q.titleAmharic || a.q.title}”</span>
                <Link to={`/hymns/mezmur/${a.q.slug}`}>{am ? 'መዝሙሩን ይክፈቱ' : 'Open this Mezmur'} →</Link>
              </div>
            </li>
          ))}
        </ol>
      </section>
    )
  }

  // ---------- play ----------
  const q = current!
  const answered = picked !== null || revealed || (q.mode === 'arrange' && answers.length > index)
  const titleLabel = q.titleAmharic || q.title

  const renderBlankLines = () => (
    <div className={g.lyricStack}>
      {q.contextBefore.map((l, i) => <p key={`b${i}`} className={g.lyricCtx}><LyricLine reading={reading} line={l} /></p>)}
      <p className={g.lyricBlank} aria-label={am ? 'የጎደለው መስመር' : 'missing line'}>
        {answered ? <LyricLine reading={reading} line={q.answer} className={g.lyricReveal} /> : <span aria-hidden="true">● ● ● ● ●</span>}
      </p>
      {q.contextAfter.map((l, i) => <p key={`a${i}`} className={g.lyricCtx}><LyricLine reading={reading} line={l} /></p>)}
    </div>
  )

  return (
    <section className={g.board} aria-labelledby="fm-q">
      <div className={g.hud}>
        <ol className={g.dots} aria-label={am ? `ጥያቄ ${index + 1} ከ ${round.length}` : `Question ${index + 1} of ${round.length}`}>
          {round.map((r, i) => { const a = answers[i]; return <li key={r.id} className={a ? (a.correct ? g.dotRight : g.dotWrong) : i === index ? g.dotNow : ''} /> })}
        </ol>
        <div className={g.hudStats}>
          <span><strong>{index + 1}</strong>/{round.length}</span>
          <span>{MODES.find((m) => m.key === q.mode)![locale]}</span>
        </div>
      </div>

      <article className={g.lyricCard} data-fm-id={q.id} data-fm-mode={q.mode}>
        <p className={g.lyricFrom}>{am ? 'ከመዝሙር' : 'From the Mezmur'} · <span lang="am">{titleLabel}</span></p>
        <h2 id="fm-q" className={g.srOnly}>{MODES.find((m) => m.key === q.mode)!.hint[locale]}</h2>

        {q.mode === 'choose' ? (
          <>
            {renderBlankLines()}
            <div className={g.choices}>
              {q.options!.map((o, i) => {
                const correct = o.key === q.correctKey
                const state = !answered ? '' : correct ? g.choiceRight : o.key === picked ? g.choiceWrong : g.choiceDim
                return (
                  <button key={o.key} type="button" className={`${g.choice} ${state}`} disabled={answered}
                    onClick={() => { setPicked(o.key); commit(correct) }}>
                    <span className={g.choiceKey} aria-hidden="true">{'ABCD'[i]}</span>
                    <LyricLine reading={reading} line={o} />
                  </button>
                )
              })}
            </div>
          </>
        ) : null}

        {q.mode === 'arrange' ? (
          <>
            {renderBlankLines()}
            <div className={g.arrangeTray} aria-label={am ? 'የተመረጡ ቃላት' : 'your answer'}>
              {arranged.length === 0 ? <span className={g.arrangeHint}>{am ? 'ቃላቱን በቅደም ተከተል ይንኩ' : 'Tap the words in order'}</span>
                : arranged.map((wi, pos) => <button key={pos} type="button" className={g.wordChosen} disabled={answered} onClick={() => setArranged((a) => a.filter((_, k) => k !== pos))} lang="am">{q.words![wi]}</button>)}
            </div>
            <div className={g.wordBank}>
              {q.shuffledWords!.map((w, si) => {
                // map shuffled position back to an original word index not yet used
                const originalIdx = q.words!.findIndex((ow, oi) => ow === w && !arranged.includes(oi) && q.words!.slice(0, oi).filter((x) => x === w).length === q.shuffledWords!.slice(0, si).filter((x) => x === w).length)
                const used = arranged.some((a) => q.words![a] === w) && originalIdx === -1
                return <button key={si} type="button" className={g.wordTile} disabled={answered || used || originalIdx === -1} onClick={() => originalIdx >= 0 && setArranged((a) => [...a, originalIdx])} lang="am">{w}</button>
              })}
            </div>
            {!answered ? (
              <div className={g.actions} style={{ justifyContent: 'flex-start' }}>
                <button className={g.primary} type="button" disabled={arranged.length !== q.words!.length}
                  onClick={() => { const correct = arranged.map((i) => q.words![i]).join(' ') === q.words!.join(' '); setRevealed(true); commit(correct) }}>
                  {am ? 'አረጋግጥ' : 'Check'}
                </button>
                <button className={g.secondary} type="button" onClick={() => setArranged([])}>{am ? 'አጽዳ' : 'Clear'}</button>
              </div>
            ) : null}
          </>
        ) : null}

        {q.mode === 'type' ? (
          <>
            {renderBlankLines()}
            {!answered ? (
              <form onSubmit={(e) => { e.preventDefault(); const correct = gradeTyped(typed, q.answer); setRevealed(true); commit(correct) }}>
                <input className={g.typeInput} value={typed} onChange={(e) => setTyped(e.target.value)}
                  placeholder={am ? 'የጎደለውን መስመር ይጻፉ…' : 'Type the missing line…'} lang={reading === 'amharic' ? 'am' : undefined}
                  autoComplete="off" autoCapitalize="off" spellCheck={false} aria-label={am ? 'የጎደለው መስመር' : 'missing line'} />
                <div className={g.actions} style={{ justifyContent: 'flex-start' }}>
                  <button className={g.primary} type="submit" disabled={!typed.trim()}>{am ? 'አረጋግጥ' : 'Check'}</button>
                  <button className={g.secondary} type="button" onClick={() => { setRevealed(true); commit(false) }}>{am ? 'አሳይ' : 'Reveal'}</button>
                </div>
              </form>
            ) : null}
          </>
        ) : null}

        {answered ? (
          <div className={`${g.feedback} ${answers[index]?.correct ? g.feedbackRight : g.feedbackWrong}`} role="status">
            <p className={g.feedbackTitle}>{answers[index]?.correct ? (am ? 'ትክክል!' : 'Correct!') : (am ? 'ትክክለኛው መስመር፦' : 'The line was:')}</p>
            {!answers[index]?.correct ? <p lang="am"><LyricLine reading={reading} line={q.answer} /></p> : null}
            <Link className={g.sourceLink} to={`/hymns/mezmur/${q.slug}`}>{am ? 'መዝሙሩን ይክፈቱ፦ ' : 'Open the Mezmur: '}{titleLabel}</Link>
            <button ref={nextRef} className={g.primary} type="button" onClick={next}>
              {index === round.length - 1 ? (am ? 'ውጤቱን ይመልከቱ' : 'See results') : (am ? 'ቀጣይ' : 'Next')} →
            </button>
          </div>
        ) : null}
      </article>
    </section>
  )
}
