/**
 * Single source of truth for static images in `public/images/`.
 * Add files to match these paths; do not scatter `/images/...` strings in components.
 */
export const imageManifest = {
  home: {
    hero: '/images/home/home-hero-tewahedo-daily.jpg',
    todayInChurch: '/images/home/lalibela.png',
  },
  movement: {
    mequamiaGuide: '/images/movement/movement-mequamia-guide.jpg',
    tsenatsilGuide: '/images/movement/movement-tsenatsil-guide.jpg',
    kebroGuide: '/images/movement/movement-kebro-guide.jpg',
  },
  about: {
    hero: '/images/about/about-hero.jpg',
  },
} as const

export type ImageManifest = typeof imageManifest

/** Instrument card thumbnails on the Movement tab; larger image optional in dialog. */
export const movementInstrumentImageById: Record<string, string> = {
  'ins-mequamia': imageManifest.movement.mequamiaGuide,
  'ins-tsenatsil': imageManifest.movement.tsenatsilGuide,
  'ins-kebro': imageManifest.movement.kebroGuide,
}
