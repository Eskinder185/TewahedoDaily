import { useCallback, useState } from 'react'
import { useAsync } from '../../lib/cms/useAsync'
import { errorMessage } from '../../lib/cms/mezmurService'
import {
  listMediaAssets,
  MEDIA_FOLDER_OPTIONS,
  resolveContentMediaUrl,
  updateMediaAsset,
  uploadContentMedia,
  type MediaAsset,
  type MediaFolder,
} from '../../lib/cms/contentMedia'
import { mediaInventory, uploadContentFile, type LibraryFile } from '../../lib/cms/libraryMedia'
import { publicMedia } from '../../lib/publicContent/service'
import { AsyncNotice, Modal } from './AdminUi'
import s from './Admin.module.css'
import styles from './MediaWorkspace.module.css'

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
        const folder = (MEDIA_FOLDER_OPTIONS.some(entry => entry.value === kind) ? kind : 'fallback') as MediaFolder
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
  const [message, setMessage] = useState('')
  const [legacy, setLegacy] = useState(false)
  const [sort, setSort] = useState<'newest' | 'oldest' | 'name'>('newest')
  const [mediaType, setMediaType] = useState('')
  const [view, setView] = useState<'grid' | 'list'>('grid')
  const [selectedId, setSelectedId] = useState<string | null>(null)
  const [preview, setPreview] = useState<MediaAsset | null>(null)
  const result = useAsync(
    useCallback(async () => {
      if (legacy) return mediaInventory(q, mediaType, page)
      return listMediaAssets({ search: q, folder: folder || undefined, mediaType: mediaType || undefined, sort, page, pageSize: 24 })
    }, [q, folder, mediaType, sort, page, legacy]),
  )
  const assets = result.data && !legacy ? result.data.items as MediaAsset[] : []
  const selected = assets.find(asset => asset.id === selectedId) || null

  return (
    <>
      <div className={styles.heading}><div><p className={s.eyebrow}>CONTENT ASSETS</p><h1>Media library</h1></div><div className={styles.viewSwitch} aria-label="Media view"><button type="button" aria-pressed={view === 'grid'} onClick={() => setView('grid')}>Grid</button><button type="button" aria-pressed={view === 'list'} onClick={() => setView('list')}>List</button></div></div>
      <p className={s.muted}>
        Upload images, review metadata, and copy references for individual content editors. Replacing a record image creates a new asset; existing shared files stay intact. Browse legacy private buckets for audio.
      </p>
      <section className={`${s.card} ${styles.upload}`} aria-label="Upload media"><h2>Upload new asset</h2><ContentUpload
        kind={folder || 'fallback'}
        id="uploads"
        onUploaded={() => {
          result.reload()
          setMessage('Uploaded.')
        }}
      /></section>
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
            {MEDIA_FOLDER_OPTIONS.map((entry) => (
              <option key={entry.value} value={entry.value}>
                {entry.label}
              </option>
            ))}
          </select>
        </label>
        <label>Media type<select value={mediaType} onChange={event => { setMediaType(event.target.value); setPage(1) }}><option value="">All types</option><option value="image">Images</option><option value="audio">Audio</option></select></label>
        <label>Sort<select value={sort} disabled={legacy} onChange={event => { setSort(event.target.value as typeof sort); setPage(1) }}><option value="newest">Newest</option><option value="oldest">Oldest</option><option value="name">Filename</option></select></label>
        <label className={s.check}>
          <input
            type="checkbox"
            checked={legacy}
            onChange={(e) => {
              setLegacy(e.target.checked)
              setPage(1)
            }}
          />
          Browse legacy private buckets
        </label>
      </div>
      <AsyncNotice {...result} retry={result.reload} />
      {result.data && <p role="status" className={s.muted}>{result.data.total} matching files · page {page}</p>}
      {result.data && !legacy && (
        <>
          <div className={styles.workspace}>
          <div className={view === 'grid' ? styles.grid : styles.list} aria-label="Media assets">
            {assets.map((asset) => (
              <button type="button" key={asset.id} className={`${styles.asset} ${selectedId === asset.id ? styles.selected : ''}`} onClick={() => setSelectedId(asset.id)} aria-pressed={selectedId === asset.id}>
                <span className={styles.thumbWrap}>{resolveContentMediaUrl(asset.storage_path) && asset.media_type === 'image' ? <img src={resolveContentMediaUrl(asset.storage_path)} alt={asset.alt_text || asset.file_name} /> : <span>{asset.media_type || 'File'}</span>}</span>
                <strong>{asset.file_name}</strong><small>{asset.storage_path.split('/')[0]} · {new Date(asset.created_at).toLocaleDateString()}</small>
              </button>
            ))}
          </div>
          <aside className={`${s.card} ${styles.editor}`} aria-label="Media details">{selected ? <AssetEditor key={selected.id} asset={selected} onSaved={() => { setMessage('Metadata saved.'); result.reload() }} onPreview={() => setPreview(selected)} /> : <><h2>Asset details</h2><p className={s.muted}>Select an asset to preview it and edit its description.</p></>}</aside>
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
          <div className={view === 'grid' ? styles.grid : styles.list}>
            {(result.data.items as LibraryFile[]).map((file) => (
              <LegacyFileCard key={file.id} file={file} />
            ))}
          </div>
          {!result.data.items.length && <p>No files match.</p>}
          <div className={s.actions}><button type="button" disabled={page <= 1} onClick={() => setPage(page - 1)}>Previous</button><span>Page {page}</span><button type="button" disabled={page * 24 >= result.data.total} onClick={() => setPage(page + 1)}>Next</button></div>
        </>
      )}
      {preview && <Modal title={preview.file_name} close={() => setPreview(null)} wide>{preview.media_type === 'image' ? <img className={styles.fullPreview} src={resolveContentMediaUrl(preview.storage_path)} alt={preview.alt_text || preview.file_name} /> : <audio controls src={resolveContentMediaUrl(preview.storage_path)} />}<p>{preview.caption || 'No caption'}</p></Modal>}
    </>
  )
}

function AssetEditor({
  asset,
  onSaved,
  onPreview,
}: {
  asset: MediaAsset
  onSaved: () => void
  onPreview: () => void
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
    <div className={styles.editorContent}>
      <h2>Asset details</h2>
      <button type="button" className={styles.previewButton} onClick={onPreview} aria-label={`Preview ${asset.file_name}`}><div className={styles.editorImage}>
        {url && asset.media_type === 'image' ? (
          <img src={url} alt={alt || asset.file_name} />
        ) : (
          <div className={s.mediaThumbEmpty}>—</div>
        )}
      </div></button>
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
        </div>
        <p className={styles.help}>To change one content record, copy this path into that record's image field or picker. The existing shared asset stays intact.</p>
        <p className={styles.help}>Deletion is unavailable until every content reference can be checked and recovery is supported.</p>
        {message ? <p role="status">{message}</p> : null}
        {error ? <p role="alert">{error}</p> : null}
      </div>
    </div>
  )
}

function LegacyFileCard({ file }: { file: LibraryFile }) {
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
      </div>
      {message ? <p role="status">{message}</p> : null}
    </article>
  )
}
