/**
 * Build an import plan from src/data/chants into public.mezmur (+ singers,
 * categories, tags, mezmur_tags). Does not write to Supabase.
 */
import { readFile } from 'node:fs/promises'
import { resolve } from 'node:path'

export const DATA_DIR = resolve(import.meta.dirname, '../../src/data/chants')

const SOURCE_GROUPS = [
  {
    base: 'amharic-chants.json',
    classified: 'classified/amharic-chants.classified.json',
    pack: 'amharic-chants',
    language: 'am',
    includeForms: new Set(['mezmur', 'werb']),
  },
  {
    base: 'english-mezmur-chants.json',
    classified: 'classified/english-mezmur-chants.classified.json',
    pack: 'english-mezmur-chants',
    language: 'en',
    includeForms: new Set(['mezmur']),
  },
  {
    base: 'werb.json',
    classified: 'classified/werb.classified.json',
    pack: 'werb',
    language: 'am',
    includeForms: new Set(['werb']),
  },
]

/** Map legacy category.primary values onto CMS category display names/slugs. */
export const PRIMARY_CATEGORY_MAP = {
  general: { slug: 'general', name: 'General' },
  mary: { slug: 'marian', name: 'Marian' },
  saint: { slug: 'saints', name: 'Saints' },
  liturgical: { slug: 'liturgical', name: 'Liturgical' },
  'major-holiday': { slug: 'feast-days', name: 'Feast Days' },
  cross: { slug: 'cross', name: 'Cross' },
  christ: { slug: 'christ', name: 'Christ' },
  other: { slug: 'other', name: 'Other' },
}

