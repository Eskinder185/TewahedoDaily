/**
 * Optimize calendar / hero images into WebP derivatives.
 * Preserves originals. Does not crop or change artwork composition.
 *
 * Usage:
 *   node scripts/optimize-calendar-images.mjs
 *   node scripts/optimize-calendar-images.mjs --dry-run
 *
 * Requires: npx sharp (installed on first run via dynamic import).
 */
import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath, pathToFileURL } from 'node:url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const root = path.resolve(__dirname, '..')
const dryRun = process.argv.includes('--dry-run')

const CALENDAR_SRC = path.join(root, 'public', 'images', 'calendar')
const CALENDAR_OUT = path.join(root, 'public', 'images', 'calendar-web')
const HERO_SRC = path.join(root, 'public', 'images', 'home', 'lalibela.png')
const HERO_FALLBACK_JPG = path.join(root, 'public', 'images', 'home', 'home-hero-tewahedo-daily.jpg')
const HERO_OUT_DIR = path.join(root, 'public', 'images', 'home')
const MANIFEST_PATH = path.join(root, 'scripts', 'optimize-calendar-images.manifest.json')

const TARGET_W = 1200
const TARGET_H = 900
const WEBP_QUALITY = 78
const HERO_SIZES = [
  { name: 'home-hero-lalibela-640.webp', width: 640 },
  { name: 'home-hero-lalibela-1024.webp', width: 1024 },
  { name: 'home-hero-lalibela-1600.webp', width: 1600 },
]

async function loadSharp() {
  try {
    return (await import('sharp')).default
  } catch {
    console.error('sharp is required. Install with: npm install -D sharp')
    process.exit(1)
  }
}

function ensureDir(dir) {
  if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true })
}

function listImageFiles(dir) {
  if (!fs.existsSync(dir)) return []
  return fs
    .readdirSync(dir)
    .filter((name) => /\.(png|jpe?g|JPG|JPEG|webp)$/i.test(name) && !name.startsWith('.'))
    .map((name) => path.join(dir, name))
}

function outNameFor(sourcePath) {
  const base = path.basename(sourcePath).replace(/\.[^.]+$/, '')
  return `${base}.webp`
}

async function optimizeStill(sharp, sourcePath, outPath, { width, height, fit = 'inside' }) {
  const originalBytes = fs.statSync(sourcePath).size
  const meta = await sharp(sourcePath).metadata()
  const origW = meta.width || 0
  const origH = meta.height || 0

  if (dryRun) {
    return {
      source: path.relative(root, sourcePath).replace(/\\/g, '/'),
      output: path.relative(root, outPath).replace(/\\/g, '/'),
      originalDimensions: `${origW}x${origH}`,
      newDimensions: `(dry-run → max ${width}x${height || 'auto'})`,
      originalBytes,
      newBytes: null,
      percentReduction: null,
      skipped: false,
      dryRun: true,
    }
  }

  if (fs.existsSync(outPath)) {
    const existing = fs.statSync(outPath).size
    // Skip if already smaller than ~500KB and newer than source
    if (existing > 0 && existing < 500_000 && fs.statSync(outPath).mtimeMs >= fs.statSync(sourcePath).mtimeMs) {
      return {
        source: path.relative(root, sourcePath).replace(/\\/g, '/'),
        output: path.relative(root, outPath).replace(/\\/g, '/'),
        originalDimensions: `${origW}x${origH}`,
        newDimensions: 'skipped-existing',
        originalBytes,
        newBytes: existing,
        percentReduction: Number((((originalBytes - existing) / originalBytes) * 100).toFixed(1)),
        skipped: true,
      }
    }
  }

  const pipeline = sharp(sourcePath).rotate()
  const resize =
    height != null
      ? { width, height, fit, withoutEnlargement: true }
      : { width, fit: 'inside', withoutEnlargement: true }

  await pipeline.resize(resize).webp({ quality: WEBP_QUALITY, effort: 4 }).toFile(outPath)

  const outMeta = await sharp(outPath).metadata()
  const newBytes = fs.statSync(outPath).size
  return {
    source: path.relative(root, sourcePath).replace(/\\/g, '/'),
    output: path.relative(root, outPath).replace(/\\/g, '/'),
    originalDimensions: `${origW}x${origH}`,
    newDimensions: `${outMeta.width}x${outMeta.height}`,
    originalBytes,
    newBytes,
    percentReduction: Number((((originalBytes - newBytes) / originalBytes) * 100).toFixed(1)),
    skipped: false,
  }
}

async function main() {
  const sharp = await loadSharp()
  ensureDir(CALENDAR_OUT)
  ensureDir(HERO_OUT_DIR)

  const rows = []
  const sources = listImageFiles(CALENDAR_SRC)
  console.log(`Calendar sources: ${sources.length} in ${path.relative(root, CALENDAR_SRC)}`)

  for (const source of sources) {
    const out = path.join(CALENDAR_OUT, outNameFor(source))
    const row = await optimizeStill(sharp, source, out, {
      width: TARGET_W,
      height: TARGET_H,
      fit: 'inside',
    })
    rows.push(row)
    const tag = row.skipped ? 'skip' : dryRun ? 'dry' : 'ok'
    console.log(
      `[${tag}] ${path.basename(source)} ${row.originalBytes} → ${row.newBytes ?? '—'} (${row.percentReduction ?? '—'}%)`,
    )
  }

  const heroSource = fs.existsSync(HERO_SRC)
    ? HERO_SRC
    : fs.existsSync(HERO_FALLBACK_JPG)
      ? HERO_FALLBACK_JPG
      : null

  if (heroSource) {
    for (const size of HERO_SIZES) {
      const out = path.join(HERO_OUT_DIR, size.name)
      const row = await optimizeStill(sharp, heroSource, out, { width: size.width })
      rows.push(row)
      console.log(
        `[hero] ${size.name} ${row.originalBytes} → ${row.newBytes ?? '—'} (${row.percentReduction ?? '—'}%)`,
      )
    }
  } else {
    console.warn('No hero source found (lalibela.png / home-hero-tewahedo-daily.jpg)')
  }

  const summary = {
    generatedAt: new Date().toISOString(),
    dryRun,
    target: { width: TARGET_W, height: TARGET_H, quality: WEBP_QUALITY },
    calendarSourceDir: path.relative(root, CALENDAR_SRC).replace(/\\/g, '/'),
    calendarOutputDir: path.relative(root, CALENDAR_OUT).replace(/\\/g, '/'),
    files: rows,
    totals: {
      count: rows.length,
      originalBytes: rows.reduce((s, r) => s + (r.originalBytes || 0), 0),
      newBytes: rows.reduce((s, r) => s + (r.newBytes || 0), 0),
    },
  }
  summary.totals.percentReduction = summary.totals.originalBytes
    ? Number(
        (
          ((summary.totals.originalBytes - summary.totals.newBytes) / summary.totals.originalBytes) *
          100
        ).toFixed(1),
      )
    : 0

  if (!dryRun) {
    fs.writeFileSync(MANIFEST_PATH, JSON.stringify(summary, null, 2))
    console.log(`Wrote ${path.relative(root, MANIFEST_PATH)}`)
  }
  console.log(
    `Totals: ${(summary.totals.originalBytes / 1e6).toFixed(1)} MB → ${(summary.totals.newBytes / 1e6).toFixed(1)} MB (${summary.totals.percentReduction}% smaller)`,
  )
}

main().catch((err) => {
  console.error(err)
  process.exit(1)
})
