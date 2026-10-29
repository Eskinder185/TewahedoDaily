import { useEffect, useMemo, useState } from 'react'
import { useSearchParams } from 'react-router-dom'
import { GameShell } from '../../components/play/GameShell'
import { MatchGame } from '../../components/play/MatchGame'
import { QuizGame } from '../../components/play/QuizGame'
import { WhoAmIGame } from '../../components/play/WhoAmIGame'
import { HistoryQuestGame } from '../../components/play/HistoryQuestGame'
import { MezmurGame } from '../../components/play/MezmurGame'
import { useLocale } from '../../lib/i18n/locale'
import { questionsFor } from '../../lib/play/approvedContent'
import { loadPublishedPlayQuestions } from '../../lib/play/contentService'
import { getDailyChallenge } from '../../lib/play/progress'
import type { PlayGameType, PlayQuestion } from '../../lib/play/types'

type PageGame = Exclude<PlayGameType, 'adventure'> | 'who-am-i' | 'match'

const META: Record<PageGame, { title: { en: string; am: string }; subtitle: { en: string; am: string } }> = {
  trivia: { title: { en: 'Bible & Tewahedo Trivia', am: 'የመጽሐፍ ቅዱስና ተዋሕዶ ጥያቄ' }, subtitle: { en: 'Choose a level, answer sourced questions, and learn from every explanation.', am: 'ደረጃ ይምረጡ፣ ምንጭ ያላቸውን ጥያቄዎች ይመልሱ፣ ከማብራሪያውም ይማሩ።' } },
  emoji: { title: { en: 'Holy Emoji Challenge', am: 'የቅዱስ ኢሞጂ ፈተና' }, subtitle: { en: 'Decode visual clues. Fewer hints earn a stronger round.', am: 'የምስል ፍንጮችን ይፍቱ። ጥቂት ፍንጭ የተሻለ ውጤት ያስገኛል።' } },
  'finish-the-verse': { title: { en: 'Finish the Verse', am: 'ጥቅሱን ይጨርሱ' }, subtitle: { en: 'Complete exact excerpts from the site’s English and Amharic Bible sources.', am: 'ከጣቢያው የእንግሊዝኛና የአማርኛ መጽሐፍ ቅዱስ ትክክለኛ ጥቅሶችን ያሟሉ።' } },
  'finish-the-mezmur': { title: { en: 'Finish the Mezmur', am: 'መዝሙሩን ይጨርሱ' }, subtitle: { en: 'Only editor-published questions tied to verified Mezmur records appear here.', am: 'ከተረጋገጡ የመዝሙር መዝገቦች ጋር የተያያዙ በአርታዒ የታተሙ ጥያቄዎች ብቻ እዚህ ይታያሉ።' } },
  history: { title: { en: 'History Quest', am: 'የታሪክ ጉዞ' }, subtitle: { en: 'Explore reviewed Ethiopian and worldwide Church history with linked sources.', am: 'የተገመገመውን የኢትዮጵያና የዓለም ቤተ ክርስቲያን ታሪክ በምንጮች ያስሱ።' } },
  'who-am-i': { title: { en: 'Who Am I?', am: 'እኔ ማን ነኝ?' }, subtitle: { en: 'A fast family guessing game—no camera required.', am: 'ፈጣን የቤተሰብ ግምት ጨዋታ—ካሜራ አያስፈልግም።' } },
  match: { title: { en: 'Match & Discover', am: 'ያዛምዱና ያግኙ' }, subtitle: { en: 'Find the relationships, then read why every pair belongs together.', am: 'ግንኙነቶቹን ያግኙ፣ ከዚያም እያንዳንዱ ጥንድ ለምን እንደሚዛመድ ያንብቡ።' } },
}

export function PlayGamePage({ game }: { game: PageGame }) {
  const { locale } = useLocale()
  const [searchParams] = useSearchParams()
  const meta = META[game]
  const staticQuestions = useMemo(() => game === 'who-am-i' || game === 'match' ? [] : questionsFor(game), [game])
  const [questions, setQuestions] = useState<PlayQuestion[]>(staticQuestions)

  useEffect(() => {
    if (game === 'who-am-i' || game === 'match') return
    let active = true
    void loadPublishedPlayQuestions(game).then((published) => {
      if (!active || !published.length) return
      const merged = new Map([...staticQuestions, ...published].map((item) => [item.id, item]))
      setQuestions([...merged.values()])
    })
    return () => { active = false }
  }, [game, staticQuestions])

  return <GameShell locale={locale} title={meta.title[locale]} subtitle={meta.subtitle[locale]}>
    {game === 'who-am-i' ? <WhoAmIGame locale={locale} /> : game === 'match' ? <MatchGame locale={locale} /> : game === 'history' ? <HistoryQuestGame locale={locale} questions={questions} /> : game === 'finish-the-mezmur' ? <MezmurGame locale={locale} questions={questions} /> : <QuizGame locale={locale} game={game} questions={questions} dailyQuestionIndex={game === 'trivia' && searchParams.get('daily') === '1' ? getDailyChallenge().questionIndex : undefined} />}
  </GameShell>
}
