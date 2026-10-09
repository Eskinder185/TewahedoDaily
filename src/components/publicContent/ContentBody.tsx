import { useCallback, useEffect, useMemo, useState } from 'react'
import { useAsync } from '../../lib/cms/useAsync'
import {
  publicRelations,
  contentPath,
  normalizeRelatedList,
  type EditorialContent,
  type EditorialKind,
} from '../../lib/cms/contentService'
import { recordGuestRecentViewed } from '../../lib/userContent/guestStorage'
import type { UserContentType } from '../../lib/userContent/types'
import { Artwork, Notice } from './PublicUi'
import { FavoriteButton } from './FavoriteButton'
import { RelatedContentList } from './RelatedContentList'
import { publicMedia } from '../../lib/publicContent/service'
import s from './PublicContent.module.css'

function favoriteTypeForKind(kind: EditorialKind): UserContentType | null {
  if (kind === 'saints') return 'saint'
  if (kind === 'feasts') return 'feast'
  return null
}

export function ContentBody({
  item,
  kind,
  preview = false,
}: {
  item: EditorialContent
  kind: EditorialKind
  preview?: boolean
}) {
  const related = useMemo(
    () => normalizeRelatedList(item.related_content),
    [item.related_content],
  )
  // Interface reading languages: English + Amharic only (Oromo content retained in CMS).
  const options = (
    [
      { key: 'body_amharic', label: 'Amharic', lang: 'am' },
      { key: 'body', label: 'English', lang: 'en' },
      { key: 'transliteration', label: 'Transliteration', lang: 'en' },
    ] as const
  ).filter((o) => item[o.key])
  const [language, setLanguage] = useState<string>(options[0]?.key || 'body')
  const relations = useAsync(
    useCallback(
      () => (preview ? Promise.resolve([]) : publicRelations(related)),
      [related, preview],
    ),
  )
  const month =
    kind === 'saints' ? item.commemoration_month : item.ethiopian_month
  const day = kind === 'saints' ? item.commemoration_day : item.ethiopian_day
  const favoriteType = favoriteTypeForKind(kind)
  const detailRoute = contentPath(kind, item.slug)

  useEffect(() => {
    if (preview || !favoriteType) return
    recordGuestRecentViewed({
      contentType: favoriteType,
      contentSlug: item.slug,
      title: item.title,
      route: detailRoute,
    })
  }, [preview, favoriteType, item.slug, item.title, detailRoute])

  return (
    <>
      <p className={s.eyebrow}>
        {kind === 'articles' ? item.teaching_category || 'Teaching' : kind}
      </p>
      <h1>{item.title}</h1>
      {!preview && favoriteType ? (
        <div className={s.favoriteRow}>
          <FavoriteButton
            id={item.id}
            contentType={favoriteType}
            contentSlug={item.slug}
            title={item.title}
            route={detailRoute}
          />
        </div>
      ) : null}
      {item.title_amharic && <p lang="am">{item.title_amharic}</p>}
      <p>{item.description}</p>
      {item.thumbnail_url && (
        <Artwork reference={item.thumbnail_url} title={item.title} />
      )}{' '}
      {item.audio_url && <ReadingAudio reference={item.audio_url} />}
      {(kind === 'saints' || kind === 'feasts') && (
        <section>
          <h2>{kind === 'saints' ? 'Commemoration' : 'Feast date'}</h2>
          {month && day ? (
            <p>
              Ethiopian calendar: month {month}, day {day}
            </p>
          ) : (
            <p>{item.is_movable ? 'Movable feast' : 'Date not recorded'}</p>
          )}
          <p>{item.date_notes}</p>
          {item.fasting_info && <p>Fasting: {item.fasting_info}</p>}
        </section>
      )}
      <div className={s.tabs} aria-label="Reading language">
        {options.map((o) => (
          <button
            key={o.key}
            aria-pressed={language === o.key}
            onClick={() => setLanguage(o.key)}
          >
            {o.label}
          </button>
        ))}
      </div>
      {options
        .filter((o) => o.key === language)
        .map((o) => (
          <section key={o.key}>
            <h2>
              {kind === 'saints' ? 'Biography' : kind === 'articles' ? 'Article' : 'Reading'} ·{' '}
              {o.label}
            </h2>
            <div className={s.lyrics} lang={o.lang}>
              {item[o.key]}
            </div>
          </section>
        ))}
      {!options.length && <p>Text will be added soon.</p>}
      {!preview && (
        <>
          <Notice {...relations} retry={relations.reload} />
          <RelatedContentList items={relations.data || []} />
        </>
      )}
    </>
  )
}

function ReadingAudio({ reference }: { reference: string }) {
  const result = useAsync(
    useCallback(() => publicMedia(reference), [reference]),
  )
  return (
    <>
      <Notice {...result} retry={result.reload} />
      {result.data && (
        <audio
          controls
          preload="none"
          src={result.data}
          aria-label="Prayer or reading audio"
          style={{ maxWidth: '100%' }}
        />
      )}
    </>
  )
}
