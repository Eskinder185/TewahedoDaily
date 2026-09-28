import { readFile } from 'node:fs/promises'
import { createHash } from 'node:crypto'
export const slugify = (value, fallback = 'mezmur') =>
  String(value || '')
    .normalize('NFKD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/&/g, ' and ')
    .replace(/['’]/g, '')
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '') || fallback
const list = (value) => (Array.isArray(value) ? value : value.entries)
const string = (value) => (typeof value === 'string' ? value.trim() : '')
const label = (value) =>
  value.replace(/-/g, ' ').replace(/\b\w/g, (c) => c.toUpperCase())
function video(value) {
  if (!value) return ''
  const url = new URL(value)
  if (
    url.protocol !== 'https:' ||
    url.username ||
    url.password ||
    !['youtube.com', 'www.youtube.com', 'm.youtube.com', 'youtu.be'].includes(
      url.hostname,
    )
  )
    throw Error('Invalid YouTube host')
  const id =
    url.hostname === 'youtu.be'
      ? url.pathname.slice(1)
      : url.searchParams.get('v') ||
        url.pathname.match(/^\/(?:shorts|embed)\/([^/]+)$/)?.[1]
  if (!/^[\w-]{11}$/.test(id || '')) throw Error('Invalid YouTube video')
  return `https://www.youtube.com/watch?v=${id}`
}
const known = new Set([
  'id',
  'type',
  'form',
  'slug',
  'title',
  'transliterationTitle',
  'lyrics',
  'transliterationLyrics',
  'meaning',
  'youtubeUrl',
  'audioUrl',
  'thumbnail',
  'category',
  'classification',
  'language',
  'singer',
  'artist',
  'choir',
])
export async function buildPlan(root) {
  const read = async (path) =>
    JSON.parse(await readFile(new URL(path, root), 'utf8'))
  const categories = await read('categories.json')
  const byCategory = new Map(categories.map((c) => [c.slug, c]))
  const records = new Map()
  const issues = []
  let sourceRows = 0
  const log = (key, code, detail) => issues.push({ key, code, detail })
  for (const [file, language] of [
    ['amharic-chants', 'am'],
    ['english-mezmur-chants', 'en'],
  ]) {
    const base = list(await read(file + '.json'))
    const classifications = new Map(
      list(await read('classified/' + file + '.classified.json')).map((row) => [
        row.id,
        row,
      ]),
    )
    for (const row of base) {
      sourceRows++
      const key = 'mezmur:' + row.id
      if (row.form !== 'mezmur' && row.type !== 'mezmur') {
        log(
          key,
          row.form === 'werb' ? 'excluded_werb' : 'invalid_form',
          row.form,
        )
        continue
      }
      if (!string(row.id) || !string(row.title)) {
        log(key, 'invalid_identity', 'Missing id/title')
        continue
      }
      if (records.has(key))
        log(
          key,
          'duplicate_source_id',
          'Last base row wins, matching the existing public library.',
        )
      const classified = classifications.get(row.id)
      if (
        classified &&
        ['title', 'lyrics', 'youtubeUrl'].some(
          (field) => classified[field] !== row[field],
        )
      )
        log(
          key,
          'classification_content_differs',
          'Base content kept; only classification metadata applied.',
        )
      records.set(key, {
        ...row,
        classification: classified?.classification,
        source: file,
        defaultLanguage: language,
      })
    }
  }
  const usedSlugs = new Set()
  const usedVideos = new Map()
  const titles = new Map()
  const items = []
  for (const [key, row] of records) {
    const preferred =
      row.id === 'dink-adirgolignyal'
        ? 'dink-adirgolignal'
        : row.slug || row.transliterationTitle || row.title || row.id
    const base = slugify(preferred, slugify(row.id))
    let slug = base
    if (usedSlugs.has(slug)) slug = `${base}-${slugify(row.id)}`
    usedSlugs.add(slug)
    const language = row.defaultLanguage
    let youtube = ''
    try {
      youtube = video(string(row.youtubeUrl))
    } catch {
      log(key, 'invalid_youtube', row.youtubeUrl)
    }
    if (!youtube)
      log(
        key,
        'missing_video',
        'Lyrics remain available; no YouTube link imported.',
      )
    if (!string(row.lyrics) && !youtube) {
      log(key, 'invalid_content', 'Neither lyrics nor a valid video; skipped.')
      continue
    }
    if (youtube && usedVideos.has(youtube)) {
      log(key, 'duplicate_video', {
        kept: usedVideos.get(youtube),
        slug,
        action: 'Skipped; review before merging distinct recordings/hymns.',
      })
      continue
    }
    const title =
      language === 'am'
        ? string(row.transliterationTitle) || string(row.title)
        : string(row.title)
    const titleKey =
      title.toLocaleLowerCase() + '|' + (language === 'am' ? row.title : '')
    if (titles.has(titleKey)) {
      log(key, 'duplicate_title', { kept: titles.get(titleKey), slug })
      continue
    }
    if (youtube) usedVideos.set(youtube, key)
    titles.set(titleKey, key)
    const categorySlug =
      row.classification?.primaryCategorySlug ||
      row.category?.primary ||
      'other'
    const cat = byCategory.get(categorySlug)
    if (!cat) log(key, 'unmapped_category', categorySlug)
    if (cat?.nameAm?.includes('?'))
      log(key, 'invalid_category_translation', categorySlug)
    if (row.classification?.needsReview)
      log(key, 'classification_needs_review', row.classification.reason)
    const tags = new Map()
    const add = (name, kind = 'topic') => {
      if (typeof name !== 'string' || !name.trim()) return
      const tagSlug =
        (kind === 'occasion' ? 'occasion-' : '') +
        slugify(
          name,
          createHash('sha256').update(name).digest('hex').slice(0, 12),
        )
      tags.set(tagSlug, { name: label(name), slug: tagSlug, kind })
    }
    for (const name of [
      ...(row.category?.majorHoliday || []),
      ...(row.category?.usage || []),
      ...(row.category?.season || []),
    ])
      add(name, 'occasion')
    for (const name of [
      ...(row.category?.themes || []),
      ...(row.category?.saints || []),
      ...(row.classification?.secondaryCategorySlugs || []),
    ])
      add(name)
    const unmapped = Object.fromEntries(
      Object.entries(row).filter(
        ([field]) =>
          !known.has(field) && !['source', 'defaultLanguage'].includes(field),
      ),
    )
    if (Object.keys(unmapped).length) log(key, 'unmapped_fields', unmapped)
    const singer = string(row.singer) || string(row.artist) || string(row.choir)
    if (!singer)
      log(
        key,
        'missing_singer',
        'No singer/choir attribution in source; left unassigned.',
      )
    const media = (field) => {
      const value = string(row[field])
      if (!value) return null
      try {
        if (new URL(value).protocol === 'https:') return value
      } catch {
        /* logged below */
      }
      log(key, 'invalid_media', { field, value })
      return null
    }
    items.push({
      legacy_key: key,
      legacy_aliases: [row.id, slug],
      slug,
      title,
      title_amharic: language === 'am' ? row.title : null,
      description: string(row.meaning) || null,
      lyrics_amharic: language === 'am' ? string(row.lyrics) : null,
      lyrics_english: language === 'en' ? string(row.lyrics) : null,
      lyrics_oromo: null,
      transliteration: string(row.transliterationLyrics) || null,
      youtube_url: youtube || null,
      audio_url: media('audioUrl'),
      thumbnail_url:
        media('thumbnail') ||
        (youtube
          ? `https://img.youtube.com/vi/${new URL(youtube).searchParams.get('v')}/hqdefault.jpg`
          : null),
      language_codes: [
        language,
        ...(String(row.language).includes('geez') ? ['gez'] : []),
      ],
      singer_name: singer || null,
      category: {
        slug: categorySlug,
        name: cat?.nameEn || label(categorySlug),
        name_amharic:
          cat?.nameAm && !cat.nameAm.includes('?') ? cat.nameAm : null,
      },
      tags: [...tags.values()],
      legacy_metadata: {
        source: row.source,
        language: row.language || language,
        category: row.category,
        classification: row.classification,
        unmapped,
      },
    })
  }
  return { items, issues, sourceRows, uniqueSourceRows: records.size }
}
