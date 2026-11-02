import assert from 'node:assert/strict'
import { readFile } from 'node:fs/promises'

const plan = JSON.parse(await readFile('artifacts/play-bible-question-bank-v2-diversity-plan.json', 'utf8'))
const pilot = new Set(plan.pilotExcluded)
const keys = plan.chapters.map((item) => `${item.bookSlug}:${item.chapter}`)
assert.equal(plan.chapters.length, 50)
assert.equal(new Set(keys).size, 50)
assert.ok(keys.every((key) => !pilot.has(key)))
for (const book of ['genesis', 'exodus', 'matthew', 'john']) assert.ok(plan.chapters.some((item) => item.bookSlug === book))
assert.deepEqual(Object.fromEntries(['genesis', 'exodus', 'matthew', 'john'].map((book) => [book, plan.chapters.filter((item) => item.bookSlug === book).length])), { genesis: 13, exodus: 13, matthew: 12, john: 12 })
assert.ok(plan.chapters.every((item) => ['beginner', 'growing', 'challenge'].includes(item.difficulty)))
console.log('Bible question-bank diversity plan checks passed.')
