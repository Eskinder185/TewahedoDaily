import { AI_TIMEOUTS_MS, getAiFeatureFlags, isAiApiConfigured } from './aiConfig.ts'
import { aiFetch } from './aiClient.ts'
import { AiClientError, type AiLanguage, type AiOcrResponse } from './aiTypes.ts'

/**
 * Client-only preparation for future OCR. No UI wires this yet.
 */
export async function postAiOcr(
  input: {
    file: Blob
    language?: AiLanguage
    filename?: string
  },
  signal?: AbortSignal,
): Promise<AiOcrResponse> {
  if (!isAiApiConfigured()) {
    throw new AiClientError('not_configured', 'AI API is not configured.')
  }
  if (!getAiFeatureFlags().ocrEnabled) {
    throw new AiClientError('unavailable', 'OCR is not enabled.')
  }

  const form = new FormData()
  form.append('file', input.file, input.filename || 'document')
  if (input.language) form.append('language', input.language)

  return aiFetch<AiOcrResponse>({
    path: '/api/ocr',
    method: 'POST',
    body: form,
    timeoutMs: AI_TIMEOUTS_MS.ocr,
    signal,
    withAuth: true,
  })
}

export function canAttemptAiOcr(): boolean {
  return getAiFeatureFlags().ocrEnabled
}
