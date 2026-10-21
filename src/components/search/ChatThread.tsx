import { memo, useEffect, useRef, useState, type RefObject } from 'react'
import { useTranslation } from '../../i18n'
import type { ChatMessage } from '../../lib/search/chatTypes'
import type { SiteSearchResult } from '../../lib/search/types'
import { plainTextFromSearchBuddyMessage } from '../../lib/searchBuddy/copySearchBuddyText.ts'
import { CopyTextButton } from './CopyTextButton'
import { SearchBuddyResults } from './results/SearchBuddyResults'
import { SearchResultCard } from './SearchResultCard'
import styles from './SearchBuddy.module.css'

type Props = {
  messages: ChatMessage[]
  bodyRef: RefObject<HTMLDivElement | null>
  onBodyScroll: () => void
  stickToBottomRef: RefObject<boolean>
  lookingUpLabel: string
  onOpenResult: (result: SiteSearchResult) => void
  onPreviewResult?: (result: SiteSearchResult) => void
  isSynaxariumResult: (result: SiteSearchResult) => boolean
  showAllLocal?: boolean
  onShowAllLocal?: () => void
  seeMoreLabel?: (count: number) => string
  initialLocalCount?: number
  liveStatus?: string
  busy?: boolean
  onRetry?: (query: string, messageId: string) => void
}

type MessageRowProps = {
  msg: ChatMessage
  lookingUpLabel: string
  onOpenResult: (result: SiteSearchResult) => void
  onPreviewResult?: (result: SiteSearchResult) => void
  isSynaxariumResult: (result: SiteSearchResult) => boolean
  showAllLocal?: boolean
  onShowAllLocal?: () => void
  seeMoreLabel?: (count: number) => string
  initialLocalCount: number
  busy?: boolean
  onRetry?: (query: string, messageId: string) => void
}

function RetryButton({
  availableAt,
  busy,
  onRetry,
}: {
  availableAt?: number
  busy?: boolean
  onRetry: () => void
}) {
  const t = useTranslation()
  const [now, setNow] = useState(() => Date.now())
  const waiting = availableAt != null && availableAt > now
  useEffect(() => {
    if (!waiting) return
    const id = window.setInterval(() => setNow(Date.now()), 1000)
    return () => window.clearInterval(id)
  }, [waiting, availableAt])
  const seconds = waiting && availableAt != null ? Math.max(1, Math.ceil((availableAt - now) / 1000)) : 0
  return (
    <button type="button" className={styles.retryBtn} onClick={onRetry} disabled={busy || waiting}>
      {waiting ? t('searchBuddy.retryWait', { seconds }) : t('searchBuddy.retry')}
    </button>
  )
}

