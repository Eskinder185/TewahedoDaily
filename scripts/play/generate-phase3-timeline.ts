/**
 * Phase 3 Content Generator for Bible Timeline Challenge (20 Canonical Chains).
 * Validated with validateStudioDraft and buildTimelineBank.
 */
import fs from 'node:fs'
import path from 'node:path'

process.env.VITE_SUPABASE_URL = 'https://content-studio-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'

async function run() {
  const { validateStudioDraft } = await import('../../src/lib/play/contentStudio')
  const { buildTimelineBank } = await import('../../src/lib/play/bibleTimeline')
  type TlChain = import('../../src/lib/play/bibleTimeline').TlChain

  const chains: TlChain[] = [
    // 1. Creation Week
    {
      id: 'creation-week-days',
      title: { en: 'The Six Days of Creation and the Sabbath', am: 'የሥነ ፍጥረት ስድስቱ ቀናትና ሰንበት' },
      events: [
        { id: 'p3-tl-day-1', title: { en: 'Day 1: God speaks light into existence', am: 'ቀን 1፡ እግዚአብሔር ብርሃንን በቃሉ ፈጠረ' }, ref: 'Genesis 1:3', route: '/bible/genesis/1', note: 'God said: Let there be light, separating light from darkness.' },
        { id: 'p3-tl-day-2', title: { en: 'Day 2: God establishes the firmament of heaven', am: 'ቀን 2፡ እግዚአብሔር ጠፈርን በውኃዎች መካከል አደረገ' }, ref: 'Genesis 1:6', route: '/bible/genesis/1', note: 'Dividing waters under the firmament from waters above.' },
        { id: 'p3-tl-day-3', title: { en: 'Day 3: Dry land appears and yields plants and fruit trees', am: 'ቀን 3፡ የብስ ተገለጠ፤ ሣርና ፍሬ የሚያፈራ ዛፍ በቀለ' }, ref: 'Genesis 1:9', route: '/bible/genesis/1', note: 'Gathering the seas together and adorning the earth with vegetation.' },
        { id: 'p3-tl-day-4', title: { en: 'Day 4: God places the sun, moon, and stars in the heavens', am: 'ቀን 4፡ እግዚአብሔር ፀሐይን፣ ጨረቃንና ከዋክብትን አኖረ' }, ref: 'Genesis 1:14', route: '/bible/genesis/1', note: 'To give light upon the earth and mark signs, seasons, days, and years.' },
        { id: 'p3-tl-day-5', title: { en: 'Day 5: Waters swarm with sea creatures and birds fly across the sky', am: 'ቀን 5፡ ባሕር በሕያዋን ፍጥረታት ተሞላ፤ አዕዋፍም በሰማይ በረሩ' }, ref: 'Genesis 1:20', route: '/bible/genesis/1', note: 'God blessed them, saying: Be fruitful and multiply.' },
        { id: 'p3-tl-day-6', title: { en: 'Day 6: God forms land beasts and creates man in His image', am: 'ቀን 6፡ እግዚአብሔር አራዊትን ፈጠረ፤ ሰውንም በመልኩ አበጀ' }, ref: 'Genesis 1:26', route: '/bible/genesis/1', note: 'Creating man male and female to exercise righteous stewardship.' },
        { id: 'p3-tl-day-7', title: { en: 'Day 7: God rests from all His works and sanctifies the Sabbath', am: 'ቀን 7፡ እግዚአብሔር ከሥራው ሁሉ ዐረፈ፤ ሰንበትንም ቀደሰ' }, ref: 'Genesis 2:2', route: '/bible/genesis/2', note: 'God blessed the seventh day and sanctified it as holy rest.' }
      ]
    },

    // 2. Noah and the Deluge
    {
      id: 'noah-flood-renewal',
      title: { en: 'The Great Flood and the Covenant of the Rainbow', am: 'የኖኅ የጥፋት ውኃና የቀስተ ደመና ኪዳን' },
      events: [
        { id: 'p3-tl-ark-command', title: { en: 'God commands righteous Noah to construct the ark of gopher wood', am: 'እግዚአብሔር ኖኅን ከግንድ መርከብ እንዲሠራ አዘዘው' }, ref: 'Genesis 6:14', route: '/bible/genesis/6', note: 'Building three interior decks according to precise divine dimensions.' },
        { id: 'p3-tl-animals-enter', title: { en: 'Living creatures enter the ark two by two and God shuts the door', am: 'እንስሳት ሁለት ሁለት ሆነው ገቡ፤ እግዚአብሔርም ደጁን ዘጋ' }, ref: 'Genesis 7:16', route: '/bible/genesis/7', note: 'Pairs of every flesh entered before the rains descended.' },
        { id: 'p3-tl-forty-days-rain', title: { en: 'Fountains of the deep burst and rain falls forty days and nights', am: 'የጥልቁ ምንጮች ተገነፈሉ፤ ዝናብም አርባ ቀንና ሌሊት ዘነበ' }, ref: 'Genesis 7:11', route: '/bible/genesis/7', note: 'Waters prevailed fifteen cubits above the highest mountain peaks.' },
        { id: 'p3-tl-ark-ararat', title: { en: 'The ark comes to rest upon the mountains of Ararat', am: 'መርከቧ በአራራት ተራሮች ላይ በሰላም አረፈች' }, ref: 'Genesis 8:4', route: '/bible/genesis/8', note: 'Grounding securely as the waters steadily abated.' },
        { id: 'p3-tl-dove-olive', title: { en: 'The dove returns at evening bearing a freshly plucked olive leaf', am: 'ርግቧ የወይራ ቅጠል በአፏ ይዛ በመሸ ጊዜ ተመለሰች' }, ref: 'Genesis 8:11', route: '/bible/genesis/8', note: 'Giving joyful proof that the trees of the earth were emerging.' },
        { id: 'p3-tl-rainbow-covenant', title: { en: 'God establishes the rainbow covenant never again to flood the earth', am: 'እግዚአብሔር ምድርን ዳግም ላያጠፋ የቀስተ ደመና ኪዳን አቆመ' }, ref: 'Genesis 9:13', route: '/bible/genesis/9', note: 'I set my bow in the cloud as an everlasting covenant token.' }
      ]
    },

    // 3. Journey of Patriarch Jacob
    {
      id: 'patriarch-jacob-journey',
      title: { en: 'The Patriarch Jacob: From Bethel to Peniel', am: 'የአባታችን የያዕቆብ ጉዞ፡ ከቤቴል እስከ ጵንኤል' },
      events: [
        { id: 'p3-tl-jacob-stew', title: { en: 'Jacob purchases the firstborn birthright from Esau for lentil stew', am: 'ያዕቆብ የብኩርናን መብት በምስር ወጥ ከዔሳው ገዛ' }, ref: 'Genesis 25:33', route: '/bible/genesis/25', note: 'Esau despised his spiritual birthright when returning faint from hunting.' },
        { id: 'p3-tl-isaac-blessing', title: { en: 'Isaac bestows the patriarch’s blessing upon Jacob', am: 'ይስሐቅ አባታዊውን የበረከት ቃል ለያዕቆብ ሰጠው' }, ref: 'Genesis 27:28', route: '/bible/genesis/27', note: 'May God give you of the dew of heaven and fatness of the earth.' },
        { id: 'p3-tl-bethel-ladder', title: { en: 'Jacob dreams of the heavenly ladder with ascending angels at Bethel', am: 'ያዕቆብ በቤቴል የመላእክትን መወጣጫ መሰላል በሕልም አየ' }, ref: 'Genesis 28:12', route: '/bible/genesis/28', note: 'Anointing the pillow stone with oil, naming the place House of God.' },
        { id: 'p3-tl-haran-service', title: { en: 'Jacob serves Laban twenty years in Haran and marries Leah and Rachel', am: 'ያዕቆብ በካራን ለሀያ ዓመታት ላባን አገለገለ' }, ref: 'Genesis 31:38', route: '/bible/genesis/31', note: 'Bearing twelve sons who became the founding patriarchs of Israel.' },
        { id: 'p3-tl-peniel-wrestling', title: { en: 'Jacob wrestles with the angel until dawn at Peniel and is named Israel', am: 'ያዕቆብ በጵንኤል ከመልአክ ጋር ታግሎ እስራኤል ተባለ' }, ref: 'Genesis 32:28', route: '/bible/genesis/32', note: 'You have struggled with God and with men, and have prevailed.' },
        { id: 'p3-tl-esau-reconciliation', title: { en: 'Jacob bows seven times and reconciles peacefully with his brother Esau', am: 'ያዕቆብ ሰባት ጊዜ ሰግዶ ከወንድሙ ከዔሳው ጋር ታረቀ' }, ref: 'Genesis 33:4', route: '/bible/genesis/33', note: 'Esau ran to meet him, fell on his neck, and wept with brotherly love.' }
      ]
    },

    // 4. Plagues of Egypt
    {
      id: 'plagues-of-egypt-exodus',
      title: { en: 'The Signs and Plagues of Egypt', am: 'በግብፅ የተፈጸሙት ተአምራትና መቅሠፍቶች' },
      events: [
        { id: 'p3-tl-nile-blood', title: { en: 'Aaron strikes the Nile and all waters turn to blood', am: 'አሮን ወንዙን መታ፤ የግብፅም ውኃ ሁሉ ደም ሆነ' }, ref: 'Exodus 7:20', route: '/bible/exodus/7', note: 'Fish died and the Egyptians could not drink from the river for seven days.' },
        { id: 'p3-tl-plague-frogs', title: { en: 'Frogs swarm out of rivers and cover houses throughout Egypt', am: 'ጓጉንቸሮች ከወንዝ ወጥተው የግብፅን ምድር ሸፈኑ' }, ref: 'Exodus 8:6', route: '/bible/exodus/8', note: 'Entering royal bedchambers, ovens, and kneading troughs.' },
        { id: 'p3-tl-plague-hail', title: { en: 'Severe hail mixed with blazing fire strikes fields and trees', am: 'ከእሳት ጋር የተቀላቀለ ኃይለኛ በረዶ ምድሪቱን መታ' }, ref: 'Exodus 9:24', route: '/bible/exodus/9', note: 'Shattering every tree and crop in all Egypt except in Goshen.' },
        { id: 'p3-tl-three-days-darkness', title: { en: 'Thick darkness covers Egypt for three days while Israel has light', am: 'ለሦስት ቀናት በግብፅ ላይ ድቅድቅ ጨለማ ሆነ' }, ref: 'Exodus 10:22', route: '/bible/exodus/10', note: 'No Egyptian rose from his place, but children of Israel had light.' },
        { id: 'p3-tl-firstborn-passover', title: { en: 'The tenth plague strikes the firstborn while Passover protects Israel', am: 'አሥረኛው መቅሠፍት የበኩር ልጆችን መታ፤ ፋሲካም እስራኤልን አዳነ' }, ref: 'Exodus 12:29', route: '/bible/exodus/12', note: 'The destroying angel passed over houses marked with lamb’s blood.' },
        { id: 'p3-tl-pharaoh-releases', title: { en: 'Pharaoh commands Israel to depart Egypt without delay', am: 'ፈርዖን እስራኤላውያንን በፍጥነት እንዲወጡ አዘዘ' }, ref: 'Exodus 12:31', route: '/bible/exodus/12', note: 'Israel marched out by their hosts after 430 years of dwelling in Egypt.' }
      ]
    },

    // 5. Wilderness Journey Miracles
    {
      id: 'wilderness-journey-miracles',
      title: { en: 'Deliverance and Sustenance in the Wilderness', am: 'በምድረ በዳ የተደረጉ የማዳን ተአምራት' },
      events: [
        { id: 'p3-tl-marah-sweetened', title: { en: 'Moses casts a tree into the bitter spring of Marah to make it sweet', am: 'ሙሴ እንጨት ወደ መራራው ውኃ ጥሎ አጣፈጠው' }, ref: 'Exodus 15:25', route: '/bible/exodus/15', note: 'The Lord proved them there: I am the Lord who heals you.' },
        { id: 'p3-tl-manna-begins', title: { en: 'Manna rains down daily from heaven to feed the camp', am: 'በየማለዳው መና ከሰማይ እየወረደ ሕዝቡን መገበ' }, ref: 'Exodus 16:15', route: '/bible/exodus/16', note: 'Providing daily bread for forty years until entering Canaan.' },
        { id: 'p3-tl-rephidim-water', title: { en: 'Moses strikes the rock at Horeb and streams of water pour out', am: 'ሙሴ በኮሬብ ዓለቱን መታ፤ ውኃም ፈለቀ' }, ref: 'Exodus 17:6', route: '/bible/exodus/17', note: 'Quenching the thirst of the people and their flocks at Massah.' },
        { id: 'p3-tl-hands-uplifted', title: { en: 'Aaron and Hur hold up Moses’ arms on the hill to defeat Amalek', am: 'አሮንና ሆር የሙሴን እጆች ደግፈው አማሌቅ ተሸነፈ' }, ref: 'Exodus 17:12', route: '/bible/exodus/17', note: 'Joshua overwhelmed the Amalekite army with the edge of the sword.' },
        { id: 'p3-tl-bronze-serpent-pole', title: { en: 'Moses mounts the bronze serpent on a pole so bitten victims live', am: 'ሙሴ የናሱን እባብ በዓላማ ላይ ሰቅሎ ሕዝቡ ዳኑ' }, ref: 'Numbers 21:9', route: '/bible/numbers/21', note: 'Whoever looked upon the uplifted emblem was healed from deadly venom.' }
      ]
    },

    // 6. The Story of Ruth
    {
      id: 'story-of-ruth-chronology',
      title: { en: 'The Devotion of Ruth: From Moab to Bethlehem', am: 'የሩት ታማኝነት፡ ከሞአብ እስከ ቤተልሔም' },
      events: [
        { id: 'p3-tl-ruth-cleaves', title: { en: 'Ruth clings to Naomi, declaring: Your people shall be my people', am: 'ሩት ከኑኃሚን ጋር ተጣበቀች፤ ሕዝብሽ ሕዝቤ ነው አለች' }, ref: 'Ruth 1:16', route: '/bible/ruth/1', note: 'Where you go I will go, and where you lodge I will lodge; your God my God.' },
        { id: 'p3-tl-gleaning-boaz-field', title: { en: 'Ruth gleans leftover barley in the field of wealthy Boaz', am: 'ሩት በቦዔዝ የእርሻ ቦታ የገብስ እሸት ቃረመች' }, ref: 'Ruth 2:3', route: '/bible/ruth/2', note: 'Boaz noticed her modesty and ordered reapers to let grain fall for her.' },
        { id: 'p3-tl-threshing-floor-request', title: { en: 'Ruth lies at Boaz’s feet at the threshing floor asking for redemption', am: 'ሩት በአውድማው በቦዔዝ እግር አጠገብ ተኛች' }, ref: 'Ruth 3:9', route: '/bible/ruth/3', note: 'Spread your garment over your handmaid, for you are a close redeemer.' },
        { id: 'p3-tl-boaz-gate-redemption', title: { en: 'Boaz redeems the family estate before ten elders at the city gate', am: 'ቦዔዝ በከተማይቱ በር በሽማግሌዎች ፊት ርስቱን ዋጀ' }, ref: 'Ruth 4:9', route: '/bible/ruth/4', note: 'Taking off the sandal according to ancient custom in Israel.' },
        { id: 'p3-tl-obed-born-lineage', title: { en: 'Ruth marries Boaz and gives birth to Obed, the grandfather of David', am: 'ሩት ቦዔዝን አገባች፤ የዳዊት አያት የሆነውን ኢዮቤድን ወለደች' }, ref: 'Ruth 4:17', route: '/bible/ruth/4', note: 'The women praised God: Naomi has a son who shall be a restorer of life.' }
      ]
    },

    // 7. Prophet Samuel and the Anointing
    {
      id: 'prophet-samuel-ministry',
      title: { en: 'Samuel: The Faithful Prophet and Kingmaker', am: 'ነቢዩ ሳሙኤል፡ ታማኙ ነቢይና ንጉሥ ቀቢ' },
      events: [
        { id: 'p3-tl-hannah-vow', title: { en: 'Hannah prays silently in the Shiloh tabernacle and dedicates Samuel', am: 'ሐና በሴሎ ድንኳን በጸሎት ተማጽና ሳሙኤልን ሰጠች' }, ref: '1 Samuel 1:11', route: '/bible/1-samuel/1', note: 'If you give your maidservant a male child, I will give him to the Lord.' },
        { id: 'p3-tl-samuel-night-call', title: { en: 'The Lord calls young Samuel three times during the night vigil', am: 'እግዚአብሔር በሌሊት ሳሙኤልን ሦስት ጊዜ ጠራው' }, ref: '1 Samuel 3:8', route: '/bible/1-samuel/3', note: 'Eli perceived the Lord called the boy, who answered: Speak, your servant hears.' },
        { id: 'p3-tl-ark-captured-eli', title: { en: 'The Ark is captured by the Philistines and Eli falls from his seat', am: 'ታቦቱ በፍልስጥኤማውያን ተማረከ፤ ዔሊም ከወንበሩ ወደቀ' }, ref: '1 Samuel 4:18', route: '/bible/1-samuel/4', note: 'Hearing the Ark was taken, Eli fell backward, broke his neck, and died.' },
        { id: 'p3-tl-ebenezer-stone', title: { en: 'Samuel sets up the stone Ebenezer: Thus far the Lord has helped us', am: 'ሳሙኤል አቤንኤዘር ብሎ የመታሰቢያ ድንጋይ አቆመ' }, ref: '1 Samuel 7:12', route: '/bible/1-samuel/7', note: 'Commemorating the decisive victory over the Philistine invaders at Mizpah.' },
        { id: 'p3-tl-david-anointed-horn', title: { en: 'Samuel pours the horn of oil on David among his brothers in Bethlehem', am: 'ሳሙኤል የቀንድ ዘይት በዳዊት ራስ ላይ አፈሰሰ' }, ref: '1 Samuel 16:13', route: '/bible/1-samuel/16', note: 'Man looks at the outward appearance, but the Lord looks at the heart.' }
      ]
    },

    // 8. Prophet Elijah the Tishbite
    {
      id: 'prophet-elijah-chronology',
      title: { en: 'Elijah the Tishbite: The Prophet of Fire', am: 'ነቢዩ ኤልያስ፡ የእሳቱ ነቢይ' },
      events: [
        { id: 'p3-tl-elijah-drought-proclaim', title: { en: 'Elijah confronts King Ahab and proclaims years of drought', am: 'ኤልያስ በአክዓብ ፊት ቀርቦ የድርቅን ዘመን አወጀ' }, ref: '1 Kings 17:1', route: '/bible/1-kings/17', note: 'As the Lord lives, there shall not be dew nor rain these years except at my word.' },
        { id: 'p3-tl-widow-son-raised', title: { en: 'Elijah stretches himself over the widow’s son and God restores his life', am: 'ኤልያስ በመበለቲቱ ልጅ ላይ ተዘርግቶ ከሞት አስነሣው' }, ref: '1 Kings 17:22', route: '/bible/1-kings/17', note: 'The soul of the child came into him again, and he revived.' },
        { id: 'p3-tl-carmel-sacrifice-consumed', title: { en: 'Fire consumes the water-soaked bullock on Mount Carmel', am: 'በደብረ ቀርሜሎስ መሥዋዕቱ በእሳት ተበላ' }, ref: '1 Kings 18:38', route: '/bible/1-kings/18', note: 'The people fell on their faces shouting: The Lord, He is God!' },
        { id: 'p3-tl-carmel-rain-clouds', title: { en: 'Elijah bows on Carmel until a cloud the size of a man’s hand rises', am: 'ኤልያስ በጸሎት ተደፍቶ የሰው እጅ የምታህል ደመና ታየች' }, ref: '1 Kings 18:44', route: '/bible/1-kings/18', note: 'The sky grew black with storm clouds, and there was a torrential rain.' },
        { id: 'p3-tl-naboth-vineyard-confront', title: { en: 'Elijah rebukes Ahab in Naboth’s vineyard for judicial murder', am: 'ኤልያስ አክዓብን በናቡቴ የወይን ቦታ ገሠጸው' }, ref: '1 Kings 21:20', route: '/bible/1-kings/21', note: 'Have you found me, O my enemy? You have sold yourself to do evil.' },
        { id: 'p3-tl-whirlwind-chariot', title: { en: 'Elijah ascends to heaven in a fiery chariot and whirlwind', am: 'ኤልያስ በእሳት ሰረገላና በዐውሎ ነፋስ ወደ ሰማይ ዐረገ' }, ref: '2 Kings 2:11', route: '/bible/2-kings/2', note: 'Dropping his mantle to Elisha as he crossed beyond the Jordan.' }
      ]
    },

    // 9. Prophet Elisha
    {
      id: 'prophet-elisha-ministry',
      title: { en: 'Elisha: Double Portion of the Spirit', am: 'ነቢዩ ኤልሳዕ፡ እጥፍ የመንፈስ ጸጋ' },
      events: [
        { id: 'p3-tl-elisha-takes-mantle', title: { en: 'Elisha takes up Elijah’s fallen mantle and strikes the Jordan', am: 'ኤልሳዕ የኤልያስን መጎናጸፊያ አንሥቶ ዮርዳኖስን መታ' }, ref: '2 Kings 2:14', route: '/bible/2-kings/2', note: 'Where is the Lord God of Elijah? The waters parted immediately.' },
        { id: 'p3-tl-widow-oil-pots', title: { en: 'Elisha multiplies the poor widow’s single jar of oil to fill all borrowed pots', am: 'ኤልሳዕ የመበለቲቱን ዘይት አበርክቶ ዕቃዎችን ሞላ' }, ref: '2 Kings 4:6', route: '/bible/2-kings/4', note: 'Selling the surplus oil to pay off creditors and save her sons from slavery.' },
        { id: 'p3-tl-shunammite-boy', title: { en: 'Elisha prays in the upper chamber and the Shunammite’s son sneezes seven times', am: 'ኤልሳዕ ጸለየ፤ የሱነማዊቷም ልጅ ሰባት ጊዜ አስነጥሶ ተነሣ' }, ref: '2 Kings 4:35', route: '/bible/2-kings/4', note: 'The dead boy opened his eyes, and the mother fell at Elisha’s feet in tears.' },
        { id: 'p3-tl-naaman-cleansed', title: { en: 'Naaman dips seven times in the Jordan and his leprous flesh is restored', am: 'ንዕማን በዮርዳኖስ ሰባት ጊዜ ተጠምቆ ከለምጹ ነጻ' }, ref: '2 Kings 5:14', route: '/bible/2-kings/5', note: 'His flesh became like the flesh of a little child, and he was clean.' },
        { id: 'p3-tl-dothan-chariots-fire', title: { en: 'Elisha prays and his servant sees the mountain full of horses and chariots of fire', am: 'የኤልሳዕ አገልጋይ ተራራው በእሳት ሰረገሎች መሞላቱን አየ' }, ref: '2 Kings 6:17', route: '/bible/2-kings/6', note: 'Do not fear, for those who are with us are more than those who are with them.' }
      ]
    },

    // 10. Reign of King Hezekiah
    {
      id: 'reign-of-hezekiah-chronology',
      title: { en: 'King Hezekiah: Reform, Siege, and Recovery', am: 'ንጉሥ ሕዝቅያስ፡ ተሃድሶ፣ ከበባና ፈውስ' },
      events: [
        { id: 'p3-tl-temple-doors-reopened', title: { en: 'Hezekiah opens and repairs the doors of the house of the Lord in his first month', am: 'ሕዝቅያስ በነገሠ በመጀመሪያው ወር የመቅደሱን በሮች ከፈተ' }, ref: '2 Chronicles 29:3', route: '/bible/2-chronicles/29', note: 'Consecrating priests and Levites to cleanse the sanctuary from contamination.' },
        { id: 'p3-tl-great-passover-celebrated', title: { en: 'A great nationwide Passover is celebrated with joy not seen since Solomon', am: 'ከሰሎሞን ዘመን ወዲህ ያልታየ ታላቅ ፋሲካ ተከበረ' }, ref: '2 Chronicles 30:26', route: '/bible/2-chronicles/30', note: 'Extending the sacred festival an extra seven joyful days in Jerusalem.' },
        { id: 'p3-tl-nehushtan-crushed', title: { en: 'Hezekiah breaks the bronze serpent Moses made because people burned incense to it', am: 'ሕዝቅያስ ሕዝቡ ያጥኑለት የነበረውን የናስ እባብ ሰበረው' }, ref: '2 Kings 18:4', route: '/bible/2-kings/18', note: 'Calling it Nehushtan (a mere piece of brass) to purge idolatrous superstition.' },
        { id: 'p3-tl-sennacherib-letter-spread', title: { en: 'Hezekiah spreads Sennacherib’s blasphemous threatening letter before the Lord', am: 'ሕዝቅያስ የስናክሬምን የዛቻ ደብዳቤ በእግዚአብሔር ፊት ዘረጋው' }, ref: '2 Kings 19:14', route: '/bible/2-kings/19', note: 'Praying: O Lord God of Israel, save us that all kingdoms may know You alone are God.' },
        { id: 'p3-tl-angel-strikes-assyrians', title: { en: 'The angel of the Lord strikes 185,000 Assyrian troops in their camp overnight', am: 'የእግዚአብሔር መልአክ 185 ሺህ የአሦር ወታደሮችን መታ' }, ref: '2 Kings 19:35', route: '/bible/2-kings/19', note: 'Sennacherib withdrew in shame to Nineveh, where his own sons struck him.' },
        { id: 'p3-tl-fifteen-years-added', title: { en: 'Hezekiah weeps bitterly; God adds fifteen years to his life and turns the shadow back', am: 'ሕዝቅያስ አለቀሰ፤ እግዚአብሔርም 15 ዓመታት ጨመረለት' }, ref: '2 Kings 20:6', route: '/bible/2-kings/20', note: 'The sun’s shadow reversed ten degrees on the sundial of Ahaz as a divine sign.' }
      ]
    },

    // 11. Daniel in Babylon
    {
      id: 'daniel-in-babylon-chronology',
      title: { en: 'Daniel: Faith and Prophecy in Babylon', am: 'ነቢዩ ዳንኤል፡ እምነትና ራእይ በባቢሎን' },
      events: [
        { id: 'p3-tl-pulse-vegetables', title: { en: 'Daniel and the three youths choose vegetables and water over the king’s meat', am: 'ዳንኤልና ሦስቱ ሕፃናት ከንጉሡ ማዕድ ይልቅ ጥራጥሬ መረጡ' }, ref: 'Daniel 1:12', route: '/bible/daniel/1', note: 'At the end of ten days their countenance appeared fairer and fatter than all others.' },
        { id: 'p3-tl-statue-dream-interpreted', title: { en: 'Daniel reveals Nebuchadnezzar’s dream of the great four-metal statue', am: 'ዳንኤል የአራቱን መንግሥታት ታላቅ ምስል ሕልም ፈታ' }, ref: 'Daniel 2:31', route: '/bible/daniel/2', note: 'A supernatural stone cut without hands shattered the image and filled the whole earth.' },
        { id: 'p3-tl-fiery-furnace-walk', title: { en: 'Shadrach, Meshach, and Abednego walk unharmed in the seven-times heated furnace', am: 'ሲድራቅ፣ ሚሳቅና አብደናጎ በእቶን እሳት ሳይቃጠሉ ተመላለሱ' }, ref: 'Daniel 3:25', route: '/bible/daniel/3', note: 'The form of the fourth person in the fire was like the Son of God.' },
        { id: 'p3-tl-belshazzar-handwriting', title: { en: 'Daniel interprets the mysterious handwriting on the wall at Belshazzar’s feast', am: 'ዳንኤል በግድግዳው ላይ የተጻፈውን ምስጢር ፈታ' }, ref: 'Daniel 5:25', route: '/bible/daniel/5', note: 'Mene, Mene, Tekel, Upharsin: Babylon fell that very night to Darius the Mede.' },
        { id: 'p3-tl-lions-den-preserved', title: { en: 'God shuts the lions’ mouths so Daniel emerges unhurt from the den', am: 'እግዚአብሔር የአንበሶቹን አፍ ዘግቶ ዳንኤል በሰላም ወጣ' }, ref: 'Daniel 6:22', route: '/bible/daniel/6', note: 'No injury was found on him because he trusted wholeheartedly in his God.' }
      ]
    },

    // 12. Return from Exile and Rebuilding
    {
      id: 'return-from-exile-chronology',
      title: { en: 'Return from Exile: Rebuilding Temple and Walls', am: 'ከምርኮ መመለስ፡ የመቅደሱና የቅጥሩ መታነጽ' },
      events: [
        { id: 'p3-tl-cyrus-decree', title: { en: 'King Cyrus of Persia issues the decree permitting the Jews to return to Jerusalem', am: 'የፋርስ ንጉሥ ቂሮስ አይሁድ ወደ ኢየሩሳሌም እንዲመለሱ አወጀ' }, ref: 'Ezra 1:2', route: '/bible/ezra/1', note: 'The Lord stirred the spirit of Cyrus to build Him a house in Jerusalem.' },
        { id: 'p3-tl-altar-restored-exiles', title: { en: 'Zerubbabel and Jeshua rebuild the altar of burnt offerings amidst fear', am: 'ዘሩባቤልና ኢያሱ የመሥዋዕቱን መሠዊያ እንደገና አቆሙ' }, ref: 'Ezra 3:3', route: '/bible/ezra/3', note: 'Offering morning and evening sacrifices according to the Law of Moses.' },
        { id: 'p3-tl-temple-foundation-tears', title: { en: 'The foundation of the Second Temple is laid with mixed shouts of joy and weeping', am: 'የሁለተኛው መቅደስ መሠረት በደስታና በልቅሶ ተጣለ' }, ref: 'Ezra 3:12', route: '/bible/ezra/3', note: 'Old men who had seen the first temple wept aloud while others shouted for joy.' },
        { id: 'p3-tl-haggai-zechariah-stir', title: { en: 'Prophets Haggai and Zechariah inspire the builders to resume temple work', am: 'ነቢያቱ ሐጌና ዘካርያስ ሠሪዎቹን አበረታቱ' }, ref: 'Ezra 5:1', route: '/bible/ezra/5', note: 'Not by might nor by power, but by My Spirit, says the Lord of hosts.' },
        { id: 'p3-tl-second-temple-dedicated', title: { en: 'The Second Temple is completed and dedicated with joyful Passover sacrifices', am: 'ሁለተኛው ቤተ መቅደስ ተጠናቆ በታላቅ ደስታ ተመረቀ' }, ref: 'Ezra 6:16', route: '/bible/ezra/6', note: 'Celebrating with gladness because God turned the heart of the king to assist them.' },
        { id: 'p3-tl-walls-finished-52-days', title: { en: 'Nehemiah finishes repairing Jerusalem’s collapsed walls in fifty-two days', am: 'ነህምያ የፈረሰውን የኢየሩሳሌም ቅጥር በ52 ቀናት ፈጸመ' }, ref: 'Nehemiah 6:15', route: '/bible/nehemiah/6', note: 'All surrounding enemies perceived that this work was accomplished by our God.' }
      ]
    },

    // 13. Gospel Infancy Narrative
    {
      id: 'gospel-infancy-chronology',
      title: { en: 'The Mystery of the Incarnation and Infancy of Christ', am: 'የሥጋዌ ምስጢርና የጌታችን የልጅነት ታሪክ' },
      events: [
        { id: 'p3-tl-annunciation-mary', title: { en: 'Archangel Gabriel announces the Conception of the Word to the Virgin Mary', am: 'መልአኩ ቅዱስ ገብርኤል ለእመቤታችን የልደቱን ምስጢር አበሰረ' }, ref: 'Luke 1:28', route: '/bible/luke/1', note: 'Rejoice, highly favored one, the Lord is with you; blessed are you among women.' },
        { id: 'p3-tl-visitation-elizabeth', title: { en: 'Mary visits Elizabeth; the unborn infant John leaps for joy in her womb', am: 'እመቤታችን ኤልሳቤጥን ጎበኘች፤ ዮሐንስም በማኅፀን ሰገደ' }, ref: 'Luke 1:41', route: '/bible/luke/1', note: 'Elizabeth was filled with the Holy Spirit: Blessed is the fruit of your womb!' },
        { id: 'p3-tl-bethlehem-manger-birth', title: { en: 'Christ is born in Bethlehem and wrapped in swaddling cloths in a manger', am: 'ጌታችን በቤተልሔም በረት ተወለደ፤ በጨርቅም ተጠቀለለ' }, ref: 'Luke 2:7', route: '/bible/luke/2', note: 'Glory to God in the highest, and on earth peace, goodwill toward men.' },
        { id: 'p3-tl-shepherds-visit-infant', title: { en: 'Shepherds hurry to Bethlehem and find Mary, Joseph, and the Child in the manger', am: 'እረኞች በፍጥነት መጥተው ሕፃኑን በበረት አገኙት' }, ref: 'Luke 2:16', route: '/bible/luke/2', note: 'Returning glorifying and praising God for all the things they had heard and seen.' },
        { id: 'p3-tl-presentation-temple-simeon', title: { en: 'Righteous Simeon takes the Infant Jesus in his arms in the Jerusalem Temple', am: 'ጻድቁ ስምዖን ሕፃኑን ኢየሱስን በቤተ መቅደስ ታቀፈው' }, ref: 'Luke 2:28', route: '/bible/luke/2', note: 'Lord, now let Your servant depart in peace, for my eyes have seen Your salvation.' },
        { id: 'p3-tl-magi-gifts-presented', title: { en: 'Magi from the East worship the Child and offer gold, frankincense, and myrrh', am: 'ሰብአ ሰገል ለሕፃኑ ሰግደው ወርቅ፣ ዕጣንና ከርቤ አቀረቡ' }, ref: 'Matthew 2:11', route: '/bible/matthew/2', note: 'Warned in a dream not to return to Herod, they departed to their country another way.' },
        { id: 'p3-tl-holy-family-egypt', title: { en: 'Joseph flees by night with Mary and the Child into Egypt to escape Herod', am: 'ዮሴፍ ሕፃኑንና እናቱን ይዞ በሌሊት ወደ ግብፅ ሸሸ' }, ref: 'Matthew 2:14', route: '/bible/matthew/2', note: 'Remaining in Egypt until the death of Herod to fulfill prophetic Scripture.' }
      ]
    },

    // 14. Early Public Ministry of Christ
    {
      id: 'early-public-ministry-christ',
      title: { en: 'The Inauguration of Christ’s Public Ministry', am: 'የጌታችን የይፋዊ አገልግሎት መጀመሪያ' },
      events: [
        { id: 'p3-tl-jordan-baptism-trinity', title: { en: 'Christ is baptized in the Jordan and the Holy Spirit descends like a dove', am: 'ክርስቶስ በዮርዳኖስ ተጠመቀ፤ መንፈስ ቅዱስም በርግብ አምሳል ወረደ' }, ref: 'Matthew 3:16', route: '/bible/matthew/3', note: 'The voice of the Father sounded: This is My beloved Son in whom I am well pleased.' },
        { id: 'p3-tl-forty-day-wilderness-fast', title: { en: 'Christ fasts forty days and nights, repelling Satan’s triple temptations', am: 'ክርስቶስ አርባ ቀንና ሌሊት ጾመ፤ ፈታኙን ዲያብሎስንም ድል ነሣ' }, ref: 'Matthew 4:1', route: '/bible/matthew/4', note: 'Man shall not live by bread alone, but by every word that proceeds from God’s mouth.' },
        { id: 'p3-tl-cana-water-wine-first', title: { en: 'Christ performs His first sign turning water into wine at the wedding in Cana', am: 'ክርስቶስ በቃና ዘገሊላ ውኃውን ወደ ወይን በመለወጥ የመጀመሪያውን ተአምር አደረገ' }, ref: 'John 2:11', route: '/bible/john/2', note: 'Manifesting His divine glory, and His disciples believed in Him.' },
        { id: 'p3-tl-first-cleansing-temple', title: { en: 'Christ cleanses the Temple court with a whip of cords in Jerusalem', am: 'ክርስቶስ የገመድ ጅራፍ አበጅቶ መቅደሱን ከነጋዴዎች አነጻ' }, ref: 'John 2:15', route: '/bible/john/2', note: 'Take these things away! Do not make My Father’s house a house of merchandise.' },
        { id: 'p3-tl-calling-fishermen-four', title: { en: 'Christ calls Peter, Andrew, James, and John by the Sea of Galilee', am: 'ክርስቶስ አራቱን ዓሣ አጥማጆች በገሊላ ባሕር ዳር ጠራቸው' }, ref: 'Matthew 4:19', route: '/bible/matthew/4', note: 'Follow Me, and I will make you fishers of men; they left their nets immediately.' },
        { id: 'p3-tl-sermon-mount-beatitudes', title: { en: 'Christ delivers the Sermon on the Mount and proclaims the Beatitudes', am: 'ክርስቶስ በተራራው ላይ ስብከቱን አስተማረ፤ ብፅዕናዎችንም አወጀ' }, ref: 'Matthew 5:1', route: '/bible/matthew/5', note: 'Teaching them as one having authority, and not as the scribes.' }
      ]
    },

    // 15. The Passion of Our Lord
    {
      id: 'holy-passion-chronology',
      title: { en: 'The Holy Passion and Sufferings of Christ', am: 'የጌታችን ቅዱስ ሕማማትና ስቅለት' },
      events: [
        { id: 'p3-tl-hosanna-entry-jerusalem', title: { en: 'Christ enters Jerusalem on an ass while crowds wave palm branches shouting Hosanna', am: 'ክርስቶስ በሆሣዕና በአህያ ተቀምጦ በክብር ወደ ኢየሩሳሌም ገባ' }, ref: 'Matthew 21:9', route: '/bible/matthew/21', note: 'Blessed is He who comes in the name of the Lord! Hosanna in the highest!' },
        { id: 'p3-tl-washing-feet-mystical-supper', title: { en: 'Christ washes the disciples’ feet and institutes the Holy Eucharist', am: 'ክርስቶስ የደቀ መዛሙርቱን እግር አጠበ፤ ቅዱስ ቁርባንንም መሠረተ' }, ref: 'Matthew 26:26', route: '/bible/matthew/26', note: 'Take, eat; this is My body. Drink of it, all of you; for this is My blood of the covenant.' },
        { id: 'p3-tl-gethsemane-agony-prayer', title: { en: 'Christ prays in agony in the Garden of Gethsemane with sweat like blood', am: 'ክርስቶስ በጌቴሴማኒ የአትክልት ስፍራ በታላቅ ጭንቀት ጸለየ' }, ref: 'Luke 22:44', route: '/bible/luke/22', note: 'Father, if it is Your will, take this cup from Me; nevertheless not My will, but Yours be done.' },
        { id: 'p3-tl-judas-betrayal-kiss', title: { en: 'Judas betrays the Lord with a kiss and soldiers arrest Him in the garden', am: 'ይሁዳ ጌታን በመሳም አሳልፎ ሰጠው፤ ወታደሮችም ያዙት' }, ref: 'Matthew 26:49', route: '/bible/matthew/26', note: 'Friend, why have you come? Then they laid hands on Jesus and took Him.' },
        { id: 'p3-tl-pilate-trial-handwash', title: { en: 'Pontius Pilate washes his hands and sentences Christ to be crucified', am: 'ጳንጥዮስ ጲላጦስ እጁን ታጠበ፤ ክርስቶስም እንዲሰቀል ፈረደበት' }, ref: 'Matthew 27:24', route: '/bible/matthew/27', note: 'I am innocent of the blood of this just Person; see to it yourselves.' },
        { id: 'p3-tl-golgotha-crucifixion-noon', title: { en: 'Christ is crucified at Golgotha between two thieves as darkness falls', am: 'ክርስቶስ በቀራንዮ በሁለት ወንበዴዎች መካከል ተሰቀለ' }, ref: 'Luke 23:33', route: '/bible/luke/23', note: 'Father, forgive them, for they know not what they do. At the ninth hour He yielded His spirit.' },
        { id: 'p3-tl-tomb-linen-wrapping', title: { en: 'Joseph of Arimathea and Nicodemus wrap Christ’s body and lay Him in the rock tomb', am: 'ዮሴፍና ኒቆዲሞስ የጌታን ቅዱስ ሥጋ በበፍታ ከፍነው በአዲሱ መቃብር አኖሩት' }, ref: 'John 19:40', route: '/bible/john/19', note: 'Rolling a great stone to the door of the tomb as the Sabbath drew near.' }
      ]
    },

    // 16. Resurrection to Ascension
    {
      id: 'resurrection-to-ascension-chronology',
      title: { en: 'The Glorious Resurrection and Forty Days to Ascension', am: 'ቅድስት ትንሣኤና አርባው ቀናት እስከ ዕርገት' },
      events: [
        { id: 'p3-tl-dawn-empty-tomb-angel', title: { en: 'Myrrh-bearing women find the stone rolled away and hear the angel: He is risen!', am: 'ቅዱሳት አንስት ድንጋዩ ተንከባሎ አገኙ፤ መልአኩም፡ ተነሥቷል አላቸው' }, ref: 'Matthew 28:6', route: '/bible/matthew/28', note: 'He is not here; for He is risen, as He said. Come, see the place where the Lord lay.' },
        { id: 'p3-tl-mary-magdalene-garden', title: { en: 'The Risen Christ appears first to Mary Magdalene in the garden', am: 'ትንሣኤውን የገለጠው ጌታ በመጀመሪያ ለማርያም መግደላዊት ታየ' }, ref: 'John 20:16', route: '/bible/john/20', note: 'Jesus said to her: Mary! She turned and said: Rabboni! (Teacher).' },
        { id: 'p3-tl-emmaus-bread-broken', title: { en: 'Christ walks with Cleopas on the Emmaus road and is recognized in breaking bread', am: 'ክርስቶስ ወደ ኤማሁስ ከደቀ መዛሙርቱ ጋር ተጓዘ፤ እንጀራውን ሲቆርስም ታወቀ' }, ref: 'Luke 24:31', route: '/bible/luke/24', note: 'Their eyes were opened and they recognized Him; and He vanished from their sight.' },
        { id: 'p3-tl-locked-doors-peace', title: { en: 'The Risen Christ appears through closed doors: Peace be unto you', am: 'ክርስቶስ በዝግ በሮች መካከል ተገለጠ፤ ሰላም ለእናንተ ይሁን አላቸው' }, ref: 'John 20:19', route: '/bible/john/20', note: 'Showing them His hands and His side, breathing upon them: Receive the Holy Spirit.' },
        { id: 'p3-tl-thomas-wounds-confession', title: { en: 'Thomas touches the sacred nail prints: My Lord and my God!', am: 'ቶማስ የችንካሩን ቁስል ዳስሶ፡ ጌታዬና አምላኬ ብሎ መሰከረ' }, ref: 'John 20:28', route: '/bible/john/20', note: 'Blessed are those who have not seen and yet have believed.' },
        { id: 'p3-tl-mount-olives-ascension-glory', title: { en: 'Christ blesses the Apostles and ascends into heaven from the Mount of Olives', am: 'ክርስቶስ ሐዋርያትን ባርኮ ከደብረ ዘይት ወደ ሰማይ ዐረገ' }, ref: 'Acts 1:9', route: '/bible/acts/1', note: 'A cloud received Him out of their sight while angels promised His return.' }
      ]
    },

    // 17. The Early Church in Jerusalem
    {
      id: 'early-church-jerusalem-chronology',
      title: { en: 'The Apostolic Church in Jerusalem', am: 'የቀደመችው ሐዋርያዊት ቤተ ክርስቲያን በኢየሩሳሌም' },
      events: [
        { id: 'p3-tl-matthias-chosen-lot', title: { en: 'Matthias is chosen by prayer and lot in the upper room to fill the apostolic twelve', am: 'ማትያስ በጸሎትና በዕጣ በአሥራ ሁለቱ ሐዋርያት ማዕረግ ተቆጠረ' }, ref: 'Acts 1:26', route: '/bible/acts/1', note: 'Numbered with the eleven apostles to be a witness of Christ’s resurrection.' },
        { id: 'p3-tl-pentecost-tongues-fire', title: { en: 'The Holy Spirit descends like rushing wind and tongues of fire on Pentecost', am: 'በበዓለ ሃምሳ መንፈስ ቅዱስ እንደ ኃይለኛ ነፋስና የእሳት ላንቃ ወረደ' }, ref: 'Acts 2:3', route: '/bible/acts/2', note: 'Filled with the Spirit, Peter preached and about three thousand souls were baptized.' },
        { id: 'p3-tl-beautiful-gate-lame-healed', title: { en: 'Peter and John heal the lifelong lame man at the Temple’s Beautiful Gate', am: 'ጴጥሮስና ዮሐንስ በውብ ደጅ ሽባውን ሰው በኢየሱስ ስም ፈወሱት' }, ref: 'Acts 3:6', route: '/bible/acts/3', note: 'Silver and gold have I none; but what I have I give you: In the name of Jesus, rise up and walk!' },
        { id: 'p3-tl-seven-deacons-ordained', title: { en: 'The Apostles lay hands on seven men of good report to serve the church tables', am: 'ሐዋርያት በማዕድ እንዲያገለግሉ ሰባቱን ዲያቆናት ሾሙ' }, ref: 'Acts 6:6', route: '/bible/acts/6', note: 'Stephen, Philip, Prochorus, Nicanor, Timon, Parmenas, and Nicolas.' },
        { id: 'p3-tl-stephen-martyrdom-heaven-open', title: { en: 'Stephen sees heaven opened and becomes the first Christian protomartyr', am: 'እስጢፋኖስ ሰማያት ተከፍተው አየ፤ የመጀመሪያው ሰማዕት ሆኖ ዐረፈ' }, ref: 'Acts 7:56', route: '/bible/acts/7', note: 'Kneeling as stones struck him, praying: Lord, do not charge them with this sin.' }
      ]
    },

    // 18. Gentile Mission and Cornelius
    {
      id: 'gentile-mission-chronology',
      title: { en: 'The Gospel Reaches the Gentiles', am: 'የወንጌል ብርሃን ለአሕዛብ መድረስ' },
      events: [
        { id: 'p3-tl-philip-samaria-preaching', title: { en: 'Philip preaches Christ in Samaria with great joy and miracles', am: 'ፊልጶስ በሰማርያ ወንጌልን ሰበከ፤ ታላቅ ደስታም ሆነ' }, ref: 'Acts 8:8', route: '/bible/acts/8', note: 'Crowds with one accord heeded the things spoken by Philip.' },
        { id: 'p3-tl-ethiopian-official-gaza-road', title: { en: 'Philip explains the prophet Isaiah and baptizes the Queen’s Ethiopian treasurer', am: 'ፊልጶስ ለኢትዮጵያዊው ጃንደረባ ኢሳይያስን አስረድቶ አጠመቀው' }, ref: 'Acts 8:38', route: '/bible/acts/8', note: 'The eunuch went on his way rejoicing, bringing Christianity home to Ethiopia.' },
        { id: 'p3-tl-damascus-saul-blinding-light', title: { en: 'A brilliant light blinds Saul on the road to Damascus as Christ calls him', am: 'በደማስቆ መንገድ ድንቅ ብርሃን ሳውልን አበራበት፤ ክርስቶስም ጠራው' }, ref: 'Acts 9:3', route: '/bible/acts/9', note: 'Saul, Saul, why do you persecute Me? I am Jesus whom you are persecuting.' },
        { id: 'p3-tl-cornelius-peter-vision-joppa', title: { en: 'Peter sees the great sheet at Joppa and baptizes Cornelius’s household in Caesarea', am: 'ጴጥሮስ በኢዮጴ ራእይ አየ፤ በቂሣርያም የቆርኔሌዎስን ቤተሰብ አጠመቀ' }, ref: 'Acts 10:44', route: '/bible/acts/10', note: 'The Holy Spirit fell on all who heard the word, proving God shows no partiality.' },
        { id: 'p3-tl-council-jerusalem-decree', title: { en: 'The Jerusalem Council decrees that Gentile converts need not observe circumcision', am: 'የኢየሩሳሌም ጉባኤ ለአሕዛብ አማኞች የግርዛት ቀንበር እንዳይጫን ወሰነ' }, ref: 'Acts 15:19', route: '/bible/acts/15', note: 'It seemed good to the Holy Spirit and to us to lay upon you no greater burden.' }
      ]
    },

    // 19. Missionary Labors of Apostle Paul
    {
      id: 'missionary-labors-paul',
      title: { en: 'Apostle Paul: Herald to the Nations', am: 'ሐዋርያው ጳውሎስ፡ ለአሕዛብ የተላከ አርበኛ' },
      events: [
        { id: 'p3-tl-antioch-sent-out-barnabas', title: { en: 'Prophets and teachers in Antioch fast and send out Paul and Barnabas', am: 'በአንጾኪያ የነበሩ መምህራን ጳውሎስንና በርናባስን ጸልየው ላኩ' }, ref: 'Acts 13:3', route: '/bible/acts/13', note: 'The Holy Spirit said: Separate to Me Barnabas and Saul for the work I have called them.' },
        { id: 'p3-tl-philippi-earthquake-midnight', title: { en: 'An earthquake shakes the Philippi prison as Paul and Silas sing hymns at midnight', am: 'ጳውሎስና ሲላስ በሌሊት ሲዘምሩ የመሬት መንቀጥቀጥ ወህኒ ቤቱን አናወጠ' }, ref: 'Acts 16:26', route: '/bible/acts/16', note: 'All the doors were opened and everyone’s chains were loosed; the jailer was baptized.' },
        { id: 'p3-tl-athens-areopagus-unknown-god', title: { en: 'Paul proclaims the True Creator at the Areopagus in Athens to the Unknown God', am: 'ጳውሎስ በአቴና በአርዮስፋጎስ ለማይታወቀው አምላክ የተሰየመውን መሠዊያ ገለጠ' }, ref: 'Acts 17:23', route: '/bible/acts/17', note: 'The One whom you worship without knowing, Him I proclaim to you.' },
        { id: 'p3-tl-ephesus-riot-artemis', title: { en: 'The silversmith Demetrius stirs a great riot against Paul in the theater at Ephesus', am: 'ድሜጥሮስ በኤፌሶን በጳውሎስ ላይ ታላቅ ሁከት አስነሣ' }, ref: 'Acts 19:28', route: '/bible/acts/19', note: 'For two hours the crowd shouted: Great is Artemis of the Ephesians!' },
        { id: 'p3-tl-malta-shipwreck-safe-shore', title: { en: 'Paul’s ship fractures in the storm, but all 276 passengers escape safely to Malta', am: 'መርከቡ ተሰብሮ 276ቱ መንገደኞች በሙሉ በሰላም ማልታ ደረሱ' }, ref: 'Acts 27:44', route: '/bible/acts/27', note: 'An angel assured Paul that no life would be lost; they washed ashore on planks.' },
        { id: 'p3-tl-rome-hired-house-preaching', title: { en: 'Paul spends two whole years in his rented house in Rome preaching unhindered', am: 'ጳውሎስ በሮም በተከራየው ቤት ለሁለት ዓመታት ወንጌልን ያለከልካይ ሰበከ' }, ref: 'Acts 28:30', route: '/bible/acts/28', note: 'Preaching the kingdom of God and teaching concerning the Lord Jesus Christ with all confidence.' }
      ]
    },

    // 20. The Apocalypse and New Jerusalem
    {
      id: 'apocalypse-new-jerusalem-chronology',
      title: { en: 'The Apocalypse: Heavenly Visions and New Creation', am: 'የዮሐንስ ራእይ፡ ሰማያዊ ራእያትና አዲሲቱ ፍጥረት' },
      events: [
        { id: 'p3-tl-patmos-voice-trumpet', title: { en: 'John hears a voice like a trumpet while in the Spirit on the island of Patmos', am: 'ዮሐንስ በፍጥሞ ደሴት ሳለ እንደ መለከት ያለ ታላቅ ድምፅ ሰማ' }, ref: 'Revelation 1:10', route: '/bible/revelation/1', note: 'I am the Alpha and the Omega, the First and the Last; write what you see in a book.' },
        { id: 'p3-tl-son-of-man-lampstands', title: { en: 'John beholds the Son of Man standing in glory among seven golden lampstands', am: 'ዮሐንስ የሰውን ልጅ በሰባቱ የወርቅ መቅረዞች መካከል በክብር አየ' }, ref: 'Revelation 1:13', route: '/bible/revelation/1', note: 'Clothed with a robe down to the feet and girded with a golden chest band.' },
        { id: 'p3-tl-lamb-worthy-scroll', title: { en: 'The Slain Lamb takes the seven-sealed scroll amidst songs of heavenly elders', am: 'የታረደው በግ ሰባቱ ማኅተሞች ያሉበትን መጽሐፍ ተቀበለ' }, ref: 'Revelation 5:7', route: '/bible/revelation/5', note: 'You are worthy to take the scroll and to open its seals, for You were slain.' },
        { id: 'p3-tl-michael-casts-dragon', title: { en: 'Archangel Michael and his angels defeat and cast the dragon out of heaven', am: 'ቅዱስ ሚካኤልና መላእክቱ ዘንዶውን ተዋግተው ወደ ምድር ጣሉት' }, ref: 'Revelation 12:7', route: '/bible/revelation/12', note: 'Now salvation, and strength, and the kingdom of our God have come.' },
        { id: 'p3-tl-rider-white-horse-word', title: { en: 'The Word of God rides forth conquering on a white horse with eyes like flame', am: 'የእግዚአብሔር ቃል በነጭ ፈረስ ላይ በድል አድራጊነት ወጣ' }, ref: 'Revelation 19:11', route: '/bible/revelation/19', note: 'On His robe and on His thigh He has a name written: King of kings and Lord of lords.' },
        { id: 'p3-tl-new-jerusalem-descending', title: { en: 'The holy city, New Jerusalem, descends out of heaven adorned like a bride', am: 'አዲሲቱ ኢየሩሳሌም እንደ ሙሽራ ተዘጋጅታ ከሰማይ ወረደች' }, ref: 'Revelation 21:2', route: '/bible/revelation/21', note: 'God Himself will be with them; He will wipe away every tear from their eyes.' },
        { id: 'p3-tl-river-life-crystal', title: { en: 'The river of the water of life flows clear as crystal from the throne of God', am: 'የሕይወት ውኃ ወንዝ ከእግዚአብሔር ዙፋን እንደ መስታወት እየጠራ ወጣ' }, ref: 'Revelation 22:1', route: '/bible/revelation/22', note: 'Bearing the tree of life whose twelve leaves are for the healing of the nations.' }
      ]
    }
  ]

  console.log(`=== VALIDATING BIBLE TIMELINE CHALLENGE PHASE 3 (${chains.length} CHAINS) ===`)
  let totalEvents = 0
  for (const chain of chains) {
    totalEvents += chain.events.length
    const errors = validateStudioDraft({ game: 'bible-timeline', content: chain })
    if (errors.length > 0) {
      console.error(`Validation failed for chain ${chain.id}:`, errors)
      process.exit(1)
    }
  }

  const easyRounds = buildTimelineBank('easy', 10, Math.random, chains)
  const medRounds = buildTimelineBank('medium', 10, Math.random, chains)
  const hardRounds = buildTimelineBank('hard', 10, Math.random, chains)
  console.log(`Validated ${chains.length} chains containing ${totalEvents} total chronological events.`)
  console.log(`Playable Timeline round pools: Easy=${easyRounds.length}, Medium=${medRounds.length}, Hard=${hardRounds.length}`)

  // Save artifacts
  const tlDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'phase-3', 'timeline')
  fs.mkdirSync(tlDir, { recursive: true })
  fs.writeFileSync(path.join(tlDir, 'chains.json'), JSON.stringify(chains, null, 2), 'utf8')
  fs.writeFileSync(path.join(tlDir, 'report.json'), JSON.stringify({
    generatedAt: new Date().toISOString(),
    game: 'bible-timeline',
    phase: 3,
    acceptedChainsCount: chains.length,
    totalEventsCount: totalEvents,
    bankSimulation: { easy: easyRounds.length, medium: medRounds.length, hard: hardRounds.length },
    chainsSummary: chains.map(c => ({ id: c.id, titleEn: c.title.en, eventCount: c.events.length })),
    validation: { isValid: true, errors: [] }
  }, null, 2), 'utf8')

  console.log(`Successfully generated and validated 20 Bible Timeline chains for Phase 3!`)
}

run().catch(err => {
  console.error('Error generating Phase 3 Timeline:', err)
  process.exit(1)
})
