#!/usr/bin/env node
/**
 * Import chants from src/data/chants into public.mezmur (+ related tables).
 *
 * Usage:
 *   npm run import:chants -- --dry-run
 *   npm run import:chants -- --dry-run --limit=5
 *   npm run import:chants -- --apply --limit=5
 *   npm run import:chants -- --apply
 *
 * Requires for --apply (server-only):
 *   SUPABASE_URL
 *   SUPABASE_SERVICE_ROLE_KEY  (or SUPABASE_SECRET_KEY)
 */
import { createClient } from '@supabase/supabase-js'
import { buildImportPlan, normalizeYoutubeUrl, slugify } from './plan.mjs'

function argValue(name) {
  const prefix = `--${name}=`
  const hit = process.argv.find((arg) => arg.startsWith(prefix))
  return hit ? hit.slice(prefix.length) : null
}

function hasFlag(name) {
  return process.argv.includes(`--${name}`)
}

function normalizeNameKey(value) {
  return String(value || '')
    .trim()
    .replace(/\s+/g, ' ')
    .toLocaleLowerCase()
}

async function fetchAll(supabase, table, columns) {
  const rows = []
  for (let from = 0; ; from += 1000) {
    const { data, error } = await supabase
      .from(table)
      .select(columns)
      .range(from, from + 999)
    if (error) throw error
    rows.push(...(data || []))
    if (!data || data.length < 1000) break
  }
  return rows
}

function compareAgainstRemote(plan, remote) {
  const existingBySlug = new Map(remote.mezmur.map((row) => [row.slug, row]))
  const existingByYoutube = new Map(
    remote.mezmur
      .filter((row) => row.youtube_url)
      .map((row) => [normalizeYoutubeUrl(row.youtube_url) || row.youtube_url, row]),
  )
  const existingSingers = new Map(
    remote.singers.map((row) => [normalizeNameKey(row.name), row]),
  )
  const existingCategories = new Map(remote.categories.map((row) => [row.slug, row]))
  const existingTags = new Map(remote.tags.map((row) => [row.slug, row]))

  const report = {
    newMezmur: [],
    existingMezmur: [],
    conflicts: [],
    newSingers: [],
    existingSingers: [],
    newCategories: [],
    existingCategories: [],
    newTags: [],
    existingTags: [],
    newTagLinksEstimate: 0,
  }

  for (const singer of plan.singers) {
    if (existingSingers.has(normalizeNameKey(singer.name))) report.existingSingers.push(singer.name)
    else report.newSingers.push(singer.name)
  }
  for (const category of plan.categories) {
    if (existingCategories.has(category.slug)) report.existingCategories.push(category.slug)
    else report.newCategories.push(category)
  }
  for (const tag of plan.tags) {
    if (existingTags.has(tag.slug)) report.existingTags.push(tag.slug)
    else report.newTags.push(tag)
  }

  for (const item of plan.items) {
    const bySlug = existingBySlug.get(item.slug)
    const byYoutube = item.youtube_url ? existingByYoutube.get(item.youtube_url) : null
    const match = bySlug || byYoutube
    if (!match) {
      report.newMezmur.push({ slug: item.slug, title: item.title, source: item.legacy_key })
      report.newTagLinksEstimate += item.tags.length
      continue
    }
    const titleDiffers =
      normalizeNameKey(match.title) !== normalizeNameKey(item.title) ||
      normalizeNameKey(match.title_amharic || '') !== normalizeNameKey(item.title_amharic || '')
    if (titleDiffers && bySlug && byYoutube && bySlug.id !== byYoutube.id) {
      report.conflicts.push({
        source: item.legacy_key,
        reason: 'Slug and YouTube match different existing rows',
        slugMatch: bySlug.slug,
        youtubeMatch: byYoutube.slug,
      })
      continue
    }
    report.existingMezmur.push({
      slug: item.slug,
      existingId: match.id,
      existingStatus: match.status,
      action: 'skip (already present; will not overwrite CMS edits)',
    })
  }

  return report
}

async function ensureCategory(supabase, category, cache) {
  if (cache.has(category.slug)) return cache.get(category.slug)
  const { data: existing } = await supabase
    .from('categories')
    .select('id,slug')
    .eq('slug', category.slug)
    .maybeSingle()
  if (existing) {
    cache.set(category.slug, existing.id)
    return existing.id
  }
  const { data, error } = await supabase
    .from('categories')
    .insert({
      name: category.name,
      name_amharic: category.name_amharic,
      slug: category.slug,
      type: 'mezmur',
      description: category.description,
    })
    .select('id')
    .single()
  if (error) throw new Error(`categories ${category.slug}: ${error.message}`)
  cache.set(category.slug, data.id)
  return data.id
}

