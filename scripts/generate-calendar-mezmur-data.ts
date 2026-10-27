import { readFileSync, writeFileSync, mkdirSync } from 'node:fs'
import { resolve } from 'node:path'

interface CalendarCard {
  id: string
  slug: string
  title: string
  title_amharic?: string | null
  source_type: 'observance' | 'season' | 'monthly_commemoration' | 'fast'
  source_slug?: string | null
  ethiopian_month_number?: number | null
  ethiopian_day?: number | null
  is_monthly?: boolean
}

interface PublishedMezmur {
  mezmur_id?: string | null
  slug: string
  title: string
  title_amharic?: string | null
  search_keywords?: string | null
  singer_name?: string | null
  rights_status?: string | null
}

export interface CalendarMezmurAssociation {
  calendar_card_id?: string | null
  calendar_card_slug: string
  event_kind: 'observance' | 'monthly' | 'season' | 'fast' | 'synaxarium'
  event_title: string
  event_title_amharic?: string | null
  mezmur_slug: string
  mezmur_title: string
  mezmur_title_amharic?: string | null
  relationship_type:
    | 'exact_commemoration'
    | 'saint_angel'
    | 'feast'
    | 'liturgical_season'
    | 'fasting_occasion'
    | 'thematic'
  priority: number
  reason_en: string
  reason_am: string
  review_status: 'approved' | 'pending_review' | 'rejected'
}

const cards: CalendarCard[] = JSON.parse(readFileSync(resolve('scripts/calendar_cards_dump.json'), 'utf8'))
const mezmurs: PublishedMezmur[] = JSON.parse(readFileSync(resolve('scripts/mezmur_public_dump.json'), 'utf8'))
const mezmurMap = new Map<string, PublishedMezmur>(mezmurs.map((m) => [m.slug, m]))

const associations: CalendarMezmurAssociation[] = []

function add(
  cardSlug: string,
  mezmurSlug: string,
  relType: CalendarMezmurAssociation['relationship_type'],
  priority: number,
  reasonEn: string,
  reasonAm: string,
  reviewStatus: 'approved' | 'pending_review' = 'approved'
) {
  const card = cards.find((c) => c.slug === cardSlug)
  if (!card) {
    console.warn('Card not found for slug:', cardSlug)
    return
  }
  const mezmur = mezmurMap.get(mezmurSlug)
  if (!mezmur) {
    console.warn('Mezmur not found for slug:', mezmurSlug)
    return
  }

  // Deduplicate
  const exists = associations.some(
    (a) => a.calendar_card_slug === cardSlug && a.mezmur_slug === mezmurSlug && a.relationship_type === relType
  )
  if (exists) return

  associations.push({
    calendar_card_id: card.id,
    calendar_card_slug: card.slug,
    event_kind: card.source_type === 'monthly_commemoration' ? 'monthly' : card.source_type,
    event_title: card.title,
    event_title_amharic: card.title_amharic || null,
    mezmur_slug: mezmur.slug,
    mezmur_title: mezmur.title,
    mezmur_title_amharic: mezmur.title_amharic || null,
    relationship_type: relType,
    priority,
    reason_en: reasonEn,
    reason_am: reasonAm,
    review_status: reviewStatus,
  })
}

// ----------------------------------------------------------------------------
// 1. MAJOR FEASTS & OBSERVANCES
// ----------------------------------------------------------------------------

// Enkutatash / Ethiopian New Year
add('observance-enkutatash', 'awde-amet-le-barko', 'exact_commemoration', 1,
  'Official liturgical hymn for Enkutatash / New Year (Awde Amet)', 'ለእንቁጣጣሽ የዐውደ ዓመት መዝሙር')
add('observance-enkutatash', 'ametun-asalfeh', 'exact_commemoration', 1,
  'Hymn of thanksgiving for passing into the new year', 'ስለ ዓመቱ ፍጻሜ እና አዲስ ጅማሬ ምስጋና')

// Meskel / Demera
add('observance-meskel', 'eleni-nigist-haseset-meskelu', 'exact_commemoration', 1,
  'Feast hymn commemorating the Finding of the True Cross by Queen Helena', 'ንግሥት ዕሌኒ መስቀሉን ያገኘችበት መታሰቢያ')
add('observance-meskel', 'meskel-birhane', 'exact_commemoration', 1,
  'Praise hymn exalting the Holy Cross as the light of the faithful', 'መስቀል ብርሃናችን ነው የሚል የምስጋና መዝሙር')
add('observance-meskel', 'meskelike-yikunene-beza', 'exact_commemoration', 1,
  'Liturgical prayer hymn: May Your Cross be our salvation', 'መስቀልከ ይኩነነ ቤዛ የሚል የጸሎት መዝሙር')
add('observance-megabit-meskel', 'meskel-birhane', 'exact_commemoration', 1,
  'Commemorates the manifestation of the Holy Cross on Megabit 10', 'የመጋቢት ፲ የመስቀል መታሰቢያ መዝሙር')
add('observance-demera', 'meskel-abeba-wub-abeba', 'feast', 2,
  'Eve of Meskel celebration hymn for the Demera gathering', 'ለደመራ ዋዜማ የቀረበ የምስጋና መዝሙር')

// Gena / Nativity of Christ & Circumcision
add('observance-gena', 'beza-kulu-alem-yom-tewolede', 'exact_commemoration', 1,
  'Solemn Nativity hymn: Today the Savior of all the world is born', 'ቤዛ ኩሉ ዓለም ዮም ተወልደ - የልደት በዓል መዝሙር')
add('observance-gena', 'reiywo-nolot', 'exact_commemoration', 1,
  'Nativity Gospel hymn: The Shepherds saw Him in Bethlehem', 'ርእይዎ ኖሎት - እረኞች ያዩት የገና ምስጋና')
