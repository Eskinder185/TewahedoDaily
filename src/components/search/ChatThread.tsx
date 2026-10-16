import { memo, useEffect, useRef, type RefObject } from 'react'
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
}: MessageRowProps) {
  if (msg.role === 'user') {
    return (
      <article
        className={`${styles.chatMsg} ${styles.chatMsgUser}`}
        aria-label="You"
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
      aria-label="Assistant"
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
          <p className={styles.message} role="alert">
            {msg.errorText}
          </p>
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
          />
        ))}
        <div ref={endRef} className={styles.threadEnd} aria-hidden />
      </div>
    </div>
  )
}