async function ensureSinger(supabase, name, cache) {
  if (!name) return null
  const key = normalizeNameKey(name)
  if (cache.has(key)) return cache.get(key)
  const { data: rows, error: lookupError } = await supabase
    .from('singers')
    .select('id,name')
    .ilike('name', name)
    .limit(20)
  if (lookupError) throw new Error(`singers lookup: ${lookupError.message}`)
  const found = (rows || []).find((row) => normalizeNameKey(row.name) === key)
  if (found) {
    cache.set(key, found.id)
    return found.id
  }
  const { data, error } = await supabase.from('singers').insert({ name }).select('id').single()
  if (error) throw new Error(`singers insert ${name}: ${error.message}`)
  cache.set(key, data.id)
  return data.id
}

async function ensureTag(supabase, tag, cache) {
  if (cache.has(tag.slug)) return cache.get(tag.slug)
  const { data: existing } = await supabase
    .from('tags')
    .select('id,slug')
    .eq('slug', tag.slug)
    .maybeSingle()
  if (existing) {
    cache.set(tag.slug, existing.id)
    return existing.id
  }
  const { data, error } = await supabase
    .from('tags')
    .insert({ name: tag.name, slug: tag.slug })
    .select('id')
    .single()
  if (error) throw new Error(`tags ${tag.slug}: ${error.message}`)
  cache.set(tag.slug, data.id)
  return data.id
}

async function applyPlan(plan, supabase) {
  const categoryCache = new Map()
  const singerCache = new Map()
  const tagCache = new Map()
  const results = []

  // 1) categories  2) singers  3) tags  4) mezmur  5) mezmur_tags
  for (const category of plan.categories) {
    await ensureCategory(supabase, category, categoryCache)
  }
  for (const singer of plan.singers) {
    await ensureSinger(supabase, singer.name, singerCache)
  }
  for (const tag of plan.tags) {
    await ensureTag(supabase, tag, tagCache)
  }

  const remoteMezmur = await fetchAll(
    supabase,
    'mezmur',
    'id,slug,title,title_amharic,youtube_url,status,updated_at',
  )
  const bySlug = new Map(remoteMezmur.map((row) => [row.slug, row]))
  const byYoutube = new Map(
    remoteMezmur
      .filter((row) => row.youtube_url)
      .map((row) => [normalizeYoutubeUrl(row.youtube_url) || row.youtube_url, row]),
  )

  for (const item of plan.items) {
    const existing =
      bySlug.get(item.slug) ||
      (item.youtube_url ? byYoutube.get(item.youtube_url) : null)
    if (existing) {
      results.push({
        slug: item.slug,
        status: 'skipped_existing',
        id: existing.id,
      })
      continue
    }

    const category_id = await ensureCategory(
      supabase,
      plan.categories.find((row) => row.slug === item.category_slug) || {
        slug: item.category_slug,
        name: item.category_slug,
        name_amharic: null,
        type: 'mezmur',
      },
      categoryCache,
    )
    const singer_id = await ensureSinger(supabase, item.singer_name, singerCache)
    const now = new Date().toISOString()
    const payload = {
      slug: item.slug,
      title: item.title,
      title_amharic: item.title_amharic,
      title_oromo: item.title_oromo,
      description: item.description,
      lyrics_amharic: item.lyrics_amharic,
      lyrics_english: item.lyrics_english,
      lyrics_oromo: item.lyrics_oromo,
      transliteration: item.transliteration,
      youtube_url: item.youtube_url,
      audio_url: item.audio_url,
      thumbnail_url: item.thumbnail_url,
      singer_id,
      category_id,
      status: 'published',
      featured: false,
      published_at: now,
    }
    const { data, error } = await supabase.from('mezmur').insert(payload).select('id,slug').single()
    if (error) {
      results.push({ slug: item.slug, status: 'failed', message: error.message, code: error.code })
      continue
    }

    for (const tag of item.tags) {
      const tag_id = await ensureTag(supabase, tag, tagCache)
      const { error: linkError } = await supabase
        .from('mezmur_tags')
        .upsert({ mezmur_id: data.id, tag_id }, { onConflict: 'mezmur_id,tag_id' })
      if (linkError) {
        results.push({
          slug: item.slug,
          status: 'tag_link_failed',
          message: linkError.message,
        })
      }
    }

    results.push({ slug: item.slug, status: 'inserted', id: data.id })
  }

  return results
}

