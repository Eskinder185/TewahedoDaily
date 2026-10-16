import { HeroSection } from '../components/home/HeroSection'
import { HomeTodayHub } from '../components/home/HomeTodayHub'

/**
 * Companion landing: Today hub first (date + actions + deferred cards),
 * then a compact brand/hero band — not a marketing-first homepage.
 */
export function HomePage() {
  return (
    <>
      <HomeTodayHub />
      <HeroSection variant="secondary" />
    </>
  )
}
