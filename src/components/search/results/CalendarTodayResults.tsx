import type {
  CalendarTodayFields,
  CalendarTodayResponse,
  EthiopianDateTodayResponse,
  FastingTodayResponse,
  SeasonTodayResponse,
  SynaxariumTodayResponse,
} from '../../../lib/searchBuddy/apiTypes.ts'
import { displayText, textOrNull } from './resultHelpers.ts'
import { SynaxariumCard } from './SynaxariumSearchResults.tsx'
import styles from './ResultCard.module.css'

function asRecord(value: unknown): Record<string, unknown> | null {
  if (!value || typeof value !== 'object' || Array.isArray(value)) return null
  return value as Record<string, unknown>
}

function fieldText(data: CalendarTodayFields, ...keys: string[]): string | null {
  for (const key of keys) {
    const value = data[key]
    const text = textOrNull(value)
    if (text) return text
    const nested = asRecord(value)
    if (nested) {
      const nestedText = displayText(
        textOrNull(nested.title),
        textOrNull(nested.name),
        textOrNull(nested.title_english),
        textOrNull(nested.label),
        textOrNull(nested.ethiopian_label),
      )
      if (nestedText) return nestedText
    }
  }
  return null
}

function fieldBool(data: CalendarTodayFields, ...keys: string[]): boolean | null {
  for (const key of keys) {
    const value = data[key]
    if (typeof value === 'boolean') return value
    if (typeof value === 'string') {
      const lower = value.trim().toLowerCase()
      if (['true', 'yes', '1', 'fasting', 'active'].includes(lower)) return true
      if (['false', 'no', '0', 'not fasting', 'none'].includes(lower)) return false
    }
    const nested = asRecord(value)
    if (nested) {
      if (typeof nested.is_fast_day === 'boolean') return nested.is_fast_day
      if (typeof nested.is_fasting === 'boolean') return nested.is_fasting
      if (typeof nested.is_fast_free === 'boolean') return !nested.is_fast_free
    }
  }
  return null
}

function fieldNumber(data: CalendarTodayFields, ...keys: string[]): number | null {
  for (const key of keys) {
    const value = data[key]
    if (typeof value === 'number' && Number.isFinite(value)) return value
    if (typeof value === 'string' && value.trim() && !Number.isNaN(Number(value))) {
      return Number(value)
    }
  }
  return null
}

function nestedFast(data: CalendarTodayFields): Record<string, unknown> | null {
  return asRecord(data.active_fast) || asRecord(data.fasting_status)
}

function scriptureLines(data: CalendarTodayFields): string[] {
  const lines: string[] = []
  const single = displayText(data.scripture, data.scripture_reference)
  if (single) lines.push(single)

  const nested = nestedFast(data)
  const nestedScripture = textOrNull(nested?.scripture_references) || textOrNull(nested?.scripture)
  if (nestedScripture && !lines.includes(nestedScripture)) lines.push(nestedScripture)

  if (Array.isArray(data.scripture_references)) {
    for (const item of data.scripture_references) {
      const text = textOrNull(item)
      if (text && !lines.includes(text)) lines.push(text)
    }
  }
  return lines
}

function isOptionalFast(fastType: string | null): boolean {
  if (!fastType) return false
  const normalized = fastType.toLowerCase().replace(/\s+/g, '_')
  return (
    normalized === 'optional_fast' ||
    normalized === 'optional' ||
    normalized.includes('optional')
  )
}

