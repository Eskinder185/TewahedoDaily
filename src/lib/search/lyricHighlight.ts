import { useEffect, useRef } from 'react'
import { matchText } from './textMatch.ts'

const NAME = 'lyric-match'

type HighlightRegistry = { set(name: string, value: unknown): void; delete(name: string): void }
type HighlightCtor = new (...ranges: Range[]) => unknown

function registry(): { highlights: HighlightRegistry; Highlight: HighlightCtor } | null {
  const css = (globalThis as { CSS?: { highlights?: HighlightRegistry } }).CSS
  const Highlight = (globalThis as { Highlight?: HighlightCtor }).Highlight
  return css?.highlights && Highlight ? { highlights: css.highlights, Highlight } : null
}

/**
 * Highlight the words of `query` inside the rendered lyrics (CSS Custom Highlight API: no DOM mutation, so
 * React's tree and the stored text are untouched) and scroll the first match into view once.
 * Does nothing when the API is unavailable or the visible lyrics do not contain the query.
 */
export function useLyricMatchHighlight(query: string) {
  const rootRef = useRef<HTMLDivElement | null>(null)
  useEffect(() => {
    const root = rootRef.current
    const api = registry()
    const q = query.replace(/\s+/g, ' ').trim()
    if (!root || !api || !q) return
    let scrolled = false
    let timer = 0

    const apply = () => {
      const walker = document.createTreeWalker(root, NodeFilter.SHOW_TEXT)
      const segments: Array<{ node: Text; start: number }> = []
      let all = ''
      for (let node = walker.nextNode(); node; node = walker.nextNode()) {
        const text = node as Text
        if (!text.data.trim()) continue
        segments.push({ node: text, start: all.length })
        all += `${text.data}\n` // a separator no word can cross
      }
      const match = matchText(all, q)
      if (!match) {
        api.highlights.delete(NAME)
        return
      }
      const ranges: Range[] = []
      for (const [from, to] of match.ranges) {
        const segment = [...segments].reverse().find((candidate) => candidate.start <= from)
        if (!segment || to - segment.start > segment.node.data.length) continue
        const range = document.createRange()
        range.setStart(segment.node, from - segment.start)
        range.setEnd(segment.node, to - segment.start)
        ranges.push(range)
      }
      if (!ranges.length) return
      api.highlights.set(NAME, new api.Highlight(...ranges))
      if (!scrolled) {
        scrolled = true
        const target = ranges[0].startContainer.parentElement
        const reduce = window.matchMedia?.('(prefers-reduced-motion: reduce)').matches
        target?.scrollIntoView({ block: 'center', behavior: reduce ? 'auto' : 'smooth' })
      }
    }

    // Lyrics load asynchronously and switch with the language tabs: re-apply on changes, debounced.
    const observer = new MutationObserver(() => {
      window.clearTimeout(timer)
      timer = window.setTimeout(apply, 120)
    })
    observer.observe(root, { childList: true, subtree: true, characterData: true })
    apply()
    return () => {
      window.clearTimeout(timer)
      observer.disconnect()
      api.highlights.delete(NAME)
    }
  }, [query])
  return rootRef
}
