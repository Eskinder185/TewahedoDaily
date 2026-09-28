import { useCallback, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAsync } from '../../lib/cms/useAsync'
import {
  publicRelations,
  contentPath,
  type EditorialContent,
  type EditorialKind,
} from '../../lib/cms/contentService'
import { Artwork, Notice } from './PublicUi'
import { publicMedia } from '../../lib/publicContent/service'
import s from './PublicContent.module.css'
export function ContentBody({
  item,
  kind,
  preview = false,
}: {
  item: EditorialContent
  kind: EditorialKind
  preview?: boolean
}) {
  const options = (
    [
      { key: 'body_amharic', label: 'Amharic', lang: 'am' },
      { key: 'body', label: 'English', lang: 'en' },
      { key: 'body_oromo', label: 'Oromo', lang: 'om' },
      { key: 'transliteration', label: 'Transliteration', lang: 'en' },
    ] as const
  ).filter((o) => item[o.key])
  const [language, setLanguage] = useState<string>(options[0]?.key || 'body')
  const relations = useAsync(
    useCallback(
      () =>
        preview
          ? Promise.resolve([])
          : publicRelations(item.related_content || []),
      [item.related_content, preview],
    ),
  )
  const month =
    kind === 'saints' ? item.commemoration_month : item.ethiopian_month
  const day = kind === 'saints' ? item.commemoration_day : item.ethiopian_day
  return (
    <>
      <p className={s.eyebrow}>
        {kind === 'articles' ? item.teaching_category : kind}
      </p>
      <h1>{item.title}</h1>
      {item.title_amharic && <p lang="am">{item.title_amharic}</p>}
      {item.title_oromo && <p lang="om">{item.title_oromo}</p>}
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
              {kind === 'prayers'
                ? 'Prayer'
                : kind === 'saints'
                  ? 'Biography'
                  : 'Reading'}{' '}
              · {o.label}
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
          {!!relations.data?.filter((r) => r.type !== 'articles').length && (
            <section>
              <h2>Related reading and Mezmur</h2>
              <ul>
                {relations.data
                  .filter((r) => r.type !== 'articles')
                  .map((r) => (
                  <li key={r.type + r.id}>
                    <Link to={contentPath(r.type, r.slug)}>{r.title}</Link>{' '}
                    <small>({r.type})</small>
                  </li>
                ))}
              </ul>
            </section>
          )}
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
