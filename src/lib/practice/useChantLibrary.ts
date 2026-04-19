import { useState, useEffect } from 'react'
import type { ChantLibraryEntry } from './chantLibrary'
import type { MezmurEntry } from '../../data/types/mezmur'
import type { WerbEntry } from '../../data/types/werb'
import { loadAllChantData } from './chantDataLoader'
import { mezmurEntryToMezmurItem } from './fromCanonical'

export interface ChantLibraryState {
  entries: ChantLibraryEntry[]
  loading: boolean
  error: string | null
}

function compareTitles(a: string, b: string): number {
  return a.localeCompare(b, 'am', { sensitivity: 'base' })
}

function dedupeById(entries: MezmurEntry[]): MezmurEntry[] {
  const byId = new Map<string, MezmurEntry>()
  for (const e of entries) {
    byId.set(e.id, e)
  }
  return [...byId.values()]
}

function buildChantLibrary(mezmur: MezmurEntry[], werb: WerbEntry[]): ChantLibraryEntry[] {
  // Dedupe mezmur entries (same as original logic)
  const dedupedMezmur = dedupeById(mezmur)
  
  const mezmurEntries: ChantLibraryEntry[] = dedupedMezmur.map((entry) => ({
    form: 'mezmur',
    item: mezmurEntryToMezmurItem(entry),
  }))
  
  const werbEntries: ChantLibraryEntry[] = werb.map((entry) => ({
    form: 'werb',
    item: entry,
  }))
  
  return [...mezmurEntries, ...werbEntries].sort((x, y) =>
    compareTitles(x.item.title, y.item.title),
  )
}

export function useChantLibrary(): ChantLibraryState {
  const [state, setState] = useState<ChantLibraryState>({
    entries: [],
    loading: true,
    error: null,
  })

  useEffect(() => {
    let mounted = true

    async function loadData() {
      try {
        setState(prev => ({ ...prev, loading: true, error: null }))
        
        const { mezmur, werb } = await loadAllChantData()
        const entries = buildChantLibrary(mezmur, werb)
        
        if (mounted) {
          setState({ entries, loading: false, error: null })
        }
      } catch (error) {
        console.error('Failed to load chant data:', error)
        if (mounted) {
          setState(prev => ({ 
            ...prev, 
            loading: false, 
            error: 'Failed to load chant library. Please try refreshing the page.' 
          }))
        }
      }
    }

    loadData()

    return () => {
      mounted = false
    }
  }, [])

  return state
}