/** Every Faith Challenge game has its own icon (no generic fallback), and look-alike games stay distinct. Run: npx tsx --tsconfig tsconfig.app.json scripts/test-game-icons.ts */
import assert from 'node:assert/strict'
import { createElement } from 'react'
import { renderToStaticMarkup } from 'react-dom/server'
process.env.VITE_SUPABASE_URL ||= 'https://icons-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY ||= 'synthetic-public-key'
const { GameIcon } = await import('../src/components/play/GameIcon.tsx')
const { HUB_GAMES, studioIdForHubGame } = await import('../src/lib/play/gameCatalog.ts')

const render = (id: string) => renderToStaticMarkup(createElement(GameIcon, { id }))
const iconOf = (markup: string) => /data-game-icon="([^"]+)"/.exec(markup)?.[1]
const EXPECTED: Record<string, string> = {
  trivia: 'trivia', emoji: 'emoji', 'finish-the-verse': 'finish-the-verse', mezmur: 'finish-the-mezmur', history: 'history',
  'who-am-i': 'who-am-i', match: 'match', feasts: 'feasts', saints: 'saints', 'icon-memory': 'icon-memory', adventures: 'adventures', 'bible-timeline': 'bible-timeline',
}
let passed = 0
const test = async (name: string, fn: () => void | Promise<void>) => { await fn(); passed += 1; console.log(`PASS ${name}`) }

await test('all 12 hub games, and the route/studio ids that alias them, get their own icon (never the generic fallback)', () => {
  assert.equal(HUB_GAMES.length, 12)
  assert.deepEqual(HUB_GAMES.map((game: { id: string }) => game.id).sort(), Object.keys(EXPECTED).sort())
  for (const game of HUB_GAMES) assert.equal(iconOf(render(game.id)), EXPECTED[game.id], game.id)
  for (const alias of ['finish-the-mezmur', 'adventure']) assert.notEqual(iconOf(render(alias)), 'fallback', alias)
  for (const game of HUB_GAMES) assert.notEqual(iconOf(render(studioIdForHubGame(game.id))), 'fallback', `studio id of ${game.id}`)
  assert.equal(iconOf(render('not-a-game')), 'fallback')
})

await test('the 12 icons are twelve different drawings, and none is the fallback drawing', () => {
  const drawings = HUB_GAMES.map((game: { id: string }) => render(game.id).replace(/data-game-icon="[^"]*"/, ''))
  assert.equal(new Set(drawings).size, 12)
  const fallback = render('not-a-game').replace(/data-game-icon="[^"]*"/, '')
  assert.ok(drawings.every((drawing: string) => drawing !== fallback))
})

await test('Match & Discover (linked circles) is clearly different from Icon Memory (four cards)', () => {
  const match = render('match'), memory = render('icon-memory')
  assert.match(match, /<circle/); assert.doesNotMatch(match, /<rect/)
  assert.match(memory, /<rect/); assert.equal((memory.match(/<rect/g) ?? []).length, 4)
  assert.match(match, /M24 19\.5v9M19\.8 24h8\.4/, 'a cross where the circles meet')
})

await test('icons are decorative gold line art: one stroke weight, no fill, hidden from assistive technology', () => {
  for (const game of HUB_GAMES) {
    const markup = render(game.id)
    assert.match(markup, /stroke="currentColor"/); assert.match(markup, /fill="none"/); assert.match(markup, /aria-hidden="true"/)
    assert.match(markup, /stroke-width="1\.8"/); assert.doesNotMatch(markup, /<image|href=|<img/)
  }
})
await test('the shared card component draws the icon (no photograph), and the admin preview uses that same component', async () => {
  const { readFileSync } = await import('node:fs')
  const card = readFileSync('src/components/play/GameCard.tsx', 'utf8')
  assert.match(card, /<GameIcon id=\{game\.id\} \/>/)
  assert.doesNotMatch(card, /<img|game\.art\.src/, 'no card photograph')
  const studio = readFileSync('src/pages/admin/studio/StudioPanels.tsx', 'utf8')
  assert.match(studio, /import \{ GameCard \} from '\.\.\/\.\.\/\.\.\/components\/play\/GameCard'/)
  assert.match(readFileSync('src/components/play/PlayComponents.module.css', 'utf8'), /\.cardMediaIcon svg \{ width: 5rem; height: 5rem; \}/, 'icons are comfortably large')
})

console.log(`\n${passed} passed`)
