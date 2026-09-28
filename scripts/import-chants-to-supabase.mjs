import { readFile } from 'node:fs/promises'
import { resolve } from 'node:path'
import { createClient } from '@supabase/supabase-js'

const ROOT = resolve(import.meta.dirname, '..')
const DATA_DIR = resolve(ROOT, 'src', 'data', 'chants')
const DRY_RUN = process.argv.includes('--dry-run')
const BATCH_SIZE = 50

const sourceGroups = [
  {
    base: 'amharic-chants.json',
    classified: 'classified/amharic-chants.classified.json',
    sourcePack: 'amharic-chants',
    language: 'am',
  },
  {
    base: 'english-mezmur-chants.json',
    classified: 'classified/english-mezmur-chants.classified.json',
    sourcePack: 'english-mezmur-chants',
    language: 'en',
  },
  {
    base: 'werb.json',
    classified: 'classified/werb.classified.json',
    sourcePack: 'werb',
    language: 'am',
  },
]

async function readJson(relativePath) {
  const body = await readFile(resolve(DATA_DIR, relativePath), 'utf8')
  return JSON.parse(body)
}

function entriesFromJson(value) {
  if (Array.isArray(value)) return value
  return Array.isArray(value?.entries) ? value.entries : []
}

function chantForm(row) {
  if (row?.form === 'mezmur' || row?.type === 'mezmur') return 'mezmur'
  if (row?.form === 'werb' || row?.type === 'werb') return 'werb'
  return null
}

function nonEmptyString(value) {
  return typeof value === 'string' && value.trim() ? value.trim() : null
}

function strings(value) {
  return Array.isArray(value)
    ? [...new Set(value.filter((item) => typeof item === 'string').map((item) => item.trim()).filter(Boolean))]
    : []
}

