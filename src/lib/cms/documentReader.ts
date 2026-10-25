/**
 * In-browser document unpacker and reader for Church Library original documents.
 * Zero external dependencies: uses native browser Web Streams DecompressionStream('deflate-raw')
 * to parse and extract EPUB chapters, DOCX paragraphs, and UTF-8 TXT files.
 * Preserves Amharic and Geʽez Unicode text.
 */

export type EpubChapter = {
  id: string
  title: string
  href: string
  html: string
  text: string
}

export type ParsedEpub = {
  title: string
  author: string
  chapters: EpubChapter[]
}

export type DocxParagraph = {
  type: 'heading1' | 'heading2' | 'heading3' | 'paragraph' | 'bullet'
  text: string
}

export type ParsedDocx = {
  paragraphs: DocxParagraph[]
  text: string
}

// ---------------------------------------------------------------------------
// Native In-Memory ZIP Extractor (Deflate & Stored)
// ---------------------------------------------------------------------------

type ZipEntry = {
  fileName: string
  compressionMethod: number
  compressedSize: number
  uncompressedSize: number
  localHeaderOffset: number
}

async function decompressDeflate(compressedBytes: Uint8Array): Promise<Uint8Array> {
  // Use native DecompressionStream available in modern browsers and Node 18+
  const blob = new Blob([compressedBytes as unknown as BlobPart])
  const stream = blob.stream().pipeThrough(new DecompressionStream('deflate-raw'))
  const arrayBuffer = await new Response(stream).arrayBuffer()
  return new Uint8Array(arrayBuffer)
}

export async function unzipEntries(buffer: ArrayBuffer): Promise<Map<string, Uint8Array>> {
  const bytes = new Uint8Array(buffer)
  const view = new DataView(buffer)
  const entries = new Map<string, Uint8Array>()

  // Locate End of Central Directory Record (EOCD) by scanning backwards from end
  let eocdOffset = -1
  const maxScan = Math.min(bytes.length, 65535 + 22)
  for (let i = bytes.length - 22; i >= bytes.length - maxScan; i--) {
    if (view.getUint32(i, true) === 0x06054b50) {
      eocdOffset = i
      break
    }
  }

  if (eocdOffset === -1) {
    throw new Error('Invalid ZIP archive: End of Central Directory record not found.')
  }

  const centralDirectoryOffset = view.getUint32(eocdOffset + 16, true)
  const totalEntries = view.getUint16(eocdOffset + 10, true)

  let cdPtr = centralDirectoryOffset
  const textDecoder = new TextDecoder('utf-8')

  const parsedEntries: ZipEntry[] = []

  for (let i = 0; i < totalEntries && cdPtr < eocdOffset; i++) {
    const signature = view.getUint32(cdPtr, true)
    if (signature !== 0x02014b50) break

    const compressionMethod = view.getUint16(cdPtr + 10, true)
    const compressedSize = view.getUint32(cdPtr + 20, true)
    const uncompressedSize = view.getUint32(cdPtr + 24, true)
    const fileNameLength = view.getUint16(cdPtr + 28, true)
    const extraFieldLength = view.getUint16(cdPtr + 30, true)
    const commentLength = view.getUint16(cdPtr + 32, true)
    const localHeaderOffset = view.getUint32(cdPtr + 42, true)

    const fileNameBytes = bytes.subarray(cdPtr + 46, cdPtr + 46 + fileNameLength)
    const fileName = textDecoder.decode(fileNameBytes)

    parsedEntries.push({
      fileName,
      compressionMethod,
      compressedSize,
      uncompressedSize,
      localHeaderOffset,
    })

    cdPtr += 46 + fileNameLength + extraFieldLength + commentLength
  }

  // Decompress each entry
  for (const entry of parsedEntries) {
    if (entry.fileName.endsWith('/')) continue // skip directories

    const lhOffset = entry.localHeaderOffset
    const lhSignature = view.getUint32(lhOffset, true)
    if (lhSignature !== 0x04034b50) continue

    const lhFileNameLength = view.getUint16(lhOffset + 26, true)
    const lhExtraFieldLength = view.getUint16(lhOffset + 28, true)
    const fileDataOffset = lhOffset + 30 + lhFileNameLength + lhExtraFieldLength

    const compressedSlice = bytes.subarray(fileDataOffset, fileDataOffset + entry.compressedSize)

    if (entry.compressionMethod === 0) {
      // Stored (no compression)
      entries.set(entry.fileName, new Uint8Array(compressedSlice))
    } else if (entry.compressionMethod === 8) {
      // Deflate
      try {
        const decompressed = await decompressDeflate(compressedSlice)
        entries.set(entry.fileName, decompressed)
      } catch (err) {
        console.warn(`Failed to decompress entry ${entry.fileName}:`, err)
      }
    }
  }

  return entries
}

