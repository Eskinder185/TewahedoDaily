/**
 * Single source of truth for static images in `public/images/`.
 * Add files to match these paths; do not scatter `/images/...` strings in components.
 */
/** Approximate intrinsic pixels for layout hints (CLS). Match real assets when they change. */
export const imageManifest = {
  home: {
    hero: '/images/home/home-hero-tewahedo-daily.jpg',
    /** Reserve space matching hero JPEG aspect (~3:2). */
    heroWidth: 2400,
    heroHeight: 1600,
    todayInChurch: '/images/home/lalibela.png',
    todayInChurchWidth: 1600,
    todayInChurchHeight: 1100,
  },
  movement: {
    mequamiaGuide: '/images/movement/movement-mequamia-guide.jpg',
    tsenatsilGuide: '/images/movement/movement-tsenatsil-guide.jpg',
    kebroGuide: '/images/movement/movement-kebro-guide.jpg',
  },
  about: {
    hero: '/images/about/about-hero.jpg',
    heroWidth: 1920,
    heroHeight: 1080,
  },
} as const

export type ImageManifest = typeof imageManifest

/** Instrument card thumbnails on the Movement tab; larger image optional in dialog. */
export const movementInstrumentImageById: Record<string, string> = {
  'ins-mequamia': imageManifest.movement.mequamiaGuide,
  'ins-tsenatsil': imageManifest.movement.tsenatsilGuide,
  'ins-kebro': imageManifest.movement.kebroGuide,
}
