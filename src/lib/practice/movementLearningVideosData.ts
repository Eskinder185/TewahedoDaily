import type { MovementLearningVideoRaw } from '../../data/types/movementLearningVideo'
import raw from '../../data/movementLearningVideos.json'
import { parseYoutubeVideoId, youtubeThumbnailUrl } from '../../data/utils/youtube'

export type MovementLearningVideo = {
  id: string
  title: string
  description: string
  youtubeUrl: string
  thumbnailUrl?: string
}

function normalize(rawEntry: MovementLearningVideoRaw): MovementLearningVideo {
  const yid = parseYoutubeVideoId(rawEntry.youtubeUrl)
  return {
    id: rawEntry.id,
    title: rawEntry.title,
    description: rawEntry.description,
    youtubeUrl: rawEntry.youtubeUrl,
    thumbnailUrl: yid ? youtubeThumbnailUrl(yid) : undefined,
  }
}

export const MOVEMENT_LEARNING_VIDEOS: MovementLearningVideo[] = (
  raw as MovementLearningVideoRaw[]
).map(normalize)
