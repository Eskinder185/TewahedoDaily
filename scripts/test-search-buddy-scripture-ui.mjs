/**
 * Mobile-first verified Scripture UI checks (expand/collapse, overflow, a11y).
 * Mirrors AiResponseCard structure + ResultCard.module.css scripture rules.
 * Run: npx tsx scripts/test-search-buddy-scripture-ui.mjs
 */
import assert from 'node:assert/strict'
import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'
import { chromium } from 'playwright'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const outDir = path.join(__dirname, '..', 'tmp', 'scripture-ui')
fs.mkdirSync(outDir, { recursive: true })

const EN_MATT =
  'Go, and make disciples of all nations, baptizing them in the name of the Father and of the Son and of the Holy Spirit,'

// Exact Amharic Matthew 28:19-20 sample (Unicode escapes only — do not reconstruct).
const AM_MATT = [
  0x12a5, 0x1295, 0x130d, 0x12f2, 0x1205, 0x20, 0x1202, 0x12f1, 0x1293, 0x20, 0x12a0, 0x1215, 0x12db, 0x1265,
  0x1295, 0x20, 0x1201, 0x1201, 0x20, 0x1260, 0x12a0, 0x1265, 0x20, 0x1260, 0x12c8, 0x120d, 0x12f5, 0x1293,
  0x20, 0x1260, 0x1218, 0x1295, 0x1348, 0x1235, 0x20, 0x1245, 0x12f1, 0x1235, 0x20, 0x1235, 0x121d, 0x20,
  0x12a5, 0x12eb, 0x1320, 0x1218, 0x1243, 0x127d, 0x120b, 0x1278, 0x12cd, 0x1365, 0x20, 0x12eb, 0x12d8, 0x12dd,
  0x120e, 0x127d, 0x120b, 0x1278, 0x12cd, 0x121d, 0x20, 0x1201, 0x1201, 0x20, 0x12a5, 0x1295, 0x12f2, 0x1320,
  0x1265, 0x1241, 0x20, 0x12a5, 0x12eb, 0x1235, 0x1270, 0x121b, 0x122b, 0x127d, 0x120b, 0x1278, 0x12cd, 0x20,
  0x12f0, 0x1240, 0x20, 0x1218, 0x12db, 0x1219, 0x122d, 0x1275, 0x20, 0x12a0, 0x12f5, 0x122d, 0x130e, 0x12cb,
  0x1278, 0x12cd, 0x1362, 0x20, 0x12a5, 0x1294, 0x1206, 0x121d, 0x1365, 0x20, 0x12a5, 0x1294, 0x20, 0x12a5,
  0x1235, 0x12a8, 0x20, 0x12d3, 0x1208, 0x121d, 0x20, 0x134d, 0x133b, 0x121c, 0x20, 0x12f5, 0x1228, 0x1235,
  0x20, 0x1201, 0x120d, 0x130a, 0x12dc, 0x20, 0x12a8, 0x12a5, 0x1293, 0x1295, 0x1270, 0x20, 0x130b, 0x122d,
  0x20, 0x1290, 0x129d, 0x1362, 0x201d,
]
  .map((cp) => String.fromCodePoint(cp))
  .join('')

const HEADING_AM = [
  0x12e8, 0x1270, 0x1228, 0x130b, 0x1308, 0x1321, 0x20, 0x12e8, 0x1218, 0x133d, 0x1210, 0x134d, 0x20, 0x1245,
  0x12f1, 0x1235, 0x20, 0x1325, 0x1245, 0x1236, 0x127d,
]
  .map((cp) => String.fromCodePoint(cp))
  .join('')

