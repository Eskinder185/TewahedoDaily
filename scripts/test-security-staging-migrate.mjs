/** Deterministic offline tests. No real psql, SQL execution, HTTP or credentials. */
import assert from 'node:assert/strict'
import { createHash, generateKeyPairSync, sign, randomUUID } from 'node:crypto'
import { readFileSync, writeFileSync, mkdirSync, mkdtempSync, rmSync, realpathSync, symlinkSync, renameSync } from 'node:fs'
import { spawnSync } from 'node:child_process'
import { EventEmitter } from 'node:events'
import path from 'node:path'
import os from 'node:os'
import { SQL_OPERATIONS, canonical, credentialBinding, parseArguments, validateMigration, migrationCommand } from './security-staging-migrate.mjs'
import { runPsql } from './security-staging-fixtures-cli.mjs'

const temp=mkdtempSync(path.join(os.tmpdir(),'tewahedo-migration-guard-test-'))
const {publicKey,privateKey}=generateKeyPairSync('ed25519')
const publicPem=publicKey.export({type:'spki',format:'pem'})
const sha=bytes=>createHash('sha256').update(bytes).digest('hex')
const now=Date.UTC(2026,10,3,12), projectId='s'.repeat(20), productionProjectId='p'.repeat(20)
const secret='DO_NOT_LOG_mock_database_password'
const sourceDigests=Object.fromEntries(Object.values(SQL_OPERATIONS).map(op=>[op.file,sha(readFileSync(op.file))]))
let cases=0,passed=0
async function test(label,fn){await fn();passed++;console.log(`PASS ${label}`)}
function fixture(sqlId='profiles') {
  const directory=path.join(temp,String(++cases)),root=path.join(directory,'repo')
  mkdirSync(root,{recursive:true})
  mkdirSync(path.join(directory,'evidence'))
  for(const op of Object.values(SQL_OPERATIONS)){
    const destination=path.join(root,op.file);mkdirSync(path.dirname(destination),{recursive:true})
    writeFileSync(destination,readFileSync(op.file))
  }
  const psqlPath=path.join(directory,'psql.exe'),certificate=path.join(directory,'root.crt')
  writeFileSync(psqlPath,'TEST FAKE EXECUTABLE, MUST NEVER BE LAUNCHED')
  writeFileSync(certificate,'TEST CA BYTES, NO TLS CONNECTION IS PERFORMED')
  const options={command:'plan',sqlId,projectId,productionProjectId,organizationId:'staging-org',ownerId:'staging-owner',
    databaseHost:`db.${projectId}.supabase.co`,approvalFile:path.join(directory,'evidence','approval.json'),receiptDir:path.join(directory,'receipts'),psqlPath}
  const env={SECURITY_STAGING_PROJECT_REF:projectId,SECURITY_PRODUCTION_PROJECT_REF:productionProjectId,
    SECURITY_STAGING_DB_PASSWORD:secret,SECURITY_STAGING_TLS_ROOT_CERT:certificate}
  const payload={version:1,approvalId:randomUUID(),disposable:true,stagingProjectRef:projectId,productionProjectRef:productionProjectId,
    organizationId:options.organizationId,ownerId:options.ownerId,databaseHost:options.databaseHost,sqlId,sqlPath:SQL_OPERATIONS[sqlId].file,
    sqlSha256:sha(readFileSync(path.join(root,SQL_OPERATIONS[sqlId].file))),psqlSha256:sha(readFileSync(psqlPath)),tlsRootCertSha256:sha(readFileSync(certificate)),
    credentialId:'vault/staging/database',credentialVersion:'v1',credentialSalt:'ab'.repeat(32),credentialHmac:'',
    verificationMethod:'authenticated-management-api-and-secret-store',verificationEvidenceId:'review/evidence-123',
    verifiedBy:'test-verifier',verifiedAt:new Date(now-60000).toISOString(),userApprovalId:'approval/migrate-123',
    provisioningApprovalId:'approval/provision-123',phase:SQL_OPERATIONS[sqlId].phase,
    issuedAt:new Date(now-30000).toISOString(),expiresAt:new Date(now+1800000).toISOString(),receiptDirectory:options.receiptDir}
  payload.credentialHmac=credentialBinding(payload,secret)
  const deps={root,now,applicationUrls:[`https://${productionProjectId}.supabase.co`],trustedApprovers:{'test-verifier':publicPem}}
  const seal=()=>writeFileSync(options.approvalFile,JSON.stringify({keyId:'test-verifier',payload,
    signature:sign(null,Buffer.from(canonical(payload)),privateKey).toString('base64')}))
  seal();return {options,env,payload,deps,root,seal}
}
async function blocked(f,expected) {
  let launches=0
  await assert.rejects(migrationCommand({...f.options,command:'execute','--execute':true,'--disposable-staging':true},f.env,
    {...f.deps,executeProcess:async()=>{launches++}}),error=>error.message===expected)
  assert.equal(launches,0,'rejected configuration must never launch a process')
}
try {
  await test('signed plan performs static validation without constructing a process',async()=>{
    const f=fixture();let calls=0
    const r=await migrationCommand(f.options,f.env,{...f.deps,executeProcess:async()=>{calls++}})
    assert.equal(r.status,'STATIC_VALIDATION_PASS');assert.equal(r.liveIdentity,'NOT_VERIFIED_BY_WRAPPER');assert.equal(calls,0)
  })
  await test('real CLI trust store is empty and refuses test self-signing',async()=>{
    const f=fixture();await assert.rejects(migrationCommand(f.options,f.env,{...f.deps,trustedApprovers:{}}),/APPROVER_NOT_ENROLLED/)
  })
  await test('reject production target',async()=>{const f=fixture();f.options.projectId=productionProjectId;await blocked(f,'PRODUCTION_TARGET_REJECTED')})
  await test('reject missing staging identity',async()=>{const f=fixture();delete f.options.projectId;await blocked(f,'EXPLICIT_PROJECT_IDS_REQUIRED')})
  await test('reject wrong staging environment',async()=>{const f=fixture();f.env.SECURITY_STAGING_PROJECT_REF='a'.repeat(20);await blocked(f,'STAGING_REFERENCE_MISMATCH')})
  await test('reject wrong independently declared production identity',async()=>{const f=fixture();f.options.productionProjectId='a'.repeat(20);await blocked(f,'PRODUCTION_REFERENCE_MISMATCH')})
  await test('reject application endpoint as staging',async()=>{const f=fixture();f.deps.applicationUrls=[`https://${projectId}.supabase.co`];await blocked(f,'APPLICATION_TARGET_REJECTED')})
  await test('reject organization and owner substitutions',async()=>{
    for(const field of ['organizationId','ownerId']){const f=fixture();f.options[field]='someone-else';await blocked(f,'APPROVED_IDENTITY_MISMATCH')}
  })
  await test('reject unsupported database host and pooler',async()=>{
    for(const host of ['127.0.0.1','pooler.supabase.com',`db.${productionProjectId}.supabase.co`]){const f=fixture();f.options.databaseHost=host;await blocked(f,'DATABASE_HOST_MISMATCH')}
  })
  await test('reject absent database credential; API-key prefixes are irrelevant',async()=>{
    const f=fixture();delete f.env.SECURITY_STAGING_DB_PASSWORD;f.env.SECURITY_STAGING_SERVICE_KEY='sb_secret_not_identity_proof';await blocked(f,'STAGING_DATABASE_CREDENTIAL_REQUIRED')
  })
  await test('reject credential from a different vault version/value',async()=>{
    const f=fixture();f.env.SECURITY_STAGING_DB_PASSWORD='another_mock_value';await blocked(f,'CREDENTIAL_PROVENANCE_MISMATCH')
  })
  await test('reject ambient PostgreSQL overrides, including mixed-case names',async()=>{
    for(const name of ['PGHOST','PGHOSTADDR','PGSERVICE','PGSERVICEFILE','PGOPTIONS','PGDATABASE','PGUSER','PGPASSWORD','PGSSLMODE','PGPASSFILE','pghost']){
      const f=fixture();f.env[name]='mock-override';await blocked(f,'AMBIENT_PG_OVERRIDE_REJECTED')
    }
  })
  await test('reject missing approval without launching',async()=>{
    const f=fixture();delete f.options.approvalFile;await blocked(f,'APPROVAL_FILE_REQUIRED')
  })
  await test('reject approval tampering',async()=>{
    const f=fixture(),envelope=JSON.parse(readFileSync(f.options.approvalFile,'utf8'));envelope.payload.ownerId='tampered';writeFileSync(f.options.approvalFile,JSON.stringify(envelope));await blocked(f,'APPROVAL_SIGNATURE_INVALID')
  })
  await test('reject absent user approval or independent evidence',async()=>{
    for(const field of ['userApprovalId','provisioningApprovalId','verificationEvidenceId','credentialId','credentialVersion']){
      const f=fixture();f.payload[field]='';f.seal();await blocked(f,'INDEPENDENT_EVIDENCE_REQUIRED')
    }
  })
  await test('reject environment-string and JWT-claim assertions as verification methods',async()=>{
    for(const method of ['env-confirmed','jwt-decoded','key-prefix']){const f=fixture();f.payload.verificationMethod=method;f.seal();await blocked(f,'INDEPENDENT_VERIFICATION_REQUIRED')}
  })
  await test('reject a verifier identity different from signing authority',async()=>{const f=fixture();f.payload.verifiedBy='not-the-signer';f.seal();await blocked(f,'INDEPENDENT_VERIFIER_MISMATCH')})
  await test('provisioning approval cannot double as this operation approval',async()=>{const f=fixture();f.payload.userApprovalId=f.payload.provisioningApprovalId;f.seal();await blocked(f,'SEPARATE_PHASE_APPROVAL_REQUIRED')})
  await test('reject expired and overlong approvals',async()=>{
    for(const expiry of [now-1,now+7200000]){const f=fixture();f.payload.expiresAt=new Date(expiry).toISOString();f.seal();await blocked(f,'APPROVAL_EXPIRED_OR_INVALID')}
  })
  await test('reject an unapproved SQL ID and traversal',async()=>{
    for(const sqlId of ['../../arbitrary.sql','faith-challenges','toString']){const f=fixture();f.options.sqlId=sqlId;await blocked(f,'UNAPPROVED_SQL_SELECTION')}
  })
  await test('reject approved path and phase substitutions',async()=>{
    const f=fixture();f.payload.sqlPath='another.sql';f.seal();await blocked(f,'APPROVED_OPERATION_MISMATCH')
    const g=fixture();g.payload.phase='fixture-creation';g.seal();await blocked(g,'APPROVED_OPERATION_MISMATCH')
  })
  await test('reject changed SQL bytes after approval',async()=>{
    const f=fixture();writeFileSync(path.join(f.root,SQL_OPERATIONS.profiles.file),'changed');await blocked(f,'APPROVED_SQL_CHANGED')
  })
  await test('reject psql include/shell directives even if mistakenly signed',async()=>{
    for(const directive of ['\\i another.sql','\\! echo forbidden','\\connect other','\\gexec']){
      const f=fixture(),file=path.join(f.root,SQL_OPERATIONS.profiles.file);writeFileSync(file,directive+'\n');f.payload.sqlSha256=sha(readFileSync(file));f.seal();await blocked(f,'SQL_META_COMMAND_REJECTED')
    }
  })
  await test('reject linked SQL paths',async()=>{
    const f=fixture(),parent=path.dirname(path.join(f.root,SQL_OPERATIONS.profiles.file)),outside=path.join(path.dirname(f.root),'outside-sql')
    renameSync(parent,outside);symlinkSync(outside,parent,'junction')
    await blocked(f,'LINKED_FILE_REJECTED')
  })
  await test('reject changed client executable or TLS roots',async()=>{
    const f=fixture();writeFileSync(f.options.psqlPath,'modified binary');await blocked(f,'PSQL_BINARY_MISMATCH')
    const g=fixture();writeFileSync(g.env.SECURITY_STAGING_TLS_ROOT_CERT,'modified CA');await blocked(g,'TLS_ROOT_CERT_MISMATCH')
  })
  await test('reject alternative receipt directory and in-repository receipts',async()=>{
    const f=fixture();f.options.receiptDir=path.join(path.dirname(f.root),'another-receipts');await blocked(f,'APPROVED_RECEIPT_PATH_MISMATCH')
    const g=fixture();g.options.receiptDir=path.join(g.root,'receipts');await blocked(g,'STATE_OUTSIDE_REPOSITORY_REQUIRED')
  })
  await test('explicit execution opt-in is mandatory in addition to signed approval',async()=>{
    const f=fixture();await assert.rejects(migrationCommand({...f.options,command:'execute'},f.env,f.deps),/EXECUTION_APPROVAL_REQUIRED/)
  })
  await test('approved snapshot and controlled child environment reach only fake runner',async()=>{
    const f=fixture();f.env.SUPABASE_SERVICE_ROLE_KEY='DO_NOT_FORWARD_mock';let calls=0
    const r=await migrationCommand({...f.options,command:'execute','--execute':true,'--disposable-staging':true},f.env,
      {...f.deps,executeProcess:async plan=>{calls++;assert.ok(Buffer.isBuffer(plan.sql));assert.ok(plan.env.PGPASSWORD===secret)
        assert.equal(plan.env.PGHOST,`db.${projectId}.supabase.co`);assert.equal(plan.env.PGSSLMODE,'verify-full')
        assert.equal(plan.env.SUPABASE_SERVICE_ROLE_KEY,undefined);assert.equal(plan.env.SECURITY_STAGING_DB_PASSWORD,undefined)
        // Mutation after validation cannot substitute the already captured SQL.
        const snapshot=Buffer.from(plan.sql);writeFileSync(path.join(f.root,SQL_OPERATIONS.profiles.file),'later replacement')
        assert.ok(plan.sql.equals(snapshot))}})
    assert.equal(calls,1);assert.equal(r.status,'SQL_PROCESS_COMPLETED');assert.ok(!JSON.stringify(r).includes(secret))
  })
  await test('catalog operation is wrapped read-only and SQL test meta commands are bounded',()=>{
    const f=fixture('catalog'),p=validateMigration(f.options,f.env,f.deps)
    assert.ok(p.sql.toString().startsWith('begin read only;\n') && p.sql.toString().endsWith('\nrollback;\n'))
    const g=fixture('authorization-test');assert.ok(validateMigration(g.options,g.env,g.deps).sql.length>0)
  })
  await test('same approval cannot be concurrently replayed or retried after uncertainty',async()=>{
    const f=fixture(),options={...f.options,command:'execute','--execute':true,'--disposable-staging':true};let calls=0
    const deps={...f.deps,executeProcess:async()=>{calls++;throw Error('DO_NOT_LOG_mock_raw_error')}}
    const results=await Promise.allSettled([migrationCommand(options,f.env,deps),migrationCommand(options,f.env,deps)])
    assert.equal(calls,1);assert.ok(results.every(r=>r.status==='rejected'))
    await assert.rejects(migrationCommand(options,f.env,deps),/APPROVAL_ALREADY_USED_OR_UNCERTAIN/)
  })
  await test('CLI disallows raw file paths, public-key overrides, duplicates and unknown arguments',()=>{
    for(const args of [['plan','--file','arbitrary.sql'],['plan','--public-key','anything'],['plan','--sql-id','profiles','--sql-id','game-night'],['plan','--sql','select 1']])
      assert.throws(()=>parseArguments(args))
  })
  await test('process adapter drains sensitive catalog output without returning it',async()=>{
    const child=new EventEmitter();child.stdout=new EventEmitter();child.stderr=new EventEmitter();child.stdin=new EventEmitter();child.kill=()=>true
    child.stdin.end=()=>queueMicrotask(()=>{child.stdout.emit('data',Buffer.from(secret.repeat(2000)));child.stderr.emit('data',Buffer.from(secret));child.emit('close',0)})
    const result=await runPsql(Buffer.from('NOT EXECUTED'),{},()=>child,{discardOutput:true})
    assert.equal(Object.keys(result).length,0)
  })
  await test('blocked CLI never prints environment credentials or connection strings',()=>{
    const f=fixture(),args=['scripts/security-staging-migrate.mjs','execute','--sql-id','profiles',
      '--staging-project-id',productionProjectId,'--production-project-id',productionProjectId]
    const r=spawnSync(process.execPath,args,{encoding:'utf8',env:{...process.env,...f.env}})
    assert.equal(r.status,1);assert.ok(r.stderr.includes('PRODUCTION_TARGET_REJECTED'))
    assert.ok(!r.stdout.includes(secret) && !r.stderr.includes(secret) && !r.stderr.includes('postgresql://'))
  })
  await test('all original allowlisted SQL definitions remain unchanged',()=>{
    for(const [file,digest] of Object.entries(sourceDigests))assert.equal(sha(readFileSync(file)),digest)
  })
  await test('runbook normal SQL commands use the wrapper, without a direct psql loop',()=>{
    const doc=readFileSync('docs/ai/SECURITY-STAGING-RUNBOOK-2026-11-03.md','utf8')
    assert.doesNotMatch(doc,/^\s*(?:&\s+)?(?:['"][^\r\n'"]*\\)?(?:psql|pg_dump)(?:\.exe)?['"]?\s/gmi)
    assert.doesNotMatch(doc,/foreach\s*\(\$proposal\s+in/)
    assert.match(doc,/security-staging-migrate\.mjs/)
  })
  console.log(`${passed} passed, 0 failed. All migration process calls are mocks; no database connection, SQL execution or API call.`)
} finally {
  assert.equal(realpathSync(temp),path.resolve(temp));assert.equal(path.dirname(temp),realpathSync(os.tmpdir()))
  rmSync(temp,{recursive:true,force:true})
}
