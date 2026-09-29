import { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import { PageLoadingFallback } from '../components/ui/PageLoadingFallback'
import { resolveLibraryCollection } from '../lib/prayers/prayerLibrary'
import { LiturgyCollectionPage } from './LiturgyCollectionPage'
import { PrayerCollectionPage } from './PrayerCollectionPage'
import { SynaxariumIndexPage } from './SynaxariumIndexPage'

/**
 * Dispatches /pray/:collectionSlug to the correct source-backed page.
 */
export function LibraryCollectionRoute() {
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
  if (sourceType === 'synaxarium') return <SynaxariumIndexPage />
  if (sourceType === 'liturgy') return <LiturgyCollectionPage />
  return <PrayerCollectionPage />
}
