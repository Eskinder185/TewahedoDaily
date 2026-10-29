import { useEffect, useMemo, useState } from 'react'
import { useSearchParams } from 'react-router-dom'
import { GameShell } from '../../components/play/GameShell'
import { MatchGame } from '../../components/play/MatchGame'
import { QuizGame } from '../../components/play/QuizGame'
import { WhoAmIGame } from '../../components/play/WhoAmIGame'
import { HistoryQuestGame } from '../../components/play/HistoryQuestGame'
import { MezmurGame } from '../../components/play/MezmurGame'
import { PictureQuizGame } from '../../components/play/PictureQuizGame'
import { IconMemoryGame } from '../../components/play/IconMemoryGame'
import { useLocale } from '../../lib/i18n/locale'
import { questionsFor } from '../../lib/play/approvedContent'
import { loadPublishedPlayQuestions } from '../../lib/play/contentService'
import { GAME_ART, feastImages, holyPersonImages } from '../../lib/play/imageCatalog'
import { getDailyChallenge } from '../../lib/play/progress'
import { withoutLibrarySources, withPublicSources } from '../../lib/play/sourceAvailability'
import type { PlayDifficulty, PlayGameType, PlayQuestion } from '../../lib/play/types'

type QuizPageGame = Exclude<PlayGameType, 'adventure'>
type PageGame = QuizPageGame | 'who-am-i' | 'match' | 'feasts' | 'saints' | 'icon-memory'

const META: Record<PageGame, { title: { en: string; am: string }; subtitle: { en: string; am: string } }> = {
  trivia: { title: { en: 'Bible & Tewahedo Trivia', am: 'የመጽሐፍ ቅዱስና ተዋሕዶ ጥያቄ' }, subtitle: { en: 'Choose a level, answer sourced questions, and learn from every explanation.', am: 'ደረጃ ይምረጡ፣ ምንጭ ያላቸውን ጥያቄዎች ይመልሱ፣ ከማብራሪያውም ይማሩ።' } },
  emoji: { title: { en: 'Holy Emoji Challenge', am: 'የቅዱስ ኢሞጂ ፈተና' }, subtitle: { en: 'Decode visual clues. Fewer hints earn a stronger round.', am: 'የምስል ፍንጮችን ይፍቱ። ጥቂት ፍንጭ የተሻለ ውጤት ያስገኛል።' } },
  'finish-the-verse': { title: { en: 'Finish the Verse', am: 'ጥቅሱን ይጨርሱ' }, subtitle: { en: 'Complete exact excerpts from the site’s English and Amharic Bible sources.', am: 'ከጣቢያው የእንግሊዝኛና የአማርኛ መጽሐፍ ቅዱስ ትክክለኛ ጥቅሶችን ያሟሉ።' } },
  'finish-the-mezmur': { title: { en: 'Finish the Mezmur', am: 'መዝሙሩን ይጨርሱ' }, subtitle: { en: 'Only editor-published questions tied to verified Mezmur records appear here.', am: 'ከተረጋገጡ የመዝሙር መዝገቦች ጋር የተያያዙ በአርታዒ የታተሙ ጥያቄዎች ብቻ እዚህ ይታያሉ።' } },
  history: { title: { en: 'History Quest', am: 'የታሪክ ጉዞ' }, subtitle: { en: 'Explore reviewed Ethiopian and worldwide Church history with linked sources.', am: 'የተገመገመውን የኢትዮጵያና የዓለም ቤተ ክርስቲያን ታሪክ በምንጮች ያስሱ።' } },
  'who-am-i': { title: { en: 'Who Am I?', am: 'እኔ ማን ነኝ?' }, subtitle: { en: 'A fast family guessing game—no camera required.', am: 'ፈጣን የቤተሰብ ግምት ጨዋታ—ካሜራ አያስፈልግም።' } },
  match: { title: { en: 'Match & Discover', am: 'ያዛምዱና ያግኙ' }, subtitle: { en: 'Find the relationships, then read why every pair belongs together.', am: 'ግንኙነቶቹን ያግኙ፣ ከዚያም እያንዳንዱ ጥንድ ለምን እንደሚዛመድ ያንብቡ።' } },
  feasts: { title: { en: 'Church Feast Challenge', am: 'የበዓላት ፈተና' }, subtitle: { en: 'Look at the icon or photograph and name the feast it shows.', am: 'ሥዕሉን ተመልክተው የትኛው በዓል እንደሆነ ይለዩ።' } },
  saints: { title: { en: 'Guess the Saint', am: 'ቅዱሱን ይለዩ' }, subtitle: { en: 'Recognise the angels and saints of the Church from their icons.', am: 'መላእክትንና ቅዱሳንን ከሥዕላቸው ይለዩ።' } },
  'icon-memory': { title: { en: 'Icon Memory', am: 'የሥዕል ትውስታ' }, subtitle: { en: 'Turn the cards and match each holy picture with its name.', am: 'ካርዶቹን ገልጠው እያንዳንዱን ቅዱስ ሥዕል ከስሙ ጋር ያዛምዱ።' } },
}

