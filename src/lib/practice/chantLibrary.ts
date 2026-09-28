import { MEZMUR_ITEMS } from './mezmurData'
import { WERB_ENTRIES } from './werbData'
import { buildChantLibrary } from './chantLibraryModel'
export {
  buildChantLibrary,
  chantEntryKey,
  findMezmurInLibrary,
} from './chantLibraryModel'
export type { ChantForm, ChantLibraryEntry } from './chantLibraryModel'

/** `mezmur` = workshop mezmur chants; `werb` = werb. Mezmur: `amharic-chants.json` + `english-mezmur-chants.json`. Werb: `werb.json` plus any `type: chant` / `form: werb` rows in `amharic-chants.json`. */
/** Practice browse list: mezmur and werb from `data/chants/`, sorted by title. */
export const CHANT_LIBRARY = buildChantLibrary(MEZMUR_ITEMS, WERB_ENTRIES)
