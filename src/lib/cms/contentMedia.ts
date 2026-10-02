import { db } from './mezmurService'
import {
  CALENDAR_IMAGE_CATEGORY_FOLDERS,
  CALENDAR_IMAGE_ROOT,
  CALENDAR_MEDIA_FILTERS,
} from '../calendar/calendarImagePaths'

export const CONTENT_MEDIA_BUCKET = 'content-media'

export const MEDIA_FOLDERS = [
  'homepage',
  'mezmur',
  'prayers',
  'liturgy',
  'synaxarium',
  'calendar',
  'saints',
  'feasts',
  'fallback',
] as const

export type MediaFolder = (typeof MEDIA_FOLDERS)[number]

/** Top-level folders plus calendar category prefixes for pickers/filters. */
export const MEDIA_FOLDER_OPTIONS: Array<{ value: string; label: string }> = [
  ...MEDIA_FOLDERS.filter((f) => f !== 'calendar').map((f) => ({ value: f, label: f })),
  ...CALENDAR_MEDIA_FILTERS.map((f) => ({
    value: f.folderPrefix.replace(/\/$/, ''),
    label: `calendar · ${f.label}`,
  })),
]

export { CALENDAR_IMAGE_CATEGORY_FOLDERS, CALENDAR_IMAGE_ROOT, CALENDAR_MEDIA_FILTERS }

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

/** Site-root paths such as `/images/calendar-web/Meskel.webp`. */
export function isSiteRelativeMediaPath(value: string | null | undefined): boolean {
  if (!value) return false
  const trimmed = value.trim()
  return trimmed.startsWith('/') && !trimmed.startsWith('//')
}

/**
 * Resolve a stored media value to a browser-usable URL.
 * - http(s) → used as-is
 * - storage://bucket/path → public URL for public buckets
 * - bare path (e.g. calendar/angels/gabriel.webp) → content-media public URL
 */
export function resolveContentMediaUrl(value: string | null | undefined): string {
  if (!value) return ''
  const trimmed = value.trim()
  if (!trimmed) return ''

  if (isAbsoluteMediaUrl(trimmed)) return trimmed
  if (isSiteRelativeMediaPath(trimmed)) return trimmed

  if (trimmed.startsWith('storage://')) {
    const rest = trimmed.slice('storage://'.length)
    const slash = rest.indexOf('/')
    if (slash <= 0) return ''
    const bucket = rest.slice(0, slash)
    const path = rest.slice(slash + 1)
    if (!bucket || !path) return ''
    return `${supabaseUrl()}/storage/v1/object/public/${bucket}/${path
      .split('/')
      .map(encodeURIComponent)
      .join('/')}`
  }

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
  return (
    name
      .normalize('NFKD')
      .replace(/[^\p{L}\p{N}._-]+/gu, '-')
      .replace(/-+/g, '-')
      .replace(/^-|-$/g, '')
      .slice(-80) || 'image'
  )
}

function normalizeStorageFolder(folder: string): string {
  return folder
    .replace(/^\/+|\/+$/g, '')
    .split('/')
    .map((part) => sanitizeFileName(part).toLowerCase())
    .filter(Boolean)
    .join('/')
}

/** Convert JPEG/PNG to WebP in-browser when supported; otherwise return original. */
export async function maybeConvertImageToWebp(file: File, quality = 0.82): Promise<File> {
  if (file.type === 'image/webp') return file
  if (!('createImageBitmap' in window) || typeof document === 'undefined') return file
  try {
    const bitmap = await createImageBitmap(file)
    const canvas = document.createElement('canvas')
    canvas.width = bitmap.width
    canvas.height = bitmap.height
    const ctx = canvas.getContext('2d')
    if (!ctx) return file
    ctx.drawImage(bitmap, 0, 0)
    bitmap.close()
    const blob = await new Promise<Blob | null>((resolve) => {
      canvas.toBlob((result) => resolve(result), 'image/webp', quality)
    })
    if (!blob || blob.size === 0) return file
    const base = file.name.replace(/\.[^.]+$/, '') || 'image'
    return new File([blob], `${base}.webp`, { type: 'image/webp', lastModified: Date.now() })
  } catch {
    return file
  }
}

