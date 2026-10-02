import { chromium } from 'playwright'
import path from 'node:path'
import fs from 'node:fs'

const OUT = 'tmp-qa-screens'
fs.mkdirSync(OUT, { recursive: true })
const browser = await chromium.launch({ headless: true })
const page = await browser.newPage({ viewport: { width: 390, height: 844 } })

await page.goto('http://127.0.0.1:4174/practice/mezmur/abetu-yehonebenen-asib-egziabher', {
  waitUntil: 'domcontentloaded',
  timeout: 60000,
})
await page.waitForTimeout(4500)

const summaries = page.locator('summary')
const count = await summaries.count()
for (let i = 0; i < count; i += 1) {
  const text = await summaries.nth(i).innerText()
  if (/Loop Practice|loop/i.test(text)) {
    await summaries.nth(i).click()
    break
  }
}
await page.waitForTimeout(600)

const metrics = await page.evaluate(() => {
  const bar = document.querySelector('[aria-label="Playback controls"]')
  const rect = bar?.getBoundingClientRect()
  const partTitles = [...document.querySelectorAll('[class*="partTitle"]')].map((el) =>
    el.textContent?.trim(),
  )
  const body = document.body.innerText
  const rec = [...document.querySelectorAll('button')].filter((b) =>
    /With lyrics|From memory/i.test(b.textContent || ''),
  )
  return {
    stickyH: rect?.height ?? null,
    stickyClearance: rect ? Math.round(window.innerHeight - rect.top) : null,
    parts: partTitles,
    hasAdvancedLead: /choose where my loop starts and ends/i.test(body),
    hasPartHint: /Three practice parts/i.test(body),
    recording: rec.map((b) => ({
      text: b.textContent?.trim(),
      w: Math.round(b.getBoundingClientRect().width),
      overflow: b.scrollWidth > b.clientWidth + 1,
    })),
  }
})

console.log(JSON.stringify(metrics, null, 2))
await page.screenshot({ path: path.join(OUT, 'mezmur-player-390.png') })

const more = page.getByRole('button', { name: /Volume|speed|Less/i })
if ((await more.count()) > 0) {
  await more.first().click()
  await page.waitForTimeout(350)
  const expandedH = await page.evaluate(() => {
    const bar = document.querySelector('[aria-label="Playback controls"]')
    return bar?.getBoundingClientRect().height ?? null
  })
  console.log('expandedH', expandedH)
  await page.screenshot({ path: path.join(OUT, 'mezmur-player-expanded-390.png') })
}

// Prayer guide contents clearance if a guide exists
await page.goto('http://127.0.0.1:4174/pray/learn-how-to-pray', {
  waitUntil: 'domcontentloaded',
  timeout: 60000,
})
await page.waitForTimeout(2000)
const guide = await page.evaluate(() => {
  const btn = document.querySelector('button[class*="contentsBtn"], button')
  const contents = [...document.querySelectorAll('button')].find((b) =>
    /Contents/i.test(b.textContent || ''),
  )
  const r = contents?.getBoundingClientRect()
  return {
    hasContents: Boolean(contents),
    bottom: r ? Math.round(window.innerHeight - r.bottom) : null,
    height: r?.height ?? null,
  }
})
console.log('guide', guide)
await page.screenshot({ path: path.join(OUT, 'prayer-guide-390.png') })

await browser.close()
