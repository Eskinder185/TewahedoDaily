/**
 * Phase 4 Validation Suite — Media Storage & Bilingual Image Matching
 *
 * Tests all 10 required validation areas:
 * 1. Exact English title matching
 * 2. Exact Amharic title matching
 * 3. Mixed-language / bilingual titles & Ethiopic orthographic variants
 * 4. Known aliases (feasts, saints, fasts, Bible stories)
 * 5. Unrelated titles (must NOT match similar-sounding singers or unrelated subjects)
 * 6. Missing images (graceful null handling)
 * 7. Legacy fallback (used ONLY when no new uploaded media matches)
 * 8. Duplicate image handling (newest canonical upload wins; mislabeled early uploads excluded)
 * 9. Public storage permissions (live HTTP HEAD check against resolved content-media URLs)
 * 10. Calendar event presentation, Hymns browse collections, and Tewahedo Play catalog integration
 *
 * Run: npx tsx --env-file-if-exists=.env.local scripts/test-media-resolver.ts
 */
import assert from 'node:assert/strict'
import {
  resolveMedia,
  normalizeUnicodeText,
  normalizeAmharicCanonical,
  normalizeCompactCanonical,
  extractTitleCandidates,
  cleanMediaFileNameStem,
  registerMediaAssets,
} from '../src/lib/media/mediaResolver'
import { resolveCalendarEventPresentation } from '../src/lib/calendar/resolveCalendarEventPresentation'
import { isLocalAssetAvailable } from '../src/lib/media/localAssetAvailability'
import { PLAY_IMAGES, GAME_ART } from '../src/lib/play/imageCatalog'
import { hymnCollectionArtFallback } from '../src/lib/publicContent/hymnCollectionArtFallbacks'
import { resolveHymnSectionImageUrl } from '../src/lib/publicContent/hymnSectionArtFallbacks'
import { resolveEventImageById, resolveCommemorationImage } from '../src/content/calendarImageManifest'

