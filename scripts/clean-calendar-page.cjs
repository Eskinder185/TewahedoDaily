const fs = require('fs');

let code = fs.readFileSync('src/pages/CalendarPage.tsx', 'utf8');

// 1. Replace searchParams effect
const oldParamEffect = `  useEffect(() => {
    if (dateParamApplied.current) return
    const raw = searchParams.get('date')
    if (!raw) return
    const d = parseGregorianAnchorIso(raw)
    if (!d) return
    dateParamApplied.current = true
    setViewYear(d.getFullYear())
    setViewMonth(d.getMonth())
    setSelectedDay(d.getDate())
    const civil = stripLocal(d)
    setRangeStart(addDays(civil, -PAST_DAYS))
    setRangeEnd(addDays(civil, FUTURE_DAYS))
  }, [searchParams])`;

const newParamEffect = `  useEffect(() => {
    const raw = searchParams.get('date')
    if (!raw) return
    const d = parseGregorianAnchorIso(raw)
    if (!d) return
    const currentIso = toIsoLocalDate(new Date(viewYear, viewMonth, selectedDay))
    if (raw === currentIso) return
    dateParamApplied.current = true
    setViewYear(d.getFullYear())
    setViewMonth(d.getMonth())
    setSelectedDay(d.getDate())
    const civil = stripLocal(d)
    setRangeStart(addDays(civil, -PAST_DAYS))
    setRangeEnd(addDays(civil, FUTURE_DAYS))
  }, [searchParams, viewYear, viewMonth, selectedDay])`;

code = code.replace(oldParamEffect, newParamEffect);

// 2. Remove computeCalendarDayMarksAsync effect
code = code.replace(/\r?\n  useEffect\(\(\) => \{\r?\n    let active = true\r?\n    void computeCalendarDayMarksAsync[^\}]*\}\r?\n  \}, \[viewYear, viewMonth\]\)/s, '');

// 3. Replace setSelectedCivilDate
const oldSetSelected = `  const setSelectedCivilDate = useCallback((d: Date) => {
    const civil = stripLocal(d)
    setViewYear(civil.getFullYear())
    setViewMonth(civil.getMonth())
    setSelectedDay(civil.getDate())
    setDetailEvent(null)
  }, [])`;

const newSetSelected = `  const setSelectedCivilDate = useCallback((d: Date, pushHistory = true) => {
    const civil = stripLocal(d)
    setViewYear(civil.getFullYear())
    setViewMonth(civil.getMonth())
    setSelectedDay(civil.getDate())
    setDetailEvent(null)
    const iso = toIsoLocalDate(civil)
    setSearchParams((prev) => {
      const next = new URLSearchParams(prev)
      if (next.get('date') === iso) return prev
      next.set('date', iso)
      return next
    }, { replace: !pushHistory })
  }, [setSearchParams])`;

code = code.replace(oldSetSelected, newSetSelected);

// 4. Replace shiftSelectedDay
const oldShift = `  const shiftSelectedDay = useCallback((delta: number) => {
    const next = addDays(new Date(viewYear, viewMonth, selectedDay), delta)
    setViewYear(next.getFullYear())
    setViewMonth(next.getMonth())
    setSelectedDay(next.getDate())
    setDetailEvent(null)
    setRangeStart((start) => {
      const civil = stripLocal(next)
      if (civil < start) return addDays(civil, -PAST_DAYS)
      return start
    })
    setRangeEnd((end) => {
      const civil = stripLocal(next)
      if (civil > end) return addDays(civil, FUTURE_DAYS)
      return end
    })
  }, [viewYear, viewMonth, selectedDay])`;

const newShift = `  const shiftSelectedDay = useCallback((delta: number) => {
    const next = addDays(new Date(viewYear, viewMonth, selectedDay), delta)
    setSelectedCivilDate(next)
    setRangeStart((start) => {
      const civil = stripLocal(next)
      if (civil < start) return addDays(civil, -PAST_DAYS)
      return start
    })
    setRangeEnd((end) => {
      const civil = stripLocal(next)
      if (civil > end) return addDays(civil, FUTURE_DAYS)
      return end
    })
  }, [viewYear, viewMonth, selectedDay, setSelectedCivilDate])`;

code = code.replace(oldShift, newShift);

// 5. Remove selectCalendarDay
code = code.replace(/\r?\n  const selectCalendarDay = \(day: number\) => \{\r?\n    setSelectedDay\(day\)\r?\n    setDetailEvent\(null\)\r?\n  \}/, '');

fs.writeFileSync('src/pages/CalendarPage.tsx', code, 'utf8');
console.log('Cleaned CalendarPage.tsx');
