import { useUiLabel } from '../../lib/i18n/uiLabels'
import type { LocalizedPick } from '../../lib/prayers/localizedText'

/** Labels text that is shown in the other language because a translation is missing. */
export function LangFallbackNote({ pick }: { pick: LocalizedPick }) {
  const t = useUiLabel()
  if (!pick.fallback) return null
  return (
    <small style={{ display: 'block', opacity: 0.75, fontStyle: 'italic' }}>
      {pick.lang === 'am' ? t('prayerShownInAmharic') : t('prayerShownInEnglish')}
    </small>
  )
}
