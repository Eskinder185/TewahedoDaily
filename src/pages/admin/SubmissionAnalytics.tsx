import { useCallback } from 'react'
import { useAsync } from '../../lib/cms/useAsync'
import { db } from '../../lib/cms/mezmurService'
import { AsyncNotice } from './AdminUi'
import s from './Admin.module.css'
export function SubmissionAnalytics() {
  const result = useAsync(
    useCallback(async () => {
      const now = new Date()
      const since = new Date(
        Date.UTC(now.getUTCFullYear(), now.getUTCMonth(), 1),
      ).toISOString()
      const requests = await Promise.all([
        db()
          .from('community_submissions')
          .select('id', { count: 'exact', head: true })
          .gte('created_at', since),
        db()
          .from('community_submissions')
          .select('id', { count: 'exact', head: true })
          .in('status', ['submitted', 'under_review']),
      ])
      for (const r of requests) if (r.error) throw r.error
      return requests.map((r) => r.count || 0)
    }, []),
  )
  return (
    <section>
      <h2>Community activity</h2>
      <AsyncNotice {...result} retry={result.reload} />
      {result.data && (
        <div className={s.stats}>
          {['Submissions this month (UTC)', 'Awaiting review'].map(
            (label, i) => (
              <div key={label} className={s.card}>
                <span>{label}</span>
                <strong className={s.stat}>{result.data![i]}</strong>
              </div>
            ),
          )}
        </div>
      )}
      <p className={s.muted}>
        Editorial counts only. No visitor tracking is collected.
      </p>
    </section>
  )
}
