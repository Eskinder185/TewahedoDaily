/** Editorial simulations deliberately have no progress, XP, room or sync imports. */
import { useMemo, useState } from 'react'
import { FaithChallengePreview } from '../FaithChallengePreview'
import { isHistoryTimeline, isQuizStudioGame, studioText, toQuestionDraft, type HistoryStudioEvent, type StudioDraft } from '../../../lib/play/contentStudio'
import { isCorrectOrder, type TlChain } from '../../../lib/play/bibleTimeline'
import { adventureSourceLabel, type BibleAdventureStory } from '../../../lib/play/bibleAdventureStories'
import { buildFinishMezmurBankSeeded, gradeTyped, type FmDifficulty, type FmMode, type MezmurSong } from '../../../lib/play/finishMezmur'
import type { MatchPair, WhoAmICard } from '../../../lib/play/types'
import type { PlayImage } from '../../../lib/play/imageCatalog'
import { AdventureArtwork } from '../../play/AdventureArtwork'
import { StoryObjects } from '../../play/AdventureObjects'
import type { HotspotKit } from '../../play/adventureHotspots'
import adventure from '../../play/AdventurePage.module.css'
import { OrderedCards, TextField } from './StudioFields'
import s from './Studio.module.css'

type Locale = 'en' | 'am'
function HistoryChronologyPreview({ events, locale }: { events: HistoryStudioEvent[]; locale: Locale }) {
  const [order, setOrder] = useState(() => events.slice().sort((a, b) => b.year - a.year))
  const [checked, setChecked] = useState(false)
  const correct = order.every((event, index) => index === 0 || order[index - 1].year < event.year)
  return <><OrderedCards items={order} label="preview historical event" identity={event => event.id} onChange={next => { setOrder(next); setChecked(false) }}
    render={event => <p>{studioText(event.label, locale)}{checked && correct ? ` · ${event.year}` : ''}</p>} />
    <button type="button" onClick={() => setChecked(true)}>Check chronology / አረጋግጥ</button>
    {checked && <p role="status">{correct ? 'Timeline complete! / ትክክል!' : 'Not yet — reorder and try again. / እንደገና ይሞክሩ።'}</p>}</>
}
function IdentityPreview({ card, locale }: { card: WhoAmICard; locale: Locale }) {
  const [revealed, setRevealed] = useState(false)
  return <><p>Group hot-seat card: other players describe the identity without saying its name. No progressive clue deck exists. / የቡድን ካርድ</p>
    <h3>{studioText(card.answer, locale)}</h3><button type="button" onClick={() => setRevealed(!revealed)}>Reveal explanation / ማብራሪያ</button>
    {revealed && <p role="status">{studioText(card.explanation, locale)}</p>}</>
}
function TimelinePreview({ chain, locale }: { chain: TlChain; locale: Locale }) {
  const [events, setEvents] = useState(() => chain.events.slice().reverse())
  const [checked, setChecked] = useState(false)
  const correct = isCorrectOrder({ id: chain.id, chainId: chain.id, chainTitle: chain.title, events: chain.events }, events.map(event => event.id))
  return <><h3>{studioText(chain.title, locale)}</h3><OrderedCards items={events} label="preview event" identity={event => event.id} onChange={next => { setEvents(next); setChecked(false) }} render={event => <p>{studioText(event.title, locale)}</p>} />
    <button type="button" onClick={() => setChecked(true)}>Check timeline / ቅደም ተከተል አረጋግጥ</button>
    {checked && <p role="status">{correct ? 'Timeline complete! / ትክክል!' : 'Not yet — reorder and try again. / እንደገና ይሞክሩ።'}</p>}</>
}
function PairPreview({ pairs, images, locale }: { pairs?: MatchPair[]; images?: PlayImage[]; locale: Locale }) {
  const cards = images ? images.flatMap(image => [{ key: `${image.id}-picture`, id: image.id, text: '', image }, { key: `${image.id}-name`, id: image.id, text: studioText(image.answer, locale), image: null }])
    : (pairs || []).flatMap(pair => [{ key: `${pair.id}-left`, id: pair.id, text: studioText(pair.left, locale), image: null }, { key: `${pair.id}-right`, id: pair.id, text: studioText(pair.right, locale), image: null }])
  const [selected, setSelected] = useState<string[]>([])
  const [matched, setMatched] = useState<string[]>([])
  const [message, setMessage] = useState('')
  return <><div className={s.previewGrid}>{cards.map((card, index) => {
    const open = !images || selected.includes(card.key) || matched.includes(card.id)
    return <button type="button" key={card.key} disabled={matched.includes(card.id) || selected.includes(card.key) || selected.length === 2} onClick={() => {
      const next = [...selected, card.key]; setSelected(next)
      if (next.length === 2) {
        const correct = cards.find(item => item.key === next[0])?.id === card.id
        setMessage(correct ? 'Match! / ተዛመደ!' : 'Not a match. Try another pair. / እንደገና ይሞክሩ።')
        if (correct) { setMatched([...matched, card.id]); setSelected([]) }
      }
    }}>{open ? card.image ? <img className={s.thumbnail} src={card.image.src || card.image.fallbackSrc} alt={card.image.description} /> : card.text : `Card / ካርድ ${index + 1}`}</button>
  })}</div>{message && <p role="status">{message}</p>}
    {selected.length === 2 && <button type="button" onClick={() => { setSelected([]); setMessage('') }}>Try another pair / እንደገና</button>}
    {!!cards.length && matched.length === cards.length / 2 && <p role="status">Round complete / ዙሩ ተጠናቋል</p>}</>
}
function PicturePreview({ images, locale }: { images: PlayImage[]; locale: Locale }) {
  const [index, setIndex] = useState(0)
  const [answer, setAnswer] = useState<string | null>(null)
  const image = images[index]
  if (!image) return <p>No eligible images. / ሥዕል የለም።</p>
  return <><p>Look &amp; Guess mode / ይመልከቱና ይገምቱ</p><img className={s.previewImage} src={image.src || image.fallbackSrc} alt={image.description} style={{ objectPosition: image.focus }} />
    <div className={s.previewGrid}>{images.map(option => <button type="button" disabled={answer !== null} key={option.id} onClick={() => setAnswer(option.id)}>{studioText(option.answer, locale)}</button>)}</div>
    {answer !== null && <div role="status"><strong>{answer === image.id ? 'Correct / ትክክል' : 'Not quite / እንደገና'}</strong><p>{studioText(image.explanation, locale)}</p>
      <button type="button" onClick={() => { setIndex((index + 1) % images.length); setAnswer(null) }}>Next picture / ቀጣይ</button></div>}</>
}
function AdventurePreview({ story, locale }: { story: BibleAdventureStory; locale: Locale }) {
  const [sceneIndex, setSceneIndex] = useState(0)
  const [found, setFound] = useState<string[]>([])
  const [answer, setAnswer] = useState('')
  const [active, setActive] = useState<string | null>(null)
  const [done, setDone] = useState(false)
  const scene = story.scenes[sceneIndex]
  const interaction = scene.interaction
  const ready = interaction.kind === 'discover' ? interaction.details.every(detail => found.includes(detail.id)) : answer === interaction.correctId
  const select = (id: string) => {
    if (interaction.kind === 'discover' && interaction.details.some(detail => detail.id === id)) setFound(current => current.includes(id) ? current : [...current, id])
    else if (interaction.kind === 'question' && !ready && interaction.choices.some(choice => choice.id === id)) setAnswer(id)
  }
  const kit: HotspotKit = { storyId: story.id, scene: sceneIndex, activeObject: active, locked: interaction.kind === 'question' && ready,
    onSelect: select, onHover: setActive, onFocusObject: setActive, stateOf: id => interaction.kind === 'discover' ? found.includes(id) ? 'selected' : 'idle' : answer === id ? ready ? 'correct' : 'incorrect' : 'idle' }
  if (done) return <p role="status">Story complete / ታሪኩ ተጠናቋል</p>
  return <><h3>{sceneIndex + 1}/3 · {studioText(scene.title, locale)}</h3>
    {story.id === 'sea' ? <AdventureArtwork story={story} scene={sceneIndex} kit={kit} /> : <div className={`${adventure.artwork} ${adventure[story.art]}`}>
      <svg viewBox="0 0 600 390" role="img" aria-label={studioText(scene.title, locale)}><StoryObjects kit={kit} /></svg></div>}
    <p>{studioText(scene.narrative, locale)}</p><p>{adventureSourceLabel(scene.source)}</p>
    {interaction.kind === 'discover' ? interaction.details.map(detail => <div key={detail.id}><button type="button" onClick={() => select(detail.id)}>{studioText(detail.label, locale)}</button>
      {found.includes(detail.id) && <p role="status">{studioText(detail.finding, locale)}</p>}</div>) : <><p>{studioText(interaction.prompt, locale)}</p>
      {interaction.choices.map(choice => <button type="button" key={choice.id} disabled={ready} onClick={() => select(choice.id)}>{studioText(choice.label, locale)}</button>)}
      {answer && <p role="status">{ready ? studioText(interaction.explanation, locale) : 'Not yet. Try another answer. / እንደገና ይሞክሩ።'}</p>}</>}
    <button type="button" disabled={!ready} onClick={() => {
      if (sceneIndex === 2) setDone(true)
      else { setSceneIndex(sceneIndex + 1); setFound([]); setAnswer(''); setActive(null) }
    }}>Next scene / ቀጣይ ትዕይንት</button></>
}
function LyricPreview({ song }: { song: MezmurSong }) {
  const [mode, setMode] = useState<FmMode>('choose')
  const [difficulty, setDifficulty] = useState<FmDifficulty>('easy')
  const [selected, setSelected] = useState('')
  const [typed, setTyped] = useState('')
  const [wordOrder, setWordOrder] = useState<number[]>([])
  const [result, setResult] = useState<boolean | null>(null)
  const questions = useMemo(() => buildFinishMezmurBankSeeded([song], mode, difficulty, 42), [song, mode, difficulty])
  const question = questions.find(question => question.id === selected) || questions[0]
  const reset = () => { setResult(null); setTyped(''); setWordOrder([]) }
  return <><div className={s.columns}><label>Mezmur mode / ዘዴ<select value={mode} onChange={event => { setMode(event.target.value as FmMode); reset() }}>{['choose', 'arrange', 'type'].map(mode => <option key={mode}>{mode}</option>)}</select></label>
    <label>Lyric difficulty / ደረጃ<select value={difficulty} onChange={event => { setDifficulty(event.target.value as FmDifficulty); reset() }}>{['easy', 'medium', 'hard'].map(difficulty => <option key={difficulty}>{difficulty}</option>)}</select></label></div>
    {!!questions.length && <label className={s.field}>Select line to hide / የሚደበቅ መስመር<select value={question.id} onChange={event => { setSelected(event.target.value); reset() }}>{questions.map(question => <option key={question.id} value={question.id}>{question.answer.am}</option>)}</select></label>}
    {!question ? <p role="status">No playable question from these lyrics. Add eligible source lines. / በቂ ግጥም የለም።</p> : <>
      {question.contextBefore.map((line, index) => <p key={index} lang="am">{line.am}</p>)}<p>________</p>{question.contextAfter.map((line, index) => <p key={index} lang="am">{line.am}</p>)}
      {mode === 'choose' ? question.options?.map(option => <button type="button" disabled={result !== null} key={option.key} onClick={() => setResult(option.key === question.correctKey)}>{option.am}</button>) : mode === 'type' ? <>
        <TextField label="Type missing lyric / የጎደለውን ግጥም ይጻፉ" value={typed} onChange={setTyped} /><button type="button" onClick={() => setResult(gradeTyped(typed, question.answer))}>Check lyric / አረጋግጥ</button></> : <>
        <div className={s.words}>{question.shuffledWords?.map((word, index) => <button type="button" key={index} disabled={wordOrder.includes(index)} onClick={() => setWordOrder([...wordOrder, index])}>{word}</button>)}</div>
        <p>{wordOrder.map(index => question.shuffledWords?.[index]).join(' ')}</p><button type="button" onClick={() => setResult(gradeTyped(wordOrder.map(index => question.shuffledWords?.[index]).join(' '), question.answer))}>Check words / ቃላቱን አረጋግጥ</button><button type="button" onClick={reset}>Reset words / እንደገና</button></>}
      {result !== null && <p role="status">{result ? 'Correct / ትክክል' : 'Not quite / እንደገና'} · {question.answer.am}</p>}</>}
  </>
}
export function StudioPreview({ draft, locale }: { draft: StudioDraft; locale: Locale }) {
  let body
  if ((draft.game === 'feasts' || draft.game === 'saints' || draft.game === 'icon-memory') && draft.content.some(image => !image.src && !image.fallbackSrc)) {
    body = <><p role="status">Image draft preview only. Replace missing images before playing. / የምስል ረቂቅ ቅድመ እይታ ብቻ።</p><div className={s.previewGrid}>{draft.content.map(image => <figure key={image.id}>
      {image.src || image.fallbackSrc ? <img className={s.thumbnail} src={image.src || image.fallbackSrc} alt={image.description} /> : <p>Image removed / ምስሉ ተወግዷል</p>}
      <figcaption>{studioText(image.answer, locale)}</figcaption></figure>)}</div></>
  } else if (isHistoryTimeline(draft)) body = <HistoryChronologyPreview events={draft.content} locale={locale} />
  else if (isQuizStudioGame(draft.game)) body = <FaithChallengePreview draft={toQuestionDraft(draft)} locale={locale} />
  else switch (draft.game) {
    case 'who-am-i': body = <IdentityPreview card={draft.content} locale={locale} />; break
    case 'match': body = <PairPreview pairs={draft.content} locale={locale} />; break
    case 'bible-timeline': body = <TimelinePreview chain={draft.content} locale={locale} />; break
    case 'adventures': body = <AdventurePreview story={draft.content} locale={locale} />; break
    case 'finish-the-mezmur': body = <LyricPreview song={draft.content} />; break
    case 'feasts': case 'saints': body = <PicturePreview images={draft.content} locale={locale} />; break
    case 'icon-memory': body = <PairPreview images={draft.content} locale={locale} />; break
  }
  return <section className={s.preview} aria-label="Playable editorial preview"><p className={s.hint}>Preview · changes are not published and no XP is awarded. / ቅድመ እይታ · ህትመትና XP የለም።</p>{body}</section>
}
