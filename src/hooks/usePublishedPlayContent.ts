import { useEffect, useState } from 'react'
import { loadPublishedContent } from '../lib/play/publishedContent'
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
