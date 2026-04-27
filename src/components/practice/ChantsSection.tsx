import { useEffect, useMemo, useState } from 'react'
import {
  CHANT_LIBRARY,
  chantEntryKey,
  type ChantForm,
  type ChantLibraryEntry,
} from '../../lib/practice/chantLibrary'
import {
  addRecentChantSearch,
  getRecentChantSearches,
  searchChants,
  matchesForm,
  type ChantFormFilter,
} from '../../lib/practice/chantSearch'
import { parseYoutubeVideoId, youtubeThumbnailUrl } from '../../data/utils/youtube'
import { youtubeThumbUrl } from '../../lib/practice'
import { mezmurDetailPath, mezmurShareUrl } from '../../lib/practice/mezmurSlug'
import { ChantLibraryPreview } from './ChantLibraryPreview'
import {
  chantEntryHasVideo,
  chantEntryToPracticePayload,
  type ChantPracticePayload,
} from './chantPracticeModel'
import { ChantPracticePlayer } from './ChantPracticePlayer'
import { CustomPracticeDrawer } from './CustomPracticeDrawer'
import { PracticeMediaCard } from './PracticeMediaCard'
import { chantMeaningTeaser } from '../../lib/practice/chantCardTeaser'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import styles from './ChantsSection.module.css'

const FORM_FILTER_IDS = ['all', 'mezmur', 'werb', 'marian', 'saints', 'feast-days'] as const
type FormFilter = (typeof FORM_FILTER_IDS)[number]

const FEATURED_COUNT = 6

function pickFeatured(entries: ChantLibraryEntry[]): ChantLibraryEntry[] {
  const withVid = entries.filter(chantEntryHasVideo)
  const rest = entries.filter((e) => !chantEntryHasVideo(e))
  const pool = [...withVid, ...rest]
  const englishFirst = pool.filter(
    (e) => e.form === 'mezmur' && e.item.language === 'en',
  )
  const restPool = pool.filter(
    (e) => !(e.form === 'mezmur' && e.item.language === 'en'),
  )
  const prioritized = [...englishFirst.slice(0, 2), ...restPool, ...englishFirst.slice(2)]
  const seen = new Set<string>()
  const out: ChantLibraryEntry[] = []
  for (const e of prioritized) {
    const k = chantEntryKey(e)
    if (seen.has(k)) continue
    seen.add(k)
    out.push(e)
    if (out.length >= FEATURED_COUNT) break
  }
  return out
}

function chantThumbnail(entry: ChantLibraryEntry): string | undefined {
  if (entry.form === 'mezmur') {
    const m = entry.item
    return m.thumbnailUrl ?? youtubeThumbUrl(m.youtubeId)
  }
  const w = entry.item
  if (w.thumbnail) return w.thumbnail
  const id = w.youtubeUrl ? parseYoutubeVideoId(w.youtubeUrl) : null
  return id ? youtubeThumbnailUrl(id) : undefined
}

function chantSubtitle(entry: ChantLibraryEntry): string | undefined {
  if (entry.form === 'mezmur') {
    const t = entry.item.titleTransliteration?.trim()
    return t || undefined
  }
  return entry.item.teaser ?? (entry.item.transliterationTitle?.trim() || undefined)
}

