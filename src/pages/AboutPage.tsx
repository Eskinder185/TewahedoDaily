import { Link } from 'react-router-dom'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import styles from './AboutPage.module.css'

function EthCross({ className }: { className?: string }) {
  return (
    <svg className={className} viewBox="0 0 48 48" aria-hidden focusable="false">
      <g fill="none" stroke="currentColor" strokeWidth="1.35">
        <rect x="21.5" y="4" width="5" height="40" />
        <rect x="8" y="14.5" width="32" height="5" />
        <rect x="14" y="8" width="3.5" height="3.5" />
        <rect x="30.5" y="8" width="3.5" height="3.5" />
        <rect x="14" y="22.5" width="3.5" height="3.5" />
        <rect x="30.5" y="22.5" width="3.5" height="3.5" />
        <rect x="21.5" y="33" width="5" height="3.5" />
      </g>
    </svg>
  )
}

export function AboutPage() {
  usePageMeta(
    'About Tewahedo Daily',
    'A quiet corner of the internet for Ethiopian Orthodox Christians who want to stay close to the Church between Sundays.',
  )

  return (
    <div className={styles.page}>
      <section className={styles.hero} aria-labelledby="about-hero-title">
        <div className={styles.heroInner}>
          <div className={styles.heroCopy}>
            <p className={styles.eyebrow}>About Tewahedo Daily</p>
            <h1 id="about-hero-title" className={styles.heroTitle}>
              Tewahedo Daily
            </h1>
            <p className={styles.heroLede}>
              A quiet corner of the internet for Ethiopian Orthodox Christians who want to stay close
              to the Church between Sundays — in minutes, not marathons.
            </p>
            <div className={styles.ornamentRule} aria-hidden>
              <span className={styles.ruleLine} />
              <EthCross className={styles.ruleCross} />
              <span className={styles.ruleLine} />
            </div>
          </div>
          <div className={styles.heroArt} aria-hidden>
            <div className={styles.arch}>
              <div className={styles.archInner}>
                <div className={styles.archHalo} />
                <EthCross className={styles.archCross} />
                <p className={styles.archCaption}>Prayer · Practice · Presence</p>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className={styles.narrowSection} aria-labelledby="about-what">
        <h2 id="about-what" className={styles.h2}>
          What this website is
        </h2>
        <p className={styles.body}>
          Tewahedo Daily is a daily companion: short lessons, practice for chants and movement, a
          dedicated prayers space, and a quick view of today in the Church calendar. It is built for
          phones and busy days so you can touch prayer and tradition without feeling buried in text.
        </p>
        <blockquote className={styles.pullQuote}>
          <span className={styles.pullBar} aria-hidden />
          <div className={styles.pullMark} aria-hidden>
            <span className={styles.ruleLineShort} />
            <EthCross className={styles.ruleCrossSm} />
          </div>
          <p>
            “We are not an encyclopedia or a social feed. We are trying to be faithful, small, and
            useful.”
          </p>
        </blockquote>
      </section>

      <section className={styles.audienceBand} aria-labelledby="about-who">
        <div className={styles.audienceInner}>
          <p className={styles.eyebrowCenter}>A gentle beginning</p>
          <h2 id="about-who" className={styles.h2Center}>
            Who this is for
          </h2>
          <ul className={styles.audienceGrid}>
            <li className={styles.audienceCard}>
              <span className={styles.cardNum}>01</span>
              <h3>Ethiopians in the diaspora</h3>
              <p>Especially when parish life is far away or schedules are tight.</p>
            </li>
            <li className={styles.audienceCard}>
              <span className={styles.cardNum}>02</span>
              <h3>Beginners</h3>
              <p>
                For people who need a gentle starting place without already knowing every hymn or
                rubric.
              </p>
            </li>
            <li className={styles.audienceCard}>
              <span className={styles.cardNum}>03</span>
              <h3>Those who love the Church</h3>
              <p>For anyone who wants a lighter rhythm between worship, work, and family.</p>
            </li>
          </ul>
        </div>
      </section>

      <section className={styles.threadsSection} aria-labelledby="about-threads">
        <div className={styles.threadsIntro}>
          <p className={styles.eyebrowCenter}>Daily rhythm</p>
          <h2 id="about-threads" className={styles.h2Center}>
            Four threads for the day
          </h2>
          <p className={styles.subCenter}>Each one is optional. Pick what fits the day.</p>
        </div>
        <ul className={styles.threadGrid}>
          {[
            {
              n: 'I',
              title: 'The Church day',
              body: 'A quick sense of what today is — feast, season, and a short why-it-matters summary.',
            },
            {
              n: 'II',
              title: 'Chants',
              body: 'Mezmur and werb together: listen, read transliteration, and open lyrics or watch only when you choose.',
            },
            {
              n: 'III',
              title: 'Prayers',
              body: 'Daily prayers, Wudase, and Mezmure Dawit under the prayer hub, with full text when you choose to open it.',
            },
            {
              n: 'IV',
              title: 'Calendar and seasons',
              body: 'A simple calendar view and notes on fasts and feasts — always pointing back to your parish.',
            },
          ].map((item) => (
            <li key={item.n} className={styles.threadCard}>
              <div className={styles.threadArt} aria-hidden>
                <span className={styles.threadGridPattern} />
                <div className={styles.threadArch}>
                  <EthCross className={styles.threadCross} />
                </div>
                <span className={styles.roman}>{item.n}</span>
              </div>
              <div className={styles.threadBody}>
                <h3>{item.title}</h3>
                <p>{item.body}</p>
              </div>
            </li>
          ))}
        </ul>
      </section>

      <section className={styles.howBand} aria-labelledby="about-how">
        <div className={styles.howInner}>
          <div className={styles.howCopy}>
            <p className={styles.eyebrowOnDark}>A simple practice</p>
            <h2 id="about-how" className={styles.h2OnDark}>
              How to use it
            </h2>
            <p className={styles.bodyOnDark}>
              There is no streak to protect and no finish line. Begin with what the day can hold.
            </p>
            <div className={styles.howActions}>
              <Link to="/" className={styles.btnGhost}>
                Back to home
              </Link>
              <Link to="/practice" className={styles.btnSolid}>
                Open practice →
              </Link>
            </div>
          </div>
          <ol className={styles.timeline}>
            <li>
              <span className={styles.tlNum} aria-hidden>
                1
              </span>
              <div>
                <h3>Start on the home page.</h3>
                <p>
                  Open the home page and read Today in Church — one small moment with God is enough.
                </p>
              </div>
            </li>
            <li>
              <span className={styles.tlNum} aria-hidden>
                2
              </span>
              <div>
                <h3>Open Practice when you are ready.</h3>
                <p>
                  Use Practice for chants and tools, or Prayers for tselot and longer reading. Text
                  stays in cards and dialogs until you tap.
                </p>
              </div>
            </li>
            <li>
              <span className={styles.tlNum} aria-hidden>
                3
              </span>
              <div>
                <h3>Return tomorrow.</h3>
                <p>
                  The site is meant to be repeated, not finished. Same gentle shape, fresh day.
                </p>
              </div>
            </li>
          </ol>
        </div>
      </section>

      <section className={styles.guidanceWrap} aria-labelledby="about-respect">
        <div className={styles.guidanceCard}>
          <div className={styles.guidanceMotif} aria-hidden>
            <div className={styles.guidanceCircle}>
              <EthCross className={styles.guidanceCross} />
            </div>
          </div>
          <div className={styles.guidanceText}>
            <p className={styles.eyebrow}>With humility</p>
            <h2 id="about-respect" className={styles.h2}>
              Respect and guidance
            </h2>
            <p className={styles.body}>
              This website supports learning and practice in daily life. We hope it encourages
              prayer, listening, and love for the Church.
            </p>
            <p className={styles.body}>
              It does not replace your priest, parish, spiritual father, or official liturgical
              books. Fasting rules, sacraments, confession, and pastoral care belong in person with
              those the Church has given you.
            </p>
            <hr className={styles.softRule} />
            <p className={styles.guidanceQuote}>
              “If something here disagrees with your bishop, books, or father of confession, trust
              them — not a website.”
            </p>
          </div>
        </div>
      </section>

      <section className={styles.visionSection} aria-labelledby="about-future">
        <h2 id="about-future" className={styles.h2}>
          Future vision
        </h2>
        <p className={styles.body}>
          We hope to grow with real calendar data, parish-tuned content, audio that serves the
          liturgy, and more — always slowly, carefully, and under proper guidance. If Tewahedo Daily
          ever stops feeling humble next to the Church, we have missed the mark.
        </p>
        <p className={styles.closing}>
          “Thank you for visiting. May it serve your salvation — even a little.”
        </p>
      </section>
    </div>
  )
}