add('observance-gena', 'begol-sekebe-beatsrqt', 'exact_commemoration', 1,
  'Nativity hymn celebrating Christ born and laid in the manger', 'በጎል ሰከበ - በረት የተኛበት የልደት መዝሙር')
add('observance-gena', 'eyesus-tewelidu-gena-mezmur-eritrean-orthodox-mezmur-zemari-bereket-tiku', 'exact_commemoration', 1,
  'Traditional feast hymn celebrating the Holy Birth of Jesus', 'ኢየሱስ ተወሊዱ - የጌታችን የልደት በዓል መዝሙር')

// Timket & Ketera (Epiphany & Eve)
add('observance-timket', 'our-lord-and-king-of-peace', 'exact_commemoration', 1,
  'Feast hymn commemorating the Baptism of our Lord Jesus Christ in Jordan', 'ለጥምቀት በዓል የቀረበ የዮርዳኖስ ምስጋና')
add('observance-ketera', 'our-lord-and-king-of-peace', 'feast', 2,
  'Eve of Timket (Ketera) procession to the water', 'ለከተራ ዋዜማ ወደ ባሕረ ጥምቀት የሚዘመር ምስጋና')

// Kana of Galilee (Wedding at Cana)
add('observance-kana-ze-galila', 'zemarit-mirtineshi-tilahun-kana-ze-gelila-ye-d-daniel-wendimu-ye-sergi-m', 'exact_commemoration', 1,
  'Gospel feast hymn for Christ\'s first miracle at Cana of Galilee', 'በቃና ዘገሊላ ጌታችን ውሃውን የወይን ጠጅ ያደረገበት መታሰቢያ')

// Debre Tabor / Transfiguration
add('observance-debre-tabor', 'tabor-abera', 'exact_commemoration', 1,
  'Feast of the Transfiguration on Mount Tabor (Buhe)', 'ታቦር አበራ - የደብረ ታቦር (ቡሄ) በዓል መዝሙር')
add('observance-debre-tabor', 'aman-beaman-tesebha', 'feast', 2,
  'Hymn praising Christ transfigured in Divine Glory', 'በክብረ መለኮት የተገለጠበት ምስጋና')

// Filseta / Assumption & Dormition of Saint Mary
add('observance-filseta', 'saint-mary-has-ascended', 'exact_commemoration', 1,
  'Feast hymn for the Holy Assumption of Our Lady Virgin Mary (Filseta)', 'የእመቤታችን የትንሣኤዋ እና ዕርገቷ (ፍልሰታ) መዝሙር')
add('observance-filseta', 'wede-misraq-eyu', 'exact_commemoration', 1,
  'Marian Filseta hymn: Look to the East and see her glory', 'ወደ ምስራቅ እዩ - የእመቤታችን የፍልሰታ በዓል መዝሙር')
add('observance-maryam-dormition', 'dingil-fetariwan', 'exact_commemoration', 1,
  'Commemorating the Dormition and resting of Saint Mary (Asteyo Maryam, Tir 21)', 'የእመቤታችን የእረፍቷ መታሰቢያ (አስተርዮ ማርያም)')
add('observance-maryam-presentation', 'azekri-dingil', 'exact_commemoration', 1,
  'Feast of Ba\'ata: Entrance of the three-year-old Virgin into the Temple', 'በአታ ለማርያም - እመቤታችን ወደ ቤተ መቅደስ የገባችበት መታሰቢያ')
add('observance-lideta-maryam', 'akilile-tsige-mariyam', 'exact_commemoration', 1,
  'Feast of the Nativity of the Blessed Virgin Mary (Lideta Maryam, Ginbot 1 & Meskerem 1)', 'ልደታ ለማርያም - የእመቤታችን የልደት በዓል መዝሙር')
add('observance-qusquam-maryam', 'azekri-dingil', 'exact_commemoration', 1,
  'Commemoration of the Flight into Egypt and refuge at Mount Qusquam', 'የእመቤታችንና የጌታችን የስደቱ መታሰቢያ (ቁስቋም ማርያም)')
add('observance-maryam-flight-egypt', 'azekri-dingil', 'exact_commemoration', 1,
  'Commemoration of the Flight of the Holy Family into Egypt', 'የቅድስት ቤተሰብ የስደት መታሰቢያ')
add('observance-debre-mitmaq', 'yebrhan-gorf-nat-dingl-enatachn', 'feast', 1,
  'Apparition of the Holy Virgin Mary at Debre Mitmaq (Ginbot 21)', 'የእመቤታችን በደብረ ምጥማቅ የመገለጧ በዓል መዝሙር')

// Kidane Mihret (Covenant of Mercy - Yekatit 16 & monthly)
add('observance-kidane-mihret', 'kidane-mihret-emebet', 'exact_commemoration', 1,
  'Great Annual Feast of the Covenant of Mercy granted to Saint Mary (Yekatit 16)', 'ለኪዳነ ምሕረት ዓመታዊ ታላቅ በዓል (የካቲት ፲፮) የቀረበ መዝሙር')
add('observance-kidane-mihret', 'kidane-mihiret-enate', 'exact_commemoration', 1,
  'Hymn of intercession to Our Lady of the Covenant of Mercy', 'ኪዳነ ምሕረት እናቴ - አማላጅነቷን የሚያወድስ መዝሙር')

// Archangel Michael Feasts (Hidar 12 & Sene 12)
add('observance-michael-hidar', 'tewedaj-yekidus-mikael-mezimurat-liredagn-meta-yeafomiya-eredat-neh-bebe', 'exact_commemoration', 1,
  'Great Annual Feast of Archangel Michael in Hidar (saving Afomia and the faithful)', 'የኅዳር ሚካኤል ዓመታዊ በዓል መዝሙር')
add('observance-michael-hidar', 'liredan-meta-mikael', 'exact_commemoration', 1,
  'Praise hymn: Michael came to our rescue', 'ሊረዳን መጣ ሚካኤል - የሊቀ መላእክት ቅዱስ ሚካኤል ምስጋና')
