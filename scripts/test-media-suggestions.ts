import assert from 'node:assert/strict'

process.env.VITE_SUPABASE_URL ||= 'https://example.supabase.co'

const { isPublicCmsImage, registerMediaAssets, resolveMedia, suggestMediaAssets } = await import('../src/lib/media/mediaResolver')

const timket = {
  id: 'timket-asset', file_name: 'Timket.webp', storage_bucket: 'content-media',
  storage_path: 'calendar/christ/timket-436e0376-1792010746233.webp',
  alt_text: 'Timket', media_type: 'image', mime_type: 'image/webp',
}
const unverified = {
  id: 'new-asset', file_name: 'timket-copy.webp', storage_bucket: 'content-media',
  storage_path: 'calendar/christ/timket-copy.webp', alt_text: 'Timket',
  media_type: 'image', mime_type: 'image/webp',
}

assert.deepEqual(suggestMediaAssets({ title: 'Timket', explicitPath: 'calendar/current.webp' }, [timket]), [])
assert.deepEqual(suggestMediaAssets({ title: 'Timket', intentionallyNoImage: true }, [timket]), [])

const relationship = suggestMediaAssets({ id: 'observance-timket', domain: 'calendar' }, [timket])
assert.equal(relationship.length, 1)
assert.equal(relationship[0].matchSource, 'verified-relationship')
assert.equal(relationship[0].relatedContentId, 'observance-timket')

const exact = suggestMediaAssets({ title: 'Timket', domain: 'calendar' }, [timket])
assert.equal(exact.length, 1)
assert.equal(exact[0].matchSource, 'exact-title')

const ambiguous = suggestMediaAssets({ title: 'Timket', domain: 'calendar' }, [
  unverified, { ...unverified, id: 'other', storage_path: 'calendar/christ/timket-other.webp' },
])
assert.equal(ambiguous.length, 2)
assert.ok(ambiguous.every((item) => item.matchSource === 'admin-review' && item.reason.includes('Multiple')))

registerMediaAssets([unverified])
assert.equal(resolveMedia({ title: 'Timket', domain: 'calendar' }).storagePath, timket.storage_path)
assert.equal(resolveMedia({ title: 'Unknown New Subject', allowLegacyFallback: false }).hasImage, false)
assert.deepEqual(suggestMediaAssets({ title: 'Timket' }, [{ ...unverified, storage_bucket: 'private-media' }]), [])
assert.equal(isPublicCmsImage({ ...unverified, storage_bucket: 'private-media' }), false)
assert.deepEqual(suggestMediaAssets({ title: 'Timket' }, [{ ...unverified, storage_path: '/private/cover.webp' }]), [])
assert.deepEqual(suggestMediaAssets({ title: 'Timket' }, [{ ...unverified, media_type: 'audio' }]), [])
assert.deepEqual(suggestMediaAssets({ title: 'Timket' }, []), [])

const amharic = suggestMediaAssets({ titleAmharic: 'ጥምቀት', domain: 'calendar' }, [timket])
assert.equal(amharic.length, 1)
assert.equal(amharic[0].asset.id, timket.id)

const fallback = resolveMedia({ title: 'No Matching Subject', legacyFallbackUrl: '/images/calendar-web/SaintYared.webp' })
assert.equal(fallback.matchSource, 'legacy-fallback')
assert.equal(suggestMediaAssets({ title: 'No Matching Subject' }, [unverified]).length, 0)

console.log('Media suggestion safety checks: PASS')