export function slugify(value, fallback = 'mezmur') {
  return (
    String(value || '')
      .normalize('NFKD')
      .replace(/[\u0300-\u036f]/g, '')
      .replace(/&/g, ' and ')
      .replace(/['’]/g, '')
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/^-+|-+$/g, '') || fallback
  )
}

function entriesFrom(value) {
  if (Array.isArray(value)) return value
  if (Array.isArray(value?.entries)) return value.entries
  return []
}

function text(value) {
  return typeof value === 'string' ? value.trim() : ''
}

function strings(value) {
  return Array.isArray(value)
    ? [...new Set(value.map((item) => text(item)).filter(Boolean))]
    : []
}

function normalizeName(value) {
  return text(value).replace(/\s+/g, ' ')
}

function normalizeNameKey(value) {
  return normalizeName(value).toLocaleLowerCase()
}

/** Accept full URLs, youtu.be, shorts, or raw 11-char ids. Empty => null. */
export function normalizeYoutubeUrl(value) {
  const raw = text(value)
  if (!raw) return null
  if (/^[A-Za-z0-9_-]{11}$/.test(raw)) {
    return `https://www.youtube.com/watch?v=${raw}`
  }
  let url
  try {
    url = new URL(raw)
  } catch {
    return null
  }
  if (url.protocol !== 'https:') return null
  const host = url.hostname.replace(/^www\./, '')
  if (!['youtube.com', 'm.youtube.com', 'music.youtube.com', 'youtu.be'].includes(host)) {
    return null
  }
  let id = null
  if (host === 'youtu.be') id = url.pathname.slice(1).split('/')[0]
  else if (url.pathname === '/watch') id = url.searchParams.get('v')
  else {
    const match = url.pathname.match(/^\/(?:shorts|embed|live)\/([^/]+)/)
    id = match?.[1] || null
  }
  if (!id || !/^[A-Za-z0-9_-]{11}$/.test(id)) return null
  return `https://www.youtube.com/watch?v=${id}`
}

function label(value) {
  return String(value)
    .replace(/-/g, ' ')
    .replace(/\b\w/g, (char) => char.toUpperCase())
}

function formOf(row) {
  if (row?.form === 'mezmur' || row?.type === 'mezmur') return 'mezmur'
  if (row?.form === 'werb' || row?.type === 'werb') return 'werb'
  return null
}

async function readJson(relativePath) {
  return JSON.parse(await readFile(resolve(DATA_DIR, relativePath), 'utf8'))
}

async function loadMergedRows() {
  const byKey = new Map()
  const filesUsed = []
  const filesIgnored = ['categories.json']

  for (const group of SOURCE_GROUPS) {
    const base = entriesFrom(await readJson(group.base))
    filesUsed.push(group.base)
    for (const row of base) {
      const form = formOf(row)
      const id = text(row?.id)
      if (!form || !id || !group.includeForms.has(form)) continue
      byKey.set(`${form}:${id}`, {
        ...row,
        form,
        id,
        __pack: group.pack,
        __language: group.language,
      })
    }

    try {
      const classified = entriesFrom(await readJson(group.classified))
      filesUsed.push(group.classified)
      for (const row of classified) {
        const form = formOf(row)
        const id = text(row?.id)
        if (!form || !id || !group.includeForms.has(form)) continue
        const key = `${form}:${id}`
        const previous = byKey.get(key) || {}
        byKey.set(key, {
          ...previous,
          ...row,
          // Prefer base lyrics/title/youtube when classified only adds metadata.
          title: text(previous.title) || text(row.title),
          lyrics: text(previous.lyrics) || text(row.lyrics),
          youtubeUrl:
            text(previous.youtubeUrl) !== ''
              ? previous.youtubeUrl
              : row.youtubeUrl,
          form,
          id,
          __pack: group.pack,
          __language: group.language,
          classification: row.classification ?? previous.classification,
        })
      }
    } catch (error) {
      if (error?.code !== 'ENOENT') throw error
    }
  }

  return { rows: [...byKey.values()], filesUsed, filesIgnored }
}

function categoryFor(row, catalogBySlug) {
  const classifiedSlug = text(row.classification?.primaryCategorySlug)
  if (classifiedSlug && catalogBySlug.has(classifiedSlug)) {
    const cat = catalogBySlug.get(classifiedSlug)
    return {
      slug: cat.slug,
      name: text(cat.nameEn) || label(cat.slug),
      name_amharic:
        text(cat.nameAm) && !cat.nameAm.includes('?') ? text(cat.nameAm) : null,
      source: 'categories.json',
    }
  }
  const primary =
    typeof row.category === 'string'
      ? row.category
      : text(row.category?.primary) || 'other'
  const mapped = PRIMARY_CATEGORY_MAP[primary] || PRIMARY_CATEGORY_MAP.other
  return {
    slug: mapped.slug,
    name: mapped.name,
    name_amharic: null,
    source: 'primary-map',
  }
}

function collectTags(row) {
  const tags = new Map()
  const add = (name, prefix = '') => {
    const cleaned = normalizeName(name)
    if (!cleaned) return
    const slug = (prefix ? `${prefix}-` : '') + slugify(cleaned)
    if (!tags.has(slug)) tags.set(slug, { name: label(cleaned), slug })
  }

  add(row.form === 'werb' ? 'werb' : 'mezmur', 'form')
  add(row.__language === 'en' ? 'english' : 'amharic', 'language')

  const category = row.category && typeof row.category === 'object' ? row.category : {}
  for (const name of [
    ...strings(category.themes),
    ...strings(category.saints),
    ...strings(row.classification?.secondaryCategorySlugs),
  ]) {
    add(name)
  }
  for (const name of [
    ...strings(category.majorHoliday),
    ...strings(category.usage),
    ...strings(category.season),
  ]) {
    add(name, 'occasion')
  }
  return [...tags.values()]
}

function assignUniqueSlugs(rows) {
  const used = new Set()
  const overrides = { 'dink-adirgolignyal': 'dink-adirgolignal' }
  return rows.map((row) => {
    const preferred =
      overrides[row.id] ||
      text(row.slug) ||
      row.id ||
      text(row.transliterationTitle) ||
      text(row.title)
    let slug = slugify(preferred, slugify(row.id, 'chant'))
    let n = 2
    while (used.has(slug)) {
      slug = `${slugify(preferred)}-${n}`
      n += 1
    }
    used.add(slug)
    return { ...row, __slug: slug }
  })
}

/**
 * Explicit source → database field mapping used by the importer.
 *
 * Source                          → Target
 * --------------------------------------------------------------
 * id / slug / transliterationTitle→ slug (prefer id when slug-like)
 * title (en pack)                 → title
 * transliterationTitle (am pack)  → title (latin display)
 * title (am pack)                 → title_amharic
 * meaning                         → description
 * lyrics (am)                     → lyrics_amharic
 * lyrics (en)                     → lyrics_english
 * transliterationLyrics           → transliteration
 * youtubeUrl                      → youtube_url (normalized or null)
 * audioUrl                        → audio_url
 * thumbnail                       → thumbnail_url
 * singer|artist|choir             → singers.name → singer_id
 * category.primary / class.slug   → categories → category_id
 * category themes/saints/etc      → tags + mezmur_tags
 * form/language                   → tags (form-*, language-*)
 */
export async function buildImportPlan({ limit = 0 } = {}) {
  const catalog = entriesFrom(await readJson('categories.json'))
  const catalogBySlug = new Map(catalog.map((row) => [row.slug, row]))
  const { rows: merged, filesUsed, filesIgnored } = await loadMergedRows()
  const withSlugs = assignUniqueSlugs(merged)
  const limited = limit > 0 ? withSlugs.slice(0, limit) : withSlugs

  const issues = []
  const log = (key, code, detail) => issues.push({ key, code, detail })

  const categories = new Map()
  const singers = new Map()
  const tags = new Map()
  const items = []
  const missingYoutubeSlugs = []
  let missingYoutube = 0
  let missingTitle = 0
  let missingSinger = 0

  for (const row of limited) {
    const key = `${row.form}:${row.id}`
    const titleDisplay =
      row.__language === 'am'
        ? text(row.transliterationTitle) || text(row.title)
        : text(row.title)
    const titleAmharic = row.__language === 'am' ? text(row.title) : ''
    if (!titleDisplay && !titleAmharic) {
      missingTitle += 1
      log(key, 'missing_title', 'No usable title')
      continue
    }

    const youtube = normalizeYoutubeUrl(row.youtubeUrl)
    if (!youtube) {
      missingYoutube += 1
      missingYoutubeSlugs.push(row.__slug || row.id)
      if (text(row.youtubeUrl)) log(key, 'invalid_youtube', row.youtubeUrl)
    }

    const lyrics = text(row.lyrics)
    if (!lyrics && !youtube) {
      log(key, 'invalid_content', 'Neither lyrics nor YouTube; skipped')
      continue
    }

    const singerName =
      normalizeName(row.singer) ||
      normalizeName(row.artist) ||
      normalizeName(row.choir)
    if (!singerName) missingSinger += 1
    else {
      const singerKey = normalizeNameKey(singerName)
      if (!singers.has(singerKey)) {
        singers.set(singerKey, { name: singerName })
      }
    }

    const category = categoryFor(row, catalogBySlug)
    categories.set(category.slug, {
      slug: category.slug,
      name: category.name,
      name_amharic: category.name_amharic,
      type: 'mezmur',
      description: null,
    })

    const itemTags = collectTags(row)
    for (const tag of itemTags) tags.set(tag.slug, tag)

    items.push({
      legacy_key: key,
      source_id: row.id,
      source_pack: row.__pack,
      form: row.form,
      slug: row.__slug,
      title: titleDisplay || titleAmharic,
      title_amharic: titleAmharic || null,
      title_oromo: null,
      description: text(row.meaning) || null,
      lyrics_amharic: row.__language === 'am' ? lyrics || null : null,
      lyrics_english: row.__language === 'en' ? lyrics || null : null,
      lyrics_oromo: null,
      transliteration: text(row.transliterationLyrics) || null,
      youtube_url: youtube,
      audio_url: text(row.audioUrl) || null,
      thumbnail_url: text(row.thumbnail) || null,
      singer_name: singerName || null,
      category_slug: category.slug,
      tags: itemTags,
      status: 'published',
      featured: false,
    })
  }

  return {
    files: {
      found: [
        'amharic-chants.json',
        'english-mezmur-chants.json',
        'werb.json',
        'categories.json',
        'classified/amharic-chants.classified.json',
        'classified/english-mezmur-chants.classified.json',
        'classified/werb.classified.json',
      ],
      used: filesUsed,
      ignored: filesIgnored,
    },
    totals: {
      sourceMerged: merged.length,
      planned: items.length,
      limitedTo: limit || null,
      missingTitle,
      missingSlug: 0,
      missingYoutube,
      missingYoutubeSlugs,
      missingSinger,
      missingCategory: items.filter((item) => !item.category_slug).length,
      mezmurForm: items.filter((item) => item.form === 'mezmur').length,
      werbForm: items.filter((item) => item.form === 'werb').length,
    },
    categories: [...categories.values()],
    singers: [...singers.values()],
    tags: [...tags.values()],
    items,
    issues,
    fieldMappings: {
      slug: 'id | slug | transliterationTitle | title',
      title: 'en:title | am:transliterationTitle||title',
      title_amharic: 'am:title only',
      description: 'meaning',
      lyrics_amharic: 'lyrics when pack language=am',
      lyrics_english: 'lyrics when pack language=en',
      transliteration: 'transliterationLyrics',
      youtube_url: 'youtubeUrl (normalized; empty → null)',
      audio_url: 'audioUrl',
      thumbnail_url: 'thumbnail',
      singer_id: 'singer|artist|choir → public.singers',
      category_id: 'classification.primaryCategorySlug || category.primary',
      tags: 'category.themes/saints/usage/season/majorHoliday + form/language',
      status: "'published' (live website content)",
    },
  }
}
