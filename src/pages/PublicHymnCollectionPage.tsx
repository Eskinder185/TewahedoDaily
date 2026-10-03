import { useEffect, useMemo, useState } from 'react'
import { Link, useParams, useSearchParams } from 'react-router-dom'
import { pageNumber, PAGE_SIZE, type MezmurCard } from '../lib/publicContent/service'
import {
  loadHymnBrowseIndex,
  getZemariPublicBySlug,
  listPublishedMezmursForZemari,
  type HymnBrowseCard,
  type HymnBrowseKind,
} from '../lib/publicContent/hymnBrowse'
import { hymnCardMeta } from '../lib/publicContent/labels'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import { parseYoutubeVideoId, youtubeThumbnailUrl } from '../data/utils/youtube'
import { publicMedia } from '../lib/publicContent/service'
import s from './HymnPractice.module.css'
import { HymnBrowseCardView } from '../components/practice/HymnBrowseCard'

function CardArt({ item }: { item: MezmurCard }) {
  const [src, setSrc] = useState('')
  const [failed, setFailed] = useState(false)
  useEffect(() => {
    let active = true
    const videoId = parseYoutubeVideoId(item.youtube_url || '')
    const yt = videoId ? youtubeThumbnailUrl(videoId) || '' : ''
    void publicMedia(item.thumbnail_url)
      .then((url) => {
        if (active) setSrc(url || yt)
      })
      .catch(() => {
        if (active) setSrc(yt)
      })
    return () => {
      active = false
    }
  }, [item.thumbnail_url, item.youtube_url])
  if (!src || failed) return <div className={s.art} aria-hidden>✣</div>
  return (
    <img
      className={s.art}
      src={src}
      alt=""
      loading="lazy"
      decoding="async"
      onError={() => setFailed(true)}
    />
  )
}

type CollectionMode = HymnBrowseKind | 'occasions' | 'categories' | 'singers'

function modeFromPath(pathname: string, paramKind?: string): CollectionMode {
  if (paramKind === 'occasion' || pathname.includes('/occasion/')) return 'occasion'
  if (paramKind === 'category' || pathname.includes('/category/')) return 'category'
  if (
    paramKind === 'singer' ||
    pathname.includes('/singer/') ||
    pathname.includes('/zemari/')
  ) {
    return 'singer'
  }
  if (pathname.endsWith('/occasions')) return 'occasions'
  if (pathname.endsWith('/categories')) return 'categories'
  if (pathname.endsWith('/singers') || pathname.endsWith('/zemaris')) return 'singers'
  return 'occasions'
}

/**
 * Focused collection page for an occasion / category / singer,
 * or an index of all browse cards of one kind.
 */
