import { parseBibleReference } from '../bible/parseBibleReference.ts'
import type { SiteSearchResult } from './types.ts'

/**
 * Hybrid Search Buddy routing:
 * - structured / deterministic content → Supabase + searchSite (never AI-first)
 * - open-ended knowledge questions → optional future AI/RAG layer
 */

export type SearchRouteKind = 'structured' | 'knowledge'

const STRUCTURED_HINT =
  /\b(hymn|hymns|mezmur|zemari|singer|prayer|prayers|tselot|calendar|feast|fast|synaxarium|bible|psalm|gospel|chapter|verse|open|go to|navigate|find|show)\b/i

const KNOWLEDGE_HINT =
  /^(what|why|how|who|when|where|explain|tell me|meaning of|mystery of|define|describe)\b/i

export function classifySearchRoute(query: string): SearchRouteKind {
  const q = query.trim()
  if (!q) return 'structured'

  // Bible references are always deterministic.
  if (parseBibleReference(q).isReference) return 'structured'

  // Navigation / catalog phrasing stays local.
  if (STRUCTURED_HINT.test(q) && !KNOWLEDGE_HINT.test(q)) return 'structured'

  // Short keyword lookups (names, feasts) stay local unless framed as a question.
  if (!/[?]/.test(q) && !KNOWLEDGE_HINT.test(q) && q.split(/\s+/).length <= 4) {
    return 'structured'
  }

  if (KNOWLEDGE_HINT.test(q) || /[?]/.test(q)) return 'knowledge'
  return 'structured'
}

/**
 * After local searchSite(), decide whether an optional AI answer layer is worth trying.
 * Prefer strong local hits; only escalate open-ended questions with weak/empty catalogs.
 */
export function shouldAttemptAiAnswer(
  query: string,
  results: SiteSearchResult[],
): boolean {
  if (classifySearchRoute(query) !== 'knowledge') return false
  if (!results.length) return true

  const top = results[0]
  // Strong deterministic hits (bible, exact page intent, personal) win.
  if (
    top.sourceType.startsWith('bible') ||
    top.matchKind === 'intent' ||
    top.matchKind === 'personal' ||
    top.matchKind === 'exact'
  ) {
    return false
  }

  // Weak fuzzy-only lists for knowledge questions may still benefit from AI later.
  return results.every((r) => r.matchKind === 'fuzzy' || r.matchKind === 'keyword')
}
