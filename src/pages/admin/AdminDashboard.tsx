import { useCallback } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { getDashboard } from '../../lib/cms/mezmurService'
import { useAsync } from '../../lib/cms/useAsync'
import { AsyncNotice, Status } from './AdminUi'
import s from './Admin.module.css'
import { SubmissionAnalytics } from './SubmissionAnalytics'
import { adminEditPath } from './adminPaths'
export function AdminDashboard() {
  const result = useAsync(useCallback(() => getDashboard(), []))
  const { profile } = useAuth()
  const names = ['Total Mezmur', 'Published', 'Drafts', 'Pending Review', 'Saints', 'Articles']
  return <>
    <div className={s.heading}><div><p className={s.eyebrow}>TEWAHEDO DAILY CMS</p><h1>Dashboard</h1><p className={s.muted}>Your content and editorial activity at a glance.</p></div><Link className={s.primary} to="/admin/hymns/mezmur/new">+ Add Mezmur</Link></div>
    {profile?.role === 'contributor' && <p className={s.notice}>Counts include published content and your own submissions. Drafts by other contributors are private.</p>}
    <AsyncNotice {...result} retry={result.reload} />
    {profile?.role !== 'contributor' && <SubmissionAnalytics/>}
    {result.data && <>
      <div className={s.stats}>{names.map((name, i) => <div className={s.card} key={name}><span className={s.muted}>{name}</span><strong className={s.stat}>{result.data!.counts[i]}</strong></div>)}</div>
      <div className={s.activity}>{(['edited', 'published', 'review'] as const).map((key, i) => <section className={s.card} key={key}>
        <h2>{['Recently edited content', 'Recently published content', 'Content waiting for review'][i]}</h2>
        {!result.data![key].length && <p className={s.muted}>No content yet.</p>}
        <ul className={s.activityList}>{result.data![key].map(item => <li key={`${item.type}-${item.id}`}>
          <Link to={adminEditPath(item.type, item.id)}>{item.title}</Link>
          <small>{item.type} · {new Date((key === 'published' ? item.published_at : item.updated_at) || item.updated_at).toLocaleDateString()}</small><Status value={item.status} />
        </li>)}</ul>
      </section>)}</div>
    </>}
  </>
}

