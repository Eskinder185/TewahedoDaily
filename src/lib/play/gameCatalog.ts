/**
 * Public Faith Challenges hub metadata: the ONE definition read by both the public hub (/play) and the
 * Game Content Studio (/admin/play), so the CMS mirrors exactly what visitors see. Presentation only:
 * game IDs, routes and gameplay stay canonical elsewhere. Editing these values here changes the live hub;
 * the Studio's "Game settings" view only prepares local, unpublished proposals (see docs).
 */
import type { AppLocale } from '../i18n/locale'
import { GAME_ART } from './imageCatalog'
import type { StudioGame } from './contentStudio'

type Text = Record<AppLocale, string>
export type HubSection = 'scripture' | 'pictures' | 'music' | 'history' | 'group'
export type PlayArt = (typeof GAME_ART)[string]
export type CatalogGame = {
  id: string
  section: HubSection
  route: string
  art: PlayArt
  title: Text
  category: Text
  description: Text
  meta?: Text
  levels?: boolean
}

const t = (en: string, am: string): Text => ({ en, am })

export const HUB_GAMES: CatalogGame[] = [
  { id: 'feasts', section: 'pictures', route: '/play/feasts', art: GAME_ART.feasts,
    title: t('Church Feast Challenge', 'የበዓላት ፈተና'), category: t('Pictures', 'ሥዕሎች'),
    description: t('Name the feast from its icon or photograph — Gena, Timket, Meskel and more.', 'በዓሉን ከሥዕሉ ይለዩ — ገና፣ ጥምቀት፣ መስቀልና ሌሎችም።'),
    meta: t('Reveal mode', 'የመግለጥ ሁነታ') },
  { id: 'saints', section: 'pictures', route: '/play/saints', art: GAME_ART.saints,
    title: t('Guess the Saint', 'ቅዱሱን ይለዩ'), category: t('Pictures', 'ሥዕሎች'),
    description: t('Recognise the archangels and saints of the Church from their icons.', 'ሊቃነ መላእክትንና ቅዱሳንን ከሥዕላቸው ይለዩ።') },
  { id: 'icon-memory', section: 'pictures', route: '/play/icon-memory', art: GAME_ART['icon-memory'],
    title: t('Icon Memory', 'የሥዕል ትውስታ'), category: t('Pictures', 'ሥዕሎች'),
    description: t('Turn the cards and match every holy picture with its name.', 'ካርዶቹን ገልጠው ቅዱስ ሥዕልን ከስሙ ጋር ያዛምዱ።'),
    meta: t('4–8 pairs', '4–8 ጥንዶች') },
  { id: 'trivia', section: 'scripture', route: '/play/trivia', art: GAME_ART.trivia, levels: true,
    title: t('Bible & Tewahedo Trivia', 'የመጽሐፍ ቅዱስና ተዋሕዶ ጥያቄ'), category: t('Scripture', 'መጽሐፍ ቅዱስ'),
    description: t('Sourced questions, clear explanations, and a pace you choose.', 'ምንጭ ያላቸው ጥያቄዎች፣ ግልጽ ማብራሪያና በሚመርጡት ፍጥነት።'),
    meta: t('Rounds of 5, 10 or 20', 'የ5፣ 10 ወይም 20 ዙሮች') },
  { id: 'emoji', section: 'scripture', route: '/play/emoji', art: GAME_ART.emoji, levels: true,
    title: t('Holy Emoji Challenge', 'የቅዱስ ኢሞጂ ፈተና'), category: t('Scripture', 'መጽሐፍ ቅዱስ'),
    description: t('Decode emoji clues to Bible stories. Fewer hints, stronger round.', 'የኢሞጂ ፍንጮችን ወደ መጽሐፍ ቅዱስ ታሪኮች ይፍቱ።'),
    meta: t('Hints available', 'ፍንጭ አለ') },
  { id: 'finish-the-verse', section: 'scripture', route: '/play/finish-the-verse', art: GAME_ART['finish-the-verse'], levels: true,
    title: t('Finish the Verse', 'ጥቅሱን ይጨርሱ'), category: t('Scripture', 'መጽሐፍ ቅዱስ'),
    description: t('Complete exact excerpts from the English and Amharic Bible.', 'ከእንግሊዝኛና ከአማርኛ መጽሐፍ ቅዱስ ጥቅሶችን ያሟሉ።'),
    meta: t('English + አማርኛ', 'አማርኛ + English') },
  { id: 'bible-timeline', section: 'scripture', route: '/play/bible-timeline', art: GAME_ART['bible-timeline'],
    title: t('Bible Timeline Challenge', 'የመጽሐፍ ቅዱስ የጊዜ ቅደም ተከተል'), category: t('Scripture', 'መጽሐፍ ቅዱስ'),
    description: t('Arrange Bible events in the order they happened, with exact references.', 'የመጽሐፍ ቅዱስ ክስተቶችን በተፈጸሙበት ቅደም ተከተል ያስቀምጡ።'),
    meta: t('3–8 events per round · 3 levels', 'በዙር 3–8 ክስተቶች · 3 ደረጃዎች') },
  { id: 'adventures', section: 'scripture', route: '/play/adventures', art: GAME_ART.adventures,
    title: t('Bible Adventure', 'የመጽሐፍ ቅዱስ ጀብዱ'), category: t('Story', 'ታሪክ'),
    description: t('Explore interactive stories from Scripture in three scenes, with learning checkpoints.', 'የመጽሐፍ ቅዱስ ታሪኮችን በሦስት ትዕይንቶችና የመማሪያ ነጥቦች ይጓዙ።') },
  { id: 'mezmur', section: 'music', route: '/play/finish-the-mezmur', art: GAME_ART['finish-the-mezmur'],
    title: t('Finish the Mezmur', 'መዝሙሩን ይጨርሱ'), category: t('Mezmur', 'መዝሙር'),
    description: t('Complete lines from published hymn lyrics, in the order they are sung.', 'ከታተሙ መዝሙሮች ግጥም መስመሮችን ያሟሉ።') },
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

export const HUB_SECTIONS: { id: HubSection | 'all'; label: Text }[] = [
  { id: 'all', label: t('All games', 'ሁሉም') },
  { id: 'pictures', label: t('Icons & feasts', 'ሥዕሎችና በዓላት') },
  { id: 'scripture', label: t('Scripture', 'መጽሐፍ ቅዱስ') },
  { id: 'music', label: t('Mezmur', 'መዝሙር') },
  { id: 'history', label: t('History', 'ታሪክ') },
  { id: 'group', label: t('Family & group', 'ቤተሰብና ቡድን') },
]

/** Hub game id → Studio editor id (the hub says `mezmur`, the Studio and route say Finish the Mezmur). */
export function studioIdForHubGame(id: string): StudioGame {
  return (id === 'mezmur' ? 'finish-the-mezmur' : id) as StudioGame
}
export function hubGameForStudio(id: string): CatalogGame | undefined {
  return HUB_GAMES.find(game => studioIdForHubGame(game.id) === id)
}