export async function contentMediaPathExists(storagePath: string): Promise<boolean> {
  const path = storagePath.replace(/^\/+/, '').trim()
  if (!path) return false

  const { data: rows } = await db()
    .from('media_assets' as never)
    .select('id')
    .eq('storage_path', path)
    .limit(1)
  if (rows && (rows as unknown[]).length > 0) return true

  const folder = path.includes('/') ? path.slice(0, path.lastIndexOf('/')) : ''
  const fileName = path.includes('/') ? path.slice(path.lastIndexOf('/') + 1) : path
  const { data: listed } = await db()
    .storage.from(CONTENT_MEDIA_BUCKET)
    .list(folder || undefined, { search: fileName, limit: 100 })
  return Boolean(listed?.some((item) => item.name === fileName))
}

export type UploadContentMediaOptions = {
  altText?: string
  caption?: string
  onProgress?: (pct: number) => void
  /** Exact storage path (relative to bucket), e.g. calendar/angels/gabriel.webp */
  storagePath?: string
  /** Prefer WebP conversion for JPEG/PNG uploads */
  convertToWebp?: boolean
  /** Overwrite existing object at storagePath */
  upsert?: boolean
}

export async function uploadContentMedia(
  file: File,
  folder: string,
  options?: UploadContentMediaOptions,
): Promise<MediaAsset> {
  validateImageFile(file)
  const prepared =
    options?.convertToWebp === false ? file : await maybeConvertImageToWebp(file)
  validateImageFile(prepared)

  const extension = ALLOWED_IMAGE_MIME[prepared.type]
  const folderPath = normalizeStorageFolder(folder || 'fallback')
  const path =
    options?.storagePath?.replace(/^\/+/, '').trim() ||
    `${folderPath}/${crypto.randomUUID()}-${sanitizeFileName(
      prepared.name.replace(/\.[^.]+$/, ''),
    )}.${extension}`

  if (!options?.upsert) {
    const exists = await contentMediaPathExists(path)
    if (exists) {
      const err = new Error(`An image already exists at this path: ${path}`)
      ;(err as Error & { code?: string; storagePath?: string }).code = 'STORAGE_PATH_EXISTS'
      ;(err as Error & { storagePath?: string }).storagePath = path
      throw err
    }
  }

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
    xhr.setRequestHeader('Content-Type', prepared.type)
    xhr.setRequestHeader('x-upsert', options?.upsert ? 'true' : 'false')
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
    xhr.send(prepared)
  })

  const {
    data: { user },
  } = await db().auth.getUser()

  const row = {
    file_name: prepared.name,
    storage_bucket: CONTENT_MEDIA_BUCKET,
    storage_path: path,
    alt_text: options?.altText?.trim() || null,
    caption: options?.caption?.trim() || null,
    media_type: 'image',
    mime_type: prepared.type,
    file_size: prepared.size,
    created_by: user?.id ?? null,
  }

  const { data: existingAsset } = await db()
    .from('media_assets' as never)
    .select('id')
    .eq('storage_path', path)
    .maybeSingle()

  if (existingAsset && (existingAsset as { id?: string }).id) {
    const { data, error } = await db()
      .from('media_assets' as never)
      .update({
        ...row,
        updated_at: new Date().toISOString(),
      } as never)
      .eq('id', (existingAsset as { id: string }).id)
      .select('*')
      .single()
    if (error) throw error
    return data as unknown as MediaAsset
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
    const prefix = options.folder.replace(/\/$/, '')
    query = query.ilike('storage_path', `${prefix}/%`)
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
    .replace(/^\/+/, '')
  const parts = bare.split('/').filter(Boolean)
  if (parts[0] === CALENDAR_IMAGE_ROOT && parts.length >= 2) {
    return `${parts[0]}/${parts[1]}`
  }
  return parts[0] || ''
}

/** HEAD/public URL probe for Content Health (best-effort). */
export async function probeContentMediaExists(path: string): Promise<boolean> {
  const url = resolveContentMediaUrl(path)
  if (!url) return false
  try {
    const response = await fetch(url, { method: 'HEAD', mode: 'cors' })
    if (response.ok) return true
    const get = await fetch(url, {
      method: 'GET',
      headers: { Range: 'bytes=0-0' },
      mode: 'cors',
    })
    return get.ok || get.status === 206
  } catch {
    return false
  }
}
