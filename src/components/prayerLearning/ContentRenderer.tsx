import type { GuideLangMode, LearningContentRow, LearningSection } from '../../lib/prayers/prayerLearning'
import {
  contentForLang,
  isPrayerSection,
  listItems,
  proseItems,
  timelineItems,
} from '../../lib/prayers/prayerLearning'
import styles from './prayerLearning.module.css'
import { PrayerBlock } from './PrayerBlock'

export function ContentRenderer({
  section,
  lang,
}: {
  section: LearningSection
  lang: GuideLangMode
}) {
  const timeline = timelineItems(section, lang)
  const list = listItems(section, lang)
  const all = contentForLang(section, lang)
  const prayers = all.filter((row) => row.contentKind === 'prayer')
  const prose = proseItems(section, lang).filter((row) => row.contentKind !== 'prayer')

  const showTimeline = section.displayStyle === 'timeline' || timeline.length > 0
  const showList = section.displayStyle === 'reference_list' || list.length > 0

  return (
    <div className={styles.bodyStack}>
      {showTimeline && timeline.length > 0 ? (
        <ol className={styles.timeline} aria-label={section.titleEnglish}>
          {timeline.map((item, index) => (
            <li key={item.contentId}>
              <span>{item.heading || item.body}</span>
              {index < timeline.length - 1 ? (
                <span className={styles.timelinePipe} aria-hidden="true">
                  │
                </span>
              ) : null}
            </li>
          ))}
        </ol>
      ) : null}

      {showList && list.length > 0 ? (
        <ol className={styles.refList}>
          {list.map((item) => (
            <li key={item.contentId}>{item.body || item.heading}</li>
          ))}
        </ol>
      ) : null}

      {isPrayerSection(section) || (prayers.length > 0 && prose.length === 0) ? (
        <PrayerBlock rows={prayers.length ? prayers : all} />
      ) : (
        <>
          {prayers.length > 0 ? <PrayerBlock rows={prayers} /> : null}
          <ProseBlocks rows={prose} sectionTitle={section.titleEnglish} />
        </>
      )}
    </div>
  )
}

function ProseBlocks({
  rows,
  sectionTitle,
}: {
  rows: LearningContentRow[]
  sectionTitle?: string
}) {
  if (rows.length === 0) {
    return <p className={styles.missing}>Content not available yet.</p>
  }
  const normalizedTitle = (sectionTitle || '').trim().toLocaleLowerCase()
  return (
    <>
      {rows.map((row) => {
        const paragraphs = row.body
          .split(/\n{2,}/)
          .map((part) => part.trim())
          .filter(Boolean)
        const isInstruction = row.contentKind === 'instruction'
        const blockClass = isInstruction ? styles.instructionBlock : styles.bodyBlock
        const heading = (row.heading || '').trim()
        const duplicateHeading =
          Boolean(heading) &&
          Boolean(normalizedTitle) &&
          heading.toLocaleLowerCase() === normalizedTitle

        return (
          <div key={row.contentId} className={blockClass} lang={row.language}>
            {heading && row.contentKind !== 'body' && !duplicateHeading ? (
              <p className={styles.contentHeading}>{heading}</p>
            ) : null}
            {paragraphs.length > 0 ? (
              paragraphs.map((paragraph, index) => <p key={`${row.contentId}-${index}`}>{paragraph}</p>)
            ) : (
              <p className={styles.missing}>Translation not available yet.</p>
            )}
          </div>
        )
      })}
    </>
  )
}
