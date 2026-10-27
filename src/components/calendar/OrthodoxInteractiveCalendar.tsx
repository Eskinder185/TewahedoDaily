import { useCallback, useEffect, useId, useMemo, useRef, useState } from 'react'
import {
  computeCalendarDayMarksAsync,
  computeEthiopianMonthMarksAsync,
  getDayPreviewInfo,
  type CalendarDayCellMark,
  type DayPreviewInfo,
} from '../../lib/churchCalendar'
import {
  daysInEthiopianMonth,
  ethiopianToGregorian,
  gregorianToEthiopian,
  isEthiopianLeapYear,
  ETHIOPIAN_MONTH_NAMES_AM,
  ETHIOPIAN_MONTH_NAMES_EN,
  WEEKDAYS_AM,
  WEEKDAYS_EN,
} from '../../lib/calendar/ethiopianCalendarEngine'
import { useLocale } from '../../lib/i18n/locale'
import styles from './OrthodoxInteractiveCalendar.module.css'

export type CalendarViewMode = 'gregorian' | 'ethiopian'

export type CalendarFilterCategory = 'all' | 'feasts' | 'marian' | 'saints' | 'fasting'

export interface OrthodoxInteractiveCalendarProps {
  selectedDate: Date
  today: Date
  locale?: string
  onSelectDate: (date: Date) => void
  initialMode?: CalendarViewMode
}

interface GridCellModel {
  key: string
  dayNumber: number
  secondaryDayNumber: number
  civilDate: Date
  isToday: boolean
  isSelected: boolean
  mark?: CalendarDayCellMark
  matchesFilter: boolean
}

const GREGORIAN_MONTHS_EN = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
]

const GREGORIAN_MONTHS_AM = [
  'ጃንዋሪ (ጥር)',
  'ፌብሩዋሪ (የካቲት)',
  'ማርች (መጋቢት)',
  'ኤፕሪል (ሚያዝያ)',
  'ሜይ (ግንቦት)',
  'ጁን (ሰኔ)',
  'ጁላይ (ሐምሌ)',
  'ኦገስት (ነሐሴ)',
  'ሴፕቴምበር (መስከረም)',
  'ኦክቶበር (ጥቅምት)',
  'ኖቬምበር (ኅዳር)',
  'ዲሴምበር (ታኅሣሥ)',
]

