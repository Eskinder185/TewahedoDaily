import assert from 'node:assert/strict'
import {
  getValidZemariSocialLinks,
  validateZemariSocialUrl,
} from '../src/lib/publicContent/zemariSocialLinks.ts'

const allThree = getValidZemariSocialLinks({
  instagram: 'https://www.instagram.com/example.singer/',
  facebook: 'https://www.facebook.com/example.singer',
  youtube: 'https://www.youtube.com/@example-singer',
})
assert.deepEqual(
  allThree.map((link) => link.platform),
  ['instagram', 'facebook', 'youtube'],
)

const one = getValidZemariSocialLinks({ youtube: 'https://youtube.com/channel/UC123456789' })
assert.equal(one.length, 1)
assert.equal(one[0].platform, 'youtube')
assert.deepEqual(getValidZemariSocialLinks({}), [])

for (const [platform, url] of [
  ['instagram', 'https://instagram.com.example.com/singer'],
  ['facebook', 'javascript:alert(1)'],
  ['facebook', 'data:text/html,unsafe'],
  ['youtube', 'https://user:password@youtube.com/@singer'],
  ['youtube', 'https://www.youtube.com/watch?v=abcdefghijk'],
  ['youtube', 'https://youtu.be/abcdefghijk'],
  ['youtube', 'not a URL'],
]) {
  const result = validateZemariSocialUrl(platform, url)
  assert.equal(result.url, null, `${platform} should reject ${url}`)
  assert.ok(result.error, `${platform} should explain why ${url} was rejected`)
}

for (const url of [
  'https://youtube.com/@singer',
  'https://www.youtube.com/channel/UC123456789',
  'https://m.youtube.com/c/SingerName',
  'https://music.youtube.com/user/SingerName',
]) {
  assert.ok(validateZemariSocialUrl('youtube', url).url, `YouTube should accept ${url}`)
}

console.log('Zemari social-link validation checks passed.')