add('observance-michael-sene', 'mar-mikael-libelih', 'exact_commemoration', 1,
  'Feast of Archangel Michael in Sene (saving Saint John and suffering souls)', 'የሰኔ ሚካኤል ዓመታዊ በዓል መዝሙር')

// Archangel Gabriel Feasts (Tahsas 19 & Hamle 19)
add('observance-gabriel-tahsas', 'gebriel-hayal-melake-selam', 'exact_commemoration', 1,
  'Great Annual Feast of Archangel Gabriel in Tahsas (delivering the three holy youths from the furnace)', 'የታኅሣሥ ገብርኤል ዓመታዊ በዓል - ሠለስቱ ደቂቅን ከእሳት ያዳነበት')
add('observance-gabriel-tahsas', 'yeramaw-gebriel', 'exact_commemoration', 1,
  'Praise hymn to Prince of Rama Archangel Gabriel', 'የራማው ልዑል ቅዱስ ገብርኤል መዝሙር')
add('observance-gabriel-hamle', 'gebriel-hayal-melake-selam', 'exact_commemoration', 1,
  'Annual Feast of Archangel Gabriel in Hamle (saving Saint Cyriacus and Julitta)', 'የሐምሌ ገብርኤል ዓመታዊ በዓል - ቅዱስ ቂርቆስንና ኢየሉጣን ያዳነበት')
add('observance-bisrate-gabriel', 'absera-gebriel', 'exact_commemoration', 1,
  'Feast of the Annunciation: Archangel Gabriel announcing the Good News to the Virgin Mary', 'አብሠራ ገብርኤል - የብስራት በዓል መዝሙር')

// Holy Trinity (Tir 7 & Sene 7)
add('observance-trinity-tir', 'silassen-amesgnu', 'exact_commemoration', 1,
  'Feast of the Holy Trinity in Tir (commemorating the covenant with Abraham)', 'የጥር ሥላሴ ዓመታዊ በዓል - ሥላሴን አመስግኑ')
add('observance-trinity-tir', 'kibir-lesilase', 'exact_commemoration', 1,
  'Doxology hymn: Glory to the Father, the Son, and the Holy Spirit', 'ክብር ለሥላሴ - የምስጋና መዝሙር')

// Saint George (Tir 18 & Miyazya 23)
add('observance-george-tir', 'nu-beegiziabiher-des-yibeleni-dinik-adigolignal-giyorigis-hayal', 'exact_commemoration', 1,
  'Commemorating Saint George the Martyr (building of his church and triumph in Tir)', 'የጥር ቅዱስ ጊዮርጊስ በዓል መዝሙር')

// Saint Stephen (Tir 1)
add('observance-stephen-tir', 'estifanos-semeat', 'exact_commemoration', 1,
  'Commemoration of Saint Stephen the Protomartyr (Tir 1)', 'እስጢፋኖስ ሰማዕት - የጥር ፩ መታሰቢያ መዝሙር')

// Abune Tekle Haymanot (Hidar 24 Birth & Nehase 24 Departure)
add('observance-tekle-haymanot-birth', 'le-teklehaimanot-tsadiq', 'exact_commemoration', 1,
  'Celebrating the Holy Birth of Abune Tekle Haymanot (Hidar 24)', 'የአቡነ ተክለ ሃይማኖት የልደት በዓል (ኅዳር ፳፬)')
add('observance-tekle-haymanot-departure', 'amlak-tekle-haymanot', 'exact_commemoration', 1,
  'Commemorating the Departure of Abune Tekle Haymanot (Nehase 24)', 'የአቡነ ተክለ ሃይማኖት የዕረፍት በዓል (ነሐሴ ፳፬)')

// Abune Gebre Menfes Kidus (Tikimt 5 & Megabit 5)
add('observance-gebre-menfes-kidus-tikimt', 'gebremenfes-kidus-yealem-birhan', 'exact_commemoration', 1,
  'Great Annual Feast of Abune Gebre Menfes Kidus (Abo) on Tikimt 5', 'የአቡነ ገብረ መንፈስ ቅዱስ የጥቅምት ፭ ታላቅ በዓል መዝሙር')
add('observance-gebre-menfes-kidus-megabit', 'gebire-menifes-kidus-yealem-birihan-nachew', 'exact_commemoration', 1,
  'Commemorating the Departure of Abune Gebre Menfes Kidus on Megabit 5', 'የአቡነ ገብረ መንፈስ ቅዱስ የመጋቢት ፭ የዕረፍት መታሰቢያ')

// Saint Yared (Ginbot 11)
add('observance-yared-ginbot', 'ye-yared-wub-zema', 'exact_commemoration', 1,
  'Annual Feast commemorating Saint Yared the Father of Ethiopian Hymnody (Ginbot 11)', 'የቅዱስ ያሬድ የዜማ አባት ዓመታዊ በዓል (ግንቦት ፲፩)')
add('observance-yared-ginbot', 'yared-kahenu-zemre', 'exact_commemoration', 1,
  'Hymn: Yared the Priest Sang unto God', 'ያሬድ ካህኑ ዘመረ - የቅዱስ ያሬድ ምስጋና')

// ----------------------------------------------------------------------------
// 2. LITURGICAL SEASONS & FASTS
// ----------------------------------------------------------------------------

// Zemene Tsige (Season of Flowers) & Tsige Fast
add('tsige-season', 'akilile-tsige-mariyam', 'liturgical_season', 1,
  'Appointed seasonal Marian hymn for Zemene Tsige (Season of Flowers)', 'የዘመነ ጽጌ የወቅቱ የእመቤታችን መዝሙር')
add('fast-tsige-fast', 'akilile-tsige-mariyam', 'fasting_occasion', 1,
  'Hymn appointed for the voluntary Tsige Fast commemorating the Flight into Egypt', 'የጽጌ ጾም የእመቤታችንና የጌታችን የስደቱ መታሰቢያ')

