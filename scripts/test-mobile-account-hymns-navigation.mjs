import fs from 'node:fs'
import assert from 'node:assert/strict'

const header = fs.readFileSync('src/components/layout/SiteHeader.tsx', 'utf8')
const app = fs.readFileSync('src/App.tsx', 'utf8')
const browse = fs.readFileSync('src/lib/publicContent/hymnBrowse.ts', 'utf8')
const calendar = fs.readFileSync('src/services/dayChurchContext.ts', 'utf8')

assert.match(header, /to="\/signup"/, 'mobile drawer must expose signup')
assert.match(header, /to="\/account"/, 'mobile drawer must expose account')
assert.match(app, /path="\/hymns\/mezmur\/:slug"/, 'canonical hymn detail route missing')
assert.match(app, /path="\/hymns\/category\/:slug"/, 'canonical category route missing')
assert.match(app, /path="\/hymns\/category\/:collectionSlug\/:sectionSlug"/, 'canonical section route missing')
assert.match(browse, /href: `\/hymns\/mezmur\//, 'browse cards must use canonical hymn URLs')
assert.match(calendar, /href: '\/hymns'/, 'calendar recommendation link must use canonical hymns URL')
console.log('mobile account, canonical hymns routes, and calendar links: ok')
