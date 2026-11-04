import { requireCmsStaffSession } from '../cms/cmsStaffAuth'
import { supabase } from '../supabase/client'
import type { QuestionRow } from './questionLibrary'

export const STAFF_QUESTION_INVENTORY_KIND = 'faith-challenges-staff-inventory-v1'
const PAGE_SIZE = 250
const COLUMNS = 'id,question_id,stable_id,game_type,category,difficulty,status,payload,source_references,review_notes,updated_at,published_at'

type InventoryResult = { data: unknown; count: number | null; error: { message: string } | null }
type InventoryQuery = {
  select: (columns: string, options: { count: 'exact' }) => InventoryQuery
  order: (column: string, options: { ascending: true }) => InventoryQuery
  range: (from: number, to: number) => Promise<InventoryResult>
}
type InventoryClient = { from: (table: string) => InventoryQuery }

export type StaffQuestionInventory = {
  kind: typeof STAFF_QUESTION_INVENTORY_KIND
  complete: true
  exportedAt: string
  visibleCount: number
  pageSize: number
  pages: number
  rows: QuestionRow[]
}

/** Counted, ordered pages prevent a capped PostgREST response from being called a complete export. */
export function createStaffQuestionInventory(
  client: InventoryClient | null,
  authorize: () => Promise<{ profileRole?: string } | void>,
) {
  return async (): Promise<StaffQuestionInventory> => {
    const session = await authorize()
    if (!session || !['editor', 'admin', 'super_admin'].includes(session.profileRole || '')) {
      throw new Error('Editorial staff access is required for a complete question inventory.')
    }
    if (!client) throw new Error('Supabase is not configured.')
    const rows: QuestionRow[] = []
    const seen = new Set<string>()
    let lastId = ''
    let expected: number | null = null
    let pages = 0
    for (let offset = 0; ; offset += PAGE_SIZE) {
      const result = await client.from('play_content_items').select(COLUMNS, { count: 'exact' })
        .order('id', { ascending: true }).range(offset, offset + PAGE_SIZE - 1)
      if (result.error) throw new Error(`Staff inventory page ${pages + 1}: ${result.error.message}`)
      if (!Array.isArray(result.data) || !Number.isSafeInteger(result.count) || result.count! < 0) {
        throw new Error('Staff inventory did not return an exact row count and array page.')
      }
      if (expected === null) expected = result.count
      if (result.count !== expected) throw new Error('Question count changed during export. Retry the inventory.')
      const expectedPageSize = Math.min(PAGE_SIZE, Math.max(0, (expected ?? 0) - offset))
      if (result.data.length !== expectedPageSize) throw new Error(`Staff inventory page ${pages + 1} was incomplete.`)
      for (const item of result.data) {
        if (!item || typeof item !== 'object' || typeof item.id !== 'string' || seen.has(item.id)) {
          throw new Error('Staff inventory contains a malformed or repeated row ID.')
        }
        if (lastId && item.id <= lastId) throw new Error('Staff inventory row order changed during export.')
        seen.add(item.id)
        lastId = item.id
        rows.push(item as QuestionRow)
      }
      pages++
      if (rows.length === expected) break
    }
    return { kind: STAFF_QUESTION_INVENTORY_KIND, complete: true, exportedAt: new Date().toISOString(),
      visibleCount: expected ?? 0, pageSize: PAGE_SIZE, pages, rows }
  }
}

export const loadCompleteStaffQuestionInventory = createStaffQuestionInventory(
  supabase as unknown as InventoryClient | null,
  () => requireCmsStaffSession('Faith Challenges complete question inventory'),
)
