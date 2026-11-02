import { adventureSourceLabel, bibleAdventureStories } from '../../lib/play/bibleAdventureStories'
import type { HotspotKit } from './adventureHotspots'

/** Short paraphrases of the cited passage, shown only after the matching checkpoint or correct answer. */
const FEEDBACK: Record<string, Array<{ found?: Record<string, string>; done?: string }>> = {
  ark: [
    { found: { ship: 'God told Noah to make rooms in the ark and seal it with pitch (Genesis 6:14).', food: 'Noah gathers food for his family and the creatures (Genesis 6:21).' } },
    { done: 'The Lord shut Noah in (Genesis 7:16).' },
    { done: 'God sets his rainbow in the cloud as the sign of the covenant (Genesis 9:13).' },
  ],
  david: [
    { found: { flock: 'David kept his father’s sheep and was delivered from the lion and the bear (1 Samuel 17:34–37).', saul: 'Saul tells David to go, and says the Lord will be with him (1 Samuel 17:37).' } },
    { done: 'David chooses five smooth stones from the brook (1 Samuel 17:40).' },
    { done: 'David strikes the Philistine with a stone from his sling (1 Samuel 17:49).' },
  ],
  daniel: [
    { found: { decree: 'The decree allows petitions only to the king for thirty days (Daniel 6:7–9).', prayer: 'Daniel prays and gives thanks to God three times a day, as before (Daniel 6:10).' } },
    { done: 'God sent his angel and shut the lions’ mouths (Daniel 6:22).' },
    { done: 'Darius wrote to all the peoples, nations and languages (Daniel 6:25).' },
  ],
  feeding: [
    { found: { crowd: 'Jesus saw the multitude, had compassion and healed their sick (Matthew 14:14).', food: 'The disciples had five loaves and two fish (Matthew 14:17).' } },
    { done: 'Jesus blessed and broke the loaves, and the disciples gave them to the multitudes (Matthew 14:19).' },
    { done: 'Twelve baskets were filled with the broken pieces left over (Matthew 14:20).' },
  ],
  storm: [
    { found: { boat: 'Jesus got into the boat and his disciples followed him (Matthew 8:23).', waves: 'A violent storm arose and the waves covered the boat while Jesus slept (Matthew 8:24).' } },
    { done: 'Jesus rebuked the wind and the sea (Matthew 8:26).' },
    { done: 'There was a great calm (Matthew 8:26).' },
  ],
}

/**
 * Visible scene state plus feedback for the illustrated stories, derived only from the shared
 * discovery/answer state (`kit.stateOf`) so animation can never bypass a checkpoint.
 */
export function storyArtState(kit: HotspotKit): { state: string; note: string } {
  const story = bibleAdventureStories.find((item) => item.id === kit.storyId)
  const scene = story?.scenes[kit.scene]
  const copy = FEEDBACK[kit.storyId]?.[kit.scene]
  if (!story || !scene || !copy) return { state: 'idle', note: '' }
  const interaction = scene.interaction
  if (interaction.kind === 'discover') {
    const seen = interaction.details.filter((detail) => kit.stateOf(detail.id) === 'selected').map((detail) => detail.id)
    return {
      state: seen.length === interaction.details.length ? 'both' : seen[0] ?? 'idle',
      note: seen.map((id) => copy.found?.[id]).filter(Boolean).join(' '),
    }
  }
  if (kit.stateOf(interaction.correctId) === 'correct') return { state: 'done', note: copy.done ?? '' }
  const wrong = interaction.choices.some((choice) => kit.stateOf(choice.id) === 'incorrect')
  return wrong ? { state: 'wrong', note: `Look again at ${adventureSourceLabel(scene.source)}.` } : { state: 'idle', note: '' }
}
