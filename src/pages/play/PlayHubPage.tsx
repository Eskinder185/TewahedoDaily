import { useMemo } from 'react'
import { useUrlChoice } from '../../hooks/useUrlState'
import { Link, useSearchParams } from 'react-router-dom'
import { GameCard, type PlayGameCard } from '../../components/play/GameCard'
import { GameDifficultyPicker, type GameDifficulty } from '../../components/play/GameDifficultyPicker'
import { PlayProgressPanel } from '../../components/play/PlayProgressPanel'
import { useAuth } from '../../lib/auth/useAuth'
import { useLocale } from '../../lib/i18n/locale'
import { GAME_ART, handlePlayImageError, PLAY_IMAGES, imageById } from '../../lib/play/imageCatalog'
import { HUB_GAMES, HUB_SECTIONS, type HubSection } from '../../lib/play/gameCatalog'
import { GAME_MODES, GAME_MODE_IDS, gameInMode, recentGames, type GameModeId } from '../../lib/play/gameModes'
import { usePlayProgress } from '../../lib/play/usePlayProgress'
import styles from './PlayHubPage.module.css'

type Section = HubSection

type HubGame = PlayGameCard & { section: Section }

const GAMES: HubGame[] = HUB_GAMES
const SECTIONS = HUB_SECTIONS

const HERO_ICONS = ['gena', 'michael', 'timket'].map((id) => imageById(id)!)

