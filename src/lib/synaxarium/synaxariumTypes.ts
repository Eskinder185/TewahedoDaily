export type SynaxariumImportanceLevel = 'major' | 'medium' | 'minor'
export type SynaxariumStatus = 'verified' | 'needs_review'

export type SynaxariumSource = {
  title: string
  dateHeading: string
  page: number | null
}

export type SynaxariumEntry = {
  id: string
  ethiopianMonth: string
  ethiopianMonthNumber: number
  ethiopianDay: number
  gregorianApprox: string
  title: string
  type: string
  category: string
  summary: string
  shortSummary: string
  commemorations: string[]
  mainCommemorations: string[]
  scriptureReferences: string[]
  importanceLevel: SynaxariumImportanceLevel
  readMore: string
  status: SynaxariumStatus
  sourceTitle: string
  sourceDateHeading: string
  sourcePage: number | null
  source: SynaxariumSource
}

export type SynaxariumCalendarData = {
  type: 'synaxarium_calendar'
  source: string
  generatedFrom: string
  entryCount: number
  entries: SynaxariumEntry[]
}
