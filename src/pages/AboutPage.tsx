import { Link } from 'react-router-dom'
import { imageManifest } from '../content/imageManifest'
import { PageSection } from '../components/ui/PageSection'
import { ButtonLink } from '../components/ui/ButtonLink'
import styles from './AboutPage.module.css'

const helps = [
  {
    id: 'day',
    label: 'The Church day',
    line: 'A quick sense of what today is — feast, season, and a short “why it matters.”',
  },
  {
    id: 'chants',
    label: 'Chants',
    line: 'Mezmur and werb together: listen, read transliteration, and open lyrics or watch only when you choose.',
  },
  {
    id: 'prayers',
    label: 'Prayers',
    line: 'Daily prayers, Wudase, and Mezmure Dawit — under the Prayers hub, with full text when you choose to open it.',
  },
  {
    id: 'calendar',
    label: 'Calendar & seasons',
    line: 'A simple calendar view and notes on fasts and feasts — always pointed back to your parish.',
  },
] as const

export function AboutPage() {
  return (
    <>
      <PageSection>
        <header className={styles.heroBand}>
          <div className={styles.heroBackdrop} aria-hidden>
            <img
              src={imageManifest.about.hero}
              alt=""
              className={styles.heroBackdropImg}
              width={imageManifest.about.heroWidth}
              height={imageManifest.about.heroHeight}
              sizes="(max-width: 768px) 100vw, min(44rem, 90vw)"
              fetchPriority="high"
              decoding="async"
            />
            <div className={styles.heroBackdropScrim} />
          </div>
          <div className={styles.heroFront}>
            <p className={styles.eyebrow}>About</p>
            <h1 className={styles.title}>Tewahedo Daily</h1>
            <p className={styles.lede}>
              A quiet corner of the internet for Ethiopian Orthodox Christians who want
              to stay close to the Church between Sundays — in minutes, not marathons.
            </p>
          </div>
        </header>
      </PageSection>

      <PageSection variant="tint">
        <section className={styles.section} aria-labelledby="about-what">
          <div className={styles.sectionAccent} aria-hidden />
          <div className={styles.sectionInner}>
            <h2 id="about-what" className={styles.h2}>
              What this website is
            </h2>
            <p className={styles.p}>
              Tewahedo Daily is a <strong>daily companion</strong>: short lessons,
              practice for chants and movement, a dedicated Prayers area for tselot and
              scripture, and a snapshot of today in
              the Church calendar. It is built for phones and busy days — so you can
              touch prayer and tradition without feeling buried in text.
            </p>
            <p className={styles.pMuted}>
              We are not a encyclopedia or a social feed. We are trying to be faithful,
              small, and useful.
            </p>
          </div>
        </section>
      </PageSection>

      <PageSection>
        <section className={styles.section} aria-labelledby="about-who">
          <div className={styles.sectionAccent} aria-hidden />
          <div className={styles.sectionInner}>
            <h2 id="about-who" className={styles.h2}>
              Who it is for
            </h2>
            <ul className={styles.bullets}>
              <li>
                <span className={styles.bulletMark} aria-hidden />
                Ethiopians in the diaspora — especially when parish life is far away
                or schedules are tight.
              </li>
              <li>
                <span className={styles.bulletMark} aria-hidden />
                Beginners who need a gentle place to start, without shame for not
                knowing every hymn or rubric yet.
              </li>
              <li>
                <span className={styles.bulletMark} aria-hidden />
                Anyone who already loves the Church and simply wants a{' '}
                <em>lighter</em> rhythm between liturgy, work, and family.
              </li>
            </ul>
          </div>
        </section>
      </PageSection>

      <PageSection variant="tint">
        <section className={styles.helps} aria-labelledby="about-helps">
          <h2 id="about-helps" className={styles.helpsTitle}>
            What it helps with
          </h2>
          <p className={styles.helpsIntro}>
            Four threads — each one optional. Pick what fits the day.
          </p>
          <ul className={styles.helpGrid}>
            {helps.map((h) => (
              <li key={h.id} className={styles.helpCard}>
                <span className={styles.helpIcon} aria-hidden />
                <h3 className={styles.helpLabel}>{h.label}</h3>
                <p className={styles.helpLine}>{h.line}</p>
              </li>
            ))}
          </ul>
        </section>
      </PageSection>

      <PageSection>
        <section className={styles.section} aria-labelledby="about-how">
          <div className={styles.sectionAccent} aria-hidden />
          <div className={styles.sectionInner}>
            <h2 id="about-how" className={styles.h2}>
              How to use it
            </h2>
            <ol className={styles.steps}>
              <li>
                <span className={styles.stepNum} aria-hidden>
                  1
                </span>
                <div>
                  <strong className={styles.stepHead}>Start on the home page.</strong>
                  <p className={styles.stepText}>
                    Open the home page and read <strong>Today in Church</strong> — one
                    small moment with God is enough.
                  </p>
                </div>
              </li>
              <li>
                <span className={styles.stepNum} aria-hidden>
                  2
                </span>
                <div>
                  <strong className={styles.stepHead}>Open Practice when you’re ready.</strong>
                  <p className={styles.stepText}>
                    Use <strong>Practice</strong> for chants and instruments, or{' '}
                    <strong>Prayers</strong> for tselot and longer reading. Text stays
                    inside cards and dialogs until you tap.
                  </p>
                </div>
              </li>
              <li>
                <span className={styles.stepNum} aria-hidden>
                  3
                </span>
                <div>
                  <strong className={styles.stepHead}>Return tomorrow.</strong>
                  <p className={styles.stepText}>
                    The site is meant to be <strong>repeated</strong>, not finished.
                    Same gentle shape, fresh day.
                  </p>
                </div>
              </li>
            </ol>
            <div className={styles.ctaRow}>
              <ButtonLink to="/" hash="today-preview" end>
                Back to home
              </ButtonLink>
              <ButtonLink to="/practice" variant="ghost">
                Open practice
              </ButtonLink>
            </div>
          </div>
        </section>
      </PageSection>

      <PageSection variant="tint">
        <aside className={styles.guidance} aria-labelledby="about-respect">
          <div className={styles.guidanceBar} aria-hidden />
          <div>
            <h2 id="about-respect" className={styles.guidanceTitle}>
              Respect and guidance
            </h2>
            <p className={styles.guidanceLead}>
              This website supports <strong>learning and practice</strong> in daily
              life. We hope it encourages prayer, listening, and love for the Church.
            </p>
            <p className={styles.guidanceBody}>
              It does <strong>not</strong> replace your <strong>priest</strong>, your{' '}
              <strong>parish</strong>, your <strong>spiritual father</strong>, or{' '}
              <strong>official liturgical books</strong>. Fasting rules, sacraments,
              confession, and pastoral care belong in person — with those the Church
              has given you to shepherd your soul.
            </p>
            <p className={styles.guidanceFoot}>
              When something here disagrees with your bishop, books, or father of
              confession, <strong>trust them</strong> — not a website.
            </p>
          </div>
        </aside>
      </PageSection>

      <PageSection>
        <section className={styles.vision} aria-labelledby="about-future">
          <h2 id="about-future" className={styles.visionTitle}>
            Future vision
          </h2>
          <p className={styles.visionText}>
            We hope to grow with real calendar data, parish-tuned content, audio that
            serves the liturgy, and more — always slowly, carefully, and under proper
            guidance. If Tewahedo Daily ever stops feeling humble next to the Church,
            we have missed the mark.
          </p>
          <p className={styles.visionSignoff}>
            Thank you for visiting. May it serve your salvation — even a little.
          </p>
          <p className={styles.visionLink}>
            <Link to="/" className={styles.backLink}>
              ← Back to home
            </Link>
          </p>
        </section>
      </PageSection>
    </>
  )
}
