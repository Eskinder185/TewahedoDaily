import { HeroSection } from '../components/home/HeroSection'
import { HomeTodayInChurchPreview } from '../components/home/HomeTodayInChurchPreview'

/**
 * Landing: hero → today in church (footer follows in shell).
 */
export function HomePage() {
  return (
    <>
      <HeroSection />
      <HomeTodayInChurchPreview />
    </>
  )
}
