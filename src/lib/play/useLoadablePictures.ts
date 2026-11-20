import { useEffect, useState } from 'react'
import type { PlayImage } from './imageCatalog'

/**
 * Picture games must never ask "which feast is this?" about a picture that cannot be shown. A picture is kept when its
 * primary image or its local fallback loads. Rules that keep this safe:
 *  - a probe that has not finished after PROBE_TIMEOUT_MS counts as loadable (a slow network never removes content);
 *  - if EVERY picture fails, the network is assumed to be down and all pictures are kept (nothing is hidden by an outage);
 *  - results are cached for the page session, so replaying a game does not probe again.
 */
export const PROBE_TIMEOUT_MS = 6000
const cache = new Map<string, Promise<boolean>>()

function loads(src: string): Promise<boolean> {
  if (!src) return Promise.resolve(false)
  const known = cache.get(src)
  if (known) return known
  const probe = new Promise<boolean>((resolve) => {
    const image = new Image()
    const timer = window.setTimeout(() => resolve(true), PROBE_TIMEOUT_MS)
    image.onload = () => { window.clearTimeout(timer); resolve(true) }
    image.onerror = () => { window.clearTimeout(timer); resolve(false) }
    image.src = src
  })
  cache.set(src, probe)
  return probe
}

export const pictureLoads = async (picture: Pick<PlayImage, 'src' | 'fallbackSrc'>) => (await loads(picture.src)) || (picture.fallbackSrc ? loads(picture.fallbackSrc) : false)

export type LoadablePictures = { checking: boolean; available: PlayImage[]; skipped: PlayImage[] }

/** Pure selection rule, exported for tests: keep loadable pictures; keep all if none loaded (assume offline). */
export function selectLoadable(pictures: PlayImage[], loadable: boolean[]): { available: PlayImage[]; skipped: PlayImage[] } {
  if (!loadable.some(Boolean)) return { available: pictures, skipped: [] }
  return { available: pictures.filter((_, index) => loadable[index]), skipped: pictures.filter((_, index) => !loadable[index]) }
}

export function useLoadablePictures(pictures: PlayImage[]): LoadablePictures {
  const key = pictures.map((picture) => picture.id).join('|')
  const [state, setState] = useState<{ key: string; available: PlayImage[]; skipped: PlayImage[] } | null>(null)
  useEffect(() => {
    let active = true
    void Promise.all(pictures.map(pictureLoads)).then((loadable) => {
      if (active) setState({ key, ...selectLoadable(pictures, loadable) })
    })
    return () => { active = false }
    // `key` identifies the picture set; the array identity changes on every render of the parent.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [key])
  if (!state || state.key !== key) return { checking: true, available: pictures, skipped: [] }
  return { checking: false, available: state.available, skipped: state.skipped }
}
