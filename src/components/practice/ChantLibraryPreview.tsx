import {
  chantEntryKey,
  type ChantForm,
  type ChantLibraryEntry,
} from '../../lib/practice/chantLibrary'
import { parseYoutubeVideoId, youtubeThumbnailUrl } from '../../data/utils/youtube'
import { youtubeThumbUrl } from '../../lib/practice'
import { mezmurDetailPath, mezmurShareUrl } from '../../lib/practice/mezmurSlug'
import { chantMeaningTeaser } from '../../lib/practice/chantCardTeaser'
import { PracticeMediaCard } from './PracticeMediaCard'
import { useTranslation } from '../../i18n'
import styles from './ChantLibraryPreview.module.css'

function chantThumbnail(entry: ChantLibraryEntry): string | undefined {
  if (entry.form === 'mezmur') {
    const m = entry.item
    return m.thumbnailUrl ?? youtubeThumbUrl(m.youtubeId)
  }
  const w = entry.item
  if (w.thumbnail) return w.thumbnail
  const id = w.youtubeUrl ? parseYoutubeVideoId(w.youtubeUrl) : null
  return id ? youtubeThumbnailUrl(id) : undefined
}

function chantSubtitle(entry: ChantLibraryEntry): string | undefined {
  if (entry.form === 'mezmur') {
    const t = entry.item.titleTransliteration?.trim()
    return t || undefined
  }
  return entry.item.teaser ?? (entry.item.transliterationTitle?.trim() || undefined)
}

type ChantLibraryPreviewProps = {
  entries: ChantLibraryEntry[]
  onSelect: (entry: ChantLibraryEntry) => void
  onCopyLink?: () => void
}

export function ChantLibraryPreview({
  entries,
  onSelect,
  onCopyLink,
}: ChantLibraryPreviewProps) {
  const t = useTranslation()
  const formBadge = (form: ChantForm) =>
    form === 'mezmur' ? t('mezmurPractice.library.mezmur') : t('mezmurPractice.library.werb')

  return (
    <section className={styles.root} aria-labelledby="chant-preview-heading">
      <h2 id="chant-preview-heading" className={styles.heading}>
        {t('mezmurPractice.library.startHere')}
      </h2>
      <p className={styles.deck}>{t('mezmurPractice.library.previewDeck')}</p>
      <ul className={styles.grid}>
        {entries.map((entry) => {
          const isMezmur = entry.form === 'mezmur'
          return (
            <li key={chantEntryKey(entry)}>
              <PracticeMediaCard
                title={entry.item.title}
                imageUrl={chantThumbnail(entry)}
                subtitle={chantSubtitle(entry)}
                teaserLine={chantMeaningTeaser(entry)}
                {...(isMezmur
                  ? {
                      internalHref: mezmurDetailPath(entry.item.slug),
                      copyHref: mezmurShareUrl(entry.item.slug),
                      onCopyLink,
                    }
                  : { onSelect: () => onSelect(entry) })}
                tag={formBadge(entry.form)}
              />
            </li>
          )
        })}
      </ul>
    </section>
  )
}
