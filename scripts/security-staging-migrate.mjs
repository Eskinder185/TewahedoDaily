/** Guarded staging SQL entry point. No connection occurs on import or in plan.
 * Trust enrollment and independent verification are separate approval boundaries. */
import { createHash, createHmac, createPublicKey, verify, timingSafeEqual } from 'node:crypto'
import { readFileSync, lstatSync, realpathSync, openSync, closeSync, writeFileSync, mkdirSync, fsyncSync } from 'node:fs'
import { spawn } from 'node:child_process'
import path from 'node:path'
import { fileURLToPath, pathToFileURL } from 'node:url'
import { StagingError, requireSafe, validateTarget, readApplicationTargets, validateStateDirectory } from './security-staging-environment.mjs'
import { runPsql } from './security-staging-fixtures-cli.mjs'

// Intentionally EMPTY. Enrollment requires a separate reviewed code change with
// an independently authenticated Ed25519 approver PUBLIC key. No CLI/env override.
export const TRUSTED_STAGING_APPROVERS = Object.freeze({})
export const SQL_OPERATIONS = Object.freeze({
  catalog: Object.freeze({ file:'docs/ai/SECURITY-LIVE-VERIFICATION-2026-11-03.sql', phase:'catalog-read', readOnly:true }),
  profiles: Object.freeze({ file:'docs/ai/proposed-migrations/20261103_profiles_role_guard_security.sql', phase:'migration-application' }),
  'game-night': Object.freeze({ file:'docs/ai/proposed-migrations/20261103_game_night_security.sql', phase:'migration-application' }),
  'verified-rewards': Object.freeze({ file:'docs/ai/proposed-migrations/20261103_verified_play_rewards.sql', phase:'migration-application' }),
  'authorization-test': Object.freeze({ file:'supabase/tests/security_sprint3.sql', phase:'test-execution', test:true }),
})
const ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..')
const sha = bytes => createHash('sha256').update(bytes).digest('hex')
const HEX = /^[a-f0-9]{64}$/
const ID = /^[A-Za-z0-9][A-Za-z0-9._/-]{0,159}$/
const uuid = value => /^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$/i.test(value || '')
export function canonical(value) {
  if (Array.isArray(value)) return '['+value.map(canonical).join(',')+']'
  if (value && typeof value==='object') return '{'+Object.keys(value).sort().map(k=>JSON.stringify(k)+':'+canonical(value[k])).join(',')+'}'
  return JSON.stringify(value)
}
const exactKeys = (value, expected) => requireSafe(value && !Array.isArray(value)
  && Object.keys(value).sort().join('|')===expected.slice().sort().join('|'), 'APPROVAL_SCHEMA_INVALID')

function regularFile(filename, maxBytes=2097152) {
  requireSafe(path.isAbsolute(filename || ''), 'ABSOLUTE_FILE_PATH_REQUIRED')
  const resolved=path.resolve(filename)
  let cursor=resolved
  while (true) {
    const stat=lstatSync(cursor)
    requireSafe(!stat.isSymbolicLink(), 'LINKED_FILE_REJECTED')
    const parent=path.dirname(cursor);if(parent===cursor)break;cursor=parent
  }
  const stat=lstatSync(resolved)
  requireSafe(stat.isFile() && stat.nlink===1 && stat.size<=maxBytes, 'REGULAR_FILE_REQUIRED')
  requireSafe(path.relative(resolved,realpathSync(resolved))==='', 'CANONICAL_FILE_REQUIRED')
  return readFileSync(resolved)
}

// The verifier independently retrieves the credential's exact vault version and
// signs this binding. Prefixes/decoded JWTs/env declarations are never evidence.
export function credentialBinding(payload, password) {
  return createHmac('sha256',password).update(canonical({
    salt:payload.credentialSalt,credentialId:payload.credentialId,credentialVersion:payload.credentialVersion,
    stagingProjectRef:payload.stagingProjectRef,productionProjectRef:payload.productionProjectRef,
    organizationId:payload.organizationId,ownerId:payload.ownerId,databaseHost:payload.databaseHost,
  })).digest('hex')
}

export function parseArguments(args) {
  const result={command:args[0]}
  requireSafe(['plan','execute'].includes(result.command),'COMMAND_REQUIRED')
  const flags={'--sql-id':'sqlId','--staging-project-id':'projectId','--production-project-id':'productionProjectId',
    '--organization-id':'organizationId','--owner-id':'ownerId','--expected-db-host':'databaseHost',
    '--approval-file':'approvalFile','--receipt-dir':'receiptDir','--psql-path':'psqlPath'}
  for(let i=1;i<args.length;i++) {
    const name=args[i]
    if(['--execute','--disposable-staging'].includes(name)) {
      requireSafe(!result[name],'DUPLICATE_ARGUMENT');result[name]=true
    } else {
      requireSafe(flags[name] && args[i+1] && !args[i+1].startsWith('--') && !result[flags[name]],'UNAPPROVED_ARGUMENT')
      result[flags[name]]=args[++i]
    }
  }
  return result
}

