import { useId, useState } from 'react'
import { Link } from 'react-router-dom'
import type { DayChurchContext, DayCommemorationItem } from '../../services/dayChurchContext'
import { useLocale } from '../../lib/i18n/locale'
import { useTranslation } from '../../i18n'
import { calendarScriptureReaderHref } from '../../lib/recommendations/dailyScriptureSelection'
import styles from './DailyFaithDashboard.module.css'

export interface DailyFaithDashboardProps {
  context: DayChurchContext | null
  loading?: boolean
  onOpenCalendar?: () => void
}

type ReadingMode = 'parallel' | 'am' | 'en'

function SynaxariumRow({
  item,
  daySlug,
}: {
  item: DayCommemorationItem
  daySlug?: string | null
}) {
  const [open, setOpen] = useState(false)
  const { contentLocale } = useLocale()
  const title = contentLocale === 'am' && item.titleAmharic ? item.titleAmharic : item.title
  const preview = item.summary || ''
  const full = item.longerSummary || preview
  const categoryLabel = item.typeLabel || (item.type ? item.type.toUpperCase() : 'COMMEMORATION')

  const readStoryHref = daySlug
    ? `/pray/synaxarium/${daySlug}`
    : `/calendar`

  return (
    <div className={styles.commemorationRow}>
      <button
        type="button"
        className={styles.commemorationHead}
        onClick={() => setOpen((prev) => !prev)}
        aria-expanded={open}
      >
        <div className={styles.commemorationHeadLeft}>
          <span className={styles.commemorationTypeBadge}>{categoryLabel}</span>
          <span className={styles.commemorationTitle}>{title}</span>
        </div>
        <span className={styles.commemorationChevron} aria-hidden="true">
          {open ? '▲' : '▼'}
        </span>
      </button>

      {open ? (
        <div className={styles.commemorationBody}>
          <p className={styles.commemorationText}>{full || preview}</p>
          <div className={styles.commemorationActions}>
            <Link to={readStoryHref} className={styles.commemorationStoryLink}>
              {contentLocale === 'am' ? '📖 ሙሉውን የስንክሳር ታሪክ አንብብ' : '📖 Read full Synaxarium story'} →
            </Link>
          </div>
        </div>
      ) : null}
    </div>
  )
}

export function DailyFaithDashboard(props: DailyFaithDashboardProps) {
  return <DailyFaithDashboardContent key={props.context?.gregorianDate || 'loading'} {...props} />
}

