/** Disposable fixture preparation. All IO is injected; importing never connects. */
import { randomBytes, randomUUID, createCipheriv, createDecipheriv, createHash } from 'node:crypto'
import { mkdirSync, readFileSync, writeFileSync, renameSync, openSync, closeSync, unlinkSync, lstatSync } from 'node:fs'
import path from 'node:path'
import { StagingError, requireSafe, validateStateDirectory, validateUserToken } from './security-staging-environment.mjs'

export const ROLES = ['player', 'host', 'editor', 'admin', 'super_admin']
const uuid = value => /^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$/i.test(value || '')
const quote = value => { requireSafe(typeof value === 'string' && !value.includes('\0'), 'INVALID_SQL_VALUE'); return `'${value.replaceAll("'", "''")}'` }
const list = values => values.map(quote).join(',')
const json = value => `${quote(JSON.stringify(value))}::jsonb`
const sha256 = value => createHash('sha256').update(value).digest('hex')
export function newFixture(target) {
  const runId = randomUUID()
  const questions = Array.from({ length: 5 }, () => randomUUID())
  const room = (finished) => ({ id: randomUUID(), code: randomBytes(3).toString('hex').toUpperCase(),
    participantId: randomUUID(), token: randomBytes(24).toString('hex'),
    rounds: questions.slice(0, finished ? 5 : 1).map(questionId => ({ id: randomUUID(), questionId })) })
  const state = { version: 1, runId, projectId: target.projectId, productionProjectId: target.productionProjectId,
    category: `security-${runId}`, phase: 'planned', users: ROLES.map(role => ({ role, id: randomUUID(),
      email: `s3-${runId}-${role}@example.invalid`, password: randomBytes(24).toString('base64url') + 'aA1!' })),
    questions, open: room(false), finished: room(true) }
  if (state.open.code === state.finished.code) state.finished.code = state.open.code === 'FFFFFF' ? '000000' : 'FFFFFF'
  return state
}

export function validateFixtureState(s, target) {
  requireSafe(s?.version === 1 && uuid(s.runId) && s.projectId === target.projectId
    && s.productionProjectId === target.productionProjectId && s.category === `security-${s.runId}`
    && ['planned', 'ready', 'testing', 'tested', 'test-failed', 'cleaning', 'cleaned'].includes(s.phase), 'FIXTURE_STATE_INVALID')
  requireSafe(Array.isArray(s.users) && s.users.length === 5 && s.questions?.length === 5, 'FIXTURE_STATE_INVALID')
  const ids = [...s.questions]
  for (const [index, role] of ROLES.entries()) {
    const u = s.users[index]
    requireSafe(u.role === role && u.email === `s3-${s.runId}-${role}@example.invalid`
      && typeof u.password === 'string' && u.password.length >= 32 && u.password.length <= 128, 'FIXTURE_STATE_INVALID')
    ids.push(u.id)
  }
  for (const [r, count] of [[s.open, 1], [s.finished, 5]]) {
    requireSafe(r && /^[A-F0-9]{6}$/.test(r.code) && /^[a-f0-9]{48}$/.test(r.token)
      && r.rounds?.length === count, 'FIXTURE_STATE_INVALID')
    ids.push(r.id, r.participantId)
    for (const [i, round] of r.rounds.entries()) {
      requireSafe(round.questionId === s.questions[i], 'FIXTURE_STATE_INVALID'); ids.push(round.id)
    }
  }
  requireSafe(ids.every(uuid) && new Set(ids).size === ids.length && s.open.code !== s.finished.code, 'FIXTURE_STATE_INVALID')
}

