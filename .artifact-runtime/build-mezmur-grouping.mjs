import fs from 'node:fs/promises'
import path from 'node:path'
import { Workbook } from '@oai/artifact-tool'

const root = 'C:/Users/eskew/github/TewahedoDaily'
const sourcePath = 'C:/Users/eskew/Downloads/mezmur_classification_all_2092.csv'
const outputDir = path.join(root, 'reports', 'mezmur-grouping')

const categoryGroups = [
  ['Jesus Christ & Salvation', 'jesus-christ-salvation', ['Jesus Christ', 'Cross', 'Salvation']],
  ['Virgin Mary', 'category-virgin-mary', ['Virgin Mary']],
  ['Holy Trinity & Holy Spirit', 'holy-trinity-holy-spirit', ['Holy Trinity', 'Holy Spirit']],
  ['Angels & Saints', 'category-angels-saints', [
    'Kidus Michael', 'Kidus Gabriel', 'Kidus Raphael', 'Kidus Uriel', 'Kidus Giorgis',
    'Abune Tekle Haymanot', 'Abune Gebre Menfes Kidus', 'Kidus Yared',
    'Yohannes Metmek / John the Baptist', 'Kidus Estifanos / Saint Stephen',
    'Apostles', 'Martyrs', 'Saints', 'Angels', 'Prophets',
  ]],
  ['Prayer & Worship', 'prayer-worship', ['Prayer', 'Praise / Worship', 'General']],
  ['Repentance', 'repentance', ['Repentance']],
]

const occasionGroups = [
  ['Holidays & Feasts', 'occasion-holidays-feasts', [
    'Gena', 'Timket', 'Meskel', 'Hosanna', 'Siklet', 'Tinsae', 'Erget', 'Pentecost',
    'Debre Tabor', 'Filseta', 'Kidane Mihret', 'Lideta Maryam', 'New Year / Enkutatash',
    'Annual Saint Feast',
  ]],
  ['Fasting Seasons', 'fasting-seasons', [
    'Abiy Tsom', 'Tsome Nineveh', 'Tsome Nebiyat', 'Tsome Hawariat', 'Holy Week',
  ]],
  ['Church Life & Sacraments', 'church-life-sacraments', [
    'Wedding', 'Baptism', 'Funeral / Memorial', 'Communion',
  ]],
  ['Anytime Mezmurs', 'anytime-mezmurs', ['General / Anytime']],
]

const categorySlugs = new Map([
  ['Jesus Christ', 'jesus-christ'], ['Virgin Mary', 'virgin-mary'], ['Holy Trinity', 'holy-trinity'],
  ['Holy Spirit', 'holy-spirit'], ['Kidus Michael', 'kidus-michael'], ['Kidus Gabriel', 'kidus-gabriel'],
  ['Kidus Raphael', 'kidus-raphael'], ['Kidus Uriel', 'kidus-uriel'], ['Kidus Giorgis', 'kidus-giorgis'],
  ['Abune Tekle Haymanot', 'abune-tekle-haymanot'], ['Abune Gebre Menfes Kidus', 'abune-gebre-menfes-kidus'],
  ['Kidus Yared', 'kidus-yared'], ['Yohannes Metmek / John the Baptist', 'yohannes-metmek-john-the-baptist'],
  ['Kidus Estifanos / Saint Stephen', 'kidus-estifanos-saint-stephen'], ['Apostles', 'apostles'],
  ['Martyrs', 'martyrs'], ['Saints', 'saints'], ['Angels', 'angels'], ['Prophets', 'prophets'],
  ['Cross', 'cross'], ['Repentance', 'repentance'], ['Praise / Worship', 'praise-worship'],
  ['Prayer', 'prayer'], ['Salvation', 'salvation'], ['General', 'general'],
])

const occasionSlugs = new Map([
  ['Gena', 'gena'], ['Timket', 'timket'], ['Meskel', 'meskel'], ['Hosanna', 'hosanna'],
  ['Siklet', 'siklet'], ['Tinsae', 'tinsae'], ['Erget', 'erget'], ['Pentecost', 'pentecost'],
  ['Debre Tabor', 'debre-tabor'], ['Filseta', 'filseta'], ['Kidane Mihret', 'kidane-mihret'],
  ['Lideta Maryam', 'lideta-maryam'], ['Abiy Tsom', 'abiy-tsom'], ['Tsome Nineveh', 'tsome-nineveh'],
  ['Tsome Nebiyat', 'tsome-nebiyat'], ['Tsome Hawariat', 'tsome-hawariat'], ['Holy Week', 'holy-week'],
  ['New Year / Enkutatash', 'new-year'], ['Annual Saint Feast', 'annual-saint-feast'],
  ['Wedding', 'wedding'], ['Baptism', 'baptism'], ['Funeral / Memorial', 'funeral'],
  ['Communion', 'communion'], ['General / Anytime', 'general'],
])

