-- =========================================================================
-- BATCH 01 of 10: 100 Hymns (1 to 100)
-- Target: public.mezmur_data_import
-- Strict 5-Column Concurrency Check + Atomic Transaction
-- =========================================================================

DO $batch_01$
DECLARE
  v_updated integer := 0;
  v_total integer := 0;
BEGIN

  -- Hymn: Abebaye Kidanemihiret (abebaye-kidanemihiret)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 1
ለኔማ ለልጅሽ
ሰምዬ ነሽ በእውነት
እኮራለሁ በአንቺ ከዕልፍ እናቶች
ልጅሽ ስለሆነ ጌታቸው ለጌቶች

VERSE 2
የበዛለት ቅኔ ፍቅርሽ የበዛለት
ውድስት አንቲ ይላል ሁሌ ያለ ዝለት
እናቴ አንቺን ለመውሰድ
ምን ያስፈራኛል

VERSE 3
እናቴ ጌታ ከሰጠኝ
ማን ይነጥቀኛል
ባልደርብም ካባ ባልቀዳጅ ዘውድ
ለኔ ሞገሴ ነው ልጅሽ ወላዲት

VERSE 4
የቀራንዮ ፍቅሩ መውደዱ ሲደንቀኝ
እነኋት አለና አንቺንም ሸለመኝ
ሽልማቴ ደብረ ነዋኂት
ፀምረ ጌዴዎን

VERSE 5
ሽልማቴ ኅትምት ክታብ
እናቴ ጽዮን
ሰማይ ሆነሽለት ለእውነተኛው ፀሀይ
ድቅድቁ ለቀቀ ልጅሽ በአንቺ ሲታይ

VERSE 6
በሞት መሸበሩ ግርግሩ በቃ
ጌታ በመስቀል ላይ ተፈጸመ አለ አበቃ
አበባዬ ተረሳሁ ብዬ
አልደፋ አንገቴን

VERSE 7
አበባዬ አንቺ አለሽኝ
ለኔስ ኩራቴ',
      lyrics_transliteration = 'Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 1
Lenema leljsh
Semye nesh beewnet
Ekoralehu beanchi keelf enatoch
Lijsh silehone getachew legetoch

VERSE 2
Yebezalet qine fiqrsh yebezalet
Widst anti yilal hule yale zilet
Enate anchin lemewsed
Min yasferagnal

VERSE 3
Enate Geta keset’egn
Man yinet’qegnal
Balderbm kaba balqedaj zewd
Lene mogese new lijsh weladit

VERSE 4
Yeqeranyo fiqru mewdedu sidenqegn
Enehwat alena anchinm shelemegn
Shlmate debre newahit
Ts’emre gedewon

VERSE 5
Shlmate hitmt kitab
Enate ts’yon
Semay honeshlet leewnetegnaw ts’ehey
Diqdqu leqeqe lijsh beanchi sitay

VERSE 6
Bemot mesheberu girgru beqa
Geta bemesqel lay tefets’eme ale abeqa
Abebaye teresahu biye
Aldefa angeten

VERSE 7
Abebaye anchi aleshgn
Lenes kurate',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'abebaye-kidanemihiret'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 1
ለኔማ ለልጅሽ
ሰምዬ ነሽ በእውነት
እኮራለሁ በአንቺ ከዕልፍ እናቶች
ልጅሽ ስለሆነ ጌታቸው ለጌቶች

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 2
የበዛለት ቅኔ ፍቅርሽ የበዛለት
ውድስት አንቲ ይላል ሁሌ ያለ ዝለት
እናቴ አንቺን ለመውሰድ
ምን ያስፈራኛል

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 3
እናቴ ጌታ ከሰጠኝ
ማን ይነጥቀኛል
ባልደርብም ካባ ባልቀዳጅ ዘውድ
ለኔ ሞገሴ ነው ልጅሽ ወላዲት

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 4
የቀራንዮ ፍቅሩ መውደዱ ሲደንቀኝ
እነኋት አለና አንቺንም ሸለመኝ
ሽልማቴ ደብረ ነዋኂት
ፀምረ ጌዴዎን

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 5
ሽልማቴ ኅትምት ክታብ
እናቴ ጽዮን
ሰማይ ሆነሽለት ለእውነተኛው ፀሀይ
ድቅድቁ ለቀቀ ልጅሽ በአንቺ ሲታይ

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 6
በሞት መሸበሩ ግርግሩ በቃ
ጌታ በመስቀል ላይ ተፈጸመ አለ አበቃ
አበባዬ ተረሳሁ ብዬ
አልደፋ አንገቴን

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት

VERSE 7
አበባዬ አንቺ አለሽኝ
ለኔስ ኩራቴ

CHORUS
ንግስቴ ኪዳነ ምህረት
አበባዬ ኪዳነ ምህረት
ለኔማ ለኔማ
ስጦታ ነሽ በእውነት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 1
Lenema leljsh
Semye nesh beewnet
Ekoralehu beanchi keelf enatoch
Lijsh silehone getachew legetoch

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 2
Yebezalet qine fiqrsh yebezalet
Widst anti yilal hule yale zilet
Enate anchin lemewsed
Min yasferagnal

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 3
Enate Geta keset’egn
Man yinet’qegnal
Balderbm kaba balqedaj zewd
Lene mogese new lijsh weladit

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 4
Yeqeranyo fiqru mewdedu sidenqegn
Enehwat alena anchinm shelemegn
Shlmate debre newahit
Ts’emre gedewon

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 5
Shlmate hitmt kitab
Enate ts’yon
Semay honeshlet leewnetegnaw ts’ehey
Diqdqu leqeqe lijsh beanchi sitay

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 6
Bemot mesheberu girgru beqa
Geta bemesqel lay tefets’eme ale abeqa
Abebaye teresahu biye
Aldefa angeten

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet

VERSE 7
Abebaye anchi aleshgn
Lenes kurate

CHORUS
Nigste kidane mihret
Abebaye kidane mihret
Lenema lenema
Sit’ota nesh beewnet'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'abebaye-kidanemihiret', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Abel Mekibib Weret Yelelew (abel-mekibib-weret-yelelew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 1
ያለው እግዚአብሔር /2/
ዘመን የማይዘው ጊዜ የማይገድበው
ያንተ ፍቅር ብቻ ቀን በቀን አዲስ ነው
ከዴማስ ጋር ስሄድ ትቼው የአንተን መንገድ

VERSE 2
ከቶ መች ቀነሰ ለእኔ ያለህ መውደድ
በአመጽ ብጠፋም ከመንጋህ መካከል
ይመሻል ይነጋል እኔን ስትከተል
እንደወጣ ይቅር ብለህ መቼ ተውከኝ

VERSE 3
ሴኬም ድረስ ወርደህ ልጅህን ፈለከኝ
በዝናዬም ዘመን ባለጸጋ እያለሁ
ቤቴ በወዳጆች ቀን በቀን ሙሉ ነው
እንደ ጤዛ ሲረግፍ ሃብትና ንብረቴ

VERSE 4
ያላንተ ማን ነበር በፈርሰው ቤቴ
የታመንኩባቸው ወዳጆች ሲከዱኝ
ሕመሜ ስር ሆነው ደጋግመው ሲወጉኝ
ላንተ ጊዜ ባጣም ለኔ ጊዜ አለህ

VERSE 5
ገፋህ ክፉ ቀኔን ከኔ ጋራ አብረህ
ዘማሪ ዲያቆን አቤል መክብብ',
      lyrics_transliteration = 'Weret yelelew
Weret yelelew mewded
Weret yelelew fiqr
Ante gar bicha new

VERSE 1
Yalew Egziabher (2)
Zemen yemayzew gize yemaygedbew
Yante fiqr bicha qen beqen adis new
Kedemas gar sihed tichew yeanten menged

VERSE 2
Keto mech qenese leene yaleh mewded
Beamets’ bit’efam kemengah mekakel
Yimeshal yinegal enen sitketel
Endewet’a yiqr bileh meche tewkegn

VERSE 3
Sekem dires werdeh lijhn felekegn
Beznayem zemen balets’ega eyalehu
Bete bewedajoch qen beqen mulu new
Ende t’eza siregf habtna nibrete

VERSE 4
Yalante man neber befersew bete
Yetamenkubachew wedajoch sikedugn
Himeme sir honew degagmew siwegugn
Lante gize bat’am lene gize aleh

VERSE 5
Gefah kifu qenen kene gara abreh
Zemari diyaqon abel mekbb',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'abel-mekibib-weret-yelelew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 1
ያለው እግዚአብሔር /2/
ዘመን የማይዘው ጊዜ የማይገድበው
ያንተ ፍቅር ብቻ ቀን በቀን አዲስ ነው
ከዴማስ ጋር ስሄድ ትቼው የአንተን መንገድ

CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 2
ከቶ መች ቀነሰ ለእኔ ያለህ መውደድ
በአመጽ ብጠፋም ከመንጋህ መካከል
ይመሻል ይነጋል እኔን ስትከተል
እንደወጣ ይቅር ብለህ መቼ ተውከኝ

CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 3
ሴኬም ድረስ ወርደህ ልጅህን ፈለከኝ
በዝናዬም ዘመን ባለጸጋ እያለሁ
ቤቴ በወዳጆች ቀን በቀን ሙሉ ነው
እንደ ጤዛ ሲረግፍ ሃብትና ንብረቴ

CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 4
ያላንተ ማን ነበር በፈርሰው ቤቴ
የታመንኩባቸው ወዳጆች ሲከዱኝ
ሕመሜ ስር ሆነው ደጋግመው ሲወጉኝ
ላንተ ጊዜ ባጣም ለኔ ጊዜ አለህ

CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው

VERSE 5
ገፋህ ክፉ ቀኔን ከኔ ጋራ አብረህ
ዘማሪ ዲያቆን አቤል መክብብ

CHORUS
ወረት የሌለው
ወረት የሌለው መውደድ
ወረት የሌለው ፍቅር
አንተ ጋር ብቻ ነው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Weret yelelew
Weret yelelew mewded
Weret yelelew fiqr
Ante gar bicha new

VERSE 1
Yalew Egziabher (2)
Zemen yemayzew gize yemaygedbew
Yante fiqr bicha qen beqen adis new
Kedemas gar sihed tichew yeanten menged

CHORUS
Weret yelelew
Weret yelelew mewded
Weret yelelew fiqr
Ante gar bicha new

VERSE 2
Keto mech qenese leene yaleh mewded
Beamets’ bit’efam kemengah mekakel
Yimeshal yinegal enen sitketel
Endewet’a yiqr bileh meche tewkegn

CHORUS
Weret yelelew
Weret yelelew mewded
Weret yelelew fiqr
Ante gar bicha new

VERSE 3
Sekem dires werdeh lijhn felekegn
Beznayem zemen balets’ega eyalehu
Bete bewedajoch qen beqen mulu new
Ende t’eza siregf habtna nibrete

CHORUS
Weret yelelew
Weret yelelew mewded
Weret yelelew fiqr
Ante gar bicha new

VERSE 4
Yalante man neber befersew bete
Yetamenkubachew wedajoch sikedugn
Himeme sir honew degagmew siwegugn
Lante gize bat’am lene gize aleh

CHORUS
Weret yelelew
Weret yelelew mewded
Weret yelelew fiqr
Ante gar bicha new

VERSE 5
Gefah kifu qenen kene gara abreh
Zemari diyaqon abel mekbb

CHORUS
Weret yelelew
Weret yelelew mewded
Weret yelelew fiqr
Ante gar bicha new'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'abel-mekibib-weret-yelelew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Abetu Ebakih Ahun Adin (abetu-ebakih-ahun-adin)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 1
የተሰበርው እንዲጠገን
ደዌው እንዲርቅ ተፈውሶ
አንተን እንዲያመልክ በህይወቱ
ከኃጥያት ከበደል ተመልሶ

VERSE 2
የባዘነውን ሰበሰብከው
የጠፍውንስ መቼ ተውከው
በቀል የማታቅ ቅዱስ ጌታ
አንተ ብቻ ነው ያከበርከው

VERSE 3
በጎች ቢምሉም በበርት ውስጥ
ዘጠነ ዘጠኝ ቢኖሩህም
አንዱ እንደውጣ ይቅር ብለህ
እኔን መፈለግ ችላ አላልክም

VERSE 4
ለጆቼ አምባር ለእግሮቼ ጫማ
ለአካሌ አዲስ ልብስ አለበስከኝ
እድፌን አፅተ አድተህኝ
እንዳመሰግን አደርከኝ

VERSE 5
ህፃን አዋቂው ያመልክሀል
ከቤቱ ነቅሎ ደጂ መቶ
ቅኔ መውድስ ተቀኘልህ
ይህው ለስምህ ክብርን ሰቶ

VERSE 6
መሻቱን ብቻ ተመልክተህ
ልቡን አንቅተህ ብትፈውሰው
ጂማሬው ቢሆን ፍፃሜውም
ሁሉን አንተ ነህ ያደርከው',
      lyrics_transliteration = 'Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana

VERSE 1
Yeteseberw endit’egen
Dewew endirq tefewso
Anten endiyamelk behywetu
Kehat’yat kebedel temelso

VERSE 2
Yebazenewn sebesebkew
Yet’efwns meche tewkew
Beqel yemataq Kidus Geta
Ante bicha new yakeberkew

VERSE 3
Begoch bimlum bebert wist’
Zet’ene zet’egn binoruhm
Andu endewt’a yiqr bileh
Enen mefeleg chla alalkm

VERSE 4
Lejoche ambar leegroche ch’ama
Leakale adis libs alebeskegn
Edfen ats’te adtehgn
Endamesegn aderkegn

VERSE 5
Hits’an awaqiw yamelkhel
Kebetu neqlo deji meto
Qine mewds teqegnelh
Yihw lesmh kibrn seto

VERSE 6
Meshatun bicha temelkteh
Libun anqteh bitfewsew
Jimarew bihon fits’amewm
Hulun ante neh yaderkew',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'abetu-ebakih-ahun-adin'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 1
የተሰበርው እንዲጠገን
ደዌው እንዲርቅ ተፈውሶ
አንተን እንዲያመልክ በህይወቱ
ከኃጥያት ከበደል ተመልሶ

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 2
የባዘነውን ሰበሰብከው
የጠፍውንስ መቼ ተውከው
በቀል የማታቅ ቅዱስ ጌታ
አንተ ብቻ ነው ያከበርከው

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 3
በጎች ቢምሉም በበርት ውስጥ
ዘጠነ ዘጠኝ ቢኖሩህም
አንዱ እንደውጣ ይቅር ብለህ
እኔን መፈለግ ችላ አላልክም

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 4
ለጆቼ አምባር ለእግሮቼ ጫማ
ለአካሌ አዲስ ልብስ አለበስከኝ
እድፌን አፅተ አድተህኝ
እንዳመሰግን አደርከኝ

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 5
ህፃን አዋቂው ያመልክሀል
ከቤቱ ነቅሎ ደጂ መቶ
ቅኔ መውድስ ተቀኘልህ
ይህው ለስምህ ክብርን ሰቶ

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 6
መሻቱን ብቻ ተመልክተህ
ልቡን አንቅተህ ብትፈውሰው
ጂማሬው ቢሆን ፍፃሜውም
ሁሉን አንተ ነህ ያደርከው

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana

VERSE 1
Yeteseberw endit’egen
Dewew endirq tefewso
Anten endiyamelk behywetu
Kehat’yat kebedel temelso

CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana

VERSE 2
Yebazenewn sebesebkew
Yet’efwns meche tewkew
Beqel yemataq Kidus Geta
Ante bicha new yakeberkew

CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana

VERSE 3
Begoch bimlum bebert wist’
Zet’ene zet’egn binoruhm
Andu endewt’a yiqr bileh
Enen mefeleg chla alalkm

CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana

VERSE 4
Lejoche ambar leegroche ch’ama
Leakale adis libs alebeskegn
Edfen ats’te adtehgn
Endamesegn aderkegn

CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana

VERSE 5
Hits’an awaqiw yamelkhel
Kebetu neqlo deji meto
Qine mewds teqegnelh
Yihw lesmh kibrn seto

CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana

VERSE 6
Meshatun bicha temelkteh
Libun anqteh bitfewsew
Jimarew bihon fits’amewm
Hulun ante neh yaderkew

CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'abetu-ebakih-ahun-adin', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Abetu Lanite (abetu-lanite)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አቤቱ ላንተ ለስምህ አለኝ ምስጋና
አቤቱ ላንተ ለስምህ አለኝ ምስጋና
እንዳንተ ያለ ካማልእክት ምነው ገናና
እንዳንተ ያለ እግዚአብሔር ማንስ አለና(2)

VERSE 1
አቤቱ ማዳንህ በኛ ላይ ተገልጧል
ግዙፉም ተራራ ከፊታችን ገልጧል
በግንብ የተሰሩ ብረት የለበሱ
የአህዛብ ከተሞች በመዝሙር ፈረሱ

VERSE 2
+++አዝማች+++
ስምንቱን ንፋሳት አንተ ስታዛቸው
ውቅያኖስ ባህሩም ይዘላል ፊታቸው
ቤልፌጎር አልቻለም አንተን መገዳደር

VERSE 3
የጥበብ ሀገሯ ታላቅ ነህ እግዚአብሔር
+++አዝማች+++
በብዙ መፅናናት ህይወቴን መለስካት
በቃልህ ወይን ጠጅ ነብሴን አረካሀት

VERSE 4
ለዝናም አይደለም ወይም ለሞቅታ
የምዘምርልህ ለአምልኮ ነው ጌታ
+++ አዝማች+++
በጥብርያዶስ ባህር ድግስህ ናፍቆኛል

VERSE 5
ከፈርኦን እንጀራ ፍቅርህ ለይቶኛል
የቦኤዝን እርሻ አልቃርምም እኔ
ዋናውን አጭዳለው ጌታ ነው መድኔ
+++ አዝማች+++',
      lyrics_transliteration = 'Abetu lante lesmh alegn misgana
Abetu lante lesmh alegn misgana
Endante yale kamalekt minew genana
Endante yale Egziabher mans alena (2)

VERSE 1
Abetu madanh begna lay tegelt’wal
Gizufum terara kefitachn gelt’wal
Begnb yeteseru biret yelebesu
Yeahzab ketemoch bemezmur feresu

VERSE 2
+++azmach+++
Simntun nifasat ante sitazachew
Wiqyanos bahrum yizelal fitachew
Belfegor alchalem anten megedader

VERSE 3
Yet’beb hegerwa talaq neh Egziabher
+++azmach+++
Bebzu mets’nanat hiyweten meleskat
Beqalh weyn t’ej nebsen arekahet

VERSE 4
Leznam aydelem weym lemoqta
Yemzemrlh leamlko new Geta
+++ azmach+++
Bet’bryados bahr digsh nafqognal

VERSE 5
Keferon enjera fiqrh leytognal
Yeboezn ersha alqarmm ene
Wanawn ach’dalew Geta new medne
+++ azmach+++',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'abetu-lanite'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አቤቱ ላንተ ለስምህ አለኝ ምስጋና
አቤቱ ላንተ ለስምህ አለኝ ምስጋና
እንዳንተ ያለ ካማልእክት ምነው ገናና
እንዳንተ ያለ እግዚአብሔር ማንስ አለና(2)

VERSE 1
አቤቱ ማዳንህ በኛ ላይ ተገልጧል
ግዙፉም ተራራ ከፊታችን ገልጧል
በግንብ የተሰሩ ብረት የለበሱ
የአህዛብ ከተሞች በመዝሙር ፈረሱ

CHORUS
አቤቱ ላንተ ለስምህ አለኝ ምስጋና
አቤቱ ላንተ ለስምህ አለኝ ምስጋና
እንዳንተ ያለ ካማልእክት ምነው ገናና
እንዳንተ ያለ እግዚአብሔር ማንስ አለና(2)

VERSE 2
+++አዝማች+++
ስምንቱን ንፋሳት አንተ ስታዛቸው
ውቅያኖስ ባህሩም ይዘላል ፊታቸው
ቤልፌጎር አልቻለም አንተን መገዳደር

CHORUS
አቤቱ ላንተ ለስምህ አለኝ ምስጋና
አቤቱ ላንተ ለስምህ አለኝ ምስጋና
እንዳንተ ያለ ካማልእክት ምነው ገናና
እንዳንተ ያለ እግዚአብሔር ማንስ አለና(2)

VERSE 3
የጥበብ ሀገሯ ታላቅ ነህ እግዚአብሔር
+++አዝማች+++
በብዙ መፅናናት ህይወቴን መለስካት
በቃልህ ወይን ጠጅ ነብሴን አረካሀት

CHORUS
አቤቱ ላንተ ለስምህ አለኝ ምስጋና
አቤቱ ላንተ ለስምህ አለኝ ምስጋና
እንዳንተ ያለ ካማልእክት ምነው ገናና
እንዳንተ ያለ እግዚአብሔር ማንስ አለና(2)

VERSE 4
ለዝናም አይደለም ወይም ለሞቅታ
የምዘምርልህ ለአምልኮ ነው ጌታ
+++ አዝማች+++
በጥብርያዶስ ባህር ድግስህ ናፍቆኛል

CHORUS
አቤቱ ላንተ ለስምህ አለኝ ምስጋና
አቤቱ ላንተ ለስምህ አለኝ ምስጋና
እንዳንተ ያለ ካማልእክት ምነው ገናና
እንዳንተ ያለ እግዚአብሔር ማንስ አለና(2)

VERSE 5
ከፈርኦን እንጀራ ፍቅርህ ለይቶኛል
የቦኤዝን እርሻ አልቃርምም እኔ
ዋናውን አጭዳለው ጌታ ነው መድኔ
+++ አዝማች+++

CHORUS
አቤቱ ላንተ ለስምህ አለኝ ምስጋና
አቤቱ ላንተ ለስምህ አለኝ ምስጋና
እንዳንተ ያለ ካማልእክት ምነው ገናና
እንዳንተ ያለ እግዚአብሔር ማንስ አለና(2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Abetu lante lesmh alegn misgana
Abetu lante lesmh alegn misgana
Endante yale kamalekt minew genana
Endante yale Egziabher mans alena (2)

VERSE 1
Abetu madanh begna lay tegelt’wal
Gizufum terara kefitachn gelt’wal
Begnb yeteseru biret yelebesu
Yeahzab ketemoch bemezmur feresu

CHORUS
Abetu lante lesmh alegn misgana
Abetu lante lesmh alegn misgana
Endante yale kamalekt minew genana
Endante yale Egziabher mans alena (2)

VERSE 2
+++azmach+++
Simntun nifasat ante sitazachew
Wiqyanos bahrum yizelal fitachew
Belfegor alchalem anten megedader

CHORUS
Abetu lante lesmh alegn misgana
Abetu lante lesmh alegn misgana
Endante yale kamalekt minew genana
Endante yale Egziabher mans alena (2)

VERSE 3
Yet’beb hegerwa talaq neh Egziabher
+++azmach+++
Bebzu mets’nanat hiyweten meleskat
Beqalh weyn t’ej nebsen arekahet

CHORUS
Abetu lante lesmh alegn misgana
Abetu lante lesmh alegn misgana
Endante yale kamalekt minew genana
Endante yale Egziabher mans alena (2)

VERSE 4
Leznam aydelem weym lemoqta
Yemzemrlh leamlko new Geta
+++ azmach+++
Bet’bryados bahr digsh nafqognal

CHORUS
Abetu lante lesmh alegn misgana
Abetu lante lesmh alegn misgana
Endante yale kamalekt minew genana
Endante yale Egziabher mans alena (2)

VERSE 5
Keferon enjera fiqrh leytognal
Yeboezn ersha alqarmm ene
Wanawn ach’dalew Geta new medne
+++ azmach+++

CHORUS
Abetu lante lesmh alegn misgana
Abetu lante lesmh alegn misgana
Endante yale kamalekt minew genana
Endante yale Egziabher mans alena (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'abetu-lanite', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Abetu Yehonebenen Asib Egziabher (abetu-yehonebenen-asib-egziabher)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 1
ቅኔ ማህሌቱ በደም ረሰረሰ
መቅደስህ ተቃጥሎ መሰውያዉ ፈረሰ
ጮሁ ደናግላን ደም እንባ አለቀሱ
በቅድሱ ስፍራ ታርዷልና ቄሱ

VERSE 2
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 3
ሰላም መስሎን ነበር መዉጣት መግባታችን
ለካስ በሾህ ታጥሯል ዙርያው ጎዳናችን
የፅዮን መንገዶች በዕንባ ተሞልተዋል
የሚያምሩት ግንቦችዋ በሌሊት ፈርሰዋል

VERSE 4
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 5
የቁጣህን በትር ማን ይቋቋመዋል
የኃይልህን ጽናት ማንስ ይችለዋል
የሽማግሌው ፊት አልታፈረምና
እንዴት ቀና እንበል እንዴት እንፅናና

VERSE 6
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 7
እንደ ዘካርያስ እንደ እግዚአብሔር ወዳጅ
ወደቁ ብዙዎች መጡና ካንተ ደጅ
ህፃን አዛዎንቱ ጎበዦቹ ሁሉ
ተሰዉ ለፍቅርህ አንክድም እያሉ

VERSE 8
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)',
      lyrics_transliteration = 'Abetu Yehonebenen Asibe Egziabher (2)

VERSE 1
Kene Maheletu Bedem Reserese
Mekdeshe Tekatlo Mesewiaw Ferese
Chohu Denagelan Dem Enba Alekesu
Bemekdesu Sefra Tardwalena Kesu

VERSE 2
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 3
Selam Meslon Neber Mewtat Megbatachen
Lekas Besho Tatrewal Zuriaw Godanachen
Yetsion Mengedoch Benba Temoltwal
Yemiamrut Ginbochwa Belelit Ferswal

VERSE 4
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 5
Yekutahen Beter Man Yekwakwamewal
Yehailehen Tsinat Manis Yechelewal
Yeshemaglew Fit Altaferemena
Endet kena Enibel Endet Enetsinana

VERSE 6
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 7
Ende Zekarias Ende Egziabher Wedaj
Wedeku Bizuoch Gebuna Kante Dej
Hitsan Azawentoch Gobezochu Hulu
Tesewu Lefiker Ankidem eyalu

VERSE 8
Abetu Yehonebenen Asibe Egziabher (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'abetu-yehonebenen-asib-egziabher'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 1
ቅኔ ማህሌቱ በደም ረሰረሰ
መቅደስህ ተቃጥሎ መሰውያዉ ፈረሰ
ጮሁ ደናግላን ደም እንባ አለቀሱ
በቅድሱ ስፍራ ታርዷልና ቄሱ

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 2
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 3
ሰላም መስሎን ነበር መዉጣት መግባታችን
ለካስ በሾህ ታጥሯል ዙርያው ጎዳናችን
የፅዮን መንገዶች በዕንባ ተሞልተዋል
የሚያምሩት ግንቦችዋ በሌሊት ፈርሰዋል

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 4
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 5
የቁጣህን በትር ማን ይቋቋመዋል
የኃይልህን ጽናት ማንስ ይችለዋል
የሽማግሌው ፊት አልታፈረምና
እንዴት ቀና እንበል እንዴት እንፅናና

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 6
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 7
እንደ ዘካርያስ እንደ እግዚአብሔር ወዳጅ
ወደቁ ብዙዎች መጡና ካንተ ደጅ
ህፃን አዛዎንቱ ጎበዦቹ ሁሉ
ተሰዉ ለፍቅርህ አንክድም እያሉ

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

VERSE 8
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)

CHORUS
አቤቱ የሆነብንን አስብ እግዚአብሔር (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 1
Kene Maheletu Bedem Reserese
Mekdeshe Tekatlo Mesewiaw Ferese
Chohu Denagelan Dem Enba Alekesu
Bemekdesu Sefra Tardwalena Kesu

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 2
Abetu Yehonebenen Asibe Egziabher (2)

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 3
Selam Meslon Neber Mewtat Megbatachen
Lekas Besho Tatrewal Zuriaw Godanachen
Yetsion Mengedoch Benba Temoltwal
Yemiamrut Ginbochwa Belelit Ferswal

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 4
Abetu Yehonebenen Asibe Egziabher (2)

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 5
Yekutahen Beter Man Yekwakwamewal
Yehailehen Tsinat Manis Yechelewal
Yeshemaglew Fit Altaferemena
Endet kena Enibel Endet Enetsinana

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 6
Abetu Yehonebenen Asibe Egziabher (2)

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 7
Ende Zekarias Ende Egziabher Wedaj
Wedeku Bizuoch Gebuna Kante Dej
Hitsan Azawentoch Gobezochu Hulu
Tesewu Lefiker Ankidem eyalu

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)

VERSE 8
Abetu Yehonebenen Asibe Egziabher (2)

CHORUS
Abetu Yehonebenen Asibe Egziabher (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'abetu-yehonebenen-asib-egziabher', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: ~Abiet Neaka ~Zemarit Merry Temelso~Eritrean Orthodox Tewahdo Mezmur (abiet-neaka-zemarit-merry-temelso-eritrean-orthodox-tewahdo-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ

VERSE 1
ኣብዚ ዓቢ ጎቦ ሜዳ ጎልጎል ኮነ
ብግንቢ ዝተሃንጹ ብኣጽዋር ዝተኸቡ
ከተማታት ኣህዛብ ብመዝሙር ፈረሱ
ሸሞንተ ንፋሳት ትሕዞም ንስኻ

VERSE 2
ባሕርን ውቅያኖስን እዩ ዘሎ ቅድሜኻ
ውሽጥና ኣይከኣለን ቀልዓለም ክገብር
ንሃገር ጥበብ ንዓኻ እግዚኣብሄር
ብምጽንንዓኻ ሕይወትና መሊስካ

VERSE 3
ብጥዑም ቃላትካ ነብስና ኣርጊእኻ
ንዝና ኣይኮነን ወይስ ንሽመታ
ትንስምረልካ ነምልኾ እዩ ጎይታ
ኣብ ባሕሪ ጥብርያዶስ ድግስካ ሓሪፍና

VERSE 4
ካብ እንጌራ ፎርኦን ፍቅርኻ ናፊቅና
ናይ ቦኤዝ ሕርሻ ንሕና ኣይንቀርምን
መናኻ ንዓጽድ እግዚኣብሄር መድህን',
      lyrics_transliteration = 'Abet niaኻ nismka alo misgana
Kem natka yelen egziabher zihagezena
Kemaኻ yelen kab widqet zetenseana
Abet timdhanka abana fesese

VERSE 1
Abzi abi gobo meda golgol kone
Bignbi zitehants’u biats’war ziteኸbu
Ketematat ahzab bimezmur feresu
Shemonte nifasat tihzom nisኻ

VERSE 2
Bahrn wiqyanosn eyu zelo qidmeኻ
Wisht’na aykealen qelalem kigebr
Nihager t’beb niaኻ egziabher
Bimts’nnaኻ hiywetna meliska

VERSE 3
Bit’um qalatka nebsna argieኻ
Nizna aykonen weys nishmeta
Tinsmrelka nemlኾ eyu goyta
Ab bahri t’bryados digska harifna

VERSE 4
Kab engera foron fiqrኻ nafiqna
Nay boez hirsha nihna aynqermn
Menaኻ niats’d egziabher medhn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'abiet-neaka-zemarit-merry-temelso-eritrean-orthodox-tewahdo-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ

VERSE 1
ኣብዚ ዓቢ ጎቦ ሜዳ ጎልጎል ኮነ
ብግንቢ ዝተሃንጹ ብኣጽዋር ዝተኸቡ
ከተማታት ኣህዛብ ብመዝሙር ፈረሱ
ሸሞንተ ንፋሳት ትሕዞም ንስኻ

CHORUS
ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ

VERSE 2
ባሕርን ውቅያኖስን እዩ ዘሎ ቅድሜኻ
ውሽጥና ኣይከኣለን ቀልዓለም ክገብር
ንሃገር ጥበብ ንዓኻ እግዚኣብሄር
ብምጽንንዓኻ ሕይወትና መሊስካ

CHORUS
ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ

VERSE 3
ብጥዑም ቃላትካ ነብስና ኣርጊእኻ
ንዝና ኣይኮነን ወይስ ንሽመታ
ትንስምረልካ ነምልኾ እዩ ጎይታ
ኣብ ባሕሪ ጥብርያዶስ ድግስካ ሓሪፍና

CHORUS
ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ

VERSE 4
ካብ እንጌራ ፎርኦን ፍቅርኻ ናፊቅና
ናይ ቦኤዝ ሕርሻ ንሕና ኣይንቀርምን
መናኻ ንዓጽድ እግዚኣብሄር መድህን

CHORUS
ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Abet niaኻ nismka alo misgana
Kem natka yelen egziabher zihagezena
Kemaኻ yelen kab widqet zetenseana
Abet timdhanka abana fesese

VERSE 1
Abzi abi gobo meda golgol kone
Bignbi zitehants’u biats’war ziteኸbu
Ketematat ahzab bimezmur feresu
Shemonte nifasat tihzom nisኻ

CHORUS
Abet niaኻ nismka alo misgana
Kem natka yelen egziabher zihagezena
Kemaኻ yelen kab widqet zetenseana
Abet timdhanka abana fesese

VERSE 2
Bahrn wiqyanosn eyu zelo qidmeኻ
Wisht’na aykealen qelalem kigebr
Nihager t’beb niaኻ egziabher
Bimts’nnaኻ hiywetna meliska

CHORUS
Abet niaኻ nismka alo misgana
Kem natka yelen egziabher zihagezena
Kemaኻ yelen kab widqet zetenseana
Abet timdhanka abana fesese

VERSE 3
Bit’um qalatka nebsna argieኻ
Nizna aykonen weys nishmeta
Tinsmrelka nemlኾ eyu goyta
Ab bahri t’bryados digska harifna

CHORUS
Abet niaኻ nismka alo misgana
Kem natka yelen egziabher zihagezena
Kemaኻ yelen kab widqet zetenseana
Abet timdhanka abana fesese

VERSE 4
Kab engera foron fiqrኻ nafiqna
Nay boez hirsha nihna aynqermn
Menaኻ niats’d egziabher medhn

CHORUS
Abet niaኻ nismka alo misgana
Kem natka yelen egziabher zihagezena
Kemaኻ yelen kab widqet zetenseana
Abet timdhanka abana fesese'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'abiet-neaka-zemarit-merry-temelso-eritrean-orthodox-tewahdo-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Above Everything (above-everything)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 1
We believe in their co-existence.
Above everything, I believe
and have faith in Your three person.
Above everything, I believe

VERSE 2
and have faith in Your three person Lord.
I seek the prayer
of the Mother of God.
Then I seek the prayer

VERSE 3
of the Mother of God.
You are who chose me from my mother''s womb
and birthed me through baptism.
Like the apple of an eye, who kept me.

VERSE 4
It is You that I worship.
It is You that I worship,
the Holy Trinity above everything.
I believe and have faith in Your three person Lord.

VERSE 5
Then I seek the prayer of the Mother of God.
In personhood, I say You are three
but one nature of God Almighty.
God the Father, God the Son, God the Holy Spirit.

VERSE 6
One God made the world and everything within it.
Above everything, I believe
and have faith in Your three personhood
that I seek the prayer

VERSE 7
of the Mother of God.
From the three persons, God the Son came down, the Word of God.
The Father has shown.
He took on the flesh that He created

VERSE 8
through the Virgin Mary
through the Virgin Mary. He is incarnated above everything.
I believe
and have faith in Your three person.

VERSE 9
Then I seek the prayer
of the Mother of God.
Because of His flesh, God died for mankind.
For He is divine, yet He healed the blind.

VERSE 10
In one divine will, the Son took my loss.
I am bought by His blood.
I am bought by His blood
and His work on the cross above everything.

VERSE 11
I believe and have faith in Your three person.
Then I seek the prayer
of the Mother of God.
I beseech Your mercy by her who bore You.

VERSE 12
Her pleading will be granted as true to stand on Your right side when You will come back.
Her prayer will always guide me on the right path. Amen.
Amen. Amen. Amen. Amen. Amen.
Amen. Amen. Amen.',
      lyrics_transliteration = 'In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 1
We believe in their co-existence.
Above everything, I believe
And have faith in Your three person.
Above everything, I believe

VERSE 2
And have faith in Your three person Lord.
I seek the prayer
Of the Mother of God.
Then I seek the prayer

VERSE 3
Of the Mother of God.
You are who chose me from my mother''s womb
And birthed me through baptism.
Like the apple of an eye, who kept me.

VERSE 4
It is You that I worship.
It is You that I worship,
The Holy Trinity above everything.
I believe and have faith in Your three person Lord.

VERSE 5
Then I seek the prayer of the Mother of God.
In personhood, I say You are three
But one nature of God Almighty.
God the Father, God the Son, God the Holy Spirit.

VERSE 6
One God made the world and everything within it.
Above everything, I believe
And have faith in Your three personhood
That I seek the prayer

VERSE 7
Of the Mother of God.
From the three persons, God the Son came down, the Word of God.
The Father has shown.
He took on the flesh that He created

VERSE 8
Through the Virgin Mary
Through the Virgin Mary. He is incarnated above everything.
I believe
And have faith in Your three person.

VERSE 9
Then I seek the prayer
Of the Mother of God.
Because of His flesh, God died for mankind.
For He is divine, yet He healed the blind.

VERSE 10
In one divine will, the Son took my loss.
I am bought by His blood.
I am bought by His blood
And His work on the cross above everything.

VERSE 11
I believe and have faith in Your three person.
Then I seek the prayer
Of the Mother of God.
I beseech Your mercy by her who bore You.

VERSE 12
Her pleading will be granted as true to stand on Your right side when You will come back.
Her prayer will always guide me on the right path. Amen.
Amen. Amen. Amen. Amen. Amen.
Amen. Amen. Amen.',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'above-everything'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 1
We believe in their co-existence.
Above everything, I believe
and have faith in Your three person.
Above everything, I believe

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 2
and have faith in Your three person Lord.
I seek the prayer
of the Mother of God.
Then I seek the prayer

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 3
of the Mother of God.
You are who chose me from my mother''s womb
and birthed me through baptism.
Like the apple of an eye, who kept me.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 4
It is You that I worship.
It is You that I worship,
the Holy Trinity above everything.
I believe and have faith in Your three person Lord.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 5
Then I seek the prayer of the Mother of God.
In personhood, I say You are three
but one nature of God Almighty.
God the Father, God the Son, God the Holy Spirit.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 6
One God made the world and everything within it.
Above everything, I believe
and have faith in Your three personhood
that I seek the prayer

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 7
of the Mother of God.
From the three persons, God the Son came down, the Word of God.
The Father has shown.
He took on the flesh that He created

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 8
through the Virgin Mary
through the Virgin Mary. He is incarnated above everything.
I believe
and have faith in Your three person.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 9
Then I seek the prayer
of the Mother of God.
Because of His flesh, God died for mankind.
For He is divine, yet He healed the blind.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 10
In one divine will, the Son took my loss.
I am bought by His blood.
I am bought by His blood
and His work on the cross above everything.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 11
I believe and have faith in Your three person.
Then I seek the prayer
of the Mother of God.
I beseech Your mercy by her who bore You.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 12
Her pleading will be granted as true to stand on Your right side when You will come back.
Her prayer will always guide me on the right path. Amen.
Amen. Amen. Amen. Amen. Amen.
Amen. Amen. Amen.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 1
We believe in their co-existence.
Above everything, I believe
And have faith in Your three person.
Above everything, I believe

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 2
And have faith in Your three person Lord.
I seek the prayer
Of the Mother of God.
Then I seek the prayer

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 3
Of the Mother of God.
You are who chose me from my mother''s womb
And birthed me through baptism.
Like the apple of an eye, who kept me.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 4
It is You that I worship.
It is You that I worship,
The Holy Trinity above everything.
I believe and have faith in Your three person Lord.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 5
Then I seek the prayer of the Mother of God.
In personhood, I say You are three
But one nature of God Almighty.
God the Father, God the Son, God the Holy Spirit.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 6
One God made the world and everything within it.
Above everything, I believe
And have faith in Your three personhood
That I seek the prayer

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 7
Of the Mother of God.
From the three persons, God the Son came down, the Word of God.
The Father has shown.
He took on the flesh that He created

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 8
Through the Virgin Mary
Through the Virgin Mary. He is incarnated above everything.
I believe
And have faith in Your three person.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 9
Then I seek the prayer
Of the Mother of God.
Because of His flesh, God died for mankind.
For He is divine, yet He healed the blind.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 10
In one divine will, the Son took my loss.
I am bought by His blood.
I am bought by His blood
And His work on the cross above everything.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 11
I believe and have faith in Your three person.
Then I seek the prayer
Of the Mother of God.
I beseech Your mercy by her who bore You.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 12
Her pleading will be granted as true to stand on Your right side when You will come back.
Her prayer will always guide me on the right path. Amen.
Amen. Amen. Amen. Amen. Amen.
Amen. Amen. Amen.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'above-everything', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: #aboy_mezimur_nay_nisiha_b_zemari_berehet_tikue#New_eritrean_orthodox_mezmur_aboy_2021_Bereket_Tikue (aboy-mezimur-nay-nisiha-b-zemari-berehet-tikue-new-eritrean-orthodox-mez)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ንዝተሰብረ መንፈስ ንዝተጣዕሰ ልቢ
ኣይትንዕቆን ኢኻ
ኣቦየ መጼ''ለኹ ናብ ርስቲ ቀደመይ
ካባኻ ተፈልያ ኣይጥዓማን ነብሰይ (2)

VERSE 1
ካብ ሕቅፎኻ ፈልዪ ናብ ዛሕሊ ናብ ግዳም
ቤተይ ዘሕደገኒ
ኣብ ቅድሚ ሰማይን ኣብ ቅድሜኻን ኣቦይ
ሓጢኣት ዘስርሓኒ

VERSE 2
ብጠባሪ ቃላት ሓጎስ መሰል ሓዘን
ብርሃን መሰል ጸላም
ብልጭልጭታ ዓለም ሓሳዊ ፍቅራ''ዪ
ኣዒንተይ ዘዕወረን …

VERSE 3
" ይፈልጦ''የ ልብኻ ለዋህ ኢኻ ኣመና ጎይታ''የ
እነኹ ተመሊሰ ሕቅፎኻ ናፊቆ''የ ኣቦየ
ንዝተሰብረ መንፈስ ንዝተጣዕሰ ልቢ
ኣይትንዕቆን ኢኻ

VERSE 4
ኣቦየ መጼ''ለኹ ናብ ርስቲ ቀደመይ
ካባኻ ተፈልያስ ኣይጥዓማን ነብሰይ
ትሕዞይ ነጋጊፈ ብዘይ ገለ ትርፊ እነኹ ንበይነይ
እቲ ዝኣመንክዎ ከይዱ ገዲፉኒ

VERSE 5
ምስ ኮንኩ ዘይብለይ
ውሉድካ ክብሃል ደጊም ኣይበቅዕን''የ
ኣጉሄዬ''የ ልብኻ …
ከም ሓደ ጉዝእካ ጎይታይ ቁጸረኒ

VERSE 6
ከገልግል ኣብ ቤትካ
" ይፈልጦ''የ ልብኻ ለዋህ ኢኻ ኣመና ጎይታ''የ
እነኹ ተመሊሰ ሕቅፎኻ ናፊቆ''የ ኣቦየ',
      lyrics_transliteration = 'Niztesebre menfes niztet’aese libi
Aytneqon iኻ
Aboye mets’e''leኹ nab risti qedemey
Kabaኻ tefelya ayt’aman nebsey (2)

VERSE 1
Kab hiqfoኻ felyi nab zahli nab gidam
Betey zehdegeni
Ab qidmi semayn ab qidmeኻn aboy
Hat’iat zesrhani

VERSE 2
Bit’ebari qalat hagos mesel hazen
Birhan mesel ts’elam
Bilch’lch’ta alem hasawi fiqra''yi
Aintey zeeweren …

VERSE 3
" yifelt’o''ye libኻ lewah iኻ amena goyta''ye
Eneኹ temelise hiqfoኻ nafiqo''ye aboye
Niztesebre menfes niztet’aese libi
Aytneqon iኻ

VERSE 4
Aboye mets’e''leኹ nab risti qedemey
Kabaኻ tefelyas ayt’aman nebsey
Tihzoy negagife bizey gele tirfi eneኹ nibeyney
Eti ziamenkwo keydu gedifuni

VERSE 5
Mis konku zeybley
Wiludka kibhal degim aybeqen''ye
Aguheye''ye libኻ …
Kem hade guzeka goytay quts’ereni

VERSE 6
Kegelgl ab betka
" yifelt’o''ye libኻ lewah iኻ amena goyta''ye
Eneኹ temelise hiqfoኻ nafiqo''ye aboye',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'aboy-mezimur-nay-nisiha-b-zemari-berehet-tikue-new-eritrean-orthodox-mez'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ንዝተሰብረ መንፈስ ንዝተጣዕሰ ልቢ
ኣይትንዕቆን ኢኻ
ኣቦየ መጼ''ለኹ ናብ ርስቲ ቀደመይ
ካባኻ ተፈልያ ኣይጥዓማን ነብሰይ (2)

VERSE 1
ካብ ሕቅፎኻ ፈልዪ ናብ ዛሕሊ ናብ ግዳም
ቤተይ ዘሕደገኒ
ኣብ ቅድሚ ሰማይን ኣብ ቅድሜኻን ኣቦይ
ሓጢኣት ዘስርሓኒ

CHORUS
ንዝተሰብረ መንፈስ ንዝተጣዕሰ ልቢ
ኣይትንዕቆን ኢኻ
ኣቦየ መጼ''ለኹ ናብ ርስቲ ቀደመይ
ካባኻ ተፈልያ ኣይጥዓማን ነብሰይ (2)

VERSE 2
ብጠባሪ ቃላት ሓጎስ መሰል ሓዘን
ብርሃን መሰል ጸላም
ብልጭልጭታ ዓለም ሓሳዊ ፍቅራ''ዪ
ኣዒንተይ ዘዕወረን …

CHORUS
ንዝተሰብረ መንፈስ ንዝተጣዕሰ ልቢ
ኣይትንዕቆን ኢኻ
ኣቦየ መጼ''ለኹ ናብ ርስቲ ቀደመይ
ካባኻ ተፈልያ ኣይጥዓማን ነብሰይ (2)

VERSE 3
" ይፈልጦ''የ ልብኻ ለዋህ ኢኻ ኣመና ጎይታ''የ
እነኹ ተመሊሰ ሕቅፎኻ ናፊቆ''የ ኣቦየ
ንዝተሰብረ መንፈስ ንዝተጣዕሰ ልቢ
ኣይትንዕቆን ኢኻ

CHORUS
ንዝተሰብረ መንፈስ ንዝተጣዕሰ ልቢ
ኣይትንዕቆን ኢኻ
ኣቦየ መጼ''ለኹ ናብ ርስቲ ቀደመይ
ካባኻ ተፈልያ ኣይጥዓማን ነብሰይ (2)

VERSE 4
ኣቦየ መጼ''ለኹ ናብ ርስቲ ቀደመይ
ካባኻ ተፈልያስ ኣይጥዓማን ነብሰይ
ትሕዞይ ነጋጊፈ ብዘይ ገለ ትርፊ እነኹ ንበይነይ
እቲ ዝኣመንክዎ ከይዱ ገዲፉኒ

CHORUS
ንዝተሰብረ መንፈስ ንዝተጣዕሰ ልቢ
ኣይትንዕቆን ኢኻ
ኣቦየ መጼ''ለኹ ናብ ርስቲ ቀደመይ
ካባኻ ተፈልያ ኣይጥዓማን ነብሰይ (2)

VERSE 5
ምስ ኮንኩ ዘይብለይ
ውሉድካ ክብሃል ደጊም ኣይበቅዕን''የ
ኣጉሄዬ''የ ልብኻ …
ከም ሓደ ጉዝእካ ጎይታይ ቁጸረኒ

CHORUS
ንዝተሰብረ መንፈስ ንዝተጣዕሰ ልቢ
ኣይትንዕቆን ኢኻ
ኣቦየ መጼ''ለኹ ናብ ርስቲ ቀደመይ
ካባኻ ተፈልያ ኣይጥዓማን ነብሰይ (2)

VERSE 6
ከገልግል ኣብ ቤትካ
" ይፈልጦ''የ ልብኻ ለዋህ ኢኻ ኣመና ጎይታ''የ
እነኹ ተመሊሰ ሕቅፎኻ ናፊቆ''የ ኣቦየ

CHORUS
ንዝተሰብረ መንፈስ ንዝተጣዕሰ ልቢ
ኣይትንዕቆን ኢኻ
ኣቦየ መጼ''ለኹ ናብ ርስቲ ቀደመይ
ካባኻ ተፈልያ ኣይጥዓማን ነብሰይ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Niztesebre menfes niztet’aese libi
Aytneqon iኻ
Aboye mets’e''leኹ nab risti qedemey
Kabaኻ tefelya ayt’aman nebsey (2)

VERSE 1
Kab hiqfoኻ felyi nab zahli nab gidam
Betey zehdegeni
Ab qidmi semayn ab qidmeኻn aboy
Hat’iat zesrhani

CHORUS
Niztesebre menfes niztet’aese libi
Aytneqon iኻ
Aboye mets’e''leኹ nab risti qedemey
Kabaኻ tefelya ayt’aman nebsey (2)

VERSE 2
Bit’ebari qalat hagos mesel hazen
Birhan mesel ts’elam
Bilch’lch’ta alem hasawi fiqra''yi
Aintey zeeweren …

CHORUS
Niztesebre menfes niztet’aese libi
Aytneqon iኻ
Aboye mets’e''leኹ nab risti qedemey
Kabaኻ tefelya ayt’aman nebsey (2)

VERSE 3
" yifelt’o''ye libኻ lewah iኻ amena goyta''ye
Eneኹ temelise hiqfoኻ nafiqo''ye aboye
Niztesebre menfes niztet’aese libi
Aytneqon iኻ

CHORUS
Niztesebre menfes niztet’aese libi
Aytneqon iኻ
Aboye mets’e''leኹ nab risti qedemey
Kabaኻ tefelya ayt’aman nebsey (2)

VERSE 4
Aboye mets’e''leኹ nab risti qedemey
Kabaኻ tefelyas ayt’aman nebsey
Tihzoy negagife bizey gele tirfi eneኹ nibeyney
Eti ziamenkwo keydu gedifuni

CHORUS
Niztesebre menfes niztet’aese libi
Aytneqon iኻ
Aboye mets’e''leኹ nab risti qedemey
Kabaኻ tefelya ayt’aman nebsey (2)

VERSE 5
Mis konku zeybley
Wiludka kibhal degim aybeqen''ye
Aguheye''ye libኻ …
Kem hade guzeka goytay quts’ereni

CHORUS
Niztesebre menfes niztet’aese libi
Aytneqon iኻ
Aboye mets’e''leኹ nab risti qedemey
Kabaኻ tefelya ayt’aman nebsey (2)

VERSE 6
Kegelgl ab betka
" yifelt’o''ye libኻ lewah iኻ amena goyta''ye
Eneኹ temelise hiqfoኻ nafiqo''ye aboye

CHORUS
Niztesebre menfes niztet’aese libi
Aytneqon iኻ
Aboye mets’e''leኹ nab risti qedemey
Kabaኻ tefelya ayt’aman nebsey (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'aboy-mezimur-nay-nisiha-b-zemari-berehet-tikue-new-eritrean-orthodox-mez', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Absera Gebriel (absera-gebriel)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አብሰራ ገብርኤል ለማርያም ወይቤላ ወይቤላ ትወልዲ ወልደ

VERSE 1
ሚካኤል መልአክ በክነፍ ሕፁራ
መንጦላዕት ደመና ሰወራ
ንፅሕት በድንግልና
አልባሲ ሙስና ተወልደ ወልድ እምኔሀ

VERSE 2
ገብርኤል ማርያምን አበሰራት አበሰራት
ወንድ ልጅን ተወልጃለሽ አላት

VERSE 3
ሚካኤል መልአክ በክንፉ ከለላት
የሰማይ መጋረጃውን ሸፈናት
ንፅሕት ናትና በድንግልና /2/
ጥፋት የለባትምና ወንድ ልጅን ወልዳልናለችና',
      lyrics_transliteration = 'Absera Gebriel leMaryam weybela weybela tiweldi welde

VERSE 1
Mikael melak beknef hits’ura
Ment’olaet demena sewera
Nits’ht bedingilina
Albasi musna tewelde Weld emnehe

VERSE 2
Gebriel Maryamn abeserat abeserat
Wend lijn teweljalesh alat

VERSE 3
Mikael melak beknfu kelelat
Yesemay megarejawn shefenat
Nits’ht natna bedingilina (2)
T’fat yelebatmna wend lijn weldalnalechna',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'absera-gebriel'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አብሰራ ገብርኤል ለማርያም ወይቤላ ወይቤላ ትወልዲ ወልደ

VERSE 1
ሚካኤል መልአክ በክነፍ ሕፁራ
መንጦላዕት ደመና ሰወራ
ንፅሕት በድንግልና
አልባሲ ሙስና ተወልደ ወልድ እምኔሀ

CHORUS
አብሰራ ገብርኤል ለማርያም ወይቤላ ወይቤላ ትወልዲ ወልደ

VERSE 2
ገብርኤል ማርያምን አበሰራት አበሰራት
ወንድ ልጅን ተወልጃለሽ አላት

CHORUS
አብሰራ ገብርኤል ለማርያም ወይቤላ ወይቤላ ትወልዲ ወልደ

VERSE 3
ሚካኤል መልአክ በክንፉ ከለላት
የሰማይ መጋረጃውን ሸፈናት
ንፅሕት ናትና በድንግልና /2/
ጥፋት የለባትምና ወንድ ልጅን ወልዳልናለችና

CHORUS
አብሰራ ገብርኤል ለማርያም ወይቤላ ወይቤላ ትወልዲ ወልደ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Absera Gebriel leMaryam weybela weybela tiweldi welde

VERSE 1
Mikael melak beknef hits’ura
Ment’olaet demena sewera
Nits’ht bedingilina
Albasi musna tewelde Weld emnehe

CHORUS
Absera Gebriel leMaryam weybela weybela tiweldi welde

VERSE 2
Gebriel Maryamn abeserat abeserat
Wend lijn teweljalesh alat

CHORUS
Absera Gebriel leMaryam weybela weybela tiweldi welde

VERSE 3
Mikael melak beknfu kelelat
Yesemay megarejawn shefenat
Nits’ht natna bedingilina (2)
T’fat yelebatmna wend lijn weldalnalechna

CHORUS
Absera Gebriel leMaryam weybela weybela tiweldi welde'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'absera-gebriel', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: AbuneAregawi Zemarit Betselot Asmare (abunearegawi-zemarit-betselot-asmare)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አቡነ አረጋዊ ፃድቁ ዘንዶውን ያለመደ
ክርስቶስን በእምነት ከልቡ የወደደ
የኢትዮጵያን ተራሮች በወንጌል የቀደሰ
ቡሩክ ታላቅ አባት ነው ፅድቅን የወረሰ

VERSE 1
ከእናቱ ከአባቱ ወንጌል በልጦ
እራሱን አካሉን ለአምላክ ሰጦ
ከቀየው ከቤቱ ተሰደደ
ከራሱ አብልጦ አምላኩን ወደደ

VERSE 2
ቅዱስ ቃል አብርቶ በኢትዮጵያ
ገዳምን የሰራ ሆኖ አርአያ
ትንሽ ሳለገና ብዙ አውቆ
ተባለ አረጋዊ በሁሉም ተደንቆ

VERSE 3
ምድርን የናቀ ሰማያዊ
የወንጌል አርበኛ ነው መራዊ
የሚበልጥን ክብር ተሸክሞ
ደብረዳሞ ወጣ በዘንድ ላይ ቆሞ

VERSE 4
የለኮሰው ወንጌል ዛሬም በርቶ
በልባችን ሰርጿል ደምቆ ጎልቶ
የብዙሃን መሪ የቆብ አባት
ስለፅድቅ የመራን ወደህይወት መንገድ

VERSE 5
ምሳሌ የሚሆን ባህታዊ
በምድር የሚኖር ሰማያዊ
ልቡ የተሞላ በእግዚአብሔር ቃል
ፀሎቱ በረከት ለኛ ያሰጠናል',
      lyrics_transliteration = 'Abune aregawi ts’adqu zendown yalemede
Kristosn beemnet kelbu yewedede
Yeityop’yan teraroch bewengel yeqedese
Buruk talaq abat new ts’dqn yewerese

VERSE 1
Keenatu keabatu wengel belt’o
Erasun akalun leamlak set’o
Keqeyew kebetu tesedede
Kerasu ablt’o amlakun wedede

VERSE 2
Kidus qal abrto beityop’ya
Gedamn yesera hono araya
Tinsh salegena bizu awqo
Tebale aregawi behulum tedenqo

VERSE 3
Midrn yenaqe semayawi
Yewengel arbegna new merawi
Yemibelt’n kibir teshekmo
Debredamo wet’a bezend lay qomo

VERSE 4
Yelekosew wengel zarem berto
Belbachn serts’wal demqo golto
Yebzuhan meri yeqob abat
Silets’dq yemeran wedehywet menged

VERSE 5
Misale yemihon bahtawi
Bemdr yeminor semayawi
Libu yetemola beEgziabher qal
Ts’elotu bereket legna yaset’enal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'abunearegawi-zemarit-betselot-asmare'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አቡነ አረጋዊ ፃድቁ ዘንዶውን ያለመደ
ክርስቶስን በእምነት ከልቡ የወደደ
የኢትዮጵያን ተራሮች በወንጌል የቀደሰ
ቡሩክ ታላቅ አባት ነው ፅድቅን የወረሰ

VERSE 1
ከእናቱ ከአባቱ ወንጌል በልጦ
እራሱን አካሉን ለአምላክ ሰጦ
ከቀየው ከቤቱ ተሰደደ
ከራሱ አብልጦ አምላኩን ወደደ

CHORUS
አቡነ አረጋዊ ፃድቁ ዘንዶውን ያለመደ
ክርስቶስን በእምነት ከልቡ የወደደ
የኢትዮጵያን ተራሮች በወንጌል የቀደሰ
ቡሩክ ታላቅ አባት ነው ፅድቅን የወረሰ

VERSE 2
ቅዱስ ቃል አብርቶ በኢትዮጵያ
ገዳምን የሰራ ሆኖ አርአያ
ትንሽ ሳለገና ብዙ አውቆ
ተባለ አረጋዊ በሁሉም ተደንቆ

CHORUS
አቡነ አረጋዊ ፃድቁ ዘንዶውን ያለመደ
ክርስቶስን በእምነት ከልቡ የወደደ
የኢትዮጵያን ተራሮች በወንጌል የቀደሰ
ቡሩክ ታላቅ አባት ነው ፅድቅን የወረሰ

VERSE 3
ምድርን የናቀ ሰማያዊ
የወንጌል አርበኛ ነው መራዊ
የሚበልጥን ክብር ተሸክሞ
ደብረዳሞ ወጣ በዘንድ ላይ ቆሞ

CHORUS
አቡነ አረጋዊ ፃድቁ ዘንዶውን ያለመደ
ክርስቶስን በእምነት ከልቡ የወደደ
የኢትዮጵያን ተራሮች በወንጌል የቀደሰ
ቡሩክ ታላቅ አባት ነው ፅድቅን የወረሰ

VERSE 4
የለኮሰው ወንጌል ዛሬም በርቶ
በልባችን ሰርጿል ደምቆ ጎልቶ
የብዙሃን መሪ የቆብ አባት
ስለፅድቅ የመራን ወደህይወት መንገድ

CHORUS
አቡነ አረጋዊ ፃድቁ ዘንዶውን ያለመደ
ክርስቶስን በእምነት ከልቡ የወደደ
የኢትዮጵያን ተራሮች በወንጌል የቀደሰ
ቡሩክ ታላቅ አባት ነው ፅድቅን የወረሰ

VERSE 5
ምሳሌ የሚሆን ባህታዊ
በምድር የሚኖር ሰማያዊ
ልቡ የተሞላ በእግዚአብሔር ቃል
ፀሎቱ በረከት ለኛ ያሰጠናል

CHORUS
አቡነ አረጋዊ ፃድቁ ዘንዶውን ያለመደ
ክርስቶስን በእምነት ከልቡ የወደደ
የኢትዮጵያን ተራሮች በወንጌል የቀደሰ
ቡሩክ ታላቅ አባት ነው ፅድቅን የወረሰ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Abune aregawi ts’adqu zendown yalemede
Kristosn beemnet kelbu yewedede
Yeityop’yan teraroch bewengel yeqedese
Buruk talaq abat new ts’dqn yewerese

VERSE 1
Keenatu keabatu wengel belt’o
Erasun akalun leamlak set’o
Keqeyew kebetu tesedede
Kerasu ablt’o amlakun wedede

CHORUS
Abune aregawi ts’adqu zendown yalemede
Kristosn beemnet kelbu yewedede
Yeityop’yan teraroch bewengel yeqedese
Buruk talaq abat new ts’dqn yewerese

VERSE 2
Kidus qal abrto beityop’ya
Gedamn yesera hono araya
Tinsh salegena bizu awqo
Tebale aregawi behulum tedenqo

CHORUS
Abune aregawi ts’adqu zendown yalemede
Kristosn beemnet kelbu yewedede
Yeityop’yan teraroch bewengel yeqedese
Buruk talaq abat new ts’dqn yewerese

VERSE 3
Midrn yenaqe semayawi
Yewengel arbegna new merawi
Yemibelt’n kibir teshekmo
Debredamo wet’a bezend lay qomo

CHORUS
Abune aregawi ts’adqu zendown yalemede
Kristosn beemnet kelbu yewedede
Yeityop’yan teraroch bewengel yeqedese
Buruk talaq abat new ts’dqn yewerese

VERSE 4
Yelekosew wengel zarem berto
Belbachn serts’wal demqo golto
Yebzuhan meri yeqob abat
Silets’dq yemeran wedehywet menged

CHORUS
Abune aregawi ts’adqu zendown yalemede
Kristosn beemnet kelbu yewedede
Yeityop’yan teraroch bewengel yeqedese
Buruk talaq abat new ts’dqn yewerese

VERSE 5
Misale yemihon bahtawi
Bemdr yeminor semayawi
Libu yetemola beEgziabher qal
Ts’elotu bereket legna yaset’enal

CHORUS
Abune aregawi ts’adqu zendown yalemede
Kristosn beemnet kelbu yewedede
Yeityop’yan teraroch bewengel yeqedese
Buruk talaq abat new ts’dqn yewerese'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'abunearegawi-zemarit-betselot-asmare', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: According To Your Mercy (according-to-your-mercy)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 1
According to your mercy Oh God
and not according to our sin
At that time the Word who made the skies, He speaks, and the earth.
May that time we be seeing the new light.

VERSE 2
The Father crowns the Son with all might.
At that time, according to your word our God, and not according to our sin.
According to your word our God, and not according to our sin.
According to your word our God, and not according to our sin.

VERSE 3
At that time the books shall be laid bare.
All revealed, not hidden in any place.
At that time all flesh in silent fright, standing all in trembling at the sight.
According to Your mercy, our God, and not according to our sin.

VERSE 4
According to Your mercy, our God, and not according to our sin.
According to Your mercy, our God, and not according to our sin.
At that time no high, no low, rank remains.
All as one, no race or richness sustains.

VERSE 5
At that time no man be judged but for his deeds done in life.
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.

VERSE 6
At the time, the righteous stand on the right.
The sinners on the left with loud cries.
At the time, Oh Lord, do not forsake us, for we are Your creation, Jesus.
According to your mercy, our God, and not according to our sin.

VERSE 7
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.',
      lyrics_transliteration = 'According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 1
According to your mercy Oh God
And not according to our sin
At that time the Word who made the skies, He speaks, and the earth.
May that time we be seeing the new light.

VERSE 2
The Father crowns the Son with all might.
At that time, according to your word our God, and not according to our sin.
According to your word our God, and not according to our sin.
According to your word our God, and not according to our sin.

VERSE 3
At that time the books shall be laid bare.
All revealed, not hidden in any place.
At that time all flesh in silent fright, standing all in trembling at the sight.
According to Your mercy, our God, and not according to our sin.

VERSE 4
According to Your mercy, our God, and not according to our sin.
According to Your mercy, our God, and not according to our sin.
At that time no high, no low, rank remains.
All as one, no race or richness sustains.

VERSE 5
At that time no man be judged but for his deeds done in life.
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.

VERSE 6
At the time, the righteous stand on the right.
The sinners on the left with loud cries.
At the time, Oh Lord, do not forsake us, for we are Your creation, Jesus.
According to your mercy, our God, and not according to our sin.

VERSE 7
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'according-to-your-mercy'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 1
According to your mercy Oh God
and not according to our sin
At that time the Word who made the skies, He speaks, and the earth.
May that time we be seeing the new light.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 2
The Father crowns the Son with all might.
At that time, according to your word our God, and not according to our sin.
According to your word our God, and not according to our sin.
According to your word our God, and not according to our sin.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 3
At that time the books shall be laid bare.
All revealed, not hidden in any place.
At that time all flesh in silent fright, standing all in trembling at the sight.
According to Your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 4
According to Your mercy, our God, and not according to our sin.
According to Your mercy, our God, and not according to our sin.
At that time no high, no low, rank remains.
All as one, no race or richness sustains.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 5
At that time no man be judged but for his deeds done in life.
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 6
At the time, the righteous stand on the right.
The sinners on the left with loud cries.
At the time, Oh Lord, do not forsake us, for we are Your creation, Jesus.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 7
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 1
According to your mercy Oh God
And not according to our sin
At that time the Word who made the skies, He speaks, and the earth.
May that time we be seeing the new light.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 2
The Father crowns the Son with all might.
At that time, according to your word our God, and not according to our sin.
According to your word our God, and not according to our sin.
According to your word our God, and not according to our sin.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 3
At that time the books shall be laid bare.
All revealed, not hidden in any place.
At that time all flesh in silent fright, standing all in trembling at the sight.
According to Your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 4
According to Your mercy, our God, and not according to our sin.
According to Your mercy, our God, and not according to our sin.
At that time no high, no low, rank remains.
All as one, no race or richness sustains.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 5
At that time no man be judged but for his deeds done in life.
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 6
At the time, the righteous stand on the right.
The sinners on the left with loud cries.
At the time, Oh Lord, do not forsake us, for we are Your creation, Jesus.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 7
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'according-to-your-mercy', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Adanegn Geta (adanegn-geta)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በዕንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
እንግዲህ ላንተ ምስክር ሆኛለሁ
ሥራህን ለዓለም ሁሌም እነግራለሁ (፪)

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
ደጅህ ወድቄ መኖር ተሽሎኛል

VERSE 3
የሀዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ ዕድሜ ጨመርክልኝ
ከአልጋዬ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህረትህ (፪)

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ሕይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብር መዝገብ በእጅህ ተፅፋለች

VERSE 5
የሐሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሠንሠለቱ (፪)

VERSE 6
በሐማ መስቀል መርዶኪዮስ የለም
የናቡቴ ደም በከንቱ አልቀረም
የእውነት ዳኛ ጌታ ስትመጣ
የሐሰቱ ሰው ግፈኛው ተቀጣ

VERSE 7
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

VERSE 8
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ
አዝ……………..
ጨለማን አላውቅም በጉዞዬ፤ በሕይወቴ ሁሉ ነህ መሪዬ፤
ተጓዝኩኝ ሌቱን በብርሃን፤ በአንተ አየሁኝ መሻገርን፤/2/

VERSE 9
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….
ማቀርቀሬን ሰበርክ አልኩኝ ቀና፤ በርትቼ ተራመድኩ እንደገና፤
ቃልህ ኃይሌ የሚያጸናኝ፤ በአለት ላይም የተከልከኝ፤/2/

VERSE 10
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….
እንባዬ ታበሰ ስታጽናናኝ፤ ድል የሆነው ሆኖዋል ስትረዳኝ፤
በጠላቴ ፊት ሞገስ ሆንከኝ፤ ለባሪያህም ድል ሰጠኸኝ፤/2/

VERSE 11
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ፤
አዝ…………….
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/',
      lyrics_transliteration = 'Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 1
Yalfal yalalkut alfolgn ayche
Beenba tat’ebkugn kedqdq wet’che
Engdih lante miskr hognalehu
Sirahn lealem hulem enegralehu (2)

VERSE 2
Kindh birtu new dekaman lemerdat
Tawqbetaleh yezalen mabertat
Aynen kesewoch maraqe t’eqmognal
Dejh wedqe menor teshlognal

VERSE 3
Yehezenen maq awlqeh t’alklgn
Moten sit’ebq edme ch’emerklgn
Kealgaye lay anesugn ejochh
Tefewshalehu zare bemhreth (2)

VERSE 4
Qalh ts’nu new dagm yit’egnal
Gobat’a aqnto shbawn tertrwal
Hiywete bante zare adis honalech
Bekbr mezgeb beejh tets’falech

VERSE 5
Yehesetn fird Geta qelebeskew
Tets’nantwal bante ya yetegefa sew
Yegfn ts’wa araqkew kefitu
Beeju lay yelem zare senseletu (2)

VERSE 6
Behema mesqel merdokiyos yelem
Yenabute dem bekentu alqerem
Yeewnet dagna Geta sitmet’a
Yehesetu sew gifegnaw teqet’a

VERSE 7
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)
Shekm lekebedew marefiya neh; ejg yeqelele qenber yaleh;
Fiqrh new yemiyasemaragn; belemlem mesk yaqomegn; (2)

VERSE 8
Cher amlak yeewnet dagna; Amanuel lene metamegna
Ch’eleman alawqm beguzoye; behywete hulu neh meriye;
Tegwazkugn letun bebrhan; beante ayehugn meshagern; (2)

VERSE 9
Cher amlak yeewnet dagna Amanuel lene metamegna
Maqerqeren seberk alkugn qena; bertche teramedku endegena;
Qalh hayle yemiyats’enagn; bealet laym yetekelkegn; (2)

VERSE 10
Cher amlak yeewnet dagna Amanuel lene metamegna
Enbaye tabese sitats’nanagn; dil yehonew honowal sitredagn;
Bet’elate fit moges honkegn; lebariyahm dil set’eኸgn; (2)

VERSE 11
Cher amlak yeewnet dagna; Amanuel lene metamegna;
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'adanegn-geta'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በዕንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
እንግዲህ ላንተ ምስክር ሆኛለሁ
ሥራህን ለዓለም ሁሌም እነግራለሁ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
ደጅህ ወድቄ መኖር ተሽሎኛል

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 3
የሀዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ ዕድሜ ጨመርክልኝ
ከአልጋዬ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህረትህ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ሕይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብር መዝገብ በእጅህ ተፅፋለች

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 5
የሐሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሠንሠለቱ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 6
በሐማ መስቀል መርዶኪዮስ የለም
የናቡቴ ደም በከንቱ አልቀረም
የእውነት ዳኛ ጌታ ስትመጣ
የሐሰቱ ሰው ግፈኛው ተቀጣ

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 7
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 8
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ
አዝ……………..
ጨለማን አላውቅም በጉዞዬ፤ በሕይወቴ ሁሉ ነህ መሪዬ፤
ተጓዝኩኝ ሌቱን በብርሃን፤ በአንተ አየሁኝ መሻገርን፤/2/

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 9
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….
ማቀርቀሬን ሰበርክ አልኩኝ ቀና፤ በርትቼ ተራመድኩ እንደገና፤
ቃልህ ኃይሌ የሚያጸናኝ፤ በአለት ላይም የተከልከኝ፤/2/

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 10
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….
እንባዬ ታበሰ ስታጽናናኝ፤ ድል የሆነው ሆኖዋል ስትረዳኝ፤
በጠላቴ ፊት ሞገስ ሆንከኝ፤ ለባሪያህም ድል ሰጠኸኝ፤/2/

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 11
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ፤
አዝ…………….
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 1
Yalfal yalalkut alfolgn ayche
Beenba tat’ebkugn kedqdq wet’che
Engdih lante miskr hognalehu
Sirahn lealem hulem enegralehu (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 2
Kindh birtu new dekaman lemerdat
Tawqbetaleh yezalen mabertat
Aynen kesewoch maraqe t’eqmognal
Dejh wedqe menor teshlognal

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 3
Yehezenen maq awlqeh t’alklgn
Moten sit’ebq edme ch’emerklgn
Kealgaye lay anesugn ejochh
Tefewshalehu zare bemhreth (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 4
Qalh ts’nu new dagm yit’egnal
Gobat’a aqnto shbawn tertrwal
Hiywete bante zare adis honalech
Bekbr mezgeb beejh tets’falech

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 5
Yehesetn fird Geta qelebeskew
Tets’nantwal bante ya yetegefa sew
Yegfn ts’wa araqkew kefitu
Beeju lay yelem zare senseletu (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 6
Behema mesqel merdokiyos yelem
Yenabute dem bekentu alqerem
Yeewnet dagna Geta sitmet’a
Yehesetu sew gifegnaw teqet’a

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 7
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)
Shekm lekebedew marefiya neh; ejg yeqelele qenber yaleh;
Fiqrh new yemiyasemaragn; belemlem mesk yaqomegn; (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 8
Cher amlak yeewnet dagna; Amanuel lene metamegna
CHORUS
Ch’eleman alawqm beguzoye; behywete hulu neh meriye;
Tegwazkugn letun bebrhan; beante ayehugn meshagern; (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 9
Cher amlak yeewnet dagna Amanuel lene metamegna
CHORUS
Maqerqeren seberk alkugn qena; bertche teramedku endegena;
Qalh hayle yemiyats’enagn; bealet laym yetekelkegn; (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 10
Cher amlak yeewnet dagna Amanuel lene metamegna
CHORUS
Enbaye tabese sitats’nanagn; dil yehonew honowal sitredagn;
Bet’elate fit moges honkegn; lebariyahm dil set’eኸgn; (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 11
Cher amlak yeewnet dagna; Amanuel lene metamegna;
CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'adanegn-geta', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Adanegn Geta Ena Emebete Yeamilak Enat (adanegn-geta-ena-emebete-yeamilak-enat)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በዕንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
እንግዲህ ላንተ ምስክር ሆኛለሁ
ሥራህን ለዓለም ሁሌም እነግራለሁ (፪)

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
ደጅህ ወድቄ መኖር ተሽሎኛል

VERSE 3
የሀዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ ዕድሜ ጨመርክልኝ
ከአልጋዬ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህረትህ (፪)

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ሕይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብር መዝገብ በእጅህ ተፅፋለች

VERSE 5
የሐሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሠንሠለቱ (፪)

VERSE 6
በሐማ መስቀል መርዶኪዮስ የለም
የናቡቴ ደም በከንቱ አልቀረም
የእውነት ዳኛ ጌታ ስትመጣ
የሐሰቱ ሰው ግፈኛው ተቀጣ',
      lyrics_transliteration = 'Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 1
Yalfal yalalkut alfolgn ayche
Beenba tat’ebkugn kedqdq wet’che
Engdih lante miskr hognalehu
Sirahn lealem hulem enegralehu (2)

VERSE 2
Kindh birtu new dekaman lemerdat
Tawqbetaleh yezalen mabertat
Aynen kesewoch maraqe t’eqmognal
Dejh wedqe menor teshlognal

VERSE 3
Yehezenen maq awlqeh t’alklgn
Moten sit’ebq edme ch’emerklgn
Kealgaye lay anesugn ejochh
Tefewshalehu zare bemhreth (2)

VERSE 4
Qalh ts’nu new dagm yit’egnal
Gobat’a aqnto shbawn tertrwal
Hiywete bante zare adis honalech
Bekbr mezgeb beejh tets’falech

VERSE 5
Yehesetn fird Geta qelebeskew
Tets’nantwal bante ya yetegefa sew
Yegfn ts’wa araqkew kefitu
Beeju lay yelem zare senseletu (2)

VERSE 6
Behema mesqel merdokiyos yelem
Yenabute dem bekentu alqerem
Yeewnet dagna Geta sitmet’a
Yehesetu sew gifegnaw teqet’a',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'adanegn-geta-ena-emebete-yeamilak-enat'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በዕንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
እንግዲህ ላንተ ምስክር ሆኛለሁ
ሥራህን ለዓለም ሁሌም እነግራለሁ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
ደጅህ ወድቄ መኖር ተሽሎኛል

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 3
የሀዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ ዕድሜ ጨመርክልኝ
ከአልጋዬ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህረትህ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ሕይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብር መዝገብ በእጅህ ተፅፋለች

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 5
የሐሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሠንሠለቱ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 6
በሐማ መስቀል መርዶኪዮስ የለም
የናቡቴ ደም በከንቱ አልቀረም
የእውነት ዳኛ ጌታ ስትመጣ
የሐሰቱ ሰው ግፈኛው ተቀጣ

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 1
Yalfal yalalkut alfolgn ayche
Beenba tat’ebkugn kedqdq wet’che
Engdih lante miskr hognalehu
Sirahn lealem hulem enegralehu (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 2
Kindh birtu new dekaman lemerdat
Tawqbetaleh yezalen mabertat
Aynen kesewoch maraqe t’eqmognal
Dejh wedqe menor teshlognal

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 3
Yehezenen maq awlqeh t’alklgn
Moten sit’ebq edme ch’emerklgn
Kealgaye lay anesugn ejochh
Tefewshalehu zare bemhreth (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 4
Qalh ts’nu new dagm yit’egnal
Gobat’a aqnto shbawn tertrwal
Hiywete bante zare adis honalech
Bekbr mezgeb beejh tets’falech

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 5
Yehesetn fird Geta qelebeskew
Tets’nantwal bante ya yetegefa sew
Yegfn ts’wa araqkew kefitu
Beeju lay yelem zare senseletu (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 6
Behema mesqel merdokiyos yelem
Yenabute dem bekentu alqerem
Yeewnet dagna Geta sitmet’a
Yehesetu sew gifegnaw teqet’a

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'adanegn-geta-ena-emebete-yeamilak-enat', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Adanegn Geta Kibire New (adanegn-geta-kibire-new)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በዕንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
እንግዲህ ላንተ ምስክር ሆኛለሁ
ሥራህን ለዓለም ሁሌም እነግራለሁ (፪)

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
ደጅህ ወድቄ መኖር ተሽሎኛል

VERSE 3
የሀዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ ዕድሜ ጨመርክልኝ
ከአልጋዬ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህረትህ (፪)

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ሕይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብር መዝገብ በእጅህ ተፅፋለች

VERSE 5
የሐሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሠንሠለቱ (፪)

VERSE 6
በሐማ መስቀል መርዶኪዮስ የለም
የናቡቴ ደም በከንቱ አልቀረም
የእውነት ዳኛ ጌታ ስትመጣ
የሐሰቱ ሰው ግፈኛው ተቀጣ',
      lyrics_transliteration = 'Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 1
Yalfal yalalkut alfolgn ayche
Beenba tat’ebkugn kedqdq wet’che
Engdih lante miskr hognalehu
Sirahn lealem hulem enegralehu (2)

VERSE 2
Kindh birtu new dekaman lemerdat
Tawqbetaleh yezalen mabertat
Aynen kesewoch maraqe t’eqmognal
Dejh wedqe menor teshlognal

VERSE 3
Yehezenen maq awlqeh t’alklgn
Moten sit’ebq edme ch’emerklgn
Kealgaye lay anesugn ejochh
Tefewshalehu zare bemhreth (2)

VERSE 4
Qalh ts’nu new dagm yit’egnal
Gobat’a aqnto shbawn tertrwal
Hiywete bante zare adis honalech
Bekbr mezgeb beejh tets’falech

VERSE 5
Yehesetn fird Geta qelebeskew
Tets’nantwal bante ya yetegefa sew
Yegfn ts’wa araqkew kefitu
Beeju lay yelem zare senseletu (2)

VERSE 6
Behema mesqel merdokiyos yelem
Yenabute dem bekentu alqerem
Yeewnet dagna Geta sitmet’a
Yehesetu sew gifegnaw teqet’a',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'adanegn-geta-kibire-new'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በዕንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
እንግዲህ ላንተ ምስክር ሆኛለሁ
ሥራህን ለዓለም ሁሌም እነግራለሁ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
ደጅህ ወድቄ መኖር ተሽሎኛል

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 3
የሀዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ ዕድሜ ጨመርክልኝ
ከአልጋዬ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህረትህ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ሕይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብር መዝገብ በእጅህ ተፅፋለች

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 5
የሐሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሠንሠለቱ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 6
በሐማ መስቀል መርዶኪዮስ የለም
የናቡቴ ደም በከንቱ አልቀረም
የእውነት ዳኛ ጌታ ስትመጣ
የሐሰቱ ሰው ግፈኛው ተቀጣ

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 1
Yalfal yalalkut alfolgn ayche
Beenba tat’ebkugn kedqdq wet’che
Engdih lante miskr hognalehu
Sirahn lealem hulem enegralehu (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 2
Kindh birtu new dekaman lemerdat
Tawqbetaleh yezalen mabertat
Aynen kesewoch maraqe t’eqmognal
Dejh wedqe menor teshlognal

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 3
Yehezenen maq awlqeh t’alklgn
Moten sit’ebq edme ch’emerklgn
Kealgaye lay anesugn ejochh
Tefewshalehu zare bemhreth (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 4
Qalh ts’nu new dagm yit’egnal
Gobat’a aqnto shbawn tertrwal
Hiywete bante zare adis honalech
Bekbr mezgeb beejh tets’falech

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 5
Yehesetn fird Geta qelebeskew
Tets’nantwal bante ya yetegefa sew
Yegfn ts’wa araqkew kefitu
Beeju lay yelem zare senseletu (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 6
Behema mesqel merdokiyos yelem
Yenabute dem bekentu alqerem
Yeewnet dagna Geta sitmet’a
Yehesetu sew gifegnaw teqet’a

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'adanegn-geta-kibire-new', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Adanegn Geta / Zemari D/ne Yoseph Girma (adanegn-geta-zemari-d-ne-yoseph-girma)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በዕንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
እንግዲህ ላንተ ምስክር ሆኛለሁ
ሥራህን ለዓለም ሁሌም እነግራለሁ (፪)

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
ደጅህ ወድቄ መኖር ተሽሎኛል

VERSE 3
የሀዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ ዕድሜ ጨመርክልኝ
ከአልጋዬ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህረትህ (፪)

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ሕይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብር መዝገብ በእጅህ ተፅፋለች

VERSE 5
የሐሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሠንሠለቱ (፪)

VERSE 6
በሐማ መስቀል መርዶኪዮስ የለም
የናቡቴ ደም በከንቱ አልቀረም
የእውነት ዳኛ ጌታ ስትመጣ
የሐሰቱ ሰው ግፈኛው ተቀጣ',
      lyrics_transliteration = 'Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 1
Yalfal yalalkut alfolgn ayche
Beenba tat’ebkugn kedqdq wet’che
Engdih lante miskr hognalehu
Sirahn lealem hulem enegralehu (2)

VERSE 2
Kindh birtu new dekaman lemerdat
Tawqbetaleh yezalen mabertat
Aynen kesewoch maraqe t’eqmognal
Dejh wedqe menor teshlognal

VERSE 3
Yehezenen maq awlqeh t’alklgn
Moten sit’ebq edme ch’emerklgn
Kealgaye lay anesugn ejochh
Tefewshalehu zare bemhreth (2)

VERSE 4
Qalh ts’nu new dagm yit’egnal
Gobat’a aqnto shbawn tertrwal
Hiywete bante zare adis honalech
Bekbr mezgeb beejh tets’falech

VERSE 5
Yehesetn fird Geta qelebeskew
Tets’nantwal bante ya yetegefa sew
Yegfn ts’wa araqkew kefitu
Beeju lay yelem zare senseletu (2)

VERSE 6
Behema mesqel merdokiyos yelem
Yenabute dem bekentu alqerem
Yeewnet dagna Geta sitmet’a
Yehesetu sew gifegnaw teqet’a',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'adanegn-geta-zemari-d-ne-yoseph-girma'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በዕንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
እንግዲህ ላንተ ምስክር ሆኛለሁ
ሥራህን ለዓለም ሁሌም እነግራለሁ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
ደጅህ ወድቄ መኖር ተሽሎኛል

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 3
የሀዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ ዕድሜ ጨመርክልኝ
ከአልጋዬ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህረትህ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ሕይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብር መዝገብ በእጅህ ተፅፋለች

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 5
የሐሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሠንሠለቱ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 6
በሐማ መስቀል መርዶኪዮስ የለም
የናቡቴ ደም በከንቱ አልቀረም
የእውነት ዳኛ ጌታ ስትመጣ
የሐሰቱ ሰው ግፈኛው ተቀጣ

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 1
Yalfal yalalkut alfolgn ayche
Beenba tat’ebkugn kedqdq wet’che
Engdih lante miskr hognalehu
Sirahn lealem hulem enegralehu (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 2
Kindh birtu new dekaman lemerdat
Tawqbetaleh yezalen mabertat
Aynen kesewoch maraqe t’eqmognal
Dejh wedqe menor teshlognal

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 3
Yehezenen maq awlqeh t’alklgn
Moten sit’ebq edme ch’emerklgn
Kealgaye lay anesugn ejochh
Tefewshalehu zare bemhreth (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 4
Qalh ts’nu new dagm yit’egnal
Gobat’a aqnto shbawn tertrwal
Hiywete bante zare adis honalech
Bekbr mezgeb beejh tets’falech

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 5
Yehesetn fird Geta qelebeskew
Tets’nantwal bante ya yetegefa sew
Yegfn ts’wa araqkew kefitu
Beeju lay yelem zare senseletu (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 6
Behema mesqel merdokiyos yelem
Yenabute dem bekentu alqerem
Yeewnet dagna Geta sitmet’a
Yehesetu sew gifegnaw teqet’a

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'adanegn-geta-zemari-d-ne-yoseph-girma', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Adanegn Geta Zemari Kesis Mindaye Berhanu (adanegn-geta-zemari-kesis-mindaye-berhanu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በዕንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
እንግዲህ ላንተ ምስክር ሆኛለሁ
ሥራህን ለዓለም ሁሌም እነግራለሁ (፪)

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
ደጅህ ወድቄ መኖር ተሽሎኛል

VERSE 3
የሀዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ ዕድሜ ጨመርክልኝ
ከአልጋዬ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህረትህ (፪)

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ሕይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብር መዝገብ በእጅህ ተፅፋለች

VERSE 5
የሐሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሠንሠለቱ (፪)

VERSE 6
በሐማ መስቀል መርዶኪዮስ የለም
የናቡቴ ደም በከንቱ አልቀረም
የእውነት ዳኛ ጌታ ስትመጣ
የሐሰቱ ሰው ግፈኛው ተቀጣ',
      lyrics_transliteration = 'Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 1
Yalfal yalalkut alfolgn ayche
Beenba tat’ebkugn kedqdq wet’che
Engdih lante miskr hognalehu
Sirahn lealem hulem enegralehu (2)

VERSE 2
Kindh birtu new dekaman lemerdat
Tawqbetaleh yezalen mabertat
Aynen kesewoch maraqe t’eqmognal
Dejh wedqe menor teshlognal

VERSE 3
Yehezenen maq awlqeh t’alklgn
Moten sit’ebq edme ch’emerklgn
Kealgaye lay anesugn ejochh
Tefewshalehu zare bemhreth (2)

VERSE 4
Qalh ts’nu new dagm yit’egnal
Gobat’a aqnto shbawn tertrwal
Hiywete bante zare adis honalech
Bekbr mezgeb beejh tets’falech

VERSE 5
Yehesetn fird Geta qelebeskew
Tets’nantwal bante ya yetegefa sew
Yegfn ts’wa araqkew kefitu
Beeju lay yelem zare senseletu (2)

VERSE 6
Behema mesqel merdokiyos yelem
Yenabute dem bekentu alqerem
Yeewnet dagna Geta sitmet’a
Yehesetu sew gifegnaw teqet’a',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'adanegn-geta-zemari-kesis-mindaye-berhanu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በዕንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
እንግዲህ ላንተ ምስክር ሆኛለሁ
ሥራህን ለዓለም ሁሌም እነግራለሁ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
ደጅህ ወድቄ መኖር ተሽሎኛል

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 3
የሀዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ ዕድሜ ጨመርክልኝ
ከአልጋዬ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህረትህ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ሕይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብር መዝገብ በእጅህ ተፅፋለች

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 5
የሐሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሠንሠለቱ (፪)

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ

VERSE 6
በሐማ መስቀል መርዶኪዮስ የለም
የናቡቴ ደም በከንቱ አልቀረም
የእውነት ዳኛ ጌታ ስትመጣ
የሐሰቱ ሰው ግፈኛው ተቀጣ

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈወሰኝ ጌታ ፈወሰኝ (፪)
እግዚአብሔር አዳነኝ
ኃጢአተኛውን ወደደኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 1
Yalfal yalalkut alfolgn ayche
Beenba tat’ebkugn kedqdq wet’che
Engdih lante miskr hognalehu
Sirahn lealem hulem enegralehu (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 2
Kindh birtu new dekaman lemerdat
Tawqbetaleh yezalen mabertat
Aynen kesewoch maraqe t’eqmognal
Dejh wedqe menor teshlognal

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 3
Yehezenen maq awlqeh t’alklgn
Moten sit’ebq edme ch’emerklgn
Kealgaye lay anesugn ejochh
Tefewshalehu zare bemhreth (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 4
Qalh ts’nu new dagm yit’egnal
Gobat’a aqnto shbawn tertrwal
Hiywete bante zare adis honalech
Bekbr mezgeb beejh tets’falech

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 5
Yehesetn fird Geta qelebeskew
Tets’nantwal bante ya yetegefa sew
Yegfn ts’wa araqkew kefitu
Beeju lay yelem zare senseletu (2)

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn

VERSE 6
Behema mesqel merdokiyos yelem
Yenabute dem bekentu alqerem
Yeewnet dagna Geta sitmet’a
Yehesetu sew gifegnaw teqet’a

CHORUS
Adanegn Geta adanegn
Fewesegn Geta fewesegn (2)
Egziabher adanegn
Hat’iategnawn wededegn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'adanegn-geta-zemari-kesis-mindaye-berhanu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Addis amet mezmur (addis-amet-mezmur-4131)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 1
ማለዳ ማለዳ
ሁሌ አዲስ ነህና
አመቱን ልጀምር
በአዲስ ምስጋና

VERSE 2
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 3
ማለዳ ማለዳ
ሁሌ አዲስ ነህና
አመቱን ልጀምር
በአዲስ ምስጋና

VERSE 4
ይቺንም አመት ተወኝ
ሁል ጊዜ እበድላለሁ
አንተ እየማርከኝ
እኔ በድላለሁ

VERSE 5
ባንተ አስጀምረኝ
ይቅርና በኔ
የተቆጠረ ነው
በፊት ዘመኔ

VERSE 6
ስለቸርነትህ
በአዲስ አመት
አዲስ እድሜ
ላመስግን

VERSE 7
መድኃኔዓለም ደጋግሜ
ላመስግን
አማኑኤል ደጋግሜ
ከሰጠኸኝ እድሜ

VERSE 8
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ
ማለዳ ማለዳ

VERSE 9
ሁሌ አዲስ ነህና
አመቱን ልጀምር
በአዲስ ምስጋና
ሺህ አመት በፊት

VERSE 10
እንዳለፈች ትናንት
ቀንም እንደ ሌሊት
ትሆናለች ትጋት
ማለዳም አብቦ

VERSE 11
ለሚረግፍ እድሜ
በዚህ አመት እንኳን
ይመር ፍጻሜ
ስለቸርነትህ

VERSE 12
በአዲስ አመት
አዲስ እድሜ
ላመስግን
መድኃኔዓለም ደጋግሜ

VERSE 13
ላመስግን
አማኑኤል ደጋግሜ
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን

VERSE 14
ምህረትህ እየበዛ
ትተበደለኝ
ማለዳ ማለዳ
ሁሌ አዲስ ነህና

VERSE 15
አመቱን ልጀምር
በአዲስ ምስጋና
በዘመን ማህፀን
የምታሳልፈኝ

VERSE 16
አንዱንም ያንተን ቀን
አንተ ነህ የምትሰጠኝ
አንድ ጊዜ ታይቶ
ለሚጠፋ ጥላ

VERSE 17
ወደፊት ነው እንጂ
አለኝ ወደ ኋላ
ስለቸርነትህ
በአዲስ አመት

VERSE 18
አዲስ እድሜ
ላመስግን
መድኃኔዓለም ደጋግሜ
ላመስግን

VERSE 19
አማኑኤል ደጋግሜ
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ

VERSE 20
ትተበደለኝ
ማለዳ ማለዳ
ሁሌ አዲስ ነህና
አመቱን ልጀምር

VERSE 21
በአዲስ ምስጋና
ዘመንም እንደ ልብስ
በዘመኔ ያረጀአል
አንተ ግን አንተ ነህ

VERSE 22
ዘመንም አያረጅአል
እኔ ያንተ ሳልሆን
ዘመኔን እንዳይፈትን
ስራኝ እንደገና

VERSE 23
የእውነት ሰው ልሁን
ስለቸርነትህ
በአዲስ አመት
አዲስ እድሜ

VERSE 24
ላመስግን
መድኃኔዓለም ደጋግሜ
ላመስግን
አማኑኤል ደጋግሜ

VERSE 25
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 26
ማለዳ ማለዳ
ሁሌ አዲስ ነህና
አመቱን ልጀምር
በአዲስ ምስጋና

VERSE 27
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 28
ማለዳ ማለዳ
ሁሌ አዲስ ነህና
አመቱን ልጀምር
በአዲስ ምስጋና',
      lyrics_transliteration = 'Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 1
Maleda maleda
Hule adis nehna
Ametun lijemr
Beadis misgana

VERSE 2
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 3
Maleda maleda
Hule adis nehna
Ametun lijemr
Beadis misgana

VERSE 4
Yichinm amet tewegn
Hul gize ebedlalehu
Ante eyemarkegn
Ene bedlalehu

VERSE 5
Bante asjemregn
Yiqrna bene
Yeteqot’ere new
Befit zemene

VERSE 6
Silecherneth
Beadis amet
Adis edme
Lamesgn

VERSE 7
Medhanealem degagme
Lamesgn
Amanuel degagme
Keset’eኸgn edme

VERSE 8
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn
Maleda maleda

VERSE 9
Hule adis nehna
Ametun lijemr
Beadis misgana
Shih amet befit

VERSE 10
Endalefech tinant
Qenm ende lelit
Tihonalech tigat
Maledam abbo

VERSE 11
Lemiregf edme
Bezih amet enkwan
Yimer fits’ame
Silecherneth

VERSE 12
Beadis amet
Adis edme
Lamesgn
Medhanealem degagme

VERSE 13
Lamesgn
Amanuel degagme
Keset’eኸgn edme
Keset’eኸgn qen

VERSE 14
Mihreth eyebeza
Titebedelegn
Maleda maleda
Hule adis nehna

VERSE 15
Ametun lijemr
Beadis misgana
Bezemen mahts’en
Yemtasalfegn

VERSE 16
Andunm yanten qen
Ante neh yemtset’egn
And gize tayto
Lemit’efa t’la

VERSE 17
Wedefit new enji
Alegn wede hwala
Silecherneth
Beadis amet

VERSE 18
Adis edme
Lamesgn
Medhanealem degagme
Lamesgn

VERSE 19
Amanuel degagme
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza

VERSE 20
Titebedelegn
Maleda maleda
Hule adis nehna
Ametun lijemr

VERSE 21
Beadis misgana
Zemenm ende libs
Bezemene yarejeal
Ante gin ante neh

VERSE 22
Zemenm ayarejal
Ene yante salhon
Zemenen endayfetn
Siragn endegena

VERSE 23
Yeewnet sew lihun
Silecherneth
Beadis amet
Adis edme

VERSE 24
Lamesgn
Medhanealem degagme
Lamesgn
Amanuel degagme

VERSE 25
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 26
Maleda maleda
Hule adis nehna
Ametun lijemr
Beadis misgana

VERSE 27
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 28
Maleda maleda
Hule adis nehna
Ametun lijemr
Beadis misgana',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'addis-amet-mezmur-4131'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 1
ማለዳ ማለዳ
ሁሌ አዲስ ነህና
አመቱን ልጀምር
በአዲስ ምስጋና

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 2
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 3
ማለዳ ማለዳ
ሁሌ አዲስ ነህና
አመቱን ልጀምር
በአዲስ ምስጋና

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 4
ይቺንም አመት ተወኝ
ሁል ጊዜ እበድላለሁ
አንተ እየማርከኝ
እኔ በድላለሁ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 5
ባንተ አስጀምረኝ
ይቅርና በኔ
የተቆጠረ ነው
በፊት ዘመኔ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 6
ስለቸርነትህ
በአዲስ አመት
አዲስ እድሜ
ላመስግን

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 7
መድኃኔዓለም ደጋግሜ
ላመስግን
አማኑኤል ደጋግሜ
ከሰጠኸኝ እድሜ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 8
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ
ማለዳ ማለዳ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 9
ሁሌ አዲስ ነህና
አመቱን ልጀምር
በአዲስ ምስጋና
ሺህ አመት በፊት

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 10
እንዳለፈች ትናንት
ቀንም እንደ ሌሊት
ትሆናለች ትጋት
ማለዳም አብቦ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 11
ለሚረግፍ እድሜ
በዚህ አመት እንኳን
ይመር ፍጻሜ
ስለቸርነትህ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 12
በአዲስ አመት
አዲስ እድሜ
ላመስግን
መድኃኔዓለም ደጋግሜ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 13
ላመስግን
አማኑኤል ደጋግሜ
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 14
ምህረትህ እየበዛ
ትተበደለኝ
ማለዳ ማለዳ
ሁሌ አዲስ ነህና

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 15
አመቱን ልጀምር
በአዲስ ምስጋና
በዘመን ማህፀን
የምታሳልፈኝ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 16
አንዱንም ያንተን ቀን
አንተ ነህ የምትሰጠኝ
አንድ ጊዜ ታይቶ
ለሚጠፋ ጥላ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 17
ወደፊት ነው እንጂ
አለኝ ወደ ኋላ
ስለቸርነትህ
በአዲስ አመት

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 18
አዲስ እድሜ
ላመስግን
መድኃኔዓለም ደጋግሜ
ላመስግን

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 19
አማኑኤል ደጋግሜ
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 20
ትተበደለኝ
ማለዳ ማለዳ
ሁሌ አዲስ ነህና
አመቱን ልጀምር

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 21
በአዲስ ምስጋና
ዘመንም እንደ ልብስ
በዘመኔ ያረጀአል
አንተ ግን አንተ ነህ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 22
ዘመንም አያረጅአል
እኔ ያንተ ሳልሆን
ዘመኔን እንዳይፈትን
ስራኝ እንደገና

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 23
የእውነት ሰው ልሁን
ስለቸርነትህ
በአዲስ አመት
አዲስ እድሜ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 24
ላመስግን
መድኃኔዓለም ደጋግሜ
ላመስግን
አማኑኤል ደጋግሜ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 25
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 26
ማለዳ ማለዳ
ሁሌ አዲስ ነህና
አመቱን ልጀምር
በአዲስ ምስጋና

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 27
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ

VERSE 28
ማለዳ ማለዳ
ሁሌ አዲስ ነህና
አመቱን ልጀምር
በአዲስ ምስጋና

CHORUS
ከሰጠኸኝ እድሜ
ከሰጠኸኝ ቀን
ምህረትህ እየበዛ
ትተበደለኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 1
Maleda maleda
Hule adis nehna
Ametun lijemr
Beadis misgana

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 2
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 3
Maleda maleda
Hule adis nehna
Ametun lijemr
Beadis misgana

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 4
Yichinm amet tewegn
Hul gize ebedlalehu
Ante eyemarkegn
Ene bedlalehu

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 5
Bante asjemregn
Yiqrna bene
Yeteqot’ere new
Befit zemene

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 6
Silecherneth
Beadis amet
Adis edme
Lamesgn

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 7
Medhanealem degagme
Lamesgn
Amanuel degagme
Keset’eኸgn edme

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 8
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn
Maleda maleda

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 9
Hule adis nehna
Ametun lijemr
Beadis misgana
Shih amet befit

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 10
Endalefech tinant
Qenm ende lelit
Tihonalech tigat
Maledam abbo

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 11
Lemiregf edme
Bezih amet enkwan
Yimer fits’ame
Silecherneth

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 12
Beadis amet
Adis edme
Lamesgn
Medhanealem degagme

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 13
Lamesgn
Amanuel degagme
Keset’eኸgn edme
Keset’eኸgn qen

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 14
Mihreth eyebeza
Titebedelegn
Maleda maleda
Hule adis nehna

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 15
Ametun lijemr
Beadis misgana
Bezemen mahts’en
Yemtasalfegn

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 16
Andunm yanten qen
Ante neh yemtset’egn
And gize tayto
Lemit’efa t’la

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 17
Wedefit new enji
Alegn wede hwala
Silecherneth
Beadis amet

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 18
Adis edme
Lamesgn
Medhanealem degagme
Lamesgn

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 19
Amanuel degagme
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 20
Titebedelegn
Maleda maleda
Hule adis nehna
Ametun lijemr

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 21
Beadis misgana
Zemenm ende libs
Bezemene yarejeal
Ante gin ante neh

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 22
Zemenm ayarejal
Ene yante salhon
Zemenen endayfetn
Siragn endegena

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 23
Yeewnet sew lihun
Silecherneth
Beadis amet
Adis edme

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 24
Lamesgn
Medhanealem degagme
Lamesgn
Amanuel degagme

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 25
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 26
Maleda maleda
Hule adis nehna
Ametun lijemr
Beadis misgana

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 27
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn

VERSE 28
Maleda maleda
Hule adis nehna
Ametun lijemr
Beadis misgana

CHORUS
Keset’eኸgn edme
Keset’eኸgn qen
Mihreth eyebeza
Titebedelegn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'addis-amet-mezmur-4131', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Adegnegn Enate Kesega Fetena (adegnegn-enate-kesega-fetena)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 1
የአማኑኤል እናት የተዋህዶ አክሊል
አትጥፊ ከመሃል እንድትሆኝን ሃይል
ምንም ቢበዛብሽ የኛ ጉስቁልና
ከኛ ጋራ ከሆንሽ አለን ቅድስና (2)

VERSE 2
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 3
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 4
ተስፋዬ ነሽና እመካብሻለሁ
ግራ ቀኝም አልል ምርኮኛሽ ሆኛለሁ
ስቅበዘበዝ አይቶ ተስፋ የሠጠኝ
እግዚአብሔር ይመስገን ካንቺ ያስጠጋኝ (2)

VERSE 5
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 6
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 7
በስጋ ደክሜ በነፍስ እንዳልጠፋ
እማጸንሻለሁ ድንግል የኔ ተስፋ
የመንግስቱ ወራሽ እንድሆን አድርጊኝ
መልካም ስራ መስራት እኔን አስተምሪኝ (2)

VERSE 8
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 9
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 10
አንቺ የሌለሽበት ጉባኤው ባዶ ነው
በቁም የደረቀ ሕይወት የተለየው
ከመካከል ገብተሽ ሙይ የጎደለውን
ሰርጉ ተደግሷል ጎብኝልን ጓዳውን (2)

VERSE 11
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)',
      lyrics_transliteration = 'Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 1
YeAmanuel enat yetewahdo aklil
Att’fi kemehal endthognn hayl
Minm bibezabsh yegna gusqulna
Kegna gara kehonsh alen qidsna (2)

VERSE 2
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 3
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 4
Tesfaye neshna emekabshalehu
Gira qegnm all mirkognash hognalehu
Siqbezebez ayto tesfa yeset’egn
Egziabher yemesgen kanchi yast’egagn (2)

VERSE 5
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 6
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 7
Besga dekme benefs endalt’efa
Emats’enshalehu Dingil yene tesfa
Yemengstu werash endhon adrgign
Melkam sira mesrat enen astemrign (2)

VERSE 8
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 9
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 10
Anchi yeleleshbet gubaew bado new
Bequm yedereqe hiywet yeteleyew
Kemekakel gebtesh muy yegodelewn
Sergu tedegswal gobgnln gwadawn (2)

VERSE 11
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'adegnegn-enate-kesega-fetena'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 1
የአማኑኤል እናት የተዋህዶ አክሊል
አትጥፊ ከመሃል እንድትሆኝን ሃይል
ምንም ቢበዛብሽ የኛ ጉስቁልና
ከኛ ጋራ ከሆንሽ አለን ቅድስና (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 2
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 3
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 4
ተስፋዬ ነሽና እመካብሻለሁ
ግራ ቀኝም አልል ምርኮኛሽ ሆኛለሁ
ስቅበዘበዝ አይቶ ተስፋ የሠጠኝ
እግዚአብሔር ይመስገን ካንቺ ያስጠጋኝ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 5
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 6
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 7
በስጋ ደክሜ በነፍስ እንዳልጠፋ
እማጸንሻለሁ ድንግል የኔ ተስፋ
የመንግስቱ ወራሽ እንድሆን አድርጊኝ
መልካም ስራ መስራት እኔን አስተምሪኝ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 8
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 9
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 10
አንቺ የሌለሽበት ጉባኤው ባዶ ነው
በቁም የደረቀ ሕይወት የተለየው
ከመካከል ገብተሽ ሙይ የጎደለውን
ሰርጉ ተደግሷል ጎብኝልን ጓዳውን (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

VERSE 11
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከሃጥያት ከቶ አራቀምና
ሸክሜ የከበደ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 1
YeAmanuel enat yetewahdo aklil
Att’fi kemehal endthognn hayl
Minm bibezabsh yegna gusqulna
Kegna gara kehonsh alen qidsna (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 2
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 3
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 4
Tesfaye neshna emekabshalehu
Gira qegnm all mirkognash hognalehu
Siqbezebez ayto tesfa yeset’egn
Egziabher yemesgen kanchi yast’egagn (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 5
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 6
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 7
Besga dekme benefs endalt’efa
Emats’enshalehu Dingil yene tesfa
Yemengstu werash endhon adrgign
Melkam sira mesrat enen astemrign (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 8
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 9
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 10
Anchi yeleleshbet gubaew bado new
Bequm yedereqe hiywet yeteleyew
Kemekakel gebtesh muy yegodelewn
Sergu tedegswal gobgnln gwadawn (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 11
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’yat keto araqemna
Shekme yekebede bichegna hognalehu
Atleygn Dingil adera elshalehu (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'adegnegn-enate-kesega-fetena', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Adignign Enate (adignign-enate)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/

VERSE 1
የአማኑኤል እናት የተዋህዶ አክሊል
አትጥፊ ከመሃል እንድትሆኝን ሀይል
ምንም ቢበዛብሽ የእኛ ጉስቁልና
ከኛ ጋራ ከሆንሽ አለን ቅድስና /2/

VERSE 2
ተስፋዬ ነሽና እመካብሻልሁ
ግራ ቀኝም አልል ምርኮኛሽ ሆኛለሁ
ስቅበዘበዝ አይቶ ተስፋ የሰጠኝ
እግዚአብሔር ይመስገን ካንቺ ያስጠጋኝ/2/

VERSE 3
በስጋ ደክሜ በነፍሴ እንዳልጠፋ
እማጸንሻለሁ ድንግል የእኔ ተስፋ
ለመንግሥቱ ወራሽ እንድሆን አድርጊኝ
መልካም ስራን መስራት እኔን አስተምሪኝ /2/

VERSE 4
አንቺ የሌለሽበት ጉባኤው ባዶ ነው
በቁም የደረቀ ሕይወት የተለየው
ከመሃከል ገብተሽ ሙይ የጎደለውን
ሰርጉ ተደግሷል ጎብኚልኝ ጓዳውን/2/',
      lyrics_transliteration = 'Adgngn enate kesga fetena
Sigaye kehat’iat keto araqemna
Shekme yekebedegn bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 1
YeAmanuel enat yetewahdo aklil
Att’fi kemehal endthognn heyl
Minm bibezabsh yeegna gusqulna
Kegna gara kehonsh alen qidsna (2)

VERSE 2
Tesfaye neshna emekabshalhu
Gira qegnm all mirkognash hognalehu
Siqbezebez ayto tesfa yeset’egn
Egziabher yemesgen kanchi yast’egagn (2)

VERSE 3
Besga dekme benefse endalt’efa
Emats’enshalehu Dingil yeene tesfa
Lemengstu werash endhon adrgign
Melkam siran mesrat enen astemrign (2)

VERSE 4
Anchi yeleleshbet gubaew bado new
Bequm yedereqe hiywet yeteleyew
Kemehakel gebtesh muy yegodelewn
Sergu tedegswal gobgnilgn gwadawn (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'adignign-enate'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/

VERSE 1
የአማኑኤል እናት የተዋህዶ አክሊል
አትጥፊ ከመሃል እንድትሆኝን ሀይል
ምንም ቢበዛብሽ የእኛ ጉስቁልና
ከኛ ጋራ ከሆንሽ አለን ቅድስና /2/

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/

VERSE 2
ተስፋዬ ነሽና እመካብሻልሁ
ግራ ቀኝም አልል ምርኮኛሽ ሆኛለሁ
ስቅበዘበዝ አይቶ ተስፋ የሰጠኝ
እግዚአብሔር ይመስገን ካንቺ ያስጠጋኝ/2/

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/

VERSE 3
በስጋ ደክሜ በነፍሴ እንዳልጠፋ
እማጸንሻለሁ ድንግል የእኔ ተስፋ
ለመንግሥቱ ወራሽ እንድሆን አድርጊኝ
መልካም ስራን መስራት እኔን አስተምሪኝ /2/

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/

VERSE 4
አንቺ የሌለሽበት ጉባኤው ባዶ ነው
በቁም የደረቀ ሕይወት የተለየው
ከመሃከል ገብተሽ ሙይ የጎደለውን
ሰርጉ ተደግሷል ጎብኚልኝ ጓዳውን/2/

CHORUS
አድኝኝ እናቴ ከስጋ ፈተና
ስጋዬ ከኃጢአት ከቶ አራቀምና
ሸክሜ የከበደኝ ብቸኛ ሆኛለሁ
አትለይኝ ድንግል አደራ እልሻለሁ /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adgngn enate kesga fetena
Sigaye kehat’iat keto araqemna
Shekme yekebedegn bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 1
YeAmanuel enat yetewahdo aklil
Att’fi kemehal endthognn heyl
Minm bibezabsh yeegna gusqulna
Kegna gara kehonsh alen qidsna (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’iat keto araqemna
Shekme yekebedegn bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 2
Tesfaye neshna emekabshalhu
Gira qegnm all mirkognash hognalehu
Siqbezebez ayto tesfa yeset’egn
Egziabher yemesgen kanchi yast’egagn (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’iat keto araqemna
Shekme yekebedegn bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 3
Besga dekme benefse endalt’efa
Emats’enshalehu Dingil yeene tesfa
Lemengstu werash endhon adrgign
Melkam siran mesrat enen astemrign (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’iat keto araqemna
Shekme yekebedegn bichegna hognalehu
Atleygn Dingil adera elshalehu (2)

VERSE 4
Anchi yeleleshbet gubaew bado new
Bequm yedereqe hiywet yeteleyew
Kemehakel gebtesh muy yegodelewn
Sergu tedegswal gobgnilgn gwadawn (2)

CHORUS
Adgngn enate kesga fetena
Sigaye kehat’iat keto araqemna
Shekme yekebedegn bichegna hognalehu
Atleygn Dingil adera elshalehu (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'adignign-enate', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Adihineni (adihineni)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አድኅነኒ ዘአድኃንኮሙ
እምእቶነ እሳት ገብርኤል
አመ ውስተ እሳት
ተወድዩ ሠለስቱ ዕደው

VERSE 1
አድኅነኒ ዘአድኃንኮሙ
እምእቶነ እሳት ገብርኤል
አመ ውስተ እሳት
ተወድዩ ሠለስቱ ዕደው',
      lyrics_transliteration = 'Adhneni zeadhankomu
Emetone esat Gebriel
Ame wiste esat
Tewedyu selestu edew

VERSE 1
Adhneni zeadhankomu
Emetone esat Gebriel
Ame wiste esat
Tewedyu selestu edew',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'adihineni'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አድኅነኒ ዘአድኃንኮሙ
እምእቶነ እሳት ገብርኤል
አመ ውስተ እሳት
ተወድዩ ሠለስቱ ዕደው

VERSE 1
አድኅነኒ ዘአድኃንኮሙ
እምእቶነ እሳት ገብርኤል
አመ ውስተ እሳት
ተወድዩ ሠለስቱ ዕደው

CHORUS
አድኅነኒ ዘአድኃንኮሙ
እምእቶነ እሳት ገብርኤል
አመ ውስተ እሳት
ተወድዩ ሠለስቱ ዕደው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adhneni zeadhankomu
Emetone esat Gebriel
Ame wiste esat
Tewedyu selestu edew

VERSE 1
Adhneni zeadhankomu
Emetone esat Gebriel
Ame wiste esat
Tewedyu selestu edew

CHORUS
Adhneni zeadhankomu
Emetone esat Gebriel
Ame wiste esat
Tewedyu selestu edew'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'adihineni', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Adinegn Amilake Adinegn (adinegn-amilake-adinegn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 1
ፍቅር ከሰው ልጆች ቀዝቅዞ
ትዉልዱ በበደል ተይዞ
ወዳጅ በወዳጁ ጨከነ
ወዉደዱ የሽንገላ ሆነ/2

VERSE 2
ሆኖበት ክብሩ በነውሩ
ተጣሰ የፍቅር ድንበሩ
ደርቦ የማይሞቀዉ ሆነ
ደስታዉ ከእጁ ላይ ተነነ/2

VERSE 3
ለቃልህ መታዘዝ ዘነጋ
ተክዞ መሽቶ እየነጋ
ለክፉ አሳልፎ ሰጠ
ወንድሙን በነዋይ ለወጠ/2

VERSE 4
ትንኝን ያጠራል ከሰው ላይ
በራሱ ምሶሶዉን ሳያያይ
ይሆናል የወንድሙ ፈራጅ
ተይዞ በእግዚአብሄር እጅ/2

VERSE 5
ተሰዶ ሲኖር በባእድ
ሲገባው ሁሉም ሊዋደድ
አንዱበአንዱ ላይ ይነሳል
አካሉን ቀኝ እጁን ይንቃል

VERSE 6
ወንድሙን እህቱን ይንቃል',
      lyrics_transliteration = 'Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2

VERSE 1
Fiqr kesew lijoch qezqzo
Tiwuldu bebedel teyzo
Wedaj bewedaju ch’ekene
Wewudedu yeshngela hone/2

VERSE 2
Honobet kibru benewru
Tet’ase yefqr dinberu
Derbo yemaymoqewu hone
Destawu keeju lay tenene/2

VERSE 3
Leqalh metazez zenega
Tekzo meshto eyenega
Lekfu asalfo set’e
Wendmun beneway lewet’e/2

VERSE 4
Tingnn yat’eral kesew lay
Berasu misosowun sayayay
Yihonal yewendmu feraj
Teyzo beegziabher ej/2

VERSE 5
Tesedo sinor bebaed
Sigebaw hulum liwaded
Andubeandu lay yinesal
Akalun qegn ejun yinqal

VERSE 6
Wendmun ehtun yinqal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'adinegn-amilake-adinegn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 1
ፍቅር ከሰው ልጆች ቀዝቅዞ
ትዉልዱ በበደል ተይዞ
ወዳጅ በወዳጁ ጨከነ
ወዉደዱ የሽንገላ ሆነ/2

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 2
ሆኖበት ክብሩ በነውሩ
ተጣሰ የፍቅር ድንበሩ
ደርቦ የማይሞቀዉ ሆነ
ደስታዉ ከእጁ ላይ ተነነ/2

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 3
ለቃልህ መታዘዝ ዘነጋ
ተክዞ መሽቶ እየነጋ
ለክፉ አሳልፎ ሰጠ
ወንድሙን በነዋይ ለወጠ/2

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 4
ትንኝን ያጠራል ከሰው ላይ
በራሱ ምሶሶዉን ሳያያይ
ይሆናል የወንድሙ ፈራጅ
ተይዞ በእግዚአብሄር እጅ/2

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 5
ተሰዶ ሲኖር በባእድ
ሲገባው ሁሉም ሊዋደድ
አንዱበአንዱ ላይ ይነሳል
አካሉን ቀኝ እጁን ይንቃል

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2

VERSE 6
ወንድሙን እህቱን ይንቃል

CHORUS
አድነኝ አምላኬ አድነኝ
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው/2'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2

VERSE 1
Fiqr kesew lijoch qezqzo
Tiwuldu bebedel teyzo
Wedaj bewedaju ch’ekene
Wewudedu yeshngela hone/2

CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2

VERSE 2
Honobet kibru benewru
Tet’ase yefqr dinberu
Derbo yemaymoqewu hone
Destawu keeju lay tenene/2

CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2

VERSE 3
Leqalh metazez zenega
Tekzo meshto eyenega
Lekfu asalfo set’e
Wendmun beneway lewet’e/2

CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2

VERSE 4
Tingnn yat’eral kesew lay
Berasu misosowun sayayay
Yihonal yewendmu feraj
Teyzo beegziabher ej/2

CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2

VERSE 5
Tesedo sinor bebaed
Sigebaw hulum liwaded
Andubeandu lay yinesal
Akalun qegn ejun yinqal

CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2

VERSE 6
Wendmun ehtun yinqal

CHORUS
Adnegn amlake adnegn
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew/2'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'adinegn-amilake-adinegn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Adirigehilignalina Becherinetih Mezimur (adirigehilignalina-becherinetih-mezimur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አድርገህልኛልና በቸርነትህ አመሰግንሀለሁ እልል እልል
ለአለመ አለም አማኑኤል እገዛልሀለሁ መድኃኔአለም
ቀኑ ጨልሞብኝ ዙሪያው ገደል ሆኖ
የችግር አረንቋ ፊቴ ተደቅኖ

VERSE 1
እረዳት ያጣሁኝ በመሰለኝ ጊዜ
ፈፅሞ አራክልኝ የልቤን ትካዜ
አምላኬ ጉልበቴ ኃይሌ መመኪያዬ
ጠላት ማሳፈሪያ የእምነት ጋሻዬ

VERSE 2
እንደማትተወኝ አሁን አውቄአለሁ
ካለኝ ነገር ይልቅ በአንተ ታምኛለሁ
ጥቂቷን አብዝተህ ለምትመግብ ጌታ
የምመልስልህ ባላገኝ ስጦታ

VERSE 3
በቀንም በሌትም ሁሌ የሚያበራ
መንክር ለባህሪህ እፁብ የአንተ ስራ
አምላክ ሆይ ምስጋና ለአንተ ይገባሀል
ለምስኪኗ ጎጆ በረከት ሰጥተሀል

VERSE 4
ድሀ ነኝ አልልም ሀብቴ አንተ ነህና
ማሰሮዬ ሞልቷል ላይጎድል እንደገና',
      lyrics_transliteration = 'Adrgehlgnalna becherneth amesegnhelehu ell ell
Lealeme alem Amanuel egezalhelehu medhanealem
Qenu ch’elmobgn zuriyaw gedel hono
Yechgr arenqwa fite tedeqno

VERSE 1
Eredat yat’ahugn bemeselegn gize
Fets’mo araklgn yelben tikaze
Amlake gulbete hayle memekiyaye
T’elat masaferiya yeemnet gashaye

VERSE 2
Endemattewegn ahun awqealehu
Kalegn neger yilq beante tamgnalehu
T’qitwan abzteh lemtmegb Geta
Yemmelslh balagegn sit’ota

VERSE 3
Beqenm beletm hule yemiyabera
Menkr lebahrih ets’ub yeante sira
Amlak hoy misgana leante yigebahel
Lemskinwa gojo bereket set’tehel

VERSE 4
Dihe negn allm hebte ante nehna
Maseroye moltwal laygodl endegena',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'adirigehilignalina-becherinetih-mezimur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አድርገህልኛልና በቸርነትህ አመሰግንሀለሁ እልል እልል
ለአለመ አለም አማኑኤል እገዛልሀለሁ መድኃኔአለም
ቀኑ ጨልሞብኝ ዙሪያው ገደል ሆኖ
የችግር አረንቋ ፊቴ ተደቅኖ

VERSE 1
እረዳት ያጣሁኝ በመሰለኝ ጊዜ
ፈፅሞ አራክልኝ የልቤን ትካዜ
አምላኬ ጉልበቴ ኃይሌ መመኪያዬ
ጠላት ማሳፈሪያ የእምነት ጋሻዬ

CHORUS
አድርገህልኛልና በቸርነትህ አመሰግንሀለሁ እልል እልል
ለአለመ አለም አማኑኤል እገዛልሀለሁ መድኃኔአለም
ቀኑ ጨልሞብኝ ዙሪያው ገደል ሆኖ
የችግር አረንቋ ፊቴ ተደቅኖ

VERSE 2
እንደማትተወኝ አሁን አውቄአለሁ
ካለኝ ነገር ይልቅ በአንተ ታምኛለሁ
ጥቂቷን አብዝተህ ለምትመግብ ጌታ
የምመልስልህ ባላገኝ ስጦታ

CHORUS
አድርገህልኛልና በቸርነትህ አመሰግንሀለሁ እልል እልል
ለአለመ አለም አማኑኤል እገዛልሀለሁ መድኃኔአለም
ቀኑ ጨልሞብኝ ዙሪያው ገደል ሆኖ
የችግር አረንቋ ፊቴ ተደቅኖ

VERSE 3
በቀንም በሌትም ሁሌ የሚያበራ
መንክር ለባህሪህ እፁብ የአንተ ስራ
አምላክ ሆይ ምስጋና ለአንተ ይገባሀል
ለምስኪኗ ጎጆ በረከት ሰጥተሀል

CHORUS
አድርገህልኛልና በቸርነትህ አመሰግንሀለሁ እልል እልል
ለአለመ አለም አማኑኤል እገዛልሀለሁ መድኃኔአለም
ቀኑ ጨልሞብኝ ዙሪያው ገደል ሆኖ
የችግር አረንቋ ፊቴ ተደቅኖ

VERSE 4
ድሀ ነኝ አልልም ሀብቴ አንተ ነህና
ማሰሮዬ ሞልቷል ላይጎድል እንደገና

CHORUS
አድርገህልኛልና በቸርነትህ አመሰግንሀለሁ እልል እልል
ለአለመ አለም አማኑኤል እገዛልሀለሁ መድኃኔአለም
ቀኑ ጨልሞብኝ ዙሪያው ገደል ሆኖ
የችግር አረንቋ ፊቴ ተደቅኖ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adrgehlgnalna becherneth amesegnhelehu ell ell
Lealeme alem Amanuel egezalhelehu medhanealem
Qenu ch’elmobgn zuriyaw gedel hono
Yechgr arenqwa fite tedeqno

VERSE 1
Eredat yat’ahugn bemeselegn gize
Fets’mo araklgn yelben tikaze
Amlake gulbete hayle memekiyaye
T’elat masaferiya yeemnet gashaye

CHORUS
Adrgehlgnalna becherneth amesegnhelehu ell ell
Lealeme alem Amanuel egezalhelehu medhanealem
Qenu ch’elmobgn zuriyaw gedel hono
Yechgr arenqwa fite tedeqno

VERSE 2
Endemattewegn ahun awqealehu
Kalegn neger yilq beante tamgnalehu
T’qitwan abzteh lemtmegb Geta
Yemmelslh balagegn sit’ota

CHORUS
Adrgehlgnalna becherneth amesegnhelehu ell ell
Lealeme alem Amanuel egezalhelehu medhanealem
Qenu ch’elmobgn zuriyaw gedel hono
Yechgr arenqwa fite tedeqno

VERSE 3
Beqenm beletm hule yemiyabera
Menkr lebahrih ets’ub yeante sira
Amlak hoy misgana leante yigebahel
Lemskinwa gojo bereket set’tehel

CHORUS
Adrgehlgnalna becherneth amesegnhelehu ell ell
Lealeme alem Amanuel egezalhelehu medhanealem
Qenu ch’elmobgn zuriyaw gedel hono
Yechgr arenqwa fite tedeqno

VERSE 4
Dihe negn allm hebte ante nehna
Maseroye moltwal laygodl endegena

CHORUS
Adrgehlgnalna becherneth amesegnhelehu ell ell
Lealeme alem Amanuel egezalhelehu medhanealem
Qenu ch’elmobgn zuriyaw gedel hono
Yechgr arenqwa fite tedeqno'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'adirigehilignalina-becherinetih-mezimur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Adnegn Amlake Like Mezemeran Tewodros Yosef (adnegn-amlake-like-mezemeran-tewodros-yosef)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው(፪)
ፍቅር ከሰው ልጆች ቀዝቅዞ

VERSE 1
ትውልዱ በበደል ተይዞ
ወዳጅ በወዳጁ ጨከነ
መውደዱ የሽንገላ ሆነ(፪)
ሆኖበት ክብሩ በነውሩ

VERSE 2
ተጣሰ የፍቅር ድንበሩ
ደርቦ የማይሞቀው ሆነ
ደስታው ከእጁ ላይ ተነነ(፪)
ለቃልህ መታዘዝ ዘነጋ

VERSE 3
ተክዞ መሽቶ እየነጋ
ለክፉ አሳልፎ ሰጠ
ወንድሙን በንዋይ ለወጠ(፪)
ትንኝን የጠራል ከሰው ላይ

VERSE 4
በራሱ ምሰሶውን ሳያይ
ይሆናል የወንድሙ ፈራጅ
ተይዞ በእግዚአብሔር እጅ(፪)
ተሰዶ ሲኖር በባዕድ

VERSE 5
ሲገባ ሁሉም ሊዋደድ
አንዱ በአንዱ ላይ ይነሳል
አካሉን ቀኝ እጁን ይንቃል
አካሉን እህቱን ይንቃል',
      lyrics_transliteration = 'Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew (2)
Fiqr kesew lijoch qezqzo

VERSE 1
Tiwldu bebedel teyzo
Wedaj bewedaju ch’ekene
Mewdedu yeshngela hone (2)
Honobet kibru benewru

VERSE 2
Tet’ase yefqr dinberu
Derbo yemaymoqew hone
Destaw keeju lay tenene (2)
Leqalh metazez zenega

VERSE 3
Tekzo meshto eyenega
Lekfu asalfo set’e
Wendmun benway lewet’e (2)
Tingnn yet’eral kesew lay

VERSE 4
Berasu misesown sayay
Yihonal yewendmu feraj
Teyzo beEgziabher ej (2)
Tesedo sinor bebaed

VERSE 5
Sigeba hulum liwaded
Andu beandu lay yinesal
Akalun qegn ejun yinqal
Akalun ehtun yinqal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'adnegn-amlake-like-mezemeran-tewodros-yosef'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው(፪)
ፍቅር ከሰው ልጆች ቀዝቅዞ

VERSE 1
ትውልዱ በበደል ተይዞ
ወዳጅ በወዳጁ ጨከነ
መውደዱ የሽንገላ ሆነ(፪)
ሆኖበት ክብሩ በነውሩ

CHORUS
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው(፪)
ፍቅር ከሰው ልጆች ቀዝቅዞ

VERSE 2
ተጣሰ የፍቅር ድንበሩ
ደርቦ የማይሞቀው ሆነ
ደስታው ከእጁ ላይ ተነነ(፪)
ለቃልህ መታዘዝ ዘነጋ

CHORUS
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው(፪)
ፍቅር ከሰው ልጆች ቀዝቅዞ

VERSE 3
ተክዞ መሽቶ እየነጋ
ለክፉ አሳልፎ ሰጠ
ወንድሙን በንዋይ ለወጠ(፪)
ትንኝን የጠራል ከሰው ላይ

CHORUS
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው(፪)
ፍቅር ከሰው ልጆች ቀዝቅዞ

VERSE 4
በራሱ ምሰሶውን ሳያይ
ይሆናል የወንድሙ ፈራጅ
ተይዞ በእግዚአብሔር እጅ(፪)
ተሰዶ ሲኖር በባዕድ

CHORUS
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው(፪)
ፍቅር ከሰው ልጆች ቀዝቅዞ

VERSE 5
ሲገባ ሁሉም ሊዋደድ
አንዱ በአንዱ ላይ ይነሳል
አካሉን ቀኝ እጁን ይንቃል
አካሉን እህቱን ይንቃል

CHORUS
አድነኝ ጌታዬ አድነኝ
አልቋል ከምድር ላይ ደግ ሰው
እንባዬን ከአይኔ ላይ አብሰው(፪)
ፍቅር ከሰው ልጆች ቀዝቅዞ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew (2)
Fiqr kesew lijoch qezqzo

VERSE 1
Tiwldu bebedel teyzo
Wedaj bewedaju ch’ekene
Mewdedu yeshngela hone (2)
Honobet kibru benewru

CHORUS
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew (2)
Fiqr kesew lijoch qezqzo

VERSE 2
Tet’ase yefqr dinberu
Derbo yemaymoqew hone
Destaw keeju lay tenene (2)
Leqalh metazez zenega

CHORUS
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew (2)
Fiqr kesew lijoch qezqzo

VERSE 3
Tekzo meshto eyenega
Lekfu asalfo set’e
Wendmun benway lewet’e (2)
Tingnn yet’eral kesew lay

CHORUS
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew (2)
Fiqr kesew lijoch qezqzo

VERSE 4
Berasu misesown sayay
Yihonal yewendmu feraj
Teyzo beEgziabher ej (2)
Tesedo sinor bebaed

CHORUS
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew (2)
Fiqr kesew lijoch qezqzo

VERSE 5
Sigeba hulum liwaded
Andu beandu lay yinesal
Akalun qegn ejun yinqal
Akalun ehtun yinqal

CHORUS
Adnegn Getaye adnegn
Alqwal kemdr lay deg sew
Enbayen keayne lay absew (2)
Fiqr kesew lijoch qezqzo'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'adnegn-amlake-like-mezemeran-tewodros-yosef', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Adrigeh Lignalen (adrigeh-lignalen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አድርገህልኛልና በቸርነትህ
አመሰግንሃለሁ እልል እልል
ለዓለመ ዓለም አማኑኤል /2/
እገዛልሃለሁ መድሃኒዓለም /2/

VERSE 1
ቀኑ ጨልሞብኝ ዙሪያው ገደል ሆኖ
የችግር አረንቋ ፊቴ ተደቅኖ
እረዳት ያጣሁኝ በመሰለኝ ጊዜ
ፈጽሞ አራቅክልኝ የልቤን ትካዜ

VERSE 2
አምላኬ ጉልበቴ ሐይሌ መመኪያዬ
ጠላት ማሳፈሪያ የእምነት ጋሻዬ
እንደማትተወኝ አሁን አውቂአለሁ
ካለኝ ነገር ይልቅ በአንተ ታምኛለሁ

VERSE 3
ጥቂቷን አብዝተህ ለምትመግብ ጌታ
የምመልስልህ ባላገኝ ስጦታ

VERSE 4
በቀንም በሌትም ለሚያበራ
መንክር ለባህሪይው እጹብ ለአንተ ስራ

VERSE 5
አምላክ ሆይ ምስጋና ለአንተ ይገባሃል
ለትንሿ ጎጆ በረከት ሰጥተሃል',
      lyrics_transliteration = 'Adrigeh lignalen becherneth
Ameseginalew illil illil
Lealeme alem Amanuel (x2)
Egezalehulehu Medhanealem (x2)

VERSE 1
Qenu chel’mobign zuriyaw gedel hono
Yechigir arenqua fite tedeqeno
Eredat yat’ahugn bemeseleny gize
Fets’mo arakikign yelibé tikazé

VERSE 2
Amlake gulbeté haylé memekiyaye
T’elaṭ masafiriya ye’emenet gashayé
Endematitewign ahun awkialew
Kaléñ neger yilq beanté tamñalew

VERSE 3
Tiqitwan abzeteh lemitmegib geta
Yememelislh balageñ sit’ota

VERSE 4
Beqenem belelit lemiyabera
Menkir lebahriyew its’ub leanté sira

VERSE 5
Amlak hoy misgana leanté yigebahal
Letinishwa gojo bereket set’tehal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'adrigeh-lignalen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አድርገህልኛልና በቸርነትህ
አመሰግንሃለሁ እልል እልል
ለዓለመ ዓለም አማኑኤል /2/
እገዛልሃለሁ መድሃኒዓለም /2/

VERSE 1
ቀኑ ጨልሞብኝ ዙሪያው ገደል ሆኖ
የችግር አረንቋ ፊቴ ተደቅኖ
እረዳት ያጣሁኝ በመሰለኝ ጊዜ
ፈጽሞ አራቅክልኝ የልቤን ትካዜ

CHORUS
አድርገህልኛልና በቸርነትህ
አመሰግንሃለሁ እልል እልል
ለዓለመ ዓለም አማኑኤል /2/
እገዛልሃለሁ መድሃኒዓለም /2/

VERSE 2
አምላኬ ጉልበቴ ሐይሌ መመኪያዬ
ጠላት ማሳፈሪያ የእምነት ጋሻዬ
እንደማትተወኝ አሁን አውቂአለሁ
ካለኝ ነገር ይልቅ በአንተ ታምኛለሁ

CHORUS
አድርገህልኛልና በቸርነትህ
አመሰግንሃለሁ እልል እልል
ለዓለመ ዓለም አማኑኤል /2/
እገዛልሃለሁ መድሃኒዓለም /2/

VERSE 3
ጥቂቷን አብዝተህ ለምትመግብ ጌታ
የምመልስልህ ባላገኝ ስጦታ

CHORUS
አድርገህልኛልና በቸርነትህ
አመሰግንሃለሁ እልል እልል
ለዓለመ ዓለም አማኑኤል /2/
እገዛልሃለሁ መድሃኒዓለም /2/

VERSE 4
በቀንም በሌትም ለሚያበራ
መንክር ለባህሪይው እጹብ ለአንተ ስራ

CHORUS
አድርገህልኛልና በቸርነትህ
አመሰግንሃለሁ እልል እልል
ለዓለመ ዓለም አማኑኤል /2/
እገዛልሃለሁ መድሃኒዓለም /2/

VERSE 5
አምላክ ሆይ ምስጋና ለአንተ ይገባሃል
ለትንሿ ጎጆ በረከት ሰጥተሃል

CHORUS
አድርገህልኛልና በቸርነትህ
አመሰግንሃለሁ እልል እልል
ለዓለመ ዓለም አማኑኤል /2/
እገዛልሃለሁ መድሃኒዓለም /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adrigeh lignalen becherneth
Ameseginalew illil illil
Lealeme alem Amanuel (x2)
Egezalehulehu Medhanealem (x2)

VERSE 1
Qenu chel’mobign zuriyaw gedel hono
Yechigir arenqua fite tedeqeno
Eredat yat’ahugn bemeseleny gize
Fets’mo arakikign yelibé tikazé

CHORUS
Adrigeh lignalen becherneth
Ameseginalew illil illil
Lealeme alem Amanuel (x2)
Egezalehulehu Medhanealem (x2)

VERSE 2
Amlake gulbeté haylé memekiyaye
T’elaṭ masafiriya ye’emenet gashayé
Endematitewign ahun awkialew
Kaléñ neger yilq beanté tamñalew

CHORUS
Adrigeh lignalen becherneth
Ameseginalew illil illil
Lealeme alem Amanuel (x2)
Egezalehulehu Medhanealem (x2)

VERSE 3
Tiqitwan abzeteh lemitmegib geta
Yememelislh balageñ sit’ota

CHORUS
Adrigeh lignalen becherneth
Ameseginalew illil illil
Lealeme alem Amanuel (x2)
Egezalehulehu Medhanealem (x2)

VERSE 4
Beqenem belelit lemiyabera
Menkir lebahriyew its’ub leanté sira

CHORUS
Adrigeh lignalen becherneth
Ameseginalew illil illil
Lealeme alem Amanuel (x2)
Egezalehulehu Medhanealem (x2)

VERSE 5
Amlak hoy misgana leanté yigebahal
Letinishwa gojo bereket set’tehal

CHORUS
Adrigeh lignalen becherneth
Ameseginalew illil illil
Lealeme alem Amanuel (x2)
Egezalehulehu Medhanealem (x2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'adrigeh-lignalen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Agatami Ayidelem (agatami-ayidelem)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አጋጣሚ አይደለም መትረፊ መዳኔ
የጌታ ታምር ነዉ ኧረ ይገርማል የኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነዉ ዉዴ የተከተለ

VERSE 1
ማነዉ በዚያ በረሃ
ያበላኝ መና ያጠጣኝዉሃ
ማነዉ የደገፈኝ
ጥልቁን ሸለቆ ያሻገረኝ

VERSE 2
አንተነህ ለኔ እናት አባቴ
ፍጹም ወዳጀ ስጋና አጥቴ
አይኔ አይነቀል ከዙፍንህ
ፊት አያዞርም ፍቅር አይንህ

VERSE 3
ወሮኝ ድቅድቅ ጨለማ
ተስፋዬ ደክሞ ልቤ ሲደማ
አይቶ ሲፈስ እባዬ
ዳመና ጠቅሶ መጣ ጌታዬ

VERSE 4
ጸሀይ ነዉና የብራን አምዴ
ኢየሱስ ለኔ ሕይወት መንገዴ
አልተሸነፍኩም ዉዴ አግዞኛል
መቃብር ደፍኖ ሕይወት ሰቶኛል

VERSE 5
ሲለይ ነፍስ ከስጋ
በጨለማ እንቅልፍ በክፉ አደጋ
ዳንኩኝ ሞት እያየኝ
የንስሀ እድሜ ጨመረልኝ

VERSE 6
በጽድቄ አይደለም የተረፍኩት
በርሱ ፍቅር ነዉ በርሱ ምህረት
ብቻዬን ሆኘ ሁሌ ማለቅሰዉ
እየበደልሁት ስላዳነኝ ነዉ

VERSE 7
ሞት ሆይ መዉጊያህ የታለ
ሁሉም ጥሎሀል እየታገለ
ሶኦል ድኗል ሀጥንህ
ባዶ ቀርተሃል ተበዝብዘህ

VERSE 8
በራሱ መንግስት ፈጥሮ ባላማ
የልጁን ህይወት ማንም አይቀማ
መቃብር ያልፍል ባገልግሎቴ
ተከፍቶልኛል ደጁ ያባቴ',
      lyrics_transliteration = 'Agat’ami aydelem metrefi medane
Yegeta tamr newu ኧre yigermal yene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta newu wude yeteketele

VERSE 1
Manewu beziya bereha
Yabelagn mena yat’et’agnwuha
Manewu yedegefegn
T’lqun sheleqo yashageregn

VERSE 2
Anteneh lene enat abate
Fits’um wedaje sigana at’te
Ayne ayneqel kezufnh
Fit ayazorm fiqr aynh

VERSE 3
Werogn diqdq ch’elema
Tesfaye dekmo libe sidema
Ayto sifes ebaye
Damena t’eqso met’a Getaye

VERSE 4
Ts’ehey newuna yebran amde
Iyesus lene hiywet mengede
Alteshenefkum wude agzognal
Meqabr defno hiywet setognal

VERSE 5
Siley nefs kesga
Bech’elema enqlf bekfu adega
Dankugn mot eyayegn
Yenshe edme ch’emerelgn

VERSE 6
Bets’dqe aydelem yeterefkut
Bersu fiqr newu bersu mihret
Bichayen hogne hule maleqsewu
Eyebedelhut siladanegn newu

VERSE 7
Mot hoy mewugiyah yetale
Hulum t’lohel eyetagele
Sool dinwal het’nh
Bado qertehal tebezbzeh

VERSE 8
Berasu mengst fet’ro balama
Yeljun hiywet manm ayqema
Meqabr yalfl bagelglote
Tekeftolgnal deju yabate',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'agatami-ayidelem'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አጋጣሚ አይደለም መትረፊ መዳኔ
የጌታ ታምር ነዉ ኧረ ይገርማል የኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነዉ ዉዴ የተከተለ

VERSE 1
ማነዉ በዚያ በረሃ
ያበላኝ መና ያጠጣኝዉሃ
ማነዉ የደገፈኝ
ጥልቁን ሸለቆ ያሻገረኝ

CHORUS
አጋጣሚ አይደለም መትረፊ መዳኔ
የጌታ ታምር ነዉ ኧረ ይገርማል የኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነዉ ዉዴ የተከተለ

VERSE 2
አንተነህ ለኔ እናት አባቴ
ፍጹም ወዳጀ ስጋና አጥቴ
አይኔ አይነቀል ከዙፍንህ
ፊት አያዞርም ፍቅር አይንህ

CHORUS
አጋጣሚ አይደለም መትረፊ መዳኔ
የጌታ ታምር ነዉ ኧረ ይገርማል የኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነዉ ዉዴ የተከተለ

VERSE 3
ወሮኝ ድቅድቅ ጨለማ
ተስፋዬ ደክሞ ልቤ ሲደማ
አይቶ ሲፈስ እባዬ
ዳመና ጠቅሶ መጣ ጌታዬ

CHORUS
አጋጣሚ አይደለም መትረፊ መዳኔ
የጌታ ታምር ነዉ ኧረ ይገርማል የኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነዉ ዉዴ የተከተለ

VERSE 4
ጸሀይ ነዉና የብራን አምዴ
ኢየሱስ ለኔ ሕይወት መንገዴ
አልተሸነፍኩም ዉዴ አግዞኛል
መቃብር ደፍኖ ሕይወት ሰቶኛል

CHORUS
አጋጣሚ አይደለም መትረፊ መዳኔ
የጌታ ታምር ነዉ ኧረ ይገርማል የኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነዉ ዉዴ የተከተለ

VERSE 5
ሲለይ ነፍስ ከስጋ
በጨለማ እንቅልፍ በክፉ አደጋ
ዳንኩኝ ሞት እያየኝ
የንስሀ እድሜ ጨመረልኝ

CHORUS
አጋጣሚ አይደለም መትረፊ መዳኔ
የጌታ ታምር ነዉ ኧረ ይገርማል የኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነዉ ዉዴ የተከተለ

VERSE 6
በጽድቄ አይደለም የተረፍኩት
በርሱ ፍቅር ነዉ በርሱ ምህረት
ብቻዬን ሆኘ ሁሌ ማለቅሰዉ
እየበደልሁት ስላዳነኝ ነዉ

CHORUS
አጋጣሚ አይደለም መትረፊ መዳኔ
የጌታ ታምር ነዉ ኧረ ይገርማል የኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነዉ ዉዴ የተከተለ

VERSE 7
ሞት ሆይ መዉጊያህ የታለ
ሁሉም ጥሎሀል እየታገለ
ሶኦል ድኗል ሀጥንህ
ባዶ ቀርተሃል ተበዝብዘህ

CHORUS
አጋጣሚ አይደለም መትረፊ መዳኔ
የጌታ ታምር ነዉ ኧረ ይገርማል የኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነዉ ዉዴ የተከተለ

VERSE 8
በራሱ መንግስት ፈጥሮ ባላማ
የልጁን ህይወት ማንም አይቀማ
መቃብር ያልፍል ባገልግሎቴ
ተከፍቶልኛል ደጁ ያባቴ

CHORUS
አጋጣሚ አይደለም መትረፊ መዳኔ
የጌታ ታምር ነዉ ኧረ ይገርማል የኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነዉ ዉዴ የተከተለ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Agat’ami aydelem metrefi medane
Yegeta tamr newu ኧre yigermal yene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta newu wude yeteketele

VERSE 1
Manewu beziya bereha
Yabelagn mena yat’et’agnwuha
Manewu yedegefegn
T’lqun sheleqo yashageregn

CHORUS
Agat’ami aydelem metrefi medane
Yegeta tamr newu ኧre yigermal yene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta newu wude yeteketele

VERSE 2
Anteneh lene enat abate
Fits’um wedaje sigana at’te
Ayne ayneqel kezufnh
Fit ayazorm fiqr aynh

CHORUS
Agat’ami aydelem metrefi medane
Yegeta tamr newu ኧre yigermal yene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta newu wude yeteketele

VERSE 3
Werogn diqdq ch’elema
Tesfaye dekmo libe sidema
Ayto sifes ebaye
Damena t’eqso met’a Getaye

CHORUS
Agat’ami aydelem metrefi medane
Yegeta tamr newu ኧre yigermal yene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta newu wude yeteketele

VERSE 4
Ts’ehey newuna yebran amde
Iyesus lene hiywet mengede
Alteshenefkum wude agzognal
Meqabr defno hiywet setognal

CHORUS
Agat’ami aydelem metrefi medane
Yegeta tamr newu ኧre yigermal yene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta newu wude yeteketele

VERSE 5
Siley nefs kesga
Bech’elema enqlf bekfu adega
Dankugn mot eyayegn
Yenshe edme ch’emerelgn

CHORUS
Agat’ami aydelem metrefi medane
Yegeta tamr newu ኧre yigermal yene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta newu wude yeteketele

VERSE 6
Bets’dqe aydelem yeterefkut
Bersu fiqr newu bersu mihret
Bichayen hogne hule maleqsewu
Eyebedelhut siladanegn newu

CHORUS
Agat’ami aydelem metrefi medane
Yegeta tamr newu ኧre yigermal yene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta newu wude yeteketele

VERSE 7
Mot hoy mewugiyah yetale
Hulum t’lohel eyetagele
Sool dinwal het’nh
Bado qertehal tebezbzeh

CHORUS
Agat’ami aydelem metrefi medane
Yegeta tamr newu ኧre yigermal yene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta newu wude yeteketele

VERSE 8
Berasu mengst fet’ro balama
Yeljun hiywet manm ayqema
Meqabr yalfl bagelglote
Tekeftolgnal deju yabate

CHORUS
Agat’ami aydelem metrefi medane
Yegeta tamr newu ኧre yigermal yene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta newu wude yeteketele'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'agatami-ayidelem', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Agetinibet Simihin (agetinibet-simihin)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 1
ተዋህዶ የአዳምን ስጋ
አማኑኤል ሆነ ከኛ ጋ
በግርግም በቤተልሔም
ተወልዶ ሆነልን ሰላም

VERSE 2
ብንጠግብ በልተን ጠጥተን
ብንገባም በሰላም ወጥተን
ልጆችን ወልደን ብንስም
ጠርተን ነው ጌታ ያንተን ስም

VERSE 3
ቢያምርብን ቢሞቀን ለብሰን
ብንረሳ ለቅሶና ኃዘን
ፍቅርህ ነው ዛሬን ያሳየን
ተመስገን እንልሀለን

VERSE 4
በባዕድ ሀገር ብንኖር
ቢገጥመን መከራ ችግር
ነጬን ልብስ ለብሰን ታይተናል
መስቀሉን ከማህተቡ ጋር

VERSE 5
በባዕድ ሀገር ብንኖር
ቢገጥመን መከራ ችግር
ነጩን ልብስ ለብሰን ታይተናል
መስቀሉን ከመሀተቡ ጋር',
      lyrics_transliteration = 'Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 1
Tewahedo yeadamn siga
Amanuel hone kegna ga
Begrgm bebetelhem
Teweldo honeln selam

VERSE 2
Bint’egb belten t’et’ten
Bingebam beselam wet’ten
Lijochn welden binsm
T’erten new Geta yanten sim

VERSE 3
Biyamrbn bimoqen lebsen
Binresa leqsona hazen
Fiqrh new zaren yasayen
Temesgen enlhelen

VERSE 4
Bebaed heger binnor
Biget’men mekera chgr
Nech’en libs lebsen taytenal
Mesqelun kemahtebu gar

VERSE 5
Bebaed heger binnor
Biget’men mekera chgr
Nech’un libs lebsen taytenal
Mesqelun kemehetebu gar',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'agetinibet-simihin'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 1
ተዋህዶ የአዳምን ስጋ
አማኑኤል ሆነ ከኛ ጋ
በግርግም በቤተልሔም
ተወልዶ ሆነልን ሰላም

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 2
ብንጠግብ በልተን ጠጥተን
ብንገባም በሰላም ወጥተን
ልጆችን ወልደን ብንስም
ጠርተን ነው ጌታ ያንተን ስም

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 3
ቢያምርብን ቢሞቀን ለብሰን
ብንረሳ ለቅሶና ኃዘን
ፍቅርህ ነው ዛሬን ያሳየን
ተመስገን እንልሀለን

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 4
በባዕድ ሀገር ብንኖር
ቢገጥመን መከራ ችግር
ነጬን ልብስ ለብሰን ታይተናል
መስቀሉን ከማህተቡ ጋር

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 5
በባዕድ ሀገር ብንኖር
ቢገጥመን መከራ ችግር
ነጩን ልብስ ለብሰን ታይተናል
መስቀሉን ከመሀተቡ ጋር

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 1
Tewahedo yeadamn siga
Amanuel hone kegna ga
Begrgm bebetelhem
Teweldo honeln selam

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 2
Bint’egb belten t’et’ten
Bingebam beselam wet’ten
Lijochn welden binsm
T’erten new Geta yanten sim

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 3
Biyamrbn bimoqen lebsen
Binresa leqsona hazen
Fiqrh new zaren yasayen
Temesgen enlhelen

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 4
Bebaed heger binnor
Biget’men mekera chgr
Nech’en libs lebsen taytenal
Mesqelun kemahtebu gar

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 5
Bebaed heger binnor
Biget’men mekera chgr
Nech’un libs lebsen taytenal
Mesqelun kemehetebu gar

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'agetinibet-simihin', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Agetnibet (agetnibet)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 1
ተዋህዶ የአዳምን ስጋ
አማኑኤል ሆነ ከኛ ጋ
በግርግም በቤተልሔም
ተወልዶ ሆነልን ሰላም

VERSE 2
ብንጠግብ በልተን ጠጥተን
ብንገባም በሰላም ወጥተን
ልጆችን ወልደን ብንስም
ጠርተን ነው ጌታ ያንተን ስም

VERSE 3
ቢያምርብን ቢሞቀን ለብሰን
ብንረሳ ለቅሶና ኃዘን
ፍቅርህ ነው ዛሬን ያሳየን
ተመስገን እንልሀለን

VERSE 4
በባዕድ ሀገር ብንኖር
ቢገጥመን መከራ ችግር
ነጩን ልብስ ለብሰን ታይተናል
መስቀሉን ከማህተቡ ጋር

VERSE 5
በባዕድ ሀገር ብንኖር
ቢገጥመን መከራ ችግር
ነጩን ልብስ ለብሰን ታይተናል
መስቀሉን ከማህተቡ ጋር',
      lyrics_transliteration = 'Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 1
Tewahedo yeadamn siga
Amanuel hone kegna ga
Begrgm bebetelhem
Teweldo honeln selam

VERSE 2
Bint’egb belten t’et’ten
Bingebam beselam wet’ten
Lijochn welden binsm
T’erten new Geta yanten sim

VERSE 3
Biyamrbn bimoqen lebsen
Binresa leqsona hazen
Fiqrh new zaren yasayen
Temesgen enlhelen

VERSE 4
Bebaed heger binnor
Biget’men mekera chgr
Nech’un libs lebsen taytenal
Mesqelun kemahtebu gar

VERSE 5
Bebaed heger binnor
Biget’men mekera chgr
Nech’un libs lebsen taytenal
Mesqelun kemahtebu gar',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'agetnibet'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 1
ተዋህዶ የአዳምን ስጋ
አማኑኤል ሆነ ከኛ ጋ
በግርግም በቤተልሔም
ተወልዶ ሆነልን ሰላም

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 2
ብንጠግብ በልተን ጠጥተን
ብንገባም በሰላም ወጥተን
ልጆችን ወልደን ብንስም
ጠርተን ነው ጌታ ያንተን ስም

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 3
ቢያምርብን ቢሞቀን ለብሰን
ብንረሳ ለቅሶና ኃዘን
ፍቅርህ ነው ዛሬን ያሳየን
ተመስገን እንልሀለን

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 4
በባዕድ ሀገር ብንኖር
ቢገጥመን መከራ ችግር
ነጩን ልብስ ለብሰን ታይተናል
መስቀሉን ከማህተቡ ጋር

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል

VERSE 5
በባዕድ ሀገር ብንኖር
ቢገጥመን መከራ ችግር
ነጩን ልብስ ለብሰን ታይተናል
መስቀሉን ከማህተቡ ጋር

CHORUS
አጌጥንበት ስምህን
ተዋብንበት ፍቅርህን
ሞገሳችን ሆነሀል
የጽድቅ ልብሳችን አማኑኤል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 1
Tewahedo yeadamn siga
Amanuel hone kegna ga
Begrgm bebetelhem
Teweldo honeln selam

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 2
Bint’egb belten t’et’ten
Bingebam beselam wet’ten
Lijochn welden binsm
T’erten new Geta yanten sim

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 3
Biyamrbn bimoqen lebsen
Binresa leqsona hazen
Fiqrh new zaren yasayen
Temesgen enlhelen

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 4
Bebaed heger binnor
Biget’men mekera chgr
Nech’un libs lebsen taytenal
Mesqelun kemahtebu gar

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel

VERSE 5
Bebaed heger binnor
Biget’men mekera chgr
Nech’un libs lebsen taytenal
Mesqelun kemahtebu gar

CHORUS
Aget’nbet simhn
Tewabnbet fiqrhn
Mogesachn honehel
Yets’dq libsachn Amanuel'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'agetnibet', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ahade Leke we Ahade le Musie (ahade-leke-we-ahade-lemuse)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አሐደ ለከ ወአሐደ ለሙሴ (2)
ወአሐደ ለኤልያስ ንግበር ማኅደረ (4)

VERSE 1
አሐደ ለከ ወአሐደ ለሙሴ (2)
ወአሐደ ለኤልያስ ንግበር ማኅደረ (4)',
      lyrics_transliteration = 'Ahade Leke we ahade le Musie (2)
We ahade le Eliase negber mahdere (4)

VERSE 1
Ahade Leke we ahade le Musie (2)
We ahade le Eliase negber mahdere (4)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ahade-leke-we-ahade-lemuse'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አሐደ ለከ ወአሐደ ለሙሴ (2)
ወአሐደ ለኤልያስ ንግበር ማኅደረ (4)

VERSE 1
አሐደ ለከ ወአሐደ ለሙሴ (2)
ወአሐደ ለኤልያስ ንግበር ማኅደረ (4)

CHORUS
አሐደ ለከ ወአሐደ ለሙሴ (2)
ወአሐደ ለኤልያስ ንግበር ማኅደረ (4)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ahade Leke we ahade le Musie (2)
We ahade le Eliase negber mahdere (4)

VERSE 1
Ahade Leke we ahade le Musie (2)
We ahade le Eliase negber mahdere (4)

CHORUS
Ahade Leke we ahade le Musie (2)
We ahade le Eliase negber mahdere (4)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ahade-leke-we-ahade-lemuse', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ahlifkayen (ahlifkayen-4188)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እተን ናይ እህህታ ለይትታተይ እተን ናይ እህህታ
እተን ናይ ቃንዛ እዋናተይ እተን ናይ ቃንዛ
ኣሕሊፍካየን ንስኻ "ኣሕሊፋካየን"
ኣሕሊፍካየን ንስኻ "ኣሕሊፋካየን"

VERSE 1
መሕብኢ ስኢና ነፍሰይ ከተእዊ እንከላ
ኣእጋረይ ወለል ኢለን ርኹምሽ ምስ በላ
ኩሉ ሃዲሙ ካብ ጥቕይ ክርሕቀኒ
ኣለኹ ኢልካ ንስኻ ግን ፍቕሪ ኣርኢኻኒ

VERSE 2
ኣብቲ ዝወግሕ ዘይመስል ድቕድቕ ጸላም
በቃ ኣብቂዑ''ዩ እንዳበልኩ ብጓሂ ክቐዝም
በኣይ እምበር ማዓስ በኣኻ እሞ ኣብቂዑ
ሰናያትካ እንድዩ ሂወተይ ደሚቑ ተኾልዑ

VERSE 3
ረሲዑኒ''ዩ እንዳበልኩ ዘማረርኩሉ
መዓልታት ናይ ዕሽነተይ ሎሚ እሕፍረሉ
ከመይ''ሉ እሞ ከኽእለካ ሕማቕ ናተይ
ከም መርዓት ዓይንኻ እንዲኻ ምሒር ትጥንቀቐለይ',
      lyrics_transliteration = 'Eten nay ehhta leyttatey eten nay ehhta
Eten nay qanza ewanatey eten nay qanza
Ahlifkayen nisኻ "ahlifakayen"
Ahlifkayen nisኻ "ahlifakayen"

VERSE 1
Mehbi siina nefsey keteewi enkela
Aegarey welel ilen riኹmsh mis bela
Kulu hadimu kab t’ቕy kirhqeni
Aleኹ ilka nisኻ gin fiቕri ariኻni

VERSE 2
Abti ziwegh zeymesl diቕdቕ ts’elam
Beqa abqiu''yu endabelku bigwahi kiቐzm
Beay ember maas beaኻ emo abqiu
Senayatka endyu hiwetey demiቑ teኾlu

VERSE 3
Resiuni''yu endabelku zemarerkulu
Mealtat nay eshnetey lomi ehfrelu
Kemey''lu emo keኽeleka himaቕ natey
Kem merat aynኻ endiኻ mihir tit’nqeቐley',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ahlifkayen-4188'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እተን ናይ እህህታ ለይትታተይ እተን ናይ እህህታ
እተን ናይ ቃንዛ እዋናተይ እተን ናይ ቃንዛ
ኣሕሊፍካየን ንስኻ "ኣሕሊፋካየን"
ኣሕሊፍካየን ንስኻ "ኣሕሊፋካየን"

VERSE 1
መሕብኢ ስኢና ነፍሰይ ከተእዊ እንከላ
ኣእጋረይ ወለል ኢለን ርኹምሽ ምስ በላ
ኩሉ ሃዲሙ ካብ ጥቕይ ክርሕቀኒ
ኣለኹ ኢልካ ንስኻ ግን ፍቕሪ ኣርኢኻኒ

CHORUS
እተን ናይ እህህታ ለይትታተይ እተን ናይ እህህታ
እተን ናይ ቃንዛ እዋናተይ እተን ናይ ቃንዛ
ኣሕሊፍካየን ንስኻ "ኣሕሊፋካየን"
ኣሕሊፍካየን ንስኻ "ኣሕሊፋካየን"

VERSE 2
ኣብቲ ዝወግሕ ዘይመስል ድቕድቕ ጸላም
በቃ ኣብቂዑ''ዩ እንዳበልኩ ብጓሂ ክቐዝም
በኣይ እምበር ማዓስ በኣኻ እሞ ኣብቂዑ
ሰናያትካ እንድዩ ሂወተይ ደሚቑ ተኾልዑ

CHORUS
እተን ናይ እህህታ ለይትታተይ እተን ናይ እህህታ
እተን ናይ ቃንዛ እዋናተይ እተን ናይ ቃንዛ
ኣሕሊፍካየን ንስኻ "ኣሕሊፋካየን"
ኣሕሊፍካየን ንስኻ "ኣሕሊፋካየን"

VERSE 3
ረሲዑኒ''ዩ እንዳበልኩ ዘማረርኩሉ
መዓልታት ናይ ዕሽነተይ ሎሚ እሕፍረሉ
ከመይ''ሉ እሞ ከኽእለካ ሕማቕ ናተይ
ከም መርዓት ዓይንኻ እንዲኻ ምሒር ትጥንቀቐለይ

CHORUS
እተን ናይ እህህታ ለይትታተይ እተን ናይ እህህታ
እተን ናይ ቃንዛ እዋናተይ እተን ናይ ቃንዛ
ኣሕሊፍካየን ንስኻ "ኣሕሊፋካየን"
ኣሕሊፍካየን ንስኻ "ኣሕሊፋካየን"'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eten nay ehhta leyttatey eten nay ehhta
Eten nay qanza ewanatey eten nay qanza
Ahlifkayen nisኻ "ahlifakayen"
Ahlifkayen nisኻ "ahlifakayen"

VERSE 1
Mehbi siina nefsey keteewi enkela
Aegarey welel ilen riኹmsh mis bela
Kulu hadimu kab t’ቕy kirhqeni
Aleኹ ilka nisኻ gin fiቕri ariኻni

CHORUS
Eten nay ehhta leyttatey eten nay ehhta
Eten nay qanza ewanatey eten nay qanza
Ahlifkayen nisኻ "ahlifakayen"
Ahlifkayen nisኻ "ahlifakayen"

VERSE 2
Abti ziwegh zeymesl diቕdቕ ts’elam
Beqa abqiu''yu endabelku bigwahi kiቐzm
Beay ember maas beaኻ emo abqiu
Senayatka endyu hiwetey demiቑ teኾlu

CHORUS
Eten nay ehhta leyttatey eten nay ehhta
Eten nay qanza ewanatey eten nay qanza
Ahlifkayen nisኻ "ahlifakayen"
Ahlifkayen nisኻ "ahlifakayen"

VERSE 3
Resiuni''yu endabelku zemarerkulu
Mealtat nay eshnetey lomi ehfrelu
Kemey''lu emo keኽeleka himaቕ natey
Kem merat aynኻ endiኻ mihir tit’nqeቐley

CHORUS
Eten nay ehhta leyttatey eten nay ehhta
Eten nay qanza ewanatey eten nay qanza
Ahlifkayen nisኻ "ahlifakayen"
Ahlifkayen nisኻ "ahlifakayen"'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ahlifkayen-4188', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Akilile Tsige Mariyam (akilile-tsige-mariyam)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አክሊለ ፅጌ ማሪያም
አክሊለ ፅጌ ማርያም
አክሊለ ፅጌ ማርያም
ቀፀላ መንገስቱ መንግስቱ ለጊዮርጊስ

VERSE 1
ክበበ ጊራ ወርቅ አክልለ ፅጌ',
      lyrics_transliteration = 'Aklile ts’ge mariyam
Aklile ts’ge Maryam
Aklile ts’ge Maryam
Qets’ela mengestu mengstu legiyorgis

VERSE 1
Kibebe gira werq aklle ts’ge',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'akilile-tsige-mariyam'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አክሊለ ፅጌ ማሪያም
አክሊለ ፅጌ ማርያም
አክሊለ ፅጌ ማርያም
ቀፀላ መንገስቱ መንግስቱ ለጊዮርጊስ

VERSE 1
ክበበ ጊራ ወርቅ አክልለ ፅጌ

CHORUS
አክሊለ ፅጌ ማሪያም
አክሊለ ፅጌ ማርያም
አክሊለ ፅጌ ማርያም
ቀፀላ መንገስቱ መንግስቱ ለጊዮርጊስ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aklile ts’ge mariyam
Aklile ts’ge Maryam
Aklile ts’ge Maryam
Qets’ela mengestu mengstu legiyorgis

VERSE 1
Kibebe gira werq aklle ts’ge

CHORUS
Aklile ts’ge mariyam
Aklile ts’ge Maryam
Aklile ts’ge Maryam
Qets’ela mengestu mengstu legiyorgis'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'akilile-tsige-mariyam', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Akim Ataw Zemari Yeabikal Desalegn (akim-ataw-zemari-yeabikal-desalegn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ

VERSE 1
ምቾት ሆኖኝ ለሥጋዬ የኃጢአት አልጋ
የማስበው ሌላ የለ መሸም ነጋ
ልቤ ካንተ መሸፈቱን እያወከው
በሬ ቆመህ ማንኳኳትህ ለምንድን ነው

VERSE 2
ፍቅር ስቦህ ከሰማያት ወርደህ ለኔ
ምን አዚም ነው ማስተዋልን ያጣሁ እኔ
እየሰማሁ እንዳልሰማ ዝም ማለቴ
ቢበዛ ነው ያስቀየምኩህ ነውር ኃጢአቴ

VERSE 3
ግባ ቤቴ ብዬ ልልህ አቅም አጣው
ነውሬ በዝቶ በኃጢአቴ የከረፋው
ልቤ ለዓለም አፌ ላንተ በመሆኑ
አይታይም ደምህ በሬ በመቃኑ

VERSE 4
ስትንኳኳ እንቢ ያልኩኝ ምዘገየው
በዓለም ፍቅር እኔነቴ ነዶብኝ ነው
የእንባ መባዕ ባይኔ አቅፌ ቤትህ ልምጣ
በፍቅር እንጂ በበትርህ መች ትቀጣ',
      lyrics_transliteration = 'Sitankwakwa eyesemahu aqm at’aw lemekfet
Asafrogn yene sira qomo mayet yanten fit
Balts’eda bet beren bikeft yene Geta endtgeba
Bizu bedel tagegnaleh bizu enba yemiyasneba

VERSE 1
Michot honogn lesgaye yehat’iat alga
Yemasbew lela yele meshem nega
Libe kante meshefetun eyawekew
Bere qomeh mankwakwath lemndn new

VERSE 2
Fiqr siboh kesemayat werdeh lene
Min azim new mastewaln yat’ahu ene
Eyesemahu endalsema zim malete
Bibeza new yasqeyemkuh newr hat’iate

VERSE 3
Giba bete biye lilh aqm at’aw
Newre bezto behat’iate yekerefaw
Libe lealem afe lante bemehonu
Aytaym demh bere bemeqanu

VERSE 4
Sitnkwakwa enbi yalkugn mizegeyew
Bealem fiqr enenete nedobgn new
Yeenba mebae bayne aqfe beth limt’a
Befqr enji bebetrh mech tiqet’a',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'akim-ataw-zemari-yeabikal-desalegn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ

VERSE 1
ምቾት ሆኖኝ ለሥጋዬ የኃጢአት አልጋ
የማስበው ሌላ የለ መሸም ነጋ
ልቤ ካንተ መሸፈቱን እያወከው
በሬ ቆመህ ማንኳኳትህ ለምንድን ነው

CHORUS
ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ

VERSE 2
ፍቅር ስቦህ ከሰማያት ወርደህ ለኔ
ምን አዚም ነው ማስተዋልን ያጣሁ እኔ
እየሰማሁ እንዳልሰማ ዝም ማለቴ
ቢበዛ ነው ያስቀየምኩህ ነውር ኃጢአቴ

CHORUS
ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ

VERSE 3
ግባ ቤቴ ብዬ ልልህ አቅም አጣው
ነውሬ በዝቶ በኃጢአቴ የከረፋው
ልቤ ለዓለም አፌ ላንተ በመሆኑ
አይታይም ደምህ በሬ በመቃኑ

CHORUS
ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ

VERSE 4
ስትንኳኳ እንቢ ያልኩኝ ምዘገየው
በዓለም ፍቅር እኔነቴ ነዶብኝ ነው
የእንባ መባዕ ባይኔ አቅፌ ቤትህ ልምጣ
በፍቅር እንጂ በበትርህ መች ትቀጣ

CHORUS
ስታንኳኳ እየሰማሁ አቅም አጣው ለመክፈት
አሳፍሮኝ የኔ ሥራ ቆሞ ማየት ያንተን ፊት
ባልጸዳ ቤት በሬን ብከፍት የኔ ጌታ እንድትገባ
ብዙ በደል ታገኛለህ ብዙ እንባ የሚያስነባ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sitankwakwa eyesemahu aqm at’aw lemekfet
Asafrogn yene sira qomo mayet yanten fit
Balts’eda bet beren bikeft yene Geta endtgeba
Bizu bedel tagegnaleh bizu enba yemiyasneba

VERSE 1
Michot honogn lesgaye yehat’iat alga
Yemasbew lela yele meshem nega
Libe kante meshefetun eyawekew
Bere qomeh mankwakwath lemndn new

CHORUS
Sitankwakwa eyesemahu aqm at’aw lemekfet
Asafrogn yene sira qomo mayet yanten fit
Balts’eda bet beren bikeft yene Geta endtgeba
Bizu bedel tagegnaleh bizu enba yemiyasneba

VERSE 2
Fiqr siboh kesemayat werdeh lene
Min azim new mastewaln yat’ahu ene
Eyesemahu endalsema zim malete
Bibeza new yasqeyemkuh newr hat’iate

CHORUS
Sitankwakwa eyesemahu aqm at’aw lemekfet
Asafrogn yene sira qomo mayet yanten fit
Balts’eda bet beren bikeft yene Geta endtgeba
Bizu bedel tagegnaleh bizu enba yemiyasneba

VERSE 3
Giba bete biye lilh aqm at’aw
Newre bezto behat’iate yekerefaw
Libe lealem afe lante bemehonu
Aytaym demh bere bemeqanu

CHORUS
Sitankwakwa eyesemahu aqm at’aw lemekfet
Asafrogn yene sira qomo mayet yanten fit
Balts’eda bet beren bikeft yene Geta endtgeba
Bizu bedel tagegnaleh bizu enba yemiyasneba

VERSE 4
Sitnkwakwa enbi yalkugn mizegeyew
Bealem fiqr enenete nedobgn new
Yeenba mebae bayne aqfe beth limt’a
Befqr enji bebetrh mech tiqet’a

CHORUS
Sitankwakwa eyesemahu aqm at’aw lemekfet
Asafrogn yene sira qomo mayet yanten fit
Balts’eda bet beren bikeft yene Geta endtgeba
Bizu bedel tagegnaleh bizu enba yemiyasneba'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'akim-ataw-zemari-yeabikal-desalegn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: akime ante neh (akime-ante-neh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አቅሜ አንተ ነህ ጌታዬ ጉልበቴ
ሁሌ የምታኖረኝ አምላኬ ውበቴ
የህይወቴ መሪ አንተ ነህ መድህኔ
በረከት ያደልከኝ ገብተህ ከድንኳኔ

VERSE 1
የቀረህ ቢመስለኝ ቢያቅተኝ መታገስ
ጩኸቴን አበዛሁ እንባዬን በማፍሰስ
በአንተ ዝምታ ውስጥ ተገኘልኝ መልሴ
ዝም ያልክ ቢመስልም መልስ አለህ ጌታዬ 2

VERSE 2
ሁሉንም እሻለሁ ሁሉንም ማግኘት
አንዱን ስትሰጠኝ ያንንም ማለት
አንተ ታውቀዋለህ የሚያስፈልገኝን
ለእኔ አታድርገው ከአንተ የሚለየኝን 2

VERSE 3
ድክመቴን ታውቃለህ የእምነቴ ልኩን
ልቤን ለአንተ ብዬ እንደማልታመን
ማጉረምረም ባበዛ አትስጠኝ ለምኞቴ
በመንገድህ ምራኝ ቀድመኸኝ ከፊቴ 2

VERSE 4
ብርቱ ሰልፍ እንኳ ቢሆንም ህይወቴ
ቸርነትህ ሞልቷል ዛሬም በጉድለቴ
የስንፍና ቃላት አይወጣም ከአፌ
ቢጎድል ቢሞላም በአንተ ነው ተስፋዬ 2',
      lyrics_transliteration = 'Aqme ante neh Getaye gulbete
Hule yemtanoregn amlake wibete
Yehywete meri ante neh medhne
Bereket yadelkegn gebteh kednkwane

VERSE 1
Yeqereh bimeslegn biyaqtegn metages
Ch’uኸten abezahu enbayen bemafses
Beante zimta wist’ tegegnelgn melse
Zim yalk bimeslm mels aleh Getaye 2

VERSE 2
Hulunm eshalehu hulunm maggnet
Andun sitset’egn yannm malet
Ante tawqewaleh yemiyasfelgegnn
Leene atadrgew keante yemileyegnn 2

VERSE 3
Dikmeten tawqaleh yeemnete likun
Liben leante biye endemaltamen
Maguremrem babeza atst’egn lemgnote
Bemengedh miragn qedmeኸgn kefite 2

VERSE 4
Birtu self enkwa bihonm hiywete
Cherneth moltwal zarem begudlete
Yesnfna qalat aywet’am keafe
Bigodl bimolam beante new tesfaye 2',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'akime-ante-neh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አቅሜ አንተ ነህ ጌታዬ ጉልበቴ
ሁሌ የምታኖረኝ አምላኬ ውበቴ
የህይወቴ መሪ አንተ ነህ መድህኔ
በረከት ያደልከኝ ገብተህ ከድንኳኔ

VERSE 1
የቀረህ ቢመስለኝ ቢያቅተኝ መታገስ
ጩኸቴን አበዛሁ እንባዬን በማፍሰስ
በአንተ ዝምታ ውስጥ ተገኘልኝ መልሴ
ዝም ያልክ ቢመስልም መልስ አለህ ጌታዬ 2

CHORUS
አቅሜ አንተ ነህ ጌታዬ ጉልበቴ
ሁሌ የምታኖረኝ አምላኬ ውበቴ
የህይወቴ መሪ አንተ ነህ መድህኔ
በረከት ያደልከኝ ገብተህ ከድንኳኔ

VERSE 2
ሁሉንም እሻለሁ ሁሉንም ማግኘት
አንዱን ስትሰጠኝ ያንንም ማለት
አንተ ታውቀዋለህ የሚያስፈልገኝን
ለእኔ አታድርገው ከአንተ የሚለየኝን 2

CHORUS
አቅሜ አንተ ነህ ጌታዬ ጉልበቴ
ሁሌ የምታኖረኝ አምላኬ ውበቴ
የህይወቴ መሪ አንተ ነህ መድህኔ
በረከት ያደልከኝ ገብተህ ከድንኳኔ

VERSE 3
ድክመቴን ታውቃለህ የእምነቴ ልኩን
ልቤን ለአንተ ብዬ እንደማልታመን
ማጉረምረም ባበዛ አትስጠኝ ለምኞቴ
በመንገድህ ምራኝ ቀድመኸኝ ከፊቴ 2

CHORUS
አቅሜ አንተ ነህ ጌታዬ ጉልበቴ
ሁሌ የምታኖረኝ አምላኬ ውበቴ
የህይወቴ መሪ አንተ ነህ መድህኔ
በረከት ያደልከኝ ገብተህ ከድንኳኔ

VERSE 4
ብርቱ ሰልፍ እንኳ ቢሆንም ህይወቴ
ቸርነትህ ሞልቷል ዛሬም በጉድለቴ
የስንፍና ቃላት አይወጣም ከአፌ
ቢጎድል ቢሞላም በአንተ ነው ተስፋዬ 2

CHORUS
አቅሜ አንተ ነህ ጌታዬ ጉልበቴ
ሁሌ የምታኖረኝ አምላኬ ውበቴ
የህይወቴ መሪ አንተ ነህ መድህኔ
በረከት ያደልከኝ ገብተህ ከድንኳኔ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aqme ante neh Getaye gulbete
Hule yemtanoregn amlake wibete
Yehywete meri ante neh medhne
Bereket yadelkegn gebteh kednkwane

VERSE 1
Yeqereh bimeslegn biyaqtegn metages
Ch’uኸten abezahu enbayen bemafses
Beante zimta wist’ tegegnelgn melse
Zim yalk bimeslm mels aleh Getaye 2

CHORUS
Aqme ante neh Getaye gulbete
Hule yemtanoregn amlake wibete
Yehywete meri ante neh medhne
Bereket yadelkegn gebteh kednkwane

VERSE 2
Hulunm eshalehu hulunm maggnet
Andun sitset’egn yannm malet
Ante tawqewaleh yemiyasfelgegnn
Leene atadrgew keante yemileyegnn 2

CHORUS
Aqme ante neh Getaye gulbete
Hule yemtanoregn amlake wibete
Yehywete meri ante neh medhne
Bereket yadelkegn gebteh kednkwane

VERSE 3
Dikmeten tawqaleh yeemnete likun
Liben leante biye endemaltamen
Maguremrem babeza atst’egn lemgnote
Bemengedh miragn qedmeኸgn kefite 2

CHORUS
Aqme ante neh Getaye gulbete
Hule yemtanoregn amlake wibete
Yehywete meri ante neh medhne
Bereket yadelkegn gebteh kednkwane

VERSE 4
Birtu self enkwa bihonm hiywete
Cherneth moltwal zarem begudlete
Yesnfna qalat aywet’am keafe
Bigodl bimolam beante new tesfaye 2

CHORUS
Aqme ante neh Getaye gulbete
Hule yemtanoregn amlake wibete
Yehywete meri ante neh medhne
Bereket yadelkegn gebteh kednkwane'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'akime-ante-neh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Aklilachen Nesh Wubetachen (aklilachen-nesh-wubetachen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል

VERSE 1
ፍሬ የሞላብሽ መልካሟ ተክል
መፈወሻችን የሕይወት ጠበል
በምልጃሽ ፋና ዓይናችን በርቶ
ክብርሽን አየን በብርሃን ፈክቶ

VERSE 2
ጨው የሞላብሽ አዲስ ማሰሮ
ዓለም ጣፈጠ ምሬት ተሽሮ
ተለውጠናል አዲስ ሆነናል
ድንግል ለክብርሽ እጅ ነስተናል

VERSE 3
መሰረቶችሽ የተቀደሱ
ክብርና ግርማ ጽድቅ የለበሱ
እንከን የሌለሽ ንፁህ ተራራ
በልጅሽ ፀዳል ዓለሙ በራ

VERSE 4
ውዳሴሽ በዛ በአፋችን
ፍቅርሽ ታተመ በልባችን
ማርያም (2) ነው አዲስ ምስጋና
ለንጉሱ እናት ይገባልና',
      lyrics_transliteration = 'Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal

VERSE 1
Fere yemolabsih melkamua tekel
Mefeweshachen yehiywet tebel
Bemeljash fana ayinachen berto
Kibrishn ayen bebrihan fekto

VERSE 2
Chew yemolabsih addis masero
Alem tafete miret teshiro
Telowetenal addis honenal
Dingil lekibrish ej nestenal

VERSE 3
Meseretochish yeteqedesu
Kibrina girma tsidiq yelebesu
Enken yelelesh nitsuh terara
Belijish tsedal alemu bera

VERSE 4
Wudasesh beza beafachen
Fiqrish tateme belibachen
Mariyam (2) new addis misgana
Lenigusu enat yigebalina',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'aklilachen-nesh-wubetachen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል

VERSE 1
ፍሬ የሞላብሽ መልካሟ ተክል
መፈወሻችን የሕይወት ጠበል
በምልጃሽ ፋና ዓይናችን በርቶ
ክብርሽን አየን በብርሃን ፈክቶ

CHORUS
አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል

VERSE 2
ጨው የሞላብሽ አዲስ ማሰሮ
ዓለም ጣፈጠ ምሬት ተሽሮ
ተለውጠናል አዲስ ሆነናል
ድንግል ለክብርሽ እጅ ነስተናል

CHORUS
አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል

VERSE 3
መሰረቶችሽ የተቀደሱ
ክብርና ግርማ ጽድቅ የለበሱ
እንከን የሌለሽ ንፁህ ተራራ
በልጅሽ ፀዳል ዓለሙ በራ

CHORUS
አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል

VERSE 4
ውዳሴሽ በዛ በአፋችን
ፍቅርሽ ታተመ በልባችን
ማርያም (2) ነው አዲስ ምስጋና
ለንጉሱ እናት ይገባልና

CHORUS
አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal

VERSE 1
Fere yemolabsih melkamua tekel
Mefeweshachen yehiywet tebel
Bemeljash fana ayinachen berto
Kibrishn ayen bebrihan fekto

CHORUS
Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal

VERSE 2
Chew yemolabsih addis masero
Alem tafete miret teshiro
Telowetenal addis honenal
Dingil lekibrish ej nestenal

CHORUS
Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal

VERSE 3
Meseretochish yeteqedesu
Kibrina girma tsidiq yelebesu
Enken yelelesh nitsuh terara
Belijish tsedal alemu bera

CHORUS
Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal

VERSE 4
Wudasesh beza beafachen
Fiqrish tateme belibachen
Mariyam (2) new addis misgana
Lenigusu enat yigebalina

CHORUS
Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'aklilachen-nesh-wubetachen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Aklile Nesh (aklile-nesh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አክሊሌ ነሽ ማርያም ሞገሴ ነሽ
አክሊሌ ነሽ(2) ማርያም ሞገሴ ነሽ
ዮሴፍም ይናገር በስደት ተጽናንቷል
ያዕቆብም ብሕልሙ መሰላሉን ዓይቷል

VERSE 1
የበገናው ምሥጢር ምን እንደነበረ
ጽዮን ሆይ እያለ ዳዊት መሰከረ
ትውልድ እንዲጠቀም ስምሽን አንስቶ
እንኋት ብሎናል ጌታ ተሰውቶ

VERSE 2
የፍቅር ስጦታ የድሆች እናት
የክብር አክሊል ናት ዘውድ ሽልማት
ሙሴ በበረሀ ምን ተገለጥልህ
ሀመልማል በእሳት ሳይቃጠል ዓይተህ

VERSE 3
ነቢያት ተነሱ ትንቢት ተፈጽሟል
ቃል ከሰማይ ወርዶ ሥጋን ተዋህዷል
ለዓለም ሞኝነት ነው በስምሽ ማመኑ
ተአምርሽን መስማቱ ውዳሴን መድገሙ

VERSE 4
እኔስ ምስክር ነኝ ዛሬም ለዘለዓለም
ማርያም ሳይጠሩ ከቶ መጽደቅ የለም',
      lyrics_transliteration = 'Aklile nesh Maryam mogese nesh
Aklile nesh (2) Maryam mogese nesh
Yosefm yinager besdet tets’nantwal
Yaeqobm bihlmu meselalun aytwal

VERSE 1
Yebegenaw mist’ir min endenebere
Ts’yon hoy eyale dawit mesekere
Tiwld endit’eqem simshn ansto
Enhwat bilonal Geta tesewto

VERSE 2
Yefqr sit’ota yedhoch enat
Yekbr aklil nat zewd shlmat
Muse beberehe min tegelet’lh
Hemelmal beesat sayqat’el ayteh

VERSE 3
Nebiyat tenesu tinbit tefets’mwal
Qal kesemay werdo sigan tewahdwal
Lealem mognnet new besmsh mamenu
Teamrshn mesmatu widasen medgemu

VERSE 4
Enes miskr negn zarem lezelealem
Maryam sayt’eru keto mets’deq yelem',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'aklile-nesh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አክሊሌ ነሽ ማርያም ሞገሴ ነሽ
አክሊሌ ነሽ(2) ማርያም ሞገሴ ነሽ
ዮሴፍም ይናገር በስደት ተጽናንቷል
ያዕቆብም ብሕልሙ መሰላሉን ዓይቷል

VERSE 1
የበገናው ምሥጢር ምን እንደነበረ
ጽዮን ሆይ እያለ ዳዊት መሰከረ
ትውልድ እንዲጠቀም ስምሽን አንስቶ
እንኋት ብሎናል ጌታ ተሰውቶ

CHORUS
አክሊሌ ነሽ ማርያም ሞገሴ ነሽ
አክሊሌ ነሽ(2) ማርያም ሞገሴ ነሽ
ዮሴፍም ይናገር በስደት ተጽናንቷል
ያዕቆብም ብሕልሙ መሰላሉን ዓይቷል

VERSE 2
የፍቅር ስጦታ የድሆች እናት
የክብር አክሊል ናት ዘውድ ሽልማት
ሙሴ በበረሀ ምን ተገለጥልህ
ሀመልማል በእሳት ሳይቃጠል ዓይተህ

CHORUS
አክሊሌ ነሽ ማርያም ሞገሴ ነሽ
አክሊሌ ነሽ(2) ማርያም ሞገሴ ነሽ
ዮሴፍም ይናገር በስደት ተጽናንቷል
ያዕቆብም ብሕልሙ መሰላሉን ዓይቷል

VERSE 3
ነቢያት ተነሱ ትንቢት ተፈጽሟል
ቃል ከሰማይ ወርዶ ሥጋን ተዋህዷል
ለዓለም ሞኝነት ነው በስምሽ ማመኑ
ተአምርሽን መስማቱ ውዳሴን መድገሙ

CHORUS
አክሊሌ ነሽ ማርያም ሞገሴ ነሽ
አክሊሌ ነሽ(2) ማርያም ሞገሴ ነሽ
ዮሴፍም ይናገር በስደት ተጽናንቷል
ያዕቆብም ብሕልሙ መሰላሉን ዓይቷል

VERSE 4
እኔስ ምስክር ነኝ ዛሬም ለዘለዓለም
ማርያም ሳይጠሩ ከቶ መጽደቅ የለም

CHORUS
አክሊሌ ነሽ ማርያም ሞገሴ ነሽ
አክሊሌ ነሽ(2) ማርያም ሞገሴ ነሽ
ዮሴፍም ይናገር በስደት ተጽናንቷል
ያዕቆብም ብሕልሙ መሰላሉን ዓይቷል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aklile nesh Maryam mogese nesh
Aklile nesh (2) Maryam mogese nesh
Yosefm yinager besdet tets’nantwal
Yaeqobm bihlmu meselalun aytwal

VERSE 1
Yebegenaw mist’ir min endenebere
Ts’yon hoy eyale dawit mesekere
Tiwld endit’eqem simshn ansto
Enhwat bilonal Geta tesewto

CHORUS
Aklile nesh Maryam mogese nesh
Aklile nesh (2) Maryam mogese nesh
Yosefm yinager besdet tets’nantwal
Yaeqobm bihlmu meselalun aytwal

VERSE 2
Yefqr sit’ota yedhoch enat
Yekbr aklil nat zewd shlmat
Muse beberehe min tegelet’lh
Hemelmal beesat sayqat’el ayteh

CHORUS
Aklile nesh Maryam mogese nesh
Aklile nesh (2) Maryam mogese nesh
Yosefm yinager besdet tets’nantwal
Yaeqobm bihlmu meselalun aytwal

VERSE 3
Nebiyat tenesu tinbit tefets’mwal
Qal kesemay werdo sigan tewahdwal
Lealem mognnet new besmsh mamenu
Teamrshn mesmatu widasen medgemu

CHORUS
Aklile nesh Maryam mogese nesh
Aklile nesh (2) Maryam mogese nesh
Yosefm yinager besdet tets’nantwal
Yaeqobm bihlmu meselalun aytwal

VERSE 4
Enes miskr negn zarem lezelealem
Maryam sayt’eru keto mets’deq yelem

CHORUS
Aklile nesh Maryam mogese nesh
Aklile nesh (2) Maryam mogese nesh
Yosefm yinager besdet tets’nantwal
Yaeqobm bihlmu meselalun aytwal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'aklile-nesh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: #akotet_nay Like Mezemiran Yilima Hayilu Mezimur Bizemari Di/n Filimona Gebiru AKOTET ZEMARI D.N FILMONA GEBRU (akotet-nay-like-mezemiran-yilima-hayilu-mezimur-bizemari-di-n-filimona-g)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኣኮቴት ንዓኻ ይግባእ
ምስጋና ንዓኻ ይግባእ
ኣምልኾ ንዓኻ ይግባእ
ስግደት ንዓኻ ይግባእ

VERSE 1
ቅድሚ ዓለም ነይሩ ብዓቢ ስልጣኑ
ብኹነተ ስጋ ዝመፀ ሰብ ኮይኑ
ከምኡውን ዛዓለም ዘሕልፍ እዩ ጎይታ
እየሱስ ክርስቶስ ሓያል ናትና ዋልታ

VERSE 2
ብስጋ እንትሓምም ንኽሞት ኣብ መስቀል
ኣብ የማን ኣብ ነይሩ ካብ ዝፋን ኣይጎድልን
ትናይ ኣዳም ባህሪ ተዋህዶ ሚስጢሩ
ከምዚ እዩ ዝግለፅ ናይ ጎይታና ኽብሩ

VERSE 3
ካብ ቅድስት ስላሴ ዘይፍለ ምኽሩ
ጉድለት ዘይብሉ ትኽክል እዩ ኽብሩ
ናይ ኣብ ቃል ጥበቡ ቕልፅሙ ዝኾነ
ዓለም ዝፈጠረ ንኣዳም ኣድሓነ

VERSE 4
ሊቃነ መላእክት እዩሞ ሓይላቶም
ብዓብዪ ትሕትና የመስግንዎ እዮም
ንሱ ብምዃኑ ዘውዲ ኽብሪ ሞገስ
ይምስገን ዘልኣለም እየሱስ ክርስቶስ',
      lyrics_transliteration = 'Akotet niaኻ yigbae
Misgana niaኻ yigbae
Amlኾ niaኻ yigbae
Sigdet niaኻ yigbae

VERSE 1
Qidmi alem neyru biabi silt’anu
Biኹnete siga zimets’e seb koynu
Kemuwn zaalem zehlf eyu goyta
Eyesus Kristos hayal natna walta

VERSE 2
Bisga enthamm niኽmot ab mesqel
Ab yeman ab neyru kab zifan aygodln
Tinay adam bahri Tewahedo mist’iru
Kemzi eyu ziglets’ nay goytana ኽbru

VERSE 3
Kab Kidist Silassie zeyfle miኽru
Gudlet zeyblu tiኽkl eyu ኽbru
Nay ab qal t’bebu ቕlts’mu ziኾne
Alem zifet’ere niadam adhane

VERSE 4
Liqane melaekt eyumo haylatom
Biabyi tihtna yemesgnwo eyom
Nisu bimkhwanu zewdi ኽbri moges
Yimsgen zelalem eyesus Kristos',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'akotet-nay-like-mezemiran-yilima-hayilu-mezimur-bizemari-di-n-filimona-g'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣኮቴት ንዓኻ ይግባእ
ምስጋና ንዓኻ ይግባእ
ኣምልኾ ንዓኻ ይግባእ
ስግደት ንዓኻ ይግባእ

VERSE 1
ቅድሚ ዓለም ነይሩ ብዓቢ ስልጣኑ
ብኹነተ ስጋ ዝመፀ ሰብ ኮይኑ
ከምኡውን ዛዓለም ዘሕልፍ እዩ ጎይታ
እየሱስ ክርስቶስ ሓያል ናትና ዋልታ

CHORUS
ኣኮቴት ንዓኻ ይግባእ
ምስጋና ንዓኻ ይግባእ
ኣምልኾ ንዓኻ ይግባእ
ስግደት ንዓኻ ይግባእ

VERSE 2
ብስጋ እንትሓምም ንኽሞት ኣብ መስቀል
ኣብ የማን ኣብ ነይሩ ካብ ዝፋን ኣይጎድልን
ትናይ ኣዳም ባህሪ ተዋህዶ ሚስጢሩ
ከምዚ እዩ ዝግለፅ ናይ ጎይታና ኽብሩ

CHORUS
ኣኮቴት ንዓኻ ይግባእ
ምስጋና ንዓኻ ይግባእ
ኣምልኾ ንዓኻ ይግባእ
ስግደት ንዓኻ ይግባእ

VERSE 3
ካብ ቅድስት ስላሴ ዘይፍለ ምኽሩ
ጉድለት ዘይብሉ ትኽክል እዩ ኽብሩ
ናይ ኣብ ቃል ጥበቡ ቕልፅሙ ዝኾነ
ዓለም ዝፈጠረ ንኣዳም ኣድሓነ

CHORUS
ኣኮቴት ንዓኻ ይግባእ
ምስጋና ንዓኻ ይግባእ
ኣምልኾ ንዓኻ ይግባእ
ስግደት ንዓኻ ይግባእ

VERSE 4
ሊቃነ መላእክት እዩሞ ሓይላቶም
ብዓብዪ ትሕትና የመስግንዎ እዮም
ንሱ ብምዃኑ ዘውዲ ኽብሪ ሞገስ
ይምስገን ዘልኣለም እየሱስ ክርስቶስ

CHORUS
ኣኮቴት ንዓኻ ይግባእ
ምስጋና ንዓኻ ይግባእ
ኣምልኾ ንዓኻ ይግባእ
ስግደት ንዓኻ ይግባእ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Akotet niaኻ yigbae
Misgana niaኻ yigbae
Amlኾ niaኻ yigbae
Sigdet niaኻ yigbae

VERSE 1
Qidmi alem neyru biabi silt’anu
Biኹnete siga zimets’e seb koynu
Kemuwn zaalem zehlf eyu goyta
Eyesus Kristos hayal natna walta

CHORUS
Akotet niaኻ yigbae
Misgana niaኻ yigbae
Amlኾ niaኻ yigbae
Sigdet niaኻ yigbae

VERSE 2
Bisga enthamm niኽmot ab mesqel
Ab yeman ab neyru kab zifan aygodln
Tinay adam bahri Tewahedo mist’iru
Kemzi eyu ziglets’ nay goytana ኽbru

CHORUS
Akotet niaኻ yigbae
Misgana niaኻ yigbae
Amlኾ niaኻ yigbae
Sigdet niaኻ yigbae

VERSE 3
Kab Kidist Silassie zeyfle miኽru
Gudlet zeyblu tiኽkl eyu ኽbru
Nay ab qal t’bebu ቕlts’mu ziኾne
Alem zifet’ere niadam adhane

CHORUS
Akotet niaኻ yigbae
Misgana niaኻ yigbae
Amlኾ niaኻ yigbae
Sigdet niaኻ yigbae

VERSE 4
Liqane melaekt eyumo haylatom
Biabyi tihtna yemesgnwo eyom
Nisu bimkhwanu zewdi ኽbri moges
Yimsgen zelalem eyesus Kristos

CHORUS
Akotet niaኻ yigbae
Misgana niaኻ yigbae
Amlኾ niaኻ yigbae
Sigdet niaኻ yigbae'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'akotet-nay-like-mezemiran-yilima-hayilu-mezimur-bizemari-di-n-filimona-g', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Alasebebignim Hatiyaten (alasebebignim-hatiyaten)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አላሰበብኝም ሀጥያቴን
አልቆጠረብኝም በደሌን
በምህረት አይኖቹ ሁሌም ያየኛል
ጌታ በፍቅር ልቡ ይወደኛል

VERSE 1
ትቼው ወጥቼ ይመቸኝ ብዬ
በኃላ ሳዝን ሳለቅስ ቁጭ ብዬ
በደሌን አይቶ ሳይፀየፈኝ 2x
ልጄ ነው ብሎ በፍቅር አቀፈኝ 2x

VERSE 2
ስደክም ስዝል ስኖር በሀጥያት
ከእሪያ ጋር ስመኝ መብላት
ለእግሮቼ ጫማ ለእጆቼ አንባር 2x
አደረገልኝ ድንቅ ነገር 2x

VERSE 3
ሀዘኔን ሽሮ ሆነን ደስታ
በአፌ ሞላው ሳቅና እልልታ
ቸር ሰው ወዳጅ ነው ሁሉን አፍሪቃ 2x
እንደርሱ ማነው ይቅር ባይ ማህሪ 2x

VERSE 4
ሁሉን አየሁት ሁሉን መዘንኩት
የነፍሴን ቤዛ ጌታን ወደድኩት
ይራራልኛል ከቶ አይጥለኝም
ከእርሱ የሚበልጥ ወዳጅ የለኝም

VERSE 5
ይራራልኛል ከቶ አይጥለኝም
ከእርሱ የሚበልጥ አባት የለኝም',
      lyrics_transliteration = 'Alasebebgnm het’yaten
Alqot’erebgnm bedelen
Bemhret aynochu hulem yayegnal
Geta befqr libu yiwedegnal

VERSE 1
Tichew wet’che yimechegn biye
Behala sazn saleqs quch’ biye
Bedelen ayto sayts’eyefegn 2x
Lije new bilo befqr aqefegn 2x

VERSE 2
Sidekm sizl sinor behet’yat
Keeriya gar simegn meblat
Leegroche ch’ama leejoche anbar 2x
Aderegelgn dinq neger 2x

VERSE 3
Hezenen shro honen desta
Beafe molaw saqna ellta
Cher sew wedaj new hulun afriqa 2x
Endersu manew yiqr bay mahri 2x

VERSE 4
Hulun ayehut hulun mezenkut
Yenefsen beza getan wededkut
Yiraralgnal keto ayt’legnm
Keersu yemibelt’ wedaj yelegnm

VERSE 5
Yiraralgnal keto ayt’legnm
Keersu yemibelt’ abat yelegnm',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'alasebebignim-hatiyaten'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አላሰበብኝም ሀጥያቴን
አልቆጠረብኝም በደሌን
በምህረት አይኖቹ ሁሌም ያየኛል
ጌታ በፍቅር ልቡ ይወደኛል

VERSE 1
ትቼው ወጥቼ ይመቸኝ ብዬ
በኃላ ሳዝን ሳለቅስ ቁጭ ብዬ
በደሌን አይቶ ሳይፀየፈኝ 2x
ልጄ ነው ብሎ በፍቅር አቀፈኝ 2x

CHORUS
አላሰበብኝም ሀጥያቴን
አልቆጠረብኝም በደሌን
በምህረት አይኖቹ ሁሌም ያየኛል
ጌታ በፍቅር ልቡ ይወደኛል

VERSE 2
ስደክም ስዝል ስኖር በሀጥያት
ከእሪያ ጋር ስመኝ መብላት
ለእግሮቼ ጫማ ለእጆቼ አንባር 2x
አደረገልኝ ድንቅ ነገር 2x

CHORUS
አላሰበብኝም ሀጥያቴን
አልቆጠረብኝም በደሌን
በምህረት አይኖቹ ሁሌም ያየኛል
ጌታ በፍቅር ልቡ ይወደኛል

VERSE 3
ሀዘኔን ሽሮ ሆነን ደስታ
በአፌ ሞላው ሳቅና እልልታ
ቸር ሰው ወዳጅ ነው ሁሉን አፍሪቃ 2x
እንደርሱ ማነው ይቅር ባይ ማህሪ 2x

CHORUS
አላሰበብኝም ሀጥያቴን
አልቆጠረብኝም በደሌን
በምህረት አይኖቹ ሁሌም ያየኛል
ጌታ በፍቅር ልቡ ይወደኛል

VERSE 4
ሁሉን አየሁት ሁሉን መዘንኩት
የነፍሴን ቤዛ ጌታን ወደድኩት
ይራራልኛል ከቶ አይጥለኝም
ከእርሱ የሚበልጥ ወዳጅ የለኝም

CHORUS
አላሰበብኝም ሀጥያቴን
አልቆጠረብኝም በደሌን
በምህረት አይኖቹ ሁሌም ያየኛል
ጌታ በፍቅር ልቡ ይወደኛል

VERSE 5
ይራራልኛል ከቶ አይጥለኝም
ከእርሱ የሚበልጥ አባት የለኝም

CHORUS
አላሰበብኝም ሀጥያቴን
አልቆጠረብኝም በደሌን
በምህረት አይኖቹ ሁሌም ያየኛል
ጌታ በፍቅር ልቡ ይወደኛል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Alasebebgnm het’yaten
Alqot’erebgnm bedelen
Bemhret aynochu hulem yayegnal
Geta befqr libu yiwedegnal

VERSE 1
Tichew wet’che yimechegn biye
Behala sazn saleqs quch’ biye
Bedelen ayto sayts’eyefegn 2x
Lije new bilo befqr aqefegn 2x

CHORUS
Alasebebgnm het’yaten
Alqot’erebgnm bedelen
Bemhret aynochu hulem yayegnal
Geta befqr libu yiwedegnal

VERSE 2
Sidekm sizl sinor behet’yat
Keeriya gar simegn meblat
Leegroche ch’ama leejoche anbar 2x
Aderegelgn dinq neger 2x

CHORUS
Alasebebgnm het’yaten
Alqot’erebgnm bedelen
Bemhret aynochu hulem yayegnal
Geta befqr libu yiwedegnal

VERSE 3
Hezenen shro honen desta
Beafe molaw saqna ellta
Cher sew wedaj new hulun afriqa 2x
Endersu manew yiqr bay mahri 2x

CHORUS
Alasebebgnm het’yaten
Alqot’erebgnm bedelen
Bemhret aynochu hulem yayegnal
Geta befqr libu yiwedegnal

VERSE 4
Hulun ayehut hulun mezenkut
Yenefsen beza getan wededkut
Yiraralgnal keto ayt’legnm
Keersu yemibelt’ wedaj yelegnm

CHORUS
Alasebebgnm het’yaten
Alqot’erebgnm bedelen
Bemhret aynochu hulem yayegnal
Geta befqr libu yiwedegnal

VERSE 5
Yiraralgnal keto ayt’legnm
Keersu yemibelt’ abat yelegnm

CHORUS
Alasebebgnm het’yaten
Alqot’erebgnm bedelen
Bemhret aynochu hulem yayegnal
Geta befqr libu yiwedegnal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'alasebebignim-hatiyaten', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ale Bemenigisitu Sinigefa Yemiyay (ale-bemenigisitu-sinigefa-yemiyay)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 1
አይፈርድም ለምን ትላላችሁ
ጭካኔው ሲብስ እያያችሁ
ዝምታው የስራው ጊዜ ነው
ምሳሩ ከዛፉ በታች ነው

VERSE 2
በራሱ የጊዜ ቀመር
ይሰራል ከማንም ሳይመክር
ፈራጅ ነው እውነተኛ ዳኛ
ዘላለም ማይደክም የማይተኛ

VERSE 3
ናቡቴ ቢሞት ደሙ ፈሶ
በግፍ ዘንግ እርስቱ ተወርሶ
ሲፈርድ አይተናል በቶሎ
አክአብ ኤልዛቤልን ገድሎ

VERSE 4
በራሱ የጊዜ ቀመር

VERSE 5
ቢጥሉት በአንበሶች ጉድጓድ
ቅንነት በጎደለው ፍርድ
በጠሉት ሞት ተፈረደና
ዳንኤል ቆመ ለምስጋና

VERSE 6
በራሱ የጊዜ ቀመር

VERSE 7
ሳር ግጧል ናቡ ከደነፆር
ፈርኦን ተዘርቷል በባህር
ግፈኞች ቢኖሩም ዛሬ ነው
እመኑ ነገ የጌታ ነው

VERSE 8
በራሱ የጊዜ ቀመር',
      lyrics_transliteration = 'Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 1
Ayferdm lemn tilalachhu
Ch’kanew sibs eyayachhu
Zimtaw yesraw gize new
Misaru kezafu betach new

VERSE 2
Berasu yegize qemer
Yiseral kemanm saymekr
Feraj new ewnetegna dagna
Zelalem maydekm yemaytegna

VERSE 3
Nabute bimot demu feso
Begf zeng erstu tewerso
Siferd aytenal betolo
Akab elzabeln gedlo

VERSE 4
Berasu yegize qemer

VERSE 5
Bit’lut beanbesoch gudgwad
Qinnet begodelew fird
Bet’elut mot teferedena
Danel qome lemsgana

VERSE 6
Berasu yegize qemer

VERSE 7
Sar git’wal nabu kedenets’or
Feron tezertwal bebahr
Gifegnoch binorum zare new
Emenu nege yegeta new

VERSE 8
Berasu yegize qemer',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ale-bemenigisitu-sinigefa-yemiyay'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 1
አይፈርድም ለምን ትላላችሁ
ጭካኔው ሲብስ እያያችሁ
ዝምታው የስራው ጊዜ ነው
ምሳሩ ከዛፉ በታች ነው

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 2
በራሱ የጊዜ ቀመር
ይሰራል ከማንም ሳይመክር
ፈራጅ ነው እውነተኛ ዳኛ
ዘላለም ማይደክም የማይተኛ

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 3
ናቡቴ ቢሞት ደሙ ፈሶ
በግፍ ዘንግ እርስቱ ተወርሶ
ሲፈርድ አይተናል በቶሎ
አክአብ ኤልዛቤልን ገድሎ

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 4
በራሱ የጊዜ ቀመር

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 5
ቢጥሉት በአንበሶች ጉድጓድ
ቅንነት በጎደለው ፍርድ
በጠሉት ሞት ተፈረደና
ዳንኤል ቆመ ለምስጋና

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 6
በራሱ የጊዜ ቀመር

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 7
ሳር ግጧል ናቡ ከደነፆር
ፈርኦን ተዘርቷል በባህር
ግፈኞች ቢኖሩም ዛሬ ነው
እመኑ ነገ የጌታ ነው

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ

VERSE 8
በራሱ የጊዜ ቀመር

CHORUS
አለ በመንግስቱ አለ በሰማይ
ስንገፋ የሚያይ
አለ በአርያም አለ በከፍታ
የሚፈርደው ጌታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 1
Ayferdm lemn tilalachhu
Ch’kanew sibs eyayachhu
Zimtaw yesraw gize new
Misaru kezafu betach new

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 2
Berasu yegize qemer
Yiseral kemanm saymekr
Feraj new ewnetegna dagna
Zelalem maydekm yemaytegna

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 3
Nabute bimot demu feso
Begf zeng erstu tewerso
Siferd aytenal betolo
Akab elzabeln gedlo

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 4
Berasu yegize qemer

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 5
Bit’lut beanbesoch gudgwad
Qinnet begodelew fird
Bet’elut mot teferedena
Danel qome lemsgana

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 6
Berasu yegize qemer

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 7
Sar git’wal nabu kedenets’or
Feron tezertwal bebahr
Gifegnoch binorum zare new
Emenu nege yegeta new

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta

VERSE 8
Berasu yegize qemer

CHORUS
Ale bemengstu ale besemay
Singefa yemiyay
Ale bearyam ale bekefta
Yemiferdew Geta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ale-bemenigisitu-sinigefa-yemiyay', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Alegn Widase Belike Lisanat Cherinet Senay (alegn-widase-belike-lisanat-cherinet-senay)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 1
ክብሬን ጥዪልህ ዙፋንህ ፊት ኣለኝ ውዳሴ
የሜልኮን ንቀት መች ይታየኛል ኣለኝ ምስጋና
ፍቅርህ ፍርሃቴን ኣውልቆልኛል ኣለኝ ውዳሴ
ኣዝማች . . . . . . . .

VERSE 2
ስድቧን ቢያስወግድ መካኗን ሃና ኣለኝ ምስጋና
በልጆች ባርኮ ቢያደርጋት ቀና ኣለኝ ውዳሴ
ብላ ዘመረች ኣዋቂ ነህ ኣለኝ ምስጋና
የኔም ምስጋና ደርሷል ፊትህ ኣለኝ ውዳሴ

VERSE 3
ኣዝማች . . . . . . . .
ውሃው ቢፈላ ቢነድ እሳቱ ኣለኝ ምስጋና
በእጥፍ ንዱዋል ፍቅርህ ጽናቱ ኣለኝ ውዳሴ
ከቶ ኣላቆምም ቅኔና ዜማ ኣለኝ ምስጋና

VERSE 4
እስከ ምድር ጫፍ ማዳንህ ይሰማ ኣለኝ ውዳሴ
ኣዝማች . . . . . . . .
ከተራራዋ ወርደህ ኣለቱ ኣለኝ ምስጋና
በክብር ስትነግስ ኣይቷል ፍጥረቱ ኣለኝ ውዳሴ

VERSE 5
ዛሬም ነግሰሃል በልቤ ላይ ኣለኝ ምስጋና
ኣብራ በቤቴ የኔ ጸሃይ ኣለኝ ውዳሴ
ኣዝማች . . . . . . . .
ክብር ለስምህ ክብር ላንተ (2)

VERSE 6
ምስጋና ቅጥሩ ላፈረሰ
ክብር ለስምህ ክብር ላንተ (3)
ምስጋና ቅጥሩ ላፈረሰ
ክብር ለስምህ ክብር ላንተ',
      lyrics_transliteration = 'Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana

VERSE 1
Kibren t’yilh zufanh fit alegn widase
Yemelkon niqet mech yitayegnal alegn misgana
Fiqrh firhaten awlqolgnal alegn widase
Azmach . . . . . . . .

VERSE 2
Sidbwan biyaswegd mekanwan hana alegn misgana
Beljoch barko biyadergat qena alegn widase
Bila zemerech awaqi neh alegn misgana
Yenem misgana derswal fith alegn widase

VERSE 3
Azmach . . . . . . . .
Wihaw bifela bined esatu alegn misgana
Beet’f niduwal fiqrh ts’natu alegn widase
Keto alaqomm qinena zema alegn misgana

VERSE 4
Eske midr ch’af madanh yisema alegn widase
Azmach . . . . . . . .
Keterarawa werdeh aletu alegn misgana
Bekbr sitnegs aytwal fit’retu alegn widase

VERSE 5
Zarem negsehal belbe lay alegn misgana
Abra bebete yene ts’ehay alegn widase
Azmach . . . . . . . .
Kibir lesmh kibir lante (2)

VERSE 6
Misgana qit’ru laferese
Kibir lesmh kibir lante (3)
Misgana qit’ru laferese
Kibir lesmh kibir lante',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'alegn-widase-belike-lisanat-cherinet-senay'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 1
ክብሬን ጥዪልህ ዙፋንህ ፊት ኣለኝ ውዳሴ
የሜልኮን ንቀት መች ይታየኛል ኣለኝ ምስጋና
ፍቅርህ ፍርሃቴን ኣውልቆልኛል ኣለኝ ውዳሴ
ኣዝማች . . . . . . . .

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 2
ስድቧን ቢያስወግድ መካኗን ሃና ኣለኝ ምስጋና
በልጆች ባርኮ ቢያደርጋት ቀና ኣለኝ ውዳሴ
ብላ ዘመረች ኣዋቂ ነህ ኣለኝ ምስጋና
የኔም ምስጋና ደርሷል ፊትህ ኣለኝ ውዳሴ

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 3
ኣዝማች . . . . . . . .
ውሃው ቢፈላ ቢነድ እሳቱ ኣለኝ ምስጋና
በእጥፍ ንዱዋል ፍቅርህ ጽናቱ ኣለኝ ውዳሴ
ከቶ ኣላቆምም ቅኔና ዜማ ኣለኝ ምስጋና

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 4
እስከ ምድር ጫፍ ማዳንህ ይሰማ ኣለኝ ውዳሴ
ኣዝማች . . . . . . . .
ከተራራዋ ወርደህ ኣለቱ ኣለኝ ምስጋና
በክብር ስትነግስ ኣይቷል ፍጥረቱ ኣለኝ ውዳሴ

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 5
ዛሬም ነግሰሃል በልቤ ላይ ኣለኝ ምስጋና
ኣብራ በቤቴ የኔ ጸሃይ ኣለኝ ውዳሴ
ኣዝማች . . . . . . . .
ክብር ለስምህ ክብር ላንተ (2)

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና

VERSE 6
ምስጋና ቅጥሩ ላፈረሰ
ክብር ለስምህ ክብር ላንተ (3)
ምስጋና ቅጥሩ ላፈረሰ
ክብር ለስምህ ክብር ላንተ

CHORUS
ኣለኝ ውዳሴ ኣለኝ ምስጋና
ኣለኝ ከበሮ ኣለኝ በገና
እዘምራለው ድኛለውና (2)
እንደ ዜማ ሰው እንደ ዳዊት ኣለኝ ምስጋና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana

VERSE 1
Kibren t’yilh zufanh fit alegn widase
Yemelkon niqet mech yitayegnal alegn misgana
Fiqrh firhaten awlqolgnal alegn widase
Azmach . . . . . . . .

CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana

VERSE 2
Sidbwan biyaswegd mekanwan hana alegn misgana
Beljoch barko biyadergat qena alegn widase
Bila zemerech awaqi neh alegn misgana
Yenem misgana derswal fith alegn widase

CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana

VERSE 3
Azmach . . . . . . . .
Wihaw bifela bined esatu alegn misgana
Beet’f niduwal fiqrh ts’natu alegn widase
Keto alaqomm qinena zema alegn misgana

CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana

VERSE 4
Eske midr ch’af madanh yisema alegn widase
Azmach . . . . . . . .
Keterarawa werdeh aletu alegn misgana
Bekbr sitnegs aytwal fit’retu alegn widase

CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana

VERSE 5
Zarem negsehal belbe lay alegn misgana
Abra bebete yene ts’ehay alegn widase
Azmach . . . . . . . .
Kibir lesmh kibir lante (2)

CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana

VERSE 6
Misgana qit’ru laferese
Kibir lesmh kibir lante (3)
Misgana qit’ru laferese
Kibir lesmh kibir lante

CHORUS
Alegn widase alegn misgana
Alegn kebero alegn begena
Ezemralew dignalewna (2)
Ende zema sew ende dawit alegn misgana'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'alegn-widase-belike-lisanat-cherinet-senay', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Alemamenen Eridaw (alemamenen-eridaw)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ

VERSE 1
ነፍሴ አብራህ ትኑር በማደርያህ ጥላ
አታውጣን ከቤትህ ባጣም ቅድስና
ይህቺን ዓመት ተወኝ ጉልበቴ እስኪጸና
ያልጸናው ሕይወቴ ቢያስቸግርህ ላልቶ

VERSE 2
እስኪቆም ታገስኝ ጉልበቴ በርትቶ
እንደ ቃልህ ባልኖር ደስም ባላሰኝህ
ዛሬም ከኔ ጋር ሁን በጸናው ኪዳንህ
ለምጼ እጅግ በዝቶ ከስዎች ብገለል

VERSE 3
ልትዳስስኝ ፍጠን ምህረትን ልታደል
ደባልቀኝ ከመንጋው ከበረታው ወገን
አዘንብል ወደኔ በፍቅርህ ልሽፈን
መዓዛዪን ለውጥ ጠረኔን ቀይረው

VERSE 4
እንደ ናርዶስ ሽቶ የከበረ አድርገው
ቅረበኝ በፍቅርህ በደሌን ትተኸው
ሳበኝ በምሕረትህ ፊቴን ደስ አሰኜው',
      lyrics_transliteration = 'Alemamenen erdaw getaye (2)
Ante nehna meshshgiyayo
Alemamenen erdaw getaye
Fire yalazelkugn bihonm gosቖla

VERSE 1
Nefse abrah tinur bemaderyah t’la
Atawt’an kebeth bat’am qidsna
Yihchin amet tewegn gulbete eskits’ena
Yalts’enaw hiywete biyaschegrh lalto

VERSE 2
Eskiqom tagesgn gulbete bertto
Ende qalh balnor desm balasegnh
Zarem kene gar hun bets’enaw kidanh
Lemts’e ejg bezto keswoch bigelel

VERSE 3
Litdassgn fit’en mihretn litadel
Debalqegn kemengaw keberetaw wegen
Azenbl wedene befqrh lishfen
Meazayin lewt’ t’erenen qeyrew

VERSE 4
Ende nardos shto yekebere adrgew
Qirebegn befqrh bedelen titeኸw
Sabegn bemhreth fiten des asegnew',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'alemamenen-eridaw'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ

VERSE 1
ነፍሴ አብራህ ትኑር በማደርያህ ጥላ
አታውጣን ከቤትህ ባጣም ቅድስና
ይህቺን ዓመት ተወኝ ጉልበቴ እስኪጸና
ያልጸናው ሕይወቴ ቢያስቸግርህ ላልቶ

CHORUS
አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ

VERSE 2
እስኪቆም ታገስኝ ጉልበቴ በርትቶ
እንደ ቃልህ ባልኖር ደስም ባላሰኝህ
ዛሬም ከኔ ጋር ሁን በጸናው ኪዳንህ
ለምጼ እጅግ በዝቶ ከስዎች ብገለል

CHORUS
አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ

VERSE 3
ልትዳስስኝ ፍጠን ምህረትን ልታደል
ደባልቀኝ ከመንጋው ከበረታው ወገን
አዘንብል ወደኔ በፍቅርህ ልሽፈን
መዓዛዪን ለውጥ ጠረኔን ቀይረው

CHORUS
አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ

VERSE 4
እንደ ናርዶስ ሽቶ የከበረ አድርገው
ቅረበኝ በፍቅርህ በደሌን ትተኸው
ሳበኝ በምሕረትህ ፊቴን ደስ አሰኜው

CHORUS
አለማመኔን እርዳው ጌታየ(2)
አንተ ነህና መሽሽጊያዮ
አለማመኔን እርዳው ጌታየ
ፍሬ ያላዘልኩኝ ብሆንም ጎስቖላ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Alemamenen erdaw getaye (2)
Ante nehna meshshgiyayo
Alemamenen erdaw getaye
Fire yalazelkugn bihonm gosቖla

VERSE 1
Nefse abrah tinur bemaderyah t’la
Atawt’an kebeth bat’am qidsna
Yihchin amet tewegn gulbete eskits’ena
Yalts’enaw hiywete biyaschegrh lalto

CHORUS
Alemamenen erdaw getaye (2)
Ante nehna meshshgiyayo
Alemamenen erdaw getaye
Fire yalazelkugn bihonm gosቖla

VERSE 2
Eskiqom tagesgn gulbete bertto
Ende qalh balnor desm balasegnh
Zarem kene gar hun bets’enaw kidanh
Lemts’e ejg bezto keswoch bigelel

CHORUS
Alemamenen erdaw getaye (2)
Ante nehna meshshgiyayo
Alemamenen erdaw getaye
Fire yalazelkugn bihonm gosቖla

VERSE 3
Litdassgn fit’en mihretn litadel
Debalqegn kemengaw keberetaw wegen
Azenbl wedene befqrh lishfen
Meazayin lewt’ t’erenen qeyrew

CHORUS
Alemamenen erdaw getaye (2)
Ante nehna meshshgiyayo
Alemamenen erdaw getaye
Fire yalazelkugn bihonm gosቖla

VERSE 4
Ende nardos shto yekebere adrgew
Qirebegn befqrh bedelen titeኸw
Sabegn bemhreth fiten des asegnew

CHORUS
Alemamenen erdaw getaye (2)
Ante nehna meshshgiyayo
Alemamenen erdaw getaye
Fire yalazelkugn bihonm gosቖla'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'alemamenen-eridaw', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Alemamenen Eridaw Getaye (alemamenen-eridaw-getaye)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'رداي
دا نا ي
داتا
دا

VERSE 1
ناش دا
ري زلك
بهون را ر لا
يت قا قد نا ي نا

VERSE 2
ردا
ردا مشش دا
نات
رك ر بر ر زس زار نادان دا

VERSE 3
دا مش ش ما
لم ب
ر كب و زداني بفكر شف ما
منني نا مشش على ما

VERSE 4
مني
ز ار
ر بدل ت رت يتس ين دا
داش ردا دا

VERSE 5
دا كتنا شنتي جمره استمر ين فكر
يت زس بما بمقد ان
ب',
      lyrics_transliteration = 'رداي
دا نا ي
داتا
دا

VERSE 1
ناش دا
ري زلك
بهون را ر لا
يت قا قد نا ي نا

VERSE 2
ردا
ردا مشش دا
نات
رك ر بر ر زس زار نادان دا

VERSE 3
دا مش ش ما
لم ب
ر كب و زداني بفكر شف ما
منني نا مشش على ما

VERSE 4
مني
ز ار
ر بدل ت رت يتس ين دا
داش ردا دا

VERSE 5
دا كتنا شنتي جمره استمر ين فكر
يت زس بما بمقد ان
ب',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'alemamenen-eridaw-getaye'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
رداي
دا نا ي
داتا
دا

VERSE 1
ناش دا
ري زلك
بهون را ر لا
يت قا قد نا ي نا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 2
ردا
ردا مشش دا
نات
رك ر بر ر زس زار نادان دا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 3
دا مش ش ما
لم ب
ر كب و زداني بفكر شف ما
منني نا مشش على ما

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 4
مني
ز ار
ر بدل ت رت يتس ين دا
داش ردا دا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 5
دا كتنا شنتي جمره استمر ين فكر
يت زس بما بمقد ان
ب

CHORUS
رداي
دا نا ي
داتا
دا'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
رداي
دا نا ي
داتا
دا

VERSE 1
ناش دا
ري زلك
بهون را ر لا
يت قا قد نا ي نا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 2
ردا
ردا مشش دا
نات
رك ر بر ر زس زار نادان دا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 3
دا مش ش ما
لم ب
ر كب و زداني بفكر شف ما
منني نا مشش على ما

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 4
مني
ز ار
ر بدل ت رت يتس ين دا
داش ردا دا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 5
دا كتنا شنتي جمره استمر ين فكر
يت زس بما بمقد ان
ب

CHORUS
رداي
دا نا ي
داتا
دا'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'alemamenen-eridaw-getaye', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Alete Neh Anbaye (alete-neh-anbaye)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/

VERSE 1
እንደ ወጣ ይቅር አትበለኝ
በንስሀ ቤትህ ምልሰኝ
በመቅደስህ ዓለት አቁመኝ
ማዕበልና ንፋስ ሳይነቅለኝ

VERSE 2
የነገን አላውቅም እጣዬን
በቤትህ ጸንቼ መኖሬን
አላምነውምና ክፉ ልቤን
ስፈራው እኖራለሁ የመጪውን

VERSE 3
አልመካም እኔ እፈራለሁ
ወድቆ ስላየሁኝ የቆመው ሰው
ባልተሰበረ ልብ በመኖሬ
መቆሜን አላውቅም እስከዛሬ

VERSE 4
በወደቀው ጨክኜ ፈርጄ
የደካማው በደል አለ በጄ
ማንም ስላልሾመኝ ፈራጅ አድርጎ
ልቤን መልስልኝ ወደ በጎ',
      lyrics_transliteration = 'Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)

VERSE 1
Ende weta yikir atbeleng
Benis’ha betih melseng
Bemeqdesih alet aqumeng
Ma’ebalna nifas sayneqelgn

VERSE 2
Yenegen alawikm it’ayen
Betih ts’enche menorén
Alamnewmna kifu libén
Siferaw enoralew yemetchiwn

VERSE 3
Almekam ene iferalew
Wedqo silayehugn yeqome sew
Baltesebere lib bemenoré
Meqomen alawikm eskizare

VERSE 4
Bewedekew chekigne ferjé
Yedekamaw bedel ale bejé
Manim silalshomegn feraj adrgo
Libén melsilgn wede bego',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'alete-neh-anbaye'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/

VERSE 1
እንደ ወጣ ይቅር አትበለኝ
በንስሀ ቤትህ ምልሰኝ
በመቅደስህ ዓለት አቁመኝ
ማዕበልና ንፋስ ሳይነቅለኝ

CHORUS
አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/

VERSE 2
የነገን አላውቅም እጣዬን
በቤትህ ጸንቼ መኖሬን
አላምነውምና ክፉ ልቤን
ስፈራው እኖራለሁ የመጪውን

CHORUS
አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/

VERSE 3
አልመካም እኔ እፈራለሁ
ወድቆ ስላየሁኝ የቆመው ሰው
ባልተሰበረ ልብ በመኖሬ
መቆሜን አላውቅም እስከዛሬ

CHORUS
አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/

VERSE 4
በወደቀው ጨክኜ ፈርጄ
የደካማው በደል አለ በጄ
ማንም ስላልሾመኝ ፈራጅ አድርጎ
ልቤን መልስልኝ ወደ በጎ

CHORUS
አለቴ ነህ አንባዬ ጉልበቴ ነህ ጌታዬ/2/
በተከበበ ከተማ ከቶ አትጣለኝ ለብቻዬ/2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)

VERSE 1
Ende weta yikir atbeleng
Benis’ha betih melseng
Bemeqdesih alet aqumeng
Ma’ebalna nifas sayneqelgn

CHORUS
Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)

VERSE 2
Yenegen alawikm it’ayen
Betih ts’enche menorén
Alamnewmna kifu libén
Siferaw enoralew yemetchiwn

CHORUS
Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)

VERSE 3
Almekam ene iferalew
Wedqo silayehugn yeqome sew
Baltesebere lib bemenoré
Meqomen alawikm eskizare

CHORUS
Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)

VERSE 4
Bewedekew chekigne ferjé
Yedekamaw bedel ale bejé
Manim silalshomegn feraj adrgo
Libén melsilgn wede bego

CHORUS
Alete neh anbaye gulbete neh getaye (x2)
Betekebebe ketema keto atitalen lebichaye (x2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'alete-neh-anbaye', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Altewegnm Zemarit Fasika Mekonen (altewegnm-zemarit-fasika-mekonen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ

VERSE 1
ብጠፋበት እንኳን አልተወኝም ለካ
ዛሬም ልጄ ብሎ ዳግም ይጠራኛል
ለካስ አልጠላኝም ጌታ ይወደኛል
አዝ፡፡፡፡

VERSE 2
ለስልጣን ለክብሬ ብዬ ስክደው
ለገንዘብ አድልቼ እኔ ብረሳው
ለእኔ ያለው ፍቅር አልቀነሰብኝም
ዛሬም ይወደኛል ጌታ አልጠላኝም

VERSE 3
ዛሬም ይወደኛል ጌታ አልጠላኝም
አዝ፡፡፡፡
ታዲያ ለዚህ ፍቅሩ ለሌለው ወሰን
ከጭንጫ መቃብር ላወጣኝ እኔን

VERSE 4
በሕይወቴ ሁሉ ፍፁም ለመራኝ
ክብርና ምስጋናን አቀርባለሁኝ',
      lyrics_transliteration = 'Altewegnm Geta lekas yiwedegnal (2)
Zarem sibedlew lije neh yilegnal
Zarem sibedlew lije nesh yilegnal (2)
Bebedel gurangur behat’yat ch’aka

VERSE 1
Bit’efabet enkwan altewegnm leka
Zarem lije bilo dagm yit’eragnal
Lekas alt’elagnm Geta yiwedegnal

VERSE 2
Leslt’an lekbre biye sikdew
Legenzeb adlche ene biresaw
Leene yalew fiqr alqenesebgnm
Zarem yiwedegnal Geta alt’elagnm

VERSE 3
Zarem yiwedegnal Geta alt’elagnm
Tadiya lezih fiqru lelelew wesen
Kech’nch’a meqabr lawet’agn enen

VERSE 4
Behywete hulu fits’um lemeragn
Kibrna misganan aqerbalehugn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'altewegnm-zemarit-fasika-mekonen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ

VERSE 1
ብጠፋበት እንኳን አልተወኝም ለካ
ዛሬም ልጄ ብሎ ዳግም ይጠራኛል
ለካስ አልጠላኝም ጌታ ይወደኛል
አዝ፡፡፡፡

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ

VERSE 2
ለስልጣን ለክብሬ ብዬ ስክደው
ለገንዘብ አድልቼ እኔ ብረሳው
ለእኔ ያለው ፍቅር አልቀነሰብኝም
ዛሬም ይወደኛል ጌታ አልጠላኝም

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ

VERSE 3
ዛሬም ይወደኛል ጌታ አልጠላኝም
አዝ፡፡፡፡
ታዲያ ለዚህ ፍቅሩ ለሌለው ወሰን
ከጭንጫ መቃብር ላወጣኝ እኔን

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ

VERSE 4
በሕይወቴ ሁሉ ፍፁም ለመራኝ
ክብርና ምስጋናን አቀርባለሁኝ

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል/2/
ዛሬም ስበድለው ልጄ ነህ ይለኛል
ዛሬም ስበድለው ልጄ ነሽ ይለኛል /2/
በበደል ጉራንጉር በኃጥያት ጫካ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Altewegnm Geta lekas yiwedegnal (2)
Zarem sibedlew lije neh yilegnal
Zarem sibedlew lije nesh yilegnal (2)
Bebedel gurangur behat’yat ch’aka

VERSE 1
Bit’efabet enkwan altewegnm leka
Zarem lije bilo dagm yit’eragnal
Lekas alt’elagnm Geta yiwedegnal
CHORUS

CHORUS
Altewegnm Geta lekas yiwedegnal (2)
Zarem sibedlew lije neh yilegnal
Zarem sibedlew lije nesh yilegnal (2)
Bebedel gurangur behat’yat ch’aka

VERSE 2
Leslt’an lekbre biye sikdew
Legenzeb adlche ene biresaw
Leene yalew fiqr alqenesebgnm
Zarem yiwedegnal Geta alt’elagnm

CHORUS
Altewegnm Geta lekas yiwedegnal (2)
Zarem sibedlew lije neh yilegnal
Zarem sibedlew lije nesh yilegnal (2)
Bebedel gurangur behat’yat ch’aka

VERSE 3
Zarem yiwedegnal Geta alt’elagnm
CHORUS
Tadiya lezih fiqru lelelew wesen
Kech’nch’a meqabr lawet’agn enen

CHORUS
Altewegnm Geta lekas yiwedegnal (2)
Zarem sibedlew lije neh yilegnal
Zarem sibedlew lije nesh yilegnal (2)
Bebedel gurangur behat’yat ch’aka

VERSE 4
Behywete hulu fits’um lemeragn
Kibrna misganan aqerbalehugn

CHORUS
Altewegnm Geta lekas yiwedegnal (2)
Zarem sibedlew lije neh yilegnal
Zarem sibedlew lije nesh yilegnal (2)
Bebedel gurangur behat’yat ch’aka'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'altewegnm-zemarit-fasika-mekonen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Altewengem Geta (altewengem-geta)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 1
በበደል ጉራንጉር በሃጢያት ጫካ
ብጠፋበት እንኳን አልተወኝም ለካ

VERSE 2
ዛሬም ልጄ ብሎ ዳግም ይጠራኛል /2/
ለካስ አልጠላኝም ጌታ ይወደኛል /2/

VERSE 3
ለስልጣን ለክብሬ ብዬ ስክደው
ለገንዘብ አድልቼ እኔ ስረሳው

VERSE 4
ለእኔ ያለው ፍቅር አልቀነሰብኝም /2/
ዛሬም ይወደኛል ጌታ አልጠላኝም /2/

VERSE 5
ታዲያ ለዚህ ፍቅሩ ለሌለው ወሰን
ከጭንጫ መቃብር ላወጣኝ እኔን

VERSE 6
በህይወቴ ሁሉ ፍጽም ለመራኝ /2/
ክብርና ምስጋና አቀርባለሁኝ /2/',
      lyrics_transliteration = 'Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 1
Bebedel gurangur behatiyat chaka
Bitefabet enkwan altewengem leka

VERSE 2
Zarem lijé bilo dagim yit’eral (x2)
Lekas alt’elagñim geta yiwedegnal (x2)

VERSE 3
Lesilt’an lekibre biye sikdew
Legenzeb adilché ené siresew

VERSE 4
Lene yalew fiqir alqenesebignim (x2)
Zarem yiwedegnal geta alt’elagñim (x2)

VERSE 5
Tadiya lezih fiqru lelelow wesan
Kechinqa meqaber lawetagñ ené

VERSE 6
Behiywete hulu fits’um lemeragn (x2)
Kibirna misgana aqerbalewgn (x2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'altewengem-geta'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 1
በበደል ጉራንጉር በሃጢያት ጫካ
ብጠፋበት እንኳን አልተወኝም ለካ

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 2
ዛሬም ልጄ ብሎ ዳግም ይጠራኛል /2/
ለካስ አልጠላኝም ጌታ ይወደኛል /2/

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 3
ለስልጣን ለክብሬ ብዬ ስክደው
ለገንዘብ አድልቼ እኔ ስረሳው

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 4
ለእኔ ያለው ፍቅር አልቀነሰብኝም /2/
ዛሬም ይወደኛል ጌታ አልጠላኝም /2/

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 5
ታዲያ ለዚህ ፍቅሩ ለሌለው ወሰን
ከጭንጫ መቃብር ላወጣኝ እኔን

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል

VERSE 6
በህይወቴ ሁሉ ፍጽም ለመራኝ /2/
ክብርና ምስጋና አቀርባለሁኝ /2/

CHORUS
አልተወኝም ጌታ ለካስ ይወደኛል /2/
ዛሬም ስበድለው ልጄ ነሽ ይለኛል
ዛሬም ስበድለው ልጄ ነህ ይለኛል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 1
Bebedel gurangur behatiyat chaka
Bitefabet enkwan altewengem leka

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 2
Zarem lijé bilo dagim yit’eral (x2)
Lekas alt’elagñim geta yiwedegnal (x2)

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 3
Lesilt’an lekibre biye sikdew
Legenzeb adilché ené siresew

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 4
Lene yalew fiqir alqenesebignim (x2)
Zarem yiwedegnal geta alt’elagñim (x2)

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 5
Tadiya lezih fiqru lelelow wesan
Kechinqa meqaber lawetagñ ené

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal

VERSE 6
Behiywete hulu fits’um lemeragn (x2)
Kibirna misgana aqerbalewgn (x2)

CHORUS
Altewengem geta lekas yiwedegnal (x2)
Zarem sibedilew lijé nesh yilegnal
Zarem sibedilew lijé neh yilegnal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'altewengem-geta', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Amalaje Zemari Yonas Gebrekidan (amalaje-zemari-yonas-gebrekidan)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 1
በጠራኋት ጊዜ የቅርብ ወደጄ
የማላጣት ከጎኔ
ቀርባ ምታግዘኝ
በደስታ በሐዘኔ

VERSE 2
ሰላም ከእኔ ሲርቅ
ወደ እርሷ ጮሃለው
ያፅናናኛል ፍቅሯ
ደግሞ እበረታለው

VERSE 3
ባድር አይገደኝም ማርያም ውበቴ
ሳነሳሳት ውዬ
ክብሬናት እመ አምላክ
ስጦታ የአንድዬ

VERSE 4
ጠላቴ ሆይ ስማ
ከአፌ አልነጥላትም
ደምስሬ በሙሉ
ይላል ማርያም ማርያም

VERSE 5
በኤፍሬም ውዳሴ መማፀኛዬ
አወድሳታለሁ
ዘወትር በማህሌት
ስሟን እጣራለሁ

VERSE 6
መበርቻዬ ለኔ
ክፉን ያለፍኩበት
በረታለው እንጂ
አላፍርም ስጠራት

VERSE 7
እንወዳታለን ማርያምን እንወዳታለን
ልዕልናዋን ለትውልድ እናውጃለን
እወዳታለን
አንጠራጠርም

VERSE 8
በአማላጅነቷ
ኢየሱስ እኮነው
የፍቅሯ ስጦታ
ለክብሯ ዘምረን

VERSE 9
መች እንጠግባለን
ዘመናት ያልፋሉ
ማርያም እያልን
ጌጣችን ነው ስሟ

VERSE 10
መተማመኛችን
ክብራችን ነው ክብሯ
ከፍታ ማማችን
መማፀኛችን ናት

VERSE 11
አርማችን ዘላለም
እናገናታለን
በማርያም አናፍርም
የእረፍታችን ወደብ

VERSE 12
አንድያ ልጇ ነው
አያልቅም ተነግሮ
ከእርሷ ያገኘነው
ፈጥና ትደርሳለች

VERSE 13
ይዛ ምህረትን
ጠላት ያሻውን ቢል
አንተውም ማርያምን',
      lyrics_transliteration = 'Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 1
Bet’erahwat gize yeqrb wedeje
Yemalat’at kegone
Qerba mitagzegn
Bedesta behezene

VERSE 2
Selam keene sirq
Wede erswa ch’ohalew
Yats’nanagnal fiqrwa
Degmo eberetalew

VERSE 3
Badr aygedegnm Maryam wibete
Sanesasat wiye
Kibrenat eme amlak
Sit’ota yeandye

VERSE 4
T’elate hoy sima
Keafe alnet’latm
Demsre bemulu
Yilal Maryam Maryam

VERSE 5
Beefrem widase memats’egnaye
Awedsatalehu
Zewetr bemahlet
Simwan et’aralehu

VERSE 6
Meberchaye lene
Kifun yalefkubet
Beretalew enji
Alafrm sit’erat

VERSE 7
Enwedatalen Maryamn enwedatalen
Lielnawan letwld enawjalen
Ewedatalen
Ant’erat’erm

VERSE 8
Beamalajnetwa
Iyesus ekonew
Yefqrwa sit’ota
Lekbrwa zemren

VERSE 9
Mech ent’egbalen
Zemenat yalfalu
Maryam eyaln
Get’achn new simwa

VERSE 10
Metemamegnachn
Kibrachn new kibrwa
Kefta mamachn
Memats’egnachn nat

VERSE 11
Armachn zelalem
Enagenatalen
BeMaryam anafrm
Yeereftachn wedeb

VERSE 12
Andya lijwa new
Ayalqm tenegro
Keerswa yagegnenew
Fet’na tidersalech

VERSE 13
Yiza mihretn
T’elat yashawn bil
Antewm Maryamn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'amalaje-zemari-yonas-gebrekidan'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 1
በጠራኋት ጊዜ የቅርብ ወደጄ
የማላጣት ከጎኔ
ቀርባ ምታግዘኝ
በደስታ በሐዘኔ

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 2
ሰላም ከእኔ ሲርቅ
ወደ እርሷ ጮሃለው
ያፅናናኛል ፍቅሯ
ደግሞ እበረታለው

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 3
ባድር አይገደኝም ማርያም ውበቴ
ሳነሳሳት ውዬ
ክብሬናት እመ አምላክ
ስጦታ የአንድዬ

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 4
ጠላቴ ሆይ ስማ
ከአፌ አልነጥላትም
ደምስሬ በሙሉ
ይላል ማርያም ማርያም

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 5
በኤፍሬም ውዳሴ መማፀኛዬ
አወድሳታለሁ
ዘወትር በማህሌት
ስሟን እጣራለሁ

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 6
መበርቻዬ ለኔ
ክፉን ያለፍኩበት
በረታለው እንጂ
አላፍርም ስጠራት

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 7
እንወዳታለን ማርያምን እንወዳታለን
ልዕልናዋን ለትውልድ እናውጃለን
እወዳታለን
አንጠራጠርም

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 8
በአማላጅነቷ
ኢየሱስ እኮነው
የፍቅሯ ስጦታ
ለክብሯ ዘምረን

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 9
መች እንጠግባለን
ዘመናት ያልፋሉ
ማርያም እያልን
ጌጣችን ነው ስሟ

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 10
መተማመኛችን
ክብራችን ነው ክብሯ
ከፍታ ማማችን
መማፀኛችን ናት

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 11
አርማችን ዘላለም
እናገናታለን
በማርያም አናፍርም
የእረፍታችን ወደብ

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 12
አንድያ ልጇ ነው
አያልቅም ተነግሮ
ከእርሷ ያገኘነው
ፈጥና ትደርሳለች

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ

VERSE 13
ይዛ ምህረትን
ጠላት ያሻውን ቢል
አንተውም ማርያምን

CHORUS
አማላጄ ማርያም አማላጄ
የቅርብ ወደጄ
ስጦታዬ የመስቀል ስር ሀብቴ
ማርያም ውበቴ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 1
Bet’erahwat gize yeqrb wedeje
Yemalat’at kegone
Qerba mitagzegn
Bedesta behezene

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 2
Selam keene sirq
Wede erswa ch’ohalew
Yats’nanagnal fiqrwa
Degmo eberetalew

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 3
Badr aygedegnm Maryam wibete
Sanesasat wiye
Kibrenat eme amlak
Sit’ota yeandye

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 4
T’elate hoy sima
Keafe alnet’latm
Demsre bemulu
Yilal Maryam Maryam

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 5
Beefrem widase memats’egnaye
Awedsatalehu
Zewetr bemahlet
Simwan et’aralehu

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 6
Meberchaye lene
Kifun yalefkubet
Beretalew enji
Alafrm sit’erat

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 7
Enwedatalen Maryamn enwedatalen
Lielnawan letwld enawjalen
Ewedatalen
Ant’erat’erm

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 8
Beamalajnetwa
Iyesus ekonew
Yefqrwa sit’ota
Lekbrwa zemren

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 9
Mech ent’egbalen
Zemenat yalfalu
Maryam eyaln
Get’achn new simwa

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 10
Metemamegnachn
Kibrachn new kibrwa
Kefta mamachn
Memats’egnachn nat

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 11
Armachn zelalem
Enagenatalen
BeMaryam anafrm
Yeereftachn wedeb

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 12
Andya lijwa new
Ayalqm tenegro
Keerswa yagegnenew
Fet’na tidersalech

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete

VERSE 13
Yiza mihretn
T’elat yashawn bil
Antewm Maryamn

CHORUS
Amalaje Maryam amalaje
Yeqrb wedeje
Sit’otaye yemesqel sir hebte
Maryam wibete'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'amalaje-zemari-yonas-gebrekidan', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Amaldley (amaldley)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 1
ተወደቕኩ ዘይልዓል ክትንስእ ሱረይ ዘይንቀል
ምምናው ኣብዩኒ ሓጢኣተይ ክምንን ኩኒ ገዳመይ
ከይቀውም ኣብ ቅድሚ ኣቦ ደኺመ ስኢነ ሓቦ
ወድኺ እንድዩ ት''ምሓሪ ክሰርየለይ ስለይ ቁሚ

VERSE 2
ኣዝ
ከይነቅል ብግዜ ሰንበት ከይጎዪ ቅኔ ክራማት
ጸዊዕኪ ከራግፍ ጾረይ ክመንዎ ንንእስነተይ
ኣበሳይ ከየጫጭሖ ንስሓይ ብኣግኡ ክርሖ

VERSE 3
ክግልሎ ንጽድቅኺ ሕሰብኒ ኣብ ጸሎትኪ
ኣዝ
የፍቅረካ እየ ጌና ንብዓተይ ስሌኻ ይውሕዛ
ምስ በልኪ ተሰይሩ ልበይ ነባዕኩ ክሕደገለይ

VERSE 4
ተስፋይ ፍኖቱ ባዕልኺ ጸላመይ እተብርሂ
ውሉድኪ''የ ዘይደልደለ ታትይኒ ጽድቂ ደልየ።
ኣዝ
ሕሓፍሶ ውዑይ ንብዓትካ ውሉደይ ምለሶ ገጽካ

VERSE 5
ዳበልኪ ተጽንዕኒ ኣደ ጎይታይ ንዕኒ
ክበርቀለይ ጸላመይ ክፍትን ምንባር ማርያመይ
ኣትሕዝኒ ዕርፍኺ ክጅምሮ መንገዲ ጽድቂ።
ኣዝ""(2)',
      lyrics_transliteration = 'Kiseryeley hat’iatey biskfta keynebr
Kidmsso abesay ab hiቕfoኺ kihader
Ninashae zimelales timnit diኻ menfesey
Maryamey maldley degim keywedቕ libey (2)

VERSE 1
Tewedeቕku zeylal kitnse surey zeynqel
Mimnaw abyuni hat’iatey kimnn kuni gedamey
Keyqewm ab qidmi abo deኺme siine habo
Wedኺ endyu t''mihari kiseryeley siley qumi

VERSE 2
Az
Keyneql bigze senbet keygoyi qine kiramat
Ts’ewieki keragf ts’orey kimenwo ninesnetey
Abesay keyech’ach’ho nishay biagu kirho

VERSE 3
Kigllo nits’dqኺ hisebni ab ts’elotki
Az
Yefqreka eye gena nibatey sileኻ yiwhza
Mis belki teseyru libey nebaeku kihdegeley

VERSE 4
Tesfay finotu baelኺ ts’elamey etebrhi
Wiludki''ye zeydeldele tatyni ts’dqi delye.
Az
Hihafso wiuy nibatka wiludey mileso gets’ka

VERSE 5
Dabelki tets’neni ade goytay nieni
Kiberqeley ts’elamey kiftn minbar maryamey
Athzni erfኺ kijmro mengedi ts’dqi.
Az"" (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'amaldley'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 1
ተወደቕኩ ዘይልዓል ክትንስእ ሱረይ ዘይንቀል
ምምናው ኣብዩኒ ሓጢኣተይ ክምንን ኩኒ ገዳመይ
ከይቀውም ኣብ ቅድሚ ኣቦ ደኺመ ስኢነ ሓቦ
ወድኺ እንድዩ ት''ምሓሪ ክሰርየለይ ስለይ ቁሚ

CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 2
ኣዝ
ከይነቅል ብግዜ ሰንበት ከይጎዪ ቅኔ ክራማት
ጸዊዕኪ ከራግፍ ጾረይ ክመንዎ ንንእስነተይ
ኣበሳይ ከየጫጭሖ ንስሓይ ብኣግኡ ክርሖ

CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 3
ክግልሎ ንጽድቅኺ ሕሰብኒ ኣብ ጸሎትኪ
ኣዝ
የፍቅረካ እየ ጌና ንብዓተይ ስሌኻ ይውሕዛ
ምስ በልኪ ተሰይሩ ልበይ ነባዕኩ ክሕደገለይ

CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 4
ተስፋይ ፍኖቱ ባዕልኺ ጸላመይ እተብርሂ
ውሉድኪ''የ ዘይደልደለ ታትይኒ ጽድቂ ደልየ።
ኣዝ
ሕሓፍሶ ውዑይ ንብዓትካ ውሉደይ ምለሶ ገጽካ

CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)

VERSE 5
ዳበልኪ ተጽንዕኒ ኣደ ጎይታይ ንዕኒ
ክበርቀለይ ጸላመይ ክፍትን ምንባር ማርያመይ
ኣትሕዝኒ ዕርፍኺ ክጅምሮ መንገዲ ጽድቂ።
ኣዝ""(2)

CHORUS
ክሰርየለይ ሓጢኣተይ ብስክፍታ ከይነብር
ክድምስሶ ኣበሳይ ኣብ ሕቕፎኺ ክሓደር
ንናሻዕ ዝመላለስ ትምኒት ድኻ መንፈሰይ
ማርያመይ ማልድለይ ደጊም ከይወድቕ ልበይ(2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kiseryeley hat’iatey biskfta keynebr
Kidmsso abesay ab hiቕfoኺ kihader
Ninashae zimelales timnit diኻ menfesey
Maryamey maldley degim keywedቕ libey (2)

VERSE 1
Tewedeቕku zeylal kitnse surey zeynqel
Mimnaw abyuni hat’iatey kimnn kuni gedamey
Keyqewm ab qidmi abo deኺme siine habo
Wedኺ endyu t''mihari kiseryeley siley qumi

CHORUS
Kiseryeley hat’iatey biskfta keynebr
Kidmsso abesay ab hiቕfoኺ kihader
Ninashae zimelales timnit diኻ menfesey
Maryamey maldley degim keywedቕ libey (2)

VERSE 2
Az
Keyneql bigze senbet keygoyi qine kiramat
Ts’ewieki keragf ts’orey kimenwo ninesnetey
Abesay keyech’ach’ho nishay biagu kirho

CHORUS
Kiseryeley hat’iatey biskfta keynebr
Kidmsso abesay ab hiቕfoኺ kihader
Ninashae zimelales timnit diኻ menfesey
Maryamey maldley degim keywedቕ libey (2)

VERSE 3
Kigllo nits’dqኺ hisebni ab ts’elotki
Az
Yefqreka eye gena nibatey sileኻ yiwhza
Mis belki teseyru libey nebaeku kihdegeley

CHORUS
Kiseryeley hat’iatey biskfta keynebr
Kidmsso abesay ab hiቕfoኺ kihader
Ninashae zimelales timnit diኻ menfesey
Maryamey maldley degim keywedቕ libey (2)

VERSE 4
Tesfay finotu baelኺ ts’elamey etebrhi
Wiludki''ye zeydeldele tatyni ts’dqi delye.
Az
Hihafso wiuy nibatka wiludey mileso gets’ka

CHORUS
Kiseryeley hat’iatey biskfta keynebr
Kidmsso abesay ab hiቕfoኺ kihader
Ninashae zimelales timnit diኻ menfesey
Maryamey maldley degim keywedቕ libey (2)

VERSE 5
Dabelki tets’neni ade goytay nieni
Kiberqeley ts’elamey kiftn minbar maryamey
Athzni erfኺ kijmro mengedi ts’dqi.
Az"" (2)

CHORUS
Kiseryeley hat’iatey biskfta keynebr
Kidmsso abesay ab hiቕfoኺ kihader
Ninashae zimelales timnit diኻ menfesey
Maryamey maldley degim keywedቕ libey (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'amaldley', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Aman Beaman (aman-beaman)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አማን በአማን (2) ተንስአ (2)
ተንስአ እምነ ሙታን (4)

VERSE 1
አማን በአማን (2) ተንስአ (2)
ተንስአ እምነ ሙታን (4)',
      lyrics_transliteration = 'Aman beaman (2) tense’a (2)
Tens’a eminemutan (4)

VERSE 1
Aman beaman (2) tense’a (2)
Tens’a eminemutan (4)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'aman-beaman'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማን በአማን (2) ተንስአ (2)
ተንስአ እምነ ሙታን (4)

VERSE 1
አማን በአማን (2) ተንስአ (2)
ተንስአ እምነ ሙታን (4)

CHORUS
አማን በአማን (2) ተንስአ (2)
ተንስአ እምነ ሙታን (4)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aman beaman (2) tense’a (2)
Tens’a eminemutan (4)

VERSE 1
Aman beaman (2) tense’a (2)
Tens’a eminemutan (4)

CHORUS
Aman beaman (2) tense’a (2)
Tens’a eminemutan (4)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'aman-beaman', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Aman beAman Menkir (aman-beaman-menkir)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አማን በአማን /2/
መንክር /2 ጊዜ/

VERSE 1
መንክር ስብሐተ ልደቱ /4 ጊዜ/',
      lyrics_transliteration = 'eman beeman /2/
menkr /2 gize/

VERSE 1
menkr sbhete ldetu /4 gize/',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'aman-beaman-menkir'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማን በአማን /2/
መንክር /2 ጊዜ/

VERSE 1
መንክር ስብሐተ ልደቱ /4 ጊዜ/

CHORUS
አማን በአማን /2/
መንክር /2 ጊዜ/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
eman beeman /2/
menkr /2 gize/

VERSE 1
menkr sbhete ldetu /4 gize/

CHORUS
eman beeman /2/
menkr /2 gize/'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'aman-beaman-menkir', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Aman be''aman Tesebha (aman-beaman-tesebha)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አማን በአማን (፬)
ተሰብሐ በደብረ ታቦር (፬)

VERSE 1
አማን በአማን (፬)
ተሰብሐ በደብረ ታቦር (፬)',
      lyrics_transliteration = 'Aman be''aman (x4)
Tesebha beDebre Tabor (x4)

VERSE 1
Aman be''aman (x4)
Tesebha beDebre Tabor (x4)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'aman-beaman-tesebha'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማን በአማን (፬)
ተሰብሐ በደብረ ታቦር (፬)

VERSE 1
አማን በአማን (፬)
ተሰብሐ በደብረ ታቦር (፬)

CHORUS
አማን በአማን (፬)
ተሰብሐ በደብረ ታቦር (፬)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aman be''aman (x4)
Tesebha beDebre Tabor (x4)

VERSE 1
Aman be''aman (x4)
Tesebha beDebre Tabor (x4)

CHORUS
Aman be''aman (x4)
Tesebha beDebre Tabor (x4)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'aman-beaman-tesebha', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Amanuel Amilak (amanuel-amilak)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ

VERSE 1
እንደምስኪን ደሃ አንገቱን ቀልሶ……እሰይ የምስራች
ምህረት ላረገልን እምባችን አብሶ… እሰይ የምስራች
ከባርነት ቀምበር ፍፁም ነፃ ወጣ …እሰይ የምስራች
ደስይለናል ባንተ በትንሳኤው ብርሃን…እሰይየምስራች

VERSE 2
ከለሜዳ ለብሶ እርቃኑን የቆመው …..እሰይ የምስራች
የኛ መድኃኒዓለም ሞትን ድልአረገው…እሰይ የምስራች
ጨረቃና ከዋክብት ደም ለአለቀሱለት…እሰይ የምስራች
ሞትን ድልለነሳው እናመስግን በእውነት…እሰይ የምስራች

VERSE 3
መቅደላዊት ማርያም በጣም ደስይበልሽ…እሰይየምስራች
አምላክሽ ተነስቷል ከሐጢአት ያነፃሽ…እሰይ የምስራች
እናንተ ሐዋርያት በእምነት የፀናችሁ…እሰይ የምስራች
ፍራቻው ይወገድ ተነስቷል ጌታችሁ…እሰይ የምስራች

VERSE 4
ንገሩ ለዓለም ያረገላችሁን…… ……እሰይ የምስራች
ከሲኦል እስራት ያላቀቃችሁን…… …እሰይ የምስራች
እሰይ የምስራች ሰይጣን ድል ተመታ…እሰይ የምስራች
ዝማሬን እናቅርብ ሁላችን በእልልታ …እሰይ የምስራች',
      lyrics_transliteration = 'Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta

VERSE 1
Endemskin deha angetun qelso……esey yemsrach
Mihret laregeln embachn abso… esey yemsrach
Kebarnet qember fits’um nets’a wet’a …esey yemsrach
Desylenal bante betnsaew birhan…eseyyemsrach

VERSE 2
Kelemeda lebso erqanun yeqomew …..esey yemsrach
Yegna medhanialem motn dilaregew…esey yemsrach
Ch’ereqana kewakbt dem lealeqesulet…esey yemsrach
Motn dillenesaw enamesgn beewnet…esey yemsrach

VERSE 3
Meqdelawit Maryam bet’am desybelsh…eseyyemsrach
Amlaksh tenestwal kehet’iat yanets’ash…esey yemsrach
Enante hewaryat beemnet yets’enachhu…esey yemsrach
Firachaw yiweged tenestwal getachhu…esey yemsrach

VERSE 4
Nigeru lealem yaregelachhun…… ……esey yemsrach
Kesiol esrat yalaqeqachhun…… …esey yemsrach
Esey yemsrach seyt’an dil temeta…esey yemsrach
Zimaren enaqrb hulachn beellta …esey yemsrach',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'amanuel-amilak'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ

VERSE 1
እንደምስኪን ደሃ አንገቱን ቀልሶ……እሰይ የምስራች
ምህረት ላረገልን እምባችን አብሶ… እሰይ የምስራች
ከባርነት ቀምበር ፍፁም ነፃ ወጣ …እሰይ የምስራች
ደስይለናል ባንተ በትንሳኤው ብርሃን…እሰይየምስራች

CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ

VERSE 2
ከለሜዳ ለብሶ እርቃኑን የቆመው …..እሰይ የምስራች
የኛ መድኃኒዓለም ሞትን ድልአረገው…እሰይ የምስራች
ጨረቃና ከዋክብት ደም ለአለቀሱለት…እሰይ የምስራች
ሞትን ድልለነሳው እናመስግን በእውነት…እሰይ የምስራች

CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ

VERSE 3
መቅደላዊት ማርያም በጣም ደስይበልሽ…እሰይየምስራች
አምላክሽ ተነስቷል ከሐጢአት ያነፃሽ…እሰይ የምስራች
እናንተ ሐዋርያት በእምነት የፀናችሁ…እሰይ የምስራች
ፍራቻው ይወገድ ተነስቷል ጌታችሁ…እሰይ የምስራች

CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ

VERSE 4
ንገሩ ለዓለም ያረገላችሁን…… ……እሰይ የምስራች
ከሲኦል እስራት ያላቀቃችሁን…… …እሰይ የምስራች
እሰይ የምስራች ሰይጣን ድል ተመታ…እሰይ የምስራች
ዝማሬን እናቅርብ ሁላችን በእልልታ …እሰይ የምስራች

CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta

VERSE 1
Endemskin deha angetun qelso……esey yemsrach
Mihret laregeln embachn abso… esey yemsrach
Kebarnet qember fits’um nets’a wet’a …esey yemsrach
Desylenal bante betnsaew birhan…eseyyemsrach

CHORUS
Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta

VERSE 2
Kelemeda lebso erqanun yeqomew …..esey yemsrach
Yegna medhanialem motn dilaregew…esey yemsrach
Ch’ereqana kewakbt dem lealeqesulet…esey yemsrach
Motn dillenesaw enamesgn beewnet…esey yemsrach

CHORUS
Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta

VERSE 3
Meqdelawit Maryam bet’am desybelsh…eseyyemsrach
Amlaksh tenestwal kehet’iat yanets’ash…esey yemsrach
Enante hewaryat beemnet yets’enachhu…esey yemsrach
Firachaw yiweged tenestwal getachhu…esey yemsrach

CHORUS
Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta

VERSE 4
Nigeru lealem yaregelachhun…… ……esey yemsrach
Kesiol esrat yalaqeqachhun…… …esey yemsrach
Esey yemsrach seyt’an dil temeta…esey yemsrach
Zimaren enaqrb hulachn beellta …esey yemsrach

CHORUS
Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'amanuel-amilak', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Amanuel Amlak Misgana Yigebahal (amanuel-amlak-misgana-yigebahal)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ

VERSE 1
እንደምስኪን ደሃ አንገቱን ቀልሶ……እሰይ የምስራች
ምህረት ላረገልን እምባችን አብሶ… እሰይ የምስራች
ከባርነት ቀምበር ፍፁም ነፃ ወጣ …እሰይ የምስራች
ደስይለናል ባንተ በትንሳኤው ብርሃን…እሰይየምስራች

VERSE 2
ከለሜዳ ለብሶ እርቃኑን የቆመው …..እሰይ የምስራች
የኛ መድኃኒዓለም ሞትን ድልአረገው…እሰይ የምስራች
ጨረቃና ከዋክብት ደም ለአለቀሱለት…እሰይ የምስራች
ሞትን ድልለነሳው እናመስግን በእውነት…እሰይ የምስራች

VERSE 3
መቅደላዊት ማርያም በጣም ደስይበልሽ…እሰይየምስራች
አምላክሽ ተነስቷል ከሐጢአት ያነፃሽ…እሰይ የምስራች
እናንተ ሐዋርያት በእምነት የፀናችሁ…እሰይ የምስራች
ፍራቻው ይወገድ ተነስቷል ጌታችሁ…እሰይ የምስራች

VERSE 4
ንገሩ ለዓለም ያረገላችሁን…… ……እሰይ የምስራች
ከሲኦል እስራት ያላቀቃችሁን…… …እሰይ የምስራች
እሰይ የምስራች ሰይጣን ድል ተመታ…እሰይ የምስራች
ዝማሬን እናቅርብ ሁላችን በእልልታ …እሰይ የምስራች',
      lyrics_transliteration = 'Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta

VERSE 1
Endemskin deha angetun qelso……esey yemsrach
Mihret laregeln embachn abso… esey yemsrach
Kebarnet qember fits’um nets’a wet’a …esey yemsrach
Desylenal bante betnsaew birhan…eseyyemsrach

VERSE 2
Kelemeda lebso erqanun yeqomew …..esey yemsrach
Yegna medhanialem motn dilaregew…esey yemsrach
Ch’ereqana kewakbt dem lealeqesulet…esey yemsrach
Motn dillenesaw enamesgn beewnet…esey yemsrach

VERSE 3
Meqdelawit Maryam bet’am desybelsh…eseyyemsrach
Amlaksh tenestwal kehet’iat yanets’ash…esey yemsrach
Enante hewaryat beemnet yets’enachhu…esey yemsrach
Firachaw yiweged tenestwal getachhu…esey yemsrach

VERSE 4
Nigeru lealem yaregelachhun…… ……esey yemsrach
Kesiol esrat yalaqeqachhun…… …esey yemsrach
Esey yemsrach seyt’an dil temeta…esey yemsrach
Zimaren enaqrb hulachn beellta …esey yemsrach',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'amanuel-amlak-misgana-yigebahal'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ

VERSE 1
እንደምስኪን ደሃ አንገቱን ቀልሶ……እሰይ የምስራች
ምህረት ላረገልን እምባችን አብሶ… እሰይ የምስራች
ከባርነት ቀምበር ፍፁም ነፃ ወጣ …እሰይ የምስራች
ደስይለናል ባንተ በትንሳኤው ብርሃን…እሰይየምስራች

CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ

VERSE 2
ከለሜዳ ለብሶ እርቃኑን የቆመው …..እሰይ የምስራች
የኛ መድኃኒዓለም ሞትን ድልአረገው…እሰይ የምስራች
ጨረቃና ከዋክብት ደም ለአለቀሱለት…እሰይ የምስራች
ሞትን ድልለነሳው እናመስግን በእውነት…እሰይ የምስራች

CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ

VERSE 3
መቅደላዊት ማርያም በጣም ደስይበልሽ…እሰይየምስራች
አምላክሽ ተነስቷል ከሐጢአት ያነፃሽ…እሰይ የምስራች
እናንተ ሐዋርያት በእምነት የፀናችሁ…እሰይ የምስራች
ፍራቻው ይወገድ ተነስቷል ጌታችሁ…እሰይ የምስራች

CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ

VERSE 4
ንገሩ ለዓለም ያረገላችሁን…… ……እሰይ የምስራች
ከሲኦል እስራት ያላቀቃችሁን…… …እሰይ የምስራች
እሰይ የምስራች ሰይጣን ድል ተመታ…እሰይ የምስራች
ዝማሬን እናቅርብ ሁላችን በእልልታ …እሰይ የምስራች

CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta

VERSE 1
Endemskin deha angetun qelso……esey yemsrach
Mihret laregeln embachn abso… esey yemsrach
Kebarnet qember fits’um nets’a wet’a …esey yemsrach
Desylenal bante betnsaew birhan…eseyyemsrach

CHORUS
Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta

VERSE 2
Kelemeda lebso erqanun yeqomew …..esey yemsrach
Yegna medhanialem motn dilaregew…esey yemsrach
Ch’ereqana kewakbt dem lealeqesulet…esey yemsrach
Motn dillenesaw enamesgn beewnet…esey yemsrach

CHORUS
Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta

VERSE 3
Meqdelawit Maryam bet’am desybelsh…eseyyemsrach
Amlaksh tenestwal kehet’iat yanets’ash…esey yemsrach
Enante hewaryat beemnet yets’enachhu…esey yemsrach
Firachaw yiweged tenestwal getachhu…esey yemsrach

CHORUS
Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta

VERSE 4
Nigeru lealem yaregelachhun…… ……esey yemsrach
Kesiol esrat yalaqeqachhun…… …esey yemsrach
Esey yemsrach seyt’an dil temeta…esey yemsrach
Zimaren enaqrb hulachn beellta …esey yemsrach

CHORUS
Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'amanuel-amlak-misgana-yigebahal', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Amanuel Temesgen (amanuel-temesgen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 1
ለዚህ ፍቅርህ ምን ልክፈል /2/

VERSE 2
ድብቁን ሃጢያት አንተ ብትገልጠው
ይቅር ብለኸኝ ባትሸፋፍነው
እንደሰው በቀል ቢኖርህ ጌታ
ለእኔ ሃጢያትስ የለውም ቦታ

VERSE 3
በየደቂቃው ሃጢያት ስሰራ
ስሰርቅ ስበድል አንተን ሳልፈራ
አንተ ግን ፊትህ ምንም ቢቀየም
በቁጣህ በትር አልገረፍከኝም

VERSE 4
ምህረትህን ልከህ አድነኝ ዛሬ
ታክቶኛልና በሃጢያት መኖሬ

VERSE 5
ዓለም በሃጢያት እየሳበችኝ
በፍቅርህ በደስታ መኖር አቃተኝ

VERSE 6
የሃጢያት ጉዞ ጣፋጭ ቢመስልም
ውጤቱ መሮ ፍጹም አይጥምም

VERSE 7
እንደ በደሌ ስላልከፈልከኝ
ተመስገን እንጂ ሌላ ምን አለኝ',
      lyrics_transliteration = 'Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 1
Lezih fiqirh min likfel (x2)

VERSE 2
Dibiqun hat’iyat ante bitigelt’ew
Yikir bilehign batishafafnew
Endesew beqel binorh geta
Lene hat’iyat yelewim bota

VERSE 3
Beyedekikaw hat’iyat sisera
Siserik sibedil anten salfera
Ante gin fitih minim bike’yem
Bequt’ah betir algerefkegn

VERSE 4
Mihretihin likih adnegn zare
Taktonyalna behat’iyat menoré

VERSE 5
Alem behat’iyat eyisabechign
Befiqirh bedesta menor aqategn

VERSE 6
Ye hat’iyat guzo tafach bimeslim
Witetu mero fits’um ayit’imim

VERSE 7
Ende bedelé silalkefel’kegn
Temesgen enji lela min alegn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'amanuel-temesgen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 1
ለዚህ ፍቅርህ ምን ልክፈል /2/

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 2
ድብቁን ሃጢያት አንተ ብትገልጠው
ይቅር ብለኸኝ ባትሸፋፍነው
እንደሰው በቀል ቢኖርህ ጌታ
ለእኔ ሃጢያትስ የለውም ቦታ

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 3
በየደቂቃው ሃጢያት ስሰራ
ስሰርቅ ስበድል አንተን ሳልፈራ
አንተ ግን ፊትህ ምንም ቢቀየም
በቁጣህ በትር አልገረፍከኝም

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 4
ምህረትህን ልከህ አድነኝ ዛሬ
ታክቶኛልና በሃጢያት መኖሬ

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 5
ዓለም በሃጢያት እየሳበችኝ
በፍቅርህ በደስታ መኖር አቃተኝ

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 6
የሃጢያት ጉዞ ጣፋጭ ቢመስልም
ውጤቱ መሮ ፍጹም አይጥምም

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/

VERSE 7
እንደ በደሌ ስላልከፈልከኝ
ተመስገን እንጂ ሌላ ምን አለኝ

CHORUS
አማን በአማን /2/
አማኑኤል ተመስገን /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 1
Lezih fiqirh min likfel (x2)

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 2
Dibiqun hat’iyat ante bitigelt’ew
Yikir bilehign batishafafnew
Endesew beqel binorh geta
Lene hat’iyat yelewim bota

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 3
Beyedekikaw hat’iyat sisera
Siserik sibedil anten salfera
Ante gin fitih minim bike’yem
Bequt’ah betir algerefkegn

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 4
Mihretihin likih adnegn zare
Taktonyalna behat’iyat menoré

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 5
Alem behat’iyat eyisabechign
Befiqirh bedesta menor aqategn

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 6
Ye hat’iyat guzo tafach bimeslim
Witetu mero fits’um ayit’imim

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)

VERSE 7
Ende bedelé silalkefel’kegn
Temesgen enji lela min alegn

CHORUS
Aman beaman (x2)
Amanuel temesgen (x2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'amanuel-temesgen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Amanuel Yikir Bay Newu (amanuel-yikir-bay-newu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 1
(2×)
አይምረኝም አትበሉ ጨካኝ ንጉስ አይደለም
ደሙ ብቻ ያነፃናል ከኃጢአታችን ዘላለም
እንደሞላ ጅረት ፈሶ ምድራችን አጥለቅልቋል

VERSE 2
የርሱ ምህረት ሃይል ሆኖት ስንቱ ከሞት አፈትልኳል
የጨለመው እየነጋ የተሻለ ቀን ይመጣል
በፍቀሩ ጦር ሳይወጋ ማን ከሞት ፊት ሮጦ ያመልጣል
ያን ክፉ ቀን በድል አልፈን እንደዋርካ የሰፋ ነው

VERSE 3
ነውርን ሁሉ በሚከድን በሞተልን በኢየሱስ ነው
የርሱን ፍቅር የሚያሸንፍ አንዳች ኃጢአት የለምና
ወደ ጌታ ለመመለስ አንዳች እንኳን እንዳንፈራ
ሀገራችን በሰማይ ነው (የ)ሚወድቅ የለም የሚረሳ

VERSE 4
ሰማያትን እንወርሳለን ከበጉ ደም የተነሳ
ወዳጅ አለን አንድ ብቻ በሰማይም በምድር
ስሙ ኢየሱስ የተባለ ሰውን ሁሉ የሚያፈቅር
ከመቃብር በላይ ሆኖ ፍቅሩ ዓለምን አስገረመ

VERSE 5
ይህን ሁሉ ጎስቋላ ሰው በትከሻው ተሸከመ',
      lyrics_transliteration = 'Amanuel yiqr bay new fiqr
Mihret kebot besemayat yeminor
Eyamemew abatun eyet’era
Aychalehu lemigedlut sirara

VERSE 1
(2×)
Aymregnm atbelu ch’ekagn nigus aydelem
Demu bicha yanets’anal kehat’iatachn zelalem
Endemola jiret feso midrachn at’leqlqwal

VERSE 2
Yersu mihret hayl honot sintu kemot afetlkwal
Yech’elemew eyenega yeteshale qen yimet’al
Befqeru t’or saywega man kemot fit rot’o yamelt’al
Yan kifu qen bedl alfen endewarka yesefa new

VERSE 3
Newrn hulu bemikedn bemoteln beiyesus new
Yersun fiqr yemiyashenf andach hat’iat yelemna
Wede Geta lememeles andach enkwan endanfera
Hegerachn besemay new (ye)miwedq yelem yemiresa

VERSE 4
Semayatn enwersalen kebegu dem yetenesa
Wedaj alen and bicha besemaym bemdr
Simu Iyesus yetebale sewn hulu yemiyafeqr
Kemeqabr belay hono fiqru alemn asgereme

VERSE 5
Yihn hulu gosqwala sew betkeshaw teshekeme',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'amanuel-yikir-bay-newu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 1
(2×)
አይምረኝም አትበሉ ጨካኝ ንጉስ አይደለም
ደሙ ብቻ ያነፃናል ከኃጢአታችን ዘላለም
እንደሞላ ጅረት ፈሶ ምድራችን አጥለቅልቋል

CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 2
የርሱ ምህረት ሃይል ሆኖት ስንቱ ከሞት አፈትልኳል
የጨለመው እየነጋ የተሻለ ቀን ይመጣል
በፍቀሩ ጦር ሳይወጋ ማን ከሞት ፊት ሮጦ ያመልጣል
ያን ክፉ ቀን በድል አልፈን እንደዋርካ የሰፋ ነው

CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 3
ነውርን ሁሉ በሚከድን በሞተልን በኢየሱስ ነው
የርሱን ፍቅር የሚያሸንፍ አንዳች ኃጢአት የለምና
ወደ ጌታ ለመመለስ አንዳች እንኳን እንዳንፈራ
ሀገራችን በሰማይ ነው (የ)ሚወድቅ የለም የሚረሳ

CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 4
ሰማያትን እንወርሳለን ከበጉ ደም የተነሳ
ወዳጅ አለን አንድ ብቻ በሰማይም በምድር
ስሙ ኢየሱስ የተባለ ሰውን ሁሉ የሚያፈቅር
ከመቃብር በላይ ሆኖ ፍቅሩ ዓለምን አስገረመ

CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 5
ይህን ሁሉ ጎስቋላ ሰው በትከሻው ተሸከመ

CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amanuel yiqr bay new fiqr
Mihret kebot besemayat yeminor
Eyamemew abatun eyet’era
Aychalehu lemigedlut sirara

VERSE 1
(2×)
Aymregnm atbelu ch’ekagn nigus aydelem
Demu bicha yanets’anal kehat’iatachn zelalem
Endemola jiret feso midrachn at’leqlqwal

CHORUS
Amanuel yiqr bay new fiqr
Mihret kebot besemayat yeminor
Eyamemew abatun eyet’era
Aychalehu lemigedlut sirara

VERSE 2
Yersu mihret hayl honot sintu kemot afetlkwal
Yech’elemew eyenega yeteshale qen yimet’al
Befqeru t’or saywega man kemot fit rot’o yamelt’al
Yan kifu qen bedl alfen endewarka yesefa new

CHORUS
Amanuel yiqr bay new fiqr
Mihret kebot besemayat yeminor
Eyamemew abatun eyet’era
Aychalehu lemigedlut sirara

VERSE 3
Newrn hulu bemikedn bemoteln beiyesus new
Yersun fiqr yemiyashenf andach hat’iat yelemna
Wede Geta lememeles andach enkwan endanfera
Hegerachn besemay new (ye)miwedq yelem yemiresa

CHORUS
Amanuel yiqr bay new fiqr
Mihret kebot besemayat yeminor
Eyamemew abatun eyet’era
Aychalehu lemigedlut sirara

VERSE 4
Semayatn enwersalen kebegu dem yetenesa
Wedaj alen and bicha besemaym bemdr
Simu Iyesus yetebale sewn hulu yemiyafeqr
Kemeqabr belay hono fiqru alemn asgereme

CHORUS
Amanuel yiqr bay new fiqr
Mihret kebot besemayat yeminor
Eyamemew abatun eyet’era
Aychalehu lemigedlut sirara

VERSE 5
Yihn hulu gosqwala sew betkeshaw teshekeme

CHORUS
Amanuel yiqr bay new fiqr
Mihret kebot besemayat yeminor
Eyamemew abatun eyet’era
Aychalehu lemigedlut sirara'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'amanuel-yikir-bay-newu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Amen libel Amen zemari yeabkal desalegn (amen-libel-amen-zemari-yeabkal-desalegn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 1
ማጉረምረሜ በቅቶ ተመስገን ማለት
ተለማምጃለሁ ስኖር በህይወት
የሚያስጨንቀኝን በእምነት ፊትህ ጥዬ
ያልከው ሆኖልኛል እንዳልከው ጌታዬ

VERSE 2
በጉድለት ቢሆን በከፍታ
በሙላት ቢሆን በዝቅታ
ደህና ነው በሉ አሜን በእምነት
በአሜን አለና ሰላም እረፍት

VERSE 3
በሰጠኸኝ ብዛት ከማመስገን ይልቅ
ባጣሁት ሳማርር ዘመኔ እንዳያልቅ
የእጅህን በረከት እንዲያይ የልብ አይኔ
ሁንልኝ አብርሆት ኢየሱስ መድህኔ

VERSE 4
በጉድለት ቢሆን በከፍታ
በሙላት ቢሆን በዝቅታ
ደህና ነው በሉ አሜን በእምነት
በአሜን አለና ሰላም እረፍት

VERSE 5
ባለፈው ሳነባ በትናንትናዬ
ከዛሬው በከፋ እንዳይሆን ነገዬ
ትክክል ነህ ማለት ተለማምጃለሁ
በምስጋና ሙላት መትረፍረፍ ስላየሁ

VERSE 6
በጉድለት ቢሆን በከፍታ
በሙላት ቢሆን በዝቅታ
ደህና ነው በሉ አሜን በእምነት
በአሜን አለና ሰላም እረፍት

VERSE 7
ብታገል ወዮልኝ ከሰሪዬ ጋራ
አትባልምና እንዲህ ስራ አትሰራ
እንደ ሀሳብህ ይሁን በእኔ ያለህ እቅድ
ስለምታውቅልኝ የሕይወቴን መንገድ

VERSE 8
በጉድለት ቢሆን በከፍታ
በሙላት ቢሆን በዝቅታ
ደህና ነው በሉ አሜን በእምነት
በአሜን አለና ሰላም እረፍት',
      lyrics_transliteration = 'Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 1
Maguremreme beqto temesgen malet
Telemamjalehu sinor behywet
Yemiyasch’enqegnn beemnet fith t’ye
Yalkew honolgnal endalkew Getaye

VERSE 2
Begudlet bihon bekefta
Bemulat bihon bezqta
Dehna new belu Amen beemnet
Beamen alena selam ereft

VERSE 3
Beset’eኸgn bizat kemamesgen yilq
Bat’ahut samarr zemene endayalq
Yeejhn bereket endiyay yelb ayne
Hunlgn abrhot Iyesus medhne

VERSE 4
Begudlet bihon bekefta
Bemulat bihon bezqta
Dehna new belu Amen beemnet
Beamen alena selam ereft

VERSE 5
Balefew saneba betnantnaye
Kezarew bekefa endayhon negeye
Tikkl neh malet telemamjalehu
Bemsgana mulat metrefref silayehu

VERSE 6
Begudlet bihon bekefta
Bemulat bihon bezqta
Dehna new belu Amen beemnet
Beamen alena selam ereft

VERSE 7
Bitagel weyolgn keseriye gara
Atbalmna endih sira atsera
Ende hesabh yihun beene yaleh eqd
Silemtawqlgn yehyweten menged

VERSE 8
Begudlet bihon bekefta
Bemulat bihon bezqta
Dehna new belu Amen beemnet
Beamen alena selam ereft',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'amen-libel-amen-zemari-yeabkal-desalegn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 1
ማጉረምረሜ በቅቶ ተመስገን ማለት
ተለማምጃለሁ ስኖር በህይወት
የሚያስጨንቀኝን በእምነት ፊትህ ጥዬ
ያልከው ሆኖልኛል እንዳልከው ጌታዬ

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 2
በጉድለት ቢሆን በከፍታ
በሙላት ቢሆን በዝቅታ
ደህና ነው በሉ አሜን በእምነት
በአሜን አለና ሰላም እረፍት

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 3
በሰጠኸኝ ብዛት ከማመስገን ይልቅ
ባጣሁት ሳማርር ዘመኔ እንዳያልቅ
የእጅህን በረከት እንዲያይ የልብ አይኔ
ሁንልኝ አብርሆት ኢየሱስ መድህኔ

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 4
በጉድለት ቢሆን በከፍታ
በሙላት ቢሆን በዝቅታ
ደህና ነው በሉ አሜን በእምነት
በአሜን አለና ሰላም እረፍት

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 5
ባለፈው ሳነባ በትናንትናዬ
ከዛሬው በከፋ እንዳይሆን ነገዬ
ትክክል ነህ ማለት ተለማምጃለሁ
በምስጋና ሙላት መትረፍረፍ ስላየሁ

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 6
በጉድለት ቢሆን በከፍታ
በሙላት ቢሆን በዝቅታ
ደህና ነው በሉ አሜን በእምነት
በአሜን አለና ሰላም እረፍት

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 7
ብታገል ወዮልኝ ከሰሪዬ ጋራ
አትባልምና እንዲህ ስራ አትሰራ
እንደ ሀሳብህ ይሁን በእኔ ያለህ እቅድ
ስለምታውቅልኝ የሕይወቴን መንገድ

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 8
በጉድለት ቢሆን በከፍታ
በሙላት ቢሆን በዝቅታ
ደህና ነው በሉ አሜን በእምነት
በአሜን አለና ሰላም እረፍት

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 1
Maguremreme beqto temesgen malet
Telemamjalehu sinor behywet
Yemiyasch’enqegnn beemnet fith t’ye
Yalkew honolgnal endalkew Getaye

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 2
Begudlet bihon bekefta
Bemulat bihon bezqta
Dehna new belu Amen beemnet
Beamen alena selam ereft

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 3
Beset’eኸgn bizat kemamesgen yilq
Bat’ahut samarr zemene endayalq
Yeejhn bereket endiyay yelb ayne
Hunlgn abrhot Iyesus medhne

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 4
Begudlet bihon bekefta
Bemulat bihon bezqta
Dehna new belu Amen beemnet
Beamen alena selam ereft

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 5
Balefew saneba betnantnaye
Kezarew bekefa endayhon negeye
Tikkl neh malet telemamjalehu
Bemsgana mulat metrefref silayehu

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 6
Begudlet bihon bekefta
Bemulat bihon bezqta
Dehna new belu Amen beemnet
Beamen alena selam ereft

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 7
Bitagel weyolgn keseriye gara
Atbalmna endih sira atsera
Ende hesabh yihun beene yaleh eqd
Silemtawqlgn yehyweten menged

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 8
Begudlet bihon bekefta
Bemulat bihon bezqta
Dehna new belu Amen beemnet
Beamen alena selam ereft

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'amen-libel-amen-zemari-yeabkal-desalegn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Amen ye atbiya kokebe deacon zemari Hawaz tegegn / vidio clip (amen-ye-atbiya-kokebe-deacon-zemari-hawaz-tegegn-vidio-clip)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 1
ደመና ባይኖር ማን ይወድስሃል
ምድረበዳውን ኣረስርሰሃል
ኣሜን
የዘይቱ ቀን ይዘላል ፊቴ

VERSE 2
ቅብኣለ ዜሬ ድል ኣለ ቤቴ
በሩን ክፈቱት ይግባ ወዳጄ
የነፍሴ ነፍስዋን የወይን ጠዤ
ኣሜን

VERSE 3
ሰባቱ መቅረዝ ኣሉ በፊት
ዛሬም ህያው ነው ታላቅነት
የዝግብዋላ ተንቀጠቀጠ
ድምጽህን ሰምቶ ሞት ደነገጠ

VERSE 4
ኣሜን
ከሁሉ ይበልጣል ውዴ ልዩ ነው
በቆንዳላውላይ ውብ ሽቶ ይለው
የ ጥበብ ሰዎች ኣዩት ስያበራ

VERSE 5
ይጥብያ ኮኮቤ ውዶ ሙሽራ
ኣሜን',
      lyrics_transliteration = 'Amen yet’bya kokobe dimeq belbe bira
Kiberlgn eyesus afe zinahn yiwra (2)
Alegn mawera alegn talaq qal
Kidus menfesn endawlo yinet’qal

VERSE 1
Demena baynor man yiwedshal
Midrebedawn aresrsehal
Amen
Yezeytu qen yizelal fite

VERSE 2
Qibale zere dil ale bete
Berun kifetut yigba wedaje
Yenefse nefswan yeweyn t’ezhe
Amen

VERSE 3
Sebatu meqrez alu befit
Zarem hiyaw new talaqnet
Yezgbwala tenqet’eqet’e
Dimts’hn semto mot deneget’e

VERSE 4
Amen
Kehulu yibelt’al wide liyu new
Beqondalawlay wib shto yilew
Ye t’beb sewoch ayut siyabera

VERSE 5
Yit’bya kokobe wido mushra
Amen',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'amen-ye-atbiya-kokebe-deacon-zemari-hawaz-tegegn-vidio-clip'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 1
ደመና ባይኖር ማን ይወድስሃል
ምድረበዳውን ኣረስርሰሃል
ኣሜን
የዘይቱ ቀን ይዘላል ፊቴ

CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 2
ቅብኣለ ዜሬ ድል ኣለ ቤቴ
በሩን ክፈቱት ይግባ ወዳጄ
የነፍሴ ነፍስዋን የወይን ጠዤ
ኣሜን

CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 3
ሰባቱ መቅረዝ ኣሉ በፊት
ዛሬም ህያው ነው ታላቅነት
የዝግብዋላ ተንቀጠቀጠ
ድምጽህን ሰምቶ ሞት ደነገጠ

CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 4
ኣሜን
ከሁሉ ይበልጣል ውዴ ልዩ ነው
በቆንዳላውላይ ውብ ሽቶ ይለው
የ ጥበብ ሰዎች ኣዩት ስያበራ

CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 5
ይጥብያ ኮኮቤ ውዶ ሙሽራ
ኣሜን

CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amen yet’bya kokobe dimeq belbe bira
Kiberlgn eyesus afe zinahn yiwra (2)
Alegn mawera alegn talaq qal
Kidus menfesn endawlo yinet’qal

VERSE 1
Demena baynor man yiwedshal
Midrebedawn aresrsehal
Amen
Yezeytu qen yizelal fite

CHORUS
Amen yet’bya kokobe dimeq belbe bira
Kiberlgn eyesus afe zinahn yiwra (2)
Alegn mawera alegn talaq qal
Kidus menfesn endawlo yinet’qal

VERSE 2
Qibale zere dil ale bete
Berun kifetut yigba wedaje
Yenefse nefswan yeweyn t’ezhe
Amen

CHORUS
Amen yet’bya kokobe dimeq belbe bira
Kiberlgn eyesus afe zinahn yiwra (2)
Alegn mawera alegn talaq qal
Kidus menfesn endawlo yinet’qal

VERSE 3
Sebatu meqrez alu befit
Zarem hiyaw new talaqnet
Yezgbwala tenqet’eqet’e
Dimts’hn semto mot deneget’e

CHORUS
Amen yet’bya kokobe dimeq belbe bira
Kiberlgn eyesus afe zinahn yiwra (2)
Alegn mawera alegn talaq qal
Kidus menfesn endawlo yinet’qal

VERSE 4
Amen
Kehulu yibelt’al wide liyu new
Beqondalawlay wib shto yilew
Ye t’beb sewoch ayut siyabera

CHORUS
Amen yet’bya kokobe dimeq belbe bira
Kiberlgn eyesus afe zinahn yiwra (2)
Alegn mawera alegn talaq qal
Kidus menfesn endawlo yinet’qal

VERSE 5
Yit’bya kokobe wido mushra
Amen

CHORUS
Amen yet’bya kokobe dimeq belbe bira
Kiberlgn eyesus afe zinahn yiwra (2)
Alegn mawera alegn talaq qal
Kidus menfesn endawlo yinet’qal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'amen-ye-atbiya-kokebe-deacon-zemari-hawaz-tegegn-vidio-clip', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ametun Asalfeh (ametun-asalfeh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ዓመቱን አሳልፈህ ለዚህ ያደረስከን (2)
ስለ ቸርነትህ ጌታ ሆይ ተመስገን (4)

VERSE 1
ዓመቱን አሳልፈህ ለዚህ ያደረስከን (2)
ስለ ቸርነትህ ጌታ ሆይ ተመስገን (4)',
      lyrics_transliteration = 'Ametun asalfeh le zih yaderesken (2)
Sile chernetih Geta hoy temesgen (4)

VERSE 1
Ametun asalfeh le zih yaderesken (2)
Sile chernetih Geta hoy temesgen (4)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ametun-asalfeh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዓመቱን አሳልፈህ ለዚህ ያደረስከን (2)
ስለ ቸርነትህ ጌታ ሆይ ተመስገን (4)

VERSE 1
ዓመቱን አሳልፈህ ለዚህ ያደረስከን (2)
ስለ ቸርነትህ ጌታ ሆይ ተመስገን (4)

CHORUS
ዓመቱን አሳልፈህ ለዚህ ያደረስከን (2)
ስለ ቸርነትህ ጌታ ሆይ ተመስገን (4)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ametun asalfeh le zih yaderesken (2)
Sile chernetih Geta hoy temesgen (4)

VERSE 1
Ametun asalfeh le zih yaderesken (2)
Sile chernetih Geta hoy temesgen (4)

CHORUS
Ametun asalfeh le zih yaderesken (2)
Sile chernetih Geta hoy temesgen (4)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ametun-asalfeh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Amilake Esirael (amilake-esirael)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = '> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 1
> (አዝ)
> ክብርህን ሳየው እጅግ እጠግባለሁ
> በረከት ሆነህ ጓዳዬን ሞላኸው
> የአምላኬ ሥራ ሁሌም ይደንቀኛል

VERSE 2
> እንዳንተ ያለ ከወዴት ይገኛል?
> (አዝ)
> ውለታህ ብዙ ተነግሮ አያልቅም
> ኃጢያተኛ ነው ብለህ ሰው አትንቅም

VERSE 3
> ጠላት ሊወግረኝ ድንጋይን ቢያነሳ
> አንተ ሆንክልኝ ከባቴ አበሳ
> (አዝ)
> በደልን ከድኖ ሞገስን የሚሰጥ

VERSE 4
> ከተኩላ መሐል ልጆቹን የሚመርጥ
> ማን እንደ ጌታ ርህሩህ አለና
> እስኪ ለስሙ ላቅርብ ምስጋና
> (አዝ)

VERSE 5
> ምህረትህ በዝቷል ለእኔ ያደረከው
> የኃጢአቴን ቅርፈት ከእኔ አስወገድከው
> ላመስግን አንተን ባለውለታዬን
> አትረፍርፈሃል በረከት ጓዳዬን',
      lyrics_transliteration = '> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 1
> (az)
> kibrhn sayew ejg et’egbalehu
> bereket honeh gwadayen molaኸw
> yeamlake sira hulem yidenqegnal

VERSE 2
> endante yale kewedet yigegnal?
> (az)
> wiletah bizu tenegro ayalqm
> hat’iyategna new bileh sew atnqm

VERSE 3
> t’elat liwegregn dingayn biyanesa
> ante honklgn kebate abesa
> (az)
> bedeln kedno mogesn yemiset’

VERSE 4
> ketekula mehel lijochun yemimert’
> man ende Geta rihruh alena
> eski lesmu laqrb misgana
> (az)

VERSE 5
> mihreth beztwal leene yaderekew
> yehat’iaten qirfet keene aswegedkew
> lamesgn anten balewletayen
> atrefrfehal bereket gwadayen',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'amilake-esirael'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 1
> (አዝ)
> ክብርህን ሳየው እጅግ እጠግባለሁ
> በረከት ሆነህ ጓዳዬን ሞላኸው
> የአምላኬ ሥራ ሁሌም ይደንቀኛል

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 2
> እንዳንተ ያለ ከወዴት ይገኛል?
> (አዝ)
> ውለታህ ብዙ ተነግሮ አያልቅም
> ኃጢያተኛ ነው ብለህ ሰው አትንቅም

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 3
> ጠላት ሊወግረኝ ድንጋይን ቢያነሳ
> አንተ ሆንክልኝ ከባቴ አበሳ
> (አዝ)
> በደልን ከድኖ ሞገስን የሚሰጥ

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 4
> ከተኩላ መሐል ልጆቹን የሚመርጥ
> ማን እንደ ጌታ ርህሩህ አለና
> እስኪ ለስሙ ላቅርብ ምስጋና
> (አዝ)

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 5
> ምህረትህ በዝቷል ለእኔ ያደረከው
> የኃጢአቴን ቅርፈት ከእኔ አስወገድከው
> ላመስግን አንተን ባለውለታዬን
> አትረፍርፈሃል በረከት ጓዳዬን

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 1
> (az)
> kibrhn sayew ejg et’egbalehu
> bereket honeh gwadayen molaኸw
> yeamlake sira hulem yidenqegnal

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 2
> endante yale kewedet yigegnal?
> (az)
> wiletah bizu tenegro ayalqm
> hat’iyategna new bileh sew atnqm

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 3
> t’elat liwegregn dingayn biyanesa
> ante honklgn kebate abesa
> (az)
> bedeln kedno mogesn yemiset’

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 4
> ketekula mehel lijochun yemimert’
> man ende Geta rihruh alena
> eski lesmu laqrb misgana
> (az)

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 5
> mihreth beztwal leene yaderekew
> yehat’iaten qirfet keene aswegedkew
> lamesgn anten balewletayen
> atrefrfehal bereket gwadayen

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'amilake-esirael', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Amilake Esirael (amilake-esirael-2414)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = '> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 1
> (አዝ)
> ክብርህን ሳየው እጅግ እጠግባለሁ
> በረከት ሆነህ ጓዳዬን ሞላኸው
> የአምላኬ ሥራ ሁሌም ይደንቀኛል

VERSE 2
> እንዳንተ ያለ ከወዴት ይገኛል?
> (አዝ)
> ውለታህ ብዙ ተነግሮ አያልቅም
> ኃጢያተኛ ነው ብለህ ሰው አትንቅም

VERSE 3
> ጠላት ሊወግረኝ ድንጋይን ቢያነሳ
> አንተ ሆንክልኝ ከባቴ አበሳ
> (አዝ)
> በደልን ከድኖ ሞገስን የሚሰጥ

VERSE 4
> ከተኩላ መሐል ልጆቹን የሚመርጥ
> ማን እንደ ጌታ ርህሩህ አለና
> እስኪ ለስሙ ላቅርብ ምስጋና
> (አዝ)

VERSE 5
> ምህረትህ በዝቷል ለእኔ ያደረከው
> የኃጢአቴን ቅርፈት ከእኔ አስወገድከው
> ላመስግን አንተን ባለውለታዬን
> አትረፍርፈሃል በረከት ጓዳዬን',
      lyrics_transliteration = '> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 1
> (az)
> kibrhn sayew ejg et’egbalehu
> bereket honeh gwadayen molaኸw
> yeamlake sira hulem yidenqegnal

VERSE 2
> endante yale kewedet yigegnal?
> (az)
> wiletah bizu tenegro ayalqm
> hat’iyategna new bileh sew atnqm

VERSE 3
> t’elat liwegregn dingayn biyanesa
> ante honklgn kebate abesa
> (az)
> bedeln kedno mogesn yemiset’

VERSE 4
> ketekula mehel lijochun yemimert’
> man ende Geta rihruh alena
> eski lesmu laqrb misgana
> (az)

VERSE 5
> mihreth beztwal leene yaderekew
> yehat’iaten qirfet keene aswegedkew
> lamesgn anten balewletayen
> atrefrfehal bereket gwadayen',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'amilake-esirael-2414'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 1
> (አዝ)
> ክብርህን ሳየው እጅግ እጠግባለሁ
> በረከት ሆነህ ጓዳዬን ሞላኸው
> የአምላኬ ሥራ ሁሌም ይደንቀኛል

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 2
> እንዳንተ ያለ ከወዴት ይገኛል?
> (አዝ)
> ውለታህ ብዙ ተነግሮ አያልቅም
> ኃጢያተኛ ነው ብለህ ሰው አትንቅም

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 3
> ጠላት ሊወግረኝ ድንጋይን ቢያነሳ
> አንተ ሆንክልኝ ከባቴ አበሳ
> (አዝ)
> በደልን ከድኖ ሞገስን የሚሰጥ

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 4
> ከተኩላ መሐል ልጆቹን የሚመርጥ
> ማን እንደ ጌታ ርህሩህ አለና
> እስኪ ለስሙ ላቅርብ ምስጋና
> (አዝ)

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 5
> ምህረትህ በዝቷል ለእኔ ያደረከው
> የኃጢአቴን ቅርፈት ከእኔ አስወገድከው
> ላመስግን አንተን ባለውለታዬን
> አትረፍርፈሃል በረከት ጓዳዬን

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 1
> (az)
> kibrhn sayew ejg et’egbalehu
> bereket honeh gwadayen molaኸw
> yeamlake sira hulem yidenqegnal

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 2
> endante yale kewedet yigegnal?
> (az)
> wiletah bizu tenegro ayalqm
> hat’iyategna new bileh sew atnqm

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 3
> t’elat liwegregn dingayn biyanesa
> ante honklgn kebate abesa
> (az)
> bedeln kedno mogesn yemiset’

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 4
> ketekula mehel lijochun yemimert’
> man ende Geta rihruh alena
> eski lesmu laqrb misgana
> (az)

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 5
> mihreth beztwal leene yaderekew
> yehat’iaten qirfet keene aswegedkew
> lamesgn anten balewletayen
> atrefrfehal bereket gwadayen

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'amilake-esirael-2414', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Amilake Esirael Kiberilign *** Bemuhaze Sibihat (amilake-esirael-kiberilign-bemuhaze-sibihat)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = '> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 1
> (አዝ)
> ክብርህን ሳየው እጅግ እጠግባለሁ
> በረከት ሆነህ ጓዳዬን ሞላኸው
> የአምላኬ ሥራ ሁሌም ይደንቀኛል

VERSE 2
> እንዳንተ ያለ ከወዴት ይገኛል?
> (አዝ)
> ውለታህ ብዙ ተነግሮ አያልቅም
> ኃጢያተኛ ነው ብለህ ሰው አትንቅም

VERSE 3
> ጠላት ሊወግረኝ ድንጋይን ቢያነሳ
> አንተ ሆንክልኝ ከባቴ አበሳ
> (አዝ)
> በደልን ከድኖ ሞገስን የሚሰጥ

VERSE 4
> ከተኩላ መሐል ልጆቹን የሚመርጥ
> ማን እንደ ጌታ ርህሩህ አለና
> እስኪ ለስሙ ላቅርብ ምስጋና
> (አዝ)

VERSE 5
> ምህረትህ በዝቷል ለእኔ ያደረከው
> የኃጢአቴን ቅርፈት ከእኔ አስወገድከው
> ላመስግን አንተን ባለውለታዬን
> አትረፍርፈሃል በረከት ጓዳዬን',
      lyrics_transliteration = '> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 1
> (az)
> kibrhn sayew ejg et’egbalehu
> bereket honeh gwadayen molaኸw
> yeamlake sira hulem yidenqegnal

VERSE 2
> endante yale kewedet yigegnal?
> (az)
> wiletah bizu tenegro ayalqm
> hat’iyategna new bileh sew atnqm

VERSE 3
> t’elat liwegregn dingayn biyanesa
> ante honklgn kebate abesa
> (az)
> bedeln kedno mogesn yemiset’

VERSE 4
> ketekula mehel lijochun yemimert’
> man ende Geta rihruh alena
> eski lesmu laqrb misgana
> (az)

VERSE 5
> mihreth beztwal leene yaderekew
> yehat’iaten qirfet keene aswegedkew
> lamesgn anten balewletayen
> atrefrfehal bereket gwadayen',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'amilake-esirael-kiberilign-bemuhaze-sibihat'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 1
> (አዝ)
> ክብርህን ሳየው እጅግ እጠግባለሁ
> በረከት ሆነህ ጓዳዬን ሞላኸው
> የአምላኬ ሥራ ሁሌም ይደንቀኛል

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 2
> እንዳንተ ያለ ከወዴት ይገኛል?
> (አዝ)
> ውለታህ ብዙ ተነግሮ አያልቅም
> ኃጢያተኛ ነው ብለህ ሰው አትንቅም

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 3
> ጠላት ሊወግረኝ ድንጋይን ቢያነሳ
> አንተ ሆንክልኝ ከባቴ አበሳ
> (አዝ)
> በደልን ከድኖ ሞገስን የሚሰጥ

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 4
> ከተኩላ መሐል ልጆቹን የሚመርጥ
> ማን እንደ ጌታ ርህሩህ አለና
> እስኪ ለስሙ ላቅርብ ምስጋና
> (አዝ)

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?

VERSE 5
> ምህረትህ በዝቷል ለእኔ ያደረከው
> የኃጢአቴን ቅርፈት ከእኔ አስወገድከው
> ላመስግን አንተን ባለውለታዬን
> አትረፍርፈሃል በረከት ጓዳዬን

CHORUS
> አምላከ እስራኤል ክበርልኝ
> በዘለዓለም ፍቅር የወደድከኝ
> ክንድህ ዘወትር ያበረታኛል
> እንዳንተ ያለ ከየት ይገኛል?'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 1
> (az)
> kibrhn sayew ejg et’egbalehu
> bereket honeh gwadayen molaኸw
> yeamlake sira hulem yidenqegnal

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 2
> endante yale kewedet yigegnal?
> (az)
> wiletah bizu tenegro ayalqm
> hat’iyategna new bileh sew atnqm

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 3
> t’elat liwegregn dingayn biyanesa
> ante honklgn kebate abesa
> (az)
> bedeln kedno mogesn yemiset’

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 4
> ketekula mehel lijochun yemimert’
> man ende Geta rihruh alena
> eski lesmu laqrb misgana
> (az)

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?

VERSE 5
> mihreth beztwal leene yaderekew
> yehat’iaten qirfet keene aswegedkew
> lamesgn anten balewletayen
> atrefrfehal bereket gwadayen

CHORUS
> amlake esrael kiberlgn
> bezelealem fiqr yewededkegn
> kindh zewetr yaberetagnal
> endante yale keyet yigegnal?'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'amilake-esirael-kiberilign-bemuhaze-sibihat', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Amilake Tekilehayimanot (amilake-tekilehayimanot)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 1
የኢቲሳ አንበሳ የኔ አባት
ቁጣውን አብርደው ተክለሐይማኖት
ለምልጃ ተነሳ የኔ አባት
ከሰማይ ካህናት ተክለሐይማኖት

VERSE 2
ቤተሰብ ሆነሃል የኔ አባት
የሥላሴን መንበር ተክለሐይማኖት
ለማጠን በቅተሀል የኔ አባት
ከከርቤ ከሚአ ተክለሃይማኖት

VERSE 3
ከሰሊክም በልጧል የኔ አባት
የፃድቁ ፀሎት ተክለሐይማኖት
በእግዚአብሔር ፊት ሸቷል የኔ አባት
ስለቃልኪዳንህ ተክለሐይማኖት

VERSE 4
አምላክ ይለመናል የኔ አባት
ፀሎትህ ሲደረስ ተክለሐይማኖት
እኛን ይታረቃል የኔ አባት
ተማፅነንብሃል ተክለሃይማኖት

VERSE 5
ጌታ ሆይ በስሙ የኔ አባት
በጻድቁ ፀሎት ተክለሐይማኖት
በስባረ አፅሙ የኔ አባት
ኢትዮጵያን በሙሉ ተክለሐይማኖት

VERSE 6
አስተምሮ ሲመለስ የኔ አባት
አፅመ ርስቱ ሆነች ተክለሐይማኖት
ደብረ ሊባኖስ የኔ አባት
የጻድቁ መንፈስ ተክለሃይማኖት

VERSE 7
ከቅዱሳን ጋራ የኔ አባት
ከልባችን ገብተህ ተክለሐይማኖት
ብርሃንን አብራ የኔ አባት
በፀሎትህ ስቆም ተክለሐይማኖት

VERSE 8
ስምህን ስጠራ የኔ አባት
ነፍሴ ተደሰተች ተክለሐይማኖት
ሲርቀኝ መከራ የኔ አባት',
      lyrics_transliteration = 'Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 1
Yeitisa anbesa yene abat
Qut’awn abrdew tekleheymanot
Lemlja tenesa yene abat
Kesemay kahnat tekleheymanot

VERSE 2
Beteseb honehal yene abat
Yeslasen menber tekleheymanot
Lemat’en beqtehel yene abat
Kekerbe kemia Tekle Haymanot

VERSE 3
Keselikm belt’wal yene abat
Yets’adqu ts’elot tekleheymanot
BeEgziabher fit shetwal yene abat
Sileqalkidanh tekleheymanot

VERSE 4
Amlak yilemenal yene abat
Ts’eloth sideres tekleheymanot
Egnan yitareqal yene abat
Temats’nenbhal Tekle Haymanot

VERSE 5
Geta hoy besmu yene abat
Bets’adqu ts’elot tekleheymanot
Besbare ats’mu yene abat
Ityop’yan bemulu tekleheymanot

VERSE 6
Astemro simeles yene abat
Ats’me ristu honech tekleheymanot
Debre libanos yene abat
Yets’adqu menfes Tekle Haymanot

VERSE 7
Keqdusan gara yene abat
Kelbachn gebteh tekleheymanot
Birhann abra yene abat
Bets’eloth siqom tekleheymanot

VERSE 8
Simhn sit’era yene abat
Nefse tedesetech tekleheymanot
Sirqegn mekera yene abat',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'amilake-tekilehayimanot'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 1
የኢቲሳ አንበሳ የኔ አባት
ቁጣውን አብርደው ተክለሐይማኖት
ለምልጃ ተነሳ የኔ አባት
ከሰማይ ካህናት ተክለሐይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 2
ቤተሰብ ሆነሃል የኔ አባት
የሥላሴን መንበር ተክለሐይማኖት
ለማጠን በቅተሀል የኔ አባት
ከከርቤ ከሚአ ተክለሃይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 3
ከሰሊክም በልጧል የኔ አባት
የፃድቁ ፀሎት ተክለሐይማኖት
በእግዚአብሔር ፊት ሸቷል የኔ አባት
ስለቃልኪዳንህ ተክለሐይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 4
አምላክ ይለመናል የኔ አባት
ፀሎትህ ሲደረስ ተክለሐይማኖት
እኛን ይታረቃል የኔ አባት
ተማፅነንብሃል ተክለሃይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 5
ጌታ ሆይ በስሙ የኔ አባት
በጻድቁ ፀሎት ተክለሐይማኖት
በስባረ አፅሙ የኔ አባት
ኢትዮጵያን በሙሉ ተክለሐይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 6
አስተምሮ ሲመለስ የኔ አባት
አፅመ ርስቱ ሆነች ተክለሐይማኖት
ደብረ ሊባኖስ የኔ አባት
የጻድቁ መንፈስ ተክለሃይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 7
ከቅዱሳን ጋራ የኔ አባት
ከልባችን ገብተህ ተክለሐይማኖት
ብርሃንን አብራ የኔ አባት
በፀሎትህ ስቆም ተክለሐይማኖት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት

VERSE 8
ስምህን ስጠራ የኔ አባት
ነፍሴ ተደሰተች ተክለሐይማኖት
ሲርቀኝ መከራ የኔ አባት

CHORUS
አምላከ ተክለሐይማኖት ማረን 2×
አምላከ ቅዱሳን ታረቀን 2×
ስለቃልኪዳንህ በቁጣ አታጥፋን
ሐዋርያው ቅዱስ ተክለሃይማኖት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 1
Yeitisa anbesa yene abat
Qut’awn abrdew tekleheymanot
Lemlja tenesa yene abat
Kesemay kahnat tekleheymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 2
Beteseb honehal yene abat
Yeslasen menber tekleheymanot
Lemat’en beqtehel yene abat
Kekerbe kemia Tekle Haymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 3
Keselikm belt’wal yene abat
Yets’adqu ts’elot tekleheymanot
BeEgziabher fit shetwal yene abat
Sileqalkidanh tekleheymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 4
Amlak yilemenal yene abat
Ts’eloth sideres tekleheymanot
Egnan yitareqal yene abat
Temats’nenbhal Tekle Haymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 5
Geta hoy besmu yene abat
Bets’adqu ts’elot tekleheymanot
Besbare ats’mu yene abat
Ityop’yan bemulu tekleheymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 6
Astemro simeles yene abat
Ats’me ristu honech tekleheymanot
Debre libanos yene abat
Yets’adqu menfes Tekle Haymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 7
Keqdusan gara yene abat
Kelbachn gebteh tekleheymanot
Birhann abra yene abat
Bets’eloth siqom tekleheymanot

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot

VERSE 8
Simhn sit’era yene abat
Nefse tedesetech tekleheymanot
Sirqegn mekera yene abat

CHORUS
Amlake tekleheymanot maren 2×
Amlake Kidusan tareqen 2×
Sileqalkidanh bequt’a atat’fan
Hewaryaw Kidus Tekle Haymanot'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'amilake-tekilehayimanot', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Amilaken Salifera (amilaken-salifera)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 1
ከትዕዛዙ ርቄ
ብታይ ባደባባይ
መች ሆንኩኝ አገልጋይ
አምላኬን ሳልፈራ

VERSE 2
ሰውንም ሳላፍር
ያሳለፍኩት ዘመን
እጅጉን ሲያሳፍር
ወንጌልን ተምሬ

VERSE 3
ማህተሙን አስሬ
ራሴን ከጣልኩኝ
ገና መች አመንኩኝ
ፆምን እየፆምኩኝ

VERSE 4
ፍቅርን ከረሳሁኝ
ይሻላል ብበላ
ሰውን ከምጠላ
አምላኬን ሳልፈራ

VERSE 5
ሰውንም ሳላፍር
ያሳለፍኩት ዘመን
እጅጉን ሲያሳፍር
ለቤቱ ክብር ቆሜ

VERSE 6
በብዙ ደክሜ
ከዘመትኩ ለኃጢአት
ጌታን አልሰማሁት
እርቅን የማልሰማ

VERSE 7
ከሆንኩኝ ደካማ
ካላወኩ ይቅርታ
የለኝም ስጦታ
አምላኬን ሳልፈራ

VERSE 8
ሰውንም ሳላፍር
ያሳለፍኩት ዘመን
እጅጉን ሲያሳፍር
ፆምን እየጾምኩኝ

VERSE 9
ፍቅርን ከረሳሁኝ
ይሻላል ብበላ
ሰውን ከምጠላ
የእግዚአብሔርን ምህረት

VERSE 10
አውጄ በሰው ፊት
ከክፉ ስራዬ
ካድኩት በኑሮዬ
አምላኬን ሳልፈራ

VERSE 11
ሰውንም ሳላፈራ
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር (2)',
      lyrics_transliteration = 'Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 1
Ketezazu riqe
Bitay badebabay
Mech honkugn agelgay
Amlaken salfera

VERSE 2
Sewnm salafr
Yasalefkut zemen
Ejgun siyasafr
Wengeln temre

VERSE 3
Mahtemun asre
Rasen ket’alkugn
Gena mech amenkugn
Ts’omn eyets’omkugn

VERSE 4
Fiqrn keresahugn
Yishalal bibela
Sewn kemt’ela
Amlaken salfera

VERSE 5
Sewnm salafr
Yasalefkut zemen
Ejgun siyasafr
Lebetu kibir qome

VERSE 6
Bebzu dekme
Kezemetku lehat’iat
Getan alsemahut
Erqn yemalsema

VERSE 7
Kehonkugn dekama
Kalaweku yiqrta
Yelegnm sit’ota
Amlaken salfera

VERSE 8
Sewnm salafr
Yasalefkut zemen
Ejgun siyasafr
Ts’omn eyets’omkugn

VERSE 9
Fiqrn keresahugn
Yishalal bibela
Sewn kemt’ela
Yeegziabhern mihret

VERSE 10
Awje besew fit
Kekfu siraye
Kadkut benuroye
Amlaken salfera

VERSE 11
Sewnm salafera
Yasalefkut zemen ejgun siyasafr (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'amilaken-salifera'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 1
ከትዕዛዙ ርቄ
ብታይ ባደባባይ
መች ሆንኩኝ አገልጋይ
አምላኬን ሳልፈራ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 2
ሰውንም ሳላፍር
ያሳለፍኩት ዘመን
እጅጉን ሲያሳፍር
ወንጌልን ተምሬ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 3
ማህተሙን አስሬ
ራሴን ከጣልኩኝ
ገና መች አመንኩኝ
ፆምን እየፆምኩኝ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 4
ፍቅርን ከረሳሁኝ
ይሻላል ብበላ
ሰውን ከምጠላ
አምላኬን ሳልፈራ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 5
ሰውንም ሳላፍር
ያሳለፍኩት ዘመን
እጅጉን ሲያሳፍር
ለቤቱ ክብር ቆሜ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 6
በብዙ ደክሜ
ከዘመትኩ ለኃጢአት
ጌታን አልሰማሁት
እርቅን የማልሰማ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 7
ከሆንኩኝ ደካማ
ካላወኩ ይቅርታ
የለኝም ስጦታ
አምላኬን ሳልፈራ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 8
ሰውንም ሳላፍር
ያሳለፍኩት ዘመን
እጅጉን ሲያሳፍር
ፆምን እየጾምኩኝ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 9
ፍቅርን ከረሳሁኝ
ይሻላል ብበላ
ሰውን ከምጠላ
የእግዚአብሔርን ምህረት

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 10
አውጄ በሰው ፊት
ከክፉ ስራዬ
ካድኩት በኑሮዬ
አምላኬን ሳልፈራ

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ

VERSE 11
ሰውንም ሳላፈራ
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር (2)

CHORUS
አምላኬን ሳልፈራ
ሰውንም ሳላፈር
ያሳለፍኩት ዘመን እጅጉን ሲያሳፍር
የሰውን ፊት ንቄ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 1
Ketezazu riqe
Bitay badebabay
Mech honkugn agelgay
Amlaken salfera

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 2
Sewnm salafr
Yasalefkut zemen
Ejgun siyasafr
Wengeln temre

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 3
Mahtemun asre
Rasen ket’alkugn
Gena mech amenkugn
Ts’omn eyets’omkugn

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 4
Fiqrn keresahugn
Yishalal bibela
Sewn kemt’ela
Amlaken salfera

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 5
Sewnm salafr
Yasalefkut zemen
Ejgun siyasafr
Lebetu kibir qome

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 6
Bebzu dekme
Kezemetku lehat’iat
Getan alsemahut
Erqn yemalsema

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 7
Kehonkugn dekama
Kalaweku yiqrta
Yelegnm sit’ota
Amlaken salfera

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 8
Sewnm salafr
Yasalefkut zemen
Ejgun siyasafr
Ts’omn eyets’omkugn

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 9
Fiqrn keresahugn
Yishalal bibela
Sewn kemt’ela
Yeegziabhern mihret

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 10
Awje besew fit
Kekfu siraye
Kadkut benuroye
Amlaken salfera

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe

VERSE 11
Sewnm salafera
Yasalefkut zemen ejgun siyasafr (2)

CHORUS
Amlaken salfera
Sewnm salafer
Yasalefkut zemen ejgun siyasafr
Yesewn fit niqe'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'amilaken-salifera', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Aminen Tenesitenal (aminen-tenesitenal)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አምነን ተነስተናል ስምህን ይዘን
ፍቅርህን ማዳንህን ተስፋ እያደረግን
አብረኸን ስትወጣ እናሸንፋለን
ቀኝህ ስትረዳን ምድርን እንወርሳለን

VERSE 1
አብርሃም አመነ ፀደቀች ሕይወቱ
ቃልህን ሰምቶ ወጣ ከዘመድ ከሃብቱ
ጌትነትህን አምኖ ታዞ ስለኖረ
በነፍስም በሥጋም መንገዱ ሰመረ

VERSE 2
ማለፍ እንችላለን የእሳቱን ቅጥር
ያመነው ታማኝ ነው የማያሳፍር
ከዮርዳኖስ ማዶ ተረስተን አንቀርም
ቃል የገባልንን ሳንወርሰው አንሞትም

VERSE 3
ነገስታትም ድል ለሱ ከሰይፍ አመለጡ
የአንበሳን አፍ ዘጉ ከእሳት ውስጥ ወጡ
ሁሉን ነገር ንቀው በስምህ መነኑ
ከበሩ ተሾሙ አንተን ስላመኑ

VERSE 4
ጀልባችንን ቀዝፈን ከመሃል ደርሰናል
መረባችንንም በቀኝ ጥለናል
ከንቱ ሆኖ እንዳይቀር ልፋት ድካማችን
ፍፃሜው እንዲያምር እርዳን አባታችን',
      lyrics_transliteration = 'Amnen tenestenal simhn yizen
Fiqrhn madanhn tesfa eyaderegn
Abreኸn sitwet’a enashenfalen
Qegnh sitredan midrn enwersalen

VERSE 1
Abrham amene ts’edeqech hiywetu
Qalhn semto wet’a kezemed kehabtu
Getnethn amno tazo silenore
Benefsm besgam mengedu semere

VERSE 2
Malef enchlalen yeesatun qit’r
Yamenew tamagn new yemayasafr
Keyordanos mado teresten anqerm
Qal yegebalnn sanwersew anmotm

VERSE 3
Negestatm dil lesu keseyf amelet’u
Yeanbesan af zegu keesat wist’ wet’u
Hulun neger niqew besmh menenu
Keberu teshomu anten silamenu

VERSE 4
Jelbachnn qezfen kemehal dersenal
Merebachnnm beqegn t’lenal
Kentu hono endayqer lifat dikamachn
Fits’amew endiyamr erdan Abatachen',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'aminen-tenesitenal'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አምነን ተነስተናል ስምህን ይዘን
ፍቅርህን ማዳንህን ተስፋ እያደረግን
አብረኸን ስትወጣ እናሸንፋለን
ቀኝህ ስትረዳን ምድርን እንወርሳለን

VERSE 1
አብርሃም አመነ ፀደቀች ሕይወቱ
ቃልህን ሰምቶ ወጣ ከዘመድ ከሃብቱ
ጌትነትህን አምኖ ታዞ ስለኖረ
በነፍስም በሥጋም መንገዱ ሰመረ

CHORUS
አምነን ተነስተናል ስምህን ይዘን
ፍቅርህን ማዳንህን ተስፋ እያደረግን
አብረኸን ስትወጣ እናሸንፋለን
ቀኝህ ስትረዳን ምድርን እንወርሳለን

VERSE 2
ማለፍ እንችላለን የእሳቱን ቅጥር
ያመነው ታማኝ ነው የማያሳፍር
ከዮርዳኖስ ማዶ ተረስተን አንቀርም
ቃል የገባልንን ሳንወርሰው አንሞትም

CHORUS
አምነን ተነስተናል ስምህን ይዘን
ፍቅርህን ማዳንህን ተስፋ እያደረግን
አብረኸን ስትወጣ እናሸንፋለን
ቀኝህ ስትረዳን ምድርን እንወርሳለን

VERSE 3
ነገስታትም ድል ለሱ ከሰይፍ አመለጡ
የአንበሳን አፍ ዘጉ ከእሳት ውስጥ ወጡ
ሁሉን ነገር ንቀው በስምህ መነኑ
ከበሩ ተሾሙ አንተን ስላመኑ

CHORUS
አምነን ተነስተናል ስምህን ይዘን
ፍቅርህን ማዳንህን ተስፋ እያደረግን
አብረኸን ስትወጣ እናሸንፋለን
ቀኝህ ስትረዳን ምድርን እንወርሳለን

VERSE 4
ጀልባችንን ቀዝፈን ከመሃል ደርሰናል
መረባችንንም በቀኝ ጥለናል
ከንቱ ሆኖ እንዳይቀር ልፋት ድካማችን
ፍፃሜው እንዲያምር እርዳን አባታችን

CHORUS
አምነን ተነስተናል ስምህን ይዘን
ፍቅርህን ማዳንህን ተስፋ እያደረግን
አብረኸን ስትወጣ እናሸንፋለን
ቀኝህ ስትረዳን ምድርን እንወርሳለን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amnen tenestenal simhn yizen
Fiqrhn madanhn tesfa eyaderegn
Abreኸn sitwet’a enashenfalen
Qegnh sitredan midrn enwersalen

VERSE 1
Abrham amene ts’edeqech hiywetu
Qalhn semto wet’a kezemed kehabtu
Getnethn amno tazo silenore
Benefsm besgam mengedu semere

CHORUS
Amnen tenestenal simhn yizen
Fiqrhn madanhn tesfa eyaderegn
Abreኸn sitwet’a enashenfalen
Qegnh sitredan midrn enwersalen

VERSE 2
Malef enchlalen yeesatun qit’r
Yamenew tamagn new yemayasafr
Keyordanos mado teresten anqerm
Qal yegebalnn sanwersew anmotm

CHORUS
Amnen tenestenal simhn yizen
Fiqrhn madanhn tesfa eyaderegn
Abreኸn sitwet’a enashenfalen
Qegnh sitredan midrn enwersalen

VERSE 3
Negestatm dil lesu keseyf amelet’u
Yeanbesan af zegu keesat wist’ wet’u
Hulun neger niqew besmh menenu
Keberu teshomu anten silamenu

CHORUS
Amnen tenestenal simhn yizen
Fiqrhn madanhn tesfa eyaderegn
Abreኸn sitwet’a enashenfalen
Qegnh sitredan midrn enwersalen

VERSE 4
Jelbachnn qezfen kemehal dersenal
Merebachnnm beqegn t’lenal
Kentu hono endayqer lifat dikamachn
Fits’amew endiyamr erdan Abatachen

CHORUS
Amnen tenestenal simhn yizen
Fiqrhn madanhn tesfa eyaderegn
Abreኸn sitwet’a enashenfalen
Qegnh sitredan midrn enwersalen'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'aminen-tenesitenal', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Amisitu Hazenat (amisitu-hazenat)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 1
በመምጻቱ ወር በአርባኛው ቀን
ስምዖን አረጋዊ ታቀፈና ጌታን
ትንቢት ተናገረ ተገልፆለት ሞቱ
በነፍስሽ ሰይፍ ያልፋል አንቺም እናቲቱ

VERSE 2
ይህንን መከራ ሲሰማ ጆሮዋ
አምርራ አለቀሰች አልቆም አለ እንባዋ

VERSE 3
በ12 ዓመቱ ለማክበር በዓልን
በኢየሩሳሌም ቢገኝ አማኑኤል
ሲጠይቅ ሲሰማ በቤተ መቅደሱ
የኦሪት ካህናት ሲደነቁ በእርሱ

VERSE 4
እስከ ሦስት ቀን ድረስ ብታጣው ፈልጋ
ልቧ ተገረፈ በኃዘን አለንጋ

VERSE 5
ጠዋት በማለዳ በጲላጦስ ደጅ
ሲጸናበት አይታ የጨካኞች እጅ
እርቃኑን አድርገው ያለአንዳች ጥፋት
ከግንድ ጋር አስረው ጀርባው ሲገርፉት

VERSE 6
እንዴትስ አታለቅስ እንዴት አታነባ
ሲገርፉት ሲያዳፉት ልጇን እንደሌባ

VERSE 7
የዓለሙን ፈጣሪ የዓለሙን ዳኛ
ንፁሁን ጌታ መስሏቸው ቀማኛ
እጁና እግሮቹን በችንካር ወጥረው
በወንበዴ መሀል ሰቅለውት ብታየው

VERSE 8
ድንግል አለቀሰች አልቻለች መጽናናት
እንባዋ ወረደ እንደ ክረምት ጅረት

VERSE 9
ዮሴፍ ኒቆዲሞስ በአንድ ሲማከሩ
ቅዱስ ኃያል ብለው ገንዘው ሊቀብሩ
በአዲስ መቃብር በ11ኛው ሰዓት
ስጋውን አኑረው በድንጋይ ቢዘጉት

VERSE 10
እያለች አነባች አንድ ልጄ እኮ ነው
ከሱ የሚቀድም ተከታይ የሌለው',
      lyrics_transliteration = 'Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 1
Bememts’atu wer bearbagnaw qen
Simon aregawi taqefena getan
Tinbit tenagere tegelts’olet motu
Benefssh seyf yalfal anchim enatitu

VERSE 2
Yihnn mekera sisema jorowa
Amrra aleqesech alqom ale enbawa

VERSE 3
Be12 ametu lemakber bealn
Beiyerusalem bigegn Amanuel
Sit’eyq sisema bebete meqdesu
Yeorit kahnat sidenequ beersu

VERSE 4
Eske sost qen dires bitat’aw felga
Libwa tegerefe behazen alenga

VERSE 5
T’ewat bemaleda bep’ilat’os dej
Sits’enabet ayta yech’ekagnoch ej
Erqanun adrgew yaleandach t’fat
Kegnd gar asrew jerbaw sigerfut

VERSE 6
Endets ataleqs endet ataneba
Sigerfut siyadafut lijwan endeleba

VERSE 7
Yealemun fet’ari yealemun dagna
Nits’uhun Geta meslwachew qemagna
Ejuna egrochun bechnkar wet’rew
Bewenbede mehel seqlewt bitayew

VERSE 8
Dingil aleqesech alchalech mets’nanat
Enbawa werede ende kiremt jiret

VERSE 9
Yosef niqodimos beand simakeru
Kidus hayal bilew genzew liqebru
Beadis meqabr be11gnaw seat
Sigawn anurew bedngay bizegut

VERSE 10
Eyalech anebach and lije eko new
Kesu yemiqedm teketay yelelew',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'amisitu-hazenat'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 1
በመምጻቱ ወር በአርባኛው ቀን
ስምዖን አረጋዊ ታቀፈና ጌታን
ትንቢት ተናገረ ተገልፆለት ሞቱ
በነፍስሽ ሰይፍ ያልፋል አንቺም እናቲቱ

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 2
ይህንን መከራ ሲሰማ ጆሮዋ
አምርራ አለቀሰች አልቆም አለ እንባዋ

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 3
በ12 ዓመቱ ለማክበር በዓልን
በኢየሩሳሌም ቢገኝ አማኑኤል
ሲጠይቅ ሲሰማ በቤተ መቅደሱ
የኦሪት ካህናት ሲደነቁ በእርሱ

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 4
እስከ ሦስት ቀን ድረስ ብታጣው ፈልጋ
ልቧ ተገረፈ በኃዘን አለንጋ

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 5
ጠዋት በማለዳ በጲላጦስ ደጅ
ሲጸናበት አይታ የጨካኞች እጅ
እርቃኑን አድርገው ያለአንዳች ጥፋት
ከግንድ ጋር አስረው ጀርባው ሲገርፉት

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 6
እንዴትስ አታለቅስ እንዴት አታነባ
ሲገርፉት ሲያዳፉት ልጇን እንደሌባ

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 7
የዓለሙን ፈጣሪ የዓለሙን ዳኛ
ንፁሁን ጌታ መስሏቸው ቀማኛ
እጁና እግሮቹን በችንካር ወጥረው
በወንበዴ መሀል ሰቅለውት ብታየው

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 8
ድንግል አለቀሰች አልቻለች መጽናናት
እንባዋ ወረደ እንደ ክረምት ጅረት

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 9
ዮሴፍ ኒቆዲሞስ በአንድ ሲማከሩ
ቅዱስ ኃያል ብለው ገንዘው ሊቀብሩ
በአዲስ መቃብር በ11ኛው ሰዓት
ስጋውን አኑረው በድንጋይ ቢዘጉት

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 10
እያለች አነባች አንድ ልጄ እኮ ነው
ከሱ የሚቀድም ተከታይ የሌለው

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 1
Bememts’atu wer bearbagnaw qen
Simon aregawi taqefena getan
Tinbit tenagere tegelts’olet motu
Benefssh seyf yalfal anchim enatitu

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 2
Yihnn mekera sisema jorowa
Amrra aleqesech alqom ale enbawa

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 3
Be12 ametu lemakber bealn
Beiyerusalem bigegn Amanuel
Sit’eyq sisema bebete meqdesu
Yeorit kahnat sidenequ beersu

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 4
Eske sost qen dires bitat’aw felga
Libwa tegerefe behazen alenga

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 5
T’ewat bemaleda bep’ilat’os dej
Sits’enabet ayta yech’ekagnoch ej
Erqanun adrgew yaleandach t’fat
Kegnd gar asrew jerbaw sigerfut

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 6
Endets ataleqs endet ataneba
Sigerfut siyadafut lijwan endeleba

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 7
Yealemun fet’ari yealemun dagna
Nits’uhun Geta meslwachew qemagna
Ejuna egrochun bechnkar wet’rew
Bewenbede mehel seqlewt bitayew

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 8
Dingil aleqesech alchalech mets’nanat
Enbawa werede ende kiremt jiret

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 9
Yosef niqodimos beand simakeru
Kidus hayal bilew genzew liqebru
Beadis meqabr be11gnaw seat
Sigawn anurew bedngay bizegut

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 10
Eyalech anebach and lije eko new
Kesu yemiqedm teketay yelelew

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'amisitu-hazenat', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Amlak Tekle Haymanot (amlak-tekle-haymanot)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 1
ስለ ቃል ኪዳንህ በቁጣህ አታጥፋን

VERSE 2
ሃዋርያው ቅዱስ ተክለ ሀይማኖት
የእቲሳ አንበሳ የእኔ አባት

VERSE 3
ቁጣውን አብርደው ተክለሀይማኖት
በምልጃ ተነሳ የኔ አባት

VERSE 4
ቁጣውን አብርደው ተክለሀይማኖት
ቤተሰብ ሆነሃል የእኔ አባት

VERSE 5
ከሰማይ ካህናት ተክለሀይማኖት
ቤተሰብ ሆነሃል የእኔ አባት

VERSE 6
የስላሴን መንበር ተክለሀይማኖት
ለማጠን በቅተሃል የእኔ አባት

VERSE 7
ከከርቤ ከሚአ ተክልሀይማኖት
ከሰሊክም በልጧል የእኔ አባት

VERSE 8
የጻድቁ ጸሎት ተክልሀይማኖት
በእግዚአብሔር ፊት ሸቷል

VERSE 9
ስለቃልኪዳንህ ተክለሀይማኖት
አምላክ ይለመናል የእኔ አባት

VERSE 10
ጸሎት ሲደርስ ተክለሀይማኖት
እኛን ይታረቃል የእኔ አባት

VERSE 11
ተማጽነንብሃል ተክለ ሃይማኖት
ጌታ ሆይ በስሙ የእኔ አባት

VERSE 12
በጻድቁ ጸሎት ተክለሀይማኖት
በሰባራ አጽሙ የእኔ አባት

VERSE 13
ኢትዮጵያን በሙሉ ተክለሀይማኖት
አስተምሮ ሲመለስ የእኔ አባት

VERSE 14
አጽመ ርስቱ ሆነቸህ ተክለሀይማኖት
ደብረ ሊባኖስ የእኔ አባት

VERSE 15
የጸድቁ መንፈስ ተክለሀይማኖት
ከቅዱሳን ጋራ የእኔ አባት

VERSE 16
ከልባችን ገብተህ ተክለሀይማኖት
ብርሀንን አበራ የእኔ አባት

VERSE 17
በጸሎት ስቁም ተክለሀይማኖት
ስምህን ስጠራ የእኔ አባት

VERSE 18
ነፍሴ ተደሰተች ተክለሀይማኖት
ሲርቀኝ መከራ የእኔ አባት',
      lyrics_transliteration = 'Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 1
Sile qal kidanih bequt’ah atat’fan

VERSE 2
Hawariyaw Kidus Tekle Haymanot
Ye’itisa anbessa yene abat

VERSE 3
Qut’awn abriddew Tekle Haymanot
Bemilija tenesa yene abat

VERSE 4
Qut’awn abriddew Tekle Haymanot
Beteseb honehal yene abat

VERSE 5
Kesemay kahnat Tekle Haymanot
Beteseb honehal yene abat

VERSE 6
Yesilase menber Tekle Haymanot
Lematon beqtehal yene abat

VERSE 7
Kekerbe kemia Tekle Haymanot
Keselikim bel’twal yene abat

VERSE 8
Yetsadiku tselot Tekle Haymanot
BeEgziabher fit shetwal

VERSE 9
Sile qal kidanih Tekle Haymanot
Amlak yilemenal yene abat

VERSE 10
Tselot sidires Tekle Haymanot
Enyan yitarekal yene abat

VERSE 11
Tematsnenbihal Tekle Haymanot
Geta hoy besimih yene abat

VERSE 12
Betsadiku tselot Tekle Haymanot
Besebara atsmu yene abat

VERSE 13
Ityopiyan bemulu Tekle Haymanot
Astemro simeles yene abat

VERSE 14
Atsme ristu honetch Tekle Haymanot
Debre Libanos yene abat

VERSE 15
Yetsadiku menfes Tekle Haymanot
Kekidusan gara yene abat

VERSE 16
Kelbachin gebteh Tekle Haymanot
Birhanen abera yene abat

VERSE 17
Beteslot sik’um Tekle Haymanot
Simihn sit’era yene abat

VERSE 18
Nefsé tedesetech Tekle Haymanot
Sir’qegn mekara yene abat',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'amlak-tekle-haymanot'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 1
ስለ ቃል ኪዳንህ በቁጣህ አታጥፋን

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 2
ሃዋርያው ቅዱስ ተክለ ሀይማኖት
የእቲሳ አንበሳ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 3
ቁጣውን አብርደው ተክለሀይማኖት
በምልጃ ተነሳ የኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 4
ቁጣውን አብርደው ተክለሀይማኖት
ቤተሰብ ሆነሃል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 5
ከሰማይ ካህናት ተክለሀይማኖት
ቤተሰብ ሆነሃል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 6
የስላሴን መንበር ተክለሀይማኖት
ለማጠን በቅተሃል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 7
ከከርቤ ከሚአ ተክልሀይማኖት
ከሰሊክም በልጧል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 8
የጻድቁ ጸሎት ተክልሀይማኖት
በእግዚአብሔር ፊት ሸቷል

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 9
ስለቃልኪዳንህ ተክለሀይማኖት
አምላክ ይለመናል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 10
ጸሎት ሲደርስ ተክለሀይማኖት
እኛን ይታረቃል የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 11
ተማጽነንብሃል ተክለ ሃይማኖት
ጌታ ሆይ በስሙ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 12
በጻድቁ ጸሎት ተክለሀይማኖት
በሰባራ አጽሙ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 13
ኢትዮጵያን በሙሉ ተክለሀይማኖት
አስተምሮ ሲመለስ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 14
አጽመ ርስቱ ሆነቸህ ተክለሀይማኖት
ደብረ ሊባኖስ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 15
የጸድቁ መንፈስ ተክለሀይማኖት
ከቅዱሳን ጋራ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 16
ከልባችን ገብተህ ተክለሀይማኖት
ብርሀንን አበራ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 17
በጸሎት ስቁም ተክለሀይማኖት
ስምህን ስጠራ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)

VERSE 18
ነፍሴ ተደሰተች ተክለሀይማኖት
ሲርቀኝ መከራ የእኔ አባት

CHORUS
አምላከ ተክለሀይማኖት ማረን (2)
አምላከ ቅዱሳን ታረቀን (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 1
Sile qal kidanih bequt’ah atat’fan

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 2
Hawariyaw Kidus Tekle Haymanot
Ye’itisa anbessa yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 3
Qut’awn abriddew Tekle Haymanot
Bemilija tenesa yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 4
Qut’awn abriddew Tekle Haymanot
Beteseb honehal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 5
Kesemay kahnat Tekle Haymanot
Beteseb honehal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 6
Yesilase menber Tekle Haymanot
Lematon beqtehal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 7
Kekerbe kemia Tekle Haymanot
Keselikim bel’twal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 8
Yetsadiku tselot Tekle Haymanot
BeEgziabher fit shetwal

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 9
Sile qal kidanih Tekle Haymanot
Amlak yilemenal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 10
Tselot sidires Tekle Haymanot
Enyan yitarekal yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 11
Tematsnenbihal Tekle Haymanot
Geta hoy besimih yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 12
Betsadiku tselot Tekle Haymanot
Besebara atsmu yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 13
Ityopiyan bemulu Tekle Haymanot
Astemro simeles yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 14
Atsme ristu honetch Tekle Haymanot
Debre Libanos yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 15
Yetsadiku menfes Tekle Haymanot
Kekidusan gara yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 16
Kelbachin gebteh Tekle Haymanot
Birhanen abera yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 17
Beteslot sik’um Tekle Haymanot
Simihn sit’era yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)

VERSE 18
Nefsé tedesetech Tekle Haymanot
Sir’qegn mekara yene abat

CHORUS
Amlake Tekle Haymanot maren (x2)
Amlake Kidusan tareken (x2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'amlak-tekle-haymanot', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: An amazing Spiritual Song By D. Teame Segid (an-amazing-spiritual-song-by-d-teame-segid)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 1
ሓጢኣይ ተመንዪኒ ናባኻ ኸይምለስ
ይኣኽለኒ ኢለ ቆሪጸ ኸይብገስ
ኣእጋረይ ሓሊኹ ድሕሪት ዝመልሰኒ
ስጋእ መጋእ እብል ገለ ይሓዘኒ

VERSE 2
ካብ ስልሚ ኣበሳ ኸተውጽኣ ንነፍሰይ
ንጵጥሮስ ዘድኋንካ ኢድካ ስደደለይ/2/
ሰላመይ ሃዲሙ መንፈሰይ ከድውን
ቃንዛ በርቲዑኒ ከልሎ ብሓዘን

VERSE 3
ቅሳነት ሃሪፈ ንእሽቶ ዕርፍቲ
ናባኻ እጥምት ለይቲ ምስ መዓልቲ
ካባኻ ,ዪ. ተስፋይ ከረክ ዕረፍቲ
ሰላመይ ምለሶ ናይ ሰላመይ ጎይታ/2/

VERSE 4
እቲ ዕለት ኣብ ኋጢኣት ክነብር
ኩርባ ናይ ገበነይ ናብ እምባ ከቕየር
ደፋር ,ዶ.ኣይነበርካን ልበይ ኣብቲ ጊዜ
ትብዓትካ ደኣ ኣበይ ,ሎ.ሕጂ ኣብዛ ኑዛዜ

VERSE 5
ሽፊቱ ,ሎ,ልበይ ንስሓ ፈሪሑ
ጥበብካ ይምለስኒ ነነዌ መሪሑ/2/
ኩሉ እና ፈለጥኩ ሠናይካ ኸገብር
ኣብ ጊዜ በድል ግን ካብ ልበይ ይስወር

VERSE 6
ከም ተፍቅረካ ,ሲ, ትፈልጣ ኢኻ ልበይ
እምነታ ኽዓብስ ባርካ ኣምላኸይ
ብዘይካኻ የልቦን ምሕረት ዝኋበኒ
ብእግረ ልቦናይ ናብ ቤትካ ኣብለኒ/2/',
      lyrics_transliteration = 'Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss

VERSE 1
Hat’iay temenyini nabaኻ ኸymles
Yiaኽleni ile qorits’e ኸybges
Aegarey haliኹ dihrit zimelseni
Sigae megae ebl gele yihazeni

VERSE 2
Kab silmi abesa ኸtewts’a ninefsey
Nip’t’ros zedhwanka idka sidedeley (2)
Selamey hadimu menfesey kedwn
Qanza bertiuni kello bihazen

VERSE 3
Qisanet harife nieshto erfti
Nabaኻ et’mt leyti mis mealti
Kabaኻ ,yi. tesfay kerek erefti
Selamey mileso nay selamey goyta (2)

VERSE 4
Eti elet ab hwat’iat kinebr
Kurba nay gebeney nab emba keቕyer
Defar ,do.ayneberkan libey abti gize
Tibatka dea abey ,lo.hiji abza nuzaze

VERSE 5
Shfitu ,lo,libey nisha ferihu
T’bebka yimlesni nenewe merihu (2)
Kulu ena felet’ku senayka ኸgebr
Ab gize bedl gin kab libey yiswer

VERSE 6
Kem tefqreka ,si, tifelt’a iኻ libey
Emneta ኽabs barka amlaኸy
Bizeykaኻ yelbon mihret zihwabeni
Biegre libonay nab betka ableni (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'an-amazing-spiritual-song-by-d-teame-segid'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 1
ሓጢኣይ ተመንዪኒ ናባኻ ኸይምለስ
ይኣኽለኒ ኢለ ቆሪጸ ኸይብገስ
ኣእጋረይ ሓሊኹ ድሕሪት ዝመልሰኒ
ስጋእ መጋእ እብል ገለ ይሓዘኒ

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 2
ካብ ስልሚ ኣበሳ ኸተውጽኣ ንነፍሰይ
ንጵጥሮስ ዘድኋንካ ኢድካ ስደደለይ/2/
ሰላመይ ሃዲሙ መንፈሰይ ከድውን
ቃንዛ በርቲዑኒ ከልሎ ብሓዘን

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 3
ቅሳነት ሃሪፈ ንእሽቶ ዕርፍቲ
ናባኻ እጥምት ለይቲ ምስ መዓልቲ
ካባኻ ,ዪ. ተስፋይ ከረክ ዕረፍቲ
ሰላመይ ምለሶ ናይ ሰላመይ ጎይታ/2/

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 4
እቲ ዕለት ኣብ ኋጢኣት ክነብር
ኩርባ ናይ ገበነይ ናብ እምባ ከቕየር
ደፋር ,ዶ.ኣይነበርካን ልበይ ኣብቲ ጊዜ
ትብዓትካ ደኣ ኣበይ ,ሎ.ሕጂ ኣብዛ ኑዛዜ

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 5
ሽፊቱ ,ሎ,ልበይ ንስሓ ፈሪሑ
ጥበብካ ይምለስኒ ነነዌ መሪሑ/2/
ኩሉ እና ፈለጥኩ ሠናይካ ኸገብር
ኣብ ጊዜ በድል ግን ካብ ልበይ ይስወር

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 6
ከም ተፍቅረካ ,ሲ, ትፈልጣ ኢኻ ልበይ
እምነታ ኽዓብስ ባርካ ኣምላኸይ
ብዘይካኻ የልቦን ምሕረት ዝኋበኒ
ብእግረ ልቦናይ ናብ ቤትካ ኣብለኒ/2/

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss

VERSE 1
Hat’iay temenyini nabaኻ ኸymles
Yiaኽleni ile qorits’e ኸybges
Aegarey haliኹ dihrit zimelseni
Sigae megae ebl gele yihazeni

CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss

VERSE 2
Kab silmi abesa ኸtewts’a ninefsey
Nip’t’ros zedhwanka idka sidedeley (2)
Selamey hadimu menfesey kedwn
Qanza bertiuni kello bihazen

CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss

VERSE 3
Qisanet harife nieshto erfti
Nabaኻ et’mt leyti mis mealti
Kabaኻ ,yi. tesfay kerek erefti
Selamey mileso nay selamey goyta (2)

CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss

VERSE 4
Eti elet ab hwat’iat kinebr
Kurba nay gebeney nab emba keቕyer
Defar ,do.ayneberkan libey abti gize
Tibatka dea abey ,lo.hiji abza nuzaze

CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss

VERSE 5
Shfitu ,lo,libey nisha ferihu
T’bebka yimlesni nenewe merihu (2)
Kulu ena felet’ku senayka ኸgebr
Ab gize bedl gin kab libey yiswer

CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss

VERSE 6
Kem tefqreka ,si, tifelt’a iኻ libey
Emneta ኽabs barka amlaኸy
Bizeykaኻ yelbon mihret zihwabeni
Biegre libonay nab betka ableni (2)

CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'an-amazing-spiritual-song-by-d-teame-segid', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Anchin Bicha Betelehem (anchin-bicha-betelehem)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 1
ዮሴፍንም አላየንም ሊቶስጥራ ጎልጎታ

VERSE 2
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል ብስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስትሰሚ ደንግጠሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ 2

VERSE 3
ሕፃኑን ስትወልጂ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደት ነው እንጂ የታሉ በሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ2

VERSE 4
የግብፅን በረሀ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነሱ እየፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ2

VERSE 5
ሐሙስ ዕለት ፋሲካን ሲበሉ ያመሹ
አርብ ዕለት ተነሥተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበር ላይክዱት መሀላ
ድንግል ካንቺ በቀር ማን ነበር ሌላ2

VERSE 6
በሠላሳ ዘመን በሥጋ ወራቱ
መች ነበሩ ከቶ ደቀመዛሙርቱ
የእጆቹን ታምራት ቀን ከሌሊት እያየሽ
በቃሉ ብርታት ፊት አንቺ ብቻ ታየሽ2

VERSE 7
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል መሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ',
      lyrics_transliteration = 'Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 1
Yosefnm alayenm litost’ra golgota

VERSE 2
Gena bemaleda benazretwa meqdes
Gebriel bisrat yizo kegelila siders
Yan zena sitsemi dengt’esh bebrtu
Anchi bicha nebersh bilatenaytu 2

VERSE 3
Hits’anun sitwelji girgm yeneberu
Yelum bemekeraw qeranyon feru
Beldet new enji yetalu bemotu
Abreshw yenebersh anchi bicha enatu2

VERSE 4
Yegbts’n berehe abrewsh yewet’u
Beqeyafa gibi endemn almet’u
Ersu lemigeref enesu eyeferu
Anchin bicha titew bemender neberu2

VERSE 5
Hemus elet fasikan sibelu yameshu
Arb elet tenestew keto wedet sheshu
Qal gebtew neber laykdut mehela
Dingil kanchi beqer man neber lela2

VERSE 6
Beselasa zemen besga weratu
Mech neberu keto deqemezamurtu
Yeejochun tamrat qen kelelit eyayesh
Beqalu birtat fit anchi bicha tayesh2

VERSE 7
Betelhem yalu qeranyo yelum
Qeranyom yalu girgm alneberum
Behonebet zemen bemesqel memotu
Abreshw yenebersh anchi bicha enatu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'anchin-bicha-betelehem'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 1
ዮሴፍንም አላየንም ሊቶስጥራ ጎልጎታ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 2
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል ብስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስትሰሚ ደንግጠሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ 2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 3
ሕፃኑን ስትወልጂ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደት ነው እንጂ የታሉ በሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 4
የግብፅን በረሀ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነሱ እየፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 5
ሐሙስ ዕለት ፋሲካን ሲበሉ ያመሹ
አርብ ዕለት ተነሥተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበር ላይክዱት መሀላ
ድንግል ካንቺ በቀር ማን ነበር ሌላ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 6
በሠላሳ ዘመን በሥጋ ወራቱ
መች ነበሩ ከቶ ደቀመዛሙርቱ
የእጆቹን ታምራት ቀን ከሌሊት እያየሽ
በቃሉ ብርታት ፊት አንቺ ብቻ ታየሽ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 7
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል መሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 1
Yosefnm alayenm litost’ra golgota

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 2
Gena bemaleda benazretwa meqdes
Gebriel bisrat yizo kegelila siders
Yan zena sitsemi dengt’esh bebrtu
Anchi bicha nebersh bilatenaytu 2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 3
Hits’anun sitwelji girgm yeneberu
Yelum bemekeraw qeranyon feru
Beldet new enji yetalu bemotu
Abreshw yenebersh anchi bicha enatu2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 4
Yegbts’n berehe abrewsh yewet’u
Beqeyafa gibi endemn almet’u
Ersu lemigeref enesu eyeferu
Anchin bicha titew bemender neberu2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 5
Hemus elet fasikan sibelu yameshu
Arb elet tenestew keto wedet sheshu
Qal gebtew neber laykdut mehela
Dingil kanchi beqer man neber lela2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 6
Beselasa zemen besga weratu
Mech neberu keto deqemezamurtu
Yeejochun tamrat qen kelelit eyayesh
Beqalu birtat fit anchi bicha tayesh2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 7
Betelhem yalu qeranyo yelum
Qeranyom yalu girgm alneberum
Behonebet zemen bemesqel memotu
Abreshw yenebersh anchi bicha enatu

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'anchin-bicha-betelehem', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Anchin Yeyaze Sew (anchin-yeyaze-sew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/

VERSE 1
በረከትሽ ብዙ የደናግል ገንዘብ
የምስኪናን እናት የርሁባን ቀለብ
ለሁሉ መጋቢ ፀጋሽ የማይጎድል
ስምሽ ጥዑም ምግብ ከረሀብ የሚያስጥል /2/

VERSE 2
አንቺ ብትመጪ ከምስኪኗ ቤቴ
እንደ መጥምቁ እናት በዛልኝ ሐሴቴ
የአዲስ ኪዳን ቁርባን መንበር ጠረጴዛ
ፅድቅን አሸተትን የሕይወት መዓዛ /2/

VERSE 3
ልቤ ተጠራጥሮ ኪዳንሽን ካልከዳ
ልመናም አልወርድም አልይዝም አቆፋዳ
ሁሉን እየሞላሽ መመገብ ታውቂያለሽ
ቢዝቁት የማያልቅ ፀጋና ሃብት አለሽ /2/

VERSE 4
የእግዚአብሔር ማረፊያ ኮሬባዊት ዋሻ
የሕይወት ውሃ ምንጭ የህግ መፍሰሻ
ነበልባል ተዋህዶሽ ሙሴ አንቺን አይቷል
ጫማውን አውልቆ በፊትሽ ተደፍቷል /2/',
      lyrics_transliteration = 'Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)

VERSE 1
Bereketish bizu ye-denagil genzeb
Ye-miskinan enat ye-rehuban qeleb
Le-hulu megabi tsegash yemayigodil
Simish tium migib ke-rehab yemiyas-ttil (2)

VERSE 2
Anchi bittimechi ke-miskinwa bete
Ende Metmiku enat bezallign hassete
Ye-Addis Kidan kurban menber tereppeza
Tsidqin ashetetin ye-hiywot me’aza (2)

VERSE 3
Libie teteratiro kidanishin kalkeda
Limenam alwerdim alyizim akofada
Hulun iyemolash memegeb tawkiyalesh
Bizut yemayalk tsega-na habt alesh (2)

VERSE 4
Ye-Igziabeher marefiya Korebawit washa
Ye-hiywot wuha minch ye-hig mefsesha
Nebelyal tewahedosh Musie anchin ayitwal
Chammawin awulko befitish tedefitwal (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'anchin-yeyaze-sew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/

VERSE 1
በረከትሽ ብዙ የደናግል ገንዘብ
የምስኪናን እናት የርሁባን ቀለብ
ለሁሉ መጋቢ ፀጋሽ የማይጎድል
ስምሽ ጥዑም ምግብ ከረሀብ የሚያስጥል /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/

VERSE 2
አንቺ ብትመጪ ከምስኪኗ ቤቴ
እንደ መጥምቁ እናት በዛልኝ ሐሴቴ
የአዲስ ኪዳን ቁርባን መንበር ጠረጴዛ
ፅድቅን አሸተትን የሕይወት መዓዛ /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/

VERSE 3
ልቤ ተጠራጥሮ ኪዳንሽን ካልከዳ
ልመናም አልወርድም አልይዝም አቆፋዳ
ሁሉን እየሞላሽ መመገብ ታውቂያለሽ
ቢዝቁት የማያልቅ ፀጋና ሃብት አለሽ /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/

VERSE 4
የእግዚአብሔር ማረፊያ ኮሬባዊት ዋሻ
የሕይወት ውሃ ምንጭ የህግ መፍሰሻ
ነበልባል ተዋህዶሽ ሙሴ አንቺን አይቷል
ጫማውን አውልቆ በፊትሽ ተደፍቷል /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖረው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)

VERSE 1
Bereketish bizu ye-denagil genzeb
Ye-miskinan enat ye-rehuban qeleb
Le-hulu megabi tsegash yemayigodil
Simish tium migib ke-rehab yemiyas-ttil (2)

CHORUS
Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)

VERSE 2
Anchi bittimechi ke-miskinwa bete
Ende Metmiku enat bezallign hassete
Ye-Addis Kidan kurban menber tereppeza
Tsidqin ashetetin ye-hiywot me’aza (2)

CHORUS
Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)

VERSE 3
Libie teteratiro kidanishin kalkeda
Limenam alwerdim alyizim akofada
Hulun iyemolash memegeb tawkiyalesh
Bizut yemayalk tsega-na habt alesh (2)

CHORUS
Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)

VERSE 4
Ye-Igziabeher marefiya Korebawit washa
Ye-hiywot wuha minch ye-hig mefsesha
Nebelyal tewahedosh Musie anchin ayitwal
Chammawin awulko befitish tedefitwal (2)

CHORUS
Anchin yeyeze sew min yigodilbetal
Be-miljash bereket betu moltobetal
Zer meker bayinrow goteraw baymola
Hulum yishefenal be-redietish tilla (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'anchin-yeyaze-sew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Andebetem Yawta (andebetem-yawta)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 1
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከኃጢያት ፍላፃ ከሞት አተረፈከኝ
የአናብስቱን አፍ በኃይሉ የዘጋ
የዳንኤል አምላክ ይኖራል ከእኛጋ

VERSE 2
በዳዊት ምስጋና በያሬድ ዝማሬ
ከቅዱሳን ጋር ልዘምር አብሬ
እርሱን ሳመሰግን ሚልኮል ብትስቅብኝ
ለጌታዬ ክብር እዘምራለሁኝ

VERSE 3
አስፈሪው ነበልባል እሳቱ ቢነድም
ለጣዖት እንድሰግድ ነገሥታት ቢያውጁም
ሁሉም ቢተወኝም ቢጠላኝም ዓለም
ጽናት ይሆነኛል ጌታ መድኃኔዓለም',
      lyrics_transliteration = 'Andebetem yawta ye’mesigana qené
Ye’amlaken madan ayichalehu be’ayné
Be’Gabaon semay tsehayn yaqome
Zarem gobenytoñal eyyedegageme

VERSE 1
Wetemed tesebere eném ameleṭkuñ
Ke’hatiyat felatsa ke’mot atereferkeghe
Ye’anabestuñ af be’haylu yezega
Ye’Dan’el amlak yinoral ke’ënna ga

VERSE 2
Be’Dawit mesigana be’Yared zemare
Ke’qidusān gar lezemir abre
Ersun samesegen Milkol bitseqebegn
Le’getayey kibir ezemralehughe

VERSE 3
Asferiw nebelbal esatu binedem
Le’ta’ot endseged negestat
Hulum biteweghem bitelaghim alem
Tsenat yihoneñal geta medihane’alem',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'andebetem-yawta'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 1
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከኃጢያት ፍላፃ ከሞት አተረፈከኝ
የአናብስቱን አፍ በኃይሉ የዘጋ
የዳንኤል አምላክ ይኖራል ከእኛጋ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 2
በዳዊት ምስጋና በያሬድ ዝማሬ
ከቅዱሳን ጋር ልዘምር አብሬ
እርሱን ሳመሰግን ሚልኮል ብትስቅብኝ
ለጌታዬ ክብር እዘምራለሁኝ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 3
አስፈሪው ነበልባል እሳቱ ቢነድም
ለጣዖት እንድሰግድ ነገሥታት ቢያውጁም
ሁሉም ቢተወኝም ቢጠላኝም ዓለም
ጽናት ይሆነኛል ጌታ መድኃኔዓለም

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Andebetem yawta ye’mesigana qené
Ye’amlaken madan ayichalehu be’ayné
Be’Gabaon semay tsehayn yaqome
Zarem gobenytoñal eyyedegageme

VERSE 1
Wetemed tesebere eném ameleṭkuñ
Ke’hatiyat felatsa ke’mot atereferkeghe
Ye’anabestuñ af be’haylu yezega
Ye’Dan’el amlak yinoral ke’ënna ga

CHORUS
Andebetem yawta ye’mesigana qené
Ye’amlaken madan ayichalehu be’ayné
Be’Gabaon semay tsehayn yaqome
Zarem gobenytoñal eyyedegageme

VERSE 2
Be’Dawit mesigana be’Yared zemare
Ke’qidusān gar lezemir abre
Ersun samesegen Milkol bitseqebegn
Le’getayey kibir ezemralehughe

CHORUS
Andebetem yawta ye’mesigana qené
Ye’amlaken madan ayichalehu be’ayné
Be’Gabaon semay tsehayn yaqome
Zarem gobenytoñal eyyedegageme

VERSE 3
Asferiw nebelbal esatu binedem
Le’ta’ot endseged negestat
Hulum biteweghem bitelaghim alem
Tsenat yihoneñal geta medihane’alem

CHORUS
Andebetem yawta ye’mesigana qené
Ye’amlaken madan ayichalehu be’ayné
Be’Gabaon semay tsehayn yaqome
Zarem gobenytoñal eyyedegageme'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'andebetem-yawta', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Andebetiem Yawta (andebetiem-yawta)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 1
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከኃጢአት ፍላፃ ከሞት አተረፈኝ
የአናብስቱን አፍ በኃይሉ የዘጋ
የዳንኔል አምላክ ይኖራል ከኛ ጋ

VERSE 2
በዳዊት ምስጋና በያሬድ ዝማሬ
ከቅዱሳን ጋራ ስዘምር አብሬ
እርሱን ሳመሰግን ሜልኮል ብትስቅብኝ
ለጌታዬ ክብር እዘምራለሁኝ

VERSE 3
አስፈሪው ነበልባል እሳቱ ቢነድም
ለጣኦት እንድሰግድ ነገሥታት ቢቆጡም
ሁሉም ቢተወኝም ቢጠላኝም ዓለም
ጽናት ይሆነኛል ጌታ መድኃሌዓለም

VERSE 4
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከኃጢአት ፍላፃ ከሞት አተረፈኝ
የአናብስቱን አፍ በኃይሉ የዘጋ
የዳንኔል አምላክ ይኖራል ከኛ ጋ',
      lyrics_transliteration = 'Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 1
Wet’med tesebere enem amelet’kugn
Kehat’iat filats’a kemot aterefegn
Yeanabstun af behaylu yezega
Yedannel amlak yinoral kegna ga

VERSE 2
Bedawit misgana beyared zimare
Keqdusan gara sizemr abre
Ersun samesegn melkol bitsqbgn
Legetaye kibir ezemralehugn

VERSE 3
Asferiw nebelbal esatu binedm
Let’aot endsegd negestat biqot’um
Hulum bitewegnm bit’elagnm alem
Ts’nat yihonegnal Geta medhalealem

VERSE 4
Wet’med tesebere enem amelet’kugn
Kehat’iat filats’a kemot aterefegn
Yeanabstun af behaylu yezega
Yedannel amlak yinoral kegna ga',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'andebetiem-yawta'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 1
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከኃጢአት ፍላፃ ከሞት አተረፈኝ
የአናብስቱን አፍ በኃይሉ የዘጋ
የዳንኔል አምላክ ይኖራል ከኛ ጋ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 2
በዳዊት ምስጋና በያሬድ ዝማሬ
ከቅዱሳን ጋራ ስዘምር አብሬ
እርሱን ሳመሰግን ሜልኮል ብትስቅብኝ
ለጌታዬ ክብር እዘምራለሁኝ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 3
አስፈሪው ነበልባል እሳቱ ቢነድም
ለጣኦት እንድሰግድ ነገሥታት ቢቆጡም
ሁሉም ቢተወኝም ቢጠላኝም ዓለም
ጽናት ይሆነኛል ጌታ መድኃሌዓለም

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 4
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከኃጢአት ፍላፃ ከሞት አተረፈኝ
የአናብስቱን አፍ በኃይሉ የዘጋ
የዳንኔል አምላክ ይኖራል ከኛ ጋ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በአይኔ
በገባኦን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 1
Wet’med tesebere enem amelet’kugn
Kehat’iat filats’a kemot aterefegn
Yeanabstun af behaylu yezega
Yedannel amlak yinoral kegna ga

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 2
Bedawit misgana beyared zimare
Keqdusan gara sizemr abre
Ersun samesegn melkol bitsqbgn
Legetaye kibir ezemralehugn

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 3
Asferiw nebelbal esatu binedm
Let’aot endsegd negestat biqot’um
Hulum bitewegnm bit’elagnm alem
Ts’nat yihonegnal Geta medhalealem

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 4
Wet’med tesebere enem amelet’kugn
Kehat’iat filats’a kemot aterefegn
Yeanabstun af behaylu yezega
Yedannel amlak yinoral kegna ga

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'andebetiem-yawta', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Andebetn Setegn Getaye (andebetn-setegn-getaye)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት

VERSE 1
ምስጋናህን ብቻ የምናገርበት/2/
አንደበትን ስጠኝ ጌታዬ/4/
ሕይወት የሆነውን ቃልህን ሰባኪ
ገናናነትህን ክብርህን ተራኪ

VERSE 2
ለንስሃ ህይወት በጎችህን ጠሪ
እንደ ሐዋሪያት ፍቅርህን መስካሪ/2/
ከከሃድያን ጋር የማይተባበር
ፆምና ጸሎትን የሚያዘወትር

VERSE 3
ከጽድቅ ስራ ጋር መልካም ህብረት ያለው
በምድራዊ ምኞት የማይታለለው/2/
ፈተና ሲገጥመኝ በመከራ ጊዜ
የሀዘን ጥላ ጋርዶን ሲከበን ትካዜ

VERSE 4
ተመስገን የሚል በችግር በደስታ
ርቱዕ አንደበትን ፍጠርልን ጌታ/2/',
      lyrics_transliteration = 'Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet

VERSE 1
Misganahin bicha yemnagerbet (x2)
Andebetn setegn getaye (x4)
Hiywet yehonewn qalhin sebaki
Genaninetihin kibirhin teraki

VERSE 2
Lenes’ha hiywet begotchhin t’eri
Ende hawariyat fiqirhin meskari (x2)
Kekehadiyan gar yemayitebaber

VERSE 3
Ts’omna tselotn yemiyazewetir
Kets’idik sira gar melkam hibret yalew
Bemidravi minyot yemayitalelew (x2)
Fetena sigeṭmeny bemekera gize

VERSE 4
Ye hazen t’ila gardon sik’eben tikaze
Temesgen yemil bechigir bedesta
Rit’u andebetn fit’irlen geta (x2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'andebetn-setegn-getaye'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት

VERSE 1
ምስጋናህን ብቻ የምናገርበት/2/
አንደበትን ስጠኝ ጌታዬ/4/
ሕይወት የሆነውን ቃልህን ሰባኪ
ገናናነትህን ክብርህን ተራኪ

CHORUS
አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት

VERSE 2
ለንስሃ ህይወት በጎችህን ጠሪ
እንደ ሐዋሪያት ፍቅርህን መስካሪ/2/
ከከሃድያን ጋር የማይተባበር
ፆምና ጸሎትን የሚያዘወትር

CHORUS
አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት

VERSE 3
ከጽድቅ ስራ ጋር መልካም ህብረት ያለው
በምድራዊ ምኞት የማይታለለው/2/
ፈተና ሲገጥመኝ በመከራ ጊዜ
የሀዘን ጥላ ጋርዶን ሲከበን ትካዜ

CHORUS
አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት

VERSE 4
ተመስገን የሚል በችግር በደስታ
ርቱዕ አንደበትን ፍጠርልን ጌታ/2/

CHORUS
አንደበትን ስጠኝ ጌታዬ
አዳኙ ስምህን ዘወትር ልጠራበት
ቅዱስ ኃያል ህያው ክብር የምልበት
ከሃጢያት የራቀ ሐኬት የሌለበት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet

VERSE 1
Misganahin bicha yemnagerbet (x2)
Andebetn setegn getaye (x4)
Hiywet yehonewn qalhin sebaki
Genaninetihin kibirhin teraki

CHORUS
Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet

VERSE 2
Lenes’ha hiywet begotchhin t’eri
Ende hawariyat fiqirhin meskari (x2)
Kekehadiyan gar yemayitebaber

CHORUS
Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet

VERSE 3
Ts’omna tselotn yemiyazewetir
Kets’idik sira gar melkam hibret yalew
Bemidravi minyot yemayitalelew (x2)
Fetena sigeṭmeny bemekera gize

CHORUS
Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet

VERSE 4
Ye hazen t’ila gardon sik’eben tikaze
Temesgen yemil bechigir bedesta
Rit’u andebetn fit’irlen geta (x2)

CHORUS
Andebetn setegn getaye
Adanyu simhin zawetir let’arebet
Kidus hayal hiyaw kibir yemilbet
Ke hat’iyat yerake haket yelebet'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'andebetn-setegn-getaye', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ane Kzmr’ye (ane-kzmrye)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ

VERSE 1
ንብዓተይ ካብ ዓይነይ ደሪዛትለይ’ያ
ኣነስ ክዝምር’የ ንድንግል ማርያም
ክፍኣት ናይ ህይወተይ ንኽየስዕብ ስቓይ
ባሪኻቶ ቤተይ ኣደ ናይ ብዙሓን

VERSE 2
ኣብ ድነ ናይ ጸልማት ተሪፈ ንበይነይ
ብናይ ፍቕሪ ኣእዳዋ ትዳህስሶ ዓይነይ
ሓዘነይ ንብዓተይ ክነግር ንኣደይ
ሎሚ ብበረኸት መሊኣቶ ቤትይ

VERSE 3
ዝዓነወ ህይወተይ እቲ ዝፈረሰ
ብልመና ድንግል ኵሉ ተሓደሰ
ንብዓተይ ጸሎተይ ኣውያተይ ሰሚዓ
ድንግል ኣደ ጎይታ ንረዲኤት መጺኣ

VERSE 4
ሸኸም ከቢዱኒ ክሓዝን ክቑዝም
ድንግል ምጺኣትኒ ደኺመ ከይተርፍ
ስለ ዘውጽኣትኒ ካብ መዓሙቅ ጉድጓድ
የእዳወይ ዘርጊሐ ንኽብራ ክዝምር',
      lyrics_transliteration = 'Ane kizmr’ye nimaryamey
Nay fiቕra bereኸt atyu betey
Redaitey eya ab gize hazeney
Kemesgna eye nidngl maryamey

VERSE 1
Nibatey kab ayney derizatley’ya
Anes kizmr’ye nidngl Maryam
Kifat nay hiywetey niኽyeseb siቓy
Bariኻto betey ade nay bizuhan

VERSE 2
Ab dine nay ts’elmat terife nibeyney
Binay fiቕri aedawa tidahsso ayney
Hazeney nibatey kinegr niadey
Lomi bibereኸt meliato bety

VERSE 3
Zianewe hiywetey eti ziferese
Bilmena Dingil kwlu tehadese
Nibatey ts’elotey awyatey semia
Dingil ade goyta nirediet mets’ia

VERSE 4
Sheኸm kebiduni kihazn kiቑzm
Dingil mits’iatni deኺme keyterf
Sile zewts’atni kab meamuq gudgwad
Yeedawey zergihe niኽbra kizmr',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ane-kzmrye'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ

VERSE 1
ንብዓተይ ካብ ዓይነይ ደሪዛትለይ’ያ
ኣነስ ክዝምር’የ ንድንግል ማርያም
ክፍኣት ናይ ህይወተይ ንኽየስዕብ ስቓይ
ባሪኻቶ ቤተይ ኣደ ናይ ብዙሓን

CHORUS
ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ

VERSE 2
ኣብ ድነ ናይ ጸልማት ተሪፈ ንበይነይ
ብናይ ፍቕሪ ኣእዳዋ ትዳህስሶ ዓይነይ
ሓዘነይ ንብዓተይ ክነግር ንኣደይ
ሎሚ ብበረኸት መሊኣቶ ቤትይ

CHORUS
ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ

VERSE 3
ዝዓነወ ህይወተይ እቲ ዝፈረሰ
ብልመና ድንግል ኵሉ ተሓደሰ
ንብዓተይ ጸሎተይ ኣውያተይ ሰሚዓ
ድንግል ኣደ ጎይታ ንረዲኤት መጺኣ

CHORUS
ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ

VERSE 4
ሸኸም ከቢዱኒ ክሓዝን ክቑዝም
ድንግል ምጺኣትኒ ደኺመ ከይተርፍ
ስለ ዘውጽኣትኒ ካብ መዓሙቅ ጉድጓድ
የእዳወይ ዘርጊሐ ንኽብራ ክዝምር

CHORUS
ኣነ ክዝምር’የ ንማርያመይ
ናይ ፍቕራ በረኸት ኣትዩ ቤተይ
ረዳኢተይ እያ ኣብ ጊዜ ሓዘነይ
ከመስግና እየ ንድንግል ማርያመይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ane kizmr’ye nimaryamey
Nay fiቕra bereኸt atyu betey
Redaitey eya ab gize hazeney
Kemesgna eye nidngl maryamey

VERSE 1
Nibatey kab ayney derizatley’ya
Anes kizmr’ye nidngl Maryam
Kifat nay hiywetey niኽyeseb siቓy
Bariኻto betey ade nay bizuhan

CHORUS
Ane kizmr’ye nimaryamey
Nay fiቕra bereኸt atyu betey
Redaitey eya ab gize hazeney
Kemesgna eye nidngl maryamey

VERSE 2
Ab dine nay ts’elmat terife nibeyney
Binay fiቕri aedawa tidahsso ayney
Hazeney nibatey kinegr niadey
Lomi bibereኸt meliato bety

CHORUS
Ane kizmr’ye nimaryamey
Nay fiቕra bereኸt atyu betey
Redaitey eya ab gize hazeney
Kemesgna eye nidngl maryamey

VERSE 3
Zianewe hiywetey eti ziferese
Bilmena Dingil kwlu tehadese
Nibatey ts’elotey awyatey semia
Dingil ade goyta nirediet mets’ia

CHORUS
Ane kizmr’ye nimaryamey
Nay fiቕra bereኸt atyu betey
Redaitey eya ab gize hazeney
Kemesgna eye nidngl maryamey

VERSE 4
Sheኸm kebiduni kihazn kiቑzm
Dingil mits’iatni deኺme keyterf
Sile zewts’atni kab meamuq gudgwad
Yeedawey zergihe niኽbra kizmr

CHORUS
Ane kizmr’ye nimaryamey
Nay fiቕra bereኸt atyu betey
Redaitey eya ab gize hazeney
Kemesgna eye nidngl maryamey'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ane-kzmrye', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Anferatsu Seba Segel (anferatsu-sebea-segel)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንፈራፁ ሰብአ ሰገል
አንፈራፁ ሰበእ ሰገል /2 ጊዜ/

VERSE 1
አምኃሆሙ አምጽኡ መድምመ /2 ጊዜ/',
      lyrics_transliteration = 'enferatsu sebe segel
enferatsu sebe segel /2 gize/

VERSE 1
emhahomu emtsu medmme /2 gize/',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'anferatsu-sebea-segel'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንፈራፁ ሰብአ ሰገል
አንፈራፁ ሰበእ ሰገል /2 ጊዜ/

VERSE 1
አምኃሆሙ አምጽኡ መድምመ /2 ጊዜ/

CHORUS
አንፈራፁ ሰብአ ሰገል
አንፈራፁ ሰበእ ሰገል /2 ጊዜ/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
enferatsu sebe segel
enferatsu sebe segel /2 gize/

VERSE 1
emhahomu emtsu medmme /2 gize/

CHORUS
enferatsu sebe segel
enferatsu sebe segel /2 gize/'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'anferatsu-sebea-segel', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Anibiche Yenegerikush (anibiche-yenegerikush)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

VERSE 1
መች አለ ያልደረስኩበት
ከምድር ባለመድኃኒት
ባነባ መጥቼ ደጅሽ
በምልጃሽ ተጽናናሁ ልጅሽ

VERSE 2
ፀበልሽ ሰራኝ ዳግመኛ
እምነትሽ ሆነኝ መጽናኛ
ቀና አልኩኝ ከማቀርቀሬ
ታደሰ ሁሉ ነገሬ

VERSE 3
ይህን ያረገው ያመለክሽው(፪)
ጸሎቴን ሰምቷል ላመስግነው(፪)
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ

VERSE 4
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል',
      lyrics_transliteration = 'Met’che wede dejsh
Anbche yenegerkush
Dersolgn silete semrwal
Arsema miljash redtognal

VERSE 1
Mech ale yaldereskubet
Kemdr balemedhanit
Baneba met’che dejsh
Bemljash tets’nanahu lijsh

VERSE 2
Ts’ebelsh seragn dagmegna
Emnetsh honegn mets’nagna
Qena alkugn kemaqerqere
Tadese hulu negere

VERSE 3
Yihn yaregew yamelekshw (2)
Ts’eloten semtwal lamesgnew (2)
Met’che wede dejsh
Anbche yenegerkush

VERSE 4
Dersolgn silete semrwal
Arsema miljash redtognal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'anibiche-yenegerikush'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

VERSE 1
መች አለ ያልደረስኩበት
ከምድር ባለመድኃኒት
ባነባ መጥቼ ደጅሽ
በምልጃሽ ተጽናናሁ ልጅሽ

CHORUS
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

VERSE 2
ፀበልሽ ሰራኝ ዳግመኛ
እምነትሽ ሆነኝ መጽናኛ
ቀና አልኩኝ ከማቀርቀሬ
ታደሰ ሁሉ ነገሬ

CHORUS
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

VERSE 3
ይህን ያረገው ያመለክሽው(፪)
ጸሎቴን ሰምቷል ላመስግነው(፪)
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ

CHORUS
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

VERSE 4
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል

CHORUS
መጥቼ ወደ ደጅሽ
አንብቼ የነገርኩሽ
ደርሶልኝ ስለቴ ሰምሯል
አርሴማ ምልጃሽ ረድቶኛል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Met’che wede dejsh
Anbche yenegerkush
Dersolgn silete semrwal
Arsema miljash redtognal

VERSE 1
Mech ale yaldereskubet
Kemdr balemedhanit
Baneba met’che dejsh
Bemljash tets’nanahu lijsh

CHORUS
Met’che wede dejsh
Anbche yenegerkush
Dersolgn silete semrwal
Arsema miljash redtognal

VERSE 2
Ts’ebelsh seragn dagmegna
Emnetsh honegn mets’nagna
Qena alkugn kemaqerqere
Tadese hulu negere

CHORUS
Met’che wede dejsh
Anbche yenegerkush
Dersolgn silete semrwal
Arsema miljash redtognal

VERSE 3
Yihn yaregew yamelekshw (2)
Ts’eloten semtwal lamesgnew (2)
Met’che wede dejsh
Anbche yenegerkush

CHORUS
Met’che wede dejsh
Anbche yenegerkush
Dersolgn silete semrwal
Arsema miljash redtognal

VERSE 4
Dersolgn silete semrwal
Arsema miljash redtognal

CHORUS
Met’che wede dejsh
Anbche yenegerkush
Dersolgn silete semrwal
Arsema miljash redtognal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'anibiche-yenegerikush', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Anichi Yewerik Mekija Nesh (anichi-yewerik-mekija-nesh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንቺ የወርቅ መቅጃ ነሽ እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሃ ከጥሜ የሚያረካኝ
እኔ ተሻጋሪ ነኝ ማርያም ሆነሽኝ ድልድይ
ልጅሽ መድረሻየ ነው በደስታ የሚያኖረኝ

VERSE 1
እኔ እርቃኔን ነኝ ከጸጋው እርቄ
በክፉ ግብር በኃጥያት ወድቄ
ማርያም አንቺ ነሽ የሸማኔ እቃ
ልጅሽ ልብስ ነው ለሁሉ የሚበቃ/2/

VERSE 2
አንቺ መርከቤ እኔም ነጋዴ
ልጅሽ ዕንቁዬ ትርፌ ዘመዴ
ለእኔ ለድሃው ማከማቻዬ
የከበር ጌጥ ልጅሽ ቤዛዬ/2/

VERSE 3
እኔ ተጓዥ አንቺ መቅዘፊያ
ልጅሽ ወደብ ነው የህይወት ማረፊያ
አንቺ ፊደል ነሽ እኔ ተማሪ
ልጅሽ ወንጌል ነው ቸር አስተማሪ/2/',
      lyrics_transliteration = 'Anchi yewerq meqja nesh ene yetet’emahu negn
Lijsh yehywet wiha ket’me yemiyarekagn
Ene teshagari negn Maryam honeshgn dildy
Lijsh medreshaye new bedesta yemiyanoregn

VERSE 1
Ene erqanen negn kets’egaw erqe
Bekfu gibr behat’yat wedqe
Maryam anchi nesh yeshemane eqa
Lijsh libs new lehulu yemibeqa (2)

VERSE 2
Anchi merkebe enem negade
Lijsh enquye tirfe zemede
Leene ledhaw makemachaye
Yekeber get’ lijsh bezaye (2)

VERSE 3
Ene tegwazh anchi meqzefiya
Lijsh wedeb new yehywet marefiya
Anchi fidel nesh ene temari
Lijsh wengel new cher astemari (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'anichi-yewerik-mekija-nesh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺ የወርቅ መቅጃ ነሽ እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሃ ከጥሜ የሚያረካኝ
እኔ ተሻጋሪ ነኝ ማርያም ሆነሽኝ ድልድይ
ልጅሽ መድረሻየ ነው በደስታ የሚያኖረኝ

VERSE 1
እኔ እርቃኔን ነኝ ከጸጋው እርቄ
በክፉ ግብር በኃጥያት ወድቄ
ማርያም አንቺ ነሽ የሸማኔ እቃ
ልጅሽ ልብስ ነው ለሁሉ የሚበቃ/2/

CHORUS
አንቺ የወርቅ መቅጃ ነሽ እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሃ ከጥሜ የሚያረካኝ
እኔ ተሻጋሪ ነኝ ማርያም ሆነሽኝ ድልድይ
ልጅሽ መድረሻየ ነው በደስታ የሚያኖረኝ

VERSE 2
አንቺ መርከቤ እኔም ነጋዴ
ልጅሽ ዕንቁዬ ትርፌ ዘመዴ
ለእኔ ለድሃው ማከማቻዬ
የከበር ጌጥ ልጅሽ ቤዛዬ/2/

CHORUS
አንቺ የወርቅ መቅጃ ነሽ እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሃ ከጥሜ የሚያረካኝ
እኔ ተሻጋሪ ነኝ ማርያም ሆነሽኝ ድልድይ
ልጅሽ መድረሻየ ነው በደስታ የሚያኖረኝ

VERSE 3
እኔ ተጓዥ አንቺ መቅዘፊያ
ልጅሽ ወደብ ነው የህይወት ማረፊያ
አንቺ ፊደል ነሽ እኔ ተማሪ
ልጅሽ ወንጌል ነው ቸር አስተማሪ/2/

CHORUS
አንቺ የወርቅ መቅጃ ነሽ እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሃ ከጥሜ የሚያረካኝ
እኔ ተሻጋሪ ነኝ ማርያም ሆነሽኝ ድልድይ
ልጅሽ መድረሻየ ነው በደስታ የሚያኖረኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anchi yewerq meqja nesh ene yetet’emahu negn
Lijsh yehywet wiha ket’me yemiyarekagn
Ene teshagari negn Maryam honeshgn dildy
Lijsh medreshaye new bedesta yemiyanoregn

VERSE 1
Ene erqanen negn kets’egaw erqe
Bekfu gibr behat’yat wedqe
Maryam anchi nesh yeshemane eqa
Lijsh libs new lehulu yemibeqa (2)

CHORUS
Anchi yewerq meqja nesh ene yetet’emahu negn
Lijsh yehywet wiha ket’me yemiyarekagn
Ene teshagari negn Maryam honeshgn dildy
Lijsh medreshaye new bedesta yemiyanoregn

VERSE 2
Anchi merkebe enem negade
Lijsh enquye tirfe zemede
Leene ledhaw makemachaye
Yekeber get’ lijsh bezaye (2)

CHORUS
Anchi yewerq meqja nesh ene yetet’emahu negn
Lijsh yehywet wiha ket’me yemiyarekagn
Ene teshagari negn Maryam honeshgn dildy
Lijsh medreshaye new bedesta yemiyanoregn

VERSE 3
Ene tegwazh anchi meqzefiya
Lijsh wedeb new yehywet marefiya
Anchi fidel nesh ene temari
Lijsh wengel new cher astemari (2)

CHORUS
Anchi yewerq meqja nesh ene yetet’emahu negn
Lijsh yehywet wiha ket’me yemiyarekagn
Ene teshagari negn Maryam honeshgn dildy
Lijsh medreshaye new bedesta yemiyanoregn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'anichi-yewerik-mekija-nesh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Anichi Yewerik Mekija Nesh (anichi-yewerik-mekija-nesh-2654)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 1
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

VERSE 2
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 3
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

VERSE 4
እኔ እርቃኔ ነኝ
ከጸጋው ርቄ
በክፉ ግብር
በሀጥያት ወድቄ

VERSE 5
ማርያም አንቺ ነሽ
የሽማኔ ካባ
ልጅሽ ልብስ ነው
ለሁሌም ይበቃ

VERSE 6
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 7
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

VERSE 8
አንቺ መርከቤ
እኔም ነጋዴ
ልጅሽ እንቁ ነው
ትርፌ ዘመዴ

VERSE 9
ለእኔ ለደሃው
ማከማቻዬ
የከበረ ጌጥ
ልጅሽ ቤዛዬ

VERSE 10
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 11
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

VERSE 12
እኔ ተጓዥ ነኝ
አንቺ መግዣ
ልጅሽ ወደብ ነው
የሕይወት ማረፍያ

VERSE 13
አንቺ ፊደል ነሽ
እኔ ተማሪ
ልጅሽ ወንጌል ነው
ቸር አስታማሪ

VERSE 14
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 15
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ',
      lyrics_transliteration = 'Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 1
Ene teshagari negn
Maryam hognesh dildy
Lijsh medreshaye new
Bedesta yemiyanoregn

VERSE 2
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 3
Ene teshagari negn
Maryam hognesh dildy
Lijsh medreshaye new
Bedesta yemiyanoregn

VERSE 4
Ene erqane negn
Kets’egaw riqe
Bekfu gibr
Behet’yat wedqe

VERSE 5
Maryam anchi nesh
Yeshmane kaba
Lijsh libs new
Lehulem yibeqa

VERSE 6
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 7
Ene teshagari negn
Maryam hognesh dildy
Lijsh medreshaye new
Bedesta yemiyanoregn

VERSE 8
Anchi merkebe
Enem negade
Lijsh enqu new
Tirfe zemede

VERSE 9
Leene ledehaw
Makemachaye
Yekebere get’
Lijsh bezaye

VERSE 10
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 11
Ene teshagari negn
Maryam hognesh dildy
Lijsh medreshaye new
Bedesta yemiyanoregn

VERSE 12
Ene tegwazh negn
Anchi megzha
Lijsh wedeb new
Yehywet marefya

VERSE 13
Anchi fidel nesh
Ene temari
Lijsh wengel new
Cher astamari

VERSE 14
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 15
Ene teshagari negn
Maryam hognesh dildy
Lijsh medreshaye new
Bedesta yemiyanoregn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'anichi-yewerik-mekija-nesh-2654'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 1
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 2
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 3
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 4
እኔ እርቃኔ ነኝ
ከጸጋው ርቄ
በክፉ ግብር
በሀጥያት ወድቄ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 5
ማርያም አንቺ ነሽ
የሽማኔ ካባ
ልጅሽ ልብስ ነው
ለሁሌም ይበቃ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 6
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 7
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 8
አንቺ መርከቤ
እኔም ነጋዴ
ልጅሽ እንቁ ነው
ትርፌ ዘመዴ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 9
ለእኔ ለደሃው
ማከማቻዬ
የከበረ ጌጥ
ልጅሽ ቤዛዬ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 10
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 11
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 12
እኔ ተጓዥ ነኝ
አንቺ መግዣ
ልጅሽ ወደብ ነው
የሕይወት ማረፍያ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 13
አንቺ ፊደል ነሽ
እኔ ተማሪ
ልጅሽ ወንጌል ነው
ቸር አስታማሪ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 14
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ

VERSE 15
እኔ ተሻጋሪ ነኝ
ማርያም ሆኜሽ ድልድይ
ልጅሽ መድረሻዬ ነው
በደስታ የሚያኖረኝ

CHORUS
አንቺ የወርቅ መቅጃ ነሽ
እኔ የተጠማሁ ነኝ
ልጅሽ የሕይወት ውሀ
ከጥሜ የሚያረካኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 1
Ene teshagari negn
Maryam hognesh dildy
Lijsh medreshaye new
Bedesta yemiyanoregn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 2
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 3
Ene teshagari negn
Maryam hognesh dildy
Lijsh medreshaye new
Bedesta yemiyanoregn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 4
Ene erqane negn
Kets’egaw riqe
Bekfu gibr
Behet’yat wedqe

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 5
Maryam anchi nesh
Yeshmane kaba
Lijsh libs new
Lehulem yibeqa

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 6
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 7
Ene teshagari negn
Maryam hognesh dildy
Lijsh medreshaye new
Bedesta yemiyanoregn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 8
Anchi merkebe
Enem negade
Lijsh enqu new
Tirfe zemede

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 9
Leene ledehaw
Makemachaye
Yekebere get’
Lijsh bezaye

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 10
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 11
Ene teshagari negn
Maryam hognesh dildy
Lijsh medreshaye new
Bedesta yemiyanoregn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 12
Ene tegwazh negn
Anchi megzha
Lijsh wedeb new
Yehywet marefya

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 13
Anchi fidel nesh
Ene temari
Lijsh wengel new
Cher astamari

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 14
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn

VERSE 15
Ene teshagari negn
Maryam hognesh dildy
Lijsh medreshaye new
Bedesta yemiyanoregn

CHORUS
Anchi yewerq meqja nesh
Ene yetet’emahu negn
Lijsh yehywet wihe
Ket’me yemiyarekagn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'anichi-yewerik-mekija-nesh-2654', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Anichin Bicha Betelihem (anichin-bicha-betelihem)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 1
አንቺን ብቻ ቀራንዮ
አንቺን ብቻ በኮረብታ
ዮሴፍንም አላየንም
ሊቶስጥራ ጎልጎታ

VERSE 2
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል ብስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስትሰሚ ደንግጠሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ (2)

VERSE 3
ህጻኑን ስትወልጂ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደት ነው እንጂ የታሉ በሞቱ
አብረሺው የነበርሽ አንቺ ብቻ እናቱ (2)

VERSE 4
የግብፅን በረሃ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነርሱ እየፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ (2)

VERSE 5
ሃሙስ እለት ፋሲካን ሲበሉ ያመሹ
አርብ እለት ተነስተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበረ ላይከዱት መሃላ
ድንግል ካንቺ በቀር ማን ነበረ ሌላ (2)

VERSE 6
በሰላሳው ዘመን በስጋ ወራቱ
መች ነበሩ ከቶ ደቀ መዛሙርቱ
የእጆቹን ተዓምራት ቀን ከሌት እያየሽ
በቃሉ ብርታት ፊት አንቺ ብቻ ነበርሽ (2)

VERSE 7
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል በሞቱ
አብረሺው የነበርሽ አንቺ ብቻ እናቱ (2)',
      lyrics_transliteration = 'Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 1
Anchin bicha qeranyo
Anchin bicha bekorebta
Yosefnm alayenm
Litost’ra golgota

VERSE 2
Gena bemaleda benazretwa meqdes
Gebriel bisrat yizo kegelila siders
Yan zena sitsemi dengt’esh bebrtu
Anchi bicha nebersh bilatenaytu (2)

VERSE 3
Hits’anun sitwelji girgm yeneberu
Yelum bemekeraw qeranyon feru
Beldet new enji yetalu bemotu
Abreshiw yenebersh anchi bicha enatu (2)

VERSE 4
Yegbts’n bereha abrewsh yewet’u
Beqeyafa gibi endemn almet’u
Ersu lemigeref enersu eyeferu
Anchin bicha titew bemender neberu (2)

VERSE 5
Hamus elet fasikan sibelu yameshu
Arb elet tenestew keto wedet sheshu
Qal gebtew nebere laykedut mehala
Dingil kanchi beqer man nebere lela (2)

VERSE 6
Beselasaw zemen besga weratu
Mech neberu keto deqe mezamurtu
Yeejochun teamrat qen kelet eyayesh
Beqalu birtat fit anchi bicha nebersh (2)

VERSE 7
Betelhem yalu qeranyo yelum
Qeranyom yalu girgm alneberum
Behonebet zemen bemesqel bemotu
Abreshiw yenebersh anchi bicha enatu (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'anichin-bicha-betelihem'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 1
አንቺን ብቻ ቀራንዮ
አንቺን ብቻ በኮረብታ
ዮሴፍንም አላየንም
ሊቶስጥራ ጎልጎታ

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 2
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል ብስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስትሰሚ ደንግጠሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 3
ህጻኑን ስትወልጂ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደት ነው እንጂ የታሉ በሞቱ
አብረሺው የነበርሽ አንቺ ብቻ እናቱ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 4
የግብፅን በረሃ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነርሱ እየፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 5
ሃሙስ እለት ፋሲካን ሲበሉ ያመሹ
አርብ እለት ተነስተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበረ ላይከዱት መሃላ
ድንግል ካንቺ በቀር ማን ነበረ ሌላ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 6
በሰላሳው ዘመን በስጋ ወራቱ
መች ነበሩ ከቶ ደቀ መዛሙርቱ
የእጆቹን ተዓምራት ቀን ከሌት እያየሽ
በቃሉ ብርታት ፊት አንቺ ብቻ ነበርሽ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም

VERSE 7
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል በሞቱ
አብረሺው የነበርሽ አንቺ ብቻ እናቱ (2)

CHORUS
አንቺን ብቻ ቤተልሄም
አንቺን ብቻ በዚያ ግርግም
ዮሃንስን በገሊላ
በኤፍራታ አላየንም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 1
Anchin bicha qeranyo
Anchin bicha bekorebta
Yosefnm alayenm
Litost’ra golgota

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 2
Gena bemaleda benazretwa meqdes
Gebriel bisrat yizo kegelila siders
Yan zena sitsemi dengt’esh bebrtu
Anchi bicha nebersh bilatenaytu (2)

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 3
Hits’anun sitwelji girgm yeneberu
Yelum bemekeraw qeranyon feru
Beldet new enji yetalu bemotu
Abreshiw yenebersh anchi bicha enatu (2)

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 4
Yegbts’n bereha abrewsh yewet’u
Beqeyafa gibi endemn almet’u
Ersu lemigeref enersu eyeferu
Anchin bicha titew bemender neberu (2)

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 5
Hamus elet fasikan sibelu yameshu
Arb elet tenestew keto wedet sheshu
Qal gebtew nebere laykedut mehala
Dingil kanchi beqer man nebere lela (2)

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 6
Beselasaw zemen besga weratu
Mech neberu keto deqe mezamurtu
Yeejochun teamrat qen kelet eyayesh
Beqalu birtat fit anchi bicha nebersh (2)

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm

VERSE 7
Betelhem yalu qeranyo yelum
Qeranyom yalu girgm alneberum
Behonebet zemen bemesqel bemotu
Abreshiw yenebersh anchi bicha enatu (2)

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohansn begelila
Beefrata alayenm'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'anichin-bicha-betelihem', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Anichin Bicha Betelihem (anichin-bicha-betelihem-2000)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 1
ዮሴፍንም አላየንም ሊቶስጥራ ጎልጎታ

VERSE 2
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል ብስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስትሰሚ ደንግጠሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ 2

VERSE 3
ሕፃኑን ስትወልጂ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደት ነው እንጂ የታሉ በሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ2

VERSE 4
የግብፅን በረሀ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነሱ እየፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ2

VERSE 5
ሐሙስ ዕለት ፋሲካን ሲበሉ ያመሹ
አርብ ዕለት ተነሥተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበር ላይክዱት መሀላ
ድንግል ካንቺ በቀር ማን ነበር ሌላ2

VERSE 6
በሠላሳ ዘመን በሥጋ ወራቱ
መች ነበሩ ከቶ ደቀመዛሙርቱ
የእጆቹን ታምራት ቀን ከሌሊት እያየሽ
በቃሉ ብርታት ፊት አንቺ ብቻ ታየሽ2

VERSE 7
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል መሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ',
      lyrics_transliteration = 'Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 1
Yosefnm alayenm litost’ra golgota

VERSE 2
Gena bemaleda benazretwa meqdes
Gebriel bisrat yizo kegelila siders
Yan zena sitsemi dengt’esh bebrtu
Anchi bicha nebersh bilatenaytu 2

VERSE 3
Hits’anun sitwelji girgm yeneberu
Yelum bemekeraw qeranyon feru
Beldet new enji yetalu bemotu
Abreshw yenebersh anchi bicha enatu2

VERSE 4
Yegbts’n berehe abrewsh yewet’u
Beqeyafa gibi endemn almet’u
Ersu lemigeref enesu eyeferu
Anchin bicha titew bemender neberu2

VERSE 5
Hemus elet fasikan sibelu yameshu
Arb elet tenestew keto wedet sheshu
Qal gebtew neber laykdut mehela
Dingil kanchi beqer man neber lela2

VERSE 6
Beselasa zemen besga weratu
Mech neberu keto deqemezamurtu
Yeejochun tamrat qen kelelit eyayesh
Beqalu birtat fit anchi bicha tayesh2

VERSE 7
Betelhem yalu qeranyo yelum
Qeranyom yalu girgm alneberum
Behonebet zemen bemesqel memotu
Abreshw yenebersh anchi bicha enatu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'anichin-bicha-betelihem-2000'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 1
ዮሴፍንም አላየንም ሊቶስጥራ ጎልጎታ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 2
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል ብስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስትሰሚ ደንግጠሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ 2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 3
ሕፃኑን ስትወልጂ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደት ነው እንጂ የታሉ በሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 4
የግብፅን በረሀ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነሱ እየፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 5
ሐሙስ ዕለት ፋሲካን ሲበሉ ያመሹ
አርብ ዕለት ተነሥተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበር ላይክዱት መሀላ
ድንግል ካንቺ በቀር ማን ነበር ሌላ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 6
በሠላሳ ዘመን በሥጋ ወራቱ
መች ነበሩ ከቶ ደቀመዛሙርቱ
የእጆቹን ታምራት ቀን ከሌሊት እያየሽ
በቃሉ ብርታት ፊት አንቺ ብቻ ታየሽ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 7
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል መሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 1
Yosefnm alayenm litost’ra golgota

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 2
Gena bemaleda benazretwa meqdes
Gebriel bisrat yizo kegelila siders
Yan zena sitsemi dengt’esh bebrtu
Anchi bicha nebersh bilatenaytu 2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 3
Hits’anun sitwelji girgm yeneberu
Yelum bemekeraw qeranyon feru
Beldet new enji yetalu bemotu
Abreshw yenebersh anchi bicha enatu2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 4
Yegbts’n berehe abrewsh yewet’u
Beqeyafa gibi endemn almet’u
Ersu lemigeref enesu eyeferu
Anchin bicha titew bemender neberu2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 5
Hemus elet fasikan sibelu yameshu
Arb elet tenestew keto wedet sheshu
Qal gebtew neber laykdut mehela
Dingil kanchi beqer man neber lela2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 6
Beselasa zemen besga weratu
Mech neberu keto deqemezamurtu
Yeejochun tamrat qen kelelit eyayesh
Beqalu birtat fit anchi bicha tayesh2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 7
Betelhem yalu qeranyo yelum
Qeranyom yalu girgm alneberum
Behonebet zemen bemesqel memotu
Abreshw yenebersh anchi bicha enatu

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'anichin-bicha-betelihem-2000', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Anichin Yeyaze Sew (anichin-yeyaze-sew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንቺ አስደሳች ወይ ምን ይሆንልሽ
ለቤትሽ አስገባሽ ሁሉ ደግሞ መጣ
ዘመኑ አይፈርስም ወዘራፍ አይመለስም
ሁሉም ይሸፍነናል

VERSE 1
በረከትን ትሰጪናለሽ
አንቺ ብትፈጅ ምድረ ከርሲ ታብብ
እንደ ምድር ቡቃያ በዛልሽ ለአንቺ
የአለም ሲራብ ሁላ ለአንቺ መጽሐፍ በላ

VERSE 2
ስለ ፍጥረታት ጸሎት የነገረች
እምነት ያንቺ ናት ለመዳን የወሰነች
መከራሽ በረከትን ስሙሽና ልብሽ የሆናሽ
የውድነትሽ ውበት ላንቺ ምስጋና ይሁን

VERSE 3
የእግዚአብሔር ማረፊያ ኮረብታ የዛፍ
የሕይወት ውሃም የእህት ምስጋና
ለፍጥረተ አለሙ ምስጋና ይድረስሽ
በአምሳል ለምልም ወርቅ መላኩ ፈረሰኛ

VERSE 4
ወርቅ መላኩ ፈረሰኛ
ወርቅ መላኩ ፈረሰኛ
ውድ የመጣህ ወረኛ',
      lyrics_transliteration = 'Anchi asdesach wey min yihonlsh
Lebetsh asgebash hulu degmo met’a
Zemenu ayfersm wezeraf aymelesm
Hulum yishefnenal

VERSE 1
Bereketn tisech’inalesh
Anchi bitfej midre kersi tabb
Ende midr buqaya bezalsh leanchi
Yealem sirab hula leanchi mets’hef bela

VERSE 2
Sile fit’retat ts’elot yenegerech
Emnet yanchi nat lemedan yewesenech
Mekerash bereketn simushna libsh yehonash
Yewdnetsh wibet lanchi misgana yihun

VERSE 3
YeEgziabher marefiya korebta yezaf
Yehywet wiham yeeht misgana
Left’rete alemu misgana yidressh
Beamsal lemlm werq melaku feresegna

VERSE 4
Werq melaku feresegna
Werq melaku feresegna
Wid yemet’ah weregna',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'anichin-yeyaze-sew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺ አስደሳች ወይ ምን ይሆንልሽ
ለቤትሽ አስገባሽ ሁሉ ደግሞ መጣ
ዘመኑ አይፈርስም ወዘራፍ አይመለስም
ሁሉም ይሸፍነናል

VERSE 1
በረከትን ትሰጪናለሽ
አንቺ ብትፈጅ ምድረ ከርሲ ታብብ
እንደ ምድር ቡቃያ በዛልሽ ለአንቺ
የአለም ሲራብ ሁላ ለአንቺ መጽሐፍ በላ

CHORUS
አንቺ አስደሳች ወይ ምን ይሆንልሽ
ለቤትሽ አስገባሽ ሁሉ ደግሞ መጣ
ዘመኑ አይፈርስም ወዘራፍ አይመለስም
ሁሉም ይሸፍነናል

VERSE 2
ስለ ፍጥረታት ጸሎት የነገረች
እምነት ያንቺ ናት ለመዳን የወሰነች
መከራሽ በረከትን ስሙሽና ልብሽ የሆናሽ
የውድነትሽ ውበት ላንቺ ምስጋና ይሁን

CHORUS
አንቺ አስደሳች ወይ ምን ይሆንልሽ
ለቤትሽ አስገባሽ ሁሉ ደግሞ መጣ
ዘመኑ አይፈርስም ወዘራፍ አይመለስም
ሁሉም ይሸፍነናል

VERSE 3
የእግዚአብሔር ማረፊያ ኮረብታ የዛፍ
የሕይወት ውሃም የእህት ምስጋና
ለፍጥረተ አለሙ ምስጋና ይድረስሽ
በአምሳል ለምልም ወርቅ መላኩ ፈረሰኛ

CHORUS
አንቺ አስደሳች ወይ ምን ይሆንልሽ
ለቤትሽ አስገባሽ ሁሉ ደግሞ መጣ
ዘመኑ አይፈርስም ወዘራፍ አይመለስም
ሁሉም ይሸፍነናል

VERSE 4
ወርቅ መላኩ ፈረሰኛ
ወርቅ መላኩ ፈረሰኛ
ውድ የመጣህ ወረኛ

CHORUS
አንቺ አስደሳች ወይ ምን ይሆንልሽ
ለቤትሽ አስገባሽ ሁሉ ደግሞ መጣ
ዘመኑ አይፈርስም ወዘራፍ አይመለስም
ሁሉም ይሸፍነናል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anchi asdesach wey min yihonlsh
Lebetsh asgebash hulu degmo met’a
Zemenu ayfersm wezeraf aymelesm
Hulum yishefnenal

VERSE 1
Bereketn tisech’inalesh
Anchi bitfej midre kersi tabb
Ende midr buqaya bezalsh leanchi
Yealem sirab hula leanchi mets’hef bela

CHORUS
Anchi asdesach wey min yihonlsh
Lebetsh asgebash hulu degmo met’a
Zemenu ayfersm wezeraf aymelesm
Hulum yishefnenal

VERSE 2
Sile fit’retat ts’elot yenegerech
Emnet yanchi nat lemedan yewesenech
Mekerash bereketn simushna libsh yehonash
Yewdnetsh wibet lanchi misgana yihun

CHORUS
Anchi asdesach wey min yihonlsh
Lebetsh asgebash hulu degmo met’a
Zemenu ayfersm wezeraf aymelesm
Hulum yishefnenal

VERSE 3
YeEgziabher marefiya korebta yezaf
Yehywet wiham yeeht misgana
Left’rete alemu misgana yidressh
Beamsal lemlm werq melaku feresegna

CHORUS
Anchi asdesach wey min yihonlsh
Lebetsh asgebash hulu degmo met’a
Zemenu ayfersm wezeraf aymelesm
Hulum yishefnenal

VERSE 4
Werq melaku feresegna
Werq melaku feresegna
Wid yemet’ah weregna

CHORUS
Anchi asdesach wey min yihonlsh
Lebetsh asgebash hulu degmo met’a
Zemenu ayfersm wezeraf aymelesm
Hulum yishefnenal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'anichin-yeyaze-sew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Anichin Yeyaze Sew Min Yigolibetal (anichin-yeyaze-sew-min-yigolibetal)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/

VERSE 1
በረከትሽ ብዙ የደናግል ገንዘብ
የምስኪናን እናት የርሁባን ቀለብ
ለሁሉ መጋቢ ጸጋሽ የማይጎድል
ስምሽ ጥዑም ምግብ ከረሀብ የሚያስጥል/2/

VERSE 2
አንቺ ብትመጪ ከምስኪኗ ቤቴ
እንደ መጥምቁ እናት በዛልኝ ሐሴቴ
የአዲስ ኪዳን ቁርባን መንበር ጠረጴዛ
ጽድቅን አሸተትን የሕይወትሽን መዓዛ /2/

VERSE 3
ልቤ ተጠራጥሮ ኪዳንሽን ካልከዳ
ልመናም አልወርድም አልይዝም አቁፋዳ
ሁሉን እየሞላሽ መመገብ ታውቂያለሽ
ቢዝቁት የማያልቅ ጸጋና ሀብት አለሽ/2/

VERSE 4
የእግዚአብሔር ማረፊያ ኮሬባዊት ዋሻ
የሕይወት ውሃ ምንጭ የህግ መፍሰሻ
ነበልባል ተዋህዶሽ ሙሴ አንቺን አይቷል
ጫማውን አውልቆ በፊትሽ ተደፍቷል /2/',
      lyrics_transliteration = 'Anchin yeyaze sew min yigodlbetal
Bemljash bereket betu moltoletal
Zer meker baynow goteraw baymola
Hulum yishefenal beredetsh t’la (2)

VERSE 1
Bereketsh bizu yedenagl genzeb
Yemskinan enat yerhuban qeleb
Lehulu megabi ts’egash yemaygodl
Simsh t’um migb kereheb yemiyast’l (2)

VERSE 2
Anchi bitmech’i kemskinwa bete
Ende met’mqu enat bezalgn hesete
Yeadis kidan qurban menber t’erep’eza
Ts’dqn ashetetn yehywetshn meaza (2)

VERSE 3
Libe tet’erat’ro kidanshn kalkeda
Limenam alwerdm alyzm aqufada
Hulun eyemolash memegeb tawqiyalesh
Bizqut yemayalq ts’egana hebt alesh (2)

VERSE 4
YeEgziabher marefiya korebawit washa
Yehywet wiha minch’ yehg mefsesha
Nebelbal tewahdosh muse anchin aytwal
Ch’amawn awlqo befitsh tedeftwal (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'anichin-yeyaze-sew-min-yigolibetal'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/

VERSE 1
በረከትሽ ብዙ የደናግል ገንዘብ
የምስኪናን እናት የርሁባን ቀለብ
ለሁሉ መጋቢ ጸጋሽ የማይጎድል
ስምሽ ጥዑም ምግብ ከረሀብ የሚያስጥል/2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/

VERSE 2
አንቺ ብትመጪ ከምስኪኗ ቤቴ
እንደ መጥምቁ እናት በዛልኝ ሐሴቴ
የአዲስ ኪዳን ቁርባን መንበር ጠረጴዛ
ጽድቅን አሸተትን የሕይወትሽን መዓዛ /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/

VERSE 3
ልቤ ተጠራጥሮ ኪዳንሽን ካልከዳ
ልመናም አልወርድም አልይዝም አቁፋዳ
ሁሉን እየሞላሽ መመገብ ታውቂያለሽ
ቢዝቁት የማያልቅ ጸጋና ሀብት አለሽ/2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/

VERSE 4
የእግዚአብሔር ማረፊያ ኮሬባዊት ዋሻ
የሕይወት ውሃ ምንጭ የህግ መፍሰሻ
ነበልባል ተዋህዶሽ ሙሴ አንቺን አይቷል
ጫማውን አውልቆ በፊትሽ ተደፍቷል /2/

CHORUS
አንቺን የያዘ ሰው ምን ይጎድልበታል
በምልጃሽ በረከት ቤቱ ሞልቶለታል
ዘር መከር ባይኖው ጎተራው ባይሞላ
ሁሉም ይሸፈናል በረድኤትሽ ጥላ/2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anchin yeyaze sew min yigodlbetal
Bemljash bereket betu moltoletal
Zer meker baynow goteraw baymola
Hulum yishefenal beredetsh t’la (2)

VERSE 1
Bereketsh bizu yedenagl genzeb
Yemskinan enat yerhuban qeleb
Lehulu megabi ts’egash yemaygodl
Simsh t’um migb kereheb yemiyast’l (2)

CHORUS
Anchin yeyaze sew min yigodlbetal
Bemljash bereket betu moltoletal
Zer meker baynow goteraw baymola
Hulum yishefenal beredetsh t’la (2)

VERSE 2
Anchi bitmech’i kemskinwa bete
Ende met’mqu enat bezalgn hesete
Yeadis kidan qurban menber t’erep’eza
Ts’dqn ashetetn yehywetshn meaza (2)

CHORUS
Anchin yeyaze sew min yigodlbetal
Bemljash bereket betu moltoletal
Zer meker baynow goteraw baymola
Hulum yishefenal beredetsh t’la (2)

VERSE 3
Libe tet’erat’ro kidanshn kalkeda
Limenam alwerdm alyzm aqufada
Hulun eyemolash memegeb tawqiyalesh
Bizqut yemayalq ts’egana hebt alesh (2)

CHORUS
Anchin yeyaze sew min yigodlbetal
Bemljash bereket betu moltoletal
Zer meker baynow goteraw baymola
Hulum yishefenal beredetsh t’la (2)

VERSE 4
YeEgziabher marefiya korebawit washa
Yehywet wiha minch’ yehg mefsesha
Nebelbal tewahdosh muse anchin aytwal
Ch’amawn awlqo befitsh tedeftwal (2)

CHORUS
Anchin yeyaze sew min yigodlbetal
Bemljash bereket betu moltoletal
Zer meker baynow goteraw baymola
Hulum yishefenal beredetsh t’la (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'anichin-yeyaze-sew-min-yigolibetal', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Anidit Bete Kirisitiyan Mezimur (anidit-bete-kirisitiyan-mezimur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሃይማኖት አንድ ጊዜ ለቅዱሳን ተሰጠች
አንዲት ቤተክርስቲያን በደሙ ታተመች
እንጋደልባት ዘንድ ለድኅነት ሆነች
በአንዲት ቤተ ክርስቲያን መጋደላችንም

VERSE 1
ከደም ከሥጋ ጋር በፍጹም አይደለም
ከጨለማው ገዥ ከአለቆች ሥልጣናት
ከክፉ መንፈስ ነው ከጥፋት ሠራዊት
የአምላክን ጦር ዕቃ በእምነት አንስተናል

VERSE 2
ወገባችንንም በእምነት ታጥቀናል
የጽድቅ ጥሩርን ልብሳችን አድርገናል
የመንፈስንም ሰይፍ በእጃችን ይዘናል
በተዋህዶ መንገድ ጉዞ የጀመሩ

VERSE 3
በስጋዊ ምኞት በጎሳ ታወሩ
በብርና በወርቅ እየተታለሉ
ተለይተው ሄዱ ከእምነት ያይደሉ
በጴጥሮስ ዐለት ላይ ታንፃ የምናያት

VERSE 4
ከቶ አጠፋምና በእሳት እና ስለት
የገሃነም ደጆች የማያናውጧት
በሰማዕታት ደም በገድል ያጌጠች ናት',
      lyrics_transliteration = 'Haymanot and gize leqdusan teset’ech
Andit Bete Kristian bedemu tatemech
Engadelbat zend ledhnet honech
Beandit Bete Kristian megadelachnm

VERSE 1
Kedem kesga gar befts’um aydelem
Kech’elemaw gezh kealeqoch silt’anat
Kekfu menfes new ket’fat serawit
Yeamlakn t’or eqa beemnet anstenal

VERSE 2
Wegebachnnm beemnet tat’qenal
Yets’dq t’rurn libsachn adrgenal
Yemenfesnm seyf beejachn yizenal
Betewahdo menged guzo yejemeru

VERSE 3
Besgawi mignot begosa taweru
Bebrna bewerq eyetetalelu
Teleytew hedu keemnet yaydelu
Bep’et’ros alet lay tants’a yemnayat

VERSE 4
Keto at’efamna beesat ena silet
Yegehanem dejoch yemayanawt’wat
Besemaetat dem begedl yaget’ech nat',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'anidit-bete-kirisitiyan-mezimur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሃይማኖት አንድ ጊዜ ለቅዱሳን ተሰጠች
አንዲት ቤተክርስቲያን በደሙ ታተመች
እንጋደልባት ዘንድ ለድኅነት ሆነች
በአንዲት ቤተ ክርስቲያን መጋደላችንም

VERSE 1
ከደም ከሥጋ ጋር በፍጹም አይደለም
ከጨለማው ገዥ ከአለቆች ሥልጣናት
ከክፉ መንፈስ ነው ከጥፋት ሠራዊት
የአምላክን ጦር ዕቃ በእምነት አንስተናል

CHORUS
ሃይማኖት አንድ ጊዜ ለቅዱሳን ተሰጠች
አንዲት ቤተክርስቲያን በደሙ ታተመች
እንጋደልባት ዘንድ ለድኅነት ሆነች
በአንዲት ቤተ ክርስቲያን መጋደላችንም

VERSE 2
ወገባችንንም በእምነት ታጥቀናል
የጽድቅ ጥሩርን ልብሳችን አድርገናል
የመንፈስንም ሰይፍ በእጃችን ይዘናል
በተዋህዶ መንገድ ጉዞ የጀመሩ

CHORUS
ሃይማኖት አንድ ጊዜ ለቅዱሳን ተሰጠች
አንዲት ቤተክርስቲያን በደሙ ታተመች
እንጋደልባት ዘንድ ለድኅነት ሆነች
በአንዲት ቤተ ክርስቲያን መጋደላችንም

VERSE 3
በስጋዊ ምኞት በጎሳ ታወሩ
በብርና በወርቅ እየተታለሉ
ተለይተው ሄዱ ከእምነት ያይደሉ
በጴጥሮስ ዐለት ላይ ታንፃ የምናያት

CHORUS
ሃይማኖት አንድ ጊዜ ለቅዱሳን ተሰጠች
አንዲት ቤተክርስቲያን በደሙ ታተመች
እንጋደልባት ዘንድ ለድኅነት ሆነች
በአንዲት ቤተ ክርስቲያን መጋደላችንም

VERSE 4
ከቶ አጠፋምና በእሳት እና ስለት
የገሃነም ደጆች የማያናውጧት
በሰማዕታት ደም በገድል ያጌጠች ናት

CHORUS
ሃይማኖት አንድ ጊዜ ለቅዱሳን ተሰጠች
አንዲት ቤተክርስቲያን በደሙ ታተመች
እንጋደልባት ዘንድ ለድኅነት ሆነች
በአንዲት ቤተ ክርስቲያን መጋደላችንም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Haymanot and gize leqdusan teset’ech
Andit Bete Kristian bedemu tatemech
Engadelbat zend ledhnet honech
Beandit Bete Kristian megadelachnm

VERSE 1
Kedem kesga gar befts’um aydelem
Kech’elemaw gezh kealeqoch silt’anat
Kekfu menfes new ket’fat serawit
Yeamlakn t’or eqa beemnet anstenal

CHORUS
Haymanot and gize leqdusan teset’ech
Andit Bete Kristian bedemu tatemech
Engadelbat zend ledhnet honech
Beandit Bete Kristian megadelachnm

VERSE 2
Wegebachnnm beemnet tat’qenal
Yets’dq t’rurn libsachn adrgenal
Yemenfesnm seyf beejachn yizenal
Betewahdo menged guzo yejemeru

CHORUS
Haymanot and gize leqdusan teset’ech
Andit Bete Kristian bedemu tatemech
Engadelbat zend ledhnet honech
Beandit Bete Kristian megadelachnm

VERSE 3
Besgawi mignot begosa taweru
Bebrna bewerq eyetetalelu
Teleytew hedu keemnet yaydelu
Bep’et’ros alet lay tants’a yemnayat

CHORUS
Haymanot and gize leqdusan teset’ech
Andit Bete Kristian bedemu tatemech
Engadelbat zend ledhnet honech
Beandit Bete Kristian megadelachnm

VERSE 4
Keto at’efamna beesat ena silet
Yegehanem dejoch yemayanawt’wat
Besemaetat dem begedl yaget’ech nat

CHORUS
Haymanot and gize leqdusan teset’ech
Andit Bete Kristian bedemu tatemech
Engadelbat zend ledhnet honech
Beandit Bete Kristian megadelachnm'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'anidit-bete-kirisitiyan-mezimur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Anidit Nat (anidit-nat)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 1
አዲስ አይደለንም ለመከራ ጉዞ
የወደቀ አናውቅም መስቀል ተመርኩዞ
አምላከ ቅዱሳን ከእኛ ጋር ነውና
በርቱ ክርስቲያኖች በእውነት ጎዳና /፪ አዝ…

VERSE 2
የአበውን እምነት በአላውያን ፊት
ሰምተን ስላደግን ከገድላት አንደበት
መስዋዕትነትም ቀርቧል ከፊታችን
እውነት ስትገፋ አይችልም ልባችን /፪

VERSE 3
አዝ…
አልጠፋችምና በእሳት ተፈትና
ይህን እናውቃለን በገሃድ ነውና
መሰደድ መቃጠል ሁሉም ለጊዜው ነው

VERSE 4
ለእውነት ከሆነ ሞትም ክብራችን ነው /፪
አዝ…
ከተዋሕዶ ጋር ስላለ መንፈሱ
እውነትን ለማጥፋት መቅደስ አታፍርሱ

VERSE 5
በግፍ ቢገደሉ ክርስቲያኖች ሁሉ
ኦርቶዶክስ（ተዋሕዶ）አትጠፋም ተነግሯል በቃሉ /፪
አዝ…
ታሪክን ያኖረች ፊደላት ቀርፃ

VERSE 6
ቅርስን ያወረሰች ገዳማት አንፃ
እንግዳ ተቀባይ መንፈሳዊት እናት
ይህንን አትዘንጉ ኦርቶዶክስ（ተዋሕዶ）ሀገር ናት /፪
አዝ…',
      lyrics_transliteration = 'Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat

VERSE 1
Adis aydelenm lemekera guzo
Yewedeqe anawqm mesqel temerkuzo
Amlake Kidusan keegna gar newna
Bertu kirstiyanoch beewnet godana /2 az…

VERSE 2
Yeabewn emnet bealawyan fit
Semten siladegn kegedlat andebet
Meswaetnetm qerbwal kefitachn
Ewnet sitgefa aychlm libachn /2

VERSE 3
Alt’efachmna beesat tefetna
Yihn enawqalen begehad newna
Meseded meqat’el hulum legizew new

VERSE 4
Leewnet kehone motm kibrachn new /2
Ketewahdo gar silale menfesu
Ewnetn lemat’fat meqdes atafrsu

VERSE 5
Begf bigedelu kirstiyanoch hulu
Ortodoks（Tewahedo）att’efam tenegrwal beqalu /2
Tarikn yanorech fidelat qerts’a

VERSE 6
Qirsn yaweresech gedamat ants’a
Engda teqebay menfesawit enat
Yihnn atzengu Ortodoks（Tewahedo）heger nat /2',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'anidit-nat'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 1
አዲስ አይደለንም ለመከራ ጉዞ
የወደቀ አናውቅም መስቀል ተመርኩዞ
አምላከ ቅዱሳን ከእኛ ጋር ነውና
በርቱ ክርስቲያኖች በእውነት ጎዳና /፪ አዝ…

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 2
የአበውን እምነት በአላውያን ፊት
ሰምተን ስላደግን ከገድላት አንደበት
መስዋዕትነትም ቀርቧል ከፊታችን
እውነት ስትገፋ አይችልም ልባችን /፪

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 3
አዝ…
አልጠፋችምና በእሳት ተፈትና
ይህን እናውቃለን በገሃድ ነውና
መሰደድ መቃጠል ሁሉም ለጊዜው ነው

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 4
ለእውነት ከሆነ ሞትም ክብራችን ነው /፪
አዝ…
ከተዋሕዶ ጋር ስላለ መንፈሱ
እውነትን ለማጥፋት መቅደስ አታፍርሱ

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 5
በግፍ ቢገደሉ ክርስቲያኖች ሁሉ
ኦርቶዶክስ（ተዋሕዶ）አትጠፋም ተነግሯል በቃሉ /፪
አዝ…
ታሪክን ያኖረች ፊደላት ቀርፃ

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት

VERSE 6
ቅርስን ያወረሰች ገዳማት አንፃ
እንግዳ ተቀባይ መንፈሳዊት እናት
ይህንን አትዘንጉ ኦርቶዶክስ（ተዋሕዶ）ሀገር ናት /፪
አዝ…

CHORUS
አንዲት ናት ቤተ ክርስቲያን / ፪
ቋንቋና ዘር ቀለም የማይነጣጥላት
ክርስቶስ በደሙ የመሠረታት
ቤተ ክርስቲያን አንዲት ናት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat

VERSE 1
Adis aydelenm lemekera guzo
Yewedeqe anawqm mesqel temerkuzo
Amlake Kidusan keegna gar newna
Bertu kirstiyanoch beewnet godana /2 az…

CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat

VERSE 2
Yeabewn emnet bealawyan fit
Semten siladegn kegedlat andebet
Meswaetnetm qerbwal kefitachn
Ewnet sitgefa aychlm libachn /2

CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat

VERSE 3
CHORUS
Alt’efachmna beesat tefetna
Yihn enawqalen begehad newna
Meseded meqat’el hulum legizew new

CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat

VERSE 4
Leewnet kehone motm kibrachn new /2
CHORUS
Ketewahdo gar silale menfesu
Ewnetn lemat’fat meqdes atafrsu

CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat

VERSE 5
Begf bigedelu kirstiyanoch hulu
Ortodoks（Tewahedo）att’efam tenegrwal beqalu /2
CHORUS
Tarikn yanorech fidelat qerts’a

CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat

VERSE 6
Qirsn yaweresech gedamat ants’a
Engda teqebay menfesawit enat
Yihnn atzengu Ortodoks（Tewahedo）heger nat /2
CHORUS

CHORUS
Andit nat Bete Kristian / 2
Qwanqwana zer qelem yemaynet’at’lat
Kristos bedemu yemeseretat
Bete Kristian andit nat'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'anidit-nat', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Aniferiatsu (aniferiatsu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አምኃሆሙ አምጽኡ መድምመ /*2
አንፈራዓፁ ሰብአ ሰገል /*4

VERSE 1
አምኃሆሙ አምጽኡ መድምመ /*2
አንፈራዓፁ ሰብአ ሰገል /*4',
      lyrics_transliteration = 'Amhahomu amts’u medmme /*2
Anferaats’u seba segel /*4

VERSE 1
Amhahomu amts’u medmme /*2
Anferaats’u seba segel /*4',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'aniferiatsu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አምኃሆሙ አምጽኡ መድምመ /*2
አንፈራዓፁ ሰብአ ሰገል /*4

VERSE 1
አምኃሆሙ አምጽኡ መድምመ /*2
አንፈራዓፁ ሰብአ ሰገል /*4

CHORUS
አምኃሆሙ አምጽኡ መድምመ /*2
አንፈራዓፁ ሰብአ ሰገል /*4'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amhahomu amts’u medmme /*2
Anferaats’u seba segel /*4

VERSE 1
Amhahomu amts’u medmme /*2
Anferaats’u seba segel /*4

CHORUS
Amhahomu amts’u medmme /*2
Anferaats’u seba segel /*4'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'aniferiatsu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Anite Aleh Bekibir (anite-aleh-bekibir)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 1
ሳይታይ የየብስ ፊቱ
ቀላያት ሳይከፈቱ
ሰማይና ምድር ሳይኖሩ
ብርሃናት ሁሉ ሳይበሩ

VERSE 2
ኮረብቶች ፊቱ ሳይቆሙ
አበቦች ሳይለመልሙ
ሳይመዘዙ መባርቅት
ሳይንጓደዱ ብርሃናት

VERSE 3
ነጎድጓድ ድምፅ ሳይሰጡ
ከዋክብት ሳይፈነጥቁ
ከፍ ብለህ ከፍታ
ብቻህን ነበርክ ጌታ

VERSE 4
የወንዝ ጎርፎች ሳይፈሱ
ነፋሳት ገና ሳይነፍሱ
የውሃ ምንጮች ሳይፈሉ
ሁኑ ሳይላቸው በቃሉ

VERSE 5
ደመናው ግዘፍ ሳይሳብ
ሳይበጅ የምድርም ክበብ
መዓልቱ ገና ሳይኖር
ሌሊትም ሳይፈጠር

VERSE 6
ጨለማው ሳይጋረድ
ሳጥናኤል ሳይዋረድ
መላእክት ሳይፈጠሩ
ያህዌ ነበር በክብሩ

VERSE 7
ከሁሉ የተሰወርክ
በክብርህ ከክረህ የኖርክ
ማይደረስብህ ጥልቅ
ማትመረመር ምጡቅ

VERSE 8
ኮረብቶችን የመዘንክ
ውኆችንም የሰፈርክ
ሁሉን የምትመረምር
ግሩም ነህ ማትደፈር

VERSE 9
በባሕሪይህ ከብረህ
በምስጋና ተከበህ
የነበርክ በዘላለም
ያህዌ እንዳንተ የለም

VERSE 10
ሳትደክም ምትሸከም
ሳታጎድል ምትሰጥ ሰላም
ሳትተኛ ምትጠብቅ
ሳትነጥፍ ሁሉንታውቅ

VERSE 11
በፍቅር ምትገዛ ንጉስ
ነቅ የሌለብህ ቅዱስ
ሁሉን ምትፈውስ መድህን
የጠበቅከን በዘመን

VERSE 12
ምታስብ ሳትዘነጋ
ምትሰጥ ለሁሉ ዋጋ
ምትተው ሳትቀበል
አምላክ ነህ ጌታ ልዑል

VERSE 13
የመመኪያችን ዘውድ
የተ ዛመድከን ዘመድ
የደኅንነታችን ፋና
የመኖራችን ዋስትና

VERSE 14
የሕይወታችን መሠረት፤
የቤታችን ጉልላት፤
የማንነታችን ውበት
ለመኖራችን ድምቀት

VERSE 15
አልጫውን ያጣፈጥክ
ጨለማውን ያሳደድክ
አለሙን ያበራህ ፋና
ከፍ በል በምስጋና',
      lyrics_transliteration = 'Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 1
Saytay yeyebs fitu
Qelayat saykefetu
Semayna midr saynoru
Birhanat hulu sayberu

VERSE 2
Korebtoch fitu sayqomu
Abeboch saylemelmu
Saymezezu mebarqt
Sayngwadedu birhanat

VERSE 3
Negodgwad dimts’ sayset’u
Kewakbt sayfenet’qu
Kef bileh kefta
Bichahn neberk Geta

VERSE 4
Yewenz gorfoch sayfesu
Nefasat gena saynefsu
Yewha minch’och sayfelu
Hunu saylachew beqalu

VERSE 5
Demenaw gizef saysab
Saybej yemdrm kibeb
Mealtu gena saynor
Lelitm sayfet’er

VERSE 6
Ch’elemaw saygared
Sat’nael saywared
Melaekt sayfet’eru
Yahwe neber bekbru

VERSE 7
Kehulu yetesewerk
Bekbrh kekreh yenork
Mayderesbh t’lq
Matmeremer mit’uq

VERSE 8
Korebtochn yemezenk
Wihochnm yeseferk
Hulun yemtmeremr
Girum neh matdefer

VERSE 9
Bebahriyh kebreh
Bemsgana tekebeh
Yeneberk bezelalem
Yahwe endante yelem

VERSE 10
Satdekm mitshekem
Satagodl mitset’ selam
Sattegna mitt’ebq
Satnet’f huluntawq

VERSE 11
Befqr mitgeza nigus
Neq yelelebh Kidus
Hulun mitfews medhn
Yet’ebeqken bezemen

VERSE 12
Mitasb satzenega
Mitset’ lehulu waga
Mittew satqebel
Amlak neh Geta liul

VERSE 13
Yememekiyachn zewd
Yete zamedken zemed
Yedehnnetachn fana
Yemenorachn wastna

VERSE 14
Yehywetachn meseret;
Yebetachn gullat;
Yemannetachn wibet
Lemenorachn dimqet

VERSE 15
Alch’awn yat’afet’k
Ch’elemawn yasadedk
Alemun yaberah fana
Kef bel bemsgana',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'anite-aleh-bekibir'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 1
ሳይታይ የየብስ ፊቱ
ቀላያት ሳይከፈቱ
ሰማይና ምድር ሳይኖሩ
ብርሃናት ሁሉ ሳይበሩ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 2
ኮረብቶች ፊቱ ሳይቆሙ
አበቦች ሳይለመልሙ
ሳይመዘዙ መባርቅት
ሳይንጓደዱ ብርሃናት

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 3
ነጎድጓድ ድምፅ ሳይሰጡ
ከዋክብት ሳይፈነጥቁ
ከፍ ብለህ ከፍታ
ብቻህን ነበርክ ጌታ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 4
የወንዝ ጎርፎች ሳይፈሱ
ነፋሳት ገና ሳይነፍሱ
የውሃ ምንጮች ሳይፈሉ
ሁኑ ሳይላቸው በቃሉ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 5
ደመናው ግዘፍ ሳይሳብ
ሳይበጅ የምድርም ክበብ
መዓልቱ ገና ሳይኖር
ሌሊትም ሳይፈጠር

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 6
ጨለማው ሳይጋረድ
ሳጥናኤል ሳይዋረድ
መላእክት ሳይፈጠሩ
ያህዌ ነበር በክብሩ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 7
ከሁሉ የተሰወርክ
በክብርህ ከክረህ የኖርክ
ማይደረስብህ ጥልቅ
ማትመረመር ምጡቅ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 8
ኮረብቶችን የመዘንክ
ውኆችንም የሰፈርክ
ሁሉን የምትመረምር
ግሩም ነህ ማትደፈር

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 9
በባሕሪይህ ከብረህ
በምስጋና ተከበህ
የነበርክ በዘላለም
ያህዌ እንዳንተ የለም

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 10
ሳትደክም ምትሸከም
ሳታጎድል ምትሰጥ ሰላም
ሳትተኛ ምትጠብቅ
ሳትነጥፍ ሁሉንታውቅ

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 11
በፍቅር ምትገዛ ንጉስ
ነቅ የሌለብህ ቅዱስ
ሁሉን ምትፈውስ መድህን
የጠበቅከን በዘመን

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 12
ምታስብ ሳትዘነጋ
ምትሰጥ ለሁሉ ዋጋ
ምትተው ሳትቀበል
አምላክ ነህ ጌታ ልዑል

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 13
የመመኪያችን ዘውድ
የተ ዛመድከን ዘመድ
የደኅንነታችን ፋና
የመኖራችን ዋስትና

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 14
የሕይወታችን መሠረት፤
የቤታችን ጉልላት፤
የማንነታችን ውበት
ለመኖራችን ድምቀት

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ

VERSE 15
አልጫውን ያጣፈጥክ
ጨለማውን ያሳደድክ
አለሙን ያበራህ ፋና
ከፍ በል በምስጋና

CHORUS
አንተ አለህ በክብር አንተ አለህ በከፍታ
አንተ አለህ በልዕልና ያህዌ የእኛ ጌታ
ያህዌ አምላካችን የሕይወታችን አንድምታ
ያህዌ ፈጣሪያችን የመኖራችን ዋልታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 1
Saytay yeyebs fitu
Qelayat saykefetu
Semayna midr saynoru
Birhanat hulu sayberu

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 2
Korebtoch fitu sayqomu
Abeboch saylemelmu
Saymezezu mebarqt
Sayngwadedu birhanat

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 3
Negodgwad dimts’ sayset’u
Kewakbt sayfenet’qu
Kef bileh kefta
Bichahn neberk Geta

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 4
Yewenz gorfoch sayfesu
Nefasat gena saynefsu
Yewha minch’och sayfelu
Hunu saylachew beqalu

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 5
Demenaw gizef saysab
Saybej yemdrm kibeb
Mealtu gena saynor
Lelitm sayfet’er

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 6
Ch’elemaw saygared
Sat’nael saywared
Melaekt sayfet’eru
Yahwe neber bekbru

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 7
Kehulu yetesewerk
Bekbrh kekreh yenork
Mayderesbh t’lq
Matmeremer mit’uq

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 8
Korebtochn yemezenk
Wihochnm yeseferk
Hulun yemtmeremr
Girum neh matdefer

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 9
Bebahriyh kebreh
Bemsgana tekebeh
Yeneberk bezelalem
Yahwe endante yelem

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 10
Satdekm mitshekem
Satagodl mitset’ selam
Sattegna mitt’ebq
Satnet’f huluntawq

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 11
Befqr mitgeza nigus
Neq yelelebh Kidus
Hulun mitfews medhn
Yet’ebeqken bezemen

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 12
Mitasb satzenega
Mitset’ lehulu waga
Mittew satqebel
Amlak neh Geta liul

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 13
Yememekiyachn zewd
Yete zamedken zemed
Yedehnnetachn fana
Yemenorachn wastna

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 14
Yehywetachn meseret;
Yebetachn gullat;
Yemannetachn wibet
Lemenorachn dimqet

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta

VERSE 15
Alch’awn yat’afet’k
Ch’elemawn yasadedk
Alemun yaberah fana
Kef bel bemsgana

CHORUS
Ante aleh bekbr ante aleh bekefta
Ante aleh belelna yahwe yeegna Geta
Yahwe amlakachn yehywetachn andmta
Yahwe fet’ariyachn yemenorachn walta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'anite-aleh-bekibir', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Anite Yikir Belen (anite-yikir-belen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው

VERSE 1
ምነው አቤቱ ጌታ ፣ ይሻለው ነበር ባትፈጥረው
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ዘመኑ እንደ ጥላ ፣ ቶሎ ያልፋል

VERSE 2
ዳዊትም ተናግሯል ፣ አፈር ትል ንኝ ብሏል
አቤቱ ሰው ከንቱ ፣ ነገርን ይመስላል
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)

VERSE 3
ሰውስ ክቡር ነበር አላወቀምና
በሲና በርሃ የመገበው መና
ሊያድነው ቢመጣ ሰቀለው እንደብራና
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን

VERSE 4
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፫x)',
      lyrics_transliteration = 'Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)
Sews dekama new , kentu new
Zare yemnayew , nege afer new

VERSE 1
Minew abetu Geta , yishalew neber batfet’rew
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)
Zemenu ende t’la , tolo yalfal

VERSE 2
Dawitm tenagrwal , afer til nign bilwal
Abetu sew kentu , negern yimeslal
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)

VERSE 3
Sews kibur neber alaweqemna
Besina berha yemegebew mena
Liyadnew bimet’a seqelew endebrana
Egna sew mehon , ayqerm enbedlhalen

VERSE 4
Ende cherneth abetu , ante yiqr belen(3x)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'anite-yikir-belen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው

VERSE 1
ምነው አቤቱ ጌታ ፣ ይሻለው ነበር ባትፈጥረው
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ዘመኑ እንደ ጥላ ፣ ቶሎ ያልፋል

CHORUS
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው

VERSE 2
ዳዊትም ተናግሯል ፣ አፈር ትል ንኝ ብሏል
አቤቱ ሰው ከንቱ ፣ ነገርን ይመስላል
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)

CHORUS
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው

VERSE 3
ሰውስ ክቡር ነበር አላወቀምና
በሲና በርሃ የመገበው መና
ሊያድነው ቢመጣ ሰቀለው እንደብራና
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን

CHORUS
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው

VERSE 4
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፫x)

CHORUS
እኛ ሰው መሆን ፣ አይቀርም እንበድልሃለን
እንደ ቸርነትህ አቤቱ ፣ አንተ ይቅር በለን(፪x)
ሰውስ ደካማ ነው ፣ ከንቱ ነው
ዛሬ የምናየው ፣ ነገ አፈር ነው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)
Sews dekama new , kentu new
Zare yemnayew , nege afer new

VERSE 1
Minew abetu Geta , yishalew neber batfet’rew
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)
Zemenu ende t’la , tolo yalfal

CHORUS
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)
Sews dekama new , kentu new
Zare yemnayew , nege afer new

VERSE 2
Dawitm tenagrwal , afer til nign bilwal
Abetu sew kentu , negern yimeslal
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)

CHORUS
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)
Sews dekama new , kentu new
Zare yemnayew , nege afer new

VERSE 3
Sews kibur neber alaweqemna
Besina berha yemegebew mena
Liyadnew bimet’a seqelew endebrana
Egna sew mehon , ayqerm enbedlhalen

CHORUS
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)
Sews dekama new , kentu new
Zare yemnayew , nege afer new

VERSE 4
Ende cherneth abetu , ante yiqr belen(3x)

CHORUS
Egna sew mehon , ayqerm enbedlhalen
Ende cherneth abetu , ante yiqr belen(2x)
Sews dekama new , kentu new
Zare yemnayew , nege afer new'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'anite-yikir-belen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Aniten Felige Metahu (aniten-felige-metahu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ

VERSE 1
በሥጋ እና በነፍስ በስምህ ከበሩ
በቤትህ ተተክለው ለምልመው ጸደቁ
በትሩፋት በእምነት ለመንግሥትህ በቁ
እኔም የአንተ ባርያ ሽቼ ቅድስና

VERSE 2
በቤትኽ መጽደቅን እለምናለሁና
ዕንባ እና ጸሎቴን ቃሌን ተቀብለኽ
ከቤትኽ አታውጣኝ በበረከት ተክለኽ
ፍቅርህም ተገልጧል .ረቦ.. በቤቴ

VERSE 3
አንተን ስለ ያዘች ሠምራለች ሕይወቴ
እንደ ምትወደኝ ዛሬም አውቀዋለሁ
በረከት በእጄ ሞልቶ እያየሁ ነው
በቤትህ ውስጥ ካለው ታላቁን ድግስ

VERSE 4
ዕለት ዕለት በእምነት ኑሬ እንድቋደሥ
በሂሶጵም እርጨኝ እነጣማለሁ
እኔ እንደ በረዶ ሁኜ እቀርባለሁ',
      lyrics_transliteration = 'Anten felge met’ahu (3)
Kedejh atawt’agn yeene Geta
Anten felge met’ahu (2)
Kidusan bebeth befqr binoru

VERSE 1
Besga ena benefs besmh keberu
Bebeth teteklew lemlmew ts’edequ
Betrufat beemnet lemengsth bequ
Enem yeante barya shche qidsna

VERSE 2
Bebetኽ mets’deqn elemnalehuna
Enba ena ts’eloten qalen teqebleኽ
Kebetኽ atawt’agn bebereket tekleኽ
Fiqrhm tegelt’wal .rebo.. bebete

VERSE 3
Anten sile yazech semralech hiywete
Ende mitwedegn zarem awqewalehu
Bereket beeje molto eyayehu new
Bebeth wist’ kalew talaqun digs

VERSE 4
Elet elet beemnet nure endqwades
Behisop’m erch’egn enet’amalehu
Ene ende beredo hugne eqerbalehu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'aniten-felige-metahu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ

VERSE 1
በሥጋ እና በነፍስ በስምህ ከበሩ
በቤትህ ተተክለው ለምልመው ጸደቁ
በትሩፋት በእምነት ለመንግሥትህ በቁ
እኔም የአንተ ባርያ ሽቼ ቅድስና

CHORUS
አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ

VERSE 2
በቤትኽ መጽደቅን እለምናለሁና
ዕንባ እና ጸሎቴን ቃሌን ተቀብለኽ
ከቤትኽ አታውጣኝ በበረከት ተክለኽ
ፍቅርህም ተገልጧል .ረቦ.. በቤቴ

CHORUS
አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ

VERSE 3
አንተን ስለ ያዘች ሠምራለች ሕይወቴ
እንደ ምትወደኝ ዛሬም አውቀዋለሁ
በረከት በእጄ ሞልቶ እያየሁ ነው
በቤትህ ውስጥ ካለው ታላቁን ድግስ

CHORUS
አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ

VERSE 4
ዕለት ዕለት በእምነት ኑሬ እንድቋደሥ
በሂሶጵም እርጨኝ እነጣማለሁ
እኔ እንደ በረዶ ሁኜ እቀርባለሁ

CHORUS
አንተን ፈልጌ መጣሁ(3)
ከደጅህ አታውጣኝ የእኔ ጌታ
አንተን ፈልጌ መጣሁ/፪/
ቅዱሳን በቤትህ በፍቅር ቢኖሩ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anten felge met’ahu (3)
Kedejh atawt’agn yeene Geta
Anten felge met’ahu (2)
Kidusan bebeth befqr binoru

VERSE 1
Besga ena benefs besmh keberu
Bebeth teteklew lemlmew ts’edequ
Betrufat beemnet lemengsth bequ
Enem yeante barya shche qidsna

CHORUS
Anten felge met’ahu (3)
Kedejh atawt’agn yeene Geta
Anten felge met’ahu (2)
Kidusan bebeth befqr binoru

VERSE 2
Bebetኽ mets’deqn elemnalehuna
Enba ena ts’eloten qalen teqebleኽ
Kebetኽ atawt’agn bebereket tekleኽ
Fiqrhm tegelt’wal .rebo.. bebete

CHORUS
Anten felge met’ahu (3)
Kedejh atawt’agn yeene Geta
Anten felge met’ahu (2)
Kidusan bebeth befqr binoru

VERSE 3
Anten sile yazech semralech hiywete
Ende mitwedegn zarem awqewalehu
Bereket beeje molto eyayehu new
Bebeth wist’ kalew talaqun digs

CHORUS
Anten felge met’ahu (3)
Kedejh atawt’agn yeene Geta
Anten felge met’ahu (2)
Kidusan bebeth befqr binoru

VERSE 4
Elet elet beemnet nure endqwades
Behisop’m erch’egn enet’amalehu
Ene ende beredo hugne eqerbalehu

CHORUS
Anten felge met’ahu (3)
Kedejh atawt’agn yeene Geta
Anten felge met’ahu (2)
Kidusan bebeth befqr binoru'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'aniten-felige-metahu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: ANTE BICHA (ante-bicha)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 1
አልጠግብ እኔ አይሆንህ ካሣ
እስከሽበት ስምህን ባነሣ

VERSE 2
ያስተማርከኝ የውድህ ፊዴል
የተከልከው በልቤ ወለል
እያነቃኝ አመልክሃለሁ
ካንተ ወዲያ ማንን አውቃለሁ

VERSE 3
ሰውነቴ ከግፍ ቢጸዳ
ኅሊናዬ አንተን ቢረዳ
ተጠየፈ የሰውን ምርኩዝ
ስታበራ በልቤ መቅረዝ

VERSE 4
ከእንቅብ በታች በእጅህ ተነሳሁ
በተራራው እግሬን አጸናሁ
መገዛቴ ለፍቅርህ ቀንበር
ሰው አረገኝ አንስቶ ከአፈር

VERSE 5
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የኔፍሴ መጽናኛ
ተመስገን እግዚአብሔር የነፍሴ መጽናኛ',
      lyrics_transliteration = 'Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Silefqrh qome baneba
Bafeslh yeqne meba

VERSE 1
Alt’egb ene ayhonh kasa
Eskeshbet simhn banesa

VERSE 2
Yastemarkegn yewdh fidel
Yetekelkew belbe welel
Eyaneqagn amelkhalehu
Kante wediya mann awqalehu

VERSE 3
Sewnete kegf bits’eda
Hilinaye anten bireda
Tet’eyefe yesewn mirkuz
Sitabera belbe meqrez

VERSE 4
Keenqb betach beejh tenesahu
Beteraraw egren ats’enahu
Megezate lefqrh qenber
Sew aregegn ansto keafer

VERSE 5
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Temesgen Egziabher yenefse mets’nagna',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ante-bicha'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 1
አልጠግብ እኔ አይሆንህ ካሣ
እስከሽበት ስምህን ባነሣ

CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 2
ያስተማርከኝ የውድህ ፊዴል
የተከልከው በልቤ ወለል
እያነቃኝ አመልክሃለሁ
ካንተ ወዲያ ማንን አውቃለሁ

CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 3
ሰውነቴ ከግፍ ቢጸዳ
ኅሊናዬ አንተን ቢረዳ
ተጠየፈ የሰውን ምርኩዝ
ስታበራ በልቤ መቅረዝ

CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 4
ከእንቅብ በታች በእጅህ ተነሳሁ
በተራራው እግሬን አጸናሁ
መገዛቴ ለፍቅርህ ቀንበር
ሰው አረገኝ አንስቶ ከአፈር

CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 5
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የኔፍሴ መጽናኛ
ተመስገን እግዚአብሔር የነፍሴ መጽናኛ

CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Silefqrh qome baneba
Bafeslh yeqne meba

VERSE 1
Alt’egb ene ayhonh kasa
Eskeshbet simhn banesa

CHORUS
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Silefqrh qome baneba
Bafeslh yeqne meba

VERSE 2
Yastemarkegn yewdh fidel
Yetekelkew belbe welel
Eyaneqagn amelkhalehu
Kante wediya mann awqalehu

CHORUS
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Silefqrh qome baneba
Bafeslh yeqne meba

VERSE 3
Sewnete kegf bits’eda
Hilinaye anten bireda
Tet’eyefe yesewn mirkuz
Sitabera belbe meqrez

CHORUS
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Silefqrh qome baneba
Bafeslh yeqne meba

VERSE 4
Keenqb betach beejh tenesahu
Beteraraw egren ats’enahu
Megezate lefqrh qenber
Sew aregegn ansto keafer

CHORUS
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Silefqrh qome baneba
Bafeslh yeqne meba

VERSE 5
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Temesgen Egziabher yenefse mets’nagna

CHORUS
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Silefqrh qome baneba
Bafeslh yeqne meba'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ante-bicha', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ante Bicha Nigus Orthodox Tewahido mezmur godolyas (ante-bicha-nigus-orthodox-tewahido-mezmur-godolyas)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 1
አልጠግብ እኔ አይሆንህ ካሳ
እስከ ሽበት ስምክን ባነሳ
አልጠግብ እኔ አይሆንም ካሳ
እድሜ ልኬን ባነሳ

VERSE 2
ያስተማርከኝ የውጤት ፊደል
የተከልከው በልቤ ወደብ
እያነቃኝ አመልክክሀለሁ
ካንተ ወድያ ማንን አውቃለሁ( 2)

VERSE 3
ሰውነቴ ከግፍ ቢፀዳ
ህለናየ አተን ቢረዳ
ተፀየፈ የሰውን ምርኩዝ
ስታበራ በልቤ መቅረዝ {2}

VERSE 4
ከእንቅብ በታች መቸ ተነሳሁ
በተራራ እግሬን አፀናሁ
መገዛቴ ለፍቅርህ ቀንበር
ሰው አረገኝ አስቶ ከአፈር{2

VERSE 5
}',
      lyrics_transliteration = 'Ante bicha nigus ante bicha dagna (2)
Temesgen eyesus yenefse mets’nagna
Silefqrh qume baneba
Bafeslh yeqne meba

VERSE 1
Alt’egb ene ayhonh kasa
Eske shbet simkn banesa
Alt’egb ene ayhonm kasa
Edme liken banesa

VERSE 2
Yastemarkegn yewt’et fidel
Yetekelkew belbe wedeb
Eyaneqagn amelkkhelehu
Kante wedya mann awqalehu (2)

VERSE 3
Sewnete kegf bits’eda
Hilenaye aten bireda
Tets’eyefe yesewn mirkuz
Sitabera belbe meqrez {2}

VERSE 4
Keenqb betach meche tenesahu
Beterara egren ats’enahu
Megezate lefqrh qenber
Sew aregegn asto keafer{2

VERSE 5
}',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ante-bicha-nigus-orthodox-tewahido-mezmur-godolyas'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 1
አልጠግብ እኔ አይሆንህ ካሳ
እስከ ሽበት ስምክን ባነሳ
አልጠግብ እኔ አይሆንም ካሳ
እድሜ ልኬን ባነሳ

CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 2
ያስተማርከኝ የውጤት ፊደል
የተከልከው በልቤ ወደብ
እያነቃኝ አመልክክሀለሁ
ካንተ ወድያ ማንን አውቃለሁ( 2)

CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 3
ሰውነቴ ከግፍ ቢፀዳ
ህለናየ አተን ቢረዳ
ተፀየፈ የሰውን ምርኩዝ
ስታበራ በልቤ መቅረዝ {2}

CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 4
ከእንቅብ በታች መቸ ተነሳሁ
በተራራ እግሬን አፀናሁ
መገዛቴ ለፍቅርህ ቀንበር
ሰው አረገኝ አስቶ ከአፈር{2

CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 5
}

CHORUS
አንተ ብቻ ንጉስ አንተ ብቻ ዳኛ( 2)
ተመስገን እየሱስ የነፍሴ መፅናኛ
ስለፍቅርህ ቁሜ ባነባ
ባፈስልህ የቅኔ መባ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ante bicha nigus ante bicha dagna (2)
Temesgen eyesus yenefse mets’nagna
Silefqrh qume baneba
Bafeslh yeqne meba

VERSE 1
Alt’egb ene ayhonh kasa
Eske shbet simkn banesa
Alt’egb ene ayhonm kasa
Edme liken banesa

CHORUS
Ante bicha nigus ante bicha dagna (2)
Temesgen eyesus yenefse mets’nagna
Silefqrh qume baneba
Bafeslh yeqne meba

VERSE 2
Yastemarkegn yewt’et fidel
Yetekelkew belbe wedeb
Eyaneqagn amelkkhelehu
Kante wedya mann awqalehu (2)

CHORUS
Ante bicha nigus ante bicha dagna (2)
Temesgen eyesus yenefse mets’nagna
Silefqrh qume baneba
Bafeslh yeqne meba

VERSE 3
Sewnete kegf bits’eda
Hilenaye aten bireda
Tets’eyefe yesewn mirkuz
Sitabera belbe meqrez {2}

CHORUS
Ante bicha nigus ante bicha dagna (2)
Temesgen eyesus yenefse mets’nagna
Silefqrh qume baneba
Bafeslh yeqne meba

VERSE 4
Keenqb betach meche tenesahu
Beterara egren ats’enahu
Megezate lefqrh qenber
Sew aregegn asto keafer{2

CHORUS
Ante bicha nigus ante bicha dagna (2)
Temesgen eyesus yenefse mets’nagna
Silefqrh qume baneba
Bafeslh yeqne meba

VERSE 5
}

CHORUS
Ante bicha nigus ante bicha dagna (2)
Temesgen eyesus yenefse mets’nagna
Silefqrh qume baneba
Bafeslh yeqne meba'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ante-bicha-nigus-orthodox-tewahido-mezmur-godolyas', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ante Degu Samrawi (ante-degu-samrawi)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 1
አንድ ሌዋዊ ሰው በዚያ መንገድ መጣ
አንሳኝ ብሎ ጮህች ልቤ ሃዘን ተውጣ
ወደኔ ሲጠጋ ኮቴውን ሰምቼ
አንሳኝ ብዬ ማለድኩ እጆቼን አንስቼ

VERSE 2
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 3
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 4
አንተ ደጉ ሳምራዊ እለፍ በመንገዴ
በኢያሪኮ ላይ ጥሎኛል ወንበዴ (፪×)
ነፍሴ ወደ ፅኑ ሞት ተቃርባለችና
የአለም መድኃኒት ኢየሱስ ቶሎና ክርስቶስ ቶሎና

VERSE 5
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 6
በሞትና ሕይወት መካከል ወደቅኩኝ
የሚያነሳኝ አጣሁ በብርቱ ቃተትኩኝ
ሰማሁኝ ከርቀት የአንድ ካህን ኮቴ
ያነሳኛል የሚል ነበረ ምኞቴ

VERSE 7
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 8
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 9
አንድ ሌዋዊ ሰው በዚያ መንገድ መጣ
አንሳኝ ብሎ ጮህች ልቤ ሃዘን ተውጣ
ወደኔ ሲጠጋ ኮቴውን ሰምቼ
አንሳኝ ብዬ ማለድኩ እጆቼን አንስቼ

VERSE 10
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 11
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 12
አንድ ሳምራዊ ግን አየኝ ቀረበና
ከአህያው ወረደ በፍቅር በትህትና
ቁስሌንም ጠረገ በአህያው ላይ ጫነኝ
አነሳኝ ደግፎ በዘይቱ አጠበኝ

VERSE 13
ሁለት ዲናር ከፍሎ ለእንግዶች ጠባቂ
ጌታዬ ታደጋት ነፍሴን ከነጣቂ

VERSE 14
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 15
አንተ ደጉ ሳምራዊ እለፍ በመንገዴ
በኢያሪኮ ላይ ጥሎኛል ወንበዴ (፪×)
ነፍሴ ወደ ፅኑ ሞት ተቃርባለችና
የአለም መድኃኒት ኢየሱስ ቶሎና ክርስቶስ ቶሎና

VERSE 16
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ',
      lyrics_transliteration = 'ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 1
end lewawi sew beziya menged meta
ensany blo chohch lbe hazen tewta
wedene sitega kotewn semche
ensany bye maledku jochen ensche

VERSE 2
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez
ente degu samrawisanyal yemil nebere mnyote

VERSE 3
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 4
ente degu samrawi lef bemengede
beiyariko lay tlonyal wenbede (×)
nefse wede tsnu mot teqarbalechna
yeelem medhanit iyesus tolona krstos tolona

VERSE 5
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 6
bemotna hywet mekakel wedeqkuny
yemiyanesany etahu bebrtu qatetkuny
semahuny kerqet yeend kahn kote

VERSE 7
yanesanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 8
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 9
end lewawi sew beziya menged meta
ensany blo chohch lbe hazen tewta
wedene sitega kotewn semche
ensany bye maledku jochen ensche

VERSE 10
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ente degu samrawisanyal yemil nebere mnyote

VERSE 11
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez
ez

VERSE 12
end samrawi gn eyeny qerebena
keehyaw werede befqr bethtna
quslenm terege beehyaw lay chaneny
enesany degfo bezeytu etebeny

VERSE 13
hulet dinar keflo lengdoch tebaqi
getaye tadegat nefsen kenetaqi
ente degu samrawisanyal yemil nebere mnyote

VERSE 14
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez
ente degu samrawi lef bemengede

VERSE 15
beiyariko lay tlonyal wenbede (×)
nefse wede tsnu mot teqarbalechna
yeelem medhanit iyesus tolona krstos tolona
ente degu samrawisanyal yemil nebere mnyote

VERSE 16
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ante-degu-samrawi'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 1
አንድ ሌዋዊ ሰው በዚያ መንገድ መጣ
አንሳኝ ብሎ ጮህች ልቤ ሃዘን ተውጣ
ወደኔ ሲጠጋ ኮቴውን ሰምቼ
አንሳኝ ብዬ ማለድኩ እጆቼን አንስቼ

CHORUS
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 2
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

CHORUS
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 3
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

CHORUS
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 4
አንተ ደጉ ሳምራዊ እለፍ በመንገዴ
በኢያሪኮ ላይ ጥሎኛል ወንበዴ (፪×)
ነፍሴ ወደ ፅኑ ሞት ተቃርባለችና
የአለም መድኃኒት ኢየሱስ ቶሎና ክርስቶስ ቶሎና

CHORUS
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 5
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

CHORUS
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 6
በሞትና ሕይወት መካከል ወደቅኩኝ
የሚያነሳኝ አጣሁ በብርቱ ቃተትኩኝ
ሰማሁኝ ከርቀት የአንድ ካህን ኮቴ
ያነሳኛል የሚል ነበረ ምኞቴ

CHORUS
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 7
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

CHORUS
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 8
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

CHORUS
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 9
አንድ ሌዋዊ ሰው በዚያ መንገድ መጣ
አንሳኝ ብሎ ጮህች ልቤ ሃዘን ተውጣ
ወደኔ ሲጠጋ ኮቴውን ሰምቼ
አንሳኝ ብዬ ማለድኩ እጆቼን አንስቼ

CHORUS
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 10
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

CHORUS
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 11
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

CHORUS
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 12
አንድ ሳምራዊ ግን አየኝ ቀረበና
ከአህያው ወረደ በፍቅር በትህትና
ቁስሌንም ጠረገ በአህያው ላይ ጫነኝ
አነሳኝ ደግፎ በዘይቱ አጠበኝ

CHORUS
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 13
ሁለት ዲናር ከፍሎ ለእንግዶች ጠባቂ
ጌታዬ ታደጋት ነፍሴን ከነጣቂ

CHORUS
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 14
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

CHORUS
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 15
አንተ ደጉ ሳምራዊ እለፍ በመንገዴ
በኢያሪኮ ላይ ጥሎኛል ወንበዴ (፪×)
ነፍሴ ወደ ፅኑ ሞት ተቃርባለችና
የአለም መድኃኒት ኢየሱስ ቶሎና ክርስቶስ ቶሎና

CHORUS
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

VERSE 16
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ

CHORUS
አንተ ደጉ ሳምራዊሳኛል የሚል ነበረ ምኞቴ
ፈቀቅ ብሎ ሄደ በሞት መኻል ሆኜ
ነፍሴ ብላ ነበር መጣልኝ አዳነኜ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 1
end lewawi sew beziya menged meta
ensany blo chohch lbe hazen tewta
wedene sitega kotewn semche
ensany bye maledku jochen ensche

CHORUS
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 2
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez
ente degu samrawisanyal yemil nebere mnyote

CHORUS
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 3
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

CHORUS
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 4
ente degu samrawi lef bemengede
beiyariko lay tlonyal wenbede (×)
nefse wede tsnu mot teqarbalechna
yeelem medhanit iyesus tolona krstos tolona

CHORUS
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 5
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

CHORUS
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 6
bemotna hywet mekakel wedeqkuny
yemiyanesany etahu bebrtu qatetkuny
semahuny kerqet yeend kahn kote

CHORUS
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 7
yanesanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

CHORUS
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 8
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

CHORUS
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 9
end lewawi sew beziya menged meta
ensany blo chohch lbe hazen tewta
wedene sitega kotewn semche
ensany bye maledku jochen ensche

CHORUS
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 10
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ente degu samrawisanyal yemil nebere mnyote

CHORUS
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 11
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez
ez

CHORUS
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 12
end samrawi gn eyeny qerebena
keehyaw werede befqr bethtna
quslenm terege beehyaw lay chaneny
enesany degfo bezeytu etebeny

CHORUS
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 13
hulet dinar keflo lengdoch tebaqi
getaye tadegat nefsen kenetaqi
ente degu samrawisanyal yemil nebere mnyote

CHORUS
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 14
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez
ente degu samrawi lef bemengede

CHORUS
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 15
beiyariko lay tlonyal wenbede (×)
nefse wede tsnu mot teqarbalechna
yeelem medhanit iyesus tolona krstos tolona
ente degu samrawisanyal yemil nebere mnyote

CHORUS
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

VERSE 16
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez

CHORUS
ente degu samrawisanyal yemil nebere mnyote
feqeq blo hede bemot mehal honye
nefse bla neber metalny edanenye
ez'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ante-degu-samrawi', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ante Yalkew Yihun Fasika Mekonen (ante-yalkew-yihun-fasika-mekonen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)

VERSE 1
ከአባትም በላይ አባት ነህ አንተ
ይሙት ይጥፋ አትል ለተሳሳተ
እድሜ የምትጨምር ለንስሐ ግብር
ሁሌም ርህሩህ ነህ ዘላለም ፍቅር

VERSE 2
የጠፋው ልጅህን በብዙ ታገስከኝ
ጆሮህ እንደሰማ መቼ ፈርድክብኝ
ድርሻዬን ወስጄ እጅግ አሳዝኜህ
በፍቅር ተቀበልከኝ እጅህን ዘርግተህ

VERSE 3
ባትጠባበቀኝ ባትሆን ከኔ ጋራ
ይስቅብኝ ነበር ጠላት ባለጋራ
እየተንከባከብክ እንደ አይን ብሌን
በትላንትና ላይ ጨመርክለኝ ዛሬን

VERSE 4
ሰው ምን ያስተውላል አንተ ነህ አዋቂ
መልካም እረኛዬ ሳትተኛ ጠባቂ
አንዲት በግ ፍለጋ መከራ ተቀብልክ
ደምህን አፈሰስክ ሥጋህንም ቆረስክ',
      lyrics_transliteration = 'Andachm alawqm ene silerase
Ante neh awaqiw lesgam lenefse
Ante yalkew yihun beqeriw edmeye
Feqadh yidereg yifets’em Getaye (2)

VERSE 1
Keabatm belay abat neh ante
Yimut yit’fa atl letesasate
Edme yemtch’emr lenshe gibr
Hulem rihruh neh zelalem fiqr

VERSE 2
Yet’efaw lijhn bebzu tageskegn
Joroh endesema meche ferdkbgn
Dirshayen wesje ejg asazgneh
Befqr teqebelkegn ejhn zergteh

VERSE 3
Batt’ebabeqegn bathon kene gara
Yisqbgn neber t’elat balegara
Eyetenkebakebk ende ayn bilen
Betlantna lay ch’emerklegn zaren

VERSE 4
Sew min yastewlal ante neh awaqi
Melkam eregnaye sattegna t’ebaqi
Andit beg filega mekera teqeblk
Demhn afesesk sigahnm qoresk',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ante-yalkew-yihun-fasika-mekonen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)

VERSE 1
ከአባትም በላይ አባት ነህ አንተ
ይሙት ይጥፋ አትል ለተሳሳተ
እድሜ የምትጨምር ለንስሐ ግብር
ሁሌም ርህሩህ ነህ ዘላለም ፍቅር

CHORUS
አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)

VERSE 2
የጠፋው ልጅህን በብዙ ታገስከኝ
ጆሮህ እንደሰማ መቼ ፈርድክብኝ
ድርሻዬን ወስጄ እጅግ አሳዝኜህ
በፍቅር ተቀበልከኝ እጅህን ዘርግተህ

CHORUS
አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)

VERSE 3
ባትጠባበቀኝ ባትሆን ከኔ ጋራ
ይስቅብኝ ነበር ጠላት ባለጋራ
እየተንከባከብክ እንደ አይን ብሌን
በትላንትና ላይ ጨመርክለኝ ዛሬን

CHORUS
አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)

VERSE 4
ሰው ምን ያስተውላል አንተ ነህ አዋቂ
መልካም እረኛዬ ሳትተኛ ጠባቂ
አንዲት በግ ፍለጋ መከራ ተቀብልክ
ደምህን አፈሰስክ ሥጋህንም ቆረስክ

CHORUS
አንዳችም አላውቅም እኔ ስለራሴ
አንተ ነህ አዋቂው ለስጋም ለነፍሴ
አንተ ያልከው ይሁን በቀሪው እድሜዬ
ፈቃድህ ይደረግ ይፈጸም ጌታዬ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Andachm alawqm ene silerase
Ante neh awaqiw lesgam lenefse
Ante yalkew yihun beqeriw edmeye
Feqadh yidereg yifets’em Getaye (2)

VERSE 1
Keabatm belay abat neh ante
Yimut yit’fa atl letesasate
Edme yemtch’emr lenshe gibr
Hulem rihruh neh zelalem fiqr

CHORUS
Andachm alawqm ene silerase
Ante neh awaqiw lesgam lenefse
Ante yalkew yihun beqeriw edmeye
Feqadh yidereg yifets’em Getaye (2)

VERSE 2
Yet’efaw lijhn bebzu tageskegn
Joroh endesema meche ferdkbgn
Dirshayen wesje ejg asazgneh
Befqr teqebelkegn ejhn zergteh

CHORUS
Andachm alawqm ene silerase
Ante neh awaqiw lesgam lenefse
Ante yalkew yihun beqeriw edmeye
Feqadh yidereg yifets’em Getaye (2)

VERSE 3
Batt’ebabeqegn bathon kene gara
Yisqbgn neber t’elat balegara
Eyetenkebakebk ende ayn bilen
Betlantna lay ch’emerklegn zaren

CHORUS
Andachm alawqm ene silerase
Ante neh awaqiw lesgam lenefse
Ante yalkew yihun beqeriw edmeye
Feqadh yidereg yifets’em Getaye (2)

VERSE 4
Sew min yastewlal ante neh awaqi
Melkam eregnaye sattegna t’ebaqi
Andit beg filega mekera teqeblk
Demhn afesesk sigahnm qoresk

CHORUS
Andachm alawqm ene silerase
Ante neh awaqiw lesgam lenefse
Ante yalkew yihun beqeriw edmeye
Feqadh yidereg yifets’em Getaye (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ante-yalkew-yihun-fasika-mekonen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Anurognal Cherneteh (anurognal-cherneteh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 1
ያቺ ፈዋሽ አዳኝ እጅህ ዛሬም ለኔ ተዘርግታ
በሀጥያት ርቄ እንዳልጓዝ አስረኸኛል በውለታ
ደግሞስ ህይወት ምርጫ ቢሆን ካንተ ወደማን ይኬዳል
አባቴ ፍቅርህኮ ጌታዬ ፍቅርኮ አለምን ያስቀናል

VERSE 2
ሞቼ ነበር ተቀብሬ ጌታ ወደኔ ባትመጣ
አንተ ሞቴን ባትሞትልኝ ወዴት ነበር የኔ እጣ
ከንቱ ነበር ማንነቴ አሸናፊ ለዚች አለም
ግን አንተ የያዝከው ይኖራል ዘላለም

VERSE 3
መቅደስህን ተጠግቼ አይቻለሁ ብዙ ነገር
በልቤ ውስጥ ያስቀመጥኩት እንዲህ ለሰው ማይነገር
ግን የሆነ ሁሉ ሆኖ የለም ዛሬ ያላረፈ
የመከራው እሳት የፈተናው እሳት ባንተ እየታለፈ

VERSE 4
አይጠፋኝም ያ ፈገግታ ልጄ ብለህ ያሳደከኝ
አመጸኛ መጥፎ ሆኜ በትከሻህ ላይ ያኖርከኝ
እዲም አይነት ወዳጅ አለ እየጠሉት የሚያፈቅር
ስሙም ኢየሱስ ነው (2) የጽድቃችን ሚስጢር

VERSE 5
መቸኮሌ መጣደፌ አምላኬ ሆይ በከንቱ ነዉ
መፈጸሙ ላይቀር (2) ጌታዬ አንተ ያልከዉ',
      lyrics_transliteration = 'Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 1
Yachi fewash adaghe ijh zarem lene tezergta
Behatiyat reqe endalguaz asregheghal bewelleta
Degmos hiywot mircha bihon kante wede man yikedal
Abate fiqrehko Getaye fiqrehko alemn yaskenal

VERSE 2
Moche neber teqebre Geta wedeñe batemetta
Ante moten batemotleñ wedet neber yeñe eta
Kentu neber manenneté ashenafi lezich alem
Gin ante yeyazkew yinoral zelalem

VERSE 3
Meqdesehen tetegiche aychalehu bezu neger
Belibe wist yaskemetkewt endih lesew mayineger
Gin yehone hulu hono yelem zare yalarefe
Yemekeraw esat yefetenaw esat bante iyetalefe

VERSE 4
Aytefagnim ya fegegta lije bileh yasadegegh
Ametsegha metfo hoghe betekeshah lay yanorkeghe
Endim aynet wedaj ale iyetelut yemiyafeqir
Simu Iyesus new (2) yetsidqachin mistir

VERSE 5
Mechekole metadefe Amlake hoy bekentu new
Mefetsemu layiqer (2) Getaye ante yalkew',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'anurognal-cherneteh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 1
ያቺ ፈዋሽ አዳኝ እጅህ ዛሬም ለኔ ተዘርግታ
በሀጥያት ርቄ እንዳልጓዝ አስረኸኛል በውለታ
ደግሞስ ህይወት ምርጫ ቢሆን ካንተ ወደማን ይኬዳል
አባቴ ፍቅርህኮ ጌታዬ ፍቅርኮ አለምን ያስቀናል

CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 2
ሞቼ ነበር ተቀብሬ ጌታ ወደኔ ባትመጣ
አንተ ሞቴን ባትሞትልኝ ወዴት ነበር የኔ እጣ
ከንቱ ነበር ማንነቴ አሸናፊ ለዚች አለም
ግን አንተ የያዝከው ይኖራል ዘላለም

CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 3
መቅደስህን ተጠግቼ አይቻለሁ ብዙ ነገር
በልቤ ውስጥ ያስቀመጥኩት እንዲህ ለሰው ማይነገር
ግን የሆነ ሁሉ ሆኖ የለም ዛሬ ያላረፈ
የመከራው እሳት የፈተናው እሳት ባንተ እየታለፈ

CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 4
አይጠፋኝም ያ ፈገግታ ልጄ ብለህ ያሳደከኝ
አመጸኛ መጥፎ ሆኜ በትከሻህ ላይ ያኖርከኝ
እዲም አይነት ወዳጅ አለ እየጠሉት የሚያፈቅር
ስሙም ኢየሱስ ነው (2) የጽድቃችን ሚስጢር

CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)

VERSE 5
መቸኮሌ መጣደፌ አምላኬ ሆይ በከንቱ ነዉ
መፈጸሙ ላይቀር (2) ጌታዬ አንተ ያልከዉ

CHORUS
አኑሮኛል ቸርነትህ ልክ የሌለው ደግነትህ
እንዳንተ አይነት የት ይገኛል
ሁሉም ነገር ትዝ ይለኛል (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 1
Yachi fewash adaghe ijh zarem lene tezergta
Behatiyat reqe endalguaz asregheghal bewelleta
Degmos hiywot mircha bihon kante wede man yikedal
Abate fiqrehko Getaye fiqrehko alemn yaskenal

CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 2
Moche neber teqebre Geta wedeñe batemetta
Ante moten batemotleñ wedet neber yeñe eta
Kentu neber manenneté ashenafi lezich alem
Gin ante yeyazkew yinoral zelalem

CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 3
Meqdesehen tetegiche aychalehu bezu neger
Belibe wist yaskemetkewt endih lesew mayineger
Gin yehone hulu hono yelem zare yalarefe
Yemekeraw esat yefetenaw esat bante iyetalefe

CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 4
Aytefagnim ya fegegta lije bileh yasadegegh
Ametsegha metfo hoghe betekeshah lay yanorkeghe
Endim aynet wedaj ale iyetelut yemiyafeqir
Simu Iyesus new (2) yetsidqachin mistir

CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)

VERSE 5
Mechekole metadefe Amlake hoy bekentu new
Mefetsemu layiqer (2) Getaye ante yalkew

CHORUS
Anurognal cherneteh lik yelew degeteh
Endante aynet ket yigegnal
Hulum neger tiz yileghal (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'anurognal-cherneteh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Aplfana Omega (aplfana-omega)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 1
ጽድቅን ስለሰራህ በወንጀል ከሰሱህ
ላዳም ቤዛ ብለህ ብዙ ተንገላታህ
አልፋና ዖሜጋ‥
ቅዱሳን እጆችህ የፊጥኝ ታስረው

VERSE 2
እንደበግ ተጎተትክ ብትምራቸው
የትም ቦታ ያለህ ሁሉን የምታውቅ
ፊትህን ሸፈኑት ለመመጻደቅ
አልፋና ዖሜጋ……

VERSE 3
በዓውደ ምኩናን ከጲላጦስ ዘንድ
አሳልፈው ሰጡህ አጋልጠው ለፍርድ
ከሃና ቀያፋ ከካህናቱ ደጅ
ከነሄሮድስ ዘንድ አቀረቡህ ባዋጅ

VERSE 4
አልፋና ዖሜጋ…….
ግርፋት ሕማሙ አልበቃ ብሎህ
በመስቀል ላይ ልትውል ተፈረደብህ
ሳዶርና አላዶር ዳናትና ዴራ

VERSE 5
ተፈልገው መጡ ለችንካር በተራ
አልፋና ዖሜጋ……..
የሰላም ባለቤት ደረትህ ተወጋ
ሊያያዝ በችንካር እጅህ ተዘረጋ

VERSE 6
ግፈኞች አይሁዶች ባንተ ላይ ቀለዱ
ምራቅን ተፉብህ እራስክን ሊጎዱ
አልፋና ዖሜጋ……………',
      lyrics_transliteration = 'Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh

VERSE 1
Ts’dqn sileserah bewenjel kesesuh
Ladam beza bileh bizu tengelatah
Alfana omega‥
Kidusan ejochh yefit’gn tasrew

VERSE 2
Endebeg tegotetk bitmrachew
Yetm bota yaleh hulun yemtawq
Fithn shefenut lememets’adeq
Alfana omega……

VERSE 3
Beawde mikunan kep’ilat’os zend
Asalfew set’uh agalt’ew lefrd
Kehana qeyafa kekahnatu dej
Keneherods zend aqerebuh bawaj

VERSE 4
Alfana omega…….
Girfat himamu albeqa biloh
Bemesqel lay litwl teferedebh
Sadorna alador danatna dera

VERSE 5
Tefelgew met’u lechnkar betera
Alfana omega……..
Yeselam balebet dereth tewega
Liyayaz bechnkar ejh tezerega

VERSE 6
Gifegnoch ayhudoch bante lay qeledu
Miraqn tefubh eraskn ligodu
Alfana omega……………',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'aplfana-omega'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 1
ጽድቅን ስለሰራህ በወንጀል ከሰሱህ
ላዳም ቤዛ ብለህ ብዙ ተንገላታህ
አልፋና ዖሜጋ‥
ቅዱሳን እጆችህ የፊጥኝ ታስረው

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 2
እንደበግ ተጎተትክ ብትምራቸው
የትም ቦታ ያለህ ሁሉን የምታውቅ
ፊትህን ሸፈኑት ለመመጻደቅ
አልፋና ዖሜጋ……

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 3
በዓውደ ምኩናን ከጲላጦስ ዘንድ
አሳልፈው ሰጡህ አጋልጠው ለፍርድ
ከሃና ቀያፋ ከካህናቱ ደጅ
ከነሄሮድስ ዘንድ አቀረቡህ ባዋጅ

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 4
አልፋና ዖሜጋ…….
ግርፋት ሕማሙ አልበቃ ብሎህ
በመስቀል ላይ ልትውል ተፈረደብህ
ሳዶርና አላዶር ዳናትና ዴራ

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 5
ተፈልገው መጡ ለችንካር በተራ
አልፋና ዖሜጋ……..
የሰላም ባለቤት ደረትህ ተወጋ
ሊያያዝ በችንካር እጅህ ተዘረጋ

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ

VERSE 6
ግፈኞች አይሁዶች ባንተ ላይ ቀለዱ
ምራቅን ተፉብህ እራስክን ሊጎዱ
አልፋና ዖሜጋ……………

CHORUS
አልፋና ዖሜጋ ፈጣሪ የሆንክ
በከሃዲዎች እጅ ተይዘህ ቀረብክ
ተገፋህ ተደፋህ በጥፊ ተመታህ
እየደበደቡህ ክርስቶስ ሆይ አሉህ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh

VERSE 1
Ts’dqn sileserah bewenjel kesesuh
Ladam beza bileh bizu tengelatah
Alfana omega‥
Kidusan ejochh yefit’gn tasrew

CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh

VERSE 2
Endebeg tegotetk bitmrachew
Yetm bota yaleh hulun yemtawq
Fithn shefenut lememets’adeq
Alfana omega……

CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh

VERSE 3
Beawde mikunan kep’ilat’os zend
Asalfew set’uh agalt’ew lefrd
Kehana qeyafa kekahnatu dej
Keneherods zend aqerebuh bawaj

CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh

VERSE 4
Alfana omega…….
Girfat himamu albeqa biloh
Bemesqel lay litwl teferedebh
Sadorna alador danatna dera

CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh

VERSE 5
Tefelgew met’u lechnkar betera
Alfana omega……..
Yeselam balebet dereth tewega
Liyayaz bechnkar ejh tezerega

CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh

VERSE 6
Gifegnoch ayhudoch bante lay qeledu
Miraqn tefubh eraskn ligodu
Alfana omega……………

CHORUS
Alfana omega fet’ari yehonk
Bekehadiwoch ej teyzeh qerebk
Tegefah tedefah bet’fi temetah
Eyedebedebuh Kristos hoy aluh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'aplfana-omega', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Aresat Itiyopiyan (aresat-itiyopiyan)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 1
ኦርፈና ሰባይ
ወል እግዚአብሔር ሰው ነው ተወዳጅ በስለማ
በጥቃደባ ፈውስና ሰሎቱ ቃሉ የተሰማ
ወዬን የሰበከር ከተማ የትሳውቅ የደብረ አስቦቱ

VERSE 2
ለወንጌል ተዋጋሽ ንጽህ ወቱ
አረሳት ኢትዮጵያ በርፈን ላይ ማኖኪውን
የእግዚአብሔር ሰው ነህ ተወዳ ስማ የምርም
በጥቃደባ ፋናው እስከዛሬ ዛሬ ሲያራ የኖረው

VERSE 3
የትሰው አባው ለእግዚ ሃሪያ ማህፀሩ ወለድሽ ቆብን ሲኦን የሚያውቅ
አረሳ ኢትዮጵያ በእርፈ መስገድ አባይ ማኖኪ ወንጌል
የእግዚአብሔር ሰው ተውዳጁ ስሟ
ታርባ ምድጋባሎስ እስካሁን ስሙ ሲጠራበት ሲረገ ይኖራል ሰንሰለት

VERSE 4
አዲስ አዋርያ የኢትዮጵያ ደጋና ቁላውን በምስል
ባረካ ኢትዮጵያ በእውር መስቀድማኖስ
ይሁን የእግዚአብሔር ሰው ነህ ተወዳጅ
ስሟባ ምቹና ፋፏቴው ትራራው ቅዱስ ነው

VERSE 5
የአባዳችን መስቀል ጸሎት ስለነካው
የተራመደበት የዳሰሰው ሁሉ ድው ይፈውሳል ሳርና ቅጠሉ
አረሳት ኢትዮጵያ ኢትዮጵያ በእርፈ መስገል አባት ትግላ ሰባኪ ወንጌል
የእግዚአብሔር ሰው ነው ተወዳጅ ስማ

VERSE 6
የተማደ በድባረሳ
ኢትዮጵያ በእርፈ መስገል አባትህ ላይኖል
የእግዚአብሔር ሰው ነው ተወዳጅ ስማ
የትምደቅህባይ የትረምድ በጽድቅባይ የትር ማምድ በድቅ ሄደባ',
      lyrics_transliteration = 'Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are

VERSE 1
Orfena sebay
Wel Egziabher sew new tewedaj beslema
Bet’qadeba fewsna selotu qalu yetesema
Weyen yesebeker ketema yetsawq yedebre asbotu

VERSE 2
Lewengel tewagash nits’h wetu
Aresat ityop’ya berfen lay manokiwn
YeEgziabher sew neh teweda sima yemrm
Bet’qadeba fanaw eskezare zare siyara yenorew

VERSE 3
Yetsew abaw leegzi hariya mahts’eru weledsh qobn sion yemiyawq
Aresa ityop’ya beerfe mesged abay manoki wengel
YeEgziabher sew tewdaju simwa
Tarba midgabalos eskahun simu sit’erabet sirege yinoral senselet

VERSE 4
Adis awarya yeityop’ya degana qulawn bemsl
Bareka ityop’ya beewr mesqedmanos
Yihun yeEgziabher sew neh tewedaj
Simwaba michuna fafwatew tiraraw Kidus new

VERSE 5
Yeabadachn mesqel ts’elot silenekaw
Yeteramedebet yedasesew hulu diw yifewsal sarna qit’elu
Aresat ityop’ya ityop’ya beerfe mesgel abat tigla sebaki wengel
YeEgziabher sew new tewedaj sima

VERSE 6
Yetemade bedbaresa
Ityop’ya beerfe mesgel abath laynol
YeEgziabher sew new tewedaj sima
Yetmdeqhbay yetremd bets’dqbay yetr mamd bedq hedeba',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'aresat-itiyopiyan'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 1
ኦርፈና ሰባይ
ወል እግዚአብሔር ሰው ነው ተወዳጅ በስለማ
በጥቃደባ ፈውስና ሰሎቱ ቃሉ የተሰማ
ወዬን የሰበከር ከተማ የትሳውቅ የደብረ አስቦቱ

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 2
ለወንጌል ተዋጋሽ ንጽህ ወቱ
አረሳት ኢትዮጵያ በርፈን ላይ ማኖኪውን
የእግዚአብሔር ሰው ነህ ተወዳ ስማ የምርም
በጥቃደባ ፋናው እስከዛሬ ዛሬ ሲያራ የኖረው

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 3
የትሰው አባው ለእግዚ ሃሪያ ማህፀሩ ወለድሽ ቆብን ሲኦን የሚያውቅ
አረሳ ኢትዮጵያ በእርፈ መስገድ አባይ ማኖኪ ወንጌል
የእግዚአብሔር ሰው ተውዳጁ ስሟ
ታርባ ምድጋባሎስ እስካሁን ስሙ ሲጠራበት ሲረገ ይኖራል ሰንሰለት

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 4
አዲስ አዋርያ የኢትዮጵያ ደጋና ቁላውን በምስል
ባረካ ኢትዮጵያ በእውር መስቀድማኖስ
ይሁን የእግዚአብሔር ሰው ነህ ተወዳጅ
ስሟባ ምቹና ፋፏቴው ትራራው ቅዱስ ነው

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 5
የአባዳችን መስቀል ጸሎት ስለነካው
የተራመደበት የዳሰሰው ሁሉ ድው ይፈውሳል ሳርና ቅጠሉ
አረሳት ኢትዮጵያ ኢትዮጵያ በእርፈ መስገል አባት ትግላ ሰባኪ ወንጌል
የእግዚአብሔር ሰው ነው ተወዳጅ ስማ

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ

VERSE 6
የተማደ በድባረሳ
ኢትዮጵያ በእርፈ መስገል አባትህ ላይኖል
የእግዚአብሔር ሰው ነው ተወዳጅ ስማ
የትምደቅህባይ የትረምድ በጽድቅባይ የትር ማምድ በድቅ ሄደባ

CHORUS
ሃሌሉያ
እግዚአብሄር እሆ
አረሳት ኢትዮጵያ በእርፈ መስቀል አባትህ ላይ ማኖኪወን
የእግዚአብሔር ሰው ነው ተወዳጅ በሰማይም በድጋደባ አረ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are

VERSE 1
Orfena sebay
Wel Egziabher sew new tewedaj beslema
Bet’qadeba fewsna selotu qalu yetesema
Weyen yesebeker ketema yetsawq yedebre asbotu

CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are

VERSE 2
Lewengel tewagash nits’h wetu
Aresat ityop’ya berfen lay manokiwn
YeEgziabher sew neh teweda sima yemrm
Bet’qadeba fanaw eskezare zare siyara yenorew

CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are

VERSE 3
Yetsew abaw leegzi hariya mahts’eru weledsh qobn sion yemiyawq
Aresa ityop’ya beerfe mesged abay manoki wengel
YeEgziabher sew tewdaju simwa
Tarba midgabalos eskahun simu sit’erabet sirege yinoral senselet

CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are

VERSE 4
Adis awarya yeityop’ya degana qulawn bemsl
Bareka ityop’ya beewr mesqedmanos
Yihun yeEgziabher sew neh tewedaj
Simwaba michuna fafwatew tiraraw Kidus new

CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are

VERSE 5
Yeabadachn mesqel ts’elot silenekaw
Yeteramedebet yedasesew hulu diw yifewsal sarna qit’elu
Aresat ityop’ya ityop’ya beerfe mesgel abat tigla sebaki wengel
YeEgziabher sew new tewedaj sima

CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are

VERSE 6
Yetemade bedbaresa
Ityop’ya beerfe mesgel abath laynol
YeEgziabher sew new tewedaj sima
Yetmdeqhbay yetremd bets’dqbay yetr mamd bedq hedeba

CHORUS
Halleluya
Egziabher eho
Aresat ityop’ya beerfe mesqel abath lay manokiwen
YeEgziabher sew new tewedaj besemaym bedgadeba are'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'aresat-itiyopiyan', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Arikesh_newiren_shefenish Enidale Dereje (arikesh-newiren-shefenish-enidale-dereje)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 1
ነውር አለብኝ ብዙ ስድብ
አንጀት የሚልጥ ልብ የሚያቆስል
ስሜን ለውጠው ቢያንቋሽሹኝ
በሀዘን በለቅሶ ድንግል መጣሁኝ

VERSE 2
እንደ ሐና ሆኜ በቤተ መቅደስ
በመረረ ኃዘን ነው እኔ እማለቅስ
ፍረጅልኝ እና ልመለስ ከቤቴ
ሀዘኔን በደስታ ለውጭው እናቴ

VERSE 3
በግራም በቀኜም ጠላት ቢከበኝ
አብዝቼ እጮሀለሁ እናቴ ስሚኝ
መከራው በዝቶ ግራ ገብቶኛል
ድምጽሽን ልስማው ያረጋጋኛል

VERSE 4
የሰው ሕይወቱ ብርቱ ሰልፍ ነው
ደስታ እና ኃዘን የማይለየው
በእጃችን ወድቋል ሲሉኝ ጠላቶቼ
አመለጥኳቸው ስምሽን ጠርቼ

VERSE 5
ሰው የዘራውን ያንኑ ያጭዳል
በቆፈረው ጉድጓድ ራሱ ይገባል
እናቴ እመቤቴ ብዬ ስጥራሽ
ከመከራው ሁሉ ታወጪኛለሽ

VERSE 6
በምርኮ ሳለው በሰው ሀገር
ግፍ ውለውብኝ ስኖር በእስር
ምልጃሽ ደርሶልኝ ተፈትቻለው
በተአምራትሽ እኔ ድኛለው

VERSE 7
ቃልሽን ሰምቶ ጽንሱ ሰገደ
ብላለች ኤልሳቤጥ ነውሬ ተወገደ
የጌታዬ እናት እኔን አሰበቺኝ
ታሪኬን ቀይራ ይኸው ባረከቺኝ

VERSE 8
የእመቤቴ ከሆንኩ ማን ይቃወመኛል
ወጀቡም ማዕበሉም ይታዘዝልኛል
ወይን እኮ አልቋል የዶኪማስ ቤት
ድንግል አማልጂው ነይ የእኛ እመቤት

VERSE 9
ስምሽ ሲጠራ በየቦታዉ
ይመላልና የጎደለዉ
ግራ የገባው የቸገረዉ
ድንግልን ይጥራት እንድትረዳዉ

VERSE 10
ሳዝን ስተክዝ የምታጽናና
እናት አለቺኝ ርኅርኅተ ልቡና
እናቴ እመቤቴ ብዬ ስጥራሽ
ከመከራው ሁሉ ታወጪኛለሽ',
      lyrics_transliteration = 'Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 1
Newr alebgn bizu sidb
Anjet yemilt’ lib yemiyaqosl
Simen lewt’ew biyanqwashshugn
Behezen beleqso Dingil met’ahugn

VERSE 2
Ende hena hogne bebete meqdes
Bemerere hazen new ene emaleqs
Firejlgn ena limeles kebete
Hezenen bedesta lewch’w enate

VERSE 3
Begram beqegnem t’elat bikebegn
Abzche ech’ohelehu enate simign
Mekeraw bezto gira gebtognal
Dimts’shn lismaw yaregagagnal

VERSE 4
Yesew hiywetu birtu self new
Desta ena hazen yemayleyew
Beejachn wedqwal silugn t’elatoche
Amelet’kwachew simshn t’erche

VERSE 5
Sew yezerawn yannu yach’dal
Beqoferew gudgwad rasu yigebal
Enate Emebete biye sit’rash
Kemekeraw hulu tawech’ignalesh

VERSE 6
Bemrko salew besew heger
Gif wilewbgn sinor beesr
Miljash dersolgn tefetchalew
Beteamratsh ene dignalew

VERSE 7
Qalshn semto ts’nsu segede
Bilalech elsabet’ newre tewegede
Yegetaye enat enen asebechign
Tariken qeyra yiኸw barekechign

VERSE 8
Yeemebete kehonku man yiqawemegnal
Wejebum maebelum yitazezlgnal
Weyn eko alqwal yedokimas bet
Dingil amaljiw ney yeegna emebet

VERSE 9
Simsh sit’era beyebotawu
Yimelalna yegodelewu
Gira yegebaw yechegerewu
Dingln yit’rat endtredawu

VERSE 10
Sazn sitekz yemtats’nana
Enat alechign rihrhte libuna
Enate Emebete biye sit’rash
Kemekeraw hulu tawech’ignalesh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'arikesh-newiren-shefenish-enidale-dereje'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 1
ነውር አለብኝ ብዙ ስድብ
አንጀት የሚልጥ ልብ የሚያቆስል
ስሜን ለውጠው ቢያንቋሽሹኝ
በሀዘን በለቅሶ ድንግል መጣሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 2
እንደ ሐና ሆኜ በቤተ መቅደስ
በመረረ ኃዘን ነው እኔ እማለቅስ
ፍረጅልኝ እና ልመለስ ከቤቴ
ሀዘኔን በደስታ ለውጭው እናቴ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 3
በግራም በቀኜም ጠላት ቢከበኝ
አብዝቼ እጮሀለሁ እናቴ ስሚኝ
መከራው በዝቶ ግራ ገብቶኛል
ድምጽሽን ልስማው ያረጋጋኛል

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 4
የሰው ሕይወቱ ብርቱ ሰልፍ ነው
ደስታ እና ኃዘን የማይለየው
በእጃችን ወድቋል ሲሉኝ ጠላቶቼ
አመለጥኳቸው ስምሽን ጠርቼ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 5
ሰው የዘራውን ያንኑ ያጭዳል
በቆፈረው ጉድጓድ ራሱ ይገባል
እናቴ እመቤቴ ብዬ ስጥራሽ
ከመከራው ሁሉ ታወጪኛለሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 6
በምርኮ ሳለው በሰው ሀገር
ግፍ ውለውብኝ ስኖር በእስር
ምልጃሽ ደርሶልኝ ተፈትቻለው
በተአምራትሽ እኔ ድኛለው

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 7
ቃልሽን ሰምቶ ጽንሱ ሰገደ
ብላለች ኤልሳቤጥ ነውሬ ተወገደ
የጌታዬ እናት እኔን አሰበቺኝ
ታሪኬን ቀይራ ይኸው ባረከቺኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 8
የእመቤቴ ከሆንኩ ማን ይቃወመኛል
ወጀቡም ማዕበሉም ይታዘዝልኛል
ወይን እኮ አልቋል የዶኪማስ ቤት
ድንግል አማልጂው ነይ የእኛ እመቤት

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 9
ስምሽ ሲጠራ በየቦታዉ
ይመላልና የጎደለዉ
ግራ የገባው የቸገረዉ
ድንግልን ይጥራት እንድትረዳዉ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ

VERSE 10
ሳዝን ስተክዝ የምታጽናና
እናት አለቺኝ ርኅርኅተ ልቡና
እናቴ እመቤቴ ብዬ ስጥራሽ
ከመከራው ሁሉ ታወጪኛለሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እመ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ኃዘኔን በአንቺ እረሳለሁኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 1
Newr alebgn bizu sidb
Anjet yemilt’ lib yemiyaqosl
Simen lewt’ew biyanqwashshugn
Behezen beleqso Dingil met’ahugn

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 2
Ende hena hogne bebete meqdes
Bemerere hazen new ene emaleqs
Firejlgn ena limeles kebete
Hezenen bedesta lewch’w enate

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 3
Begram beqegnem t’elat bikebegn
Abzche ech’ohelehu enate simign
Mekeraw bezto gira gebtognal
Dimts’shn lismaw yaregagagnal

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 4
Yesew hiywetu birtu self new
Desta ena hazen yemayleyew
Beejachn wedqwal silugn t’elatoche
Amelet’kwachew simshn t’erche

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 5
Sew yezerawn yannu yach’dal
Beqoferew gudgwad rasu yigebal
Enate Emebete biye sit’rash
Kemekeraw hulu tawech’ignalesh

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 6
Bemrko salew besew heger
Gif wilewbgn sinor beesr
Miljash dersolgn tefetchalew
Beteamratsh ene dignalew

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 7
Qalshn semto ts’nsu segede
Bilalech elsabet’ newre tewegede
Yegetaye enat enen asebechign
Tariken qeyra yiኸw barekechign

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 8
Yeemebete kehonku man yiqawemegnal
Wejebum maebelum yitazezlgnal
Weyn eko alqwal yedokimas bet
Dingil amaljiw ney yeegna emebet

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 9
Simsh sit’era beyebotawu
Yimelalna yegodelewu
Gira yegebaw yechegerewu
Dingln yit’rat endtredawu

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn

VERSE 10
Sazn sitekz yemtats’nana
Enat alechign rihrhte libuna
Enate Emebete biye sit’rash
Kemekeraw hulu tawech’ignalesh

CHORUS
Sidben arqesh newren shefenshw
Eme amlak beanchi mechem alafrm
Simshn t’erche ets’nanalehugn
Hazenen beanchi eresalehugn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'arikesh-newiren-shefenish-enidale-dereje', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Asagiruni / / / Zemari Bereket Tikue (asagiruni-zemari-bereket-tikue)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኣሳጊሩኒ ተሳጊረ
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ
ህይወት ረኺበ ብጎይታይ
ናይ ሞት ታሪኸይ ተዓጽዪ

VERSE 1
ደጊም ፍርሃት የለን ጥቃይ
ምድሓነይ ተረጋጊጹ
ቃል ምስጋና ውዕለቱ ክነግራ ከናፍረይ
ገንሸል ኣምላኽ ኣፉ ኣይከፈተን ንምድሓነይ

VERSE 2
ዘይጽገን ቃንዛ ከቢድ ሓጢኣት ከሳቅየኒ
ብቁስሉ እንድዪ ንቁስለይ ዘኒኑ ዘቆመኒ
ኣሳጊሩኒ ተሳጊረ
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ

VERSE 3
ህይወት ረኺበ ብጎይታይ
ናይ ሞት ታሪኸይ ተዓጽዪ
ደጊም ፍርሃት የለን ጥቃይ
ምድሓነይ ተረጋጊጹ

VERSE 4
እቲ ምስ ዓለም ዝቖረነኒ ሰንሰለተይ
ኣብ መስቀሉ ሕይወት ሂቡ በቲኹለይ
ንመርገመይ ምስ ተሰከሞ ኣብ እንግዳዑ
እነኹ''ኳ ደው ኢለ የመስግን ብሳላኡ

VERSE 5
ኣሳጊሩኒ ተሳጊረ
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ
ህይወት ረኺበ ብጎይታይ
ናይ ሞት ታሪኸይ ተዓጽዪ

VERSE 6
ደጊም ፍርሃት የለን ጥቃይ
ምድሓነይ ተረጋጊጹ
ዝጥምቶ ዘቋምቶ የለን ብዘይካኡ
ምልኣት ልበይ ደስታ ምስኪን ነፍሰይ

VERSE 7
ንሱ እንድዪ
ሞተይ ኡካ ካብ ሱሩ ምቡንቋስ ዝተኻእሎ
ይኣምን''የ እየሱስ ዘይክእሎ እንታይ ኣሎ
ኣሳጊሩኒ ተሳጊረ

VERSE 8
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ
ህይወት ረኺበ ብጎይታይ
ናይ ሞት ታሪኸይ ተዓጽዪ
ደጊም ፍርሃት የለን ጥቃይ

VERSE 9
ምድሓነይ ተረጋጊጹ
እቲ ምስ ዓለም ዝቆረነኒ ሰንሰለተይ
ኣብ መስቀሉ ሕይወት ሂቡ በቲኹለይ
ንመርገመይ ምስ ተሰከሞ ኣብ እንግዳዑ

VERSE 10
እነኹ''ኳ ደው ኢለ የመስግን ብሳላኡ
ኣሳጊሩኒ ተሳጊረ
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ
ህይወት ረኺበ ብጎይታይ

VERSE 11
ናይ ሞት ታሪኸይ ተዓጽዪ
ደጊም ፍርሃት የለን ጥቃይ
ምድሓነይ ተረጋጊጹ',
      lyrics_transliteration = 'Asagiruni tesagire
Kab barnet hat’iat kabti zimerere
Hiywet reኺbe bigoytay
Nay mot tariኸy teats’yi

VERSE 1
Degim firhat yelen t’qay
Midhaney teregagits’u
Qal misgana wieletu kinegra kenafrey
Genshel amlaኽ afu aykefeten nimdhaney

VERSE 2
Zeyts’gen qanza kebid hat’iat kesaqyeni
Biquslu endyi niqusley zeninu zeqomeni
Asagiruni tesagire
Kab barnet hat’iat kabti zimerere

VERSE 3
Hiywet reኺbe bigoytay
Nay mot tariኸy teats’yi
Degim firhat yelen t’qay
Midhaney teregagits’u

VERSE 4
Eti mis alem ziቖreneni senseletey
Ab mesqelu hiywet hibu betiኹley
Nimergemey mis tesekemo ab engdau
Eneኹ''kwa dew ile yemesgn bisalau

VERSE 5
Asagiruni tesagire
Kab barnet hat’iat kabti zimerere
Hiywet reኺbe bigoytay
Nay mot tariኸy teats’yi

VERSE 6
Degim firhat yelen t’qay
Midhaney teregagits’u
Zit’mto zeqwamto yelen bizeykau
Milat libey desta miskin nefsey

VERSE 7
Nisu endyi
Motey uka kab suru mibunqwas ziteኻelo
Yiamn''ye eyesus zeykelo entay alo
Asagiruni tesagire

VERSE 8
Kab barnet hat’iat kabti zimerere
Hiywet reኺbe bigoytay
Nay mot tariኸy teats’yi
Degim firhat yelen t’qay

VERSE 9
Midhaney teregagits’u
Eti mis alem ziqoreneni senseletey
Ab mesqelu hiywet hibu betiኹley
Nimergemey mis tesekemo ab engdau

VERSE 10
Eneኹ''kwa dew ile yemesgn bisalau
Asagiruni tesagire
Kab barnet hat’iat kabti zimerere
Hiywet reኺbe bigoytay

VERSE 11
Nay mot tariኸy teats’yi
Degim firhat yelen t’qay
Midhaney teregagits’u',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'asagiruni-zemari-bereket-tikue'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣሳጊሩኒ ተሳጊረ
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ
ህይወት ረኺበ ብጎይታይ
ናይ ሞት ታሪኸይ ተዓጽዪ

VERSE 1
ደጊም ፍርሃት የለን ጥቃይ
ምድሓነይ ተረጋጊጹ
ቃል ምስጋና ውዕለቱ ክነግራ ከናፍረይ
ገንሸል ኣምላኽ ኣፉ ኣይከፈተን ንምድሓነይ

CHORUS
ኣሳጊሩኒ ተሳጊረ
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ
ህይወት ረኺበ ብጎይታይ
ናይ ሞት ታሪኸይ ተዓጽዪ

VERSE 2
ዘይጽገን ቃንዛ ከቢድ ሓጢኣት ከሳቅየኒ
ብቁስሉ እንድዪ ንቁስለይ ዘኒኑ ዘቆመኒ
ኣሳጊሩኒ ተሳጊረ
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ

CHORUS
ኣሳጊሩኒ ተሳጊረ
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ
ህይወት ረኺበ ብጎይታይ
ናይ ሞት ታሪኸይ ተዓጽዪ

VERSE 3
ህይወት ረኺበ ብጎይታይ
ናይ ሞት ታሪኸይ ተዓጽዪ
ደጊም ፍርሃት የለን ጥቃይ
ምድሓነይ ተረጋጊጹ

CHORUS
ኣሳጊሩኒ ተሳጊረ
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ
ህይወት ረኺበ ብጎይታይ
ናይ ሞት ታሪኸይ ተዓጽዪ

VERSE 4
እቲ ምስ ዓለም ዝቖረነኒ ሰንሰለተይ
ኣብ መስቀሉ ሕይወት ሂቡ በቲኹለይ
ንመርገመይ ምስ ተሰከሞ ኣብ እንግዳዑ
እነኹ''ኳ ደው ኢለ የመስግን ብሳላኡ

CHORUS
ኣሳጊሩኒ ተሳጊረ
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ
ህይወት ረኺበ ብጎይታይ
ናይ ሞት ታሪኸይ ተዓጽዪ

VERSE 5
ኣሳጊሩኒ ተሳጊረ
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ
ህይወት ረኺበ ብጎይታይ
ናይ ሞት ታሪኸይ ተዓጽዪ

CHORUS
ኣሳጊሩኒ ተሳጊረ
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ
ህይወት ረኺበ ብጎይታይ
ናይ ሞት ታሪኸይ ተዓጽዪ

VERSE 6
ደጊም ፍርሃት የለን ጥቃይ
ምድሓነይ ተረጋጊጹ
ዝጥምቶ ዘቋምቶ የለን ብዘይካኡ
ምልኣት ልበይ ደስታ ምስኪን ነፍሰይ

CHORUS
ኣሳጊሩኒ ተሳጊረ
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ
ህይወት ረኺበ ብጎይታይ
ናይ ሞት ታሪኸይ ተዓጽዪ

VERSE 7
ንሱ እንድዪ
ሞተይ ኡካ ካብ ሱሩ ምቡንቋስ ዝተኻእሎ
ይኣምን''የ እየሱስ ዘይክእሎ እንታይ ኣሎ
ኣሳጊሩኒ ተሳጊረ

CHORUS
ኣሳጊሩኒ ተሳጊረ
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ
ህይወት ረኺበ ብጎይታይ
ናይ ሞት ታሪኸይ ተዓጽዪ

VERSE 8
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ
ህይወት ረኺበ ብጎይታይ
ናይ ሞት ታሪኸይ ተዓጽዪ
ደጊም ፍርሃት የለን ጥቃይ

CHORUS
ኣሳጊሩኒ ተሳጊረ
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ
ህይወት ረኺበ ብጎይታይ
ናይ ሞት ታሪኸይ ተዓጽዪ

VERSE 9
ምድሓነይ ተረጋጊጹ
እቲ ምስ ዓለም ዝቆረነኒ ሰንሰለተይ
ኣብ መስቀሉ ሕይወት ሂቡ በቲኹለይ
ንመርገመይ ምስ ተሰከሞ ኣብ እንግዳዑ

CHORUS
ኣሳጊሩኒ ተሳጊረ
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ
ህይወት ረኺበ ብጎይታይ
ናይ ሞት ታሪኸይ ተዓጽዪ

VERSE 10
እነኹ''ኳ ደው ኢለ የመስግን ብሳላኡ
ኣሳጊሩኒ ተሳጊረ
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ
ህይወት ረኺበ ብጎይታይ

CHORUS
ኣሳጊሩኒ ተሳጊረ
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ
ህይወት ረኺበ ብጎይታይ
ናይ ሞት ታሪኸይ ተዓጽዪ

VERSE 11
ናይ ሞት ታሪኸይ ተዓጽዪ
ደጊም ፍርሃት የለን ጥቃይ
ምድሓነይ ተረጋጊጹ

CHORUS
ኣሳጊሩኒ ተሳጊረ
ካብ ባርነት ሓጢኣት ካብቲ ዝመረረ
ህይወት ረኺበ ብጎይታይ
ናይ ሞት ታሪኸይ ተዓጽዪ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Asagiruni tesagire
Kab barnet hat’iat kabti zimerere
Hiywet reኺbe bigoytay
Nay mot tariኸy teats’yi

VERSE 1
Degim firhat yelen t’qay
Midhaney teregagits’u
Qal misgana wieletu kinegra kenafrey
Genshel amlaኽ afu aykefeten nimdhaney

CHORUS
Asagiruni tesagire
Kab barnet hat’iat kabti zimerere
Hiywet reኺbe bigoytay
Nay mot tariኸy teats’yi

VERSE 2
Zeyts’gen qanza kebid hat’iat kesaqyeni
Biquslu endyi niqusley zeninu zeqomeni
Asagiruni tesagire
Kab barnet hat’iat kabti zimerere

CHORUS
Asagiruni tesagire
Kab barnet hat’iat kabti zimerere
Hiywet reኺbe bigoytay
Nay mot tariኸy teats’yi

VERSE 3
Hiywet reኺbe bigoytay
Nay mot tariኸy teats’yi
Degim firhat yelen t’qay
Midhaney teregagits’u

CHORUS
Asagiruni tesagire
Kab barnet hat’iat kabti zimerere
Hiywet reኺbe bigoytay
Nay mot tariኸy teats’yi

VERSE 4
Eti mis alem ziቖreneni senseletey
Ab mesqelu hiywet hibu betiኹley
Nimergemey mis tesekemo ab engdau
Eneኹ''kwa dew ile yemesgn bisalau

CHORUS
Asagiruni tesagire
Kab barnet hat’iat kabti zimerere
Hiywet reኺbe bigoytay
Nay mot tariኸy teats’yi

VERSE 5
Asagiruni tesagire
Kab barnet hat’iat kabti zimerere
Hiywet reኺbe bigoytay
Nay mot tariኸy teats’yi

CHORUS
Asagiruni tesagire
Kab barnet hat’iat kabti zimerere
Hiywet reኺbe bigoytay
Nay mot tariኸy teats’yi

VERSE 6
Degim firhat yelen t’qay
Midhaney teregagits’u
Zit’mto zeqwamto yelen bizeykau
Milat libey desta miskin nefsey

CHORUS
Asagiruni tesagire
Kab barnet hat’iat kabti zimerere
Hiywet reኺbe bigoytay
Nay mot tariኸy teats’yi

VERSE 7
Nisu endyi
Motey uka kab suru mibunqwas ziteኻelo
Yiamn''ye eyesus zeykelo entay alo
Asagiruni tesagire

CHORUS
Asagiruni tesagire
Kab barnet hat’iat kabti zimerere
Hiywet reኺbe bigoytay
Nay mot tariኸy teats’yi

VERSE 8
Kab barnet hat’iat kabti zimerere
Hiywet reኺbe bigoytay
Nay mot tariኸy teats’yi
Degim firhat yelen t’qay

CHORUS
Asagiruni tesagire
Kab barnet hat’iat kabti zimerere
Hiywet reኺbe bigoytay
Nay mot tariኸy teats’yi

VERSE 9
Midhaney teregagits’u
Eti mis alem ziqoreneni senseletey
Ab mesqelu hiywet hibu betiኹley
Nimergemey mis tesekemo ab engdau

CHORUS
Asagiruni tesagire
Kab barnet hat’iat kabti zimerere
Hiywet reኺbe bigoytay
Nay mot tariኸy teats’yi

VERSE 10
Eneኹ''kwa dew ile yemesgn bisalau
Asagiruni tesagire
Kab barnet hat’iat kabti zimerere
Hiywet reኺbe bigoytay

CHORUS
Asagiruni tesagire
Kab barnet hat’iat kabti zimerere
Hiywet reኺbe bigoytay
Nay mot tariኸy teats’yi

VERSE 11
Nay mot tariኸy teats’yi
Degim firhat yelen t’qay
Midhaney teregagits’u

CHORUS
Asagiruni tesagire
Kab barnet hat’iat kabti zimerere
Hiywet reኺbe bigoytay
Nay mot tariኸy teats’yi'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'asagiruni-zemari-bereket-tikue', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: ASTEKAKLEH YAZEGN ZEMARIT TENAYE ASEFA TRACK 03 (astekakleh-yazegn-zemarit-tenaye-asefa-track-03)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ለብ ያለ ልብ ይዤ ፣ ስቅበዘበዝ ፊትህ
እንደምን አልፈጀኝ ፣ ዝም አለኝ እሳትህ
ለማንም የለውም ፣ ጽንፍ የሌለው ምሕረት
ይቅር በለኝ ጌታ ፣ ይብዛልኝ ቸርነት ።

VERSE 1
ከኃጢአት ገንዘብ ላይ ፣ አሥራት እየሰጠሁ
እንደምን ከቤትህ ፣ በቸርነት ወጣሁ
ሰርቄ እያመጣሁ ፣ ብጓደድብህም
አንተ ግን ታጋሽ ነህ ፣ ከቶ አልቀሰፍከኝም።

VERSE 2
አስተካክለህ ያዘኝ ፣ መሐሪው አባቴ
ካላንተ ባዶ ነው ፣ በሙሉ ሕይወቴ
ከኃጢአተኛ ጋራ ፣ ካመንዝራ መንደር
ማን መጥቶ ይውላል ፣ ፈሪሳዊ ሰፈር

VERSE 3
አንተ አትጸየፍም ፣ ማዕድ ትቆርሳለህ
የኃጢአትን መዓዛ ፣ ቀርበህ ታርቃለህ።
ብሉ ብለህ ሰጥተህ ፣ ሥጋና ደምህን
እኔ ሚያስጨንቀኝ ፣ የሚጎድል ሳህን

VERSE 4
ብኩን ሆኜ ቀረሁ ፣ ቁም ነገር የሌለው
አባ ድረስና ፣ ልጅህን አስጥለው።
እንደ መላእክቱ ፣ አንተ ፊት መቆምን
አድለኸኝ ሳለ ፣ ፍም ዙፋን መሳምን

VERSE 5
እኔ አንቀላፋለሁ ፣ ዓለም ወስዳኛለች
ፈጥነህ ና ቀስቅሰኝ ፣ ነፍሴ ሰልችታለች።
ጨለማና ብርሀን ፣ ውስጤ ተቀላቅሎ
እኔስ ግራ ገባኝ ፣ በሙሉ ጎዶሎ

VERSE 6
አንዴ እየጨለምኩኝ ፣ አንዴም እየበራሁ
ዘመኔን ከሰርኩኝ ፣ በደል እየሠራሁ ።',
      lyrics_transliteration = 'Leb yale lib yizhe , siqbezebez fith
Endemn alfejegn , zim alegn esath
Lemanm yelewm , ts’nf yelelew mihret
Yiqr belegn Geta , yibzalgn chernet .

VERSE 1
Kehat’iat genzeb lay , asrat eyeset’ehu
Endemn kebeth , bechernet wet’ahu
Serqe eyamet’ahu , bigwadedbhm
Ante gin tagash neh , keto alqesefkegnm.

VERSE 2
Astekakleh yazegn , meheriw abate
Kalante bado new , bemulu hiywete
Kehat’iategna gara , kamenzra mender
Man met’to yiwlal , ferisawi sefer

VERSE 3
Ante atts’eyefm , maed tiqorsaleh
Yehat’iatn meaza , qerbeh tarqaleh.
Bilu bileh set’teh , sigana demhn
Ene miyasch’enqegn , yemigodl sahn

VERSE 4
Bikun hogne qerehu , qum neger yelelew
Aba diresna , lijhn ast’lew.
Ende melaektu , ante fit meqomn
Adleኸgn sale , fim zufan mesamn

VERSE 5
Ene anqelafalehu , alem wesdagnalech
Fet’neh na qesqsegn , nefse selchtalech.
Ch’elemana birhen , wist’e teqelaqlo
Enes gira gebagn , bemulu godolo

VERSE 6
Ande eyech’elemkugn , andem eyeberahu
Zemenen keserkugn , bedel eyeserahu .',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'astekakleh-yazegn-zemarit-tenaye-asefa-track-03'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለብ ያለ ልብ ይዤ ፣ ስቅበዘበዝ ፊትህ
እንደምን አልፈጀኝ ፣ ዝም አለኝ እሳትህ
ለማንም የለውም ፣ ጽንፍ የሌለው ምሕረት
ይቅር በለኝ ጌታ ፣ ይብዛልኝ ቸርነት ።

VERSE 1
ከኃጢአት ገንዘብ ላይ ፣ አሥራት እየሰጠሁ
እንደምን ከቤትህ ፣ በቸርነት ወጣሁ
ሰርቄ እያመጣሁ ፣ ብጓደድብህም
አንተ ግን ታጋሽ ነህ ፣ ከቶ አልቀሰፍከኝም።

CHORUS
ለብ ያለ ልብ ይዤ ፣ ስቅበዘበዝ ፊትህ
እንደምን አልፈጀኝ ፣ ዝም አለኝ እሳትህ
ለማንም የለውም ፣ ጽንፍ የሌለው ምሕረት
ይቅር በለኝ ጌታ ፣ ይብዛልኝ ቸርነት ።

VERSE 2
አስተካክለህ ያዘኝ ፣ መሐሪው አባቴ
ካላንተ ባዶ ነው ፣ በሙሉ ሕይወቴ
ከኃጢአተኛ ጋራ ፣ ካመንዝራ መንደር
ማን መጥቶ ይውላል ፣ ፈሪሳዊ ሰፈር

CHORUS
ለብ ያለ ልብ ይዤ ፣ ስቅበዘበዝ ፊትህ
እንደምን አልፈጀኝ ፣ ዝም አለኝ እሳትህ
ለማንም የለውም ፣ ጽንፍ የሌለው ምሕረት
ይቅር በለኝ ጌታ ፣ ይብዛልኝ ቸርነት ።

VERSE 3
አንተ አትጸየፍም ፣ ማዕድ ትቆርሳለህ
የኃጢአትን መዓዛ ፣ ቀርበህ ታርቃለህ።
ብሉ ብለህ ሰጥተህ ፣ ሥጋና ደምህን
እኔ ሚያስጨንቀኝ ፣ የሚጎድል ሳህን

CHORUS
ለብ ያለ ልብ ይዤ ፣ ስቅበዘበዝ ፊትህ
እንደምን አልፈጀኝ ፣ ዝም አለኝ እሳትህ
ለማንም የለውም ፣ ጽንፍ የሌለው ምሕረት
ይቅር በለኝ ጌታ ፣ ይብዛልኝ ቸርነት ።

VERSE 4
ብኩን ሆኜ ቀረሁ ፣ ቁም ነገር የሌለው
አባ ድረስና ፣ ልጅህን አስጥለው።
እንደ መላእክቱ ፣ አንተ ፊት መቆምን
አድለኸኝ ሳለ ፣ ፍም ዙፋን መሳምን

CHORUS
ለብ ያለ ልብ ይዤ ፣ ስቅበዘበዝ ፊትህ
እንደምን አልፈጀኝ ፣ ዝም አለኝ እሳትህ
ለማንም የለውም ፣ ጽንፍ የሌለው ምሕረት
ይቅር በለኝ ጌታ ፣ ይብዛልኝ ቸርነት ።

VERSE 5
እኔ አንቀላፋለሁ ፣ ዓለም ወስዳኛለች
ፈጥነህ ና ቀስቅሰኝ ፣ ነፍሴ ሰልችታለች።
ጨለማና ብርሀን ፣ ውስጤ ተቀላቅሎ
እኔስ ግራ ገባኝ ፣ በሙሉ ጎዶሎ

CHORUS
ለብ ያለ ልብ ይዤ ፣ ስቅበዘበዝ ፊትህ
እንደምን አልፈጀኝ ፣ ዝም አለኝ እሳትህ
ለማንም የለውም ፣ ጽንፍ የሌለው ምሕረት
ይቅር በለኝ ጌታ ፣ ይብዛልኝ ቸርነት ።

VERSE 6
አንዴ እየጨለምኩኝ ፣ አንዴም እየበራሁ
ዘመኔን ከሰርኩኝ ፣ በደል እየሠራሁ ።

CHORUS
ለብ ያለ ልብ ይዤ ፣ ስቅበዘበዝ ፊትህ
እንደምን አልፈጀኝ ፣ ዝም አለኝ እሳትህ
ለማንም የለውም ፣ ጽንፍ የሌለው ምሕረት
ይቅር በለኝ ጌታ ፣ ይብዛልኝ ቸርነት ።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Leb yale lib yizhe , siqbezebez fith
Endemn alfejegn , zim alegn esath
Lemanm yelewm , ts’nf yelelew mihret
Yiqr belegn Geta , yibzalgn chernet .

VERSE 1
Kehat’iat genzeb lay , asrat eyeset’ehu
Endemn kebeth , bechernet wet’ahu
Serqe eyamet’ahu , bigwadedbhm
Ante gin tagash neh , keto alqesefkegnm.

CHORUS
Leb yale lib yizhe , siqbezebez fith
Endemn alfejegn , zim alegn esath
Lemanm yelewm , ts’nf yelelew mihret
Yiqr belegn Geta , yibzalgn chernet .

VERSE 2
Astekakleh yazegn , meheriw abate
Kalante bado new , bemulu hiywete
Kehat’iategna gara , kamenzra mender
Man met’to yiwlal , ferisawi sefer

CHORUS
Leb yale lib yizhe , siqbezebez fith
Endemn alfejegn , zim alegn esath
Lemanm yelewm , ts’nf yelelew mihret
Yiqr belegn Geta , yibzalgn chernet .

VERSE 3
Ante atts’eyefm , maed tiqorsaleh
Yehat’iatn meaza , qerbeh tarqaleh.
Bilu bileh set’teh , sigana demhn
Ene miyasch’enqegn , yemigodl sahn

CHORUS
Leb yale lib yizhe , siqbezebez fith
Endemn alfejegn , zim alegn esath
Lemanm yelewm , ts’nf yelelew mihret
Yiqr belegn Geta , yibzalgn chernet .

VERSE 4
Bikun hogne qerehu , qum neger yelelew
Aba diresna , lijhn ast’lew.
Ende melaektu , ante fit meqomn
Adleኸgn sale , fim zufan mesamn

CHORUS
Leb yale lib yizhe , siqbezebez fith
Endemn alfejegn , zim alegn esath
Lemanm yelewm , ts’nf yelelew mihret
Yiqr belegn Geta , yibzalgn chernet .

VERSE 5
Ene anqelafalehu , alem wesdagnalech
Fet’neh na qesqsegn , nefse selchtalech.
Ch’elemana birhen , wist’e teqelaqlo
Enes gira gebagn , bemulu godolo

CHORUS
Leb yale lib yizhe , siqbezebez fith
Endemn alfejegn , zim alegn esath
Lemanm yelewm , ts’nf yelelew mihret
Yiqr belegn Geta , yibzalgn chernet .

VERSE 6
Ande eyech’elemkugn , andem eyeberahu
Zemenen keserkugn , bedel eyeserahu .

CHORUS
Leb yale lib yizhe , siqbezebez fith
Endemn alfejegn , zim alegn esath
Lemanm yelewm , ts’nf yelelew mihret
Yiqr belegn Geta , yibzalgn chernet .'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'astekakleh-yazegn-zemarit-tenaye-asefa-track-03', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Atetowal godelobetal bay kesis Ashenafi mzemur (atetowal-godelobetal-bay-kesis-ashenafi-mzemur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 1
ሀዘን ፅልመት ክፉ ዘመን ቢገጥመኝም እንኳ
ያልፋል ሁሉም ታሪክ ሆኖ በፊትህ ሲለካ
ማን አፈረ ማን ጎደለ አንተን የጠበቀ
ፀና ልቤ በእግዚያብሔር ይህን እያወቀ

VERSE 2
በዓለም ስፍራ ባይኖረኝም ብሆንም ጎስቋላ
አምላኬ ሆይ ካንተ በቀር አልሄድ ወደ ሌላ
ጌታዬ ሆይ በፍለጋህ ወጣሁ ከመቃብር
ስመሰክር እኖራለሁ ስራህን ስናገር

VERSE 3
ቀን ለክተህ ጊዜን አይተህ ሰውን የማትከዳ
ያለወረት ትመጣለህ እኔን ልትረዳ
ከነኤልያብ ወንድሞቼ ባልስተካከልም
ማማ ሆነህ ከፍ አደረከኸኝ አንተ ሰው አትንቅም

VERSE 4
እንደ እናት ልጅ እንዳልቆጥርህ
ከዚህም ትበልጣለህ
ካንተ በቀር ያፈቀረኝ በምድር ስለሌለ
ስለስምህ መነቀፌ ክብሬ ነው ማዕረጌ

VERSE 5
በምን መንገድ ላስደስትህ እንደምን አድርጌ',
      lyrics_transliteration = 'At’twal golobetal bileh satnqegn
Lezih yadereskeኸgn Getaye ene man negn
Yimolal ayqerm beante sheleqoye
T’ebqalehu ena qenhn Getaye (x2)

VERSE 1
Hezen ts’lmet kifu zemen biget’megnm enkwa
Yalfal hulum tarik hono befith sileka
Man afere man godele anten yet’ebeqe
Ts’ena libe beegziyabher yihn eyaweqe

VERSE 2
Bealem sifra baynoregnm bihonm gosqwala
Amlake hoy kante beqer alhed wede lela
Getaye hoy beflegah wet’ahu kemeqabr
Simesekr enoralehu sirahn sinager

VERSE 3
Qen lekteh gizen ayteh sewn yematkeda
Yaleweret timet’aleh enen litreda
Keneelyab wendmoche balstekakelm
Mama honeh kef aderekeኸgn ante sew atnqm

VERSE 4
Ende enat lij endalqot’rh
Kezihm tibelt’aleh
Kante beqer yafeqeregn bemdr silelele
Silesmh meneqefe kibre new maerege

VERSE 5
Bemn menged lasdesth endemn adrge',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'atetowal-godelobetal-bay-kesis-ashenafi-mzemur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 1
ሀዘን ፅልመት ክፉ ዘመን ቢገጥመኝም እንኳ
ያልፋል ሁሉም ታሪክ ሆኖ በፊትህ ሲለካ
ማን አፈረ ማን ጎደለ አንተን የጠበቀ
ፀና ልቤ በእግዚያብሔር ይህን እያወቀ

CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 2
በዓለም ስፍራ ባይኖረኝም ብሆንም ጎስቋላ
አምላኬ ሆይ ካንተ በቀር አልሄድ ወደ ሌላ
ጌታዬ ሆይ በፍለጋህ ወጣሁ ከመቃብር
ስመሰክር እኖራለሁ ስራህን ስናገር

CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 3
ቀን ለክተህ ጊዜን አይተህ ሰውን የማትከዳ
ያለወረት ትመጣለህ እኔን ልትረዳ
ከነኤልያብ ወንድሞቼ ባልስተካከልም
ማማ ሆነህ ከፍ አደረከኸኝ አንተ ሰው አትንቅም

CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 4
እንደ እናት ልጅ እንዳልቆጥርህ
ከዚህም ትበልጣለህ
ካንተ በቀር ያፈቀረኝ በምድር ስለሌለ
ስለስምህ መነቀፌ ክብሬ ነው ማዕረጌ

CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)

VERSE 5
በምን መንገድ ላስደስትህ እንደምን አድርጌ

CHORUS
አጥቷል ጎሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኸኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም በአንተ ሸለቆዬ
ጠብቃለሁ እና ቀንህን ጌታዬ (x2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
At’twal golobetal bileh satnqegn
Lezih yadereskeኸgn Getaye ene man negn
Yimolal ayqerm beante sheleqoye
T’ebqalehu ena qenhn Getaye (x2)

VERSE 1
Hezen ts’lmet kifu zemen biget’megnm enkwa
Yalfal hulum tarik hono befith sileka
Man afere man godele anten yet’ebeqe
Ts’ena libe beegziyabher yihn eyaweqe

CHORUS
At’twal golobetal bileh satnqegn
Lezih yadereskeኸgn Getaye ene man negn
Yimolal ayqerm beante sheleqoye
T’ebqalehu ena qenhn Getaye (x2)

VERSE 2
Bealem sifra baynoregnm bihonm gosqwala
Amlake hoy kante beqer alhed wede lela
Getaye hoy beflegah wet’ahu kemeqabr
Simesekr enoralehu sirahn sinager

CHORUS
At’twal golobetal bileh satnqegn
Lezih yadereskeኸgn Getaye ene man negn
Yimolal ayqerm beante sheleqoye
T’ebqalehu ena qenhn Getaye (x2)

VERSE 3
Qen lekteh gizen ayteh sewn yematkeda
Yaleweret timet’aleh enen litreda
Keneelyab wendmoche balstekakelm
Mama honeh kef aderekeኸgn ante sew atnqm

CHORUS
At’twal golobetal bileh satnqegn
Lezih yadereskeኸgn Getaye ene man negn
Yimolal ayqerm beante sheleqoye
T’ebqalehu ena qenhn Getaye (x2)

VERSE 4
Ende enat lij endalqot’rh
Kezihm tibelt’aleh
Kante beqer yafeqeregn bemdr silelele
Silesmh meneqefe kibre new maerege

CHORUS
At’twal golobetal bileh satnqegn
Lezih yadereskeኸgn Getaye ene man negn
Yimolal ayqerm beante sheleqoye
T’ebqalehu ena qenhn Getaye (x2)

VERSE 5
Bemn menged lasdesth endemn adrge

CHORUS
At’twal golobetal bileh satnqegn
Lezih yadereskeኸgn Getaye ene man negn
Yimolal ayqerm beante sheleqoye
T’ebqalehu ena qenhn Getaye (x2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'atetowal-godelobetal-bay-kesis-ashenafi-mzemur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Atilef Yetewahidon Diniber (atilef-yetewahidon-diniber)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 1
የአብና የወልድ የመንፈስ ቅዱስን
ሶስትነቱን አምነን ፍፁም አንድነቱን
ቅዱሳት መፃህፍት እንደመሰከሩ
የስላሴ አኗኗር ድንቅ ነው ምስጢሩ

VERSE 2
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር
የአምላክን ሰው መሆን የስጋዌን ነገር
የአለሙን ድህነት ተዋህዶ ትመስክር

VERSE 3
ያለ መደባለቅ ያለ መቀላቀል
ስጋን መዋሃዱ ከማርያም ድንግል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 4
የመቅደሷ ስርዓት በውስጧ የሚታየው
የተዋህዶ ነገር ምንጩ ከሰማይ ነው
ትርጉሙን ተረዱ ምስጢሩን ጠይቁ
በኑፋቄ ገመድ እንዳትታነቁ

VERSE 5
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር
በፀበል በመስቀል በእምነት ሲታበሱ
በውስጧ ይገኛል የእግዚአብሄር ፈውሱ

VERSE 6
የአለመጠራጠር በእምነት ቅረቡ
የመለኮት ስራ ብዙ ነው ጥበቡ
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 7
ዓለሙን ሊያሳልፍ ይመጣል ዳግመኛ
በፍርዱ ወንበር ፊት እንቆማለን እኛ
በመለኮት ስልጣን በክብር ይገለፃል
አማላጅ አይደለም ኢየሱስ ይፈርዳል

VERSE 8
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር',
      lyrics_transliteration = 'Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 1
Yeabna yeweld yemenfes qidusn
Sostnetun amnen fits’um andnetun
Qidusat mets’ahft endemesekeru
Yeslase anwanwar dinq new mist’iru

VERSE 2
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer
Yeamlakn sew mehon yesgawen neger
Yealemun dihnet Tewahedo timeskr

VERSE 3
Yale medebaleq yale meqelaqel
Sigan mewahadu kemaryam Dingil
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 4
Yemeqdeswa sirat bewst’wa yemitayew
Yetewahdo neger minch’u kesemay new
Tirgumun teredu mist’irun t’eyqu
Benufaqe gemed endattanequ

VERSE 5
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer
Bets’ebel bemesqel beemnet sitabesu
Bewst’wa yigegnal yeegziabher fewsu

VERSE 6
Yealemet’erat’er beemnet qirebu
Yemelekot sira bizu new t’bebu
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 7
Alemun liyasalf yimet’al dagmegna
Befrdu wenber fit enqomalen egna
Bemelekot silt’an bekbr yigelets’al
Amalaj aydelem Iyesus yiferdal

VERSE 8
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'atilef-yetewahidon-diniber'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 1
የአብና የወልድ የመንፈስ ቅዱስን
ሶስትነቱን አምነን ፍፁም አንድነቱን
ቅዱሳት መፃህፍት እንደመሰከሩ
የስላሴ አኗኗር ድንቅ ነው ምስጢሩ

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 2
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር
የአምላክን ሰው መሆን የስጋዌን ነገር
የአለሙን ድህነት ተዋህዶ ትመስክር

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 3
ያለ መደባለቅ ያለ መቀላቀል
ስጋን መዋሃዱ ከማርያም ድንግል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 4
የመቅደሷ ስርዓት በውስጧ የሚታየው
የተዋህዶ ነገር ምንጩ ከሰማይ ነው
ትርጉሙን ተረዱ ምስጢሩን ጠይቁ
በኑፋቄ ገመድ እንዳትታነቁ

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 5
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር
በፀበል በመስቀል በእምነት ሲታበሱ
በውስጧ ይገኛል የእግዚአብሄር ፈውሱ

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 6
የአለመጠራጠር በእምነት ቅረቡ
የመለኮት ስራ ብዙ ነው ጥበቡ
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 7
ዓለሙን ሊያሳልፍ ይመጣል ዳግመኛ
በፍርዱ ወንበር ፊት እንቆማለን እኛ
በመለኮት ስልጣን በክብር ይገለፃል
አማላጅ አይደለም ኢየሱስ ይፈርዳል

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

VERSE 8
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር

CHORUS
አባቶችን ጠይቅ ይነግሩሀል
የእምነትን ምስጢር ያስረዱሀል
አትለፍ የተዋህዶን ድንበር
በውጪ ተጥለህ እንዳትቀር'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 1
Yeabna yeweld yemenfes qidusn
Sostnetun amnen fits’um andnetun
Qidusat mets’ahft endemesekeru
Yeslase anwanwar dinq new mist’iru

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 2
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer
Yeamlakn sew mehon yesgawen neger
Yealemun dihnet Tewahedo timeskr

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 3
Yale medebaleq yale meqelaqel
Sigan mewahadu kemaryam Dingil
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 4
Yemeqdeswa sirat bewst’wa yemitayew
Yetewahdo neger minch’u kesemay new
Tirgumun teredu mist’irun t’eyqu
Benufaqe gemed endattanequ

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 5
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer
Bets’ebel bemesqel beemnet sitabesu
Bewst’wa yigegnal yeegziabher fewsu

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 6
Yealemet’erat’er beemnet qirebu
Yemelekot sira bizu new t’bebu
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 7
Alemun liyasalf yimet’al dagmegna
Befrdu wenber fit enqomalen egna
Bemelekot silt’an bekbr yigelets’al
Amalaj aydelem Iyesus yiferdal

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

VERSE 8
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer

CHORUS
Abatochn t’eyq yinegruhel
Yeemnetn mist’ir yasreduhel
Atlef yetewahdon dinber
Bewch’i tet’leh endatqer'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'atilef-yetewahidon-diniber', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Atual Godlobetal by Zemari D/n Begna Girma ortodox mezmur (atual-godlobetal-by-zemari-d-n-begna-girma-ortodox-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ

VERSE 1
ሃዘን ጽልመት ክፉ ዘመን ቢገጥመኝም እንኳ
ያልፋል ሁሉም ታሪክ ሆኖ በፊትህ ሲለካ
ማን አፈረ ማን ጎደለ አንተን የጠበቀ
ጸና ልቤ በእግዚአብሔር ይህን እያወቀ

VERSE 2
በዓለም ስፍራ ባይኖረኝም ብሆንም ጎስቋላ
አምላኬ ሆይ ካንተ በቀር አልሄድ ወደ ሌላ
ጌታዬ ሆይ በፍለጋህ ወጣሁ ከመቃብር
ስመሰክር እኖራለሁ ሥራህን ስናገር

VERSE 3
ቀን ለክተህ ጊዜን አይተህ ሰውን የማትከዳ
ያለወረት ትመጣለህ እኔን ልትረዳ
ከነ ኤልያብ ወንድሞቼ ባልስተካከልም
ማማ ሆነህ ከፍ አረከኝ አንተ ሰው አትጥልም

VERSE 4
እንደ እናት ልጅ እንዳልቆጥርህ ከዚም ትበልጣለህ
ካንተ በቀር ያፈቀረኝ በምድር ስለሌለ
ስለ ሥምህ መነቀፌ ክብሬ ነው ማዕረጌ
በምን መንገድ ላስደስትህ እንደምን አድርጌ',
      lyrics_transliteration = 'At’twal godlobetal bileh satnqegn
Lezih yadereskegn Getaye ene man negn
Yimolal ayqerm bante sheleqoye
T’ebqalehuna qenhn Getaye

VERSE 1
Hazen ts’lmet kifu zemen biget’megnm enkwa
Yalfal hulum tarik hono befith sileka
Man afere man godele anten yet’ebeqe
Ts’ena libe beEgziabher yihn eyaweqe

VERSE 2
Bealem sifra baynoregnm bihonm gosqwala
Amlake hoy kante beqer alhed wede lela
Getaye hoy beflegah wet’ahu kemeqabr
Simesekr enoralehu sirahn sinager

VERSE 3
Qen lekteh gizen ayteh sewn yematkeda
Yaleweret timet’aleh enen litreda
Kene elyab wendmoche balstekakelm
Mama honeh kef arekegn ante sew att’lm

VERSE 4
Ende enat lij endalqot’rh kezim tibelt’aleh
Kante beqer yafeqeregn bemdr silelele
Sile simh meneqefe kibre new maerege
Bemn menged lasdesth endemn adrge',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'atual-godlobetal-by-zemari-d-n-begna-girma-ortodox-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ

VERSE 1
ሃዘን ጽልመት ክፉ ዘመን ቢገጥመኝም እንኳ
ያልፋል ሁሉም ታሪክ ሆኖ በፊትህ ሲለካ
ማን አፈረ ማን ጎደለ አንተን የጠበቀ
ጸና ልቤ በእግዚአብሔር ይህን እያወቀ

CHORUS
አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ

VERSE 2
በዓለም ስፍራ ባይኖረኝም ብሆንም ጎስቋላ
አምላኬ ሆይ ካንተ በቀር አልሄድ ወደ ሌላ
ጌታዬ ሆይ በፍለጋህ ወጣሁ ከመቃብር
ስመሰክር እኖራለሁ ሥራህን ስናገር

CHORUS
አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ

VERSE 3
ቀን ለክተህ ጊዜን አይተህ ሰውን የማትከዳ
ያለወረት ትመጣለህ እኔን ልትረዳ
ከነ ኤልያብ ወንድሞቼ ባልስተካከልም
ማማ ሆነህ ከፍ አረከኝ አንተ ሰው አትጥልም

CHORUS
አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ

VERSE 4
እንደ እናት ልጅ እንዳልቆጥርህ ከዚም ትበልጣለህ
ካንተ በቀር ያፈቀረኝ በምድር ስለሌለ
ስለ ሥምህ መነቀፌ ክብሬ ነው ማዕረጌ
በምን መንገድ ላስደስትህ እንደምን አድርጌ

CHORUS
አጥቷል ጎድሎበታል ብለህ ሳትንቀኝ
ለዚህ ያደረስከኝ ጌታዬ እኔ ማን ነኝ
ይሞላል አይቀርም ባንተ ሸለቆዬ
ጠብቃለሁና ቀንህን ጌታዬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
At’twal godlobetal bileh satnqegn
Lezih yadereskegn Getaye ene man negn
Yimolal ayqerm bante sheleqoye
T’ebqalehuna qenhn Getaye

VERSE 1
Hazen ts’lmet kifu zemen biget’megnm enkwa
Yalfal hulum tarik hono befith sileka
Man afere man godele anten yet’ebeqe
Ts’ena libe beEgziabher yihn eyaweqe

CHORUS
At’twal godlobetal bileh satnqegn
Lezih yadereskegn Getaye ene man negn
Yimolal ayqerm bante sheleqoye
T’ebqalehuna qenhn Getaye

VERSE 2
Bealem sifra baynoregnm bihonm gosqwala
Amlake hoy kante beqer alhed wede lela
Getaye hoy beflegah wet’ahu kemeqabr
Simesekr enoralehu sirahn sinager

CHORUS
At’twal godlobetal bileh satnqegn
Lezih yadereskegn Getaye ene man negn
Yimolal ayqerm bante sheleqoye
T’ebqalehuna qenhn Getaye

VERSE 3
Qen lekteh gizen ayteh sewn yematkeda
Yaleweret timet’aleh enen litreda
Kene elyab wendmoche balstekakelm
Mama honeh kef arekegn ante sew att’lm

CHORUS
At’twal godlobetal bileh satnqegn
Lezih yadereskegn Getaye ene man negn
Yimolal ayqerm bante sheleqoye
T’ebqalehuna qenhn Getaye

VERSE 4
Ende enat lij endalqot’rh kezim tibelt’aleh
Kante beqer yafeqeregn bemdr silelele
Sile simh meneqefe kibre new maerege
Bemn menged lasdesth endemn adrge

CHORUS
At’twal godlobetal bileh satnqegn
Lezih yadereskegn Getaye ene man negn
Yimolal ayqerm bante sheleqoye
T’ebqalehuna qenhn Getaye'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'atual-godlobetal-by-zemari-d-n-begna-girma-ortodox-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Awde Amet le Barko (awde-amet-le-barko)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ዐውደ ዓመት ለባርኮ ባርኮ ዐውደ ዓመት (2)
ንዒ ማርያም ለምህረት ወሣልህ (2)

VERSE 1
ዐውደ ዓመት ለባርኮ ባርኮ ዐውደ ዓመት (2)
ንዒ ማርያም ለምህረት ወሣልህ (2)',
      lyrics_transliteration = 'Awde amet le barko Barko awde amet (2)
Nei Mariam le mihret wesalihi (2)

VERSE 1
Awde amet le barko Barko awde amet (2)
Nei Mariam le mihret wesalihi (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'awde-amet-le-barko'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዐውደ ዓመት ለባርኮ ባርኮ ዐውደ ዓመት (2)
ንዒ ማርያም ለምህረት ወሣልህ (2)

VERSE 1
ዐውደ ዓመት ለባርኮ ባርኮ ዐውደ ዓመት (2)
ንዒ ማርያም ለምህረት ወሣልህ (2)

CHORUS
ዐውደ ዓመት ለባርኮ ባርኮ ዐውደ ዓመት (2)
ንዒ ማርያም ለምህረት ወሣልህ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Awde amet le barko Barko awde amet (2)
Nei Mariam le mihret wesalihi (2)

VERSE 1
Awde amet le barko Barko awde amet (2)
Nei Mariam le mihret wesalihi (2)

CHORUS
Awde amet le barko Barko awde amet (2)
Nei Mariam le mihret wesalihi (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'awde-amet-le-barko', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Awedesegn Ephrem (awedesegn-ephrem)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 1
ልቡ ያዘነ አዳምን ሊያድን ጌታ ወደደ
ዳግሚት ሰማይ ማደሪያው ልትሆን እሱ ፈቀደ
የሰማይ ምስጢር በማህጸንሽ ተከናወነ
ከዘሩ ቀርተሽ በንጽሕናሽ የሰው ዘር ዳነ

VERSE 2
ሰዐሊ ለነ (፪)
አእምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን

VERSE 3
በሔዋን ምክንያት በለስዋን በልተን ገነት ቢዘጋ
በአንቺ እናትነት ዳግም ተዛመድን ከአምላካችንጋ
ትውልድ ሁሉ ስምሽን በክብር አመሰገነ
የሲዖል ቀንበር በላያችን ላይ ስላልተጫነ

VERSE 4
ሰዐሊ ለነ (፪)
አእምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን

VERSE 5
የእዳ ደብዳቤ ተቀዳደደ የባርነቱ
አዳም ሔዋንም ከእስራታቸው ወጡ ተፈቱ
የሲዖል ጽልመት በልጅሽ ጠፍቶ ብርሃን ሆነ
እረፍት አገኘን የምሕረት ዓመት ባንቺ ዘመነ

VERSE 6
ሰዐሊ ለነ (፪)
አዕምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን

VERSE 7
ሙሴ በሲና ሳትቃጠይ ያየሽ ሐመልማል
እግዚአብሔር መርጦሽ በማህጸንሽ ዙፋኑን ተክሏል
የዲያብሎስን ጥበብ እንዲያፈርስ አምላክ ሰው ሆነ
በልጅሽ መሞት መዳናችንም ተከናወነ

VERSE 8
ሰዐሊ ለነ (፪)',
      lyrics_transliteration = 'Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 1
Libu yazene adamn liyadn Geta wedede
Dagmit semay maderiyaw lithon esu feqede
Yesemay mist’ir bemahts’ensh tekenawene
Kezeru qertesh bents’hnash yesew zer dane

VERSE 2
Seali lene (2)
Aemrown libun saybn asadribn
Ts’egawn kibrun endaynesan lemgnln

VERSE 3
Behewan miknyat beleswan belten genet bizega
Beanchi enatnet dagm tezamedn keamlakachnga
Tiwld hulu simshn bekbr amesegene
Yesiol qenber belayachn lay silaltech’ane

VERSE 4
Seali lene (2)
Aemrown libun saybn asadribn
Ts’egawn kibrun endaynesan lemgnln

VERSE 5
Yeeda debdabe teqedadede yebarnetu
Adam hewanm keesratachew wet’u tefetu
Yesiol ts’lmet beljsh t’efto birhan hone
Ereft agegnen yemhret amet banchi zemene

VERSE 6
Seali lene (2)
Aemrown libun saybn asadribn
Ts’egawn kibrun endaynesan lemgnln

VERSE 7
Muse besina satqat’ey yayesh hemelmal
Egziabher mert’osh bemahts’ensh zufanun teklwal
Yediyablosn t’beb endiyafers amlak sew hone
Beljsh memot medanachnm tekenawene

VERSE 8
Seali lene (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'awedesegn-ephrem'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 1
ልቡ ያዘነ አዳምን ሊያድን ጌታ ወደደ
ዳግሚት ሰማይ ማደሪያው ልትሆን እሱ ፈቀደ
የሰማይ ምስጢር በማህጸንሽ ተከናወነ
ከዘሩ ቀርተሽ በንጽሕናሽ የሰው ዘር ዳነ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 2
ሰዐሊ ለነ (፪)
አእምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን
አዝ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 3
በሔዋን ምክንያት በለስዋን በልተን ገነት ቢዘጋ
በአንቺ እናትነት ዳግም ተዛመድን ከአምላካችንጋ
ትውልድ ሁሉ ስምሽን በክብር አመሰገነ
የሲዖል ቀንበር በላያችን ላይ ስላልተጫነ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 4
ሰዐሊ ለነ (፪)
አእምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን
አዝ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 5
የእዳ ደብዳቤ ተቀዳደደ የባርነቱ
አዳም ሔዋንም ከእስራታቸው ወጡ ተፈቱ
የሲዖል ጽልመት በልጅሽ ጠፍቶ ብርሃን ሆነ
እረፍት አገኘን የምሕረት ዓመት ባንቺ ዘመነ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 6
ሰዐሊ ለነ (፪)
አዕምሮውን ልቡን ሳይብን አሳድሪብን
ጸጋውን ክብሩን እንዳይነሳን ለምኝልን
አዝ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 7
ሙሴ በሲና ሳትቃጠይ ያየሽ ሐመልማል
እግዚአብሔር መርጦሽ በማህጸንሽ ዙፋኑን ተክሏል
የዲያብሎስን ጥበብ እንዲያፈርስ አምላክ ሰው ሆነ
በልጅሽ መሞት መዳናችንም ተከናወነ

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና

VERSE 8
ሰዐሊ ለነ (፪)

CHORUS
አወድሰኝ ኤፍሬም ብላ ጠየቀችው ድንግል እናታችን
ባርክኒ ብሎ ወገቡን ታጠቀ ኤፍሬም አባታችን
የልጄ በረከት ይደርብህ ብላው ጀመረ ምስጋና
ወደ ብርሃን ድንኳን ወደ ተከበረው ደራሲው ገባና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 1
Libu yazene adamn liyadn Geta wedede
Dagmit semay maderiyaw lithon esu feqede
Yesemay mist’ir bemahts’ensh tekenawene
Kezeru qertesh bents’hnash yesew zer dane

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 2
Seali lene (2)
Aemrown libun saybn asadribn
Ts’egawn kibrun endaynesan lemgnln
CHORUS

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 3
Behewan miknyat beleswan belten genet bizega
Beanchi enatnet dagm tezamedn keamlakachnga
Tiwld hulu simshn bekbr amesegene
Yesiol qenber belayachn lay silaltech’ane

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 4
Seali lene (2)
Aemrown libun saybn asadribn
Ts’egawn kibrun endaynesan lemgnln
CHORUS

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 5
Yeeda debdabe teqedadede yebarnetu
Adam hewanm keesratachew wet’u tefetu
Yesiol ts’lmet beljsh t’efto birhan hone
Ereft agegnen yemhret amet banchi zemene

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 6
Seali lene (2)
Aemrown libun saybn asadribn
Ts’egawn kibrun endaynesan lemgnln
CHORUS

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 7
Muse besina satqat’ey yayesh hemelmal
Egziabher mert’osh bemahts’ensh zufanun teklwal
Yediyablosn t’beb endiyafers amlak sew hone
Beljsh memot medanachnm tekenawene

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana

VERSE 8
Seali lene (2)

CHORUS
Awedsegn efrem bila t’eyeqechw Dingil enatachn
Barkni bilo wegebun tat’eqe efrem Abatachen
Yelje bereket yiderbh bilaw jemere misgana
Wede birhan dinkwan wede tekeberew derasiw gebana'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'awedesegn-ephrem', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ayewate beayene / Best Ethiopian Orthodox Mezmure (ayewate-beayene-best-ethiopian-orthodox-mezmure)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 1
አዝ፡ //
ድካምና እንቅልፍ እንደምን ሊረታን
ድንጋይ ብንተራስ ፍቅርሽ አያስተኛን
ዓይኔ ቢከደን አለሽ በምናቤ

VERSE 2
አልተከለልሽም ነግሰሻል በልቤ/2/
አዝ፡ //
መረማመጃ የሎዛ መሰላል
የዜማ በቱ የመቅደስ ጸናፅል

VERSE 3
የሰማይ ንጉሥ በበላይሽ አለ
ድንኳን አድርጎ አንቺን የተከለ/2/
አዝ፡ //
ስምሽ በሁሉ ስለተወደደ

VERSE 4
ድንግል ለክብርሽ ፍጥረት አረገደ
ካላመኑት ዘንድ ቢሆንም ዝምታ
ከገብርኤል ነው የስምሽ ሰላምታ/2/
አዝ፡ //

VERSE 5
ሳደርስ ውደሴ መፃፌን ገልጬ
ተመላለስኩኝ አይኔ እንባ አየረጨ
በገናን ዳዊት መሰንቆም እዝራ
ሰጡኝ ላወድስ በክብሩ ተራራ/2/',
      lyrics_transliteration = 'Ayehwat beayne ashagre
Yeyaredn wib zimare
Teqegnehu ende abatoche
Ejen lekbrwa zergche

VERSE 1
Dikamna enqlf endemn liretan
Dingay binteras fiqrsh ayastegnan
Ayne bikeden alesh bemnabe

VERSE 2
Altekelelshm negseshal belbe (2)
Meremameja yeloza meselal
Yezema betu yemeqdes ts’enats’l

VERSE 3
Yesemay nigus bebelaysh ale
Dinkwan adrgo anchin yetekele (2)
Simsh behulu siletewedede

VERSE 4
Dingil lekbrsh fit’ret aregede
Kalamenut zend bihonm zimta
Kegebrel new yesmsh selamta (2)

VERSE 5
Saders widese mets’afen gelch’e
Temelaleskugn ayne enba ayerech’e
Begenan dawit mesenqom ezra
Set’ugn laweds bekbru terara (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ayewate-beayene-best-ethiopian-orthodox-mezmure'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 1
አዝ፡ //
ድካምና እንቅልፍ እንደምን ሊረታን
ድንጋይ ብንተራስ ፍቅርሽ አያስተኛን
ዓይኔ ቢከደን አለሽ በምናቤ

CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 2
አልተከለልሽም ነግሰሻል በልቤ/2/
አዝ፡ //
መረማመጃ የሎዛ መሰላል
የዜማ በቱ የመቅደስ ጸናፅል

CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 3
የሰማይ ንጉሥ በበላይሽ አለ
ድንኳን አድርጎ አንቺን የተከለ/2/
አዝ፡ //
ስምሽ በሁሉ ስለተወደደ

CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 4
ድንግል ለክብርሽ ፍጥረት አረገደ
ካላመኑት ዘንድ ቢሆንም ዝምታ
ከገብርኤል ነው የስምሽ ሰላምታ/2/
አዝ፡ //

CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 5
ሳደርስ ውደሴ መፃፌን ገልጬ
ተመላለስኩኝ አይኔ እንባ አየረጨ
በገናን ዳዊት መሰንቆም እዝራ
ሰጡኝ ላወድስ በክብሩ ተራራ/2/

CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ayehwat beayne ashagre
Yeyaredn wib zimare
Teqegnehu ende abatoche
Ejen lekbrwa zergche

VERSE 1
CHORUS
Dikamna enqlf endemn liretan
Dingay binteras fiqrsh ayastegnan
Ayne bikeden alesh bemnabe

CHORUS
Ayehwat beayne ashagre
Yeyaredn wib zimare
Teqegnehu ende abatoche
Ejen lekbrwa zergche

VERSE 2
Altekelelshm negseshal belbe (2)
CHORUS
Meremameja yeloza meselal
Yezema betu yemeqdes ts’enats’l

CHORUS
Ayehwat beayne ashagre
Yeyaredn wib zimare
Teqegnehu ende abatoche
Ejen lekbrwa zergche

VERSE 3
Yesemay nigus bebelaysh ale
Dinkwan adrgo anchin yetekele (2)
CHORUS
Simsh behulu siletewedede

CHORUS
Ayehwat beayne ashagre
Yeyaredn wib zimare
Teqegnehu ende abatoche
Ejen lekbrwa zergche

VERSE 4
Dingil lekbrsh fit’ret aregede
Kalamenut zend bihonm zimta
Kegebrel new yesmsh selamta (2)
CHORUS

CHORUS
Ayehwat beayne ashagre
Yeyaredn wib zimare
Teqegnehu ende abatoche
Ejen lekbrwa zergche

VERSE 5
Saders widese mets’afen gelch’e
Temelaleskugn ayne enba ayerech’e
Begenan dawit mesenqom ezra
Set’ugn laweds bekbru terara (2)

CHORUS
Ayehwat beayne ashagre
Yeyaredn wib zimare
Teqegnehu ende abatoche
Ejen lekbrwa zergche'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ayewate-beayene-best-ethiopian-orthodox-mezmure', v_updated;
  END IF;
  v_total := v_total + v_updated;

  IF v_total <> 100 THEN
    RAISE EXCEPTION 'Batch 01 count mismatch: expected 100, got %', v_total;
  END IF;

  RAISE NOTICE 'SUCCESS: Batch 01 completed: % hymns updated.', v_total;
END $batch_01$;
