import { mkdirSync, readFileSync } from 'node:fs'
import { fileURLToPath } from 'node:url'
import { join } from 'node:path'
import { chromium } from 'playwright'

const base = process.env.BASE_URL ?? 'http://127.0.0.1:4173'
const out = fileURLToPath(new URL('../artifacts/mezmur-admin-redesign/', import.meta.url))
const env = readFileSync(new URL('../.env.local', import.meta.url), 'utf8')
const supabaseUrl = env.match(/^VITE_SUPABASE_URL=(.+)$/m)?.[1]?.trim()
if (!supabaseUrl) throw new Error('VITE_SUPABASE_URL is required for the local mocked admin capture.')
const projectRef = new URL(supabaseUrl).hostname.split('.')[0]
const now = Math.floor(Date.now() / 1000)
const userId = '11111111-1111-4111-8111-111111111111'
const encode = (value) => Buffer.from(JSON.stringify(value)).toString('base64url')
const token = `${encode({ alg: 'none', typ: 'JWT' })}.${encode({ aud: 'authenticated', exp: now + 3600, iat: now, sub: userId, role: 'authenticated' })}.mock`
const user = { id: userId, aud: 'authenticated', role: 'authenticated', email: 'editor@example.test', app_metadata: {}, user_metadata: {}, created_at: new Date().toISOString() }
const session = { access_token: token, refresh_token: 'mock-refresh', expires_in: 3600, expires_at: now + 3600, token_type: 'bearer', user }

const mezmur = {
  mezmur_id: 'demo-mezmur', slug: 'kidane-mihret-demo', title: 'Kidane Mihret', title_amharic: 'ኪዳነ ምሕረት', title_english: null,
  description: 'A hymn prepared for the covenant of mercy observance.', description_amharic: null,
  lyrics_amharic: 'ኪዳነ ምሕረት እመቤታችን\nበጸሎትሽ አስቢን\n\nወደ ልጅሽ አቅርቢን',
  lyrics_transliteration: 'Kidane Mihret emebetachin\nBe-tselotish asibin', lyrics_english: 'Covenant of Mercy, remember us in prayer.', lyrics_geez: null, lyrics_oromo: null,
  primary_language: 'amharic', form: 'mezmur', singer_id: 'zemari-1', singer_slug: 'zemari-demo', singer_name: 'Demo Zemari', zemari_id: 'zemari-1',
  youtube_url: null, audio_url: null, image_path: null, image_alt: null, legacy_thumbnail_url: null, search_keywords: 'mercy|mary',
  status: 'draft', review_status: null, review_notes: null, source_url: null, source_notes: null,
  created_at: new Date().toISOString(), updated_at: new Date().toISOString(),
}

function rowsFor(pathname) {
  if (pathname.endsWith('/profiles')) return { id: userId, display_name: 'Local Editor', role: 'admin', created_at: new Date().toISOString(), updated_at: new Date().toISOString() }
  if (pathname.endsWith('/mezmur_data_import')) return [mezmur]
  if (pathname.endsWith('/mezmur_category_links_import')) return [{ category_slug: 'marian' }, { category_slug: 'worship' }]
  if (pathname.endsWith('/mezmur_occasion_links_import')) return [{ occasion_slug: 'kidane-mihret' }, { occasion_slug: 'general-anytime' }]
  if (pathname.endsWith('/mezmur_sections_import')) return [
    { section_id: 'section-1', section_slug: 'kidane-mihret', collection_slug: 'occasions', parent_section_slug: null, title: 'Kidane Mihret', title_amharic: 'ኪዳነ ምሕረት', description: null, description_amharic: null, image_path: null, image_alt: null, section_type: 'occasion', source_entity_type: null, source_entity_slug: null, sort_order: '10', is_featured: 'true', status: 'published' },
    { section_id: 'section-2', section_slug: 'marian-hymns', collection_slug: 'themes', parent_section_slug: null, title: 'Marian hymns', title_amharic: null, description: null, description_amharic: null, image_path: null, image_alt: null, section_type: 'theme', source_entity_type: null, source_entity_slug: null, sort_order: '20', is_featured: 'false', status: 'published' },
  ]
  if (pathname.endsWith('/mezmur_section_links_import')) return [{ mezmur_slug: mezmur.slug, section_slug: 'kidane-mihret', sort_order: '10', is_primary: 'true' }]
  if (pathname.endsWith('/zemaris_with_counts') || pathname.endsWith('/zemaris')) return [{ id: 'zemari-1', slug: 'zemari-demo', name: 'Demo Zemari', name_amharic: 'ዘማሪ', bio: null, image_path: null, image_alt: null, status: 'published', sort_order: 10, mezmur_count: 1 }]
  if (pathname.endsWith('/tags')) return [{ id: 'tag-1', name: 'Marian', slug: 'marian' }]
  if (pathname.endsWith('/content_versions')) return []
  return []
}

