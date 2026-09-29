import { lazy, Suspense, useCallback, useMemo, useState } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import {
  detail,
  publicMezmurToPracticePayload,
  type PublicMezmur,
} from '../lib/publicContent/service'
import { useAsync } from '../lib/cms/useAsync'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import { useGlobalAudio } from '../lib/publicContent/audio'
import { Artwork, Notice } from '../components/publicContent/PublicUi'
import { FavoriteButton } from '../components/publicContent/FavoriteButton'
import { parseYoutubeVideoId } from '../data/utils/youtube'
import s from '../components/publicContent/PublicContent.module.css'

const ChantPracticePlayer = lazy(() =>
  import('../components/practice/ChantPracticePlayer').then((m) => ({
    default: m.ChantPracticePlayer,
  })),
)

export function PublicMezmurDetail() {
  const { slug } = useParams()
  const result = useAsync(useCallback(() => detail(slug || ''), [slug]))
  return (
    <section className={s.shell}>
      <Link to="/practice">← Mezmur library</Link>
      <Notice {...result} retry={result.reload} />
      {!result.loading && !result.error && !result.data && (
        <>
          <h1>Mezmur not found</h1>
          <p>This hymn is not currently published.</p>
          <div className={s.actions}>
            <Link to="/practice">Back to library</Link>
            <Link to="/submit-mezmur">Contribute a Mezmur</Link>
          </div>
        </>
      )}
      {result.data && <MezmurBody key={result.data.id} item={result.data} />}
    </section>
  )
}

function MezmurBody({ item }: { item: PublicMezmur }) {
  const navigate = useNavigate()
  const choices = (
    [
      { key: 'lyrics_amharic', label: 'Amharic lyrics', lang: 'am' },
      { key: 'lyrics_english', label: 'English lyrics', lang: 'en' },
      { key: 'lyrics_oromo', label: 'Oromo lyrics', lang: 'om' },
      { key: 'transliteration', label: 'Transliteration', lang: 'en' },
    ] as const
  ).filter((choice) => item[choice.key]?.trim())
  const [active, setActive] = useState<string>(choices[0]?.key || '')
  const audio = useGlobalAudio()
  const [showVideo, setShowVideo] = useState(false)
  const video = parseYoutubeVideoId(item.youtube_url || '')
  const canonical = window.location.origin + '/practice/mezmur/' + item.slug
  const description = (
    item.description ||
    `${item.title}${item.singer_name ? ' by ' + item.singer_name : ''}. Read lyrics and listen on Tewahedo Daily.`
  ).slice(0, 180)
  usePageMeta(
    item.title,
    description,
    item.thumbnail_url?.startsWith('https:') ? item.thumbnail_url : undefined,
    canonical,
  )

  const practicePayload = useMemo(() => publicMezmurToPracticePayload(item), [item])
  const badges = [
    item.form === 'werb' ? 'Werb' : 'Mezmur',
    ...item.languages,
    item.category_name,
    item.singer_name,
  ].filter(Boolean) as string[]

  return (
    <article>
      <header>
        {item.category_name ? <p className={s.eyebrow}>{item.category_name}</p> : null}
        <h1>{item.title}</h1>
        {item.title_amharic ? <p lang="am">{item.title_amharic}</p> : null}
        {item.title_oromo ? <p lang="om">{item.title_oromo}</p> : null}
        {item.singer_name ? <p>{item.singer_name}</p> : null}
        {item.description ? <p>{item.description}</p> : null}
        {item.tags.length > 0 ? (
          <div className={s.actions}>
            {item.tags.map((tag) => (
              <Link
                key={tag.id}
                to={`/practice?${new URLSearchParams(
                  tag.kind === 'occasion' ? { occasion: tag.slug } : { q: tag.name },
                )}`}
              >
                {tag.name}
              </Link>
            ))}
          </div>
        ) : null}
      </header>

      {(practicePayload.videoId ||
        practicePayload.audioUrl ||
        practicePayload.lyricsGez ||
        practicePayload.transliterationLyrics) && (
        <Suspense fallback={<p role="status">Loading practice player…</p>}>
          <ChantPracticePlayer
            payload={practicePayload}
            formLabel={item.form === 'werb' ? 'Werb' : 'Mezmur'}
            onBack={() => navigate('/practice')}
            backLabel="Back to library"
            badges={badges}
          />
        </Suspense>
      )}

      <div className={s.detail}>
        <div>
          {choices.length > 0 ? (
            <div className={s.tabs} aria-label="Lyrics language">
              {choices.map((choice) => (
                <button
                  key={choice.key}
                  type="button"
                  aria-pressed={active === choice.key}
                  onClick={() => setActive(choice.key)}
                >
                  {choice.label}
                </button>
              ))}
            </div>
          ) : null}
          {choices
            .filter((choice) => choice.key === active)
            .map((choice) => (
              <section key={choice.key}>
                <h2>{choice.label}</h2>
                <p className={s.lyrics} lang={choice.lang}>
                  {item[choice.key]}
                </p>
              </section>
            ))}
          {!choices.length && (
            <p>Lyrics have not been added yet. You can suggest them below.</p>
          )}
        </div>
        <aside>
          <Artwork reference={item.thumbnail_url} title={item.title} />
          <div className={s.actions}>
            {item.audio_url ? (
              <button
                type="button"
                onClick={() => {
                  setShowVideo(false)
                  audio.play(item)
                }}
              >
                Play audio
              </button>
            ) : null}
            <FavoriteButton id={item.id} />
          </div>
          {video ? (
            <>
              {showVideo ? (
                <iframe
                  className={s.video}
                  src={`https://www.youtube-nocookie.com/embed/${video}`}
                  title={`${item.title} on YouTube`}
                  allow="encrypted-media; picture-in-picture"
                  allowFullScreen
                />
              ) : (
                <button
                  type="button"
                  onClick={() => {
                    audio.stop()
                    setShowVideo(true)
                  }}
                >
                  Load YouTube player
                </button>
              )}
              <p>
                <a
                  href={`https://www.youtube.com/watch?v=${video}`}
                  target="_blank"
                  rel="noreferrer"
                >
                  Watch on YouTube ↗
                </a>
              </p>
            </>
          ) : null}
          <Link
            to={`/suggest-correction?${new URLSearchParams({
              content_id: item.id,
              title: item.title,
              page: canonical,
            })}`}
          >
            Suggest a Correction
          </Link>
          {item.contributor_credit ? (
            <p>Contributed by {item.contributor_credit}</p>
          ) : null}
        </aside>
      </div>
    </article>
  )
}
