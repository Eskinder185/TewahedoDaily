/** The room QR code must decode back to the exact join link. Run: npx tsx scripts/test-room-qr.ts */
import assert from 'node:assert/strict'
import jsQR from 'jsqr'
import { qrMatrix } from '../src/lib/play/roomQr.ts'
import { joinLink } from '../src/lib/play/liveRoom.ts'

function decode(text: string, scale = 8, quiet = 4): string | null {
  const matrix = qrMatrix(text)
  const modules = matrix.length + quiet * 2
  const px = modules * scale
  const data = new Uint8ClampedArray(px * px * 4).fill(255)
  matrix.forEach((row, y) => row.forEach((dark, x) => {
    if (!dark) return
    for (let dy = 0; dy < scale; dy += 1) for (let dx = 0; dx < scale; dx += 1) {
      const i = (((y + quiet) * scale + dy) * px + (x + quiet) * scale + dx) * 4
      data[i] = data[i + 1] = data[i + 2] = 10
    }
  }))
  return jsQR(data, px, px)?.data ?? null
}

for (const link of [
  joinLink('https://tewahedodaily.pages.dev', 'ABCDE'),
  joinLink('http://127.0.0.1:5173', 'K7M2Q'),
  joinLink('https://example.org', '23456'),
]) assert.equal(decode(link), link, link)
console.log('test-room-qr: ok (3 links encode and decode exactly)')