export function CalendarTodayResult({ data }: { data: CalendarTodayResponse }) {
  const ethAm = fieldText(data, 'ethiopian_date_amharic', 'display_date_amharic')
  const ethEn = fieldText(
    data,
    'ethiopian_label',
    'ethiopian_date_english',
    'ethiopian_date',
    'display_date_english',
  )
  const weekday = fieldText(data, 'weekday')
  const gregorian = fieldText(data, 'gregorian_date_english', 'gregorian_date')
  const observance = fieldText(
    data,
    'primary_observance',
    'observance_title',
    'observance',
    'title',
  )
  const fastingNested = asRecord(data.fasting_status)
  const activeFastNested = asRecord(data.active_fast)
  const fastingStatus =
    fieldText(data, 'fasting_status') ||
    textOrNull(fastingNested?.label) ||
    textOrNull(activeFastNested?.name)
  const isFasting = fieldBool(data, 'is_fasting', 'fasting', 'fasting_status')
  const activeFast =
    fieldText(data, 'active_fast', 'fast_name') || textOrNull(activeFastNested?.name)
  const fastType =
    fieldText(data, 'fast_type') || textOrNull(activeFastNested?.fast_type)
  const optional = isOptionalFast(fastType)
  const season =
    fieldText(data, 'liturgical_season', 'season_name', 'season') ||
    textOrNull(asRecord(data.season)?.name) ||
    textOrNull(asRecord(data.season)?.title)
  const synCount = fieldNumber(data, 'synaxarium_count', 'commemorations_count')
  const summary = fieldText(data, 'summary', 'message')
  const gregorianLine = [weekday, gregorian].filter(Boolean).join(' · ')

  return (
    <article className={styles.card} aria-label="Today in the Church">
      <p className={styles.eyebrow}>Today</p>
      {ethAm ? (
        <h3 className={styles.titleAm} lang="am">
          {ethAm}
        </h3>
      ) : null}
      {ethEn ? <p className={ethAm ? styles.subtitle : styles.title}>{ethEn}</p> : null}
      {gregorianLine ? <p className={styles.meta}>{gregorianLine}</p> : null}

      <div className={styles.factList}>
        {observance ? (
          <p className={styles.factRow}>
            <span className={styles.factLabel}>Observance</span>
            <span className={styles.factValue}>{observance}</span>
          </p>
        ) : null}
        {fastingStatus || isFasting !== null || activeFast ? (
          <p className={styles.factRow}>
            <span className={styles.factLabel}>Fasting</span>
            <span className={styles.factValue}>
              {fastingStatus ||
                (activeFast
                  ? activeFast
                  : isFasting
                    ? 'Fasting day'
                    : isFasting === false
                      ? 'Not a fasting day'
                      : null)}
            </span>
          </p>
        ) : null}
        {optional ? (
          <p className={styles.factRow}>
            <span className={styles.factLabel}>Note</span>
            <span className={styles.factValue}>Optional devotional fast</span>
          </p>
        ) : null}
        {season ? (
          <p className={styles.factRow}>
            <span className={styles.factLabel}>Season</span>
            <span className={styles.factValue}>{season}</span>
          </p>
        ) : null}
        {synCount !== null ? (
          <p className={styles.factRow}>
            <span className={styles.factLabel}>Synaxarium</span>
            <span className={styles.factValue}>
              {synCount === 1 ? '1 commemoration' : `${synCount} commemorations`}
            </span>
          </p>
        ) : null}
      </div>
      {summary ? <p className={styles.preview}>{summary}</p> : null}
    </article>
  )
}

export function FastingTodayResult({ data }: { data: FastingTodayResponse }) {
  const nested = nestedFast(data)
  const fastName =
    fieldText(data, 'fast_name', 'active_fast', 'title', 'name') ||
    textOrNull(nested?.name) ||
    textOrNull(nested?.label)
  const fastType = fieldText(data, 'fast_type') || textOrNull(nested?.fast_type)
  const optional = isOptionalFast(fastType)
  const summary =
    fieldText(data, 'summary', 'message') || textOrNull(nested?.summary)
  const scriptures = scriptureLines(data)
  const isFasting = fieldBool(data, 'is_fasting', 'fasting', 'fasting_status')
  const isFastFree = asRecord(data.fasting_status)?.is_fast_free === true
  const ethDate = displayText(
    data.ethiopian_date_english,
    data.ethiopian_date,
    data.display_date_english,
    textOrNull(data.ethiopian_label),
  )
  const notes =
    textOrNull(asRecord(data.fasting_status)?.exception_note) ||
    textOrNull(nested?.fast_free_exception)

  let heading = 'Fasting today'
  if (optional && fastName) heading = `${fastName} is active today`
  else if (fastName) heading = `${fastName} is active today`
  else if (isFastFree) heading = 'Fast-free day'
  else if (isFasting === false) heading = 'Not a fasting day'
  else if (isFasting) heading = 'Fasting today'

  return (
    <article className={styles.card} aria-label="Fasting today">
      <p className={styles.eyebrow}>Fasting</p>
      <h3 className={styles.title}>{heading}</h3>
      {optional ? (
        <span className={styles.label}>Optional devotional fast</span>
      ) : fastType && !optional ? (
        <span className={styles.label}>{fastType.replace(/_/g, ' ')}</span>
      ) : null}
      {ethDate ? <p className={styles.meta}>{ethDate}</p> : null}
      {summary ? <p className={styles.preview}>{summary}</p> : null}
      {scriptures.length ? (
        <ul className={styles.refList}>
          {scriptures.map((line) => (
            <li key={line}>{line}</li>
          ))}
        </ul>
      ) : null}
      {notes ? <p className={styles.meta}>{notes}</p> : null}
    </article>
  )
}

