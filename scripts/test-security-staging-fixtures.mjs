/** Offline only: fake Auth/SQL/test IO; no Supabase or PostgreSQL connections. */
import assert from 'node:assert/strict'
import { readFileSync, writeFileSync, mkdtempSync, mkdirSync, symlinkSync, rmSync, realpathSync } from 'node:fs'
import { spawnSync } from 'node:child_process'
import { EventEmitter } from 'node:events'
import os from 'node:os'
import path from 'node:path'
import { StagingError, validateTarget, validateExecutionEnvironment, validateUserToken, validateStateDirectory } from './security-staging-environment.mjs'
import { newFixture, runFixtures, fixtureStore, seedSql, verifySql, cleanupSql } from './security-staging-fixtures.mjs'
import { fixtureCommand, liveIo, runPsql, parseArguments } from './security-staging-fixtures-cli.mjs'

const projectId='s'.repeat(20), productionProjectId='p'.repeat(20)
const target={projectId,productionProjectId,url:`https://${projectId}.supabase.co`}
const secret='DO_NOT_LOG_any_fixture_password_or_service_key'
const env={SECURITY_STAGING_PROJECT_REF:projectId, SECURITY_PRODUCTION_PROJECT_REF:productionProjectId,
  SECURITY_STAGING_PUBLISHABLE_KEY:'sb_publishable_fixture',SECURITY_STAGING_SERVICE_KEY:'sb_secret_'+secret,
  SECURITY_STAGING_STATE_KEY:'42'.repeat(32),PGHOST:`db.${projectId}.supabase.co`,PGPORT:'5432',PGUSER:'postgres',
  PGDATABASE:'postgres',PGPASSWORD:secret,PGSSLMODE:'verify-full'}
