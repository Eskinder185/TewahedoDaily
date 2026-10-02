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
}: Props) {
  const [open, setOpen] = useState(false)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [search, setSearch] = useState('')
  const [filterFolder, setFilterFolder] = useState<string>(folder)
  const [assets, setAssets] = useState<MediaAsset[]>([])
  const [localAlt, setLocalAlt] = useState(altText || '')
  const [progress, setProgress] = useState<number | null>(null)
  const [duplicate, setDuplicate] = useState<DuplicatePrompt | null>(null)

  const previewUrl = resolveContentMediaUrl(value)
  const isCalendarFolder =
    (folder || '').startsWith('calendar') || (value || '').startsWith('calendar/')

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
        page: 1,
        pageSize: 48,
      })
      setAssets(result.items)
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
    }
  }, [search, filterFolder])

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
        <div className={styles.preview}>
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
                  onChange={(e) => setSearch(e.target.value)}
                  placeholder="File name or alt text"
                />
              </label>
              <label>
                Folder
                <select value={filterFolder} onChange={(e) => setFilterFolder(e.target.value)}>
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

            {progress !== null ? <p role="status">Uploading {progress}%</p> : null}
            {busy && progress === null ? <p role="status">Loading…</p> : null}
            {error ? (
              <p className={styles.error} role="alert">
                {error}
              </p>
            ) : null}

            <ul className={styles.grid}>
              {assets.map((asset) => {
                const url = resolveContentMediaUrl(asset.storage_path)
                return (
                  <li key={asset.id}>
                    <button type="button" className={styles.tile} onClick={() => selectAsset(asset)}>
                      <img src={url} alt={asset.alt_text || ''} />
                      <span>{asset.file_name}</span>
                      <small>{asset.storage_path}</small>
                    </button>
                  </li>
                )
              })}
            </ul>
            {!busy && assets.length === 0 ? (
              <p className={styles.empty}>No media found in this folder.</p>
            ) : null}
          </div>
        </div>
      ) : null}
    </div>
  )
}
