/** Prints the merged Bible Timeline chains (built-in + validated generated) as JSON: the answer oracle the 12-game browser test
 *  uses when it plays a deployed build, which has no /src modules to import. Run: npx tsx scripts/export-timeline-chains.ts */
import { TIMELINE_CHAINS } from '../src/lib/play/bibleTimeline'
import { loadGeneratedTimelineChains, mergeById } from '../src/lib/play/generatedBank'

process.stdout.write(JSON.stringify(mergeById(TIMELINE_CHAINS, await loadGeneratedTimelineChains())))
