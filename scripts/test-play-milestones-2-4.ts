import assert from 'node:assert/strict'
import { readFile } from 'node:fs/promises'
import { APPROVED_QUESTIONS, MATCH_PAIRS, WHO_AM_I_CARDS, questionsFor } from '../src/lib/play/approvedContent'
import { applyPlayCompletion, EMPTY_PLAY_PROGRESS } from '../src/lib/play/progress'

const ids = APPROVED_QUESTIONS.map((item) => item.id)
assert.equal(new Set(ids).size, ids.length, 'Approved content IDs must be unique')
assert.ok(questionsFor('trivia').length >= 20, 'Trivia needs at least 20 approved questions')
assert.ok(questionsFor('emoji').length >= 5, 'Emoji Challenge needs an approved puzzle bank')
assert.ok(questionsFor('finish-the-verse').length >= 5, 'Finish the Verse needs exact sourced excerpts')
assert.ok(questionsFor('history').length >= 5, 'History Quest needs reviewed source-linked questions')
assert.ok(WHO_AM_I_CARDS.length >= 5, 'Who Am I needs a playable card deck')
assert.ok(MATCH_PAIRS.length >= 8, 'Match & Discover needs enough pairs for its largest board')
assert.equal(questionsFor('finish-the-mezmur').length, 0, 'Mezmur questions must remain editorially gated instead of being fabricated locally')

for (const question of APPROVED_QUESTIONS) {
  assert.equal(question.options.length, 4, `${question.id} must have four options`)
  assert.ok(question.options.some((option) => option.key === question.correctKey), `${question.id} must reference a valid answer`)
  assert.ok(question.source.label && question.source.route.startsWith('/'), `${question.id} must retain an internal source reference`)
  assert.ok(question.verifiedLocales.includes('en'), `${question.id} must have a verified English base`) 
}
for (const item of [...WHO_AM_I_CARDS, ...MATCH_PAIRS]) {
  assert.ok(item.source.label && item.source.route.startsWith('/'), `${item.id} must retain an internal source reference`)
}

const dayOne = applyPlayCompletion(EMPTY_PLAY_PROGRESS, { game: 'trivia', score: 5, maxScore: 5, category: 'Bible' }, new Date('2026-10-27T12:00:00Z'))
assert.equal(dayOne.xpEarned, 100, 'A perfect round earns 100 XP')
assert.equal(dayOne.progress.streak, 1)
assert.deepEqual(dayOne.newAchievements.sort(), ['first-steps', 'perfect-round'])

const sameDay = applyPlayCompletion(dayOne.progress, { game: 'emoji', score: 2, maxScore: 4, category: 'Bible stories' }, new Date('2026-10-27T18:00:00Z'))
assert.equal(sameDay.progress.streak, 1, 'Multiple rounds in one day must not inflate the streak')
assert.equal(sameDay.xpEarned, 60, 'XP must scale from 20 to 100 based on score')

const dayTwo = applyPlayCompletion(sameDay.progress, { game: 'match', score: 4, maxScore: 4, category: 'Seven Sacraments' }, new Date('2026-10-28T12:00:00Z'))
assert.equal(dayTwo.progress.streak, 2)
assert.ok(dayTwo.newAchievements.includes('curious-explorer'), 'Three game types award Curious Explorer')
const dayThree = applyPlayCompletion(dayTwo.progress, { game: 'history', score: 3, maxScore: 5, category: 'Church history' }, new Date('2026-10-29T12:00:00Z'))
assert.equal(dayThree.progress.streak, 3)
assert.ok(dayThree.newAchievements.includes('three-day-streak'))
assert.equal(dayThree.progress.categoryMastery.Bible.correct, 5)
assert.equal(dayThree.progress.personalBests.trivia, 5)

const migration = await readFile(new URL('../supabase/migrations/20261031120000_tewahedo_play_milestones_2_4.sql', import.meta.url), 'utf8')
for (const table of ['play_content_items', 'play_user_progress', 'play_game_results', 'play_achievements', 'play_user_achievements']) {
  assert.ok(migration.includes(`public.${table}`), `Migration must define ${table}`)
}
assert.match(migration, /status = 'published' or coalesce\(public\.is_staff\(\), false\)/, 'Public reads must exclude unpublished content')
assert.match(migration, /Content must be approved before publication/, 'Publishing must require prior approval')
assert.match(migration, /security definer set search_path = public/, 'Progress writes must use the validated RPC')
assert.match(migration, /p_score < 0 or p_score > p_max_score/, 'Progress RPC must reject invalid score ranges')

console.log('Tewahedo Play Milestones 2-4 checks passed.')
