/**
 * Content status for the admin Studio: what each public game actually plays, by origin and review state.
 *
 * Three different things are easy to confuse, so they are kept apart here and labelled in the UI:
 *  1. BUNDLED in the website build: hand-approved built-in content, plus the generated bank that passed the automated
 *     validation checks. Generated items are NOT human-reviewed (their Amharic is unreviewed) and are not database rows.
 *  2. DATABASE rows (play_content_items): drafts and published rows edited through the Studio. Deploying the website
 *     never creates, changes or publishes these.
 *  3. HELD BACK: items the validation pass kept out of public play (needs source or doctrinal review), plus exact and
 *     near duplicates. They are counted for transparency and are never played.
 * Counts are read from generated files derived from the shipped content (build-published-bank.ts), never typed by hand.
 */
import type { MatchPair, PlayQuestion, WhoAmICard } from './types'
import type { TlChain } from './bibleTimeline'
import { CONTENT_COUNTS, type ContentUnit, type GameCounts } from './contentRegistry'
import { isGeneratedQuizGame, loadGeneratedCards, loadGeneratedQuestions, loadGeneratedTimelineChains } from './generatedBank'
import ledgerSummary from './generated/ledger-summary.json'
import { STUDIO_GAMES, type StudioGame } from './contentStudio'

type LedgerEntry = { published: number; duplicate: number; rejected: number; held: number; reasons: Record<string, number> }
const LEDGER = ledgerSummary as unknown as Record<string, LedgerEntry>

export type BundledStatusRow = {
  game: StudioGame
  unit: ContentUnit | 'records'
  /** Hand-approved content written in the source code. */
  builtIn: number
  /** Generated items that passed the automated checks and are bundled; awaiting human review. */
  generatedBundled: number
  /** What a visitor can play from the bundled content (built-in + generated, no repeats). */
  playable: number
  /** Kept out of public play: unresolved items awaiting source or doctrinal review. */
  heldBack: number
  /** Duplicates removed so no item is played twice. */
  duplicates: number
  heldReasons: Record<string, number>
  /** Content comes from published database records instead (Finish the Mezmur). */
  fromDatabase: boolean
}

/** Studio game id → key in counts.json / the ledger (the hub and the Studio spell two games differently). */
const keyFor = (game: StudioGame): string => (game === 'finish-the-mezmur' ? 'mezmur' : game)

export function bundledStatusRows(): BundledStatusRow[] {
  return STUDIO_GAMES.map(({ id }) => {
    const counts: GameCounts | undefined = CONTENT_COUNTS[keyFor(id)]
    const ledger = LEDGER[keyFor(id)]
    return {
      game: id,
      unit: counts?.unit ?? 'records',
      builtIn: counts?.builtIn ?? 0,
      generatedBundled: counts?.generated ?? 0,
      playable: counts?.total ?? 0,
      heldBack: ledger?.held ?? 0,
      duplicates: (ledger?.duplicate ?? 0) + (ledger?.rejected ?? 0),
      heldReasons: ledger?.reasons ?? {},
      fromDatabase: id === 'finish-the-mezmur',
    }
  })
}

export type GeneratedPreviewItem = { id: string; title: string; detail: string; reference: string }

/** The generated items for one game, read from the same bundle the public game loads. Read-only; never copied anywhere. */
export async function loadGeneratedPreview(game: StudioGame): Promise<GeneratedPreviewItem[]> {
  if (game === 'trivia' || game === 'emoji' || game === 'finish-the-verse') {
    if (!isGeneratedQuizGame(game)) return []
    return (await loadGeneratedQuestions(game)).map((question: PlayQuestion) => ({
      id: question.id,
      title: question.prompt.en,
      detail: question.options.find(option => option.key === question.correctKey)?.text.en ?? '',
      reference: question.source.label,
    }))
  }
  if (game === 'who-am-i') {
    return ((await loadGeneratedCards('who-am-i')) as WhoAmICard[]).map(card => ({ id: card.id, title: card.answer.en, detail: card.explanation.en, reference: card.source.label }))
  }
  if (game === 'match') {
    return ((await loadGeneratedCards('match')) as MatchPair[]).map(pair => ({ id: pair.id, title: `${pair.left.en} ↔ ${pair.right.en}`, detail: pair.explanation?.en ?? '', reference: pair.source.label }))
  }
  if (game === 'bible-timeline') {
    return (await loadGeneratedTimelineChains()).map((chain: TlChain) => ({ id: chain.id, title: chain.title.en, detail: `${chain.events.length} events`, reference: chain.events.map(event => event.ref).slice(0, 4).join(', ') }))
  }
  return []
}
