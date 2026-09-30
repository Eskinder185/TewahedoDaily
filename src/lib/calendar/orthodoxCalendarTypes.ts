export type OrthodoxObservanceRow = {
  id: string
  slug: string
  title: string
  title_amharic: string | null
  description: string | null
  observance_type: string | null
  category: string | null
  is_major: boolean | null
  is_movable: boolean | null
  ethiopian_month_number: number | null
  ethiopian_day: number | null
  pascha_offset_days: number | null
  season_slug: string | null
  occasion_tag: string | null
  recurrence: string | null
  image_path: string | null
  image_alt: string | null
  sort_order: number | null
  status: string | null
}

export type LiturgicalFastRow = {
  id: string
  slug: string
  name: string
  name_amharic: string | null
  description: string | null
  fast_type: string | null
  is_movable: boolean | null
  ethiopian_month_number_start: number | null
  ethiopian_day_start: number | null
  ethiopian_month_number_end: number | null
  ethiopian_day_end: number | null
  pascha_start_offset: number | null
  pascha_end_offset: number | null
  weekly_days: string | null
  fast_free_exception: string | null
  priority: number | null
  occasion_tag: string | null
  status: string | null
}

export type LiturgicalSeasonRow = {
  id: string
  slug: string
  title: string
  title_amharic: string | null
  description: string | null
  season_type: string | null
  is_movable: boolean | null
  ethiopian_month_number_start: number | null
  ethiopian_day_start: number | null
  ethiopian_month_number_end: number | null
  ethiopian_day_end: number | null
  pascha_start_offset: number | null
  pascha_end_offset: number | null
  priority: number | null
  occasion_tags: string | null
  status: string | null
}

export type MonthlyCommemorationRow = {
  id: string
  slug: string
  title: string
  title_amharic: string | null
  category: string | null
  ethiopian_day: number
  recurrence: string | null
  description: string | null
  occasion_tag: string | null
  image_path: string | null
  image_alt: string | null
  sort_order: number | null
  status: string | null
}

export type DayObservance = {
  id: string
  slug: string
  title: string
  titleAmharic: string
  description: string
  observanceType: string
  category: string
  isMajor: boolean
  isMovable: boolean
  occasionTag: string | null
  imagePath: string | null
  imageAlt: string
}

export type DayFast = {
  id: string
  slug: string
  name: string
  nameAmharic: string
  description: string
  fastType: string
  occasionTag: string | null
  priority: number
}

export type DaySeason = {
  id: string
  slug: string
  title: string
  titleAmharic: string
  description: string
  seasonType: string
  occasionTags: string[]
  priority: number
}

export type DayMonthlyCommemoration = {
  id: string
  slug: string
  title: string
  titleAmharic: string
  category: string
  ethiopianDay: number
  description: string
  occasionTag: string | null
}
