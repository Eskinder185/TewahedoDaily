import assert from 'node:assert/strict'
import { createServer } from 'node:http'
import { readFileSync } from 'node:fs'
import { dirname, resolve } from 'node:path'
import { fileURLToPath } from 'node:url'
import { chromium } from 'playwright'

const root = resolve(dirname(fileURLToPath(import.meta.url)), '..')
const html = readFileSync(resolve(root, 'scripts/fixtures/bible-manager-workflow.html'), 'utf8')
const server = createServer((_request, response) => { response.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' }); response.end(html) })
await new Promise((done) => server.listen(0, '127.0.0.1', done))
const port = server.address().port
const browser = await chromium.launch()
try {
  for (const width of [375, 430, 1024]) {
    const page = await browser.newPage({ viewport: { width, height: 850 }, colorScheme: width === 430 ? 'dark' : 'light' })
    await page.goto(`http://127.0.0.1:${port}`)
    assert.equal(await page.evaluate(() => document.documentElement.scrollWidth > document.documentElement.clientWidth + 2), false, `${width}px overflow`)
    await page.getByRole('button', { name: 'Save Draft' }).click()
    await page.getByText('Draft saved. Public Scripture was not changed.').waitFor()
    await page.getByRole('button', { name: 'Publish' }).click()
    await page.getByText('Chapter published. The public reader now uses this revision.').waitFor()
    await page.getByRole('button', { name: 'Restore to Draft' }).click()
    await page.getByText('Revision restored as a draft.').waitFor()
    await page.getByRole('button', { name: 'Bulk Import' }).click()
    await page.getByRole('button', { name: 'Preview import' }).click()
    await page.getByText('Possible missing verse between 1 and 3.').waitFor()
    await page.getByRole('button', { name: 'Stage Import as Drafts' }).click()
    assert.equal(await page.locator('#status').textContent(), 'Import staged as drafts. Nothing was published.')
    await page.close()
  }
  console.log('Bible Manager Playwright checks passed: draft, publish, restore, import preview, mobile, desktop, and night mode.')
} finally { await browser.close(); server.close() }
