/**
 * Bible Timeline Challenge content + round builder.
 *
 * Each chain lists events in one unambiguous canonical order as narrated in
 * Scripture. Rounds sample a subset of a chain, so the correct order is always
 * the chain order. Events whose relative order is debated between Gospel
 * harmonies are deliberately excluded. Amharic labels are optional: the UI
 * falls back to English when `am` is missing. No Bible text is stored here,
 * only short event labels and references that link to the site's Bible reader.
 */
import type { AppLocale } from '../i18n/locale'

export type TlDifficulty = 'easy' | 'medium' | 'hard'
export type TlText = { en: string; am?: string }
export type TlEvent = {
  id: string
  title: TlText
  ref: string
  route: string
  note: string
}
export type TlChain = { id: string; title: TlText; events: TlEvent[] }
export type TlRound = { id: string; chainId: string; chainTitle: TlText; events: TlEvent[] }

export const TL_SIZE: Record<TlDifficulty, { min: number; max: number }> = {
  easy: { min: 3, max: 4 },
  medium: { min: 5, max: 6 },
  hard: { min: 7, max: 8 },
}

const e = (id: string, en: string, am: string | undefined, ref: string, route: string, note: string): TlEvent => ({ id, title: { en, am }, ref, route, note })

export const TIMELINE_CHAINS: TlChain[] = [
  {
    id: 'beginnings', title: { en: 'Creation to Babel', am: 'ከፍጥረት እስከ ባቢሎን' },
    events: [
      e('creation-light', 'God creates light', 'እግዚአብሔር ብርሃንን ፈጠረ', 'Genesis 1:3', '/bible/genesis/1', 'Light is the first thing God speaks into being.'),
      e('creation-humans', 'God creates man and woman', 'እግዚአብሔር ወንድና ሴትን ፈጠረ', 'Genesis 1:27', '/bible/genesis/1', 'Humanity is created on the sixth day, after the light.'),
      e('the-fall', 'Adam and Eve eat the forbidden fruit', 'አዳምና ሔዋን የተከለከለውን ፍሬ በሉ', 'Genesis 3:6', '/bible/genesis/3', 'The Fall follows creation and precedes the expulsion from Eden.'),
      e('cain-abel', 'Cain kills Abel', 'ቃየል አቤልን ገደለ', 'Genesis 4:8', '/bible/genesis/4', 'The first murder comes in the generation after Eden.'),
      e('noah-ark', 'Noah is told to build the ark', 'ኖኅ መርከብን እንዲሠራ ታዘዘ', 'Genesis 6:14', '/bible/genesis/6', 'God commands the ark because of the wickedness filling the earth.'),
      e('the-flood', 'The flood comes', 'የጥፋት ውኃ መጣ', 'Genesis 7:10', '/bible/genesis/7', 'The waters come seven days after Noah enters the ark.'),
      e('rainbow', 'God sets the rainbow as His covenant', 'እግዚአብሔር ቀስተ ደመናን የኪዳን ምልክት አደረገ', 'Genesis 9:13', '/bible/genesis/9', 'The covenant sign is given after the waters recede.'),
      e('babel', 'The tower of Babel', 'የባቢሎን ግንብ', 'Genesis 11:9', '/bible/genesis/11', 'Babel comes after the flood, as Noah’s descendants spread out.'),
    ],
  },
  {
    id: 'exodus', title: { en: 'Patriarchs to Sinai', am: 'ከአባቶች እስከ ሲና' },
    events: [
      e('abram-call', 'God calls Abram to leave his land', 'እግዚአብሔር አብራምን ከሀገሩ እንዲወጣ ጠራው', 'Genesis 12:1', '/bible/genesis/12', 'The story of the patriarchs begins with Abram’s call.'),
      e('isaac-born', 'Isaac is born to Abraham and Sarah', 'ይስሐቅ ለአብርሃምና ለሣራ ተወለደ', 'Genesis 21:2', '/bible/genesis/21', 'The promised son is born when Abraham is old.'),
      e('jacob-ladder', 'Jacob dreams of the ladder to heaven', 'ያዕቆብ ወደ ሰማይ የሚደርስ መሰላል በሕልም አየ', 'Genesis 28:12', '/bible/genesis/28', 'Jacob’s dream comes as he flees from Esau.'),
      e('joseph-sold', 'Joseph is sold by his brothers', 'ዮሴፍ በወንድሞቹ ተሸጠ', 'Genesis 37:28', '/bible/genesis/37', 'Joseph’s sale leads to Israel’s settling in Egypt.'),
      e('moses-basket', 'Baby Moses is hidden in a basket on the Nile', 'ሕፃኑ ሙሴ በዓባይ ዳር በሸንበቆ ሣጥን ተሸሸገ', 'Exodus 2:3', '/bible/exodus/2', 'This is Moses’ infancy, long before the exodus.'),
      e('burning-bush', 'Moses meets God at the burning bush', 'ሙሴ በሚነደው ቊጥቋጦ እግዚአብሔርን አገኘ', 'Exodus 3:2', '/bible/exodus/3', 'God commissions Moses to lead Israel out of Egypt.'),
      e('passover', 'The first Passover and the death of the firstborn', 'የመጀመሪያው ፋሲካና የበኵር ልጆች ሞት', 'Exodus 12:29', '/bible/exodus/12', 'The final plague leads Pharaoh to release Israel.'),
      e('red-sea', 'Israel crosses the Red Sea', 'እስራኤል ቀይ ባሕርን ተሻገሩ', 'Exodus 14:21', '/bible/exodus/14', 'The crossing follows the Passover night.'),
      e('manna', 'God sends manna in the wilderness', 'እግዚአብሔር በምድረ በዳ መና ላከ', 'Exodus 16:14', '/bible/exodus/16', 'Manna begins after the crossing and before Sinai.'),
      e('commandments', 'The Ten Commandments are given at Sinai', 'አሥርቱ ትእዛዛት በሲና ተሰጡ', 'Exodus 20:1', '/bible/exodus/20', 'The law is given at Sinai after the journey from Egypt.'),
    ],
  },
  {
    id: 'kings', title: { en: 'The Kings of Israel', am: 'የእስራኤል ነገሥታት' },
    events: [
      e('saul-anointed', 'Samuel anoints Saul as king', 'ሳሙኤል ሳኦልን በንጉሥነት ቀባው', '1 Samuel 10:1', '/bible/1-samuel/10', 'Saul is the first king of Israel.'),
      e('david-anointed', 'Samuel anoints David', 'ሳሙኤል ዳዊትን ቀባው', '1 Samuel 16:13', '/bible/1-samuel/16', 'David is anointed while Saul is still on the throne.'),
      e('goliath', 'David defeats Goliath', 'ዳዊት ጎልያድን አሸነፈ', '1 Samuel 17:49', '/bible/1-samuel/17', 'The victory comes soon after David’s anointing.'),
      e('ark-jerusalem', 'David brings the ark to Jerusalem', 'ዳዊት ታቦቱን ወደ ኢየሩሳሌም አመጣ', '2 Samuel 6:12', '/bible/2-samuel/6', 'This happens in David’s reign as king.'),
      e('temple-dedicated', 'Solomon dedicates the temple', 'ሰሎሞን ቤተ መቅደሱን ቀደሰ', '1 Kings 8:22', '/bible/1-kings/8', 'Solomon, David’s son, builds and dedicates the temple.'),
      e('kingdom-divided', 'The kingdom divides after Solomon', 'ከሰሎሞን በኋላ መንግሥቱ ተከፈለ', '1 Kings 12:16', '/bible/1-kings/12', 'Israel splits from Judah under Rehoboam.'),
      e('carmel', 'Elijah’s contest on Mount Carmel', 'የኤልያስ ፈተና በቀርሜሎስ ተራራ', '1 Kings 18:38', '/bible/1-kings/18', 'It happens in the divided kingdom, in Ahab’s reign.'),
      e('samaria-falls', 'Samaria falls to Assyria', 'ሰማርያ በአሦር እጅ ወደቀች', '2 Kings 17:6', '/bible/2-kings/17', 'The northern kingdom ends before Jerusalem’s fall.'),
      e('jerusalem-falls', 'Jerusalem is burned and Judah goes into exile', 'ኢየሩሳሌም ተቃጠለች፤ ይሁዳም ተማረከ', '2 Kings 25:9', '/bible/2-kings/25', 'The fall of Jerusalem closes the books of Kings.'),
    ],
  },
  {
    id: 'christ', title: { en: 'The Life of Christ', am: 'የክርስቶስ ሕይወት' },
    events: [
      e('annunciation', 'Gabriel announces Christ’s birth to Mary', 'ገብርኤል የክርስቶስን መወለድ ለማርያም አበሰረ', 'Luke 1:31', '/bible/luke/1', 'The annunciation comes before the birth.'),
      e('nativity', 'Christ is born in Bethlehem', 'ክርስቶስ በቤተልሔም ተወለደ', 'Luke 2:7', '/bible/luke/2', 'The nativity begins Christ’s earthly life.'),
      e('egypt', 'The Holy Family flees to Egypt', 'ቅድስት ቤተሰብ ወደ ግብፅ ሸሸ', 'Matthew 2:14', '/bible/matthew/2', 'Joseph takes the child to Egypt to escape Herod.'),
      e('baptism', 'Christ is baptised in the Jordan', 'ክርስቶስ በዮርዳኖስ ተጠመቀ', 'Matthew 3:16', '/bible/matthew/3', 'His baptism opens His public ministry.'),
      e('cana', 'The wedding at Cana', 'የቃና ዘገሊላ ሰርግ', 'John 2:1', '/bible/john/2', 'John calls this the first sign of Jesus.'),
      e('sermon', 'The Sermon on the Mount', 'የተራራው ስብከት', 'Matthew 5:1', '/bible/matthew/5', 'It comes early in the Galilean ministry.'),
      e('five-thousand', 'Christ feeds the five thousand', 'ክርስቶስ አምስት ሺህ ሰዎችን መገበ', 'Matthew 14:19', '/bible/matthew/14', 'The feeding comes later in the Galilean ministry.'),
      e('transfiguration', 'The Transfiguration', 'ደብረ ታቦር', 'Matthew 17:2', '/bible/matthew/17', 'It comes after Peter’s confession at Caesarea Philippi.'),
      e('lazarus', 'Christ raises Lazarus', 'ክርስቶስ አልዓዛርን አስነሣ', 'John 11:43', '/bible/john/11', 'Lazarus is raised shortly before Holy Week.'),
      e('palm-sunday', 'The entry into Jerusalem', 'ሆሣዕና', 'Matthew 21:8', '/bible/matthew/21', 'The entry begins Holy Week.'),
      e('last-supper', 'The Last Supper', 'የመጨረሻው እራት', 'Matthew 26:26', '/bible/matthew/26', 'It is the night before the crucifixion.'),
      e('crucifixion', 'The crucifixion', 'ስቅለት', 'Matthew 27:35', '/bible/matthew/27', 'Christ is crucified the day after the Last Supper.'),
      e('resurrection', 'The resurrection', 'ትንሣኤ', 'Matthew 28:6', '/bible/matthew/28', 'Christ rises on the third day.'),
      e('ascension', 'The ascension', 'ዕርገት', 'Acts 1:9', '/bible/acts/1', 'He ascends forty days after the resurrection.'),
      e('pentecost', 'The Holy Spirit comes at Pentecost', 'በበዓለ ሃምሳ መንፈስ ቅዱስ መጣ', 'Acts 2:4', '/bible/acts/2', 'The Spirit comes after the ascension.'),
    ],
  },
  {
    id: 'acts', title: { en: 'The Early Church', am: 'የቀደመችው ቤተ ክርስቲያን' },
    events: [
      e('acts-pentecost', 'The Spirit comes at Pentecost', 'በበዓለ ሃምሳ መንፈስ ቅዱስ መጣ', 'Acts 2:4', '/bible/acts/2', 'The Church’s public life begins at Pentecost.'),
      e('stephen', 'Stephen is stoned', 'እስጢፋኖስ በድንጋይ ተወገረ', 'Acts 7:59', '/bible/acts/7', 'Stephen is the first martyr recorded in Acts.'),
      e('damascus', 'Saul meets Christ on the road to Damascus', 'ሳውል በደማስቆ መንገድ ክርስቶስን አገኘ', 'Acts 9:3', '/bible/acts/9', 'Saul approved of Stephen’s death before he was converted.'),
      e('cornelius', 'The Spirit falls on Cornelius’ household', 'መንፈስ ቅዱስ በቆርኔሌዎስ ቤት ወረደ', 'Acts 10:44', '/bible/acts/10', 'The Gentiles are received into the Church.'),
      e('antioch', 'Disciples are first called Christians at Antioch', 'በአንጾኪያ ደቀ መዛሙርት ክርስቲያን ተባሉ', 'Acts 11:26', '/bible/acts/11', 'The name “Christian” is first used in Antioch.'),
      e('jerusalem-council', 'The Council of Jerusalem', 'የኢየሩሳሌም ጉባኤ', 'Acts 15:6', '/bible/acts/15', 'The apostles settle the question of Gentile believers.'),
      e('athens', 'Paul preaches at Athens', 'ጳውሎስ በአቴና ሰበከ', 'Acts 17:22', '/bible/acts/17', 'It happens on Paul’s second journey, after the council.'),
      e('rome', 'Paul arrives in Rome', 'ጳውሎስ ሮም ደረሰ', 'Acts 28:16', '/bible/acts/28', 'The book of Acts ends with Paul in Rome.'),
    ],
  },
]