const LEVELS: PlayDifficulty[] = ['beginner', 'growing', 'challenge']

export function PlayGamePage({ game }: { game: PageGame }) {
  const { locale } = useLocale()
  const [searchParams] = useSearchParams()
  const meta = META[game]
  const isQuiz = !['who-am-i', 'match', 'feasts', 'saints', 'icon-memory'].includes(game)
  // Church Library questions only appear once their book is published.
  const staticQuestions = useMemo(() => isQuiz ? withoutLibrarySources(questionsFor(game as QuizPageGame)) : [], [game, isQuiz])
  const [questions, setQuestions] = useState<PlayQuestion[]>(staticQuestions)
  const level = LEVELS.find((l) => l === searchParams.get('level'))

  useEffect(() => {
    if (!isQuiz) return
    let active = true
    void (async () => {
      const [publicStatic, published] = await Promise.all([
        withPublicSources(questionsFor(game as QuizPageGame)),
        loadPublishedPlayQuestions(game as QuizPageGame).then(withPublicSources),
      ])
      if (!active) return
      const merged = new Map([...publicStatic, ...published].map((item) => [item.id, item]))
      if (merged.size !== staticQuestions.length) setQuestions([...merged.values()])
    })()
    return () => { active = false }
  }, [game, isQuiz, staticQuestions])

  const body = (() => {
    switch (game) {
      case 'who-am-i': return <WhoAmIGame locale={locale} />
      case 'match': return <MatchGame locale={locale} />
      case 'history': return <HistoryQuestGame locale={locale} questions={questions} />
      case 'finish-the-mezmur': return <MezmurGame locale={locale} questions={questions} />
      case 'feasts': return <PictureQuizGame locale={locale} config={{ game: 'feasts', pool: feastImages(), prompt: { en: 'Which feast does this picture show?', am: 'ይህ ሥዕል የትኛውን በዓል ያሳያል?' }, noun: { en: 'feast', am: 'በዓል' } }} />
      case 'saints': return <PictureQuizGame locale={locale} config={{ game: 'saints', pool: holyPersonImages(), prompt: { en: 'Who is shown in this icon?', am: 'በዚህ ሥዕል ያለው ማን ነው?' }, noun: { en: 'saint', am: 'ቅዱስ' } }} />
      case 'icon-memory': return <IconMemoryGame locale={locale} />
      default: return <QuizGame key={level ?? 'default'} locale={locale} game={game} questions={questions} initialDifficulty={level} dailyQuestionIndex={game === 'trivia' && searchParams.get('daily') === '1' ? getDailyChallenge().questionIndex : undefined} />
    }
  })()

  return (
    <GameShell locale={locale} title={meta.title[locale]} subtitle={meta.subtitle[locale]} art={GAME_ART[game]}>
      {body}
    </GameShell>
  )
}
