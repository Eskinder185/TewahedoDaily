import { useMemo, useState, type FormEvent } from 'react'
import { useUrlChoice } from '../../hooks/useUrlState'
import { Link, useNavigate, useSearchParams } from 'react-router-dom'
import { GameCard, type PlayGameCard } from '../../components/play/GameCard'
import { GameDifficultyPicker, type GameDifficulty } from '../../components/play/GameDifficultyPicker'
import { PlayProgressPanel } from '../../components/play/PlayProgressPanel'
import { useAuth } from '../../lib/auth/useAuth'
import { useLocale } from '../../lib/i18n/locale'
import { GAME_ART, handlePlayImageError, imageById } from '../../lib/play/imageCatalog'
import { describeContent, progressSummary, totalsByUnit } from '../../lib/play/contentRegistry'
import { HUB_GAMES, type HubSection } from '../../lib/play/gameCatalog'
import { GAME_MODES, GAME_MODE_IDS, gameInMode, recentGames, type GameModeId } from '../../lib/play/gameModes'
import { usePlayProgress } from '../../lib/play/usePlayProgress'
import { resumableGames } from '../../lib/play/playSession'
import styles from './PlayHubPage.module.css'

type Section = HubSection

type HubGame = PlayGameCard & { section: Section }

const GAMES: HubGame[] = HUB_GAMES

/** Games that can also be hosted as a live room (see src/lib/play/liveRoom.ts). */
const LIVE_HUB_GAMES = new Set(['trivia', 'finish-the-verse', 'emoji', 'who-am-i'])

const HERO_ICONS = ['gena', 'michael', 'timket'].map((id) => imageById(id)!)

