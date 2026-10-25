import { createServer } from 'node:http'
import { readFileSync } from 'node:fs'
import { dirname, resolve } from 'node:path'
import { fileURLToPath } from 'node:url'
import { chromium } from 'playwright'

const root = resolve(dirname(fileURLToPath(import.meta.url)), '..')
const html = readFileSync(resolve(root, 'scripts/fixtures/church-library-mobile.html'), 'utf8')

async function main() {
  const server = createServer((_req, res) => { res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' }); res.end(html) })
  await new Promise((done) => server.listen(0, '127.0.0.1', done))
  const port = server.address().port
  const browser = await chromium.launch()
  const failures = []
  for (const width of [375, 390, 430, 1024]) {
    const page = await browser.newPage({ viewport: { width, height: 900 } })
    await page.goto(`http://127.0.0.1:${port}`)
    const overflow = await page.evaluate(() => document.documentElement.scrollWidth > document.documentElement.clientWidth + 2)
    if (overflow) failures.push(`${width}px viewport overflows horizontally`)
    await page.close()
  }
  const page = await browser.newPage({ viewport: { width: 390, height: 900 } })
  await page.goto(`http://127.0.0.1:${port}`)
  await page.getByRole('button', { name: 'Upload book' }).click()
  const uploadPanel = page.locator('#upload-panel')
  await uploadPanel.getByLabel('Title').fill('Fixture EPUB')
  await uploadPanel.getByLabel('Book file').setInputFiles({
    name: 'fixture.epub',
    mimeType: 'application/epub+zip',
    buffer: Buffer.from('PK\x03\x04fixture'),
  })
  if (!await page.getByText('fixture.epub').isVisible()) failures.push('selected upload filename missing')
  await page.getByRole('button', { name: 'Upload and process' }).click()
  if (!await page.getByText('Book uploaded and processed into 3 searchable passages.').isVisible()) failures.push('upload/process workflow did not complete')
  if (await page.locator('#upload-progress').getAttribute('value') !== '100') failures.push('upload progress did not complete')
  await page.getByRole('button', { name: 'Enable Search Buddy access' }).click()
  if (!await page.getByText('Complete processing and rights checks first.').isVisible()) failures.push('rights gate did not block premature retrieval')
  await page.getByRole('button', { name: 'Reprocess book' }).click()
  await page.locator('#rights').selectOption('permission_granted')
  await page.locator('#ready').check()
  await page.locator('#quotes').check()
  await page.getByRole('button', { name: 'Enable Search Buddy access' }).click()
  if (!await page.getByText('Search Buddy access enabled for eligible excerpts.').isVisible()) failures.push('eligible retrieval workflow did not complete')
  await page.getByRole('button', { name: 'Preview extracted content' }).click()
  if (!await page.getByText('Page 1 · Sample grounded passage').isVisible()) failures.push('passage preview missing')
  await browser.close(); server.close()
  if (failures.length) { console.error(failures.join('\n')); process.exit(1) }
  console.log('Church Library Playwright workflow and responsive checks OK')
}
main().catch((error) => { console.error(error); process.exit(1) })