// Great Lent (Abiy Tsom)
add('great-lent', 'nitsum-tsoma', 'liturgical_season', 1,
  'Liturgical Lent hymn exhorting fasting, prayer, and repentance: Nitsum Tsoma', 'ንጹም ጾመ - የዓቢይ ጾም የምክርና የንስሐ መዝሙር')
add('great-lent', 'dinik-yeabiy-tsom-mezimur', 'liturgical_season', 1,
  'Great Lent contemplation hymn on forgiveness and spiritual renewal', 'ድንቅ የዓቢይ ጾም መዝሙር')

// Weekly Wednesday & Friday Fast
add('fast-weekly-wednesday-friday', 'nitsum-tsoma', 'fasting_occasion', 1,
  'Weekly canonical fast of salvation commemorating Christ\'s betrayal and Crucifixion', 'የረቡዕና ዓርብ ጾመ ድህነት ምስጋና')
add('fast-weekly-wednesday-friday', 'tilin-bemeskelu-gedele', 'fasting_occasion', 2,
  'Crucifixion contemplation hymn for Wednesday and Friday', 'ጥልን በመስቀሉ ገደለ - የዕለተ ዓርብ ምስጋና')

// Apostles Fast Period
add('apostles-fast-period', 'the-holy-apostle', 'liturgical_season', 1,
  'Hymn commemorating the Fast and ministry of the Holy Apostles', 'የጾመ ሐዋርያት መዝሙር')

// Holy Week (Himamat)
add('holy-week', 'weredo-emeskelu', 'liturgical_season', 1,
  'Holy Week hymn contemplating Christ\'s deposition from the Cross', 'ወሪዶ እመስቀሉ - የሕማማት ሰሞን መዝሙር')
add('holy-week', 'yesiklet-mezmur', 'liturgical_season', 1,
  'Good Friday contemplation hymn on the Crucifixion and Passion of our Savior', 'የስቅለት መዝሙር - የጌታችን መከራና ስቅለት')
add('heraclius-week', 'nitsum-tsoma', 'liturgical_season', 2,
  'Heraclius Week (first week of Lent) preparatory fasting hymn', 'የጾመ ሕርቃል የመጀመሪያው የጾም ሳምንት መዝሙር')

// Paschal / Resurrection Season (Zemene Tinsae)
add('paschal-season', 'kirstos-tensae', 'liturgical_season', 1,
  'Liturgical Paschal hymn: Christ is risen from the dead', 'ክርስቶስ ተንስአ እሙታን - የትንሣኤ ወቅት መዝሙር')
add('paschal-season', 'wemidrni-tigebir-fasika', 'liturgical_season', 1,
  'Paschal joy hymn: And the earth celebrates Pascha', 'ወምድርኒ ትገብር ፋሲካ - የትንሣኤ ወቅት ምስጋና')
add('resurrection-period', 'tinsaeke-leele-amene', 'liturgical_season', 1,
  'Season of Fifty Days hymn: We celebrate Your Holy Resurrection', 'ትንሣኤከ ለእለ አመነ - የሃምሳው ቀናት ምስጋና')
add('bright-week', 'enidetenagere-tenesitwal', 'liturgical_season', 1,
  'Bright Week hymn: He has risen as He promised', 'እንደተናገረ ተነስቷል - የትንሣኤ ሰሞን መዝሙር')

// Filseta Fasting Period
add('filseta-period', 'saint-mary-has-ascended', 'liturgical_season', 1,
  'Appointed hymn for the sixteen days of the Filseta Fast (Nehase 1–16)', 'የፍልሰታ ጾም የወቅቱ መዝሙር')

// Advent / Sibket Period & Nolawi
add('advent-sibket', 'reiywo-nolot', 'liturgical_season', 1,
  'Advent proclamation hymn contemplating the coming of the Messiah', 'የስብከት ወቅት መዝሙር')
add('sibket-period', 'reiywo-nolot', 'liturgical_season', 1,
  'Season of Proclamation: The Prophets and Shepherds looking toward Bethlehem', 'የዘመነ ስብከት የምሥራች መዝሙር')
add('nolawi-period', 'anferatsu-sebea-segel', 'liturgical_season', 1,
  'Season of the Good Shepherd: Prophecy and arrival of the True Shepherd', 'የዘመነ ኖላዊ መዝሙር')
add('astereyo', 'dingil-fetariwan', 'liturgical_season', 2,
  'Season of Revelation (Aster\'eyo): Manifestation of the Lord to mankind', 'የዘመነ አስተርዮ የምስጋና መዝሙር')
add('berhan-period', 'meskel-birhane', 'liturgical_season', 2,
  'Zemene Berhan (Season of Light) hymn: Walking in the Divine Light', 'የዘመነ ብርሃን መዝሙር')

// ----------------------------------------------------------------------------
// 3. MONTHLY COMMEMORATIONS (DAYS 1 TO 30)
// ----------------------------------------------------------------------------

// Day 1: Lideta Maryam & Prophet Elijah
add('monthly-lideta-maryam-monthly', 'akilile-tsige-mariyam', 'exact_commemoration', 1,
  'Monthly commemoration of the Nativity of Saint Mary (Lideta Maryam, 1st of month)', 'የልደታ ማርያም ወርሃዊ መታሰቢያ (፩)')
add('monthly-lideta-maryam-monthly', 'dingil-fetariwan', 'exact_commemoration', 1,
  'Marian praise hymn honoring the Mother of Life', 'የእመቤታችን ምስጋና')

// Day 3: Ba'ata Maryam
add('monthly-beata-maryam-monthly', 'azekri-dingil', 'exact_commemoration', 1,
  'Monthly commemoration of the Presentation of Saint Mary in the Temple (Ba\'ata, 3rd of month)', 'የበአታ ለማርያም ወርሃዊ መታሰቢያ (፫)')

