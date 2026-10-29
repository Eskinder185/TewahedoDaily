import fs from 'node:fs'
import path from 'node:path'
import { buildImportPreview } from '../../../src/lib/churchLibrary/structuredImport'
const ROOT = 'content/church-library/seven-sacraments'
const files = ['am', 'en', 'review'].flatMap((d) => fs.readdirSync(path.join(ROOT, d)).map((f) => ({ name: `${d}/${f}`, text: fs.readFileSync(path.join(ROOT, d, f), 'utf8') })))
files.push({ name: 'manifest.json', text: fs.readFileSync(path.join(ROOT, 'manifest.json'), 'utf8') })
const pv = buildImportPreview(files)
fs.mkdirSync('tmp/church-library-db-test', { recursive: true })
for (const p of pv.payloads) fs.writeFileSync(`tmp/church-library-db-test/payload-${p.book.language}.json`, JSON.stringify(p))
console.log('payloads:', pv.payloads.map((p) => `${p.book.slug} (${p.passages.length})`).join(', '))
