/**
 * Safe AI answer formatting (no raw Markdown, bilingual labels).
 * Run: npx tsx scripts/test-ai-answer-format.mjs
 */
import assert from 'node:assert/strict'
import {
  parseAiAnswerBlocks,
  plainTextFromAiAnswer,
  stripDecorativeMarkdown,
} from '../src/lib/searchBuddy/formatAiAnswer.ts'

const amLabel = '\u12e8\u12a0\u121b\u122d\u129b \u121b\u1265\u122b\u122a\u12eb'
const amBody = '\u12a5\u130d\u12da\u12a0\u1265\u1214\u122d \u12a0\u1295\u12f5 \u12a0\u121d\u120b\u12ad \u1290\u12cd\u1362'
const mysteryAm = '\u121d\u1225\u1322\u1228 \u1225\u120b\u1234'

const rawMd = [
  '### Mystery of the Trinity',
  `**English explanation:** God is one essence in three Persons.`,
  `**${amLabel}:** ${amBody}`,
  'Bible reference: Matthew 28:19.',
].join('\n')

const stripped = stripDecorativeMarkdown(rawMd)
assert.ok(!stripped.includes('###'))
assert.ok(!stripped.includes('**'))

const blocks = parseAiAnswerBlocks(rawMd)
assert.ok(blocks.some((b) => b.type === 'heading'))
assert.ok(blocks.some((b) => b.type === 'label' && b.kind === 'english'))
assert.ok(blocks.some((b) => b.type === 'label' && b.kind === 'amharic'))
assert.ok(blocks.some((b) => b.type === 'label' && b.kind === 'bible'))

const plain = plainTextFromAiAnswer(rawMd)
assert.match(plain, /Mystery of the Trinity/)
assert.match(plain, /Matthew 28:19/)
assert.ok(!plain.includes('###'))
assert.ok(!plain.includes('**'))

const numbered = parseAiAnswerBlocks(
  `1. ${mysteryAm} — Mystery of the Trinity\n\nEnglish explanation: One God in three Persons.`,
)
assert.equal(numbered[0]?.type, 'heading')
assert.ok(numbered.some((b) => b.type === 'label' && b.kind === 'english'))

const onlyCite = plainTextFromAiAnswer('Bible reference: John 3:16.')
assert.equal(onlyCite.includes('For God so loved'), false)

const structured = parseAiAnswerBlocks(
  [
    '## Fasting',
    '',
    'A **Wednesday** and *Friday* fast.',
    '',
    '- Bread',
    '- Water',
    '',
    '1. Prepare',
    '2. Pray',
    '',
    'See [the calendar](https://example.org/calendar) and [bad](javascript:alert(1)).',
    '<script>alert(1)</script><b>Safe text</b>',
  ].join('\n'),
)
assert.ok(structured.some((b) => b.type === 'heading' && b.level === 2))
const paragraph = structured.find((b) => b.type === 'paragraph' && b.inlines.some((p) => p.type === 'strong'))
assert.ok(paragraph && paragraph.type === 'paragraph')
assert.ok(paragraph.inlines.some((p) => p.type === 'strong' && p.text === 'Wednesday'))
assert.ok(paragraph.inlines.some((p) => p.type === 'em' && p.text === 'Friday'))
assert.ok(structured.some((b) => b.type === 'list' && !b.ordered && b.items.length === 2))
assert.ok(structured.some((b) => b.type === 'list' && b.ordered && b.items.length === 2))
const linkParagraph = structured.find(
  (b) => b.type === 'paragraph' && b.inlines.some((p) => p.type === 'link'),
)
assert.ok(linkParagraph && linkParagraph.type === 'paragraph')
assert.deepEqual(
  linkParagraph.inlines.find((p) => p.type === 'link'),
  { type: 'link', text: 'the calendar', href: 'https://example.org/calendar' },
)
assert.equal(
  linkParagraph.inlines.some((p) => p.type === 'link' && p.href.startsWith('javascript:')),
  false,
)
assert.ok(linkParagraph.inlines.some((p) => p.type === 'text' && p.text.includes('bad')))
const htmlBlock = structured.find(
  (b) => b.type === 'paragraph' && b.inlines.some((p) => p.type === 'text' && p.text.includes('Safe text')),
)
assert.ok(htmlBlock)
assert.ok(!JSON.stringify(htmlBlock).includes('<script'))
assert.ok(!JSON.stringify(htmlBlock).includes('<b>'))

console.log('test-ai-answer-format: ok')
