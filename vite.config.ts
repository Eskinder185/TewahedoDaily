import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  // For GitHub Project Pages, set base to '/your-repo-name/' and use a SPA
  // fallback (e.g. Cloudflare Pages _redirects or gh-pages 404.html → index.html).
  base: '/',
})
