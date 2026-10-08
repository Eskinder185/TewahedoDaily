import type { AiFeatureFlags } from './aiTypes.ts'

/**
 * Public AI API gateway URL (Cloudflare Pages / Vite build-time).
 *
 * CORS note for the future backend:
 * - Allow production origin: https://tewahedodaily.pages.dev
 * - Allow future custom domains as needed
 * - Do NOT use Access-Control-Allow-Origin: * for authenticated endpoints
 * - Frontend must never call LAN IPs, Proxmox, Ollama, or Qdrant directly
 *
 * Security: VITE_* values are PUBLIC. Never put secrets, service-role keys,
 * or private tokens in Vite env vars.
 */
const ENV_KEY = 'VITE_TEWAHEDO_AI_API_URL'

export const AI_TIMEOUTS_MS = {
  health: 5_000,
  capabilities: 8_000,
  chat: 45_000,
  transcription: 45_000,
  ocr: 60_000,
} as const

function readEnvUrl(): string {
  const fromVite =
    typeof import.meta !== 'undefined' && import.meta.env
      ? (import.meta.env[ENV_KEY] as string | undefined)
      : undefined
  const fromProcess =
    typeof process !== 'undefined' && process.env ? process.env[ENV_KEY] : undefined
  return (fromVite || fromProcess || '').trim().replace(/\/+$/, '')
}

/** Returns the configured public AI API base URL, or null when unset. */
export function getAiApiBaseUrl(): string | null {
  const url = readEnvUrl()
  if (!url) return null
  // Reject accidental LAN / localhost hardcodes in production builds.
  const isProd =
    (typeof import.meta !== 'undefined' && import.meta.env && import.meta.env.PROD) ||
    process.env.NODE_ENV === 'production'
  if (isProd) {
    try {
      const parsed = new URL(url)
      const host = parsed.hostname.toLowerCase()
      if (
        host === 'localhost' ||
        host === '127.0.0.1' ||
        host.startsWith('10.') ||
        host.startsWith('192.168.') ||
        /^172\.(1[6-9]|2\d|3[0-1])\./.test(host)
      ) {
        console.warn(
          '[ai] Ignoring non-public AI API URL in production. Use a public HTTPS gateway.',
        )
        return null
      }
    } catch {
      return null
    }
  }
  return url
}

export function isAiApiConfigured(): boolean {
  return Boolean(getAiApiBaseUrl())
}

/**
 * Frontend feature flags. Capabilities from the backend can refine these later;
 * until then, chat/transcription/ocr stay off unless the base URL is set AND
 * an explicit enable env is present (or default chat opt-in when URL exists).
 *
 * Optional env toggles (all public, default false except chat when URL exists):
 * - VITE_AI_CHAT_ENABLED=true|false
 * - VITE_AI_SERVER_TRANSCRIPTION_ENABLED=true
 * - VITE_AI_OCR_ENABLED=true
 */
function readBoolEnv(name: string, defaultValue: boolean): boolean {
  const fromVite =
    typeof import.meta !== 'undefined' && import.meta.env
      ? String(import.meta.env[name] ?? '').trim().toLowerCase()
      : ''
  const fromProcess =
    typeof process !== 'undefined' && process.env
      ? String(process.env[name] ?? '').trim().toLowerCase()
      : ''
  const raw = fromVite || fromProcess
  if (!raw) return defaultValue
  if (raw === '1' || raw === 'true' || raw === 'yes' || raw === 'on') return true
  if (raw === '0' || raw === 'false' || raw === 'no' || raw === 'off') return false
  return defaultValue
}

export function getAiFeatureFlags(): AiFeatureFlags {
  const configured = isAiApiConfigured()
  return {
    configured,
    // Chat may attempt when URL is set; still fails open to Search Buddy if down.
    chatEnabled: configured && readBoolEnv('VITE_AI_CHAT_ENABLED', true),
    // Keep server transcription off until the gateway is ready.
    serverTranscriptionEnabled:
      configured && readBoolEnv('VITE_AI_SERVER_TRANSCRIPTION_ENABLED', false),
    ocrEnabled: configured && readBoolEnv('VITE_AI_OCR_ENABLED', false),
  }
}