function DailyFaithDashboardContent({
  context,
  loading = false,
}: DailyFaithDashboardProps) {
  const { contentLocale } = useLocale()
  const t = useTranslation()
  const panelId = useId()
  const readingsId = panelId + '-readings'
  const mezmursId = panelId + '-mezmurs'
  const [showAllReadings, setShowAllReadings] = useState(false)
  const [showAllMezmurs, setShowAllMezmurs] = useState(false)

  // About today's observances toggle
  const [aboutOpen, setAboutOpen] = useState(false)

  // Expanded passage IDs set
  const [expandedPassages, setExpandedPassages] = useState<Set<string>>(new Set())

  const togglePassageExpand = (id: string) => {
    setExpandedPassages((prev) => {
      const next = new Set(prev)
      if (next.has(id)) next.delete(id)
      else next.add(id)
      return next
    })
  }

  // Persisted Bible reading mode: 'parallel' | 'am' | 'en'
  const [readingMode, setReadingMode] = useState<ReadingMode>(() => {
    try {
      const stored = localStorage.getItem('tewahedo_bible_reading_mode')
      if (stored === 'parallel' || stored === 'am' || stored === 'en') {
        return stored
      }
    } catch {
      // Fallback
    }
    return contentLocale === 'am' ? 'am' : 'parallel'
  })

  const handleModeChange = (mode: ReadingMode) => {
    setReadingMode(mode)
    try {
      localStorage.setItem('tewahedo_bible_reading_mode', mode)
    } catch {
      // Ignore
    }
  }

  if (loading || !context) {
    return (
      <div className={styles.dashboard}>
        <div className={styles.banner}>
          <p className={styles.emptyNotice}>
            {loading ? t('home.board.loading') : t('home.board.unableLoad')}
          </p>
        </div>
      </div>
    )
  }

  const {
    ethiopianLabel,
    ethiopianLabelAmharic,
    gregorianLabel,
    dayTitle,
    badges,
    fastingStatus,
    season,
    activeFast,
    dailyScriptures = [],
    mezmurRecommendations = [],
    synaxarium = [],
    synaxariumDaySlug,
    liturgySummary,
  } = context

  const displayEthDate =
    contentLocale === 'am' && ethiopianLabelAmharic ? ethiopianLabelAmharic : ethiopianLabel

  // Deduplicate badges
  const renderedBadgeLabels = new Set<string>()
  const deduplicatedBadges = badges.filter((b) => {
    const key = b.label.trim().toLowerCase()
    if (renderedBadgeLabels.has(key)) return false
    renderedBadgeLabels.add(key)
    return true
  })

  return (
    <div className={styles.dashboard}>
      {/* 1. DATE & OBSERVANCES HEADER (Compact Summary) */}
      <section className={styles.banner} aria-labelledby="daily-banner-title">
        <div className={styles.bannerHeader}>
          <div className={styles.dateBlock}>
            <h2 id="daily-banner-title" className={styles.ethDate}>
              {displayEthDate}
            </h2>
            <span className={styles.gregDate}>{gregorianLabel}</span>
          </div>

          <button
            type="button"
            className={styles.aboutToggleBtn}
            onClick={() => setAboutOpen((prev) => !prev)}
            aria-expanded={aboutOpen}
          >
            <span>{aboutOpen ? (contentLocale === 'am' ? 'ስለ ዕለቱ ዝጋ' : 'Hide details') : (contentLocale === 'am' ? 'ስለ ዕለቱ መረጃ' : 'About today')}</span>
            <span aria-hidden="true">{aboutOpen ? '▲' : '▾'}</span>
          </button>
        </div>

        {dayTitle ? <p className={styles.dayTitle}>{dayTitle}</p> : null}

        {/* Compact Chips Row */}
        <div className={styles.badgesRow}>
          {season ? (
            <span className={`${styles.badge} ${styles.badgeSeason}`}>
              🌸 {contentLocale === 'am' && season.titleAmharic ? season.titleAmharic : season.title}
            </span>
          ) : null}

          {fastingStatus?.isOptionalFast ? (
            <span className={`${styles.badge} ${styles.badgeOptionalFast}`}>
              🕊️ {contentLocale === 'am' ? 'የፈቃድ ጾም (ልማዳዊ)' : 'Voluntary Devotion'}
            </span>
          ) : activeFast ? (
            <span className={`${styles.badge} ${styles.badgeFast}`}>
              🥖 {contentLocale === 'am' && activeFast.nameAmharic ? activeFast.nameAmharic : activeFast.name}
            </span>
          ) : fastingStatus?.isFastDay ? (
            <span className={`${styles.badge} ${styles.badgeFast}`}>
              🥖 {contentLocale === 'am' ? 'የጾም ቀን' : 'Fast Day'}
            </span>
          ) : fastingStatus?.isFastFree ? (
            <span className={`${styles.badge} ${styles.badgeFastFree}`}>
              ✨ {contentLocale === 'am' ? 'የፍስክ ቀን' : 'Fast-Free Day'}
            </span>
          ) : null}

          {deduplicatedBadges.slice(0, 3).map((b) => (
            <span
              key={b.id}
              className={`${styles.badge} ${
                b.tone === 'feast'
                  ? styles.badgeFeast
                  : b.tone === 'fast'
                    ? styles.badgeFast
                    : b.tone === 'saint'
                      ? styles.badgeSaint
                      : styles.badgeSeason
              }`}
            >
              {b.label}
            </span>
          ))}
        </div>

        {/* Expandable "About Today's Observances" */}
        {aboutOpen ? (
          <div className={styles.aboutExpandedPanel}>
            {fastingStatus ? (
              <div className={styles.aboutSectionBlock}>
                <h4 className={styles.aboutBlockTitle}>
                  {contentLocale === 'am' ? 'የጾም ስርዓት እና ቀኖና' : 'Fasting Rule & Canonical Discipline'}
                </h4>
                <p className={styles.aboutBlockText}>
                  <strong>
                    {fastingStatus.isOptionalFast
                      ? contentLocale === 'am'
                        ? 'የጽጌ ጾም (ልማዳዊ / በፈቃድ)'
                        : 'Season of Tsige (Customary Voluntary Devotion)'
                      : fastingStatus.isFastDay
                        ? contentLocale === 'am'
                          ? 'የአዋጅ የጾም ቀን'
                          : 'Canonical Fast Day'
                        : fastingStatus.isFastFree
                          ? contentLocale === 'am'
                            ? 'የፍስክ ቀን (ከጾም ነጻ)'
                            : 'Fast-Free Period'
                          : contentLocale === 'am'
                            ? 'መደበኛ ቀን'
                            : 'Regular Liturgical Day'}
                  </strong>
                  {fastingStatus.label ? ` — ${fastingStatus.label}` : ''}
                  {fastingStatus.exceptionNote ? ` (${fastingStatus.exceptionNote})` : ''}
                </p>
                {fastingStatus.isOptionalFast ? (
                  <p className={styles.aboutBlockSubtext}>
                    {contentLocale === 'am'
                      ? 'በስርዓተ ቤተክርስቲያን መሠረት የጽጌ ጾም በፈቃድ የሚጾም የበረከት ጾም ነው፤ ረቡዕ እና ዓርብ ግን መደበኛ ቀኖናዊ የአዋጅ የጾም ቀናት ናቸው።'
                      : 'Observed as pious devotion in honor of the Holy Family. Regular canonical fasting discipline applies on Wednesday and Friday.'}
                  </p>
                ) : null}
              </div>
            ) : null}

            {season?.summary || season?.description ? (
              <div className={styles.aboutSectionBlock}>
                <h4 className={styles.aboutBlockTitle}>
                  {contentLocale === 'am' ? 'የወቅቱ መንፈሳዊ ትርጉም' : 'Liturgical Season Context'}
                </h4>
                <p className={styles.aboutBlockText}>
                  {contentLocale === 'am' && season.summaryAmharic
                    ? season.summaryAmharic
                    : season.summary || season.description}
                </p>
              </div>
            ) : null}
          </div>
        ) : null}
      </section>

      {/* 2. MIDDLE TWO-COLUMN GRID (Bible Readings & Recommended Mezmurs) */}
      <div className={styles.midGrid}>
        {/* LEFT COLUMN: TODAY'S BIBLE READINGS */}
        <section className={styles.sectionCard} aria-labelledby="scripture-heading">
          <div className={styles.sectionTitleRow}>
            <h3 id="scripture-heading" className={styles.sectionHeading}>
              <span className={styles.sectionIcon} aria-hidden="true">📖</span>
              <span>{contentLocale === 'am' ? 'የዕለቱ የመጽሐፍ ቅዱስ ንባባት' : "Today's Bible Readings"}</span>
            </h3>
            <Link to="/bible" className={styles.sectionLink}>
              {contentLocale === 'am' ? 'መጽሐፍ ቅዱስን ክፈት' : 'Open Bible'} →
            </Link>
          </div>

          {/* Compact Reading Mode Bar */}
          <div className={styles.readingModeBar}>
            <span className={styles.readingModeLabel}>
              {contentLocale === 'am' ? 'ትርጉም' : 'Mode'}:
            </span>
            <div className={styles.modeToggleGroup} role="group" aria-label="Bible Reading Mode">
              <button
                type="button"
                className={`${styles.modeBtn} ${readingMode === 'parallel' ? styles.modeBtnActive : ''}`}
                onClick={() => handleModeChange('parallel')}
                aria-pressed={readingMode === 'parallel'}
              >
                {contentLocale === 'am' ? 'ጎን ለጎን' : 'Parallel'}
              </button>
              <button
                type="button"
                className={`${styles.modeBtn} ${readingMode === 'am' ? styles.modeBtnActive : ''}`}
                onClick={() => handleModeChange('am')}
                aria-pressed={readingMode === 'am'}
              >
                አማርኛ
              </button>
              <button
                type="button"
                className={`${styles.modeBtn} ${readingMode === 'en' ? styles.modeBtnActive : ''}`}
                onClick={() => handleModeChange('en')}
                aria-pressed={readingMode === 'en'}
              >
                English
              </button>
            </div>
          </div>

          {dailyScriptures.length === 0 ? (
            <p className={styles.emptyNotice}>
              {contentLocale === 'am'
                ? 'ለዚህ ዕለት የተመዘገበ ንባብ የለም'
                : 'No specific readings designated for this day.'}
            </p>
          ) : (
            <div id={readingsId} className={styles.scriptureList}>
              {dailyScriptures.slice(0, showAllReadings ? undefined : 1).map((s, index) => {
                const hasEnVerses = Boolean(s.passageEnglish && s.passageEnglish.verses.length > 0)
                const hasAmVerses = Boolean(s.passageAmharic && s.passageAmharic.verses.length > 0)
                const isExpanded = expandedPassages.has(s.id)

                const amVerses = s.passageAmharic?.verses || []
                const enVerses = s.passageEnglish?.verses || []
                const totalVerseCount = Math.max(amVerses.length, enVerses.length)

                const passageId = panelId + '-passage-' + index
                const previewAmVerses = isExpanded ? amVerses : amVerses.slice(0, 1)
                const previewEnVerses = isExpanded ? enVerses : enVerses.slice(0, 1)

                return (
                  <article key={s.id} className={`${styles.scriptureItem} ${index > 0 ? styles.revealedContent : ''}`}>
                    <div className={styles.scriptureMeta}>
                      <span className={styles.priorityBadge}>
                        {contentLocale === 'am' ? s.priorityLabelAm : s.priorityLabelEn}
                      </span>
                      <span className={styles.scriptureRef}>{s.reference}</span>
                      {s.sourceName ? (
                        <small className={styles.scriptureSourceChip}>{s.sourceName}</small>
                      ) : null}
                    </div>

                    <p className={styles.scriptureReason}>
                      {contentLocale === 'am' ? s.reasonAm : s.reasonEn}
                    </p>

                    {/* Verses Container */}
                    <div id={passageId} className={`${styles.versesContainer} ${!isExpanded ? styles.passagePreview : ''}`}>
                      {readingMode === 'parallel' ? (
                        <div className={styles.verseParallelGrid}>
                          {/* Column 1: Amharic */}
                          <div className={styles.verseColumn}>
                            <h5 className={styles.editionHeader}>
                              {s.passageAmharic?.editionName || 'የኢትዮጵያ ኦርቶዶክስ ተዋሕዶ መጽሐፍ ቅዱስ'}
                            </h5>
                            {hasAmVerses ? (
                              <div className={styles.verseList}>
                                {previewAmVerses.map((v) => (
                                  <p key={v.id} className={`${styles.verseLine} ${styles.verseLineAmharic}`}>
                                    <span className={styles.verseNum}>[{v.verseNumber}]</span>
                                    {v.text}
                                  </p>
                                ))}
                                {isExpanded && s.passageAmharic?.missingVerses?.length ? (
                                  <p className={styles.verseNotes}>
                                    {contentLocale === 'am'
                                      ? `* ያልተገኙ ቁጥሮች፦ ${s.passageAmharic.missingVerses.join(', ')}`
                                      : `* Verse(s) ${s.passageAmharic.missingVerses.join(', ')} are unavailable in this edition.`}
                                  </p>
                                ) : null}
                              </div>
                            ) : s.previewTextAmharic ? (
                              <blockquote className={`${styles.verseLine} ${styles.verseLineAmharic}`}>
                                {s.previewTextAmharic}
                              </blockquote>
                            ) : (
                              <p className={styles.emptyNotice}>
                                {contentLocale === 'am' ? 'ይህ ትርጉም ለጊዜው አይገኝም።' : 'This translation is currently unavailable.'}
                              </p>
                            )}
                          </div>

                          {/* Column 2: English */}
                          <div className={styles.verseColumn}>
                            <h5 className={styles.editionHeader}>
                              {s.passageEnglish?.editionName || 'World English Bible (WEB)'}
                            </h5>
                            {hasEnVerses ? (
                              <div className={styles.verseList}>
                                {previewEnVerses.map((v) => (
                                  <p key={v.id} className={styles.verseLine}>
                                    <span className={styles.verseNum}>[{v.verseNumber}]</span>
                                    {v.text}
                                  </p>
                                ))}
                              </div>
                            ) : s.previewTextEnglish ? (
                              <blockquote className={styles.verseLine}>
                                {s.previewTextEnglish}
                              </blockquote>
                            ) : (
                              <p className={styles.emptyNotice}>
                                {contentLocale === 'am' ? 'ይህ ትርጉም ለጊዜው አይገኝም።' : 'This translation is currently unavailable.'}
                              </p>
                            )}
                          </div>
                        </div>
                      ) : readingMode === 'am' ? (
                        /* Single Amharic mode */
                        <div className={styles.singleVerseBox}>
                          <h5 className={styles.editionHeader}>
                            {s.passageAmharic?.editionName || 'የኢትዮጵያ ኦርቶዶክስ ተዋሕዶ መጽሐፍ ቅዱስ'}
                          </h5>
                          {hasAmVerses ? (
                            <div className={styles.verseList}>
                              {previewAmVerses.map((v) => (
                                <p key={v.id} className={`${styles.verseLine} ${styles.verseLineAmharic}`}>
                                  <span className={styles.verseNum}>[{v.verseNumber}]</span>
                                  {v.text}
                                </p>
                              ))}
                              {isExpanded && s.passageAmharic?.missingVerses?.length ? (
                                <p className={styles.verseNotes}>
                                  * ያልተገኙ ቁጥሮች፦ {s.passageAmharic.missingVerses.join(', ')}
                                </p>
                              ) : null}
                            </div>
                          ) : s.previewTextAmharic ? (
                            <blockquote className={`${styles.verseLine} ${styles.verseLineAmharic}`}>
                              {s.previewTextAmharic}
                            </blockquote>
                          ) : (
                            <p className={styles.emptyNotice}>ይህ ትርጉም ለጊዜው አይገኝም።</p>
                          )}
                        </div>
                      ) : (
                        /* Single English mode */
                        <div className={styles.singleVerseBox}>
                          <h5 className={styles.editionHeader}>
                            {s.passageEnglish?.editionName || 'World English Bible (WEB)'}
                          </h5>
                          {hasEnVerses ? (
                            <div className={styles.verseList}>
                              {previewEnVerses.map((v) => (
                                <p key={v.id} className={styles.verseLine}>
                                  <span className={styles.verseNum}>[{v.verseNumber}]</span>
                                  {v.text}
                                </p>
                              ))}
                            </div>
                          ) : s.previewTextEnglish ? (
                            <blockquote className={styles.verseLine}>
                              {s.previewTextEnglish}
                            </blockquote>
                          ) : (
                            <p className={styles.emptyNotice}>This translation is currently unavailable.</p>
                          )}
                        </div>
                      )}
                    </div>

                    {/* Actions Row */}
                    <div className={styles.scriptureActionsRow}>
                      {totalVerseCount > 0 ? (
                        <button
                          type="button"
                          className={styles.expandPassageBtn}
                          onClick={() => togglePassageExpand(s.id)}
                          aria-expanded={isExpanded}
                          aria-controls={passageId}
                        >
                          {isExpanded
                            ? (contentLocale === 'am' ? '▲ ንባቡን አሳጥር' : '▲ Collapse passage')
                            : (contentLocale === 'am' ? `▼ ሙሉውን ንባብ አሳይ (${totalVerseCount} ቁጥሮች)` : `▼ Expand full passage (${totalVerseCount} verses)`)}
                        </button>
                      ) : null}

                      <Link to={calendarScriptureReaderHref(s.readHref, readingMode, context.gregorianDate)} className={styles.readScriptureBtn}>
                        {contentLocale === 'am' ? 'በመጽሐፍ ቅዱስ አንብብ' : 'Read in Bible Reader'} →
                      </Link>
                    </div>
                  </article>
                )
              })}
            </div>
          )}
          {dailyScriptures.length > 1 ? (
            <button type="button" className={styles.showAllBtn} aria-expanded={showAllReadings} aria-controls={readingsId} onClick={() => setShowAllReadings((value) => !value)}>
              {showAllReadings
                ? (contentLocale === 'am' ? 'ንባቦችን አሳጥር' : 'Show fewer readings')
                : (contentLocale === 'am' ? `ሁሉንም ንባቦች አሳይ (${dailyScriptures.length})` : `Show all readings (${dailyScriptures.length})`)}
            </button>
          ) : null}
        </section>

        {/* RIGHT COLUMN: TODAY'S RECOMMENDED MEZMURS (Compact Rows) */}
        <section className={styles.sectionCard} aria-labelledby="mezmur-heading">
          <div className={styles.sectionTitleRow}>
            <h3 id="mezmur-heading" className={styles.sectionHeading}>
              <span className={styles.sectionIcon} aria-hidden="true">🎵</span>
              <span>{contentLocale === 'am' ? 'የዕለቱ የተመረጡ መዝሙራት' : "Today's Recommended Mezmurs"}</span>
            </h3>
            <Link to="/practice" className={styles.sectionLink}>
              {contentLocale === 'am' ? 'ሁሉንም መዝሙራት' : 'Mezmur Library'} →
            </Link>
          </div>

          {mezmurRecommendations.length === 0 ? (
            <p className={styles.emptyNotice}>
              {contentLocale === 'am'
                ? 'ለዚህ ዕለት የተለየ መዝሙር አልተገኘም'
                : 'No specific hymns matched for this day.'}
            </p>
          ) : (
            <div id={mezmursId} className={styles.mezmurList}>
              {mezmurRecommendations.slice(0, showAllMezmurs ? undefined : 2).map((m, index) => {
                const targetSlug = m.slug || m.id
                const detailHref = m.practiceHref || `/practice/mezmur/${encodeURIComponent(targetSlug)}`

                return (
                  <div key={m.id} className={`${styles.mezmurRow} ${index > 1 ? styles.revealedContent : ''}`}>
                    <div className={styles.mezmurContentCol}>
                      <p className={styles.mezmurTitle} title={m.title}>
                        {m.title}
                      </p>
                      <div className={styles.mezmurSubline}>
                        {m.titleAmharic ? (
                          <span className={styles.mezmurAmharic}>{m.titleAmharic}</span>
                        ) : null}
                        {m.singerName ? (
                          <span className={styles.mezmurSinger}>
                            {contentLocale === 'am' ? `ዘማሪ: ${m.singerName}` : m.singerName}
                          </span>
                        ) : null}
                        <span className={styles.mezmurMatch}>
                          {m.matchReason}
                        </span>
                      </div>
                    </div>

                    <div className={styles.mezmurActionCol}>
                      <Link
                        to={detailHref}
                        className={styles.viewHymnBtn}
                        aria-label={`${contentLocale === 'am' ? 'መዝሙሩን ይመልከቱ' : 'View Hymn'}: ${m.title}`}
                      >
                        {contentLocale === 'am' ? 'መዝሙሩን ይመልከቱ' : 'View Hymn'}
                      </Link>
                    </div>
                  </div>
                )
              })}
            </div>
          )}
          {mezmurRecommendations.length > 2 ? (
            <button type="button" className={styles.showAllBtn} aria-expanded={showAllMezmurs} aria-controls={mezmursId} onClick={() => setShowAllMezmurs((value) => !value)}>
              {showAllMezmurs
                ? (contentLocale === 'am' ? 'መዝሙራትን አሳጥር' : 'Show fewer Mezmurs')
                : (contentLocale === 'am' ? `ሁሉንም መዝሙራት አሳይ (${mezmurRecommendations.length})` : `Show all Mezmurs (${mezmurRecommendations.length})`)}
            </button>
          ) : null}
        </section>
      </div>

      {/* 3. LOWER SECTION (Synaxarium & Divine Liturgy) */}
      <section className={styles.sectionCard} aria-labelledby="synaxarium-heading">
        <div className={styles.sectionTitleRow}>
          <h3 id="synaxarium-heading" className={styles.sectionHeading}>
            <span className={styles.sectionIcon} aria-hidden="true">📜</span>
            <span>{contentLocale === 'am' ? 'የዕለቱ ስንክሳር እና ቅዳሴ' : 'Synaxarium & Liturgy'}</span>
          </h3>
          <Link to="/pray" className={styles.sectionLink}>
            {contentLocale === 'am' ? 'የጸሎት መጻሕፍት' : 'Prayer Library'} →
          </Link>
        </div>

        {/* Compact Liturgy Focus Bar */}
        <div className={styles.liturgyFocusBar}>
          <span className={styles.liturgyFocusLabel}>
            {contentLocale === 'am' ? 'የዕለቱ ቅዳሴ' : 'Liturgy Focus'}:
          </span>{' '}
          {liturgySummary?.anaphoraTitle ? (
            <span className={styles.liturgyFocusValue}>
              {liturgySummary.anaphoraTitle}
              {liturgySummary.liturgicalEmphasis ? ` — ${liturgySummary.liturgicalEmphasis}` : ''}
            </span>
          ) : (
            <span className={styles.liturgyFocusValue}>
              {contentLocale === 'am'
                ? 'የኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ቤተክርስቲያን ስርዓተ ቅዳሴ (ቅዳሴ እግዚእ)'
                : 'The Divine Liturgy (ስርዓተ ቅዳሴ) — Liturgy of the Faithful'}
              {' '}
              <Link to="/pray/divine-liturgy" className={styles.sectionLink}>
                {contentLocale === 'am' ? 'ስርዓተ ቅዳሴን ተመልከት' : 'View Divine Liturgy'} →
              </Link>
            </span>
          )}
        </div>

        {synaxarium.length === 0 ? (
          <p className={styles.emptyNotice}>
            {contentLocale === 'am'
              ? 'ለዚህ ዕለት የተመዘገበ የስንክሳር ታሪክ የለም'
              : 'No Synaxarium commemorations listed for this day.'}
          </p>
        ) : (
          <div className={styles.commemorationList}>
            {synaxarium.map((s) => (
              <SynaxariumRow key={s.id} item={s} daySlug={synaxariumDaySlug} />
            ))}
          </div>
        )}
      </section>
    </div>
  )
}