export function validateMigration(options, env, { root=ROOT, applicationUrls=readApplicationTargets(root),
  trustedApprovers=TRUSTED_STAGING_APPROVERS, now=Date.now() }={}) {
  const operation=SQL_OPERATIONS[options.sqlId]
  requireSafe(operation && Object.hasOwn(SQL_OPERATIONS,options.sqlId),'UNAPPROVED_SQL_SELECTION')
  const target=validateTarget(options,env,applicationUrls)
  requireSafe(ID.test(options.organizationId || '') && ID.test(options.ownerId || ''),'ORG_OWNER_REQUIRED')
  requireSafe(options.databaseHost===`db.${target.projectId}.supabase.co`,'DATABASE_HOST_MISMATCH')
  requireSafe(!Object.keys(env).some(k=>/^PG/i.test(k)),'AMBIENT_PG_OVERRIDE_REJECTED')
  requireSafe(typeof env.SECURITY_STAGING_DB_PASSWORD==='string' && env.SECURITY_STAGING_DB_PASSWORD.length>0,'STAGING_DATABASE_CREDENTIAL_REQUIRED')
  validateStateDirectory(options.receiptDir,root)
  requireSafe(path.isAbsolute(options.approvalFile || ''),'APPROVAL_FILE_REQUIRED')
  validateStateDirectory(path.dirname(options.approvalFile || ''),root)
  // Both evidence files and the process image must be outside ambiguous links.
  let envelope
  try { envelope=JSON.parse(regularFile(options.approvalFile,32768).toString('utf8')) }
  catch(error) { if(error instanceof StagingError)throw error;throw new StagingError('APPROVAL_FILE_INVALID') }
  exactKeys(envelope,['keyId','payload','signature'])
  requireSafe(ID.test(envelope.keyId || '') && Object.hasOwn(trustedApprovers,envelope.keyId),'APPROVER_NOT_ENROLLED')
  let signatureOk=false
  try {
    const key=createPublicKey(trustedApprovers[envelope.keyId])
    const signature=Buffer.from(envelope.signature,'base64')
    signatureOk=key.asymmetricKeyType==='ed25519' && signature.length===64
      && verify(null,Buffer.from(canonical(envelope.payload)),key,signature)
  } catch { /* A malformed or forged signature is rejected below. */ }
  requireSafe(signatureOk,'APPROVAL_SIGNATURE_INVALID')
  const p=envelope.payload
  exactKeys(p,['version','approvalId','disposable','stagingProjectRef','productionProjectRef','organizationId','ownerId','databaseHost',
    'sqlId','sqlPath','sqlSha256','psqlSha256','tlsRootCertSha256','credentialId','credentialVersion','credentialSalt','credentialHmac',
    'verificationMethod','verificationEvidenceId','verifiedBy','verifiedAt','userApprovalId','provisioningApprovalId','phase','issuedAt','expiresAt','receiptDirectory'])
  requireSafe(p.version===1 && uuid(p.approvalId) && p.disposable===true,'APPROVAL_SCHEMA_INVALID')
  requireSafe(p.stagingProjectRef===target.projectId && p.productionProjectRef===target.productionProjectId
    && p.organizationId===options.organizationId && p.ownerId===options.ownerId && p.databaseHost===options.databaseHost,'APPROVED_IDENTITY_MISMATCH')
  requireSafe(p.sqlId===options.sqlId && p.sqlPath===operation.file && p.phase===operation.phase,'APPROVED_OPERATION_MISMATCH')
  requireSafe(p.receiptDirectory===path.resolve(options.receiptDir),'APPROVED_RECEIPT_PATH_MISMATCH')
  requireSafe(['authenticated-management-api-and-secret-store','authenticated-console-and-secret-store'].includes(p.verificationMethod),
    'INDEPENDENT_VERIFICATION_REQUIRED')
  for(const field of ['verificationEvidenceId','verifiedBy','userApprovalId','provisioningApprovalId','credentialId','credentialVersion'])
    requireSafe(ID.test(p[field] || ''),'INDEPENDENT_EVIDENCE_REQUIRED')
  requireSafe(p.verifiedBy===envelope.keyId,'INDEPENDENT_VERIFIER_MISMATCH')
  requireSafe(p.userApprovalId!==p.provisioningApprovalId,'SEPARATE_PHASE_APPROVAL_REQUIRED')
  const issued=Date.parse(p.issuedAt),expires=Date.parse(p.expiresAt),verified=Date.parse(p.verifiedAt)
  requireSafe(Number.isFinite(issued) && Number.isFinite(expires) && Number.isFinite(verified)
    && issued<=now && verified<=issued && verified>=issued-3600000 && expires>now
    && expires>issued && expires-issued<=3600000,'APPROVAL_EXPIRED_OR_INVALID')
  for(const field of ['sqlSha256','psqlSha256','tlsRootCertSha256','credentialSalt','credentialHmac'])
    requireSafe(HEX.test(p[field] || ''),'APPROVAL_DIGEST_INVALID')
  requireSafe(timingSafeEqual(Buffer.from(credentialBinding(p,env.SECURITY_STAGING_DB_PASSWORD),'hex'),Buffer.from(p.credentialHmac,'hex')),
    'CREDENTIAL_PROVENANCE_MISMATCH')
  const sqlPath=path.join(root,operation.file), bytes=regularFile(sqlPath)
  requireSafe(sha(bytes)===p.sqlSha256,'APPROVED_SQL_CHANGED')
  let text
  try { text=new TextDecoder('utf-8',{fatal:true}).decode(bytes) } catch { throw new StagingError('SQL_ENCODING_INVALID') }
  requireSafe(!text.includes('\0'),'SQL_ENCODING_INVALID')
  for(const line of text.split(/\r?\n/)) if(/^\s*\\/.test(line)) {
    requireSafe(operation.test && (line==='\\set ON_ERROR_STOP on'
      || line==='\\echo Sprint 3 transactional assertions passed; HTTP durability/concurrency NOT covered.'),'SQL_META_COMMAND_REJECTED')
  }
  requireSafe(sha(regularFile(options.psqlPath,67108864))===p.psqlSha256,'PSQL_BINARY_MISMATCH')
  requireSafe(path.extname(options.psqlPath).toLowerCase()==='.exe' && path.basename(options.psqlPath).toLowerCase()==='psql.exe',
    'SUPPORTED_PSQL_EXECUTABLE_REQUIRED')
  const cert=env.SECURITY_STAGING_TLS_ROOT_CERT
  requireSafe(sha(regularFile(cert))===p.tlsRootCertSha256,'TLS_ROOT_CERT_MISMATCH')
  const childEnv=Object.fromEntries(['SystemRoot','WINDIR','PATH','PATHEXT','TEMP','TMP'].filter(k=>env[k]!==undefined).map(k=>[k,env[k]]))
  Object.assign(childEnv,{PGHOST:options.databaseHost,PGPORT:'5432',PGDATABASE:'postgres',PGUSER:'postgres',
    PGPASSWORD:env.SECURITY_STAGING_DB_PASSWORD,PGSSLMODE:'verify-full',PGSSLROOTCERT:cert})
  return {approvalId:p.approvalId,sqlId:options.sqlId,phase:operation.phase,sqlSha256:p.sqlSha256,
    receiptDir:options.receiptDir,psqlPath:options.psqlPath,env:childEnv,
    // Snapshot the APPROVED bytes before launch; no -f path is reopened by psql.
    sql:operation.readOnly?Buffer.concat([Buffer.from('begin read only;\n'),bytes,Buffer.from('\nrollback;\n')]):bytes}
}