// Day 5: Abune Gebre Menfes Kidus
add('monthly-gebre-menfes-kidus-monthly', 'gebremenfes-kidus-yealem-birhan', 'exact_commemoration', 1,
  'Monthly commemoration of Abune Gebre Menfes Kidus (Abo, 5th of month)', 'የአቡነ ገብረ መንፈስ ቅዱስ ወርሃዊ መታሰቢያ (፭)')
add('monthly-gebre-menfes-kidus-monthly', 'gebire-menifes-kidus-yealem-birihan-nachew', 'exact_commemoration', 1,
  'Hymn exalting Saint Gebre Menfes Kidus as a light to the world', 'ገብረ መንፈስ ቅዱስ የዓለም ብርሃን ናቸው')

// Day 6: Qusquam Maryam & Jesus
add('monthly-qusquam-maryam-monthly', 'azekri-dingil', 'exact_commemoration', 1,
  'Monthly commemoration of Mount Qusquam and refuge of the Holy Family (6th of month)', 'የቁስቋም ማርያም ወርሃዊ መታሰቢያ (፮)')
add('monthly-jesus-monthly', 'eyesus-tewelidu-gena-mezmur-eritrean-orthodox-mezmur-zemari-bereket-tiku', 'exact_commemoration', 1,
  'Monthly commemoration of our Lord and Savior Jesus Christ (Iyyasus, 6th of month)', 'የኢየሱስ ወርሃዊ መታሰቢያ ምስጋና')

// Day 7: Holy Trinity (Selassie)
add('monthly-trinity-monthly', 'silassen-amesgnu', 'exact_commemoration', 1,
  'Monthly commemoration of the Holy Trinity (Selassie, 7th of month)', 'የቅድስት ሥላሴ ወርሃዊ መታሰቢያ (፯)')
add('monthly-trinity-monthly', 'kibir-lesilase', 'exact_commemoration', 1,
  'Doxology: Glory to the Holy Trinity, One in Three and Three in One', 'ክብር ለሥላሴ - የምስጋና መዝሙር')
add('monthly-trinity-monthly', 'menigisite-silase', 'exact_commemoration', 1,
  'Praising the eternal kingdom of the Holy Trinity', 'መንግስተ ሥላሴ - የሥላሴ ክብር')

// Day 10: Holy Cross (Meskel)
add('monthly-cross-monthly', 'meskel-birhane', 'exact_commemoration', 1,
  'Monthly commemoration of the Holy Cross of our Lord Jesus Christ (10th of month)', 'የመስቀለ ክርስቶስ ወርሃዊ መታሰቢያ (፲)')
add('monthly-cross-monthly', 'tilin-bemeskelu-gedele', 'exact_commemoration', 1,
  'Contemplating redemption and salvation through the Holy Cross', 'ጥልን በመስቀሉ ገደለ - የመስቀል ምስጋና')

// Day 12: Archangel Michael
add('monthly-michael-monthly', 'liredan-meta-mikael', 'exact_commemoration', 1,
  'Monthly commemoration of Archangel Michael (12th of month)', 'የሊቀ መላእክት ቅዱስ ሚካኤል ወርሃዊ መታሰቢያ (፲፪)')
add('monthly-michael-monthly', 'mar-mikael-libelih', 'exact_commemoration', 1,
  'Intercession hymn honoring Saint Michael the protector', 'ማር ሚካኤል - የአማላጅነቱ ምስጋና')
add('monthly-michael-monthly', 'tewedaj-yekidus-mikael-mezimurat-liredagn-meta-yeafomiya-eredat-neh-bebe', 'exact_commemoration', 1,
  'Hymn commemorating Michael\'s swift assistance in times of need', 'የቅዱስ ሚካኤል ተወዳጅ መዝሙራት')

// Day 13: Archangel Raphael & God the Father
add('monthly-raphael-monthly', 'rufael-tekebel-tseloten', 'exact_commemoration', 1,
  'Monthly commemoration of Archangel Raphael the healer and comforter (13th of month)', 'የቅዱስ ሩፋኤል ወርሃዊ መታሰቢያ (፲፫)')
add('monthly-raphael-monthly', 'rufael-abate', 'exact_commemoration', 1,
  'Prayer hymn: Saint Raphael our spiritual father and intercessor', 'ሩፋኤል አባቴ - የፈዋሹ መልአክ ምስጋና')
add('monthly-god-father-monthly', 'silassen-amesgnu', 'exact_commemoration', 1,
  'Monthly commemoration of God the Father (Egziabher Ab, 13th of month)', 'የእግዚአብሔር አብ ወርሃዊ መታሰቢያ (፲፫)')

// Day 14: Abune Aregawi
add('monthly-aregawi-monthly', 'abunearegawi-zemarit-betselot-asmare', 'exact_commemoration', 1,
  'Monthly commemoration of Abune Aregawi of Debre Damo (14th of month)', 'የአቡነ አረጋዊ ዘደብረ ዳሞ ወርሃዊ መታሰቢያ (፲፬)')

// Day 15: Saints Cyriacus and Julitta (Qirqos & Iyeluta)
add('monthly-cyriacus-julitta-monthly', 'qirqos-iyelutan', 'exact_commemoration', 1,
  'Monthly commemoration of the child martyr Saint Cyriacus and his mother Julitta (15th of month)', 'የቅዱስ ቂርቆስና እናቱ እየሉጣ ወርሃዊ መታሰቢያ (፲፭)')

// Day 16: Kidane Mihret (Covenant of Mercy)
add('monthly-kidane-mihret-monthly', 'kidane-mihret-emebet', 'exact_commemoration', 1,
  'Monthly commemoration of Our Lady of the Covenant of Mercy (Kidane Mihret, 16th of month)', 'የኪዳነ ምሕረት ወርሃዊ መታሰቢያ (፲፮)')