// ---------------------------------------------------------------------------
// EPUB Parser
// ---------------------------------------------------------------------------

function sanitizeHtml(html: string): string {
  // Strip script, style, iframe, object tags and unsafe event handlers
  return html
    .replace(/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi, '')
    .replace(/<style\b[^<]*(?:(?!<\/style>)<[^<]*)*<\/style>/gi, '')
    .replace(/<iframe\b[^<]*(?:(?!<\/iframe>)<[^<]*)*<\/iframe>/gi, '')
    .replace(/<object\b[^<]*(?:(?!<\/object>)<[^<]*)*<\/object>/gi, '')
    .replace(/\son\w+="[^"]*"/gi, '')
    .replace(/\son\w+='[^']*'/gi, '')
    .replace(/javascript:[^"']*/gi, '#')
}

function extractTextFromHtml(html: string): string {
  return html
    .replace(/<[^>]+>/g, ' ')
    .replace(/&nbsp;/g, ' ')
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, "'")
    .replace(/\s+/g, ' ')
    .trim()
}

export async function parseEpub(buffer: ArrayBuffer): Promise<ParsedEpub> {
  const entries = await unzipEntries(buffer)
  const decoder = new TextDecoder('utf-8')

  // 1. Read META-INF/container.xml
  const containerBytes = entries.get('META-INF/container.xml')
  if (!containerBytes) {
    throw new Error('Invalid EPUB: META-INF/container.xml not found.')
  }
  const containerXml = decoder.decode(containerBytes)

  // Find rootfile full-path
  const rootfileMatch = containerXml.match(/full-path=["']([^"']+)["']/i)
  if (!rootfileMatch) {
    throw new Error('Invalid EPUB: Rootfile not found in container.xml.')
  }
  const opfPath = rootfileMatch[1]
  const opfDir = opfPath.includes('/') ? opfPath.substring(0, opfPath.lastIndexOf('/') + 1) : ''

  // 2. Read OPF file
  const opfBytes = entries.get(opfPath)
  if (!opfBytes) {
    throw new Error(`Invalid EPUB: OPF package not found at ${opfPath}.`)
  }
  const opfXml = decoder.decode(opfBytes)

  // Extract metadata
  const titleMatch = opfXml.match(/<dc:title[^>]*>([^<]+)<\/dc:title>/i)
  const authorMatch = opfXml.match(/<dc:creator[^>]*>([^<]+)<\/dc:creator>/i)
  const title = titleMatch ? titleMatch[1].trim() : 'Untitled'
  const author = authorMatch ? authorMatch[1].trim() : 'Unknown Author'

  // Extract manifest items
  const manifestMap = new Map<string, string>() // id -> href
  const itemRegex = /<item\s+[^>]*id=["']([^"']+)["'][^>]*href=["']([^"']+)["'][^>]*\/?>/gi
  let itemMatch: RegExpExecArray | null
  while ((itemMatch = itemRegex.exec(opfXml)) !== null) {
    manifestMap.set(itemMatch[1], itemMatch[2])
  }
  // Try reverse order if id comes after href
  const itemRegex2 = /<item\s+[^>]*href=["']([^"']+)["'][^>]*id=["']([^"']+)["'][^>]*\/?>/gi
  while ((itemMatch = itemRegex2.exec(opfXml)) !== null) {
    manifestMap.set(itemMatch[2], itemMatch[1])
  }

  // Extract spine itemrefs
  const spineIds: string[] = []
  const itemrefRegex = /<itemref\s+[^>]*idref=["']([^"']+)["'][^>]*\/?>/gi
  let refMatch: RegExpExecArray | null
  while ((refMatch = itemrefRegex.exec(opfXml)) !== null) {
    spineIds.push(refMatch[1])
  }

  // 3. Extract and parse chapters in spine order
  const chapters: EpubChapter[] = []
  for (let i = 0; i < spineIds.length; i++) {
    const id = spineIds[i]
    const relativeHref = manifestMap.get(id)
    if (!relativeHref) continue

    // Normalize path relative to OPF dir
    let fullHref = opfDir + relativeHref
    // Normalize URL decoding and handle anchor fragments
    const [pathOnly] = fullHref.split('#')
    fullHref = decodeURIComponent(pathOnly)

    let chapterBytes = entries.get(fullHref)
    if (!chapterBytes) {
      // Try finding case-insensitive or without leading slash
      for (const [key, val] of entries.entries()) {
        if (key.toLowerCase() === fullHref.toLowerCase()) {
          chapterBytes = val
          break
        }
      }
    }

    if (!chapterBytes) continue

    const chapterHtml = decoder.decode(chapterBytes)
    const sanitized = sanitizeHtml(chapterHtml)
    const text = extractTextFromHtml(sanitized)

    // Find title
    let chapterTitle = `Chapter ${i + 1}`
    const titleTagMatch = chapterHtml.match(/<title[^>]*>([^<]+)<\/title>/i)
    const h1Match = chapterHtml.match(/<h[12][^>]*>([^<]+)<\/h[12]>/i)
    if (h1Match && h1Match[1].trim()) {
      chapterTitle = extractTextFromHtml(h1Match[1]).slice(0, 80)
    } else if (titleTagMatch && titleTagMatch[1].trim()) {
      chapterTitle = extractTextFromHtml(titleTagMatch[1]).slice(0, 80)
    }

    chapters.push({
      id,
      title: chapterTitle,
      href: relativeHref,
      html: sanitized,
      text,
    })
  }

  return {
    title,
    author,
    chapters,
  }
}

// ---------------------------------------------------------------------------
// DOCX Parser
// ---------------------------------------------------------------------------

export async function parseDocx(buffer: ArrayBuffer): Promise<ParsedDocx> {
  const entries = await unzipEntries(buffer)
  const decoder = new TextDecoder('utf-8')

  const docBytes = entries.get('word/document.xml')
  if (!docBytes) {
    throw new Error('Invalid DOCX: word/document.xml not found.')
  }
  const xml = decoder.decode(docBytes)

  const paragraphs: DocxParagraph[] = []
  // Matches each paragraph <w:p>...</w:p>
  const pRegex = /<w:p\b[^>]*>(.*?)<\/w:p>/gs
  let pMatch: RegExpExecArray | null

  while ((pMatch = pRegex.exec(xml)) !== null) {
    const pContent = pMatch[1]

    // Determine style
    let type: DocxParagraph['type'] = 'paragraph'
    if (/<w:pStyle\s+[^>]*w:val=["']Heading1["']/i.test(pContent)) {
      type = 'heading1'
    } else if (/<w:pStyle\s+[^>]*w:val=["']Heading2["']/i.test(pContent)) {
      type = 'heading2'
    } else if (/<w:pStyle\s+[^>]*w:val=["']Heading3["']/i.test(pContent)) {
      type = 'heading3'
    } else if (/<w:numPr\b/i.test(pContent)) {
      type = 'bullet'
    }

    // Extract text runs <w:t xml:space="preserve">...</w:t> or <w:t>...</w:t>
    const tRegex = /<w:t\b[^>]*>([^<]*)<\/w:t>/g
    let runMatch: RegExpExecArray | null
    let paragraphText = ''
    while ((runMatch = tRegex.exec(pContent)) !== null) {
      paragraphText += runMatch[1]
    }

    const trimmed = paragraphText.trim()
    if (trimmed.length > 0) {
      paragraphs.push({
        type,
        text: paragraphText,
      })
    }
  }

  const fullText = paragraphs.map((p) => p.text).join('\n\n')
  return {
    paragraphs,
    text: fullText,
  }
}

// ---------------------------------------------------------------------------
// TXT Parser
// ---------------------------------------------------------------------------

export function parseTxt(buffer: ArrayBuffer): { lines: string[]; text: string } {
  const decoder = new TextDecoder('utf-8')
  const text = decoder.decode(buffer)
  const lines = text.split(/\r?\n/)
  return { lines, text }
}
