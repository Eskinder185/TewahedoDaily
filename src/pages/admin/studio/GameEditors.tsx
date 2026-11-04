import { useState } from 'react'
import { Link } from 'react-router-dom'
import type { PlayQuestion, MatchPair, WhoAmICard, SourceReference } from '../../../lib/play/types'
import type { TlChain } from '../../../lib/play/bibleTimeline'
import { HISTORY_TIMELINE } from '../../../lib/play/approvedContent'
import { bibleAdventureStories, type BibleAdventureStory } from '../../../lib/play/bibleAdventureStories'
import { PLAY_IMAGES, type PlayImage } from '../../../lib/play/imageCatalog'
import type { MezmurSong } from '../../../lib/play/finishMezmur'
import { fetchMezmurLyrics } from '../../../lib/play/mezmurLyricsSource'
import type { BiblePassageResult } from '../../../lib/bible/passageService'
import { fetchStudioPassageBilingual, listStudioBooks } from '../../../lib/play/studioBibleSource'
import { isHistoryTimeline, isQuizStudioGame, type HistoryStudioEvent, type StudioDraft } from '../../../lib/play/contentStudio'
import { TextField, BilingualField, OrderedCards, SourcePicker } from './StudioFields'
import { StudioImageField } from './StudioImageField'
import s from './Studio.module.css'

