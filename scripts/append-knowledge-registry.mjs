import fs from 'fs'

const additionalCode = `
/**
 * Registry of Canonical Annual & Movable Feasts
 */
export const ANNUAL_AND_MOVABLE_FEAST_ARTICLES: Record<string, CalendarKnowledgeArticle> = {
  'enkutatash': {
    slug: 'enkutatash',
    title: 'Enkutatash / Ethiopian New Year (Qeddus Yohannes)',
    titleAmharic: 'እንቁጣጣሽ (ቅዱስ ዮሐንስ / ርእሰ ዐውደ ዓመት)',
    category: 'christ',
    ethiopianMonthNumber: 1,
    ethiopianDay: 1,
    isMajor: true,
    summary: 'The dawn of the Ethiopian civil and liturgical year on Meskerem 1, dedicated to Saint John the Baptist and celebrating divine renewal and peace.',
    summaryAmharic: 'መስከረም ፩ ቀን የሚከበረው የኢትዮጵያ ርእሰ ዐውደ ዓመት ሲሆን ለመጥምቁ ዮሐንስ የተሰየመና የእግዚአብሔርን አዲስ በረከት የምንቀበልበት ታላቅ በዓል ነው።',
    whatIsIt: 'Enkutatash marks the first day of the Ethiopian calendar year (Meskerem 1), concluding the rainy season (Kiremt) and ushering in the bright springtime season of flowers (Zemene Tsige).',
    whatIsItAmharic: 'እንቁጣጣሽ የኢትዮጵያ አዲስ ዓመት መጀመሪያ ሲሆን ክረምቱ አልፎ በጋው ሲተካ፣ አደይ አበባ ሲፈነዳ ምእመናን በአዲስ ተስፋ ወደ አምላካቸው የሚቀርቡበት በዓል ነው።',
    historicalBackground: 'Church tradition connects Enkutatash with the return of the Queen of Sheba (Makeda) from Jerusalem after visiting King Solomon, when her chiefs welcomed her with jewels (Enqu). The day is also dedicated to Saint John the Baptist, who preaches repentance as the beginning of spiritual renewal.',
    historicalBackgroundAmharic: 'የንግሥተ ሳባ ከሰሎሞን መንግሥት በሰላም መመለስና በመኳንንቱ በዕንቁ ጌጥ መሸለሟ ይነገራል። በቤተክርስቲያን ሥርዓት ደግሞ የነቢያት ማኅተም የሆነው የመጥምቁ ዮሐንስ መታሰቢያ ሆኖ ይከበራል።',
    whyCelebrated: 'To give thanks for the completion of the past year, pray for peace, abundance, and reconciliation, and dedicate the new year to God.',
    whyCelebratedAmharic: 'ያለፈውን ዓመት በሰላም ላስፈጸመንና ለአዲሱ ዓመት ላደረሰን አምላክ ምስጋና ለማቅረብ፣ ለምድራችንና ለሕዝባችን ሰላምና በረከት ለመለመን ይከበራል።',
    theologicalMeaning: 'The changing of the years points to Christ, who makes all things new (Revelation 21:5). He is the Alpha and Omega, the Lord of time and eternity.',
    theologicalMeaningAmharic: 'ክርስቶስ ሁሉን አዲስ አድራጊ አምላክ ነው (ራእይ ፳፩፥፭)። ዓመታት ሲፈራረቁ የሰው ልጅ በንስሐ ታድሶ ወደ ዘላለማዊው የእግዚአብሔር መንግሥት መሸጋገር እንዳለበት ያስተምራል።',
    traditionsPractices: 'Singing "Abebayehosh" by young maidens distributing fresh yellow Adey Abeba daisies; early morning church liturgy; slaughter of sheep/oxen for family feasts; gifting bread.',
    traditionsPracticesAmharic: 'ልጃገረዶች በአደይ አበባ "አበባየሆሽ" እያሉ ያበስራሉ፤ በቤተክርስቲያን ማኅሌትና ጸሎተ ቅዳሴ ይደረጋል፤ ቤተሰብ ተሰብስቦ ኅብስት ቆርሶ ይደሰታል።',
    importantInformation: 'Enkutatash falls on September 11 in common Gregorian years and September 12 in Gregorian leap years (preceding Ethiopian leap years).',
    importantInformationAmharic: 'በጎርጎርዮሳውያን አቆጣጠር መስከረም ፩ ቀን መስከረም ፲፩ (በዘመነ ዮሐንስ ደግሞ መስከረም ፲፪) ቀን ይውላል።',
    scriptureReferences: 'Psalm 65:11; Isaiah 61:1-3; 2 Corinthians 5:17; Revelation 21:1-7',
    relatedMezmurs: 'Yohannes Kibreka; Enkutatash Be-Selam Metash',
    relatedPrayers: 'Qiddase Qeddus Yohannes; Liturgical Year Blessing',
    sources: 'Ethiopian Synaxarium (Meskerem 1); Bahire Hasab; Deggwa Meskerem',
    sourcesAmharic: 'መጽሐፈ ስንክሳር (መስከረም ፩)፤ ባሕረ ሐሳብ፤ ያሬዳዊ የድጓ መጽሐፍ',
    researchStatus: 'published'
  },
  'meskel': {
    slug: 'meskel',
    title: 'Meskel / Finding of the True Cross',
    titleAmharic: 'መስቀል / በዓለ መስቀል (ዕፀ መስቀል የተገኘበት)',
    category: 'cross',
    ethiopianMonthNumber: 1,
    ethiopianDay: 17,
    isMajor: true,
    summary: 'The glorious annual feast celebrating the discovery of the True Cross by Empress Helena in Jerusalem and the arrival of a piece of the Cross in Ethiopia.',
    summaryAmharic: 'ንግሥት ዕሌኒ ጌታችን የተሰቀለበትን ክቡር መስቀል በኢየሩሳሌም የፈለገችበትና ግማደ መስቀሉ ወደ ኢትዮጵያ የመጣበት ታላቁ የመስቀል በዓል ነው።',
    whatIsIt: 'Meskel (Meskerem 17) is one of the grandest annual religious feasts of Ethiopia, UNESCO-inscribed for its living spiritual and cultural heritage.',
    whatIsItAmharic: 'መስከረም ፲፯ ቀን የሚከበረው የከበረው የክርስቶስ መስቀል መታሰቢያ ሲሆን በዩኔስኮ ጭምር የተመዘገበ ታላቅ መንፈሳዊና ባህላዊ ቅርስ ነው።',
    historicalBackground: 'In the 4th century, Queen Helena lit incense, and the smoke bowed down to pinpoint the rubbish mound covering Golgotha. Digging revealed the three crosses, and a dead man brought back to life identified the True Cross of Christ. In the 15th century under Emperor Zara Yaqob, a precious fragment of the Right Arm of the True Cross (Gimade Meskel) was brought to Ethiopia and enshrined at Gishen Debre Kerbe.',
    historicalBackgroundAmharic: 'በ፬ኛው መቶ ክፍለ ዘመን ንግሥት ዕሌኒ በእጣን ጢስ ምልክት ተመርታ መስቀሉን አስቆፍራ አግኝታዋለች። በ፲፭ኛው መቶ ክፍለ ዘመን በዐፄ ዘርዐ ያዕቆብ ዘመን ግማደ መስቀሉ ወደ ኢትዮጵያ መጥቶ በግሸን ደብረ ከርቤ ተቀምጧል።',
    whyCelebrated: 'To exult in the instrument of human salvation and thank God for the presence of the Relic of the Cross protecting Ethiopia.',
    whyCelebratedAmharic: 'የመስቀሉን ኃይል ለማክበር፣ የክርስቶስን የድኅነት ፍቅር ለማሰብና በግሸን ደብረ ከርቤ ለተቀመጠው ግማደ መስቀል በረከት ምስጋና ለማቅረብ ነው።',
    theologicalMeaning: 'The Cross is the Tree of Life replacing the tree of Eden. On it, Christ paid the ransom of Adam and disarmed the rulers of darkness.',
    theologicalMeaningAmharic: 'በዕፀ በለስ የወደቀው የሰው ልጅ በዕፀ መስቀል ዳነ። መስቀል የሞት መሸነፊያ፣ የሕይወት ምንጭና የክርስቲያኖች ሁሉ ኩራት ነው።',
    traditionsPractices: 'Demera bonfire lit on the eve (Meskerem 16); clergy chant "Yom Meskel As-ter’eye"; waving of torches (Chibo); yellow Adey Abeba blossoms.',
    traditionsPracticesAmharic: 'በዋዜማው (መስከረም ፲፮) ደመራ ይደመራል፤ ችቦ ይበራል፤ "ዮም መስቀል አስተርአየ" እየተባለ በማኅሌት ይዘመራል፤ የደመራ አመድ በግምባር ላይ በመስቀል አምሳል ይደረጋል።',
    importantInformation: 'Preceded by Demera on Meskerem 16. Gishen Mariam hosts one of the largest annual pilgrimages in Africa.',
    importantInformationAmharic: 'መስከረም ፲፮ ደመራ፣ መስከረም ፲፯ መስቀል ይከበራል። በግሸን ማርያም በሚሊዮን የሚቆጠሩ ምእመናን ይጓዛሉ።',
    scriptureReferences: 'Galatians 6:14; 1 Corinthians 1:18; Colossians 2:14; John 19:17-25',
    relatedMezmurs: 'Meskel Berhanu; Etsa Mesqel',
    relatedPrayers: 'Tselote Meskel; Melka Meskel; Deggwa Meskel',
    sources: 'Ethiopian Synaxarium (Meskerem 17); Metsihafe Tefut; Kibre Negest',
    sourcesAmharic: 'መጽሐፈ ስንክሳር (መስከረም ፲፯)፤ መጽሐፈ ጤፉት፤ ዜና ግሸን',
    researchStatus: 'published'
  },
  'gena': {
    slug: 'gena',
    title: 'Gena / Nativity of Christ (Lidet)',
    titleAmharic: 'ገና / በዓለ ልደት (የጌታችን የልደት በዓል)',
    category: 'christ',
    ethiopianMonthNumber: 4,
    ethiopianDay: 29,
    isMajor: true,
    summary: 'The holy Nativity of our Lord and God Jesus Christ in Bethlehem of Judea, celebrated on Tahsas 29 (Tahsas 28 in leap years).',
    summaryAmharic: 'ጌታችንና መድኃኒታችን ኢየሱስ ክርስቶስ በቤተልሔም በግርግም የተወለደበት ታላቁ የልደት በዓል (ታኅሣሥ ፳፱/፳፰)።',
    whatIsIt: 'The Major Feast of the Incarnation and Birth of Jesus Christ from the Virgin Mary without male seed in Bethlehem.',
    whatIsItAmharic: 'ከዘጠኙ ዐበይት በዓላት አንዱ የሆነውና የአምላክ ሰው መሆን በግርማ የተገለጠበት የጌታችን የልደት በዓል ነው።',
    historicalBackground: 'Fulfilling the prophecies of Micah and Isaiah, Christ was born in a manger because there was no room in the inn. Angels proclaimed peace to shepherds, and Magi from the East followed the miraculous star to offer gold, frankincense, and myrrh.',
    historicalBackgroundAmharic: 'በነቢያት ትንቢት መሠረት ጌታ በቤተልሔም በግርግም ተወለደ። መላእክት "ስብሐት ለእግዚአብሔር በሰማያት" እያሉ ዘመሩ፤ ሰብአ ሰገልም ከሩቅ መጥተው ወርቅ፣ እጣንና ከርቤ ገበሩለት።',
    whyCelebrated: 'To worship the Word made flesh who stooped down to lift humanity up to heavenly fellowship with God.',
    whyCelebratedAmharic: 'የፈጣሪን ፍጹም ትሕትና ለማመስገን፣ የሰላምን ንጉሥ ለመቀበልና የዘላለም ድኅነት ስለ ተሰጠን ለመደሰት ነው።',
    theologicalMeaning: 'The Incarnation is the foundation of salvation: God became man that man might become a partaker of the divine nature (2 Peter 1:4).',
    theologicalMeaningAmharic: 'እግዚአብሔር ሰው ሆነ፤ ሰውም የእግዚአብሔር ልጅ የመሆንን ጸጋ አገኘ። ክርስቶስ የተዋሐደው ሥጋ ከኃጢአት በቀር በሁሉም ነገር እንደ እኛ የሆነ እውነተኛ የሰው ባሕርይ ነው።',
    traditionsPractices: 'Night Mahlet and Liturgy; breaking the 43-day Advent Fast (Tsome Nebiyat); traditional Gena hockey game; wearing pure white Netela and Kaba.',
    traditionsPracticesAmharic: 'የሌሊት ማኅሌትና ቅዳሴ ይቆማል፤ የነቢያት ጾም ይፈሰካል፤ ባህላዊ የገና ጨዋታ ይካሄዳል፤ ነጭ ልብስ ለብሶ መዘመር ይከናወናል።',
    importantInformation: 'Celebrated on Tahsas 29 in ordinary years, but shifted to Tahsas 28 in leap years (when Pagumen has 6 days) to maintain exact 9-month gestation calculation.',
    importantInformationAmharic: 'በመደበኛ ዓመት ታኅሣሥ ፳፱፣ ጳጉሜን ፮ በሆነችበት ዘመነ ዮሐንስ ግን ታኅሣሥ ፳፰ ቀን ይከበራል።',
    scriptureReferences: 'Luke 2:1-20; Matthew 2:1-12; Micah 5:2; Isaiah 9:6',
    relatedMezmurs: 'Be-Bethlehem Tewelede; Selam Leki Maryam Lidet',
    relatedPrayers: 'Anaphora of Saint Epiphanius; Deggwa Lidet; Melka Lidet',
    sources: 'Ethiopian Synaxarium (Tahsas 29); Bahire Hasab; Gospel of Luke & Matthew',
    sourcesAmharic: 'መጽሐፈ ስንክሳር (ታኅሣሥ ፳፱)፤ ባሕረ ሐሳብ፤ ቅዱስ ወንጌል',
    researchStatus: 'published'
  },
  'timket': {
    slug: 'timket',
    title: 'Timket / Epiphany (Baptism of Christ)',
    titleAmharic: 'ጥምቀት / በዓለ ኤጲፋንያ (የጌታችን የጥምቀት በዓል)',
    category: 'christ',
    ethiopianMonthNumber: 5,
    ethiopianDay: 11,
    isMajor: true,
    summary: 'The glorious feast of Christ’s Baptism in the Jordan River by Saint John the Baptist on Tir 11, revealing the Holy Trinity.',
    summaryAmharic: 'ጌታችን በዮርዳኖስ ወንዝ በእደ ዮሐንስ የተጠመቀበትና የቅድስት ሥላሴ አንድነትና ሦስትነት የተገለጠበት ታላቁ የጥምቀት በዓል (ጥር ፲፩)።',
    whatIsIt: 'One of the nine Major Feasts of the Lord, commemorating Christ’s baptism at age thirty and the public manifestation (Theophany) of the Trinity.',
    whatIsItAmharic: 'ከዐበይት በዓላት አንዱ የሆነውና ጌታችን በሠላሳ ዓመቱ የተጠመቀበት፣ የሥላሴ ምሥጢር የታየበት ታላቁ የጥምቀት በዓል ነው።',
    historicalBackground: 'Christ went down to the Jordan to fulfill all righteousness. As He emerged from the water, the heavens opened, the Holy Spirit descended in the bodily form of a dove, and the Father’s voice resounded: "This is My beloved Son, in whom I am well pleased."',
    historicalBackgroundAmharic: 'ክርስቶስ ጽድቅን ሁሉ ሊፈጽም ወደ ዮርዳኖስ ወረደ። ከውኃው በወጣ ጊዜ ሰማያት ተከፈቱ፤ መንፈስ ቅዱስ በርግብ አምሳል ወረደ፤ አብም "የምወደው ልጄ ይህ ነው" ብሎ መሰከረ።',
    whyCelebrated: 'To celebrate our own spiritual rebirth through holy baptism, and give thanks that Christ sanctified the waters of the earth.',
    whyCelebratedAmharic: 'በጥምቀት የልጅነት ጸጋ ማግኘታችንን ለማሰብና የውኃውን ባሕርይ ቀድሶ ለድኅነታችን መሠረት ስላደረገልን ለማመስገን ነው።',
    theologicalMeaning: 'Theophany: The Trinity revealed—the Father speaking, the Son baptized, the Holy Spirit descending. Baptism washes away the handwriting of debt inherited from Adam.',
    theologicalMeaningAmharic: 'በጥምቀት ጊዜ ሥላሴ ተገለጡ፤ የአዳም የዕዳ ደብዳቤ በዮርዳኖስ ተቀደደ፤ የሰው ልጅ ከውኃና ከመንፈስ ቅዱስ ተወልዶ መንግሥተ ሰማያትን የሚወርስበት ጸጋ ተሰጠ።',
    traditionsPractices: 'Ketera procession on Tir 10 escorting Tabots to the water source; all-night prayer vigil; morning blessing of water; sprinkling of the faithful; singing "Be-Ahidu Qal".',
    traditionsPracticesAmharic: 'በዋዜማው (ጥር ፲) ታቦታቱ ወደ ባሕረ ጥምቀት በከበረ ሰልፍ ይወርዳሉ (ከተራ)፤ ሌሊቱን ሙሉ ጸሎትና ማኅሌት ይደረጋል፤ ማለዳ ውኃው ተባርኮ ሕዝቡ ይረጫል።',
    importantInformation: 'Preceded by Ketera on Tir 10; followed immediately by the Feast of the Wedding of Cana (Qana Ze-Gelila) on Tir 12.',
    importantInformationAmharic: 'ዋዜማው ጥር ፲ ከተራ ሲሆን ማግስቱ ጥር ፲፪ ቃና ዘገሊላ ተብሎ ይከበራል።',
    scriptureReferences: 'Matthew 3:13-17; Mark 1:9-11; Luke 3:21-22; John 1:29-34; Psalm 114:1-8',
    relatedMezmurs: 'Yordanos Amlake Tekedese; Mesekeru Mikael We-Gebriel',
    relatedPrayers: 'Metsihafe Timket; Deggwa Timket; Anaphora of the Apostles',
    sources: 'Ethiopian Synaxarium (Tir 11); Metsihafe Timket; Deggwa',
    sourcesAmharic: 'መጽሐፈ ስንክሳር (ጥር ፲፩)፤ መጽሐፈ ጥምቀት፤ የያሬድ ድጓ',
    researchStatus: 'published'
  },
  'tensae-fasika': {
    slug: 'tensae-fasika',
    title: 'Fasika / Holy Resurrection of Christ (Tensae)',
    titleAmharic: 'ፋሲካ / በዓለ ትንሣኤ (የጌታችን የትንሣኤ በዓል)',
    category: 'christ',
    isMajor: true,
    isMovable: true,
    summary: 'The Feast of Feasts and Season of Seasons—Christ is risen from the dead, trampling down death by death and bestowing life to those in the tombs.',
    summaryAmharic: 'የበዓላት ሁሉ በዓልና የበኩር ደስታ፦ ክርስቶስ በሞቱ ሞትን ድል አድርጎ ተነሥቷል፤ በመቃብር ላሉትም የዘላለም ሕይወትን ሰጥቷል።',
    whatIsIt: 'The supreme Christian solemnity celebrating the bodily Resurrection of Jesus Christ on the third day after His Crucifixion.',
    whatIsItAmharic: 'ከዘጠኙ ዐበይት በዓላት እጅግ ታላቁና የክርስትና እምነት ማዕከል የሆነው የጌታችን የትንሣኤ በዓል ነው።',
    historicalBackground: 'After suffering under Pontius Pilate, Christ was buried in a rock-hewn tomb. On Sunday dawn, the earth shook, the stone was rolled away by an angel, and Christ arose victorious, descending into Hades to shatter its brass gates and lead Adam and the righteous into paradise.',
    historicalBackgroundAmharic: 'ጌታችን በመስቀል ላይ ውሎ በክብር ከተቀበረ በኋላ በሦስተኛው ቀን በታላቅ ግርማ ተነሣ፤ ወደ ሲኦል ወርዶ የነሐሱን መዝጊያ ሰብሮ እስረኞቹን ነጻ አወጣ፤ አዳምንና ልጆቹን ወደ ገነት አገባ።',
    whyCelebrated: 'Because Christ’s Resurrection guarantees our own resurrection and eternal victory over sin, death, and corruption.',
    whyCelebratedAmharic: '"ክርስቶስ ተነሥቷል" በማለት የትንሣኤያችንን ተስፋ ለማረጋገጥና የጨለማው መንግሥት የተሸነፈበትን ዘላለማዊ ድል ለማብሰር ነው።',
    theologicalMeaning: 'The destruction of Hades (Hades Despoiled): Death is swallowed up in victory. Christ’s humanity was perfected in incorruptible glory.',
    theologicalMeaningAmharic: 'ሞት ድል ተነሥቷል፤ መቃብር ፈርሷል። ክርስቶስ በትንሣኤው የሰውን ባሕርይ ወደማይሞት ዘላለማዊ ክብር መልሶታል።',
    traditionsPractices: 'Midnight Paschal Liturgy; proclamation "Kristos Tens’a Em-Mutan" (Christ is Risen); joyous kiss of peace; holding lit candles; 50 days of fast-free joy (Filsata).',
    traditionsPracticesAmharic: 'የሌሊት ትንሣኤ ቅዳሴ፤ "ክርስቶስ ተንሥአ እሙታን" እየተባለ የሚደረግ የሰላምታ አዋጅ፤ ሻማ ማብራት፤ ለ፶ ቀናት የሚቆይ የፍስክ ወቅት (ፈሲለታ)።',
    importantInformation: 'Calculated dynamically each year via the Bahire Hasab calendar algorithm. Wednesday and Friday fasting is waived during the 50 days until Pentecost.',
    importantInformationAmharic: 'ቀኑ በየዓመቱ በባሕረ ሐሳብ ቀመር ይወጣል። እስከ በዓለ ሃምሳ (ጰራቅሊጦስ) ድረስ ባሉት ፶ ቀናት ረቡዕና ዓርብ አይጾምም።',
    scriptureReferences: 'Matthew 28:1-10; Mark 16:1-8; Luke 24:1-12; John 20:1-18; 1 Corinthians 15:1-26',
    relatedMezmurs: 'Kristos Tensa Em-Mutan; Tensawu Gedefe',
    relatedPrayers: 'Anaphora of Saint Athanasius; Mahlete Tensae; Deggwa Tensae',
    sources: 'Bahire Hasab; Ethiopian Synaxarium (Miyazya); Fetha Negest; Holy Gospels',
    sourcesAmharic: 'ባሕረ ሐሳብ፤ መጽሐፈ ስንክሳር፤ ፍትሐ ነገሥት፤ አራቱ ወንጌላት',
    researchStatus: 'published'
  },
  'siklet-good-friday': {
    slug: 'siklet-good-friday',
    title: 'Siklet / Good Friday (Crucifixion of Christ)',
    titleAmharic: 'ስቅለት / ዓርበ ስቅለት (የጌታችን የመስቀል መከራ)',
    category: 'christ',
    isMajor: true,
    isMovable: true,
    summary: 'The solemn memorial of the Crucifixion and Death of our Lord Jesus Christ on Golgotha for the redemption of the human race.',
    summaryAmharic: 'ጌታችን ኢየሱስ ክርስቶስ ስለ ሰው ልጆች ድኅነት በጎልጎታ በመስቀል ላይ ተሰቅሎ የዋለበት ታላቁ የሕማማት ዓርብ (ስቅለት)።',
    whatIsIt: 'The climax of Holy Week (Semune Himamat), marked by total fasting, sorrowful chanting, and continuous prostrations in the church.',
    whatIsItAmharic: 'የሰሙነ ሕማማት እጅግ ታላቁ ዕለት ሲሆን ምእመናን ቀኑን ሙሉ በጾም፣ በስግደትና በዕንባ ሆነው የጌታን መከራ የሚያስቡበት ነው።',
    historicalBackground: 'Betrayed by Judas, condemned unjustly by Pontius Pilate, scourged, crowned with thorns, and forced to bear His Cross to Golgotha, Christ was crucified between two thieves at the third hour. Darkness covered the earth from the sixth to the ninth hour until He breathed His last.',
    historicalBackgroundAmharic: 'ጌታችን በአይሁድ ሸንጎ ተከሶ፣ በጲላጦስ ፍርድ ተገርፎ፣ የእሾህ አክሊል ተጎናጽፎ መስቀሉን ተሸክሞ ወደ ቀራንዮ ወጣ። በስድስት ሰዓት ተሰቀለ፤ ፀሐይ ጨለመች፤ በዘጠኝ ሰዓት ነፍሱን አሳልፎ ሰጠ።',
    whyCelebrated: 'To contemplate the infinite price of our salvation and offer heartfelt repentance for the sins that pierced the Saviour.',
    whyCelebratedAmharic: 'የኃጢአታችንን ዋጋ ክርስቶስ እንዴት እንደ ከፈለልን ለማሰብና ከልብ በሆነ ንስሐ ወደ መስቀሉ ሥር ለመቅረብ ነው።',
    theologicalMeaning: 'The supreme act of Divine Love: "God demonstrates His own love toward us, in that while we were still sinners, Christ died for us" (Romans 5:8).',
    theologicalMeaningAmharic: 'ፍጹም የሆነው የእግዚአብሔር ፍቅር በመስቀል ላይ ተገለጠ። በደሙ ታጥበን ከአብ ጋር ታረቅን፤ ዲያብሎስም ተሸነፈ።',
    traditionsPractices: 'Performing hundreds of prostrations (Sigdet); chanting the Tsome Deggwa; reading the Passion Gospels every hour; sprinkling of blessed willow leaves (Qetema).',
    traditionsPracticesAmharic: 'ምእመናን በመቶዎች የሚቆጠር ስግደት ይሰግዳሉ፤ በየሰዓቱ የሕማማት ንባባት ይነበባሉ፤ ቄጠማ ይታሰራል፤ ፍጹም ጾም እስከ ምሽት ይጠበቃል።',
    importantInformation: 'Strict total fast (abstinency from all food and water) until the evening service ends.',
    importantInformationAmharic: 'በዚህ ዕለት እስከ ምሽት ድረስ ምንም ዓይነት እህልና ውኃ አይቀምስም፤ ፍጹም ጾም ይጾማል።',
    scriptureReferences: 'Matthew 27:27-56; Mark 15:16-41; Luke 23:26-49; John 19:16-37; Isaiah 53:1-12',
    relatedMezmurs: 'Be-Golgota Teseqele; Negusina Qidus',
    relatedPrayers: 'Gebre Himamat (Book of the Passion); Tselote Sigdet',
    sources: 'Gebre Himamat; Ethiopian Synaxarium; Deggwa Himamat',
    sourcesAmharic: 'መጽሐፈ ግብረ ሕማማት፤ ያሬዳዊ የሕማማት ድጓ፤ አራቱ ወንጌላት',
    researchStatus: 'published'
  }
}

/**
 * Universal lookup helper for any calendar event or commemoration.
 */
export function getKnowledgeArticle(key: string | number): CalendarKnowledgeArticle | null {
  if (typeof key === 'number') {
    return MONTHLY_COMMEMORATION_ARTICLES[key] || null
  }
  const cleanKey = String(key).toLowerCase().trim()
  if (ANNUAL_AND_MOVABLE_FEAST_ARTICLES[cleanKey]) {
    return ANNUAL_AND_MOVABLE_FEAST_ARTICLES[cleanKey]
  }
  // Try matching by slug substring or monthly number
  for (const article of Object.values(ANNUAL_AND_MOVABLE_FEAST_ARTICLES)) {
    if (article.slug === cleanKey || cleanKey.includes(article.slug)) {
      return article
    }
  }
  return null
}
`

fs.appendFileSync('src/lib/calendar/calendarKnowledgeRegistry.ts', additionalCode, 'utf8')
console.log('Appended Annual and Movable feasts to calendarKnowledgeRegistry.ts')
