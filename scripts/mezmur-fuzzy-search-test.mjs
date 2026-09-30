/**
 * Offline fuzzy ranking smoke test (no Supabase).
 * Run: node scripts/mezmur-fuzzy-search-test.mjs
 */
import assert from 'node:assert/strict'
import Fuse from 'fuse.js'

function normalizeLatinSearchText(value) {
  return value
    .normalize('NFKD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLowerCase()
    .replace(/[''`´]/g, '')
    .replace(/[-_/\\]+/g, ' ')
    .replace(/[^\p{L}\p{N}\s]/gu, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}

const docs = [
  { id: '1', title: 'Beki Yitfesihu', title_amharic: 'በቂ ይትፈስሁ', titleNorm: normalizeLatinSearchText('Beki Yitfesihu'), keywordsText: '' },
  { id: '2', title: 'Kidus Gabriel', title_amharic: 'ቅዱስ ገብርኤል', titleNorm: normalizeLatinSearchText('Kidus Gabriel'), keywordsText: 'gabriel' },
  { id: '3', title: 'Kidus Mikael', title_amharic: 'ቅዱስ ሚካኤል', titleNorm: normalizeLatinSearchText('Kidus Mikael'), keywordsText: 'michael' },
  { id: '4', title: 'Abune Tekle Haymanot', title_amharic: 'አቡነ ተክለ ሃይማኖት', titleNorm: normalizeLatinSearchText('Abune Tekle Haymanot'), keywordsText: '' },
  { id: '5', title: 'Meskel', title_amharic: 'መስቀል', titleNorm: normalizeLatinSearchText('Meskel'), keywordsText: '' },
]

function search(query) {
  const fuse = new Fuse(docs, {
    keys: [
      { name: 'title', weight: 0.42 },
      { name: 'titleNorm', weight: 0.22 },
      { name: 'title_amharic', weight: 0.28 },
      { name: 'keywordsText', weight: 0.12 },
    ],
    threshold: 0.42,
    distance: 140,
    ignoreLocation: true,
    includeScore: true,
  })
  return fuse.search(normalizeLatinSearchText(query) || query).map((h) => h.item.title)
}

assert.equal(search('baki yitfeshu')[0], 'Beki Yitfesihu')
assert.equal(search('Gabreal')[0], 'Kidus Gabriel')
assert.ok(search('Mikael').includes('Kidus Mikael'))
assert.ok(search('Tekle Haimanot')[0].includes('Tekle Haymanot'))
assert.equal(search('በቂ ይትፈስሁ')[0], 'Beki Yitfesihu')
assert.equal(search('Beki')[0], 'Beki Yitfesihu')

console.log('mezmur-fuzzy-search-test: ok')
