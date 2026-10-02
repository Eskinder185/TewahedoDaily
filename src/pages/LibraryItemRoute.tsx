import { useEffect, useState } from 'react'
import { Navigate, useParams } from 'react-router-dom'
import { PageLoadingFallback } from '../components/ui/PageLoadingFallback'
import { resolveLibraryCollection } from '../lib/prayers/prayerLibrary'
import {
  isZewterCollectionSlug,
  zewterContinuousPath,
  zewterPrayerAnchorId,
} from '../lib/prayers/zeweterContinuous'
import { LiturgySectionPage } from './LiturgySectionPage'
import { PrayerDetailPage } from './PrayerDetailPage'
import { SynaxariumDayPage } from './SynaxariumDayPage'

/**
 * Dispatches /pray/:collectionSlug/:itemSlug to liturgy section, synaxarium day, or prayer detail.
 * Zeweter individual prayer URLs redirect into the continuous reader at the prayer anchor.
 */
export function LibraryItemRoute() {
  const { collectionSlug, prayerSlug, slug } = useParams()
  const [sourceType, setSourceType] = useState<'prayer' | 'liturgy' | 'synaxarium' | null>()

  useEffect(() => {
    let active = true
    setSourceType(undefined)
    const collection = collectionSlug?.trim().toLowerCase()
    if (!collection) {
      setSourceType('prayer')
      return
    }
    if (collection === 'synaxarium') {
      setSourceType('synaxarium')
      return
    }
    void resolveLibraryCollection(collection)
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

  if (isZewterCollectionSlug(collectionSlug)) {
    const item = (prayerSlug ?? slug ?? '').trim()
    const hash = item ? zewterPrayerAnchorId(item) : undefined
    return <Navigate to={zewterContinuousPath(hash)} replace />
  }

  return <PrayerDetailPage />
}
