import { useCallback, useEffect, useState } from 'react'
import {
  CONTENT_MEDIA_BUCKET,
  contentMediaPathExists,
  listMediaAssets,
  MEDIA_FOLDER_OPTIONS,
  resolveContentMediaUrl,
  type MediaAsset,
  updateMediaAsset,
  uploadContentMedia,
} from '../../lib/cms/contentMedia'
import { errorMessage } from '../../lib/cms/mezmurService'
import { CalendarEventImage } from '../calendar/CalendarEventImage'
import { extractTitleCandidates, isPublicCmsImage, suggestMediaAssets, type MediaResolutionQuery } from '../../lib/media/mediaResolver'
import styles from './MediaPicker.module.css'

export type MediaPickerValue = {
  storagePath: string
  altText: string
}

type DuplicatePrompt = {
  path: string
  file: File
}

type Props = {
  label?: string
  /** Storage folder prefix used for browse filter + default uploads (e.g. calendar/angels). */
  folder?: string
  value: string | null | undefined
  altText?: string | null
  onChange: (next: MediaPickerValue) => void
  required?: boolean
  /** Suggested reusable path (calendar/angels/gabriel.webp). */
  suggestedPath?: string | null
  /** Prefer converting JPEG/PNG to WebP on upload. */
  convertToWebp?: boolean
  /** Use 4:3 cover preview (hymn section / collection cards). */
  previewAspect?: 'default' | '4/3'
  /** Optional content identity for review-only suggestions. */
  matchQuery?: MediaResolutionQuery & { intentionallyNoImage?: boolean }
}