add('monthly-kidane-mihret-monthly', 'kidane-mihiret-enate', 'exact_commemoration', 1,
  'Intercession hymn honoring the Covenant of Mercy', 'ኪዳነ ምሕረት እናቴ - የወርሃዊ መታሰቢያ ምስጋና')
add('monthly-kidane-mihret-monthly', 'enat-alegn-kidane-mihiret', 'exact_commemoration', 1,
  'Devotional praise: I have a heavenly Mother, Kidane Mihret', 'እናት አለኝ ኪዳነ ምሕረት')

// Day 17: Saint Stephen (Estifanos)
add('monthly-stephen-monthly', 'estifanos-semeat', 'exact_commemoration', 1,
  'Monthly commemoration of Saint Stephen the Protomartyr (17th of month)', 'የቅዱስ እስጢፋኖስ ቀዳሜ ሰማዕት ወርሃዊ መታሰቢያ (፲፯)')

// Day 19: Archangel Gabriel
add('monthly-gabriel-monthly', 'gebriel-hayal-melake-selam', 'exact_commemoration', 1,
  'Monthly commemoration of Archangel Gabriel (19th of month)', 'የሊቀ መላእክት ቅዱስ ገብርኤል ወርሃዊ መታሰቢያ (፲፱)')
add('monthly-gabriel-monthly', 'yeramaw-gebriel', 'exact_commemoration', 1,
  'Praising Gabriel, Prince of Rama and protector of the saints', 'የራማው ልዑል ቅዱስ ገብርኤል መዝሙር')
add('monthly-gabriel-monthly', 'gebirielin-lakew', 'exact_commemoration', 1,
  'Hymn: God sent Archangel Gabriel with glad tidings', 'ገብርኤልን ላከው - የቅዱስ ገብርኤል ምስጋና')

// Day 21: Virgin Mary (Egzi'etne Maryam)
add('monthly-maryam-monthly', 'dingil-fetariwan', 'exact_commemoration', 1,
  'Monthly commemoration of the Holy Virgin Mary (21st of month)', 'የቅድስት ድንግል ማርያም ወርሃዊ መታሰቢያ (፳፩)')
add('monthly-maryam-monthly', 'azekri-dingil', 'exact_commemoration', 1,
  'Traditional Marian prayer: Remember us, O Holy Virgin', 'አዘክሪ ድንግል - የእመቤታችን ምስጋና')
add('monthly-maryam-monthly', 'adegnegn-enate-kesega-fetena', 'exact_commemoration', 1,
  'Marian intercession prayer for protection and salvation', 'አድኝኝ እናቴ ከሥጋ ፈተና')
add('monthly-maryam-church-monthly', 'dingil-embete-yehiywete-redat', 'exact_commemoration', 1,
  'Monthly commemoration of the Consecration of the First Church of Saint Mary (Hinseta Beta Kristiyan)', 'የሕንፀተ ቤተ ክርስቲያን ወርሃዊ መታሰቢያ (፳፩)')
add('monthly-tsedenya-maryam-monthly', 'azekri-dingil', 'exact_commemoration', 1,
  'Commemoration of the Miraculous Icon of Saint Mary of Tsedenya', 'የፀደንያ ማርያም ተአምረኛ ሥዕል መታሰቢያ')

// Day 22: Archangel Uriel
// NOTE: Verified from database inspection: exactly 0 hymns exist in published catalog for Uriel!
// PER SPECIFICATION: "Do not invent an Archangel Uriel hymn if the published catalog contains no verified match."
// We deliberately DO NOT assign a false match here. Uriel remains flagged for review.

// Day 23: Saint George (Giyorgis)
add('monthly-giorgis-monthly', 'nu-beegiziabiher-des-yibeleni-dinik-adigolignal-giyorigis-hayal', 'exact_commemoration', 1,
  'Monthly commemoration of Saint George the Great Martyr (23rd of month)', 'የቅዱስ ጊዮርጊስ ሊቀ ሰማዕታት ወርሃዊ መታሰቢያ (፳፫)')

// Day 24: Abune Tekle Haymanot
add('monthly-tekle-haymanot-monthly', 'le-teklehaimanot-tsadiq', 'exact_commemoration', 1,
  'Monthly commemoration of Abune Tekle Haymanot (24th of month)', 'የአቡነ ተክለ ሃይማኖት ወርሃዊ መታሰቢያ (፳፬)')
add('monthly-tekle-haymanot-monthly', 'teklehaymanot-live-mezmur', 'exact_commemoration', 1,
  'Hymn praising the asceticism and prayers of Abune Tekle Haymanot', 'የአቡነ ተክለ ሃይማኖት ምስጋና')

// Day 27: Medhane Alem (Savior of the World)
add('monthly-passion-monthly', 'medhanealem-simeh-genana', 'exact_commemoration', 1,
  'Monthly commemoration of Medhane Alem / Savior of the World and the Passion of Christ (27th of month)', 'የመድኃኔዓለም ወርሃዊ መታሰቢያ (፳፯)')
add('monthly-passion-monthly', 'medihanealem-yelem-yemisanew', 'exact_commemoration', 1,
  'Hymn exalting the boundless mercy and salvation of Medhane Alem', 'መድኃኔዓለም የለም የሚሳነው - የምስጋና መዝሙር')

// Day 28: Emmanuel (Amanuel)
add('monthly-emmanuel-monthly', 'amanuel-temesgen', 'exact_commemoration', 1,
  'Monthly commemoration of Emmanuel — God with Us (28th of month)', 'የአማኑኤል ወርሃዊ መታሰቢያ - አማኑኤል ተመስገን (፳፰)')
add('monthly-emmanuel-monthly', 'nana-amanuel-na-medhanite', 'exact_commemoration', 1,
  'Prayer hymn: Come, O Emmanuel, our Savior', 'ናና አማኑኤል ና መድኃኒቴ')

