const fs = require('fs')

let file = fs.readFileSync('src/pages/CalendarPage.tsx', 'utf8')

// 1. Add monthGridOpen state
const stateTarget = `  const [rangeEnd, setRangeEnd] = useState(() => addDays(stripLocal(now), FUTURE_DAYS))`
const stateReplacement = `  const [rangeEnd, setRangeEnd] = useState(() => addDays(stripLocal(now), FUTURE_DAYS))\r\n  const [monthGridOpen, setMonthGridOpen] = useState(false)`

file = file.replace(stateTarget, stateReplacement)

// 2. Add monthToggleBtn in dateRow
const dateRowTarget = `          <button type="button" className={styles.todayBtn} onClick={jumpToday}>
            {t('calendar.page.today')}
          </button>`
const dateRowReplacement = `          <button type="button" className={styles.todayBtn} onClick={jumpToday}>
            {t('calendar.page.today')}
          </button>
          <button
            type="button"
            className={styles.monthToggleBtn}
            onClick={() => setMonthGridOpen((prev) => !prev)}
            aria-expanded={monthGridOpen}
          >
            {monthGridOpen
              ? (contentLocale === 'am' ? '▲ የቀን መቁጠሪያ ዝጋ' : '▲ Hide Month Grid')
              : (contentLocale === 'am' ? '📅 ወርሃዊ የቀን መቁጠሪያ' : '📅 Month Grid')}
          </button>`

file = file.replace(dateRowTarget.replace(/\n/g, '\r\n'), dateRowReplacement.replace(/\n/g, '\r\n'))

// 3. Replace mainSplit with responsive monthAccordionPane & dashboardContainer
const mainSplitTarget = `      <div className={styles.mainSplit}>
        <section ref={monthRef} className={styles.monthPane} aria-label={t('calendar.timeline.month')} onTouchStart={onMonthTouchStart} onTouchEnd={onMonthTouchEnd}>
          <MiniMonthCalendar
            anchor={now}
            displayYear={viewYear}
            displayMonthIndex={viewMonth}
            dayMarks={marks}
            selectedDay={selectedDay}
            onSelectDay={selectCalendarDay}
            onPrevMonth={goPrevMonth}
            onNextMonth={goNextMonth}
          />
        </section>

        <DailyFaithDashboard
          context={dayContext}
          loading={dayLoading && !dayContext}
        />
      </div>`

const mainSplitReplacement = `      {monthGridOpen ? (
        <section
          ref={monthRef}
          className={styles.monthAccordionPane}
          aria-label={t('calendar.timeline.month')}
          onTouchStart={onMonthTouchStart}
          onTouchEnd={onMonthTouchEnd}
        >
          <div className={styles.monthCardWrapper}>
            <MiniMonthCalendar
              anchor={now}
              displayYear={viewYear}
              displayMonthIndex={viewMonth}
              dayMarks={marks}
              selectedDay={selectedDay}
              onSelectDay={selectCalendarDay}
              onPrevMonth={goPrevMonth}
              onNextMonth={goNextMonth}
            />
          </div>
        </section>
      ) : null}

      <div className={styles.dashboardContainer}>
        <DailyFaithDashboard
          context={dayContext}
          loading={dayLoading && !dayContext}
        />
      </div>`

file = file.replace(mainSplitTarget.replace(/\n/g, '\r\n'), mainSplitReplacement.replace(/\n/g, '\r\n'))

fs.writeFileSync('src/pages/CalendarPage.tsx', file, 'utf8')
console.log('Successfully updated CalendarPage.tsx')
