import { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import { PageLoadingFallback } from '../components/ui/PageLoadingFallback'
import { resolveLibraryCollection } from '../lib/prayers/prayerLibrary'
import { isPrayerGuideSlug } from '../lib/prayers/prayerGuides'
import { isZewterCollectionSlug } from '../lib/prayers/zeweterContinuous'
import { LiturgyCollectionPage } from './LiturgyCollectionPage'
import { PrayerCollectionPage } from './PrayerCollectionPage'
import { MezmureDawitPage } from './MezmureDawitPage'
import { SynaxariumIndexPage } from './SynaxariumIndexPage'
import { ZeweterContinuousPage } from './ZeweterContinuousPage'
import { PrayerGuidePage } from './PrayerGuidePage'

/**
 * Dispatches /pray/:collectionSlug to the correct source-backed page.
 */
export function LibraryCollectionRoute() {
  const { collectionSlug } = useParams()
  const [sourceType, setSourceType] = useState<
    'prayer' | 'liturgy' | 'synaxarium' | 'guide' | null
  >()

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
    void (async () => {
      try {
        if (await isPrayerGuideSlug(slug)) {
          if (active) setSourceType('guide')
          return
        }
        const resolved = await resolveLibraryCollection(slug)
        if (active) setSourceType(resolved?.sourceType ?? 'prayer')
      } catch {
        if (active) setSourceType('prayer')
      }
    })()
    return () => {
      active = false
    }
  }, [collectionSlug])

  if (sourceType === undefined) return <PageLoadingFallback />
  if (sourceType === 'guide') return <PrayerGuidePage />
  if (sourceType === 'synaxarium') return <SynaxariumIndexPage />
  if (sourceType === 'liturgy') return <LiturgyCollectionPage />
  if (collectionSlug?.trim().toLowerCase() === 'mezmure-dawit') return <MezmureDawitPage />
  if (isZewterCollectionSlug(collectionSlug)) return <ZeweterContinuousPage />
  return <PrayerCollectionPage />
}