function invertGroups(groups) {
  const result = new Map()
  groups.forEach(([card, cardSlug, entries], cardIndex) => {
    entries.forEach((entry, entryIndex) => result.set(entry, { card, cardSlug, cardOrder: cardIndex + 1, entryOrder: entryIndex + 1 }))
  })
  return result
}

const categoryGroupByName = invertGroups(categoryGroups)
const occasionGroupByName = invertGroups(occasionGroups)

function splitList(value) {
  return [...new Set(String(value ?? '').split(';').map((item) => item.trim()).filter(Boolean))]
}

function csvCell(value) {
  const text = String(value ?? '')
  return /[",\r\n]/.test(text) ? `"${text.replaceAll('"', '""')}"` : text
}

async function writeCsv(filename, columns, rows) {
  const body = [columns, ...rows.map((row) => columns.map((column) => row[column] ?? ''))]
    .map((row) => row.map(csvCell).join(','))
    .join('\n')
  await fs.writeFile(path.join(outputDir, filename), `${body}\n`, 'utf8')
}

function sortedUnique(values, order) {
  return [...new Set(values)].sort((a, b) => (order.get(a) ?? 999) - (order.get(b) ?? 999) || a.localeCompare(b))
}

const sourceText = await fs.readFile(sourcePath, 'utf8')
const workbook = await Workbook.fromCSV(sourceText, { sheetName: 'Source' })
const sourceSheet = workbook.worksheets.getItem('Source')
const matrix = sourceSheet.getUsedRange().values
const headers = matrix[0].map(String)
const sourceRows = matrix.slice(1).map((cells) => Object.fromEntries(headers.map((header, index) => [header, String(cells[index] ?? '')])))

if (sourceRows.length !== 2092) throw new Error(`Expected 2,092 records, found ${sourceRows.length}`)
if (new Set(sourceRows.map((row) => row.import_id)).size !== 2092) throw new Error('import_id values are missing or duplicated')

const categoryOrder = new Map([...categorySlugs.keys()].map((name, index) => [name, index]))
const occasionOrder = new Map([...occasionSlugs.keys()].map((name, index) => [name, index]))
const groupedRows = []
const categoryRelationships = []
const occasionRelationships = []
const unclassified = []

for (const row of sourceRows) {
  const categories = sortedUnique([row.category.trim(), ...splitList(row.additional_categories)].filter(Boolean), categoryOrder)
  const occasions = sortedUnique([row.primary_occasion.trim(), ...splitList(row.additional_occasions)].filter(Boolean), occasionOrder)
  const unsupportedCategories = categories.filter((name) => !categorySlugs.has(name) || !categoryGroupByName.has(name))
  const unsupportedOccasions = occasions.filter((name) => !occasionSlugs.has(name) || !occasionGroupByName.has(name))
  const categoryCards = sortedUnique(categories.flatMap((name) => categoryGroupByName.get(name)?.card ?? []), new Map(categoryGroups.map(([name], index) => [name, index])))
  const occasionCards = sortedUnique(occasions.flatMap((name) => occasionGroupByName.get(name)?.card ?? []), new Map(occasionGroups.map(([name], index) => [name, index])))

  groupedRows.push({
    ...row,
    primary_category: row.category,
    all_categories: categories.join('; '),
    main_category_cards: categoryCards.join('; '),
    occasions: occasions.join('; '),
    occasion_cards: occasionCards.join('; '),
    needs_review: row.review_required,
    publication_status: row.status,
  })

  categories.forEach((name) => {
    const group = categoryGroupByName.get(name)
    if (!group || !categorySlugs.has(name)) return
    categoryRelationships.push({
      mezmur_import_id: row.import_id,
      mezmur_id: row.mezmur_id,
      mezmur_slug: row.slug,
      category_name: name,
      category_slug: categorySlugs.get(name),
      is_primary: String(name === row.category.trim()),
      source_category: name === row.category.trim() ? 'lyrics-classifier-primary' : 'lyrics-classifier-secondary',
      confidence: row.classification_confidence.toLowerCase(),
      main_category_card: group.card,
      main_category_card_slug: group.cardSlug,
      classification_confidence: row.classification_confidence,
      publication_status: row.status,
    })
  })

  occasions.forEach((name) => {
    const group = occasionGroupByName.get(name)
    if (!group || !occasionSlugs.has(name)) return
    occasionRelationships.push({
      mezmur_import_id: row.import_id,
      mezmur_id: row.mezmur_id,
      mezmur_slug: row.slug,
      occasion_name: name,
      occasion_slug: occasionSlugs.get(name),
      is_primary: String(name === row.primary_occasion.trim()),
      source_occasion: name === row.primary_occasion.trim() ? 'lyrics-classifier-primary' : 'lyrics-classifier-secondary',
      occasion_card: group.card,
      occasion_card_slug: group.cardSlug,
      classification_confidence: row.classification_confidence,
      publication_status: row.status,
    })
  })

  const reviewReasons = []
  if (!row.import_id.trim()) reviewReasons.push('missing_import_id')
  if (!categories.length) reviewReasons.push('no_canonical_category')
  if (unsupportedCategories.length) reviewReasons.push(`unsupported_categories:${unsupportedCategories.join('|')}`)
  if (unsupportedOccasions.length) reviewReasons.push(`unsupported_occasions:${unsupportedOccasions.join('|')}`)
  if (reviewReasons.length) {
    unclassified.push({
      import_id: row.import_id,
      mezmur_id: row.mezmur_id,
      slug: row.slug,
      title: row.title,
      title_amharic: row.title_amharic,
      publication_status: row.status,
      classification_confidence: row.classification_confidence,
      review_required: row.review_required,
      categories: categories.join('; '),
      occasions: occasions.join('; '),
      review_reasons: reviewReasons.join('; '),
    })
  }
}

const mappingRows = []
categoryGroups.forEach(([card, cardSlug, entries], cardIndex) => entries.forEach((name, entryIndex) => mappingRows.push({
  taxonomy_type: 'category', canonical_name: name, canonical_slug: categorySlugs.get(name),
  main_card: card, main_card_slug: cardSlug, card_order: String(cardIndex + 1), subcategory_order: String(entryIndex + 1),
})))
occasionGroups.forEach(([card, cardSlug, entries], cardIndex) => entries.forEach((name, entryIndex) => mappingRows.push({
  taxonomy_type: 'occasion', canonical_name: name, canonical_slug: occasionSlugs.get(name),
  main_card: card, main_card_slug: cardSlug, card_order: String(cardIndex + 1), subcategory_order: String(entryIndex + 1),
})))

const summaryRows = []
function addSummary(dimension, groups, relationships, nameField, slugField, cardField, cardSlugField) {
  for (const [card, cardSlug, entries] of groups) {
    const cardRows = relationships.filter((row) => row[cardSlugField] === cardSlug)
    const cardIds = new Set(cardRows.map((row) => row.mezmur_import_id))
    const publishedCardIds = new Set(cardRows.filter((row) => row.publication_status.toLowerCase() === 'published').map((row) => row.mezmur_import_id))
    summaryRows.push({ dimension, main_card: card, main_card_slug: cardSlug, subcategory: '(all)', subcategory_slug: '', all_records: String(cardIds.size), published_records: String(publishedCardIds.size) })
    for (const name of entries) {
      const rows = relationships.filter((row) => row[nameField] === name)
      summaryRows.push({
        dimension, main_card: card, main_card_slug: cardSlug, subcategory: name,
        subcategory_slug: rows[0]?.[slugField] ?? '',
        all_records: String(new Set(rows.map((row) => row.mezmur_import_id)).size),
        published_records: String(new Set(rows.filter((row) => row.publication_status.toLowerCase() === 'published').map((row) => row.mezmur_import_id)).size),
      })
    }
  }
}
addSummary('category', categoryGroups, categoryRelationships, 'category_name', 'category_slug', 'main_category_card', 'main_category_card_slug')
addSummary('occasion', occasionGroups, occasionRelationships, 'occasion_name', 'occasion_slug', 'occasion_card', 'occasion_card_slug')

await fs.mkdir(outputDir, { recursive: true })
const derivedColumns = ['primary_category', 'all_categories', 'main_category_cards', 'occasions', 'occasion_cards', 'needs_review', 'publication_status']
await writeCsv('mezmur_classification_grouped_2092.csv', [...headers, ...derivedColumns], groupedRows)
await writeCsv('mezmur_category_relationships.csv', [
  'mezmur_import_id', 'mezmur_slug', 'category_slug', 'source_category', 'confidence',
], categoryRelationships)
await writeCsv('mezmur_occasion_relationships.csv', [
  'mezmur_import_id', 'mezmur_slug', 'occasion_slug', 'source_occasion',
], occasionRelationships)
await writeCsv('mezmur_browse_card_mapping.csv', [
  'taxonomy_type', 'canonical_name', 'canonical_slug', 'main_card', 'main_card_slug', 'card_order', 'subcategory_order',
], mappingRows)
await writeCsv('mezmur_grouping_summary.csv', [
  'dimension', 'main_card', 'main_card_slug', 'subcategory', 'subcategory_slug', 'all_records', 'published_records',
], summaryRows)
await writeCsv('mezmur_unclassified_review.csv', [
  'import_id', 'mezmur_id', 'slug', 'title', 'title_amharic', 'publication_status',
  'classification_confidence', 'review_required', 'categories', 'occasions', 'review_reasons',
], unclassified)

// Prove every original field survived unchanged in the full-data output model.
for (let index = 0; index < sourceRows.length; index += 1) {
  for (const header of headers) {
    if (sourceRows[index][header] !== groupedRows[index][header]) {
      throw new Error(`Source preservation failed at row ${index + 2}, column ${header}`)
    }
  }
}

const categoryCardCounts = summaryRows.filter((row) => row.dimension === 'category' && row.subcategory === '(all)')
const occasionCardCounts = summaryRows.filter((row) => row.dimension === 'occasion' && row.subcategory === '(all)')
const report = `# Mezmur grouping report

## Source verification

- Source rows: **${sourceRows.length.toLocaleString()}**
- Original columns preserved unchanged: **${headers.length}**
- Unique immutable import IDs: **${new Set(sourceRows.map((row) => row.import_id)).size.toLocaleString()}**
- Published rows: **${sourceRows.filter((row) => row.status.toLowerCase() === 'published').length.toLocaleString()}**
- Draft rows: **${sourceRows.filter((row) => row.status.toLowerCase() === 'draft').length.toLocaleString()}**
- Category relationships: **${categoryRelationships.length.toLocaleString()}**
- Occasion relationships: **${occasionRelationships.length.toLocaleString()}**
- Rows requiring classification review: **${unclassified.length.toLocaleString()}**
- Duplicate Mezmur rows created: **0**

The completed classifications were reorganized only. Lyrics, titles, singers, media, dates, identifiers, and publication states were not reclassified or rewritten.

## Category cards

| Main card | All records | Published records |
| --- | ---: | ---: |
${categoryCardCounts.map((row) => `| ${row.main_card} | ${row.all_records} | ${row.published_records} |`).join('\n')}

## Occasion cards

| Main card | All records | Published records |
| --- | ---: | ---: |
${occasionCardCounts.map((row) => `| ${row.main_card} | ${row.all_records} | ${row.published_records} |`).join('\n')}

## Taxonomy coverage

- Canonical category mappings: **${categorySlugs.size} of 25**
- Canonical occasion mappings: **${occasionSlugs.size} of 24**
- Unsupported category values in the source: **${new Set(unclassified.flatMap((row) => row.review_reasons.includes('unsupported_categories:') ? [row.review_reasons] : [])).size}**
- Unsupported occasion values in the source: **${new Set(unclassified.flatMap((row) => row.review_reasons.includes('unsupported_occasions:') ? [row.review_reasons] : [])).size}**

All card and subcategory counts use distinct 'import_id' values. Multi-category and multi-occasion relationships remain separate rows. General / Anytime remains an ordinary occasion and does not imply a feast.

## Database and browse integration

The relationship exports match the existing UUID-keyed 'mezmur_category_links_import' and 'mezmur_occasion_links_import' model. The source database is already populated, so these files are reconciliation inputs rather than instructions to clear or replace existing links. The website mapping is implemented in 'src/lib/publicContent/mezmurBrowseGroups.ts' and consumed by the existing paginated public category and occasion queries.

No production SQL was executed.
`
await fs.writeFile(path.join(outputDir, 'MEZMUR_GROUPING_REPORT.md'), report, 'utf8')

console.log(JSON.stringify({
  sourceRows: sourceRows.length,
  sourceColumns: headers.length,
  categoryRelationships: categoryRelationships.length,
  occasionRelationships: occasionRelationships.length,
  unclassified: unclassified.length,
  categoryCardCounts,
  occasionCardCounts,
}, null, 2))