function buildHtml() {
  return `<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Scripture UI fixture</title>
<style>
  :root {
    --color-text: #1a1510;
    --color-text-muted: #5c5348;
    --color-border: #d4c8b8;
    --color-bg: #f7f1e8;
    --color-bg-elevated: #fffdf8;
    --color-bg-muted: #ebe3d6;
  }
  html.dark {
    --color-text: #f3ebe0;
    --color-text-muted: #b8a994;
    --color-border: #3d3428;
    --color-bg: #1a1612;
    --color-bg-elevated: #241f19;
    --color-bg-muted: #2e2820;
  }
  * { box-sizing: border-box; }
  body {
    margin: 0;
    font-family: Georgia, "Noto Serif Ethiopic", serif;
    background: var(--color-bg);
    color: var(--color-text);
  }
  .panel {
    width: 100%;
    max-width: 100vw;
    max-height: 100vh;
    overflow: auto;
    padding: 0.75rem;
  }
  .aiBody { margin: 0; white-space: pre-wrap; overflow-wrap: anywhere; }
  .scriptureBlock {
    margin-top: 0.7rem;
    padding-top: 0.55rem;
    border-top: 1px solid color-mix(in srgb, var(--color-border) 80%, transparent);
    min-width: 0;
  }
  .scriptureNote {
    margin: 0 0 0.45rem;
    font-size: 0.75rem;
    line-height: 1.35;
    color: var(--color-text-muted);
  }
  .scriptureList { display: grid; gap: 0.4rem; min-width: 0; }
  .scriptureDetails {
    min-width: 0;
    border: 1px solid color-mix(in srgb, var(--color-border) 85%, transparent);
    border-radius: 10px;
    background: color-mix(in srgb, var(--color-bg) 70%, var(--color-bg-elevated));
    overflow: clip;
  }
  .scriptureSummary {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 0.55rem;
    min-height: 44px;
    padding: 0.55rem 0.7rem;
    cursor: pointer;
    list-style: none;
  }
  .scriptureSummary::-webkit-details-marker { display: none; }
  .scriptureSummaryMain { display: grid; gap: 0.15rem; min-width: 0; flex: 1; }
  .scriptureReference { font-weight: 700; font-size: 0.92rem; overflow-wrap: anywhere; }
  .scriptureMeta, .scriptureRange {
    font-size: 0.72rem;
    color: var(--color-text-muted);
    overflow-wrap: anywhere;
  }
  .scriptureBody { padding: 0 0.7rem 0.7rem; min-width: 0; }
  .scriptureText {
    margin: 0;
    padding: 0.55rem 0.65rem;
    border-radius: 8px;
    background: color-mix(in srgb, var(--color-bg-muted) 55%, transparent);
    font-size: 0.9rem;
    line-height: 1.55;
    white-space: pre-wrap;
    overflow-wrap: anywhere;
    word-break: break-word;
  }
  .scriptureText[lang='am'] { font-size: 0.98rem; line-height: 1.65; }
  .aiSourcesHeading { margin: 0 0 0.35rem; font-size: 0.95rem; }
</style>
</head>
<body>
  <div class="panel" id="panel">
    <article aria-label="Assistant answer">
      <p class="aiBody">An explanation of the Holy Trinity...</p>
      <section class="scriptureBlock" aria-label="Supplied Scripture">
        <h3 class="aiSourcesHeading" id="heading-en">Supplied Scripture</h3>
        <h3 class="aiSourcesHeading" id="heading-am" hidden></h3>
        <p class="scriptureNote">Exact Scripture text from the church Bible service — not generated by the assistant.</p>
        <div class="scriptureList">
          <details class="scriptureDetails" id="pass-en">
            <summary class="scriptureSummary" aria-controls="body-en">
              <span class="scriptureSummaryMain">
                <span class="scriptureReference">Matthew 28:19</span>
                <span class="scriptureMeta">English · web · Mystery: Trinity</span>
              </span>
            </summary>
            <div id="body-en" class="scriptureBody">
              <p class="scriptureText" lang="en" id="text-en"></p>
            </div>
          </details>
          <details class="scriptureDetails" id="pass-am">
            <summary class="scriptureSummary" aria-controls="body-am">
              <span class="scriptureSummaryMain">
                <span class="scriptureReference">Matthew 28:19-20</span>
                <span class="scriptureMeta">Amharic · am · Mystery: Trinity</span>
                <span class="scriptureRange">Covers verses 19–20</span>
              </span>
            </summary>
            <div id="body-am" class="scriptureBody">
              <p class="scriptureText" lang="am" id="text-am"></p>
            </div>
          </details>
        </div>
      </section>
    </article>
  </div>
</body>
</html>`
}

