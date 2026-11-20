import { useEffect, useState } from 'react'
import { Link, useParams, useSearchParams } from 'react-router-dom'
import {
  getHymnCollectionBySlug,
  loadBrowseGroupChildren,
  type HymnBrowseCard,
  type HymnCollection,
} from '../lib/publicContent/hymnBrowse'
import { hymnMezmurCountLabel, hymnSourceHeading } from '../lib/publicContent/hymnBrowseLabels'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import { useTranslation } from '../i18n'
import { useLocale } from '../lib/i18n/locale'
import { HymnBrowseCardView } from '../components/practice/HymnBrowseCard'
import s from './HymnPractice.module.css'
import { MEZMUR_LANGUAGES, isMezmurLanguageFilter, type MezmurLanguageFilter } from '../lib/mezmur/mezmurLanguage'
import type { MezmurFormFilter } from '../lib/mezmur/mezmurForm'

function withBrowseParams(href: string, language?: string | null, werbOnly?: boolean) {
  const [pathPart, existingSearch = ''] = href.split('?')
  const next = new URLSearchParams(existingSearch)
  if (language && language !== 'all') next.set('language', language)
  if (werbOnly) next.set('form', 'werb')
  const qs = next.toString()
  return qs ? `${pathPart}?${qs}` : pathPart
}

/**
 * Level 2 — sections under a hymn collection.
 * Route: /practice/browse/:collectionSlug  (and /hymns/browse/:collectionSlug)
 */
