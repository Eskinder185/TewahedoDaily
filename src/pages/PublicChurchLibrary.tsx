import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { useUrlChoice, useUrlSearchInput } from '../hooks/useUrlState'
import { supabase } from '../lib/supabase/client'
import { useTranslation } from '../i18n'
import { useLocale } from '../lib/i18n/locale'
import { getChurchLibraryCoverSignedUrl } from '../lib/cms/churchLibraryService'
import styles from './PublicChurchLibrary.module.css'

export type PublicBook = {
  id: string
  title: string
  title_amharic?: string | null
  author: string | null
  language: string
  category: string | null
  description: string | null
  cover_storage_path: string | null
  page_count?: number
  /** Structured (chapter/section) books open in the section reader. */
  slug?: string | null
}

const CATEGORIES = ['All', 'Theology', 'Church History', 'Prayers & Fasting', 'Scripture Commentaries', 'Patristics']
const CATEGORY_LABELS: Record<string, { en: string; am: string }> = {
  All: { en: 'All', am: 'ሁሉም' },
  Theology: { en: 'Theology', am: 'ሥነ መለኮት' },
  'Church History': { en: 'Church History', am: 'የቤተ ክርስቲያን ታሪክ' },
  'Prayers & Fasting': { en: 'Prayers & Fasting', am: 'ጸሎትና ጾም' },
  'Scripture Commentaries': { en: 'Scripture Commentaries', am: 'የመጽሐፍ ቅዱስ ትርጓሜ' },
  Patristics: { en: 'Patristics', am: 'የሊቃውንት ጽሑፎች' },
}

