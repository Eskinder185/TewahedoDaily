import { chromium } from 'playwright';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const fixturePath = path.resolve(__dirname, 'fixtures/test-live-lyrics-presentation.html');
const fixtureUrl = `file://${fixturePath.replace(/\\/g, '/')}`;

async function runTests() {
  console.log('--- Starting Playwright UI Audits for Live Lyrics Presentation Mode ---');
  console.log(`Loading fixture: ${fixtureUrl}`);

  const browser = await chromium.launch({ headless: true });
  const viewports = [
    { name: 'Desktop (1280x800)', width: 1280, height: 800 },
    { name: 'Tablet (768x1024)', width: 768, height: 1024 },
    { name: 'Mobile (375x667)', width: 375, height: 667 }
  ];

  let testsPassed = 0;
  let testsTotal = 0;

  function assert(condition, message) {
    testsTotal++;
    if (condition) {
      console.log(`  PASS: ${message}`);
      testsPassed++;
    } else {
      console.error(`  FAIL: ${message}`);
      throw new Error(`Assertion failed: ${message}`);
    }
  }

  for (const vp of viewports) {
    console.log(`\nTesting viewport: ${vp.name}`);
    const context = await browser.newContext({
      viewport: { width: vp.width, height: vp.height }
    });
    const page = await context.newPage();
    await page.goto(fixtureUrl);

    // 1. Check no horizontal overflow
    const hasHorizontalOverflow = await page.evaluate(() => {
      return document.documentElement.scrollWidth > window.innerWidth ||
             document.body.scrollWidth > window.innerWidth;
    });
    assert(!hasHorizontalOverflow, `No horizontal overflow at ${vp.name}`);

    // 2. Initial state verification: Default is Both mode
    const isBothActive = await page.$eval('#live-mode-both', el => el.classList.contains('liveModeButtonActive'));
    assert(isBothActive, `Default mode is 'Both' (${vp.name})`);

    const bothContainerVisible = await page.$eval('#both-container', el => el.style.display !== 'none');
    assert(bothContainerVisible, `#both-container is visible in Both mode (${vp.name})`);

    const initialCounter = await page.$eval('#slide-counter', el => el.textContent.trim());
    assert(initialCounter === '1 / 5', `Initial slide counter is "1 / 5" (${vp.name})`);

    const origContent = await page.$eval('#live-orig', el => el.textContent.trim());
    assert(origContent.includes('ሰላም ለኪ ማርያም ድንግል'), `Ethiopic lyrics present in Both mode (${vp.name})`);

    const translitContent = await page.$eval('#live-translit', el => el.textContent.trim());
    assert(translitContent.includes('Selam Leki Maryam Dingil'), `Transliteration lyrics present in Both mode (${vp.name})`);

    // 3. Switch to Original mode
    await page.click('#live-mode-original');
    const isOrigActive = await page.$eval('#live-mode-original', el => el.classList.contains('liveModeButtonActive'));
    assert(isOrigActive, `Original mode is active after click (${vp.name})`);

    const singleTextVisibleInOrig = await page.$eval('#single-text', el => el.style.display !== 'none');
    assert(singleTextVisibleInOrig, `#single-text visible in Original mode (${vp.name})`);

    const singleClassInOrig = await page.$eval('#single-text', el => el.className);
    assert(singleClassInOrig.includes('ethiopicTypography'), `#single-text has ethiopicTypography class in Original mode (${vp.name})`);

    const singleTextInOrig = await page.$eval('#single-text', el => el.textContent.trim());
    assert(singleTextInOrig.includes('ሰላም ለኪ ማርያም ድንግል'), `Correct original content in single-text (${vp.name})`);

    const counterInOrig = await page.$eval('#slide-counter', el => el.textContent.trim());
    assert(counterInOrig === '1 / 5', `Slide counter remains "1 / 5" after switching to Original (${vp.name})`);

    // 4. Switch to Transliteration mode
    await page.click('#live-mode-transliteration');
    const isTranslitActive = await page.$eval('#live-mode-transliteration', el => el.classList.contains('liveModeButtonActive'));
    assert(isTranslitActive, `Transliteration mode is active after click (${vp.name})`);

    const singleClassInTranslit = await page.$eval('#single-text', el => el.className);
    assert(singleClassInTranslit.includes('latinTypography'), `#single-text has latinTypography class in Transliteration mode (${vp.name})`);

    const singleTextInTranslit = await page.$eval('#single-text', el => el.textContent.trim());
    assert(singleTextInTranslit.includes('Selam Leki Maryam Dingil'), `Correct transliteration content in single-text (${vp.name})`);

    const counterInTranslit = await page.$eval('#slide-counter', el => el.textContent.trim());
    assert(counterInTranslit === '1 / 5', `Slide counter remains "1 / 5" after switching to Transliteration (${vp.name})`);

    // 5. Navigate to Next slide (Slide 2)
    await page.click('#btn-next');
    const counterSlide2 = await page.$eval('#slide-counter', el => el.textContent.trim());
    assert(counterSlide2 === '2 / 5', `Slide counter increments to "2 / 5" (${vp.name})`);

    // 6. Switch back to Both mode while on Slide 2 - slide index MUST BE PRESERVED
    await page.click('#live-mode-both');
    const counterSlide2InBoth = await page.$eval('#slide-counter', el => el.textContent.trim());
    assert(counterSlide2InBoth === '2 / 5', `Slide index preserved on Slide 2 ("2 / 5") when switching back to Both (${vp.name})`);

    const slide2OrigText = await page.$eval('#live-orig', el => el.textContent.trim());
    assert(slide2OrigText.includes('በስመ አብ ወወልድ'), `Verse 1 original lyrics displayed on Slide 2 (${vp.name})`);

    const slide2TranslitText = await page.$eval('#live-translit', el => el.textContent.trim());
    assert(slide2TranslitText.includes('Besme Ab weweld'), `Verse 1 transliteration displayed on Slide 2 (${vp.name})`);

    // 7. Theme toggle (Light/Parchment <-> Dark)
    const isDarkInitially = await page.$eval('#presentation-root', el => el.classList.contains('presentationDark'));
    await page.click('#btn-theme');
    const isDarkAfterToggle = await page.$eval('#presentation-root', el => el.classList.contains('presentationDark'));
    assert(isDarkAfterToggle !== isDarkInitially, `Theme toggle successfully changes to ${isDarkAfterToggle ? 'Dark' : 'Parchment'} (${vp.name})`);

    await context.close();
  }

  await browser.close();
  console.log(`\n===========================================`);
  console.log(`Playwright UI Audit Complete: ${testsPassed}/${testsTotal} passed successfully.`);
  console.log(`===========================================\n`);
}

runTests().catch(err => {
  console.error('Test run failed:', err);
  process.exit(1);
});
