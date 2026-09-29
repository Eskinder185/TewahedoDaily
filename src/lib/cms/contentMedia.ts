import { db } from './mezmurService'

export const CONTENT_MEDIA_BUCKET = 'content-media'

export const MEDIA_FOLDERS = [
  'homepage',
  'mezmur',
  'prayers',
  'liturgy',
  'synaxarium',
  'saints',
  'feasts',
  'fallback',
] as const

export type MediaFolder = (typeof MEDIA_FOLDERS)[number]

export type MediaAsset = {
  id: string
  file_name: string
  storage_bucket: string
  storage_path: string
  alt_text: string | null
  caption: string | null
  media_type: string
  width: number | null
  height: number | null
  mime_type: string | null
  file_size: number | null
  created_by: string | null
  created_at: string
  updated_at: string
}

const ALLOWED_IMAGE_MIME: Record<string, string> = {
  'image/jpeg': 'jpg',
  'image/png': 'png',
  'image/webp': 'webp',
}

const MAX_IMAGE_BYTES = 10 * 1024 * 1024

function supabaseUrl() {
  const url = import.meta.env.VITE_SUPABASE_URL?.trim()
  if (!url) throw new Error('Supabase is not configured.')
  return url.replace(/\/$/, '')
}

/** True when value is an absolute http(s) URL. */
export function isAbsoluteMediaUrl(value: string | null | undefined): boolean {
  if (!value) return false
  return /^https?:\/\//i.test(value.trim())
}

/**
 * Resolve a stored media value to a browser-usable URL.
 * - http(s) → used as-is
 * - storage://bucket/path → public URL for public buckets, signed for private
 * - bare path (e.g. homepage/hero-1.webp) → content-media public URL
 */
export function resolveContentMediaUrl(value: string | null | undefined): string {
  if (!value) return ''
  const trimmed = value.trim()
  if (!trimmed) return ''

  if (isAbsoluteMediaUrl(trimmed)) return trimmed

  if (trimmed.startsWith('storage://')) {
    const rest = trimmed.slice('storage://'.length)
    const slash = rest.indexOf('/')
    if (slash <= 0) return ''
    const bucket = rest.slice(0, slash)
    const path = rest.slice(slash + 1)
    if (!bucket || !path) return ''
    if (bucket === CONTENT_MEDIA_BUCKET) {
      return `${supabaseUrl()}/storage/v1/object/public/${CONTENT_MEDIA_BUCKET}/${path
        .split('/')
        .map(encodeURIComponent)
        .join('/')}`
    }
    // Private buckets: caller should use async resolve when signed URL needed.
    return `${supabaseUrl()}/storage/v1/object/public/${bucket}/${path
      .split('/')
      .map(encodeURIComponent)
      .join('/')}`
  }

  // Bare storage path inside content-media
  const path = trimmed.replace(/^\/+/, '')
  return `${supabaseUrl()}/storage/v1/object/public/${CONTENT_MEDIA_BUCKET}/${path
    .split('/')
    .map(encodeURIComponent)
    .join('/')}`
}

/** Prefer thumbnail_path, then legacy thumbnail_url / image_path. */
export function resolveImagePriority(
  ...candidates: Array<string | null | undefined>
): string {
  for (const candidate of candidates) {
    const url = resolveContentMediaUrl(candidate)
    if (url) return url
  }
  return ''
}

export function validateImageFile(file: File) {
  if (!(file.type in ALLOWED_IMAGE_MIME)) {
    throw new Error('Choose a JPEG, PNG, or WebP image.')
  }
  if (!file.size || file.size > MAX_IMAGE_BYTES) {
    throw new Error('Image must be nonempty and no larger than 10 MiB.')
  }
}

function sanitizeFileName(name: string) {
  return name
    .normalize('NFKD')
    .replace(/[^\p{L}\p{N}._-]+/gu, '-')
    .replace(/-+/g, '-')
    .replace(/^-|-$/g, '')
    .slice(-80) || 'image'
}

