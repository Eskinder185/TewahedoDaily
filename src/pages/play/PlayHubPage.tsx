import { useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { GameCard, type PlayGameCard } from '../../components/play/GameCard'
import {
  GameDifficultyPicker,
  type GameDifficulty,
} from '../../components/play/GameDifficultyPicker'
import { PlayProgressPanel } from '../../components/play/PlayProgressPanel'
import { useAuth } from '../../lib/auth/useAuth'
import { useLocale, type AppLocale } from '../../lib/i18n/locale'
import styles from './PlayHubPage.module.css'

type Copy = {
  eyebrow: string
  title: string
  intro: string
  guestBadge: string
  explore: string
  howItWorks: string
  gamesEyebrow: string
  gamesTitle: string
  gamesIntro: string
  all: string
  scripture: string
  music: string
  history: string
  party: string
  dailyEyebrow: string
  dailyTitle: string
  dailyBody: string
  dailyStatus: string
  topicsEyebrow: string
  topicsTitle: string
  gameNightEyebrow: string
  gameNightTitle: string
  gameNightBody: string
  gameNightStatus: string
  valuesTitle: string
  valueVerified: string
  valueBilingual: string
  valueGentle: string
  accountLink: string
}

const COPY: Record<AppLocale, Copy> = {
  en: {
    eyebrow: 'A new way to learn together',
    title: 'Discover the faith through play.',
    intro: 'Short challenges, family games, and guided adventures—built from reviewed TewahedoDaily sources in English and Amharic.',
    guestBadge: 'Guest play · no account required',
    explore: 'Explore the game center',
    howItWorks: 'See how learning content is reviewed',
    gamesEyebrow: 'Choose your path',
    gamesTitle: 'Games for every kind of learner',
    gamesIntro: 'Preview the catalog by level and topic. Playable routes unlock only after reviewed content is ready.',
    all: 'All games',
    scripture: 'Scripture',
    music: 'Mezmur',
    history: 'History',
    party: 'Group play',
    dailyEyebrow: 'Daily challenge',
    dailyTitle: 'A thoughtful five-minute practice',
    dailyBody: 'Daily challenges will rotate only through reviewed, published questions. No generated theology and no pressure to keep a streak.',
    dailyStatus: 'Available now · one gentle sourced question',
    topicsEyebrow: 'Learning map',
    topicsTitle: 'Featured topics',
    gameNightEyebrow: 'For families & parishes',
    gameNightTitle: 'Game Night',
    gameNightBody: 'Create a private room, share a short code, and answer together from phones with server-validated scoring.',
    gameNightStatus: 'Private rooms · server-validated scoring',
    valuesTitle: 'Designed for trustworthy learning',
    valueVerified: 'Reviewed sources',
    valueBilingual: 'English + Amharic',
    valueGentle: 'Optional timers',
    accountLink: 'Sign in later to save progress',
  },
  am: {
    eyebrow: 'አብረን የምንማርበት አዲስ መንገድ',
    title: 'እምነትን በጨዋታ ያስሱ።',
    intro: 'ከተገመገሙ የTewahedoDaily ምንጮች የተዘጋጁ አጫጭር ፈተናዎች፣ የቤተሰብ ጨዋታዎች እና መሪ ጀብዱዎች—በአማርኛና በእንግሊዝኛ።',
    guestBadge: 'እንግዳ ጨዋታ · መለያ አያስፈልግም',
    explore: 'የጨዋታ ማዕከሉን ያስሱ',
    howItWorks: 'የትምህርት ይዘት እንዴት እንደሚገመገም ይመልከቱ',
    gamesEyebrow: 'መንገድዎን ይምረጡ',
    gamesTitle: 'ለእያንዳንዱ ተማሪ የሚሆኑ ጨዋታዎች',
    gamesIntro: 'ዝርዝሩን በደረጃና በርዕስ ያስሱ። የሚጫወቱ ገጾች የተገመገመ ይዘት ሲዘጋጅ ብቻ ይከፈታሉ።',
    all: 'ሁሉም ጨዋታዎች',
    scripture: 'መጽሐፍ ቅዱስ',
    music: 'መዝሙር',
    history: 'ታሪክ',
    party: 'የቡድን ጨዋታ',
    dailyEyebrow: 'የዕለቱ ፈተና',
    dailyTitle: 'የአምስት ደቂቃ የትምህርት ልምምድ',
    dailyBody: 'የዕለት ፈተናዎች በተገመገሙና በታተሙ ጥያቄዎች ብቻ ይቀርባሉ። በማሽን የሚፈጠር ሥነ መለኮት ወይም ጫና የለም።',
    dailyStatus: 'አሁን ይገኛል · አንድ ምንጭ ያለው ጥያቄ',
    topicsEyebrow: 'የትምህርት ካርታ',
    topicsTitle: 'ተመራጭ ርዕሶች',
    gameNightEyebrow: 'ለቤተሰብና ለሰበካ',
    gameNightTitle: 'የጨዋታ ምሽት',
    gameNightBody: 'የግል ክፍል ይፍጠሩ፣ አጭር ኮድ ያጋሩ፣ ከስልክም በአገልጋይ በሚረጋገጥ ውጤት አብረው ይጫወቱ።',
    gameNightStatus: 'የግል ክፍሎች · የተረጋገጠ ውጤት',
    valuesTitle: 'ለታማኝ ትምህርት የተዘጋጀ',
    valueVerified: 'የተገመገሙ ምንጮች',
    valueBilingual: 'አማርኛ + እንግሊዝኛ',
    valueGentle: 'አማራጭ ሰዓት ቆጣሪ',
    accountLink: 'በኋላ እድገትዎን ለማስቀመጥ ይግቡ',
  },
}

const GAMES: PlayGameCard[] = [
  {
    id: 'trivia', route: '/play/trivia', icon: '✦', accent: 'gold', milestone: 2,
    title: { en: 'Bible & Tewahedo Trivia', am: 'የመጽሐፍ ቅዱስና ተዋሕዶ ጥያቄ' },
    description: { en: 'Build knowledge with sourced questions, clear explanations, and a pace you choose.', am: 'ምንጭ ባላቸው ጥያቄዎች፣ ግልጽ ማብራሪያዎች እና በሚመርጡት ፍጥነት እውቀትዎን ያሳድጉ።' },
    category: { en: 'Scripture', am: 'መጽሐፍ ቅዱስ' },
  },
  {
    id: 'who-am-i', route: '/play/who-am-i', icon: '?', accent: 'blue', milestone: 2,
    title: { en: 'Who Am I?', am: 'እኔ ማን ነኝ?' },
    description: { en: 'A lively, accessible guessing game for families, youth groups, and friends.', am: 'ለቤተሰብ፣ ለወጣቶች ቡድን እና ለጓደኞች የሚሆን አስደሳች የግምት ጨዋታ።' },
    category: { en: 'Group play', am: 'የቡድን ጨዋታ' },
  },
  {
    id: 'emoji', route: '/play/emoji', icon: '☀︎', accent: 'green', milestone: 2,
    title: { en: 'Holy Emoji Challenge', am: 'የቅዱስ ኢሞጂ ፈተና' },
    description: { en: 'Decode visual clues, use fewer hints, and uncover the source behind each puzzle.', am: 'የምስል ፍንጮችን ይፍቱ፣ ጥቂት ፍንጮችን ይጠቀሙ እና የእያንዳንዱን እንቆቅልሽ ምንጭ ያግኙ።' },
    category: { en: 'Scripture', am: 'መጽሐፍ ቅዱስ' },
  },
  {
    id: 'mezmur', route: '/play/finish-the-mezmur', icon: '♫', accent: 'red', milestone: 3,
    title: { en: 'Finish the Mezmur', am: 'መዝሙሩን ይጨርሱ' },
    description: { en: 'Recognize verified lyrics, titles, and occasions—even when audio is unavailable.', am: 'ድምፅ በማይኖርበት ጊዜም የተረጋገጡ ግጥሞችን፣ ርዕሶችን እና አጋጣሚዎችን ይለዩ።' },
    category: { en: 'Mezmur', am: 'መዝሙር' },
  },
  {
    id: 'history', route: '/play/history', icon: '⌛', accent: 'purple', milestone: 3,
    title: { en: 'History Quest', am: 'የታሪክ ጉዞ' },
    description: { en: 'Arrange timelines and solve mysteries linked directly to reviewed library passages.', am: 'የጊዜ መስመሮችን ያደራጁ እና ከተገመገሙ የቤተ መጻሕፍት ክፍሎች ጋር የተገናኙ ምስጢሮችን ይፍቱ።' },
    category: { en: 'History', am: 'ታሪክ' },
  },
  {
    id: 'match', route: '/play/match', icon: '◇', accent: 'teal', milestone: 3,
    title: { en: 'Match & Discover', am: 'ያዛምዱና ያግኙ' },
    description: { en: 'Connect people, teachings, objects, and events—then learn why each pair belongs.', am: 'ሰዎችን፣ ትምህርቶችን፣ ቅዱሳት ዕቃዎችን እና ክስተቶችን ያዛምዱ፤ ከዚያም ግንኙነታቸውን ይማሩ።' },
    category: { en: 'Learning', am: 'ትምህርት' },
  },
  {
    id: 'finish-the-verse', route: '/play/finish-the-verse', icon: '✎', accent: 'gold', milestone: 3,
    title: { en: 'Finish the Verse', am: 'ጥቅሱን ይጨርሱ' },
    description: { en: 'Complete exact excerpts from the site’s English and Amharic Bible sources.', am: 'ከጣቢያው የእንግሊዝኛና የአማርኛ መጽሐፍ ቅዱስ ትክክለኛ ጥቅሶችን ያሟሉ።' },
    category: { en: 'Scripture', am: 'መጽሐፍ ቅዱስ' },
  },
  {
    id: 'adventures', route: '/play/adventures', icon: '➜', accent: 'green', milestone: 6,
    title: { en: 'Bible Adventures', am: 'የመጽሐፍ ቅዱስ ጀብዱ' },
    description: { en: 'Explore one complete illustrated 2D chapter with interactive objects and sourced learning checkpoints.', am: 'በምስል፣ በሚነኩ ዕቃዎች እና ምንጭ ባላቸው የትምህርት ነጥቦች የተዘጋጀ አንድ ሙሉ 2D ምዕራፍ ያስሱ።' },
    category: { en: 'Scripture', am: 'መጽሐፍ ቅዱስ' },
  },
]

const TOPICS: Record<AppLocale, string[]> = {
  en: ['Holy Scripture', 'Five Pillars of Mystery', 'Seven Sacraments', 'Church history', 'Saints & holy days', 'Mezmur'],
  am: ['መጽሐፍ ቅዱስ', 'አምስቱ አእማደ ምሥጢራት', 'ሰባቱ ምሥጢራተ ቤተ ክርስቲያን', 'የቤተ ክርስቲያን ታሪክ', 'ቅዱሳንና በዓላት', 'መዝሙር'],
}

type Filter = 'all' | 'scripture' | 'music' | 'history' | 'party'

export function PlayHubPage() {
  const { locale } = useLocale()
  const { session } = useAuth()
  const t = COPY[locale]
  const [difficulty, setDifficulty] = useState<GameDifficulty>('beginner')
  const [filter, setFilter] = useState<Filter>('all')

  const categories = useMemo(() => [
    { id: 'all' as const, label: t.all },
    { id: 'scripture' as const, label: t.scripture },
    { id: 'music' as const, label: t.music },
    { id: 'history' as const, label: t.history },
    { id: 'party' as const, label: t.party },
  ], [t])

  const visibleGames = GAMES.filter((game) => {
    if (filter === 'all') return true
    if (filter === 'scripture') return ['trivia', 'emoji', 'finish-the-verse', 'adventures'].includes(game.id)
    if (filter === 'music') return game.id === 'mezmur'
    if (filter === 'history') return game.id === 'history'
    return ['who-am-i', 'match'].includes(game.id)
  })

  return (
    <div className={styles.page} lang={locale}>
      <section className={styles.hero} aria-labelledby="play-title">
        <div className={styles.heroPattern} aria-hidden="true" />
        <div className={styles.heroCopy}>
          <p className={styles.eyebrow}>{t.eyebrow}</p>
          <h1 id="play-title">{t.title}</h1>
          <p className={styles.heroIntro}>{t.intro}</p>
          <p className={styles.guestBadge}><span aria-hidden="true">●</span>{t.guestBadge}</p>
          <div className={styles.heroActions}>
            <a className={styles.primaryAction} href="#games">{t.explore}</a>
            <a className={styles.secondaryAction} href="#trust">{t.howItWorks}</a>
          </div>
        </div>
        <div className={styles.heroArt} aria-hidden="true">
          <div className={styles.archTop}>✦</div>
          <div className={styles.archCards}>
            <span>?</span><span>♫</span><span>◇</span>
          </div>
          <div className={styles.archSteps}><i /><i /><i /><i /></div>
        </div>
      </section>

      <div className={styles.content}>
        <section className={styles.dashboard} aria-label={locale === 'am' ? 'የተጫዋች ገጽ' : 'Player dashboard'}>
          <PlayProgressPanel locale={locale} signedIn={Boolean(session)} />
          <article className={styles.dailyCard}>
            <p className={styles.eyebrow}>{t.dailyEyebrow}</p>
            <h2>{t.dailyTitle}</h2>
            <p>{t.dailyBody}</p>
            <span>{t.dailyStatus}</span>
            <Link className={styles.dailyAction} to="/play/trivia?daily=1">{locale === 'am' ? 'የዕለቱን ፈተና ይጫወቱ' : 'Play today’s challenge'} →</Link>
          </article>
        </section>

        <section className={styles.gamesSection} id="games" aria-labelledby="games-title">
          <div className={styles.sectionHeading}>
            <div>
              <p className={styles.eyebrow}>{t.gamesEyebrow}</p>
              <h2 id="games-title">{t.gamesTitle}</h2>
              <p>{t.gamesIntro}</p>
            </div>
            <GameDifficultyPicker locale={locale} value={difficulty} onChange={setDifficulty} />
          </div>
          <div className={styles.filters} role="group" aria-label={locale === 'am' ? 'ጨዋታዎችን አጣራ' : 'Filter games'}>
            {categories.map((category) => (
              <button key={category.id} type="button" aria-pressed={filter === category.id} onClick={() => setFilter(category.id)}>
                {category.label}
              </button>
            ))}
          </div>
          <p className={styles.selectionNote} aria-live="polite">
            {locale === 'am' ? `የተመረጠ ደረጃ፦ ${difficulty === 'beginner' ? 'ጀማሪ' : difficulty === 'growing' ? 'መካከለኛ' : 'ፈታኝ'}` : `Selected level: ${difficulty}`}
          </p>
          <div className={styles.gameGrid}>
            {visibleGames.map((game) => <GameCard key={game.id} game={game} locale={locale} />)}
          </div>
        </section>

        <section className={styles.discoveryGrid}>
          <article className={styles.topicsCard}>
            <p className={styles.eyebrow}>{t.topicsEyebrow}</p>
            <h2>{t.topicsTitle}</h2>
            <ul>{TOPICS[locale].map((topic, index) => <li key={topic}><span>{String(index + 1).padStart(2, '0')}</span>{topic}</li>)}</ul>
          </article>
          <article className={styles.gameNightCard}>
            <div className={styles.gameNightMark} aria-hidden="true"><span>3</span><span>2</span><span>1</span></div>
            <p className={styles.eyebrow}>{t.gameNightEyebrow}</p>
            <h2>{t.gameNightTitle}</h2>
            <p>{t.gameNightBody}</p>
            <span className={styles.statusPill}>{t.gameNightStatus}</span>
            <Link className={styles.dailyAction} to="/play/game-night">{locale === 'am' ? 'የጨዋታ ምሽት ይክፈቱ' : 'Open Game Night'} →</Link>
          </article>
        </section>

        <section className={styles.trust} id="trust" aria-labelledby="trust-title">
          <h2 id="trust-title">{t.valuesTitle}</h2>
          <div>
            <span><b aria-hidden="true">✓</b>{t.valueVerified}</span>
            <span><b aria-hidden="true">ፊ</b>{t.valueBilingual}</span>
            <span><b aria-hidden="true">◷</b>{t.valueGentle}</span>
          </div>
          {!session ? <Link to="/login">{t.accountLink} →</Link> : null}
        </section>
      </div>
    </div>
  )
}
