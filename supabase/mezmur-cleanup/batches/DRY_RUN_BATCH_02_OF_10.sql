-- =========================================================================
-- BATCH 02 of 10: 100 Hymns (101 to 200)
-- Target: public.mezmur_data_import
-- Strict 5-Column Concurrency Check + Atomic Transaction
-- =========================================================================

DO $batch_02$
DECLARE
  v_updated integer := 0;
  v_total integer := 0;
BEGIN

  -- Hymn: Ayiferidekiniye Beleni (ayiferidekiniye-beleni)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኣይፈርደክኔ በለኒ ግበረለይ ምሕረት
‎ምእንቲ ኣበሳይ ዝውዓልካ ኣብ ስቅለት
‎ሕያዋይ ሳምራዊ ንኣበሳይ ጽሮ
‎ምክሪ ከሰስተይ(2) ብምሕረት ስዓሮ

VERSE 1
‎ ሕይወት ሓዲገ ሞት ምስ መረጽኩ
‎ ጸጋይ ተገፊፉ ጸልማት ተጎልበቡኩ
‎ ብሕሱም ልምዲ ነፍሰይ እናርከስኩ
‎ ኣይሁድ ሕዞሙኒ(2) ሞት ውን ተፈረድኩ

VERSE 2
‎ዓቢ ምስ ንእሽቶ እቶም ዝሓዙኒ
‎ኣእማን ኣልዓሉ ብዳርባ ክቀትሉኒ
‎ንክኽሱካ ኢሎም ናባካ ኣምጹኡኒ
‎ድክመተይ ሪኢካ(2) ኣምላኽ ምሓረኒ

VERSE 3
‎ ካብ ሕጊ ሙሴ ቃላት ናልዓሉ
‎ ጭካነ ሓዊሶም ምሕረት ዘይብሉ
‎ ይጭሩሕ ኣለዉ ትሙት እናበሉ
‎ ኣድሕነኒ ጎይታይ(2) ምሳኻ ክህሉ

VERSE 4
‎ብትሕትናካ ሞት ዕዳይ ደምሰሶ
‎ካበረድ ክጽዕዱ ርክሰተይ ኣልግሶ
‎ዘድሓንካዮ እስኻ መን''ዩ ዝከሶ
‎ንፍርድኻኸ(2) መናሎ ዝጥሕሶ

VERSE 5
‎ ኣይፈርደክኔ ናበለ ፍርደይ ቀየሮ
‎ ብበደል ቆሰለ ሕማመይ ውን ጸሮ
‎ መቃብር ወሪዱ ንሞተይ ስዓሮ
‎ ኣካለይ ፈረሐ(2) ፍርደይ

VERSE 6
ምስ ተነገሮ',
      lyrics_transliteration = 'Ayferdekne beleni gibereley mihret
‎menti abesay ziwalka ab siqlet
‎hyaway samrawi niabesay ts’ro
‎mkri kesestey (2) bimhret siaro

VERSE 1
‎ hiywet hadige mot mis merets’ku
‎ ts’egay tegefifu ts’elmat tegolbebuku
‎ bihsum limdi nefsey enarkesku
‎ ayhud hizomuni (2) mot win teferedku

VERSE 2
‎abi mis nieshto etom zihazuni
‎aeman alalu bidarba kiqetluni
‎nkኽsuka ilom nabaka amts’uuni
‎dkmetey riika (2) amlaኽ mihareni

VERSE 3
‎ kab higi muse qalat nalalu
‎ ch’kane hawisom mihret zeyblu
‎ yich’ruh alewu timut enabelu
‎ adhneni goytay (2) misaኻ kihlu

VERSE 4
‎bthtnaka mot eday demseso
‎kabered kits’edu riksetey algso
‎zedhankayo esኻ men''yu zikeso
‎nfrdኻኸ (2) menalo zit’hso

VERSE 5
‎ ayferdekne nabele firdey qeyero
‎ bibedel qosele himamey win ts’ero
‎ meqabr weridu nimotey siaro
‎ akaley ferehe (2) firdey

VERSE 6
Mis tenegero',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ayiferidekiniye-beleni'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣይፈርደክኔ በለኒ ግበረለይ ምሕረት
‎ምእንቲ ኣበሳይ ዝውዓልካ ኣብ ስቅለት
‎ሕያዋይ ሳምራዊ ንኣበሳይ ጽሮ
‎ምክሪ ከሰስተይ(2) ብምሕረት ስዓሮ

VERSE 1
‎ ሕይወት ሓዲገ ሞት ምስ መረጽኩ
‎ ጸጋይ ተገፊፉ ጸልማት ተጎልበቡኩ
‎ ብሕሱም ልምዲ ነፍሰይ እናርከስኩ
‎ ኣይሁድ ሕዞሙኒ(2) ሞት ውን ተፈረድኩ

CHORUS
ኣይፈርደክኔ በለኒ ግበረለይ ምሕረት
‎ምእንቲ ኣበሳይ ዝውዓልካ ኣብ ስቅለት
‎ሕያዋይ ሳምራዊ ንኣበሳይ ጽሮ
‎ምክሪ ከሰስተይ(2) ብምሕረት ስዓሮ

VERSE 2
‎ዓቢ ምስ ንእሽቶ እቶም ዝሓዙኒ
‎ኣእማን ኣልዓሉ ብዳርባ ክቀትሉኒ
‎ንክኽሱካ ኢሎም ናባካ ኣምጹኡኒ
‎ድክመተይ ሪኢካ(2) ኣምላኽ ምሓረኒ

CHORUS
ኣይፈርደክኔ በለኒ ግበረለይ ምሕረት
‎ምእንቲ ኣበሳይ ዝውዓልካ ኣብ ስቅለት
‎ሕያዋይ ሳምራዊ ንኣበሳይ ጽሮ
‎ምክሪ ከሰስተይ(2) ብምሕረት ስዓሮ

VERSE 3
‎ ካብ ሕጊ ሙሴ ቃላት ናልዓሉ
‎ ጭካነ ሓዊሶም ምሕረት ዘይብሉ
‎ ይጭሩሕ ኣለዉ ትሙት እናበሉ
‎ ኣድሕነኒ ጎይታይ(2) ምሳኻ ክህሉ

CHORUS
ኣይፈርደክኔ በለኒ ግበረለይ ምሕረት
‎ምእንቲ ኣበሳይ ዝውዓልካ ኣብ ስቅለት
‎ሕያዋይ ሳምራዊ ንኣበሳይ ጽሮ
‎ምክሪ ከሰስተይ(2) ብምሕረት ስዓሮ

VERSE 4
‎ብትሕትናካ ሞት ዕዳይ ደምሰሶ
‎ካበረድ ክጽዕዱ ርክሰተይ ኣልግሶ
‎ዘድሓንካዮ እስኻ መን''ዩ ዝከሶ
‎ንፍርድኻኸ(2) መናሎ ዝጥሕሶ

CHORUS
ኣይፈርደክኔ በለኒ ግበረለይ ምሕረት
‎ምእንቲ ኣበሳይ ዝውዓልካ ኣብ ስቅለት
‎ሕያዋይ ሳምራዊ ንኣበሳይ ጽሮ
‎ምክሪ ከሰስተይ(2) ብምሕረት ስዓሮ

VERSE 5
‎ ኣይፈርደክኔ ናበለ ፍርደይ ቀየሮ
‎ ብበደል ቆሰለ ሕማመይ ውን ጸሮ
‎ መቃብር ወሪዱ ንሞተይ ስዓሮ
‎ ኣካለይ ፈረሐ(2) ፍርደይ

CHORUS
ኣይፈርደክኔ በለኒ ግበረለይ ምሕረት
‎ምእንቲ ኣበሳይ ዝውዓልካ ኣብ ስቅለት
‎ሕያዋይ ሳምራዊ ንኣበሳይ ጽሮ
‎ምክሪ ከሰስተይ(2) ብምሕረት ስዓሮ

VERSE 6
ምስ ተነገሮ

CHORUS
ኣይፈርደክኔ በለኒ ግበረለይ ምሕረት
‎ምእንቲ ኣበሳይ ዝውዓልካ ኣብ ስቅለት
‎ሕያዋይ ሳምራዊ ንኣበሳይ ጽሮ
‎ምክሪ ከሰስተይ(2) ብምሕረት ስዓሮ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ayferdekne beleni gibereley mihret
‎menti abesay ziwalka ab siqlet
‎hyaway samrawi niabesay ts’ro
‎mkri kesestey (2) bimhret siaro

VERSE 1
‎ hiywet hadige mot mis merets’ku
‎ ts’egay tegefifu ts’elmat tegolbebuku
‎ bihsum limdi nefsey enarkesku
‎ ayhud hizomuni (2) mot win teferedku

CHORUS
Ayferdekne beleni gibereley mihret
‎menti abesay ziwalka ab siqlet
‎hyaway samrawi niabesay ts’ro
‎mkri kesestey (2) bimhret siaro

VERSE 2
‎abi mis nieshto etom zihazuni
‎aeman alalu bidarba kiqetluni
‎nkኽsuka ilom nabaka amts’uuni
‎dkmetey riika (2) amlaኽ mihareni

CHORUS
Ayferdekne beleni gibereley mihret
‎menti abesay ziwalka ab siqlet
‎hyaway samrawi niabesay ts’ro
‎mkri kesestey (2) bimhret siaro

VERSE 3
‎ kab higi muse qalat nalalu
‎ ch’kane hawisom mihret zeyblu
‎ yich’ruh alewu timut enabelu
‎ adhneni goytay (2) misaኻ kihlu

CHORUS
Ayferdekne beleni gibereley mihret
‎menti abesay ziwalka ab siqlet
‎hyaway samrawi niabesay ts’ro
‎mkri kesestey (2) bimhret siaro

VERSE 4
‎bthtnaka mot eday demseso
‎kabered kits’edu riksetey algso
‎zedhankayo esኻ men''yu zikeso
‎nfrdኻኸ (2) menalo zit’hso

CHORUS
Ayferdekne beleni gibereley mihret
‎menti abesay ziwalka ab siqlet
‎hyaway samrawi niabesay ts’ro
‎mkri kesestey (2) bimhret siaro

VERSE 5
‎ ayferdekne nabele firdey qeyero
‎ bibedel qosele himamey win ts’ero
‎ meqabr weridu nimotey siaro
‎ akaley ferehe (2) firdey

CHORUS
Ayferdekne beleni gibereley mihret
‎menti abesay ziwalka ab siqlet
‎hyaway samrawi niabesay ts’ro
‎mkri kesestey (2) bimhret siaro

VERSE 6
Mis tenegero

CHORUS
Ayferdekne beleni gibereley mihret
‎menti abesay ziwalka ab siqlet
‎hyaway samrawi niabesay ts’ro
‎mkri kesestey (2) bimhret siaro'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ayiferidekiniye-beleni', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ayinoche Madanun Ayitewalina (ayinoche-madanun-ayitewalina)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 1
ሀያሉ ጌታችን ቸሩ እግዚአብሔር
ቤተልሔም ዋሻ በዚያ በግርግም
ተወለደ ዛሬ መድኃኔዓለም
አዝ።።።።።።።።።።።።።።።።።።።።፡።።።።።።።

VERSE 2
የተነበዩለት ብዙ ነብያት
ከድንግል ተወልዶ አዳነን በእውነት
ከበደል ጉራንጉር አነሳን ከትቢያ
በአንድነት እንዘምር እንበል ሀሌ ሎያ

VERSE 3
አዝ።።።።።።።።።።።።።።።።።።።።።።።።።።።።
የተናቅን ስንሆን እኛን ሊያከብር ወዶ
በፍቅሩ አከበረን እራሱን አዋርዶ
ምን አይነት ፍቅር ነው ፍጹም ምህረት

VERSE 4
የአምላክ መወለድ በከብቶች በረት
አዝ።።።።።።።።።።።።።።።።።።።።።።።።።።።።
በንህፅና ፀንተሽ ቤተ መቅደስ የኖርሽ
በእቱም ድንግልና መድሀኒትን ወለድሽ

VERSE 5
የአለምን ሀጥያት የሚያስተሰርይ ጌታ
ተወልዷል ከድንግል የሰዎች አለኝታ',
      lyrics_transliteration = 'Aynoche madanun aytewalna (2)
Yigebawal (2)kibrna misgana
.... .........................
Kesemay werede sewn bemafqer

VERSE 1
Heyalu Getachen cheru Egziabher
Betelhem washa beziya begrgm
Tewelede zare Medhanealem

VERSE 2
Yetenebeyulet bizu nebyat
Kedngl teweldo adanen beewnet
Kebedel gurangur anesan ketbiya
Beandnet enzemr enbel hele loya

VERSE 3
Yetenaqn sinhon egnan liyakebr wedo
Befqru akeberen erasun awardo
Min aynet fiqr new fits’um mihret

VERSE 4
Yeamlak meweled bekebtoch beret
Benhts’na ts’entesh bete meqdes yenorsh
Beetum dingilina medhenitn weledsh

VERSE 5
Yealemn het’yat yemiyastesery Geta
Teweldwal kedngl yesewoch alegnta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ayinoche-madanun-ayitewalina'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 1
ሀያሉ ጌታችን ቸሩ እግዚአብሔር
ቤተልሔም ዋሻ በዚያ በግርግም
ተወለደ ዛሬ መድኃኔዓለም
አዝ።።።።።።።።።።።።።።።።።።።።፡።።።።።።።

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 2
የተነበዩለት ብዙ ነብያት
ከድንግል ተወልዶ አዳነን በእውነት
ከበደል ጉራንጉር አነሳን ከትቢያ
በአንድነት እንዘምር እንበል ሀሌ ሎያ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 3
አዝ።።።።።።።።።።።።።።።።።።።።።።።።።።።።
የተናቅን ስንሆን እኛን ሊያከብር ወዶ
በፍቅሩ አከበረን እራሱን አዋርዶ
ምን አይነት ፍቅር ነው ፍጹም ምህረት

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 4
የአምላክ መወለድ በከብቶች በረት
አዝ።።።።።።።።።።።።።።።።።።።።።።።።።።።።
በንህፅና ፀንተሽ ቤተ መቅደስ የኖርሽ
በእቱም ድንግልና መድሀኒትን ወለድሽ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 5
የአለምን ሀጥያት የሚያስተሰርይ ጌታ
ተወልዷል ከድንግል የሰዎች አለኝታ

CHORUS
አይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ክብርና ምስጋና
።።።።፡።።።።።።።።።።።።።።።።።።።።።።።።።
ከሰማይ ወረደ ሰውን በማፍቀር'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2)kibrna misgana
.... .........................
Kesemay werede sewn bemafqer

VERSE 1
Heyalu Getachen cheru Egziabher
Betelhem washa beziya begrgm
Tewelede zare Medhanealem
CHORUS

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2)kibrna misgana
.... .........................
Kesemay werede sewn bemafqer

VERSE 2
Yetenebeyulet bizu nebyat
Kedngl teweldo adanen beewnet
Kebedel gurangur anesan ketbiya
Beandnet enzemr enbel hele loya

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2)kibrna misgana
.... .........................
Kesemay werede sewn bemafqer

VERSE 3
CHORUS
Yetenaqn sinhon egnan liyakebr wedo
Befqru akeberen erasun awardo
Min aynet fiqr new fits’um mihret

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2)kibrna misgana
.... .........................
Kesemay werede sewn bemafqer

VERSE 4
Yeamlak meweled bekebtoch beret
CHORUS
Benhts’na ts’entesh bete meqdes yenorsh
Beetum dingilina medhenitn weledsh

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2)kibrna misgana
.... .........................
Kesemay werede sewn bemafqer

VERSE 5
Yealemn het’yat yemiyastesery Geta
Teweldwal kedngl yesewoch alegnta

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2)kibrna misgana
.... .........................
Kesemay werede sewn bemafqer'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ayinoche-madanun-ayitewalina', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ayinoche Madanun Ayitewalina (ayinoche-madanun-ayitewalina-7zh3ww1ossu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 1
ኃያሉ ጌታቸን ቸሩ እግዚአበሔር
በቤተልሔም ዋሻ በዚያ በግርግም
ተወለደ ዛሬ መድኃኔዓለም
አ.ዝ //

VERSE 2
የተነበዩለት ብዙ ነብያት
ከድንግል ተወልዶ አዳነን በእውነት
ከበደል ጉራንጉን አነሳን ከትቢያ
በአንድነት እንዘምር እንበል ሃሌ ሎያ

VERSE 3
አ.ዝ //
የተናቅን ሰንሆን እኛን ሊያከብር ወዶ
በፍቅር አከበረን እራሱን አዋርዶ
ምን ዓይነት ፍቅር ነው ፍጹም ምህረት

VERSE 4
የአምላክ መወለድ በከብቶች በረት
አ.ዝ //
በንጽህና ጸንተሽ ቤተመቅደስ የኖርሽ
በኀቱም ድንግልና መድኃኒትን ወለድሽ

VERSE 5
የዓለምን ኃጢአት የሚያስተሰርይ ጌታ
ተወልዷል ከድንግል የሰዎች አለኝታ',
      lyrics_transliteration = 'Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
A.z //
Kesemay werede sewn bemafqer

VERSE 1
Hayalu getachen cheru egziabeher
Bebetelhem washa beziya begrgm
Tewelede zare Medhanealem
A.z //

VERSE 2
Yetenebeyulet bizu nebyat
Kedngl teweldo adanen beewnet
Kebedel gurangun anesan ketbiya
Beandnet enzemr enbel hale loya

VERSE 3
A.z //
Yetenaqn senhon egnan liyakebr wedo
Befqr akeberen erasun awardo
Min aynet fiqr new fits’um mihret

VERSE 4
Yeamlak meweled bekebtoch beret
A.z //
Bents’hna ts’entesh betemeqdes yenorsh
Behetum dingilina medhanitn weledsh

VERSE 5
Yealemn hat’iat yemiyastesery Geta
Teweldwal kedngl yesewoch alegnta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ayinoche-madanun-ayitewalina-7zh3ww1ossu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 1
ኃያሉ ጌታቸን ቸሩ እግዚአበሔር
በቤተልሔም ዋሻ በዚያ በግርግም
ተወለደ ዛሬ መድኃኔዓለም
አ.ዝ //

CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 2
የተነበዩለት ብዙ ነብያት
ከድንግል ተወልዶ አዳነን በእውነት
ከበደል ጉራንጉን አነሳን ከትቢያ
በአንድነት እንዘምር እንበል ሃሌ ሎያ

CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 3
አ.ዝ //
የተናቅን ሰንሆን እኛን ሊያከብር ወዶ
በፍቅር አከበረን እራሱን አዋርዶ
ምን ዓይነት ፍቅር ነው ፍጹም ምህረት

CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 4
የአምላክ መወለድ በከብቶች በረት
አ.ዝ //
በንጽህና ጸንተሽ ቤተመቅደስ የኖርሽ
በኀቱም ድንግልና መድኃኒትን ወለድሽ

CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር

VERSE 5
የዓለምን ኃጢአት የሚያስተሰርይ ጌታ
ተወልዷል ከድንግል የሰዎች አለኝታ

CHORUS
ዓይኖቼ ማዳኑን አይተዋልና /2/
ይገባዋል /2/ ክብርና ምስጋና
አ.ዝ //
ከሰማይ ወረደ ሰውን በማፍቀር'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
A.z //
Kesemay werede sewn bemafqer

VERSE 1
Hayalu getachen cheru egziabeher
Bebetelhem washa beziya begrgm
Tewelede zare Medhanealem
A.z //

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
A.z //
Kesemay werede sewn bemafqer

VERSE 2
Yetenebeyulet bizu nebyat
Kedngl teweldo adanen beewnet
Kebedel gurangun anesan ketbiya
Beandnet enzemr enbel hale loya

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
A.z //
Kesemay werede sewn bemafqer

VERSE 3
A.z //
Yetenaqn senhon egnan liyakebr wedo
Befqr akeberen erasun awardo
Min aynet fiqr new fits’um mihret

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
A.z //
Kesemay werede sewn bemafqer

VERSE 4
Yeamlak meweled bekebtoch beret
A.z //
Bents’hna ts’entesh betemeqdes yenorsh
Behetum dingilina medhanitn weledsh

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
A.z //
Kesemay werede sewn bemafqer

VERSE 5
Yealemn hat’iat yemiyastesery Geta
Teweldwal kedngl yesewoch alegnta

CHORUS
Aynoche madanun aytewalna (2)
Yigebawal (2) kibrna misgana
A.z //
Kesemay werede sewn bemafqer'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ayinoche-madanun-ayitewalina-7zh3ww1ossu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ayiselechegnm by Zemarit Nardos kasahun (ayiselechegnm-by-zemarit-nardos-kasahun)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 1
ታላቅ ነው የኛ ንጉስ ታላቅ ነው የኛ ጌታ
መጽሐፉን የዘረጋ ማህተሙን የፈታ
አንገቱን ፍጹም ደፍቶ ቀና እንድል አድርጎኛል
እየቃተተ ሞቶ በህይወት አቁሞኛል

VERSE 2
አልችልም የእርሱን ፍቅር መዘርዘርና
ማውራት
ውለታውን ለመግለጽ የለኝም ብርቱ ቃላት
ያንተ ክንድ የማይንደው ተራራ ጋራ የለም

VERSE 3
ወጥቻለሁ ከጥልቁ ታላቅ ነህ ዘለዓለም
የተከፈተ ደጃፍ ሰጥተኸኛል ከፊቴ
ተመስገን ክበርልኝ ንገስልኝ አባቴ
ለይተህ የጠራኸኝ ያበዛህልኝ ጸጋ

VERSE 4
ትዝታዬ ነህ ጌታ ሲመሽና ሲነጋ
ወዳጅና ዘመዴ ብዬ ስጠራህ ልኑር
ኢየሱስ የእግዚአብሔር ልጅ ለወጠኝ ያንተ',
      lyrics_transliteration = 'Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 1
Talaq new yegna nigus talaq new yegna Geta
Mets’hefun yezerega mahtemun yefeta
Angetun fits’um defto qena endl adrgognal
Eyeqatete moto behywet aqumognal

VERSE 2
Alchlm yeersun fiqr mezerzerna
Mawrat
Wiletawn lemeglets’ yelegnm birtu qalat
Yante kind yemayndew terara gara yelem

VERSE 3
Wet’chalehu ket’lqu talaq neh zelealem
Yetekefete dejaf set’teኸgnal kefite
Temesgen kiberlgn nigeslgn abate
Leyteh yet’eraኸgn yabezahlgn ts’ega

VERSE 4
Tiztaye neh Geta simeshna sinega
Wedajna zemede biye sit’erah linur
Iyesus yeEgziabher lij lewet’egn yante',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ayiselechegnm-by-zemarit-nardos-kasahun'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 1
ታላቅ ነው የኛ ንጉስ ታላቅ ነው የኛ ጌታ
መጽሐፉን የዘረጋ ማህተሙን የፈታ
አንገቱን ፍጹም ደፍቶ ቀና እንድል አድርጎኛል
እየቃተተ ሞቶ በህይወት አቁሞኛል

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 2
አልችልም የእርሱን ፍቅር መዘርዘርና
ማውራት
ውለታውን ለመግለጽ የለኝም ብርቱ ቃላት
ያንተ ክንድ የማይንደው ተራራ ጋራ የለም

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 3
ወጥቻለሁ ከጥልቁ ታላቅ ነህ ዘለዓለም
የተከፈተ ደጃፍ ሰጥተኸኛል ከፊቴ
ተመስገን ክበርልኝ ንገስልኝ አባቴ
ለይተህ የጠራኸኝ ያበዛህልኝ ጸጋ

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 4
ትዝታዬ ነህ ጌታ ሲመሽና ሲነጋ
ወዳጅና ዘመዴ ብዬ ስጠራህ ልኑር
ኢየሱስ የእግዚአብሔር ልጅ ለወጠኝ ያንተ

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 1
Talaq new yegna nigus talaq new yegna Geta
Mets’hefun yezerega mahtemun yefeta
Angetun fits’um defto qena endl adrgognal
Eyeqatete moto behywet aqumognal

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 2
Alchlm yeersun fiqr mezerzerna
Mawrat
Wiletawn lemeglets’ yelegnm birtu qalat
Yante kind yemayndew terara gara yelem

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 3
Wet’chalehu ket’lqu talaq neh zelealem
Yetekefete dejaf set’teኸgnal kefite
Temesgen kiberlgn nigeslgn abate
Leyteh yet’eraኸgn yabezahlgn ts’ega

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 4
Tiztaye neh Geta simeshna sinega
Wedajna zemede biye sit’erah linur
Iyesus yeEgziabher lij lewet’egn yante

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ayiselechegnm-by-zemarit-nardos-kasahun', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ayselchegnem / Orthodox Mezmure (ayselchegnem-orthodox-mezmure)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 1
ታላቅ ነው የኛ ንጉስ ታላቅ ነው የኛ ጌታ
መጽሐፉን የዘረጋ ማህተሙን የፈታ
ያንተ ክንድ የማይንደው ተራራ ጋራ የለም
ወጥቻለሁ ከጥልቁ ታላቅ ነህ ዘለዓለም

VERSE 2
የተከፈተ ደጃፍ ሰጥተኸኛል በፊቴ
ተመስገን ክበርልኝ ንገስልኝ አባቴ
አንገቱን ፍጹም ደፍቶ ቀና እንድል አድርጎኛል
እየቃተተ ሞቶ በህይወት አቁሞኛል

VERSE 3
አልችልም የእርሱን ፍቅር መዘርዘርና ማውራት
ውለታውን ለመግለጽ የለኝም ብርቱ ቃላት
ለይተህ የጠራኸኝ ያበዛህልኝ ጸጋ
ትዝታዬ ነህ ጌታ ሲመሽና ሲነጋ

VERSE 4
ወዳጅና ዘመዴ ብዬ ስጠራህ ልኑር
ኢየሱስ የእግዚአብሔር ልጅ ለወጠኝ ያንተ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 5
ታላቅ ነው የኛ ንጉስ ታላቅ ነው የኛ ጌታ
መጽሐፉን የዘረጋ ማህተሙን የፈታ',
      lyrics_transliteration = 'Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 1
Talaq new yegna nigus talaq new yegna Geta
Mets’hefun yezerega mahtemun yefeta
Yante kind yemayndew terara gara yelem
Wet’chalehu ket’lqu talaq neh zelealem

VERSE 2
Yetekefete dejaf set’teኸgnal befite
Temesgen kiberlgn nigeslgn abate
Angetun fits’um defto qena endl adrgognal
Eyeqatete moto behywet aqumognal

VERSE 3
Alchlm yeersun fiqr mezerzerna mawrat
Wiletawn lemeglets’ yelegnm birtu qalat
Leyteh yet’eraኸgn yabezahlgn ts’ega
Tiztaye neh Geta simeshna sinega

VERSE 4
Wedajna zemede biye sit’erah linur
Iyesus yeEgziabher lij lewet’egn yante
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 5
Talaq new yegna nigus talaq new yegna Geta
Mets’hefun yezerega mahtemun yefeta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ayselchegnem-orthodox-mezmure'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 1
ታላቅ ነው የኛ ንጉስ ታላቅ ነው የኛ ጌታ
መጽሐፉን የዘረጋ ማህተሙን የፈታ
ያንተ ክንድ የማይንደው ተራራ ጋራ የለም
ወጥቻለሁ ከጥልቁ ታላቅ ነህ ዘለዓለም

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 2
የተከፈተ ደጃፍ ሰጥተኸኛል በፊቴ
ተመስገን ክበርልኝ ንገስልኝ አባቴ
አንገቱን ፍጹም ደፍቶ ቀና እንድል አድርጎኛል
እየቃተተ ሞቶ በህይወት አቁሞኛል

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 3
አልችልም የእርሱን ፍቅር መዘርዘርና ማውራት
ውለታውን ለመግለጽ የለኝም ብርቱ ቃላት
ለይተህ የጠራኸኝ ያበዛህልኝ ጸጋ
ትዝታዬ ነህ ጌታ ሲመሽና ሲነጋ

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 4
ወዳጅና ዘመዴ ብዬ ስጠራህ ልኑር
ኢየሱስ የእግዚአብሔር ልጅ ለወጠኝ ያንተ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው

VERSE 5
ታላቅ ነው የኛ ንጉስ ታላቅ ነው የኛ ጌታ
መጽሐፉን የዘረጋ ማህተሙን የፈታ

CHORUS
አይሰለቸኝም ከቶ ውዳሴ መዝሙር ቅኔ
ብዙ ነው ያረገልኝ እግዚአብሔር በዘመኔ
ቸርነትና ፍቅሩን ያላራቀ ከባርያው
በለመለመው ስፍራ በጎቹን የሚያሰማራው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 1
Talaq new yegna nigus talaq new yegna Geta
Mets’hefun yezerega mahtemun yefeta
Yante kind yemayndew terara gara yelem
Wet’chalehu ket’lqu talaq neh zelealem

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 2
Yetekefete dejaf set’teኸgnal befite
Temesgen kiberlgn nigeslgn abate
Angetun fits’um defto qena endl adrgognal
Eyeqatete moto behywet aqumognal

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 3
Alchlm yeersun fiqr mezerzerna mawrat
Wiletawn lemeglets’ yelegnm birtu qalat
Leyteh yet’eraኸgn yabezahlgn ts’ega
Tiztaye neh Geta simeshna sinega

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 4
Wedajna zemede biye sit’erah linur
Iyesus yeEgziabher lij lewet’egn yante
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw

VERSE 5
Talaq new yegna nigus talaq new yegna Geta
Mets’hefun yezerega mahtemun yefeta

CHORUS
Ayselechegnm keto widase mezmur qine
Bizu new yaregelgn Egziabher bezemene
Chernetna fiqrun yalaraqe kebaryaw
Belemelemew sifra begochun yemiyasemaraw'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ayselchegnem-orthodox-mezmure', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Azekri Dingil (azekri-dingil)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አዘክሪ ድንግል አዘክሪ
ለልጅሽ አሳስቢ አዘክሪ
ለኃጥአን አኮ ለጻድቃን
ከአንቺ መወለዱን አዘክሪ

VERSE 1
በቤተልሔም አዘክሪ
በጨርቅ መጠቅለሉን አዘክሪ
መኝታው ግርግም አዘክሪ
ለኃጥአን አኮ ለጻድቃን',
      lyrics_transliteration = 'Azekri Dingil azekri
Le lijish asasebi azekri
Le hat’an ako le tsadqan
Ke anchi mewoledun azekri

VERSE 1
Be Betlehem azekri
Be cherq meteqlelun azekri
Menyitaw girgim azekri
Le hat’an ako le tsadqan',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'azekri-dingil'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዘክሪ ድንግል አዘክሪ
ለልጅሽ አሳስቢ አዘክሪ
ለኃጥአን አኮ ለጻድቃን
ከአንቺ መወለዱን አዘክሪ

VERSE 1
በቤተልሔም አዘክሪ
በጨርቅ መጠቅለሉን አዘክሪ
መኝታው ግርግም አዘክሪ
ለኃጥአን አኮ ለጻድቃን

CHORUS
አዘክሪ ድንግል አዘክሪ
ለልጅሽ አሳስቢ አዘክሪ
ለኃጥአን አኮ ለጻድቃን
ከአንቺ መወለዱን አዘክሪ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Azekri Dingil azekri
Le lijish asasebi azekri
Le hat’an ako le tsadqan
Ke anchi mewoledun azekri

VERSE 1
Be Betlehem azekri
Be cherq meteqlelun azekri
Menyitaw girgim azekri
Le hat’an ako le tsadqan

CHORUS
Azekri Dingil azekri
Le lijish asasebi azekri
Le hat’an ako le tsadqan
Ke anchi mewoledun azekri'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'azekri-dingil', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Azigne Simeta Betish (azigne-simeta-betish)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 1
ይቅር ባይ ስለሆነ ልጅሽ
በቀኙ በክብር ያለሽ
በምልጃሽ ለምተማመነዉ
ማሪያም ስምሽ ጎልቤቴ ነው

VERSE 2
ነሽና የመዳኒቴ ምንጭ
ሰላምን ደስታን የምታሰጭ
ቀዳሁኝ የነፍሴን ፈውስ
ይገባል አንቺን ማወደስ

VERSE 3
ፅዮን ሆይ ነሽ መማፀኛዬ
ውበቴ ክብሬ መድመቂያዬ
ዘወትር እላለሁ ቸመስገን
እግዚአብሔር አንቺን ሰለሰጠኝ

VERSE 4
ፀሎቴ ከልጅሽ ፊት ይግባ
ይታበስ ከአይኖቼ እንባ
ቁሚሊኝ ከአምላኬ ልታረቅ
ትካዜ ሐዘኔ እንዲርቅ

VERSE 5
ላንቺ ነው የምነግር ጉድለቴን
እንዲለብስ እራቁትነቴ
አልርቅም ድንግል ካንቺ ደጅ
ውሃዬ ሆኗል ወይንጠጅ',
      lyrics_transliteration = 'Wedqe emamlak silsh
Qena alukugn bereta golbete
Silehonsh Dingil mets’nanate

VERSE 1
Yiqr bay silehone lijsh
Beqegnu bekbr yalesh
Bemljash lemtemamenewu
Mariyam simsh golbete new

VERSE 2
Neshna yemedanite minch’
Selamn destan yemtasech’
Qedahugn yenefsen fews
Yigebal anchin mawedes

VERSE 3
Ts’yon hoy nesh memats’egnaye
Wibete kibre medmeqiyaye
Zewetr elalehu chemesgen
Egziabher anchin seleset’egn

VERSE 4
Ts’elote keljsh fit yigba
Yitabes keaynoche enba
Qumilign keamlake litareq
Tikaze hezene endirq

VERSE 5
Lanchi new yemnegr gudleten
Endilebs eraqutnete
Alrqm Dingil kanchi dej
Wihaye honwal weynt’ej',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'azigne-simeta-betish'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 1
ይቅር ባይ ስለሆነ ልጅሽ
በቀኙ በክብር ያለሽ
በምልጃሽ ለምተማመነዉ
ማሪያም ስምሽ ጎልቤቴ ነው

CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 2
ነሽና የመዳኒቴ ምንጭ
ሰላምን ደስታን የምታሰጭ
ቀዳሁኝ የነፍሴን ፈውስ
ይገባል አንቺን ማወደስ

CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 3
ፅዮን ሆይ ነሽ መማፀኛዬ
ውበቴ ክብሬ መድመቂያዬ
ዘወትር እላለሁ ቸመስገን
እግዚአብሔር አንቺን ሰለሰጠኝ

CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 4
ፀሎቴ ከልጅሽ ፊት ይግባ
ይታበስ ከአይኖቼ እንባ
ቁሚሊኝ ከአምላኬ ልታረቅ
ትካዜ ሐዘኔ እንዲርቅ

CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ

VERSE 5
ላንቺ ነው የምነግር ጉድለቴን
እንዲለብስ እራቁትነቴ
አልርቅም ድንግል ካንቺ ደጅ
ውሃዬ ሆኗል ወይንጠጅ

CHORUS
አዝኜ ስመጣ እቤትሽ
ወድቄ እማምላክ ስልሽ
ቀና አሉኩኝ በረታ ጎልበቴ
ስለሆንሽ ድንግል መፅናናቴ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
CHORUS
Wedqe emamlak silsh
Qena alukugn bereta golbete
Silehonsh Dingil mets’nanate

VERSE 1
Yiqr bay silehone lijsh
Beqegnu bekbr yalesh
Bemljash lemtemamenewu
Mariyam simsh golbete new

CHORUS
CHORUS
Wedqe emamlak silsh
Qena alukugn bereta golbete
Silehonsh Dingil mets’nanate

VERSE 2
Neshna yemedanite minch’
Selamn destan yemtasech’
Qedahugn yenefsen fews
Yigebal anchin mawedes

CHORUS
CHORUS
Wedqe emamlak silsh
Qena alukugn bereta golbete
Silehonsh Dingil mets’nanate

VERSE 3
Ts’yon hoy nesh memats’egnaye
Wibete kibre medmeqiyaye
Zewetr elalehu chemesgen
Egziabher anchin seleset’egn

CHORUS
CHORUS
Wedqe emamlak silsh
Qena alukugn bereta golbete
Silehonsh Dingil mets’nanate

VERSE 4
Ts’elote keljsh fit yigba
Yitabes keaynoche enba
Qumilign keamlake litareq
Tikaze hezene endirq

CHORUS
CHORUS
Wedqe emamlak silsh
Qena alukugn bereta golbete
Silehonsh Dingil mets’nanate

VERSE 5
Lanchi new yemnegr gudleten
Endilebs eraqutnete
Alrqm Dingil kanchi dej
Wihaye honwal weynt’ej

CHORUS
CHORUS
Wedqe emamlak silsh
Qena alukugn bereta golbete
Silehonsh Dingil mets’nanate'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'azigne-simeta-betish', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Baḥiranini Yibe (bahiranini-yibe-amarya)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አማርያ

VERSE 1
ባሕራንኒ ይቤ ዘነገደ ባሕረ (2x)

VERSE 2
ርኢክዎ ለሚካኤል ወስዕንኩ ጠይቆቶ ስዕን (2x)',
      lyrics_transliteration = 'Amarya

VERSE 1
Baḥiranini yibe zenegede baḥire (2x)

VERSE 2
Riiko Lemikaeli wesiiniku teyikoto siluniku (2x)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bahiranini-yibe-amarya'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማርያ

VERSE 1
ባሕራንኒ ይቤ ዘነገደ ባሕረ (2x)

CHORUS
አማርያ

VERSE 2
ርኢክዎ ለሚካኤል ወስዕንኩ ጠይቆቶ ስዕን (2x)

CHORUS
አማርያ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amarya

VERSE 1
Baḥiranini yibe zenegede baḥire (2x)

CHORUS
Amarya

VERSE 2
Riiko Lemikaeli wesiiniku teyikoto siluniku (2x)

CHORUS
Amarya'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bahiranini-yibe-amarya', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bakgnalehuna (bakgnalehuna)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 1
ፈጥነሽ ወደእኔ ነይ ከትንሿ ቤቴ
አጽናኚኝ እመአምላክ ድንግል እመቤቴ

VERSE 2
ባህሩ ትልቅ ነው ድንግል እመቤቴ
ትንሽ ናት መርከቤ /2/
የመንገዴ መሪ
አንቺ ነሽ ወደቤ /2/

VERSE 3
በመንገዴ ስዝል ድንግል እመቤቴ
ዓለም ትስቃለች /2/
መመኪያ እመቤቱ
ወዴት ነች እያለች /2/

VERSE 4
በቀቢጸ ተስፋ ድንግል እመቤቴ
እንዳልወድቅብሽ /2/
በቀንም በሌሊት
ተስፋዬ አንቺ ነሽ /2/

VERSE 5
የለም ያተረፍኩት ድንግል እመቤቴ
ወጥቼ ወርጄ /2/
ትርፌ አንቺ ብቻ ነሽ
ጽዮን አማላጄ /2/',
      lyrics_transliteration = 'Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 1
Fet’nesh wede’ene ney ketinishwa beté
Ats’nagnign EmeAmlak dingil emebeté

VERSE 2
Bahru tilik new dingil emebeté
Tinish nat merkebé (x2)
Yemengedé meri
Anchi nesh wede’bé (x2)

VERSE 3
Bemengedé sizil dingil emebeté
Alem t’sik’aletch (x2)
Memekiya emebetu
Wedet nech eyalech (x2)

VERSE 4
Beqebitse tesfa dingil emebeté
Endalwodkibish (x2)
Beqenem belelit
Tesfayé anchi nesh (x2)

VERSE 5
Yelem yaterafkut dingil emebeté
Wet’ché werjé (x2)
T’irfé anchi bicha nesh
Ts’iyon amalajé (x2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bakgnalehuna'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 1
ፈጥነሽ ወደእኔ ነይ ከትንሿ ቤቴ
አጽናኚኝ እመአምላክ ድንግል እመቤቴ

CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 2
ባህሩ ትልቅ ነው ድንግል እመቤቴ
ትንሽ ናት መርከቤ /2/
የመንገዴ መሪ
አንቺ ነሽ ወደቤ /2/

CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 3
በመንገዴ ስዝል ድንግል እመቤቴ
ዓለም ትስቃለች /2/
መመኪያ እመቤቱ
ወዴት ነች እያለች /2/

CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 4
በቀቢጸ ተስፋ ድንግል እመቤቴ
እንዳልወድቅብሽ /2/
በቀንም በሌሊት
ተስፋዬ አንቺ ነሽ /2/

CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና

VERSE 5
የለም ያተረፍኩት ድንግል እመቤቴ
ወጥቼ ወርጄ /2/
ትርፌ አንቺ ብቻ ነሽ
ጽዮን አማላጄ /2/

CHORUS
ባክኛለሁና በስጋ ፈተና
የዚህ ዓለም ሀዘን ጫፍ የለውምና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 1
Fet’nesh wede’ene ney ketinishwa beté
Ats’nagnign EmeAmlak dingil emebeté

CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 2
Bahru tilik new dingil emebeté
Tinish nat merkebé (x2)
Yemengedé meri
Anchi nesh wede’bé (x2)

CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 3
Bemengedé sizil dingil emebeté
Alem t’sik’aletch (x2)
Memekiya emebetu
Wedet nech eyalech (x2)

CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 4
Beqebitse tesfa dingil emebeté
Endalwodkibish (x2)
Beqenem belelit
Tesfayé anchi nesh (x2)

CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna

VERSE 5
Yelem yaterafkut dingil emebeté
Wet’ché werjé (x2)
T’irfé anchi bicha nesh
Ts’iyon amalajé (x2)

CHORUS
Bakgnalehuna besiga fetena
Yezih alem hazen ts’af yelewimna'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bakgnalehuna', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bakkattan deebisa (bakkattan-deebisa)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 1
Akka tasaa miti,yaadasaa keessattiduraan galmaa’eeraa
Adduyaa utuu hin uumin ilma isaa Kiristoosiin anaan filateera
Toorri fayyina koo baaramaa ta’ee an eebba ta’uu dha
Du’a mo’ee ka’ee ofkeessa nakaa’e mirgasaa taa’uu dha

VERSE 2
An amma haaradha hin beeku kaleessaa
Hawwii koo fannisee seeneera isa keessaa
Balbala koo cufee sichi qofaa hin taa’uu
Haaraan siif kataba kan duraa hin lakkaa’uu

VERSE 3
Hiddi handhuura koo, sirraa wanna citeef sitti lakkaa’ataa
Dhahannaan onnee koof guutummaan ribuu koo siin balbaloomfataa
Silgi Sagalee kee kan fannoo irraa madde soorri koo ganamaa
Ittiin bulmaata koo dhugeeffanna dhugaa gaarammaa keen himaa

VERSE 4
Amma tasgabbaa’e ala hin dhageeffadhu
Balbala koo cufee keessa koon dhagahaa
Fayyeera Afuurri koo Lubbuu koo baraare
Foon koo isaaf qulleesseen Ormaaf ifa ta’aa

VERSE 5
Jaalalli kee dhugaa kan dhageettiin olii kan arge agartuun koo
Maddiin dhiitee bahe sadeessoof hin laannee olnaaf keesse hinkoo koo
Aangoof teessoon yeroo, Siboof ayyaana koo naduraa hin ukkaamsuu
Jireenya koo har’aa, galgala koo borii kennaa kee hin xiqqeessuu

VERSE 6
Galma warra dhugaa Maqaa hin moggaafamnee
Keessaan si’amaneen guutuun sitti of kennee
Wargama Onnee koo kan dheebuu koo kuttee
Ilma kee nagootee baga Abbaa koo taate

VERSE 7
Gaarummaan Isaa Narratti Baay''ate{{2))
Araarri Isaa Narratti Baay''ate((2))
Farsaa ergamoota si haa dhageesisuu',
      lyrics_transliteration = 'Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 1
Akka tasaa miti,yaadasaa keessattiduraan galmaa’eeraa
Adduyaa utuu hin uumin ilma isaa Kiristoosiin anaan filateera
Toorri fayyina koo baaramaa ta’ee an eebba ta’uu dha
Du’a mo’ee ka’ee ofkeessa nakaa’e mirgasaa taa’uu dha

VERSE 2
An amma haaradha hin beeku kaleessaa
Hawwii koo fannisee seeneera isa keessaa
Balbala koo cufee sichi qofaa hin taa’uu
Haaraan siif kataba kan duraa hin lakkaa’uu

VERSE 3
Hiddi handhuura koo, sirraa wanna citeef sitti lakkaa’ataa
Dhahannaan onnee koof guutummaan ribuu koo siin balbaloomfataa
Silgi Sagalee kee kan fannoo irraa madde soorri koo ganamaa
Ittiin bulmaata koo dhugeeffanna dhugaa gaarammaa keen himaa

VERSE 4
Amma tasgabbaa’e ala hin dhageeffadhu
Balbala koo cufee keessa koon dhagahaa
Fayyeera Afuurri koo Lubbuu koo baraare
Foon koo isaaf qulleesseen Ormaaf ifa ta’aa

VERSE 5
Jaalalli kee dhugaa kan dhageettiin olii kan arge agartuun koo
Maddiin dhiitee bahe sadeessoof hin laannee olnaaf keesse hinkoo koo
Aangoof teessoon yeroo, Siboof ayyaana koo naduraa hin ukkaamsuu
Jireenya koo har’aa, galgala koo borii kennaa kee hin xiqqeessuu

VERSE 6
Galma warra dhugaa Maqaa hin moggaafamnee
Keessaan si’amaneen guutuun sitti of kennee
Wargama Onnee koo kan dheebuu koo kuttee
Ilma kee nagootee baga Abbaa koo taate

VERSE 7
Gaarummaan Isaa Narratti Baay''ate{{2))
Araarri Isaa Narratti Baay''ate( (2))
Farsaa ergamoota si haa dhageesisuu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bakkattan-deebisa'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 1
Akka tasaa miti,yaadasaa keessattiduraan galmaa’eeraa
Adduyaa utuu hin uumin ilma isaa Kiristoosiin anaan filateera
Toorri fayyina koo baaramaa ta’ee an eebba ta’uu dha
Du’a mo’ee ka’ee ofkeessa nakaa’e mirgasaa taa’uu dha

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 2
An amma haaradha hin beeku kaleessaa
Hawwii koo fannisee seeneera isa keessaa
Balbala koo cufee sichi qofaa hin taa’uu
Haaraan siif kataba kan duraa hin lakkaa’uu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 3
Hiddi handhuura koo, sirraa wanna citeef sitti lakkaa’ataa
Dhahannaan onnee koof guutummaan ribuu koo siin balbaloomfataa
Silgi Sagalee kee kan fannoo irraa madde soorri koo ganamaa
Ittiin bulmaata koo dhugeeffanna dhugaa gaarammaa keen himaa

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 4
Amma tasgabbaa’e ala hin dhageeffadhu
Balbala koo cufee keessa koon dhagahaa
Fayyeera Afuurri koo Lubbuu koo baraare
Foon koo isaaf qulleesseen Ormaaf ifa ta’aa

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 5
Jaalalli kee dhugaa kan dhageettiin olii kan arge agartuun koo
Maddiin dhiitee bahe sadeessoof hin laannee olnaaf keesse hinkoo koo
Aangoof teessoon yeroo, Siboof ayyaana koo naduraa hin ukkaamsuu
Jireenya koo har’aa, galgala koo borii kennaa kee hin xiqqeessuu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 6
Galma warra dhugaa Maqaa hin moggaafamnee
Keessaan si’amaneen guutuun sitti of kennee
Wargama Onnee koo kan dheebuu koo kuttee
Ilma kee nagootee baga Abbaa koo taate

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))

VERSE 7
Gaarummaan Isaa Narratti Baay''ate{{2))
Araarri Isaa Narratti Baay''ate((2))
Farsaa ergamoota si haa dhageesisuu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu((2))'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 1
Akka tasaa miti,yaadasaa keessattiduraan galmaa’eeraa
Adduyaa utuu hin uumin ilma isaa Kiristoosiin anaan filateera
Toorri fayyina koo baaramaa ta’ee an eebba ta’uu dha
Du’a mo’ee ka’ee ofkeessa nakaa’e mirgasaa taa’uu dha

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 2
An amma haaradha hin beeku kaleessaa
Hawwii koo fannisee seeneera isa keessaa
Balbala koo cufee sichi qofaa hin taa’uu
Haaraan siif kataba kan duraa hin lakkaa’uu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 3
Hiddi handhuura koo, sirraa wanna citeef sitti lakkaa’ataa
Dhahannaan onnee koof guutummaan ribuu koo siin balbaloomfataa
Silgi Sagalee kee kan fannoo irraa madde soorri koo ganamaa
Ittiin bulmaata koo dhugeeffanna dhugaa gaarammaa keen himaa

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 4
Amma tasgabbaa’e ala hin dhageeffadhu
Balbala koo cufee keessa koon dhagahaa
Fayyeera Afuurri koo Lubbuu koo baraare
Foon koo isaaf qulleesseen Ormaaf ifa ta’aa

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 5
Jaalalli kee dhugaa kan dhageettiin olii kan arge agartuun koo
Maddiin dhiitee bahe sadeessoof hin laannee olnaaf keesse hinkoo koo
Aangoof teessoon yeroo, Siboof ayyaana koo naduraa hin ukkaamsuu
Jireenya koo har’aa, galgala koo borii kennaa kee hin xiqqeessuu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 6
Galma warra dhugaa Maqaa hin moggaafamnee
Keessaan si’amaneen guutuun sitti of kennee
Wargama Onnee koo kan dheebuu koo kuttee
Ilma kee nagootee baga Abbaa koo taate

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))

VERSE 7
Gaarummaan Isaa Narratti Baay''ate{{2))
Araarri Isaa Narratti Baay''ate( (2))
Farsaa ergamoota si haa dhageesisuu

CHORUS
Hin dhaamsuum ifa koo Abidda nakeessaa
Kennaa koo hin awwalu bakkattan deebisaa
Qartee sagalee koo akka gurraaf toluu
Sifaarsuuf uumamee waan biraaf hin oolu( (2))'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bakkattan-deebisa', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bale Wuletaye (bale-wuletaye)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ

VERSE 1
በሩን ቢዘጋብኝ ስምዖን ጨክኖ
ዝቅ አደርጎ ቢያየኝ ከአይሁድ ጋር ሆኖ
እንድቀርብ ወደ እርሱ አዘዘኝ ጌታዬ
እግሩን አጥበዋለሁ ወድቄ በእንባዬ /2/

VERSE 2
የቀራጭ አለቃ ቢሆንም ስራዬ
እንድ ወርድ ከዛፉ አዘዘኝ ጌታዬ
መዓረጌን መሸከም እስኪያቅተኝ ድረስ
ቤቴ ተባረከ በኢየሱስ ክርስቶስ /2/

VERSE 3
ድንጋይ የጨበጡ ፈራጆች ከበውኝ
ነውሬን ዘርዝረው ጌታ ፊት አቆሙኝ
ፈረደችባቸው ኃጢአትም በእነርሱ
በሠላም ሂድ ብሎ ምሮኛል ንጉሱ /2/

VERSE 4
የማምነውም አምላክ አውቀዋለሁ እኔ
በሰራልኝ ሥራ በእድሜ በዘመኔ
ፍቅሩን ተሸክሟል የልቤ ትከሻ
ልለየው አልችልም እስከ መጨረሻ /2/',
      lyrics_transliteration = 'Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye

VERSE 1
Berun bizege-bi-gn Simon chekno
Ziq adergo biyaye-gn ke-Ayihud gara honno
Indiqerib wede irsu azzez-egn Getaye
Igrun atbewalehu wedqie be-inbaye (2)

VERSE 2
Ye-qerach aleqa bihonim siraye
Indiwerd ke-zafu azzez-egn Getaye
Ma''eregien meshekem iskiyaktie dres
Bete tebareke be-Iyesus Kristos (2)

VERSE 3
Dingay ye-chebetu ferajoch kebewign
Newrien zerzerew Geta fit aqumugn
Feredech-bachew hatiat-m be-inersu
Be-selam hid bilo mirognal Nigusu (2)

VERSE 4
Yemamnewm Amlak awqewalehu inie
Be-serallign sira be-idmie be-zemene
Fikrun teshekmuwal ye-libie tikesha
Lileyew alchilum iske mecheresha (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bale-wuletaye'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ

VERSE 1
በሩን ቢዘጋብኝ ስምዖን ጨክኖ
ዝቅ አደርጎ ቢያየኝ ከአይሁድ ጋር ሆኖ
እንድቀርብ ወደ እርሱ አዘዘኝ ጌታዬ
እግሩን አጥበዋለሁ ወድቄ በእንባዬ /2/

CHORUS
ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ

VERSE 2
የቀራጭ አለቃ ቢሆንም ስራዬ
እንድ ወርድ ከዛፉ አዘዘኝ ጌታዬ
መዓረጌን መሸከም እስኪያቅተኝ ድረስ
ቤቴ ተባረከ በኢየሱስ ክርስቶስ /2/

CHORUS
ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ

VERSE 3
ድንጋይ የጨበጡ ፈራጆች ከበውኝ
ነውሬን ዘርዝረው ጌታ ፊት አቆሙኝ
ፈረደችባቸው ኃጢአትም በእነርሱ
በሠላም ሂድ ብሎ ምሮኛል ንጉሱ /2/

CHORUS
ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ

VERSE 4
የማምነውም አምላክ አውቀዋለሁ እኔ
በሰራልኝ ሥራ በእድሜ በዘመኔ
ፍቅሩን ተሸክሟል የልቤ ትከሻ
ልለየው አልችልም እስከ መጨረሻ /2/

CHORUS
ባለውለታዬ /2/
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ተመስገን ጌታዬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye

VERSE 1
Berun bizege-bi-gn Simon chekno
Ziq adergo biyaye-gn ke-Ayihud gara honno
Indiqerib wede irsu azzez-egn Getaye
Igrun atbewalehu wedqie be-inbaye (2)

CHORUS
Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye

VERSE 2
Ye-qerach aleqa bihonim siraye
Indiwerd ke-zafu azzez-egn Getaye
Ma''eregien meshekem iskiyaktie dres
Bete tebareke be-Iyesus Kristos (2)

CHORUS
Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye

VERSE 3
Dingay ye-chebetu ferajoch kebewign
Newrien zerzerew Geta fit aqumugn
Feredech-bachew hatiat-m be-inersu
Be-selam hid bilo mirognal Nigusu (2)

CHORUS
Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye

VERSE 4
Yemamnewm Amlak awqewalehu inie
Be-serallign sira be-idmie be-zemene
Fikrun teshekmuwal ye-libie tikesha
Lileyew alchilum iske mecheresha (2)

CHORUS
Bale wuletaye (2)
Ka-amed yanessahign ke-tbiya tetiye
Temesgen Getaye'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bale-wuletaye', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Baleweletaye (baleweletaye)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 1
እንድቀርብ ወደ እርሱ አዘዘ ጌታዬ
እግሩን አጥበዋለሁ ወድቄ በእንባዬ

VERSE 2
የቀራጭ አለቃ ቢሆንም ስራዬ
እንድወርድ ከዛፉ አዘዘጌታዬ
ማይረጌን መሸከም እስኪያቅተኝ ድረስ
ቤቴ ተባረከ በእየሱስ ክርስቶስ

VERSE 3
ድንጋይ የጨበጡ ፈራጆች ከበውኝ
ነውሬን ዘርዝረው ጌታ ፊት አቆሙኝ
ፈረደችባቸው ሀጢያትም በእነርሱ
በሰላም ሂድ ብሎ ምሮኛልን ጉሱ

VERSE 4
የማምነውን አምላክ አውቀዋለሁ እኔ
በሰራልኝ ስራ በእድሜ በዘመኔ
ፍቅሩን ተሸክሟል የልቤትከሻ
ልለየው አልችልም እስከመጨረሻ

VERSE 5
የቀራጭ አለቃ ቢሆንም ስራይ
እድወርድ ከዛፉ አዘዘ ጌታዬ
ማዕረጌን መሸከም እስኪያቅተኝ ድረስ ቤቴ ተባረከ በእየሱስ ክርስቶስ',
      lyrics_transliteration = 'Balewletaye (2) kamedyanesahgn
Ketbyatet’ye temesgen Getaye
Berunbizegabgn simon ch’ekno
Ziqadrgo biyayegn keayhudgar hono

VERSE 1
Endqerb wede ersu azeze Getaye
Egrun at’bewalehu wedqe beenbaye

VERSE 2
Yeqerach’ aleqa bihonm siraye
Endwerd kezafu azezegetaye
Mayregen meshekem eskiyaqtegn dires
Bete tebareke beeyesus Kristos

VERSE 3
Dingay yech’ebet’u ferajoch kebewgn
Newren zerzrew Geta fit aqomugn
Feredechbachew het’iyatm beenersu
Beselam hid bilo mirognaln gusu

VERSE 4
Yemamnewn amlak awqewalehu ene
Beseralgn sira beedme bezemene
Fiqrun teshekmwal yelbetkesha
Lileyew alchlm eskemech’eresha

VERSE 5
Yeqerach’ aleqa bihonm siray
Edwerd kezafu azeze Getaye
Maeregen meshekem eskiyaqtegn dires bete tebareke beeyesus Kristos',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'baleweletaye'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 1
እንድቀርብ ወደ እርሱ አዘዘ ጌታዬ
እግሩን አጥበዋለሁ ወድቄ በእንባዬ

CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 2
የቀራጭ አለቃ ቢሆንም ስራዬ
እንድወርድ ከዛፉ አዘዘጌታዬ
ማይረጌን መሸከም እስኪያቅተኝ ድረስ
ቤቴ ተባረከ በእየሱስ ክርስቶስ

CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 3
ድንጋይ የጨበጡ ፈራጆች ከበውኝ
ነውሬን ዘርዝረው ጌታ ፊት አቆሙኝ
ፈረደችባቸው ሀጢያትም በእነርሱ
በሰላም ሂድ ብሎ ምሮኛልን ጉሱ

CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 4
የማምነውን አምላክ አውቀዋለሁ እኔ
በሰራልኝ ስራ በእድሜ በዘመኔ
ፍቅሩን ተሸክሟል የልቤትከሻ
ልለየው አልችልም እስከመጨረሻ

CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ

VERSE 5
የቀራጭ አለቃ ቢሆንም ስራይ
እድወርድ ከዛፉ አዘዘ ጌታዬ
ማዕረጌን መሸከም እስኪያቅተኝ ድረስ ቤቴ ተባረከ በእየሱስ ክርስቶስ

CHORUS
ባለውለታዬ /2/ ካመድያነሳህኝ
ከትብያተጥዬ ተመስገን ጌታዬ
በሩንቢዘጋብኝ ስምኦን ጨክኖ
ዝቅአድርጎ ቢያየኝ ከአይሁድጋር ሆኖ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Balewletaye (2) kamedyanesahgn
Ketbyatet’ye temesgen Getaye
Berunbizegabgn simon ch’ekno
Ziqadrgo biyayegn keayhudgar hono

VERSE 1
Endqerb wede ersu azeze Getaye
Egrun at’bewalehu wedqe beenbaye

CHORUS
Balewletaye (2) kamedyanesahgn
Ketbyatet’ye temesgen Getaye
Berunbizegabgn simon ch’ekno
Ziqadrgo biyayegn keayhudgar hono

VERSE 2
Yeqerach’ aleqa bihonm siraye
Endwerd kezafu azezegetaye
Mayregen meshekem eskiyaqtegn dires
Bete tebareke beeyesus Kristos

CHORUS
Balewletaye (2) kamedyanesahgn
Ketbyatet’ye temesgen Getaye
Berunbizegabgn simon ch’ekno
Ziqadrgo biyayegn keayhudgar hono

VERSE 3
Dingay yech’ebet’u ferajoch kebewgn
Newren zerzrew Geta fit aqomugn
Feredechbachew het’iyatm beenersu
Beselam hid bilo mirognaln gusu

CHORUS
Balewletaye (2) kamedyanesahgn
Ketbyatet’ye temesgen Getaye
Berunbizegabgn simon ch’ekno
Ziqadrgo biyayegn keayhudgar hono

VERSE 4
Yemamnewn amlak awqewalehu ene
Beseralgn sira beedme bezemene
Fiqrun teshekmwal yelbetkesha
Lileyew alchlm eskemech’eresha

CHORUS
Balewletaye (2) kamedyanesahgn
Ketbyatet’ye temesgen Getaye
Berunbizegabgn simon ch’ekno
Ziqadrgo biyayegn keayhudgar hono

VERSE 5
Yeqerach’ aleqa bihonm siray
Edwerd kezafu azeze Getaye
Maeregen meshekem eskiyaqtegn dires bete tebareke beeyesus Kristos

CHORUS
Balewletaye (2) kamedyanesahgn
Ketbyatet’ye temesgen Getaye
Berunbizegabgn simon ch’ekno
Ziqadrgo biyayegn keayhudgar hono'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'baleweletaye', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Barkeni Aba Yaqob (barkeni-aba-yaqob)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ባርከኒ አባ መፍቀሬ ምእመናን ያዕቆብ

VERSE 1
ባርከኒ አባ መፍቀሬ ምእመናን ያዕቆብ',
      lyrics_transliteration = 'Barkeni Aba mefekere meamenan Yaqob

VERSE 1
Barkeni Aba mefekere meamenan Yaqob',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'barkeni-aba-yaqob'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባርከኒ አባ መፍቀሬ ምእመናን ያዕቆብ

VERSE 1
ባርከኒ አባ መፍቀሬ ምእመናን ያዕቆብ

CHORUS
ባርከኒ አባ መፍቀሬ ምእመናን ያዕቆብ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Barkeni Aba mefekere meamenan Yaqob

VERSE 1
Barkeni Aba mefekere meamenan Yaqob

CHORUS
Barkeni Aba mefekere meamenan Yaqob'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'barkeni-aba-yaqob', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bayinoche Efeligishalew (bayinoche-efeligishalew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)

VERSE 1
አይሰግድም ጉልበቴ ለሐማ
ስለእኔ እመቤቴ ቆማ
አልፈራም እጠፋለሁ ብዬ
መስቀሉን በጀርባዬ አዝዬ

VERSE 2
ሎዛ ናት የጎኔ ማረፊያ
አልሰጋም ከደጀዋ ስተኛ
ማርያም ማርያም እያልኩኝ
በስሟ መች ተርቤ አየሁኝ

VERSE 3
አናብስት ይታዘዙላታል
መላእክት ያገለግልዋታል
እኔ ግን ስእልዋን በደረቴ
ታቅፌው ተባርኳዋል ሕይወቴ

VERSE 4
ልቤ ላይ ተስሏል ያው ፍቅሯ
እኖራለሁ ሁሌም በምልጃዋ
ሰቶኛል አድርጓት መመኪያ
ዘመኔን አልፋለሁ ከእርሷ ጋር',
      lyrics_transliteration = 'Baynoche efelgshalew
Beselsh hulgize ets’nanalew
Belbe Maryam eyalkugn
Zemenen kemekera dankugn (2)

VERSE 1
Aysegdm gulbete lehema
Sileene Emebete qoma
Alferam et’efalehu biye
Mesqelun bejerbaye azye

VERSE 2
Loza nat yegone marefiya
Alsegam kedejewa sitegna
Maryam Maryam eyalkugn
Besmwa mech terbe ayehugn

VERSE 3
Anabst yitazezulatal
Melaekt yageleglwatal
Ene gin sielwan bederete
Taqfew tebarkwawal hiywete

VERSE 4
Libe lay teslwal yaw fiqrwa
Enoralehu hulem bemljawa
Setognal adrgwat memekiya
Zemenen alfalehu keerswa gar',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bayinoche-efeligishalew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)

VERSE 1
አይሰግድም ጉልበቴ ለሐማ
ስለእኔ እመቤቴ ቆማ
አልፈራም እጠፋለሁ ብዬ
መስቀሉን በጀርባዬ አዝዬ

CHORUS
ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)

VERSE 2
ሎዛ ናት የጎኔ ማረፊያ
አልሰጋም ከደጀዋ ስተኛ
ማርያም ማርያም እያልኩኝ
በስሟ መች ተርቤ አየሁኝ

CHORUS
ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)

VERSE 3
አናብስት ይታዘዙላታል
መላእክት ያገለግልዋታል
እኔ ግን ስእልዋን በደረቴ
ታቅፌው ተባርኳዋል ሕይወቴ

CHORUS
ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)

VERSE 4
ልቤ ላይ ተስሏል ያው ፍቅሯ
እኖራለሁ ሁሌም በምልጃዋ
ሰቶኛል አድርጓት መመኪያ
ዘመኔን አልፋለሁ ከእርሷ ጋር

CHORUS
ባይኖቼ እፈልግሻለው
በስእልሽ ሁልጊዜ እፅናናለው
በልቤ ማርያም እያልኩኝ
ዘመኔን ከመከራ ዳንኩኝ (፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Baynoche efelgshalew
Beselsh hulgize ets’nanalew
Belbe Maryam eyalkugn
Zemenen kemekera dankugn (2)

VERSE 1
Aysegdm gulbete lehema
Sileene Emebete qoma
Alferam et’efalehu biye
Mesqelun bejerbaye azye

CHORUS
Baynoche efelgshalew
Beselsh hulgize ets’nanalew
Belbe Maryam eyalkugn
Zemenen kemekera dankugn (2)

VERSE 2
Loza nat yegone marefiya
Alsegam kedejewa sitegna
Maryam Maryam eyalkugn
Besmwa mech terbe ayehugn

CHORUS
Baynoche efelgshalew
Beselsh hulgize ets’nanalew
Belbe Maryam eyalkugn
Zemenen kemekera dankugn (2)

VERSE 3
Anabst yitazezulatal
Melaekt yageleglwatal
Ene gin sielwan bederete
Taqfew tebarkwawal hiywete

CHORUS
Baynoche efelgshalew
Beselsh hulgize ets’nanalew
Belbe Maryam eyalkugn
Zemenen kemekera dankugn (2)

VERSE 4
Libe lay teslwal yaw fiqrwa
Enoralehu hulem bemljawa
Setognal adrgwat memekiya
Zemenen alfalehu keerswa gar

CHORUS
Baynoche efelgshalew
Beselsh hulgize ets’nanalew
Belbe Maryam eyalkugn
Zemenen kemekera dankugn (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bayinoche-efeligishalew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: be abate bet zemari Mikael zebre ortodox mezmur cover (be-abate-bet-zemari-mikael-zebre-ortodox-mezmur-cover)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በአባቴ ቤት የፀኑትን አገልጋዮች አስታውሼ
በእቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብር ምቆመው እኔም እንደ ሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው

VERSE 1
እለት እለት እመጣለው አልቀረሁም ከደጃፍህ
ተምለስን እሰማለሁ አልነጠፈም ሁሌ ካፍህ
አልፍራህም እንደድሮ መደንገጡ የለም ከኔ
ከልሎኛል ግብዝነት አልታየኝም መባከኔ

VERSE 2
የተግባር ሰው ልሁን ጌታ ቅዱስ ቃልህን ልኑረው
በአንደበቴ ብቻ ሳይሆን በስራዬም ልመስክረው
የልጅነቴ አምላክ እርዳኝ በመፈስ እጆችህ ልቃኝ
በልቤ ደግሞ ልመለስ በልምድ መመላለስ ይብቃኝ

VERSE 3
የህይወት ምግብን አስጥሎ የርያን ምግብ የሚያስመኝ
ይዞኛል ክፉ አባዜ ለከንቱ ነገር ሚያደክመኝ
በህይወቴ ያረከውን ያንተን ፍቅር ልረዳው
ለደካማው እዘንልኝ አለማመኔን እርዳው',
      lyrics_transliteration = 'Beabate bet yets’enutn agelgayoch astawshe
Beebetu wist’ yet’efahut wede betu temelshe
Bekbr miqomew enem ende sew
Tanashu lijh meche yihon wede libe mimelesew

VERSE 1
Elet elet emet’alew alqerehum kedejafh
Temlesn esemalehu alnet’efem hule kafh
Alfrahm endedro medenget’u yelem kene
Kellognal gibznet altayegnm mebakene

VERSE 2
Yetegbar sew lihun Geta Kidus qalhn linurew
Beandebete bicha sayhon besrayem limeskrew
Yeljnete amlak erdagn bemefes ejochh liqagn
Belbe degmo limeles belmd memelales yibqagn

VERSE 3
Yehywet migbn ast’lo yeryan migb yemiyasmegn
Yizognal kifu abaze lekentu neger miyadekmegn
Behywete yarekewn yanten fiqr liredaw
Ledekamaw ezenlgn alemamenen erdaw',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'be-abate-bet-zemari-mikael-zebre-ortodox-mezmur-cover'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በአባቴ ቤት የፀኑትን አገልጋዮች አስታውሼ
በእቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብር ምቆመው እኔም እንደ ሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው

VERSE 1
እለት እለት እመጣለው አልቀረሁም ከደጃፍህ
ተምለስን እሰማለሁ አልነጠፈም ሁሌ ካፍህ
አልፍራህም እንደድሮ መደንገጡ የለም ከኔ
ከልሎኛል ግብዝነት አልታየኝም መባከኔ

CHORUS
በአባቴ ቤት የፀኑትን አገልጋዮች አስታውሼ
በእቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብር ምቆመው እኔም እንደ ሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው

VERSE 2
የተግባር ሰው ልሁን ጌታ ቅዱስ ቃልህን ልኑረው
በአንደበቴ ብቻ ሳይሆን በስራዬም ልመስክረው
የልጅነቴ አምላክ እርዳኝ በመፈስ እጆችህ ልቃኝ
በልቤ ደግሞ ልመለስ በልምድ መመላለስ ይብቃኝ

CHORUS
በአባቴ ቤት የፀኑትን አገልጋዮች አስታውሼ
በእቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብር ምቆመው እኔም እንደ ሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው

VERSE 3
የህይወት ምግብን አስጥሎ የርያን ምግብ የሚያስመኝ
ይዞኛል ክፉ አባዜ ለከንቱ ነገር ሚያደክመኝ
በህይወቴ ያረከውን ያንተን ፍቅር ልረዳው
ለደካማው እዘንልኝ አለማመኔን እርዳው

CHORUS
በአባቴ ቤት የፀኑትን አገልጋዮች አስታውሼ
በእቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብር ምቆመው እኔም እንደ ሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beabate bet yets’enutn agelgayoch astawshe
Beebetu wist’ yet’efahut wede betu temelshe
Bekbr miqomew enem ende sew
Tanashu lijh meche yihon wede libe mimelesew

VERSE 1
Elet elet emet’alew alqerehum kedejafh
Temlesn esemalehu alnet’efem hule kafh
Alfrahm endedro medenget’u yelem kene
Kellognal gibznet altayegnm mebakene

CHORUS
Beabate bet yets’enutn agelgayoch astawshe
Beebetu wist’ yet’efahut wede betu temelshe
Bekbr miqomew enem ende sew
Tanashu lijh meche yihon wede libe mimelesew

VERSE 2
Yetegbar sew lihun Geta Kidus qalhn linurew
Beandebete bicha sayhon besrayem limeskrew
Yeljnete amlak erdagn bemefes ejochh liqagn
Belbe degmo limeles belmd memelales yibqagn

CHORUS
Beabate bet yets’enutn agelgayoch astawshe
Beebetu wist’ yet’efahut wede betu temelshe
Bekbr miqomew enem ende sew
Tanashu lijh meche yihon wede libe mimelesew

VERSE 3
Yehywet migbn ast’lo yeryan migb yemiyasmegn
Yizognal kifu abaze lekentu neger miyadekmegn
Behywete yarekewn yanten fiqr liredaw
Ledekamaw ezenlgn alemamenen erdaw

CHORUS
Beabate bet yets’enutn agelgayoch astawshe
Beebetu wist’ yet’efahut wede betu temelshe
Bekbr miqomew enem ende sew
Tanashu lijh meche yihon wede libe mimelesew'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'be-abate-bet-zemari-mikael-zebre-ortodox-mezmur-cover', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: be efrata midir (be-efrata-midir)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 1
መንጋውን በሌሊት ሲጠብቁ እረኞች
ከሰማይም ሰሙ ታላቅ የምስራች
በመላእክት ግርማ ምድር ስታበራ
የሚያስጨንቅ ነበር እጅግ የሚያስፈራ

VERSE 2
ድንገትም የሰማይ ሰራዊት ተገልጠው
ባንድነት ዘመሩ ከኖሎት ጋር ሆነው
ክብር ለእግዚአብሔር በአርያም ብለው
ሰላምን በምድር በጎ ፍቃድ ለሰው

VERSE 3
ቤተልሄም ሄደው ጌታን ተሳለሙ
ከእናቱ ጋራ ሆነው በግርግም አገኙት
የመላእክትን ዜማ እረኞች አወሩ
በልዩ ምስጋና አምላክን ሲያከብሩ

VERSE 4
በመዝሙር ቢሆን ፍስሐ ደስታ
በዳዊት ከተማ ተወለደ ጌታ
ህፃን ከእናቱ ጋር በግርግም ፈለጉት
እርሱ ነው ለሰዎች የድነት ምልክት',
      lyrics_transliteration = 'Beefrata midr bebetelhem (2)
Geta tewelede kedngl Maryam (2)
Biranawiw kokeb kesemay ziq ale (2)
Fit’retm zemere hele luya eyale (2)

VERSE 1
Mengawn belelit sit’ebqu eregnoch
Kesemaym semu talaq yemsrach
Bemelaekt girma midr sitabera
Yemiyasch’enq neber ejg yemiyasfera

VERSE 2
Dingetm yesemay serawit tegelt’ew
Bandnet zemeru kenolot gar honew
Kibir leEgziabher bearyam bilew
Selamn bemdr bego fiqad lesew

VERSE 3
Betelhem hedew getan tesalemu
Keenatu gara honew begrgm agegnut
Yemelaektn zema eregnoch aweru
Belyu misgana amlakn siyakebru

VERSE 4
Bemezmur bihon fishe desta
Bedawit ketema tewelede Geta
Hits’an keenatu gar begrgm felegut
Ersu new lesewoch yednet milkt',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'be-efrata-midir'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 1
መንጋውን በሌሊት ሲጠብቁ እረኞች
ከሰማይም ሰሙ ታላቅ የምስራች
በመላእክት ግርማ ምድር ስታበራ
የሚያስጨንቅ ነበር እጅግ የሚያስፈራ

CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 2
ድንገትም የሰማይ ሰራዊት ተገልጠው
ባንድነት ዘመሩ ከኖሎት ጋር ሆነው
ክብር ለእግዚአብሔር በአርያም ብለው
ሰላምን በምድር በጎ ፍቃድ ለሰው

CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 3
ቤተልሄም ሄደው ጌታን ተሳለሙ
ከእናቱ ጋራ ሆነው በግርግም አገኙት
የመላእክትን ዜማ እረኞች አወሩ
በልዩ ምስጋና አምላክን ሲያከብሩ

CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/

VERSE 4
በመዝሙር ቢሆን ፍስሐ ደስታ
በዳዊት ከተማ ተወለደ ጌታ
ህፃን ከእናቱ ጋር በግርግም ፈለጉት
እርሱ ነው ለሰዎች የድነት ምልክት

CHORUS
በኤፍራታ ምድር በቤተልሄም/2/
ጌታ ተወለደ ከድንግል ማርያም/2/
ብራናዊው ኮከብ ከሰማይ ዝቅ አለ/2/
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beefrata midr bebetelhem (2)
Geta tewelede kedngl Maryam (2)
Biranawiw kokeb kesemay ziq ale (2)
Fit’retm zemere hele luya eyale (2)

VERSE 1
Mengawn belelit sit’ebqu eregnoch
Kesemaym semu talaq yemsrach
Bemelaekt girma midr sitabera
Yemiyasch’enq neber ejg yemiyasfera

CHORUS
Beefrata midr bebetelhem (2)
Geta tewelede kedngl Maryam (2)
Biranawiw kokeb kesemay ziq ale (2)
Fit’retm zemere hele luya eyale (2)

VERSE 2
Dingetm yesemay serawit tegelt’ew
Bandnet zemeru kenolot gar honew
Kibir leEgziabher bearyam bilew
Selamn bemdr bego fiqad lesew

CHORUS
Beefrata midr bebetelhem (2)
Geta tewelede kedngl Maryam (2)
Biranawiw kokeb kesemay ziq ale (2)
Fit’retm zemere hele luya eyale (2)

VERSE 3
Betelhem hedew getan tesalemu
Keenatu gara honew begrgm agegnut
Yemelaektn zema eregnoch aweru
Belyu misgana amlakn siyakebru

CHORUS
Beefrata midr bebetelhem (2)
Geta tewelede kedngl Maryam (2)
Biranawiw kokeb kesemay ziq ale (2)
Fit’retm zemere hele luya eyale (2)

VERSE 4
Bemezmur bihon fishe desta
Bedawit ketema tewelede Geta
Hits’an keenatu gar begrgm felegut
Ersu new lesewoch yednet milkt

CHORUS
Beefrata midr bebetelhem (2)
Geta tewelede kedngl Maryam (2)
Biranawiw kokeb kesemay ziq ale (2)
Fit’retm zemere hele luya eyale (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'be-efrata-midir', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Be Gete Semani (be-gete-semani)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'Within gethsemane
Within Gethsemane the botanic garden (2)

VERSE 1
Our Lord suffered on Earth for our sin and burden (2)

VERSE 2
በጌቴ ሴማኒ በአታክልቱ ቦታ (2)

VERSE 3
ለእኛ ሲል ጌታችን በዓለም ተንገላታ (2)

VERSE 4
Due to the transgression made by Eve and Adam (2)

VERSE 5
Sin had reigned over us, eternal death had come (2)

VERSE 6
While carrying the Cross, He climbed up the mountain (2)

VERSE 7
With a whip each of them took a turn to hit Him (2)

VERSE 8
She could not cease her tears, His mother the Virgin (2)

VERSE 9
While she saw her Son and the pain He was in (2)

VERSE 10
Without passing judgment in His divine glory (2)

VERSE 11
He said in His prayer, O Father have mercy (2)

VERSE 12
With transcendent power, He created mankind (2)

VERSE 13
Whipped by humanity, then buried once He died (2)

VERSE 14
Born in the flesh of man, He expressed love for us (2)

VERSE 15
Alpha and Omega is our Lord Jesus (2)',
      lyrics_transliteration = 'Be Gete Semani be-atakiltu bota (2)

VERSE 1
Le''enya sil Getachin be''alem tengelata (2)

VERSE 2
Le''enya sil Getachin be''alem tengelata (2)

VERSE 3
Le''enya sil Getachin be''alem tengelata (2)

VERSE 4
Le''enya sil Getachin be''alem tengelata (2)

VERSE 5
Le''enya sil Getachin be''alem tengelata (2)

VERSE 6
Le''enya sil Getachin be''alem tengelata (2)

VERSE 7
Le''enya sil Getachin be''alem tengelata (2)

VERSE 8
Le''enya sil Getachin be''alem tengelata (2)

VERSE 9
Le''enya sil Getachin be''alem tengelata (2)

VERSE 10
Le''enya sil Getachin be''alem tengelata (2)

VERSE 11
Le''enya sil Getachin be''alem tengelata (2)

VERSE 12
Le''enya sil Getachin be''alem tengelata (2)

VERSE 13
Le''enya sil Getachin be''alem tengelata (2)

VERSE 14
Le''enya sil Getachin be''alem tengelata (2)

VERSE 15
Le''enya sil Getachin be''alem tengelata (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'be-gete-semani'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Within gethsemane
Within Gethsemane the botanic garden (2)

VERSE 1
Our Lord suffered on Earth for our sin and burden (2)

CHORUS
Within gethsemane
Within Gethsemane the botanic garden (2)

VERSE 2
በጌቴ ሴማኒ በአታክልቱ ቦታ (2)

CHORUS
Within gethsemane
Within Gethsemane the botanic garden (2)

VERSE 3
ለእኛ ሲል ጌታችን በዓለም ተንገላታ (2)

CHORUS
Within gethsemane
Within Gethsemane the botanic garden (2)

VERSE 4
Due to the transgression made by Eve and Adam (2)

CHORUS
Within gethsemane
Within Gethsemane the botanic garden (2)

VERSE 5
Sin had reigned over us, eternal death had come (2)

CHORUS
Within gethsemane
Within Gethsemane the botanic garden (2)

VERSE 6
While carrying the Cross, He climbed up the mountain (2)

CHORUS
Within gethsemane
Within Gethsemane the botanic garden (2)

VERSE 7
With a whip each of them took a turn to hit Him (2)

CHORUS
Within gethsemane
Within Gethsemane the botanic garden (2)

VERSE 8
She could not cease her tears, His mother the Virgin (2)

CHORUS
Within gethsemane
Within Gethsemane the botanic garden (2)

VERSE 9
While she saw her Son and the pain He was in (2)

CHORUS
Within gethsemane
Within Gethsemane the botanic garden (2)

VERSE 10
Without passing judgment in His divine glory (2)

CHORUS
Within gethsemane
Within Gethsemane the botanic garden (2)

VERSE 11
He said in His prayer, O Father have mercy (2)

CHORUS
Within gethsemane
Within Gethsemane the botanic garden (2)

VERSE 12
With transcendent power, He created mankind (2)

CHORUS
Within gethsemane
Within Gethsemane the botanic garden (2)

VERSE 13
Whipped by humanity, then buried once He died (2)

CHORUS
Within gethsemane
Within Gethsemane the botanic garden (2)

VERSE 14
Born in the flesh of man, He expressed love for us (2)

CHORUS
Within gethsemane
Within Gethsemane the botanic garden (2)

VERSE 15
Alpha and Omega is our Lord Jesus (2)

CHORUS
Within gethsemane
Within Gethsemane the botanic garden (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Be Gete Semani be-atakiltu bota (2)

VERSE 1
Le''enya sil Getachin be''alem tengelata (2)

CHORUS
Be Gete Semani be-atakiltu bota (2)

VERSE 2
Le''enya sil Getachin be''alem tengelata (2)

CHORUS
Be Gete Semani be-atakiltu bota (2)

VERSE 3
Le''enya sil Getachin be''alem tengelata (2)

CHORUS
Be Gete Semani be-atakiltu bota (2)

VERSE 4
Le''enya sil Getachin be''alem tengelata (2)

CHORUS
Be Gete Semani be-atakiltu bota (2)

VERSE 5
Le''enya sil Getachin be''alem tengelata (2)

CHORUS
Be Gete Semani be-atakiltu bota (2)

VERSE 6
Le''enya sil Getachin be''alem tengelata (2)

CHORUS
Be Gete Semani be-atakiltu bota (2)

VERSE 7
Le''enya sil Getachin be''alem tengelata (2)

CHORUS
Be Gete Semani be-atakiltu bota (2)

VERSE 8
Le''enya sil Getachin be''alem tengelata (2)

CHORUS
Be Gete Semani be-atakiltu bota (2)

VERSE 9
Le''enya sil Getachin be''alem tengelata (2)

CHORUS
Be Gete Semani be-atakiltu bota (2)

VERSE 10
Le''enya sil Getachin be''alem tengelata (2)

CHORUS
Be Gete Semani be-atakiltu bota (2)

VERSE 11
Le''enya sil Getachin be''alem tengelata (2)

CHORUS
Be Gete Semani be-atakiltu bota (2)

VERSE 12
Le''enya sil Getachin be''alem tengelata (2)

CHORUS
Be Gete Semani be-atakiltu bota (2)

VERSE 13
Le''enya sil Getachin be''alem tengelata (2)

CHORUS
Be Gete Semani be-atakiltu bota (2)

VERSE 14
Le''enya sil Getachin be''alem tengelata (2)

CHORUS
Be Gete Semani be-atakiltu bota (2)

VERSE 15
Le''enya sil Getachin be''alem tengelata (2)

CHORUS
Be Gete Semani be-atakiltu bota (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'be-gete-semani', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Beabate Bet (beabate-bet)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በአባቴ ቤት የጸኑትን አገልጋዮች አስታውሼ
በቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብሬ የምቆም እኔም እንደሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው

VERSE 1
ዕለት ዕለት እመጣለሁ አልቀረሁም ከደጃፍህ
ተመልስን እሰማለሁ አልነጠፈም ሁሌ ከአፍህ
አልፈራህም እንደድሮ መደንገጡ የለም ከእኔ
ከልሎኛል ግብዝነት አልታየኝም መባከኔ

VERSE 2
የተግባር ሰው ልሁን ጌታ ቅዱስ ቃልህን ልኑረው
በአንደበቴ ብቻ ሳይሆን በስራዬም ልመስክረው
የልጅነቴ አምላክ እርዳኝ በመንፈስህ እጆችህ ልቃኝ
በልቤ ደግሞ ልመለስ በልምድ መመላለስ ይብቃኝ

VERSE 3
የህይወት ምግብን አስጥሎ የእርያን ምግብ የሚያስመኝ
ይዞኛል ክፉ አባዜ ለከንቱ ነገር የሚያደክመኝ
በህይወቴ ያደረከውን ያንተን ፍቅር ልረዳው
ለደካማው እዘንልኝ አለማመኔን እርዳው',
      lyrics_transliteration = 'Beabate bet yets’enutn agelgayoch astawshe
Bebetu wist’ yet’efahut wede betu temelshe
Bekbre yemqom enem endesew
Tanashu lijh meche yihon wede libe mimelesew

VERSE 1
Elet elet emet’alehu alqerehum kedejafh
Temelsn esemalehu alnet’efem hule keafh
Alferahm endedro medenget’u yelem keene
Kellognal gibznet altayegnm mebakene

VERSE 2
Yetegbar sew lihun Geta Kidus qalhn linurew
Beandebete bicha sayhon besrayem limeskrew
Yeljnete amlak erdagn bemenfesh ejochh liqagn
Belbe degmo limeles belmd memelales yibqagn

VERSE 3
Yehywet migbn ast’lo yeeryan migb yemiyasmegn
Yizognal kifu abaze lekentu neger yemiyadekmegn
Behywete yaderekewn yanten fiqr liredaw
Ledekamaw ezenlgn alemamenen erdaw',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'beabate-bet'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በአባቴ ቤት የጸኑትን አገልጋዮች አስታውሼ
በቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብሬ የምቆም እኔም እንደሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው

VERSE 1
ዕለት ዕለት እመጣለሁ አልቀረሁም ከደጃፍህ
ተመልስን እሰማለሁ አልነጠፈም ሁሌ ከአፍህ
አልፈራህም እንደድሮ መደንገጡ የለም ከእኔ
ከልሎኛል ግብዝነት አልታየኝም መባከኔ

CHORUS
በአባቴ ቤት የጸኑትን አገልጋዮች አስታውሼ
በቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብሬ የምቆም እኔም እንደሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው

VERSE 2
የተግባር ሰው ልሁን ጌታ ቅዱስ ቃልህን ልኑረው
በአንደበቴ ብቻ ሳይሆን በስራዬም ልመስክረው
የልጅነቴ አምላክ እርዳኝ በመንፈስህ እጆችህ ልቃኝ
በልቤ ደግሞ ልመለስ በልምድ መመላለስ ይብቃኝ

CHORUS
በአባቴ ቤት የጸኑትን አገልጋዮች አስታውሼ
በቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብሬ የምቆም እኔም እንደሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው

VERSE 3
የህይወት ምግብን አስጥሎ የእርያን ምግብ የሚያስመኝ
ይዞኛል ክፉ አባዜ ለከንቱ ነገር የሚያደክመኝ
በህይወቴ ያደረከውን ያንተን ፍቅር ልረዳው
ለደካማው እዘንልኝ አለማመኔን እርዳው

CHORUS
በአባቴ ቤት የጸኑትን አገልጋዮች አስታውሼ
በቤቱ ውስጥ የጠፋሁት ወደ ቤቱ ተመልሼ
በክብሬ የምቆም እኔም እንደሰው
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beabate bet yets’enutn agelgayoch astawshe
Bebetu wist’ yet’efahut wede betu temelshe
Bekbre yemqom enem endesew
Tanashu lijh meche yihon wede libe mimelesew

VERSE 1
Elet elet emet’alehu alqerehum kedejafh
Temelsn esemalehu alnet’efem hule keafh
Alferahm endedro medenget’u yelem keene
Kellognal gibznet altayegnm mebakene

CHORUS
Beabate bet yets’enutn agelgayoch astawshe
Bebetu wist’ yet’efahut wede betu temelshe
Bekbre yemqom enem endesew
Tanashu lijh meche yihon wede libe mimelesew

VERSE 2
Yetegbar sew lihun Geta Kidus qalhn linurew
Beandebete bicha sayhon besrayem limeskrew
Yeljnete amlak erdagn bemenfesh ejochh liqagn
Belbe degmo limeles belmd memelales yibqagn

CHORUS
Beabate bet yets’enutn agelgayoch astawshe
Bebetu wist’ yet’efahut wede betu temelshe
Bekbre yemqom enem endesew
Tanashu lijh meche yihon wede libe mimelesew

VERSE 3
Yehywet migbn ast’lo yeeryan migb yemiyasmegn
Yizognal kifu abaze lekentu neger yemiyadekmegn
Behywete yaderekewn yanten fiqr liredaw
Ledekamaw ezenlgn alemamenen erdaw

CHORUS
Beabate bet yets’enutn agelgayoch astawshe
Bebetu wist’ yet’efahut wede betu temelshe
Bekbre yemqom enem endesew
Tanashu lijh meche yihon wede libe mimelesew'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'beabate-bet', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bealet Lay Newina (bealet-lay-newina)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)

VERSE 1
መንጋዋን ሊበትን ተኩላዉ ቢያበረታ
በዕበሉ መርከቧን ፍፁም ቢያንገላታ
የተቃወሟትን ሁሉን ድል ነስታለች
ዛሬም እንደፀሀይ ይኼዉ ታበራለች

VERSE 2
የቀርሎስ እናት ናት የድዮስቆሮስ
አኖሬዮስ እና የኔፉልጶስ
የወለተ ጴጥሮስ የክርስቶስ ሳምራ
የጴጥሮስ እናት ናት የነመስቀለ ክብር

VERSE 3
ኑፋቄ ቢነሳ ክህደቱ ቢነፍስ
ዙርያዋን ቢከባት ቅጥሯን ለማፍረስ
የፀና ነዉና በደም ተመስርቶ
ትረታለች እንጅ አትረታም ከቶ

VERSE 4
አእላፍ መላእክት ዙርያ ከበዋታል
አእላፍ ቅዱሳን ይፀልዩላታል
እኛ የማናዉቃቸዉ እሱ የሚያዉቃቸዉ
ለእሷ የሚሰሩ እጅግ ብዙ ነቸዉ',
      lyrics_transliteration = 'Beelet lay newuna yaqomat ats’nto
Bedemu newu ena yeqedesat wajto
Yit’ebqal ena t’ebaqwa tegto
Yegehanem dejoch aychlwatm keto (2)

VERSE 1
Mengawan libetn tekulawu biyabereta
Beebelu merkebwan fits’um biyangelata
Yeteqawemwatn hulun dil nestalech
Zarem endets’ehey yiኼwu taberalech

VERSE 2
Yeqerlos enat nat yedyosqoros
Anoreyos ena yenefulp’os
Yewelete p’et’ros yeKristos samra
Yep’et’ros enat nat yenemesqele kibir

VERSE 3
Nufaqe binesa kihdetu binefs
Zuryawan bikebat qit’rwan lemafres
Yets’ena newuna bedem temesrto
Tiretalech enj atretam keto

VERSE 4
Aelaf melaekt zurya kebewatal
Aelaf Kidusan yits’elyulatal
Egna yemanawuqachewu esu yemiyawuqachewu
Leeswa yemiseru ejg bizu nechewu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bealet-lay-newina'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)

VERSE 1
መንጋዋን ሊበትን ተኩላዉ ቢያበረታ
በዕበሉ መርከቧን ፍፁም ቢያንገላታ
የተቃወሟትን ሁሉን ድል ነስታለች
ዛሬም እንደፀሀይ ይኼዉ ታበራለች

CHORUS
በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)

VERSE 2
የቀርሎስ እናት ናት የድዮስቆሮስ
አኖሬዮስ እና የኔፉልጶስ
የወለተ ጴጥሮስ የክርስቶስ ሳምራ
የጴጥሮስ እናት ናት የነመስቀለ ክብር

CHORUS
በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)

VERSE 3
ኑፋቄ ቢነሳ ክህደቱ ቢነፍስ
ዙርያዋን ቢከባት ቅጥሯን ለማፍረስ
የፀና ነዉና በደም ተመስርቶ
ትረታለች እንጅ አትረታም ከቶ

CHORUS
በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)

VERSE 4
አእላፍ መላእክት ዙርያ ከበዋታል
አእላፍ ቅዱሳን ይፀልዩላታል
እኛ የማናዉቃቸዉ እሱ የሚያዉቃቸዉ
ለእሷ የሚሰሩ እጅግ ብዙ ነቸዉ

CHORUS
በዕለት ላይ ነዉና ያቆማት አጽንቶ
በደሙ ነዉ እና የቀደሳት ዋጅቶ
ይጠብቃል እና ጠባቅዋ ተግቶ
የገሃነም ደጆች አይችሏትም ከቶ(2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beelet lay newuna yaqomat ats’nto
Bedemu newu ena yeqedesat wajto
Yit’ebqal ena t’ebaqwa tegto
Yegehanem dejoch aychlwatm keto (2)

VERSE 1
Mengawan libetn tekulawu biyabereta
Beebelu merkebwan fits’um biyangelata
Yeteqawemwatn hulun dil nestalech
Zarem endets’ehey yiኼwu taberalech

CHORUS
Beelet lay newuna yaqomat ats’nto
Bedemu newu ena yeqedesat wajto
Yit’ebqal ena t’ebaqwa tegto
Yegehanem dejoch aychlwatm keto (2)

VERSE 2
Yeqerlos enat nat yedyosqoros
Anoreyos ena yenefulp’os
Yewelete p’et’ros yeKristos samra
Yep’et’ros enat nat yenemesqele kibir

CHORUS
Beelet lay newuna yaqomat ats’nto
Bedemu newu ena yeqedesat wajto
Yit’ebqal ena t’ebaqwa tegto
Yegehanem dejoch aychlwatm keto (2)

VERSE 3
Nufaqe binesa kihdetu binefs
Zuryawan bikebat qit’rwan lemafres
Yets’ena newuna bedem temesrto
Tiretalech enj atretam keto

CHORUS
Beelet lay newuna yaqomat ats’nto
Bedemu newu ena yeqedesat wajto
Yit’ebqal ena t’ebaqwa tegto
Yegehanem dejoch aychlwatm keto (2)

VERSE 4
Aelaf melaekt zurya kebewatal
Aelaf Kidusan yits’elyulatal
Egna yemanawuqachewu esu yemiyawuqachewu
Leeswa yemiseru ejg bizu nechewu

CHORUS
Beelet lay newuna yaqomat ats’nto
Bedemu newu ena yeqedesat wajto
Yit’ebqal ena t’ebaqwa tegto
Yegehanem dejoch aychlwatm keto (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bealet-lay-newina', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Beberet Yetegnaw (beberet-yetegnaw)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በበረት የተኛው ቅዱሱ ሕፃን
ልብስም አልለበሰም ነበረ ዕርቃኑን(፪×)
በጨርቅ ጠቅልላ ስታቅፈው እናቱ
ትንፋሽ አለበሱት ከብበው እንስሳቱ(፪×)

VERSE 1
እሰይ የምሥራች ሀሌ ሀሌ ሉያ
ጌታ ተወለደ ሊሆነን አርአያ(፪×)',
      lyrics_transliteration = 'Beberet yetegnaw qidusu hits’an
Libsm allebesem nebere erqanun(2×)
Bech’erq t’eqlla sitaqfew enatu
Tinfash alebesut kebbew enssatu(2×)

VERSE 1
Esey yemsrach hele hele luya
Geta tewelede lihonen araya(2×)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'beberet-yetegnaw'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በበረት የተኛው ቅዱሱ ሕፃን
ልብስም አልለበሰም ነበረ ዕርቃኑን(፪×)
በጨርቅ ጠቅልላ ስታቅፈው እናቱ
ትንፋሽ አለበሱት ከብበው እንስሳቱ(፪×)

VERSE 1
እሰይ የምሥራች ሀሌ ሀሌ ሉያ
ጌታ ተወለደ ሊሆነን አርአያ(፪×)

CHORUS
በበረት የተኛው ቅዱሱ ሕፃን
ልብስም አልለበሰም ነበረ ዕርቃኑን(፪×)
በጨርቅ ጠቅልላ ስታቅፈው እናቱ
ትንፋሽ አለበሱት ከብበው እንስሳቱ(፪×)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beberet yetegnaw qidusu hits’an
Libsm allebesem nebere erqanun(2×)
Bech’erq t’eqlla sitaqfew enatu
Tinfash alebesut kebbew enssatu(2×)

VERSE 1
Esey yemsrach hele hele luya
Geta tewelede lihonen araya(2×)

CHORUS
Beberet yetegnaw qidusu hits’an
Libsm allebesem nebere erqanun(2×)
Bech’erq t’eqlla sitaqfew enatu
Tinfash alebesut kebbew enssatu(2×)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'beberet-yetegnaw', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bebetelihem Tewelide (bebetelihem-tewelide)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በቤተልሔም ተወልደ/2/ አማኑኤል/2/
እምዘርዓ ዳዊት /4/ተወልደ አማኑኤል

VERSE 1
በቤተልሔም ተወልደ/2/ አማኑኤል/2/
እምዘርዓ ዳዊት /4/ተወልደ አማኑኤል',
      lyrics_transliteration = 'Bebetelhem tewelde (2) Amanuel (2)
Emzera dawit (4)tewelde Amanuel

VERSE 1
Bebetelhem tewelde (2) Amanuel (2)
Emzera dawit (4)tewelde Amanuel',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bebetelihem-tewelide'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በቤተልሔም ተወልደ/2/ አማኑኤል/2/
እምዘርዓ ዳዊት /4/ተወልደ አማኑኤል

VERSE 1
በቤተልሔም ተወልደ/2/ አማኑኤል/2/
እምዘርዓ ዳዊት /4/ተወልደ አማኑኤል

CHORUS
በቤተልሔም ተወልደ/2/ አማኑኤል/2/
እምዘርዓ ዳዊት /4/ተወልደ አማኑኤል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bebetelhem tewelde (2) Amanuel (2)
Emzera dawit (4)tewelde Amanuel

VERSE 1
Bebetelhem tewelde (2) Amanuel (2)
Emzera dawit (4)tewelde Amanuel

CHORUS
Bebetelhem tewelde (2) Amanuel (2)
Emzera dawit (4)tewelde Amanuel'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bebetelihem-tewelide', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Becherinet (becherinet)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 1
ላያድን ላይፈውስ ጽድቃችን
ተጥለን ስንኖር በሞት
በደምህ ወጣን አርነት
በደምህ ወጣን ነጻነት

VERSE 2
የጭንቀት የመከራ አመት
ተረሳ በኢየሱስ ሞት
በፍጹም ፍቅሩ ወደደን
በሞቱ ከሞት አዳነን

VERSE 3
ህዝቡን ሲያስጨንቅ የነበረ
የጠላት ክንዱ ተሰበረ
ማልቀስ ቀረልን መቅበዝበዝ
ገነት ገብተናል በእርሱ ወዝ

VERSE 4
ገነትን ወረስን በእርሱ ወዝ
ሰማይና ምድር ተስማሙ
ታጥበዋልና በደሙ
ነፃነት አዋጅ ተሰማ

VERSE 5
አዜምን የጽድቁን ዜማ
ዘመርን የጽድቅ ዜማ',
      lyrics_transliteration = 'Bechernet beyqrtaw aseben
Befqruna bemhretu gobegnen
Amlakachn bemotu wededen
Tenet’qo selam ereftachn

VERSE 1
Layadn layfews ts’dqachn
Tet’len sinnor bemot
Bedemh wet’an arnet
Bedemh wet’an nets’anet

VERSE 2
Yech’nqet yemekera amet
Teresa beiyesus mot
Befts’um fiqru wededen
Bemotu kemot adanen

VERSE 3
Hizbun siyasch’enq yenebere
Yet’elat kindu tesebere
Malqes qereln meqbezbez
Genet gebtenal beersu wez

VERSE 4
Genetn weresn beersu wez
Semayna midr tesmamu
Tat’bewalna bedemu
Nets’anet awaj tesema

VERSE 5
Azemn yets’dqun zema
Zemern yets’dq zema',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'becherinet'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 1
ላያድን ላይፈውስ ጽድቃችን
ተጥለን ስንኖር በሞት
በደምህ ወጣን አርነት
በደምህ ወጣን ነጻነት

CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 2
የጭንቀት የመከራ አመት
ተረሳ በኢየሱስ ሞት
በፍጹም ፍቅሩ ወደደን
በሞቱ ከሞት አዳነን

CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 3
ህዝቡን ሲያስጨንቅ የነበረ
የጠላት ክንዱ ተሰበረ
ማልቀስ ቀረልን መቅበዝበዝ
ገነት ገብተናል በእርሱ ወዝ

CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 4
ገነትን ወረስን በእርሱ ወዝ
ሰማይና ምድር ተስማሙ
ታጥበዋልና በደሙ
ነፃነት አዋጅ ተሰማ

CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 5
አዜምን የጽድቁን ዜማ
ዘመርን የጽድቅ ዜማ

CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bechernet beyqrtaw aseben
Befqruna bemhretu gobegnen
Amlakachn bemotu wededen
Tenet’qo selam ereftachn

VERSE 1
Layadn layfews ts’dqachn
Tet’len sinnor bemot
Bedemh wet’an arnet
Bedemh wet’an nets’anet

CHORUS
Bechernet beyqrtaw aseben
Befqruna bemhretu gobegnen
Amlakachn bemotu wededen
Tenet’qo selam ereftachn

VERSE 2
Yech’nqet yemekera amet
Teresa beiyesus mot
Befts’um fiqru wededen
Bemotu kemot adanen

CHORUS
Bechernet beyqrtaw aseben
Befqruna bemhretu gobegnen
Amlakachn bemotu wededen
Tenet’qo selam ereftachn

VERSE 3
Hizbun siyasch’enq yenebere
Yet’elat kindu tesebere
Malqes qereln meqbezbez
Genet gebtenal beersu wez

CHORUS
Bechernet beyqrtaw aseben
Befqruna bemhretu gobegnen
Amlakachn bemotu wededen
Tenet’qo selam ereftachn

VERSE 4
Genetn weresn beersu wez
Semayna midr tesmamu
Tat’bewalna bedemu
Nets’anet awaj tesema

CHORUS
Bechernet beyqrtaw aseben
Befqruna bemhretu gobegnen
Amlakachn bemotu wededen
Tenet’qo selam ereftachn

VERSE 5
Azemn yets’dqun zema
Zemern yets’dq zema

CHORUS
Bechernet beyqrtaw aseben
Befqruna bemhretu gobegnen
Amlakachn bemotu wededen
Tenet’qo selam ereftachn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'becherinet', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bedeliku Endegena Deacon Bisrat Teshome (bedeliku-endegena-deacon-bisrat-teshome)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 1
ይነጋል ይመሻል√ ቀንና ሌሊቱ
አንተ ስትቀድሰኝ እኔ ስሆን ከንቱ
ልቤ ልብን አጣ√ ከክብር አነሰ
በ1 እግሩ ሲራመድ√ በ1ዱ እያነከሰ።

VERSE 2
አንተን ለመውደድ ፍፁም ዘገየው
ከንቱውን አለም√ እየተመኘው
ትላንቴን አድሰህ ዛሬን ስትቸረኝ
ይኽው እንደገና ሀጥያት ሰበረኝ

VERSE 3
ማዕበሉን እዘዘው ከሞት አስመልጠኝ
ሰጥሜ እንዳልቀር በፍቅርህ ለውጠኝ
አንተን ለመውደድ ፍፁም ዘገየው
ከንቱውን አለም እየተመኘው

VERSE 4
በህግህ ባልጓዝ ብቀል በሚዛንህ
ያስቀመጥከኝ ቦታ ባልገኝ በቃልህ
ታገስከኝ አባቴ ምክርህን ስረሳ
ምረኽ ያስጣልከኝን መልሼ ሳነሳ

VERSE 5
አንተን ለመውደድ ፍፁም ዘገየው
ከንቱውን አለም እየተመኘው',
      lyrics_transliteration = 'Getaye yiqr bitlgn hulun tewkna
Amlake kenebedele wededkegnna
Satt’egb nefse kefqrh mena
Jember satt’elq bedelku endegena

VERSE 1
Yinegal yimeshal√ qenna lelitu
Ante sitqedsegn ene sihon kentu
Libe libn at’a√ kekbr anese
Be1 egru siramed√ be1du eyanekese.

VERSE 2
Anten lemewded fits’um zegeyew
Kentuwn alem√ eyetemegnew
Tilanten adseh zaren sitcheregn
Yiኽw endegena het’yat seberegn

VERSE 3
Maebelun ezezew kemot asmelt’egn
Set’me endalqer befqrh lewt’egn
Anten lemewded fits’um zegeyew
Kentuwn alem eyetemegnew

VERSE 4
Behgh balgwaz biqel bemizanh
Yasqemet’kegn bota balgegn beqalh
Tageskegn abate mikrhn siresa
Mireኽ yast’alkegnn melshe sanesa

VERSE 5
Anten lemewded fits’um zegeyew
Kentuwn alem eyetemegnew',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bedeliku-endegena-deacon-bisrat-teshome'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 1
ይነጋል ይመሻል√ ቀንና ሌሊቱ
አንተ ስትቀድሰኝ እኔ ስሆን ከንቱ
ልቤ ልብን አጣ√ ከክብር አነሰ
በ1 እግሩ ሲራመድ√ በ1ዱ እያነከሰ።

CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 2
አንተን ለመውደድ ፍፁም ዘገየው
ከንቱውን አለም√ እየተመኘው
ትላንቴን አድሰህ ዛሬን ስትቸረኝ
ይኽው እንደገና ሀጥያት ሰበረኝ

CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 3
ማዕበሉን እዘዘው ከሞት አስመልጠኝ
ሰጥሜ እንዳልቀር በፍቅርህ ለውጠኝ
አንተን ለመውደድ ፍፁም ዘገየው
ከንቱውን አለም እየተመኘው

CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 4
በህግህ ባልጓዝ ብቀል በሚዛንህ
ያስቀመጥከኝ ቦታ ባልገኝ በቃልህ
ታገስከኝ አባቴ ምክርህን ስረሳ
ምረኽ ያስጣልከኝን መልሼ ሳነሳ

CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና

VERSE 5
አንተን ለመውደድ ፍፁም ዘገየው
ከንቱውን አለም እየተመኘው

CHORUS
ጌታዬ ይቅር ብትልኝ ሁሉን ተውክና
አምላኬ ከነበደሌ ወደድከኝና
ሳትጠግብ ነፍሴ ከፍቅርህ መና
ጀምበር ሳትጠልቅ በደልኩ እንደገና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Getaye yiqr bitlgn hulun tewkna
Amlake kenebedele wededkegnna
Satt’egb nefse kefqrh mena
Jember satt’elq bedelku endegena

VERSE 1
Yinegal yimeshal√ qenna lelitu
Ante sitqedsegn ene sihon kentu
Libe libn at’a√ kekbr anese
Be1 egru siramed√ be1du eyanekese.

CHORUS
Getaye yiqr bitlgn hulun tewkna
Amlake kenebedele wededkegnna
Satt’egb nefse kefqrh mena
Jember satt’elq bedelku endegena

VERSE 2
Anten lemewded fits’um zegeyew
Kentuwn alem√ eyetemegnew
Tilanten adseh zaren sitcheregn
Yiኽw endegena het’yat seberegn

CHORUS
Getaye yiqr bitlgn hulun tewkna
Amlake kenebedele wededkegnna
Satt’egb nefse kefqrh mena
Jember satt’elq bedelku endegena

VERSE 3
Maebelun ezezew kemot asmelt’egn
Set’me endalqer befqrh lewt’egn
Anten lemewded fits’um zegeyew
Kentuwn alem eyetemegnew

CHORUS
Getaye yiqr bitlgn hulun tewkna
Amlake kenebedele wededkegnna
Satt’egb nefse kefqrh mena
Jember satt’elq bedelku endegena

VERSE 4
Behgh balgwaz biqel bemizanh
Yasqemet’kegn bota balgegn beqalh
Tageskegn abate mikrhn siresa
Mireኽ yast’alkegnn melshe sanesa

CHORUS
Getaye yiqr bitlgn hulun tewkna
Amlake kenebedele wededkegnna
Satt’egb nefse kefqrh mena
Jember satt’elq bedelku endegena

VERSE 5
Anten lemewded fits’um zegeyew
Kentuwn alem eyetemegnew

CHORUS
Getaye yiqr bitlgn hulun tewkna
Amlake kenebedele wededkegnna
Satt’egb nefse kefqrh mena
Jember satt’elq bedelku endegena'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bedeliku-endegena-deacon-bisrat-teshome', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Beegiziabiher Asab Yeteserach Emebetachin Menifesawit (beegiziabiher-asab-yeteserach-emebetachin-menifesawit)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 1
ምክንያተ ድህነት አንቺ በመሆንሽ
የሲኦል ደጆችን ታንቀጠቅጪያለሽ
በአንቺ የተደረገው ይህ ታላቅ ምስጥር
አድርጎታልና ሰይጣንን እንዲያፍር

VERSE 2
ስለሰዎች ፍቅር ልቦናሽ ያስባል
ዓለምን ለማዳን አጅሽ ይዘረጋል
በሲኦል አንድ ሰው እንዳይቀር በስቃይ
ለምሕረት ይዘርጋ እጅሽ ወደሰማይ

VERSE 3
የሲኦል እሳቱን ስቃዩን አያየሽ
ለፍጥረታት ሁሉ ድንግል ሆይ ታዝኛለሽ
በአይነ ምህረቱ እንዲያየን ክርስቶስ
ለምኝልን ማርያም ፍጥረት እንዲቀደስ

VERSE 4
እንደሚነገረው በአበው አንደበት
እኛም እንደምናውቅ ስንኖር በሕይወት
ወላዲተ አምላክ ሩኅሩኅ ፍጥረት ናት
ምሕረት የምትለምን ዘወትር ሳትታክት

VERSE 5
በአግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት',
      lyrics_transliteration = 'Ente behlina Egziabher tegebret (2)
Menfesawit yieti Maryam
BeEgziabher hasab yeteserach (2)
Emebetachen menfesawit

VERSE 1
Miknyate dihnet anchi bemehonsh
Yesiol dejochn tanqet’eqch’iyalesh
Beanchi yetederegew yih talaq mist’r
Adrgotalna seyt’ann endiyafr

VERSE 2
Silesewoch fiqr libonash yasbal
Alemn lemadan ajsh yizeregal
Besiol and sew endayqer besqay
Lemhret yizerga ejsh wedesemay

VERSE 3
Yesiol esatun siqayun ayayesh
Left’retat hulu Dingil hoy tazgnalesh
Beayne mihretu endiyayen Kristos
Lemgnln Maryam fit’ret endiqedes

VERSE 4
Endeminegerew beabew andebet
Egnam endemnawq sinnor behywet
Weladite amlak ruhruh fit’ret nat
Mihret yemtlemn zewetr sattakt

VERSE 5
Beagziabher hasab yeteserach (2)
Emebetachen menfesawit',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'beegiziabiher-asab-yeteserach-emebetachin-menifesawit'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 1
ምክንያተ ድህነት አንቺ በመሆንሽ
የሲኦል ደጆችን ታንቀጠቅጪያለሽ
በአንቺ የተደረገው ይህ ታላቅ ምስጥር
አድርጎታልና ሰይጣንን እንዲያፍር

CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 2
ስለሰዎች ፍቅር ልቦናሽ ያስባል
ዓለምን ለማዳን አጅሽ ይዘረጋል
በሲኦል አንድ ሰው እንዳይቀር በስቃይ
ለምሕረት ይዘርጋ እጅሽ ወደሰማይ

CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 3
የሲኦል እሳቱን ስቃዩን አያየሽ
ለፍጥረታት ሁሉ ድንግል ሆይ ታዝኛለሽ
በአይነ ምህረቱ እንዲያየን ክርስቶስ
ለምኝልን ማርያም ፍጥረት እንዲቀደስ

CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 4
እንደሚነገረው በአበው አንደበት
እኛም እንደምናውቅ ስንኖር በሕይወት
ወላዲተ አምላክ ሩኅሩኅ ፍጥረት ናት
ምሕረት የምትለምን ዘወትር ሳትታክት

CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

VERSE 5
በአግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት

CHORUS
እንተ በህሊና እግዚአብሔር ተገብረት(፪)
መንፈሳዊት ይእቲ ማርያም
በእግዚአብሔር ሃሳብ የተሰራች(፪)
እመቤታችን መንፈሳዊት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ente behlina Egziabher tegebret (2)
Menfesawit yieti Maryam
BeEgziabher hasab yeteserach (2)
Emebetachen menfesawit

VERSE 1
Miknyate dihnet anchi bemehonsh
Yesiol dejochn tanqet’eqch’iyalesh
Beanchi yetederegew yih talaq mist’r
Adrgotalna seyt’ann endiyafr

CHORUS
Ente behlina Egziabher tegebret (2)
Menfesawit yieti Maryam
BeEgziabher hasab yeteserach (2)
Emebetachen menfesawit

VERSE 2
Silesewoch fiqr libonash yasbal
Alemn lemadan ajsh yizeregal
Besiol and sew endayqer besqay
Lemhret yizerga ejsh wedesemay

CHORUS
Ente behlina Egziabher tegebret (2)
Menfesawit yieti Maryam
BeEgziabher hasab yeteserach (2)
Emebetachen menfesawit

VERSE 3
Yesiol esatun siqayun ayayesh
Left’retat hulu Dingil hoy tazgnalesh
Beayne mihretu endiyayen Kristos
Lemgnln Maryam fit’ret endiqedes

CHORUS
Ente behlina Egziabher tegebret (2)
Menfesawit yieti Maryam
BeEgziabher hasab yeteserach (2)
Emebetachen menfesawit

VERSE 4
Endeminegerew beabew andebet
Egnam endemnawq sinnor behywet
Weladite amlak ruhruh fit’ret nat
Mihret yemtlemn zewetr sattakt

CHORUS
Ente behlina Egziabher tegebret (2)
Menfesawit yieti Maryam
BeEgziabher hasab yeteserach (2)
Emebetachen menfesawit

VERSE 5
Beagziabher hasab yeteserach (2)
Emebetachen menfesawit

CHORUS
Ente behlina Egziabher tegebret (2)
Menfesawit yieti Maryam
BeEgziabher hasab yeteserach (2)
Emebetachen menfesawit'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'beegiziabiher-asab-yeteserach-emebetachin-menifesawit', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Beegiziabiherina Besew (beegiziabiherina-besew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 1
በምድር ተገልጦ የሰማዩን እዉነት የነገረን
ከፍ ከፍ ያለ ሊቀ ካህናት በሰማያት አለን
ከሀጥያት በቀር በነገሮች ሁሉ የተፈተኖ
አልፎ የገባ ወዳጅ አለን ተቀዳሚ ሆኖ

VERSE 2
የታረደ በግ ሕያው መስዋዕት
መስዋዕት አቅራቢ ሊቀ ካህናት
መስዋዕት ተቀባይ ሃያል አምላክ
ለዘለዓለም የሚመለክ

VERSE 3
ወንድሞች ብሎ እንዲጠራን የማያፍርብን
በድካማችን የሚራራ ሊቀ ካህን አለን
ከዘላለም ሞት ያስመለጠን ባፈሰሰው ደም
ስሙ ይቀደስ ፋሲካችን መድኃኔዓለም

VERSE 4
የታረደ በግ ሕያው መስዋዕት
መስዋዕት አቅራቢ ሊቀ ካህናት
መስዋዕት ተቀባይ ሃያል አምላክ
ለዘለዓለም የሚመለክ

VERSE 5
ፅድቅ ሊሆነን ስላልቻለ የራሳችን ፅድቅ
በመስቀል ዋለ ከአባቱ ጋር እኛን ሊያስታርቅ
ሞትን ድል አርጎ በግርማው ቀኝ ያለው በመንግስቱ
የቀደመልን ስሙ ይክበር ሊቀ ካህናቱ

VERSE 6
የታረደ በግ ሕያው መስዋዕት
መስዋዕት አቅራቢ ሊቀ ካህናት
መስዋዕት ተቀባይ ሃያል አምላክ
ለዘለዓለም የሚመለክ

VERSE 7
እንደ ኢየሱስ ያለ ወዴት አለ በሰማይ በምድር
በደሙ የናደ ያፈረሰ የጠላትን ምክር
ይህንን እዉነት እንዳናቀል ፀጋው ትደግፈን
የልቦናችን አይን ይብራ ማዳኑ እንዳታልፈን

VERSE 8
የታረደ በግ ሕያው መስዋዕት
መስዋዕት አቅራቢ ሊቀ ካህናት
መስዋዕት ተቀባይ ሃያል አምላክ
ለዘለዓለም የሚመለክ',
      lyrics_transliteration = 'Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 1
Bemdr tegelt’o yesemayun ewunet yenegeren
Kef kef yale liqe kahnat besemayat alen
Kehet’yat beqer benegeroch hulu yetefeteno
Alfo yegeba wedaj alen teqedami hono

VERSE 2
Yetarede beg hiyaw meswaet
Meswaet aqrabi liqe kahnat
Meswaet teqebay hayal amlak
Lezelealem yemimelek

VERSE 3
Wendmoch bilo endit’eran yemayafrbn
Bedkamachn yemirara liqe kahn alen
Kezelalem mot yasmelet’en bafesesew dem
Simu yiqedes fasikachn Medhanealem

VERSE 4
Yetarede beg hiyaw meswaet
Meswaet aqrabi liqe kahnat
Meswaet teqebay hayal amlak
Lezelealem yemimelek

VERSE 5
Ts’dq lihonen silalchale yerasachn ts’dq
Bemesqel wale keabatu gar egnan liyastarq
Motn dil argo begrmaw qegn yalew bemengstu
Yeqedemeln simu yikber liqe kahnatu

VERSE 6
Yetarede beg hiyaw meswaet
Meswaet aqrabi liqe kahnat
Meswaet teqebay hayal amlak
Lezelealem yemimelek

VERSE 7
Ende Iyesus yale wedet ale besemay bemdr
Bedemu yenade yaferese yet’elatn mikr
Yihnn ewunet endanaqel ts’egaw tidegfen
Yelbonachn ayn yibra madanu endatalfen

VERSE 8
Yetarede beg hiyaw meswaet
Meswaet aqrabi liqe kahnat
Meswaet teqebay hayal amlak
Lezelealem yemimelek',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'beegiziabiherina-besew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 1
በምድር ተገልጦ የሰማዩን እዉነት የነገረን
ከፍ ከፍ ያለ ሊቀ ካህናት በሰማያት አለን
ከሀጥያት በቀር በነገሮች ሁሉ የተፈተኖ
አልፎ የገባ ወዳጅ አለን ተቀዳሚ ሆኖ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 2
የታረደ በግ ሕያው መስዋዕት
መስዋዕት አቅራቢ ሊቀ ካህናት
መስዋዕት ተቀባይ ሃያል አምላክ
ለዘለዓለም የሚመለክ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 3
ወንድሞች ብሎ እንዲጠራን የማያፍርብን
በድካማችን የሚራራ ሊቀ ካህን አለን
ከዘላለም ሞት ያስመለጠን ባፈሰሰው ደም
ስሙ ይቀደስ ፋሲካችን መድኃኔዓለም

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 4
የታረደ በግ ሕያው መስዋዕት
መስዋዕት አቅራቢ ሊቀ ካህናት
መስዋዕት ተቀባይ ሃያል አምላክ
ለዘለዓለም የሚመለክ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 5
ፅድቅ ሊሆነን ስላልቻለ የራሳችን ፅድቅ
በመስቀል ዋለ ከአባቱ ጋር እኛን ሊያስታርቅ
ሞትን ድል አርጎ በግርማው ቀኝ ያለው በመንግስቱ
የቀደመልን ስሙ ይክበር ሊቀ ካህናቱ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 6
የታረደ በግ ሕያው መስዋዕት
መስዋዕት አቅራቢ ሊቀ ካህናት
መስዋዕት ተቀባይ ሃያል አምላክ
ለዘለዓለም የሚመለክ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 7
እንደ ኢየሱስ ያለ ወዴት አለ በሰማይ በምድር
በደሙ የናደ ያፈረሰ የጠላትን ምክር
ይህንን እዉነት እንዳናቀል ፀጋው ትደግፈን
የልቦናችን አይን ይብራ ማዳኑ እንዳታልፈን

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው

VERSE 8
የታረደ በግ ሕያው መስዋዕት
መስዋዕት አቅራቢ ሊቀ ካህናት
መስዋዕት ተቀባይ ሃያል አምላክ
ለዘለዓለም የሚመለክ

CHORUS
በእግዚአብሔርና በሰው
መካከል ያለው
ደግሞ ሰው የሆነው
ክርስቶስ ኢየሱስ ነው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 1
Bemdr tegelt’o yesemayun ewunet yenegeren
Kef kef yale liqe kahnat besemayat alen
Kehet’yat beqer benegeroch hulu yetefeteno
Alfo yegeba wedaj alen teqedami hono

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 2
Yetarede beg hiyaw meswaet
Meswaet aqrabi liqe kahnat
Meswaet teqebay hayal amlak
Lezelealem yemimelek

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 3
Wendmoch bilo endit’eran yemayafrbn
Bedkamachn yemirara liqe kahn alen
Kezelalem mot yasmelet’en bafesesew dem
Simu yiqedes fasikachn Medhanealem

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 4
Yetarede beg hiyaw meswaet
Meswaet aqrabi liqe kahnat
Meswaet teqebay hayal amlak
Lezelealem yemimelek

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 5
Ts’dq lihonen silalchale yerasachn ts’dq
Bemesqel wale keabatu gar egnan liyastarq
Motn dil argo begrmaw qegn yalew bemengstu
Yeqedemeln simu yikber liqe kahnatu

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 6
Yetarede beg hiyaw meswaet
Meswaet aqrabi liqe kahnat
Meswaet teqebay hayal amlak
Lezelealem yemimelek

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 7
Ende Iyesus yale wedet ale besemay bemdr
Bedemu yenade yaferese yet’elatn mikr
Yihnn ewunet endanaqel ts’egaw tidegfen
Yelbonachn ayn yibra madanu endatalfen

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new

VERSE 8
Yetarede beg hiyaw meswaet
Meswaet aqrabi liqe kahnat
Meswaet teqebay hayal amlak
Lezelealem yemimelek

CHORUS
Beegziabherna besew
Mekakel yalew
Degmo sew yehonew
Kristos Iyesus new'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'beegiziabiherina-besew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Beekifish Dinigil (beekifish-dinigil)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 1
ገና ከህፃንነት ስወጣ ከማህፀን
ስምሽ የተፃፈው ከአንደበቴ ማዕዘን
በኮልታፋ ቃላት ስጠራሽ አድጌ
ዛሬም ይኸው አለኹ ላንቺ አደግድጌ

VERSE 2
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ
በቀን በጨለማ ስምሽ ያፅናናኛል
ከመከራ እንዳልፍ ብርታቴ ሆኖኛል

VERSE 3
ሞገስ ነሽ ማርያም ሁሌ በሄድኩበት
ሳልጠራሽ አይመሽም ድንግል የልቤ እረፍት
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 4
አንቺን እናት አርጎ ለሰጠኝ ፈጣሪ
ልጅነቴን ባርኮ ላቆመኝ መሐሪ
አንደበት ሆነሽኝ ውዳሴን ላስማማ
ቸርነቱን አየሁ ድምፅሽን ስሰማ

VERSE 5
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ',
      lyrics_transliteration = 'Emebete hoy simshn sasb des yilegnal
Maryam hoy widaseshn saders des yilegnal
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

VERSE 1
Gena kehts’annet siwet’a kemahts’en
Simsh yetets’afew keandebete maezen
Bekoltafa qalat sit’erash adge
Zarem yiኸw aleኹ lanchi adegdge

VERSE 2
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu
Beqen bech’elema simsh yats’nanagnal
Kemekera endalf birtate honognal

VERSE 3
Moges nesh Maryam hule behedkubet
Salt’erash aymeshm Dingil yelbe ereft
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

VERSE 4
Anchin enat argo leset’egn fet’ari
Lijneten barko laqomegn meheri
Andebet honeshgn widasen lasmama
Chernetun ayehu dimts’shn sisema

VERSE 5
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'beekifish-dinigil'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 1
ገና ከህፃንነት ስወጣ ከማህፀን
ስምሽ የተፃፈው ከአንደበቴ ማዕዘን
በኮልታፋ ቃላት ስጠራሽ አድጌ
ዛሬም ይኸው አለኹ ላንቺ አደግድጌ

CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 2
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ
በቀን በጨለማ ስምሽ ያፅናናኛል
ከመከራ እንዳልፍ ብርታቴ ሆኖኛል

CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 3
ሞገስ ነሽ ማርያም ሁሌ በሄድኩበት
ሳልጠራሽ አይመሽም ድንግል የልቤ እረፍት
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 4
አንቺን እናት አርጎ ለሰጠኝ ፈጣሪ
ልጅነቴን ባርኮ ላቆመኝ መሐሪ
አንደበት ሆነሽኝ ውዳሴን ላስማማ
ቸርነቱን አየሁ ድምፅሽን ስሰማ

CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

VERSE 5
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ

CHORUS
እመቤቴ ሆይ ስምሽን ሳስብ ደስ ይለኛል
ማርያም ሆይ ውዳሴሽን ሳደርስ ደስ ይለኛል
በእቅፍሽ ድንግል እፅናናለሁ
ከፅኑ ድካሜ እበረታታለሁ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emebete hoy simshn sasb des yilegnal
Maryam hoy widaseshn saders des yilegnal
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

VERSE 1
Gena kehts’annet siwet’a kemahts’en
Simsh yetets’afew keandebete maezen
Bekoltafa qalat sit’erash adge
Zarem yiኸw aleኹ lanchi adegdge

CHORUS
Emebete hoy simshn sasb des yilegnal
Maryam hoy widaseshn saders des yilegnal
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

VERSE 2
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu
Beqen bech’elema simsh yats’nanagnal
Kemekera endalf birtate honognal

CHORUS
Emebete hoy simshn sasb des yilegnal
Maryam hoy widaseshn saders des yilegnal
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

VERSE 3
Moges nesh Maryam hule behedkubet
Salt’erash aymeshm Dingil yelbe ereft
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

CHORUS
Emebete hoy simshn sasb des yilegnal
Maryam hoy widaseshn saders des yilegnal
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

VERSE 4
Anchin enat argo leset’egn fet’ari
Lijneten barko laqomegn meheri
Andebet honeshgn widasen lasmama
Chernetun ayehu dimts’shn sisema

CHORUS
Emebete hoy simshn sasb des yilegnal
Maryam hoy widaseshn saders des yilegnal
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

VERSE 5
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu

CHORUS
Emebete hoy simshn sasb des yilegnal
Maryam hoy widaseshn saders des yilegnal
Beeqfsh Dingil ets’nanalehu
Kets’nu dikame eberetatalehu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'beekifish-dinigil', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Beene Bitekur Semay (beene-bitekur-semay)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በእኔ ቢጠቁርም ሰማይ፤
በእኔ ቢጠልቅም ፀሀይ፤
በነፋሳት የማይጠፋ ፋኖሴ፤
ኢየሱስ ነዉ የመኖር እስትንፋሴ፤

VERSE 1
እርሱን ታምኜ እወጣለሁ እርሱን ታምኜ እገባለሁ፤
ድብቅ ሰራዊት አለው ለእኔ የሚጠብቀኝ በዘመኔ፤
እግዚአብሔር ለእኔ ብርሀኔ ነዉ፤
የሚያስደነግጠኝ የሚያስፈራኝ ማነዉ፤

VERSE 2
ሰዉ አልባ ሆኜ በስደት፤ወዳጅ የሆነኝ የእኔ አባት፤
ክርስቶስ ለእኔ ህይወቴ ነዉ፤ እርሱን አምኜ እኖራለሁ፤
የለም የሚያስፈራኝ በዘመኔ፤
ብርሀን ነዉና እግዚአብሔር ለእኔ፤

VERSE 3
መች ይሰጠኛል ለጠላት፤አይሰለጥንም በእኔ ሞት፤
የሚጠብቀኝ ጌታ ነዉ፤የትኛው ጠላት ሊደፍረዉ፤
በቤቴ መቃን ላይ ደም ይታያል፤እኔን ከእግዚአብሔር ከቶ ማን ይለያል፤
ይኸው አቆመኝ በመቅደሱ፤ እየጠበቀ በመንፈሱ፤

VERSE 4
እኔን ሊያከብር ራሱን ሰጥቶ።፤ገዝቶኛል ጌታ ሞቴን ሞቶ፤
ይገዛ ለስሙ ስጋ መንፈሴ፤ በእርሱ ነዉና ለዛሬ መድረሴ፤
በእኔ ቢጠቁርም ሰማይ፤
በእኔ ቢጠልቅም ፀሀይ፤

VERSE 5
በነፋሳት የማይጠፋ ፋኖሴ፤
ኢየሱስ ነዉ የመኖር እስትንፋሴ . . .',
      lyrics_transliteration = 'Beene bit’equrm semay;
Beene bit’elqm ts’ehey;
Benefasat yemayt’efa fanose;
Iyesus newu yemenor estnfase;

VERSE 1
Ersun tamgne ewet’alehu ersun tamgne egebalehu;
Dibq serawit alew leene yemit’ebqegn bezemene;
Egziabher leene birhene newu;
Yemiyasdenegt’egn yemiyasferagn manewu;

VERSE 2
Sewu alba hogne besdet;wedaj yehonegn yeene abat;
Kristos leene hiywete newu; ersun amgne enoralehu;
Yelem yemiyasferagn bezemene;
Birhen newuna Egziabher leene;

VERSE 3
Mech yiset’egnal let’elat;ayselet’nm beene mot;
Yemit’ebqegn Geta newu;yetgnaw t’elat lidefrewu;
Bebete meqan lay dem yitayal;enen keegziabher keto man yileyal;
Yiኸw aqomegn bemeqdesu; eyet’ebeqe bemenfesu;

VERSE 4
Enen liyakebr rasun set’to.;geztognal Geta moten moto;
Yigeza lesmu siga menfese; beersu newuna lezare medrese;
Beene bit’equrm semay;
Beene bit’elqm ts’ehey;

VERSE 5
Benefasat yemayt’efa fanose;
Iyesus newu yemenor estnfase . . .',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'beene-bitekur-semay'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በእኔ ቢጠቁርም ሰማይ፤
በእኔ ቢጠልቅም ፀሀይ፤
በነፋሳት የማይጠፋ ፋኖሴ፤
ኢየሱስ ነዉ የመኖር እስትንፋሴ፤

VERSE 1
እርሱን ታምኜ እወጣለሁ እርሱን ታምኜ እገባለሁ፤
ድብቅ ሰራዊት አለው ለእኔ የሚጠብቀኝ በዘመኔ፤
እግዚአብሔር ለእኔ ብርሀኔ ነዉ፤
የሚያስደነግጠኝ የሚያስፈራኝ ማነዉ፤

CHORUS
በእኔ ቢጠቁርም ሰማይ፤
በእኔ ቢጠልቅም ፀሀይ፤
በነፋሳት የማይጠፋ ፋኖሴ፤
ኢየሱስ ነዉ የመኖር እስትንፋሴ፤

VERSE 2
ሰዉ አልባ ሆኜ በስደት፤ወዳጅ የሆነኝ የእኔ አባት፤
ክርስቶስ ለእኔ ህይወቴ ነዉ፤ እርሱን አምኜ እኖራለሁ፤
የለም የሚያስፈራኝ በዘመኔ፤
ብርሀን ነዉና እግዚአብሔር ለእኔ፤

CHORUS
በእኔ ቢጠቁርም ሰማይ፤
በእኔ ቢጠልቅም ፀሀይ፤
በነፋሳት የማይጠፋ ፋኖሴ፤
ኢየሱስ ነዉ የመኖር እስትንፋሴ፤

VERSE 3
መች ይሰጠኛል ለጠላት፤አይሰለጥንም በእኔ ሞት፤
የሚጠብቀኝ ጌታ ነዉ፤የትኛው ጠላት ሊደፍረዉ፤
በቤቴ መቃን ላይ ደም ይታያል፤እኔን ከእግዚአብሔር ከቶ ማን ይለያል፤
ይኸው አቆመኝ በመቅደሱ፤ እየጠበቀ በመንፈሱ፤

CHORUS
በእኔ ቢጠቁርም ሰማይ፤
በእኔ ቢጠልቅም ፀሀይ፤
በነፋሳት የማይጠፋ ፋኖሴ፤
ኢየሱስ ነዉ የመኖር እስትንፋሴ፤

VERSE 4
እኔን ሊያከብር ራሱን ሰጥቶ።፤ገዝቶኛል ጌታ ሞቴን ሞቶ፤
ይገዛ ለስሙ ስጋ መንፈሴ፤ በእርሱ ነዉና ለዛሬ መድረሴ፤
በእኔ ቢጠቁርም ሰማይ፤
በእኔ ቢጠልቅም ፀሀይ፤

CHORUS
በእኔ ቢጠቁርም ሰማይ፤
በእኔ ቢጠልቅም ፀሀይ፤
በነፋሳት የማይጠፋ ፋኖሴ፤
ኢየሱስ ነዉ የመኖር እስትንፋሴ፤

VERSE 5
በነፋሳት የማይጠፋ ፋኖሴ፤
ኢየሱስ ነዉ የመኖር እስትንፋሴ . . .

CHORUS
በእኔ ቢጠቁርም ሰማይ፤
በእኔ ቢጠልቅም ፀሀይ፤
በነፋሳት የማይጠፋ ፋኖሴ፤
ኢየሱስ ነዉ የመኖር እስትንፋሴ፤'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beene bit’equrm semay;
Beene bit’elqm ts’ehey;
Benefasat yemayt’efa fanose;
Iyesus newu yemenor estnfase;

VERSE 1
Ersun tamgne ewet’alehu ersun tamgne egebalehu;
Dibq serawit alew leene yemit’ebqegn bezemene;
Egziabher leene birhene newu;
Yemiyasdenegt’egn yemiyasferagn manewu;

CHORUS
Beene bit’equrm semay;
Beene bit’elqm ts’ehey;
Benefasat yemayt’efa fanose;
Iyesus newu yemenor estnfase;

VERSE 2
Sewu alba hogne besdet;wedaj yehonegn yeene abat;
Kristos leene hiywete newu; ersun amgne enoralehu;
Yelem yemiyasferagn bezemene;
Birhen newuna Egziabher leene;

CHORUS
Beene bit’equrm semay;
Beene bit’elqm ts’ehey;
Benefasat yemayt’efa fanose;
Iyesus newu yemenor estnfase;

VERSE 3
Mech yiset’egnal let’elat;ayselet’nm beene mot;
Yemit’ebqegn Geta newu;yetgnaw t’elat lidefrewu;
Bebete meqan lay dem yitayal;enen keegziabher keto man yileyal;
Yiኸw aqomegn bemeqdesu; eyet’ebeqe bemenfesu;

CHORUS
Beene bit’equrm semay;
Beene bit’elqm ts’ehey;
Benefasat yemayt’efa fanose;
Iyesus newu yemenor estnfase;

VERSE 4
Enen liyakebr rasun set’to.;geztognal Geta moten moto;
Yigeza lesmu siga menfese; beersu newuna lezare medrese;
Beene bit’equrm semay;
Beene bit’elqm ts’ehey;

CHORUS
Beene bit’equrm semay;
Beene bit’elqm ts’ehey;
Benefasat yemayt’efa fanose;
Iyesus newu yemenor estnfase;

VERSE 5
Benefasat yemayt’efa fanose;
Iyesus newu yemenor estnfase . . .

CHORUS
Beene bit’equrm semay;
Beene bit’elqm ts’ehey;
Benefasat yemayt’efa fanose;
Iyesus newu yemenor estnfase;'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'beene-bitekur-semay', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Beene Bitekur Semay Kiber Balegn Neger Zik Biye Lameseginew (beene-bitekur-semay-kiber-balegn-neger-zik-biye-lameseginew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በእኔ ቢጠቁር
በእኔ ቢጠቁርም ሰማይ
በእኔ ቢጠልቅም ፀሀይ
በነፋሳት የማይጠፋ ፋኖሴ

VERSE 1
ኢየሱስ ነው የመኖር እስትንፋሴ (፪)
እርሱን ታምኜ እወጣለሁ
እርሱን ታምኜ እገባለሁ
ድብቅ ሰራዊት አለው ለኔ

VERSE 2
የሚጠብቀኝ በዘመኔ
እግዚአብሔር ለኔ ብርሀኔ ነው
የሚያስደነግጠኝ የሚያስፈራኝ ማነው

VERSE 3
ሰው አልባ ሆኜ በስደት
ወዳጄ ሆነኝ የኔ አባት
ክርስቶስ ለኔ ህይወቴ ነው
እርሱን ታምኜ እኖራለሁ

VERSE 4
የለም የሚያስፈራኝ በዘመኔ
ብርሀን ነውና እግዚአብሔር ለኔ
ክበር ባለኝ ነገር
አንተ ታይበት እኔ ልደበቅ

VERSE 5
በአገልግሎቴ ብቻህን ድመቅ
መዝሙሬ ካንተ ሰብከቴ ካንተ
ከኔ አንዳች የለኝም ያንተን ለአንተ
ክበር ባለኝ ነገር /፪/

VERSE 6
የለም ከኔ እምለው ሁሉ ካንተ ነው /፪/
ዝቅ ብዬ
ምን አገኘህ ሰው ይለኛል
ላያኖረኝ ይጨነቃል

VERSE 7
መኖርያዬ በሰማይ
አባት አለኝ ኤልሻዳይ
አባት ና ንጉስ ጌታ ቅዱስ ለነብስ
ህይወቴ ነው ክርስቶስ

VERSE 8
ዝቅ ብዬ ላመስግነው
ጉግበቴ ነው ላወድሰው
የፍቅሩ እሳት ልቤን ነክቷል
የድል ዜማ በአፌ ሞልቷል',
      lyrics_transliteration = 'Beene bit’equr
Beene bit’equrm semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose

VERSE 1
Iyesus new yemenor estnfase (2)
Ersun tamgne ewet’alehu
Ersun tamgne egebalehu
Dibq serawit alew lene

VERSE 2
Yemit’ebqegn bezemene
Egziabher lene birhene new
Yemiyasdenegt’egn yemiyasferagn manew

VERSE 3
Sew alba hogne besdet
Wedaje honegn yene abat
Kristos lene hiywete new
Ersun tamgne enoralehu

VERSE 4
Yelem yemiyasferagn bezemene
Birhen newna Egziabher lene
Kiber balegn neger
Ante taybet ene lidebeq

VERSE 5
Beagelglote bichahn dimeq
Mezmure kante sebkete kante
Kene andach yelegnm yanten leante
Kiber balegn neger (2)

VERSE 6
Yelem kene emlew hulu kante new (2)
Ziq biye
Min agegneh sew yilegnal
Layanoregn yich’eneqal

VERSE 7
Menoryaye besemay
Abat alegn elshaday
Abat na nigus Geta Kidus lenebs
Hiywete new Kristos

VERSE 8
Ziq biye lamesgnew
Gugbete new lawedsew
Yefqru esat liben nektwal
Yedl zema beafe moltwal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'beene-bitekur-semay-kiber-balegn-neger-zik-biye-lameseginew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በእኔ ቢጠቁር
በእኔ ቢጠቁርም ሰማይ
በእኔ ቢጠልቅም ፀሀይ
በነፋሳት የማይጠፋ ፋኖሴ

VERSE 1
ኢየሱስ ነው የመኖር እስትንፋሴ (፪)
እርሱን ታምኜ እወጣለሁ
እርሱን ታምኜ እገባለሁ
ድብቅ ሰራዊት አለው ለኔ

CHORUS
በእኔ ቢጠቁር
በእኔ ቢጠቁርም ሰማይ
በእኔ ቢጠልቅም ፀሀይ
በነፋሳት የማይጠፋ ፋኖሴ

VERSE 2
የሚጠብቀኝ በዘመኔ
እግዚአብሔር ለኔ ብርሀኔ ነው
የሚያስደነግጠኝ የሚያስፈራኝ ማነው

CHORUS
በእኔ ቢጠቁር
በእኔ ቢጠቁርም ሰማይ
በእኔ ቢጠልቅም ፀሀይ
በነፋሳት የማይጠፋ ፋኖሴ

VERSE 3
ሰው አልባ ሆኜ በስደት
ወዳጄ ሆነኝ የኔ አባት
ክርስቶስ ለኔ ህይወቴ ነው
እርሱን ታምኜ እኖራለሁ

CHORUS
በእኔ ቢጠቁር
በእኔ ቢጠቁርም ሰማይ
በእኔ ቢጠልቅም ፀሀይ
በነፋሳት የማይጠፋ ፋኖሴ

VERSE 4
የለም የሚያስፈራኝ በዘመኔ
ብርሀን ነውና እግዚአብሔር ለኔ
ክበር ባለኝ ነገር
አንተ ታይበት እኔ ልደበቅ

CHORUS
በእኔ ቢጠቁር
በእኔ ቢጠቁርም ሰማይ
በእኔ ቢጠልቅም ፀሀይ
በነፋሳት የማይጠፋ ፋኖሴ

VERSE 5
በአገልግሎቴ ብቻህን ድመቅ
መዝሙሬ ካንተ ሰብከቴ ካንተ
ከኔ አንዳች የለኝም ያንተን ለአንተ
ክበር ባለኝ ነገር /፪/

CHORUS
በእኔ ቢጠቁር
በእኔ ቢጠቁርም ሰማይ
በእኔ ቢጠልቅም ፀሀይ
በነፋሳት የማይጠፋ ፋኖሴ

VERSE 6
የለም ከኔ እምለው ሁሉ ካንተ ነው /፪/
ዝቅ ብዬ
ምን አገኘህ ሰው ይለኛል
ላያኖረኝ ይጨነቃል

CHORUS
በእኔ ቢጠቁር
በእኔ ቢጠቁርም ሰማይ
በእኔ ቢጠልቅም ፀሀይ
በነፋሳት የማይጠፋ ፋኖሴ

VERSE 7
መኖርያዬ በሰማይ
አባት አለኝ ኤልሻዳይ
አባት ና ንጉስ ጌታ ቅዱስ ለነብስ
ህይወቴ ነው ክርስቶስ

CHORUS
በእኔ ቢጠቁር
በእኔ ቢጠቁርም ሰማይ
በእኔ ቢጠልቅም ፀሀይ
በነፋሳት የማይጠፋ ፋኖሴ

VERSE 8
ዝቅ ብዬ ላመስግነው
ጉግበቴ ነው ላወድሰው
የፍቅሩ እሳት ልቤን ነክቷል
የድል ዜማ በአፌ ሞልቷል

CHORUS
በእኔ ቢጠቁር
በእኔ ቢጠቁርም ሰማይ
በእኔ ቢጠልቅም ፀሀይ
በነፋሳት የማይጠፋ ፋኖሴ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beene bit’equr
Beene bit’equrm semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose

VERSE 1
Iyesus new yemenor estnfase (2)
Ersun tamgne ewet’alehu
Ersun tamgne egebalehu
Dibq serawit alew lene

CHORUS
Beene bit’equr
Beene bit’equrm semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose

VERSE 2
Yemit’ebqegn bezemene
Egziabher lene birhene new
Yemiyasdenegt’egn yemiyasferagn manew

CHORUS
Beene bit’equr
Beene bit’equrm semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose

VERSE 3
Sew alba hogne besdet
Wedaje honegn yene abat
Kristos lene hiywete new
Ersun tamgne enoralehu

CHORUS
Beene bit’equr
Beene bit’equrm semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose

VERSE 4
Yelem yemiyasferagn bezemene
Birhen newna Egziabher lene
Kiber balegn neger
Ante taybet ene lidebeq

CHORUS
Beene bit’equr
Beene bit’equrm semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose

VERSE 5
Beagelglote bichahn dimeq
Mezmure kante sebkete kante
Kene andach yelegnm yanten leante
Kiber balegn neger (2)

CHORUS
Beene bit’equr
Beene bit’equrm semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose

VERSE 6
Yelem kene emlew hulu kante new (2)
Ziq biye
Min agegneh sew yilegnal
Layanoregn yich’eneqal

CHORUS
Beene bit’equr
Beene bit’equrm semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose

VERSE 7
Menoryaye besemay
Abat alegn elshaday
Abat na nigus Geta Kidus lenebs
Hiywete new Kristos

CHORUS
Beene bit’equr
Beene bit’equrm semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose

VERSE 8
Ziq biye lamesgnew
Gugbete new lawedsew
Yefqru esat liben nektwal
Yedl zema beafe moltwal

CHORUS
Beene bit’equr
Beene bit’equrm semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'beene-bitekur-semay-kiber-balegn-neger-zik-biye-lameseginew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Beene Bitekurim Semay (beene-bitekurim-semay)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 1
እርሱን ታምኜ እወጣለሁ
እርሱን ታመኜ እገባልሁ
ድብቅ ሰራዊት አለው ለኔ
የሚጠበቀኝ በዘመኔ

VERSE 2
እግዚአብሄር ለእኔ ብርሃኔ ነው
የሚአስደነግጠኝ የሚያስፈራኝ ማነው

VERSE 3
ሰው አልባ ሆኜ በስደት
ወዳጅ የሆነኝ የኔ አባት
ክርስቶስ ለእኔ ሕይወቴ ነው
እርሱን ታምኜ እኖራልሁ

VERSE 4
የለም የሚያስፈራኝ በዘመኔ
ብርሃን ነውና እግዚአብሔር ለእኔ

VERSE 5
መች ይሰጠኛል ለጠላት
አይሰለጥንም በእኔ ሞት
የሚጠብቀኝ ጌታ ነው
የትኛው ጠላት ሊደፍረው

VERSE 6
በቤቴ መቃን ላይ ደም ይታያል
እኔን ከእግዚአብሔር ከቶ ማን ይለያል

VERSE 7
ይኧው አቆመኝ በመቅደሱ
እየጠበቀ በመንፈሱ
እኔን ሊያከበር ራሱን ሰጥቶ
ገዝቶኛል ጌታ ሞቴን ሞቶ

VERSE 8
ይገዛ ለስሙ ስጋ መንፈሴ
በእርሱ ነውና ለዛሬ መድረሴ',
      lyrics_transliteration = 'Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 1
Ersun tamgne ewet’alehu
Ersun tamegne egebalhu
Dibq serawit alew lene
Yemit’ebeqegn bezemene

VERSE 2
Egziabher leene birhane new
Yemiasdenegt’egn yemiyasferagn manew

VERSE 3
Sew alba hogne besdet
Wedaj yehonegn yene abat
Kristos leene hiywete new
Ersun tamgne enoralhu

VERSE 4
Yelem yemiyasferagn bezemene
Birhan newna Egziabher leene

VERSE 5
Mech yiset’egnal let’elat
Ayselet’nm beene mot
Yemit’ebqegn Geta new
Yetgnaw t’elat lidefrew

VERSE 6
Bebete meqan lay dem yitayal
Enen keegziabher keto man yileyal

VERSE 7
Yiኧw aqomegn bemeqdesu
Eyet’ebeqe bemenfesu
Enen liyakeber rasun set’to
Geztognal Geta moten moto

VERSE 8
Yigeza lesmu siga menfese
Beersu newna lezare medrese',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'beene-bitekurim-semay'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 1
እርሱን ታምኜ እወጣለሁ
እርሱን ታመኜ እገባልሁ
ድብቅ ሰራዊት አለው ለኔ
የሚጠበቀኝ በዘመኔ

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 2
እግዚአብሄር ለእኔ ብርሃኔ ነው
የሚአስደነግጠኝ የሚያስፈራኝ ማነው

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 3
ሰው አልባ ሆኜ በስደት
ወዳጅ የሆነኝ የኔ አባት
ክርስቶስ ለእኔ ሕይወቴ ነው
እርሱን ታምኜ እኖራልሁ

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 4
የለም የሚያስፈራኝ በዘመኔ
ብርሃን ነውና እግዚአብሔር ለእኔ

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 5
መች ይሰጠኛል ለጠላት
አይሰለጥንም በእኔ ሞት
የሚጠብቀኝ ጌታ ነው
የትኛው ጠላት ሊደፍረው

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 6
በቤቴ መቃን ላይ ደም ይታያል
እኔን ከእግዚአብሔር ከቶ ማን ይለያል

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 7
ይኧው አቆመኝ በመቅደሱ
እየጠበቀ በመንፈሱ
እኔን ሊያከበር ራሱን ሰጥቶ
ገዝቶኛል ጌታ ሞቴን ሞቶ

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)

VERSE 8
ይገዛ ለስሙ ስጋ መንፈሴ
በእርሱ ነውና ለዛሬ መድረሴ
አዝ

CHORUS
በእኔ ቢጠቁር ሰማይ
በእኔ ቢጠልቅም ጸሐይ
በነፋሳት የማይጠፋ ፋኖሴ
ክርስቶስ ነው የመኖር ስትንፋሴ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 1
Ersun tamgne ewet’alehu
Ersun tamegne egebalhu
Dibq serawit alew lene
Yemit’ebeqegn bezemene

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 2
Egziabher leene birhane new
Yemiasdenegt’egn yemiyasferagn manew

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 3
Sew alba hogne besdet
Wedaj yehonegn yene abat
Kristos leene hiywete new
Ersun tamgne enoralhu

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 4
Yelem yemiyasferagn bezemene
Birhan newna Egziabher leene

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 5
Mech yiset’egnal let’elat
Ayselet’nm beene mot
Yemit’ebqegn Geta new
Yetgnaw t’elat lidefrew

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 6
Bebete meqan lay dem yitayal
Enen keegziabher keto man yileyal

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 7
Yiኧw aqomegn bemeqdesu
Eyet’ebeqe bemenfesu
Enen liyakeber rasun set’to
Geztognal Geta moten moto

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)

VERSE 8
Yigeza lesmu siga menfese
Beersu newna lezare medrese
CHORUS

CHORUS
Beene bit’equr semay
Beene bit’elqm ts’ehey
Benefasat yemayt’efa fanose
Kristos new yemenor sitnfase (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'beene-bitekurim-semay', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Beenibaye Anikwakwahu (beenibaye-anikwakwahu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 1
ስሜቴ ገዝፎ ምኞቴ ነገሰ፤ እምነቴ እያነሰ።
እንደ ዮሴፍ እምነትን፤ እንደ ኢዮብ ትዕግስትን፤ አድለኝ።
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።

VERSE 2
ከእኔ አትራቅ። የለኝ አማራጭ።
አታልላኝ አለም ጉልበቴን አድክማ፤ ውበቴን አክስማ፤
ስትጥለኝ ያዝከኝ። "በቃህ ልጄ።" አልከኝ። ከጉያህ ሸጎጥከኝ።
እንደ ጊዮርጊስ ተጋድሎን፤ እንደ አርሴማ ፅናትን፤ አድለኝ።

VERSE 3
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
በቃ። አላነባም። የሚወደኝ አለ፤ እኔን "ልጄ" ያለ።

VERSE 4
ሳልጠራው ደርሷል። እንባዬን ጠርጎታል። ሳቄን መልሶታል።
እንደ ዳዊት ውዳሴን፤ እንደ አሳፍ ዝማሬን፤ አድለኝ።
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።

VERSE 5
ከእኔ አትራቅ። የለኝ አማራጭ።',
      lyrics_transliteration = 'Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Keqalh yilq qale eyashoregn; belt’ogn eyazezegn;

VERSE 1
Simete gezfo mignote negese; emnete eyanese.
Ende yosef emnetn; ende iyob tiegstn; adlegn.
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.

VERSE 2
Keene atraq. yelegn amarach’.
Atallagn alem gulbeten adkma; wibeten aksma;
Sitt’legn yazkegn. "beqah lije." alkegn. keguyah shegot’kegn.
Ende Giyorgis tegadlon; ende arsema ts’natn; adlegn.

VERSE 3
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Beqa. alanebam. yemiwedegn ale; enen "lije" yale.

VERSE 4
Salt’eraw derswal. enbayen t’ergotal. saqen melsotal.
Ende dawit widasen; ende asaf zimaren; adlegn.
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.

VERSE 5
Keene atraq. yelegn amarach’.',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'beenibaye-anikwakwahu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 1
ስሜቴ ገዝፎ ምኞቴ ነገሰ፤ እምነቴ እያነሰ።
እንደ ዮሴፍ እምነትን፤ እንደ ኢዮብ ትዕግስትን፤ አድለኝ።
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።

CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 2
ከእኔ አትራቅ። የለኝ አማራጭ።
አታልላኝ አለም ጉልበቴን አድክማ፤ ውበቴን አክስማ፤
ስትጥለኝ ያዝከኝ። "በቃህ ልጄ።" አልከኝ። ከጉያህ ሸጎጥከኝ።
እንደ ጊዮርጊስ ተጋድሎን፤ እንደ አርሴማ ፅናትን፤ አድለኝ።

CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 3
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
በቃ። አላነባም። የሚወደኝ አለ፤ እኔን "ልጄ" ያለ።

CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 4
ሳልጠራው ደርሷል። እንባዬን ጠርጎታል። ሳቄን መልሶታል።
እንደ ዳዊት ውዳሴን፤ እንደ አሳፍ ዝማሬን፤ አድለኝ።
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።

CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤

VERSE 5
ከእኔ አትራቅ። የለኝ አማራጭ።

CHORUS
በእንባዬ አንኳኳሁ። አንኳኳሁ የሰማዩን ደጅ። (2)
የሚረዳኝ የለም አምላክ ካንተ ውጭ።
ከእኔ አትራቅ። የለኝ አማራጭ።
ከቃልህ ይልቅ ቃሌ እያሾረኝ፤ በልጦኝ እያዘዘኝ፤'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Keqalh yilq qale eyashoregn; belt’ogn eyazezegn;

VERSE 1
Simete gezfo mignote negese; emnete eyanese.
Ende yosef emnetn; ende iyob tiegstn; adlegn.
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.

CHORUS
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Keqalh yilq qale eyashoregn; belt’ogn eyazezegn;

VERSE 2
Keene atraq. yelegn amarach’.
Atallagn alem gulbeten adkma; wibeten aksma;
Sitt’legn yazkegn. "beqah lije." alkegn. keguyah shegot’kegn.
Ende Giyorgis tegadlon; ende arsema ts’natn; adlegn.

CHORUS
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Keqalh yilq qale eyashoregn; belt’ogn eyazezegn;

VERSE 3
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Beqa. alanebam. yemiwedegn ale; enen "lije" yale.

CHORUS
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Keqalh yilq qale eyashoregn; belt’ogn eyazezegn;

VERSE 4
Salt’eraw derswal. enbayen t’ergotal. saqen melsotal.
Ende dawit widasen; ende asaf zimaren; adlegn.
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.

CHORUS
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Keqalh yilq qale eyashoregn; belt’ogn eyazezegn;

VERSE 5
Keene atraq. yelegn amarach’.

CHORUS
Beenbaye ankwakwahu. ankwakwahu yesemayun dej. (2)
Yemiredagn yelem amlak kante wich’.
Keene atraq. yelegn amarach’.
Keqalh yilq qale eyashoregn; belt’ogn eyazezegn;'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'beenibaye-anikwakwahu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Beewinet Semaetat (beewinet-semaetat)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በእውነት ሰማዕታት
በእውነት ሰማዕታት ምርጦችህ ሆኑ /2

VERSE 1
የዓለምን መንግሥት ክብሩን ሁሉ ስለመነኑ
ተመተሩ ተቆራረጡ
ስለስምህ ብለው ያላቸውን ሁሉ እያጡ
ተቃጠሉ በሰይፍ አለቁ

VERSE 2
የሚመጣውን ክብር መንግሥትህን ስለናፈቁ
ምድራዊውን መንግሥት ትተው
ወደ የማያልፈው ክብር ተጓዙ ከዓለም ወጥተው
ወደ ተኩላዎች መንጋ ተላኩ

VERSE 3
ቃለ ወንጌልህን በአሕዛብ መንደር ሊሰብኩ
ወደ ሸንጎ አሳለፏቸው
በነገሥታቱ ፊት በአደባባይ ሊያስጨንቋቸው
በዚያች ሰዓት ሳይሳቀቁ

VERSE 4
ለሚናገሩት ቃል ሳያስቡ ሳይጨነቁ
ጰራቅሊጦስ አፅናኝ ነውና
እስከ መጨረሻው ለታገሰ በእምነት ለፀና
መከራውን እያስቻላቸው

VERSE 5
እግዚአብሔር የድልን ዘውድ አቀዳጃቸው',
      lyrics_transliteration = 'Beewnet semaetat
Beewnet semaetat mirt’ochh honu /2

VERSE 1
Yealemn mengst kibrun hulu silemenenu
Temeteru teqoraret’u
Silesmh bilew yalachewn hulu eyat’u
Teqat’elu beseyf alequ

VERSE 2
Yemimet’awn kibir mengsthn silenafequ
Midrawiwn mengst titew
Wede yemayalfew kibir tegwazu kealem wet’tew
Wede tekulawoch menga telaku

VERSE 3
Qale wengelhn beahzab mender lisebku
Wede shengo asalefwachew
Benegestatu fit beadebabay liyasch’enqwachew
Beziyach seat saysaqequ

VERSE 4
Leminagerut qal sayasbu saych’enequ
P’eraqlit’os ats’nagn newna
Eske mech’ereshaw letagese beemnet lets’ena
Mekerawn eyaschalachew

VERSE 5
Egziabher yedln zewd aqedajachew',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'beewinet-semaetat'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በእውነት ሰማዕታት
በእውነት ሰማዕታት ምርጦችህ ሆኑ /2

VERSE 1
የዓለምን መንግሥት ክብሩን ሁሉ ስለመነኑ
ተመተሩ ተቆራረጡ
ስለስምህ ብለው ያላቸውን ሁሉ እያጡ
ተቃጠሉ በሰይፍ አለቁ

CHORUS
በእውነት ሰማዕታት
በእውነት ሰማዕታት ምርጦችህ ሆኑ /2

VERSE 2
የሚመጣውን ክብር መንግሥትህን ስለናፈቁ
ምድራዊውን መንግሥት ትተው
ወደ የማያልፈው ክብር ተጓዙ ከዓለም ወጥተው
ወደ ተኩላዎች መንጋ ተላኩ

CHORUS
በእውነት ሰማዕታት
በእውነት ሰማዕታት ምርጦችህ ሆኑ /2

VERSE 3
ቃለ ወንጌልህን በአሕዛብ መንደር ሊሰብኩ
ወደ ሸንጎ አሳለፏቸው
በነገሥታቱ ፊት በአደባባይ ሊያስጨንቋቸው
በዚያች ሰዓት ሳይሳቀቁ

CHORUS
በእውነት ሰማዕታት
በእውነት ሰማዕታት ምርጦችህ ሆኑ /2

VERSE 4
ለሚናገሩት ቃል ሳያስቡ ሳይጨነቁ
ጰራቅሊጦስ አፅናኝ ነውና
እስከ መጨረሻው ለታገሰ በእምነት ለፀና
መከራውን እያስቻላቸው

CHORUS
በእውነት ሰማዕታት
በእውነት ሰማዕታት ምርጦችህ ሆኑ /2

VERSE 5
እግዚአብሔር የድልን ዘውድ አቀዳጃቸው

CHORUS
በእውነት ሰማዕታት
በእውነት ሰማዕታት ምርጦችህ ሆኑ /2'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beewnet semaetat
Beewnet semaetat mirt’ochh honu /2

VERSE 1
Yealemn mengst kibrun hulu silemenenu
Temeteru teqoraret’u
Silesmh bilew yalachewn hulu eyat’u
Teqat’elu beseyf alequ

CHORUS
Beewnet semaetat
Beewnet semaetat mirt’ochh honu /2

VERSE 2
Yemimet’awn kibir mengsthn silenafequ
Midrawiwn mengst titew
Wede yemayalfew kibir tegwazu kealem wet’tew
Wede tekulawoch menga telaku

CHORUS
Beewnet semaetat
Beewnet semaetat mirt’ochh honu /2

VERSE 3
Qale wengelhn beahzab mender lisebku
Wede shengo asalefwachew
Benegestatu fit beadebabay liyasch’enqwachew
Beziyach seat saysaqequ

CHORUS
Beewnet semaetat
Beewnet semaetat mirt’ochh honu /2

VERSE 4
Leminagerut qal sayasbu saych’enequ
P’eraqlit’os ats’nagn newna
Eske mech’ereshaw letagese beemnet lets’ena
Mekerawn eyaschalachew

CHORUS
Beewnet semaetat
Beewnet semaetat mirt’ochh honu /2

VERSE 5
Egziabher yedln zewd aqedajachew

CHORUS
Beewnet semaetat
Beewnet semaetat mirt’ochh honu /2'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'beewinet-semaetat', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Befiker Lazimeh (befiker-lazimeh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)

VERSE 1
በልቤ ትከሻ በቀል ተሸክሜ
ወንድሜን ጠልቼ ካንተ ፊት መቆሜ
ጻድቅ ቢያስመስለኝ በሰዎች እይታ

VERSE 2
ጉዴን ስለምታውቅ እስራቴን ፍታ (2)
ዙርያውን ተከቦ በእሾህ ጥላቻ
ስበከቴ መዝሙሬ ሆኗል የቃል ብቻ

VERSE 3
ማረኝ እና ይብቃኝ ለሐጥያት መዝመቱ
ፍቅር ዬሌለው ሰው ነው የከንቱ ከንቱ (2)
አሸንፈህልኝ እኔ ግን ተሸነፍኩ

VERSE 4
በእጄ ማልነካዉን ለሰው እያሸከምኩ
በቃሌ ጠርቼህ በግብሬ ረገምኩህ
ባስመሳይ ማንነት እየሸነገልኩ (2)

VERSE 5
ዙርያውን ተከቦ በእሾህ ጥላቻ
ስበክቴ መዝሙሬ ሆኗል የቃል ብቻ
ማረኝ እና ይብቃኝ ለሐጢአት መዝመቱ
ፍቅር ዬሌለው ሰው ነው የከንቱ ከንቱ (2)

VERSE 6
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ይገዛህኝ ባለውለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ(2)',
      lyrics_transliteration = 'Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

VERSE 1
Belbe tikesha beqel teshekme
Wendmen t’elche kante fit meqome
Ts’adq biyasmeslegn besewoch eyta

VERSE 2
Guden silemtawq esraten fita (2)
Zuryawn tekebo beeshoh t’lacha
Sibekete mezmure honwal yeqal bicha

VERSE 3
Maregn ena yibqagn lehet’yat mezmetu
Fiqr yelelew sew new yekentu kentu (2)
Ashenfehlgn ene gin teshenefku

VERSE 4
Beeje malnekawun lesew eyashekemku
Beqale t’ercheh begbre regemkuh
Basmesay mannet eyeshenegelku (2)

VERSE 5
Zuryawn tekebo beeshoh t’lacha
Sibekte mezmure honwal yeqal bicha
Maregn ena yibqagn lehet’iat mezmetu
Fiqr yelelew sew new yekentu kentu (2)

VERSE 6
Befqr lazimh fiqr neh Getaye
Bedem yigezahgn balewletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'befiker-lazimeh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)

VERSE 1
አዝማች
በልቤ ትከሻ በቀል ተሸክሜ
ወንድሜን ጠልቼ ካንተ ፊት መቆሜ
ጻድቅ ቢያስመስለኝ በሰዎች እይታ

CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)

VERSE 2
ጉዴን ስለምታውቅ እስራቴን ፍታ (2)
አዝ
ዙርያውን ተከቦ በእሾህ ጥላቻ
ስበከቴ መዝሙሬ ሆኗል የቃል ብቻ

CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)

VERSE 3
ማረኝ እና ይብቃኝ ለሐጥያት መዝመቱ
ፍቅር ዬሌለው ሰው ነው የከንቱ ከንቱ (2)
አዝ
አሸንፈህልኝ እኔ ግን ተሸነፍኩ

CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)

VERSE 4
በእጄ ማልነካዉን ለሰው እያሸከምኩ
በቃሌ ጠርቼህ በግብሬ ረገምኩህ
ባስመሳይ ማንነት እየሸነገልኩ (2)
አዝ

CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)

VERSE 5
ዙርያውን ተከቦ በእሾህ ጥላቻ
ስበክቴ መዝሙሬ ሆኗል የቃል ብቻ
ማረኝ እና ይብቃኝ ለሐጢአት መዝመቱ
ፍቅር ዬሌለው ሰው ነው የከንቱ ከንቱ (2)

CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)

VERSE 6
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ይገዛህኝ ባለውለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ(2)

CHORUS
በፍቅር ላዚምህ ፍቅር ነህ ጌታዬ
በደም ደገዛህኝ ባለ ዉለታዬ
በቃዬል ጎዳና እንዳልጉዋዝ እርዳኝ
በቀናው መንፈስህ ወደ ጽድቅህ ምራኝ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

VERSE 1
CHORUS
Belbe tikesha beqel teshekme
Wendmen t’elche kante fit meqome
Ts’adq biyasmeslegn besewoch eyta

CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

VERSE 2
Guden silemtawq esraten fita (2)
CHORUS
Zuryawn tekebo beeshoh t’lacha
Sibekete mezmure honwal yeqal bicha

CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

VERSE 3
Maregn ena yibqagn lehet’yat mezmetu
Fiqr yelelew sew new yekentu kentu (2)
CHORUS
Ashenfehlgn ene gin teshenefku

CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

VERSE 4
Beeje malnekawun lesew eyashekemku
Beqale t’ercheh begbre regemkuh
Basmesay mannet eyeshenegelku (2)
CHORUS

CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

VERSE 5
Zuryawn tekebo beeshoh t’lacha
Sibekte mezmure honwal yeqal bicha
Maregn ena yibqagn lehet’iat mezmetu
Fiqr yelelew sew new yekentu kentu (2)

CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

VERSE 6
Befqr lazimh fiqr neh Getaye
Bedem yigezahgn balewletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)

CHORUS
Befqr lazimh fiqr neh Getaye
Bedem degezahgn bale wuletaye
Beqayel godana endalguwaz erdagn
Beqenaw menfesh wede ts’dqh miragn (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'befiker-lazimeh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Before the most high (before-the-most-high)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ወደ ማደሪያው ገብቼ ልስገድ ለእግዚአብሔር
ምስጋናንም ላቅርብ ስለስሙ ክብር

VERSE 1
ወደ ማደሪያው ገብቼ ልስገድ ለእግዚአብሔር
ምስጋናንም ላቅርብ ስለስሙ ክብር',
      lyrics_transliteration = 'Wede maderyaw gebiche lisged le Egziabher
Misgananim laqrib sile simu kibir

VERSE 1
Wede maderyaw gebiche lisged le Egziabher
Misgananim laqrib sile simu kibir',
      lyrics_english = 'Before the most high I will fall within His dwelling place
And bring forth my praise to glorify His name

VERSE 1
For all that He has done I will sing hymns for Him
Within His holy church bowing for all my sins
To stand before my Lord I will rise forgiven

VERSE 2
Through my days of despair He''s my shield and armor
Find me within the church singing to the Father
Sowing my seeds of praise the heavenly gardener

VERSE 3
Praising like King David with a harp of 10 strings
Along with the angels with joyful noise I sing
My words my sacrifice accept my offerings

VERSE 4
To the one and true God for His name I will kneel
Giving my tithes to Him promises I''ll fulfill
To enter His kingdom it is my Savior''s will

VERSE 5
Your glory I declare as I proclaim in song
Praying in your temple before the rise of dawn
Along with my fathers to you I call upon',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'before-the-most-high'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወደ ማደሪያው ገብቼ ልስገድ ለእግዚአብሔር
ምስጋናንም ላቅርብ ስለስሙ ክብር

VERSE 1
ወደ ማደሪያው ገብቼ ልስገድ ለእግዚአብሔር
ምስጋናንም ላቅርብ ስለስሙ ክብር

CHORUS
ወደ ማደሪያው ገብቼ ልስገድ ለእግዚአብሔር
ምስጋናንም ላቅርብ ስለስሙ ክብር'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wede maderyaw gebiche lisged le Egziabher
Misgananim laqrib sile simu kibir

VERSE 1
Wede maderyaw gebiche lisged le Egziabher
Misgananim laqrib sile simu kibir

CHORUS
Wede maderyaw gebiche lisged le Egziabher
Misgananim laqrib sile simu kibir'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Before the most high I will fall within His dwelling place
And bring forth my praise to glorify His name

VERSE 1
For all that He has done I will sing hymns for Him
Within His holy church bowing for all my sins
To stand before my Lord I will rise forgiven

CHORUS
Before the most high I will fall within His dwelling place
And bring forth my praise to glorify His name

VERSE 2
Through my days of despair He''s my shield and armor
Find me within the church singing to the Father
Sowing my seeds of praise the heavenly gardener

CHORUS
Before the most high I will fall within His dwelling place
And bring forth my praise to glorify His name

VERSE 3
Praising like King David with a harp of 10 strings
Along with the angels with joyful noise I sing
My words my sacrifice accept my offerings

CHORUS
Before the most high I will fall within His dwelling place
And bring forth my praise to glorify His name

VERSE 4
To the one and true God for His name I will kneel
Giving my tithes to Him promises I''ll fulfill
To enter His kingdom it is my Savior''s will

CHORUS
Before the most high I will fall within His dwelling place
And bring forth my praise to glorify His name

VERSE 5
Your glory I declare as I proclaim in song
Praying in your temple before the rise of dawn
Along with my fathers to you I call upon

CHORUS
Before the most high I will fall within His dwelling place
And bring forth my praise to glorify His name'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'before-the-most-high', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Begena Anisiten (begena-anisiten)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 1
ክበር ተመስገን ለዘላለም [፪]

VERSE 2
ዓለም ሞኝነት ይመስለዋል
ላንተ መንበርከክ ይከብደዋል
ፍቅርህን ቀምሰን ዝም አንልም
እንዘምራለን ለዘላለም[፪]

VERSE 3
ፍውስን ስትሰጠን ስትባርከን
ፍቅርህን ልከህ ስትጎበኝን
ጉልበት ይጸናል ባንተ ጸጋ
ማነው የሚከፍልህ ያንተን ዋጋ[፪]

VERSE 4
ስንዘምርልህ የሚስቁ
ብዙ ሜልኮሉች ዛሬም አሉ
ከእኛ የሆነ ምንም የለም
አምላክ ስላንተ ዝም አንልም[፪]

VERSE 5
ሞኝነት ለኔ መች ሆነና
ፊትህ ያቆመኝ ለምስጋና
እንድቀኝልህ ግድ የሚለኝ
ፍቅርህ ብቻ ነው የማርከኝ[፪]',
      lyrics_transliteration = 'Begena ansten mesenqon
Begena ansten mesegqon
Enamesgnew simhn
Endante Geta manm yelem

VERSE 1
Kiber temesgen lezelalem [2]

VERSE 2
Alem mognnet yimeslewal
Lante menberkek yikebdewal
Fiqrhn qemsen zim anlm
Enzemralen lezelalem[2]

VERSE 3
Fiwsn sitset’en sitbarken
Fiqrhn likeh sitgobegnn
Gulbet yits’enal bante ts’ega
Manew yemikeflh yanten waga[2]

VERSE 4
Sinzemrlh yemisqu
Bizu melkoluch zarem alu
Keegna yehone minm yelem
Amlak silante zim anlm[2]

VERSE 5
Mognnet lene mech honena
Fith yaqomegn lemsgana
Endqegnlh gid yemilegn
Fiqrh bicha new yemarkegn[2]',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'begena-anisiten'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 1
ክበር ተመስገን ለዘላለም [፪]

CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 2
ዓለም ሞኝነት ይመስለዋል
ላንተ መንበርከክ ይከብደዋል
ፍቅርህን ቀምሰን ዝም አንልም
እንዘምራለን ለዘላለም[፪]

CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 3
ፍውስን ስትሰጠን ስትባርከን
ፍቅርህን ልከህ ስትጎበኝን
ጉልበት ይጸናል ባንተ ጸጋ
ማነው የሚከፍልህ ያንተን ዋጋ[፪]

CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 4
ስንዘምርልህ የሚስቁ
ብዙ ሜልኮሉች ዛሬም አሉ
ከእኛ የሆነ ምንም የለም
አምላክ ስላንተ ዝም አንልም[፪]

CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 5
ሞኝነት ለኔ መች ሆነና
ፊትህ ያቆመኝ ለምስጋና
እንድቀኝልህ ግድ የሚለኝ
ፍቅርህ ብቻ ነው የማርከኝ[፪]

CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Begena ansten mesenqon
Begena ansten mesegqon
Enamesgnew simhn
Endante Geta manm yelem

VERSE 1
Kiber temesgen lezelalem [2]

CHORUS
Begena ansten mesenqon
Begena ansten mesegqon
Enamesgnew simhn
Endante Geta manm yelem

VERSE 2
Alem mognnet yimeslewal
Lante menberkek yikebdewal
Fiqrhn qemsen zim anlm
Enzemralen lezelalem[2]

CHORUS
Begena ansten mesenqon
Begena ansten mesegqon
Enamesgnew simhn
Endante Geta manm yelem

VERSE 3
Fiwsn sitset’en sitbarken
Fiqrhn likeh sitgobegnn
Gulbet yits’enal bante ts’ega
Manew yemikeflh yanten waga[2]

CHORUS
Begena ansten mesenqon
Begena ansten mesegqon
Enamesgnew simhn
Endante Geta manm yelem

VERSE 4
Sinzemrlh yemisqu
Bizu melkoluch zarem alu
Keegna yehone minm yelem
Amlak silante zim anlm[2]

CHORUS
Begena ansten mesenqon
Begena ansten mesegqon
Enamesgnew simhn
Endante Geta manm yelem

VERSE 5
Mognnet lene mech honena
Fith yaqomegn lemsgana
Endqegnlh gid yemilegn
Fiqrh bicha new yemarkegn[2]

CHORUS
Begena ansten mesenqon
Begena ansten mesegqon
Enamesgnew simhn
Endante Geta manm yelem'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'begena-anisiten', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Begol Begol (begol-begol)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በጎል በጎል ሰብአ ሰገል
በበረት ስብአ ስገል
በጎል ሰብዐ ሰገል ሰገዱሎቱ ፪
ፀሐይ ፪ ፀሀይ ሠረቀ ፪

VERSE 1
ፀሐይ ሠረቀ ልደቱ ተጠምቀ ፬',
      lyrics_transliteration = 'Begol begol seba segel
Beberet siba sigel
Begol seba segel segedulotu 2
Ts’ehey 2 ts’ehey sereqe 2

VERSE 1
Ts’ehey sereqe lidetu tet’emqe 4',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'begol-begol'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በጎል በጎል ሰብአ ሰገል
በበረት ስብአ ስገል
በጎል ሰብዐ ሰገል ሰገዱሎቱ ፪
ፀሐይ ፪ ፀሀይ ሠረቀ ፪

VERSE 1
ፀሐይ ሠረቀ ልደቱ ተጠምቀ ፬

CHORUS
በጎል በጎል ሰብአ ሰገል
በበረት ስብአ ስገል
በጎል ሰብዐ ሰገል ሰገዱሎቱ ፪
ፀሐይ ፪ ፀሀይ ሠረቀ ፪'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Begol begol seba segel
Beberet siba sigel
Begol seba segel segedulotu 2
Ts’ehey 2 ts’ehey sereqe 2

VERSE 1
Ts’ehey sereqe lidetu tet’emqe 4

CHORUS
Begol begol seba segel
Beberet siba sigel
Begol seba segel segedulotu 2
Ts’ehey 2 ts’ehey sereqe 2'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'begol-begol', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: begol begol Ethiopian Gena Mezmur (begol-begol-ethiopian-gena-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በጎል በጎል ሰብአ ሰገል /4/
በጎል ሰብአ ሰገል ሰገዱለት /4/
ፀሐይ /2/ ፀሐይ ሰረቀ /2/
ፀሐይ ሰረቀ ክርስቶስ ተጠምቀ /4/

VERSE 1
አንቺ ዮርዳኖስ ምንኛ ታደልሽ /2/
የእግዚአብሔር መንፈስ ከላይ ወርዶብሽ
የዓለም መድኃኒት ተጠመቀብሽ /2/
ድንግል ማርያም ያስገኘሽው ፍሬ /4/

VERSE 2
ህዝቦቹን ለማዳን ተጠመቀ ዛሬ /4/
ድንግል ማርያም ንፅህት ቅድስት /2/
የጌታዬ እናት ምስጋና ይገባሻል
ከሴቶች ሁሉ አንቺን መርጦሻል /2/

VERSE 3
እልል እልል ደስ ይበለን /2/
ወልድ ተወልዶ ነጻ ወጣን
ዮሐንስ አጥምቆ ድል አገኘን /2/',
      lyrics_transliteration = 'Begol begol seba segel (4)
Begol seba segel segedulet (4)
Ts’ehey (2) ts’ehey sereqe (2)
Ts’ehey sereqe Kristos tet’emqe (4)

VERSE 1
Anchi yordanos mingna tadelsh (2)
YeEgziabher menfes kelay werdobsh
Yealem medhanit tet’emeqebsh (2)
Dingil Maryam yasgegneshw fire (4)

VERSE 2
Hizbochun lemadan tet’emeqe zare (4)
Dingil Maryam nits’ht Kidist (2)
Yegetaye enat misgana yigebashal
Kesetoch hulu anchin mert’oshal (2)

VERSE 3
Ell ell des yibelen (2)
Weld teweldo nets’a wet’an
Yohens at’mqo dil agegnen (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'begol-begol-ethiopian-gena-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በጎል በጎል ሰብአ ሰገል /4/
በጎል ሰብአ ሰገል ሰገዱለት /4/
ፀሐይ /2/ ፀሐይ ሰረቀ /2/
ፀሐይ ሰረቀ ክርስቶስ ተጠምቀ /4/

VERSE 1
አንቺ ዮርዳኖስ ምንኛ ታደልሽ /2/
የእግዚአብሔር መንፈስ ከላይ ወርዶብሽ
የዓለም መድኃኒት ተጠመቀብሽ /2/
ድንግል ማርያም ያስገኘሽው ፍሬ /4/

CHORUS
በጎል በጎል ሰብአ ሰገል /4/
በጎል ሰብአ ሰገል ሰገዱለት /4/
ፀሐይ /2/ ፀሐይ ሰረቀ /2/
ፀሐይ ሰረቀ ክርስቶስ ተጠምቀ /4/

VERSE 2
ህዝቦቹን ለማዳን ተጠመቀ ዛሬ /4/
ድንግል ማርያም ንፅህት ቅድስት /2/
የጌታዬ እናት ምስጋና ይገባሻል
ከሴቶች ሁሉ አንቺን መርጦሻል /2/

CHORUS
በጎል በጎል ሰብአ ሰገል /4/
በጎል ሰብአ ሰገል ሰገዱለት /4/
ፀሐይ /2/ ፀሐይ ሰረቀ /2/
ፀሐይ ሰረቀ ክርስቶስ ተጠምቀ /4/

VERSE 3
እልል እልል ደስ ይበለን /2/
ወልድ ተወልዶ ነጻ ወጣን
ዮሐንስ አጥምቆ ድል አገኘን /2/

CHORUS
በጎል በጎል ሰብአ ሰገል /4/
በጎል ሰብአ ሰገል ሰገዱለት /4/
ፀሐይ /2/ ፀሐይ ሰረቀ /2/
ፀሐይ ሰረቀ ክርስቶስ ተጠምቀ /4/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Begol begol seba segel (4)
Begol seba segel segedulet (4)
Ts’ehey (2) ts’ehey sereqe (2)
Ts’ehey sereqe Kristos tet’emqe (4)

VERSE 1
Anchi yordanos mingna tadelsh (2)
YeEgziabher menfes kelay werdobsh
Yealem medhanit tet’emeqebsh (2)
Dingil Maryam yasgegneshw fire (4)

CHORUS
Begol begol seba segel (4)
Begol seba segel segedulet (4)
Ts’ehey (2) ts’ehey sereqe (2)
Ts’ehey sereqe Kristos tet’emqe (4)

VERSE 2
Hizbochun lemadan tet’emeqe zare (4)
Dingil Maryam nits’ht Kidist (2)
Yegetaye enat misgana yigebashal
Kesetoch hulu anchin mert’oshal (2)

CHORUS
Begol begol seba segel (4)
Begol seba segel segedulet (4)
Ts’ehey (2) ts’ehey sereqe (2)
Ts’ehey sereqe Kristos tet’emqe (4)

VERSE 3
Ell ell des yibelen (2)
Weld teweldo nets’a wet’an
Yohens at’mqo dil agegnen (2)

CHORUS
Begol begol seba segel (4)
Begol seba segel segedulet (4)
Ts’ehey (2) ts’ehey sereqe (2)
Ts’ehey sereqe Kristos tet’emqe (4)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'begol-begol-ethiopian-gena-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Begol Sekebe (begol-sekebe)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቤዛ ኲሉ ዓለም
ቤዛ ኲሉ ዓለም
ዮም ተወለደ

VERSE 1
ቤዛ ኲሉ ዓለም
ቤዛ ኲሉ ዓለም
ዮም ተወለደ',
      lyrics_transliteration = 'Beza kwilu alem
Beza kwilu alem
Yom tewelede

VERSE 1
Beza kwilu alem
Beza kwilu alem
Yom tewelede',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'begol-sekebe'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤዛ ኲሉ ዓለም
ቤዛ ኲሉ ዓለም
ዮም ተወለደ

VERSE 1
ቤዛ ኲሉ ዓለም
ቤዛ ኲሉ ዓለም
ዮም ተወለደ

CHORUS
ቤዛ ኲሉ ዓለም
ቤዛ ኲሉ ዓለም
ዮም ተወለደ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beza kwilu alem
Beza kwilu alem
Yom tewelede

VERSE 1
Beza kwilu alem
Beza kwilu alem
Yom tewelede

CHORUS
Beza kwilu alem
Beza kwilu alem
Yom tewelede'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'begol-sekebe', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Begol Seke BeAtsriq Tetebilele (begol-sekebe-beatsriqt)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በጎል ሰከ በአፅርቅ ተጠብለለ /2 ጊዜ/

VERSE 1
ቤዛ ኩሉ ዓልም
ቤዛ ኩለም ዮም ተወልደ /2 ጊዜ/',
      lyrics_transliteration = 'begol seke beetsrq teteblele /2 gize/

VERSE 1
beza kulu alm
beza kulem yom tewelde /2 gize/',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'begol-sekebe-beatsriqt'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በጎል ሰከ በአፅርቅ ተጠብለለ /2 ጊዜ/

VERSE 1
ቤዛ ኩሉ ዓልም
ቤዛ ኩለም ዮም ተወልደ /2 ጊዜ/

CHORUS
በጎል ሰከ በአፅርቅ ተጠብለለ /2 ጊዜ/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
begol seke beetsrq teteblele /2 gize/

VERSE 1
beza kulu alm
beza kulem yom tewelde /2 gize/

CHORUS
begol seke beetsrq teteblele /2 gize/'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'begol-sekebe-beatsriqt', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Begol Sekebe (begol-sekebe-beatsrqt)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በጎል ሰከበ በአዕፅርቅት ተጠብለለ
ኀደረ ማኅፀነ ድንግል /2 ጊዜ/

VERSE 1
እፎ ተሴሰየ ተሴሰየ
ሀሊበ ከመ ሕፃናት ተሴሰየ /2 ጊዜ/',
      lyrics_transliteration = 'begol sekebe beetsrqt teteblele
hedere mahtsene dngl /2 gize/

VERSE 1
fo teseseye teseseye
helibe keme htsanat teseseye /2 gize/',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'begol-sekebe-beatsrqt'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በጎል ሰከበ በአዕፅርቅት ተጠብለለ
ኀደረ ማኅፀነ ድንግል /2 ጊዜ/

VERSE 1
እፎ ተሴሰየ ተሴሰየ
ሀሊበ ከመ ሕፃናት ተሴሰየ /2 ጊዜ/

CHORUS
በጎል ሰከበ በአዕፅርቅት ተጠብለለ
ኀደረ ማኅፀነ ድንግል /2 ጊዜ/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
begol sekebe beetsrqt teteblele
hedere mahtsene dngl /2 gize/

VERSE 1
fo teseseye teseseye
helibe keme htsanat teseseye /2 gize/

CHORUS
begol sekebe beetsrqt teteblele
hedere mahtsene dngl /2 gize/'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'begol-sekebe-beatsrqt', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Behazene (behazene)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 1
ለዓለም ተዘርግቶ እጄ ባዶ ሆኗል
የራሴ ላይ አክሊል ተሽቀንጥሮ ወድቋል

VERSE 2
ከኤልዛቤል ሸሽቼ መጣሁኝ ወደ አንቺ
የጎሰቆልኩትን እኔን ተመልከቺ

VERSE 3
የእግሬ መሰናክል ለዓለም ደስታ ነው
ተስፋ ቢስ መሆኔ ለጠላቴ ድል ነው

VERSE 4
የደስታ መመንጫ የኤልሳቤጥ ዘመድ
እንዳልሰናከል ምሪኝ በመንገድ

VERSE 5
ምድር ትለኛለች ተስፋ ቢስ ብቸኛ
ሳለቅስ ሳነባ አይታኛለችና

VERSE 6
ከቤተመቅደሱ ለእኔስ ዘመድ አለኝ
በሀዘኔ ሰዓት አይዞህ የምትለኝ

VERSE 7
ከአመድ የወደቀ ትንሽ ገንዘብ አለሽ
ልብሽ እራርቶልኝ ፈልጊኝ አጥብቀሽ

VERSE 8
እምነቴ እንዳይደክም እንዳልጠፋ ልጅሽ
አድጊያለሁና ከደጀ ሰላምሽ',
      lyrics_transliteration = 'Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 1
Le’alam tezergeto ejé bado honwal
Yerasé lay aklil teshqent’ro wedkwal

VERSE 2
KeElzabel shesheche metahugn wede anchi
Yegoseqolqut enén temelekchi

VERSE 3
Ye’egre mesenakel le’alam dest’a new
Tesfa bis mehoné let’elate dil new

VERSE 4
Yedest’a memenegcha yeElsabet zemed
Endalesenakel mirign bemenged

VERSE 5
Midir tilengnaletch tesfa bis bichegna
Salekis saneba aytagnaletchna

VERSE 6
KeBetemekdesu lenés zemed alegn
Behazene seat ayzoh yemitilegn

VERSE 7
Ke’amed yewodeqe tinish genzeb alesh
Libish irarto lign felign at’ibqesh

VERSE 8
Imneté endetaydekem endet’ef’a lijish
Adgiyalewna kedeje selamish',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'behazene'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 1
ለዓለም ተዘርግቶ እጄ ባዶ ሆኗል
የራሴ ላይ አክሊል ተሽቀንጥሮ ወድቋል

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 2
ከኤልዛቤል ሸሽቼ መጣሁኝ ወደ አንቺ
የጎሰቆልኩትን እኔን ተመልከቺ

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 3
የእግሬ መሰናክል ለዓለም ደስታ ነው
ተስፋ ቢስ መሆኔ ለጠላቴ ድል ነው

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 4
የደስታ መመንጫ የኤልሳቤጥ ዘመድ
እንዳልሰናከል ምሪኝ በመንገድ

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 5
ምድር ትለኛለች ተስፋ ቢስ ብቸኛ
ሳለቅስ ሳነባ አይታኛለችና

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 6
ከቤተመቅደሱ ለእኔስ ዘመድ አለኝ
በሀዘኔ ሰዓት አይዞህ የምትለኝ

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 7
ከአመድ የወደቀ ትንሽ ገንዘብ አለሽ
ልብሽ እራርቶልኝ ፈልጊኝ አጥብቀሽ

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ

VERSE 8
እምነቴ እንዳይደክም እንዳልጠፋ ልጅሽ
አድጊያለሁና ከደጀ ሰላምሽ

CHORUS
በሀዘኔ በጭንቀቴ መጽናኛዬ ነሽ ረዳቴ
እመአምላክ አደራ ድንግል እመቤቴ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 1
Le’alam tezergeto ejé bado honwal
Yerasé lay aklil teshqent’ro wedkwal

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 2
KeElzabel shesheche metahugn wede anchi
Yegoseqolqut enén temelekchi

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 3
Ye’egre mesenakel le’alam dest’a new
Tesfa bis mehoné let’elate dil new

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 4
Yedest’a memenegcha yeElsabet zemed
Endalesenakel mirign bemenged

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 5
Midir tilengnaletch tesfa bis bichegna
Salekis saneba aytagnaletchna

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 6
KeBetemekdesu lenés zemed alegn
Behazene seat ayzoh yemitilegn

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 7
Ke’amed yewodeqe tinish genzeb alesh
Libish irarto lign felign at’ibqesh

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté

VERSE 8
Imneté endetaydekem endet’ef’a lijish
Adgiyalewna kedeje selamish

CHORUS
Behazene bechinqeté mets’nagnaye nesh redaté
EmeAmlak adera Dingil embeté'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'behazene', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Beki Yitfesihu (beki-yitfesihu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ብኪ ይትፌሥሑ ዘገነት ጽጌ ጻድቃን

VERSE 1
ብኪ ይትፌሥሑ ዘገነት ጽጌ ጻድቃን',
      lyrics_transliteration = 'Beki yitfesihu zegennet tsige tsadqan

VERSE 1
Beki yitfesihu zegennet tsige tsadqan',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'beki-yitfesihu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ብኪ ይትፌሥሑ ዘገነት ጽጌ ጻድቃን

VERSE 1
ብኪ ይትፌሥሑ ዘገነት ጽጌ ጻድቃን

CHORUS
ብኪ ይትፌሥሑ ዘገነት ጽጌ ጻድቃን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beki yitfesihu zegennet tsige tsadqan

VERSE 1
Beki yitfesihu zegennet tsige tsadqan

CHORUS
Beki yitfesihu zegennet tsige tsadqan'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'beki-yitfesihu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: BEKIDANESH TILA / Orthodox memzur (bekidanesh-tila-orthodox-memzur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ

VERSE 1
ረዳት እንደሌለኝ ሲፎክርብኝ
ያስፈነድቀኛል ታሪክ ተቀይሮ
ኪዳንሽ ደርሶልኝ ቀርቶ እንጉርጉሮ
፨አዉቃለዉ እናቴ ደካማ ነኝ እኔ

VERSE 2
ሰናይ ምግባር ሳልይዝ ያበቃ ዘመኔ
ፍጹም ተስፋ ሳልቆርጥ ደጅሽን መጥናቴ
ሆነልኝ ኪዳንሽ ብርሀን ለህይወቴ
፨ልጅሽ ክንደ ብርቱ ሁሉንም ይችላል

VERSE 3
የአሸናፊ እናቱ ብጽዕት ተብለሻል
ምስክር ነኝ እኔም ሰርቷል በእኔ ላይ
ለዳመነዉ ልቤ ወጥቶልኛል ፀሐይ
፨ያለዉን ከሚሽር ከሚያሳልፍ ቃሉን

VERSE 4
ቢያሳልፍ ይቀላል ሰማይና ምድርን
እብለት በሌለበት በታመነዉ ኪዳን
ዛሬም እናታችን ልጆችሽ ታምነናል',
      lyrics_transliteration = 'Bekidansh t’la tet’elye (2)
Alfwal tilantnaye
Alfwal mekeraye (2)
Sisaleq t’elate sizebtbgn

VERSE 1
Redat endelelegn sifokrbgn
Yasfenedqegnal tarik teqeyro
Kidansh dersolgn qerto engurguro
Awuqalewu enate dekama negn ene

VERSE 2
Senay migbar salyz yabeqa zemene
Fits’um tesfa salqort’ dejshn met’nate
Honelgn kidansh birhen lehywete
Ljsh kinde birtu hulunm yichlal

VERSE 3
Yeashenafi enatu bits’et tebleshal
Miskr negn enem sertwal beene lay
Ledamenewu libe wet’tolgnal ts’ehey
Yalewun kemishr kemiyasalf qalun

VERSE 4
Biyasalf yiqelal semayna midrn
Eblet belelebet betamenewu kidan
Zarem enatachn lijochsh tamnenal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bekidanesh-tila-orthodox-memzur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ

VERSE 1
ረዳት እንደሌለኝ ሲፎክርብኝ
ያስፈነድቀኛል ታሪክ ተቀይሮ
ኪዳንሽ ደርሶልኝ ቀርቶ እንጉርጉሮ
፨አዉቃለዉ እናቴ ደካማ ነኝ እኔ

CHORUS
በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ

VERSE 2
ሰናይ ምግባር ሳልይዝ ያበቃ ዘመኔ
ፍጹም ተስፋ ሳልቆርጥ ደጅሽን መጥናቴ
ሆነልኝ ኪዳንሽ ብርሀን ለህይወቴ
፨ልጅሽ ክንደ ብርቱ ሁሉንም ይችላል

CHORUS
በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ

VERSE 3
የአሸናፊ እናቱ ብጽዕት ተብለሻል
ምስክር ነኝ እኔም ሰርቷል በእኔ ላይ
ለዳመነዉ ልቤ ወጥቶልኛል ፀሐይ
፨ያለዉን ከሚሽር ከሚያሳልፍ ቃሉን

CHORUS
በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ

VERSE 4
ቢያሳልፍ ይቀላል ሰማይና ምድርን
እብለት በሌለበት በታመነዉ ኪዳን
ዛሬም እናታችን ልጆችሽ ታምነናል

CHORUS
በኪዳንሽ ጥላ ተጠልዬ(2)
አልፏል ትላንትናዬ
አልፏል መከራዬ(2)
፨ሲሳለቅ ጠላቴ ሲዘብትብኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bekidansh t’la tet’elye (2)
Alfwal tilantnaye
Alfwal mekeraye (2)
Sisaleq t’elate sizebtbgn

VERSE 1
Redat endelelegn sifokrbgn
Yasfenedqegnal tarik teqeyro
Kidansh dersolgn qerto engurguro
Awuqalewu enate dekama negn ene

CHORUS
Bekidansh t’la tet’elye (2)
Alfwal tilantnaye
Alfwal mekeraye (2)
Sisaleq t’elate sizebtbgn

VERSE 2
Senay migbar salyz yabeqa zemene
Fits’um tesfa salqort’ dejshn met’nate
Honelgn kidansh birhen lehywete
Ljsh kinde birtu hulunm yichlal

CHORUS
Bekidansh t’la tet’elye (2)
Alfwal tilantnaye
Alfwal mekeraye (2)
Sisaleq t’elate sizebtbgn

VERSE 3
Yeashenafi enatu bits’et tebleshal
Miskr negn enem sertwal beene lay
Ledamenewu libe wet’tolgnal ts’ehey
Yalewun kemishr kemiyasalf qalun

CHORUS
Bekidansh t’la tet’elye (2)
Alfwal tilantnaye
Alfwal mekeraye (2)
Sisaleq t’elate sizebtbgn

VERSE 4
Biyasalf yiqelal semayna midrn
Eblet belelebet betamenewu kidan
Zarem enatachn lijochsh tamnenal

CHORUS
Bekidansh t’la tet’elye (2)
Alfwal tilantnaye
Alfwal mekeraye (2)
Sisaleq t’elate sizebtbgn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bekidanesh-tila-orthodox-memzur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Belelit Mezimur Yesetehegn (belelit-mezimur-yesetehegn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 1
ማለዳ ከእንቅልፌ ስነቃ
እንድሆን የክብህ ምርጥ እቃ
ልትሰራ በእኔ በባሪያህ
በቃልህ ውስጤን አበራህ

VERSE 2
የትናንት የያዘኝ ቀንበር
ዛሬ ላይ የለም ክፉው ምክር
ለምልሟል የልቤ በረሃ
ተረጭቶ ልቤ ጥሩ ውሃ

VERSE 3
ወጋግኗል የፅልመቱ ኑሮ
ህይወቴ ልቤ አንተን አክብሮ
ማጉረምረም የለም በአንደበቴ
ስላለህ ኢየሱስ በቤቴ

VERSE 4
ደስታ ነው የፍስሃ ዘመን
መች ያፍራል ባንተ የሚታመን
ትካዜ ልቅሶው ተወግዷል
ማመስገን ህይወታችን ሆኗል

VERSE 5
ከዚያኛት ከጨለማው ወራት
ጎትተህ ጠርተኸኝ ለምህረት
ዝምታን ለምን እሺ እላለሁ
ፅድቅህን ማምለጤን እያየሁ

VERSE 6
አንተማ ትለያለህ ለእኔ
የዜማ ባንተ ሆኗል ቀኔ
ቢሆንም ባይሆንም ከእንግዲህ
አልውልም በዜማ ሳልጠራህ',
      lyrics_transliteration = 'Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk

VERSE 1
Maleda keenqlfe sineqa
Endhon yekbh mirt’ eqa
Litsera beene bebariyah
Beqalh wist’en aberah

VERSE 2
Yetnant yeyazegn qenber
Zare lay yelem kifuw mikr
Lemlmwal yelbe bereha
Terech’to libe t’ru wiha

VERSE 3
Wegagnwal yets’lmetu nuro
Hiywete libe anten akbro
Maguremrem yelem beandebete
Silaleh Iyesus bebete

VERSE 4
Desta new yefsha zemen
Mech yafral bante yemitamen
Tikaze liqsow tewegdwal
Mamesgen hiywetachn honwal

VERSE 5
Keziyagnat kech’elemaw werat
Gotteh t’erteኸgn lemhret
Zimtan lemn eshi elalehu
Ts’dqhn mamlet’en eyayehu

VERSE 6
Antema tileyaleh leene
Yezema bante honwal qene
Bihonm bayhonm keengdih
Alwlm bezema salt’erah',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'belelit-mezimur-yesetehegn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 1
ማለዳ ከእንቅልፌ ስነቃ
እንድሆን የክብህ ምርጥ እቃ
ልትሰራ በእኔ በባሪያህ
በቃልህ ውስጤን አበራህ

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 2
የትናንት የያዘኝ ቀንበር
ዛሬ ላይ የለም ክፉው ምክር
ለምልሟል የልቤ በረሃ
ተረጭቶ ልቤ ጥሩ ውሃ

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 3
ወጋግኗል የፅልመቱ ኑሮ
ህይወቴ ልቤ አንተን አክብሮ
ማጉረምረም የለም በአንደበቴ
ስላለህ ኢየሱስ በቤቴ

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 4
ደስታ ነው የፍስሃ ዘመን
መች ያፍራል ባንተ የሚታመን
ትካዜ ልቅሶው ተወግዷል
ማመስገን ህይወታችን ሆኗል

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 5
ከዚያኛት ከጨለማው ወራት
ጎትተህ ጠርተኸኝ ለምህረት
ዝምታን ለምን እሺ እላለሁ
ፅድቅህን ማምለጤን እያየሁ

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ

VERSE 6
አንተማ ትለያለህ ለእኔ
የዜማ ባንተ ሆኗል ቀኔ
ቢሆንም ባይሆንም ከእንግዲህ
አልውልም በዜማ ሳልጠራህ

CHORUS
በሌሊት መዝሙር የሰጠኸኝ
የማይነጥፍ ቅኔን ያስታጠቅከኝ
እግዚአብሔር የልጅነቴ አምላክ
እኖራለሁ ፍቅርህን ስተርክ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk

VERSE 1
Maleda keenqlfe sineqa
Endhon yekbh mirt’ eqa
Litsera beene bebariyah
Beqalh wist’en aberah

CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk

VERSE 2
Yetnant yeyazegn qenber
Zare lay yelem kifuw mikr
Lemlmwal yelbe bereha
Terech’to libe t’ru wiha

CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk

VERSE 3
Wegagnwal yets’lmetu nuro
Hiywete libe anten akbro
Maguremrem yelem beandebete
Silaleh Iyesus bebete

CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk

VERSE 4
Desta new yefsha zemen
Mech yafral bante yemitamen
Tikaze liqsow tewegdwal
Mamesgen hiywetachn honwal

CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk

VERSE 5
Keziyagnat kech’elemaw werat
Gotteh t’erteኸgn lemhret
Zimtan lemn eshi elalehu
Ts’dqhn mamlet’en eyayehu

CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk

VERSE 6
Antema tileyaleh leene
Yezema bante honwal qene
Bihonm bayhonm keengdih
Alwlm bezema salt’erah

CHORUS
Belelit mezmur yeset’eኸgn
Yemaynet’f qinen yastat’eqkegn
Egziabher yeljnete amlak
Enoralehu fiqrhn siterk'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'belelit-mezimur-yesetehegn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Belibe Ketema Temelalesibet (belibe-ketema-temelalesibet)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'የዘለአለም
ንጉስ የልዑል አለም
ምስጋና ይድረስ
የየሱስ ክርስቶስ

VERSE 1
የእመቤታችን
ሌሊት የሚታዘዙልህ
ምስጋና ይድረስ
የየሱስ ክርስቶስ

VERSE 2
በልቤ ከተማ ተመላለስበት
ይረጋል ህይወቴ አንተ ስታልፍበት
አንተ ስታልፍበት
ወደልፈኝ ግባ እረበም ጣፌ

VERSE 3
እንዳመልከ ጌታህን ባየን አርግፈህ
እምባዬን አርግፈህ
በልቤ ከተማ ተመላለስበት
ይረጋል ህይወቴ አንተ ስታልፍበት

VERSE 4
ጌታ ስታልፍበት
ወደልፈኝ ግባ እረበም ጣፌ
እንዳመልከ ጌታህን ባየን አርግፈህ
እምባዬን አርግፈህ

VERSE 5
ባለጸጋ ሰጥቶ ውድህ ሆሽ ከበዋል
ለንግብና ዙፋን አህያን መርተሃል
አጀብ አትፈልግም አውቅሃለሁ ጌታ
ብቻህን ነበረ ድጅህን ስትመታ

VERSE 6
በጠላት አሰራር ባሻዬ ሆንኩት
ስራኝ እንደገና ቤተ መቅደስን
በጠላት አሰራር ባሻዬ ሆንኩት
ስራኝ እንደገና ቤተ መቅደስን

VERSE 7
በልቤ ከተማ ተመላለስበት
ይረጋል ህይወቴ አንተ ስታልፍበት
አንተ ስታልፍበት
ወደልፈኝ ግባ እረበም ጣፌ

VERSE 8
እንዳመልከ ጌታህን ባየን አርግፈህ
እምባዬን አርግፈህ
ማዕበል ህይወቴ እግዜአብሄር በሚለው
እንደምን ይረቃል ጌታዬ ሳትሰርው

VERSE 9
ተራመድ በልቤ በሞገስ በግርማ
እየሱስ ነህ አንተ የምስኪኑ ማማ
በጠላት አሰራር ባሻዬ ሆንኩት
ስራኝ እንደገና ቤተ መቅደስን

VERSE 10
በጠላት አሰራር ባሻዬ ሆንኩት
ስራኝ እንደገና ቤተ መቅደስን
በልቤ ከተማ ተመላለስበት
ይረጋል ህይወቴ አንተ ስታልፍበት

VERSE 11
ጌታ ስታልፍበት
ወደልፈኝ ግባ እረበም ጣፌ
እንዳመልከ ጌታህን ባየን አርግፈህ
እምባዬን አርግፈህ',
      lyrics_transliteration = 'Yezelealem
Nigus yelul alem
Misgana yidres
Yeyesus Kristos

VERSE 1
Yeemebetachn
Lelit yemitazezulh
Misgana yidres
Yeyesus Kristos

VERSE 2
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Ante sitalfbet
Wedelfegn giba erebem t’afe

VERSE 3
Endamelke getahn bayen argfeh
Embayen argfeh
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet

VERSE 4
Geta sitalfbet
Wedelfegn giba erebem t’afe
Endamelke getahn bayen argfeh
Embayen argfeh

VERSE 5
Balets’ega set’to widh hosh kebewal
Lengbna zufan ahyan mertehal
Ajeb atfelgm awqhalehu Geta
Bichahn nebere dijhn sitmeta

VERSE 6
Bet’elat aserar bashaye honkut
Siragn endegena bete meqdesn
Bet’elat aserar bashaye honkut
Siragn endegena bete meqdesn

VERSE 7
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Ante sitalfbet
Wedelfegn giba erebem t’afe

VERSE 8
Endamelke getahn bayen argfeh
Embayen argfeh
Maebel hiywete egzeabher bemilew
Endemn yireqal Getaye satserw

VERSE 9
Teramed belbe bemoges begrma
Eyesus neh ante yemskinu mama
Bet’elat aserar bashaye honkut
Siragn endegena bete meqdesn

VERSE 10
Bet’elat aserar bashaye honkut
Siragn endegena bete meqdesn
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet

VERSE 11
Geta sitalfbet
Wedelfegn giba erebem t’afe
Endamelke getahn bayen argfeh
Embayen argfeh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'belibe-ketema-temelalesibet'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የዘለአለም
ንጉስ የልዑል አለም
ምስጋና ይድረስ
የየሱስ ክርስቶስ

VERSE 1
የእመቤታችን
ሌሊት የሚታዘዙልህ
ምስጋና ይድረስ
የየሱስ ክርስቶስ

CHORUS
የዘለአለም
ንጉስ የልዑል አለም
ምስጋና ይድረስ
የየሱስ ክርስቶስ

VERSE 2
በልቤ ከተማ ተመላለስበት
ይረጋል ህይወቴ አንተ ስታልፍበት
አንተ ስታልፍበት
ወደልፈኝ ግባ እረበም ጣፌ

CHORUS
የዘለአለም
ንጉስ የልዑል አለም
ምስጋና ይድረስ
የየሱስ ክርስቶስ

VERSE 3
እንዳመልከ ጌታህን ባየን አርግፈህ
እምባዬን አርግፈህ
በልቤ ከተማ ተመላለስበት
ይረጋል ህይወቴ አንተ ስታልፍበት

CHORUS
የዘለአለም
ንጉስ የልዑል አለም
ምስጋና ይድረስ
የየሱስ ክርስቶስ

VERSE 4
ጌታ ስታልፍበት
ወደልፈኝ ግባ እረበም ጣፌ
እንዳመልከ ጌታህን ባየን አርግፈህ
እምባዬን አርግፈህ

CHORUS
የዘለአለም
ንጉስ የልዑል አለም
ምስጋና ይድረስ
የየሱስ ክርስቶስ

VERSE 5
ባለጸጋ ሰጥቶ ውድህ ሆሽ ከበዋል
ለንግብና ዙፋን አህያን መርተሃል
አጀብ አትፈልግም አውቅሃለሁ ጌታ
ብቻህን ነበረ ድጅህን ስትመታ

CHORUS
የዘለአለም
ንጉስ የልዑል አለም
ምስጋና ይድረስ
የየሱስ ክርስቶስ

VERSE 6
በጠላት አሰራር ባሻዬ ሆንኩት
ስራኝ እንደገና ቤተ መቅደስን
በጠላት አሰራር ባሻዬ ሆንኩት
ስራኝ እንደገና ቤተ መቅደስን

CHORUS
የዘለአለም
ንጉስ የልዑል አለም
ምስጋና ይድረስ
የየሱስ ክርስቶስ

VERSE 7
በልቤ ከተማ ተመላለስበት
ይረጋል ህይወቴ አንተ ስታልፍበት
አንተ ስታልፍበት
ወደልፈኝ ግባ እረበም ጣፌ

CHORUS
የዘለአለም
ንጉስ የልዑል አለም
ምስጋና ይድረስ
የየሱስ ክርስቶስ

VERSE 8
እንዳመልከ ጌታህን ባየን አርግፈህ
እምባዬን አርግፈህ
ማዕበል ህይወቴ እግዜአብሄር በሚለው
እንደምን ይረቃል ጌታዬ ሳትሰርው

CHORUS
የዘለአለም
ንጉስ የልዑል አለም
ምስጋና ይድረስ
የየሱስ ክርስቶስ

VERSE 9
ተራመድ በልቤ በሞገስ በግርማ
እየሱስ ነህ አንተ የምስኪኑ ማማ
በጠላት አሰራር ባሻዬ ሆንኩት
ስራኝ እንደገና ቤተ መቅደስን

CHORUS
የዘለአለም
ንጉስ የልዑል አለም
ምስጋና ይድረስ
የየሱስ ክርስቶስ

VERSE 10
በጠላት አሰራር ባሻዬ ሆንኩት
ስራኝ እንደገና ቤተ መቅደስን
በልቤ ከተማ ተመላለስበት
ይረጋል ህይወቴ አንተ ስታልፍበት

CHORUS
የዘለአለም
ንጉስ የልዑል አለም
ምስጋና ይድረስ
የየሱስ ክርስቶስ

VERSE 11
ጌታ ስታልፍበት
ወደልፈኝ ግባ እረበም ጣፌ
እንዳመልከ ጌታህን ባየን አርግፈህ
እምባዬን አርግፈህ

CHORUS
የዘለአለም
ንጉስ የልዑል አለም
ምስጋና ይድረስ
የየሱስ ክርስቶስ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yezelealem
Nigus yelul alem
Misgana yidres
Yeyesus Kristos

VERSE 1
Yeemebetachn
Lelit yemitazezulh
Misgana yidres
Yeyesus Kristos

CHORUS
Yezelealem
Nigus yelul alem
Misgana yidres
Yeyesus Kristos

VERSE 2
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Ante sitalfbet
Wedelfegn giba erebem t’afe

CHORUS
Yezelealem
Nigus yelul alem
Misgana yidres
Yeyesus Kristos

VERSE 3
Endamelke getahn bayen argfeh
Embayen argfeh
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet

CHORUS
Yezelealem
Nigus yelul alem
Misgana yidres
Yeyesus Kristos

VERSE 4
Geta sitalfbet
Wedelfegn giba erebem t’afe
Endamelke getahn bayen argfeh
Embayen argfeh

CHORUS
Yezelealem
Nigus yelul alem
Misgana yidres
Yeyesus Kristos

VERSE 5
Balets’ega set’to widh hosh kebewal
Lengbna zufan ahyan mertehal
Ajeb atfelgm awqhalehu Geta
Bichahn nebere dijhn sitmeta

CHORUS
Yezelealem
Nigus yelul alem
Misgana yidres
Yeyesus Kristos

VERSE 6
Bet’elat aserar bashaye honkut
Siragn endegena bete meqdesn
Bet’elat aserar bashaye honkut
Siragn endegena bete meqdesn

CHORUS
Yezelealem
Nigus yelul alem
Misgana yidres
Yeyesus Kristos

VERSE 7
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Ante sitalfbet
Wedelfegn giba erebem t’afe

CHORUS
Yezelealem
Nigus yelul alem
Misgana yidres
Yeyesus Kristos

VERSE 8
Endamelke getahn bayen argfeh
Embayen argfeh
Maebel hiywete egzeabher bemilew
Endemn yireqal Getaye satserw

CHORUS
Yezelealem
Nigus yelul alem
Misgana yidres
Yeyesus Kristos

VERSE 9
Teramed belbe bemoges begrma
Eyesus neh ante yemskinu mama
Bet’elat aserar bashaye honkut
Siragn endegena bete meqdesn

CHORUS
Yezelealem
Nigus yelul alem
Misgana yidres
Yeyesus Kristos

VERSE 10
Bet’elat aserar bashaye honkut
Siragn endegena bete meqdesn
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet

CHORUS
Yezelealem
Nigus yelul alem
Misgana yidres
Yeyesus Kristos

VERSE 11
Geta sitalfbet
Wedelfegn giba erebem t’afe
Endamelke getahn bayen argfeh
Embayen argfeh

CHORUS
Yezelealem
Nigus yelul alem
Misgana yidres
Yeyesus Kristos'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'belibe-ketema-temelalesibet', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Belibe Ketema Temelalesibet (belibe-ketema-temelalesibet-3746)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 1
ባለፀጋ ስትሆን ድሆች ከበውሃል
ለንግስና ዙፋን አህያን መርጠሃል
አጀብ አትፈልግም አውቃለሁ ጌታ
ብቻህን ነበረ ደጄን ስትመታ

VERSE 2
ለጠላቴ አሰራር ዋሻ የሆንኩትን
ስራኝ እንደ ገና ቤተ መቅደስህን
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት

VERSE 3
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)
ድንግዝግዝ ኑሮዬ በምራቅህ ይብራ
ጨለማ አይዝህም አንተ ስትሰራ

VERSE 4
ማረኝ ያለህ እጆች ሲያሸበሽቡልህ
ሰምቼ አልቀረሁም በብርሃን አየሁህ
ለጠላቴ አሰራር ዋሻ የሆንኩትን
ስራኝ እንደ ገና ቤተ መቅደስህን

VERSE 5
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 6
ከያዕቆብ ጉድጓድ ብቀዳም አብዝቼ
ዛሬም በጥማት ነኝ ከቶ መች ረክቼ
የህይወት ውሃ ምንጭ ነፍስን የምትመልስ
በበረሃው ልቤ ለዘላለም ፍሰስ

VERSE 7
ለጠላቴ አሰራር ዋሻ የሆንኩትን
ስራኝ እንደ ገና ቤተ መቅደስህን',
      lyrics_transliteration = 'Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 1
Balets’ega sithon dihoch kebewhal
Lengsna zufan ahyan mert’ehal
Ajeb atfelgm awqalehu Geta
Bichahn nebere dejen sitmeta

VERSE 2
Let’elate aserar washa yehonkutn
Siragn ende gena bete meqdeshn
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet

VERSE 3
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)
Dingzgz nuroye bemraqh yibra
Ch’elema ayzhm ante sitsera

VERSE 4
Maregn yaleh ejoch siyashebeshbulh
Semche alqerehum bebrhan ayehuh
Let’elate aserar washa yehonkutn
Siragn ende gena bete meqdeshn

VERSE 5
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 6
Keyaeqob gudgwad biqedam abzche
Zarem bet’mat negn keto mech rekche
Yehywet wiha minch’ nefsn yemtmels
Beberehaw libe lezelalem fises

VERSE 7
Let’elate aserar washa yehonkutn
Siragn ende gena bete meqdeshn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'belibe-ketema-temelalesibet-3746'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 1
ባለፀጋ ስትሆን ድሆች ከበውሃል
ለንግስና ዙፋን አህያን መርጠሃል
አጀብ አትፈልግም አውቃለሁ ጌታ
ብቻህን ነበረ ደጄን ስትመታ

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 2
ለጠላቴ አሰራር ዋሻ የሆንኩትን
ስራኝ እንደ ገና ቤተ መቅደስህን
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 3
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)
ድንግዝግዝ ኑሮዬ በምራቅህ ይብራ
ጨለማ አይዝህም አንተ ስትሰራ

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 4
ማረኝ ያለህ እጆች ሲያሸበሽቡልህ
ሰምቼ አልቀረሁም በብርሃን አየሁህ
ለጠላቴ አሰራር ዋሻ የሆንኩትን
ስራኝ እንደ ገና ቤተ መቅደስህን

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 5
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 6
ከያዕቆብ ጉድጓድ ብቀዳም አብዝቼ
ዛሬም በጥማት ነኝ ከቶ መች ረክቼ
የህይወት ውሃ ምንጭ ነፍስን የምትመልስ
በበረሃው ልቤ ለዘላለም ፍሰስ

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)

VERSE 7
ለጠላቴ አሰራር ዋሻ የሆንኩትን
ስራኝ እንደ ገና ቤተ መቅደስህን

CHORUS
በልቤ ከተማ ተመላለስበት
ይረጋል ሕይወቴ አንተ ስታልፍበት
ወደልፍኜ ግባ እረፍ በምንጣፌ
እንዳመልክህ ጌታ እንባዬን አርግፌ(2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 1
Balets’ega sithon dihoch kebewhal
Lengsna zufan ahyan mert’ehal
Ajeb atfelgm awqalehu Geta
Bichahn nebere dejen sitmeta

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 2
Let’elate aserar washa yehonkutn
Siragn ende gena bete meqdeshn
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 3
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)
Dingzgz nuroye bemraqh yibra
Ch’elema ayzhm ante sitsera

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 4
Maregn yaleh ejoch siyashebeshbulh
Semche alqerehum bebrhan ayehuh
Let’elate aserar washa yehonkutn
Siragn ende gena bete meqdeshn

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 5
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 6
Keyaeqob gudgwad biqedam abzche
Zarem bet’mat negn keto mech rekche
Yehywet wiha minch’ nefsn yemtmels
Beberehaw libe lezelalem fises

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)

VERSE 7
Let’elate aserar washa yehonkutn
Siragn ende gena bete meqdeshn

CHORUS
Belbe ketema temelalesbet
Yiregal hiywete ante sitalfbet
Wedelfgne giba eref bemnt’afe
Endamelkh Geta enbayen argfe (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'belibe-ketema-temelalesibet-3746', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Believe In The Lord (believe-in-the-lord)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረድ አዝንቦ  ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ ያተነነ
ነገር ለወጠ ሁሉ በእርሱ ሆነ

VERSE 1
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረድ አዝንቦ  ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ ያተነነ
ነገር ለወጠ ሁሉ በእርሱ ሆነ',
      lyrics_transliteration = 'Emenu be''ersu dinik yadergal geta
Bered aznbo telat eyemeta
Wukiyanosi tilqun fet''no yatenena
Neger lewete hulu be''ersu hone

VERSE 1
Emenu be''ersu dinik yadergal geta
Bered aznbo telat eyemeta
Wukiyanosi tilqun fet''no yatenena
Neger lewete hulu be''ersu hone',
      lyrics_english = 'Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made

VERSE 1
Believe in the Lord, The mountain is ablaze
Believe in the Lord, The valley disarranged
Believe in the Lord, The evergreen is crushed
Believe in the Lord, and the rock ground to dust

VERSE 2
Believe in the Lord, the gentiles’ statues
Believe in the Lord, before Him were no more
Believe in the Lord, Those who invoked His name
Believe in the Lord, sailed calmly through the storms

VERSE 3
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made

VERSE 4
Believe in the Lord, the sun will always rise
Believe in the Lord, every day becomes night
Believe in the Lord, He can perform all things
Believe in the Lord, our Savior, our Might

VERSE 5
Believe in the Lord, to us He is Lord Love
Believe in the Lord, Father of creation
Believe in the Lord, He looks down from above
Believe in the Lord, His hands are stretched to us

VERSE 6
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made

VERSE 7
Believe in the Lord, we have a sturdy boat
Believe in the Lord, no storm or waves can break
Believe in the Lord, so we won’t fear henceforth
Believe in the Lord, our lives He won’t forsake

VERSE 8
Believe in the Lord, The enemy has lost
Believe in the Lord, Satan is put to shame
Believe in the Lord, let the prisons rejoice
Believe in the Lord, with joyful hymns of praise

VERSE 9
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made

VERSE 10
Believe in the Lord, The crafty lies of foes
Believe in the Lord, are empty, have no might
Believe in the Lord, Emmanuel Logos
Believe in the Lord, is with us through our plight

VERSE 11
Believe in the Lord, when our Lord bestows
Believe in the Lord, His grace which is plenty
Believe in the Lord, we will stand atop death
Believe in the Lord, singing hymns joyfully

VERSE 12
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'believe-in-the-lord'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረድ አዝንቦ  ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ ያተነነ
ነገር ለወጠ ሁሉ በእርሱ ሆነ

VERSE 1
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረድ አዝንቦ  ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ ያተነነ
ነገር ለወጠ ሁሉ በእርሱ ሆነ

CHORUS
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረድ አዝንቦ  ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ ያተነነ
ነገር ለወጠ ሁሉ በእርሱ ሆነ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emenu be''ersu dinik yadergal geta
Bered aznbo telat eyemeta
Wukiyanosi tilqun fet''no yatenena
Neger lewete hulu be''ersu hone

VERSE 1
Emenu be''ersu dinik yadergal geta
Bered aznbo telat eyemeta
Wukiyanosi tilqun fet''no yatenena
Neger lewete hulu be''ersu hone

CHORUS
Emenu be''ersu dinik yadergal geta
Bered aznbo telat eyemeta
Wukiyanosi tilqun fet''no yatenena
Neger lewete hulu be''ersu hone'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made

VERSE 1
Believe in the Lord, The mountain is ablaze
Believe in the Lord, The valley disarranged
Believe in the Lord, The evergreen is crushed
Believe in the Lord, and the rock ground to dust

CHORUS
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made

VERSE 2
Believe in the Lord, the gentiles’ statues
Believe in the Lord, before Him were no more
Believe in the Lord, Those who invoked His name
Believe in the Lord, sailed calmly through the storms

CHORUS
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made

VERSE 3
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made

CHORUS
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made

VERSE 4
Believe in the Lord, the sun will always rise
Believe in the Lord, every day becomes night
Believe in the Lord, He can perform all things
Believe in the Lord, our Savior, our Might

CHORUS
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made

VERSE 5
Believe in the Lord, to us He is Lord Love
Believe in the Lord, Father of creation
Believe in the Lord, He looks down from above
Believe in the Lord, His hands are stretched to us

CHORUS
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made

VERSE 6
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made

CHORUS
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made

VERSE 7
Believe in the Lord, we have a sturdy boat
Believe in the Lord, no storm or waves can break
Believe in the Lord, so we won’t fear henceforth
Believe in the Lord, our lives He won’t forsake

CHORUS
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made

VERSE 8
Believe in the Lord, The enemy has lost
Believe in the Lord, Satan is put to shame
Believe in the Lord, let the prisons rejoice
Believe in the Lord, with joyful hymns of praise

CHORUS
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made

VERSE 9
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made

CHORUS
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made

VERSE 10
Believe in the Lord, The crafty lies of foes
Believe in the Lord, are empty, have no might
Believe in the Lord, Emmanuel Logos
Believe in the Lord, is with us through our plight

CHORUS
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made

VERSE 11
Believe in the Lord, when our Lord bestows
Believe in the Lord, His grace which is plenty
Believe in the Lord, we will stand atop death
Believe in the Lord, singing hymns joyfully

CHORUS
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made

VERSE 12
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made

CHORUS
Believe in the Lord, He works wonders and feats
Sending hail down and striking his enemies
By his might the depths, and the seas became haze
He changed the outcome, by Him all things were made'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'believe-in-the-lord', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bemahitsen Kine (bemahitsen-kine)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በማህፀን ቅኔ ለማርያም ተሰማ
በተራራማው ሀገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሀ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 1
የእናቱ ማህፀን የቅኔ ርስቱ ነች
ድንግል ያምላክ እናት ፊቱ ስለቆመች
በሀሴት ዘለለ ዘመረ በደስታ
ከድንግል ሲወጣ ታላቁ ሰላምታ

VERSE 2
በድንግል ማህፀን ስላየ ጌታውን
ከመወለድ ቀድሞ ሰማነው መዝሙሩን
ትንቢቱ ሲፈፀም በሆዳ ሲነግስ
ሰገደ ላምላኩ የስድስት ወር ፅንስ

VERSE 3
ጀመረ ስብከቱን ገና ሳይወለድ
ተፈጥሮ መቼ አለው ነብዩን ለማገድ
አፉ ተከፈተ በታላቅ ምስጋና
በናቱ ማህፀን ድምፅን አሰማና

VERSE 4
የዮሐንስ እናት ኤልሳቤት ገረማት
ልጆ በማህፀን ቅኔ ሲቀኝባት
ድምፆን ከፍ አረገች ሀገር እንዲሰማት
ሞላት መንፍስ ቅድስ ለ',
      lyrics_transliteration = 'Bemahts’en qine leMaryam tesema
Beteraramaw heger beefrem ketema
Yohens yinager berehe yadegew
Dingil sitnager min endazelelew

VERSE 1
Yeenatu mahts’en yeqne ristu nech
Dingil yamlak enat fitu sileqomech
Beheset zelele zemere bedesta
Kedngl siwet’a talaqu selamta

VERSE 2
Bedngl mahts’en silaye getawn
Kemeweled qedmo semanew mezmurun
Tinbitu sifets’em behoda sinegs
Segede lamlaku yesdst wer ts’ns

VERSE 3
Jemere sibketun gena sayweled
Tefet’ro meche alew nebyun lemaged
Afu tekefete betalaq misgana
Benatu mahts’en dimts’n asemana

VERSE 4
Yeyohens enat elsabet geremat
Lijo bemahts’en qine siqegnbat
Dimts’on kef aregech heger endisemat
Molat menfs qids le',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bemahitsen-kine'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በማህፀን ቅኔ ለማርያም ተሰማ
በተራራማው ሀገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሀ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 1
የእናቱ ማህፀን የቅኔ ርስቱ ነች
ድንግል ያምላክ እናት ፊቱ ስለቆመች
በሀሴት ዘለለ ዘመረ በደስታ
ከድንግል ሲወጣ ታላቁ ሰላምታ

CHORUS
በማህፀን ቅኔ ለማርያም ተሰማ
በተራራማው ሀገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሀ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 2
በድንግል ማህፀን ስላየ ጌታውን
ከመወለድ ቀድሞ ሰማነው መዝሙሩን
ትንቢቱ ሲፈፀም በሆዳ ሲነግስ
ሰገደ ላምላኩ የስድስት ወር ፅንስ

CHORUS
በማህፀን ቅኔ ለማርያም ተሰማ
በተራራማው ሀገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሀ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 3
ጀመረ ስብከቱን ገና ሳይወለድ
ተፈጥሮ መቼ አለው ነብዩን ለማገድ
አፉ ተከፈተ በታላቅ ምስጋና
በናቱ ማህፀን ድምፅን አሰማና

CHORUS
በማህፀን ቅኔ ለማርያም ተሰማ
በተራራማው ሀገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሀ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 4
የዮሐንስ እናት ኤልሳቤት ገረማት
ልጆ በማህፀን ቅኔ ሲቀኝባት
ድምፆን ከፍ አረገች ሀገር እንዲሰማት
ሞላት መንፍስ ቅድስ ለ

CHORUS
በማህፀን ቅኔ ለማርያም ተሰማ
በተራራማው ሀገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሀ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bemahts’en qine leMaryam tesema
Beteraramaw heger beefrem ketema
Yohens yinager berehe yadegew
Dingil sitnager min endazelelew

VERSE 1
Yeenatu mahts’en yeqne ristu nech
Dingil yamlak enat fitu sileqomech
Beheset zelele zemere bedesta
Kedngl siwet’a talaqu selamta

CHORUS
Bemahts’en qine leMaryam tesema
Beteraramaw heger beefrem ketema
Yohens yinager berehe yadegew
Dingil sitnager min endazelelew

VERSE 2
Bedngl mahts’en silaye getawn
Kemeweled qedmo semanew mezmurun
Tinbitu sifets’em behoda sinegs
Segede lamlaku yesdst wer ts’ns

CHORUS
Bemahts’en qine leMaryam tesema
Beteraramaw heger beefrem ketema
Yohens yinager berehe yadegew
Dingil sitnager min endazelelew

VERSE 3
Jemere sibketun gena sayweled
Tefet’ro meche alew nebyun lemaged
Afu tekefete betalaq misgana
Benatu mahts’en dimts’n asemana

CHORUS
Bemahts’en qine leMaryam tesema
Beteraramaw heger beefrem ketema
Yohens yinager berehe yadegew
Dingil sitnager min endazelelew

VERSE 4
Yeyohens enat elsabet geremat
Lijo bemahts’en qine siqegnbat
Dimts’on kef aregech heger endisemat
Molat menfs qids le

CHORUS
Bemahts’en qine leMaryam tesema
Beteraramaw heger beefrem ketema
Yohens yinager berehe yadegew
Dingil sitnager min endazelelew'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bemahitsen-kine', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bemeljash komiyalehu Zemarit Betselot Asmare (bemeljash-komiyalehu-zemarit-betselot-asmare)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 1
ጉድለቴን ታውቂያለሽ ገና ሳልነግርሽ
ሸክሜን ማሶገጃ ሆኖኛል ጸሎትሽ
ስዕልሽ ፊት ቆሜ የልቤን ስነግርሽ
ሁሉን አርጎልኛል የታመነው ልጅሽ

VERSE 2
በምልጃሽ ቆሚያለው በምልጃሽ
ሰላሜ ነሽ ማርያም ሰላሜ ነሽ
የነገርኩሽ ሁሉ መቼ ከንቱ ቀርቷል
ውጥኔ ተሳክቶ ጎዶሎዬ ሞልቷል

VERSE 3
ጥላሽ ሸፍኖኛል በባእድ ሃገር
ለኔ በዙ አድርጓል ድንገል ያንቺ ፍቅር
በዛ በሞት ስፍራ በመስቀሉ ዳገት
ስጦታ ያገኘሁሽ በመከራው እለት

VERSE 4
ፊትሽ ተንበርክኬ ክብርን ሰጥሻለው
ፍቅርሽ ጥግ የለውም ይሄንን አውቃለው
በጭንቀቴ ግዜ በሃዘኔ ሰዓት
የምታረጋጊኝ የሆንሽኝ መጽናናት

VERSE 5
የመማጸኛዬ ከተማ ነሽ ማርያም
ዘምርልሻለው ለዓለም ለዘላለም
የነገርኩሽ ሁሉ መቼ ከንቱ ቀርቷል
ውጥኔ ተሳክቶ ጎዶሎዬ ሞልቷል

VERSE 6
ጥላሽ ሸፍኖኛል በባእድ ሃገር
ለኔ በዙ አድርጓል ድንገል ያንቺ ፍቅር
በዛ በሞት ስፍራ በመስቀሉ ዳገት
ስጦታ ያገኘውሽ በመከራው እለት

VERSE 7
ፊትሽ ተንበርክኬ ክብርን ሰጥሻለው
ፍቅርሽ ጥግ የለውም ይሄንን አውቃለው',
      lyrics_transliteration = 'Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 1
Gudleten tawqiyalesh gena salnegrsh
Shekmen masogeja honognal ts’elotsh
Sielsh fit qome yelben sinegrsh
Hulun argolgnal yetamenew lijsh

VERSE 2
Bemljash qomiyalew bemljash
Selame nesh Maryam selame nesh
Yenegerkush hulu meche kentu qertwal
Wit’ne tesakto godoloye moltwal

VERSE 3
T’lash shefnognal bebaed hager
Lene bezu adrgwal dingel yanchi fiqr
Beza bemot sifra bemesqelu daget
Sit’ota yagegnehush bemekeraw elet

VERSE 4
Fitsh tenberkke kibrn set’shalew
Fiqrsh t’g yelewm yihenn awqalew
Bech’nqete gize behazene seat
Yemtaregagign yehonshgn mets’nanat

VERSE 5
Yememats’egnaye ketema nesh Maryam
Zemrlshalew lealem lezelalem
Yenegerkush hulu meche kentu qertwal
Wit’ne tesakto godoloye moltwal

VERSE 6
T’lash shefnognal bebaed hager
Lene bezu adrgwal dingel yanchi fiqr
Beza bemot sifra bemesqelu daget
Sit’ota yagegnewsh bemekeraw elet

VERSE 7
Fitsh tenberkke kibrn set’shalew
Fiqrsh t’g yelewm yihenn awqalew',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bemeljash-komiyalehu-zemarit-betselot-asmare'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 1
ጉድለቴን ታውቂያለሽ ገና ሳልነግርሽ
ሸክሜን ማሶገጃ ሆኖኛል ጸሎትሽ
ስዕልሽ ፊት ቆሜ የልቤን ስነግርሽ
ሁሉን አርጎልኛል የታመነው ልጅሽ

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 2
በምልጃሽ ቆሚያለው በምልጃሽ
ሰላሜ ነሽ ማርያም ሰላሜ ነሽ
የነገርኩሽ ሁሉ መቼ ከንቱ ቀርቷል
ውጥኔ ተሳክቶ ጎዶሎዬ ሞልቷል

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 3
ጥላሽ ሸፍኖኛል በባእድ ሃገር
ለኔ በዙ አድርጓል ድንገል ያንቺ ፍቅር
በዛ በሞት ስፍራ በመስቀሉ ዳገት
ስጦታ ያገኘሁሽ በመከራው እለት

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 4
ፊትሽ ተንበርክኬ ክብርን ሰጥሻለው
ፍቅርሽ ጥግ የለውም ይሄንን አውቃለው
በጭንቀቴ ግዜ በሃዘኔ ሰዓት
የምታረጋጊኝ የሆንሽኝ መጽናናት

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 5
የመማጸኛዬ ከተማ ነሽ ማርያም
ዘምርልሻለው ለዓለም ለዘላለም
የነገርኩሽ ሁሉ መቼ ከንቱ ቀርቷል
ውጥኔ ተሳክቶ ጎዶሎዬ ሞልቷል

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 6
ጥላሽ ሸፍኖኛል በባእድ ሃገር
ለኔ በዙ አድርጓል ድንገል ያንቺ ፍቅር
በዛ በሞት ስፍራ በመስቀሉ ዳገት
ስጦታ ያገኘውሽ በመከራው እለት

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ

VERSE 7
ፊትሽ ተንበርክኬ ክብርን ሰጥሻለው
ፍቅርሽ ጥግ የለውም ይሄንን አውቃለው

CHORUS
አበርቺኝ በጉዞዬ
ዋስ ሆነሽ ከለላዬ
ማርያም "እናቴ"2
ክብሬ እኮ ነሽ ውበቴ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 1
Gudleten tawqiyalesh gena salnegrsh
Shekmen masogeja honognal ts’elotsh
Sielsh fit qome yelben sinegrsh
Hulun argolgnal yetamenew lijsh

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 2
Bemljash qomiyalew bemljash
Selame nesh Maryam selame nesh
Yenegerkush hulu meche kentu qertwal
Wit’ne tesakto godoloye moltwal

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 3
T’lash shefnognal bebaed hager
Lene bezu adrgwal dingel yanchi fiqr
Beza bemot sifra bemesqelu daget
Sit’ota yagegnehush bemekeraw elet

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 4
Fitsh tenberkke kibrn set’shalew
Fiqrsh t’g yelewm yihenn awqalew
Bech’nqete gize behazene seat
Yemtaregagign yehonshgn mets’nanat

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 5
Yememats’egnaye ketema nesh Maryam
Zemrlshalew lealem lezelalem
Yenegerkush hulu meche kentu qertwal
Wit’ne tesakto godoloye moltwal

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 6
T’lash shefnognal bebaed hager
Lene bezu adrgwal dingel yanchi fiqr
Beza bemot sifra bemesqelu daget
Sit’ota yagegnewsh bemekeraw elet

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete

VERSE 7
Fitsh tenberkke kibrn set’shalew
Fiqrsh t’g yelewm yihenn awqalew

CHORUS
Aberchign beguzoye
Was honesh kelelaye
Maryam "enate"2
Kibre eko nesh wibete'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bemeljash-komiyalehu-zemarit-betselot-asmare', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bemen Des Lasenyih (bemen-des-lasenyih)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 1
ኪሩቤል ሱራፌል ቅዱስ ሥሉስ ያሉህ
መላዕክት በራማ የሚያመሰግኑህ
ድንቅ መካር ኃያል ኤልሻዳይ ነህና
ትቢያ ነኝ ምን ልስጥህ ምንስ አለኝና (2)

VERSE 2
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 3
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና በአምላኬ ፊት ልስገድ
ወደ ላይ በሰማይ ወደ ታች በጥልቀት
አምላኬ የት አለ የማትገኝበት

VERSE 4
ጌታ ሆይ የት አለ የማትገኝበት

VERSE 5
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 6
በኪዳን በፀሎት ቅዳሴ ሰዓታት
አንተ የሰጠኸኝ የመንፈስ ቅዱስ ሀብት
መልሰን ወደ አንተ ብንሰጥ ምን አለ
ተወው ጉዳችንን ስስታችን ይኸው (2)

VERSE 7
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 8
ሀብትና ንብረቴስ ጉልበቴስ ምንድነው
ጤና የሰጠኝ ከአንተ በቀር ማነው
በሰጠኸኝ እድሜ በሕይወት ዘመኔ
ከገላዬስ ቢሆን የትኛው ነው የኔ

VERSE 9
ከአካላቴስ ቢሆን የትኛው ነው የኔ

VERSE 10
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 11
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 12
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ',
      lyrics_transliteration = 'Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 1
Kirubel Surafel Kidus Silus yaluh
Melaekt berama yemiyamesegenuh
Dink mekar hayal Elshaday nehna
Tenbiya negn min lishith mins alegnina (2)

VERSE 2
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey

VERSE 3
Yefeterkew hulu yantew aydelem wey
Kidusun meswaet Leul silemiwed
Min yize limtana beamlake fit lisged
Wede lay besemay wede tach betilket

VERSE 4
Amlake yet ale yematigegnibet
Geta hoy yet ale yematigegnibet
Bemen des lasenyih Getaye hoy

VERSE 5
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey
Bekidan betshelot kidassie saatat

VERSE 6
Ante yesetehgne yemenfes kidus habt
Melesen wede ante binset min ale
Tewew gudachinen sistachinen yihew (2)

VERSE 7
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 8
Habtina nibretes gulbetes mindenew
Tenaye yesetegn kante beker manew
Besetehgne edme behiwot zemene

VERSE 9
Kegelayes bihon yetignawu new yene
Keakilates bihon yetignawu new yene
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy

VERSE 10
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey
Bemen des lasenyih Getaye hoy

VERSE 11
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey
Bemen des lasenyih Getaye hoy

VERSE 12
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bemen-des-lasenyih'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 1
ኪሩቤል ሱራፌል ቅዱስ ሥሉስ ያሉህ
መላዕክት በራማ የሚያመሰግኑህ
ድንቅ መካር ኃያል ኤልሻዳይ ነህና
ትቢያ ነኝ ምን ልስጥህ ምንስ አለኝና (2)

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 2
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 3
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና በአምላኬ ፊት ልስገድ
ወደ ላይ በሰማይ ወደ ታች በጥልቀት
አምላኬ የት አለ የማትገኝበት

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 4
ጌታ ሆይ የት አለ የማትገኝበት

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 5
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 6
በኪዳን በፀሎት ቅዳሴ ሰዓታት
አንተ የሰጠኸኝ የመንፈስ ቅዱስ ሀብት
መልሰን ወደ አንተ ብንሰጥ ምን አለ
ተወው ጉዳችንን ስስታችን ይኸው (2)

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 7
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 8
ሀብትና ንብረቴስ ጉልበቴስ ምንድነው
ጤና የሰጠኝ ከአንተ በቀር ማነው
በሰጠኸኝ እድሜ በሕይወት ዘመኔ
ከገላዬስ ቢሆን የትኛው ነው የኔ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 9
ከአካላቴስ ቢሆን የትኛው ነው የኔ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 10
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 11
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 12
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 1
Kirubel Surafel Kidus Silus yaluh
Melaekt berama yemiyamesegenuh
Dink mekar hayal Elshaday nehna
Tenbiya negn min lishith mins alegnina (2)

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 2
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 3
Yefeterkew hulu yantew aydelem wey
Kidusun meswaet Leul silemiwed
Min yize limtana beamlake fit lisged
Wede lay besemay wede tach betilket

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 4
Amlake yet ale yematigegnibet
Geta hoy yet ale yematigegnibet
Bemen des lasenyih Getaye hoy

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 5
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey
Bekidan betshelot kidassie saatat

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 6
Ante yesetehgne yemenfes kidus habt
Melesen wede ante binset min ale
Tewew gudachinen sistachinen yihew (2)

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 7
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 8
Habtina nibretes gulbetes mindenew
Tenaye yesetegn kante beker manew
Besetehgne edme behiwot zemene

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 9
Kegelayes bihon yetignawu new yene
Keakilates bihon yetignawu new yene
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 10
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey
Bemen des lasenyih Getaye hoy

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 11
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey
Bemen des lasenyih Getaye hoy

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

VERSE 12
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey

CHORUS
Bemen des lasenyih Getaye hoy
Bemen des lasenyih Amlake hoy
Alemena melaw yantew aydelem wey
Yefeterkew hulu yantew aydelem wey'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bemen-des-lasenyih', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bemenifes Beewinet Zemari Diyakon Hawaz Tegegni Yikirita Ketesegnew Kutir 3 Yezimare Alibem (bemenifes-beewinet-zemari-diyakon-hawaz-tegegni-yikirita-ketesegnew-kuti)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በደምህ አዲስ ኪዳን ሆኖልና
ከልካይ መጋረጃው ተቀዷልና
በሥጋህ ገብቼ ወደ ቅድስት
ጌታ አመልክሃለሁ በነጻነት

VERSE 1
ውዴ አመልክሃለሁ ያለ ፍርሃት
በመንፈስ በእውነት ላምልክህ
ክብርን እያየሁ ላክብርህ
በሰሎሞን መቅደስ አልባዝንም

VERSE 2
መንፈስህን በሥፍራ አልገድብም
ሥምህ ነው የአምልኮ ማዕከሌ
መቅደስህ ማደሪያ ነኝ ጌታዬ
በመንፈስ በእውነት ላምልክህ

VERSE 3
ክብርን እያየሁ ላክብርህ',
      lyrics_transliteration = 'Bedemh adis kidan honolna
Kelkay megarejaw teqedwalna
Besgah gebche wede Kidist
Geta amelkhalehu benets’anet

VERSE 1
Wide amelkhalehu yale firhat
Bemenfes beewnet lamlkh
Kibrn eyayehu lakbrh
Beselomon meqdes albaznm

VERSE 2
Menfeshn besfra algedbm
Simh new yeamlko maekele
Meqdesh maderiya negn Getaye
Bemenfes beewnet lamlkh

VERSE 3
Kibrn eyayehu lakbrh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bemenifes-beewinet-zemari-diyakon-hawaz-tegegni-yikirita-ketesegnew-kuti'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በደምህ አዲስ ኪዳን ሆኖልና
ከልካይ መጋረጃው ተቀዷልና
በሥጋህ ገብቼ ወደ ቅድስት
ጌታ አመልክሃለሁ በነጻነት

VERSE 1
ውዴ አመልክሃለሁ ያለ ፍርሃት
በመንፈስ በእውነት ላምልክህ
ክብርን እያየሁ ላክብርህ
በሰሎሞን መቅደስ አልባዝንም

CHORUS
በደምህ አዲስ ኪዳን ሆኖልና
ከልካይ መጋረጃው ተቀዷልና
በሥጋህ ገብቼ ወደ ቅድስት
ጌታ አመልክሃለሁ በነጻነት

VERSE 2
መንፈስህን በሥፍራ አልገድብም
ሥምህ ነው የአምልኮ ማዕከሌ
መቅደስህ ማደሪያ ነኝ ጌታዬ
በመንፈስ በእውነት ላምልክህ

CHORUS
በደምህ አዲስ ኪዳን ሆኖልና
ከልካይ መጋረጃው ተቀዷልና
በሥጋህ ገብቼ ወደ ቅድስት
ጌታ አመልክሃለሁ በነጻነት

VERSE 3
ክብርን እያየሁ ላክብርህ

CHORUS
በደምህ አዲስ ኪዳን ሆኖልና
ከልካይ መጋረጃው ተቀዷልና
በሥጋህ ገብቼ ወደ ቅድስት
ጌታ አመልክሃለሁ በነጻነት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bedemh adis kidan honolna
Kelkay megarejaw teqedwalna
Besgah gebche wede Kidist
Geta amelkhalehu benets’anet

VERSE 1
Wide amelkhalehu yale firhat
Bemenfes beewnet lamlkh
Kibrn eyayehu lakbrh
Beselomon meqdes albaznm

CHORUS
Bedemh adis kidan honolna
Kelkay megarejaw teqedwalna
Besgah gebche wede Kidist
Geta amelkhalehu benets’anet

VERSE 2
Menfeshn besfra algedbm
Simh new yeamlko maekele
Meqdesh maderiya negn Getaye
Bemenfes beewnet lamlkh

CHORUS
Bedemh adis kidan honolna
Kelkay megarejaw teqedwalna
Besgah gebche wede Kidist
Geta amelkhalehu benets’anet

VERSE 3
Kibrn eyayehu lakbrh

CHORUS
Bedemh adis kidan honolna
Kelkay megarejaw teqedwalna
Besgah gebche wede Kidist
Geta amelkhalehu benets’anet'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bemenifes-beewinet-zemari-diyakon-hawaz-tegegni-yikirita-ketesegnew-kuti', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bemin Bemin Enimesilat Dinigil Mariyamin (bemin-bemin-enimesilat-dinigil-mariyamin)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን

VERSE 1
የብርሃን መውጫ የኖኅ ድንቅ መርከብ
የመላዕክት እህት የሩሩሃን ርግብ /፪/
የሰሎሞን አክሊል የአሮን በትር
የዕዝራ መሰንቆ የጌዲዮን ጸምር

VERSE 2
ድንግል እመቤት ናት የጻድቃኖች በር
ሆና የተገኘች የአምላክ ማህደር/፪/
የቅዱሳን እናት የዓለም ንግስት
ችላ ተሸከመች መለኮት እሳት

VERSE 3
ብርሃን ትሁነን ጨለማን ገላልጣ
አማልዳ ታስምረን ከዚህ ዓለም ጣጣ/፪/
ከማር ይጣፍጣል የድንግል መዓዛ
አምላክን አቅፋለች በሁለት እጇ ይዛ

VERSE 4
ዓለም ሁሉ የዳነው በልጅሽ ነውና
እናታችን ጽዮን ይድረስሽ ምስጋና/፪/',
      lyrics_transliteration = 'Bemn bemn enmeslat Dingil Maryamn (2)
Misale yelatm yelatm kibrwan yemimet’n (2)
Yemuse ts’lat nesh yemhret qalkidan
Yeyaeqob meselal yeabrham dinkwan

VERSE 1
Yebrhan mewch’a yenoh dinq merkeb
Yemelaekt eht yeruruhan rigb (2)
Yeselomon aklil yearon betr
Yeezra mesenqo yegediyon ts’emr

VERSE 2
Dingil emebet nat yets’adqanoch ber
Hona yetegegnech yeamlak mahder (2)
Yeqdusan enat yealem nigst
Chla teshekemech melekot esat

VERSE 3
Birhan tihunen ch’eleman gelalt’a
Amalda tasmren kezih alem t’at’a (2)
Kemar yit’aft’al yedngl meaza
Amlakn aqfalech behulet ejwa yiza

VERSE 4
Alem hulu yedanew beljsh newna
Enatachn ts’yon yidressh misgana (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bemin-bemin-enimesilat-dinigil-mariyamin'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን

VERSE 1
የብርሃን መውጫ የኖኅ ድንቅ መርከብ
የመላዕክት እህት የሩሩሃን ርግብ /፪/
የሰሎሞን አክሊል የአሮን በትር
የዕዝራ መሰንቆ የጌዲዮን ጸምር

CHORUS
በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን

VERSE 2
ድንግል እመቤት ናት የጻድቃኖች በር
ሆና የተገኘች የአምላክ ማህደር/፪/
የቅዱሳን እናት የዓለም ንግስት
ችላ ተሸከመች መለኮት እሳት

CHORUS
በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን

VERSE 3
ብርሃን ትሁነን ጨለማን ገላልጣ
አማልዳ ታስምረን ከዚህ ዓለም ጣጣ/፪/
ከማር ይጣፍጣል የድንግል መዓዛ
አምላክን አቅፋለች በሁለት እጇ ይዛ

CHORUS
በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን

VERSE 4
ዓለም ሁሉ የዳነው በልጅሽ ነውና
እናታችን ጽዮን ይድረስሽ ምስጋና/፪/

CHORUS
በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bemn bemn enmeslat Dingil Maryamn (2)
Misale yelatm yelatm kibrwan yemimet’n (2)
Yemuse ts’lat nesh yemhret qalkidan
Yeyaeqob meselal yeabrham dinkwan

VERSE 1
Yebrhan mewch’a yenoh dinq merkeb
Yemelaekt eht yeruruhan rigb (2)
Yeselomon aklil yearon betr
Yeezra mesenqo yegediyon ts’emr

CHORUS
Bemn bemn enmeslat Dingil Maryamn (2)
Misale yelatm yelatm kibrwan yemimet’n (2)
Yemuse ts’lat nesh yemhret qalkidan
Yeyaeqob meselal yeabrham dinkwan

VERSE 2
Dingil emebet nat yets’adqanoch ber
Hona yetegegnech yeamlak mahder (2)
Yeqdusan enat yealem nigst
Chla teshekemech melekot esat

CHORUS
Bemn bemn enmeslat Dingil Maryamn (2)
Misale yelatm yelatm kibrwan yemimet’n (2)
Yemuse ts’lat nesh yemhret qalkidan
Yeyaeqob meselal yeabrham dinkwan

VERSE 3
Birhan tihunen ch’eleman gelalt’a
Amalda tasmren kezih alem t’at’a (2)
Kemar yit’aft’al yedngl meaza
Amlakn aqfalech behulet ejwa yiza

CHORUS
Bemn bemn enmeslat Dingil Maryamn (2)
Misale yelatm yelatm kibrwan yemimet’n (2)
Yemuse ts’lat nesh yemhret qalkidan
Yeyaeqob meselal yeabrham dinkwan

VERSE 4
Alem hulu yedanew beljsh newna
Enatachn ts’yon yidressh misgana (2)

CHORUS
Bemn bemn enmeslat Dingil Maryamn (2)
Misale yelatm yelatm kibrwan yemimet’n (2)
Yemuse ts’lat nesh yemhret qalkidan
Yeyaeqob meselal yeabrham dinkwan'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bemin-bemin-enimesilat-dinigil-mariyamin', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bemin Des Lasegnih (bemin-des-lasegnih)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 1
ኪሩቤል ሱራፌል ቅዱስ ሥሉስ ያሉህ
መላዕክት በራማ የሚያመሰኑህ
ድንቅ መካር ኃያል ኤልሻዳይ ነህና
ትንቢያ ነኝ ምን ልስጥህ ምንስ አለኝና ፪

VERSE 2
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና በአምላኬ ፊት ልስገድ
ወደ ላይ በሰማይ ወደ ታች በጥልቀት
አምላኬ የት አለ የማትገኝበት

VERSE 3
ጌታ ሆይ የት አለ የማትገኝበት
በኪዳን በፀሎት ቅዳሴ ሰዓታት
አንተ የሰጠኸኝ የመንፈስ ቅዱስ ሀብት
መልሰን ወደ አንተ ብንሰጥ ምን አለ

VERSE 4
ተወው ጉዳችንን ስስታችን ይኸው ፪
ሀብትና ንብረቴስ ጉልበቴስ ምንድነው
ጤናዬ የሰጠኝ ከአንተ በቀር ማነው
በሰጠኸኝ እድሜ በሕይወት ዘመኔ

VERSE 5
ከገላዬስ ቢሆን የትኛው ነው የኔ
ከአካላቴስ ቢሆን የትኛው ነው የኔ',
      lyrics_transliteration = 'Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 1
Kirubel surafel Kidus silus yaluh
Melaekt berama yemiyamesenuh
Dinq mekar hayal elshaday nehna
Tinbiya negn min list’h mins alegnna 2

VERSE 2
Qidusun meswaet liul silemiwed
Min yizhe limt’ana beamlake fit lisged
Wede lay besemay wede tach bet’lqet
Amlake yet ale yematgegnbet

VERSE 3
Geta hoy yet ale yematgegnbet
Bekidan bets’elot qidase seatat
Ante yeset’eኸgn yemenfes Kidus hebt
Melsen wede ante binset’ min ale

VERSE 4
Tewew gudachnn sistachn yiኸw 2
Hebtna nibretes gulbetes mindnew
T’enaye yeset’egn keante beqer manew
Beset’eኸgn edme behywet zemene

VERSE 5
Kegelayes bihon yetgnaw new yene
Keakalates bihon yetgnaw new yene',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bemin-des-lasegnih'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 1
ኪሩቤል ሱራፌል ቅዱስ ሥሉስ ያሉህ
መላዕክት በራማ የሚያመሰኑህ
ድንቅ መካር ኃያል ኤልሻዳይ ነህና
ትንቢያ ነኝ ምን ልስጥህ ምንስ አለኝና ፪

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 2
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና በአምላኬ ፊት ልስገድ
ወደ ላይ በሰማይ ወደ ታች በጥልቀት
አምላኬ የት አለ የማትገኝበት

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 3
ጌታ ሆይ የት አለ የማትገኝበት
በኪዳን በፀሎት ቅዳሴ ሰዓታት
አንተ የሰጠኸኝ የመንፈስ ቅዱስ ሀብት
መልሰን ወደ አንተ ብንሰጥ ምን አለ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 4
ተወው ጉዳችንን ስስታችን ይኸው ፪
ሀብትና ንብረቴስ ጉልበቴስ ምንድነው
ጤናዬ የሰጠኝ ከአንተ በቀር ማነው
በሰጠኸኝ እድሜ በሕይወት ዘመኔ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 5
ከገላዬስ ቢሆን የትኛው ነው የኔ
ከአካላቴስ ቢሆን የትኛው ነው የኔ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 1
Kirubel surafel Kidus silus yaluh
Melaekt berama yemiyamesenuh
Dinq mekar hayal elshaday nehna
Tinbiya negn min list’h mins alegnna 2

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 2
Qidusun meswaet liul silemiwed
Min yizhe limt’ana beamlake fit lisged
Wede lay besemay wede tach bet’lqet
Amlake yet ale yematgegnbet

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 3
Geta hoy yet ale yematgegnbet
Bekidan bets’elot qidase seatat
Ante yeset’eኸgn yemenfes Kidus hebt
Melsen wede ante binset’ min ale

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 4
Tewew gudachnn sistachn yiኸw 2
Hebtna nibretes gulbetes mindnew
T’enaye yeset’egn keante beqer manew
Beset’eኸgn edme behywet zemene

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 5
Kegelayes bihon yetgnaw new yene
Keakalates bihon yetgnaw new yene

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bemin-des-lasegnih', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bemin Des Lasegnih (bemin-des-lasegnih-2675)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 1
ኪሩቤል ሱራፌል ቅዱስ ሥሉስ ያሉህ
መላዕክት በራማ የሚያመሰኑህ
ድንቅ መካር ኃያል ኤልሻዳይ ነህና
ትንቢያ ነኝ ምን ልስጥህ ምንስ አለኝና ፪

VERSE 2
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና በአምላኬ ፊት ልስገድ
ወደ ላይ በሰማይ ወደ ታች በጥልቀት
አምላኬ የት አለ የማትገኝበት

VERSE 3
ጌታ ሆይ የት አለ የማትገኝበት
በኪዳን በፀሎት ቅዳሴ ሰዓታት
አንተ የሰጠኸኝ የመንፈስ ቅዱስ ሀብት
መልሰን ወደ አንተ ብንሰጥ ምን አለ

VERSE 4
ተወው ጉዳችንን ስስታችን ይኸው ፪
ሀብትና ንብረቴስ ጉልበቴስ ምንድነው
ጤናዬ የሰጠኝ ከአንተ በቀር ማነው
በሰጠኸኝ እድሜ በሕይወት ዘመኔ

VERSE 5
ከገላዬስ ቢሆን የትኛው ነው የኔ
ከአካላቴስ ቢሆን የትኛው ነው የኔ
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ

VERSE 6
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ
ኪሩቤል ሱራፌል ቅዱስ ሥሉስ ያሉህ
መላዕክት በራማ የሚያመሰኑህ

VERSE 7
ድንቅ መካር ኃያል ኤልሻዳይ ነህና
ትንቢያ ነኝ ምን ልስጥህ ምንስ አለኝና ፪
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና በአምላኬ ፊት ልስገድ

VERSE 8
ወደ ላይ በሰማይ ወደ ታች በጥልቀት
አምላኬ የት አለ የማትገኝበት
ጌታ ሆይ የት አለ የማትገኝበት
በኪዳን በፀሎት ቅዳሴ ሰዓታት

VERSE 9
አንተ የሰጠኸኝ የመንፈስ ቅዱስ ሀብት
መልሰን ወደ አንተ ብንሰጥ ምን አለ
ተወው ጉዳችንን ስስታችን ይኸው ፪
ሀብትና ንብረቴስ ጉልበቴስ ምንድነው

VERSE 10
ጤናዬ የሰጠኝ ከአንተ በቀር ማነው
በሰጠኸኝ እድሜ በሕይወት ዘመኔ
ከገላዬስ ቢሆን የትኛው ነው የኔ
ከአካላቴስ ቢሆን የትኛው ነው የኔ

VERSE 11
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 12
አ.ዝ //
በኢያሪኮ መንገድ ስለምን ቁጭ ብዬ
ብርሐን እጅግ ናፍቆኝ ከሰው ተገልዬ
የብርሐን ጌታ ወደ እኔ መጣና

VERSE 13
ዓይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
ለብዙ ዘመናት አልጋ ላይ ተኝቼ
የሚረዳኝ አጣሁ ጠሉኝ ዘመዶቼ

VERSE 14
የእኔ ጌታ አምላኬ ወደእኔ መጣና
አይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
አሥራ ሁለት ዓመት ደም እየፈሰሰኝ

VERSE 15
ምራቅ እየተፉ ሁሉም ሲያንቋሽሹኝ
የጌታዬ ልብሱን ጫፉን ብዳስሰው
ሃይል ከእርሱ ወጣ ደሜን ቀጥ አረገው
አ.ዝ //

VERSE 16
ሰካራም ዘማዊ ወንበዴ ነበርኩኝ
ያመፀኞች መሪ ደምን ያፈሰስኩኝ
ዛሬ ግን ታሪኬን ጌታ ቀይሮታል
ለሃያሉ ጌታ ምስጋና ይገባዋል',
      lyrics_transliteration = 'Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 1
Kirubel surafel Kidus silus yaluh
Melaekt berama yemiyamesenuh
Dinq mekar hayal elshaday nehna
Tinbiya negn min list’h mins alegnna 2

VERSE 2
Qidusun meswaet liul silemiwed
Min yizhe limt’ana beamlake fit lisged
Wede lay besemay wede tach bet’lqet
Amlake yet ale yematgegnbet

VERSE 3
Geta hoy yet ale yematgegnbet
Bekidan bets’elot qidase seatat
Ante yeset’eኸgn yemenfes Kidus hebt
Melsen wede ante binset’ min ale

VERSE 4
Tewew gudachnn sistachn yiኸw 2
Hebtna nibretes gulbetes mindnew
T’enaye yeset’egn keante beqer manew
Beset’eኸgn edme behywet zemene

VERSE 5
Kegelayes bihon yetgnaw new yene
Keakalates bihon yetgnaw new yene
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy

VERSE 6
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey
Kirubel surafel Kidus silus yaluh
Melaekt berama yemiyamesenuh

VERSE 7
Dinq mekar hayal elshaday nehna
Tinbiya negn min list’h mins alegnna 2
Qidusun meswaet liul silemiwed
Min yizhe limt’ana beamlake fit lisged

VERSE 8
Wede lay besemay wede tach bet’lqet
Amlake yet ale yematgegnbet
Geta hoy yet ale yematgegnbet
Bekidan bets’elot qidase seatat

VERSE 9
Ante yeset’eኸgn yemenfes Kidus hebt
Melsen wede ante binset’ min ale
Tewew gudachnn sistachn yiኸw 2
Hebtna nibretes gulbetes mindnew

VERSE 10
T’enaye yeset’egn keante beqer manew
Beset’eኸgn edme behywet zemene
Kegelayes bihon yetgnaw new yene
Keakalates bihon yetgnaw new yene

VERSE 11
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 12
A.z //
Beiyariko menged silemn quch’ biye
Birhen ejg nafqogn kesew tegelye
Yebrhen Geta wede ene met’ana

VERSE 13
Aynen aberalgn beeju dasesena
A.z //
Lebzu zemenat alga lay tegnche
Yemiredagn at’ahu t’elugn zemedoche

VERSE 14
Yeene Geta amlake wedeene met’ana
Aynen aberalgn beeju dasesena
A.z //
Asra hulet amet dem eyefesesegn

VERSE 15
Miraq eyetefu hulum siyanqwashshugn
Yegetaye libsun ch’afun bidassew
Hayl keersu wet’a demen qet’ aregew
A.z //

VERSE 16
Sekaram zemawi wenbede neberkugn
Yamets’egnoch meri demn yafeseskugn
Zare gin tariken Geta qeyrotal
Lehayalu Geta misgana yigebawal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bemin-des-lasegnih-2675'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 1
ኪሩቤል ሱራፌል ቅዱስ ሥሉስ ያሉህ
መላዕክት በራማ የሚያመሰኑህ
ድንቅ መካር ኃያል ኤልሻዳይ ነህና
ትንቢያ ነኝ ምን ልስጥህ ምንስ አለኝና ፪

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 2
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና በአምላኬ ፊት ልስገድ
ወደ ላይ በሰማይ ወደ ታች በጥልቀት
አምላኬ የት አለ የማትገኝበት

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 3
ጌታ ሆይ የት አለ የማትገኝበት
በኪዳን በፀሎት ቅዳሴ ሰዓታት
አንተ የሰጠኸኝ የመንፈስ ቅዱስ ሀብት
መልሰን ወደ አንተ ብንሰጥ ምን አለ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 4
ተወው ጉዳችንን ስስታችን ይኸው ፪
ሀብትና ንብረቴስ ጉልበቴስ ምንድነው
ጤናዬ የሰጠኝ ከአንተ በቀር ማነው
በሰጠኸኝ እድሜ በሕይወት ዘመኔ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 5
ከገላዬስ ቢሆን የትኛው ነው የኔ
ከአካላቴስ ቢሆን የትኛው ነው የኔ
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 6
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ
ኪሩቤል ሱራፌል ቅዱስ ሥሉስ ያሉህ
መላዕክት በራማ የሚያመሰኑህ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 7
ድንቅ መካር ኃያል ኤልሻዳይ ነህና
ትንቢያ ነኝ ምን ልስጥህ ምንስ አለኝና ፪
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና በአምላኬ ፊት ልስገድ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 8
ወደ ላይ በሰማይ ወደ ታች በጥልቀት
አምላኬ የት አለ የማትገኝበት
ጌታ ሆይ የት አለ የማትገኝበት
በኪዳን በፀሎት ቅዳሴ ሰዓታት

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 9
አንተ የሰጠኸኝ የመንፈስ ቅዱስ ሀብት
መልሰን ወደ አንተ ብንሰጥ ምን አለ
ተወው ጉዳችንን ስስታችን ይኸው ፪
ሀብትና ንብረቴስ ጉልበቴስ ምንድነው

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 10
ጤናዬ የሰጠኝ ከአንተ በቀር ማነው
በሰጠኸኝ እድሜ በሕይወት ዘመኔ
ከገላዬስ ቢሆን የትኛው ነው የኔ
ከአካላቴስ ቢሆን የትኛው ነው የኔ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 11
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 12
አ.ዝ //
በኢያሪኮ መንገድ ስለምን ቁጭ ብዬ
ብርሐን እጅግ ናፍቆኝ ከሰው ተገልዬ
የብርሐን ጌታ ወደ እኔ መጣና

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 13
ዓይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
ለብዙ ዘመናት አልጋ ላይ ተኝቼ
የሚረዳኝ አጣሁ ጠሉኝ ዘመዶቼ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 14
የእኔ ጌታ አምላኬ ወደእኔ መጣና
አይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
አሥራ ሁለት ዓመት ደም እየፈሰሰኝ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 15
ምራቅ እየተፉ ሁሉም ሲያንቋሽሹኝ
የጌታዬ ልብሱን ጫፉን ብዳስሰው
ሃይል ከእርሱ ወጣ ደሜን ቀጥ አረገው
አ.ዝ //

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 16
ሰካራም ዘማዊ ወንበዴ ነበርኩኝ
ያመፀኞች መሪ ደምን ያፈሰስኩኝ
ዛሬ ግን ታሪኬን ጌታ ቀይሮታል
ለሃያሉ ጌታ ምስጋና ይገባዋል

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 1
Kirubel surafel Kidus silus yaluh
Melaekt berama yemiyamesenuh
Dinq mekar hayal elshaday nehna
Tinbiya negn min list’h mins alegnna 2

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 2
Qidusun meswaet liul silemiwed
Min yizhe limt’ana beamlake fit lisged
Wede lay besemay wede tach bet’lqet
Amlake yet ale yematgegnbet

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 3
Geta hoy yet ale yematgegnbet
Bekidan bets’elot qidase seatat
Ante yeset’eኸgn yemenfes Kidus hebt
Melsen wede ante binset’ min ale

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 4
Tewew gudachnn sistachn yiኸw 2
Hebtna nibretes gulbetes mindnew
T’enaye yeset’egn keante beqer manew
Beset’eኸgn edme behywet zemene

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 5
Kegelayes bihon yetgnaw new yene
Keakalates bihon yetgnaw new yene
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 6
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey
Kirubel surafel Kidus silus yaluh
Melaekt berama yemiyamesenuh

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 7
Dinq mekar hayal elshaday nehna
Tinbiya negn min list’h mins alegnna 2
Qidusun meswaet liul silemiwed
Min yizhe limt’ana beamlake fit lisged

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 8
Wede lay besemay wede tach bet’lqet
Amlake yet ale yematgegnbet
Geta hoy yet ale yematgegnbet
Bekidan bets’elot qidase seatat

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 9
Ante yeset’eኸgn yemenfes Kidus hebt
Melsen wede ante binset’ min ale
Tewew gudachnn sistachn yiኸw 2
Hebtna nibretes gulbetes mindnew

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 10
T’enaye yeset’egn keante beqer manew
Beset’eኸgn edme behywet zemene
Kegelayes bihon yetgnaw new yene
Keakalates bihon yetgnaw new yene

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 11
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 12
A.z //
Beiyariko menged silemn quch’ biye
Birhen ejg nafqogn kesew tegelye
Yebrhen Geta wede ene met’ana

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 13
Aynen aberalgn beeju dasesena
A.z //
Lebzu zemenat alga lay tegnche
Yemiredagn at’ahu t’elugn zemedoche

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 14
Yeene Geta amlake wedeene met’ana
Aynen aberalgn beeju dasesena
A.z //
Asra hulet amet dem eyefesesegn

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 15
Miraq eyetefu hulum siyanqwashshugn
Yegetaye libsun ch’afun bidassew
Hayl keersu wet’a demen qet’ aregew
A.z //

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 16
Sekaram zemawi wenbede neberkugn
Yamets’egnoch meri demn yafeseskugn
Zare gin tariken Geta qeyrotal
Lehayalu Geta misgana yigebawal

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bemin-des-lasegnih-2675', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bemin Des Lasegnih Getaye Hoy (bemin-des-lasegnih-getaye-hoy)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 1
ኪሩቤል ሱራፌል ቅዱስ ሥሉስ ያሉህ
መላዕክት በራማ የሚያመሰኑህ
ድንቅ መካር ኃያል ኤልሻዳይ ነህና
ትንቢያ ነኝ ምን ልስጥህ ምንስ አለኝና ፪

VERSE 2
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና በአምላኬ ፊት ልስገድ
ወደ ላይ በሰማይ ወደ ታች በጥልቀት
አምላኬ የት አለ የማትገኝበት

VERSE 3
ጌታ ሆይ የት አለ የማትገኝበት
በኪዳን በፀሎት ቅዳሴ ሰዓታት
አንተ የሰጠኸኝ የመንፈስ ቅዱስ ሀብት
መልሰን ወደ አንተ ብንሰጥ ምን አለ

VERSE 4
ተወው ጉዳችንን ስስታችን ይኸው ፪
ሀብትና ንብረቴስ ጉልበቴስ ምንድነው
ጤናዬ የሰጠኝ ከአንተ በቀር ማነው
በሰጠኸኝ እድሜ በሕይወት ዘመኔ

VERSE 5
ከገላዬስ ቢሆን የትኛው ነው የኔ
ከአካላቴስ ቢሆን የትኛው ነው የኔ',
      lyrics_transliteration = 'Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 1
Kirubel surafel Kidus silus yaluh
Melaekt berama yemiyamesenuh
Dinq mekar hayal elshaday nehna
Tinbiya negn min list’h mins alegnna 2

VERSE 2
Qidusun meswaet liul silemiwed
Min yizhe limt’ana beamlake fit lisged
Wede lay besemay wede tach bet’lqet
Amlake yet ale yematgegnbet

VERSE 3
Geta hoy yet ale yematgegnbet
Bekidan bets’elot qidase seatat
Ante yeset’eኸgn yemenfes Kidus hebt
Melsen wede ante binset’ min ale

VERSE 4
Tewew gudachnn sistachn yiኸw 2
Hebtna nibretes gulbetes mindnew
T’enaye yeset’egn keante beqer manew
Beset’eኸgn edme behywet zemene

VERSE 5
Kegelayes bihon yetgnaw new yene
Keakalates bihon yetgnaw new yene',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bemin-des-lasegnih-getaye-hoy'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 1
ኪሩቤል ሱራፌል ቅዱስ ሥሉስ ያሉህ
መላዕክት በራማ የሚያመሰኑህ
ድንቅ መካር ኃያል ኤልሻዳይ ነህና
ትንቢያ ነኝ ምን ልስጥህ ምንስ አለኝና ፪

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 2
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና በአምላኬ ፊት ልስገድ
ወደ ላይ በሰማይ ወደ ታች በጥልቀት
አምላኬ የት አለ የማትገኝበት

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 3
ጌታ ሆይ የት አለ የማትገኝበት
በኪዳን በፀሎት ቅዳሴ ሰዓታት
አንተ የሰጠኸኝ የመንፈስ ቅዱስ ሀብት
መልሰን ወደ አንተ ብንሰጥ ምን አለ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 4
ተወው ጉዳችንን ስስታችን ይኸው ፪
ሀብትና ንብረቴስ ጉልበቴስ ምንድነው
ጤናዬ የሰጠኝ ከአንተ በቀር ማነው
በሰጠኸኝ እድሜ በሕይወት ዘመኔ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 5
ከገላዬስ ቢሆን የትኛው ነው የኔ
ከአካላቴስ ቢሆን የትኛው ነው የኔ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 1
Kirubel surafel Kidus silus yaluh
Melaekt berama yemiyamesenuh
Dinq mekar hayal elshaday nehna
Tinbiya negn min list’h mins alegnna 2

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 2
Qidusun meswaet liul silemiwed
Min yizhe limt’ana beamlake fit lisged
Wede lay besemay wede tach bet’lqet
Amlake yet ale yematgegnbet

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 3
Geta hoy yet ale yematgegnbet
Bekidan bets’elot qidase seatat
Ante yeset’eኸgn yemenfes Kidus hebt
Melsen wede ante binset’ min ale

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 4
Tewew gudachnn sistachn yiኸw 2
Hebtna nibretes gulbetes mindnew
T’enaye yeset’egn keante beqer manew
Beset’eኸgn edme behywet zemene

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 5
Kegelayes bihon yetgnaw new yene
Keakalates bihon yetgnaw new yene

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bemin-des-lasegnih-getaye-hoy', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bemin Des Lasegnih Getaye Hoy *** Bemuhaze Sibihat (bemin-des-lasegnih-getaye-hoy-bemuhaze-sibihat)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 1
ኪሩቤል ሱራፌል ቅዱስ ሥሉስ ያሉህ
መላዕክት በራማ የሚያመሰኑህ
ድንቅ መካር ኃያል ኤልሻዳይ ነህና
ትንቢያ ነኝ ምን ልስጥህ ምንስ አለኝና ፪

VERSE 2
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና በአምላኬ ፊት ልስገድ
ወደ ላይ በሰማይ ወደ ታች በጥልቀት
አምላኬ የት አለ የማትገኝበት

VERSE 3
ጌታ ሆይ የት አለ የማትገኝበት
በኪዳን በፀሎት ቅዳሴ ሰዓታት
አንተ የሰጠኸኝ የመንፈስ ቅዱስ ሀብት
መልሰን ወደ አንተ ብንሰጥ ምን አለ

VERSE 4
ተወው ጉዳችንን ስስታችን ይኸው ፪
ሀብትና ንብረቴስ ጉልበቴስ ምንድነው
ጤናዬ የሰጠኝ ከአንተ በቀር ማነው
በሰጠኸኝ እድሜ በሕይወት ዘመኔ

VERSE 5
ከገላዬስ ቢሆን የትኛው ነው የኔ
ከአካላቴስ ቢሆን የትኛው ነው የኔ',
      lyrics_transliteration = 'Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 1
Kirubel surafel Kidus silus yaluh
Melaekt berama yemiyamesenuh
Dinq mekar hayal elshaday nehna
Tinbiya negn min list’h mins alegnna 2

VERSE 2
Qidusun meswaet liul silemiwed
Min yizhe limt’ana beamlake fit lisged
Wede lay besemay wede tach bet’lqet
Amlake yet ale yematgegnbet

VERSE 3
Geta hoy yet ale yematgegnbet
Bekidan bets’elot qidase seatat
Ante yeset’eኸgn yemenfes Kidus hebt
Melsen wede ante binset’ min ale

VERSE 4
Tewew gudachnn sistachn yiኸw 2
Hebtna nibretes gulbetes mindnew
T’enaye yeset’egn keante beqer manew
Beset’eኸgn edme behywet zemene

VERSE 5
Kegelayes bihon yetgnaw new yene
Keakalates bihon yetgnaw new yene',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bemin-des-lasegnih-getaye-hoy-bemuhaze-sibihat'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 1
ኪሩቤል ሱራፌል ቅዱስ ሥሉስ ያሉህ
መላዕክት በራማ የሚያመሰኑህ
ድንቅ መካር ኃያል ኤልሻዳይ ነህና
ትንቢያ ነኝ ምን ልስጥህ ምንስ አለኝና ፪

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 2
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና በአምላኬ ፊት ልስገድ
ወደ ላይ በሰማይ ወደ ታች በጥልቀት
አምላኬ የት አለ የማትገኝበት

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 3
ጌታ ሆይ የት አለ የማትገኝበት
በኪዳን በፀሎት ቅዳሴ ሰዓታት
አንተ የሰጠኸኝ የመንፈስ ቅዱስ ሀብት
መልሰን ወደ አንተ ብንሰጥ ምን አለ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 4
ተወው ጉዳችንን ስስታችን ይኸው ፪
ሀብትና ንብረቴስ ጉልበቴስ ምንድነው
ጤናዬ የሰጠኝ ከአንተ በቀር ማነው
በሰጠኸኝ እድሜ በሕይወት ዘመኔ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 5
ከገላዬስ ቢሆን የትኛው ነው የኔ
ከአካላቴስ ቢሆን የትኛው ነው የኔ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 1
Kirubel surafel Kidus silus yaluh
Melaekt berama yemiyamesenuh
Dinq mekar hayal elshaday nehna
Tinbiya negn min list’h mins alegnna 2

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 2
Qidusun meswaet liul silemiwed
Min yizhe limt’ana beamlake fit lisged
Wede lay besemay wede tach bet’lqet
Amlake yet ale yematgegnbet

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 3
Geta hoy yet ale yematgegnbet
Bekidan bets’elot qidase seatat
Ante yeset’eኸgn yemenfes Kidus hebt
Melsen wede ante binset’ min ale

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 4
Tewew gudachnn sistachn yiኸw 2
Hebtna nibretes gulbetes mindnew
T’enaye yeset’egn keante beqer manew
Beset’eኸgn edme behywet zemene

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 5
Kegelayes bihon yetgnaw new yene
Keakalates bihon yetgnaw new yene

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bemin-des-lasegnih-getaye-hoy-bemuhaze-sibihat', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bemin Etsinanalehu (bemin-etsinanalehu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

VERSE 1
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ
አዝ……………..
ጨለማን አላውቅም በጉዞዬ፤ በሕይወቴ ሁሉ ነህ መሪዬ፤
ተጓዝኩኝ ሌቱን በብርሃን፤ በአንተ አየሁኝ መሻገርን፤/2/

VERSE 2
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….
ማቀርቀሬን ሰበርክ አልኩኝ ቀና፤ በርትቼ ተራመድኩ እንደገና፤
ቃልህ ኃይሌ የሚያጸናኝ፤ በአለት ላይም የተከልከኝ፤/2/

VERSE 3
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….
እንባዬ ታበሰ ስታጽናናኝ፤ ድል የሆነው ሆኖዋል ስትረዳኝ፤
በጠላቴ ፊት ሞገስ ሆንከኝ፤ ለባሪያህም ድል ሰጠኸኝ፤/2/

VERSE 4
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ፤
አዝ…………….
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/',
      lyrics_transliteration = 'Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)
Shekm lekebedew marefiya neh; ejg yeqelele qenber yaleh;
Fiqrh new yemiyasemaragn; belemlem mesk yaqomegn; (2)

VERSE 1
Cher amlak yeewnet dagna; Amanuel lene metamegna
Ch’eleman alawqm beguzoye; behywete hulu neh meriye;
Tegwazkugn letun bebrhan; beante ayehugn meshagern; (2)

VERSE 2
Cher amlak yeewnet dagna Amanuel lene metamegna
Maqerqeren seberk alkugn qena; bertche teramedku endegena;
Qalh hayle yemiyats’enagn; bealet laym yetekelkegn; (2)

VERSE 3
Cher amlak yeewnet dagna Amanuel lene metamegna
Enbaye tabese sitats’nanagn; dil yehonew honowal sitredagn;
Bet’elate fit moges honkegn; lebariyahm dil set’eኸgn; (2)

VERSE 4
Cher amlak yeewnet dagna; Amanuel lene metamegna;
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bemin-etsinanalehu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

VERSE 1
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ
አዝ……………..
ጨለማን አላውቅም በጉዞዬ፤ በሕይወቴ ሁሉ ነህ መሪዬ፤
ተጓዝኩኝ ሌቱን በብርሃን፤ በአንተ አየሁኝ መሻገርን፤/2/

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

VERSE 2
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….
ማቀርቀሬን ሰበርክ አልኩኝ ቀና፤ በርትቼ ተራመድኩ እንደገና፤
ቃልህ ኃይሌ የሚያጸናኝ፤ በአለት ላይም የተከልከኝ፤/2/

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

VERSE 3
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….
እንባዬ ታበሰ ስታጽናናኝ፤ ድል የሆነው ሆኖዋል ስትረዳኝ፤
በጠላቴ ፊት ሞገስ ሆንከኝ፤ ለባሪያህም ድል ሰጠኸኝ፤/2/

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/

VERSE 4
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ፤
አዝ…………….
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)
Shekm lekebedew marefiya neh; ejg yeqelele qenber yaleh;
Fiqrh new yemiyasemaragn; belemlem mesk yaqomegn; (2)

VERSE 1
Cher amlak yeewnet dagna; Amanuel lene metamegna
CHORUS
Ch’eleman alawqm beguzoye; behywete hulu neh meriye;
Tegwazkugn letun bebrhan; beante ayehugn meshagern; (2)

CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)
Shekm lekebedew marefiya neh; ejg yeqelele qenber yaleh;
Fiqrh new yemiyasemaragn; belemlem mesk yaqomegn; (2)

VERSE 2
Cher amlak yeewnet dagna Amanuel lene metamegna
CHORUS
Maqerqeren seberk alkugn qena; bertche teramedku endegena;
Qalh hayle yemiyats’enagn; bealet laym yetekelkegn; (2)

CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)
Shekm lekebedew marefiya neh; ejg yeqelele qenber yaleh;
Fiqrh new yemiyasemaragn; belemlem mesk yaqomegn; (2)

VERSE 3
Cher amlak yeewnet dagna Amanuel lene metamegna
CHORUS
Enbaye tabese sitats’nanagn; dil yehonew honowal sitredagn;
Bet’elate fit moges honkegn; lebariyahm dil set’eኸgn; (2)

CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)
Shekm lekebedew marefiya neh; ejg yeqelele qenber yaleh;
Fiqrh new yemiyasemaragn; belemlem mesk yaqomegn; (2)

VERSE 4
Cher amlak yeewnet dagna; Amanuel lene metamegna;
CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)

CHORUS
Bemn ets’nanalew keleleh; bemn libereta kalagezkegn ;
Ante silaleh new medhenite; qome metayete (2)
Shekm lekebedew marefiya neh; ejg yeqelele qenber yaleh;
Fiqrh new yemiyasemaragn; belemlem mesk yaqomegn; (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bemin-etsinanalehu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bemin Etsnanalew Keleleh (bemin-etsnanalew-keleleh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/

VERSE 1
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ
አዝ……………..

VERSE 2
ጨለማን አላውቅም በጉዞዬ፤ በሕይወቴ ሁሉ ነህ መሪዬ፤
ተጓዝኩኝ ሌቱን በብርሃን፤ በአንተ አየሁኝ መሻገርን፤/2/
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….

VERSE 3
ማቀርቀሬን ሰበርክ አልኩኝ ቀና፤ በርትቼ ተራመድኩ እንደገና፤
ቃልህ ኃይሌ የሚያጸናኝ፤ በአለት ላይም የተከልከኝ፤/2/
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….

VERSE 4
እንባዬ ታበሰ ስታጽናናኝ፤ ድል የሆነው ሆኖዋል ስትረዳኝ፤
በጠላቴ ፊት ሞገስ ሆንከኝ፤ ለባሪያህም ድል ሰጠኸኝ፤/2/
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ፤
አዝ…………….

VERSE 5
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/

VERSE 6
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/',
      lyrics_transliteration = 'bemn tsnanalew keleleh bemn lbereta kalagezkeny
ente slaleh new medhenite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh
fqrh new yemiyasemarany belemlem mesk yaqomeny /2/

VERSE 1
cher emlak yewnet danya emanuel lene metamenya
ez……………..
cheleman elawqm beguzoye behywete hulu neh meriye

VERSE 2
tezkuny letun bebrhan beente eyehuny meshagern /2/
cher emlak yewnet danya emanuel lene metamenya
ez…………….

VERSE 3
maqerqeren seberk elkuny qena bertche teramedku ndegena
qalh hayle yemiyatsenany beelet laym yetekelkeny /2/
cher emlak yewnet danya emanuel lene metamenya

VERSE 4
ez…………….
nbaye tabese statsnanany dl yehonew honowal stredany
betelate fit moges honkeny lebariyahm dl seteheny /2/

VERSE 5
cher emlak yewnet danya emanuel lene metamenya
ez…………….
bemn tsnanalew keleleh bemn lbereta kalagezkeny

VERSE 6
ente slaleh new medhenite qome metayete/2/
bemn tsnanalew keleleh bemn lbereta kalagezkeny
ente slaleh new medhenite qome metayete/2/',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bemin-etsnanalew-keleleh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/

VERSE 1
ሸክም ለከበደው ማረፊያ ነህ፤ እጅግ የቀለለ ቀንበር ያለህ፤
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ
አዝ……………..

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/

VERSE 2
ጨለማን አላውቅም በጉዞዬ፤ በሕይወቴ ሁሉ ነህ መሪዬ፤
ተጓዝኩኝ ሌቱን በብርሃን፤ በአንተ አየሁኝ መሻገርን፤/2/
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/

VERSE 3
ማቀርቀሬን ሰበርክ አልኩኝ ቀና፤ በርትቼ ተራመድኩ እንደገና፤
ቃልህ ኃይሌ የሚያጸናኝ፤ በአለት ላይም የተከልከኝ፤/2/
ቸር አምላክ የእውነት ዳኛ አማኑኤል ለኔ መታመኛ
አዝ…………….

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/

VERSE 4
እንባዬ ታበሰ ስታጽናናኝ፤ ድል የሆነው ሆኖዋል ስትረዳኝ፤
በጠላቴ ፊት ሞገስ ሆንከኝ፤ ለባሪያህም ድል ሰጠኸኝ፤/2/
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል ለኔ መታመኛ፤
አዝ…………….

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/

VERSE 5
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/

VERSE 6
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/

CHORUS
በምን እፅናናለው ከሌለህ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድሐኒቴ፤ ቆሜ መታየቴ/2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
bemn tsnanalew keleleh bemn lbereta kalagezkeny
ente slaleh new medhenite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh
fqrh new yemiyasemarany belemlem mesk yaqomeny /2/

VERSE 1
cher emlak yewnet danya emanuel lene metamenya
ez……………..
cheleman elawqm beguzoye behywete hulu neh meriye

CHORUS
bemn tsnanalew keleleh bemn lbereta kalagezkeny
ente slaleh new medhenite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh
fqrh new yemiyasemarany belemlem mesk yaqomeny /2/

VERSE 2
tezkuny letun bebrhan beente eyehuny meshagern /2/
cher emlak yewnet danya emanuel lene metamenya
ez…………….

CHORUS
bemn tsnanalew keleleh bemn lbereta kalagezkeny
ente slaleh new medhenite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh
fqrh new yemiyasemarany belemlem mesk yaqomeny /2/

VERSE 3
maqerqeren seberk elkuny qena bertche teramedku ndegena
qalh hayle yemiyatsenany beelet laym yetekelkeny /2/
cher emlak yewnet danya emanuel lene metamenya

CHORUS
bemn tsnanalew keleleh bemn lbereta kalagezkeny
ente slaleh new medhenite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh
fqrh new yemiyasemarany belemlem mesk yaqomeny /2/

VERSE 4
ez…………….
nbaye tabese statsnanany dl yehonew honowal stredany
betelate fit moges honkeny lebariyahm dl seteheny /2/

CHORUS
bemn tsnanalew keleleh bemn lbereta kalagezkeny
ente slaleh new medhenite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh
fqrh new yemiyasemarany belemlem mesk yaqomeny /2/

VERSE 5
cher emlak yewnet danya emanuel lene metamenya
ez…………….
bemn tsnanalew keleleh bemn lbereta kalagezkeny

CHORUS
bemn tsnanalew keleleh bemn lbereta kalagezkeny
ente slaleh new medhenite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh
fqrh new yemiyasemarany belemlem mesk yaqomeny /2/

VERSE 6
ente slaleh new medhenite qome metayete/2/
bemn tsnanalew keleleh bemn lbereta kalagezkeny
ente slaleh new medhenite qome metayete/2/

CHORUS
bemn tsnanalew keleleh bemn lbereta kalagezkeny
ente slaleh new medhenite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh
fqrh new yemiyasemarany belemlem mesk yaqomeny /2/'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bemin-etsnanalew-keleleh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bemin Etsnanalew Kelelehign (bemin-etsnanalew-kelelehign)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/

VERSE 1
ሸክም ለከበደው ማረፊያ ነህ እጅግ የቀለለ ቀንበር ያለህ
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል የኔ መታመኛ
አዝ……………..

VERSE 2
ጨለማን አላውቅም በጉዞዬ፤ በሕይወቴ ሁሉ ነህ መሪዬ፤
ተጓዝኩኝ ሌቱን በብርሃን፤ በአንተ አየሁኝ መሻገርን፤/2/
ቸር አምላክ የእውነት ዳኛ አማኑአኤል የኔ መታመኛ
አዝ…………….

VERSE 3
ማቀርቀሬን ሰበርክ አልኩኝ ቀና፤ በርትቼ ተራመድኩ እንደገና፤

VERSE 4
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/

VERSE 5
ቃልህ ኃይሌ የሚያጸናኝ፤ በአለት ላይ የተከልከኝ፤/2/

VERSE 6
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/

VERSE 7
ቸር አምላክ የእውነት ዳኛ አማኑኤል የኔ መታመኛ
አዝ…………….
እንባዬ ታበሰ ስታጽናናኝ፤ ድል የሆነው ሆኖዋል ስትረዳኝ፤

VERSE 8
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/

VERSE 9
በጠላቴ ፊት ሞገስ ሆንከኝ፤ ለባሪያህም ድል ሰጠኸኝ፤/2/
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል የኔ መታመኛ፤
አዝ…………….
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤

VERSE 10
አንተ ስላለህ ነው መድሐኃኒቴ፤ ቆሜ መታየቴ/2/

VERSE 11
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/',
      lyrics_transliteration = 'bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhanite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh

VERSE 1
fqrh new yemiyasemarany belemlem mesk yaqomeny /2/
cher emlak yewnet danya emanuel yene metamenya

VERSE 2
ez……………..
cheleman elawqm beguzoye behywete hulu neh meriye

VERSE 3
tezkuny letun bebrhan beente eyehuny meshagern /2/
cher emlak yewnet danya emanueel yene metamenya
ez…………….

VERSE 4
maqerqeren seberk elkuny qena bertche teramedku ndegena
bemn tsnanalew kelelehny bemn lbereta kalagezkeny

VERSE 5
ente slaleh new medhanite qome metayete/2/
qalh hayle yemiyatsenany beelet lay yetekelkeny /2/

VERSE 6
bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhanite qome metayete/2/
cher emlak yewnet danya emanuel yene metamenya

VERSE 7
ez…………….
nbaye tabese statsnanany dl yehonew honowal stredany

VERSE 8
bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhanite qome metayete/2/

VERSE 9
betelate fit moges honkeny lebariyahm dl seteheny /2/
cher emlak yewnet danya emanuel yene metamenya
ez…………….

VERSE 10
bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhehanite qome metayete/2/

VERSE 11
bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhanite qome metayete/2/',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bemin-etsnanalew-kelelehign'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/

VERSE 1
ሸክም ለከበደው ማረፊያ ነህ እጅግ የቀለለ ቀንበር ያለህ
ፍቅርህ ነው የሚያሰማራኝ፤ በለምለም መስክ ያቆመኝ፤/2/
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል የኔ መታመኛ
አዝ……………..

CHORUS
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/

VERSE 2
ጨለማን አላውቅም በጉዞዬ፤ በሕይወቴ ሁሉ ነህ መሪዬ፤
ተጓዝኩኝ ሌቱን በብርሃን፤ በአንተ አየሁኝ መሻገርን፤/2/
ቸር አምላክ የእውነት ዳኛ አማኑአኤል የኔ መታመኛ
አዝ…………….

CHORUS
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/

VERSE 3
ማቀርቀሬን ሰበርክ አልኩኝ ቀና፤ በርትቼ ተራመድኩ እንደገና፤

CHORUS
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/

VERSE 4
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/

CHORUS
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/

VERSE 5
ቃልህ ኃይሌ የሚያጸናኝ፤ በአለት ላይ የተከልከኝ፤/2/

CHORUS
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/

VERSE 6
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/

CHORUS
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/

VERSE 7
ቸር አምላክ የእውነት ዳኛ አማኑኤል የኔ መታመኛ
አዝ…………….
እንባዬ ታበሰ ስታጽናናኝ፤ ድል የሆነው ሆኖዋል ስትረዳኝ፤

CHORUS
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/

VERSE 8
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/

CHORUS
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/

VERSE 9
በጠላቴ ፊት ሞገስ ሆንከኝ፤ ለባሪያህም ድል ሰጠኸኝ፤/2/
ቸር አምላክ የእውነት ዳኛ፤ አማኑኤል የኔ መታመኛ፤
አዝ…………….
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤

CHORUS
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/

VERSE 10
አንተ ስላለህ ነው መድሐኃኒቴ፤ ቆሜ መታየቴ/2/

CHORUS
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/

VERSE 11
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/

CHORUS
በምን እፅናናለው ከሌለህኝ፤ በምን ልበረታ ካላገዝከኝ ፤
አንተ ስላለህ ነው መድኃኒቴ፤ ቆሜ መታየቴ/2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhanite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh

VERSE 1
fqrh new yemiyasemarany belemlem mesk yaqomeny /2/
cher emlak yewnet danya emanuel yene metamenya

CHORUS
bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhanite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh

VERSE 2
ez……………..
cheleman elawqm beguzoye behywete hulu neh meriye

CHORUS
bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhanite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh

VERSE 3
tezkuny letun bebrhan beente eyehuny meshagern /2/
cher emlak yewnet danya emanueel yene metamenya
ez…………….

CHORUS
bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhanite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh

VERSE 4
maqerqeren seberk elkuny qena bertche teramedku ndegena
bemn tsnanalew kelelehny bemn lbereta kalagezkeny

CHORUS
bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhanite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh

VERSE 5
ente slaleh new medhanite qome metayete/2/
qalh hayle yemiyatsenany beelet lay yetekelkeny /2/

CHORUS
bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhanite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh

VERSE 6
bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhanite qome metayete/2/
cher emlak yewnet danya emanuel yene metamenya

CHORUS
bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhanite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh

VERSE 7
ez…………….
nbaye tabese statsnanany dl yehonew honowal stredany

CHORUS
bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhanite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh

VERSE 8
bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhanite qome metayete/2/

CHORUS
bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhanite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh

VERSE 9
betelate fit moges honkeny lebariyahm dl seteheny /2/
cher emlak yewnet danya emanuel yene metamenya
ez…………….

CHORUS
bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhanite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh

VERSE 10
bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhehanite qome metayete/2/

CHORUS
bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhanite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh

VERSE 11
bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhanite qome metayete/2/

CHORUS
bemn tsnanalew kelelehny bemn lbereta kalagezkeny
ente slaleh new medhanite qome metayete/2/
shekm lekebedew marefiya neh jg yeqelele qenber yaleh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bemin-etsnanalew-kelelehign', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bemin Siraye (bemin-siraye)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ

VERSE 1
ክርስቲያን በሚል ስም እራሴን ሸፍኜ
ስትመረምረኝ ግን ፍሬ አልባ በለስ ነኝ
ትዕግስትህ ደንቆኛል እንዴት እንዳኖርከኝ (2)
ወይ በራድ ወይ ትኩስ ሳልሆን ለብ ብዬ

VERSE 2
ወደኔ ስትመጣ ባዶ ነኝ ጌታዬ
በሰርግህ ለመግባት ልብሴን ሳላፀዳ
እንደ አብርሃም ቤቴ መች ትሆን እንግዳ (2)
በቃልህ ታንፄ ካልተስተካከልኩኝ

VERSE 3
እኔ ሳልለወጥ ወንጌሉን ከያዝኩኝ
የቱ ምግባሬ ነው ሌላውን የሚያንፅ
ልቤን ስበርልኝ ዛሬ ይብቃኝ አመፅ (2)
ሰማያት በፊትህ ንፁሀን አይደሉም

VERSE 4
በትር ብታነሳ ማንስ ፊትህ ሊቆም
በንስሀ ውሃ ልታጠብ ሀጥያቴን
ይብቃኝ መበደሉ የእውነት ያንተ ልሁን (2)',
      lyrics_transliteration = 'Bemn siraye fith eqomalew bemn migbare
Fiqr nehna teqebelegn bemhret zare
Lijh negnna teqebelegn yekenferen fire (2)
Baltesebere lib kebeth wist’ hogne

VERSE 1
Kirstiyan bemil sim erasen shefgne
Sitmeremregn gin fire alba beles negn
Tiegsth denqognal endet endanorkegn (2)
Wey berad wey tikus salhon leb biye

VERSE 2
Wedene sitmet’a bado negn Getaye
Besergh lemegbat libsen salats’eda
Ende abrham bete mech tihon engda (2)
Beqalh tants’e kaltestekakelkugn

VERSE 3
Ene sallewet’ wengelun keyazkugn
Yetu migbare new lelawn yemiyants’
Liben siberlgn zare yibqagn amets’ (2)
Semayat befith nits’uhen aydelum

VERSE 4
Betr bitanesa mans fith liqom
Benshe wiha litat’eb het’yaten
Yibqagn mebedelu yeewnet yante lihun (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bemin-siraye'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ

VERSE 1
ክርስቲያን በሚል ስም እራሴን ሸፍኜ
ስትመረምረኝ ግን ፍሬ አልባ በለስ ነኝ
ትዕግስትህ ደንቆኛል እንዴት እንዳኖርከኝ (2)
ወይ በራድ ወይ ትኩስ ሳልሆን ለብ ብዬ

CHORUS
በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ

VERSE 2
ወደኔ ስትመጣ ባዶ ነኝ ጌታዬ
በሰርግህ ለመግባት ልብሴን ሳላፀዳ
እንደ አብርሃም ቤቴ መች ትሆን እንግዳ (2)
በቃልህ ታንፄ ካልተስተካከልኩኝ

CHORUS
በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ

VERSE 3
እኔ ሳልለወጥ ወንጌሉን ከያዝኩኝ
የቱ ምግባሬ ነው ሌላውን የሚያንፅ
ልቤን ስበርልኝ ዛሬ ይብቃኝ አመፅ (2)
ሰማያት በፊትህ ንፁሀን አይደሉም

CHORUS
በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ

VERSE 4
በትር ብታነሳ ማንስ ፊትህ ሊቆም
በንስሀ ውሃ ልታጠብ ሀጥያቴን
ይብቃኝ መበደሉ የእውነት ያንተ ልሁን (2)

CHORUS
በምን ስራዬ ፊትህ እቆማለው በምን ምግባሬ
ፍቅር ነህና ተቀበለኝ በምህረት ዛሬ
ልጅህ ነኝና ተቀበለኝ የከንፈሬን ፍሬ (2)
ባልተሰበረ ልብ ከቤትህ ውስጥ ሆኜ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bemn siraye fith eqomalew bemn migbare
Fiqr nehna teqebelegn bemhret zare
Lijh negnna teqebelegn yekenferen fire (2)
Baltesebere lib kebeth wist’ hogne

VERSE 1
Kirstiyan bemil sim erasen shefgne
Sitmeremregn gin fire alba beles negn
Tiegsth denqognal endet endanorkegn (2)
Wey berad wey tikus salhon leb biye

CHORUS
Bemn siraye fith eqomalew bemn migbare
Fiqr nehna teqebelegn bemhret zare
Lijh negnna teqebelegn yekenferen fire (2)
Baltesebere lib kebeth wist’ hogne

VERSE 2
Wedene sitmet’a bado negn Getaye
Besergh lemegbat libsen salats’eda
Ende abrham bete mech tihon engda (2)
Beqalh tants’e kaltestekakelkugn

CHORUS
Bemn siraye fith eqomalew bemn migbare
Fiqr nehna teqebelegn bemhret zare
Lijh negnna teqebelegn yekenferen fire (2)
Baltesebere lib kebeth wist’ hogne

VERSE 3
Ene sallewet’ wengelun keyazkugn
Yetu migbare new lelawn yemiyants’
Liben siberlgn zare yibqagn amets’ (2)
Semayat befith nits’uhen aydelum

CHORUS
Bemn siraye fith eqomalew bemn migbare
Fiqr nehna teqebelegn bemhret zare
Lijh negnna teqebelegn yekenferen fire (2)
Baltesebere lib kebeth wist’ hogne

VERSE 4
Betr bitanesa mans fith liqom
Benshe wiha litat’eb het’yaten
Yibqagn mebedelu yeewnet yante lihun (2)

CHORUS
Bemn siraye fith eqomalew bemn migbare
Fiqr nehna teqebelegn bemhret zare
Lijh negnna teqebelegn yekenferen fire (2)
Baltesebere lib kebeth wist’ hogne'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bemin-siraye', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Beriban Ene Negn (beriban-ene-negn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በርባን ይፈታ በርባን ይፈታ
ይሰቀል ክርስቶስ ይሰቀል ጌታ
የሚለው ጩኸት ሆነ መዳኛዬ
በርባን እኔ ነኝ ማረኝ ጌታዬ

VERSE 1
በአንተ መታሰር እስሬ ተፈትቶ
በአንተ መጎተት ቀንበሬ ላልቶ
ነጻ የወጣሁ ኃጢአተኛ
እኔ ነኝ የዓለም ክፉ ወንጀለኛ

VERSE 2
አንተ ተጠልተህ የተወደድሁት
አንተ ተዋርደህ የተከበርኩት
በርባን እኔ ነኝ ውለታ ቢስዋ
የዋልክልኝን ሁሌ የምረሳ

VERSE 3
ዘውድ እንድቀዳጅ እሾኽ ደፍተሃል
ለነጻነቴ ተቸንክረሃል
እኔ ግን ተመለስኩ ወደ ኃጢአቴ
መች ተወኝና በርባንነቴ',
      lyrics_transliteration = 'Berban yifeta berban yifeta
Yiseqel Kristos yiseqel Geta
Yemilew ch’uኸt hone medagnaye
Berban ene negn maregn Getaye

VERSE 1
Beante metaser esre tefetto
Beante megotet qenbere lalto
Nets’a yewet’ahu hat’iategna
Ene negn yealem kifu wenjelegna

VERSE 2
Ante tet’elteh yetewededhut
Ante tewardeh yetekeberkut
Berban ene negn wileta biswa
Yewalklgnn hule yemresa

VERSE 3
Zewd endqedaj eshoኽ deftehal
Lenets’anete techenkrehal
Ene gin temelesku wede hat’iate
Mech tewegnna berbannete',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'beriban-ene-negn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በርባን ይፈታ በርባን ይፈታ
ይሰቀል ክርስቶስ ይሰቀል ጌታ
የሚለው ጩኸት ሆነ መዳኛዬ
በርባን እኔ ነኝ ማረኝ ጌታዬ

VERSE 1
በአንተ መታሰር እስሬ ተፈትቶ
በአንተ መጎተት ቀንበሬ ላልቶ
ነጻ የወጣሁ ኃጢአተኛ
እኔ ነኝ የዓለም ክፉ ወንጀለኛ

CHORUS
በርባን ይፈታ በርባን ይፈታ
ይሰቀል ክርስቶስ ይሰቀል ጌታ
የሚለው ጩኸት ሆነ መዳኛዬ
በርባን እኔ ነኝ ማረኝ ጌታዬ

VERSE 2
አንተ ተጠልተህ የተወደድሁት
አንተ ተዋርደህ የተከበርኩት
በርባን እኔ ነኝ ውለታ ቢስዋ
የዋልክልኝን ሁሌ የምረሳ

CHORUS
በርባን ይፈታ በርባን ይፈታ
ይሰቀል ክርስቶስ ይሰቀል ጌታ
የሚለው ጩኸት ሆነ መዳኛዬ
በርባን እኔ ነኝ ማረኝ ጌታዬ

VERSE 3
ዘውድ እንድቀዳጅ እሾኽ ደፍተሃል
ለነጻነቴ ተቸንክረሃል
እኔ ግን ተመለስኩ ወደ ኃጢአቴ
መች ተወኝና በርባንነቴ

CHORUS
በርባን ይፈታ በርባን ይፈታ
ይሰቀል ክርስቶስ ይሰቀል ጌታ
የሚለው ጩኸት ሆነ መዳኛዬ
በርባን እኔ ነኝ ማረኝ ጌታዬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Berban yifeta berban yifeta
Yiseqel Kristos yiseqel Geta
Yemilew ch’uኸt hone medagnaye
Berban ene negn maregn Getaye

VERSE 1
Beante metaser esre tefetto
Beante megotet qenbere lalto
Nets’a yewet’ahu hat’iategna
Ene negn yealem kifu wenjelegna

CHORUS
Berban yifeta berban yifeta
Yiseqel Kristos yiseqel Geta
Yemilew ch’uኸt hone medagnaye
Berban ene negn maregn Getaye

VERSE 2
Ante tet’elteh yetewededhut
Ante tewardeh yetekeberkut
Berban ene negn wileta biswa
Yewalklgnn hule yemresa

CHORUS
Berban yifeta berban yifeta
Yiseqel Kristos yiseqel Geta
Yemilew ch’uኸt hone medagnaye
Berban ene negn maregn Getaye

VERSE 3
Zewd endqedaj eshoኽ deftehal
Lenets’anete techenkrehal
Ene gin temelesku wede hat’iate
Mech tewegnna berbannete

CHORUS
Berban yifeta berban yifeta
Yiseqel Kristos yiseqel Geta
Yemilew ch’uኸt hone medagnaye
Berban ene negn maregn Getaye'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'beriban-ene-negn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Beritemiyos Negn (beritemiyos-negn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 1
ከሩቅ የሰማሁት የጌታዬ ድምፁን
ከብዙ ሁካታ ጉርምርምታ መሃል
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
የልቦናዬ አይን ፈፅሞ ታውሯል

VERSE 2
አይኔን ፈውስልኝ በርጠሚዮስ ይላል
አብዝቼ እጮሀለው ጌታ ማረኝ ብዬ
በውስጤ እየታየኝ ሲምረኝ ጌታዬ።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

VERSE 3
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
አንተን አይሰማህም ይሉኛል ብዙዎች

VERSE 4
በኅጥያት ሰንሰለት ታስረሃል እግር ከወርች
ስለዚህ አትልፋ ሲኦልን ጠብቃት
እንደዚህ ቢሉኝም እጮሀለው ሳልታክት።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

VERSE 5
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
የከበበውን ሰው ገለል በሉ እያለ

VERSE 6
በደሌን በደሙ ዋጋ እየከፈለ
ስለእኔ የሞተው ኢየሱስ ይመጣል
የልቦናዬን አይን ገልጦ ያሳየኛል።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

VERSE 7
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
አብዝቼ እጮሀለው ጌታ ማረኝ ብዬ

VERSE 8
በግልፅ እየታየኝ ሲምረኝ ጌታዬ
በውስጤ በደልስ ህይወቴ ዝላለች
በአምላኬ ቸርነት ህይወት ካላገኘች።',
      lyrics_transliteration = 'Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 1
Keruq yesemahut yegetaye dimts’un
Kebzu hukata gurmrmta mehal
YeKristos dimts’u beglts’ yisemagnal.
Yelbonaye ayn fets’mo tawrwal

VERSE 2
Aynen fewslgn bert’emiyos yilal
Abzche ech’ohelew Geta maregn biye
Bewst’e eyetayegn simregn getaye.
Bert’emiyes negn ayne siwr miskin,

VERSE 3
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Anten aysemahm yilugnal bizuwoch

VERSE 4
Beht’yat senselet tasrehal egr kewerch
Silezih atlfa sioln t’ebqat
Endezih bilugnm ech’ohelew saltakt.
Bert’emiyes negn ayne siwr miskin,

VERSE 5
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Yekebebewn sew gelel belu eyale

VERSE 6
Bedelen bedemu waga eyekefele
Sileene yemotew Iyesus yimet’al
Yelbonayen ayn gelt’o yasayegnal.
Bert’emiyes negn ayne siwr miskin,

VERSE 7
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Abzche ech’ohelew Geta maregn biye

VERSE 8
Beglts’ eyetayegn simregn Getaye
Bewst’e bedels hiywete zilalech
Beamlake chernet hiywet kalagegnech.',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'beritemiyos-negn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 1
ከሩቅ የሰማሁት የጌታዬ ድምፁን
ከብዙ ሁካታ ጉርምርምታ መሃል
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
የልቦናዬ አይን ፈፅሞ ታውሯል

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 2
አይኔን ፈውስልኝ በርጠሚዮስ ይላል
አብዝቼ እጮሀለው ጌታ ማረኝ ብዬ
በውስጤ እየታየኝ ሲምረኝ ጌታዬ።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 3
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
አንተን አይሰማህም ይሉኛል ብዙዎች

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 4
በኅጥያት ሰንሰለት ታስረሃል እግር ከወርች
ስለዚህ አትልፋ ሲኦልን ጠብቃት
እንደዚህ ቢሉኝም እጮሀለው ሳልታክት።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 5
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
የከበበውን ሰው ገለል በሉ እያለ

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 6
በደሌን በደሙ ዋጋ እየከፈለ
ስለእኔ የሞተው ኢየሱስ ይመጣል
የልቦናዬን አይን ገልጦ ያሳየኛል።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 7
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
አብዝቼ እጮሀለው ጌታ ማረኝ ብዬ

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 8
በግልፅ እየታየኝ ሲምረኝ ጌታዬ
በውስጤ በደልስ ህይወቴ ዝላለች
በአምላኬ ቸርነት ህይወት ካላገኘች።

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘምራን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 1
Keruq yesemahut yegetaye dimts’un
Kebzu hukata gurmrmta mehal
YeKristos dimts’u beglts’ yisemagnal.
Yelbonaye ayn fets’mo tawrwal

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 2
Aynen fewslgn bert’emiyos yilal
Abzche ech’ohelew Geta maregn biye
Bewst’e eyetayegn simregn getaye.
Bert’emiyes negn ayne siwr miskin,

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 3
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Anten aysemahm yilugnal bizuwoch

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 4
Beht’yat senselet tasrehal egr kewerch
Silezih atlfa sioln t’ebqat
Endezih bilugnm ech’ohelew saltakt.
Bert’emiyes negn ayne siwr miskin,

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 5
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Yekebebewn sew gelel belu eyale

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 6
Bedelen bedemu waga eyekefele
Sileene yemotew Iyesus yimet’al
Yelbonayen ayn gelt’o yasayegnal.
Bert’emiyes negn ayne siwr miskin,

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 7
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Abzche ech’ohelew Geta maregn biye

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 8
Beglts’ eyetayegn simregn Getaye
Bewst’e bedels hiywete zilalech
Beamlake chernet hiywet kalagegnech.

CHORUS
Bert’emiyos negn
Liqe mezemran yilma haylu
+++
Bert’emiyes negn ayne siwr miskin'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'beritemiyos-negn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Beritemiyos Negn (beritemiyos-negn-bupmngp_p5g)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 1
ከሩቅ የሰማሁት የጌታዬ ድምፁን
ከብዙ ሁካታ ጉርምርምታ መሃል
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
የልቦናዬ አይን ፈፅሞ ታውሯል

VERSE 2
አይኔን ፈውስልኝ በርጠሚዮስ ይላል
አብዝቼ እጮሀለው ጌታ ማረኝ ብዬ
በውስጤ እየታየኝ ሲምረኝ ጌታዬ።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

VERSE 3
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
አንተን አይሰማህም ይሉኛል ብዙዎች

VERSE 4
በኅጥያት ሰንሰለት ታስረሃል እግር ከወርች
ስለዚህ አትልፋ ሲኦልን ጠብቃት
እንደዚህ ቢሉኝም እጮሀለው ሳልታክት።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

VERSE 5
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
የከበበውን ሰው ገለል በሉ እያለ

VERSE 6
በደሌን በደሙ ዋጋ እየከፈለ
ስለእኔ የሞተው ኢየሱስ ይመጣል
የልቦናዬን አይን ገልጦ ያሳየኛል።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

VERSE 7
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
አብዝቼ እጮሀለው ጌታ ማረኝ ብዬ

VERSE 8
በግልፅ እየታየኝ ሲምረኝ ጌታዬ
በውስጤ በደልስ ህይወቴ ዝላለች
በአምላኬ ቸርነት ህይወት ካላገኘች።',
      lyrics_transliteration = 'Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 1
Keruq yesemahut yegetaye dimts’un
Kebzu hukata gurmrmta mehal
YeKristos dimts’u beglts’ yisemagnal.
Yelbonaye ayn fets’mo tawrwal

VERSE 2
Aynen fewslgn bert’emiyos yilal
Abzche ech’ohelew Geta maregn biye
Bewst’e eyetayegn simregn getaye.
Bert’emiyes negn ayne siwr miskin,

VERSE 3
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Anten aysemahm yilugnal bizuwoch

VERSE 4
Beht’yat senselet tasrehal egr kewerch
Silezih atlfa sioln t’ebqat
Endezih bilugnm ech’ohelew saltakt.
Bert’emiyes negn ayne siwr miskin,

VERSE 5
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Yekebebewn sew gelel belu eyale

VERSE 6
Bedelen bedemu waga eyekefele
Sileene yemotew Iyesus yimet’al
Yelbonayen ayn gelt’o yasayegnal.
Bert’emiyes negn ayne siwr miskin,

VERSE 7
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Abzche ech’ohelew Geta maregn biye

VERSE 8
Beglts’ eyetayegn simregn Getaye
Bewst’e bedels hiywete zilalech
Beamlake chernet hiywet kalagegnech.',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'beritemiyos-negn-bupmngp_p5g'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 1
ከሩቅ የሰማሁት የጌታዬ ድምፁን
ከብዙ ሁካታ ጉርምርምታ መሃል
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
የልቦናዬ አይን ፈፅሞ ታውሯል

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 2
አይኔን ፈውስልኝ በርጠሚዮስ ይላል
አብዝቼ እጮሀለው ጌታ ማረኝ ብዬ
በውስጤ እየታየኝ ሲምረኝ ጌታዬ።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 3
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
አንተን አይሰማህም ይሉኛል ብዙዎች

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 4
በኅጥያት ሰንሰለት ታስረሃል እግር ከወርች
ስለዚህ አትልፋ ሲኦልን ጠብቃት
እንደዚህ ቢሉኝም እጮሀለው ሳልታክት።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 5
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
የከበበውን ሰው ገለል በሉ እያለ

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 6
በደሌን በደሙ ዋጋ እየከፈለ
ስለእኔ የሞተው ኢየሱስ ይመጣል
የልቦናዬን አይን ገልጦ ያሳየኛል።
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን፣

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 7
ከሩቅ የሰማሁት የጌታዬ ድምፁን፣
ከብዙ ሁካታ ጉርምርምታ መሃል፣
የክርስቶስ ድምፁ በግልፅ ይሰማኛል።
አብዝቼ እጮሀለው ጌታ ማረኝ ብዬ

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን

VERSE 8
በግልፅ እየታየኝ ሲምረኝ ጌታዬ
በውስጤ በደልስ ህይወቴ ዝላለች
በአምላኬ ቸርነት ህይወት ካላገኘች።

CHORUS
በርጠሚዮስ ነኝ
ሊቀ መዘም���ን ይልማ ኃይሉ
+++
በርጠሚዬስ ነኝ አይነ ስውር ምስኪን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 1
Keruq yesemahut yegetaye dimts’un
Kebzu hukata gurmrmta mehal
YeKristos dimts’u beglts’ yisemagnal.
Yelbonaye ayn fets’mo tawrwal

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 2
Aynen fewslgn bert’emiyos yilal
Abzche ech’ohelew Geta maregn biye
Bewst’e eyetayegn simregn getaye.
Bert’emiyes negn ayne siwr miskin,

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 3
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Anten aysemahm yilugnal bizuwoch

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 4
Beht’yat senselet tasrehal egr kewerch
Silezih atlfa sioln t’ebqat
Endezih bilugnm ech’ohelew saltakt.
Bert’emiyes negn ayne siwr miskin,

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 5
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Yekebebewn sew gelel belu eyale

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 6
Bedelen bedemu waga eyekefele
Sileene yemotew Iyesus yimet’al
Yelbonayen ayn gelt’o yasayegnal.
Bert’emiyes negn ayne siwr miskin,

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 7
Keruq yesemahut yegetaye dimts’un,
Kebzu hukata gurmrmta mehal,
YeKristos dimts’u beglts’ yisemagnal.
Abzche ech’ohelew Geta maregn biye

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin

VERSE 8
Beglts’ eyetayegn simregn Getaye
Bewst’e bedels hiywete zilalech
Beamlake chernet hiywet kalagegnech.

CHORUS
Bert’emiyos negn
Liqe mezem���n yilma haylu
+++
Bert’emiyes negn ayne siwr miskin'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'beritemiyos-negn-bupmngp_p5g', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bersua Tseleyu (bersua-tseleyu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 1
ቤተክርስቲያን ቅድስት
ወማህበረነ ውስቴታ
ሐዋርያት በሰበኳት
ድል ነሽዎች በሞቱላት

VERSE 2
ደናግላን በመነኑላት
ስለእርሷ በኖሩላት
ጸልዩ በሐበ ዛቲ
ቤተክርስቲያን ቅድስት

VERSE 3
ወማህበረነ ውስቴታ
የሰማይ ደጅ በሆነች
ከጽንፍ እስከ ጽንፍ በተሰራች
የምስጋና ዥረት በሚፈስባት

VERSE 4
ጸልዩ በርሷ በእውነት
ጸልዩ በሐበ ዛቲ
ቤተክርስቲያን ቅድስት
ወማህበረነ ውስቴታ

VERSE 5
ስጋውና ደሙ በሚሰዋባት
መላዕክቱ በሚረቡባት
ከፍ ብላ በተሰራች
በመስቀሉ ድል ባረገች

VERSE 6
ጸልዩ በሐበ ዛቲ
ቤተክርስቲያን ቅድስት
ወማህበረነ ውስቴታ',
      lyrics_transliteration = 'Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati

VERSE 1
Bete Kristian Kidist
Wemahberene wisteta
Hewaryat besebekwat
Dil neshwoch bemotulat

VERSE 2
Denaglan bemenenulat
Sileerswa benorulat
Ts’elyu behebe zati
Bete Kristian Kidist

VERSE 3
Wemahberene wisteta
Yesemay dej behonech
Kets’nf eske ts’nf beteserach
Yemsgana zhret bemifesbat

VERSE 4
Ts’elyu berswa beewnet
Ts’elyu behebe zati
Bete Kristian Kidist
Wemahberene wisteta

VERSE 5
Sigawna demu bemisewabat
Melaektu bemirebubat
Kef bila beteserach
Bemesqelu dil baregech

VERSE 6
Ts’elyu behebe zati
Bete Kristian Kidist
Wemahberene wisteta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bersua-tseleyu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 1
ቤተክርስቲያን ቅድስት
ወማህበረነ ውስቴታ
ሐዋርያት በሰበኳት
ድል ነሽዎች በሞቱላት

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 2
ደናግላን በመነኑላት
ስለእርሷ በኖሩላት
ጸልዩ በሐበ ዛቲ
ቤተክርስቲያን ቅድስት

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 3
ወማህበረነ ውስቴታ
የሰማይ ደጅ በሆነች
ከጽንፍ እስከ ጽንፍ በተሰራች
የምስጋና ዥረት በሚፈስባት

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 4
ጸልዩ በርሷ በእውነት
ጸልዩ በሐበ ዛቲ
ቤተክርስቲያን ቅድስት
ወማህበረነ ውስቴታ

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 5
ስጋውና ደሙ በሚሰዋባት
መላዕክቱ በሚረቡባት
ከፍ ብላ በተሰራች
በመስቀሉ ድል ባረገች

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ

VERSE 6
ጸልዩ በሐበ ዛቲ
ቤተክርስቲያን ቅድስት
ወማህበረነ ውስቴታ

CHORUS
በፍቅሩ በከበረች በደሙ በታነጸች
በዓለመ መላእክት በነበረች
በሰማዕታት ደም በጸናች
ጸልዩ በሐበ ዛቲ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati

VERSE 1
Bete Kristian Kidist
Wemahberene wisteta
Hewaryat besebekwat
Dil neshwoch bemotulat

CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati

VERSE 2
Denaglan bemenenulat
Sileerswa benorulat
Ts’elyu behebe zati
Bete Kristian Kidist

CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati

VERSE 3
Wemahberene wisteta
Yesemay dej behonech
Kets’nf eske ts’nf beteserach
Yemsgana zhret bemifesbat

CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati

VERSE 4
Ts’elyu berswa beewnet
Ts’elyu behebe zati
Bete Kristian Kidist
Wemahberene wisteta

CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati

VERSE 5
Sigawna demu bemisewabat
Melaektu bemirebubat
Kef bila beteserach
Bemesqelu dil baregech

CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati

VERSE 6
Ts’elyu behebe zati
Bete Kristian Kidist
Wemahberene wisteta

CHORUS
Befqru bekeberech bedemu betanets’ech
Bealeme melaekt beneberech
Besemaetat dem bets’enach
Ts’elyu behebe zati'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bersua-tseleyu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bertemiewos_eye_Zemari_Yonas_Gebrekidan_New_Mezmur (bertemiewos-eye-zemari-yonas-gebrekidan-new-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 1
ናይ መድሕነይ ድምጺ ሰሚዐን ኣእዛነይ
''ቲ ዓይነ ልቦናይ ፈጺሙ ዓዊሩ
ኣብርህ ንኣዕይንተይ ልሳነይ ጨዲሩ
መሓረኒ ጎይታይ በርተሜዎስ ኢየ

VERSE 2
ንዓብይ ሳህልኻ ብዓይነይ ኢየ ርእየ
ንዓብይ ምሕረትካ ብዓይነይ ኢየ ርእየ
ኣዝ
ኣይሰምዓካን ኢዩ እንተበሉ ብዙሓት

VERSE 3
ተኣሲርካ ኢኻ ብሰንሰለት ሓጢኣት
ስለዚ ኣይትድከም ሲኦል ተጸበያ
ወላ እንተበሉኒ ዕጫኻ ንሳያ
ናባኻ እጭድር ብ ዓይነይ ከይርእያ

VERSE 4
ኣዝ
ንዝኸበብዎ ግልል በሉ እናበለ
ናይ በደለይ ዋጋ ብደም ዝኸፈለ
ንስለይ ዝሞተ ጎይታይ ክመጽእ ኢዩ

VERSE 5
ንዓይነ ልቦናይ ከብርሃለይ ኢዩ
ንዓይነ ሕልናይ ከብርሃለይ ኢዩ',
      lyrics_transliteration = 'Bertemewos iye ayne siwur miskin
Kab rihuq semaeku dimts’i nayti medhn
Ab maekel aragts’ maekel adebabay
Nay Kristos dimts’i semian aezaney

VERSE 1
Nay medhney dimts’i semian aezaney
''ti ayne libonay fets’imu awiru
Abrh niaeyntey lisaney ch’ediru
Mehareni goytay bertemewos iye

VERSE 2
Niaby sahlኻ biayney iye rieye
Niaby mihretka biayney iye rieye
Az
Aysemakan iyu entebelu bizuhat

VERSE 3
Teasirka iኻ bisenselet hat’iat
Silezi aytdkem siol tets’ebeya
Wela entebeluni ech’aኻ nisaya
Nabaኻ ech’dr b ayney keyreya

VERSE 4
Az
Nizኸbebwo gill belu enabele
Nay bedeley waga bidem ziኸfele
Nisley zimote goytay kimets’e iyu

VERSE 5
Niayne libonay kebrhaley iyu
Niayne hilnay kebrhaley iyu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bertemiewos-eye-zemari-yonas-gebrekidan-new-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 1
ናይ መድሕነይ ድምጺ ሰሚዐን ኣእዛነይ
''ቲ ዓይነ ልቦናይ ፈጺሙ ዓዊሩ
ኣብርህ ንኣዕይንተይ ልሳነይ ጨዲሩ
መሓረኒ ጎይታይ በርተሜዎስ ኢየ

CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 2
ንዓብይ ሳህልኻ ብዓይነይ ኢየ ርእየ
ንዓብይ ምሕረትካ ብዓይነይ ኢየ ርእየ
ኣዝ
ኣይሰምዓካን ኢዩ እንተበሉ ብዙሓት

CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 3
ተኣሲርካ ኢኻ ብሰንሰለት ሓጢኣት
ስለዚ ኣይትድከም ሲኦል ተጸበያ
ወላ እንተበሉኒ ዕጫኻ ንሳያ
ናባኻ እጭድር ብ ዓይነይ ከይርእያ

CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 4
ኣዝ
ንዝኸበብዎ ግልል በሉ እናበለ
ናይ በደለይ ዋጋ ብደም ዝኸፈለ
ንስለይ ዝሞተ ጎይታይ ክመጽእ ኢዩ

CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ

VERSE 5
ንዓይነ ልቦናይ ከብርሃለይ ኢዩ
ንዓይነ ሕልናይ ከብርሃለይ ኢዩ

CHORUS
በርተሜዎስ ኢየ ዓይነ ስዉር ምስኪን
ካብ ርሑቅ ሰማዕኩ ድምጺ ናይቲ መድሕን
ኣብ ማእከል ኣራግጽ ማእከል ኣደባባይ
ናይ ክርስቶስ ድምጺ ሰሚዐን ኣእዛነይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bertemewos iye ayne siwur miskin
Kab rihuq semaeku dimts’i nayti medhn
Ab maekel aragts’ maekel adebabay
Nay Kristos dimts’i semian aezaney

VERSE 1
Nay medhney dimts’i semian aezaney
''ti ayne libonay fets’imu awiru
Abrh niaeyntey lisaney ch’ediru
Mehareni goytay bertemewos iye

CHORUS
Bertemewos iye ayne siwur miskin
Kab rihuq semaeku dimts’i nayti medhn
Ab maekel aragts’ maekel adebabay
Nay Kristos dimts’i semian aezaney

VERSE 2
Niaby sahlኻ biayney iye rieye
Niaby mihretka biayney iye rieye
Az
Aysemakan iyu entebelu bizuhat

CHORUS
Bertemewos iye ayne siwur miskin
Kab rihuq semaeku dimts’i nayti medhn
Ab maekel aragts’ maekel adebabay
Nay Kristos dimts’i semian aezaney

VERSE 3
Teasirka iኻ bisenselet hat’iat
Silezi aytdkem siol tets’ebeya
Wela entebeluni ech’aኻ nisaya
Nabaኻ ech’dr b ayney keyreya

CHORUS
Bertemewos iye ayne siwur miskin
Kab rihuq semaeku dimts’i nayti medhn
Ab maekel aragts’ maekel adebabay
Nay Kristos dimts’i semian aezaney

VERSE 4
Az
Nizኸbebwo gill belu enabele
Nay bedeley waga bidem ziኸfele
Nisley zimote goytay kimets’e iyu

CHORUS
Bertemewos iye ayne siwur miskin
Kab rihuq semaeku dimts’i nayti medhn
Ab maekel aragts’ maekel adebabay
Nay Kristos dimts’i semian aezaney

VERSE 5
Niayne libonay kebrhaley iyu
Niayne hilnay kebrhaley iyu

CHORUS
Bertemewos iye ayne siwur miskin
Kab rihuq semaeku dimts’i nayti medhn
Ab maekel aragts’ maekel adebabay
Nay Kristos dimts’i semian aezaney'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bertemiewos-eye-zemari-yonas-gebrekidan-new-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Beselam Ni (beselam-ni)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በሰላም ንዒ
ንዒ ማርያም (2)

VERSE 1
ትናዝዝኒ (2) ኃዘነ ልብየ (2)

VERSE 2
ምስለ ሚካኤል (2) ወገብርኤል (2)

VERSE 3
ምስለ ሱራፌል (2) ወኪሩቤል (2)

VERSE 4
ምስለ ዑራኤል (2) ወሩፋኤል (2)

VERSE 5
ምስለ ኩሎሙ (2) ቅዱሳን (2)

VERSE 6
ምስለ ወልድኪ (2) አማኑኤል (2)',
      lyrics_transliteration = 'Beselam Ni
Ni Mariyam (2)

VERSE 1
Tinazizeni (2) Hazene libiye (2)

VERSE 2
Misile Mikaeli (2) Wegebirieli (2)

VERSE 3
Misile Surafeli (2) Wekirubeli (2)

VERSE 4
Misile Uraeli (2) Werufaeli (2)

VERSE 5
Misile Kulomu (2) Kidusan (2)

VERSE 6
Misile Welidikī (2) Amanueli (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'beselam-ni'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በሰላም ንዒ
ንዒ ማርያም (2)

VERSE 1
ትናዝዝኒ (2) ኃዘነ ልብየ (2)

CHORUS
በሰላም ንዒ
ንዒ ማርያም (2)

VERSE 2
ምስለ ሚካኤል (2) ወገብርኤል (2)

CHORUS
በሰላም ንዒ
ንዒ ማርያም (2)

VERSE 3
ምስለ ሱራፌል (2) ወኪሩቤል (2)

CHORUS
በሰላም ንዒ
ንዒ ማርያም (2)

VERSE 4
ምስለ ዑራኤል (2) ወሩፋኤል (2)

CHORUS
በሰላም ንዒ
ንዒ ማርያም (2)

VERSE 5
ምስለ ኩሎሙ (2) ቅዱሳን (2)

CHORUS
በሰላም ንዒ
ንዒ ማርያም (2)

VERSE 6
ምስለ ወልድኪ (2) አማኑኤል (2)

CHORUS
በሰላም ንዒ
ንዒ ማርያም (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beselam Ni
Ni Mariyam (2)

VERSE 1
Tinazizeni (2) Hazene libiye (2)

CHORUS
Beselam Ni
Ni Mariyam (2)

VERSE 2
Misile Mikaeli (2) Wegebirieli (2)

CHORUS
Beselam Ni
Ni Mariyam (2)

VERSE 3
Misile Surafeli (2) Wekirubeli (2)

CHORUS
Beselam Ni
Ni Mariyam (2)

VERSE 4
Misile Uraeli (2) Werufaeli (2)

CHORUS
Beselam Ni
Ni Mariyam (2)

VERSE 5
Misile Kulomu (2) Kidusan (2)

CHORUS
Beselam Ni
Ni Mariyam (2)

VERSE 6
Misile Welidikī (2) Amanueli (2)

CHORUS
Beselam Ni
Ni Mariyam (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'beselam-ni', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: besemeh tamegnalew (besemeh-tamegnalew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 1
በለስም ባታፈራ ዘይትም ባይኖር
የህሊና ሰላም አለኝ ካንተ ጋር ስኖር
በአባቶቼ በረከት የባረከኝ
የእስራኤል ታዳጊያቸው ክበርልኝ

VERSE 2
ዘላለም ተመስገን ከፍ በልልኝ
የፈተናዬ መውጫ መልሴ ነህ አንተ
ጨለማውን አሻግረኝ እልፍኙን ከፍተህ
ስታፅናናኝ ኖሬአለሁ ለብዙ ዘመን

VERSE 3
ተገፍቶ መች ይወድቃል በአንተ የሚታመን
አይሞትም ይኖራል በአንተ የሚታመን
ይቅርታና ምህረትህ እነሱ ይምሩኝ
ወጥመድና እንቅፋቱ እንዳያደክሙኝ

VERSE 4
በጽድቅህ ሀሴት ላድርግ በአንተ ልበርታ
መተከዝ ማልቀስ ይብቃኝ አፅናናኝ ጌታ
ተነግሮ አያልቅም የአምላኬ ውለታ
በስምህ ታምኛለሁ እንዳትተወኝ

VERSE 5
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ',
      lyrics_transliteration = 'Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 1
Belesm batafera zeytm baynor
Yehlina selam alegn kante gar sinor
Beabatoche bereket yebarekegn
Yeesrael tadagiyachew kiberlgn

VERSE 2
Zelalem temesgen kef bellgn
Yefetenaye mewch’a melse neh ante
Ch’elemawn ashagregn elfgnun kefteh
Sitats’nanagn norealehu lebzu zemen

VERSE 3
Tegefto mech yiwedqal beante yemitamen
Aymotm yinoral beante yemitamen
Yiqrtana mihreth enesu yimrugn
Wet’medna enqfatu endayadekmugn

VERSE 4
Bets’dqh heset ladrg beante liberta
Metekez malqes yibqagn ats’nanagn Geta
Tenegro ayalqm yeamlake wileta
Besmh tamgnalehu endattewegn

VERSE 5
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'besemeh-tamegnalew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 1
በለስም ባታፈራ ዘይትም ባይኖር
የህሊና ሰላም አለኝ ካንተ ጋር ስኖር
በአባቶቼ በረከት የባረከኝ
የእስራኤል ታዳጊያቸው ክበርልኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 2
ዘላለም ተመስገን ከፍ በልልኝ
የፈተናዬ መውጫ መልሴ ነህ አንተ
ጨለማውን አሻግረኝ እልፍኙን ከፍተህ
ስታፅናናኝ ኖሬአለሁ ለብዙ ዘመን

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 3
ተገፍቶ መች ይወድቃል በአንተ የሚታመን
አይሞትም ይኖራል በአንተ የሚታመን
ይቅርታና ምህረትህ እነሱ ይምሩኝ
ወጥመድና እንቅፋቱ እንዳያደክሙኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 4
በጽድቅህ ሀሴት ላድርግ በአንተ ልበርታ
መተከዝ ማልቀስ ይብቃኝ አፅናናኝ ጌታ
ተነግሮ አያልቅም የአምላኬ ውለታ
በስምህ ታምኛለሁ እንዳትተወኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 5
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 1
Belesm batafera zeytm baynor
Yehlina selam alegn kante gar sinor
Beabatoche bereket yebarekegn
Yeesrael tadagiyachew kiberlgn

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 2
Zelalem temesgen kef bellgn
Yefetenaye mewch’a melse neh ante
Ch’elemawn ashagregn elfgnun kefteh
Sitats’nanagn norealehu lebzu zemen

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 3
Tegefto mech yiwedqal beante yemitamen
Aymotm yinoral beante yemitamen
Yiqrtana mihreth enesu yimrugn
Wet’medna enqfatu endayadekmugn

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 4
Bets’dqh heset ladrg beante liberta
Metekez malqes yibqagn ats’nanagn Geta
Tenegro ayalqm yeamlake wileta
Besmh tamgnalehu endattewegn

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 5
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'besemeh-tamegnalew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Besew Letenake (besew-letenake)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው

VERSE 1
እግዚአብሔር ደርሶ አለሁልህ ያለኝ ያሰው እኔ ነኝ
በተዘጋው ገብቶ በእጆቹ ዳብሶ ከሞት ያዳነኝ
የመርዶዬን ዜና በደስታ ቀይረህ ላስታጠቅከኝ ዜማ
ከመዘመር በቀር የምለው የለኝም አምላኬ ላንተማ

VERSE 2
መጠጊያ ከለላ መደገፊያ ምርኩዝ ባጣሁበት ወራት
በዕንባ ሸለቆ ጉንጮቼ ሲሞሉ አቅቶኝ መፅናናት
ገና ሳልወለድ ከዘላለም በፊት ነገሬን የሰራ
ሳቄን የመለሰ የደለደልኝ የጭንቄን ተራራ

VERSE 3
ባይተዋርነቴን በአፌ ቅኔ ሞልቶ አመስጋኝ ያረገኝ
እንደ ባለ ማዕረግ መወደድ ሳይኖረኝ የተመለከተኝ
እንደተናገረ ያለውን የሚያደርግ አደራ ማይበላ
አለልኝ የምለው እርሱ ብቻ የኔ የነፍሴ ከለላ

VERSE 4
ክፋት በበዛበት በዚህ ክፉ ዘመን የሆንከኝ ወዳጄ
ሲመሽም ሲነጋም የምዘምርልህ በደስታ ፈቅጄ
ሞቴን የማትሻ የልጅነቴ አምላክ መተማመኛዬ
እንባዬን ልታብስ በተዘጋው በኩል መጥተሃል ጌታዬ',
      lyrics_transliteration = 'Besew letenaqe besew letegefa
Besew leteresa angetun ledefa
Abat Egziabher ante neh tesfaw
Yasgonebesewn mersha masreshaw

VERSE 1
Egziabher derso alehulh yalegn yasew ene negn
Betezegaw gebto beejochu dabso kemot yadanegn
Yemerdoyen zena bedesta qeyreh lastat’eqkegn zema
Kemezemer beqer yemlew yelegnm amlake lantema

VERSE 2
Met’egiya kelela medegefiya mirkuz bat’ahubet werat
Beenba sheleqo gunch’oche simolu aqtogn mets’nanat
Gena salweled kezelalem befit negeren yesera
Saqen yemelese yedeledelgn yech’nqen terara

VERSE 3
Baytewarneten beafe qine molto amesgagn yaregegn
Ende bale maereg meweded saynoregn yetemeleketegn
Endetenagere yalewn yemiyaderg adera maybela
Alelgn yemlew ersu bicha yene yenefse kelela

VERSE 4
Kifat bebezabet bezih kifu zemen yehonkegn wedaje
Simeshm sinegam yemzemrlh bedesta feqje
Moten yematsha yeljnete amlak metemamegnaye
Enbayen litabs betezegaw bekul met’tehal Getaye',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'besew-letenake'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው

VERSE 1
እግዚአብሔር ደርሶ አለሁልህ ያለኝ ያሰው እኔ ነኝ
በተዘጋው ገብቶ በእጆቹ ዳብሶ ከሞት ያዳነኝ
የመርዶዬን ዜና በደስታ ቀይረህ ላስታጠቅከኝ ዜማ
ከመዘመር በቀር የምለው የለኝም አምላኬ ላንተማ

CHORUS
በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው

VERSE 2
መጠጊያ ከለላ መደገፊያ ምርኩዝ ባጣሁበት ወራት
በዕንባ ሸለቆ ጉንጮቼ ሲሞሉ አቅቶኝ መፅናናት
ገና ሳልወለድ ከዘላለም በፊት ነገሬን የሰራ
ሳቄን የመለሰ የደለደልኝ የጭንቄን ተራራ

CHORUS
በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው

VERSE 3
ባይተዋርነቴን በአፌ ቅኔ ሞልቶ አመስጋኝ ያረገኝ
እንደ ባለ ማዕረግ መወደድ ሳይኖረኝ የተመለከተኝ
እንደተናገረ ያለውን የሚያደርግ አደራ ማይበላ
አለልኝ የምለው እርሱ ብቻ የኔ የነፍሴ ከለላ

CHORUS
በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው

VERSE 4
ክፋት በበዛበት በዚህ ክፉ ዘመን የሆንከኝ ወዳጄ
ሲመሽም ሲነጋም የምዘምርልህ በደስታ ፈቅጄ
ሞቴን የማትሻ የልጅነቴ አምላክ መተማመኛዬ
እንባዬን ልታብስ በተዘጋው በኩል መጥተሃል ጌታዬ

CHORUS
በሰው ለተናቀ በሰው ለተገፋ
በሰው ለተረሳ አንገቱን ለደፋ
አባት እግዚአብሔር አንተ ነህ ተስፋው
ያስጎነበሰውን መርሻ ማስረሻው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Besew letenaqe besew letegefa
Besew leteresa angetun ledefa
Abat Egziabher ante neh tesfaw
Yasgonebesewn mersha masreshaw

VERSE 1
Egziabher derso alehulh yalegn yasew ene negn
Betezegaw gebto beejochu dabso kemot yadanegn
Yemerdoyen zena bedesta qeyreh lastat’eqkegn zema
Kemezemer beqer yemlew yelegnm amlake lantema

CHORUS
Besew letenaqe besew letegefa
Besew leteresa angetun ledefa
Abat Egziabher ante neh tesfaw
Yasgonebesewn mersha masreshaw

VERSE 2
Met’egiya kelela medegefiya mirkuz bat’ahubet werat
Beenba sheleqo gunch’oche simolu aqtogn mets’nanat
Gena salweled kezelalem befit negeren yesera
Saqen yemelese yedeledelgn yech’nqen terara

CHORUS
Besew letenaqe besew letegefa
Besew leteresa angetun ledefa
Abat Egziabher ante neh tesfaw
Yasgonebesewn mersha masreshaw

VERSE 3
Baytewarneten beafe qine molto amesgagn yaregegn
Ende bale maereg meweded saynoregn yetemeleketegn
Endetenagere yalewn yemiyaderg adera maybela
Alelgn yemlew ersu bicha yene yenefse kelela

CHORUS
Besew letenaqe besew letegefa
Besew leteresa angetun ledefa
Abat Egziabher ante neh tesfaw
Yasgonebesewn mersha masreshaw

VERSE 4
Kifat bebezabet bezih kifu zemen yehonkegn wedaje
Simeshm sinegam yemzemrlh bedesta feqje
Moten yematsha yeljnete amlak metemamegnaye
Enbayen litabs betezegaw bekul met’tehal Getaye

CHORUS
Besew letenaqe besew letegefa
Besew leteresa angetun ledefa
Abat Egziabher ante neh tesfaw
Yasgonebesewn mersha masreshaw'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'besew-letenake', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Besew Zenid (besew-zenid)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በሰው ዘንድ ቢሟጠጥ ተስፋና ደስታ
እኛስ ፈጣሪ አለን ሁሉን የሚረታ
ተስፋ እንደሌላቸው አንሆንም ከቶ
ክርስቶስ አለልን የሚያሳይ አብርቶ/2/

VERSE 1
ያለቀሱ ሁሉ ይስቃሉ አይቀርም
ይለዋዉጠዋል ጌታ መድኃኔዓለም
ማንም ያላሰበው ያልጠበቀውን ድል
ለኛ ለምስኪኖች ጌታ ይሰጠናል

VERSE 2
ማንም ያልጠበቀውን ያልገመተውን ድል
ለኛ ለምስኪኖች ጌታ ይሰጠናል
ሰዎች ቢጠበቡ ገንዘብ ለመሰብሰብ
ይጠላለፋሉ ባልጠበቁት መረብ

VERSE 3
እግዚአብሔርን ይዘው በቅን ካልተጓዙ
ክፋትና ተንኮል ብዙ ነው መዘዙ
ድሆች አስለቅሶ ግፍ የሚሰበስብ
ምን ይመልስ ይሆን ጌታ ፊት ሲቀርብ

VERSE 4
ለዚህች አጭር ዘመን የሚስገበገቡ
አይረኩም አይጠግቡም ድሆች እያስራቡ
የዕህል ሽታ ጠፍቶ መሶቡም ቢራቆት
ተስፋችን ሙሉ ነው እኛስ በጌታ ፊት

VERSE 5
ይህን ክፉ ዘመን ያሻግራል ጌታ
ከሠራን በኋላ በጸሎት እንበርታ',
      lyrics_transliteration = 'Besew zend bimwat’et’ tesfana desta
Egnas fet’ari alen hulun yemireta
Tesfa endelelachew anhonm keto
Kristos aleln yemiyasay abrto (2)

VERSE 1
Yaleqesu hulu yisqalu ayqerm
Yilewawut’ewal Geta Medhanealem
Manm yalasebew yalt’ebeqewn dil
Legna lemskinoch Geta yiset’enal

VERSE 2
Manm yalt’ebeqewn yalgemetewn dil
Legna lemskinoch Geta yiset’enal
Sewoch bit’ebebu genzeb lemesebseb
Yit’elalefalu balt’ebequt mereb

VERSE 3
Egziabhern yizew beqn kaltegwazu
Kifatna tenkol bizu new mezezu
Dihoch asleqso gif yemisebesb
Min yimels yihon Geta fit siqerb

VERSE 4
Lezihch ach’r zemen yemisgebegebu
Ayrekum ayt’egbum dihoch eyasrabu
Yeehl shta t’efto mesobum biraqot
Tesfachn mulu new egnas begeta fit

VERSE 5
Yihn kifu zemen yashagral Geta
Keseran behwala bets’elot enberta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'besew-zenid'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በሰው ዘንድ ቢሟጠጥ ተስፋና ደስታ
እኛስ ፈጣሪ አለን ሁሉን የሚረታ
ተስፋ እንደሌላቸው አንሆንም ከቶ
ክርስቶስ አለልን የሚያሳይ አብርቶ/2/

VERSE 1
ያለቀሱ ሁሉ ይስቃሉ አይቀርም
ይለዋዉጠዋል ጌታ መድኃኔዓለም
ማንም ያላሰበው ያልጠበቀውን ድል
ለኛ ለምስኪኖች ጌታ ይሰጠናል

CHORUS
በሰው ዘንድ ቢሟጠጥ ተስፋና ደስታ
እኛስ ፈጣሪ አለን ሁሉን የሚረታ
ተስፋ እንደሌላቸው አንሆንም ከቶ
ክርስቶስ አለልን የሚያሳይ አብርቶ/2/

VERSE 2
ማንም ያልጠበቀውን ያልገመተውን ድል
ለኛ ለምስኪኖች ጌታ ይሰጠናል
ሰዎች ቢጠበቡ ገንዘብ ለመሰብሰብ
ይጠላለፋሉ ባልጠበቁት መረብ

CHORUS
በሰው ዘንድ ቢሟጠጥ ተስፋና ደስታ
እኛስ ፈጣሪ አለን ሁሉን የሚረታ
ተስፋ እንደሌላቸው አንሆንም ከቶ
ክርስቶስ አለልን የሚያሳይ አብርቶ/2/

VERSE 3
እግዚአብሔርን ይዘው በቅን ካልተጓዙ
ክፋትና ተንኮል ብዙ ነው መዘዙ
ድሆች አስለቅሶ ግፍ የሚሰበስብ
ምን ይመልስ ይሆን ጌታ ፊት ሲቀርብ

CHORUS
በሰው ዘንድ ቢሟጠጥ ተስፋና ደስታ
እኛስ ፈጣሪ አለን ሁሉን የሚረታ
ተስፋ እንደሌላቸው አንሆንም ከቶ
ክርስቶስ አለልን የሚያሳይ አብርቶ/2/

VERSE 4
ለዚህች አጭር ዘመን የሚስገበገቡ
አይረኩም አይጠግቡም ድሆች እያስራቡ
የዕህል ሽታ ጠፍቶ መሶቡም ቢራቆት
ተስፋችን ሙሉ ነው እኛስ በጌታ ፊት

CHORUS
በሰው ዘንድ ቢሟጠጥ ተስፋና ደስታ
እኛስ ፈጣሪ አለን ሁሉን የሚረታ
ተስፋ እንደሌላቸው አንሆንም ከቶ
ክርስቶስ አለልን የሚያሳይ አብርቶ/2/

VERSE 5
ይህን ክፉ ዘመን ያሻግራል ጌታ
ከሠራን በኋላ በጸሎት እንበርታ

CHORUS
በሰው ዘንድ ቢሟጠጥ ተስፋና ደስታ
እኛስ ፈጣሪ አለን ሁሉን የሚረታ
ተስፋ እንደሌላቸው አንሆንም ከቶ
ክርስቶስ አለልን የሚያሳይ አብርቶ/2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Besew zend bimwat’et’ tesfana desta
Egnas fet’ari alen hulun yemireta
Tesfa endelelachew anhonm keto
Kristos aleln yemiyasay abrto (2)

VERSE 1
Yaleqesu hulu yisqalu ayqerm
Yilewawut’ewal Geta Medhanealem
Manm yalasebew yalt’ebeqewn dil
Legna lemskinoch Geta yiset’enal

CHORUS
Besew zend bimwat’et’ tesfana desta
Egnas fet’ari alen hulun yemireta
Tesfa endelelachew anhonm keto
Kristos aleln yemiyasay abrto (2)

VERSE 2
Manm yalt’ebeqewn yalgemetewn dil
Legna lemskinoch Geta yiset’enal
Sewoch bit’ebebu genzeb lemesebseb
Yit’elalefalu balt’ebequt mereb

CHORUS
Besew zend bimwat’et’ tesfana desta
Egnas fet’ari alen hulun yemireta
Tesfa endelelachew anhonm keto
Kristos aleln yemiyasay abrto (2)

VERSE 3
Egziabhern yizew beqn kaltegwazu
Kifatna tenkol bizu new mezezu
Dihoch asleqso gif yemisebesb
Min yimels yihon Geta fit siqerb

CHORUS
Besew zend bimwat’et’ tesfana desta
Egnas fet’ari alen hulun yemireta
Tesfa endelelachew anhonm keto
Kristos aleln yemiyasay abrto (2)

VERSE 4
Lezihch ach’r zemen yemisgebegebu
Ayrekum ayt’egbum dihoch eyasrabu
Yeehl shta t’efto mesobum biraqot
Tesfachn mulu new egnas begeta fit

CHORUS
Besew zend bimwat’et’ tesfana desta
Egnas fet’ari alen hulun yemireta
Tesfa endelelachew anhonm keto
Kristos aleln yemiyasay abrto (2)

VERSE 5
Yihn kifu zemen yashagral Geta
Keseran behwala bets’elot enberta

CHORUS
Besew zend bimwat’et’ tesfana desta
Egnas fet’ari alen hulun yemireta
Tesfa endelelachew anhonm keto
Kristos aleln yemiyasay abrto (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'besew-zenid', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Besimih Tamignalehu (besimih-tamignalehu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 1
በለስም ባታፈራ ዘይትም ባይኖር
የህሊና ሰላም አለኝ ካንተ ጋር ስኖር
በአባቶቼ በረከት የባረከኝ
የእስራኤል ታዳጊያቸው ክበርልኝ

VERSE 2
ዘላለም ተመስገን ከፍ በልልኝ

VERSE 3
የፈተናዬ መውጫ መልሴ ነህ አንተ
ጨለማውን አሻግረኝ እልፍኙን ከፍተህ
ስታፅናናኝ ኖሬአለሁ ለብዙ ዘመን
ተገፍቶ መች ይወድቃል በአንተ የሚታመን

VERSE 4
አይሞትም ይኖራል በአንተ የሚታመን

VERSE 5
ይቅርታና ምህረትህ እነሱ ይምሩኝ
ወጥመድና እንቅፋቱ እንዳያደክሙኝ
በጽድቅህ ሀሴት ላድርግ በአንተ ልበርታ
መተከዝ ማልቀስ ይብቃኝ አፅናናኝ ጌታ

VERSE 6
ተነግሮ አያልቅም የአምላኬ ውለታ
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ

VERSE 7
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ',
      lyrics_transliteration = 'Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 1
Belesm batafera zeytm baynor
Yehlina selam alegn kante gar sinor
Beabatoche bereket yebarekegn
Yeesrael tadagiyachew kiberlgn

VERSE 2
Zelalem temesgen kef bellgn

VERSE 3
Yefetenaye mewch’a melse neh ante
Ch’elemawn ashagregn elfgnun kefteh
Sitats’nanagn norealehu lebzu zemen
Tegefto mech yiwedqal beante yemitamen

VERSE 4
Aymotm yinoral beante yemitamen

VERSE 5
Yiqrtana mihreth enesu yimrugn
Wet’medna enqfatu endayadekmugn
Bets’dqh heset ladrg beante liberta
Metekez malqes yibqagn ats’nanagn Geta

VERSE 6
Tenegro ayalqm yeamlake wileta
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte

VERSE 7
Guzoyen ante aqnalgn qidem kefite',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'besimih-tamignalehu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 1
በለስም ባታፈራ ዘይትም ባይኖር
የህሊና ሰላም አለኝ ካንተ ጋር ስኖር
በአባቶቼ በረከት የባረከኝ
የእስራኤል ታዳጊያቸው ክበርልኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 2
ዘላለም ተመስገን ከፍ በልልኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 3
የፈተናዬ መውጫ መልሴ ነህ አንተ
ጨለማውን አሻግረኝ እልፍኙን ከፍተህ
ስታፅናናኝ ኖሬአለሁ ለብዙ ዘመን
ተገፍቶ መች ይወድቃል በአንተ የሚታመን

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 4
አይሞትም ይኖራል በአንተ የሚታመን

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 5
ይቅርታና ምህረትህ እነሱ ይምሩኝ
ወጥመድና እንቅፋቱ እንዳያደክሙኝ
በጽድቅህ ሀሴት ላድርግ በአንተ ልበርታ
መተከዝ ማልቀስ ይብቃኝ አፅናናኝ ጌታ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 6
ተነግሮ አያልቅም የአምላኬ ውለታ
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 7
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 1
Belesm batafera zeytm baynor
Yehlina selam alegn kante gar sinor
Beabatoche bereket yebarekegn
Yeesrael tadagiyachew kiberlgn

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 2
Zelalem temesgen kef bellgn

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 3
Yefetenaye mewch’a melse neh ante
Ch’elemawn ashagregn elfgnun kefteh
Sitats’nanagn norealehu lebzu zemen
Tegefto mech yiwedqal beante yemitamen

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 4
Aymotm yinoral beante yemitamen

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 5
Yiqrtana mihreth enesu yimrugn
Wet’medna enqfatu endayadekmugn
Bets’dqh heset ladrg beante liberta
Metekez malqes yibqagn ats’nanagn Geta

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 6
Tenegro ayalqm yeamlake wileta
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 7
Guzoyen ante aqnalgn qidem kefite

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'besimih-tamignalehu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Besimih Tamignalehu (besimih-tamignalehu-1618)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 1
በለስም ባታፈራ ዘይትም ባይኖር
የህሊና ሰላም አለኝ ካንተ ጋር ስኖር
በአባቶቼ በረከት የባረከኝ
የእስራኤል ታዳጊያቸው ክበርልኝ

VERSE 2
ዘላለም ተመስገን ከፍ በልልኝ
የፈተናዬ መውጫ መልሴ ነህ አንተ
ጨለማውን አሻግረኝ እልፍኙን ከፍተህ
ስታፅናናኝ ኖሬአለሁ ለብዙ ዘመን

VERSE 3
ተገፍቶ መች ይወድቃል በአንተ የሚታመን
አይሞትም ይኖራል በአንተ የሚታመን
ይቅርታና ምህረትህ እነሱ ይምሩኝ
ወጥመድና እንቅፋቱ እንዳያደክሙኝ

VERSE 4
በጽድቅህ ሀሴት ላድርግ በአንተ ልበርታ
መተከዝ ማልቀስ ይብቃኝ አፅናናኝ ጌታ
ተነግሮ አያልቅም የአምላኬ ውለታ
በስምህ ታምኛለሁ እንዳትተወኝ

VERSE 5
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ',
      lyrics_transliteration = 'Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 1
Belesm batafera zeytm baynor
Yehlina selam alegn kante gar sinor
Beabatoche bereket yebarekegn
Yeesrael tadagiyachew kiberlgn

VERSE 2
Zelalem temesgen kef bellgn
Yefetenaye mewch’a melse neh ante
Ch’elemawn ashagregn elfgnun kefteh
Sitats’nanagn norealehu lebzu zemen

VERSE 3
Tegefto mech yiwedqal beante yemitamen
Aymotm yinoral beante yemitamen
Yiqrtana mihreth enesu yimrugn
Wet’medna enqfatu endayadekmugn

VERSE 4
Bets’dqh heset ladrg beante liberta
Metekez malqes yibqagn ats’nanagn Geta
Tenegro ayalqm yeamlake wileta
Besmh tamgnalehu endattewegn

VERSE 5
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'besimih-tamignalehu-1618'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 1
በለስም ባታፈራ ዘይትም ባይኖር
የህሊና ሰላም አለኝ ካንተ ጋር ስኖር
በአባቶቼ በረከት የባረከኝ
የእስራኤል ታዳጊያቸው ክበርልኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 2
ዘላለም ተመስገን ከፍ በልልኝ
የፈተናዬ መውጫ መልሴ ነህ አንተ
ጨለማውን አሻግረኝ እልፍኙን ከፍተህ
ስታፅናናኝ ኖሬአለሁ ለብዙ ዘመን

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 3
ተገፍቶ መች ይወድቃል በአንተ የሚታመን
አይሞትም ይኖራል በአንተ የሚታመን
ይቅርታና ምህረትህ እነሱ ይምሩኝ
ወጥመድና እንቅፋቱ እንዳያደክሙኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 4
በጽድቅህ ሀሴት ላድርግ በአንተ ልበርታ
መተከዝ ማልቀስ ይብቃኝ አፅናናኝ ጌታ
ተነግሮ አያልቅም የአምላኬ ውለታ
በስምህ ታምኛለሁ እንዳትተወኝ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 5
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

CHORUS
በስምህ ታምኛለሁ እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ፀጥታዬ ነህ ጌታ ሰላም ዕረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 1
Belesm batafera zeytm baynor
Yehlina selam alegn kante gar sinor
Beabatoche bereket yebarekegn
Yeesrael tadagiyachew kiberlgn

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 2
Zelalem temesgen kef bellgn
Yefetenaye mewch’a melse neh ante
Ch’elemawn ashagregn elfgnun kefteh
Sitats’nanagn norealehu lebzu zemen

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 3
Tegefto mech yiwedqal beante yemitamen
Aymotm yinoral beante yemitamen
Yiqrtana mihreth enesu yimrugn
Wet’medna enqfatu endayadekmugn

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 4
Bets’dqh heset ladrg beante liberta
Metekez malqes yibqagn ats’nanagn Geta
Tenegro ayalqm yeamlake wileta
Besmh tamgnalehu endattewegn

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 5
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite

CHORUS
Besmh tamgnalehu endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’taye neh Geta selam erefte
Guzoyen ante aqnalgn qidem kefite'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'besimih-tamignalehu-1618', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Beta Qene (beta-qene-391)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 1
ኃያሉ ሚካኤል ድንቅ አደረገ
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው

VERSE 2
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ
ከዳን ወገን የሆኑ
በእግዚአብሔር ያመኑ

VERSE 3
ማኑሄ የሚባል ሰው
የጌታ አምላክ ታየው
ሚስቱ መካን ነበረች
ልጅንም ያላወለደች

VERSE 4
ሚካኤል ተገልጦላት
በዘር ፍሬ ባረካት
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
በኦፍራህም በጌዴዎን የተገለጠው

VERSE 5
እስራኤልን ከመድያምም ይታደገው
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ
አንተ ጽኑ ሀያል ሰው

VERSE 6
እግዚአብሔር ካንተ ጋር ነው
ክንዱን ላበረታ
ተልኬአለሁ ከጌታ
አይዞህ ጌዴዎን አለው

VERSE 7
ቁርባኑን ያሸተተው
ከኛ ጋር ነው ሚካኤል
ስልፋችንን ይመራል
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው

VERSE 8
በኦርናም ደግሞ ሰይፍን ይዞ
ቆሞ የታየው
ዳዊት በምክር ተስፋውን ፈለገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 9
ኃያሉ ሚካኤል ድንቅ አደረገ
በሶስት ቀን ቸነፈር
እንዳትጠፋ ምድር
ሰባ ሺህ ሰዎች ወድቀው

VERSE 10
መልአኩን ለቀአለው
ለምህረት እመጣለሁ
ለመዓት እልካለሁ
ሰይፉን በአፎቱ መቶዋል

VERSE 11
ሚካኤል ለህዝቡ ቆሞአል
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ስምዖን ጴጥሮስም ከወህብት ገብቶ ያወጣው
የእጆችን ሰንሰለት ፈቶ አደረገው

VERSE 12
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ
በተጠበቂዎች መሃል
ኬፋን ከእንቅልፉ አቀተው

VERSE 13
የተዘጋውንም ጃፍ
አልተሳነውም ማለፍ
ሚካኤል እየመራው
ጴጥሮስ እግሩ የቀናው

VERSE 14
አውቆታል እውነት በርቶ
ዘለለ ስሙን ጠርቶ
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው

VERSE 15
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው

VERSE 16
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ',
      lyrics_transliteration = 'YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 1
Hayalu Mikael dinq aderege
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew

VERSE 2
Hayalu Mikael dinq aderege
Hayalu Mikael dinq aderege
Kedan wegen yehonu
BeEgziabher yamenu

VERSE 3
Manuhe yemibal sew
Yegeta amlak tayew
Mistu mekan neberech
Lijnm yalaweledech

VERSE 4
Mikael tegelt’olat
Bezer fire barekat
YeEgziabher melak simu dinq new
Beofrahm begedewon yetegelet’ew

VERSE 5
Esraeln kemedyamm yitadegew
Hayalu Mikael dinq aderege
Hayalu Mikael dinq aderege
Ante ts’nu heyal sew

VERSE 6
Egziabher kante gar new
Kindun labereta
Telkealehu kegeta
Ayzoh gedewon alew

VERSE 7
Qurbanun yashetetew
Kegna gar new Mikael
Silfachnn yimeral
YeEgziabher melak simu dinq new

VERSE 8
Beornam degmo seyfn yizo
Qomo yetayew
Dawit bemkr tesfawn felegew
Hayalu Mikael dinq aderege

VERSE 9
Hayalu Mikael dinq aderege
Besost qen chenefer
Endatt’efa midr
Seba shih sewoch wedqew

VERSE 10
Melakun leqealew
Lemhret emet’alehu
Lemeat elkalehu
Seyfun beafotu metowal

VERSE 11
Mikael lehzbu qomoal
YeEgziabher melak simu dinq new
Simon p’et’rosm kewehbt gebto yawet’aw
Yeejochn senselet feto aderegew

VERSE 12
Hayalu Mikael dinq aderege
Hayalu Mikael dinq aderege
Betet’ebeqiwoch mehal
Kefan keenqlfu aqetew

VERSE 13
Yetezegawnm jaf
Altesanewm malef
Mikael eyemeraw
P’et’ros egru yeqenaw

VERSE 14
Awqotal ewnet berto
Zelele simun t’erto
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew

VERSE 15
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege
Hayalu Mikael dinq aderege
YeEgziabher melak simu dinq new

VERSE 16
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege
Hayalu Mikael dinq aderege',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'beta-qene-391'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 1
ኃያሉ ሚካኤል ድንቅ አደረገ
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 2
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ
ከዳን ወገን የሆኑ
በእግዚአብሔር ያመኑ

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 3
ማኑሄ የሚባል ሰው
የጌታ አምላክ ታየው
ሚስቱ መካን ነበረች
ልጅንም ያላወለደች

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 4
ሚካኤል ተገልጦላት
በዘር ፍሬ ባረካት
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
በኦፍራህም በጌዴዎን የተገለጠው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 5
እስራኤልን ከመድያምም ይታደገው
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ
አንተ ጽኑ ሀያል ሰው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 6
እግዚአብሔር ካንተ ጋር ነው
ክንዱን ላበረታ
ተልኬአለሁ ከጌታ
አይዞህ ጌዴዎን አለው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 7
ቁርባኑን ያሸተተው
ከኛ ጋር ነው ሚካኤል
ስልፋችንን ይመራል
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 8
በኦርናም ደግሞ ሰይፍን ይዞ
ቆሞ የታየው
ዳዊት በምክር ተስፋውን ፈለገው
ኃያሉ ሚካኤል ድንቅ አደረገ

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 9
ኃያሉ ሚካኤል ድንቅ አደረገ
በሶስት ቀን ቸነፈር
እንዳትጠፋ ምድር
ሰባ ሺህ ሰዎች ወድቀው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 10
መልአኩን ለቀአለው
ለምህረት እመጣለሁ
ለመዓት እልካለሁ
ሰይፉን በአፎቱ መቶዋል

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 11
ሚካኤል ለህዝቡ ቆሞአል
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ስምዖን ጴጥሮስም ከወህብት ገብቶ ያወጣው
የእጆችን ሰንሰለት ፈቶ አደረገው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 12
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ
በተጠበቂዎች መሃል
ኬፋን ከእንቅልፉ አቀተው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 13
የተዘጋውንም ጃፍ
አልተሳነውም ማለፍ
ሚካኤል እየመራው
ጴጥሮስ እግሩ የቀናው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 14
አውቆታል እውነት በርቶ
ዘለለ ስሙን ጠርቶ
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 15
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ

VERSE 16
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ
ኃያሉ ሚካኤል ድንቅ አደረገ

CHORUS
የእግዚአብሔር መልአክ ስሙ ድንቅ ነው
ለጾር አሳው ለምናውሂ እንደነገረው
በመሰዊያው ነበልባሉ ስታረገው
ኃያሉ ሚካኤል ድንቅ አደረገ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 1
Hayalu Mikael dinq aderege
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 2
Hayalu Mikael dinq aderege
Hayalu Mikael dinq aderege
Kedan wegen yehonu
BeEgziabher yamenu

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 3
Manuhe yemibal sew
Yegeta amlak tayew
Mistu mekan neberech
Lijnm yalaweledech

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 4
Mikael tegelt’olat
Bezer fire barekat
YeEgziabher melak simu dinq new
Beofrahm begedewon yetegelet’ew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 5
Esraeln kemedyamm yitadegew
Hayalu Mikael dinq aderege
Hayalu Mikael dinq aderege
Ante ts’nu heyal sew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 6
Egziabher kante gar new
Kindun labereta
Telkealehu kegeta
Ayzoh gedewon alew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 7
Qurbanun yashetetew
Kegna gar new Mikael
Silfachnn yimeral
YeEgziabher melak simu dinq new

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 8
Beornam degmo seyfn yizo
Qomo yetayew
Dawit bemkr tesfawn felegew
Hayalu Mikael dinq aderege

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 9
Hayalu Mikael dinq aderege
Besost qen chenefer
Endatt’efa midr
Seba shih sewoch wedqew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 10
Melakun leqealew
Lemhret emet’alehu
Lemeat elkalehu
Seyfun beafotu metowal

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 11
Mikael lehzbu qomoal
YeEgziabher melak simu dinq new
Simon p’et’rosm kewehbt gebto yawet’aw
Yeejochn senselet feto aderegew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 12
Hayalu Mikael dinq aderege
Hayalu Mikael dinq aderege
Betet’ebeqiwoch mehal
Kefan keenqlfu aqetew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 13
Yetezegawnm jaf
Altesanewm malef
Mikael eyemeraw
P’et’ros egru yeqenaw

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 14
Awqotal ewnet berto
Zelele simun t’erto
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 15
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege
Hayalu Mikael dinq aderege
YeEgziabher melak simu dinq new

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege

VERSE 16
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege
Hayalu Mikael dinq aderege

CHORUS
YeEgziabher melak simu dinq new
Lets’or asaw lemnawhi endenegerew
Bemesewiyaw nebelbalu sitaregew
Hayalu Mikael dinq aderege'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'beta-qene-391', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bete Christianen Antewum'' Zemarit Fasika (bete-christianen-antewum-zemarit-fasika)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 1
ሁሉንም በሁሉ በሚሞላው ጌታ
ሙሽራው የሆነች ቤቱ ተሰኝታ
በክብር በሞገስ በጸጋ ተሞልታ
ደምቃ ትኖራለች ለዓለም አብርታ(፪)

VERSE 2
ዲያቢሎስ ቢጨርስ ቀስቶቹን በሙሉ
ወጥመድ ቢዘረጋ በጉዟችን ሁሉ
እንሻገራለን የአምላክን ስም ጠርተን
አንዳች አይነካንም እርሱን ተጠግተን(፪)

VERSE 3
በስሙ መሰብሰብ በስሙ መስራት
ስለ ስሙ መኖር ለስሙ መሞት
ጠላት ዲያቢሎስን ምን ባያስደስትም
ይህ ነው ክርስትና ይሄ ነው ህይወት(፪)

VERSE 4
ከትውልድ ለትውልድ የምናስረክበው
ለልጅ ልጅ አውርሰን ደስ የምንሰኘው
አይደል ብርና ወርቅ አይደል ሌላ ሀብት
ሐማኖታችን ነው የኛ እርስት ጉልት(፪)',
      lyrics_transliteration = 'Bete kirstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 1
Hulunm behulu bemimolaw Geta
Mushraw yehonech betu tesegnta
Bekbr bemoges bets’ega temolta
Demqa tinoralech lealem abrta (2)

VERSE 2
Diyabilos bich’ers qestochun bemulu
Wet’med bizerega beguzwachn hulu
Enshageralen yeamlakn sim t’erten
Andach aynekanm ersun tet’egten (2)

VERSE 3
Besmu mesebseb besmu mesrat
Sile simu menor lesmu memot
T’elat diyabilosn min bayasdestm
Yih new kirstna yihe new hiywet (2)

VERSE 4
Ketwld letwld yemnasrekbew
Lelj lij awrsen des yemnsegnew
Aydel birna werq aydel lela hebt
Hemanotachn new yegna erst gult (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bete-christianen-antewum-zemarit-fasika'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 1
ሁሉንም በሁሉ በሚሞላው ጌታ
ሙሽራው የሆነች ቤቱ ተሰኝታ
በክብር በሞገስ በጸጋ ተሞልታ
ደምቃ ትኖራለች ለዓለም አብርታ(፪)

CHORUS
ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 2
ዲያቢሎስ ቢጨርስ ቀስቶቹን በሙሉ
ወጥመድ ቢዘረጋ በጉዟችን ሁሉ
እንሻገራለን የአምላክን ስም ጠርተን
አንዳች አይነካንም እርሱን ተጠግተን(፪)

CHORUS
ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 3
በስሙ መሰብሰብ በስሙ መስራት
ስለ ስሙ መኖር ለስሙ መሞት
ጠላት ዲያቢሎስን ምን ባያስደስትም
ይህ ነው ክርስትና ይሄ ነው ህይወት(፪)

CHORUS
ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 4
ከትውልድ ለትውልድ የምናስረክበው
ለልጅ ልጅ አውርሰን ደስ የምንሰኘው
አይደል ብርና ወርቅ አይደል ሌላ ሀብት
ሐማኖታችን ነው የኛ እርስት ጉልት(፪)

CHORUS
ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bete kirstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 1
Hulunm behulu bemimolaw Geta
Mushraw yehonech betu tesegnta
Bekbr bemoges bets’ega temolta
Demqa tinoralech lealem abrta (2)

CHORUS
Bete kirstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 2
Diyabilos bich’ers qestochun bemulu
Wet’med bizerega beguzwachn hulu
Enshageralen yeamlakn sim t’erten
Andach aynekanm ersun tet’egten (2)

CHORUS
Bete kirstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 3
Besmu mesebseb besmu mesrat
Sile simu menor lesmu memot
T’elat diyabilosn min bayasdestm
Yih new kirstna yihe new hiywet (2)

CHORUS
Bete kirstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 4
Ketwld letwld yemnasrekbew
Lelj lij awrsen des yemnsegnew
Aydel birna werq aydel lela hebt
Hemanotachn new yegna erst gult (2)

CHORUS
Bete kirstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bete-christianen-antewum-zemarit-fasika', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bete krestianen anetewem Keto (bete-krestianen-anetewem-keto)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 1
ሁሉንም በሁሉ ለሚሞላው ጌታ
ሙሽራው የሆነ ቤቱ ተሰኝታ
በክብር በሞገስ በጸጋ ተሞልታ
ደምቃ ትኖራለች ለዓለም አብርታ/፪/

VERSE 2
ዲያብሎስ ቢጨርስ ቀስቶቹን በሙሉ
ወጥመድ ቢዘረጋ በጉዞአችን ሁሉ
እንሻገራለን የአምላክን ስም ጠርተን
አንዳች አይነካንም እርሱን ተጠግተን/፪/

VERSE 3
በስሙ መሰብሰብ በስሙ መስራት
ስለ ስሙ መኖር ለስሙ መሞት
ጠላት ዲያብሎስን ምን ባያስደስት
ይህ ነው ክርስትና ይኼ ነው ሕይወት/፪/

VERSE 4
ከትውልድ ለትውልድ የምናስረክበው
ለልጅ ልጅ አውርሰን ደስ የምንሰኘው
አይደል ብርና ወርቅ አይደል ሌላ ሀብት
ሃይማኖታችን ነው የእኛ ርስት ጉልት/፪/',
      lyrics_transliteration = 'Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 1
Hulunm behulu lemimolaw Geta
Mushraw yehone betu tesegnta
Bekbr bemoges bets’ega temolta
Demqa tinoralech lealem abrta (2)

VERSE 2
Diyablos bich’ers qestochun bemulu
Wet’med bizerega beguzoachn hulu
Enshageralen yeamlakn sim t’erten
Andach aynekanm ersun tet’egten (2)

VERSE 3
Besmu mesebseb besmu mesrat
Sile simu menor lesmu memot
T’elat diyablosn min bayasdest
Yih new kirstna yiኼ new hiywet (2)

VERSE 4
Ketwld letwld yemnasrekbew
Lelj lij awrsen des yemnsegnew
Aydel birna werq aydel lela hebt
Haymanotachn new yeegna rist gult (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bete-krestianen-anetewem-keto'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 1
ሁሉንም በሁሉ ለሚሞላው ጌታ
ሙሽራው የሆነ ቤቱ ተሰኝታ
በክብር በሞገስ በጸጋ ተሞልታ
ደምቃ ትኖራለች ለዓለም አብርታ/፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 2
ዲያብሎስ ቢጨርስ ቀስቶቹን በሙሉ
ወጥመድ ቢዘረጋ በጉዞአችን ሁሉ
እንሻገራለን የአምላክን ስም ጠርተን
አንዳች አይነካንም እርሱን ተጠግተን/፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 3
በስሙ መሰብሰብ በስሙ መስራት
ስለ ስሙ መኖር ለስሙ መሞት
ጠላት ዲያብሎስን ምን ባያስደስት
ይህ ነው ክርስትና ይኼ ነው ሕይወት/፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 4
ከትውልድ ለትውልድ የምናስረክበው
ለልጅ ልጅ አውርሰን ደስ የምንሰኘው
አይደል ብርና ወርቅ አይደል ሌላ ሀብት
ሃይማኖታችን ነው የእኛ ርስት ጉልት/፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 1
Hulunm behulu lemimolaw Geta
Mushraw yehone betu tesegnta
Bekbr bemoges bets’ega temolta
Demqa tinoralech lealem abrta (2)

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 2
Diyablos bich’ers qestochun bemulu
Wet’med bizerega beguzoachn hulu
Enshageralen yeamlakn sim t’erten
Andach aynekanm ersun tet’egten (2)

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 3
Besmu mesebseb besmu mesrat
Sile simu menor lesmu memot
T’elat diyablosn min bayasdest
Yih new kirstna yiኼ new hiywet (2)

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 4
Ketwld letwld yemnasrekbew
Lelj lij awrsen des yemnsegnew
Aydel birna werq aydel lela hebt
Haymanotachn new yeegna rist gult (2)

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bete-krestianen-anetewem-keto', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bete Qene (bete-qene-3234)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም

VERSE 1
ሊረዳ ይመጣል ባለ ድሉ ጌታ
ባርኮ ይባርካል ይሆናል ከፍታ
በእሳቱ ውስጥም አለ ከህጻናቱ ጋር
በአሳንበሪ ሆድ ይችላል ሊያስተምር

VERSE 2
ከሞት ጋር የቆመች ነፍስን ይመልሳል
አይችልም ተብሎ እንዴት ይከሰሳል
አትነዋወጡ አይድከም ልባችሁ
ተስፋን አትቁረጡ በእርሱ ባምላካችሁ

VERSE 3
በመቃብር ያሉ ታምራቱን ካዩ
ምድር አሜን ትበል ልክ እንደ ሰማዩ
ጊዜ ሲንሸራተት ያመነ ሲከዳ
ውበትም ሲረግፍ ሲሆን ምድረ በዳ

VERSE 4
ደምግባትን አይቶ አይጥል አያነሳ
ልባችሁ ይታዘዝ እግዚአብሔር ሲነሳ',
      lyrics_transliteration = 'Egziabher tamagn new zarem tilantna
Negem endegena (2)
Bemegudelm zemen zeytu sifets’em
Bet’ornet gize t’oregnaw sidekm

VERSE 1
Lireda yimet’al bale dilu Geta
Barko yibarkal yihonal kefta
Beesatu wist’m ale kehts’anatu gar
Beasanberi hod yichlal liyastemr

VERSE 2
Kemot gar yeqomech nefsn yimelsal
Aychlm teblo endet yikesesal
Atnewawet’u aydkem libachhu
Tesfan atquret’u beersu bamlakachhu

VERSE 3
Bemeqabr yalu tamratun kayu
Midr Amen tibel lik ende semayu
Gize sinsheratet yamene sikeda
Wibetm siregf sihon midre beda

VERSE 4
Demgbatn ayto ayt’l ayanesa
Libachhu yitazez Egziabher sinesa',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bete-qene-3234'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም

VERSE 1
ሊረዳ ይመጣል ባለ ድሉ ጌታ
ባርኮ ይባርካል ይሆናል ከፍታ
በእሳቱ ውስጥም አለ ከህጻናቱ ጋር
በአሳንበሪ ሆድ ይችላል ሊያስተምር

CHORUS
እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም

VERSE 2
ከሞት ጋር የቆመች ነፍስን ይመልሳል
አይችልም ተብሎ እንዴት ይከሰሳል
አትነዋወጡ አይድከም ልባችሁ
ተስፋን አትቁረጡ በእርሱ ባምላካችሁ

CHORUS
እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም

VERSE 3
በመቃብር ያሉ ታምራቱን ካዩ
ምድር አሜን ትበል ልክ እንደ ሰማዩ
ጊዜ ሲንሸራተት ያመነ ሲከዳ
ውበትም ሲረግፍ ሲሆን ምድረ በዳ

CHORUS
እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም

VERSE 4
ደምግባትን አይቶ አይጥል አያነሳ
ልባችሁ ይታዘዝ እግዚአብሔር ሲነሳ

CHORUS
እግዚአብሔር ታማኝ ነው ዛሬም ትላንትና
ነገም እንደገና /፪/
በመጉደልም ዘመን ዘይቱ ሲፈጸም
በጦርነት ግዜ ጦረኛው ሲደክም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabher tamagn new zarem tilantna
Negem endegena (2)
Bemegudelm zemen zeytu sifets’em
Bet’ornet gize t’oregnaw sidekm

VERSE 1
Lireda yimet’al bale dilu Geta
Barko yibarkal yihonal kefta
Beesatu wist’m ale kehts’anatu gar
Beasanberi hod yichlal liyastemr

CHORUS
Egziabher tamagn new zarem tilantna
Negem endegena (2)
Bemegudelm zemen zeytu sifets’em
Bet’ornet gize t’oregnaw sidekm

VERSE 2
Kemot gar yeqomech nefsn yimelsal
Aychlm teblo endet yikesesal
Atnewawet’u aydkem libachhu
Tesfan atquret’u beersu bamlakachhu

CHORUS
Egziabher tamagn new zarem tilantna
Negem endegena (2)
Bemegudelm zemen zeytu sifets’em
Bet’ornet gize t’oregnaw sidekm

VERSE 3
Bemeqabr yalu tamratun kayu
Midr Amen tibel lik ende semayu
Gize sinsheratet yamene sikeda
Wibetm siregf sihon midre beda

CHORUS
Egziabher tamagn new zarem tilantna
Negem endegena (2)
Bemegudelm zemen zeytu sifets’em
Bet’ornet gize t’oregnaw sidekm

VERSE 4
Demgbatn ayto ayt’l ayanesa
Libachhu yitazez Egziabher sinesa

CHORUS
Egziabher tamagn new zarem tilantna
Negem endegena (2)
Bemegudelm zemen zeytu sifets’em
Bet’ornet gize t’oregnaw sidekm'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bete-qene-3234', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Betekirisitiyanin Anitewim Keto (betekirisitiyanin-anitewim-keto)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 1
አዝ▸▸▸▸▸▸▸▸▸▸►
ሁሉንም በሁሉ በሚሞላው ጌታ
ሙሽራው የሆነች ቤቱ ተሰኝታ
በክብር በሞገስ በጸጋ ተሞልታ

VERSE 2
ደምቃ ትኖራለች ለዓለም አብርታ ፪
አዝ▸▸▸▸▸▸▸▸▸▸►
ዲያብሎስ ቢጨርስ ቀስቶቹን በሙሉ
ወጥመድ ቢዘረጋ በጉዞአችን ሁሉ

VERSE 3
እንሻገራለን የአምላክን ስም ጠርተን
አንዳች አይነካንም እርሱን ተጠግተን ፪
አዝ▸▸▸▸▸▸▸▸▸▸►
በስሙ መሰብሰብ በስሙ መስራት

VERSE 4
ስለ ስሙ መኖር ለስሙ መሞት
ጠላት ዲያብሎስን ምን ባያስደስት
ይህ ነው ክርስትና ይኼ ነው ሕይወት ፪
አዝ▸▸▸▸▸▸▸▸▸▸►

VERSE 5
ከትውልድ ለትውልድ የምናስረክበው
ለልጅ ልጅ አውርሰን ደስ የምንሰኘው
አይደል ብርና ወርቅ አይደል ሌላ ሀብት
ሃይማኖታችን ነው የእኛ ርስት ጉልት

VERSE 6
ቤተክርስቲያን ናት የእኛ ርስት ጉልት',
      lyrics_transliteration = 'Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 1
Hulunm behulu bemimolaw Geta
Mushraw yehonech betu tesegnta
Bekbr bemoges bets’ega temolta

VERSE 2
Demqa tinoralech lealem abrta 2
Diyablos bich’ers qestochun bemulu
Wet’med bizerega beguzoachn hulu

VERSE 3
Enshageralen yeamlakn sim t’erten
Andach aynekanm ersun tet’egten 2
Besmu mesebseb besmu mesrat

VERSE 4
Sile simu menor lesmu memot
T’elat diyablosn min bayasdest
Yih new kirstna yiኼ new hiywet 2

VERSE 5
Ketwld letwld yemnasrekbew
Lelj lij awrsen des yemnsegnew
Aydel birna werq aydel lela hebt
Haymanotachn new yeegna rist gult

VERSE 6
Bete Kristian nat yeegna rist gult',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'betekirisitiyanin-anitewim-keto'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 1
አዝ▸▸▸▸▸▸▸▸▸▸►
ሁሉንም በሁሉ በሚሞላው ጌታ
ሙሽራው የሆነች ቤቱ ተሰኝታ
በክብር በሞገስ በጸጋ ተሞልታ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 2
ደምቃ ትኖራለች ለዓለም አብርታ ፪
አዝ▸▸▸▸▸▸▸▸▸▸►
ዲያብሎስ ቢጨርስ ቀስቶቹን በሙሉ
ወጥመድ ቢዘረጋ በጉዞአችን ሁሉ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 3
እንሻገራለን የአምላክን ስም ጠርተን
አንዳች አይነካንም እርሱን ተጠግተን ፪
አዝ▸▸▸▸▸▸▸▸▸▸►
በስሙ መሰብሰብ በስሙ መስራት

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 4
ስለ ስሙ መኖር ለስሙ መሞት
ጠላት ዲያብሎስን ምን ባያስደስት
ይህ ነው ክርስትና ይኼ ነው ሕይወት ፪
አዝ▸▸▸▸▸▸▸▸▸▸►

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 5
ከትውልድ ለትውልድ የምናስረክበው
ለልጅ ልጅ አውርሰን ደስ የምንሰኘው
አይደል ብርና ወርቅ አይደል ሌላ ሀብት
ሃይማኖታችን ነው የእኛ ርስት ጉልት

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 6
ቤተክርስቲያን ናት የእኛ ርስት ጉልት

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 1
CHORUS
Hulunm behulu bemimolaw Geta
Mushraw yehonech betu tesegnta
Bekbr bemoges bets’ega temolta

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 2
Demqa tinoralech lealem abrta 2
CHORUS
Diyablos bich’ers qestochun bemulu
Wet’med bizerega beguzoachn hulu

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 3
Enshageralen yeamlakn sim t’erten
Andach aynekanm ersun tet’egten 2
CHORUS
Besmu mesebseb besmu mesrat

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 4
Sile simu menor lesmu memot
T’elat diyablosn min bayasdest
Yih new kirstna yiኼ new hiywet 2
CHORUS

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 5
Ketwld letwld yemnasrekbew
Lelj lij awrsen des yemnsegnew
Aydel birna werq aydel lela hebt
Haymanotachn new yeegna rist gult

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 6
Bete Kristian nat yeegna rist gult

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'betekirisitiyanin-anitewim-keto', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Betekristianin Antewim Keto (betekristianin-antewim-keto)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 1
ሁሉንም በሁሉ በሚሞላው ጌታ
ሙሽራው የሆነ ቤቱ ተሰኝታ
በክብር በሞገስ በጸጋ ተሞልታ
ደምቃ ትኖራለች ለዓለም አብርታ /፪/

VERSE 2
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 3
ዲያብሎስ ቢጨርስ ቀስቶቹን በሙሉ
ወጥመድ ቢዘረጋ በጉዞአችን ሁሉ
እንሻገራለን የአምላክን ስም ጠርተን
አንዳች አይነካንም እርሱን ተጠግተን /፪/

VERSE 4
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 5
በስሙ መሰብሰብ በስሙ መስራት
ስለ ስሙ መኖር ለስሙ መሞት
ጠላት ዲያብሎስን ምን ባያስደስት
ይህ ነው ክርስትና ይኼ ነው ሕይወት /፪/

VERSE 6
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 7
ከትውልድ ለትውልድ የምናስረክበው
ለልጅ ልጅ አውርሰን ደስ የምንሰኘው
አይደል ብርና ወርቅ አይደል ሌላ ሀብት
ሃይማኖታችን ነው የእኛ ርስት ጉልት /፪/

VERSE 8
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ',
      lyrics_transliteration = 'Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 1
Hullunim behullu bemimolaw Geta
Mushiraw yehonew betu tesegnyita
Bekibir bemoges betsega temolta
Demqa tinoralich le-alem abrita (2)

VERSE 2
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 3
Diyablos bicherris qestochun bemullu
Wetmed bizeriga beguzoachin hullu
Inishagerallen Ye-Amlakin sim terten
Andach aynekanim Ersun tetigten (2)

VERSE 4
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 5
Besimu meseseb besimu mesrat
Sile simu menor lesimu memot
Telat diyablosin min bayas-desit
Yihe new Kristinna yihe new hiywot (2)

VERSE 6
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 7
Ketewlid letewlid yeminas-rekibew
Lelij lij awrisen des yeminsignyew
Aydel birina werq aydel lela habt
Haymanotachin new yegna rist gult (2)

VERSE 8
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'betekristianin-antewim-keto'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 1
ሁሉንም በሁሉ በሚሞላው ጌታ
ሙሽራው የሆነ ቤቱ ተሰኝታ
በክብር በሞገስ በጸጋ ተሞልታ
ደምቃ ትኖራለች ለዓለም አብርታ /፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 2
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 3
ዲያብሎስ ቢጨርስ ቀስቶቹን በሙሉ
ወጥመድ ቢዘረጋ በጉዞአችን ሁሉ
እንሻገራለን የአምላክን ስም ጠርተን
አንዳች አይነካንም እርሱን ተጠግተን /፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 4
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 5
በስሙ መሰብሰብ በስሙ መስራት
ስለ ስሙ መኖር ለስሙ መሞት
ጠላት ዲያብሎስን ምን ባያስደስት
ይህ ነው ክርስትና ይኼ ነው ሕይወት /፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 6
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 7
ከትውልድ ለትውልድ የምናስረክበው
ለልጅ ልጅ አውርሰን ደስ የምንሰኘው
አይደል ብርና ወርቅ አይደል ሌላ ሀብት
ሃይማኖታችን ነው የእኛ ርስት ጉልት /፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 8
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 1
Hullunim behullu bemimolaw Geta
Mushiraw yehonew betu tesegnyita
Bekibir bemoges betsega temolta
Demqa tinoralich le-alem abrita (2)

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 2
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 3
Diyablos bicherris qestochun bemullu
Wetmed bizeriga beguzoachin hullu
Inishagerallen Ye-Amlakin sim terten
Andach aynekanim Ersun tetigten (2)

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 4
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 5
Besimu meseseb besimu mesrat
Sile simu menor lesimu memot
Telat diyablosin min bayas-desit
Yihe new Kristinna yihe new hiywot (2)

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 6
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 7
Ketewlid letewlid yeminas-rekibew
Lelij lij awrisen des yeminsignyew
Aydel birina werq aydel lela habt
Haymanotachin new yegna rist gult (2)

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 8
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'betekristianin-antewim-keto', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bewisit Sewinete (bewisit-sewinete)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 1
መልካሙን ለማድረግ አስብና እነሳለው
ክፉም በሚያሰራ በሌላ ህግ እያዛለው
በውስጥ ሰውነቴ ለትእዛዝህ ተገዝቼ
በስጋ ደክማለው ቃልህንም እረስቼ

VERSE 2
ያነበብኩትና የሰማሁት ቅዱስ ቃልህ
የቀመስኩትና ያጣጣምኩት ይህ ፍቅርህ
በዚ መኖር ለኔ መልካም ነውም ያሰኘኛል
ብዙም ሳልቆይ ፈጥኖ ስምህንም ያስክደኛል

VERSE 3
ፍቅርህን አስቤ ሁሉን ንቄ ሁሉን ትቼ
በውሀ ላይ ልሂድ ለመራመድ ተነስቼ
አንተ ጋራም ሳልደርስ በፍጥነትም እሰጥማለው
መጥፋቴ ነው ጌታ አንተ አድነኝ እልሀለው

VERSE 4
አምላክ ሆይ እባክህ ፍፃሜዬን አሳምረው
የሚያድነኝ ቸርነትህና ምህረትህ ነው
ስለ እመ አምላክ ብለህ ድል መንሳትን አድለኝ
ለምኞቴ እና ለፈቃዴም አትስጠኝ

VERSE 5
አዝ …',
      lyrics_transliteration = 'Bewst’ sewnete betezazh des yilegnal
Besgaye bekul het’yatm yisbegnal
Minegna gosqwala dekama new sewnete
Man yitadegewal yadnewal yih hiywete

VERSE 1
Melkamun lemadreg asbna enesalew
Kifum bemiyasera belela hig eyazalew
Bewst’ sewnete letezazh tegezche
Besga dekmalew qalhnm eresche

VERSE 2
Yanebebkutna yesemahut Kidus qalh
Yeqemeskutna yat’at’amkut yih fiqrh
Bezi menor lene melkam newm yasegnegnal
Bizum salqoy fet’no simhnm yaskdegnal

VERSE 3
Fiqrhn asbe hulun niqe hulun tiche
Bewhe lay lihid lemeramed tenesche
Ante garam salders beft’netm eset’malew
Met’fate new Geta ante adnegn elhelew

VERSE 4
Amlak hoy ebakh fits’ameyen asamrew
Yemiyadnegn chernethna mihreth new
Sile eme amlak bileh dil mensatn adlegn
Lemgnote ena lefeqadem atst’egn

VERSE 5',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bewisit-sewinete'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 1
መልካሙን ለማድረግ አስብና እነሳለው
ክፉም በሚያሰራ በሌላ ህግ እያዛለው
በውስጥ ሰውነቴ ለትእዛዝህ ተገዝቼ
በስጋ ደክማለው ቃልህንም እረስቼ

CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 2
ያነበብኩትና የሰማሁት ቅዱስ ቃልህ
የቀመስኩትና ያጣጣምኩት ይህ ፍቅርህ
በዚ መኖር ለኔ መልካም ነውም ያሰኘኛል
ብዙም ሳልቆይ ፈጥኖ ስምህንም ያስክደኛል

CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 3
ፍቅርህን አስቤ ሁሉን ንቄ ሁሉን ትቼ
በውሀ ላይ ልሂድ ለመራመድ ተነስቼ
አንተ ጋራም ሳልደርስ በፍጥነትም እሰጥማለው
መጥፋቴ ነው ጌታ አንተ አድነኝ እልሀለው

CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 4
አምላክ ሆይ እባክህ ፍፃሜዬን አሳምረው
የሚያድነኝ ቸርነትህና ምህረትህ ነው
ስለ እመ አምላክ ብለህ ድል መንሳትን አድለኝ
ለምኞቴ እና ለፈቃዴም አትስጠኝ

CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ

VERSE 5
አዝ …

CHORUS
በውስጥ ሰውነቴ በትዕዛዝህ ደስ ይለኛል
በስጋዬ በኩል ሀጥያትም ይስበኛል
ምነኛ ጎስቋላ ደካማ ነው ሰውነቴ
ማን ይታደገዋል ያድነዋል ይህ ህይወቴ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bewst’ sewnete betezazh des yilegnal
Besgaye bekul het’yatm yisbegnal
Minegna gosqwala dekama new sewnete
Man yitadegewal yadnewal yih hiywete

VERSE 1
Melkamun lemadreg asbna enesalew
Kifum bemiyasera belela hig eyazalew
Bewst’ sewnete letezazh tegezche
Besga dekmalew qalhnm eresche

CHORUS
Bewst’ sewnete betezazh des yilegnal
Besgaye bekul het’yatm yisbegnal
Minegna gosqwala dekama new sewnete
Man yitadegewal yadnewal yih hiywete

VERSE 2
Yanebebkutna yesemahut Kidus qalh
Yeqemeskutna yat’at’amkut yih fiqrh
Bezi menor lene melkam newm yasegnegnal
Bizum salqoy fet’no simhnm yaskdegnal

CHORUS
Bewst’ sewnete betezazh des yilegnal
Besgaye bekul het’yatm yisbegnal
Minegna gosqwala dekama new sewnete
Man yitadegewal yadnewal yih hiywete

VERSE 3
Fiqrhn asbe hulun niqe hulun tiche
Bewhe lay lihid lemeramed tenesche
Ante garam salders beft’netm eset’malew
Met’fate new Geta ante adnegn elhelew

CHORUS
Bewst’ sewnete betezazh des yilegnal
Besgaye bekul het’yatm yisbegnal
Minegna gosqwala dekama new sewnete
Man yitadegewal yadnewal yih hiywete

VERSE 4
Amlak hoy ebakh fits’ameyen asamrew
Yemiyadnegn chernethna mihreth new
Sile eme amlak bileh dil mensatn adlegn
Lemgnote ena lefeqadem atst’egn

CHORUS
Bewst’ sewnete betezazh des yilegnal
Besgaye bekul het’yatm yisbegnal
Minegna gosqwala dekama new sewnete
Man yitadegewal yadnewal yih hiywete

VERSE 5
CHORUS

CHORUS
Bewst’ sewnete betezazh des yilegnal
Besgaye bekul het’yatm yisbegnal
Minegna gosqwala dekama new sewnete
Man yitadegewal yadnewal yih hiywete'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bewisit-sewinete', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Beyenay Kalat (beyenay-kalat)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/

VERSE 1
ፅምእይ ዘተርክስ
እቲ ማይ ሕይወት''ዩ ንዓይ ዝፈወሰ
ኢየሱስ''ዩ ንሱ ነፍሰይ ዝረኽባ
ብዘይ ውዳእ ምሕረት ናብ ጽድቒ ዝሰሓባ

VERSE 2
ኣዞማች
ብድኻም ንሰባት ኣይፍንፍንን ንሱ/2/
ምድሓን ናይ ነፍሳትዩ ንዕኡስ ሓጎሱ
ንዓይ ንኽደሊ መጺኡ ንበይኑ

VERSE 3
ሪኣቶያ ነፍሰይ ነቲዒቢ ምድሓኑ
ኣዝማች
ነቲ ምረት ልበይ ሕልኽላኽ ናይ ቤተይ /ናይ ውሽጠይ/
ኩሉ ነገሩኒ ዘርዚሩ ታሪኸይ

VERSE 4
ሰላሙ ሂቡኒ ሰኽመይ ኣራጊፉ
ዳግም ሰሪሑኒ ልበይ ብእኡ ኣዕሪፉ
ኣዝማች',
      lyrics_transliteration = 'Beyenay qalat beyenay qwanqwa kigelts’o mihretu (2)
Bifቕru nilbey bihitu Iyesus geyruni yu natu (2)
Azmach
Eti may ila aykonen (2)

VERSE 1
Ts’mey zeterks
Eti may hiywet''yu niay zifewese
Iyesus''yu nisu nefsey zireኽba
Bizey widae mihret nab ts’dቒ zisehaba

VERSE 2
Azomach
Bidኻm nisebat ayfnfnn nisu (2)
Midhan nay nefsatyu nieus hagosu
Niay niኽdeli mets’iu nibeynu

VERSE 3
Riatoya nefsey netiibi midhanu
Azmach
Neti miret libey hilኽlaኽ nay betey /nay wisht’ey/
Kulu negeruni zerziru tariኸy

VERSE 4
Selamu hibuni seኽmey aragifu
Dagm serihuni libey bieu aerifu
Azmach',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'beyenay-kalat'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/

VERSE 1
ፅምእይ ዘተርክስ
እቲ ማይ ሕይወት''ዩ ንዓይ ዝፈወሰ
ኢየሱስ''ዩ ንሱ ነፍሰይ ዝረኽባ
ብዘይ ውዳእ ምሕረት ናብ ጽድቒ ዝሰሓባ

CHORUS
በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/

VERSE 2
ኣዞማች
ብድኻም ንሰባት ኣይፍንፍንን ንሱ/2/
ምድሓን ናይ ነፍሳትዩ ንዕኡስ ሓጎሱ
ንዓይ ንኽደሊ መጺኡ ንበይኑ

CHORUS
በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/

VERSE 3
ሪኣቶያ ነፍሰይ ነቲዒቢ ምድሓኑ
ኣዝማች
ነቲ ምረት ልበይ ሕልኽላኽ ናይ ቤተይ /ናይ ውሽጠይ/
ኩሉ ነገሩኒ ዘርዚሩ ታሪኸይ

CHORUS
በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/

VERSE 4
ሰላሙ ሂቡኒ ሰኽመይ ኣራጊፉ
ዳግም ሰሪሑኒ ልበይ ብእኡ ኣዕሪፉ
ኣዝማች

CHORUS
በየናይ ቃላት በየናይ ቋንቋ ክገልጾ ምሕረቱ/2/
ብፍቕሩ ንልበይ ብሒቱ ኢየሱስ ገይሩኒ ዩ ናቱ/2/
ኣዝማች
እቲ ማይ ዒላ ኣይኮነን/2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beyenay qalat beyenay qwanqwa kigelts’o mihretu (2)
Bifቕru nilbey bihitu Iyesus geyruni yu natu (2)
Azmach
Eti may ila aykonen (2)

VERSE 1
Ts’mey zeterks
Eti may hiywet''yu niay zifewese
Iyesus''yu nisu nefsey zireኽba
Bizey widae mihret nab ts’dቒ zisehaba

CHORUS
Beyenay qalat beyenay qwanqwa kigelts’o mihretu (2)
Bifቕru nilbey bihitu Iyesus geyruni yu natu (2)
Azmach
Eti may ila aykonen (2)

VERSE 2
Azomach
Bidኻm nisebat ayfnfnn nisu (2)
Midhan nay nefsatyu nieus hagosu
Niay niኽdeli mets’iu nibeynu

CHORUS
Beyenay qalat beyenay qwanqwa kigelts’o mihretu (2)
Bifቕru nilbey bihitu Iyesus geyruni yu natu (2)
Azmach
Eti may ila aykonen (2)

VERSE 3
Riatoya nefsey netiibi midhanu
Azmach
Neti miret libey hilኽlaኽ nay betey /nay wisht’ey/
Kulu negeruni zerziru tariኸy

CHORUS
Beyenay qalat beyenay qwanqwa kigelts’o mihretu (2)
Bifቕru nilbey bihitu Iyesus geyruni yu natu (2)
Azmach
Eti may ila aykonen (2)

VERSE 4
Selamu hibuni seኽmey aragifu
Dagm serihuni libey bieu aerifu
Azmach

CHORUS
Beyenay qalat beyenay qwanqwa kigelts’o mihretu (2)
Bifቕru nilbey bihitu Iyesus geyruni yu natu (2)
Azmach
Eti may ila aykonen (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'beyenay-kalat', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Beza Kulu Alem Yom Tewolede (beza-kulu-alem-yom-tewolede)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/

VERSE 1
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/',
      lyrics_transliteration = 'beza kulu alem yom tewelde /2 gize/
beza kulu alem yom tewelde /2 gize/

VERSE 1
beza kulu alem yom tewelde /2 gize/
beza kulu alem yom tewelde /2 gize/',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'beza-kulu-alem-yom-tewolede'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/

VERSE 1
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/

CHORUS
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/
ቤዛ ኩሉ ዓለም ዮም ተወልደ /2 ጊዜ/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
beza kulu alem yom tewelde /2 gize/
beza kulu alem yom tewelde /2 gize/

VERSE 1
beza kulu alem yom tewelde /2 gize/
beza kulu alem yom tewelde /2 gize/

CHORUS
beza kulu alem yom tewelde /2 gize/
beza kulu alem yom tewelde /2 gize/'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'beza-kulu-alem-yom-tewolede', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Beza Kwilu (beza-kwilu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቤዛ ኩሉ ዓለም ዮም ተወልደ ፪
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፬
የዓለም ሁሉ መድኃኒት ዛሬ ተወለደ ፪
የዓለም ሁሉ መድኀኒት ዛሬ ተወለደ ፬

VERSE 1
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፪
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፬
የዓለም ሁሉ መድኃኒት ዛሬ ተወለደ ፪
የዓለም ሁሉ መድኀኒት ዛሬ ተወለደ ፬',
      lyrics_transliteration = 'Beza kulu alem yom tewelde 2
Beza kulu alem yom tewelde 4
Yealem hulu medhanit zare tewelede 2
Yealem hulu medhenit zare tewelede 4

VERSE 1
Beza kulu alem yom tewelde 2
Beza kulu alem yom tewelde 4
Yealem hulu medhanit zare tewelede 2
Yealem hulu medhenit zare tewelede 4',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'beza-kwilu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፪
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፬
የዓለም ሁሉ መድኃኒት ዛሬ ተወለደ ፪
የዓለም ሁሉ መድኀኒት ዛሬ ተወለደ ፬

VERSE 1
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፪
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፬
የዓለም ሁሉ መድኃኒት ዛሬ ተወለደ ፪
የዓለም ሁሉ መድኀኒት ዛሬ ተወለደ ፬

CHORUS
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፪
ቤዛ ኩሉ ዓለም ዮም ተወልደ ፬
የዓለም ሁሉ መድኃኒት ዛሬ ተወለደ ፪
የዓለም ሁሉ መድኀኒት ዛሬ ተወለደ ፬'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beza kulu alem yom tewelde 2
Beza kulu alem yom tewelde 4
Yealem hulu medhanit zare tewelede 2
Yealem hulu medhenit zare tewelede 4

VERSE 1
Beza kulu alem yom tewelde 2
Beza kulu alem yom tewelde 4
Yealem hulu medhanit zare tewelede 2
Yealem hulu medhenit zare tewelede 4

CHORUS
Beza kulu alem yom tewelde 2
Beza kulu alem yom tewelde 4
Yealem hulu medhanit zare tewelede 2
Yealem hulu medhenit zare tewelede 4'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'beza-kwilu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bezebane Kirub (bezebane-kirub)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 1
የተከበረ ነው በሰማይ በምድሩ
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ

VERSE 2
የተከበረ ነው በሰማይ በምድሩ
የተከበረ ነው በሰማይ በምድሩ
ኢሳይያስ ሲያየው እጅግ አፈረ
የተፈራ ነው የተከበረ

VERSE 3
የሰማይ ደጆች ተንቀጠቀጡ
ለቅዱስ ስሙ ክብርን ሲሰጡ
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው

VERSE 4
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ
የተከበረ ነው በሰማይ በምድሩ
ያልተቀደሰ ለምስ ያነደደው

VERSE 5
እንዴት ይችላል ሊያመሰግነው
ባልፍ ካድልኝ ፍቅርህ ነህና
ልግባ መቅደስህ ላቅርብ ምስጋና
በዘባነ ኪሩብ ለሚቀመጠው

VERSE 6
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 7
ዙፋንህ ታየኝ ትምክህቴ ሆይ
ስትመሰገን በሰማይ ላይ
ስያመሰግንህ ያልተደሰተ
ባይተውር አልሆን አልልጣ ካንተ

VERSE 8
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 9
የተከበረ ነው በሰማይ በምድሩ
እኔ ሞላበት ያንን ሰገነት
ልቀላቀለው ጠመኝው በእውነት
ልዘምርልህ ባይገባኝም

VERSE 10
ዝምም እልሳን አልሰጠኝም
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ

VERSE 11
የተከበረ ነው በሰማይ በምድሩ
የተከበረ ነው በሰማይ በምድሩ',
      lyrics_transliteration = 'Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 1
Yetekebere new besemay bemdru
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru

VERSE 2
Yetekebere new besemay bemdru
Yetekebere new besemay bemdru
Isayyas siyayew ejg afere
Yetefera new yetekebere

VERSE 3
Yesemay dejoch tenqet’eqet’u
Leqdus simu kibrn siset’u
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew

VERSE 4
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru
Yetekebere new besemay bemdru
Yalteqedese lems yanededew

VERSE 5
Endet yichlal liyamesegnew
Balf kadlgn fiqrh nehna
Ligba meqdesh laqrb misgana
Bezebane kirub lemiqemet’ew

VERSE 6
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru
Yetekebere new besemay bemdru

VERSE 7
Zufanh tayegn timkhte hoy
Sitmesegen besemay lay
Siyamesegnh yaltedesete
Baytewr alhon allt’a kante

VERSE 8
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 9
Yetekebere new besemay bemdru
Ene molabet yann segenet
Liqelaqelew t’emegnw beewnet
Lizemrlh baygebagnm

VERSE 10
Zimm elsan alset’egnm
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru

VERSE 11
Yetekebere new besemay bemdru
Yetekebere new besemay bemdru',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bezebane-kirub'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 1
የተከበረ ነው በሰማይ በምድሩ
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 2
የተከበረ ነው በሰማይ በምድሩ
የተከበረ ነው በሰማይ በምድሩ
ኢሳይያስ ሲያየው እጅግ አፈረ
የተፈራ ነው የተከበረ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 3
የሰማይ ደጆች ተንቀጠቀጡ
ለቅዱስ ስሙ ክብርን ሲሰጡ
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 4
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ
የተከበረ ነው በሰማይ በምድሩ
ያልተቀደሰ ለምስ ያነደደው

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 5
እንዴት ይችላል ሊያመሰግነው
ባልፍ ካድልኝ ፍቅርህ ነህና
ልግባ መቅደስህ ላቅርብ ምስጋና
በዘባነ ኪሩብ ለሚቀመጠው

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 6
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ
የተከበረ ነው በሰማይ በምድሩ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 7
ዙፋንህ ታየኝ ትምክህቴ ሆይ
ስትመሰገን በሰማይ ላይ
ስያመሰግንህ ያልተደሰተ
ባይተውር አልሆን አልልጣ ካንተ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 8
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 9
የተከበረ ነው በሰማይ በምድሩ
እኔ ሞላበት ያንን ሰገነት
ልቀላቀለው ጠመኝው በእውነት
ልዘምርልህ ባይገባኝም

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 10
ዝምም እልሳን አልሰጠኝም
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ

VERSE 11
የተከበረ ነው በሰማይ በምድሩ
የተከበረ ነው በሰማይ በምድሩ

CHORUS
በዘባነ ኪሩብ ለሚቀመጠው
በእሳት ድንጋዮች ቅጥሩን አጠረው
ዘምሩ ለእግዚአብሔር ለጌታ ዘምሩ
የተከበረ ነው በሰማይ በምድሩ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 1
Yetekebere new besemay bemdru
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 2
Yetekebere new besemay bemdru
Yetekebere new besemay bemdru
Isayyas siyayew ejg afere
Yetefera new yetekebere

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 3
Yesemay dejoch tenqet’eqet’u
Leqdus simu kibrn siset’u
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 4
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru
Yetekebere new besemay bemdru
Yalteqedese lems yanededew

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 5
Endet yichlal liyamesegnew
Balf kadlgn fiqrh nehna
Ligba meqdesh laqrb misgana
Bezebane kirub lemiqemet’ew

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 6
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru
Yetekebere new besemay bemdru

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 7
Zufanh tayegn timkhte hoy
Sitmesegen besemay lay
Siyamesegnh yaltedesete
Baytewr alhon allt’a kante

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 8
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 9
Yetekebere new besemay bemdru
Ene molabet yann segenet
Liqelaqelew t’emegnw beewnet
Lizemrlh baygebagnm

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 10
Zimm elsan alset’egnm
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru

VERSE 11
Yetekebere new besemay bemdru
Yetekebere new besemay bemdru

CHORUS
Bezebane kirub lemiqemet’ew
Beesat dingayoch qit’run at’erew
Zemru leEgziabher legeta zemru
Yetekebere new besemay bemdru'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bezebane-kirub', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bezemenat Yeshemegele (bezemenat-yeshemegele)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በዘመናት የሸመገለ
ክብርን ሁሉ የጠቀለለ
እንደ ጌታ ኧረ ማን አለ
እንደ እግዚአብሔር ኧረ ማን አለ

VERSE 1
ጥሎብኛል መጎናፀፊያ
ለይቶኛል ከስጋ ጥድፊያ
በሰው ሚዛን ክብርን የማይለካ
እውነተኛ ጌታ ነው ለካ

VERSE 2
ደመና ነው መንኮራኩሩ
ነበልባል ነው ዙፋን ድንበሩ
መሠወሪያው አይደረስም
በማንም ሞት አይከሰስም

VERSE 3
ቀን ዘመናት ሁሉ ሲያረጁ
አዲሶቹ ዘምነው ሲጃጁ
ጌታ አዲስ ነው ሁሌ ማለዳ
ፍቅር ያዘንባል ከልቡ ጓዳ

VERSE 4
መካኒቱን በልጅ ባረከ
ኃይለኛውን አንበረከከ
ለምስኪኖች ስለሚራራ
በኢየሱስ ልባችን ኮራ

VERSE 5
በዘመናት የሸመገለ',
      lyrics_transliteration = 'Bezemenat yeshemegele
Kibrn hulu yet’eqelele
Ende Geta ኧre man ale
Ende Egziabher ኧre man ale

VERSE 1
T’lobgnal megonats’efiya
Leytognal kesga t’dfiya
Besew mizan kibrn yemayleka
Ewnetegna Geta new leka

VERSE 2
Demena new menkorakuru
Nebelbal new zufan dinberu
Meseweriyaw ayderesm
Bemanm mot aykesesm

VERSE 3
Qen zemenat hulu siyareju
Adisochu zemnew sijaju
Geta adis new hule maleda
Fiqr yazenbal kelbu gwada

VERSE 4
Mekanitun belj bareke
Haylegnawn anberekeke
Lemskinoch silemirara
Beiyesus libachn kora

VERSE 5
Bezemenat yeshemegele',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bezemenat-yeshemegele'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በዘመናት የሸመገለ
ክብርን ሁሉ የጠቀለለ
እንደ ጌታ ኧረ ማን አለ
እንደ እግዚአብሔር ኧረ ማን አለ

VERSE 1
ጥሎብኛል መጎናፀፊያ
ለይቶኛል ከስጋ ጥድፊያ
በሰው ሚዛን ክብርን የማይለካ
እውነተኛ ጌታ ነው ለካ

CHORUS
በዘመናት የሸመገለ
ክብርን ሁሉ የጠቀለለ
እንደ ጌታ ኧረ ማን አለ
እንደ እግዚአብሔር ኧረ ማን አለ

VERSE 2
ደመና ነው መንኮራኩሩ
ነበልባል ነው ዙፋን ድንበሩ
መሠወሪያው አይደረስም
በማንም ሞት አይከሰስም

CHORUS
በዘመናት የሸመገለ
ክብርን ሁሉ የጠቀለለ
እንደ ጌታ ኧረ ማን አለ
እንደ እግዚአብሔር ኧረ ማን አለ

VERSE 3
ቀን ዘመናት ሁሉ ሲያረጁ
አዲሶቹ ዘምነው ሲጃጁ
ጌታ አዲስ ነው ሁሌ ማለዳ
ፍቅር ያዘንባል ከልቡ ጓዳ

CHORUS
በዘመናት የሸመገለ
ክብርን ሁሉ የጠቀለለ
እንደ ጌታ ኧረ ማን አለ
እንደ እግዚአብሔር ኧረ ማን አለ

VERSE 4
መካኒቱን በልጅ ባረከ
ኃይለኛውን አንበረከከ
ለምስኪኖች ስለሚራራ
በኢየሱስ ልባችን ኮራ

CHORUS
በዘመናት የሸመገለ
ክብርን ሁሉ የጠቀለለ
እንደ ጌታ ኧረ ማን አለ
እንደ እግዚአብሔር ኧረ ማን አለ

VERSE 5
በዘመናት የሸመገለ

CHORUS
በዘመናት የሸመገለ
ክብርን ሁሉ የጠቀለለ
እንደ ጌታ ኧረ ማን አለ
እንደ እግዚአብሔር ኧረ ማን አለ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bezemenat yeshemegele
Kibrn hulu yet’eqelele
Ende Geta ኧre man ale
Ende Egziabher ኧre man ale

VERSE 1
T’lobgnal megonats’efiya
Leytognal kesga t’dfiya
Besew mizan kibrn yemayleka
Ewnetegna Geta new leka

CHORUS
Bezemenat yeshemegele
Kibrn hulu yet’eqelele
Ende Geta ኧre man ale
Ende Egziabher ኧre man ale

VERSE 2
Demena new menkorakuru
Nebelbal new zufan dinberu
Meseweriyaw ayderesm
Bemanm mot aykesesm

CHORUS
Bezemenat yeshemegele
Kibrn hulu yet’eqelele
Ende Geta ኧre man ale
Ende Egziabher ኧre man ale

VERSE 3
Qen zemenat hulu siyareju
Adisochu zemnew sijaju
Geta adis new hule maleda
Fiqr yazenbal kelbu gwada

CHORUS
Bezemenat yeshemegele
Kibrn hulu yet’eqelele
Ende Geta ኧre man ale
Ende Egziabher ኧre man ale

VERSE 4
Mekanitun belj bareke
Haylegnawn anberekeke
Lemskinoch silemirara
Beiyesus libachn kora

CHORUS
Bezemenat yeshemegele
Kibrn hulu yet’eqelele
Ende Geta ኧre man ale
Ende Egziabher ኧre man ale

VERSE 5
Bezemenat yeshemegele

CHORUS
Bezemenat yeshemegele
Kibrn hulu yet’eqelele
Ende Geta ኧre man ale
Ende Egziabher ኧre man ale'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bezemenat-yeshemegele', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bicawen Kesis Ashenafi # 7 (bicawen-kesis-ashenafi-7)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 1
ህይወቴ ምስክርህ ነው
በእግዚአብሄር የተወደደ (x2)
ይዲዲያ እኔ ነኝ ቸርነቱ የሚያኖረኝ
ሰጥቶ ሰጥቶ አያልቅበት ምህረቱ አይጎድልበት

VERSE 2
የኔ የዋህ የኔ ጌታ በትግዕስቱ አጌጥኩበት
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው

VERSE 3
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው
ጊዜን አይቶ የማይከዳኝ
ይሹሩን ብሎ የሚጠራኝ

VERSE 4
በሸለቆ ታገለኝ ሰውነቴ ዳነችልኝ
አንድ አድርጎ ከቤት አውጥቶ እልፍ አደርጎ የመለሰኝ
በመዝሙሬ በስብከቴ በእልልታዬ ክበርልኝ
ብቻውን የሆነውን ሰው

VERSE 5
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው

VERSE 6
ጊዜን አይቶ የማይከዳኝ
ልጄ ብሎ የሚጠራኝ
በሸለቆ ታገለኝ ሰውነቴ ዳነችልኝ
አንድ አድርጎ ከቤት አውጥቶ እልፍ አደርጎ የመለሰኝ

VERSE 7
በመዝሙሬ በስብከቴ በእልልታዬ ክበርልኝ
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው

VERSE 8
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው
ጥበበኞች ሃያላን ሳሉ ባለጠጎች ክብር የተመሉ
ገብቶ ሳየው ከበረቴ ቃል አጠረኝ ለአንደበቴ

VERSE 9
ወድሃለው በልቤ መዝገብ እኖራለው ቃልክን ስመገብ
አድራሻዬ መስቀልህ ዘማሪ ነኝ ስለክብርህ
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው

VERSE 10
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው',
      lyrics_transliteration = 'Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 1
Hiywete miskrh new
Beegziabher yetewedede (x2)
Yididiya ene negn chernetu yemiyanoregn
Set’to set’to ayalqbet mihretu aygodlbet

VERSE 2
Yene yewah yene Geta betgestu aget’kubet
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew

VERSE 3
Zemene miskrh new
Hiywete miskrh new
Gizen ayto yemaykedagn
Yishurun bilo yemit’eragn

VERSE 4
Besheleqo tagelegn sewnete danechlgn
And adrgo kebet awt’to elf adergo yemelesegn
Bemezmure besbkete beelltaye kiberlgn
Bichawn yehonewn sew

VERSE 5
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new
Hiywete miskrh new

VERSE 6
Gizen ayto yemaykedagn
Lije bilo yemit’eragn
Besheleqo tagelegn sewnete danechlgn
And adrgo kebet awt’to elf adergo yemelesegn

VERSE 7
Bemezmure besbkete beelltaye kiberlgn
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew

VERSE 8
Zemene miskrh new
Hiywete miskrh new
T’bebegnoch hayalan salu balet’egoch kibir yetemelu
Gebto sayew keberete qal at’eregn leandebete

VERSE 9
Wedhalew belbe mezgeb enoralew qalkn simegeb
Adrashaye mesqelh zemari negn silekbrh
Bichawn yehonewn sew
Redat yelelewn sew

VERSE 10
Endante manew yagezew
Zemene miskrh new
Hiywete miskrh new',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bicawen-kesis-ashenafi-7'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 1
ህይወቴ ምስክርህ ነው
በእግዚአብሄር የተወደደ (x2)
ይዲዲያ እኔ ነኝ ቸርነቱ የሚያኖረኝ
ሰጥቶ ሰጥቶ አያልቅበት ምህረቱ አይጎድልበት

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 2
የኔ የዋህ የኔ ጌታ በትግዕስቱ አጌጥኩበት
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 3
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው
ጊዜን አይቶ የማይከዳኝ
ይሹሩን ብሎ የሚጠራኝ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 4
በሸለቆ ታገለኝ ሰውነቴ ዳነችልኝ
አንድ አድርጎ ከቤት አውጥቶ እልፍ አደርጎ የመለሰኝ
በመዝሙሬ በስብከቴ በእልልታዬ ክበርልኝ
ብቻውን የሆነውን ሰው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 5
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 6
ጊዜን አይቶ የማይከዳኝ
ልጄ ብሎ የሚጠራኝ
በሸለቆ ታገለኝ ሰውነቴ ዳነችልኝ
አንድ አድርጎ ከቤት አውጥቶ እልፍ አደርጎ የመለሰኝ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 7
በመዝሙሬ በስብከቴ በእልልታዬ ክበርልኝ
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 8
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው
ጥበበኞች ሃያላን ሳሉ ባለጠጎች ክብር የተመሉ
ገብቶ ሳየው ከበረቴ ቃል አጠረኝ ለአንደበቴ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 9
ወድሃለው በልቤ መዝገብ እኖራለው ቃልክን ስመገብ
አድራሻዬ መስቀልህ ዘማሪ ነኝ ስለክብርህ
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 10
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 1
Hiywete miskrh new
Beegziabher yetewedede (x2)
Yididiya ene negn chernetu yemiyanoregn
Set’to set’to ayalqbet mihretu aygodlbet

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 2
Yene yewah yene Geta betgestu aget’kubet
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 3
Zemene miskrh new
Hiywete miskrh new
Gizen ayto yemaykedagn
Yishurun bilo yemit’eragn

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 4
Besheleqo tagelegn sewnete danechlgn
And adrgo kebet awt’to elf adergo yemelesegn
Bemezmure besbkete beelltaye kiberlgn
Bichawn yehonewn sew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 5
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new
Hiywete miskrh new

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 6
Gizen ayto yemaykedagn
Lije bilo yemit’eragn
Besheleqo tagelegn sewnete danechlgn
And adrgo kebet awt’to elf adergo yemelesegn

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 7
Bemezmure besbkete beelltaye kiberlgn
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 8
Zemene miskrh new
Hiywete miskrh new
T’bebegnoch hayalan salu balet’egoch kibir yetemelu
Gebto sayew keberete qal at’eregn leandebete

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 9
Wedhalew belbe mezgeb enoralew qalkn simegeb
Adrashaye mesqelh zemari negn silekbrh
Bichawn yehonewn sew
Redat yelelewn sew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 10
Endante manew yagezew
Zemene miskrh new
Hiywete miskrh new

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bicawen-kesis-ashenafi-7', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bichawin Yehonewin Sew (bichawin-yehonewin-sew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 1
ህይወቴ ምስክርህ ነው
በእግዚአብሄር የተወደደ (x2)
ይዲዲያ እኔ ነኝ ቸርነቱ የሚያኖረኝ
ሰጥቶ ሰጥቶ አያልቅበት ምህረቱ አይጎድልበት

VERSE 2
የኔ የዋህ የኔ ጌታ በትግዕስቱ አጌጥኩበት
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው

VERSE 3
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው
ጊዜን አይቶ የማይከዳኝ
ይሹሩን ብሎ የሚጠራኝ

VERSE 4
በሸለቆ ታገለኝ ሰውነቴ ዳነችልኝ
አንድ አድርጎ ከቤት አውጥቶ እልፍ አደርጎ የመለሰኝ
በመዝሙሬ በስብከቴ በእልልታዬ ክበርልኝ
ብቻውን የሆነውን ሰው

VERSE 5
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው

VERSE 6
ጊዜን አይቶ የማይከዳኝ
ልጄ ብሎ የሚጠራኝ
በሸለቆ ታገለኝ ሰውነቴ ዳነችልኝ
አንድ አድርጎ ከቤት አውጥቶ እልፍ አደርጎ የመለሰኝ

VERSE 7
በመዝሙሬ በስብከቴ በእልልታዬ ክበርልኝ
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው

VERSE 8
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው
ጥበበኞች ሃያላን ሳሉ ባለጠጎች ክብር የተመሉ
ገብቶ ሳየው ከበረቴ ቃል አጠረኝ ለአንደበቴ

VERSE 9
ወድሃለው በልቤ መዝገብ እኖራለው ቃልክን ስመገብ
አድራሻዬ መስቀልህ ዘማሪ ነኝ ስለክብርህ
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው

VERSE 10
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው',
      lyrics_transliteration = 'Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 1
Hiywete miskrh new
Beegziabher yetewedede (x2)
Yididiya ene negn chernetu yemiyanoregn
Set’to set’to ayalqbet mihretu aygodlbet

VERSE 2
Yene yewah yene Geta betgestu aget’kubet
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew

VERSE 3
Zemene miskrh new
Hiywete miskrh new
Gizen ayto yemaykedagn
Yishurun bilo yemit’eragn

VERSE 4
Besheleqo tagelegn sewnete danechlgn
And adrgo kebet awt’to elf adergo yemelesegn
Bemezmure besbkete beelltaye kiberlgn
Bichawn yehonewn sew

VERSE 5
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new
Hiywete miskrh new

VERSE 6
Gizen ayto yemaykedagn
Lije bilo yemit’eragn
Besheleqo tagelegn sewnete danechlgn
And adrgo kebet awt’to elf adergo yemelesegn

VERSE 7
Bemezmure besbkete beelltaye kiberlgn
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew

VERSE 8
Zemene miskrh new
Hiywete miskrh new
T’bebegnoch hayalan salu balet’egoch kibir yetemelu
Gebto sayew keberete qal at’eregn leandebete

VERSE 9
Wedhalew belbe mezgeb enoralew qalkn simegeb
Adrashaye mesqelh zemari negn silekbrh
Bichawn yehonewn sew
Redat yelelewn sew

VERSE 10
Endante manew yagezew
Zemene miskrh new
Hiywete miskrh new',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bichawin-yehonewin-sew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 1
ህይወቴ ምስክርህ ነው
በእግዚአብሄር የተወደደ (x2)
ይዲዲያ እኔ ነኝ ቸርነቱ የሚያኖረኝ
ሰጥቶ ሰጥቶ አያልቅበት ምህረቱ አይጎድልበት

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 2
የኔ የዋህ የኔ ጌታ በትግዕስቱ አጌጥኩበት
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 3
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው
ጊዜን አይቶ የማይከዳኝ
ይሹሩን ብሎ የሚጠራኝ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 4
በሸለቆ ታገለኝ ሰውነቴ ዳነችልኝ
አንድ አድርጎ ከቤት አውጥቶ እልፍ አደርጎ የመለሰኝ
በመዝሙሬ በስብከቴ በእልልታዬ ክበርልኝ
ብቻውን የሆነውን ሰው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 5
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 6
ጊዜን አይቶ የማይከዳኝ
ልጄ ብሎ የሚጠራኝ
በሸለቆ ታገለኝ ሰውነቴ ዳነችልኝ
አንድ አድርጎ ከቤት አውጥቶ እልፍ አደርጎ የመለሰኝ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 7
በመዝሙሬ በስብከቴ በእልልታዬ ክበርልኝ
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 8
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው
ጥበበኞች ሃያላን ሳሉ ባለጠጎች ክብር የተመሉ
ገብቶ ሳየው ከበረቴ ቃል አጠረኝ ለአንደበቴ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 9
ወድሃለው በልቤ መዝገብ እኖራለው ቃልክን ስመገብ
አድራሻዬ መስቀልህ ዘማሪ ነኝ ስለክብርህ
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 10
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 1
Hiywete miskrh new
Beegziabher yetewedede (x2)
Yididiya ene negn chernetu yemiyanoregn
Set’to set’to ayalqbet mihretu aygodlbet

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 2
Yene yewah yene Geta betgestu aget’kubet
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 3
Zemene miskrh new
Hiywete miskrh new
Gizen ayto yemaykedagn
Yishurun bilo yemit’eragn

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 4
Besheleqo tagelegn sewnete danechlgn
And adrgo kebet awt’to elf adergo yemelesegn
Bemezmure besbkete beelltaye kiberlgn
Bichawn yehonewn sew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 5
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new
Hiywete miskrh new

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 6
Gizen ayto yemaykedagn
Lije bilo yemit’eragn
Besheleqo tagelegn sewnete danechlgn
And adrgo kebet awt’to elf adergo yemelesegn

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 7
Bemezmure besbkete beelltaye kiberlgn
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 8
Zemene miskrh new
Hiywete miskrh new
T’bebegnoch hayalan salu balet’egoch kibir yetemelu
Gebto sayew keberete qal at’eregn leandebete

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 9
Wedhalew belbe mezgeb enoralew qalkn simegeb
Adrashaye mesqelh zemari negn silekbrh
Bichawn yehonewn sew
Redat yelelewn sew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 10
Endante manew yagezew
Zemene miskrh new
Hiywete miskrh new

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bichawin-yehonewin-sew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bichayen Negn Biye Alawikim (bichayen-negn-biye-alawikim)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 1
እግዚአብሔር ነዉ ጠባቂዬ
መነሻዬ መድረሻዬ
መነሻዬ መድረሻዬ
ብቻዬን ነኝ ብዬ አላዉቅም

VERSE 2
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ
መነሻዬ መድረሻዬ

VERSE 3
በማዳኑ ተቀድሼ
ስሙ ሆንዋል አዳራሼ
ስሙ ሆንዋል አዳራሼ
ነፍሴ ሌላ አትምረጪ

VERSE 4
ነፍሴ ሌላ አትምረጪ
ሕይወት የለም ከእርሱ ዉጪ
ሕይወት የለም ከእርሱ ዉጪ
ስላጣሁኝ አይሸሸኝም

VERSE 5
ስላጣሁኝ አይሸሸኝም
ከኔ ጋር ነዉ ሲኖረኝም
ከኔ ጋር ነዉ ሲኖረኝም
የሚኖረኝ በመንፈሱ

VERSE 6
የሚያኖረኝ በመንፈሱ
እኔም የእርሱ ብርቄም እርሱ
ዝማሬ መላእክት ያሰማልን',
      lyrics_transliteration = 'Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye

VERSE 1
Egziabher newu t’ebaqiye
Meneshaye medreshaye
Meneshaye medreshaye
Bichayen negn biye alawuqm

VERSE 2
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye
Meneshaye medreshaye

VERSE 3
Bemadanu teqedshe
Simu honwal adarashe
Simu honwal adarashe
Nefse lela atmrech’i

VERSE 4
Nefse lela atmrech’i
Hiywet yelem keersu wuch’i
Hiywet yelem keersu wuch’i
Silat’ahugn aysheshegnm

VERSE 5
Silat’ahugn aysheshegnm
Kene gar newu sinoregnm
Kene gar newu sinoregnm
Yeminoregn bemenfesu

VERSE 6
Yemiyanoregn bemenfesu
Enem yeersu birqem ersu
Zimare melaekt yasemaln',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bichayen-negn-biye-alawikim'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 1
እግዚአብሔር ነዉ ጠባቂዬ
መነሻዬ መድረሻዬ
መነሻዬ መድረሻዬ
ብቻዬን ነኝ ብዬ አላዉቅም

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 2
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ
መነሻዬ መድረሻዬ

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 3
በማዳኑ ተቀድሼ
ስሙ ሆንዋል አዳራሼ
ስሙ ሆንዋል አዳራሼ
ነፍሴ ሌላ አትምረጪ

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 4
ነፍሴ ሌላ አትምረጪ
ሕይወት የለም ከእርሱ ዉጪ
ሕይወት የለም ከእርሱ ዉጪ
ስላጣሁኝ አይሸሸኝም

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 5
ስላጣሁኝ አይሸሸኝም
ከኔ ጋር ነዉ ሲኖረኝም
ከኔ ጋር ነዉ ሲኖረኝም
የሚኖረኝ በመንፈሱ

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ

VERSE 6
የሚያኖረኝ በመንፈሱ
እኔም የእርሱ ብርቄም እርሱ
ዝማሬ መላእክት ያሰማልን

CHORUS
ብቻዬን ነኝ ብዬ አላዉቅም
ያመንኩትን እኔ አለቅም
ያመንኩትን እኔ አለቅም
እግዚአብሔር ነዉ ጠባቂዬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye

VERSE 1
Egziabher newu t’ebaqiye
Meneshaye medreshaye
Meneshaye medreshaye
Bichayen negn biye alawuqm

CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye

VERSE 2
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye
Meneshaye medreshaye

CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye

VERSE 3
Bemadanu teqedshe
Simu honwal adarashe
Simu honwal adarashe
Nefse lela atmrech’i

CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye

VERSE 4
Nefse lela atmrech’i
Hiywet yelem keersu wuch’i
Hiywet yelem keersu wuch’i
Silat’ahugn aysheshegnm

CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye

VERSE 5
Silat’ahugn aysheshegnm
Kene gar newu sinoregnm
Kene gar newu sinoregnm
Yeminoregn bemenfesu

CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye

VERSE 6
Yemiyanoregn bemenfesu
Enem yeersu birqem ersu
Zimare melaekt yasemaln

CHORUS
Bichayen negn biye alawuqm
Yamenkutn ene aleqm
Yamenkutn ene aleqm
Egziabher newu t’ebaqiye'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bichayen-negn-biye-alawikim', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bikoter Noro (bikoter-noro)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቢቆጠር ኑሮ በደሌ (2)
ቢቆር ኑሮ ሀጥያቴ(2)
እንዴት እቆም ነበር
በፊትህ አባቴ

VERSE 1
እሰከነ ድካሜ ወደ አንተ መጥቼ
ድንግዝግዙ ቀረ አየሁኝ አጥረቼ
ትናንትና ሳታይ በዛሬ መዝነህ
ተቀብለህኛል ፍሪዳህን አረደህ

VERSE 2
ወደ አንተ የመጣ(2)
ወደ ዉጭ አይወጣ
እያገለከልኩህ በጥቂቷ ትጋት
አብዝተህ ስትሰጠህኝ

VERSE 3
ፀጋህን ሳትሰስት
አንተ የወይን ግንድ
እኔ ቅርንጫፍ ነኝ
ከአንተ ከተለየሁ

VERSE 4
አንዳችም የሌለኝ
ወደ አንተ የመጣ (2)
ወደ ዉጭ አይወጣ
አሰናብተህኛል ብለህ አትበድል

VERSE 5
በሂወት እንድኖር እየሰጠህ ዕድል
እንደክሴ መዝገብ እንደኔማጥፍት
ይገባኝ ነበረ መወገር ግርፍት
ወደ አንተ የመጣ(2)

VERSE 6
ወደ ዉጭ አይወጣ
ሀጥያትን እንጂ አንተ የምትጠላዉ
ሀጥያተኛዉማ የእጅህ ስራ ነዉ
ከቀራጮች አንዱ ደካማዉ እኔነኝ

VERSE 7
ቸርነትህ በዝቶ ይቅርታህ ያቆመኝ
ወደ አንተ የመጣ(2)
ወደ ዉጭ አይወጣ
ፍቅርነህ ፍቅርነህ ከባቴ አበሳ

VERSE 8
እሄዉ ዛሬ ቆምኩኝ ካንተ የተነሳ
ማዕመረ ኩሉ የሰዉ
ድካም አዉቀህ
በደሉን ሸፍነህ ሁሉን ታኖራለህ

VERSE 9
ወደ አንተ የመጣ (2)
ወደ ዉጭ አይወጣ
እሰከነ ድካሜ ወደ አንተ መጥቼ
ድንግዝግዙ ቀረቶ አየሁኝአጥረቼ

VERSE 10
ትናትና ሳታይ በዛሬ መዝነህ
ተቀብለህኛል ፍሪዳህን አረደህ
ወደ አንተ የመጣ(2)
ወደ ዉጭ አይወጣ',
      lyrics_transliteration = 'Biqot’er nuro bedele (2)
Biqor nuro het’yate (2)
Endet eqom neber
Befith abate

VERSE 1
Esekene dikame wede ante met’che
Dingzgzu qere ayehugn at’reche
Tinantna satay bezare mezneh
Teqeblehgnal firidahn aredeh

VERSE 2
Wede ante yemet’a (2)
Wede wuch’ aywet’a
Eyagelekelkuh bet’qitwa tigat
Abzteh sitset’ehgn

VERSE 3
Ts’egahn satsest
Ante yeweyn gind
Ene qirnch’af negn
Keante keteleyehu

VERSE 4
Andachm yelelegn
Wede ante yemet’a (2)
Wede wuch’ aywet’a
Asenabtehgnal bileh atbedl

VERSE 5
Behiwet endnor eyeset’eh edl
Endekse mezgeb endenemat’ft
Yigebagn nebere meweger girft
Wede ante yemet’a (2)

VERSE 6
Wede wuch’ aywet’a
Het’yatn enji ante yemtt’elawu
Het’yategnawuma yeejh sira newu
Keqerach’och andu dekamawu enenegn

VERSE 7
Cherneth bezto yiqrtah yaqomegn
Wede ante yemet’a (2)
Wede wuch’ aywet’a
Fiqrneh fiqrneh kebate abesa

VERSE 8
Ehewu zare qomkugn kante yetenesa
Maemere kulu yesewu
Dikam awuqeh
Bedelun shefneh hulun tanoraleh

VERSE 9
Wede ante yemet’a (2)
Wede wuch’ aywet’a
Esekene dikame wede ante met’che
Dingzgzu qereto ayehugnat’reche

VERSE 10
Tinatna satay bezare mezneh
Teqeblehgnal firidahn aredeh
Wede ante yemet’a (2)
Wede wuch’ aywet’a',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bikoter-noro'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቢቆጠር ኑሮ በደሌ (2)
ቢቆር ኑሮ ሀጥያቴ(2)
እንዴት እቆም ነበር
በፊትህ አባቴ

VERSE 1
እሰከነ ድካሜ ወደ አንተ መጥቼ
ድንግዝግዙ ቀረ አየሁኝ አጥረቼ
ትናንትና ሳታይ በዛሬ መዝነህ
ተቀብለህኛል ፍሪዳህን አረደህ

CHORUS
ቢቆጠር ኑሮ በደሌ (2)
ቢቆር ኑሮ ሀጥያቴ(2)
እንዴት እቆም ነበር
በፊትህ አባቴ

VERSE 2
ወደ አንተ የመጣ(2)
ወደ ዉጭ አይወጣ
እያገለከልኩህ በጥቂቷ ትጋት
አብዝተህ ስትሰጠህኝ

CHORUS
ቢቆጠር ኑሮ በደሌ (2)
ቢቆር ኑሮ ሀጥያቴ(2)
እንዴት እቆም ነበር
በፊትህ አባቴ

VERSE 3
ፀጋህን ሳትሰስት
አንተ የወይን ግንድ
እኔ ቅርንጫፍ ነኝ
ከአንተ ከተለየሁ

CHORUS
ቢቆጠር ኑሮ በደሌ (2)
ቢቆር ኑሮ ሀጥያቴ(2)
እንዴት እቆም ነበር
በፊትህ አባቴ

VERSE 4
አንዳችም የሌለኝ
ወደ አንተ የመጣ (2)
ወደ ዉጭ አይወጣ
አሰናብተህኛል ብለህ አትበድል

CHORUS
ቢቆጠር ኑሮ በደሌ (2)
ቢቆር ኑሮ ሀጥያቴ(2)
እንዴት እቆም ነበር
በፊትህ አባቴ

VERSE 5
በሂወት እንድኖር እየሰጠህ ዕድል
እንደክሴ መዝገብ እንደኔማጥፍት
ይገባኝ ነበረ መወገር ግርፍት
ወደ አንተ የመጣ(2)

CHORUS
ቢቆጠር ኑሮ በደሌ (2)
ቢቆር ኑሮ ሀጥያቴ(2)
እንዴት እቆም ነበር
በፊትህ አባቴ

VERSE 6
ወደ ዉጭ አይወጣ
ሀጥያትን እንጂ አንተ የምትጠላዉ
ሀጥያተኛዉማ የእጅህ ስራ ነዉ
ከቀራጮች አንዱ ደካማዉ እኔነኝ

CHORUS
ቢቆጠር ኑሮ በደሌ (2)
ቢቆር ኑሮ ሀጥያቴ(2)
እንዴት እቆም ነበር
በፊትህ አባቴ

VERSE 7
ቸርነትህ በዝቶ ይቅርታህ ያቆመኝ
ወደ አንተ የመጣ(2)
ወደ ዉጭ አይወጣ
ፍቅርነህ ፍቅርነህ ከባቴ አበሳ

CHORUS
ቢቆጠር ኑሮ በደሌ (2)
ቢቆር ኑሮ ሀጥያቴ(2)
እንዴት እቆም ነበር
በፊትህ አባቴ

VERSE 8
እሄዉ ዛሬ ቆምኩኝ ካንተ የተነሳ
ማዕመረ ኩሉ የሰዉ
ድካም አዉቀህ
በደሉን ሸፍነህ ሁሉን ታኖራለህ

CHORUS
ቢቆጠር ኑሮ በደሌ (2)
ቢቆር ኑሮ ሀጥያቴ(2)
እንዴት እቆም ነበር
በፊትህ አባቴ

VERSE 9
ወደ አንተ የመጣ (2)
ወደ ዉጭ አይወጣ
እሰከነ ድካሜ ወደ አንተ መጥቼ
ድንግዝግዙ ቀረቶ አየሁኝአጥረቼ

CHORUS
ቢቆጠር ኑሮ በደሌ (2)
ቢቆር ኑሮ ሀጥያቴ(2)
እንዴት እቆም ነበር
በፊትህ አባቴ

VERSE 10
ትናትና ሳታይ በዛሬ መዝነህ
ተቀብለህኛል ፍሪዳህን አረደህ
ወደ አንተ የመጣ(2)
ወደ ዉጭ አይወጣ

CHORUS
ቢቆጠር ኑሮ በደሌ (2)
ቢቆር ኑሮ ሀጥያቴ(2)
እንዴት እቆም ነበር
በፊትህ አባቴ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Biqot’er nuro bedele (2)
Biqor nuro het’yate (2)
Endet eqom neber
Befith abate

VERSE 1
Esekene dikame wede ante met’che
Dingzgzu qere ayehugn at’reche
Tinantna satay bezare mezneh
Teqeblehgnal firidahn aredeh

CHORUS
Biqot’er nuro bedele (2)
Biqor nuro het’yate (2)
Endet eqom neber
Befith abate

VERSE 2
Wede ante yemet’a (2)
Wede wuch’ aywet’a
Eyagelekelkuh bet’qitwa tigat
Abzteh sitset’ehgn

CHORUS
Biqot’er nuro bedele (2)
Biqor nuro het’yate (2)
Endet eqom neber
Befith abate

VERSE 3
Ts’egahn satsest
Ante yeweyn gind
Ene qirnch’af negn
Keante keteleyehu

CHORUS
Biqot’er nuro bedele (2)
Biqor nuro het’yate (2)
Endet eqom neber
Befith abate

VERSE 4
Andachm yelelegn
Wede ante yemet’a (2)
Wede wuch’ aywet’a
Asenabtehgnal bileh atbedl

CHORUS
Biqot’er nuro bedele (2)
Biqor nuro het’yate (2)
Endet eqom neber
Befith abate

VERSE 5
Behiwet endnor eyeset’eh edl
Endekse mezgeb endenemat’ft
Yigebagn nebere meweger girft
Wede ante yemet’a (2)

CHORUS
Biqot’er nuro bedele (2)
Biqor nuro het’yate (2)
Endet eqom neber
Befith abate

VERSE 6
Wede wuch’ aywet’a
Het’yatn enji ante yemtt’elawu
Het’yategnawuma yeejh sira newu
Keqerach’och andu dekamawu enenegn

CHORUS
Biqot’er nuro bedele (2)
Biqor nuro het’yate (2)
Endet eqom neber
Befith abate

VERSE 7
Cherneth bezto yiqrtah yaqomegn
Wede ante yemet’a (2)
Wede wuch’ aywet’a
Fiqrneh fiqrneh kebate abesa

CHORUS
Biqot’er nuro bedele (2)
Biqor nuro het’yate (2)
Endet eqom neber
Befith abate

VERSE 8
Ehewu zare qomkugn kante yetenesa
Maemere kulu yesewu
Dikam awuqeh
Bedelun shefneh hulun tanoraleh

CHORUS
Biqot’er nuro bedele (2)
Biqor nuro het’yate (2)
Endet eqom neber
Befith abate

VERSE 9
Wede ante yemet’a (2)
Wede wuch’ aywet’a
Esekene dikame wede ante met’che
Dingzgzu qereto ayehugnat’reche

CHORUS
Biqot’er nuro bedele (2)
Biqor nuro het’yate (2)
Endet eqom neber
Befith abate

VERSE 10
Tinatna satay bezare mezneh
Teqeblehgnal firidahn aredeh
Wede ante yemet’a (2)
Wede wuch’ aywet’a

CHORUS
Biqot’er nuro bedele (2)
Biqor nuro het’yate (2)
Endet eqom neber
Befith abate'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bikoter-noro', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bizu Lifat Sibeza Yihinin Zemiru (bizu-lifat-sibeza-yihinin-zemiru)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መረቤን በዓሳ የሞላ ማን አለ ከአምላኬ ሌላ
ነገር ሁሉ የሚሆነዉ በአንተ ነዉ ጌታ በአንተ ነዉ
በስም ስጀምር ፍፃሜያችን ያምራል
እጅህ ከእኛ ጋር በጥበብ ይሰራል

VERSE 1
ከቶ ያላንተ ፈቃድ ማን ከዚህ ደረሰ
ደስ ብሎት ተድላን የቀመሰ
ከብዙ ድንቢጦች እበልጥብሃለሁ
የማትዘነጋኝ ነኝ ይሄንን አዉቃለሁ

VERSE 2
የግራዉ መንገዴን በቀኝህ የምትመራ
ተስተካክያለሁ ስሆን ከአንተ ጋራ
አቤኔዜር አለ ሳሙኤል በቋንቋዉ
ከጨለማዉ ዘመን ስለረዳህዉ

VERSE 3
አንተን የታመነ ሲሳዩ ይበዛል
ባዶዉን የወጣ አፍሶ ይመለሳል
መኝታዉ ይሞቃል እንጀራዉ ያጠግባል
እግዚአብሔር ካለበት ኑሮ ይደላደላል

VERSE 4
እልፍ ብንሰበስብ ብዙ ቢኖረንም
ፀጋዉ ከሌለበት አይደምቅም ድንኳን',
      lyrics_transliteration = 'Mereben beasa yemola man ale keamlake lela
Neger hulu yemihonewu beante newu Geta beante newu
Besm sijemr fits’ameyachn yamral
Ejh keegna gar bet’beb yiseral

VERSE 1
Keto yalante feqad man kezih derese
Des bilot tedlan yeqemese
Kebzu dinbit’och ebelt’bhalehu
Yematzenegagn negn yihenn awuqalehu

VERSE 2
Yegrawu mengeden beqegnh yemtmera
Testekakyalehu sihon keante gara
Abenezer ale samuel beqwanqwawu
Kech’elemawu zemen sileredahwu

VERSE 3
Anten yetamene sisayu yibezal
Badowun yewet’a afso yimelesal
Megntawu yimoqal enjerawu yat’egbal
Egziabher kalebet nuro yideladelal

VERSE 4
Elf binsebesb bizu binorenm
Ts’egawu kelelebet aydemqm dinkwan',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bizu-lifat-sibeza-yihinin-zemiru'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መረቤን በዓሳ የሞላ ማን አለ ከአምላኬ ሌላ
ነገር ሁሉ የሚሆነዉ በአንተ ነዉ ጌታ በአንተ ነዉ
በስም ስጀምር ፍፃሜያችን ያምራል
እጅህ ከእኛ ጋር በጥበብ ይሰራል

VERSE 1
ከቶ ያላንተ ፈቃድ ማን ከዚህ ደረሰ
ደስ ብሎት ተድላን የቀመሰ
ከብዙ ድንቢጦች እበልጥብሃለሁ
የማትዘነጋኝ ነኝ ይሄንን አዉቃለሁ

CHORUS
መረቤን በዓሳ የሞላ ማን አለ ከአምላኬ ሌላ
ነገር ሁሉ የሚሆነዉ በአንተ ነዉ ጌታ በአንተ ነዉ
በስም ስጀምር ፍፃሜያችን ያምራል
እጅህ ከእኛ ጋር በጥበብ ይሰራል

VERSE 2
የግራዉ መንገዴን በቀኝህ የምትመራ
ተስተካክያለሁ ስሆን ከአንተ ጋራ
አቤኔዜር አለ ሳሙኤል በቋንቋዉ
ከጨለማዉ ዘመን ስለረዳህዉ

CHORUS
መረቤን በዓሳ የሞላ ማን አለ ከአምላኬ ሌላ
ነገር ሁሉ የሚሆነዉ በአንተ ነዉ ጌታ በአንተ ነዉ
በስም ስጀምር ፍፃሜያችን ያምራል
እጅህ ከእኛ ጋር በጥበብ ይሰራል

VERSE 3
አንተን የታመነ ሲሳዩ ይበዛል
ባዶዉን የወጣ አፍሶ ይመለሳል
መኝታዉ ይሞቃል እንጀራዉ ያጠግባል
እግዚአብሔር ካለበት ኑሮ ይደላደላል

CHORUS
መረቤን በዓሳ የሞላ ማን አለ ከአምላኬ ሌላ
ነገር ሁሉ የሚሆነዉ በአንተ ነዉ ጌታ በአንተ ነዉ
በስም ስጀምር ፍፃሜያችን ያምራል
እጅህ ከእኛ ጋር በጥበብ ይሰራል

VERSE 4
እልፍ ብንሰበስብ ብዙ ቢኖረንም
ፀጋዉ ከሌለበት አይደምቅም ድንኳን

CHORUS
መረቤን በዓሳ የሞላ ማን አለ ከአምላኬ ሌላ
ነገር ሁሉ የሚሆነዉ በአንተ ነዉ ጌታ በአንተ ነዉ
በስም ስጀምር ፍፃሜያችን ያምራል
እጅህ ከእኛ ጋር በጥበብ ይሰራል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mereben beasa yemola man ale keamlake lela
Neger hulu yemihonewu beante newu Geta beante newu
Besm sijemr fits’ameyachn yamral
Ejh keegna gar bet’beb yiseral

VERSE 1
Keto yalante feqad man kezih derese
Des bilot tedlan yeqemese
Kebzu dinbit’och ebelt’bhalehu
Yematzenegagn negn yihenn awuqalehu

CHORUS
Mereben beasa yemola man ale keamlake lela
Neger hulu yemihonewu beante newu Geta beante newu
Besm sijemr fits’ameyachn yamral
Ejh keegna gar bet’beb yiseral

VERSE 2
Yegrawu mengeden beqegnh yemtmera
Testekakyalehu sihon keante gara
Abenezer ale samuel beqwanqwawu
Kech’elemawu zemen sileredahwu

CHORUS
Mereben beasa yemola man ale keamlake lela
Neger hulu yemihonewu beante newu Geta beante newu
Besm sijemr fits’ameyachn yamral
Ejh keegna gar bet’beb yiseral

VERSE 3
Anten yetamene sisayu yibezal
Badowun yewet’a afso yimelesal
Megntawu yimoqal enjerawu yat’egbal
Egziabher kalebet nuro yideladelal

CHORUS
Mereben beasa yemola man ale keamlake lela
Neger hulu yemihonewu beante newu Geta beante newu
Besm sijemr fits’ameyachn yamral
Ejh keegna gar bet’beb yiseral

VERSE 4
Elf binsebesb bizu binorenm
Ts’egawu kelelebet aydemqm dinkwan

CHORUS
Mereben beasa yemola man ale keamlake lela
Neger hulu yemihonewu beante newu Geta beante newu
Besm sijemr fits’ameyachn yamral
Ejh keegna gar bet’beb yiseral'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bizu-lifat-sibeza-yihinin-zemiru', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bizu Lijoch Alut (bizu-lijoch-alut)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 1
ከመላዕክት ክብሩ ከፍ ከፍ ብሎ
በአምላኬ ተሾመ ዘንዶውንም ጥሎ
አሳዳጊዬ ነው ሆኖ እናት አባቴ
ሚካኤል ባለበት ይሸሻል ጠላቴ

VERSE 2
ከሚታየው ሁሉ ልቤ ከሚፈራው
ካላየሁት ነገር ጠላት ከሰወረው
ያድነኛል ፈጥኖ በመንገዴ ወቶ
ሚካኤል ሀያሉ ክንፎቹን ዘርግቶ

VERSE 3
በባህራን ታሪክ በነተላፊኖስ
በአፎምያ መትረፍ በነ ዱራታኦስ
በነብዩ ዳንኤል መች ይፈጸምና
የሚካኤል ስራ ይቀጥላል ገና

VERSE 4
በጉዞ የረዳቹ በባህር በየብሱ
ፈጥኖ ደርሶላቹ እንባን ስታፈሱ
ስለታችሁ ሰምሯል ቁሙ ለዝማሬ
በሚካኤል ምልጃ የቆማችሁ ዛሬ

VERSE 5
ክብር ለሚገባው ክብርን እንሰጣለን
ንጉሥ ለወደደው አንሰግድለታለን
እንኳን ለሚካኤል ለሚቆም ጌታ ፊት
ክብርን እንሰጥ የለ ለምድር ሹማምንት',
      lyrics_transliteration = 'Bizu lijoch alut lesmu miskr
Bezuriyaw yalutn abqtwal lekbr
Silefts’um miljaw lenegn yileyal
Melaku Mikael silew des yilegnal

VERSE 1
Kemelaekt kibru kef kef bilo
Beamlake teshome zendownm t’lo
Asadagiye new hono enat abate
Mikael balebet yisheshal t’elate

VERSE 2
Kemitayew hulu libe kemiferaw
Kalayehut neger t’elat kesewerew
Yadnegnal fet’no bemengede weto
Mikael heyalu kinfochun zergto

VERSE 3
Bebahran tarik benetelafinos
Beafomya metref bene durataos
Benebyu danel mech yifets’emna
YeMikael sira yiqet’lal gena

VERSE 4
Beguzo yeredachu bebahr beyebsu
Fet’no dersolachu enban sitafesu
Siletachhu semrwal qumu lezmare
Bemikael milja yeqomachhu zare

VERSE 5
Kibir lemigebaw kibrn enset’alen
Nigus lewededew ansegdletalen
Enkwan leMikael lemiqom Geta fit
Kibrn enset’ yele lemdr shumamnt',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bizu-lijoch-alut'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 1
ከመላዕክት ክብሩ ከፍ ከፍ ብሎ
በአምላኬ ተሾመ ዘንዶውንም ጥሎ
አሳዳጊዬ ነው ሆኖ እናት አባቴ
ሚካኤል ባለበት ይሸሻል ጠላቴ

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 2
ከሚታየው ሁሉ ልቤ ከሚፈራው
ካላየሁት ነገር ጠላት ከሰወረው
ያድነኛል ፈጥኖ በመንገዴ ወቶ
ሚካኤል ሀያሉ ክንፎቹን ዘርግቶ

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 3
በባህራን ታሪክ በነተላፊኖስ
በአፎምያ መትረፍ በነ ዱራታኦስ
በነብዩ ዳንኤል መች ይፈጸምና
የሚካኤል ስራ ይቀጥላል ገና

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 4
በጉዞ የረዳቹ በባህር በየብሱ
ፈጥኖ ደርሶላቹ እንባን ስታፈሱ
ስለታችሁ ሰምሯል ቁሙ ለዝማሬ
በሚካኤል ምልጃ የቆማችሁ ዛሬ

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 5
ክብር ለሚገባው ክብርን እንሰጣለን
ንጉሥ ለወደደው አንሰግድለታለን
እንኳን ለሚካኤል ለሚቆም ጌታ ፊት
ክብርን እንሰጥ የለ ለምድር ሹማምንት

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bizu lijoch alut lesmu miskr
Bezuriyaw yalutn abqtwal lekbr
Silefts’um miljaw lenegn yileyal
Melaku Mikael silew des yilegnal

VERSE 1
Kemelaekt kibru kef kef bilo
Beamlake teshome zendownm t’lo
Asadagiye new hono enat abate
Mikael balebet yisheshal t’elate

CHORUS
Bizu lijoch alut lesmu miskr
Bezuriyaw yalutn abqtwal lekbr
Silefts’um miljaw lenegn yileyal
Melaku Mikael silew des yilegnal

VERSE 2
Kemitayew hulu libe kemiferaw
Kalayehut neger t’elat kesewerew
Yadnegnal fet’no bemengede weto
Mikael heyalu kinfochun zergto

CHORUS
Bizu lijoch alut lesmu miskr
Bezuriyaw yalutn abqtwal lekbr
Silefts’um miljaw lenegn yileyal
Melaku Mikael silew des yilegnal

VERSE 3
Bebahran tarik benetelafinos
Beafomya metref bene durataos
Benebyu danel mech yifets’emna
YeMikael sira yiqet’lal gena

CHORUS
Bizu lijoch alut lesmu miskr
Bezuriyaw yalutn abqtwal lekbr
Silefts’um miljaw lenegn yileyal
Melaku Mikael silew des yilegnal

VERSE 4
Beguzo yeredachu bebahr beyebsu
Fet’no dersolachu enban sitafesu
Siletachhu semrwal qumu lezmare
Bemikael milja yeqomachhu zare

CHORUS
Bizu lijoch alut lesmu miskr
Bezuriyaw yalutn abqtwal lekbr
Silefts’um miljaw lenegn yileyal
Melaku Mikael silew des yilegnal

VERSE 5
Kibir lemigebaw kibrn enset’alen
Nigus lewededew ansegdletalen
Enkwan leMikael lemiqom Geta fit
Kibrn enset’ yele lemdr shumamnt

CHORUS
Bizu lijoch alut lesmu miskr
Bezuriyaw yalutn abqtwal lekbr
Silefts’um miljaw lenegn yileyal
Melaku Mikael silew des yilegnal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bizu-lijoch-alut', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Bo Gize Lekulu (bo-gize-lekulu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 1
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 2
የደስታ ምንጩ፣ ሳዝን መጽናኛዬ
በብርዱ ሙቀት፣ በሃሩሩ ጥላዬ
"ሞልቶልሃል" "ጎድሎብሃል" ብሎ
ፊቱ የማይለወጥ፣ ያኖረኝ የማይለወጥ

VERSE 3
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 4
በሚለወጥ ኑሮ፣ የማይለወጥ አምላክ
ዙሪያዬን አጥሮታል በጠባቂ መልአክ
ልጁ ነኝ እኔ፣ ከአብራኩ ክፋይ ነኝ
ከእስከሌለው ፍቅር ነው ታሪኩ

VERSE 5
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 6
የሰው ዘመን ሲያረጅ አያረጅ ዘመኑ
በማንም አይሻር ቋሚ ነው ስልጣኑ
ቢለዋወጥም የህይወት ገጽታ
ትላንትናም ዛሬም እርሱ ነው ጌታ

VERSE 7
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 8
በቁልቁለት ጉዞ ሰው ይሰጣል ጀርባ
እርሱ ግን አብሮኛል
የስኬት ፀሐይ መውጣቷ አይቀርም
በግርምት ይተካል የስንፍና ለዛ

VERSE 9
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 10
እግዚአብሔር ይመስገን፣ ሳለሁ በከፍታ
እግዚአብሔር ይመስገን፣ ሆኜ በዝቅታ
ለምሽት ጊዜ፣ ለንጋት ጊዜ ያለው
ጊዜን የሚያፈራርስ እግዚአብሔር ብቻ ነው

VERSE 11
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 12
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 13
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል',
      lyrics_transliteration = 'Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 1
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 2
Yedesta minch’u, sazn mets’nagnaye
Bebrdu muqet, beharuru t’laye
"moltolhal" "godlobhal" bilo
Fitu yemaylewet’, yanoregn yemaylewet’

VERSE 3
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 4
Bemilewet’ nuro, yemaylewet’ amlak
Zuriyayen at’rotal bet’ebaqi melak
Liju negn ene, keabraku kifay negn
Keeskelelew fiqr new tariku

VERSE 5
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 6
Yesew zemen siyarej ayarej zemenu
Bemanm ayshar qwami new silt’anu
Bilewawet’m yehywet gets’ta
Tilantnam zarem ersu new Geta

VERSE 7
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 8
Bequlqulet guzo sew yiset’al jerba
Ersu gin abrognal
Yesket ts’ehey mewt’atwa ayqerm
Begrmt yitekal yesnfna leza

VERSE 9
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 10
Egziabher yimesgen, salehu bekefta
Egziabher yimesgen, hogne bezqta
Lemsht gize, lengat gize yalew
Gizen yemiyaferars Egziabher bicha new

VERSE 11
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 12
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 13
Egziabher bicha kene gar yiqeral
Egziabher bicha kene gar yiqeral
Egziabher bicha kene gar yiqeral',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'bo-gize-lekulu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 1
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 2
የደስታ ምንጩ፣ ሳዝን መጽናኛዬ
በብርዱ ሙቀት፣ በሃሩሩ ጥላዬ
"ሞልቶልሃል" "ጎድሎብሃል" ብሎ
ፊቱ የማይለወጥ፣ ያኖረኝ የማይለወጥ

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 3
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 4
በሚለወጥ ኑሮ፣ የማይለወጥ አምላክ
ዙሪያዬን አጥሮታል በጠባቂ መልአክ
ልጁ ነኝ እኔ፣ ከአብራኩ ክፋይ ነኝ
ከእስከሌለው ፍቅር ነው ታሪኩ

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 5
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 6
የሰው ዘመን ሲያረጅ አያረጅ ዘመኑ
በማንም አይሻር ቋሚ ነው ስልጣኑ
ቢለዋወጥም የህይወት ገጽታ
ትላንትናም ዛሬም እርሱ ነው ጌታ

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 7
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 8
በቁልቁለት ጉዞ ሰው ይሰጣል ጀርባ
እርሱ ግን አብሮኛል
የስኬት ፀሐይ መውጣቷ አይቀርም
በግርምት ይተካል የስንፍና ለዛ

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 9
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 10
እግዚአብሔር ይመስገን፣ ሳለሁ በከፍታ
እግዚአብሔር ይመስገን፣ ሆኜ በዝቅታ
ለምሽት ጊዜ፣ ለንጋት ጊዜ ያለው
ጊዜን የሚያፈራርስ እግዚአብሔር ብቻ ነው

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 11
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 12
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

VERSE 13
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል

CHORUS
ጊዜ ለሁሉ በጊዜ ለሁሉ
ጊዜ ለሁሉ ይላል ቅዱስ ቃሉ
ከፍታ ያልፋል ዝቅታም ያልፋል
እግዚአብሔር ብቻ ከኔ ጋር ይቀራል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 1
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 2
Yedesta minch’u, sazn mets’nagnaye
Bebrdu muqet, beharuru t’laye
"moltolhal" "godlobhal" bilo
Fitu yemaylewet’, yanoregn yemaylewet’

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 3
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 4
Bemilewet’ nuro, yemaylewet’ amlak
Zuriyayen at’rotal bet’ebaqi melak
Liju negn ene, keabraku kifay negn
Keeskelelew fiqr new tariku

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 5
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 6
Yesew zemen siyarej ayarej zemenu
Bemanm ayshar qwami new silt’anu
Bilewawet’m yehywet gets’ta
Tilantnam zarem ersu new Geta

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 7
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 8
Bequlqulet guzo sew yiset’al jerba
Ersu gin abrognal
Yesket ts’ehey mewt’atwa ayqerm
Begrmt yitekal yesnfna leza

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 9
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 10
Egziabher yimesgen, salehu bekefta
Egziabher yimesgen, hogne bezqta
Lemsht gize, lengat gize yalew
Gizen yemiyaferars Egziabher bicha new

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 11
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 12
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral

VERSE 13
Egziabher bicha kene gar yiqeral
Egziabher bicha kene gar yiqeral
Egziabher bicha kene gar yiqeral

CHORUS
Gize lehulu begize lehulu
Gize lehulu yilal Kidus qalu
Kefta yalfal ziqtam yalfal
Egziabher bicha kene gar yiqeral'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'bo-gize-lekulu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: By D. Teame Segid (by-d-teame-segid)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 1
ከይሲ ኣብ ሥጋ ተመን ኃዲሩ ''ንተ ኣስሓተና
አምላክ ሥጋ ማርያም ለቢሱ ካብ ሞት ኣድኂኑና
ሰሪ በደል ሔዋን ዝተዓጽወት ገነት
ብዳግማዊት ሔዋን ዳግማይ ተኸፍተት

VERSE 2
አምላክ ዘርኣየትኒ ብሥጋ ወሊዳ
ዓይነይ ''ንተ በልክዋስ ዓይኒ ''ኳ ክውሕዳ
ኣኽሊል ትምክሕተይ''ያ ጀማሪት ድኅነተይ
ምኽንያት ኣለዎ ''ንተ ወደሳ ልበይ

VERSE 3
ኣዝ
ኃጢኣት ብምብዝሑ እምብዛ ብኢሱ
ጸጋ እግዚአብሔር ኣባና ፈሲሱ
ሔዋን ብበደላ ቃል መርገም ምስ ሰምዐት

VERSE 4
ማርያም ብንጽሕናኣ ቃል ምድኃን ተበሥረት
ሥጋን ደምን ጎይታይ ቀዳሲ ሕይወተይ
ካብ ጽዮን ፈልፊሉ ኲሉ በረኸተይ
ምእንቲ''ዚ''የ''ኮ ነናሻዕ ዘፍቅራ

VERSE 5
ዝጽገብ ኣይኮነን መዝሙረይ ንኽብራ
ኣዝ
ክኸውን''ዩ ዝብል ቃሉ ምስ ተነግራ
ይኹነኒ ኢላ ብእምነት መስኪራ

VERSE 6
ካብ ሰማይ ምዃኑ ክብሪ ኣደ ኣማኑኤል
ሕያው ምስክር''ዩ ቃል ቅዱስ ገብርኤል
ከም ኤልሳቤጥ ኣደይ ኣደ ጎይታይ ክብል
ካበይ ኮን ኮነለይ ክውድስ ንድንግል

VERSE 7
ካባይ መዓስ ኮይኑ ናይ ፍቕራ ምስጋናይ
ካብ መንፈስ ቅዱስ''ዩ ቅኒት ጣዕመ ዜማይ
ኣዝ',
      lyrics_transliteration = 'Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 1
Keysi ab siga temen hadiru ''nite ashatena
Amlak siga Maryam lebisu kab mot adhinuna
Seri bedel hewan ziteats’wet genet
Bidagmawit hewan dagmay teኸftet

VERSE 2
Amlak zerayetni bisga welida
Ayney ''nite belkwas ayni ''kwa kiwhda
Aኽlil timkhtey''ya jemarit dihnetey
Miኽnyat alewo ''nite wedesa libey

VERSE 3
Az
Hat’iat bimbzhu embza biisu
Ts’ega Egziabher abana fesisu
Hewan bibedela qal mergem mis semat

VERSE 4
Maryam bints’hnaa qal midhan tebesret
Sigan demn goytay qedasi hiywetey
Kab ts’yon felfilu kwilu bereኸtey
Mienti''zi''ye''ko nenashae zefqra

VERSE 5
Zits’geb aykonen mezmurey niኽbra
Az
Kiኸwn''yu zibl qalu mis tenegra
Yiኹneni ila biemnet meskira

VERSE 6
Kab semay mikhwanu kibri ade amanuel
Hiyaw miskr''yu qal Kidus Gebriel
Kem elsabet’ adey ade goytay kibl
Kabey kon koneley kiwds nidngl

VERSE 7
Kabay meas koynu nay fiቕra misganay
Kab menfes Kidus''yu qinit t’aeme zemay
Az',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'by-d-teame-segid'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 1
ከይሲ ኣብ ሥጋ ተመን ኃዲሩ ''ንተ ኣስሓተና
አምላክ ሥጋ ማርያም ለቢሱ ካብ ሞት ኣድኂኑና
ሰሪ በደል ሔዋን ዝተዓጽወት ገነት
ብዳግማዊት ሔዋን ዳግማይ ተኸፍተት

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 2
አምላክ ዘርኣየትኒ ብሥጋ ወሊዳ
ዓይነይ ''ንተ በልክዋስ ዓይኒ ''ኳ ክውሕዳ
ኣኽሊል ትምክሕተይ''ያ ጀማሪት ድኅነተይ
ምኽንያት ኣለዎ ''ንተ ወደሳ ልበይ

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 3
ኣዝ
ኃጢኣት ብምብዝሑ እምብዛ ብኢሱ
ጸጋ እግዚአብሔር ኣባና ፈሲሱ
ሔዋን ብበደላ ቃል መርገም ምስ ሰምዐት

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 4
ማርያም ብንጽሕናኣ ቃል ምድኃን ተበሥረት
ሥጋን ደምን ጎይታይ ቀዳሲ ሕይወተይ
ካብ ጽዮን ፈልፊሉ ኲሉ በረኸተይ
ምእንቲ''ዚ''የ''ኮ ነናሻዕ ዘፍቅራ

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 5
ዝጽገብ ኣይኮነን መዝሙረይ ንኽብራ
ኣዝ
ክኸውን''ዩ ዝብል ቃሉ ምስ ተነግራ
ይኹነኒ ኢላ ብእምነት መስኪራ

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 6
ካብ ሰማይ ምዃኑ ክብሪ ኣደ ኣማኑኤል
ሕያው ምስክር''ዩ ቃል ቅዱስ ገብርኤል
ከም ኤልሳቤጥ ኣደይ ኣደ ጎይታይ ክብል
ካበይ ኮን ኮነለይ ክውድስ ንድንግል

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና

VERSE 7
ካባይ መዓስ ኮይኑ ናይ ፍቕራ ምስጋናይ
ካብ መንፈስ ቅዱስ''ዩ ቅኒት ጣዕመ ዜማይ
ኣዝ

CHORUS
ኣነስ ብዝማሬ ኣደ ጎይታይ ኢለ ንድንግል ማርያም ክውድሳ
መንፈስ ኤልሳቤጥ ኣሎኒ ''ዘምሪ ዘምሪ'' ኢሉ ንልበይ ዝቕስቅሳ
ነዛ ኣደ ኣምላከይ ብዜማይ ከመስግና
ጀሚረ ደኣ እንበር ኣይወዳእኩን ገና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 1
Keysi ab siga temen hadiru ''nite ashatena
Amlak siga Maryam lebisu kab mot adhinuna
Seri bedel hewan ziteats’wet genet
Bidagmawit hewan dagmay teኸftet

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 2
Amlak zerayetni bisga welida
Ayney ''nite belkwas ayni ''kwa kiwhda
Aኽlil timkhtey''ya jemarit dihnetey
Miኽnyat alewo ''nite wedesa libey

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 3
Az
Hat’iat bimbzhu embza biisu
Ts’ega Egziabher abana fesisu
Hewan bibedela qal mergem mis semat

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 4
Maryam bints’hnaa qal midhan tebesret
Sigan demn goytay qedasi hiywetey
Kab ts’yon felfilu kwilu bereኸtey
Mienti''zi''ye''ko nenashae zefqra

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 5
Zits’geb aykonen mezmurey niኽbra
Az
Kiኸwn''yu zibl qalu mis tenegra
Yiኹneni ila biemnet meskira

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 6
Kab semay mikhwanu kibri ade amanuel
Hiyaw miskr''yu qal Kidus Gebriel
Kem elsabet’ adey ade goytay kibl
Kabey kon koneley kiwds nidngl

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena

VERSE 7
Kabay meas koynu nay fiቕra misganay
Kab menfes Kidus''yu qinit t’aeme zemay
Az

CHORUS
Anes bizmare ade goytay ile nidngl Maryam kiwdsa
Menfes elsabet’ aloni ''zemri zemri'' ilu nilbey ziቕsqsa
Neza ade amlakey bizemay kemesgna
Jemire dea enber aywedaekun gena'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'by-d-teame-segid', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: By the Lord''s grand design (by-the-lords-grand-design)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Bebego fekadu hulu bersu hone
Neger hulu bersu tekenawene',
      lyrics_english = 'By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 1
Bebego fekadu hulu bersu hone
Neger hulu bersu tekenawene

VERSE 2
The Heavens and the Earth His splendor they convey
Every sunrise and night His grand work on display
From the whispers of winds to the oceans that leap
We honor exalt Him His promises we keep

VERSE 3
From what came to exist each piece is His design
In Heaven and on Earth His wonders intertwine
The sovereign Lord decrees for the good and we''re glad
In His grand creation all things good He has clad

VERSE 4
The summer to winter and from daylight to night
He displays these wonders guiding our blinded sight
In His perfect canvas there’s no flaw to be rid
For there’s no one like Him our Creator is vivid

VERSE 5
He feels our despair and joys that have lighted
Every twist every turn by His hand is guided
In joy and in sorrow His true purpose we find
For these eternal truths in God we will abide

VERSE 6
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 7
Bebego fekadu hulu bersu hone
Neger hulu bersu tekenawene',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'by-the-lords-grand-design'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Bebego fekadu hulu bersu hone
Neger hulu bersu tekenawene'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 1
Bebego fekadu hulu bersu hone
Neger hulu bersu tekenawene

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 2
The Heavens and the Earth His splendor they convey
Every sunrise and night His grand work on display
From the whispers of winds to the oceans that leap
We honor exalt Him His promises we keep

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 3
From what came to exist each piece is His design
In Heaven and on Earth His wonders intertwine
The sovereign Lord decrees for the good and we''re glad
In His grand creation all things good He has clad

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 4
The summer to winter and from daylight to night
He displays these wonders guiding our blinded sight
In His perfect canvas there’s no flaw to be rid
For there’s no one like Him our Creator is vivid

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 5
He feels our despair and joys that have lighted
Every twist every turn by His hand is guided
In joy and in sorrow His true purpose we find
For these eternal truths in God we will abide

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 6
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find

VERSE 7
Bebego fekadu hulu bersu hone
Neger hulu bersu tekenawene

CHORUS
By the Lord''s grand design all is rightly aligned
For all those who love Him blessings they will find'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'by-the-lords-grand-design', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Cana of Galilee (cana-of-galilee)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady

VERSE 1
Invited were the crowds flooding through the foyer
Celebrating they ate emptied the wine chamber
Our Holy Virgin the Mother of our Lord
For your mediation it is you they implored

VERSE 2
With you in attendance ashamed they will not feel
Nothing is beneath you fill with wine their barrel
“They have no wine” you said to your son our Lord
It is our Mother we cherish and adore

VERSE 3
Divinity of Lord that was unveiled to us
How fortunate it was the house of Dokimas
And today in the home of this grand unity
Blessings have spilled to us, with His humility

VERSE 4
Transfigured was the wine when it was just water
In Cana Galilee our eyes did not falter
If we ensure that He remains within our midst
Good wine will overflow as written in the scripts',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'cana-of-galilee'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady

VERSE 1
Invited were the crowds flooding through the foyer
Celebrating they ate emptied the wine chamber
Our Holy Virgin the Mother of our Lord
For your mediation it is you they implored

CHORUS
Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady

VERSE 2
With you in attendance ashamed they will not feel
Nothing is beneath you fill with wine their barrel
“They have no wine” you said to your son our Lord
It is our Mother we cherish and adore

CHORUS
Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady

VERSE 3
Divinity of Lord that was unveiled to us
How fortunate it was the house of Dokimas
And today in the home of this grand unity
Blessings have spilled to us, with His humility

CHORUS
Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady

VERSE 4
Transfigured was the wine when it was just water
In Cana Galilee our eyes did not falter
If we ensure that He remains within our midst
Good wine will overflow as written in the scripts

CHORUS
Cana of Galilee /x2/ in the matrimony
Virgin we have found you with divinity
Our Lord we have found you with our Lady'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'cana-of-galilee', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: ceru hoyi nana D/hizkyas birhanu (ceru-hoyi-nana-d-hizkyas-birhanu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 1
አይተህ እንዳላዬህ
ሁሉን ታልፈዋለህ
ፍቅራዊ አባት ነህ
አማኑኤል ጌታ

VERSE 2
ቸሩ ፈጣሪያችን
ውለታህ ብዙ ነው
ለኛ የዋልክልን
አይነ ስውር መሪ

VERSE 3
ምርኩዝ መመኪያ ነህ
አንተን የሚመስል
ምንም ነገር የለም
ምህረት እና ፍቅርህ

VERSE 4
ወሰን ወደር የለው
ሳንወድህ ወደኸን
ፈልገህ ጠራኸን
በከብቶች ማደሪያ

VERSE 5
በዚያች ትንሽ ግርግም
ተወልዶ አዳነን
ጌታ መድኃኔአለም
እልል በሉ ሰዎች

VERSE 6
ባንድ ላይ ዘምሩ
ስብሀት ለእግዚአብሔር
በአርያም በሉ',
      lyrics_transliteration = 'Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah

VERSE 1
Ayteh endalayeh
Hulun talfewaleh
Fiqrawi abat neh
Amanuel Geta

VERSE 2
Cheru fet’ariyachn
Wiletah bizu new
Legna yewalkln
Ayne siwr meri

VERSE 3
Mirkuz memekiya neh
Anten yemimesl
Minm neger yelem
Mihret ena fiqrh

VERSE 4
Wesen weder yelew
Sanwedh wedeኸn
Felgeh t’eraኸn
Bekebtoch maderiya

VERSE 5
Beziyach tinsh girgm
Teweldo adanen
Geta medhanealem
Ell belu sewoch

VERSE 6
Band lay zemru
Sibhet leEgziabher
Bearyam belu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ceru-hoyi-nana-d-hizkyas-birhanu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 1
አይተህ እንዳላዬህ
ሁሉን ታልፈዋለህ
ፍቅራዊ አባት ነህ
አማኑኤል ጌታ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 2
ቸሩ ፈጣሪያችን
ውለታህ ብዙ ነው
ለኛ የዋልክልን
አይነ ስውር መሪ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 3
ምርኩዝ መመኪያ ነህ
አንተን የሚመስል
ምንም ነገር የለም
ምህረት እና ፍቅርህ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 4
ወሰን ወደር የለው
ሳንወድህ ወደኸን
ፈልገህ ጠራኸን
በከብቶች ማደሪያ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 5
በዚያች ትንሽ ግርግም
ተወልዶ አዳነን
ጌታ መድኃኔአለም
እልል በሉ ሰዎች

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ

VERSE 6
ባንድ ላይ ዘምሩ
ስብሀት ለእግዚአብሔር
በአርያም በሉ

CHORUS
ቸሩ ሆይ ቸሩ ሆይ ናና
የእስራኤል መና ቸሩ ሆይ ናና
ቸሩ ሆይ መድኃኔአለም ናና
ሰምተህ እንዳልሰማህ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah

VERSE 1
Ayteh endalayeh
Hulun talfewaleh
Fiqrawi abat neh
Amanuel Geta

CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah

VERSE 2
Cheru fet’ariyachn
Wiletah bizu new
Legna yewalkln
Ayne siwr meri

CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah

VERSE 3
Mirkuz memekiya neh
Anten yemimesl
Minm neger yelem
Mihret ena fiqrh

CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah

VERSE 4
Wesen weder yelew
Sanwedh wedeኸn
Felgeh t’eraኸn
Bekebtoch maderiya

CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah

VERSE 5
Beziyach tinsh girgm
Teweldo adanen
Geta medhanealem
Ell belu sewoch

CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah

VERSE 6
Band lay zemru
Sibhet leEgziabher
Bearyam belu

CHORUS
Cheru hoy cheru hoy nana
Yeesrael mena cheru hoy nana
Cheru hoy medhanealem nana
Semteh endalsemah'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ceru-hoyi-nana-d-hizkyas-birhanu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: cher agelgay mabew (cher-agelgay-mabew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 1
በጥቂቱ ታምኖ በብዙ የተሾመው
ባለ አምስቱ መክሊት ሊቀ ጳጳሱ ነው
++++++++++++++++++++
ሳይሰለች የተጋ ባለሁለት መክሊት

VERSE 2
የታመነ እረኛ በፍቅርና በእምነት
ግባ የተባለው ወደ ጌታው ደስታ
አጥምቆ ያቆርባል ካህኑ የጌታ
++++++++++++++++++++

VERSE 3
ለሚበልጠው ጸጋ ተጠርቶ የነበረ
መክሊቱን ደብቆ ቆፍሮ የቀበረ
ሰነፍ ባርያ ተብሎ ወደ ፍርድ ተጣለ
ማኔ ቴቄል ፋሬስ በአምላክ ፊት ቀለለ

VERSE 4
++++++++++++++++++++
ፈቃድህን ማድረግ ነፍሱ ለምትወደው
ወንጌልህን መግለፅ የየዕለት ግብሩ ነው
ህግህ ለዘለላም ተጽፎ ይኖራል

VERSE 5
በታላቅ ጉባኤ ጽድቅህ ይነገራል',
      lyrics_transliteration = 'Cher agelgay manew lengus yetamene
Meklitun yalqebere atrfo yekebere
Bale amstu meklit melkam yaderegew
Bemewt’at bemewred atrfo met’to new

VERSE 1
Bet’qitu tamno bebzu yeteshomew
Bale amstu meklit liqe p’ap’asu new
++++++++++++++++++++
Sayselech yetega balehulet meklit

VERSE 2
Yetamene eregna befqrna beemnet
Giba yetebalew wede getaw desta
At’mqo yaqorbal kahnu yegeta
++++++++++++++++++++

VERSE 3
Lemibelt’ew ts’ega tet’erto yenebere
Meklitun debqo qofro yeqebere
Senef barya teblo wede fird tet’ale
Mane teqel fares beamlak fit qelele

VERSE 4
++++++++++++++++++++
Feqadhn madreg nefsu lemtwedew
Wengelhn meglets’ yeyeelet gibru new
High lezelelam tets’fo yinoral

VERSE 5
Betalaq gubae ts’dqh yinegeral',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'cher-agelgay-mabew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 1
በጥቂቱ ታምኖ በብዙ የተሾመው
ባለ አምስቱ መክሊት ሊቀ ጳጳሱ ነው
++++++++++++++++++++
ሳይሰለች የተጋ ባለሁለት መክሊት

CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 2
የታመነ እረኛ በፍቅርና በእምነት
ግባ የተባለው ወደ ጌታው ደስታ
አጥምቆ ያቆርባል ካህኑ የጌታ
++++++++++++++++++++

CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 3
ለሚበልጠው ጸጋ ተጠርቶ የነበረ
መክሊቱን ደብቆ ቆፍሮ የቀበረ
ሰነፍ ባርያ ተብሎ ወደ ፍርድ ተጣለ
ማኔ ቴቄል ፋሬስ በአምላክ ፊት ቀለለ

CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 4
++++++++++++++++++++
ፈቃድህን ማድረግ ነፍሱ ለምትወደው
ወንጌልህን መግለፅ የየዕለት ግብሩ ነው
ህግህ ለዘለላም ተጽፎ ይኖራል

CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው

VERSE 5
በታላቅ ጉባኤ ጽድቅህ ይነገራል

CHORUS
ቸር አገልጋይ ማነው ለንጉሥ የታመነ
መክሊቱን ያልቀበረ አትርፎ የከበረ
ባለ አምስቱ መክሊት መልካም ያደረገው
በመውጣት በመውረድ አትርፎ መጥቶ ነው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Cher agelgay manew lengus yetamene
Meklitun yalqebere atrfo yekebere
Bale amstu meklit melkam yaderegew
Bemewt’at bemewred atrfo met’to new

VERSE 1
Bet’qitu tamno bebzu yeteshomew
Bale amstu meklit liqe p’ap’asu new
++++++++++++++++++++
Sayselech yetega balehulet meklit

CHORUS
Cher agelgay manew lengus yetamene
Meklitun yalqebere atrfo yekebere
Bale amstu meklit melkam yaderegew
Bemewt’at bemewred atrfo met’to new

VERSE 2
Yetamene eregna befqrna beemnet
Giba yetebalew wede getaw desta
At’mqo yaqorbal kahnu yegeta
++++++++++++++++++++

CHORUS
Cher agelgay manew lengus yetamene
Meklitun yalqebere atrfo yekebere
Bale amstu meklit melkam yaderegew
Bemewt’at bemewred atrfo met’to new

VERSE 3
Lemibelt’ew ts’ega tet’erto yenebere
Meklitun debqo qofro yeqebere
Senef barya teblo wede fird tet’ale
Mane teqel fares beamlak fit qelele

CHORUS
Cher agelgay manew lengus yetamene
Meklitun yalqebere atrfo yekebere
Bale amstu meklit melkam yaderegew
Bemewt’at bemewred atrfo met’to new

VERSE 4
++++++++++++++++++++
Feqadhn madreg nefsu lemtwedew
Wengelhn meglets’ yeyeelet gibru new
High lezelelam tets’fo yinoral

CHORUS
Cher agelgay manew lengus yetamene
Meklitun yalqebere atrfo yekebere
Bale amstu meklit melkam yaderegew
Bemewt’at bemewred atrfo met’to new

VERSE 5
Betalaq gubae ts’dqh yinegeral

CHORUS
Cher agelgay manew lengus yetamene
Meklitun yalqebere atrfo yekebere
Bale amstu meklit melkam yaderegew
Bemewt’at bemewred atrfo met’to new'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'cher-agelgay-mabew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Chereneteh (chereneteh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 1
መብራቴንም ይዤ ባልጠብቅህ
በታላቅ ይቅርታ እንዳትረሳኝ
በፍቅር ጎብኝተህ ከሞት አውጣኝ
ከቤትህ እርቄ መች ጠገብኩኝ

VERSE 2
በረሀብ በእርዛት ተቸገርኩኝ
አምናለሁ አምላኬ እንድትምረኝ
ለይቅርታ መጣሁ ተቀበለኝ
አንዳች እንደሌለኝ አውቀዋለሁ

VERSE 3
በአንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀለኛል
ይቅርታህ ለባሪያህ ይደርሰኛል
በመቅደስህ ቆሜ ለመዘመር

VERSE 4
ሥራህን ለትውልድ ለመመስከር
እኔ ማነኝ ብዬ አስባለሁ
አምላክ ቸርነትህን አደንቃለሁ
በሰው እጅ መመካት አቁሜያለሁ

VERSE 5
ረዳቴ አንተ ነህ አውቄያለሁ
አንተ ከጠበቅከኝ በህይወቴ
ቅጥርህ አይደፈርም መድሀኒቴ
የኔን ሥራ ተወው ተግባሬን

VERSE 6
የመስቀሉን ነገር መርሳቴን
አዚሜን አንስተህ አንተን ልይህ
እየሱስ ክርስቶስ አምላኬ ነህ',
      lyrics_transliteration = 'Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh

VERSE 1
Mebratenm yizhe balt’ebqh
Betalaq yiqrta endatresagn
Befqr gobgnteh kemot awt’agn
Kebeth erqe mech t’egebkugn

VERSE 2
Bereheb beerzat techegerkugn
Amnalehu amlake endtmregn
Leyqrta met’ahu teqebelegn
Andach endelelegn awqewalehu

VERSE 3
Beante chernet gin emekalehu
Yekebedew shekme yiqelegnal
Yiqrtah lebariyah yidersegnal
Bemeqdesh qome lemezemer

VERSE 4
Sirahn letwld lememesker
Ene manegn biye asbalehu
Amlak chernethn adenqalehu
Besew ej memekat aqumeyalehu

VERSE 5
Redate ante neh awqeyalehu
Ante ket’ebeqkegn behywete
Qit’rh aydeferm medhenite
Yenen sira tewew tegbaren

VERSE 6
Yemesqelun neger mersaten
Azimen ansteh anten liyh
Eyesus Kristos amlake neh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'chereneteh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 1
መብራቴንም ይዤ ባልጠብቅህ
በታላቅ ይቅርታ እንዳትረሳኝ
በፍቅር ጎብኝተህ ከሞት አውጣኝ
ከቤትህ እርቄ መች ጠገብኩኝ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 2
በረሀብ በእርዛት ተቸገርኩኝ
አምናለሁ አምላኬ እንድትምረኝ
ለይቅርታ መጣሁ ተቀበለኝ
አንዳች እንደሌለኝ አውቀዋለሁ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 3
በአንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀለኛል
ይቅርታህ ለባሪያህ ይደርሰኛል
በመቅደስህ ቆሜ ለመዘመር

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 4
ሥራህን ለትውልድ ለመመስከር
እኔ ማነኝ ብዬ አስባለሁ
አምላክ ቸርነትህን አደንቃለሁ
በሰው እጅ መመካት አቁሜያለሁ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 5
ረዳቴ አንተ ነህ አውቄያለሁ
አንተ ከጠበቅከኝ በህይወቴ
ቅጥርህ አይደፈርም መድሀኒቴ
የኔን ሥራ ተወው ተግባሬን

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ

VERSE 6
የመስቀሉን ነገር መርሳቴን
አዚሜን አንስተህ አንተን ልይህ
እየሱስ ክርስቶስ አምላኬ ነህ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)
መክሊቴን ቀብሬ ባሳዝንህ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh

VERSE 1
Mebratenm yizhe balt’ebqh
Betalaq yiqrta endatresagn
Befqr gobgnteh kemot awt’agn
Kebeth erqe mech t’egebkugn

CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh

VERSE 2
Bereheb beerzat techegerkugn
Amnalehu amlake endtmregn
Leyqrta met’ahu teqebelegn
Andach endelelegn awqewalehu

CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh

VERSE 3
Beante chernet gin emekalehu
Yekebedew shekme yiqelegnal
Yiqrtah lebariyah yidersegnal
Bemeqdesh qome lemezemer

CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh

VERSE 4
Sirahn letwld lememesker
Ene manegn biye asbalehu
Amlak chernethn adenqalehu
Besew ej memekat aqumeyalehu

CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh

VERSE 5
Redate ante neh awqeyalehu
Ante ket’ebeqkegn behywete
Qit’rh aydeferm medhenite
Yenen sira tewew tegbaren

CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh

VERSE 6
Yemesqelun neger mersaten
Azimen ansteh anten liyh
Eyesus Kristos amlake neh

CHORUS
Cherneth new yaderesegn eske zare
Cherneth new yet’ebeqegn eske zare
Lamesgnh yene Geta bezmare (2)
Mekliten qebre basaznh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'chereneteh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Cherinetih Bizu Mihiretih Bizu (cherinetih-bizu-mihiretih-bizu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ

VERSE 1
አስራኤል ወደቀ እስራኤል ተነሳ2x
መንገዱ አልቀናውም አምላኩን ቢረሳ2x
የያዕቆብ አምላክ እግዚአብሔርን ይዞ2x
ምን እንዳተረፈ አውቆታል በጉዞ2x

VERSE 2
መንገዱ አይታክትም ጎዳናዉ የቀና2x
እግዚአብሔር በፊትም ከኋላሞ አለና2x
እርሱ በሌለበት ቢመችም መንገዱ2x
አቅጣጫው ወደ ሞት አይቀርም መውሰዱ2x

VERSE 3
በመንገዱ ዝለን ወድቀን መች ቀርተናል2x
የያዕቆብ አምላክ ደግፎ አንስቶናል2x
እግዚአብሔር ሲጠራን በቀደመው መንገድ2x
ጉዞአችን ወዴት ነው በሞት ለመወሰድ2x

VERSE 4
አምላክ ሆይ ፍቅርህን በልባችን ሳለው2x
እስከሞት በመስቀል የወደደን ማነው2x
በበረሃዉ ጽናት ሲጸናብን ርሀቡ2x
በረከት ሞላኸን ተረፈልን ምግቡ2x',
      lyrics_transliteration = 'Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq newu leegna ante neh melkam eregna

VERSE 1
Asrael wedeqe esrael tenesa2x
Mengedu alqenawm amlakun biresa2x
Yeyaeqob amlak Egziabhern yizo2x
Min endaterefe awqotal beguzo2x

VERSE 2
Mengedu aytaktm godanawu yeqena2x
Egziabher befitm kehwalamo alena2x
Ersu belelebet bimechm mengedu2x
Aqt’ach’aw wede mot ayqerm mewsedu2x

VERSE 3
Bemengedu zilen wedqen mech qertenal2x
Yeyaeqob amlak degfo anstonal2x
Egziabher sit’eran beqedemew menged2x
Guzoachn wedet new bemot lemewesed2x

VERSE 4
Amlak hoy fiqrhn belbachn salew2x
Eskemot bemesqel yewededen manew2x
Beberehawu ts’nat sits’enabn rihebu2x
Bereket molaኸn terefeln migbu2x',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'cherinetih-bizu-mihiretih-bizu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ

VERSE 1
አስራኤል ወደቀ እስራኤል ተነሳ2x
መንገዱ አልቀናውም አምላኩን ቢረሳ2x
የያዕቆብ አምላክ እግዚአብሔርን ይዞ2x
ምን እንዳተረፈ አውቆታል በጉዞ2x

CHORUS
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ

VERSE 2
መንገዱ አይታክትም ጎዳናዉ የቀና2x
እግዚአብሔር በፊትም ከኋላሞ አለና2x
እርሱ በሌለበት ቢመችም መንገዱ2x
አቅጣጫው ወደ ሞት አይቀርም መውሰዱ2x

CHORUS
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ

VERSE 3
በመንገዱ ዝለን ወድቀን መች ቀርተናል2x
የያዕቆብ አምላክ ደግፎ አንስቶናል2x
እግዚአብሔር ሲጠራን በቀደመው መንገድ2x
ጉዞአችን ወዴት ነው በሞት ለመወሰድ2x

CHORUS
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ

VERSE 4
አምላክ ሆይ ፍቅርህን በልባችን ሳለው2x
እስከሞት በመስቀል የወደደን ማነው2x
በበረሃዉ ጽናት ሲጸናብን ርሀቡ2x
በረከት ሞላኸን ተረፈልን ምግቡ2x

CHORUS
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq newu leegna ante neh melkam eregna

VERSE 1
Asrael wedeqe esrael tenesa2x
Mengedu alqenawm amlakun biresa2x
Yeyaeqob amlak Egziabhern yizo2x
Min endaterefe awqotal beguzo2x

CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq newu leegna ante neh melkam eregna

VERSE 2
Mengedu aytaktm godanawu yeqena2x
Egziabher befitm kehwalamo alena2x
Ersu belelebet bimechm mengedu2x
Aqt’ach’aw wede mot ayqerm mewsedu2x

CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq newu leegna ante neh melkam eregna

VERSE 3
Bemengedu zilen wedqen mech qertenal2x
Yeyaeqob amlak degfo anstonal2x
Egziabher sit’eran beqedemew menged2x
Guzoachn wedet new bemot lemewesed2x

CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq newu leegna ante neh melkam eregna

VERSE 4
Amlak hoy fiqrhn belbachn salew2x
Eskemot bemesqel yewededen manew2x
Beberehawu ts’nat sits’enabn rihebu2x
Bereket molaኸn terefeln migbu2x

CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq newu leegna ante neh melkam eregna'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'cherinetih-bizu-mihiretih-bizu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Cherinetih New (cherinetih-new-2633)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 1
KeYared Gar Enawedis
KeDawit Gar Begena ‘nimta
Nu LeSeAtat Enenesa
KeGiorgis Gar Eneberta

VERSE 2
KeTekliye Gara Enisbek
KeLalibela Gar Enigenba
KeHeriyaqos Gar Eneqedis
KeAbuye Gar Subaye ‘nigba

VERSE 3
KeSaba Gar Tibeb Enamtta
KeAronim Gara Tsehay Enaqum
KeAregawi Gara Entseli
KeEnbaqom Gar Enmeskir

VERSE 4
KeSelama Gara Entergum
KeEysderos Gara Enimermer
KeGelanish Gara Eniqeng
KeHaymet Gar Enastemir

VERSE 5
Netsa BeMetawetta BeEyerusalem Ketema
KeTsion Lijoch Gara Mezmurachin Endisema
And Honen BeQenge Endenqom Kebekurat Mahiber Gara
And Honen Zare Enagelgel And Honen Zare Enisra',
      lyrics_transliteration = 'Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 1
KeYared Gar Enawedis
KeDawit Gar Begena ‘nimta
Nu LeSeAtat Enenesa
KeGiorgis Gar Eneberta

VERSE 2
KeTekliye Gara Enisbek
KeLalibela Gar Enigenba
KeHeriyaqos Gar Eneqedis
KeAbuye Gar Subaye ‘nigba

VERSE 3
KeSaba Gar Tibeb Enamtta
KeAronim Gara Tsehay Enaqum
KeAregawi Gara Entseli
KeEnbaqom Gar Enmeskir

VERSE 4
KeSelama Gara Entergum
KeEysderos Gara Enimermer
KeGelanish Gara Eniqeng
KeHaymet Gar Enastemir

VERSE 5
Netsa BeMetawetta BeEyerusalem Ketema
KeTsion Lijoch Gara Mezmurachin Endisema
And Honen BeQenge Endenqom Kebekurat Mahiber Gara
And Honen Zare Enagelgel And Honen Zare Enisra',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'cherinetih-new-2633'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 1
KeYared Gar Enawedis
KeDawit Gar Begena ‘nimta
Nu LeSeAtat Enenesa
KeGiorgis Gar Eneberta

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 2
KeTekliye Gara Enisbek
KeLalibela Gar Enigenba
KeHeriyaqos Gar Eneqedis
KeAbuye Gar Subaye ‘nigba

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 3
KeSaba Gar Tibeb Enamtta
KeAronim Gara Tsehay Enaqum
KeAregawi Gara Entseli
KeEnbaqom Gar Enmeskir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 4
KeSelama Gara Entergum
KeEysderos Gara Enimermer
KeGelanish Gara Eniqeng
KeHaymet Gar Enastemir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 5
Netsa BeMetawetta BeEyerusalem Ketema
KeTsion Lijoch Gara Mezmurachin Endisema
And Honen BeQenge Endenqom Kebekurat Mahiber Gara
And Honen Zare Enagelgel And Honen Zare Enisra

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 1
KeYared Gar Enawedis
KeDawit Gar Begena ‘nimta
Nu LeSeAtat Enenesa
KeGiorgis Gar Eneberta

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 2
KeTekliye Gara Enisbek
KeLalibela Gar Enigenba
KeHeriyaqos Gar Eneqedis
KeAbuye Gar Subaye ‘nigba

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 3
KeSaba Gar Tibeb Enamtta
KeAronim Gara Tsehay Enaqum
KeAregawi Gara Entseli
KeEnbaqom Gar Enmeskir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 4
KeSelama Gara Entergum
KeEysderos Gara Enimermer
KeGelanish Gara Eniqeng
KeHaymet Gar Enastemir

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)

VERSE 5
Netsa BeMetawetta BeEyerusalem Ketema
KeTsion Lijoch Gara Mezmurachin Endisema
And Honen BeQenge Endenqom Kebekurat Mahiber Gara
And Honen Zare Enagelgel And Honen Zare Enisra

CHORUS
Nu LeMisgana Enetebaber
Nu And Enehun BeSubaye
Nu BeMeqdesu Enamlikew
Enmesret Andit Gubaye (x2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'cherinetih-new-2633', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Cherinetih New Yaderesegn Esike Zare (cherinetih-new-yaderesegn-esike-zare)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 1
መብራቴንም ይዤ ባልጠብቅህ
በታላቅ ይቅርታ እንዳትረሳኝ
ብፍቅር ጎብኝተህ ከሞት አውጣኝ
ከቤትህ እርቄ መች ጠገብኩኝ

VERSE 2
በረሐብ በእርዛት ተቸገርኩኝ
አምናለሁ አምላኬ እንድትምረኝ
ለይቅርታ መጣሁ ይቅር በለኝ
አንዳች እንደሌለኝ አውቀዋለሁ

VERSE 3
ባንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀለኛል
ይቅርታ ለባርያህ ይደርሰኛል
በመቅደስህ ቆሜ ለመዘመር

VERSE 4
ስራህን ለትውልድ ለመመስከር
እኔ ማነኝ ብዬ አስባለሁ
አምላክ ቸርነትህን አደንቃለሁ
በሰው እጅ መመካት አቁሚያለሁ

VERSE 5
እረዳቴ አንተ ነህ አውቄያለሁ
አንተ ከጠበከኝ በህይወቴ
ቅጥሬ አይደፈርም መድኃኒቴ
የኔን ሰራ ተወው ተግባሬንም

VERSE 6
የመስቀሉን ነገር መርሳቴንም
አዚሜን አንሰተህ አንተን ልይህ
እየሱስ ክርስቶስ አምላኬ ነህ',
      lyrics_transliteration = 'Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh

VERSE 1
Mebratenm yizhe balt’ebqh
Betalaq yiqrta endatresagn
Bifqr gobgnteh kemot awt’agn
Kebeth erqe mech t’egebkugn

VERSE 2
Bereheb beerzat techegerkugn
Amnalehu amlake endtmregn
Leyqrta met’ahu yiqr belegn
Andach endelelegn awqewalehu

VERSE 3
Bante chernet gin emekalehu
Yekebedew shekme yiqelegnal
Yiqrta lebaryah yidersegnal
Bemeqdesh qome lemezemer

VERSE 4
Sirahn letwld lememesker
Ene manegn biye asbalehu
Amlak chernethn adenqalehu
Besew ej memekat aqumiyalehu

VERSE 5
Eredate ante neh awqeyalehu
Ante ket’ebekegn behywete
Qit’re aydeferm medhanite
Yenen sera tewew tegbarenm

VERSE 6
Yemesqelun neger mersatenm
Azimen anseteh anten liyh
Eyesus Kristos amlake neh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'cherinetih-new-yaderesegn-esike-zare'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 1
መብራቴንም ይዤ ባልጠብቅህ
በታላቅ ይቅርታ እንዳትረሳኝ
ብፍቅር ጎብኝተህ ከሞት አውጣኝ
ከቤትህ እርቄ መች ጠገብኩኝ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 2
በረሐብ በእርዛት ተቸገርኩኝ
አምናለሁ አምላኬ እንድትምረኝ
ለይቅርታ መጣሁ ይቅር በለኝ
አንዳች እንደሌለኝ አውቀዋለሁ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 3
ባንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀለኛል
ይቅርታ ለባርያህ ይደርሰኛል
በመቅደስህ ቆሜ ለመዘመር

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 4
ስራህን ለትውልድ ለመመስከር
እኔ ማነኝ ብዬ አስባለሁ
አምላክ ቸርነትህን አደንቃለሁ
በሰው እጅ መመካት አቁሚያለሁ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 5
እረዳቴ አንተ ነህ አውቄያለሁ
አንተ ከጠበከኝ በህይወቴ
ቅጥሬ አይደፈርም መድኃኒቴ
የኔን ሰራ ተወው ተግባሬንም

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ

VERSE 6
የመስቀሉን ነገር መርሳቴንም
አዚሜን አንሰተህ አንተን ልይህ
እየሱስ ክርስቶስ አምላኬ ነህ

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከዛሬ
ቸርነትህ ነው የጠበቀኝ እስከዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ/2/
መክሊቴንም ቀብሬ ባሳዝንህ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh

VERSE 1
Mebratenm yizhe balt’ebqh
Betalaq yiqrta endatresagn
Bifqr gobgnteh kemot awt’agn
Kebeth erqe mech t’egebkugn

CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh

VERSE 2
Bereheb beerzat techegerkugn
Amnalehu amlake endtmregn
Leyqrta met’ahu yiqr belegn
Andach endelelegn awqewalehu

CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh

VERSE 3
Bante chernet gin emekalehu
Yekebedew shekme yiqelegnal
Yiqrta lebaryah yidersegnal
Bemeqdesh qome lemezemer

CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh

VERSE 4
Sirahn letwld lememesker
Ene manegn biye asbalehu
Amlak chernethn adenqalehu
Besew ej memekat aqumiyalehu

CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh

VERSE 5
Eredate ante neh awqeyalehu
Ante ket’ebekegn behywete
Qit’re aydeferm medhanite
Yenen sera tewew tegbarenm

CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh

VERSE 6
Yemesqelun neger mersatenm
Azimen anseteh anten liyh
Eyesus Kristos amlake neh

CHORUS
Cherneth new yaderesegn eskezare
Cherneth new yet’ebeqegn eskezare
Lamesgnh yene Geta bezmare (2)
Meklitenm qebre basaznh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'cherinetih-new-yaderesegn-esike-zare', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Cherinetih New Yaderesegn Esike Zare (cherinetih-new-yaderesegn-esike-zare-3140)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 1
አንዳች እንደሌለኝ አውቀዋለሁ
በአንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀላል
ይቅርታ ለባሪያ ይደርሰኛል

VERSE 2
በመቅደስህ ቆሜ ለመዘመር
ስራህን ለትውልድ ለመመስከር
እኔ ማን ነኝ እኔ ማን ነኝ ብዬ አስባለሁ
አምላክ ቸርነትን አደንቃለሁ

VERSE 3
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 4
መክሊቴን ቀብሬ ባሳዝንም
መብራቴንም ይዤ ባልጠብቅም
በታላቅ ይቅርታ እንዳትረሳኝ
በፍቅር ጎብኝተህ ከሞት አውጣኝ

VERSE 5
ከቤትህ ራቅኩኝ፣ ተቸገርኩኝ አምናለሁ
አምናለሁ አምላኬ እንድትምረኝ
በይቅርታ መጣሁ ተቀበለኝ
ቸርነት ነው ያደረሰን እስከ ዛሬ

VERSE 6
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
በዝማሬ
በሰው ልጅ መመካት አቁሚያለሁ

VERSE 7
ረዳት ያንተ መሆንህን አውቄያለሁ
አንተ ከጠበከኝ ሕይወቴ አይደፈርም
የኔ ሥራ፣ ምግባሬን ተወው
የመስቀሉን ነገር መርሳቴን

VERSE 8
ኃጢአቴን አንሳ አንተ ኢየሱስ ክርስቶስ አምላኬ ነህ
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 9
ላመስግን የኔ ጌታ በዝማሬ
አንዳች እንደሌለኝ አውቀዋለሁ
በአንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀላል

VERSE 10
ይቅርታ ለባሪያ ይደርሰኛል
በመቅደስህ ቆሜ ለመዘመር
ስራህን ለትውልድ ለመመስከር
እኔ ማን ነኝ እኔ ማን ነኝ ብዬ አስባለሁ

VERSE 11
አምላክ ቸርነትን አደንቃለሁ
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 12
ላመስግን የኔ ጌታ በዝማሬ',
      lyrics_transliteration = 'Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 1
Andach endelelegn awqewalehu
Beante chernet gin emekalehu
Yekebedew shekme yiqelal
Yiqrta lebariya yidersegnal

VERSE 2
Bemeqdesh qome lemezemer
Sirahn letwld lememesker
Ene man negn ene man negn biye asbalehu
Amlak chernetn adenqalehu

VERSE 3
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 4
Mekliten qebre basaznm
Mebratenm yizhe balt’ebqm
Betalaq yiqrta endatresagn
Befqr gobgnteh kemot awt’agn

VERSE 5
Kebeth raqkugn, techegerkugn amnalehu
Amnalehu amlake endtmregn
Beyqrta met’ahu teqebelegn
Chernet new yaderesen eske zare

VERSE 6
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Bezmare
Besew lij memekat aqumiyalehu

VERSE 7
Redat yante mehonhn awqeyalehu
Ante ket’ebekegn hiywete aydeferm
Yene sira, migbaren tewew
Yemesqelun neger mersaten

VERSE 8
Hat’iaten ansa ante Iyesus Kristos amlake neh
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare

VERSE 9
Lamesgn yene Geta bezmare
Andach endelelegn awqewalehu
Beante chernet gin emekalehu
Yekebedew shekme yiqelal

VERSE 10
Yiqrta lebariya yidersegnal
Bemeqdesh qome lemezemer
Sirahn letwld lememesker
Ene man negn ene man negn biye asbalehu

VERSE 11
Amlak chernetn adenqalehu
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare

VERSE 12
Lamesgn yene Geta bezmare',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'cherinetih-new-yaderesegn-esike-zare-3140'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 1
አንዳች እንደሌለኝ አውቀዋለሁ
በአንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀላል
ይቅርታ ለባሪያ ይደርሰኛል

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 2
በመቅደስህ ቆሜ ለመዘመር
ስራህን ለትውልድ ለመመስከር
እኔ ማን ነኝ እኔ ማን ነኝ ብዬ አስባለሁ
አምላክ ቸርነትን አደንቃለሁ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 3
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 4
መክሊቴን ቀብሬ ባሳዝንም
መብራቴንም ይዤ ባልጠብቅም
በታላቅ ይቅርታ እንዳትረሳኝ
በፍቅር ጎብኝተህ ከሞት አውጣኝ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 5
ከቤትህ ራቅኩኝ፣ ተቸገርኩኝ አምናለሁ
አምናለሁ አምላኬ እንድትምረኝ
በይቅርታ መጣሁ ተቀበለኝ
ቸርነት ነው ያደረሰን እስከ ዛሬ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 6
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
በዝማሬ
በሰው ልጅ መመካት አቁሚያለሁ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 7
ረዳት ያንተ መሆንህን አውቄያለሁ
አንተ ከጠበከኝ ሕይወቴ አይደፈርም
የኔ ሥራ፣ ምግባሬን ተወው
የመስቀሉን ነገር መርሳቴን

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 8
ኃጢአቴን አንሳ አንተ ኢየሱስ ክርስቶስ አምላኬ ነህ
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 9
ላመስግን የኔ ጌታ በዝማሬ
አንዳች እንደሌለኝ አውቀዋለሁ
በአንተ ቸርነት ግን እመካለሁ
የከበደው ሸክሜ ይቀላል

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 10
ይቅርታ ለባሪያ ይደርሰኛል
በመቅደስህ ቆሜ ለመዘመር
ስራህን ለትውልድ ለመመስከር
እኔ ማን ነኝ እኔ ማን ነኝ ብዬ አስባለሁ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 11
አምላክ ቸርነትን አደንቃለሁ
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ

VERSE 12
ላመስግን የኔ ጌታ በዝማሬ

CHORUS
ቸርነት ነው ያደረሰን እስከ ዛሬ
ቸርነት ነው የጠበቀን እስከ ዛሬ
ላመስግን የኔ ጌታ በዝማሬ
ላመስግን የኔ ጌታ በዝማሬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 1
Andach endelelegn awqewalehu
Beante chernet gin emekalehu
Yekebedew shekme yiqelal
Yiqrta lebariya yidersegnal

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 2
Bemeqdesh qome lemezemer
Sirahn letwld lememesker
Ene man negn ene man negn biye asbalehu
Amlak chernetn adenqalehu

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 3
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 4
Mekliten qebre basaznm
Mebratenm yizhe balt’ebqm
Betalaq yiqrta endatresagn
Befqr gobgnteh kemot awt’agn

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 5
Kebeth raqkugn, techegerkugn amnalehu
Amnalehu amlake endtmregn
Beyqrta met’ahu teqebelegn
Chernet new yaderesen eske zare

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 6
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Bezmare
Besew lij memekat aqumiyalehu

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 7
Redat yante mehonhn awqeyalehu
Ante ket’ebekegn hiywete aydeferm
Yene sira, migbaren tewew
Yemesqelun neger mersaten

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 8
Hat’iaten ansa ante Iyesus Kristos amlake neh
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 9
Lamesgn yene Geta bezmare
Andach endelelegn awqewalehu
Beante chernet gin emekalehu
Yekebedew shekme yiqelal

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 10
Yiqrta lebariya yidersegnal
Bemeqdesh qome lemezemer
Sirahn letwld lememesker
Ene man negn ene man negn biye asbalehu

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 11
Amlak chernetn adenqalehu
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare

VERSE 12
Lamesgn yene Geta bezmare

CHORUS
Chernet new yaderesen eske zare
Chernet new yet’ebeqen eske zare
Lamesgn yene Geta bezmare
Lamesgn yene Geta bezmare'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'cherinetih-new-yaderesegn-esike-zare-3140', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Chernetih Bizu Mihretih Bizu (chernetih-bizu-mihretih-bizu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ

VERSE 1
እስራኤል ወደቀ (እስራኤል ተነሳ(2×))
መንገዱ አልቀናውም (አምላኩን ቢረሳ(2×))
የያዕቆብን አምላክ (እግዚአብሔርን ይዞ(2×))
ምን እንዳተረፈ (አውቆታል በጉዞ(2×))

VERSE 2
መንገዱ አይታክትም (ጎዳናው የቀና(2×))
እግዚአብሔር ከፊትም (ከኋላም አለና(2×))
እርሱ ከሌለበት (ቢመችም መንገዱ(2×))
አቅጣጫው ወደሞት (አይቀርም መውሰዱ(2×))

VERSE 3
በመንገዱ ዝለን (ወድቀን መች ቀርተናል(2×))
የያዕቆብ አምላክ (ደግፎ አንስቶናል(2×))
እግዚአብሔር ሲጠራን (በቀደመው መንገድ(2×))
ጉዟችን ወዴት ነው (በሞት ለመወሰድ(2×))

VERSE 4
አምላክ ሆይ ፍቅርህን (በልባችን ሳለው(2×))
እስከሞት በመስቀል (የወደደን ማነው(2×))
በበረሀው ፅናት (ሲጸናብን ርሀቡ(2×))
በረከት ሞላልን (ተረፈልን ምግቡ(2×))',
      lyrics_transliteration = 'cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya

VERSE 1
srael wedeqe (srael tenesa(2×))
mengedu elqenawm (emlakun biresa(2×))
yeyaqobn emlak (gziebhern yzo(2×))
mn ndaterefe (ewqotal beguzo(2×))

VERSE 2
mengedu eytaktm (godanaw yeqena(2×))
gziebher kefitm (kelam elena(2×))
rsu kelelebet (bimechm mengedu(2×))
eqtachaw wedemot (eyqerm mewsedu(2×))

VERSE 3
bemengedu zlen (wedqen mech qertenal(2×))
yeyaqob emlak (degfo enstonal(2×))
gziebher siteran (beqedemew menged(2×))
guchn wedet new (bemot lemewesed(2×))

VERSE 4
emlak hoy fqrhn (belbachn salew(2×))
skemot bemesqel (yewededen manew(2×))
beberehew tsnat (sitsenabn rhebu(2×))
bereket molaln (terefeln mgbu(2×))',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'chernetih-bizu-mihretih-bizu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ

VERSE 1
እስራኤል ወደቀ (እስራኤል ተነሳ(2×))
መንገዱ አልቀናውም (አምላኩን ቢረሳ(2×))
የያዕቆብን አምላክ (እግዚአብሔርን ይዞ(2×))
ምን እንዳተረፈ (አውቆታል በጉዞ(2×))

CHORUS
ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ

VERSE 2
መንገዱ አይታክትም (ጎዳናው የቀና(2×))
እግዚአብሔር ከፊትም (ከኋላም አለና(2×))
እርሱ ከሌለበት (ቢመችም መንገዱ(2×))
አቅጣጫው ወደሞት (አይቀርም መውሰዱ(2×))

CHORUS
ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ

VERSE 3
በመንገዱ ዝለን (ወድቀን መች ቀርተናል(2×))
የያዕቆብ አምላክ (ደግፎ አንስቶናል(2×))
እግዚአብሔር ሲጠራን (በቀደመው መንገድ(2×))
ጉዟችን ወዴት ነው (በሞት ለመወሰድ(2×))

CHORUS
ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ

VERSE 4
አምላክ ሆይ ፍቅርህን (በልባችን ሳለው(2×))
እስከሞት በመስቀል (የወደደን ማነው(2×))
በበረሀው ፅናት (ሲጸናብን ርሀቡ(2×))
በረከት ሞላልን (ተረፈልን ምግቡ(2×))

CHORUS
ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya

VERSE 1
srael wedeqe (srael tenesa(2×))
mengedu elqenawm (emlakun biresa(2×))
yeyaqobn emlak (gziebhern yzo(2×))
mn ndaterefe (ewqotal beguzo(2×))

CHORUS
cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya

VERSE 2
mengedu eytaktm (godanaw yeqena(2×))
gziebher kefitm (kelam elena(2×))
rsu kelelebet (bimechm mengedu(2×))
eqtachaw wedemot (eyqerm mewsedu(2×))

CHORUS
cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya

VERSE 3
bemengedu zlen (wedqen mech qertenal(2×))
yeyaqob emlak (degfo enstonal(2×))
gziebher siteran (beqedemew menged(2×))
guchn wedet new (bemot lemewesed(2×))

CHORUS
cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya

VERSE 4
emlak hoy fqrhn (belbachn salew(2×))
skemot bemesqel (yewededen manew(2×))
beberehew tsnat (sitsenabn rhebu(2×))
bereket molaln (terefeln mgbu(2×))

CHORUS
cherneth bzu mhreth bzu
beguchn rdan tebab new mengedu
dnq new emlak hoy fqrh lenya
dnq new lenya ente neh melkam renya'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'chernetih-bizu-mihretih-bizu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  IF v_total <> 100 THEN
    RAISE EXCEPTION 'Batch 02 count mismatch: expected 100, got %', v_total;
  END IF;

  RAISE EXCEPTION 'DRY RUN BATCH 02 SUCCESS: Verified % hymns. Rolling back cleanly.', v_total;
END $batch_02$;
