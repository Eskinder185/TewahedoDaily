import { useEffect, useRef, useState } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { GameProgress } from '../../components/play/GameProgress'
import { useAuth } from '../../lib/auth/useAuth'
import { useLocale, type AppLocale } from '../../lib/i18n/locale'
import {
  adventureSourceLabel,
  adventureSourceLink,
  bibleAdventureStories,
  type AdventureText,
  type BibleAdventureStory,
} from '../../lib/play/bibleAdventureStories'
import { readPlayProgress, recordPlayCompletion, type PlayProgress } from '../../lib/play/progress'
import { loadSavedPlayProgress, syncPlayCompletion } from '../../lib/play/progressSync'
import { AdventureArtwork } from './AdventureArtwork'
import { StoryObjects } from './AdventureObjects'
import { sceneHasHotspots, type HotspotKit, type ObjectState } from './adventureHotspots'
import { storyArtState } from './adventureSceneState'
import styles from './AdventurePage.module.css'

const translated = (text: AdventureText, locale: AppLocale) => text[locale] ?? text.en

/** Original vector scenery; clickable objects come from AdventureObjects. */
function StoryArtwork({ story, scene: sceneIndex, kit }: { story: BibleAdventureStory; scene: number; kit: HotspotKit }) {
  const { state, note } = storyArtState(kit)
  return (
    <div className={`${styles.artwork} ${styles[story.art]}`} role="region" lang="en" aria-label={`${story.title.en}, scene ${sceneIndex + 1}`} data-art-state={state}>
      <svg viewBox="0 0 600 390" focusable="false">
        <circle className={styles.glow} cx="466" cy="88" r="57" aria-hidden="true" />
        <path className={styles.land} d="M0 232 Q125 163 260 226 T600 214 V390 H0Z" aria-hidden="true" />
        <StoryObjects kit={kit} />
      </svg>
      {note && <span className={styles.artNote} role="status" lang="en" data-art-note>{note}</span>}
      <span className={styles.artCaption}>{story.passage} · {sceneIndex + 1}/3</span>
    </div>
  )
}