export function ChantsSection() {
  const t = useUiLabel()
  
  const [practiceEntry, setPracticeEntry] = useState<ChantLibraryEntry | null>(
    null,
  )
  const [customPayload, setCustomPayload] = useState<ChantPracticePayload | null>(
    null,
  )
  const [browseAll, setBrowseAll] = useState(false)
  const [q, setQ] = useState('')
  const [formFilter, setFormFilter] = useState<FormFilter>('all')
  const [recentSearches, setRecentSearches] = useState<string[]>([])
  const [customDrawerOpen, setCustomDrawerOpen] = useState(false)
  const [copiedLink, setCopiedLink] = useState(false)

  useEffect(() => {
    setRecentSearches(getRecentChantSearches())
  }, [])

  const formBadge = (form: ChantForm) =>
    form === 'mezmur' ? t('chantTypeMezmur') : t('chantTypeWerb')

  const formFilterLabel = (id: FormFilter) => {
    if (id === 'all') return t('filterAll')
    if (id === 'marian') return t('filterMarian')
    if (id === 'saints') return t('filterSaints')
    if (id === 'feast-days') return t('filterFeastDays')
    return formBadge(id)
  }

  const filteredByForm = useMemo(
    () =>
      CHANT_LIBRARY.filter((e) =>
        matchesForm(e, formFilter as ChantFormFilter),
      ),
    [formFilter],
  )

  const featured = useMemo(
    () => pickFeatured(filteredByForm),
    [filteredByForm],
  )

  const qTrim = q.trim()
  const showFeatured = !browseAll && !qTrim

  const gridEntries = useMemo(() => {
    if (qTrim) return searchChants(q, formFilter as ChantFormFilter)
    if (browseAll) return filteredByForm
    return []
  }, [qTrim, browseAll, formFilter, filteredByForm])

  const openChant = (entry: ChantLibraryEntry) => {
    if (qTrim.length >= 2) {
      addRecentChantSearch(qTrim)
      setRecentSearches(getRecentChantSearches())
    }
    setCustomPayload(null)
    setPracticeEntry(entry)
  }

  const onCopyMezmurLink = () => {
    setCopiedLink(true)
    window.setTimeout(() => setCopiedLink(false), 1800)
  }

  const openCustomPractice = (payload: ChantPracticePayload) => {
    setPracticeEntry(null)
    setCustomPayload(payload)
  }

  const applyRecent = (s: string) => {
    setQ(s)
    setBrowseAll(true)
  }

  if (practiceEntry) {
    const payload = chantEntryToPracticePayload(practiceEntry)
    return (
      <div className={styles.root}>
        <ChantPracticePlayer
          payload={payload}
          formLabel={formBadge(practiceEntry.form)}
          onBack={() => setPracticeEntry(null)}
        />
      </div>
    )
  }

  if (customPayload) {
    return (
      <div className={styles.root}>
        <ChantPracticePlayer
          payload={customPayload}
          formLabel={t('practiceCustomFormLabel')}
          learnTabLabel={t('practiceCustomLearnTab')}
          voiceTabLabel={t('practiceCustomVoiceTab')}
          onBack={() => setCustomPayload(null)}
        />
      </div>
    )
  }

  return (
    <div className={styles.root}>
      <p className={styles.chantHelper}>{t('practiceChantsHelper')}</p>
      {copiedLink ? (
        <p className={styles.copyToast} role="status">
          Link copied
        </p>
      ) : null}

      <section
        className={styles.chantTools}
        aria-label={t('searchChants')}
      >
        <div className={styles.searchRow}>
          <label className={styles.searchLabel}>
            <span className={styles.searchText}>{t('searchChants')}</span>
            <div className={styles.searchInputWrap}>
              <input
                type="search"
                className={styles.search}
                placeholder={t('chantSearchPlaceholder')}
                value={q}
                onChange={(e) => setQ(e.target.value)}
                autoComplete="off"
                enterKeyHint="search"
                spellCheck={false}
              />
              {qTrim ? (
                <button
                  type="button"
                  className={styles.searchClear}
                  onClick={() => setQ('')}
                  aria-label={t('chantSearchClear')}
                >
                  ×
                </button>
              ) : null}
            </div>
          </label>
          <div className={styles.searchCustomRow}>
            <p className={styles.searchCustomHint}>{t('practiceCustomSearchHint')}</p>
            <button
              type="button"
              className={styles.customGhostBtn}
              onClick={() => setCustomDrawerOpen(true)}
            >
              {t('practiceCustomOpenDrawer')}
            </button>
          </div>
        </div>

        {recentSearches.length > 0 && !qTrim ? (
          <div className={styles.recent}>
            <span className={styles.recentLabel}>{t('chantRecentSearches')}</span>
            <div className={styles.recentChips}>
              {recentSearches.map((s) => (
                <button
                  key={s}
                  type="button"
                  className={styles.recentChip}
                  onClick={() => applyRecent(s)}
                >
                  {s}
                </button>
              ))}
            </div>
          </div>
        ) : null}

        <div
          className={styles.filters}
          role="group"
          aria-label="Chant type"
        >
          {FORM_FILTER_IDS.map((id) => (
            <button
              key={id}
              type="button"
              className={`${styles.filter} ${formFilter === id ? styles.filterOn : ''}`}
              onClick={() => setFormFilter(id)}
            >
              {formFilterLabel(id)}
            </button>
          ))}
        </div>

        {(browseAll || qTrim) ? (
          <p className={styles.count} role="status">
            {t('chantSearchResults').replace(
              '{n}',
              String(gridEntries.length),
            )}
          </p>
        ) : null}
      </section>

      {showFeatured ? (
        <>
          <ChantLibraryPreview
            entries={featured}
            onSelect={openChant}
            onCopyLink={onCopyMezmurLink}
          />
          <div className={styles.browseActions}>
            <button
              type="button"
              className={styles.browsePrimary}
              onClick={() => setBrowseAll(true)}
            >
              {t('browseAll')}
            </button>
            <button
              type="button"
              className={styles.browseSecondary}
              onClick={() => setBrowseAll(true)}
            >
              {t('seeMore')}
            </button>
          </div>
          <p className={styles.browseNote}>
            {CHANT_LIBRARY.length} {t('chantLibraryNote')}
          </p>
        </>
      ) : (
        <>
          <div className={styles.browseToolbar}>
            <button
              type="button"
              className={styles.collapseBrowse}
              onClick={() => {
                setBrowseAll(false)
                setQ('')
              }}
            >
              {t('backToFeatured')}
            </button>
          </div>

          {gridEntries.length === 0 ? (
            <div className={styles.emptyState}>
              <p className={styles.emptyTitle}>{t('practiceChantNoMatchTitle')}</p>
              <p className={styles.emptyDeck}>{t('practiceChantNoMatchDeck')}</p>
              <button
                type="button"
                className={styles.emptyCustomBtn}
                onClick={() => setCustomDrawerOpen(true)}
              >
                {t('practiceCustomPasteYoutubeCta')}
              </button>
            </div>
          ) : (
            <ul className={styles.grid}>
              {gridEntries.map((entry) => {
                const isMezmur = entry.form === 'mezmur'
                return (
                  <li key={chantEntryKey(entry)}>
                    <PracticeMediaCard
                      title={entry.item.title}
                      imageUrl={chantThumbnail(entry)}
                      subtitle={chantSubtitle(entry)}
                      teaserLine={chantMeaningTeaser(entry)}
                      {...(isMezmur
                        ? {
                            internalHref: mezmurDetailPath(entry.item.slug),
                            copyHref: mezmurShareUrl(entry.item.slug),
                            onCopyLink: onCopyMezmurLink,
                            onOpen: () => {
                              if (qTrim.length >= 2) {
                                addRecentChantSearch(qTrim)
                                setRecentSearches(getRecentChantSearches())
                              }
                            },
                          }
                        : { onSelect: () => openChant(entry) })}
                      tag={formBadge(entry.form)}
                    />
                  </li>
                )
              })}
            </ul>
          )}
        </>
      )}

      <CustomPracticeDrawer
        open={customDrawerOpen}
        onClose={() => setCustomDrawerOpen(false)}
        onLoad={openCustomPractice}
      />
    </div>
  )
}
