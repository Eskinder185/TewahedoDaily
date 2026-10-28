import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { resolve } from 'node:path'
import {
  formatProcessingStatus,
  normalizeProcessingStatus,
  optionalText,
  requiredText,
  validateDocumentMetadata,
  validateProcessingResult,
} from '../src/lib/cms/churchLibraryValidation.ts'

const MiB = 1024 * 1024
const valid = [
  ['book.pdf', 'application/pdf'],
  ['book.epub', 'application/epub+zip'],
  ['book.md', 'text/markdown'],
  ['book.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'],
  ['መጽሐፍ.txt', 'text/plain'],
] as const

for (const [name, type] of valid) {
  assert.equal(validateDocumentMetadata({ name, type, size: MiB }, 50 * MiB), type)
}

assert.throws(() => validateDocumentMetadata(undefined, 50 * MiB), /Choose a PDF/)
assert.throws(() => validateDocumentMetadata({ name: undefined, type: 'application/pdf', size: 20 }, 50 * MiB), /Filename is required/)
assert.throws(() => validateDocumentMetadata({ name: 'book.pdf', type: undefined, size: undefined }, 50 * MiB), /file size is unavailable/)
assert.throws(() => validateDocumentMetadata({ name: 'book.pdf', type: 'text/plain', size: 20 }, 50 * MiB), /does not match/)
assert.throws(() => validateDocumentMetadata({ name: 'book.exe', type: '', size: 20 }, 50 * MiB), /Only PDF/)
assert.throws(() => validateDocumentMetadata({ name: 'book.txt', type: 'text/plain', size: 0 }, 50 * MiB), /non-empty/)
assert.throws(() => validateDocumentMetadata({ name: 'book.txt', type: 'text/plain', size: 51 * MiB }, 50 * MiB), /50 MiB/)

assert.throws(() => requiredText(undefined, 'Book title', 300), /Book title is required/)
assert.equal(optionalText(undefined, 'Author', 300), null)
assert.equal(optionalText('  Abba Example  ', 'Author', 300), 'Abba Example')

// Reproduces the production crash exactly: an older/partial API row omitted
// processing_status and the component called replaceAll directly on it.
const partialDatabaseRow: { processing_status?: string; current_version_id?: string } = {
  current_version_id: '00000000-0000-4000-8000-000000000001',
}
assert.throws(
  () => partialDatabaseRow.processing_status!.replaceAll('_', ' '),
  /replaceAll/,
)
assert.equal(normalizeProcessingStatus(partialDatabaseRow.processing_status, true), 'pending')
assert.equal(formatProcessingStatus(partialDatabaseRow.processing_status, true), 'Pending')
assert.equal(formatProcessingStatus(undefined, false), 'Not Uploaded')
assert.deepEqual(
  validateProcessingResult({ status: 'ready', passage_count: 4, notes: null }, 'Processing API'),
  { status: 'ready', passage_count: 4, notes: null },
)
assert.throws(() => validateProcessingResult(undefined, 'Processing API'), /invalid response/)
assert.throws(() => validateProcessingResult({ passage_count: 1 }, 'Processing API'), /processing status/)
assert.throws(() => validateProcessingResult({ status: 'ready' }, 'Processing API'), /passage count/)

const service = readFileSync(resolve('src/lib/cms/churchLibraryService.ts'), 'utf8')
const page = readFileSync(resolve('src/pages/admin/ChurchLibrary.tsx'), 'utf8')
assert.match(service, /created_by: userId/)
assert.doesNotMatch(service, /updated_by: auth\.user/)
assert.match(service, /return \(data \|\| \[\]\)\.map\(normalizeChurchLibraryBook\)/)
assert.match(page, /private file upload failed/)
assert.match(service, /invalid JSON response/)
assert.match(service, /if \(error\) throw error/)
assert.match(service, /if \(uploaded\.error\)/)
assert.doesNotMatch(page, /processing_status\.replaceAll/)
assert.match(page, /formatProcessingStatus/)

console.log('Church Library upload validation and undefined-response regressions OK')