const widths = [375, 390, 393, 430]

async function checkViewport(page, width) {
  await page.setViewportSize({ width, height: 812 })
  await page.setContent(buildHtml(), { waitUntil: 'domcontentloaded' })
  await page.evaluate(
    ({ en, am, headingAm }) => {
      document.getElementById('text-en').textContent = en
      document.getElementById('text-am').textContent = am
      document.getElementById('heading-am').textContent = headingAm
    },
    { en: EN_MATT, am: AM_MATT, headingAm: HEADING_AM },
  )

  const overflow = await page.evaluate(() => {
    const de = document.documentElement
    const panel = document.getElementById('panel')
    return {
      doc: de.scrollWidth > de.clientWidth + 2,
      panel: panel ? panel.scrollWidth > panel.clientWidth + 2 : true,
    }
  })
  assert.equal(overflow.doc, false, `${width}px document overflow`)
  assert.equal(overflow.panel, false, `${width}px panel overflow`)

  const summaryBox = await page.locator('#pass-en > summary').boundingBox()
  assert.ok(summaryBox, `${width}px summary box`)
  assert.ok(summaryBox.height >= 44, `${width}px touch target height ${summaryBox.height}`)

  const enDetails = page.locator('#pass-en')
  assert.equal(await enDetails.getAttribute('open'), null)
  await page.locator('#pass-en > summary').click()
  assert.ok((await enDetails.getAttribute('open')) !== null)
  const enText = await page.locator('#text-en').innerText()
  assert.equal(enText.trim(), EN_MATT)

  assert.equal(await page.locator('#pass-am').count(), 1)
  await page.locator('#pass-am > summary').click()
  assert.ok((await page.locator('#pass-am').getAttribute('open')) !== null)
  const amText = await page.locator('#text-am').innerText()
  assert.equal(amText.trim(), AM_MATT)
  assert.match(await page.locator('#pass-am .scriptureRange').innerText(), /19/)

  const openState = await page.evaluate(() => {
    const el = document.getElementById('pass-en')
    return el instanceof HTMLDetailsElement ? el.open : false
  })
  assert.equal(openState, true)

  await page.locator('#pass-en > summary').click()
  assert.equal(await enDetails.getAttribute('open'), null)

  await page.evaluate(() => {
    document.getElementById('heading-en')?.setAttribute('hidden', '')
    document.getElementById('heading-am')?.removeAttribute('hidden')
  })
  assert.equal((await page.locator('#heading-am').innerText()).trim(), HEADING_AM)

  await page.screenshot({
    path: path.join(outDir, `scripture-${width}.png`),
    fullPage: true,
  })

  await page.evaluate(() => document.documentElement.classList.add('dark'))
  await page.locator('#pass-am > summary').click()
  const darkOverflow = await page.evaluate(() => {
    const de = document.documentElement
    return de.scrollWidth > de.clientWidth + 2
  })
  assert.equal(darkOverflow, false, `${width}px dark overflow`)
  await page.screenshot({
    path: path.join(outDir, `scripture-${width}-dark.png`),
    fullPage: true,
  })
}

async function main() {
  const browser = await chromium.launch()
  const page = await browser.newPage()
  try {
    for (const width of widths) {
      await checkViewport(page, width)
      console.log(`ok ${width}px`)
    }
  } finally {
    await browser.close()
  }
  console.log('test-search-buddy-scripture-ui: ok')
  console.log('screenshots:', outDir)
}

main().catch((err) => {
  console.error(err)
  process.exit(1)
})
