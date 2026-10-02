import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import {
  detail,
  publicMezmurToPracticePayload,
  type PublicMezmur,
} from '../lib/publicContent/service'
import { classificationLabel } from '../lib/publicContent/labels'
import { displayClassification } from '../lib/publicContent/taxonomy'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import { useAsync } from '../lib/cms/useAsync'
import { FavoriteButton } from '../components/publicContent/FavoriteButton'
import { recordGuestRecentMezmur } from '../lib/userContent/guestStorage'
import { ChantPracticePlayer } from '../components/practice/ChantPracticePlayer'
import {
  clearCustomHymnVideo,
  normalizeYoutubePracticeUrl,
  readCustomHymnVideo,
  writeCustomHymnVideo,
} from '../lib/publicContent/customVideo'
import { parseYoutubeVideoId } from '../data/utils/youtube'
import s from './HymnPractice.module.css'

export function PublicMezmurDetail() {
  const { slug } = useParams()
  const result = useAsync(useCallback(() => detail(slug || ''), [slug]))

  return (
    <section className={s.page}>
      {result.loading ? <p role="status">Loading hymn…</p> : null}
      {result.error ? (
        <div className={s.errorBox} role="alert">
          <p>{result.error}</p>
          <button type="button" className={s.primaryBtn} onClick={result.reload}>
            Try again
          </button>
        </div>
      ) : null}
      {!result.loading && !result.error && !result.data ? (
        <div className={s.empty}>
          <h1 className={s.title}>Hymn not found</h1>
          <p>This hymn is not currently published.</p>
          <div className={s.ctaRow}>
            <Link to="/practice">Back to library</Link>
            <Link to="/submit-mezmur">Contribute a Mezmur</Link>
          </div>
        </div>
      ) : null}
      {result.data ? <PracticeBody key={result.data.id} item={result.data} /> : null}
    </section>
  )
}

function PracticeBody({ item }: { item: PublicMezmur }) {
  const navigate = useNavigate()
  const [customDraft, setCustomDraft] = useState('')
  const [customError, setCustomError] = useState('')
  const [copied, setCopied] = useState(false)
  const [customUrl, setCustomUrl] = useState<string | null>(() => readCustomHymnVideo(item.slug))

  useEffect(() => {
    setCustomUrl(readCustomHymnVideo(item.slug))
    setCustomDraft('')
    setCustomError('')
    recordGuestRecentMezmur(item.slug, item.title)
  }, [item.slug, item.title])

  const libraryUrl = item.youtube_url || ''
  const activeUrl = customUrl || libraryUrl
  const usingCustom = Boolean(customUrl)
  const canonical = `${window.location.origin}/practice/mezmur/${item.slug}`
  const payload = useMemo(
    () => publicMezmurToPracticePayload(item, activeUrl),
    [item, activeUrl],
  )

  const languageLabel = item.language ? classificationLabel(item.language) : null
  const categoryLabel = displayClassification(item.category_name || item.category)
  const occasionLabel = displayClassification(
    item.occasion ? classificationLabel(item.occasion) || item.occasion : null,
  )

  const badges = [languageLabel].filter(Boolean) as string[]

  const classificationLines = [
    categoryLabel ? `Category: ${categoryLabel}` : null,
    occasionLabel ? `Occasion: ${occasionLabel}` : null,
  ].filter(Boolean) as string[]

  usePageMeta(
    item.title,
    (item.description || `${item.title} — practice on Tewahedo Daily`).slice(0, 180),
    item.thumbnail_url?.startsWith('https:') ? item.thumbnail_url : undefined,
    canonical,
  )

  const loadCustom = () => {
    const normalized = normalizeYoutubePracticeUrl(customDraft)
    if (!normalized) {
      setCustomError('Please enter a valid YouTube URL.')
      return
    }
    if (!writeCustomHymnVideo(item.slug, normalized)) {
      setCustomError('Please enter a valid YouTube URL.')
      return
    }
    setCustomUrl(normalized)
    setCustomError('')
    setCustomDraft('')
  }

  const resetCustom = () => {
    clearCustomHymnVideo(item.slug)
    setCustomUrl(null)
    setCustomError('')
  }

  const copyActive = async () => {
    const url = activeUrl || (payload.videoId ? `https://www.youtube.com/watch?v=${payload.videoId}` : '')
    if (!url) return
    try {
      await navigator.clipboard.writeText(url)
      setCopied(true)
      window.setTimeout(() => setCopied(false), 1600)
    } catch {
      window.prompt('Copy video link', url)
    }
  }

  const suggestHref = customUrl
    ? `/suggest-correction?${new URLSearchParams({
        content_id: item.id,
        title: item.title,
        page: canonical,
        youtube_url: customUrl,
        type: 'correction',
      })}`
    : ''

  return (
    <div>
      <ChantPracticePlayer
        payload={payload}
        formLabel={item.form === 'werb' ? 'Werb' : 'Mezmur'}
        badges={badges}
        onBack={() => navigate('/practice')}
        backLabel="Back to library"
        footerActions={
          <div className={s.customActions}>
            <FavoriteButton
              id={item.id}
              contentType="mezmur"
              contentSlug={item.slug}
              title={item.title}
              route={`/practice/mezmur/${item.slug}`}
            />
            {activeUrl || payload.videoId ? (
              <button type="button" className={s.footerActionBtn} onClick={copyActive}>
                {copied ? 'Copied' : '🔗 Copy video link'}
              </button>
            ) : null}
          </div>
        }
      />

      {classificationLines.length > 0 ? (
        <p className={s.metaLine}>{classificationLines.join(' · ')}</p>
      ) : null}

      <div className={s.customVideo}>
        <strong>Use another YouTube video</strong>
        <p className={s.metaLine}>
          {usingCustom ? 'Your selected recording' : 'Official / Library recording'}
          {' · '}
          Paste a link to practice with a different recording. Lyrics stay the same. Stored only on
          this device.
        </p>
        <label className={s.srOnly} htmlFor="custom-youtube">
          Paste YouTube URL
        </label>
        <input
          id="custom-youtube"
          value={customDraft}
          onChange={(event) => {
            setCustomDraft(event.target.value)
            setCustomError('')
          }}
          placeholder="Paste YouTube URL"
          autoComplete="off"
          inputMode="url"
        />
        {customError ? <p className={s.fieldError}>{customError}</p> : null}
        <div className={s.customActions}>
          <button type="button" className={s.primaryBtn} onClick={loadCustom}>
            Load video
          </button>
          {usingCustom ? (
            <button type="button" className={s.ghostBtn} onClick={resetCustom}>
              Reset to saved recording
            </button>
          ) : null}
          {usingCustom && suggestHref ? (
            <Link className={s.ghostBtn} to={suggestHref}>
              Suggest this recording
            </Link>
          ) : null}
          {parseYoutubeVideoId(activeUrl) ? (
            <a
              className={s.ghostBtn}
              href={`https://www.youtube.com/watch?v=${parseYoutubeVideoId(activeUrl)}`}
              target="_blank"
              rel="noreferrer"
            >
              Open on YouTube
            </a>
          ) : null}
        </div>
      </div>
    </div>
  )
}