export function fixtureStore(directory, repoRoot, keyHex) {
  const root = validateStateDirectory(directory, repoRoot)
  requireSafe(/^[a-f0-9]{64}$/i.test(keyHex || ''), 'STATE_ENCRYPTION_KEY_REQUIRED')
  mkdirSync(root, { recursive: true, mode: 0o700 })
  const key = Buffer.from(keyHex, 'hex')
  const file = path.join(root, 'fixture.enc')
  const checkedFile = filename => {
    try { const st = lstatSync(filename); requireSafe(st.isFile() && !st.isSymbolicLink() && st.size < 131072, 'STATE_FILE_INVALID') }
    catch (e) { if (e.code !== 'ENOENT') throw e }
  }
  return {
    root,
    lock() {
      const lock = path.join(root, 'fixture.lock')
      let fd
      try { fd = openSync(lock, 'wx', 0o600) } catch { throw new Error('FIXTURE_LOCKED_NO_AUTO_STEAL') }
      writeFileSync(fd, String(process.pid))
      return () => { closeSync(fd); unlinkSync(lock) }
    },
    load() {
      checkedFile(file)
      let sealed
      try { sealed = readFileSync(file, 'utf8') } catch (e) { if (e.code === 'ENOENT') return null; throw new Error('STATE_READ_FAILED') }
      try {
        const envelope = JSON.parse(sealed)
        const decipher = createDecipheriv('aes-256-gcm', key, Buffer.from(envelope.iv, 'hex'))
        decipher.setAuthTag(Buffer.from(envelope.tag, 'hex'))
        return JSON.parse(Buffer.concat([decipher.update(Buffer.from(envelope.data, 'hex')), decipher.final()]).toString())
      } catch { throw new Error('STATE_INTEGRITY_FAILED') }
    },
    save(state) {
      checkedFile(file)
      const iv = randomBytes(12), cipher = createCipheriv('aes-256-gcm', key, iv)
      const data = Buffer.concat([cipher.update(JSON.stringify(state)), cipher.final()])
      const temp = path.join(root, `fixture-${randomUUID()}.tmp`)
      writeFileSync(temp, JSON.stringify({ iv: iv.toString('hex'), tag: cipher.getAuthTag().toString('hex'), data: data.toString('hex') }), { flag: 'wx', mode: 0o600 })
      renameSync(temp, file)
    },
    manifest(state) {
      const name = path.join(root, 'fixture.json'); checkedFile(name)
      writeFileSync(name, JSON.stringify(publicManifest(state), null, 2) + '\n', { mode: 0o600 })
    },
  }
}

export function publicManifest(s) {
  return { disposable: true, projectRef: s.projectId, openRoomId: s.open.id, rewardRoomId: s.finished.id,
    playerParticipantId: s.open.participantId, rewardParticipantId: s.finished.participantId }
}

const users = s => s.users.map(u => ({ id: u.id, email: u.email, role: ['player','host'].includes(u.role) ? 'user' : u.role }))
const questionPayload = n => ({ prompt: { en: `Synthetic fixture ${n + 1}`, am: 'ሙከራ' },
  options: ['A','B','C','D'].map(key => ({ key, text: { en: `Fixture ${key}`, am: key }, hidden: { correctKey: 'LEAK' } })),
  correctKey: 'A', explanation: { en: 'LEAK synthetic explanation' }, metadata: { answer: 'LEAK' } })
function shapeQueries(s) {
  const host=s.users[1].id, player=s.users[0].id
  const roomData = [[s.open,false],[s.finished,true]].map(([r,finished])=>({id:r.id,code_hash:sha256(r.code),state:finished?'finished':'playing'}))
  const members = [[s.open,0],[s.finished,5]].map(([r,score])=>({id:r.participantId,room_id:r.id,token_hash:sha256(r.token),score}))
  const rounds = [[s.open,false],[s.finished,true]].flatMap(([r,finished])=>r.rounds.map((q,i)=>({id:q.id,room_id:r.id,question_id:q.questionId,position:i+1,status:finished?'revealed':'open'})))
  return {
    users:`select count(*) from public.profiles p join jsonb_to_recordset(${json(users(s))}) as x(id uuid,role text) on p.id=x.id and p.role::text=x.role`,
    questions:`select count(*) from play_private.game_night_questions q join jsonb_to_recordset(${json(s.questions.map((id,i)=>({id,payload:questionPayload(i)})))}) as x(id uuid,payload jsonb) on q.id=x.id
      where q.category=${quote(s.category)} and q.payload=x.payload and q.difficulty='beginner' and q.status='published' and q.reviewed_at is not null`,
    rooms:`select count(*) from public.play_rooms r join jsonb_to_recordset(${json(roomData)}) as x(id uuid,code_hash text,state text) on r.id=x.id
      where r.host_user_id=${quote(host)} and r.code_hash=decode(x.code_hash,'hex') and r.state=x.state
      and r.settings=${json({category:s.category,difficulty:'beginner',question_count:5})} and r.expires_at>now()`,
    participants:`select count(*) from public.play_room_participants p join jsonb_to_recordset(${json(members)}) as x(id uuid,room_id uuid,token_hash text,score integer) on p.id=x.id
      where p.room_id=x.room_id and p.user_id=${quote(player)} and p.join_token_hash=decode(x.token_hash,'hex') and p.score=x.score`,
    rounds:`select count(*) from public.play_room_rounds r join jsonb_to_recordset(${json(rounds)}) as x(id uuid,room_id uuid,question_id uuid,position integer,status text) on r.id=x.id
      where r.room_id=x.room_id and r.secure_question_id=x.question_id and r.content_id is null and r.position=x.position and r.status=x.status`,
    submissions:`select count(*) from public.play_room_submissions where participant_id=${quote(s.finished.participantId)}
      and round_id in (${list(s.finished.rounds.map(r=>r.id))}) and points=1 and is_correct and answer_key='A'`,
  }
}
function ownership(s, allowMissing = false) {
  return `do $$ declare u record; found_user auth.users; begin
  for u in select * from jsonb_to_recordset(${json(users(s))}) as x(id uuid,email text,role text) loop
    select * into found_user from auth.users where id=u.id;
    if found_user.id is null then ${allowMissing ? 'continue;' : "raise exception 'FIXTURE_USER_MISSING';"} end if;
    if found_user.email is distinct from u.email or found_user.raw_app_meta_data->>'security_fixture' is distinct from ${quote(s.runId)} then
      raise exception 'FIXTURE_OWNERSHIP_MISMATCH'; end if;
  end loop;
end $$;`
}

