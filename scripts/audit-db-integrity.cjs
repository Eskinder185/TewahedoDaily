const fs = require('fs')

// 1. Read anon credentials
const env = fs.readFileSync('.env', 'utf8')
const anonUrl = env.match(/VITE_SUPABASE_URL=([^\r\n]+)/)[1].trim()
const anonKey = env.match(/VITE_SUPABASE_PUBLISHABLE_KEY=([^\r\n]+)/)[1].trim()

// 2. Read service role credentials from .env.import
let serviceKey = null
if (fs.existsSync('.env.import')) {
  const envImport = fs.readFileSync('.env.import', 'utf8')
  const match = envImport.match(/SUPABASE_SERVICE_ROLE_KEY=([^\r\n]+)/)
  if (match) serviceKey = match[1].trim()
}

console.log('Anon URL:', anonUrl)
console.log('Service Role Key available:', !!serviceKey)

async function runIntegrityAudit() {
  const results = {
    anonAccess: {},
    adminAccess: {},
    security: {},
    mezmurCatalog: {},
    synaxariumDb: {},
    bibleDb: {},
    calendarDb: {}
  }

  // --- PART 1: PUBLIC / ANONYMOUS VISITOR AUDIT ---
  console.log('\n======================================================')
  console.log('PART 1: ANONYMOUS VISITOR ACCESS & PRIVACY AUDIT')
  console.log('======================================================')

  const publicTables = [
    'mezmur_public',
    'mezmur_sections_import',
    'mezmur_section_links_import',
    'mezmur_occasion_links_public',
    'mezmur_category_links_public',
    'orthodox_observances',
    'liturgical_fasts',
    'liturgical_seasons',
    'monthly_commemorations',
    'calendar_cards',
    'synaxarium_days',
    'bible_verses',
    'prayers',
    'prayer_guides',
    'zemaris'
  ]

  for (const t of publicTables) {
    try {
      const res = await fetch(`${anonUrl}/rest/v1/${t}?select=count`, {
        headers: { apikey: anonKey, Authorization: `Bearer ${anonKey}`, Prefer: 'count=exact' }
      })
      const range = res.headers.get('content-range')
      const count = range ? range.split('/')[1] : null
      results.anonAccess[t] = { status: res.status, count: count }
      console.log(`[Public] ${t.padEnd(30)}: HTTP ${res.status} | Count: ${count}`)
    } catch (err) {
      console.log(`[Public] ${t.padEnd(30)}: ERROR ${err.message}`)
    }
  }

  // Verify that private administrative and user tables reject anonymous visitors
  console.log('\n--- VERIFYING RLS BLOCKING ON PRIVATE / RESTRICTED TABLES ---')
  const privateTables = [
    'mezmur_data_import',
    'user_favorites',
    'profiles',
    'content_audit_log'
  ]

  for (const t of privateTables) {
    try {
      const res = await fetch(`${anonUrl}/rest/v1/${t}?select=*&limit=1`, {
        headers: { apikey: anonKey, Authorization: `Bearer ${anonKey}` }
      })
      const isBlocked = res.status === 401 || res.status === 403 || res.status === 404
      results.security[t] = { status: res.status, blocked: isBlocked }
      console.log(`[Security] ${t.padEnd(25)}: HTTP ${res.status} | Protected/Blocked: ${isBlocked}`)
    } catch (err) {
      console.log(`[Security] ${t.padEnd(25)}: BLOCKED (${err.message})`)
    }
  }

  // Test unauthorized anonymous write
  console.log('\n--- TESTING UNAUTHORIZED WRITE PREVENTION ---')
  const writeRes = await fetch(`${anonUrl}/rest/v1/mezmur_data_import`, {
    method: 'POST',
    headers: { apikey: anonKey, Authorization: `Bearer ${anonKey}`, 'Content-Type': 'application/json' },
    body: JSON.stringify({ slug: 'hacker-probe', title: 'Unauthorized', status: 'published' })
  })
  const writeBlocked = writeRes.status === 401 || writeRes.status === 403
  results.security.anonymousWriteBlocked = writeBlocked
  console.log(`Anonymous INSERT into mezmur_data_import: HTTP ${writeRes.status} | Blocked: ${writeBlocked}`)

  // --- PART 2: READ-ONLY INTERNAL CATALOG AUDIT ---
  if (!serviceKey) {
    console.log('\nService role key not found. Skipping internal catalog audit.')
    return
  }

  console.log('\n======================================================')
  console.log('PART 2: INTERNAL DATABASE INVENTORY & INTEGRITY AUDIT')
  console.log('======================================================')

  const headers = { apikey: serviceKey, Authorization: `Bearer ${serviceKey}` }

  // 1. Audit all 1,152 Mezmurs
  console.log('\n--- 1. FULL MEZMUR CATALOG INVENTORY ---')
  const allMezRes = await fetch(`${anonUrl}/rest/v1/mezmur_data_import?select=import_id,slug,title,status,lyrics_amharic,lyrics_transliteration,language,youtube_url,source_url,created_at`, { headers })
  const allMezmurs = await allMezRes.json()
  console.log(`Total Mezmur records in database: ${allMezmurs.length}`)

  let pubCount = 0
  let draftCount = 0
  let otherStatus = 0
  let withAmharic = 0
  let withTranslit = 0
  let missingTranslit = 0
  let withYoutube = 0
  let withSourceUrl = 0
  const slugs = new Map()

  for (const m of allMezmurs) {
    if (m.status === 'published') pubCount++
    else if (m.status === 'draft') draftCount++
    else otherStatus++

    if (m.lyrics_amharic && m.lyrics_amharic.trim().length > 0) withAmharic++
    if (m.lyrics_transliteration && m.lyrics_transliteration.trim().length > 0) withTranslit++
    else missingTranslit++

    if (m.youtube_url && m.youtube_url.trim().length > 0) withYoutube++
    if (m.source_url && m.source_url.trim().length > 0) withSourceUrl++

    const count = slugs.get(m.slug) || 0
    slugs.set(m.slug, count + 1)
  }

  const duplicates = []
  for (const [slug, count] of slugs.entries()) {
    if (count > 1) duplicates.push({ slug, count })
  }

  results.mezmurCatalog = {
    totalRecords: allMezmurs.length,
    published: pubCount,
    drafts: draftCount,
    otherStatus,
    withAmharicLyrics: withAmharic,
    withTransliteration: withTranslit,
    missingTransliteration: missingTranslit,
    withYoutubeUrl: withYoutube,
    withSourceUrl: withSourceUrl,
    duplicateSlugsCount: duplicates.length,
    duplicateSlugs: duplicates
  }

  console.log(`- Published Mezmurs: ${pubCount}`)
  console.log(`- Draft Mezmurs: ${draftCount}`)
  console.log(`- With original Amharic lyrics: ${withAmharic}`)
  console.log(`- With transliteration: ${withTranslit}`)
  console.log(`- Missing transliteration: ${missingTranslit}`)
  console.log(`- With YouTube video URL: ${withYoutube}`)
  console.log(`- With Source URL: ${withSourceUrl}`)
  console.log(`- Duplicate slug groups: ${duplicates.length}`)
  if (duplicates.length > 0) {
    console.log(`- Sample duplicate slug groups:`, duplicates.slice(0, 5))
  }

  // 2. Audit Synaxarium Days in Database
  console.log('\n--- 2. SYNAXARIUM SUPABASE COVERAGE BY MONTH ---')
  const synaxRes = await fetch(`${anonUrl}/rest/v1/synaxarium_days?select=id,month_number,day`, { headers })
  const synaxRows = await synaxRes.json()
  console.log(`Total Synaxarium rows in database: ${synaxRows.length}`)

  const monthCounts = {}
  for (let m = 1; m <= 13; m++) monthCounts[m] = 0
  for (const r of synaxRows) {
    if (monthCounts[r.month_number] !== undefined) {
      monthCounts[r.month_number]++
    }
  }

  console.log('Database Synaxarium Days by Month Number:')
  for (let m = 1; m <= 13; m++) {
    console.log(`  Month ${String(m).padStart(2)}: ${monthCounts[m]} days ${m === 4 ? '(Tahsas — runtime fallback covers this!)' : ''}`)
  }

  results.synaxariumDb = {
    totalDbRows: synaxRows.length,
    monthCounts
  }

  // 3. Audit Bible Verses & Translations
  console.log('\n--- 3. BIBLE VERSES & TRANSLATIONS INVENTORY ---')
  const bibleRes = await fetch(`${anonUrl}/rest/v1/bible_verses?select=id,book_id,chapter,verse_number,text,translation&limit=5`, { headers })
  const sampleVerses = await bibleRes.json()
  console.log('Sample Bible verse columns:', Object.keys(sampleVerses[0] || {}))

  // Count distinct translations
  const transRes = await fetch(`${anonUrl}/rest/v1/bible_verses?select=translation`, { headers })
  const allTrans = await transRes.json()
  const transSet = new Set(allTrans.map(v => v.translation))
  console.log(`Bible verse translations found:`, Array.from(transSet))
  results.bibleDb = {
    sampleVerse: sampleVerses[0],
    translations: Array.from(transSet)
  }

  // Save audit data to disk
  fs.writeFileSync('scripts/audit_live_database_results.json', JSON.stringify(results, null, 2), 'utf8')
  console.log('\nSaved scripts/audit_live_database_results.json')
}

runIntegrityAudit().catch(console.error)
