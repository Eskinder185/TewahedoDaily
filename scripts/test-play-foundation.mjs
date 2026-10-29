import assert from 'node:assert/strict'
import { readFile } from 'node:fs/promises'

const read = (path) => readFile(new URL(`../${path}`, import.meta.url), 'utf8')

const [app, header, labels, prefetch, hub, hubCss, schema] = await Promise.all([
  read('src/App.tsx'),
  read('src/components/layout/SiteHeader.tsx'),
  read('src/lib/i18n/uiLabels.ts'),
  read('src/lib/routePrefetch.ts'),
  read('src/pages/play/PlayHubPage.tsx'),
  read('src/pages/play/PlayHubPage.module.css'),
  read('docs/TEWAHEDO_PLAY_SCHEMA_PROPOSAL.md'),
])

assert.match(app, /lazy\(\(\) => import\('\.\/pages\/play\/PlayHubPage'\)/, 'Play route must be code-split')
assert.match(app, /path="\/play"/, 'App must expose /play')
assert.match(header, /to: '\/play'/, 'Primary navigation must include Play')
assert.match(labels, /navPlay: \{ en: 'Play', am: 'ጨዋታ' \}/, 'Navigation must be bilingual')
assert.match(prefetch, /import\('\.\.\/pages\/play\/PlayHubPage'\)/, 'Play intent should prefetch its route chunk')

for (const required of ['Guest play', 'እንግዳ ጨዋታ', 'Game Night', 'የጨዋታ ምሽት', 'Daily challenge', 'የዕለቱ ፈተና']) {
  assert.ok(hub.includes(required), `Missing bilingual hub copy: ${required}`)
}

assert.match(hub, /aria-live="polite"/, 'Difficulty changes need an accessible announcement')
assert.match(hub, /aria-pressed=\{filter === category\.id\}/, 'Category filters need selected state')
assert.match(hubCss, /prefers-reduced-motion: no-preference/, 'Decorative animation must be opt-in when reduced motion is not requested')
for (const route of ['/play/trivia', '/play/who-am-i', '/play/emoji', '/play/finish-the-mezmur', '/play/finish-the-verse', '/play/history', '/play/match', '/play/adventures', '/play/game-night']) {
  assert.ok(app.includes(`path="${route}"`), `Missing playable route: ${route}`)
}
assert.match(hub, /\/play\/trivia\?daily=1/, 'Daily challenge must link to its deterministic round')
assert.match(app, /path="\/play\/game-night"/, 'Game Night must have a dedicated route')

for (const existingTable of ['bible_editions', 'mezmur', 'church_library_passages', 'profiles']) {
  assert.ok(schema.includes(`\`${existingTable}\``), `Schema proposal must reference inspected table ${existingTable}`)
}
assert.match(schema, /ha(?:s|ve) not been applied/, 'Proposal must clearly state its unapplied status')

console.log('Tewahedo Play foundation checks passed.')