export function PublicHymnBrowseGroupPage() {
  const { slug = '' } = useParams()
  const [params, setParams] = useSearchParams()
  const language = params.get('language')
  const werbOnly = params.get('form') === 'werb'
  const formFilter: MezmurFormFilter = werbOnly ? 'werb' : 'all'
  const [group, setGroup] = useState<HymnCollection | null>(null)
  const [children, setChildren] = useState<HymnBrowseCard[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string>()
  const [reloadTick, setReloadTick] = useState(0)
  const [imageFailed, setImageFailed] = useState(false)
  const t = useTranslation()
  const { locale } = useLocale()
  const heading = hymnSourceHeading(group?.title, group?.titleAmharic, locale)
  const description = hymnSourceHeading(group?.description, group?.descriptionAmharic, locale)
  const selectedLanguage: MezmurLanguageFilter = isMezmurLanguageFilter(language) ? language : 'all'

  useEffect(() => setImageFailed(false), [group?.imageUrl])

  usePageMeta(
    heading.primary || t('practice.browse'),
    description.primary || t('practice.metaBrowse'),
  )

  useEffect(() => {
    let active = true
    setLoading(true)
    setError(undefined)
    void (async () => {
      try {
        const langFilter: MezmurLanguageFilter | undefined = isMezmurLanguageFilter(language) ? language : undefined
        const collection = await getHymnCollectionBySlug(slug, langFilter, formFilter)
        if (!active) return
        setGroup(collection)
        if (!collection) {
          setChildren([])
          return
        }
        const { children: next } = await loadBrowseGroupChildren(collection.slug, langFilter, formFilter)
        if (!active) return
        setChildren(next)
      } catch (cause) {
        if (!active) return
        if (import.meta.env.DEV) console.error('[hymn practice] collection', cause)
        setError(t('practice.loadError'))
      } finally {
        if (active) setLoading(false)
      }
    })()
    return () => {
      active = false
    }
  }, [slug, reloadTick, t, language, formFilter])

  const setForm = (nextWerb: boolean) => {
    const next = new URLSearchParams(params)
    if (nextWerb) next.set('form', 'werb')
    else next.delete('form')
    setParams(next)
  }

  return (
    <section className={s.page}>
      <p className={s.backRow}>
        <Link to={withBrowseParams('/hymns', language, werbOnly)} className={s.viewAll}>
          ← {t('practice.title')}
        </Link>
      </p>

      <header className={s.browseGroupHeader}>
        {group?.imageUrl && !imageFailed ? (
          <img className={s.collectionThumb} src={group.imageUrl} alt="" width="320" height="200" loading="eager" decoding="async" onError={() => setImageFailed(true)} />
        ) : (
          <div className={s.collectionThumbEmpty} aria-hidden>✣</div>
        )}
        <div>
          <p className={s.eyebrow}>{werbOnly ? (locale === 'am' ? 'ወረብ · ስብስብ' : 'Werb · Collection') : t('practice.collection')}</p>
          {heading.secondary ? <p className={s.collectionAm} lang={heading.secondaryLang || undefined}>{heading.secondary}</p> : null}
          <h1 className={s.title} lang={heading.primary ? heading.primaryLang : undefined}>
            {heading.primary || (loading ? '…' : t('practice.notFound'))}
          </h1>
          {description.primary ? <p className={s.subtitle} lang={description.primaryLang}>{description.primary}</p> : null}
          {group ? <p className={s.collectionCount}>{hymnMezmurCountLabel(group.mezmurCount, locale)}</p> : null}
        </div>
      </header>

      <div className={s.formSelector} role="group" aria-label={locale === 'am' ? 'የመዝሙር ዓይነት' : 'Hymn type'} data-testid="werb-card">
        <button type="button" aria-pressed={!werbOnly} className={!werbOnly ? s.formSelectorActive : s.formSelectorButton} onClick={() => setForm(false)}>
          {locale === 'am' ? 'ሁሉም መዝሙራት' : 'All Hymns'}
        </button>
        <button type="button" aria-pressed={werbOnly} className={werbOnly ? s.formSelectorActive : s.formSelectorButton} onClick={() => setForm(true)}>
          {locale === 'am' ? <span lang="am">ወረብ</span> : <><span>Werb</span><span aria-hidden="true"> · </span><span lang="am">ወረብ</span></>}
        </button>
      </div>

      <div className={s.languageChipsCompact} role="group" aria-label={t('practice.languageFilter')}>
        <Link className={selectedLanguage === 'all' ? s.languageChipActive : s.languageChip} aria-current={selectedLanguage === 'all' ? 'true' : undefined} to={withBrowseParams(`/hymns/browse/${slug}`, null, werbOnly)}>{t('practice.languages.all')}</Link>
        {MEZMUR_LANGUAGES.map((item) => <Link key={item.code} className={selectedLanguage === item.code ? s.languageChipActive : s.languageChip} aria-current={selectedLanguage === item.code ? 'true' : undefined} to={withBrowseParams(`/hymns/browse/${slug}`, item.code, werbOnly)}>{t(`practice.languages.${item.code}`)}</Link>)}
      </div>

      {loading ? (
        <div className={s.browseGrid} aria-hidden>
          {Array.from({ length: 6 }).map((_, i) => (
            <div key={i} className={s.skeletonCard}>
              <div className={s.skeletonMedia} />
              <div className={s.skeletonLines}>
                <div className={s.skeletonLine} />
                <div className={`${s.skeletonLine} ${s.skeletonLineShort}`} />
              </div>
            </div>
          ))}
        </div>
      ) : null}

      {error ? (
        <div className={s.status} role="alert">
          <p>{error}</p>
          <button type="button" className={s.textBtn} onClick={() => setReloadTick((n) => n + 1)}>
            {t('practice.retry')}
          </button>
        </div>
      ) : null}

      {!loading && !error && group && !children.length ? (
        <p className={s.browseEmpty}>
          {werbOnly
            ? (locale === 'am' ? 'በዚህ ስብስብ ውስጥ ወረብ የለም። ' : 'No Werb found in this collection. ')
            : t('practice.noSections')}{' '}
          <Link to={withBrowseParams('/hymns', language, werbOnly)}>{t('practice.title')}</Link>
        </p>
      ) : null}

      {!loading && !error && !group ? (
        <p className={s.status}>{t('practice.collectionNotFound')}</p>
      ) : null}

      {!loading && children.length > 0 ? (
        <div className={s.browseGrid}>
          {children.map((card, index) => (
            <HymnBrowseCardView key={card.id} card={{ ...card, href: withBrowseParams(card.href, language, werbOnly) }} priority={index < 3} />
          ))}
        </div>
      ) : null}
    </section>
  )
}
