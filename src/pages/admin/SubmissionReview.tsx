import { useCallback, useEffect, useState } from 'react'
import { Link, useBlocker, useNavigate, useParams } from 'react-router-dom'
import { useAsync } from '../../lib/cms/useAsync'
import { convertSubmission, getDuplicates, getSubmission, reviewSubmission } from '../../lib/cms/submissionService'
import { errorMessage } from '../../lib/cms/mezmurService'
import type { CommunitySubmission, SubmissionStatus } from '../../lib/community/types'
import { AsyncNotice, Modal, Status } from './AdminUi'
import s from './Admin.module.css'
export function SubmissionReview() {
 const {id}=useParams()
 const result=useAsync(useCallback(()=>getSubmission(id!),[id]))
 return <><AsyncNotice {...result} retry={result.reload}/>{result.data&&<ReviewForm key={result.data.id} initial={result.data}/>}</>
}
function ReviewForm({initial}:{initial:CommunitySubmission}) {
 const [item,setItem]=useState(initial)
 const [notes,setNotes]=useState(initial.admin_notes)
 const [credit,setCredit]=useState(false)
 const [busy,setBusy]=useState(false)
 const [error,setError]=useState('')
 const [success,setSuccess]=useState('')
 const navigate=useNavigate()
 const duplicates=useAsync(useCallback(()=>getDuplicates(item.id),[item.id]))
 const dirty=notes!==item.admin_notes
 const blocker=useBlocker(dirty&&!busy)
 useEffect(()=>{const prevent=(event:BeforeUnloadEvent)=>{if(dirty){event.preventDefault();event.returnValue=''}};window.addEventListener('beforeunload',prevent);return()=>window.removeEventListener('beforeunload',prevent)},[dirty])
 async function review(status:SubmissionStatus){
  if(['rejected','duplicate'].includes(status)&&!window.confirm(`Mark this submission ${status}? It will not be converted to content.`))return
  setBusy(true);setError('');setSuccess('')
  try {const saved=await reviewSubmission(item,status,notes);setItem(saved);setNotes(saved.admin_notes);setSuccess('Review saved. No content has been published.')}catch(cause){setError(errorMessage(cause))}finally{setBusy(false)}
 }
 async function convert(){
  if(dirty){setError('Save your review notes before converting.');return}
  setBusy(true);setError('')
  try {const id=await convertSubmission(item,credit);navigate(`/admin/hymns/mezmur/${id}/edit`,{state:{saved:true}})}catch(cause){setError(errorMessage(cause));setBusy(false)}
 }
 const converted=item.status==='converted_to_content'
 const link=(url:string|null,label:string)=>url&&/^https:\/\//i.test(url)?<a href={url} target="_blank" rel="noreferrer">{label} ↗</a>:<span>{url||'—'}</span>
 return <>
  <Link to="/admin/submissions">← Submission queue</Link><div className={s.heading}><div><p className={s.eyebrow}>{item.public_reference}</p><h1>{item.title}</h1><Status value={item.status}/></div><span>{item.submission_type}</span></div>
  {error&&<p role="alert" className={s.error}>{error}</p>}{success&&<p role="status" className={s.success}>{success}</p>}
  <div className={s.formGrid}><div className={s.stack}>
   <section className={s.card}><h2>Contribution details</h2><p lang="am">{item.title_amharic}</p><p><strong>Singer / choir:</strong> {item.singer_name||'Not supplied'}</p><p>{link(item.youtube_url,'YouTube video')}</p>
    {(['lyrics_amharic','lyrics_english','lyrics_oromo','transliteration','suggested_correction','explanation'] as const).map(key=>item[key]&&<section key={key}><h3 className={s.capitalize}>{key.replaceAll('_',' ')}</h3><p className={s.lyrics}>{item[key]}</p></section>)}
    {item.correction_type&&<p><strong>Correction type:</strong> {item.correction_type.replaceAll('_',' ')}</p>}
    <p><strong>Suggested category:</strong> {item.suggested_category||'—'}</p><p><strong>Suggested tags:</strong> {item.suggested_tags.join(', ')||'—'}</p>
    <h3>Additional notes</h3><p className={s.lyrics}>{item.source_notes||'None'}</p><h3>Source / reference</h3><p>{link(item.source_reference,item.source_reference)}</p>
    {item.current_page_url&&<p>{link(item.current_page_url,'Original Mezmur page')}</p>}
    {item.related_legacy_key&&<p className={s.muted}>Legacy catalog reference: {item.related_legacy_key}. Corrections to this catalog require a separate verified content edit.</p>}
    {item.related_content_id&&<Link to={`/admin/hymns/mezmur/${item.related_content_id}/edit`}>Open related Mezmur →</Link>}
   </section>
   <section className={s.card}><h2>Possible duplicates</h2><p className={s.muted}>Matches are suggestions, never automatic rejections. Verify the original source before deciding.</p><AsyncNotice {...duplicates} retry={duplicates.reload}/>
    {duplicates.data&&!duplicates.data.length&&<p>No likely matches found in the CMS, submissions, or imported chant catalog.</p>}
    <ul className={s.activityList}>{duplicates.data?.map(match=><li key={`${match.source}-${match.content_id}`}><Link to={match.source==='mezmur'?`/admin/hymns/mezmur/${match.content_id}/edit`:match.source==='submission'?`/admin/submissions/${match.content_id}`:`/practice/mezmur/${match.reference}`}>{match.title}</Link><small>{match.reason} · {match.source} · {match.reference}</small></li>)}</ul>
   </section>
  </div><aside className={s.stack}>
   <section className={s.card}><h2>Contributor</h2><p>{item.contributor_name}</p><p>{item.contributor_email||'No email supplied'}</p><p className={s.muted}>Email is private to reviewers.</p><p>Credit requested: {item.credit_requested?'Yes':'No'}</p><p>Submitted: {new Date(item.created_at).toLocaleString()}</p>{item.reviewed_at&&<p>Last reviewed: {new Date(item.reviewed_at).toLocaleString()}</p>}</section>
   <section className={`${s.card} ${s.fields}`}><h2>Editorial review</h2><label>Private review notes<textarea maxLength={8000} value={notes} disabled={busy||converted} onChange={event=>setNotes(event.target.value)}/></label>
    <p className={s.muted}>Request Changes records the decision and your notes. It does not send an email; contact the contributor separately if needed.</p>
    <fieldset disabled={busy||converted}><div className={s.actions}>
     {item.status!=='under_review'&&<button onClick={()=>void review('under_review')}>Start Review</button>}
     {item.status==='under_review'&&<><button onClick={()=>void review('approved')}>Approve</button><button onClick={()=>void review('rejected')}>Reject</button><button onClick={()=>void review('needs_changes')}>Request Changes</button><button onClick={()=>void review('duplicate')}>Mark Duplicate</button></>}
     {item.status !== 'submitted' && <button disabled={!dirty} onClick={()=>void review(item.status)}>Save notes</button>}
    </div></fieldset>
    {item.status==='approved'&&item.submission_type==='mezmur'&&<>
     {item.credit_requested&&<label className={s.check}><input type="checkbox" checked={credit} disabled={busy} onChange={event=>setCredit(event.target.checked)}/>Include contributor name as optional public credit</label>}
     <button className={s.primary} disabled={busy} onClick={()=>void convert()}>Create Mezmur From Submission</button><p className={s.muted}>Creates one draft and opens the Mezmur editor. Verify translations, choose official taxonomy, and submit it for final review.</p>
    </>}
    {item.status==='approved'&&item.submission_type==='correction'&&<p className={s.notice}>Approval does not change the public entry. Verify and apply the correction in the related content editor, with its normal review workflow.</p>}
    {busy&&<p role="status">Saving…</p>}
   </section>
  </aside></div>
  {blocker.state==='blocked'&&<Modal title="Discard unsaved review notes?" close={()=>blocker.reset()}><button onClick={()=>blocker.reset()}>Keep reviewing</button><button onClick={()=>blocker.proceed()}>Discard notes</button></Modal>}
 </>
}