function AdventureRun({ story, locale, user }: { story: BibleAdventureStory; locale: AppLocale; user: ReturnType<typeof useAuth>['user'] }) {
  const [sceneIndex, setSceneIndex] = useState(0)
  const [found, setFound] = useState<string[]>([])
  const [answer, setAnswer] = useState('')
  const [hoveredObject, setHoveredObject] = useState<string | null>(null)
  const [focusedObject, setFocusedObject] = useState<string | null>(null)
  const [xpEarned, setXpEarned] = useState<number | null>(null)
  const finishing = useRef(false)
  const titleRef = useRef<HTMLHeadingElement>(null)
  const scene = story.scenes[sceneIndex]
  const am = locale === 'am'

  useEffect(() => { titleRef.current?.focus() }, [sceneIndex, story.id])

  const next = () => {
    setFound([])
    setAnswer('')
    setHoveredObject(null)
    setFocusedObject(null)
    setSceneIndex((current) => Math.min(current + 1, story.scenes.length - 1))
  }
  const replay = () => {
    setXpEarned(null)
    setFound([])
    setAnswer('')
    setHoveredObject(null)
    setFocusedObject(null)
    setSceneIndex(0)
    titleRef.current?.focus()
  }
  // Each story's XP is awarded once per player: the story's passage category in the stored progress is the durable record.
  const finish = async () => {
    if (xpEarned !== null || finishing.current) return
    finishing.current = true
    try {
      const input = { game: 'adventure' as const, score: 3, maxScore: 3, category: story.passage }
      const earned = (progress: PlayProgress | null) => (progress?.categoryMastery?.[story.passage]?.total ?? 0) > 0
      let alreadyEarned = earned(readPlayProgress())
      if (!alreadyEarned && user) alreadyEarned = earned(await loadSavedPlayProgress(user).catch(() => null))
      if (alreadyEarned) { setXpEarned(0); return }
      const saved = recordPlayCompletion(input)
      setXpEarned(saved.xpEarned)
      void syncPlayCompletion(user, { ...input, progress: saved.progress }).catch(() => undefined)
    } finally {
      finishing.current = false
    }
  }
  const interaction = scene.interaction
  const ready = interaction.kind === 'discover'
    ? interaction.details.every((detail) => found.includes(detail.id))
    : answer === interaction.correctId
  // Illustration objects and sidebar buttons share this one selection path (ids are detail/choice ids).
  const selectObject = (id: string) => {
    if (interaction.kind === 'discover') {
      if (interaction.details.some((detail) => detail.id === id)) setFound((items) => (items.includes(id) ? items : [...items, id]))
    } else if (!ready && interaction.choices.some((choice) => choice.id === id)) {
      setAnswer(id)
    }
  }
  const objectState = (id: string): ObjectState => {
    if (interaction.kind === 'discover') return found.includes(id) ? 'selected' : 'idle'
    return answer === id ? (ready ? 'correct' : 'incorrect') : 'idle'
  }
  const kit: HotspotKit = {
    storyId: story.id,
    scene: sceneIndex,
    activeObject: focusedObject ?? hoveredObject,
    locked: interaction.kind === 'question' && ready,
    stateOf: objectState,
    onSelect: selectObject,
    onHover: setHoveredObject,
    onFocusObject: setFocusedObject,
  }
  const interactive = sceneHasHotspots(story.id, sceneIndex)

  return <div className={styles.stage}>
    <p className={styles.notice}>{am ? 'ታሪኩ ከተጠቀሰው ቅዱስ መጽሐፍ የተወሰደ ነው። አንዳንድ ታሪኮችና ጥያቄዎች በእንግሊዝኛ ቀርበዋል።' : 'Interactive objects are learning aids. Story details come from the cited WEB passages.'}</p>
    <GameProgress locale={locale} current={sceneIndex + 1} total={story.scenes.length} label={am ? 'የምዕራፍ እድገት' : 'Story progress'} />
    <section className={styles.scene} aria-labelledby="adventure-scene-title">
      <div className={styles.artColumn}>
        {story.id === 'sea' ? <AdventureArtwork story={story} scene={sceneIndex} kit={kit} /> : <StoryArtwork story={story} scene={sceneIndex} kit={kit} />}
        {interactive && <p className={styles.sceneHint}>
          <span lang="en"><span aria-hidden="true">✦ </span><strong>Interactive scene:</strong> tap or click the outlined objects, or use the buttons beside the story.</span>
          <span lang="am"><strong>ተግባራዊ ትዕይንት፦</strong> በምስሉ ላይ ያሉትን ምልክት የተደረገባቸው ነገሮች ይንኩ፤ ወይም ከታሪኩ አጠገብ ያሉትን አዝራሮች ይጠቀሙ።</span>
        </p>}
        {!interactive && <p className={styles.sceneHint} data-sidebar-hint>
          <span lang="en"><span aria-hidden="true">✦ </span><strong>Answer scene:</strong> choose an answer from the buttons beside the story. The picture responds when you answer.</span>
          <span lang="am"><strong>የመልስ ትዕይንት፦</strong> ከታሪኩ አጠገብ ካሉት አዝራሮች መልስ ይምረጡ። መልስ ሲሰጡ ምስሉ ይለወጣል።</span>
        </p>}
      </div>
      <div className={styles.story} lang={am && scene.title.am ? 'am' : 'en'}>
        <p className={styles.eyebrow} lang={locale}>{am ? 'ትዕይንት' : 'Scene'} {sceneIndex + 1} / {story.scenes.length}</p>
        <h2 id="adventure-scene-title" tabIndex={-1} ref={titleRef}>{translated(scene.title, locale)}</h2>
        <p>{translated(scene.narrative, locale)}</p>
        {interaction.kind === 'discover' ? <div className={styles.exploration}>
          <p lang={locale}>{am ? 'ሁለቱንም ይመርምሩ።' : 'Explore both details to continue.'}</p>
          <div className={styles.choices}>{interaction.details.map((detail) => <button key={detail.id} type="button" data-object={detail.id} aria-pressed={found.includes(detail.id)} lang={am && detail.label.am ? 'am' : 'en'} onMouseEnter={() => setHoveredObject(detail.id)} onMouseLeave={() => setHoveredObject(null)} onFocus={() => setFocusedObject(detail.id)} onBlur={() => setFocusedObject(null)} onClick={() => selectObject(detail.id)}>{translated(detail.label, locale)}</button>)}</div>
          <ul className={styles.findings}>{interaction.details.filter((detail) => found.includes(detail.id)).map((detail) => <li key={detail.id} lang={am && detail.finding.am ? 'am' : 'en'}>{translated(detail.finding, locale)}</li>)}</ul>
        </div> : <div className={styles.challenge}>
          <h3 lang={am && interaction.prompt.am ? 'am' : 'en'}>{translated(interaction.prompt, locale)}</h3>
          <div className={styles.choices}>{interaction.choices.map((choice) => <button key={choice.id} type="button" data-object={choice.id} data-state={objectState(choice.id)} aria-pressed={answer === choice.id} disabled={ready} lang={am && choice.label.am ? 'am' : 'en'} onMouseEnter={() => setHoveredObject(choice.id)} onMouseLeave={() => setHoveredObject(null)} onFocus={() => setFocusedObject(choice.id)} onBlur={() => setFocusedObject(null)} onClick={() => selectObject(choice.id)}>{translated(choice.label, locale)}</button>)}</div>
          <div className={styles.feedback} role="status" aria-live="polite">{answer && (ready ? <><span lang={locale}>{am ? 'ትክክል።' : 'Correct.'}</span>{' '}<span lang={am && interaction.explanation.am ? 'am' : 'en'}>{translated(interaction.explanation, locale)}</span></> : <span lang={locale}>{am ? 'ጥቅሱን እንደገና ይመልከቱ።' : 'Look again at the cited verses. Try another answer.'}</span>)}</div>
        </div>}
        <Link className={styles.source} to={adventureSourceLink(scene.source)}><span lang={locale}>{am ? 'ምንጭ: ' : 'Source: '}</span><span lang="en">{adventureSourceLabel(scene.source)} (WEB)</span></Link>
        {xpEarned !== null ? <div className={styles.complete} role="status">
          <h3 lang={locale}>{am ? 'ምዕራፉ ተጠናቋል' : 'Story complete'}</h3>
          {xpEarned > 0 ? <p>+{xpEarned} XP</p> : <p data-practice lang={locale}>{am ? 'የልምምድ ድጋሚ ጨዋታ — የዚህ ታሪክ XP አስቀድሞ ተሰጥቷል።' : 'Practice replay — this story’s XP was already earned.'}</p>}
          <div className={styles.actions}><button type="button" lang={locale} onClick={replay}>{am ? 'እንደገና ይጫወቱ' : 'Replay story'}</button><Link to="/play/adventures" lang={locale}>{am ? 'ሌላ ታሪክ' : 'Choose another story'}</Link></div>
        </div> : ready ? <button className={styles.primary} type="button" lang={locale} onClick={sceneIndex === story.scenes.length - 1 ? finish : next}>{sceneIndex === story.scenes.length - 1 ? (am ? 'ምዕራፉን ያጠናቅቁ' : 'Complete story') : (am ? 'ቀጥል' : 'Continue')} →</button> : null}
      </div>
    </section>
  </div>
}

