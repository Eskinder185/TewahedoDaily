import { createPortal } from 'react-dom'
import { useEffect, useId, useMemo, useRef, useState, type KeyboardEvent } from 'react'
import { findZemariBySlug, saveZemari, slugifyZemari, type ZemariRow } from '../../lib/cms/zemariAdminService'
import { errorMessage } from '../../lib/cms/mezmurService'
import { findDuplicateZemaris, zemariMatchesQuery, type ZemariOption } from '../../lib/cms/zemariSelection'
import { Modal } from '../../pages/admin/AdminUi'
import styles from './SearchableMultiSelect.module.css'
import own from './ZemariSelect.module.css'

type Props = {
  options: readonly ZemariOption[]
  value: string | null
  onChange: (id: string | null) => void
  /** Called after a new Zemari was saved; the parent adds it to its options and selects it. */
  onCreated: (row: ZemariRow) => void
  canCreate: boolean
  disabled?: boolean
}

const CREATE = '__create__'
const NONE = '__none__'

const labelOf = (option: ZemariOption) =>
  `${option.name}${option.name_amharic ? ` · ${option.name_amharic}` : ''}${option.is_archived ? ' (archived)' : ''}`

export function ZemariSelect({ options, value, onChange, onCreated, canCreate, disabled = false }: Props) {
  const id = useId()
  const rootRef = useRef<HTMLDivElement>(null)
  const inputRef = useRef<HTMLInputElement>(null)
  const [open, setOpen] = useState(false)
  const [query, setQuery] = useState('')
  const [activeIndex, setActiveIndex] = useState(0)
  const [creating, setCreating] = useState(false)

  const selected = options.find((option) => option.id === value)
  const filtered = useMemo(
    () => options.filter((option) => (!option.is_archived || option.id === value) && zemariMatchesQuery(option, query)),
    [options, query, value],
  )
  const rows = useMemo(
    () => [
      { key: NONE, label: 'No Zemari' },
      ...filtered.map((option) => ({ key: option.id, label: labelOf(option) })),
      ...(canCreate ? [{ key: CREATE, label: '+ Create New Zemari' }] : []),
    ],
    [filtered, canCreate],
  )

  useEffect(() => {
    const close = (event: PointerEvent) => {
      if (!rootRef.current?.contains(event.target as Node)) setOpen(false)
    }
    document.addEventListener('pointerdown', close)
    return () => document.removeEventListener('pointerdown', close)
  }, [])

  function choose(key: string) {
    if (key === CREATE) {
      setCreating(true)
      setOpen(false)
      return
    }
    onChange(key === NONE ? null : key)
    setQuery('')
    setOpen(false)
  }

  function onKeyDown(event: KeyboardEvent<HTMLInputElement>) {
    if (event.key === 'ArrowDown' || event.key === 'ArrowUp') {
      event.preventDefault()
      setOpen(true)
      const direction = event.key === 'ArrowDown' ? 1 : -1
      setActiveIndex((current) => (current + direction + rows.length) % rows.length)
    } else if (event.key === 'Home' && open) {
      event.preventDefault()
      setActiveIndex(0)
    } else if (event.key === 'End' && open) {
      event.preventDefault()
      setActiveIndex(rows.length - 1)
    } else if (event.key === 'Enter' && open && rows[activeIndex]) {
      event.preventDefault()
      choose(rows[activeIndex].key)
    } else if (event.key === 'Escape' && open) {
      event.preventDefault()
      setOpen(false)
      setQuery('')
    }
  }

  return (
    <div className={styles.root} ref={rootRef}>
      <label htmlFor={`${id}-search`}>Zemari</label>
      <div className={styles.inputWrap}>
        <input
          id={`${id}-search`}
          ref={inputRef}
          role="combobox"
          aria-expanded={open}
          aria-controls={`${id}-listbox`}
          aria-autocomplete="list"
          aria-activedescendant={open && rows[activeIndex] ? `${id}-${rows[activeIndex].key}` : undefined}
          autoComplete="off"
          disabled={disabled}
          value={open ? query : selected ? labelOf(selected) : ''}
          placeholder={open ? 'Type a name in English, Amharic, or transliteration…' : selected ? '' : 'No Zemari'}
          onFocus={() => { setOpen(true); setActiveIndex(0) }}
          onChange={(event) => { setQuery(event.target.value); setActiveIndex(0); setOpen(true) }}
          onKeyDown={onKeyDown}
        />
        <button
          className={styles.toggle}
          type="button"
          aria-label={`${open ? 'Close' : 'Open'} zemari options`}
          disabled={disabled}
          onClick={() => { setOpen((current) => !current); inputRef.current?.focus() }}
        >
          {open ? '▴' : '▾'}
        </button>
        {open && (
          <ul id={`${id}-listbox`} className={styles.listbox} role="listbox" aria-label="Zemaris">
            {rows.map((row, index) => (
              <li
                id={`${id}-${row.key}`}
                key={row.key}
                role="option"
                aria-selected={row.key === (value ?? NONE)}
                className={`${styles.option} ${own.option} ${index === activeIndex ? styles.optionActive : ''} ${row.key === (value ?? NONE) ? styles.optionSelected : ''} ${row.key === CREATE ? own.createOption : ''}`}
                onMouseDown={(event) => event.preventDefault()}
                onMouseEnter={() => setActiveIndex(index)}
                onClick={() => choose(row.key)}
              >
                <span className={styles.checkmark} aria-hidden="true">{row.key === (value ?? NONE) ? '✓' : ''}</span>
                <span>{row.label}</span>
              </li>
            ))}
          </ul>
        )}
      </div>
      <small className={styles.count} aria-live="polite">{open ? `${filtered.length} matching Zemari${filtered.length === 1 ? '' : 's'}` : ''}</small>
      {creating && createPortal(
        <CreateZemariDialog
          initialName={query}
          options={options}
          close={() => setCreating(false)}
          onUseExisting={(existingId) => { onChange(existingId); setQuery(''); setCreating(false) }}
          onCreated={(row) => { setCreating(false); setQuery(''); onCreated(row) }}
        />,
        document.body,
      )}
    </div>
  )
}

