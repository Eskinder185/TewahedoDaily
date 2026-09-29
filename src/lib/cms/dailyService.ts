import { db } from './mezmurService'

/**
 * Live `daily_content` uses `content_date` (not `day`) and exposes
 * announcement/summary rather than bible_references / fasting_* columns.
 */
export type DailyContent = {
  id?: string
  content_date: string
  mezmur_id: string | null
  saint_id: string | null
  feast_id: string | null
  announcement: string
  summary: string
  published: boolean
  updated_at?: string
  updated_by?: string | null
}

export type PublicDaily = {
  content_date: string
  announcement: string
  summary: string | null
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

const DAILY_SELECT =
  'id,content_date,mezmur_id,saint_id,feast_id,announcement,summary,published,updated_at,updated_by'

function normalizeDaily(row: Record<string, unknown> | null, fallbackDate: string): DailyContent | null {
  if (!row) return null
  return {
    id: typeof row.id === 'string' ? row.id : undefined,
    content_date: String(row.content_date || fallbackDate),
    mezmur_id: (row.mezmur_id as string | null) ?? null,
    saint_id: (row.saint_id as string | null) ?? null,
    feast_id: (row.feast_id as string | null) ?? null,
    announcement: String(row.announcement ?? ''),
    summary: String(row.summary ?? ''),
    published: row.published === true,
    updated_at: typeof row.updated_at === 'string' ? row.updated_at : undefined,
    updated_by: (row.updated_by as string | null) ?? null,
  }
}

export async function getDaily(day: string) {
  const { data, error } = await db()
    .from('daily_content')
    .select(DAILY_SELECT)
    .eq('content_date', day)
    .maybeSingle()
  if (error) throw error
  return normalizeDaily(data as Record<string, unknown> | null, day)
}

export async function saveDaily(item: DailyContent) {
  const payload = {
    content_date: item.content_date,
    mezmur_id: item.mezmur_id,
    saint_id: item.saint_id,
    feast_id: item.feast_id,
    announcement: item.announcement || '',
    summary: item.summary || '',
    published: item.published === true,
  }

  if (item.id || item.updated_at) {
    let request = db().from('daily_content').update(payload)
    if (item.id) request = request.eq('id', item.id)
    else request = request.eq('content_date', item.content_date)
    if (item.updated_at) request = request.eq('updated_at', item.updated_at)
    const { data, error } = await request.select(DAILY_SELECT).single()
    if (error) throw error
    return normalizeDaily(data as Record<string, unknown>, item.content_date)!
  }

  const existing = await getDaily(item.content_date)
  if (existing?.id) {
    const { data, error } = await db()
      .from('daily_content')
      .update(payload)
      .eq('id', existing.id)
      .select(DAILY_SELECT)
      .single()
    if (error) throw error
    return normalizeDaily(data as Record<string, unknown>, item.content_date)!
  }

  const { data, error } = await db()
    .from('daily_content')
    .insert(payload)
    .select(DAILY_SELECT)
    .single()
  if (error) throw error
  return normalizeDaily(data as Record<string, unknown>, item.content_date)!
}

export async function publicDaily(day: string) {
  const { data, error } = await db().rpc('public_daily_content', {
    target_day: day,
  })
  if (error) {
    if (error.code === 'PGRST202') {
      const row = await getDaily(day)
      if (!row?.published) return null
      return {
        content_date: row.content_date,
        announcement: row.announcement,
        summary: row.summary || null,
        mezmur: null,
        saint: null,
        feast: null,
      } satisfies PublicDaily
    }
    throw error
  }
  return data as unknown as PublicDaily | null
}
