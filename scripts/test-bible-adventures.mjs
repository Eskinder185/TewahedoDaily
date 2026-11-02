// Offline source checks and an isolated browser run for the six local adventures.
// Run: node --experimental-strip-types --no-warnings scripts/test-bible-adventures.mjs
import assert from 'node:assert/strict'
import { spawn } from 'node:child_process'
import { readFileSync } from 'node:fs'
import { chromium } from 'playwright'
import { adventureSourceLabel, adventureSourceLink, bibleAdventureStories } from '../src/lib/play/bibleAdventureStories.ts'

const snapshot = JSON.parse(readFileSync('artifacts/bible-audit/original-snapshot/EN/web.json', 'utf8'))
const verseKeys = new Set(snapshot.verses.map((verse) => `${verse.book_name}:${verse.chapter}:${verse.verse}`))
assert.equal(bibleAdventureStories.length, 6)
assert.equal(new Set(bibleAdventureStories.map((story) => story.id)).size, 6)
for (const story of bibleAdventureStories) {
  assert.equal(story.scenes.length, 3, `${story.id}: three scenes`)
  for (const scene of story.scenes) {
    const { book, chapter, firstVerse, lastVerse } = scene.source
    assert.ok(firstVerse > 0 && lastVerse >= firstVerse, `${story.id}: ordered citation`)
    for (let verse = firstVerse; verse <= lastVerse; verse++) {
      assert.ok(verseKeys.has(`${book}:${chapter}:${verse}`), `${story.id}: missing ${book} ${chapter}:${verse}`)
    }
    assert.match(adventureSourceLink(scene.source), /^\/bible\/[a-z-]+\/\d+\?edition=web#verse-\d+$/)
    assert.ok(adventureSourceLabel(scene.source).includes(`${chapter}:${firstVerse}`))
    if (scene.interaction.kind === 'discover') {
      assert.equal(scene.interaction.details.length, 2)
      assert.equal(new Set(scene.interaction.details.map((detail) => detail.id)).size, 2)
    } else {
      assert.equal(scene.interaction.choices.length, 3)
      assert.equal(new Set(scene.interaction.choices.map((choice) => choice.id)).size, 3)
      assert.equal(scene.interaction.choices.filter((choice) => choice.id === scene.interaction.correctId).length, 1)
    }
  }
}
console.log('PASS offline registry, source-range, route and option checks')

// Expected illustrated objects per story/scene. Every id must be a discovery-detail or choice id of that scene.
const expectedHotspots = {
  sea: [['camp', 'sea'], ['hand'], ['lord-moses']],
  ark: [['ship', 'food'], [], ['rainbow']],
  david: [['flock', 'saul'], ['stones', 'helmet', 'sword'], []],
  daniel: [['decree', 'prayer'], ['angel', 'stone'], ['letter']],
  feeding: [['crowd', 'food'], ['disciples', 'crowd'], ['twelve']],
  storm: [['boat', 'waves'], ['boat', 'wind'], ['boat', 'calm']],
}
for (const story of bibleAdventureStories) {
  story.scenes.forEach((scene, index) => {
    const ids = scene.interaction.kind === 'discover' ? scene.interaction.details.map((d) => d.id) : scene.interaction.choices.map((c) => c.id)
    for (const id of expectedHotspots[story.id][index]) assert.ok(ids.includes(id), `${story.id} scene ${index + 1}: hotspot ${id} maps to an existing option`)
  })
}
console.log('PASS hotspot expectations map only to existing discovery/choice ids')

const hotspotLoc = (page, id) => page.locator(`svg [role="button"][data-object="${id}"]`)
const sidebarLoc = (page, id) => page.locator(`button[data-object="${id}"]`)
const isSidebarPressed = async (page, id) => (await sidebarLoc(page, id).getAttribute('aria-pressed')) === 'true'

/** Asserts the illustration exposes exactly the expected objects and the bilingual instruction. */
async function assertSceneObjects(page, story, sceneIndex, label) {
  const expected = expectedHotspots[story.id][sceneIndex]
  const found = await page.locator('svg [role="button"][data-object]').evaluateAll((nodes) => nodes.map((node) => node.getAttribute('data-object')).sort())
  assert.deepEqual(found, [...expected].sort(), `${label}: illustrated objects`)
  const sidebarHint = page.locator('[data-sidebar-hint]')
  assert.equal(await sidebarHint.count(), expected.length ? 0 : 1, `${label}: sidebar-answer instruction only on scenes without hotspots`)
  if (!expected.length) { const text = await sidebarHint.innerText(); assert.match(text, /choose an answer/i, `${label}: English passive-scene instruction`); assert.match(text, /\u12E8\u1218\u120D\u1235/, `${label}: Amharic passive-scene instruction`) }
  const hint = page.locator('p', { hasText: 'Interactive scene' })
  assert.equal(await hint.count(), expected.length ? 1 : 0, `${label}: instruction shown only when objects exist`)
  if (expected.length) assert.match(await hint.innerText(), /\u1270\u130D\u1263\u122B\u12CA/, `${label}: Amharic instruction`)
  for (const id of expected) {
    assert.ok(await sidebarLoc(page, id).count() === 1, `${label}: ${id} has a matching sidebar option`)
    assert.ok((await hotspotLoc(page, id).getAttribute('aria-label'))?.length > 3, `${label}: ${id} has an accessible name`)
  }
}

/**
 * Plays one scene, driving it from the illustration where an object exists and from the sidebar otherwise,
 * and asserting the two stay synchronized. `activate` is 'click' | 'tap' | 'keyboard'.
 */
async function playScene(page, story, sceneIndex, activate, label) {
  await assertSceneObjects(page, story, sceneIndex, label)
  const scene = story.scenes[sceneIndex]
  const objects = expectedHotspots[story.id][sceneIndex]
  const fire = async (id, how) => {
    if (how === 'keyboard-enter' || how === 'keyboard-space') {
      await hotspotLoc(page, id).focus()
      await page.keyboard.press(how === 'keyboard-enter' ? 'Enter' : 'Space')
    } else if (how === 'tap') {
      const hit = page.locator(`[data-hit="${id}"]`)
      await hit.evaluate((el) => el.scrollIntoView({ block: 'center' })) // keep clear of the sticky header
      await hit.tap()
    }
    else await page.locator(`[data-hit="${id}"]`).click()
  }
  if (scene.interaction.kind === 'discover') {
    const ids = scene.interaction.details.map((d) => d.id)
    const second = activate === 'click' ? 'keyboard-enter' : activate === 'tap' ? 'keyboard-space' : 'keyboard-enter'
    for (const [i, id] of ids.entries()) {
      if (objects.includes(id)) {
        const how = i === 0 ? (activate === 'keyboard' ? 'keyboard-space' : activate) : second
        await fire(id, how)
        assert.ok(await isSidebarPressed(page, id), `${label}: ${id} illustration -> sidebar`)
        assert.match(await hotspotLoc(page, id).getAttribute('aria-label'), /explored/, `${label}: ${id} explored state`)
        await fire(id, how) // repeated activation must stay idempotent
      } else {
        await sidebarLoc(page, id).click()
        assert.ok(await isSidebarPressed(page, id))
      }
    }
    assert.equal(await page.locator('[class*="findings"] li').count(), 2, `${label}: each finding listed once`)
    for (const id of objects) assert.equal(await hotspotLoc(page, id).getAttribute('aria-pressed'), 'true', `${label}: ${id} stays selected`)
    return
  }
  const { correctId } = scene.interaction
  for (const id of objects.filter((object) => object !== correctId)) {
    await fire(id, 'click')
    assert.equal(await sidebarLoc(page, id).getAttribute('data-state'), 'incorrect', `${label}: ${id} illustration -> sidebar (incorrect)`)
    assert.match(await hotspotLoc(page, id).getAttribute('aria-label'), /incorrect answer/, `${label}: ${id} incorrect state`)
    assert.equal(await page.getByText('Correct.', { exact: false }).count(), 0, `${label}: wrong object does not award`)
    assert.equal(await page.getByRole('button', { name: /Continue|Complete story/ }).count(), 0, `${label}: wrong object does not advance`)
  }
  if (objects.includes(correctId)) {
    await fire(correctId, activate === 'click' ? 'click' : activate === 'tap' ? 'tap' : 'keyboard-space')
    assert.ok(await isSidebarPressed(page, correctId), `${label}: correct illustration -> sidebar`)
    assert.match(await hotspotLoc(page, correctId).getAttribute('aria-label'), /correct answer/, `${label}: correct state`)
    assert.equal(await hotspotLoc(page, correctId).getAttribute('aria-disabled'), 'true', `${label}: locked after correct`)
  } else {
    await sidebarLoc(page, correctId).click()
  }
  await page.getByText('Correct.', { exact: false }).waitFor()
  for (const id of objects.filter((object) => object !== correctId)) {
    await hotspotLoc(page, id).dispatchEvent('click') // locked: must not change the answer
    assert.ok(await isSidebarPressed(page, correctId), `${label}: answer unchanged after lock`)
  }
}


/**
 * Red Sea animated scene: every user action must visibly change the scene, wrong answers must not,
 * and reduced motion must reach the same end state with no transition.
 */
async function seaAnimationFlow(page, { touch, reduced, label }) {
  const art = page.locator('[data-adventure-art]')
  const state = () => art.getAttribute('data-art-state')
  const css = (selector, property) => page.locator(selector).first().evaluate((el, prop) => getComputedStyle(el)[prop], property)
  const settle = (selector, property, expected) => page.waitForFunction(
    ([sel, prop, want]) => getComputedStyle(document.querySelector(sel))[prop] === want, [selector, property, expected], { timeout: 8000 })
  const activate = async (id) => {
    const hit = page.locator(`[data-hit="${id}"]`)
    await hit.evaluate((el) => el.scrollIntoView({ block: 'center' }))
    if (touch) await hit.tap(); else await hit.click()
  }
  const note = () => page.locator('[data-art-note]').innerText().catch(() => '')
  const advanceScene = async () => { await page.getByRole('button', { name: 'Continue' }).click(); await page.waitForFunction(() => document.activeElement?.id === 'adventure-scene-title') }
  const approached = 'matrix(1, 0, 0, 1, 48, 16)'

  await page.goto(`${base}/play/adventures?story=sea`, { waitUntil: 'domcontentloaded' })
  await page.getByRole('heading', { name: 'The people were afraid' }).waitFor()
  assert.equal(await state(), 'idle', `${label}: scene 1 starts idle`)
  assert.equal(await css('[class*="dust"]', 'transform'), 'none', `${label}: army starts far away`)
  assert.equal(await page.locator('[data-art-note]').count(), 0, `${label}: no feedback before any action`)

  await activate('camp')
  assert.equal(await state(), 'camp', `${label}: camp action changes scene state`)
  if (reduced) assert.equal(await css('[class*="dust"]', 'transform'), approached, `${label}: army moves immediately with reduced motion`)
  else await settle('[class*="dust"]', 'transform', approached)
  assert.match(await note(), /army draws near/, `${label}: camp feedback`)
  assert.equal(await page.locator('[class*="tremble"]').count(), 1, `${label}: people tremble while afraid`)
  if (reduced) assert.equal(await css('[class*="tremble"]', 'animationName'), 'none', `${label}: no tremble animation under reduced motion`)

  await page.getByRole('button', { name: 'Look at the sea' }).click()
  assert.equal(await state(), 'both', `${label}: both checkpoints reached`)
  assert.equal(await page.locator('[class*="tremble"]').count(), 0, `${label}: people stand still after Moses\u2019s word`)
  assert.match(await note(), /stand still/, `${label}: sea feedback`)
  await activate('camp') // repeated click keeps the same state
  assert.equal(await state(), 'both')
  await advanceScene()

  assert.equal(await state(), 'closed', `${label}: sea is closed before the answer`)
  const closedWall = 'matrix(1, 0, 0, 1, 185, 0)'
  assert.equal(await css('[class*="wallLeft"]', 'transform'), closedWall, `${label}: walls start closed`)
  assert.equal(await css('[data-walker]', 'opacity'), '0', `${label}: Israelites not yet crossing`)
  for (const wrong of ['He built a ship', 'He threw a stone', 'He built a ship']) {
    await page.getByRole('button', { name: wrong }).click()
    assert.equal(await state(), 'wrong', `${label}: wrong answer shows feedback only`)
    assert.equal(await css('[class*="wallLeft"]', 'transform'), closedWall, `${label}: wrong answer does not part the sea`)
    assert.match(await note(), /not parted/)
    assert.equal(await page.getByRole('button', { name: 'Continue' }).count(), 0, `${label}: wrong answer cannot skip`)
  }
  const hand = page.locator('svg [role="button"][data-object="hand"]')
  if (touch) await activate('hand')
  else { await hand.focus(); await page.keyboard.press('Enter') }
  assert.equal(await state(), 'open', `${label}: correct action parts the sea`)
  if (reduced) {
    assert.equal(await css('[class*="wallLeft"]', 'transform'), 'none', `${label}: walls open immediately with reduced motion`)
    assert.equal(await css('[data-walker]', 'opacity'), '1', `${label}: Israelites shown immediately with reduced motion`)
    assert.ok(parseFloat(await css('[class*="wallLeft"]', 'transitionDuration')) < 0.01, `${label}: no perceptible wall transition`)
  } else {
    await settle('[class*="wallLeft"]', 'transform', 'none')
    await settle('[data-walker]', 'opacity', '1')
    await settle('[data-walker]', 'transform', 'none')
  }
  assert.match(await note(), /dry ground/, `${label}: crossing feedback`)
  for (let i = 0; i < 2; i++) await page.locator('[data-hit="hand"]').dispatchEvent('click') // locked: repeats are ignored
  assert.equal(await state(), 'open', `${label}: repeated clicks keep scene open`)
  assert.ok(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth + 1), `${label}: no overflow with feedback shown`)
  assert.ok(await page.locator('[data-art-note]').evaluate((el) => { const n = el.getBoundingClientRect(); const a = el.parentElement.getBoundingClientRect(); return n.left >= a.left && n.right <= a.right }), `${label}: feedback stays inside the illustration`)
  await advanceScene()

  assert.equal(await state(), 'idle')
  await page.getByRole('button', { name: 'Pharaoh and his army' }).click()
  assert.equal(await state(), 'wrong', `${label}: scene 3 wrong answer`)
  assert.equal(await page.locator('[class*="lifted"]').count(), 0)
  await page.getByRole('button', { name: 'Complete story' }).count().then((n) => assert.equal(n, 0, `${label}: cannot complete after wrong answer`))
  await activate('lord-moses')
  assert.equal(await state(), 'believed', `${label}: correct final answer`)
  if (reduced) assert.equal(await css('[class*="lifted"]', 'transform'), 'matrix(1, 0, 0, 1, 0, -7)')
  else await settle('[class*="lifted"]', 'transform', 'matrix(1, 0, 0, 1, 0, -7)')
  await page.getByRole('button', { name: 'Complete story' }).click()
  await page.getByRole('heading', { name: 'Story complete' }).waitFor()
  assert.match(await page.locator('main').innerText(), /\+100 XP/)
  const history = () => page.evaluate(() => JSON.parse(localStorage.getItem('tewahedo-play-progress-v1')).history.length)
  assert.equal(await history(), 1, `${label}: one completion recorded`)
  await page.getByRole('button', { name: 'Replay story' }).click()
  await page.getByRole('heading', { name: 'The people were afraid' }).waitFor()
  assert.equal(await state(), 'idle', `${label}: replay resets scene state`)
  assert.equal(await css('[class*="dust"]', 'transform'), 'none', `${label}: replay resets army`)
  assert.equal(await history(), 1, `${label}: replay does not add XP`)
}

