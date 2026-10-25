export type HymnSectionKind = 'verse' | 'chorus' | 'bridge' | 'other'

export type HymnLyricSection = {
  id: string
  kind: HymnSectionKind
  label: string
  lines: string[]
}

export type HymnSlide = {
  id: string
  label: string
  lines: string[]
}

export type VerifiedHymnRelation = {
  type: 'hymn' | 'scripture' | 'prayer' | 'feast' | 'saint' | 'calendar'
  label: string
  href: string
}

const SECTION_HEADING = /^(verse|chorus|refrain|bridge|ቁጥር|አዝማች|አዝ|መልስ)(?:\s*\d+)?[_\s:.-]*$/i

export function normalizeVerifiedRelations(value: unknown): VerifiedHymnRelation[] {
  if (!Array.isArray(value)) return []
  return value.flatMap((entry) => {
    if (!entry || typeof entry !== 'object') return []
    const row = entry as Record<string, unknown>
    const type = String(row.target_type || row.type || '').toLowerCase()
    const label = String(row.label || '').trim()
    const href = String(row.href || '').trim()
    if (
      row.verified !== true ||
      !['hymn', 'scripture', 'prayer', 'feast', 'saint', 'calendar'].includes(type) ||
      !label ||
      !href.startsWith('/') ||
      href.startsWith('//')
    ) return []
    return [{ type, label, href } as VerifiedHymnRelation]
  })
}

export async function shareHymnLink(
  platform: { share?: (data?: ShareData) => Promise<void>; clipboard: Pick<Clipboard, 'writeText'> },
  data: { title: string; text: string; url: string },
): Promise<'shared' | 'copied'> {
  if (platform.share) {
    await platform.share(data)
    return 'shared'
  }
  await platform.clipboard.writeText(data.url)
  return 'copied'
}

function sectionKind(label: string): HymnSectionKind {
  const value = label.toLowerCase()
  if (/chorus|refrain|አዝማች|አዝ|መልስ/.test(value)) return 'chorus'
  if (/verse|ቁጥር/.test(value)) return 'verse'
  if (/bridge/.test(value)) return 'bridge'
  return 'other'
}

export function parseLyricSections(
  lyrics: string,
  structured?: unknown,
): HymnLyricSection[] {
  if (Array.isArray(structured)) {
    const parsed = structured.flatMap((entry, index) => {
      if (!entry || typeof entry !== 'object') return []
      const row = entry as Record<string, unknown>
      const lines = Array.isArray(row.lines)
        ? row.lines.map(String).map((line) => line.trim()).filter(Boolean)
        : String(row.text || '').split(/\r?\n/).map((line) => line.trim()).filter(Boolean)
      if (!lines.length) return []
      const label = String(row.label || '').trim() || `Verse ${index + 1}`
      const kindValue = String(row.kind || '').toLowerCase()
      const kind: HymnSectionKind = ['verse', 'chorus', 'bridge', 'other'].includes(kindValue)
        ? kindValue as HymnSectionKind
        : sectionKind(label)
      return [{ id: `section-${index + 1}`, kind, label, lines }]
    })
    if (parsed.length) return parsed
  }

  const blocks = lyrics.trim().split(/\r?\n\s*\r?\n+/).map((block) => block.trim()).filter(Boolean)
  return blocks.map((block, index) => {
    const lines = block.split(/\r?\n/).map((line) => line.trim()).filter(Boolean)
    const first = lines[0] || ''
    const hasHeading = SECTION_HEADING.test(first)
    const label = hasHeading ? first.replace(/\s*[:.-]\s*$/, '') : `Verse ${index + 1}`
    return {
      id: `section-${index + 1}`,
      kind: hasHeading ? sectionKind(first) : 'verse',
      label,
      lines: hasHeading ? lines.slice(1) : lines,
    }
  }).filter((section) => section.lines.length > 0)
}

