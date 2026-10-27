// Polyfill Uint8Array.prototype.toHex for PDF.js 4.10+ compatibility across all browsers and Playwright
if (typeof Uint8Array !== 'undefined' && !(Uint8Array.prototype as any).toHex) {
  ;(Uint8Array.prototype as any).toHex = function () {
    let hex = ''
    for (let i = 0; i < this.length; i++) {
      hex += this[i].toString(16).padStart(2, '0')
    }
    return hex
  }
}

// Polyfill Map.prototype.getOrInsertComputed for PDF.js 4.10+
if (typeof Map !== 'undefined' && !(Map.prototype as any).getOrInsertComputed) {
  ;(Map.prototype as any).getOrInsertComputed = function (key: any, computeFn: any) {
    if (this.has(key)) return this.get(key)
    const val = computeFn(key)
    this.set(key, val)
    return val
  }
}

import 'pdfjs-dist/build/pdf.worker.mjs'
