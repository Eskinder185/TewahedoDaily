/** Shape of .local-preview/review-inventory.json (LOCAL PREVIEW only; see scripts/play/build-local-review-inventory.ts). */
export type ReviewTag = 'existing-bundled' | 'generated-draft' | 'source-blocked' | 'editorial-review' | 'translation-review' | 'no-amharic' | 'downgraded-amharic' | 'invalid'
export type ReviewField = { label: string; en: string; am: string }
export type ReviewSource = { label: string; route: string; kind: string; blocked: boolean; note?: string }
export type ReviewArtwork = { status: string; items: { id: string; name: string; remote: string; localFallback: string }[] }
export type ReviewRow = {
  id: string
  game: string
  title: string
  contentType: string
  difficulty: string
  category: string
  fields: ReviewField[]
  sources: ReviewSource[]
  artwork: ReviewArtwork
  provenance: { origin: string; kind: 'bundled' | 'generated' }
  reviewState: string
  rights: string
  problems: string[]
  tags: ReviewTag[]
}
export type ReviewExcluded = { game: string; id: string; origin: string; reason: string }
export type ReviewInventory = { generatedAt: string; rows: ReviewRow[]; excluded: ReviewExcluded[]; downgraded: ReviewExcluded[] }

export const TAG_LABEL: Record<ReviewTag, string> = {
  'existing-bundled': 'Existing bundled content',
  'generated-draft': 'Validated generated draft',
  'source-blocked': 'Source blocked',
  'editorial-review': 'Editorial review required',
  'translation-review': 'Translation review required',
  'no-amharic': 'No Amharic text',
  'downgraded-amharic': 'Amharic claim downgraded',
  invalid: 'Invalid or rejected',
}
