import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import ts from 'typescript'
import { chromium } from 'playwright'
import { deflateRawSync } from 'node:zlib'

const source = readFileSync('src/lib/cms/documentHtml.ts', 'utf8')
const js = ts.transpileModule(source.replace('export function', 'function'), {
  compilerOptions: { target: ts.ScriptTarget.ES2023, module: ts.ModuleKind.None },
}).outputText
const browser = await chromium.launch()
try {
  const page = await browser.newPage()
  await page.setContent('<main id="fixture"></main>')
  await page.addScriptTag({ content: js })
  const readerSource = readFileSync('src/lib/cms/documentReader.ts', 'utf8')
    .replace(/^import .*documentHtml.*$/m, '').replace(/export /g, '')
  await page.addScriptTag({ content: ts.transpileModule(readerSource, {
    compilerOptions: { target: ts.ScriptTarget.ES2023, module: ts.ModuleKind.None },
  }).outputText })
  // Reproduce the unquoted handler left intact by the original EPUB regex.
  await page.evaluate(() => { document.querySelector('main').innerHTML = '<img src=x onerror=window.exploited=true>' })
  await page.waitForFunction(() => window.exploited === true)
  const fixtures = [
    '<img src=x onerror=window.exploited=true>',
    '<svg onload=window.exploited=true><a href="javascript:alert(1)">bad</a></svg>',
    '<a href="java&#x73;cript:alert(1)" onclick=alert(1)>bad</a>',
    '<a href="java\nscript:alert(1)">bad</a><iframe srcdoc="<script>alert(1)</script>"></iframe>',
    '<form action="https://evil.invalid"><input autofocus onfocus=alert(1)></form>',
    '<math><mtext><table><mglyph><style><!--</style><img title="--><img src=x onerror=alert(1)>">',
  ]
  for (const html of fixtures) {
    const result = await page.evaluate(html => {
      window.exploited = false
      const clean = sanitizeDocumentHtml(html)
      document.querySelector('main').innerHTML = clean
      return { clean, unsafe: document.querySelector('main').querySelectorAll('script,svg,math,iframe,img,form,input,[onclick],[onerror],[onload]').length }
    }, html)
    assert.equal(result.unsafe, 0, result.clean)
    assert.doesNotMatch(result.clean, /javascript:|srcdoc=/i)
    assert.equal(await page.evaluate(() => window.exploited), false)
  }
  const formatted = await page.evaluate(() => sanitizeDocumentHtml('<h2>ሰላም</h2><p><strong>Text</strong> <a href="https://example.org" target="_blank">source</a></p>'))
  assert.match(formatted, /<h2>ሰላም<\/h2>/)
  assert.match(formatted, /<strong>Text<\/strong>/)
  assert.match(formatted, /href="https:\/\/example.org"/)
  assert.match(formatted, /rel="noopener noreferrer"/)
  const image = await page.evaluate(() => sanitizeDocumentHtml('<img src="data:image/png;base64,aGVsbG8=" alt="illustration" onerror=alert(1)>'))
  assert.match(image, /data:image\/png;base64,aGVsbG8=/)
  assert.doesNotMatch(image, /onerror/i)
  function zip(text, declaredSize = text.length) {
    const compressed = deflateRawSync(text)
    const local = Buffer.alloc(30); local.writeUInt32LE(0x04034b50); local.writeUInt16LE(8, 8)
    const central = Buffer.alloc(46); central.writeUInt32LE(0x02014b50); central.writeUInt16LE(8, 10)
    central.writeUInt32LE(compressed.length, 20); central.writeUInt32LE(declaredSize, 24)
    const end = Buffer.alloc(22); end.writeUInt32LE(0x06054b50); end.writeUInt16LE(1, 10)
    end.writeUInt32LE(local.length + compressed.length, 16)
    return Buffer.concat([local, compressed, central, end]).toString('base64')
  }
  const unpack = data => page.evaluate(async data => {
    try { const bytes = Uint8Array.from(atob(data), c => c.charCodeAt(0)); await unzipEntries(bytes.buffer); return 'accepted' }
    catch (error) { return error.message }
  }, data)
  assert.equal(await unpack(zip(Buffer.from('safe text'))), 'accepted')
  assert.match(await unpack(zip(Buffer.from('small'), 65 * 1024 * 1024)), /too large/)
  assert.match(await unpack(zip(Buffer.alloc(65 * 1024 * 1024), 1)), /size limit/)
  console.log(`PASS: original XSS reproduced; ${fixtures.length} hostile fixtures blocked; formatting and safe links preserved.`)
  console.log('PASS: normal archive accepted; declared oversized entry and dishonest expansion bomb rejected.')
} finally { await browser.close() }
