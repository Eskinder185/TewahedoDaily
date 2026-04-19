/**
 * Loads https://www.youtube.com/iframe_api once and resolves when `YT.Player` exists.
 */
let apiReady: Promise<void> | undefined

export function ensureYoutubeIframeApi(): Promise<void> {
  if (typeof window === 'undefined') return Promise.resolve()
  if (window.YT?.Player) return Promise.resolve()

  if (!apiReady) {
    apiReady = new Promise<void>((resolve) => {
      let settled = false
      const finish = () => {
        if (settled) return
        settled = true
        resolve()
      }

      const prev = window.onYouTubeIframeAPIReady
      window.onYouTubeIframeAPIReady = () => {
        prev?.()
        finish()
      }

      const existing = document.querySelector<HTMLScriptElement>(
        'script[src*="youtube.com/iframe_api"]',
      )
      if (!existing) {
        const s = document.createElement('script')
        s.src = 'https://www.youtube.com/iframe_api'
        s.async = true
        document.head.appendChild(s)
      } else {
        const started = Date.now()
        const iv = window.setInterval(() => {
          if (window.YT?.Player) {
            window.clearInterval(iv)
            finish()
          } else if (Date.now() - started > 12000) {
            window.clearInterval(iv)
            finish()
          }
        }, 50)
      }

      window.setTimeout(finish, 14000)
    })
  }

  return apiReady
}
