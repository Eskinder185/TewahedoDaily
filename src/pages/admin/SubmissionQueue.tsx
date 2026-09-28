import { useCallback, useState, type FormEvent } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { useAsync } from '../../lib/cms/useAsync'
import { listSubmissions, submissionCounts, submissionStatuses, submissionTypes, reviewAuthors } from '../../lib/cms/submissionService'
import { AsyncNotice, Status } from './AdminUi'
import s from './Admin.module.css'
export function SubmissionQueue() {
 const [params,setParams]=useSearchParams()
 const key=params.toString()
 const page=Math.max(1,Math.floor(Number(params.get('page'))||1))
 const result=useAsync(useCallback(()=>{const p=new URLSearchParams(key);return listSubmissions(p.get('search')||'',p.get('status')||'',p.get('type')||'',Math.max(1,Math.floor(Number(p.get('page'))||1)))},[key]))
 const summary=useAsync(useCallback(async()=>({counts:await submissionCounts(),authors:await reviewAuthors()}),[]))
 const [search,setSearch]=useState(params.get('search')||'')
 function filter(event:FormEvent<HTMLFormElement>){event.preventDefault();const fields=new FormData(event.currentTarget);const next=new URLSearchParams();for(const [key,value] of fields) if(value)next.set(key,String(value));setParams(next)}
 return <>
  <div className={s.heading}><div><p className={s.eyebrow}>COMMUNITY CONTRIBUTIONS</p><h1>Submissions</h1><p className={s.muted}>Review and verify contributions before creating content.</p></div><button onClick={()=>{result.reload();summary.reload()}}>Refresh</button></div>
  <AsyncNotice {...summary} retry={summary.reload}/>
  {summary.data&&<div className={s.stats}>{summary.data.counts.map((item,i)=><div className={s.card} key={item.status}><span>{['New','Under Review','Needs Changes','Approved','Rejected'][i]}</span><strong className={s.stat}>{item.count}</strong></div>)}</div>}
  <form onSubmit={filter} className={s.filters}>
   <label>Search<input name="search" value={search} onChange={e=>setSearch(e.target.value)} placeholder="Title, reference, contributor"/></label>
   <label>Status<select name="status" aria-label="Submission status" defaultValue={params.get('status')||''}><option value="">All statuses</option>{submissionStatuses.map(status=><option key={status} value={status}>{status.replaceAll('_',' ')}</option>)}</select></label>
   <label>Type<select name="type" aria-label="Submission type" defaultValue={params.get('type')||''}><option value="">All types</option>{submissionTypes.map(type=><option key={type}>{type}</option>)}</select></label><button type="submit">Apply filters</button>
  </form>
  <AsyncNotice {...result} retry={result.reload}/>
  {result.data&&<><p>{result.data.count} submissions</p><div className={s.tableWrap}><table><thead><tr>{['Date','Reference','Title','Contributor','Type','Status','Reviewer','Actions'].map(label=><th key={label}>{label}</th>)}</tr></thead><tbody>
   {result.data.rows.map(item=><tr key={item.id}><td>{new Date(item.created_at).toLocaleDateString()}</td><td>{item.public_reference}</td><td>{item.title}</td><td>{item.contributor_name}</td><td>{item.submission_type}</td><td><Status value={item.status}/></td><td>{summary.data?.authors.find(author=>author.id===item.reviewed_by)?.display_name||'—'}</td><td><Link to={`/admin/submissions/${item.id}`}>Review</Link></td></tr>)}
   {!result.data.rows.length&&<tr><td colSpan={8}>No submissions match these filters.</td></tr>}
  </tbody></table></div><div className={s.pagination}><span>Page {page} of {Math.max(1,Math.ceil(result.data.count/20))}</span><div className={s.actions}><button disabled={page<=1} onClick={()=>{const p=new URLSearchParams(params);p.set('page',String(page-1));setParams(p)}}>Previous</button><button disabled={page*20>=result.data.count} onClick={()=>{const p=new URLSearchParams(params);p.set('page',String(page+1));setParams(p)}}>Next</button></div></div></>}
 </>
}
