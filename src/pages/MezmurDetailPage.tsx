import { useEffect, useMemo, useState } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { useTranslation } from '../i18n'
import { PageSection } from '../components/ui/PageSection'
import { ChantPracticePlayer } from '../components/practice/ChantPracticePlayer'
import { chantEntryToPracticePayload } from '../components/practice/chantPracticeModel'
import { findMezmurInLibrary } from '../lib/practice/chantLibraryModel'
import { mezmurShareUrl } from '../lib/practice/mezmurSlug'
import type { MezmurItem } from '../lib/practice/types'
import { useChantLibrary } from '../hooks/useChantLibrary'
import styles from './MezmurDetailPage.module.css'

function mezmurDescription(item: MezmurItem, fallback: string): string {
  return (
    item.meaning?.trim() ||
    item.titleTransliteration?.trim() ||
    fallback
  )
}

function upsertMeta(selector: string, attrs: Record<string, string>, value: string) {
  let el = document.head.querySelector<HTMLMetaElement>(selector)
  if (!el) {
    el = document.createElement('meta')
    for (const [key, attrValue] of Object.entries(attrs)) {
      el.setAttribute(key, attrValue)
    }
    document.head.appendChild(el)
  }
  el.setAttribute('content', value)
}

function mezmurBadges(item: MezmurItem): string[] {
  return [
    item.category ? item.category.replace(/-/g, ' ') : '',
    ...(item.categoryThemes ?? []),
    ...(item.categoryUsage ?? []),
  ]
    .map((x) => x.trim())
    .filter(Boolean)
    .filter((x, i, arr) => arr.indexOf(x) === i)
    .slice(0, 4)
}

export function MezmurDetailPage() {
  const t = useTranslation()
  const { slug } = useParams()
  const navigate = useNavigate()
  const { entries, isLoading } = useChantLibrary()
  const item = useMemo(() => findMezmurInLibrary(entries, slug), [entries, slug])
  const [copied, setCopied] = useState(false)

  const shareUrl = item ? mezmurShareUrl(item.slug) : ''
  const payload = useMemo(
    () =>
      item
        ? chantEntryToPracticePayload({
            form: 'mezmur',
            item,
          })
        : null,
    [item],
  )

  useEffect(() => {
    if (isLoading) return
    const previousTitle = document.title
    if (!item) {
      document.title = `Tewahedo Daily | ${t('mezmurPractice.player.notFoundTitle')}`
      return () => {
        document.title = previousTitle
      }
    }

    const title = `Tewahedo Daily | ${item.titleTransliteration || item.title}`
    const description = mezmurDescription(
      item,
      t('mezmurPractice.player.metaDescription', { title: item.title }),
    )
    document.title = title
    upsertMeta('meta[name="description"]', { name: 'description' }, description)
    upsertMeta('meta[property="og:title"]', { property: 'og:title' }, title)
    upsertMeta('meta[property="og:description"]', { property: 'og:description' }, description)
    if (item.thumbnailUrl) {
      upsertMeta('meta[property="og:image"]', { property: 'og:image' }, item.thumbnailUrl)
    }

    return () => {
      document.title = previousTitle
    }
  }, [isLoading, item, t])

  const copyShareLink = async () => {
    if (!shareUrl) return
    try {
      await navigator.clipboard.writeText(shareUrl)
      setCopied(true)
      window.setTimeout(() => setCopied(false), 1800)
    } catch {
      window.prompt(t('mezmurPractice.library.copyPrompt'), shareUrl)
    }
  }

  if (isLoading) {
    return (
      <PageSection variant="tint">
        <div className={styles.notFound} role="status" aria-live="polite">
          <p className={styles.notFoundDeck}>{t('practice.loading')}</p>
        </div>
      </PageSection>
    )
  }

  if (!item || !payload) {
    return (
      <PageSection variant="tint">
        <div className={styles.notFound}>
          <p className={styles.eyebrow}>{t('mezmurPractice.player.notFoundEyebrow')}</p>
          <h1 className={styles.notFoundTitle}>{t('mezmurPractice.player.notFoundTitle')}</h1>
          <p className={styles.notFoundDeck}>
            {t('mezmurPractice.player.notFoundDeck')}
          </p>
          <Link to="/practice" className={styles.primaryLink}>
            {t('mezmurPractice.player.backToPractice')}
          </Link>
        </div>
      </PageSection>
    )
  }

  return (
    <PageSection variant="tint">
      <div className={styles.shell}>
        <ChantPracticePlayer
          payload={payload}
          formLabel={t('mezmurPractice.library.mezmur')}
          onBack={() => navigate('/practice')}
          backLabel={t('mezmurPractice.player.backToPractice')}
          badges={mezmurBadges(item)}
          footerActions={
            <div className={styles.shareGroup}>
              <Link className={styles.shareBtn} to={`/suggest-correction?${new URLSearchParams({ type: 'correction', legacy_key: `mezmur:${item.id}`, title: item.title, page: window.location.origin + window.location.pathname })}`}>
                Suggest a Correction
              </Link>
              <button type="button" className={styles.shareBtn} onClick={copyShareLink}>
                🔗 {t('mezmurPractice.player.share')}
              </button>
              {copied ? (
                <span className={styles.copied} role="status">
                  {t('mezmurPractice.library.linkCopied')}
                </span>
              ) : null}
            </div>
          }
        />
      </div>
    </PageSection>
  )
}
