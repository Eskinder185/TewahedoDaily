import { useCallback, useEffect, useId, useRef, type ReactNode } from 'react'
import { useAsync } from '../../lib/cms/useAsync'
import { resolveMedia } from '../../lib/cms/mediaService'
import { label, type MezmurInput } from '../../lib/cms/mezmurService'
import s from './Admin.module.css'

export function Status({ value }: { value: string }) { return <span className={s.badge} data-status={value}>{label(value)}</span> }
export function AsyncNotice({ loading, error, retry }: { loading: boolean; error?: string; retry: () => void }) {
  if (loading) return <p role="status">Loading…</p>
  if (error) return <div className={s.error} role="alert">{error} <button type="button" onClick={retry}>Try again</button></div>
  return null
}
export function Media({ reference, audio = false, title = '' }: { reference: string | null | undefined; audio?: boolean; title?: string }) {
  const result = useAsync(useCallback(() => resolveMedia(reference), [reference]))
  if (!reference) return audio ? null : <span className={s.noImage} aria-label="No thumbnail">♪</span>
  if (result.error) return <span title={result.error}>Media unavailable <button type="button" onClick={result.reload}>Retry</button></span>
  if (!result.data) return <span aria-label="Loading media">…</span>
  return audio ? <audio controls src={result.data} aria-label={title || 'Mezmur audio'} /> : <img className={s.thumbnail} src={result.data} alt={title} />
}
export function Modal({ title, children, close }: { title: string; children: ReactNode; close: () => void }) {
  const ref = useRef<HTMLDialogElement>(null)
  const id = useId()
  useEffect(() => { ref.current?.showModal() }, [])
  return <dialog ref={ref} className={s.modal} aria-labelledby={id} onCancel={event => { event.preventDefault(); close() }}>
    <div className={s.heading}><h2 id={id}>{title}</h2><button type="button" onClick={close} aria-label="Close dialog">Close</button></div>{children}
  </dialog>
}
export function MezmurPreview({ item }: { item: MezmurInput }) {
  return <article className={s.preview}>
    <Status value={item.status} /><h2>{item.title || 'Untitled mezmur'}</h2>
    {item.title_amharic && <h3 lang="am">{item.title_amharic}</h3>}
    {item.title_oromo && <h3 lang="om">{item.title_oromo}</h3>}
    {item.thumbnail_url && <Media reference={item.thumbnail_url} title={item.title} />}
    <p>{item.description}</p>
    {item.audio_url && <Media reference={item.audio_url} audio />}
    {item.youtube_url && /^https:\/\/(www\.)?(youtube\.com|youtu\.be)\//i.test(item.youtube_url) && <p><a href={item.youtube_url} target="_blank" rel="noreferrer">Listen on YouTube ↗</a></p>}
    {([['Amharic lyrics', item.lyrics_amharic, 'am'], ['English lyrics', item.lyrics_english, 'en'], ['Oromo lyrics', item.lyrics_oromo, 'om'], ['Transliteration', item.transliteration, 'en']] as const).map(([title, text, lang]) => text && <section key={title}><h3>{title}</h3><p className={s.lyrics} lang={lang}>{text}</p></section>)}
  </article>
}