export function OrthodoxInteractiveCalendar({
  selectedDate,
  today,
  locale = 'en',
  onSelectDate,
  initialMode = 'gregorian',
}: OrthodoxInteractiveCalendarProps) {
  const { contentLocale } = useLocale()
  const activeLocale = locale || contentLocale || 'en'
  const isAmharic = activeLocale === 'am'

  const [viewMode, setViewMode] = useState<CalendarViewMode>(initialMode)
  const [activeFilter, setActiveFilter] = useState<CalendarFilterCategory>('all')
  const [legendOpen, setLegendOpen] = useState(false)

  // Gregorian view coordinates
  const [gregYear, setGregYear] = useState(() => selectedDate.getFullYear())
  const [gregMonth, setGregMonth] = useState(() => selectedDate.getMonth())

  // Ethiopian view coordinates
  const initialEth = useMemo(() => gregorianToEthiopian(selectedDate), [selectedDate])
  const [ethYear, setEthYear] = useState(() => initialEth.year)
  const [ethMonth, setEthMonth] = useState(() => initialEth.month)

  // Loaded day marks
  const [gregMarks, setGregMarks] = useState<ReadonlyMap<number, CalendarDayCellMark>>(new Map())
  const [ethMarks, setEthMarks] = useState<ReadonlyMap<number, CalendarDayCellMark>>(new Map())

  // Desktop hover / keyboard focus popover state
  const [hoveredCell, setHoveredCell] = useState<{
    cell: GridCellModel
    rect: DOMRect
  } | null>(null)

  const containerRef = useRef<HTMLDivElement>(null)
  const liveRegionId = useId()
  const [liveAnnouncement, setLiveAnnouncement] = useState('')

  // Sync viewed month with selectedDate changes if outside view
  useEffect(() => {
    if (viewMode === 'gregorian') {
      if (selectedDate.getFullYear() !== gregYear || selectedDate.getMonth() !== gregMonth) {
        setGregYear(selectedDate.getFullYear())
        setGregMonth(selectedDate.getMonth())
      }
    } else {
      const eth = gregorianToEthiopian(selectedDate)
      if (eth.year !== ethYear || eth.month !== ethMonth) {
        setEthYear(eth.year)
        setEthMonth(eth.month)
      }
    }
  }, [selectedDate, viewMode])

  // Fetch marks for Gregorian view
  useEffect(() => {
    let active = true
    if (viewMode === 'gregorian') {
      void computeCalendarDayMarksAsync(gregYear, gregMonth)
        .then((m) => {
          if (active) setGregMarks(m)
        })
        .catch(() => {
          if (active) setGregMarks(new Map())
        })
    }
    return () => {
      active = false
    }
  }, [viewMode, gregYear, gregMonth])

  // Fetch marks for Ethiopian view
  useEffect(() => {
    let active = true
    if (viewMode === 'ethiopian') {
      void computeEthiopianMonthMarksAsync(ethYear, ethMonth)
        .then((m) => {
          if (active) setEthMarks(m)
        })
        .catch(() => {
          if (active) setEthMarks(new Map())
        })
    }
    return () => {
      active = false
    }
  }, [viewMode, ethYear, ethMonth])

  // Mode switcher with seamless coordinate translation
  const handleModeChange = (mode: CalendarViewMode) => {
    if (mode === viewMode) return
    setViewMode(mode)
    setHoveredCell(null)
    if (mode === 'ethiopian') {
      // Transition from current Gregorian view to corresponding Ethiopian month
      const midDate = new Date(gregYear, gregMonth, 15)
      const eth = gregorianToEthiopian(midDate)
      setEthYear(eth.year)
      setEthMonth(eth.month)
      setLiveAnnouncement(
        isAmharic
          ? `ወደ የኢትዮጵያ አቆጣጠር ተቀይሯል፡ ${ETHIOPIAN_MONTH_NAMES_AM[eth.month - 1]} ${eth.year}`
          : `Switched to Ethiopian Calendar: ${ETHIOPIAN_MONTH_NAMES_EN[eth.month - 1]} ${eth.year}`
      )
    } else {
      // Transition from current Ethiopian view to corresponding Gregorian month
      const civil = ethiopianToGregorian({ year: ethYear, month: ethMonth, day: 15 })
      setGregYear(civil.year)
      setGregMonth(civil.month - 1)
      setLiveAnnouncement(
        isAmharic
          ? `ወደ ግሪጎሪያን አቆጣጠር ተቀይሯል፡ ${GREGORIAN_MONTHS_AM[civil.month - 1]} ${civil.year}`
          : `Switched to Gregorian Calendar: ${GREGORIAN_MONTHS_EN[civil.month - 1]} ${civil.year}`
      )
    }
  }

  // Navigation handlers
  const handlePrevMonth = () => {
    setHoveredCell(null)
    if (viewMode === 'gregorian') {
      if (gregMonth === 0) {
        setGregYear((y) => y - 1)
        setGregMonth(11)
      } else {
        setGregMonth((m) => m - 1)
      }
    } else {
      if (ethMonth === 1) {
        setEthYear((y) => y - 1)
        setEthMonth(13)
      } else {
        setEthMonth((m) => m - 1)
      }
    }
  }

  const handleNextMonth = () => {
    setHoveredCell(null)
    if (viewMode === 'gregorian') {
      if (gregMonth === 11) {
        setGregYear((y) => y + 1)
        setGregMonth(0)
      } else {
        setGregMonth((m) => m + 1)
      }
    } else {
      if (ethMonth === 13) {
        setEthYear((y) => y + 1)
        setEthMonth(1)
      } else {
        setEthMonth((m) => m + 1)
      }
    }
  }

  const handleJumpToday = () => {
    setHoveredCell(null)
    const todayEth = gregorianToEthiopian(today)
    setGregYear(today.getFullYear())
    setGregMonth(today.getMonth())
    setEthYear(todayEth.year)
    setEthMonth(todayEth.month)
    onSelectDate(today)
    setLiveAnnouncement(
      isAmharic
        ? `ዛሬ ተመርጧል፡ ${todayEth.day} ${ETHIOPIAN_MONTH_NAMES_AM[todayEth.month - 1]} ${todayEth.year}`
        : `Today selected: ${today.toDateString()}`
    )
  }

  // Filter matching helper
  const isMatchFilter = useCallback((mark?: CalendarDayCellMark, filter: CalendarFilterCategory = 'all'): boolean => {
    if (filter === 'all' || !mark) return true
    if (filter === 'feasts') {
      return mark.primary === 'majorFeast' || mark.primary === 'feast' || mark.primary === 'movable'
    }
    if (filter === 'marian') {
      return mark.primary === 'mary'
    }
    if (filter === 'saints') {
      return mark.primary === 'saint'
    }
    if (filter === 'fasting') {
      return mark.primary === 'fast' || mark.alsoFast === true
    }
    return true
  }, [])

  // Build grid data
  const { headerPrimary, headerSecondary, padCount, cells } = useMemo(() => {
    const todayGregYear = today.getFullYear()
    const todayGregMonth = today.getMonth()
    const todayGregDate = today.getDate()

    const selectedGregYear = selectedDate.getFullYear()
    const selectedGregMonth = selectedDate.getMonth()
    const selectedGregDate = selectedDate.getDate()

    if (viewMode === 'gregorian') {
      const firstDate = new Date(gregYear, gregMonth, 1)
      const startPad = firstDate.getDay() // 0 = Sun
      const daysInMonth = new Date(gregYear, gregMonth + 1, 0).getDate()

      // Header labels
      const mName = isAmharic ? GREGORIAN_MONTHS_AM[gregMonth] : GREGORIAN_MONTHS_EN[gregMonth]
      const prim = `${mName} ${gregYear}`

      const midEth = gregorianToEthiopian(new Date(gregYear, gregMonth, 15))
      const ethMonthName = isAmharic
        ? ETHIOPIAN_MONTH_NAMES_AM[midEth.month - 1]
        : ETHIOPIAN_MONTH_NAMES_EN[midEth.month - 1]
      const sec = `${ethMonthName} ${midEth.year} ዓ.ም.`

      const cellList: GridCellModel[] = []
      for (let d = 1; d <= daysInMonth; d++) {
        const civil = new Date(gregYear, gregMonth, d)
        const eth = gregorianToEthiopian(civil)
        const mark = gregMarks.get(d)
        const isTod = gregYear === todayGregYear && gregMonth === todayGregMonth && d === todayGregDate
        const isSel = gregYear === selectedGregYear && gregMonth === selectedGregMonth && d === selectedGregDate

        cellList.push({
          key: `g-${gregYear}-${gregMonth}-${d}`,
          dayNumber: d,
          secondaryDayNumber: eth.day,
          civilDate: civil,
          isToday: isTod,
          isSelected: isSel,
          mark,
          matchesFilter: isMatchFilter(mark, activeFilter),
        })
      }

      return {
        headerPrimary: prim,
        headerSecondary: sec,
        padCount: startPad,
        cells: cellList,
      }
    } else {
      // Ethiopian Mode
      const dim = daysInEthiopianMonth(ethYear, ethMonth)
      const firstCivil = ethiopianToGregorian({ year: ethYear, month: ethMonth, day: 1 })
      const firstCivilDate = new Date(firstCivil.year, firstCivil.month - 1, firstCivil.day)
      const startPad = firstCivilDate.getDay()

      const ethMonthName = isAmharic
        ? ETHIOPIAN_MONTH_NAMES_AM[ethMonth - 1]
        : ETHIOPIAN_MONTH_NAMES_EN[ethMonth - 1]

      const isLeap = ethMonth === 13 && isEthiopianLeapYear(ethYear)
      const leapSuffix = isLeap ? (isAmharic ? ' (ዘመነ ሉቃስ - 6 ቀናት)' : ' (Leap Year - 6 Days)') : ''
      const prim = `${ethMonthName} ${ethYear} ዓ.ም.${leapSuffix}`

      const midCivil = ethiopianToGregorian({ year: ethYear, month: ethMonth, day: 15 })
      const gregMName = isAmharic ? GREGORIAN_MONTHS_AM[midCivil.month - 1] : GREGORIAN_MONTHS_EN[midCivil.month - 1]
      const sec = `${gregMName} ${midCivil.year}`

      const cellList: GridCellModel[] = []
      for (let ed = 1; ed <= dim; ed++) {
        const civil = ethiopianToGregorian({ year: ethYear, month: ethMonth, day: ed })
        const civilDate = new Date(civil.year, civil.month - 1, civil.day)
        const mark = ethMarks.get(ed)
        const isTod =
          civil.year === todayGregYear &&
          civil.month - 1 === todayGregMonth &&
          civil.day === todayGregDate
        const isSel =
          civil.year === selectedGregYear &&
          civil.month - 1 === selectedGregMonth &&
          civil.day === selectedGregDate

        cellList.push({
          key: `e-${ethYear}-${ethMonth}-${ed}`,
          dayNumber: ed,
          secondaryDayNumber: civil.day,
          civilDate,
          isToday: isTod,
          isSelected: isSel,
          mark,
          matchesFilter: isMatchFilter(mark, activeFilter),
        })
      }

      return {
        headerPrimary: prim,
        headerSecondary: sec,
        padCount: startPad,
        cells: cellList,
      }
    }
  }, [
    viewMode,
    gregYear,
    gregMonth,
    ethYear,
    ethMonth,
    gregMarks,
    ethMarks,
    today,
    selectedDate,
    activeFilter,
    isAmharic,
    isMatchFilter,
  ])

  // Selected Day Information for Mobile and Previews
  const selectedDayPreview = useMemo(() => {
    const mark = viewMode === 'gregorian' ? gregMarks.get(selectedDate.getDate()) : undefined
    return getDayPreviewInfo(selectedDate, mark, activeLocale)
  }, [selectedDate, gregMarks, viewMode, activeLocale])

  // Hover Popover preview
  const activeHoverPreview: DayPreviewInfo | null = useMemo(() => {
    if (!hoveredCell) return null
    return getDayPreviewInfo(hoveredCell.cell.civilDate, hoveredCell.cell.mark, activeLocale)
  }, [hoveredCell, activeLocale])

  // Keyboard navigation inside month grid
  const handleKeyDown = (e: React.KeyboardEvent, cell: GridCellModel, index: number) => {
    if (e.key === 'Enter' || e.key === ' ') {
      e.preventDefault()
      onSelectDate(cell.civilDate)
      return
    }

    let targetIndex: number | null = null
    if (e.key === 'ArrowLeft') targetIndex = index - 1
    else if (e.key === 'ArrowRight') targetIndex = index + 1
    else if (e.key === 'ArrowUp') targetIndex = index - 7
    else if (e.key === 'ArrowDown') targetIndex = index + 7

    if (targetIndex != null && targetIndex >= 0 && targetIndex < cells.length) {
      e.preventDefault()
      const targetCell = cells[targetIndex]
      const el = document.getElementById(`calendar-cell-${targetCell.key}`)
      if (el) el.focus()
    }
  }

  const handleCellHover = (e: React.MouseEvent<HTMLButtonElement>, cell: GridCellModel) => {
    const rect = e.currentTarget.getBoundingClientRect()
    setHoveredCell({ cell, rect })
  }

  const handleCellFocus = (e: React.FocusEvent<HTMLButtonElement>, cell: GridCellModel) => {
    const rect = e.currentTarget.getBoundingClientRect()
    setHoveredCell({ cell, rect })
  }

  return (
    <div ref={containerRef} className={styles.calendarContainer} role="region" aria-label={isAmharic ? 'የኢትዮጵያ ኦርቶዶክስ ተዋሕዶ የቀን መቁጠሪያ' : 'Ethiopian Orthodox Church Calendar'}>
      {/* Live Region for Screen Readers */}
      <span id={liveRegionId} className="sr-only" aria-live="polite">
        {liveAnnouncement}
      </span>

      {/* 1. Header & Controls Toolbar */}
      <div className={styles.toolbar}>
        {/* Dual Calendar Mode Selector */}
        <div className={styles.modeToggleGroup} role="group" aria-label={isAmharic ? 'የቀን መቁጠሪያ እይታ' : 'Calendar View Mode'}>
          <button
            type="button"
            className={`${styles.modeBtn} ${viewMode === 'gregorian' ? styles.modeBtnActive : ''}`}
            onClick={() => handleModeChange('gregorian')}
            aria-pressed={viewMode === 'gregorian'}
          >
            {isAmharic ? 'የፈረንጆች አቆጣጠር' : 'Gregorian'}
          </button>
          <button
            type="button"
            className={`${styles.modeBtn} ${viewMode === 'ethiopian' ? styles.modeBtnActive : ''}`}
            onClick={() => handleModeChange('ethiopian')}
            aria-pressed={viewMode === 'ethiopian'}
          >
            {isAmharic ? 'የኢትዮጵያ አቆጣጠር' : 'Ethiopian'}
          </button>
        </div>

        {/* Month & Year Selectors + Navigation */}
        <div className={styles.headerRow}>
          <div className={styles.navControls}>
            <button
              type="button"
              className={styles.navArrowBtn}
              onClick={handlePrevMonth}
              aria-label={isAmharic ? 'ያለፈው ወር' : 'Previous Month'}
              title={isAmharic ? 'ያለፈው ወር' : 'Previous Month'}
            >
              ‹
            </button>
            <button
              type="button"
              className={styles.todayBtn}
              onClick={handleJumpToday}
            >
              {isAmharic ? 'ዛሬ' : 'Today'}
            </button>
            <button
              type="button"
              className={styles.navArrowBtn}
              onClick={handleNextMonth}
              aria-label={isAmharic ? 'ቀጣዩ ወር' : 'Next Month'}
              title={isAmharic ? 'ቀጣዩ ወር' : 'Next Month'}
            >
              ›
            </button>
          </div>

          <div className={styles.selectorsGroup}>
            {viewMode === 'gregorian' ? (
              <>
                <select
                  className={styles.selectDropdown}
                  value={gregMonth}
                  onChange={(e) => setGregMonth(parseInt(e.target.value, 10))}
                  aria-label={isAmharic ? 'ወር ይምረጡ' : 'Select Month'}
                >
                  {(isAmharic ? GREGORIAN_MONTHS_AM : GREGORIAN_MONTHS_EN).map((m, idx) => (
                    <option key={m} value={idx}>
                      {m}
                    </option>
                  ))}
                </select>
                <select
                  className={styles.selectDropdown}
                  value={gregYear}
                  onChange={(e) => setGregYear(parseInt(e.target.value, 10))}
                  aria-label={isAmharic ? 'ዓመት ይምረጡ' : 'Select Year'}
                >
                  {[2020, 2021, 2022, 2023, 2024, 2025, 2026, 2027, 2028, 2029, 2030, 2031, 2032].map((yr) => (
                    <option key={yr} value={yr}>
                      {yr}
                    </option>
                  ))}
                </select>
              </>
            ) : (
              <>
                <select
                  className={styles.selectDropdown}
                  value={ethMonth}
                  onChange={(e) => setEthMonth(parseInt(e.target.value, 10))}
                  aria-label={isAmharic ? 'የኢትዮጵያ ወር ይምረጡ' : 'Select Ethiopian Month'}
                >
                  {Array.from({ length: 13 }, (_, i) => i + 1).map((mNum) => {
                    const name = isAmharic ? ETHIOPIAN_MONTH_NAMES_AM[mNum - 1] : ETHIOPIAN_MONTH_NAMES_EN[mNum - 1]
                    return (
                      <option key={mNum} value={mNum}>
                        {name} {mNum === 13 ? (isAmharic ? '(5/6 ቀናት)' : '(13th Month)') : ''}
                      </option>
                    )
                  })}
                </select>
                <select
                  className={styles.selectDropdown}
                  value={ethYear}
                  onChange={(e) => setEthYear(parseInt(e.target.value, 10))}
                  aria-label={isAmharic ? 'የኢትዮጵያ ዓመት ይምረጡ' : 'Select Ethiopian Year'}
                >
                  {[2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025].map((ey) => (
                    <option key={ey} value={ey}>
                      {ey} ዓ.ም.
                    </option>
                  ))}
                </select>
              </>
            )}
          </div>
        </div>
      </div>

      {/* Primary and Alternate Headings */}
      <div className={styles.displayTitles}>
        <h2 className={styles.primaryTitle}>{headerPrimary}</h2>
        <p className={styles.secondaryTitle}>{headerSecondary}</p>
      </div>

      {/* 2. Visual Filters & Collapsible Legend */}
      <div className={styles.filterBarContainer}>
        <div className={styles.filterHeader}>
          <span className={styles.filterLabel}>
            {isAmharic ? 'ማጣሪያዎች እና ምልክቶች' : 'Categories & Legend'}:
          </span>
          <button
            type="button"
            className={styles.legendToggleBtn}
            onClick={() => setLegendOpen((v) => !v)}
            aria-expanded={legendOpen}
          >
            {legendOpen
              ? (isAmharic ? 'ምልክቶችን ደብቅ ▲' : 'Hide Legend ▲')
              : (isAmharic ? 'የምልክት ትርጉሞች ▼' : 'Legend Key ▼')}
          </button>
        </div>

        <div className={styles.filterPillsRow} role="radiogroup" aria-label={isAmharic ? 'የበዓላት ማጣሪያ' : 'Observance Filter'}>
          {(
            [
              ['all', isAmharic ? 'ሁሉም' : 'All', ''],
              ['feasts', isAmharic ? 'በዓላት' : 'Feasts', styles.dotFeast],
              ['marian', isAmharic ? 'የእመቤታችን' : 'Marian', styles.dotMary],
              ['saints', isAmharic ? 'ቅዱሳን' : 'Saints', styles.dotSaint],
              ['fasting', isAmharic ? 'ጾም' : 'Fasting', styles.dotFast],
            ] as const
          ).map(([fKey, fLabel, dotClass]) => {
            const isActive = activeFilter === fKey
            return (
              <button
                key={fKey}
                type="button"
                className={`${styles.filterPill} ${isActive ? styles.filterPillActive : ''}`}
                onClick={() => {
                  setActiveFilter(fKey)
                  setLiveAnnouncement(isAmharic ? `${fLabel} ማጣሪያ ተመርጧል` : `${fLabel} filter selected`)
                }}
                role="radio"
                aria-checked={isActive}
              >
                {dotClass ? <span className={`${styles.filterDot} ${dotClass}`} aria-hidden="true" /> : null}
                <span>{fLabel}</span>
              </button>
            )
          })}
        </div>

        {legendOpen ? (
          <ul className={styles.legendDetailsList}>
            <li className={styles.legendDetailItem}>
              <span className={`${styles.cueDot} ${styles.cueMajorFeast}`} aria-hidden="true" />
              <span>{isAmharic ? 'የጌታ ዓበይት በዓል' : 'Major Feast'}</span>
            </li>
            <li className={styles.legendDetailItem}>
              <span className={`${styles.cueDot} ${styles.cueFeast}`} aria-hidden="true" />
              <span>{isAmharic ? 'የቤተክርስቲያን በዓል' : 'Church Feast'}</span>
            </li>
            <li className={styles.legendDetailItem}>
              <span className={`${styles.cueDot} ${styles.cueMary}`} aria-hidden="true" />
              <span>{isAmharic ? 'የእመቤታችን ማርያም' : 'Marian Observance'}</span>
            </li>
            <li className={styles.legendDetailItem}>
              <span className={`${styles.cueDot} ${styles.cueSaint}`} aria-hidden="true" />
              <span>{isAmharic ? 'ቅዱሳን እና መላእክት' : 'Saints & Angels'}</span>
            </li>
            <li className={styles.legendDetailItem}>
              <span className={`${styles.cueDot} ${styles.cueFast}`} aria-hidden="true" />
              <span>{isAmharic ? 'የጾም ቀን / ወቅት' : 'Fasting Day'}</span>
            </li>
          </ul>
        ) : null}
      </div>

      {/* 3. Weekday Column Headers */}
      <div className={styles.weekdaysGrid} aria-hidden="true">
        {(isAmharic ? WEEKDAYS_AM : WEEKDAYS_EN).map((wd) => (
          <div key={wd} className={styles.weekdayHeaderCell}>
            {isAmharic ? wd : wd.slice(0, 3)}
          </div>
        ))}
      </div>

      {/* 4. Month Grid */}
      <div
        className={styles.monthGrid}
        role="grid"
        aria-label={`${headerPrimary} ${headerSecondary}`}
        onMouseLeave={() => setHoveredCell(null)}
      >
        {/* Leading empty pads */}
        {Array.from({ length: padCount }).map((_, pIdx) => (
          <div key={`empty-${pIdx}`} className={styles.cellEmpty} aria-hidden="true" />
        ))}

        {/* Day Cells */}
        {cells.map((cell, index) => {
          const { dayNumber, secondaryDayNumber, civilDate, isToday, isSelected, mark, matchesFilter } = cell

          const primaryMarkKind = mark?.primary
          const hasFast = mark?.alsoFast || mark?.primary === 'fast'

          let cueClass = ''
          if (primaryMarkKind === 'majorFeast') cueClass = styles.cueMajorFeast
          else if (primaryMarkKind === 'feast' || primaryMarkKind === 'movable') cueClass = styles.cueFeast
          else if (primaryMarkKind === 'mary') cueClass = styles.cueMary
          else if (primaryMarkKind === 'saint') cueClass = styles.cueSaint

          const ariaDate = isAmharic
            ? `${viewMode === 'ethiopian' ? 'የኢትዮጵያ' : 'የፈረንጆች'} ${dayNumber}፣ ${mark?.label ? mark.label + '።' : ''} ${hasFast ? 'የጾም ቀን' : ''}`
            : `${civilDate.toDateString()}. ${mark?.label ? mark.label + '.' : ''} ${hasFast ? 'Fast day.' : ''}`

          return (
            <button
              id={`calendar-cell-${cell.key}`}
              key={cell.key}
              type="button"
              className={`
                ${styles.dayCell}
                ${isToday ? styles.cellToday : ''}
                ${isSelected ? styles.cellSelected : ''}
              `}
              onClick={() => {
                onSelectDate(civilDate)
                setHoveredCell(null)
                setLiveAnnouncement(
                  isAmharic
                    ? `ቀን ተመርጧል፡ ${ariaDate}`
                    : `Selected date: ${civilDate.toDateString()}`
                )
              }}
              onMouseEnter={(e) => handleCellHover(e, cell)}
              onFocus={(e) => handleCellFocus(e, cell)}
              onBlur={() => setHoveredCell(null)}
              onKeyDown={(e) => handleKeyDown(e, cell, index)}
              role="gridcell"
              aria-selected={isSelected}
              aria-current={isToday ? 'date' : undefined}
              aria-label={ariaDate}
            >
              <div className={styles.cellNumbersRow}>
                <span className={styles.primaryNum}>{dayNumber}</span>
                <span className={styles.secondaryNum} aria-hidden="true">
                  {secondaryDayNumber}
                </span>
              </div>

              {/* Multi-indicator cues row */}
              <div className={styles.cuesRow} aria-hidden="true">
                {cueClass ? (
                  <span
                    className={`${styles.cueDot} ${cueClass} ${!matchesFilter ? styles.cueDimmed : ''}`}
                  />
                ) : null}
                {hasFast && primaryMarkKind !== 'fast' ? (
                  <span
                    className={`${styles.cueDot} ${styles.cueFast} ${!matchesFilter ? styles.cueDimmed : ''}`}
                  />
                ) : null}
              </div>
            </button>
          )
        })}
      </div>

      {/* 5. Desktop Popover on Hover / Focus */}
      {hoveredCell && activeHoverPreview ? (
        <div
          className={styles.desktopPopover}
          style={{
            top: `${hoveredCell.rect.bottom - (containerRef.current?.getBoundingClientRect().top || 0) + 6}px`,
            left: `${Math.min(
              Math.max(10, hoveredCell.rect.left - (containerRef.current?.getBoundingClientRect().left || 0) - 40),
              (containerRef.current?.clientWidth || 320) - 250
            )}px`,
          }}
          role="tooltip"
        >
          <div className={styles.popoverHeader}>
            <span className={styles.popoverEthDate}>{activeHoverPreview.ethiopianLabel}</span>
            <span className={styles.popoverGregDate}>{activeHoverPreview.gregorianLabel}</span>
          </div>

          <p className={styles.popoverObservance}>{activeHoverPreview.principalObservance}</p>

          <div className={styles.popoverBadgesRow}>
            <span
              className={`${styles.popoverBadge} ${
                activeHoverPreview.fastStatus.includes('ጾም') || activeHoverPreview.fastStatus.toLowerCase().includes('fast')
                  ? styles.popoverBadgeFast
                  : ''
              }`}
            >
              {activeHoverPreview.fastStatus}
            </span>
            {activeHoverPreview.commemorationsCount > 1 ? (
              <span className={styles.popoverBadge}>
                +{activeHoverPreview.commemorationsCount - 1} {isAmharic ? 'ተጨማሪ' : 'more'}
              </span>
            ) : null}
          </div>
        </div>
      ) : null}

      {/* 6. Mobile Inline Selected Day Summary */}
      <div className={styles.mobileSelectionBanner}>
        <div className={styles.mobileBannerTop}>
          <span className={styles.mobileBannerEth}>{selectedDayPreview.ethiopianLabel}</span>
          <span className={styles.mobileBannerGreg}>{selectedDayPreview.gregorianLabel}</span>
        </div>
        <p className={styles.mobileBannerObservance}>{selectedDayPreview.principalObservance}</p>
        <div className={styles.mobileBannerActions}>
          <button
            type="button"
            className={styles.mobileJumpDownLink}
            onClick={() => {
              const dash = document.querySelector('section[aria-labelledby="daily-banner-title"]')
              if (dash) {
                dash.scrollIntoView({ behavior: 'smooth' })
              }
            }}
          >
            {isAmharic ? 'የዕለቱን ትምህርት እና ንባብ ተመልከት ↓' : "View Today's Faith Dashboard ↓"}
          </button>
        </div>
      </div>
    </div>
  )
}
