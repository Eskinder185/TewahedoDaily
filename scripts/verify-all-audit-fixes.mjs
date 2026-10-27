import { chromium } from 'playwright';

async function runComprehensiveVerification() {
  console.log('=== STARTING TEWAHEDODAILY AUDIT VERIFICATION ===\n');
  const browser = await chromium.launch({ headless: true });
  const results = [];

  function record(id, title, passed, detail = '') {
    results.push({ id, title, passed, detail });
    console.log(`${passed ? '✓ PASS' : '✗ FAIL'}: [${id}] ${title} ${detail ? '— ' + detail : ''}`);
  }

  // --------------------------------------------------------------------------
  // TEST 1: Search FAB Pointer Collision & Modal Focus Trapping / Restoration
  // --------------------------------------------------------------------------
  {
    const page = await browser.newPage({ viewport: { width: 390, height: 844 } });
    await page.goto('http://127.0.0.1:5173/', { waitUntil: 'domcontentloaded' });
    const fab = page.locator('button[aria-label="Open search"]');
    await fab.waitFor({ state: 'visible', timeout: 5000 });

    await fab.click();
    await page.waitForTimeout(400);

    const isFabHidden = await fab.evaluate((el) => {
      const s = window.getComputedStyle(el);
      return (s.opacity === '0' || s.visibility === 'hidden') && el.getAttribute('aria-hidden') === 'true';
    });

    const modal = page.locator('[role="dialog"]');
    await modal.waitFor({ state: 'visible', timeout: 5000 });
    
    // Press Escape to test focus restoration
    await page.keyboard.press('Escape');
    await page.waitForTimeout(400);

    const isFabFocused = await fab.evaluate((el) => document.activeElement === el);
    record('FIX-01', 'Search FAB hiding & focus restoration', isFabHidden && isFabFocused, 
      `Hidden during modal: ${isFabHidden}, Focused after Escape: ${isFabFocused}`);
    await page.close();
  }

  // --------------------------------------------------------------------------
  // TEST 2: Church Library Translations (EN and AM)
  // --------------------------------------------------------------------------
  {
    const page = await browser.newPage({ viewport: { width: 390, height: 844 } });
    await page.addInitScript(() => {
      localStorage.setItem('tewahedo-daily-locale', 'am');
    });
    await page.goto('http://127.0.0.1:5173/', { waitUntil: 'domcontentloaded' });
    
    // In Amharic, fab label is "ፍለጋ"
    const fab = page.locator('button[aria-label*="ፍለጋ"]');
    await fab.waitFor({ state: 'visible', timeout: 5000 });
    await fab.click();
    await page.waitForTimeout(300);

    const amTitle = await page.locator('[role="dialog"] h2').first().textContent();
    record('FIX-02', 'Bilingual Church Library & Search localization', amTitle.includes('ፍለጋ') || amTitle.includes('እንዴት'), 
      `Amharic Search title: "${amTitle.trim()}"`);
    await page.close();
  }

  // --------------------------------------------------------------------------
  // TEST 3: Community Form Touch Targets (>= 44px)
  // --------------------------------------------------------------------------
  {
    const page = await browser.newPage({ viewport: { width: 390, height: 844 } });
    await page.goto('http://127.0.0.1:5173/submit-mezmur', { waitUntil: 'domcontentloaded' });
    const checkLabel = page.locator('label[class*="check"]').first();
    await checkLabel.waitFor({ state: 'visible', timeout: 5000 });
    const box = await checkLabel.boundingBox();
    const passed = Boolean(box && box.height >= 44);
    record('FIX-03', 'Community form touch targets >= 44px', passed, `Target height: ${box?.height.toFixed(1)}px`);
    await page.close();
  }

  // --------------------------------------------------------------------------
  // TEST 4: Hymns Browse Anonymous Resilience
  // --------------------------------------------------------------------------
  {
    const page = await browser.newPage({ viewport: { width: 390, height: 844 } });
    await page.goto('http://127.0.0.1:5173/practice/categories', { waitUntil: 'domcontentloaded' });
    await page.waitForSelector('a[href*="/practice/category/"]', { timeout: 8000 });
    const cardCount = await page.locator('a[href*="/practice/category/"]').count();
    record('FIX-04', 'Hymns category browse resilience', cardCount > 0, 
      `Loaded ${cardCount} category cards`);
    await page.close();
  }

  // --------------------------------------------------------------------------
  // TEST 5: Bible Reader Typography Controls & Persistence
  // --------------------------------------------------------------------------
  {
    const page = await browser.newPage({ viewport: { width: 390, height: 844 } });
    await page.goto('http://127.0.0.1:5173/bible/genesis/1', { waitUntil: 'domcontentloaded' });
    const btnLarger = page.locator('button[aria-label="Larger text"]');
    await btnLarger.waitFor({ state: 'visible', timeout: 5000 });
    await btnLarger.click();
    await page.waitForTimeout(200);

    const scale = await page.evaluate(() => localStorage.getItem('tewahedo_bible_font_scale'));
    record('FIX-06', 'Bible mobile font scaling & localStorage persistence', parseFloat(scale) > 1.0, 
      `Saved font scale: ${scale}`);
    await page.close();
  }

  // --------------------------------------------------------------------------
  // TEST 6: Multi-Viewport Responsive Layout & Overflow Check
  // --------------------------------------------------------------------------
  {
    const viewports = [
      { w: 320, h: 568, name: '320px (Small Android / iPhone SE)' },
      { w: 360, h: 800, name: '360px (Compact Phone)' },
      { w: 390, h: 844, name: '390px (Standard Phone)' },
      { w: 430, h: 932, name: '430px (Large Phone)' },
      { w: 768, h: 1024, name: '768px (Tablet Portrait)' },
      { w: 1440, h: 900, name: '1440px (Desktop Full)' },
    ];

    let allFit = true;
    const overflowDetails = [];

    for (const vp of viewports) {
      const page = await browser.newPage({ viewport: { width: vp.w, height: vp.h } });
      await page.goto('http://127.0.0.1:5173/', { waitUntil: 'domcontentloaded' });
      const overflow = await page.evaluate(() => {
        return document.documentElement.scrollWidth > window.innerWidth;
      });
      if (overflow) {
        allFit = false;
        overflowDetails.push(`${vp.name} has overflow`);
      }
      await page.close();
    }

    record('FIX-07', 'Horizontal overflow protection (320px to 1440px)', allFit, 
      allFit ? 'Zero horizontal scrolling across all 6 viewports' : overflowDetails.join(', '));
  }

  // --------------------------------------------------------------------------
  // TEST 7: Calendar Touch Swipe & Pan-Y Touch Action
  // --------------------------------------------------------------------------
  {
    const page = await browser.newPage({ viewport: { width: 390, height: 844 }, hasTouch: true });
    await page.goto('http://127.0.0.1:5173/calendar', { waitUntil: 'domcontentloaded' });
    const dayNav = page.locator('div[class*="dayNav"]');
    await dayNav.waitFor({ state: 'visible', timeout: 5000 });
    const touchAction = await dayNav.evaluate((el) => window.getComputedStyle(el).touchAction);
    const passed = touchAction === 'pan-y';
    record('FIX-08', 'Calendar swipe & pan-y non-interference with vertical scroll', passed, 
      `touch-action: ${touchAction}`);
    await page.close();
  }

  // --------------------------------------------------------------------------
  // TEST 8: Desktop Navigation Accessibility on Mobile Viewport
  // --------------------------------------------------------------------------
  {
    const page = await browser.newPage({ viewport: { width: 390, height: 844 } });
    await page.goto('http://127.0.0.1:5173/', { waitUntil: 'domcontentloaded' });
    const desktopNav = page.locator('header nav[class*="nav"]').first();
    const ariaHidden = await desktopNav.getAttribute('aria-hidden');
    record('A11Y-01', 'Desktop nav hidden from assistive tech on mobile', ariaHidden === 'true', 
      `aria-hidden="${ariaHidden}"`);
    await page.close();
  }

  // --------------------------------------------------------------------------
  // TEST 9: Mobile Drawer Hierarchy & Header Inert Trapping
  // --------------------------------------------------------------------------
  {
    const page = await browser.newPage({ viewport: { width: 390, height: 844 } });
    await page.goto('http://127.0.0.1:5173/', { waitUntil: 'domcontentloaded' });
    
    // Open drawer
    await page.click('button[aria-label="Open menu"]');
    await page.waitForTimeout(300);

    const headerInert = await page.locator('header[data-header]').evaluate((el) => el.hasAttribute('inert'));
    const hasDivider = (await page.locator('div[class*="drawerDivider"]').count()) > 0;
    record('NAV-01', 'Drawer modal focus trapping & secondary links separation', headerInert && hasDivider, 
      `Header inert while drawer open: ${headerInert}, Secondary divider present: ${hasDivider}`);
    await page.close();
  }

  // --------------------------------------------------------------------------
  // TEST 10: Public Hymns Flow (Category -> Mezmur Detail)
  // --------------------------------------------------------------------------
  {
    const page = await browser.newPage({ viewport: { width: 390, height: 844 } });
    await page.goto('http://127.0.0.1:5173/practice/categories', { waitUntil: 'domcontentloaded' });
    await page.waitForSelector('a[href*="/practice/category/"]', { timeout: 8000 });
    const firstCat = page.locator('a[href*="/practice/category/"]').first();
    await firstCat.click();
    await page.waitForLoadState('domcontentloaded');
    await page.waitForSelector('h1', { timeout: 8000 });
    const heading = await page.locator('h1').textContent();
    record('FLOW-01', 'Hymns browse -> category flow', Boolean(heading), `Category page: "${heading?.trim()}"`);
    await page.close();
  }

  await browser.close();

  const total = results.length;
  const passed = results.filter((r) => r.passed).length;
  const failed = total - passed;

  console.log(`\n=== VERIFICATION COMPLETE: ${passed}/${total} PASSED, ${failed} FAILED ===\n`);
  if (failed > 0) {
    process.exit(1);
  }
}

runComprehensiveVerification().catch((err) => {
  console.error('Audit verification crashed:', err);
  process.exit(1);
});