let animAssertions = 0
const A = new Proxy(assert, { get: (target, key) => (typeof target[key] === 'function' ? (...args) => { animAssertions++; return target[key](...args) } : target[key]) })
const animFinals = new Map()
// Moves that legitimately react to a wrong object choice (the object itself wobbles); everything else must stay put.
const wrongReactive = new Set(['helmet', 'sword', 'denStone'])

/**
 * Animated story flow for the non-Exodus stories. The scene must visibly change after each valid checkpoint or
 * correct answer, stay put on wrong answers and repeats, and reach the identical end state under reduced motion.
 */
async function animatedStoryFlow(page, story, { touch, reduced, label }) {
  const art = page.locator('[data-art-state]')
  const state = () => art.getAttribute('data-art-state')
  const snap = () => page.evaluate(() => Object.fromEntries([...document.querySelectorAll('[data-move]')].map((el) => {
    const css = getComputedStyle(el)
    return [el.getAttribute('data-move'), `${css.transform}|${css.opacity}|${css.strokeDashoffset}`]
  })))
  const settled = async () => {
    let previous = JSON.stringify(await snap())
    for (let attempt = 0; attempt < 40; attempt++) {
      await page.waitForTimeout(250)
      const current = JSON.stringify(await snap())
      if (current === previous) return JSON.parse(current)
      previous = current
    }
    throw new Error(`${label}: scene never settled`)
  }
  const differs = (a, b, ignore = new Set()) => Object.keys({ ...a, ...b }).filter((key) => !ignore.has(key) && a[key] !== b[key])
  const note = () => page.locator('[data-art-note]').innerText().catch(() => '')
  const activate = async (id, hasHit, how) => {
    if (!hasHit) {
      const button = sidebarLoc(page, id)
      await button.evaluate((el) => el.scrollIntoView({ block: 'center' }))
      return touch ? button.tap() : button.click()
    }
    if (how === 'keyboard') { await hotspotLoc(page, id).focus(); return page.keyboard.press('Enter') }
    const hit = page.locator(`[data-hit="${id}"]`)
    await hit.evaluate((el) => el.scrollIntoView({ block: 'center' }))
    return touch ? hit.tap() : hit.click()
  }
  const record = async (step) => {
    const key = `${story.id}:${step}`
    if (reduced) {
      A.deepEqual(await snap(), animFinals.get(key), `${label}: ${step} reaches the same completed state immediately under reduced motion`)
    } else {
      animFinals.set(key, await settled())
    }
  }

  await page.goto(`${base}/play/adventures?story=${story.id}`, { waitUntil: 'domcontentloaded' })
  await page.getByRole('heading', { level: 1, name: story.title.en }).waitFor()
  const firstScene = await snap()
  for (let sceneIndex = 0; sceneIndex < 3; sceneIndex++) {
    const scene = story.scenes[sceneIndex]
    const objects = expectedHotspots[story.id][sceneIndex]
    const tag = `${label} scene ${sceneIndex + 1}`
    A.equal(await state(), 'idle', `${tag}: starts idle`)
    A.equal(await page.locator('[data-art-note]').count(), 0, `${tag}: no feedback before action`)
    const initial = await settled()
    A.ok(Object.keys(initial).length > 0, `${tag}: animated objects present`)
    if (scene.interaction.kind === 'discover') {
      const ids = scene.interaction.details.map((d) => d.id)
      let before = initial
      for (const [i, id] of ids.entries()) {
        await activate(id, objects.includes(id), i === 1 && !touch ? 'keyboard' : 'pointer')
        A.equal(await state(), i === ids.length - 1 ? 'both' : id, `${tag}: ${id} updates scene state`)
        await record(`${sceneIndex}:${id}`)
        const after = reduced ? await snap() : animFinals.get(`${story.id}:${sceneIndex}:${id}`)
        A.ok(differs(before, after).length > 0, `${tag}: ${id} visibly changes the scene (${differs(before, after).join(',')})`)
        A.ok((await note()).length > 10, `${tag}: ${id} shows scripture feedback`)
        if (objects.includes(id)) await page.locator(`[data-hit="${id}"]`).dispatchEvent('click') // repeat
        A.deepEqual(await snap(), after, `${tag}: repeating ${id} does not change the scene`)
        before = after
      }
      A.equal(await page.locator('[class*="findings"] li').count(), 2, `${tag}: each finding listed once`)
    } else {
      const { correctId, choices } = scene.interaction
      for (const choice of choices.filter((c) => c.id !== correctId)) {
        await sidebarLoc(page, choice.id).click()
        A.equal(await state(), 'wrong', `${tag}: wrong answer ${choice.id} gives feedback`)
        A.match(await note(), /Look again at/, `${tag}: wrong note`)
        A.equal(await page.getByRole('button', { name: /Continue|Complete story/ }).count(), 0, `${tag}: wrong answer cannot advance`)
        const afterWrong = await settled()
        A.deepEqual(differs(initial, afterWrong, wrongReactive), [], `${tag}: wrong answer ${choice.id} does not complete the scene`)
      }
      await activate(correctId, objects.includes(correctId), sceneIndex === 1 && !touch ? 'keyboard' : 'pointer')
      A.equal(await state(), 'done', `${tag}: correct answer completes the scene`)
      await record(`${sceneIndex}:${correctId}`)
      const done = reduced ? await snap() : animFinals.get(`${story.id}:${sceneIndex}:${correctId}`)
      A.ok(differs(initial, done).length > 0, `${tag}: correct answer visibly changes the scene (${differs(initial, done).join(',')})`)
      A.ok((await note()).length > 10, `${tag}: scripture feedback`)
      if (story.id === 'ark' && sceneIndex === 1) {
        for (const name of ['noah', 'animals', 'door']) A.ok(name in done, `${tag}: ${name} tracked`)
        A.equal(done.noah.split('|')[1], '0', `${tag}: Noah is no longer visible outside once the Lord shuts the door`)
        A.equal(done.animals.split('|')[1], '0', `${tag}: animals are inside`)
        A.equal(done.door.split('|')[1], '1', `${tag}: door is closed`)
        A.equal(initial.noah.split('|')[1], '1', `${tag}: Noah is still outside before the answer`)
      }
      if (objects.includes(correctId)) await page.locator(`[data-hit="${correctId}"]`).dispatchEvent('click')
      for (const choice of choices.filter((c) => c.id !== correctId)) await sidebarLoc(page, choice.id).dispatchEvent('click').catch(() => undefined)
      A.deepEqual(await snap(), done, `${tag}: repeat or locked clicks do not change the completed scene`)
      A.equal(await state(), 'done')
    }
    A.ok(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth + 1), `${tag}: no horizontal overflow`)
    A.ok(await page.locator('[data-art-note]').evaluate((el) => { const n = el.getBoundingClientRect(); const a = el.parentElement.getBoundingClientRect(); return n.left >= a.left - 1 && n.right <= a.right + 1 }), `${tag}: feedback stays inside the illustration`)
    await advance(page, story, sceneIndex)
  }
  await page.getByRole('heading', { name: 'Story complete' }).waitFor()
  const history = () => page.evaluate(() => JSON.parse(localStorage.getItem('tewahedo-play-progress-v1')).history.length)
  A.equal(await history(), 1, `${label}: exactly one completion`)
  A.match(await page.locator('main').innerText(), /\+100 XP/, `${label}: XP shown once`)
  await page.getByRole('button', { name: 'Replay story' }).click()
  await page.getByRole('heading', { level: 2, name: story.scenes[0].title.en }).waitFor()
  A.equal(await state(), 'idle', `${label}: replay resets scene state`)
  A.deepEqual(await settled(), firstScene, `${label}: replay restores the opening artwork`)
  A.equal(await history(), 1, `${label}: replay awards no extra XP`)
}

