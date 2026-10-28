import type { DailyFaithContext } from './dailyFaithRecommendationEngine'

export type ScriptureCandidate = {
  bookSlug: string
  chapterNumber: number
  verseStart: number
  verseEnd: number
  reference: string
  subjectEn: string
  subjectAm: string
}

const passage = (bookSlug: string, chapterNumber: number, verseStart: number, verseEnd: number, reference: string, subjectEn: string, subjectAm: string): ScriptureCandidate =>
  ({ bookSlug, chapterNumber, verseStart, verseEnd, reference, subjectEn, subjectAm })

/** Thematic suggestions only. No verified daily EOTC lectionary is installed. */
export function selectDailyScriptureCandidates(context: DailyFaithContext): ScriptureCandidate[] {
  const feast = context.feasts.join(' ').toLowerCase()
  const saints = context.saints.join(' ').toLowerCase()
  const season = context.seasons.join(' ').toLowerCase()
  const choices: ScriptureCandidate[] = []
  if (/gena|nativity|christmas|ልደት/.test(feast)) {
    choices.push(passage('luke', 2, 1, 14, 'Luke 2:1–14', 'The birth of Christ', 'የክርስቶስ ልደት'), passage('john', 1, 1, 14, 'John 1:1–14', 'The Word became flesh', 'ቃል ሥጋ ሆነ'))
  } else if (/timket|epiphany|baptism|ጥምቀት/.test(feast)) {
    choices.push(passage('matthew', 3, 13, 17, 'Matthew 3:13–17', 'The baptism of Jesus', 'የኢየሱስ ጥምቀት'), passage('mark', 1, 9, 11, 'Mark 1:9–11', 'The Spirit descends', 'የመንፈስ ቅዱስ መውረድ'))
  } else if (/meskel|cross|መስቀል/.test(feast)) {
    choices.push(passage('first-corinthians', 1, 18, 25, '1 Corinthians 1:18–25', 'The word of the Cross', 'የመስቀሉ ቃል'), passage('john', 3, 14, 17, 'John 3:14–17', 'The Son lifted up for our salvation', 'ለድኅነታችን የተሰቀለው ወልድ'))
  } else if (/tinsae|fasika|easter|resurrection|ትንሣኤ|ትንሳኤ/.test(feast)) {
    choices.push(passage('john', 20, 1, 18, 'John 20:1–18', 'The risen Lord', 'የጌታ ትንሣኤ'), passage('first-corinthians', 15, 20, 28, '1 Corinthians 15:20–28', 'Christ, the first fruits of the resurrection', 'ክርስቶስ የትንሣኤ በኩር'))
  } else if (/tsige|ጽጌ/.test(season)) {
    choices.push(passage('matthew', 2, 13, 15, 'Matthew 2:13–15', 'The Holy Family in Egypt', 'የቅዱሱ ቤተሰብ ስደት ወደ ግብጽ'))
  }
  if (context.fasts.length) {
    choices.push(passage('matthew', 6, 16, 18, 'Matthew 6:16–18', 'Fasting before God', 'በእግዚአብሔር ፊት መጾም'), passage('isaiah', 58, 6, 11, 'Isaiah 58:6–11', 'Fasting and mercy', 'ጾምና ምሕረት'))
  }
  if (/mary|mariam|kidane mihret|ማርያም|ኪዳነ ምሕረት/.test(feast + ' ' + saints)) {
    choices.push(passage('luke', 1, 46, 55, 'Luke 1:46–55', 'Mary magnifies the Lord', 'የማርያም ምስጋና'), passage('luke', 1, 26, 38, 'Luke 1:26–38', 'The Annunciation', 'ብሥራተ ገብርኤል'))
  } else if (/michael|gabriel|angel|ሚካኤል|ገብርኤል|መላእክት/.test(feast + ' ' + saints)) {
    choices.push(passage('hebrews', 1, 7, 14, 'Hebrews 1:7–14', 'Angels as ministering spirits', 'መላእክት አገልጋይ መናፍስት'), passage('psalms', 103, 19, 22, 'Psalms 103:19–22', 'Bless the Lord, all His angels', 'መላእክቱ ሁሉ ጌታን ባርኩ'))
  } else if (context.saints.length) {
    choices.push(passage('hebrews', 12, 1, 3, 'Hebrews 12:1–3', 'The cloud of witnesses', 'የምስክሮች ደመና'))
  }
  choices.push(passage('matthew', 6, 5, 13, 'Matthew 6:5–13', 'Prayer and the Lord’s Prayer', 'ጸሎትና አቡነ ዘበሰማያት'), passage('philippians', 4, 4, 9, 'Philippians 4:4–9', 'Prayer, peace, and thanksgiving', 'ጸሎት፣ ሰላምና ምስጋና'), passage('psalms', 23, 1, 6, 'Psalms 23:1–6', 'The Lord is my shepherd', 'እግዚአብሔር እረኛዬ ነው'))
  const seen = new Set<string>()
  return choices.filter((candidate) => { const key = candidate.reference; if (seen.has(key)) return false; seen.add(key); return true })
}

export function calendarScriptureReaderHref(href: string, mode: 'am' | 'en' | 'parallel', date: string): string {
  const url = new URL(href, 'https://tewahedodaily.local')
  url.searchParams.set('edition', mode === 'parallel' ? 'both' : mode === 'en' ? 'web' : 'am')
  url.searchParams.set('returnTo', '/calendar?date=' + encodeURIComponent(date))
  return url.pathname + url.search + url.hash
}
