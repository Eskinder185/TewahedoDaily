import { useMemo, useState } from 'react'
import type { PrayerLang } from '../../components/prayers/prayerLang'
import { useLocale } from '../i18n/locale'
import type { PrayerTriText } from './prayerLanguage'
import {
  readStoredReaderLanguage,
  selectReaderLanguage,
  writeStoredReaderLanguage,
} from './readerLanguagePreference'

export function useReaderLanguage(text: PrayerTriText | null | undefined) {
  const { locale } = useLocale()
  const [saved, setSaved] = useState<PrayerLang | null>(() => readStoredReaderLanguage())
  const readerLanguage = useMemo(
    () => selectReaderLanguage({ locale, saved, text: text ?? null }),
    [locale, saved, text],
  )

  const setReaderLanguage = (lang: PrayerLang) => {
    setSaved(lang)
    writeStoredReaderLanguage(lang)
  }

  return { readerLanguage, setReaderLanguage }
}
