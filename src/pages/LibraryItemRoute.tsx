import { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import { PageLoadingFallback } from '../components/ui/PageLoadingFallback'
import { resolveLibraryCollection } from '../lib/prayers/prayerLibrary'
import { LiturgySectionPage } from './LiturgySectionPage'
import { PrayerDetailPage } from './PrayerDetailPage'
import { SynaxariumDayPage } from './SynaxariumDayPage'

/**
 * Dispatches /pray/:collectionSlug/:itemSlug to liturgy section, synaxarium day, or prayer detail.
 */
export function LibraryItemRoute() {
  const { collectionSlug } = useParams()
  const [sourceType, setSourceType] = useState<'prayer' | 'liturgy' | 'synaxarium' | null>()

  useEffect(() => {
    let active = true
    setSourceType(undefined)
    const slug = collectionSlug?.trim().toLowerCase()
    if (!slug) {
      setSourceType('prayer')
      return
    }
    if (slug === 'synaxarium') {
      setSourceType('synaxarium')
      return
    }
    void resolveLibraryCollection(slug)
      .then((resolved) => {
        if (!active) return
        setSourceType(resolved?.sourceType ?? 'prayer')
      })
      .catch(() => {
        if (active) setSourceType('prayer')
      })
    return () => {
      active = false
    }
  }, [collectionSlug])

  if (sourceType === undefined) return <PageLoadingFallback />
  if (sourceType === 'synaxarium') return <SynaxariumDayPage />
  if (sourceType === 'liturgy') return <LiturgySectionPage />
  return <PrayerDetailPage />
}
