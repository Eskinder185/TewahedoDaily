import { useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { GameCard, type PlayGameCard } from '../../components/play/GameCard'
import { GameDifficultyPicker, type GameDifficulty } from '../../components/play/GameDifficultyPicker'
import { PlayProgressPanel } from '../../components/play/PlayProgressPanel'
import { useAuth } from '../../lib/auth/useAuth'
import { useLocale, type AppLocale } from '../../lib/i18n/locale'
import { GAME_ART, PLAY_IMAGES, imageById } from '../../lib/play/imageCatalog'
import styles from './PlayHubPage.module.css'

type Section = 'scripture' | 'pictures' | 'music' | 'history' | 'group'

type HubGame = PlayGameCard & { section: Section }

const t = (en: string, am: string) => ({ en, am })

const GAMES: HubGame[] = [
  { id: 'feasts', section: 'pictures', route: '/play/feasts', art: GAME_ART.feasts, badge: t('New', 'አዲስ'),
    title: t('Church Feast Challenge', 'የበዓላት ፈተና'), category: t('Pictures', 'ሥዕሎች'),
    description: t('Name the feast from its icon or photograph — Gena, Timket, Meskel and more.', 'በዓሉን ከሥዕሉ ይለዩ — ገና፣ ጥምቀት፣ መስቀልና ሌሎችም።'),
    meta: t('12 feasts · reveal mode', '12 በዓላት · የመግለጥ ሁነታ') },
  { id: 'saints', section: 'pictures', route: '/play/saints', art: GAME_ART.saints, badge: t('New', 'አዲስ'),
    title: t('Guess the Saint', 'ቅዱሱን ይለዩ'), category: t('Pictures', 'ሥዕሎች'),
    description: t('Recognise the archangels and saints of the Church from their icons.', 'ሊቃነ መላእክትንና ቅዱሳንን ከሥዕላቸው ይለዩ።'),
    meta: t('10 icons', '10 ሥዕሎች') },
  { id: 'icon-memory', section: 'pictures', route: '/play/icon-memory', art: GAME_ART['icon-memory'], badge: t('New', 'አዲስ'),
    title: t('Icon Memory', 'የሥዕል ትውስታ'), category: t('Pictures', 'ሥዕሎች'),
    description: t('Turn the cards and match every holy picture with its name.', 'ካርዶቹን ገልጠው ቅዱስ ሥዕልን ከስሙ ጋር ያዛምዱ።'),
    meta: t('4–8 pairs', '4–8 ጥንዶች') },
  { id: 'trivia', section: 'scripture', route: '/play/trivia', art: GAME_ART.trivia, levels: true,
    title: t('Bible & Tewahedo Trivia', 'የመጽሐፍ ቅዱስና ተዋሕዶ ጥያቄ'), category: t('Scripture', 'መጽሐፍ ቅዱስ'),
    description: t('Sourced questions, clear explanations, and a pace you choose.', 'ምንጭ ያላቸው ጥያቄዎች፣ ግልጽ ማብራሪያና በሚመርጡት ፍጥነት።'),
    meta: t('5–20 questions', '5–20 ጥያቄዎች') },
  { id: 'emoji', section: 'scripture', route: '/play/emoji', art: GAME_ART.emoji, levels: true,
    title: t('Holy Emoji Challenge', 'የቅዱስ ኢሞጂ ፈተና'), category: t('Scripture', 'መጽሐፍ ቅዱስ'),
    description: t('Decode emoji clues to Bible stories. Fewer hints, stronger round.', 'የኢሞጂ ፍንጮችን ወደ መጽሐፍ ቅዱስ ታሪኮች ይፍቱ።'),
    meta: t('Hints available', 'ፍንጭ አለ') },
  { id: 'finish-the-verse', section: 'scripture', route: '/play/finish-the-verse', art: GAME_ART['finish-the-verse'], levels: true,
    title: t('Finish the Verse', 'ጥቅሱን ይጨርሱ'), category: t('Scripture', 'መጽሐፍ ቅዱስ'),
    description: t('Complete exact excerpts from the English and Amharic Bible.', 'ከእንግሊዝኛና ከአማርኛ መጽሐፍ ቅዱስ ጥቅሶችን ያሟሉ።'),
    meta: t('English + አማርኛ', 'አማርኛ + English') },
  { id: 'adventures', section: 'scripture', route: '/play/adventures', art: GAME_ART.adventures,
    title: t('Bible Adventure', 'የመጽሐፍ ቅዱስ ጀብዱ'), category: t('Story', 'ታሪክ'),
    description: t('Walk through Exodus 14 in three scenes with learning checkpoints.', 'ዘፀአት 14ን በሦስት ትዕይንቶች ይጓዙ።'),
    meta: t('1 chapter · 3 scenes', '1 ምዕራፍ · 3 ትዕይንቶች') },
  { id: 'mezmur', section: 'music', route: '/play/finish-the-mezmur', art: GAME_ART['finish-the-mezmur'],
    title: t('Finish the Mezmur', 'መዝሙሩን ይጨርሱ'), category: t('Mezmur', 'መዝሙር'),
    description: t('Lyrics, titles and occasions from verified Mezmur records.', 'ከተረጋገጡ የመዝሙር መዝገቦች ግጥም፣ ርዕስና አጋጣሚ።') },
  { id: 'history', section: 'history', route: '/play/history', art: GAME_ART.history, levels: true,
    title: t('History Quest', 'የታሪክ ጉዞ'), category: t('History', 'ታሪክ'),
    description: t('Order the councils and meet figures of Ethiopian and world Church history.', 'ጉባኤያትን በቅደም ተከተል ያስቀምጡ፣ የታሪክ ሰዎችን ያግኙ።'),
    meta: t('Timeline + quiz', 'የጊዜ መስመር + ጥያቄ') },
  { id: 'who-am-i', section: 'group', route: '/play/who-am-i', art: GAME_ART['who-am-i'],
    title: t('Who Am I?', 'እኔ ማን ነኝ?'), category: t('Group play', 'የቡድን ጨዋታ'),
    description: t('A fast guessing game for families and youth groups.', 'ለቤተሰብና ለወጣቶች ፈጣን የግምት ጨዋታ።'),
    meta: t('60-second rounds', '60 ሰከንድ ዙሮች') },
  { id: 'match', section: 'group', route: '/play/match', art: GAME_ART.match,
    title: t('Match & Discover', 'ያዛምዱና ያግኙ'), category: t('Learning', 'ትምህርት'),
    description: t('Pair people with the moments Scripture remembers them for.', 'ሰዎችን ቅዱስ መጽሐፍ ከሚያስታውሳቸው ክስተቶች ጋር ያዛምዱ።'),
    meta: t('4–8 pairs', '4–8 ጥንዶች') },
]

const SECTIONS: { id: Section | 'all'; label: Record<AppLocale, string> }[] = [
  { id: 'all', label: t('All games', 'ሁሉም') },
  { id: 'pictures', label: t('Icons & feasts', 'ሥዕሎችና በዓላት') },
  { id: 'scripture', label: t('Scripture', 'መጽሐፍ ቅዱስ') },
  { id: 'music', label: t('Mezmur', 'መዝሙር') },
  { id: 'history', label: t('History', 'ታሪክ') },
  { id: 'group', label: t('Family & group', 'ቤተሰብና ቡድን') },
]

const HERO_ICONS = ['gena', 'michael', 'timket'].map((id) => imageById(id)!)

export function PlayHubPage() {
  const { locale } = useLocale()
  const { session } = useAuth()
  const am = locale === 'am'
  const [difficulty, setDifficulty] = useState<GameDifficulty>('beginner')
  const [filter, setFilter] = useState<Section | 'all'>('all')
  const featured = GAMES.filter((g) => g.section === 'pictures')
  const visible = useMemo(() => GAMES.filter((g) => filter === 'all' || g.section === filter), [filter])

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
                <img src={img.src} alt="" style={{ objectPosition: img.focus }} fetchPriority={i === 1 ? 'high' : 'auto'} />
                <figcaption>{img.answer[locale] ?? img.answer.en}</figcaption>
              </figure>
            ))}
          </div>
        </div>
      </section>

      <div className={styles.content}>
        {/* ---------- Journey + daily ---------- */}
        <section className={styles.dashboard} aria-label={am ? 'የተጫዋች ገጽ' : 'Your progress'}>
          <PlayProgressPanel locale={locale} signedIn={Boolean(session)} />
          <Link className={styles.dailyCard} to="/play/trivia?daily=1">
            <img src={GAME_ART.trivia.src} alt="" loading="lazy" style={{ objectPosition: GAME_ART.trivia.focus }} />
            <div>
              <p className={styles.eyebrowLight}>{am ? 'የዕለቱ ፈተና' : 'Daily challenge'}</p>
              <h2>{am ? 'አንድ ጥያቄ፣ አንድ ጥቅስ፣ አምስት ደቂቃ' : 'One question. One source. Five minutes.'}</h2>
              <p>{am ? 'በየቀኑ ከተገመገሙ ጥያቄዎች አንዱ ይቀርባል። ተከታታይ ቀናትዎን ይጠብቁ።' : 'A new reviewed question every day. Keep your streak gently going.'}</p>
              <span className={styles.dailyAction}>{am ? 'ይጫወቱ' : 'Play today’s'} →</span>
            </div>
          </Link>
        </section>

        {/* ---------- Featured: picture games ---------- */}
        <section className={styles.featured} aria-labelledby="featured-title">
          <div className={styles.sectionHeading}>
            <div>
              <p className={styles.eyebrow}>{am ? 'አዲስ' : 'New'}</p>
              <h2 id="featured-title">{am ? 'ሥዕሎችና በዓላት' : 'Icons & feasts'}</h2>
              <p>{am ? 'የቤተ ክርስቲያን ሥዕሎች ራሳቸው ጨዋታው ናቸው። እያንዳንዱ ሥዕል ከቀን መቁጠሪያው ጋር ተረጋግጧል።' : 'The Church’s own icons are the game. Each picture is checked against the TewahedoDaily calendar before it appears.'}</p>
            </div>
          </div>
          <div className={styles.featuredGrid}>
            {featured.map((game) => <GameCard key={game.id} game={game} locale={locale} size="feature" />)}
          </div>
        </section>

        {/* ---------- All games ---------- */}
        <section className={styles.gamesSection} id="games" aria-labelledby="games-title">
          <div className={styles.sectionHeading}>
            <div>
              <p className={styles.eyebrow}>{am ? 'መንገድዎን ይምረጡ' : 'Choose your path'}</p>
              <h2 id="games-title">{am ? 'ሁሉም ጨዋታዎች' : 'Every game'}</h2>
            </div>
            <GameDifficultyPicker locale={locale} value={difficulty} onChange={setDifficulty} />
          </div>
          <div className={styles.filters} role="group" aria-label={am ? 'ጨዋታዎችን አጣራ' : 'Filter games'}>
            {SECTIONS.map((category) => (
              <button key={category.id} type="button" aria-pressed={filter === category.id} onClick={() => setFilter(category.id)}>{category.label[locale]}</button>
            ))}
          </div>
          <p className={styles.levelNote} aria-live="polite">
            {am ? 'ደረጃው በጥያቄ ጨዋታዎች ላይ ይተገበራል።' : 'Your level applies to the question games (Trivia, Emoji, Verse, History).'}
          </p>
          <div className={styles.gameGrid}>
            {visible.map((game) => <GameCard key={game.id} game={game} locale={locale} level={difficulty} />)}
          </div>
        </section>

        {/* ---------- Game Night ---------- */}
        <section className={styles.gameNight} aria-labelledby="gn-title">
          <img src={GAME_ART['game-night'].src} alt="" loading="lazy" style={{ objectPosition: GAME_ART['game-night'].focus }} />
          <div className={styles.gameNightInner}>
            <p className={styles.eyebrowLight}>{am ? 'ለቤተሰብና ለሰበካ' : 'For families & parishes'}</p>
            <h2 id="gn-title">{am ? 'የጨዋታ ምሽት' : 'Game Night'}</h2>
            <p>{am ? 'የግል ክፍል ይፍጠሩ፣ አጭር ኮድ ያጋሩ፣ ሁሉም ከስልካቸው አብረው ይመልሳሉ።' : 'Open a private room, share a short code, and answer together from everyone’s phone.'}</p>
            <Link className={styles.primaryActionLight} to="/play/game-night">{am ? 'የጨዋታ ምሽት ይክፈቱ' : 'Open Game Night'} →</Link>
          </div>
        </section>

        {/* ---------- Trust ---------- */}
        <section className={styles.trust} aria-labelledby="trust-title">
          <h2 id="trust-title">{am ? 'ለታማኝ ትምህርት የተዘጋጀ' : 'Made for trustworthy learning'}</h2>
          <ul>
            <li><b aria-hidden="true">✓</b><span><strong>{am ? 'ምንጭ ያለው መልስ' : 'Every answer is sourced'}</strong>{am ? 'ከመጽሐፍ ቅዱስ ወይም ከቀን መቁጠሪያው' : 'Linked to Scripture or the Church calendar'}</span></li>
            <li><b aria-hidden="true">ፊ</b><span><strong>{am ? 'አማርኛና እንግሊዝኛ' : 'English & Amharic'}</strong>{am ? 'በሁለቱም ቋንቋዎች' : 'Switch language any time'}</span></li>
            <li><b aria-hidden="true">◷</b><span><strong>{am ? 'ያለ ጫና' : 'No pressure'}</strong>{am ? 'ሰዓት ቆጣሪ አማራጭ ነው' : 'Timers are always optional'}</span></li>
          </ul>
          {!session ? <Link to="/login">{am ? 'እድገትዎን በሁሉም መሣሪያ ለማስቀመጥ ይግቡ' : 'Sign in to keep your progress across devices'} →</Link> : null}
        </section>
      </div>
    </div>
  )
}
