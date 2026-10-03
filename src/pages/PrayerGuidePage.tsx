import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import { CollectionSection } from '../components/prayerLearning/CollectionSection'
import { ContentsDrawer } from '../components/prayerLearning/ContentsDrawer'
import { GuidedStepCard } from '../components/prayerLearning/GuidedStepCard'
import { LearnHowToPrayControls } from '../components/prayerLearning/LearnHowToPrayControls'
import { LearnHowToPrayHeader } from '../components/prayerLearning/PrayerLearningHero'
import { GuidedPracticeProgress } from '../components/prayerLearning/ProgressIndicator'
import { useAuth } from '../lib/auth/useAuth'
import {
  findSectionBySlug,
  guidedSteps,
  loadLastSectionSlug,
  loadPrayerLearningTree,
  orderedLearnSections,
  saveLastSectionSlug,
  type LearningSection,
  type PrayerLearningTree,
} from '../lib/prayers/prayerLearning'
import { useLocale } from '../lib/i18n/locale'
import {
  getGuidedProgress,
  markStepLearned,
  unmarkStepLearned,
} from '../lib/prayers/prayerLearningProgress'
import ui from '../components/prayerLearning/prayerLearning.module.css'
import styles from './PrayerGuidePage.module.css'

export function PrayerGuidePage() {
  const { session } = useAuth()
  const { contentLocale: lang } = useLocale()
  const [tree, setTree] = useState<PrayerLearningTree | null | undefined>(undefined)
  const [error, setError] = useState<string | null>(null)
  const [stepIndex, setStepIndex] = useState(0)
  const [showCompletion, setShowCompletion] = useState(false)
  const [completedSlugs, setCompletedSlugs] = useState<string[]>([])
  const [openSlug, setOpenSlug] = useState<string | null>(null)
  const [tocOpen, setTocOpen] = useState(false)
  const [activeTab, setActiveTab] = useState<'guided' | 'learn'>('guided')
  const [lastSlug, setLastSlug] = useState<string | null>(null)

  useEffect(() => {
    setCompletedSlugs(getGuidedProgress().completedSlugs)
    setLastSlug(loadLastSectionSlug())
  }, [])

  useEffect(() => {
    let active = true
    setTree(undefined)
    setError(null)
    void loadPrayerLearningTree()
      .then((result) => {
        if (!active) return
        setTree(result)
        if (import.meta.env.DEV && result.source === 'seed') {
          console.info(
            '[prayerLearning] Using bundled seed. Publish prayer_learning_* rows (or prayer_guides) in Supabase for live CMS content.',
          )
        } else if (import.meta.env.DEV && result.source === 'supabase-guides') {
          console.info(
            '[prayerLearning] Using published prayer_guides. Prefer prayer_learning_* when those tables are populated.',
          )
        }
      })
      .catch((err: unknown) => {
        if (!active) return
        setTree(null)
        if (import.meta.env.DEV) console.error('[prayerLearning]', err)
        setError('Unable to load this guide right now.')
      })
    return () => {
      active = false
    }
  }, [])

  const steps = useMemo(() => guidedSteps(tree?.guided || null), [tree])

  const nextBySlug = useMemo(() => {
    const map = new Map<string, LearningSection>()
    if (!tree) return map
    const ordered = orderedLearnSections(tree)
    for (let i = 0; i < ordered.length - 1; i += 1) {
      map.set(ordered[i].sectionSlug, ordered[i + 1])
    }
    return map
  }, [tree])

  const resumeSection = useMemo(() => {
    if (!tree || !lastSlug) return null
    return findSectionBySlug(tree, lastSlug)
  }, [tree, lastSlug])

  useEffect(() => {
    if (!tree || typeof window === 'undefined') return
    const hash = window.location.hash.replace(/^#/, '')
    if (!hash) return
    navigateToSlug(hash, false)
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [tree])

  function rememberSlug(slug: string) {
    saveLastSectionSlug(slug)
    setLastSlug(slug)
  }

  async function toggleLearned(slug: string) {
    const options = { userId: session?.user?.id, totalSteps: steps.length }
    const next = completedSlugs.includes(slug)
      ? await unmarkStepLearned(slug, options)
      : await markStepLearned(slug, options)
    setCompletedSlugs(next.completedSlugs)
  }

  function goToStep(index: number) {
    setActiveTab('guided')
    setShowCompletion(false)
    const nextIndex = Math.max(0, Math.min(index, Math.max(steps.length - 1, 0)))
    setStepIndex(nextIndex)
    const step = steps[nextIndex]
    if (step) rememberSlug(step.sectionSlug)
    window.requestAnimationFrame(() => {
      document.getElementById('guided-practice')?.scrollIntoView({ behavior: 'smooth', block: 'start' })
    })
  }

  function handleNext() {
    if (stepIndex >= steps.length - 1) {
      setShowCompletion(true)
      return
    }
    goToStep(stepIndex + 1)
  }

  function navigateToSlug(targetSlug: string, updateHash = true) {
    if (targetSlug === 'learn-about-prayer') {
      setActiveTab('learn')
      if (updateHash) history.replaceState(null, '', `#${targetSlug}`)
      window.requestAnimationFrame(() => {
        document.getElementById('learn-about-prayer')?.scrollIntoView({ behavior: 'smooth', block: 'start' })
      })
      return
    }

    if (targetSlug === 'guided-practice') {
      setActiveTab('guided')
      if (updateHash) history.replaceState(null, '', `#${targetSlug}`)
      window.requestAnimationFrame(() => {
        document.getElementById('guided-practice')?.scrollIntoView({ behavior: 'smooth', block: 'start' })
      })
      return
    }

    const guidedIndex = steps.findIndex((step) => step.sectionSlug === targetSlug)
    if (guidedIndex >= 0) {
      goToStep(guidedIndex)
      if (updateHash) history.replaceState(null, '', `#${targetSlug}`)
      return
    }

    rememberSlug(targetSlug)

    const isTopLevel = tree?.learnCollections.some((collection) =>
      collection.sections.some((section) => section.sectionSlug === targetSlug),
    )
    const childParent = tree?.learnCollections
      .flatMap((collection) => collection.sections)
      .find((section) => section.children.some((child) => child.sectionSlug === targetSlug))

    setActiveTab('learn')
    if (isTopLevel) {
      setOpenSlug(targetSlug)
    } else if (childParent) {
      setOpenSlug(childParent.sectionSlug)
    } else {
      setOpenSlug(targetSlug)
    }
    if (updateHash) history.replaceState(null, '', `#${targetSlug}`)
    window.requestAnimationFrame(() => {
      document.getElementById(targetSlug)?.scrollIntoView({ behavior: 'smooth', block: 'start' })
    })
  }

  if (tree === undefined) {
    return (
      <PageSection>
        <div className={styles.skeleton} aria-busy="true" aria-label="Loading guide">
          <div className={styles.skeletonLine} style={{ width: '30%' }} />
          <div className={styles.skeletonLine} style={{ width: '55%', height: '1.8rem' }} />
          <div className={styles.skeletonLine} style={{ width: '80%' }} />
          <div className={styles.skeletonBlock} />
          <div className={styles.skeletonBlock} style={{ height: '8rem' }} />
        </div>
      </PageSection>
    )
  }

  if (error || !tree) {
    return (
      <PageSection>
        <div className={styles.shell}>
          <p className={styles.eyebrow}>Pray · Learn</p>
          <h1 className={styles.title}>Unable to load guide</h1>
          <p className={styles.deck}>
            This learning guide is not available right now. Please try again later.
          </p>
          <Link className={styles.back} to="/pray">
            ← Back to Pray
          </Link>
        </div>
      </PageSection>
    )
  }

  const currentStep = steps[stepIndex]
  const activeSlug =
    activeTab === 'guided' && currentStep && !showCompletion
      ? currentStep.sectionSlug
      : openSlug || lastSlug

  return (
    <PageSection>
      <div className={styles.layout}>
        <ContentsDrawer
          guided={tree.guided}
          learnCollections={tree.learnCollections}
          lang={lang}
          open={tocOpen}
          onOpen={() => setTocOpen(true)}
          onClose={() => setTocOpen(false)}
          onNavigate={navigateToSlug}
          activeSlug={activeSlug}
        />

        <div className={styles.main}>
          <LearnHowToPrayHeader />

          <LearnHowToPrayControls
            mode={activeTab}
            onModeChange={(mode) => {
              setActiveTab(mode)
              if (mode === 'guided') setShowCompletion(false)
            }}
          />

          {resumeSection && activeTab === 'learn' ? (
            <p className={ui.resumeBanner}>
              <span>Continue where you left off:</span>{' '}
              <button
                type="button"
                className={ui.resumeLink}
                onClick={() => navigateToSlug(resumeSection.sectionSlug)}
              >
                {resumeSection.titleEnglish} →
              </button>
            </p>
          ) : null}

          {activeTab === 'guided' ? (
            <section className={styles.guided} id="guided-practice" aria-label="Guided practice">
              {steps.length === 0 ? (
                <p className={styles.empty}>Guided practice steps are not available yet.</p>
              ) : showCompletion ? (
                <div className={ui.completion}>
                  <h2>You completed the introductory prayer journey.</h2>
                  <p>
                    Continue exploring the teachings whenever you are ready. There is no score and no
                    certificate — only a quiet path for learning.
                  </p>
                  <button
                    type="button"
                    className={ui.btnPrimary}
                    onClick={() => setActiveTab('learn')}
                  >
                    Continue learning about prayer →
                  </button>
                </div>
              ) : currentStep ? (
                <div className={styles.guidedStack} key={currentStep.sectionSlug}>
                  <GuidedPracticeProgress
                    currentIndex={stepIndex}
                    total={steps.length}
                    completedSlugs={completedSlugs}
                    stepSlugs={steps.map((step) => step.sectionSlug)}
                    stepTitles={steps.map((step) => step.titleEnglish)}
                    onSelect={goToStep}
                  />
                  <GuidedStepCard
                    section={currentStep}
                    index={stepIndex}
                    total={steps.length}
                    lang={lang}
                    learned={completedSlugs.includes(currentStep.sectionSlug)}
                    onToggleLearned={() => void toggleLearned(currentStep.sectionSlug)}
                    onBack={() => goToStep(stepIndex - 1)}
                    onNext={handleNext}
                    isLast={stepIndex === steps.length - 1}
                  />
                </div>
              ) : null}
            </section>
          ) : (
            <section className={ui.learnBlock} id="learn-about-prayer" aria-labelledby="learn-heading">
              <h2 id="learn-heading" className={ui.learnHeading}>
                Learn About Prayer
              </h2>
              <p className={ui.learnDeck}>
                Explore foundations, ways of prayer, liturgy, and the prayers of the Church.
              </p>

              {tree.learnCollections.map((collection) => (
                <CollectionSection
                  key={collection.collectionSlug}
                  collection={collection}
                  lang={lang}
                  openSlug={openSlug}
                  onToggle={(slug) => {
                    setOpenSlug((current) => (current === slug ? null : slug))
                    rememberSlug(slug)
                  }}
                  onOpenSlug={navigateToSlug}
                  nextBySlug={nextBySlug}
                />
              ))}
            </section>
          )}

          <Link className={styles.back} to="/pray">
            ← Back to Pray
          </Link>
        </div>
      </div>
    </PageSection>
  )
}
