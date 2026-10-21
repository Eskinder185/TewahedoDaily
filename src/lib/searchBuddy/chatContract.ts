/**
 * Public POST /api/chat body shared by Search Buddy and the AI chat fallback.
 * Automatic answer language omits answer_language. No context IDs are sent.
 */

export const CHAT_MESSAGE_MAX = 8000
export const CHAT_TIMEZONE_MAX = 100
export const CHAT_HISTORY_MAX_ITEMS = 12
export const CHAT_HISTORY_ITEM_MAX = 4000
export const CHAT_HISTORY_TOTAL_MAX = 16000

export type ChatUiLanguage = 'en' | 'am'
export type ChatAnswerLanguage = 'en' | 'am' | 'bilingual'
export type AnswerLanguagePreference = 'auto' | ChatAnswerLanguage

export type ChatHistoryMessage = {
  role: 'user' | 'assistant'
  content: string
}

export type ChatRequestBody = {
  message: string
  timezone?: string
  ui_language?: ChatUiLanguage
  answer_language?: ChatAnswerLanguage
  history?: ChatHistoryMessage[]
}

/** Display turns that may become history. Navigation and error cards stay out. */
export type ChatHistorySource = {
  id?: string
  role: 'user' | 'assistant'
  status?: 'sending' | 'complete' | 'error'
  text?: string | null
  errorText?: string | null
  failedQuery?: string | null
  responseType?: string | null
  answer?: string | null
  hasLocalResults?: boolean
  hasSuggestions?: boolean
}

const ANSWER_PREFERENCE_KEY = 'tewahedo-search-buddy-answer-language'

export function isChatQuestionTooLong(message: string): boolean {
  return (message || '').trim().length > CHAT_MESSAGE_MAX
}

export function readAnswerLanguagePreference(): AnswerLanguagePreference {
  try {
    const raw = localStorage.getItem(ANSWER_PREFERENCE_KEY)
    if (raw === 'en' || raw === 'am' || raw === 'bilingual' || raw === 'auto') return raw
  } catch {
    /* storage can be blocked */
  }
  return 'auto'
}

export function writeAnswerLanguagePreference(value: AnswerLanguagePreference): void {
  try {
    localStorage.setItem(ANSWER_PREFERENCE_KEY, value)
  } catch {
    /* preference still applies for this session */
  }
}

function rawContent(message: ChatHistorySource): string {
  if (message.role === 'assistant' && message.responseType === 'ai') {
    return (message.answer || message.text || '').trim()
  }
  return (message.text || '').trim()
}

function isFailedOrPending(message: ChatHistorySource): boolean {
  return (
    message.status === 'sending' ||
    message.status === 'error' ||
    Boolean((message.errorText || '').trim()) ||
    Boolean((message.failedQuery || '').trim())
  )
}

/** Null skips the bubble. `drop` rejects the whole turn so a partial turn is not sent. */
function contentOf(message: ChatHistorySource): { content: string } | { skip: true } | { drop: true } {
  if (isFailedOrPending(message)) return { drop: true }
  if (message.hasLocalResults || message.hasSuggestions) return { skip: true }
  if (message.role === 'assistant' && message.responseType && message.responseType !== 'ai') {
    return { skip: true }
  }
  const content = rawContent(message)
  if (!content) return message.role === 'user' ? { drop: true } : { skip: true }
  if (content.length > CHAT_HISTORY_ITEM_MAX) return { drop: true }
  return { content }
}

/**
 * Preceding successful conversational turns only.
 * Drops the current question and its in-flight or failed assistant card.
 * Keeps complete recent turns inside the item and character caps.
 */
export function selectChatHistory(
  messages: ChatHistorySource[],
  options?: { omitAssistantId?: string; omitQuestion?: string },
): ChatHistoryMessage[] {
  const omitAssistantId = options?.omitAssistantId
  const omitQuestion = (options?.omitQuestion || '').trim()
  const skipped = new Set<number>()
  if (omitAssistantId) {
    const assistantIndex = messages.findIndex((message) => message.id === omitAssistantId)
    if (assistantIndex >= 0) {
      skipped.add(assistantIndex)
      for (let i = assistantIndex - 1; i >= 0; i -= 1) {
        if (messages[i].role !== 'user') continue
        const text = (messages[i].text || '').trim()
        if (!omitQuestion || text === omitQuestion) skipped.add(i)
        break
      }
    }
  }

  type Turn = ChatHistoryMessage[]
  const turns: Turn[] = []
  let current: Turn | null = null
  let dropTurn = false

  const flush = () => {
    if (current && current.length && !dropTurn) turns.push(current)
    current = null
    dropTurn = false
  }

  messages.forEach((message, index) => {
    if (message.role === 'user') {
      flush()
      current = []
      dropTurn = skipped.has(index)
    } else if (!current) {
      current = []
      dropTurn = false
    }
    if (skipped.has(index)) {
      dropTurn = true
      return
    }
    const picked = contentOf(message)
    if ('drop' in picked) {
      dropTurn = true
      return
    }
    if ('skip' in picked) return
    current?.push({ role: message.role, content: picked.content })
  })
  flush()

  const selected: ChatHistoryMessage[] = []
  let chars = 0
  for (let i = turns.length - 1; i >= 0; i -= 1) {
    const turn = turns[i]
    const turnChars = turn.reduce((sum, item) => sum + item.content.length, 0)
    if (selected.length + turn.length > CHAT_HISTORY_MAX_ITEMS) break
    if (chars + turnChars > CHAT_HISTORY_TOTAL_MAX) break
    selected.unshift(...turn)
    chars += turnChars
  }
  return selected
}

export function buildChatRequestBody(input: {
  message: string
  timezone?: string | null
  uiLanguage?: ChatUiLanguage | null
  answerLanguage?: AnswerLanguagePreference | null
  history?: ChatHistoryMessage[] | null
}): ChatRequestBody {
  const body: ChatRequestBody = { message: (input.message || '').trim() }
  const timezone = (input.timezone || '').trim().slice(0, CHAT_TIMEZONE_MAX)
  if (timezone) body.timezone = timezone
  if (input.uiLanguage === 'en' || input.uiLanguage === 'am') {
    body.ui_language = input.uiLanguage
  }
  const answer = input.answerLanguage
  if (answer === 'en' || answer === 'am' || answer === 'bilingual') {
    body.answer_language = answer
  }
  if (input.history && input.history.length) body.history = input.history
  return body
}

export function historySourceFromChatMessage(message: {
  id: string
  role: 'user' | 'assistant'
  text?: string
  status?: 'sending' | 'complete' | 'error'
  errorText?: string
  failedQuery?: string
  response?: { type?: string; answer?: string | null; message?: string | null } | null
  localResults?: unknown[]
  suggestions?: unknown[]
}): ChatHistorySource {
  const response = message.response
  return {
    id: message.id,
    role: message.role,
    status: message.status,
    text: message.text,
    errorText: message.errorText,
    failedQuery: message.failedQuery,
    responseType: response?.type,
    answer: response?.type === 'ai' ? response.answer || response.message || '' : undefined,
    hasLocalResults: Boolean(message.localResults?.length),
    hasSuggestions: Boolean(message.suggestions?.length),
  }
}
