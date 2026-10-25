import assert from 'node:assert/strict'
import { createServer } from 'node:http'
import { readFileSync } from 'node:fs'
import { chromium } from 'playwright'

const html = readFileSync(new URL('./fixtures/mezmur-bulk-management.html', import.meta.url), 'utf8')
const server = createServer((_request, response) => { response.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' }); response.end(html) })
await new Promise((done) => server.listen(0, '127.0.0.1', done))
const port = server.address().port
const browser = await chromium.launch()
try {
  for (const width of [375, 1024]) {
    const page = await browser.newPage({ viewport: { width, height: 820 } })
    await page.goto(`http://127.0.0.1:${port}`)
    assert.equal(await page.evaluate(() => document.documentElement.scrollWidth > document.documentElement.clientWidth + 2), false)
    await page.getByText('886 Draft Mezmurs').waitFor()
    assert.equal(await page.getByText('[object Object]', { exact: true }).count(), 0)
    await page.getByText('Zemari / Singer', { exact: true }).waitFor()
    await page.getByText('Name recorded', { exact: true }).waitFor()
    await page.getByRole('combobox', { name: 'Link Zemari for Blocked Mezmur' }).waitFor()
    await page.getByRole('button', { name: 'Auto-Link Existing Zemaris (1)' }).click()
    await page.getByRole('heading', { name: 'Auto-Link Existing Zemaris' }).waitFor()
    await page.getByText('Already linked').waitFor()
    await page.getByText('Safe exact matches').waitFor()
    await page.getByText('Safe normalized matches').waitFor()
    await page.getByText('Ambiguous names').waitFor()
    await page.getByText('Not found').waitFor()
    await page.getByText('Total Mezmurs affected').waitFor()
    await page.getByRole('button', { name: 'Confirm & Link 1 Mezmurs' }).click()
    await page.getByText('Auto-linked 1 Mezmur(s) to existing Zemaris; 0 failed or skipped. Original singer text preserved.').waitFor()
    await page.getByRole('button', { name: 'Check Eligibility / Refresh' }).click()
    await page.getByText('Supabase inventory refreshed: 886 Draft Mezmurs.').waitFor()
    assert.equal(await page.getByText('[object Object]', { exact: true }).count(), 0)
    await page.getByRole('button', { name: 'Analyze Lyrics' }).click()
    await page.getByText('Automatic AI analysis is unavailable because the deployed API does not expose /api/mezmur-bulk/jobs. Manual Zemari links, categories, and publishing remain available through Supabase.').waitFor()
    await page.getByRole('button', { name: 'Select current page' }).click()
    await page.getByRole('button', { name: 'Publish Selected (1)' }).click()
    await page.getByRole('dialog').waitFor()
    await page.getByText('leave 1 blocked record as Draft').waitFor()
    await page.getByRole('button', { name: 'Confirm publication' }).click()
    await page.getByText('Published 1; skipped 0; failed 0.').waitFor()
    await page.getByRole('button', { name: 'Download publication report' }).waitFor()
    await page.close()
  }
  console.log('PASS: Supabase-only bulk CMS desktop/mobile fallback, AI unavailable state, selection, guarded publish, and report workflow')
} finally { await browser.close(); server.close() }