export function PublicChurchLibrary() {
  const t = useTranslation()
  const { locale } = useLocale()
  const [books, setBooks] = useState<PublicBook[]>([])
  const [loading, setLoading] = useState(true)
  const [loadError, setLoadError] = useState(false)
  const [retryTick, setRetryTick] = useState(0)
  const [searchQuery, setSearchQuery] = useUrlSearchInput()
  const [selectedCategory, setSelectedCategory] = useUrlChoice('category', 'All', CATEGORIES)
  const [coverUrls, setCoverUrls] = useState<Record<string, string>>({})

  useEffect(() => {
    let cancelled = false
    async function loadBooks() {
      setLoadError(false)
      if (!supabase) {
        setBooks([])
        setLoadError(true)
        setLoading(false)
        return
      }
      setLoading(true)
      try {
        // Newest columns first; each fallback keeps the public catalog working
        // while an additive migration is waiting to be applied to an older project.
        const columnSets = [
          'id, slug, title, title_amharic, author, language, category, description, cover_storage_path, storage_path, current_version_id',
          'id, title, title_amharic, author, language, category, description, cover_storage_path, storage_path, current_version_id',
          'id, title, author, language, category, description, cover_storage_path, storage_path, current_version_id',
        ]
        let data: unknown[] | null = null
        let error: { code?: string } | null = null
        for (const columns of columnSets) {
          const result = await supabase
            .from('church_library_books')
            .select(columns)
            .eq('public_retrieval_enabled', true)
            .eq('processing_status', 'ready')
            .order('title', { ascending: true })
          data = result.data
          error = result.error
          if (!(error?.code === '42703' || error?.code === 'PGRST204')) break
        }

        if (!cancelled) {
          if (!error && data) {
            const nextBooks = data as PublicBook[]
            setBooks(nextBooks)
            const covers = await Promise.all(nextBooks.map(async (book) => {
              const url = await getChurchLibraryCoverSignedUrl(book.cover_storage_path || '')
              return url ? [book.id, url] as const : null
            }))
            if (!cancelled) setCoverUrls(Object.fromEntries(covers.filter((item): item is readonly [string, string] => item !== null)))
          } else {
            setBooks([])
            setLoadError(true)
          }
        }
      } catch {
        if (!cancelled) {
          setBooks([])
          setLoadError(true)
        }
      } finally {
        if (!cancelled) setLoading(false)
      }
    }

    void loadBooks()
    return () => {
      cancelled = true
    }
  }, [retryTick])

  const filtered = useMemo(() => {
    return books.filter((book) => {
      const matchCat =
        selectedCategory === 'All' ||
        (book.category && book.category.toLowerCase().includes(selectedCategory.toLowerCase()))

      const query = searchQuery.trim().toLowerCase()
      const matchQuery =
        !query ||
        book.title.toLowerCase().includes(query) ||
        (book.title_amharic && book.title_amharic.toLowerCase().includes(query)) ||
        (book.author && book.author.toLowerCase().includes(query)) ||
        (book.description && book.description.toLowerCase().includes(query))

      return matchCat && matchQuery
    })
  }, [books, searchQuery, selectedCategory])

  return (
    <main className={styles.container}>
      <header className={styles.header}>
        <div className={styles.headerCopy}>
          <p className={styles.eyebrow}>{locale === 'am' ? 'የእምነት እና የእውቀት ማዕከል' : 'A living treasury of faith and learning'}</p>
          <h1 className={styles.title}>{t('library.title')}</h1>
          <p className={styles.subtitle}>{t('library.subtitle')}</p>
        </div>
        <div className={styles.headerSeal} aria-hidden="true">✦</div>
      </header>

      <div className={styles.controls} role="group" aria-label={locale === 'am' ? 'የመጻሕፍት ፍለጋ እና ማጣሪያ' : 'Book search and filters'}>
        <div className={styles.searchBar}>
          <span className={styles.searchIcon} aria-hidden="true">⌕</span>
          <input
            type="search"
            className={styles.searchInput}
            placeholder={t('library.searchPlaceholder')}
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            aria-label={locale === 'am' ? 'የቤተ ክርስቲያን መጻሕፍትን ይፈልጉ' : 'Search Church Library books'}
          />
        </div>

        <div className={styles.filterRow} role="tablist" aria-label={locale === 'am' ? 'የመጻሕፍት ምድቦች' : 'Book categories'}>
          {CATEGORIES.map((cat) => (
            <button
              key={cat}
              type="button"
              className={`${styles.filterPill} ${selectedCategory === cat ? styles.filterPillActive : ''}`}
              onClick={() => setSelectedCategory(cat)}
              role="tab"
              aria-selected={selectedCategory === cat}
              aria-controls="library-results"
            >
              {CATEGORY_LABELS[cat][locale]}
            </button>
          ))}
        </div>
      </div>

      {loading ? (
        <div className={styles.loadingState} role="status">
          <span className={styles.loadingMark} aria-hidden="true">✦</span>
          <p>{t('library.loading')}</p>
        </div>
      ) : loadError ? (
        <div className={styles.errorState} role="alert">
          <span className={styles.emptyIcon} aria-hidden="true">!</span>
          <p>{t('library.loadError')}</p>
          <button type="button" className={styles.retryButton} onClick={() => setRetryTick((value) => value + 1)}>
            {t('library.retry')}
          </button>
        </div>
      ) : filtered.length === 0 ? (
        <div className={styles.emptyState} role="status">
          <span className={styles.emptyIcon} aria-hidden="true">⌕</span>
          <p>{t('library.noBooks')}</p>
        </div>
      ) : (
        <div className={styles.libraryContent}>
          <div className={styles.collectionHeading}>
            <div>
              <p className={styles.eyebrow}>{locale === 'am' ? 'የታተሙ ስብስቦች' : 'Published collections'}</p>
              <h2>{locale === 'am' ? 'መጻሕፍትን ያስሱ' : 'Explore the shelves'}</h2>
            </div>
            <span aria-live="polite">{filtered.length} {locale === 'am' ? 'መጻሕፍት' : filtered.length === 1 ? 'book' : 'books'}</span>
          </div>
          <div className={styles.grid} id="library-results" role="tabpanel">
          {filtered.map((book) => (
            <article key={book.id} className={styles.card}>
              <div className={styles.coverFrame}>
                <span className={styles.coverFallback} aria-hidden="true">✦</span>
                {coverUrls[book.id] ? (
                  <img src={coverUrls[book.id]} alt="" loading="lazy" onError={(event) => { event.currentTarget.hidden = true }} />
                ) : null}
                <span className={styles.badge}>{book.language.toUpperCase()}</span>
              </div>
              <div className={styles.cardBody}>
                <div className={styles.cardHeader}>
                  <h3 className={styles.cardTitle}>{locale === 'am' && book.title_amharic ? book.title_amharic : book.title}</h3>
                </div>
                {locale === 'en' && book.title_amharic ? <p className={styles.cardAmharic} lang="am">{book.title_amharic}</p> : null}
                {book.author ? <p className={styles.cardAuthor}>{book.author}</p> : null}
                {book.description ? <p className={styles.description}>{book.description}</p> : null}
              </div>

              <div className={styles.cardFooter}>
                <span className={styles.cardCategory}>{book.category || (locale === 'am' ? 'አጠቃላይ' : 'General')}</span>
                <Link to={book.slug ? `/library/read/${encodeURIComponent(book.slug)}` : `/library/${book.id}`} className={styles.readButton}>
                  {t('library.read')} →
                </Link>
              </div>
            </article>
          ))}
          </div>
        </div>
      )}
    </main>
  )
}