export function seedSql(s) {
  const host = s.users[1].id, player = s.users[0].id
  const statements = [`begin; set local search_path=pg_catalog,public,extensions,pg_temp; select pg_advisory_xact_lock(hashtext(${quote(s.runId)}));`, ownership(s), `do $$ declare u record; p public.profiles; begin
    for u in select * from jsonb_to_recordset(${json(users(s))}) as x(id uuid,email text,role text) loop
      select * into p from public.profiles where id=u.id;
      if p.id is not null and p.role::text is distinct from u.role then
        if p.role::text is distinct from 'user' then raise exception 'FIXTURE_ROLE_MISMATCH'; end if;
        -- Only fresh, marked test users: bootstrap by owner INSERT, not guard bypass.
        delete from public.profiles where id=u.id;
      end if;
      insert into public.profiles(id,email,display_name,role)
        select u.id,u.email,'Security fixture',(jsonb_populate_record(null::public.profiles,jsonb_build_object('role',u.role))).role
        on conflict(id) do nothing;
    end loop;
  end $$;`]
  for (const [i, id] of s.questions.entries()) statements.push(`
    insert into play_private.game_night_questions(id,category,difficulty,status,reviewed_at,payload)
      values(${quote(id)},${quote(s.category)},'beginner','published',now(),${json(questionPayload(i))}) on conflict(id) do nothing;
    do $$ begin if not exists(select 1 from play_private.game_night_questions where id=${quote(id)}
      and category=${quote(s.category)} and payload=${json(questionPayload(i))} and status='published' and reviewed_at is not null)
      then raise exception 'FIXTURE_QUESTION_MISMATCH'; end if; end $$;`)
  for (const [r, finished] of [[s.open, false], [s.finished, true]]) {
    statements.push(`insert into public.play_rooms(id,code_hash,host_user_id,state,settings)
      values(${quote(r.id)},decode(${quote(sha256(r.code))},'hex'),${quote(host)},${quote(finished ? 'finished' : 'playing')},
      ${json({ category: s.category, difficulty: 'beginner', question_count: 5 })}) on conflict(id) do nothing;
      do $$ begin if not exists(select 1 from public.play_rooms where id=${quote(r.id)} and host_user_id=${quote(host)}
        and code_hash=decode(${quote(sha256(r.code))},'hex') and settings->>'category'=${quote(s.category)}
        and state=${quote(finished ? 'finished' : 'playing')} and expires_at>now()) then raise exception 'FIXTURE_ROOM_MISMATCH'; end if; end $$;
      insert into public.play_room_participants(id,room_id,user_id,display_name,join_token_hash,score)
        values(${quote(r.participantId)},${quote(r.id)},${quote(player)},'Fixture Player',decode(${quote(sha256(r.token))},'hex'),${finished ? 5 : 0}) on conflict(id) do nothing;`)
    for (const [i, round] of r.rounds.entries()) {
      statements.push(`insert into public.play_room_rounds(id,room_id,secure_question_id,position,status,revealed_at)
        values(${quote(round.id)},${quote(r.id)},${quote(round.questionId)},${i + 1},${quote(finished ? 'revealed' : 'open')},${finished ? 'now()' : 'null'}) on conflict(id) do nothing;`)
      if (finished) statements.push(`insert into public.play_room_submissions(round_id,participant_id,answer_key,is_correct,points)
        values(${quote(round.id)},${quote(r.participantId)},'A',true,1) on conflict(round_id,participant_id) do nothing;`)
    }
  }
  const queries=shapeQueries(s), expected={users:5,questions:5,rooms:2,participants:2,rounds:6,submissions:5}
  statements.push(`do $$ begin if not (${Object.entries(expected).map(([k,n])=>`(${queries[k]})=${n}`).join(' and ')})
    then raise exception 'FIXTURE_SHAPE_MISMATCH'; end if; end $$;`, 'commit;')
  return statements.join('\n')
}