export function PublicHymnCollectionPage({
  kind: kindProp,
}: {
  kind?: CollectionMode
}) {
  const { slug = '' } = useParams()
  const [params, setParams] = useSearchParams()
  const kind = kindProp || modeFromPath(window.location.pathname)
  const isIndex = kind === 'occasions' || kind === 'categories' || kind === 'singers'
  const detailKind: HymnBrowseKind =
    kind === 'occasions' || kind === 'occasion'
      ? 'occasion'
      : kind === 'categories' || kind === 'category'
        ? 'category'
        : 'singer'

  const [group, setGroup] = useState<HymnBrowseCard | null>(null)
  const [allCards, setAllCards] = useState<HymnBrowseCard[]>([])
  const [items, setItems] = useState<MezmurCard[]>([])
  const [total, setTotal] = useState(0)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string>()
  const [withinQ, setWithinQ] = useState(params.get('q') || '')

  const title = isIndex
    ? kind === 'occasions'
      ? 'All Occasions'
      : kind === 'categories'
        ? 'All Categories'
        : 'All Zemari'
    : group?.name || 'Hymns'

  usePageMeta(title, group?.description || 'Browse Ethiopian Orthodox Mezmur by collection.')

  useEffect(() => {
    let active = true
    setLoading(true)
    setError(undefined)
    void (async () => {
      try {
        if (detailKind === 'singer' && !isIndex) {
          const found = await getZemariPublicBySlug(slug)
          if (!active) return
          setGroup(found)
          setAllCards([])
          if (!found) setLoading(false)
          return
        }

        const index = await loadHymnBrowseIndex()
        if (!active) return
        const list =
          detailKind === 'occasion'
            ? index.occasions
            : detailKind === 'category'
              ? index.categories
              : index.singers
        setAllCards(list)
        if (!isIndex) {
          const found = list.find((c) => c.slug === slug) || null
          setGroup(found)
        } else {
          setLoading(false)
        }
      } catch (cause) {
        if (!active) return
        setError(cause instanceof Error ? cause.message : 'Unable to load collection.')
        setLoading(false)
      }
    })()
    return () => {
      active = false
    }
  }, [detailKind, isIndex, slug])

  const page = pageNumber(params)
  const filterKey = useMemo(() => {
    if (isIndex || !group) return ''
    const next = new URLSearchParams()
    if (withinQ.trim()) next.set('q', withinQ.trim())
    if (detailKind === 'occasion') next.set('occasion', group.name)
    if (detailKind === 'category') next.set('category', group.name)
    if (detailKind === 'singer') next.set('singer', group.id)
    next.set('page', String(page))
    return next.toString()
  }, [detailKind, group, isIndex, page, withinQ])

  useEffect(() => {
    if (isIndex || !group) return
    let active = true
    setLoading(true)
    setError(undefined)
    void (async () => {
      try {
        let rows: (MezmurCard & { zemari_id?: string | null })[] = []

        if (detailKind === 'singer') {
          const linked = await listPublishedMezmursForZemari(group.id)
          rows = linked.map((row) => ({
            id: row.id,
            slug: row.slug,
            title: row.title,
            title_amharic: row.title_amharic,
            thumbnail_url: row.thumbnail_url,
            audio_url: null as string | null,
            youtube_url: row.youtube_url,
            featured: false,
            published_at: null as string | null,
            created_at: '',
            singer_name: row.singer_name,
            zemari_id: group.id,
            category_name: null as string | null,
            languages: row.language ? [row.language] : [],
            form: (row.form as MezmurCard['form']) || null,
            language: row.language,
            category: null as string | null,
            occasion: null as string | null,
            saint_or_angel: null as string | null,
            themes: [] as string[],
          }))
        } else {
          const { listImportMezmurCards } = await import('../lib/publicContent/hymnBrowse')
          const { supabase } = await import('../lib/supabase/client')
          const cards = await listImportMezmurCards(1000)
          rows = cards.map((row) => ({
            id: row.id,
            slug: row.slug,
            title: row.title,
            title_amharic: row.title_amharic,
            thumbnail_url: row.thumbnail_url,
            audio_url: null as string | null,
            youtube_url: row.youtube_url,
            featured: false,
            published_at: null as string | null,
            created_at: '',
            singer_name: row.singer_name,
            zemari_id: row.zemari_id,
            category_name: null as string | null,
            languages: row.language ? [row.language] : [],
            form: (row.form as MezmurCard['form']) || null,
            language: row.language,
            category: null as string | null,
            occasion: null as string | null,
            saint_or_angel: null as string | null,
            themes: [] as string[],
          })) as (MezmurCard & { zemari_id?: string | null })[]

          if (detailKind === 'occasion' && supabase) {
            const { data } = await supabase
              .from('mezmur_occasion_links_import' as never)
              .select('mezmur_slug')
              .eq('occasion_slug', group.slug)
            const slugs = new Set(
              ((data || []) as Array<{ mezmur_slug?: string }>).map((r) =>
                String(r.mezmur_slug || ''),
              ),
            )
            rows = rows.filter((item) => slugs.has(item.slug))
          } else if (detailKind === 'category' && supabase) {
            const { data } = await supabase
              .from('mezmur_category_links_import' as never)
              .select('mezmur_slug')
              .eq('category_slug', group.slug)
            const slugs = new Set(
              ((data || []) as Array<{ mezmur_slug?: string }>).map((r) =>
                String(r.mezmur_slug || ''),
              ),
            )
            rows = rows.filter((item) => slugs.has(item.slug))
          }
        }

        if (withinQ.trim()) {
          const q = withinQ.trim().toLowerCase()
          rows = rows.filter((item) =>
            `${item.title} ${item.title_amharic || ''} ${item.singer_name || ''}`
              .toLowerCase()
              .includes(q),
          )
        }
        if (!active) return
        const from = (page - 1) * PAGE_SIZE
        setItems(rows.slice(from, from + PAGE_SIZE))
        setTotal(rows.length)
        setLoading(false)
      } catch (cause) {
        if (!active) return
        if (import.meta.env.DEV) console.error('[hymn practice] collection hymns', cause)
        setError('Unable to load Hymns.')
        setLoading(false)
      }
    })()
    return () => {
      active = false
    }
  }, [detailKind, filterKey, group, isIndex, withinQ])

  if (isIndex) {
    return (
      <section className={s.page}>
        <p className={s.backRow}>
          <Link to="/practice" className={s.viewAll}>
            ← Back to Hymns
          </Link>
        </p>
        <header className={s.intro}>
          <h1 className={s.title}>{title}</h1>
        </header>
        {loading ? <p className={s.status}>Loading…</p> : null}
        {error ? (
          <p className={s.status} role="alert">
            {error}
          </p>
        ) : null}
        {!loading && !error && allCards.length === 0 ? (
          <p className={s.browseEmpty}>
            {kind === 'singers'
              ? 'No published Zemari profiles with linked Mezmurs are available yet. Browse Hymns for feast and saint collections, or open Search Buddy to find a singer by name.'
              : 'No published items are available in this browse list yet.'}{' '}
            <Link to="/practice">Back to Hymns</Link>
          </p>
        ) : null}
        <div className={s.browseGrid}>
          {allCards.map((card) => (
            <HymnBrowseCardView key={card.id} card={card} />
          ))}
        </div>
        {!loading && !error && kind === 'singers' && allCards.length > 0 && allCards.length < 4 ? (
          <p className={s.browseEmpty}>
            A growing library — only published Zemari profiles with linked Mezmurs appear here.
          </p>
        ) : null}
      </section>
    )
  }

  return (
    <section className={s.page}>
      <p className={s.backRow}>
        <Link to="/practice" className={s.viewAll}>
          ← Back to Hymns
        </Link>
      </p>

      {!group && !loading ? (
        <p className={s.status}>Collection not found.</p>
      ) : (
        <>
          <header className={s.collectionHero}>
            {group?.imageUrl ? (
              <img
                className={s.collectionArt}
                src={group.imageUrl}
                alt={group.imageAlt || group.name}
                width={640}
                height={480}
              />
            ) : (
              <div className={s.collectionArtEmpty} aria-hidden>
                {(group?.name || '?').trim().charAt(0).toUpperCase()}
              </div>
            )}
            <div>
              {group?.nameAmharic ? (
                <p className={s.collectionAm} lang="am">
                  {group.nameAmharic}
                </p>
              ) : null}
              <h1 className={s.title}>{group?.name || '…'}</h1>
              {group?.description?.trim() ? (
                <p className={s.subtitle}>{group.description}</p>
              ) : detailKind === 'singer' ? (
                <p className={s.subtitle}>
                  Published Mezmurs linked to this Zemari. Biographical notes will appear when
                  editors add them.
                </p>
              ) : null}
              <p className={s.collectionCount}>
                {group ? `${group.mezmurCount} Mezmur${group.mezmurCount === 1 ? '' : 's'}` : ''}
              </p>
            </div>
          </header>

          <label className={s.withinSearch}>
            <span className={s.srOnly}>Search within this collection</span>
            <input
              className={s.searchInput}
              value={withinQ}
              onChange={(e) => {
                setWithinQ(e.target.value)
                const next = new URLSearchParams(params)
                if (e.target.value.trim()) next.set('q', e.target.value.trim())
                else next.delete('q')
                next.delete('page')
                setParams(next, { replace: true })
              }}
              placeholder={`Search within ${group?.name || 'collection'}…`}
            />
          </label>

          {loading ? <p className={s.status}>Loading hymns…</p> : null}
          {error ? (
            <p className={s.status} role="alert">
              {error}
            </p>
          ) : null}
          {!loading && !items.length ? (
            <p className={s.status}>No published hymns in this collection yet.</p>
          ) : null}

          <div className={s.grid}>
            {items.map((item) => (
              <Link key={item.id} to={`/practice/mezmur/${item.slug}`} className={s.card}>
                <CardArt item={item} />
                <div className={s.cardBody}>
                  {item.title_amharic ? (
                    <p className={s.cardAm} lang="am">
                      {item.title_amharic}
                    </p>
                  ) : null}
                  <h2 className={s.cardTitle}>{item.title}</h2>
                  <p className={s.cardMeta}>{hymnCardMeta(item)}</p>
                </div>
              </Link>
            ))}
          </div>

          {total > PAGE_SIZE ? (
            <p className={s.hint}>
              Showing page {page}. Use search within this collection to narrow results.
            </p>
          ) : null}
        </>
      )}
    </section>
  )
}
