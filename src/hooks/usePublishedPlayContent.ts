import { useEffect, useState } from 'react'
import { loadPublishedContent, loadPublishedHubSummary } from '../lib/play/publishedContent'
import type { GameCounts } from '../lib/play/contentRegistry'
import type { StudioDraft, StudioGame } from '../lib/play/contentStudio'

export function usePublishedPlayContent(game: StudioGame) {
  const [result, setResult] = useState<{ game: StudioGame; drafts: StudioDraft[]; state: 'loading' | 'ready' | 'error' }>({ game, drafts: [], state: 'loading' })
  const [attempt, setAttempt] = useState(0)
  useEffect(() => {
    let active = true
    void loadPublishedContent(game).then(drafts => { if (active) setResult({ game, drafts, state: 'ready' }) }, () => { if (active) setResult({ game, drafts: [], state: 'error' }) })
    return () => { active = false }
  }, [game, attempt])
  return { ...(result.game === game ? result : { game, drafts: [], state: 'loading' as const }), retry: () => { setResult({ game, drafts: [], state: 'loading' }); setAttempt(value => value + 1) } }
}

/** Load live published hub counts only when database-only mode is enabled. */
export function usePublishedHubSummary(enabled: boolean) {
  const [result, setResult] = useState<{ summary: Record<StudioGame, GameCounts> | null; state: 'idle' | 'loading' | 'ready' | 'error' }>({ summary: null, state: enabled ? 'loading' : 'idle' })
  const [attempt, setAttempt] = useState(0)
  useEffect(() => {
    if (!enabled) return
    let active = true
    void loadPublishedHubSummary().then(
      summary => { if (active) setResult({ summary, state: 'ready' }) },
      () => { if (active) setResult({ summary: null, state: 'error' }) },
    )
    return () => { active = false }
  }, [enabled, attempt])
  return {
    ...(enabled ? result : { summary: null, state: 'idle' as const }),
    retry: () => { if (enabled) { setResult({ summary: null, state: 'loading' }); setAttempt(value => value + 1) } },
  }
}
