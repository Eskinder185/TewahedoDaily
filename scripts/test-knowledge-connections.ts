import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { performance } from 'node:perf_hooks'
import { CALENDAR_MEZMUR_LINKS } from '../src/lib/recommendations/calendarMezmursData.ts'
import { recommendDailyMezmurs, type DailyFaithContext } from '../src/lib/recommendations/dailyFaithRecommendationEngine.ts'
import {
  CONFIRMED_KNOWLEDGE_CONNECTIONS, LEGACY_CALENDAR_CONNECTIONS,
  calendarDayConnections, connectionsFor, validatedConnections, type KnowledgeConnection,
} from '../src/lib/knowledge/connections.ts'
import { synaxariumSaintConnection, synaxariumTopicConnection } from '../src/lib/knowledge/synaxariumConnections.ts'
import type { SynaxariumCommemoration } from '../src/lib/prayers/prayerLibraryTypes.ts'

const audit = JSON.parse(readFileSync('artifacts/knowledge-connections/candidates.json', 'utf8')) as {
  schema: string; sourceSha256: string; relationships: KnowledgeConnection[]; rejected: { id: string; reason: string }[]
}
assert.equal(audit.schema, 'knowledge-connections-v1')
assert.equal(audit.sourceSha256.length, 64)
assert.equal(LEGACY_CALENDAR_CONNECTIONS.length, CALENDAR_MEZMUR_LINKS.length)
assert.equal(CONFIRMED_KNOWLEDGE_CONNECTIONS.length, 0)
assert.ok(audit.rejected.length > 0, 'Stale historical links are reported')
assert.ok(audit.relationships.every(link => link.editorialStatus === 'proposed'))
assert.equal(validatedConnections(audit.relationships).length, audit.relationships.length)
assert.ok(audit.relationships.some(link => link.relation === 'commemoration-date'))
assert.ok(audit.relationships.some(link => link.relation === 'primary-saint'))
assert.ok(audit.relationships.some(link => link.relation === 'theological-theme'))
const event = audit.relationships.find(link => link.relation === 'biblical-event')!
assert.ok(event)
assert.ok(event.evidence.some(item => item.kind === 'clear-event'))
const scripture = audit.relationships.find(link => link.relation === 'scripture-reference' && link.evidence.some(item => item.kind === 'clear-event'))!
assert.ok(scripture)
assert.equal(scripture.editorialStatus, 'proposed')
assert.ok(!scripture.evidence.some(item => item.kind === 'direct-quotation'))

const link = CALENDAR_MEZMUR_LINKS.find(item => item.calendar_card_slug === 'observance-meskel')!
const context = { cardSlugs: [link.calendar_card_slug], fasts: [], seasons: [], feasts: [], saints: [] } as unknown as DailyFaithContext
const catalog = [{ slug: link.mezmur_slug, title: link.mezmur_title, title_amharic: link.mezmur_title_amharic,
  category: 'Cross', occasion: null, language: 'am' }]
const candidate = await recommendDailyMezmurs(context, 1, catalog)
assert.equal(candidate.length, 1)
assert.equal(candidate[0].relationshipStatus, 'candidate')
assert.ok(candidate[0].score < 85)
assert.match(candidate[0].matchReasonEn, /pending review/)
assert.equal(candidate[0].category, 'Cross')
assert.equal(candidate[0].language, 'am')
assert.equal(candidate[0].applicableEntity, link.event_title)
assert.equal(candidate[0].lyricsHref, `/hymns/mezmur/${link.mezmur_slug}`)
assert.ok(candidate[0].matchReasonAm)
const metadataMatch = await recommendDailyMezmurs(context, 1, [{ ...catalog[0], occasion: 'Meskel' }])
assert.equal(metadataMatch[0].relationshipStatus, 'occasion-metadata')
assert.ok(metadataMatch[0].score > candidate[0].score)
const reviewedOccasion = await recommendDailyMezmurs(context, 1, [{ ...catalog[0], occasion: 'Meskel', occasion_verified: true }])
assert.equal(reviewedOccasion[0].relationshipStatus, 'verified-occasion')
assert.ok(reviewedOccasion[0].score > metadataMatch[0].score)

const confirmed: KnowledgeConnection = { ...LEGACY_CALENDAR_CONNECTIONS.find(item => item.from.id === link.mezmur_slug && item.to.id === link.calendar_card_slug)!,
  to: { kind: 'feast', id: link.calendar_card_id!, name: link.event_title }, editorialStatus: 'confirmed',
  evidence: [{ kind: 'verified-liturgical-association', text: 'Test fixture editorial evidence', sourceId: link.calendar_card_id! }],
  provenance: { source: 'test fixture', version: '1', reviewerId: 'editor-1', reviewedAt: '2026-11-05T12:00:00Z' } }
assert.equal(connectionsFor(confirmed.from, [confirmed]).length, 1)
const approved = await recommendDailyMezmurs(context, 1, catalog, [confirmed])
assert.equal(approved[0].relationshipStatus, 'confirmed')
assert.ok(approved[0].score >= 85)
const newApproved: KnowledgeConnection = { ...confirmed, id: 'editorial:new-approved-hymn',
  from: { kind: 'hymn', id: 'stable-import-id', slug: 'new-approved-hymn', name: 'New reviewed hymn' } }
const newResult = await recommendDailyMezmurs(context, 1,
  [...catalog, { slug: 'new-approved-hymn', title: 'New reviewed hymn' }], [newApproved])
assert.equal(newResult[0].slug, 'new-approved-hymn')
assert.equal(newResult[0].relationshipStatus, 'confirmed')
const unverified = await recommendDailyMezmurs(context, 1, catalog, [{ ...confirmed, editorialStatus: 'proposed' }])
assert.equal(unverified[0].relationshipStatus, 'candidate')
assert.equal((await recommendDailyMezmurs(context, 1, [])).length, 0, 'Missing hymn is never linked')
assert.equal((await recommendDailyMezmurs({ ...context, cardSlugs: [], feasts: [], saints: [] }, 1, catalog))[0].relationshipStatus, 'general')

const dateLinks = calendarDayConnections('2026-09-27', [{ id: link.calendar_card_id!, title: link.event_title }])
assert.equal(dateLinks[0].from.id, '2026-09-27')
assert.equal(dateLinks[0].to.id, link.calendar_card_id)
assert.equal(validatedConnections(dateLinks).length, 1)
const synaxarium = { id: 'entry-1', title: 'Saint Yared' } as SynaxariumCommemoration
assert.equal(synaxariumSaintConnection(synaxarium)?.to.id, 'saint:yared')
assert.equal(synaxariumSaintConnection({ ...synaxarium, title: 'Saint Yared and Saint George' }), null)
assert.equal(synaxariumTopicConnection({ ...synaxarium, summary: 'The Transfiguration is remembered.' },
  { kind: 'biblical-event', id: 'transfiguration', name: 'Transfiguration', excerpt: 'Transfiguration' })?.editorialStatus, 'proposed')
assert.equal(synaxariumTopicConnection(synaxarium,
  { kind: 'historical-topic', id: 'unsupported', name: 'Unsupported', excerpt: 'not in text' }), null)

const start = performance.now()
for (let i = 0; i < 100; i++) await recommendDailyMezmurs(context, 1, catalog)
const elapsed = performance.now() - start
assert.ok(elapsed < 2000, `100 targeted recommendations took ${elapsed.toFixed(1)} ms`)
console.log(`Knowledge connections passed: ${audit.relationships.length} proposed, ${audit.rejected.length} stale; 100 targeted recommendations ${elapsed.toFixed(1)} ms`)
