export type CalendarExpandedContent = {
  whyCelebrated?: string
  whatHappened?: string[]
  significance?: string
  source?: {
    title?: string
    file?: string
    entryLabel?: string
    status?: string
    provenanceNote?: string
    originalReference?: string
  }
}

export type CalendarLiturgyContext = {
  structure: string[]
  anaphora: {
    id: string
    title: string
    summary?: string
    reason: string
    confidence: string
  }
  readings: {
    title?: string
    status: string
    note: string
    items?: Array<{
      title: string
      reference?: string
    }>
    pattern?: Array<{
      id?: string
      title: string
      order?: number
    }>
  }
  mezmur: {
    id?: string
    title?: string
    note: string
    status: string
  }
  whyToday: string
  source?: {
    from: string[]
  }
}

export type CalendarDayCommemoration = {
  title: string
  category?: string
  kind?: string
  priority?: string
  expandedContent?: CalendarExpandedContent
}

export type CalendarDayDetail = {
  id: string
  title: string
  shortDescription: string
  ethiopianDate: {
    month: string
    day: number
    year?: number
    label?: string
  }
  gregorianDate: {
    label?: string
    month?: number
    day?: number
  }
  commemorations: CalendarDayCommemoration[]
  expandedContent?: CalendarExpandedContent
  liturgyContext?: CalendarLiturgyContext
  source?: {
    synaxarium?: {
      file?: string
      entryLabel?: string
      originalReference?: string
    }
    liturgy?: {
      file?: string
    }
  }
}
