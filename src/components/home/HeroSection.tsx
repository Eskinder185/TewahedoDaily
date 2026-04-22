import { imageManifest } from '../../content/imageManifest'
import { ButtonLink } from '../ui/ButtonLink'
import styles from './HeroSection.module.css'

export function HeroSection() {
  return (
    <section className={styles.hero} aria-labelledby="hero-heading">
      <div className={styles.backdrop} aria-hidden>
        <img
          src={imageManifest.home.hero}
          alt=""
          className={styles.backdropImg}
          width={imageManifest.home.heroWidth}
          height={imageManifest.home.heroHeight}
          sizes="100vw"
          fetchPriority="high"
          decoding="async"
        />
        <div className={styles.backdropScrim} />
      </div>
      <div className={styles.aurora} aria-hidden />
      <div className={styles.inner}>
        <div className={styles.main}>
          <p className={styles.eyebrow}>Tewahedo Daily</p>
          <h1 id="hero-heading" className={styles.title}>
            Your daily church companion
          </h1>
          <p className={styles.tagline}>
            Prayer, hymns, and the Ethiopian Orthodox calendar — gathered in one quiet
            place.
          </p>
          <div className={styles.actions}>
            <ButtonLink to="/practice">Explore Practice</ButtonLink>
            <ButtonLink to="/calendar" variant="ghost">
              See Today in Church
            </ButtonLink>
          </div>
        </div>
      </div>
    </section>
  )
}
