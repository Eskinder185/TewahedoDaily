import { useCallback, useState } from 'react'
import { useAsync } from '../../lib/cms/useAsync'
import { db, errorMessage } from '../../lib/cms/mezmurService'
import {
  mediaInventory,
  uploadContentFile,
  type LibraryFile,
} from '../../lib/cms/libraryMedia'
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
      const result = await uploadContentFile(file, kind, id, setProgress)
      onUploaded(result.reference, result.type)
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
        JPEG/PNG/WebP up to 10 MiB; MP3/M4A/Ogg/WAV up to 50 MiB. Save the
        editor to attach uploaded files.
      </p>
      {progress !== null && (
        <>
          <progress aria-label="Upload progress" max={100} value={progress} />
          <p role="status">
            {busy ? `Uploading ${progress}%` : 'Upload finished'}
          </p>
        </>
      )}
      {error && <p role="alert">{error}</p>}
    </div>
  )
}
export function MediaLibrary() {
  const [q, setQ] = useState('')
  const [type, setType] = useState('')
  const [page, setPage] = useState(1)
  const [error, setError] = useState('')
  const [message, setMessage] = useState('')
  const result = useAsync(
    useCallback(() => mediaInventory(q, type, page), [q, type, page]),
  )
  async function remove(file: LibraryFile) {
    if (!window.confirm(`Permanently delete ${file.name}?`)) return
    setError('')
    try {
      const { data, error } = await db()
        .storage.from(file.bucket_id)
        .remove([file.name])
      if (error) throw error
      if (!data.length)
        throw new Error('File is referenced or deletion was denied.')
      setMessage('File deleted.')
      result.reload()
    } catch (e) {
      setError(errorMessage(e))
    }
  }
  return (
    <>
      <h1>Media library</h1>
      <ContentUpload
        kind="library"
        id="uploads"
        onUploaded={() => {
          result.reload()
          setMessage(
            'Uploaded. Copy its Storage reference to attach it to content.',
          )
        }}
      />
      {error && <p role="alert">{error}</p>}
      {message && <p role="status">{message}</p>}
      <div className={s.filters}>
        <label>
          Search files
          <input
            value={q}
            onChange={(e) => {
              setQ(e.target.value)
              setPage(1)
            }}
          />
        </label>
        <label>
          File type
          <select
            value={type}
            onChange={(e) => {
              setType(e.target.value)
              setPage(1)
            }}
          >
            <option value="">All</option>
            <option value="image">Images</option>
            <option value="audio">Audio</option>
            <option value="application">Documents</option>
          </select>
        </label>
      </div>
      <AsyncNotice {...result} retry={result.reload} />
      {result.data && (
        <>
          <div className={s.mediaGrid}>
            {result.data.items.map((file) => (
              <FileCard
                key={file.id}
                file={file}
                remove={() => void remove(file)}
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
    </>
  )
}
function FileCard({ file, remove }: { file: LibraryFile; remove: () => void }) {
  const ref = `storage://${file.bucket_id}/${file.name}`
  const url = useAsync(useCallback(() => publicMedia(ref), [ref]))
  const [message, setMessage] = useState('')
  async function copy(value: string) {
    try {
      await navigator.clipboard.writeText(value)
      setMessage('Copied.')
    } catch {
      setMessage('Copy failed. Select the reference text instead.')
    }
  }
  return (
    <article className={s.card}>
      <h2 className={s.lyrics}>{file.name.split('/').at(-1)}</h2>
      <p>
        {Math.round((file.metadata?.size || 0) / 1024)} KiB ·{' '}
        {file.metadata?.mimetype}
      </p>
      <AsyncNotice {...url} retry={url.reload} />
      {url.data &&
        (file.metadata?.mimetype?.startsWith('image/') ? (
          <img
            src={url.data}
            alt={file.name}
            loading="lazy"
            style={{ maxWidth: '100%', maxHeight: 200 }}
          />
        ) : file.metadata?.mimetype?.startsWith('audio/') ? (
          <audio
            controls
            preload="none"
            src={url.data}
            style={{ maxWidth: '100%' }}
          />
        ) : (
          <a href={url.data} target="_blank" rel="noreferrer">
            Preview file
          </a>
        ))}
      <p className={s.lyrics}>{ref}</p>
      <div className={s.actions}>
        <button disabled={!url.data} onClick={() => void copy(url.data!)}>
          Copy file URL (1 hour)
        </button>
        <button onClick={() => void copy(ref)}>Copy Storage reference</button>
        <button disabled={file.in_use} onClick={remove}>
          Delete
        </button>
      </div>
      {file.in_use && (
        <p>Protected: referenced by content or revision history.</p>
      )}
      {message && <p role="status">{message}</p>}
    </article>
  )
}