async function defaultExecute(plan) {
  return runPsql(plan.sql,plan.env,(_ignored,args,settings)=>spawn(plan.psqlPath,args,settings),{discardOutput:true})
}
export async function migrationCommand(options,env,deps={}) {
  const plan=validateMigration(options,env,deps)
  if(options.command==='plan') return {status:'STATIC_VALIDATION_PASS',sqlId:plan.sqlId,liveIdentity:'NOT_VERIFIED_BY_WRAPPER',execution:'NOT_ATTEMPTED'}
  requireSafe(options.command==='execute' && options['--execute'] && options['--disposable-staging'],'EXECUTION_APPROVAL_REQUIRED')
  mkdirSync(plan.receiptDir,{recursive:true,mode:0o700})
  const receipt=path.join(plan.receiptDir,`${plan.approvalId}.used`)
  let fd
  try { fd=openSync(receipt,'wx',0o600) } catch { throw new StagingError('APPROVAL_ALREADY_USED_OR_UNCERTAIN') }
  // Consume before process launch; interruption never silently replays SQL.
  try {
    writeFileSync(fd,JSON.stringify({approvalId:plan.approvalId,sqlId:plan.sqlId,sqlSha256:plan.sqlSha256,status:'ATTEMPTED'}))
    fsyncSync(fd)
  }
  finally { closeSync(fd) }
  try { await (deps.executeProcess || defaultExecute)(plan) }
  catch { throw new StagingError('STAGING_SQL_FAILED_OR_UNCERTAIN') }
  return {status:'SQL_PROCESS_COMPLETED',sqlId:plan.sqlId,liveIdentity:'NOT_VERIFIED_BY_WRAPPER',verification:'REQUIRES_DATABASE_EVIDENCE'}
}

if(process.argv[1] && import.meta.url===pathToFileURL(process.argv[1]).href) {
  Promise.resolve().then(()=>parseArguments(process.argv.slice(2))).then(args=>migrationCommand(args,process.env))
    .then(result=>console.log(JSON.stringify(result)))
    .catch(error=>{console.error(JSON.stringify({status:'BLOCKED',code:error instanceof StagingError?error.code:'STAGING_MIGRATION_VALIDATION_FAILED'}));process.exitCode=1})
}
