import { useEffect, useState } from 'react'
import {
  getChantLibrary,
  type ChantLibraryResult,
} from '../lib/practice/chantRepository'

type ChantLibraryState = ChantLibraryResult & { isLoading: boolean }

const initialState: ChantLibraryState = {
  entries: [],
  source: 'local',
  isLoading: true,
}

export function useChantLibrary(): ChantLibraryState {
  const [state, setState] = useState<ChantLibraryState>(initialState)

  useEffect(() => {
    let active = true
    void getChantLibrary().then((result) => {
      if (active) setState({ ...result, isLoading: false })
    })
    return () => {
      active = false
    }
  }, [])

  return state
}

