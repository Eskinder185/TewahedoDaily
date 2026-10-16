import { useCallback, useEffect, useId, useMemo, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import { imageManifest } from '../../content/imageManifest'
import { resolveContentMediaUrl } from '../../lib/cms/contentMedia'
import { listHomepageSlides, type HomepageSlide } from '../../lib/cms/homepageService'
import { useLocale } from '../../lib/i18n/locale'
import styles from './HeroSection.module.css'

const HERO_QUICK_LINKS = [
  { key: 'bible', to: '/bible' },
  { key: 'pray', to: '/pray' },
  { key: 'hymns', to: '/practice' },
  { key: 'calendar', to: '/calendar' },
  { key: 'learn', to: '/pray/learn-how-to-pray' },
] as const

type SlideView = {
  id: string
  eyebrow: string
  title: string
  titleAmharic: string
  subtitle: string
  imageUrl: string
  imageAlt: string
  animation: HomepageSlide['animation_style']
  duration: number
}

/**
 * Map CMS slides into the active UI locale.
 * - Amharic UI: prefer title_amharic / localized chrome strings; keep English CMS
 *   title as secondary only when it differs (does not invent religious copy).
 * - English UI: CMS English fields with Amharic secondary when present.
 */
function toView(slide: HomepageSlide, fallback: SlideView, preferAmharic: boolean): SlideView {
  const cmsTitleEn = slide.title?.trim() || ''
  const cmsTitleAm = slide.title_amharic?.trim() || ''
  const cmsEyebrow = slide.eyebrow?.trim() || ''
  const cmsSubtitle = slide.subtitle?.trim() || ''

  if (preferAmharic) {
    const title = cmsTitleAm || fallback.title
    const secondaryEn = cmsTitleEn && cmsTitleEn !== title ? cmsTitleEn : ''
    return {
      id: slide.id,
      eyebrow: fallback.eyebrow,
      title,
      titleAmharic: secondaryEn,
      subtitle: fallback.subtitle,
      imageUrl: resolveContentMediaUrl(slide.image_path) || fallback.imageUrl,
      imageAlt: slide.image_alt?.trim() || fallback.imageAlt,
      animation: slide.animation_style || 'fade',
      duration: slide.display_duration || 7000,
    }
  }

  return {
    id: slide.id,
    eyebrow: cmsEyebrow || fallback.eyebrow,
    title: cmsTitleEn || fallback.title,
    titleAmharic: cmsTitleAm,
    subtitle: cmsSubtitle || fallback.subtitle,
    imageUrl: resolveContentMediaUrl(slide.image_path) || fallback.imageUrl,
    imageAlt: slide.image_alt?.trim() || fallback.imageAlt,
    animation: slide.animation_style || 'fade',
    duration: slide.display_duration || 7000,
  }
}

export function HeroSection() {
  const t = useTranslation()
  const { uiLocale } = useLocale()
  const preferAmharic = uiLocale === 'am'
  const headingId = useId()
  const reducedMotion = useRef(
    typeof window !== 'undefined' &&
      window.matchMedia('(prefers-reduced-motion: reduce)').matches,
  )

  const fallback = useMemo<SlideView>(
    () => ({
      id: 'fallback',
      eyebrow: t('home.hero.eyebrow'),
      title: t('home.hero.title'),
      titleAmharic: '',
      subtitle: t('home.hero.tagline'),
      imageUrl: imageManifest.home.hero,
      imageAlt: '',
      animation: 'fade',
      duration: 7000,
    }),
    [t],
  )

  const [slides, setSlides] = useState<SlideView[]>([fallback])
  const [index, setIndex] = useState(0)
  const [paused, setPaused] = useState(false)

  const load = useCallback(async () => {
    try {
      const rows = await listHomepageSlides(false)
      if (!rows.length) {
        setSlides([fallback])
        return
      }
      setSlides(rows.map((row) => toView(row, fallback, preferAmharic)))
      setIndex(0)
    } catch {
      setSlides([fallback])
    }
  }, [fallback, preferAmharic])

  useEffect(() => {
    void load()
  }, [load])

  const current = slides[Math.min(index, slides.length - 1)] || fallback
  const multi = slides.length > 1

  useEffect(() => {
    if (!multi || paused || reducedMotion.current) return
    const duration = current.duration || 7000
    const timer = window.setTimeout(() => {
      setIndex((prev) => (prev + 1) % slides.length)
    }, duration)
    return () => window.clearTimeout(timer)
  }, [multi, paused, current.duration, index, slides.length])

  useEffect(() => {
    if (!multi) return
    function onKey(event: KeyboardEvent) {
      if (event.key === 'ArrowLeft') {
        event.preventDefault()
        setIndex((prev) => (prev - 1 + slides.length) % slides.length)
      }
      if (event.key === 'ArrowRight') {
        event.preventDefault()
        setIndex((prev) => (prev + 1) % slides.length)
      }
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [multi, slides.length])

  const animationClass =
    current.animation === 'slide'
      ? styles.animSlide
      : current.animation === 'crossfade'
        ? styles.animCrossfade
        : styles.animFade

  return (
    <section
      className={styles.hero}
      aria-labelledby={headingId}
      aria-roledescription={multi ? 'carousel' : undefined}
      onMouseEnter={() => setPaused(true)}
      onMouseLeave={() => setPaused(false)}
      onFocusCapture={() => setPaused(true)}
      onBlurCapture={(event) => {
        if (!event.currentTarget.contains(event.relatedTarget as Node | null)) {
          setPaused(false)
        }
      }}
    >
      <div className={styles.backdrop} aria-hidden>
        {slides.map((slide, slideIndex) => {
          const isFallbackHero = slide.imageUrl === imageManifest.home.hero || slide.id === 'fallback'
          return (
            <img
              key={slide.id}
              src={slide.imageUrl}
              srcSet={isFallbackHero ? imageManifest.home.heroSrcSet : undefined}
              alt=""
              className={`${styles.backdropImg} ${animationClass} ${
                slideIndex === index ? styles.backdropActive : styles.backdropIdle
              }`}
              width={imageManifest.home.heroWidth}
              height={imageManifest.home.heroHeight}
              sizes="100vw"
              fetchPriority={slideIndex === 0 ? 'high' : 'low'}
              loading={slideIndex === 0 ? 'eager' : 'lazy'}
              decoding="async"
            />
          )
        })}
        <div className={styles.backdropScrim} />
      </div>
      <div className={styles.aurora} aria-hidden />
      <div className={styles.inner}>
        <div className={`${styles.main} ${animationClass}`} key={current.id}>
          <p className={styles.eyebrow}>{current.eyebrow}</p>
          <h1 id={headingId} className={styles.title}>
            {current.title}
          </h1>
          {current.titleAmharic ? (
            <p className={styles.titleAm} lang={preferAmharic ? 'en' : 'am'}>
              {current.titleAmharic}
            </p>
          ) : null}
          <p className={styles.tagline}>{current.subtitle}</p>
          <nav className={styles.quickNav} aria-label={t('home.hero.quickNavLabel')}>
            {HERO_QUICK_LINKS.map((item) => (
              <Link key={item.key} to={item.to} className={styles.quickChip}>
                {t(`home.hero.quickNav.${item.key}`)}
              </Link>
            ))}
          </nav>
        </div>

        {multi ? (
          <div className={styles.controls}>
            <button
              type="button"
              className={styles.controlBtn}
              aria-label={t('home.hero.prevSlide')}
              onClick={() => setIndex((prev) => (prev - 1 + slides.length) % slides.length)}
            >
              ‹
            </button>
            <div className={styles.dots} role="group" aria-label={t('home.hero.slidesLabel')}>
              {slides.map((slide, slideIndex) => (
                <button
                  key={slide.id}
                  type="button"
                  aria-pressed={slideIndex === index}
                  aria-label={t('home.hero.slideN', { n: slideIndex + 1 })}
                  className={`${styles.dot} ${slideIndex === index ? styles.dotActive : ''}`}
                  onClick={() => setIndex(slideIndex)}
                />
              ))}
            </div>
            <button
              type="button"
              className={styles.controlBtn}
              aria-label={t('home.hero.nextSlide')}
              onClick={() => setIndex((prev) => (prev + 1) % slides.length)}
            >
              ›
            </button>
          </div>
        ) : null}
      </div>
    </section>
  )
}