function printDryRun(plan, comparison) {
  console.log('\n=== CHANT SOURCE FILES ===')
  console.log('Found:', plan.files.found.join(', '))
  console.log('Used:', plan.files.used.join(', '))
  console.log('Ignored:', plan.files.ignored.join(', '))

  console.log('\n=== CHANTS ===')
  console.log(JSON.stringify(plan.totals, null, 2))

  console.log('\n=== FIELD MAPPINGS ===')
  console.log(JSON.stringify(plan.fieldMappings, null, 2))

  console.log('\n=== SUPABASE CHANGES THAT WOULD OCCUR ===')
  if (comparison) {
    console.log(
      JSON.stringify(
        {
          newMezmur: comparison.newMezmur.length,
          existingMezmur: comparison.existingMezmur.length,
          conflicts: comparison.conflicts.length,
          newSingers: comparison.newSingers,
          newCategories: comparison.newCategories.map((row) => row.slug),
          newTags: comparison.newTags.length,
          newTagLinksEstimate: comparison.newTagLinksEstimate,
          sampleNewMezmur: comparison.newMezmur.slice(0, 10),
          sampleConflicts: comparison.conflicts.slice(0, 10),
        },
        null,
        2,
      ),
    )
  } else {
    console.log(
      JSON.stringify(
        {
          note: 'No service-role credentials — local plan only (no remote comparison).',
          plannedMezmur: plan.items.length,
          plannedSingers: plan.singers.map((row) => row.name),
          plannedCategories: plan.categories.map((row) => row.slug),
          plannedTags: plan.tags.length,
        },
        null,
        2,
      ),
    )
  }

  const issueCodes = Object.fromEntries(
    [...new Set(plan.issues.map((issue) => issue.code))].map((code) => [
      code,
      plan.issues.filter((issue) => issue.code === code).length,
    ]),
  )
  console.log('\n=== ISSUES / WARNINGS ===')
  console.log(JSON.stringify(issueCodes, null, 2))

  console.log('\n=== SAMPLE PLANNED ROWS ===')
  console.log(
    JSON.stringify(
      plan.items.slice(0, 3).map((item) => ({
        slug: item.slug,
        title: item.title,
        title_amharic: item.title_amharic,
        youtube_url: item.youtube_url,
        category_slug: item.category_slug,
        tags: item.tags.map((tag) => tag.slug),
        status: item.status,
      })),
      null,
      2,
    ),
  )
}

async function main() {
  const apply = hasFlag('apply')
  const dryRun = hasFlag('dry-run') || !apply
  if (apply && hasFlag('dry-run')) {
    throw new Error('Choose either --dry-run or --apply, not both.')
  }
  const limit = Number(argValue('limit') || 0)
  const plan = await buildImportPlan({ limit: Number.isFinite(limit) ? limit : 0 })

  const url = process.env.SUPABASE_URL || process.env.VITE_SUPABASE_URL
  const key =
    process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_SECRET_KEY || ''

  let comparison = null
  let supabase = null
  if (url && key) {
    supabase = createClient(url, key, {
      auth: { persistSession: false, autoRefreshToken: false },
    })
    if (dryRun) {
      const remote = {
        mezmur: await fetchAll(
          supabase,
          'mezmur',
          'id,slug,title,title_amharic,youtube_url,status',
        ),
        singers: await fetchAll(supabase, 'singers', 'id,name'),
        categories: await fetchAll(supabase, 'categories', 'id,slug,name'),
        tags: await fetchAll(supabase, 'tags', 'id,slug,name'),
      }
      comparison = compareAgainstRemote(plan, remote)
    }
  } else if (apply) {
    throw new Error(
      'Set SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY (or SUPABASE_SECRET_KEY) in .env.import before --apply.',
    )
  }

  if (dryRun) {
    printDryRun(plan, comparison)
    console.log('\nDry run complete. No writes were performed.')
    console.log('Limited test:  npm run import:chants -- --apply --limit=5')
    console.log('Full import:   npm run import:chants -- --apply')
    return
  }

  const results = await applyPlan(plan, supabase)
  const summary = Object.fromEntries(
    [...new Set(results.map((row) => row.status))].map((status) => [
      status,
      results.filter((row) => row.status === status).length,
    ]),
  )
  console.log(JSON.stringify({ mode: 'apply', limit: limit || null, summary, results }, null, 2))
  if (results.some((row) => row.status === 'failed' || row.status === 'tag_link_failed')) {
    process.exitCode = 1
  }
}

main().catch((error) => {
  console.error(error instanceof Error ? error.message : error)
  process.exitCode = 1
})