/** Completes a story through the sidebar only, returning once the completion panel is shown. */
async function completeThroughSidebar(page, story) {
  await page.goto(`${base}/play/adventures?story=${story.id}`, { waitUntil: 'domcontentloaded' })
  await page.getByRole('heading', { level: 1, name: story.title.en }).waitFor()
  await finishScenes(page, story)
}
async function finishScenes(page, story) {
  for (let sceneIndex = 0; sceneIndex < 3; sceneIndex++) {
    const { interaction } = story.scenes[sceneIndex]
    if (interaction.kind === 'discover') for (const detail of interaction.details) await sidebarLoc(page, detail.id).click()
    else await sidebarLoc(page, interaction.correctId).click()
    await page.locator('[class*="primary"]').click() // locale-independent Continue / Complete
    if (sceneIndex < 2) await page.waitForFunction(() => document.activeElement?.id === 'adventure-scene-title')
  }
  await page.locator('[class*="complete"] h3').waitFor()
}

/** D1: story XP is awarded once per player; replays, reloads and story switching cannot award it again. */
async function xpOnceRegression(browser) {
  const [ark, david] = ['ark', 'david'].map((id) => bibleAdventureStories.find((story) => story.id === id))
  const context = await browser.newContext({ viewport: { width: 1280, height: 900 } })
  const page = await context.newPage()
  const read = () => page.evaluate(() => { const saved = JSON.parse(localStorage.getItem('tewahedo-play-progress-v1') || '{}'); return { xp: saved.xp ?? 0, history: (saved.history ?? []).length } })
  const log = []
  await completeThroughSidebar(page, ark)
  assert.match(await page.locator('main').innerText(), /\+100 XP/, 'first completion shows +100 XP')
  log.push(['first completion', await read()])
  assert.deepEqual(log[0][1], { xp: 100, history: 1 })
  await page.getByRole('button', { name: 'Replay story' }).click()
  await page.getByRole('heading', { level: 2, name: ark.scenes[0].title.en }).waitFor()
  await finishScenes(page, ark)
  assert.equal(await page.locator('[data-practice]').count(), 1, 'replay completion is labelled as practice')
  assert.doesNotMatch(await page.locator('main').innerText(), /\+\d+ XP/, 'replay shows no XP')
  log.push(['after replay', await read()])
  assert.deepEqual(log[1][1], { xp: 100, history: 1 }, 'replay awards no XP and adds no history entry')
  await page.reload({ waitUntil: 'domcontentloaded' })
  await page.getByRole('heading', { level: 1, name: ark.title.en }).waitFor()
  await finishScenes(page, ark)
  assert.equal(await page.locator('[data-practice]').count(), 1, 'completion after reload is practice')
  log.push(['after reload + completion', await read()])
  assert.deepEqual(log[2][1], { xp: 100, history: 1 }, 'reload does not bypass the guard')
  await completeThroughSidebar(page, david)
  assert.match(await page.locator('main').innerText(), /\+100 XP/, 'a different story still awards its own XP')
  log.push(['switch to David', await read()])
  assert.deepEqual(log[3][1], { xp: 200, history: 2 })
  await completeThroughSidebar(page, ark)
  assert.equal(await page.locator('[data-practice]').count(), 1, 'switching stories does not reset the guard')
  log.push(['back to Noah', await read()])
  assert.deepEqual(log[4][1], { xp: 200, history: 2 })
  // Amharic practice message and unaffected non-adventure games.
  await page.evaluate(() => localStorage.setItem('tewahedo-daily-locale', 'am'))
  await page.reload({ waitUntil: 'domcontentloaded' })
  await finishScenes(page, ark)
  assert.match(await page.locator('[data-practice]').innerText(), /\u12E8\u120D\u121D\u121D\u12F5/, 'Amharic practice message')
  await context.close()
  console.log('PASS XP once per story: ' + log.map(([step, v]) => `${step}: XP ${v.xp}, history ${v.history}`).join(' | '))
}

