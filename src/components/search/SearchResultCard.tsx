import { Link } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import type { SiteSearchResult, SiteSearchSourceType } from '../../lib/search/types'
import { resolveContentMediaUrl } from '../../lib/cms/contentMedia'
import styles from './SearchBuddy.module.css'

const TYPE_KEY: Record<SiteSearchSourceType, string> = {
  page: 'searchBuddy.types.page',
  mezmur: 'searchBuddy.types.mezmur',
  zemari: 'searchBuddy.types.zemari',
  hymn_collection: 'searchBuddy.types.collection',
  hymn_section: 'searchBuddy.types.section',
  prayer: 'searchBuddy.types.prayer',
  prayer_collection: 'searchBuddy.types.prayerCollection',
  prayer_section: 'searchBuddy.types.prayerSection',
  liturgy: 'searchBuddy.types.liturgy',
  guide: 'searchBuddy.types.guide',
  calendar: 'searchBuddy.types.calendar',
  synaxarium: 'searchBuddy.types.synaxarium',
  synaxarium_commemoration: 'searchBuddy.types.synaxarium',
  'bible-book': 'searchBuddy.types.bibleBook',
  'bible-chapter': 'searchBuddy.types.bibleChapter',
  'bible-verse': 'searchBuddy.types.bibleVerse',
  'bible-range': 'searchBuddy.types.bibleRange',
  'bible-text': 'searchBuddy.types.bibleText',
  account: 'searchBuddy.types.account',
  other: 'searchBuddy.types.page',
}

function isBibleResult(result: SiteSearchResult): boolean {
  return result.sourceType.startsWith('bible')
}

export function SearchResultCard({
  result,
  onOpen,
  onPreview,
  preferPreview = false,
}: {
  result: SiteSearchResult
  onOpen?: (route: string) => void
  onPreview?: (result: SiteSearchResult) => void
  preferPreview?: boolean
}) {
  const t = useTranslation()
  const image = result.imagePath ? resolveContentMediaUrl(result.imagePath) : ''
  const typeLabel = t(TYPE_KEY[result.sourceType] ?? 'searchBuddy.types.page')
  const dateLine = result.dateLabel || ''
  const excerpt = result.excerpt?.trim() || ''
  const desc = dateLine || result.description
  const bible = isBibleResult(result)
  const openLabel = preferPreview
    ? t('searchBuddy.preview')
    : bible
      ? t('searchBuddy.openBible')
      : t('searchBuddy.open')
  const excerptLang =
    bible && (result.sourceLabel?.includes('Amharic') || /[\u1200-\u137F]/.test(excerpt))
      ? 'am'
      : undefined

  const body = (
    <>
      {image ? (
        <img className={styles.cardArt} src={image} alt="" loading="lazy" />
      ) : (
        <div className={styles.cardArtEmpty} aria-hidden />
      )}
      <div className={styles.cardBody}>
        <p className={styles.cardType}>{typeLabel}</p>
        {result.titleAmharic ? (
          <p className={styles.cardAm} lang="am">
            {result.titleAmharic}
          </p>
        ) : null}
        <h3 className={styles.cardTitle} lang={/[\u1200-\u137F]/.test(result.title) ? 'am' : undefined}>
          {result.title}
        </h3>
        {desc ? <p className={styles.cardDesc}>{desc}</p> : null}
        {excerpt && !preferPreview ? (
          <p className={styles.cardExcerpt} lang={excerptLang}>
            {excerpt}
          </p>
        ) : null}
        {result.sourceLabel && (preferPreview || bible) ? (
          <p className={styles.cardSource}>
            {t('searchBuddy.source')}: {result.sourceLabel}
          </p>
        ) : null}
        <span className={styles.cardOpen}>{openLabel}</span>
      </div>
    </>
  )

  if (preferPreview) {
    return (
      <button
        type="button"
        className={`${styles.card} ${styles.cardButton}`}
        onClick={() => {
          if (onPreview) onPreview(result)
          else onOpen?.(result.route)
        }}
      >
        {body}
      </button>
    )
  }

  return (
    <Link
      to={result.route}
      className={styles.card}
      state={{ fromSearchBuddy: true }}
      onClick={() => onOpen?.(result.route)}
    >
      {body}
    </Link>
  )
}
