import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { supabase } from '../lib/supabase/client'
import { useTranslation } from '../i18n'
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
}

const CATEGORIES = ['All', 'Theology', 'Church History', 'Prayers & Fasting', 'Scripture Commentaries', 'Patristics']

export function PublicChurchLibrary() {
  const t = useTranslation()
  const [books, setBooks] = useState<PublicBook[]>([])
  const [loading, setLoading] = useState(true)
  const [searchQuery, setSearchQuery] = useState('')
  const [selectedCategory, setSelectedCategory] = useState('All')

  useEffect(() => {
    let cancelled = false
    async function loadBooks() {
      if (!supabase) {
        setBooks([])
        setLoading(false)
        return
      }
      setLoading(true)
      try {
        const result = await supabase
          .from('church_library_books')
          .select('id, title, title_amharic, author, language, category, description, cover_storage_path, storage_path, current_version_id')
          .eq('public_retrieval_enabled', true)
          .eq('processing_status', 'ready')
          .order('title', { ascending: true })

        // Keep the public catalog working while the additive metadata migration
        // is waiting to be applied to an older linked project.
        const fallback = result.error?.code === '42703' || result.error?.code === 'PGRST204'
          ? await supabase
            .from('church_library_books')
            .select('id, title, author, language, category, description, cover_storage_path, storage_path, current_version_id')
            .eq('public_retrieval_enabled', true)
            .eq('processing_status', 'ready')
            .order('title', { ascending: true })
          : null
        const data = fallback?.data || result.data
        const error = fallback?.error || result.error

        if (!cancelled) {
          if (!error && data) {
            setBooks(data as PublicBook[])
          } else {
            setBooks([])
          }
        }
      } catch {
        if (!cancelled) setBooks([])
      } finally {
        if (!cancelled) setLoading(false)
      }
    }

    void loadBooks()
    return () => {
      cancelled = true
    }
  }, [])

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
    <div className={styles.container}>
      <header className={styles.header}>
        <h1 className={styles.title}>{t('library.title')}</h1>
        <p className={styles.subtitle}>
          {t('library.subtitle')}
        </p>
      </header>

      <div className={styles.controls}>
        <div className={styles.searchBar}>
          <span aria-hidden>🔍</span>
          <input
            type="search"
            className={styles.searchInput}
            placeholder={t('library.searchPlaceholder')}
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            aria-label="Search Church Library books"
          />
        </div>

        <div className={styles.filterRow} role="tablist" aria-label="Book categories">
          {CATEGORIES.map((cat) => (
            <button
              key={cat}
              type="button"
              className={`${styles.filterPill} ${selectedCategory === cat ? styles.filterPillActive : ''}`}
              onClick={() => setSelectedCategory(cat)}
              role="tab"
              aria-selected={selectedCategory === cat}
            >
              {cat}
            </button>
          ))}
        </div>
      </div>

      {loading ? (
        <div className={styles.loadingSpinner}>
          <p>{t('library.loading')}</p>
        </div>
      ) : filtered.length === 0 ? (
        <div className={styles.emptyState}>
          <p>{t('library.noBooks')}</p>
        </div>
      ) : (
        <div className={styles.grid}>
          {filtered.map((book) => (
            <article key={book.id} className={styles.card}>
              <div>
                <div className={styles.cardHeader}>
                  <h2 className={styles.cardTitle}>{book.title}</h2>
                  <span className={styles.badge}>{book.language.toUpperCase()}</span>
                </div>
                {book.title_amharic ? <p className={styles.cardAuthor}>{book.title_amharic}</p> : null}
                {book.author ? <p className={styles.cardAuthor}>{book.author}</p> : null}
                {book.description ? <p className={styles.description}>{book.description}</p> : null}
              </div>

              <div className={styles.cardFooter}>
                <span className={styles.cardAuthor}>{book.category || 'General'}</span>
                <Link to={`/library/${book.id}`} className={styles.readButton}>
                  {t('library.read')} →
                </Link>
              </div>
            </article>
          ))}
        </div>
      )}
    </div>
  )
}