export function PlayHubPage() {
  const { locale } = useLocale()
  const { session } = useAuth()
  const am = locale === 'am'
  const [difficulty, setDifficulty] = useUrlChoice<GameDifficulty>('level', 'beginner', ['beginner', 'growing', 'challenge'])
  const [filter] = useUrlChoice<Section | 'all'>('section', 'all', ['all', 'scripture', 'pictures', 'music', 'history', 'group'])
  const [mode] = useUrlChoice<GameModeId | 'all'>('mode', 'all', ['all', ...GAME_MODE_IDS])
  const [params, setParams] = useSearchParams()
  const progress = usePlayProgress()
  const recent = recentGames(progress.history)
  const visible = useMemo(() => GAMES.filter((game) => (filter === 'all' || game.section === filter) && gameInMode(game.id, mode)), [filter, mode])
  const modeHref = (id: string) => {
    const next = new URLSearchParams(params); next.delete('section')
    if (id === 'all') next.delete('mode'); else next.set('mode', id)
    return { pathname: '/play', search: next.toString(), hash: '#games' }
  }
  const selectSection = (section: string) => {
    const next = new URLSearchParams(params); next.delete('mode')
    if (section === 'all') next.delete('section'); else next.set('section', section)
    setParams(next)
  }

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
              <li><strong>{PLAY_IMAGES.length}</strong>{am ? 'የተረጋገጡ ሥዕሎች' : 'verified icons'}</li>
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
            <p className={styles.eyebrowLight}>{am ? 'ተለዋዋጭ ጨዋታዎች' : 'Featured · a different way to play'}</p>
            <h2 id="gn-title">{am ? 'የተቀላቀለ ፈተና ምሽት' : 'Mixed Challenge Night'}</h2>
            <p>{am ? 'በአንድ ማያ ገጽ የተለያዩ ጨዋታዎችን አብረው ይሞክሩ። የተቀላቀለ የብዙ ተጫዋች ክፍል ገና አይደገፍም።' : 'Try a five-round shared-screen guide through different games. Mixed-mechanic multiplayer rooms are not available yet.'}</p>
            <Link className={styles.primaryActionLight} to="/play/game-night?view=mixed">{am ? 'መመሪያውን ይክፈቱ' : 'Explore the evening'} →</Link>
          </div>
        </section>
        <section className={styles.modeSection} aria-labelledby="modes-title">
          <div className={styles.sectionHeading}><div><p className={styles.eyebrow}>{am ? 'እንዴት መጫወት ይፈልጋሉ?' : 'How do you want to play?'}</p>
            <h2 id="modes-title">{am ? 'አምስት የጨዋታ መንገዶች' : 'Five ways to discover'}</h2></div></div>
          <nav className={styles.modeGrid} aria-label={am ? 'የጨዋታ ሁነታዎች' : 'Game modes'}>
            {GAME_MODES.map(entry => <Link key={entry.id} data-play-mode={entry.id} className={styles.modeCard} to={modeHref(entry.id)} aria-current={mode === entry.id ? 'page' : undefined}>
              <span className={styles.modeIcon} aria-hidden="true">{entry.icon}</span><h3>{entry[locale]}</h3><p>{entry.description[locale]}</p>
              <small>{GAMES.filter(game => gameInMode(game.id, entry.id)).map(game => game.title[locale]).join(' · ')}</small>
              <strong>{am ? 'ጨዋታዎችን ይመልከቱ' : 'Explore games'} →</strong>
            </Link>)}
          </nav>
        </section>

        {/* ---------- All games ---------- */}
        <section className={styles.gamesSection} id="games" aria-labelledby="games-title">
          <div className={styles.sectionHeading}>
            <div>
              <p className={styles.eyebrow}>{GAMES.length} {am ? 'ጨዋታዎች' : 'games'}</p>
              <h2 id="games-title">{mode === 'all' ? (am ? 'ሁሉም 12 ጨዋታዎች' : 'All 12 Games') : GAME_MODES.find(entry => entry.id === mode)?.[locale]}</h2>
              <p>{am ? 'ሥዕሎች፣ መጽሐፍ ቅዱስ፣ መዝሙር፣ ታሪክና የቡድን ጨዋታ — ሁሉም በአንድ ቦታ።' : 'Icons, Scripture, Mezmur, history and group play — all in one place.'}</p>
            </div>
            <GameDifficultyPicker locale={locale} value={difficulty} onChange={setDifficulty} />
          </div>
          <Link className={styles.allGamesLink} to={modeHref('all')}>{am ? 'ሁሉንም 12 ጨዋታዎች አሳይ' : 'Show all 12 games'}</Link>
          <details open={params.has('section')}><summary>{am ? 'በርዕስ ያጣሩ' : 'Browse by topic'}</summary>
          <div className={styles.filters} role="group" aria-label={am ? 'ጨዋታዎችን አጣራ' : 'Filter games'}>
            {SECTIONS.map((category) => (
              <button key={category.id} type="button" aria-pressed={filter === category.id} onClick={() => selectSection(category.id)}>{category.label[locale]}</button>
            ))}
          </div></details>
          <p className={styles.levelNote} aria-live="polite">
            {am ? `${visible.length} ጨዋታዎች። ` : `${visible.length} games available. `}
            {am ? 'ደረጃው በጥያቄ ጨዋታዎች ላይ ይተገበራል።' : 'Your level applies to the question games (Trivia, Emoji, Verse, History).'}
          </p>
          {!visible.length && <p>{am ? 'ከእነዚህ ማጣሪያዎች ጋር የሚዛመድ ጨዋታ የለም። ሁሉንም ጨዋታዎች ይመልከቱ።' : 'No games match these filters. Choose “Show all 12 games” to explore the library.'}</p>}
          <div className={styles.gameGrid}>
            {visible.map((game) => <GameCard key={game.id} game={game} locale={locale} level={difficulty} />)}
          </div>
        </section>

        <section className={styles.dashboard} aria-label={am ? 'የተጫዋች ገጽ' : 'Your progress'}>
          <PlayProgressPanel locale={locale} signedIn={Boolean(session)} />
          <aside className={styles.recentGames}><h2>{am ? 'መጫወትዎን ይቀጥሉ' : 'Keep exploring'}</h2>
            <p>{am ? 'የተጠናቀቁ ጨዋታዎችን እንደገና ይጀምሩ።' : 'Replay a recent game. Completed results are saved; partial rounds are not resumed.'}</p>
            {recent.map(id => GAMES.find(game => game.id === id || (game.id === 'mezmur' && id === 'finish-the-mezmur'))).filter((game): game is HubGame => !!game).map(game => <Link key={game.id} to={game.route}>{game.title[locale]} →</Link>)}
            <Link to="/play/trivia?daily=1">{am ? 'የዕለቱ ፈተና' : 'Daily challenge'} →</Link>
            <Link to="/play/game-night">{am ? 'የጨዋታ ምሽት ይክፈቱ' : 'Host or join Game Night'} →</Link>
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
