export * from './synaxariumService'
export type * from './synaxariumTypes'
/** Local JSON helpers kept for import/backup scripts — not for public Calendar runtime. */
export {
  getAllSynaxariumEntries,
  getSynaxariumEntryForEthiopianDate,
  getSynaxariumEntryForGregorianDate,
  hasDetailedSynaxariumEntry,
} from './synaxariumDataset'
