import {
  createContext,
  useCallback,
  useContext,
  useMemo,
  useRef,
  useState,
  type ReactNode,
} from 'react'
import type { SiteSearchResult } from './types'
import type { SearchSessionContext } from './searchCore'

const STORAGE_KEY = 'td:searchBuddy:v1'

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

export type SearchBuddySnapshot = {
  query: string
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
}

type SearchBuddyApi = {
  open: boolean
  setOpen: (open: boolean) => void
  snapshot: SearchBuddySnapshot
  setSnapshot: (patch: Partial<SearchBuddySnapshot> | ((prev: SearchBuddySnapshot) => SearchBuddySnapshot)) => void
  persistScroll: (scrollTop: number) => void
  clearSession: () => void
  reopenWithSession: () => void
  followUpRef: React.MutableRefObject<SearchSessionContext | null>
}

const EMPTY: SearchBuddySnapshot = {
  query: '',
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
}

const SearchBuddyContext = createContext<SearchBuddyApi | null>(null)

function readStored(): SearchBuddySnapshot {
  if (typeof window === 'undefined') return EMPTY
  try {
    const raw = sessionStorage.getItem(STORAGE_KEY)
    if (!raw) return EMPTY
    const parsed = JSON.parse(raw) as Partial<SearchBuddySnapshot>
    return {
      ...EMPTY,
      ...parsed,
      results: Array.isArray(parsed.results) ? parsed.results : [],
      suggestions: Array.isArray(parsed.suggestions) ? parsed.suggestions : [],
      preview: parsed.preview ?? null,
      followUp: parsed.followUp ?? null,
      reply: parsed.reply ?? null,
    }
  } catch {
    return EMPTY
  }
}

function writeStored(snapshot: SearchBuddySnapshot) {
  try {
    if (!snapshot.hasSearched && !snapshot.query) {
      sessionStorage.removeItem(STORAGE_KEY)
      return
    }
    sessionStorage.setItem(STORAGE_KEY, JSON.stringify(snapshot))
  } catch {
    /* ignore */
  }
}

export function SearchBuddyProvider({ children }: { children: ReactNode }) {
  const [open, setOpenState] = useState(false)
  const [snapshot, setSnapshotState] = useState<SearchBuddySnapshot>(() => readStored())
  const followUpRef = useRef<SearchSessionContext | null>(snapshot.followUp)

  const setSnapshot = useCallback(
    (patch: Partial<SearchBuddySnapshot> | ((prev: SearchBuddySnapshot) => SearchBuddySnapshot)) => {
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

  const persistScroll = useCallback((scrollTop: number) => {
    setSnapshot((prev) => ({ ...prev, resultsScrollTop: scrollTop }))
  }, [setSnapshot])

  const clearSession = useCallback(() => {
    followUpRef.current = null
    setSnapshotState(EMPTY)
    try {
      sessionStorage.removeItem(STORAGE_KEY)
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
