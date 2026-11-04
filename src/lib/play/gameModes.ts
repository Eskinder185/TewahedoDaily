/** Presentation only: existing game IDs, routes and gameplay remain canonical. */
export const GAME_MODES = [
  { id: 'knowledge', icon: '✦', en: 'Knowledge Battle', am: 'የእውቀት ውድድር',
    description: { en: 'Choose an answer, build a streak, and discover the source.', am: 'መልስ ይምረጡ፣ እውቀትዎን ያዳብሩ፣ ምንጩን ያግኙ።' },
    games: ['trivia', 'history', 'feasts'] },
  { id: 'timeline', icon: '↔', en: 'Timeline & Discovery', am: 'ቅደም ተከተልና ግኝት',
    description: { en: 'Put events in order and explore the connections between them.', am: 'ክስተቶችን በቅደም ተከተል ያስቀምጡ፣ ግንኙነታቸውን ይወቁ።' },
    games: ['bible-timeline', 'history'] },
  { id: 'visual', icon: '◈', en: 'Visual Discovery', am: 'በሥዕል ይወቁ',
    description: { en: 'Uncover clues, decode emoji, and find matching pairs.', am: 'ፍንጮችን ይፈልጉ፣ ኢሞጂዎችን ይፍቱ፣ ጥንዶችን ያዛምዱ።' },
    games: ['icon-memory', 'saints', 'who-am-i', 'emoji', 'match', 'feasts'] },
  { id: 'word', icon: 'ፊ', en: 'Complete the Word', am: 'ቃሉን ያሟሉ',
    description: { en: 'Find missing words in sourced Scripture and Mezmur lyrics.', am: 'ከምንጭ በተወሰዱ ጥቅሶችና መዝሙሮች የጎደሉ ቃላትን ያሟሉ።' },
    games: ['finish-the-verse', 'finish-the-mezmur'] },
  { id: 'story', icon: '⛵', en: 'Story Adventure', am: 'የታሪክ ጀብዱ',
    description: { en: 'Explore scenes, make choices, and learn from Bible stories.', am: 'ትዕይንቶችን ያስሱ፣ ምርጫ ያድርጉ፣ ከመጽሐፍ ቅዱስ ታሪኮች ይማሩ።' },
    games: ['adventures'] },
] as const
export type GameModeId = typeof GAME_MODES[number]['id']
export const GAME_MODE_IDS = GAME_MODES.map(mode => mode.id)
/** Shared-screen links only. There is no mixed-room protocol or shared scoring. */
export const MIXED_CHALLENGE_GUIDE = [
  { mode: 'knowledge', route: '/play/trivia', en: 'Warm-up · Knowledge Battle', am: 'መነሻ · የእውቀት ውድድር' },
  { mode: 'visual', route: '/play/icon-memory', en: 'Picture round · Icon Memory', am: 'የሥዕል ትውስታ' },
  { mode: 'timeline', route: '/play/bible-timeline', en: 'Timeline round · Order the events', am: 'ክስተቶችን በቅደም ተከተል ያደራጁ' },
  { mode: 'word', route: '/play/finish-the-verse', en: 'Word round · Finish the Verse', am: 'የቃላት ዙር · ጥቅሱን ይጨርሱ' },
  { mode: 'story', route: '/play/adventures', en: 'Grand finale · Bible Adventure', am: 'መጨረሻ · የመጽሐፍ ቅዱስ ጀብዱ' },
] as const
export function gameInMode(game: string, mode: string): boolean {
  const canonical = game === 'mezmur' ? 'finish-the-mezmur' : game === 'adventure' ? 'adventures' : game
  return mode === 'all' || !!GAME_MODES.find(entry => entry.id === mode)?.games.some(id => id === canonical)
}

/** Existing completion history supports replay links, not resuming partial rounds. */
export function recentGames(history: readonly { game: string }[]): string[] {
  const supported = new Set<string>(GAME_MODES.flatMap(mode => [...mode.games]))
  return [...new Set(history.map(entry => entry.game === 'adventure' ? 'adventures' : entry.game))]
    .filter(game => supported.has(game)).slice(0, 3)
}
