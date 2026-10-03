import { chromium } from 'playwright'

const browser = await chromium.launch({ headless: true })
const page = await browser.newPage({ viewport: { width: 390, height: 844 } })
await page.goto('http://127.0.0.1:4180/', { waitUntil: 'domcontentloaded' })
await page.getByRole('button', { name: /find something/i }).click()
const dialog = page.getByRole('dialog')
await dialog.getByRole('textbox').fill('Find Meskel hymns')
await dialog.locator('form button[type="submit"]').click()
await page.waitForTimeout(1500)
await page.screenshot({ path: 'tmp/search-buddy-verify/after-meskel-results-390.png' })
console.log('seeMore', await dialog.getByRole('button', { name: /see more/i }).count())

await dialog.getByRole('textbox').fill('show English ones')
await dialog.locator('form button[type="submit"]').click()
await page.waitForTimeout(1500)
console.log(
  'followUpTitles',
  (await dialog.locator('h3').allTextContents()).slice(0, 5),
)
await page.screenshot({ path: 'tmp/search-buddy-verify/after-followup-english-390.png' })

await page.keyboard.press('Escape')
await page.getByRole('button', { name: 'አማርኛ' }).click()
await page.waitForTimeout(300)
await page.getByRole('button', { name: 'አግኝ' }).click()
await page.screenshot({ path: 'tmp/search-buddy-verify/after-amharic-ui-390.png' })
await browser.close()
console.log('ok')
