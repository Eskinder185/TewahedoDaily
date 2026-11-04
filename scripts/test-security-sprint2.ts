import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { assertGameNightResult } from '../src/lib/play/gameNightProtocol'

for (const [error, expected] of [
  ['rate_limited', /Too many join attempts/], ['invalid_join', /six-character/],
  ['room_unavailable', /not found or expired/], ['name_unavailable', /already in the room/],
  ['untrusted backend detail', /could not be completed/],
] as const) assert.throws(() => assertGameNightResult({ error }), expected)
assert.doesNotThrow(() => assertGameNightResult({ room_id: 'fixture', participant_id: 'fixture', join_token: 'fixture' }))

const read = (name: string) => readFileSync(`docs/ai/proposed-migrations/${name}`, 'utf8')
const profile = read('20261103_profiles_role_guard_security.sql')
assert.match(profile, /revoke update \(id,email,role\) on public.profiles from public,anon,authenticated/)
assert.match(profile, /grant update \(display_name,avatar_url\)/)
assert.match(profile, /old.id<>auth.uid\(\)/)
assert.match(profile, /actor_role='super_admin'/)
assert.match(profile, /pg_advisory_xact_lock\(724601\)/)
assert.match(profile, /Cannot remove the last super admin/)
assert.match(profile, /create trigger profiles_guard_role before update/)
// Creation paths must continue ignoring caller-supplied role metadata.
const signup = readFileSync('supabase/migrations/20261004120000_regular_user_accounts.sql', 'utf8')
assert.match(signup, /values \(new.id, new.email, preferred_name, 'user'::public.cms_role\)/)
assert.match(signup, /select u.id, u.email, preferred_name, 'user'::public.cms_role/)
const grants = readFileSync('supabase/migrations/20260928000000_cms_foundation.sql', 'utf8')
assert.match(grants, /grant update \(display_name, avatar_url\) on public.profiles/)
assert.match(grants, /old_role in \('admin','super_admin'\) or new_role in \('admin','super_admin'\)/)

const game = read('20261103_game_night_security.sql')
assert.match(game, /revoke all on schema play_private from public,anon,authenticated/)
const start = game.split('create or replace function public.start_play_room_round')[1].split('create or replace function public.get_play_room_state')[0]
const submit = game.split('create or replace function public.submit_play_room_answer')[1]
assert.doesNotMatch(start, /from public.play_content_items/)
assert.doesNotMatch(submit, /from public.play_content_items/)
assert.match(game, /question is null and room.state='finished' and round_row.status='revealed'/)
assert.match(game, /from play_private.game_night_questions/)
const dto = game.split('create or replace function public.play_room_question_view')[1].split('revoke all on function')[0]
assert.doesNotMatch(dto, /p_payload\s*\|\||p_payload\s+-\s*'|then p_payload/)
assert.match(dto, /jsonb_build_object\('en',public.play_room_text\(o#>'\{text,en\}'\),'am',public.play_room_text\(o#>'\{text,am\}'\)\)/)
assert.match(dto, /case when p_revealed then/)
const join = game.split('create or replace function public.join_play_room')[1].split('create or replace function public.start_play_room_round')[0]
assert.doesNotMatch(join, /raise exception/i, 'expected rejections must commit counters')
assert.match(join, /pg_advisory_xact_lock\(724602\)/)
assert.match(join, /insert into public.play_room_join_attempts/)
assert.match(join, /exception when unique_violation then return/)
assert.match(game, /Room membership required/)
assert.match(game, /Host permission required/)
assert.match(game, /for update of r/)
assert.match(game, /r.status='revealed'/)
assert.match(game, /return jsonb_build_object\('accepted',true\)/)
assert.match(readFileSync('supabase/migrations/20261101120000_tewahedo_play_game_night.sql','utf8'), /unique\(round_id,participant_id\)/)

const xp = read('20261103_verified_play_rewards.sql')
assert.match(xp, /unique\(user_id,game_type,activity_id\)/)
assert.match(xp, /grant execute on function public.award_verified_play_activity\(uuid\) to service_role/)
assert.match(xp, /revoke all on function public.record_play_completion[\s\S]*from public,anon,authenticated/)
assert.match(xp, /on conflict do nothing returning id into ledger_id/)
assert.match(xp, /if ledger_id is null then return/)
assert.match(xp, /select \* into evidence[\s\S]*for update/)
assert.doesNotMatch(xp, /p_score|p_snapshot|p_user_id/)
console.log('PASS: 6 actual Game Night client-result cases and profile/Game Night/XP SQL contract checks. No SQL executed; effective grants, rollback and concurrency remain UNVERIFIED.')
