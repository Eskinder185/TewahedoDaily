import type { SynaxariumCommemoration, SynaxariumDayBundle } from '../prayers/prayerLibraryTypes'
import type { CalendarDayCommemoration, CalendarExpandedContent } from './types'

function clean(value: string | null | undefined): string {
  const text = (value || '').trim()
  if (!text || /^(null|undefined|n\/a|-)$/i.test(text)) return ''
  return text
}

export function pickCommemorationTitle(
  item: Pick<SynaxariumCommemoration, 'title' | 'titleAmharic'>,
  preferAmharic: boolean,
): string {
  const en = clean(item.title)
  const am = clean(item.titleAmharic)
  if (preferAmharic) return am || en
  return en || am
}

export function pickCommemorationBody(
  item: Pick<SynaxariumCommemoration, 'bodyEnglish' | 'bodyAmharic' | 'summary'>,
  preferAmharic: boolean,
): string {
  const en = clean(item.bodyEnglish)
  const am = clean(item.bodyAmharic)
  const summary = clean(item.summary)
  if (preferAmharic) return am || en || summary
  return en || am || summary
}

export function supabaseCommemorationsToCalendar(
  commemorations: readonly SynaxariumCommemoration[],
  preferAmharic: boolean,
): CalendarDayCommemoration[] {
  return commemorations.map((item, index) => {
    const title = pickCommemorationTitle(item, preferAmharic)
    const titleAmharic = clean(item.titleAmharic)
    const summary = clean(item.summary)
    const body = pickCommemorationBody(item, preferAmharic)
    const expanded: CalendarExpandedContent | undefined =
      body || summary
        ? {
            whyCelebrated: summary || undefined,
            whatHappened: body ? [body] : undefined,
            significance: clean(item.scriptureReferences) || undefined,
            source: {
              title: 'Ethiopian Synaxarium',
              entryLabel: title,
              provenanceNote: 'Loaded from published Supabase Synaxarium',
            },
          }
        : undefined

    return {
      title,
      titleAmharic: titleAmharic && titleAmharic !== title ? titleAmharic : undefined,
      category: clean(item.commemorationType) || undefined,
      kind: clean(item.commemorationType) || 'synaxarium',
      priority: index === 0 ? 'headline' : 'secondary',
      summary: summary || undefined,
      body: body || undefined,
      expandedContent: expanded,
    }
  })
}

export function supabaseBundlePrimaryTitle(
  bundle: SynaxariumDayBundle | null | undefined,
  preferAmharic: boolean,
): string {
  if (!bundle) return ''
  const first = bundle.commemorations[0]
  if (first) return pickCommemorationTitle(first, preferAmharic)
  return preferAmharic
    ? clean(bundle.day.displayDateAmharic) || clean(bundle.day.displayDateEnglish)
    : clean(bundle.day.displayDateEnglish) || clean(bundle.day.displayDateAmharic)
}

export function supabaseBundleShortDescription(
  bundle: SynaxariumDayBundle | null | undefined,
  preferAmharic: boolean,
): string {
  if (!bundle) return ''
  const first = bundle.commemorations[0]
  if (first) {
    const summary = clean(first.summary)
    if (summary) return summary
    const body = pickCommemorationBody(first, preferAmharic)
    if (body) return body.length > 220 ? `${body.slice(0, 217)}…` : body
  }
  return clean(bundle.day.summary)
}
