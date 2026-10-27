const fs = require('fs')

let code = fs.readFileSync('src/components/calendar/CalendarEventDetails.tsx', 'utf8').replace(/\r\n/g, '\n')

const oldKeys = `const SECTION_TITLE_KEYS: Record<string, string> = {
  what: 'calendar.page.whatIsThisHeading',
  why: 'calendar.page.whyHeading',
  important: 'calendar.page.importantHeading',
  scripture: 'calendar.page.scriptureHeading',
  fasting: 'calendar.page.fastingHeading',
  season: 'calendar.page.seasonHeading',
}`

const newKeys = `const SECTION_TITLE_KEYS: Record<string, string> = {
  what: 'calendar.page.whatIsThisHeading',
  history: 'calendar.page.historyHeading',
  why: 'calendar.page.whyHeading',
  theology: 'calendar.page.theologyHeading',
  traditions: 'calendar.page.traditionsHeading',
  important: 'calendar.page.importantHeading',
  fasting: 'calendar.page.fastingHeading',
  season: 'calendar.page.seasonHeading',
  scripture: 'calendar.page.scriptureHeading',
  mezmurs: 'calendar.page.mezmursHeading',
  prayers: 'calendar.page.prayersHeading',
  sources: 'calendar.page.sourcesHeading',
}`

if (!code.includes(oldKeys)) {
  console.error('oldKeys not found')
  process.exit(1)
}
code = code.replace(oldKeys, newKeys)
fs.writeFileSync('src/components/calendar/CalendarEventDetails.tsx', code, 'utf8')
console.log('Patched CalendarEventDetails.tsx successfully!')
