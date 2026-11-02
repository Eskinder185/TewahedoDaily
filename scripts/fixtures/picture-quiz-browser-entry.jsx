// Test-only entry: mounts the real PictureQuizGame with a synthetic pool (?count=N&locale=en|am). No Supabase or catalog.
import { createElement } from 'react'
import { createRoot } from 'react-dom/client'
import { MemoryRouter } from 'react-router-dom'
import { PictureQuizGame } from '/src/components/play/PictureQuizGame.tsx'
import { AuthContext } from '/src/lib/auth/useAuth.ts'

const params = new URLSearchParams(location.search)
const count = Number(params.get('count') ?? 0)
const locale = params.get('locale') === 'am' ? 'am' : 'en'
const signedOut = { session: null, user: null, profile: null, role: null, loading: false, error: null, isAuthenticated: false, isStaff: false }
const image = (n) => ({
  id: `pic-${n}`, kind: 'feast', src: `data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="80" height="60"/>`, fallbackSrc: '', width: 800, height: 600,
  answer: { en: `Feast ${n}`, am: `በዓል ${n}` }, alt: `Feast ${n}`,
  explanation: { en: 'Test explanation text for a picture.' }, description: 'Artwork for a Church feast.',
  source: { label: 'TewahedoDaily Calendar - test', route: '/calendar', kind: 'calendar' },
})
const config = { game: 'feasts', pool: Array.from({ length: count }, (_, i) => image(i + 1)), prompt: { en: 'Which feast?', am: 'የትኛው በዓል?' }, noun: { en: 'feast', am: 'በዓል' } }

createRoot(document.getElementById('root')).render(
  createElement(AuthContext.Provider, { value: signedOut }, createElement(MemoryRouter, null, createElement(PictureQuizGame, { locale, config }))),
)
