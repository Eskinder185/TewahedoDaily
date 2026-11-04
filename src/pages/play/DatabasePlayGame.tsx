import { useEffect, useMemo, useState } from 'react'
import { useSearchParams } from 'react-router-dom'
import { usePublishedPlayContent } from '../../hooks/usePublishedPlayContent'
import type { StudioDraft, StudioGame } from '../../lib/play/contentStudio'
import { isHistoryTimeline } from '../../lib/play/contentStudio'
import type { AppLocale } from '../../lib/i18n/locale'
import type { MezmurSong } from '../../lib/play/finishMezmur'
import { fetchSelectedMezmurLyrics } from '../../lib/play/selectedMezmurSource'
import { DatabaseContentStatus } from '../../components/play/DatabaseContentStatus'
import { QuizGame } from '../../components/play/QuizGame'
import { WhoAmIGame } from '../../components/play/WhoAmIGame'
import { MatchGame } from '../../components/play/MatchGame'
import { BibleTimelineGame } from '../../components/play/BibleTimelineGame'
import { HistoryQuestGame } from '../../components/play/HistoryQuestGame'
import { PictureQuizGame } from '../../components/play/PictureQuizGame'
import { IconMemoryGame } from '../../components/play/IconMemoryGame'
import { FinishMezmurGame } from '../../components/play/FinishMezmurGame'
import type { PlayDifficulty } from '../../lib/play/types'
import { getDailyChallenge } from '../../lib/play/progress'

function SelectedLyrics({ drafts, locale }: { drafts: StudioDraft[]; locale: AppLocale }) {
  const [result, setResult] = useState<{ songs: MezmurSong[]; state: 'loading' | 'ready' | 'error' }>({ songs: [], state: 'loading' })
  const [attempt, setAttempt] = useState(0)
  useEffect(() => {
    let active = true
    const slugs = drafts.flatMap(draft => draft.game === 'finish-the-mezmur' ? [draft.content.slug] : [])
    void fetchSelectedMezmurLyrics(slugs).then(songs => { if (active) setResult({ songs, state: 'ready' }) }, () => { if (active) setResult({ songs: [], state: 'error' }) })
    return () => { active = false }
  }, [drafts, attempt])
  if (result.state !== 'ready' || result.songs.length < 4) return <DatabaseContentStatus locale={locale} state={result.state === 'ready' ? 'empty' : result.state} retry={() => { setResult({ songs: [], state: 'loading' }); setAttempt(value => value + 1) }} />
  return <FinishMezmurGame locale={locale} providedSongs={result.songs} />
}
export function DatabasePlayGame({ game, locale }: { game: StudioGame; locale: AppLocale }) {
  const { drafts, state, retry } = usePublishedPlayContent(game)
  const [params] = useSearchParams()
  const content = useMemo(() => ({
    questions: drafts.flatMap(draft => ['trivia', 'emoji', 'finish-the-verse', 'history'].includes(draft.game) && !isHistoryTimeline(draft) && 'prompt' in draft.content ? [draft.content] : []),
    who: drafts.flatMap(draft => draft.game === 'who-am-i' ? [draft.content] : []),
    pairs: drafts.flatMap(draft => draft.game === 'match' ? draft.content : []),
    chains: drafts.flatMap(draft => draft.game === 'bible-timeline' ? [draft.content] : []),
    timeline: drafts.flatMap(draft => isHistoryTimeline(draft) ? draft.content : []),
    images: drafts.flatMap(draft => draft.game === 'feasts' || draft.game === 'saints' || draft.game === 'icon-memory' ? draft.content : []),
  }), [drafts])
  if (state !== 'ready' || !drafts.length) return <DatabaseContentStatus locale={locale} state={state === 'ready' ? 'empty' : state} retry={retry} />
  const level = ['beginner', 'growing', 'challenge'].find(value => value === params.get('level')) as PlayDifficulty | undefined
  switch (game) {
    case 'who-am-i': return <WhoAmIGame locale={locale} cards={content.who} />
    case 'match': return content.pairs.length < 4 ? <DatabaseContentStatus locale={locale} state="empty" retry={retry} /> : <MatchGame locale={locale} pairs={content.pairs} />
    case 'history': return <HistoryQuestGame locale={locale} questions={content.questions} timeline={content.timeline} useFallbackHints={false} />
    case 'bible-timeline': return <BibleTimelineGame locale={locale} chains={content.chains} />
    case 'finish-the-mezmur': return <SelectedLyrics drafts={drafts} locale={locale} />
    case 'icon-memory': return <IconMemoryGame locale={locale} pool={content.images} />
    case 'feasts': case 'saints': return <PictureQuizGame locale={locale} config={{ game, pool: content.images, prompt: { en: game === 'feasts' ? 'Which feast does this picture show?' : 'Who is shown in this icon?', am: game === 'feasts' ? 'ይህ ሥዕል የትኛውን በዓል ያሳያል?' : 'በዚህ ሥዕል ያለው ማን ነው?' }, noun: { en: game === 'feasts' ? 'feast' : 'saint', am: game === 'feasts' ? 'በዓል' : 'ቅዱስ' } }} />
    default: return <QuizGame key={level || 'default'} locale={locale} game={game as 'trivia' | 'emoji' | 'finish-the-verse'} questions={content.questions} initialDifficulty={level} dailyQuestionIndex={game === 'trivia' && params.get('daily') === '1' ? getDailyChallenge().questionIndex : undefined} />
  }
}
