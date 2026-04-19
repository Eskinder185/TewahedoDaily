const { chromium, devices } = require('playwright');
const fs = require('fs');
const path = require('path');
(async() => {
  const outDir = path.join(process.cwd(), '.audit-screens', 'ui-audit-2026-04-16');
  fs.mkdirSync(outDir, { recursive: true });
  const routes = [
    ['home', '/'],
    ['practice', '/practice'],
    ['prayers', '/prayers'],
    ['calendar', '/calendar'],
    ['about', '/about'],
    ['zeweter', '/prayers/zeweter'],
    ['wudase', '/prayers/wudase-mariam'],
    ['mezmure', '/prayers/mezmure-dawit'],
    ['yekidane', '/prayers/yekidane-tselot'],
    ['meharene', '/prayers/meharene-ab'],
  ];
  const browser = await chromium.launch({ headless: true });
  const desktop = await browser.newContext({ viewport: { width: 1440, height: 1200 } });
  const mobile = await browser.newContext({ ...devices['iPhone 13'] });
  const summary = [];
  for (const [name, route] of routes) {
    for (const [mode, context] of [['desktop', desktop], ['mobile', mobile]]) {
      if (mode === 'mobile' && !['home','practice','prayers','calendar','yekidane','meharene'].includes(name)) continue;
      const page = await context.newPage();
      await page.goto(`http://127.0.0.1:4173${route}`, { waitUntil: 'networkidle' });
      await page.screenshot({ path: path.join(outDir, `${name}-${mode}.png`), fullPage: true });
      const info = await page.evaluate(() => ({
        title: document.title,
        h1: document.querySelector('h1')?.textContent?.trim() ?? '',
        h2s: Array.from(document.querySelectorAll('h2')).slice(0, 10).map(n => n.textContent?.trim() ?? ''),
        buttons: Array.from(document.querySelectorAll('button')).slice(0, 24).map(n => n.textContent?.trim() ?? ''),
        links: Array.from(document.querySelectorAll('a')).slice(0, 24).map(n => n.textContent?.trim() ?? ''),
        height: document.documentElement.scrollHeight,
      }));
      summary.push({ route, name, mode, ...info });
      await page.close();
    }
  }
  fs.writeFileSync(path.join(outDir, 'summary.json'), JSON.stringify(summary, null, 2));
  await browser.close();
})();
