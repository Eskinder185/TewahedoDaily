import { HomeCompanionBoard } from '../components/home/HomeCompanionBoard'
import { useTranslation } from '../i18n'
import { usePageMeta } from '../lib/publicContent/usePageMeta'

export function HomePage() {
  const t = useTranslation()

  usePageMeta(t('home.hero.title'), t('home.hero.tagline'))

  return (
    <div>
      <HomeCompanionBoard />
    </div>
  )
}
