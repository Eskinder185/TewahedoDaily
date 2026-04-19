export type WerbGuidedStep = {
  id: string
  kind: 'chant' | 'lyrics' | 'movement' | 'posture' | 'mequamia'
  title: string
  summary: string
  detail: string
}

export type WerbEntry = {
  id: string
  type: 'werb'
  title: string
  transliterationTitle: string
  lyrics: string
  transliterationLyrics: string
  meaning?: string
  /** Optional when data comes from compact chant JSON; movement tab stays empty. */
  movementGuide?: string
  postureNotes?: string
  /** Drums, mequamia, kebro — how they fit this werb */
  instrumentUsage?: string
  youtubeUrl?: string
  thumbnail?: string
  teaser?: string
  chantTitle?: string
  usage?: string
  season?: string
  mistakesToAvoid?: string
  beginnerTips?: string
  guidedSteps?: WerbGuidedStep[]
}
