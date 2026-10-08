import type { SearchBuddyApiResponse } from '../searchBuddy/apiTypes.ts'
import type { SiteSearchResult } from './types'

/** One turn in the Search Buddy conversation thread. */
export type ChatMessage = {
  id: string
  role: 'user' | 'assistant'
  createdAt: number
  /** User text, or a short assistant lead-in (not a substitute for structured cards). */
  text?: string
  /** Structured FastAPI response rendered with SearchBuddyResults. */
  response?: SearchBuddyApiResponse
  /** Local catalog fallback results (when API unavailable). */
  localResults?: SiteSearchResult[]
  suggestions?: SiteSearchResult[]
  status?: 'sending' | 'complete' | 'error'
  empty?: boolean
  errorText?: string
}

/** Display history only — never send this object as the /api/chat body yet. */
export type ChatDisplayHistory = ChatMessage[]

export function createChatMessageId(): string {
  if (typeof crypto !== 'undefined' && typeof crypto.randomUUID === 'function') {
    return crypto.randomUUID()
  }
  return `m-${Date.now()}-${Math.random().toString(36).slice(2, 9)}`
}
