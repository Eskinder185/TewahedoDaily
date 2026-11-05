/** Source-backed links across public Church content. A generator may propose a link but cannot approve it. */
import { CALENDAR_MEZMUR_LINKS, type CalendarMezmurLink } from '../recommendations/calendarMezmursData.ts'

export type KnowledgeKind = 'hymn' | 'saint' | 'feast' | 'biblical-event' | 'scripture' | 'theme' | 'calendar-day' | 'synaxarium-entry' | 'historical-topic'
export type KnowledgeRelation =
  | 'primary-saint' | 'hymn-feast' | 'biblical-event' | 'scripture-reference' | 'theological-theme'
  | 'commemoration-date' | 'day-commemoration' | 'synaxarium-saint' | 'synaxarium-topic'
export type ConnectionEvidenceKind = 'direct-quotation' | 'clear-event' | 'thematic' | 'verified-liturgical-association' | 'source-metadata'
export type KnowledgeNode = { kind: KnowledgeKind; id: string; name?: string; slug?: string }
export type KnowledgeConnection = {
  id: string
  from: KnowledgeNode
  to: KnowledgeNode
  relation: KnowledgeRelation
  sourceType: 'calendar-link' | 'hymn-lyrics' | 'bible-passage' | 'synaxarium' | 'calendar-catalog' | 'editorial'
  evidence: { kind: ConnectionEvidenceKind; text: string; sourceId: string }[]
  confidence: number
  editorialStatus: 'proposed' | 'confirmed' | 'rejected'
  provenance: { source: string; version: string; sourceHash?: string; reviewerId?: string; reviewedAt?: string }
}

const CONNECTION_VERSION = 'knowledge-links-v1'
export function legacyCalendarConnection(link: CalendarMezmurLink): KnowledgeConnection {
  const relation: KnowledgeRelation = link.relationship_type === 'saint_angel' ? 'primary-saint'
    : link.relationship_type === 'thematic' ? 'theological-theme' : 'hymn-feast'
  const kind: KnowledgeKind = link.relationship_type === 'saint_angel' ? 'saint'
    : link.relationship_type === 'thematic' ? 'theme' : 'feast'
  // This file's generator defaults review_status to approved; that flag is not human approval evidence.
  return {
    id: `legacy-calendar:${link.calendar_card_slug}:${link.mezmur_slug}`,
    from: { kind: 'hymn', id: link.mezmur_slug, slug: link.mezmur_slug, name: link.mezmur_title },
    to: { kind, id: link.calendar_card_slug, name: link.event_title }, relation,
    sourceType: 'calendar-link', evidence: [{ kind: 'source-metadata', text: link.reason_en, sourceId: link.calendar_card_id || link.calendar_card_slug }],
    confidence: link.relationship_type === 'thematic' ? 0.45 : 0.65,
    editorialStatus: 'proposed', provenance: { source: 'src/lib/recommendations/calendarMezmursData.ts', version: CONNECTION_VERSION },
  }
}

export const LEGACY_CALENDAR_CONNECTIONS: readonly KnowledgeConnection[] = CALENDAR_MEZMUR_LINKS.map(legacyCalendarConnection)

/** Only a separately reviewed artifact may populate this list; none is supplied by the legacy generator. */
export const CONFIRMED_KNOWLEDGE_CONNECTIONS: readonly KnowledgeConnection[] = []

export function validatedConnections(connections: readonly KnowledgeConnection[]): KnowledgeConnection[] {
  const ids = new Set<string>()
  return connections.filter(link => {
    if (!link.id || ids.has(link.id) || !link.from.id || !link.to.id || !link.provenance.source
      || !Number.isFinite(link.confidence) || link.confidence < 0 || link.confidence > 1 || !link.evidence.length) return false
    if (link.editorialStatus === 'confirmed' && link.sourceType !== 'calendar-catalog'
      && (!link.provenance.reviewerId || !link.provenance.reviewedAt)) return false
    ids.add(link.id)
    return true
  })
}

export function connectionsFor(node: KnowledgeNode, connections: readonly KnowledgeConnection[] = CONFIRMED_KNOWLEDGE_CONNECTIONS) {
  return validatedConnections(connections).filter(link => link.editorialStatus === 'confirmed'
    && ((link.from.kind === node.kind && link.from.id === node.id) || (link.to.kind === node.kind && link.to.id === node.id)))
}

export function calendarDayConnections(isoDate: string, cardIds: readonly { id: string; title: string }[]): KnowledgeConnection[] {
  return cardIds.map(card => ({
    id: `day:${isoDate}:${card.id}`, from: { kind: 'calendar-day', id: isoDate }, to: { kind: 'feast', id: card.id, name: card.title },
    relation: 'day-commemoration', sourceType: 'calendar-catalog',
    evidence: [{ kind: 'source-metadata', text: card.title, sourceId: card.id }], confidence: 1,
    editorialStatus: 'confirmed', provenance: { source: 'resolveOrthodoxDay', version: CONNECTION_VERSION },
  })) satisfies KnowledgeConnection[]
}