export function MediaPicker({
  label = 'Image',
  folder = 'fallback',
  value,
  altText = '',
  onChange,
  required,
  suggestedPath = null,
  convertToWebp = true,
  previewAspect = 'default',
  matchQuery,
}: Props) {
  const [open, setOpen] = useState(false)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [search, setSearch] = useState('')
  const [filterFolder, setFilterFolder] = useState<string>(folder)
  const [assets, setAssets] = useState<MediaAsset[]>([])
  const [page, setPage] = useState(1)
  const [total, setTotal] = useState(0)
  const [failedImages, setFailedImages] = useState<string[]>([])
  const [localAlt, setLocalAlt] = useState(altText || '')
  const [progress, setProgress] = useState<number | null>(null)
  const [duplicate, setDuplicate] = useState<DuplicatePrompt | null>(null)

  const previewUrl = resolveContentMediaUrl(value)
  const suggestions = matchQuery
    ? suggestMediaAssets({ ...matchQuery, explicitPath: value || matchQuery.explicitPath }, assets)
    : []
  const isCalendarFolder =
    (folder || '').startsWith('calendar') || (value || '').startsWith('calendar/')
  const preferUniqueUploadPath =
    isCalendarFolder ||
    (folder || '').includes('zemaris') ||
    (suggestedPath || '').includes('/zemaris/')

  useEffect(() => {
    setLocalAlt(altText || '')
  }, [altText])

  useEffect(() => {
    setFilterFolder(folder)
  }, [folder])

  const load = useCallback(async () => {
    setBusy(true)
    setError('')
    try {
      const result = await listMediaAssets({
        search,
        folder: filterFolder || undefined,
        page,
        pageSize: 48,
      })
      setAssets(result.items)
      setTotal(result.total)
      setFailedImages([])
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }, [search, filterFolder, page])

  useEffect(() => {
    if (!open) return
    void load()
  }, [open, load])

  async function performUpload(file: File, opts: { upsert: boolean; storagePath?: string }) {
    setBusy(true)
    setError('')
    setProgress(0)
    try {
      const targetPath =
        opts.storagePath ||
        suggestedPath ||
        undefined
      const uploadFolder =
        targetPath && targetPath.includes('/')
          ? targetPath.slice(0, targetPath.lastIndexOf('/'))
          : folder
      const asset = await uploadContentMedia(file, uploadFolder, {
        altText: localAlt,
        onProgress: setProgress,
        convertToWebp,
        upsert: opts.upsert,
        storagePath: targetPath,
      })
      onChange({
        storagePath: asset.storage_path,
        altText: localAlt || asset.alt_text || '',
      })
      setDuplicate(null)
      setOpen(false)
    } catch (cause) {
      const coded = cause as Error & { code?: string; storagePath?: string }
      if (coded?.code === 'STORAGE_PATH_EXISTS' && coded.storagePath) {
        setDuplicate({ path: coded.storagePath, file })
        setError('')
      } else {
        setError(errorMessage(cause))
      }
    } finally {
      setBusy(false)
      setProgress(null)
    }
  }

  async function handleUpload(file: File | undefined) {
    if (!file) return
    // Prefer immutable unique filenames so CDN/browser cache cannot keep serving
    // replaced bytes at the same public URL (calendar + Zemari portraits).
    if (preferUniqueUploadPath && suggestedPath) {
      const ext = suggestedPath.includes('.')
        ? suggestedPath.slice(suggestedPath.lastIndexOf('.'))
        : '.webp'
      const base = suggestedPath.replace(/\.[^.]+$/, '').replace(/-\d{10,}$/, '')
      const uniquePath = `${base}-${Date.now()}${ext}`
      await performUpload(file, { upsert: false, storagePath: uniquePath })
      return
    }
    const targetPath = suggestedPath || undefined
    if (targetPath) {
      const exists = await contentMediaPathExists(targetPath)
      if (exists) {
        setDuplicate({ path: targetPath, file })
        return
      }
    }
    await performUpload(file, { upsert: false, storagePath: targetPath })
  }

  function selectAsset(asset: MediaAsset) {
    onChange({
      storagePath: asset.storage_path,
      altText: localAlt || asset.alt_text || '',
    })
    setOpen(false)
  }

  async function saveAlt() {
    onChange({
      storagePath: value || '',
      altText: localAlt,
    })
    if (!value || value.startsWith('http')) return
    const match = assets.find((a) => a.storage_path === value)
    if (!match) return
    try {
      await updateMediaAsset(match.id, { alt_text: localAlt || null })
    } catch {
      /* alt on content row is enough */
    }
  }

  function applySuggestedPath() {
    if (!suggestedPath) return
    onChange({
      storagePath: suggestedPath,
      altText: localAlt,
    })
  }

  return (
    <div className={styles.root}>
      <div className={styles.head}>
        <span className={styles.label}>
          {label}
          {required ? ' *' : ''}
        </span>
        <div className={styles.actions}>
          <button type="button" onClick={() => setOpen(true)} disabled={busy}>
            {value ? 'Change image' : 'Choose from Media'}
          </button>
          <label className={styles.uploadInline}>
            Upload new
            <input
              type="file"
              accept="image/jpeg,image/png,image/webp,.jpg,.jpeg,.png,.webp"
              disabled={busy}
              onChange={(e) => {
                void handleUpload(e.target.files?.[0])
                e.target.value = ''
              }}
            />
          </label>
          {value ? (
            <button
              type="button"
              className={styles.danger}
              onClick={() => onChange({ storagePath: '', altText: localAlt })}
            >
              Remove image
            </button>
          ) : null}
        </div>
      </div>

      {previewUrl ? (
        <div
          className={
            previewAspect === '4/3'
              ? `${styles.preview} ${styles.previewFourThree}`
              : styles.preview
          }
        >
          {isCalendarFolder ? (
            <CalendarEventImage
              src={previewUrl}
              alt={localAlt || ''}
              position="center"
              className={styles.calendarPreview}
            />
          ) : (
            <img src={previewUrl} alt={localAlt || ''} />
          )}
          <p className={styles.path}>
            {value?.startsWith('http') ? value : `${CONTENT_MEDIA_BUCKET}/${value}`}
          </p>
        </div>
      ) : (
        <p className={styles.empty}>No image selected.</p>
      )}

      {suggestedPath ? (
        <div className={styles.suggest}>
          <p>
            Suggested path: <code>{suggestedPath}</code>
          </p>
          {value !== suggestedPath ? (
            <button type="button" onClick={applySuggestedPath} disabled={busy}>
              Use suggested path
            </button>
          ) : (
            <small>Current path matches suggestion (reuse-friendly).</small>
          )}
        </div>
      ) : null}

      <label className={styles.alt}>
        Image alt text
        <input
          value={localAlt}
          onChange={(e) => setLocalAlt(e.target.value)}
          onBlur={() => void saveAlt()}
          placeholder='e.g. "Saint Gabriel the Archangel"'
        />
      </label>

      {error ? (
        <p className={styles.error} role="alert">
          {error}
        </p>
      ) : null}

      {duplicate ? (
        <div className={styles.conflict} role="alertdialog" aria-label="Duplicate image path">
          <p>
            An image already exists at this path.
            <br />
            <code>{duplicate.path}</code>
          </p>
          <div className={styles.actions}>
            <button
              type="button"
              onClick={() => {
                onChange({
                  storagePath: duplicate.path,
                  altText: localAlt,
                })
                setDuplicate(null)
                setOpen(false)
              }}
            >
              Use existing
            </button>
            <button
              type="button"
              onClick={() => {
                const base = duplicate.path.replace(/\.[^.]+$/, '')
                const ext = duplicate.path.includes('.')
                  ? duplicate.path.slice(duplicate.path.lastIndexOf('.'))
                  : '.webp'
                const uniquePath = `${base}-${Date.now()}${ext}`
                void performUpload(duplicate.file, { upsert: false, storagePath: uniquePath })
              }}
              disabled={busy}
            >
              Upload as new file
            </button>
            <button
              type="button"
              onClick={() => void performUpload(duplicate.file, { upsert: true, storagePath: duplicate.path })}
              disabled={busy}
            >
              Replace (may cache)
            </button>
            <button type="button" onClick={() => setDuplicate(null)}>
              Cancel
            </button>
          </div>
        </div>
      ) : null}

      {open ? (
        <div className={styles.modal} role="dialog" aria-modal="true" aria-label="Media picker">
          <div className={styles.dialog}>
            <div className={styles.dialogHead}>
              <h3>Media library</h3>
              <button type="button" onClick={() => setOpen(false)}>
                Close
              </button>
            </div>

            <div className={styles.toolbar}>
              <label>
                Search
                <input
                  value={search}
                  onChange={(e) => { setSearch(e.target.value); setPage(1) }}
                  placeholder="File name or alt text"
                />
              </label>
              <label>
                Folder
                <select value={filterFolder} onChange={(e) => { setFilterFolder(e.target.value); setPage(1) }}>
                  <option value="">All</option>
                  {MEDIA_FOLDER_OPTIONS.map((f) => (
                    <option key={f.value} value={f.value}>
                      {f.label}
                    </option>
                  ))}
                </select>
              </label>
              <button type="button" onClick={() => void load()} disabled={busy}>
                Refresh
              </button>
              <label className={styles.upload}>
                Upload new
                <input
                  type="file"
                  accept="image/jpeg,image/png,image/webp,.jpg,.jpeg,.png,.webp"
                  disabled={busy}
                  onChange={(e) => {
                    void handleUpload(e.target.files?.[0])
                    e.target.value = ''
                  }}
                />
              </label>
            </div>

            {matchQuery && !value && !matchQuery.intentionallyNoImage && (matchQuery.title || matchQuery.titleAmharic) ? (
              <button type="button" onClick={() => {
                const title = matchQuery.title || matchQuery.titleAmharic || ''
                setSearch(extractTitleCandidates(title, { includeHonorificStripped: false })[1] || title)
                setFilterFolder('')
                setPage(1)
              }}>
                Find matching media for {matchQuery.title || matchQuery.titleAmharic}
              </button>
            ) : null}

            {progress !== null ? <p role="status">Uploading {progress}%</p> : null}
            {busy && progress === null ? <p role="status">Loading…</p> : null}
            {error ? (
              <p className={styles.error} role="alert">
                {error}
              </p>
            ) : null}

            {suggestions.length > 0 ? (
              <section aria-label="Suggested images for review" className={styles.suggestionPanel}>
                <h4>Suggested images for review</h4>
                <p>Check the subject and usage rights before selecting. Selecting may save the image in this editor.</p>
                <ul className={styles.suggestionList}>
                  {suggestions.map(({ asset, title, reason, relatedContentId }) => {
                    const unavailable = failedImages.includes(asset.id)
                    return (
                      <li key={asset.id} className={styles.suggestionItem}>
                        {unavailable ? <span className={styles.unavailable}>Preview unavailable</span> : (
                          <img src={resolveContentMediaUrl(asset.storage_path)} alt="" loading="lazy"
                            onError={() => setFailedImages((previous) => previous.includes(asset.id) ? previous : [...previous, asset.id])} />
                        )}
                        <div>
                          <strong>{title}</strong>
                          <small>Filename: {asset.file_name || 'Not recorded'}</small>
                          <small>Reason: {reason}</small>
                          <small>Content ID: {relatedContentId || 'Not recorded'}</small>
                          <small>Approval: Not recorded · Rights: Not recorded</small>
                          <button type="button" disabled={unavailable} onClick={() => selectAsset(asset)}>Select this image</button>
                        </div>
                      </li>
                    )
                  })}
                </ul>
              </section>
            ) : null}

            <ul className={styles.grid}>
              {assets.filter(isPublicCmsImage).map((asset) => {
                const url = resolveContentMediaUrl(asset.storage_path)
                return (
                  <li key={asset.id}>
                    <button type="button" className={styles.tile} onClick={() => selectAsset(asset)} disabled={failedImages.includes(asset.id)}>
                      {failedImages.includes(asset.id) ? <span>Preview unavailable</span> :
                        <img src={url} alt={asset.alt_text || ''} loading="lazy"
                          onError={() => setFailedImages((previous) => previous.includes(asset.id) ? previous : [...previous, asset.id])} />}
                      <span>{asset.file_name}</span>
                      <small>{asset.storage_path}</small>
                    </button>
                  </li>
                )
              })}
            </ul>
            {total > 48 ? (
              <div className={styles.pagination}>
                <button type="button" disabled={busy || page === 1} onClick={() => setPage((current) => current - 1)}>Previous</button>
                <span>Page {page} of {Math.ceil(total / 48)}</span>
                <button type="button" disabled={busy || page * 48 >= total} onClick={() => setPage((current) => current + 1)}>Next</button>
              </div>
            ) : null}
            {!busy && assets.length === 0 ? (
              <p className={styles.empty}>No media found in this folder.</p>
            ) : null}
          </div>
        </div>
      ) : null}
    </div>
  )
}
