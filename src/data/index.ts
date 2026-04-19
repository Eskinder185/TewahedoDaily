/**
 * Canonical content types live in `./types/`.
 * Content bundles: Practice chants (`chants/amharic-chants.json` — `npm run dedupe:amharic-chants` then `npm run normalize:amharic-chants`; optional staged adds in `scripts/amharic-chant-append.json` + `npm run merge:amharic-chant-append`; `chants/english-mezmur-chants.json` — `npm run normalize:english-chants`; `chants/werb.json` — `npm run normalize:werb`); prayers/psalms (`tselot/tselot.json`, `tselot/mezmure-dawit/*.json`); `instruments.json`,
 * `shortLessons.json`, `todayInChurch.json`, `calendarEvents.json` — imported from `lib/*` for typing.
 */
export type * from './types'

export { getMockDailyChurchData } from './mocks/churchDay.mock'

export {
  parseYoutubeVideoId,
  youtubeThumbnailUrl,
  youtubeWatchUrl,
} from './utils/youtube'
export { toGregorianIsoDate } from './utils/gregorianIso'