export function verifySql(s) {
  return `begin; set local search_path=pg_catalog,public,extensions,pg_temp; ${ownership(s)}
    select jsonb_build_object(
      ${Object.entries(shapeQueries(s)).map(([key,sql])=>`${quote(key)},(${sql})`).join(',\n')},
      'awards',(select count(*) from play_private.play_reward_ledger where user_id=${quote(s.users[0].id)} and game_type='game-night' and activity_id=${quote(`game-night:${s.finished.id}`)}),
      'awardXp',(select coalesce(sum(xp_earned),0) from play_private.play_reward_ledger where user_id=${quote(s.users[0].id)} and game_type='game-night' and activity_id=${quote(`game-night:${s.finished.id}`)}),
      'results',(select count(*) from public.play_game_results where user_id=${quote(s.users[0].id)} and game_type='game-night' and category=${quote(`game-night:${s.finished.id}`)}),
      'xpTotal',coalesce((select xp from public.play_user_progress where user_id=${quote(s.users[0].id)}),0));
    commit;`
}

export function cleanupSql(s) {
  const userIds = list(s.users.map(u => u.id)), roomIds = list([s.open.id,s.finished.id])
  return `begin; set local search_path=pg_catalog,public,extensions,pg_temp; select pg_advisory_xact_lock(hashtext(${quote(s.runId)})); ${ownership(s, true)}
    do $$ begin
      if exists(select 1 from public.play_rooms where id in (${roomIds}) and (host_user_id<>${quote(s.users[1].id)} or settings->>'category' is distinct from ${quote(s.category)}))
        or exists(select 1 from public.play_rooms where host_user_id in (${userIds}) and id not in (${roomIds}))
        or exists(select 1 from play_private.game_night_questions where id in (${list(s.questions)}) and category<>${quote(s.category)})
        or exists(select 1 from public.play_room_rounds where secure_question_id in (${list(s.questions)}) and room_id not in (${roomIds}))
      then raise exception 'FIXTURE_CLEANUP_SCOPE_MISMATCH'; end if;
    end $$;
    delete from play_private.play_reward_ledger where user_id in (${userIds});
    delete from play_private.verified_play_completions where user_id in (${userIds});
    delete from public.play_game_results where user_id in (${userIds});
    delete from public.play_user_achievements where user_id in (${userIds});
    delete from public.play_user_progress where user_id in (${userIds});
    delete from public.play_room_join_attempts where client_key in (${userIds});
    delete from public.play_rooms where id in (${roomIds});
    delete from play_private.game_night_questions where id in (${list(s.questions)}) and category=${quote(s.category)};
    delete from public.profiles where id in (${userIds});
    commit;`
}

async function existingUser(io, s, u) {
  const response = await io.auth('GET', `/admin/users/${u.id}`)
  if (response.status === 404) return null
  const value = response.body?.user || response.body
  requireSafe(response.status === 200 && value?.id === u.id && value.email === u.email
    && value.app_metadata?.security_fixture === s.runId && value.role === 'authenticated', 'AUTH_FIXTURE_OWNERSHIP_MISMATCH')
  return value
}

