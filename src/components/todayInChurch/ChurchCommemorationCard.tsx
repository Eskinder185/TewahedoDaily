import { useMemo, type ReactNode } from 'react'
import type { Commemoration } from '../../lib/churchCalendar'
import { TabPanel } from '../ui/TabPanel'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { resolveCommemorationImage } from '../../content/calendarImageManifest'
import styles from './ChurchCommemorationCard.module.css'

type Props = {
  commemoration: Commemoration
}

export function ChurchCommemorationCard({ commemoration }: Props) {
  const t = useUiLabel()
  const lead =
    commemoration.shortDescription?.trim() || commemoration.whyTodayShort

  const meaning = commemoration.meaning.trim()
  const observance = commemoration.observance.trim()
  
  // New educational content
  const summary = commemoration.summary?.trim() || ''
  const significance = commemoration.significance?.trim() || ''
  const practicalGuidance = commemoration.practicalGuidance?.trim() || ''
  const prayAndChant = commemoration.prayAndChant?.trim() || ''
  const notes = commemoration.notes?.trim() || ''
  const observanceTypes = commemoration.observanceType || []

  const detailTabs = useMemo(() => {
    const tabs: { id: string; label: string; content: ReactNode }[] = []
    
    // Overview tab with new educational content
    tabs.push({
      id: 'overview',
      label: 'Overview',
      content: (
        <div className={styles.educationalContent}>
          {summary && (
            <div className={styles.educationalSection}>
              <h4 className={styles.educationalLabel}>What this day represents</h4>
              <p className={styles.detailP}>{summary}</p>
            </div>
          )}
          {significance && (
            <div className={styles.educationalSection}>
              <h4 className={styles.educationalLabel}>Why it matters</h4>
              <p className={styles.detailP}>{significance}</p>
            </div>
          )}
          {practicalGuidance && (
            <div className={styles.educationalSection}>
              <h4 className={styles.educationalLabel}>How to observe</h4>
              <p className={styles.detailP}>{practicalGuidance}</p>
            </div>
          )}
          {prayAndChant && (
            <div className={styles.educationalSection}>
              <h4 className={styles.educationalLabel}>Prayer & Hymn Guidance</h4>
              <p className={styles.detailP}>{prayAndChant}</p>
            </div>
          )}
          {notes && (
            <div className={styles.educationalSection}>
              <h4 className={styles.educationalLabel}>Notes</h4>
              <p className={styles.detailP}>{notes}</p>
            </div>
          )}
        </div>
      ),
    })
    
    if (meaning) {
      tabs.push({
        id: 'meaning',
        label: t('calendarDayTabMeaning'),
        content: <p className={styles.detailP}>{meaning}</p>,
      })
    }
    if (observance) {
      tabs.push({
        id: 'observance',
        label: t('calendarDayTabObservance'),
        content: <p className={styles.detailP}>{observance}</p>,
      })
    }
    
    // Daily Senkessar slot
    tabs.push({
      id: 'senkessar',
      label: 'Daily Senkessar',
      content: (
        <div className={styles.senkessarContent}>
          <p className={styles.senkessarPlaceholder}>
            Daily Senkessar remembrance — source not yet connected
          </p>
          <p className={styles.senkessarNote}>
            The Senkessar (Synaxarium) contains the daily remembrance of saints, 
            martyrs, and holy events. Your parish books remain the authoritative 
            source for today's commemorations.
          </p>
        </div>
      ),
    })
    
    return tabs
  }, [summary, significance, practicalGuidance, prayAndChant, notes, meaning, observance, t])
  
  const imageSrc = resolveCommemorationImage(
    commemoration.title,
    commemoration.transliterationTitle,
    commemoration.catalogEventId,
  )

  return (
    <article className={styles.card}>
      {/* Observance Type Badges */}
      {observanceTypes.length > 0 && (
        <div className={styles.observanceTypeBadges}>
          {observanceTypes.map(type => {
            const typeLabel = {
              'feast': 'Feast',
              'fast': 'Fast',
              'saint-commemoration': 'Saint',
              'marian-observance': 'Marian',
              'angel-commemoration': 'Angel',
              'movable-feast': 'Movable Feast',
              'seasonal-observance': 'Season',
              'mixed-observance': 'Mixed'
            }[type] || type
            
            return (
              <span key={type} className={`${styles.observanceBadge} ${styles[`observanceBadge--${type}`] || ''}`}>
                {typeLabel}
              </span>
            )
          })}
        </div>
      )}
      
      <figure className={styles.heroWrap}>
        <img
          src={imageSrc}
          alt=""
          className={styles.hero}
          loading="lazy"
          decoding="async"
        />
      </figure>
      
      {/* Day type badges */}
      {observanceTypes.length > 0 && (
        <div className={styles.typeRow}>
          {observanceTypes.map((type) => (
            <span key={type} className={styles.typeBadge}>
              {type.replace('-', ' ')}
            </span>
          ))}
        </div>
      )}
      
      <p className={styles.kicker}>Today we remember</p>
      <h3 className={styles.title}>{commemoration.title}</h3>
      {commemoration.transliterationTitle ? (
        <p className={styles.translit}>{commemoration.transliterationTitle}</p>
      ) : null}
      {commemoration.subtitle ? (
        <p className={styles.subtitle}>{commemoration.subtitle}</p>
      ) : null}
      <p className={styles.lead}>{lead}</p>
      {detailTabs.length > 0 ? (
        <div className={styles.detailTabs}>
          <TabPanel
            variant="compact"
            tablistAriaLabel={t('commemorationCardTabsAria')}
            tabs={detailTabs}
            initialId={detailTabs[0].id}
          />
        </div>
      ) : null}
    </article>
  )
}
