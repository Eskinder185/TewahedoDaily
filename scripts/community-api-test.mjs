/** Executes the real Pages handler with mocked Cloudflare/Supabase responses. */
import assert from 'node:assert/strict'
import { createServer } from 'vite'
const server = await createServer({ server: { middlewareMode: true } })
const originalFetch = globalThis.fetch
try {
 const { onRequest } = await server.ssrLoadModule('/functions/api/submissions.ts')
 const env = { SITE_URL:'https://example.invalid',SUPABASE_URL:'https://database.invalid',SUPABASE_SERVICE_ROLE_KEY:'sb_secret_test',TURNSTILE_SECRET_KEY:'test-secret',SUBMISSION_IP_HASH_SECRET:'a-test-only-secret-with-more-than-32-bytes' }
 const valid = { submission_type:'mezmur',title:'Community song',lyrics_english:'These lyrics have enough characters',contributor_name:'Visitor',contributor_email:'private@example.invalid',turnstile_token:'test-token' }
 let verification = { success:true,hostname:'example.invalid',action:'community_submission' }
 let receipt = { reference:'TD-2026-00128',repeated:false }
 const calls=[]
 globalThis.fetch = async (url,options) => {
  calls.push({url,body:options.body?JSON.parse(options.body):null})
  return Response.json(String(url).includes('siteverify')?verification:String(url).includes('rpc/')?receipt:[{title:'Trusted published title'}])
 }
 const send = (body=valid,headers={},method='POST') => onRequest({env,request:new Request(env.SITE_URL+'/api/submissions',{method,headers:{Origin:env.SITE_URL,'Content-Type':'application/json','CF-Connecting-IP':'192.0.2.1',...headers},...(method==='POST'?{body:JSON.stringify(body)}:{})})})
 assert.equal((await send(valid,{},'GET')).status,405)
 assert.equal((await send(valid,{Origin:'https://evil.invalid'})).status,403)
 for(const body of [{...valid,website:'spam'},{...valid,title:''},{...valid,title:'x'.repeat(201)},{...valid,youtube_url:'https://evil.invalid/watch?v=abcdefghijk'},{...valid,turnstile_token:''},{...valid,lyrics_english:''},{...valid,contributor_email:'invalid'}]) assert.equal((await send(body)).status,400)
 assert.equal(calls.length,0,'invalid inputs rejected before external calls')
 for(const result of [{success:false},{...verification,hostname:'evil.invalid'},{...verification,action:'login'}]) {
  verification=result; assert.equal((await send()).status,400)
 }
 assert.equal(calls.filter(c=>c.url.includes('database.invalid')).length,0)
 verification={success:true,hostname:'example.invalid',action:'community_submission'}
 const success=await send({...valid,status:'published',admin_notes:'forged',youtube_url:'https://youtu.be/abcdefghijk?t=20'})
 assert.equal(success.status,201)
 assert.deepEqual(await success.json(),receipt)
 const saved=calls.at(-1).body
 assert.match(saved.client_hash,/^[a-f0-9]{64}$/)
 assert.ok(!JSON.stringify(saved).includes('192.0.2.1'))
 assert.equal(saved.payload.youtube_url,'https://www.youtube.com/watch?v=abcdefghijk')
 assert.equal(saved.payload.status,undefined)
 assert.equal(saved.payload.admin_notes,undefined)
 receipt={error:'rate_limited'}; assert.equal((await send()).status,429)
 receipt={reference:'TD-2026-00129'}
 const correction={...valid,submission_type:'correction',correction_type:'spelling_issue',suggested_correction:'Please correct this spelling',explanation:'It differs from the source',related_content_id:'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',current_page_url:env.SITE_URL+'/practice/mezmur/song'}
 assert.equal((await send(correction)).status,201)
 assert.equal(calls.at(-1).body.payload.title,'Trusted published title')
 assert.equal((await send({...correction,current_page_url:'invalid'})).status,400)
 assert.equal((await send({...correction,current_page_url:'https://evil.invalid/practice/mezmur/song'})).status,400)
 assert.equal((await send({...valid,source_notes:'x'.repeat(400000)})).status,400)
 globalThis.fetch=async()=>{throw new Error('upstream secret must never leak')}
 const failure=await send(); assert.equal(failure.status,503); assert.ok(!(await failure.text()).includes('upstream secret'))
 console.log('Community endpoint: validation, Turnstile, origin, privacy, correction, and rate-limit responses passed.')
} finally { globalThis.fetch=originalFetch; await server.close() }
