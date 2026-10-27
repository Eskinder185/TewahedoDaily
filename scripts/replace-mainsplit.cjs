const fs = require('fs')

let s = fs.readFileSync('src/pages/CalendarPage.tsx', 'utf8')
const before = s.indexOf('<div className={styles.mainSplit}>')
const after = s.indexOf('<CalendarEventDetail')

if (before !== -1 && after !== -1) {
  const repl = `{monthGridOpen ? (
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
      </div>

      `
  s = s.slice(0, before) + repl + s.slice(after)
  fs.writeFileSync('src/pages/CalendarPage.tsx', s, 'utf8')
  console.log('Replaced mainSplit successfully!')
} else {
  console.error('Indices not found:', before, after)
  process.exit(1)
}
