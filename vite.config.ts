import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
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
            return 'vendor'
          }
          
          // Separate chunk for chant data files
          if (id.includes('src/data/chants/')) {
            if (id.includes('mezmure-dawit')) {
              return 'chant-data-psalms'
            }
            if (id.includes('amharic-chants') || id.includes('english-mezmur-chants')) {
              return 'chant-data-mezmur'
            }
            if (id.includes('werb') || id.includes('tselot') || id.includes('wudase-mariam')) {
              return 'chant-data-prayers'
            }
            return 'chant-data-misc'
          }
          
          // Practice-related components
          if (id.includes('src/components/practice/') || id.includes('src/lib/practice/')) {
            return 'practice'
          }
          
          // Calendar-related components
          if (id.includes('src/components/calendar/') || id.includes('src/components/todayInChurch/') || id.includes('src/lib/churchCalendar/')) {
            return 'calendar'
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
