import { db } from './mezmurService'
export type DailyContent = {
  day: string
  mezmur_id: string | null
  saint_id: string | null
  feast_id: string | null
  bible_references: string
  fasting_indicator: string
  fasting_notes: string
  announcement: string
  published: boolean
  updated_at?: string
  updated_by?: string | null
}
export type PublicDaily = Pick<
  DailyContent,
  | 'day'
  | 'bible_references'
  | 'fasting_indicator'
  | 'fasting_notes'
  | 'announcement'
> & {
  mezmur: { title: string; slug: string; thumbnail_url: string | null } | null
  saint: { title: string; slug: string; thumbnail_url: string | null } | null
  feast: { title: string; slug: string; thumbnail_url: string | null } | null
}
export const todayInAddis = () =>
  new Intl.DateTimeFormat('en-CA', {
    timeZone: 'Africa/Addis_Ababa',
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
  }).format(new Date())
export async function getDaily(day: string) {
  const { data, error } = await db()
    .from('daily_content')
    .select('*')
    .eq('day', day)
    .maybeSingle()
  if (error) throw error
  return data as DailyContent | null
}
export async function saveDaily(item: DailyContent) {
  const { updated_at, updated_by, ...payload } = item
  void updated_by
  const request = updated_at
    ? db()
        .from('daily_content')
        .update(payload)
        .eq('day', item.day)
        .eq('updated_at', updated_at)
    : db().from('daily_content').insert(payload)
  const { data, error } = await request.select('*').single()
  if (error) throw error
  return data as DailyContent
}
export async function publicDaily(day: string) {
  const { data, error } = await db().rpc('public_daily_content', {
    target_day: day,
  })
  if (error) throw error
  return data as unknown as PublicDaily | null
}
