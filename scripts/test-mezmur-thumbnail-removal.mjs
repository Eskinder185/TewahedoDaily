import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { fileURLToPath } from 'node:url'
import { join } from 'node:path'

const root = fileURLToPath(new URL('..', import.meta.url))
const editor = readFileSync(join(root, 'src/pages/admin/MezmurEditor.tsx'), 'utf8')
const publicLibrary = readFileSync(join(root, 'src/pages/PublicMezmurLibrary.tsx'), 'utf8')

assert.match(editor, /set\('thumbnail_path', storagePath\)/)
assert.match(editor, /set\('thumbnail_url', storagePath\)/)
assert.match(editor, /set\('image_alt', storagePath \? altText : ''\)/)
assert.match(publicLibrary, /setSrc\(url \|\| yt\)/)

function applySelection(input, { storagePath, altText }) {
  return {
    ...input,
    thumbnail_path: storagePath,
    thumbnail_url: storagePath,
    image_alt: storagePath ? altText : '',
  }
}

function savePayload(input) {
  return {
    ...input,
    image_path: input.thumbnail_path?.trim() || input.thumbnail_url?.trim() || null,
    image_alt: input.image_alt?.trim() || null,
  }
}

function reload(payload) {
  return {
    thumbnail_path: payload.image_path,
    thumbnail_url: payload.image_path,
    image_alt: payload.image_alt,
  }
}

const unchanged = {
  youtube_url: 'https://youtu.be/example',
  audio_url: 'storage://mezmur-audio/mezmur/id/audio.mp3',
  lyrics_amharic: 'lyrics',
  category_id: 'praise',
}

for (const existing of [
  { thumbnail_path: 'mezmur/old.webp', thumbnail_url: 'mezmur/old.webp' },
  { thumbnail_path: '', thumbnail_url: 'https://cdn.example/old.webp' },
  { thumbnail_path: 'mezmur/old.webp', thumbnail_url: '' },
  { thumbnail_path: '', thumbnail_url: 'https://example.com/old.webp' },
]) {
  const removed = applySelection({ ...unchanged, ...existing, image_alt: 'Old image' }, {
    storagePath: '',
    altText: 'Old image',
  })
  const persisted = savePayload(removed)
  assert.equal(persisted.image_path, null)
  assert.deepEqual(reload(persisted), {
    thumbnail_path: null,
    thumbnail_url: null,
    image_alt: null,
  })
  assert.deepEqual(
    { youtube_url: persisted.youtube_url, audio_url: persisted.audio_url, lyrics_amharic: persisted.lyrics_amharic, category_id: persisted.category_id },
    unchanged,
  )
}

const replacement = applySelection(
  { ...unchanged, thumbnail_path: 'mezmur/old.webp', thumbnail_url: 'mezmur/old.webp', image_alt: 'Old image' },
  { storagePath: 'mezmur/new.webp', altText: 'New image' },
)
assert.deepEqual(reload(savePayload(replacement)), {
  thumbnail_path: 'mezmur/new.webp',
  thumbnail_url: 'mezmur/new.webp',
  image_alt: 'New image',
})

console.log('Mezmur thumbnail removal regression tests passed.')
