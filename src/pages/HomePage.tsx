import { HeroSection } from '../components/home/HeroSection'
import { HomeTodayInChurchPreview } from '../components/home/HomeTodayInChurchPreview'

/**
 * Landing: hero → today-in-church preview (footer follows in shell).
 * Keep this page a calm daily entry point — deeper features live elsewhere.
 */
export function HomePage() {
  return (
    <>
      <HeroSection />
      <HomeTodayInChurchPreview />
    </>
  )
}
