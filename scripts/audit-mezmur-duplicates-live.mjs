const base = process.env.VITE_SUPABASE_URL
const key = process.env.VITE_SUPABASE_PUBLISHABLE_KEY || process.env.VITE_SUPABASE_ANON_KEY
if (!base || !key) throw new Error('VITE_SUPABASE_URL and publishable/anon key are required')

async function page(table, select, extra = '') {
  const rows = []
  for (let offset = 0; ; offset += 1000) {
    const url = `${base}/rest/v1/${table}?select=${encodeURIComponent(select)}${extra}&limit=1000&offset=${offset}`
    const response = await fetch(url, { headers: { apikey: key, Authorization: `Bearer ${key}` } })
    if (!response.ok) throw new Error(`${table} ${response.status}: ${await response.text()}`)
    const batch = await response.json()
    rows.push(...batch)
    if (batch.length < 1000) return rows
  }
}

try {
  const imports = await page('mezmur_data_import', 'import_id,mezmur_id,slug,title,status,deleted_at', '&deleted_at=is.null')
  const publicRows = await page('mezmur_public', 'mezmur_id,slug,status')
  const groups = new Map()
  for (const row of imports) {
    const slug = String(row.slug || '').trim().toLowerCase()
    if (!slug) continue
    if (!groups.has(slug)) groups.set(slug, [])
    groups.get(slug).push(row)
  }
  const duplicates = [...groups.entries()].filter(([, rows]) => rows.length > 1)
  const publicIds = new Set(publicRows.map((row) => row.mezmur_id).filter(Boolean))
  const published = imports.filter((row) => String(row.status || '').toLowerCase() === 'published')
  const missing = published.filter((row) => !publicIds.has(row.mezmur_id))
  console.log(JSON.stringify({ total_imported: imports.length, published_imports: published.length, public_projection_rows: publicRows.length, duplicate_slug_groups: duplicates.length, duplicate_slug_records: duplicates.reduce((n, [, rows]) => n + rows.length, 0), published_missing_from_public: missing.length, duplicates, missing }, null, 2))
} catch (error) {
  console.error(error)
  process.exitCode = 1
}
