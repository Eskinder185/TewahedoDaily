import {
  detectCalendarRoute,
  isExplanatoryTheologyQuery,
} from '../src/lib/searchBuddy/calendarStructuredSearch.ts'
import { shouldUseAmharicStructuredPath } from '../src/lib/searchBuddy/amharicStructuredSearch.ts'

const cases = [
  'What are the Five Mysteries?',
  'What are the Five Mysteries (\u12A0\u121D\u1235\u1271 \u121D\u1225\u1322\u122B\u1275)?',
  'Explain the Holy Trinity.',
  '\u121D\u1225\u1322\u122C \u1235\u120B\u1234 \u121D\u1295\u12F5\u1295 \u1290\u12CD?',
  'Find Saint George',
  'Today Synaxarium',
  '\u12E8\u12DB\u122C \u1235\u1295\u12AD\u1233\u122D',
  'Find the feast of Meskel',
  '\u12E8\u12DB\u122C \u1260\u12D3\u120D \u121D\u1295\u12F5\u1290\u12CD?',
  'Explain the difference between the Five Mysteries and Seven Sacraments.',
]

for (const c of cases) {
  process.stdout.write(
    `${JSON.stringify({
      q: c.slice(0, 60),
      theo: isExplanatoryTheologyQuery(c),
      amPath: shouldUseAmharicStructuredPath(c),
      cal: detectCalendarRoute(c)?.kind ?? null,
    })}\n`,
  )
}
