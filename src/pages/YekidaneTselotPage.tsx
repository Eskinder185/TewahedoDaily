import { PrayerDocumentTabs } from '../components/prayers/PrayerDocumentTabs'
import { PrayerMediaDetailPage } from '../components/prayers/PrayerMediaDetailPage'
import { YEKIDANE_TSELOT_ENTRY } from '../lib/prayers/mediaPrayerEntries'
import { YEKIDANE_TSELOT_CONTENT } from '../lib/prayers/yekidaneTselotContent'

const RELATED_PRAYERS = [
  {
    to: '/prayers/zeweter',
    title: 'ዘወትር ጸሎት',
    transliteration: 'Zeweter Tselot',
  },
  {
    to: '/prayers/wudase-mariam',
    title: 'ውዳሴ ማርያም',
    transliteration: 'Wudase Mariam',
  },
]

export function YekidaneTselotPage() {
  return (
    <PrayerMediaDetailPage
      prayer={YEKIDANE_TSELOT_ENTRY}
      relatedPrayers={RELATED_PRAYERS}
      noteAmharic="ይህ ገጽ የዜማ ቪዲዮውን ከፒዲኤፍ የተዘጋጀ የጸሎት ጽሑፍ ጋር አንድ ላይ ያቀርባል። ለማዳመጥ፣ ለመከታተል እና ለረጅም ንባብ የተሻለ ሁኔታ ይሰጣል።"
      noteEnglish="This page now pairs the zema player with structured prayer text from the source PDF so listening, following along, and long-form reading can happen in one place."
      afterMedia={
        <PrayerDocumentTabs
          title={YEKIDANE_TSELOT_ENTRY.title}
          content={YEKIDANE_TSELOT_CONTENT}
        />
      }
    />
  )
}
