import { useCallback, useEffect, useMemo, useState } from 'react'
import { useLocation, useNavigate } from 'react-router-dom'
import {
  consumeAutoplay,
  consumeSheetOpen,
  markAutoplay,
  markSheetOpen,
  neighbour,
  readBrowseQueue,
  readQueuePrefs,
  reorder,
  saveBrowseQueue,
  withPlayed,
  writeQueuePrefs,
  type BrowseQueue,
  type QueuePrefs,
  type RepeatSetting,
} from './browseQueue'

export type MezmurQueueDiagnostics = {
  collectionId: string | null
  currentSlug: string
  queueLength: number
  position: number
  nextSlug: string | null
  prevSlug: string | null
  shuffle: boolean
  repeat: RepeatSetting
  history: string[]
}

export type MezmurQueueControls = {
  /** The Mezmur being shown belongs to the remembered list. */
  inQueue: boolean
  label: string | null
  href: string | null
  position: number
  total: number
  prevSlug: string | null
  nextSlug: string | null
  shuffle: boolean
  repeat: RepeatSetting
  autoplay: boolean
  /** This page was reached by automatic advance and should start playing. */
  autoplayOnLoad: boolean
  /** This page was reached from the expanded player's Previous / Next. */
  openPlayerOnLoad: boolean
  goPrevious: (keepPlayerOpen?: boolean) => void
  goNext: (automatic?: boolean, keepPlayerOpen?: boolean) => void
  toggleShuffle: () => void
  cycleRepeat: () => void
  setAutoplay: (on: boolean) => void
  /** Called when the current recording finishes. */
  onEnded: (options?: { keepPlayerOpen?: boolean }) => 'repeat-one' | 'advanced' | 'stopped'
  diagnostics: MezmurQueueDiagnostics
}

const NEXT_REPEAT: Record<RepeatSetting, RepeatSetting> = { off: 'all', all: 'one', one: 'off' }

/**
 * Previous / Next / Shuffle / Repeat for the list a Mezmur page was opened from.
 *
 * The list lives in sessionStorage (written by the collection card's onClick),
 * so it survives a refresh and Back/Forward in this tab; it does not depend on
 * router location.state. The Mezmur page is keyed per Mezmur, so this hook
 * re-reads the stored list on every Mezmur and can never show a stale song.
 */
export function useMezmurQueue(slug: string): MezmurQueueControls {
  const navigate = useNavigate()
  const location = useLocation()
  const [queue, setQueue] = useState<BrowseQueue | null>(() => {
    const q = readBrowseQueue()
    if (!q || !q.order.includes(slug)) return q
    const next = withPlayed(q, slug)
    if (next !== q) saveBrowseQueue(next)
    return next
  })
  const [prefs, setPrefs] = useState<QueuePrefs>(() => readQueuePrefs())
  const [autoplayOnLoad] = useState(() => consumeAutoplay(slug))
  const [openPlayerOnLoad] = useState(() => consumeSheetOpen(slug))

  // Another tab or an older page may have changed the stored shuffle setting;
  // keep the list order in step with the preference shown on the button.
  useEffect(() => {
    if (!queue || !queue.order.includes(slug)) return
    const natural = queue.items.map((i) => i.slug)
    const isNatural = queue.order.length === natural.length && queue.order.every((s, i) => s === natural[i])
    if (!prefs.shuffle && !isNatural) {
      const next = reorder(queue, false, slug)
      // eslint-disable-next-line react-hooks/set-state-in-effect -- one-time repair of a stored order
      setQueue(next)
      saveBrowseQueue(next)
    }
  }, [prefs.shuffle, queue, slug])

  const inQueue = Boolean(queue?.order.includes(slug))
  const prevSlug = queue && inQueue ? neighbour(queue, slug, -1, prefs.repeat) : null
  const nextSlug = queue && inQueue ? neighbour(queue, slug, 1, prefs.repeat) : null

  const updatePrefs = useCallback((next: QueuePrefs) => {
    setPrefs(next)
    writeQueuePrefs(next)
  }, [])

  const go = useCallback((target: string | null, automatic: boolean, keepPlayerOpen: boolean) => {
    if (!target) return
    if (automatic || prefs.autoplay) markAutoplay(target)
    if (keepPlayerOpen) markSheetOpen(target)
    const prefix = location.pathname.startsWith('/practice/mezmur/') ? '/practice/mezmur/' : '/hymns/mezmur/'
    // Manual Previous / Next create normal history entries; automatic advance
    // at the end of a recording replaces the entry.
    navigate(`${prefix}${encodeURIComponent(target)}${location.search}`, { replace: automatic })
  }, [location.pathname, location.search, navigate, prefs.autoplay])

  const toggleShuffle = useCallback(() => {
    const shuffle = !prefs.shuffle
    updatePrefs({ ...prefs, shuffle })
    if (queue && queue.order.includes(slug)) {
      // Current Mezmur keeps playing; history is kept; only the unplayed rest moves.
      const next = reorder(queue, shuffle, slug)
      setQueue(next)
      saveBrowseQueue(next)
    }
  }, [prefs, queue, slug, updatePrefs])

  const onEnded = useCallback((options?: { keepPlayerOpen?: boolean }): 'repeat-one' | 'advanced' | 'stopped' => {
    if (prefs.repeat === 'one') return 'repeat-one'
    if (!prefs.autoplay || !nextSlug) return 'stopped'
    go(nextSlug, true, Boolean(options?.keepPlayerOpen))
    return 'advanced'
  }, [go, nextSlug, prefs.autoplay, prefs.repeat])

  const position = inQueue ? queue!.order.indexOf(slug) + 1 : 0

  const diagnostics = useMemo<MezmurQueueDiagnostics>(() => ({
    collectionId: inQueue ? queue!.href : null,
    currentSlug: slug,
    queueLength: inQueue ? queue!.order.length : 0,
    position,
    nextSlug,
    prevSlug,
    shuffle: prefs.shuffle,
    repeat: prefs.repeat,
    history: inQueue ? queue!.history ?? [] : [],
  }), [inQueue, nextSlug, position, prefs.repeat, prefs.shuffle, prevSlug, queue, slug])

  useEffect(() => {
    if (import.meta.env.DEV) (window as unknown as { __mezmurQueue?: MezmurQueueDiagnostics }).__mezmurQueue = diagnostics
  }, [diagnostics])

  return useMemo(() => ({
    inQueue,
    label: inQueue ? queue!.label : null,
    href: inQueue ? queue!.href : null,
    position,
    total: inQueue ? queue!.order.length : 0,
    prevSlug,
    nextSlug,
    shuffle: prefs.shuffle,
    repeat: prefs.repeat,
    autoplay: prefs.autoplay,
    autoplayOnLoad,
    openPlayerOnLoad,
    // Previous / Next are normally pressed in the expanded player, so keep it open.
    goPrevious: (keepPlayerOpen = true) => go(prevSlug, false, keepPlayerOpen),
    goNext: (automatic = false, keepPlayerOpen = true) => go(nextSlug, automatic, keepPlayerOpen),
    toggleShuffle,
    cycleRepeat: () => updatePrefs({ ...prefs, repeat: NEXT_REPEAT[prefs.repeat] }),
    setAutoplay: (autoplay: boolean) => updatePrefs({ ...prefs, autoplay }),
    onEnded,
    diagnostics,
  }), [autoplayOnLoad, diagnostics, go, inQueue, nextSlug, onEnded, openPlayerOnLoad, position, prefs, prevSlug, queue, toggleShuffle, updatePrefs])
}