export function buildSlides(sections: HymnLyricSection[], linesPerSlide = 4): HymnSlide[] {
  const size = Math.max(2, Math.min(8, Math.round(linesPerSlide)))
  return sections.flatMap((section) => {
    const chunks: HymnSlide[] = []
    for (let index = 0; index < section.lines.length; index += size) {
      chunks.push({
        id: `${section.id}-${index / size + 1}`,
        label: section.lines.length > size
          ? `${section.label} · ${Math.floor(index / size) + 1}`
          : section.label,
        lines: section.lines.slice(index, index + size),
      })
    }
    return chunks
  })
}

export function formatLyricsForCopy(input: {
  title: string
  subtitle?: string | null
  performer?: string | null
  sections: HymnLyricSection[]
  attribution?: string | null
  includeAttribution?: boolean
}): string {
  const heading = [input.title, input.subtitle, input.performer].filter(Boolean).join(' — ')
  const body = input.sections.map((section) => {
    const label = section.label ? `${section.label}\n` : ''
    return `${label}${section.lines.join('\n')}`
  }).join('\n\n')
  const attribution = input.includeAttribution && input.attribution
    ? `\n\nSource: ${input.attribution}`
    : ''
  return `${heading}\n\n${body}${attribution}`.trim()
}

function escapeHtml(value: string): string {
  return value.replace(/[&<>"']/g, (character) => ({
    '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;',
  })[character] || character)
}

export function buildPrintableLyricsHtml(input: {
  title: string
  subtitle?: string | null
  performer?: string | null
  metadata?: string[]
  sections: HymnLyricSection[]
  attribution?: string | null
  slides?: boolean
  theme?: 'dark' | 'parchment'
}): string {
  const dark = input.theme === 'dark'
  const pages = input.sections.map((section) => `
    <section class="${input.slides ? 'slide' : 'section'}">
      <p class="label">${escapeHtml(section.label)}</p>
      <div class="lyrics" lang="am">${section.lines.map(escapeHtml).join('<br>')}</div>
    </section>`).join('')
  return `<!doctype html><html lang="en"><head><meta charset="utf-8"><title>${escapeHtml(input.title)}</title>
  <style>
    @page{size:${input.slides ? 'landscape' : 'A4'};margin:${input.slides ? '0' : '18mm'}}
    *{box-sizing:border-box}body{margin:0;background:${dark ? '#071321' : '#f8f0de'};color:${dark ? '#fff' : '#251b16'};font-family:"Noto Sans Ethiopic","Abyssinica SIL","Nyala",sans-serif}
    header{padding:18mm 18mm 8mm;border-bottom:2px solid #b99652}h1{margin:0;font-size:30pt;color:${dark ? '#f0d38b' : '#6b1732'}}
    .subtitle,.meta,.credit,.label{color:${dark ? '#d7dfeb' : '#605148'}}.meta{margin-top:8px}.section{padding:8mm 18mm;break-inside:avoid}.label{font-weight:700;text-transform:uppercase;letter-spacing:.08em}
    .lyrics{font-size:19pt;line-height:1.8;white-space:pre-wrap}.credit{padding:8mm 18mm;font-size:9pt}
    .slide{height:100vh;width:100vw;break-after:page;display:flex;flex-direction:column;align-items:center;justify-content:center;text-align:center;padding:8vh 8vw}
    .slide .lyrics{font-size:36pt;line-height:1.55;font-weight:600}.slide .label{position:absolute;top:4vh;left:5vw}
    @media print{body{background:${dark ? '#071321' : '#fff'}}header{break-after:avoid}.slide{height:100vh}}
  </style></head><body>
  ${input.slides ? '' : `<header><h1>${escapeHtml(input.title)}</h1>${input.subtitle ? `<p class="subtitle">${escapeHtml(input.subtitle)}</p>` : ''}<p class="meta">${[input.performer, ...(input.metadata || [])].filter((value): value is string => Boolean(value)).map(escapeHtml).join(' · ')}</p></header>`}
  ${pages}${input.attribution ? `<footer class="credit">Source / rights: ${escapeHtml(input.attribution)}</footer>` : ''}
  </body></html>`
}
