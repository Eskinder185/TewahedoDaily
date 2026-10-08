import { AI_TIMEOUTS_MS, getAiFeatureFlags, isAiApiConfigured } from './aiConfig.ts'
import { aiFetch } from './aiClient.ts'
import type {
  AiCapabilities,
  AiChatRequest,
  AiChatResponse,
  AiHealthResponse,
} from './aiTypes.ts'

export async function checkAiHealth(signal?: AbortSignal): Promise<AiHealthResponse | null> {
  if (!isAiApiConfigured()) return null
  return aiFetch<AiHealthResponse>({
    path: '/health',
    method: 'GET',
    timeoutMs: AI_TIMEOUTS_MS.health,
    signal,
  })
}

export async function getAiCapabilities(signal?: AbortSignal): Promise<AiCapabilities | null> {
  if (!isAiApiConfigured()) return null
  try {
    return await aiFetch<AiCapabilities>({
      path: '/api/capabilities',
      method: 'GET',
      timeoutMs: AI_TIMEOUTS_MS.capabilities,
      signal,
    })
  } catch {
    // Capabilities endpoint is optional until the gateway ships it.
    return null
  }
}

export async function postAiChat(
  request: AiChatRequest,
  signal?: AbortSignal,
): Promise<AiChatResponse> {
  return aiFetch<AiChatResponse>({
    path: '/api/chat',
    method: 'POST',
    json: {
      ...request,
      timezone:
        typeof Intl !== 'undefined'
          ? Intl.DateTimeFormat().resolvedOptions().timeZone
          : 'UTC',
    },
    timeoutMs: AI_TIMEOUTS_MS.chat,
    signal,
    withAuth: true,
  })
}

/** True when the frontend may attempt a chat call (URL + flag). Does not prove backend health. */
export function canAttemptAiChat(): boolean {
  return getAiFeatureFlags().chatEnabled
}

