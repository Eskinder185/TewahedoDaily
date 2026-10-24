import { CANONICAL_CATEGORIES, CANONICAL_OCCASIONS } from '../publicContent/taxonomy'
import { db, emptyMezmur, errorMessage, getTaxonomy, saveMezmur, slugify, type MezmurInput } from './mezmurService'
import { setMezmurSectionLinks, type HymnSectionRow } from './hymnBrowseAdminService'
import { setMezmurOccasionLink } from './hymnTaxonomyImport'

export type Taxonomy = Awaited<ReturnType<typeof getTaxonomy>>

export const MANDATORY_CSV_COLUMNS = [
  'id',
  'amharic_title',
  'transliteration_title',
  'slug',
  'description',
  'amharic_lyrics',
  'transliteration_lyrics',
  'english_lyrics',
  'lyrics_status',
  'youtube_url',
  'thumbnail_url',
  'image_alt_text',
  'audio_url',
  'language',
  'form',
  'category',
  'primary_occasion',
  'zemari',
  'hymn_sections',
  'additional_occasions',
  'source_url',
  'classification_confidence',
  'review_required',
  'status',
  'featured',
] as const

export const EOTCMEDIA_AUDIT_CSV_COLUMNS = [
  'source_id',
  'title_am',
  'title_en',
  'transliteration',
  'zemari_name',
  'zemari_verified',
  'youtube_url',
  'youtube_video_id',
  'source_url',
  'lyrics_source_url',
  'has_lyrics',
  'lyrics_am',
  'language',
  'form',
  'theological_category',
  'primary_occasion',
  'additional_occasions',
  'hymn_sections',
  'album',
  'channel_name',
  'classification_confidence',
  'review_status',
  'review_notes',
  'copyright_status',
  'discovered_at',
] as const

export type MandatoryCsvColumn = (typeof MANDATORY_CSV_COLUMNS)[number]

export type LyricsStatus = 'available' | 'missing' | 'rights_review_required'

export type StagedMezmurCsvRow = {
  rowNumber: number
  stagingId: string
  id: string
  amharic_title: string
  transliteration_title: string
  slug: string
  description: string
  amharic_lyrics: string
  transliteration_lyrics: string
  english_lyrics: string
  lyrics_status: LyricsStatus
  youtube_url: string
  thumbnail_url: string
  image_alt_text: string
  audio_url: string
  language: string
  form: 'mezmur' | 'werb'
  category: string
  primary_occasion: string
  zemari: string
  matched_zemari_id: string | null
  hymn_sections: string[]
  additional_occasions: string[]
  source_url: string
  classification_confidence: number
  review_required: boolean
  status: 'draft'
  featured: false
  selectedForImport: boolean
  duplicateOfStagingId: string | null
  duplicateReason: string | null
  validationErrors: string[]
  validationWarnings: string[]
  importReady: boolean
}

export type CsvImportSummary = {
  totalRows: number
  importReadyCount: number
  selectedCount: number
  duplicateCount: number
  missingLyricsCount: number
  rightsReviewLyricsCount: number
  availableLyricsCount: number
  reviewRequiredCount: number
  matchedZemariCount: number
  unmatchedZemariCount: number
}

const VALID_LANGUAGES = new Set(['amharic', 'geez', 'english', 'oromo', 'tigrinya', 'bilingual'])
const CANONICAL_CATEGORY_SET = new Set<string>(CANONICAL_CATEGORIES)
const CANONICAL_OCCASION_SET = new Set<string>(CANONICAL_OCCASIONS)

/**
 * RFC 4180 compliant CSV parser that strips UTF-8 BOM (\uFEFF) and supports multiline quoted cells.
 */
