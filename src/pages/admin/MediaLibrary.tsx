import { useCallback, useState } from 'react'
import { useAsync } from '../../lib/cms/useAsync'
import { errorMessage } from '../../lib/cms/mezmurService'
import {
  deleteMediaAsset,
  listMediaAssets,
  MEDIA_FOLDERS,
  resolveContentMediaUrl,
  updateMediaAsset,
  uploadContentMedia,
  type MediaAsset,
  type MediaFolder,
} from '../../lib/cms/contentMedia'
import { mediaInventory, uploadContentFile, type LibraryFile } from '../../lib/cms/libraryMedia'
import { publicMedia } from '../../lib/publicContent/service'
import { AsyncNotice } from './AdminUi'
import s from './Admin.module.css'

export function ContentUpload({
  kind,
  id,
  onUploaded,
  onBusy,
}: {
  onBusy?: (busy: boolean) => void
  kind: string
  id: string
  onUploaded: (reference: string, type: 'image' | 'audio') => void
}) {
  const [progress, setProgress] = useState<number | null>(null)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  async function upload(file: File | undefined) {
    if (!file) return
    setBusy(true)
    onBusy?.(true)
    setError('')
    setProgress(0)
    try {
      if (file.type.startsWith('image/')) {
        const folder = (
          ['homepage', 'mezmur', 'prayers', 'liturgy', 'synaxarium', 'saints', 'feasts', 'fallback'].includes(kind)
            ? kind
            : 'fallback'
        ) as MediaFolder
        const asset = await uploadContentMedia(file, folder, { onProgress: setProgress })
        onUploaded(asset.storage_path, 'image')
      } else {
        const result = await uploadContentFile(file, kind, id, setProgress)
        onUploaded(result.reference, result.type)
      }
    } catch (e) {
      setProgress(null)
      setError(errorMessage(e))
    } finally {
      setBusy(false)
      onBusy?.(false)
    }
  }
  return (
    <div>
      <label>
        Upload image or audio
        <input
          type="file"
          accept="image/jpeg,image/png,image/webp,audio/mpeg,audio/mp4,audio/ogg,audio/wav"
          disabled={busy}
          onChange={(e) => {
            void upload(e.target.files?.[0])
            e.target.value = ''
          }}
        />
      </label>
      <p className={s.muted}>
        Images go to content-media (JPEG/PNG/WebP, 10 MiB). Audio uses legacy private buckets.
      </p>
      {progress !== null && (
        <>
          <progress aria-label="Upload progress" max={100} value={progress} />
          <p role="status">{busy ? `Uploading ${progress}%` : 'Upload finished'}</p>
        </>
      )}
      {error && <p role="alert">{error}</p>}
    </div>
  )
}

export function MediaLibrary() {
  const [q, setQ] = useState('')
  const [folder, setFolder] = useState('')
  const [page, setPage] = useState(1)
  const [error, setError] = useState('')
  const [message, setMessage] = useState('')
  const [legacy, setLegacy] = useState(false)
  const result = useAsync(
    useCallback(async () => {
      if (legacy) return mediaInventory(q, '', page)
      return listMediaAssets({ search: q, folder: folder || undefined, page, pageSize: 24 })
    }, [q, folder, page, legacy]),
  )

  async function removeAsset(asset: MediaAsset) {
    if (!window.confirm(`Permanently delete ${asset.file_name}?`)) return
    setError('')
    try {
      await deleteMediaAsset(asset)
      setMessage('File deleted.')
      result.reload()
    } catch (e) {
      setError(errorMessage(e))
    }
  }

  async function removeLegacy(file: LibraryFile) {
    if (!window.confirm(`Permanently delete ${file.name}?`)) return
    setError('')
    try {
      const { db } = await import('../../lib/cms/mezmurService')
      const { data, error: removeError } = await db()
        .storage.from(file.bucket_id)
        .remove([file.name])
      if (removeError) throw removeError
      if (!data.length) throw new Error('File is referenced or deletion was denied.')
      setMessage('File deleted.')
      result.reload()
    } catch (e) {
      setError(errorMessage(e))
    }
  }

  return (
    <>
      <h1>Media library</h1>
      <p className={s.muted}>
        Primary library uses the public <code>content-media</code> bucket and <code>media_assets</code> table.
      </p>
      <ContentUpload
        kind={folder || 'fallback'}
        id="uploads"
        onUploaded={() => {
          result.reload()
          setMessage('Uploaded.')
        }}
      />
      {error && <p role="alert">{error}</p>}
      {message && <p role="status">{message}</p>}
      <div className={s.filters}>
        <label>
          Search
          <input
            value={q}
            onChange={(e) => {
              setQ(e.target.value)
              setPage(1)
            }}
          />
        </label>
        <label>
          Folder
          <select
            value={folder}
            onChange={(e) => {
              setFolder(e.target.value)
              setPage(1)
            }}
            disabled={legacy}
          >
            <option value="">All</option>
            {MEDIA_FOLDERS.map((name) => (
              <option key={name} value={name}>
                {name}
              </option>
            ))}
          </select>
        </label>
        <label className={s.check}>
          <input
            type="checkbox"
            checked={legacy}
            onChange={(e) => {
              setLegacy(e.target.checked)
              setPage(1)
            }}
          />
          Show legacy private buckets
        </label>
      </div>
      <AsyncNotice {...result} retry={result.reload} />
      {result.data && !legacy && (
        <>
          <div className={s.mediaGrid}>
            {(result.data.items as MediaAsset[]).map((asset) => (
              <AssetCard
                key={asset.id}
                asset={asset}
                remove={() => void removeAsset(asset)}
                onSaved={() => result.reload()}
              />
            ))}
          </div>
          {!result.data.items.length && <p>No files match.</p>}
          <div className={s.actions}>
            <button disabled={page <= 1} onClick={() => setPage(page - 1)}>
              Previous
            </button>
            <span>Page {page}</span>
            <button
              disabled={page * 24 >= result.data.total}
              onClick={() => setPage(page + 1)}
            >
              Next
            </button>
          </div>
        </>
      )}
      {result.data && legacy && (
        <>
          <div className={s.mediaGrid}>
            {(result.data.items as LibraryFile[]).map((file) => (
              <LegacyFileCard key={file.id} file={file} remove={() => void removeLegacy(file)} />
            ))}
          </div>
          {!result.data.items.length && <p>No files match.</p>}
        </>
      )}
    </>
  )
}

