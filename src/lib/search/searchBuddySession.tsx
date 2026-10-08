import {
  createContext,
  useCallback,
  useContext,
  useMemo,
  useRef,
  useState,
  type ReactNode,
} from 'react'
import type { AiSource, AiUiStatus } from '../ai/aiTypes.ts'
import type { SearchBuddyApiResponse } from '../searchBuddy/apiTypes.ts'
import type { SiteSearchResult } from './types'
import type { SearchSessionContext } from './searchCore'
import type { ChatMessage } from './chatTypes'
import { createChatMessageId } from './chatTypes'

const STORAGE_KEY = 'td:searchBuddy:v2'
const LEGACY_STORAGE_KEY = 'td:searchBuddy:v1'

/** Locale-independent reply payload — localize at render time (audit L10). */
export type SearchBuddyReply =
  | { kind: 'searching' }
  | { kind: 'unavailable' }
  | { kind: 'zero' }
  | { kind: 'favorites' }
  | { kind: 'opening'; title: string }
  | { kind: 'foundOne'; title: string; partial?: boolean }
  | { kind: 'foundMany'; count: number; partial?: boolean }
  | { kind: 'generic'; partial?: boolean }

/** Optional AI/RAG answer layer — never replaces deterministic catalog results. */
export type SearchBuddyAiAnswer = {
  status: AiUiStatus
  answer?: string
  sources?: AiSource[]
  /** Subtle notice when AI was requested but unavailable (not a hard error). */
  notice?: string
}

export type SearchBuddySnapshot = {
  /** Draft text in the chat composer (not the conversation history). */
  query: string
  /** Scrollable conversation thread. */
  messages: ChatMessage[]
  results: SiteSearchResult[]
  suggestions: SiteSearchResult[]
  /** @deprecated Prefer `reply` — kept for older sessionStorage payloads */
  message: string
  reply: SearchBuddyReply | null
  hasSearched: boolean
  showAll: boolean
  resultsScrollTop: number
  preview: SiteSearchResult | null
  followUp: SearchSessionContext | null
  error: boolean
  /** Future AI answer; omitted / null when unused. */
  aiAnswer: SearchBuddyAiAnswer | null
  /** Most recent structured FastAPI payload (compat / reopen helpers). */
  apiResponse: SearchBuddyApiResponse | null
  apiEmpty: boolean
  /** Most recent query that returned a successful API or local response. */
  lastSuccessfulQuery: string
  /** Calm remote/API error notice; does not wipe local catalog results. */
  remoteError: string | null
}

type SearchBuddyApi = {
  open: boolean
  setOpen: (open: boolean) => void
  snapshot: SearchBuddySnapshot
  setSnapshot: (
    patch: Partial<SearchBuddySnapshot> | ((prev: SearchBuddySnapshot) => SearchBuddySnapshot),
  ) => void
  persistScroll: (scrollTop: number) => void
  clearSession: () => void
  reopenWithSession: () => void
  followUpRef: React.MutableRefObject<SearchSessionContext | null>
}

const EMPTY: SearchBuddySnapshot = {
  query: '',
  messages: [],
  results: [],
  suggestions: [],
  message: '',
  reply: null,
  hasSearched: false,
  showAll: false,
  resultsScrollTop: 0,
  preview: null,
  followUp: null,
  error: false,
  aiAnswer: null,
  apiResponse: null,
  apiEmpty: false,
  lastSuccessfulQuery: '',
  remoteError: null,
}

const SearchBuddyContext = createContext<SearchBuddyApi | null>(null)

function migrateLegacyMessages(parsed: Partial<SearchBuddySnapshot>): ChatMessage[] {
  if (Array.isArray(parsed.messages) && parsed.messages.length) {
    return parsed.messages.filter(
      (m): m is ChatMessage =>
        Boolean(m) &&
        typeof m === 'object' &&
        (m.role === 'user' || m.role === 'assistant') &&
        typeof m.id === 'string',
    )
  }

  const q =
    (typeof parsed.lastSuccessfulQuery === 'string' && parsed.lastSuccessfulQuery.trim()) ||
    (typeof parsed.query === 'string' && parsed.query.trim()) ||
    ''
  if (!q || !parsed.hasSearched) return []

  const user: ChatMessage = {
    id: createChatMessageId(),
    role: 'user',
    createdAt: Date.now() - 2,
    text: q,
    status: 'complete',
  }

  const assistant: ChatMessage = {
    id: createChatMessageId(),
    role: 'assistant',
    createdAt: Date.now() - 1,
    status: 'complete',
    response: parsed.apiResponse ?? undefined,
    empty: Boolean(parsed.apiEmpty),
    localResults: Array.isArray(parsed.results) && parsed.results.length ? parsed.results : undefined,
    suggestions:
      Array.isArray(parsed.suggestions) && parsed.suggestions.length
        ? parsed.suggestions
        : undefined,
    errorText: typeof parsed.remoteError === 'string' ? parsed.remoteError : undefined,
  }

  if (!assistant.response && !assistant.localResults?.length && !assistant.errorText) {
    return [user]
  }
  return [user, assistant]
}

