import { useEffect, useId, useMemo, useRef, useState, type KeyboardEvent } from 'react'
import styles from './SearchableMultiSelect.module.css'

export type MultiSelectOption = {
  id: string
  label: string
  detail?: string
  count?: number
}

type Props = {
  label: string
  options: MultiSelectOption[]
  selected: string[]
  onChange: (ids: string[]) => void
  placeholder?: string
  helpText?: string
  disabled?: boolean
}

export function SearchableMultiSelect({
  label,
  options,
  selected,
  onChange,
  placeholder = 'Search and select…',
  helpText,
  disabled = false,
}: Props) {
  const id = useId()
  const rootRef = useRef<HTMLDivElement>(null)
  const inputRef = useRef<HTMLInputElement>(null)
  const [open, setOpen] = useState(false)
  const [query, setQuery] = useState('')
  const [activeIndex, setActiveIndex] = useState(0)

  const byId = useMemo(() => new Map(options.map((option) => [option.id, option])), [options])
  const filtered = useMemo(() => {
    const needle = query.trim().toLocaleLowerCase()
    if (!needle) return options
    return options.filter((option) =>
      `${option.label} ${option.detail || ''}`.toLocaleLowerCase().includes(needle),
    )
  }, [options, query])

  useEffect(() => {
    const close = (event: PointerEvent) => {
      if (!rootRef.current?.contains(event.target as Node)) setOpen(false)
    }
    document.addEventListener('pointerdown', close)
    return () => document.removeEventListener('pointerdown', close)
  }, [])

  function toggle(idToToggle: string) {
    onChange(
      selected.includes(idToToggle)
        ? selected.filter((value) => value !== idToToggle)
        : [...selected, idToToggle],
    )
  }

  function onKeyDown(event: KeyboardEvent<HTMLInputElement>) {
    if (event.key === 'ArrowDown' || event.key === 'ArrowUp') {
      event.preventDefault()
      setOpen(true)
      const direction = event.key === 'ArrowDown' ? 1 : -1
      setActiveIndex((current) =>
        filtered.length ? (current + direction + filtered.length) % filtered.length : 0,
      )
    } else if (event.key === 'Enter' && open && filtered[activeIndex]) {
      event.preventDefault()
      toggle(filtered[activeIndex].id)
    } else if (event.key === 'Escape') {
      setOpen(false)
    } else if (event.key === 'Backspace' && !query && selected.length) {
      onChange(selected.slice(0, -1))
    }
  }

  return (
    <div className={styles.root} ref={rootRef}>
      <div className={styles.labelRow}>
        <label htmlFor={`${id}-search`}>{label}</label>
        <span className={styles.count} aria-live="polite">{selected.length} selected</span>
      </div>
      {selected.length > 0 && (
        <div className={styles.chips} aria-label={`Selected ${label.toLowerCase()}`}>
          {selected.map((selectedId, index) => {
            const option = byId.get(selectedId)
            return (
              <span className={styles.chip} key={selectedId}>
                {option?.label || selectedId}
                {index === 0 && <span className={styles.primaryNote}>primary</span>}
                <button
                  type="button"
                  aria-label={`Remove ${option?.label || selectedId}`}
                  disabled={disabled}
                  onClick={() => toggle(selectedId)}
                >
                  ×
                </button>
              </span>
            )
          })}
        </div>
      )}
      <div className={styles.inputWrap}>
        <input
          id={`${id}-search`}
          ref={inputRef}
          role="combobox"
          aria-expanded={open}
          aria-controls={`${id}-listbox`}
          aria-autocomplete="list"
          aria-activedescendant={open && filtered[activeIndex] ? `${id}-${filtered[activeIndex].id}` : undefined}
          autoComplete="off"
          disabled={disabled}
          value={query}
          placeholder={placeholder}
          onFocus={() => setOpen(true)}
          onChange={(event) => {
            setQuery(event.target.value)
            setActiveIndex(0)
            setOpen(true)
          }}
          onKeyDown={onKeyDown}
        />
        <button
          className={styles.toggle}
          type="button"
          aria-label={`${open ? 'Close' : 'Open'} ${label.toLowerCase()} options`}
          disabled={disabled}
          onClick={() => {
            setOpen((value) => !value)
            inputRef.current?.focus()
          }}
        >
          {open ? '▴' : '▾'}
        </button>
        {open && (
          <ul id={`${id}-listbox`} className={styles.listbox} role="listbox" aria-multiselectable="true">
            {filtered.map((option, index) => {
              const isSelected = selected.includes(option.id)
              return (
                <li
                  id={`${id}-${option.id}`}
                  key={option.id}
                  role="option"
                  aria-selected={isSelected}
                  className={`${styles.option} ${index === activeIndex ? styles.optionActive : ''} ${isSelected ? styles.optionSelected : ''}`}
                  onMouseDown={(event) => event.preventDefault()}
                  onMouseEnter={() => setActiveIndex(index)}
                  onClick={() => toggle(option.id)}
                >
                  <span className={styles.checkmark} aria-hidden="true">{isSelected ? '✓' : ''}</span>
                  <span>{option.label}{option.detail ? ` · ${option.detail}` : ''}</span>
                  {typeof option.count === 'number' && <span className={styles.count}>{option.count}</span>}
                </li>
              )
            })}
            {!filtered.length && <li className={styles.empty}>No matching options.</li>}
          </ul>
        )}
      </div>
      {helpText && <small className={styles.count}>{helpText}</small>}
    </div>
  )
}
