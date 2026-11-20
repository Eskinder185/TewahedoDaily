import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { VitePWA } from 'vite-plugin-pwa'
import { existsSync, readFileSync } from 'node:fs'

/**
 * LOCAL PREVIEW only (`apply: 'serve'`, so it never runs in `vite build`): serves the git-ignored .local-preview/review-inventory.json
 * to the dev-only /play/local-review screen, and only when the dev server was started with VITE_LOCAL_PREVIEW=true.
 */
const localPreviewInventory = () => ({
  name: 'local-preview-inventory',
  apply: 'serve' as const,
  configureServer(server: { config: { env: Record<string, unknown> }; middlewares: { use: (path: string, handler: (request: unknown, response: { statusCode: number; setHeader: (k: string, v: string) => void; end: (body: string) => void }) => void) => void } }) {
    if (server.config.env.VITE_LOCAL_PREVIEW !== 'true') return
    server.middlewares.use('/__local-preview/inventory.json', (_request, response) => {
      const file = '.local-preview/review-inventory.json'
      if (!existsSync(file)) { response.statusCode = 404; response.end('missing'); return }
      response.setHeader('content-type', 'application/json')
      response.setHeader('cache-control', 'no-store')
      response.end(readFileSync(file, 'utf8'))
    })
  },
})

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    react(),
    localPreviewInventory(),
    VitePWA({
      registerType: 'autoUpdate',
      includeAssets: ['favicon.svg', 'icons.svg'],
      manifest: {
        name: 'Tewahedo Daily',
        short_name: 'Tewahedo',
        description:
          'A calm daily companion for Ethiopian Orthodox mezmur, werb, tselot, and the church calendar.',
        theme_color: '#1c283a',
        background_color: '#1c283a',
        display: 'standalone',
        start_url: '/',
        lang: 'en',
        icons: [
          {
            src: '/icons.svg',
            sizes: 'any',
            type: 'image/svg+xml',
            purpose: 'any',
          },
          {
            src: '/favicon.svg',
            sizes: 'any',
            type: 'image/svg+xml',
            purpose: 'maskable',
          },
        ],
      },
      workbox: {
        navigateFallback: '/index.html',
        globPatterns: ['index.html', 'manifest.webmanifest', 'favicon.svg', 'icons.svg'],
        globIgnores: ['**/*.wasm', '**/whisper*', '**/ort-wasm*', 'docs/**'],
        runtimeCaching: [
          {
            urlPattern: ({ url }) => url.pathname.startsWith('/assets/'),
            handler: 'StaleWhileRevalidate',
            options: {
              cacheName: 'td-assets',
              expiration: { maxEntries: 80, maxAgeSeconds: 60 * 60 * 24 * 7 },
            },
          },
          {
            urlPattern: /^https:\/\/fonts\.googleapis\.com\/.*/i,
            handler: 'CacheFirst',
            options: {
              cacheName: 'google-fonts-stylesheets',
              expiration: { maxEntries: 8, maxAgeSeconds: 60 * 60 * 24 * 365 },
            },
          },
          {
            urlPattern: /^https:\/\/fonts\.gstatic\.com\/.*/i,
            handler: 'CacheFirst',
            options: {
              cacheName: 'google-fonts-webfonts',
              expiration: { maxEntries: 16, maxAgeSeconds: 60 * 60 * 24 * 365 },
              cacheableResponse: { statuses: [0, 200] },
            },
          },
          {
            urlPattern: ({ request }) => request.destination === 'image',
            handler: 'StaleWhileRevalidate',
            options: {
              cacheName: 'td-images',
              expiration: { maxEntries: 80, maxAgeSeconds: 60 * 60 * 24 * 30 },
            },
          },
        ],
      },
    }),
  ],
  // For GitHub Project Pages, set base to '/your-repo-name/' and use a SPA
  // fallback (e.g. Cloudflare Pages _redirects or gh-pages 404.html → index.html).
  base: '/',
  build: {
    // Reduce chunk size warning threshold 
    chunkSizeWarningLimit: 800,
    rollupOptions: {
      output: {
        manualChunks(id) {
          const norm = id.replace(/\\/g, '/')
          if (norm.includes('node_modules')) {
            // Parsers load only with document routes; never make initial public
            // navigation download their implementation.
            // pdfjs-dist is deliberately NOT given a named chunk: a named chunk also
            // absorbed Vite's shared preload helper, which put the whole 420 KB PDF
            // library on every page's critical path. Returning undefined (instead of
            // falling through to the generic 'vendor' chunk below) leaves it in the
            // lazy document reader's chunk.
            if (norm.includes('pdfjs-dist')) {
              return undefined
            }
            if (norm.includes('mammoth')) {
              return 'document-vendor'
            }
            // PowerPoint export (Present Mezmur) loads only when a deck is downloaded.
            if (norm.includes('/pptxgenjs/') || norm.includes('/jszip/')) {
              return 'pptx-vendor'
            }
            if (norm.includes('react') || norm.includes('react-dom') || norm.includes('react-router')) {
              return 'react-vendor'
            }
            if (norm.includes('fuse.js')) {
              return 'search-vendor'
            }
            if (norm.includes('@huggingface/transformers') || norm.includes('onnxruntime')) {
              return 'whisper-vendor'
            }
            return 'vendor'
          }

          if (norm.includes('/src/lib/speech/whisper')) {
            return 'whisper-speech'
          }

          // Keep the large static EOTC JSON off the AppShell / Home graph.
          // Do not bucket shared calendar/practice/prayer modules here: that
          // magnetized 795KB+ of page UI into every public route.
          if (
            norm.includes('/src/data/eotc_calendar_json/') ||
            norm.includes('/src/lib/eotcCalendar/eotcCalendarDataset') ||
            norm.includes('/src/data/calendar/')
          ) {
            return 'eotc-dataset'
          }
        },
      },
    },
  },
})