function CreateZemariDialog({
  initialName,
  options,
  close,
  onUseExisting,
  onCreated,
}: {
  initialName: string
  options: readonly ZemariOption[]
  close: () => void
  onUseExisting: (id: string) => void
  onCreated: (row: ZemariRow) => void
}) {
  const latin = /[A-Za-z]/.test(initialName)
  const [name, setName] = useState(latin ? initialName.trim() : '')
  const [nameAmharic, setNameAmharic] = useState(latin ? '' : initialName.trim())
  const [confirmed, setConfirmed] = useState(false)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const slug = slugifyZemari(name)
  const duplicates = useMemo(
    () => (name.trim() || nameAmharic.trim() ? findDuplicateZemaris({ name, name_amharic: nameAmharic, slug }, options) : []),
    [name, nameAmharic, slug, options],
  )
  const slugError = name.trim() && !slug ? 'Use English letters or numbers in the name so a web address (slug) can be created.' : ''
  const ready = Boolean(name.trim() && slug && confirmed && !duplicates.length && !busy)

  async function create() {
    setBusy(true)
    setError('')
    try {
      // Last check against the database, in case another editor added this Zemari after the list loaded.
      const taken = await findZemariBySlug(slug)
      if (taken) {
        setError(`A Zemari with the address "${slug}" already exists (${taken.name}). Use the existing one instead.`)
        return
      }
      const row = await saveZemari({ name: name.trim(), name_amharic: nameAmharic.trim() || null, slug, status: 'published' })
      onCreated(row)
    } catch (cause) {
      setError(`Could not create the Zemari. ${errorMessage(cause)}`)
    } finally {
      setBusy(false)
    }
  }

  return (
    <Modal title="Create new Zemari" close={close}>
      <form
        className={own.form}
        onSubmit={(event) => {
          event.preventDefault()
          // React bubbles events through portals: never let this reach the Mezmur form's own submit handler.
          event.stopPropagation()
          if (ready) void create()
        }}
      >
        <label>
          Name (English letters) *
          <input value={name} onChange={(event) => { setName(event.target.value); setConfirmed(false) }} autoFocus required />
        </label>
        <label>
          Amharic name
          <input lang="am" value={nameAmharic} onChange={(event) => { setNameAmharic(event.target.value); setConfirmed(false) }} />
        </label>
        {slug && <small>Web address: <code>{slug}</code></small>}
        {slugError && <p role="alert">{slugError}</p>}
        {duplicates.length > 0 && (
          <div role="alert">
            <strong>This looks like an existing Zemari. Creating a duplicate is blocked.</strong>
            <ul className={own.duplicates}>
              {duplicates.map((duplicate) => (
                <li key={duplicate.id}>
                  {duplicate.name} <small>(matches {duplicate.reason})</small>{' '}
                  <button type="button" onClick={() => onUseExisting(duplicate.id)}>Use this Zemari</button>
                </li>
              ))}
            </ul>
          </div>
        )}
        <label className={own.confirm}>
          <input type="checkbox" checked={confirmed} onChange={(event) => setConfirmed(event.target.checked)} />
          <span>I confirm this is a new person and I want to add a public Zemari profile for “{name.trim() || '…'}”.</span>
        </label>
        {error && <p role="alert">{error}</p>}
        <div className={own.actions}>
          <button type="button" onClick={close} disabled={busy}>Cancel</button>
          <button type="submit" disabled={!ready}>{busy ? 'Creating…' : 'Create Zemari'}</button>
        </div>
      </form>
    </Modal>
  )
}
