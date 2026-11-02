import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { fileURLToPath } from 'node:url'
import { join } from 'node:path'

const root = fileURLToPath(new URL('..', import.meta.url))
const editor = readFileSync(join(root, 'src/pages/admin/MezmurEditor.tsx'), 'utf8')
const browseAdmin = readFileSync(join(root, 'src/pages/admin/HymnBrowseGroupsAdmin.tsx'), 'utf8')
const browseService = readFileSync(join(root, 'src/lib/cms/hymnBrowseAdminService.ts'), 'utf8')
const publicBrowse = readFileSync(join(root, 'src/lib/publicContent/hymnBrowse.ts'), 'utf8')
const aliases = readFileSync(join(root, 'src/lib/mezmur/taxonomyAliases.ts'), 'utf8')
const groups = readFileSync(join(root, 'src/lib/publicContent/mezmurBrowseGroups.ts'), 'utf8')

assert.match(editor, /CATEGORY_ENTRIES/)
assert.match(editor, /OCCASION_ENTRIES/)
assert.match(editor, /MEZMUR_CATEGORY_BROWSE_GROUPS/)
assert.match(editor, /MEZMUR_OCCASION_BROWSE_GROUPS/)
assert.match(editor, /listDerivedCategories/)
assert.match(editor, /Existing relationship/)
assert.match(editor, /Canonical public categories/)
assert.match(editor, /Canonical public occasions/)
assert.match(aliases, /canonical: 'Jesus Christ', slug: 'jesus-christ'/)
assert.match(aliases, /canonical: 'Gena', slug: 'gena'/)
assert.match(groups, /sortOrder: 10/)
assert.match(groups, /sortOrder: 70/)
assert.match(browseAdmin, /MEZMUR_CLASSIFICATION_BROWSE_GROUPS/)
assert.match(browseAdmin, /entriesForGroup/)
assert.match(browseAdmin, /sameLinkSlug/)
assert.match(browseAdmin, /Edit artwork/)
assert.match(browseAdmin, /No persistent section row/)
assert.match(browseService, /listAllHymnSections/)
assert.match(browseService, /updateSectionImage/)
assert.match(publicBrowse, /MEZMUR_BROWSE_GROUP_BY_SLUG/)
assert.match(publicBrowse, /sameLinkSlug\(s\.slug, entry\.slug\)/)

const categorySlugs = [...aliases.matchAll(/kind: 'category', canonical: '[^']+', slug: '([^']+)'/g)].map((match) => match[1])
const occasionSlugs = [...aliases.matchAll(/kind: 'occasion', canonical: '[^']+', slug: '([^']+)'/g)].map((match) => match[1])
assert.ok(categorySlugs.length >= 20)
assert.ok(occasionSlugs.length >= 20)
assert.equal(new Set(categorySlugs).size, categorySlugs.length)
assert.equal(new Set(occasionSlugs).size, occasionSlugs.length)

console.log('Mezmur taxonomy synchronization regression tests passed.')
