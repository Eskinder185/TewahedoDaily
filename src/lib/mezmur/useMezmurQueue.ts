import { useCallback, useMemo, useState } from 'react'
import { useLocation, useNavigate } from 'react-router-dom'
import {
  consumeAutoplay,
  markAutoplay,
  neighbour,
  readBrowseQueue,
  readQueuePrefs,
  saveBrowseQueue,
  shuffledOrder,
  writeQueuePrefs,
  type BrowseQueue,
  type QueuePrefs,
  type RepeatSetting,
} from './browseQueue'

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
  goPrevious: () => void
  goNext: (automatic?: boolean) => void
  toggleShuffle: () => void
  cycleRepeat: () => void
  setAutoplay: (on: boolean) => void
  /** Called when the current recording finishes. */
  onEnded: () => 'repeat-one' | 'advanced' | 'stopped'
}

const NEXT_REPEAT: Record<RepeatSetting, RepeatSetting> = { off: 'all', all: 'one', one: 'off' }

/** Previous / Next / Shuffle / Repeat for the list a Mezmur page was opened from. */
export function useMezmurQueue(slug: string): MezmurQueueControls {
  const navigate = useNavigate()
  const location = useLocation()
  const [queue, setQueue] = useState<BrowseQueue | null>(() => readBrowseQueue())
  const [prefs, setPrefs] = useState<QueuePrefs>(() => readQueuePrefs())
  const [autoplayOnLoad] = useState(() => consumeAutoplay(slug))

  const inQueue = Boolean(queue?.order.includes(slug))
  const prevSlug = queue && inQueue ? neighbour(queue, slug, -1, prefs.repeat) : null
  const nextSlug = queue && inQueue ? neighbour(queue, slug, 1, prefs.repeat) : null

  const updatePrefs = useCallback((next: QueuePrefs) => {
    setPrefs(next)
    writeQueuePrefs(next)
  }, [])

  const go = useCallback((target: string | null, automatic: boolean) => {
    if (!target) return
    if (automatic || prefs.autoplay) markAutoplay(target)
    const prefix = location.pathname.startsWith('/practice/mezmur/') ? '/practice/mezmur/' : '/hymns/mezmur/'
    navigate(`${prefix}${encodeURIComponent(target)}${location.search}`, { replace: automatic })
  }, [location.pathname, location.search, navigate, prefs.autoplay])

  const toggleShuffle = useCallback(() => {
    const shuffle = !prefs.shuffle
    updatePrefs({ ...prefs, shuffle })
    if (queue) {
      const order = shuffle ? shuffledOrder(queue.items, slug) : queue.items.map((i) => i.slug)
      const next = { ...queue, order }
      setQueue(next)
      saveBrowseQueue(next)
    }
  }, [prefs, queue, slug, updatePrefs])

  const onEnded = useCallback((): 'repeat-one' | 'advanced' | 'stopped' => {
    if (prefs.repeat === 'one') return 'repeat-one'
    if (!prefs.autoplay || !nextSlug) return 'stopped'
    go(nextSlug, true)
    return 'advanced'
  }, [go, nextSlug, prefs.autoplay, prefs.repeat])

  return useMemo(() => ({
    inQueue,
    label: inQueue ? queue!.label : null,
    href: inQueue ? queue!.href : null,
    position: inQueue ? queue!.order.indexOf(slug) + 1 : 0,
    total: inQueue ? queue!.order.length : 0,
    prevSlug,
    nextSlug,
    shuffle: prefs.shuffle,
    repeat: prefs.repeat,
    autoplay: prefs.autoplay,
    autoplayOnLoad,
    goPrevious: () => go(prevSlug, false),
    goNext: (automatic = false) => go(nextSlug, automatic),
    toggleShuffle,
    cycleRepeat: () => updatePrefs({ ...prefs, repeat: NEXT_REPEAT[prefs.repeat] }),
    setAutoplay: (autoplay: boolean) => updatePrefs({ ...prefs, autoplay }),
    onEnded,
  }), [autoplayOnLoad, go, inQueue, nextSlug, onEnded, prefs, prevSlug, queue, slug, toggleShuffle, updatePrefs])
}