// Day 29: Ba'ale Wold (Feast of God the Son / Nativity)
add('monthly-nativity-monthly', 'beza-kulu-alem-yom-tewolede', 'exact_commemoration', 1,
  'Monthly commemoration of the Nativity of Christ / Ba\'ale Wold (29th of month)', 'የበዓለ ወልድ ወርሃዊ መታሰቢያ - የልደት ምስጋና (፳፱)')
add('monthly-nativity-monthly', 'amanuel-temesgen', 'exact_commemoration', 1,
  'Praising God the Son Incarnate for our salvation', 'ለበዓለ ወልድ የቀረበ ምስጋና')

// Day 29 / Bisrate Gabriel (Annunciation)
add('monthly-annunciation-monthly', 'absera-gebriel', 'exact_commemoration', 1,
  'Monthly commemoration of the Annunciation of the Lord (Bisrate Gabriel, 29th of month)', 'የብስራተ ገብርኤል ወርሃዊ መታሰቢያ (፳፱)')

// Day 14 / Saint Yared
add('monthly-yared-monthly', 'ye-yared-wub-zema', 'exact_commemoration', 1,
  'Monthly commemoration of Saint Yared the father of Church music', 'የቅዱስ ያሬድ ወርሃዊ መታሰቢያ (፲፬)')

console.log('Total verified associations constructed:', associations.length)

// Determine covered vs missing cards
const coveredSlugs = new Set(associations.map((a) => a.calendar_card_slug))
const coveredCards = cards.filter((c) => coveredSlugs.has(c.slug))
const missingCards = cards.filter((c) => !coveredSlugs.has(c.slug))

console.log('\n--- COVERAGE SUMMARY ---')
console.log('Total Calendar Cards in Database:  ', cards.length)
console.log('Cards with Verified Associations:  ', coveredCards.length, `(${(coveredCards.length / cards.length * 100).toFixed(1)}%)`)
console.log('Cards in Review Queue (No verified match):', missingCards.length, `(${(missingCards.length / cards.length * 100).toFixed(1)}%)`)

// 1. Output CALENDAR_MEZMUR_COVERAGE.csv
const coverageCsvHeader = 'calendar_card_id,calendar_card_slug,event_kind,event_title,event_title_amharic,mezmur_slug,mezmur_title,relationship_type,priority,review_status,reason_en,reason_am\n'
const coverageCsvRows = associations
  .map((a) =>
    [
      `"${a.calendar_card_id || ''}"`,
      `"${a.calendar_card_slug}"`,
      `"${a.event_kind}"`,
      `"${a.event_title.replace(/"/g, '""')}"`,
      `"${(a.event_title_amharic || '').replace(/"/g, '""')}"`,
      `"${a.mezmur_slug}"`,
      `"${a.mezmur_title.replace(/"/g, '""')}"`,
      `"${a.relationship_type}"`,
      a.priority,
      `"${a.review_status}"`,
      `"${a.reason_en.replace(/"/g, '""')}"`,
      `"${a.reason_am.replace(/"/g, '""')}"`,
    ].join(',')
  )
  .join('\n')

writeFileSync(resolve('CALENDAR_MEZMUR_COVERAGE.csv'), coverageCsvHeader + coverageCsvRows, 'utf8')
console.log('Wrote CALENDAR_MEZMUR_COVERAGE.csv')

// 2. Output CALENDAR_MEZMUR_REVIEW_QUEUE.csv
const reviewQueueCsvHeader = 'calendar_card_id,calendar_card_slug,source_type,title,title_amharic,missing_category,theological_reason\n'
const reviewQueueCsvRows = missingCards
  .map((c) => {
    let reason = 'No verified published hymn found in catalog matching this specific commemoration. Requires editorial attribution.'
    if (c.slug.includes('uriel')) {
      reason = 'Confirmed 0 published hymns for Archangel Uriel in catalog. Preserving integrity per spec: do not invent false match.'
    } else if (c.slug.includes('apostle') || c.source_type === 'monthly_commemoration') {
      reason = 'Commemoration of apostle/saint without individual hymn recorded in published database.'
    }
    return [
      `"${c.id}"`,
      `"${c.slug}"`,
      `"${c.source_type}"`,
      `"${c.title.replace(/"/g, '""')}"`,
      `"${(c.title_amharic || '').replace(/"/g, '""')}"`,
      `"${c.source_type}"`,
      `"${reason}"`,
    ].join(',')
  })
  .join('\n')

writeFileSync(resolve('CALENDAR_MEZMUR_REVIEW_QUEUE.csv'), reviewQueueCsvHeader + reviewQueueCsvRows, 'utf8')
console.log('Wrote CALENDAR_MEZMUR_REVIEW_QUEUE.csv')

// 3. Output src/lib/recommendations/calendarMezmursData.ts
const tsRegistry = `/**
 * TEWAHEDODAILY: CANONICAL CALENDAR-TO-MEZMUR RELATIONSHIP DATASET
 *
 * Deterministic, offline-safe, and verified calendar card to hymn mappings.
 * Strictly verified against existing published Mezmurs.
 * Zero external AI / LLM dependencies.
 */

export interface CalendarMezmurLink {
  calendar_card_id?: string | null
  calendar_card_slug: string
  event_kind: 'observance' | 'monthly' | 'season' | 'fast' | 'synaxarium'
  event_title: string
  event_title_amharic?: string | null
  mezmur_slug: string
  mezmur_title: string
  mezmur_title_amharic?: string | null
  relationship_type:
    | 'exact_commemoration'
    | 'saint_angel'
    | 'feast'
    | 'liturgical_season'
    | 'fasting_occasion'
    | 'thematic'
  priority: number
  reason_en: string
  reason_am: string
  review_status: 'approved' | 'pending_review' | 'rejected'
}

export const CALENDAR_MEZMUR_LINKS: CalendarMezmurLink[] = ${JSON.stringify(associations, null, 2)}

export function getMezmursForCalendarCardSlug(slug: string): CalendarMezmurLink[] {
  return CALENDAR_MEZMUR_LINKS.filter(
    (l) => l.calendar_card_slug === slug && l.review_status === 'approved'
  ).sort((a, b) => a.priority - b.priority)
}
`
writeFileSync(resolve('src/lib/recommendations/calendarMezmursData.ts'), tsRegistry, 'utf8')
console.log('Wrote src/lib/recommendations/calendarMezmursData.ts')