function slugify(value, fallback) {
  const slug = String(value ?? '')
    .normalize('NFKD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/&/g, ' and ')
    .replace(/['’]/g, '')
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
  return slug || fallback
}

async function loadChants() {
  const byKey = new Map()

  for (const group of sourceGroups) {
    const baseRows = entriesFromJson(await readJson(group.base))
    for (const row of baseRows) {
      const form = chantForm(row)
      const id = nonEmptyString(row?.id)
      if (!form || !id) continue
      const key = `${form}:${id}`
      byKey.set(key, {
        ...byKey.get(key),
        ...row,
        form,
        id,
        __sourcePack: group.sourcePack,
        __defaultLanguage: group.language,
      })
    }
  }

  // Classification files override their base rows while preserving richer
  // practice metadata that may only exist in the original source.
  for (const group of sourceGroups) {
    let classifiedRows
    try {
      classifiedRows = entriesFromJson(await readJson(group.classified))
    } catch (error) {
      if (error?.code === 'ENOENT') continue
      throw error
    }
    for (const row of classifiedRows) {
      const form = chantForm(row)
      const id = nonEmptyString(row?.id)
      if (!form || !id) continue
      const key = `${form}:${id}`
      byKey.set(key, {
        ...byKey.get(key),
        ...row,
        form,
        id,
        __sourcePack: group.sourcePack,
        __defaultLanguage: group.language,
      })
    }
  }

  return [...byKey.values()]
}

function assignUniqueSlugs(rows) {
  const used = new Set()
  const overrideById = {
    'dink-adirgolignyal': 'dink-adirgolignal',
  }

  return rows.map((row) => {
    const preferred =
      row.form === 'mezmur'
        ? overrideById[row.id] || row.slug || row.transliterationTitle || row.title || row.id
        : row.slug || row.id
    const base = slugify(preferred, slugify(row.id, 'chant'))
    let slug = base
    let suffix = 2
    while (used.has(slug)) {
      slug = `${base}-${slugify(row.id, String(suffix))}`
      suffix += 1
    }
    used.add(slug)
    return { ...row, __slug: slug }
  })
}

const directFields = new Set([
  'type',
  'form',
  'id',
  'slug',
  'title',
  'transliterationTitle',
  'lyrics',
  'transliterationLyrics',
  'meaning',
  'youtubeUrl',
  'audioUrl',
  'thumbnail',
  'language',
  'category',
  'classification',
  '__sourcePack',
  '__defaultLanguage',
  '__slug',
])

function metadataFromRow(row) {
  return Object.fromEntries(
    Object.entries(row).filter(([key, value]) => !directFields.has(key) && value !== undefined),
  )
}

function databaseRow(row, knownCategories) {
  const category = row.category && typeof row.category === 'object' ? row.category : {}
  const classification =
    row.classification && typeof row.classification === 'object' ? row.classification : {}
  const primaryCategorySlug = nonEmptyString(classification.primaryCategorySlug)
  const confidence = Number(classification.confidence)
  const languageValue = Array.isArray(row.language) ? row.language.join('-') : row.language

  return {
    key: `${row.form}:${row.id}`,
    id: row.id,
    form: row.form,
    slug: row.__slug,
    title: String(row.title ?? ''),
    transliteration_title: String(row.transliterationTitle ?? ''),
    lyrics: String(row.lyrics ?? ''),
    transliteration_lyrics: String(row.transliterationLyrics ?? ''),
    meaning: nonEmptyString(row.meaning),
    youtube_url: nonEmptyString(row.youtubeUrl),
    audio_url: nonEmptyString(row.audioUrl),
    thumbnail_url: nonEmptyString(row.thumbnail),
    language: nonEmptyString(languageValue) ?? row.__defaultLanguage,
    category_primary:
      typeof row.category === 'string'
        ? row.category
        : nonEmptyString(category.primary) ?? 'other',
    category_major_holidays: strings(category.majorHoliday),
    category_saints: strings(category.saints),
    category_themes: strings(category.themes),
    category_usage: strings(category.usage),
    category_seasons: strings(category.season),
    category_confidence: nonEmptyString(category.confidence),
    primary_category_slug:
      primaryCategorySlug && knownCategories.has(primaryCategorySlug)
        ? primaryCategorySlug
        : null,
    classification_confidence:
      Number.isFinite(confidence) && confidence >= 0 && confidence <= 1
        ? confidence
        : null,
    classification_reason: nonEmptyString(classification.reason),
    classification_signals: strings(classification.matchedSignals),
    needs_review: classification.needsReview === true,
    metadata: metadataFromRow(row),
    source_pack: row.__sourcePack,
    published: true,
  }
}

function categoryRow(category) {
  return {
    slug: category.slug,
    name_am: String(category.nameAm ?? ''),
    name_en: String(category.nameEn ?? ''),
    description: String(category.description ?? ''),
    display_order: Number.isFinite(category.displayOrder) ? category.displayOrder : 0,
    image_url: nonEmptyString(category.imageUrl),
    is_active: category.isActive !== false,
  }
}

function secondaryLinks(row, knownCategories) {
  const slugs = strings(row.classification?.secondaryCategorySlugs)
  return slugs
    .filter((slug) => knownCategories.has(slug))
    .map((category_slug) => ({
      chant_key: `${row.form}:${row.id}`,
      category_slug,
    }))
}

function chunks(items, size = BATCH_SIZE) {
  const output = []
  for (let index = 0; index < items.length; index += size) {
    output.push(items.slice(index, index + size))
  }
  return output
}

async function upsertBatches(supabase, table, rows, onConflict) {
  for (const batch of chunks(rows)) {
    const { error } = await supabase.from(table).upsert(batch, { onConflict })
    if (error) throw new Error(`${table}: ${error.message}`)
  }
}

async function main() {
  const categories = entriesFromJson(await readJson('categories.json')).map(categoryRow)
  const knownCategories = new Set(categories.map((category) => category.slug))
  const sourceRows = assignUniqueSlugs(await loadChants())
  const chants = sourceRows.map((row) => databaseRow(row, knownCategories))
  const links = sourceRows.flatMap((row) => secondaryLinks(row, knownCategories))

  if (DRY_RUN) {
    console.log(
      JSON.stringify(
        {
          categories: categories.length,
          chants: chants.length,
          mezmur: chants.filter((row) => row.form === 'mezmur').length,
          werb: chants.filter((row) => row.form === 'werb').length,
          secondaryCategoryLinks: links.length,
          needsReview: chants.filter((row) => row.needs_review).length,
        },
        null,
        2,
      ),
    )
    return
  }

  const url = process.env.SUPABASE_URL || process.env.VITE_SUPABASE_URL
  const secretKey = process.env.SUPABASE_SECRET_KEY
  if (!url || !secretKey) {
    throw new Error(
      'Set SUPABASE_URL and SUPABASE_SECRET_KEY in .env.local before importing.',
    )
  }

  const supabase = createClient(url, secretKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  })

  await upsertBatches(supabase, 'chant_categories', categories, 'slug')
  await upsertBatches(supabase, 'chants', chants, 'key')

  // Replace category links for imported chants so reruns do not leave stale links.
  for (const keyBatch of chunks(chants.map((row) => row.key))) {
    const { error } = await supabase
      .from('chant_secondary_categories')
      .delete()
      .in('chant_key', keyBatch)
    if (error) throw new Error(`chant_secondary_categories: ${error.message}`)
  }
  if (links.length) {
    await upsertBatches(
      supabase,
      'chant_secondary_categories',
      links,
      'chant_key,category_slug',
    )
  }

  console.log(
    `Imported ${chants.length} chants, ${categories.length} categories, and ${links.length} secondary category links.`,
  )
}

main().catch((error) => {
  console.error(error instanceof Error ? error.message : error)
  process.exitCode = 1
})