export async function uploadContentMedia(
  file: File,
  folder: MediaFolder,
  options?: { altText?: string; caption?: string; onProgress?: (pct: number) => void },
): Promise<MediaAsset> {
  validateImageFile(file)
  const extension = ALLOWED_IMAGE_MIME[file.type]
  const path = `${folder}/${crypto.randomUUID()}-${sanitizeFileName(file.name.replace(/\.[^.]+$/, ''))}.${extension}`

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
      `${url.replace(/\/$/, '')}/storage/v1/object/${CONTENT_MEDIA_BUCKET}/${path
        .split('/')
        .map(encodeURIComponent)
        .join('/')}`,
    )
    xhr.setRequestHeader('apikey', key)
    xhr.setRequestHeader('Authorization', `Bearer ${session.access_token}`)
    xhr.setRequestHeader('Content-Type', file.type)
    xhr.setRequestHeader('x-upsert', 'false')
    xhr.timeout = 180000
    xhr.upload.onprogress = (e) => {
      if (e.lengthComputable && options?.onProgress) {
        options.onProgress(Math.min(99, Math.round((e.loaded / e.total) * 100)))
      }
    }
    xhr.onload = () => {
      if (xhr.status >= 200 && xhr.status < 300) {
        options?.onProgress?.(100)
        resolve()
      } else {
        reject(new Error('Upload failed. Check file limits and your permissions.'))
      }
    }
    xhr.onerror = () => reject(new Error('Upload interrupted. Try again.'))
    xhr.ontimeout = () => reject(new Error('Upload timed out. Try again.'))
    xhr.send(file)
  })

  const {
    data: { user },
  } = await db().auth.getUser()

  const row = {
    file_name: file.name,
    storage_bucket: CONTENT_MEDIA_BUCKET,
    storage_path: path,
    alt_text: options?.altText?.trim() || null,
    caption: options?.caption?.trim() || null,
    media_type: 'image',
    mime_type: file.type,
    file_size: file.size,
    created_by: user?.id ?? null,
  }

  const { data, error } = await db()
    .from('media_assets' as never)
    .insert(row as never)
    .select('*')
    .single()

  if (error) throw error
  return data as unknown as MediaAsset
}

export async function listMediaAssets(options?: {
  search?: string
  folder?: string
  page?: number
  pageSize?: number
}) {
  const page = Math.max(1, options?.page ?? 1)
  const pageSize = options?.pageSize ?? 24
  const from = (page - 1) * pageSize
  const to = from + pageSize - 1

  let query = db()
    .from('media_assets' as never)
    .select('*', { count: 'exact' })
    .order('created_at', { ascending: false })
    .range(from, to)

  if (options?.folder) {
    query = query.ilike('storage_path', `${options.folder}/%`)
  }
  if (options?.search?.trim()) {
    const q = options.search.trim()
    query = query.or(
      `file_name.ilike.%${q}%,storage_path.ilike.%${q}%,alt_text.ilike.%${q}%,caption.ilike.%${q}%`,
    )
  }

  const { data, error, count } = await query
  if (error) throw error
  return { items: (data || []) as unknown as MediaAsset[], total: count ?? 0 }
}

export async function updateMediaAsset(
  id: string,
  patch: Partial<Pick<MediaAsset, 'alt_text' | 'caption'>>,
) {
  const { data, error } = await db()
    .from('media_assets' as never)
    .update({ ...patch, updated_at: new Date().toISOString() } as never)
    .eq('id', id)
    .select('*')
    .single()
  if (error) throw error
  return data as unknown as MediaAsset
}

export async function deleteMediaAsset(asset: MediaAsset) {
  const { error: storageError } = await db()
    .storage.from(asset.storage_bucket || CONTENT_MEDIA_BUCKET)
    .remove([asset.storage_path])
  if (storageError) throw storageError

  const { error } = await db()
    .from('media_assets' as never)
    .delete()
    .eq('id', asset.id)
  if (error) throw error
}

export function mediaFolderFromPath(path: string | null | undefined): string {
  if (!path) return ''
  const bare = path
    .replace(/^storage:\/\/[^/]+\//, '')
    .replace(/^https?:\/\/[^/]+\/storage\/v1\/object\/public\/[^/]+\//, '')
  return bare.split('/')[0] || ''
}
