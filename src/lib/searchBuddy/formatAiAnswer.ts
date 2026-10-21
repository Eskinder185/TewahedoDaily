/**
 * Restricted formatting for AI explanation text.
 * React renders the blocks. HTML is stripped, never parsed.
 * Links are kept only for http(s) and same-site paths.
 * Scripture sources are not derived from this text.
 */
import { safeCitationUrl } from './aiSources.ts'

export type AiAnswerInline =
  | { type: 'text'; text: string }
  | { type: 'strong'; text: string }
  | { type: 'em'; text: string }
  | { type: 'link'; text: string; href: string }

export type AiAnswerBlock =
  | { type: 'heading'; level: 2 | 3; inlines: AiAnswerInline[] }
  | { type: 'paragraph'; inlines: AiAnswerInline[]; lang?: 'en' | 'am' | 'mixed' }
  | { type: 'label'; kind: 'english' | 'amharic' | 'bible'; inlines: AiAnswerInline[] }
  | { type: 'list'; ordered: boolean; items: AiAnswerInline[][] }

const ETHIOPIC_RE = /[\u1200-\u137F]/
const AM_LABEL = '\u12e8\u12a0\u121b\u122d\u129b \u121b\u1265\u122b\u122a\u12eb'
const AMHARIC_LABEL_RE = new RegExp(
  `^(\\u12e8\\u12a0\\u121b\\u122d\\u129b\\s*\\u121b\\u1265\\u122b\\u122a\\u12eb|\\u12a0\\u121b\\u122d\\u129b(?:\\s*\\u121b\\u1265\\u122b\\u122a\\u12eb)?)\\s*[:：]\\s*(.*)$`,
  'u',
)
const ENGLISH_LABEL_RE = /^(english(?:\s+explanation)?)\s*[:：]\s*(.*)$/i
const BIBLE_LABEL_RE = /^(bible\s+references?|scripture\s+references?)\s*[:：]\s*(.*)$/i
const MD_HEADING_RE = /^(#{1,6})\s+(.*)$/
const NUMBERED_HEADING_RE = /^(\d{1,2})[.)]\s+(.+)$/
const MYSTERY_HEADING_RE = /\bmystery\b|\u121d\u1225\u1322\u1228/i
const BULLET_RE = /^[-*+]\s+(.+)$/
const HTML_TAG_RE = /<\/?[a-zA-Z][^>]*>/g

/** Remove wrapping Markdown noise before structural classification. */
function forClassification(line: string): string {
  return (line || '')
    .replace(/\*\*/g, '')
    .replace(/__/g, '')
    .replace(/`/g, '')
    .replace(HTML_TAG_RE, '')
    .trim()
}

function detectLang(text: string): 'en' | 'am' | 'mixed' | undefined {
  const hasAm = ETHIOPIC_RE.test(text)
  const hasEn = /[A-Za-z]{3,}/.test(text)
  if (hasAm && hasEn) return 'mixed'
  if (hasAm) return 'am'
  if (hasEn) return 'en'
  return undefined
}

function stripHtml(text: string): string {
  return (text || '').replace(HTML_TAG_RE, '')
}

/** Strip decorative Markdown markers that should never show raw to users. */
export function stripDecorativeMarkdown(text: string): string {
  return (text || '')
    .replace(/```[\s\S]*?```/g, (block) => block.replace(/```/g, '').trim())
    .replace(/^\s{0,3}#{1,6}\s+/gm, '')
    .replace(/\*\*([^*]+)\*\*/g, '$1')
    .replace(/__([^_]+)__/g, '$1')
    .replace(/\*([^*\n]+)\*/g, '$1')
    .replace(/\[([^\]\n]+)\]\([^)\s]+\)/g, '$1')
    .replace(/`([^`]+)`/g, '$1')
    .replace(HTML_TAG_RE, '')
}

function pushText(out: AiAnswerInline[], text: string) {
  const clean = stripHtml(text).replace(/`([^`]*)`/g, '$1')
  if (!clean) return
  const prev = out[out.length - 1]
  if (prev && prev.type === 'text') prev.text += clean
  else out.push({ type: 'text', text: clean })
}

/** Emphasis and safe links. HTML tags are removed, not rendered. */
export function parseInlines(raw: string): AiAnswerInline[] {
  const text = stripHtml(raw || '')
  const out: AiAnswerInline[] = []
  let i = 0
  while (i < text.length) {
    if (text.startsWith('**', i) || text.startsWith('__', i)) {
      const marker = text.startsWith('**', i) ? '**' : '__'
      const end = text.indexOf(marker, i + 2)
      if (end > i + 2) {
        const inner = text.slice(i + 2, end)
        if (inner.trim()) out.push({ type: 'strong', text: stripHtml(inner) })
        i = end + 2
        continue
      }
    }

    if (text[i] === '*' || text[i] === '_') {
      const marker = text[i]
      const end = text.indexOf(marker, i + 1)
      if (end > i + 1 && text[end + 1] !== marker) {
        const inner = text.slice(i + 1, end)
        if (inner.trim() && !inner.includes('\n')) {
          out.push({ type: 'em', text: stripHtml(inner) })
          i = end + 1
          continue
        }
      }
    }

    if (text[i] === '[') {
      const match = /^\[([^\]\n]+)\]\(([^)\s]+)\)/.exec(text.slice(i))
      if (match) {
        const href = safeCitationUrl(match[2])
        if (href) out.push({ type: 'link', text: stripHtml(match[1]), href })
        else pushText(out, match[1])
        i += match[0].length
        continue
      }
    }

    const next = text.slice(i + 1).search(/[[*_]/)
    const end = next === -1 ? text.length : i + 1 + next
    pushText(out, text.slice(i, end))
    i = end
  }
  return out.filter((part) => part.text.length > 0)
}