export function timelineText(t: TlText, locale: AppLocale) {
  return locale === 'am' && t.am ? t.am : t.en
}

/** True when `order` (event ids as arranged) matches the canonical chain order. */
export function isCorrectOrder(round: TlRound, order: string[]): boolean {
  return order.length === round.events.length && round.events.every((ev, i) => ev.id === order[i])
}

/** Per-card correctness: a card is correct when it sits in its canonical slot. */
export function gradeOrder(round: TlRound, order: string[]): boolean[] {
  return order.map((id, i) => round.events[i]?.id === id)
}

/** A random start order that is guaranteed not to be already solved. */
export function scrambledOrder(round: TlRound, random: () => number = Math.random): string[] {
  const ids = round.events.map((ev) => ev.id)
  if (ids.length < 2) return ids
  let out = ids
  for (let tries = 0; tries < 20 && out.join() === ids.join(); tries++) {
    out = [...ids]
    for (let i = out.length - 1; i > 0; i--) {
      const j = Math.floor(random() * (i + 1))
      ;[out[i], out[j]] = [out[j], out[i]]
    }
  }
  if (out.join() === ids.join()) out = [...ids.slice(1), ids[0]]
  return out
}

/** Pick a random ordered subset of `size` events (chain order preserved). */
function sampleChain(chain: TlChain, size: number, random: () => number): TlRound {
  const idx = chain.events.map((_, i) => i)
  for (let i = idx.length - 1; i > 0; i--) {
    const j = Math.floor(random() * (i + 1))
    ;[idx[i], idx[j]] = [idx[j], idx[i]]
  }
  const events = idx.slice(0, size).sort((a, b) => a - b).map((i) => chain.events[i])
  return { id: `${chain.id}:${events.map((ev) => ev.id).join('+')}`, chainId: chain.id, chainTitle: chain.title, events }
}

/** Candidate rounds for a difficulty, deduped by id. Chains too short for the size are skipped. */
export function buildTimelineBank(difficulty: TlDifficulty, perChain = 24, random: () => number = Math.random, chains: TlChain[] = TIMELINE_CHAINS): TlRound[] {
  const { min, max } = TL_SIZE[difficulty]
  const byId = new Map<string, TlRound>()
  for (const chain of chains) {
    if (chain.events.length < min) continue
    for (let n = 0; n < perChain; n++) {
      const size = Math.min(chain.events.length, max, min + Math.floor(random() * (max - min + 1)))
      const round = sampleChain(chain, size, random)
      byId.set(round.id, round)
    }
  }
  return [...byId.values()]
}
