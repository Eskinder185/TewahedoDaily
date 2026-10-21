/**
 * Static access-control checks for five-book editorial preview.
 * Ensures unapproved books are not wired into public routes and
 * the client uses CMS JWT (Authorization Bearer), not sessionStorage secrets.
 */
import { readFileSync } from 'node:fs'
import { resolve, dirname } from 'node:path'
import { fileURLToPath } from 'node:url'

const root = resolve(dirname(fileURLToPath(import.meta.url)), '..')
const appTsx = readFileSync(resolve(root, 'src/App.tsx'), 'utf8')
const apiTs = readFileSync(
  resolve(root, 'src/lib/editorial/editorialBooksApi.ts'),
  'utf8',
)
const previewTsx = readFileSync(
  resolve(root, 'src/pages/admin/EditorialBooksPreview.tsx'),
  'utf8',
)

const errors = []

if (!appTsx.includes('path="editorial-books"')) {
  errors.push('Admin editorial-books route missing')
}
if (!appTsx.includes('RequireCmsRole')) {
  errors.push('CMS role gate missing near admin routes')
}
if (/path="\/(?:library\/)?books/.test(appTsx)) {
  errors.push('Public /books or /library/books route must not exist yet')
}

if (!apiTs.includes('Authorization')) {
  errors.push('API client must send Authorization Bearer CMS session')
}
if (!apiTs.includes('getSession') && !apiTs.includes('access_token')) {
  errors.push('API client must read Supabase CMS access_token')
}
if (/sessionStorage/.test(apiTs)) {
  errors.push('API client must not use sessionStorage for editorial secrets')
}
if (/['"]X-Editorial-Token['"]/.test(apiTs) || /X-Editorial-Token\s*:/.test(apiTs)) {
  errors.push('Frontend must not send legacy X-Editorial-Token anymore')
}
if (/import\.meta\.env\.VITE_.*EDITORIAL.*TOKEN/.test(apiTs)) {
  errors.push('Editorial token must not be read from VITE_*')
}
if (!apiTs.includes('/api/editorial/books/') || !apiTs.includes('/paragraphs')) {
  errors.push('API client missing paginated reading contract')
}
if (!previewTsx.includes('isStaff') && !previewTsx.includes('signedInStaff')) {
  errors.push('Preview must gate on CMS staff session')
}
if (/setEditorialPreviewToken|getEditorialPreviewToken/.test(previewTsx)) {
  errors.push('Preview must not rely on manual token paste helpers')
}
if (!previewTsx.includes('Ethiopic source') && !previewTsx.includes('amharic_source')) {
  errors.push('Preview must surface Ethiopic source attribution')
}

if (errors.length) {
  console.error(errors.join('\n'))
  process.exit(1)
}
console.log('Editorial access static checks OK (CMS JWT client)')
