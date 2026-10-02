/**
 * One-shot: generate responsive About hero WebP derivatives from about-hero.jpg.
 * Usage: node scripts/optimize-about-hero.mjs
 */
import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const root = path.resolve(__dirname, '..')
const src = path.join(root, 'public', 'images', 'about', 'about-hero.jpg')
const outDir = path.join(root, 'public', 'images', 'about')
const sizes = [640, 1024, 1600]
const quality = 78

async function main() {
  const sharp = (await import('sharp')).default
  if (!fs.existsSync(src)) {
    console.error('Missing', src)
    process.exit(1)
  }
  const origBytes = fs.statSync(src).size
  console.log('source', path.relative(root, src), origBytes)
  for (const width of sizes) {
    const out = path.join(outDir, `about-hero-${width}.webp`)
    await sharp(src)
      .rotate()
      .resize({ width, fit: 'inside', withoutEnlargement: true })
      .webp({ quality, effort: 4 })
      .toFile(out)
    const meta = await sharp(out).metadata()
    const bytes = fs.statSync(out).size
    console.log(
      path.basename(out),
      `${meta.width}x${meta.height}`,
      bytes,
      `${(((origBytes - bytes) / origBytes) * 100).toFixed(1)}% smaller than original`,
    )
  }
}

main().catch((err) => {
  console.error(err)
  process.exit(1)
})
