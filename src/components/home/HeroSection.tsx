import { useCallback, useEffect, useId, useRef, useState } from 'react'
import { useTranslation } from '../../i18n'
import { imageManifest } from '../../content/imageManifest'
import { ButtonLink } from '../ui/ButtonLink'
import { resolveContentMediaUrl } from '../../lib/cms/contentMedia'
import { listHomepageSlides, type HomepageSlide } from '../../lib/cms/homepageService'
import styles from './HeroSection.module.css'

type SlideView = {
  id: string
  eyebrow: string
  title: string
  titleAmharic: string
  subtitle: string
  imageUrl: string
  imageAlt: string
  primaryLabel: string
  primaryUrl: string
  secondaryLabel: string
  secondaryUrl: string
  animation: HomepageSlide['animation_style']
  duration: number
}

function toView(slide: HomepageSlide, fallback: SlideView): SlideView {
  return {
    id: slide.id,
    eyebrow: slide.eyebrow?.trim() || fallback.eyebrow,
    title: slide.title?.trim() || fallback.title,
    titleAmharic: slide.title_amharic?.trim() || '',
    subtitle: slide.subtitle?.trim() || fallback.subtitle,
    imageUrl: resolveContentMediaUrl(slide.image_path) || fallback.imageUrl,
    imageAlt: slide.image_alt?.trim() || fallback.imageAlt,
    primaryLabel: slide.primary_button_label?.trim() || fallback.primaryLabel,
    primaryUrl: slide.primary_button_url?.trim() || fallback.primaryUrl,
    secondaryLabel: slide.secondary_button_label?.trim() || fallback.secondaryLabel,
    secondaryUrl: slide.secondary_button_url?.trim() || fallback.secondaryUrl,
    animation: slide.animation_style || 'fade',
    duration: slide.display_duration || 7000,
  }
}

export function HeroSection() {
  const t = useTranslation()
  const headingId = useId()
  const reducedMotion = useRef(
    typeof window !== 'undefined' &&
      window.matchMedia('(prefers-reduced-motion: reduce)').matches,
  )

  const fallback: SlideView = {
    id: 'fallback',
    eyebrow: t('home.hero.eyebrow'),
    title: t('home.hero.title'),
    titleAmharic: '',
    subtitle: t('home.hero.tagline'),
    imageUrl: imageManifest.home.hero,
    imageAlt: '',
    primaryLabel: t('home.hero.primaryCta'),
    primaryUrl: '/practice',
    secondaryLabel: t('home.hero.secondaryCta'),
    secondaryUrl: '/today',
    animation: 'fade',
    duration: 7000,
  }

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
      setSlides(rows.map((row) => toView(row, fallback)))
      setIndex(0)
    } catch {
      setSlides([fallback])
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

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
            <p className={styles.titleAm} lang="am">
              {current.titleAmharic}
            </p>
          ) : null}
          <p className={styles.tagline}>{current.subtitle}</p>
          <div className={styles.actions}>
            <ButtonLink to={current.primaryUrl}>{current.primaryLabel}</ButtonLink>
            <ButtonLink to={current.secondaryUrl} variant="ghost" className={styles.secondaryCta}>
              {current.secondaryLabel}
            </ButtonLink>
          </div>
        </div>

        {multi ? (
          <div className={styles.controls}>
            <button
              type="button"
              className={styles.controlBtn}
              aria-label="Previous slide"
              onClick={() => setIndex((prev) => (prev - 1 + slides.length) % slides.length)}
            >
              ‹
            </button>
            <div className={styles.dots} role="tablist" aria-label="Homepage slides">
              {slides.map((slide, slideIndex) => (
                <button
                  key={slide.id}
                  type="button"
                  role="tab"
                  aria-selected={slideIndex === index}
                  aria-label={`Slide ${slideIndex + 1}`}
                  className={`${styles.dot} ${slideIndex === index ? styles.dotActive : ''}`}
                  onClick={() => setIndex(slideIndex)}
                />
              ))}
            </div>
            <button
              type="button"
              className={styles.controlBtn}
              aria-label="Next slide"
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
