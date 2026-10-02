/**
 * Legacy Zeweter local JSON — production continuous Zeweter uses Supabase.
 * Archived: `archive/local-data/tselot/zeweter-tselot.json`
 */
export type ZeweterPrayerStub = {
  id: string
  slug: string
  title: string
  transliterationTitle?: string
  titleAmharic?: string
  bodyAmharic?: string
  bodyEnglish?: string
}

export const ZEWETER_PRAYERS: ZeweterPrayerStub[] = []
