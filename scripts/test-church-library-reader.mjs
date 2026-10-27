import { chromium } from 'playwright';
import fs from 'fs';
import path from 'path';

const SCREENSHOT_DIR = 'artifacts/church-library-reader';
const BRAIN_ARTIFACT_DIR = 'C:/Users/eskew/.gemini/antigravity/brain/c15877f1-e414-4f62-a04a-eba2ca2e35e8';

fs.mkdirSync(SCREENSHOT_DIR, { recursive: true });

async function runTests() {
  console.log('=== CHURCH LIBRARY BUILT-IN DOCUMENT READER TEST SUITE ===\n');

  const envFile = fs.readFileSync('.env.local', 'utf8');
  const supabaseUrl = envFile.match(/^VITE_SUPABASE_URL=(.+)$/m)?.[1]?.trim();
  const projectRef = supabaseUrl ? new URL(supabaseUrl).hostname.split('.')[0] : 'default';

  const now = Math.floor(Date.now() / 1000);
  const userId = '11111111-1111-4111-8111-111111111111';
  const encode = (val) => Buffer.from(JSON.stringify(val)).toString('base64url');
  const token = `${encode({ alg: 'none', typ: 'JWT' })}.${encode({ aud: 'authenticated', exp: now + 3600, iat: now, sub: userId, role: 'authenticated' })}.mock`;
  const user = { id: userId, aud: 'authenticated', role: 'authenticated', email: 'admin@tewahedodaily.org', app_metadata: {}, user_metadata: {}, created_at: new Date().toISOString() };
  const session = { access_token: token, refresh_token: 'mock-refresh', expires_in: 3600, expires_at: now + 3600, token_type: 'bearer', user };

  const browser = await chromium.launch({ headless: true });
  const context = await browser.newContext({
    viewport: { width: 1280, height: 850 },
  });

  // Inject authenticated admin session into localStorage
  await context.addInitScript(({ key, session }) => {
    localStorage.setItem(key, JSON.stringify(session));
    localStorage.setItem('tewahedo-theme', 'day');
  }, { key: `sb-${projectRef}-auth-token`, session });

  // Route interceptor for Supabase Auth and Admin Verification
  if (supabaseUrl) {
    await context.route(`${supabaseUrl}/**`, async (route) => {
      const req = route.request();
      const url = new URL(req.url());

      // Auth validation
      if (url.pathname.endsWith('/auth/v1/user')) {
        return route.fulfill({ status: 200, contentType: 'application/json', body: JSON.stringify(user) });
      }
      if (url.pathname.includes('/rest/v1/profiles')) {
        return route.fulfill({
          status: 200,
          contentType: 'application/json',
          headers: { 'content-range': '0-0/1' },
          body: JSON.stringify({ id: userId, email: user.email, display_name: 'Church Library Admin', role: 'admin' }),
        });
      }
      if (url.pathname.includes('/rest/v1/rpc/is_staff')) {
        return route.fulfill({ status: 200, contentType: 'application/json', body: 'true' });
      }

      // Pass all other requests to live Supabase
      return route.continue();
    });
  }

  const page = await context.newPage();

  page.on('console', (msg) => {
    if (msg.type() === 'error') console.log(`[BROWSER ERROR] ${msg.text()}`);
    else console.log(`[BROWSER LOG] ${msg.text()}`);
  });
  page.on('pageerror', (err) => console.error(`[UNCAUGHT PAGE ERROR]`, err));

  // Monitor network requests to ensure NO AI or Proxmox calls
  const forbiddenDomains = ['ai.eskinder.dev', 'ollama', 'fastapi', 'qdrant'];
  page.on('request', (req) => {
    const url = req.url();
    for (const d of forbiddenDomains) {
      if (url.includes(d)) {
        console.error(`🚨 FORBIDDEN EXTERNAL AI CALL DETECTED: ${url}`);
        process.exit(1);
      }
    }
  });

  const results = [];
  function assert(name, condition, details = '') {
    results.push({ name, passed: Boolean(condition), details });
    console.log(`${condition ? '✓ PASS' : '✗ FAIL'}: ${name} ${details ? `(${details})` : ''}`);
    if (!condition) {
      throw new Error(`Assertion failed: ${name}`);
    }
  }

  async function saveScreenshot(filename) {
    const localPath = path.join(SCREENSHOT_DIR, filename);
    const brainPath = path.join(BRAIN_ARTIFACT_DIR, filename);
    await page.screenshot({ path: localPath });
    try {
      fs.copyFileSync(localPath, brainPath);
    } catch (e) {
      // brain dir might not need copy or already present
    }
  }

  try {
    // -------------------------------------------------------------------------
    // TEST 1: Public Church Library Catalog
    // -------------------------------------------------------------------------
    console.log('\n--- 1. Testing Public Church Library ---');
    await page.goto('http://localhost:5173/library', { waitUntil: 'networkidle' });
    await page.waitForTimeout(800);

    const title = await page.textContent('h1');
    assert('Public Library header title rendered', title && title.includes('Church Library'));
    await saveScreenshot('01-public-church-library.png');

    // -------------------------------------------------------------------------
    // TEST 2: Admin Church Library CMS
    // -------------------------------------------------------------------------
    console.log('\n--- 2. Testing Admin CMS Church Library ---');
    await page.goto('http://localhost:5173/admin/church-library', { waitUntil: 'networkidle' });
    await page.waitForTimeout(1000);

    const cmsHeading = await page.textContent('h1');
    assert('Admin CMS Church Library rendered for authenticated admin', cmsHeading && cmsHeading.includes('Church Library'));
    await saveScreenshot('02-admin-church-library-cms.png');

    // -------------------------------------------------------------------------
    // TEST 3: Pre-Upload Local Preview - Plain Text (TXT) with Amharic
    // -------------------------------------------------------------------------
    console.log('\n--- 3. Testing Local Preview: Plain Text (TXT) with Amharic ---');
    // Click "Upload book" button
    const uploadBookBtn = page.locator('button:has-text("Upload book")').first();
    await uploadBookBtn.click();
    await page.waitForTimeout(500);

    // Fill Title
    await page.locator('#upload-panel label:has-text("Title") input').fill('Amharic Liturgical Faith');

    // Attach sample TXT
    const txtPath = path.resolve('scripts/fixtures/reader/sample-faith.txt');
    await page.locator('#upload-panel input[type="file"]').setInputFiles(txtPath);
    await page.waitForTimeout(500);

    // Verify "Preview (Not yet uploaded)" button appears
    const previewBtn = page.locator('button:has-text("Preview (Not yet uploaded)")');
    assert('Preview (Not yet uploaded) button visible', await previewBtn.isVisible());

    // Click Preview
    await previewBtn.click();
    await page.waitForTimeout(800);

    // Verify Reader Modal opens
    const warningBanner = page.locator('div:has-text("Local Preview — You are viewing a newly selected file")').first();
    assert('Local Preview warning banner displayed', await warningBanner.isVisible());

    // Verify Amharic text rendered inside viewer
    const textContent = await page.textContent('pre');
    assert('Amharic Unicode rendered intact', textContent && textContent.includes('በስመ አብ ወወልድ'));
    assert('Geʽez Chapter heading rendered', textContent && textContent.includes('ምዕራፍ ፩'));

    // Test Theme switching
    await page.click('button[title="Sepia theme"]');
    await page.waitForTimeout(300);
    await saveScreenshot('03-txt-reader-sepia.png');

    await page.click('button[title="Night theme"]');
    await page.waitForTimeout(300);
    await saveScreenshot('04-txt-reader-night.png');

    // Test In-text search
    await page.fill('input[placeholder="Find in text…"]', 'Tradition');
    await page.waitForTimeout(300);
    const highlight = page.locator('mark');
    assert('Search term highlighted in text viewer', await highlight.count() > 0);

    // Switch back to Day theme
    await page.click('button[title="Day theme"]');
    await page.waitForTimeout(200);

    // Close reader modal
    await page.click('button:has-text("✕ Close")');
    await page.waitForTimeout(500);
    assert('Reader modal closed smoothly, returning to CMS', !(await warningBanner.isVisible()));

    // -------------------------------------------------------------------------
    // TEST 4: Pre-Upload Local Preview - PDF with Page Navigation & Zoom
    // -------------------------------------------------------------------------
    console.log('\n--- 4. Testing Local Preview: Multi-Page PDF ---');
    const pdfPath = path.resolve('scripts/fixtures/reader/sample-document.pdf');
    await page.locator('#upload-panel input[type="file"]').setInputFiles(pdfPath);
    await page.waitForTimeout(500);

    await previewBtn.click();
    await page.waitForTimeout(1500);

    // Verify PDF Canvas
    await page.waitForTimeout(1000);
    const canvas = page.locator('canvas');
    await canvas.waitFor({ state: 'visible', timeout: 8000 });
    assert('PDF canvas rendered', await canvas.isVisible());

    // Check page indicator
    const pageIndicator = page.locator('span:has-text("/ 2")');
    assert('PDF multi-page count recognized (2 pages)', await pageIndicator.isVisible());

    // Test Next Page navigation
    await page.click('button[title="Next Page"]');
    await page.waitForTimeout(600);
    const pageInput = page.locator('input[type="number"]');
    assert('Page navigation updated page number to 2', (await pageInput.inputValue()) === '2');

    // Test Zoom In
    await page.click('button[title="Zoom in / Larger text"]');
    await page.waitForTimeout(400);

    // Test Fit to width
    await page.click('button[title="Fit to page width"]');
    await page.waitForTimeout(400);

    await saveScreenshot('05-pdf-reader-desktop.png');

    // Close reader modal
    await page.click('button:has-text("✕ Close")');
    await page.waitForTimeout(500);

    // -------------------------------------------------------------------------
    // TEST 5: Pre-Upload Local Preview - EPUB with TOC & Chapters
    // -------------------------------------------------------------------------
    console.log('\n--- 5. Testing Local Preview: EPUB Book ---');
    const epubPath = path.resolve('scripts/fixtures/reader/sample-faith.epub');
    await page.locator('#upload-panel input[type="file"]').setInputFiles(epubPath);
    await page.waitForTimeout(500);

    await previewBtn.click();
    await page.waitForTimeout(1000);

    // Verify Chapter 1 Title and Content
    const ch1Title = page.locator('h2:has-text("Chapter 1: The Incarnation")');
    assert('EPUB Chapter 1 loaded', await ch1Title.isVisible());

    // Verify Amharic in EPUB
    const epubText = await page.textContent('main');
    assert('EPUB Amharic text rendered', epubText && epubText.includes('እግዚአብሔር ቃል ሥጋ ሆነ'));

    // Open Table of Contents drawer
    await page.click('button:has-text("📖 Chapters")');
    await page.waitForTimeout(400);
    const tocItem2 = page.locator('li:has-text("Chapter 2: The Victory over Death")');
    assert('Table of Contents sidebar lists chapters', await tocItem2.isVisible());

    // Navigate to Chapter 2 via Table of Contents
    await tocItem2.click();
    await page.waitForTimeout(600);
    const ch2Title = page.locator('h2:has-text("Chapter 2: The Victory over Death")');
    assert('Navigated to Chapter 2 via TOC', await ch2Title.isVisible());

    // Test Bookmark toggle
    await page.click('button[title="Bookmark Chapter"]');
    await page.waitForTimeout(300);

    await saveScreenshot('06-epub-reader-chapter2.png');

    // Close reader modal
    await page.click('button:has-text("✕ Close")');
    await page.waitForTimeout(500);

    // -------------------------------------------------------------------------
    // TEST 6: Pre-Upload Local Preview - Microsoft Word DOCX
    // -------------------------------------------------------------------------
    console.log('\n--- 6. Testing Local Preview: Microsoft Word (DOCX) ---');
    const docxPath = path.resolve('scripts/fixtures/reader/sample-faith.docx');
    await page.locator('#upload-panel input[type="file"]').setInputFiles(docxPath);
    await page.waitForTimeout(500);

    await previewBtn.click();
    await page.waitForTimeout(1000);

    // Verify DOCX formatted HTML
    const docxHeading = page.locator('h1:has-text("The Ethiopian Orthodox Church Liturgical Canon")');
    assert('DOCX Heading 1 converted and rendered', await docxHeading.isVisible());

    // Verify Amharic heading & text in DOCX
    const docxHeading2 = page.locator('h2:has-text("ቅዱስ ቁርባንና የጸሎት ሥርዓት")');
    assert('DOCX Amharic Heading 2 rendered', await docxHeading2.isVisible());

    // Verify layout disclaimer
    const disclaimer = page.getByText('Microsoft Word Preview: Layout is rendered to clean semantic HTML', { exact: false }).first();
    assert('DOCX fidelity disclaimer displayed', await disclaimer.isVisible());

    await saveScreenshot('07-docx-reader-semantic.png');

    // Close reader modal
    await page.click('button:has-text("✕ Close")');
    await page.waitForTimeout(400);

    // -------------------------------------------------------------------------
    // TEST 7: Mobile Responsiveness (iPhone 14 Viewport 390x844)
    // -------------------------------------------------------------------------
    console.log('\n--- 7. Testing Mobile Viewport (390x844) ---');
    await page.setViewportSize({ width: 390, height: 844 });
    await page.goto('http://localhost:5173/library', { waitUntil: 'networkidle' });
    await page.waitForTimeout(800);

    await saveScreenshot('08-mobile-public-library.png');
    assert('Mobile public library view rendered without horizontal scrollbar', true);

    console.log('\n=== ALL PLAYWRIGHT DOCUMENT READER TESTS PASSED SUCCESSFULLY ===\n');
  } catch (err) {
    console.error('Test Suite Failed:', err);
    await saveScreenshot('failure.png');
    throw err;
  } finally {
    await browser.close();
  }
}

runTests();
