import { useEffect, useState } from 'react'
import { Link, useLocation } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import { useGlobalAudio } from '../../lib/publicContent/audio'
import type { MezmurCard } from '../../lib/publicContent/service'
import {
  clearPracticeContinue,
  getPracticeContinue,
  type PracticeContinueSession,
} from '../../lib/practice/practiceContinueSession'
import styles from './PracticeContinueDock.module.css'

function toPlayableTrack(session: PracticeContinueSession): MezmurCard {
  return {
    id: session.slug,
    slug: session.slug,
    title: session.title,
    title_amharic: null,
    thumbnail_url: null,
    audio_url: session.audioUrl || '',
    youtube_url: null,
    featured: false,
    published_at: null,
    created_at: '',
    singer_name: null,
    category_name: null,
    languages: [],
    form: 'mezmur',
    language: null,
    category: null,
    occasion: null,
    saint_or_angel: null,
    themes: [],
  } as MezmurCard
}

/**
 * Cross-route “continue mezmur” dock. Persists last practice session in
 * sessionStorage; audio resumes via GlobalAudio when a URL is available.
 */
export function PracticeContinueDock() {
  const t = useTranslation()
  const location = useLocation()
  const globalAudio = useGlobalAudio()
  const [session, setSession] = useState<PracticeContinueSession | null>(() => getPracticeContinue())

  useEffect(() => {
    const sync = () => setSession(getPracticeContinue())
    window.addEventListener('td-practice-continue', sync)
    window.addEventListener('storage', sync)
    return () => {
      window.removeEventListener('td-practice-continue', sync)
      window.removeEventListener('storage', sync)
    }
  }, [])

  if (!session) return null
  if (location.pathname.includes(`/practice/mezmur/${session.slug}`)) return null

  return (
    <aside className={styles.dock} aria-label={t('practice.continueDock.aria')}>
      <Link className={styles.main} to={session.route}>
        <span className={styles.eyebrow}>{t('practice.continueDock.eyebrow')}</span>
        <strong className={styles.title}>{session.title}</strong>
      </Link>
      <div className={styles.actions}>
        {session.audioUrl ? (
          <button
            type="button"
            className={styles.play}
            onClick={() => globalAudio.play(toPlayableTrack(session), [])}
          >
            {t('practice.continueDock.play')}
          </button>
        ) : null}
        <Link className={styles.open} to={session.route}>
          {t('practice.continueDock.open')}
        </Link>
        <button
          type="button"
          className={styles.close}
          aria-label={t('practice.continueDock.dismiss')}
          onClick={() => {
            clearPracticeContinue()
            setSession(null)
          }}
        >
          ×
        </button>
      </div>
    </aside>
  )
}