export function parseCsvText(csvText: string): { headers: string[]; rows: Record<string, string>[] } {
  const cleaned = csvText.replace(/^\uFEFF/, '')
  const records: string[][] = []
  let currentRow: string[] = []
  let currentCell = ''
  let inQuotes = false

  for (let i = 0; i < cleaned.length; i += 1) {
    const ch = cleaned[i]
    const next = cleaned[i + 1]

    if (inQuotes) {
      if (ch === '"' && next === '"') {
        currentCell += '"'
        i += 1
      } else if (ch === '"') {
        inQuotes = false
      } else {
        currentCell += ch
      }
    } else if (ch === '"') {
      inQuotes = true
    } else if (ch === ',') {
      currentRow.push(currentCell)
      currentCell = ''
    } else if (ch === '\r' && next === '\n') {
      currentRow.push(currentCell)
      records.push(currentRow)
      currentRow = []
      currentCell = ''
      i += 1
    } else if (ch === '\n' || ch === '\r') {
      currentRow.push(currentCell)
      records.push(currentRow)
      currentRow = []
      currentCell = ''
    } else {
      currentCell += ch
    }
  }

  if (currentCell.length > 0 || currentRow.length > 0) {
    currentRow.push(currentCell)
    records.push(currentRow)
  }

  const nonEmptyRecords = records.filter((r) => r.some((cell) => cell.trim() !== ''))
  if (nonEmptyRecords.length === 0) {
    return { headers: [], rows: [] }
  }

  const headers = nonEmptyRecords[0].map((h) => h.trim())
  const rows: Record<string, string>[] = []

  for (let rIdx = 1; rIdx < nonEmptyRecords.length; rIdx += 1) {
    const rawRow = nonEmptyRecords[rIdx]
    const obj: Record<string, string> = {}
    for (let cIdx = 0; cIdx < headers.length; cIdx += 1) {
      const key = headers[cIdx]
      if (!key) continue
      obj[key] = rawRow[cIdx] ?? ''
    }
    rows.push(obj)
  }

  return { headers, rows }
}