const applicationUrls=[`https://${productionProjectId}.supabase.co`]
const base=mkdtempSync(path.join(os.tmpdir(),'tewahedo-staging-fixture-test-'))
const root=path.join(base,'repo');mkdirSync(root)
let passed=0
async function test(label, fn) { await fn(); passed++; console.log(`PASS ${label}`) }
const tokenFor=(u, iss=target.url+'/auth/v1') => ['e30',Buffer.from(JSON.stringify({sub:u.id,role:'authenticated',iss,exp:Math.floor(Date.now()/1000)+3600})).toString('base64url'),'fixture'].join('.')
function fakeIo(state) {
  const accounts=new Map(); const counts={create:0,delete:0,seed:0,test:0,cleanup:0}; let seeded=false;let awards=0
  const io={
    async auth(method, route, body) {
      if (route.startsWith('/token?')) {
        const u=state.users.find(u=>u.email===body.email && u.password===body.password)
        assert.ok(u);return {status:200,body:{user:{id:u.id},access_token:tokenFor(u)}}
      }
      const id=route.split('/').at(-1)
      if(method==='GET') return accounts.has(id)?{status:200,body:accounts.get(id)}:{status:404,body:{}}
      if(method==='POST') {counts.create++;assert.ok(!accounts.has(body.id));accounts.set(body.id,{...body,role:'authenticated'});return {status:200,body:accounts.get(body.id)}}
      if(method==='DELETE') {counts.delete++;accounts.delete(id);return {status:200,body:{}}}
      throw Error('unexpected mock method')
    },
    async sql(kind, text) {
      if(kind==='preflight'){assert.match(text,/FIXTURE_SCHEMA_NOT_READY/);return {}}
      assert.match(text,/begin;/);assert.match(text,/commit;/)
      assert.doesNotMatch(text,/disable.*(trigger|row level)|truncate|drop (table|schema|policy)/i)
      if(kind==='seed'){counts.seed++;seeded=true;return {}}
      if(kind==='cleanup'){counts.cleanup++;seeded=false;awards=0;return {}}
      assert.equal(kind,'verify');assert.ok(seeded)
      return {users:5,questions:5,rooms:2,participants:2,rounds:6,submissions:5,awards,awardXp:awards*100,results:awards,xpTotal:awards*100}
    },
    async test(manifest, credentials, joinToken) {
      counts.test++;assert.equal(Object.keys(credentials).length,5);assert.ok(joinToken===state.open.token,'join token identity mismatch')
      assert.equal(manifest.rewardRoomId,state.finished.id);awards=1;return 60
    },
  }
  return {io,accounts,counts}
}
try {
  await test('explicit distinct staging/production identities accepted',()=>assert.equal(validateTarget(target,env,applicationUrls).projectId,projectId))
  for(const [label,options,e,urls] of [
    ['missing project',{},env,applicationUrls],
    ['production target',{...target,projectId:productionProjectId},{...env,SECURITY_STAGING_PROJECT_REF:productionProjectId},applicationUrls],
    ['mismatched environment',target,{...env,SECURITY_STAGING_PROJECT_REF:'a'.repeat(20)},applicationUrls],
    ['incorrect production declaration',{...target,productionProjectId:'a'.repeat(20)},env,applicationUrls],
    ['application endpoint',target,env,[target.url]],
    ['malformed target',{...target,projectId:'https://secret.example'},env,applicationUrls],
  ]) await test(`guard rejects ${label}`,()=>assert.throws(()=>validateTarget(options,e,urls)))
  await test('direct database and required secrets validate without output',()=>validateExecutionEnvironment(target,env,{service:true}))
  for(const [key,value] of Object.entries({PGHOST:`db.${productionProjectId}.supabase.co`,PGSSLMODE:'require',PGUSER:'postgres.other',PGPASSWORD:'',SECURITY_STAGING_STATE_KEY:'',SECURITY_STAGING_SERVICE_KEY:''})) {
    await test(`guard rejects invalid ${key}`,()=>assert.throws(()=>validateExecutionEnvironment(target,{...env,[key]:value},{service:true})))
  }
  await test('reject legacy key from another project',()=>{
    const jwt=['e30',Buffer.from(JSON.stringify({ref:productionProjectId,role:'anon'})).toString('base64url'),'x'].join('.')
    assert.throws(()=>validateExecutionEnvironment(target,{...env,SECURITY_STAGING_PUBLISHABLE_KEY:jwt}))
  })
  await test('state paths reject repository, ancestor and junction',()=>{
    assert.throws(()=>validateStateDirectory(path.join(root,'state'),root))
    assert.throws(()=>validateStateDirectory(base,root))
    const link=path.join(base,'linked');symlinkSync(root,link,'junction')
    assert.throws(()=>validateStateDirectory(path.join(link,'state'),root))
  })
  await test('state encrypted, integrity checked and exclusively locked',()=>{
    const store=fixtureStore(path.join(base,'encrypted'),root,env.SECURITY_STAGING_STATE_KEY),s=newFixture(target)
    store.save(s);const encrypted=readFileSync(path.join(store.root,'fixture.enc'),'utf8')
    assert.ok(!encrypted.includes(s.users[0].password) && !encrypted.includes(s.open.token))
    assert.ok(JSON.stringify(store.load())===JSON.stringify(s),'encrypted state round-trip mismatch')
    const release=store.lock();assert.throws(()=>store.lock(),/LOCKED/);release()
    const broken=JSON.parse(encrypted);broken.tag='00'.repeat(16)
    writeFileSync(path.join(store.root,'fixture.enc'),JSON.stringify(broken));assert.throws(()=>store.load(),/INTEGRITY/)
  })
  await test('five users/questions and deterministic room IDs survive repeated setup',async()=>{
    const s=newFixture(target),f=fakeIo(s);const save=()=>{}
    await runFixtures('setup',s,target,f.io,save);await runFixtures('setup',s,target,f.io,save)
    assert.equal(f.counts.create,5);assert.equal(s.questions.length,5)
    assert.equal(s.open.rounds.length,1);assert.equal(s.finished.rounds.length,5)
    assert.equal(s.phase,'ready');assert.equal(f.accounts.size,5)
  })
  await test('interrupted Auth creation resumes with GET of fixed ID, not duplicate create',async()=>{
    const s=newFixture(target),f=fakeIo(s),original=f.io.auth;let interrupted=false
    f.io.auth=async(...args)=>{const r=await original(...args);if(args[0]==='POST'&&!interrupted){interrupted=true;throw Error(secret)}return r}
    await assert.rejects(runFixtures('setup',s,target,f.io,()=>{}))
    f.io.auth=original;await runFixtures('setup',s,target,f.io,()=>{});assert.equal(f.counts.create,5)
  })
  await test('interrupted committed seed resumes without new users or IDs',async()=>{
    const s=newFixture(target),f=fakeIo(s),original=f.io.sql;let once=true
    f.io.sql=async(...args)=>{const r=await original(...args);if(args[0]==='seed'&&once){once=false;throw Error(secret)}return r}
    await assert.rejects(runFixtures('setup',s,target,f.io,()=>{}))
    await runFixtures('setup',s,target,f.io,()=>{});assert.equal(f.counts.create,5);assert.equal(s.phase,'ready')
  })
  await test('missing schema blocks before any Auth user creation',async()=>{
    const s=newFixture(target),f=fakeIo(s)
    f.io.sql=async()=>{throw Error('missing schema')}
    await assert.rejects(runFixtures('setup',s,target,f.io,()=>{}));assert.equal(f.counts.create,0)
  })
  await test('foreign account marker prevents both setup and cleanup',async()=>{
    const s=newFixture(target),f=fakeIo(s);f.accounts.set(s.users[0].id,{...s.users[0],role:'authenticated',app_metadata:{security_fixture:'foreign'}})
    await assert.rejects(runFixtures('setup',s,target,f.io,()=>{}),/OWNERSHIP/)
    await assert.rejects(runFixtures('cleanup',s,target,f.io,()=>{}),/OWNERSHIP/)
    assert.equal(f.counts.delete,0);assert.equal(f.counts.cleanup,0)
  })
  await test('test handoff succeeds once; consumed rewards cannot silently be replayed',async()=>{
    const s=newFixture(target),f=fakeIo(s);await runFixtures('setup',s,target,f.io,()=>{})
    assert.equal((await runFixtures('test',s,target,f.io,()=>{})).assertions,60)
    await assert.rejects(runFixtures('test',s,target,f.io,()=>{}),/CONSUMED/);assert.equal(f.counts.test,1)
  })
  await test('failed tests persist uncertainty and block setup/retest',async()=>{
    const s=newFixture(target),f=fakeIo(s);await runFixtures('setup',s,target,f.io,()=>{})
    f.io.test=async()=>{throw Error(secret)}
    await assert.rejects(runFixtures('test',s,target,f.io,()=>{}),/CONSUMED/)
    assert.equal(s.phase,'test-failed');await assert.rejects(runFixtures('setup',s,target,f.io,()=>{}),/REUSABLE/)
  })
  await test('HTTP success cannot hide an incorrect owner-side XP delta',async()=>{
    const s=newFixture(target),f=fakeIo(s);await runFixtures('setup',s,target,f.io,()=>{})
    const original=f.io.sql;let after=false
    f.io.test=async()=>{after=true;return 60}
    f.io.sql=async(...args)=>{const r=await original(...args);return after?{...r,awards:1,awardXp:100,results:1,xpTotal:200}:r}
    await assert.rejects(runFixtures('test',s,target,f.io,()=>{}),/CONSUMED/);assert.equal(s.phase,'test-failed')
  })
  await test('interrupted testing state blocks automatic repeat',async()=>{
    const s=newFixture(target);s.phase='testing'
    await assert.rejects(runFixtures('test',s,target,{},()=>{}),/READY/)
  })
  await test('cleanup is scoped and repeatable, including partial Auth deletion',async()=>{
    const s=newFixture(target),f=fakeIo(s);await runFixtures('setup',s,target,f.io,()=>{})
    const original=f.io.auth;let once=true
    f.io.auth=async(...args)=>{const r=await original(...args);if(args[0]==='DELETE'&&once){once=false;throw Error(secret)}return r}
    await assert.rejects(runFixtures('cleanup',s,target,f.io,()=>{}))
    assert.equal(s.phase,'cleaning');await runFixtures('cleanup',s,target,f.io,()=>{})
    await runFixtures('cleanup',s,target,f.io,()=>{});assert.equal(f.counts.delete,5);assert.equal(s.phase,'cleaned')
  })
  await test('fixture SQL is scoped, transactional and never changes policies',()=>{
    const s=newFixture(target),seed=seedSql(s),verify=verifySql(s),cleanup=cleanupSql(s)
    assert.match(seed,/on conflict\(id\) do nothing/);assert.match(seed,/FIXTURE_ROLE_MISMATCH/)
    assert.match(seed,/raw_app_meta_data->>'security_fixture'/);assert.match(cleanup,/FIXTURE_CLEANUP_SCOPE_MISMATCH/)
    assert.doesNotMatch(cleanup,/anonymous-global|truncate|delete from auth.users/i)
    assert.match(cleanup,/where client_key in \(/);assert.match(verify,/'awards'/)
    for(const text of [seed,verify,cleanup]) {
      assert.doesNotMatch(text,/alter table|disable trigger|create policy|grant |revoke /i)
      for(const value of [...s.users.map(u=>u.password),s.open.token,s.finished.token,s.open.code,s.finished.code])
        assert.ok(!text.includes("'"+value+"'"), 'raw generated secret must never be in SQL, including error statement logs')
    }
  })
  await test('SQL scoreboard assertion is identity based for either participant order',()=>{
    const sql=readFileSync('supabase/tests/security_sprint3.sql','utf8')
    assert.doesNotMatch(sql,/participants,0,score/);assert.match(sql,/where p->>'id'=member->>'participant_id'/)
    for(const participants of [[{id:'player',score:3},{id:'guest',score:0}],[{id:'guest',score:0},{id:'player',score:3}]])
      assert.equal(participants.find(p=>p.id==='player').score,3)
  })
  await test('wrong-project authenticated token rejected',()=>{
    const u=newFixture(target).users[0];assert.throws(()=>validateUserToken(tokenFor(u,`https://${productionProjectId}.supabase.co/auth/v1`),u.id,target))
  })
  await test('HTTP IO refuses redirects and sanitizes transport errors',async()=>{
    const io=liveIo(target,env,{fetchRequest:async(_url,options)=>{assert.equal(options.redirect,'error');throw Error(secret)}})
    await assert.rejects(io.auth('GET','/admin/users/test'),{message:'STAGING_HTTP_FAILED_OR_INTERRUPTED'})
  })
  await test('psql uses stdin, controlled environment, no shell, and redacts failure output',async()=>{
    let captured
    const fakeSpawn=(executable,args,options)=>{
      captured={executable,args,options};const c=new EventEmitter();c.stdout=new EventEmitter();c.stderr=new EventEmitter();c.stdin=new EventEmitter()
      c.stdin.end=text=>{assert.ok(text.includes(secret));queueMicrotask(()=>{c.stderr.emit('data',Buffer.from(secret));c.emit('close',1)})};c.kill=()=>true;return c
    }
    await assert.rejects(runPsql('select '+secret, {...env,PGOPTIONS:secret,PGSERVICE:secret},fakeSpawn),{message:'PSQL_FAILED_OR_INTERRUPTED'})
    assert.equal(captured.options.shell,false);assert.ok(!JSON.stringify(captured.args).includes(secret))
    assert.equal(captured.options.env.PGOPTIONS,undefined);assert.equal(captured.options.env.PGSERVICE,undefined)
  })
  await test('plan and invalid environment cannot construct live IO',async()=>{
    const opts={command:'plan',...target,directory:path.join(base,'plan')}
    const blocked=()=>{throw Error('IO must not be constructed')}
    assert.equal((await fixtureCommand(opts,env,{root,applicationUrls,ioFactory:blocked})).status,'PLAN_ONLY')
    await assert.rejects(fixtureCommand({...opts,command:'setup'},env,{root,applicationUrls,ioFactory:blocked}),/OPT_IN/)
    await assert.rejects(fixtureCommand({...opts,command:'setup','--execute':true,'--disposable-staging':true},{...env,PGHOST:'production'},
      {root,applicationUrls,ioFactory:blocked}),/TARGET/)
  })
  await test('disposable CLI command flow through encrypted store with mocked IO',async()=>{
    const directory=path.join(base,'workflow'),opts={...target,directory,'--execute':true,'--disposable-staging':true}
    let f
    const injected={root,applicationUrls,ioFactory:()=>{
      f ||= fakeIo(fixtureStore(directory,root,env.SECURITY_STAGING_STATE_KEY).load());return f.io
    }}
    for(const command of ['setup','setup','verify','test','cleanup','cleanup']) await fixtureCommand({...opts,command},env,injected)
    assert.equal(f.counts.create,5);assert.equal(f.counts.delete,5);assert.equal(f.counts.test,1)
    const publicFile=readFileSync(path.join(directory,'fixture.json'),'utf8')
    assert.ok(!publicFile.includes('password')&&!publicFile.includes('token'))
  })
  await test('unsupported/duplicate CLI flags fail closed',()=>{
    assert.throws(()=>parseArguments(['setup','--real-agents']))
    assert.throws(()=>parseArguments(['setup','--execute','--execute']))
  })
  await test('unconfirmed SQL process termination retains the lock for manual investigation',async()=>{
    const directory=path.join(base,'uncertain-process')
    await assert.rejects(fixtureCommand({command:'setup',...target,directory,'--execute':true,'--disposable-staging':true},env,
      {root,applicationUrls,ioFactory:()=>({sql:async()=>{throw new StagingError('PSQL_TERMINATION_UNCONFIRMED')}})}),/UNCONFIRMED/)
    assert.throws(()=>fixtureStore(directory,root,env.SECURITY_STAGING_STATE_KEY).lock(),/LOCKED/)
    const s=newFixture(target),f=fakeIo(s);await runFixtures('setup',s,target,f.io,()=>{})
    const original=f.io.sql
    f.io.sql=async(...args)=>{if(s.phase==='testing')throw new StagingError('PSQL_TERMINATION_UNCONFIRMED');return original(...args)}
    await assert.rejects(runFixtures('test',s,target,f.io,()=>{}),/PSQL_TERMINATION_UNCONFIRMED/)
    assert.equal(s.phase,'test-failed')
  })
  await test('blocked CLI logs only sanitized codes, never environment credentials',()=>{
    const r=spawnSync(process.execPath,['scripts/security-staging-fixtures-cli.mjs','setup','--staging-project-id',projectId,
      '--production-project-id',projectId,'--state-dir',path.join(base,'blocked'),'--execute','--disposable-staging'],
      {encoding:'utf8',env:{...process.env,...env}})
    assert.equal(r.status,1);assert.ok(r.stderr.includes('PRODUCTION_TARGET_REJECTED'),'missing sanitized rejection code')
    assert.ok(!r.stderr.includes(secret)&&!r.stdout.includes(secret))
  })
  await test('direct existing HTTP CLI cannot execute without named staging/production IDs',()=>{
    const manifest=path.join(base,'manifest.json')
    writeFileSync(manifest,JSON.stringify({disposable:true,projectRef:projectId,openRoomId:'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
      rewardRoomId:'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',playerParticipantId:'cccccccc-cccc-cccc-cccc-cccccccccccc',rewardParticipantId:'dddddddd-dddd-dddd-dddd-dddddddddddd'}))
    const r=spawnSync(process.execPath,['scripts/security-staging-checks.mjs','--fixture',manifest,'--execute','--disposable-staging'],
      {encoding:'utf8',env:{...process.env,...env}})
    assert.equal(r.status,1);assert.ok(r.stderr.includes('BLOCKED'),'missing sanitized blocked result');assert.ok(!r.stderr.includes(secret))
  })
  console.log(`${passed} passed, 0 failed. All Auth/SQL/testing IO mocked; no SQL or Supabase requests executed.`)
} finally {
  // Remove only this test's freshly allocated absolute temporary directory.
  assert.equal(realpathSync(base),path.resolve(base));assert.equal(path.dirname(base),realpathSync(os.tmpdir()))
  rmSync(base,{recursive:true,force:true})
}
