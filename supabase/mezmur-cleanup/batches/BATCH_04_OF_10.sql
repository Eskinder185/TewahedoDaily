-- =========================================================================
-- BATCH 04 of 10: 100 Hymns (301 to 400)
-- Target: public.mezmur_data_import
-- Strict 5-Column Concurrency Check + Atomic Transaction
-- =========================================================================

DO $batch_04$
DECLARE
  v_updated integer := 0;
  v_total integer := 0;
BEGIN

  -- Hymn: Enidiwedih (enidiwedih)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እንድወድህ አንተ ታውቃለህ
ጌታዬ ሆይ ሁሉን ታውቃለህ
የኔን አቅም አየሁ ድካሜን
ዶሮ ሳይጮህ ሀሙስ ማታ መካዴን (፪)

VERSE 1
ብዙ ብዙ ተናግሬ ''ባንደቤቴ
ካንተ ጋራ ይሁንልኝ የኔ ሞቴ
ሀሙስ ማታ ጠላት ቀርቦ ቢፈትነኝ
እንደ ስንዴ አበጥሮ |''ካንተ ለየኝ (፪)

VERSE 2
ስሰናከል ''ባደባባይ ስክድህ
ለንስሀ ጠርተኸኛል ባይኖችህ
ዶሮን አዘህ ከእንቅልፌ ቀሰቀስከኝ
ልትመልሰኝ መራራ እንባን |አንተ አደልከኝ(፪)

VERSE 3
ሩጫዬ ሀሙስ ማታ እንዲገታ
አይሰወር አይሸሸግ ''ካንተጌታ
የሚያቆመኝ በዓጸድህ በጆችህ
የደገፈኝ ይቅርታህ ነው |ቸርነትህ(፪)',
      lyrics_transliteration = 'Endwedh ante tawqaleh
Getaye hoy hulun tawqaleh
Yenen aqm ayehu dikamen
Doro saych’oh hemus mata mekaden (2)

VERSE 1
Bizu bizu tenagre ''bandebete
Kante gara yihunlgn yene mote
Hemus mata t’elat qerbo bifetnegn
Ende sinde abet’ro |''kante leyegn (2)

VERSE 2
Sisenakel ''badebabay sikdh
Lenshe t’erteኸgnal baynochh
Doron azeh keenqlfe qeseqeskegn
Litmelsegn merara enban |ante adelkegn (2)

VERSE 3
Ruch’aye hemus mata endigeta
Aysewer ayshesheg ''kantegeta
Yemiyaqomegn beats’edh bejochh
Yedegefegn yiqrtah new |cherneth (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'enidiwedih'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንድወድህ አንተ ታውቃለህ
ጌታዬ ሆይ ሁሉን ታውቃለህ
የኔን አቅም አየሁ ድካሜን
ዶሮ ሳይጮህ ሀሙስ ማታ መካዴን (፪)

VERSE 1
ብዙ ብዙ ተናግሬ ''ባንደቤቴ
ካንተ ጋራ ይሁንልኝ የኔ ሞቴ
ሀሙስ ማታ ጠላት ቀርቦ ቢፈትነኝ
እንደ ስንዴ አበጥሮ |''ካንተ ለየኝ (፪)

CHORUS
እንድወድህ አንተ ታውቃለህ
ጌታዬ ሆይ ሁሉን ታውቃለህ
የኔን አቅም አየሁ ድካሜን
ዶሮ ሳይጮህ ሀሙስ ማታ መካዴን (፪)

VERSE 2
ስሰናከል ''ባደባባይ ስክድህ
ለንስሀ ጠርተኸኛል ባይኖችህ
ዶሮን አዘህ ከእንቅልፌ ቀሰቀስከኝ
ልትመልሰኝ መራራ እንባን |አንተ አደልከኝ(፪)

CHORUS
እንድወድህ አንተ ታውቃለህ
ጌታዬ ሆይ ሁሉን ታውቃለህ
የኔን አቅም አየሁ ድካሜን
ዶሮ ሳይጮህ ሀሙስ ማታ መካዴን (፪)

VERSE 3
ሩጫዬ ሀሙስ ማታ እንዲገታ
አይሰወር አይሸሸግ ''ካንተጌታ
የሚያቆመኝ በዓጸድህ በጆችህ
የደገፈኝ ይቅርታህ ነው |ቸርነትህ(፪)

CHORUS
እንድወድህ አንተ ታውቃለህ
ጌታዬ ሆይ ሁሉን ታውቃለህ
የኔን አቅም አየሁ ድካሜን
ዶሮ ሳይጮህ ሀሙስ ማታ መካዴን (፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Endwedh ante tawqaleh
Getaye hoy hulun tawqaleh
Yenen aqm ayehu dikamen
Doro saych’oh hemus mata mekaden (2)

VERSE 1
Bizu bizu tenagre ''bandebete
Kante gara yihunlgn yene mote
Hemus mata t’elat qerbo bifetnegn
Ende sinde abet’ro |''kante leyegn (2)

CHORUS
Endwedh ante tawqaleh
Getaye hoy hulun tawqaleh
Yenen aqm ayehu dikamen
Doro saych’oh hemus mata mekaden (2)

VERSE 2
Sisenakel ''badebabay sikdh
Lenshe t’erteኸgnal baynochh
Doron azeh keenqlfe qeseqeskegn
Litmelsegn merara enban |ante adelkegn (2)

CHORUS
Endwedh ante tawqaleh
Getaye hoy hulun tawqaleh
Yenen aqm ayehu dikamen
Doro saych’oh hemus mata mekaden (2)

VERSE 3
Ruch’aye hemus mata endigeta
Aysewer ayshesheg ''kantegeta
Yemiyaqomegn beats’edh bejochh
Yedegefegn yiqrtah new |cherneth (2)

CHORUS
Endwedh ante tawqaleh
Getaye hoy hulun tawqaleh
Yenen aqm ayehu dikamen
Doro saych’oh hemus mata mekaden (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'enidiwedih', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eniwedishalen Kidane Mihiret (eniwedishalen-kidane-mihiret)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 1
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻልን ኪዳነምህረት:

VERSE 2
በጨለማ ላሉት ብርሃንን አየ
ለርስቱ ተካፋይ እንዲሆን ተለየ
ወደ ቀድሞ ክብሩ ሊመለስ ዳግመኛ
አንቺ ነበርሽ ተስፋው ለአለም መዳኛ

VERSE 3
እግዚአብሔር ታቦቱ መቆደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳንምህረት

VERSE 4
ያን ሁሉ ዘመናት የፈሰሰው ደም
አለምን ከስራት ሊፈታ አልቻለም
ወደ ሚሻል ኪዳን በደም ሊያሻግረን
ጀምሽን ተዋሕዶ መድኃኒትአለም ዋጀን

VERSE 5
ኧዘ
አለን ብዙ ምክንያት አንቺን ምንወደበት
አለም ያልተረዳው ያላወቀው እውነት
ያወቀ የተረዳ የመዳኑን ምስጢር

VERSE 6
አያፍርም ክብርሽን ቆሞ ለመናገር
እዝ
አውቃለሁ እግዚአብሔር የሰጠሽን ክብር
ላመስግንሽ እኔም ሳልቀንስ ሳልጨምር

VERSE 7
ሚባርክሽ ብሩክ ነውና እናቴ
ኪዳን ምህረት ንገሽ እመቤቴ
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ

VERSE 8
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳንምህረት።',
      lyrics_transliteration = 'LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 1
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshaln kidanemhret:

VERSE 2
Bech’elema lalut birhann aye
Lerstu tekafay endihon teleye
Wede qedmo kibru limeles dagmegna
Anchi nebersh tesfaw lealem medagna

VERSE 3
Egziabher tabotu meqodesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanmhret

VERSE 4
Yan hulu zemenat yefesesew dem
Alemn kesrat lifeta alchalem
Wede mishal kidan bedem liyashagren
Jemshn Tewahedo medhanitalem wajen

VERSE 5
ኧze
Alen bizu miknyat anchin minwedebet
Alem yalteredaw yalaweqew ewnet
Yaweqe yetereda yemedanun mist’ir

VERSE 6
Ayafrm kibrshn qomo lemenager
Ez
Awqalehu Egziabher yeset’eshn kibir
Lamesgnsh enem salqens salch’emr

VERSE 7
Mibarksh biruk newna enate
Kidan mihret nigesh Emebete
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu

VERSE 8
Yekbrachn get’ shlmat
Enwedshalen kidanmhret.',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eniwedishalen-kidane-mihiret'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 1
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻልን ኪዳነምህረት:

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 2
በጨለማ ላሉት ብርሃንን አየ
ለርስቱ ተካፋይ እንዲሆን ተለየ
ወደ ቀድሞ ክብሩ ሊመለስ ዳግመኛ
አንቺ ነበርሽ ተስፋው ለአለም መዳኛ

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 3
እግዚአብሔር ታቦቱ መቆደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳንምህረት

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 4
ያን ሁሉ ዘመናት የፈሰሰው ደም
አለምን ከስራት ሊፈታ አልቻለም
ወደ ሚሻል ኪዳን በደም ሊያሻግረን
ጀምሽን ተዋሕዶ መድኃኒትአለም ዋጀን

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 5
ኧዘ
አለን ብዙ ምክንያት አንቺን ምንወደበት
አለም ያልተረዳው ያላወቀው እውነት
ያወቀ የተረዳ የመዳኑን ምስጢር

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 6
አያፍርም ክብርሽን ቆሞ ለመናገር
እዝ
አውቃለሁ እግዚአብሔር የሰጠሽን ክብር
ላመስግንሽ እኔም ሳልቀንስ ሳልጨምር

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 7
ሚባርክሽ ብሩክ ነውና እናቴ
ኪዳን ምህረት ንገሽ እመቤቴ
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :

VERSE 8
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳንምህረት።

CHORUS
ለእግዚአብሔር ታቦቱ መቅደሱ
ቀርበናል ባንቺ ወደ ንጉሡ
የክብራችን ጌጥ ሽልማት
እንወድሻለን ኪዳነምህረት :'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 1
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshaln kidanemhret:

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 2
Bech’elema lalut birhann aye
Lerstu tekafay endihon teleye
Wede qedmo kibru limeles dagmegna
Anchi nebersh tesfaw lealem medagna

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 3
Egziabher tabotu meqodesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanmhret

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 4
Yan hulu zemenat yefesesew dem
Alemn kesrat lifeta alchalem
Wede mishal kidan bedem liyashagren
Jemshn Tewahedo medhanitalem wajen

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 5
ኧze
Alen bizu miknyat anchin minwedebet
Alem yalteredaw yalaweqew ewnet
Yaweqe yetereda yemedanun mist’ir

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 6
Ayafrm kibrshn qomo lemenager
Ez
Awqalehu Egziabher yeset’eshn kibir
Lamesgnsh enem salqens salch’emr

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 7
Mibarksh biruk newna enate
Kidan mihret nigesh Emebete
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :

VERSE 8
Yekbrachn get’ shlmat
Enwedshalen kidanmhret.

CHORUS
LeEgziabher tabotu meqdesu
Qerbenal banchi wede nigusu
Yekbrachn get’ shlmat
Enwedshalen kidanemhret :'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eniwedishalen-kidane-mihiret', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Enze Yiblu (enze-yiblu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እንዘ ይብሉ ይዜምሩ በልሳን ዘኢያረምም
መንግሥተ ሥላሴ ዘለዓለም /፪/

VERSE 1
ዝም በማይል አንደበታቸው እንዲህ እያሉ ያመሰግኑታል
የሥላሴ መንግሥት ዘለዓለማዊ ነው /፪/',
      lyrics_transliteration = 'Enze yiblu yizemru belisan ze-iyaremem
Mengiste Selase ze-lealem (2)

VERSE 1
Zem bemayil andebetachew endih eyalu yamesegnuwtal
YeSelase mengist ze-lealemawi new (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'enze-yiblu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንዘ ይብሉ ይዜምሩ በልሳን ዘኢያረምም
መንግሥተ ሥላሴ ዘለዓለም /፪/

VERSE 1
ዝም በማይል አንደበታቸው እንዲህ እያሉ ያመሰግኑታል
የሥላሴ መንግሥት ዘለዓለማዊ ነው /፪/

CHORUS
እንዘ ይብሉ ይዜምሩ በልሳን ዘኢያረምም
መንግሥተ ሥላሴ ዘለዓለም /፪/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Enze yiblu yizemru belisan ze-iyaremem
Mengiste Selase ze-lealem (2)

VERSE 1
Zem bemayil andebetachew endih eyalu yamesegnuwtal
YeSelase mengist ze-lealemawi new (2)

CHORUS
Enze yiblu yizemru belisan ze-iyaremem
Mengiste Selase ze-lealem (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'enze-yiblu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: EP Yiheg Fetsame (ep-yiheg-fetsame-4187)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 1
የአማልክት አምላክ የጌቶች ጌታ እግዚአብሔር
ጥንትየሌለው ለአኗኗሩ ለአኳሃኑ ፍጻሜ
ለውርዝውናውም ማርጀት ለዘመኑ ቁጥር ዕድሜ
የከበረ የደነቀ ሥራው ካየነው የሚልቅ

VERSE 2
አንስርትየማይደርሱበት ነው ዓሳዎች የማይዋኙበት ጥልቅ
የአማልክት አምላክ
የጌቶች ጌታ እግዚአብሔር
ጌትነቱ ከሰማነው ኃይሉ ከነገሩን በላይ

VERSE 3
ምድር መረማመጃው ነው የክብሩ ዙፋኑ ሰማይ
ለኃይሉ ድካም የሌለው ለጥበቡ ልኬት ድንበር
በቀልን የማያውቅ የዋህ ክፋት የሌለበትም ቸረ
የአማልክት አምላክ

VERSE 4
የጌቶች ጌታ እግዚአብሔር
ረዳትን የማይሻ ገው ባሌንጀራየሌለው አንድ
ትዕቢተኛን የሚቀጣ ግብዞችን የሚያዋርድ
የሚሸሸገው የሌለው ያውቃል ቀድሞ ስለሚሆነው

VERSE 5
ሁለ እንደ ልብስ ያረጃል እርሱ ግን ዘለዓለም ያው ነው
የአማልክት አምላክ
የጌቶች ጌታ እግዚአብሔር
ኩሊሉትን የሚመረምር ልቡናን የሚፈትን

VERSE 6
ወደ መኖር ያመጣቸው ያልነበሩ ፍጥረታትን
ያለመከልከል ሰጪ ያለመንፈግ ድንቅ ለጋስ
እድፍ የሌለበት ንጹህ ነው በባህሪው ልዩ ቅዱስ
የአማልክት አምላክ

VERSE 7
የጌቶች ጌታ እግዚአብሔር',
      lyrics_transliteration = 'Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 1
Yeamalkt amlak yegetoch Geta Egziabher
T’ntyelelew leanwanwaru leakwahanu fits’ame
Lewrzwnawm marjet lezemenu qut’r edme
Yekebere yedeneqe siraw kayenew yemilq

VERSE 2
Ansrtyemaydersubet new asawoch yemaywagnubet t’lq
Yeamalkt amlak
Yegetoch Geta Egziabher
Getnetu kesemanew haylu kenegerun belay

VERSE 3
Midr meremamejaw new yekbru zufanu semay
Lehaylu dikam yelelew let’bebu liket dinber
Beqeln yemayawq yewah kifat yelelebetm chere
Yeamalkt amlak

VERSE 4
Yegetoch Geta Egziabher
Redatn yemaysha gew balenjerayelelew and
Tiebitegnan yemiqet’a gibzochn yemiyaward
Yemisheshegew yelelew yawqal qedmo silemihonew

VERSE 5
Hule ende libs yarejal ersu gin zelealem yaw new
Yeamalkt amlak
Yegetoch Geta Egziabher
Kulilutn yemimeremr libunan yemifetn

VERSE 6
Wede menor yamet’achew yalneberu fit’retatn
Yalemekelkel sech’i yalemenfeg dinq legas
Edf yelelebet nits’uh new bebahriw liyu Kidus
Yeamalkt amlak

VERSE 7
Yegetoch Geta Egziabher',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ep-yiheg-fetsame-4187'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 1
የአማልክት አምላክ የጌቶች ጌታ እግዚአብሔር
ጥንትየሌለው ለአኗኗሩ ለአኳሃኑ ፍጻሜ
ለውርዝውናውም ማርጀት ለዘመኑ ቁጥር ዕድሜ
የከበረ የደነቀ ሥራው ካየነው የሚልቅ

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 2
አንስርትየማይደርሱበት ነው ዓሳዎች የማይዋኙበት ጥልቅ
የአማልክት አምላክ
የጌቶች ጌታ እግዚአብሔር
ጌትነቱ ከሰማነው ኃይሉ ከነገሩን በላይ

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 3
ምድር መረማመጃው ነው የክብሩ ዙፋኑ ሰማይ
ለኃይሉ ድካም የሌለው ለጥበቡ ልኬት ድንበር
በቀልን የማያውቅ የዋህ ክፋት የሌለበትም ቸረ
የአማልክት አምላክ

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 4
የጌቶች ጌታ እግዚአብሔር
ረዳትን የማይሻ ገው ባሌንጀራየሌለው አንድ
ትዕቢተኛን የሚቀጣ ግብዞችን የሚያዋርድ
የሚሸሸገው የሌለው ያውቃል ቀድሞ ስለሚሆነው

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 5
ሁለ እንደ ልብስ ያረጃል እርሱ ግን ዘለዓለም ያው ነው
የአማልክት አምላክ
የጌቶች ጌታ እግዚአብሔር
ኩሊሉትን የሚመረምር ልቡናን የሚፈትን

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 6
ወደ መኖር ያመጣቸው ያልነበሩ ፍጥረታትን
ያለመከልከል ሰጪ ያለመንፈግ ድንቅ ለጋስ
እድፍ የሌለበት ንጹህ ነው በባህሪው ልዩ ቅዱስ
የአማልክት አምላክ

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር

VERSE 7
የጌቶች ጌታ እግዚአብሔር

CHORUS
በሰማይበምድር የሞላ የጌትነቱ ምስጋና
በቅድስናው ቅዱስ ነው በገናንነቱገናና
በልቡና ማይረዱት በሕሉና የማይገኝ ሥውር
ለመንግስቱ ልክ የሌለው ለአገዛዙ ወሰንድንበር'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 1
Yeamalkt amlak yegetoch Geta Egziabher
T’ntyelelew leanwanwaru leakwahanu fits’ame
Lewrzwnawm marjet lezemenu qut’r edme
Yekebere yedeneqe siraw kayenew yemilq

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 2
Ansrtyemaydersubet new asawoch yemaywagnubet t’lq
Yeamalkt amlak
Yegetoch Geta Egziabher
Getnetu kesemanew haylu kenegerun belay

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 3
Midr meremamejaw new yekbru zufanu semay
Lehaylu dikam yelelew let’bebu liket dinber
Beqeln yemayawq yewah kifat yelelebetm chere
Yeamalkt amlak

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 4
Yegetoch Geta Egziabher
Redatn yemaysha gew balenjerayelelew and
Tiebitegnan yemiqet’a gibzochn yemiyaward
Yemisheshegew yelelew yawqal qedmo silemihonew

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 5
Hule ende libs yarejal ersu gin zelealem yaw new
Yeamalkt amlak
Yegetoch Geta Egziabher
Kulilutn yemimeremr libunan yemifetn

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 6
Wede menor yamet’achew yalneberu fit’retatn
Yalemekelkel sech’i yalemenfeg dinq legas
Edf yelelebet nits’uh new bebahriw liyu Kidus
Yeamalkt amlak

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber

VERSE 7
Yegetoch Geta Egziabher

CHORUS
Besemaybemdr yemola yegetnetu misgana
Beqdsnaw Kidus new begenannetugenana
Belbuna mayredut behluna yemaygegn siwr
Lemengstu lik yelelew leagezazu wesendnber'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ep-yiheg-fetsame-4187', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: EP Yiheg Fetsame (ep-yiheg-fetsame-4192)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 1
ሞቱን ፥ የማይሞተው ጌታ፥
ተመልከቱ ጎልጎታ።
ማየ ሕይወት ሲጠማ ፥ ሲገረፍ መሐሪ፥
ደሙ እንደ ጎርፍ ሲወርድ ውኆችን ሰፋሪ፥

VERSE 2
በሚፈርደው ሲፈርድ መስፍን ፍርደ ገምድል፥
ነፍሱን ሲሰጥ እዩት ሕይወትን የሚያድል።
"ልብስህ ለምን ቀላ" ብለህ የጠየቅህ ነቢይ፥
አሻግረህ ብታየው መለስህ በቃል አቢይ፥

VERSE 3
"ዝም አለ ሥግው ቃል በግፍ አደባባይ፥
እያልህ "ተፈወስን በእርሱ ቁስል ሥቃይ"
የጽዮን ደናግል ውጡ ፣ ተመልከቱ፥
አክሊለ ሦክ ደፍታ እስራኤል እናቱ፥

VERSE 4
ሞሸረችው በሠርግ በቀይ ግምጃ ልብሱ፥
እግዚአ ሰሎሞን እነሆ ንጉሡ።
እዩት የምትወዱት ፣ አልቅሱለት ልቅሶን፥
"ለከ ኃይል ወስብሐት" ፥ በሉ "ኪርያላይሶን"፥

VERSE 5
እንደ ቁጹረ ገጽ በዕንባ ሰባ ዘመን፥
ቢቻለን እንዘን ፣ ቢሳነን እንመን።',
      lyrics_transliteration = 'Qena belu qeranyo:
Eyut aynn yefet’eren:
Merara t’et’a limren.
Hulun chayu singelata:

VERSE 1
Motun : yemaymotew geta:
Temelketu golgota.
Maye hiywet sit’ema : sigeref meheri:
Demu ende gorf siwerd wihochn sefari:

VERSE 2
Bemiferdew siferd mesfn firde gemdl:
Nefsun siset’ eyut hiywetn yemiyadl.
"libsh lemn qela" bileh yet’eyeqh nebiy:
Ashagreh bitayew melesh beqal abiy:

VERSE 3
"zim ale sigw qal begf adebabay:
Eyalh "tefewesn beersu qusl siqay"
Yets’yon denagl wit’u , temelketu:
Aklile sok defta esrael enatu:

VERSE 4
Mosherechw beserg beqey gimja libsu:
Egzia selomon eneho nigusu.
Eyut yemtwedut , alqsulet liqson:
"leke hayl wesbhet" : belu "kiryalayson":

VERSE 5
Ende quts’ure gets’ beenba seba zemen:
Bichalen enzen , bisanen enmen.',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ep-yiheg-fetsame-4192'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 1
ሞቱን ፥ የማይሞተው ጌታ፥
ተመልከቱ ጎልጎታ።
ማየ ሕይወት ሲጠማ ፥ ሲገረፍ መሐሪ፥
ደሙ እንደ ጎርፍ ሲወርድ ውኆችን ሰፋሪ፥

CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 2
በሚፈርደው ሲፈርድ መስፍን ፍርደ ገምድል፥
ነፍሱን ሲሰጥ እዩት ሕይወትን የሚያድል።
"ልብስህ ለምን ቀላ" ብለህ የጠየቅህ ነቢይ፥
አሻግረህ ብታየው መለስህ በቃል አቢይ፥

CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 3
"ዝም አለ ሥግው ቃል በግፍ አደባባይ፥
እያልህ "ተፈወስን በእርሱ ቁስል ሥቃይ"
የጽዮን ደናግል ውጡ ፣ ተመልከቱ፥
አክሊለ ሦክ ደፍታ እስራኤል እናቱ፥

CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 4
ሞሸረችው በሠርግ በቀይ ግምጃ ልብሱ፥
እግዚአ ሰሎሞን እነሆ ንጉሡ።
እዩት የምትወዱት ፣ አልቅሱለት ልቅሶን፥
"ለከ ኃይል ወስብሐት" ፥ በሉ "ኪርያላይሶን"፥

CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥

VERSE 5
እንደ ቁጹረ ገጽ በዕንባ ሰባ ዘመን፥
ቢቻለን እንዘን ፣ ቢሳነን እንመን።

CHORUS
ቀና በሉ ቀራንዮ፥
እዩት ዓይንን የፈጠረን፥
መራራ ጠጣ ሊምረን።
ሁሉን ቻዩ ሲንገላታ፥'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Qena belu qeranyo:
Eyut aynn yefet’eren:
Merara t’et’a limren.
Hulun chayu singelata:

VERSE 1
Motun : yemaymotew geta:
Temelketu golgota.
Maye hiywet sit’ema : sigeref meheri:
Demu ende gorf siwerd wihochn sefari:

CHORUS
Qena belu qeranyo:
Eyut aynn yefet’eren:
Merara t’et’a limren.
Hulun chayu singelata:

VERSE 2
Bemiferdew siferd mesfn firde gemdl:
Nefsun siset’ eyut hiywetn yemiyadl.
"libsh lemn qela" bileh yet’eyeqh nebiy:
Ashagreh bitayew melesh beqal abiy:

CHORUS
Qena belu qeranyo:
Eyut aynn yefet’eren:
Merara t’et’a limren.
Hulun chayu singelata:

VERSE 3
"zim ale sigw qal begf adebabay:
Eyalh "tefewesn beersu qusl siqay"
Yets’yon denagl wit’u , temelketu:
Aklile sok defta esrael enatu:

CHORUS
Qena belu qeranyo:
Eyut aynn yefet’eren:
Merara t’et’a limren.
Hulun chayu singelata:

VERSE 4
Mosherechw beserg beqey gimja libsu:
Egzia selomon eneho nigusu.
Eyut yemtwedut , alqsulet liqson:
"leke hayl wesbhet" : belu "kiryalayson":

CHORUS
Qena belu qeranyo:
Eyut aynn yefet’eren:
Merara t’et’a limren.
Hulun chayu singelata:

VERSE 5
Ende quts’ure gets’ beenba seba zemen:
Bichalen enzen , bisanen enmen.

CHORUS
Qena belu qeranyo:
Eyut aynn yefet’eren:
Merara t’et’a limren.
Hulun chayu singelata:'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ep-yiheg-fetsame-4192', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Erdagn Getaye'' D Zelalem Takele (erdagn-getaye-d-zelalem-takele)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በሚያልፈው ፈተና የማታልፈውን
በታናሽ ነገር አንተ ታላቁን
ምስጋንን ትተው ከንፈሮቼ
እንዳላማርር በ አፌ ስቼ

VERSE 1
እርዳኝ ጌታዬ
የሆነብኝ ነገር ሁሉ ሊያበረታኝ ለኔ ሆነ
አምናለሁ ወድቆ አይወድቅም ክርስቶስ አንተን ያመነ
በውድቀቴ በሀዘኔ ይታየኝ ጌታ ማዳንህ

VERSE 2
ብርታት ስጠኝ የኔ ጌታ በእሳት መሃል ላመስግንህ
እርዳኝ ጌታዬ
ለክፉ አይሁን ልመናዬ
አቅም ስጠኝ ልጠብቅህ መልስ እስኪያገኝ ጥያቄዬ

VERSE 3
ትዕግስት የለው ሰውነቴ ይቸኩላል እስኪፈጸም
የፈለገው ካልሆነለት ማመስገንን አልለመደም
ምክንያት አለህ የኔ ጌታ ሥሕተት አይደል ስትከለክል
በደስታዬ ብቻ ሳይሆን በሀዘኔም ነህ ትክክል

VERSE 4
እርዳኝ ጌታዬ
ለክፉ አይሁን ልመናዬ
አቅም ስጠኝ ልጠብቅህ መልስ እስኪያገኝ ጥያቄዬ
ለዘላቂ ድህነቴ ለጊዜው ነው ስትቀጣኝ

VERSE 5
እንዳልጠፋ አሰበህ ነው ወደኸኝ ነው ስትቆጣኝ
ከቅድስናህ እንድካፈል ከክብርህ እንዳልጎድል
አሳምመኽ ልታድነኝ ሠጠተኸኝ ነው በ ጎ እድል
እርዳኝ ጌታዬ

VERSE 6
ለክፉ አይሁን ልመናዬ
አቅም ስጠኝ ልጠብቅህ መልስ እስኪያገኝ ጥያቄዬ',
      lyrics_transliteration = 'Bemiyalfew fetena yematalfewn
Betanash neger ante talaqun
Misgann titew kenferoche
Endalamarr be afe siche

VERSE 1
Erdagn Getaye
Yehonebgn neger hulu liyaberetagn lene hone
Amnalehu wedqo aywedqm Kristos anten yamene
Bewdqete behezene yitayegn Geta madanh

VERSE 2
Birtat sit’egn yene Geta beesat mehal lamesgnh
Erdagn Getaye
Lekfu ayhun limenaye
Aqm sit’egn lit’ebqh mels eskiyagegn t’yaqeye

VERSE 3
Tiegst yelew sewnete yichekulal eskifets’em
Yefelegew kalhonelet mamesgenn allemedem
Miknyat aleh yene Geta sihtet aydel sitkelekl
Bedestaye bicha sayhon behezenem neh tikkl

VERSE 4
Erdagn Getaye
Lekfu ayhun limenaye
Aqm sit’egn lit’ebqh mels eskiyagegn t’yaqeye
Lezelaqi dihnete legizew new sitqet’agn

VERSE 5
Endalt’efa asebeh new wedeኸgn new sitqot’agn
Keqdsnah endkafel kekbrh endalgodl
Asammeኽ litadnegn set’eteኸgn new be go edl
Erdagn Getaye

VERSE 6
Lekfu ayhun limenaye
Aqm sit’egn lit’ebqh mels eskiyagegn t’yaqeye',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'erdagn-getaye-d-zelalem-takele'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በሚያልፈው ፈተና የማታልፈውን
በታናሽ ነገር አንተ ታላቁን
ምስጋንን ትተው ከንፈሮቼ
እንዳላማርር በ አፌ ስቼ

VERSE 1
እርዳኝ ጌታዬ
የሆነብኝ ነገር ሁሉ ሊያበረታኝ ለኔ ሆነ
አምናለሁ ወድቆ አይወድቅም ክርስቶስ አንተን ያመነ
በውድቀቴ በሀዘኔ ይታየኝ ጌታ ማዳንህ

CHORUS
በሚያልፈው ፈተና የማታልፈውን
በታናሽ ነገር አንተ ታላቁን
ምስጋንን ትተው ከንፈሮቼ
እንዳላማርር በ አፌ ስቼ

VERSE 2
ብርታት ስጠኝ የኔ ጌታ በእሳት መሃል ላመስግንህ
እርዳኝ ጌታዬ
ለክፉ አይሁን ልመናዬ
አቅም ስጠኝ ልጠብቅህ መልስ እስኪያገኝ ጥያቄዬ

CHORUS
በሚያልፈው ፈተና የማታልፈውን
በታናሽ ነገር አንተ ታላቁን
ምስጋንን ትተው ከንፈሮቼ
እንዳላማርር በ አፌ ስቼ

VERSE 3
ትዕግስት የለው ሰውነቴ ይቸኩላል እስኪፈጸም
የፈለገው ካልሆነለት ማመስገንን አልለመደም
ምክንያት አለህ የኔ ጌታ ሥሕተት አይደል ስትከለክል
በደስታዬ ብቻ ሳይሆን በሀዘኔም ነህ ትክክል

CHORUS
በሚያልፈው ፈተና የማታልፈውን
በታናሽ ነገር አንተ ታላቁን
ምስጋንን ትተው ከንፈሮቼ
እንዳላማርር በ አፌ ስቼ

VERSE 4
እርዳኝ ጌታዬ
ለክፉ አይሁን ልመናዬ
አቅም ስጠኝ ልጠብቅህ መልስ እስኪያገኝ ጥያቄዬ
ለዘላቂ ድህነቴ ለጊዜው ነው ስትቀጣኝ

CHORUS
በሚያልፈው ፈተና የማታልፈውን
በታናሽ ነገር አንተ ታላቁን
ምስጋንን ትተው ከንፈሮቼ
እንዳላማርር በ አፌ ስቼ

VERSE 5
እንዳልጠፋ አሰበህ ነው ወደኸኝ ነው ስትቆጣኝ
ከቅድስናህ እንድካፈል ከክብርህ እንዳልጎድል
አሳምመኽ ልታድነኝ ሠጠተኸኝ ነው በ ጎ እድል
እርዳኝ ጌታዬ

CHORUS
በሚያልፈው ፈተና የማታልፈውን
በታናሽ ነገር አንተ ታላቁን
ምስጋንን ትተው ከንፈሮቼ
እንዳላማርር በ አፌ ስቼ

VERSE 6
ለክፉ አይሁን ልመናዬ
አቅም ስጠኝ ልጠብቅህ መልስ እስኪያገኝ ጥያቄዬ

CHORUS
በሚያልፈው ፈተና የማታልፈውን
በታናሽ ነገር አንተ ታላቁን
ምስጋንን ትተው ከንፈሮቼ
እንዳላማርር በ አፌ ስቼ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bemiyalfew fetena yematalfewn
Betanash neger ante talaqun
Misgann titew kenferoche
Endalamarr be afe siche

VERSE 1
Erdagn Getaye
Yehonebgn neger hulu liyaberetagn lene hone
Amnalehu wedqo aywedqm Kristos anten yamene
Bewdqete behezene yitayegn Geta madanh

CHORUS
Bemiyalfew fetena yematalfewn
Betanash neger ante talaqun
Misgann titew kenferoche
Endalamarr be afe siche

VERSE 2
Birtat sit’egn yene Geta beesat mehal lamesgnh
Erdagn Getaye
Lekfu ayhun limenaye
Aqm sit’egn lit’ebqh mels eskiyagegn t’yaqeye

CHORUS
Bemiyalfew fetena yematalfewn
Betanash neger ante talaqun
Misgann titew kenferoche
Endalamarr be afe siche

VERSE 3
Tiegst yelew sewnete yichekulal eskifets’em
Yefelegew kalhonelet mamesgenn allemedem
Miknyat aleh yene Geta sihtet aydel sitkelekl
Bedestaye bicha sayhon behezenem neh tikkl

CHORUS
Bemiyalfew fetena yematalfewn
Betanash neger ante talaqun
Misgann titew kenferoche
Endalamarr be afe siche

VERSE 4
Erdagn Getaye
Lekfu ayhun limenaye
Aqm sit’egn lit’ebqh mels eskiyagegn t’yaqeye
Lezelaqi dihnete legizew new sitqet’agn

CHORUS
Bemiyalfew fetena yematalfewn
Betanash neger ante talaqun
Misgann titew kenferoche
Endalamarr be afe siche

VERSE 5
Endalt’efa asebeh new wedeኸgn new sitqot’agn
Keqdsnah endkafel kekbrh endalgodl
Asammeኽ litadnegn set’eteኸgn new be go edl
Erdagn Getaye

CHORUS
Bemiyalfew fetena yematalfewn
Betanash neger ante talaqun
Misgann titew kenferoche
Endalamarr be afe siche

VERSE 6
Lekfu ayhun limenaye
Aqm sit’egn lit’ebqh mels eskiyagegn t’yaqeye

CHORUS
Bemiyalfew fetena yematalfewn
Betanash neger ante talaqun
Misgann titew kenferoche
Endalamarr be afe siche'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'erdagn-getaye-d-zelalem-takele', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Erdagn Zim Atbel (erdagn-zim-atbel)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 1
አንተን ለማመስገን የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 2
ጨንቆኝ እጣራለሁ ጸጋ አጣ ህይወቴ
እባክህ አርመኝ እርዳኝ መድሃኒቴ

VERSE 3
ልቤ ድንጋይ ሆኖ ቃልህ አልሰበረው
የእጅህን ስራ ጌታዬ አስተካክለው

VERSE 4
የክርስትና ኑሮ ስርዓቱን አፍርሼ
አለቅሳለሁ ጌታ በሃጢያት ተከስሼ

VERSE 5
ሰላምና ፍቅር ነበር ክርስትና
እኔ ግን ተናወጽኩ አልጸናሁም ገና

VERSE 6
ስራዬና ቃልህ አልገናኝ አሉኝ
በጠማማው ልቤ አንተን አሳዘንኩኝ

VERSE 7
ጽኑ መሰረት ነው የህይወት አለት
እየተናወጽኩኝ አቃተኝ መጽናት

VERSE 8
በእረፍት ውሃ ዘንድ በለመለመው ሳር
በጎችህን ሁሉ በፍቅር የምታኖር

VERSE 9
በህይወቴ እንዲታይ የቸርነትህ ክብር
ከደጅህ ተጥዬ ለስምህ ልዘምር',
      lyrics_transliteration = 'Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 1
Antén lemamesgen yeneberegn birtat
Zares tesonognal aqtoñal met’gat

VERSE 2
Chenqoñ et’aralew tsegga ata hiywete
Ebakih armeny erdagn medhanite

VERSE 3
Libe dingay hono qalih alseberew
Ye’ijjih sira getayé astekakilew

VERSE 4
YeKristena nuro sir’atun afirshé
Alek’salew geta behatiyat tekes’shé

VERSE 5
Selamna fiqir neber Kristena
Ené gin tenawets’ku alts’enahum gena

VERSE 6
Sirayena qalih algenagn alugn
Bet’amamaw libe antén asazenkuñ

VERSE 7
Ts’inu meseret new yehiywet alet
Eyetenawets’kuñ aqateñ mets’nat

VERSE 8
Berefit wuha zend belemelemew sar
Begochihn hulu befiqir yemit’anor

VERSE 9
Behiywete endet’ay yetchernetih kibir
Kedejih tet’eyé lesimih lizemir',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'erdagn-zim-atbel'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 1
አንተን ለማመስገን የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 2
ጨንቆኝ እጣራለሁ ጸጋ አጣ ህይወቴ
እባክህ አርመኝ እርዳኝ መድሃኒቴ

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 3
ልቤ ድንጋይ ሆኖ ቃልህ አልሰበረው
የእጅህን ስራ ጌታዬ አስተካክለው

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 4
የክርስትና ኑሮ ስርዓቱን አፍርሼ
አለቅሳለሁ ጌታ በሃጢያት ተከስሼ

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 5
ሰላምና ፍቅር ነበር ክርስትና
እኔ ግን ተናወጽኩ አልጸናሁም ገና

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 6
ስራዬና ቃልህ አልገናኝ አሉኝ
በጠማማው ልቤ አንተን አሳዘንኩኝ

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 7
ጽኑ መሰረት ነው የህይወት አለት
እየተናወጽኩኝ አቃተኝ መጽናት

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 8
በእረፍት ውሃ ዘንድ በለመለመው ሳር
በጎችህን ሁሉ በፍቅር የምታኖር

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 9
በህይወቴ እንዲታይ የቸርነትህ ክብር
ከደጅህ ተጥዬ ለስምህ ልዘምር

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 1
Antén lemamesgen yeneberegn birtat
Zares tesonognal aqtoñal met’gat

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 2
Chenqoñ et’aralew tsegga ata hiywete
Ebakih armeny erdagn medhanite

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 3
Libe dingay hono qalih alseberew
Ye’ijjih sira getayé astekakilew

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 4
YeKristena nuro sir’atun afirshé
Alek’salew geta behatiyat tekes’shé

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 5
Selamna fiqir neber Kristena
Ené gin tenawets’ku alts’enahum gena

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 6
Sirayena qalih algenagn alugn
Bet’amamaw libe antén asazenkuñ

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 7
Ts’inu meseret new yehiywet alet
Eyetenawets’kuñ aqateñ mets’nat

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 8
Berefit wuha zend belemelemew sar
Begochihn hulu befiqir yemit’anor

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 9
Behiywete endet’ay yetchernetih kibir
Kedejih tet’eyé lesimih lizemir

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'erdagn-zim-atbel', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Erefitish (erefitish)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 1
ሞትሽ በወርኀ ጥር ነሐሴ መቃብርሽ
ውበት ሰጥተውታል ማርያም ሆይ ለክብርሽ
ዘካርያስ ያያት ተቅዋመ ማኅቶት
አማናዊት ፅዮን ማኅደረ መለኮት

VERSE 2
ቶማስ በደመና ዕርገቷ እየታየው
ምስክር ሊሆነው ሰበኗ ተሰጠው
ሐዋርያት በአንድ ልብ ሱባዔ ጀምረው
ትንሣኤዋን ሳናይ እንዴት ቀረን ብለው

VERSE 3
ጾም ጸሎታቸውን አምላክ ተቀበለው
ትኩስ አድርጎ በድኗን ነሐሴ ሰጣቸው
ከመቃብር ሳትቀር ድንግል ተነስታለች
ለሁሉ ሐዋርያት ነሃሴ ታይታለች

VERSE 4
በልጇ እጅ ቆርባ በክብር ዐርጋለች
በልዕልና ሆና በጌታ ቀኝ አለች
በተዋህዶ እምነት ቀናኢ የሆንን
የምልጃዋን ጸሎት አምነን የቀረብን

VERSE 5
የአስራት ሀገሯ ኢትዮጵያ ናት ያልን
ድንግል በፍልሰቷ ጸጋዋን ታልብሰን',
      lyrics_transliteration = 'Ereftsh bet’r nehese meqabrsh (2)
Lesemaw yigermal teamrsh sineger
Bezelalem fida begehanem esat
Nefsat endayt’efu astaraqi enat

VERSE 1
Motsh bewerhe t’r nehese meqabrsh
Wibet set’tewtal Maryam hoy lekbrsh
Zekaryas yayat teqwame mahtot
Amanawit ts’yon mahdere melekot

VERSE 2
Tomas bedemena ergetwa eyetayew
Miskr lihonew sebenwa teset’ew
Hewaryat beand lib subae jemrew
Tinsaewan sanay endet qeren bilew

VERSE 3
Ts’om ts’elotachewn amlak teqebelew
Tikus adrgo bednwan nehese set’achew
Kemeqabr satqer Dingil tenestalech
Lehulu hewaryat nehase taytalech

VERSE 4
Beljwa ej qorba bekbr argalech
Belelna hona begeta qegn alech
Betewahdo emnet qenai yehonn
Yemljawan ts’elot amnen yeqerebn

VERSE 5
Yeasrat hegerwa ityop’ya nat yaln
Dingil beflsetwa ts’egawan talbsen',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'erefitish'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 1
ሞትሽ በወርኀ ጥር ነሐሴ መቃብርሽ
ውበት ሰጥተውታል ማርያም ሆይ ለክብርሽ
ዘካርያስ ያያት ተቅዋመ ማኅቶት
አማናዊት ፅዮን ማኅደረ መለኮት

CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 2
ቶማስ በደመና ዕርገቷ እየታየው
ምስክር ሊሆነው ሰበኗ ተሰጠው
ሐዋርያት በአንድ ልብ ሱባዔ ጀምረው
ትንሣኤዋን ሳናይ እንዴት ቀረን ብለው

CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 3
ጾም ጸሎታቸውን አምላክ ተቀበለው
ትኩስ አድርጎ በድኗን ነሐሴ ሰጣቸው
ከመቃብር ሳትቀር ድንግል ተነስታለች
ለሁሉ ሐዋርያት ነሃሴ ታይታለች

CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 4
በልጇ እጅ ቆርባ በክብር ዐርጋለች
በልዕልና ሆና በጌታ ቀኝ አለች
በተዋህዶ እምነት ቀናኢ የሆንን
የምልጃዋን ጸሎት አምነን የቀረብን

CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት

VERSE 5
የአስራት ሀገሯ ኢትዮጵያ ናት ያልን
ድንግል በፍልሰቷ ጸጋዋን ታልብሰን

CHORUS
ዕረፍትሽ በጥር ነሐሴ መቃብርሽ(2)
ለሰማው ይገርማል ተአምርሽ ሲነገር
በዘላለም ፍዳ በገሃነም እሳት
ነፍሳት እንዳይጠፉ አስታራቂ እናት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ereftsh bet’r nehese meqabrsh (2)
Lesemaw yigermal teamrsh sineger
Bezelalem fida begehanem esat
Nefsat endayt’efu astaraqi enat

VERSE 1
Motsh bewerhe t’r nehese meqabrsh
Wibet set’tewtal Maryam hoy lekbrsh
Zekaryas yayat teqwame mahtot
Amanawit ts’yon mahdere melekot

CHORUS
Ereftsh bet’r nehese meqabrsh (2)
Lesemaw yigermal teamrsh sineger
Bezelalem fida begehanem esat
Nefsat endayt’efu astaraqi enat

VERSE 2
Tomas bedemena ergetwa eyetayew
Miskr lihonew sebenwa teset’ew
Hewaryat beand lib subae jemrew
Tinsaewan sanay endet qeren bilew

CHORUS
Ereftsh bet’r nehese meqabrsh (2)
Lesemaw yigermal teamrsh sineger
Bezelalem fida begehanem esat
Nefsat endayt’efu astaraqi enat

VERSE 3
Ts’om ts’elotachewn amlak teqebelew
Tikus adrgo bednwan nehese set’achew
Kemeqabr satqer Dingil tenestalech
Lehulu hewaryat nehase taytalech

CHORUS
Ereftsh bet’r nehese meqabrsh (2)
Lesemaw yigermal teamrsh sineger
Bezelalem fida begehanem esat
Nefsat endayt’efu astaraqi enat

VERSE 4
Beljwa ej qorba bekbr argalech
Belelna hona begeta qegn alech
Betewahdo emnet qenai yehonn
Yemljawan ts’elot amnen yeqerebn

CHORUS
Ereftsh bet’r nehese meqabrsh (2)
Lesemaw yigermal teamrsh sineger
Bezelalem fida begehanem esat
Nefsat endayt’efu astaraqi enat

VERSE 5
Yeasrat hegerwa ityop’ya nat yaln
Dingil beflsetwa ts’egawan talbsen

CHORUS
Ereftsh bet’r nehese meqabrsh (2)
Lesemaw yigermal teamrsh sineger
Bezelalem fida begehanem esat
Nefsat endayt’efu astaraqi enat'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'erefitish', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eregnaye (eregnaye)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 1
ህይወት በምድር ላይ ብትሆን ከባድ
ወጥመዷን ማምለጫ ጌታ ለኝ መንገድ
እጠባበቃለውህ ተስፋዬን አጥብቄ
ለዓለም አትተወኝም ኣልቀርም ወድቄ

VERSE 2
በእጅህ ተፈጥሬ ክቡር አድርገኸኝ
ከቶ ያለ አላማ መቼ መጣሁኝ [2]
በኔ ላይ ሰልጥኖ ሓጥያት ከነ ቤቱ
መሽቶ ይነጋብኛል ስባዝን በከንቱ

VERSE 3
ሰጠኸኝ ነበረ ጊዜ ለንስሓ
ትንሽ ኣድርጌ እንጂ ትልቁን አምሃ
ይነቀል ከልቤ የተተበተበው
አንተ ብቻ ልዪ ጠላቴን ጥለኸው[2]

VERSE 4
የበጎች እረኛ ቸሩ ጌታችን
ያድነዋል ፈጥኖ በእርሱ ያመነውን
መዝግያን ለሚያንኳኳ ይከፈታል በሩ
እስከ ሞት ነውና የክርስቶስ ፍቅሩ

VERSE 5
ከጉድጓድ ያወጣል ከጥልቁ ዓለም
ቢዘገይም እንኳን ሚቀድመው የለም[2)
ካገሬም ብሰደድ ጽናቱን አጥቼ
ገባው ተሰሎንቄ መቅደስህን ትቼ

VERSE 6
ጌታዬ መልሰኝ እኜ እመለሳለው
ልቤን ካንተ ሌላ ለማን እሰጣለው
ዓይኖቼም ይመሉ የፀፀትን እንባ
ደግሞም ተመልሼ ወደ እቅፍህ ልግባ[2]

VERSE 7
የበጎች እረኛ ቸሩ ጌታችን
የድነዋል ፈጥኖ በእርሱ ያመነውን
መዝግያን ለሚያንኳኳ ይከፈታል በሩ
እስከ ሞት ነውና የክርስቶስ ፍቅሩ

VERSE 8
ከጉድጓድ ያወጣል ከጥልቁ ዓለም
ቢዘገይም እንኳን ሚቀድመው የለም[2]',
      lyrics_transliteration = 'Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 1
Hiywet bemdr lay bithon kebad
Wet’medwan mamlech’a Geta legn menged
Et’ebabeqalewh tesfayen at’bqe
Lealem attewegnm alqerm wedqe

VERSE 2
Beejh tefet’re kibur adrgeኸgn
Keto yale alama meche met’ahugn [2]
Bene lay selt’no hat’yat kene betu
Meshto yinegabgnal sibazn bekentu

VERSE 3
Set’eኸgn nebere gize lensha
Tinsh adrge enji tilqun amha
Yineqel kelbe yetetebetebew
Ante bicha liyi t’elaten t’leኸw[2]

VERSE 4
Yebegoch eregna cheru Getachen
Yadnewal fet’no beersu yamenewn
Mezgyan lemiyankwakwa yikefetal beru
Eske mot newna yeKristos fiqru

VERSE 5
Kegudgwad yawet’al ket’lqu alem
Bizegeym enkwan miqedmew yelem[2)
Kagerem biseded ts’natun at’che
Gebaw teselonqe meqdeshn tiche

VERSE 6
Getaye melsegn egne emelesalew
Liben kante lela leman eset’alew
Aynochem yimelu yets’ets’etn enba
Degmom temelshe wede eqfh ligba[2]

VERSE 7
Yebegoch eregna cheru Getachen
Yednewal fet’no beersu yamenewn
Mezgyan lemiyankwakwa yikefetal beru
Eske mot newna yeKristos fiqru

VERSE 8
Kegudgwad yawet’al ket’lqu alem
Bizegeym enkwan miqedmew yelem[2]',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eregnaye'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 1
ህይወት በምድር ላይ ብትሆን ከባድ
ወጥመዷን ማምለጫ ጌታ ለኝ መንገድ
እጠባበቃለውህ ተስፋዬን አጥብቄ
ለዓለም አትተወኝም ኣልቀርም ወድቄ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 2
በእጅህ ተፈጥሬ ክቡር አድርገኸኝ
ከቶ ያለ አላማ መቼ መጣሁኝ [2]
በኔ ላይ ሰልጥኖ ሓጥያት ከነ ቤቱ
መሽቶ ይነጋብኛል ስባዝን በከንቱ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 3
ሰጠኸኝ ነበረ ጊዜ ለንስሓ
ትንሽ ኣድርጌ እንጂ ትልቁን አምሃ
ይነቀል ከልቤ የተተበተበው
አንተ ብቻ ልዪ ጠላቴን ጥለኸው[2]

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 4
የበጎች እረኛ ቸሩ ጌታችን
ያድነዋል ፈጥኖ በእርሱ ያመነውን
መዝግያን ለሚያንኳኳ ይከፈታል በሩ
እስከ ሞት ነውና የክርስቶስ ፍቅሩ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 5
ከጉድጓድ ያወጣል ከጥልቁ ዓለም
ቢዘገይም እንኳን ሚቀድመው የለም[2)
ካገሬም ብሰደድ ጽናቱን አጥቼ
ገባው ተሰሎንቄ መቅደስህን ትቼ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 6
ጌታዬ መልሰኝ እኜ እመለሳለው
ልቤን ካንተ ሌላ ለማን እሰጣለው
ዓይኖቼም ይመሉ የፀፀትን እንባ
ደግሞም ተመልሼ ወደ እቅፍህ ልግባ[2]

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 7
የበጎች እረኛ ቸሩ ጌታችን
የድነዋል ፈጥኖ በእርሱ ያመነውን
መዝግያን ለሚያንኳኳ ይከፈታል በሩ
እስከ ሞት ነውና የክርስቶስ ፍቅሩ

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ

VERSE 8
ከጉድጓድ ያወጣል ከጥልቁ ዓለም
ቢዘገይም እንኳን ሚቀድመው የለም[2]

CHORUS
እረኛዬ እረኛዬ
እረኛዬ መተማመኛዬ
ጠባቂ አለኝ ጠባቂ አለኝ
ክርስቶስ መቼም የማይተወኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 1
Hiywet bemdr lay bithon kebad
Wet’medwan mamlech’a Geta legn menged
Et’ebabeqalewh tesfayen at’bqe
Lealem attewegnm alqerm wedqe

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 2
Beejh tefet’re kibur adrgeኸgn
Keto yale alama meche met’ahugn [2]
Bene lay selt’no hat’yat kene betu
Meshto yinegabgnal sibazn bekentu

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 3
Set’eኸgn nebere gize lensha
Tinsh adrge enji tilqun amha
Yineqel kelbe yetetebetebew
Ante bicha liyi t’elaten t’leኸw[2]

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 4
Yebegoch eregna cheru Getachen
Yadnewal fet’no beersu yamenewn
Mezgyan lemiyankwakwa yikefetal beru
Eske mot newna yeKristos fiqru

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 5
Kegudgwad yawet’al ket’lqu alem
Bizegeym enkwan miqedmew yelem[2)
Kagerem biseded ts’natun at’che
Gebaw teselonqe meqdeshn tiche

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 6
Getaye melsegn egne emelesalew
Liben kante lela leman eset’alew
Aynochem yimelu yets’ets’etn enba
Degmom temelshe wede eqfh ligba[2]

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 7
Yebegoch eregna cheru Getachen
Yednewal fet’no beersu yamenewn
Mezgyan lemiyankwakwa yikefetal beru
Eske mot newna yeKristos fiqru

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn

VERSE 8
Kegudgwad yawet’al ket’lqu alem
Bizegeym enkwan miqedmew yelem[2]

CHORUS
Eregnaye eregnaye
Eregnaye metemamegnaye
T’ebaqi alegn t’ebaqi alegn
Kristos mechem yemaytewegn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eregnaye', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eridagn Zim Atibel (eridagn-zim-atibel)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 1
ጨንቆኝ እጣራለሁ ጸጋ አጥታ ሕይወቴ
እባክህ አርመኝ እርዳኝ መድኃኒቴ
ልቤ ድንጋይ ሆኖ ቃልህ አልሰበረው
የእጅህን ሥራ ጌታዬ አትናቀው

VERSE 2
አዝ….
የክርስትና ኑሮ ሥርዓቱን አፍርሼ
አለቅሳለሁ ጌታ በኃጢአት ተከስሼ
ሰላምና ፍቅር ነበር ክርስትና

VERSE 3
እኔ ግን ተናወጽኩ አልጸናሁምና
አዝ….
ሥራዬና ቃልህ አልገናኝ አሉኝ
በጠማማው ልቤ አንተን አሳዘንኩኝ

VERSE 4
ጽኑ መሠረት ነህ የሕይወት አለት
ህይወት የሰጠኸኝ ደርሰኸ እስከሞት
አዝ….
በለመለመ መስክ በዕረፍት ወኃ ዘንድ

VERSE 5
የምታሰማራ በጎችኸን የምትወድ
ይቅር በለኝና እግዚአብሔር አምላኬ
ለሚያድነው ስምህ ልኑር ተንበርክኬ',
      lyrics_transliteration = 'Erdagn zim atbel yeserawit Geta
Tesfa endelelew sew libe ayamenta
Anten lemagelgel yeneberegn birtat
Zares tesnognal aqtognal metgat

VERSE 1
Ch’enqogn et’aralehu ts’ega at’ta hiywete
Ebakh armegn erdagn medhanite
Libe dingay hono qalh alseberew
Yeejhn sira Getaye atnaqew

VERSE 2
Yekrstna nuro siratun afrshe
Aleqsalehu Geta behat’iat tekesshe
Selamna fiqr neber kirstna

VERSE 3
Ene gin tenawets’ku alts’enahumna
Sirayena qalh algenagn alugn
Bet’emamaw libe anten asazenkugn

VERSE 4
Ts’nu meseret neh yehywet alet
Hiywet yeset’eኸgn derseኸ eskemot
Belemeleme mesk beereft weha zend

VERSE 5
Yemtasemara begochኸn yemtwed
Yiqr belegnna Egziabher amlake
Lemiyadnew simh linur tenberkke',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eridagn-zim-atibel'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 1
ጨንቆኝ እጣራለሁ ጸጋ አጥታ ሕይወቴ
እባክህ አርመኝ እርዳኝ መድኃኒቴ
ልቤ ድንጋይ ሆኖ ቃልህ አልሰበረው
የእጅህን ሥራ ጌታዬ አትናቀው

CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 2
አዝ….
የክርስትና ኑሮ ሥርዓቱን አፍርሼ
አለቅሳለሁ ጌታ በኃጢአት ተከስሼ
ሰላምና ፍቅር ነበር ክርስትና

CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 3
እኔ ግን ተናወጽኩ አልጸናሁምና
አዝ….
ሥራዬና ቃልህ አልገናኝ አሉኝ
በጠማማው ልቤ አንተን አሳዘንኩኝ

CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 4
ጽኑ መሠረት ነህ የሕይወት አለት
ህይወት የሰጠኸኝ ደርሰኸ እስከሞት
አዝ….
በለመለመ መስክ በዕረፍት ወኃ ዘንድ

CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

VERSE 5
የምታሰማራ በጎችኸን የምትወድ
ይቅር በለኝና እግዚአብሔር አምላኬ
ለሚያድነው ስምህ ልኑር ተንበርክኬ

CHORUS
እርዳኝ ዝም አትበል የሠራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ
አንተን ለማገልገል የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Erdagn zim atbel yeserawit Geta
Tesfa endelelew sew libe ayamenta
Anten lemagelgel yeneberegn birtat
Zares tesnognal aqtognal metgat

VERSE 1
Ch’enqogn et’aralehu ts’ega at’ta hiywete
Ebakh armegn erdagn medhanite
Libe dingay hono qalh alseberew
Yeejhn sira Getaye atnaqew

CHORUS
Erdagn zim atbel yeserawit Geta
Tesfa endelelew sew libe ayamenta
Anten lemagelgel yeneberegn birtat
Zares tesnognal aqtognal metgat

VERSE 2
CHORUS
Yekrstna nuro siratun afrshe
Aleqsalehu Geta behat’iat tekesshe
Selamna fiqr neber kirstna

CHORUS
Erdagn zim atbel yeserawit Geta
Tesfa endelelew sew libe ayamenta
Anten lemagelgel yeneberegn birtat
Zares tesnognal aqtognal metgat

VERSE 3
Ene gin tenawets’ku alts’enahumna
CHORUS
Sirayena qalh algenagn alugn
Bet’emamaw libe anten asazenkugn

CHORUS
Erdagn zim atbel yeserawit Geta
Tesfa endelelew sew libe ayamenta
Anten lemagelgel yeneberegn birtat
Zares tesnognal aqtognal metgat

VERSE 4
Ts’nu meseret neh yehywet alet
Hiywet yeset’eኸgn derseኸ eskemot
CHORUS
Belemeleme mesk beereft weha zend

CHORUS
Erdagn zim atbel yeserawit Geta
Tesfa endelelew sew libe ayamenta
Anten lemagelgel yeneberegn birtat
Zares tesnognal aqtognal metgat

VERSE 5
Yemtasemara begochኸn yemtwed
Yiqr belegnna Egziabher amlake
Lemiyadnew simh linur tenberkke

CHORUS
Erdagn zim atbel yeserawit Geta
Tesfa endelelew sew libe ayamenta
Anten lemagelgel yeneberegn birtat
Zares tesnognal aqtognal metgat'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eridagn-zim-atibel', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Erisu Bicha Yemayimot New (erisu-bicha-yemayimot-new)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል

VERSE 1
ሁሉም ነገር ይለወጣል
ሳይደበዝዝ የሚያበራ
ሁሌ ፅኑ የእርሱ ስራ
የአይሁድ ትግል ያልነቀለዉ

VERSE 2
ክፋታቸው ያልሸፈነው
የደም ሐውልት ምሰሶአችን
በርሱ ጸንቷል ከፍታችን
የአለም ጀግኖች ተቀብረዋል

VERSE 3
የበረቱ ተሰብረዋል
ገዳዩን ሞት የገደለ
እንደ ጌታ ወዴት አለ
መቃብርን የቀበረ

VERSE 4
ሀይለኛውን የሰበረ
እየሱስ ነው ፅኑ ጌታ
ማይሸነፍ ማይረታ',
      lyrics_transliteration = 'Ersu bicha yemaymot new
Beabatu qegn ale negso
Amanuel kibrn lebso
Tinantnan zare wit’wal

VERSE 1
Hulum neger yilewet’al
Saydebezz yemiyabera
Hule ts’nu yeersu sira
Yeayhud tigl yalneqelewu

VERSE 2
Kifatachew yalshefenew
Yedem hewlt misesoachn
Bersu ts’entwal keftachn
Yealem jegnoch teqebrewal

VERSE 3
Yeberetu tesebrewal
Gedayun mot yegedele
Ende Geta wedet ale
Meqabrn yeqebere

VERSE 4
Heylegnawn yesebere
Eyesus new ts’nu Geta
Mayshenef mayreta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'erisu-bicha-yemayimot-new'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል

VERSE 1
ሁሉም ነገር ይለወጣል
ሳይደበዝዝ የሚያበራ
ሁሌ ፅኑ የእርሱ ስራ
የአይሁድ ትግል ያልነቀለዉ

CHORUS
እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል

VERSE 2
ክፋታቸው ያልሸፈነው
የደም ሐውልት ምሰሶአችን
በርሱ ጸንቷል ከፍታችን
የአለም ጀግኖች ተቀብረዋል

CHORUS
እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል

VERSE 3
የበረቱ ተሰብረዋል
ገዳዩን ሞት የገደለ
እንደ ጌታ ወዴት አለ
መቃብርን የቀበረ

CHORUS
እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል

VERSE 4
ሀይለኛውን የሰበረ
እየሱስ ነው ፅኑ ጌታ
ማይሸነፍ ማይረታ

CHORUS
እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ersu bicha yemaymot new
Beabatu qegn ale negso
Amanuel kibrn lebso
Tinantnan zare wit’wal

VERSE 1
Hulum neger yilewet’al
Saydebezz yemiyabera
Hule ts’nu yeersu sira
Yeayhud tigl yalneqelewu

CHORUS
Ersu bicha yemaymot new
Beabatu qegn ale negso
Amanuel kibrn lebso
Tinantnan zare wit’wal

VERSE 2
Kifatachew yalshefenew
Yedem hewlt misesoachn
Bersu ts’entwal keftachn
Yealem jegnoch teqebrewal

CHORUS
Ersu bicha yemaymot new
Beabatu qegn ale negso
Amanuel kibrn lebso
Tinantnan zare wit’wal

VERSE 3
Yeberetu tesebrewal
Gedayun mot yegedele
Ende Geta wedet ale
Meqabrn yeqebere

CHORUS
Ersu bicha yemaymot new
Beabatu qegn ale negso
Amanuel kibrn lebso
Tinantnan zare wit’wal

VERSE 4
Heylegnawn yesebere
Eyesus new ts’nu Geta
Mayshenef mayreta

CHORUS
Ersu bicha yemaymot new
Beabatu qegn ale negso
Amanuel kibrn lebso
Tinantnan zare wit’wal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'erisu-bicha-yemayimot-new', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Erisu Fitsum Lilik (erisu-fitsum-lilik)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 1
ጫማውን ልሸከም ከቶ የማይገባኝ
እኔን አስቀድሞ ለአገልግሎት ጠራኝ
ከኃላዬ የመጠው ነበር ከፊቴ
በስሙ ታምኑ ዘንድ እርሱ ነው ስስብከቴ

VERSE 2
በምድረ በዳ ላይ የጮኹለት ንጉስ
የኃያላን ኃያል ተገልጧል እየሱስ
ለኃጥአት ስርየት ይሰዋል ይሄ በግ
ለዓለም ሁሉ መዳን በቀራንዮ ሰርግ

VERSE 3
ለንስሃ የሚሆን ፍሬ ዛሬ አድርጉ
ለሰርጉ ሊጠራን መቷል እና በጉ
ከሚመጣው ቁጣ በእርሱ እንድታመልጡ
የእፉኝት ልጆች ከባቢሎን ውጡ

VERSE 4
የአብርሃም ልጆች ነን በማለት ላትድኑ
የመዳኑን ሰዓት ቀኑን አታባክኑ
ለአብርሃም ልጆችን ከድንጋይ ያስነሳል
መንሹም በእጁ ነው አውድማው ይጠራል

VERSE 5
ጠማማው ልብ ይቅና ጥርጊያው ይስተካከል
ፍሬ የሌለው ዛፍ በእቶን ሳይቃጠል
ምሳር በዛፎች ስር ዛሬም ተቀምጧል
ንስሃ ግቡ ነው የመጨረሻው ቃል',
      lyrics_transliteration = 'Ersu fits’um lilq ene lans yigebal
Keene yilq Geta ejg yiberetal
Ene lensha bewha at’emeqhachhu
Beesat yat’emqal yimet’al yalkwachhu (2)

VERSE 1
Ch’amawn lishekem keto yemaygebagn
Enen asqedmo leagelglot t’eragn
Kehalaye yemet’ew neber kefite
Besmu tamnu zend ersu new sisbkete

VERSE 2
Bemdre beda lay yech’oኹlet nigus
Yehayalan hayal tegelt’wal eyesus
Lehat’at siryet yisewal yihe beg
Lealem hulu medan beqeranyo serg

VERSE 3
Lensha yemihon fire zare adrgu
Lesergu lit’eran metwal ena begu
Kemimet’aw qut’a beersu endtamelt’u
Yeefugnt lijoch kebabilon wit’u

VERSE 4
Yeabrham lijoch nen bemalet latdnu
Yemedanun seat qenun atabaknu
Leabrham lijochn kedngay yasnesal
Menshum beeju new awdmaw yit’eral

VERSE 5
T’emamaw lib yiqna t’rgiyaw yistekakel
Fire yelelew zaf beeton sayqat’el
Misar bezafoch sir zarem teqemt’wal
Nisha gibu new yemech’ereshaw qal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'erisu-fitsum-lilik'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 1
ጫማውን ልሸከም ከቶ የማይገባኝ
እኔን አስቀድሞ ለአገልግሎት ጠራኝ
ከኃላዬ የመጠው ነበር ከፊቴ
በስሙ ታምኑ ዘንድ እርሱ ነው ስስብከቴ

CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 2
በምድረ በዳ ላይ የጮኹለት ንጉስ
የኃያላን ኃያል ተገልጧል እየሱስ
ለኃጥአት ስርየት ይሰዋል ይሄ በግ
ለዓለም ሁሉ መዳን በቀራንዮ ሰርግ

CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 3
ለንስሃ የሚሆን ፍሬ ዛሬ አድርጉ
ለሰርጉ ሊጠራን መቷል እና በጉ
ከሚመጣው ቁጣ በእርሱ እንድታመልጡ
የእፉኝት ልጆች ከባቢሎን ውጡ

CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 4
የአብርሃም ልጆች ነን በማለት ላትድኑ
የመዳኑን ሰዓት ቀኑን አታባክኑ
ለአብርሃም ልጆችን ከድንጋይ ያስነሳል
መንሹም በእጁ ነው አውድማው ይጠራል

CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)

VERSE 5
ጠማማው ልብ ይቅና ጥርጊያው ይስተካከል
ፍሬ የሌለው ዛፍ በእቶን ሳይቃጠል
ምሳር በዛፎች ስር ዛሬም ተቀምጧል
ንስሃ ግቡ ነው የመጨረሻው ቃል

CHORUS
እርሱ ፍፁም ሊልቅ እኔ ላንስ ይገባል
ከእኔ ይልቅ ጌታ እጅግ ይበረታል
እኔ ለንስሃ በውሃ አጠመቅኃችሁ
በእሳት ያጠምቃል ይመጣል ያልኳችሁ(2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ersu fits’um lilq ene lans yigebal
Keene yilq Geta ejg yiberetal
Ene lensha bewha at’emeqhachhu
Beesat yat’emqal yimet’al yalkwachhu (2)

VERSE 1
Ch’amawn lishekem keto yemaygebagn
Enen asqedmo leagelglot t’eragn
Kehalaye yemet’ew neber kefite
Besmu tamnu zend ersu new sisbkete

CHORUS
Ersu fits’um lilq ene lans yigebal
Keene yilq Geta ejg yiberetal
Ene lensha bewha at’emeqhachhu
Beesat yat’emqal yimet’al yalkwachhu (2)

VERSE 2
Bemdre beda lay yech’oኹlet nigus
Yehayalan hayal tegelt’wal eyesus
Lehat’at siryet yisewal yihe beg
Lealem hulu medan beqeranyo serg

CHORUS
Ersu fits’um lilq ene lans yigebal
Keene yilq Geta ejg yiberetal
Ene lensha bewha at’emeqhachhu
Beesat yat’emqal yimet’al yalkwachhu (2)

VERSE 3
Lensha yemihon fire zare adrgu
Lesergu lit’eran metwal ena begu
Kemimet’aw qut’a beersu endtamelt’u
Yeefugnt lijoch kebabilon wit’u

CHORUS
Ersu fits’um lilq ene lans yigebal
Keene yilq Geta ejg yiberetal
Ene lensha bewha at’emeqhachhu
Beesat yat’emqal yimet’al yalkwachhu (2)

VERSE 4
Yeabrham lijoch nen bemalet latdnu
Yemedanun seat qenun atabaknu
Leabrham lijochn kedngay yasnesal
Menshum beeju new awdmaw yit’eral

CHORUS
Ersu fits’um lilq ene lans yigebal
Keene yilq Geta ejg yiberetal
Ene lensha bewha at’emeqhachhu
Beesat yat’emqal yimet’al yalkwachhu (2)

VERSE 5
T’emamaw lib yiqna t’rgiyaw yistekakel
Fire yelelew zaf beeton sayqat’el
Misar bezafoch sir zarem teqemt’wal
Nisha gibu new yemech’ereshaw qal

CHORUS
Ersu fits’um lilq ene lans yigebal
Keene yilq Geta ejg yiberetal
Ene lensha bewha at’emeqhachhu
Beesat yat’emqal yimet’al yalkwachhu (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'erisu-fitsum-lilik', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: ERITREAN ORTHODOX MEZMUR (eritrean-orthodox-mezmur-1972)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'የብለይን ካልእ ፈታውየይ ዝብሎ
ንጾረይ ዝጸውር አርዑተይ ዘቕልሎ
ሰኸመይ ዘራግፍ ውዒሉ አብ ቀራንዮ
ብዘይ ምእዛዘይ ምስ መረጽኩ ንሞት

VERSE 1
ንልቡ ኣሕዚነ ምስ ወጻኹ ካብ ቤት
መዓስ ገዲፉኒ አብ ጸልማት ክነብር
ንስጋይ ለበሰ ህይወት ክህበኒ ቃል
ስሙ ኢየሱስ’ዩ ናይ ቁስለይ መድሓኒት

VERSE 2
ብነጠብጣብ ደሙ ሓጥያተይ ዝሓጽብ (2)
ኣብ ክንዲ ይስሓቅ ዝተሓርደ ገንሸል
ክርስቶስ ጎይታ’ዩ እቲ ጽኑዕ ቃል
መስዋቲ ዘቅርብ መሊሱ ዝቅበል

VERSE 3
ፈታዉየይ ንሱ ናይዘልኣለም ካህን
ከም ናይ መልኬጸዴቅ ክህነቱ ዘልኣለም
ንሞት ዝሰዓረ ናይዛ ዓለም መድሕን(2)',
      lyrics_transliteration = 'Yebleyn kale fetawyey ziblo
Nits’orey zits’ewr arutey zeቕllo
Seኸmey zeragf wiilu Ab qeranyo
Bizey miezazey mis merets’ku nimot

VERSE 1
Nilbu ahzine mis wets’aኹ kab bet
Meas gedifuni Ab ts’elmat kinebr
Nisgay lebese hiywet kihbeni qal
Simu Iyesus’yu nay qusley medhanit

VERSE 2
Binet’ebt’ab demu hat’yatey zihats’b (2)
Ab kindi yishaq ziteharde genshel
Kristos goyta’yu eti ts’nue qal
Meswati zeqrb melisu ziqbel

VERSE 3
Fetawuyey nisu nayzelalem kahn
Kem nay melkets’edeq kihnetu zelalem
Nimot ziseare nayza alem medhn (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-mezmur-1972'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የብለይን ካልእ ፈታውየይ ዝብሎ
ንጾረይ ዝጸውር አርዑተይ ዘቕልሎ
ሰኸመይ ዘራግፍ ውዒሉ አብ ቀራንዮ
ብዘይ ምእዛዘይ ምስ መረጽኩ ንሞት

VERSE 1
ንልቡ ኣሕዚነ ምስ ወጻኹ ካብ ቤት
መዓስ ገዲፉኒ አብ ጸልማት ክነብር
ንስጋይ ለበሰ ህይወት ክህበኒ ቃል
ስሙ ኢየሱስ’ዩ ናይ ቁስለይ መድሓኒት

CHORUS
የብለይን ካልእ ፈታውየይ ዝብሎ
ንጾረይ ዝጸውር አርዑተይ ዘቕልሎ
ሰኸመይ ዘራግፍ ውዒሉ አብ ቀራንዮ
ብዘይ ምእዛዘይ ምስ መረጽኩ ንሞት

VERSE 2
ብነጠብጣብ ደሙ ሓጥያተይ ዝሓጽብ (2)
ኣብ ክንዲ ይስሓቅ ዝተሓርደ ገንሸል
ክርስቶስ ጎይታ’ዩ እቲ ጽኑዕ ቃል
መስዋቲ ዘቅርብ መሊሱ ዝቅበል

CHORUS
የብለይን ካልእ ፈታውየይ ዝብሎ
ንጾረይ ዝጸውር አርዑተይ ዘቕልሎ
ሰኸመይ ዘራግፍ ውዒሉ አብ ቀራንዮ
ብዘይ ምእዛዘይ ምስ መረጽኩ ንሞት

VERSE 3
ፈታዉየይ ንሱ ናይዘልኣለም ካህን
ከም ናይ መልኬጸዴቅ ክህነቱ ዘልኣለም
ንሞት ዝሰዓረ ናይዛ ዓለም መድሕን(2)

CHORUS
የብለይን ካልእ ፈታውየይ ዝብሎ
ንጾረይ ዝጸውር አርዑተይ ዘቕልሎ
ሰኸመይ ዘራግፍ ውዒሉ አብ ቀራንዮ
ብዘይ ምእዛዘይ ምስ መረጽኩ ንሞት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yebleyn kale fetawyey ziblo
Nits’orey zits’ewr arutey zeቕllo
Seኸmey zeragf wiilu Ab qeranyo
Bizey miezazey mis merets’ku nimot

VERSE 1
Nilbu ahzine mis wets’aኹ kab bet
Meas gedifuni Ab ts’elmat kinebr
Nisgay lebese hiywet kihbeni qal
Simu Iyesus’yu nay qusley medhanit

CHORUS
Yebleyn kale fetawyey ziblo
Nits’orey zits’ewr arutey zeቕllo
Seኸmey zeragf wiilu Ab qeranyo
Bizey miezazey mis merets’ku nimot

VERSE 2
Binet’ebt’ab demu hat’yatey zihats’b (2)
Ab kindi yishaq ziteharde genshel
Kristos goyta’yu eti ts’nue qal
Meswati zeqrb melisu ziqbel

CHORUS
Yebleyn kale fetawyey ziblo
Nits’orey zits’ewr arutey zeቕllo
Seኸmey zeragf wiilu Ab qeranyo
Bizey miezazey mis merets’ku nimot

VERSE 3
Fetawuyey nisu nayzelalem kahn
Kem nay melkets’edeq kihnetu zelalem
Nimot ziseare nayza alem medhn (2)

CHORUS
Yebleyn kale fetawyey ziblo
Nits’orey zits’ewr arutey zeቕllo
Seኸmey zeragf wiilu Ab qeranyo
Bizey miezazey mis merets’ku nimot'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-mezmur-1972', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eritrean Orthodox Mezmur (eritrean-orthodox-mezmur-3615)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 1
ተመስገን መድኀነይ ዓመታት ትዕግሥተይ ደስታ ቀይርካዮ
ንስኻ እነተ ዘይሓነፅካ መን ጥበብ ምስ ሃቦ ሐነፅቲ ሰብ ዕዮ
ንስኻ እነተዘይሐለኻ ሓላዊ ከተማ ምነቕሐ''ዶ ኢልካዮ
አነ''ውን አምላኸይ ብዘይ ደገፍ ኢደካ የለን ናተይ ዘብሎ

VERSE 2
ከመይ ነስኻ ኢኻ ትብዓት ውሽጠይ ውሽጠይ ልበይ ዝውከሎ
ተመሰገን አምላኸይ
ቅደሚ ኩሉነገር ንስኻ ከበረለይ
ተመሰገን ግይታየ

VERSE 3
ቅደሚ ኩሉ ነገር ልዕል በለለይ
እዝ።።።።።።።።።።።።።።።።።።።።።።።።።።።።።።።
እቲ ዝነፍዐ ፈረሰኛ ከም ንፈሰ ክሕምበብ ኃይለይ''ዶ እብሎ ይኸውን
እቲ ዝምካሕ ብፍልጠቱ ኣብ ጥርዚ እንተ በጽሐስ ናተይ''ዶ እብሎ ይኸውን

VERSE 4
መን ኣሎ ድዩ ፍጡር ዕድመ ከይሃብካዮ ነዚ ዘርክበሉ
መን ኣሎ''ኸ ዕውት ጥዕዩ ደው ከየበለ ዝበጽሕ ኣብ ኩሉ
ንዓይ ''ውን ኦ ግይታይ
ናይ ትማል ውህበትካ ገና ኣብ ልበይ ከሎ

VERSE 5
ነዚ ወሲኽካንስ
ኣምሳያ ልግስኻስ ''ታይ ኣሎ''ሞ ዝብሎ
እዝ።።።።።።።።።።።።።።።።።።።።።።።።።።።
እቲ ኹሉ ዝሓለፈኩዎ ዓቐብን ቊልቊን ብዓወት ክሰግሮ

VERSE 6
እቲ ኹሉ ዝሰገርኩዎ ታኼላን ተኾርባን በርቲዐ ክሰግሮ
ኃይሊ መን ድዩ ነይሩ ነዚ ፈጹም ስቕታይ ኩሉ ዝስበረ
አይንሰኻ''ንዲኻ ዓመታት ትዕግሦተየ ደስታ ዝቐየረ
ኣንታ''ቦ ውዕለተይ

VERSE 7
ሓለል''ዪ ብሓቂ ናትካ ውሉድ ምዃን
ብኽብርን ምስጋናን
ኣምልኾን ውዳሴን ዘለዓለም ተመስገን
ኣማን',
      lyrics_transliteration = 'Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 1
Temesgen medheney ametat tiegstey desta qeyrkayo
Nisኻ enete zeyhanets’ka men t’beb mis habo henets’ti seb eyo
Nisኻ enetezeyheleኻ halawi ketema mineቕhe''do ilkayo
Ane''win amlaኸy bizey degef ideka yelen natey zeblo

VERSE 2
Kemey nesኻ iኻ tibat wisht’ey wisht’ey libey ziwkelo
Temesegen amlaኸy
Qidemi kuluneger nisኻ kebereley
Temesegen giytaye

VERSE 3
Qidemi kulu neger liel beleley
Ez...............................
Eti zinefa feresegna kem nifese kihmbeb hayley''do eblo yiኸwn
Eti zimkah biflt’etu ab t’rzi ente bets’hes natey''do eblo yiኸwn

VERSE 4
Men alo diyu fit’ur edme keyhabkayo nezi zerkbelu
Men alo''ኸ ewt t’eyu dew keyebele zibets’h ab kulu
Niay ''win o giytay
Nay timal wihbetka gena ab libey kelo

VERSE 5
Nezi wesiኽkans
Amsaya ligsኻs ''tay alo''mo ziblo
Ez...........................
Eti ኹlu zihalefekuwo aቐbn qwilqwin biawet kisegro

VERSE 6
Eti ኹlu zisegerkuwo taኼlan teኾrban bertia kisegro
Hayli men diyu neyru nezi fets’um siቕtay kulu zisbere
Aynseኻ''nidiኻ ametat tiegsoteye desta ziቐyere
Anta''bo wieletey

VERSE 7
Halel''yi bihaqi natka wilud mikhwan
Biኽbrn misganan
Amlኾn widasen zelealem temesgen
Aman',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-mezmur-3615'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 1
ተመስገን መድኀነይ ዓመታት ትዕግሥተይ ደስታ ቀይርካዮ
ንስኻ እነተ ዘይሓነፅካ መን ጥበብ ምስ ሃቦ ሐነፅቲ ሰብ ዕዮ
ንስኻ እነተዘይሐለኻ ሓላዊ ከተማ ምነቕሐ''ዶ ኢልካዮ
አነ''ውን አምላኸይ ብዘይ ደገፍ ኢደካ የለን ናተይ ዘብሎ

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 2
ከመይ ነስኻ ኢኻ ትብዓት ውሽጠይ ውሽጠይ ልበይ ዝውከሎ
ተመሰገን አምላኸይ
ቅደሚ ኩሉነገር ንስኻ ከበረለይ
ተመሰገን ግይታየ

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 3
ቅደሚ ኩሉ ነገር ልዕል በለለይ
እዝ።።።።።።።።።።።።።።።።።።።።።።።።።።።።።።።
እቲ ዝነፍዐ ፈረሰኛ ከም ንፈሰ ክሕምበብ ኃይለይ''ዶ እብሎ ይኸውን
እቲ ዝምካሕ ብፍልጠቱ ኣብ ጥርዚ እንተ በጽሐስ ናተይ''ዶ እብሎ ይኸውን

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 4
መን ኣሎ ድዩ ፍጡር ዕድመ ከይሃብካዮ ነዚ ዘርክበሉ
መን ኣሎ''ኸ ዕውት ጥዕዩ ደው ከየበለ ዝበጽሕ ኣብ ኩሉ
ንዓይ ''ውን ኦ ግይታይ
ናይ ትማል ውህበትካ ገና ኣብ ልበይ ከሎ

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 5
ነዚ ወሲኽካንስ
ኣምሳያ ልግስኻስ ''ታይ ኣሎ''ሞ ዝብሎ
እዝ።።።።።።።።።።።።።።።።።።።።።።።።።።።
እቲ ኹሉ ዝሓለፈኩዎ ዓቐብን ቊልቊን ብዓወት ክሰግሮ

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 6
እቲ ኹሉ ዝሰገርኩዎ ታኼላን ተኾርባን በርቲዐ ክሰግሮ
ኃይሊ መን ድዩ ነይሩ ነዚ ፈጹም ስቕታይ ኩሉ ዝስበረ
አይንሰኻ''ንዲኻ ዓመታት ትዕግሦተየ ደስታ ዝቐየረ
ኣንታ''ቦ ውዕለተይ

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ

VERSE 7
ሓለል''ዪ ብሓቂ ናትካ ውሉድ ምዃን
ብኽብርን ምስጋናን
ኣምልኾን ውዳሴን ዘለዓለም ተመስገን
ኣማን

CHORUS
እዚ ''ኸ መን ይረኽቦ እዝጊ ዝሃቦ(2)
ክበሃል ሰሚዐ ብዙኀ ኣሰተንኪረ(2)
ኣንታ ፍቱወይ ለዋህ አቦ
ተመስገን ኣምላኸይ እማን ብእማን ለካ ንኹሎ ዛዚምካዮ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 1
Temesgen medheney ametat tiegstey desta qeyrkayo
Nisኻ enete zeyhanets’ka men t’beb mis habo henets’ti seb eyo
Nisኻ enetezeyheleኻ halawi ketema mineቕhe''do ilkayo
Ane''win amlaኸy bizey degef ideka yelen natey zeblo

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 2
Kemey nesኻ iኻ tibat wisht’ey wisht’ey libey ziwkelo
Temesegen amlaኸy
Qidemi kuluneger nisኻ kebereley
Temesegen giytaye

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 3
Qidemi kulu neger liel beleley
Ez...............................
Eti zinefa feresegna kem nifese kihmbeb hayley''do eblo yiኸwn
Eti zimkah biflt’etu ab t’rzi ente bets’hes natey''do eblo yiኸwn

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 4
Men alo diyu fit’ur edme keyhabkayo nezi zerkbelu
Men alo''ኸ ewt t’eyu dew keyebele zibets’h ab kulu
Niay ''win o giytay
Nay timal wihbetka gena ab libey kelo

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 5
Nezi wesiኽkans
Amsaya ligsኻs ''tay alo''mo ziblo
Ez...........................
Eti ኹlu zihalefekuwo aቐbn qwilqwin biawet kisegro

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 6
Eti ኹlu zisegerkuwo taኼlan teኾrban bertia kisegro
Hayli men diyu neyru nezi fets’um siቕtay kulu zisbere
Aynseኻ''nidiኻ ametat tiegsoteye desta ziቐyere
Anta''bo wieletey

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo

VERSE 7
Halel''yi bihaqi natka wilud mikhwan
Biኽbrn misganan
Amlኾn widasen zelealem temesgen
Aman

CHORUS
Ezi ''ኸ men yireኽbo ezgi zihabo (2)
Kibehal semia bizuhe asetenkire (2)
Anta fituwey lewah abo
Temesgen amlaኸy eman bieman leka niኹlo zazimkayo'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-mezmur-3615', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: ERITREAN ORTHODOX MEZMUR . MEQRBEY by D.Yishaq Negasi (eritrean-orthodox-mezmur-meqrbey-by-d-yishaq-negasi)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ስዱድ ልበይ መዕቆቢቱ ንስኺ ጸላም ቤተይ ብርሃኑ ባዕልኺ
ኣንቲ ኣደብርሃነይ ወረ መን ክብለኪ ሕልፊ ኩሉ መቕርበይ ዝኾንኪ
ድንግል መንክብለኪ እወ መንክብለኪ
ሕልፊ ኩሉ መቕርበይ ዝኾንኪ

VERSE 1
ዘይበርህ ዝመስል ድቕድቕ ደልሃመት ዓለም ዘቁርጸኒ ተስፋ
ናይ ሓልዩትኪ ባና ክቕዶ ነፍሰይ ተመልኪታ ልዉሃትክን ፍቕርኽን ርእየ ከሳልየኒ
ክገልጾ ዉዕለትኪ ቃላት ሕቅጺሩኒ
እሞ መንክብለኪ ድንግል ማርያም ኣደይ ኣይተረኽበን በቃ ከማኺ መቕርበይ

VERSE 2
ኣበይ ዝጸነዐ መሪር ስቓይ ምስ ሓዘን ከሳጽየኒ ፍጹም
ጀለምታ ንብዓተይ ዕለትዕለት የዒንተይ ከፍስስ ዝብጽሓኒ ፍጹም ርድኤትክን ሳህልኽን
ኣብ ቀዝሒ ሕሰመይ ፍቅራኪ ክስሕን
ተንቲነ ብልቢ ብዓቅመይ ምርሚረ

VERSE 3
ሓለፋ መቕርበይ ሙኻንኺ ደምዲመ',
      lyrics_transliteration = 'Sidud libey meeqobitu nisኺ ts’elam betey birhanu baelኺ
Anti adebrhaney were men kibleki hilfi kulu meቕrbey ziኾnki
Dingil menkbleki ewe menkbleki
Hilfi kulu meቕrbey ziኾnki

VERSE 1
Zeyberh zimesl diቕdቕ delhamet alem zequrts’eni tesfa
Nay halyutki bana kiቕdo nefsey temelkita liwuhatkn fiቕrኽn rieye kesalyeni
Kigelts’o wueletki qalat hiqts’iruni
Emo menkbleki Dingil Maryam adey aytereኽben beqa kemaኺ meቕrbey

VERSE 2
Abey zits’enea merir siቓy mis hazen kesats’yeni fits’um
Jelemta nibatey eletelet yeintey kefss zibts’hani fits’um ridetkn sahlኽn
Ab qezhi hisemey fiqraki kishn
Tentine bilbi biaqmey mirmire

VERSE 3
Halefa meቕrbey muኻnኺ demdime',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-mezmur-meqrbey-by-d-yishaq-negasi'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስዱድ ልበይ መዕቆቢቱ ንስኺ ጸላም ቤተይ ብርሃኑ ባዕልኺ
ኣንቲ ኣደብርሃነይ ወረ መን ክብለኪ ሕልፊ ኩሉ መቕርበይ ዝኾንኪ
ድንግል መንክብለኪ እወ መንክብለኪ
ሕልፊ ኩሉ መቕርበይ ዝኾንኪ

VERSE 1
ዘይበርህ ዝመስል ድቕድቕ ደልሃመት ዓለም ዘቁርጸኒ ተስፋ
ናይ ሓልዩትኪ ባና ክቕዶ ነፍሰይ ተመልኪታ ልዉሃትክን ፍቕርኽን ርእየ ከሳልየኒ
ክገልጾ ዉዕለትኪ ቃላት ሕቅጺሩኒ
እሞ መንክብለኪ ድንግል ማርያም ኣደይ ኣይተረኽበን በቃ ከማኺ መቕርበይ

CHORUS
ስዱድ ልበይ መዕቆቢቱ ንስኺ ጸላም ቤተይ ብርሃኑ ባዕልኺ
ኣንቲ ኣደብርሃነይ ወረ መን ክብለኪ ሕልፊ ኩሉ መቕርበይ ዝኾንኪ
ድንግል መንክብለኪ እወ መንክብለኪ
ሕልፊ ኩሉ መቕርበይ ዝኾንኪ

VERSE 2
ኣበይ ዝጸነዐ መሪር ስቓይ ምስ ሓዘን ከሳጽየኒ ፍጹም
ጀለምታ ንብዓተይ ዕለትዕለት የዒንተይ ከፍስስ ዝብጽሓኒ ፍጹም ርድኤትክን ሳህልኽን
ኣብ ቀዝሒ ሕሰመይ ፍቅራኪ ክስሕን
ተንቲነ ብልቢ ብዓቅመይ ምርሚረ

CHORUS
ስዱድ ልበይ መዕቆቢቱ ንስኺ ጸላም ቤተይ ብርሃኑ ባዕልኺ
ኣንቲ ኣደብርሃነይ ወረ መን ክብለኪ ሕልፊ ኩሉ መቕርበይ ዝኾንኪ
ድንግል መንክብለኪ እወ መንክብለኪ
ሕልፊ ኩሉ መቕርበይ ዝኾንኪ

VERSE 3
ሓለፋ መቕርበይ ሙኻንኺ ደምዲመ

CHORUS
ስዱድ ልበይ መዕቆቢቱ ንስኺ ጸላም ቤተይ ብርሃኑ ባዕልኺ
ኣንቲ ኣደብርሃነይ ወረ መን ክብለኪ ሕልፊ ኩሉ መቕርበይ ዝኾንኪ
ድንግል መንክብለኪ እወ መንክብለኪ
ሕልፊ ኩሉ መቕርበይ ዝኾንኪ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sidud libey meeqobitu nisኺ ts’elam betey birhanu baelኺ
Anti adebrhaney were men kibleki hilfi kulu meቕrbey ziኾnki
Dingil menkbleki ewe menkbleki
Hilfi kulu meቕrbey ziኾnki

VERSE 1
Zeyberh zimesl diቕdቕ delhamet alem zequrts’eni tesfa
Nay halyutki bana kiቕdo nefsey temelkita liwuhatkn fiቕrኽn rieye kesalyeni
Kigelts’o wueletki qalat hiqts’iruni
Emo menkbleki Dingil Maryam adey aytereኽben beqa kemaኺ meቕrbey

CHORUS
Sidud libey meeqobitu nisኺ ts’elam betey birhanu baelኺ
Anti adebrhaney were men kibleki hilfi kulu meቕrbey ziኾnki
Dingil menkbleki ewe menkbleki
Hilfi kulu meቕrbey ziኾnki

VERSE 2
Abey zits’enea merir siቓy mis hazen kesats’yeni fits’um
Jelemta nibatey eletelet yeintey kefss zibts’hani fits’um ridetkn sahlኽn
Ab qezhi hisemey fiqraki kishn
Tentine bilbi biaqmey mirmire

CHORUS
Sidud libey meeqobitu nisኺ ts’elam betey birhanu baelኺ
Anti adebrhaney were men kibleki hilfi kulu meቕrbey ziኾnki
Dingil menkbleki ewe menkbleki
Hilfi kulu meቕrbey ziኾnki

VERSE 3
Halefa meቕrbey muኻnኺ demdime

CHORUS
Sidud libey meeqobitu nisኺ ts’elam betey birhanu baelኺ
Anti adebrhaney were men kibleki hilfi kulu meቕrbey ziኾnki
Dingil menkbleki ewe menkbleki
Hilfi kulu meቕrbey ziኾnki'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-mezmur-meqrbey-by-d-yishaq-negasi', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: eritrean orthodox tewahdo mezmur (eritrean-orthodox-tewahdo-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 1
ሃሌ ሃሌ ሉያ
ሃሌ ሃለ ሉያቅ
ንጉስ ጎይታ ዓለም ቅ
ገንሸል መስፍን ሰላም

VERSE 2
መርገምና ከጥፋ
ቁስላ ክፍዉስ
ከም ሓትእ ተቆጽረ
ዕዳና ክድምስስ

VERSE 3
ግሩም መካር ሓይል
ተወልደ ኣብ ግርግም
ክእዉጅ ንሰላም
ጎይታ መድሃኔ ኣለም

VERSE 4
ኣብ ኤፍራታ ሰሚዕናዮ
ኣብቲ ጫካ ረኺብናዮ
ናብ መሕደሪኡ ኣቲና
ኣብ ቅድሚ እግሩ ሰገድና

VERSE 5
ኣንቲ ቤተልሄም
ኣቤት ተዓዲልኪ
ከተማ መላእክት
ንራማ መሲልኪ

VERSE 6
ንዑ ደቂ ኣምላክ
ንገስግስ ናባዛ ቤት
ነጻላና ኣልዕላና
ክንዝምር ምስ ጓሶት

VERSE 7
ኣምላክ ስጋ ክዉንን
ኣደ ድንግል ክትከዉን
ድንቅዩ መስተንክር
ንዑ እስከ ንዘምር

VERSE 8
ቅዱሳን መላእክት
ኣንሸብሺቦምላ
ስብሃት ንእግዚኣብሄር
ኢሎም ዓለሉላ

VERSE 9
ሰብ ጥበብ ገስገሱ
ዝንኡ መጉሱ
ወርቂ ዕጣን ከርቤ
ንኽብሩ ለገሱ

VERSE 10
ትንቢት ተነግረሉ
ኣዳም ዝድሕነሉ
ሓላዊ እስራኤል
ተወሊዱ ገንሸል

VERSE 11
ጎይታ ምስ ፈተወ
ንኽፍዉሰና
ንገብሪኤል ለኣኾ
ናብ ድንግል ኣደና

VERSE 12
ይኹነለይ በለት
እታ ንጽህቲ ኣደ
ምድሓኑ ክፍጽም
ንሱ ዉን ተወልደ

VERSE 13
ኣታ ዝኣምላክና
ክንደይ የፍቅረና
ምስ ኩሉ ሓጥያትናስ
ተወሊዱ ካባና',
      lyrics_transliteration = 'Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 1
Hale Halleluya
Hale hale luyaq
Nigus goyta alem q
Genshel mesfn selam

VERSE 2
Mergemna ket’fa
Qusla kifwus
Kem hate teqots’re
Edana kidmss

VERSE 3
Girum mekar hayl
Tewelde ab girgm
Kiewuj niselam
Goyta medhane alem

VERSE 4
Ab efrata semienayo
Abti ch’aka reኺbnayo
Nab mehderiu atina
Ab qidmi egru segedna

VERSE 5
Anti betelhem
Abet teadilki
Ketema melaekt
Nirama mesilki

VERSE 6
Niu deqi amlak
Nigesgs nabaza bet
Nets’alana alelana
Kinzmr mis gwasot

VERSE 7
Amlak siga kiwunn
Ade Dingil kitkewun
Dinqyu mestenkr
Niu eske nizemr

VERSE 8
Kidusan melaekt
Anshebshibomla
Sibhat niegziabher
Ilom alelula

VERSE 9
Seb t’beb gesgesu
Zinu megusu
Werqi et’an kerbe
Niኽbru legesu

VERSE 10
Tinbit tenegrelu
Adam zidhnelu
Halawi esrael
Tewelidu genshel

VERSE 11
Goyta mis fetewe
Niኽfwusena
Nigebriel leaኾ
Nab Dingil adena

VERSE 12
Yiኹneley belet
Eta nits’hti ade
Midhanu kifts’m
Nisu wun tewelde

VERSE 13
Ata ziamlakna
Kindey yefqrena
Mis kulu hat’yatnas
Tewelidu kabana',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-tewahdo-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 1
ሃሌ ሃሌ ሉያ
ሃሌ ሃለ ሉያቅ
ንጉስ ጎይታ ዓለም ቅ
ገንሸል መስፍን ሰላም

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 2
መርገምና ከጥፋ
ቁስላ ክፍዉስ
ከም ሓትእ ተቆጽረ
ዕዳና ክድምስስ

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 3
ግሩም መካር ሓይል
ተወልደ ኣብ ግርግም
ክእዉጅ ንሰላም
ጎይታ መድሃኔ ኣለም

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 4
ኣብ ኤፍራታ ሰሚዕናዮ
ኣብቲ ጫካ ረኺብናዮ
ናብ መሕደሪኡ ኣቲና
ኣብ ቅድሚ እግሩ ሰገድና

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 5
ኣንቲ ቤተልሄም
ኣቤት ተዓዲልኪ
ከተማ መላእክት
ንራማ መሲልኪ

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 6
ንዑ ደቂ ኣምላክ
ንገስግስ ናባዛ ቤት
ነጻላና ኣልዕላና
ክንዝምር ምስ ጓሶት

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 7
ኣምላክ ስጋ ክዉንን
ኣደ ድንግል ክትከዉን
ድንቅዩ መስተንክር
ንዑ እስከ ንዘምር

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 8
ቅዱሳን መላእክት
ኣንሸብሺቦምላ
ስብሃት ንእግዚኣብሄር
ኢሎም ዓለሉላ

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 9
ሰብ ጥበብ ገስገሱ
ዝንኡ መጉሱ
ወርቂ ዕጣን ከርቤ
ንኽብሩ ለገሱ

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 10
ትንቢት ተነግረሉ
ኣዳም ዝድሕነሉ
ሓላዊ እስራኤል
ተወሊዱ ገንሸል

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 11
ጎይታ ምስ ፈተወ
ንኽፍዉሰና
ንገብሪኤል ለኣኾ
ናብ ድንግል ኣደና

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 12
ይኹነለይ በለት
እታ ንጽህቲ ኣደ
ምድሓኑ ክፍጽም
ንሱ ዉን ተወልደ

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ

VERSE 13
ኣታ ዝኣምላክና
ክንደይ የፍቅረና
ምስ ኩሉ ሓጥያትናስ
ተወሊዱ ካባና

CHORUS
ተውልደ ናሁ ተወልደ
ኣብ ቤተሊሄም ተወልደ
ህዝቢ እግዚኣብሄር ዓልሉ
ጎይታ ምድሓንኩም ተወሊዱ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 1
Hale Halleluya
Hale hale luyaq
Nigus goyta alem q
Genshel mesfn selam

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 2
Mergemna ket’fa
Qusla kifwus
Kem hate teqots’re
Edana kidmss

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 3
Girum mekar hayl
Tewelde ab girgm
Kiewuj niselam
Goyta medhane alem

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 4
Ab efrata semienayo
Abti ch’aka reኺbnayo
Nab mehderiu atina
Ab qidmi egru segedna

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 5
Anti betelhem
Abet teadilki
Ketema melaekt
Nirama mesilki

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 6
Niu deqi amlak
Nigesgs nabaza bet
Nets’alana alelana
Kinzmr mis gwasot

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 7
Amlak siga kiwunn
Ade Dingil kitkewun
Dinqyu mestenkr
Niu eske nizemr

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 8
Kidusan melaekt
Anshebshibomla
Sibhat niegziabher
Ilom alelula

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 9
Seb t’beb gesgesu
Zinu megusu
Werqi et’an kerbe
Niኽbru legesu

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 10
Tinbit tenegrelu
Adam zidhnelu
Halawi esrael
Tewelidu genshel

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 11
Goyta mis fetewe
Niኽfwusena
Nigebriel leaኾ
Nab Dingil adena

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 12
Yiኹneley belet
Eta nits’hti ade
Midhanu kifts’m
Nisu wun tewelde

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu

VERSE 13
Ata ziamlakna
Kindey yefqrena
Mis kulu hat’yatnas
Tewelidu kabana

CHORUS
Tewlde nahu tewelde
Ab betelihem tewelde
Hizbi egziabher allu
Goyta midhankum tewelidu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-tewahdo-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eritrean orthodox tewahdo mezmur (eritrean-orthodox-tewahdo-mezmur-1035)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ብሓይሊ ናይ ሕጊ መውግእ ኮይኑ ሓጥያት
ኣሕሊፉ ሂቡና ተገዚእና ብሞት
ወዲ ኣምላኽ ግና ስጋና ለቢሱ
ሓራ ከውጽአና ሞትና ተቋዲሱ (2)

VERSE 1
> ደጊም ኣብቂዑ''ዪ ታሪኹ መቃብር
ተዋሒጡ በቃ ብናይ እየሱስ ስልጣን
ዝነበሮ ኩሉ ምርኮ ተዘሚቱ
ዕርቃነ ወጺኡ ሓይሉ ተቀንጢጡ

VERSE 2
ሞት ክሕዞ ኣይክኣለን ነቲ ጻድቅ
ተንሲኡ Yesus ንዓና ከጽድቅ
ሒዙ ክሕዞ ኣይክኣለን ነቲ ጻድቅ
ተንሲኡ Yesus ንዓና ከጽድቅ

VERSE 3
ብሓይሊ ናይ ሕጊ መውግእ ኮይኑ ሓጥያት
ኣሕሊፉ ሂቡና ተገዚእና ብሞት
ወዲ ኣምላኽ ግና ስጋና ለቢሱ
ሓራ ከውጽአና ሞትና ተቋዲሱ

VERSE 4
> ብበደል ሓደ ሰብ ኩላትና ካብ ሞትና
ብጎይታ Yesus ውን ደቂ ትንሳኤ''ና
መሰልናን ነገርናን ንኹሉ ወዲኡ
ምስኡ ኣቐመጠና ኣብ የማን ኣቡኡ

VERSE 5
ደጊም ሞት ስልጣን የብሉን ኣብ ልዕሌና
ናይ ኣቦ ወረስቲ ፍቑራቱ ኢና
ሕጅስ ሞት ስልጣን የብሉን ኣብ ልዕሌና
ናይ ኣቦ ወረስቲ ፍቑራቱ ኢና

VERSE 6
ብሓይሊ ናይ ሕጊ መውግእ ኮይኑ ሓጥያት
ኣሕሊፉ ሂቡና ተገዚእና ብሞት
ወዲ ኣምላኽ ግና ስጋና ለቢሱ
ሓራ ከውጽአና ሞትና ተቋዲሱ

VERSE 7
> ንዕኡ ክነብር ምስኡ ካብ ተንሳእና
ክፉኣት ኣይሰልጥን ኣብ መቅደስ ስጋና
ደጊም ናትና ኣይኮነን ዘለናዬ ሂወት
ሓርነትና ኣይንግበሮ ምኽንያት ሓጥያት

VERSE 8
ትንቁዱሳን ዝግባእ ምስጋና እምበር
ኣይረኸበና ንፍቃዱ ዝጻረር
ትንቁዱሳን ዝግባእ ምስጋና እምበር
ኣይረኸበና ን''GoYta ዘየኽብር

VERSE 9
ብሓይሊ ናይ ሕጊ መውግእ ኮይኑ ሓጥያት
ኣሕሊፉ ሂቡና ተገዚእና ብሞት
ወዲ ኣምላኽ ግና ስጋና ለቢሱ
ሓራ ከውጽአና ሞትና ተቋዲሱ (2)',
      lyrics_transliteration = 'Bihayli nay higi mewge koynu hat’yat
Ahlifu hibuna tegeziena bimot
Wedi amlaኽ gina sigana lebisu
Hara kewts’ana motna teqwadisu (2)

VERSE 1
> degim abqiu''yi tariኹ meqabr
Tewahit’u beqa binay eyesus silt’an
Zinebero kulu mirko tezemitu
Erqane wets’iu haylu teqent’it’u

VERSE 2
Mot kihzo aykalen neti ts’adq
Tensiu Yesus niana kets’dq
Hizu kihzo aykalen neti ts’adq
Tensiu Yesus niana kets’dq

VERSE 3
Bihayli nay higi mewge koynu hat’yat
Ahlifu hibuna tegeziena bimot
Wedi amlaኽ gina sigana lebisu
Hara kewts’ana motna teqwadisu

VERSE 4
> bibedel hade seb kulatna kab motna
Bigoyta Yesus win deqi tinsae''na
Meselnan negernan niኹlu wediu
Misu aቐmet’ena ab yeman abuu

VERSE 5
Degim mot silt’an yeblun ab lielena
Nay abo weresti fiቑratu ina
Hijs mot silt’an yeblun ab lielena
Nay abo weresti fiቑratu ina

VERSE 6
Bihayli nay higi mewge koynu hat’yat
Ahlifu hibuna tegeziena bimot
Wedi amlaኽ gina sigana lebisu
Hara kewts’ana motna teqwadisu

VERSE 7
> nieu kinebr misu kab tensaena
Kifuat ayselt’n ab meqdes sigana
Degim natna aykonen zelenaye hiwet
Harnetna ayngbero miኽnyat hat’yat

VERSE 8
Tinqudusan zigbae misgana ember
Ayreኸbena nifqadu zits’arer
Tinqudusan zigbae misgana ember
Ayreኸbena n''GoYta zeyeኽbr

VERSE 9
Bihayli nay higi mewge koynu hat’yat
Ahlifu hibuna tegeziena bimot
Wedi amlaኽ gina sigana lebisu
Hara kewts’ana motna teqwadisu (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-tewahdo-mezmur-1035'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ብሓይሊ ናይ ሕጊ መውግእ ኮይኑ ሓጥያት
ኣሕሊፉ ሂቡና ተገዚእና ብሞት
ወዲ ኣምላኽ ግና ስጋና ለቢሱ
ሓራ ከውጽአና ሞትና ተቋዲሱ (2)

VERSE 1
> ደጊም ኣብቂዑ''ዪ ታሪኹ መቃብር
ተዋሒጡ በቃ ብናይ እየሱስ ስልጣን
ዝነበሮ ኩሉ ምርኮ ተዘሚቱ
ዕርቃነ ወጺኡ ሓይሉ ተቀንጢጡ

CHORUS
ብሓይሊ ናይ ሕጊ መውግእ ኮይኑ ሓጥያት
ኣሕሊፉ ሂቡና ተገዚእና ብሞት
ወዲ ኣምላኽ ግና ስጋና ለቢሱ
ሓራ ከውጽአና ሞትና ተቋዲሱ (2)

VERSE 2
ሞት ክሕዞ ኣይክኣለን ነቲ ጻድቅ
ተንሲኡ Yesus ንዓና ከጽድቅ
ሒዙ ክሕዞ ኣይክኣለን ነቲ ጻድቅ
ተንሲኡ Yesus ንዓና ከጽድቅ

CHORUS
ብሓይሊ ናይ ሕጊ መውግእ ኮይኑ ሓጥያት
ኣሕሊፉ ሂቡና ተገዚእና ብሞት
ወዲ ኣምላኽ ግና ስጋና ለቢሱ
ሓራ ከውጽአና ሞትና ተቋዲሱ (2)

VERSE 3
ብሓይሊ ናይ ሕጊ መውግእ ኮይኑ ሓጥያት
ኣሕሊፉ ሂቡና ተገዚእና ብሞት
ወዲ ኣምላኽ ግና ስጋና ለቢሱ
ሓራ ከውጽአና ሞትና ተቋዲሱ

CHORUS
ብሓይሊ ናይ ሕጊ መውግእ ኮይኑ ሓጥያት
ኣሕሊፉ ሂቡና ተገዚእና ብሞት
ወዲ ኣምላኽ ግና ስጋና ለቢሱ
ሓራ ከውጽአና ሞትና ተቋዲሱ (2)

VERSE 4
> ብበደል ሓደ ሰብ ኩላትና ካብ ሞትና
ብጎይታ Yesus ውን ደቂ ትንሳኤ''ና
መሰልናን ነገርናን ንኹሉ ወዲኡ
ምስኡ ኣቐመጠና ኣብ የማን ኣቡኡ

CHORUS
ብሓይሊ ናይ ሕጊ መውግእ ኮይኑ ሓጥያት
ኣሕሊፉ ሂቡና ተገዚእና ብሞት
ወዲ ኣምላኽ ግና ስጋና ለቢሱ
ሓራ ከውጽአና ሞትና ተቋዲሱ (2)

VERSE 5
ደጊም ሞት ስልጣን የብሉን ኣብ ልዕሌና
ናይ ኣቦ ወረስቲ ፍቑራቱ ኢና
ሕጅስ ሞት ስልጣን የብሉን ኣብ ልዕሌና
ናይ ኣቦ ወረስቲ ፍቑራቱ ኢና

CHORUS
ብሓይሊ ናይ ሕጊ መውግእ ኮይኑ ሓጥያት
ኣሕሊፉ ሂቡና ተገዚእና ብሞት
ወዲ ኣምላኽ ግና ስጋና ለቢሱ
ሓራ ከውጽአና ሞትና ተቋዲሱ (2)

VERSE 6
ብሓይሊ ናይ ሕጊ መውግእ ኮይኑ ሓጥያት
ኣሕሊፉ ሂቡና ተገዚእና ብሞት
ወዲ ኣምላኽ ግና ስጋና ለቢሱ
ሓራ ከውጽአና ሞትና ተቋዲሱ

CHORUS
ብሓይሊ ናይ ሕጊ መውግእ ኮይኑ ሓጥያት
ኣሕሊፉ ሂቡና ተገዚእና ብሞት
ወዲ ኣምላኽ ግና ስጋና ለቢሱ
ሓራ ከውጽአና ሞትና ተቋዲሱ (2)

VERSE 7
> ንዕኡ ክነብር ምስኡ ካብ ተንሳእና
ክፉኣት ኣይሰልጥን ኣብ መቅደስ ስጋና
ደጊም ናትና ኣይኮነን ዘለናዬ ሂወት
ሓርነትና ኣይንግበሮ ምኽንያት ሓጥያት

CHORUS
ብሓይሊ ናይ ሕጊ መውግእ ኮይኑ ሓጥያት
ኣሕሊፉ ሂቡና ተገዚእና ብሞት
ወዲ ኣምላኽ ግና ስጋና ለቢሱ
ሓራ ከውጽአና ሞትና ተቋዲሱ (2)

VERSE 8
ትንቁዱሳን ዝግባእ ምስጋና እምበር
ኣይረኸበና ንፍቃዱ ዝጻረር
ትንቁዱሳን ዝግባእ ምስጋና እምበር
ኣይረኸበና ን''GoYta ዘየኽብር

CHORUS
ብሓይሊ ናይ ሕጊ መውግእ ኮይኑ ሓጥያት
ኣሕሊፉ ሂቡና ተገዚእና ብሞት
ወዲ ኣምላኽ ግና ስጋና ለቢሱ
ሓራ ከውጽአና ሞትና ተቋዲሱ (2)

VERSE 9
ብሓይሊ ናይ ሕጊ መውግእ ኮይኑ ሓጥያት
ኣሕሊፉ ሂቡና ተገዚእና ብሞት
ወዲ ኣምላኽ ግና ስጋና ለቢሱ
ሓራ ከውጽአና ሞትና ተቋዲሱ (2)

CHORUS
ብሓይሊ ናይ ሕጊ መውግእ ኮይኑ ሓጥያት
ኣሕሊፉ ሂቡና ተገዚእና ብሞት
ወዲ ኣምላኽ ግና ስጋና ለቢሱ
ሓራ ከውጽአና ሞትና ተቋዲሱ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bihayli nay higi mewge koynu hat’yat
Ahlifu hibuna tegeziena bimot
Wedi amlaኽ gina sigana lebisu
Hara kewts’ana motna teqwadisu (2)

VERSE 1
> degim abqiu''yi tariኹ meqabr
Tewahit’u beqa binay eyesus silt’an
Zinebero kulu mirko tezemitu
Erqane wets’iu haylu teqent’it’u

CHORUS
Bihayli nay higi mewge koynu hat’yat
Ahlifu hibuna tegeziena bimot
Wedi amlaኽ gina sigana lebisu
Hara kewts’ana motna teqwadisu (2)

VERSE 2
Mot kihzo aykalen neti ts’adq
Tensiu Yesus niana kets’dq
Hizu kihzo aykalen neti ts’adq
Tensiu Yesus niana kets’dq

CHORUS
Bihayli nay higi mewge koynu hat’yat
Ahlifu hibuna tegeziena bimot
Wedi amlaኽ gina sigana lebisu
Hara kewts’ana motna teqwadisu (2)

VERSE 3
Bihayli nay higi mewge koynu hat’yat
Ahlifu hibuna tegeziena bimot
Wedi amlaኽ gina sigana lebisu
Hara kewts’ana motna teqwadisu

CHORUS
Bihayli nay higi mewge koynu hat’yat
Ahlifu hibuna tegeziena bimot
Wedi amlaኽ gina sigana lebisu
Hara kewts’ana motna teqwadisu (2)

VERSE 4
> bibedel hade seb kulatna kab motna
Bigoyta Yesus win deqi tinsae''na
Meselnan negernan niኹlu wediu
Misu aቐmet’ena ab yeman abuu

CHORUS
Bihayli nay higi mewge koynu hat’yat
Ahlifu hibuna tegeziena bimot
Wedi amlaኽ gina sigana lebisu
Hara kewts’ana motna teqwadisu (2)

VERSE 5
Degim mot silt’an yeblun ab lielena
Nay abo weresti fiቑratu ina
Hijs mot silt’an yeblun ab lielena
Nay abo weresti fiቑratu ina

CHORUS
Bihayli nay higi mewge koynu hat’yat
Ahlifu hibuna tegeziena bimot
Wedi amlaኽ gina sigana lebisu
Hara kewts’ana motna teqwadisu (2)

VERSE 6
Bihayli nay higi mewge koynu hat’yat
Ahlifu hibuna tegeziena bimot
Wedi amlaኽ gina sigana lebisu
Hara kewts’ana motna teqwadisu

CHORUS
Bihayli nay higi mewge koynu hat’yat
Ahlifu hibuna tegeziena bimot
Wedi amlaኽ gina sigana lebisu
Hara kewts’ana motna teqwadisu (2)

VERSE 7
> nieu kinebr misu kab tensaena
Kifuat ayselt’n ab meqdes sigana
Degim natna aykonen zelenaye hiwet
Harnetna ayngbero miኽnyat hat’yat

CHORUS
Bihayli nay higi mewge koynu hat’yat
Ahlifu hibuna tegeziena bimot
Wedi amlaኽ gina sigana lebisu
Hara kewts’ana motna teqwadisu (2)

VERSE 8
Tinqudusan zigbae misgana ember
Ayreኸbena nifqadu zits’arer
Tinqudusan zigbae misgana ember
Ayreኸbena n''GoYta zeyeኽbr

CHORUS
Bihayli nay higi mewge koynu hat’yat
Ahlifu hibuna tegeziena bimot
Wedi amlaኽ gina sigana lebisu
Hara kewts’ana motna teqwadisu (2)

VERSE 9
Bihayli nay higi mewge koynu hat’yat
Ahlifu hibuna tegeziena bimot
Wedi amlaኽ gina sigana lebisu
Hara kewts’ana motna teqwadisu (2)

CHORUS
Bihayli nay higi mewge koynu hat’yat
Ahlifu hibuna tegeziena bimot
Wedi amlaኽ gina sigana lebisu
Hara kewts’ana motna teqwadisu (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-tewahdo-mezmur-1035', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eritrean Orthodox Tewahdo Mezmur (eritrean-orthodox-tewahdo-mezmur-1977)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ተወጢሕካ ኣብ ገልገል ኣነታ ገንሸል ምድሓን
ብኸተማ ውሽጠይ ሕለፍ ሰሙን ሰሙን
ሆሳእና ናበልኩ ብናይ ምግባር ስየ
ብተነጽፈ ልበይ ክቅበለካ''የ

VERSE 1
<><><><><><><><><><><>
ይቅሬታ ፍቱወይ ቤተይ ብምዕጻዉ
ከዕገሽግሽ ኣብ ውሽጠይ ደንጉየ ምርሓዉ
ብኣፍ ደገ ቤተይ ክትሓልፍ ታገልገል

VERSE 2
ኣሕሊፈዮ ዘመን ካብ ቃልካ ክኽወል
❝ዳግማይ ሕለፈኒ ኣነታ ብሩኽ ጎይታ❞
ሰሚዐ ደሃይካ ንልበይ ክኸፍታ
ዘዝሰማዕኩዎ ኣብ ልበይ ሓቲመ

VERSE 3
ብሕጊ መንፈስካ ውሽጠይ ተአበመ
<><><><><><><><><><><>
ምስ ጠመትኩ ውሽጠይ ገለ ተመጻኻ
ረኺበያ ልበይ ብኽፍኣት ዓቲኻ

VERSE 4
ልበይ ክሓጻጽብ ሰምቢደ ብጣዕሳ
ኣብ እግሪ መስቀልካ ብልቃጠይ የፍስሳ
❝ናፍቖተይ ኢኻ ዘወትር ወግሐ ጸብሐ ❞
ውሽጠይ ዝሰራሰር ድምጽኻ ክደሀ

VERSE 5
ኣይቀበጽኩን ገና ክሳዕ ዕራብ ጸሓይ
ትሓልፎ ከጽሪ ይነብዕ ናብ ውሽጠይ
<><><><><><><><><><><>
ድኻ መነን ውሽጠይ ክትሓልፎ ዘይበቅዕ

VERSE 6
ሃንቀው እንተበለ ድምጽኻ ክሰምዕ
ከመይ ብሓለፋ ምምጻእካ ዘይሃርፍ
ኣሰር ርጋጽካ''ንድዩ ፍቅርኻ ዝንድፍ
❝ሽዑየ ዝዘልል ቀቅድሚ ታኣድጊ

VERSE 7
ቆጻል ሞግባር ስየ ሰሊዐ ብባህጊ
ንህጻናት ውሽጠይ ሰሪዐ ብፍቅሪ
ስለ ኵሉ ነገር ምስጋናይ ዘዛሪ
<><><><><><><><><><><>

VERSE 8
ኣብታ ጻዕብ ኣድጊ ተዓጂብካ ርእየ
ህርፋን ዘንቀስኒ ወዲ ቢታንያ''የ
ሆሳእና ሰንበተይ ብጽድቂ ከኽብራ
ነዛ እምኒ ነፍሰይ ብምሕረት ዘክራ

VERSE 9
❝መጽየ''ለኹ ቤትካ በቲ ትሓልፈሉ ❞
ንዓኻ ክቅበል ኣንታ ጸዋር ኵሉ
ከም ብዝሒ ሞሕረትካ ክብርኻ ከሕውዮ
ርገጾ ንልበይ ''ነኹልካ ኣንጺፈዮ',
      lyrics_transliteration = 'Tewet’ihka ab gelgel aneta genshel midhan
Biኸtema wisht’ey hilef semun semun
Hosaena nabelku binay migbar siye
Bitenets’fe libey kiqbeleka''ye

VERSE 1
<><><><><><><><><><><>
Yiqreta fituwey betey bimets’awu
Keegeshgsh ab wisht’ey denguye mirhawu
Biaf dege betey kithalf tagelgel

VERSE 2
Ahlifeyo zemen kab qalka kiኽwel
❝dagmay hilefeni aneta biruኽ goyta❞
Semia dehayka nilbey kiኸfta
Zezsemaekuwo ab libey hatime

VERSE 3
Bihgi menfeska wisht’ey teabeme
<><><><><><><><><><><>
Mis t’emetku wisht’ey gele temets’aኻ
Reኺbeya libey biኽfat atiኻ

VERSE 4
Libey kihats’ats’b sembide bit’aesa
Ab egri mesqelka bilqat’ey yefssa
❝nafቖtey iኻ zewetr weghe ts’ebhe ❞
Wisht’ey ziseraser dimts’ኻ kidehe

VERSE 5
Ayqebets’kun gena kisae erab ts’ehay
Tihalfo kets’ri yinebe nab wisht’ey
<><><><><><><><><><><>
Diኻ menen wisht’ey kithalfo zeybeqe

VERSE 6
Hanqew entebele dimts’ኻ kiseme
Kemey bihalefa mimts’aeka zeyharf
Aser rigats’ka''nidyu fiqrኻ zindf
❝shuye zizell qeqdmi taadgi

VERSE 7
Qots’al mogbar siye selia bibahgi
Nihts’anat wisht’ey seria bifqri
Sile kwlu neger misganay zezari
<><><><><><><><><><><>

VERSE 8
Abta ts’aeb adgi teajibka rieye
Hirfan zenqesni wedi bitanya''ye
Hosaena senbetey bits’dqi keኽbra
Neza emni nefsey bimhret zekra

VERSE 9
❝mets’ye''leኹ betka beti tihalfelu ❞
Niaኻ kiqbel anta ts’ewar kwlu
Kem bizhi mohretka kibrኻ kehwyo
Rigets’o nilbey ''neኹlka ants’ifeyo',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-tewahdo-mezmur-1977'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተወጢሕካ ኣብ ገልገል ኣነታ ገንሸል ምድሓን
ብኸተማ ውሽጠይ ሕለፍ ሰሙን ሰሙን
ሆሳእና ናበልኩ ብናይ ምግባር ስየ
ብተነጽፈ ልበይ ክቅበለካ''የ

VERSE 1
<><><><><><><><><><><>
ይቅሬታ ፍቱወይ ቤተይ ብምዕጻዉ
ከዕገሽግሽ ኣብ ውሽጠይ ደንጉየ ምርሓዉ
ብኣፍ ደገ ቤተይ ክትሓልፍ ታገልገል

CHORUS
ተወጢሕካ ኣብ ገልገል ኣነታ ገንሸል ምድሓን
ብኸተማ ውሽጠይ ሕለፍ ሰሙን ሰሙን
ሆሳእና ናበልኩ ብናይ ምግባር ስየ
ብተነጽፈ ልበይ ክቅበለካ''የ

VERSE 2
ኣሕሊፈዮ ዘመን ካብ ቃልካ ክኽወል
❝ዳግማይ ሕለፈኒ ኣነታ ብሩኽ ጎይታ❞
ሰሚዐ ደሃይካ ንልበይ ክኸፍታ
ዘዝሰማዕኩዎ ኣብ ልበይ ሓቲመ

CHORUS
ተወጢሕካ ኣብ ገልገል ኣነታ ገንሸል ምድሓን
ብኸተማ ውሽጠይ ሕለፍ ሰሙን ሰሙን
ሆሳእና ናበልኩ ብናይ ምግባር ስየ
ብተነጽፈ ልበይ ክቅበለካ''የ

VERSE 3
ብሕጊ መንፈስካ ውሽጠይ ተአበመ
<><><><><><><><><><><>
ምስ ጠመትኩ ውሽጠይ ገለ ተመጻኻ
ረኺበያ ልበይ ብኽፍኣት ዓቲኻ

CHORUS
ተወጢሕካ ኣብ ገልገል ኣነታ ገንሸል ምድሓን
ብኸተማ ውሽጠይ ሕለፍ ሰሙን ሰሙን
ሆሳእና ናበልኩ ብናይ ምግባር ስየ
ብተነጽፈ ልበይ ክቅበለካ''የ

VERSE 4
ልበይ ክሓጻጽብ ሰምቢደ ብጣዕሳ
ኣብ እግሪ መስቀልካ ብልቃጠይ የፍስሳ
❝ናፍቖተይ ኢኻ ዘወትር ወግሐ ጸብሐ ❞
ውሽጠይ ዝሰራሰር ድምጽኻ ክደሀ

CHORUS
ተወጢሕካ ኣብ ገልገል ኣነታ ገንሸል ምድሓን
ብኸተማ ውሽጠይ ሕለፍ ሰሙን ሰሙን
ሆሳእና ናበልኩ ብናይ ምግባር ስየ
ብተነጽፈ ልበይ ክቅበለካ''የ

VERSE 5
ኣይቀበጽኩን ገና ክሳዕ ዕራብ ጸሓይ
ትሓልፎ ከጽሪ ይነብዕ ናብ ውሽጠይ
<><><><><><><><><><><>
ድኻ መነን ውሽጠይ ክትሓልፎ ዘይበቅዕ

CHORUS
ተወጢሕካ ኣብ ገልገል ኣነታ ገንሸል ምድሓን
ብኸተማ ውሽጠይ ሕለፍ ሰሙን ሰሙን
ሆሳእና ናበልኩ ብናይ ምግባር ስየ
ብተነጽፈ ልበይ ክቅበለካ''የ

VERSE 6
ሃንቀው እንተበለ ድምጽኻ ክሰምዕ
ከመይ ብሓለፋ ምምጻእካ ዘይሃርፍ
ኣሰር ርጋጽካ''ንድዩ ፍቅርኻ ዝንድፍ
❝ሽዑየ ዝዘልል ቀቅድሚ ታኣድጊ

CHORUS
ተወጢሕካ ኣብ ገልገል ኣነታ ገንሸል ምድሓን
ብኸተማ ውሽጠይ ሕለፍ ሰሙን ሰሙን
ሆሳእና ናበልኩ ብናይ ምግባር ስየ
ብተነጽፈ ልበይ ክቅበለካ''የ

VERSE 7
ቆጻል ሞግባር ስየ ሰሊዐ ብባህጊ
ንህጻናት ውሽጠይ ሰሪዐ ብፍቅሪ
ስለ ኵሉ ነገር ምስጋናይ ዘዛሪ
<><><><><><><><><><><>

CHORUS
ተወጢሕካ ኣብ ገልገል ኣነታ ገንሸል ምድሓን
ብኸተማ ውሽጠይ ሕለፍ ሰሙን ሰሙን
ሆሳእና ናበልኩ ብናይ ምግባር ስየ
ብተነጽፈ ልበይ ክቅበለካ''የ

VERSE 8
ኣብታ ጻዕብ ኣድጊ ተዓጂብካ ርእየ
ህርፋን ዘንቀስኒ ወዲ ቢታንያ''የ
ሆሳእና ሰንበተይ ብጽድቂ ከኽብራ
ነዛ እምኒ ነፍሰይ ብምሕረት ዘክራ

CHORUS
ተወጢሕካ ኣብ ገልገል ኣነታ ገንሸል ምድሓን
ብኸተማ ውሽጠይ ሕለፍ ሰሙን ሰሙን
ሆሳእና ናበልኩ ብናይ ምግባር ስየ
ብተነጽፈ ልበይ ክቅበለካ''የ

VERSE 9
❝መጽየ''ለኹ ቤትካ በቲ ትሓልፈሉ ❞
ንዓኻ ክቅበል ኣንታ ጸዋር ኵሉ
ከም ብዝሒ ሞሕረትካ ክብርኻ ከሕውዮ
ርገጾ ንልበይ ''ነኹልካ ኣንጺፈዮ

CHORUS
ተወጢሕካ ኣብ ገልገል ኣነታ ገንሸል ምድሓን
ብኸተማ ውሽጠይ ሕለፍ ሰሙን ሰሙን
ሆሳእና ናበልኩ ብናይ ምግባር ስየ
ብተነጽፈ ልበይ ክቅበለካ''የ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tewet’ihka ab gelgel aneta genshel midhan
Biኸtema wisht’ey hilef semun semun
Hosaena nabelku binay migbar siye
Bitenets’fe libey kiqbeleka''ye

VERSE 1
<><><><><><><><><><><>
Yiqreta fituwey betey bimets’awu
Keegeshgsh ab wisht’ey denguye mirhawu
Biaf dege betey kithalf tagelgel

CHORUS
Tewet’ihka ab gelgel aneta genshel midhan
Biኸtema wisht’ey hilef semun semun
Hosaena nabelku binay migbar siye
Bitenets’fe libey kiqbeleka''ye

VERSE 2
Ahlifeyo zemen kab qalka kiኽwel
❝dagmay hilefeni aneta biruኽ goyta❞
Semia dehayka nilbey kiኸfta
Zezsemaekuwo ab libey hatime

CHORUS
Tewet’ihka ab gelgel aneta genshel midhan
Biኸtema wisht’ey hilef semun semun
Hosaena nabelku binay migbar siye
Bitenets’fe libey kiqbeleka''ye

VERSE 3
Bihgi menfeska wisht’ey teabeme
<><><><><><><><><><><>
Mis t’emetku wisht’ey gele temets’aኻ
Reኺbeya libey biኽfat atiኻ

CHORUS
Tewet’ihka ab gelgel aneta genshel midhan
Biኸtema wisht’ey hilef semun semun
Hosaena nabelku binay migbar siye
Bitenets’fe libey kiqbeleka''ye

VERSE 4
Libey kihats’ats’b sembide bit’aesa
Ab egri mesqelka bilqat’ey yefssa
❝nafቖtey iኻ zewetr weghe ts’ebhe ❞
Wisht’ey ziseraser dimts’ኻ kidehe

CHORUS
Tewet’ihka ab gelgel aneta genshel midhan
Biኸtema wisht’ey hilef semun semun
Hosaena nabelku binay migbar siye
Bitenets’fe libey kiqbeleka''ye

VERSE 5
Ayqebets’kun gena kisae erab ts’ehay
Tihalfo kets’ri yinebe nab wisht’ey
<><><><><><><><><><><>
Diኻ menen wisht’ey kithalfo zeybeqe

CHORUS
Tewet’ihka ab gelgel aneta genshel midhan
Biኸtema wisht’ey hilef semun semun
Hosaena nabelku binay migbar siye
Bitenets’fe libey kiqbeleka''ye

VERSE 6
Hanqew entebele dimts’ኻ kiseme
Kemey bihalefa mimts’aeka zeyharf
Aser rigats’ka''nidyu fiqrኻ zindf
❝shuye zizell qeqdmi taadgi

CHORUS
Tewet’ihka ab gelgel aneta genshel midhan
Biኸtema wisht’ey hilef semun semun
Hosaena nabelku binay migbar siye
Bitenets’fe libey kiqbeleka''ye

VERSE 7
Qots’al mogbar siye selia bibahgi
Nihts’anat wisht’ey seria bifqri
Sile kwlu neger misganay zezari
<><><><><><><><><><><>

CHORUS
Tewet’ihka ab gelgel aneta genshel midhan
Biኸtema wisht’ey hilef semun semun
Hosaena nabelku binay migbar siye
Bitenets’fe libey kiqbeleka''ye

VERSE 8
Abta ts’aeb adgi teajibka rieye
Hirfan zenqesni wedi bitanya''ye
Hosaena senbetey bits’dqi keኽbra
Neza emni nefsey bimhret zekra

CHORUS
Tewet’ihka ab gelgel aneta genshel midhan
Biኸtema wisht’ey hilef semun semun
Hosaena nabelku binay migbar siye
Bitenets’fe libey kiqbeleka''ye

VERSE 9
❝mets’ye''leኹ betka beti tihalfelu ❞
Niaኻ kiqbel anta ts’ewar kwlu
Kem bizhi mohretka kibrኻ kehwyo
Rigets’o nilbey ''neኹlka ants’ifeyo

CHORUS
Tewet’ihka ab gelgel aneta genshel midhan
Biኸtema wisht’ey hilef semun semun
Hosaena nabelku binay migbar siye
Bitenets’fe libey kiqbeleka''ye'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-tewahdo-mezmur-1977', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eritrean Orthodox Tewahdo Mezmur (eritrean-orthodox-tewahdo-mezmur-2024)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 1
ዘይከምቲ ባርያኻ ፈሊጡ ድኻሙ
ብጻዩ ዝሰትር ከፊኡ ሓሲሙ
ወይነይ ኣነ ምግዱር ብሓወይ ዝውዕል
ከማሙቅ ንእዝኒ ወረ ዝፈታትል

VERSE 2
መሓረኒ ጎይታይ ንልበይ ኣትሒተ ናብ ዉሽጠይ ከስተብህል
ምኽርኻ ሰሚዐ ቤተይ ክኾሳትር
ምስ ኣልገሰ ዓይነይ ካብ ናይ ሓወይ በሰር
ሃሰስ ኢለ ዉሽጠይ ረኺበዮ ጉዳ

VERSE 3
ኣነ ይሓይሽ ዝብል ትዕኑን ተሪር ጉንዳ
ኣዝ….
ኣንታ መድሕን ነፍሰይ ስምካ ተቀኒተ
ከም ዝሕረድ ገንሸል ኣፍካ ዘይተኸፍተ

VERSE 4
ምሳኻ እናበልኩ ብግርህቲ ልቢ
ኩላዕ በደል ብጻይ ምጻሩ ክኣቢ
ምሓረኒ ጎይታይ ኣብ ሕድገት ክዓቢ
ብጭጉራፍ ናይ ሓወይ ጉህዩ ንኸይ ደንን

VERSE 5
ርድኣዮ ንልበይ ጭጉራፍካ ከስተንትን
ሳዕሪ ሓንኵልዎ ምሒር ካብ ዝናወጽ
ንዓይስ ካብ ምባል ኣሜን ንኽመርጽ
ኣዝ……

VERSE 6
እቲ ልዑል ክብርኻ ማሕደር ስጋይ ሓርዩ
ካብ ዙፋን ክብርኻ ምዉራድካ ደልዩ
ስሉም ኣዳራሻት ዘይበቅዓካ ንጉስ
በጭርቅቲ ማᎁቅካስ ኣብ ሓሰር ክትድቅስ

VERSE 7
መሓረኒ ጎይታይ ንልበይ ኣትሒተ ንዉሽጠይ ክፍዉስ
ፍሉይ ትሕትናኻ ምብጽሑ ስኢኑ
ዝተሰቅለ ልበይ ጠቀር ተኸዲኑ
ብኸምቲ ዘለዎ ሓደራ ኣይትግደፎ

VERSE 8
ኣብ ባይታ ኣዉሪድካ ኡፍ ኢልካ ንገፎ
ኣዝ……
ሓደ ኣብ ልዕሊ ሓደ ዘይጠቅመኒ ሓሳብ
ዘመን ምሉእ ዕድመይ ኣብ ዉሽጠይ ክእክብ

VERSE 9
ዘይከም ዓይኒ ማይካ ብመንፈስ ዘጥልል
ነዛ ምስኪን ነፍሰይ እናሻዕ ከቁስል
መሓረኒ ጎይታይ ንልበይ ኣትሒተ ኣብ ቃልካ ክትከል
ከምቶም ዘፍቅሩኻ ዕድል እንተ ረኸበ

VERSE 10
ነዚ ድሩቅ ልበይ ቃልካ ዘይጸገበ
ንቁጽ ጨንፈር’ዩሞ ዝቀልል ምስባሩ
እስኪ በል ስበሮ ሓንሳእ ንሓዋሩ
ኣዝ …',
      lyrics_transliteration = 'Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 1
Zeykemti baryaኻ felit’u diኻmu
Bits’ayu zisetr kefiu hasimu
Weyney ane migdur bihawey ziwel
Kemamuq niezni were zifetatl

VERSE 2
Mehareni goytay nilbey athite nab wusht’ey kestebhl
Miኽrኻ semia betey kiኾsatr
Mis algese ayney kab nay hawey beser
Hases ile wusht’ey reኺbeyo guda

VERSE 3
Ane yihaysh zibl tienun terir gunda
Az….
Anta medhn nefsey simka teqenite
Kem zihred genshel afka zeyteኸfte

VERSE 4
Misaኻ enabelku bigrhti libi
Kulae bedel bits’ay mits’aru kiabi
Mihareni goytay ab hidget kiabi
Bich’guraf nay hawey guhyu niኸy denn

VERSE 5
Ridayo nilbey ch’gurafka kestentn
Saeri hankwlwo mihir kab zinawets’
Niays kab mibal amen niኽmerts’
Az……

VERSE 6
Eti liul kibrኻ mahder sigay haryu
Kab zufan kibrኻ miwuradka delyu
Silum adarashat zeybeqaka nigus
Bech’rqti maᎁqkas ab haser kitdqs

VERSE 7
Mehareni goytay nilbey athite niwusht’ey kifwus
Filuy tihtnaኻ mibts’hu siinu
Ziteseqle libey t’eqer teኸdinu
Biኸmti zelewo hadera aytgdefo

VERSE 8
Ab bayta awuridka uf ilka nigefo
Az……
Hade ab lieli hade zeyt’eqmeni hasab
Zemen milue edmey ab wusht’ey kiekb

VERSE 9
Zeykem ayni mayka bimenfes zet’ll
Neza miskin nefsey enashae kequsl
Mehareni goytay nilbey athite ab qalka kitkel
Kemtom zefqruኻ edl ente reኸbe

VERSE 10
Nezi diruq libey qalka zeyts’egebe
Niquts’ ch’enfer’yumo ziqell misbaru
Eski bel sibero hansae nihawaru
Az …',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-tewahdo-mezmur-2024'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 1
ዘይከምቲ ባርያኻ ፈሊጡ ድኻሙ
ብጻዩ ዝሰትር ከፊኡ ሓሲሙ
ወይነይ ኣነ ምግዱር ብሓወይ ዝውዕል
ከማሙቅ ንእዝኒ ወረ ዝፈታትል

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 2
መሓረኒ ጎይታይ ንልበይ ኣትሒተ ናብ ዉሽጠይ ከስተብህል
ምኽርኻ ሰሚዐ ቤተይ ክኾሳትር
ምስ ኣልገሰ ዓይነይ ካብ ናይ ሓወይ በሰር
ሃሰስ ኢለ ዉሽጠይ ረኺበዮ ጉዳ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 3
ኣነ ይሓይሽ ዝብል ትዕኑን ተሪር ጉንዳ
ኣዝ….
ኣንታ መድሕን ነፍሰይ ስምካ ተቀኒተ
ከም ዝሕረድ ገንሸል ኣፍካ ዘይተኸፍተ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 4
ምሳኻ እናበልኩ ብግርህቲ ልቢ
ኩላዕ በደል ብጻይ ምጻሩ ክኣቢ
ምሓረኒ ጎይታይ ኣብ ሕድገት ክዓቢ
ብጭጉራፍ ናይ ሓወይ ጉህዩ ንኸይ ደንን

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 5
ርድኣዮ ንልበይ ጭጉራፍካ ከስተንትን
ሳዕሪ ሓንኵልዎ ምሒር ካብ ዝናወጽ
ንዓይስ ካብ ምባል ኣሜን ንኽመርጽ
ኣዝ……

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 6
እቲ ልዑል ክብርኻ ማሕደር ስጋይ ሓርዩ
ካብ ዙፋን ክብርኻ ምዉራድካ ደልዩ
ስሉም ኣዳራሻት ዘይበቅዓካ ንጉስ
በጭርቅቲ ማᎁቅካስ ኣብ ሓሰር ክትድቅስ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 7
መሓረኒ ጎይታይ ንልበይ ኣትሒተ ንዉሽጠይ ክፍዉስ
ፍሉይ ትሕትናኻ ምብጽሑ ስኢኑ
ዝተሰቅለ ልበይ ጠቀር ተኸዲኑ
ብኸምቲ ዘለዎ ሓደራ ኣይትግደፎ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 8
ኣብ ባይታ ኣዉሪድካ ኡፍ ኢልካ ንገፎ
ኣዝ……
ሓደ ኣብ ልዕሊ ሓደ ዘይጠቅመኒ ሓሳብ
ዘመን ምሉእ ዕድመይ ኣብ ዉሽጠይ ክእክብ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 9
ዘይከም ዓይኒ ማይካ ብመንፈስ ዘጥልል
ነዛ ምስኪን ነፍሰይ እናሻዕ ከቁስል
መሓረኒ ጎይታይ ንልበይ ኣትሒተ ኣብ ቃልካ ክትከል
ከምቶም ዘፍቅሩኻ ዕድል እንተ ረኸበ

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)

VERSE 10
ነዚ ድሩቅ ልበይ ቃልካ ዘይጸገበ
ንቁጽ ጨንፈር’ዩሞ ዝቀልል ምስባሩ
እስኪ በል ስበሮ ሓንሳእ ንሓዋሩ
ኣዝ …

CHORUS
ከምቲ ዝናብ ሰማይ ካብ ኣኽራናት እምባ
ዉሒዙ ዝፈስስ ናብቲ ታሕታይ ሩባ
ድሩቅ ዉሽጢ ዉሽጠይ ጸጋኻ ክፈሶ
ነዚ በሪኽ ልበይ ጠቅሊልካ ኣፍርሶ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 1
Zeykemti baryaኻ felit’u diኻmu
Bits’ayu zisetr kefiu hasimu
Weyney ane migdur bihawey ziwel
Kemamuq niezni were zifetatl

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 2
Mehareni goytay nilbey athite nab wusht’ey kestebhl
Miኽrኻ semia betey kiኾsatr
Mis algese ayney kab nay hawey beser
Hases ile wusht’ey reኺbeyo guda

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 3
Ane yihaysh zibl tienun terir gunda
Az….
Anta medhn nefsey simka teqenite
Kem zihred genshel afka zeyteኸfte

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 4
Misaኻ enabelku bigrhti libi
Kulae bedel bits’ay mits’aru kiabi
Mihareni goytay ab hidget kiabi
Bich’guraf nay hawey guhyu niኸy denn

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 5
Ridayo nilbey ch’gurafka kestentn
Saeri hankwlwo mihir kab zinawets’
Niays kab mibal amen niኽmerts’
Az……

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 6
Eti liul kibrኻ mahder sigay haryu
Kab zufan kibrኻ miwuradka delyu
Silum adarashat zeybeqaka nigus
Bech’rqti maᎁqkas ab haser kitdqs

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 7
Mehareni goytay nilbey athite niwusht’ey kifwus
Filuy tihtnaኻ mibts’hu siinu
Ziteseqle libey t’eqer teኸdinu
Biኸmti zelewo hadera aytgdefo

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 8
Ab bayta awuridka uf ilka nigefo
Az……
Hade ab lieli hade zeyt’eqmeni hasab
Zemen milue edmey ab wusht’ey kiekb

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 9
Zeykem ayni mayka bimenfes zet’ll
Neza miskin nefsey enashae kequsl
Mehareni goytay nilbey athite ab qalka kitkel
Kemtom zefqruኻ edl ente reኸbe

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)

VERSE 10
Nezi diruq libey qalka zeyts’egebe
Niquts’ ch’enfer’yumo ziqell misbaru
Eski bel sibero hansae nihawaru
Az …

CHORUS
Kemti zinab semay kab aኽranat emba
Wuhizu zifess nabti tahtay ruba
Diruq wusht’i wusht’ey ts’egaኻ kifeso
Nezi beriኽ libey t’eqlilka afrso (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-tewahdo-mezmur-2024', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eritrean Orthodox Tewahdo Mezmur (eritrean-orthodox-tewahdo-mezmur-3146)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 1
ክንድይ ክይጽንሓካ ልበይ ብጽፋፉ ዕላሙኡ ተስፍዩ
ጠቐር መሊኡዎ ኣብኡ''ሎ ተድርቢዪ
ክንድይ ክይጽንሓካ ኩስትር ምድሪ ቤቱ ሰቲ ትነስነሶ
ምኡዝ ቅድይ ቅቢኢ ሽቶ ዝፈስሶ

VERSE 2
መን ኣለኒ''ዩ እሞ ገጹ ዝመልስለይ ብግዜ ጽበባ
ነብስይ ዝቅብላ ምስ ስበባ
መን ኣለኒ''ዩ እሞ ንጉስ እንክንሱ በዓል ዓቢ ግርማ
ክውልድ ኣብኣ''ሉ ልበይ ዝስልማ

VERSE 3
ክድምቕ ብርሃነይ ከምቲ ኮኸብ ጽባሕ ስሉም ግርማ ስማይ
ውርትብ ብስራቱ ቅደድ ብራቕ ጻሓይ
ክድምቕ ብርሃነይ ከምቲ ጻሓይ ብራቕ ዘብህግ ትርኢታ
ኣይድብዝዝ ኣይሃስስ ኣየው ምልታ

VERSE 4
ተወለድ ኣብ ልበይ ክኸውን ባርያኻ እምነት ዝጽገዎ
ልበይ ከይስልከየ ቃልካ ክረርዎ
ተወለድ ኣብ ልበይ ቃልካ ትምድሓኒ ክኸውን መዝሙረይ
ፍቅሪ ምስ ተስፋኣ ክመልኦ ንልበይ

VERSE 5
ምኻንካ እፈልጥ''የ ዝድነነት ልቢ ንስኻ ተቅንዓ
ዝተስድት ንፋሲ ምኻንካ ዑቅባኣ
ምኻንካ እፍልጥ''የ ህያዉ ብዘለዎ ጽጋካ የጽግቦ
ሽጉር ብዙርያኡ ምሕረትክ ይኸቦ

VERSE 6
ከመይ''ለ ትም ክብል ምናድቐይ ከሎ ብኻረት ተኻንዩ
ሓስባይ ዘበለ ብክፋእ ተነንዩ
ከመይ''ለ ትም ክበይ ከም ብዝሒ ምሕረትካ ስምዓኒ ጸሎተይ
መብልዕ ማል ይኹንካ ተወለድ ኣብ ልበይ

VERSE 7
(2)',
      lyrics_transliteration = 'Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 1
Kindy kiyts’nhaka libey bits’fafu elamuu tesfyu
T’eቐr meliuwo abu''lo tedrbiyi
Kindy kiyts’nhaka kustr midri betu seti tinesneso
Miuz qidy qibii shto zifesso

VERSE 2
Men aleni''yu emo gets’u zimelsley bigze ts’beba
Nebsy ziqbla mis sibeba
Men aleni''yu emo nigus enknsu beal abi girma
Kiwld aba''lu libey zislma

VERSE 3
Kidmቕ birhaney kemti koኸb ts’bah silum girma simay
Wirtb bisratu qided biraቕ ts’ahay
Kidmቕ birhaney kemti ts’ahay biraቕ zebhg tirita
Aydbzz ayhass ayew milta

VERSE 4
Teweled ab libey kiኸwn baryaኻ emnet zits’gewo
Libey keyslkeye qalka kirerwo
Teweled ab libey qalka timdhani kiኸwn mezmurey
Fiqri mis tesfaa kimelo nilbey

VERSE 5
Miኻnka efelt’''ye zidnenet libi nisኻ teqna
Zitesdt nifasi miኻnka uqbaa
Miኻnka eflt’''ye hiyawu bizelewo ts’gaka yets’gbo
Shgur bizuryau mihretk yiኸbo

VERSE 6
Kemey''le tim kibl minadቐy kelo biኻret teኻnyu
Hasbay zebele bikfae tenenyu
Kemey''le tim kibey kem bizhi mihretka simani ts’elotey
Meble mal yiኹnka teweled ab libey

VERSE 7
 (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-tewahdo-mezmur-3146'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 1
ክንድይ ክይጽንሓካ ልበይ ብጽፋፉ ዕላሙኡ ተስፍዩ
ጠቐር መሊኡዎ ኣብኡ''ሎ ተድርቢዪ
ክንድይ ክይጽንሓካ ኩስትር ምድሪ ቤቱ ሰቲ ትነስነሶ
ምኡዝ ቅድይ ቅቢኢ ሽቶ ዝፈስሶ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 2
መን ኣለኒ''ዩ እሞ ገጹ ዝመልስለይ ብግዜ ጽበባ
ነብስይ ዝቅብላ ምስ ስበባ
መን ኣለኒ''ዩ እሞ ንጉስ እንክንሱ በዓል ዓቢ ግርማ
ክውልድ ኣብኣ''ሉ ልበይ ዝስልማ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 3
ክድምቕ ብርሃነይ ከምቲ ኮኸብ ጽባሕ ስሉም ግርማ ስማይ
ውርትብ ብስራቱ ቅደድ ብራቕ ጻሓይ
ክድምቕ ብርሃነይ ከምቲ ጻሓይ ብራቕ ዘብህግ ትርኢታ
ኣይድብዝዝ ኣይሃስስ ኣየው ምልታ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 4
ተወለድ ኣብ ልበይ ክኸውን ባርያኻ እምነት ዝጽገዎ
ልበይ ከይስልከየ ቃልካ ክረርዎ
ተወለድ ኣብ ልበይ ቃልካ ትምድሓኒ ክኸውን መዝሙረይ
ፍቅሪ ምስ ተስፋኣ ክመልኦ ንልበይ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 5
ምኻንካ እፈልጥ''የ ዝድነነት ልቢ ንስኻ ተቅንዓ
ዝተስድት ንፋሲ ምኻንካ ዑቅባኣ
ምኻንካ እፍልጥ''የ ህያዉ ብዘለዎ ጽጋካ የጽግቦ
ሽጉር ብዙርያኡ ምሕረትክ ይኸቦ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 6
ከመይ''ለ ትም ክብል ምናድቐይ ከሎ ብኻረት ተኻንዩ
ሓስባይ ዘበለ ብክፋእ ተነንዩ
ከመይ''ለ ትም ክበይ ከም ብዝሒ ምሕረትካ ስምዓኒ ጸሎተይ
መብልዕ ማል ይኹንካ ተወለድ ኣብ ልበይ

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ

VERSE 7
(2)

CHORUS
ውሃቢ ኢኻ''ሞ ለጋስ ምሉእ ኢዱ
ሃብታም ሓላይ ድኻ ሽጉ ዝዘመዱ
ፍቅርኻ''ዩ ብል ስእነት ውሽጢ ቤተይ
ስማያዊ ንጉስ ተውልድ ኣብ ልበይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 1
Kindy kiyts’nhaka libey bits’fafu elamuu tesfyu
T’eቐr meliuwo abu''lo tedrbiyi
Kindy kiyts’nhaka kustr midri betu seti tinesneso
Miuz qidy qibii shto zifesso

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 2
Men aleni''yu emo gets’u zimelsley bigze ts’beba
Nebsy ziqbla mis sibeba
Men aleni''yu emo nigus enknsu beal abi girma
Kiwld aba''lu libey zislma

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 3
Kidmቕ birhaney kemti koኸb ts’bah silum girma simay
Wirtb bisratu qided biraቕ ts’ahay
Kidmቕ birhaney kemti ts’ahay biraቕ zebhg tirita
Aydbzz ayhass ayew milta

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 4
Teweled ab libey kiኸwn baryaኻ emnet zits’gewo
Libey keyslkeye qalka kirerwo
Teweled ab libey qalka timdhani kiኸwn mezmurey
Fiqri mis tesfaa kimelo nilbey

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 5
Miኻnka efelt’''ye zidnenet libi nisኻ teqna
Zitesdt nifasi miኻnka uqbaa
Miኻnka eflt’''ye hiyawu bizelewo ts’gaka yets’gbo
Shgur bizuryau mihretk yiኸbo

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 6
Kemey''le tim kibl minadቐy kelo biኻret teኻnyu
Hasbay zebele bikfae tenenyu
Kemey''le tim kibey kem bizhi mihretka simani ts’elotey
Meble mal yiኹnka teweled ab libey

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey

VERSE 7
 (2)

CHORUS
Wihabi iኻ''mo legas milue idu
Habtam halay diኻ shgu zizemedu
Fiqrኻ''yu bil sienet wisht’i betey
Simayawi nigus tewld ab libey'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-tewahdo-mezmur-3146', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eritrean Orthodox Tewahdo Mezmur (eritrean-orthodox-tewahdo-mezmur-3182)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ

VERSE 1
ዓለማት ዝወሰንካ ዘይቅረብ ብርሃን ትነብር
ምድርን ሰማይን ናትካ ዝደለካዮ ትገብር
ሃብታም በዓለ ጸጋ ተሓቢነ እግዚኣብሄር
ጎይታይ ምሳይ ምኻንካ ከመስግነካ ይነብር

VERSE 2
ኣሕዋተይ ሽይጦሙኒ ካብ ኣዝማደይ ተፈሊየ
ኣብ ስደት ምድረ በዳ ኮይነ ዉን ኣይሕለልን የ
ተስፋ መንግስተ ሰማይ ሂብካኒ ኢንዲኻ ጎይታይ
ሞት እካ ኣይፈልየንን ንስካ ኢካ ዕላማይ

VERSE 3
ጽባሕ እንታ ክከዉን ኢለ ፈጺመ ኣይጭነቅን
ብዛዕባ ዝበልዖን ዝሰትዮን ትሓልን ትፈልጥን
ኢደ እግረይ ዓይነ ብርከይ ልቦናይ ቃላት ትንፋሰይ
ኩሉ በኣካዩ ዝኮነ ኣምላከይ ናትከየ ኣነ

VERSE 4
ከም ምዉት ተተረሳዕኩ ረዳኢ ተሰኣንኩ
ናባኻ ምስ ጸለኩ ኣጆካ ኢልካኒ ኣለኩ
ከመይ ኢሉ ክጽምወኒ ማርያመይ ከላትኒ
ቅዱስ ሚካኤል ገብሪኤል ምስ መላእክቲ የዕልል',
      lyrics_transliteration = 'Amlake yosef temesgenka amanuel
Misay mikanka amanuel
Miluoy ika emntoy akilka titerfeni
Kindi ashhat wegeney konka tidgfeni

VERSE 1
Alemat ziwesenka zeyqreb birhan tinebr
Midrn semayn natka zidelekayo tigebr
Habtam beale ts’ega tehabine egziabher
Goytay misay miኻnka kemesgneka yinebr

VERSE 2
Ahwatey shyt’omuni kab azmadey tefeliye
Ab sidet midre beda koyne wun ayhleln ye
Tesfa mengste semay hibkani indiኻ goytay
Mot eka ayfelyenn niska ika elamay

VERSE 3
Ts’bah enta kikewun ile fets’ime aych’neqn
Bizaeba zibelon zisetyon tihaln tifelt’n
Ide egrey ayne birkey libonay qalat tinfasey
Kulu beakayu zikone amlakey natkeye ane

VERSE 4
Kem miwut teteresaeku redai teseanku
Nabaኻ mis ts’eleku ajoka ilkani aleku
Kemey ilu kits’mweni maryamey kelatni
Kidus Mikael gebriel mis melaekti yeell',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-tewahdo-mezmur-3182'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ

VERSE 1
ዓለማት ዝወሰንካ ዘይቅረብ ብርሃን ትነብር
ምድርን ሰማይን ናትካ ዝደለካዮ ትገብር
ሃብታም በዓለ ጸጋ ተሓቢነ እግዚኣብሄር
ጎይታይ ምሳይ ምኻንካ ከመስግነካ ይነብር

CHORUS
ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ

VERSE 2
ኣሕዋተይ ሽይጦሙኒ ካብ ኣዝማደይ ተፈሊየ
ኣብ ስደት ምድረ በዳ ኮይነ ዉን ኣይሕለልን የ
ተስፋ መንግስተ ሰማይ ሂብካኒ ኢንዲኻ ጎይታይ
ሞት እካ ኣይፈልየንን ንስካ ኢካ ዕላማይ

CHORUS
ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ

VERSE 3
ጽባሕ እንታ ክከዉን ኢለ ፈጺመ ኣይጭነቅን
ብዛዕባ ዝበልዖን ዝሰትዮን ትሓልን ትፈልጥን
ኢደ እግረይ ዓይነ ብርከይ ልቦናይ ቃላት ትንፋሰይ
ኩሉ በኣካዩ ዝኮነ ኣምላከይ ናትከየ ኣነ

CHORUS
ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ

VERSE 4
ከም ምዉት ተተረሳዕኩ ረዳኢ ተሰኣንኩ
ናባኻ ምስ ጸለኩ ኣጆካ ኢልካኒ ኣለኩ
ከመይ ኢሉ ክጽምወኒ ማርያመይ ከላትኒ
ቅዱስ ሚካኤል ገብሪኤል ምስ መላእክቲ የዕልል

CHORUS
ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amlake yosef temesgenka amanuel
Misay mikanka amanuel
Miluoy ika emntoy akilka titerfeni
Kindi ashhat wegeney konka tidgfeni

VERSE 1
Alemat ziwesenka zeyqreb birhan tinebr
Midrn semayn natka zidelekayo tigebr
Habtam beale ts’ega tehabine egziabher
Goytay misay miኻnka kemesgneka yinebr

CHORUS
Amlake yosef temesgenka amanuel
Misay mikanka amanuel
Miluoy ika emntoy akilka titerfeni
Kindi ashhat wegeney konka tidgfeni

VERSE 2
Ahwatey shyt’omuni kab azmadey tefeliye
Ab sidet midre beda koyne wun ayhleln ye
Tesfa mengste semay hibkani indiኻ goytay
Mot eka ayfelyenn niska ika elamay

CHORUS
Amlake yosef temesgenka amanuel
Misay mikanka amanuel
Miluoy ika emntoy akilka titerfeni
Kindi ashhat wegeney konka tidgfeni

VERSE 3
Ts’bah enta kikewun ile fets’ime aych’neqn
Bizaeba zibelon zisetyon tihaln tifelt’n
Ide egrey ayne birkey libonay qalat tinfasey
Kulu beakayu zikone amlakey natkeye ane

CHORUS
Amlake yosef temesgenka amanuel
Misay mikanka amanuel
Miluoy ika emntoy akilka titerfeni
Kindi ashhat wegeney konka tidgfeni

VERSE 4
Kem miwut teteresaeku redai teseanku
Nabaኻ mis ts’eleku ajoka ilkani aleku
Kemey ilu kits’mweni maryamey kelatni
Kidus Mikael gebriel mis melaekti yeell

CHORUS
Amlake yosef temesgenka amanuel
Misay mikanka amanuel
Miluoy ika emntoy akilka titerfeni
Kindi ashhat wegeney konka tidgfeni'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-tewahdo-mezmur-3182', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eritrean Orthodox Tewahdo Mezmur (eritrean-orthodox-tewahdo-mezmur-3347)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 1
ሆሳእና ንበል
ቃላተይ ኣብሊሐ ብመዝሙር ምስጋና
በቲ ዓቕመይ ክውድስ እየ ጌና
ሆሳእና ክብል የ ክብሩ ከዘንቱ

VERSE 2
ስየ ከንጽፈሉ ናብ ልበይ ከኣቱ
ኣሕዛብ ኢዮርሳሌም ዘምሩ ንክብሪ
ሆሳእና ንወዲ ዳዊት ኢልኩም ጨድሩ
ሆሳእና በሉ

VERSE 3
ጸልማት ንኽስዓር ፍርሒ ንኸብቅዕ
ጸዳለ ብርሃኑ ንዓለም ከብርህ
ገልገል ተወጢሑ ትሕትና ለቢሱ
መጺዩ መድሓኒተይ ግርማ ተዓጢቑ

VERSE 4
ኣእማነ ቢታንያ ዘምሩ ንኽብሩ
ሆሳእና ንወዲ ዳዊት ኢልኩም ጨድሩ።
ሆሳእና በሉ
ሕማመይ ክፍውስ ዘልኣለም ክሕጎስ

VERSE 5
ሆሳእና ክብል''የ ንኢየሱስ ክርስቶስ
ክዝምረሉ''የ ስለቲ ውዕለቱ
ሰላም ንኽረክብ ሆሳእና ክብለሉ
ሕጻናት ኢዮርሳሌም ዘምሩ ንኽብሩ

VERSE 6
ሆሳእና ንወዲ ዳዊት ኢልኩም ጨድሩ
ሆሳእና በሉ
ትሕትና ብምልባስ ትሕትና ምሂሩ
ፍትወይ ናተይ ከርእየኒ ፍቕሩ

VERSE 7
ፈውሰይ መድሓኒተይ ኢየሱስ ክርስቶስ
ክነብር''የ ምስኡ ዘልኣለም ክሕጎስ
ከንጽፈሉ''የ ዝርካበይ ኩሉ
ሆሳእና ኢለ ክዝምረሉ

VERSE 8
ሆሳእና በሉ',
      lyrics_transliteration = 'Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 1
Hosaena nibel
Qalatey ablihe bimezmur misgana
Beti aቕmey kiwds eye gena
Hosaena kibl ye kibru kezentu

VERSE 2
Siye kents’felu nab libey keatu
Ahzab iyorsalem zemru nikbri
Hosaena niwedi dawit ilkum ch’edru
Hosaena belu

VERSE 3
Ts’elmat niኽsar firhi niኸbqe
Ts’edale birhanu nialem kebrh
Gelgel tewet’ihu tihtna lebisu
Mets’iyu medhanitey girma teat’iቑ

VERSE 4
Aemane bitanya zemru niኽbru
Hosaena niwedi dawit ilkum ch’edru.
Hosaena belu
Himamey kifws zelalem kihgos

VERSE 5
Hosaena kibl''ye niiyesus Kristos
Kizmrelu''ye sileti wieletu
Selam niኽrekb hosaena kiblelu
Hits’anat iyorsalem zemru niኽbru

VERSE 6
Hosaena niwedi dawit ilkum ch’edru
Hosaena belu
Tihtna bimlbas tihtna mihiru
Fitwey natey kereyeni fiቕru

VERSE 7
Fewsey medhanitey Iyesus Kristos
Kinebr''ye misu zelalem kihgos
Kents’felu''ye zirkabey kulu
Hosaena ile kizmrelu

VERSE 8
Hosaena belu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-tewahdo-mezmur-3347'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 1
ሆሳእና ንበል
ቃላተይ ኣብሊሐ ብመዝሙር ምስጋና
በቲ ዓቕመይ ክውድስ እየ ጌና
ሆሳእና ክብል የ ክብሩ ከዘንቱ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 2
ስየ ከንጽፈሉ ናብ ልበይ ከኣቱ
ኣሕዛብ ኢዮርሳሌም ዘምሩ ንክብሪ
ሆሳእና ንወዲ ዳዊት ኢልኩም ጨድሩ
ሆሳእና በሉ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 3
ጸልማት ንኽስዓር ፍርሒ ንኸብቅዕ
ጸዳለ ብርሃኑ ንዓለም ከብርህ
ገልገል ተወጢሑ ትሕትና ለቢሱ
መጺዩ መድሓኒተይ ግርማ ተዓጢቑ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 4
ኣእማነ ቢታንያ ዘምሩ ንኽብሩ
ሆሳእና ንወዲ ዳዊት ኢልኩም ጨድሩ።
ሆሳእና በሉ
ሕማመይ ክፍውስ ዘልኣለም ክሕጎስ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 5
ሆሳእና ክብል''የ ንኢየሱስ ክርስቶስ
ክዝምረሉ''የ ስለቲ ውዕለቱ
ሰላም ንኽረክብ ሆሳእና ክብለሉ
ሕጻናት ኢዮርሳሌም ዘምሩ ንኽብሩ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 6
ሆሳእና ንወዲ ዳዊት ኢልኩም ጨድሩ
ሆሳእና በሉ
ትሕትና ብምልባስ ትሕትና ምሂሩ
ፍትወይ ናተይ ከርእየኒ ፍቕሩ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 7
ፈውሰይ መድሓኒተይ ኢየሱስ ክርስቶስ
ክነብር''የ ምስኡ ዘልኣለም ክሕጎስ
ከንጽፈሉ''የ ዝርካበይ ኩሉ
ሆሳእና ኢለ ክዝምረሉ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም

VERSE 8
ሆሳእና በሉ

CHORUS
ሆሳእና {2} ንበለሉ ንወዲ ዳዊት
ዘልኣለም ክንነብር ብናቱ ምሕረት
ዝቃወም የለን ድሕሪ ደጊም
ኣዋጅ ሓርነት ተኣውጁ''ዩ ብመድሃኔኣለም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 1
Hosaena nibel
Qalatey ablihe bimezmur misgana
Beti aቕmey kiwds eye gena
Hosaena kibl ye kibru kezentu

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 2
Siye kents’felu nab libey keatu
Ahzab iyorsalem zemru nikbri
Hosaena niwedi dawit ilkum ch’edru
Hosaena belu

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 3
Ts’elmat niኽsar firhi niኸbqe
Ts’edale birhanu nialem kebrh
Gelgel tewet’ihu tihtna lebisu
Mets’iyu medhanitey girma teat’iቑ

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 4
Aemane bitanya zemru niኽbru
Hosaena niwedi dawit ilkum ch’edru.
Hosaena belu
Himamey kifws zelalem kihgos

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 5
Hosaena kibl''ye niiyesus Kristos
Kizmrelu''ye sileti wieletu
Selam niኽrekb hosaena kiblelu
Hits’anat iyorsalem zemru niኽbru

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 6
Hosaena niwedi dawit ilkum ch’edru
Hosaena belu
Tihtna bimlbas tihtna mihiru
Fitwey natey kereyeni fiቕru

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 7
Fewsey medhanitey Iyesus Kristos
Kinebr''ye misu zelalem kihgos
Kents’felu''ye zirkabey kulu
Hosaena ile kizmrelu

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem

VERSE 8
Hosaena belu

CHORUS
Hosaena {2} nibelelu niwedi dawit
Zelalem kinnebr binatu mihret
Ziqawem yelen dihri degim
Awaj harnet teawju''yu bimedhanealem'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-tewahdo-mezmur-3347', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eritrean Orthodox Tewahdo Mezmur (eritrean-orthodox-tewahdo-mezmur-3614)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 1
ዕሩቅ ጎድነይ ሳላኻ ማሚቑ
ዘይከምቲ ዝሓለፈ ድኻም ጉዕዞ ትማሊ
ስጉምተይ ብደምበርበር ናብራ ስጋይ ክሓሊ
ጎይታየ መድሕን ነፍሰይ ህይወተይ ቀይርካዮ

VERSE 2
ክምብርከኽ ንኣምልኾ ዓመት ነፍሰይ ጌርካዮ ካን ታሪኽ ኮይኑ''ዩ'' ቲ ድኻም ናይ ስጋ
ንጉስይ ካብ ሃብካ ከዓቢ ብጸጋ
መጽሓፈይ ታሪኽ ጉዕዞይ ስጉምተይ ዝሰነዶ
ቅሳነት ህድኣት ልቢ ብፍጹም ዘይንበቦ

VERSE 3
ሓሊፉ ላዕልን ታሕትን ምንም ትርጉን ዝይብሉ
ዛዚምካዮ ብሓጎስ ዕለት ጋማይ ኣኺሉ
መስቀለይ ኣልዒ ምስቲ ምቃል ጎድነይ
ፍልይቲ ዓመት'' ያ ዓመት ቃል ኪዳነይ

VERSE 4
ጎይታየ ንባርያኻ ዘይትጠልም መብጽዓ
ሰሪዕካያ አንሀት ዕለት ዓወት ክሪኣ
ኣኽሊልካ ኣኽሊል ቅብኢ ንዓይ ዘይግብኣኒ
ቅብአኻ ቅብኢ መንፈስ ንኺዳነይ ከሰኒ

VERSE 5
''ታይ ዝበለት ዕለት ፍጹም ዘይትርሳዕ
ፈጣሪ ዝሃበ ት'' ሂቡ ዘይከልአ
ኣብ ዘመን ግሽነተይ ሕግኻ ክምርምሮ
ኣብ ጉዕዞ ንሰማያት ቃላት ኣፍካ ከኽብሮ

VERSE 6
ክትከብር ኣብቲ ቤተይ ብምስጋና ኣምልኾ
ዕድሜኻ አቶ ቤተይ ብጸጋኻ ባርኮ
ኩሉ ካብ ላዕሊ '' ዩ አቲ ምሉአ ውህበት
ቤተይ ቤት ክብርኻ ትኹን ዘንትአለት',
      lyrics_transliteration = 'Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ

VERSE 1
Eruq godney salaኻ mamiቑ
Zeykemti zihalefe diኻm guezo timali
Sigumtey bidemberber nabra sigay kihali
Goytaye medhn nefsey hiywetey qeyrkayo

VERSE 2
Kimbrkeኽ niamlኾ amet nefsey gerkayo kan tariኽ koynu''yu'' ti diኻm nay siga
Nigusy kab habka keabi bits’ega
Mets’hafey tariኽ guezoy sigumtey zisenedo
Qisanet hidat libi bifts’um zeynbebo

VERSE 3
Halifu laeln tahtn minm tirgun ziyblu
Zazimkayo bihagos elet gamay aኺlu
Mesqeley ali misti miqal godney
Filyti amet'' ya amet qal kidaney

VERSE 4
Goytaye nibaryaኻ zeytt’elm mebts’a
Seriekaya anhet elet awet kiria
Aኽlilka aኽlil qibi niay zeygbani
Qibaኻ qibi menfes niኺdaney keseni

VERSE 5
''tay zibelet elet fits’um zeytrsae
Fet’ari zihabe t'' hibu zeykela
Ab zemen gishnetey higኻ kimrmro
Ab guezo nisemayat qalat afka keኽbro

VERSE 6
Kitkebr abti betey bimsgana amlኾ
Edmeኻ ato betey bits’egaኻ barko
Kulu kab laeli '' yu ati milua wihbet
Betey bet kibrኻ tiኹn zentalet',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-tewahdo-mezmur-3614'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 1
ዕሩቅ ጎድነይ ሳላኻ ማሚቑ
ዘይከምቲ ዝሓለፈ ድኻም ጉዕዞ ትማሊ
ስጉምተይ ብደምበርበር ናብራ ስጋይ ክሓሊ
ጎይታየ መድሕን ነፍሰይ ህይወተይ ቀይርካዮ

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 2
ክምብርከኽ ንኣምልኾ ዓመት ነፍሰይ ጌርካዮ ካን ታሪኽ ኮይኑ''ዩ'' ቲ ድኻም ናይ ስጋ
ንጉስይ ካብ ሃብካ ከዓቢ ብጸጋ
መጽሓፈይ ታሪኽ ጉዕዞይ ስጉምተይ ዝሰነዶ
ቅሳነት ህድኣት ልቢ ብፍጹም ዘይንበቦ

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 3
ሓሊፉ ላዕልን ታሕትን ምንም ትርጉን ዝይብሉ
ዛዚምካዮ ብሓጎስ ዕለት ጋማይ ኣኺሉ
መስቀለይ ኣልዒ ምስቲ ምቃል ጎድነይ
ፍልይቲ ዓመት'' ያ ዓመት ቃል ኪዳነይ

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 4
ጎይታየ ንባርያኻ ዘይትጠልም መብጽዓ
ሰሪዕካያ አንሀት ዕለት ዓወት ክሪኣ
ኣኽሊልካ ኣኽሊል ቅብኢ ንዓይ ዘይግብኣኒ
ቅብአኻ ቅብኢ መንፈስ ንኺዳነይ ከሰኒ

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 5
''ታይ ዝበለት ዕለት ፍጹም ዘይትርሳዕ
ፈጣሪ ዝሃበ ት'' ሂቡ ዘይከልአ
ኣብ ዘመን ግሽነተይ ሕግኻ ክምርምሮ
ኣብ ጉዕዞ ንሰማያት ቃላት ኣፍካ ከኽብሮ

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ

VERSE 6
ክትከብር ኣብቲ ቤተይ ብምስጋና ኣምልኾ
ዕድሜኻ አቶ ቤተይ ብጸጋኻ ባርኮ
ኩሉ ካብ ላዕሊ '' ዩ አቲ ምሉአ ውህበት
ቤተይ ቤት ክብርኻ ትኹን ዘንትአለት

CHORUS
ዝተፈለየት ዓመት
ዝተፈለየት ዓመት ኣዒንተይ ዝተመነያ
ዝኸበረት ዕለት ውህበት ፍቕርኻ ዘይርከብ ኣምሳያ
ክበረለይ ዘመነይ ጽቢቑ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ

VERSE 1
Eruq godney salaኻ mamiቑ
Zeykemti zihalefe diኻm guezo timali
Sigumtey bidemberber nabra sigay kihali
Goytaye medhn nefsey hiywetey qeyrkayo

CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ

VERSE 2
Kimbrkeኽ niamlኾ amet nefsey gerkayo kan tariኽ koynu''yu'' ti diኻm nay siga
Nigusy kab habka keabi bits’ega
Mets’hafey tariኽ guezoy sigumtey zisenedo
Qisanet hidat libi bifts’um zeynbebo

CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ

VERSE 3
Halifu laeln tahtn minm tirgun ziyblu
Zazimkayo bihagos elet gamay aኺlu
Mesqeley ali misti miqal godney
Filyti amet'' ya amet qal kidaney

CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ

VERSE 4
Goytaye nibaryaኻ zeytt’elm mebts’a
Seriekaya anhet elet awet kiria
Aኽlilka aኽlil qibi niay zeygbani
Qibaኻ qibi menfes niኺdaney keseni

CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ

VERSE 5
''tay zibelet elet fits’um zeytrsae
Fet’ari zihabe t'' hibu zeykela
Ab zemen gishnetey higኻ kimrmro
Ab guezo nisemayat qalat afka keኽbro

CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ

VERSE 6
Kitkebr abti betey bimsgana amlኾ
Edmeኻ ato betey bits’egaኻ barko
Kulu kab laeli '' yu ati milua wihbet
Betey bet kibrኻ tiኹn zentalet

CHORUS
Zitefeleyet amet
Zitefeleyet amet aintey zitemeneya
Ziኸberet elet wihbet fiቕrኻ zeyrkeb amsaya
Kibereley zemeney ts’biቑ'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-tewahdo-mezmur-3614', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: ERITREAN ORTHODOX TEWAHDO MEZMUR (eritrean-orthodox-tewahdo-mezmur-3731)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 1
ካብ ጸግኣ ጸጋ መሊኤን የእጋረይ ይስጉማ ክዳ
ሰሪ ኣውያት ልበይ ተሰርባ ዓዒይንተይ ባኣኣ እበዳ
ስውር ዘይረአ ሓዘን ውሽጢ ውሽጠይ መዐቐኒ
ኣልቦ

VERSE 2
ኣፈይ እንተ ኣጽቀጠ ተመልኪታ ዓዕይንተይ ኣብ ገጻ
ተንብቦ
ናዛዚት ሕዙናን ድንግል እመ ብርሃን
ብምሕረት ቅረቢ ህይወተ ንምድሓን

VERSE 3
ድምጻ እንክናፍቕ ኣብ ኣፍ ቤተይ ኮይነ ይሕሉ ምምጸኣ
ክብረይ ግርማይ እንድያ ስልማት ናይ ቤተይ ሸነን ዝብል
በኣ ትኑግ ኣክሊል ጋሂ ልበይ ከይደፍኦ ሰላመይ ከይስሑ
ስማ ተመሪቀ ይልምን ኣምላኸይ ከንብረኒ ኣብ ጥፍሑ

VERSE 4
ኣነ መን ኮይነ''የ ኣብ ቤቱ ዝነብር
ነዓኪ ሒዘ የ ኪዳኑ ይዝክር
ዓለም ልቢ ጌራ ከይትልግስ ፍቅሪ ከይምቅር ደሃያ
ከይልምልም ሸኻኣ ከይዛሪ ማያ መሪሩ ጸሓያ

VERSE 5
ስምዒ ደኣ ነብሰይ ልሳንኪ እሞ ግትኢ ሰምሰም ግደፍዮ
ሓታቲ እንተ መጸ ክፈልጥ ጸሓይኪ ማርያም'' ያ በልዮ
መብራህቲ ናይ ቤተይ ቀንዴል ብርሃን ባና
ማርያም ኣደ ጎይታይ ይብጻሕኪ ምስጋና

VERSE 6
ኣብቲ ደንበ ሰላም ''ቲ መኣዲ ህይወት መን ድያ ተአንግዶ
መን'' ያ ኪዳን ምሕረት ከርሳ ዝተቐብአ መድሕን ክውለዶ
ማርያመይ ክብል'' የ ከመስግን ''የ ኣነስ ከይሕዘለይ ልባ
ሰብ እካ ዝምስገን ይትረፍ ኣደ መድሕን ዘይውዳእ ህያባ ምስጢር ሰላም ጉዕዞይ ምሕረትኪ ''ዩ ድንግል

VERSE 7
እንሆ ደው ኢለ ውዕለትኪ ይነግር
ናዛዚት ሕዙናን ድንግል እመ ብትሃን
ብምሕረት ቕረቢ ህይወተይ ንምድሓን',
      lyrics_transliteration = 'Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 1
Kab ts’ega ts’ega melien yeegarey yisguma kida
Seri awyat libey teserba aiyntey baaa ebeda
Siwr zeyrea hazen wisht’i wisht’ey meaቐni
Albo

VERSE 2
Afey ente ats’qet’e temelkita aeyntey ab gets’a
Tenbbo
Nazazit hizunan Dingil eme birhan
Bimhret qirebi hiywete nimdhan

VERSE 3
Dimts’a enknafቕ ab af betey koyne yihlu mimts’ea
Kibrey girmay endya silmat nay betey shenen zibl
Bea tinug aklil gahi libey keydefo selamey keyshu
Sima temeriqe yilmn amlaኸy kenbreni ab t’fhu

VERSE 4
Ane men koyne''ye ab betu zinebr
Neaki hize ye kidanu yizkr
Alem libi gera keytlgs fiqri keymqr dehaya
Keylmlm sheኻa keyzari maya meriru ts’ehaya

VERSE 5
Simi dea nebsey lisanki emo giti semsem gidefyo
Hatati ente mets’e kifelt’ ts’ehayki Maryam'' ya belyo
Mebrahti nay betey qendel birhan bana
Maryam ade goytay yibts’ahki misgana

VERSE 6
Abti denbe selam ''ti meadi hiywet men diya teangdo
Men'' ya kidan mihret kersa ziteቐba medhn kiwledo
Maryamey kibl'' ye kemesgn ''ye anes keyhzeley liba
Seb eka zimsgen yitref ade medhn zeywdae hiyaba mist’ir selam guezoy mihretki ''yu Dingil

VERSE 7
Enho dew ile wieletki yinegr
Nazazit hizunan Dingil eme bithan
Bimhret ቕrebi hiywetey nimdhan',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-tewahdo-mezmur-3731'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 1
ካብ ጸግኣ ጸጋ መሊኤን የእጋረይ ይስጉማ ክዳ
ሰሪ ኣውያት ልበይ ተሰርባ ዓዒይንተይ ባኣኣ እበዳ
ስውር ዘይረአ ሓዘን ውሽጢ ውሽጠይ መዐቐኒ
ኣልቦ

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 2
ኣፈይ እንተ ኣጽቀጠ ተመልኪታ ዓዕይንተይ ኣብ ገጻ
ተንብቦ
ናዛዚት ሕዙናን ድንግል እመ ብርሃን
ብምሕረት ቅረቢ ህይወተ ንምድሓን

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 3
ድምጻ እንክናፍቕ ኣብ ኣፍ ቤተይ ኮይነ ይሕሉ ምምጸኣ
ክብረይ ግርማይ እንድያ ስልማት ናይ ቤተይ ሸነን ዝብል
በኣ ትኑግ ኣክሊል ጋሂ ልበይ ከይደፍኦ ሰላመይ ከይስሑ
ስማ ተመሪቀ ይልምን ኣምላኸይ ከንብረኒ ኣብ ጥፍሑ

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 4
ኣነ መን ኮይነ''የ ኣብ ቤቱ ዝነብር
ነዓኪ ሒዘ የ ኪዳኑ ይዝክር
ዓለም ልቢ ጌራ ከይትልግስ ፍቅሪ ከይምቅር ደሃያ
ከይልምልም ሸኻኣ ከይዛሪ ማያ መሪሩ ጸሓያ

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 5
ስምዒ ደኣ ነብሰይ ልሳንኪ እሞ ግትኢ ሰምሰም ግደፍዮ
ሓታቲ እንተ መጸ ክፈልጥ ጸሓይኪ ማርያም'' ያ በልዮ
መብራህቲ ናይ ቤተይ ቀንዴል ብርሃን ባና
ማርያም ኣደ ጎይታይ ይብጻሕኪ ምስጋና

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 6
ኣብቲ ደንበ ሰላም ''ቲ መኣዲ ህይወት መን ድያ ተአንግዶ
መን'' ያ ኪዳን ምሕረት ከርሳ ዝተቐብአ መድሕን ክውለዶ
ማርያመይ ክብል'' የ ከመስግን ''የ ኣነስ ከይሕዘለይ ልባ
ሰብ እካ ዝምስገን ይትረፍ ኣደ መድሕን ዘይውዳእ ህያባ ምስጢር ሰላም ጉዕዞይ ምሕረትኪ ''ዩ ድንግል

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር

VERSE 7
እንሆ ደው ኢለ ውዕለትኪ ይነግር
ናዛዚት ሕዙናን ድንግል እመ ብትሃን
ብምሕረት ቕረቢ ህይወተይ ንምድሓን

CHORUS
ከመስግን የ ኣነስ ማርያመይ
ክብል ''የ ንኽብራ ክዝምር
ከመስግን ''የ ኣነስ ከስተንፍስ
ረጊኤ ልበይ ከሰራስር'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 1
Kab ts’ega ts’ega melien yeegarey yisguma kida
Seri awyat libey teserba aiyntey baaa ebeda
Siwr zeyrea hazen wisht’i wisht’ey meaቐni
Albo

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 2
Afey ente ats’qet’e temelkita aeyntey ab gets’a
Tenbbo
Nazazit hizunan Dingil eme birhan
Bimhret qirebi hiywete nimdhan

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 3
Dimts’a enknafቕ ab af betey koyne yihlu mimts’ea
Kibrey girmay endya silmat nay betey shenen zibl
Bea tinug aklil gahi libey keydefo selamey keyshu
Sima temeriqe yilmn amlaኸy kenbreni ab t’fhu

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 4
Ane men koyne''ye ab betu zinebr
Neaki hize ye kidanu yizkr
Alem libi gera keytlgs fiqri keymqr dehaya
Keylmlm sheኻa keyzari maya meriru ts’ehaya

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 5
Simi dea nebsey lisanki emo giti semsem gidefyo
Hatati ente mets’e kifelt’ ts’ehayki Maryam'' ya belyo
Mebrahti nay betey qendel birhan bana
Maryam ade goytay yibts’ahki misgana

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 6
Abti denbe selam ''ti meadi hiywet men diya teangdo
Men'' ya kidan mihret kersa ziteቐba medhn kiwledo
Maryamey kibl'' ye kemesgn ''ye anes keyhzeley liba
Seb eka zimsgen yitref ade medhn zeywdae hiyaba mist’ir selam guezoy mihretki ''yu Dingil

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr

VERSE 7
Enho dew ile wieletki yinegr
Nazazit hizunan Dingil eme bithan
Bimhret ቕrebi hiywetey nimdhan

CHORUS
Kemesgn ye anes maryamey
Kibl ''ye niኽbra kizmr
Kemesgn ''ye anes kestenfs
Regie libey keserasr'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-tewahdo-mezmur-3731', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eritrean Orthodox Tewahdo Mezmur (eritrean-orthodox-tewahdo-mezmur-3941)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መግለጺ ኣርከቦን ጎይታይ ዘሕለፍካዮ ስቓይ
ስለይ ዝተኸፍለ ካሕሳ ኣብቲ ኣደባባይ
ንዕምቆት ፍቕርኻ ልበይ እንተ ዘይ ተገንዘቦ
ከምቶም ዘቕረብካዮ ባሮት ባዕልኻ ኣቕርቦ

VERSE 1
<><><><><><><><><><><><><><><><><><><><>
ካብ ደምበይ ኣርሒቐ ንበይነይ ክኹብልል ኣብ ኣኽራን በረኻ
ዓቕለይ ጸቢቡኒ የዕወንውን ኣለኹ ጠፊአ ካባኻ
ቁሊሕ በለኒኻ ዝረድኣኒ የሎን ካባኻ ሓሊፉ

VERSE 2
ይጽበ''ሎ ውሽጠይ ቀው ኢሉ ብተስፋ ሕቕፎኻ ሃሪፉ
ከምታ እንኮ በጊዕ ፍቕርኻ ዘምጸኣ
ጎይታይ ብምሕረትካ ድለየኒ ነዓ
><><><><><><><><><><><><><><><><><>

VERSE 3
ድምጽኻ ሰሚዐ ብባህጊ ከይቀርብ ልበይ ኣምበርኪኻ
መዋእል ሓሊፉ ሰገጥ መገጥ ክብል ኣእጋረይ ሓሊኸ
ከልካሊ ብዙሕዩ ''ታይ ኢልካ ክትቆጽሮ ካባኻ ዘርሕቕ
ድኻመይ ርኢኻ ባዕልኻ እለዮ ባህገይ ከይጽንቀቕ

VERSE 4
ዘሊለ ክወርድ ካብቲ ነዊሕ ሳግላ
ጻውዒት ፍቕርኻ ልበይ ትጽበ ኣላ
<><><><><><><><><><><><><><><><><><>
ነዛ ሓጻር ህይወት ከም ዕንባባ መሮር ተራእያ ትቕምስል

VERSE 5
ካን ብዘለኹዎ ከይውዳእ ትዕምረይ ኔው ነጀው እንክብል
ትዝገበርካለይ ውዕለት ሓዲሽ ኪዳን ልበይ ክስወጦ
ብግርህቲ ልቢ ክጎዪ ናብ ዳስካ መንፈሰይ ለውጦ
ከምቶም ዕዱማትካ ክኣቱ ቤት ወይኒ

VERSE 6
ኣብ ቃራና ጉዕዞይ ጎይታይ ጎፍ በለኒ
<><><><><><><><><><><><><><><><><><>
ከምቲ ምጅማረይ ንኹሉ ሓሊፈ ብድሕነት ክውድእ
ምሳኻ ክዓዪ ኣብ ልበይ በል ንገስ ብምሕረትካ ምጻእ

VERSE 7
ጠፊኡኒ ኣይኮነን ጎይታይ እትደልዮ ፍጡርካ ኣይትቕበጽ
ምግባርየ ስኢነ እምበር ምደለኹ ፈሪሰ ክህነጽ
ከም ናይታ መበለት ብውሑድ ክእመን
ሰናቲም ምግባረይ ባዕልኻ ኣበርክተን

VERSE 8
<><><><><><><><><><><><><><><>
መግለጺ ኣርከቦን ጎይታይ ዘሕለፍካዮ ስቓይ
ስለይ ዝተኸፍለ ካሕሳ ኣብቲ ኣደባባይ
ንዕምቆት ፍቕርኻ ልበይ እንተ ዘይ ተገንዘቦ

VERSE 9
ከምቶም ዘቕረብካዮ ባሮት ባዕልኻ ኣቕርቦ',
      lyrics_transliteration = 'Meglets’i arkebon goytay zehlefkayo siቓy
Siley ziteኸfle kahsa abti adebabay
Niemqot fiቕrኻ libey ente zey tegenzebo
Kemtom zeቕrebkayo barot baelኻ aቕrbo

VERSE 1
<><><><><><><><><><><><><><><><><><><><>
Kab dembey arhiቐ nibeyney kiኹbll ab aኽran bereኻ
Aቕley ts’ebibuni yeewenwn aleኹ t’efia kabaኻ
Qulih beleniኻ ziredani yelon kabaኻ halifu

VERSE 2
Yits’be''lo wisht’ey qew ilu bitesfa hiቕfoኻ harifu
Kemta enko begie fiቕrኻ zemts’ea
Goytay bimhretka dileyeni nea
><><><><><><><><><><><><><><><><><>

VERSE 3
Dimts’ኻ semia bibahgi keyqerb libey amberkiኻ
Mewael halifu seget’ meget’ kibl aegarey haliኸ
Kelkali bizuhyu ''tay ilka kitqots’ro kabaኻ zerhቕ
Diኻmey riiኻ baelኻ eleyo bahgey keyts’nqeቕ

VERSE 4
Zelile kiwerd kabti newih sagla
Ts’awit fiቕrኻ libey tits’be ala
<><><><><><><><><><><><><><><><><><>
Neza hats’ar hiywet kem enbaba meror teraeya tiቕmsl

VERSE 5
Kan bizeleኹwo keywdae tiemrey new nejew enkbl
Tizgeberkaley wielet hadish kidan libey kiswet’o
Bigrhti libi kigoyi nab daska menfesey lewt’o
Kemtom edumatka kiatu bet weyni

VERSE 6
Ab qarana guezoy goytay gof beleni
<><><><><><><><><><><><><><><><><><>
Kemti mijmarey niኹlu halife bidhnet kiwde
Misaኻ kiayi ab libey bel niges bimhretka mits’ae

VERSE 7
T’efiuni aykonen goytay etdelyo fit’urka aytቕbets’
Migbarye siine ember mideleኹ ferise kihnets’
Kem nayta mebelet biwhud kiemen
Senatim migbarey baelኻ aberkten

VERSE 8
<><><><><><><><><><><><><><><>
Meglets’i arkebon goytay zehlefkayo siቓy
Siley ziteኸfle kahsa abti adebabay
Niemqot fiቕrኻ libey ente zey tegenzebo

VERSE 9
Kemtom zeቕrebkayo barot baelኻ aቕrbo',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-tewahdo-mezmur-3941'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መግለጺ ኣርከቦን ጎይታይ ዘሕለፍካዮ ስቓይ
ስለይ ዝተኸፍለ ካሕሳ ኣብቲ ኣደባባይ
ንዕምቆት ፍቕርኻ ልበይ እንተ ዘይ ተገንዘቦ
ከምቶም ዘቕረብካዮ ባሮት ባዕልኻ ኣቕርቦ

VERSE 1
<><><><><><><><><><><><><><><><><><><><>
ካብ ደምበይ ኣርሒቐ ንበይነይ ክኹብልል ኣብ ኣኽራን በረኻ
ዓቕለይ ጸቢቡኒ የዕወንውን ኣለኹ ጠፊአ ካባኻ
ቁሊሕ በለኒኻ ዝረድኣኒ የሎን ካባኻ ሓሊፉ

CHORUS
መግለጺ ኣርከቦን ጎይታይ ዘሕለፍካዮ ስቓይ
ስለይ ዝተኸፍለ ካሕሳ ኣብቲ ኣደባባይ
ንዕምቆት ፍቕርኻ ልበይ እንተ ዘይ ተገንዘቦ
ከምቶም ዘቕረብካዮ ባሮት ባዕልኻ ኣቕርቦ

VERSE 2
ይጽበ''ሎ ውሽጠይ ቀው ኢሉ ብተስፋ ሕቕፎኻ ሃሪፉ
ከምታ እንኮ በጊዕ ፍቕርኻ ዘምጸኣ
ጎይታይ ብምሕረትካ ድለየኒ ነዓ
><><><><><><><><><><><><><><><><><>

CHORUS
መግለጺ ኣርከቦን ጎይታይ ዘሕለፍካዮ ስቓይ
ስለይ ዝተኸፍለ ካሕሳ ኣብቲ ኣደባባይ
ንዕምቆት ፍቕርኻ ልበይ እንተ ዘይ ተገንዘቦ
ከምቶም ዘቕረብካዮ ባሮት ባዕልኻ ኣቕርቦ

VERSE 3
ድምጽኻ ሰሚዐ ብባህጊ ከይቀርብ ልበይ ኣምበርኪኻ
መዋእል ሓሊፉ ሰገጥ መገጥ ክብል ኣእጋረይ ሓሊኸ
ከልካሊ ብዙሕዩ ''ታይ ኢልካ ክትቆጽሮ ካባኻ ዘርሕቕ
ድኻመይ ርኢኻ ባዕልኻ እለዮ ባህገይ ከይጽንቀቕ

CHORUS
መግለጺ ኣርከቦን ጎይታይ ዘሕለፍካዮ ስቓይ
ስለይ ዝተኸፍለ ካሕሳ ኣብቲ ኣደባባይ
ንዕምቆት ፍቕርኻ ልበይ እንተ ዘይ ተገንዘቦ
ከምቶም ዘቕረብካዮ ባሮት ባዕልኻ ኣቕርቦ

VERSE 4
ዘሊለ ክወርድ ካብቲ ነዊሕ ሳግላ
ጻውዒት ፍቕርኻ ልበይ ትጽበ ኣላ
<><><><><><><><><><><><><><><><><><>
ነዛ ሓጻር ህይወት ከም ዕንባባ መሮር ተራእያ ትቕምስል

CHORUS
መግለጺ ኣርከቦን ጎይታይ ዘሕለፍካዮ ስቓይ
ስለይ ዝተኸፍለ ካሕሳ ኣብቲ ኣደባባይ
ንዕምቆት ፍቕርኻ ልበይ እንተ ዘይ ተገንዘቦ
ከምቶም ዘቕረብካዮ ባሮት ባዕልኻ ኣቕርቦ

VERSE 5
ካን ብዘለኹዎ ከይውዳእ ትዕምረይ ኔው ነጀው እንክብል
ትዝገበርካለይ ውዕለት ሓዲሽ ኪዳን ልበይ ክስወጦ
ብግርህቲ ልቢ ክጎዪ ናብ ዳስካ መንፈሰይ ለውጦ
ከምቶም ዕዱማትካ ክኣቱ ቤት ወይኒ

CHORUS
መግለጺ ኣርከቦን ጎይታይ ዘሕለፍካዮ ስቓይ
ስለይ ዝተኸፍለ ካሕሳ ኣብቲ ኣደባባይ
ንዕምቆት ፍቕርኻ ልበይ እንተ ዘይ ተገንዘቦ
ከምቶም ዘቕረብካዮ ባሮት ባዕልኻ ኣቕርቦ

VERSE 6
ኣብ ቃራና ጉዕዞይ ጎይታይ ጎፍ በለኒ
<><><><><><><><><><><><><><><><><><>
ከምቲ ምጅማረይ ንኹሉ ሓሊፈ ብድሕነት ክውድእ
ምሳኻ ክዓዪ ኣብ ልበይ በል ንገስ ብምሕረትካ ምጻእ

CHORUS
መግለጺ ኣርከቦን ጎይታይ ዘሕለፍካዮ ስቓይ
ስለይ ዝተኸፍለ ካሕሳ ኣብቲ ኣደባባይ
ንዕምቆት ፍቕርኻ ልበይ እንተ ዘይ ተገንዘቦ
ከምቶም ዘቕረብካዮ ባሮት ባዕልኻ ኣቕርቦ

VERSE 7
ጠፊኡኒ ኣይኮነን ጎይታይ እትደልዮ ፍጡርካ ኣይትቕበጽ
ምግባርየ ስኢነ እምበር ምደለኹ ፈሪሰ ክህነጽ
ከም ናይታ መበለት ብውሑድ ክእመን
ሰናቲም ምግባረይ ባዕልኻ ኣበርክተን

CHORUS
መግለጺ ኣርከቦን ጎይታይ ዘሕለፍካዮ ስቓይ
ስለይ ዝተኸፍለ ካሕሳ ኣብቲ ኣደባባይ
ንዕምቆት ፍቕርኻ ልበይ እንተ ዘይ ተገንዘቦ
ከምቶም ዘቕረብካዮ ባሮት ባዕልኻ ኣቕርቦ

VERSE 8
<><><><><><><><><><><><><><><>
መግለጺ ኣርከቦን ጎይታይ ዘሕለፍካዮ ስቓይ
ስለይ ዝተኸፍለ ካሕሳ ኣብቲ ኣደባባይ
ንዕምቆት ፍቕርኻ ልበይ እንተ ዘይ ተገንዘቦ

CHORUS
መግለጺ ኣርከቦን ጎይታይ ዘሕለፍካዮ ስቓይ
ስለይ ዝተኸፍለ ካሕሳ ኣብቲ ኣደባባይ
ንዕምቆት ፍቕርኻ ልበይ እንተ ዘይ ተገንዘቦ
ከምቶም ዘቕረብካዮ ባሮት ባዕልኻ ኣቕርቦ

VERSE 9
ከምቶም ዘቕረብካዮ ባሮት ባዕልኻ ኣቕርቦ

CHORUS
መግለጺ ኣርከቦን ጎይታይ ዘሕለፍካዮ ስቓይ
ስለይ ዝተኸፍለ ካሕሳ ኣብቲ ኣደባባይ
ንዕምቆት ፍቕርኻ ልበይ እንተ ዘይ ተገንዘቦ
ከምቶም ዘቕረብካዮ ባሮት ባዕልኻ ኣቕርቦ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Meglets’i arkebon goytay zehlefkayo siቓy
Siley ziteኸfle kahsa abti adebabay
Niemqot fiቕrኻ libey ente zey tegenzebo
Kemtom zeቕrebkayo barot baelኻ aቕrbo

VERSE 1
<><><><><><><><><><><><><><><><><><><><>
Kab dembey arhiቐ nibeyney kiኹbll ab aኽran bereኻ
Aቕley ts’ebibuni yeewenwn aleኹ t’efia kabaኻ
Qulih beleniኻ ziredani yelon kabaኻ halifu

CHORUS
Meglets’i arkebon goytay zehlefkayo siቓy
Siley ziteኸfle kahsa abti adebabay
Niemqot fiቕrኻ libey ente zey tegenzebo
Kemtom zeቕrebkayo barot baelኻ aቕrbo

VERSE 2
Yits’be''lo wisht’ey qew ilu bitesfa hiቕfoኻ harifu
Kemta enko begie fiቕrኻ zemts’ea
Goytay bimhretka dileyeni nea
><><><><><><><><><><><><><><><><><>

CHORUS
Meglets’i arkebon goytay zehlefkayo siቓy
Siley ziteኸfle kahsa abti adebabay
Niemqot fiቕrኻ libey ente zey tegenzebo
Kemtom zeቕrebkayo barot baelኻ aቕrbo

VERSE 3
Dimts’ኻ semia bibahgi keyqerb libey amberkiኻ
Mewael halifu seget’ meget’ kibl aegarey haliኸ
Kelkali bizuhyu ''tay ilka kitqots’ro kabaኻ zerhቕ
Diኻmey riiኻ baelኻ eleyo bahgey keyts’nqeቕ

CHORUS
Meglets’i arkebon goytay zehlefkayo siቓy
Siley ziteኸfle kahsa abti adebabay
Niemqot fiቕrኻ libey ente zey tegenzebo
Kemtom zeቕrebkayo barot baelኻ aቕrbo

VERSE 4
Zelile kiwerd kabti newih sagla
Ts’awit fiቕrኻ libey tits’be ala
<><><><><><><><><><><><><><><><><><>
Neza hats’ar hiywet kem enbaba meror teraeya tiቕmsl

CHORUS
Meglets’i arkebon goytay zehlefkayo siቓy
Siley ziteኸfle kahsa abti adebabay
Niemqot fiቕrኻ libey ente zey tegenzebo
Kemtom zeቕrebkayo barot baelኻ aቕrbo

VERSE 5
Kan bizeleኹwo keywdae tiemrey new nejew enkbl
Tizgeberkaley wielet hadish kidan libey kiswet’o
Bigrhti libi kigoyi nab daska menfesey lewt’o
Kemtom edumatka kiatu bet weyni

CHORUS
Meglets’i arkebon goytay zehlefkayo siቓy
Siley ziteኸfle kahsa abti adebabay
Niemqot fiቕrኻ libey ente zey tegenzebo
Kemtom zeቕrebkayo barot baelኻ aቕrbo

VERSE 6
Ab qarana guezoy goytay gof beleni
<><><><><><><><><><><><><><><><><><>
Kemti mijmarey niኹlu halife bidhnet kiwde
Misaኻ kiayi ab libey bel niges bimhretka mits’ae

CHORUS
Meglets’i arkebon goytay zehlefkayo siቓy
Siley ziteኸfle kahsa abti adebabay
Niemqot fiቕrኻ libey ente zey tegenzebo
Kemtom zeቕrebkayo barot baelኻ aቕrbo

VERSE 7
T’efiuni aykonen goytay etdelyo fit’urka aytቕbets’
Migbarye siine ember mideleኹ ferise kihnets’
Kem nayta mebelet biwhud kiemen
Senatim migbarey baelኻ aberkten

CHORUS
Meglets’i arkebon goytay zehlefkayo siቓy
Siley ziteኸfle kahsa abti adebabay
Niemqot fiቕrኻ libey ente zey tegenzebo
Kemtom zeቕrebkayo barot baelኻ aቕrbo

VERSE 8
<><><><><><><><><><><><><><><>
Meglets’i arkebon goytay zehlefkayo siቓy
Siley ziteኸfle kahsa abti adebabay
Niemqot fiቕrኻ libey ente zey tegenzebo

CHORUS
Meglets’i arkebon goytay zehlefkayo siቓy
Siley ziteኸfle kahsa abti adebabay
Niemqot fiቕrኻ libey ente zey tegenzebo
Kemtom zeቕrebkayo barot baelኻ aቕrbo

VERSE 9
Kemtom zeቕrebkayo barot baelኻ aቕrbo

CHORUS
Meglets’i arkebon goytay zehlefkayo siቓy
Siley ziteኸfle kahsa abti adebabay
Niemqot fiቕrኻ libey ente zey tegenzebo
Kemtom zeቕrebkayo barot baelኻ aቕrbo'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-tewahdo-mezmur-3941', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: ERITREAN ORTHODOX TEWAHDO MEZMUR (eritrean-orthodox-tewahdo-mezmur-4006)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መልኣከ ራማ ሰማያዊ
ኄር ለዋህ ኣቦ ሰለማዊ
ስሙ ጸውዑ ክረድኣና
ሚካኤል በሉ ክንፉ ከጽልለልና

VERSE 1
ኣቦ ሓሶት ጉርሒ ቀናእ ብባህሪኡ
ኣምላኽነት ጎይታ ዘውትር ሃረርትኡ
ምስሉይ ውቁብ ሕብሩ ቆይሙ ኣብ ቅድሜና
የኽመስምስ ኢዩ ዘሎ ክሰልብ ቀልብና /2/

VERSE 2
ነዓ ሚካኤል ተገለጽ ብኽብሪ
ነዓ ሚካኤል ሓዘንና ዛዛሚ
ነዓ ሚካኤል ትጽውዕያ ዘላ
ነዓ ሚካኤል ኣፎምያ ናይ ሎሚ

VERSE 3
ጠቐር ሓጢኣት ክፍኣት ስልማት መልክዐይ
ማሙቕ ሶፋ ምቾት ትምኒት ሕንቁቕ ልበይ
ሃልኪ ድኻም ጉዕዞ ኣንጻር ንባህረይ
ፍርደይ ዘንጊዐዮ መስኪን እንታይ ግደይ /2/

VERSE 4
ነዓ ሚካኤል ኣእምሮይ ክፈቶ
ነዓ ሚካኤል ህይወተይ ለውጦ
ነዓ ሚካኤል ኣምሳል ህይወት ባህራን
ነዓ ሚካኤል ነፍሲ ወድኻ ኣልዕል

VERSE 5
ኣምሳል ሽፍታ ሞሮር ኣንፈተይ ወሲና
ከም ዕምኮ ንጫቑት ንሱግመይ ከርዲና
ኣምርሕ ትብል ዓለም ጉዕዞይ ከተፈልም
ናብ ኣድማስ ዓዘቕቲ መንክርዩ መስደምም/2/

VERSE 6
ነዓ ሚካኤል ቀልስ ኣንፈት ጉዕዞይ
ነዓ ሚካኤል ኣንፍት ርስቲ ቤተይ
ነዓ ሚካኤል እሙን መሪሕ እስራኤል
ነዓ ሚካኤል ዙርያ ጉዕዞይ ከልል',
      lyrics_transliteration = 'Melake rama semayawi
Her lewah abo selemawi
Simu ts’ewu kiredana
Mikael belu kinfu kets’llelna

VERSE 1
Abo hasot gurhi qenae bibahriu
Amlaኽnet goyta zewtr harertu
Misluy wiqub hibru qoymu ab qidmena
Yeኽmesms iyu zelo kiselb qelbna (2)

VERSE 2
Nea Mikael tegelets’ biኽbri
Nea Mikael hazenna zazami
Nea Mikael tits’weya zela
Nea Mikael afomya nay lomi

VERSE 3
T’eቐr hat’iat kifat silmat melkay
Mamuቕ sofa michot timnit hinquቕ libey
Halki diኻm guezo ants’ar nibahrey
Firdey zengiayo meskin entay gidey (2)

VERSE 4
Nea Mikael aemroy kifeto
Nea Mikael hiywetey lewt’o
Nea Mikael amsal hiywet bahran
Nea Mikael nefsi wedኻ alel

VERSE 5
Amsal shfta moror anfetey wesina
Kem emko nich’aቑt nisugmey kerdina
Amrh tibl alem guezoy ketefelm
Nab admas azeቕti menkryu mesdemm (2)

VERSE 6
Nea Mikael qels anfet guezoy
Nea Mikael anft risti betey
Nea Mikael emun merih esrael
Nea Mikael zurya guezoy kell',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-tewahdo-mezmur-4006'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መልኣከ ራማ ሰማያዊ
ኄር ለዋህ ኣቦ ሰለማዊ
ስሙ ጸውዑ ክረድኣና
ሚካኤል በሉ ክንፉ ከጽልለልና

VERSE 1
ኣቦ ሓሶት ጉርሒ ቀናእ ብባህሪኡ
ኣምላኽነት ጎይታ ዘውትር ሃረርትኡ
ምስሉይ ውቁብ ሕብሩ ቆይሙ ኣብ ቅድሜና
የኽመስምስ ኢዩ ዘሎ ክሰልብ ቀልብና /2/

CHORUS
መልኣከ ራማ ሰማያዊ
ኄር ለዋህ ኣቦ ሰለማዊ
ስሙ ጸውዑ ክረድኣና
ሚካኤል በሉ ክንፉ ከጽልለልና

VERSE 2
ነዓ ሚካኤል ተገለጽ ብኽብሪ
ነዓ ሚካኤል ሓዘንና ዛዛሚ
ነዓ ሚካኤል ትጽውዕያ ዘላ
ነዓ ሚካኤል ኣፎምያ ናይ ሎሚ

CHORUS
መልኣከ ራማ ሰማያዊ
ኄር ለዋህ ኣቦ ሰለማዊ
ስሙ ጸውዑ ክረድኣና
ሚካኤል በሉ ክንፉ ከጽልለልና

VERSE 3
ጠቐር ሓጢኣት ክፍኣት ስልማት መልክዐይ
ማሙቕ ሶፋ ምቾት ትምኒት ሕንቁቕ ልበይ
ሃልኪ ድኻም ጉዕዞ ኣንጻር ንባህረይ
ፍርደይ ዘንጊዐዮ መስኪን እንታይ ግደይ /2/

CHORUS
መልኣከ ራማ ሰማያዊ
ኄር ለዋህ ኣቦ ሰለማዊ
ስሙ ጸውዑ ክረድኣና
ሚካኤል በሉ ክንፉ ከጽልለልና

VERSE 4
ነዓ ሚካኤል ኣእምሮይ ክፈቶ
ነዓ ሚካኤል ህይወተይ ለውጦ
ነዓ ሚካኤል ኣምሳል ህይወት ባህራን
ነዓ ሚካኤል ነፍሲ ወድኻ ኣልዕል

CHORUS
መልኣከ ራማ ሰማያዊ
ኄር ለዋህ ኣቦ ሰለማዊ
ስሙ ጸውዑ ክረድኣና
ሚካኤል በሉ ክንፉ ከጽልለልና

VERSE 5
ኣምሳል ሽፍታ ሞሮር ኣንፈተይ ወሲና
ከም ዕምኮ ንጫቑት ንሱግመይ ከርዲና
ኣምርሕ ትብል ዓለም ጉዕዞይ ከተፈልም
ናብ ኣድማስ ዓዘቕቲ መንክርዩ መስደምም/2/

CHORUS
መልኣከ ራማ ሰማያዊ
ኄር ለዋህ ኣቦ ሰለማዊ
ስሙ ጸውዑ ክረድኣና
ሚካኤል በሉ ክንፉ ከጽልለልና

VERSE 6
ነዓ ሚካኤል ቀልስ ኣንፈት ጉዕዞይ
ነዓ ሚካኤል ኣንፍት ርስቲ ቤተይ
ነዓ ሚካኤል እሙን መሪሕ እስራኤል
ነዓ ሚካኤል ዙርያ ጉዕዞይ ከልል

CHORUS
መልኣከ ራማ ሰማያዊ
ኄር ለዋህ ኣቦ ሰለማዊ
ስሙ ጸውዑ ክረድኣና
ሚካኤል በሉ ክንፉ ከጽልለልና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Melake rama semayawi
Her lewah abo selemawi
Simu ts’ewu kiredana
Mikael belu kinfu kets’llelna

VERSE 1
Abo hasot gurhi qenae bibahriu
Amlaኽnet goyta zewtr harertu
Misluy wiqub hibru qoymu ab qidmena
Yeኽmesms iyu zelo kiselb qelbna (2)

CHORUS
Melake rama semayawi
Her lewah abo selemawi
Simu ts’ewu kiredana
Mikael belu kinfu kets’llelna

VERSE 2
Nea Mikael tegelets’ biኽbri
Nea Mikael hazenna zazami
Nea Mikael tits’weya zela
Nea Mikael afomya nay lomi

CHORUS
Melake rama semayawi
Her lewah abo selemawi
Simu ts’ewu kiredana
Mikael belu kinfu kets’llelna

VERSE 3
T’eቐr hat’iat kifat silmat melkay
Mamuቕ sofa michot timnit hinquቕ libey
Halki diኻm guezo ants’ar nibahrey
Firdey zengiayo meskin entay gidey (2)

CHORUS
Melake rama semayawi
Her lewah abo selemawi
Simu ts’ewu kiredana
Mikael belu kinfu kets’llelna

VERSE 4
Nea Mikael aemroy kifeto
Nea Mikael hiywetey lewt’o
Nea Mikael amsal hiywet bahran
Nea Mikael nefsi wedኻ alel

CHORUS
Melake rama semayawi
Her lewah abo selemawi
Simu ts’ewu kiredana
Mikael belu kinfu kets’llelna

VERSE 5
Amsal shfta moror anfetey wesina
Kem emko nich’aቑt nisugmey kerdina
Amrh tibl alem guezoy ketefelm
Nab admas azeቕti menkryu mesdemm (2)

CHORUS
Melake rama semayawi
Her lewah abo selemawi
Simu ts’ewu kiredana
Mikael belu kinfu kets’llelna

VERSE 6
Nea Mikael qels anfet guezoy
Nea Mikael anft risti betey
Nea Mikael emun merih esrael
Nea Mikael zurya guezoy kell

CHORUS
Melake rama semayawi
Her lewah abo selemawi
Simu ts’ewu kiredana
Mikael belu kinfu kets’llelna'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-tewahdo-mezmur-4006', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eritrean Orthodox Tewahdo Mezmur (eritrean-orthodox-tewahdo-mezmur-4024)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 1
ብተምሳል ግብርኻ ምስልኻ ኣብ ዙርያይ ከቢቡኒ ይነብር
መንፈስካ ሓይልኻን ብእምነት ሰኒቀ ማዕበል ባሕሪ ይሰግር
ኣዝ. . .
ኣብቲ ጉዕዞ ህይወት ስቅታ ከም ጽላሎት ደድሕረይ ክመጽእ

VERSE 2
ሰላም ርሒቁኒ ተገሪሙ ልበይ ምፍጣረይ ክጸልእ
ብሃንደበት መጺኡ ድምጸይ ከይሰምዐ ማዕጹኡ መን ኣርሕዩ
ደበስ ኮይኑ ቃሉ ተስፋይ ዘሐደሰ ድሕነተይ ተመንዩ
ኣዝ. . .

VERSE 3
ነፍሰይ ነይሰኣነት ኣብ ሕቅፍኡ ዘሙቋ ዝሓልየላ ኣብሊጹ
ባዲመ ኽይተርፍ ካብ ምልኣቱ ጸጋ ኣብ ውሽጠይ ኣስሪጹ
አምላኸይ መድሕነይ ኣይገድፈንን በይነይ ምሳይ ኣሎ ኩሉ
ካብ በላዒ ካብቲ ሓያል ጥዑም ዘውጽእ እንድዩ ሓይሉ

VERSE 4
ኣዝ. . .
መርዛም ቀስቲ ሰባት ቃላት ተጠሚዑ ሕልናይ ከቁስል
ክብረት ከምዘይብሉ በቃ ዕዙም ኮይነ በይኑ ዘስተማስል
ሕያዋይ ሳምራዊ ገጽ ሰባት ከይጥምት ኣይፈቀደን ልቡ

VERSE 5
ምሒር ካብ ምፍቃፉስ ክብረት ከንግሰለይ ወዱ በጃ ሂቡ
ኣዝ. . .
ቤተይ ካብ መጻእካ ዘፈርፈር ክዳንካ ልበይ ክትንክዮ
ውሉድካ ክኸውን ካብ ሃብካኒ መሰል ብምስጢር ቀራንዮ

VERSE 6
ንዘይገደፍካኒ ናይ ሰላም መንፈስካ ካባይ ንክኽእለ
ቃለይ ቃል ልሳነይ ቃንዩ’ለኹ ጎይታይ ንምስጋናኻ ኢለ
ኣዝ. . .',
      lyrics_transliteration = 'Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye

VERSE 1
Bitemsal gibrኻ mislኻ ab zuryay kebibuni yinebr
Menfeska haylኻn biemnet seniqe maebel bahri yisegr
Az. . .
Abti guezo hiywet siqta kem ts’lalot dedhrey kimets’e

VERSE 2
Selam rihiquni tegerimu libey mift’arey kits’ele
Bihandebet mets’iu dimts’ey keysema maets’uu men arhyu
Debes koynu qalu tesfay zehedese dihnetey temenyu
Az. . .

VERSE 3
Nefsey neyseanet ab hiqfu zemuqwa zihalyela ablits’u
Badime ኽyterf kab milatu ts’ega ab wisht’ey asrits’u
Amlaኸy medhney aygedfenn beyney misay alo kulu
Kab belai kabti hayal t’um zewts’e endyu haylu

VERSE 4
Az. . .
Merzam qesti sebat qalat tet’emiu hilnay kequsl
Kibret kemzeyblu beqa ezum koyne beynu zestemasl
Hiyaway samrawi gets’ sebat keyt’mt ayfeqeden libu

VERSE 5
Mihir kab mifqafus kibret kengseley wedu beja hibu
Az. . .
Betey kab mets’aeka zeferfer kidanka libey kitnkyo
Wiludka kiኸwn kab habkani mesel bimst’ir qeranyo

VERSE 6
Nizeygedefkani nay selam menfeska kabay nikኽele
Qaley qal lisaney qanyu’leኹ goytay nimsganaኻ ile
Az. . .',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-tewahdo-mezmur-4024'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 1
ብተምሳል ግብርኻ ምስልኻ ኣብ ዙርያይ ከቢቡኒ ይነብር
መንፈስካ ሓይልኻን ብእምነት ሰኒቀ ማዕበል ባሕሪ ይሰግር
ኣዝ. . .
ኣብቲ ጉዕዞ ህይወት ስቅታ ከም ጽላሎት ደድሕረይ ክመጽእ

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 2
ሰላም ርሒቁኒ ተገሪሙ ልበይ ምፍጣረይ ክጸልእ
ብሃንደበት መጺኡ ድምጸይ ከይሰምዐ ማዕጹኡ መን ኣርሕዩ
ደበስ ኮይኑ ቃሉ ተስፋይ ዘሐደሰ ድሕነተይ ተመንዩ
ኣዝ. . .

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 3
ነፍሰይ ነይሰኣነት ኣብ ሕቅፍኡ ዘሙቋ ዝሓልየላ ኣብሊጹ
ባዲመ ኽይተርፍ ካብ ምልኣቱ ጸጋ ኣብ ውሽጠይ ኣስሪጹ
አምላኸይ መድሕነይ ኣይገድፈንን በይነይ ምሳይ ኣሎ ኩሉ
ካብ በላዒ ካብቲ ሓያል ጥዑም ዘውጽእ እንድዩ ሓይሉ

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 4
ኣዝ. . .
መርዛም ቀስቲ ሰባት ቃላት ተጠሚዑ ሕልናይ ከቁስል
ክብረት ከምዘይብሉ በቃ ዕዙም ኮይነ በይኑ ዘስተማስል
ሕያዋይ ሳምራዊ ገጽ ሰባት ከይጥምት ኣይፈቀደን ልቡ

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 5
ምሒር ካብ ምፍቃፉስ ክብረት ከንግሰለይ ወዱ በጃ ሂቡ
ኣዝ. . .
ቤተይ ካብ መጻእካ ዘፈርፈር ክዳንካ ልበይ ክትንክዮ
ውሉድካ ክኸውን ካብ ሃብካኒ መሰል ብምስጢር ቀራንዮ

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 6
ንዘይገደፍካኒ ናይ ሰላም መንፈስካ ካባይ ንክኽእለ
ቃለይ ቃል ልሳነይ ቃንዩ’ለኹ ጎይታይ ንምስጋናኻ ኢለ
ኣዝ. . .

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye

VERSE 1
Bitemsal gibrኻ mislኻ ab zuryay kebibuni yinebr
Menfeska haylኻn biemnet seniqe maebel bahri yisegr
Az. . .
Abti guezo hiywet siqta kem ts’lalot dedhrey kimets’e

CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye

VERSE 2
Selam rihiquni tegerimu libey mift’arey kits’ele
Bihandebet mets’iu dimts’ey keysema maets’uu men arhyu
Debes koynu qalu tesfay zehedese dihnetey temenyu
Az. . .

CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye

VERSE 3
Nefsey neyseanet ab hiqfu zemuqwa zihalyela ablits’u
Badime ኽyterf kab milatu ts’ega ab wisht’ey asrits’u
Amlaኸy medhney aygedfenn beyney misay alo kulu
Kab belai kabti hayal t’um zewts’e endyu haylu

CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye

VERSE 4
Az. . .
Merzam qesti sebat qalat tet’emiu hilnay kequsl
Kibret kemzeyblu beqa ezum koyne beynu zestemasl
Hiyaway samrawi gets’ sebat keyt’mt ayfeqeden libu

CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye

VERSE 5
Mihir kab mifqafus kibret kengseley wedu beja hibu
Az. . .
Betey kab mets’aeka zeferfer kidanka libey kitnkyo
Wiludka kiኸwn kab habkani mesel bimst’ir qeranyo

CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye

VERSE 6
Nizeygedefkani nay selam menfeska kabay nikኽele
Qaley qal lisaney qanyu’leኹ goytay nimsganaኻ ile
Az. . .

CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-tewahdo-mezmur-4024', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eritrean Orthodox Tewahdo Mezmur (eritrean-orthodox-tewahdo-mezmur-4139)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 1
እንካብ ዝተወልዱ ብዕብየት ትዝከር
ሕሹኽ በል ንጎይታይ ናብ ዳሱ ክጽንበር፡ ነቢየ ልዑል
ኣብ ማእከል ኣእላፋት ዓሌታት ናይ ምድሪ
ብዘይጽምሉ ኣኽሊል ንነፍሰይ ከጥሪ፡ ዓመታተይ ባርኽ

VERSE 2
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ገለ ተረኸብኩ ዕድል ተሳትፎ
ኣብቲ ክቡር ዕድመ ንስመይ ጸሓፎ፡ ዮሃንስ
እንካብ ዘለኹዎ ክግስግስ ብሓይሊ

VERSE 3
ጎበዝ ረድኤትካ ንስጕመይ የሳሊ፡ ነቢየ ልዑል
ኣብ ማእከል ኣእላፋት ዓሌታት ናይ ምድሪ
ብዘይጽምሉ ኣኽሊል ንነፍሰይ ከጥሪ፡ ዓመታተይ ባርኽ
ዓርኩ ለመርዓዊ ትሰመይ፡ ወኣንተኒ ህጻን ነቢየ ልዑል !

VERSE 4
ኣብቲ ዳስ ንጽህና ኩሉ ናዓለለ
ሰንኪ ክዳን መርዓ ካብ ሰበይ ከይፍለ፡ ዮሃንስ
ልብሲ ጥዑስ ልቢ ዘሳግር ናብ ሰማይ
ምስቲ ጸጕሪ ገመል ፈልቊ ስፈየለይ፡ ነቢየ ልዑል

VERSE 5
ኣብ ማእከል ኣእላፋት ዓሌታት ናይ ምድሪ
ብዘይጽምሉ ኣኽሊል ንነፍሰይ ከጥሪ፡ ዓመታተይ ባርኽ
ወኣንተኒ ህጻን ነቢየ ልዑል
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል !

VERSE 6
ሰዓት ምስ ኣኸለ ምምጻእ ናይ መርዓዊ
ምስ ዘበርህ ቀንዴል ምሕረቱ ክጸዊ፡ ዮሃንስ
ትብሩኽ መንፈሱ ነፍሰይ ክማርኻ
ዘመን ፍረ ጌርካ ዓመተይ ባርካ፡ ነቢየ ልዑል

VERSE 7
ኣብ ማእከል ኣእላፋት ዓሌታት ናይ ምድሪ
ብዘይጽምሉ ኣኽሊል ንነፍሰይ ከጥሪ፡ ዓመታተይ ባርኽ
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል (2)',
      lyrics_transliteration = 'Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 1
Enkab ziteweldu biebyet tizker
Hishuኽ bel nigoytay nab dasu kits’nber nebiye liul
Ab maekel aelafat aletat nay midri
Bizeyts’mlu aኽlil ninefsey ket’ri ametatey barኽ

VERSE 2
Weanteni hits’an nebiye liul (2)
Gele tereኸbku edl tesatfo
Abti kibur edme nismey ts’ehafo yohans
Enkab zeleኹwo kigsgs bihayli

VERSE 3
Gobez redetka nisgwmey yesali nebiye liul
Ab maekel aelafat aletat nay midri
Bizeyts’mlu aኽlil ninefsey ket’ri ametatey barኽ
Arku lemerawi tisemey weanteni hits’an nebiye liul !

VERSE 4
Abti das nits’hna kulu naalele
Senki kidan mera kab sebey keyfle yohans
Libsi t’us libi zesagr nab semay
Misti ts’egwri gemel felqwi sifeyeley nebiye liul

VERSE 5
Ab maekel aelafat aletat nay midri
Bizeyts’mlu aኽlil ninefsey ket’ri ametatey barኽ
Weanteni hits’an nebiye liul
Arku lemerawi tisemey tisemey nebiye liul !

VERSE 6
Seat mis aኸle mimts’ae nay merawi
Mis zeberh qendel mihretu kits’ewi yohans
Tibruኽ menfesu nefsey kimarኻ
Zemen fire gerka ametey barka nebiye liul

VERSE 7
Ab maekel aelafat aletat nay midri
Bizeyts’mlu aኽlil ninefsey ket’ri ametatey barኽ
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-tewahdo-mezmur-4139'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 1
እንካብ ዝተወልዱ ብዕብየት ትዝከር
ሕሹኽ በል ንጎይታይ ናብ ዳሱ ክጽንበር፡ ነቢየ ልዑል
ኣብ ማእከል ኣእላፋት ዓሌታት ናይ ምድሪ
ብዘይጽምሉ ኣኽሊል ንነፍሰይ ከጥሪ፡ ዓመታተይ ባርኽ

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 2
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ገለ ተረኸብኩ ዕድል ተሳትፎ
ኣብቲ ክቡር ዕድመ ንስመይ ጸሓፎ፡ ዮሃንስ
እንካብ ዘለኹዎ ክግስግስ ብሓይሊ

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 3
ጎበዝ ረድኤትካ ንስጕመይ የሳሊ፡ ነቢየ ልዑል
ኣብ ማእከል ኣእላፋት ዓሌታት ናይ ምድሪ
ብዘይጽምሉ ኣኽሊል ንነፍሰይ ከጥሪ፡ ዓመታተይ ባርኽ
ዓርኩ ለመርዓዊ ትሰመይ፡ ወኣንተኒ ህጻን ነቢየ ልዑል !

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 4
ኣብቲ ዳስ ንጽህና ኩሉ ናዓለለ
ሰንኪ ክዳን መርዓ ካብ ሰበይ ከይፍለ፡ ዮሃንስ
ልብሲ ጥዑስ ልቢ ዘሳግር ናብ ሰማይ
ምስቲ ጸጕሪ ገመል ፈልቊ ስፈየለይ፡ ነቢየ ልዑል

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 5
ኣብ ማእከል ኣእላፋት ዓሌታት ናይ ምድሪ
ብዘይጽምሉ ኣኽሊል ንነፍሰይ ከጥሪ፡ ዓመታተይ ባርኽ
ወኣንተኒ ህጻን ነቢየ ልዑል
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል !

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 6
ሰዓት ምስ ኣኸለ ምምጻእ ናይ መርዓዊ
ምስ ዘበርህ ቀንዴል ምሕረቱ ክጸዊ፡ ዮሃንስ
ትብሩኽ መንፈሱ ነፍሰይ ክማርኻ
ዘመን ፍረ ጌርካ ዓመተይ ባርካ፡ ነቢየ ልዑል

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ

VERSE 7
ኣብ ማእከል ኣእላፋት ዓሌታት ናይ ምድሪ
ብዘይጽምሉ ኣኽሊል ንነፍሰይ ከጥሪ፡ ዓመታተይ ባርኽ
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል (2)

CHORUS
ወኣንተኒ ህጻን ነቢየ ልዑል (2)
ዓርኩ ለመርዓዊ ትሰመይ፡ ትሰመይ ነቢየ ልዑል
ጸራጊ መገዲ ምሕረት ደቂ ኣዳም
እሙን ዓርኪ ርእሲ ነቲ ገንሸል ዓለም፡ ዮሃንስ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 1
Enkab ziteweldu biebyet tizker
Hishuኽ bel nigoytay nab dasu kits’nber nebiye liul
Ab maekel aelafat aletat nay midri
Bizeyts’mlu aኽlil ninefsey ket’ri ametatey barኽ

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 2
Weanteni hits’an nebiye liul (2)
Gele tereኸbku edl tesatfo
Abti kibur edme nismey ts’ehafo yohans
Enkab zeleኹwo kigsgs bihayli

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 3
Gobez redetka nisgwmey yesali nebiye liul
Ab maekel aelafat aletat nay midri
Bizeyts’mlu aኽlil ninefsey ket’ri ametatey barኽ
Arku lemerawi tisemey weanteni hits’an nebiye liul !

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 4
Abti das nits’hna kulu naalele
Senki kidan mera kab sebey keyfle yohans
Libsi t’us libi zesagr nab semay
Misti ts’egwri gemel felqwi sifeyeley nebiye liul

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 5
Ab maekel aelafat aletat nay midri
Bizeyts’mlu aኽlil ninefsey ket’ri ametatey barኽ
Weanteni hits’an nebiye liul
Arku lemerawi tisemey tisemey nebiye liul !

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 6
Seat mis aኸle mimts’ae nay merawi
Mis zeberh qendel mihretu kits’ewi yohans
Tibruኽ menfesu nefsey kimarኻ
Zemen fire gerka ametey barka nebiye liul

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans

VERSE 7
Ab maekel aelafat aletat nay midri
Bizeyts’mlu aኽlil ninefsey ket’ri ametatey barኽ
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul (2)

CHORUS
Weanteni hits’an nebiye liul (2)
Arku lemerawi tisemey tisemey nebiye liul
Ts’eragi megedi mihret deqi adam
Emun arki riesi neti genshel alem yohans'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-tewahdo-mezmur-4139', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: ERITREAN ORTHODOX TEWAHDO MEZMUR (eritrean-orthodox-tewahdo-mezmur-4179)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ጣዕሚ ተስፋ ሕይወተይ መዓር ወይኒ ዘለላ
ኣደ ጐይታይ ድንግል ምሳይ ኩኒ ሓደራ
ኣረጊት ሰብነት ኮይንዎ ኣብቂዑ
ተፈንፊኑ ይበሃል ኣኺሉ ጊዜኡ

VERSE 1
ግን ዓይኒ የቋምት ልቢ’ውን ይምነ
መይመይ ይብል ኣሎ እንታይ ከምዝኣመነ
መኒነ ኣይኮንኩን’ድየ ውሽጣዊ ምስጢሩ
ሕሉፍ ናብራ ሥጋ ሎሚ ምሒር ተዘኪሩ

VERSE 2
ምሉእ ክኾነለይ ፍጹም ንኽባተኽ
ድንግል ሓግዝኒ ሎሚ ርእሰይ ንኽሓክኽ
ሓቒቕ ማይ ኣብ ቅድመይ ነፍሰይ ትነጽሃሉ
ኣእምሮይ ግን ወይከ ክልብም ከመይ’ሉ

VERSE 3
ርስሓት ሕይወተይ ንቡር እንተበልክዎ
ብዘይ ምሕጻበይ ግን ኵሉ ገሪምዎ
ይፈልጦ እንድየ ጐይታይ ሓዳግ’ዩ መሓሪ
ሕዙናት ናይ መንፈስ ንብዓት ካብ ገጾም ዝኣሊ

VERSE 4
ሓዘነይ ክቕንጠጥ ኮታ ንኽድበስ
ኢድኪ ዘርግሕለይ ፍጹም ልበይ ንኽጠዓስ
በረኸቱ ርእየ ኣብ ዘመን ሕይወተይ
ኣቦ ምሕረት ፍቕሪ ገጹ ክመልሰለይ

VERSE 5
ክንደይ’ውን ሓሊፈ ክፉእ ሕሰም ናብራ
ኵሉ ሰጊረዮ ናይ ጉዕዞይ መከራ
ዘይታኸስ ጓሳ ሕያዋይ ሳምራዊ
ወትሩ ምሳይ እዩ ኣምላኽ ናይ ነፍሰይ ሓላዊ

VERSE 6
እንታይ ኮይነ ኢለ ድኣ ዘይነብር ቀሲነ
ብምስጋና ሕይወት ድንግል ጸሎትኪ ኣሚነ
ደረት ኣልቦ ፍቕሩ ማንም ዘይልክዖ
ዕረ መዝባ ጽዋእ ክሰቲ ዘብጽሖ

VERSE 7
ኵሉ ዝገበሮ ስለይ መከረኛ
ኣበይ እሞ ኢለዮ ክቡር ውርደተኛ
ፍቕሩ ተሰኪመ ኣምላኻዊ ሕጊ
መሊአ ብሓጎስ ደስታ ሰማያዊ ባህጊ

VERSE 8
ጉዕዞይ ክሰምረለይ ክሳብ መፈጸምታ
ሳልይኒ ድንግል ድንግል ኣደ ጐይታ',
      lyrics_transliteration = 'T’aemi tesfa hiywetey mear weyni zelela
Ade gweytay Dingil misay kuni hadera
Aregit sebnet koynwo abqiu
Tefenfinu yibehal aኺlu gizeu

VERSE 1
Gin ayni yeqwamt libi’wn yimne
Meymey yibl alo entay kemzamene
Menine aykonkun’dye wisht’awi mist’iru
Hiluf nabra siga lomi mihir tezekiru

VERSE 2
Milue kiኾneley fits’um niኽbateኽ
Dingil hagzni lomi riesey niኽhakኽ
Haቒቕ may ab qidmey nefsey tinets’halu
Aemroy gin weyke kilbm kemey’lu

VERSE 3
Rishat hiywetey nibur entebelkwo
Bizey mihts’abey gin kwlu gerimwo
Yifelt’o endye gweytay hadag’yu mehari
Hizunat nay menfes nibat kab gets’om ziali

VERSE 4
Hazeney kiቕnt’et’ kota niኽdbes
Idki zerghley fits’um libey niኽt’eas
Bereኸtu rieye ab zemen hiywetey
Abo mihret fiቕri gets’u kimelseley

VERSE 5
Kindey’wn halife kifue hisem nabra
Kwlu segireyo nay guezoy mekera
Zeytaኸs gwasa hiyaway samrawi
Wetru misay eyu amlaኽ nay nefsey halawi

VERSE 6
Entay koyne ile dia zeynebr qesine
Bimsgana hiywet Dingil ts’elotki amine
Deret albo fiቕru manm zeylko
Ere mezba ts’wae kiseti zebts’ho

VERSE 7
Kwlu zigebero siley mekeregna
Abey emo ileyo kibur wirdetegna
Fiቕru tesekime amlaኻwi higi
Melia bihagos desta semayawi bahgi

VERSE 8
Guezoy kisemreley kisab mefets’emta
Salyni Dingil Dingil ade gweyta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-tewahdo-mezmur-4179'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጣዕሚ ተስፋ ሕይወተይ መዓር ወይኒ ዘለላ
ኣደ ጐይታይ ድንግል ምሳይ ኩኒ ሓደራ
ኣረጊት ሰብነት ኮይንዎ ኣብቂዑ
ተፈንፊኑ ይበሃል ኣኺሉ ጊዜኡ

VERSE 1
ግን ዓይኒ የቋምት ልቢ’ውን ይምነ
መይመይ ይብል ኣሎ እንታይ ከምዝኣመነ
መኒነ ኣይኮንኩን’ድየ ውሽጣዊ ምስጢሩ
ሕሉፍ ናብራ ሥጋ ሎሚ ምሒር ተዘኪሩ

CHORUS
ጣዕሚ ተስፋ ሕይወተይ መዓር ወይኒ ዘለላ
ኣደ ጐይታይ ድንግል ምሳይ ኩኒ ሓደራ
ኣረጊት ሰብነት ኮይንዎ ኣብቂዑ
ተፈንፊኑ ይበሃል ኣኺሉ ጊዜኡ

VERSE 2
ምሉእ ክኾነለይ ፍጹም ንኽባተኽ
ድንግል ሓግዝኒ ሎሚ ርእሰይ ንኽሓክኽ
ሓቒቕ ማይ ኣብ ቅድመይ ነፍሰይ ትነጽሃሉ
ኣእምሮይ ግን ወይከ ክልብም ከመይ’ሉ

CHORUS
ጣዕሚ ተስፋ ሕይወተይ መዓር ወይኒ ዘለላ
ኣደ ጐይታይ ድንግል ምሳይ ኩኒ ሓደራ
ኣረጊት ሰብነት ኮይንዎ ኣብቂዑ
ተፈንፊኑ ይበሃል ኣኺሉ ጊዜኡ

VERSE 3
ርስሓት ሕይወተይ ንቡር እንተበልክዎ
ብዘይ ምሕጻበይ ግን ኵሉ ገሪምዎ
ይፈልጦ እንድየ ጐይታይ ሓዳግ’ዩ መሓሪ
ሕዙናት ናይ መንፈስ ንብዓት ካብ ገጾም ዝኣሊ

CHORUS
ጣዕሚ ተስፋ ሕይወተይ መዓር ወይኒ ዘለላ
ኣደ ጐይታይ ድንግል ምሳይ ኩኒ ሓደራ
ኣረጊት ሰብነት ኮይንዎ ኣብቂዑ
ተፈንፊኑ ይበሃል ኣኺሉ ጊዜኡ

VERSE 4
ሓዘነይ ክቕንጠጥ ኮታ ንኽድበስ
ኢድኪ ዘርግሕለይ ፍጹም ልበይ ንኽጠዓስ
በረኸቱ ርእየ ኣብ ዘመን ሕይወተይ
ኣቦ ምሕረት ፍቕሪ ገጹ ክመልሰለይ

CHORUS
ጣዕሚ ተስፋ ሕይወተይ መዓር ወይኒ ዘለላ
ኣደ ጐይታይ ድንግል ምሳይ ኩኒ ሓደራ
ኣረጊት ሰብነት ኮይንዎ ኣብቂዑ
ተፈንፊኑ ይበሃል ኣኺሉ ጊዜኡ

VERSE 5
ክንደይ’ውን ሓሊፈ ክፉእ ሕሰም ናብራ
ኵሉ ሰጊረዮ ናይ ጉዕዞይ መከራ
ዘይታኸስ ጓሳ ሕያዋይ ሳምራዊ
ወትሩ ምሳይ እዩ ኣምላኽ ናይ ነፍሰይ ሓላዊ

CHORUS
ጣዕሚ ተስፋ ሕይወተይ መዓር ወይኒ ዘለላ
ኣደ ጐይታይ ድንግል ምሳይ ኩኒ ሓደራ
ኣረጊት ሰብነት ኮይንዎ ኣብቂዑ
ተፈንፊኑ ይበሃል ኣኺሉ ጊዜኡ

VERSE 6
እንታይ ኮይነ ኢለ ድኣ ዘይነብር ቀሲነ
ብምስጋና ሕይወት ድንግል ጸሎትኪ ኣሚነ
ደረት ኣልቦ ፍቕሩ ማንም ዘይልክዖ
ዕረ መዝባ ጽዋእ ክሰቲ ዘብጽሖ

CHORUS
ጣዕሚ ተስፋ ሕይወተይ መዓር ወይኒ ዘለላ
ኣደ ጐይታይ ድንግል ምሳይ ኩኒ ሓደራ
ኣረጊት ሰብነት ኮይንዎ ኣብቂዑ
ተፈንፊኑ ይበሃል ኣኺሉ ጊዜኡ

VERSE 7
ኵሉ ዝገበሮ ስለይ መከረኛ
ኣበይ እሞ ኢለዮ ክቡር ውርደተኛ
ፍቕሩ ተሰኪመ ኣምላኻዊ ሕጊ
መሊአ ብሓጎስ ደስታ ሰማያዊ ባህጊ

CHORUS
ጣዕሚ ተስፋ ሕይወተይ መዓር ወይኒ ዘለላ
ኣደ ጐይታይ ድንግል ምሳይ ኩኒ ሓደራ
ኣረጊት ሰብነት ኮይንዎ ኣብቂዑ
ተፈንፊኑ ይበሃል ኣኺሉ ጊዜኡ

VERSE 8
ጉዕዞይ ክሰምረለይ ክሳብ መፈጸምታ
ሳልይኒ ድንግል ድንግል ኣደ ጐይታ

CHORUS
ጣዕሚ ተስፋ ሕይወተይ መዓር ወይኒ ዘለላ
ኣደ ጐይታይ ድንግል ምሳይ ኩኒ ሓደራ
ኣረጊት ሰብነት ኮይንዎ ኣብቂዑ
ተፈንፊኑ ይበሃል ኣኺሉ ጊዜኡ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
T’aemi tesfa hiywetey mear weyni zelela
Ade gweytay Dingil misay kuni hadera
Aregit sebnet koynwo abqiu
Tefenfinu yibehal aኺlu gizeu

VERSE 1
Gin ayni yeqwamt libi’wn yimne
Meymey yibl alo entay kemzamene
Menine aykonkun’dye wisht’awi mist’iru
Hiluf nabra siga lomi mihir tezekiru

CHORUS
T’aemi tesfa hiywetey mear weyni zelela
Ade gweytay Dingil misay kuni hadera
Aregit sebnet koynwo abqiu
Tefenfinu yibehal aኺlu gizeu

VERSE 2
Milue kiኾneley fits’um niኽbateኽ
Dingil hagzni lomi riesey niኽhakኽ
Haቒቕ may ab qidmey nefsey tinets’halu
Aemroy gin weyke kilbm kemey’lu

CHORUS
T’aemi tesfa hiywetey mear weyni zelela
Ade gweytay Dingil misay kuni hadera
Aregit sebnet koynwo abqiu
Tefenfinu yibehal aኺlu gizeu

VERSE 3
Rishat hiywetey nibur entebelkwo
Bizey mihts’abey gin kwlu gerimwo
Yifelt’o endye gweytay hadag’yu mehari
Hizunat nay menfes nibat kab gets’om ziali

CHORUS
T’aemi tesfa hiywetey mear weyni zelela
Ade gweytay Dingil misay kuni hadera
Aregit sebnet koynwo abqiu
Tefenfinu yibehal aኺlu gizeu

VERSE 4
Hazeney kiቕnt’et’ kota niኽdbes
Idki zerghley fits’um libey niኽt’eas
Bereኸtu rieye ab zemen hiywetey
Abo mihret fiቕri gets’u kimelseley

CHORUS
T’aemi tesfa hiywetey mear weyni zelela
Ade gweytay Dingil misay kuni hadera
Aregit sebnet koynwo abqiu
Tefenfinu yibehal aኺlu gizeu

VERSE 5
Kindey’wn halife kifue hisem nabra
Kwlu segireyo nay guezoy mekera
Zeytaኸs gwasa hiyaway samrawi
Wetru misay eyu amlaኽ nay nefsey halawi

CHORUS
T’aemi tesfa hiywetey mear weyni zelela
Ade gweytay Dingil misay kuni hadera
Aregit sebnet koynwo abqiu
Tefenfinu yibehal aኺlu gizeu

VERSE 6
Entay koyne ile dia zeynebr qesine
Bimsgana hiywet Dingil ts’elotki amine
Deret albo fiቕru manm zeylko
Ere mezba ts’wae kiseti zebts’ho

CHORUS
T’aemi tesfa hiywetey mear weyni zelela
Ade gweytay Dingil misay kuni hadera
Aregit sebnet koynwo abqiu
Tefenfinu yibehal aኺlu gizeu

VERSE 7
Kwlu zigebero siley mekeregna
Abey emo ileyo kibur wirdetegna
Fiቕru tesekime amlaኻwi higi
Melia bihagos desta semayawi bahgi

CHORUS
T’aemi tesfa hiywetey mear weyni zelela
Ade gweytay Dingil misay kuni hadera
Aregit sebnet koynwo abqiu
Tefenfinu yibehal aኺlu gizeu

VERSE 8
Guezoy kisemreley kisab mefets’emta
Salyni Dingil Dingil ade gweyta

CHORUS
T’aemi tesfa hiywetey mear weyni zelela
Ade gweytay Dingil misay kuni hadera
Aregit sebnet koynwo abqiu
Tefenfinu yibehal aኺlu gizeu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-tewahdo-mezmur-4179', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eritrean Orthodox tewahdo mezmur bij d.msgna ata nebsey tnafkeka (eritrean-orthodox-tewahdo-mezmur-bij-d-msgna-ata-nebsey-tnafkeka)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 1
1)ናብራ ቅድስና ድሕረት ቆጺረዮ
ድምጺ ጻዊዒትካ ኣበይ ሰሚዐዮ
ናይ መስቀል ፍቕርካ ኩሉ ጠሊመዮ
ምሕረት ግበረለይ ንገበነይ ውን እለዮ

VERSE 2
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
2) ፈቐዶ ክኹብልል ግዜ ምስ ሓለፈ
ምስ ከንቱ ትምኒታት ክጐይይ ተሰኒፈ
ካባኻ ሪሒቐ ኣበይ ጢዒሙኒ

VERSE 3
ናፊቓላ ነፍሰይ ናብ ደንበኻ ምለሰኒ
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
3)ናብራ ቤት ኣቡኣ ነብሰይ ናፊቓቶ
እቲ ማሙቕ ሕቑፍኻ ኩሉ ዘኪራቶ

VERSE 4
ፍትውተይ እንዳበልካ ካብ ኣኽራን ምፃያ
ንጎደና ሂወት ብቃላትካ ከተርእያ
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
4) ናይ ዝኽሪ መስቀልካ ብመንፈስ ከምርሕ

VERSE 5
ምሳኻ ኣብ ቀራንዮ ድኻነይ ክሰርሕ
ኽጎይይ ድሕረኻ ስሓበኒ ጎይታ
ኣሜን ሃሌ ሉያ ናፍቆተይ ማራናታ
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ',
      lyrics_transliteration = 'Az: ata nebsey tinafqeka kemay tits’emaka
Abey tewelen eten megwaseኻ
Kimets’e keerf kiኸwn begieka
Zelalem kiseb aser sigumtatka

VERSE 1
1)nabra qidsna dihret qots’ireyo
Dimts’i ts’awiitka abey semiayo
Nay mesqel fiቕrka kulu t’elimeyo
Mihret gibereley nigebeney win eleyo

VERSE 2
Az: ata nebsey tinafqeka kemay tits’emaka
2) feቐdo kiኹbll gize mis halefe
Mis kentu timnitat kigweyy tesenife
Kabaኻ rihiቐ abey t’iimuni

VERSE 3
Nafiቓla nefsey nab denbeኻ mileseni
Az: ata nebsey tinafqeka kemay tits’emaka
3)nabra bet abua nebsey nafiቓto
Eti mamuቕ hiቑfኻ kulu zekirato

VERSE 4
Fitwtey endabelka kab aኽran mits’aya
Nigodena hiwet biqalatka ketereya
Az: ata nebsey tinafqeka kemay tits’emaka
4) nay ziኽri mesqelka bimenfes kemrh

VERSE 5
Misaኻ ab qeranyo diኻney kiserh
ኽgoyy dihreኻ sihabeni goyta
Amen Halleluya nafqotey maranata
Az: ata nebsey tinafqeka kemay tits’emaka',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-tewahdo-mezmur-bij-d-msgna-ata-nebsey-tnafkeka'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 1
1)ናብራ ቅድስና ድሕረት ቆጺረዮ
ድምጺ ጻዊዒትካ ኣበይ ሰሚዐዮ
ናይ መስቀል ፍቕርካ ኩሉ ጠሊመዮ
ምሕረት ግበረለይ ንገበነይ ውን እለዮ

CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 2
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
2) ፈቐዶ ክኹብልል ግዜ ምስ ሓለፈ
ምስ ከንቱ ትምኒታት ክጐይይ ተሰኒፈ
ካባኻ ሪሒቐ ኣበይ ጢዒሙኒ

CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 3
ናፊቓላ ነፍሰይ ናብ ደንበኻ ምለሰኒ
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
3)ናብራ ቤት ኣቡኣ ነብሰይ ናፊቓቶ
እቲ ማሙቕ ሕቑፍኻ ኩሉ ዘኪራቶ

CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 4
ፍትውተይ እንዳበልካ ካብ ኣኽራን ምፃያ
ንጎደና ሂወት ብቃላትካ ከተርእያ
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
4) ናይ ዝኽሪ መስቀልካ ብመንፈስ ከምርሕ

CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ

VERSE 5
ምሳኻ ኣብ ቀራንዮ ድኻነይ ክሰርሕ
ኽጎይይ ድሕረኻ ስሓበኒ ጎይታ
ኣሜን ሃሌ ሉያ ናፍቆተይ ማራናታ
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ

CHORUS
ኣዝ፥ ኣታ ነብሰይ ትናፍቀካ ከማይ ትጸምኣካ
ኣበይ ተውዕለን እተን መጓሰኻ
ክመጽእ ከዕርፍ ክኸውን በጊዕካ
ዘልዓለም ክስዕብ ኣሰር ስጉምታትካ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Az: ata nebsey tinafqeka kemay tits’emaka
Abey tewelen eten megwaseኻ
Kimets’e keerf kiኸwn begieka
Zelalem kiseb aser sigumtatka

VERSE 1
1)nabra qidsna dihret qots’ireyo
Dimts’i ts’awiitka abey semiayo
Nay mesqel fiቕrka kulu t’elimeyo
Mihret gibereley nigebeney win eleyo

CHORUS
Az: ata nebsey tinafqeka kemay tits’emaka
Abey tewelen eten megwaseኻ
Kimets’e keerf kiኸwn begieka
Zelalem kiseb aser sigumtatka

VERSE 2
Az: ata nebsey tinafqeka kemay tits’emaka
2) feቐdo kiኹbll gize mis halefe
Mis kentu timnitat kigweyy tesenife
Kabaኻ rihiቐ abey t’iimuni

CHORUS
Az: ata nebsey tinafqeka kemay tits’emaka
Abey tewelen eten megwaseኻ
Kimets’e keerf kiኸwn begieka
Zelalem kiseb aser sigumtatka

VERSE 3
Nafiቓla nefsey nab denbeኻ mileseni
Az: ata nebsey tinafqeka kemay tits’emaka
3)nabra bet abua nebsey nafiቓto
Eti mamuቕ hiቑfኻ kulu zekirato

CHORUS
Az: ata nebsey tinafqeka kemay tits’emaka
Abey tewelen eten megwaseኻ
Kimets’e keerf kiኸwn begieka
Zelalem kiseb aser sigumtatka

VERSE 4
Fitwtey endabelka kab aኽran mits’aya
Nigodena hiwet biqalatka ketereya
Az: ata nebsey tinafqeka kemay tits’emaka
4) nay ziኽri mesqelka bimenfes kemrh

CHORUS
Az: ata nebsey tinafqeka kemay tits’emaka
Abey tewelen eten megwaseኻ
Kimets’e keerf kiኸwn begieka
Zelalem kiseb aser sigumtatka

VERSE 5
Misaኻ ab qeranyo diኻney kiserh
ኽgoyy dihreኻ sihabeni goyta
Amen Halleluya nafqotey maranata
Az: ata nebsey tinafqeka kemay tits’emaka

CHORUS
Az: ata nebsey tinafqeka kemay tits’emaka
Abey tewelen eten megwaseኻ
Kimets’e keerf kiኸwn begieka
Zelalem kiseb aser sigumtatka'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-tewahdo-mezmur-bij-d-msgna-ata-nebsey-tnafkeka', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eritrean Orthodox Tewahdo Mezmur By Bereket Tikue endegena gesera (eritrean-orthodox-tewahdo-mezmur-by-bereket-tikue-endegena-gesera)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 1
ዕለት ዕለት ዕብየት ዘይብሉ ውሉድነት
ብኣፍ ጥራይ እንተኾይኑ ጐይታ ጐይታ ማለት
ብጽድቅኻ ጸዲቐ ፍረ ካብ ዘይብለይናይ
ኣፍ ኣማኒየ ከንቱያ ህይወተይ

VERSE 2
ኣብቶም ኣህዛብ ከማን ዘየለ ልማድ
ካብ ተቖጻጸረኒ እቲ ናይ ስጋ ፍቓድ
ንዓኻ እንዳ ኣጽረፍኩ ምንባር ይእከል በቃ
ብቓልካ ኣርመኒ ስርሓኒ ደጊምካ

VERSE 3
እንደገና ህይወተይ ለውጦ
እንደገና ንናብራይ ቀይሮ
እንደገና ኣንጺህካ ሕጸበኒ
እንደገና ወደየ በለኒ

VERSE 4
ኣበሎ ፍርሓተይ
ዕብየትካ ኣይብጻሕ ፍጹም ኣይትልመድ
እንተ መሓርካንስ ኮይኑኒ ምልማድ
ከምቲ እኳ ፈለማ ዝነበረኒ ትግሃት

VERSE 5
ምለሰለይ ኣቦ ከይጠፍእ ብትዕቢት
ካብ ፍጥረታት ኲሉ ተዘይሓሸ ግብረይ
እቲ ካልኣይ ልደት ኣበይ''ሎ ምድሓነይ
ሸኽሚ ዝኾነኒ ንዓ ቁረጸለይ

VERSE 6
ንኽብርኻ ይኹን እዚ ክርስትናይ
እንደገና ኣበይ ኣሎ ፍርሃተይ
ኣብ ገዛይ በዳሊ ቅድሚ ሰብ ጸሎተኛ ል
ናይ ኣደባባይ ጭዋ ውሻጠይ ነውረኛ

VERSE 7
ርእሰይ እናጠበርኩ ምንባር ሰልኪኒዩ
ብጸጋ ለውጠኒ ሓይለይ ደኺሙዩ
ካብ ፈሪሳውነት ተዘይሓሸ እምነተይ
ባዶነት ካብ መልኦ ስብከተይ ጸሎተይ

VERSE 8
ጉዑዞይ ንኽሰምር ከቕንዕ ናባኻ
ቅድሚ መስዋእተይ መሓረኒ ደጊምካ',
      lyrics_transliteration = 'Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 1
Elet elet ebyet zeyblu wiludnet
Biaf t’ray enteኾynu gweyta gweyta malet
Bits’dqኻ ts’ediቐ fire kab zeybleynay
Af amaniye kentuya hiywetey

VERSE 2
Abtom ahzab keman zeyele limad
Kab teቖts’ats’ereni eti nay siga fiቓd
Niaኻ enda ats’refku minbar yiekel beqa
Biቓlka armeni sirhani degimka

VERSE 3
Endegena hiywetey lewt’o
Endegena ninabray qeyro
Endegena ants’ihka hits’ebeni
Endegena wedeye beleni

VERSE 4
Abelo firhatey
Ebyetka aybts’ah fits’um aytlmed
Ente meharkans koynuni milmad
Kemti ekwa felema zinebereni tighat

VERSE 5
Mileseley abo keyt’efe bitebit
Kab fit’retat kwilu tezeyhashe gibrey
Eti kalay lidet abey''lo midhaney
Sheኽmi ziኾneni nia qurets’eley

VERSE 6
Niኽbrኻ yiኹn ezi kirstnay
Endegena abey alo firhatey
Ab gezay bedali qidmi seb ts’elotegna l
Nay adebabay ch’wa wishat’ey newregna

VERSE 7
Riesey enat’eberku minbar selkiniyu
Bits’ega lewt’eni hayley deኺmuyu
Kab ferisawnet tezeyhashe emnetey
Badonet kab melo sibketey ts’elotey

VERSE 8
Guuzoy niኽsemr keቕne nabaኻ
Qidmi meswaetey mehareni degimka',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-tewahdo-mezmur-by-bereket-tikue-endegena-gesera'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 1
ዕለት ዕለት ዕብየት ዘይብሉ ውሉድነት
ብኣፍ ጥራይ እንተኾይኑ ጐይታ ጐይታ ማለት
ብጽድቅኻ ጸዲቐ ፍረ ካብ ዘይብለይናይ
ኣፍ ኣማኒየ ከንቱያ ህይወተይ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 2
ኣብቶም ኣህዛብ ከማን ዘየለ ልማድ
ካብ ተቖጻጸረኒ እቲ ናይ ስጋ ፍቓድ
ንዓኻ እንዳ ኣጽረፍኩ ምንባር ይእከል በቃ
ብቓልካ ኣርመኒ ስርሓኒ ደጊምካ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 3
እንደገና ህይወተይ ለውጦ
እንደገና ንናብራይ ቀይሮ
እንደገና ኣንጺህካ ሕጸበኒ
እንደገና ወደየ በለኒ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 4
ኣበሎ ፍርሓተይ
ዕብየትካ ኣይብጻሕ ፍጹም ኣይትልመድ
እንተ መሓርካንስ ኮይኑኒ ምልማድ
ከምቲ እኳ ፈለማ ዝነበረኒ ትግሃት

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 5
ምለሰለይ ኣቦ ከይጠፍእ ብትዕቢት
ካብ ፍጥረታት ኲሉ ተዘይሓሸ ግብረይ
እቲ ካልኣይ ልደት ኣበይ''ሎ ምድሓነይ
ሸኽሚ ዝኾነኒ ንዓ ቁረጸለይ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 6
ንኽብርኻ ይኹን እዚ ክርስትናይ
እንደገና ኣበይ ኣሎ ፍርሃተይ
ኣብ ገዛይ በዳሊ ቅድሚ ሰብ ጸሎተኛ ል
ናይ ኣደባባይ ጭዋ ውሻጠይ ነውረኛ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 7
ርእሰይ እናጠበርኩ ምንባር ሰልኪኒዩ
ብጸጋ ለውጠኒ ሓይለይ ደኺሙዩ
ካብ ፈሪሳውነት ተዘይሓሸ እምነተይ
ባዶነት ካብ መልኦ ስብከተይ ጸሎተይ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ

VERSE 8
ጉዑዞይ ንኽሰምር ከቕንዕ ናባኻ
ቅድሚ መስዋእተይ መሓረኒ ደጊምካ

CHORUS
ኣበይ''ሎ ፍርሓተይ ኣበይ''ሎ ኣኽብሮተይ
ምሕረትካ እንተ በዝሐስ ድፍረት ኣድሂቡለይ
ኣበይ''ሎ ትሕትናይ ኣበይ''ሎ ጸሎተይ
ከገልግል ብእምነት ከምታ ትማልየይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 1
Elet elet ebyet zeyblu wiludnet
Biaf t’ray enteኾynu gweyta gweyta malet
Bits’dqኻ ts’ediቐ fire kab zeybleynay
Af amaniye kentuya hiywetey

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 2
Abtom ahzab keman zeyele limad
Kab teቖts’ats’ereni eti nay siga fiቓd
Niaኻ enda ats’refku minbar yiekel beqa
Biቓlka armeni sirhani degimka

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 3
Endegena hiywetey lewt’o
Endegena ninabray qeyro
Endegena ants’ihka hits’ebeni
Endegena wedeye beleni

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 4
Abelo firhatey
Ebyetka aybts’ah fits’um aytlmed
Ente meharkans koynuni milmad
Kemti ekwa felema zinebereni tighat

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 5
Mileseley abo keyt’efe bitebit
Kab fit’retat kwilu tezeyhashe gibrey
Eti kalay lidet abey''lo midhaney
Sheኽmi ziኾneni nia qurets’eley

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 6
Niኽbrኻ yiኹn ezi kirstnay
Endegena abey alo firhatey
Ab gezay bedali qidmi seb ts’elotegna l
Nay adebabay ch’wa wishat’ey newregna

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 7
Riesey enat’eberku minbar selkiniyu
Bits’ega lewt’eni hayley deኺmuyu
Kab ferisawnet tezeyhashe emnetey
Badonet kab melo sibketey ts’elotey

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey

VERSE 8
Guuzoy niኽsemr keቕne nabaኻ
Qidmi meswaetey mehareni degimka

CHORUS
Abey''lo firhatey abey''lo aኽbrotey
Mihretka ente bezhes difret adhibuley
Abey''lo tihtnay abey''lo ts’elotey
Kegelgl biemnet kemta timalyey'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-tewahdo-mezmur-by-bereket-tikue-endegena-gesera', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eritrean Orthodox Tewahdo Mezmur kem ntfue wedi Bereket Tikue Gesera (eritrean-orthodox-tewahdo-mezmur-kem-ntfue-wedi-bereket-tikue-gesera)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 1
ዘይከም ቁመት ዘኬዎስ ዝሓጸሮ ልቢ
ተጋዊ እንድየ ኔረ ዘይናቱ ኣካቢ
ብፍጹም ትሕትና ቃላትካ ከይስከም
ኣብ ሳግላ ትዕቢተይ ሓዂረ ክትዕነን

VERSE 2
ትሪ ልበይ ሴርካ ከፊትካ ንዓይነይ
ቤተይ ምስ ባረኽካ ርኤካ መድሕነይ
ይትረፍ ኣነ ህያው ዝዛረብ ብልሳን
ሰማይ ኣንቃዕሪራ ዑፍ''ኳ ትምስክር

VERSE 3
ለቆታ ከብደይ ግን ተመስገን ደረታ
ብሰሪ ስስዕቲ ንሕግኻ እስሕታ
ሰላመይ ክትመስል ንሓጢኣት ከርዲና
ሓይሊ ኢድ ምሕረትካ ውሉድካ ኣድሒና

VERSE 4
ከም ጥጦስ ኣይኮንኩን ክብርኻ ዝመስከረ
ከም ጴጥሮስ ኣይኮንኩን ንስሓ ዘክበረ
ንሳቶም ብግብሮም ክስመዩ ጻድቃን
ነዓይ ንሓጥእ ግን ግብሪ ኣይነበረንን

VERSE 5
ምሕረትካ ዓዚዙ ሂብካኒ ይቅሬታ
ምስጋና ይብጻሕካ ናይ ሰራዊት ጎይታ
በሊሕ ብምርጋጸይ ነፍሰይ ከምትጉዳእ
ኣየናይ''ላቶ ልበይ ንቃልካ ክትርዳእ

VERSE 6
ፈቃር ኣምላኸይ ግን እንታይ ይሰኣነካ
ብግሊ ግሌኻ ንርእሰይ ጎልቢብካ
ብዝርጉሕ ቅልጽምካ መሊስካኒ ክብሪ
ክርስቶስ ተመስገን ለዋህ ኣቦ ፍቅሪ',
      lyrics_transliteration = 'Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey

VERSE 1
Zeykem qumet zekewos zihats’ero libi
Tegawi endye nere zeynatu akabi
Bifts’um tihtna qalatka keyskem
Ab sagla tiebitey hakhwire kitenen

VERSE 2
Tiri libey serka kefitka niayney
Betey mis bareኽka rieka medhney
Yitref ane hiyaw zizareb bilsan
Semay anqaerira uf''kwa timskr

VERSE 3
Leqota kebdey gin temesgen dereta
Biseri siseti nihgኻ eshta
Selamey kitmesl nihat’iat kerdina
Hayli id mihretka wiludka adhina

VERSE 4
Kem t’t’os aykonkun kibrኻ zimeskere
Kem p’et’ros aykonkun nisha zekbere
Nisatom bigbrom kismeyu ts’adqan
Neay nihat’e gin gibri ayneberenn

VERSE 5
Mihretka azizu hibkani yiqreta
Misgana yibts’ahka nay serawit goyta
Belih bimrgats’ey nefsey kemtgudae
Ayenay''lato libey niqalka kitrdae

VERSE 6
Feqar amlaኸy gin entay yiseaneka
Bigli gileኻ niresey golbibka
Bizrguh qilts’mka meliskani kibri
Kristos temesgen lewah abo fiqri',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-tewahdo-mezmur-kem-ntfue-wedi-bereket-tikue-gesera'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 1
ዘይከም ቁመት ዘኬዎስ ዝሓጸሮ ልቢ
ተጋዊ እንድየ ኔረ ዘይናቱ ኣካቢ
ብፍጹም ትሕትና ቃላትካ ከይስከም
ኣብ ሳግላ ትዕቢተይ ሓዂረ ክትዕነን

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 2
ትሪ ልበይ ሴርካ ከፊትካ ንዓይነይ
ቤተይ ምስ ባረኽካ ርኤካ መድሕነይ
ይትረፍ ኣነ ህያው ዝዛረብ ብልሳን
ሰማይ ኣንቃዕሪራ ዑፍ''ኳ ትምስክር

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 3
ለቆታ ከብደይ ግን ተመስገን ደረታ
ብሰሪ ስስዕቲ ንሕግኻ እስሕታ
ሰላመይ ክትመስል ንሓጢኣት ከርዲና
ሓይሊ ኢድ ምሕረትካ ውሉድካ ኣድሒና

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 4
ከም ጥጦስ ኣይኮንኩን ክብርኻ ዝመስከረ
ከም ጴጥሮስ ኣይኮንኩን ንስሓ ዘክበረ
ንሳቶም ብግብሮም ክስመዩ ጻድቃን
ነዓይ ንሓጥእ ግን ግብሪ ኣይነበረንን

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 5
ምሕረትካ ዓዚዙ ሂብካኒ ይቅሬታ
ምስጋና ይብጻሕካ ናይ ሰራዊት ጎይታ
በሊሕ ብምርጋጸይ ነፍሰይ ከምትጉዳእ
ኣየናይ''ላቶ ልበይ ንቃልካ ክትርዳእ

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ

VERSE 6
ፈቃር ኣምላኸይ ግን እንታይ ይሰኣነካ
ብግሊ ግሌኻ ንርእሰይ ጎልቢብካ
ብዝርጉሕ ቅልጽምካ መሊስካኒ ክብሪ
ክርስቶስ ተመስገን ለዋህ ኣቦ ፍቅሪ

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍአይ መሊስካ ምድሓንካ ርኤዮ
ታሪኸይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ ክበር ብመዝሙረይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey

VERSE 1
Zeykem qumet zekewos zihats’ero libi
Tegawi endye nere zeynatu akabi
Bifts’um tihtna qalatka keyskem
Ab sagla tiebitey hakhwire kitenen

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey

VERSE 2
Tiri libey serka kefitka niayney
Betey mis bareኽka rieka medhney
Yitref ane hiyaw zizareb bilsan
Semay anqaerira uf''kwa timskr

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey

VERSE 3
Leqota kebdey gin temesgen dereta
Biseri siseti nihgኻ eshta
Selamey kitmesl nihat’iat kerdina
Hayli id mihretka wiludka adhina

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey

VERSE 4
Kem t’t’os aykonkun kibrኻ zimeskere
Kem p’et’ros aykonkun nisha zekbere
Nisatom bigbrom kismeyu ts’adqan
Neay nihat’e gin gibri ayneberenn

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey

VERSE 5
Mihretka azizu hibkani yiqreta
Misgana yibts’ahka nay serawit goyta
Belih bimrgats’ey nefsey kemtgudae
Ayenay''lato libey niqalka kitrdae

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey

VERSE 6
Feqar amlaኸy gin entay yiseaneka
Bigli gileኻ niresey golbibka
Bizrguh qilts’mka meliskani kibri
Kristos temesgen lewah abo fiqri

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fay meliska midhanka rieyo
Tariኸy qeyrka meliskani kibrey
Amlak senayatey kiber bimezmurey'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-tewahdo-mezmur-kem-ntfue-wedi-bereket-tikue-gesera', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: eritrean orthodox tewahdo mezmur/ /Tekebel Meswaetey (eritrean-orthodox-tewahdo-mezmur-tekebel-meswaetey)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 1
ፍረ ከናፍረይ ተቐበል ወስዋእተይ
ተስፋይ ኣባኻ እምበር ኣብ ኢድ ሰብ ኣይኮነን
እምነተይ ኣባኻ ፈጺሙ ኣይውዳእን
ዕጽው እንተመሰh ደገታት ዕድhይ

VERSE 2
ይኣምን እየ ኣነስ ከምዘhኻ ምሳይ/2/
+
ንሰብ ዘይከኣል ቀሊል''ዩ ንዓኻ
ንኹሉ ትመልኽ ጎይታ ፍሉይ ኢኻ

VERSE 3
ንስኻ ክትከፍት ከ መን ኣሎ ዓጻዊ
ተስፋ ሓጥእ ነፍሰይ ሕያዋይ ሳምራዊ/2/
+ +
ጌርካhይ ኢኻ''ሞ ከመስግነካዬ

VERSE 4
ኣፍቂርካኒ ኢኻ''ሞ ከምልኸካ እዬ
ንኽብሪ ዕቤትካ በገናይ ኣhዒh
ክዝምረልካዬ ድምጸይ ክብ ኣቢለ/2/
ሓhፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑለይ

VERSE 5
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ሎ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ
ፍረ ከናፍረይ ተቐበል መስዋእተይ',
      lyrics_transliteration = 'Halifeyoye maebelat hiywetey selamka bezihuhy
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''kwe mo libey
Enho ellta enho misganay

VERSE 1
Fire kenafrey teቐbel weswaetey
Tesfay abaኻ ember ab id seb aykonen
Emnetey abaኻ fets’imu aywdaen
Ets’w entemeseh degetat edhy

VERSE 2
Yiamn eye anes kemzehኻ misay (2)
+
Niseb zeykeal qelil''yu niaኻ
Niኹlu timelኽ goyta filuy iኻ

VERSE 3
Nisኻ kitkeft ke men alo ats’awi
Tesfa hat’e nefsey hiyaway samrawi (2)
+ +
Gerkahy iኻ''mo kemesgnekaye

VERSE 4
Afqirkani iኻ''mo kemlኸka eye
Niኽbri ebetka begenay ahih
Kizmrelkaye dimts’ey kib abile (2)
Hahfeyoye maebelat hiywetey selamka bezihuley

VERSE 5
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''lo mo libey
Enho ellta enho misganay
Fire kenafrey teቐbel meswaetey',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-orthodox-tewahdo-mezmur-tekebel-meswaetey'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 1
ፍረ ከናፍረይ ተቐበል ወስዋእተይ
ተስፋይ ኣባኻ እምበር ኣብ ኢድ ሰብ ኣይኮነን
እምነተይ ኣባኻ ፈጺሙ ኣይውዳእን
ዕጽው እንተመሰh ደገታት ዕድhይ

CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 2
ይኣምን እየ ኣነስ ከምዘhኻ ምሳይ/2/
+
ንሰብ ዘይከኣል ቀሊል''ዩ ንዓኻ
ንኹሉ ትመልኽ ጎይታ ፍሉይ ኢኻ

CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 3
ንስኻ ክትከፍት ከ መን ኣሎ ዓጻዊ
ተስፋ ሓጥእ ነፍሰይ ሕያዋይ ሳምራዊ/2/
+ +
ጌርካhይ ኢኻ''ሞ ከመስግነካዬ

CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 4
ኣፍቂርካኒ ኢኻ''ሞ ከምልኸካ እዬ
ንኽብሪ ዕቤትካ በገናይ ኣhዒh
ክዝምረልካዬ ድምጸይ ክብ ኣቢለ/2/
ሓhፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑለይ

CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ

VERSE 5
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ሎ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ
ፍረ ከናፍረይ ተቐበል መስዋእተይ

CHORUS
ሓሊፈዮዬ ማዕበላት ሕይወተይ ሰላምካ በዚሑhይ
እንታይ ኣሎ ዘይኮንካዮ ኢየሱስ ንዓይ
ክውድሰካ ፈትዩ''ኰ ሞ ልበይ
እንሆ ዕልልታ እንሆ ምስጋናይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Halifeyoye maebelat hiywetey selamka bezihuhy
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''kwe mo libey
Enho ellta enho misganay

VERSE 1
Fire kenafrey teቐbel weswaetey
Tesfay abaኻ ember ab id seb aykonen
Emnetey abaኻ fets’imu aywdaen
Ets’w entemeseh degetat edhy

CHORUS
Halifeyoye maebelat hiywetey selamka bezihuhy
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''kwe mo libey
Enho ellta enho misganay

VERSE 2
Yiamn eye anes kemzehኻ misay (2)
+
Niseb zeykeal qelil''yu niaኻ
Niኹlu timelኽ goyta filuy iኻ

CHORUS
Halifeyoye maebelat hiywetey selamka bezihuhy
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''kwe mo libey
Enho ellta enho misganay

VERSE 3
Nisኻ kitkeft ke men alo ats’awi
Tesfa hat’e nefsey hiyaway samrawi (2)
+ +
Gerkahy iኻ''mo kemesgnekaye

CHORUS
Halifeyoye maebelat hiywetey selamka bezihuhy
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''kwe mo libey
Enho ellta enho misganay

VERSE 4
Afqirkani iኻ''mo kemlኸka eye
Niኽbri ebetka begenay ahih
Kizmrelkaye dimts’ey kib abile (2)
Hahfeyoye maebelat hiywetey selamka bezihuley

CHORUS
Halifeyoye maebelat hiywetey selamka bezihuhy
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''kwe mo libey
Enho ellta enho misganay

VERSE 5
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''lo mo libey
Enho ellta enho misganay
Fire kenafrey teቐbel meswaetey

CHORUS
Halifeyoye maebelat hiywetey selamka bezihuhy
Entay alo zeykonkayo Iyesus niay
Kiwdseka fetyu''kwe mo libey
Enho ellta enho misganay'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-orthodox-tewahdo-mezmur-tekebel-meswaetey', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: eritrean tewahdo mezmur kabaka zterekbet (eritrean-tewahdo-mezmur-kabaka-zterekbet)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 1
ኣነ ዉን ጎይታይ ንመስቀልካ ጸይረ
ብዓቢ ሓጎስ ኣብ ቤትካ ከቢረ
እንታይ ውሬታ(3) ክንመልሰልካ ኢና ጎይታ
እንታይ ውሬታሞ እንታይ ውሬታ(2) ክንመልሰልካ ኢና ጎይታ

VERSE 2
ኣዝ
ብዝርጉሕ ቅልጽም እንተ ዘይሃነጽካ
ድኻም እዩ ጻዕረይ ከንቱ እየ ባርያኻ
ንዝፈርሑኻ ጥበብካ ትምህሮም

VERSE 3
ኣብ ማእከል ኣሕዛብ ብጸጋ ተንብሮም
እንታይ ውሬታ(3) ክንመልሰልካ ኢና ጎይታ
እንታይ ውሬታሞ እንታይ ውሬታ(2) ክንመልሰልካ ኢና ጎይታ
ኣዝ

VERSE 4
ተመጣጢረ ብፍቃድ ናይ ርእሰይ
ዓወት ስኢነ ተቆሪጹ ተስፋይ
ንስኻ ግና ንተስፋይ ቀጺልካ
ድሕሪ ደጊምሲ ይኹን ከምፍቃድካ

VERSE 5
እንታይ ውሬታ(3) ክንመልሰልካ ኢና ጎይታ
እንታይ ውሬታሞ እንታይ ውሬታ(2) ክንመልሰልካ ኢና ጎይታ',
      lyrics_transliteration = 'Kabaኻ zitereኽbet mealti hagos elet desta
Kinwdseka ina kinzmrelka melsi wieletatka
Eti bits’aeri binbat zihars
Endaetu hizu biellta yimles

VERSE 1
Ane wun goytay nimesqelka ts’eyre
Biabi hagos ab betka kebire
Entay wireta (3) kinmelselka ina goyta
Entay wiretamo entay wireta (2) kinmelselka ina goyta

VERSE 2
Az
Bizrguh qilts’m ente zeyhanets’ka
Diኻm eyu ts’aerey kentu eye baryaኻ
Nizferhuኻ t’bebka timhrom

VERSE 3
Ab maekel ahzab bits’ega tenbrom
Entay wireta (3) kinmelselka ina goyta
Entay wiretamo entay wireta (2) kinmelselka ina goyta
Az

VERSE 4
Temet’at’ire bifqad nay riesey
Awet siine teqorits’u tesfay
Nisኻ gina nitesfay qets’ilka
Dihri degimsi yiኹn kemfqadka

VERSE 5
Entay wireta (3) kinmelselka ina goyta
Entay wiretamo entay wireta (2) kinmelselka ina goyta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eritrean-tewahdo-mezmur-kabaka-zterekbet'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 1
ኣነ ዉን ጎይታይ ንመስቀልካ ጸይረ
ብዓቢ ሓጎስ ኣብ ቤትካ ከቢረ
እንታይ ውሬታ(3) ክንመልሰልካ ኢና ጎይታ
እንታይ ውሬታሞ እንታይ ውሬታ(2) ክንመልሰልካ ኢና ጎይታ

CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 2
ኣዝ
ብዝርጉሕ ቅልጽም እንተ ዘይሃነጽካ
ድኻም እዩ ጻዕረይ ከንቱ እየ ባርያኻ
ንዝፈርሑኻ ጥበብካ ትምህሮም

CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 3
ኣብ ማእከል ኣሕዛብ ብጸጋ ተንብሮም
እንታይ ውሬታ(3) ክንመልሰልካ ኢና ጎይታ
እንታይ ውሬታሞ እንታይ ውሬታ(2) ክንመልሰልካ ኢና ጎይታ
ኣዝ

CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 4
ተመጣጢረ ብፍቃድ ናይ ርእሰይ
ዓወት ስኢነ ተቆሪጹ ተስፋይ
ንስኻ ግና ንተስፋይ ቀጺልካ
ድሕሪ ደጊምሲ ይኹን ከምፍቃድካ

CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 5
እንታይ ውሬታ(3) ክንመልሰልካ ኢና ጎይታ
እንታይ ውሬታሞ እንታይ ውሬታ(2) ክንመልሰልካ ኢና ጎይታ

CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kabaኻ zitereኽbet mealti hagos elet desta
Kinwdseka ina kinzmrelka melsi wieletatka
Eti bits’aeri binbat zihars
Endaetu hizu biellta yimles

VERSE 1
Ane wun goytay nimesqelka ts’eyre
Biabi hagos ab betka kebire
Entay wireta (3) kinmelselka ina goyta
Entay wiretamo entay wireta (2) kinmelselka ina goyta

CHORUS
Kabaኻ zitereኽbet mealti hagos elet desta
Kinwdseka ina kinzmrelka melsi wieletatka
Eti bits’aeri binbat zihars
Endaetu hizu biellta yimles

VERSE 2
Az
Bizrguh qilts’m ente zeyhanets’ka
Diኻm eyu ts’aerey kentu eye baryaኻ
Nizferhuኻ t’bebka timhrom

CHORUS
Kabaኻ zitereኽbet mealti hagos elet desta
Kinwdseka ina kinzmrelka melsi wieletatka
Eti bits’aeri binbat zihars
Endaetu hizu biellta yimles

VERSE 3
Ab maekel ahzab bits’ega tenbrom
Entay wireta (3) kinmelselka ina goyta
Entay wiretamo entay wireta (2) kinmelselka ina goyta
Az

CHORUS
Kabaኻ zitereኽbet mealti hagos elet desta
Kinwdseka ina kinzmrelka melsi wieletatka
Eti bits’aeri binbat zihars
Endaetu hizu biellta yimles

VERSE 4
Temet’at’ire bifqad nay riesey
Awet siine teqorits’u tesfay
Nisኻ gina nitesfay qets’ilka
Dihri degimsi yiኹn kemfqadka

CHORUS
Kabaኻ zitereኽbet mealti hagos elet desta
Kinwdseka ina kinzmrelka melsi wieletatka
Eti bits’aeri binbat zihars
Endaetu hizu biellta yimles

VERSE 5
Entay wireta (3) kinmelselka ina goyta
Entay wiretamo entay wireta (2) kinmelselka ina goyta

CHORUS
Kabaኻ zitereኽbet mealti hagos elet desta
Kinwdseka ina kinzmrelka melsi wieletatka
Eti bits’aeri binbat zihars
Endaetu hizu biellta yimles'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eritrean-tewahdo-mezmur-kabaka-zterekbet', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ermias Haylay (ermias-haylay)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 1
ዘመናይ ማለት ኋላ ቀር፥
እያለ መጣፍ ሲናገር፥
ልብ ያለ ልብ ፥ ሰሚ ጆሮ፥
መች ነበር ድሮ ፣ ዘንድሮ?

VERSE 2
ሺህ ዓመት ለእሱ እንደ ትናንት፥
ዝንተ ዓለም እንደ አንዲት ትጋት፥
ቸር ሆኖ የእድሜን ብርሃናት፥
ሲያቀዳጀን ዳግም ዘመን፥

VERSE 3
ምሥራቁን እንይ አሻግረን፥
ጽልመትን በፀዳል ሽረን፥
እንገሥግሥ በእግረ ልቡና፥
ከአድማስ ጥግ የዋኖች መዲና።

VERSE 4
እንኪያ እንሂድ ከጥንት መንደር፥
ለመሥገር እስኪ እንንደርደር፥
እንሁን ተላዌ አሠር፥
ለተሰማበት ፣ የደስታ አውታር፥

VERSE 5
“የቀድሞዋን መንገድ እዩ፥”
እንዳለ ኤርምያስ ነቢዩ፥
ከዳዊት ፣ ከቆሬ ፣ ከአሣፍ፥
እንድረስ ከኤማን በራፍ።',
      lyrics_transliteration = 'Yesew zemenu : ende sar:
Fet’no derqo lekbr , lehasar:
Yesew edmew ende t’la:
Yemit’efa ‘miqer hwala:

VERSE 1
Zemenay malet hwala qer:
Eyale met’af sinager:
Lib yale lib : semi joro:
Mech neber diro , zendro?

VERSE 2
Shih amet leesu ende tinant:
Zinte alem ende andit tigat:
Cher hono yeedmen birhanat:
Siyaqedajen dagm zemen:

VERSE 3
Misraqun eny ashagren:
Ts’lmetn bets’edal shren:
Engesgs beegre libuna:
Keadmas t’g yewanoch medina.

VERSE 4
Enkiya enhid ket’nt mender:
Lemesger eski ennderder:
Enhun telawe aser:
Letesemabet , yedesta awtar:

VERSE 5
“yeqedmowan menged eyu:”
Endale ermyas nebiyu:
Kedawit , keqore , keasaf:
Endres keeman beraf.',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ermias-haylay'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 1
ዘመናይ ማለት ኋላ ቀር፥
እያለ መጣፍ ሲናገር፥
ልብ ያለ ልብ ፥ ሰሚ ጆሮ፥
መች ነበር ድሮ ፣ ዘንድሮ?

CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 2
ሺህ ዓመት ለእሱ እንደ ትናንት፥
ዝንተ ዓለም እንደ አንዲት ትጋት፥
ቸር ሆኖ የእድሜን ብርሃናት፥
ሲያቀዳጀን ዳግም ዘመን፥

CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 3
ምሥራቁን እንይ አሻግረን፥
ጽልመትን በፀዳል ሽረን፥
እንገሥግሥ በእግረ ልቡና፥
ከአድማስ ጥግ የዋኖች መዲና።

CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 4
እንኪያ እንሂድ ከጥንት መንደር፥
ለመሥገር እስኪ እንንደርደር፥
እንሁን ተላዌ አሠር፥
ለተሰማበት ፣ የደስታ አውታር፥

CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥

VERSE 5
“የቀድሞዋን መንገድ እዩ፥”
እንዳለ ኤርምያስ ነቢዩ፥
ከዳዊት ፣ ከቆሬ ፣ ከአሣፍ፥
እንድረስ ከኤማን በራፍ።

CHORUS
የሰው ዘመኑ ፥ እንደ ሣር፥
ፈጥኖ ደርቆ ለክብር ፣ ለኃሣር፥
የሰው እድሜው እንደ ጥላ፥
የሚጠፋ ‘ሚቀር ኋላ፥'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yesew zemenu : ende sar:
Fet’no derqo lekbr , lehasar:
Yesew edmew ende t’la:
Yemit’efa ‘miqer hwala:

VERSE 1
Zemenay malet hwala qer:
Eyale met’af sinager:
Lib yale lib : semi joro:
Mech neber diro , zendro?

CHORUS
Yesew zemenu : ende sar:
Fet’no derqo lekbr , lehasar:
Yesew edmew ende t’la:
Yemit’efa ‘miqer hwala:

VERSE 2
Shih amet leesu ende tinant:
Zinte alem ende andit tigat:
Cher hono yeedmen birhanat:
Siyaqedajen dagm zemen:

CHORUS
Yesew zemenu : ende sar:
Fet’no derqo lekbr , lehasar:
Yesew edmew ende t’la:
Yemit’efa ‘miqer hwala:

VERSE 3
Misraqun eny ashagren:
Ts’lmetn bets’edal shren:
Engesgs beegre libuna:
Keadmas t’g yewanoch medina.

CHORUS
Yesew zemenu : ende sar:
Fet’no derqo lekbr , lehasar:
Yesew edmew ende t’la:
Yemit’efa ‘miqer hwala:

VERSE 4
Enkiya enhid ket’nt mender:
Lemesger eski ennderder:
Enhun telawe aser:
Letesemabet , yedesta awtar:

CHORUS
Yesew zemenu : ende sar:
Fet’no derqo lekbr , lehasar:
Yesew edmew ende t’la:
Yemit’efa ‘miqer hwala:

VERSE 5
“yeqedmowan menged eyu:”
Endale ermyas nebiyu:
Kedawit , keqore , keasaf:
Endres keeman beraf.

CHORUS
Yesew zemenu : ende sar:
Fet’no derqo lekbr , lehasar:
Yesew edmew ende t’la:
Yemit’efa ‘miqer hwala:'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ermias-haylay', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eruk Newu (eruk-newu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እሩቅ ነው ልቤ ከልብህ
መንገዴ አይደለም መንገድህ
የሽንገላ ነው መውደዴ
ጌታዬ የምልህ ውዴ

VERSE 1
ለታይታ ነው የኔ ጌታ ያንተ ሆኜ እኮ አላውቅም
ፍቅርህን ላውራው እንጂ በምግባር አልመስልህም
ብዙ ስትዳክር ነፍሴ እረፍቷን ከሰው ፈልጋ
ግን አላወቀችውም ሰላሟ እንዳለ አንተ ጋ

VERSE 2
እርዳኝ አልል በችግሬ
እኔ አላከብርህ ጌታዬ
በሸክላው ነው የምመካው
ወድቆ በሚሰበረው/2/

VERSE 3
አማኝ ነኝ ለሚያየኝ ተቆርቋሪ ለህግህ
በጽድቅህ የምጓዝ የምመራ በመንፈስህ
ግን ሌላ ነኝ በአንተ ፊት የሌለኝ ፍጹም ፍቅር
ምህረትህ ጋርዳኝ እንጂ ማይገባኝ ነኝ መኖር

VERSE 4
አሰማምሬ ምናገር
በዓለም ፊት ያንተን ነገር
ነፍሴን ያጎደልኩኝ ምስኪን
ንካው ለውጠው ልቤን/2/

VERSE 5
እሩቅ ነኝ ለመልካም እሩቅ ነኝ ለይቅርታ
የምደሰት በዓለም በበደል በኃጢአት ትዝታ
ያለህ እስከማይመስለኝ ቤትህን የምዳፈር
አባትነትህ ራርቶልኝ ያላነሳህብኝ በትር

VERSE 6
የማልወድ ነኝ ወንድሜን
ከአጠገቤ ያለውን
ታድያ እንዴት ነው ማስደስትህ
ሳላከብር ያንተን ትዕዛዝ

VERSE 7
መዝሙሬ እንኳን ለራሴ ነው ክብርና ስሜን ፍለጋ
በሰዎች መወደድን አድርጌው ማትረፊያ ዋጋ
መች አፈርኩህ እንደ አባቶቼ መች ዝቅ አልኩኝ በትህትና
ክርስቲያን ለመባልማ እኔ ገና ነኝ ገና

VERSE 8
ነጠላዬን አስውቤው
ውስጤን በትዕቢት ሞልቼው
ብዘምር በአደባባይ
አወይ እኔ አተርፍ ባይ',
      lyrics_transliteration = 'Eruq new libe kelbh
Mengede aydelem mengedh
Yeshngela new mewdede
Getaye yemlh wide

VERSE 1
Letayta new yene Geta yante hogne eko alawqm
Fiqrhn lawraw enji bemgbar almeslhm
Bizu sitdakr nefse ereftwan kesew felga
Gin alaweqechwm selamwa endale ante ga

VERSE 2
Erdagn all bechgre
Ene alakebrh Getaye
Besheklaw new yemmekaw
Wedqo bemiseberew (2)

VERSE 3
Amagn negn lemiyayegn teqorqwari lehgh
Bets’dqh yemgwaz yemmera bemenfesh
Gin lela negn beante fit yelelegn fits’um fiqr
Mihreth gardagn enji maygebagn negn menor

VERSE 4
Asemamre minager
Bealem fit yanten neger
Nefsen yagodelkugn miskin
Nikaw lewt’ew liben (2)

VERSE 5
Eruq negn lemelkam eruq negn leyqrta
Yemdeset bealem bebedel behat’iat tizta
Yaleh eskemaymeslegn bethn yemdafer
Abatneth rartolgn yalanesahbgn betr

VERSE 6
Yemalwed negn wendmen
Keat’egebe yalewn
Tadya endet new masdesth
Salakebr yanten tiezaz

VERSE 7
Mezmure enkwan lerase new kibrna simen filega
Besewoch mewededn adrgew matrefiya waga
Mech aferkuh ende abatoche mech ziq alkugn bethtna
Kirstiyan lemebalma ene gena negn gena

VERSE 8
Net’elayen aswbew
Wist’en betebit molchew
Bizemr beadebabay
Awey ene aterf bay',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eruk-newu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እሩቅ ነው ልቤ ከልብህ
መንገዴ አይደለም መንገድህ
የሽንገላ ነው መውደዴ
ጌታዬ የምልህ ውዴ

VERSE 1
ለታይታ ነው የኔ ጌታ ያንተ ሆኜ እኮ አላውቅም
ፍቅርህን ላውራው እንጂ በምግባር አልመስልህም
ብዙ ስትዳክር ነፍሴ እረፍቷን ከሰው ፈልጋ
ግን አላወቀችውም ሰላሟ እንዳለ አንተ ጋ

CHORUS
እሩቅ ነው ልቤ ከልብህ
መንገዴ አይደለም መንገድህ
የሽንገላ ነው መውደዴ
ጌታዬ የምልህ ውዴ

VERSE 2
እርዳኝ አልል በችግሬ
እኔ አላከብርህ ጌታዬ
በሸክላው ነው የምመካው
ወድቆ በሚሰበረው/2/

CHORUS
እሩቅ ነው ልቤ ከልብህ
መንገዴ አይደለም መንገድህ
የሽንገላ ነው መውደዴ
ጌታዬ የምልህ ውዴ

VERSE 3
አማኝ ነኝ ለሚያየኝ ተቆርቋሪ ለህግህ
በጽድቅህ የምጓዝ የምመራ በመንፈስህ
ግን ሌላ ነኝ በአንተ ፊት የሌለኝ ፍጹም ፍቅር
ምህረትህ ጋርዳኝ እንጂ ማይገባኝ ነኝ መኖር

CHORUS
እሩቅ ነው ልቤ ከልብህ
መንገዴ አይደለም መንገድህ
የሽንገላ ነው መውደዴ
ጌታዬ የምልህ ውዴ

VERSE 4
አሰማምሬ ምናገር
በዓለም ፊት ያንተን ነገር
ነፍሴን ያጎደልኩኝ ምስኪን
ንካው ለውጠው ልቤን/2/

CHORUS
እሩቅ ነው ልቤ ከልብህ
መንገዴ አይደለም መንገድህ
የሽንገላ ነው መውደዴ
ጌታዬ የምልህ ውዴ

VERSE 5
እሩቅ ነኝ ለመልካም እሩቅ ነኝ ለይቅርታ
የምደሰት በዓለም በበደል በኃጢአት ትዝታ
ያለህ እስከማይመስለኝ ቤትህን የምዳፈር
አባትነትህ ራርቶልኝ ያላነሳህብኝ በትር

CHORUS
እሩቅ ነው ልቤ ከልብህ
መንገዴ አይደለም መንገድህ
የሽንገላ ነው መውደዴ
ጌታዬ የምልህ ውዴ

VERSE 6
የማልወድ ነኝ ወንድሜን
ከአጠገቤ ያለውን
ታድያ እንዴት ነው ማስደስትህ
ሳላከብር ያንተን ትዕዛዝ

CHORUS
እሩቅ ነው ልቤ ከልብህ
መንገዴ አይደለም መንገድህ
የሽንገላ ነው መውደዴ
ጌታዬ የምልህ ውዴ

VERSE 7
መዝሙሬ እንኳን ለራሴ ነው ክብርና ስሜን ፍለጋ
በሰዎች መወደድን አድርጌው ማትረፊያ ዋጋ
መች አፈርኩህ እንደ አባቶቼ መች ዝቅ አልኩኝ በትህትና
ክርስቲያን ለመባልማ እኔ ገና ነኝ ገና

CHORUS
እሩቅ ነው ልቤ ከልብህ
መንገዴ አይደለም መንገድህ
የሽንገላ ነው መውደዴ
ጌታዬ የምልህ ውዴ

VERSE 8
ነጠላዬን አስውቤው
ውስጤን በትዕቢት ሞልቼው
ብዘምር በአደባባይ
አወይ እኔ አተርፍ ባይ

CHORUS
እሩቅ ነው ልቤ ከልብህ
መንገዴ አይደለም መንገድህ
የሽንገላ ነው መውደዴ
ጌታዬ የምልህ ውዴ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eruq new libe kelbh
Mengede aydelem mengedh
Yeshngela new mewdede
Getaye yemlh wide

VERSE 1
Letayta new yene Geta yante hogne eko alawqm
Fiqrhn lawraw enji bemgbar almeslhm
Bizu sitdakr nefse ereftwan kesew felga
Gin alaweqechwm selamwa endale ante ga

CHORUS
Eruq new libe kelbh
Mengede aydelem mengedh
Yeshngela new mewdede
Getaye yemlh wide

VERSE 2
Erdagn all bechgre
Ene alakebrh Getaye
Besheklaw new yemmekaw
Wedqo bemiseberew (2)

CHORUS
Eruq new libe kelbh
Mengede aydelem mengedh
Yeshngela new mewdede
Getaye yemlh wide

VERSE 3
Amagn negn lemiyayegn teqorqwari lehgh
Bets’dqh yemgwaz yemmera bemenfesh
Gin lela negn beante fit yelelegn fits’um fiqr
Mihreth gardagn enji maygebagn negn menor

CHORUS
Eruq new libe kelbh
Mengede aydelem mengedh
Yeshngela new mewdede
Getaye yemlh wide

VERSE 4
Asemamre minager
Bealem fit yanten neger
Nefsen yagodelkugn miskin
Nikaw lewt’ew liben (2)

CHORUS
Eruq new libe kelbh
Mengede aydelem mengedh
Yeshngela new mewdede
Getaye yemlh wide

VERSE 5
Eruq negn lemelkam eruq negn leyqrta
Yemdeset bealem bebedel behat’iat tizta
Yaleh eskemaymeslegn bethn yemdafer
Abatneth rartolgn yalanesahbgn betr

CHORUS
Eruq new libe kelbh
Mengede aydelem mengedh
Yeshngela new mewdede
Getaye yemlh wide

VERSE 6
Yemalwed negn wendmen
Keat’egebe yalewn
Tadya endet new masdesth
Salakebr yanten tiezaz

CHORUS
Eruq new libe kelbh
Mengede aydelem mengedh
Yeshngela new mewdede
Getaye yemlh wide

VERSE 7
Mezmure enkwan lerase new kibrna simen filega
Besewoch mewededn adrgew matrefiya waga
Mech aferkuh ende abatoche mech ziq alkugn bethtna
Kirstiyan lemebalma ene gena negn gena

CHORUS
Eruq new libe kelbh
Mengede aydelem mengedh
Yeshngela new mewdede
Getaye yemlh wide

VERSE 8
Net’elayen aswbew
Wist’en betebit molchew
Bizemr beadebabay
Awey ene aterf bay

CHORUS
Eruq new libe kelbh
Mengede aydelem mengedh
Yeshngela new mewdede
Getaye yemlh wide'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eruk-newu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Esat Tsirihu (esat-tsirihu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እሳት ጽርሑ ማይ ጠፈሩ /2/
ደመና መንኩራኩሩ ለመድኃኔዓለም/4/

VERSE 1
እሳት ጽርሑ ማይ ጠፈሩ /2/
ደመና መንኩራኩሩ ለመድኃኔዓለም/4/',
      lyrics_transliteration = 'Esat ts’rhu may t’eferu (2)
Demena menkurakuru lemedhanealem (4)

VERSE 1
Esat ts’rhu may t’eferu (2)
Demena menkurakuru lemedhanealem (4)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'esat-tsirihu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እሳት ጽርሑ ማይ ጠፈሩ /2/
ደመና መንኩራኩሩ ለመድኃኔዓለም/4/

VERSE 1
እሳት ጽርሑ ማይ ጠፈሩ /2/
ደመና መንኩራኩሩ ለመድኃኔዓለም/4/

CHORUS
እሳት ጽርሑ ማይ ጠፈሩ /2/
ደመና መንኩራኩሩ ለመድኃኔዓለም/4/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Esat ts’rhu may t’eferu (2)
Demena menkurakuru lemedhanealem (4)

VERSE 1
Esat ts’rhu may t’eferu (2)
Demena menkurakuru lemedhanealem (4)

CHORUS
Esat ts’rhu may t’eferu (2)
Demena menkurakuru lemedhanealem (4)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'esat-tsirihu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Esegid Leki (esegid-leki)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 1
ፋራን የምትባይ የእንብቁም ተራራ
የማህፀንሽ ፍሬ በሁሉም ሚፈራ
በስጋሽም ድንግል ድንግል በህሊና
ካንቺ ሚተካከል ፍጥረት የለምና

VERSE 2
እሰግድ ለኪ
ከጥፋቱ ዉሀ ኖህ የዳነብሽ
የምህረት ቃል-ኪዳን ቀስተደመና ነሽ
የኤልያስ መሶብ የሙሴ ደመና

VERSE 3
ካንቺ ተመገብን ሰማያዊ መና
እሰግድ ለኪ
የአብርሃም ድንኳን የይህሳቅ መአዛ
ያይቆብ በራዕይ ያየሽ በፍኖተ ሎዛ

VERSE 4
በእጆችሽ ልባረክ እንዲበዛ ፅድቄ
ሰላም ለኪ ልበል ከፊትሽ ወድቄ
እሰግድ ለኪ
ሀረቡኒ ልበል የሀዘኔ መርሻ

VERSE 5
ካምላክ መገናኛ የፀሎቴ ዋሻ
ከተወዳጅ ልጅሽ ይቅርታ እንዳገኝ
አንቺን ዋስ ጠበቃ አድርጌያለሁኝ
እሰግድ ለኪ',
      lyrics_transliteration = 'Enem ej nesaw selam leki biye
Bemahts’ensh yalew newna Getaye
Meche molto yawqal yelbe meshat
Anchi yeleleshbet yeamlake enat ×2

VERSE 1
Faran yemtbay yeenbqum terara
Yemahts’ensh fire behulum mifera
Besgashm Dingil Dingil behlina
Kanchi mitekakel fit’ret yelemna

VERSE 2
Esegd leki
Ket’fatu wuhe noh yedanebsh
Yemhret qal-kidan qestedemena nesh
Yeelyas mesob yemuse demena

VERSE 3
Kanchi temegebn semayawi mena
Esegd leki
Yeabrham dinkwan yeyhsaq meaza
Yayqob beraey yayesh befnote loza

VERSE 4
Beejochsh libarek endibeza ts’dqe
Selam leki libel kefitsh wedqe
Esegd leki
Herebuni libel yehezene mersha

VERSE 5
Kamlak megenagna yets’elote washa
Ketewedaj lijsh yiqrta endagegn
Anchin was t’ebeqa adrgeyalehugn
Esegd leki',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'esegid-leki'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 1
ፋራን የምትባይ የእንብቁም ተራራ
የማህፀንሽ ፍሬ በሁሉም ሚፈራ
በስጋሽም ድንግል ድንግል በህሊና
ካንቺ ሚተካከል ፍጥረት የለምና

CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 2
እሰግድ ለኪ
ከጥፋቱ ዉሀ ኖህ የዳነብሽ
የምህረት ቃል-ኪዳን ቀስተደመና ነሽ
የኤልያስ መሶብ የሙሴ ደመና

CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 3
ካንቺ ተመገብን ሰማያዊ መና
እሰግድ ለኪ
የአብርሃም ድንኳን የይህሳቅ መአዛ
ያይቆብ በራዕይ ያየሽ በፍኖተ ሎዛ

CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 4
በእጆችሽ ልባረክ እንዲበዛ ፅድቄ
ሰላም ለኪ ልበል ከፊትሽ ወድቄ
እሰግድ ለኪ
ሀረቡኒ ልበል የሀዘኔ መርሻ

CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2

VERSE 5
ካምላክ መገናኛ የፀሎቴ ዋሻ
ከተወዳጅ ልጅሽ ይቅርታ እንዳገኝ
አንቺን ዋስ ጠበቃ አድርጌያለሁኝ
እሰግድ ለኪ

CHORUS
እኔም እጅ ነሳው ሰላም ለኪ ብዬ
በማህፀንሽ ያለው ነውና ጌታዬ
መቼ ሞልቶ ያውቃል የልቤ መሻት
አንቺ የሌለሽበት የአምላኬ እናት ×2'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Enem ej nesaw selam leki biye
Bemahts’ensh yalew newna Getaye
Meche molto yawqal yelbe meshat
Anchi yeleleshbet yeamlake enat ×2

VERSE 1
Faran yemtbay yeenbqum terara
Yemahts’ensh fire behulum mifera
Besgashm Dingil Dingil behlina
Kanchi mitekakel fit’ret yelemna

CHORUS
Enem ej nesaw selam leki biye
Bemahts’ensh yalew newna Getaye
Meche molto yawqal yelbe meshat
Anchi yeleleshbet yeamlake enat ×2

VERSE 2
Esegd leki
Ket’fatu wuhe noh yedanebsh
Yemhret qal-kidan qestedemena nesh
Yeelyas mesob yemuse demena

CHORUS
Enem ej nesaw selam leki biye
Bemahts’ensh yalew newna Getaye
Meche molto yawqal yelbe meshat
Anchi yeleleshbet yeamlake enat ×2

VERSE 3
Kanchi temegebn semayawi mena
Esegd leki
Yeabrham dinkwan yeyhsaq meaza
Yayqob beraey yayesh befnote loza

CHORUS
Enem ej nesaw selam leki biye
Bemahts’ensh yalew newna Getaye
Meche molto yawqal yelbe meshat
Anchi yeleleshbet yeamlake enat ×2

VERSE 4
Beejochsh libarek endibeza ts’dqe
Selam leki libel kefitsh wedqe
Esegd leki
Herebuni libel yehezene mersha

CHORUS
Enem ej nesaw selam leki biye
Bemahts’ensh yalew newna Getaye
Meche molto yawqal yelbe meshat
Anchi yeleleshbet yeamlake enat ×2

VERSE 5
Kamlak megenagna yets’elote washa
Ketewedaj lijsh yiqrta endagegn
Anchin was t’ebeqa adrgeyalehugn
Esegd leki

CHORUS
Enem ej nesaw selam leki biye
Bemahts’ensh yalew newna Getaye
Meche molto yawqal yelbe meshat
Anchi yeleleshbet yeamlake enat ×2'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'esegid-leki', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Esiki Lamesiginih (esiki-lamesiginih)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 1
ሃጢያት በደሌን ጋርደህ
ደምህ አጥቦ አንፅቶኛል
ፅድቄን በይኖልኛል
አንተ ልጄ ነህ ብለህ

VERSE 2
ጌታ በጅራፍ ቆስለህ
ሳልከኝ ልብህ መሃል
ወጣሁ ከሞት ገደል

VERSE 3
ነግቷል በብርሃንህ
ደግሞም በመከራህ
ጠፍቷል የሞት ጨለማ
ጌታ በስምህ ግርማ

VERSE 4
ፍቅርህ ከፍርድህ በዝቶ
ልብህ መዳኔን ሽቶ
በእንባ ታርቄሃለሁ
በእንባ እዘምራለሁ

VERSE 5
ወዳጅ ባልጀራዬ
ውዴ ሁለንተናዬ
ልቤ ይናፍቀሃል

VERSE 6
አይኔም ይጠብቅሃል
ቀርበህ ያስታመምከኝ
ቀደህ ያለበስኸኝ
አለኝ ብዙ ትዝታ

VERSE 7
ለኔስ ልዩ ነህ ጌታ
ትናት ሌላ ነበርኩኝ
አንተን ያልተረዳሁኝ

VERSE 8
ዛሬ ያሳመንከኝ
ለጽድቅ አሰለፍከኝ
እንዴት ችሎ ዝም ይላል
ልቤም ዛሬም ይጮሃል

VERSE 9
አዲስ ልዩ ምስጋና
ላንተ ይገባልና',
      lyrics_transliteration = 'Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 1
Hat’iyat bedelen gardeh
Demh at’bo ants’tognal
Ts’dqen beynolgnal
Ante lije neh bileh

VERSE 2
Geta bejraf qosleh
Salkegn libh mehal
Wet’ahu kemot gedel

VERSE 3
Negtwal bebrhanh
Degmom bemekerah
T’eftwal yemot ch’elema
Geta besmh girma

VERSE 4
Fiqrh kefrdh bezto
Libh medanen shto
Beenba tarqehalehu
Beenba ezemralehu

VERSE 5
Wedaj baljeraye
Wide hulentenaye
Libe yinafqehal

VERSE 6
Aynem yit’ebqhal
Qerbeh yastamemkegn
Qedeh yalebesኸgn
Alegn bizu tizta

VERSE 7
Lenes liyu neh Geta
Tinat lela neberkugn
Anten yalteredahugn

VERSE 8
Zare yasamenkegn
Lets’dq aselefkegn
Endet chlo zim yilal
Libem zarem yich’ohal

VERSE 9
Adis liyu misgana
Lante yigebalna',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'esiki-lamesiginih'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 1
ሃጢያት በደሌን ጋርደህ
ደምህ አጥቦ አንፅቶኛል
ፅድቄን በይኖልኛል
አንተ ልጄ ነህ ብለህ

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 2
ጌታ በጅራፍ ቆስለህ
ሳልከኝ ልብህ መሃል
ወጣሁ ከሞት ገደል
አዝ

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 3
ነግቷል በብርሃንህ
ደግሞም በመከራህ
ጠፍቷል የሞት ጨለማ
ጌታ በስምህ ግርማ

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 4
ፍቅርህ ከፍርድህ በዝቶ
ልብህ መዳኔን ሽቶ
በእንባ ታርቄሃለሁ
በእንባ እዘምራለሁ

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 5
አዝ
ወዳጅ ባልጀራዬ
ውዴ ሁለንተናዬ
ልቤ ይናፍቀሃል

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 6
አይኔም ይጠብቅሃል
ቀርበህ ያስታመምከኝ
ቀደህ ያለበስኸኝ
አለኝ ብዙ ትዝታ

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 7
ለኔስ ልዩ ነህ ጌታ
አዝ
ትናት ሌላ ነበርኩኝ
አንተን ያልተረዳሁኝ

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 8
ዛሬ ያሳመንከኝ
ለጽድቅ አሰለፍከኝ
እንዴት ችሎ ዝም ይላል
ልቤም ዛሬም ይጮሃል

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ

VERSE 9
አዲስ ልዩ ምስጋና
ላንተ ይገባልና

CHORUS
እስኪ ላመስግንህ ተንበርክኬ/2/
ተለውጧል ባንተ ታርኬ
ተቀይሯል ባንተ ታርኬ/2/
ከላይ ከሰማይ ወርደህ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 1
Hat’iyat bedelen gardeh
Demh at’bo ants’tognal
Ts’dqen beynolgnal
Ante lije neh bileh

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 2
Geta bejraf qosleh
Salkegn libh mehal
Wet’ahu kemot gedel
CHORUS

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 3
Negtwal bebrhanh
Degmom bemekerah
T’eftwal yemot ch’elema
Geta besmh girma

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 4
Fiqrh kefrdh bezto
Libh medanen shto
Beenba tarqehalehu
Beenba ezemralehu

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 5
CHORUS
Wedaj baljeraye
Wide hulentenaye
Libe yinafqehal

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 6
Aynem yit’ebqhal
Qerbeh yastamemkegn
Qedeh yalebesኸgn
Alegn bizu tizta

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 7
Lenes liyu neh Geta
CHORUS
Tinat lela neberkugn
Anten yalteredahugn

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 8
Zare yasamenkegn
Lets’dq aselefkegn
Endet chlo zim yilal
Libem zarem yich’ohal

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh

VERSE 9
Adis liyu misgana
Lante yigebalna

CHORUS
Eski lamesgnh tenberkke (2)
Telewt’wal bante tarke
Teqeyrwal bante tarke (2)
Kelay kesemay werdeh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'esiki-lamesiginih', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eskemaezenu (eskemaezenu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እስከ ማዕዜኑ እግዝእትየ
ውስተ ምድረ ነኪር ትሄልዊ
ሀገረኪ ገሊላ እትዊ
እስከ መቼ ድረስ እመቤቴ ሆይ

VERSE 1
በባዕድ ሀገር ትኖሪያለሽ
ሀገርሽ ገሊላ ግቢ×2
ፈጣኗ ደመና እመቤቴ
ስደት ግብፅ ወጥተሽ " "

VERSE 2
የሕይወትን ውሃ
አምላክን አዝለሽ
ውሃ አጠጡኝ ብለሽ ከሰዎች ጠየቅሽ ×2
የሕይወት መገኛ እመቤቴ

VERSE 3
ብቸኛዋ ሙዳይ እመቤቴ
ሦስት ዓመት ከመንፈቅ " "
ስደት ብትሰቃይ " "
ያላቸውን ትተው ለሚከተሉት

VERSE 4
አብነት ልትሆን ነው ድንግል አዛኚት
ኢየሱስ ኢየሱስ እመቤቴ
ተስፋ ለስዱዳን እመቤቴ
ዓለም ለገፋቸው እመቤቴ

VERSE 5
ምስካየ ግፉአን እመቤቴ
ከአንቺ ጋራ ድንግል ስደትን መረጠ
በመከራው ለሰው አዲስ ሕይወት ሰጠ
ሰላመ ሰጣዊት እመቤቴ

VERSE 6
ተመለሺ ማርያም እመቤቴ
በአንቺ እናየው ዘንድ እመቤቴ
የዓለሙን ሰላም እመቤቴ
ይበቃል ስደቱ ግቢ ከቤትሽ

VERSE 7
አልፈዋል ወድቀዋል የሚያሳድዱሽ',
      lyrics_transliteration = 'Eske maezenu egzetye
Wiste midre nekir tihelwi
Hegereki gelila etwi
Eske meche dires Emebete hoy

VERSE 1
Bebaed heger tinoriyalesh
Hegersh gelila gibi×2
Fet’anwa demena Emebete
Sidet gibts’ wet’tesh " "

VERSE 2
Yehywetn wiha
Amlakn azlesh
Wiha at’et’ugn bilesh kesewoch t’eyeqsh ×2
Yehywet megegna Emebete

VERSE 3
Bichegnawa muday Emebete
Sost amet kemenfeq " "
Sidet bitseqay " "
Yalachewn titew lemiketelut

VERSE 4
Abnet lithon new Dingil azagnit
Iyesus Iyesus Emebete
Tesfa lesdudan Emebete
Alem legefachew Emebete

VERSE 5
Miskaye gifuan Emebete
Keanchi gara Dingil sidetn meret’e
Bemekeraw lesew adis hiywet set’e
Selame set’awit Emebete

VERSE 6
Temeleshi Maryam Emebete
Beanchi enayew zend Emebete
Yealemun selam Emebete
Yibeqal sidetu gibi kebetsh

VERSE 7
Alfewal wedqewal yemiyasaddush',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eskemaezenu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እስከ ማዕዜኑ እግዝእትየ
ውስተ ምድረ ነኪር ትሄልዊ
ሀገረኪ ገሊላ እትዊ
እስከ መቼ ድረስ እመቤቴ ሆይ

VERSE 1
በባዕድ ሀገር ትኖሪያለሽ
ሀገርሽ ገሊላ ግቢ×2
ፈጣኗ ደመና እመቤቴ
ስደት ግብፅ ወጥተሽ " "

CHORUS
እስከ ማዕዜኑ እግዝእትየ
ውስተ ምድረ ነኪር ትሄልዊ
ሀገረኪ ገሊላ እትዊ
እስከ መቼ ድረስ እመቤቴ ሆይ

VERSE 2
የሕይወትን ውሃ
አምላክን አዝለሽ
ውሃ አጠጡኝ ብለሽ ከሰዎች ጠየቅሽ ×2
የሕይወት መገኛ እመቤቴ

CHORUS
እስከ ማዕዜኑ እግዝእትየ
ውስተ ምድረ ነኪር ትሄልዊ
ሀገረኪ ገሊላ እትዊ
እስከ መቼ ድረስ እመቤቴ ሆይ

VERSE 3
ብቸኛዋ ሙዳይ እመቤቴ
ሦስት ዓመት ከመንፈቅ " "
ስደት ብትሰቃይ " "
ያላቸውን ትተው ለሚከተሉት

CHORUS
እስከ ማዕዜኑ እግዝእትየ
ውስተ ምድረ ነኪር ትሄልዊ
ሀገረኪ ገሊላ እትዊ
እስከ መቼ ድረስ እመቤቴ ሆይ

VERSE 4
አብነት ልትሆን ነው ድንግል አዛኚት
ኢየሱስ ኢየሱስ እመቤቴ
ተስፋ ለስዱዳን እመቤቴ
ዓለም ለገፋቸው እመቤቴ

CHORUS
እስከ ማዕዜኑ እግዝእትየ
ውስተ ምድረ ነኪር ትሄልዊ
ሀገረኪ ገሊላ እትዊ
እስከ መቼ ድረስ እመቤቴ ሆይ

VERSE 5
ምስካየ ግፉአን እመቤቴ
ከአንቺ ጋራ ድንግል ስደትን መረጠ
በመከራው ለሰው አዲስ ሕይወት ሰጠ
ሰላመ ሰጣዊት እመቤቴ

CHORUS
እስከ ማዕዜኑ እግዝእትየ
ውስተ ምድረ ነኪር ትሄልዊ
ሀገረኪ ገሊላ እትዊ
እስከ መቼ ድረስ እመቤቴ ሆይ

VERSE 6
ተመለሺ ማርያም እመቤቴ
በአንቺ እናየው ዘንድ እመቤቴ
የዓለሙን ሰላም እመቤቴ
ይበቃል ስደቱ ግቢ ከቤትሽ

CHORUS
እስከ ማዕዜኑ እግዝእትየ
ውስተ ምድረ ነኪር ትሄልዊ
ሀገረኪ ገሊላ እትዊ
እስከ መቼ ድረስ እመቤቴ ሆይ

VERSE 7
አልፈዋል ወድቀዋል የሚያሳድዱሽ

CHORUS
እስከ ማዕዜኑ እግዝእትየ
ውስተ ምድረ ነኪር ትሄልዊ
ሀገረኪ ገሊላ እትዊ
እስከ መቼ ድረስ እመቤቴ ሆይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eske maezenu egzetye
Wiste midre nekir tihelwi
Hegereki gelila etwi
Eske meche dires Emebete hoy

VERSE 1
Bebaed heger tinoriyalesh
Hegersh gelila gibi×2
Fet’anwa demena Emebete
Sidet gibts’ wet’tesh " "

CHORUS
Eske maezenu egzetye
Wiste midre nekir tihelwi
Hegereki gelila etwi
Eske meche dires Emebete hoy

VERSE 2
Yehywetn wiha
Amlakn azlesh
Wiha at’et’ugn bilesh kesewoch t’eyeqsh ×2
Yehywet megegna Emebete

CHORUS
Eske maezenu egzetye
Wiste midre nekir tihelwi
Hegereki gelila etwi
Eske meche dires Emebete hoy

VERSE 3
Bichegnawa muday Emebete
Sost amet kemenfeq " "
Sidet bitseqay " "
Yalachewn titew lemiketelut

CHORUS
Eske maezenu egzetye
Wiste midre nekir tihelwi
Hegereki gelila etwi
Eske meche dires Emebete hoy

VERSE 4
Abnet lithon new Dingil azagnit
Iyesus Iyesus Emebete
Tesfa lesdudan Emebete
Alem legefachew Emebete

CHORUS
Eske maezenu egzetye
Wiste midre nekir tihelwi
Hegereki gelila etwi
Eske meche dires Emebete hoy

VERSE 5
Miskaye gifuan Emebete
Keanchi gara Dingil sidetn meret’e
Bemekeraw lesew adis hiywet set’e
Selame set’awit Emebete

CHORUS
Eske maezenu egzetye
Wiste midre nekir tihelwi
Hegereki gelila etwi
Eske meche dires Emebete hoy

VERSE 6
Temeleshi Maryam Emebete
Beanchi enayew zend Emebete
Yealemun selam Emebete
Yibeqal sidetu gibi kebetsh

CHORUS
Eske maezenu egzetye
Wiste midre nekir tihelwi
Hegereki gelila etwi
Eske meche dires Emebete hoy

VERSE 7
Alfewal wedqewal yemiyasaddush

CHORUS
Eske maezenu egzetye
Wiste midre nekir tihelwi
Hegereki gelila etwi
Eske meche dires Emebete hoy'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eskemaezenu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Estifanos Semeat (estifanos-semeat)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እስጢፋኖስ ሰማዕት
ሊቀ ዲያቆናት በምዕመናን የተሾምክ (2)
የአምላክን ትዕዛዝ በስራ የፈፀምክ (2)

VERSE 1
እስጢፋኖስ ሰማዕት
ሊቀ ዲያቆናት በምዕመናን የተሾምክ (2)
የአምላክን ትዕዛዝ በስራ የፈፀምክ (2)',
      lyrics_transliteration = 'Estifanos Semeat
Liqe Diyaqonat bememnan yeteshomke (2)
YeAmlaken tezaz besera yefetsemk (2)

VERSE 1
Estifanos Semeat
Liqe Diyaqonat bememnan yeteshomke (2)
YeAmlaken tezaz besera yefetsemk (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'estifanos-semeat'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እስጢፋኖስ ሰማዕት
ሊቀ ዲያቆናት በምዕመናን የተሾምክ (2)
የአምላክን ትዕዛዝ በስራ የፈፀምክ (2)

VERSE 1
እስጢፋኖስ ሰማዕት
ሊቀ ዲያቆናት በምዕመናን የተሾምክ (2)
የአምላክን ትዕዛዝ በስራ የፈፀምክ (2)

CHORUS
እስጢፋኖስ ሰማዕት
ሊቀ ዲያቆናት በምዕመናን የተሾምክ (2)
የአምላክን ትዕዛዝ በስራ የፈፀምክ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Estifanos Semeat
Liqe Diyaqonat bememnan yeteshomke (2)
YeAmlaken tezaz besera yefetsemk (2)

VERSE 1
Estifanos Semeat
Liqe Diyaqonat bememnan yeteshomke (2)
YeAmlaken tezaz besera yefetsemk (2)

CHORUS
Estifanos Semeat
Liqe Diyaqonat bememnan yeteshomke (2)
YeAmlaken tezaz besera yefetsemk (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'estifanos-semeat', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ete musheraye (ete-musheraye)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 1
እኔም ልበልሽ እናቴ
ድንግል ሆይ ግቢ በቤቴ (2)
ሁሉም ሰው ለራሱ ወንበር ሲዘርጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 2
ድንግል እንዳባርያ ውሃ ተሸከመሽ
ጌታን በትሀትና ታገለግያለሽ
ነይ በደመና ነይ በደመና
ነይ በደመና ነይ በደመና

VERSE 3
እመቤታችን ርሀርተ ሀለና (2)
ወርቀ ዘቦ ለብሰው በቤቱ ከሞሉት
በሃርና በወርቅ ከተንቆጠቆጡት
በሰው ፊት ያማሩ ብዙ ሆነው ሳለ

VERSE 4
ጌታ ግን ወደደሽ አናቴ ነሽ አለ
ነይ በደመና ነይ በደመና
ነይ በደመና ነይ ደመና
እመበታችን ርሀርተ ሀሊና (2)

VERSE 5
ኣሳድጎሽ ሳለ መላኩ መግቦ
ተሸልመሽ ሳለ በዝቶልሽ ተውህቦ
እጅግ በትሀትና ስላገለገልሽው
እንደ ኪሩብ መላከ ጌታን ተሸከምሽው

VERSE 6
ነይ በደመና ነይ በደመና
ነይ በደመና ነይ በደመና
እመብውታችን ርሀርተ ሀሊና (2)
የባርያውን ውርደት ተመለከተልና

VERSE 7
ለወለድሽው ነጉስ ይድረሰው ምስጋና
ከልብ የወጣ እንጂ ከንቱ ሆኖ አይደለም
ብፅዕት እንላለን እኛም ለዘላለም',
      lyrics_transliteration = 'Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 1
Enem libelsh enate
Dingil hoy gibi bebete (2)
Hulum sew lerasu wenber sizerga
Yekbrn shlmat lerasu siyast’ega

VERSE 2
Dingil endabarya wiha teshekemesh
Getan bethetna tagelegyalesh
Ney bedemena ney bedemena
Ney bedemena ney bedemena

VERSE 3
Emebetachen riherte helena (2)
Werqe zebo lebsew bebetu kemolut
Beharna bewerq ketenqot’eqot’ut
Besew fit yamaru bizu honew sale

VERSE 4
Geta gin wededesh anate nesh ale
Ney bedemena ney bedemena
Ney bedemena ney demena
Emebetachn riherte helina (2)

VERSE 5
Asadgosh sale melaku megbo
Teshelmesh sale beztolsh tewhbo
Ejg bethetna silagelegelshw
Ende kirub melake getan teshekemshw

VERSE 6
Ney bedemena ney bedemena
Ney bedemena ney bedemena
Emebwtachn riherte helina (2)
Yebaryawn wirdet temeleketelna

VERSE 7
Leweledshw negus yidresew misgana
Kelb yewet’a enji kentu hono aydelem
Bits’et enlalen egnam lezelalem',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ete-musheraye'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 1
እኔም ልበልሽ እናቴ
ድንግል ሆይ ግቢ በቤቴ (2)
ሁሉም ሰው ለራሱ ወንበር ሲዘርጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 2
ድንግል እንዳባርያ ውሃ ተሸከመሽ
ጌታን በትሀትና ታገለግያለሽ
ነይ በደመና ነይ በደመና
ነይ በደመና ነይ በደመና

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 3
እመቤታችን ርሀርተ ሀለና (2)
ወርቀ ዘቦ ለብሰው በቤቱ ከሞሉት
በሃርና በወርቅ ከተንቆጠቆጡት
በሰው ፊት ያማሩ ብዙ ሆነው ሳለ

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 4
ጌታ ግን ወደደሽ አናቴ ነሽ አለ
ነይ በደመና ነይ በደመና
ነይ በደመና ነይ ደመና
እመበታችን ርሀርተ ሀሊና (2)

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 5
ኣሳድጎሽ ሳለ መላኩ መግቦ
ተሸልመሽ ሳለ በዝቶልሽ ተውህቦ
እጅግ በትሀትና ስላገለገልሽው
እንደ ኪሩብ መላከ ጌታን ተሸከምሽው

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 6
ነይ በደመና ነይ በደመና
ነይ በደመና ነይ በደመና
እመብውታችን ርሀርተ ሀሊና (2)
የባርያውን ውርደት ተመለከተልና

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ

VERSE 7
ለወለድሽው ነጉስ ይድረሰው ምስጋና
ከልብ የወጣ እንጂ ከንቱ ሆኖ አይደለም
ብፅዕት እንላለን እኛም ለዘላለም

CHORUS
እቴ ሙሽራዬ ሰለሙን ያለሽ
እቴ ሙሽራዬ ሰለሙን ያለሽ
እኔም ልበልሽ እናቴ
ማርያም ግቢ በቤቴ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 1
Enem libelsh enate
Dingil hoy gibi bebete (2)
Hulum sew lerasu wenber sizerga
Yekbrn shlmat lerasu siyast’ega

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 2
Dingil endabarya wiha teshekemesh
Getan bethetna tagelegyalesh
Ney bedemena ney bedemena
Ney bedemena ney bedemena

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 3
Emebetachen riherte helena (2)
Werqe zebo lebsew bebetu kemolut
Beharna bewerq ketenqot’eqot’ut
Besew fit yamaru bizu honew sale

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 4
Geta gin wededesh anate nesh ale
Ney bedemena ney bedemena
Ney bedemena ney demena
Emebetachn riherte helina (2)

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 5
Asadgosh sale melaku megbo
Teshelmesh sale beztolsh tewhbo
Ejg bethetna silagelegelshw
Ende kirub melake getan teshekemshw

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 6
Ney bedemena ney bedemena
Ney bedemena ney bedemena
Emebwtachn riherte helina (2)
Yebaryawn wirdet temeleketelna

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete

VERSE 7
Leweledshw negus yidresew misgana
Kelb yewet’a enji kentu hono aydelem
Bits’et enlalen egnam lezelalem

CHORUS
Ete mushraye selemun yalesh
Ete mushraye selemun yalesh
Enem libelsh enate
Maryam gibi bebete'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ete-musheraye', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: ete musheraye mezmur cover dawit tilahun (ete-musheraye-mezmur-cover-dawit-tilahun)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 1
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 2
እመቤቴ ብዬ ስምሽን መጥራቴ
ቢራቆትብኝ ነው ባዶ ቢሆን ቤቴ
አይኖቼን ከእንባ ከለቅሶ ከልክዬ
ልብሽ ይራራልኝ ወደ እኔ አዘንብዬ

VERSE 3
እናት አለኝ የምታብስ እንባ
አያት አለች ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምህረት
ኪዳነ ምህረት አንባ መጠጊያ ናት

VERSE 4
ሔዋን ሰታኝ ከበለሱ ፍሬ
እራቁቴን ብቆም አላፍሬ
ልብሴን ይዘሽ ወደ እኔ የመጣሽ
ደጓ እናቴ ቤቴን አድምቀሽ

VERSE 5
ኪዳነ ምህረት ኪዳነ ምህረት
ኪዳነ ምህረት አንባ መጠጊያ ናት
በእናትነት ህይወቴን ጎብኝተሽ
ልቤ አረፈ ተነቅሎ ህመሙ

VERSE 6
ሰንሰለቴ ከእጅ ተቆረጠ
ምራራዬ በልጅሽ ጣፈጠ
ኪዳነ ምህረት ኪዳነ ምህረት
ኪዳነ ምህረት አንባ መጠጊያ ናት

VERSE 7
ቤቴ ሙሽራዬ
ሰሎሞንያ አለሽ
ማርያም አበበ ባዬ
ሰሎሞንያ አለሽ

VERSE 8
እኔም ልበልሽ እናቴ
ማርያም ግቢ ከቤቴ
እኔም ልበልሽ እናቴ
እማአምላክ ግቢ ከቤቴ

VERSE 9
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስተካ
ድንገል እንደ ማርያም ውሃ ተሸክመሽ
ጌታን በትህትና ታገለግያለሽ

VERSE 10
ነይ በደመና ነይ በደመና
ነይ በደመና ነይ በደመና
እመቤታችን የህሊና ፀጋ
ጽላት ዘሙሴ

VERSE 11
ጽላት ዘሲና
ጽላት ዘሙሴ
ጽላት ዘሲና
ጽላት ጽላት ጽላት

VERSE 12
ጽላት ጽላት ጽላት ለአሮን ካህን
ጽላት ጽላት ጽላት
ጽላት ጽላት ጽላት ለአሮን ካህን',
      lyrics_transliteration = 'Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 1
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 2
Emebete biye simshn met’rate
Biraqotbgn new bado bihon bete
Aynochen keenba keleqso kelkye
Libsh yiraralgn wede ene azenbye

VERSE 3
Enat alegn yemtabs enba
Ayat alech siwet’a sigeba
Kidane mihret kidane mihret
Kidane mihret anba met’egiya nat

VERSE 4
Hewan setagn kebelesu fire
Eraquten biqom alafre
Libsen yizesh wede ene yemet’ash
Degwa enate beten admqesh

VERSE 5
Kidane mihret kidane mihret
Kidane mihret anba met’egiya nat
Beenatnet hiyweten gobgntesh
Libe arefe teneqlo himemu

VERSE 6
Senselete keej teqoret’e
Miraraye beljsh t’afet’e
Kidane mihret kidane mihret
Kidane mihret anba met’egiya nat

VERSE 7
Bete mushraye
Selomonya alesh
Maryam abebe baye
Selomonya alesh

VERSE 8
Enem libelsh enate
Maryam gibi kebete
Enem libelsh enate
Emaamlak gibi kebete

VERSE 9
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyasteka
Dingel ende Maryam wiha teshekmesh
Getan bethtna tagelegyalesh

VERSE 10
Ney bedemena ney bedemena
Ney bedemena ney bedemena
Emebetachen yehlina ts’ega
Ts’lat zemuse

VERSE 11
Ts’lat zesina
Ts’lat zemuse
Ts’lat zesina
Ts’lat ts’lat ts’lat

VERSE 12
Ts’lat ts’lat ts’lat learon kahn
Ts’lat ts’lat ts’lat
Ts’lat ts’lat ts’lat learon kahn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ete-musheraye-mezmur-cover-dawit-tilahun'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 1
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 2
እመቤቴ ብዬ ስምሽን መጥራቴ
ቢራቆትብኝ ነው ባዶ ቢሆን ቤቴ
አይኖቼን ከእንባ ከለቅሶ ከልክዬ
ልብሽ ይራራልኝ ወደ እኔ አዘንብዬ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 3
እናት አለኝ የምታብስ እንባ
አያት አለች ስወጣ ስገባ
ኪዳነ ምህረት ኪዳነ ምህረት
ኪዳነ ምህረት አንባ መጠጊያ ናት

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 4
ሔዋን ሰታኝ ከበለሱ ፍሬ
እራቁቴን ብቆም አላፍሬ
ልብሴን ይዘሽ ወደ እኔ የመጣሽ
ደጓ እናቴ ቤቴን አድምቀሽ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 5
ኪዳነ ምህረት ኪዳነ ምህረት
ኪዳነ ምህረት አንባ መጠጊያ ናት
በእናትነት ህይወቴን ጎብኝተሽ
ልቤ አረፈ ተነቅሎ ህመሙ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 6
ሰንሰለቴ ከእጅ ተቆረጠ
ምራራዬ በልጅሽ ጣፈጠ
ኪዳነ ምህረት ኪዳነ ምህረት
ኪዳነ ምህረት አንባ መጠጊያ ናት

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 7
ቤቴ ሙሽራዬ
ሰሎሞንያ አለሽ
ማርያም አበበ ባዬ
ሰሎሞንያ አለሽ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 8
እኔም ልበልሽ እናቴ
ማርያም ግቢ ከቤቴ
እኔም ልበልሽ እናቴ
እማአምላክ ግቢ ከቤቴ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 9
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስተካ
ድንገል እንደ ማርያም ውሃ ተሸክመሽ
ጌታን በትህትና ታገለግያለሽ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 10
ነይ በደመና ነይ በደመና
ነይ በደመና ነይ በደመና
እመቤታችን የህሊና ፀጋ
ጽላት ዘሙሴ

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 11
ጽላት ዘሲና
ጽላት ዘሙሴ
ጽላት ዘሲና
ጽላት ጽላት ጽላት

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ

VERSE 12
ጽላት ጽላት ጽላት ለአሮን ካህን
ጽላት ጽላት ጽላት
ጽላት ጽላት ጽላት ለአሮን ካህን

CHORUS
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በመልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማይበል ሳይነቅለኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 1
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 2
Emebete biye simshn met’rate
Biraqotbgn new bado bihon bete
Aynochen keenba keleqso kelkye
Libsh yiraralgn wede ene azenbye

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 3
Enat alegn yemtabs enba
Ayat alech siwet’a sigeba
Kidane mihret kidane mihret
Kidane mihret anba met’egiya nat

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 4
Hewan setagn kebelesu fire
Eraquten biqom alafre
Libsen yizesh wede ene yemet’ash
Degwa enate beten admqesh

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 5
Kidane mihret kidane mihret
Kidane mihret anba met’egiya nat
Beenatnet hiyweten gobgntesh
Libe arefe teneqlo himemu

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 6
Senselete keej teqoret’e
Miraraye beljsh t’afet’e
Kidane mihret kidane mihret
Kidane mihret anba met’egiya nat

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 7
Bete mushraye
Selomonya alesh
Maryam abebe baye
Selomonya alesh

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 8
Enem libelsh enate
Maryam gibi kebete
Enem libelsh enate
Emaamlak gibi kebete

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 9
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyasteka
Dingel ende Maryam wiha teshekmesh
Getan bethtna tagelegyalesh

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 10
Ney bedemena ney bedemena
Ney bedemena ney bedemena
Emebetachen yehlina ts’ega
Ts’lat zemuse

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 11
Ts’lat zesina
Ts’lat zemuse
Ts’lat zesina
Ts’lat ts’lat ts’lat

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn

VERSE 12
Ts’lat ts’lat ts’lat learon kahn
Ts’lat ts’lat ts’lat
Ts’lat ts’lat ts’lat learon kahn

CHORUS
Simshn lelj lij enegralehu
Enate bemeljash sew hognalehu
Emebete silsh neylgn
Maybel sayneqlegn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ete-musheraye-mezmur-cover-dawit-tilahun', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ete Mushraye (ete-mushraye)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 1
ማርያም ግቢ በቤቴ
ኹሉም ሰው ለራሱ ወንበር ሲዘረጋ
ለክብር ሽልማት ራሱን ሲያስጠጋ
ድንግል እንደ ባርያ ውሃ ተሸክመሽ

VERSE 2
ጌታን በትህትና ታገለግያለሽ
ነይ በደመና /4/ እመቤታችን ርኅርኅተ ኅሊና
ወርቀ ዘቦ ለብሰው በቤቱ ከሞሉት
በሐርና በእንቁ ከተንቆጠቆጡት

VERSE 3
በሰው ፊት ያማሩ ብዙ ኾነው ሳለ
ጌታ ግን ወደደሽ እናቴ ነሽ አለ
ነይ በደመና /4/ እመቤታችን ርኅርኅተ ኅሊና
አሳድጎ ሳለ መልአኩ መግቦ

VERSE 4
ተሸልመሽ ሳለ በዝቶልሽ ተውቦ
እጅግ በትህትና ስላገለገልሽው
እንደ ኪሩብ መልአክ ጌታን ተሸከምሽው
ነይ በደመና /4/ እመቤታችን ርኅርኅተ ኅሊና

VERSE 5
የባርያውን ውርደት ተመልክቷልና
ለወለድሽው ንጉሥ ይድረሰው ምስጋና
ከልብ የወጣ እንጂ ከንቱውን አይደለም
ንጽሕት እንላለን እኛ ለዘለዓለም

VERSE 6
ነይ በደመና /4/ እመቤታችን ርኅርኅተ ኅሊና',
      lyrics_transliteration = 'Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 1
Maryam gbi bebeté
Hulum sew lerasu wenber sizerrega
Lekibir shilmat rasun siyastega
Dingil ende barya wuha teshekemesh

VERSE 2
Getan betihitina tagelgelalesh
Ney bedemena /4/ Embetachin rihrihte hilina
Worqe zebo lebsew bebetu kemolut

VERSE 3
Beharna beenku ketenqotqotut
Besew fit yamaru bizu honew sale
Geta gin weddedesh enate nesh ale
Ney bedemena /4/ Embetachin rihrihte hilina

VERSE 4
Asadgo sale melaku megbo
Teshelmesh sale bezto-lish tewbo
Ijig betihitina sile-agelgelishw

VERSE 5
Ende kirub melak Getan teshekemishw
Ney bedemena /4/ Embetachin rihrihte hilina
Yebaryawun wurdet temelktoalna
Lewoledishw negus yidresw misgana

VERSE 6
Kelib yeweta enji kentun aydelem
Nitsihit enlalalen enya lezalalem
Ney bedemena /4/ Embetachin rihrihte hilina',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ete-mushraye'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 1
ማርያም ግቢ በቤቴ
ኹሉም ሰው ለራሱ ወንበር ሲዘረጋ
ለክብር ሽልማት ራሱን ሲያስጠጋ
ድንግል እንደ ባርያ ውሃ ተሸክመሽ

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 2
ጌታን በትህትና ታገለግያለሽ
ነይ በደመና /4/ እመቤታችን ርኅርኅተ ኅሊና
ወርቀ ዘቦ ለብሰው በቤቱ ከሞሉት
በሐርና በእንቁ ከተንቆጠቆጡት

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 3
በሰው ፊት ያማሩ ብዙ ኾነው ሳለ
ጌታ ግን ወደደሽ እናቴ ነሽ አለ
ነይ በደመና /4/ እመቤታችን ርኅርኅተ ኅሊና
አሳድጎ ሳለ መልአኩ መግቦ

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 4
ተሸልመሽ ሳለ በዝቶልሽ ተውቦ
እጅግ በትህትና ስላገለገልሽው
እንደ ኪሩብ መልአክ ጌታን ተሸከምሽው
ነይ በደመና /4/ እመቤታችን ርኅርኅተ ኅሊና

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 5
የባርያውን ውርደት ተመልክቷልና
ለወለድሽው ንጉሥ ይድረሰው ምስጋና
ከልብ የወጣ እንጂ ከንቱውን አይደለም
ንጽሕት እንላለን እኛ ለዘለዓለም

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ

VERSE 6
ነይ በደመና /4/ እመቤታችን ርኅርኅተ ኅሊና

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ
እመአምላክ ግቢ በቤቴ
እኔም ልበልሽ እናቴ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 1
Maryam gbi bebeté
Hulum sew lerasu wenber sizerrega
Lekibir shilmat rasun siyastega
Dingil ende barya wuha teshekemesh

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 2
Getan betihitina tagelgelalesh
Ney bedemena /4/ Embetachin rihrihte hilina
Worqe zebo lebsew bebetu kemolut

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 3
Beharna beenku ketenqotqotut
Besew fit yamaru bizu honew sale
Geta gin weddedesh enate nesh ale
Ney bedemena /4/ Embetachin rihrihte hilina

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 4
Asadgo sale melaku megbo
Teshelmesh sale bezto-lish tewbo
Ijig betihitina sile-agelgelishw

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 5
Ende kirub melak Getan teshekemishw
Ney bedemena /4/ Embetachin rihrihte hilina
Yebaryawun wurdet temelktoalna
Lewoledishw negus yidresw misgana

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate

VERSE 6
Kelib yeweta enji kentun aydelem
Nitsihit enlalalen enya lezalalem
Ney bedemena /4/ Embetachin rihrihte hilina

CHORUS
Ete mushraye, Solomon yalesh /2/
Enem libelish enate
Emeamlak gbi bebeté
Enem libelish enate'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ete-mushraye', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: ETE MUSHRAYE SELOMON YALESH- ASHENAFI GEBREMARIAM (ete-mushraye-selomon-yalesh-ashenafi-gebremariam)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 1
ድንግል እንደ ባሪያ ውሃ ተሸክመሽ
ጌታን በትህትና ታገለግያለሽ
ነይ በደመና/2/ እመቤታች እርህይተ ህሊና
አዝ……

VERSE 2
ወርቀ ዘቦ ለብሰው በቤቱ ከሞሉት
በሀርና በእንቁ ከተንቆጠቆጡት
በሰው ፊት ያማሩ ብዙ ሆነው ሳለ
ጌታ ግን ወደደሽ እናቴ ነሽ አለ

VERSE 3
ነይ በደመና/2/ እመቤታች እርህይተ ህሊና
አዝ……
አሳድጐሽ ሳለ መልአኩ መ���ቦ
ተሸልመሽ ሳለ በዝቶልሽ ተውህቦ

VERSE 4
እጅግ በትህትና ስላገለገልሽው
እንደ ኪሩብ መላዕክ ጌታን ተሸከመሽው
ነይ በደመና/2/ እመቤታች እርህይተ ህሊና
አዝ……

VERSE 5
የባሪያውን ውርደት ተመልክቷልና
ለወለድሽው ንጉስ ይድረሰው ምስጋና
ከልብ የወጣ እንጂ ከንቱውን አይደለም
ብጽዕት እንላለን እኛ ለዘለዓለም

VERSE 6
ነይ በደመና/2/ እመቤታች እርህይተ ህሊና',
      lyrics_transliteration = 'Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega

VERSE 1
Dingil ende bariya wiha teshekmesh
Getan bethtna tagelegyalesh
Ney bedemena (2) emebetach erhyte hilina

VERSE 2
Werqe zebo lebsew bebetu kemolut
Beherna beenqu ketenqot’eqot’ut
Besew fit yamaru bizu honew sale
Geta gin wededesh enate nesh ale

VERSE 3
Ney bedemena (2) emebetach erhyte hilina
Asadgwesh sale melaku me���bo
Teshelmesh sale beztolsh tewhbo

VERSE 4
Ejg bethtna silagelegelshw
Ende kirub melaek getan teshekemeshw
Ney bedemena (2) emebetach erhyte hilina

VERSE 5
Yebariyawn wirdet temelktwalna
Leweledshw nigus yidresew misgana
Kelb yewet’a enji kentuwn aydelem
Bits’et enlalen egna lezelealem

VERSE 6
Ney bedemena (2) emebetach erhyte hilina',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ete-mushraye-selomon-yalesh-ashenafi-gebremariam'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 1
ድንግል እንደ ባሪያ ውሃ ተሸክመሽ
ጌታን በትህትና ታገለግያለሽ
ነይ በደመና/2/ እመቤታች እርህይተ ህሊና
አዝ……

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 2
ወርቀ ዘቦ ለብሰው በቤቱ ከሞሉት
በሀርና በእንቁ ከተንቆጠቆጡት
በሰው ፊት ያማሩ ብዙ ሆነው ሳለ
ጌታ ግን ወደደሽ እናቴ ነሽ አለ

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 3
ነይ በደመና/2/ እመቤታች እርህይተ ህሊና
አዝ……
አሳድጐሽ ሳለ መልአኩ መ���ቦ
ተሸልመሽ ሳለ በዝቶልሽ ተውህቦ

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 4
እጅግ በትህትና ስላገለገልሽው
እንደ ኪሩብ መላዕክ ጌታን ተሸከመሽው
ነይ በደመና/2/ እመቤታች እርህይተ ህሊና
አዝ……

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 5
የባሪያውን ውርደት ተመልክቷልና
ለወለድሽው ንጉስ ይድረሰው ምስጋና
ከልብ የወጣ እንጂ ከንቱውን አይደለም
ብጽዕት እንላለን እኛ ለዘለዓለም

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ

VERSE 6
ነይ በደመና/2/ እመቤታች እርህይተ ህሊና

CHORUS
እቴ ሙሽራዬ ሰሎሞን ያለሽ /2/
እኔም ልበልሽ እናቴ እመ አምላክ/ማርያም/ ጊቢ በቤቴ /2/
ሁሉም ሰው ለራሱ ወንበር ሲዘረጋ
የክብርን ሽልማት ለራሱ ሲያስጠጋ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega

VERSE 1
Dingil ende bariya wiha teshekmesh
Getan bethtna tagelegyalesh
Ney bedemena (2) emebetach erhyte hilina
CHORUS

CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega

VERSE 2
Werqe zebo lebsew bebetu kemolut
Beherna beenqu ketenqot’eqot’ut
Besew fit yamaru bizu honew sale
Geta gin wededesh enate nesh ale

CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega

VERSE 3
Ney bedemena (2) emebetach erhyte hilina
CHORUS
Asadgwesh sale melaku me���bo
Teshelmesh sale beztolsh tewhbo

CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega

VERSE 4
Ejg bethtna silagelegelshw
Ende kirub melaek getan teshekemeshw
Ney bedemena (2) emebetach erhyte hilina
CHORUS

CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega

VERSE 5
Yebariyawn wirdet temelktwalna
Leweledshw nigus yidresew misgana
Kelb yewet’a enji kentuwn aydelem
Bits’et enlalen egna lezelealem

CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega

VERSE 6
Ney bedemena (2) emebetach erhyte hilina

CHORUS
Ete mushraye selomon yalesh (2)
Enem libelsh enate eme amlak/Maryam/ gibi bebete (2)
Hulum sew lerasu wenber sizerega
Yekbrn shlmat lerasu siyast’ega'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ete-mushraye-selomon-yalesh-ashenafi-gebremariam', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Etebegn Kosheshalehu Like Mezemeran Tewodros Yosef (etebegn-kosheshalehu-like-mezemeran-tewodros-yosef)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 1
ያንሁሉ ዛሬ ረሳሁ
እጠበኝ ቆሽሻለሁ (፪)
ከድንኳንህ ብታስገባኝ ሞገስ ሰተህ
የአፍኒንን የምግባር ይዤ አስቀየምኩህ

VERSE 2
ቅባ ሜሮን ያተምክበት ልጅነቴ
እንዳይጎድፍ ጠብቅልኝ ቸር አባቴ
ኃይል አኑረህ እንደ ሶምሶን በፀጉሬ
ጎልያድን አስጥለኸኝ በጠጠሬ

VERSE 3
አቅም ቢያንሰኝ በስጋ ጦር ተሸንፌ
ደጅህ መጣው የእንባ መባ በአይኔ አቅፌ
እንዳትረሳኝ በመዳፍህ ቀርፀኸኛል
እንዳተወኝ ያለመጠን ወደኸኛል

VERSE 4
ባሰነዝር ልትቀጣኝ የሞት በትር
የትእግስትህ ሰሌዳ ነው ለኔ ክብር
ከከንፈሬ ጥበብ ፅፈህ ቅኔ ቢፈስ
በመታበይ አሳዘንኩት ያንተን መንፈስ

VERSE 5
ፍቅር ግተህ ከቅፍህ ስር ያሳደከኝ
እባክህን በበደሌ አትቅሰፈኝ',
      lyrics_transliteration = 'Et’ebgn qoshshalew
Amlake bedyalew
Yale enat yasadekegn
Yale abat yet’ebekegn

VERSE 1
Yanhulu zare resahu
Et’ebegn qoshshalehu (2)
Kednkwanh bitasgebagn moges seteh
Yeafninn yemgbar yizhe asqeyemkuh

VERSE 2
Qiba meron yatemkbet lijnete
Endaygodf t’ebqlgn cher abate
Hayl anureh ende somson bets’egure
Golyadn ast’leኸgn bet’et’ere

VERSE 3
Aqm biyansegn besga t’or teshenfe
Dejh met’aw yeenba meba beayne aqfe
Endatresagn bemedafh qerts’eኸgnal
Endatewegn yalemet’en wedeኸgnal

VERSE 4
Basenezr litqet’agn yemot betr
Yetegsth seleda new lene kibir
Kekenfere t’beb ts’feh qine bifes
Bemetabey asazenkut yanten menfes

VERSE 5
Fiqr giteh keqfh sir yasadekegn
Ebakhn bebedele atqsefegn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'etebegn-kosheshalehu-like-mezemeran-tewodros-yosef'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 1
ያንሁሉ ዛሬ ረሳሁ
እጠበኝ ቆሽሻለሁ (፪)
ከድንኳንህ ብታስገባኝ ሞገስ ሰተህ
የአፍኒንን የምግባር ይዤ አስቀየምኩህ

CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 2
ቅባ ሜሮን ያተምክበት ልጅነቴ
እንዳይጎድፍ ጠብቅልኝ ቸር አባቴ
ኃይል አኑረህ እንደ ሶምሶን በፀጉሬ
ጎልያድን አስጥለኸኝ በጠጠሬ

CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 3
አቅም ቢያንሰኝ በስጋ ጦር ተሸንፌ
ደጅህ መጣው የእንባ መባ በአይኔ አቅፌ
እንዳትረሳኝ በመዳፍህ ቀርፀኸኛል
እንዳተወኝ ያለመጠን ወደኸኛል

CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 4
ባሰነዝር ልትቀጣኝ የሞት በትር
የትእግስትህ ሰሌዳ ነው ለኔ ክብር
ከከንፈሬ ጥበብ ፅፈህ ቅኔ ቢፈስ
በመታበይ አሳዘንኩት ያንተን መንፈስ

CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ

VERSE 5
ፍቅር ግተህ ከቅፍህ ስር ያሳደከኝ
እባክህን በበደሌ አትቅሰፈኝ

CHORUS
እጠብኝ ቆሽሻለው
አምላኬ በድያለው
ያለ እናት ያሳደከኝ
ያለ አባት የጠበከኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Et’ebgn qoshshalew
Amlake bedyalew
Yale enat yasadekegn
Yale abat yet’ebekegn

VERSE 1
Yanhulu zare resahu
Et’ebegn qoshshalehu (2)
Kednkwanh bitasgebagn moges seteh
Yeafninn yemgbar yizhe asqeyemkuh

CHORUS
Et’ebgn qoshshalew
Amlake bedyalew
Yale enat yasadekegn
Yale abat yet’ebekegn

VERSE 2
Qiba meron yatemkbet lijnete
Endaygodf t’ebqlgn cher abate
Hayl anureh ende somson bets’egure
Golyadn ast’leኸgn bet’et’ere

CHORUS
Et’ebgn qoshshalew
Amlake bedyalew
Yale enat yasadekegn
Yale abat yet’ebekegn

VERSE 3
Aqm biyansegn besga t’or teshenfe
Dejh met’aw yeenba meba beayne aqfe
Endatresagn bemedafh qerts’eኸgnal
Endatewegn yalemet’en wedeኸgnal

CHORUS
Et’ebgn qoshshalew
Amlake bedyalew
Yale enat yasadekegn
Yale abat yet’ebekegn

VERSE 4
Basenezr litqet’agn yemot betr
Yetegsth seleda new lene kibir
Kekenfere t’beb ts’feh qine bifes
Bemetabey asazenkut yanten menfes

CHORUS
Et’ebgn qoshshalew
Amlake bedyalew
Yale enat yasadekegn
Yale abat yet’ebekegn

VERSE 5
Fiqr giteh keqfh sir yasadekegn
Ebakhn bebedele atqsefegn

CHORUS
Et’ebgn qoshshalew
Amlake bedyalew
Yale enat yasadekegn
Yale abat yet’ebekegn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'etebegn-kosheshalehu-like-mezemeran-tewodros-yosef', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ethiopia (ethiopia)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ወንበዴ ነበርኩኝ ሀገር ያሰለቸሁ
በመስቀል ላይ ሆኖ ታሪኬን ለወጠዉ
አስበኝ ስላልኩት በኋላ ስትመጣ
ገነትን ለማየት

VERSE 1
የመጀመሪያው ሰው ሆንኩኝ ባለእጣ
አቤት ፍቅሩ የእግዚአብሔር /2/
ግሩም ፍቅሩ የእግዚአብሔር /2/
ኃያል ፍቅሩ የእግዚአብሔር /2/

VERSE 2
አስበኝ ስላልኩት አሰበኝ ጌታዬ
ወንበዴ ነበርኩኝ ስርቆት ነው ሙያዬ
በመስቀል ላይ ሆኖ ሕዝቡን ያስብ ነበር
እኔስ አላየሁም

VERSE 3
እኔስ አላየሁም እንዲህ ያለ ፍቅር
አዝ (አቤት ፍቅሩ ..)
አልታይም ብዬ ኃጥያትን ስሰራ
ተመለስ ይለኛል ስሜን እየጠራ

VERSE 4
እንዳልሞትበት ነው በኃጥያት ታስሬ
ፍቅሩን አልዘልቀውም
ፍቅሩን አልዘልቀውም እንደዚህ ዘርዝሬ
መከራ ሲገጥመኝ መጥቶ ያጽናናኛል

VERSE 5
በሃዘኔ ጊዜ እግዚአብሔርም ያዝናል
ዓይኑ ከእኔ አይርቅም ጥበቃው አይጠፋም
ስሙን እጠራለሁ
ስሙን እጠራለሁ በጌታዬ አላፍርም',
      lyrics_transliteration = 'Wenbede neberkugn heger yaselechehu
Bemesqel lay hono tariken lewet’ewu
Asbegn silalkut behwala sitmet’a
Genetn lemayet

VERSE 1
Yemejemeriyaw sew honkugn baleet’a
Abet fiqru yeEgziabher (2)
Girum fiqru yeEgziabher (2)
Hayal fiqru yeEgziabher (2)

VERSE 2
Asbegn silalkut asebegn Getaye
Wenbede neberkugn sirqot new muyaye
Bemesqel lay hono hizbun yasb neber
Enes alayehum

VERSE 3
Enes alayehum endih yale fiqr
Altaym biye hat’yatn sisera
Temeles yilegnal simen eyet’era

VERSE 4
Endalmotbet new behat’yat tasre
Fiqrun alzelqewm
Fiqrun alzelqewm endezih zerzre
Mekera siget’megn met’to yats’nanagnal

VERSE 5
Behazene gize egziabherm yaznal
Aynu keene ayrqm t’beqaw ayt’efam
Simun et’eralehu
Simun et’eralehu begetaye alafrm',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ethiopia'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወንበዴ ነበርኩኝ ሀገር ያሰለቸሁ
በመስቀል ላይ ሆኖ ታሪኬን ለወጠዉ
አስበኝ ስላልኩት በኋላ ስትመጣ
ገነትን ለማየት

VERSE 1
የመጀመሪያው ሰው ሆንኩኝ ባለእጣ
አቤት ፍቅሩ የእግዚአብሔር /2/
ግሩም ፍቅሩ የእግዚአብሔር /2/
ኃያል ፍቅሩ የእግዚአብሔር /2/

CHORUS
ወንበዴ ነበርኩኝ ሀገር ያሰለቸሁ
በመስቀል ላይ ሆኖ ታሪኬን ለወጠዉ
አስበኝ ስላልኩት በኋላ ስትመጣ
ገነትን ለማየት

VERSE 2
አስበኝ ስላልኩት አሰበኝ ጌታዬ
ወንበዴ ነበርኩኝ ስርቆት ነው ሙያዬ
በመስቀል ላይ ሆኖ ሕዝቡን ያስብ ነበር
እኔስ አላየሁም

CHORUS
ወንበዴ ነበርኩኝ ሀገር ያሰለቸሁ
በመስቀል ላይ ሆኖ ታሪኬን ለወጠዉ
አስበኝ ስላልኩት በኋላ ስትመጣ
ገነትን ለማየት

VERSE 3
እኔስ አላየሁም እንዲህ ያለ ፍቅር
አዝ (አቤት ፍቅሩ ..)
አልታይም ብዬ ኃጥያትን ስሰራ
ተመለስ ይለኛል ስሜን እየጠራ

CHORUS
ወንበዴ ነበርኩኝ ሀገር ያሰለቸሁ
በመስቀል ላይ ሆኖ ታሪኬን ለወጠዉ
አስበኝ ስላልኩት በኋላ ስትመጣ
ገነትን ለማየት

VERSE 4
እንዳልሞትበት ነው በኃጥያት ታስሬ
ፍቅሩን አልዘልቀውም
ፍቅሩን አልዘልቀውም እንደዚህ ዘርዝሬ
መከራ ሲገጥመኝ መጥቶ ያጽናናኛል

CHORUS
ወንበዴ ነበርኩኝ ሀገር ያሰለቸሁ
በመስቀል ላይ ሆኖ ታሪኬን ለወጠዉ
አስበኝ ስላልኩት በኋላ ስትመጣ
ገነትን ለማየት

VERSE 5
በሃዘኔ ጊዜ እግዚአብሔርም ያዝናል
ዓይኑ ከእኔ አይርቅም ጥበቃው አይጠፋም
ስሙን እጠራለሁ
ስሙን እጠራለሁ በጌታዬ አላፍርም

CHORUS
ወንበዴ ነበርኩኝ ሀገር ያሰለቸሁ
በመስቀል ላይ ሆኖ ታሪኬን ለወጠዉ
አስበኝ ስላልኩት በኋላ ስትመጣ
ገነትን ለማየት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wenbede neberkugn heger yaselechehu
Bemesqel lay hono tariken lewet’ewu
Asbegn silalkut behwala sitmet’a
Genetn lemayet

VERSE 1
Yemejemeriyaw sew honkugn baleet’a
Abet fiqru yeEgziabher (2)
Girum fiqru yeEgziabher (2)
Hayal fiqru yeEgziabher (2)

CHORUS
Wenbede neberkugn heger yaselechehu
Bemesqel lay hono tariken lewet’ewu
Asbegn silalkut behwala sitmet’a
Genetn lemayet

VERSE 2
Asbegn silalkut asebegn Getaye
Wenbede neberkugn sirqot new muyaye
Bemesqel lay hono hizbun yasb neber
Enes alayehum

CHORUS
Wenbede neberkugn heger yaselechehu
Bemesqel lay hono tariken lewet’ewu
Asbegn silalkut behwala sitmet’a
Genetn lemayet

VERSE 3
Enes alayehum endih yale fiqr
CHORUS
Altaym biye hat’yatn sisera
Temeles yilegnal simen eyet’era

CHORUS
Wenbede neberkugn heger yaselechehu
Bemesqel lay hono tariken lewet’ewu
Asbegn silalkut behwala sitmet’a
Genetn lemayet

VERSE 4
Endalmotbet new behat’yat tasre
Fiqrun alzelqewm
Fiqrun alzelqewm endezih zerzre
Mekera siget’megn met’to yats’nanagnal

CHORUS
Wenbede neberkugn heger yaselechehu
Bemesqel lay hono tariken lewet’ewu
Asbegn silalkut behwala sitmet’a
Genetn lemayet

VERSE 5
Behazene gize egziabherm yaznal
Aynu keene ayrqm t’beqaw ayt’efam
Simun et’eralehu
Simun et’eralehu begetaye alafrm

CHORUS
Wenbede neberkugn heger yaselechehu
Bemesqel lay hono tariken lewet’ewu
Asbegn silalkut behwala sitmet’a
Genetn lemayet'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ethiopia', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ethiopia (ethiopia-3173)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 1
ስጋ በስጋ ህግ ይስበኛል
መንፈስ በመንፈስህግ ይጠራኛል
ለየትኛው ጌታ ተገዝቼ
የቱን እመርጣለሁ አንዱን ትቼ

VERSE 2
ሀጥያት እሰራና ይጨንቀኛል
አምላኬ ሲለየኝ ይሰማኛል
ጌታየ ሲለየኝ ይሰማኛል
አምላኬ ሲለየኝ ይሰማኛል

VERSE 3
በሐጥያት ለመኖር በዚህ አለም
የአምላክን ትእዛዝ በማጣመም
በስርቆት በዝሙት በስካር
በዲያብሎስ ፈቃድ ስንኖር

VERSE 4
የኋላ የሗላ ጭንቀት ነው
አምላክ በክዶቹ ያልያዘው
የጨለማ ጉዞ ምኑ ይጥማል
አይን እያሳወረ ያዋርዳል

VERSE 5
መላእክት በሰማይ ያለቅሳሉ
የእግዚአብሔር ቅዱሳን ያነባሉ
በሐጥያት ተማርከን ስንወሰድ
ሰይጣን ድል አግቶ ስንዋረድ',
      lyrics_transliteration = 'Lezih lehet’yat hig keteset’e
Kehywet mergemn kemeret’e
Lemot keteset’e kentu nuro
Manew yemiyadnen motn sebro

VERSE 1
Siga besga hig yisbegnal
Menfes bemenfeshg yit’eragnal
Leyetgnaw Geta tegezche
Yetun emert’alehu andun tiche

VERSE 2
Het’yat eserana yich’enqegnal
Amlake sileyegn yisemagnal
Getaye sileyegn yisemagnal
Amlake sileyegn yisemagnal

VERSE 3
Behet’yat lemenor bezih alem
Yeamlakn tiezaz bemat’amem
Besrqot bezmut beskar
Bediyablos feqad sinnor

VERSE 4
Yehwala yeሗla ch’nqet new
Amlak bekdochu yalyazew
Yech’elema guzo minu yit’mal
Ayn eyasawere yawardal

VERSE 5
Melaekt besemay yaleqsalu
YeEgziabher Kidusan yanebalu
Behet’yat temarken sinwesed
Seyt’an dil agto sinwared',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ethiopia-3173'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 1
ስጋ በስጋ ህግ ይስበኛል
መንፈስ በመንፈስህግ ይጠራኛል
ለየትኛው ጌታ ተገዝቼ
የቱን እመርጣለሁ አንዱን ትቼ

CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 2
ሀጥያት እሰራና ይጨንቀኛል
አምላኬ ሲለየኝ ይሰማኛል
ጌታየ ሲለየኝ ይሰማኛል
አምላኬ ሲለየኝ ይሰማኛል

CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 3
በሐጥያት ለመኖር በዚህ አለም
የአምላክን ትእዛዝ በማጣመም
በስርቆት በዝሙት በስካር
በዲያብሎስ ፈቃድ ስንኖር

CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 4
የኋላ የሗላ ጭንቀት ነው
አምላክ በክዶቹ ያልያዘው
የጨለማ ጉዞ ምኑ ይጥማል
አይን እያሳወረ ያዋርዳል

CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ

VERSE 5
መላእክት በሰማይ ያለቅሳሉ
የእግዚአብሔር ቅዱሳን ያነባሉ
በሐጥያት ተማርከን ስንወሰድ
ሰይጣን ድል አግቶ ስንዋረድ

CHORUS
ለዚህ ለሐጥያት ህግ ከተሰጠ
ከህይወት መርገምን ከመረጠ
ለሞት ከተሰጠ ከንቱ ኑሮ
ማነው የሚያድነን ሞትን ሰብሮ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lezih lehet’yat hig keteset’e
Kehywet mergemn kemeret’e
Lemot keteset’e kentu nuro
Manew yemiyadnen motn sebro

VERSE 1
Siga besga hig yisbegnal
Menfes bemenfeshg yit’eragnal
Leyetgnaw Geta tegezche
Yetun emert’alehu andun tiche

CHORUS
Lezih lehet’yat hig keteset’e
Kehywet mergemn kemeret’e
Lemot keteset’e kentu nuro
Manew yemiyadnen motn sebro

VERSE 2
Het’yat eserana yich’enqegnal
Amlake sileyegn yisemagnal
Getaye sileyegn yisemagnal
Amlake sileyegn yisemagnal

CHORUS
Lezih lehet’yat hig keteset’e
Kehywet mergemn kemeret’e
Lemot keteset’e kentu nuro
Manew yemiyadnen motn sebro

VERSE 3
Behet’yat lemenor bezih alem
Yeamlakn tiezaz bemat’amem
Besrqot bezmut beskar
Bediyablos feqad sinnor

CHORUS
Lezih lehet’yat hig keteset’e
Kehywet mergemn kemeret’e
Lemot keteset’e kentu nuro
Manew yemiyadnen motn sebro

VERSE 4
Yehwala yeሗla ch’nqet new
Amlak bekdochu yalyazew
Yech’elema guzo minu yit’mal
Ayn eyasawere yawardal

CHORUS
Lezih lehet’yat hig keteset’e
Kehywet mergemn kemeret’e
Lemot keteset’e kentu nuro
Manew yemiyadnen motn sebro

VERSE 5
Melaekt besemay yaleqsalu
YeEgziabher Kidusan yanebalu
Behet’yat temarken sinwesed
Seyt’an dil agto sinwared

CHORUS
Lezih lehet’yat hig keteset’e
Kehywet mergemn kemeret’e
Lemot keteset’e kentu nuro
Manew yemiyadnen motn sebro'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ethiopia-3173', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ethiopia (ethiopia-4021)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = '"ኃይልየ ሥላሴ ወፀወንየ ሥላሴ፣
በስመ ሥላሴ እቀጠቅጥ ከይሴ።"
"ኃይሌ ብርታቴ አንድ አምላክ ሥላሴ ነው፣
በሥላሴ ስምም ጠላቴን ድል እነሳዋለሁ።"

VERSE 1
"ኃይልየ ሥላሴ ወፀወንየ ሥላሴ፣
በስመ ሥላሴ እቀጠቅጥ ከይሴ።"
"ኃይሌ ብርታቴ አንድ አምላክ ሥላሴ ነው፣
በሥላሴ ስምም ጠላቴን ድል እነሳዋለሁ።"',
      lyrics_transliteration = '"haylye Silassie wets’ewenye silase,
Besme Silassie eqet’eqt’ keyse."
"hayle birtate and amlak Silassie new,
Beslase simm t’elaten dil enesawalehu."

VERSE 1
"haylye Silassie wets’ewenye silase,
Besme Silassie eqet’eqt’ keyse."
"hayle birtate and amlak Silassie new,
Beslase simm t’elaten dil enesawalehu."',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ethiopia-4021'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
"ኃይልየ ሥላሴ ወፀወንየ ሥላሴ፣
በስመ ሥላሴ እቀጠቅጥ ከይሴ።"
"ኃይሌ ብርታቴ አንድ አምላክ ሥላሴ ነው፣
በሥላሴ ስምም ጠላቴን ድል እነሳዋለሁ።"

VERSE 1
"ኃይልየ ሥላሴ ወፀወንየ ሥላሴ፣
በስመ ሥላሴ እቀጠቅጥ ከይሴ።"
"ኃይሌ ብርታቴ አንድ አምላክ ሥላሴ ነው፣
በሥላሴ ስምም ጠላቴን ድል እነሳዋለሁ።"

CHORUS
"ኃይልየ ሥላሴ ወፀወንየ ሥላሴ፣
በስመ ሥላሴ እቀጠቅጥ ከይሴ።"
"ኃይሌ ብርታቴ አንድ አምላክ ሥላሴ ነው፣
በሥላሴ ስምም ጠላቴን ድል እነሳዋለሁ።"'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
"haylye Silassie wets’ewenye silase,
Besme Silassie eqet’eqt’ keyse."
"hayle birtate and amlak Silassie new,
Beslase simm t’elaten dil enesawalehu."

VERSE 1
"haylye Silassie wets’ewenye silase,
Besme Silassie eqet’eqt’ keyse."
"hayle birtate and amlak Silassie new,
Beslase simm t’elaten dil enesawalehu."

CHORUS
"haylye Silassie wets’ewenye silase,
Besme Silassie eqet’eqt’ keyse."
"hayle birtate and amlak Silassie new,
Beslase simm t’elaten dil enesawalehu."'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ethiopia-4021', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ethiopia_like zemariyan yilma haylu ethiopia orthodox tewahdo mezmur (ethiopia-like-zemariyan-yilma-haylu-ethiopia-orthodox-tewahdo-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አማን በአማን አማን በአማን(2)
አማኑኤል ተመስገን ለዚህ ፍቅርህ ምን ልበልህ(2)
ድብቁን ሀጥያት አንተ ብገልጠው
ይቅር ብለኸኝ ባሸፋፍነው

VERSE 1
አንደሰው በቀል ቢኖርህ ጌታ
ለኔስ ሀጢያቴ የለውም ቦታ
አዝ፡፡፡፡አማኑኤል ተመስገን ለዚህ ፍቅርህ ምን ልበልህ(2)
በየ ደቂቃው ሀጢያት ስሰራ

VERSE 2
ስሰርቅ ስበድል አንተን ሳልፈራ
አንተ ግን ፊትህ ምንም ቢቀየር
በቁጣህ በትር አልገረፍከኝም
አዝ፡፡፡፡አማኑኤል ተመስገን ለዚህ ፍቅርህ ምን ልበልህ(2)

VERSE 3
ምህረትን ልከህ አድነኝ ዛሬ
ታክቶኛል እና በሀጥያት መኖሬ
አለም በሀጥያት እየሳበችኝ
በክንድህ ጥላ መኖር አቃተኝ

VERSE 4
አዝ፡፡፡፡፡አማኑኤል በመስገን ለዚህ ፍቅርህ ምን ልበልህ(2)
የሀጥያት ጉዞ ጣፋጭ ቢመስልም
ውጤቱ ምሩር ፍፁም አያምርም
እንደ በደሌ ሰላልከፈልከኝ

VERSE 5
ተመስገን እንጂ ሌላ ምን አለኝ
አዝ፡፡፡፡፡፡አማኑኤል ተመስገን ለዚህ ፍቅርህ ምን ልበልህ(2)',
      lyrics_transliteration = 'Aman beaman aman beaman (2)
Amanuel temesgen lezih fiqrh min libelh (2)
Dibqun het’yat ante bigelt’ew
Yiqr bileኸgn bashefafnew

VERSE 1
Andesew beqel binorh Geta
Lenes het’iyate yelewm bota
Beye deqiqaw het’iyat sisera

VERSE 2
Siserq sibedl anten salfera
Ante gin fith minm biqeyer
Bequt’ah betr algerefkegnm

VERSE 3
Mihretn likeh adnegn zare
Taktognal ena behet’yat menore
Alem behet’yat eyesabechgn
Bekndh t’la menor aqategn

VERSE 4
Yehet’yat guzo t’afach’ bimeslm
Wit’etu mirur fits’um ayamrm
Ende bedele selalkefelkegn

VERSE 5
Temesgen enji lela min alegn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ethiopia-like-zemariyan-yilma-haylu-ethiopia-orthodox-tewahdo-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማን በአማን አማን በአማን(2)
አማኑኤል ተመስገን ለዚህ ፍቅርህ ምን ልበልህ(2)
ድብቁን ሀጥያት አንተ ብገልጠው
ይቅር ብለኸኝ ባሸፋፍነው

VERSE 1
አንደሰው በቀል ቢኖርህ ጌታ
ለኔስ ሀጢያቴ የለውም ቦታ
አዝ፡፡፡፡አማኑኤል ተመስገን ለዚህ ፍቅርህ ምን ልበልህ(2)
በየ ደቂቃው ሀጢያት ስሰራ

CHORUS
አማን በአማን አማን በአማን(2)
አማኑኤል ተመስገን ለዚህ ፍቅርህ ምን ልበልህ(2)
ድብቁን ሀጥያት አንተ ብገልጠው
ይቅር ብለኸኝ ባሸፋፍነው

VERSE 2
ስሰርቅ ስበድል አንተን ሳልፈራ
አንተ ግን ፊትህ ምንም ቢቀየር
በቁጣህ በትር አልገረፍከኝም
አዝ፡፡፡፡አማኑኤል ተመስገን ለዚህ ፍቅርህ ምን ልበልህ(2)

CHORUS
አማን በአማን አማን በአማን(2)
አማኑኤል ተመስገን ለዚህ ፍቅርህ ምን ልበልህ(2)
ድብቁን ሀጥያት አንተ ብገልጠው
ይቅር ብለኸኝ ባሸፋፍነው

VERSE 3
ምህረትን ልከህ አድነኝ ዛሬ
ታክቶኛል እና በሀጥያት መኖሬ
አለም በሀጥያት እየሳበችኝ
በክንድህ ጥላ መኖር አቃተኝ

CHORUS
አማን በአማን አማን በአማን(2)
አማኑኤል ተመስገን ለዚህ ፍቅርህ ምን ልበልህ(2)
ድብቁን ሀጥያት አንተ ብገልጠው
ይቅር ብለኸኝ ባሸፋፍነው

VERSE 4
አዝ፡፡፡፡፡አማኑኤል በመስገን ለዚህ ፍቅርህ ምን ልበልህ(2)
የሀጥያት ጉዞ ጣፋጭ ቢመስልም
ውጤቱ ምሩር ፍፁም አያምርም
እንደ በደሌ ሰላልከፈልከኝ

CHORUS
አማን በአማን አማን በአማን(2)
አማኑኤል ተመስገን ለዚህ ፍቅርህ ምን ልበልህ(2)
ድብቁን ሀጥያት አንተ ብገልጠው
ይቅር ብለኸኝ ባሸፋፍነው

VERSE 5
ተመስገን እንጂ ሌላ ምን አለኝ
አዝ፡፡፡፡፡፡አማኑኤል ተመስገን ለዚህ ፍቅርህ ምን ልበልህ(2)

CHORUS
አማን በአማን አማን በአማን(2)
አማኑኤል ተመስገን ለዚህ ፍቅርህ ምን ልበልህ(2)
ድብቁን ሀጥያት አንተ ብገልጠው
ይቅር ብለኸኝ ባሸፋፍነው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aman beaman aman beaman (2)
Amanuel temesgen lezih fiqrh min libelh (2)
Dibqun het’yat ante bigelt’ew
Yiqr bileኸgn bashefafnew

VERSE 1
Andesew beqel binorh Geta
Lenes het’iyate yelewm bota
CHORUS
Beye deqiqaw het’iyat sisera

CHORUS
Aman beaman aman beaman (2)
Amanuel temesgen lezih fiqrh min libelh (2)
Dibqun het’yat ante bigelt’ew
Yiqr bileኸgn bashefafnew

VERSE 2
Siserq sibedl anten salfera
Ante gin fith minm biqeyer
Bequt’ah betr algerefkegnm
CHORUS

CHORUS
Aman beaman aman beaman (2)
Amanuel temesgen lezih fiqrh min libelh (2)
Dibqun het’yat ante bigelt’ew
Yiqr bileኸgn bashefafnew

VERSE 3
Mihretn likeh adnegn zare
Taktognal ena behet’yat menore
Alem behet’yat eyesabechgn
Bekndh t’la menor aqategn

CHORUS
Aman beaman aman beaman (2)
Amanuel temesgen lezih fiqrh min libelh (2)
Dibqun het’yat ante bigelt’ew
Yiqr bileኸgn bashefafnew

VERSE 4
CHORUS
Yehet’yat guzo t’afach’ bimeslm
Wit’etu mirur fits’um ayamrm
Ende bedele selalkefelkegn

CHORUS
Aman beaman aman beaman (2)
Amanuel temesgen lezih fiqrh min libelh (2)
Dibqun het’yat ante bigelt’ew
Yiqr bileኸgn bashefafnew

VERSE 5
Temesgen enji lela min alegn
CHORUS

CHORUS
Aman beaman aman beaman (2)
Amanuel temesgen lezih fiqrh min libelh (2)
Dibqun het’yat ante bigelt’ew
Yiqr bileኸgn bashefafnew'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ethiopia-like-zemariyan-yilma-haylu-ethiopia-orthodox-tewahdo-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ethiopia Orthodox Mezmure (ethiopia-orthodox-mezmure)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ

VERSE 1
ጠላት እንዲያጠፋኝ የወረወረው ቀስት
ሳይመታኝ ያለፈው ዕድል አይደል ክስተት
በከበባው መሀል ሰላም ነኝ የምለው
አጠገቤ ሳይሆን ውስጤ ስላለህ ነው

VERSE 2
አለህኝ አንተ የኔ ወዳጅ መንፈስ ቅዱስ
ብቻዬን ማተወኝ መውደድህ የማይቀንስ
ውድቀቴን የማትሻ አዛኝ በድካሜ
ስዝል ድጋፌ ነህ የዘለዐለሜ

VERSE 3
መርተህ አደረስከኝ ወደ ፀጋው ዙፋን
ሆንክልኝ ብቃቴ እንዳይ የአብ ፊቱን
ሰማያት ተተክለው ብርሀን ሳይገለጥ
ፍጥረታት ሳይመጡ ምድር ፍሬ ሳትሰጥ

VERSE 4
ሳይጋርድህ ድንበር ሰፈህ በውሃ ላይ
እንደነበርክ ያኔ ነግሰሀል ልቤም ላይ',
      lyrics_transliteration = 'Yemtmeragn wede ts’dq
Melkamun fite mitalq
Yehywet birhen neh mayaye
Qidusu menfes sit’otaye

VERSE 1
T’elat endiyat’efagn yewerewerew qest
Saymetagn yalefew edl aydel kistet
Bekebebaw mehel selam negn yemlew
At’egebe sayhon wist’e silaleh new

VERSE 2
Alehgn ante yene wedaj menfes Kidus
Bichayen matewegn mewdedh yemayqens
Widqeten yematsha azagn bedkame
Sizl digafe neh yezelealeme

VERSE 3
Merteh adereskegn wede ts’egaw zufan
Honklgn biqate enday yeab fitun
Semayat teteklew birhen saygelet’
Fit’retat saymet’u midr fire satset’

VERSE 4
Saygardh dinber sefeh bewha lay
Endeneberk yane negsehel libem lay',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ethiopia-orthodox-mezmure'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ

VERSE 1
ጠላት እንዲያጠፋኝ የወረወረው ቀስት
ሳይመታኝ ያለፈው ዕድል አይደል ክስተት
በከበባው መሀል ሰላም ነኝ የምለው
አጠገቤ ሳይሆን ውስጤ ስላለህ ነው

CHORUS
የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ

VERSE 2
አለህኝ አንተ የኔ ወዳጅ መንፈስ ቅዱስ
ብቻዬን ማተወኝ መውደድህ የማይቀንስ
ውድቀቴን የማትሻ አዛኝ በድካሜ
ስዝል ድጋፌ ነህ የዘለዐለሜ

CHORUS
የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ

VERSE 3
መርተህ አደረስከኝ ወደ ፀጋው ዙፋን
ሆንክልኝ ብቃቴ እንዳይ የአብ ፊቱን
ሰማያት ተተክለው ብርሀን ሳይገለጥ
ፍጥረታት ሳይመጡ ምድር ፍሬ ሳትሰጥ

CHORUS
የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ

VERSE 4
ሳይጋርድህ ድንበር ሰፈህ በውሃ ላይ
እንደነበርክ ያኔ ነግሰሀል ልቤም ላይ

CHORUS
የምትመራኝ ወደ ፅድቅ
መልካሙን ፊቴ ምታልቅ
የህይወት ብርሀን ነህ ማያዬ
ቅዱሱ መንፈስ ስጦታዬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yemtmeragn wede ts’dq
Melkamun fite mitalq
Yehywet birhen neh mayaye
Qidusu menfes sit’otaye

VERSE 1
T’elat endiyat’efagn yewerewerew qest
Saymetagn yalefew edl aydel kistet
Bekebebaw mehel selam negn yemlew
At’egebe sayhon wist’e silaleh new

CHORUS
Yemtmeragn wede ts’dq
Melkamun fite mitalq
Yehywet birhen neh mayaye
Qidusu menfes sit’otaye

VERSE 2
Alehgn ante yene wedaj menfes Kidus
Bichayen matewegn mewdedh yemayqens
Widqeten yematsha azagn bedkame
Sizl digafe neh yezelealeme

CHORUS
Yemtmeragn wede ts’dq
Melkamun fite mitalq
Yehywet birhen neh mayaye
Qidusu menfes sit’otaye

VERSE 3
Merteh adereskegn wede ts’egaw zufan
Honklgn biqate enday yeab fitun
Semayat teteklew birhen saygelet’
Fit’retat saymet’u midr fire satset’

CHORUS
Yemtmeragn wede ts’dq
Melkamun fite mitalq
Yehywet birhen neh mayaye
Qidusu menfes sit’otaye

VERSE 4
Saygardh dinber sefeh bewha lay
Endeneberk yane negsehel libem lay

CHORUS
Yemtmeragn wede ts’dq
Melkamun fite mitalq
Yehywet birhen neh mayaye
Qidusu menfes sit’otaye'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ethiopia-orthodox-mezmure', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ethiopia: Zemarit Fantu Welde Anedbti Yawta (ethiopia-zemarit-fantu-welde-anedbti-yawta)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 1
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከሃጢያት ፍላፃ ከሞት አተረፈ
የአናብስቱን አፍ በሃይሉ የዘጋ
የዳንኤል አምላክ ይኖራል ከእኛጋ

VERSE 2
በዳዊት ምስጋና በያሬድ ዝማሬ
ከቅዱሳን ጋር ልዘምር አብሬ
እርሱን ሳመሰግን ሜልኮል ብትስቅብኝ
ለጌታዬ ክብር እዘምራለሁኝ

VERSE 3
አስፈሪው ነበልባል እሳቱ ቢነድም
ለጣኦት እንድሰግድ ነገስታት ቢያውጁም
ሁሉም ቢተወኝም ቢጠላኝም ዓለም
ፅናት ይሆነኛል ጌታ መድሃኔዓለም

VERSE 4
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከሃጢያት ፍላፃ ከሞት አተረፈ
የአናብስቱን አፍ በሃይሉ የዘጋ
የዳንኤል አምላክ ይኖራል ከእኛጋ',
      lyrics_transliteration = 'Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 1
Wet’med tesebere enem amelet’kugn
Kehat’iyat filats’a kemot aterefe
Yeanabstun af behaylu yezega
Yedanel amlak yinoral keegnaga

VERSE 2
Bedawit misgana beyared zimare
Keqdusan gar lizemr abre
Ersun samesegn melkol bitsqbgn
Legetaye kibir ezemralehugn

VERSE 3
Asferiw nebelbal esatu binedm
Let’aot endsegd negestat biyawjum
Hulum bitewegnm bit’elagnm alem
Ts’nat yihonegnal Geta medhanealem

VERSE 4
Wet’med tesebere enem amelet’kugn
Kehat’iyat filats’a kemot aterefe
Yeanabstun af behaylu yezega
Yedanel amlak yinoral keegnaga',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ethiopia-zemarit-fantu-welde-anedbti-yawta'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 1
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከሃጢያት ፍላፃ ከሞት አተረፈ
የአናብስቱን አፍ በሃይሉ የዘጋ
የዳንኤል አምላክ ይኖራል ከእኛጋ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 2
በዳዊት ምስጋና በያሬድ ዝማሬ
ከቅዱሳን ጋር ልዘምር አብሬ
እርሱን ሳመሰግን ሜልኮል ብትስቅብኝ
ለጌታዬ ክብር እዘምራለሁኝ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 3
አስፈሪው ነበልባል እሳቱ ቢነድም
ለጣኦት እንድሰግድ ነገስታት ቢያውጁም
ሁሉም ቢተወኝም ቢጠላኝም ዓለም
ፅናት ይሆነኛል ጌታ መድሃኔዓለም

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 4
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከሃጢያት ፍላፃ ከሞት አተረፈ
የአናብስቱን አፍ በሃይሉ የዘጋ
የዳንኤል አምላክ ይኖራል ከእኛጋ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 1
Wet’med tesebere enem amelet’kugn
Kehat’iyat filats’a kemot aterefe
Yeanabstun af behaylu yezega
Yedanel amlak yinoral keegnaga

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 2
Bedawit misgana beyared zimare
Keqdusan gar lizemr abre
Ersun samesegn melkol bitsqbgn
Legetaye kibir ezemralehugn

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 3
Asferiw nebelbal esatu binedm
Let’aot endsegd negestat biyawjum
Hulum bitewegnm bit’elagnm alem
Ts’nat yihonegnal Geta medhanealem

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 4
Wet’med tesebere enem amelet’kugn
Kehat’iyat filats’a kemot aterefe
Yeanabstun af behaylu yezega
Yedanel amlak yinoral keegnaga

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
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ethiopia-zemarit-fantu-welde-anedbti-yawta', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ethiopia: Zemarit Fantu Welde Kelebanos (ethiopia-zemarit-fantu-welde-kelebanos)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ከሊባኖስ /2/ከልጅሽ ጋር ነይ
እመ አዶናይ ከሊባኖስ ወደኛ ነይ
ጥበቃሽ ዘወትር , ከሊባኖስ
እንዳይለየኝ , ከሊባኖስ

VERSE 1
በሔድኩበት ሁሉ , ከሊባኖስ
ማረፌያ ሁኝኝ , ከሊባኖስ
እኔን ባርያሽን , ከሊባኖስ
ድንግል አትርሽኝ , ከሊባኖስ

VERSE 2
በፅድቅሠሌዳ , ከሊባኖስ
ስሜን ፃፌልኝ , ከሊባኖስ
ነብሴና ስጋዬን , ከሊባኖስ
አደራ እልሻለሁ ,

VERSE 3
በልጅሽ ፅኑ ፍቅር ,
ተማፅኘሻአለሁ ,
ከመሞቴ በፌት , ከሊባኖስ
ለንስሀ አብቄን ,

VERSE 4
ለነብሴ ማረፌያ ,
አዘጋጅልኝ
ከአንበሶችመኖርያ ከሊባኖስ ከነብሮች ተራራ
መጥተሽ አስደችኝ

VERSE 5
እህቴ ሙሽራ
የልብስሽ መዓዛ ከሊባኖስ
የሊባኖስ ሽታ
ሮማን ናርዶስ ነሽ

VERSE 6
እናቱ ለጌታ
እመቤቴ ስልሽ ከሊባኖስ
ስምሽን ስጠራ
ፈጥነሽ ድርሽልኝ

VERSE 7
ከቅዱሳን ጋራ
ፈጥነሽ ድርሽልኝ
ከገብርኤል ጋራ',
      lyrics_transliteration = 'Kelibanos (2)keljsh gar ney
Eme adonay kelibanos wedegna ney
T’beqash zewetr , kelibanos
Endayleyegn , kelibanos

VERSE 1
Behedkubet hulu , kelibanos
Marefeya hugngn , kelibanos
Enen baryashn , kelibanos
Dingil atrshgn , kelibanos

VERSE 2
Bets’dqseleda , kelibanos
Simen ts’afelgn , kelibanos
Nebsena sigayen , kelibanos
Adera elshalehu ,

VERSE 3
Beljsh ts’nu fiqr ,
Temats’gneshaalehu ,
Kememote befet , kelibanos
Lenshe abqen ,

VERSE 4
Lenebse marefeya ,
Azegajlgn
Keanbesochmenorya kelibanos kenebroch terara
Met’tesh asdechgn

VERSE 5
Ehte mushra
Yelbssh meaza kelibanos
Yelibanos shta
Roman nardos nesh

VERSE 6
Enatu legeta
Emebete silsh kelibanos
Simshn sit’era
Fet’nesh dirshlgn

VERSE 7
Keqdusan gara
Fet’nesh dirshlgn
Kegebrel gara',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ethiopia-zemarit-fantu-welde-kelebanos'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከሊባኖስ /2/ከልጅሽ ጋር ነይ
እመ አዶናይ ከሊባኖስ ወደኛ ነይ
ጥበቃሽ ዘወትር , ከሊባኖስ
እንዳይለየኝ , ከሊባኖስ

VERSE 1
በሔድኩበት ሁሉ , ከሊባኖስ
ማረፌያ ሁኝኝ , ከሊባኖስ
እኔን ባርያሽን , ከሊባኖስ
ድንግል አትርሽኝ , ከሊባኖስ

CHORUS
ከሊባኖስ /2/ከልጅሽ ጋር ነይ
እመ አዶናይ ከሊባኖስ ወደኛ ነይ
ጥበቃሽ ዘወትር , ከሊባኖስ
እንዳይለየኝ , ከሊባኖስ

VERSE 2
በፅድቅሠሌዳ , ከሊባኖስ
ስሜን ፃፌልኝ , ከሊባኖስ
ነብሴና ስጋዬን , ከሊባኖስ
አደራ እልሻለሁ ,

CHORUS
ከሊባኖስ /2/ከልጅሽ ጋር ነይ
እመ አዶናይ ከሊባኖስ ወደኛ ነይ
ጥበቃሽ ዘወትር , ከሊባኖስ
እንዳይለየኝ , ከሊባኖስ

VERSE 3
በልጅሽ ፅኑ ፍቅር ,
ተማፅኘሻአለሁ ,
ከመሞቴ በፌት , ከሊባኖስ
ለንስሀ አብቄን ,

CHORUS
ከሊባኖስ /2/ከልጅሽ ጋር ነይ
እመ አዶናይ ከሊባኖስ ወደኛ ነይ
ጥበቃሽ ዘወትር , ከሊባኖስ
እንዳይለየኝ , ከሊባኖስ

VERSE 4
ለነብሴ ማረፌያ ,
አዘጋጅልኝ
ከአንበሶችመኖርያ ከሊባኖስ ከነብሮች ተራራ
መጥተሽ አስደችኝ

CHORUS
ከሊባኖስ /2/ከልጅሽ ጋር ነይ
እመ አዶናይ ከሊባኖስ ወደኛ ነይ
ጥበቃሽ ዘወትር , ከሊባኖስ
እንዳይለየኝ , ከሊባኖስ

VERSE 5
እህቴ ሙሽራ
የልብስሽ መዓዛ ከሊባኖስ
የሊባኖስ ሽታ
ሮማን ናርዶስ ነሽ

CHORUS
ከሊባኖስ /2/ከልጅሽ ጋር ነይ
እመ አዶናይ ከሊባኖስ ወደኛ ነይ
ጥበቃሽ ዘወትር , ከሊባኖስ
እንዳይለየኝ , ከሊባኖስ

VERSE 6
እናቱ ለጌታ
እመቤቴ ስልሽ ከሊባኖስ
ስምሽን ስጠራ
ፈጥነሽ ድርሽልኝ

CHORUS
ከሊባኖስ /2/ከልጅሽ ጋር ነይ
እመ አዶናይ ከሊባኖስ ወደኛ ነይ
ጥበቃሽ ዘወትር , ከሊባኖስ
እንዳይለየኝ , ከሊባኖስ

VERSE 7
ከቅዱሳን ጋራ
ፈጥነሽ ድርሽልኝ
ከገብርኤል ጋራ

CHORUS
ከሊባኖስ /2/ከልጅሽ ጋር ነይ
እመ አዶናይ ከሊባኖስ ወደኛ ነይ
ጥበቃሽ ዘወትር , ከሊባኖስ
እንዳይለየኝ , ከሊባኖስ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kelibanos (2)keljsh gar ney
Eme adonay kelibanos wedegna ney
T’beqash zewetr , kelibanos
Endayleyegn , kelibanos

VERSE 1
Behedkubet hulu , kelibanos
Marefeya hugngn , kelibanos
Enen baryashn , kelibanos
Dingil atrshgn , kelibanos

CHORUS
Kelibanos (2)keljsh gar ney
Eme adonay kelibanos wedegna ney
T’beqash zewetr , kelibanos
Endayleyegn , kelibanos

VERSE 2
Bets’dqseleda , kelibanos
Simen ts’afelgn , kelibanos
Nebsena sigayen , kelibanos
Adera elshalehu ,

CHORUS
Kelibanos (2)keljsh gar ney
Eme adonay kelibanos wedegna ney
T’beqash zewetr , kelibanos
Endayleyegn , kelibanos

VERSE 3
Beljsh ts’nu fiqr ,
Temats’gneshaalehu ,
Kememote befet , kelibanos
Lenshe abqen ,

CHORUS
Kelibanos (2)keljsh gar ney
Eme adonay kelibanos wedegna ney
T’beqash zewetr , kelibanos
Endayleyegn , kelibanos

VERSE 4
Lenebse marefeya ,
Azegajlgn
Keanbesochmenorya kelibanos kenebroch terara
Met’tesh asdechgn

CHORUS
Kelibanos (2)keljsh gar ney
Eme adonay kelibanos wedegna ney
T’beqash zewetr , kelibanos
Endayleyegn , kelibanos

VERSE 5
Ehte mushra
Yelbssh meaza kelibanos
Yelibanos shta
Roman nardos nesh

CHORUS
Kelibanos (2)keljsh gar ney
Eme adonay kelibanos wedegna ney
T’beqash zewetr , kelibanos
Endayleyegn , kelibanos

VERSE 6
Enatu legeta
Emebete silsh kelibanos
Simshn sit’era
Fet’nesh dirshlgn

CHORUS
Kelibanos (2)keljsh gar ney
Eme adonay kelibanos wedegna ney
T’beqash zewetr , kelibanos
Endayleyegn , kelibanos

VERSE 7
Keqdusan gara
Fet’nesh dirshlgn
Kegebrel gara

CHORUS
Kelibanos (2)keljsh gar ney
Eme adonay kelibanos wedegna ney
T’beqash zewetr , kelibanos
Endayleyegn , kelibanos'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ethiopia-zemarit-fantu-welde-kelebanos', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ethiopian (ethiopian)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ

VERSE 1
ሙሽራ ልቀበል ተነስቼ ሌሊት
ራሴን አገኘሁት ካጎደሉት ዘይት
አምስቱ ጎበዞች ሰነፎቹም አምስት
ምግባር ነው ዘይቱ ሃይማኖቱ መብራት

VERSE 2
ሙሽራው ዘገየ እንቅልፍ እንቅልፍ አለኝ
በሕይወቴም ባከንኩ ወደኋላ አልኩኝ
ዜናውም ተሰማ የሙሽራው መምጣት
በሉ ቶሎ ውጡ እንድትቀበሉት

VERSE 3
ተነሳው በሌሊት ሙሽራ ልቀበል
መብራት ብቻ ይዤ ዘይት አልቆብኛል
መለመን ጀመርኩኝ ዘይት ከልባሞች
ውሰት የለም በነፍስ አንሁን ደካሞች

VERSE 4
ጌታዬን አየሁት ከመላዕክት ሕብረት
ልባሞቹም ገቡ መንግስተ ሰማያት
በሮቹ ተዘጉ ሰነፎቹም ከደጅ
ቀኑን ስለማላውቅ እንግዲህ ልዘጋጅ',
      lyrics_transliteration = 'Zeyte saymola mebrate saybera
Lelit met’tehbgn keqdusan gara
Edle endayhon kesenefoch sifra
Tinsh gize sit’egn Getaye adera

VERSE 1
Mushra liqebel tenesche lelit
Rasen agegnehut kagodelut zeyt
Amstu gobezoch senefochum amst
Migbar new zeytu haymanotu mebrat

VERSE 2
Mushraw zegeye enqlf enqlf alegn
Behywetem bakenku wedehwala alkugn
Zenawm tesema yemushraw memt’at
Belu tolo wit’u endtqebelut

VERSE 3
Tenesaw belelit mushra liqebel
Mebrat bicha yizhe zeyt alqobgnal
Melemen jemerkugn zeyt kelbamoch
Wiset yelem benefs anhun dekamoch

VERSE 4
Getayen ayehut kemelaekt hibret
Libamochum gebu mengste semayat
Berochu tezegu senefochum kedej
Qenun silemalawq engdih lizegaj',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ethiopian'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ

VERSE 1
ሙሽራ ልቀበል ተነስቼ ሌሊት
ራሴን አገኘሁት ካጎደሉት ዘይት
አምስቱ ጎበዞች ሰነፎቹም አምስት
ምግባር ነው ዘይቱ ሃይማኖቱ መብራት

CHORUS
ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ

VERSE 2
ሙሽራው ዘገየ እንቅልፍ እንቅልፍ አለኝ
በሕይወቴም ባከንኩ ወደኋላ አልኩኝ
ዜናውም ተሰማ የሙሽራው መምጣት
በሉ ቶሎ ውጡ እንድትቀበሉት

CHORUS
ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ

VERSE 3
ተነሳው በሌሊት ሙሽራ ልቀበል
መብራት ብቻ ይዤ ዘይት አልቆብኛል
መለመን ጀመርኩኝ ዘይት ከልባሞች
ውሰት የለም በነፍስ አንሁን ደካሞች

CHORUS
ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ

VERSE 4
ጌታዬን አየሁት ከመላዕክት ሕብረት
ልባሞቹም ገቡ መንግስተ ሰማያት
በሮቹ ተዘጉ ሰነፎቹም ከደጅ
ቀኑን ስለማላውቅ እንግዲህ ልዘጋጅ

CHORUS
ዘይቴ ሳይሞላ መብራቴ ሳይበራ
ሌሊት መጥተህብኝ ከቅዱሳን ጋራ
እድሌ እንዳይሆን ከሰነፎች ስፍራ
ትንሽ ጊዜ ስጠኝ ጌታዬ አደራ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Zeyte saymola mebrate saybera
Lelit met’tehbgn keqdusan gara
Edle endayhon kesenefoch sifra
Tinsh gize sit’egn Getaye adera

VERSE 1
Mushra liqebel tenesche lelit
Rasen agegnehut kagodelut zeyt
Amstu gobezoch senefochum amst
Migbar new zeytu haymanotu mebrat

CHORUS
Zeyte saymola mebrate saybera
Lelit met’tehbgn keqdusan gara
Edle endayhon kesenefoch sifra
Tinsh gize sit’egn Getaye adera

VERSE 2
Mushraw zegeye enqlf enqlf alegn
Behywetem bakenku wedehwala alkugn
Zenawm tesema yemushraw memt’at
Belu tolo wit’u endtqebelut

CHORUS
Zeyte saymola mebrate saybera
Lelit met’tehbgn keqdusan gara
Edle endayhon kesenefoch sifra
Tinsh gize sit’egn Getaye adera

VERSE 3
Tenesaw belelit mushra liqebel
Mebrat bicha yizhe zeyt alqobgnal
Melemen jemerkugn zeyt kelbamoch
Wiset yelem benefs anhun dekamoch

CHORUS
Zeyte saymola mebrate saybera
Lelit met’tehbgn keqdusan gara
Edle endayhon kesenefoch sifra
Tinsh gize sit’egn Getaye adera

VERSE 4
Getayen ayehut kemelaekt hibret
Libamochum gebu mengste semayat
Berochu tezegu senefochum kedej
Qenun silemalawq engdih lizegaj

CHORUS
Zeyte saymola mebrate saybera
Lelit met’tehbgn keqdusan gara
Edle endayhon kesenefoch sifra
Tinsh gize sit’egn Getaye adera'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ethiopian', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ethiopian Orthodox Church Mezmur Zemarit Selamawit (ethiopian-orthodox-church-mezmur-zemarit-selamawit)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 1
በመገፍት ብኖር እምነቴን አፀናለሁ
በጣቶችሽ ተይዤ አዲሱ ቀን አያለሁ (2)
ስማፀን ደጅሽ መጥቼ
ተመለሰኩ ተረጋግቼ

VERSE 2
እንደምን አንቺን እረሳለሁ
በምልጃሽ ተፈውሻለሁ
የጠላቶቼን አራስ የሚቀጠቅጠው
የአብራክሽን ፍሬ ተስፍዬን አበራው (2)

VERSE 3
የድኅነት ምክንያት አርጎሻል
ለአዳም ዘር ትምክህት ሆነሻል
የልቤ ብርሃን ፍና
አዛኝት ባንቺ ልፅናና

VERSE 4
የአፌን እንጉርጉሮ ምስጋናዬ ወርሶታል
እግሬ ከእረግረግ ወጥቶ በሰገነት ተተክሏል (2)
ሐዜኔን የምሻገረው
ስምሽን እየጠራሁ ነው

VERSE 5
አገኘው ደስታ ሰላም
ጠርቼ ብዬ ማርያም
በአብረቅራቂው ፍቅር በዓለሙ ውስጥ ስኖር
ለሙውጣት ዳክራለሁ ማርያም ማርያም እላለሁ(2)

VERSE 6
ሰምተሻል ልመናዬን
ወጣሁኝ ያኑን ጥልቁን
እሳቱን ባንቺ አልፌአለሁ
በምልጃሽ ደግፌ አለው',
      lyrics_transliteration = 'Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone

VERSE 1
Bemegeft binor emneten ats’enalehu
Bet’atochsh teyzhe adisu qen ayalehu (2)
Simats’en dejsh met’che
Temeleseku teregagche

VERSE 2
Endemn anchin eresalehu
Bemljash tefewshalehu
Yet’elatochen aras yemiqet’eqt’ew
Yeabrakshn fire tesfyen aberaw (2)

VERSE 3
Yedhnet miknyat argoshal
Leadam zer timkht honeshal
Yelbe birhan fina
Azagnt banchi lits’nana

VERSE 4
Yeafen engurguro misganaye wersotal
Egre keeregreg wet’to besegenet teteklwal (2)
Hezenen yemshagerew
Simshn eyet’erahu new

VERSE 5
Agegnew desta selam
T’erche biye Maryam
Beabreqraqiw fiqr bealemu wist’ sinor
Lemuwt’at dakralehu Maryam Maryam elalehu (2)

VERSE 6
Semteshal limenayen
Wet’ahugn yanun t’lqun
Esatun banchi alfealehu
Bemljash degfe alew',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ethiopian-orthodox-church-mezmur-zemarit-selamawit'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 1
በመገፍት ብኖር እምነቴን አፀናለሁ
በጣቶችሽ ተይዤ አዲሱ ቀን አያለሁ (2)
ስማፀን ደጅሽ መጥቼ
ተመለሰኩ ተረጋግቼ

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 2
እንደምን አንቺን እረሳለሁ
በምልጃሽ ተፈውሻለሁ
የጠላቶቼን አራስ የሚቀጠቅጠው
የአብራክሽን ፍሬ ተስፍዬን አበራው (2)

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 3
የድኅነት ምክንያት አርጎሻል
ለአዳም ዘር ትምክህት ሆነሻል
የልቤ ብርሃን ፍና
አዛኝት ባንቺ ልፅናና

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 4
የአፌን እንጉርጉሮ ምስጋናዬ ወርሶታል
እግሬ ከእረግረግ ወጥቶ በሰገነት ተተክሏል (2)
ሐዜኔን የምሻገረው
ስምሽን እየጠራሁ ነው

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 5
አገኘው ደስታ ሰላም
ጠርቼ ብዬ ማርያም
በአብረቅራቂው ፍቅር በዓለሙ ውስጥ ስኖር
ለሙውጣት ዳክራለሁ ማርያም ማርያም እላለሁ(2)

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ

VERSE 6
ሰምተሻል ልመናዬን
ወጣሁኝ ያኑን ጥልቁን
እሳቱን ባንቺ አልፌአለሁ
በምልጃሽ ደግፌ አለው

CHORUS
የልቤ ዜማ ነሽና
ሰላም ነው ያንቺ ምስጋና
ሞገሴ ነው ስምሽ ለኔ
ስላለሽ ማርያም ከጎኔ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone

VERSE 1
Bemegeft binor emneten ats’enalehu
Bet’atochsh teyzhe adisu qen ayalehu (2)
Simats’en dejsh met’che
Temeleseku teregagche

CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone

VERSE 2
Endemn anchin eresalehu
Bemljash tefewshalehu
Yet’elatochen aras yemiqet’eqt’ew
Yeabrakshn fire tesfyen aberaw (2)

CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone

VERSE 3
Yedhnet miknyat argoshal
Leadam zer timkht honeshal
Yelbe birhan fina
Azagnt banchi lits’nana

CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone

VERSE 4
Yeafen engurguro misganaye wersotal
Egre keeregreg wet’to besegenet teteklwal (2)
Hezenen yemshagerew
Simshn eyet’erahu new

CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone

VERSE 5
Agegnew desta selam
T’erche biye Maryam
Beabreqraqiw fiqr bealemu wist’ sinor
Lemuwt’at dakralehu Maryam Maryam elalehu (2)

CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone

VERSE 6
Semteshal limenayen
Wet’ahugn yanun t’lqun
Esatun banchi alfealehu
Bemljash degfe alew

CHORUS
Yelbe zema neshna
Selam new yanchi misgana
Mogese new simsh lene
Silalesh Maryam kegone'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ethiopian-orthodox-church-mezmur-zemarit-selamawit', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ethiopian Orthodox Song (ethiopian-orthodox-song-2476)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 1
በክብር ተቀምጠሻል ዘበአማን
ታላቁን በረከት ዘበአማን
በእጅሽ ጨብጠሻል ዘበአማን
እንሰግድልሻለን ዘበአማን

VERSE 2
የጸጋ ስግደት ዘበአማን
እመቤቴ ማርያም ዘበአማን
የጌታዬ እናት ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል

VERSE 3
የዓቢ ክብራ ለማርያም
ልሂድ ወደ አንባሰል ዘበአማን
ወደ ግሸን ዓንባ ዘበአማን
አድርጊኝ እንደ ሕጻን ዘበአማን

VERSE 4
ወደ ቤትሽ ልግባ ዘበአማን
ልረፍ በመስቀሉ ዘበአማን
ከደጅሽ መጥቼ ዘበአማን
የዓለምን ጫጫታ ዘበአማን

VERSE 5
ሁሉንም ረስቼ ዘበአማን
ሩቅ ነው መንገዴ ዘበአማን
ብርቱ ነው ዳገቱ ዘበአማን
ንገሪው ለልጅሽ ዘበአማን

VERSE 6
እርሱ ነው ጉልበቱ ዘበአማን
ሳልረግፍ እንደ አበባ ዘበአማን
ሳልመጣ በአልጋዬ ዘበአማን
ሕይወቴን አደራ ዘበአማን

VERSE 7
ነፍስ እና ሥጋዬ ዘበአማን
ያመሰግኑሻል ዘበአማን
ዓለም ዘለዓለም ዘበአማን
ስምሽ ይጣፍጣል ዘበአማን

VERSE 8
ድንግል ማርያም ዘበአማን
በተሰጠሽ ጸጋ ዘበአማን
በአንቺ አማላጅነት ዘበአማን
ለልጆችሽ ይብዛ ዘበአማን

VERSE 9
እድሜ እና በረከት ዘበአማን
ያመሰግኑሻል ዘበአማን
ዓለም ዘለዓለም ዘበአማን
ሥምሽ ይጣፍጣል ዘበአማን

VERSE 10
ድንግል ማርያም ዘበአማን
በተሰጠሽ ጸጋ ዘበአማን
በአንቺ አማላጅነት ዘበአማን
ለልጆችሽ ይብዛ ዘበአማን

VERSE 11
ዕድሜ እና በረከት ዘበአማን',
      lyrics_transliteration = 'Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 1
Bekbr teqemt’eshal zebeaman
Talaqun bereket zebeaman
Beejsh ch’ebt’eshal zebeaman
Ensegdlshalen zebeaman

VERSE 2
Yets’ega sigdet zebeaman
Emebete Maryam zebeaman
Yegetaye enat zebeaman
Rekebki ts’ega gibre Dingil

VERSE 3
Yeabi kibra leMaryam
Lihid wede anbasel zebeaman
Wede gishen anba zebeaman
Adrgign ende hits’an zebeaman

VERSE 4
Wede betsh ligba zebeaman
Liref bemesqelu zebeaman
Kedejsh met’che zebeaman
Yealemn ch’ach’ata zebeaman

VERSE 5
Hulunm resche zebeaman
Ruq new mengede zebeaman
Birtu new dagetu zebeaman
Nigeriw leljsh zebeaman

VERSE 6
Ersu new gulbetu zebeaman
Salregf ende abeba zebeaman
Salmet’a bealgaye zebeaman
Hiyweten adera zebeaman

VERSE 7
Nefs ena sigaye zebeaman
Yamesegnushal zebeaman
Alem zelealem zebeaman
Simsh yit’aft’al zebeaman

VERSE 8
Dingil Maryam zebeaman
Beteset’esh ts’ega zebeaman
Beanchi amalajnet zebeaman
Leljochsh yibza zebeaman

VERSE 9
Edme ena bereket zebeaman
Yamesegnushal zebeaman
Alem zelealem zebeaman
Simsh yit’aft’al zebeaman

VERSE 10
Dingil Maryam zebeaman
Beteset’esh ts’ega zebeaman
Beanchi amalajnet zebeaman
Leljochsh yibza zebeaman

VERSE 11
Edme ena bereket zebeaman',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ethiopian-orthodox-song-2476'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 1
በክብር ተቀምጠሻል ዘበአማን
ታላቁን በረከት ዘበአማን
በእጅሽ ጨብጠሻል ዘበአማን
እንሰግድልሻለን ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 2
የጸጋ ስግደት ዘበአማን
እመቤቴ ማርያም ዘበአማን
የጌታዬ እናት ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 3
የዓቢ ክብራ ለማርያም
ልሂድ ወደ አንባሰል ዘበአማን
ወደ ግሸን ዓንባ ዘበአማን
አድርጊኝ እንደ ሕጻን ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 4
ወደ ቤትሽ ልግባ ዘበአማን
ልረፍ በመስቀሉ ዘበአማን
ከደጅሽ መጥቼ ዘበአማን
የዓለምን ጫጫታ ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 5
ሁሉንም ረስቼ ዘበአማን
ሩቅ ነው መንገዴ ዘበአማን
ብርቱ ነው ዳገቱ ዘበአማን
ንገሪው ለልጅሽ ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 6
እርሱ ነው ጉልበቱ ዘበአማን
ሳልረግፍ እንደ አበባ ዘበአማን
ሳልመጣ በአልጋዬ ዘበአማን
ሕይወቴን አደራ ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 7
ነፍስ እና ሥጋዬ ዘበአማን
ያመሰግኑሻል ዘበአማን
ዓለም ዘለዓለም ዘበአማን
ስምሽ ይጣፍጣል ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 8
ድንግል ማርያም ዘበአማን
በተሰጠሽ ጸጋ ዘበአማን
በአንቺ አማላጅነት ዘበአማን
ለልጆችሽ ይብዛ ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 9
እድሜ እና በረከት ዘበአማን
ያመሰግኑሻል ዘበአማን
ዓለም ዘለዓለም ዘበአማን
ሥምሽ ይጣፍጣል ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 10
ድንግል ማርያም ዘበአማን
በተሰጠሽ ጸጋ ዘበአማን
በአንቺ አማላጅነት ዘበአማን
ለልጆችሽ ይብዛ ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን

VERSE 11
ዕድሜ እና በረከት ዘበአማን

CHORUS
አንቲ ዘበአማን አንቲ ዘበአማን
ረከብኪ ጸጋ ግብረ ድንግል
የዓቢ ክብራ ለማርያም/፪/
በግሽን ተራራ ዘበአማን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 1
Bekbr teqemt’eshal zebeaman
Talaqun bereket zebeaman
Beejsh ch’ebt’eshal zebeaman
Ensegdlshalen zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 2
Yets’ega sigdet zebeaman
Emebete Maryam zebeaman
Yegetaye enat zebeaman
Rekebki ts’ega gibre Dingil

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 3
Yeabi kibra leMaryam
Lihid wede anbasel zebeaman
Wede gishen anba zebeaman
Adrgign ende hits’an zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 4
Wede betsh ligba zebeaman
Liref bemesqelu zebeaman
Kedejsh met’che zebeaman
Yealemn ch’ach’ata zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 5
Hulunm resche zebeaman
Ruq new mengede zebeaman
Birtu new dagetu zebeaman
Nigeriw leljsh zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 6
Ersu new gulbetu zebeaman
Salregf ende abeba zebeaman
Salmet’a bealgaye zebeaman
Hiyweten adera zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 7
Nefs ena sigaye zebeaman
Yamesegnushal zebeaman
Alem zelealem zebeaman
Simsh yit’aft’al zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 8
Dingil Maryam zebeaman
Beteset’esh ts’ega zebeaman
Beanchi amalajnet zebeaman
Leljochsh yibza zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 9
Edme ena bereket zebeaman
Yamesegnushal zebeaman
Alem zelealem zebeaman
Simsh yit’aft’al zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 10
Dingil Maryam zebeaman
Beteset’esh ts’ega zebeaman
Beanchi amalajnet zebeaman
Leljochsh yibza zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman

VERSE 11
Edme ena bereket zebeaman

CHORUS
Anti zebeaman anti zebeaman
Rekebki ts’ega gibre Dingil
Yeabi kibra leMaryam (2)
Begshn terara zebeaman'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ethiopian-orthodox-song-2476', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ethiopian Orthodox Tewahdo Mezmur (ethiopian-orthodox-tewahdo-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤

VERSE 1
የሕይወት እስትንፋስ ዘራብን ሕያው እንድንሆን
ይህን ያደረገ አምላካችን እግዚአብሔር ይመስገን
ስለ ማይነገር ስጦታው እግዚአብሄር ይመስገን፤

VERSE 2
ነፋስን ገስፆ ማዕበል አቁሞ ሚያሻግር
የዓለም ፈተና ቢበዛ እሱ መጠጊያችን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

VERSE 3
ዳግም እንዳንሞት በሞቱ ሞትን የረታልን
የምንመካበት ትንሣኤ ሰላምን ለሰጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን፤

VERSE 4
ከሲኦል እስራት ተፈተን ነጻ የወጣንበት
ሕይወትን ለሰጠን ለአምላካችን እንዘምር በእውነት
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን',
      lyrics_transliteration = 'Sile mayneger sit’otaw Egziabher yimsgen
Chel yalalen amlak singwaz maebelun aqwart’en
Sile mayneger sit’otaw agziabher yimesgen;

VERSE 1
Yehywet estnfas zerabn hiyaw endnhon
Yihn yaderege amlakachn Egziabher yemesgen
Sile mayneger sit’otaw egziabher yimesgen;

VERSE 2
Nefasn gests’o maebel aqumo miyashagr
Yealem fetena bibeza esu met’egiyachn
Sile mayneger sit’otaw Egziabher yemesgen

VERSE 3
Dagm endanmot bemotu motn yeretaln
Yemnmekabet tinsae selamn leset’en
Sile mayneger sit’otaw Egziabher yimesgen;

VERSE 4
Kesiol esrat tefeten nets’a yewet’anbet
Hiywetn leset’en leamlakachn enzemr beewnet
Sile mayneger sit’otaw Egziabher yemesgen',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ethiopian-orthodox-tewahdo-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤

VERSE 1
የሕይወት እስትንፋስ ዘራብን ሕያው እንድንሆን
ይህን ያደረገ አምላካችን እግዚአብሔር ይመስገን
ስለ ማይነገር ስጦታው እግዚአብሄር ይመስገን፤

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤

VERSE 2
ነፋስን ገስፆ ማዕበል አቁሞ ሚያሻግር
የዓለም ፈተና ቢበዛ እሱ መጠጊያችን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤

VERSE 3
ዳግም እንዳንሞት በሞቱ ሞትን የረታልን
የምንመካበት ትንሣኤ ሰላምን ለሰጠን
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን፤

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤

VERSE 4
ከሲኦል እስራት ተፈተን ነጻ የወጣንበት
ሕይወትን ለሰጠን ለአምላካችን እንዘምር በእውነት
ስለ ማይነገር ስጦታው እግዚአብሔር ይመስገን

CHORUS
ስለ ማይነገር ስጦታው እግዚአብሔር ይምስገን
ቸል ያላለን አምላክ ስንጓዝ ማዕበሉን አቋርጠን
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sile mayneger sit’otaw Egziabher yimsgen
Chel yalalen amlak singwaz maebelun aqwart’en
Sile mayneger sit’otaw agziabher yimesgen;

VERSE 1
Yehywet estnfas zerabn hiyaw endnhon
Yihn yaderege amlakachn Egziabher yemesgen
Sile mayneger sit’otaw egziabher yimesgen;

CHORUS
Sile mayneger sit’otaw Egziabher yimsgen
Chel yalalen amlak singwaz maebelun aqwart’en
Sile mayneger sit’otaw agziabher yimesgen;

VERSE 2
Nefasn gests’o maebel aqumo miyashagr
Yealem fetena bibeza esu met’egiyachn
Sile mayneger sit’otaw Egziabher yemesgen

CHORUS
Sile mayneger sit’otaw Egziabher yimsgen
Chel yalalen amlak singwaz maebelun aqwart’en
Sile mayneger sit’otaw agziabher yimesgen;

VERSE 3
Dagm endanmot bemotu motn yeretaln
Yemnmekabet tinsae selamn leset’en
Sile mayneger sit’otaw Egziabher yimesgen;

CHORUS
Sile mayneger sit’otaw Egziabher yimsgen
Chel yalalen amlak singwaz maebelun aqwart’en
Sile mayneger sit’otaw agziabher yimesgen;

VERSE 4
Kesiol esrat tefeten nets’a yewet’anbet
Hiywetn leset’en leamlakachn enzemr beewnet
Sile mayneger sit’otaw Egziabher yemesgen

CHORUS
Sile mayneger sit’otaw Egziabher yimsgen
Chel yalalen amlak singwaz maebelun aqwart’en
Sile mayneger sit’otaw agziabher yimesgen;'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ethiopian-orthodox-tewahdo-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ethiopian Orthodox Tewahdo Mezmur (ethiopian-orthodox-tewahdo-mezmur-1304)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ወምድርኒ ትገብር ፋሲካ
ተሐጺባ በደመ ክርስቶስ(፪)
ምድርም ፀዳች ሐሴት አደረገች
በክርስቶስ ደም በእውነት ታጠበች

VERSE 1
ወምድርኒ ትገብር ፋሲካ
ተሐጺባ በደመ ክርስቶስ(፪)
ምድርም ፀዳች ሐሴት አደረገች
በክርስቶስ ደም በእውነት ታጠበች',
      lyrics_transliteration = 'Wemdrni tigebr fasika
Tehets’iba bedeme Kristos (2)
Midrm ts’edach heset aderegech
BeKristos dem beewnet tat’ebech

VERSE 1
Wemdrni tigebr fasika
Tehets’iba bedeme Kristos (2)
Midrm ts’edach heset aderegech
BeKristos dem beewnet tat’ebech',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ethiopian-orthodox-tewahdo-mezmur-1304'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወምድርኒ ትገብር ፋሲካ
ተሐጺባ በደመ ክርስቶስ(፪)
ምድርም ፀዳች ሐሴት አደረገች
በክርስቶስ ደም በእውነት ታጠበች

VERSE 1
ወምድርኒ ትገብር ፋሲካ
ተሐጺባ በደመ ክርስቶስ(፪)
ምድርም ፀዳች ሐሴት አደረገች
በክርስቶስ ደም በእውነት ታጠበች

CHORUS
ወምድርኒ ትገብር ፋሲካ
ተሐጺባ በደመ ክርስቶስ(፪)
ምድርም ፀዳች ሐሴት አደረገች
በክርስቶስ ደም በእውነት ታጠበች'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wemdrni tigebr fasika
Tehets’iba bedeme Kristos (2)
Midrm ts’edach heset aderegech
BeKristos dem beewnet tat’ebech

VERSE 1
Wemdrni tigebr fasika
Tehets’iba bedeme Kristos (2)
Midrm ts’edach heset aderegech
BeKristos dem beewnet tat’ebech

CHORUS
Wemdrni tigebr fasika
Tehets’iba bedeme Kristos (2)
Midrm ts’edach heset aderegech
BeKristos dem beewnet tat’ebech'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ethiopian-orthodox-tewahdo-mezmur-1304', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ethiopian Orthodox Tewahdo Mezmur (ethiopian-orthodox-tewahdo-mezmur-1339)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በፈረሰው ቦታ የቆምክልኝ አባት
እንቅልፍ ማይወስድህ በቀንና ለሊት
እኔን ስትወደኝ ምን ይሆን ሚዛንህ
ይፈሳል እንባዬ ከልቤ ሳስብህ

VERSE 1
ይወርዳል እንባዬ ከልቤ ሳስብህ

VERSE 2
በአንባር ስትሸልመኝ በማርዳ ሳጌጥ
አዘጋጀልህኝ ወንበር ስቀመጥ
አንተ ብቻ እኮ ነህ የኔነቴ ፀሀይ
ያለ ወገን ሳለሁ ብቻዬን ምድር ላይ

VERSE 3
እንደ ባርያ ልሁን ልቤን ሳዘጋጀው
ድንቅ አባትነትህ ሰውነቴን ዋጀው
ልቤ ተደሰተ ሰርጌ ሆኔ ዛሬ
አልጠገብኩም ጌታ ዘምሬ ዘምሬ

VERSE 4
የክብርህን መዝገብ በሸክላ ያኖርከው
ልቤ ነደደብኝ እሳቱ ሲነካው
በዚህ ዓለም ሚዛን መች ትመዘናለህ
ብቸኛውን ምስኪን ሰው ታደረገዋለህ

VERSE 5
ጉብዝናዬን ወሰድ ነፍሴን ላፍስስልህ
በቀሪው ዘመኔ እንዳገለግልህ
ዘማሪ ነኝ እኔ የስምህ ምስክር
የወደድከኝ አምላክ ለዘላለም ክበር',
      lyrics_transliteration = 'Beferesew bota yeqomklgn abat
Enqlf maywesdh beqenna lelit
Enen sitwedegn min yihon mizanh
Yifesal enbaye kelbe sasbh

VERSE 1
Yiwerdal enbaye kelbe sasbh

VERSE 2
Beanbar sitshelmegn bemarda saget’
Azegajelhgn wenber siqemet’
Ante bicha eko neh yenenete ts’ehey
Yale wegen salehu bichayen midr lay

VERSE 3
Ende barya lihun liben sazegajew
Dinq abatneth sewneten wajew
Libe tedesete serge hone zare
Alt’egebkum Geta zemre zemre

VERSE 4
Yekbrhn mezgeb beshekla yanorkew
Libe nededebgn esatu sinekaw
Bezih alem mizan mech timezenaleh
Bichegnawn miskin sew taderegewaleh

VERSE 5
Gubznayen wesed nefsen lafsslh
Beqeriw zemene endageleglh
Zemari negn ene yesmh miskr
Yewededkegn amlak lezelalem kiber',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ethiopian-orthodox-tewahdo-mezmur-1339'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በፈረሰው ቦታ የቆምክልኝ አባት
እንቅልፍ ማይወስድህ በቀንና ለሊት
እኔን ስትወደኝ ምን ይሆን ሚዛንህ
ይፈሳል እንባዬ ከልቤ ሳስብህ

VERSE 1
ይወርዳል እንባዬ ከልቤ ሳስብህ

CHORUS
በፈረሰው ቦታ የቆምክልኝ አባት
እንቅልፍ ማይወስድህ በቀንና ለሊት
እኔን ስትወደኝ ምን ይሆን ሚዛንህ
ይፈሳል እንባዬ ከልቤ ሳስብህ

VERSE 2
በአንባር ስትሸልመኝ በማርዳ ሳጌጥ
አዘጋጀልህኝ ወንበር ስቀመጥ
አንተ ብቻ እኮ ነህ የኔነቴ ፀሀይ
ያለ ወገን ሳለሁ ብቻዬን ምድር ላይ

CHORUS
በፈረሰው ቦታ የቆምክልኝ አባት
እንቅልፍ ማይወስድህ በቀንና ለሊት
እኔን ስትወደኝ ምን ይሆን ሚዛንህ
ይፈሳል እንባዬ ከልቤ ሳስብህ

VERSE 3
እንደ ባርያ ልሁን ልቤን ሳዘጋጀው
ድንቅ አባትነትህ ሰውነቴን ዋጀው
ልቤ ተደሰተ ሰርጌ ሆኔ ዛሬ
አልጠገብኩም ጌታ ዘምሬ ዘምሬ

CHORUS
በፈረሰው ቦታ የቆምክልኝ አባት
እንቅልፍ ማይወስድህ በቀንና ለሊት
እኔን ስትወደኝ ምን ይሆን ሚዛንህ
ይፈሳል እንባዬ ከልቤ ሳስብህ

VERSE 4
የክብርህን መዝገብ በሸክላ ያኖርከው
ልቤ ነደደብኝ እሳቱ ሲነካው
በዚህ ዓለም ሚዛን መች ትመዘናለህ
ብቸኛውን ምስኪን ሰው ታደረገዋለህ

CHORUS
በፈረሰው ቦታ የቆምክልኝ አባት
እንቅልፍ ማይወስድህ በቀንና ለሊት
እኔን ስትወደኝ ምን ይሆን ሚዛንህ
ይፈሳል እንባዬ ከልቤ ሳስብህ

VERSE 5
ጉብዝናዬን ወሰድ ነፍሴን ላፍስስልህ
በቀሪው ዘመኔ እንዳገለግልህ
ዘማሪ ነኝ እኔ የስምህ ምስክር
የወደድከኝ አምላክ ለዘላለም ክበር

CHORUS
በፈረሰው ቦታ የቆምክልኝ አባት
እንቅልፍ ማይወስድህ በቀንና ለሊት
እኔን ስትወደኝ ምን ይሆን ሚዛንህ
ይፈሳል እንባዬ ከልቤ ሳስብህ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beferesew bota yeqomklgn abat
Enqlf maywesdh beqenna lelit
Enen sitwedegn min yihon mizanh
Yifesal enbaye kelbe sasbh

VERSE 1
Yiwerdal enbaye kelbe sasbh

CHORUS
Beferesew bota yeqomklgn abat
Enqlf maywesdh beqenna lelit
Enen sitwedegn min yihon mizanh
Yifesal enbaye kelbe sasbh

VERSE 2
Beanbar sitshelmegn bemarda saget’
Azegajelhgn wenber siqemet’
Ante bicha eko neh yenenete ts’ehey
Yale wegen salehu bichayen midr lay

CHORUS
Beferesew bota yeqomklgn abat
Enqlf maywesdh beqenna lelit
Enen sitwedegn min yihon mizanh
Yifesal enbaye kelbe sasbh

VERSE 3
Ende barya lihun liben sazegajew
Dinq abatneth sewneten wajew
Libe tedesete serge hone zare
Alt’egebkum Geta zemre zemre

CHORUS
Beferesew bota yeqomklgn abat
Enqlf maywesdh beqenna lelit
Enen sitwedegn min yihon mizanh
Yifesal enbaye kelbe sasbh

VERSE 4
Yekbrhn mezgeb beshekla yanorkew
Libe nededebgn esatu sinekaw
Bezih alem mizan mech timezenaleh
Bichegnawn miskin sew taderegewaleh

CHORUS
Beferesew bota yeqomklgn abat
Enqlf maywesdh beqenna lelit
Enen sitwedegn min yihon mizanh
Yifesal enbaye kelbe sasbh

VERSE 5
Gubznayen wesed nefsen lafsslh
Beqeriw zemene endageleglh
Zemari negn ene yesmh miskr
Yewededkegn amlak lezelalem kiber

CHORUS
Beferesew bota yeqomklgn abat
Enqlf maywesdh beqenna lelit
Enen sitwedegn min yihon mizanh
Yifesal enbaye kelbe sasbh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ethiopian-orthodox-tewahdo-mezmur-1339', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ethiopian Orthodox Tewahdo Mezmur (ethiopian-orthodox-tewahdo-mezmur-1347)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 1
አይ የእርሱ ሥራ የእርሱ ደግነት
በየትኛው ቋንቋ ልመስክረለት
ክብሩን እያሰብኩ ልዘምርለት:
የልቤን መሻት ፈፅሞልኛል

VERSE 2
ይክበር አምላኬ እኔን ወዶኛል:
ዘመኔን ሁሉ እጠራዋለሁ
ምስጋናን እንጂ ምን እሰዋለሁ::

VERSE 3
ጨለማው ዓለም ብርሃን ሆነ
ጌታ በልቤ ገብቶ ገነነ
ሞቴን በሕይወት እየሸፈነ:
ባሪያ አደለሁም ልጁ ነኝ ዛሬ

VERSE 4
ያስጐነበሰኝ የለም ቀንበሬ:
ተድላና ደስታን ሞላኝ ጌታዬ
የአፌ ምስጋና ውዴ ዜማዬ::

VERSE 5
መራራው ኑሮ በእሱ ጣፈጠ
ሳበኝ በፍቅሩ ልቤ ቀለጠ
አዲስ አረገኝ እየለወጠ:
ቸር ነው መሃሪ በቀል የለበት

VERSE 6
ሁሉን ያዳነ በተገኘበት:
ምን ይመልሰዋል ገጹ ምህረቱን
ዓይኔም አየችው አዳኝነቱን::

VERSE 7
ከጠላት ፍርሃት ነፍሴን አድኖ
በፀጋው ግምጃ በደሌን ከድኖ
ከጐኔ ቆሟል ታዳጌ ሆኖ:
መታመኛዬ ኃይሌ ጉልበቴ

VERSE 8
የማይደፈር አለት ነው ቤቴ:
ይክብር አምላኬ በዘመን ሁሉ
የሚወዱትም አሜን! ይበሉ::',
      lyrics_transliteration = 'Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 1
Ay yeersu sira yeersu degnet
Beyetgnaw qwanqwa limeskrelet
Kibrun eyasebku lizemrlet:
Yelben meshat fets’molgnal

VERSE 2
Yikber amlake enen wedognal:
Zemenen hulu et’erawalehu
Misganan enji min esewalehu::

VERSE 3
Ch’elemaw alem birhan hone
Geta belbe gebto genene
Moten behywet eyeshefene:
Bariya adelehum liju negn zare

VERSE 4
Yasgwenebesegn yelem qenbere:
Tedlana destan molagn Getaye
Yeafe misgana wide zemaye::

VERSE 5
Meraraw nuro beesu t’afet’e
Sabegn befqru libe qelet’e
Adis aregegn eyelewet’e:
Cher new mehari beqel yelebet

VERSE 6
Hulun yadane betegegnebet:
Min yimelsewal gets’u mihretun
Aynem ayechw adagnnetun::

VERSE 7
Ket’elat firhat nefsen adno
Bets’egaw gimja bedelen kedno
Kegwene qomwal tadage hono:
Metamegnaye hayle gulbete

VERSE 8
Yemaydefer alet new bete:
Yikbr amlake bezemen hulu
Yemiwedutm Amen! yibelu::',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ethiopian-orthodox-tewahdo-mezmur-1347'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 1
አይ የእርሱ ሥራ የእርሱ ደግነት
በየትኛው ቋንቋ ልመስክረለት
ክብሩን እያሰብኩ ልዘምርለት:
የልቤን መሻት ፈፅሞልኛል

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 2
ይክበር አምላኬ እኔን ወዶኛል:
ዘመኔን ሁሉ እጠራዋለሁ
ምስጋናን እንጂ ምን እሰዋለሁ::

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 3
ጨለማው ዓለም ብርሃን ሆነ
ጌታ በልቤ ገብቶ ገነነ
ሞቴን በሕይወት እየሸፈነ:
ባሪያ አደለሁም ልጁ ነኝ ዛሬ

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 4
ያስጐነበሰኝ የለም ቀንበሬ:
ተድላና ደስታን ሞላኝ ጌታዬ
የአፌ ምስጋና ውዴ ዜማዬ::

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 5
መራራው ኑሮ በእሱ ጣፈጠ
ሳበኝ በፍቅሩ ልቤ ቀለጠ
አዲስ አረገኝ እየለወጠ:
ቸር ነው መሃሪ በቀል የለበት

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 6
ሁሉን ያዳነ በተገኘበት:
ምን ይመልሰዋል ገጹ ምህረቱን
ዓይኔም አየችው አዳኝነቱን::

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 7
ከጠላት ፍርሃት ነፍሴን አድኖ
በፀጋው ግምጃ በደሌን ከድኖ
ከጐኔ ቆሟል ታዳጌ ሆኖ:
መታመኛዬ ኃይሌ ጉልበቴ

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/

VERSE 8
የማይደፈር አለት ነው ቤቴ:
ይክብር አምላኬ በዘመን ሁሉ
የሚወዱትም አሜን! ይበሉ::

CHORUS
ምን ብዬ የእርሱን ደግነት ልናገር
ወዶኛል ከሁሉ አብልጦ እግዚአብሔር:
ተመስገን ክበር ዘለዓለም ልበለው
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 1
Ay yeersu sira yeersu degnet
Beyetgnaw qwanqwa limeskrelet
Kibrun eyasebku lizemrlet:
Yelben meshat fets’molgnal

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 2
Yikber amlake enen wedognal:
Zemenen hulu et’erawalehu
Misganan enji min esewalehu::

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 3
Ch’elemaw alem birhan hone
Geta belbe gebto genene
Moten behywet eyeshefene:
Bariya adelehum liju negn zare

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 4
Yasgwenebesegn yelem qenbere:
Tedlana destan molagn Getaye
Yeafe misgana wide zemaye::

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 5
Meraraw nuro beesu t’afet’e
Sabegn befqru libe qelet’e
Adis aregegn eyelewet’e:
Cher new mehari beqel yelebet

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 6
Hulun yadane betegegnebet:
Min yimelsewal gets’u mihretun
Aynem ayechw adagnnetun::

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 7
Ket’elat firhat nefsen adno
Bets’egaw gimja bedelen kedno
Kegwene qomwal tadage hono:
Metamegnaye hayle gulbete

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/

VERSE 8
Yemaydefer alet new bete:
Yikbr amlake bezemen hulu
Yemiwedutm Amen! yibelu::

CHORUS
Min biye yeersun degnet linager
Wedognal kehulu ablt’o Egziabher:
Temesgen kiber zelealem libelew
Amlake yaderegelgn bizu new:: /2x/'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ethiopian-orthodox-tewahdo-mezmur-1347', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ethiopian OrtodoxTewahido mezmur Zemary Abel mekbib agatami aydelem (ethiopian-ortodoxtewahido-mezmur-zemary-abel-mekbib-agatami-aydelem)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 1
ማን ነው በዛ በረሃ ያበላኝ መና ያጠጣኝ ውሃ
ማን ነው የደገፈኝ ጥልቁን ሸለቆ ያሻገረኝ
አንተ ነህ ለእኔ እናት አባቴ
ንጹህ ወዳጄ ስጋ እና አጥንቴ

VERSE 2
አይኔ አይነቀል ከዙፋንህ
ፊት አያዞርም ፍቅር አይንህ

VERSE 3
ወሮኝ ድቅድቅ ጨለማ
ተስፋዬ ከስሞ ልቤ ሲደማ
አይቶኝ ሲፈስ እንባዬ
ደመና ጠቅሶ መጣ ጌታዬ

VERSE 4
ፀሀይ ነው እና የብርሃን አምዴ
ኢየሱስ ለእኔ ህይወት መንገዴ
አልተሸነፍኩም ውዴ አግዞኛል
መቃብር ከፍሎ ህይወት ሰጥቶኛል

VERSE 5
ሲለይ ነፍሴ ከስጋ በጨለማ ቀን በክፉ አደጋ
ዳንኩኝ ሞት እያየኝ የንሰሃ እድሜ ጨመረልኝ
በጽድቄ አይደለም የተረፍኩት
በእሱ ፍቅር ነው በእሱ ምህረት

VERSE 6
ብቻዬን ሆኘ ሁሌ የማለቅሰው
እየበደልኩት ስላዳነኝ ነው

VERSE 7
ሞት ሆይ መውጊያ የታለ
ብሎ ጥሎኃል እየታገለ
ሲኦል ድል መግዛትህ
ባዶ ቀርተሃል ተበዝብዘህ

VERSE 8
በእራሱ መንግስት ፈጥሮኝ በዓላማ
የልጁን ህይወት ማንም አይቀማ
መቃብር ያርፋል በአገልግሎቴ
ተከፍቶልኛል ደጁ የአባቴ',
      lyrics_transliteration = 'Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 1
Man new beza bereha yabelagn mena yat’et’agn wiha
Man new yedegefegn t’lqun sheleqo yashageregn
Ante neh leene enat abate
Nits’uh wedaje siga ena at’nte

VERSE 2
Ayne ayneqel kezufanh
Fit ayazorm fiqr aynh

VERSE 3
Werogn diqdq ch’elema
Tesfaye kesmo libe sidema
Aytogn sifes enbaye
Demena t’eqso met’a Getaye

VERSE 4
Ts’ehey new ena yebrhan amde
Iyesus leene hiywet mengede
Alteshenefkum wide agzognal
Meqabr keflo hiywet set’tognal

VERSE 5
Siley nefse kesga bech’elema qen bekfu adega
Dankugn mot eyayegn yenseha edme ch’emerelgn
Bets’dqe aydelem yeterefkut
Beesu fiqr new beesu mihret

VERSE 6
Bichayen hogne hule yemaleqsew
Eyebedelkut siladanegn new

VERSE 7
Mot hoy mewgiya yetale
Bilo t’lohal eyetagele
Siol dil megzath
Bado qertehal tebezbzeh

VERSE 8
Beerasu mengst fet’rogn bealama
Yeljun hiywet manm ayqema
Meqabr yarfal beagelglote
Tekeftolgnal deju yeabate',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ethiopian-ortodoxtewahido-mezmur-zemary-abel-mekbib-agatami-aydelem'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 1
ማን ነው በዛ በረሃ ያበላኝ መና ያጠጣኝ ውሃ
ማን ነው የደገፈኝ ጥልቁን ሸለቆ ያሻገረኝ
አንተ ነህ ለእኔ እናት አባቴ
ንጹህ ወዳጄ ስጋ እና አጥንቴ

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 2
አይኔ አይነቀል ከዙፋንህ
ፊት አያዞርም ፍቅር አይንህ

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 3
ወሮኝ ድቅድቅ ጨለማ
ተስፋዬ ከስሞ ልቤ ሲደማ
አይቶኝ ሲፈስ እንባዬ
ደመና ጠቅሶ መጣ ጌታዬ

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 4
ፀሀይ ነው እና የብርሃን አምዴ
ኢየሱስ ለእኔ ህይወት መንገዴ
አልተሸነፍኩም ውዴ አግዞኛል
መቃብር ከፍሎ ህይወት ሰጥቶኛል

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 5
ሲለይ ነፍሴ ከስጋ በጨለማ ቀን በክፉ አደጋ
ዳንኩኝ ሞት እያየኝ የንሰሃ እድሜ ጨመረልኝ
በጽድቄ አይደለም የተረፍኩት
በእሱ ፍቅር ነው በእሱ ምህረት

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 6
ብቻዬን ሆኘ ሁሌ የማለቅሰው
እየበደልኩት ስላዳነኝ ነው

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 7
ሞት ሆይ መውጊያ የታለ
ብሎ ጥሎኃል እየታገለ
ሲኦል ድል መግዛትህ
ባዶ ቀርተሃል ተበዝብዘህ

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ

VERSE 8
በእራሱ መንግስት ፈጥሮኝ በዓላማ
የልጁን ህይወት ማንም አይቀማ
መቃብር ያርፋል በአገልግሎቴ
ተከፍቶልኛል ደጁ የአባቴ

CHORUS
አጋጣሚ አይደለም መትረፌ መዳኔ
የጌታ ተአምር ነው እረ ይገርማል የእኔ
ሞት እንቅልፍ ሆነልኝ ጭንቀቴ ቀለለ
የረዳኝ ጌታ ነው ውዴ እየተከተለ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 1
Man new beza bereha yabelagn mena yat’et’agn wiha
Man new yedegefegn t’lqun sheleqo yashageregn
Ante neh leene enat abate
Nits’uh wedaje siga ena at’nte

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 2
Ayne ayneqel kezufanh
Fit ayazorm fiqr aynh

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 3
Werogn diqdq ch’elema
Tesfaye kesmo libe sidema
Aytogn sifes enbaye
Demena t’eqso met’a Getaye

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 4
Ts’ehey new ena yebrhan amde
Iyesus leene hiywet mengede
Alteshenefkum wide agzognal
Meqabr keflo hiywet set’tognal

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 5
Siley nefse kesga bech’elema qen bekfu adega
Dankugn mot eyayegn yenseha edme ch’emerelgn
Bets’dqe aydelem yeterefkut
Beesu fiqr new beesu mihret

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 6
Bichayen hogne hule yemaleqsew
Eyebedelkut siladanegn new

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 7
Mot hoy mewgiya yetale
Bilo t’lohal eyetagele
Siol dil megzath
Bado qertehal tebezbzeh

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele

VERSE 8
Beerasu mengst fet’rogn bealama
Yeljun hiywet manm ayqema
Meqabr yarfal beagelglote
Tekeftolgnal deju yeabate

CHORUS
Agat’ami aydelem metrefe medane
Yegeta teamr new ere yigermal yeene
Mot enqlf honelgn ch’nqete qelele
Yeredagn Geta new wide eyeteketele'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ethiopian-ortodoxtewahido-mezmur-zemary-abel-mekbib-agatami-aydelem', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ewinet Beewinet (ewinet-beewinet)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2x/
በሞቱ አጥፍቶ ሙስና መቃብር

VERSE 1
የሙታን በኩር ሆኖ ተነሥቷል ጌታችን /2x/
ሳጥን ቢደረደር አፈር ቢረበረብ
ድንጋይ በድንጋይ ላይ ደሞም ቢደራረብ

VERSE 2
ምድር አልቻለችም አምላኳን ለመቅበር
የንጉሦች ንጉሥ ሰማያዊ አንበሳ
ሞትን ድል አድርጎ በሰንበት ተነሣ /2x/

VERSE 3
ተቀድሰናል በጌታችን ደም
ፍቅሩንም የሰጠን እንደርሱ የለም
ሕያው ነው የሚኖር ለዘለዓለም

VERSE 4
አዝ/2x/',
      lyrics_transliteration = 'Ewnet beewnet Geta tenestwal
Tenestwal bekbr
Motn dil adrgwal /2x/
Bemotu at’fto musna meqabr

VERSE 1
Yemutan bekur hono tenestwal Getachen /2x/
Sat’n bidereder afer birebereb
Dingay bedngay lay demom biderareb

VERSE 2
Midr alchalechm amlakwan lemeqber
Yengusoch nigus semayawi anbesa
Motn dil adrgo besenbet tenesa /2x/

VERSE 3
Teqedsenal begetachn dem
Fiqrunm yeset’en endersu yelem
Hiyaw new yeminor lezelealem

VERSE 4',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ewinet-beewinet'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2x/
በሞቱ አጥፍቶ ሙስና መቃብር

VERSE 1
የሙታን በኩር ሆኖ ተነሥቷል ጌታችን /2x/
አዝ
ሳጥን ቢደረደር አፈር ቢረበረብ
ድንጋይ በድንጋይ ላይ ደሞም ቢደራረብ

CHORUS
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2x/
በሞቱ አጥፍቶ ሙስና መቃብር

VERSE 2
ምድር አልቻለችም አምላኳን ለመቅበር
አዝ
የንጉሦች ንጉሥ ሰማያዊ አንበሳ
ሞትን ድል አድርጎ በሰንበት ተነሣ /2x/

CHORUS
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2x/
በሞቱ አጥፍቶ ሙስና መቃብር

VERSE 3
አዝ
ተቀድሰናል በጌታችን ደም
ፍቅሩንም የሰጠን እንደርሱ የለም
ሕያው ነው የሚኖር ለዘለዓለም

CHORUS
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2x/
በሞቱ አጥፍቶ ሙስና መቃብር

VERSE 4
አዝ/2x/

CHORUS
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2x/
በሞቱ አጥፍቶ ሙስና መቃብር'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ewnet beewnet Geta tenestwal
Tenestwal bekbr
Motn dil adrgwal /2x/
Bemotu at’fto musna meqabr

VERSE 1
Yemutan bekur hono tenestwal Getachen /2x/
CHORUS
Sat’n bidereder afer birebereb
Dingay bedngay lay demom biderareb

CHORUS
Ewnet beewnet Geta tenestwal
Tenestwal bekbr
Motn dil adrgwal /2x/
Bemotu at’fto musna meqabr

VERSE 2
Midr alchalechm amlakwan lemeqber
CHORUS
Yengusoch nigus semayawi anbesa
Motn dil adrgo besenbet tenesa /2x/

CHORUS
Ewnet beewnet Geta tenestwal
Tenestwal bekbr
Motn dil adrgwal /2x/
Bemotu at’fto musna meqabr

VERSE 3
CHORUS
Teqedsenal begetachn dem
Fiqrunm yeset’en endersu yelem
Hiyaw new yeminor lezelealem

CHORUS
Ewnet beewnet Geta tenestwal
Tenestwal bekbr
Motn dil adrgwal /2x/
Bemotu at’fto musna meqabr

VERSE 4
CHORUS

CHORUS
Ewnet beewnet Geta tenestwal
Tenestwal bekbr
Motn dil adrgwal /2x/
Bemotu at’fto musna meqabr'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ewinet-beewinet', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ewinetegna Selam Yalew Kebetih New (ewinetegna-selam-yalew-kebetih-new)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እውነተኛ ሠላም ያለው ከቤትህ ነው
እርዳኝ አልናወፅ እልምንሀለው
.
ኃጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 1
ካንተ መለየቴን ነፍሴን አድክሟታል
ወዳንተ መልሰኝ እኔ እመለሳለሁ
እውነተኝ ሠላም ያለው ከቤትህ ነው
ለቅዳሤው ፀሎት ዘውትር እንዳልተጋሁ

VERSE 2
በአደባባይ ቁሜ ስምክን እንዳልጠራሁ
ተሰናክየ ወድቄአለሁና
እርዳኝ አማኑኤል በሃይማኖት ልፅና
ዓይኔ እንባን ያመንጭ ላልቅስ ስለኃጢያቴ

VERSE 3
የንስሐ ትኹን ቀሪዋ ሕይወቴ
የመዳኔ ሰዓት በዛሪዋ ዕለት
ፍቅርህን አስቤ መጣሁ ካንተ ፊት
ጌታ ሆይ ፅፅቴን እንባየን ተቀበል

VERSE 4
አባትህ ነኝ በለኝ እኔም ልጅ ነኝ ልበል
ዘይት ሳላዘጋጅ ድንገት መጥተህብኝ
በርህን በመዝጋት ከደጅ አታስቀረኝ',
      lyrics_transliteration = 'Ewnetegna selam yalew kebeth new
Erdagn alnawets’ elmnhelew
.
Hat’iyaten sasbew libe yich’eneqal

VERSE 1
Kante meleyeten nefsen adkmwatal
Wedante melsegn ene emelesalehu
Ewnetegn selam yalew kebeth new
Leqdasew ts’elot zewtr endaltegahu

VERSE 2
Beadebabay qume simkn endalt’erahu
Tesenakye wedqealehuna
Erdagn Amanuel behaymanot lits’na
Ayne enban yamench’ lalqs silehat’iyate

VERSE 3
Yenshe tiኹn qeriwa hiywete
Yemedane seat bezariwa elet
Fiqrhn asbe met’ahu kante fit
Geta hoy ts’ts’ten enbayen teqebel

VERSE 4
Abath negn belegn enem lij negn libel
Zeyt salazegaj dinget met’tehbgn
Berhn bemezgat kedej atasqeregn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ewinetegna-selam-yalew-kebetih-new'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እውነተኛ ሠላም ያለው ከቤትህ ነው
እርዳኝ አልናወፅ እልምንሀለው
.
ኃጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 1
ካንተ መለየቴን ነፍሴን አድክሟታል
ወዳንተ መልሰኝ እኔ እመለሳለሁ
እውነተኝ ሠላም ያለው ከቤትህ ነው
ለቅዳሤው ፀሎት ዘውትር እንዳልተጋሁ

CHORUS
እውነተኛ ሠላም ያለው ከቤትህ ነው
እርዳኝ አልናወፅ እልምንሀለው
.
ኃጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 2
በአደባባይ ቁሜ ስምክን እንዳልጠራሁ
ተሰናክየ ወድቄአለሁና
እርዳኝ አማኑኤል በሃይማኖት ልፅና
ዓይኔ እንባን ያመንጭ ላልቅስ ስለኃጢያቴ

CHORUS
እውነተኛ ሠላም ያለው ከቤትህ ነው
እርዳኝ አልናወፅ እልምንሀለው
.
ኃጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 3
የንስሐ ትኹን ቀሪዋ ሕይወቴ
የመዳኔ ሰዓት በዛሪዋ ዕለት
ፍቅርህን አስቤ መጣሁ ካንተ ፊት
ጌታ ሆይ ፅፅቴን እንባየን ተቀበል

CHORUS
እውነተኛ ሠላም ያለው ከቤትህ ነው
እርዳኝ አልናወፅ እልምንሀለው
.
ኃጢያቴን ሳስበው ልቤ ይጨነቃል

VERSE 4
አባትህ ነኝ በለኝ እኔም ልጅ ነኝ ልበል
ዘይት ሳላዘጋጅ ድንገት መጥተህብኝ
በርህን በመዝጋት ከደጅ አታስቀረኝ

CHORUS
እውነተኛ ሠላም ያለው ከቤትህ ነው
እርዳኝ አልናወፅ እልምንሀለው
.
ኃጢያቴን ሳስበው ልቤ ይጨነቃል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ewnetegna selam yalew kebeth new
Erdagn alnawets’ elmnhelew
.
Hat’iyaten sasbew libe yich’eneqal

VERSE 1
Kante meleyeten nefsen adkmwatal
Wedante melsegn ene emelesalehu
Ewnetegn selam yalew kebeth new
Leqdasew ts’elot zewtr endaltegahu

CHORUS
Ewnetegna selam yalew kebeth new
Erdagn alnawets’ elmnhelew
.
Hat’iyaten sasbew libe yich’eneqal

VERSE 2
Beadebabay qume simkn endalt’erahu
Tesenakye wedqealehuna
Erdagn Amanuel behaymanot lits’na
Ayne enban yamench’ lalqs silehat’iyate

CHORUS
Ewnetegna selam yalew kebeth new
Erdagn alnawets’ elmnhelew
.
Hat’iyaten sasbew libe yich’eneqal

VERSE 3
Yenshe tiኹn qeriwa hiywete
Yemedane seat bezariwa elet
Fiqrhn asbe met’ahu kante fit
Geta hoy ts’ts’ten enbayen teqebel

CHORUS
Ewnetegna selam yalew kebeth new
Erdagn alnawets’ elmnhelew
.
Hat’iyaten sasbew libe yich’eneqal

VERSE 4
Abath negn belegn enem lij negn libel
Zeyt salazegaj dinget met’tehbgn
Berhn bemezgat kedej atasqeregn

CHORUS
Ewnetegna selam yalew kebeth new
Erdagn alnawets’ elmnhelew
.
Hat’iyaten sasbew libe yich’eneqal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ewinetegna-selam-yalew-kebetih-new', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eyehonikegn Anite Moges (eyehonikegn-anite-moges)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 1
ድል አደርጋለሁኝ ያንተን ስም ታጥቄ
በአንተ እየተደገፍኩ አላቅም ወድቄ
ታየኛለህ ዘወትር አየሳሳ በፍቅር
ሐዋርያው ዮሐንስ አባትና መምህር

VERSE 2
፨እየሆንከኝ አንተ ሞገስ
፨አሳደከኝ በመቅደስ
፨አባቴ ነህ የምትራራ
፨በስምህ የምጠራ

VERSE 3
ተሰማ እልልታ ደምፅ መዝሙር በድንኳኔ
ምልጃህ ኃይል አረገች ሞገስ ሆነች ለኔ
የልቤ መፅናኛ ጊዜ አይተህ ማትከዳ
ታትመህ የምትኖር በልቤ ሰሌዳ

VERSE 4
፨እየሆንከኝ አንተ ሞገስ
፨አሳደከኝ በመቅደስ
፨አባቴ ነህ የምትራራ
፨በስምህ የምጠራ

VERSE 5
ቃላት ያንሱብኛል ለምስጋናህ ቅኔ
በምንስ አቅሜ ነው ምቀኝልህ እኔ
ወልደ ነጎድጓድ ሆይ የነፍሴ ደስታ
አቀርብልሀለሁ ከፍ ያለ እልልታ

VERSE 6
፨እየሆንከኝ አንተ ሞገስ
፨አሳደከኝ በመቅደስ
፨አባቴ ነህ የምትራራ
፨በስምህ የምጠራ

VERSE 7
ወንጌልን መግበህ አሳደከኝ ደጅህ
ተጠብቄ ኖርኩኝ ተመግቤ ከእጅህ
የቤቴ ሰላም ነህ መሪ የህይወቴ
ፍቁረ እግዚእ ዮሐንስ ልዩ ነህ አባቴ

VERSE 8
፨እየሆንከኝ አንተ ሞገስ
፨አሳደከኝ በመቅደስ
፨አባቴ ነህ የምትራራ
፨በስምህ የምጠራ',
      lyrics_transliteration = 'Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 1
Dil adergalehugn yanten sim tat’qe
Beante eyetedegefku alaqm wedqe
Tayegnaleh zewetr ayesasa befqr
Hewaryaw yohens abatna memhr

VERSE 2
Eyehonkegn ante moges
Asadekegn bemeqdes
Abate neh yemtrara
Besmh yemt’era

VERSE 3
Tesema ellta demts’ mezmur bednkwane
Miljah hayl aregech moges honech lene
Yelbe mets’nagna gize ayteh matkeda
Tatmeh yemtnor belbe seleda

VERSE 4
Eyehonkegn ante moges
Asadekegn bemeqdes
Abate neh yemtrara
Besmh yemt’era

VERSE 5
Qalat yansubgnal lemsganah qine
Bemns aqme new miqegnlh ene
Welde negodgwad hoy yenefse desta
Aqerblhelehu kef yale ellta

VERSE 6
Eyehonkegn ante moges
Asadekegn bemeqdes
Abate neh yemtrara
Besmh yemt’era

VERSE 7
Wengeln megbeh asadekegn dejh
Tet’ebqe norkugn temegbe keejh
Yebete selam neh meri yehywete
Fiqure egzie yohens liyu neh abate

VERSE 8
Eyehonkegn ante moges
Asadekegn bemeqdes
Abate neh yemtrara
Besmh yemt’era',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eyehonikegn-anite-moges'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 1
ድል አደርጋለሁኝ ያንተን ስም ታጥቄ
በአንተ እየተደገፍኩ አላቅም ወድቄ
ታየኛለህ ዘወትር አየሳሳ በፍቅር
ሐዋርያው ዮሐንስ አባትና መምህር

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 2
፨እየሆንከኝ አንተ ሞገስ
፨አሳደከኝ በመቅደስ
፨አባቴ ነህ የምትራራ
፨በስምህ የምጠራ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 3
ተሰማ እልልታ ደምፅ መዝሙር በድንኳኔ
ምልጃህ ኃይል አረገች ሞገስ ሆነች ለኔ
የልቤ መፅናኛ ጊዜ አይተህ ማትከዳ
ታትመህ የምትኖር በልቤ ሰሌዳ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 4
፨እየሆንከኝ አንተ ሞገስ
፨አሳደከኝ በመቅደስ
፨አባቴ ነህ የምትራራ
፨በስምህ የምጠራ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 5
ቃላት ያንሱብኛል ለምስጋናህ ቅኔ
በምንስ አቅሜ ነው ምቀኝልህ እኔ
ወልደ ነጎድጓድ ሆይ የነፍሴ ደስታ
አቀርብልሀለሁ ከፍ ያለ እልልታ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 6
፨እየሆንከኝ አንተ ሞገስ
፨አሳደከኝ በመቅደስ
፨አባቴ ነህ የምትራራ
፨በስምህ የምጠራ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 7
ወንጌልን መግበህ አሳደከኝ ደጅህ
ተጠብቄ ኖርኩኝ ተመግቤ ከእጅህ
የቤቴ ሰላም ነህ መሪ የህይወቴ
ፍቁረ እግዚእ ዮሐንስ ልዩ ነህ አባቴ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ

VERSE 8
፨እየሆንከኝ አንተ ሞገስ
፨አሳደከኝ በመቅደስ
፨አባቴ ነህ የምትራራ
፨በስምህ የምጠራ

CHORUS
አቡቀለምሲስ ፤ ዮሐንስ
ወልደ ነጎድጓድ ፤ ታኦሎጎስ
ያረክልኝን አልጨርስ ዘርዝሬ
ዮሐንስ ነህ ክብሬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 1
Dil adergalehugn yanten sim tat’qe
Beante eyetedegefku alaqm wedqe
Tayegnaleh zewetr ayesasa befqr
Hewaryaw yohens abatna memhr

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 2
Eyehonkegn ante moges
Asadekegn bemeqdes
Abate neh yemtrara
Besmh yemt’era

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 3
Tesema ellta demts’ mezmur bednkwane
Miljah hayl aregech moges honech lene
Yelbe mets’nagna gize ayteh matkeda
Tatmeh yemtnor belbe seleda

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 4
Eyehonkegn ante moges
Asadekegn bemeqdes
Abate neh yemtrara
Besmh yemt’era

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 5
Qalat yansubgnal lemsganah qine
Bemns aqme new miqegnlh ene
Welde negodgwad hoy yenefse desta
Aqerblhelehu kef yale ellta

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 6
Eyehonkegn ante moges
Asadekegn bemeqdes
Abate neh yemtrara
Besmh yemt’era

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 7
Wengeln megbeh asadekegn dejh
Tet’ebqe norkugn temegbe keejh
Yebete selam neh meri yehywete
Fiqure egzie yohens liyu neh abate

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre

VERSE 8
Eyehonkegn ante moges
Asadekegn bemeqdes
Abate neh yemtrara
Besmh yemt’era

CHORUS
Abuqelemsis ; yohens
Welde negodgwad ; taologos
Yareklgnn alch’ers zerzre
Yohens neh kibre'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eyehonikegn-anite-moges', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eyesefa Eyebeza Fikiru (eyesefa-eyebeza-fikiru)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ

VERSE 1
ሳይፈርድብን እንደበደላችን
ሳያጠፋን ፈጥኖ በሀጢያታችን
በምሕረቱ ብዛት ጎበኘን
በማያልቀው ፍቅሩ እያየን

VERSE 2
ስንጠይቀው አብዝቶ እየሰጠ
ስናንኳኳ በር እየከፈተ
ይሰማናል እሱ ደግ ነው
ሳይከለክል ጌታ ሰጪ ነው

VERSE 3
በቃ ሲባል ይኸው አስቀጠለን
የኃጢአትን ሸክም እያቀለለ
በንስሐ አዲስ አድርጎናል
ስንመለስ ተቀብሎናል

VERSE 4
አልተወንም ስለ ቅዱስ ስሙ
ጠብቆናል በጽኑዕ ሰላሙ
ከርኅራኄው ብዛት የተነሳ
የመከራው ዘመን ተረሳ',
      lyrics_transliteration = 'Eyesefa eyebeza fiqru
Kellonal keseyf ket’oru
Tet’ellen bemayzl medafu
Sint mealt sint lelit alefu

VERSE 1
Sayferdbn endebedelachn
Sayat’efan fet’no behet’iyatachn
Bemhretu bizat gobegnen
Bemayalqew fiqru eyayen

VERSE 2
Sint’eyqew abzto eyeset’e
Sinankwakwa ber eyekefete
Yisemanal esu deg new
Saykelekl Geta sech’i new

VERSE 3
Beqa sibal yiኸw asqet’elen
Yehat’iatn shekm eyaqelele
Benshe adis adrgonal
Sinmeles teqeblonal

VERSE 4
Altewenm sile Kidus simu
T’ebqonal bets’nue selamu
Kerhrahew bizat yetenesa
Yemekeraw zemen teresa',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eyesefa-eyebeza-fikiru'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ

VERSE 1
ሳይፈርድብን እንደበደላችን
ሳያጠፋን ፈጥኖ በሀጢያታችን
በምሕረቱ ብዛት ጎበኘን
በማያልቀው ፍቅሩ እያየን

CHORUS
እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ

VERSE 2
ስንጠይቀው አብዝቶ እየሰጠ
ስናንኳኳ በር እየከፈተ
ይሰማናል እሱ ደግ ነው
ሳይከለክል ጌታ ሰጪ ነው

CHORUS
እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ

VERSE 3
በቃ ሲባል ይኸው አስቀጠለን
የኃጢአትን ሸክም እያቀለለ
በንስሐ አዲስ አድርጎናል
ስንመለስ ተቀብሎናል

CHORUS
እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ

VERSE 4
አልተወንም ስለ ቅዱስ ስሙ
ጠብቆናል በጽኑዕ ሰላሙ
ከርኅራኄው ብዛት የተነሳ
የመከራው ዘመን ተረሳ

CHORUS
እየሰፋ እየበዛ ፍቅሩ
ከልሎናል ከሰይፍ ከጦሩ
ተጠልለን በማይዝል መዳፉ
ስንት መዓልት ስንት ሌሊት አለፉ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eyesefa eyebeza fiqru
Kellonal keseyf ket’oru
Tet’ellen bemayzl medafu
Sint mealt sint lelit alefu

VERSE 1
Sayferdbn endebedelachn
Sayat’efan fet’no behet’iyatachn
Bemhretu bizat gobegnen
Bemayalqew fiqru eyayen

CHORUS
Eyesefa eyebeza fiqru
Kellonal keseyf ket’oru
Tet’ellen bemayzl medafu
Sint mealt sint lelit alefu

VERSE 2
Sint’eyqew abzto eyeset’e
Sinankwakwa ber eyekefete
Yisemanal esu deg new
Saykelekl Geta sech’i new

CHORUS
Eyesefa eyebeza fiqru
Kellonal keseyf ket’oru
Tet’ellen bemayzl medafu
Sint mealt sint lelit alefu

VERSE 3
Beqa sibal yiኸw asqet’elen
Yehat’iatn shekm eyaqelele
Benshe adis adrgonal
Sinmeles teqeblonal

CHORUS
Eyesefa eyebeza fiqru
Kellonal keseyf ket’oru
Tet’ellen bemayzl medafu
Sint mealt sint lelit alefu

VERSE 4
Altewenm sile Kidus simu
T’ebqonal bets’nue selamu
Kerhrahew bizat yetenesa
Yemekeraw zemen teresa

CHORUS
Eyesefa eyebeza fiqru
Kellonal keseyf ket’oru
Tet’ellen bemayzl medafu
Sint mealt sint lelit alefu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eyesefa-eyebeza-fikiru', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eyesus tewelidu / / Gena mezmur / Eritrean orthodox mezmur / zemari Bereket Tikue (eyesus-tewelidu-gena-mezmur-eritrean-orthodox-mezmur-zemari-bereket-tiku)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

VERSE 1
ንኸቢድ ጾር ሓጢአትና ንኸቕልል
አብ መብልዕ ማል ተወልደ አማኑኤል /2/
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ

VERSE 2
አብ ጸልማት ዝነብር ህዝቢ ዐብዪ ብርሃን ረአየ
አብ ዓዲ ሞትን ድኔአን መንግስቲ አምላኽ ተወርየ
አሰይ ተወሊዱልና ብሩኽ ሕጻን
ወድ’ቲ ልዑል አምላኽ በዐል ስልጣን /2/

VERSE 3
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

VERSE 4
ንኸቢድ ጾር ሓጢአትና ንኸቕልል
አብ መብልዕ ማል ተወልደ አማኑኤል /2/
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ',
      lyrics_transliteration = 'Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu
Kem mimnzae keyreaye mikhwanu mis amlaኽ maere
Melke nay barya wesidu gezae riesu win ahsere

VERSE 1
Niኸbid ts’or hat’iatna niኸቕll
Ab meble mal tewelde Amanuel (2)
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu

VERSE 2
Ab ts’elmat zinebr hizbi abyi birhan reaye
Ab adi motn dinean mengsti amlaኽ tewerye
Asey tewelidulna biruኽ hits’an
Wed’ti liul amlaኽ beal silt’an (2)

VERSE 3
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu
Kem mimnzae keyreaye mikhwanu mis amlaኽ maere
Melke barya wesidu gezae riesu win ahsere

VERSE 4
Niኸbid ts’or hat’iatna niኸቕll
Ab meble mal tewelde Amanuel (2)
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eyesus-tewelidu-gena-mezmur-eritrean-orthodox-mezmur-zemari-bereket-tiku'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

VERSE 1
ንኸቢድ ጾር ሓጢአትና ንኸቕልል
አብ መብልዕ ማል ተወልደ አማኑኤል /2/
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ

CHORUS
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

VERSE 2
አብ ጸልማት ዝነብር ህዝቢ ዐብዪ ብርሃን ረአየ
አብ ዓዲ ሞትን ድኔአን መንግስቲ አምላኽ ተወርየ
አሰይ ተወሊዱልና ብሩኽ ሕጻን
ወድ’ቲ ልዑል አምላኽ በዐል ስልጣን /2/

CHORUS
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

VERSE 3
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

CHORUS
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ

VERSE 4
ንኸቢድ ጾር ሓጢአትና ንኸቕልል
አብ መብልዕ ማል ተወልደ አማኑኤል /2/
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ

CHORUS
ካብቲ ላዕላይ ዙፋን ብፍቕሪ ወሪዱ
ክደልዪ ን ሓደ ወዱ ኢየሱስ ተወሊዱ
ከም ምምንዛዕ ከይረአየ ምዃኑ ምስ አምላኽ ማዕረ
መልክዕ ናይ ባርያ ወሲዱ ገዛእ ርእሱ ውን አሕሰረ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu
Kem mimnzae keyreaye mikhwanu mis amlaኽ maere
Melke nay barya wesidu gezae riesu win ahsere

VERSE 1
Niኸbid ts’or hat’iatna niኸቕll
Ab meble mal tewelde Amanuel (2)
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu

CHORUS
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu
Kem mimnzae keyreaye mikhwanu mis amlaኽ maere
Melke nay barya wesidu gezae riesu win ahsere

VERSE 2
Ab ts’elmat zinebr hizbi abyi birhan reaye
Ab adi motn dinean mengsti amlaኽ tewerye
Asey tewelidulna biruኽ hits’an
Wed’ti liul amlaኽ beal silt’an (2)

CHORUS
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu
Kem mimnzae keyreaye mikhwanu mis amlaኽ maere
Melke nay barya wesidu gezae riesu win ahsere

VERSE 3
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu
Kem mimnzae keyreaye mikhwanu mis amlaኽ maere
Melke barya wesidu gezae riesu win ahsere

CHORUS
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu
Kem mimnzae keyreaye mikhwanu mis amlaኽ maere
Melke nay barya wesidu gezae riesu win ahsere

VERSE 4
Niኸbid ts’or hat’iatna niኸቕll
Ab meble mal tewelde Amanuel (2)
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu

CHORUS
Kabti laelay zufan bifቕri weridu
Kidelyi n hade wedu Iyesus tewelidu
Kem mimnzae keyreaye mikhwanu mis amlaኽ maere
Melke nay barya wesidu gezae riesu win ahsere'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eyesus-tewelidu-gena-mezmur-eritrean-orthodox-mezmur-zemari-bereket-tiku', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eyuna Emenu Sewoch (eyuna-emenu-sewoch)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 1
እየሱስ በኩለ ለሊት ፣በኃይሉ ሞትን ድል ነስቷል(፪)

VERSE 2
እልልታ ለዚህ ይገባል ፣ግርግርታ ለዚህ ይገባል

VERSE 3
የሞት ኃይል ተዋርዷል ዛሬ፣ሲዖልም ተመሰቃቅሏል(፪)

VERSE 4
መላዕክቱ ነጭ ለብሰው ፣ምስራቹን አበሰሩ

VERSE 5
ተነስቷል እየሱስ ብለው፣ ለዓለም እንዲናገሩ(፪)

VERSE 6
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 7
እየሱስ በኩለ ለሊት ፣በኃይሉ ሞትን ድል ነስቷል(፪)

VERSE 8
እልልታ ለዚህ ይገባል ፣ግርግርታ ለዚህ ይገባል

VERSE 9
የሞት ኃይል ተዋርዷል ዛሬ፣ሲዖልም ተመሰቃቅሏል(፬)',
      lyrics_transliteration = 'yuna menu swoch dngayu tefeneqaql

VERSE 1
yesus bekule lelit behaylu motn dl nesl()

VERSE 2
llta lezih ygebal grgrta lezih ygebal

VERSE 3
yemot hayl tewarl zare siolm temeseqaql()

VERSE 4
melaktu nech lebsew msrachun ebeseru

VERSE 5
tenesl yesus blew lealem ndinageru()

VERSE 6
yuna menu swoch dngayu tefeneqaql

VERSE 7
yesus bekule lelit behaylu motn dl nesl()

VERSE 8
llta lezih ygebal grgrta lezih ygebal

VERSE 9
yemot hayl tewarl zare siolm temeseqaql()',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eyuna-emenu-sewoch'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 1
እየሱስ በኩለ ለሊት ፣በኃይሉ ሞትን ድል ነስቷል(፪)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 2
እልልታ ለዚህ ይገባል ፣ግርግርታ ለዚህ ይገባል

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 3
የሞት ኃይል ተዋርዷል ዛሬ፣ሲዖልም ተመሰቃቅሏል(፪)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 4
መላዕክቱ ነጭ ለብሰው ፣ምስራቹን አበሰሩ

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 5
ተነስቷል እየሱስ ብለው፣ ለዓለም እንዲናገሩ(፪)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 6
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 7
እየሱስ በኩለ ለሊት ፣በኃይሉ ሞትን ድል ነስቷል(፪)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 8
እልልታ ለዚህ ይገባል ፣ግርግርታ ለዚህ ይገባል

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል

VERSE 9
የሞት ኃይል ተዋርዷል ዛሬ፣ሲዖልም ተመሰቃቅሏል(፬)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 1
yesus bekule lelit behaylu motn dl nesl()

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 2
llta lezih ygebal grgrta lezih ygebal

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 3
yemot hayl tewarl zare siolm temeseqaql()

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 4
melaktu nech lebsew msrachun ebeseru

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 5
tenesl yesus blew lealem ndinageru()

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 6
yuna menu swoch dngayu tefeneqaql

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 7
yesus bekule lelit behaylu motn dl nesl()

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 8
llta lezih ygebal grgrta lezih ygebal

CHORUS
yuna menu swoch dngayu tefeneqaql

VERSE 9
yemot hayl tewarl zare siolm temeseqaql()

CHORUS
yuna menu swoch dngayu tefeneqaql'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eyuna-emenu-sewoch', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Eyuna Emenu Sewoch Like Mezemiran Yilima Hayilu (eyuna-emenu-sewoch-like-mezemiran-yilima-hayilu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል
እየሱስ በኩለ ለሊት ፣በኃይሉ ሞትን ድል ነስቷል(፪)
እልልታ ለዚህ ይገባል ፣ግርግርታ ለዚህ ይገባል
የሞት ኃይል ተዋርዷል ዛሬ፣ሲዖልም ተመሰቃቅሏል(፪)

VERSE 1
መላዕክቱ ነጭ ለብሰው ፣ምስራቹን አበሰሩ
ተነስቷል እየሱስ ብለው፣ ለዓለም እንዲናገሩ(፪)
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል
እየሱስ በኩለ ለሊት ፣በኃይሉ ሞትን ድል ነስቷል(፪)

VERSE 2
እልልታ ለዚህ ይገባል ፣ግርግርታ ለዚህ ይገባል
የሞት ኃይል ተዋርዷል ዛሬ፣ሲዖልም ተመሰቃቅሏል(፬)',
      lyrics_transliteration = 'Eyuna emenu siwoch ,dngayu tefeneqaqlwal
Eyesus bekule lelit ,behaylu motn dil nestwal (2)
Ellta lezih yigebal ,grgrta lezih yigebal
Yemot hayl tewardwal zare,siolm temeseqaqlwal (2)

VERSE 1
Melaektu nech’ lebsew ,msrachun abeseru
Tenestwal eyesus bilew, lealem endinageru (2)
Eyuna emenu siwoch ,dngayu tefeneqaqlwal
Eyesus bekule lelit ,behaylu motn dil nestwal (2)

VERSE 2
Ellta lezih yigebal ,grgrta lezih yigebal
Yemot hayl tewardwal zare,siolm temeseqaqlwal (4)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'eyuna-emenu-sewoch-like-mezemiran-yilima-hayilu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል
እየሱስ በኩለ ለሊት ፣በኃይሉ ሞትን ድል ነስቷል(፪)
እልልታ ለዚህ ይገባል ፣ግርግርታ ለዚህ ይገባል
የሞት ኃይል ተዋርዷል ዛሬ፣ሲዖልም ተመሰቃቅሏል(፪)

VERSE 1
መላዕክቱ ነጭ ለብሰው ፣ምስራቹን አበሰሩ
ተነስቷል እየሱስ ብለው፣ ለዓለም እንዲናገሩ(፪)
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል
እየሱስ በኩለ ለሊት ፣በኃይሉ ሞትን ድል ነስቷል(፪)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል
እየሱስ በኩለ ለሊት ፣በኃይሉ ሞትን ድል ነስቷል(፪)
እልልታ ለዚህ ይገባል ፣ግርግርታ ለዚህ ይገባል
የሞት ኃይል ተዋርዷል ዛሬ፣ሲዖልም ተመሰቃቅሏል(፪)

VERSE 2
እልልታ ለዚህ ይገባል ፣ግርግርታ ለዚህ ይገባል
የሞት ኃይል ተዋርዷል ዛሬ፣ሲዖልም ተመሰቃቅሏል(፬)

CHORUS
እዩና እመኑ ስዎች ፣ድንጋዩ ተፈነቃቅሏል
እየሱስ በኩለ ለሊት ፣በኃይሉ ሞትን ድል ነስቷል(፪)
እልልታ ለዚህ ይገባል ፣ግርግርታ ለዚህ ይገባል
የሞት ኃይል ተዋርዷል ዛሬ፣ሲዖልም ተመሰቃቅሏል(፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eyuna emenu siwoch ,dngayu tefeneqaqlwal
Eyesus bekule lelit ,behaylu motn dil nestwal (2)
Ellta lezih yigebal ,grgrta lezih yigebal
Yemot hayl tewardwal zare,siolm temeseqaqlwal (2)

VERSE 1
Melaektu nech’ lebsew ,msrachun abeseru
Tenestwal eyesus bilew, lealem endinageru (2)
Eyuna emenu siwoch ,dngayu tefeneqaqlwal
Eyesus bekule lelit ,behaylu motn dil nestwal (2)

CHORUS
Eyuna emenu siwoch ,dngayu tefeneqaqlwal
Eyesus bekule lelit ,behaylu motn dil nestwal (2)
Ellta lezih yigebal ,grgrta lezih yigebal
Yemot hayl tewardwal zare,siolm temeseqaqlwal (2)

VERSE 2
Ellta lezih yigebal ,grgrta lezih yigebal
Yemot hayl tewardwal zare,siolm temeseqaqlwal (4)

CHORUS
Eyuna emenu siwoch ,dngayu tefeneqaqlwal
Eyesus bekule lelit ,behaylu motn dil nestwal (2)
Ellta lezih yigebal ,grgrta lezih yigebal
Yemot hayl tewardwal zare,siolm temeseqaqlwal (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'eyuna-emenu-sewoch-like-mezemiran-yilima-hayilu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ezemeralehu LeEmebete (ezemeralehu-leemebete)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 1
ስላበሰችልኝ እንባዬን ከፊቴ
ይኸው እዘምራለሁ ለድንግል እናቴ
በስቃይ መከራ ቀርቷል መከፋቴ
የብዙሀን እናት ገብታለች ከቤቴ

VERSE 2
ምስቅልቅሉ ወቶ የደፈረሰብኝ
ተስተካክሎልኛል በድንግል ጠርቶልኝ
እንባዬን ፀሎቴን ጩኸቴንም ሰምታ
ፈጥና ጎበኘችን በረድኤት መታ

VERSE 3
በድንግዝግዝ ማዬት ቀርቶልኛል ለኔ
በፍቅር እጆቿ ተዳሶልኝ ዐይኔ
ሃዘኔን በእንባዬ ብነግራት ብሶቴን
ይኸው በበረከት ጎበኘችው ቤቴን

VERSE 4
ቀን ከሌት ሳቃስት በከበደኝ ሸክም
አገዘችን ድንግል ደክሜ ሳልሰጥም
እጇ ስለ ሳበኝ ወጣሁኝ ከጉድባው
ለክብሯ ልዘምር እጆቼን አነሳው',
      lyrics_transliteration = 'Yiኼw ezemralehu leemebete
Yefqrwa bereket gebto bete
Silegobegnechw gosqwalaw hiyten
Amesegnalehu Dingil emebeten

VERSE 1
Silabesechlgn enbayen kefite
Yiኸw ezemralehu ledngl enate
Besqay mekera qertwal mekefate
Yebzuhen enat gebtalech kebete

VERSE 2
Misqlqlu weto yedeferesebgn
Testekaklolgnal bedngl t’ertolgn
Enbayen ts’eloten ch’uኸtenm semta
Fet’na gobegnechn beredet meta

VERSE 3
Bedngzgz mayet qertolgnal lene
Befqr ejochwa tedasolgn ayne
Hazenen beenbaye binegrat bisoten
Yiኸw bebereket gobegnechw beten

VERSE 4
Qen kelet saqast bekebedegn shekm
Agezechn Dingil dekme salset’m
Ejwa sile sabegn wet’ahugn kegudbaw
Lekbrwa lizemr ejochen anesaw',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ezemeralehu-leemebete'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 1
ስላበሰችልኝ እንባዬን ከፊቴ
ይኸው እዘምራለሁ ለድንግል እናቴ
በስቃይ መከራ ቀርቷል መከፋቴ
የብዙሀን እናት ገብታለች ከቤቴ

CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 2
ምስቅልቅሉ ወቶ የደፈረሰብኝ
ተስተካክሎልኛል በድንግል ጠርቶልኝ
እንባዬን ፀሎቴን ጩኸቴንም ሰምታ
ፈጥና ጎበኘችን በረድኤት መታ

CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 3
በድንግዝግዝ ማዬት ቀርቶልኛል ለኔ
በፍቅር እጆቿ ተዳሶልኝ ዐይኔ
ሃዘኔን በእንባዬ ብነግራት ብሶቴን
ይኸው በበረከት ጎበኘችው ቤቴን

CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን

VERSE 4
ቀን ከሌት ሳቃስት በከበደኝ ሸክም
አገዘችን ድንግል ደክሜ ሳልሰጥም
እጇ ስለ ሳበኝ ወጣሁኝ ከጉድባው
ለክብሯ ልዘምር እጆቼን አነሳው

CHORUS
ይኼው እዘምራለሁ ለእመቤቴ
የፍቅሯ በረከት ገብቶ ቤቴ
ስለጎበኘችው ጎስቋላው ህይቴን
አመሰግናለሁ ድንግል እመቤቴን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yiኼw ezemralehu leemebete
Yefqrwa bereket gebto bete
Silegobegnechw gosqwalaw hiyten
Amesegnalehu Dingil emebeten

VERSE 1
Silabesechlgn enbayen kefite
Yiኸw ezemralehu ledngl enate
Besqay mekera qertwal mekefate
Yebzuhen enat gebtalech kebete

CHORUS
Yiኼw ezemralehu leemebete
Yefqrwa bereket gebto bete
Silegobegnechw gosqwalaw hiyten
Amesegnalehu Dingil emebeten

VERSE 2
Misqlqlu weto yedeferesebgn
Testekaklolgnal bedngl t’ertolgn
Enbayen ts’eloten ch’uኸtenm semta
Fet’na gobegnechn beredet meta

CHORUS
Yiኼw ezemralehu leemebete
Yefqrwa bereket gebto bete
Silegobegnechw gosqwalaw hiyten
Amesegnalehu Dingil emebeten

VERSE 3
Bedngzgz mayet qertolgnal lene
Befqr ejochwa tedasolgn ayne
Hazenen beenbaye binegrat bisoten
Yiኸw bebereket gobegnechw beten

CHORUS
Yiኼw ezemralehu leemebete
Yefqrwa bereket gebto bete
Silegobegnechw gosqwalaw hiyten
Amesegnalehu Dingil emebeten

VERSE 4
Qen kelet saqast bekebedegn shekm
Agezechn Dingil dekme salset’m
Ejwa sile sabegn wet’ahugn kegudbaw
Lekbrwa lizemr ejochen anesaw

CHORUS
Yiኼw ezemralehu leemebete
Yefqrwa bereket gebto bete
Silegobegnechw gosqwalaw hiyten
Amesegnalehu Dingil emebeten'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ezemeralehu-leemebete', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Fekade Yih (fekade-yih)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 1
አምላኬ ከማረኝ በፍቅሩ ዝምታ
የሰው በደል ላላይ በእውነት ምያለው
እኔን ከታገሰኝ ፍቅር ተምሬያለው(፪)

VERSE 2
ባይኔ ፊት ተጋርዶ ያለውን ምሰሶ
እያየ ካለፈኝ በምህረት ታግሶ
የሰው ጉድፍ ላላይ በእውነት ምያለው
እኔን ከታገሰኝ ፍቅር ተምሬያለው(፪)

VERSE 3
አንተ ቀራጩ ሰው ያለህ አቀርቅረህ
በምህረት ተመለስክ ከኔ ይልቅ ድነህ
ባንተ ላይ ስጠቁም የኔን ጸሎት ትቼ
የመዳኑ ሰዓት አለፉ ቀኖቼ(፪)

VERSE 4
ተቆጥሮ የማያልቅ ኃጢአቴ ተጠርቶ
በሞትና በደል በኃጢአት ሸፍኖ
ሰው አርጎ አቁሞኝ በሰው ፊት ጌታዬ
በማንም አልፈርድም ኃጢአተኛ ብዬ

VERSE 5
በማንም አልፈርድም በደለኛ ብዬ',
      lyrics_transliteration = 'Feqade new yesewn neger lalnager (2)
Yeene teshfno keqomkugn bekbr
Feqade new yesewn neger lalnager (2)
Hiywete bemulu behat’iat temelta

VERSE 1
Amlake kemaregn befqru zimta
Yesew bedel lalay beewnet miyalew
Enen ketagesegn fiqr temreyalew (2)

VERSE 2
Bayne fit tegardo yalewn miseso
Eyaye kalefegn bemhret tagso
Yesew gudf lalay beewnet miyalew
Enen ketagesegn fiqr temreyalew (2)

VERSE 3
Ante qerach’u sew yaleh aqerqreh
Bemhret temelesk kene yilq dineh
Bante lay sit’equm yenen ts’elot tiche
Yemedanu seat alefu qenoche (2)

VERSE 4
Teqot’ro yemayalq hat’iate tet’erto
Bemotna bedel behat’iat shefno
Sew argo aqumogn besew fit Getaye
Bemanm alferdm hat’iategna biye

VERSE 5
Bemanm alferdm bedelegna biye',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'fekade-yih'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 1
አምላኬ ከማረኝ በፍቅሩ ዝምታ
የሰው በደል ላላይ በእውነት ምያለው
እኔን ከታገሰኝ ፍቅር ተምሬያለው(፪)

CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 2
ባይኔ ፊት ተጋርዶ ያለውን ምሰሶ
እያየ ካለፈኝ በምህረት ታግሶ
የሰው ጉድፍ ላላይ በእውነት ምያለው
እኔን ከታገሰኝ ፍቅር ተምሬያለው(፪)

CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 3
አንተ ቀራጩ ሰው ያለህ አቀርቅረህ
በምህረት ተመለስክ ከኔ ይልቅ ድነህ
ባንተ ላይ ስጠቁም የኔን ጸሎት ትቼ
የመዳኑ ሰዓት አለፉ ቀኖቼ(፪)

CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 4
ተቆጥሮ የማያልቅ ኃጢአቴ ተጠርቶ
በሞትና በደል በኃጢአት ሸፍኖ
ሰው አርጎ አቁሞኝ በሰው ፊት ጌታዬ
በማንም አልፈርድም ኃጢአተኛ ብዬ

CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ

VERSE 5
በማንም አልፈርድም በደለኛ ብዬ

CHORUS
ፈቃዴ ነው የሠውን ነገር ላልናገር(፪)
የእኔ ተሽፍኖ ከቆምኩኝ በክብር
ፈቃዴ ነው የሰውን ነገር ላልናገር(፪)
ህይወቴ በሙሉ በኃጢአት ተመልታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Feqade new yesewn neger lalnager (2)
Yeene teshfno keqomkugn bekbr
Feqade new yesewn neger lalnager (2)
Hiywete bemulu behat’iat temelta

VERSE 1
Amlake kemaregn befqru zimta
Yesew bedel lalay beewnet miyalew
Enen ketagesegn fiqr temreyalew (2)

CHORUS
Feqade new yesewn neger lalnager (2)
Yeene teshfno keqomkugn bekbr
Feqade new yesewn neger lalnager (2)
Hiywete bemulu behat’iat temelta

VERSE 2
Bayne fit tegardo yalewn miseso
Eyaye kalefegn bemhret tagso
Yesew gudf lalay beewnet miyalew
Enen ketagesegn fiqr temreyalew (2)

CHORUS
Feqade new yesewn neger lalnager (2)
Yeene teshfno keqomkugn bekbr
Feqade new yesewn neger lalnager (2)
Hiywete bemulu behat’iat temelta

VERSE 3
Ante qerach’u sew yaleh aqerqreh
Bemhret temelesk kene yilq dineh
Bante lay sit’equm yenen ts’elot tiche
Yemedanu seat alefu qenoche (2)

CHORUS
Feqade new yesewn neger lalnager (2)
Yeene teshfno keqomkugn bekbr
Feqade new yesewn neger lalnager (2)
Hiywete bemulu behat’iat temelta

VERSE 4
Teqot’ro yemayalq hat’iate tet’erto
Bemotna bedel behat’iat shefno
Sew argo aqumogn besew fit Getaye
Bemanm alferdm hat’iategna biye

CHORUS
Feqade new yesewn neger lalnager (2)
Yeene teshfno keqomkugn bekbr
Feqade new yesewn neger lalnager (2)
Hiywete bemulu behat’iat temelta

VERSE 5
Bemanm alferdm bedelegna biye

CHORUS
Feqade new yesewn neger lalnager (2)
Yeene teshfno keqomkugn bekbr
Feqade new yesewn neger lalnager (2)
Hiywete bemulu behat’iat temelta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'fekade-yih', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Fekade Yih New (fekade-yih-new)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር

VERSE 1
ህይወቴ በሙሉ በሀጢአት ተመልታ
አምላኬ ከማረኝ በፍቅሩ ዝምታ
የሰው በደል ላላይ በእውነት ምያለው
እኔን ከታገሰኝ ፍቅር ተምሪያለሁ (2)

VERSE 2
ባይኔ ፊት ተጋርዶ ያለውን ምሶሶ
እያየ ካለፈኝ በምህረት ታግሶ
የሰው ጉድፍ ላላይ በእውነት ምያለው
እኔን ከታገሰኝ ፍቅር ተምሪያለሁ (2)

VERSE 3
አንተ ቀራጩ ሰው ያለህ አቀርቅረህ
በምህረት ተመለስክ ከኔ ይልቅ ድነህ
ባንተ ላይ ስጠቁም የኔን ፀሎት ትቼ
የመዳኑ ሰአት አለፉ ቀኖቼ (2)

VERSE 4
ተቆጥሮ የማያልቅ በደሌ ተከድኖ
በሞትና በደም ሀጥያቴን ሸፍኖ
ሰው አርጎኝ በሰው ፊት አቁሞኝ ጌታዬ
በማንም አልፈርድም ሀጥያተኛ ብዬ (2)',
      lyrics_transliteration = 'Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager

VERSE 1
Heywete bemulu behatiyat temelta
Amlake kemaregn befekru zemta
Yesew bedel lalay beewnet miyalew
Enen ketagesegn fiker temriyalehu (2)

VERSE 2
Bayne fit tegarido yalewin mesoso
Eyaye kalefegn bemihret tageso
Yesew gudf lalay beewnet miyalew
Enen ketagesegn fiker temriyalehu (2)

VERSE 3
Ante qerachu sew yaleh aqerqereh
Bemihret temelesk kene yilq deneh
Bante lay sitequm yenen tselot teche
Yemedanu seat alefu qenoche (2)

VERSE 4
Teqotero yemayalq bedele teqedeno
Bemotina bedem hatiaten shefeno
Sew argogn besew fit aqumogn Getaye
Bemanm alferdim hatiategna beye (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'fekade-yih-new'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር

VERSE 1
ህይወቴ በሙሉ በሀጢአት ተመልታ
አምላኬ ከማረኝ በፍቅሩ ዝምታ
የሰው በደል ላላይ በእውነት ምያለው
እኔን ከታገሰኝ ፍቅር ተምሪያለሁ (2)

CHORUS
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር

VERSE 2
ባይኔ ፊት ተጋርዶ ያለውን ምሶሶ
እያየ ካለፈኝ በምህረት ታግሶ
የሰው ጉድፍ ላላይ በእውነት ምያለው
እኔን ከታገሰኝ ፍቅር ተምሪያለሁ (2)

CHORUS
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር

VERSE 3
አንተ ቀራጩ ሰው ያለህ አቀርቅረህ
በምህረት ተመለስክ ከኔ ይልቅ ድነህ
ባንተ ላይ ስጠቁም የኔን ፀሎት ትቼ
የመዳኑ ሰአት አለፉ ቀኖቼ (2)

CHORUS
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር

VERSE 4
ተቆጥሮ የማያልቅ በደሌ ተከድኖ
በሞትና በደም ሀጥያቴን ሸፍኖ
ሰው አርጎኝ በሰው ፊት አቁሞኝ ጌታዬ
በማንም አልፈርድም ሀጥያተኛ ብዬ (2)

CHORUS
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር (2)
የኔ ተሸፍኖ ከቆምኩኝ በክብር
ፈቃዴ ይህ ነው የሰውን ነገር ላልናገር'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager

VERSE 1
Heywete bemulu behatiyat temelta
Amlake kemaregn befekru zemta
Yesew bedel lalay beewnet miyalew
Enen ketagesegn fiker temriyalehu (2)

CHORUS
Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager

VERSE 2
Bayne fit tegarido yalewin mesoso
Eyaye kalefegn bemihret tageso
Yesew gudf lalay beewnet miyalew
Enen ketagesegn fiker temriyalehu (2)

CHORUS
Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager

VERSE 3
Ante qerachu sew yaleh aqerqereh
Bemihret temelesk kene yilq deneh
Bante lay sitequm yenen tselot teche
Yemedanu seat alefu qenoche (2)

CHORUS
Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager

VERSE 4
Teqotero yemayalq bedele teqedeno
Bemotina bedem hatiaten shefeno
Sew argogn besew fit aqumogn Getaye
Bemanm alferdim hatiategna beye (2)

CHORUS
Fekade yih new yesewun neger lalnager (2)
Yene teshefeno keqomkugn bekibr
Fekade yih new yesewun neger lalnager'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'fekade-yih-new', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: ~ Feradi ~Zemarit Ruftaliem Tsigab Eritrean Orthodox Tewahdo Mezmur (feradi-zemarit-ruftaliem-tsigab-eritrean-orthodox-tewahdo-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ፈሪዶምኒ ኣሕዋተይ ፈራዲ ከለኻ ኣብሰማይ
መንሞ ብዜካኻ ይፈልጠኒ ኣምላኸይ
ሓጥእ ''ኺ ተባሂለ ተቀባቢሎሞ ስመይ
ክቅጻዕ ተፈሪደ ድሒነ ኣርኪብካለይ

VERSE 1
ከምሰብ ኣይኮነን ትፍርድኻ ፍልዩ ይፍለዩ ናትካ
በደል ሓጥያተይ ከይጸብጸብካ ብፍቅሪ ጠሚትካ
ከምተፍቅረኒ ይፈልጥ እየ ኣምላኸይ ፈቃር እንዲኻ
መሓሪ ኢኻ ንደቅኻ ( ሚዛን እዩ ፍርድኻ )²

VERSE 2
ዘይትታኸስ ጓሳይ ሓላውየይ እግዝኣብሄር
ብኣኻ ዲሒነ ኣለኹ ተመስገን ክበር
ኣዝማች
እምኒ ኣልዒሎምለይ ተፈሪደ ንጥፋኣት ፍርዲ ዝወሰነ

VERSE 3
ኩሉ ካባኻ እግዝኣብሄር ኣነሞ መንኮይነ
የለዉን ኬዶም ቶም ከሰስተይ ተሳዒሮም ብቅዱስ ቃልካ
ነጻ ኣውጺእኻኒ ብሳህልኻ (ሚዛን ዩ ፍርድኻ )²
ዘይትታኻስ ጓሳይ ሓላውየይ እግዝኣብሄር

VERSE 4
ብኣኻ ዲሒነ ኣለኹ ተመስገን ክበር
ኣዝማች
መራሒ መንገደይ ብርሃን ዓለም ትፍርዲ ኩሉ ካባኻ
ንሓው ዝሸይጥ ሰብ ሃዳኒ ካብ ኢዱ መንጢልካ

VERSE 5
ፍርድኻ ኣማን ብኣማን ዩ ምስጉን ኢኻ ዝተመስገንካ
ጽኑዕ ረጊጸ ብምሕረትካ ሚዛን ዩ ፍርድኻ
ዘይትታኻስ ጓሳይ ሓላውየይ እግዝኣብሄር
ብኣኻ ዲሒነ ኣለኹ ተመስገን ክበር

VERSE 6
ኣዝማች
ውድቀተይ ክሪኡ ተሃንጥዮም ትምኒቶም ምዃን ኣቢዎም
ሕልሞም መኺኑ ኣይሰመረን ሓይልኻ ሒዝዎም
ንጽቡቅ ጌርካዮ ክፍኣት ሕልሞም ኮይኑለይ ፍስሃ ሓጎስ

VERSE 7
ኣለኹ ኣነ ብሳህልኻ (ሚዛን ዩ ፍርድኻ )²
ዘይትታኻስ ጓሳይ ሓላውየይ እግዝኣብሄር
ብኣኻ ዲሒነ ኣለኹ ተመስገን ክበር',
      lyrics_transliteration = 'Feridomni ahwatey feradi keleኻ absemay
Menmo bizekaኻ yifelt’eni amlaኸy
Hat’e ''ኺ tebahile teqebabilomo simey
Kiqts’ae teferide dihine arkibkaley

VERSE 1
Kemseb aykonen tifrdኻ filyu yifleyu natka
Bedel hat’yatey keyts’ebts’ebka bifqri t’emitka
Kemtefqreni yifelt’ eye amlaኸy feqar endiኻ
Mehari iኻ nideqኻ ( mizan eyu firdኻ )²

VERSE 2
Zeyttaኸs gwasay halawyey egzabher
Biaኻ dihine aleኹ temesgen kiber
Azmach
Emni alilomley teferide nit’faat firdi ziwesene

VERSE 3
Kulu kabaኻ egzabher anemo menkoyne
Yelewun kedom tom kesestey tesairom biqdus qalka
Nets’a awts’ieኻni bisahlኻ (mizan yu firdኻ )²
Zeyttaኻs gwasay halawyey egzabher

VERSE 4
Biaኻ dihine aleኹ temesgen kiber
Azmach
Merahi mengedey birhan alem tifrdi kulu kabaኻ
Nihaw zisheyt’ seb hadani kab idu ment’ilka

VERSE 5
Firdኻ aman biaman yu misgun iኻ zitemesgenka
Ts’nue regits’e bimhretka mizan yu firdኻ
Zeyttaኻs gwasay halawyey egzabher
Biaኻ dihine aleኹ temesgen kiber

VERSE 6
Azmach
Widqetey kiriu tehant’yom timnitom mikhwan abiwom
Hilmom meኺnu aysemeren haylኻ hizwom
Nits’buq gerkayo kifat hilmom koynuley fisha hagos

VERSE 7
Aleኹ ane bisahlኻ (mizan yu firdኻ )²
Zeyttaኻs gwasay halawyey egzabher
Biaኻ dihine aleኹ temesgen kiber',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'feradi-zemarit-ruftaliem-tsigab-eritrean-orthodox-tewahdo-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፈሪዶምኒ ኣሕዋተይ ፈራዲ ከለኻ ኣብሰማይ
መንሞ ብዜካኻ ይፈልጠኒ ኣምላኸይ
ሓጥእ ''ኺ ተባሂለ ተቀባቢሎሞ ስመይ
ክቅጻዕ ተፈሪደ ድሒነ ኣርኪብካለይ

VERSE 1
ከምሰብ ኣይኮነን ትፍርድኻ ፍልዩ ይፍለዩ ናትካ
በደል ሓጥያተይ ከይጸብጸብካ ብፍቅሪ ጠሚትካ
ከምተፍቅረኒ ይፈልጥ እየ ኣምላኸይ ፈቃር እንዲኻ
መሓሪ ኢኻ ንደቅኻ ( ሚዛን እዩ ፍርድኻ )²

CHORUS
ፈሪዶምኒ ኣሕዋተይ ፈራዲ ከለኻ ኣብሰማይ
መንሞ ብዜካኻ ይፈልጠኒ ኣምላኸይ
ሓጥእ ''ኺ ተባሂለ ተቀባቢሎሞ ስመይ
ክቅጻዕ ተፈሪደ ድሒነ ኣርኪብካለይ

VERSE 2
ዘይትታኸስ ጓሳይ ሓላውየይ እግዝኣብሄር
ብኣኻ ዲሒነ ኣለኹ ተመስገን ክበር
ኣዝማች
እምኒ ኣልዒሎምለይ ተፈሪደ ንጥፋኣት ፍርዲ ዝወሰነ

CHORUS
ፈሪዶምኒ ኣሕዋተይ ፈራዲ ከለኻ ኣብሰማይ
መንሞ ብዜካኻ ይፈልጠኒ ኣምላኸይ
ሓጥእ ''ኺ ተባሂለ ተቀባቢሎሞ ስመይ
ክቅጻዕ ተፈሪደ ድሒነ ኣርኪብካለይ

VERSE 3
ኩሉ ካባኻ እግዝኣብሄር ኣነሞ መንኮይነ
የለዉን ኬዶም ቶም ከሰስተይ ተሳዒሮም ብቅዱስ ቃልካ
ነጻ ኣውጺእኻኒ ብሳህልኻ (ሚዛን ዩ ፍርድኻ )²
ዘይትታኻስ ጓሳይ ሓላውየይ እግዝኣብሄር

CHORUS
ፈሪዶምኒ ኣሕዋተይ ፈራዲ ከለኻ ኣብሰማይ
መንሞ ብዜካኻ ይፈልጠኒ ኣምላኸይ
ሓጥእ ''ኺ ተባሂለ ተቀባቢሎሞ ስመይ
ክቅጻዕ ተፈሪደ ድሒነ ኣርኪብካለይ

VERSE 4
ብኣኻ ዲሒነ ኣለኹ ተመስገን ክበር
ኣዝማች
መራሒ መንገደይ ብርሃን ዓለም ትፍርዲ ኩሉ ካባኻ
ንሓው ዝሸይጥ ሰብ ሃዳኒ ካብ ኢዱ መንጢልካ

CHORUS
ፈሪዶምኒ ኣሕዋተይ ፈራዲ ከለኻ ኣብሰማይ
መንሞ ብዜካኻ ይፈልጠኒ ኣምላኸይ
ሓጥእ ''ኺ ተባሂለ ተቀባቢሎሞ ስመይ
ክቅጻዕ ተፈሪደ ድሒነ ኣርኪብካለይ

VERSE 5
ፍርድኻ ኣማን ብኣማን ዩ ምስጉን ኢኻ ዝተመስገንካ
ጽኑዕ ረጊጸ ብምሕረትካ ሚዛን ዩ ፍርድኻ
ዘይትታኻስ ጓሳይ ሓላውየይ እግዝኣብሄር
ብኣኻ ዲሒነ ኣለኹ ተመስገን ክበር

CHORUS
ፈሪዶምኒ ኣሕዋተይ ፈራዲ ከለኻ ኣብሰማይ
መንሞ ብዜካኻ ይፈልጠኒ ኣምላኸይ
ሓጥእ ''ኺ ተባሂለ ተቀባቢሎሞ ስመይ
ክቅጻዕ ተፈሪደ ድሒነ ኣርኪብካለይ

VERSE 6
ኣዝማች
ውድቀተይ ክሪኡ ተሃንጥዮም ትምኒቶም ምዃን ኣቢዎም
ሕልሞም መኺኑ ኣይሰመረን ሓይልኻ ሒዝዎም
ንጽቡቅ ጌርካዮ ክፍኣት ሕልሞም ኮይኑለይ ፍስሃ ሓጎስ

CHORUS
ፈሪዶምኒ ኣሕዋተይ ፈራዲ ከለኻ ኣብሰማይ
መንሞ ብዜካኻ ይፈልጠኒ ኣምላኸይ
ሓጥእ ''ኺ ተባሂለ ተቀባቢሎሞ ስመይ
ክቅጻዕ ተፈሪደ ድሒነ ኣርኪብካለይ

VERSE 7
ኣለኹ ኣነ ብሳህልኻ (ሚዛን ዩ ፍርድኻ )²
ዘይትታኻስ ጓሳይ ሓላውየይ እግዝኣብሄር
ብኣኻ ዲሒነ ኣለኹ ተመስገን ክበር

CHORUS
ፈሪዶምኒ ኣሕዋተይ ፈራዲ ከለኻ ኣብሰማይ
መንሞ ብዜካኻ ይፈልጠኒ ኣምላኸይ
ሓጥእ ''ኺ ተባሂለ ተቀባቢሎሞ ስመይ
ክቅጻዕ ተፈሪደ ድሒነ ኣርኪብካለይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Feridomni ahwatey feradi keleኻ absemay
Menmo bizekaኻ yifelt’eni amlaኸy
Hat’e ''ኺ tebahile teqebabilomo simey
Kiqts’ae teferide dihine arkibkaley

VERSE 1
Kemseb aykonen tifrdኻ filyu yifleyu natka
Bedel hat’yatey keyts’ebts’ebka bifqri t’emitka
Kemtefqreni yifelt’ eye amlaኸy feqar endiኻ
Mehari iኻ nideqኻ ( mizan eyu firdኻ )²

CHORUS
Feridomni ahwatey feradi keleኻ absemay
Menmo bizekaኻ yifelt’eni amlaኸy
Hat’e ''ኺ tebahile teqebabilomo simey
Kiqts’ae teferide dihine arkibkaley

VERSE 2
Zeyttaኸs gwasay halawyey egzabher
Biaኻ dihine aleኹ temesgen kiber
Azmach
Emni alilomley teferide nit’faat firdi ziwesene

CHORUS
Feridomni ahwatey feradi keleኻ absemay
Menmo bizekaኻ yifelt’eni amlaኸy
Hat’e ''ኺ tebahile teqebabilomo simey
Kiqts’ae teferide dihine arkibkaley

VERSE 3
Kulu kabaኻ egzabher anemo menkoyne
Yelewun kedom tom kesestey tesairom biqdus qalka
Nets’a awts’ieኻni bisahlኻ (mizan yu firdኻ )²
Zeyttaኻs gwasay halawyey egzabher

CHORUS
Feridomni ahwatey feradi keleኻ absemay
Menmo bizekaኻ yifelt’eni amlaኸy
Hat’e ''ኺ tebahile teqebabilomo simey
Kiqts’ae teferide dihine arkibkaley

VERSE 4
Biaኻ dihine aleኹ temesgen kiber
Azmach
Merahi mengedey birhan alem tifrdi kulu kabaኻ
Nihaw zisheyt’ seb hadani kab idu ment’ilka

CHORUS
Feridomni ahwatey feradi keleኻ absemay
Menmo bizekaኻ yifelt’eni amlaኸy
Hat’e ''ኺ tebahile teqebabilomo simey
Kiqts’ae teferide dihine arkibkaley

VERSE 5
Firdኻ aman biaman yu misgun iኻ zitemesgenka
Ts’nue regits’e bimhretka mizan yu firdኻ
Zeyttaኻs gwasay halawyey egzabher
Biaኻ dihine aleኹ temesgen kiber

CHORUS
Feridomni ahwatey feradi keleኻ absemay
Menmo bizekaኻ yifelt’eni amlaኸy
Hat’e ''ኺ tebahile teqebabilomo simey
Kiqts’ae teferide dihine arkibkaley

VERSE 6
Azmach
Widqetey kiriu tehant’yom timnitom mikhwan abiwom
Hilmom meኺnu aysemeren haylኻ hizwom
Nits’buq gerkayo kifat hilmom koynuley fisha hagos

CHORUS
Feridomni ahwatey feradi keleኻ absemay
Menmo bizekaኻ yifelt’eni amlaኸy
Hat’e ''ኺ tebahile teqebabilomo simey
Kiqts’ae teferide dihine arkibkaley

VERSE 7
Aleኹ ane bisahlኻ (mizan yu firdኻ )²
Zeyttaኻs gwasay halawyey egzabher
Biaኻ dihine aleኹ temesgen kiber

CHORUS
Feridomni ahwatey feradi keleኻ absemay
Menmo bizekaኻ yifelt’eni amlaኸy
Hat’e ''ኺ tebahile teqebabilomo simey
Kiqts’ae teferide dihine arkibkaley'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'feradi-zemarit-ruftaliem-tsigab-eritrean-orthodox-tewahdo-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ferahu (ferahu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 1
እንዴት ነው ሳላውቅ ዘመኔ ያለቀው?
ጊዜዬን ዓለም ወስዳ ተጫወተችው።
እንዴት በድፍረት ደጅህን ልግባ?
ልግባ ወይ አልግባ?

VERSE 2
እንዴት ይመዝናል ያንተ ደም?
በራው ልግባ ወይ አልግባ?
እንዴት ይመዝናል ያንተ ደም?
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣

VERSE 3
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
እኔ ፈራሁ እንጂ፣ አንተ እንኳን አታስፈራም፣
መምጣቴ ነው ደስታ፣ ፍቅርህ ይጣፍጣል፣

VERSE 4
ነፍሴ ተሽምቅቃለች፣ መስቀልህን ሳየው፣ ደምህን እያየሁ።
ልግባ ወይ አልግባ?
እንዴት ይመዝናል ያንተ ደም?
በራው ልግባ ወይ አልግባ?

VERSE 5
እንዴት ይመዝናል ያንተ ደም?
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአቴ ከበደኝ፣ አላራመደኝም።

VERSE 6
አላራመደኝም።
በንጽህና እንዴት እቆማለሁ?
እንደ መላእክቱ ክንፍ የለኝም እኔ፣
መሸፈኛ ክንፍ የለኝም እኔ፣

VERSE 7
ይታያል ኃጢአቴ፣ የበደል እርቃኔ።
ልግባ ወይ አልግባ?
እንዴት ይመዝናል ያንተ ደም?
በራው ልግባ ወይ አልግባ?

VERSE 8
እንዴት ይመዝናል ያንተ ደም?
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአቴ ከበደኝ፣ አላራመደኝም።

VERSE 9
አላራመደኝም።
ጠዋትና ማታ ለመጣውም፣
አምሽቶ ለገባም እኮ ትከፍላለህ።
አብርሃም ወይሳቅ በድንኳን ቢያድሩም፣

VERSE 10
በአንተ መንግስት ግን ከወዲያ ቀድመው።
ልግባ ወይ አልግባ?
እንዴት ይመዝናል ያንተ ደም?
በራው ልግባ ወይ አልግባ?

VERSE 11
እንዴት ይመዝናል ያንተ ደም?',
      lyrics_transliteration = 'Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 1
Endet new salawq zemene yaleqew?
Gizeyen alem wesda tech’awetechw.
Endet bedfret dejhn ligba?
Ligba wey algba?

VERSE 2
Endet yimeznal yante dem?
Beraw ligba wey algba?
Endet yimeznal yante dem?
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,

VERSE 3
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Ene ferahu enji, ante enkwan atasferam,
Memt’ate new desta, fiqrh yit’aft’al,

VERSE 4
Nefse teshmqqalech, mesqelhn sayew, demhn eyayehu.
Ligba wey algba?
Endet yimeznal yante dem?
Beraw ligba wey algba?

VERSE 5
Endet yimeznal yante dem?
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iate kebedegn, alaramedegnm.

VERSE 6
Alaramedegnm.
Bents’hna endet eqomalehu?
Ende melaektu kinf yelegnm ene,
Meshefegna kinf yelegnm ene,

VERSE 7
Yitayal hat’iate, yebedel erqane.
Ligba wey algba?
Endet yimeznal yante dem?
Beraw ligba wey algba?

VERSE 8
Endet yimeznal yante dem?
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iate kebedegn, alaramedegnm.

VERSE 9
Alaramedegnm.
T’ewatna mata lemet’awm,
Amshto legebam eko tikeflaleh.
Abrham weysaq bednkwan biyadrum,

VERSE 10
Beante mengst gin kewediya qedmew.
Ligba wey algba?
Endet yimeznal yante dem?
Beraw ligba wey algba?

VERSE 11
Endet yimeznal yante dem?',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ferahu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 1
እንዴት ነው ሳላውቅ ዘመኔ ያለቀው?
ጊዜዬን ዓለም ወስዳ ተጫወተችው።
እንዴት በድፍረት ደጅህን ልግባ?
ልግባ ወይ አልግባ?

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 2
እንዴት ይመዝናል ያንተ ደም?
በራው ልግባ ወይ አልግባ?
እንዴት ይመዝናል ያንተ ደም?
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 3
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
እኔ ፈራሁ እንጂ፣ አንተ እንኳን አታስፈራም፣
መምጣቴ ነው ደስታ፣ ፍቅርህ ይጣፍጣል፣

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 4
ነፍሴ ተሽምቅቃለች፣ መስቀልህን ሳየው፣ ደምህን እያየሁ።
ልግባ ወይ አልግባ?
እንዴት ይመዝናል ያንተ ደም?
በራው ልግባ ወይ አልግባ?

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 5
እንዴት ይመዝናል ያንተ ደም?
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአቴ ከበደኝ፣ አላራመደኝም።

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 6
አላራመደኝም።
በንጽህና እንዴት እቆማለሁ?
እንደ መላእክቱ ክንፍ የለኝም እኔ፣
መሸፈኛ ክንፍ የለኝም እኔ፣

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 7
ይታያል ኃጢአቴ፣ የበደል እርቃኔ።
ልግባ ወይ አልግባ?
እንዴት ይመዝናል ያንተ ደም?
በራው ልግባ ወይ አልግባ?

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 8
እንዴት ይመዝናል ያንተ ደም?
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአቴ ከበደኝ፣ አላራመደኝም።

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 9
አላራመደኝም።
ጠዋትና ማታ ለመጣውም፣
አምሽቶ ለገባም እኮ ትከፍላለህ።
አብርሃም ወይሳቅ በድንኳን ቢያድሩም፣

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 10
በአንተ መንግስት ግን ከወዲያ ቀድመው።
ልግባ ወይ አልግባ?
እንዴት ይመዝናል ያንተ ደም?
በራው ልግባ ወይ አልግባ?

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 11
እንዴት ይመዝናል ያንተ ደም?

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 1
Endet new salawq zemene yaleqew?
Gizeyen alem wesda tech’awetechw.
Endet bedfret dejhn ligba?
Ligba wey algba?

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 2
Endet yimeznal yante dem?
Beraw ligba wey algba?
Endet yimeznal yante dem?
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 3
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Ene ferahu enji, ante enkwan atasferam,
Memt’ate new desta, fiqrh yit’aft’al,

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 4
Nefse teshmqqalech, mesqelhn sayew, demhn eyayehu.
Ligba wey algba?
Endet yimeznal yante dem?
Beraw ligba wey algba?

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 5
Endet yimeznal yante dem?
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iate kebedegn, alaramedegnm.

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 6
Alaramedegnm.
Bents’hna endet eqomalehu?
Ende melaektu kinf yelegnm ene,
Meshefegna kinf yelegnm ene,

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 7
Yitayal hat’iate, yebedel erqane.
Ligba wey algba?
Endet yimeznal yante dem?
Beraw ligba wey algba?

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 8
Endet yimeznal yante dem?
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iate kebedegn, alaramedegnm.

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 9
Alaramedegnm.
T’ewatna mata lemet’awm,
Amshto legebam eko tikeflaleh.
Abrham weysaq bednkwan biyadrum,

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 10
Beante mengst gin kewediya qedmew.
Ligba wey algba?
Endet yimeznal yante dem?
Beraw ligba wey algba?

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 11
Endet yimeznal yante dem?

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ferahu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Feyatawi Zeyeman (feyatawi-zeyeman-2396)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ

VERSE 1
አልሰማሁም እኔ የነቢያትን ቃል
አላወቅኩም በእርግጥ አብሮኝ እስኪሰቀል
ኢሳይያስ ሲናገር ዳዊት ሲመሰክር
የመሲሁን መምጣት አልሰማሁም ነበር

VERSE 2
በመስቀል ላይ ሳለ አምላኬን ለየሁት
ትሁት ነበር ፍጹም በደል የሌለበት
ስለ በደላችን እኛ ተሰቅለናል

VERSE 3
እሱ ግን በማን ላይ ወንጀልን ፈጽሟል
ጨረቃ ደም ሆና ፀሐይዋ ስትጨልም
ከዋክብት ረግፈው ሰማይ ሲያጉረመርም

VERSE 4
አምላክ መሰቀሉን ተፈጥሮ ነግራኝ ነው
በመንግሥትህ ጌታ አስበኝ የምለው
አወይ ቀያፋ ሆይ አወይ ሀና ሆይ

VERSE 5
ደስ ብሏችሁ ዋለ በጌታ ስቃይ
ተፈጥሮ ምስክር ሆኖ ሲያስተምራችሁ
እንዴት አላመነም ደንዳናው ልባችሁ',
      lyrics_transliteration = 'Feyatawi zeyeman amlakun lemene
Beqegn yaqomew zend getan temats’ene
Wenbede bihonm shfta wenjelegna
Memt’athn asebku ledhnet wedegna

VERSE 1
Alsemahum ene yenebiyatn qal
Alaweqkum beergt’ abrogn eskiseqel
Isayyas sinager dawit simesekr
Yemesihun memt’at alsemahum neber

VERSE 2
Bemesqel lay sale amlaken leyehut
Tihut neber fits’um bedel yelelebet
Sile bedelachn egna teseqlenal

VERSE 3
Esu gin beman lay wenjeln fets’mwal
Ch’ereqa dem hona ts’eheywa sitch’elm
Kewakbt regfew semay siyaguremerm

VERSE 4
Amlak meseqelun tefet’ro negragn new
Bemengsth Geta asbegn yemlew
Awey qeyafa hoy awey hena hoy

VERSE 5
Des bilwachhu wale begeta siqay
Tefet’ro miskr hono siyastemrachhu
Endet alamenem dendanaw libachhu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'feyatawi-zeyeman-2396'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ

VERSE 1
አልሰማሁም እኔ የነቢያትን ቃል
አላወቅኩም በእርግጥ አብሮኝ እስኪሰቀል
ኢሳይያስ ሲናገር ዳዊት ሲመሰክር
የመሲሁን መምጣት አልሰማሁም ነበር

CHORUS
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ

VERSE 2
አዝ
በመስቀል ላይ ሳለ አምላኬን ለየሁት
ትሁት ነበር ፍጹም በደል የሌለበት
ስለ በደላችን እኛ ተሰቅለናል

CHORUS
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ

VERSE 3
እሱ ግን በማን ላይ ወንጀልን ፈጽሟል
አዝ
ጨረቃ ደም ሆና ፀሐይዋ ስትጨልም
ከዋክብት ረግፈው ሰማይ ሲያጉረመርም

CHORUS
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ

VERSE 4
አምላክ መሰቀሉን ተፈጥሮ ነግራኝ ነው
በመንግሥትህ ጌታ አስበኝ የምለው
አዝ
አወይ ቀያፋ ሆይ አወይ ሀና ሆይ

CHORUS
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ

VERSE 5
ደስ ብሏችሁ ዋለ በጌታ ስቃይ
ተፈጥሮ ምስክር ሆኖ ሲያስተምራችሁ
እንዴት አላመነም ደንዳናው ልባችሁ

CHORUS
ፈያታዊ ዘየማን አምላኩን ለመነ
በቀኝ ያቆመው ዘንድ ጌታን ተማጸነ
ወንበዴ ብሆንም ሽፍታ ወንጀለኛ
መምጣትህን አሰብኩ ለድህነት ወደኛ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Feyatawi zeyeman amlakun lemene
Beqegn yaqomew zend getan temats’ene
Wenbede bihonm shfta wenjelegna
Memt’athn asebku ledhnet wedegna

VERSE 1
Alsemahum ene yenebiyatn qal
Alaweqkum beergt’ abrogn eskiseqel
Isayyas sinager dawit simesekr
Yemesihun memt’at alsemahum neber

CHORUS
Feyatawi zeyeman amlakun lemene
Beqegn yaqomew zend getan temats’ene
Wenbede bihonm shfta wenjelegna
Memt’athn asebku ledhnet wedegna

VERSE 2
CHORUS
Bemesqel lay sale amlaken leyehut
Tihut neber fits’um bedel yelelebet
Sile bedelachn egna teseqlenal

CHORUS
Feyatawi zeyeman amlakun lemene
Beqegn yaqomew zend getan temats’ene
Wenbede bihonm shfta wenjelegna
Memt’athn asebku ledhnet wedegna

VERSE 3
Esu gin beman lay wenjeln fets’mwal
CHORUS
Ch’ereqa dem hona ts’eheywa sitch’elm
Kewakbt regfew semay siyaguremerm

CHORUS
Feyatawi zeyeman amlakun lemene
Beqegn yaqomew zend getan temats’ene
Wenbede bihonm shfta wenjelegna
Memt’athn asebku ledhnet wedegna

VERSE 4
Amlak meseqelun tefet’ro negragn new
Bemengsth Geta asbegn yemlew
CHORUS
Awey qeyafa hoy awey hena hoy

CHORUS
Feyatawi zeyeman amlakun lemene
Beqegn yaqomew zend getan temats’ene
Wenbede bihonm shfta wenjelegna
Memt’athn asebku ledhnet wedegna

VERSE 5
Des bilwachhu wale begeta siqay
Tefet’ro miskr hono siyastemrachhu
Endet alamenem dendanaw libachhu

CHORUS
Feyatawi zeyeman amlakun lemene
Beqegn yaqomew zend getan temats’ene
Wenbede bihonm shfta wenjelegna
Memt’athn asebku ledhnet wedegna'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'feyatawi-zeyeman-2396', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Fikirih Marekegn (fikirih-marekegn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸክሜ እርቋል

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ
እንደ አቅሜ አገንሃለሁ (X2)

VERSE 3
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

VERSE 4
ጣቴ በገና ይደረድራል
በቀን በሌሊት ያመስግናል (X2)

VERSE 5
ክብርህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

VERSE 6
ባንተ ተመካን በፈጣሪያችን
አዳኝ በሆንከው በንጉሳችን (X2)',
      lyrics_transliteration = 'Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 1
Tegezchalehu bewerq demh
Alemn tiche lageleglh
Moth hiywete lene honognal
Bante mekera shekme erqwal

VERSE 2
Lekbrh qome ezemralehu
Ende aqme agenhalehu (X2)

VERSE 3
Midrna semay ell yibelu
Misgana lante yidres eyalu
Mesay yelehm leqdsnah
Aqerbalehugn lante misgana

VERSE 4
T’ate begena yideredral
Beqen belelit yamesgnal (X2)

VERSE 5
Kibrhn aytew t’elatoch feru
Legetneth wedqew tegezu
Endih neh amlak endih neh Geta
Hulun befqr yemtreta

VERSE 6
Bante temekan befet’ariyachn
Adagn behonkew bengusachn (X2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'fikirih-marekegn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸክሜ እርቋል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ
እንደ አቅሜ አገንሃለሁ (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 3
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 4
ጣቴ በገና ይደረድራል
በቀን በሌሊት ያመስግናል (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 5
ክብርህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 6
ባንተ ተመካን በፈጣሪያችን
አዳኝ በሆንከው በንጉሳችን (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 1
Tegezchalehu bewerq demh
Alemn tiche lageleglh
Moth hiywete lene honognal
Bante mekera shekme erqwal

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 2
Lekbrh qome ezemralehu
Ende aqme agenhalehu (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 3
Midrna semay ell yibelu
Misgana lante yidres eyalu
Mesay yelehm leqdsnah
Aqerbalehugn lante misgana

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 4
T’ate begena yideredral
Beqen belelit yamesgnal (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 5
Kibrhn aytew t’elatoch feru
Legetneth wedqew tegezu
Endih neh amlak endih neh Geta
Hulun befqr yemtreta

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 6
Bante temekan befet’ariyachn
Adagn behonkew bengusachn (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'fikirih-marekegn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Fikirih Marekegn (fikirih-marekegn-1180)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸክሜ እርቋል

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ
እንደ አቅሜ አገኝሃለሁ (X2)

VERSE 3
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

VERSE 4
ጣቴ በገና ይደረድራል
በቀን በሌሊት ያመስግናል (X2)

VERSE 5
ክንድህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

VERSE 6
ባንተ ተመካን በፈጣሪያችን
አዳኝ በሆንከው በንጉሳችን (X2)',
      lyrics_transliteration = 'Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 1
Tegezchalehu bewerq demh
Alemn tiche lageleglh
Moth hiywete lene honognal
Bante mekera shekme erqwal

VERSE 2
Lekbrh qome ezemralehu
Ende aqme agegnhalehu (X2)

VERSE 3
Midrna semay ell yibelu
Misgana lante yidres eyalu
Mesay yelehm leqdsnah
Aqerbalehugn lante misgana

VERSE 4
T’ate begena yideredral
Beqen belelit yamesgnal (X2)

VERSE 5
Kindhn aytew t’elatoch feru
Legetneth wedqew tegezu
Endih neh amlak endih neh Geta
Hulun befqr yemtreta

VERSE 6
Bante temekan befet’ariyachn
Adagn behonkew bengusachn (X2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'fikirih-marekegn-1180'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸክሜ እርቋል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ
እንደ አቅሜ አገኝሃለሁ (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 3
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 4
ጣቴ በገና ይደረድራል
በቀን በሌሊት ያመስግናል (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 5
ክንድህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 6
ባንተ ተመካን በፈጣሪያችን
አዳኝ በሆንከው በንጉሳችን (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 1
Tegezchalehu bewerq demh
Alemn tiche lageleglh
Moth hiywete lene honognal
Bante mekera shekme erqwal

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 2
Lekbrh qome ezemralehu
Ende aqme agegnhalehu (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 3
Midrna semay ell yibelu
Misgana lante yidres eyalu
Mesay yelehm leqdsnah
Aqerbalehugn lante misgana

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 4
T’ate begena yideredral
Beqen belelit yamesgnal (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 5
Kindhn aytew t’elatoch feru
Legetneth wedqew tegezu
Endih neh amlak endih neh Geta
Hulun befqr yemtreta

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 6
Bante temekan befet’ariyachn
Adagn behonkew bengusachn (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'fikirih-marekegn-1180', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Fikirih Marekegn (fikirih-marekegn-3806)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸክሜ እርቋል

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ
እንደ አቅሜ አገኝሃለሁ (X2)

VERSE 3
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

VERSE 4
ጣቴ በገና ይደረድራል
በቀን በሌሊት ያመስግናል (X2)

VERSE 5
ክንድህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

VERSE 6
ባንተ ተመካን በፈጣሪያችን
አዳኝ በሆንከው በንጉሳችን (X2)',
      lyrics_transliteration = 'Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 1
Tegezchalehu bewerq demh
Alemn tiche lageleglh
Moth hiywete lene honognal
Bante mekera shekme erqwal

VERSE 2
Lekbrh qome ezemralehu
Ende aqme agegnhalehu (X2)

VERSE 3
Midrna semay ell yibelu
Misgana lante yidres eyalu
Mesay yelehm leqdsnah
Aqerbalehugn lante misgana

VERSE 4
T’ate begena yideredral
Beqen belelit yamesgnal (X2)

VERSE 5
Kindhn aytew t’elatoch feru
Legetneth wedqew tegezu
Endih neh amlak endih neh Geta
Hulun befqr yemtreta

VERSE 6
Bante temekan befet’ariyachn
Adagn behonkew bengusachn (X2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'fikirih-marekegn-3806'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸክሜ እርቋል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ
እንደ አቅሜ አገኝሃለሁ (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 3
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 4
ጣቴ በገና ይደረድራል
በቀን በሌሊት ያመስግናል (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 5
ክንድህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 6
ባንተ ተመካን በፈጣሪያችን
አዳኝ በሆንከው በንጉሳችን (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 1
Tegezchalehu bewerq demh
Alemn tiche lageleglh
Moth hiywete lene honognal
Bante mekera shekme erqwal

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 2
Lekbrh qome ezemralehu
Ende aqme agegnhalehu (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 3
Midrna semay ell yibelu
Misgana lante yidres eyalu
Mesay yelehm leqdsnah
Aqerbalehugn lante misgana

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 4
T’ate begena yideredral
Beqen belelit yamesgnal (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 5
Kindhn aytew t’elatoch feru
Legetneth wedqew tegezu
Endih neh amlak endih neh Geta
Hulun befqr yemtreta

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 6
Bante temekan befet’ariyachn
Adagn behonkew bengusachn (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'fikirih-marekegn-3806', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Fikirih Marekegn : Selam Leki (fikirih-marekegn-selam-leki)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸክሜ እርቋል

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ
እንደ አቅሜ አገኝሃለሁ (X2)

VERSE 3
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

VERSE 4
ጣቴ በገና ይደረድራል
በቀን በሌሊት ያመስግናል (X2)

VERSE 5
ክንድህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

VERSE 6
ባንተ ተመካን በፈጣሪያችን
አዳኝ በሆንከው በንጉሳችን (X2)
ሰላም ለኪ ማርያም ሰላም
ሰላም ለኪ ፈጽሞ ሰላም

VERSE 7
ሰላም ለኪ ማርያም ሰላም
የህይወት መሰረት የፍጥረት አለኝታ
ግንባር አደራሽልን መከታ
ሰላም ለኪ ማርያም ሰላም

VERSE 8
ሰላም ለኪ ሰላም
ሰላም ለኪ ማርያም ሰላም
ብዙ ነፍስ አጥፍቶ
ያንቺ ስም ለጠራ

VERSE 9
ሰላም ለኪ ስትል
ሰላም ለኪ ሰላም
ለኪ ማርያም ሰላም
ለኪ ሰላም

VERSE 10
ለኪ ማርያም ሰላም
ሰላም ለአንደበሻ አማላጅ አማላክ ድንግል ሆይ
አደራሽን ከልጅሽ
ሰላም ለኪ ሰላም

VERSE 11
ሰላም ለኪ ማርያም ሰላም
እኛ ብንከተል ብንከተል በጎ መንገድ
በሰላም በጤና ሰላም ለኪ እንኖራለን
ሰላም ለኪ ሰላም ለኪ ማርያም ሰላም

VERSE 12
ለኪ ሰላም ማርያም ሰላም ለኪ
ማርያም ሰላም ለኪ ሰላም
ሰላም ለኪ ማርያም ሰላም ለኪ
ሰማይተ እየሱስ ሰማይተ ኢየሱስ መርቆርዮስ ድል ላይ

VERSE 13
ሰማይተ እየሱስ ሰማይተ ኢየሱስ መርቆርዮስ
ሰማይተ እየሱስ መርቆርዮስ
ሰማይተ እየሱስ መርቆርዮስ
ሰማይተ እየሱስ መርቆርዮስ

VERSE 14
ሰማይተ ኢየሱስ ሰማይተ ኢየሱስ መርቆርዮስ
ሰማይተ እየሱስ መርቆርዮስ
ሰማይተ እየሱስ ሰማይተ ኢየሱስ
ሰማይተ እየሱስ መርቆርዮስ

VERSE 15
ጌታ ተነስቷል
እልልልልልል በሉ አምላክ ተነስቷል
ምስራች በሉ ሞትን መቃብር አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

VERSE 16
ጌታ ተነስቷል በሉ አምላክ ተነስቷል
ምስራች በሉ ሞትን መቃብር ከሃይሉ አጥፍቶ
ሁላችንም ክርስቶስ ተነስቶ
አዳምን ለማዳን ቃልኪዳን ገብቶልን

VERSE 17
ዘመኑን ጠብቆ
ከአሳዳሪው ከሰማያት ወርዶ
የተሰቀለው ሞትን በሞት ሽሮ
ይህው ጌታ ተነስቷል በሉ አምላክ ተነስቷል

VERSE 18
ምስራች በሉ ሞትን መቃብር ከሃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ
ደቀመዛሙርቱ እጅጉን ተጨንቀው
በጌታቸው መሞት በሃዘን ተመተው

VERSE 19
በተዘጋ ደጃፍ ተሰብስበው
እጆቹን ዘርግቶ ሰላም ለናንተ አለ
ጌታ ተነስቷል በሉ አምላክ ተነስቷል
ምስራች በሉ ሞትን መቃብር ከሃይሉ አጥፍቶ

VERSE 20
ሁላችን አየነው ክርስቶስ ተነስቶ
ማርያም መግደላዊት እየቀሰቀሰች
በሌሊት ተነስታ ወደ አምላኳ ሄደች
አይሁዳን ገድለው የሰቀሉት ጌታ

VERSE 21
ተነስቶ አግኝታው ተሞላች በደስታ
ጌታ ተነስቷል እልል በሉ አምላክ ተነስቷል
ምስራች በሉ ሞትን መቃብር ሃይሉን አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቷል',
      lyrics_transliteration = 'Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 1
Tegezchalehu bewerq demh
Alemn tiche lageleglh
Moth hiywete lene honognal
Bante mekera shekme erqwal

VERSE 2
Lekbrh qome ezemralehu
Ende aqme agegnhalehu (X2)

VERSE 3
Midrna semay ell yibelu
Misgana lante yidres eyalu
Mesay yelehm leqdsnah
Aqerbalehugn lante misgana

VERSE 4
T’ate begena yideredral
Beqen belelit yamesgnal (X2)

VERSE 5
Kindhn aytew t’elatoch feru
Legetneth wedqew tegezu
Endih neh amlak endih neh Geta
Hulun befqr yemtreta

VERSE 6
Bante temekan befet’ariyachn
Adagn behonkew bengusachn (X2)
Selam leki Maryam selam
Selam leki fets’mo selam

VERSE 7
Selam leki Maryam selam
Yehywet meseret yeft’ret alegnta
Ginbar aderashln meketa
Selam leki Maryam selam

VERSE 8
Selam leki selam
Selam leki Maryam selam
Bizu nefs at’fto
Yanchi sim let’era

VERSE 9
Selam leki sitl
Selam leki selam
Leki Maryam selam
Leki selam

VERSE 10
Leki Maryam selam
Selam leandebesha amalaj amalak Dingil hoy
Aderashn keljsh
Selam leki selam

VERSE 11
Selam leki Maryam selam
Egna binketel binketel bego menged
Beselam bet’ena selam leki ennoralen
Selam leki selam leki Maryam selam

VERSE 12
Leki selam Maryam selam leki
Maryam selam leki selam
Selam leki Maryam selam leki
Semayte eyesus semayte Iyesus merqoryos dil lay

VERSE 13
Semayte eyesus semayte Iyesus merqoryos
Semayte eyesus merqoryos
Semayte eyesus merqoryos
Semayte eyesus merqoryos

VERSE 14
Semayte Iyesus semayte Iyesus merqoryos
Semayte eyesus merqoryos
Semayte eyesus semayte Iyesus
Semayte eyesus merqoryos

VERSE 15
Geta tenestwal
Ellllll belu amlak tenestwal
Misrach belu motn meqabr at’fto
Hulachn ayenew Kristos tenesto

VERSE 16
Geta tenestwal belu amlak tenestwal
Misrach belu motn meqabr kehaylu at’fto
Hulachnm Kristos tenesto
Adamn lemadan qalkidan gebtoln

VERSE 17
Zemenun t’ebqo
Keasadariw kesemayat werdo
Yeteseqelew motn bemot shro
Yihw Geta tenestwal belu amlak tenestwal

VERSE 18
Misrach belu motn meqabr kehaylu at’fto
Hulachn ayenew Kristos tenesto
Deqemezamurtu ejgun tech’enqew
Begetachew memot behazen temetew

VERSE 19
Betezega dejaf tesebsbew
Ejochun zergto selam lenante ale
Geta tenestwal belu amlak tenestwal
Misrach belu motn meqabr kehaylu at’fto

VERSE 20
Hulachn ayenew Kristos tenesto
Maryam megdelawit eyeqeseqesech
Belelit tenesta wede amlakwa hedech
Ayhudan gedlew yeseqelut Geta

VERSE 21
Tenesto aggntaw temolach bedesta
Geta tenestwal ell belu amlak tenestwal
Misrach belu motn meqabr haylun at’fto
Hulachn ayenew Kristos tenestwal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'fikirih-marekegn-selam-leki'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸክሜ እርቋል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ
እንደ አቅሜ አገኝሃለሁ (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 3
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 4
ጣቴ በገና ይደረድራል
በቀን በሌሊት ያመስግናል (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 5
ክንድህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 6
ባንተ ተመካን በፈጣሪያችን
አዳኝ በሆንከው በንጉሳችን (X2)
ሰላም ለኪ ማርያም ሰላም
ሰላም ለኪ ፈጽሞ ሰላም

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 7
ሰላም ለኪ ማርያም ሰላም
የህይወት መሰረት የፍጥረት አለኝታ
ግንባር አደራሽልን መከታ
ሰላም ለኪ ማርያም ሰላም

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 8
ሰላም ለኪ ሰላም
ሰላም ለኪ ማርያም ሰላም
ብዙ ነፍስ አጥፍቶ
ያንቺ ስም ለጠራ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 9
ሰላም ለኪ ስትል
ሰላም ለኪ ሰላም
ለኪ ማርያም ሰላም
ለኪ ሰላም

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 10
ለኪ ማርያም ሰላም
ሰላም ለአንደበሻ አማላጅ አማላክ ድንግል ሆይ
አደራሽን ከልጅሽ
ሰላም ለኪ ሰላም

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 11
ሰላም ለኪ ማርያም ሰላም
እኛ ብንከተል ብንከተል በጎ መንገድ
በሰላም በጤና ሰላም ለኪ እንኖራለን
ሰላም ለኪ ሰላም ለኪ ማርያም ሰላም

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 12
ለኪ ሰላም ማርያም ሰላም ለኪ
ማርያም ሰላም ለኪ ሰላም
ሰላም ለኪ ማርያም ሰላም ለኪ
ሰማይተ እየሱስ ሰማይተ ኢየሱስ መርቆርዮስ ድል ላይ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 13
ሰማይተ እየሱስ ሰማይተ ኢየሱስ መርቆርዮስ
ሰማይተ እየሱስ መርቆርዮስ
ሰማይተ እየሱስ መርቆርዮስ
ሰማይተ እየሱስ መርቆርዮስ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 14
ሰማይተ ኢየሱስ ሰማይተ ኢየሱስ መርቆርዮስ
ሰማይተ እየሱስ መርቆርዮስ
ሰማይተ እየሱስ ሰማይተ ኢየሱስ
ሰማይተ እየሱስ መርቆርዮስ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 15
ጌታ ተነስቷል
እልልልልልል በሉ አምላክ ተነስቷል
ምስራች በሉ ሞትን መቃብር አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 16
ጌታ ተነስቷል በሉ አምላክ ተነስቷል
ምስራች በሉ ሞትን መቃብር ከሃይሉ አጥፍቶ
ሁላችንም ክርስቶስ ተነስቶ
አዳምን ለማዳን ቃልኪዳን ገብቶልን

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 17
ዘመኑን ጠብቆ
ከአሳዳሪው ከሰማያት ወርዶ
የተሰቀለው ሞትን በሞት ሽሮ
ይህው ጌታ ተነስቷል በሉ አምላክ ተነስቷል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 18
ምስራች በሉ ሞትን መቃብር ከሃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ
ደቀመዛሙርቱ እጅጉን ተጨንቀው
በጌታቸው መሞት በሃዘን ተመተው

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 19
በተዘጋ ደጃፍ ተሰብስበው
እጆቹን ዘርግቶ ሰላም ለናንተ አለ
ጌታ ተነስቷል በሉ አምላክ ተነስቷል
ምስራች በሉ ሞትን መቃብር ከሃይሉ አጥፍቶ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 20
ሁላችን አየነው ክርስቶስ ተነስቶ
ማርያም መግደላዊት እየቀሰቀሰች
በሌሊት ተነስታ ወደ አምላኳ ሄደች
አይሁዳን ገድለው የሰቀሉት ጌታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 21
ተነስቶ አግኝታው ተሞላች በደስታ
ጌታ ተነስቷል እልል በሉ አምላክ ተነስቷል
ምስራች በሉ ሞትን መቃብር ሃይሉን አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቷል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 1
Tegezchalehu bewerq demh
Alemn tiche lageleglh
Moth hiywete lene honognal
Bante mekera shekme erqwal

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 2
Lekbrh qome ezemralehu
Ende aqme agegnhalehu (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 3
Midrna semay ell yibelu
Misgana lante yidres eyalu
Mesay yelehm leqdsnah
Aqerbalehugn lante misgana

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 4
T’ate begena yideredral
Beqen belelit yamesgnal (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 5
Kindhn aytew t’elatoch feru
Legetneth wedqew tegezu
Endih neh amlak endih neh Geta
Hulun befqr yemtreta

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 6
Bante temekan befet’ariyachn
Adagn behonkew bengusachn (X2)
Selam leki Maryam selam
Selam leki fets’mo selam

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 7
Selam leki Maryam selam
Yehywet meseret yeft’ret alegnta
Ginbar aderashln meketa
Selam leki Maryam selam

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 8
Selam leki selam
Selam leki Maryam selam
Bizu nefs at’fto
Yanchi sim let’era

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 9
Selam leki sitl
Selam leki selam
Leki Maryam selam
Leki selam

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 10
Leki Maryam selam
Selam leandebesha amalaj amalak Dingil hoy
Aderashn keljsh
Selam leki selam

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 11
Selam leki Maryam selam
Egna binketel binketel bego menged
Beselam bet’ena selam leki ennoralen
Selam leki selam leki Maryam selam

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 12
Leki selam Maryam selam leki
Maryam selam leki selam
Selam leki Maryam selam leki
Semayte eyesus semayte Iyesus merqoryos dil lay

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 13
Semayte eyesus semayte Iyesus merqoryos
Semayte eyesus merqoryos
Semayte eyesus merqoryos
Semayte eyesus merqoryos

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 14
Semayte Iyesus semayte Iyesus merqoryos
Semayte eyesus merqoryos
Semayte eyesus semayte Iyesus
Semayte eyesus merqoryos

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 15
Geta tenestwal
Ellllll belu amlak tenestwal
Misrach belu motn meqabr at’fto
Hulachn ayenew Kristos tenesto

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 16
Geta tenestwal belu amlak tenestwal
Misrach belu motn meqabr kehaylu at’fto
Hulachnm Kristos tenesto
Adamn lemadan qalkidan gebtoln

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 17
Zemenun t’ebqo
Keasadariw kesemayat werdo
Yeteseqelew motn bemot shro
Yihw Geta tenestwal belu amlak tenestwal

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 18
Misrach belu motn meqabr kehaylu at’fto
Hulachn ayenew Kristos tenesto
Deqemezamurtu ejgun tech’enqew
Begetachew memot behazen temetew

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 19
Betezega dejaf tesebsbew
Ejochun zergto selam lenante ale
Geta tenestwal belu amlak tenestwal
Misrach belu motn meqabr kehaylu at’fto

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 20
Hulachn ayenew Kristos tenesto
Maryam megdelawit eyeqeseqesech
Belelit tenesta wede amlakwa hedech
Ayhudan gedlew yeseqelut Geta

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 21
Tenesto aggntaw temolach bedesta
Geta tenestwal ell belu amlak tenestwal
Misrach belu motn meqabr haylun at’fto
Hulachn ayenew Kristos tenestwal

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'fikirih-marekegn-selam-leki', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Fikirih Marekeny (fikirih-marekeny)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸከሜ እርቋል

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ እንደ አቅሜ አገኝሃለሁ (x2)

VERSE 3
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 4
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

VERSE 5
ጣቴ በገና ይደረድራል በቀን በሌሊት ያመስግናል (x2)

VERSE 6
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 7
ክብርህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

VERSE 8
ባንተ ተመካሁ በፈጣሪያችን አዳኝ በሆንከው በንጉሳችን (x2)

VERSE 9
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)',
      lyrics_transliteration = 'Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 1
Tegezichalehu bewerk demih
Alemn tiche lagelgelih
Motih hiywote lene honognal

VERSE 2
Bante mekera shekeme irkwal
Lekibirih qome ezemiralew ende aqme agenyihalehu (x2)
Fikirih marekeny behiywote bezemene

VERSE 3
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 4
Midrina semay illil yibelu
Misgana lante yidres iyalu
Mesay yelehim leqidistnah

VERSE 5
Aqerbalewign lante misgana
Tate begena yideredral beqen belelit yamesegnal (x2)
Fikirih marekeny behiywote bezemene

VERSE 6
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 7
Kibirihn aytew telatoch feru
Legetnetih wedkew tegezu
Endih neh amlak endih neh geta

VERSE 8
Hulun befikir yemitereta
Bante temekahu befetariyachin adañ behonkew benigusachin (x2)
Fikirih marekeny behiywote bezemene

VERSE 9
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'fikirih-marekeny'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸከሜ እርቋል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ እንደ አቅሜ አገኝሃለሁ (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 3
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 4
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 5
ጣቴ በገና ይደረድራል በቀን በሌሊት ያመስግናል (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 6
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 7
ክብርህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 8
ባንተ ተመካሁ በፈጣሪያችን አዳኝ በሆንከው በንጉሳችን (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 9
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 1
Tegezichalehu bewerk demih
Alemn tiche lagelgelih
Motih hiywote lene honognal

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 2
Bante mekera shekeme irkwal
Lekibirih qome ezemiralew ende aqme agenyihalehu (x2)
Fikirih marekeny behiywote bezemene

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 3
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 4
Midrina semay illil yibelu
Misgana lante yidres iyalu
Mesay yelehim leqidistnah

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 5
Aqerbalewign lante misgana
Tate begena yideredral beqen belelit yamesegnal (x2)
Fikirih marekeny behiywote bezemene

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 6
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 7
Kibirihn aytew telatoch feru
Legetnetih wedkew tegezu
Endih neh amlak endih neh geta

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 8
Hulun befikir yemitereta
Bante temekahu befetariyachin adañ behonkew benigusachin (x2)
Fikirih marekeny behiywote bezemene

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 9
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'fikirih-marekeny', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Fikiriki Mesituni (fikiriki-mesituni)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 1
ልመናይ ኣውሒዘ ኣይስኣንኩን ልግሲ
ትምኒተይ ክሠምር ምስ በልኩ ማርያመይ
ድላየይ ሂብክኒ ዓዚዙ ሰላመይ
ኣዝ

VERSE 2
ብማሕለካ ሕይወት ዘይውዳእ መከራ
ልበይ ክፈራረቕ ከቢድዋ ናብራ
ምረተይ ምዓሩ ብደገፍ ምልጃኪ
ውዳሴ''ካ ''ውሕዶ ማርያም ንዉዕለትኪ

VERSE 3
ኣዝ
ከም ኤልሳቤጥ ኣደይ ኣደ ጐይታይ ክብል
ሓጎስ ውሽጢ ውሽጠይ ነናሻዕ ይግንፍል
ከም ቅዱስ ገብርኤል ከም ኣበው ቅዱሳን

VERSE 4
ስምኪ ክጽውዕ''የ ድንግል እመ ብርሃን
ኣዝ
ደቂ ሰብ ኣብ ምድሪ ሰማያዉያን ኣብ ራማ
ብጣዕመ ፍቕርኪ ቃንዮምልኪ ዜማ

VERSE 5
ልበይ ውን ምስኣቶም ክውድስ ነቂሉ
ሰለ ፍቕሪ ጽዮን ስቕ ኣይክብልን ኢሉ',
      lyrics_transliteration = 'Fiqrki niay mesit’uni maryamey
Widase keqrbelki''ye nay libey (2)
Az
Biskin ts’elotki qusley kitfwsi

VERSE 1
Limenay awhize aysankun ligsi
Timnitey kisemr mis belku maryamey
Dilayey hibkni azizu selamey
Az

VERSE 2
Bimahleka hiywet zeywdae mekera
Libey kiferareቕ kebidwa nabra
Miretey miaru bidegef miljaki
Widase''ka ''wihdo Maryam niwueletki

VERSE 3
Az
Kem elsabet’ adey ade gweytay kibl
Hagos wisht’i wisht’ey nenashae yignfl
Kem Kidus Gebriel kem abew Kidusan

VERSE 4
Simki kits’we''ye Dingil eme birhan
Az
Deqi seb ab midri semayawuyan ab rama
Bit’aeme fiቕrki qanyomlki zema

VERSE 5
Libey win misatom kiwds neqilu
Sele fiቕri ts’yon siቕ aykbln ilu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'fikiriki-mesituni'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 1
ልመናይ ኣውሒዘ ኣይስኣንኩን ልግሲ
ትምኒተይ ክሠምር ምስ በልኩ ማርያመይ
ድላየይ ሂብክኒ ዓዚዙ ሰላመይ
ኣዝ

CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 2
ብማሕለካ ሕይወት ዘይውዳእ መከራ
ልበይ ክፈራረቕ ከቢድዋ ናብራ
ምረተይ ምዓሩ ብደገፍ ምልጃኪ
ውዳሴ''ካ ''ውሕዶ ማርያም ንዉዕለትኪ

CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 3
ኣዝ
ከም ኤልሳቤጥ ኣደይ ኣደ ጐይታይ ክብል
ሓጎስ ውሽጢ ውሽጠይ ነናሻዕ ይግንፍል
ከም ቅዱስ ገብርኤል ከም ኣበው ቅዱሳን

CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 4
ስምኪ ክጽውዕ''የ ድንግል እመ ብርሃን
ኣዝ
ደቂ ሰብ ኣብ ምድሪ ሰማያዉያን ኣብ ራማ
ብጣዕመ ፍቕርኪ ቃንዮምልኪ ዜማ

CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ

VERSE 5
ልበይ ውን ምስኣቶም ክውድስ ነቂሉ
ሰለ ፍቕሪ ጽዮን ስቕ ኣይክብልን ኢሉ

CHORUS
ፍቅርኪ ንዓይ መሲጡኒ ማርያመይ
ውዳሴ ከቅርበልኪ''የ ናይ ልበይ(2)
ኣዝ
ብስኪን ጸሎትኪ ቁስለይ ክትፍውሲ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fiqrki niay mesit’uni maryamey
Widase keqrbelki''ye nay libey (2)
Az
Biskin ts’elotki qusley kitfwsi

VERSE 1
Limenay awhize aysankun ligsi
Timnitey kisemr mis belku maryamey
Dilayey hibkni azizu selamey
Az

CHORUS
Fiqrki niay mesit’uni maryamey
Widase keqrbelki''ye nay libey (2)
Az
Biskin ts’elotki qusley kitfwsi

VERSE 2
Bimahleka hiywet zeywdae mekera
Libey kiferareቕ kebidwa nabra
Miretey miaru bidegef miljaki
Widase''ka ''wihdo Maryam niwueletki

CHORUS
Fiqrki niay mesit’uni maryamey
Widase keqrbelki''ye nay libey (2)
Az
Biskin ts’elotki qusley kitfwsi

VERSE 3
Az
Kem elsabet’ adey ade gweytay kibl
Hagos wisht’i wisht’ey nenashae yignfl
Kem Kidus Gebriel kem abew Kidusan

CHORUS
Fiqrki niay mesit’uni maryamey
Widase keqrbelki''ye nay libey (2)
Az
Biskin ts’elotki qusley kitfwsi

VERSE 4
Simki kits’we''ye Dingil eme birhan
Az
Deqi seb ab midri semayawuyan ab rama
Bit’aeme fiቕrki qanyomlki zema

CHORUS
Fiqrki niay mesit’uni maryamey
Widase keqrbelki''ye nay libey (2)
Az
Biskin ts’elotki qusley kitfwsi

VERSE 5
Libey win misatom kiwds neqilu
Sele fiቕri ts’yon siቕ aykbln ilu

CHORUS
Fiqrki niay mesit’uni maryamey
Widase keqrbelki''ye nay libey (2)
Az
Biskin ts’elotki qusley kitfwsi'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'fikiriki-mesituni', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: For My Eyes (for-my-eyes)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Aynoche madanun aytewalina (2)
Yigebawal (2) kibir ena misgana',
      lyrics_english = 'For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 1
Aynoche madanun aytewalina (2)
Yigebawal (2) kibir ena misgana

VERSE 2
Descended from heaven for He so loved the world
The gracious Almighty Jesus Christ our Lord
Hidden in Bethlehem inside of the manger
He was born on that day our God and Savior

VERSE 3
Many were the prophets that told of His coming
Born from Virgin Mary saved us from suffering
Lifted us from the dust path of iniquity
Saying hallelujah let’s sing in unity

VERSE 4
Desired to restore those who were cast away
Honored us with His love in lowliness He came
What kind of love is this everlasting mercy
Our God being born in a barn so humbly

VERSE 5
Remained perfectly pure in the sanctuary
Gave birth to salvation with full virginity
The Lord that rids the world of evil transgression
The hope of all mankind was born from the Virgin',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'for-my-eyes'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Aynoche madanun aytewalina (2)
Yigebawal (2) kibir ena misgana'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 1
Aynoche madanun aytewalina (2)
Yigebawal (2) kibir ena misgana

CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 2
Descended from heaven for He so loved the world
The gracious Almighty Jesus Christ our Lord
Hidden in Bethlehem inside of the manger
He was born on that day our God and Savior

CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 3
Many were the prophets that told of His coming
Born from Virgin Mary saved us from suffering
Lifted us from the dust path of iniquity
Saying hallelujah let’s sing in unity

CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 4
Desired to restore those who were cast away
Honored us with His love in lowliness He came
What kind of love is this everlasting mercy
Our God being born in a barn so humbly

CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion

VERSE 5
Remained perfectly pure in the sanctuary
Gave birth to salvation with full virginity
The Lord that rids the world of evil transgression
The hope of all mankind was born from the Virgin

CHORUS
For my eyes have witnessed the Lord’s salvation (2)
Honor and praise (2) we give with devotion'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'for-my-eyes', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: For There’s No One Like Him (for-theres-no-one-like-him)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /፪/

VERSE 1
እንደ እግዚአብሔር ያለ ማንም የለምና/x2/
እልል በሉ ቁሙ ለምስጋና /x2/',
      lyrics_transliteration = 'Ende Egziabher yalew manim yelemna

VERSE 1
Ellil belu kumu lemisgana',
      lyrics_english = 'For There''s No One Like Him Our God the almighty /x2/
Arise for Praise and sing with jumble /x2/

VERSE 1
The water was parted revealing the sea floor, The pharaoh had fallen his screaming was no more, the meek used the new path and had treaded, the powerful were humiliated
Chorus….

VERSE 2
The walls of Jericho untouched by any hand, What seemed invincible has crumbled down to sand, Though the mighty may seem to grow in strength, we’ll remain firm in him we have our faith
Chorus….

VERSE 3
Our adversary had thrown a piercing rod, it tumbled to the ground were shielded by our God, let our praise soar to the trinity, for he has lost the hunting enemy
Chorus….

VERSE 4
On the sea he strides with grace and the utmost ease, when he rises grandly the violent winds will cease, we worship him the Virgin Mary’s son, he’s merciful impossible he’s done, he’s merciful impossible he’s done.

VERSE 5
For There''s No One Like Him Our God the almighty /x2/
Arise for Praise and sing with jumble /x2/',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'for-theres-no-one-like-him'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /፪/

VERSE 1
እንደ እግዚአብሔር ያለ ማንም የለምና/x2/
እልል በሉ ቁሙ ለምስጋና /x2/

CHORUS
እንደ እግዚአብሔር ያለ ማንም የለምና
እልል በሉ ቁሙ ለምስጋና /፪/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ende Egziabher yalew manim yelemna

VERSE 1
Ellil belu kumu lemisgana

CHORUS
Ende Egziabher yalew manim yelemna'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
For There''s No One Like Him Our God the almighty /x2/
Arise for Praise and sing with jumble /x2/

VERSE 1
The water was parted revealing the sea floor, The pharaoh had fallen his screaming was no more, the meek used the new path and had treaded, the powerful were humiliated
Chorus….

CHORUS
For There''s No One Like Him Our God the almighty /x2/
Arise for Praise and sing with jumble /x2/

VERSE 2
The walls of Jericho untouched by any hand, What seemed invincible has crumbled down to sand, Though the mighty may seem to grow in strength, we’ll remain firm in him we have our faith
Chorus….

CHORUS
For There''s No One Like Him Our God the almighty /x2/
Arise for Praise and sing with jumble /x2/

VERSE 3
Our adversary had thrown a piercing rod, it tumbled to the ground were shielded by our God, let our praise soar to the trinity, for he has lost the hunting enemy
Chorus….

CHORUS
For There''s No One Like Him Our God the almighty /x2/
Arise for Praise and sing with jumble /x2/

VERSE 4
On the sea he strides with grace and the utmost ease, when he rises grandly the violent winds will cease, we worship him the Virgin Mary’s son, he’s merciful impossible he’s done, he’s merciful impossible he’s done.

CHORUS
For There''s No One Like Him Our God the almighty /x2/
Arise for Praise and sing with jumble /x2/

VERSE 5
For There''s No One Like Him Our God the almighty /x2/
Arise for Praise and sing with jumble /x2/

CHORUS
For There''s No One Like Him Our God the almighty /x2/
Arise for Praise and sing with jumble /x2/'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'for-theres-no-one-like-him', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Forgive Me an English Hymn (forgive-me-an-english-hymn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'Forgive me
Forgive me, Lord Have mercy, Forgive /2/
I have fallen so low, due to all of my sins,
For my soul has surrendered, to the will of my flesh

VERSE 1
My soul has given up, having fallen to Sin
Lord please pull me back, through your endless compassion, forgive
Forgive me, Lord Have mercy, Forgive /2/
My life is so wrapped up, in the will of this world,

VERSE 2
I refuse to repent, numbed by my wickedness
If You don’t change my heart, by Your almighty might,
I lack the purity, to ever see You Lord, forgive
Forgive me, Lord Have mercy, Forgive /2/

VERSE 3
Look towards just how much, I’ve submitted to the world
By your compassion visit me, so I may become faithful
Renew my entire life, fill it with Your Holy love,
Purify my whole life, so I may dwell in Your home, forgive

VERSE 4
Forgive me, Lord Have mercy, Forgive /2/',
      lyrics_transliteration = 'Forgive me
Forgive me, Lord Have mercy, Forgive (2)
I have fallen so low, due to all of my sins,
For my soul has surrendered, to the will of my flesh

VERSE 1
My soul has given up, having fallen to Sin
Lord please pull me back, through your endless compassion, forgive
Forgive me, Lord Have mercy, Forgive (2)
My life is so wrapped up, in the will of this world,

VERSE 2
I refuse to repent, numbed by my wickedness
If You don’t change my heart, by Your almighty might,
I lack the purity, to ever see You Lord, forgive
Forgive me, Lord Have mercy, Forgive (2)

VERSE 3
Look towards just how much, I’ve submitted to the world
By your compassion visit me, so I may become faithful
Renew my entire life, fill it with Your Holy love,
Purify my whole life, so I may dwell in Your home, forgive

VERSE 4
Forgive me, Lord Have mercy, Forgive (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'forgive-me-an-english-hymn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Forgive me
Forgive me, Lord Have mercy, Forgive /2/
I have fallen so low, due to all of my sins,
For my soul has surrendered, to the will of my flesh

VERSE 1
My soul has given up, having fallen to Sin
Lord please pull me back, through your endless compassion, forgive
Forgive me, Lord Have mercy, Forgive /2/
My life is so wrapped up, in the will of this world,

CHORUS
Forgive me
Forgive me, Lord Have mercy, Forgive /2/
I have fallen so low, due to all of my sins,
For my soul has surrendered, to the will of my flesh

VERSE 2
I refuse to repent, numbed by my wickedness
If You don’t change my heart, by Your almighty might,
I lack the purity, to ever see You Lord, forgive
Forgive me, Lord Have mercy, Forgive /2/

CHORUS
Forgive me
Forgive me, Lord Have mercy, Forgive /2/
I have fallen so low, due to all of my sins,
For my soul has surrendered, to the will of my flesh

VERSE 3
Look towards just how much, I’ve submitted to the world
By your compassion visit me, so I may become faithful
Renew my entire life, fill it with Your Holy love,
Purify my whole life, so I may dwell in Your home, forgive

CHORUS
Forgive me
Forgive me, Lord Have mercy, Forgive /2/
I have fallen so low, due to all of my sins,
For my soul has surrendered, to the will of my flesh

VERSE 4
Forgive me, Lord Have mercy, Forgive /2/

CHORUS
Forgive me
Forgive me, Lord Have mercy, Forgive /2/
I have fallen so low, due to all of my sins,
For my soul has surrendered, to the will of my flesh'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Forgive me
Forgive me, Lord Have mercy, Forgive (2)
I have fallen so low, due to all of my sins,
For my soul has surrendered, to the will of my flesh

VERSE 1
My soul has given up, having fallen to Sin
Lord please pull me back, through your endless compassion, forgive
Forgive me, Lord Have mercy, Forgive (2)
My life is so wrapped up, in the will of this world,

CHORUS
Forgive me
Forgive me, Lord Have mercy, Forgive (2)
I have fallen so low, due to all of my sins,
For my soul has surrendered, to the will of my flesh

VERSE 2
I refuse to repent, numbed by my wickedness
If You don’t change my heart, by Your almighty might,
I lack the purity, to ever see You Lord, forgive
Forgive me, Lord Have mercy, Forgive (2)

CHORUS
Forgive me
Forgive me, Lord Have mercy, Forgive (2)
I have fallen so low, due to all of my sins,
For my soul has surrendered, to the will of my flesh

VERSE 3
Look towards just how much, I’ve submitted to the world
By your compassion visit me, so I may become faithful
Renew my entire life, fill it with Your Holy love,
Purify my whole life, so I may dwell in Your home, forgive

CHORUS
Forgive me
Forgive me, Lord Have mercy, Forgive (2)
I have fallen so low, due to all of my sins,
For my soul has surrendered, to the will of my flesh

VERSE 4
Forgive me, Lord Have mercy, Forgive (2)

CHORUS
Forgive me
Forgive me, Lord Have mercy, Forgive (2)
I have fallen so low, due to all of my sins,
For my soul has surrendered, to the will of my flesh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'forgive-me-an-english-hymn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: From the scorching flames (from-the-scorching-flames)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ከሚነደው እሳት ነበልባል (2)
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል (2)

VERSE 1
ከሚነደው እሳት ነበልባል (2)
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል (2)',
      lyrics_transliteration = 'Keminedew isat nebelbal (2)

VERSE 1
Yawotagn ersu new yetadegagn fet''no Gebriel (2)',
      lyrics_english = 'From the scorching flames and burning fire (2)
He swiftly removed me the Angel Gabriel my rescuer (2)

VERSE 1
Distressed was the spirit of Nebuchadnezzar
For this he desired a dream interpreter
The false magic of the Chaldeans (Kal-dee-yuns) was exposed
Through God’s intervention Gabriel delivered me from being disposed (2)

VERSE 2
From the scorching flames and burning fire (2)
He swiftly removed me the Angel Gabriel my rescuer (2)

VERSE 3
Leader of the captives Ashpenaz (exactly how it looks) was amazed
By the edge of the fire he saw me while I praised
Though I’m a child of God the king didn’t notice
Our guardian angel with his might preserved us from the blazing furnace

VERSE 4
From the scorching flames and burning fire (2)
He swiftly removed me the Angel Gabriel my rescuer (2)

VERSE 5
The enemy that induced trials lit the torch
Although my body was burned my soul was not scorched
Survived the Babylonian fire through aid
The servant of the Lord with his pleas my father provided me with shade (2)

VERSE 6
From the scorching flames and burning fire (2)
He swiftly removed me the Angel Gabriel my rescuer (2)

VERSE 7
I won’t succumb though they scare with boiling water
The world may burn in fire but my faith won’t falter
Like he saved Qirqos and Eyeluta from heat
He parted heaven to speedily save me from the ultimate defeat (2)

VERSE 8
From the scorching flames and burning fire (2)
He swiftly removed me the Angel Gabriel my rescuer (2)',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'from-the-scorching-flames'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከሚነደው እሳት ነበልባል (2)
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል (2)

VERSE 1
ከሚነደው እሳት ነበልባል (2)
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል (2)

CHORUS
ከሚነደው እሳት ነበልባል (2)
ያወጣኝ እርሱ ነው የታደገኝ ፈጥኖ ገብርኤል (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Keminedew isat nebelbal (2)

VERSE 1
Yawotagn ersu new yetadegagn fet''no Gebriel (2)

CHORUS
Keminedew isat nebelbal (2)'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
From the scorching flames and burning fire (2)
He swiftly removed me the Angel Gabriel my rescuer (2)

VERSE 1
Distressed was the spirit of Nebuchadnezzar
For this he desired a dream interpreter
The false magic of the Chaldeans (Kal-dee-yuns) was exposed
Through God’s intervention Gabriel delivered me from being disposed (2)

CHORUS
From the scorching flames and burning fire (2)
He swiftly removed me the Angel Gabriel my rescuer (2)

VERSE 2
From the scorching flames and burning fire (2)
He swiftly removed me the Angel Gabriel my rescuer (2)

CHORUS
From the scorching flames and burning fire (2)
He swiftly removed me the Angel Gabriel my rescuer (2)

VERSE 3
Leader of the captives Ashpenaz (exactly how it looks) was amazed
By the edge of the fire he saw me while I praised
Though I’m a child of God the king didn’t notice
Our guardian angel with his might preserved us from the blazing furnace

CHORUS
From the scorching flames and burning fire (2)
He swiftly removed me the Angel Gabriel my rescuer (2)

VERSE 4
From the scorching flames and burning fire (2)
He swiftly removed me the Angel Gabriel my rescuer (2)

CHORUS
From the scorching flames and burning fire (2)
He swiftly removed me the Angel Gabriel my rescuer (2)

VERSE 5
The enemy that induced trials lit the torch
Although my body was burned my soul was not scorched
Survived the Babylonian fire through aid
The servant of the Lord with his pleas my father provided me with shade (2)

CHORUS
From the scorching flames and burning fire (2)
He swiftly removed me the Angel Gabriel my rescuer (2)

VERSE 6
From the scorching flames and burning fire (2)
He swiftly removed me the Angel Gabriel my rescuer (2)

CHORUS
From the scorching flames and burning fire (2)
He swiftly removed me the Angel Gabriel my rescuer (2)

VERSE 7
I won’t succumb though they scare with boiling water
The world may burn in fire but my faith won’t falter
Like he saved Qirqos and Eyeluta from heat
He parted heaven to speedily save me from the ultimate defeat (2)

CHORUS
From the scorching flames and burning fire (2)
He swiftly removed me the Angel Gabriel my rescuer (2)

VERSE 8
From the scorching flames and burning fire (2)
He swiftly removed me the Angel Gabriel my rescuer (2)

CHORUS
From the scorching flames and burning fire (2)
He swiftly removed me the Angel Gabriel my rescuer (2)'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'from-the-scorching-flames', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Gabriel the powerful (gabriel-the-powerful)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'VERSE 1

VERSE 2

VERSE 3',
      lyrics_transliteration = 'VERSE 1

VERSE 2

VERSE 3',
      lyrics_english = 'Gabriel the powerful, the angel of peace and of the good news
You are rescuing, the people of God, from the fire that burns
Your love is written, deep within our hearts
We stand before you, so you can bless us

The stories were told of their resilience,
While in Babylon, the city of death
Even being so young, their faith was shining
St. Gabriel you stood, you were protecting.

When the water boiled, it caused so much fear.
When death and their pain, seemed like it was near.
They prayed and they sang, the mother and child
By the fiery place, when you had arrived

Cyricus had hope, never fearing death
Because St Gabriel, with them you were close
The son told his mom, do not be afraid
This difficult trial, through faith they had passed

I also believe that you will save me,
Intercede to Christ, who loves patiently
So I cross over past this awful time
please give me the strength, so I overcome',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'gabriel-the-powerful'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዝ

VERSE 1
አዝ

CHORUS
አዝ

VERSE 2
አዝ

CHORUS
አዝ

VERSE 3
አዝ

CHORUS
አዝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
CHORUS

VERSE 1
CHORUS

CHORUS
CHORUS

VERSE 2
CHORUS

CHORUS
CHORUS

VERSE 3
CHORUS

CHORUS
CHORUS'
    AND lyrics_english IS NOT DISTINCT FROM 'Gabriel the powerful, the angel of peace and of the good news
You are rescuing, the people of God, from the fire that burns
Your love is written, deep within our hearts
We stand before you, so you can bless us

The stories were told of their resilience,
While in Babylon, the city of death
Even being so young, their faith was shining
St. Gabriel you stood, you were protecting.

When the water boiled, it caused so much fear.
When death and their pain, seemed like it was near.
They prayed and they sang, the mother and child
By the fiery place, when you had arrived

Cyricus had hope, never fearing death
Because St Gabriel, with them you were close
The son told his mom, do not be afraid
This difficult trial, through faith they had passed

I also believe that you will save me,
Intercede to Christ, who loves patiently
So I cross over past this awful time
please give me the strength, so I overcome'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'gabriel-the-powerful', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Galatee famaadhaa amaa baraabaraattee (galatee-famaadhaa-amaa-baraabaraattee)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 1
Hunda dura akka jirtu
lafaa fi samiin haa dubbatu
Hundi darbees ni jiraatta
yaa Waaqakoo siif galata

VERSE 2
Baraan hin daanga''uu ulfinniif aangoon kee
Ililleen si faarsa dhaabbadhee fuulakee
Warri kaleessa mootii turan
darbaniiru har''a hin jiran

VERSE 3
Beektoonni fi ogeessonni
liqimfamanii du''anii
Dhaloonni dhalootaan barri yoo darbu baraan
Ati ni jiraatta mootii bara baraan

VERSE 4
Ergamoonni samiirratti
ni faarfatu maqaa keetiif
Ilmaan namaa jilbeeffannaan
si waaqessu siif bitamu

VERSE 5
Dureessa hiyyoomsitee beela''aa quubsita
Addunyaa kanarra eenyuut siin qixxaa',
      lyrics_transliteration = 'Galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 1
Hunda dura akka jirtu
Lafaa fi samiin haa dubbatu
Hundi darbees ni jiraatta
Yaa Waaqakoo siif galata

VERSE 2
Baraan hin daanga''uu ulfinniif aangoon kee
Ililleen si faarsa dhaabbadhee fuulakee
Warri kaleessa mootii turan
Darbaniiru har''a hin jiran

VERSE 3
Beektoonni fi ogeessonni
Liqimfamanii du''anii
Dhaloonni dhalootaan barri yoo darbu baraan
Ati ni jiraatta mootii bara baraan

VERSE 4
Ergamoonni samiirratti
Ni faarfatu maqaa keetiif
Ilmaan namaa jilbeeffannaan
Si waaqessu siif bitamu

VERSE 5
Dureessa hiyyoomsitee beela''aa quubsita
Addunyaa kanarra eenyuut siin qixxaa',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'galatee-famaadhaa-amaa-baraabaraattee'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 1
Hunda dura akka jirtu
lafaa fi samiin haa dubbatu
Hundi darbees ni jiraatta
yaa Waaqakoo siif galata

CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 2
Baraan hin daanga''uu ulfinniif aangoon kee
Ililleen si faarsa dhaabbadhee fuulakee
Warri kaleessa mootii turan
darbaniiru har''a hin jiran

CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 3
Beektoonni fi ogeessonni
liqimfamanii du''anii
Dhaloonni dhalootaan barri yoo darbu baraan
Ati ni jiraatta mootii bara baraan

CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 4
Ergamoonni samiirratti
ni faarfatu maqaa keetiif
Ilmaan namaa jilbeeffannaan
si waaqessu siif bitamu

CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 5
Dureessa hiyyoomsitee beela''aa quubsita
Addunyaa kanarra eenyuut siin qixxaa

CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 1
Hunda dura akka jirtu
Lafaa fi samiin haa dubbatu
Hundi darbees ni jiraatta
Yaa Waaqakoo siif galata

CHORUS
Galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 2
Baraan hin daanga''uu ulfinniif aangoon kee
Ililleen si faarsa dhaabbadhee fuulakee
Warri kaleessa mootii turan
Darbaniiru har''a hin jiran

CHORUS
Galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 3
Beektoonni fi ogeessonni
Liqimfamanii du''anii
Dhaloonni dhalootaan barri yoo darbu baraan
Ati ni jiraatta mootii bara baraan

CHORUS
Galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 4
Ergamoonni samiirratti
Ni faarfatu maqaa keetiif
Ilmaan namaa jilbeeffannaan
Si waaqessu siif bitamu

CHORUS
Galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 5
Dureessa hiyyoomsitee beela''aa quubsita
Addunyaa kanarra eenyuut siin qixxaa

CHORUS
Galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'galatee-famaadhaa-amaa-baraabaraattee', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: gdn kon (gdn-kon)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 1
ዝባነይእንዳ ተገርፈ ብዋርዋርታ ናይ ጸሓይ
ግብረይ ገዲዱኒ ተገሊለ
ኣርዑት ሓጥያት ኣብዝባነይ ጼረ
ቃና ቃንዛይ ዝሰመዕ ግንጎይታ

VERSE 2
ግድን ኮኖ መጸ ብሰማርያ
እንክንሰይ ንጽድቂ ዝጸማእኩ እመና
ሕፍኒ ማይ ክነፍገሉ ነቲ ናይ ማያት ጎይታ
ዓይኒ ልበይ ገብን ዝሸፈኖ

VERSE 3
ድፍር ኢለ ንፈዉሰይእማጎጉቶ
ትዘይንዕ እየሱስ ዝብልዎ
ኩለንትናይ ብፍቅሪ ረትዕ
ወዝቢ ጎፍ ዝበለኒ ዘይፈልጠኒ መሲሉ

VERSE 4
ኣበይ ከ ገሚተዮ ምኻነይ ዕላምኡ
ነገረኒ ዘርዚሩ ንግብረይ
ንኽምለስ ናብ ፈለማ ዉነይ
ካብ ፍላጻታት ሞት ሰዊሩኒ

VERSE 5
ኣቦ ምሕረት ኣብ ፍቅሩ ኣጽሊሉኒ',
      lyrics_transliteration = 'Nits’orey keragf mihretu kigelts’o
May siga leminu may hiywet kibeni
Ab ila yaeqob kembeal qots’era kif ilu ts’enhani
Ch’ewu qetri eye ziwufer bihite nab ayni may

VERSE 1
Zibaneyenda tegerfe biwarwarta nay ts’ehay
Gibrey gediduni tegelile
Arut hat’yat abzbaney ts’ere
Qana qanzay zisemee gingoyta

VERSE 2
Gidn kono mets’e bisemarya
Enknsey nits’dqi zits’emaeku emena
Hifni may kinefgelu neti nay mayat goyta
Ayni libey gebn zishefeno

VERSE 3
Difr ile nifewuseyemagoguto
Tizeyne eyesus ziblwo
Kulentnay bifqri rete
Wezbi gof zibeleni zeyfelt’eni mesilu

VERSE 4
Abey ke gemiteyo miኻney elamu
Negereni zerziru nigbrey
Niኽmles nab felema wuney
Kab filats’atat mot sewiruni

VERSE 5
Abo mihret ab fiqru ats’liluni',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'gdn-kon'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 1
ዝባነይእንዳ ተገርፈ ብዋርዋርታ ናይ ጸሓይ
ግብረይ ገዲዱኒ ተገሊለ
ኣርዑት ሓጥያት ኣብዝባነይ ጼረ
ቃና ቃንዛይ ዝሰመዕ ግንጎይታ

CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 2
ግድን ኮኖ መጸ ብሰማርያ
እንክንሰይ ንጽድቂ ዝጸማእኩ እመና
ሕፍኒ ማይ ክነፍገሉ ነቲ ናይ ማያት ጎይታ
ዓይኒ ልበይ ገብን ዝሸፈኖ

CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 3
ድፍር ኢለ ንፈዉሰይእማጎጉቶ
ትዘይንዕ እየሱስ ዝብልዎ
ኩለንትናይ ብፍቅሪ ረትዕ
ወዝቢ ጎፍ ዝበለኒ ዘይፈልጠኒ መሲሉ

CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 4
ኣበይ ከ ገሚተዮ ምኻነይ ዕላምኡ
ነገረኒ ዘርዚሩ ንግብረይ
ንኽምለስ ናብ ፈለማ ዉነይ
ካብ ፍላጻታት ሞት ሰዊሩኒ

CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ

VERSE 5
ኣቦ ምሕረት ኣብ ፍቅሩ ኣጽሊሉኒ

CHORUS
ንጾረይ ከራግፍ ምሕረቱ ክገልጾ
ማይ ስጋ ለሚኑ ማይ ህይወት ክበኒ
ኣብ ዒላ ያእቆብ ከምበዓል ቆጸራ ክፍ ኢሉ ጸንሓኒ
ጨዉ ቀትሪ እየ ዝዉፈር ብሒተ ናብ ዓይኒ ማይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nits’orey keragf mihretu kigelts’o
May siga leminu may hiywet kibeni
Ab ila yaeqob kembeal qots’era kif ilu ts’enhani
Ch’ewu qetri eye ziwufer bihite nab ayni may

VERSE 1
Zibaneyenda tegerfe biwarwarta nay ts’ehay
Gibrey gediduni tegelile
Arut hat’yat abzbaney ts’ere
Qana qanzay zisemee gingoyta

CHORUS
Nits’orey keragf mihretu kigelts’o
May siga leminu may hiywet kibeni
Ab ila yaeqob kembeal qots’era kif ilu ts’enhani
Ch’ewu qetri eye ziwufer bihite nab ayni may

VERSE 2
Gidn kono mets’e bisemarya
Enknsey nits’dqi zits’emaeku emena
Hifni may kinefgelu neti nay mayat goyta
Ayni libey gebn zishefeno

CHORUS
Nits’orey keragf mihretu kigelts’o
May siga leminu may hiywet kibeni
Ab ila yaeqob kembeal qots’era kif ilu ts’enhani
Ch’ewu qetri eye ziwufer bihite nab ayni may

VERSE 3
Difr ile nifewuseyemagoguto
Tizeyne eyesus ziblwo
Kulentnay bifqri rete
Wezbi gof zibeleni zeyfelt’eni mesilu

CHORUS
Nits’orey keragf mihretu kigelts’o
May siga leminu may hiywet kibeni
Ab ila yaeqob kembeal qots’era kif ilu ts’enhani
Ch’ewu qetri eye ziwufer bihite nab ayni may

VERSE 4
Abey ke gemiteyo miኻney elamu
Negereni zerziru nigbrey
Niኽmles nab felema wuney
Kab filats’atat mot sewiruni

CHORUS
Nits’orey keragf mihretu kigelts’o
May siga leminu may hiywet kibeni
Ab ila yaeqob kembeal qots’era kif ilu ts’enhani
Ch’ewu qetri eye ziwufer bihite nab ayni may

VERSE 5
Abo mihret ab fiqru ats’liluni

CHORUS
Nits’orey keragf mihretu kigelts’o
May siga leminu may hiywet kibeni
Ab ila yaeqob kembeal qots’era kif ilu ts’enhani
Ch’ewu qetri eye ziwufer bihite nab ayni may'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'gdn-kon', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Gebire Menifes Kidus Yealem Birihan Nachew (gebire-menifes-kidus-yealem-birihan-nachew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 1
መላኩ ገብርኤል መንገድ እያሳየህ
በተጋድሎ ዘመን ካንተ መች ተለየህ
እህ ይህው ለዘላለም ያበረል ስራቸው (2) ያበራል ስራቸው (2)
በእግዚአብሔር ተመረጥክ ገና በማህፀን

VERSE 2
ገብረመንፈስ ቅዱስ ፃዲቁ አባታችን
የእናት አባትህ ምልጃና ልመና
ፍፃሜን አገኘ አንተን ወለዱና
እህ ይህው ለዘላለም ያበራል ስራቸው (2)ያበራል ስራቸው (2)

VERSE 3
ተጋድሎው ድንቅ ነው ፅንሰቱ ልደቱ
በእግዚአብሔር ፊት ክቡር ነው እረፍቱ
ምድራዊውን ምግብ አንዳች አልቀመሰም
በሰው የተሰፋ ልብስም አለበሰም

VERSE 4
እህ ይህው ለዘላለም ያበራል ስራቸው ( 2) ያበራል ስራቸው (2)
ገብረ መንፈስ ቅዱስ ያበራል ተጋድሎው
ሀይልንም ያደርጋል ፀሎትና ምልጃው
አናብስት አናብርት እየተከተሉ

VERSE 5
ከእግሮቹ ትቢያ በልተው ይጠግባሉ
እህ ይህው ለዘላለም ያበራል ስራቸው (2)ያበራል ስራቸው (2)
ዛሬም በኛ ዘመን በእምነት በፀበሉ
ከህመሙ አልጋ ስንቶቹ ቀና አሉ

VERSE 6
ካምላክ የተሰጠው ቃልኪዳኑ ፅኑ
በረከት ያድላል በምልጃው ላመኑ
ገብረ መንፈስ ቅዱስ ያለም ብርሐን ናቸው (2)
ይህው ለዘላለም ያበራል ስራቸው ያበራል ስራቸው',
      lyrics_transliteration = 'Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos

VERSE 1
Melaku Gebriel menged eyasayeh
Betegadlo zemen kante mech teleyeh
Eh yihw lezelalem yaberel sirachew (2) yaberal sirachew (2)
BeEgziabher temeret’k gena bemahts’en

VERSE 2
Gebremenfes Kidus ts’adiqu Abatachen
Yeenat abath miljana limena
Fits’amen agegne anten weleduna
Eh yihw lezelalem yaberal sirachew (2)yaberal sirachew (2)

VERSE 3
Tegadlow dinq new ts’nsetu lidetu
BeEgziabher fit kibur new ereftu
Midrawiwn migb andach alqemesem
Besew yetesefa libsm alebesem

VERSE 4
Eh yihw lezelalem yaberal sirachew (2) yaberal sirachew (2)
Gebre menfes Kidus yaberal tegadlow
Heylnm yadergal ts’elotna miljaw
Anabst anabrt eyeteketelu

VERSE 5
Keegrochu tibiya beltew yit’egbalu
Eh yihw lezelalem yaberal sirachew (2)yaberal sirachew (2)
Zarem begna zemen beemnet bets’ebelu
Kehmemu alga sintochu qena alu

VERSE 6
Kamlak yeteset’ew qalkidanu ts’nu
Bereket yadlal bemljaw lamenu
Gebre menfes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew yaberal sirachew',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'gebire-menifes-kidus-yealem-birihan-nachew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 1
መላኩ ገብርኤል መንገድ እያሳየህ
በተጋድሎ ዘመን ካንተ መች ተለየህ
እህ ይህው ለዘላለም ያበረል ስራቸው (2) ያበራል ስራቸው (2)
በእግዚአብሔር ተመረጥክ ገና በማህፀን

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 2
ገብረመንፈስ ቅዱስ ፃዲቁ አባታችን
የእናት አባትህ ምልጃና ልመና
ፍፃሜን አገኘ አንተን ወለዱና
እህ ይህው ለዘላለም ያበራል ስራቸው (2)ያበራል ስራቸው (2)

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 3
ተጋድሎው ድንቅ ነው ፅንሰቱ ልደቱ
በእግዚአብሔር ፊት ክቡር ነው እረፍቱ
ምድራዊውን ምግብ አንዳች አልቀመሰም
በሰው የተሰፋ ልብስም አለበሰም

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 4
እህ ይህው ለዘላለም ያበራል ስራቸው ( 2) ያበራል ስራቸው (2)
ገብረ መንፈስ ቅዱስ ያበራል ተጋድሎው
ሀይልንም ያደርጋል ፀሎትና ምልጃው
አናብስት አናብርት እየተከተሉ

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 5
ከእግሮቹ ትቢያ በልተው ይጠግባሉ
እህ ይህው ለዘላለም ያበራል ስራቸው (2)ያበራል ስራቸው (2)
ዛሬም በኛ ዘመን በእምነት በፀበሉ
ከህመሙ አልጋ ስንቶቹ ቀና አሉ

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ

VERSE 6
ካምላክ የተሰጠው ቃልኪዳኑ ፅኑ
በረከት ያድላል በምልጃው ላመኑ
ገብረ መንፈስ ቅዱስ ያለም ብርሐን ናቸው (2)
ይህው ለዘላለም ያበራል ስራቸው ያበራል ስራቸው

CHORUS
ገብረ መ ንፈስ ቅዱስ ያለም ብርሐን ናቸው ( 2 )
ይሕው ለዘላለም ያበራል ስራቸው (2) ያበራል ስራቸው
ነቃ በረከት ነህ ገብረ መንፈስ ቅዱስ
የፅድቅ ሀዋርያ የየሱስ ክርስቶስ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos

VERSE 1
Melaku Gebriel menged eyasayeh
Betegadlo zemen kante mech teleyeh
Eh yihw lezelalem yaberel sirachew (2) yaberal sirachew (2)
BeEgziabher temeret’k gena bemahts’en

CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos

VERSE 2
Gebremenfes Kidus ts’adiqu Abatachen
Yeenat abath miljana limena
Fits’amen agegne anten weleduna
Eh yihw lezelalem yaberal sirachew (2)yaberal sirachew (2)

CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos

VERSE 3
Tegadlow dinq new ts’nsetu lidetu
BeEgziabher fit kibur new ereftu
Midrawiwn migb andach alqemesem
Besew yetesefa libsm alebesem

CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos

VERSE 4
Eh yihw lezelalem yaberal sirachew (2) yaberal sirachew (2)
Gebre menfes Kidus yaberal tegadlow
Heylnm yadergal ts’elotna miljaw
Anabst anabrt eyeteketelu

CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos

VERSE 5
Keegrochu tibiya beltew yit’egbalu
Eh yihw lezelalem yaberal sirachew (2)yaberal sirachew (2)
Zarem begna zemen beemnet bets’ebelu
Kehmemu alga sintochu qena alu

CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos

VERSE 6
Kamlak yeteset’ew qalkidanu ts’nu
Bereket yadlal bemljaw lamenu
Gebre menfes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew yaberal sirachew

CHORUS
Gebre me nifes Kidus yalem birhen nachew (2)
Yihw lezelalem yaberal sirachew (2) yaberal sirachew
Neqa bereket neh gebre menfes Kidus
Yets’dq hewarya yeyesus Kristos'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'gebire-menifes-kidus-yealem-birihan-nachew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Gebiriel Belut (gebiriel-belut)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት

VERSE 1
ምህረትን ያዘልክ እሳታዊ መልኣክ
በዘመነ አዲስ ምስራች የምትሰብክ
ዘወትር የምትማልድ የምትኖር በራማ
ደግሞ በምድር ያለህ ፀሎትን ልትሰማ

VERSE 2
ባያድነን እንኳን ያመንነው እውነት
አንሰግድም አሉ ወድቀን ለጣኦት
ከመሃል ተገኘህ በእሳት ሳይበሉ
ዛሬም ዙሪያቸው ነህ ላመኑት በቃሉ

VERSE 3
እጅግ ከተራቡት ከአናብስቱ መሃል
በንጉሱ ትዕዛዝ ከሞት መሃል ብጣል
በተሰጠው ኪዳን ሕይወቴን ታድጓል
መልአኩ ገብርኤል ለእኔ ግን ይለያል

VERSE 4
በባቢሉን ምድር በባእዳን ሀገር
ሲድራቅና ሚሳቅ ተብለን አብደናጎር
ለጣኦት እንዳንሰግድ የሆንከን ሞገስ
አምላከ ገብርኤል ስምህ ይቀደስ',
      lyrics_transliteration = 'Dejh met’che bets’enach emnet
Ts’elote derswal beEgziabher fit
Yetefetachhu keesat senselet
Bemezmur qine Gebriel belut

VERSE 1
Mihretn yazelk esatawi melak
Bezemene adis misrach yemtsebk
Zewetr yemtmald yemtnor berama
Degmo bemdr yaleh ts’elotn litsema

VERSE 2
Bayadnen enkwan yamennew ewnet
Ansegdm alu wedqen let’aot
Kemehal tegegneh beesat saybelu
Zarem zuriyachew neh lamenut beqalu

VERSE 3
Ejg keterabut keanabstu mehal
Bengusu tiezaz kemot mehal bit’al
Beteset’ew kidan hiyweten tadgwal
Melaku Gebriel leene gin yileyal

VERSE 4
Bebabilun midr bebaedan heger
Sidraqna misaq teblen abdenagor
Let’aot endansegd yehonken moges
Amlake Gebriel simh yiqedes',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'gebiriel-belut'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት

VERSE 1
ምህረትን ያዘልክ እሳታዊ መልኣክ
በዘመነ አዲስ ምስራች የምትሰብክ
ዘወትር የምትማልድ የምትኖር በራማ
ደግሞ በምድር ያለህ ፀሎትን ልትሰማ

CHORUS
ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት

VERSE 2
ባያድነን እንኳን ያመንነው እውነት
አንሰግድም አሉ ወድቀን ለጣኦት
ከመሃል ተገኘህ በእሳት ሳይበሉ
ዛሬም ዙሪያቸው ነህ ላመኑት በቃሉ

CHORUS
ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት

VERSE 3
እጅግ ከተራቡት ከአናብስቱ መሃል
በንጉሱ ትዕዛዝ ከሞት መሃል ብጣል
በተሰጠው ኪዳን ሕይወቴን ታድጓል
መልአኩ ገብርኤል ለእኔ ግን ይለያል

CHORUS
ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት

VERSE 4
በባቢሉን ምድር በባእዳን ሀገር
ሲድራቅና ሚሳቅ ተብለን አብደናጎር
ለጣኦት እንዳንሰግድ የሆንከን ሞገስ
አምላከ ገብርኤል ስምህ ይቀደስ

CHORUS
ደጅህ መጥቼ በጸናች እምነት
ፀሎቴ ደርሷል በእግዚአብሔር ፊት
የተፈታችሁ ከእሳት ሰንሰለት
በመዝሙር ቅኔ ገብርኤል በሉት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dejh met’che bets’enach emnet
Ts’elote derswal beEgziabher fit
Yetefetachhu keesat senselet
Bemezmur qine Gebriel belut

VERSE 1
Mihretn yazelk esatawi melak
Bezemene adis misrach yemtsebk
Zewetr yemtmald yemtnor berama
Degmo bemdr yaleh ts’elotn litsema

CHORUS
Dejh met’che bets’enach emnet
Ts’elote derswal beEgziabher fit
Yetefetachhu keesat senselet
Bemezmur qine Gebriel belut

VERSE 2
Bayadnen enkwan yamennew ewnet
Ansegdm alu wedqen let’aot
Kemehal tegegneh beesat saybelu
Zarem zuriyachew neh lamenut beqalu

CHORUS
Dejh met’che bets’enach emnet
Ts’elote derswal beEgziabher fit
Yetefetachhu keesat senselet
Bemezmur qine Gebriel belut

VERSE 3
Ejg keterabut keanabstu mehal
Bengusu tiezaz kemot mehal bit’al
Beteset’ew kidan hiyweten tadgwal
Melaku Gebriel leene gin yileyal

CHORUS
Dejh met’che bets’enach emnet
Ts’elote derswal beEgziabher fit
Yetefetachhu keesat senselet
Bemezmur qine Gebriel belut

VERSE 4
Bebabilun midr bebaedan heger
Sidraqna misaq teblen abdenagor
Let’aot endansegd yehonken moges
Amlake Gebriel simh yiqedes

CHORUS
Dejh met’che bets’enach emnet
Ts’elote derswal beEgziabher fit
Yetefetachhu keesat senselet
Bemezmur qine Gebriel belut'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'gebiriel-belut', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Gebiriel Kesemay (gebiriel-kesemay)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 1
ይሁንልኝ አልሸው ትውልድ እንዲፅናና
ከገብርኤል ሰምተው መላአክቱ ሁሉ
ለበጉ ማደሪያ ክብርን ይሰሻሉ
ብፅአት እንላለን እንኛም አደግድገን

VERSE 2
የራማውን ለዑል አብነት አድርገን
ስርሽ በምድር ነው ሐረግሽ በሰማይ
ንፁህ መሶበ ወርቅ የተምላሽ ሲሳይ
ይማይፅንሽ ፍሬን በላነው ጠጣነው

VERSE 3
በኤፍራታ ሰምትን በዱር አግኝተነው
የተሰወረውን መና በልተነዋል
ከተመርጣት ጋር ብፅአት ብለናል
ከተፈxሮ በላይ ፅንስን ያዘለለ

VERSE 4
የእሳት ምሶሶ ባንቺ ተተከለ
የእግዚአብሔር ሃገሩ የእንጀራ ቤታችን
ምንኛ ድንቅ ነው ክብርሽ እናታችን
ብፅዕት እንላለን እኛም አደግድገን

VERSE 5
ቅድስት ኤልሳቤትን አብነት አድርገን
ተወልዶ በግርግም ተኝቶ ስላዩት
ሰውና መላአክት አብረው አከበሩት
የጥሉ ግድግዳ ብልጅሽ ፈረሰ

VERSE 6
ብዳግሚት ሔዋን የአዳም ዘር ተካሰ
እጅ እንነሳለን ሆነን በትሕትና
ክብርሽን መመስከር ክብራችን ነው እና
ትወልዶ በግርግም ተኝቶ ስላዩት

VERSE 7
ሰውና መላእክት አብረው አከበሩት
የጥሉ ግድግዳ ብልጅሽ ፈረሰ
በዳግሚት ሔዋን የአዳም ዘር ተካሰ
ብፅአት እንላለን እኛም አደግድገን

VERSE 8
ቅዱስ ገብርኤልን አብነት አድርግን',
      lyrics_transliteration = 'Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 1
Yihunlgn alshew tiwld endits’nana
Kegebrel semtew melaaktu hulu
Lebegu maderiya kibrn yiseshalu
Bits’at enlalen engnam adegdgen

VERSE 2
Yeramawn leul abnet adrgen
Sirsh bemdr new heregsh besemay
Nits’uh mesobe werq yetemlash sisay
Yimayts’nsh firen belanew t’et’anew

VERSE 3
Beefrata semtn bedur aggntenew
Yetesewerewn mena beltenewal
Ketemert’at gar bits’at bilenal
Ketefexro belay ts’nsn yazelele

VERSE 4
Yeesat misoso banchi tetekele
YeEgziabher hageru yeenjera betachn
Mingna dinq new kibrsh enatachn
Bits’et enlalen egnam adegdgen

VERSE 5
Kidist elsabetn abnet adrgen
Teweldo begrgm tegnto silayut
Sewna melaakt abrew akeberut
Yet’lu gidgda biljsh ferese

VERSE 6
Bidagmit hewan yeadam zer tekase
Ej ennesalen honen bethtna
Kibrshn memesker kibrachn new ena
Tiweldo begrgm tegnto silayut

VERSE 7
Sewna melaekt abrew akeberut
Yet’lu gidgda biljsh ferese
Bedagmit hewan yeadam zer tekase
Bits’at enlalen egnam adegdgen

VERSE 8
Kidus gebreln abnet adrgn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'gebiriel-kesemay'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 1
ይሁንልኝ አልሸው ትውልድ እንዲፅናና
ከገብርኤል ሰምተው መላአክቱ ሁሉ
ለበጉ ማደሪያ ክብርን ይሰሻሉ
ብፅአት እንላለን እንኛም አደግድገን

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 2
የራማውን ለዑል አብነት አድርገን
ስርሽ በምድር ነው ሐረግሽ በሰማይ
ንፁህ መሶበ ወርቅ የተምላሽ ሲሳይ
ይማይፅንሽ ፍሬን በላነው ጠጣነው

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 3
በኤፍራታ ሰምትን በዱር አግኝተነው
የተሰወረውን መና በልተነዋል
ከተመርጣት ጋር ብፅአት ብለናል
ከተፈxሮ በላይ ፅንስን ያዘለለ

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 4
የእሳት ምሶሶ ባንቺ ተተከለ
የእግዚአብሔር ሃገሩ የእንጀራ ቤታችን
ምንኛ ድንቅ ነው ክብርሽ እናታችን
ብፅዕት እንላለን እኛም አደግድገን

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 5
ቅድስት ኤልሳቤትን አብነት አድርገን
ተወልዶ በግርግም ተኝቶ ስላዩት
ሰውና መላአክት አብረው አከበሩት
የጥሉ ግድግዳ ብልጅሽ ፈረሰ

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 6
ብዳግሚት ሔዋን የአዳም ዘር ተካሰ
እጅ እንነሳለን ሆነን በትሕትና
ክብርሽን መመስከር ክብራችን ነው እና
ትወልዶ በግርግም ተኝቶ ስላዩት

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 7
ሰውና መላእክት አብረው አከበሩት
የጥሉ ግድግዳ ብልጅሽ ፈረሰ
በዳግሚት ሔዋን የአዳም ዘር ተካሰ
ብፅአት እንላለን እኛም አደግድገን

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ

VERSE 8
ቅዱስ ገብርኤልን አብነት አድርግን

CHORUS
ገብርኤል በሰማይ ኤልሳቤት በምድር
ገብርኤል በሰማይ ኤልሳቤት በምድር
ይመሰክራሉ ድንግል ያንቺን ክብር (x2)
ትፀንስ ስልሽ በከበረ ዜማ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 1
Yihunlgn alshew tiwld endits’nana
Kegebrel semtew melaaktu hulu
Lebegu maderiya kibrn yiseshalu
Bits’at enlalen engnam adegdgen

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 2
Yeramawn leul abnet adrgen
Sirsh bemdr new heregsh besemay
Nits’uh mesobe werq yetemlash sisay
Yimayts’nsh firen belanew t’et’anew

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 3
Beefrata semtn bedur aggntenew
Yetesewerewn mena beltenewal
Ketemert’at gar bits’at bilenal
Ketefexro belay ts’nsn yazelele

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 4
Yeesat misoso banchi tetekele
YeEgziabher hageru yeenjera betachn
Mingna dinq new kibrsh enatachn
Bits’et enlalen egnam adegdgen

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 5
Kidist elsabetn abnet adrgen
Teweldo begrgm tegnto silayut
Sewna melaakt abrew akeberut
Yet’lu gidgda biljsh ferese

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 6
Bidagmit hewan yeadam zer tekase
Ej ennesalen honen bethtna
Kibrshn memesker kibrachn new ena
Tiweldo begrgm tegnto silayut

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 7
Sewna melaekt abrew akeberut
Yet’lu gidgda biljsh ferese
Bedagmit hewan yeadam zer tekase
Bits’at enlalen egnam adegdgen

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema

VERSE 8
Kidus gebreln abnet adrgn

CHORUS
Gebriel besemay elsabet bemdr
Gebriel besemay elsabet bemdr
Yimesekralu Dingil yanchin kibir (x2)
Tits’ens silsh bekebere zema'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'gebiriel-kesemay', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Gebiriel-yetamenik Yenefis Wedaj (gebiriel-yetamenik-yenefis-wedaj)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 1
ነበልባሉን ውሀ አደረግኸው
ሰንሰለቱን በጣጠስከው
የነደደው እሳት ጠፍቷል
ከእኛ ጋር ገብርኤል ቆሟል

VERSE 2
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል

VERSE 3
አዝ…..
የአናብስቱን አፍ ዘጋኸው
ወኅኒውን አናወጽከው
በሕይወት መንገድ የምትመራ

VERSE 4
ለእግዚአብሔር ሕዝብ የምትራራ
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል

VERSE 5
ለድንግል ነገርህ ገብርኤል
አዝ…..
ጸሎት ይዞ የሚወጣ
ምሕረት ይዞ የሚመጣ

VERSE 6
ዘወትር የሚያይ የአምላኩን ፊት
ቅዱስ ገብርኤል ሊቀ መላእክት
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል

VERSE 7
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
አዝ…
በመዐልትና በሌሊት

VERSE 8
የሚያድነን ከጥፋት
ዙሪያችንን የሚሰፍር
የሚያማልድ ከእግዚአብሔር
መላእክቱን በሰማይ ገብርኤል

VERSE 9
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
አዝ….',
      lyrics_transliteration = 'Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 1
Nebelbalun wihe aderegኸw
Senseletun bet’at’eskew
Yenededew esat t’eftwal
Keegna gar Gebriel qomwal

VERSE 2
Melaektun besemay Gebriel
Endaregagah Gebriel
Yeamlakn sew mehon Gebriel
Ledngl negerh Gebriel

VERSE 3
Yeanabstun af zegaኸw
Wehniwn anawets’kew
Behywet menged yemtmera

VERSE 4
LeEgziabher hizb yemtrara
Melaektun besemay Gebriel
Endaregagah Gebriel
Yeamlakn sew mehon Gebriel

VERSE 5
Ledngl negerh Gebriel
Ts’elot yizo yemiwet’a
Mihret yizo yemimet’a

VERSE 6
Zewetr yemiyay yeamlakun fit
Kidus Gebriel liqe melaekt
Melaektun besemay Gebriel
Endaregagah Gebriel

VERSE 7
Yeamlakn sew mehon Gebriel
Ledngl negerh Gebriel
Bemealtna belelit

VERSE 8
Yemiyadnen ket’fat
Zuriyachnn yemisefr
Yemiyamald keegziabher
Melaektun besemay Gebriel

VERSE 9
Endaregagah Gebriel
Yeamlakn sew mehon Gebriel
Ledngl negerh Gebriel',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'gebiriel-yetamenik-yenefis-wedaj'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 1
ነበልባሉን ውሀ አደረግኸው
ሰንሰለቱን በጣጠስከው
የነደደው እሳት ጠፍቷል
ከእኛ ጋር ገብርኤል ቆሟል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 2
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 3
አዝ…..
የአናብስቱን አፍ ዘጋኸው
ወኅኒውን አናወጽከው
በሕይወት መንገድ የምትመራ

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 4
ለእግዚአብሔር ሕዝብ የምትራራ
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 5
ለድንግል ነገርህ ገብርኤል
አዝ…..
ጸሎት ይዞ የሚወጣ
ምሕረት ይዞ የሚመጣ

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 6
ዘወትር የሚያይ የአምላኩን ፊት
ቅዱስ ገብርኤል ሊቀ መላእክት
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 7
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
አዝ…
በመዐልትና በሌሊት

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 8
የሚያድነን ከጥፋት
ዙሪያችንን የሚሰፍር
የሚያማልድ ከእግዚአብሔር
መላእክቱን በሰማይ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 9
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
አዝ….

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 1
Nebelbalun wihe aderegኸw
Senseletun bet’at’eskew
Yenededew esat t’eftwal
Keegna gar Gebriel qomwal

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 2
Melaektun besemay Gebriel
Endaregagah Gebriel
Yeamlakn sew mehon Gebriel
Ledngl negerh Gebriel

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 3
CHORUS
Yeanabstun af zegaኸw
Wehniwn anawets’kew
Behywet menged yemtmera

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 4
LeEgziabher hizb yemtrara
Melaektun besemay Gebriel
Endaregagah Gebriel
Yeamlakn sew mehon Gebriel

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 5
Ledngl negerh Gebriel
CHORUS
Ts’elot yizo yemiwet’a
Mihret yizo yemimet’a

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 6
Zewetr yemiyay yeamlakun fit
Kidus Gebriel liqe melaekt
Melaektun besemay Gebriel
Endaregagah Gebriel

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 7
Yeamlakn sew mehon Gebriel
Ledngl negerh Gebriel
CHORUS
Bemealtna belelit

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 8
Yemiyadnen ket’fat
Zuriyachnn yemisefr
Yemiyamald keegziabher
Melaektun besemay Gebriel

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher

VERSE 9
Endaregagah Gebriel
Yeamlakn sew mehon Gebriel
Ledngl negerh Gebriel
CHORUS

CHORUS
Yetamenk yenefs wedaj
Yemhret amalaj
Ante neh Gebriel
Yemtqom beqdme Egziabher'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'gebiriel-yetamenik-yenefis-wedaj', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Gebirielin Lakew (gebirielin-lakew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 1
ሀይለልዑል ወልም ስጋሽን ይለብሳል
በተለየ አካሉ ወዳንች ይመጣል
ከስጋሽም ስጋን ከነስሽም ነፍስ ነስቶ ይዋሐዳል
ልክ እንደህፃናት ካንች ይወልዳል

VERSE 2
ደንቆሮ ሊሰማ ድዶች ሊናገሩ
በጌታ ታምራት እውራን ሊበሩ
ሙታን ይነሱ ዘንድ በማህፀንሽ ፍሬ
ከእግዚአብሔር ወዳንች ተልኪያለሁ ዛሬ

VERSE 3
ደስ አሰኛት አለው በልዩ ሰላምታ
ሐሴት እንድታደርግ ምስራቹን ሰምታ
ድዳ እንዳደረከው ካህን ዘካርያስን
እንዳታሳዝናት ከእርሷ ጋር ስትደርስ

VERSE 4
ገብርኤል በደስታ ምስራቹን ይዞ
ከሰማይ ወረደ በአምላኩ ታዞ
በሊባኖስ መንደር እስኪሰማ ድረስ
ክንፋን እያማታ መጣ ሲገሰግስ

VERSE 5
ደስ በልሽ አላት እየተሳለማት
ሀርን ከወርቅ ጋር ስትፈትል አግኝቷት
እውነተኛው ንጉስ ካንች ይወለዳል
ላንች ፍቅር እና አንድነት ይገባል

VERSE 6
አዝማች (2)',
      lyrics_transliteration = 'Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl

VERSE 1
Heylelul welm sigashn yilebsal
Beteleye akalu wedanch yimet’al
Kesgashm sigan kenesshm nefs nesto yiwahedal
Lik endehts’anat kanch yiweldal

VERSE 2
Denqoro lisema didoch linageru
Begeta tamrat ewran liberu
Mutan yinesu zend bemahts’ensh fire
Keegziabher wedanch telkiyalehu zare

VERSE 3
Des asegnat alew belyu selamta
Heset endtaderg misrachun semta
Dida endaderekew kahn zekaryasn
Endatasaznat keerswa gar sitders

VERSE 4
Gebriel bedesta misrachun yizo
Kesemay werede beamlaku tazo
Belibanos mender eskisema dires
Kinfan eyamata met’a sigesegs

VERSE 5
Des belsh alat eyetesalemat
Hern kewerq gar sitfetl aggntwat
Ewnetegnaw nigus kanch yiweledal
Lanch fiqr ena andnet yigebal

VERSE 6',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'gebirielin-lakew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 1
ሀይለልዑል ወልም ስጋሽን ይለብሳል
በተለየ አካሉ ወዳንች ይመጣል
ከስጋሽም ስጋን ከነስሽም ነፍስ ነስቶ ይዋሐዳል
ልክ እንደህፃናት ካንች ይወልዳል

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 2
ደንቆሮ ሊሰማ ድዶች ሊናገሩ
በጌታ ታምራት እውራን ሊበሩ
ሙታን ይነሱ ዘንድ በማህፀንሽ ፍሬ
ከእግዚአብሔር ወዳንች ተልኪያለሁ ዛሬ

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 3
ደስ አሰኛት አለው በልዩ ሰላምታ
ሐሴት እንድታደርግ ምስራቹን ሰምታ
ድዳ እንዳደረከው ካህን ዘካርያስን
እንዳታሳዝናት ከእርሷ ጋር ስትደርስ

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 4
ገብርኤል በደስታ ምስራቹን ይዞ
ከሰማይ ወረደ በአምላኩ ታዞ
በሊባኖስ መንደር እስኪሰማ ድረስ
ክንፋን እያማታ መጣ ሲገሰግስ

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 5
ደስ በልሽ አላት እየተሳለማት
ሀርን ከወርቅ ጋር ስትፈትል አግኝቷት
እውነተኛው ንጉስ ካንች ይወለዳል
ላንች ፍቅር እና አንድነት ይገባል

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 6
አዝማች (2)

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl

VERSE 1
Heylelul welm sigashn yilebsal
Beteleye akalu wedanch yimet’al
Kesgashm sigan kenesshm nefs nesto yiwahedal
Lik endehts’anat kanch yiweldal

CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl

VERSE 2
Denqoro lisema didoch linageru
Begeta tamrat ewran liberu
Mutan yinesu zend bemahts’ensh fire
Keegziabher wedanch telkiyalehu zare

CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl

VERSE 3
Des asegnat alew belyu selamta
Heset endtaderg misrachun semta
Dida endaderekew kahn zekaryasn
Endatasaznat keerswa gar sitders

CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl

VERSE 4
Gebriel bedesta misrachun yizo
Kesemay werede beamlaku tazo
Belibanos mender eskisema dires
Kinfan eyamata met’a sigesegs

CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl

VERSE 5
Des belsh alat eyetesalemat
Hern kewerq gar sitfetl aggntwat
Ewnetegnaw nigus kanch yiweledal
Lanch fiqr ena andnet yigebal

CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl

VERSE 6
CHORUS

CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'gebirielin-lakew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Gebre Menfes Kidus Ye’Alem Birhan Natchew (gebremenfes-kidus-yealem-birhan)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 1
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘለለም ያበራል ስራቸው (2)

VERSE 2
ነቅዓ በረከት ነህ ገብረመንፈስ ቅዱስ
የፅድቅ ሐወርያ የኢየሱስ ክርስቶስ
መልአኩ ገብርኤል መንገዱ እያሳየህ
በተጋድሎ ዘመን ካንተ መቸ ተለየ

VERSE 3
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል ስራቸው

VERSE 4
በእግዝአብሄር ተመረጥክ ገና በማህፀን
ገብረመንፈስ ቅዱስ ፃድቁ አባታችን
የእናት አባትህ ምልጃና ልመና
ፍፃሜን አገኘ ኣንተን ወለዱና

VERSE 5
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል

VERSE 6
ተጋድለው ድንቅ ነው ፅንሰቱ ልደቱ
በእግዝአብሄር ፊት ክቡር ነው እረፍቱ
ምድራዊውን ምግብ አንዳች አልቀመሰም
በሰው የተሰፋ ልብስም አልለበሰም

VERSE 7
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል

VERSE 8
ገብረመንፈስ ቅዱስ ያበራል ተጋድሎው
ሃይልንም ያድርጋል ፀሎትና ምልጃው
አናብስት አናብርት እየተከተሉ
ከእግረቹ ትቢያ በልተው ይጠግባሉ

VERSE 9
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል

VERSE 10
ዛሬም በኛ ዘመን በእምነት በፀበሉ
ከህመሙ አልጋ ስንቶቹ ቀና አሉ
ከአምላክ የተሰጠው ቃልኪዳኑ ፅኑ
በረከት ያድላል በምልጃው ላመኑ

VERSE 11
ገብረመንፈሥ ቅዱሥ የዓለም ብርሃን ናቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል ስራቸው

VERSE 12
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል',
      lyrics_transliteration = 'Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 1
Yihaw lezelalem yaberal sratchew
Yihaw lezelelem yaberal sratchew (2)

VERSE 2
Neqa bereket neh Gebre Menfes Kidus
Ye-tsedeq hawarya ye-Iyesus Kristos
Melaku Gebriel mengedu iyasayeh
Be-tegadlo zemen kante meche teleye

VERSE 3
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal sratchew

VERSE 4
Be-egziabher temereTik gena be-mahtsen
Gebre Menfes Kidus tsadqu abatachen
Ye-enat abatih miljana limena
Fits’ame agenye anta weleduna

VERSE 5
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal

VERSE 6
Tegadlew dink new ts’nsetu ledetu
Be-egziabher fit kibur new ereftu
Midrawiw migib andach alkemesem
Be-sew yetesefa libs’m allebesem

VERSE 7
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal

VERSE 8
Gebre Menfes Kidus yaberal tegadlow
Haylnm yadergal tselotna miljaw
Anabst anabert iyeteketelu
Ke-egrech’u tinbiya beltew yitegabal

VERSE 9
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal

VERSE 10
Zarem benya zemen be-emnet be-tsebelu
Ke-hmemu alga sentu qena alu
Ke-amlak yetesetew qal-kidanu ts’nu
Bereket yadelal be-miljaw yamenu

VERSE 11
Gebre Menfes Kidus ye’alem birhan natchew
Yihaw lezelalem yaberal sratchew yaberal sratchew

VERSE 12
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal sratchew',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'gebremenfes-kidus-yealem-birhan'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 1
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘለለም ያበራል ስራቸው (2)

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 2
ነቅዓ በረከት ነህ ገብረመንፈስ ቅዱስ
የፅድቅ ሐወርያ የኢየሱስ ክርስቶስ
መልአኩ ገብርኤል መንገዱ እያሳየህ
በተጋድሎ ዘመን ካንተ መቸ ተለየ

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 3
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል ስራቸው

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 4
በእግዝአብሄር ተመረጥክ ገና በማህፀን
ገብረመንፈስ ቅዱስ ፃድቁ አባታችን
የእናት አባትህ ምልጃና ልመና
ፍፃሜን አገኘ ኣንተን ወለዱና

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 5
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 6
ተጋድለው ድንቅ ነው ፅንሰቱ ልደቱ
በእግዝአብሄር ፊት ክቡር ነው እረፍቱ
ምድራዊውን ምግብ አንዳች አልቀመሰም
በሰው የተሰፋ ልብስም አልለበሰም

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 7
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 8
ገብረመንፈስ ቅዱስ ያበራል ተጋድሎው
ሃይልንም ያድርጋል ፀሎትና ምልጃው
አናብስት አናብርት እየተከተሉ
ከእግረቹ ትቢያ በልተው ይጠግባሉ

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 9
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 10
ዛሬም በኛ ዘመን በእምነት በፀበሉ
ከህመሙ አልጋ ስንቶቹ ቀና አሉ
ከአምላክ የተሰጠው ቃልኪዳኑ ፅኑ
በረከት ያድላል በምልጃው ላመኑ

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 11
ገብረመንፈሥ ቅዱሥ የዓለም ብርሃን ናቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል ስራቸው

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)

VERSE 12
ይኸው ለዘላለም ያበራል ስራቸው
ይኸው ለዘላለም ያበራል ስራቸው ያበራል

CHORUS
ገብረመንፈሥ ቅዱሥ የአለም ብርሃን ናቸው (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 1
Yihaw lezelalem yaberal sratchew
Yihaw lezelelem yaberal sratchew (2)

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 2
Neqa bereket neh Gebre Menfes Kidus
Ye-tsedeq hawarya ye-Iyesus Kristos
Melaku Gebriel mengedu iyasayeh
Be-tegadlo zemen kante meche teleye

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 3
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal sratchew

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 4
Be-egziabher temereTik gena be-mahtsen
Gebre Menfes Kidus tsadqu abatachen
Ye-enat abatih miljana limena
Fits’ame agenye anta weleduna

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 5
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 6
Tegadlew dink new ts’nsetu ledetu
Be-egziabher fit kibur new ereftu
Midrawiw migib andach alkemesem
Be-sew yetesefa libs’m allebesem

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 7
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 8
Gebre Menfes Kidus yaberal tegadlow
Haylnm yadergal tselotna miljaw
Anabst anabert iyeteketelu
Ke-egrech’u tinbiya beltew yitegabal

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 9
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 10
Zarem benya zemen be-emnet be-tsebelu
Ke-hmemu alga sentu qena alu
Ke-amlak yetesetew qal-kidanu ts’nu
Bereket yadelal be-miljaw yamenu

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 11
Gebre Menfes Kidus ye’alem birhan natchew
Yihaw lezelalem yaberal sratchew yaberal sratchew

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)

VERSE 12
Yihaw lezelalem yaberal sratchew
Yihaw lezelalem yaberal sratchew yaberal sratchew

CHORUS
Gebre Menfes Kidus ye’alem birhan natchew (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'gebremenfes-kidus-yealem-birhan', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Gebriel Hayal (gebriel-hayal)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 1
አዝ፡ //
የጽናታቸው ዝናው ሲሰማ
ከዛ ባቢሎን ከሞት ከተማ
ህፃናት ሳሉ በራ እምነታቸው

VERSE 2
ቆመህ ተገኘህ መሐከላቸው
አዝ፡ //
ውኃው ሲዘል ቢያስደነገጥም
በጋኖቹ ውስጥ ቢነዋወጥም

VERSE 3
ፀንተው ዘመሩ ልጅና እናቱ
አንተ ስትደርስ ከዚያ ከእሳቱ
አዝ፡ //
ቂርቆስም ፀና ሞተን ሳይፈራ

VERSE 4
አንተ ስላለህ ከነርሱ ጋራ
አትፍሪ አላት ስለምን ትፍራ
አምነው ድል ነሱት ያንን መከራ
አዝ፡ //

VERSE 5
እኔም አምናለሁ አድነኝ ብዬ
ፈጥነህ አማልደኝ ከቸር ጌታዬ
ክፉውን ዘመን የማልፍበት
ፅናቱን ስጠኝ ድል ልንሳበት',
      lyrics_transliteration = 'Gebriel hayal melake selam melake bisrat
Yemtawet’a yeegziabhern hizb kemined esat
Fiqrh teslwal belbachn
Fith qomenal barken bilen

VERSE 1
Yets’natachew zinaw sisema
Keza babilon kemot ketema
Hits’anat salu bera emnetachew

VERSE 2
Qomeh tegegneh mehekelachew
Wihaw sizel biyasdeneget’m
Beganochu wist’ binewawet’m

VERSE 3
Ts’entew zemeru lijna enatu
Ante sitders keziya keesatu
Qirqosm ts’ena moten sayfera

VERSE 4
Ante silaleh kenersu gara
Atfri alat silemn tifra
Amnew dil nesut yann mekera

VERSE 5
Enem amnalehu adnegn biye
Fet’neh amaldegn kecher Getaye
Kifuwn zemen yemalfbet
Ts’natun sit’egn dil linsabet',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'gebriel-hayal'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 1
አዝ፡ //
የጽናታቸው ዝናው ሲሰማ
ከዛ ባቢሎን ከሞት ከተማ
ህፃናት ሳሉ በራ እምነታቸው

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 2
ቆመህ ተገኘህ መሐከላቸው
አዝ፡ //
ውኃው ሲዘል ቢያስደነገጥም
በጋኖቹ ውስጥ ቢነዋወጥም

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 3
ፀንተው ዘመሩ ልጅና እናቱ
አንተ ስትደርስ ከዚያ ከእሳቱ
አዝ፡ //
ቂርቆስም ፀና ሞተን ሳይፈራ

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 4
አንተ ስላለህ ከነርሱ ጋራ
አትፍሪ አላት ስለምን ትፍራ
አምነው ድል ነሱት ያንን መከራ
አዝ፡ //

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 5
እኔም አምናለሁ አድነኝ ብዬ
ፈጥነህ አማልደኝ ከቸር ጌታዬ
ክፉውን ዘመን የማልፍበት
ፅናቱን ስጠኝ ድል ልንሳበት

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gebriel hayal melake selam melake bisrat
Yemtawet’a yeegziabhern hizb kemined esat
Fiqrh teslwal belbachn
Fith qomenal barken bilen

VERSE 1
CHORUS
Yets’natachew zinaw sisema
Keza babilon kemot ketema
Hits’anat salu bera emnetachew

CHORUS
Gebriel hayal melake selam melake bisrat
Yemtawet’a yeegziabhern hizb kemined esat
Fiqrh teslwal belbachn
Fith qomenal barken bilen

VERSE 2
Qomeh tegegneh mehekelachew
CHORUS
Wihaw sizel biyasdeneget’m
Beganochu wist’ binewawet’m

CHORUS
Gebriel hayal melake selam melake bisrat
Yemtawet’a yeegziabhern hizb kemined esat
Fiqrh teslwal belbachn
Fith qomenal barken bilen

VERSE 3
Ts’entew zemeru lijna enatu
Ante sitders keziya keesatu
CHORUS
Qirqosm ts’ena moten sayfera

CHORUS
Gebriel hayal melake selam melake bisrat
Yemtawet’a yeegziabhern hizb kemined esat
Fiqrh teslwal belbachn
Fith qomenal barken bilen

VERSE 4
Ante silaleh kenersu gara
Atfri alat silemn tifra
Amnew dil nesut yann mekera
CHORUS

CHORUS
Gebriel hayal melake selam melake bisrat
Yemtawet’a yeegziabhern hizb kemined esat
Fiqrh teslwal belbachn
Fith qomenal barken bilen

VERSE 5
Enem amnalehu adnegn biye
Fet’neh amaldegn kecher Getaye
Kifuwn zemen yemalfbet
Ts’natun sit’egn dil linsabet

CHORUS
Gebriel hayal melake selam melake bisrat
Yemtawet’a yeegziabhern hizb kemined esat
Fiqrh teslwal belbachn
Fith qomenal barken bilen'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'gebriel-hayal', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Gebriel Hayal Melake Selam (gebriel-hayal-melake-selam)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 1
አዝ፡
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን

VERSE 2
ፊትህ ቆመናል ባርከን ብለን

VERSE 3
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 4
የጽናታቸው ዝናው ሲሰማ
ከዛ ባቢሎን ከሞት ከተማ
ህፃናት ሳሉ በራ እምነታቸው
ቆመህ ተገኘህ መሐከላቸው

VERSE 5
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 6
አዝ፡
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን

VERSE 7
ፊትህ ቆመናል ባርከን ብለን

VERSE 8
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 9
ውኃው ሲዘል ቢያስደነገጥም
በጋኖቹ ውስጥ ቢነዋወጥም
ፀንተው ዘመሩ ልጅና እናቱ
አንተ ስትደርስ ከዚያ ከእሳቱ

VERSE 10
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 11
አዝ፡
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን

VERSE 12
ፊትህ ቆመናል ባርከን ብለን

VERSE 13
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 14
ቂርቆስም ፀና ሞተን ሳይፈራ
አንተ ስላለህ ከነርሱ ጋራ
አትፍሪ አላት ስለምን ትፍራ
አምነው ድል ነሱት ያንን መከራ

VERSE 15
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 16
አዝ፡
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን

VERSE 17
ፊትህ ቆመናል ባርከን ብለን

VERSE 18
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 19
እኔም አምናለሁ አድነኝ ብዬ
ፈጥነህ አማልደኝ ከቸር ጌታዬ
ክፉውን ዘመን የማልፍበት
ፅናቱን ስጠኝ ድል ልንሳበት

VERSE 20
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን',
      lyrics_transliteration = 'Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 1
Az:
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

VERSE 2
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

VERSE 3
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Yetsinatachew zinaw sisema

VERSE 4
Keza Babilon kemot ketema
Hitsanat salu bera imnetachew
Qomeh tegelegneh mehakelachew
Gebriel hayal melake selam melake bisirat

VERSE 5
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 6
Az:
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

VERSE 7
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

VERSE 8
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Wihaw sizel biyasidenegitim

VERSE 9
Beganochu wist biniwawetim
Tsentew zemeru lijina inatu
Ante sitiders keziya ke-isatu
Gebriel hayal melake selam melake bisirat

VERSE 10
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 11
Az:
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin

VERSE 12
Fitih qomenal barken bilen
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

VERSE 13
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Qirqosim tsena moten sayifera

VERSE 14
Ante silaleh kenerisu gara
Atifri alat silemin tifira
Amnew dil nesut yannin mekera
Gebriel hayal melake selam melake bisirat

VERSE 15
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 16
Az:
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin

VERSE 17
Fitih qomenal barken bilen
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

VERSE 18
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Enem amnalew adinegn biye
Fetineh amalidegn kecher Getaye

VERSE 19
Kifuwun zemen yemalifbet
Tsinatun sitegn dil linensabet
Gebriel hayal melake selam melake bisirat

VERSE 20
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'gebriel-hayal-melake-selam'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 1
አዝ፡
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 2
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 3
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 4
የጽናታቸው ዝናው ሲሰማ
ከዛ ባቢሎን ከሞት ከተማ
ህፃናት ሳሉ በራ እምነታቸው
ቆመህ ተገኘህ መሐከላቸው

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 5
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 6
አዝ፡
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 7
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 8
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 9
ውኃው ሲዘል ቢያስደነገጥም
በጋኖቹ ውስጥ ቢነዋወጥም
ፀንተው ዘመሩ ልጅና እናቱ
አንተ ስትደርስ ከዚያ ከእሳቱ

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 10
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 11
አዝ፡
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 12
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 13
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 14
ቂርቆስም ፀና ሞተን ሳይፈራ
አንተ ስላለህ ከነርሱ ጋራ
አትፍሪ አላት ስለምን ትፍራ
አምነው ድል ነሱት ያንን መከራ

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 15
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 16
አዝ፡
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 17
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 18
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 19
እኔም አምናለሁ አድነኝ ብዬ
ፈጥነህ አማልደኝ ከቸር ጌታዬ
ክፉውን ዘመን የማልፍበት
ፅናቱን ስጠኝ ድል ልንሳበት

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

VERSE 20
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን

CHORUS
ገብርኤል ኃያል መልአከ ሰላም መልአከ ብሥራት
የምታወጣ የእግዚአብሔርን ሕዝብ ከሚነድ እሳት
ፍቅርህ ተስሏል በልባችን
ፊትህ ቆመናል ባርከን ብለን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 1
Az:
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 2
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 3
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Yetsinatachew zinaw sisema

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 4
Keza Babilon kemot ketema
Hitsanat salu bera imnetachew
Qomeh tegelegneh mehakelachew
Gebriel hayal melake selam melake bisirat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 5
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 6
Az:
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 7
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 8
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Wihaw sizel biyasidenegitim

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 9
Beganochu wist biniwawetim
Tsentew zemeru lijina inatu
Ante sitiders keziya ke-isatu
Gebriel hayal melake selam melake bisirat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 10
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 11
Az:
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 12
Fitih qomenal barken bilen
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 13
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Qirqosim tsena moten sayifera

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 14
Ante silaleh kenerisu gara
Atifri alat silemin tifira
Amnew dil nesut yannin mekera
Gebriel hayal melake selam melake bisirat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 15
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 16
Az:
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 17
Fitih qomenal barken bilen
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 18
Fikirih tesilwal belibachin
Fitih qomenal barken bilen
Enem amnalew adinegn biye
Fetineh amalidegn kecher Getaye

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 19
Kifuwun zemen yemalifbet
Tsinatun sitegn dil linensabet
Gebriel hayal melake selam melake bisirat

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

VERSE 20
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen

CHORUS
Gebriel hayal melake selam melake bisirat
Yemitaweta ye-Igziabherin hizb kemined isat
Fikirih tesilwal belibachin
Fitih qomenal barken bilen'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'gebriel-hayal-melake-selam', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: GEBRIEL SIMU (gebriel-simu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ገብርኤል ስሙ ዘአምኃ ለማርያም
ዘበትርጓሜሁ አምላክ ውእቱ
ይበል ይበል
አቅዲሙ ዜነዋ ለደብረ ልዑል ኢየሩሳሌም

VERSE 1
አምኃሁ ለዘይመጽዕ ዓቢይ ኖላዊ ኖላዊ እስራኤል
ይበል ይበል
የፈላው ጋኑን "ገብርኤል ስሙ"
አቀዝቅዞት ""

VERSE 2
ቂርቆስንና ""
እናቱን አዳነ ""
ዘአምኃ ለማርያም ዘበትርጓሜሁ አምላክ ውእቱ ይበል ይበል

VERSE 3
ሠለስቱን ሕፃናት "ገብርኤል ስሙ"
ያዳናቸው እርሱ ""
እኛንም ያድነን ""
ከሚነደው እሳት ""

VERSE 4
ዘአምኃ ለማርያም ዘበትርጓሜሁ አምላክ ውእቱ ይበል ይበል

VERSE 5
መልአከ ራማ "ገብርኤል ስሙ"
እኛን ይወደናል ""
ሃያሉ አባት ""
ሊቀ መልአኩ ""

VERSE 6
ዘአምኃ ለማርያም ዘበትርጓሜሁ አምላክ ውእቱ ይበል ይበል',
      lyrics_transliteration = 'Gebriel simu zeamha leMaryam
Zebetrgwamehu amlak wietu
Yibel yibel
Aqdimu zenewa ledebre liul iyerusalem

VERSE 1
Amhahu lezeymets’e abiy nolawi nolawi esrael
Yibel yibel
Yefelaw ganun "Gebriel simu"
Aqezqzot ""

VERSE 2
Qirqosnna ""
Enatun adane ""
Zeamha leMaryam zebetrgwamehu amlak wietu yibel yibel

VERSE 3
Selestun hits’anat "Gebriel simu"
Yadanachew ersu ""
Egnanm yadnen ""
Keminedew esat ""

VERSE 4
Zeamha leMaryam zebetrgwamehu amlak wietu yibel yibel

VERSE 5
Melake rama "Gebriel simu"
Egnan yiwedenal ""
Hayalu abat ""
Liqe melaku ""

VERSE 6
Zeamha leMaryam zebetrgwamehu amlak wietu yibel yibel',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'gebriel-simu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብርኤል ስሙ ዘአምኃ ለማርያም
ዘበትርጓሜሁ አምላክ ውእቱ
ይበል ይበል
አቅዲሙ ዜነዋ ለደብረ ልዑል ኢየሩሳሌም

VERSE 1
አምኃሁ ለዘይመጽዕ ዓቢይ ኖላዊ ኖላዊ እስራኤል
ይበል ይበል
የፈላው ጋኑን "ገብርኤል ስሙ"
አቀዝቅዞት ""

CHORUS
ገብርኤል ስሙ ዘአምኃ ለማርያም
ዘበትርጓሜሁ አምላክ ውእቱ
ይበል ይበል
አቅዲሙ ዜነዋ ለደብረ ልዑል ኢየሩሳሌም

VERSE 2
ቂርቆስንና ""
እናቱን አዳነ ""
ዘአምኃ ለማርያም ዘበትርጓሜሁ አምላክ ውእቱ ይበል ይበል

CHORUS
ገብርኤል ስሙ ዘአምኃ ለማርያም
ዘበትርጓሜሁ አምላክ ውእቱ
ይበል ይበል
አቅዲሙ ዜነዋ ለደብረ ልዑል ኢየሩሳሌም

VERSE 3
ሠለስቱን ሕፃናት "ገብርኤል ስሙ"
ያዳናቸው እርሱ ""
እኛንም ያድነን ""
ከሚነደው እሳት ""

CHORUS
ገብርኤል ስሙ ዘአምኃ ለማርያም
ዘበትርጓሜሁ አምላክ ውእቱ
ይበል ይበል
አቅዲሙ ዜነዋ ለደብረ ልዑል ኢየሩሳሌም

VERSE 4
ዘአምኃ ለማርያም ዘበትርጓሜሁ አምላክ ውእቱ ይበል ይበል

CHORUS
ገብርኤል ስሙ ዘአምኃ ለማርያም
ዘበትርጓሜሁ አምላክ ውእቱ
ይበል ይበል
አቅዲሙ ዜነዋ ለደብረ ልዑል ኢየሩሳሌም

VERSE 5
መልአከ ራማ "ገብርኤል ስሙ"
እኛን ይወደናል ""
ሃያሉ አባት ""
ሊቀ መልአኩ ""

CHORUS
ገብርኤል ስሙ ዘአምኃ ለማርያም
ዘበትርጓሜሁ አምላክ ውእቱ
ይበል ይበል
አቅዲሙ ዜነዋ ለደብረ ልዑል ኢየሩሳሌም

VERSE 6
ዘአምኃ ለማርያም ዘበትርጓሜሁ አምላክ ውእቱ ይበል ይበል

CHORUS
ገብርኤል ስሙ ዘአምኃ ለማርያም
ዘበትርጓሜሁ አምላክ ውእቱ
ይበል ይበል
አቅዲሙ ዜነዋ ለደብረ ልዑል ኢየሩሳሌም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gebriel simu zeamha leMaryam
Zebetrgwamehu amlak wietu
Yibel yibel
Aqdimu zenewa ledebre liul iyerusalem

VERSE 1
Amhahu lezeymets’e abiy nolawi nolawi esrael
Yibel yibel
Yefelaw ganun "Gebriel simu"
Aqezqzot ""

CHORUS
Gebriel simu zeamha leMaryam
Zebetrgwamehu amlak wietu
Yibel yibel
Aqdimu zenewa ledebre liul iyerusalem

VERSE 2
Qirqosnna ""
Enatun adane ""
Zeamha leMaryam zebetrgwamehu amlak wietu yibel yibel

CHORUS
Gebriel simu zeamha leMaryam
Zebetrgwamehu amlak wietu
Yibel yibel
Aqdimu zenewa ledebre liul iyerusalem

VERSE 3
Selestun hits’anat "Gebriel simu"
Yadanachew ersu ""
Egnanm yadnen ""
Keminedew esat ""

CHORUS
Gebriel simu zeamha leMaryam
Zebetrgwamehu amlak wietu
Yibel yibel
Aqdimu zenewa ledebre liul iyerusalem

VERSE 4
Zeamha leMaryam zebetrgwamehu amlak wietu yibel yibel

CHORUS
Gebriel simu zeamha leMaryam
Zebetrgwamehu amlak wietu
Yibel yibel
Aqdimu zenewa ledebre liul iyerusalem

VERSE 5
Melake rama "Gebriel simu"
Egnan yiwedenal ""
Hayalu abat ""
Liqe melaku ""

CHORUS
Gebriel simu zeamha leMaryam
Zebetrgwamehu amlak wietu
Yibel yibel
Aqdimu zenewa ledebre liul iyerusalem

VERSE 6
Zeamha leMaryam zebetrgwamehu amlak wietu yibel yibel

CHORUS
Gebriel simu zeamha leMaryam
Zebetrgwamehu amlak wietu
Yibel yibel
Aqdimu zenewa ledebre liul iyerusalem'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'gebriel-simu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Gedilike Grum (gedilike-grum)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ገድልከ ግሩም ነገርከ ጥዑም

VERSE 1
ገድልከ ግሩም ነገርከ ጥዑም',
      lyrics_transliteration = 'Gedilika grum negerika teum

VERSE 1
Gedilika grum negerika teum',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'gedilike-grum'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገድልከ ግሩም ነገርከ ጥዑም

VERSE 1
ገድልከ ግሩም ነገርከ ጥዑም

CHORUS
ገድልከ ግሩም ነገርከ ጥዑም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gedilika grum negerika teum

VERSE 1
Gedilika grum negerika teum

CHORUS
Gedilika grum negerika teum'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'gedilike-grum', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Gelila Etiwi (gelila-etiwi)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 1
ስደቱ ይበቃሻል
ሄሮድስ ሞቷል ብሎ
ገብርኤል ነግሮሻል ገሊላ እትዊ
በእሳት ሰረገላ

VERSE 2
ኡራኤል ይመረሻል
ሀገረኪ ገሊላ እትዊ (፪)
የዝናቡ ጌታ ገሊላ እትዊ
እናት ሆነሽ ሳለ

VERSE 3
ሰይጣን በሰው አድሮ
እያስከለከለ
ውሃ ፀንቶብሽ
አፍራሽ ደርቆ ዋለ

VERSE 4
ይበቃል እናቴ
ረሀብ ጥማትሽ
ሂጂ ወደ ገሊላ
ወደ ዘመዶች

VERSE 5
ሀገረኪ ገሊላ እትዊ (፪)
የሰማዕታት አክሊል ገሊላ እትዊ
የጻድቃን እናት
ባርከሽ ሰጠሻቸው

VERSE 6
መከራንጨስደት
እኛም ይታደለን
የአንቺው በረከት
ሀገረኪ ገሊላ እትዊ (፬)

VERSE 7
ገፅሽ ብሩህ መልካም
ልክ እንደ ፀሐይ
እግእዝትነ ማርያም
እሙ ለአዶናይ

VERSE 8
አይገባም ለአንቺ
መከራ ስቃይ ገሊላ እትዊ
ሀገረኪ ገሊላ እትዊ (፬)
ገሊላ ግቢ (፬) ሀገርሽ ገሊላ ግቢ (፪)',
      lyrics_transliteration = 'Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 1
Sidetu yibeqashal
Herods motwal bilo
Gebriel negroshal gelila etwi
Beesat seregela

VERSE 2
Urael yimereshal
Hegereki gelila etwi (2)
Yeznabu Geta gelila etwi
Enat honesh sale

VERSE 3
Seyt’an besew adro
Eyaskelekele
Wiha ts’entobsh
Afrash derqo wale

VERSE 4
Yibeqal enate
Reheb t’matsh
Hiji wede gelila
Wede zemedoch

VERSE 5
Hegereki gelila etwi (2)
Yesemaetat aklil gelila etwi
Yets’adqan enat
Barkesh set’eshachew

VERSE 6
Mekeranch’esdet
Egnam yitadelen
Yeanchiw bereket
Hegereki gelila etwi (4)

VERSE 7
Gets’sh biruh melkam
Lik ende ts’ehey
Egeztne Maryam
Emu leadonay

VERSE 8
Aygebam leanchi
Mekera siqay gelila etwi
Hegereki gelila etwi (4)
Gelila gibi (4) hegersh gelila gibi (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'gelila-etiwi'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 1
ስደቱ ይበቃሻል
ሄሮድስ ሞቷል ብሎ
ገብርኤል ነግሮሻል ገሊላ እትዊ
በእሳት ሰረገላ

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 2
ኡራኤል ይመረሻል
ሀገረኪ ገሊላ እትዊ (፪)
የዝናቡ ጌታ ገሊላ እትዊ
እናት ሆነሽ ሳለ

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 3
ሰይጣን በሰው አድሮ
እያስከለከለ
ውሃ ፀንቶብሽ
አፍራሽ ደርቆ ዋለ

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 4
ይበቃል እናቴ
ረሀብ ጥማትሽ
ሂጂ ወደ ገሊላ
ወደ ዘመዶች

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 5
ሀገረኪ ገሊላ እትዊ (፪)
የሰማዕታት አክሊል ገሊላ እትዊ
የጻድቃን እናት
ባርከሽ ሰጠሻቸው

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 6
መከራንጨስደት
እኛም ይታደለን
የአንቺው በረከት
ሀገረኪ ገሊላ እትዊ (፬)

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 7
ገፅሽ ብሩህ መልካም
ልክ እንደ ፀሐይ
እግእዝትነ ማርያም
እሙ ለአዶናይ

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ

VERSE 8
አይገባም ለአንቺ
መከራ ስቃይ ገሊላ እትዊ
ሀገረኪ ገሊላ እትዊ (፬)
ገሊላ ግቢ (፬) ሀገርሽ ገሊላ ግቢ (፪)

CHORUS
እመቤቴ እስከመቼ በባዕድ አገር ትኖሪያለሽ (፪)
ገሊላ ግቢ (፬) ሀገርሽ ግቢ (፪) እኸ
ገሊላ እትዊ (፬) ሀገረኪ ገሊላ እትዊ
እመቤቴ ማርያም ገሊላ እትዊ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 1
Sidetu yibeqashal
Herods motwal bilo
Gebriel negroshal gelila etwi
Beesat seregela

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 2
Urael yimereshal
Hegereki gelila etwi (2)
Yeznabu Geta gelila etwi
Enat honesh sale

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 3
Seyt’an besew adro
Eyaskelekele
Wiha ts’entobsh
Afrash derqo wale

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 4
Yibeqal enate
Reheb t’matsh
Hiji wede gelila
Wede zemedoch

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 5
Hegereki gelila etwi (2)
Yesemaetat aklil gelila etwi
Yets’adqan enat
Barkesh set’eshachew

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 6
Mekeranch’esdet
Egnam yitadelen
Yeanchiw bereket
Hegereki gelila etwi (4)

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 7
Gets’sh biruh melkam
Lik ende ts’ehey
Egeztne Maryam
Emu leadonay

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi

VERSE 8
Aygebam leanchi
Mekera siqay gelila etwi
Hegereki gelila etwi (4)
Gelila gibi (4) hegersh gelila gibi (2)

CHORUS
Emebete eskemeche bebaed ager tinoriyalesh (2)
Gelila gibi (4) hegersh gibi (2) eኸ
Gelila etwi (4) hegereki gelila etwi
Emebete Maryam gelila etwi'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'gelila-etiwi', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: GETAYE AYITLEGNIM (getaye-ayitlegnim)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 1
ወደ አለው ምድር ያስገባኛል
በእምነት መርከብ እርሱ ነው ሞገድ ያለፍኩበት
አለኝ እጄን ይዞ አይዞ በርታ
እርግማኔን ሰብሮ ሰራኝ እንደገና

VERSE 2
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 3
ባርኮ ሚጠብቀኝ ፊቱን እያበራ
ሰላም የሚሰጠኝ ፍጹም እየራራ
ሆንኩኝ ባለማረክ ስሙ ስሜ ሆነ
ቃሉን የሚፈጽም በእውነት የታመነ

VERSE 4
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 5
የሚገድል የሚያድንም
የሚያመታ የሚያፈውስ የሃያላን ሃያል
የሚምር የሚቀድስ ዘለዓለም ህያው ነህ ብሎኛል
የተከፈተን በር በፊት ሰጥቶኛል

VERSE 6
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 7
እርሱ እንደነበረ ነበር ከአባቶች ጋራ
ቅዱስ እግዚአብሄር አለ ከኔም ጋራ
ከእርሱ በቀር አየሁ እንደሌለ
መድሃኒት ነውና ሞትን የገደለ

VERSE 8
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 9
ወደ አለው ምድር ያስገባኛል
በእምነት መርከብ እርሱ ነው ሞገድ ያለፍኩበት
አለኝ እጄን ይዞ አይዞ በርታ
እርግማኔን ሰብሮ ሰራኝ እንደገና

VERSE 10
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 11
ባርኮ ሚጠብቀኝ ፊቱን እያበራ
ሰላም የሚሰጠኝ ፍጹም እየራራ
ሆንኩኝ ባለማረክ ስሙ ስሜ ሆነ
ቃሉን የሚፈጽም በእውነት የታመነ

VERSE 12
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 13
የሚገድል የሚያድንም
የሚያመታ የሚያፈውስ የሃያላን ሃያል
የሚምር የሚቀድስ ዘለዓለም ህያው ነህ ብሎኛል
የተከፈተን በር በፊት ሰጥቶኛል

VERSE 14
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 15
እርሱ እንደነበረ ነበር ከአባቶች ጋራ
ቅዱስ እግዚአብሄር አለ ከኔም ጋራ
ከእርሱ በቀር አየሁ እንደሌለ
መድሃኒት ነውና ሞትን የገደለ

VERSE 16
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም',
      lyrics_transliteration = 'Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 1
Wede alew midr yasgebagnal
Beemnet merkeb ersu new moged yalefkubet
Alegn ejen yizo ayzo berta
Ergmanen sebro seragn endegena

VERSE 2
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 3
Barko mit’ebqegn fitun eyabera
Selam yemiset’egn fits’um eyerara
Honkugn balemarek simu sime hone
Qalun yemifets’m beewnet yetamene

VERSE 4
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 5
Yemigedl yemiyadnm
Yemiyameta yemiyafews yehayalan hayal
Yemimr yemiqeds zelealem hiyaw neh bilognal
Yetekefeten ber befit set’tognal

VERSE 6
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 7
Ersu endenebere neber keabatoch gara
Kidus egziabher ale kenem gara
Keersu beqer ayehu endelele
Medhanit newna motn yegedele

VERSE 8
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 9
Wede alew midr yasgebagnal
Beemnet merkeb ersu new moged yalefkubet
Alegn ejen yizo ayzo berta
Ergmanen sebro seragn endegena

VERSE 10
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 11
Barko mit’ebqegn fitun eyabera
Selam yemiset’egn fits’um eyerara
Honkugn balemarek simu sime hone
Qalun yemifets’m beewnet yetamene

VERSE 12
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 13
Yemigedl yemiyadnm
Yemiyameta yemiyafews yehayalan hayal
Yemimr yemiqeds zelealem hiyaw neh bilognal
Yetekefeten ber befit set’tognal

VERSE 14
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 15
Ersu endenebere neber keabatoch gara
Kidus egziabher ale kenem gara
Keersu beqer ayehu endelele
Medhanit newna motn yegedele

VERSE 16
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'getaye-ayitlegnim'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 1
ወደ አለው ምድር ያስገባኛል
በእምነት መርከብ እርሱ ነው ሞገድ ያለፍኩበት
አለኝ እጄን ይዞ አይዞ በርታ
እርግማኔን ሰብሮ ሰራኝ እንደገና

CHORUS
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 2
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

CHORUS
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 3
ባርኮ ሚጠብቀኝ ፊቱን እያበራ
ሰላም የሚሰጠኝ ፍጹም እየራራ
ሆንኩኝ ባለማረክ ስሙ ስሜ ሆነ
ቃሉን የሚፈጽም በእውነት የታመነ

CHORUS
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 4
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

CHORUS
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 5
የሚገድል የሚያድንም
የሚያመታ የሚያፈውስ የሃያላን ሃያል
የሚምር የሚቀድስ ዘለዓለም ህያው ነህ ብሎኛል
የተከፈተን በር በፊት ሰጥቶኛል

CHORUS
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 6
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

CHORUS
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 7
እርሱ እንደነበረ ነበር ከአባቶች ጋራ
ቅዱስ እግዚአብሄር አለ ከኔም ጋራ
ከእርሱ በቀር አየሁ እንደሌለ
መድሃኒት ነውና ሞትን የገደለ

CHORUS
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 8
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

CHORUS
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 9
ወደ አለው ምድር ያስገባኛል
በእምነት መርከብ እርሱ ነው ሞገድ ያለፍኩበት
አለኝ እጄን ይዞ አይዞ በርታ
እርግማኔን ሰብሮ ሰራኝ እንደገና

CHORUS
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 10
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

CHORUS
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 11
ባርኮ ሚጠብቀኝ ፊቱን እያበራ
ሰላም የሚሰጠኝ ፍጹም እየራራ
ሆንኩኝ ባለማረክ ስሙ ስሜ ሆነ
ቃሉን የሚፈጽም በእውነት የታመነ

CHORUS
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 12
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

CHORUS
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 13
የሚገድል የሚያድንም
የሚያመታ የሚያፈውስ የሃያላን ሃያል
የሚምር የሚቀድስ ዘለዓለም ህያው ነህ ብሎኛል
የተከፈተን በር በፊት ሰጥቶኛል

CHORUS
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 14
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

CHORUS
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 15
እርሱ እንደነበረ ነበር ከአባቶች ጋራ
ቅዱስ እግዚአብሄር አለ ከኔም ጋራ
ከእርሱ በቀር አየሁ እንደሌለ
መድሃኒት ነውና ሞትን የገደለ

CHORUS
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

VERSE 16
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም

CHORUS
በፊት የሚሄድ እርሱ እግዚአብሔር ነው
ለነፍስ ለስጋዬ ሰው ትርግድ የሚለው
አለ ከኔ ጋራ ፍጹም አይተወም
አልፈራም አልደነግጥ ጌታ አይጥለኝም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 1
Wede alew midr yasgebagnal
Beemnet merkeb ersu new moged yalefkubet
Alegn ejen yizo ayzo berta
Ergmanen sebro seragn endegena

CHORUS
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 2
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

CHORUS
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 3
Barko mit’ebqegn fitun eyabera
Selam yemiset’egn fits’um eyerara
Honkugn balemarek simu sime hone
Qalun yemifets’m beewnet yetamene

CHORUS
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 4
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

CHORUS
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 5
Yemigedl yemiyadnm
Yemiyameta yemiyafews yehayalan hayal
Yemimr yemiqeds zelealem hiyaw neh bilognal
Yetekefeten ber befit set’tognal

CHORUS
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 6
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

CHORUS
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 7
Ersu endenebere neber keabatoch gara
Kidus egziabher ale kenem gara
Keersu beqer ayehu endelele
Medhanit newna motn yegedele

CHORUS
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 8
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

CHORUS
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 9
Wede alew midr yasgebagnal
Beemnet merkeb ersu new moged yalefkubet
Alegn ejen yizo ayzo berta
Ergmanen sebro seragn endegena

CHORUS
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 10
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

CHORUS
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 11
Barko mit’ebqegn fitun eyabera
Selam yemiset’egn fits’um eyerara
Honkugn balemarek simu sime hone
Qalun yemifets’m beewnet yetamene

CHORUS
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 12
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

CHORUS
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 13
Yemigedl yemiyadnm
Yemiyameta yemiyafews yehayalan hayal
Yemimr yemiqeds zelealem hiyaw neh bilognal
Yetekefeten ber befit set’tognal

CHORUS
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 14
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

CHORUS
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 15
Ersu endenebere neber keabatoch gara
Kidus egziabher ale kenem gara
Keersu beqer ayehu endelele
Medhanit newna motn yegedele

CHORUS
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

VERSE 16
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm

CHORUS
Befit yemihed ersu Egziabher new
Lenefs lesgaye sew tirgd yemilew
Ale kene gara fits’um aytewem
Alferam aldenegt’ Geta ayt’legnm'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'getaye-ayitlegnim', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Getaye Kesetegn (getaye-kesetegn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ጌታዪ ከሰጠኝ አልፈራም ልወስድሽ
ጌታዪ ከሰጠኝ አልፈራም ልወስድሽ
የሀዘኔ መርሻ ማርያም እናቴ ነሽ
እናት አግኝቻለሁ ከመስቀሉ እግርጌ

VERSE 1
ስሟን እየጠራሁ ከፍ እንዲል ማዕረጌ
ምርኩዝ ድጋፍ ሆኖኝ ድንግል ሆይ ፀሎትሽ በእፎይታ ሞልቶኛል የሰላምታ ድምፅሽ ፍፁም ላይረሳኝ ገብቶ ከደም ስሬ ይቀሰቅሰኛል ክብርሽ ለዝማሬ በልጅሽ መከራ ቀራንዮ ያለሽ አትዘነጊኝም ዛሬም ከእኔ ጋር ነሽ መታወክ መጨነቅ ከቤቴ እንዲነቀል የበረከቴን ቁልፍ ሰጥቶኛል ከመስቀል ከጣራዪ በታች መነጨ ደስታ ለጠቆረዉ ፊቴ እመቤቴ አብርታ በራስ ቅል ተራራ በነፍስሽ ሰይፍ አልፎ ካሳ ሆነኝ ፍቅርሽ በልቤ ተፅፎ እነኋት እናትህ ሲለኝ በርትቻለሁ በልጅነት ክብር ከፊትሽ ቆሜአለሁ የመስቀል ስጦታ እነኋት እናቴ ማንንም ሳልፈራ ወደስኳት ከቤቴ በመስቀል ላይ ሆኖ ልጅሽ እራራልኝ በእናትነት ፍቅርሽ ቤቴን ሸለመልኝ በሚያጽናናዉ ቃሉ መሰበሬን ክሶ በልቤ ተከለ አጽናኟን ምሰሶ ሞኝነት አይደለም ነገረ መስቀሉ እጅግ ማትረፊያ ነዉ አንቺን መቀበሉ በመስቀል ላይ ሆኖ ልጅሽ እራራልኝ በእናትነት ፍቅርሽ ቤቴን ሸለመልኝ በሚያጽናናዉ ቃሉ መሰበሬን ክሶ በልቤ ተከለ አጽናኟን ምሰሶ ሞኝነት አይደለም ነገረ መስቀሉ እጅግ ማትረፊያ ነዉ አንቺን መቀበሉ',
      lyrics_transliteration = 'Getayi keset’egn alferam liwesdsh
Getayi keset’egn alferam liwesdsh
Yehezene mersha Maryam enate nesh
Enat aggnchalehu kemesqelu egrge

VERSE 1
Simwan eyet’erahu kef endil maerege
Mirkuz digaf honogn Dingil hoy ts’elotsh beefoyta moltognal yeselamta dimts’sh fits’um layresagn gebto kedem sire yiqeseqsegnal kibrsh lezmare beljsh mekera qeranyo yalesh atzenegignm zarem keene gar nesh metawek mech’eneq kebete endineqel yebereketen qulf set’tognal kemesqel ket’arayi betach menech’e desta let’eqorewu fite Emebete abrta beras qil terara benefssh seyf alfo kasa honegn fiqrsh belbe tets’fo enehwat enath silegn bertchalehu beljnet kibir kefitsh qomealehu yemesqel sit’ota enehwat enate mannm salfera wedeskwat kebete bemesqel lay hono lijsh eraralgn beenatnet fiqrsh beten shelemelgn bemiyats’nanawu qalu meseberen kiso belbe tekele ats’nagnwan miseso mognnet aydelem negere mesqelu ejg matrefiya newu anchin meqebelu bemesqel lay hono lijsh eraralgn beenatnet fiqrsh beten shelemelgn bemiyats’nanawu qalu meseberen kiso belbe tekele ats’nagnwan miseso mognnet aydelem negere mesqelu ejg matrefiya newu anchin meqebelu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'getaye-kesetegn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጌታዪ ከሰጠኝ አልፈራም ልወስድሽ
ጌታዪ ከሰጠኝ አልፈራም ልወስድሽ
የሀዘኔ መርሻ ማርያም እናቴ ነሽ
እናት አግኝቻለሁ ከመስቀሉ እግርጌ

VERSE 1
ስሟን እየጠራሁ ከፍ እንዲል ማዕረጌ
ምርኩዝ ድጋፍ ሆኖኝ ድንግል ሆይ ፀሎትሽ በእፎይታ ሞልቶኛል የሰላምታ ድምፅሽ ፍፁም ላይረሳኝ ገብቶ ከደም ስሬ ይቀሰቅሰኛል ክብርሽ ለዝማሬ በልጅሽ መከራ ቀራንዮ ያለሽ አትዘነጊኝም ዛሬም ከእኔ ጋር ነሽ መታወክ መጨነቅ ከቤቴ እንዲነቀል የበረከቴን ቁልፍ ሰጥቶኛል ከመስቀል ከጣራዪ በታች መነጨ ደስታ ለጠቆረዉ ፊቴ እመቤቴ አብርታ በራስ ቅል ተራራ በነፍስሽ ሰይፍ አልፎ ካሳ ሆነኝ ፍቅርሽ በልቤ ተፅፎ እነኋት እናትህ ሲለኝ በርትቻለሁ በልጅነት ክብር ከፊትሽ ቆሜአለሁ የመስቀል ስጦታ እነኋት እናቴ ማንንም ሳልፈራ ወደስኳት ከቤቴ በመስቀል ላይ ሆኖ ልጅሽ እራራልኝ በእናትነት ፍቅርሽ ቤቴን ሸለመልኝ በሚያጽናናዉ ቃሉ መሰበሬን ክሶ በልቤ ተከለ አጽናኟን ምሰሶ ሞኝነት አይደለም ነገረ መስቀሉ እጅግ ማትረፊያ ነዉ አንቺን መቀበሉ በመስቀል ላይ ሆኖ ልጅሽ እራራልኝ በእናትነት ፍቅርሽ ቤቴን ሸለመልኝ በሚያጽናናዉ ቃሉ መሰበሬን ክሶ በልቤ ተከለ አጽናኟን ምሰሶ ሞኝነት አይደለም ነገረ መስቀሉ እጅግ ማትረፊያ ነዉ አንቺን መቀበሉ

CHORUS
ጌታዪ ከሰጠኝ አልፈራም ልወስድሽ
ጌታዪ ከሰጠኝ አልፈራም ልወስድሽ
የሀዘኔ መርሻ ማርያም እናቴ ነሽ
እናት አግኝቻለሁ ከመስቀሉ እግርጌ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Getayi keset’egn alferam liwesdsh
Getayi keset’egn alferam liwesdsh
Yehezene mersha Maryam enate nesh
Enat aggnchalehu kemesqelu egrge

VERSE 1
Simwan eyet’erahu kef endil maerege
Mirkuz digaf honogn Dingil hoy ts’elotsh beefoyta moltognal yeselamta dimts’sh fits’um layresagn gebto kedem sire yiqeseqsegnal kibrsh lezmare beljsh mekera qeranyo yalesh atzenegignm zarem keene gar nesh metawek mech’eneq kebete endineqel yebereketen qulf set’tognal kemesqel ket’arayi betach menech’e desta let’eqorewu fite Emebete abrta beras qil terara benefssh seyf alfo kasa honegn fiqrsh belbe tets’fo enehwat enath silegn bertchalehu beljnet kibir kefitsh qomealehu yemesqel sit’ota enehwat enate mannm salfera wedeskwat kebete bemesqel lay hono lijsh eraralgn beenatnet fiqrsh beten shelemelgn bemiyats’nanawu qalu meseberen kiso belbe tekele ats’nagnwan miseso mognnet aydelem negere mesqelu ejg matrefiya newu anchin meqebelu bemesqel lay hono lijsh eraralgn beenatnet fiqrsh beten shelemelgn bemiyats’nanawu qalu meseberen kiso belbe tekele ats’nagnwan miseso mognnet aydelem negere mesqelu ejg matrefiya newu anchin meqebelu

CHORUS
Getayi keset’egn alferam liwesdsh
Getayi keset’egn alferam liwesdsh
Yehezene mersha Maryam enate nesh
Enat aggnchalehu kemesqelu egrge'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'getaye-kesetegn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  IF v_total <> 100 THEN
    RAISE EXCEPTION 'Batch 04 count mismatch: expected 100, got %', v_total;
  END IF;

  RAISE NOTICE 'SUCCESS: Batch 04 completed: % hymns updated.', v_total;
END $batch_04$;