function escapeCsvCell(value: string): string {
  if (/[",\r\n]/.test(value)) {
    return `"${value.replace(/"/g, '""')}"`
  }
  return value
}

/**
 * Serializes staged rows back to UTF-8 with BOM CSV format matching mezmurs_2000.csv.
 */
export function serializeStagedRowsToCsv(rows: StagedMezmurCsvRow[]): string {
  const headerLine = MANDATORY_CSV_COLUMNS.join(',')
  const lines = [headerLine]

  for (const row of rows) {
    const values: Record<MandatoryCsvColumn, string> = {
      id: row.id || '',
      amharic_title: row.amharic_title,
      transliteration_title: row.transliteration_title,
      slug: row.slug,
      description: row.description,
      amharic_lyrics: row.amharic_lyrics,
      transliteration_lyrics: row.transliteration_lyrics,
      english_lyrics: row.english_lyrics,
      lyrics_status: row.lyrics_status,
      youtube_url: row.youtube_url,
      thumbnail_url: row.thumbnail_url,
      image_alt_text: row.image_alt_text,
      audio_url: row.audio_url,
      language: row.language,
      form: row.form,
      category: row.category,
      primary_occasion: row.primary_occasion,
      zemari: row.zemari,
      hymn_sections: row.hymn_sections.join('|'),
      additional_occasions: row.additional_occasions.join('|'),
      source_url: row.source_url,
      classification_confidence: row.classification_confidence.toFixed(2),
      review_required: row.review_required ? 'true' : 'false',
      status: 'draft',
      featured: 'false',
    }
    lines.push(MANDATORY_CSV_COLUMNS.map((col) => escapeCsvCell(values[col])).join(','))
  }

  return `\uFEFF${lines.join('\r\n')}\r\n`
}

export function extractYoutubeVideoId(url: string): string | null {
  if (!url) return null
  const trimmed = url.trim()
  const match = trimmed.match(/(?:v=|youtu\.be\/|embed\/|shorts\/)([A-Za-z0-9_-]{11})/)
  return match ? match[1] : null
}

function normalizeAmharicTitleKey(title: string): string {
  return title
    .normalize('NFC')
    .replace(/[\s\u1361-\u1368\-_|/()[\]"'«»]+/g, '')
    .toLowerCase()
}

export function matchZemariProfileId(
  zemariName: string,
  singers: Taxonomy['singers'],
): string | null {
  const cleaned = zemariName.trim()
  if (!cleaned) return null
  const norm = cleaned.toLowerCase()

  for (const singer of singers) {
    if (singer.name.trim().toLowerCase() === norm) return singer.id
    if (singer.name_amharic && singer.name_amharic.trim() === cleaned) return singer.id
    if (singer.slug && singer.slug.trim().toLowerCase() === slugify(cleaned)) return singer.id
  }

  // Also check stripped honorifics (ዘማሪ / ዘማሪት / ዲያቆን / ሊቀ መዘምራን)
  const stripped = cleaned
    .replace(/^(ሊቀ\s*መዘምራን|ዘማሪት|ዘማሪ|ዲያቆን|ቀሲስ|አባ|መምህር)\s+/u, '')
    .trim()
  if (stripped && stripped !== cleaned) {
    for (const singer of singers) {
      if (singer.name_amharic && singer.name_amharic.trim().includes(stripped)) return singer.id
      if (singer.name.trim().toLowerCase() === stripped.toLowerCase()) return singer.id
    }
  }
  return null
}

export function validateAndRefreshStagedRows(
  rows: StagedMezmurCsvRow[],
  singers: Taxonomy['singers'] = [],
  knownSectionSlugs?: Set<string>,
): StagedMezmurCsvRow[] {
  const seenSlugs = new Map<string, string>()
  const seenVideos = new Map<string, string>()
  const seenSources = new Map<string, string>()
  const seenTitleZemari = new Map<string, string>()

  return rows.map((row) => {
    const errors: string[] = []
    const warnings: string[] = []

    const amharicTitle = row.amharic_title.trim()
    const translitTitle = row.transliteration_title.trim()
    const slug = row.slug.trim()

    if (!amharicTitle && !translitTitle) {
      errors.push('Missing both Amharic and transliteration titles.')
    }
    if (!translitTitle) {
      errors.push('Transliteration title is required for draft import.')
    }
    if (!slug || !/^[a-z0-9]+(-[a-z0-9]+)*$/.test(slug)) {
      errors.push('Slug must contain lowercase English letters, numbers, and single hyphens.')
    }
    if (!CANONICAL_CATEGORY_SET.has(row.category)) {
      errors.push(`Category "${row.category || '(empty)'}" is not in CANONICAL_CATEGORIES.`)
    }
    if (row.primary_occasion && !CANONICAL_OCCASION_SET.has(row.primary_occasion)) {
      errors.push(`Primary occasion "${row.primary_occasion}" is not in CANONICAL_OCCASIONS.`)
    }
    for (const occ of row.additional_occasions) {
      if (occ && !CANONICAL_OCCASION_SET.has(occ)) {
        errors.push(`Additional occasion "${occ}" is not in CANONICAL_OCCASIONS.`)
      }
    }
    if (!VALID_LANGUAGES.has(row.language)) {
      errors.push(`Invalid language "${row.language}".`)
    }
    if (row.form !== 'mezmur' && row.form !== 'werb') {
      errors.push(`Invalid form "${row.form}". Expected "mezmur" or "werb".`)
    }
    if (knownSectionSlugs && knownSectionSlugs.size > 0) {
      for (const sec of row.hymn_sections) {
        if (!knownSectionSlugs.has(sec)) {
          warnings.push(`Hymn section "${sec}" not found in database sections.`)
        }
      }
    }

    if (!row.amharic_lyrics.trim()) {
      warnings.push(
        row.lyrics_status === 'rights_review_required'
          ? 'Source lyrics require rights review before reproduction; staging as metadata-only draft.'
          : 'Missing Amharic lyrics; staging as draft only (cannot publish until lyrics are added).',
      )
    }
    if (!row.zemari.trim()) {
      warnings.push('Zemari is unidentified or choir performance (በህብረት).')
    }

    // Duplicate detection across batch
    let duplicateOfStagingId: string | null = null
    let duplicateReason: string | null = null

    const videoId = extractYoutubeVideoId(row.youtube_url)
    const sourceKey = row.source_url.trim().toLowerCase().replace(/\/+$/, '')
    const titleKey = normalizeAmharicTitleKey(amharicTitle || translitTitle)
    const zemariKey = row.zemari.trim().toLowerCase()

    if (sourceKey && seenSources.has(sourceKey)) {
      duplicateOfStagingId = seenSources.get(sourceKey) || null
      duplicateReason = 'exact_source_url'
    } else if (videoId && seenVideos.has(videoId)) {
      duplicateOfStagingId = seenVideos.get(videoId) || null
      duplicateReason = `youtube_video_id (${videoId})`
    } else if (slug && seenSlugs.has(slug)) {
      duplicateOfStagingId = seenSlugs.get(slug) || null
      duplicateReason = `duplicate_slug (${slug})`
    } else if (titleKey && seenTitleZemari.has(`${titleKey}::${zemariKey}`)) {
      duplicateOfStagingId = seenTitleZemari.get(`${titleKey}::${zemariKey}`) || null
      duplicateReason = 'same_normalized_title_and_zemari'
    } else {
      if (sourceKey) seenSources.set(sourceKey, row.stagingId)
      if (videoId) seenVideos.set(videoId, row.stagingId)
      if (slug) seenSlugs.set(slug, row.stagingId)
      if (titleKey) seenTitleZemari.set(`${titleKey}::${zemariKey}`, row.stagingId)
    }

    if (duplicateOfStagingId) {
      warnings.push(`Duplicate of ${duplicateOfStagingId} (${duplicateReason}).`)
    }

    const matchedZemariId =
      row.matched_zemari_id !== undefined &&
      singers.some((s) => s.id === row.matched_zemari_id)
        ? row.matched_zemari_id
        : matchZemariProfileId(row.zemari, singers)

    const importReady = errors.length === 0 && !duplicateOfStagingId

    return {
      ...row,
      status: 'draft',
      featured: false,
      matched_zemari_id: matchedZemariId,
      duplicateOfStagingId,
      duplicateReason,
      validationErrors: errors,
      validationWarnings: warnings,
      importReady,
    }
  })
}

export function buildStagedRowsFromCsvText(
  csvText: string,
  singers: Taxonomy['singers'] = [],
  knownSectionSlugs?: Set<string>,
): StagedMezmurCsvRow[] {
  const { rows } = parseCsvText(csvText)
  const allocatedSlugs = new Set<string>()

  const initialRows: StagedMezmurCsvRow[] = rows.map((raw, index) => {
    const amharic_title = (raw.amharic_title ?? raw.title_am ?? '').trim()
    const transliteration_title = (
      raw.transliteration_title ??
      raw.transliteration ??
      raw.title_en ??
      ''
    ).trim()

    let slug = (raw.slug ?? '').trim()
    if (!slug) {
      const baseSlug = slugify(transliteration_title || amharic_title || `mezmur-${index + 1}`)
      const srcSuffix = slugify(raw.source_id ?? raw.youtube_video_id ?? '')
      slug = baseSlug
      if (allocatedSlugs.has(slug) && srcSuffix) {
        slug = `${baseSlug}-${srcSuffix}`
      }
      let counter = 2
      while (allocatedSlugs.has(slug)) {
        slug = `${baseSlug}-${counter}`
        counter += 1
      }
    }
    allocatedSlugs.add(slug)

    const amharic_lyrics = raw.amharic_lyrics ?? raw.lyrics_am ?? raw.full_lyrics ?? ''
    const rawLyricsStatus = (raw.lyrics_status ?? '').trim() as LyricsStatus
    const hasLyricsFlag = String(raw.has_lyrics ?? '').trim().toLowerCase() === 'true'
    const lyrics_status: LyricsStatus =
      rawLyricsStatus === 'available' || rawLyricsStatus === 'rights_review_required' || rawLyricsStatus === 'missing'
        ? rawLyricsStatus
        : amharic_lyrics.trim()
          ? 'available'
          : hasLyricsFlag
            ? 'rights_review_required'
            : 'missing'

    const formRaw = (raw.form ?? 'mezmur').trim().toLowerCase()
    const form: 'mezmur' | 'werb' = formRaw === 'werb' || formRaw === 'wereb' ? 'werb' : 'mezmur'
    const confidenceNum = Number.parseFloat(raw.classification_confidence ?? '0.75')
    const classification_confidence = Number.isFinite(confidenceNum) ? confidenceNum : 0.75

    const reviewStatusRaw = String(raw.review_status ?? '').trim().toLowerCase()
    const review_required =
      String(raw.review_required ?? '').trim().toLowerCase() === 'true' ||
      reviewStatusRaw === 'needs_review' ||
      reviewStatusRaw === 'review_required'

    const hymn_sections = (raw.hymn_sections ?? '')
      .split(/[|;,]/)
      .map((s) => s.trim())
      .filter(Boolean)

    const additional_occasions = (raw.additional_occasions ?? '')
      .split(/[|;,]/)
      .map((s) => s.trim())
      .filter(Boolean)

    const youtube_url = (raw.youtube_url ?? '').trim()
    const videoId = (raw.youtube_video_id ?? '').trim() || extractYoutubeVideoId(youtube_url) || ''
    const thumbnail_url =
      (raw.thumbnail_url ?? '').trim() ||
      (videoId.length === 11 ? `https://i.ytimg.com/vi/${videoId}/hqdefault.jpg` : '')

    return {
      rowNumber: index + 1,
      stagingId: `row-${index + 1}`,
      id: (raw.id ?? '').trim(),
      amharic_title,
      transliteration_title,
      slug,
      description: (raw.description ?? raw.review_notes ?? '').trim(),
      amharic_lyrics,
      transliteration_lyrics: raw.transliteration_lyrics ?? '',
      english_lyrics: raw.english_lyrics ?? '',
      lyrics_status,
      youtube_url,
      thumbnail_url,
      image_alt_text: (raw.image_alt_text ?? amharic_title ?? transliteration_title ?? '').trim(),
      audio_url: (raw.audio_url ?? '').trim(),
      language: (raw.language ?? 'amharic').trim().toLowerCase() || 'amharic',
      form,
      category: (raw.category ?? raw.theological_category ?? 'General').trim() || 'General',
      primary_occasion: (raw.primary_occasion ?? 'General / Anytime').trim() || 'General / Anytime',
      zemari: (raw.zemari ?? raw.zemari_name ?? '').trim(),
      matched_zemari_id: undefined as unknown as string | null,
      hymn_sections,
      additional_occasions,
      source_url: (raw.source_url ?? '').trim(),
      classification_confidence,
      review_required,
      status: 'draft',
      featured: false,
      selectedForImport: false,
      duplicateOfStagingId: null,
      duplicateReason: null,
      validationErrors: [],
      validationWarnings: [],
      importReady: true,
    }
  })

  return validateAndRefreshStagedRows(initialRows, singers, knownSectionSlugs)
}

export function summarizeStagedRows(rows: StagedMezmurCsvRow[]): CsvImportSummary {
  let importReadyCount = 0
  let selectedCount = 0
  let duplicateCount = 0
  let missingLyricsCount = 0
  let rightsReviewLyricsCount = 0
  let availableLyricsCount = 0
  let reviewRequiredCount = 0
  let matchedZemariCount = 0
  let unmatchedZemariCount = 0

  for (const row of rows) {
    if (row.importReady) importReadyCount += 1
    if (row.selectedForImport) selectedCount += 1
    if (row.duplicateOfStagingId) duplicateCount += 1
    if (row.lyrics_status === 'missing') missingLyricsCount += 1
    else if (row.lyrics_status === 'rights_review_required') rightsReviewLyricsCount += 1
    else if (row.lyrics_status === 'available') availableLyricsCount += 1
    if (row.review_required) reviewRequiredCount += 1
    if (row.matched_zemari_id) matchedZemariCount += 1
    else if (row.zemari) unmatchedZemariCount += 1
  }

  return {
    totalRows: rows.length,
    importReadyCount,
    selectedCount,
    duplicateCount,
    missingLyricsCount,
    rightsReviewLyricsCount,
    availableLyricsCount,
    reviewRequiredCount,
    matchedZemariCount,
    unmatchedZemariCount,
  }
}

export async function importSelectedStagedRowsAsDrafts(
  rowsToImport: StagedMezmurCsvRow[],
  options: {
    taxonomy: Taxonomy
    sections: HymnSectionRow[]
    onProgress?: (completed: number, total: number, currentSlug: string) => void
  },
): Promise<{ importedSlugs: string[]; failed: { slug: string; error: string }[] }> {
  const { requireCmsStaffSession } = await import('./cmsStaffAuth')
  await requireCmsStaffSession('bulk CSV draft import')

  const sectionSlugToId = new Map<string, string>()
  for (const sec of options.sections) {
    sectionSlugToId.set(sec.slug.trim().toLowerCase(), sec.id)
  }

  const categoryNameToId = new Map<string, string>()
  for (const cat of options.taxonomy.categories) {
    categoryNameToId.set(cat.name.trim().toLowerCase(), cat.id)
  }

  const importedSlugs: string[] = []
  const failed: { slug: string; error: string }[] = []

  for (let i = 0; i < rowsToImport.length; i += 1) {
    const row = rowsToImport[i]
    options.onProgress?.(i, rowsToImport.length, row.slug)

    if (!row.importReady) {
      failed.push({
        slug: row.slug || row.stagingId,
        error: row.validationErrors.join(' ') || 'Row is not import-ready.',
      })
      continue
    }

    try {
      const categoryId = categoryNameToId.get(row.category.trim().toLowerCase()) || null
      const base = emptyMezmur()
      const payload: MezmurInput = {
        ...base,
        title: row.transliteration_title.trim(),
        title_amharic: row.amharic_title.trim() || null,
        slug: row.slug.trim(),
        description: row.description.trim() || null,
        lyrics_amharic: row.amharic_lyrics.trim() || null,
        transliteration: row.transliteration_lyrics.trim() || null,
        lyrics_english: row.english_lyrics.trim() || null,
        youtube_url: row.youtube_url.trim() || null,
        thumbnail_url: row.thumbnail_url.trim() || null,
        image_alt: row.image_alt_text.trim() || null,
        audio_url: row.audio_url.trim() || null,
        language: row.language || 'amharic',
        form: row.form === 'werb' ? 'werb' : 'mezmur',
        category_id: categoryId,
        category: row.category.trim() || null,
        occasion: row.primary_occasion.trim() || null,
        singer_id: row.matched_zemari_id || null,
        zemari_id: row.matched_zemari_id || null,
        status: 'draft',
        featured: false,
      }

      const saved = await saveMezmur(payload, [])

      // Link hymn sections if matched in database
      const matchedSectionIds = row.hymn_sections
        .map((slug) => sectionSlugToId.get(slug.trim().toLowerCase()))
        .filter((id): id is string => Boolean(id))

      if (matchedSectionIds.length > 0) {
        try {
          await setMezmurSectionLinks(saved.id, matchedSectionIds)
        } catch {
          // non-fatal if section link table is unavailable
        }
      }

      // Link category via mezmur_category_links_import
      if (saved.slug && row.category.trim()) {
        const catSlug = slugify(row.category)
        if (catSlug) {
          try {
            await db()
              .from('mezmur_category_links_import' as never)
              .delete()
              .eq('mezmur_slug', saved.slug)
            await db()
              .from('mezmur_category_links_import' as never)
              .insert({ mezmur_slug: saved.slug, category_slug: catSlug } as never)
          } catch {
            // non-fatal
          }
        }
      }

      // Link primary and additional occasions via mezmur_occasion_links_import
      const allOccasions = [row.primary_occasion, ...row.additional_occasions]
        .map((o) => slugify(o))
        .filter(Boolean)
      const uniqueOccasions = [...new Set(allOccasions)]

      if (saved.slug && uniqueOccasions.length > 0) {
        try {
          await setMezmurOccasionLink(saved.slug, uniqueOccasions[0])
          if (uniqueOccasions.length > 1) {
            for (let occIdx = 1; occIdx < uniqueOccasions.length; occIdx += 1) {
              await db()
                .from('mezmur_occasion_links_import' as never)
                .insert({ mezmur_slug: saved.slug, occasion_slug: uniqueOccasions[occIdx] } as never)
            }
          }
        } catch {
          // non-fatal
        }
      }

      importedSlugs.push(saved.slug)
    } catch (err) {
      failed.push({
        slug: row.slug || row.stagingId,
        error: errorMessage(err),
      })
    }
  }

  options.onProgress?.(rowsToImport.length, rowsToImport.length, '')
  return { importedSlugs, failed }
}

export const SAMPLE_MEZMUR_CSV_TEXT = `\uFEFFid,amharic_title,transliteration_title,slug,description,amharic_lyrics,transliteration_lyrics,english_lyrics,lyrics_status,youtube_url,thumbnail_url,image_alt_text,audio_url,language,form,category,primary_occasion,zemari,hymn_sections,additional_occasions,source_url,classification_confidence,review_required,status,featured
,ኑ በእግዚአብሔር ደስ ይበለን,Nu Beegziabher Des Yibelen,nu-beegziabher-des-yibelen-b1e9ef,Ethiopian Orthodox Tewahedo Mezmur — ኑ በእግዚአብሔር ደስ ይበለን,,, ,rights_review_required,https://www.youtube.com/watch?v=b1e9efrGW4c,https://img.youtube.com/vi/b1e9efrGW4c/hqdefault.jpg,ኑ በእግዚአብሔር ደስ ይበለን,,amharic,mezmur,Virgin Mary,Annual Saint Feast,,saints-and-feasts;virgin-mary,,https://eotcmedia.com/hymns/nu-beegziabher-des-yibelen-b1e9ef,0.88,true,draft,false
,ገብርኤል ኃያል,Gebriel Hayal,gebriel-hayal-x59dtx,Ethiopian Orthodox Tewahedo Mezmur — ገብርኤል ኃያል by ዘማሪ ዲያቆን ዳዊት ፋንታዬ,,, ,rights_review_required,https://www.youtube.com/watch?v=X59dtx720C8,https://img.youtube.com/vi/X59dtx720C8/hqdefault.jpg,ገብርኤል ኃያል — ዘማሪ ዲያቆን ዳዊት ፋንታዬ,,amharic,mezmur,Kidus Gabriel,Annual Saint Feast,ዘማሪ ዲያቆን ዳዊት ፋንታዬ,saints-and-feasts;angels-and-archangels,,https://eotcmedia.com/hymns/gebriel-hayal-x59dtx,0.92,false,draft,false
,በዕፀ መስቀል ተፈወስነ,Beetse Meskel Tefewesne,beetse-meskel-tefewesne-a12bc3,Ethiopian Orthodox Tewahedo Mezmur — በዕፀ መስቀል ተፈወስነ,,, ,missing,https://www.youtube.com/watch?v=a12bc345678,https://img.youtube.com/vi/a12bc345678/hqdefault.jpg,በዕፀ መስቀል ተፈወስነ,,amharic,mezmur,Cross,Meskel,ዘማሪ ቴዎድሮስ ዮሴፍ,major-feasts;christ-and-salvation,Siklet,https://eotcmedia.com/hymns/beetse-meskel-tefewesne-a12bc3,0.92,false,draft,false
`
