import { useId } from 'react'
import { useTranslation } from '../../../i18n'
import type { AiAssistantResponse, AiScriptureSource } from '../../../lib/searchBuddy/apiTypes.ts'
import {
  coversRangeLabel,
  partitionAiSources,
  scriptureLanguageKey,
  scriptureVerseText,
} from '../../../lib/searchBuddy/aiSources.ts'
import { textOrNull } from './resultHelpers.ts'
import styles from './ResultCard.module.css'

function languageLabel(
  t: (key: string, params?: Record<string, string | number>) => string,
  language: string | null | undefined,
): string {
  const key = scriptureLanguageKey(language)
  if (key === 'en') return t('searchBuddy.scriptureLangEn')
  if (key === 'am') return t('searchBuddy.scriptureLangAm')
  const raw = textOrNull(language)
  return raw || t('searchBuddy.scriptureLangOther')
}

function ScripturePassage({
  source,
  index,
}: {
  source: AiScriptureSource
  index: number
}) {
  const t = useTranslation()
  const panelId = useId()
  const reference =
    textOrNull(source.reference) || t('searchBuddy.sourceN', { n: String(index + 1) })
  const body = scriptureVerseText(source)
  if (!body) return null

  const lang = languageLabel(t, source.language)
  const edition = textOrNull(source.edition)
  const mystery = textOrNull(source.mystery)
  const rangeParts = (source.verses || [])
    .map((row) => coversRangeLabel(row.covers_verse_range))
    .filter((label): label is string => Boolean(label))
  const rangeLabel = rangeParts[0] || null
  const langAttr =
    scriptureLanguageKey(source.language) === 'am'
      ? 'am'
      : scriptureLanguageKey(source.language) === 'en'
        ? 'en'
        : undefined

  const meta = [lang, edition, mystery ? t('searchBuddy.scriptureMystery', { mystery }) : null]
    .filter(Boolean)
    .join(' · ')

  return (
    <details
      className={styles.scriptureDetails}
      onToggle={(event) => {
        const el = event.currentTarget
        const summary = el.querySelector('summary')
        if (summary) summary.setAttribute('aria-expanded', el.open ? 'true' : 'false')
      }}
    >
      <summary
        className={styles.scriptureSummary}
        aria-controls={panelId}
        aria-expanded="false"
      >
        <span className={styles.scriptureSummaryMain}>
          <span className={styles.scriptureReference}>{reference}</span>
          {meta ? <span className={styles.scriptureMeta}>{meta}</span> : null}
          {rangeLabel ? (
            <span className={styles.scriptureRange}>
              {t('searchBuddy.scriptureCovers', { range: rangeLabel })}
            </span>
          ) : null}
        </span>
        <span className={styles.scriptureChevron} aria-hidden>
          ▾
        </span>
      </summary>
      <div id={panelId} className={styles.scriptureBody}>
        <p className={styles.scriptureText} lang={langAttr}>
          {body}
        </p>
      </div>
    </details>
  )
}

export function AiResponseCard({ data }: { data: AiAssistantResponse }) {
  const t = useTranslation()
  const answer = textOrNull(data.answer) || textOrNull(data.message)
  const { scripture, generic } = partitionAiSources(data.sources)
  const hasScripture = scripture.length > 0
  const hasGeneric = generic.length > 0

  if (!answer) {
    return (
      <p className={styles.emptyNote} role="status">
        {t('searchBuddy.aiEmpty')}
      </p>
    )
  }

  return (
    <article className={`${styles.card} ${styles.aiCard}`} aria-label={t('searchBuddy.aiAnswerLabel')}>
      <p className={styles.aiLabel}>{t('searchBuddy.aiAnswerLabel')}</p>
      <p className={styles.aiBody}>{answer}</p>

      {hasScripture ? (
        <section
          className={styles.scriptureBlock}
          aria-label={t('searchBuddy.verifiedPassagesHeading')}
        >
          <h3 className={styles.aiSourcesHeading}>{t('searchBuddy.verifiedPassagesHeading')}</h3>
          <p className={styles.scriptureNote}>{t('searchBuddy.verifiedPassagesNote')}</p>
          <div className={styles.scriptureList}>
            {scripture.map((source, index) => (
              <ScripturePassage
                key={`${textOrNull(source.reference) || 'passage'}-${index}`}
                source={source}
                index={index}
              />
            ))}
          </div>
        </section>
      ) : null}

      {hasGeneric ? (
        <div className={styles.aiSourcesBlock}>
          <p className={styles.aiSourcesHeading}>{t('searchBuddy.sourcesHeading')}</p>
          <ul className={styles.aiSources}>
            {generic.map((source, index) => {
              const title =
                textOrNull(source.title) || t('searchBuddy.sourceN', { n: String(index + 1) })
              const url = textOrNull(source.url)
              const excerpt = textOrNull(source.excerpt)
              return (
                <li key={`${title}-${index}`}>
                  {url ? (
                    <a href={url} target="_blank" rel="noopener noreferrer">
                      {title}
                    </a>
                  ) : (
                    <span>{title}</span>
                  )}
                  {excerpt ? (
                    <span className={styles.aiSourceExcerpt}> — {excerpt}</span>
                  ) : null}
                </li>
              )
            })}
          </ul>
        </div>
      ) : null}

      {!hasScripture && !hasGeneric ? (
        <p className={styles.aiNoSources}>{t('searchBuddy.noSources')}</p>
      ) : null}
    </article>
  )
}
