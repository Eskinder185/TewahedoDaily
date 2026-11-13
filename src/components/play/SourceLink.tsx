import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import type { AppLocale } from '../../lib/i18n/locale'
import { librarySlugOf, publishedLibraryBooks } from '../../lib/play/sourceAvailability'
import type { SourceReference } from '../../lib/play/types'

/**
 * A source citation. Bible, Mezmur and calendar sources always link. A Church Library citation links only when that
 * book is published; otherwise the citation is shown as plain text with a short note, so a player never follows a
 * link to a page that says "not published yet" (and the question itself is never hidden because of it).
 */
export function SourceLink({ source, locale, prefix = '', className }: { source: SourceReference; locale: AppLocale; prefix?: string; className?: string }) {
  const slug = librarySlugOf(source)
  const isLibrary = source.kind === 'church-library'
  const [published, setPublished] = useState<Set<string> | null>(null)
  useEffect(() => {
    if (!isLibrary) return
    let active = true
    void publishedLibraryBooks().then((set) => { if (active) setPublished(set) }).catch(() => { if (active) setPublished(new Set()) })
    return () => { active = false }
  }, [isLibrary])

  if (!isLibrary || (slug && published?.has(slug))) return <Link className={className} to={source.route}>{prefix}{source.label}</Link>
  const note = locale === 'am' ? '(የቤተ ክርስቲያን ቤተ መጻሕፍት፤ እስካሁን በመስመር ላይ አልታተመም)' : '(Church Library: not yet published online)'
  return <span className={className} data-source-unavailable>{prefix}{source.label} <small style={{ display: 'block', fontWeight: 400 }}>{note}</small></span>
}