mkdirSync(out, { recursive: true })
const browser = await chromium.launch()
for (const view of [
  { name: 'desktop', width: 1440, height: 900, theme: 'day' },
  { name: 'tablet-night', width: 768, height: 900, theme: 'night' },
  { name: 'mobile-night', width: 390, height: 844, theme: 'night' },
]) {
  const context = await browser.newContext({ viewport: { width: view.width, height: view.height }, reducedMotion: 'reduce' })
  await context.addInitScript(({ key, session, theme }) => {
    localStorage.setItem(key, JSON.stringify(session))
    localStorage.setItem('tewahedo-theme', theme)
  }, { key: `sb-${projectRef}-auth-token`, session, theme: view.theme })
  await context.route(`${supabaseUrl}/**`, async (route) => {
    const request = route.request()
    const url = new URL(request.url())
    if (url.pathname.endsWith('/auth/v1/user')) return route.fulfill({ status: 200, contentType: 'application/json', body: JSON.stringify(user) })
    if (url.pathname.includes('/rest/v1/')) {
      const data = rowsFor(url.pathname)
      const wantsObject = request.headers().accept?.includes('application/vnd.pgrst.object')
      const body = wantsObject && Array.isArray(data) ? (data[0] ?? null) : data
      return route.fulfill({ status: 200, contentType: 'application/json', headers: { 'content-range': '0-0/1' }, body: JSON.stringify(body) })
    }
    return route.fulfill({ status: 200, contentType: 'application/json', body: '{}' })
  })
  const page = await context.newPage()
  await page.goto(`${base}/admin/hymns/mezmur/demo-mezmur/edit`, { waitUntil: 'networkidle', timeout: 60000 })
  await page.getByRole('heading', { name: 'Edit Mezmur' }).waitFor({ timeout: 15000 })
  await page.getByRole('button', { name: 'Expand editor' }).click()
  await page.getByRole('dialog', { name: /Edit Amharic lyrics/ }).waitFor()
  await page.screenshot({ path: join(out, `admin-${view.name}-${view.width}x${view.height}.png`), fullPage: false })
  await page.getByRole('button', { name: 'Close dialog' }).click()
  await page.getByText('Advanced: hymn sections').scrollIntoViewIfNeeded()
  await page.getByRole('combobox', { name: 'Occasions' }).click()
  await page.screenshot({ path: join(out, `admin-classification-${view.name}-${view.width}x${view.height}.png`), fullPage: false })
  const overflow = await page.evaluate(() => ({
    page: document.documentElement.scrollWidth,
    viewport: window.innerWidth,
    offenders: [...document.querySelectorAll('body *')]
      .map((element) => ({ name: `${element.tagName}#${element.id}.${element.className}`, type: element.getAttribute('type'), placeholder: element.getAttribute('placeholder'), parent: element.parentElement?.tagName, right: Math.round(element.getBoundingClientRect().right), width: Math.round(element.getBoundingClientRect().width) }))
      .filter((item) => item.right > window.innerWidth + 1)
      .slice(0, 5),
  }))
  if (overflow.page > overflow.viewport + 1) throw new Error(`${view.name} editor overflow ${JSON.stringify(overflow)}`)
  console.log(`captured mocked local admin ${view.name}`)
  await context.close()
}
await browser.close()
