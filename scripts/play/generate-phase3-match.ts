/**
 * Phase 3 Content Generator for Match & Discover (100 New Pairs / 10 Collections).
 * Fully validated with validateCardContent, validateStudioDraft, and mergeCardBank.
 */
import fs from 'node:fs'
import path from 'node:path'

process.env.VITE_SUPABASE_URL = 'https://content-studio-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'

async function run() {
  const { validateStudioDraft } = await import('../../src/lib/play/contentStudio')
  const { validateCardContent, mergeCardBank } = await import('../../src/lib/play/cardContent')
  type MatchPair = import('../../src/lib/play/types').MatchPair

  const bible = (label: string, route: string) => ({ label, route, kind: 'bible' as const })
  const churchLib = (label: string, route: string) => ({ label, route, kind: 'church-library' as const })

  const collections = [
    // 1. Prophets and Symbolic Actions (10 pairs)
    {
      id: 'prophets-symbolic-actions',
      name: { en: 'Prophetic Signs and Symbolic Actions', am: 'የነቢያት ምሳሌያዊ ምልክቶችና ድርጊቶች' },
      pairs: [
        { id: 'match-p3-jer-potter', left: { en: 'Jeremiah’s Potter’s Wheel', am: 'የኤርምያስ የሸክላ ሠሪ ዕቃ' }, right: { en: 'God Reshaping Israel by His Sovereign Will', am: 'እግዚአብሔር እንደ ወደደ ሕዝቡን ማበጀት' }, exp: 'Jeremiah watched the potter rework spoiled clay on the wheel, showing God’s power to reshape His people.', ref: 'Jeremiah 18:4', route: '/bible/jeremiah/18' },
        { id: 'match-p3-ezk-brick', left: { en: 'Ezekiel’s Engraved Clay Brick', am: 'የሕዝቅኤል የተቀረጸ ጡብ' }, right: { en: 'Portrayal of the Siege of Jerusalem', am: 'የኢየሩሳሌም ከበባ ምሳሌ' }, exp: 'Ezekiel drew the besieged city on a clay tile as an urgent sign to the house of Israel.', ref: 'Ezekiel 4:1', route: '/bible/ezekiel/4' },
        { id: 'match-p3-hos-gomer', left: { en: 'Hosea Marrying Gomer', am: 'የሆሴዕና የጎሜር ጋብቻ' }, right: { en: 'God’s Enduring Covenant Love for Wayward People', am: 'የእግዚአብሔር የማያልቀው ጽኑ ፍቅር' }, exp: 'Hosea’s marriage illustrated the divine heartache and faithful love restoring fallen Israel.', ref: 'Hosea 3:1', route: '/bible/hosea/3' },
        { id: 'match-p3-isa-barefoot', left: { en: 'Isaiah Walking Barefoot for Three Years', am: 'ኢሳይያስ በባዶ እግሩ መመላለሱ' }, right: { en: 'Coming Captivity of Egypt and Ethiopia', am: 'የግብፅና የኢትዮጵያ ምርኮ ምልክት' }, exp: 'Isaiah walked stripped and barefoot as a prophetic sign of impending exile under Assyria.', ref: 'Isaiah 20:3', route: '/bible/isaiah/20' },
        { id: 'match-p3-zec-staffs', left: { en: 'Zechariah’s Two Shepherding Staffs', am: 'የዘካርያስ ሁለቱ በትር' }, right: { en: 'Favor and Union Broken by Rebellion', am: 'ጸጋና አንድነት በመሸፈት መቋረጡ' }, exp: 'The prophet named his staffs Favor and Union, breaking them when the covenant flock went astray.', ref: 'Zechariah 11:7', route: '/bible/zechariah/11' },
        { id: 'match-p3-aga-belt', left: { en: 'Agabus Binding Paul’s Belt', am: 'አጋቦስ የጳውሎስን መታጠቂያ ማሰሩ' }, right: { en: 'Prophecy of Paul’s Imprisonment in Jerusalem', am: 'ጳውሎስ በኢየሩሳሌም የመታሰሩ ትንቢት' }, exp: 'The prophet Agabus bound his own hands and feet with Paul’s girdle to foretell his arrest.', ref: 'Acts 21:11', route: '/bible/acts/21' },
        { id: 'match-p3-ahi-cloak', left: { en: 'Ahijah Tearing His New Garment into Twelve Pieces', am: 'አኪያ አዲሱን ልብስ ዐሥራ ሁለት ቦታ መቅደዱ' }, right: { en: 'Dividing the Kingdom of Israel into Ten Tribes', am: 'የእስራኤል መንግሥት ለዐሥር ነገድ መከፈሉ' }, exp: 'The Shilohite prophet gave ten pieces to Jeroboam to declare the tearing of Solomon’s kingdom.', ref: '1 Kings 11:31', route: '/bible/1-kings/11' },
        { id: 'match-p3-eli-mantle', left: { en: 'Elijah Striking the Jordan with His Mantle', am: 'ኤልያስ መጎናጸፊያውን በዮርዳኖስ መምታቱ' }, right: { en: 'Parting of the Waters for Dry Crossing', am: 'ውኃው ተከፍሎ በደረቅ መሻገር' }, exp: 'Elijah struck the waters with his rolled mantle, and they parted to the right and left.', ref: '2 Kings 2:8', route: '/bible/2-kings/2' },
        { id: 'match-p3-els-salt', left: { en: 'Elisha Casting Salt into the Spring', am: 'ኤልሳዕ ጨው ወደ ውኃው ምንጭ መጣሉ' }, right: { en: 'Purifying Jericho’s Bitter Waters of Death', am: 'የኢያሪኮ መራራ ውኃ መፈወሱ' }, exp: 'Elisha put salt into a new bowl and cast it into the spring, purifying it of death and barrenness.', ref: '2 Kings 2:21', route: '/bible/2-kings/2' },
        { id: 'match-p3-mos-serpent', left: { en: 'Moses Raising the Bronze Serpent on a Pole', am: 'ሙሴ የናሱን እባብ በዓላማ ላይ መስቀሉ' }, right: { en: 'Healing of All Who Look in Faith', am: 'በእምነት የተመለከቱ ሁሉ መዳናቸው' }, exp: 'Whoever looked upon the uplifted bronze serpent was healed from venomous bites, prefiguring the Cross.', ref: 'Numbers 21:9', route: '/bible/numbers/21' }
      ]
    },

    // 2. Miracles of the Lord (10 pairs)
    {
      id: 'miracles-of-christ',
      name: { en: 'Miracles of Our Lord Jesus Christ', am: 'የጌታችን የኢየሱስ ክርስቶስ ተአምራት' },
      pairs: [
        { id: 'match-p3-mir-cana', left: { en: 'Water Made Wine at Cana in Galilee', am: 'በቃና ዘገሊላ ውኃው ወደ ወይን መለወጡ' }, right: { en: 'First Sign Manifesting His Divine Glory', am: 'መለኮታዊ ክብሩ የተገለጠበት የመጀመሪያው ምልክት' }, exp: 'At the request of His Mother, Christ transformed six stone water jars into choice wine.', ref: 'John 2:11', route: '/bible/john/2' },
        { id: 'match-p3-mir-storm', left: { en: 'Rebuking the Winds and the Raging Sea', am: 'ኃይለኛውን ነፋስና ባሕር ገሥፆ ጸጥ ማድረጉ' }, right: { en: 'Total Authority over Nature and Creation', am: 'በፍጥረት ሁሉ ላይ ፍጹም ሥልጣን መኖሩ' }, exp: 'Christ arose from sleep in the boat, rebuked the tempest, and there was a great calm.', ref: 'Mark 4:39', route: '/bible/mark/4' },
        { id: 'match-p3-mir-waterwalk', left: { en: 'Walking upon the Waves of the Sea of Galilee', am: 'በገሊላ ባሕር ማዕበል ላይ በእግሩ መሄዱ' }, right: { en: 'Delivering the Terrified Disciples in the Storm', am: 'በማዕበል የተጨነቁትን ደቀ መዛሙርት ማዳኑ' }, exp: 'In the fourth watch of the night, Christ walked upon the deep to strengthen Peter and the apostles.', ref: 'Matthew 14:25', route: '/bible/matthew/14' },
        { id: 'match-p3-mir-roof-paralytic', left: { en: 'Paralytic Lowered through the Tiled Roof', am: 'በጣሪያ ተቆፍሮ የወረደው ሽባ ሰው' }, right: { en: 'Forgiving Sins and Restoring Paralyzed Limbs', am: 'ኃጢአትን ይቅር የማለትና የመፈወስ ሥልጣን' }, exp: 'Seeing their faith, Christ said: Your sins are forgiven, and commanded him to take up his bed.', ref: 'Mark 2:5', route: '/bible/mark/2' },
        { id: 'match-p3-mir-lazarus', left: { en: 'Calling Lazarus from the Tomb after Four Days', am: 'አልዓዛርን ከአራት ቀን በኋላ ከመቃብር መጥራቱ' }, right: { en: 'The Resurrection and the Defeat of Corruption', am: 'የትንሣኤ ጌታና የሙስና አሸናፊ መሆኑ' }, exp: 'Christ wept, commanded the stone removed, and cried with a loud voice: Lazarus, come forth!', ref: 'John 11:43', route: '/bible/john/11' },
        { id: 'match-p3-mir-ten-lepers', left: { en: 'Cleansing Ten Lepers on the Road', am: 'ዐሥሩን ለምጻሞች በመንገድ ላይ ማንጻቱ' }, right: { en: 'Gratitude of the Samaritan Who Returned', am: 'ተመልሶ ያመሰገነው የሳምራዊው ምስጋና' }, exp: 'Ten were cleansed as they went, but only one returned falling at Christ’s feet to give thanks.', ref: 'Luke 17:15', route: '/bible/luke/17' },
        { id: 'match-p3-mir-five-loaves', left: { en: 'Multiplying Five Barley Loaves and Two Fish', am: 'አምስቱን እንጀራና ሁለቱን ዓሣ ማበርከቱ' }, right: { en: 'Abundant Feeding of Five Thousand Men', am: 'አምስት ሺህ ሰዎችን አትረፍርፎ መመገቡ' }, exp: 'Christ blessed the boy’s small provision, feeding the multitude with twelve baskets leftover.', ref: 'John 6:11', route: '/bible/john/6' },
        { id: 'match-p3-mir-blind-born', left: { en: 'Anointing Eyes of the Man Born Blind with Clay', am: 'ከዕውርነቱ የተወለደውን ሰው በጭቃ ዓይኑን ማብራቱ' }, right: { en: 'Washing at Siloam to Receive True Sight', am: 'በሰሊሆም ታጥቦ ብርሃን ማግኘቱ' }, exp: 'Christ spat on the ground, made clay, anointed his eyes, and sent him to wash in Siloam.', ref: 'John 9:6', route: '/bible/john/9' },
        { id: 'match-p3-mir-issue-blood', left: { en: 'Touching the Hem of His Garment in the Crowd', am: 'የልብሱን ጫፍ በሕዝቡ መሀል መንካቷ' }, right: { en: 'Twelve Years of Hemorrhage Instantly Healed', am: 'ዐሥራ ሁለት ዓመት የፈሰሰው ደም መቆሙ' }, exp: 'The woman said: If only I touch His clothes, I shall be made whole, and power went out from Him.', ref: 'Luke 8:44', route: '/bible/luke/8' },
        { id: 'match-p3-mir-centurion', left: { en: 'The Faith of the Roman Centurion of Capernaum', am: 'የቅፍርናሆሙ የመቶ አለቃ ታላቅ እምነት' }, right: { en: 'Healing the Paralyzed Servant with a Word from Afar', am: 'አገልጋዩን በሩቅ ሆኖ በቃሉ ብቻ መፈወሱ' }, exp: 'Christ marveled at his faith, saying He had not found such great faith even in Israel.', ref: 'Matthew 8:10', route: '/bible/matthew/8' }
      ]
    },

    // 3. Titles of Christ in the Holy Gospels (10 pairs)
    {
      id: 'titles-of-christ-gospels',
      name: { en: 'Divine Titles of Christ in the Gospels', am: 'የክርስቶስ መለኮታዊ ስሞች በወንጌላት' },
      pairs: [
        { id: 'match-p3-title-bread', left: { en: 'The Bread of Life', am: 'የሕይወት እንጀራ' }, right: { en: 'Whoever Comes to Him Shall Never Hunger', am: 'ወደ እርሱ የሚመጣ ከቶ አይራብም' }, exp: 'Christ declared: I am the bread of life which came down from heaven to give life to the world.', ref: 'John 6:35', route: '/bible/john/6' },
        { id: 'match-p3-title-light', left: { en: 'The Light of the World', am: 'የዓለም ብርሃን' }, right: { en: 'Whoever Follows Him Shall Not Walk in Darkness', am: 'እርሱን የሚከተል በጨለማ አይመላለስም' }, exp: 'Christ proclaims that whoever follows Him shall possess the light of everlasting life.', ref: 'John 8:12', route: '/bible/john/8' },
        { id: 'match-p3-title-door', left: { en: 'The Door of the Sheepfold', am: 'የበጎች ደጅ' }, right: { en: 'Entrance to Safety, Pasture, and Salvation', am: 'ለመዳንና ለማሰማሪያ መግቢያ መንገድ' }, exp: 'Christ is the true door through whom whoever enters shall be saved and find pasture.', ref: 'John 10:9', route: '/bible/john/10' },
        { id: 'match-p3-title-shepherd', left: { en: 'The Good Shepherd', am: 'መልካም እረኛ' }, right: { en: 'Laying Down His Life for the Sheep', am: 'ነፍሱን ስለ በጎቹ አሳልፎ የሚሰጥ' }, exp: 'The Good Shepherd knows His own by name and voluntarily gives His life for the flock.', ref: 'John 10:11', route: '/bible/john/10' },
        { id: 'match-p3-title-resurrection', left: { en: 'The Resurrection and the Life', am: 'ትንሣኤና ሕይወት' }, right: { en: 'Whoever Believes in Him Lives Though He Die', am: 'በእርሱ የሚያምን ቢሞት እንኳ በሕይወት ይኖራል' }, exp: 'Christ promised Martha that faith in Him overcomes physical death with everlasting life.', ref: 'John 11:25', route: '/bible/john/11' },
        { id: 'match-p3-title-way', left: { en: 'The Way, the Truth, and the Life', am: 'መንገድና እውነት ሕይወትም' }, right: { en: 'No One Comes to the Father Except Through Him', am: 'በእርሱ በቀር ወደ አብ የሚመጣ ማንም የለም' }, exp: 'Christ answered Thomas that He alone is the living road uniting humanity with God the Father.', ref: 'John 14:6', route: '/bible/john/14' },
        { id: 'match-p3-title-vine', left: { en: 'The True Vine', am: 'እውነተኛ የወይን ግንድ' }, right: { en: 'Branches Bearing Abundant Fruit in Union', am: 'በእርሱ የጸኑ ቅርንጫፎች ብዙ ፍሬ ያፈራሉ' }, exp: 'Abiding in Christ as branches in the vine enables believers to bear fruits of righteousness.', ref: 'John 15:5', route: '/bible/john/15' },
        { id: 'match-p3-title-lamb', left: { en: 'The Lamb of God', am: 'የእግዚአብሔር በግ' }, right: { en: 'Taking Away the Sin of the Whole World', am: 'የዓለምን ኃጢአት የሚያስወግድ' }, exp: 'John the Baptist saw Jesus approaching and cried: Behold the Lamb of God who takes away sin.', ref: 'John 1:29', route: '/bible/john/1' },
        { id: 'match-p3-title-cornerstone', left: { en: 'The Chief Cornerstone', am: 'የማዕዘን ራስ ድንጋይ' }, right: { en: 'Rejected by Builders but Chosen and Precious', am: 'በግንበኞች የተናቀ ነገር ግን የተመረጠ' }, exp: 'The stone the builders rejected has become the chief cornerstone of God’s holy temple.', ref: '1 Peter 2:6', route: '/bible/1-peter/2' },
        { id: 'match-p3-title-alpha-omega', left: { en: 'The Alpha and the Omega', am: 'አልፋና ዖሜጋ' }, right: { en: 'The Beginning and the End, Who Was and Is', am: 'መጀመሪያውና መጨረሻው፥ የነበረውና ያለው' }, exp: 'The Almighty Word who encompasses all eternity, creation, and consummation.', ref: 'Revelation 1:8', route: '/bible/revelation/1' }
      ]
    },

    // 4. Biblical Names and Meanings (10 pairs)
    {
      id: 'names-and-meanings',
      name: { en: 'Biblical Names and Their Meanings', am: 'የመጽሐፍ ቅዱስ ስሞችና ትርጉሞቻቸው' },
      pairs: [
        { id: 'match-p3-name-abraham', left: { en: 'Abraham', am: 'አብርሃም' }, right: { en: 'Father of a Multitude of Nations', am: 'የብዙ አሕዛብ አባት' }, exp: 'God changed Abram’s name when establishing the everlasting covenant of faith.', ref: 'Genesis 17:5', route: '/bible/genesis/17' },
        { id: 'match-p3-name-isaac', left: { en: 'Isaac', am: 'ይስሐቅ' }, right: { en: 'Laughter and Holy Joy', am: 'ሣቅና ቅዱስ ደስታ' }, exp: 'Sarah rejoiced when God fulfilled the impossible promise, bringing holy laughter to her home.', ref: 'Genesis 21:6', route: '/bible/genesis/21' },
        { id: 'match-p3-name-israel', left: { en: 'Israel', am: 'እስራኤል' }, right: { en: 'One Who Strives with God and Prevails', am: 'ከእግዚአብሔር ጋር ታግሎ ያሸነፈ' }, exp: 'The angel bestowed this new name upon Jacob after his night of wrestling at Peniel.', ref: 'Genesis 32:28', route: '/bible/genesis/32' },
        { id: 'match-p3-name-moses', left: { en: 'Moses', am: 'ሙሴ' }, right: { en: 'Drawn Out of the Waters', am: 'ከውኃ የወጣ' }, exp: 'Pharaoh’s daughter named him Moses because she drew him out of the reed-beds of the Nile.', ref: 'Exodus 2:10', route: '/bible/exodus/2' },
        { id: 'match-p3-name-joshua', left: { en: 'Joshua (Yeshua)', am: 'ኢያሱ' }, right: { en: 'The Lord is Salvation', am: 'እግዚአብሔር መድኃኒት ነው' }, exp: 'Moses renamed Hoshea son of Nun to Joshua as he led Israel into the Promised Land.', ref: 'Numbers 13:16', route: '/bible/numbers/13' },
        { id: 'match-p3-name-samuel', left: { en: 'Samuel', am: 'ሳሙኤል' }, right: { en: 'Asked and Heard of God', am: 'ከእግዚአብሔር የተለመነና የተሰማ' }, exp: 'Hannah named him Samuel because she had asked for him from the Lord in tearful prayer.', ref: '1 Samuel 1:20', route: '/bible/1-samuel/1' },
        { id: 'match-p3-name-david', left: { en: 'David', am: 'ዳዊት' }, right: { en: 'Beloved of the Lord', am: 'በእግዚአብሔር የተወደደ' }, exp: 'The shepherd-king whose heart was attuned to God, called beloved throughout Scripture.', ref: '1 Samuel 13:14', route: '/bible/1-samuel/13' },
        { id: 'match-p3-name-solomon', left: { en: 'Solomon (Jedidiah)', am: 'ሰሎሞን (ይዲድያ)' }, right: { en: 'Peaceful and Beloved of Yahweh', am: 'የሰላም ሰውና በእግዚአብሔር የተወደደ' }, exp: 'David called him Solomon for the peace of his reign, and Nathan called him Jedidiah.', ref: '2 Samuel 12:25', route: '/bible/2-samuel/12' },
        { id: 'match-p3-name-elijah', left: { en: 'Elijah', am: 'ኤልያስ' }, right: { en: 'Yahweh is My God', am: 'እግዚአብሔር አምላኬ ነው' }, exp: 'The fiery prophet whose name embodied his entire life contest against Baal worship.', ref: '1 Kings 18:39', route: '/bible/1-kings/18' },
        { id: 'match-p3-name-emmanuel', left: { en: 'Emmanuel', am: 'አማኑኤል' }, right: { en: 'God with Us in the Flesh', am: 'እግዚአብሔር ከእኛ ጋር ሆነ' }, exp: 'The prophetic name of the Incarnate Word born of the Holy Virgin Mary.', ref: 'Matthew 1:23', route: '/bible/matthew/1' }
      ]
    },

    // 5. Liturgical Vessels and Sacred Church Items (10 pairs)
    {
      id: 'liturgical-vessels-instruments',
      name: { en: 'Liturgical Vessels and Sacred Instruments', am: 'የቤተ ክርስቲያን ንዋየ ቅድሳትና መገልገያዎች' },
      pairs: [
        { id: 'match-p3-ves-tabot', left: { en: 'Tabot (Holy Tablet)', am: 'ታቦተ ጽዮን' }, right: { en: 'Altar Slab Consecrated for the Eucharistic Liturgy', am: 'ለቅዳሴ አገልግሎት የተባረከ የመሠዊያ ጽላት' }, exp: 'The consecrated center of the Ethiopian sanctuary upon which the Holy Mysteries are offered.', ref: 'Exodus 25:16', route: '/library/theology/tabot' },
        { id: 'match-p3-ves-maetant', left: { en: 'Maetant (Golden Censer)', am: 'ማዕጠንት (የወርቅ ጥና)' }, right: { en: 'Vessel Bearing Incense and Prayers to God', am: 'ዕጣንና ጸሎትን ወደ ሰማይ የሚያሳርግ' }, exp: 'The censer symbolizes the Holy Virgin carrying Christ, and its fragrance symbolizes pure prayers.', ref: 'Revelation 8:4', route: '/library/theology/incense' },
        { id: 'match-p3-ves-tsiha', left: { en: 'Tsiha (Paten / Diskos)', am: 'ጻሕል' }, right: { en: 'Sacred Plate Holding the Body of Christ', am: 'የክርስቶስን ቅዱስ ሥጋ የሚይዝ ሰሃን' }, exp: 'The gold or silver shallow plate that holds the Eucharistic bread during Divine Liturgy.', ref: 'Exodus 25:29', route: '/library/theology/liturgical-vessels' },
        { id: 'match-p3-ves-tsiwa', left: { en: 'Tsiwa (Chalice)', am: 'ጽዋዕ' }, right: { en: 'Sacred Cup Holding the Precious Blood of Christ', am: 'የክርስቶስን ክቡር ደም የሚይዝ ጽዋ' }, exp: 'The holy cup containing wine mixed with water transformed into the Life-Giving Blood.', ref: '1 Corinthians 10:16', route: '/library/theology/liturgical-vessels' },
        { id: 'match-p3-ves-ertban', left: { en: 'Erkban (Communion Spoon / Erfe Meskel)', am: 'እርፈ መስቀል' }, right: { en: 'Cross-Tipped Spoon for Giving the Precious Blood', am: 'ክቡር ደሙን ለምእመናን ማቀበያ ማንኪያ' }, exp: 'The cross-handled spoon used by the priest to administer Holy Communion to the faithful.', ref: 'Isaiah 6:6', route: '/library/theology/liturgical-vessels' },
        { id: 'match-p3-ves-akwareq', left: { en: 'Akwareq (Sanctuary Candelabrum)', am: 'አኳሬቅ (የመቅደስ ሻማ ማብሪያ)' }, right: { en: 'Multi-Branched Chandelier Illuminating the Holy Place', am: 'በቤተ መቅደስ ብርሃን የሚሰጥ ቅዱስ ሻማ መያዣ' }, exp: 'The ornamental candelabrum carrying sacred oil or candles in the sanctuary.', ref: 'Exodus 25:37', route: '/library/theology/liturgical-vessels' },
        { id: 'match-p3-ves-kasa', left: { en: 'Kasa (Liturgical Washbasin)', am: 'ካሳ (የእጅ መታጠቢያ ዕቃ)' }, right: { en: 'Silver Basin for Ceremonial Washing of Priestly Hands', am: 'ካህኑ እጁን የሚታጠብበት የብር ዕቃ' }, exp: 'The basin used by the celebrant to wash hands before handling the Holy Mysteries.', ref: 'Exodus 30:18', route: '/library/theology/liturgical-vessels' },
        { id: 'match-p3-ves-marweha', left: { en: 'Marweha (Liturgical Cherubic Fan)', am: 'መርወሐ (የኪሩቤል ቅርጽ ያለው አድናቂ)' }, right: { en: 'Silver Seraphic Fan Flown over the Eucharistic Mysteries', am: 'በቅዱስ ቁርባን ላይ የሚወዘወዝ ቅዱስ ንዋይ' }, exp: 'The circular fan bearing angelic imagery waved reverently over the Holy Oblation.', ref: 'Isaiah 6:2', route: '/library/theology/liturgical-vessels' },
        { id: 'match-p3-ves-ewdamet', left: { en: 'Qachil (Liturgical Handbell)', am: 'ቃጭል' }, right: { en: 'Tinkling Handbell Announcing Solemn Liturgy Parts', am: 'የቅዳሴን ክፍሎች የሚያውጅ ንዑስ ደወል' }, exp: 'Rung during processions and the Epiclesis to invite the faithful to reverent prayer.', ref: 'Exodus 28:34', route: '/library/theology/liturgical-vessels' },
        { id: 'match-p3-ves-kelil', left: { en: 'Kelil (Church Crown / Mitre)', am: 'አክሊል' }, right: { en: 'Ornamental Crown Worn during Feasts and Matrimony', am: 'በበዓላትና በሥርዓተ ተክሊል የሚቀዳጅ አክሊል' }, exp: 'The decorated crown placed upon brides, grooms, and bishops symbolizing spiritual victory.', ref: 'Revelation 2:10', route: '/library/theology/liturgical-vestments' }
      ]
    },

    // 6. Apostles and Their Traditional Emblems (10 pairs)
    {
      id: 'apostles-and-emblems',
      name: { en: 'Apostolic Emblems and Callings', am: 'የሐዋርያት መለያ ምልክቶችና ጥሪዎች' },
      pairs: [
        { id: 'match-p3-ap-peter', left: { en: 'Simon Peter (Cephas)', am: 'ስምዖን ጴጥሮስ (ኬፋ)' }, right: { en: 'Keys of the Kingdom and Inverted Cross', am: 'የመንግሥተ ሰማያት መክፈቻና የዘቀዘቀ መስቀል' }, exp: 'Given the keys to loose and bind, he suffered martyrdom upside-down in Rome.', ref: 'Matthew 16:19', route: '/bible/matthew/16' },
        { id: 'match-p3-ap-andrew', left: { en: 'Apostle Andrew', am: 'ሐዋርያው እንድርያስ' }, right: { en: 'Diagonal Decussate Cross (Saltire)', am: 'ሰያፍ የመስቀል ቅርጽ' }, exp: 'The first-called apostle who preached in Greece and was martyred on an X-shaped cross.', ref: 'John 1:40', route: '/bible/john/1' },
        { id: 'match-p3-ap-james-z', left: { en: 'James son of Zebedee', am: 'ያዕቆብ ዘዘብዴዎስ' }, right: { en: 'Pilgrim’s Staff and Martyr’s Sword', am: 'የመንገደኛ በትርና የሰማዕትነት ሰይፍ' }, exp: 'The first of the Twelve martyred by King Herod Agrippa with the sword in Jerusalem.', ref: 'Acts 12:2', route: '/bible/acts/12' },
        { id: 'match-p3-ap-john-ev', left: { en: 'John the Theologian', am: 'ዮሐንስ ወንጌላዊ' }, right: { en: 'High-Soaring Heavenly Eagle', am: 'ወደ ላይ የሚበር የንስር አርማ' }, exp: 'His Gospel begins from celestial heights: In the beginning was the Word.', ref: 'Ezekiel 1:10', route: '/bible/john/1' },
        { id: 'match-p3-ap-philip', left: { en: 'Apostle Philip', am: 'ሐዋርያው ፊልጶስ' }, right: { en: 'Loaves of Bread and Patriarchal Cross', am: 'የኅብስት ቅርጫትና ባለ ሁለት እጅ መስቀል' }, exp: 'Tested by Christ concerning bread for the crowd, he brought Nathanael to see Jesus.', ref: 'John 6:5', route: '/bible/john/6' },
        { id: 'match-p3-ap-bartho', left: { en: 'Bartholomew (Nathanael)', am: 'በርተሎሜዎስ (ናትናኤል)' }, right: { en: 'Flaying Knife of Glorious Martyrdom', am: 'የሰማዕትነት ጽኑ መከራ ምልክት' }, exp: 'Preached in Armenia and India, enduring severe tortures for the testimony of Jesus.', ref: 'Matthew 10:3', route: '/bible/matthew/10' },
        { id: 'match-p3-ap-matthew', left: { en: 'Matthew the Evangelist', am: 'ማቴዎስ ወንጌላዊ' }, right: { en: 'Winged Man of the Royal Human Lineage', am: 'የሰው መልክ ያለው የትውልድ ሐረግ አርማ' }, exp: 'His Gospel opens with the earthly human ancestry and royal descent of Jesus Christ.', ref: 'Ezekiel 1:10', route: '/bible/matthew/1' },
        { id: 'match-p3-ap-thomas', left: { en: 'Apostle Thomas', am: 'ሐዋርያው ቶማስ' }, right: { en: 'Architect’s Rule and Piercing Spear', am: 'የግንበኛ መለኪያና የሰማዕትነት ጦር' }, exp: 'Confessed My Lord and My God, built churches, and was martyred by spears in India.', ref: 'John 20:28', route: '/bible/john/20' },
        { id: 'match-p3-ap-james-a', left: { en: 'James son of Alphaeus', am: 'ያዕቆብ ወልደ እልፍዮስ' }, right: { en: 'Fuller’s Club of Faithful Witness', am: 'የመከራ ጽናትና የትዕግሥት ምስክር' }, exp: 'Laborer in Judea and neighboring lands who sealed his apostolic witness with blood.', ref: 'Mark 3:18', route: '/bible/mark/3' },
        { id: 'match-p3-ap-simon-z', left: { en: 'Simon the Zealot', am: 'ስምዖን ቀነናዊ' }, right: { en: 'Carpenter’s Saw and Sacred Fish', am: 'የመጋዝ ምልክትና ቅዱስ ዓሣ' }, exp: 'Preached zealously in Egypt, Persia, and the East, laying down his life for the Savior.', ref: 'Luke 6:15', route: '/bible/luke/6' }
      ]
    },

    // 7. Desert Fathers and Monastic Wisdom (10 pairs)
    {
      id: 'desert-fathers-wisdom',
      name: { en: 'Wisdom of the Desert Fathers', am: 'የበረሃ አባቶች ምክርና ገድል' },
      pairs: [
        { id: 'match-p3-fa-anthony', left: { en: 'Abba Anthony the Great', am: 'አባ እንጦንስ ታላቁ' }, right: { en: 'Father of Solitary Desert Monasticism', am: 'የብሕትውና ምንኵስና አባት' }, exp: 'Heard the rich young ruler passage and retreated to the inner mountain to pray continually.', ref: 'Synaxarium — Ter 22', route: '/library/monasticism/anthony' },
        { id: 'match-p3-fa-pachomius', left: { en: 'Abba Pachomius of Tabennisi', am: 'አባ ጳኵሚስ ዘታበኒሲ' }, right: { en: 'Founder of Communal Coenobitic Monastic Rule', am: 'የማኅበር ምንኵስና ሥርዓት መሥራች' }, exp: 'Received angelic instruction to gather ascetics into structured cenobitic brotherhoods.', ref: 'Synaxarium — Ginbot 14', route: '/library/monasticism/pachomius' },
        { id: 'match-p3-fa-macarius', left: { en: 'Abba Macarius the Egyptian', am: 'አባ መቃርስ ዘግብፅ' }, right: { en: 'Spiritual Father of Scetis Renowned for Gentleness', am: 'የአስቄጥስ መንፈሳዊ አባትና የዋህ' }, exp: 'Covered human faults like a god on earth, teaching silent victorious spiritual warfare.', ref: 'Synaxarium — Megabit 27', route: '/library/monasticism/macarius' },
        { id: 'match-p3-fa-moses-black', left: { en: 'Abba Moses the Strong (the Ethiopian)', am: 'አባ ሙሴ ጸሊም' }, right: { en: 'Transformed Robber Renowned for Deep Humility', am: 'ከሽፍንነት ወደ ፍጹም ትሕትና የተለወጠ' }, exp: 'Carried leaking sand basket on his back saying: My sins leak behind me while I judge.', ref: 'Synaxarium — Sene 24', route: '/library/monasticism/moses-strong' },
        { id: 'match-p3-fa-john-dwarf', left: { en: 'Abba John the Dwarf (Kolobos)', am: 'አባ ዮሐንስ ሐጺር' }, right: { en: 'Watering the Dry Stick until It Blossomed', am: 'የደረቀውን እንጨት አጠጥቶ ያለመለመ' }, exp: 'Obeyed his elder for three years watering a dry staff until it bore the fruit of obedience.', ref: 'Synaxarium — Tikimt 20', route: '/library/monasticism/john-dwarf' },
        { id: 'match-p3-fa-arsenius', left: { en: 'Abba Arsenius the Great', am: 'አባ አርሳኒዮስ' }, right: { en: 'Flee, Be Silent, and Pray Continually', am: 'ሽሽ፥ ዝም በል፥ ያለማቋረጥ ጸልይ' }, exp: 'Imperial tutor who left the royal palace for the desert, speaking with God in silence.', ref: 'Synaxarium — Ginbot 13', route: '/library/monasticism/arsenius' },
        { id: 'match-p3-fa-poemen', left: { en: 'Abba Poemen the Shepherd', am: 'አባ ፖይመን እረኛው' }, right: { en: 'Weep for Thyself Rather Than Condemn Others', am: 'ሌላውን ከመኮነን ይልቅ ለራስህ አልቅስ' }, exp: 'Taught that the highest wisdom in Christ is recognizing one’s own inner brokenness.', ref: 'Synaxarium — Nahase 9', route: '/library/monasticism/poemen' },
        { id: 'match-p3-fa-mary-egypt', left: { en: 'Saint Mary of Egypt', am: 'ቅድስት ማርያም ግብፃዊት' }, right: { en: 'Forty-Seven Years of Deep Repentance beyond the Jordan', am: 'በዮርዳኖስ ማዶ አርባ ሰባት ዓመት ንስሐ የገባች' }, exp: 'Turned from worldly passion at the Holy Sepulchre to austere prayer in desert sands.', ref: 'Synaxarium — Miyazya 6', route: '/library/monasticism/mary-egypt' },
        { id: 'match-p3-fa-ephrem-syrian', left: { en: 'Saint Ephrem the Syrian', am: 'ቅዱስ ኤፍሬም ሶርያዊ' }, right: { en: 'Harp of the Spirit Composing Praises of the Theotokos', am: 'ውዳሴ ማርያምን ያዘጋጀ የመንፈስ በገና' }, exp: 'Deacon and theologian whose poetic tears and praises of Mary enriched liturgical worship.', ref: 'Synaxarium — Hamle 15', route: '/library/patristics/ephrem' },
        { id: 'match-p3-fa-isaac-nineveh', left: { en: 'Saint Isaac the Syrian (of Nineveh)', am: 'ቅዱስ ይስሐቅ ሶርያዊ' }, right: { en: 'Mystical Homilies on Divine Love and Solitude', am: 'ስለ መለኮታዊ ፍቅርና ብሕትውና የተናገረ' }, exp: 'Wrote profound discourses on merciful love extending toward all living creation.', ref: 'Synaxarium — Tir 28', route: '/library/patristics/isaac-syrian' }
      ]
    },

    // 8. Ethiopian Monasteries and Their Holy Founders (10 pairs)
    {
      id: 'ethiopian-monasteries-founders',
      name: { en: 'Historic Ethiopian Monasteries and Founders', am: 'የኢትዮጵያ ታሪካዊ ገዳማትና መሥራቾቻቸው' },
      pairs: [
        { id: 'match-p3-mo-damo', left: { en: 'Debre Damo Monastery', am: 'ደብረ ዳሞ ገዳም' }, right: { en: 'Founded by Abba Aragawi atop the Sheer Amba', am: 'በአባ አረጋዊ በአምባው ላይ የተመሠረተ' }, exp: 'Ascended by rope with angelic guidance, it preserves the oldest surviving church architecture.', ref: 'Synaxarium — Tikimt 14', route: '/library/history/debre-damo' },
        { id: 'match-p3-mo-libanos', left: { en: 'Debre Libanos Monastery', am: 'ደብረ ሊባኖስ ገዳም' }, right: { en: 'Founded by Abune Tekle Haymanot in Shewa', am: 'በአቡነ ተክለ ሃይማኖት በሸዋ የተመሠረተ' }, exp: 'Mother monastery of the southern clergy, home to generations of holy ascetics and scholars.', ref: 'Synaxarium — Tahsas 24', route: '/library/history/debre-libanos' },
        { id: 'match-p3-mo-hayq', left: { en: 'Debre Hayq Estifanos Monastery', am: 'ደብረ ሐይቅ እስጢፋኖስ ገዳም' }, right: { en: 'Founded by Abba Iyasus Moa on Lake Hayq', am: 'በአባ ኢየሱስ ሞዐ በሐይቅ ደሴት የተመሠረተ' }, exp: 'Famous medieval center of learning where saintly scholars and royal dynasts studied.', ref: 'Synaxarium — Megabit 26', route: '/library/history/hayq' },
        { id: 'match-p3-mo-daga', left: { en: 'Daga Estifanos on Lake Tana', am: 'ዳጋ እስጢፋኖስ በጣና ሐይቅ' }, right: { en: 'Founded by Abba Hiruta Amlak in the Fourteenth Century', am: 'በአባ ሒሩተ አምላክ የተመሠረተ ቅዱስ ደሴት' }, exp: 'Island monastery where the incorrupt bodies of several Ethiopian emperors repose.', ref: 'Synaxarium — Hamle 2', route: '/library/history/daga' },
        { id: 'match-p3-mo-bizen', left: { en: 'Debre Bizen Monastery', am: 'ደብረ ቢዘን ገዳም' }, right: { en: 'Founded by Abba Filipos atop Mount Bizen', am: 'በአባ ፊልጶስ በቢዘን ተራራ ላይ የተመሠረተ' }, exp: 'Ewostatian bastion of monastic devotion and manuscript production overlooking the Red Sea.', ref: 'Synaxarium — Ginbot 5', route: '/library/history/bizen' },
        { id: 'match-p3-mo-gunda', left: { en: 'Gunda Gundo Monastery', am: 'ጉንዳ ጉንዶ ገዳም' }, right: { en: 'Monastic Haven of Abba Estifanos and His Disciples', am: 'የአባ እስጢፋኖስና የደቀ መዛሙርቱ ገዳም' }, exp: 'Deep canyon monastery renowned for exceptional manuscript illumination and devotion.', ref: 'Synaxarium — Hidar 28', route: '/library/history/gunda-gunde' },
        { id: 'match-p3-mo-waldebba', left: { en: 'Waldebba Hermitage Desert', am: 'የዋልድባ ገዳመ ቆላ' }, right: { en: 'Ancient Wilderness of Perpetual Fasting and Prayer', am: 'የጾምና የጸሎት ጥንታዊ የበረሃ ገዳም' }, exp: 'Remote anchorite sanctuary inhabited by hermits living in deep austerity and silence.', ref: 'Synaxarium — Yekatit 10', route: '/library/history/waldebba' },
        { id: 'match-p3-mo-zuqualla', left: { en: 'Debre Gebre Menfes Kidus atop Zuqualla', am: 'የዝቋላ ደብረ ገብረ መንፈስ ቅዱስ ገዳም' }, right: { en: 'Crater Lake Hermitage of Abune Gebre Menfes Kidus', am: 'የአቡነ ገብረ መንፈስ ቅዱስ የተጋድሎ ስፍራ' }, exp: 'Extinct volcanic summit with crater lake where Abo prayed among lions and gazelles.', ref: 'Synaxarium — Megabit 5', route: '/library/history/zuqualla' },
        { id: 'match-p3-mo-mahbere', left: { en: 'Mahbere Selassie Monastery', am: 'ማኅበረ ሥላሴ ገዳም' }, right: { en: 'Historic Trinitarian Ascetic Hermitage near Metemma', am: 'በመተማ አቅራቢያ የሚገኝ ታላቅ የሥላሴ ገዳም' }, exp: 'Revered desert hermitage in northwestern Ethiopia dedicated to the Holy Trinity.', ref: 'Synaxarium — Sene 7', route: '/library/history/mahbere-selassie' },
        { id: 'match-p3-mo-werk', left: { en: 'Debre Werk Mariam Monastery', am: 'ደብረ ወርቅ ማርያም ገዳም' }, right: { en: 'Ancient Gojjam Sanctuary of the Virgin Mary', am: 'በጎጃም የሚገኝ ጥንታዊ የእመቤታችን መቅደስ' }, exp: 'Revered monastic seat in Gojjam famous for sacred chants, manuscripts, and theological academy.', ref: 'Synaxarium — Hidar 21', route: '/library/history/debre-werk' }
      ]
    },

    // 9. The Beatitudes and Their Promises (10 pairs)
    {
      id: 'beatitudes-and-promises',
      name: { en: 'The Beatitudes and Divine Promises', am: 'ስብከተ ተራራ ብፅዕናዎችና ተስፋዎቻቸው' },
      pairs: [
        { id: 'match-p3-bea-poor', left: { en: 'Blessed Are the Poor in Spirit', am: 'በመንፈስ ድሆች የሆኑ ብፁዓን ናቸው' }, right: { en: 'For Theirs Is the Kingdom of Heaven', am: 'መንግሥተ ሰማያት የእነርሱ ናትና' }, exp: 'Spiritual humility and dependence on God opens the entrance to the heavenly realm.', ref: 'Matthew 5:3', route: '/bible/matthew/5' },
        { id: 'match-p3-bea-mourn', left: { en: 'Blessed Are Those Who Mourn', am: 'የሚያዝኑ ብፁዓን ናቸው' }, right: { en: 'For They Shall Be Comforted by Divine Grace', am: 'መጽናናትን ያገኛሉና' }, exp: 'Those who grieve over sin and brokenness will receive the divine consolation of the Paraclete.', ref: 'Matthew 5:4', route: '/bible/matthew/5' },
        { id: 'match-p3-bea-meek', left: { en: 'Blessed Are the Meek and Gentle', am: 'የዋሆች ብፁዓን ናቸው' }, right: { en: 'For They Shall Inherit the Earth', am: 'ምድርን ይወርሳሉና' }, exp: 'Gentleness that refuses vengeful anger will receive the restored inheritance of creation.', ref: 'Matthew 5:5', route: '/bible/matthew/5' },
        { id: 'match-p3-bea-hunger', left: { en: 'Blessed Are Those Who Hunger for Righteousness', am: 'ጽድቅን የሚራቡና የሚጠሙ ብፁዓን ናቸው' }, right: { en: 'For They Shall Be Abundantly Filled', am: 'ይጠግባሉና' }, exp: 'Longing for divine virtue and conformity to God’s will is met with heavenly satisfaction.', ref: 'Matthew 5:6', route: '/bible/matthew/5' },
        { id: 'match-p3-bea-merciful', left: { en: 'Blessed Are the Merciful and Compassionate', am: 'የሚምሩ ብፁዓን ናቸው' }, right: { en: 'For They Shall Obtain Plentiful Mercy', am: 'ምሕረትን ያገኛሉና' }, exp: 'Those who forgive others and care for the needy receive abundant mercy at the Judgment.', ref: 'Matthew 5:7', route: '/bible/matthew/5' },
        { id: 'match-p3-bea-pure', left: { en: 'Blessed Are the Pure in Heart', am: 'ልበ ንጹሖች ብፁዓን ናቸው' }, right: { en: 'For They Shall Behold God in Glory', am: 'እግዚአብሔርን ያዩታልና' }, exp: 'Cleansing the inner heart from lust, pride, and hypocrisy grants the beatific vision of God.', ref: 'Matthew 5:8', route: '/bible/matthew/5' },
        { id: 'match-p3-bea-peace', left: { en: 'Blessed Are the Peacemakers', am: 'የሚያስታርቁ ብፁዓን ናቸው' }, right: { en: 'For They Shall Be Called Sons of God', am: 'የእግዚአብሔር ልጆች ይባላሉና' }, exp: 'Those who reconcile enemies and bring peace reflect the nature of the Prince of Peace.', ref: 'Matthew 5:9', route: '/bible/matthew/5' },
        { id: 'match-p3-bea-persecuted', left: { en: 'Blessed Are the Persecuted for Righteousness', am: 'ስለ ጽድቅ የሚሰደዱ ብፁዓን ናቸው' }, right: { en: 'Crown of the Heavenly Kingdom Awaiting Sufferers', am: 'የመንግሥተ ሰማያት የጽድቅ አክሊል ተስፋቸው ነው' }, exp: 'Suffering injustice and loss for obeying God’s truth wins an eternal crown in heaven.', ref: 'Matthew 5:10', route: '/bible/matthew/5' },
        { id: 'match-p3-bea-reviled', left: { en: 'Blessed When Men Revile You Falsely for Christ', am: 'ስለ እኔ ሲነቅፉአችሁና ሲያሳድዱአችሁ ብፁዓን ናችሁ' }, right: { en: 'Great Is Your Heavenly Reward with the Prophets', am: 'በሰማያት ዋጋችሁ ታላቅ ነውና' }, exp: 'Patient endurance under slander aligns believers with the ancient holy prophets.', ref: 'Matthew 5:11', route: '/bible/matthew/5' },
        { id: 'match-p3-bea-salt', left: { en: 'You Are the Salt of the Earth', am: 'እናንተ የምድር ጨው ናችሁ' }, right: { en: 'Preserving and Flavoring Creation with Faith', am: 'ዓለምን በእምነት የሚያጣፍጥና የሚጠብቅ' }, exp: 'Christians prevent moral rot and impart the flavor of kingdom grace to the surrounding world.', ref: 'Matthew 5:13', route: '/bible/matthew/5' }
      ]
    },

    // 10. Holy Covenants of Scripture (10 pairs)
    {
      id: 'holy-covenants-scripture',
      name: { en: 'Holy Covenants of Sacred Scripture', am: 'የቅዱሳት መጻሕፍት ኪዳናት' },
      pairs: [
        { id: 'match-p3-cov-eden', left: { en: 'Edenic Covenant of Innocence', am: 'በገነት የተደረገ የንጽሕና ኪዳን' }, right: { en: 'Tree of Life and Holy Fellowship with the Creator', am: 'የሕይወት ዛፍና ከፈጣሪ ጋር የነበረ ኅብረት' }, exp: 'Man was placed in the Garden of delight to keep it and enjoy communion with God.', ref: 'Genesis 2:16', route: '/bible/genesis/2' },
        { id: 'match-p3-cov-adam', left: { en: 'Promise of the Seed (Protoevangelium)', am: 'የዘሩ ተስፋ (የመጀመሪያው ወንጌል)' }, right: { en: 'The Woman’s Seed Bruising the Serpent’s Head', am: 'የሴቲቱ ዘር የእባቡን ራስ እንደሚቀጠቅጥ' }, exp: 'After the Fall, God promised that the Redeemer born of the Woman would conquer the devil.', ref: 'Genesis 3:15', route: '/bible/genesis/3' },
        { id: 'match-p3-cov-noah', left: { en: 'Noahic Covenant of Peace', am: 'የኖኅ የሰላም ኪዳን' }, right: { en: 'Rainbow Sign that the Earth Shall Not Be Flooded', am: 'ምድር ዳግመኛ በውኃ እንዳትጠፋ የቀስተ ደመና ምልክት' }, exp: 'God placed His bow in the cloud as an everlasting sign of forbearance toward all flesh.', ref: 'Genesis 9:13', route: '/bible/genesis/9' },
        { id: 'match-p3-cov-abraham', left: { en: 'Abrahamic Covenant of Blessing', am: 'የአብርሃም የበረከት ኪዳን' }, right: { en: 'In His Seed Shall All Nations of the Earth Be Blessed', am: 'በዘሩ የምድር አሕዛብ ሁሉ እንዲባረኩ' }, exp: 'The unconditional promise of seed, land, and global blessing fulfilled in Jesus Christ.', ref: 'Genesis 22:18', route: '/bible/genesis/22' },
        { id: 'match-p3-cov-moses', left: { en: 'Mosaic Covenant at Mount Sinai', am: 'የደብረ ሲና የሕግ ኪዳን' }, right: { en: 'Ten Commandments Inscribed on Tablets of Stone', am: 'በድንጋይ ጽላት ላይ የተጻፉት ዐሥሩ ትእዛዛት' }, exp: 'The moral law delivered with thunder and smoke forming Israel into a holy priestly nation.', ref: 'Exodus 20:1', route: '/bible/exodus/20' },
        { id: 'match-p3-cov-phinehas', left: { en: 'Priestly Covenant with Phinehas', am: 'ከፊንሐስ ጋር የተደረገ የክህነት ኪዳን' }, right: { en: 'Everlasting Priesthood for Zealous Faithfulness', am: 'ስለ ቅንዓቱ የተሰጠ የዘላለም ክህነት' }, exp: 'Given a covenant of peace and perpetual priesthood for turning away wrath from Israel.', ref: 'Numbers 25:13', route: '/bible/numbers/25' },
        { id: 'match-p3-cov-david', left: { en: 'Davidic Covenant of the Throne', am: 'የዳዊት የመንግሥት ኪዳን' }, right: { en: 'An Enduring Royal Throne Established Forever', am: 'ለዘላለም የሚጸና የንጉሥ ዙፋን' }, exp: 'God promised David through Nathan that his throne would be established forever in Messiah.', ref: '2 Samuel 7:16', route: '/bible/2-samuel/7' },
        { id: 'match-p3-cov-jeremiah', left: { en: 'New Covenant Prophesied by Jeremiah', am: 'በኤርምያስ የተነገረው አዲስ ኪዳን' }, right: { en: 'God’s Law Inscribed upon the Tablets of the Heart', am: 'የእግዚአብሔር ሕግ በልብ ጽላት ላይ መጻፉ' }, exp: 'I will put my law in their minds and write it on their hearts; I will forgive their iniquity.', ref: 'Jeremiah 31:33', route: '/bible/jeremiah/31' },
        { id: 'match-p3-cov-christ', left: { en: 'New Covenant in Christ’s Blood', am: 'በክርስቶስ ክቡር ደም የተመሠረተ አዲስ ኪዳን' }, right: { en: 'Eucharistic Chalice for the Remission of Sins', am: 'ስለ ኃጢአት ስርየት የሚፈሰው የቅዱስ ቁርባን ጽዋ' }, exp: 'This cup is the new covenant in my blood which is poured out for many for forgiveness.', ref: 'Luke 22:20', route: '/bible/luke/22' },
        { id: 'match-p3-cov-revelation', left: { en: 'Everlasting Consummation in New Jerusalem', am: 'በአዲሲቱ ኢየሩሳሌም የሚፈጸም የዘላለም ተስፋ' }, right: { en: 'God Dwelling with Men Wiping Away Every Tear', am: 'እግዚአብሔር ከሰዎች ጋር ማደሩና እንባን ሁሉ ማበሱ' }, exp: 'He will dwell with them and they shall be His people; there shall be no more death or crying.', ref: 'Revelation 21:3', route: '/bible/revelation/21' }
      ]
    }
  ]

  console.log(`=== VALIDATING MATCH & DISCOVER PHASE 3 (100 PAIRS / 10 COLLECTIONS) ===`)
  const allPairs: MatchPair[] = []

  for (const col of collections) {
    const pairs: MatchPair[] = col.pairs.map(p => ({
      id: p.id,
      category: col.id,
      left: p.left,
      right: p.right,
      explanation: { en: p.exp },
      source: p.route.startsWith('/bible') ? bible(p.ref, p.route) : churchLib(p.ref, p.route),
      verifiedLocales: ['en']
    }))

    // Validate with validateStudioDraft
    const draftErrors = validateStudioDraft({ game: 'match', content: pairs })
    if (draftErrors.length > 0) {
      console.error(`Validation failed for collection ${col.id}:`, draftErrors)
      process.exit(1)
    }

    // Validate each card individually
    for (const pair of pairs) {
      const cardErrors = validateCardContent('match', pair)
      if (cardErrors.length > 0) {
        console.error(`Validation failed for pair ${pair.id}:`, cardErrors)
        process.exit(1)
      }
    }

    allPairs.push(...pairs)
  }

  // Duplicate collision check with existing pairs
  const p1Path = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'match', 'pairs.json')
  const p1Pairs: MatchPair[] = fs.existsSync(p1Path) ? JSON.parse(fs.readFileSync(p1Path, 'utf8')) : []
  const p2Path = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'phase-2', 'match', 'pairs.json')
  const p2Pairs: MatchPair[] = fs.existsSync(p2Path) ? JSON.parse(fs.readFileSync(p2Path, 'utf8')) : []
  const existingPairs = [...p1Pairs, ...p2Pairs]

  const merged = mergeCardBank('match', existingPairs, allPairs)
  console.log(`Initial Match pairs: ${existingPairs.length}. With Phase 3: ${merged.length} (0 duplicates).`)
  if (merged.length !== existingPairs.length + allPairs.length) {
    console.error(`Match duplicate collision! Expected ${existingPairs.length + allPairs.length}, got ${merged.length}`)
    process.exit(1)
  }

  // Save artifacts
  const matchDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'phase-3', 'match')
  fs.mkdirSync(matchDir, { recursive: true })
  fs.writeFileSync(path.join(matchDir, 'collections.json'), JSON.stringify(collections, null, 2), 'utf8')
  fs.writeFileSync(path.join(matchDir, 'pairs.json'), JSON.stringify(allPairs, null, 2), 'utf8')
  fs.writeFileSync(path.join(matchDir, 'report.json'), JSON.stringify({
    generatedAt: new Date().toISOString(),
    game: 'match',
    phase: 3,
    collectionsCount: collections.length,
    pairsCount: allPairs.length,
    collections: collections.map(c => ({ id: c.id, nameEn: c.name.en, pairsCount: c.pairs.length })),
    validation: { isValid: true, errors: [] }
  }, null, 2), 'utf8')

  console.log(`Successfully generated and validated 100 Match & Discover pairs across 10 collections!`)
}

run().catch(err => {
  console.error('Error in Phase 3 Match:', err)
  process.exit(1)
})
