/**
 * Overflow checks for editorial reader layout at phone widths.
 * Uses a local HTML fixture (no backend, no secrets).
 */
import { createServer } from 'node:http'
import { readFileSync } from 'node:fs'
import { dirname, resolve } from 'node:path'
import { fileURLToPath } from 'node:url'
import { chromium } from 'playwright'

const root = resolve(dirname(fileURLToPath(import.meta.url)), '..')
const html = readFileSync(
  resolve(root, 'scripts/fixtures/editorial-reader-mobile.html'),
  'utf8',
)
const widths = [375, 390, 393, 430]

async function main() {
  const server = createServer((req, res) => {
    res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' })
    res.end(html)
  })
  await new Promise((resolveListen) => server.listen(0, '127.0.0.1', resolveListen))
  const { port } = server.address()
  const base = `http://127.0.0.1:${port}/`

  const browser = await chromium.launch()
  const errors = []
  for (const w of widths) {
    const context = await browser.newContext({
      viewport: { width: w, height: 844 },
    })
    const page = await context.newPage()
    await page.goto(base, { waitUntil: 'domcontentloaded' })
    const overflow = await page.evaluate(() => {
      const de = document.documentElement
      const body = document.body
      return {
        doc: de.scrollWidth > de.clientWidth + 2,
        body: body.scrollWidth > body.clientWidth + 2,
        scrollWidth: de.scrollWidth,
        clientWidth: de.clientWidth,
      }
    })
    if (overflow.doc || overflow.body) {
      errors.push(
        `${w}px overflow scrollWidth=${overflow.scrollWidth} clientWidth=${overflow.clientWidth}`,
      )
    }
    await context.close()
  }
  await browser.close()
  server.close()

  if (errors.length) {
    console.error(errors.join('\n'))
    process.exit(1)
  }
  console.log('Editorial mobile fixture OK:', widths.join(', '), 'px')
}

main().catch((err) => {
  console.error(err)
  process.exit(1)
})
