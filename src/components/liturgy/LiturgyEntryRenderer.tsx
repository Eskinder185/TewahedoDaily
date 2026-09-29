import type { LiturgyEntry } from '../../lib/prayers/prayerLibraryTypes'
import {
  meaningfulTitle,
  normalizeContentType,
  publicSpeakerLabel,
  type LiturgyLangMode,
} from '../../lib/prayers/liturgyPresentation'
import styles from './LiturgyEntryRenderer.module.css'

function showAm(mode: LiturgyLangMode | null) {
  return !mode || mode === 'amharic' || mode === 'both'
}
function showEn(mode: LiturgyLangMode | null) {
  return !mode || mode === 'english' || mode === 'both'
}
function showTr(mode: LiturgyLangMode | null) {
  return !mode || mode === 'transliteration' || mode === 'both'
}

function speakerClass(speaker: string): string {
  const key = speaker.toLowerCase()
  if (key.includes('priest')) return styles.speakerPriest
  if (key.includes('deacon')) return styles.speakerDeacon
  if (key.includes('people') || key === 'all') return styles.speakerPeople
  if (key.includes('choir')) return styles.speakerChoir
  if (key.includes('reader')) return styles.speakerReader
  return styles.speakerDefault
}

function typeClass(contentType: string): string {
  switch (contentType) {
    case 'response':
      return styles.response
    case 'proclamation':
      return styles.proclamation
    case 'reading':
      return styles.reading
    case 'hymn':
      return styles.hymn
    case 'rubric':
    case 'instruction':
      return styles.rubric
    case 'prayer':
      return styles.prayer
    default:
      return styles.neutral
  }
}

function EntryBody({
  entry,
  lang,
  sectionTitle,
  showSpeaker,
}: {
  entry: LiturgyEntry
  lang: LiturgyLangMode | null
  sectionTitle?: string
  showSpeaker: boolean
}) {
  const contentType = normalizeContentType(entry)
  const isRubric = contentType === 'rubric' || contentType === 'instruction'
  const speaker = isRubric || !showSpeaker ? '' : publicSpeakerLabel(entry.speaker)

  const titleAm = meaningfulTitle(entry.titleAmharic, sectionTitle)
  const titleEn = meaningfulTitle(entry.title, sectionTitle)
  const bodyAm = entry.textAmharic.trim()
  const bodyEn = entry.textEnglish.trim()
  const transliteration = entry.transliteration.trim()
  const bodyOromo = entry.textOromo.trim()

  const title =
    (showAm(lang) && titleAm) ||
    (showEn(lang) && titleEn) ||
    (!showAm(lang) && !showEn(lang) ? titleAm || titleEn : '') ||
    ''

  const hasBody =
    (showAm(lang) && bodyAm) ||
    (showEn(lang) && bodyEn) ||
    (showTr(lang) && transliteration) ||
    (showEn(lang) && bodyOromo)

  if (!title && !hasBody && !speaker) return null

  const both = lang === 'both'

  return (
    <div
      id={`entry-${entry.slug}`}
      className={styles.line}
      data-content-type={contentType}
      data-speaker={speaker || undefined}
    >
      {speaker ? (
        <p className={`${styles.speaker} ${speakerClass(speaker)}`}>
          <span className={styles.speakerText}>{speaker}</span>
        </p>
      ) : null}

      {title ? (
        <h3 className={styles.entryTitle} lang={title === titleAm ? 'am' : undefined}>
          {title}
        </h3>
      ) : null}

      {both ? (
        <div className={styles.bilingual}>
          {bodyAm ? (
            <p className={styles.body} lang="am">
              {bodyAm}
            </p>
          ) : null}
          <div className={styles.bilingualSecondary}>
            {transliteration ? <p className={styles.translit}>{transliteration}</p> : null}
            {bodyEn ? <p className={styles.body}>{bodyEn}</p> : null}
            {!bodyEn && bodyOromo ? <p className={styles.body}>{bodyOromo}</p> : null}
          </div>
        </div>
      ) : (
        <>
          {showAm(lang) && bodyAm ? (
            <p className={styles.body} lang="am">
              {bodyAm}
            </p>
          ) : null}
          {showTr(lang) && transliteration ? <p className={styles.translit}>{transliteration}</p> : null}
          {showEn(lang) && bodyEn ? <p className={styles.body}>{bodyEn}</p> : null}
          {showEn(lang) && !bodyEn && bodyOromo ? <p className={styles.body}>{bodyOromo}</p> : null}
        </>
      )}
    </div>
  )
}

export function LiturgyEntryRenderer({
  entry,
  lang,
  sectionTitle,
}: {
  entry: LiturgyEntry
  lang: LiturgyLangMode | null
  sectionTitle?: string
}) {
  const contentType = normalizeContentType(entry)
  return (
    <article className={[styles.entry, typeClass(contentType)].filter(Boolean).join(' ')}>
      <EntryBody entry={entry} lang={lang} sectionTitle={sectionTitle} showSpeaker />
    </article>
  )
}

export function LiturgyGroupRenderer({
  speaker,
  contentType,
  entries,
  lang,
  sectionTitle,
}: {
  speaker: string
  contentType: string
  entries: LiturgyEntry[]
  lang: LiturgyLangMode | null
  sectionTitle?: string
}) {
  return (
    <article
      className={[styles.entry, styles.group, typeClass(contentType)].filter(Boolean).join(' ')}
      data-content-type={contentType}
    >
      {speaker ? (
        <p className={`${styles.speaker} ${speakerClass(speaker)}`}>
          <span className={styles.speakerText}>{speaker}</span>
        </p>
      ) : null}
      <div className={styles.groupBody}>
        {entries.map((entry, index) => (
          <EntryBody
            key={entry.id}
            entry={entry}
            lang={lang}
            sectionTitle={sectionTitle}
            showSpeaker={index === 0 ? false : Boolean(publicSpeakerLabel(entry.speaker) && publicSpeakerLabel(entry.speaker) !== speaker)}
          />
        ))}
      </div>
    </article>
  )
}
