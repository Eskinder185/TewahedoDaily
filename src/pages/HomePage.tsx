import { lazy, Suspense } from 'react'
import { HeroSection } from '../components/home/HeroSection'

/**
 * Landing: hero first, then today-in-church preview (footer follows in shell).
 * Today section is lazy so the hero can paint without waiting on calendar chunks.
 */
const HomeTodayInChurchPreview = lazy(() =>
  import('../components/home/HomeTodayInChurchPreview').then((m) => ({
    default: m.HomeTodayInChurchPreview,
  })),
)

export function HomePage() {
  return (
    <>
      <HeroSection />
      <Suspense
        fallback={
          <section
            aria-busy="true"
            aria-label="Today in Church loading"
            style={{
              minHeight: '18rem',
              paddingBlock: '2.5rem 3rem',
              paddingInline: 'max(1rem, env(safe-area-inset-left))',
            }}
          >
            <div
              style={{
                maxWidth: '76rem',
                marginInline: 'auto',
                display: 'grid',
                gap: '1.5rem',
                gridTemplateColumns: 'minmax(0, 28rem) minmax(0, 1fr)',
              }}
            >
              <div>
                <div
                  style={{
                    height: '0.75rem',
                    width: '7rem',
                    borderRadius: 4,
                    background: 'color-mix(in srgb, currentColor 12%, transparent)',
                    marginBottom: '0.85rem',
                  }}
                />
                <div
                  style={{
                    height: '2.5rem',
                    width: '16rem',
                    maxWidth: '100%',
                    borderRadius: 6,
                    background: 'color-mix(in srgb, currentColor 10%, transparent)',
                  }}
                />
              </div>
              <div
                style={{
                  aspectRatio: '4 / 3',
                  maxWidth: '22rem',
                  borderRadius: 12,
                  background: 'color-mix(in srgb, currentColor 8%, transparent)',
                }}
              />
            </div>
          </section>
        }
      >
        <HomeTodayInChurchPreview />
      </Suspense>
    </>
  )
}