// 4. Output migration SQL: supabase/migrations/20261026170000_calendar_card_mezmurs_links.sql
const migrationSql = `-- ============================================================================
-- TEWAHEDODAILY: CALENDAR CARD TO MEZMUR RELATIONSHIP TABLE & VERIFIED SEED
-- Migration: 20261026170000_calendar_card_mezmurs_links.sql
--
-- Forward-only, additive, and idempotent.
-- Links calendar cards and commemorations directly to verified published hymns.
-- Provides deterministic ranking, bilingual explanations, and admin review workflow.
-- ============================================================================

BEGIN;

CREATE TABLE IF NOT EXISTS public.calendar_card_mezmurs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  calendar_card_id UUID REFERENCES public.calendar_cards(id) ON DELETE CASCADE,
  calendar_card_slug TEXT NOT NULL,
  event_kind TEXT NOT NULL CHECK (event_kind IN ('observance', 'monthly', 'season', 'fast', 'synaxarium')),
  event_title TEXT NOT NULL,
  event_title_amharic TEXT,
  mezmur_slug TEXT NOT NULL,
  mezmur_title TEXT NOT NULL,
  mezmur_title_amharic TEXT,
  relationship_type TEXT NOT NULL CHECK (relationship_type IN ('exact_commemoration', 'saint_angel', 'feast', 'liturgical_season', 'fasting_occasion', 'thematic')),
  priority INTEGER NOT NULL DEFAULT 1 CHECK (priority >= 1 AND priority <= 5),
  reason_en TEXT NOT NULL,
  reason_am TEXT NOT NULL,
  review_status TEXT NOT NULL DEFAULT 'approved' CHECK (review_status IN ('approved', 'pending_review', 'rejected')),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  CONSTRAINT calendar_card_mezmurs_unique_link UNIQUE (calendar_card_slug, mezmur_slug, relationship_type)
);

CREATE INDEX IF NOT EXISTS idx_calendar_card_mezmurs_card_slug ON public.calendar_card_mezmurs(calendar_card_slug);
CREATE INDEX IF NOT EXISTS idx_calendar_card_mezmurs_mezmur_slug ON public.calendar_card_mezmurs(mezmur_slug);
CREATE INDEX IF NOT EXISTS idx_calendar_card_mezmurs_priority ON public.calendar_card_mezmurs(priority, review_status);

ALTER TABLE public.calendar_card_mezmurs ENABLE ROW LEVEL SECURITY;

GRANT SELECT ON public.calendar_card_mezmurs TO anon, authenticated, service_role;
GRANT INSERT, UPDATE, DELETE ON public.calendar_card_mezmurs TO authenticated;
GRANT ALL ON public.calendar_card_mezmurs TO service_role;

DROP POLICY IF EXISTS calendar_card_mezmurs_public_read ON public.calendar_card_mezmurs;
CREATE POLICY calendar_card_mezmurs_public_read ON public.calendar_card_mezmurs
  FOR SELECT TO anon, authenticated
  USING (review_status = 'approved');

DROP POLICY IF EXISTS calendar_card_mezmurs_staff_all ON public.calendar_card_mezmurs;
CREATE POLICY calendar_card_mezmurs_staff_all ON public.calendar_card_mezmurs
  FOR ALL TO authenticated
  USING (coalesce(public.is_staff(), false))
  WITH CHECK (coalesce(public.is_staff(), false));

-- Insert verified links idempotently
${associations
  .map(
    (a) => `INSERT INTO public.calendar_card_mezmurs (
  calendar_card_id, calendar_card_slug, event_kind, event_title, event_title_amharic,
  mezmur_slug, mezmur_title, mezmur_title_amharic, relationship_type, priority,
  reason_en, reason_am, review_status
) VALUES (
  ${a.calendar_card_id ? `'${a.calendar_card_id}'::uuid` : 'NULL'},
  '${a.calendar_card_slug.replace(/'/g, "''")}',
  '${a.event_kind}',
  '${a.event_title.replace(/'/g, "''")}',
  ${a.event_title_amharic ? `'${a.event_title_amharic.replace(/'/g, "''")}'` : 'NULL'},
  '${a.mezmur_slug.replace(/'/g, "''")}',
  '${a.mezmur_title.replace(/'/g, "''")}',
  ${a.mezmur_title_amharic ? `'${a.mezmur_title_amharic.replace(/'/g, "''")}'` : 'NULL'},
  '${a.relationship_type}',
  ${a.priority},
  '${a.reason_en.replace(/'/g, "''")}',
  '${a.reason_am.replace(/'/g, "''")}',
  '${a.review_status}'
) ON CONFLICT (calendar_card_slug, mezmur_slug, relationship_type) DO UPDATE SET
  priority = EXCLUDED.priority,
  reason_en = EXCLUDED.reason_en,
  reason_am = EXCLUDED.reason_am,
  review_status = EXCLUDED.review_status,
  updated_at = now();`
  )
  .join('\n\n')}

NOTIFY pgrst, 'reload schema';

COMMIT;
`

writeFileSync(resolve('supabase/migrations/20261026170000_calendar_card_mezmurs_links.sql'), migrationSql, 'utf8')
mkdirSync(resolve('supabase/calendar-mezmur'), { recursive: true })
writeFileSync(resolve('supabase/calendar-mezmur/CALENDAR_CARD_MEZMURS_MIGRATION.sql'), migrationSql, 'utf8')
console.log('Wrote migration files.')