export function SeasonTodayResult({ data }: { data: SeasonTodayResponse }) {
  const season =
    fieldText(data, 'liturgical_season', 'season_name', 'season', 'title') ||
    textOrNull(asRecord(data.season)?.name) ||
    textOrNull(asRecord(data.season)?.title)
  const seasonAm = fieldText(data, 'title_amharic')
  const summary = fieldText(data, 'summary', 'message')
  const ethDate = displayText(
    data.ethiopian_date_english,
    data.ethiopian_date,
    data.display_date_english,
    textOrNull(data.ethiopian_label),
  )

  return (
    <article className={styles.card} aria-label="Liturgical season">
      <p className={styles.eyebrow}>Season</p>
      {seasonAm ? (
        <h3 className={styles.titleAm} lang="am">
          {seasonAm}
        </h3>
      ) : null}
      {season ? <p className={seasonAm ? styles.subtitle : styles.title}>{season}</p> : null}
      {ethDate ? <p className={styles.meta}>{ethDate}</p> : null}
      {summary ? <p className={styles.preview}>{summary}</p> : null}
    </article>
  )
}

export function EthiopianDateTodayResult({ data }: { data: EthiopianDateTodayResponse }) {
  const ethAm = fieldText(data, 'ethiopian_date_amharic', 'display_date_amharic', 'title_amharic')
  const ethEn = fieldText(
    data,
    'ethiopian_label',
    'ethiopian_date_english',
    'ethiopian_date',
    'display_date_english',
    'title',
  )
  const weekday = fieldText(data, 'weekday')
  const gregorian = fieldText(data, 'gregorian_date_english', 'gregorian_date')
  const gregorianLine = [weekday, gregorian].filter(Boolean).join(' · ')

  return (
    <article className={styles.card} aria-label="Ethiopian date today">
      <p className={styles.eyebrow}>Ethiopian date</p>
      {ethAm ? (
        <h3 className={styles.titleAm} lang="am">
          {ethAm}
        </h3>
      ) : null}
      {ethEn ? <p className={ethAm ? styles.subtitle : styles.title}>{ethEn}</p> : null}
      {gregorianLine ? <p className={styles.meta}>{gregorianLine}</p> : null}
    </article>
  )
}

export function SynaxariumTodayResult({ data }: { data: SynaxariumTodayResponse }) {
  const title = fieldText(data, 'title')
  const titleAm = fieldText(data, 'title_amharic')
  const dateLine = displayText(
    data.display_date_english,
    data.ethiopian_date_english,
    textOrNull(data.ethiopian_label),
    data.ethiopian_date,
    data.display_date_amharic,
  )
  const commemorations = Array.isArray(data.commemorations)
    ? data.commemorations
    : Array.isArray(data.results)
      ? data.results
      : []

  const nested = asRecord(data.day)
  const nestedCommemorations =
    nested && Array.isArray(nested.commemorations) ? nested.commemorations : null
  const rows = commemorations.length
    ? commemorations
    : Array.isArray(nestedCommemorations)
      ? nestedCommemorations
      : []

  return (
    <div className={styles.stack} aria-label="Today's Synaxarium">
      <div className={`${styles.card} ${styles.cardQuiet}`}>
        <p className={styles.eyebrow}>Synaxarium today</p>
        {titleAm ? (
          <h3 className={styles.titleAm} lang="am">
            {titleAm}
          </h3>
        ) : null}
        {title && title !== titleAm ? (
          <p className={titleAm ? styles.subtitle : styles.title}>{title}</p>
        ) : !titleAm && dateLine ? (
          <h3 className={styles.title}>{dateLine}</h3>
        ) : null}
        {dateLine && (title || titleAm) ? <p className={styles.meta}>{dateLine}</p> : null}
      </div>
      {rows.length ? (
        rows.map((row, index) => {
          const item = asRecord(row) || {}
          return (
            <SynaxariumCard
              key={String(item.id || item.slug || index)}
              row={item}
            />
          )
        })
      ) : (
        <p className={styles.emptyNote}>No commemorations were returned for today.</p>
      )}
    </div>
  )
}
