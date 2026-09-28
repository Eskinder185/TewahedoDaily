/** Browser integration with mocked third-party services; real routes/components. */
import assert from 'node:assert/strict'
import { chromium } from 'playwright'
import { createServer } from 'vite'
process.env.VITE_SUPABASE_URL='https://community-test.supabase.co'
process.env.VITE_SUPABASE_ANON_KEY='sb_publishable_test'
process.env.VITE_TURNSTILE_SITE_KEY='test-site-key'
process.env.VITE_PUBLIC_MEZMUR_SOURCE='legacy'
const server=await createServer({server:{host:'127.0.0.1',port:4177,strictPort:true}})
await server.listen()
let browser
try {
 browser=await chromium.launch()
 const page=await browser.newPage()
 const errors=[];page.on('pageerror',error=>errors.push(error.message))
 const base='http://127.0.0.1:4177'
 const user={id:'33333333-3333-3333-3333-333333333333',email:'editor@example.invalid',aud:'authenticated',role:'authenticated',app_metadata:{},user_metadata:{},created_at:new Date().toISOString()}
 const token=[Buffer.from('{"alg":"HS256","typ":"JWT"}').toString('base64url'),Buffer.from(JSON.stringify({sub:user.id,exp:Math.floor(Date.now()/1000)+3600,role:'authenticated'})).toString('base64url'),'mock'].join('.')
 const item={id:'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',public_reference:'TD-2026-00128',submission_type:'mezmur',title:'Community browser song',title_amharic:'',singer_name:'Choir',youtube_url:'',lyrics_amharic:'',lyrics_english:'These are sufficiently long lyrics',lyrics_oromo:'',transliteration:'',suggested_category:'Mary',suggested_tags:['Test'],contributor_name:'Visitor',contributor_email:'private@example.invalid',credit_requested:true,source_notes:'Verify these notes',source_reference:'Book reference',admin_notes:'',related_content_id:null,related_legacy_key:null,related_content_title:null,current_page_url:null,correction_type:null,suggested_correction:'',explanation:'',status:'submitted',reviewed_by:null,reviewed_at:null,created_at:new Date().toISOString(),updated_at:new Date().toISOString()}
 const contentId='bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb'
 let converted=false;let role='editor';let posted
 await page.route('https://challenges.cloudflare.com/turnstile/v0/api.js*',route=>route.fulfill({contentType:'application/javascript',body:'window.turnstile={render:(el,options)=>{setTimeout(()=>options.callback("verified-test-token"),10);return "test"},remove:()=>{}}'}))
 await page.route('**/api/submissions',async route=>{posted=route.request().postDataJSON();await route.fulfill({status:201,json:{reference:item.public_reference}})})
 await page.route('https://community-test.supabase.co/**',async route=>{
  const request=route.request();const url=new URL(request.url());let body=[]
  if(url.pathname==='/auth/v1/token') body={access_token:token,refresh_token:'test-refresh',expires_in:3600,token_type:'bearer',user}
  else if(url.pathname==='/auth/v1/user')body=user
  else if(url.pathname==='/rest/v1/profiles')body={...user,display_name:'Test editor',avatar_url:null,role,updated_at:user.created_at}
  else if(url.pathname==='/rest/v1/community_submissions')body=url.searchParams.has('id')?item:[item]
  else if(url.pathname==='/rest/v1/rpc/cms_version_authors')body=[{id:user.id,display_name:'Test editor'}]
  else if(url.pathname==='/rest/v1/rpc/submission_duplicates')body=[{content_id:contentId,source:'mezmur',reference:'existing-song',title:'Possible matching song',reason:'Similar title',score:.8}]
  else if(url.pathname==='/rest/v1/rpc/review_submission'){const data=request.postDataJSON();item.status=data.new_status;item.admin_notes=data.notes;item.updated_at=new Date().toISOString();body=item}
  else if(url.pathname==='/rest/v1/rpc/convert_submission'){assert.equal(item.status,'approved');converted=true;item.status='converted_to_content';item.related_content_id=contentId;body=contentId}
  else if(url.pathname==='/rest/v1/mezmur'&&url.searchParams.has('id'))body={id:contentId,slug:'td-2026-00128',title:item.title,title_amharic:'',title_oromo:'',description:'',lyrics_amharic:'',lyrics_english:item.lyrics_english,lyrics_oromo:'',transliteration:'',youtube_url:'',audio_url:null,thumbnail_url:null,singer_id:null,category_id:null,featured:false,status:'draft',source_submission_id:item.id,contributor_credit:null,created_by:user.id,updated_by:user.id,created_at:item.created_at,updated_at:item.updated_at,published_at:null,mezmur_tags:[]}
  await route.fulfill({status:200,contentType:'application/json',headers:{'Content-Range':'0-0/1'},body:request.method()==='HEAD'?'':JSON.stringify(body)})
 })
 await page.goto(base+'/submit-mezmur')
 await page.setViewportSize({width:390,height:844})
 await page.getByLabel('Mezmur title').waitFor()
 assert.ok(await page.evaluate(()=>document.documentElement.scrollWidth<=window.innerWidth),'public form fits mobile')
 await page.setViewportSize({width:1280,height:900})
 await page.getByLabel('Mezmur title').fill(item.title)
 await page.getByLabel('English lyrics').fill(item.lyrics_english)
 await page.getByLabel('Contributor name').fill('Visitor')
 await page.getByLabel('Contributor email').fill('private@example.invalid')
 await page.getByRole('button',{name:'Submit for review'}).click()
 await page.getByRole('heading',{name:'Submission received'}).waitFor()
 assert.equal(posted.submission_type,'mezmur');assert.equal(posted.turnstile_token,'verified-test-token')
 assert.ok(!(await page.locator('body').innerText()).includes('private@example.invalid'))
 await page.goto(base+'/practice')
 const detail=page.locator('a[href^="/practice/mezmur/"]').first()
 await detail.waitFor();await detail.click()
 await page.getByRole('link',{name:'Suggest a Correction'}).click()
 await page.getByLabel('Correction type').selectOption('spelling_issue')
 await page.getByLabel('Suggested correction').fill('Please correct the spelling here')
 await page.getByLabel('Explanation').fill('This differs from the original text')
 await page.getByLabel('Contributor name').fill('Visitor')
 await page.getByRole('button',{name:'Send correction'}).click()
 await page.getByRole('heading',{name:'Submission received'}).waitFor()
 assert.equal(posted.submission_type,'correction');assert.ok(posted.related_legacy_key.startsWith('mezmur:'));assert.ok(posted.current_page_url.includes('/practice/mezmur/'))
 await page.goto(base+'/admin/submissions')
 await page.getByLabel('Email',{exact:true}).fill(user.email)
 await page.getByLabel('Password',{exact:true}).fill('test-password')
 await page.getByRole('button',{name:'Sign in',exact:true}).click()
 await page.getByRole('link',{name:'Submissions',exact:true}).click()
 await page.getByRole('heading',{name:'Submissions',exact:true}).waitFor()
 await page.getByRole('link',{name:'Review',exact:true}).click()
 await page.getByRole('heading',{name:item.title}).waitFor()
 await page.setViewportSize({width:390,height:844})
 assert.ok(await page.evaluate(()=>document.documentElement.scrollWidth<=window.innerWidth),'review fits mobile')
 await page.setViewportSize({width:1280,height:900})
 await page.getByRole('link',{name:'Possible matching song'}).waitFor()
 await page.getByRole('button',{name:'Start Review'}).click()
 await page.getByRole('button',{name:'Approve',exact:true}).click()
 await page.getByRole('button',{name:'Create Mezmur From Submission'}).click()
 await page.getByRole('heading',{name:'Edit Mezmur'}).waitFor()
 assert.equal(converted,true)
 assert.equal(await page.getByLabel('Title *',{exact:true}).inputValue(),item.title)
 assert.equal(await page.getByRole('button',{name:'Publish',exact:true}).count(),0)
 await page.getByRole('button',{name:'Submit for Review'}).waitFor()
 role='contributor';await page.reload();await page.goto(base+'/admin/submissions')
 await page.waitForURL(url=>!url.pathname.startsWith('/admin/submissions'))
 assert.equal(await page.getByText('private@example.invalid',{exact:true}).count(),0)
 assert.deepEqual(errors,[])
 console.log('Community browser: anonymous submission, public correction link, login, duplicate warning, review, draft conversion, and contributor denial passed.')
} finally {await browser?.close();await server.close()}
