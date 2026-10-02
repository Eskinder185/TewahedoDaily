import { useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import {
  runContentHealthCheck,
  type ContentHealthIssue,
  type ContentHealthReport,
  type HealthDomain,
  type HealthSeverity,
} from '../../lib/cms/contentHealthService'
import s from './Admin.module.css'
import styles from './ContentHealthAdmin.module.css'

const SEVERITIES: Array<HealthSeverity | 'all'> = ['all', 'critical', 'warning', 'review', 'info']
const DOMAINS: Array<HealthDomain | 'all'> = [
  'all',
  'mezmur',
  'prayers',
  'psalms',
  'liturgy',
  'calendar',
  'synaxarium',
  'media',
  'relationships',
  'system',
]

function severityClass(severity: HealthSeverity): string {
  if (severity === 'critical') return styles.sevCritical
  if (severity === 'warning') return styles.sevWarning
  if (severity === 'review') return styles.sevReview
  return styles.sevInfo
}

function formatCheckedAt(iso: string): string {
  try {
    return new Date(iso).toLocaleString(undefined, {
      dateStyle: 'medium',
      timeStyle: 'short',
    })
  } catch {
    return iso
  }
}

export function ContentHealthAdmin() {
  const [report, setReport] = useState<ContentHealthReport | null>(null)
  const [running, setRunning] = useState(false)
  const [phase, setPhase] = useState('')
  const [error, setError] = useState('')
  const [severity, setSeverity] = useState<HealthSeverity | 'all'>('all')
  const [domain, setDomain] = useState<HealthDomain | 'all'>('all')
  const [query, setQuery] = useState('')
  const [selected, setSelected] = useState<ContentHealthIssue | null>(null)

  async function runCheck() {
    setRunning(true)
    setError('')
    setPhase('Starting…')
    setSelected(null)
    try {
      const next = await runContentHealthCheck((progress) => setPhase(progress.phase))
      setReport(next)
      setPhase('')
    } catch (cause) {
      if (import.meta.env.DEV) console.error('[contentHealth] run', cause)
      setError(
        cause && typeof cause === 'object' && 'message' in cause
          ? String((cause as { message?: unknown }).message)
          : 'Health check failed.',
      )
    } finally {
      setRunning(false)
    }
  }

  const filtered = useMemo(() => {
    if (!report) return []
    const q = query.trim().toLowerCase()
    return report.issues.filter((issue) => {
      if (severity !== 'all' && issue.severity !== severity) return false
      if (domain !== 'all' && issue.domain !== domain) return false
      if (!q) return true
      return (
        issue.title.toLowerCase().includes(q) ||
        issue.description.toLowerCase().includes(q) ||
        issue.issueType.toLowerCase().includes(q) ||
        (issue.recordSlug || '').toLowerCase().includes(q) ||
        (issue.recordId || '').toLowerCase().includes(q) ||
        issue.table.toLowerCase().includes(q)
      )
    })
  }, [report, severity, domain, query])

  return (
    <>
      <div className={s.heading}>
        <div>
          <p className={s.eyebrow}>CMS DIAGNOSTICS</p>
          <h1>Content Health</h1>
          <p className={s.muted}>
            Check the site&apos;s content, relationships, media, and publishing data. Read-only —
            religious content is never auto-rewritten.
          </p>
        </div>
        <div className={styles.actions}>
          <button type="button" className={s.primary} disabled={running} onClick={() => void runCheck()}>
            {running ? 'Running…' : 'Run Health Check'}
          </button>
          <button
            type="button"
            disabled={running || !report}
            onClick={() => void runCheck()}
          >
            Refresh
          </button>
        </div>
      </div>

      {running ? (
        <p className={s.notice} role="status">
          {phase || 'Checking…'}
        </p>
      ) : null}
      {error ? (
        <p className={s.notice} role="alert">
          {error}
        </p>
      ) : null}

      {!report && !running ? (
        <p className={s.muted}>
          Click <strong>Run Health Check</strong> to scan live Supabase content. No numbers are shown
          until a real scan finishes.
        </p>
      ) : null}

      {report ? (
        <>
          <p className={s.muted}>
            Last checked: {formatCheckedAt(report.checkedAt)} · {report.durationMs} ms ·{' '}
            {report.totals.recordsChecked} records inspected
            {report.completenessPercent != null ? ` · ~${report.completenessPercent}% completeness` : ''}
          </p>

          {report.domainErrors.length ? (
            <p className={s.notice} role="status">
              Some domains failed to scan:{' '}
              {report.domainErrors.map((d) => `${d.domain} (${d.message})`).join('; ')}. Other
              results still shown.
            </p>
          ) : null}

          <div className={styles.summaryRow}>
            <div className={`${s.card} ${styles.summaryCard} ${styles.sevCritical}`}>
              <span className={s.muted}>Critical</span>
              <strong className={s.stat}>{report.totals.critical}</strong>
            </div>
            <div className={`${s.card} ${styles.summaryCard} ${styles.sevWarning}`}>
              <span className={s.muted}>Warnings</span>
              <strong className={s.stat}>{report.totals.warning}</strong>
            </div>
            <div className={`${s.card} ${styles.summaryCard} ${styles.sevReview}`}>
              <span className={s.muted}>Needs Review</span>
              <strong className={s.stat}>{report.totals.review}</strong>
            </div>
            <div className={`${s.card} ${styles.summaryCard} ${styles.sevInfo}`}>
              <span className={s.muted}>Healthy (est.)</span>
              <strong className={s.stat}>{report.totals.healthyEstimate}</strong>
            </div>
          </div>

          {report.psalms.collectionSlug ? (
            <section className={`${s.card} ${styles.psalmPanel}`}>
              <h2>Mezmure Dawit</h2>
              <p>
                <strong>
                  {report.psalms.detected} / {report.psalms.expected}
                </strong>{' '}
                detected
                {report.psalms.min != null && report.psalms.max != null
                  ? ` · range ${report.psalms.min}–${report.psalms.max}`
                  : ''}
              </p>
              {report.psalms.missing.length ? (
                <p className={s.muted}>
                  Missing: {report.psalms.missing.slice(0, 20).map((n) => `Psalm ${n}`).join(', ')}
                  {report.psalms.missing.length > 20 ? '…' : ''}
                </p>
              ) : (
                <p className={s.muted}>No missing Psalm numbers.</p>
              )}
              {report.psalms.duplicates.length ? (
                <p className={s.muted}>
                  Duplicates:{' '}
                  {report.psalms.duplicates
                    .map((d) => `Psalm ${d.number} (${d.count})`)
                    .join(', ')}
                </p>
              ) : null}
              {report.psalms.invalidSlugs.length ? (
                <p className={s.muted}>
                  Invalid: {report.psalms.invalidSlugs.slice(0, 12).join(', ')}
                  {report.psalms.invalidSlugs.length > 12 ? '…' : ''}
                </p>
              ) : null}
            </section>
          ) : null}

          {report.zeweter.collectionSlug ? (
            <section className={`${s.card} ${styles.psalmPanel}`}>
              <h2>Zeweter Tselot</h2>
              <p className={s.muted}>
                Collection <code>{report.zeweter.collectionSlug}</code> · {report.zeweter.prayerCount}{' '}
                prayers
              </p>
              <p>
                First: {report.zeweter.firstTitle || report.zeweter.firstSlug || '—'}{' '}
                {report.zeweter.firstOk ? '✓' : '(unexpected)'}
              </p>
              <p>
                Last: {report.zeweter.lastTitle || report.zeweter.lastSlug || '—'}{' '}
                {report.zeweter.lastOk ? '✓' : '(unexpected)'}
              </p>
            </section>
          ) : null}

          <div className={styles.domainGrid}>
            {report.domains.map((card) => (
              <button
                key={card.domain}
                type="button"
                className={`${s.card} ${styles.domainCard} ${domain === card.domain ? styles.domainActive : ''}`}
                onClick={() => setDomain(card.domain === domain ? 'all' : card.domain)}
              >
                <span className={styles.domainLabel}>{card.label}</span>
                <strong>{card.recordCount}</strong>
                <small className={s.muted}>
                  {card.critical} critical · {card.warning} warnings · {card.review} review
                </small>
                {card.highlights[0] ? <small className={s.muted}>{card.highlights[0]}</small> : null}
              </button>
            ))}
          </div>

          {report.coverage.length ? (
            <section className={`${s.card} ${styles.coverage}`}>
              <h2>Coverage</h2>
              <ul className={styles.coverageList}>
                {report.coverage.map((c) => (
                  <li key={c.id}>
                    <span>{c.label}</span>
                    <strong>
                      {c.present}/{c.total} ({c.percent}%)
                    </strong>
                  </li>
                ))}
              </ul>
            </section>
          ) : null}

          <form
            className={styles.filters}
            onSubmit={(event) => event.preventDefault()}
          >
            <label>
              Severity
              <select
                value={severity}
                onChange={(e) => setSeverity(e.target.value as HealthSeverity | 'all')}
              >
                {SEVERITIES.map((value) => (
                  <option key={value} value={value}>
                    {value === 'all' ? 'All' : value}
                  </option>
                ))}
              </select>
            </label>
            <label>
              Domain
              <select
                value={domain}
                onChange={(e) => setDomain(e.target.value as HealthDomain | 'all')}
              >
                {DOMAINS.map((value) => (
                  <option key={value} value={value}>
                    {value === 'all' ? 'All' : value}
                  </option>
                ))}
              </select>
            </label>
            <label className={styles.search}>
              Search
              <input
                value={query}
                onChange={(e) => setQuery(e.target.value)}
                placeholder="Title, slug, ID, issue type"
              />
            </label>
          </form>

          <p className={s.muted}>
            Showing {filtered.length} of {report.issues.length} issues
          </p>

          <div className={styles.issueLayout}>
            <ul className={styles.issueList}>
              {filtered.map((issue) => (
                <li key={issue.id}>
                  <button
                    type="button"
                    className={`${styles.issueRow} ${selected?.id === issue.id ? styles.issueSelected : ''}`}
                    onClick={() => setSelected(issue)}
                  >
                    <span className={`${styles.sevBadge} ${severityClass(issue.severity)}`}>
                      {issue.severity}
                    </span>
                    <span className={styles.issueDomain}>{issue.domain}</span>
                    <span className={styles.issueTitle}>{issue.title}</span>
                    {issue.adminRoute ? (
                      <Link
                        className={styles.openLink}
                        to={issue.adminRoute}
                        onClick={(e) => e.stopPropagation()}
                      >
                        Open editor
                      </Link>
                    ) : (
                      <span className={s.muted}>—</span>
                    )}
                  </button>
                </li>
              ))}
              {!filtered.length ? (
                <li className={s.muted}>No issues match these filters.</li>
              ) : null}
            </ul>

            <aside className={`${s.card} ${styles.detail}`} aria-live="polite">
              {selected ? (
                <>
                  <p className={`${styles.sevBadge} ${severityClass(selected.severity)}`}>
                    {selected.severity}
                  </p>
                  <h2>{selected.title}</h2>
                  <p>{selected.description}</p>
                  <dl className={styles.detailDl}>
                    <div>
                      <dt>Domain</dt>
                      <dd>{selected.domain}</dd>
                    </div>
                    <div>
                      <dt>Issue type</dt>
                      <dd>
                        <code>{selected.issueType}</code>
                      </dd>
                    </div>
                    <div>
                      <dt>Table</dt>
                      <dd>
                        <code>{selected.table}</code>
                      </dd>
                    </div>
                    {selected.recordId ? (
                      <div>
                        <dt>Record ID</dt>
                        <dd>
                          <code>{selected.recordId}</code>
                        </dd>
                      </div>
                    ) : null}
                    {selected.recordSlug ? (
                      <div>
                        <dt>Slug</dt>
                        <dd>
                          <code>{selected.recordSlug}</code>
                        </dd>
                      </div>
                    ) : null}
                    <div>
                      <dt>Detected</dt>
                      <dd>{formatCheckedAt(selected.detectedAt)}</dd>
                    </div>
                    <div>
                      <dt>Suggested action</dt>
                      <dd>
                        {selected.repairable
                          ? 'Optional deterministic fix available in a future pass — prefer Open editor.'
                          : 'Open the CMS editor and resolve manually. Do not auto-merge religious records.'}
                      </dd>
                    </div>
                  </dl>
                  {selected.metadata ? (
                    <pre className={styles.meta}>{JSON.stringify(selected.metadata, null, 2)}</pre>
                  ) : null}
                  {selected.adminRoute ? (
                    <Link className={s.primary} to={selected.adminRoute}>
                      Open editor →
                    </Link>
                  ) : null}
                </>
              ) : (
                <p className={s.muted}>Select an issue to see details.</p>
              )}
            </aside>
          </div>
        </>
      ) : null}
    </>
  )
}