function AssetCard({
  asset,
  remove,
  onSaved,
}: {
  asset: MediaAsset
  remove: () => void
  onSaved: () => void
}) {
  const url = resolveContentMediaUrl(asset.storage_path)
  const [alt, setAlt] = useState(asset.alt_text || '')
  const [caption, setCaption] = useState(asset.caption || '')
  const [message, setMessage] = useState('')
  const [error, setError] = useState('')

  async function saveMeta() {
    setError('')
    try {
      await updateMediaAsset(asset.id, { alt_text: alt || null, caption: caption || null })
      setMessage('Saved.')
      onSaved()
    } catch (cause) {
      setError(errorMessage(cause))
    }
  }

  async function copy(value: string) {
    try {
      await navigator.clipboard.writeText(value)
      setMessage('Copied path.')
    } catch {
      setMessage(value)
    }
  }

  return (
    <article className={`${s.card} ${s.mediaCard}`}>
      <div className={s.mediaThumbWrap}>
        {url ? (
          <img className={s.mediaThumb} src={url} alt={alt || asset.file_name} />
        ) : (
          <div className={s.mediaThumbEmpty}>—</div>
        )}
      </div>
      <div className={s.mediaMeta}>
        <strong title={asset.file_name}>{asset.file_name}</strong>
        <span className={s.mediaFolder}>
          {asset.storage_path.split('/')[0] || 'content-media'}
          {asset.width && asset.height ? ` · ${asset.width}×${asset.height}` : ''}
        </span>
        <span className={s.muted}>{new Date(asset.created_at).toLocaleDateString()}</span>
        <label>
          Alt text
          <input value={alt} onChange={(e) => setAlt(e.target.value)} />
        </label>
        <label>
          Caption
          <input value={caption} onChange={(e) => setCaption(e.target.value)} />
        </label>
        <div className={s.actions}>
          <button type="button" onClick={() => void saveMeta()}>
            Save
          </button>
          <button type="button" onClick={() => void copy(asset.storage_path)}>
            Copy path
          </button>
          <button type="button" className={s.danger} onClick={remove}>
            Delete
          </button>
        </div>
        {message ? <p role="status">{message}</p> : null}
        {error ? <p role="alert">{error}</p> : null}
      </div>
    </article>
  )
}

function LegacyFileCard({ file, remove }: { file: LibraryFile; remove: () => void }) {
  const ref = `storage://${file.bucket_id}/${file.name}`
  const url = useAsync(useCallback(() => publicMedia(ref), [ref]))
  const [message, setMessage] = useState('')
  async function copy(value: string) {
    try {
      await navigator.clipboard.writeText(value)
      setMessage('Copied.')
    } catch {
      setMessage(value)
    }
  }
  return (
    <article className={s.card}>
      {url.data ? (
        file.metadata.mimetype?.startsWith('audio/') ? (
          <audio controls src={url.data} />
        ) : (
          <img className={s.thumbnail} src={url.data} alt="" />
        )
      ) : (
        <span className={s.noImage}>…</span>
      )}
      <strong>{file.name.split('/').pop()}</strong>
      <small className={s.muted}>
        {file.bucket_id} · {new Date(file.created_at).toLocaleDateString()}
      </small>
      {file.in_use ? <p className={s.muted}>In use by content</p> : null}
      <div className={s.actions}>
        <button type="button" onClick={() => void copy(ref)}>
          Copy ref
        </button>
        <button type="button" className={s.danger} onClick={remove}>
          Delete
        </button>
      </div>
      {message ? <p role="status">{message}</p> : null}
    </article>
  )
}
