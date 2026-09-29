import { useCallback, useEffect, useState } from 'react'
import {
  CONTENT_MEDIA_BUCKET,
  listMediaAssets,
  MEDIA_FOLDERS,
  resolveContentMediaUrl,
  type MediaAsset,
  type MediaFolder,
  updateMediaAsset,
  uploadContentMedia,
} from '../../lib/cms/contentMedia'
import { errorMessage } from '../../lib/cms/mezmurService'
import styles from './MediaPicker.module.css'

export type MediaPickerValue = {
  storagePath: string
  altText: string
}

type Props = {
  label?: string
  folder?: MediaFolder
  value: string | null | undefined
  altText?: string | null
  onChange: (next: MediaPickerValue) => void
  required?: boolean
}

export function MediaPicker({
  label = 'Image',
  folder = 'fallback',
  value,
  altText = '',
  onChange,
  required,
}: Props) {
  const [open, setOpen] = useState(false)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [search, setSearch] = useState('')
  const [filterFolder, setFilterFolder] = useState<string>(folder)
  const [assets, setAssets] = useState<MediaAsset[]>([])
  const [localAlt, setLocalAlt] = useState(altText || '')
  const [progress, setProgress] = useState<number | null>(null)

  const previewUrl = resolveContentMediaUrl(value)

  useEffect(() => {
    setLocalAlt(altText || '')
  }, [altText])

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

  async function handleUpload(file: File | undefined) {
    if (!file) return
    setBusy(true)
    setError('')
    setProgress(0)
    try {
      const asset = await uploadContentMedia(file, folder, {
        altText: localAlt,
        onProgress: setProgress,
      })
      onChange({
        storagePath: asset.storage_path,
        altText: asset.alt_text || localAlt || file.name,
      })
      setOpen(false)
    } catch (cause) {
      setError(errorMessage(cause))
    } finally {
      setBusy(false)
      setProgress(null)
    }
  }

  function selectAsset(asset: MediaAsset) {
    onChange({
      storagePath: asset.storage_path,
      altText: localAlt || asset.alt_text || asset.file_name,
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

  return (
    <div className={styles.root}>
      <div className={styles.head}>
        <span className={styles.label}>
          {label}
          {required ? ' *' : ''}
        </span>
        <div className={styles.actions}>
          <button type="button" onClick={() => setOpen(true)} disabled={busy}>
            {value ? 'Replace' : 'Choose / upload'}
          </button>
          {value ? (
            <button
              type="button"
              className={styles.danger}
              onClick={() => onChange({ storagePath: '', altText: localAlt })}
            >
              Remove
            </button>
          ) : null}
        </div>
      </div>

      {previewUrl ? (
        <div className={styles.preview}>
          <img src={previewUrl} alt={localAlt || ''} />
          <p className={styles.path}>
            {value?.startsWith('http') ? value : `${CONTENT_MEDIA_BUCKET}/${value}`}
          </p>
        </div>
      ) : (
        <p className={styles.empty}>No image selected.</p>
      )}

      <label className={styles.alt}>
        Alt text
        <input
          value={localAlt}
          onChange={(e) => setLocalAlt(e.target.value)}
          onBlur={() => void saveAlt()}
          placeholder="Describe the image for accessibility"
        />
      </label>

      {error ? (
        <p className={styles.error} role="alert">
          {error}
        </p>
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
                  {MEDIA_FOLDERS.map((f) => (
                    <option key={f} value={f}>
                      {f}
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
                  accept="image/jpeg,image/png,image/webp"
                  disabled={busy}
                  onChange={(e) => {
                    void handleUpload(e.target.files?.[0])
                    e.target.value = ''
                  }}
                />
              </label>
            </div>

            {progress !== null ? (
              <p role="status">Uploading {progress}%</p>
            ) : null}
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
                      <img src={url} alt={asset.alt_text || asset.file_name} />
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
