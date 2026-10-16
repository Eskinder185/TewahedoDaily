import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { VitePWA } from 'vite-plugin-pwa'

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    react(),
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
        globPatterns: ['**/*.{js,css,html,ico,svg,webp,woff2,json}'],
        runtimeCaching: [
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
          // Vendor chunk for React and React Router
          if (id.includes('node_modules')) {
            if (id.includes('react') || id.includes('react-dom') || id.includes('react-router')) {
              return 'react-vendor'
            }
            // Separate chunk for other vendor dependencies
            if (id.includes('fuse.js')) {
              return 'search-vendor'
            }
            // Keep Whisper / ONNX runtime out of the main vendor + Search Buddy chunks.
            if (id.includes('@huggingface/transformers') || id.includes('onnxruntime')) {
              return 'whisper-vendor'
            }
            return 'vendor'
          }

          if (id.includes('src/lib/speech/whisper')) {
            return 'whisper-speech'
          }
          
          // EOTC rule-engine datasets (date resolution / movable feasts) — not CMS copy
          if (id.includes('src/data/eotc_calendar_json/') || id.includes('src/data/calendar/')) {
            return 'eotc-dataset'
          }

          // Calendar page + shared calendar libs (keep Homepage out via dynamic imports)
          if (
            id.includes('src/pages/CalendarPage') ||
            id.includes('src/lib/calendar/') ||
            id.includes('src/lib/eotcCalendar/') ||
            id.includes('src/lib/churchCalendar/') ||
            id.includes('src/components/calendar/') ||
            id.includes('src/components/todayInChurch/')
          ) {
            return 'calendar'
          }
          
          // Practice-related components + chant workshop (not homepage)
          if (
            id.includes('src/components/practice/') ||
            id.includes('src/lib/practice/') ||
            id.includes('src/pages/PracticePage') ||
            id.includes('src/pages/MezmurDetailPage') ||
            id.includes('src/pages/HymnPractice')
          ) {
            return 'practice'
          }
          
          // Prayer-related components
          if (id.includes('src/components/prayers/') || id.includes('src/lib/prayers/')) {
            return 'prayers'
          }
          
          // i18n and localization
          if (id.includes('src/lib/i18n/')) {
            return 'i18n'
          }
        },
      },
    },
  },
})
