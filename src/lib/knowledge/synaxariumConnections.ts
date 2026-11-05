import { identifyEntity } from '../language/index.ts'
import type { SynaxariumCommemoration } from '../prayers/prayerLibraryTypes.ts'
import type { KnowledgeConnection } from './connections.ts'

/** A uniquely resolved title is a candidate navigation hint, never editorial approval. */
export function synaxariumSaintConnection(item: SynaxariumCommemoration): KnowledgeConnection | null {
  const matches = identifyEntity(item.title, { kinds: ['saint', 'archangel'] })
  if (matches.length !== 1 || matches[0].ambiguous) return null
  const saint = matches[0].entity
  return {
    id: `synaxarium-saint:${item.id}:${saint.id}`,
    from: { kind: 'synaxarium-entry', id: item.id, name: item.title },
    to: { kind: 'saint', id: saint.id, name: saint.names.en }, relation: 'synaxarium-saint',
    sourceType: 'synaxarium', evidence: [{ kind: 'source-metadata', text: item.title, sourceId: item.id }],
    confidence: 0.8, editorialStatus: 'proposed',
    provenance: { source: 'published Synaxarium title', version: 'knowledge-links-v1' },
  }
}

/** Explicit topic proposal; the excerpt must occur in the published source text. */
export function synaxariumTopicConnection(
  item: SynaxariumCommemoration,
  topic: { kind: 'biblical-event' | 'historical-topic'; id: string; name: string; excerpt: string },
): KnowledgeConnection | null {
  if (!topic.id || !topic.excerpt || ![item.title, item.summary, item.bodyAmharic, item.bodyEnglish, item.scriptureReferences]
    .some(text => text?.includes(topic.excerpt))) return null
  return {
    id: `synaxarium-topic:${item.id}:${topic.id}`,
    from: { kind: 'synaxarium-entry', id: item.id, name: item.title },
    to: { kind: topic.kind, id: topic.id, name: topic.name }, relation: 'synaxarium-topic',
    sourceType: 'synaxarium', evidence: [{ kind: 'source-metadata', text: topic.excerpt, sourceId: item.id }],
    confidence: 0.7, editorialStatus: 'proposed',
    provenance: { source: 'published Synaxarium source text', version: 'knowledge-links-v1' },
  }
}