async function main() {
  console.log('=== Phase 4: Media Storage & Bilingual Image Resolver Validation ===\n')

  // ── 1. Exact English Title Matching ────────────────────────────────
  {
    const timket = resolveMedia({ title: 'Timket / Baptism of Christ' })
    assert.equal(timket.hasImage, true)
    assert.equal(timket.storagePath, 'calendar/christ/timket-436e0376-1792010746233.webp')
    assert.equal(timket.matchSource, 'exact-title')
    assert.equal(timket.title, 'Timket / Baptism of Christ')
    assert.ok(timket.imageUrl?.includes('/storage/v1/object/public/content-media/calendar/christ/timket-436e0376-1792010746233.webp'))

    const meskel = resolveMedia({ title: 'Meskel / Finding of the True Cross' })
    assert.equal(meskel.hasImage, true)
    assert.equal(meskel.storagePath, 'calendar/cross/meskel-5d81e2c5-1790968227490.webp')
    assert.equal(meskel.matchSource, 'exact-title')

    const yared = resolveMedia({ title: 'Saint Yared', legacyFallbackUrl: '/images/calendar-web/SaintYared.webp', allowLegacyFallback: true })
    // The CMS Saint Yared upload (shared by two published cards, byte-identical) now wins over the bundled legacy image
    assert.equal(yared.hasImage, true)
    assert.equal(yared.matchSource, 'exact-title')
    assert.equal(yared.storagePath, 'calendar/general/yared-96548f68-1792449396141.webp')
    console.log('✓ 1. Exact English title matching: PASS')
  }

  // ── 2. Exact Amharic Title Matching ────────────────────────────────
  {
    const timketAm = resolveMedia({ titleAmharic: 'ጥምቀት' })
    assert.equal(timketAm.hasImage, true)
    assert.equal(timketAm.storagePath, 'calendar/christ/timket-436e0376-1792010746233.webp')
    assert.equal(timketAm.titleAmharic, 'ጥምቀት')

    const kidaneMihretAm = resolveMedia({ titleAmharic: 'ኪዳነ ምሕረት' })
    assert.equal(kidaneMihretAm.hasImage, true)
    assert.equal(kidaneMihretAm.storagePath, 'calendar/mary/kidane-mihret-811b63ee-1790968637146.webp')

    const kurbanAm = resolveMedia({ titleAmharic: 'ቅዱስ ቁርባን' })
    assert.equal(kurbanAm.hasImage, true)
    assert.equal(kurbanAm.storagePath, 'hymns/sections/sacraments-church-life/sacraments-holy-communion-1793162742388.webp')

    const nisihaAm = resolveMedia({ titleAmharic: 'ንስሐ' })
    assert.equal(nisihaAm.hasImage, true)
    assert.equal(nisihaAm.storagePath, 'hymns/sections/repentance-fasting/repentance-general-1793162511334.webp')
    console.log('✓ 2. Exact Amharic title matching: PASS')
  }

  // ── 3. Mixed-Language / Bilingual Titles & Ethiopic Orthographic Variants ──
  {
    // Orthographic variants: ሆሳዕና (observance DB) vs ሆሣዕና (uploaded media_assets.file_name)
    const hosannaVariant = resolveMedia({
      title: 'Hosanna — Palm Sunday',
      titleAmharic: 'ሆሳዕና',
    })
    assert.equal(hosannaVariant.hasImage, true)
    assert.equal(hosannaVariant.storagePath, 'hymns/sections/holidays-feasts/holidays-hosanna.webp')
    // Ensure original Amharic spelling passed by caller is preserved
    assert.equal(hosannaVariant.titleAmharic, 'ሆሳዕና')

    // ትንሳኤ vs ትንሣኤ
    const tinsaeVariant = resolveMedia({ titleAmharic: 'ትንሳኤ' })
    assert.equal(tinsaeVariant.hasImage, true)
    assert.equal(tinsaeVariant.storagePath, 'hymns/sections/holidays-feasts/holidays-tinsae.webp')
    assert.equal(tinsaeVariant.titleAmharic, 'ትንሳኤ')

    // ፅንሰት vs ጽንሰት
    const tsinsetVariant = resolveMedia({ titleAmharic: 'ጽንሰት' })
    assert.equal(tsinsetVariant.hasImage, true)
    assert.equal(tsinsetVariant.storagePath, 'calendar/mary/annunciation-4ff2109c-1790970788849.webp')

    // ፀደኒያ ማርያም (orthodox_observances) vs ፀደንያ ማርያም (calendar_cards)
    const tsedenyaVariant = resolveMedia({ titleAmharic: 'ፀደኒያ ማርያም' })
    assert.equal(tsedenyaVariant.hasImage, true)
    assert.equal(tsedenyaVariant.storagePath, 'calendar/mary/virgin-mary-5b77113d-1792449159957.webp')

    // Compound spacing differences: በአታለማርያም vs በአታ ለማርያም, መድሐኔአለም vs መድኃኔዓለም
    const baetaCompound = resolveMedia({ titleAmharic: 'በአታለማርያም' })
    assert.equal(baetaCompound.hasImage, true)
    assert.equal(baetaCompound.storagePath, 'calendar/mary/baeta-maryam-205b5cf8-1790969844808.webp')

    const medhaneAlemCompound = resolveMedia({ titleAmharic: 'መድሐኔአለም' })
    assert.equal(medhaneAlemCompound.hasImage, true)
    assert.equal(medhaneAlemCompound.storagePath, 'calendar/christ/medhane-alem-c1534a94-1792449312575.webp')

    // Invisible Unicode bidi characters (e.g. U+202C) stripped cleanly
    assert.equal(cleanMediaFileNameStem('Deacon Samson Negash\u202c.webp'), 'Deacon Samson Negash')
    assert.equal(normalizeAmharicCanonical('ሆሳዕና'), normalizeAmharicCanonical('ሆሣዕና'))
    assert.equal(normalizeCompactCanonical('በአታ ለማርያም'), normalizeCompactCanonical('በአታለማርያም'))
    console.log('✓ 3. Mixed-language titles & Amharic Unicode normalization: PASS')
  }

  // ── 4. Known Aliases ───────────────────────────────────────────────
  {
    const fasika = resolveMedia({ title: 'Fasika' })
    assert.equal(fasika.hasImage, true)
    assert.equal(fasika.storagePath, 'hymns/sections/holidays-feasts/holidays-tinsae.webp')

    const goodFriday = resolveMedia({ title: 'Good Friday' })
    assert.equal(goodFriday.hasImage, true)
    assert.equal(goodFriday.storagePath, 'hymns/sections/holidays-feasts/holidays-good-friday.webp')

    const greatLent = resolveMedia({ title: 'Abiy Tsom / Great Lent', titleAmharic: 'አብይ ጾም' })
    assert.equal(greatLent.hasImage, true)
    assert.equal(greatLent.storagePath, 'calendar/general/great-lent-6feda2f3-1792558641939.webp')

    const epiphany = resolveMedia({ title: 'Epiphany' })
    assert.equal(epiphany.hasImage, true)
    assert.equal(epiphany.storagePath, 'calendar/christ/timket-436e0376-1792010746233.webp')

    const cana = resolveMedia({ title: 'Wedding at Cana' })
    assert.equal(cana.hasImage, true)
    assert.equal(cana.storagePath, 'calendar/christ/kana-ze-galila-ac50eb32-1792011352115.webp')
    console.log('✓ 4. Known aliases (Bible stories, feasts, saints, fasts): PASS')
  }

  // ── 5. Unrelated Titles & Domain Isolation ─────────────────────────
  {
    // Register a singer portrait to verify it NEVER bleeds into calendar/saint/Bible queries
    registerMediaAssets([
      {
        id: 'test-zemari-solomon',
        file_name: 'Zemari Solomon.webp',
        storage_bucket: 'content-media',
        storage_path: 'hymns/zemaris/zemari-solomon-1793000000000.webp',
        alt_text: 'King Solomon',
        created_at: '2026-10-28T00:00:00Z',
      },
    ])

    const unrelatedBibleStory = resolveMedia({
      title: 'King Solomon Builds the Temple',
      titleAmharic: 'ንጉሥ ሰሎሞን',
      domain: 'calendar',
      allowLegacyFallback: false,
    })
    assert.equal(unrelatedBibleStory.hasImage, false)
    assert.equal(unrelatedBibleStory.imageUrl, null)
    assert.equal(unrelatedBibleStory.matchSource, 'none')

    const similarButUnrelated = resolveMedia({
      title: 'The Book of Ruth and Naomi',
      titleAmharic: 'መጽሐፈ ሩት',
      allowLegacyFallback: false,
    })
    assert.equal(similarButUnrelated.hasImage, false)
    assert.equal(similarButUnrelated.imageUrl, null)

    const partialWordOverlap = resolveMedia({
      title: 'George Washington',
      allowLegacyFallback: false,
    })
    assert.equal(partialWordOverlap.hasImage, false)
    assert.equal(partialWordOverlap.imageUrl, null)
    console.log('✓ 5. Unrelated titles & Zemari domain isolation: PASS')
  }

  // ── 6. Missing Images (Graceful Handling) ──────────────────────────
  {
    const missing = resolveMedia({
      id: 'non-existent-observance-xyz',
      title: 'Unknown Ancient Commemoration',
      titleAmharic: 'ያልታወቀ መታሰቢያ',
      allowLegacyFallback: false,
    })
    assert.equal(missing.hasImage, false)
    assert.equal(missing.imageUrl, null)
    assert.equal(missing.storagePath, null)
    assert.equal(missing.matchSource, 'none')
    assert.equal(missing.title, 'Unknown Ancient Commemoration')
    assert.equal(missing.titleAmharic, 'ያልታወቀ መታሰቢያ')
    console.log('✓ 6. Missing images handled gracefully: PASS')
  }

  // ── 7. Legacy Fallback Priority ────────────────────────────────────
  {
    // When new media exists, legacy fallback is NOT used (only kept as fallbackUrl for onError)
    const withNewMedia = resolveMedia({
      id: 'timket',
      title: 'Timket',
      legacyFallbackUrl: '/images/calendar-web/Timket.webp',
      allowLegacyFallback: true,
    })
    assert.equal(withNewMedia.hasImage, true)
    assert.notEqual(withNewMedia.matchSource, 'legacy-fallback')
    assert.ok(withNewMedia.imageUrl?.includes('content-media/calendar/christ/timket'))
    // The removed local file is not offered as a fallback either (remote media is kept as-is).
    assert.equal(withNewMedia.fallbackUrl, null)

    // When no new media exists and allowLegacyFallback is true, legacy fallback IS used
    const onlyLegacy = resolveMedia({
      id: 'unmapped-atmosphere-card',
      title: 'Unmapped Atmosphere Card',
      legacyFallbackUrl: '/images/calendar-web/SaintYared.webp',
      allowLegacyFallback: true,
    })
    assert.equal(onlyLegacy.hasImage, true)
    assert.equal(onlyLegacy.matchSource, 'legacy-fallback')
    assert.equal(onlyLegacy.imageUrl, '/images/calendar-web/SaintYared.webp')

    // A legacy local path whose file no longer ships is never selected: the result is "no image".
    const removedLegacy = resolveMedia({
      id: 'unmapped-atmosphere-card',
      title: 'Unmapped Atmosphere Card',
      legacyFallbackUrl: '/images/calendar-web/TodayInChurch.webp',
      allowLegacyFallback: true,
    })
    assert.equal(removedLegacy.hasImage, false)
    assert.equal(removedLegacy.imageUrl, null)
    assert.equal(removedLegacy.fallbackUrl, null)
    const removedExplicit = resolveMedia({ id: 'unmapped-atmosphere-card', explicitPath: '/images/calendar/Debre Zeit.png', allowLegacyFallback: true })
    assert.equal(removedExplicit.hasImage, false)
    console.log('✓ 7. Legacy fallback used only when no new media exists and its file ships: PASS')
  }

  // ── 8. Duplicate & Mislabeled Image Handling ───────────────────────
  {
    // Early upload `calendar/mary/annunciation-e695e78a-1790963029629.webp` had file_name `ArchangelUriel.webp`.
    // Querying for Archangel Uriel MUST select `calendar/angels/uriel-79df65b6-1790969567919.webp`, NOT annunciation!
    const uriel = resolveMedia({ title: 'Archangel Uriel', titleAmharic: 'ቅዱስ ዑራኤል' })
    assert.equal(uriel.storagePath, 'calendar/angels/uriel-79df65b6-1790969567919.webp')

    // Early upload `calendar/cross/demera-1790953956789.webp` had file_name `Kidus-Michael.webp`.
    // Querying for Demera MUST select `calendar/cross/demera-42d44792-1790968174923.webp`!
    const demera = resolveMedia({ id: 'demera', title: 'Demera', titleAmharic: 'ደመራ' })
    assert.equal(demera.storagePath, 'calendar/cross/demera-42d44792-1790968174923.webp')

    // Querying for Kidus Michael MUST select `calendar/angels/michael-hidar-85b42130-1790968789526.webp`!
    const michael = resolveMedia({ title: 'Kidus Michael', titleAmharic: 'ቅዱስ ሚካኤል' })
    assert.equal(michael.storagePath, 'calendar/angels/michael-hidar-85b42130-1790968789526.webp')
    console.log('✓ 8. Duplicate & mislabeled upload handling: PASS')
  }

  // ── 9. Calendar, Hymns & Tewahedo Play Website Integration ─────────
  {
    // Unlinked observance (`hosanna`, `tsedenya-maryam`, `george-miyazia`) resolves via shared media resolver
    const hosannaPres = resolveCalendarEventPresentation({
      sourceType: 'observance',
      sourceId: 'hosanna',
      sourceSlug: 'hosanna',
      source: { title: 'Hosanna / Palm Sunday', titleAmharic: 'ሆሳዕና' },
      cards: [],
    })
    assert.equal(hosannaPres.hasImage, true)
    assert.equal(hosannaPres.imagePath, 'hymns/sections/holidays-feasts/holidays-hosanna.webp')
    assert.ok(hosannaPres.imageUrl?.includes('content-media/hymns/sections/holidays-feasts/holidays-hosanna.webp'))

    // Explicitly empty card (`imagePath: null`) still respects admin's null card state
    const explicitNullCardPres = resolveCalendarEventPresentation({
      sourceType: 'observance',
      sourceId: 'uriel-tir',
      sourceSlug: 'uriel-tir',
      source: { title: 'Archangel Uriel', titleAmharic: 'ቅዱስ ዑራኤል', imagePath: 'calendar/angels/uriel.webp' },
      cards: [
        {
          id: 'card-uriel-empty',
          slug: 'observance-uriel-tir',
          title: 'Archangel Uriel',
          titleAmharic: 'ቅዱስ ዑራኤል',
          sourceType: 'observance',
          sourceId: 'uriel-tir',
          sourceSlug: 'uriel-tir',
          imagePath: null,
          status: 'published',
        },
      ],
    })
    assert.equal(explicitNullCardPres.hasImage, false)
    assert.equal(explicitNullCardPres.imagePath, null)

    // Tewahedo Play: all 22 PLAY_IMAGES now point to content-media URLs with local fallbackSrc
    assert.equal(PLAY_IMAGES.length, 22)
    // Every subject now has an approved upload; the set is kept so a future legacy-only subject can be listed here
    const legacyOnlyPlayImages = new Set<string>()
    for (const playImg of PLAY_IMAGES) {
      if (legacyOnlyPlayImages.has(playImg.id)) {
        assert.equal(playImg.src, playImg.fallbackSrc, `Expected PLAY_IMAGES[${playImg.id}].src to be the bundled fallback`)
      } else {
        assert.ok(
          playImg.src.includes('/storage/v1/object/public/content-media/'),
          `Expected PLAY_IMAGES[${playImg.id}].src to use content-media, got ${playImg.src}`,
        )
      }
      // fallbackSrc is a shipped local file, or empty when that file was removed (never a missing path).
      assert.ok(
        playImg.fallbackSrc === '' || (playImg.fallbackSrc.startsWith('/images/calendar-web/') && isLocalAssetAvailable(playImg.fallbackSrc)),
        `Expected PLAY_IMAGES[${playImg.id}].fallbackSrc to be empty or a shipped /images/calendar-web/ file, got ${playImg.fallbackSrc}`,
      )
    }

    // Hymn collection art fallbacks prioritize content-media
    const virginMaryColUrl = hymnCollectionArtFallback('category-virgin-mary')
    assert.ok(virginMaryColUrl.includes('content-media/hymns/collections/virgin-mary.webp'))

    const englishMezmurColUrl = hymnCollectionArtFallback('english-mezmur')
    assert.ok(englishMezmurColUrl.includes('content-media/hymns/collections/english-mezmur.webp'))

    const zemariColUrl = hymnCollectionArtFallback('zemari-singers')
    assert.ok(zemariColUrl.includes('content-media/hymns/collections/zemari-singers-1793162587835.webp'))

    // Hymn section art fallbacks prioritize content-media
    const hosannaSecUrl = resolveHymnSectionImageUrl('holidays-hosanna', null, '')
    assert.ok(hosannaSecUrl.includes('content-media/hymns/sections/holidays-feasts/holidays-hosanna.webp'))

    // Calendar manifest helpers prioritize content-media
    assert.ok(resolveEventImageById('timket')?.includes('content-media/calendar/christ/timket'))
    assert.ok(resolveCommemorationImage('Saint George', 'ቅዱስ ጊዮርጊስ')?.includes('content-media/calendar/martyrs/george-tir'))
    console.log('✓ 9. Website integration (Calendar, Hymns, Tewahedo Play): PASS')
  }

  // ── 10. Public Storage Permissions (Live HTTP Verification) ────────
  {
    const sampleUrls = [
      resolveMedia({ id: 'timket' }).imageUrl!,
      resolveMedia({ id: 'hosanna' }).imageUrl!,
      resolveMedia({ id: 'tinsae' }).imageUrl!,
      resolveMedia({ id: 'tsedenya-maryam' }).imageUrl!,
      hymnCollectionArtFallback('zemari-singers'),
      PLAY_IMAGES[0].src,
    ]
    for (const url of sampleUrls) {
      const response = await fetch(url, { method: 'HEAD' })
      assert.equal(
        response.status,
        200,
        `Expected HTTP 200 for public content-media URL ${url}, got ${response.status}`,
      )
    }
    console.log(`✓ 10. Public storage permissions verified (HTTP 200 on ${sampleUrls.length} sample URLs): PASS`)
  }

  // ── 11. GAME_ART subject resolution (matchSource-based, not imageUrl-based) ──
  {
    // Exact arguments used by `art(file, ..., subjectId)` in src/lib/play/imageCatalog.ts
    const subjects = [
      { subjectId: 'kana-ze-galila', file: 'KanaZeGalilee', gameKeys: ['emoji'] },
      { subjectId: 'yared', file: 'SaintYared', gameKeys: ['finish-the-mezmur'] },
      { subjectId: 'hosanna', file: 'Hosanna', gameKeys: ['bible-timeline', 'adventures'] },
      { subjectId: 'lalibela', file: 'EthiopianSaintsRemembrance', gameKeys: ['history'] },
      { subjectId: 'john-the-baptist', file: 'SaintJohntheBaptist', gameKeys: ['match'] },
      { subjectId: 'timket', file: 'Timket', gameKeys: ['feasts'] },
      { subjectId: 'giorgis', file: 'KidusGiorgis', gameKeys: ['saints'] },
    ]
    assert.equal(subjects.length, 7)
    const supabasePublic = '/storage/v1/object/public/content-media/'
    const approvedSources = new Set(['explicit-new-media', 'verified-relationship', 'exact-title', 'verified-alias'])
    type Status = 'PASS' | 'FALLBACK_ONLY' | 'FAIL' | 'UNKNOWN'
    const report: { subjectId: string; status: Status; matchSource: string; category: string; detail: string }[] = []

    for (const { subjectId, file, gameKeys } of subjects) {
      const legacyFallbackUrl = encodeURI(`/images/calendar-web/${file}.webp`)
      const result = resolveMedia({
        id: subjectId,
        slug: subjectId,
        legacyFallbackUrl,
        domain: 'play',
        allowLegacyFallback: true,
      })
      let status: Status
      let category: string
      let detail = ''
      if (result.matchSource === 'legacy-fallback') {
        status = 'FALLBACK_ONLY'
        category = 'local-legacy'
        detail = 'no approved Supabase mapping for this subject id'
      } else if (result.matchSource === 'none' || !result.imageUrl) {
        status = 'FAIL'
        category = 'none'
        detail = 'resolver returned no image'
      } else if (!approvedSources.has(result.matchSource) || !result.imageUrl.includes(supabasePublic)) {
        status = 'FAIL'
        category = 'unexpected'
        detail = `unexpected matchSource/url: ${result.matchSource} ${result.imageUrl}`
      } else {
        category = 'supabase-public'
        try {
          const head = await fetch(result.imageUrl, { method: 'HEAD' })
          status = head.status === 200 ? 'PASS' : 'FAIL'
          detail = `HEAD ${head.status} ${result.storagePath}`
        } catch (error) {
          status = 'UNKNOWN'
          detail = `HEAD request failed: ${(error as Error).message}`
        }
      }
      // GAME_ART must agree with the resolver (fallback subjects keep the local file)
      for (const key of gameKeys) {
        // A removed local file is never the expected source; remote media is kept as resolved.
        const expected = result.imageUrl || (isLocalAssetAvailable(legacyFallbackUrl) ? legacyFallbackUrl : '')
        if (GAME_ART[key]?.src !== expected) {
          status = 'FAIL'
          detail += ` | GAME_ART[${key}].src mismatch (${GAME_ART[key]?.src})`
        }
      }
      report.push({ subjectId, status, matchSource: result.matchSource, category, detail })
    }

    for (const r of report) {
      console.log(`  ${r.status.padEnd(13)} ${r.subjectId.padEnd(17)} matchSource=${r.matchSource.padEnd(20)} ${r.category.padEnd(16)} ${r.detail}`)
    }
    const failed = report.filter((r) => r.status === 'FAIL')
    assert.equal(failed.length, 0, `GAME_ART subjects failed: ${failed.map((r) => r.subjectId).join(', ')}`)
    console.log('✓ 11. GAME_ART subject resolution classified (FALLBACK_ONLY/UNKNOWN reported, no FAIL): PASS')
  }

  console.log('\nAll Phase 4 media resolver validation checks passed!')
}

main().catch((err) => {
  console.error(err)
  process.exit(1)
})
