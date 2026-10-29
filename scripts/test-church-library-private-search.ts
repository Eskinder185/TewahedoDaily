import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { join } from 'node:path'

const root = process.cwd()
const migration = readFileSync(join(root, 'supabase/migrations/20261030130000_church_library_staff_private_search.sql'), 'utf8').toLowerCase()
const client = readFileSync(join(root, 'src/lib/searchBuddy/churchLibrarySearch.ts'), 'utf8')

assert.match(migration, /auth\.uid\(\) is not null and public\.is_staff\(\)/)
assert.match(migration, /public\.church_library_book_is_public\(b\.id\)/)
assert.match(migration, /processing_status = 'ready' or b\.ingestion_status = 'ready'/)
assert.doesNotMatch(migration, /auth\.role\(\).*service_role.*staff_access/)
assert.doesNotMatch(migration, /update public\.church_library_books/)
assert.doesNotMatch(migration, /update public\.church_library_passages/)
assert.match(migration, /grant execute on function public\.search_church_library_sections.*to anon, authenticated, service_role/s)
assert.match(migration, /grant execute on function public\.search_church_library\(text, integer, text, extensions\.vector\).*to anon, authenticated, service_role/s)
assert.match(migration, /'baptism','sacrament of baptism','ጥምቀት','ምሥጢረ ጥምቀት'/)
assert.match(migration, /'holy communion','eucharist','qurban','ቁርባን','ምሥጢረ ቁርባን'/)
assert.match(migration, /passage_key text/)
assert.match(migration, /book_slug text/)
assert.match(migration, /section_key text/)
assert.match(migration, /list_church_library_faq_suggestions/)
assert.match(migration, /jsonb_array_elements\(f\.source_references\)/)

assert.match(client, /church_library_search_status/)
assert.match(client, /church_library_public_search_status/)
assert.match(client, /Structured Church Library search failed/)
assert.match(client, /if \(!results\.length && structuredResult\.error\) throw structuredResult\.error/)

console.log('Church Library private staff search contracts passed.')
