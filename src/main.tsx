import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import { registerSW } from 'virtual:pwa-register'
import { LocaleProvider } from './lib/i18n/locale'
import { ThemeProvider } from './components/layout/ThemeProvider'
import './index.css'
import App from './App.tsx'
import { LOCAL_PREVIEW } from './lib/localPreview'
import { installLocalPreviewWriteGuard } from './lib/localPreviewGuard'

// Local preview only (compile-time false in production builds): refuse every non-read request to the hosted Supabase origin.
if (LOCAL_PREVIEW) installLocalPreviewWriteGuard()

registerSW({ immediate: true })

const router = createBrowserRouter([{ path: '*', element: <App /> }])

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <ThemeProvider>
      <LocaleProvider>
        <RouterProvider router={router} />
      </LocaleProvider>
    </ThemeProvider>
  </StrictMode>,
)
