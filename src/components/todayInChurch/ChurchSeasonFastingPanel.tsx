import { useMemo, type ReactNode } from 'react'
import type { FastingContext, LiturgicalSeason } from '../../lib/churchCalendar'
import { TabPanel } from '../ui/TabPanel'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import {
  calendarImageManifest,
  resolveSeasonSupportImage,
} from '../../content/calendarImageManifest'
import styles from './ChurchSeasonFastingPanel.module.css'

type Props = {
  season: LiturgicalSeason
  fasting: FastingContext
}

export function ChurchSeasonFastingPanel({ season, fasting }: Props) {
  const t = useUiLabel()
  const seasonImage = resolveSeasonSupportImage(season.id, fasting.seasonalFast)

  const sm = season.meaning.trim()
  const so = season.observance.trim()

  const seasonTabs = useMemo(() => {
    const tabs: { id: string; label: string; content: ReactNode }[] = []
    if (sm) {
      tabs.push({
        id: 's-meaning',
        label: t('calendarDayTabMeaning'),
        content: <p className={styles.seasonP}>{sm}</p>,
      })
    }
    if (so) {
      tabs.push({
        id: 's-observance',
        label: t('calendarDayTabObservance'),
        content: <p className={styles.seasonP}>{so}</p>,
      })
    }
    return tabs
  }, [sm, so, t])

  return (
    <div className={styles.row}>
      <article className={styles.panel}>
        <figure className={styles.panelImageWrap}>
          <img
            src={seasonImage}
            alt=""
            className={styles.panelImage}
            loading="lazy"
            decoding="async"
          />
        </figure>
        <h4 className={styles.panelTitle}>Liturgical season</h4>
        <p className={styles.panelHeadline}>{season.title}</p>
        {season.transliterationTitle ? (
          <p className={styles.translit}>{season.transliterationTitle}</p>
        ) : null}
        <p className={styles.panelChip}>{season.summary}</p>
        <p className={styles.panelBody}>{season.shortDescription}</p>
        {seasonTabs.length > 0 ? (
          <div className={styles.seasonTabs}>
            <TabPanel
              variant="compact"
              tablistAriaLabel={t('seasonCardTabsAria')}
              tabs={seasonTabs}
              initialId={seasonTabs[0].id}
            />
          </div>
        ) : null}
      </article>
      <article className={styles.panel}>
        <figure className={styles.panelImageWrap}>
          <img
            src={calendarImageManifest.support.fastingSeasonAtmosphere}
            alt=""
            className={styles.panelImage}
            loading="lazy"
            decoding="async"
          />
        </figure>
        <h4 className={styles.panelTitle}>Fasting &amp; discipline</h4>
        {fasting.weeklyFast ? (
          <p className={styles.fastLine}>{fasting.weeklyFast}</p>
        ) : (
          <p className={styles.panelMuted}>No weekly fast today (Wed/Fri).</p>
        )}
        {fasting.seasonalFast ? (
          <p className={styles.seasonFast}>{fasting.seasonalFast}</p>
        ) : (
          <p className={styles.panelMutedSmall}>
            No major seasonal fast in this mock window — confirm yearly with your parish.
          </p>
        )}
      </article>
    </div>
  )
}
