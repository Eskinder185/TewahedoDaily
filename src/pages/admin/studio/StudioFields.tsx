import { useId, type ReactNode } from 'react'
import { sourceOptions } from '../../../lib/play/contentStudio'
import type { SourceReference } from '../../../lib/play/types'
import s from './Studio.module.css'

export type Bilingual = { en: string; am?: string }
export function TextField({ label, value, onChange, multiline = false, disabled = false, type = 'text', lang, advanced = false, required = false }: {
  label: string; value: string; onChange: (value: string) => void; multiline?: boolean; disabled?: boolean; type?: string; lang?: string; advanced?: boolean; required?: boolean
}) {
  const id = useId()
  const missing = required && !value.trim()
  const field = <div className={s.field}><label htmlFor={id}>{label}</label>{multiline
    ? <textarea id={id} lang={lang} value={value} disabled={disabled} aria-required={required || undefined} aria-invalid={missing || undefined} aria-describedby={missing ? `${id}-help` : undefined} maxLength={20000} onChange={event => onChange(event.target.value)} />
    : <input id={id} lang={lang} type={type} value={value} disabled={disabled} aria-required={required || undefined} aria-invalid={missing || undefined} aria-describedby={missing ? `${id}-help` : undefined} maxLength={500} onChange={event => onChange(event.target.value)} />}
    {missing && <small id={`${id}-help`}>Add the required text here. / የሚያስፈልገውን ጽሑፍ ያስገቡ።</small>}</div>
  return advanced ? <details className={s.advanced}><summary>Advanced details / ተጨማሪ ዝርዝሮች</summary>{field}</details> : field
}
export function BilingualField({ label, value, onChange, multiline = false }: {
  label: string; value: Bilingual; onChange: (value: Bilingual) => void; multiline?: boolean
}) {
  return <fieldset className={s.bilingual}><legend>{label}</legend>
    <TextField label={`${label} · English`} lang="en" value={value.en} onChange={en => onChange({ ...value, en })} multiline={multiline} required />
    <TextField label={`${label} · አማርኛ`} lang="am" value={value.am || ''} onChange={am => onChange({ ...value, am })} multiline={multiline} />
  </fieldset>
}
export function SourcePicker({ value, onChange }: { value: SourceReference; onChange: (source: SourceReference) => void }) {
  const options = sourceOptions()
  const key = (source: SourceReference) => `${source.route}:${source.label}`
  if (!options.some(source => key(source) === key(value))) options.unshift(value)
  return <fieldset className={s.group}><legend>Source reference / ምንጭ</legend>
    <label className={s.field}>Existing source / ያለ ምንጭ<select value={key(value)} onChange={event => {
      const selected = options.find(source => key(source) === event.target.value)
      if (selected) onChange(structuredClone(selected))
    }}>{options.map(source => <option key={key(source)} value={key(source)}>{source.label}</option>)}</select></label>
    <TextField label="Source label / የምንጭ መግለጫ" value={value.label} onChange={label => onChange({ ...value, label })} />
    <TextField label="Source route / የምንጭ አድራሻ" value={value.route} onChange={route => onChange({ ...value, route })} advanced />
  </fieldset>
}
export function OrderedCards<T>({ items, label, identity, onChange, render, add }: {
  items: T[]; label: string; identity: (item: T, index: number) => string
  onChange: (items: T[]) => void; render: (item: T, index: number) => ReactNode; add?: () => void
}) {
  const move = (from: number, to: number) => {
    if (!Number.isInteger(from) || from < 0 || from >= items.length || to < 0 || to >= items.length || from === to) return
    const next = items.slice(); const [item] = next.splice(from, 1); next.splice(to, 0, item); onChange(next)
  }
  return <section className={s.ordered} aria-label={label}>
    <p className={s.hint}>Drag cards or use the Move up/down buttons. / ካርዶችን ለማንቀሳቀስ አዝራሮቹን ይጠቀሙ።</p>
    {items.map((item, index) => <article key={identity(item, index)} className={s.card}
      onDragOver={event => event.preventDefault()} onDrop={event => { event.preventDefault(); move(Number(event.dataTransfer.getData('text/plain')), index) }}>
      <div className={s.actions}>
        <span draggable onDragStart={event => event.dataTransfer.setData('text/plain', String(index))} className={s.handle} aria-hidden="true">⠿</span>
        <strong>{index + 1}</strong>
        <button type="button" disabled={index === 0} onClick={() => move(index, index - 1)} aria-label={`Move ${label} ${index + 1} up`}>↑</button>
        <button type="button" disabled={index === items.length - 1} onClick={() => move(index, index + 1)} aria-label={`Move ${label} ${index + 1} down`}>↓</button>
        {add && <button type="button" disabled={items.length <= 1} onClick={() => {
          if (window.confirm(`Remove ${label} ${index + 1} from this draft? Shared content is unchanged. / ከረቂቁ ይወገድ?`)) onChange(items.filter((_, i) => i !== index))
        }} aria-label={`Remove ${label} ${index + 1}`}>Remove / አስወግድ</button>}
      </div>{render(item, index)}
    </article>)}
    {add && <button type="button" onClick={add}>Add {label} / ጨምር</button>}
  </section>
}
