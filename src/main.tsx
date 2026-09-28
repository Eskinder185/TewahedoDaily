import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import { LocaleProvider } from './lib/i18n/locale'
import { ThemeProvider } from './components/layout/ThemeProvider'
import './index.css'
import App from './App.tsx'

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
