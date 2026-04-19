export type PrayerTextSection = {
  id: string
  title: string
  text: {
    geez: string
    amharic: string
    english: string
  }
}

export type PrayerDocumentContent = {
  sourcePdfPath: string
  summary: {
    amharic: string
    english: string
  }
  sections: PrayerTextSection[]
}
