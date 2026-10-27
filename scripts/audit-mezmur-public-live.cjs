const fs = require('fs')

async function auditPublicMezmurs() {
  const env = fs.readFileSync('.env', 'utf8')
  const anonUrl = env.match(/VITE_SUPABASE_URL=([^\r\n]+)/)[1].trim()
  const anonKey = env.match(/VITE_SUPABASE_PUBLISHABLE_KEY=([^\r\n]+)/)[1].trim()

  const headers = { apikey: anonKey, Authorization: `Bearer ${anonKey}` }

  let allPublished = []
  let offset = 0
  const limit = 500

  while (true) {
    const res = await fetch(`${anonUrl}/rest/v1/mezmur_public?select=mezmur_id,slug,title,lyrics_amharic,lyrics_transliteration,primary_language,youtube_url,source_url,created_at&limit=${limit}&offset=${offset}`, { headers })
    if (!res.ok) {
      throw new Error(`Failed to fetch mezmur_public: ${res.status} ${await res.text()}`)
    }
    const data = await res.json()
    allPublished = allPublished.concat(data)
    if (data.length < limit) break
    offset += limit
  }

  console.log(`Fetched ${allPublished.length} records from live mezmur_public`)

  let withAmharic = 0
  let withTransliteration = 0
  let withYoutube = 0
  let withSource = 0
  const slugs = new Map()

  for (const m of allPublished) {
    if (m.lyrics_amharic && m.lyrics_amharic.trim().length > 0) withAmharic++
    if (m.lyrics_transliteration && m.lyrics_transliteration.trim().length > 0) withTransliteration++
    if (m.youtube_url && m.youtube_url.trim().length > 0) withYoutube++
    if (m.source_url && m.source_url.trim().length > 0) withSource++

    const count = slugs.get(m.slug) || 0
    slugs.set(m.slug, count + 1)
  }

  const duplicates = []
  for (const [slug, count] of slugs.entries()) {
    if (count > 1) duplicates.push({ slug, count })
  }

  console.log({
    total_live_published: allPublished.length,
    with_amharic_lyrics: withAmharic,
    with_transliteration: withTransliteration,
    with_youtube: withYoutube,
    with_source: withSource,
    duplicate_slugs_in_public_view: duplicates.length,
    duplicate_slugs_sample: duplicates.slice(0, 5)
  })

  // Check lyrics structure: Chorus & Verse sections
  let structuredAmharic = 0
  let structuredTranslit = 0
  for (const m of allPublished) {
    if (m.lyrics_amharic && (m.lyrics_amharic.includes('አዝ') || m.lyrics_amharic.includes('Chorus') || m.lyrics_amharic.includes('ክበብ') || m.lyrics_amharic.includes('ተቀባይ'))) {
      structuredAmharic++
    }
    if (m.lyrics_transliteration && (m.lyrics_transliteration.includes('[Chorus]') || m.lyrics_transliteration.includes('[Verse') || m.lyrics_transliteration.includes('Chorus:') || m.lyrics_transliteration.includes('Verse '))) {
      structuredTranslit++
    }
  }

  console.log({
    structured_amharic_count: structuredAmharic,
    structured_transliteration_count: structuredTranslit
  })

  fs.writeFileSync('scripts/live_public_mezmur_audit.json', JSON.stringify({
    total: allPublished.length,
    withAmharic,
    withTransliteration,
    withYoutube,
    withSource,
    duplicateSlugs: duplicates,
    structuredAmharic,
    structuredTranslit
  }, null, 2))
}

auditPublicMezmurs().catch(console.error)
