import { PrayerTextCard } from '../components/prayers/PrayerTextCard'
import { PrayerMediaDetailPage } from '../components/prayers/PrayerMediaDetailPage'
import { MEHARENE_AB_CONTENT } from '../lib/prayers/mehareneAbContent'
import { MEHARENE_AB_ENTRY } from '../lib/prayers/mediaPrayerEntries'

const RELATED_PRAYERS = [
  {
    to: '/prayers/yekidane-tselot',
    title: 'የኪዳን ጸሎት',
    transliteration: 'Yekidane Tselot',
  },
  {
    to: '/prayers/zeweter',
    title: 'ዘወትር ጸሎት',
    transliteration: 'Zeweter Tselot',
  },
]

export function MehareneAbPage() {
  return (
    <PrayerMediaDetailPage
      prayer={MEHARENE_AB_ENTRY}
      relatedPrayers={RELATED_PRAYERS}
      noteAmharic="ይህ ገጽ የመሐረነ አብ ዜማን ከሙሉ ጸሎት ጽሑፉ ጋር አንድ ላይ ያቀርባል። ለማዳመጥ፣ ለመከታተል እና ለምህላ ንባብ በሚመች ሁኔታ ተዘጋጅቷል።"
      noteEnglish="This page pairs the Meharene Ab zema with the full prayer text so listening, following along, and long-form supplication reading can happen together."
      afterMedia={
        <PrayerTextCard
          title={MEHARENE_AB_CONTENT.title}
          transliterationTitle={MEHARENE_AB_CONTENT.transliterationTitle}
          text={MEHARENE_AB_CONTENT.text}
        />
      }
    />
  )
}
