import { useCallback, useMemo, useState } from 'react'
import { loadOrthodoxCalendarCatalog } from '../../lib/calendar/orthodoxCalendarData'
import { useAsync } from '../../lib/cms/useAsync'
import { AsyncNotice } from './AdminUi'
import s from './Admin.module.css'

type RuleKind = 'observances' | 'fasts' | 'seasons' | 'monthly'

const LABELS: Record<RuleKind, { title: string; table: string; detail: string }> = {
  observances: {
    title: 'Observances',
    table: 'public.orthodox_observances',
    detail: 'Fixed and movable feasts / holidays (published only on the public Calendar).',
  },
  fasts: {
    title: 'Fasts',
    table: 'public.liturgical_fasts',
    detail: 'Seasonal, vigil, weekly, and fast-free rules.',
  },
  seasons: {
    title: 'Seasons',
    table: 'public.liturgical_seasons',
    detail: 'Liturgical seasons with fixed or Pascha-relative ranges.',
  },
  monthly: {
    title: 'Monthly commemorations',
    table: 'public.monthly_commemorations',
    detail: 'Recurring day-of-month observances (Mary, angels, saints).',
  },
}

export function OrthodoxyRulesAdmin({ kind }: { kind: RuleKind }) {
  const meta = LABELS[kind]
  const [q, setQ] = useState('')
  const result = useAsync(
    useCallback(async () => loadOrthodoxCalendarCatalog(true), []),
  )

  const rows = useMemo(() => {
    const catalog = result.data
    if (!catalog) return [] as Array<{ id: string; title: string; secondary: string }>
    const list =
      kind === 'observances'
        ? catalog.observances.map((r) => ({
            id: r.id,
            title: r.title,
            secondary: [
              r.observance_type,
              r.is_movable
                ? `movable ${r.pascha_offset_days ?? ''}`
                : `Eth ${r.ethiopian_month_number}/${r.ethiopian_day}`,
              r.is_major ? 'major' : null,
              r.status,
            ]
              .filter(Boolean)
              .join(' · '),
          }))
        : kind === 'fasts'
          ? catalog.fasts.map((r) => ({
              id: r.id,
              title: r.name,
              secondary: [
                r.fast_type,
                r.is_movable ? 'movable' : 'fixed',
                `priority ${r.priority ?? 0}`,
                r.status,
              ]
                .filter(Boolean)
                .join(' · '),
            }))
          : kind === 'seasons'
            ? catalog.seasons.map((r) => ({
                id: r.id,
                title: r.title,
                secondary: [
                  r.season_type,
                  r.is_movable ? 'movable' : 'fixed',
                  `priority ${r.priority ?? 0}`,
                  r.status,
                ]
                  .filter(Boolean)
                  .join(' · '),
              }))
            : catalog.monthly.map((r) => ({
                id: r.id,
                title: r.title,
                secondary: [`day ${r.ethiopian_day}`, r.category, r.status]
                  .filter(Boolean)
                  .join(' · '),
              }))

    const query = q.trim().toLowerCase()
    if (!query) return list
    return list.filter(
      (row) =>
        row.title.toLowerCase().includes(query) || row.secondary.toLowerCase().includes(query),
    )
  }, [kind, q, result.data])

  return (
    <div className={s.stack}>
      <div className={s.card}>
        <h2>{meta.title}</h2>
        <p className={s.muted}>
          {meta.detail} Source: <code>{meta.table}</code>. Draft rows never appear on the public
          Calendar.
        </p>
        <div className={s.actions} style={{ marginTop: 12 }}>
          <label style={{ flex: 1, minWidth: 180 }}>
            Search
            <input
              value={q}
              onChange={(e) => setQ(e.target.value)}
              placeholder="Search published rows…"
            />
          </label>
          <button type="button" onClick={() => result.reload()}>
            Refresh
          </button>
        </div>
      </div>

      <AsyncNotice {...result} retry={result.reload} />

      <div className={s.card}>
        <p className={s.muted}>{rows.length} published row(s)</p>
        <div className={s.tableWrap}>
          <table>
            <thead>
              <tr>
                <th>Title</th>
                <th>Details</th>
              </tr>
            </thead>
            <tbody>
              {rows.map((row) => (
                <tr key={row.id}>
                  <td>{row.title}</td>
                  <td className={s.muted}>{row.secondary}</td>
                </tr>
              ))}
              {!rows.length && !result.loading ? (
                <tr>
                  <td colSpan={2} className={s.muted}>
                    No published rows found.
                  </td>
                </tr>
              ) : null}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  )
}

export function OrthodoxyObservancesAdmin() {
  return <OrthodoxyRulesAdmin kind="observances" />
}

export function OrthodoxyFastsAdmin() {
  return <OrthodoxyRulesAdmin kind="fasts" />
}

export function OrthodoxySeasonsAdmin() {
  return <OrthodoxyRulesAdmin kind="seasons" />
}

export function OrthodoxyMonthlyAdmin() {
  return <OrthodoxyRulesAdmin kind="monthly" />
}
