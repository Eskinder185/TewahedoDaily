import { useEffect, useMemo, useState } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import { ChantPracticePlayer } from '../components/practice/ChantPracticePlayer'
import { chantEntryToPracticePayload } from '../components/practice/chantPracticeModel'
import { findMezmurBySlug } from '../lib/practice/mezmurData'
import { mezmurShareUrl } from '../lib/practice/mezmurSlug'
import type { MezmurItem } from '../lib/practice/types'
import styles from './MezmurDetailPage.module.css'

function mezmurDescription(item: MezmurItem): string {
  return (
    item.meaning?.trim() ||
    item.titleTransliteration?.trim() ||
    `Practice ${item.title} with lyrics and video on Tewahedo Daily.`
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
  const { slug } = useParams()
  const navigate = useNavigate()
  const item = findMezmurBySlug(slug)
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
    const previousTitle = document.title
    if (!item) {
      document.title = 'Tewahedo Daily | Mezmur not found'
      return () => {
        document.title = previousTitle
      }
    }

    const title = `Tewahedo Daily | ${item.titleTransliteration || item.title}`
    const description = mezmurDescription(item)
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
  }, [item])

  const copyShareLink = async () => {
    if (!shareUrl) return
    try {
      await navigator.clipboard.writeText(shareUrl)
      setCopied(true)
      window.setTimeout(() => setCopied(false), 1800)
    } catch {
      window.prompt('Copy mezmur link', shareUrl)
    }
  }

  if (!item || !payload) {
    return (
      <PageSection variant="tint">
        <div className={styles.notFound}>
          <p className={styles.eyebrow}>Mezmur</p>
          <h1 className={styles.notFoundTitle}>Mezmur not found</h1>
          <p className={styles.notFoundDeck}>
            This direct link does not match a mezmur in the Practice library.
          </p>
          <Link to="/practice" className={styles.primaryLink}>
            Back to Practice
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
          formLabel="Mezmur"
          onBack={() => navigate('/practice')}
          backLabel="Back to Practice"
          badges={mezmurBadges(item)}
          headerActions={
            <div className={styles.shareGroup}>
              <button type="button" className={styles.shareBtn} onClick={copyShareLink}>
                Share
              </button>
              {copied ? (
                <span className={styles.copied} role="status">
                  Link copied
                </span>
              ) : null}
            </div>
          }
        />
      </div>
    </PageSection>
  )
}
