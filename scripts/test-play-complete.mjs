import assert from 'node:assert/strict'
import { readFile } from 'node:fs/promises'

const read = (path) => readFile(new URL(`../${path}`, import.meta.url), 'utf8')
const [app, adventure, gameNight, multiplayer, who, match, history, mezmur, prefetch, pipeline] = await Promise.all([
  read('src/App.tsx'), read('src/pages/play/AdventurePage.tsx'), read('src/pages/play/GameNightPage.tsx'),
  read('supabase/migrations/20261101120000_tewahedo_play_game_night.sql'), read('src/components/play/WhoAmIGame.tsx'),
  read('src/components/play/MatchGame.tsx'), read('src/components/play/HistoryQuestGame.tsx'),
  read('src/components/play/MezmurGame.tsx'), read('src/lib/routePrefetch.ts'), read('scripts/import-play-content-drafts.ts'),
])

assert.match(app, /lazy\(\(\) => import\('\.\/pages\/play\/AdventurePage'\)/)
assert.match(app, /lazy\(\(\) => import\('\.\/pages\/play\/GameNightPage'\)/)
assert.match(adventure, /Exodus 14:10–14/)
assert.match(adventure, /Interactive objects are learning aids, not additions to Scripture/)
assert.match(adventure, /recordPlayCompletion\(\{ game: 'adventure'/)
assert.match(prefetch, /play\/adventures/)
assert.match(prefetch, /play\/game-night/)

for (const control of ['60, 90, 120', 'biblical-people', 'biblical-locations', 'requestPermission']) assert.ok(who.includes(control), `Who Am I missing ${control}`)
assert.match(match, /Optional timer/)
for (const mode of ['Timeline Challenge', 'Who Was This?', 'Historical Mystery', 'Match the Event']) assert.ok(history.includes(mode), `History Quest missing ${mode}`)
for (const mode of ['Finish the Lyrics', 'Missing Word', 'Guess the Mezmur', 'Guess the Occasion']) assert.ok(mezmur.includes(mode), `Mezmur game missing ${mode}`)

for (const table of ['play_rooms', 'play_room_participants', 'play_room_rounds', 'play_room_submissions', 'play_room_join_attempts']) assert.ok(multiplayer.includes(`public.${table}`), `Missing multiplayer table ${table}`)
assert.match(multiplayer, /digest\(code,'sha256'\)/, 'Room codes must be stored as hashes')
assert.match(multiplayer, /join_token_hash/, 'Participant tokens must be hashed')
assert.match(multiplayer, /Too many join attempts/, 'Join RPC must rate limit attempts')
assert.match(multiplayer, /unique\(round_id,participant_id\)/, 'Duplicate answers must be blocked')
assert.match(multiplayer, /item\.payload-'correctKey'-'correct_key'/, 'Answers must remain hidden before reveal')
assert.match(multiplayer, /select payload->>'correctKey' into correct/, 'Scoring must happen on the server')
assert.match(multiplayer, /host_user_id=auth\.uid\(\)/, 'Host transitions must validate the authenticated host')
assert.match(gameNight, /server-validated scoring/)
assert.doesNotMatch(gameNight, /selected\s*===\s*room\.round\.question\.correctKey/, 'The player UI must not calculate correctness before the server reveal')
assert.match(pipeline, /status: 'draft'/, 'Content pipeline may only create drafts')
assert.match(pipeline, /SUPABASE_SERVICE_ROLE_KEY/, 'Draft writes must require server-side credentials')
assert.doesNotMatch(pipeline, /VITE_SUPABASE_SERVICE/, 'Service credentials must never use a client-side environment variable')
assert.match(pipeline, /duplicate stable ID/, 'Draft pipeline must detect duplicates')

console.log('Tewahedo Play complete-scope checks passed.')