function normalizeSnapshot(parsed: Partial<SearchBuddySnapshot>): SearchBuddySnapshot {
  return {
    ...EMPTY,
    ...parsed,
    messages: migrateLegacyMessages(parsed),
    results: Array.isArray(parsed.results) ? parsed.results : [],
    suggestions: Array.isArray(parsed.suggestions) ? parsed.suggestions : [],
    preview: parsed.preview ?? null,
    followUp: parsed.followUp ?? null,
    reply: parsed.reply ?? null,
    aiAnswer: parsed.aiAnswer ?? null,
    apiResponse: parsed.apiResponse ?? null,
    apiEmpty: Boolean(parsed.apiEmpty),
    lastSuccessfulQuery:
      typeof parsed.lastSuccessfulQuery === 'string' ? parsed.lastSuccessfulQuery : '',
    remoteError: typeof parsed.remoteError === 'string' ? parsed.remoteError : null,
    query: typeof parsed.query === 'string' ? parsed.query : '',
  }
}

function readStored(): SearchBuddySnapshot {
  if (typeof window === 'undefined') return EMPTY
  try {
    const raw = sessionStorage.getItem(STORAGE_KEY) || sessionStorage.getItem(LEGACY_STORAGE_KEY)
    if (!raw) return EMPTY
    const parsed = JSON.parse(raw) as Partial<SearchBuddySnapshot>
    return normalizeSnapshot(parsed)
  } catch {
    return EMPTY
  }
}

function writeStored(snapshot: SearchBuddySnapshot) {
  try {
    if (!snapshot.hasSearched && !snapshot.query && !snapshot.messages.length) {
      sessionStorage.removeItem(STORAGE_KEY)
      sessionStorage.removeItem(LEGACY_STORAGE_KEY)
      return
    }
    sessionStorage.setItem(STORAGE_KEY, JSON.stringify(snapshot))
    sessionStorage.removeItem(LEGACY_STORAGE_KEY)
  } catch {
    /* ignore */
  }
}

export function SearchBuddyProvider({ children }: { children: ReactNode }) {
  const [open, setOpenState] = useState(false)
  const [snapshot, setSnapshotState] = useState<SearchBuddySnapshot>(() => readStored())
  const followUpRef = useRef<SearchSessionContext | null>(snapshot.followUp)

  const setSnapshot = useCallback(
    (
      patch: Partial<SearchBuddySnapshot> | ((prev: SearchBuddySnapshot) => SearchBuddySnapshot),
    ) => {
      setSnapshotState((prev) => {
        const next = typeof patch === 'function' ? patch(prev) : { ...prev, ...patch }
        followUpRef.current = next.followUp
        writeStored(next)
        return next
      })
    },
    [],
  )

  const setOpen = useCallback((next: boolean) => {
    setOpenState(next)
  }, [])

  const persistScroll = useCallback(
    (scrollTop: number) => {
      setSnapshot((prev) => ({ ...prev, resultsScrollTop: scrollTop }))
    },
    [setSnapshot],
  )

  const clearSession = useCallback(() => {
    followUpRef.current = null
    setSnapshotState(EMPTY)
    try {
      sessionStorage.removeItem(STORAGE_KEY)
      sessionStorage.removeItem(LEGACY_STORAGE_KEY)
    } catch {
      /* ignore */
    }
  }, [])

  const reopenWithSession = useCallback(() => {
    const stored = { ...readStored(), preview: null }
    writeStored(stored)
    setSnapshotState(stored)
    followUpRef.current = stored.followUp
    setOpenState(true)
  }, [])

  const value = useMemo(
    () => ({
      open,
      setOpen,
      snapshot,
      setSnapshot,
      persistScroll,
      clearSession,
      reopenWithSession,
      followUpRef,
    }),
    [open, setOpen, snapshot, setSnapshot, persistScroll, clearSession, reopenWithSession],
  )

  return <SearchBuddyContext.Provider value={value}>{children}</SearchBuddyContext.Provider>
}

// eslint-disable-next-line react-refresh/only-export-components -- hooks belong with SearchBuddyProvider
export function useSearchBuddy(): SearchBuddyApi {
  const ctx = useContext(SearchBuddyContext)
  if (!ctx) {
    throw new Error('useSearchBuddy must be used within SearchBuddyProvider')
  }
  return ctx
}

/** Safe optional access when provider may be absent (tests). */
// eslint-disable-next-line react-refresh/only-export-components -- hooks belong with SearchBuddyProvider
export function useSearchBuddyOptional(): SearchBuddyApi | null {
  return useContext(SearchBuddyContext)
}
