/**
 * Legacy Psalm JSON packs — Mezmure Dawit page loads from Supabase.
 * Archived: `archive/local-data/tselot/mezmure-dawit/`
 */
import type { PrayerEntryTextBlock } from '../../data/types/tselot'

export type PsalmTitleBlock = {
  amharic: string
  geez: string
  english: string
}

export type PsalmEntry = {
  id: string
  number: number
  title: PsalmTitleBlock
  text: PrayerEntryTextBlock
}

export const PSALM_ENTRIES: PsalmEntry[] = []
