export type ObjectState = 'idle' | 'selected' | 'correct' | 'incorrect'
export type Rect = readonly [x: number, y: number, width: number, height: number]

/** Shared by every adventure illustration so scene objects drive the same sidebar state. */
export type HotspotKit = {
  storyId: string
  scene: number
  activeObject: string | null
  locked: boolean
  stateOf: (id: string) => ObjectState
  onSelect: (id: string) => void
  onHover: (id: string | null) => void
  onFocusObject: (id: string | null) => void
}

/**
 * Accessible names for illustrated objects. Every id is an existing discovery-detail or
 * multiple-choice id of that scene; objects without an entry are drawn as plain scenery.
 */
export const HOTSPOT_LABELS: Record<string, Record<number, Record<string, string>>> = {
  sea: {
    0: { camp: 'Camp of Israel', sea: 'Red Sea waters' },
    1: { hand: 'Moses with outstretched staff' },
    2: { 'lord-moses': 'Faithful congregation' },
  },
  ark: {
    0: { ship: 'The ark under construction', food: 'Food supplies for the ark' },
    2: { rainbow: 'Rainbow in the cloud' },
  },
  david: {
    0: { flock: 'David with his father’s sheep', saul: 'King Saul' },
    1: { stones: 'Smooth stones from the brook', helmet: 'Saul’s brass helmet', sword: 'Saul’s sword' },
  },
  daniel: {
    0: { decree: 'The royal decree', prayer: 'Daniel praying at his window' },
    1: { angel: 'Angel shutting the lions’ mouths', stone: 'Stone at the mouth of the den' },
    2: { letter: 'The king’s letter to the nations' },
  },
  feeding: {
    0: { crowd: 'The crowd on the hillside', food: 'Five loaves and two fish' },
    1: { disciples: 'Disciples carrying the bread', crowd: 'The crowd on the hillside' },
    2: { twelve: 'Twelve baskets of leftover pieces' },
  },
  storm: {
    0: { boat: 'Boat with Jesus and the disciples', waves: 'Stormy waves' },
    1: { boat: 'Boat with Jesus and the disciples', wind: 'Wind and sea' },
    2: { boat: 'Boat with Jesus and the disciples', calm: 'Calm sea' },
  },
}

export const sceneHasHotspots = (storyId: string, scene: number) =>
  Object.keys(HOTSPOT_LABELS[storyId]?.[scene] ?? {}).length > 0

