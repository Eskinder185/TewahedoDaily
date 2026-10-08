import { useEffect, useRef, type RefObject } from 'react'
import type { ChatMessage } from '../../lib/search/chatTypes'
import type { SiteSearchResult } from '../../lib/search/types'
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

  useEffect(() => {
    if (!stickToBottomRef.current) return
    endRef.current?.scrollIntoView({ block: 'end', behavior: 'smooth' })
  }, [messages, stickToBottomRef])

  return (
    <div ref={bodyRef} className={styles.body} onScroll={onBodyScroll}>
      <div className={styles.thread} role="log" aria-live="polite" aria-relevant="additions">
        {liveStatus ? (
          <p className={styles.srOnly} role="status">
            {liveStatus}
          </p>
        ) : null}

        {messages.map((msg) => (
          <article
            key={msg.id}
            className={
              msg.role === 'user'
                ? `${styles.chatMsg} ${styles.chatMsgUser}`
                : `${styles.chatMsg} ${styles.chatMsgAssistant}`
            }
            aria-label={msg.role === 'user' ? 'You' : 'Assistant'}
          >
            {msg.role === 'user' ? (
              <div className={styles.userBubble}>
                <p className={styles.userBubbleText}>{msg.text}</p>
              </div>
            ) : (
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
            )}
          </article>
        ))}
        <div ref={endRef} className={styles.threadEnd} aria-hidden />
      </div>
    </div>
  )
}
