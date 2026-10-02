/** Content Health diagnostics — read-only issue model for the CMS dashboard. */

export type HealthSeverity = 'critical' | 'warning' | 'review' | 'info'

export type HealthDomain =
  | 'mezmur'
  | 'prayers'
  | 'psalms'
  | 'liturgy'
  | 'calendar'
  | 'synaxarium'
  | 'media'
  | 'relationships'
  | 'system'

export type ContentHealthIssue = {
  id: string
  severity: HealthSeverity
  domain: HealthDomain
  issueType: string
  title: string
  description: string
  table: string
  recordId?: string
  recordSlug?: string
  route?: string
  adminRoute?: string
  detectedAt: string
  repairable: boolean
  metadata?: Record<string, string | number | boolean | null>
}

export type DomainMetric = {
  domain: HealthDomain
  label: string
  recordCount: number
  critical: number
  warning: number
  review: number
  info: number
  /** Optional domain-specific lines (e.g. "149 / 150 psalms"). */
  highlights: string[]
}

export type CoverageMetric = {
  id: string
  label: string
  present: number
  total: number
  percent: number
}

export type ContentHealthReport = {
  checkedAt: string
  durationMs: number
  issues: ContentHealthIssue[]
  domains: DomainMetric[]
  coverage: CoverageMetric[]
  totals: {
    critical: number
    warning: number
    review: number
    info: number
    healthyEstimate: number
    recordsChecked: number
  }
  completenessPercent: number
  psalms: {
    collectionSlug: string | null
    detected: number
    expected: number
    min: number | null
    max: number | null
    missing: number[]
    duplicates: { number: number; count: number }[]
    invalidSlugs: string[]
  }
  zeweter: {
    collectionSlug: string | null
    prayerCount: number
    firstSlug: string | null
    firstTitle: string | null
    lastSlug: string | null
    lastTitle: string | null
    firstOk: boolean
    lastOk: boolean
  }
  domainErrors: { domain: HealthDomain; message: string }[]
}

export type HealthProgress = {
  phase: string
  domain?: HealthDomain
}
