// Test-only entry: mounts the real MezmurEditor as an editor-role staff user (?path=/new or /<import_id>/edit).
// Supabase traffic is intercepted by the test runner; nothing reaches a real project.
import { createElement } from 'react'
import { createRoot } from 'react-dom/client'
import { RouterProvider, createMemoryRouter } from 'react-router-dom'
import { MezmurEditor } from '/src/pages/admin/MezmurEditor.tsx'
import { AuthContext } from '/src/lib/auth/useAuth.ts'

const params = new URLSearchParams(location.search)
const profile = { id: 'staff-1', role: params.get('role') || 'editor', display_name: 'Test Editor' }
const auth = { session: null, user: { id: 'staff-1' }, profile, role: profile.role, loading: false, error: null, isAuthenticated: true, isStaff: true }
const router = createMemoryRouter(
  [
    { path: '/admin/hymns/mezmur/new', element: createElement(MezmurEditor) },
    { path: '/admin/hymns/mezmur/:id/edit', element: createElement(MezmurEditor) },
  ],
  { initialEntries: [params.get('path') || '/admin/hymns/mezmur/new'] },
)
window.__router = router
createRoot(document.getElementById('root')).render(createElement(AuthContext.Provider, { value: auth }, createElement(RouterProvider, { router })))
