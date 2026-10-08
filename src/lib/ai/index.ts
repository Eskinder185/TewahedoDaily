export {
  AI_TIMEOUTS_MS,
  getAiApiBaseUrl,
  getAiFeatureFlags,
  isAiApiConfigured,
} from './aiConfig.ts'
export { aiFetch } from './aiClient.ts'
export { friendlyAiError, mapHttpStatusToAiError } from './aiErrors.ts'
export {
  canAttemptAiChat,
  checkAiHealth,
  getAiCapabilities,
  postAiChat,
} from './chatApi.ts'
export { canAttemptAiOcr, postAiOcr } from './ocrApi.ts'
export {
  canAttemptServerTranscription,
  postAiTranscribe,
} from './transcriptionApi.ts'
export {
  AiClientError,
  type AiCapabilities,
  type AiChatRequest,
  type AiChatResponse,
  type AiErrorCode,
  type AiFeatureFlags,
  type AiHealthResponse,
  type AiLanguage,
  type AiOcrResponse,
  type AiSource,
  type AiTranscribeResponse,
  type AiUiStatus,
} from './aiTypes.ts'
