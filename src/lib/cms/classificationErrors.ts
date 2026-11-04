import { formatErrorMessage } from './errorMessage'

const MISSING_RPC = /function .*set_mezmur_classification_import|PGRST202/i
const INVALID_SLUGS = /Invalid (category|occasion) slug\(s\):\s*([^—]+)/gi

/** Slugs the classification RPC rejected as unknown or archived, e.g. `{ category: ['cross'], occasion: [] }`. */
export function rejectedClassificationSlugs(message: string): { category: string[]; occasion: string[] } {
  const found = { category: [] as string[], occasion: [] as string[] }
  for (const match of message.matchAll(INVALID_SLUGS)) {
    const kind = match[1].toLowerCase() as 'category' | 'occasion'
    found[kind].push(...match[2].split(',').map((slug) => slug.trim()).filter(Boolean))
  }
  return found
}

/**
 * The text shown when saving categories and occasions fails. It keeps the real database message
 * (the generic formatter turns SQLSTATE 23503 into "item is in use", which hides the cause).
 */
export function classificationRpcErrorMessage(error: unknown): string {
  const raw = formatErrorMessage(error, { fallback: 'The database rejected the classification.' })
  if (MISSING_RPC.test(raw)) {
    return 'The UUID-safe Mezmur classification RPC is not installed. Apply migration 20261025020000_mezmur_bulk_classification.sql before editing classifications.'
  }
  // 42703 comes from INSIDE the installed RPC (an undefined column in its body), not from the browser query.
  if (/42703|column "?\w+"? does not exist/i.test(raw)) {
    return `${raw}. The database's classification function failed internally; this is a database defect, not a problem with your selections. An administrator must apply the reviewed patch 20261104_mezmur_classification_rpc_unnest_alias.sql.`
  }
  const rejected = rejectedClassificationSlugs(raw)
  if (rejected.category.length || rejected.occasion.length) {
    return `${raw}. These taxonomy entries are missing or archived in the database; an administrator must apply migration 20261101130000_mezmur_canonical_taxonomy_slugs.sql (missing) or restore them (archived).`
  }
  return raw
}
