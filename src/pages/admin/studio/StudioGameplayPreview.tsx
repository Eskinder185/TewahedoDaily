import type { StudioDraft } from '../../../lib/play/contentStudio'
import { validateStudioDraft } from '../../../lib/play/contentStudio'
import { WhoAmIGame } from '../../../components/play/WhoAmIGame'
import { MatchGame } from '../../../components/play/MatchGame'

/** Actual game engines with rewards disabled; never reads or writes public data. */
export function StudioGameplayPreview({ draft, locale }: { draft: StudioDraft; locale: 'en' | 'am' }) {
  const issues = validateStudioDraft(draft)
  if (issues.length) return <p role="alert">{issues.join(' ')}</p>
  return <section aria-label="Saved gameplay test"><p>Staff-only saved draft test · no publication, XP or progress changes. / የረቂቅ ሙከራ ብቻ፤ ህትመትና ነጥብ የለም።</p>
    {draft.game === 'who-am-i' ? <WhoAmIGame locale={locale} cards={[draft.content]} preview />
      : draft.game === 'match' ? <MatchGame locale={locale} pairs={draft.content} preview /> : <p>This game has no saved-engine adapter yet.</p>}
  </section>
}
