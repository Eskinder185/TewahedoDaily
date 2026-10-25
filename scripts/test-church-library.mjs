import { readFileSync } from 'node:fs'
import { resolve, dirname } from 'node:path'
import { fileURLToPath } from 'node:url'

const root = resolve(dirname(fileURLToPath(import.meta.url)), '..')
const files = {
  app: readFileSync(resolve(root, 'src/App.tsx'), 'utf8'),
  nav: readFileSync(resolve(root, 'src/pages/admin/AdminLayout.tsx'), 'utf8'),
  page: readFileSync(resolve(root, 'src/pages/admin/ChurchLibrary.tsx'), 'utf8'),
  service: readFileSync(resolve(root, 'src/lib/cms/churchLibraryService.ts'), 'utf8'),
  search: readFileSync(resolve(root, 'src/lib/searchBuddy/churchLibrarySearch.ts'), 'utf8'),
  backendMain: readFileSync(resolve(root, 'backend/app/main.py'), 'utf8'),
  backendRouter: readFileSync(resolve(root, 'backend/app/editorial/church_library_router.py'), 'utf8'),
  migration: readFileSync(resolve(root, 'supabase/migrations/20261024190000_church_library.sql'), 'utf8'),
  repairMigration: readFileSync(resolve(root, 'supabase/migrations/20261024240000_church_library_upload_schema_repair.sql'), 'utf8'),
}

const errors = []
if (!files.nav.includes("label: 'Church Library'")) errors.push('Admin navigation was not renamed')
if (!files.app.includes('path="church-library"')) errors.push('Church Library route missing')
if (!files.app.includes('path="editorial-books"') || !files.app.includes('Navigate to="/admin/church-library"')) errors.push('Legacy route redirect missing')
for (const action of ['Upload book', 'Upload and process', 'Save details', 'Reprocess book', 'Enable Search Buddy access', 'Remove book']) {
  if (!files.page.includes(action)) errors.push(`Missing CMS action: ${action}`)
}
if (!files.page.includes('type="file"') || !files.page.includes('DOCUMENT_ACCEPT')) errors.push('Add Book file selector missing')
if (!files.page.includes('uploadProgress') || !files.page.includes('<progress')) errors.push('Upload progress UI missing')
if (!/MAX_BOOK_BYTES\s*=\s*(?:50|100)\s*\*\s*1024\s*\*\s*1024/.test(files.service)) errors.push('Upload size validation missing')
if (!files.service.includes('validateChurchLibraryFileContents')) errors.push('File signature validation missing')
if (!files.service.includes('404 Not Found')) errors.push('Precise missing processing route diagnostic missing')
if (!files.search.includes('/api/church-library/search')) errors.push('Search Buddy retrieval endpoint missing')
if (!files.backendMain.includes('app.include_router(church_library_router)')) errors.push('FastAPI Church Library router is not registered')
for (const route of ['/status', '/books/{book_id}/process', '/books/{book_id}/status', '/books/{book_id}/results', '/books/{book_id}/retry', '/search']) {
  if (!files.backendRouter.includes(`"${route}"`)) errors.push(`Backend Church Library route missing: ${route}`)
}
if (!files.service.includes('/results?limit=100&offset=0')) errors.push('CMS preview does not use authenticated backend extraction results')
if (!files.migration.includes("public = false")) errors.push('Original storage bucket is not private')
if (!files.migration.includes('public_retrieval_enabled')) errors.push('Retrieval access is not separated')
if (!files.migration.includes('approved_for_ingestion')) errors.push('Processing-readiness flag missing')
const unsafeGrant = files.migration
  .split(';')
  .some((statement) => /grant\s+(?:all|select)/i.test(statement) && /church_library_(?:books|versions|sections|passages)/i.test(statement) && /\bto\s+anon\b/i.test(statement))
if (unsafeGrant) errors.push('Anonymous table grant detected')
for (const column of ['processing_status', 'current_version_id', 'cover_storage_path', 'public_retrieval_enabled']) {
  if (!files.repairMigration.includes(`add column if not exists ${column}`)) errors.push(`Repair migration does not add missing ${column}`)
}
for (const table of ['church_library_versions', 'church_library_sections', 'church_library_passages']) {
  if (!files.repairMigration.includes(`create table if not exists public.${table}`)) errors.push(`Repair migration does not safely install ${table}`)
}
if (!files.repairMigration.includes("notify pgrst, 'reload schema'")) errors.push('Repair migration does not reload the PostgREST schema cache')
if (/getPublicUrl\s*\(/.test(files.service)) errors.push('Private Church Library service generates a public Storage URL')
if (errors.length) {
  console.error(errors.join('\n'))
  process.exit(1)
}
console.log('Church Library static security and workflow checks OK')