/** D3: header text must reach WCAG AA against the real gradient in both themes and at all widths. */
async function headerContrastRegression(browser) {
  for (const [width, height] of [[360, 780], [390, 844], [1280, 900]]) {
    const context = await browser.newContext({ viewport: { width, height }, deviceScaleFactor: 1 })
    const page = await context.newPage()
    for (const id of ['ark', 'david']) {
      await page.goto(`${base}/play/adventures?story=${id}`, { waitUntil: 'domcontentloaded' })
      await page.locator('h1').waitFor()
      for (const theme of ['day', 'night']) {
        await page.evaluate((value) => { document.documentElement.dataset.theme = value }, theme)
        await page.waitForTimeout(600) // let theme colour transitions finish
        const result = await page.evaluate(() => {
          const canvas = document.createElement('canvas'); canvas.width = canvas.height = 1
          const ctx = canvas.getContext('2d', { willReadFrequently: true })
          const rgb = (color) => { ctx.clearRect(0, 0, 1, 1); ctx.fillStyle = '#000'; ctx.fillStyle = color; ctx.fillRect(0, 0, 1, 1); return [...ctx.getImageData(0, 0, 1, 1).data].slice(0, 3) }
          const lum = ([r, g, b]) => 0.2126 * lin(r) + 0.7152 * lin(g) + 0.0722 * lin(b)
          const lin = (v) => { const c = v / 255; return c <= 0.03928 ? c / 12.92 : ((c + 0.055) / 1.055) ** 2.4 }
          const ratio = (a, b) => { const [x, y] = [lum(a), lum(b)].sort((m, n) => n - m); return (x + 0.05) / (y + 0.05) }
          const header = document.querySelector('h1').closest('header')
          const image = getComputedStyle(header).backgroundImage
          const inner = image.slice(image.indexOf('(') + 1, image.lastIndexOf(')'))
          const parts = []; let depth = 0, start = 0
          for (let i = 0; i < inner.length; i++) { if (inner[i] === '(') depth++; if (inner[i] === ')') depth--; if (inner[i] === ',' && depth === 0) { parts.push(inner.slice(start, i).trim()); start = i + 1 } }
          parts.push(inner.slice(start).trim())
          const stops = parts.filter((part) => !/^\d+(\.\d+)?deg$|^to /.test(part)).map((part) => part.replace(/\s+\d+(\.\d+)?%$/, ''))
          const stopColors = stops.map(rgb)
          const targets = ['h1', '[class*="headerSummary"]', '[class*="eyebrow"]', 'nav a'].map((selector) => header.querySelector(selector)).filter(Boolean)
          return { stops: stops.length, ratios: targets.map((el) => ({ el: el.tagName + '.' + el.className.slice(0, 20), min: Math.min(...stopColors.map((stop) => ratio(rgb(getComputedStyle(el).color), stop))) })) }
        })
        assert.ok(result.stops >= 2, `${id} ${width}px ${theme}: gradient stops parsed`)
        for (const { el, min } of result.ratios) assert.ok(min >= 4.5, `${id} ${width}px ${theme}: ${el} contrast ${min.toFixed(2)}:1 must be at least 4.5:1`)
      }
    }
    await context.close()
  }
  console.log('PASS header text contrast >= 4.5:1 against the real gradient (light/night, 360/390/1280px)')
}