export function PlayHubPage() {
  const { locale } = useLocale()
  const { session } = useAuth()
  const am = locale === 'am'
  const [difficulty, setDifficulty] = useUrlChoice<GameDifficulty>('level', 'beginner', ['beginner', 'growing', 'challenge'])
  const [filter] = useUrlChoice<Section | 'all'>('section', 'all', ['all', 'scripture', 'pictures', 'music', 'history', 'group'])
  const [mode] = useUrlChoice<GameModeId | 'all'>('mode', 'all', ['all', ...GAME_MODE_IDS])
  const [params] = useSearchParams()
  const progress = usePlayProgress()
  const recent = recentGames(progress.history)
  const navigate = useNavigate()
  const resume = useMemo(() => resumableGames(['trivia', 'finish-the-verse', 'emoji']), [])
  const quickGame = GAMES.find(game => game.id === 'trivia') ?? GAMES[0]
  const [roomCode, setRoomCode] = useState('')
  const [roomError, setRoomError] = useState('')
  const joinRoom = (event: FormEvent) => {
    event.preventDefault()
    const clean = roomCode.trim().toUpperCase().replace(/[^A-Z0-9]/g, '')
    if (clean.length !== 5) { setRoomError(am ? 'የክፍል ኮድ 5 ፊደላት ወይም ቁጥሮች ነው።' : 'A room code is 5 letters or numbers.'); return }
    navigate(`/play/live/${clean}`)
  }
  const surprise = () => {
    const pool = GAMES.filter(game => !game.unavailable)
    const game = pool[Math.floor(Math.random() * pool.length)]
    navigate(`${game.route}${game.levels ? `?level=${difficulty}` : ''}`)
  }
  const visible = useMemo(() => GAMES.filter((game) => (filter === 'all' || game.section === filter) && gameInMode(game.id, mode)), [filter, mode])
  const modeHref = (id: string) => {
    const next = new URLSearchParams(params); next.delete('section')
    if (id === 'all') next.delete('mode'); else next.set('mode', id)
    return { pathname: '/play', search: next.toString(), hash: '#games' }
  }
  const activeMode = GAME_MODES.find(entry => entry.id === mode)
  const totals = totalsByUnit()
  const quizItems = (totals.questions ?? 0) + (totals.clues ?? 0) + (totals.excerpts ?? 0)

  return (
    <div className={styles.page} lang={locale}>
      {/* ---------- Hero ---------- */}
      <section className={styles.hero} aria-labelledby="play-title">
        <div className={styles.heroGlow} aria-hidden="true" />
        <div className={styles.heroInner}>
          <div className={styles.heroCopy}>
            <p className={styles.eyebrow}><span aria-hidden="true">✠</span>{am ? 'ተዋሕዶ ጨዋታ' : 'Tewahedo Play'}</p>
            <h1 id="play-title">{am ? 'እምነትን በጨዋታ ይማሩ።' : <>Learn the faith <em>through play.</em></>}</h1>
            <p className={styles.heroIntro}>
              {am
                ? 'ቅዱሳንን ከሥዕላቸው ይለዩ፣ በዓላትን ያስታውሱ፣ ጥቅሶችን ይጨርሱ። እያንዳንዱ መልስ ከመጽሐፍ ቅዱስና ከቤተ ክርስቲያን የቀን መቁጠሪያ ምንጭ ጋር ይያያዛል።'
                : 'Recognise the saints from their icons, name the feasts, finish the verses. Every answer links back to Scripture or the Church calendar on TewahedoDaily.'}
            </p>
            <div className={styles.heroActions}>
              <a className={styles.primaryAction} href="#games">
                {am ? 'መጫወት ይጀምሩ' : 'Start playing'}
                <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" strokeWidth="2.2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true"><path d="M12 5v14M6 13l6 6 6-6" /></svg>
              </a>
              <Link className={styles.secondaryAction} to="/play/trivia?daily=1">{am ? 'የዕለቱ ፈተና' : 'Today’s challenge'}</Link>
            </div>
            <ul className={styles.heroFacts}>
              <li><strong>{GAMES.length}</strong>{am ? 'ጨዋታዎች' : 'games'}</li>
              <li><strong>{quizItems}</strong>{am ? 'ጥያቄዎች፣ ፍንጮችና ጥቅሶች' : 'questions, clues & verses'}</li>
              <li><strong>2</strong>{am ? 'ቋንቋዎች' : 'languages'}</li>
            </ul>
            <p className={styles.guestBadge}><span aria-hidden="true">●</span>{am ? 'እንግዳ ጨዋታ · መለያ አያስፈልግም' : 'Guest play · no account required'}</p>
          </div>
          <div className={styles.heroArt} aria-hidden="true">
            {HERO_ICONS.map((img, i) => (
              <figure key={img.id} className={styles.heroIcon} style={{ ['--i' as string]: i }}>
                <img src={img.src} alt="" onError={(event) => handlePlayImageError(event, img.fallbackSrc)} style={{ objectPosition: img.focus }} fetchPriority={i === 1 ? 'high' : 'auto'} />
                <figcaption>{img.answer[locale] ?? img.answer.en}</figcaption>
              </figure>
            ))}
          </div>
        </div>
      </section>

      <div className={styles.content}>
        <section className={styles.gameNight} aria-labelledby="gn-title">
          {GAME_ART['game-night'].src ? <img src={GAME_ART['game-night'].src} alt="" loading="lazy" onError={(event) => handlePlayImageError(event, GAME_ART['game-night'].fallbackSrc)} /> : null}
          <div className={styles.gameNightInner}>
            <p className={styles.eyebrowLight}>{am ? 'ጨዋታ ምሽት · ከጓደኞች ጋር' : 'Game Night · play together'}</p>
            <h2 id="gn-title">{am ? 'የጨዋታ ምሽት ይክፈቱ' : 'Host a Game Night'}</h2>
            <p>{am ? 'ጨዋታ ይምረጡ፣ ኮዱን ያጋሩ፣ ሁሉም ከራሱ ስልክ ይመልሳል። መለያ አያስፈልግም።' : 'Pick a game, share the code, and everyone answers on their own phone. No account needed.'}</p>
            <ol className={styles.gnSteps}>
              <li><b>1</b>{am ? 'ክፍል ይክፈቱ' : 'Open a room'}</li>
              <li><b>2</b>{am ? 'ኮዱን ያጋሩ' : 'Share the code'}</li>
              <li><b>3</b>{am ? 'አብራችሁ ተጫወቱ' : 'Play together'}</li>
            </ol>
            <div className={styles.gnActions}>
              <Link className={styles.primaryActionLight} to="/play/live" data-host>📣 {am ? 'የጨዋታ ምሽት ይክፈቱ' : 'Host a Game Night'} →</Link>
              <form className={styles.gnJoin} onSubmit={joinRoom} aria-label={am ? 'በኮድ ይቀላቀሉ' : 'Join with a code'}>
                <label>{am ? 'ኮድ አለዎት?' : 'Have a code?'}
                  <input value={roomCode} maxLength={8} autoCapitalize="characters" autoComplete="off" placeholder="ABCDE" onChange={(event) => { setRoomCode(event.target.value.toUpperCase()); setRoomError('') }} aria-invalid={roomError ? true : undefined} />
                </label>
                <button type="submit" data-join>{am ? 'ይቀላቀሉ' : 'Join'}</button>
              </form>
              {roomError ? <p className={styles.gnError} role="alert">{roomError}</p> : null}
            </div>
          </div>
        </section>
        <section className={styles.startStrip} aria-label={am ? 'መጫወት ይጀምሩ' : 'Start playing'} data-play-actions>
          <Link className={styles.stripPrimary} to={`${quickGame.route}${quickGame.levels ? `?level=${difficulty}` : ''}`} data-play-now>▶ {am ? 'አሁን ይጫወቱ' : 'Play now'}<small>{quickGame.title[locale]}</small></Link>
          <button type="button" className={styles.stripButton} onClick={surprise} data-surprise>🎲 {am ? 'አስገርመኝ' : 'Surprise me'}<small>{am ? 'በዘፈቀደ የተመረጠ ጨዋታ' : 'A random game'}</small></button>
          <a className={styles.stripButton} href="#games" data-play-solo>👤 {am ? 'ብቻዎን' : 'Play solo'}<small>{am ? `ከ${GAMES.length} ጨዋታዎች ይምረጡ` : `Pick any of ${GAMES.length} games`}</small></a>
          {resume.length ? <div className={styles.resumeRow} data-resume>{resume.map(item => { const game = GAMES.find(g => g.id === item.game || (g.id === 'mezmur' && item.game === 'finish-the-mezmur')); return game ? <Link key={item.game} to={game.route}>↻ {am ? 'ቀጥሉ' : 'Continue'} {game.title[locale]} ({item.done}/{item.total})</Link> : null })}</div> : null}
        </section>

        {/* ---------- All games: one grid, with ways to play as filters ---------- */}
        <section className={styles.gamesSection} id="games" aria-labelledby="games-title">
          <div className={styles.sectionHeading}>
            <div>
              <p className={styles.eyebrow}>{visible.length === GAMES.length ? (am ? `${GAMES.length} ጨዋታዎች` : `${GAMES.length} games`) : (am ? `${visible.length} ከ${GAMES.length} ጨዋታዎች` : `${visible.length} of ${GAMES.length} games`)}</p>
              <h2 id="games-title">{activeMode ? activeMode[locale] : (am ? `ሁሉም ${GAMES.length} ጨዋታዎች` : `All ${GAMES.length} games`)}</h2>
            </div>
            <GameDifficultyPicker locale={locale} value={difficulty} onChange={setDifficulty} />
          </div>
          <nav className={styles.modeChips} aria-label={am ? 'የጨዋታ መንገዶች' : 'Ways to play'}>
            <Link data-play-mode="all" className={`${styles.modeChip} ${!activeMode && filter === 'all' ? styles.modeChipActive : ''}`} to={modeHref('all')} aria-current={!activeMode && filter === 'all' ? 'page' : undefined}>{am ? 'ሁሉም' : 'All'} · {GAMES.length}</Link>
            {GAME_MODES.map(entry => <Link key={entry.id} data-play-mode={entry.id} className={`${styles.modeChip} ${mode === entry.id ? styles.modeChipActive : ''}`} to={modeHref(entry.id)} aria-current={mode === entry.id ? 'page' : undefined}><span aria-hidden="true">{entry.icon}</span> {entry[locale]} · {GAMES.filter(game => gameInMode(game.id, entry.id)).length}</Link>)}
          </nav>
          {activeMode ? <p className={styles.modeNote}>{activeMode.description[locale]}</p> : null}
          <p className={styles.levelNote} aria-live="polite">
            {am ? 'ደረጃው በጥያቄ ጨዋታዎች ላይ ይተገበራል።' : 'Your level applies to the question games (Trivia, Emoji, Verse, History).'}
          </p>
          {!visible.length && <p>{am ? 'ከእነዚህ ማጣሪያዎች ጋር የሚዛመድ ጨዋታ የለም።' : 'No games match this choice. Choose “All” above.'}</p>}
          <div className={styles.gameGrid}>
            {visible.map((game) => <GameCard key={game.id} game={{ ...game, ...(LIVE_HUB_GAMES.has(game.id) ? { badge: { en: 'Solo + Live room', am: 'ብቻ + የቀጥታ ክፍል' } } : {}), content: describeContent(game.id, locale) ?? undefined, progress: progressSummary(progress.history, game.id) ?? undefined }} locale={locale} level={difficulty} />)}
          </div>
        </section>

        <section className={styles.dashboard} aria-label={am ? 'የተጫዋች ገጽ' : 'Your progress'}>
          <PlayProgressPanel locale={locale} signedIn={Boolean(session)} />
          <aside className={styles.recentGames}><h2>{am ? 'መጫወትዎን ይቀጥሉ' : 'Keep exploring'}</h2>
            <p>{am ? 'የተጠናቀቁ ጨዋታዎችን እንደገና ይጀምሩ።' : 'Replay a recent game. Completed results are saved; partial rounds are not resumed.'}</p>
            {recent.map(id => GAMES.find(game => game.id === id || (game.id === 'mezmur' && id === 'finish-the-mezmur'))).filter((game): game is HubGame => !!game).map(game => <Link key={game.id} to={game.route}>{game.title[locale]} →</Link>)}
            <Link to="/play/trivia?daily=1">{am ? 'የዕለቱ ፈተና' : 'Daily challenge'} →</Link>
            <Link to="/play/live">{am ? 'ከጓደኞች ጋር ይጫወቱ' : 'Host or join a live room'} →</Link>
            <Link to="/play/game-night?view=mixed">{am ? 'የተቀላቀለ ምሽት መመሪያ' : 'Mixed night guide'} →</Link>
          </aside>
        </section>

        {/* ---------- Trust ---------- */}
        <section className={styles.trust} aria-labelledby="trust-title">
          <h2 id="trust-title">{am ? 'ለታማኝ ትምህርት የተዘጋጀ' : 'Made for trustworthy learning'}</h2>
          <ul>
            <li><b aria-hidden="true">✓</b><span><strong>{am ? 'ምንጭ ያለው መልስ' : 'Every answer is sourced'}</strong>{am ? 'ከመጽሐፍ ቅዱስ ወይም ከቀን መቁጠሪያው' : 'Linked to Scripture or the Church calendar'}</span></li>
            <li><b aria-hidden="true">ፊ</b><span><strong>{am ? 'አማርኛና እንግሊዝኛ' : 'English & Amharic'}</strong>{am ? 'በሁለቱም ቋንቋዎች' : 'Switch language any time'}</span></li>
            <li><b aria-hidden="true">◷</b><span><strong>{am ? 'ያለ ጫና' : 'No pressure'}</strong>{am ? 'ሰዓት ቆጣሪ አማራጭ ነው' : 'Timers are always optional'}</span></li>
          </ul>
          {!session ? <Link to="/login">{am ? 'ለግል የጨዋታ ክፍል ይግቡ' : 'Sign in to host a private room'} →</Link> : null}
        </section>
      </div>
    </div>
  )
}
