/** Strip internal editorial / import scaffolding from public liturgy copy. */
export function sanitizePublicLiturgyCopy(text: string | null | undefined): string {
  if (!text) return ''
  let out = text.trim()
  if (!out) return ''

  out = out
    .replace(/\baccording to the PDF note\b/gi, '')
    .replace(/\bdescribed in the PDF note\b/gi, '')
    .replace(/\battributed by the PDF note\b/gi, '')
    .replace(/\bconnected in the PDF note to\b/gi, 'connected to')
    .replace(/\bThe PDF note lists[^.]*\./gi, '')
    .replace(/\bThe PDF note says[^.]*\./gi, '')
    .replace(/\bThe PDF describes[^.]*\./gi, '')
    .replace(/\bPDF note\b/gi, '')
    .replace(/\bthe PDF\b/gi, 'tradition')
    .replace(/\bConfidence:\s*\w+\b/gi, '')
    .replace(/\bNo specific mezmur linked(?: for this day)? yet\.?/gi, '')
    .replace(/\bNot resolved from current data\b/gi, '')
    .replace(/\bNo source-supported anaphora mapping is available for this day yet\.?/gi, '')
    .replace(/\bLinked from calendar day liturgy data\.?/gi, '')
    .replace(/\bMatched chant metadata:[^.]*\.?/gi, '')
    .replace(/\s{2,}/g, ' ')
    .replace(/\s+([,.])/g, '$1')
    .replace(/^[,.\s]+|[,.\s]+$/g, '')
    .trim()

  return out
}

export function isInternalPlaceholderCopy(text: string | null | undefined): boolean {
  const t = (text || '').trim().toLowerCase()
  if (!t) return true
  return (
    /^(todo|tbd|placeholder|draft|unpublished|n\/a|xxx)\b/.test(t) ||
    t.includes('[placeholder]') ||
    t.includes('lorem ipsum') ||
    t.includes('pdf note') ||
    t.includes('the pdf describes') ||
    t.includes('the pdf ') ||
    t.startsWith('confidence:') ||
    /no specific mezmur linked/.test(t) ||
    /not resolved from current data/.test(t) ||
    /editorial selections for today will appear/.test(t)
  )
}