export function AdventurePage() {
  const { locale } = useLocale()
  const { user } = useAuth()
  const [params] = useSearchParams()
  const storyId = params.get('story')
  const story = bibleAdventureStories.find((item) => item.id === storyId)
  const am = locale === 'am'

  return <div className={styles.page} lang={locale}>
    <header className={styles.header}><div className={styles.headerInner}>
      <nav className={styles.breadcrumb} aria-label={am ? 'የገጽ መንገድ' : 'Breadcrumb'}><Link to="/play">← {am ? 'ወደ ጨዋታ' : 'Tewahedo Play'}</Link>{story && <Link to="/play/adventures">{am ? 'ጀብዱዎች' : 'All adventures'}</Link>}</nav>
      <p className={styles.eyebrow}>{am ? 'የመጽሐፍ ቅዱስ ጀብዱ' : 'Bible Adventure'}</p>
      <h1 lang={am && story?.title.am ? 'am' : 'en'}>{story ? translated(story.title, locale) : (am ? 'የመጽሐፍ ቅዱስ ጀብዱዎች' : 'Choose an adventure')}</h1>
      <p className={styles.headerSummary} lang={am && story?.summary.am ? 'am' : 'en'}>{story ? translated(story.summary, locale) : (am ? 'በታሪኮቹ ውስጥ ይጓዙ። የታሪክ ጽሑፉ ከእንግሊዝኛ WEB መጽሐፍ ቅዱስ ነው።' : 'Explore six short stories, each grounded in a cited WEB passage.')}</p>
    </div></header>
    {story ? <AdventureRun key={story.id} story={story} locale={locale} user={user} /> : <div className={styles.gallery}>
      {storyId && <p role="alert">{am ? 'ታሪኩ አልተገኘም።' : 'That adventure was not found.'}</p>}
      <div className={styles.cards}>{bibleAdventureStories.map((item) => <Link className={`${styles.card} ${styles[item.art]}`} to={`/play/adventures?story=${item.id}`} key={item.id}>
        <span className={styles.cardArt} aria-hidden="true"><span>{item.passage}</span></span>
        <span className={styles.cardBody}><strong lang={am && item.title.am ? 'am' : 'en'}>{translated(item.title, locale)}</strong><span lang="en">{item.summary.en}</span><small lang="en">{item.passage} · WEB</small><span className={styles.cardAction}>{am ? 'ታሪኩን ይጀምሩ' : 'Start adventure'} →</span></span>
      </Link>)}</div>
    </div>}
  </div>
}