type Editor<T> = { value: T; onChange: (value: T) => void }
function QuestionFields({ value, onChange }: Editor<PlayQuestion>) {
  return <>
    <TextField label="Stable question ID / ቋሚ መለያ" value={value.id} onChange={id => onChange({ ...value, id })} advanced />
    <div className={s.columns}><TextField label="Category / ምድብ" value={value.category} onChange={category => onChange({ ...value, category })} />
      <label className={s.field}>Difficulty / ደረጃ<select value={value.difficulty} onChange={event => onChange({ ...value, difficulty: event.target.value as PlayQuestion['difficulty'] })}>
        {['beginner', 'growing', 'challenge'].map(value => <option key={value}>{value}</option>)}</select></label></div>
    <BilingualField label="Question / ጥያቄ" value={value.prompt} onChange={prompt => onChange({ ...value, prompt })} multiline />
    <fieldset className={s.group}><legend>Four answers / አራት መልሶች</legend>{value.options.map((option, index) => <div key={option.key} className={s.card}>
      <BilingualField label={`Answer ${index + 1} / መልስ`} value={option.text} onChange={text => onChange({ ...value, options: value.options.map((item, i) => i === index ? { ...item, text } : item) })} />
      <label><input type="radio" name={`correct-${value.id}`} checked={value.correctKey === option.key} onChange={() => onChange({ ...value, correctKey: option.key })} /> Correct answer / ትክክለኛ መልስ {index + 1}</label>
    </div>)}</fieldset>
    <BilingualField label="Explanation / ማብራሪያ" value={value.explanation} onChange={explanation => onChange({ ...value, explanation })} multiline />
    <OrderedCards items={value.hints || []} label="hint" identity={(_, index) => String(index)} onChange={hints => onChange({ ...value, hints })}
      add={() => onChange({ ...value, hints: [...value.hints || [], { en: '', am: '' }] })}
      render={(hint, index) => <BilingualField label={`Hint ${index + 1} / ፍንጭ`} value={hint} onChange={text => onChange({ ...value, hints: value.hints!.map((item, i) => i === index ? text : item) })} />} />
    <label><input type="checkbox" checked={value.verifiedLocales.includes('am')} onChange={event => onChange({ ...value, verifiedLocales: event.target.checked ? ['en', 'am'] : ['en'] })} /> Reviewed Amharic / የተገመገመ አማርኛ</label>
    <SourcePicker value={value.source} onChange={source => onChange({ ...value, source })} />
  </>
}
export function TriviaEditor(props: Editor<PlayQuestion>) { return <QuestionFields {...props} /> }
export function EmojiEditor({ value, onChange }: Editor<PlayQuestion>) {
  return <><TextField label="Emoji sequence / የኢሞጂ ቅደም ተከተል" value={value.emoji || ''} onChange={emoji => onChange({ ...value, emoji })} />
    <div className={s.emoji} aria-label="Emoji sequence preview">{value.emoji}</div><QuestionFields value={value} onChange={onChange} /></>
}
export function HistoryEditor(props: Editor<PlayQuestion>) {
  return <><aside className={s.notice}>Question modes use the connected quiz bank. Use New local chronology in the History library to edit event/year cards; their publication is not connected. / የክስተት ካርዶች በአካባቢ ረቂቅ ይቀመጣሉ።</aside>
    <details><summary>Existing chronology / ያለ ቅደም ተከተል</summary>{HISTORY_TIMELINE.map(event => <p key={event.id}>{event.year} · {event.label.en} · <Link to={event.source.route}>{event.source.label}</Link></p>)}</details>
    <QuestionFields {...props} /></>
}
function PassagePicker({ value, onChange }: Editor<PlayQuestion>) {
  const originalBook = /^\/bible\/([^/]+)/.exec(value.source.route)?.[1] || 'genesis'
  const [book, setBook] = useState(originalBook)
  const [books, setBooks] = useState([{ slug: originalBook, en: value.source.label, am: value.source.label }])
  const [chapter, setChapter] = useState('1')
  const [verse, setVerse] = useState('1')
  const [passages, setPassages] = useState<BiblePassageResult[]>([])
  const [error, setError] = useState('')
  const [busy, setBusy] = useState(false)
  const [selected, setSelected] = useState<string | null>(null)
  function applyFragment(passage: BiblePassageResult, verse: BiblePassageResult['verses'][number], fragment: string) {
    if (!fragment.trim() || fragment.length > 500 || !verse.text.includes(fragment)) { setError('Select an exact word or phrase from this stored verse.'); return }
    const locale = passage.editionCode === 'am' ? 'am' : 'en'
    const source: SourceReference = { kind: 'bible', route: passage.readerHref, label: `${passage.bookTitleEn} ${passage.chapterNumber}:${verse.verseNumber}`, sourceId: verse.id }
    const excerpt = verse.text.replace(fragment, '____')
    setSelected(fragment); setError('')
    onChange({ ...value, source, excerpt: { ...value.excerpt || { en: '' }, [locale]: excerpt },
      options: value.options.map(option => option.key === value.correctKey ? { ...option, text: { ...option.text, [locale]: fragment } } : option) })
  }
  async function load() {
    setError(''); setPassages([]); setSelected(null)
    if (!/^[a-z0-9-]+$/.test(book) || ![chapter, verse].every(n => /^\d{1,3}$/.test(n) && Number(n) > 0)) { setError('Use a book slug and positive chapter/verse.'); return }
    setBusy(true)
    try {
      const result = await fetchStudioPassageBilingual({ bookSlug: book, chapterNumber: Number(chapter), verseStart: Number(verse), verseEnd: Number(verse) })
      const eligible = [result.amharic, result.english].filter((item): item is BiblePassageResult => !!item && item.isComplete && item.verses.length > 0)
      if (!eligible.length) throw new Error('No complete eligible published passage was returned. No text was invented.')
      setPassages(eligible)
    } catch (cause) { setError(cause instanceof Error ? cause.message : 'Passage load failed.') }
    finally { setBusy(false) }
  }
  return <section className={s.group} aria-label="Passage picker"><h3>Choose exact source words / የምንጩን ቃላት ይምረጡ</h3>
    <button type="button" onClick={() => void listStudioBooks().then(rows => { if (!rows.length) throw new Error('No reviewed, public source books with confirmed rights were returned.'); setBooks(rows) }).catch(cause => setError(cause instanceof Error ? cause.message : 'Book list unavailable.'))}>Load reviewed Bible books / መጻሕፍትን ጫን</button>
    <div className={s.columns}><label className={s.field}>Bible book / መጽሐፍ<select value={book} onChange={event => setBook(event.target.value)}>{books.map(book => <option key={book.slug} value={book.slug}>{book.en} · {book.am}</option>)}</select></label><TextField label="Chapter" value={chapter} onChange={setChapter} type="number" /><TextField label="Verse" value={verse} onChange={setVerse} type="number" /></div>
    <button type="button" disabled={busy} onClick={() => void load()}>{busy ? 'Loading…' : 'Load published passage / ጥቅስ ጫን'}</button>
    {error && <p role="alert">{error}</p>}
    {passages.map(passage => <article className={s.card} key={passage.editionCode}><strong>{passage.editionName} · {passage.readerHref}</strong>
      <p>Choose a word to hide. Original stored text and numbering are preserved. / የሚደበቅ ቃል ይምረጡ።</p>
      {passage.verses.map(verse => <div key={verse.id}><p className={s.quote} lang={passage.languageCode}>{verse.text}</p>
        <button type="button" onClick={() => applyFragment(passage, verse, window.getSelection()?.toString().trim() || '')}>Use selected phrase / የተመረጡ ቃላት</button>
        <div className={s.words}>{verse.text.split(/(\s+)/).map((word, index) => /^\s+$/.test(word) ? word : <button type="button" key={index} onClick={() => applyFragment(passage, verse, word)}>{word}</button>)}</div></div>)}</article>)}
    {selected && <p role="status">Exact source word selected / የተመረጠ ቃል: {selected}</p>}
  </section>
}
export function VerseEditor(props: Editor<PlayQuestion>) {
  return <><PassagePicker {...props} /><BilingualField label="Verse with blank / ጥቅስ" value={props.value.excerpt || { en: '' }} onChange={excerpt => props.onChange({ ...props.value, excerpt })} multiline /><QuestionFields {...props} /></>
}
export function IdentityEditor({ value, onChange }: Editor<WhoAmICard>) {
  return <><aside className={s.notice}>The current game is a timed group identity card. Progressive clue decks and portraits have no fields in WhoAmICard and are blocked. / ተጨማሪ ፍንጮችና ሥዕሎች ገና አልተገናኙም።</aside>
    <TextField label="Identity ID / መለያ" value={value.id} onChange={id => onChange({ ...value, id })} advanced />
    <label className={s.field}>Identity category / ምድብ<select value={value.category} onChange={event => onChange({ ...value, category: event.target.value as WhoAmICard['category'] })}>{['biblical-people', 'biblical-locations', 'saints', 'holy-objects'].map(category => <option key={category}>{category}</option>)}</select></label>
    <BilingualField label="Identity / ማንነት" value={value.answer} onChange={answer => onChange({ ...value, answer })} />
    <BilingualField label="Identity explanation / ማብራሪያ" value={value.explanation} onChange={explanation => onChange({ ...value, explanation })} multiline />
    <label><input type="checkbox" checked={value.verifiedLocales.includes('am')} onChange={event => onChange({ ...value, verifiedLocales: event.target.checked ? ['en', 'am'] : ['en'] })} /> Reviewed Amharic / የተገመገመ አማርኛ</label>
    <SourcePicker value={value.source} onChange={source => onChange({ ...value, source })} /></>
}
export function MatchEditor({ value, onChange }: Editor<MatchPair[]>) {
  return <OrderedCards items={value} label="pair" identity={pair => pair.id} onChange={onChange} add={() => {
    if (value.length < 20) onChange([...value, { ...structuredClone(value[0]), id: `pair-${crypto.randomUUID()}`, left: { en: '', am: '' }, right: { en: '', am: '' } }])
  }} render={(pair, index) => {
    const update = (next: MatchPair) => onChange(value.map((item, i) => i === index ? next : item))
    return <><div className={s.columns}><BilingualField label={`Pair ${index + 1} left / ጥያቄ`} value={pair.left} onChange={left => update({ ...pair, left })} /><BilingualField label={`Pair ${index + 1} right / መልስ`} value={pair.right} onChange={right => update({ ...pair, right })} /></div>
      <TextField label={`Pair ${index + 1} category`} value={pair.category} onChange={category => update({ ...pair, category })} />
      <BilingualField label={`Pair ${index + 1} relationship`} value={pair.explanation} onChange={explanation => update({ ...pair, explanation })} multiline />
      <label><input type="checkbox" checked={pair.verifiedLocales.includes('am')} onChange={event => update({ ...pair, verifiedLocales: event.target.checked ? ['en', 'am'] : ['en'] })} /> Reviewed Amharic pair {index + 1} / የተገመገመ አማርኛ</label>
      <SourcePicker value={pair.source} onChange={source => update({ ...pair, source })} /></>
  }} />
}
export function TimelineEditor({ value, onChange }: Editor<TlChain>) {
  return <><BilingualField label="Timeline title / የጊዜ ቅደም ተከተል" value={value.title} onChange={title => onChange({ ...value, title })} />
    <p className={s.notice}>Card order is the canonical Scripture order. Dates/eras are not part of TlEvent; do not invent dates. Notes provide the existing hint/explanation. / ቅደም ተከተሉ ከቅዱስ መጽሐፍ ጋር መዛመድ አለበት።</p>
    <OrderedCards items={value.events} label="event" identity={event => event.id} onChange={events => onChange({ ...value, events })}
      add={() => { if (value.events.length < 50) onChange({ ...value, events: [...value.events, { id: `event-${crypto.randomUUID()}`, title: { en: '', am: '' }, ref: '', route: '/bible/', note: '' }] }) }}
      render={(event, index) => {
        const update = (next: typeof event) => onChange({ ...value, events: value.events.map((item, i) => i === index ? next : item) })
        return <><BilingualField label={`Event ${index + 1} title`} value={event.title} onChange={title => update({ ...event, title })} />
          <TextField label={`Event ${index + 1} citation`} value={event.ref} onChange={ref => update({ ...event, ref })} />
          <TextField label={`Event ${index + 1} Bible route`} value={event.route} onChange={route => update({ ...event, route })} />
          <TextField label={`Event ${index + 1} hint`} value={event.note} onChange={note => update({ ...event, note })} multiline /></>
      }} /></>
}
export function HistoryChronologyEditor({ value, onChange }: Editor<HistoryStudioEvent[]>) {
  return <><p className={s.notice}>Documented AD years only; the existing chronology grader requires strictly increasing, distinct years. This is a local draft bank, not a quiz payload. / ይህ የአካባቢ የክስተት ረቂቅ ነው።</p>
    <OrderedCards items={value} label="historical event" identity={event => event.id} onChange={onChange} add={() => {
      if (value.length < 30) onChange([...value, { id: `history-${crypto.randomUUID()}`, year: 0, label: { en: '', am: '' }, source: structuredClone(value[0].source) }])
    }} render={(event, index) => {
      const update = (next: HistoryStudioEvent) => onChange(value.map((item, i) => i === index ? next : item))
      return <><BilingualField label={`Historical event ${index + 1}`} value={event.label} onChange={label => update({ ...event, label })} />
        <TextField label={`Historical year ${index + 1} (AD)`} type="number" value={String(event.year)} onChange={year => update({ ...event, year: Number(year) })} />
        <SourcePicker value={event.source} onChange={source => update({ ...event, source })} /></>
    }} /></>
}
export function AdventureEditor({ value, onChange }: Editor<BibleAdventureStory>) {
  return <><p className={s.notice}>The engine supports exactly three linear scenes. Branch creation, scene reordering and new artwork bindings are blocked; every correct outcome leads to the next scene. / ሦስት ተከታታይ ትዕይንቶች ብቻ ይደገፋሉ።</p>
    <label className={s.field}>Existing artwork/story template / የታሪክ አብነት<select value={value.id} onChange={event => {
      const story = bibleAdventureStories.find(item => item.id === event.target.value)
      if (story && window.confirm('Replace this draft with the selected story template? / አብነቱን ይቀይሩ?')) onChange(structuredClone(story))
    }}>{bibleAdventureStories.map(story => <option value={story.id} key={story.id}>{story.title.en}</option>)}</select></label>
    <BilingualField label="Story title / የታሪክ ርዕስ" value={value.title} onChange={title => onChange({ ...value, title })} />
    <BilingualField label="Story summary / ማጠቃለያ" value={value.summary} onChange={summary => onChange({ ...value, summary })} multiline />
    <TextField label="Story passage / ጥቅስ" value={value.passage} onChange={passage => onChange({ ...value, passage })} />
    <ol className={s.flow}>{value.scenes.map((scene, index) => <li key={index}>{scene.title.en} → {index < 2 ? value.scenes[index + 1].title.en : 'Complete / ተጠናቋል'}</li>)}</ol>
    {value.scenes.map((scene, index) => {
      const update = (next: typeof scene) => onChange({ ...value, scenes: value.scenes.map((item, i) => i === index ? next : item) as BibleAdventureStory['scenes'] })
      const interaction = scene.interaction
      return <fieldset className={s.group} key={index}><legend>Scene / ትዕይንት {index + 1}</legend>
        <BilingualField label={`Scene ${index + 1} title`} value={scene.title} onChange={title => update({ ...scene, title })} />
        <BilingualField label={`Scene ${index + 1} narrative`} value={scene.narrative} onChange={narrative => update({ ...scene, narrative })} multiline />
        <div className={s.columns}><TextField label={`Scene ${index + 1} source book`} value={scene.source.book} onChange={book => update({ ...scene, source: { ...scene.source, book } })} />
          <TextField label={`Scene ${index + 1} book slug`} value={scene.source.slug} onChange={slug => update({ ...scene, source: { ...scene.source, slug } })} />
          {(['chapter', 'firstVerse', 'lastVerse'] as const).map(key => <TextField key={key} label={`Scene ${index + 1} ${key}`} value={String(scene.source[key])} onChange={text => update({ ...scene, source: { ...scene.source, [key]: Number(text) } })} type="number" />)}</div>
        {interaction.kind === 'question' ? <>
          <BilingualField label={`Scene ${index + 1} prompt`} value={interaction.prompt} onChange={prompt => update({ ...scene, interaction: { ...interaction, prompt } })} />
          {interaction.choices.map((choice, choiceIndex) => <div className={s.card} key={choice.id}><BilingualField label={`Scene ${index + 1} choice ${choiceIndex + 1}`} value={choice.label} onChange={label => update({ ...scene, interaction: { ...interaction, choices: interaction.choices.map(item => item.id === choice.id ? { ...item, label } : item) } })} />
            <label><input type="radio" name={`scene-${index}`} checked={choice.id === interaction.correctId} onChange={() => update({ ...scene, interaction: { ...interaction, correctId: choice.id } })} /> Correct outcome / ትክክለኛ ውጤት</label></div>)}
          <BilingualField label={`Scene ${index + 1} explanation`} value={interaction.explanation} onChange={explanation => update({ ...scene, interaction: { ...interaction, explanation } })} multiline />
        </> : interaction.details.map((detail, detailIndex) => <div className={s.card} key={detail.id}>
          <BilingualField label={`Scene ${index + 1} discovery ${detailIndex + 1}`} value={detail.label} onChange={label => update({ ...scene, interaction: { ...interaction, details: interaction.details.map(item => item.id === detail.id ? { ...item, label } : item) as typeof interaction.details } })} />
          <BilingualField label={`Scene ${index + 1} finding ${detailIndex + 1}`} value={detail.finding} onChange={finding => update({ ...scene, interaction: { ...interaction, details: interaction.details.map(item => item.id === detail.id ? { ...item, finding } : item) as typeof interaction.details } })} multiline />
        </div>)}
      </fieldset>
    })}</>
}
export function MezmurEditor({ value, onChange }: Editor<MezmurSong>) {
  const [songs, setSongs] = useState<MezmurSong[]>([])
  const [message, setMessage] = useState('')
  const [busy, setBusy] = useState(false)
  return <><p className={s.notice}>The public game derives choose/arrange/type questions from published lyrics. These are local editing copies; saving here never changes a hymn or its media. / ይህ የአካባቢ ረቂቅ ነው።</p>
    <button type="button" disabled={busy} onClick={() => { setBusy(true); setMessage(''); void fetchMezmurLyrics({ sample: 60 }).then(rows => { setSongs(rows); if (!rows.length) setMessage('No eligible lyrics returned. Check source access; nothing was saved.') }).catch(() => setMessage('Unable to load published lyrics.')).finally(() => setBusy(false)) }}>Load published lyric sources / የታተሙ ግጥሞችን ጫን</button>
    {message && <p role="status">{message}</p>}
    {!!songs.length && <label className={s.field}>Published Mezmur / የታተመ መዝሙር<select value="" onChange={event => { const song = songs.find(item => item.slug === event.target.value); if (song) onChange(structuredClone(song)) }}><option value="">Choose… / ይምረጡ</option>{songs.map(song => <option key={song.slug} value={song.slug}>{song.title_amharic || song.title}</option>)}</select></label>}
    <TextField label="Mezmur slug / መለያ" value={value.slug} onChange={slug => onChange({ ...value, slug })} />
    <BilingualField label="Mezmur title / ርዕስ" value={{ en: value.title_english || value.title, am: value.title_amharic || '' }} onChange={title => onChange({ ...value, title: title.en, title_english: title.en, title_amharic: title.am || null })} />
    <TextField label="Amharic lyrics / የአማርኛ ግጥም" value={value.lyrics_amharic || ''} onChange={lyrics_amharic => onChange({ ...value, lyrics_amharic })} multiline />
    <TextField label="Transliteration / ትርጉም ንባብ" value={value.lyrics_transliteration || ''} onChange={lyrics_transliteration => onChange({ ...value, lyrics_transliteration })} multiline />
    <TextField label="English lyrics / የእንግሊዝኛ ግጥም" value={value.lyrics_english || ''} onChange={lyrics_english => onChange({ ...value, lyrics_english })} multiline />
    <TextField label="Existing YouTube link / ያለ የYouTube አድራሻ" value={value.youtube_url || ''} onChange={youtube_url => onChange({ ...value, youtube_url })} />
    <Link to="/admin/hymns/mezmur">Open authorized hymn library for actual lyric/media edits / የመዝሙር ቤተ-መጻሕፍት</Link></>
}
function ImageCardsEditor({ value, onChange, kind }: Editor<PlayImage[]> & { kind: 'feasts' | 'saints' | 'icon-memory' }) {
  const [undo, setUndo] = useState<{ id: string; previous: PlayImage } | null>(null)
  const available = PLAY_IMAGES.filter(item => kind === 'feasts' ? item.kind === 'feast' : kind === 'saints' ? item.kind !== 'feast' : true)
  return <><p className={s.notice}>Existing game-catalog artwork only. Progressive clues, new calendar rules and arbitrary uploads are not supported by PlayImage. / ያሉ ሥዕሎችን ይምረጡ።</p>
    <OrderedCards items={value} label="image card" identity={item => item.id} onChange={onChange} add={() => {
      const next = available.find(item => !value.some(current => current.id === item.id))
      if (next && value.length < 12) onChange([...value, structuredClone(next)])
    }} render={(item, index) => {
      const update = (next: PlayImage) => onChange(value.map((current, i) => i === index ? next : current))
      return <><StudioImageField item={item} index={index} available={available} used={value.filter((_, i) => i !== index).map(image => image.id)}
        onChange={next => { setUndo({ id: next.id, previous: structuredClone(item) }); update(next) }}
        onUndo={undo?.id === item.id && !value.some((current, i) => i !== index && current.id === undo.previous.id) ? () => { update(undo.previous); setUndo(null) } : undefined} />
        <BilingualField label={`Image ${index + 1} answer`} value={item.answer} onChange={answer => update({ ...item, answer })} />
        <BilingualField label={`Image ${index + 1} explanation`} value={item.explanation} onChange={explanation => update({ ...item, explanation })} multiline />
        <TextField label={`Image ${index + 1} accessible description`} value={item.description} onChange={description => update({ ...item, description })} />
        {kind === 'feasts' && <TextField label={`Feast ${index + 1} date as documented`} value={item.when || ''} onChange={when => update({ ...item, when })} />}
        <SourcePicker value={item.source} onChange={source => update({ ...item, source })} /></>
    }} /></>
}
export function FeastEditor(props: Editor<PlayImage[]>) { return <ImageCardsEditor {...props} kind="feasts" /> }
export function SaintEditor(props: Editor<PlayImage[]>) { return <ImageCardsEditor {...props} kind="saints" /> }
export function MemoryEditor(props: Editor<PlayImage[]>) {
  return <><div className={s.actions}><span>Memory difficulty: pair count / የጥንድ ብዛት</span>{[4, 6, 8].map(count => <button key={count} type="button" aria-pressed={props.value.length === count} onClick={() => {
    const next = props.value.slice(0, count)
    for (const image of PLAY_IMAGES) { if (next.length >= count) break; if (!next.some(item => item.id === image.id)) next.push(structuredClone(image)) }
    props.onChange(next)
  }}>{count} pairs / ጥንዶች</button>)}</div><ImageCardsEditor {...props} kind="icon-memory" /></>
}
export function GameEditor({ draft, onChange }: { draft: StudioDraft; onChange: (draft: StudioDraft) => void }) {
  if (isHistoryTimeline(draft)) return <HistoryChronologyEditor value={draft.content} onChange={content => onChange({ ...draft, content })} />
  if (isQuizStudioGame(draft.game)) {
    const Component = draft.game === 'history' ? HistoryEditor : draft.game === 'emoji' ? EmojiEditor : draft.game === 'finish-the-verse' ? VerseEditor : TriviaEditor
    return <Component value={draft.content as PlayQuestion} onChange={content => onChange({ game: draft.game, content } as StudioDraft)} />
  }
  switch (draft.game) {
    case 'who-am-i': return <IdentityEditor value={draft.content} onChange={content => onChange({ ...draft, content })} />
    case 'match': return <MatchEditor value={draft.content} onChange={content => onChange({ ...draft, content })} />
    case 'bible-timeline': return <TimelineEditor value={draft.content} onChange={content => onChange({ ...draft, content })} />
    case 'adventures': return <AdventureEditor value={draft.content} onChange={content => onChange({ ...draft, content })} />
    case 'finish-the-mezmur': return <MezmurEditor value={draft.content} onChange={content => onChange({ ...draft, content })} />
    case 'feasts': return <FeastEditor value={draft.content} onChange={content => onChange({ ...draft, content })} />
    case 'saints': return <SaintEditor value={draft.content} onChange={content => onChange({ ...draft, content })} />
    case 'icon-memory': return <MemoryEditor value={draft.content} onChange={content => onChange({ ...draft, content })} />
  }
}