async function advance(page, story, sceneIndex) {
  const last = sceneIndex === story.scenes.length - 1
  await page.getByRole('button', { name: last ? 'Complete story' : 'Continue' }).click()
  if (!last) await page.waitForFunction(() => document.activeElement?.id === 'adventure-scene-title')
}

const port = Number(process.env.ADVENTURE_TEST_PORT || 5217)
const base = `http://127.0.0.1:${port}`
const server = spawn(process.execPath, ['node_modules/vite/bin/vite.js', '--port', String(port), '--strictPort', '--host', '127.0.0.1'], { stdio: 'ignore' })
const stopServer = () => { try { server.kill() } catch { /* already stopped */ } }
process.on('exit', stopServer)
let browser
try {
  let ready = false
  for (let attempt = 0; attempt < 100; attempt++) {
    try { if ((await fetch(base)).ok) { ready = true; break } } catch { /* startup */ }
    await new Promise((resolve) => setTimeout(resolve, 300))
  }
  assert.ok(ready, 'isolated Vite server started')
  browser = await chromium.launch({ headless: true })
  const context = await browser.newContext({ viewport: { width: 1440, height: 900 } })
  const page = await context.newPage()
  const errors = []
  page.on('pageerror', (error) => errors.push(String(error)))
  await page.goto(`${base}/play/adventures`, { waitUntil: 'domcontentloaded' })
  await page.getByRole('heading', { name: 'Choose an adventure' }).waitFor()
  assert.equal(await page.locator('main a[href*="?story="]').count(), 6, 'six gallery cards')
  assert.ok(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth + 1), 'desktop no overflow')
  const dayBackground = await page.locator('[class*="page"]').first().evaluate((el) => getComputedStyle(el).backgroundColor)
  await page.evaluate(() => { document.documentElement.dataset.theme = 'night' })
  const nightBackground = await page.locator('[class*="page"]').first().evaluate((el) => getComputedStyle(el).backgroundColor)
  assert.notEqual(dayBackground, nightBackground, 'night theme changes tokenized page surface')
  assert.ok(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth + 1), 'night gallery no overflow')

  for (const story of bibleAdventureStories) {
    await page.goto(`${base}/play/adventures?story=${story.id}`, { waitUntil: 'domcontentloaded' })
    await page.getByRole('heading', { level: 1, name: story.title.en }).waitFor()
    assert.ok((await page.locator('a[href*="edition=web#verse-"]').getAttribute('href'))?.includes(story.scenes[0].source.slug), `${story.id}: source link`)
    for (let sceneIndex = 0; sceneIndex < 3; sceneIndex++) {
      await playScene(page, story, sceneIndex, ['click', 'keyboard', 'click'][sceneIndex], `desktop ${story.id} scene ${sceneIndex + 1}`)
      await advance(page, story, sceneIndex)
    }
    await page.getByRole('heading', { name: 'Story complete' }).waitFor()
    const saved = await page.evaluate(() => JSON.parse(localStorage.getItem('tewahedo-play-progress-v1') || '{}'))
    assert.equal(saved.history[0].game, 'adventure', `${story.id}: completion recorded`)
    assert.equal(saved.history.length, bibleAdventureStories.indexOf(story) + 1, `${story.id}: hotspot activation awards exactly one completion`)
    assert.equal(saved.categoryMastery[story.passage].total, 3, `${story.id}: category progress`)
    assert.match(await page.locator('main').innerText(), /\+100 XP/, `${story.id}: XP shown`)
    if (story.id === 'sea') {
      await page.getByRole('button', { name: 'Replay story' }).click()
      await page.getByRole('heading', { name: 'The people were afraid' }).waitFor()
      assert.equal((await page.evaluate(() => JSON.parse(localStorage.getItem('tewahedo-play-progress-v1')).history.length)), 1, 'replay does not record an extra completion')
      await page.reload()
      assert.equal((await page.evaluate(() => JSON.parse(localStorage.getItem('tewahedo-play-progress-v1')).history.length)), 1, 'local completion persists after reload')
    }
  }
  assert.deepEqual(errors, [], 'no browser page errors')
  console.log('PASS hotspot activation (mouse, Enter, Space) and sidebar sync for all six stories')
  console.log('PASS gallery, six completions, replay, persisted progress, source links and desktop layout')
  await context.close()

  const mobile = await browser.newContext({ viewport: { width: 360, height: 780 }, hasTouch: true, isMobile: true, reducedMotion: 'reduce' })
  const mobilePage = await mobile.newPage()
  await mobilePage.goto(`${base}/play/adventures`, { waitUntil: 'domcontentloaded' })
  await mobilePage.getByRole('heading', { name: 'Choose an adventure' }).waitFor()
  assert.ok(await mobilePage.evaluate(() => document.documentElement.scrollWidth <= innerWidth + 1), '360px gallery no overflow')
  await mobilePage.setViewportSize({ width: 390, height: 844 })
  assert.ok(await mobilePage.evaluate(() => document.documentElement.scrollWidth <= innerWidth + 1), '390px gallery no overflow')
  await mobilePage.setViewportSize({ width: 360, height: 780 })
  assert.ok(await mobilePage.locator('main a[href*="?story="]').first().evaluate((el) => parseFloat(getComputedStyle(el).transitionDuration) < 0.01), 'reduced motion removes perceptible card transition')
  await mobilePage.getByRole('link', { name: /A Way Through the Sea/ }).tap()
  await mobilePage.getByRole('button', { name: 'Inspect the camp' }).tap()
  await mobilePage.getByRole('button', { name: 'Look at the sea' }).tap()
  assert.ok(await mobilePage.evaluate(() => document.documentElement.scrollWidth <= innerWidth + 1), '360px scene no overflow')
  await mobilePage.getByRole('button', { name: 'Continue' }).focus()
  await mobilePage.keyboard.press('Enter')
  await mobilePage.waitForFunction(() => document.activeElement?.id === 'adventure-scene-title')
  await mobilePage.getByRole('button', { name: 'He stretched out his hand' }).focus()
  await mobilePage.keyboard.press('Space')
  await mobilePage.getByText('Correct.', { exact: false }).waitFor()
  console.log('PASS touch, keyboard, 360px/390px layout, night theme and reduced motion')

  // Hotspot targets: size, overlap, tap activation and sidebar sync for every story at 360px and 390px.
  for (const [width, height] of [[360, 780], [390, 844]]) {
    await mobilePage.setViewportSize({ width, height })
    for (const story of bibleAdventureStories) {
      await mobilePage.goto(`${base}/play/adventures?story=${story.id}`, { waitUntil: 'domcontentloaded' })
      await mobilePage.getByRole('heading', { level: 1, name: story.title.en }).waitFor()
      for (let sceneIndex = 0; sceneIndex < 3; sceneIndex++) {
        const label = `${width}px ${story.id} scene ${sceneIndex + 1}`
        const boxes = await mobilePage.locator('[data-hit]').evaluateAll((nodes) => nodes.map((node) => {
          const r = node.getBoundingClientRect()
          const svg = node.ownerSVGElement.getBoundingClientRect()
          return { id: node.getAttribute('data-hit'), x: r.x, y: r.y, w: r.width, h: r.height, inside: r.left >= svg.left - 1 && r.right <= svg.right + 1 && r.top >= svg.top - 1 && r.bottom <= svg.bottom + 1 }
        }))
        for (const box of boxes) {
          assert.ok(box.w >= 44 && box.h >= 44, `${label}: ${box.id} touch target ${Math.round(box.w)}x${Math.round(box.h)}px is at least 44px`)
          assert.ok(box.inside, `${label}: ${box.id} target stays inside the illustration`)
        }
        for (const [i, one] of boxes.entries()) for (const two of boxes.slice(i + 1)) {
          assert.ok(one.x + one.w <= two.x + 1 || two.x + two.w <= one.x + 1 || one.y + one.h <= two.y + 1 || two.y + two.h <= one.y + 1, `${label}: ${one.id} and ${two.id} targets do not overlap`)
        }
        assert.ok(await mobilePage.evaluate(() => document.documentElement.scrollWidth <= innerWidth + 1), `${label}: no horizontal overflow`)
        if (boxes.length && sceneIndex === 0) {
          assert.ok(await mobilePage.locator('[data-hit]').first().evaluate((el) => parseFloat(getComputedStyle(el).transitionDuration) < 0.01), `${label}: reduced motion removes hotspot transitions`)
        }
        await playScene(mobilePage, story, sceneIndex, 'tap', label)
        await advance(mobilePage, story, sceneIndex)
      }
      await mobilePage.getByRole('heading', { name: 'Story complete' }).waitFor()
    }
  }
  console.log('PASS hotspot touch targets, tap activation, sidebar sync and no overlap at 360px and 390px')

  // Sidebar -> illustration sync, keyboard focus ring and night theme.
  await mobilePage.goto(`${base}/play/adventures?story=storm`, { waitUntil: 'domcontentloaded' })
  await mobilePage.getByRole('heading', { level: 1, name: 'Jesus Calms the Storm' }).waitFor()
  await mobilePage.getByRole('button', { name: 'Watch the waves' }).focus()
  assert.match(await hotspotLoc(mobilePage, 'waves').getAttribute('class'), /active/, 'sidebar focus highlights the matching object')
  await mobilePage.getByRole('button', { name: 'Inspect the boat' }).tap()
  assert.equal(await hotspotLoc(mobilePage, 'boat').getAttribute('aria-pressed'), 'true', 'sidebar selection updates illustration')
  await mobilePage.locator('#adventure-scene-title').focus()
  await mobilePage.keyboard.press('Shift+Tab') // real keyboard navigation back into the illustration
  await mobilePage.waitForFunction(() => getComputedStyle(document.querySelector('[data-object="waves"] rect[class*="ring"]')).opacity === '1', null, { timeout: 3000 }) // keyboard focus ring is visible
  assert.equal(await mobilePage.evaluate(() => document.activeElement?.getAttribute('data-object')), 'waves', 'hotspot receives focus')
  await mobilePage.evaluate(() => { document.documentElement.dataset.theme = 'night' })
  assert.notEqual(await mobilePage.locator('[data-hit]').first().evaluate((el) => getComputedStyle(el).stroke), 'none', 'night theme keeps hotspot outlines')
  assert.ok(await mobilePage.evaluate(() => document.documentElement.scrollWidth <= innerWidth + 1), 'night hotspot scene no overflow')
  console.log('PASS sidebar-to-illustration sync, focus ring and night theme')
  await mobile.close()

  const amContext = await browser.newContext()
  await amContext.addInitScript(() => localStorage.setItem('tewahedo-daily-locale', 'am'))
  const amPage = await amContext.newPage()
  await amPage.goto(`${base}/play/adventures?story=ark`, { waitUntil: 'domcontentloaded' })
  await amPage.getByRole('heading', { level: 1, name: 'Noah and the Ark' }).waitFor()
  assert.equal(await amPage.getByRole('heading', { level: 1 }).getAttribute('lang'), 'en', 'English-only title marked in English under Amharic UI')
  await amPage.goto(`${base}/play/adventures?story=sea`, { waitUntil: 'domcontentloaded' })
  await amPage.getByRole('heading', { level: 1, name: 'በባሕር ዳር ያለው መንገድ' }).waitFor()
  console.log('PASS Amharic UI and English-only story language fallback')
  await amContext.close()

  const seaDesktop = await browser.newContext({ viewport: { width: 1280, height: 900 } })
  await seaAnimationFlow(await seaDesktop.newPage(), { touch: false, reduced: false, label: 'sea desktop animated' })
  await seaDesktop.close()
  for (const width of [360, 390]) {
    const seaMobile = await browser.newContext({ viewport: { width, height: 800 }, hasTouch: true, isMobile: true, reducedMotion: 'reduce' })
    await seaAnimationFlow(await seaMobile.newPage(), { touch: true, reduced: true, label: `sea ${width}px touch reduced-motion` })
    await seaMobile.close()
  }
  console.log('PASS Red Sea animated scene: visible state changes, wrong answers, repeats, XP dedupe, replay reset, touch and reduced motion')

  await xpOnceRegression(browser)
  await headerContrastRegression(browser)
  const animOnly = (process.env.ANIM_STORIES || 'ark,david,daniel,feeding,storm').split(',')
  for (const story of bibleAdventureStories.filter((item) => animOnly.includes(item.id))) {
    const before = animAssertions
    const desktop = await browser.newContext({ viewport: { width: 1280, height: 900 } })
    await animatedStoryFlow(await desktop.newPage(), story, { touch: false, reduced: false, label: `${story.id} desktop animated` })
    await desktop.close()
    for (const width of [360, 390]) {
      const mobileCtx = await browser.newContext({ viewport: { width, height: 800 }, hasTouch: true, isMobile: true, reducedMotion: 'reduce' })
      await animatedStoryFlow(await mobileCtx.newPage(), story, { touch: true, reduced: true, label: `${story.id} ${width}px touch reduced-motion` })
      await mobileCtx.close()
    }
    console.log(`PASS ${story.id} animated scenes: state changes, wrong answers, repeats, XP once, replay reset, touch and reduced motion (${animAssertions - before} new assertions)`)
  }
} finally {
  if (browser) await browser.close()
  stopServer()
}
