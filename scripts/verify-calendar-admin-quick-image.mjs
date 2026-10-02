/**
 * Verify CalendarAdmin named import of CalendarCardQuickImageModal
 * and that Calendar Cards page can load + open the quick image modal.
 */
import { chromium } from 'playwright'
import { createServer } from 'vite'

process.env.VITE_SUPABASE_URL = 'https://cal-admin-test.supabase.co'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'sb_publishable_test_only'

const server = await createServer({
  server: { host: '127.0.0.1', port: 4191, strictPort: true },
})
await server.listen()

const browser = await chromium.launch()
const page = await browser.newPage()
const errors = []
page.on('pageerror', (e) => errors.push(e.message))
page.on('console', (m) => {
  if (m.type() === 'error') errors.push(m.text())
})

const user = {
  id: '11111111-1111-1111-1111-111111111111',
  email: 'admin@example.invalid',
  aud: 'authenticated',
  role: 'authenticated',
  app_metadata: {},
  user_metadata: {},
  created_at: new Date().toISOString(),
}
const token = [
  Buffer.from('{"alg":"HS256","typ":"JWT"}').toString('base64url'),
  Buffer.from(
    JSON.stringify({
      sub: user.id,
      exp: Math.floor(Date.now() / 1000) + 3600,
      role: 'authenticated',
    }),
  ).toString('base64url'),
  'mock',
].join('.')

const card = {
  id: 'cccccccc-cccc-cccc-cccc-cccccccccccc',
  slug: 'bisrate-gabriel',
  title: 'Bisrate Gabriel',
  title_amharic: 'ብስራተ ገብርኤል',
  summary: 'Test',
  category: 'feast',
  card_type: 'major_feast',
  status: 'published',
  sort_order: 1,
  image_path: null,
  image_alt: null,
  image_position: 'center',
  source_type: 'feast',
  source_id: null,
  source_slug: 'bisrate-gabriel',
  ethiopian_month_number: 1,
  ethiopian_day: 22,
  is_monthly: false,
  created_at: new Date().toISOString(),
  updated_at: new Date().toISOString(),
}

await page.route('https://cal-admin-test.supabase.co/**', async (route) => {
  const req = route.request()
  const url = new URL(req.url())
  let body = /** @type {unknown} */ ({})
  const status = 200
  if (url.pathname === '/auth/v1/token') {
    body = {
      access_token: token,
      refresh_token: 'r',
      expires_in: 3600,
      token_type: 'bearer',
      user,
    }
  } else if (url.pathname === '/auth/v1/user') body = user
  else if (url.pathname === '/rest/v1/profiles') {
    body = { id: user.id, email: user.email, display_name: 'Admin', role: 'admin' }
  } else if (url.pathname === '/rest/v1/calendar_cards') {
    if (req.method() === 'GET') body = [card]
    else if (req.method() === 'PATCH' || req.method() === 'POST') {
      body = {
        ...card,
        image_path: 'calendar/test.webp',
        image_alt: 'alt',
        updated_at: new Date().toISOString(),
      }
    } else body = []
  } else if (url.pathname.startsWith('/rest/v1/')) body = []
  else if (url.pathname.startsWith('/storage/v1/')) {
    body = { signedURL: '/object/sign/x?token=t' }
  } else body = {}
  /** @type {Record<string, string>} */
  const headers = { 'content-type': 'application/json' }
  if (url.pathname === '/rest/v1/calendar_cards' && req.method() === 'GET') {
    headers['content-range'] = '0-0/1'
  }
  await route.fulfill({
    status,
    headers,
    body: JSON.stringify(body),
  })
})

try {
  // Prove named export resolves the same way CalendarAdmin imports it.
  await page.goto('http://127.0.0.1:4191/admin/login', { waitUntil: 'networkidle' })
  const named = await page.evaluate(async () => {
    const mod = await import('/src/components/calendar/CalendarCardQuickImageModal.tsx')
    return {
      keys: Object.keys(mod),
      namedType: typeof mod.CalendarCardQuickImageModal,
      defaultType: typeof mod.default,
    }
  })
  console.log('moduleExports', named)

  await page.getByLabel(/email/i).fill(user.email)
  await page.getByLabel(/password/i).fill('password')
  await page.getByRole('button', { name: /sign in/i }).click()
  await page.waitForTimeout(1200)

  await page.goto('http://127.0.0.1:4191/admin/calendar/cards', {
    waitUntil: 'networkidle',
  })
  await page.waitForTimeout(1500)

  const exportCrash = errors.some((e) =>
    /CalendarCardQuickImageModal|does not provide an export/i.test(e),
  )
  const bodyText = await page.evaluate(() => document.body.innerText.slice(0, 1000))
  const hasCrashUI = /does not provide an export|Unexpected Application Error/i.test(bodyText)
  console.log(
    JSON.stringify(
      {
        url: page.url(),
        exportCrash,
        hasCrashUI,
        errors: errors.slice(0, 10),
        bodyPreview: bodyText.slice(0, 500),
      },
      null,
      2,
    ),
  )

  if (exportCrash || hasCrashUI) {
    throw new Error('Calendar Cards page crashed on CalendarCardQuickImageModal export')
  }

  await page.getByRole('button', { name: /^(Add Image|Change Image)$/i }).first().click()
  await page.waitForTimeout(500)
  const dialog = page.getByRole('dialog', { name: /edit calendar image/i })
  const dialogCount = await dialog.count()
  console.log('dialogCount', dialogCount)
  if (!dialogCount) throw new Error('Quick image modal did not open')
  const picker = await page.getByText(/select or upload image/i).count()
  console.log('mediaPickerVisible', picker > 0)
  if (!picker) throw new Error('MediaPicker label not visible in modal')
  await page.getByRole('button', { name: /^Close$/i }).first().click()
  await page.waitForTimeout(300)
  console.log('dialogClosed', (await dialog.count()) === 0)

  console.log('Calendar Admin QuickImage verification OK')
} finally {
  await browser.close()
  await server.close()
}