function plainFromInlines(inlines: AiAnswerInline[]): string {
  return inlines.map((part) => part.text).join('')
}

function isMysteryNumberedHeading(line: string): boolean {
  const numbered = forClassification(line).match(NUMBERED_HEADING_RE)
  if (!numbered) return false
  return ETHIOPIC_RE.test(numbered[2]) || MYSTERY_HEADING_RE.test(numbered[2])
}

function matchBullet(line: string): string | null {
  if (line.startsWith('**') || line.startsWith('__')) return null
  const match = line.match(BULLET_RE)
  return match ? match[1] : null
}

function matchOrderedItem(line: string): string | null {
  if (isMysteryNumberedHeading(line)) return null
  const match = line.match(NUMBERED_HEADING_RE)
  return match ? match[2] : null
}

function classifyLine(line: string): AiAnswerBlock | null {
  const classified = forClassification(line)
  if (!classified || classified === '```') return null

  const md = line.match(MD_HEADING_RE) || classified.match(MD_HEADING_RE)
  if (md) {
    return {
      type: 'heading',
      level: md[1].length <= 2 ? 2 : 3,
      inlines: parseInlines(md[2]),
    }
  }

  if (isMysteryNumberedHeading(line)) {
    const numbered = classified.match(NUMBERED_HEADING_RE)
    if (numbered) {
      return {
        type: 'heading',
        level: 3,
        inlines: parseInlines(`${numbered[1]}. ${numbered[2]}`),
      }
    }
  }

  const en = classified.match(ENGLISH_LABEL_RE)
  if (en) {
    return {
      type: 'label',
      kind: 'english',
      inlines: parseInlines(en[2] ? `English explanation: ${en[2]}` : 'English explanation:'),
    }
  }

  const am = classified.match(AMHARIC_LABEL_RE)
  if (am) {
    const body = am[2] || ''
    return {
      type: 'label',
      kind: 'amharic',
      inlines: parseInlines(body ? `${AM_LABEL}: ${body}` : `${AM_LABEL}:`),
    }
  }

  const bible = classified.match(BIBLE_LABEL_RE)
  if (bible) {
    return {
      type: 'label',
      kind: 'bible',
      inlines: parseInlines(bible[2] ? `Bible reference: ${bible[2]}` : 'Bible reference:'),
    }
  }

  return {
    type: 'paragraph',
    inlines: parseInlines(line),
    lang: detectLang(classified),
  }
}

/**
 * Parse AI answer into safe blocks for React rendering.
 * Paragraphs, headings, lists, and emphasis stay structured.
 */
export function parseAiAnswerBlocks(answer: string): AiAnswerBlock[] {
  const normalized = (answer || '').replace(/\r\n/g, '\n').trim()
  if (!normalized) return []

  const blocks: AiAnswerBlock[] = []
  let list: { ordered: boolean; items: AiAnswerInline[][] } | null = null

  const flushList = () => {
    if (list && list.items.length) {
      blocks.push({ type: 'list', ordered: list.ordered, items: list.items })
    }
    list = null
  }

  for (const rawLine of normalized.split('\n')) {
    const line = rawLine.trim()
    if (!line || line === '```') {
      flushList()
      continue
    }

    const bullet = matchBullet(line)
    const ordered = bullet == null ? matchOrderedItem(line) : null
    if (bullet != null || ordered != null) {
      const orderedList = ordered != null
      if (!list || list.ordered !== orderedList) {
        flushList()
        list = { ordered: orderedList, items: [] }
      }
      const item = parseInlines(bullet ?? ordered ?? '')
      if (item.length) list.items.push(item)
      continue
    }

    flushList()
    const block = classifyLine(line)
    if (block && block.type !== 'list' && block.inlines.length) blocks.push(block)
  }

  flushList()
  return blocks
}

/** Plain text for clipboard — no Markdown markers. */
export function plainTextFromAiAnswer(answer: string): string {
  const blocks = parseAiAnswerBlocks(answer)
  if (!blocks.length) return stripDecorativeMarkdown(answer).trim()
  return blocks
    .map((block) => {
      if (block.type === 'list') {
        return block.items
          .map((item, index) => {
            const text = plainFromInlines(item).trim()
            if (!text) return ''
            return block.ordered ? `${index + 1}. ${text}` : text
          })
          .filter(Boolean)
          .join('\n')
      }
      return plainFromInlines(block.inlines).trim()
    })
    .filter(Boolean)
    .join('\n\n')
}
