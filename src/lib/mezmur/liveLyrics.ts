/**
 * liveLyrics.ts
 *
 * Full-screen Live Lyrics / Presentation Mode engine for TewahedoDaily.
 * Aligns Original Ethiopic-script lyrics (Amharic, Tigrinya, Geʽez) and
 * Latin transliteration into synchronized presentation slides across:
 *   1. Original
 *   2. Transliteration
 *   3. Both (Original above, Transliteration below)
 */

import { parseLyricSections, type HymnSectionKind } from '../hymns/lyrics'
import { formatPairedOriginalAndTransliteration } from './lyricsFormatter'
import type { PublicMezmur } from '../publicContent/service'

export type LivePresentationMode = 'original' | 'transliteration' | 'both'

export type LiveLyricsSlide = {
  id: string
  label: string
  kind: HymnSectionKind
  origLines: string[]
  translitLines: string[]
  lines: string[]
  hasOriginal: boolean
  hasTranslit: boolean
}

export type LiveLyricsInfo = {
  origText: string
  translitText: string
  langCode: string
  isEthiopic: boolean
  hasOriginal: boolean
  hasTransliteration: boolean
  defaultMode: LivePresentationMode
  slides: LiveLyricsSlide[]
}

/**
 * Resolves the primary original text and transliteration text,
 * detecting language (Amharic, Tigrinya, Geʽez, English, Oromo),
 * and builds synchronized presentation slides.
 */
export function buildLiveLyricsInfo(item: Partial<PublicMezmur>): LiveLyricsInfo {
  const amharic = (item.lyrics_amharic || '').trim()
  const geez = (item.lyrics_geez || '').trim()
  const tigrinya = ((item as { lyrics_tigrinya?: string | null }).lyrics_tigrinya || '').trim()
  const english = (item.lyrics_english || '').trim()
  const oromo = (item.lyrics_oromo || '').trim()
  const translitText = (item.lyrics_transliteration || item.transliteration || '').trim()

  const lang = (item.language || item.primary_language || '').toLowerCase()

  let origText = ''
  let langCode = 'am'
  let isEthiopic = true

  if (tigrinya) {
    origText = tigrinya
    langCode = 'ti'
    isEthiopic = true
  } else if (lang.startsWith('ti') || lang === 'tigrinya') {
    origText = amharic || geez
    langCode = 'ti'
    isEthiopic = true
  } else if (lang.startsWith('gez') || lang === 'geez') {
    origText = geez || amharic
    langCode = 'gez'
    isEthiopic = true
  } else if (amharic) {
    origText = amharic
    langCode = 'am'
    isEthiopic = true
  } else if (geez) {
    origText = geez
    langCode = 'gez'
    isEthiopic = true
  } else if (english) {
    origText = english
    langCode = 'en'
    isEthiopic = false
  } else if (oromo) {
    origText = oromo
    langCode = 'om'
    isEthiopic = false
  }

  const hasOriginal = Boolean(origText)
  const hasTransliteration = Boolean(translitText)

  let defaultMode: LivePresentationMode = 'original'
  if (hasOriginal && hasTransliteration) {
    defaultMode = 'both'
  } else if (hasTransliteration && !hasOriginal) {
    defaultMode = 'transliteration'
  }

  const slides: LiveLyricsSlide[] = []

  if (hasOriginal && hasTransliteration) {
    const rawOrigSections = parseLyricSections(origText)
    const rawTransSections = parseLyricSections(translitText)

    if (rawOrigSections.length === rawTransSections.length && rawOrigSections.length > 0) {
      // Exactly matching section count: preserve authentic section boundaries
      for (let i = 0; i < rawOrigSections.length; i++) {
        slides.push({
          id: `live-slide-${i + 1}`,
          label: rawOrigSections[i].label,
          kind: rawOrigSections[i].kind,
          origLines: rawOrigSections[i].lines,
          translitLines: rawTransSections[i].lines,
          lines: rawOrigSections[i].lines,
          hasOriginal: true,
          hasTranslit: true,
        })
      }
    } else {
      // Mismatched section count: align stanzas deterministically in memory
      const paired = formatPairedOriginalAndTransliteration(origText, translitText)
      if (paired.ok) {
        const pairedOrig = parseLyricSections(paired.formattedOriginal)
        const pairedTrans = parseLyricSections(paired.formattedTransliteration)
        for (let i = 0; i < pairedOrig.length; i++) {
          slides.push({
            id: `live-slide-${i + 1}`,
            label: pairedOrig[i].label,
            kind: pairedOrig[i].kind,
            origLines: pairedOrig[i].lines,
            translitLines: pairedTrans[i]?.lines || [],
            lines: pairedOrig[i].lines,
            hasOriginal: true,
            hasTranslit: Boolean(pairedTrans[i]?.lines?.length),
          })
        }
      } else {
        // Safe fallback: preserve original sections without misaligning unrelated transliteration
        for (let i = 0; i < rawOrigSections.length; i++) {
          slides.push({
            id: `live-slide-${i + 1}`,
            label: rawOrigSections[i].label,
            kind: rawOrigSections[i].kind,
            origLines: rawOrigSections[i].lines,
            translitLines: [],
            lines: rawOrigSections[i].lines,
            hasOriginal: true,
            hasTranslit: false,
          })
        }
      }
    }
  } else if (hasOriginal) {
    const rawOrigSections = parseLyricSections(origText)
    for (let i = 0; i < rawOrigSections.length; i++) {
      slides.push({
        id: `live-slide-${i + 1}`,
        label: rawOrigSections[i].label,
        kind: rawOrigSections[i].kind,
        origLines: rawOrigSections[i].lines,
        translitLines: [],
        lines: rawOrigSections[i].lines,
        hasOriginal: true,
        hasTranslit: false,
      })
    }
  } else if (hasTransliteration) {
    const rawTransSections = parseLyricSections(translitText)
    for (let i = 0; i < rawTransSections.length; i++) {
      slides.push({
        id: `live-slide-${i + 1}`,
        label: rawTransSections[i].label,
        kind: rawTransSections[i].kind,
        origLines: [],
        translitLines: rawTransSections[i].lines,
        lines: rawTransSections[i].lines,
        hasOriginal: false,
        hasTranslit: true,
      })
    }
  }

  return {
    origText,
    translitText,
    langCode,
    isEthiopic,
    hasOriginal,
    hasTransliteration,
    defaultMode,
    slides,
  }
}
