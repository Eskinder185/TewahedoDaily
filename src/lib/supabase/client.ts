import { createClient } from '@supabase/supabase-js'
import type { Database } from './database.types'

function readPublicEnv(name: 'VITE_SUPABASE_URL' | 'VITE_SUPABASE_PUBLISHABLE_KEY' | 'VITE_SUPABASE_ANON_KEY') {
  const fromVite =
    typeof import.meta !== 'undefined' && import.meta.env
      ? (import.meta.env[name] as string | undefined)
      : undefined
  const fromProcess =
    typeof process !== 'undefined' && process.env ? process.env[name] : undefined
  return (fromVite || fromProcess || '').trim()
}

const supabaseUrl = readPublicEnv('VITE_SUPABASE_URL')
const supabasePublishableKey =
  readPublicEnv('VITE_SUPABASE_PUBLISHABLE_KEY') || readPublicEnv('VITE_SUPABASE_ANON_KEY')

if (!supabaseUrl || !supabasePublishableKey) {
  console.warn(
    'Supabase environment variables are missing. Set VITE_SUPABASE_URL and VITE_SUPABASE_PUBLISHABLE_KEY.',
  )
}

/**
 * Public browser client. The publishable/anon key is safe for client bundles;
 * database access is constrained by grants and Row Level Security.
 * Never use a service-role or secret key here.
 */
export const supabase =
  supabaseUrl && supabasePublishableKey
    ? createClient<Database>(supabaseUrl, supabasePublishableKey, {
        auth: {
          persistSession: true,
          autoRefreshToken: true,
          detectSessionInUrl: true,
        },
      })
    : null

export const isSupabaseConfigured = supabase !== null