export async function runFixtures(command, s, target, io, save) {
  validateFixtureState(s, target)
  if (command === 'setup') {
    requireSafe(!['cleaning','cleaned','testing','test-failed'].includes(s.phase), 'FIXTURE_NOT_REUSABLE')
    await io.sql('preflight', `do $$ begin
      if to_regclass('public.profiles') is null or to_regclass('play_private.game_night_questions') is null
        or to_regclass('play_private.play_reward_ledger') is null or to_regclass('play_private.verified_play_completions') is null
        or to_regclass('public.play_game_results') is null or to_regclass('public.play_user_progress') is null
        or to_regclass('public.play_rooms') is null or to_regclass('public.play_room_participants') is null
        or to_regclass('public.play_room_rounds') is null or to_regclass('public.play_room_submissions') is null
        or to_regclass('public.play_room_join_attempts') is null or to_regclass('public.play_user_achievements') is null
        or to_regprocedure('public.claim_verified_play_room_reward(uuid,uuid)') is null
      then raise exception 'FIXTURE_SCHEMA_NOT_READY'; end if;
    end $$;`)
    // Every intended Auth ID was durably saved before any external call.
    for (const u of s.users) if (!await existingUser(io, s, u)) {
      const r = await io.auth('POST', '/admin/users', { id: u.id, email: u.email, password: u.password,
        email_confirm: true, app_metadata: { security_fixture: s.runId } })
      requireSafe([200,201].includes(r.status), 'AUTH_FIXTURE_CREATE_FAILED')
      await existingUser(io, s, u)
    }
    await io.sql('seed', seedSql(s)); s.phase = s.phase === 'tested' ? 'tested' : 'ready'; save(s)
  } else if (command === 'cleanup') {
    if (s.phase === 'cleaned') return { status: 'CLEANED' }
    for (const u of s.users) await existingUser(io, s, u)
    s.phase = 'cleaning'; save(s)
    await io.sql('cleanup', cleanupSql(s))
    for (const u of [...s.users].reverse()) if (await existingUser(io, s, u)) {
      const r = await io.auth('DELETE', `/admin/users/${u.id}`, { should_soft_delete: false })
      requireSafe([200,204,404].includes(r.status), 'AUTH_FIXTURE_DELETE_FAILED')
    }
    s.phase = 'cleaned'; save(s); return { status: 'CLEANED' }
  } else requireSafe(['verify','test'].includes(command) && ['ready','tested'].includes(s.phase), 'FIXTURE_NOT_READY')
  const summary = await io.sql('verify', verifySql(s))
  for (const [field, count] of Object.entries({ users: 5, questions: 5, rooms: 2, participants: 2, rounds: 6, submissions: 5 }))
    requireSafe(summary[field] === count, 'FIXTURE_VERIFICATION_FAILED')
  for (const field of ['awards','awardXp','results','xpTotal'])
    requireSafe(Number.isSafeInteger(summary[field]) && summary[field] >= 0, 'FIXTURE_VERIFICATION_FAILED')
  if (command === 'test') {
    requireSafe(s.phase === 'ready' && summary.awards === 0, 'FIXTURE_TEST_ALREADY_CONSUMED')
    const credentials = {}
    for (const u of s.users) {
      const r = await io.auth('POST', '/token?grant_type=password', { email: u.email, password: u.password }, false)
      requireSafe(r.status === 200 && r.body?.user?.id === u.id, 'FIXTURE_LOGIN_FAILED')
      validateUserToken(r.body.access_token, u.id, target)
      credentials[u.role] = r.body.access_token
    }
    // Record uncertainty BEFORE any test request; failed/interrupted tests are
    // never silently replayed against consumed counters or reward fixtures.
    s.phase = 'testing'; save(s)
    try {
      const assertions = await io.test(publicManifest(s), credentials, s.open.token)
      const after = await io.sql('verify', verifySql(s))
      requireSafe(after.awards === 1 && after.awardXp === 100 && after.results === summary.results + 1
        && after.xpTotal === summary.xpTotal + 100, 'REWARD_OWNER_EVIDENCE_MISMATCH')
      s.phase = 'tested'; save(s); return { status: 'PASS', assertions, ownerEvidence: {
        xpBefore: summary.xpTotal, xpAfter: after.xpTotal, ledgerRows: after.awards, awardedXp: after.awardXp, resultDelta: after.results-summary.results,
      } }
    } catch (error) {
      s.phase = 'test-failed'; save(s)
      if (error instanceof StagingError && error.code === 'PSQL_TERMINATION_UNCONFIRMED') throw error
      throw new Error('STAGING_TEST_FAILED_FIXTURE_CONSUMED')
    }
  }
  requireSafe(Number.isSafeInteger(summary.awards) && summary.awards >= 0 && summary.awards <= 1, 'FIXTURE_VERIFICATION_FAILED')
  return { status: s.phase === 'tested' ? 'READY_CONSUMED' : 'READY', counts: Object.fromEntries(
    ['users','questions','rooms','participants','rounds','submissions','awards','awardXp','results','xpTotal'].map(k => [k, summary[k]])) }
}
