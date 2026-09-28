import { db } from './mezmurService'
const types = {
  image: { bucket: 'mezmur-images', max: 10 * 1024 * 1024, mime: { 'image/jpeg': 'jpg', 'image/png': 'png', 'image/webp': 'webp' } },
  audio: { bucket: 'mezmur-audio', max: 50 * 1024 * 1024, mime: { 'audio/mpeg': 'mp3', 'audio/mp4': 'm4a', 'audio/ogg': 'ogg', 'audio/wav': 'wav' } },
} as const
export function validateFile(file: File, kind: keyof typeof types) {
  const rule = types[kind]
  if (!(file.type in rule.mime)) throw new Error(kind === 'image' ? 'Choose a JPEG, PNG, or WebP image.' : 'Choose an MP3, M4A, Ogg, or WAV audio file.')
  if (!file.size || file.size > rule.max) throw new Error(`File must be nonempty and no larger than ${rule.max / 1024 / 1024} MiB.`)
}
export async function uploadMezmurFile(id: string, file: File, kind: keyof typeof types) {
  validateFile(file, kind)
  const rule = types[kind]
  const extension = (rule.mime as Record<string, string>)[file.type]
  const path = `mezmur/${id}/${crypto.randomUUID()}.${extension}`
  const { error } = await db().storage.from(rule.bucket).upload(path, file, { upsert: false, contentType: file.type })
  if (error) throw error
  return `storage://${rule.bucket}/${path}`
}
export async function resolveMedia(reference: string | null | undefined) {
  if (!reference) return ''
  if (reference.startsWith('storage://')) {
    const [bucket, ...parts] = reference.slice(10).split('/')
    if (!['mezmur-images', 'mezmur-audio', 'saints', 'feasts', 'articles', 'general-media'].includes(bucket)) throw new Error('Unsupported media bucket.')
    const { data, error } = await db().storage.from(bucket).createSignedUrl(parts.join('/'), 300)
    if (error) throw error
    return data.signedUrl
  }
  const url = new URL(reference)
  if (url.protocol !== 'https:') throw new Error('Media links must use HTTPS.')
  return url.href
}
