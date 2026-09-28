import { db } from './mezmurService'
import { validateFile } from './mediaService'
export type LibraryFile = {
  id: string
  bucket_id: string
  name: string
  metadata: { size?: number; mimetype?: string }
  created_at: string
  in_use: boolean
}
export async function mediaInventory(q: string, type: string, page: number) {
  const { data, error } = await db().rpc('cms_media_inventory', {
    q,
    media_type: type,
    page_number: page,
  })
  if (error) throw error
  return data as unknown as { items: LibraryFile[]; total: number }
}
export async function uploadContentFile(
  file: File,
  kind: string,
  id: string,
  onProgress: (value: number) => void,
) {
  const type = file.type.startsWith('image/') ? 'image' : 'audio'
  validateFile(file, type)
  const bucket =
    type === 'image' && ['saints', 'feasts', 'articles'].includes(kind)
      ? kind
      : 'general-media'
  const name = `${kind}/${id}/${crypto.randomUUID()}-${file.name.replace(/[^\p{L}\p{N}._-]/gu, '-').slice(-80)}`
  const {
    data: { session },
  } = await db().auth.getSession()
  if (!session) throw new Error('Sign in before uploading.')
  const key =
    import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY ||
    import.meta.env.VITE_SUPABASE_ANON_KEY
  const url = import.meta.env.VITE_SUPABASE_URL
  if (!url || !key) throw new Error('Supabase is not configured.')
  await new Promise<void>((resolve, reject) => {
    const xhr = new XMLHttpRequest()
    xhr.open(
      'POST',
      `${url}/storage/v1/object/${bucket}/${name.split('/').map(encodeURIComponent).join('/')}`,
    )
    xhr.setRequestHeader('apikey', key)
    xhr.setRequestHeader('Authorization', `Bearer ${session.access_token}`)
    xhr.setRequestHeader('Content-Type', file.type)
    xhr.setRequestHeader('x-upsert', 'false')
    xhr.timeout = 180000
    xhr.upload.onprogress = (e) => {
      if (e.lengthComputable)
        onProgress(Math.min(99, Math.round((e.loaded / e.total) * 100)))
    }
    xhr.onload = () => {
      if (xhr.status >= 200 && xhr.status < 300) {
        onProgress(100)
        resolve()
      } else
        reject(
          new Error('Upload failed. Check file limits and your permissions.'),
        )
    }
    xhr.onerror = () => reject(new Error('Upload interrupted. Try again.'))
    xhr.ontimeout = () => reject(new Error('Upload timed out. Try again.'))
    xhr.send(file)
  })
  return {
    reference: `storage://${bucket}/${name}`,
    type: type as 'image' | 'audio',
  }
}