const ChatMessageRow = memo(function ChatMessageRow({
  msg,
  lookingUpLabel,
  onOpenResult,
  onPreviewResult,
  isSynaxariumResult,
  showAllLocal,
  onShowAllLocal,
  seeMoreLabel,
  initialLocalCount,
  busy,
  onRetry,
}: MessageRowProps) {
  const t = useTranslation()
  if (msg.role === 'user') {
    return (
      <article
        className={`${styles.chatMsg} ${styles.chatMsgUser}`}
        aria-label={t('searchBuddy.roleYou')}
      >
        <div className={styles.userBubble}>
          <p className={styles.userBubbleText}>{msg.text}</p>
        </div>
      </article>
    )
  }

  const copyText = plainTextFromSearchBuddyMessage(msg)
  const showCopy =
    msg.status === 'complete' && Boolean(copyText) && (Boolean(msg.response) || Boolean(msg.text))

  return (
    <article
      className={`${styles.chatMsg} ${styles.chatMsgAssistant}`}
      aria-label={t('searchBuddy.roleAssistant')}
    >
      <div className={styles.assistantBlock}>
        {msg.status === 'sending' ? (
          <div className={styles.loading} role="status">
            <span className={styles.loadingDots} aria-hidden>
              <span />
              <span />
              <span />
            </span>
            <p className={styles.loadingText}>{msg.text || lookingUpLabel}</p>
          </div>
        ) : null}

        {msg.status === 'error' && msg.errorText ? (
          <div className={styles.errorBlock} role="alert">
            <p className={styles.message}>{msg.errorText}</p>
            {msg.localResults?.length ? (
              <p className={styles.message}>{t('searchBuddy.localWhileDown')}</p>
            ) : null}
            {msg.failedQuery && onRetry ? (
              <RetryButton
                availableAt={msg.retryAvailableAt}
                busy={busy}
                onRetry={() => onRetry(msg.failedQuery || '', msg.id)}
              />
            ) : null}
          </div>
        ) : null}

        {showCopy ? (
          <div className={styles.messageToolbar}>
            <CopyTextButton text={copyText} />
          </div>
        ) : null}

        {msg.status === 'complete' && msg.text ? (
          <p className={styles.assistantLead}>{msg.text}</p>
        ) : null}

        {msg.response ? (
          <div className={styles.chatStructured}>
            <SearchBuddyResults response={msg.response} empty={msg.empty} />
          </div>
        ) : null}

        {msg.localResults?.length ? (
          <div className={styles.results}>
            {(showAllLocal
              ? msg.localResults
              : msg.localResults.slice(0, initialLocalCount)
            ).map((result) => (
              <SearchResultCard
                key={`${msg.id}:${result.sourceType}:${result.sourceId}:${result.route}`}
                result={result}
                preferPreview={isSynaxariumResult(result)}
                onOpen={() => onOpenResult(result)}
                onPreview={
                  isSynaxariumResult(result) && onPreviewResult
                    ? () => onPreviewResult(result)
                    : undefined
                }
              />
            ))}
            {!showAllLocal &&
            msg.localResults.length > initialLocalCount &&
            onShowAllLocal &&
            seeMoreLabel ? (
              <button type="button" className={styles.seeMore} onClick={onShowAllLocal}>
                {seeMoreLabel(msg.localResults.length - initialLocalCount)}
              </button>
            ) : null}
          </div>
        ) : null}

        {msg.suggestions?.length ? (
          <div className={styles.nearby}>
            <div className={styles.results}>
              {msg.suggestions.map((result) => (
                <SearchResultCard
                  key={`suggest:${msg.id}:${result.route}`}
                  result={result}
                  onOpen={() => onOpenResult(result)}
                />
              ))}
            </div>
          </div>
        ) : null}
      </div>
    </article>
  )
})

export function ChatThread({
  messages,
  bodyRef,
  onBodyScroll,
  stickToBottomRef,
  lookingUpLabel,
  onOpenResult,
  onPreviewResult,
  isSynaxariumResult,
  showAllLocal,
  onShowAllLocal,
  seeMoreLabel,
  initialLocalCount = 6,
  liveStatus,
  busy,
  onRetry,
}: Props) {
  const endRef = useRef<HTMLDivElement>(null)
  const lastAnchorRef = useRef('')

  useEffect(() => {
    if (!stickToBottomRef.current) return
    const last = messages[messages.length - 1]
    const anchor = last
      ? `${last.id}:${last.status}:${last.text?.length ?? 0}:${last.response?.type ?? ''}`
      : ''
    // Instant jump — smooth scroll fights touch scrolling and feels laggy on phones.
    if (anchor && anchor === lastAnchorRef.current) return
    lastAnchorRef.current = anchor
    const body = bodyRef.current
    if (body) {
      body.scrollTop = body.scrollHeight
      return
    }
    endRef.current?.scrollIntoView({ block: 'end', behavior: 'auto' })
  }, [messages, stickToBottomRef, bodyRef])

  return (
    <div ref={bodyRef} className={styles.body} onScroll={onBodyScroll}>
      <div className={styles.thread} role="log">
        {liveStatus ? (
          <p className={styles.srOnly} role="status" aria-live="polite">
            {liveStatus}
          </p>
        ) : null}

        {messages.map((msg) => (
          <ChatMessageRow
            key={msg.id}
            msg={msg}
            lookingUpLabel={lookingUpLabel}
            onOpenResult={onOpenResult}
            onPreviewResult={onPreviewResult}
            isSynaxariumResult={isSynaxariumResult}
            showAllLocal={showAllLocal}
            onShowAllLocal={onShowAllLocal}
            seeMoreLabel={seeMoreLabel}
            initialLocalCount={initialLocalCount}
            busy={busy}
            onRetry={onRetry}
          />
        ))}
        <div ref={endRef} className={styles.threadEnd} aria-hidden />
      </div>
    </div>
  )
}
