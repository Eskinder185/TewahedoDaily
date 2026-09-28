import { createContext, useContext } from 'react'
import type { MezmurCard } from './service'
export const AudioContext = createContext<{
  play: (track: MezmurCard, playlist?: MezmurCard[]) => void
  stop: () => void
}>({ play: () => {}, stop: () => {} })
export const useGlobalAudio = () => useContext(AudioContext)
