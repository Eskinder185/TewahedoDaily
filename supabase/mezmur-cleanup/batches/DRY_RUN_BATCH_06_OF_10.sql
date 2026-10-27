-- =========================================================================
-- BATCH 06 of 10: 100 Hymns (501 to 600)
-- Target: public.mezmur_data_import
-- Strict 5-Column Concurrency Check + Atomic Transaction
-- =========================================================================

DO $batch_06$
DECLARE
  v_updated integer := 0;
  v_total integer := 0;
BEGIN

  -- Hymn: Kidisit (kidisit)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 1
በዝማሬ እንበርታ በገናውን እንያዝና
መልካም ስራ የሚሰራባት
ሰንበት ቅድስት ናት እና
ከጨለማ ብርሀን ከመገዛት ነፃነት

VERSE 2
እግዚአብሔር ይህን ሰጠን
ደስ ይበለን በሰንበት
ለአብርሃም ተገልጣለች
ለሙሴም በደብረ ሲና

VERSE 3
በነቢያት የታወቀች
ሰንበት ዳራዊት ናት እና
በሳምንቱ ሰለጠነች
ተሰበከች በሐዋርያት

VERSE 4
ሃሌ ሉያ ዕለተ ሰንበት
ተሰጠችን ልናርፍባት
በእልልታ እንሞላ እንደ ነቢዩ አሳፍር
በከበረች የሰንበት ቀን ኑ ለቅኔ እንሰለፍ

VERSE 5
በመቅደሱ ናቸው እና ቅዱስነትና ግርማ
ውዳሴያችን ይሰማልን
ከምድር እስከ እዮር እራማ
እግዚአብሔር አብ የባረካት

VERSE 6
እግዚአብሔር ወልድ የቀደሳት
ከእለታት ሁሉ መርጦ
መንፈስ ቅዱስ ከፍ ያደረጋት
በእርሷ ሀሴት እናድርግ

VERSE 7
እናክብራት እንድንከብር
የደጀሰላሙ ታዛ በመቅደሱ እንሰብሰብ',
      lyrics_transliteration = 'Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 1
Bezmare enberta begenawn enyazna
Melkam sira yemiserabat
Senbet Kidist nat ena
Kech’elema birhen kemegezat nets’anet

VERSE 2
Egziabher yihn set’en
Des yibelen besenbet
Leabrham tegelt’alech
Lemusem bedebre sina

VERSE 3
Benebiyat yetaweqech
Senbet darawit nat ena
Besamntu selet’enech
Tesebekech behewaryat

VERSE 4
Halleluya elete senbet
Teset’echn linarfbat
Beellta enmola ende nebiyu asafr
Bekeberech yesenbet qen nu leqne enselef

VERSE 5
Bemeqdesu nachew ena qidusnetna girma
Widaseyachn yisemaln
Kemdr eske eyor erama
Egziabher Ab yebarekat

VERSE 6
Egziabher Weld yeqedesat
Keeletat hulu mert’o
Menfes Kidus kef yaderegat
Beerswa heset enadrg

VERSE 7
Enakbrat endnkebr
Yedejeselamu taza bemeqdesu ensebseb',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kidisit'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 1
በዝማሬ እንበርታ በገናውን እንያዝና
መልካም ስራ የሚሰራባት
ሰንበት ቅድስት ናት እና
ከጨለማ ብርሀን ከመገዛት ነፃነት

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 2
እግዚአብሔር ይህን ሰጠን
ደስ ይበለን በሰንበት
ለአብርሃም ተገልጣለች
ለሙሴም በደብረ ሲና

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 3
በነቢያት የታወቀች
ሰንበት ዳራዊት ናት እና
በሳምንቱ ሰለጠነች
ተሰበከች በሐዋርያት

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 4
ሃሌ ሉያ ዕለተ ሰንበት
ተሰጠችን ልናርፍባት
በእልልታ እንሞላ እንደ ነቢዩ አሳፍር
በከበረች የሰንበት ቀን ኑ ለቅኔ እንሰለፍ

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 5
በመቅደሱ ናቸው እና ቅዱስነትና ግርማ
ውዳሴያችን ይሰማልን
ከምድር እስከ እዮር እራማ
እግዚአብሔር አብ የባረካት

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 6
እግዚአብሔር ወልድ የቀደሳት
ከእለታት ሁሉ መርጦ
መንፈስ ቅዱስ ከፍ ያደረጋት
በእርሷ ሀሴት እናድርግ

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን

VERSE 7
እናክብራት እንድንከብር
የደጀሰላሙ ታዛ በመቅደሱ እንሰብሰብ

CHORUS
በኩር ናት የበዓላት
ኑ ከፍ ከፍ እናድርጋት
በእሷ ደስ ይበለን
በሰንበተ ክርስቲያን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 1
Bezmare enberta begenawn enyazna
Melkam sira yemiserabat
Senbet Kidist nat ena
Kech’elema birhen kemegezat nets’anet

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 2
Egziabher yihn set’en
Des yibelen besenbet
Leabrham tegelt’alech
Lemusem bedebre sina

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 3
Benebiyat yetaweqech
Senbet darawit nat ena
Besamntu selet’enech
Tesebekech behewaryat

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 4
Halleluya elete senbet
Teset’echn linarfbat
Beellta enmola ende nebiyu asafr
Bekeberech yesenbet qen nu leqne enselef

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 5
Bemeqdesu nachew ena qidusnetna girma
Widaseyachn yisemaln
Kemdr eske eyor erama
Egziabher Ab yebarekat

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 6
Egziabher Weld yeqedesat
Keeletat hulu mert’o
Menfes Kidus kef yaderegat
Beerswa heset enadrg

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan

VERSE 7
Enakbrat endnkebr
Yedejeselamu taza bemeqdesu ensebseb

CHORUS
Bekur nat yebealat
Nu kef kef enadrgat
Beeswa des yibelen
Besenbete kirstiyan'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'kidisit', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: kidist (kidist)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሰንበት ቅድስት ዕለተ እረፍት
የደስታ ቀን ናት ዕልት ትፍሥሕት
የሰማይ መላእክት እግዚአብሔርን አይተው
ያመሰገኑባት ቅዱስ ቅዱስ ብለው

VERSE 1
በዕለት ሰንበት ከሰማይ ወረደ
በድንግል ማኅፀን ሥጋን ተዋሐደ
ሰንበትን ቅደሳት ከዕለታት ለይቶ
ሞትን አሽንፎ ከመቃብር ወጥቶ

VERSE 2
ኑ እናክብራት
ኑ እንቀድሳት
የበዓላት በኩር ሰንበት ቅድስት ናት
ኑ እናክብራት

VERSE 3
ኑ እንቀድሳት
የበዓላት በኩር ሰንበት ቅድስት ናት',
      lyrics_transliteration = 'Senbet Kidist elete ereft
Yedesta qen nat elt tifsht
Yesemay melaekt Egziabhern aytew
Yamesegenubat Kidus Kidus bilew

VERSE 1
Beelet senbet kesemay werede
Bedngl mahts’en sigan tewahede
Senbetn qidesat keeletat leyto
Motn ashnfo kemeqabr wet’to

VERSE 2
Nu enakbrat
Nu enqedsat
Yebealat bekur senbet Kidist nat
Nu enakbrat

VERSE 3
Nu enqedsat
Yebealat bekur senbet Kidist nat',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kidist'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰንበት ቅድስት ዕለተ እረፍት
የደስታ ቀን ናት ዕልት ትፍሥሕት
የሰማይ መላእክት እግዚአብሔርን አይተው
ያመሰገኑባት ቅዱስ ቅዱስ ብለው

VERSE 1
በዕለት ሰንበት ከሰማይ ወረደ
በድንግል ማኅፀን ሥጋን ተዋሐደ
ሰንበትን ቅደሳት ከዕለታት ለይቶ
ሞትን አሽንፎ ከመቃብር ወጥቶ

CHORUS
ሰንበት ቅድስት ዕለተ እረፍት
የደስታ ቀን ናት ዕልት ትፍሥሕት
የሰማይ መላእክት እግዚአብሔርን አይተው
ያመሰገኑባት ቅዱስ ቅዱስ ብለው

VERSE 2
ኑ እናክብራት
ኑ እንቀድሳት
የበዓላት በኩር ሰንበት ቅድስት ናት
ኑ እናክብራት

CHORUS
ሰንበት ቅድስት ዕለተ እረፍት
የደስታ ቀን ናት ዕልት ትፍሥሕት
የሰማይ መላእክት እግዚአብሔርን አይተው
ያመሰገኑባት ቅዱስ ቅዱስ ብለው

VERSE 3
ኑ እንቀድሳት
የበዓላት በኩር ሰንበት ቅድስት ናት

CHORUS
ሰንበት ቅድስት ዕለተ እረፍት
የደስታ ቀን ናት ዕልት ትፍሥሕት
የሰማይ መላእክት እግዚአብሔርን አይተው
ያመሰገኑባት ቅዱስ ቅዱስ ብለው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Senbet Kidist elete ereft
Yedesta qen nat elt tifsht
Yesemay melaekt Egziabhern aytew
Yamesegenubat Kidus Kidus bilew

VERSE 1
Beelet senbet kesemay werede
Bedngl mahts’en sigan tewahede
Senbetn qidesat keeletat leyto
Motn ashnfo kemeqabr wet’to

CHORUS
Senbet Kidist elete ereft
Yedesta qen nat elt tifsht
Yesemay melaekt Egziabhern aytew
Yamesegenubat Kidus Kidus bilew

VERSE 2
Nu enakbrat
Nu enqedsat
Yebealat bekur senbet Kidist nat
Nu enakbrat

CHORUS
Senbet Kidist elete ereft
Yedesta qen nat elt tifsht
Yesemay melaekt Egziabhern aytew
Yamesegenubat Kidus Kidus bilew

VERSE 3
Nu enqedsat
Yebealat bekur senbet Kidist nat

CHORUS
Senbet Kidist elete ereft
Yedesta qen nat elt tifsht
Yesemay melaekt Egziabhern aytew
Yamesegenubat Kidus Kidus bilew'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'kidist', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Kidist Ethiopia (kidist-ethiopia)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ

VERSE 1
በቃልኪዳን አጥር ያጠሩሽ ሥላሴ
አይጥፋ ከምድርሽ የሰማይ ቅዳሴ
ልጆችሽ ይደጉ በሰላም ውዳሴ2
ፍቅርን የዘሩብሽ ጥንት አባቶቻችን

VERSE 2
መንፈሳዊት ሀገር እናት ሀገራችን
እንደተኛን አይቶ ልጆ ችሽ ሁላችን
ዛራብሽ እንክርዳድ ጥንተ ጠላታችን2
ተሰዓቱ ቅዱሳን እነ አባ ገሪማ

VERSE 3
እነ አባ አረጋዊ እነ አባ ጽህማ
ንጽህናን ተጫምተው እንደ ወርቅ ጫማ
አርገውሽ ነበር የወንጌል ከተማ የብርሀን ከተማ
አሁን ግን ከቦሻል ሀዘንና ልቅሶ

VERSE 4
የቀደመው አጥር ፍቅር በጠብ ፈርሶ
ቢሆንም አይጠፋም ተስፋችን ጨርሶ
የቀደመው ክብርሽ ይመታል መልሶ2',
      lyrics_transliteration = 'Kidist ityop’ya
Kidist ityop’ya yet’beb megegna
YeEgziabher heger yealem mets’nagna
Beasru tiezazat beorite muse

VERSE 1
Beqalkidan at’r yat’erush Silassie
Ayt’fa kemdrsh yesemay qidase
Lijochsh yidegu beselam widase2
Fiqrn yezerubsh t’nt abatochachn

VERSE 2
Menfesawit heger enat hegerachn
Endetegnan ayto lijo chsh hulachn
Zarabsh enkrdad t’nte t’elatachn2
Teseatu Kidusan ene aba gerima

VERSE 3
Ene aba aregawi ene aba ts’hma
Nits’hnan tech’amtew ende werq ch’ama
Argewsh neber yewengel ketema yebrhen ketema
Ahun gin keboshal hezenna liqso

VERSE 4
Yeqedemew at’r fiqr bet’eb ferso
Bihonm ayt’efam tesfachn ch’erso
Yeqedemew kibrsh yimetal melso2',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kidist-ethiopia'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ

VERSE 1
በቃልኪዳን አጥር ያጠሩሽ ሥላሴ
አይጥፋ ከምድርሽ የሰማይ ቅዳሴ
ልጆችሽ ይደጉ በሰላም ውዳሴ2
ፍቅርን የዘሩብሽ ጥንት አባቶቻችን

CHORUS
ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ

VERSE 2
መንፈሳዊት ሀገር እናት ሀገራችን
እንደተኛን አይቶ ልጆ ችሽ ሁላችን
ዛራብሽ እንክርዳድ ጥንተ ጠላታችን2
ተሰዓቱ ቅዱሳን እነ አባ ገሪማ

CHORUS
ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ

VERSE 3
እነ አባ አረጋዊ እነ አባ ጽህማ
ንጽህናን ተጫምተው እንደ ወርቅ ጫማ
አርገውሽ ነበር የወንጌል ከተማ የብርሀን ከተማ
አሁን ግን ከቦሻል ሀዘንና ልቅሶ

CHORUS
ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ

VERSE 4
የቀደመው አጥር ፍቅር በጠብ ፈርሶ
ቢሆንም አይጠፋም ተስፋችን ጨርሶ
የቀደመው ክብርሽ ይመታል መልሶ2

CHORUS
ቅድስት ኢትዮጵያ
ቅድስት ኢትዮጵያ የጥበብ መገኛ
የእግዚአብሔር ሀገር የዓለም መጽናኛ
በአሥሩ ትዕዛዛት በኦሪተ ሙሴ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kidist ityop’ya
Kidist ityop’ya yet’beb megegna
YeEgziabher heger yealem mets’nagna
Beasru tiezazat beorite muse

VERSE 1
Beqalkidan at’r yat’erush Silassie
Ayt’fa kemdrsh yesemay qidase
Lijochsh yidegu beselam widase2
Fiqrn yezerubsh t’nt abatochachn

CHORUS
Kidist ityop’ya
Kidist ityop’ya yet’beb megegna
YeEgziabher heger yealem mets’nagna
Beasru tiezazat beorite muse

VERSE 2
Menfesawit heger enat hegerachn
Endetegnan ayto lijo chsh hulachn
Zarabsh enkrdad t’nte t’elatachn2
Teseatu Kidusan ene aba gerima

CHORUS
Kidist ityop’ya
Kidist ityop’ya yet’beb megegna
YeEgziabher heger yealem mets’nagna
Beasru tiezazat beorite muse

VERSE 3
Ene aba aregawi ene aba ts’hma
Nits’hnan tech’amtew ende werq ch’ama
Argewsh neber yewengel ketema yebrhen ketema
Ahun gin keboshal hezenna liqso

CHORUS
Kidist ityop’ya
Kidist ityop’ya yet’beb megegna
YeEgziabher heger yealem mets’nagna
Beasru tiezazat beorite muse

VERSE 4
Yeqedemew at’r fiqr bet’eb ferso
Bihonm ayt’efam tesfachn ch’erso
Yeqedemew kibrsh yimetal melso2

CHORUS
Kidist ityop’ya
Kidist ityop’ya yet’beb megegna
YeEgziabher heger yealem mets’nagna
Beasru tiezazat beorite muse'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'kidist-ethiopia', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: kidus gebriel . wedegna metaln (kidus-gebriel-wedegna-metaln)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 1
ዘማ………………
በሰማይ በሆነው በዓለመ መላእክት
ሳጥናኤል ሲነሳ ሽቶ አምላክነት
መከፋፈል ሲሆን ደንግጦ ልባቸው

VERSE 2
የሳጥናኤል ሀሳብ ያላጠራጠረው
ባለንበት እንቁም ብሎ የተናገረው
ነገደ መላእክትን ያረጋጋ እርሱ ነው
ዘማ………………

VERSE 3
በባቢሎን አገር ያሉ ሦስት ሕጻናት
ለፈጣሪያቸው የታመኑ በእውነት
ለአገሩ ጣኦት አንሰግድም ስላሉ
በጨካኙ ንጉሥ በእሳት ተጣሉ

VERSE 4
የእሳቱ ወላፈን ከቶ እንዳይነካቸው
ቅዱስ ገብርኤል ወርዶ ቆመ በመሐላቸው
ዘማ……………
ቂርቆስ ኢየሉጣ በእግዚአብሔር ታመኑ

VERSE 5
ስለስሙ ኖረው ምስክር ሊሆኑ
በፈጣሪያቸው በመታመናቸው
መሰደድ መሸሽ ሆነ እጣ ፋንታቸው
በሰማዕትነት እስክታርፍ ነፍሳቸው

VERSE 6
ቅዱስ ገብርኤል ነው ወርዶ ያበረታቸው
ዘማ…………
የአዳም ተስፋው ቃል መፈፀሚያው ሲደርስ
ክንፉን እያማታ ገባ ቤተ-መቅደስ

VERSE 7
የአምላክን ሰው መሆን ነገራት ለድንግል
ትፀንሻለሽ ብሎ አካላዊው ቃል
ወልደ አምላክ ክርስቶስ ወዳንቺ ይመጣል
ዓለሙን ለማዳን ካንቺ ይወለዳል

VERSE 8
ዘማ………………
ዘወትር የሚቆም በእግዚአብሔር ፊት
ስለእኛ ሚማልድ ከአምላክ ምሕረት
የኃጥኡን መመለስ እጅግ ሚያስደስተው

VERSE 9
የመላእክት አለቃ ቅዱስ ገብርኤል ነው
ባለንበት እንቁም ብሎ የተናገረው
ነገደ መላእክትን ያረጋጋ እርሱ ነው',
      lyrics_transliteration = 'Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 1
Zema………………
Besemay behonew bealeme melaekt
Sat’nael sinesa shto amlaknet
Mekefafel sihon dengt’o libachew

VERSE 2
Yesat’nael hesab yalat’erat’erew
Balenbet enqum bilo yetenagerew
Negede melaektn yaregaga ersu new
Zema………………

VERSE 3
Bebabilon ager yalu sost hits’anat
Lefet’ariyachew yetamenu beewnet
Leageru t’aot ansegdm silalu
Bech’ekagnu nigus beesat tet’alu

VERSE 4
Yeesatu welafen keto endaynekachew
Kidus Gebriel werdo qome bemehelachew
Zema……………
Qirqos iyelut’a beEgziabher tamenu

VERSE 5
Silesmu norew miskr lihonu
Befet’ariyachew bemetamenachew
Meseded meshesh hone et’a fantachew
Besemaetnet esktarf nefsachew

VERSE 6
Kidus Gebriel new werdo yaberetachew
Zema…………
Yeadam tesfaw qal mefets’emiyaw siders
Kinfun eyamata geba bete-meqdes

VERSE 7
Yeamlakn sew mehon negerat ledngl
Tits’enshalesh bilo akalawiw qal
Welde amlak Kristos wedanchi yimet’al
Alemun lemadan kanchi yiweledal

VERSE 8
Zema………………
Zewetr yemiqom beEgziabher fit
Sileegna mimald keamlak mihret
Yehat’un memeles ejg miyasdestew

VERSE 9
Yemelaekt aleqa Kidus Gebriel new
Balenbet enqum bilo yetenagerew
Negede melaektn yaregaga ersu new',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kidus-gebriel-wedegna-metaln'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 1
ዘማ………………
በሰማይ በሆነው በዓለመ መላእክት
ሳጥናኤል ሲነሳ ሽቶ አምላክነት
መከፋፈል ሲሆን ደንግጦ ልባቸው

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 2
የሳጥናኤል ሀሳብ ያላጠራጠረው
ባለንበት እንቁም ብሎ የተናገረው
ነገደ መላእክትን ያረጋጋ እርሱ ነው
ዘማ………………

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 3
በባቢሎን አገር ያሉ ሦስት ሕጻናት
ለፈጣሪያቸው የታመኑ በእውነት
ለአገሩ ጣኦት አንሰግድም ስላሉ
በጨካኙ ንጉሥ በእሳት ተጣሉ

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 4
የእሳቱ ወላፈን ከቶ እንዳይነካቸው
ቅዱስ ገብርኤል ወርዶ ቆመ በመሐላቸው
ዘማ……………
ቂርቆስ ኢየሉጣ በእግዚአብሔር ታመኑ

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 5
ስለስሙ ኖረው ምስክር ሊሆኑ
በፈጣሪያቸው በመታመናቸው
መሰደድ መሸሽ ሆነ እጣ ፋንታቸው
በሰማዕትነት እስክታርፍ ነፍሳቸው

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 6
ቅዱስ ገብርኤል ነው ወርዶ ያበረታቸው
ዘማ…………
የአዳም ተስፋው ቃል መፈፀሚያው ሲደርስ
ክንፉን እያማታ ገባ ቤተ-መቅደስ

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 7
የአምላክን ሰው መሆን ነገራት ለድንግል
ትፀንሻለሽ ብሎ አካላዊው ቃል
ወልደ አምላክ ክርስቶስ ወዳንቺ ይመጣል
ዓለሙን ለማዳን ካንቺ ይወለዳል

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 8
ዘማ………………
ዘወትር የሚቆም በእግዚአብሔር ፊት
ስለእኛ ሚማልድ ከአምላክ ምሕረት
የኃጥኡን መመለስ እጅግ ሚያስደስተው

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ

VERSE 9
የመላእክት አለቃ ቅዱስ ገብርኤል ነው
ባለንበት እንቁም ብሎ የተናገረው
ነገደ መላእክትን ያረጋጋ እርሱ ነው

CHORUS
ወደእኛ መጣልን ከአምላክ ተላከና
ድንግልን ሊጎበኝ ይዞ የብሥራት ዜና
የስሙ ትርጓሜ ሰውና አምላክ
ቅዱስ ገብርኤል አብሳሬ መልአክ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 1
Zema………………
Besemay behonew bealeme melaekt
Sat’nael sinesa shto amlaknet
Mekefafel sihon dengt’o libachew

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 2
Yesat’nael hesab yalat’erat’erew
Balenbet enqum bilo yetenagerew
Negede melaektn yaregaga ersu new
Zema………………

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 3
Bebabilon ager yalu sost hits’anat
Lefet’ariyachew yetamenu beewnet
Leageru t’aot ansegdm silalu
Bech’ekagnu nigus beesat tet’alu

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 4
Yeesatu welafen keto endaynekachew
Kidus Gebriel werdo qome bemehelachew
Zema……………
Qirqos iyelut’a beEgziabher tamenu

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 5
Silesmu norew miskr lihonu
Befet’ariyachew bemetamenachew
Meseded meshesh hone et’a fantachew
Besemaetnet esktarf nefsachew

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 6
Kidus Gebriel new werdo yaberetachew
Zema…………
Yeadam tesfaw qal mefets’emiyaw siders
Kinfun eyamata geba bete-meqdes

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 7
Yeamlakn sew mehon negerat ledngl
Tits’enshalesh bilo akalawiw qal
Welde amlak Kristos wedanchi yimet’al
Alemun lemadan kanchi yiweledal

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 8
Zema………………
Zewetr yemiqom beEgziabher fit
Sileegna mimald keamlak mihret
Yehat’un memeles ejg miyasdestew

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak

VERSE 9
Yemelaekt aleqa Kidus Gebriel new
Balenbet enqum bilo yetenagerew
Negede melaektn yaregaga ersu new

CHORUS
Wedeegna met’aln keamlak telakena
Dingln ligobegn yizo yebsrat zena
Yesmu tirgwame sewna amlak
Kidus Gebriel absare melak'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'kidus-gebriel-wedegna-metaln', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Kifun Alferam Zemarit Fasika Mekonen (kifun-alferam-zemarit-fasika-mekonen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በሞት ጥላ ውስጥ ብጓዝ አልፈራም
ከጎኔ ስላለ መድኃኔዓለም
እርኛዬ እሱ ነው የሚጠብቀኝ
በሕይወቴ የለም የሚያሳጣኝ

VERSE 1
በለመለመ መስክ የሚያሳድረኝ
በእረፍት ውሃ ዘንድ የሚመራኝ
አባቴ እና አምላኬ መልካሙ እረኛ
ሞቴን የሞተልኝ የነፍሴ አዳኛ

VERSE 2
ስለ እኔ የሚያስብ ዘውትር ጠዋት ማታ
ነፍሴን የሚመልስ ከጥፋቱ ቦታ
ስለ ስሙ መራኝ በእውነተኛ ስፍራ
በሞት ጥላ ብሔድ ክፉውን አልፈራ

VERSE 3
በትርህና ምርኩዝህ ያጽናኑኛል ጌታ
አዘጋጀህልኝ በፊቴ ገበታ
በዘይት ቀባኸው እራሴን በክብር
ጽዋዬ ሙሉ ነው ከአንተ ጋራ ስኖር

VERSE 4
እኔን ተከተሉኝ ቸርነት ምሕረትህ
በሕይወቴ ሁሉ ሊያኖሩኝ በእቅፍህ
ይቅርባይ እንደሆንክ አምላክ ሆይ አውቃለሁ
ዘላለም ከቤትህ ሳልወጣ እኖራለሁ',
      lyrics_transliteration = 'Bemot t’la wist’ bigwaz alferam
Kegone silale Medhanealem
Ergnaye esu new yemit’ebqegn
Behywete yelem yemiyasat’agn

VERSE 1
Belemeleme mesk yemiyasadregn
Beereft wiha zend yemimeragn
Abate ena amlake melkamu eregna
Moten yemotelgn yenefse adagna

VERSE 2
Sile ene yemiyasb zewtr t’ewat mata
Nefsen yemimels ket’fatu bota
Sile simu meragn beewnetegna sifra
Bemot t’la bihed kifuwn alfera

VERSE 3
Betrhna mirkuzh yats’nanugnal Geta
Azegajehlgn befite gebeta
Bezeyt qebaኸw erasen bekbr
Ts’waye mulu new keante gara sinor

VERSE 4
Enen teketelugn chernet mihreth
Behywete hulu liyanorugn beeqfh
Yiqrbay endehonk amlak hoy awqalehu
Zelalem kebeth salwet’a enoralehu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kifun-alferam-zemarit-fasika-mekonen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በሞት ጥላ ውስጥ ብጓዝ አልፈራም
ከጎኔ ስላለ መድኃኔዓለም
እርኛዬ እሱ ነው የሚጠብቀኝ
በሕይወቴ የለም የሚያሳጣኝ

VERSE 1
በለመለመ መስክ የሚያሳድረኝ
በእረፍት ውሃ ዘንድ የሚመራኝ
አባቴ እና አምላኬ መልካሙ እረኛ
ሞቴን የሞተልኝ የነፍሴ አዳኛ

CHORUS
በሞት ጥላ ውስጥ ብጓዝ አልፈራም
ከጎኔ ስላለ መድኃኔዓለም
እርኛዬ እሱ ነው የሚጠብቀኝ
በሕይወቴ የለም የሚያሳጣኝ

VERSE 2
ስለ እኔ የሚያስብ ዘውትር ጠዋት ማታ
ነፍሴን የሚመልስ ከጥፋቱ ቦታ
ስለ ስሙ መራኝ በእውነተኛ ስፍራ
በሞት ጥላ ብሔድ ክፉውን አልፈራ

CHORUS
በሞት ጥላ ውስጥ ብጓዝ አልፈራም
ከጎኔ ስላለ መድኃኔዓለም
እርኛዬ እሱ ነው የሚጠብቀኝ
በሕይወቴ የለም የሚያሳጣኝ

VERSE 3
በትርህና ምርኩዝህ ያጽናኑኛል ጌታ
አዘጋጀህልኝ በፊቴ ገበታ
በዘይት ቀባኸው እራሴን በክብር
ጽዋዬ ሙሉ ነው ከአንተ ጋራ ስኖር

CHORUS
በሞት ጥላ ውስጥ ብጓዝ አልፈራም
ከጎኔ ስላለ መድኃኔዓለም
እርኛዬ እሱ ነው የሚጠብቀኝ
በሕይወቴ የለም የሚያሳጣኝ

VERSE 4
እኔን ተከተሉኝ ቸርነት ምሕረትህ
በሕይወቴ ሁሉ ሊያኖሩኝ በእቅፍህ
ይቅርባይ እንደሆንክ አምላክ ሆይ አውቃለሁ
ዘላለም ከቤትህ ሳልወጣ እኖራለሁ

CHORUS
በሞት ጥላ ውስጥ ብጓዝ አልፈራም
ከጎኔ ስላለ መድኃኔዓለም
እርኛዬ እሱ ነው የሚጠብቀኝ
በሕይወቴ የለም የሚያሳጣኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bemot t’la wist’ bigwaz alferam
Kegone silale Medhanealem
Ergnaye esu new yemit’ebqegn
Behywete yelem yemiyasat’agn

VERSE 1
Belemeleme mesk yemiyasadregn
Beereft wiha zend yemimeragn
Abate ena amlake melkamu eregna
Moten yemotelgn yenefse adagna

CHORUS
Bemot t’la wist’ bigwaz alferam
Kegone silale Medhanealem
Ergnaye esu new yemit’ebqegn
Behywete yelem yemiyasat’agn

VERSE 2
Sile ene yemiyasb zewtr t’ewat mata
Nefsen yemimels ket’fatu bota
Sile simu meragn beewnetegna sifra
Bemot t’la bihed kifuwn alfera

CHORUS
Bemot t’la wist’ bigwaz alferam
Kegone silale Medhanealem
Ergnaye esu new yemit’ebqegn
Behywete yelem yemiyasat’agn

VERSE 3
Betrhna mirkuzh yats’nanugnal Geta
Azegajehlgn befite gebeta
Bezeyt qebaኸw erasen bekbr
Ts’waye mulu new keante gara sinor

CHORUS
Bemot t’la wist’ bigwaz alferam
Kegone silale Medhanealem
Ergnaye esu new yemit’ebqegn
Behywete yelem yemiyasat’agn

VERSE 4
Enen teketelugn chernet mihreth
Behywete hulu liyanorugn beeqfh
Yiqrbay endehonk amlak hoy awqalehu
Zelalem kebeth salwet’a enoralehu

CHORUS
Bemot t’la wist’ bigwaz alferam
Kegone silale Medhanealem
Ergnaye esu new yemit’ebqegn
Behywete yelem yemiyasat’agn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'kifun-alferam-zemarit-fasika-mekonen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Kininet (kininet)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች

VERSE 1
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች
አቤሚሌክ ሳራን ቢወሰድም ቀምቶ
ለኅጢአት ቢቸኩል ለዉበቷ ጓጉቶ
የልቡ ቅንነት በእግዚአብሔር ዘንድ ታይቶ ታረቋል ከአምላኩ ምህረትን አግኝቶ(2)

VERSE 2
ተንኮል የሌለበት ልቡ ቅን የሆነ
ዳዊት ናትናኤልን ሙሴን የመሰለ
ይጠራዋል አምላክ ያነጋግረዋል
በመንገዱ ሁሉ በፍቱ ይቀድማል(2)

VERSE 3
ከያሁዳ እንራቅ እንሂድ ወደ ጴጥሮስ
ከዮሴፍ ጋር እንሁን እንንሽሽ ከሄሮድስ
ከቃየንም አቤል ከሳኦልም ዳዊት
ተመርጠዋልና በልብ ቅንነት (2)

VERSE 4
ቅን ፍርድን ፍረዱ በመልክ አትፍረዱ
እንደለ ጌታችን ለዓለም ለትዉልዱ
በእዉነትና በፍቅር ስራችንን እንስራ
ከፍርድ እንድናመልጥ ከጭንቅ ከመከራ (2)',
      lyrics_transliteration = 'Qinnet yeegziabhern fitun tayewalech
Beersum sim timekalech
Qinnet yeegziabhern fitun tayewalech (2)
Hat’yategnochnm tats’edqalech

VERSE 1
Qinnet yeegziabhern fitun tayewalech
Abemilek saran biwesedm qemto
Leht’iat bichekul lewubetwa gwaguto
Yelbu qinnet beEgziabher zend tayto tareqwal keamlaku mihretn aggnto (2)

VERSE 2
Tenkol yelelebet libu qin yehone
Dawit natnaeln musen yemesele
Yit’erawal amlak yanegagrewal
Bemengedu hulu beftu yiqedmal (2)

VERSE 3
Keyahuda enraq enhid wede p’et’ros
Keyosef gar enhun ennshsh keherods
Keqayenm abel kesaolm dawit
Temert’ewalna belb qinnet (2)

VERSE 4
Qin firdn firedu bemelk atfredu
Endele Getachen lealem letwuldu
Beewunetna befqr sirachnn ensra
Kefrd endnamelt’ kech’nq kemekera (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kininet'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች

VERSE 1
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች
አቤሚሌክ ሳራን ቢወሰድም ቀምቶ
ለኅጢአት ቢቸኩል ለዉበቷ ጓጉቶ
የልቡ ቅንነት በእግዚአብሔር ዘንድ ታይቶ ታረቋል ከአምላኩ ምህረትን አግኝቶ(2)

CHORUS
ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች

VERSE 2
ተንኮል የሌለበት ልቡ ቅን የሆነ
ዳዊት ናትናኤልን ሙሴን የመሰለ
ይጠራዋል አምላክ ያነጋግረዋል
በመንገዱ ሁሉ በፍቱ ይቀድማል(2)

CHORUS
ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች

VERSE 3
ከያሁዳ እንራቅ እንሂድ ወደ ጴጥሮስ
ከዮሴፍ ጋር እንሁን እንንሽሽ ከሄሮድስ
ከቃየንም አቤል ከሳኦልም ዳዊት
ተመርጠዋልና በልብ ቅንነት (2)

CHORUS
ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች

VERSE 4
ቅን ፍርድን ፍረዱ በመልክ አትፍረዱ
እንደለ ጌታችን ለዓለም ለትዉልዱ
በእዉነትና በፍቅር ስራችንን እንስራ
ከፍርድ እንድናመልጥ ከጭንቅ ከመከራ (2)

CHORUS
ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Qinnet yeegziabhern fitun tayewalech
Beersum sim timekalech
Qinnet yeegziabhern fitun tayewalech (2)
Hat’yategnochnm tats’edqalech

VERSE 1
Qinnet yeegziabhern fitun tayewalech
Abemilek saran biwesedm qemto
Leht’iat bichekul lewubetwa gwaguto
Yelbu qinnet beEgziabher zend tayto tareqwal keamlaku mihretn aggnto (2)

CHORUS
Qinnet yeegziabhern fitun tayewalech
Beersum sim timekalech
Qinnet yeegziabhern fitun tayewalech (2)
Hat’yategnochnm tats’edqalech

VERSE 2
Tenkol yelelebet libu qin yehone
Dawit natnaeln musen yemesele
Yit’erawal amlak yanegagrewal
Bemengedu hulu beftu yiqedmal (2)

CHORUS
Qinnet yeegziabhern fitun tayewalech
Beersum sim timekalech
Qinnet yeegziabhern fitun tayewalech (2)
Hat’yategnochnm tats’edqalech

VERSE 3
Keyahuda enraq enhid wede p’et’ros
Keyosef gar enhun ennshsh keherods
Keqayenm abel kesaolm dawit
Temert’ewalna belb qinnet (2)

CHORUS
Qinnet yeegziabhern fitun tayewalech
Beersum sim timekalech
Qinnet yeegziabhern fitun tayewalech (2)
Hat’yategnochnm tats’edqalech

VERSE 4
Qin firdn firedu bemelk atfredu
Endele Getachen lealem letwuldu
Beewunetna befqr sirachnn ensra
Kefrd endnamelt’ kech’nq kemekera (2)

CHORUS
Qinnet yeegziabhern fitun tayewalech
Beersum sim timekalech
Qinnet yeegziabhern fitun tayewalech (2)
Hat’yategnochnm tats’edqalech'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'kininet', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: #kirisitiyaniyu_simey_new_eritrean_orthodox_tewahdo_mezmur_zemari_Bereket_tikue_2021_2014 (kirisitiyaniyu-simey-new-eritrean-orthodox-tewahdo-mezmur-zemari-bereket)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኩሉ ሰብ ይፈልጦ‘ዩ ክርስትያን''ዩ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ''ትምክሕተይ
[ ልበይ ‘ና ኣመነ ግብረይ ከይክሕደካ
ኢየሱስ ብፍቕሪ ሕተሞ ባርያኻ ] (2×)

VERSE 1
ደገይ ጻዕዳ ጌይረ ብውሽጠይ ግን ጸላም
ስመይ ናይ ክርስቶስ ግብረይ ግን ናይ ዓለም
ከም ልቚሉቚ መቃብር በድኒ ተሸኪመ
ብሙስሉይ መንገዲ ክንደይ ድየ ሳጒመ

VERSE 2
ውሻጠ ውሻጠይ ንስኻ''ኻ ትፈልጦ
ሓደራኻ ጎይታይ ሂወተይ ለውጦ
ይኣክል ሎሚ''ሲ በቃ ይእከለኒ
ዘይንሰይ ምምሳለይ ጾሩ ከቢዱኒ

VERSE 3
ብሓቀኛ መንነት ኣነ ከኽብረካ
ብስጋ ብነፍሲ ክግዛእ ንዓኻ
በደለይ ረሲዕካ ይቕረ በለኒ''ኻ‘ሞ
ዘመነይ ኣብ ቤትካ ኮይነ ክዛዝሞ',
      lyrics_transliteration = 'Kulu seb yifelt’o‘yu kirstyan''yu simey
Maebel zesgereni simka z''timkhtey
[ libey ‘na amene gibrey keykhdeka
Iyesus bifቕri hitemo baryaኻ ] (2×)

VERSE 1
Degey ts’aeda geyre biwsht’ey gin ts’elam
Simey nay Kristos gibrey gin nay alem
Kem liቚluቚ meqabr bedni teshekime
Bimusluy mengedi kindey diye sagwime

VERSE 2
Wishat’e wishat’ey nisኻ''ኻ tifelt’o
Haderaኻ goytay hiwetey lewt’o
Yiakl lomi''si beqa yiekeleni
Zeynsey mimsaley ts’oru kebiduni

VERSE 3
Bihaqegna mennet ane keኽbreka
Bisga binefsi kigzae niaኻ
Bedeley resieka yiቕre beleni''ኻ‘mo
Zemeney ab betka koyne kizazmo',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kirisitiyaniyu-simey-new-eritrean-orthodox-tewahdo-mezmur-zemari-bereket'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኩሉ ሰብ ይፈልጦ‘ዩ ክርስትያን''ዩ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ''ትምክሕተይ
[ ልበይ ‘ና ኣመነ ግብረይ ከይክሕደካ
ኢየሱስ ብፍቕሪ ሕተሞ ባርያኻ ] (2×)

VERSE 1
ደገይ ጻዕዳ ጌይረ ብውሽጠይ ግን ጸላም
ስመይ ናይ ክርስቶስ ግብረይ ግን ናይ ዓለም
ከም ልቚሉቚ መቃብር በድኒ ተሸኪመ
ብሙስሉይ መንገዲ ክንደይ ድየ ሳጒመ

CHORUS
ኩሉ ሰብ ይፈልጦ‘ዩ ክርስትያን''ዩ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ''ትምክሕተይ
[ ልበይ ‘ና ኣመነ ግብረይ ከይክሕደካ
ኢየሱስ ብፍቕሪ ሕተሞ ባርያኻ ] (2×)

VERSE 2
ውሻጠ ውሻጠይ ንስኻ''ኻ ትፈልጦ
ሓደራኻ ጎይታይ ሂወተይ ለውጦ
ይኣክል ሎሚ''ሲ በቃ ይእከለኒ
ዘይንሰይ ምምሳለይ ጾሩ ከቢዱኒ

CHORUS
ኩሉ ሰብ ይፈልጦ‘ዩ ክርስትያን''ዩ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ''ትምክሕተይ
[ ልበይ ‘ና ኣመነ ግብረይ ከይክሕደካ
ኢየሱስ ብፍቕሪ ሕተሞ ባርያኻ ] (2×)

VERSE 3
ብሓቀኛ መንነት ኣነ ከኽብረካ
ብስጋ ብነፍሲ ክግዛእ ንዓኻ
በደለይ ረሲዕካ ይቕረ በለኒ''ኻ‘ሞ
ዘመነይ ኣብ ቤትካ ኮይነ ክዛዝሞ

CHORUS
ኩሉ ሰብ ይፈልጦ‘ዩ ክርስትያን''ዩ ስመይ
ማዕበል ዘስገረኒ ስምካ ዝ''ትምክሕተይ
[ ልበይ ‘ና ኣመነ ግብረይ ከይክሕደካ
ኢየሱስ ብፍቕሪ ሕተሞ ባርያኻ ] (2×)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kulu seb yifelt’o‘yu kirstyan''yu simey
Maebel zesgereni simka z''timkhtey
[ libey ‘na amene gibrey keykhdeka
Iyesus bifቕri hitemo baryaኻ ] (2×)

VERSE 1
Degey ts’aeda geyre biwsht’ey gin ts’elam
Simey nay Kristos gibrey gin nay alem
Kem liቚluቚ meqabr bedni teshekime
Bimusluy mengedi kindey diye sagwime

CHORUS
Kulu seb yifelt’o‘yu kirstyan''yu simey
Maebel zesgereni simka z''timkhtey
[ libey ‘na amene gibrey keykhdeka
Iyesus bifቕri hitemo baryaኻ ] (2×)

VERSE 2
Wishat’e wishat’ey nisኻ''ኻ tifelt’o
Haderaኻ goytay hiwetey lewt’o
Yiakl lomi''si beqa yiekeleni
Zeynsey mimsaley ts’oru kebiduni

CHORUS
Kulu seb yifelt’o‘yu kirstyan''yu simey
Maebel zesgereni simka z''timkhtey
[ libey ‘na amene gibrey keykhdeka
Iyesus bifቕri hitemo baryaኻ ] (2×)

VERSE 3
Bihaqegna mennet ane keኽbreka
Bisga binefsi kigzae niaኻ
Bedeley resieka yiቕre beleni''ኻ‘mo
Zemeney ab betka koyne kizazmo

CHORUS
Kulu seb yifelt’o‘yu kirstyan''yu simey
Maebel zesgereni simka z''timkhtey
[ libey ‘na amene gibrey keykhdeka
Iyesus bifቕri hitemo baryaኻ ] (2×)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'kirisitiyaniyu-simey-new-eritrean-orthodox-tewahdo-mezmur-zemari-bereket', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: KIRISTOS WAAQAKO" Zemarit Fasika Mekonnen (kiristos-waaqako-zemarit-fasika-mekonnen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'Iyesus kiristos mooti jirenya koo
Iyesus kiristos hidda jirenya koo
Iyesusi kiristos abbaa koo
Iyesusi kiristos waaqa koo

VERSE 1
Hidda jirenya koo hoodaa mana kootii
Iyesus kiristos gofta goftolati
Anoo nan farfadha kabajan maqaa isa
Du''e wan na kaasef galatanin farsa

VERSE 2
Nama ta''u isatin dadhaba hin se''ina
Kan du''a ajesse isa abban humna
Humnoni lafarraa warri dhadatani
Wal ajeesan malee du''a hin ajessani.

VERSE 3
Urjii malayaa koo minccii yehudadha
Iyesus goftako anaf abbaf hadha
Rakoo na mo''atee isaan injifadhe
Kunoo nan gammada jirenya argadhe',
      lyrics_transliteration = 'Iyesus kiristos mooti jirenya koo
Iyesus kiristos hidda jirenya koo
Iyesusi kiristos abbaa koo
Iyesusi kiristos waaqa koo

VERSE 1
Hidda jirenya koo hoodaa mana kootii
Iyesus kiristos gofta goftolati
Anoo nan farfadha kabajan maqaa isa
Du''e wan na kaasef galatanin farsa

VERSE 2
Nama ta''u isatin dadhaba hin se''ina
Kan du''a ajesse isa abban humna
Humnoni lafarraa warri dhadatani
Wal ajeesan malee du''a hin ajessani.

VERSE 3
Urjii malayaa koo minccii yehudadha
Iyesus goftako anaf abbaf hadha
Rakoo na mo''atee isaan injifadhe
Kunoo nan gammada jirenya argadhe',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kiristos-waaqako-zemarit-fasika-mekonnen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Iyesus kiristos mooti jirenya koo
Iyesus kiristos hidda jirenya koo
Iyesusi kiristos abbaa koo
Iyesusi kiristos waaqa koo

VERSE 1
Hidda jirenya koo hoodaa mana kootii
Iyesus kiristos gofta goftolati
Anoo nan farfadha kabajan maqaa isa
Du''e wan na kaasef galatanin farsa

CHORUS
Iyesus kiristos mooti jirenya koo
Iyesus kiristos hidda jirenya koo
Iyesusi kiristos abbaa koo
Iyesusi kiristos waaqa koo

VERSE 2
Nama ta''u isatin dadhaba hin se''ina
Kan du''a ajesse isa abban humna
Humnoni lafarraa warri dhadatani
Wal ajeesan malee du''a hin ajessani.

CHORUS
Iyesus kiristos mooti jirenya koo
Iyesus kiristos hidda jirenya koo
Iyesusi kiristos abbaa koo
Iyesusi kiristos waaqa koo

VERSE 3
Urjii malayaa koo minccii yehudadha
Iyesus goftako anaf abbaf hadha
Rakoo na mo''atee isaan injifadhe
Kunoo nan gammada jirenya argadhe

CHORUS
Iyesus kiristos mooti jirenya koo
Iyesus kiristos hidda jirenya koo
Iyesusi kiristos abbaa koo
Iyesusi kiristos waaqa koo'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Iyesus kiristos mooti jirenya koo
Iyesus kiristos hidda jirenya koo
Iyesusi kiristos abbaa koo
Iyesusi kiristos waaqa koo

VERSE 1
Hidda jirenya koo hoodaa mana kootii
Iyesus kiristos gofta goftolati
Anoo nan farfadha kabajan maqaa isa
Du''e wan na kaasef galatanin farsa

CHORUS
Iyesus kiristos mooti jirenya koo
Iyesus kiristos hidda jirenya koo
Iyesusi kiristos abbaa koo
Iyesusi kiristos waaqa koo

VERSE 2
Nama ta''u isatin dadhaba hin se''ina
Kan du''a ajesse isa abban humna
Humnoni lafarraa warri dhadatani
Wal ajeesan malee du''a hin ajessani.

CHORUS
Iyesus kiristos mooti jirenya koo
Iyesus kiristos hidda jirenya koo
Iyesusi kiristos abbaa koo
Iyesusi kiristos waaqa koo

VERSE 3
Urjii malayaa koo minccii yehudadha
Iyesus goftako anaf abbaf hadha
Rakoo na mo''atee isaan injifadhe
Kunoo nan gammada jirenya argadhe

CHORUS
Iyesus kiristos mooti jirenya koo
Iyesus kiristos hidda jirenya koo
Iyesusi kiristos abbaa koo
Iyesusi kiristos waaqa koo'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'kiristos-waaqako-zemarit-fasika-mekonnen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Kirstos Tensae (kirstos-tensae)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ክርስቶስ ተንስአ እሙታን በዓቢይ ኃይል ወስልጣን
አሰሮ ለሰይጣን አግዓዞ ለአዳም ሰላም ሰላም ሰላም እም ይእዜሰ ይኩን ሰላም

VERSE 1
ክርስቶስ ተነሳ ከሙታን በታላቅ ኃይልና ስልጣን
ሰይጣንን አስሮ ነጻ አወጣው አዳምን ሰላም ሰላም ከእንግዲህ ይሁን ሰላም',
      lyrics_transliteration = 'krstos tense mutan beabiy hayl wesltan
esero leseytan egazo leedam selam selam selam m yzese ykun selam

VERSE 1
krstos tenesa kemutan betalaq haylna sltan
seytann esro netsa ewetaw edamn selam selam kengdih yhun selam',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kirstos-tensae'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ክርስቶስ ተንስአ እሙታን በዓቢይ ኃይል ወስልጣን
አሰሮ ለሰይጣን አግዓዞ ለአዳም ሰላም ሰላም ሰላም እም ይእዜሰ ይኩን ሰላም

VERSE 1
ክርስቶስ ተነሳ ከሙታን በታላቅ ኃይልና ስልጣን
ሰይጣንን አስሮ ነጻ አወጣው አዳምን ሰላም ሰላም ከእንግዲህ ይሁን ሰላም

CHORUS
ክርስቶስ ተንስአ እሙታን በዓቢይ ኃይል ወስልጣን
አሰሮ ለሰይጣን አግዓዞ ለአዳም ሰላም ሰላም ሰላም እም ይእዜሰ ይኩን ሰላም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
krstos tense mutan beabiy hayl wesltan
esero leseytan egazo leedam selam selam selam m yzese ykun selam

VERSE 1
krstos tenesa kemutan betalaq haylna sltan
seytann esro netsa ewetaw edamn selam selam kengdih yhun selam

CHORUS
krstos tense mutan beabiy hayl wesltan
esero leseytan egazo leedam selam selam selam m yzese ykun selam'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'kirstos-tensae', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Kiyamew Yikirna (kiyamew-yikirna)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/

VERSE 1
እስከመቼ ድረስ ህዝብህ ተጎሳቁሎ
በረከሰ መንፈስ በርኩሰት ተጥሎ
ምድር እያለቀሰች ደም እየሸተታት
እባክህ አምላኬ ኢትዮጵያን ታረቃት /ሀገሬን/

VERSE 2
የዘመኑ ጣዖት ገንዘብ እያሳተን
ይህ ደካማ ስጋ አምላክን አስተወን
ግብዝነት ሞልቶት ፈራሹ አካል
በነፍስ በሽታ ህዝባችን ታሟል /2/

VERSE 3
ክንፋችን ተመትቶ መብረር አቅቶናል
በመንፈስ በሽታ ህዝባችን ታውኳል
ራዕይ የሌለው ተራ ሰው ስለሆን
እባክህ ጌታችን በፍትነት ታረቀን /2/

VERSE 4
ጸጋህ የተለየን ባዶነት የሞላን
ፍቅር የተነፈግን ሰላም የጎደለን
ሆነን ስለቀረን እግዚአብሔር ታረቀን
ጽድቅን አድለን ጽድቅ እንደተመኘን /2/',
      lyrics_transliteration = 'Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)

VERSE 1
Eskemeche deres hizbih tegosakelo
Berekkese menfes berkusat tet’lo
Midir eyalekesetch dem eyishetetat
Ebakih Amlake Ethiopia tarekat (hageren)

VERSE 2
Yezemenu ta’ot genzeb eyasaten
Yih dekama siga Amlakn astewen
Gibizinet molt’ot ferashu akal
Benefs beshita hizbachin tamwal (x2)

VERSE 3
Kinfachin temetto mebrer aqt’onal
Bemenfes beshita hizbachin tawkwal
Ra’iy yelelew tera sew silehon
Ebakih getachin befit’net tareken (x2)

VERSE 4
Tsegah yetelayen badonet yemolan
Fiqir yetenefegn selam yegodelen
Honen sileqeren Egziabher tareken
Tsidkin adlen tsidk endetemenyen (x2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kiyamew-yikirna'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/

VERSE 1
እስከመቼ ድረስ ህዝብህ ተጎሳቁሎ
በረከሰ መንፈስ በርኩሰት ተጥሎ
ምድር እያለቀሰች ደም እየሸተታት
እባክህ አምላኬ ኢትዮጵያን ታረቃት /ሀገሬን/

CHORUS
ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/

VERSE 2
የዘመኑ ጣዖት ገንዘብ እያሳተን
ይህ ደካማ ስጋ አምላክን አስተወን
ግብዝነት ሞልቶት ፈራሹ አካል
በነፍስ በሽታ ህዝባችን ታሟል /2/

CHORUS
ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/

VERSE 3
ክንፋችን ተመትቶ መብረር አቅቶናል
በመንፈስ በሽታ ህዝባችን ታውኳል
ራዕይ የሌለው ተራ ሰው ስለሆን
እባክህ ጌታችን በፍትነት ታረቀን /2/

CHORUS
ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/

VERSE 4
ጸጋህ የተለየን ባዶነት የሞላን
ፍቅር የተነፈግን ሰላም የጎደለን
ሆነን ስለቀረን እግዚአብሔር ታረቀን
ጽድቅን አድለን ጽድቅ እንደተመኘን /2/

CHORUS
ቅያሜው ይቅርና አምላክ ሆይ ታረቀን
አንተ ስለራከን ሞት ነው የከበበን /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)

VERSE 1
Eskemeche deres hizbih tegosakelo
Berekkese menfes berkusat tet’lo
Midir eyalekesetch dem eyishetetat
Ebakih Amlake Ethiopia tarekat (hageren)

CHORUS
Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)

VERSE 2
Yezemenu ta’ot genzeb eyasaten
Yih dekama siga Amlakn astewen
Gibizinet molt’ot ferashu akal
Benefs beshita hizbachin tamwal (x2)

CHORUS
Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)

VERSE 3
Kinfachin temetto mebrer aqt’onal
Bemenfes beshita hizbachin tawkwal
Ra’iy yelelew tera sew silehon
Ebakih getachin befit’net tareken (x2)

CHORUS
Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)

VERSE 4
Tsegah yetelayen badonet yemolan
Fiqir yetenefegn selam yegodelen
Honen sileqeren Egziabher tareken
Tsidkin adlen tsidk endetemenyen (x2)

CHORUS
Kiyamew yikirna Amlak hoy tareken
Ante sileraken mot new yekebeben (x2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'kiyamew-yikirna', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: kulu tkeel ika+ (kulu-tkeel-ika)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኩሉ ትኽእል ኢኻ ቀሊል እዩ ንዓኻ
ንጸሎት ናይ ውሽጠይ መልሲ ሃበኒ ኢኻ
ገጽካ ኣይትሕበኣለይ ኣምላኸይ በጃኻ
ደኺሙኒ ሓይለይ ጉልበትይ ረብሪቡ

VERSE 1
ምስኪን ነፍሰይ ድምጽኻ ናፊቁ
በይነይ ኣይክሎን እየ ከቢድ ሚዛን ጾረይ
ተስፋይ ደገፍካዩ ኢየሱስ መድሕነይ (2)
ኣምላኸይ ስምዓዮ ጽን በሎ ቃላተይ

VERSE 2
ንጉሁይ ልበይ ኣህድእ ንመንፈሰይ
ልመናይ ተቐበል ኣቕልበሉ ድምጸይ
ብኽያት ይኣኽለኒ ሓበሶ ንብዓተይ
ሎሚ ውን ይጽውዕ ከይረብረብኩ ስምካ

VERSE 3
ክሳብ ዝምልከታኒ የዒንትኻ
ቆይመ ኣብ ልዳት ቤትካ የብጽሕ ጸሎተይ
ተወኪለካ’የ ልዕሊ ኩነታተይ',
      lyrics_transliteration = 'Kulu tiኽel iኻ qelil eyu niaኻ
Nits’elot nay wisht’ey melsi habeni iኻ
Gets’ka aythbealey amlaኸy bejaኻ
Deኺmuni hayley gulbety rebribu

VERSE 1
Miskin nefsey dimts’ኻ nafiqu
Beyney ayklon eye kebid mizan ts’orey
Tesfay degefkayu Iyesus medhney (2)
Amlaኸy simayo ts’n belo qalatey

VERSE 2
Niguhuy libey ahde nimenfesey
Limenay teቐbel aቕlbelu dimts’ey
Biኽyat yiaኽleni habeso nibatey
Lomi win yits’we keyrebrebku simka

VERSE 3
Kisab zimlketani yeintኻ
Qoyme ab lidat betka yebts’h ts’elotey
Tewekileka’ye lieli kunetatey',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'kulu-tkeel-ika'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኩሉ ትኽእል ኢኻ ቀሊል እዩ ንዓኻ
ንጸሎት ናይ ውሽጠይ መልሲ ሃበኒ ኢኻ
ገጽካ ኣይትሕበኣለይ ኣምላኸይ በጃኻ
ደኺሙኒ ሓይለይ ጉልበትይ ረብሪቡ

VERSE 1
ምስኪን ነፍሰይ ድምጽኻ ናፊቁ
በይነይ ኣይክሎን እየ ከቢድ ሚዛን ጾረይ
ተስፋይ ደገፍካዩ ኢየሱስ መድሕነይ (2)
ኣምላኸይ ስምዓዮ ጽን በሎ ቃላተይ

CHORUS
ኩሉ ትኽእል ኢኻ ቀሊል እዩ ንዓኻ
ንጸሎት ናይ ውሽጠይ መልሲ ሃበኒ ኢኻ
ገጽካ ኣይትሕበኣለይ ኣምላኸይ በጃኻ
ደኺሙኒ ሓይለይ ጉልበትይ ረብሪቡ

VERSE 2
ንጉሁይ ልበይ ኣህድእ ንመንፈሰይ
ልመናይ ተቐበል ኣቕልበሉ ድምጸይ
ብኽያት ይኣኽለኒ ሓበሶ ንብዓተይ
ሎሚ ውን ይጽውዕ ከይረብረብኩ ስምካ

CHORUS
ኩሉ ትኽእል ኢኻ ቀሊል እዩ ንዓኻ
ንጸሎት ናይ ውሽጠይ መልሲ ሃበኒ ኢኻ
ገጽካ ኣይትሕበኣለይ ኣምላኸይ በጃኻ
ደኺሙኒ ሓይለይ ጉልበትይ ረብሪቡ

VERSE 3
ክሳብ ዝምልከታኒ የዒንትኻ
ቆይመ ኣብ ልዳት ቤትካ የብጽሕ ጸሎተይ
ተወኪለካ’የ ልዕሊ ኩነታተይ

CHORUS
ኩሉ ትኽእል ኢኻ ቀሊል እዩ ንዓኻ
ንጸሎት ናይ ውሽጠይ መልሲ ሃበኒ ኢኻ
ገጽካ ኣይትሕበኣለይ ኣምላኸይ በጃኻ
ደኺሙኒ ሓይለይ ጉልበትይ ረብሪቡ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kulu tiኽel iኻ qelil eyu niaኻ
Nits’elot nay wisht’ey melsi habeni iኻ
Gets’ka aythbealey amlaኸy bejaኻ
Deኺmuni hayley gulbety rebribu

VERSE 1
Miskin nefsey dimts’ኻ nafiqu
Beyney ayklon eye kebid mizan ts’orey
Tesfay degefkayu Iyesus medhney (2)
Amlaኸy simayo ts’n belo qalatey

CHORUS
Kulu tiኽel iኻ qelil eyu niaኻ
Nits’elot nay wisht’ey melsi habeni iኻ
Gets’ka aythbealey amlaኸy bejaኻ
Deኺmuni hayley gulbety rebribu

VERSE 2
Niguhuy libey ahde nimenfesey
Limenay teቐbel aቕlbelu dimts’ey
Biኽyat yiaኽleni habeso nibatey
Lomi win yits’we keyrebrebku simka

CHORUS
Kulu tiኽel iኻ qelil eyu niaኻ
Nits’elot nay wisht’ey melsi habeni iኻ
Gets’ka aythbealey amlaኸy bejaኻ
Deኺmuni hayley gulbety rebribu

VERSE 3
Kisab zimlketani yeintኻ
Qoyme ab lidat betka yebts’h ts’elotey
Tewekileka’ye lieli kunetatey

CHORUS
Kulu tiኽel iኻ qelil eyu niaኻ
Nits’elot nay wisht’ey melsi habeni iኻ
Gets’ka aythbealey amlaኸy bejaኻ
Deኺmuni hayley gulbety rebribu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'kulu-tkeel-ika', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Lamesiginih Yeene Geta (lamesiginih-yeene-geta)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 1
ከእኔ የሆነ የምሰጥህ ባይኖረኝም
ከሰጠኸኝ ያንተን መስጠት አይከብደኝም
ጥበቤ ነህ የምስጋና መሠረቴ
ዝማሬዬን ያፈሰስከው በሕይወቴ

VERSE 2
አንደበቴን የቃኘኸው ለምስጋና
ይኸው ውሰድ ቅኝትህን እንደገና/2/
ባዶ እኮ ነኝ የእኔ ጌታ ምን ልቅዳልህ
በእጄ ላይ አንዳች የለኝ የምሰጥህ

VERSE 3
ላንተ ክብር የሚመጥን ሕይወት የለኝ
ዝማሬዬን በቸርነት ተቀበለኝ
አንደበቴን የቃኘኸው ለምስጋና
ይኸው ውሰድ ቅኝትህን እንደገና/2/

VERSE 4
ከምድር ላይ ከአፈርህ ስትፈጥረኝ
ከምስጋና የተለየ ምን ሥራ አለኝ
ቀንና ሌት በመቅደስህ እቆማለሁ
አምላኬ ሆይ ሳወድስህ እኖራለሁ

VERSE 5
አንደበቴን የቃኘኸው ለምስጋና
ይኸው ውሰድ ቅኝትህን እንደገና/2/
እዝራ ስጠኝ የከበረ መሰንቆህን
ዳዊት ስጠኝ የሚፈውስ በገናህን

VERSE 6
መዝሙር ቅኔ ተምሬአለሁ ከአባቶቼ
ዘምራለሁ ባንተ ፍቅር ተነክቼ
አንደበቴን የቃኘኸው ለምስጋና
ይኸው ውሰድ ቅኝትህን እንደገና/2/',
      lyrics_transliteration = 'Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)

VERSE 1
Keene yehone yemset’h baynoregnm
Keset’eኸgn yanten mest’et aykebdegnm
T’bebe neh yemsgana meserete
Zimareyen yafeseskew behywete

VERSE 2
Andebeten yeqagneኸw lemsgana
Yiኸw wised qignthn endegena (2)
Bado eko negn yeene Geta min liqdalh
Beeje lay andach yelegn yemset’h

VERSE 3
Lante kibir yemimet’n hiywet yelegn
Zimareyen bechernet teqebelegn
Andebeten yeqagneኸw lemsgana
Yiኸw wised qignthn endegena (2)

VERSE 4
Kemdr lay keaferh sitfet’regn
Kemsgana yeteleye min sira alegn
Qenna let bemeqdesh eqomalehu
Amlake hoy sawedsh enoralehu

VERSE 5
Andebeten yeqagneኸw lemsgana
Yiኸw wised qignthn endegena (2)
Ezra sit’egn yekebere mesenqohn
Dawit sit’egn yemifews begenahn

VERSE 6
Mezmur qine temrealehu keabatoche
Zemralehu bante fiqr tenekche
Andebeten yeqagneኸw lemsgana
Yiኸw wised qignthn endegena (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'lamesiginih-yeene-geta'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 1
ከእኔ የሆነ የምሰጥህ ባይኖረኝም
ከሰጠኸኝ ያንተን መስጠት አይከብደኝም
ጥበቤ ነህ የምስጋና መሠረቴ
ዝማሬዬን ያፈሰስከው በሕይወቴ

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 2
አንደበቴን የቃኘኸው ለምስጋና
ይኸው ውሰድ ቅኝትህን እንደገና/2/
ባዶ እኮ ነኝ የእኔ ጌታ ምን ልቅዳልህ
በእጄ ላይ አንዳች የለኝ የምሰጥህ

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 3
ላንተ ክብር የሚመጥን ሕይወት የለኝ
ዝማሬዬን በቸርነት ተቀበለኝ
አንደበቴን የቃኘኸው ለምስጋና
ይኸው ውሰድ ቅኝትህን እንደገና/2/

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 4
ከምድር ላይ ከአፈርህ ስትፈጥረኝ
ከምስጋና የተለየ ምን ሥራ አለኝ
ቀንና ሌት በመቅደስህ እቆማለሁ
አምላኬ ሆይ ሳወድስህ እኖራለሁ

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 5
አንደበቴን የቃኘኸው ለምስጋና
ይኸው ውሰድ ቅኝትህን እንደገና/2/
እዝራ ስጠኝ የከበረ መሰንቆህን
ዳዊት ስጠኝ የሚፈውስ በገናህን

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/

VERSE 6
መዝሙር ቅኔ ተምሬአለሁ ከአባቶቼ
ዘምራለሁ ባንተ ፍቅር ተነክቼ
አንደበቴን የቃኘኸው ለምስጋና
ይኸው ውሰድ ቅኝትህን እንደገና/2/

CHORUS
ላመስግንህ የእኔ ጌታ ላመስግንህ
ልቀኝልህ የእኔ ጌታ ልቀኝልህ
ሕይወቴ ነው ዝማሬዬ ትሩፋቴ
የሰጠኸኝ እንዳከብርህ አንተ አባቴ/2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)

VERSE 1
Keene yehone yemset’h baynoregnm
Keset’eኸgn yanten mest’et aykebdegnm
T’bebe neh yemsgana meserete
Zimareyen yafeseskew behywete

CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)

VERSE 2
Andebeten yeqagneኸw lemsgana
Yiኸw wised qignthn endegena (2)
Bado eko negn yeene Geta min liqdalh
Beeje lay andach yelegn yemset’h

CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)

VERSE 3
Lante kibir yemimet’n hiywet yelegn
Zimareyen bechernet teqebelegn
Andebeten yeqagneኸw lemsgana
Yiኸw wised qignthn endegena (2)

CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)

VERSE 4
Kemdr lay keaferh sitfet’regn
Kemsgana yeteleye min sira alegn
Qenna let bemeqdesh eqomalehu
Amlake hoy sawedsh enoralehu

CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)

VERSE 5
Andebeten yeqagneኸw lemsgana
Yiኸw wised qignthn endegena (2)
Ezra sit’egn yekebere mesenqohn
Dawit sit’egn yemifews begenahn

CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)

VERSE 6
Mezmur qine temrealehu keabatoche
Zemralehu bante fiqr tenekche
Andebeten yeqagneኸw lemsgana
Yiኸw wised qignthn endegena (2)

CHORUS
Lamesgnh yeene Geta lamesgnh
Liqegnlh yeene Geta liqegnlh
Hiywete new zimareye tirufate
Yeset’eኸgn endakebrh ante abate (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'lamesiginih-yeene-geta', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Latitewegn zemari yeabkal desalegn (latitewegn-zemari-yeabkal-desalegn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ላትተወኝ እስከ ሞት ላፈቀርከኝ
ላትሸሸኝ እንዲሁ ለወደድከኝ
ብዙ ክብር ውዳሴ ምስጋና አለኝ
ብዙ ቅኔ ውዳሴ ምስጋና አለኝ

VERSE 1
ለሌላ እንዳልሆን ቀድሞም ለክብር ያዘጋጀኸኝ
አንጠረኛዬ አንተ ሰሪዬ እኔ ሸክላህ ነኝ
ለምን አልልም አንተ ያልከው ነው የሆነው በእኔ
ቢሆንም ባይሆን ነፍሴ ታምልክህ ባማረ ቅኔ

VERSE 2
በልቤ መካን ማንም ላይወስደው ስምህ ታትሟል
ከእጅህ ላልፋቅ የዘለዓለም ቃል ኪዳን ቆሟል
ከግንዱ ጋር ተጣብቄያለሁ ማነው ሚነቅለኝ
ቅርንጫፉ የሆንኩ ህያው ነኝና አብ የተከለኝ

VERSE 3
የእርሱን ማፈራ ለእርሱ የሆንኩኝ የለመለምኩኝ
ማልጠወልግ ነኝ በጌታ ያለሁ የተማረኩኝ
ከእኔ ባልሆነ ከወይን ግንዱ ህይወት በዝቶልኝ
ገና በሰማይ ከቅዱሳን ጋር ዘምራለሁኝ

VERSE 4
ከጥልቁ መንደር በድምፅህ ፉጨት የጠራኸኝ
በደም መርቀህ የምወርሰውን ያሳየኸኝ
ሊቀ ካህኔ የነፍሴ መድህን የህይወቴ ቤዛ
ኪዳን ገባሁኝ ለዘለዓለም ላንተ ልገዛ',
      lyrics_transliteration = 'Lattewegn eske mot lafeqerkegn
Latsheshegn endihu lewededkegn
Bizu kibir widase misgana alegn
Bizu qine widase misgana alegn

VERSE 1
Lelela endalhon qedmom lekbr yazegajeኸgn
Ant’eregnaye ante seriye ene sheklah negn
Lemn allm ante yalkew new yehonew beene
Bihonm bayhon nefse tamlkh bamare qine

VERSE 2
Belbe mekan manm laywesdew simh tatmwal
Keejh lalfaq yezelealem qal kidan qomwal
Kegndu gar tet’abqeyalehu manew mineqlegn
Qirnch’afu yehonku hiyaw negnna Ab yetekelegn

VERSE 3
Yeersun mafera leersu yehonkugn yelemelemkugn
Malt’ewelg negn begeta yalehu yetemarekugn
Keene balhone keweyn gindu hiywet beztolgn
Gena besemay keqdusan gar zemralehugn

VERSE 4
Ket’lqu mender bedmts’h fuch’et yet’eraኸgn
Bedem merqeh yemwersewn yasayeኸgn
Liqe kahne yenefse medhn yehywete beza
Kidan gebahugn lezelealem lante ligeza',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'latitewegn-zemari-yeabkal-desalegn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ላትተወኝ እስከ ሞት ላፈቀርከኝ
ላትሸሸኝ እንዲሁ ለወደድከኝ
ብዙ ክብር ውዳሴ ምስጋና አለኝ
ብዙ ቅኔ ውዳሴ ምስጋና አለኝ

VERSE 1
ለሌላ እንዳልሆን ቀድሞም ለክብር ያዘጋጀኸኝ
አንጠረኛዬ አንተ ሰሪዬ እኔ ሸክላህ ነኝ
ለምን አልልም አንተ ያልከው ነው የሆነው በእኔ
ቢሆንም ባይሆን ነፍሴ ታምልክህ ባማረ ቅኔ

CHORUS
ላትተወኝ እስከ ሞት ላፈቀርከኝ
ላትሸሸኝ እንዲሁ ለወደድከኝ
ብዙ ክብር ውዳሴ ምስጋና አለኝ
ብዙ ቅኔ ውዳሴ ምስጋና አለኝ

VERSE 2
በልቤ መካን ማንም ላይወስደው ስምህ ታትሟል
ከእጅህ ላልፋቅ የዘለዓለም ቃል ኪዳን ቆሟል
ከግንዱ ጋር ተጣብቄያለሁ ማነው ሚነቅለኝ
ቅርንጫፉ የሆንኩ ህያው ነኝና አብ የተከለኝ

CHORUS
ላትተወኝ እስከ ሞት ላፈቀርከኝ
ላትሸሸኝ እንዲሁ ለወደድከኝ
ብዙ ክብር ውዳሴ ምስጋና አለኝ
ብዙ ቅኔ ውዳሴ ምስጋና አለኝ

VERSE 3
የእርሱን ማፈራ ለእርሱ የሆንኩኝ የለመለምኩኝ
ማልጠወልግ ነኝ በጌታ ያለሁ የተማረኩኝ
ከእኔ ባልሆነ ከወይን ግንዱ ህይወት በዝቶልኝ
ገና በሰማይ ከቅዱሳን ጋር ዘምራለሁኝ

CHORUS
ላትተወኝ እስከ ሞት ላፈቀርከኝ
ላትሸሸኝ እንዲሁ ለወደድከኝ
ብዙ ክብር ውዳሴ ምስጋና አለኝ
ብዙ ቅኔ ውዳሴ ምስጋና አለኝ

VERSE 4
ከጥልቁ መንደር በድምፅህ ፉጨት የጠራኸኝ
በደም መርቀህ የምወርሰውን ያሳየኸኝ
ሊቀ ካህኔ የነፍሴ መድህን የህይወቴ ቤዛ
ኪዳን ገባሁኝ ለዘለዓለም ላንተ ልገዛ

CHORUS
ላትተወኝ እስከ ሞት ላፈቀርከኝ
ላትሸሸኝ እንዲሁ ለወደድከኝ
ብዙ ክብር ውዳሴ ምስጋና አለኝ
ብዙ ቅኔ ውዳሴ ምስጋና አለኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lattewegn eske mot lafeqerkegn
Latsheshegn endihu lewededkegn
Bizu kibir widase misgana alegn
Bizu qine widase misgana alegn

VERSE 1
Lelela endalhon qedmom lekbr yazegajeኸgn
Ant’eregnaye ante seriye ene sheklah negn
Lemn allm ante yalkew new yehonew beene
Bihonm bayhon nefse tamlkh bamare qine

CHORUS
Lattewegn eske mot lafeqerkegn
Latsheshegn endihu lewededkegn
Bizu kibir widase misgana alegn
Bizu qine widase misgana alegn

VERSE 2
Belbe mekan manm laywesdew simh tatmwal
Keejh lalfaq yezelealem qal kidan qomwal
Kegndu gar tet’abqeyalehu manew mineqlegn
Qirnch’afu yehonku hiyaw negnna Ab yetekelegn

CHORUS
Lattewegn eske mot lafeqerkegn
Latsheshegn endihu lewededkegn
Bizu kibir widase misgana alegn
Bizu qine widase misgana alegn

VERSE 3
Yeersun mafera leersu yehonkugn yelemelemkugn
Malt’ewelg negn begeta yalehu yetemarekugn
Keene balhone keweyn gindu hiywet beztolgn
Gena besemay keqdusan gar zemralehugn

CHORUS
Lattewegn eske mot lafeqerkegn
Latsheshegn endihu lewededkegn
Bizu kibir widase misgana alegn
Bizu qine widase misgana alegn

VERSE 4
Ket’lqu mender bedmts’h fuch’et yet’eraኸgn
Bedem merqeh yemwersewn yasayeኸgn
Liqe kahne yenefse medhn yehywete beza
Kidan gebahugn lezelealem lante ligeza

CHORUS
Lattewegn eske mot lafeqerkegn
Latsheshegn endihu lewededkegn
Bizu kibir widase misgana alegn
Bizu qine widase misgana alegn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'latitewegn-zemari-yeabkal-desalegn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Layiredagn Lesew (layiredagn-lesew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ላይረዳኝ የልቤን ላያነበዉ
እንዲህ ሆንኩኝ ብየ አልልም ለሰዉ
ላንች ይበቃል ማርያም
ላንች ይበቃል የሆንኩቱን መናገሩ

VERSE 1
ምን ይጠቅማል ለሠዉ መዘርዘሩ (2)
ፈተናዬ የሕይወት ስንኩል በአይዞሽ ቃል
የልብ እሳት እንደ ቀላል መቸ ይበረዳል
ዝም ልበል ሁሉን ላምቅ ከማወራ

VERSE 2
ቀን ከመሽ ጥላም አይኖረ ከራስ ጋራ
ለጽናና እንጂ ስላለሽኝ መጽናኛዬ
ታዉቂዉ የለ ምን ልንገረሽ ይኼን ብየ
ልጽናና እንጂ ስላለሽኝ መጽናኛዬ

VERSE 3
ታዉቂዉ የለ ምን ልንገረሽ መጽናኛዬ
በስንት ህመም ልቤ ታሞ አፌ ይዋሻል
ፌቴ ደምቆ ያልተጎደዉ ለሠዉ ይመስላል
አማላጄ ታዉቂዋለሽ የልቤን

VERSE 4
ስንቱን እሳት እንደቻልኩኝ ብቻዬን
ልጽናና እንጂ ስላለሽኝ መጽናኛዬ
ታዉቂዉ የለ ምን ልንገረሽ ይኼን ብዬ(2)
ለተሻለ ለታላቅ ክብር ሲያዘጋጀኝ

VERSE 5
ልጅሽ ስንቱን በህይወቴ አስተማረኝ
ዉኃ እንዳጣ መሬት ልቤ ሲሰነጠቅ
ማን ነበር ካንቺ በቀር ይኼን የሚያዉቅ
ልጽናና እንጂ ስላለሽኝ መጽናኛዬ

VERSE 6
ታዉቂዉ የለ ምን ልንገረሽ ላንች እምዬ(2)
ልቤ ደምቶ በሀዘን ብዛት ተሰብሬ
ትርጉም የለሽ ሲሆንብኝ ለመኖሬ
ባትኖሪ መሸሸጊየ መጽናኛዬ

VERSE 7
እንዴት ላልፈዉ ያን ክፉ ቀን ለብቻዬ
ልጽናና እንጂ ስላለሽኝ መጽናኛዬ ታዉቂዉ የለ ምን ልንገረሽ ይኼን ብዬ (2)
የተሰጠሽ ልዩ ኪዳን ያሳርፍል
አንችን ይዞ የትኛዉ ቤት ደስታ ያጣል

VERSE 8
የማዋይሽ አንድ ብዬ የልቤን
አይቼዉ ነዉ ቀምሼዉ ነዉ ምልጃሽን
ልጽናና እንጂ ስላለሽኝ መጽናኛዬ
ታዉቂዉ የለ ምን ልንገረሽ ላንቺ እምዬ',
      lyrics_transliteration = 'Layredagn yelben layanebewu
Endih honkugn biye allm lesewu
Lanch yibeqal Maryam
Lanch yibeqal yehonkutun menageru

VERSE 1
Min yit’eqmal lesewu mezerzeru (2)
Fetenaye yehywet sinkul beayzosh qal
Yelb esat ende qelal meche yiberedal
Zim libel hulun lamq kemawera

VERSE 2
Qen kemesh t’lam aynore keras gara
Lets’nana enji silaleshgn mets’nagnaye
Tawuqiwu yele min lingeresh yiኼn biye
Lits’nana enji silaleshgn mets’nagnaye

VERSE 3
Tawuqiwu yele min lingeresh mets’nagnaye
Besnt himem libe tamo afe yiwashal
Fete demqo yaltegodewu lesewu yimeslal
Amalaje tawuqiwalesh yelben

VERSE 4
Sintun esat endechalkugn bichayen
Lits’nana enji silaleshgn mets’nagnaye
Tawuqiwu yele min lingeresh yiኼn biye (2)
Leteshale letalaq kibir siyazegajegn

VERSE 5
Lijsh sintun behywete astemaregn
Wuha endat’a meret libe sisenet’eq
Man neber kanchi beqer yiኼn yemiyawuq
Lits’nana enji silaleshgn mets’nagnaye

VERSE 6
Tawuqiwu yele min lingeresh lanch emye (2)
Libe demto behezen bizat tesebre
Tirgum yelesh sihonbgn lemenore
Batnori mesheshegiye mets’nagnaye

VERSE 7
Endet lalfewu yan kifu qen lebchaye
Lits’nana enji silaleshgn mets’nagnaye tawuqiwu yele min lingeresh yiኼn biye (2)
Yeteset’esh liyu kidan yasarfl
Anchn yizo yetgnawu bet desta yat’al

VERSE 8
Yemawaysh and biye yelben
Aychewu newu qemshewu newu miljashn
Lits’nana enji silaleshgn mets’nagnaye
Tawuqiwu yele min lingeresh lanchi emye',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'layiredagn-lesew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ላይረዳኝ የልቤን ላያነበዉ
እንዲህ ሆንኩኝ ብየ አልልም ለሰዉ
ላንች ይበቃል ማርያም
ላንች ይበቃል የሆንኩቱን መናገሩ

VERSE 1
ምን ይጠቅማል ለሠዉ መዘርዘሩ (2)
ፈተናዬ የሕይወት ስንኩል በአይዞሽ ቃል
የልብ እሳት እንደ ቀላል መቸ ይበረዳል
ዝም ልበል ሁሉን ላምቅ ከማወራ

CHORUS
ላይረዳኝ የልቤን ላያነበዉ
እንዲህ ሆንኩኝ ብየ አልልም ለሰዉ
ላንች ይበቃል ማርያም
ላንች ይበቃል የሆንኩቱን መናገሩ

VERSE 2
ቀን ከመሽ ጥላም አይኖረ ከራስ ጋራ
ለጽናና እንጂ ስላለሽኝ መጽናኛዬ
ታዉቂዉ የለ ምን ልንገረሽ ይኼን ብየ
ልጽናና እንጂ ስላለሽኝ መጽናኛዬ

CHORUS
ላይረዳኝ የልቤን ላያነበዉ
እንዲህ ሆንኩኝ ብየ አልልም ለሰዉ
ላንች ይበቃል ማርያም
ላንች ይበቃል የሆንኩቱን መናገሩ

VERSE 3
ታዉቂዉ የለ ምን ልንገረሽ መጽናኛዬ
በስንት ህመም ልቤ ታሞ አፌ ይዋሻል
ፌቴ ደምቆ ያልተጎደዉ ለሠዉ ይመስላል
አማላጄ ታዉቂዋለሽ የልቤን

CHORUS
ላይረዳኝ የልቤን ላያነበዉ
እንዲህ ሆንኩኝ ብየ አልልም ለሰዉ
ላንች ይበቃል ማርያም
ላንች ይበቃል የሆንኩቱን መናገሩ

VERSE 4
ስንቱን እሳት እንደቻልኩኝ ብቻዬን
ልጽናና እንጂ ስላለሽኝ መጽናኛዬ
ታዉቂዉ የለ ምን ልንገረሽ ይኼን ብዬ(2)
ለተሻለ ለታላቅ ክብር ሲያዘጋጀኝ

CHORUS
ላይረዳኝ የልቤን ላያነበዉ
እንዲህ ሆንኩኝ ብየ አልልም ለሰዉ
ላንች ይበቃል ማርያም
ላንች ይበቃል የሆንኩቱን መናገሩ

VERSE 5
ልጅሽ ስንቱን በህይወቴ አስተማረኝ
ዉኃ እንዳጣ መሬት ልቤ ሲሰነጠቅ
ማን ነበር ካንቺ በቀር ይኼን የሚያዉቅ
ልጽናና እንጂ ስላለሽኝ መጽናኛዬ

CHORUS
ላይረዳኝ የልቤን ላያነበዉ
እንዲህ ሆንኩኝ ብየ አልልም ለሰዉ
ላንች ይበቃል ማርያም
ላንች ይበቃል የሆንኩቱን መናገሩ

VERSE 6
ታዉቂዉ የለ ምን ልንገረሽ ላንች እምዬ(2)
ልቤ ደምቶ በሀዘን ብዛት ተሰብሬ
ትርጉም የለሽ ሲሆንብኝ ለመኖሬ
ባትኖሪ መሸሸጊየ መጽናኛዬ

CHORUS
ላይረዳኝ የልቤን ላያነበዉ
እንዲህ ሆንኩኝ ብየ አልልም ለሰዉ
ላንች ይበቃል ማርያም
ላንች ይበቃል የሆንኩቱን መናገሩ

VERSE 7
እንዴት ላልፈዉ ያን ክፉ ቀን ለብቻዬ
ልጽናና እንጂ ስላለሽኝ መጽናኛዬ ታዉቂዉ የለ ምን ልንገረሽ ይኼን ብዬ (2)
የተሰጠሽ ልዩ ኪዳን ያሳርፍል
አንችን ይዞ የትኛዉ ቤት ደስታ ያጣል

CHORUS
ላይረዳኝ የልቤን ላያነበዉ
እንዲህ ሆንኩኝ ብየ አልልም ለሰዉ
ላንች ይበቃል ማርያም
ላንች ይበቃል የሆንኩቱን መናገሩ

VERSE 8
የማዋይሽ አንድ ብዬ የልቤን
አይቼዉ ነዉ ቀምሼዉ ነዉ ምልጃሽን
ልጽናና እንጂ ስላለሽኝ መጽናኛዬ
ታዉቂዉ የለ ምን ልንገረሽ ላንቺ እምዬ

CHORUS
ላይረዳኝ የልቤን ላያነበዉ
እንዲህ ሆንኩኝ ብየ አልልም ለሰዉ
ላንች ይበቃል ማርያም
ላንች ይበቃል የሆንኩቱን መናገሩ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Layredagn yelben layanebewu
Endih honkugn biye allm lesewu
Lanch yibeqal Maryam
Lanch yibeqal yehonkutun menageru

VERSE 1
Min yit’eqmal lesewu mezerzeru (2)
Fetenaye yehywet sinkul beayzosh qal
Yelb esat ende qelal meche yiberedal
Zim libel hulun lamq kemawera

CHORUS
Layredagn yelben layanebewu
Endih honkugn biye allm lesewu
Lanch yibeqal Maryam
Lanch yibeqal yehonkutun menageru

VERSE 2
Qen kemesh t’lam aynore keras gara
Lets’nana enji silaleshgn mets’nagnaye
Tawuqiwu yele min lingeresh yiኼn biye
Lits’nana enji silaleshgn mets’nagnaye

CHORUS
Layredagn yelben layanebewu
Endih honkugn biye allm lesewu
Lanch yibeqal Maryam
Lanch yibeqal yehonkutun menageru

VERSE 3
Tawuqiwu yele min lingeresh mets’nagnaye
Besnt himem libe tamo afe yiwashal
Fete demqo yaltegodewu lesewu yimeslal
Amalaje tawuqiwalesh yelben

CHORUS
Layredagn yelben layanebewu
Endih honkugn biye allm lesewu
Lanch yibeqal Maryam
Lanch yibeqal yehonkutun menageru

VERSE 4
Sintun esat endechalkugn bichayen
Lits’nana enji silaleshgn mets’nagnaye
Tawuqiwu yele min lingeresh yiኼn biye (2)
Leteshale letalaq kibir siyazegajegn

CHORUS
Layredagn yelben layanebewu
Endih honkugn biye allm lesewu
Lanch yibeqal Maryam
Lanch yibeqal yehonkutun menageru

VERSE 5
Lijsh sintun behywete astemaregn
Wuha endat’a meret libe sisenet’eq
Man neber kanchi beqer yiኼn yemiyawuq
Lits’nana enji silaleshgn mets’nagnaye

CHORUS
Layredagn yelben layanebewu
Endih honkugn biye allm lesewu
Lanch yibeqal Maryam
Lanch yibeqal yehonkutun menageru

VERSE 6
Tawuqiwu yele min lingeresh lanch emye (2)
Libe demto behezen bizat tesebre
Tirgum yelesh sihonbgn lemenore
Batnori mesheshegiye mets’nagnaye

CHORUS
Layredagn yelben layanebewu
Endih honkugn biye allm lesewu
Lanch yibeqal Maryam
Lanch yibeqal yehonkutun menageru

VERSE 7
Endet lalfewu yan kifu qen lebchaye
Lits’nana enji silaleshgn mets’nagnaye tawuqiwu yele min lingeresh yiኼn biye (2)
Yeteset’esh liyu kidan yasarfl
Anchn yizo yetgnawu bet desta yat’al

CHORUS
Layredagn yelben layanebewu
Endih honkugn biye allm lesewu
Lanch yibeqal Maryam
Lanch yibeqal yehonkutun menageru

VERSE 8
Yemawaysh and biye yelben
Aychewu newu qemshewu newu miljashn
Lits’nana enji silaleshgn mets’nagnaye
Tawuqiwu yele min lingeresh lanchi emye

CHORUS
Layredagn yelben layanebewu
Endih honkugn biye allm lesewu
Lanch yibeqal Maryam
Lanch yibeqal yehonkutun menageru'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'layiredagn-lesew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Lbena shtuyen Zemarit Betselot Asmare (lbena-shtuyen-zemarit-betselot-asmare)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 1
ያቺ ክፉ ኃጢያት የኖረች ስሰራት
እራሴን እንዳላውቅ ይዛኝ በእስራት
መልኬን እያሳየሁ ኃጢያትን ሳከማች
እንቅፋት ሆኛለሁ ለብዙ ነፍሳቶች

VERSE 2
የሽቱው ዕቃና ልቤንም ከፍቼ
ይኸው አለቅሳለሁ ፊትህ ተደፍቼ
የፈረስኩበትን በአንተ እንድገነባ
ሽቱው ለፍቅርህ ነው ለንስሓ እንባ ።

VERSE 3
እየሳሳህልኝ አይኔንም እያየህ
ልጄ ሆይ ተነሺ በፍቅር እያልክ
እያዘንኩ መጥቼ መለስከኝ በደስታ
ሳትፈርድብኝ ማርከኝ ነፍሴ መንገድ ስታ ።

VERSE 4
ሕይወትን ሊሰጠን እውነት መጥቶልናል
አይጸየፈንም በእቅፉ ያቅፈናል
ምን ስትሰሩ ነበር ብሎ የማይካሰስ
በሰላም ግቡ ነው ቃሉ የሚፈውስ ።

VERSE 5
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተወጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።',
      lyrics_transliteration = 'Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yete��ga
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.

VERSE 1
Yachi kifu hat’iyat yenorech siserat
Erasen endalawq yizagn beesrat
Melken eyasayehu hat’iyatn sakemach
Enqfat hognalehu lebzu nefsatoch

VERSE 2
Yeshtuw eqana libenm kefche
Yiኸw aleqsalehu fith tedefche
Yefereskubetn beante endgeneba
Shtuw lefqrh new lensha enba .

VERSE 3
Eyesasahlgn aynenm eyayeh
Lije hoy teneshi befqr eyalk
Eyazenku met’che meleskegn bedesta
Satferdbgn markegn nefse menged sita .

VERSE 4
Hiywetn liset’en ewnet met’tolnal
Ayts’eyefenm beeqfu yaqfenal
Min sitseru neber bilo yemaykases
Beselam gibu new qalu yemifews .

VERSE 5
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yetewega
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'lbena-shtuyen-zemarit-betselot-asmare'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 1
ያቺ ክፉ ኃጢያት የኖረች ስሰራት
እራሴን እንዳላውቅ ይዛኝ በእስራት
መልኬን እያሳየሁ ኃጢያትን ሳከማች
እንቅፋት ሆኛለሁ ለብዙ ነፍሳቶች

CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 2
የሽቱው ዕቃና ልቤንም ከፍቼ
ይኸው አለቅሳለሁ ፊትህ ተደፍቼ
የፈረስኩበትን በአንተ እንድገነባ
ሽቱው ለፍቅርህ ነው ለንስሓ እንባ ።

CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 3
እየሳሳህልኝ አይኔንም እያየህ
ልጄ ሆይ ተነሺ በፍቅር እያልክ
እያዘንኩ መጥቼ መለስከኝ በደስታ
ሳትፈርድብኝ ማርከኝ ነፍሴ መንገድ ስታ ።

CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 4
ሕይወትን ሊሰጠን እውነት መጥቶልናል
አይጸየፈንም በእቅፉ ያቅፈናል
ምን ስትሰሩ ነበር ብሎ የማይካሰስ
በሰላም ግቡ ነው ቃሉ የሚፈውስ ።

CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

VERSE 5
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተወጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።

CHORUS
በጥፋት ቁልፍ ከርሞ የተዘጋ
በጠላት ፈላጻ እጅግ የተ��ጋ
ሲባክን የኖረ ልቤን ፈውስልኝ
ማረኝ ብዬ መጣሁ ጌታ ተቀበለኝ።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yete��ga
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.

VERSE 1
Yachi kifu hat’iyat yenorech siserat
Erasen endalawq yizagn beesrat
Melken eyasayehu hat’iyatn sakemach
Enqfat hognalehu lebzu nefsatoch

CHORUS
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yete��ga
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.

VERSE 2
Yeshtuw eqana libenm kefche
Yiኸw aleqsalehu fith tedefche
Yefereskubetn beante endgeneba
Shtuw lefqrh new lensha enba .

CHORUS
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yete��ga
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.

VERSE 3
Eyesasahlgn aynenm eyayeh
Lije hoy teneshi befqr eyalk
Eyazenku met’che meleskegn bedesta
Satferdbgn markegn nefse menged sita .

CHORUS
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yete��ga
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.

VERSE 4
Hiywetn liset’en ewnet met’tolnal
Ayts’eyefenm beeqfu yaqfenal
Min sitseru neber bilo yemaykases
Beselam gibu new qalu yemifews .

CHORUS
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yete��ga
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.

VERSE 5
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yetewega
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.

CHORUS
Bet’fat qulf kermo yetezega
Bet’elat felats’a ejg yete��ga
Sibakn yenore liben fewslgn
Maregn biye met’ahu Geta teqebelegn.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'lbena-shtuyen-zemarit-betselot-asmare', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: LE ABRIHAM ENDEMALE (le-abriham-endemale)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ

VERSE 1
የማለውን መሐላ ሳይረሳ ጌታ
ሕዝቡን በጽኑ ደዌ በሞት ሳይመታ
ለአባቶቻችን እንደማለላቸው
ቃሉን ፈጸመ በቃልኪዳናቸው

VERSE 2
እግዚአብሔር በሙሴ ሕግ ባሕር ከፈለ
ከፈርዖን ሠራዊት ሕዝቡን ከለለ
እግዚአብሔር ከኖኅ ፈጸመ መሐላ
ምድር እንዳትጠፋ ከእንግዲህ በኋላ

VERSE 3
በጥላ በልብሳቸው ድውይ ፈወሱ
ምስክሮቹ ሆነው ተመላለሱ
ጌታ ስላለ ከቅዱሳን ጋር
ሥልጣን ሰጣቸው በሰማይ በምድር

VERSE 4
እንደ ደመና ሰፍረው በዙሪያችን
ስላሉን ምስክሮች ለነፍሳችን
እንድንማጸን በሕያው ስማቸው
አሉ በቀኙ ስላከበራቸው',
      lyrics_transliteration = 'Leabrham ende male
Leysheq endetenagere
Leyaeqob endemesekere
Hizbun kemot ashagere

VERSE 1
Yemalewn mehela sayresa Geta
Hizbun bets’nu dewe bemot saymeta
Leabatochachn endemalelachew
Qalun fets’eme beqalkidanachew

VERSE 2
Egziabher bemuse hig bahr kefele
Keferon serawit hizbun kelele
Egziabher kenoh fets’eme mehela
Midr endatt’efa keengdih behwala

VERSE 3
Bet’la belbsachew diwy fewesu
Miskrochu honew temelalesu
Geta silale keqdusan gar
Silt’an set’achew besemay bemdr

VERSE 4
Ende demena sefrew bezuriyachn
Silalun miskroch lenefsachn
Endnmats’en behyaw simachew
Alu beqegnu silakeberachew',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'le-abriham-endemale'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ

VERSE 1
የማለውን መሐላ ሳይረሳ ጌታ
ሕዝቡን በጽኑ ደዌ በሞት ሳይመታ
ለአባቶቻችን እንደማለላቸው
ቃሉን ፈጸመ በቃልኪዳናቸው

CHORUS
ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ

VERSE 2
እግዚአብሔር በሙሴ ሕግ ባሕር ከፈለ
ከፈርዖን ሠራዊት ሕዝቡን ከለለ
እግዚአብሔር ከኖኅ ፈጸመ መሐላ
ምድር እንዳትጠፋ ከእንግዲህ በኋላ

CHORUS
ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ

VERSE 3
በጥላ በልብሳቸው ድውይ ፈወሱ
ምስክሮቹ ሆነው ተመላለሱ
ጌታ ስላለ ከቅዱሳን ጋር
ሥልጣን ሰጣቸው በሰማይ በምድር

CHORUS
ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ

VERSE 4
እንደ ደመና ሰፍረው በዙሪያችን
ስላሉን ምስክሮች ለነፍሳችን
እንድንማጸን በሕያው ስማቸው
አሉ በቀኙ ስላከበራቸው

CHORUS
ለአብርሃም እንደ ማለ
ለይስሐቅ እንደተናገረ
ለያዕቆብ እንደመሰከረ
ሕዝቡን ከሞት አሻገረ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Leabrham ende male
Leysheq endetenagere
Leyaeqob endemesekere
Hizbun kemot ashagere

VERSE 1
Yemalewn mehela sayresa Geta
Hizbun bets’nu dewe bemot saymeta
Leabatochachn endemalelachew
Qalun fets’eme beqalkidanachew

CHORUS
Leabrham ende male
Leysheq endetenagere
Leyaeqob endemesekere
Hizbun kemot ashagere

VERSE 2
Egziabher bemuse hig bahr kefele
Keferon serawit hizbun kelele
Egziabher kenoh fets’eme mehela
Midr endatt’efa keengdih behwala

CHORUS
Leabrham ende male
Leysheq endetenagere
Leyaeqob endemesekere
Hizbun kemot ashagere

VERSE 3
Bet’la belbsachew diwy fewesu
Miskrochu honew temelalesu
Geta silale keqdusan gar
Silt’an set’achew besemay bemdr

CHORUS
Leabrham ende male
Leysheq endetenagere
Leyaeqob endemesekere
Hizbun kemot ashagere

VERSE 4
Ende demena sefrew bezuriyachn
Silalun miskroch lenefsachn
Endnmats’en behyaw simachew
Alu beqegnu silakeberachew

CHORUS
Leabrham ende male
Leysheq endetenagere
Leyaeqob endemesekere
Hizbun kemot ashagere'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'le-abriham-endemale', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Le Gebriel Yenegerkut (le-gebriel-yenegerkut)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 1
ተንከባሎ በዓይኔ አየሁት (2ጊዜ)
ከዓይን ጠቅሻ ቀድመህ
ፈጥነህ ትደርሳለህ
በምልጃህ ጸሎትህ

VERSE 2
ከእኔ ጋር አለህ
ገብርኤል ግብርኤል
ገብርኤል የምለው
እጄን ስዘረጋ

VERSE 3
ብዙ ሰጥተኸን ነው
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት

VERSE 4
ያስጨነቀኝ ታላቅ ድንጋይ
ተንከባሎ በዓይኔ አየሁት
የደስታን ዜና
ዘዋል እጆችህ

VERSE 5
የአምላክን ውዳሴ
ተሞልቷል ከንፈርህ
ችግሬን አትሻም
አትፈቅድም ጥፋቴን

VERSE 6
እንዳሰናከል
አቁመሀል እግሬን
በእግዚአብሔር ፊት
ለሚቆመው

VERSE 7
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ
ተንከባሎ በዓይኔ አየሁት
በእሳቱ መሀል

VERSE 8
ምስጋና አስተምረኝ
በእቶንም መካከል
ውዳሴን አሳየኝ
እንዳላጉረመርም

VERSE 9
በሆነው በአልሆነው
ገብርኤል አሳየኝ
አመስግኜ እንዳልፈው
በእግዚአብሔር ፊት

VERSE 10
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ
ተንከባሎ በዓይኔ አየሁት

VERSE 11
ሲድራቅ እና ሚሳቅ
አብድናጎን ሆነው
በሚነደው እሳት
ከእቶኑ ተጥለው

VERSE 12
ገብርኤል ደረሰ
ሊነግራቸው ዜና
ችግር እንደሚርቅ
በብዙ ምስጋና

VERSE 13
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 14
ተንከባሎ በዓይኔ አየሁት
ሲድራቅ እና ሚሳቅ
አብድናጎን ሆነው
በሚነደው እሳት

VERSE 15
ከእቶኑ ተጥለው
ገብርኤል ደረሰ
ሊነግራቸው ዜና
ችግር እንደሚርቅ

VERSE 16
በብዙ ምስጋና
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት

VERSE 17
ያስጨነቀኝ ታላቅ ድንጋይ
ተንከባሎ በዓይኔ አየሁት',
      lyrics_transliteration = 'BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 1
Tenkebalo beayne ayehut (2gize)
Keayn t’eqsha qedmeh
Fet’neh tidersaleh
Bemljah ts’eloth

VERSE 2
Keene gar aleh
Gebriel gibrel
Gebriel yemlew
Ejen sizerega

VERSE 3
Bizu set’teኸn new
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut

VERSE 4
Yasch’eneqegn talaq dingay
Tenkebalo beayne ayehut
Yedestan zena
Zewal ejochh

VERSE 5
Yeamlakn widase
Temoltwal kenferh
Chgren atsham
Atfeqdm t’faten

VERSE 6
Endasenakel
Aqumehel egren
BeEgziabher fit
Lemiqomew

VERSE 7
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay
Tenkebalo beayne ayehut
Beesatu mehel

VERSE 8
Misgana astemregn
Beetonm mekakel
Widasen asayegn
Endalaguremerm

VERSE 9
Behonew bealhonew
Gebriel asayegn
Amesggne endalfew
BeEgziabher fit

VERSE 10
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay
Tenkebalo beayne ayehut

VERSE 11
Sidraq ena misaq
Abdnagon honew
Beminedew esat
Keetonu tet’lew

VERSE 12
Gebriel derese
Linegrachew zena
Chgr endemirq
Bebzu misgana

VERSE 13
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 14
Tenkebalo beayne ayehut
Sidraq ena misaq
Abdnagon honew
Beminedew esat

VERSE 15
Keetonu tet’lew
Gebriel derese
Linegrachew zena
Chgr endemirq

VERSE 16
Bebzu misgana
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut

VERSE 17
Yasch’eneqegn talaq dingay
Tenkebalo beayne ayehut',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'le-gebriel-yenegerkut'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 1
ተንከባሎ በዓይኔ አየሁት (2ጊዜ)
ከዓይን ጠቅሻ ቀድመህ
ፈጥነህ ትደርሳለህ
በምልጃህ ጸሎትህ

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 2
ከእኔ ጋር አለህ
ገብርኤል ግብርኤል
ገብርኤል የምለው
እጄን ስዘረጋ

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 3
ብዙ ሰጥተኸን ነው
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 4
ያስጨነቀኝ ታላቅ ድንጋይ
ተንከባሎ በዓይኔ አየሁት
የደስታን ዜና
ዘዋል እጆችህ

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 5
የአምላክን ውዳሴ
ተሞልቷል ከንፈርህ
ችግሬን አትሻም
አትፈቅድም ጥፋቴን

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 6
እንዳሰናከል
አቁመሀል እግሬን
በእግዚአብሔር ፊት
ለሚቆመው

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 7
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ
ተንከባሎ በዓይኔ አየሁት
በእሳቱ መሀል

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 8
ምስጋና አስተምረኝ
በእቶንም መካከል
ውዳሴን አሳየኝ
እንዳላጉረመርም

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 9
በሆነው በአልሆነው
ገብርኤል አሳየኝ
አመስግኜ እንዳልፈው
በእግዚአብሔር ፊት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 10
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ
ተንከባሎ በዓይኔ አየሁት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 11
ሲድራቅ እና ሚሳቅ
አብድናጎን ሆነው
በሚነደው እሳት
ከእቶኑ ተጥለው

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 12
ገብርኤል ደረሰ
ሊነግራቸው ዜና
ችግር እንደሚርቅ
በብዙ ምስጋና

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 13
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 14
ተንከባሎ በዓይኔ አየሁት
ሲድራቅ እና ሚሳቅ
አብድናጎን ሆነው
በሚነደው እሳት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 15
ከእቶኑ ተጥለው
ገብርኤል ደረሰ
ሊነግራቸው ዜና
ችግር እንደሚርቅ

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 16
በብዙ ምስጋና
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ

VERSE 17
ያስጨነቀኝ ታላቅ ድንጋይ
ተንከባሎ በዓይኔ አየሁት

CHORUS
በእግዚአብሔር ፊት
ለሚቆመው
ለገብርኤል የነገርኩት
ያስጨነቀኝ ታላቅ ድንጋይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 1
Tenkebalo beayne ayehut (2gize)
Keayn t’eqsha qedmeh
Fet’neh tidersaleh
Bemljah ts’eloth

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 2
Keene gar aleh
Gebriel gibrel
Gebriel yemlew
Ejen sizerega

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 3
Bizu set’teኸn new
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 4
Yasch’eneqegn talaq dingay
Tenkebalo beayne ayehut
Yedestan zena
Zewal ejochh

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 5
Yeamlakn widase
Temoltwal kenferh
Chgren atsham
Atfeqdm t’faten

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 6
Endasenakel
Aqumehel egren
BeEgziabher fit
Lemiqomew

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 7
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay
Tenkebalo beayne ayehut
Beesatu mehel

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 8
Misgana astemregn
Beetonm mekakel
Widasen asayegn
Endalaguremerm

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 9
Behonew bealhonew
Gebriel asayegn
Amesggne endalfew
BeEgziabher fit

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 10
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay
Tenkebalo beayne ayehut

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 11
Sidraq ena misaq
Abdnagon honew
Beminedew esat
Keetonu tet’lew

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 12
Gebriel derese
Linegrachew zena
Chgr endemirq
Bebzu misgana

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 13
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 14
Tenkebalo beayne ayehut
Sidraq ena misaq
Abdnagon honew
Beminedew esat

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 15
Keetonu tet’lew
Gebriel derese
Linegrachew zena
Chgr endemirq

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 16
Bebzu misgana
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay

VERSE 17
Yasch’eneqegn talaq dingay
Tenkebalo beayne ayehut

CHORUS
BeEgziabher fit
Lemiqomew
LeGebriel yenegerkut
Yasch’eneqegn talaq dingay'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'le-gebriel-yenegerkut', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Le-Teklehaimanot Tsadiq (le-teklehaimanot-tsadiq)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ለተክለሃይማኖት ጻድቅ መጠነ ብዝኃ ህማሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

VERSE 1
እስመ በውስቴታ ተገብረ ፍልሠተ ሥጋሁ ወአጽሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

VERSE 2
እምነ አድባራት ኵሎን ዘተለአለት በስሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

VERSE 3
ኢየሱስ ክርስቶስ እንተ ቀደሳ በደሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/',
      lyrics_transliteration = 'Le-Teklehaimanot tsadiq met''ene bizha himamu (2)
Twed-so Debre Libanos gedamu (4)

VERSE 1
Isme be-wusteta tegebre filseta sigahu we-atsmu (2)
Twed-so Debre Libanos gedamu (4)

VERSE 2
Imne adbarat kulon zete-le''alet be-simu (2)
Twed-so Debre Libanos gedamu (4)

VERSE 3
Iyesus Kristos inte qedese be-demu (2)
Twed-so Debre Libanos gedamu (4)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'le-teklehaimanot-tsadiq'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለተክለሃይማኖት ጻድቅ መጠነ ብዝኃ ህማሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

VERSE 1
እስመ በውስቴታ ተገብረ ፍልሠተ ሥጋሁ ወአጽሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

CHORUS
ለተክለሃይማኖት ጻድቅ መጠነ ብዝኃ ህማሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

VERSE 2
እምነ አድባራት ኵሎን ዘተለአለት በስሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

CHORUS
ለተክለሃይማኖት ጻድቅ መጠነ ብዝኃ ህማሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

VERSE 3
ኢየሱስ ክርስቶስ እንተ ቀደሳ በደሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/

CHORUS
ለተክለሃይማኖት ጻድቅ መጠነ ብዝኃ ህማሙ /2/
ትዌድሶ ደብረ ሊባኖስ ገዳሙ /4/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Le-Teklehaimanot tsadiq met''ene bizha himamu (2)
Twed-so Debre Libanos gedamu (4)

VERSE 1
Isme be-wusteta tegebre filseta sigahu we-atsmu (2)
Twed-so Debre Libanos gedamu (4)

CHORUS
Le-Teklehaimanot tsadiq met''ene bizha himamu (2)
Twed-so Debre Libanos gedamu (4)

VERSE 2
Imne adbarat kulon zete-le''alet be-simu (2)
Twed-so Debre Libanos gedamu (4)

CHORUS
Le-Teklehaimanot tsadiq met''ene bizha himamu (2)
Twed-so Debre Libanos gedamu (4)

VERSE 3
Iyesus Kristos inte qedese be-demu (2)
Twed-so Debre Libanos gedamu (4)

CHORUS
Le-Teklehaimanot tsadiq met''ene bizha himamu (2)
Twed-so Debre Libanos gedamu (4)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'le-teklehaimanot-tsadiq', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Leene Yaladerekew Min Ale (leene-yaladerekew-min-ale)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 1
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ከሰማይ ወረደ እንደ ነጠብጣብ
ጠለ በረከትህ ኑሮዬን ሊያጠግብ

VERSE 2
የዕለት እንጀራዬ ባትሆን ወዳጄ
ማን ይገባ ነበር በተዘጋው ደጄ
እንደ ቀላይ ይሰፋል
የሰጠኸኝ ስጦታ

VERSE 3
አያልቅም ለእኔ ያልከው
ለጋስ ነህ የኔ ጌታ
ምስጋናዬ ምስጋና
ውዳሴዬ ውዳሴ

VERSE 4
አንተ ነህ ከፍታዬ
ክብርና ሞገሴ
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ

VERSE 5
ውለታህ ነው ከፍ ያለ[2×]
ፍቅርህ ይመዝናል ነግሶ በልቤ ላይ
ከምዝምዝ ወርቅና ከቀይ ዕንቁ በላይ
ሃይልህ በድካሜ እየተገለጠ

VERSE 6
በልጅ ባርከኸኛል ከሁሉ የበለጠ
ደረቅ ዛፍ ነኝ አልልም
ባንተ ጸጋ አፍርቼ
በሕያዋን ምድር ላይ

VERSE 7
ልኑር ሰምህን ጠርቼ
ምስጋናዬ ምስጋና
ውዳሴዬ ውዳሴ
አንተ ነህ ከፍታዬ

VERSE 8
ክብርና ሞገሴ
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]

VERSE 9
በታላቅ ጉባኤ ጽድቅህን ሳወራ
ጨለማው ታዘዘ አይኔ እንዲበራ
ሁልጊዜ አይሃለው በብዙ ማዳን
ስወጣ ስገባ በሌት እና ቀን

VERSE 10
ማዕበሉ ዝም አለ ክንድህን ተደግፌ
የማይታለፈውን ስንቱን ነገር አልፌ
ምስጋናዬ ምስጋና
ውዳሴዬ ውዳሴ

VERSE 11
አንተ ነህ ከፍታዬ
ክብርና ሞገሴ
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ

VERSE 12
ውለታህ ነው ከፍ ያለ[2×]
የደኅንነቴ ቀንድ መተማመኛዬ
በሰልፎቼ መሃል ገብተሃል ጌታዬ
እጄ ጋሻ ሳይዝ ከሳሼ ወደቀ

VERSE 13
የቃልህን ዝናር ወገቤ ታጠቀ
ምን አለ በዚህ አለም ያላደረከው ለእኔ
ምን ይደንቃል ከአፌ ቢወጣ የድል ቅኔ
ምስጋናዬ ምስጋና

VERSE 14
ውዳሴዬ ውዳሴ
አንተ ነህ ከፍታዬ
ክብርና ሞገሴ
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 15
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]',
      lyrics_transliteration = 'Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 1
Kezemene qut’r belay
Wiletah new kef yale[2×]
Kesemay werede ende net’ebt’ab
T’ele bereketh nuroyen liyat’egb

VERSE 2
Yeelet enjeraye bathon wedaje
Man yigeba neber betezegaw deje
Ende qelay yisefal
Yeset’eኸgn sit’ota

VERSE 3
Ayalqm leene yalkew
Legas neh yene Geta
Misganaye misgana
Widaseye widase

VERSE 4
Ante neh keftaye
Kibrna mogese
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay

VERSE 5
Wiletah new kef yale[2×]
Fiqrh yimeznal negso belbe lay
Kemzmz werqna keqey enqu belay
Haylh bedkame eyetegelet’e

VERSE 6
Belj barkeኸgnal kehulu yebelet’e
Dereq zaf negn allm
Bante ts’ega afrche
Behyawan midr lay

VERSE 7
Linur semhn t’erche
Misganaye misgana
Widaseye widase
Ante neh keftaye

VERSE 8
Kibrna mogese
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]

VERSE 9
Betalaq gubae ts’dqhn sawera
Ch’elemaw tazeze ayne endibera
Hulgize ayhalew bebzu madan
Siwet’a sigeba belet ena qen

VERSE 10
Maebelu zim ale kindhn tedegfe
Yemaytalefewn sintun neger alfe
Misganaye misgana
Widaseye widase

VERSE 11
Ante neh keftaye
Kibrna mogese
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay

VERSE 12
Wiletah new kef yale[2×]
Yedehnnete qend metemamegnaye
Beselfoche mehal gebtehal Getaye
Eje gasha sayz kesashe wedeqe

VERSE 13
Yeqalhn zinar wegebe tat’eqe
Min ale bezih alem yaladerekew leene
Min yidenqal keafe biwet’a yedl qine
Misganaye misgana

VERSE 14
Widaseye widase
Ante neh keftaye
Kibrna mogese
Leene yaladerekew min ale? [4×]

VERSE 15
Kezemene qut’r belay
Wiletah new kef yale[2×]',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'leene-yaladerekew-min-ale'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 1
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ከሰማይ ወረደ እንደ ነጠብጣብ
ጠለ በረከትህ ኑሮዬን ሊያጠግብ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 2
የዕለት እንጀራዬ ባትሆን ወዳጄ
ማን ይገባ ነበር በተዘጋው ደጄ
እንደ ቀላይ ይሰፋል
የሰጠኸኝ ስጦታ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 3
አያልቅም ለእኔ ያልከው
ለጋስ ነህ የኔ ጌታ
ምስጋናዬ ምስጋና
ውዳሴዬ ውዳሴ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 4
አንተ ነህ ከፍታዬ
ክብርና ሞገሴ
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 5
ውለታህ ነው ከፍ ያለ[2×]
ፍቅርህ ይመዝናል ነግሶ በልቤ ላይ
ከምዝምዝ ወርቅና ከቀይ ዕንቁ በላይ
ሃይልህ በድካሜ እየተገለጠ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 6
በልጅ ባርከኸኛል ከሁሉ የበለጠ
ደረቅ ዛፍ ነኝ አልልም
ባንተ ጸጋ አፍርቼ
በሕያዋን ምድር ላይ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 7
ልኑር ሰምህን ጠርቼ
ምስጋናዬ ምስጋና
ውዳሴዬ ውዳሴ
አንተ ነህ ከፍታዬ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 8
ክብርና ሞገሴ
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 9
በታላቅ ጉባኤ ጽድቅህን ሳወራ
ጨለማው ታዘዘ አይኔ እንዲበራ
ሁልጊዜ አይሃለው በብዙ ማዳን
ስወጣ ስገባ በሌት እና ቀን

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 10
ማዕበሉ ዝም አለ ክንድህን ተደግፌ
የማይታለፈውን ስንቱን ነገር አልፌ
ምስጋናዬ ምስጋና
ውዳሴዬ ውዳሴ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 11
አንተ ነህ ከፍታዬ
ክብርና ሞገሴ
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 12
ውለታህ ነው ከፍ ያለ[2×]
የደኅንነቴ ቀንድ መተማመኛዬ
በሰልፎቼ መሃል ገብተሃል ጌታዬ
እጄ ጋሻ ሳይዝ ከሳሼ ወደቀ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 13
የቃልህን ዝናር ወገቤ ታጠቀ
ምን አለ በዚህ አለም ያላደረከው ለእኔ
ምን ይደንቃል ከአፌ ቢወጣ የድል ቅኔ
ምስጋናዬ ምስጋና

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 14
ውዳሴዬ ውዳሴ
አንተ ነህ ከፍታዬ
ክብርና ሞገሴ
ለእኔ ያላደረከው ምን አለ? [4×]

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 15
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 1
Kezemene qut’r belay
Wiletah new kef yale[2×]
Kesemay werede ende net’ebt’ab
T’ele bereketh nuroyen liyat’egb

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 2
Yeelet enjeraye bathon wedaje
Man yigeba neber betezegaw deje
Ende qelay yisefal
Yeset’eኸgn sit’ota

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 3
Ayalqm leene yalkew
Legas neh yene Geta
Misganaye misgana
Widaseye widase

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 4
Ante neh keftaye
Kibrna mogese
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 5
Wiletah new kef yale[2×]
Fiqrh yimeznal negso belbe lay
Kemzmz werqna keqey enqu belay
Haylh bedkame eyetegelet’e

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 6
Belj barkeኸgnal kehulu yebelet’e
Dereq zaf negn allm
Bante ts’ega afrche
Behyawan midr lay

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 7
Linur semhn t’erche
Misganaye misgana
Widaseye widase
Ante neh keftaye

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 8
Kibrna mogese
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 9
Betalaq gubae ts’dqhn sawera
Ch’elemaw tazeze ayne endibera
Hulgize ayhalew bebzu madan
Siwet’a sigeba belet ena qen

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 10
Maebelu zim ale kindhn tedegfe
Yemaytalefewn sintun neger alfe
Misganaye misgana
Widaseye widase

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 11
Ante neh keftaye
Kibrna mogese
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 12
Wiletah new kef yale[2×]
Yedehnnete qend metemamegnaye
Beselfoche mehal gebtehal Getaye
Eje gasha sayz kesashe wedeqe

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 13
Yeqalhn zinar wegebe tat’eqe
Min ale bezih alem yaladerekew leene
Min yidenqal keafe biwet’a yedl qine
Misganaye misgana

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 14
Widaseye widase
Ante neh keftaye
Kibrna mogese
Leene yaladerekew min ale? [4×]

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 15
Kezemene qut’r belay
Wiletah new kef yale[2×]

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'leene-yaladerekew-min-ale', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Lehulu Yemitiset (lehulu-yemitiset)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 1
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ

VERSE 2
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 3
በትምክህት ሆነን
በአንዳች እንዳንፈርድ
በሰው ያለው ድካም
አለ በእኛም ዘንድ

VERSE 4
በምህረቱ ብዛት
ተሸፍነን እንጅ
እጅግ ብዙ ድካም
አለ በእኛ እጅ

VERSE 5
እጅግ ብዙ ድካም
አለ በእኛ እጅ
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ

VERSE 6
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 7
ተገልጦ ነው እንጂ ኃይሉ በእኛ ድካም
ኃጢያት የሌለበት አንድስ እንኳን የለም
እኔ እሻላለሁ አንበል በ ልባችን
አግናጥዮስ አለ በመካከላችን 2x

VERSE 8
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
አንዱ የአንዱን ድካም እያገዘ ይኑር

VERSE 9
የኃጢያትን ብዛት ይሸፍናል ፍቅር
መቅደም ስለሌለ ለብቻ ሮጦ
ያፀድቀናል እንጂ እግዚአብሔር መርጦ 2x
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ

VERSE 10
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እራሱን ከፍ አርጎ ሌላውን የሚ��ቅ
በአመነው አይፀናም ቅርብ ነው ለመውደቅ

VERSE 11
የትህትናን ሕይወት ይነግረናል ቃሉ
እኛ የማንጠቅም ባርያዎች ነን በሉ 2
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ

VERSE 12
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
በክርስቶስ ፍቅር እንውደድ ሁሉን
ነፍሰ ገዳይ ሆነን እንዳናጣ ክብሩን
እየተባባልን የአጵሎስ የኬፋ

VERSE 13
ካላመኑት ይልቅ ብሰን እንዳንከፋ
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ

VERSE 14
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ',
      lyrics_transliteration = 'Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 1
Endanl agzen
Ene ebelt’ ene ebelt’
Ye ewqet aynochn
Le hulu yemtset’

VERSE 2
Endanl agzen
Ene ebelt’ ene ebelt’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 3
Betmkht honen
Beandach endanferd
Besew yalew dikam
Ale beegnam zend

VERSE 4
Bemhretu bizat
Teshefnen enj
Ejg bizu dikam
Ale beegna ej

VERSE 5
Ejg bizu dikam
Ale beegna ej
Ye ewqet aynochn
Le hulu yemtset’

VERSE 6
Endanl agzen
Ene ebelt’ ene ebelt’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 7
Tegelt’o new enji haylu beegna dikam
Hat’iyat yelelebet ands enkwan yelem
Ene eshalalehu anbel be libachn
Agnat’yos ale bemekakelachn 2x

VERSE 8
Ye ewqet aynochn le hulu yemtset’
Endanl agzen ene ebelt’ ene ebelt’
Endanl agzen ene ebelt’ ene ebelt’
Andu yeandun dikam eyageze yinur

VERSE 9
Yehat’iyatn bizat yishefnal fiqr
Meqdem silelele lebcha rot’o
Yats’edqenal enji Egziabher mert’o 2x
Ye ewqet aynochn le hulu yemtset’

VERSE 10
Endanl agzen ene ebelt’ ene ebelt’
Endanl agzen ene ebelt’ ene ebelt’
Erasun kef argo lelawn yemi��q
Beamenew ayts’enam qirb new lemewdeq

VERSE 11
Yethtnan hiywet yinegrenal qalu
Egna yemant’eqm baryawoch nen belu 2
Ye ewqet aynochn le hulu yemtset’
Endanl agzen ene ebelt’ ene ebelt’

VERSE 12
Endanl agzen ene ebelt’ ene ebelt’
BeKristos fiqr enwded hulun
Nefse geday honen endanat’a kibrun
Eyetebabaln yeap’los yekefa

VERSE 13
Kalamenut yilq bisen endankefa
Ye ewqet aynochn le hulu yemtset’
Endanl agzen ene ebelt’ ene ebelt’
Endanl agzen ene ebelt’ ene ebelt’

VERSE 14
Ye ewqet aynochn le hulu yemtset’
Endanl agzen ene ebelt’ ene ebelt’
Endanl agzen ene ebelt’ ene ebelt’',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'lehulu-yemitiset'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 1
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 2
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 3
በትምክህት ሆነን
በአንዳች እንዳንፈርድ
በሰው ያለው ድካም
አለ በእኛም ዘንድ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 4
በምህረቱ ብዛት
ተሸፍነን እንጅ
እጅግ ብዙ ድካም
አለ በእኛ እጅ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 5
እጅግ ብዙ ድካም
አለ በእኛ እጅ
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 6
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 7
ተገልጦ ነው እንጂ ኃይሉ በእኛ ድካም
ኃጢያት የሌለበት አንድስ እንኳን የለም
እኔ እሻላለሁ አንበል በ ልባችን
አግናጥዮስ አለ በመካከላችን 2x

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 8
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
አንዱ የአንዱን ድካም እያገዘ ይኑር

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 9
የኃጢያትን ብዛት ይሸፍናል ፍቅር
መቅደም ስለሌለ ለብቻ ሮጦ
ያፀድቀናል እንጂ እግዚአብሔር መርጦ 2x
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 10
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እራሱን ከፍ አርጎ ሌላውን የሚ��ቅ
በአመነው አይፀናም ቅርብ ነው ለመውደቅ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 11
የትህትናን ሕይወት ይነግረናል ቃሉ
እኛ የማንጠቅም ባርያዎች ነን በሉ 2
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 12
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
በክርስቶስ ፍቅር እንውደድ ሁሉን
ነፍሰ ገዳይ ሆነን እንዳናጣ ክብሩን
እየተባባልን የአጵሎስ የኬፋ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 13
ካላመኑት ይልቅ ብሰን እንዳንከፋ
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ

VERSE 14
የ እውቀት አይኖችን ለ ሁሉ የምትሰጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ
እንዳንል አግዘን እኔ እበልጥ እኔ እበልጥ

CHORUS
የ እውቀት አይኖችን
ለ ሁሉ የምትሰጥ
እንዳንል አግዘን
እኔ እበልጥ እኔ እበልጥ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 1
Endanl agzen
Ene ebelt’ ene ebelt’
Ye ewqet aynochn
Le hulu yemtset’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 2
Endanl agzen
Ene ebelt’ ene ebelt’
Endanl agzen
Ene ebelt’ ene ebelt’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 3
Betmkht honen
Beandach endanferd
Besew yalew dikam
Ale beegnam zend

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 4
Bemhretu bizat
Teshefnen enj
Ejg bizu dikam
Ale beegna ej

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 5
Ejg bizu dikam
Ale beegna ej
Ye ewqet aynochn
Le hulu yemtset’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 6
Endanl agzen
Ene ebelt’ ene ebelt’
Endanl agzen
Ene ebelt’ ene ebelt’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 7
Tegelt’o new enji haylu beegna dikam
Hat’iyat yelelebet ands enkwan yelem
Ene eshalalehu anbel be libachn
Agnat’yos ale bemekakelachn 2x

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 8
Ye ewqet aynochn le hulu yemtset’
Endanl agzen ene ebelt’ ene ebelt’
Endanl agzen ene ebelt’ ene ebelt’
Andu yeandun dikam eyageze yinur

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 9
Yehat’iyatn bizat yishefnal fiqr
Meqdem silelele lebcha rot’o
Yats’edqenal enji Egziabher mert’o 2x
Ye ewqet aynochn le hulu yemtset’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 10
Endanl agzen ene ebelt’ ene ebelt’
Endanl agzen ene ebelt’ ene ebelt’
Erasun kef argo lelawn yemi��q
Beamenew ayts’enam qirb new lemewdeq

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 11
Yethtnan hiywet yinegrenal qalu
Egna yemant’eqm baryawoch nen belu 2
Ye ewqet aynochn le hulu yemtset’
Endanl agzen ene ebelt’ ene ebelt’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 12
Endanl agzen ene ebelt’ ene ebelt’
BeKristos fiqr enwded hulun
Nefse geday honen endanat’a kibrun
Eyetebabaln yeap’los yekefa

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 13
Kalamenut yilq bisen endankefa
Ye ewqet aynochn le hulu yemtset’
Endanl agzen ene ebelt’ ene ebelt’
Endanl agzen ene ebelt’ ene ebelt’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’

VERSE 14
Ye ewqet aynochn le hulu yemtset’
Endanl agzen ene ebelt’ ene ebelt’
Endanl agzen ene ebelt’ ene ebelt’

CHORUS
Ye ewqet aynochn
Le hulu yemtset’
Endanl agzen
Ene ebelt’ ene ebelt’'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'lehulu-yemitiset', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Lekidisit Silase (lekidisit-silase)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 1
በጥበብ የሰራኝ በከሃሊነቱ
ግዛቱ ፅኑ ናት ዘላለም መንግስቱ
ቀድሞ የፈጠረኝ በሆድ ሳልሰራ
ግሩም ነው ስላሴ በእጆቹ ሥራ

VERSE 2
መተማመኛዬ ጋሻዬ ነህ ክብሬ
ትናንት የጠበቅከኝ ደግሞም እስከ ዛሬ
የነገም ተስፋዬ አንተው ነህ ጌታዬ
የማታሳፍረኝ ስላሴ አንባዬ

VERSE 3
አብ ወልድ መንፈስ ቅዱስ አንድ አምላክ ስላሴ
አስገኝ ፈጣሪ የስጋ የነፍሴ
እድሜዬን በሙሉ ሳወድስህ ልኑር
ብቻህን ገናናው በሰማይ በምድር

VERSE 4
መተማመኛዬ ጋሻዬ ነህ ክብሬ
ትናንት የጠበቅከኝ ደግሞም እስከ ዛሬ
የነገም ተስፋዬ አንተው ነህ ጌታዬ
የማታሳፍረኝ ስላሴ አንባዬ

VERSE 5
ሳልወጣ ከእቅፍህ ከህልውናህ
መገናኘትህ አጥሮኝ ልኑር ሳመልክህ
በታላቅ ልእልና ከፍ ያልክ ያለ ልክ
መመለክ ሚገባህ አንተ ብቻ አምላክ

VERSE 6
መተማመኛዬ ጋሻዬ ነህ ክብሬ
ትናንት የጠበቅከኝ ደግሞም እስከ ዛሬ
የነገም ተስፋዬ አንተው ነህ ጌታዬ
የማታሳፍረኝ ስላሴ አንባዬ',
      lyrics_transliteration = 'Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn

VERSE 1
Bet’beb yeseragn bekehalinetu
Gizatu ts’nu nat zelalem mengstu
Qedmo yefet’eregn behod salsera
Girum new Silassie beejochu sira

VERSE 2
Metemamegnaye gashaye neh kibre
Tinant yet’ebeqkegn degmom eske zare
Yenegem tesfaye antew neh Getaye
Yematasafregn Silassie anbaye

VERSE 3
Ab Weld menfes Kidus and amlak Silassie
Asgegn fet’ari yesga yenefse
Edmeyen bemulu sawedsh linur
Bichahn genanaw besemay bemdr

VERSE 4
Metemamegnaye gashaye neh kibre
Tinant yet’ebeqkegn degmom eske zare
Yenegem tesfaye antew neh Getaye
Yematasafregn Silassie anbaye

VERSE 5
Salwet’a keeqfh kehlwnah
Megenagneth at’rogn linur samelkh
Betalaq lielna kef yalk yale lik
Memelek migebah ante bicha amlak

VERSE 6
Metemamegnaye gashaye neh kibre
Tinant yet’ebeqkegn degmom eske zare
Yenegem tesfaye antew neh Getaye
Yematasafregn Silassie anbaye',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'lekidisit-silase'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 1
በጥበብ የሰራኝ በከሃሊነቱ
ግዛቱ ፅኑ ናት ዘላለም መንግስቱ
ቀድሞ የፈጠረኝ በሆድ ሳልሰራ
ግሩም ነው ስላሴ በእጆቹ ሥራ

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 2
መተማመኛዬ ጋሻዬ ነህ ክብሬ
ትናንት የጠበቅከኝ ደግሞም እስከ ዛሬ
የነገም ተስፋዬ አንተው ነህ ጌታዬ
የማታሳፍረኝ ስላሴ አንባዬ

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 3
አብ ወልድ መንፈስ ቅዱስ አንድ አምላክ ስላሴ
አስገኝ ፈጣሪ የስጋ የነፍሴ
እድሜዬን በሙሉ ሳወድስህ ልኑር
ብቻህን ገናናው በሰማይ በምድር

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 4
መተማመኛዬ ጋሻዬ ነህ ክብሬ
ትናንት የጠበቅከኝ ደግሞም እስከ ዛሬ
የነገም ተስፋዬ አንተው ነህ ጌታዬ
የማታሳፍረኝ ስላሴ አንባዬ

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 5
ሳልወጣ ከእቅፍህ ከህልውናህ
መገናኘትህ አጥሮኝ ልኑር ሳመልክህ
በታላቅ ልእልና ከፍ ያልክ ያለ ልክ
መመለክ ሚገባህ አንተ ብቻ አምላክ

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ

VERSE 6
መተማመኛዬ ጋሻዬ ነህ ክብሬ
ትናንት የጠበቅከኝ ደግሞም እስከ ዛሬ
የነገም ተስፋዬ አንተው ነህ ጌታዬ
የማታሳፍረኝ ስላሴ አንባዬ

CHORUS
ለቅድስት ስላሴ
ቆምኩኝ ለውዳሴ
የሕይወት እስትንፋስ እፍ ላለብኝ
ለፈጠረኝ ጌታ መዝሙር ቅኔ አለኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn

VERSE 1
Bet’beb yeseragn bekehalinetu
Gizatu ts’nu nat zelalem mengstu
Qedmo yefet’eregn behod salsera
Girum new Silassie beejochu sira

CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn

VERSE 2
Metemamegnaye gashaye neh kibre
Tinant yet’ebeqkegn degmom eske zare
Yenegem tesfaye antew neh Getaye
Yematasafregn Silassie anbaye

CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn

VERSE 3
Ab Weld menfes Kidus and amlak Silassie
Asgegn fet’ari yesga yenefse
Edmeyen bemulu sawedsh linur
Bichahn genanaw besemay bemdr

CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn

VERSE 4
Metemamegnaye gashaye neh kibre
Tinant yet’ebeqkegn degmom eske zare
Yenegem tesfaye antew neh Getaye
Yematasafregn Silassie anbaye

CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn

VERSE 5
Salwet’a keeqfh kehlwnah
Megenagneth at’rogn linur samelkh
Betalaq lielna kef yalk yale lik
Memelek migebah ante bicha amlak

CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn

VERSE 6
Metemamegnaye gashaye neh kibre
Tinant yet’ebeqkegn degmom eske zare
Yenegem tesfaye antew neh Getaye
Yematasafregn Silassie anbaye

CHORUS
Leqdst Silassie
Qomkugn lewdase
Yehywet estnfas ef lalebgn
Lefet’eregn Geta mezmur qine alegn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'lekidisit-silase', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: lel bel / Zemarit Kisanet Kbrom / Eritrean Orthodox Tewahdo Mezmur (lel-bel-zemarit-kisanet-kbrom-eritrean-orthodox-tewahdo-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = '(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 1
ገሮሞ''ለ ዘይኮነ
ልማድ ሰብ ተከቲለ
ውሽጠይ ተረቲዐ ኢየ
ዘምልኸካ ኣቦየ

VERSE 2
ፍቅርካ ኣብ ደመይ ኣቲዩ
ከመይ ኢለ''ሞ ስቅ ክብል
ስምካ አንተ ዘይጸዋዕኩ
ልበይ ትብል ሸቀልቀል

VERSE 3
☆☆☆☆☆☆☆
ህዋሳተይ ብሕብረት
ኣዋዲደ ብትግሃት
ቀትሪ ለይቲ ከይበልኩ

VERSE 4
ንስምኻ አንተ ዘመርኩ
ሓይለይ ኣይደክመንን''ዩ
ውሽጠይ ኣይጸግበካን''ዩ
መሊሱ "ኢየሱስ" ይበል

VERSE 5
ኣይክአለሉን ስቅ ምባል
☆☆☆☆☆☆☆☆
ብሙሉ ልበይ ዝቀርቦ
ኩልንትናይ ዝህቦ

VERSE 6
ልዕሌካ ዝሰርዖ የልቦን
ብፍጹም''ውን ኣይሓስቦን
ምስጋናይ ኮነ ጸሎተይ
ጥበበይ ኮነ ድርሰተይ

VERSE 7
ትዘቅርቦ መስዋአተይ
ንዓኻ''ዩ ኣምላኸይ
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ

VERSE 8
ብሓቂ አንብርኸከልካ)²',
      lyrics_transliteration = '(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 1
Geromo''le zeykone
Limad seb teketile
Wisht’ey teretia iye
Zemlኸka aboye

VERSE 2
Fiqrka ab demey atiyu
Kemey ile''mo siq kibl
Simka ante zeyts’ewaeku
Libey tibl sheqelqel

VERSE 3
☆☆☆☆☆☆☆
Hiwasatey bihbret
Awadide bitghat
Qetri leyti keybelku

VERSE 4
Nismኻ ante zemerku
Hayley aydekmenn''yu
Wisht’ey ayts’egbekan''yu
Melisu "Iyesus" yibel

VERSE 5
Aykalelun siq mibal
☆☆☆☆☆☆☆☆
Bimulu libey ziqerbo
Kulntnay zihbo

VERSE 6
Lieleka zisero yelbon
Bifts’um''win ayhasbon
Misganay kone ts’elotey
T’bebey kone dirsetey

VERSE 7
Tizeqrbo meswaatey
Niaኻ''yu amlaኸy
(liel bel (kiber)² ableka
Bimenfes amlኸka

VERSE 8
Bihaqi anbrኸkelka)²',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'lel-bel-zemarit-kisanet-kbrom-eritrean-orthodox-tewahdo-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 1
ገሮሞ''ለ ዘይኮነ
ልማድ ሰብ ተከቲለ
ውሽጠይ ተረቲዐ ኢየ
ዘምልኸካ ኣቦየ

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 2
ፍቅርካ ኣብ ደመይ ኣቲዩ
ከመይ ኢለ''ሞ ስቅ ክብል
ስምካ አንተ ዘይጸዋዕኩ
ልበይ ትብል ሸቀልቀል

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 3
☆☆☆☆☆☆☆
ህዋሳተይ ብሕብረት
ኣዋዲደ ብትግሃት
ቀትሪ ለይቲ ከይበልኩ

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 4
ንስምኻ አንተ ዘመርኩ
ሓይለይ ኣይደክመንን''ዩ
ውሽጠይ ኣይጸግበካን''ዩ
መሊሱ "ኢየሱስ" ይበል

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 5
ኣይክአለሉን ስቅ ምባል
☆☆☆☆☆☆☆☆
ብሙሉ ልበይ ዝቀርቦ
ኩልንትናይ ዝህቦ

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 6
ልዕሌካ ዝሰርዖ የልቦን
ብፍጹም''ውን ኣይሓስቦን
ምስጋናይ ኮነ ጸሎተይ
ጥበበይ ኮነ ድርሰተይ

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 7
ትዘቅርቦ መስዋአተይ
ንዓኻ''ዩ ኣምላኸይ
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆

VERSE 8
ብሓቂ አንብርኸከልካ)²

CHORUS
(ልዕል በል (ክበር)² አብለካ
ብመንፈስ አምልኸካ
ብሓቂ አንብርኸከልካ)²
☆☆☆☆☆☆☆'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 1
Geromo''le zeykone
Limad seb teketile
Wisht’ey teretia iye
Zemlኸka aboye

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 2
Fiqrka ab demey atiyu
Kemey ile''mo siq kibl
Simka ante zeyts’ewaeku
Libey tibl sheqelqel

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 3
☆☆☆☆☆☆☆
Hiwasatey bihbret
Awadide bitghat
Qetri leyti keybelku

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 4
Nismኻ ante zemerku
Hayley aydekmenn''yu
Wisht’ey ayts’egbekan''yu
Melisu "Iyesus" yibel

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 5
Aykalelun siq mibal
☆☆☆☆☆☆☆☆
Bimulu libey ziqerbo
Kulntnay zihbo

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 6
Lieleka zisero yelbon
Bifts’um''win ayhasbon
Misganay kone ts’elotey
T’bebey kone dirsetey

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 7
Tizeqrbo meswaatey
Niaኻ''yu amlaኸy
(liel bel (kiber)² ableka
Bimenfes amlኸka

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆

VERSE 8
Bihaqi anbrኸkelka)²

CHORUS
(liel bel (kiber)² ableka
Bimenfes amlኸka
Bihaqi anbrኸkelka)²
☆☆☆☆☆☆☆'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'lel-bel-zemarit-kisanet-kbrom-eritrean-orthodox-tewahdo-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: lela mn elalew (lela-mn-elalew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሌላ ምን እላለሁ
ጌታዬ አንተን እያየሁ
ሌላ ምን እሻሁ
አምላኬ አንተን እያየሁ

VERSE 1
ሰው ዓለሙን ቢያተርፍ ሁሉ ቢኖረው
አንተ ከሌለኸው እጅግ ባዶ ነው
በጎ ስጦታዬ ሀብቴ በረከቴ
መኖሪያ አንተ ነህ የሰማዩ አባቴ

VERSE 2
+++
ልርገጠው ባህሩን እያየሁ ወዳንተ
አይወድቅም ፊትህን የተመለከተ
አንተ የተከልከው እንደሳሮን ጽጌ ያድጋል ተጠብቆ

VERSE 3
ማንም አላፈረ ጌታውን ጠብቆ
+++
አጠገቤ ሆነህ በቀኜ ስትሰራ
አባቴ ሆነኸኝ ስለኔ ስትራራ

VERSE 4
ተክለህ አሳድገህ በቅዱስ መቅደስህ
ብዙ ምክንያት አለኝ እንዳመሰግንህ',
      lyrics_transliteration = 'Lela min elalehu
Getaye anten eyayehu
Lela min eshahu
Amlake anten eyayehu

VERSE 1
Sew alemun biyaterf hulu binorew
Ante keleleኸw ejg bado new
Bego sit’otaye hebte berekete
Menoriya ante neh yesemayu abate

VERSE 2
+++
Lirget’ew bahrun eyayehu wedante
Aywedqm fithn yetemelekete
Ante yetekelkew endesaron ts’ge yadgal tet’ebqo

VERSE 3
Manm alafere getawn t’ebqo
+++
At’egebe honeh beqegne sitsera
Abate honeኸgn silene sitrara

VERSE 4
Tekleh asadgeh beqdus meqdesh
Bizu miknyat alegn endamesegnh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'lela-mn-elalew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሌላ ምን እላለሁ
ጌታዬ አንተን እያየሁ
ሌላ ምን እሻሁ
አምላኬ አንተን እያየሁ

VERSE 1
ሰው ዓለሙን ቢያተርፍ ሁሉ ቢኖረው
አንተ ከሌለኸው እጅግ ባዶ ነው
በጎ ስጦታዬ ሀብቴ በረከቴ
መኖሪያ አንተ ነህ የሰማዩ አባቴ

CHORUS
ሌላ ምን እላለሁ
ጌታዬ አንተን እያየሁ
ሌላ ምን እሻሁ
አምላኬ አንተን እያየሁ

VERSE 2
+++
ልርገጠው ባህሩን እያየሁ ወዳንተ
አይወድቅም ፊትህን የተመለከተ
አንተ የተከልከው እንደሳሮን ጽጌ ያድጋል ተጠብቆ

CHORUS
ሌላ ምን እላለሁ
ጌታዬ አንተን እያየሁ
ሌላ ምን እሻሁ
አምላኬ አንተን እያየሁ

VERSE 3
ማንም አላፈረ ጌታውን ጠብቆ
+++
አጠገቤ ሆነህ በቀኜ ስትሰራ
አባቴ ሆነኸኝ ስለኔ ስትራራ

CHORUS
ሌላ ምን እላለሁ
ጌታዬ አንተን እያየሁ
ሌላ ምን እሻሁ
አምላኬ አንተን እያየሁ

VERSE 4
ተክለህ አሳድገህ በቅዱስ መቅደስህ
ብዙ ምክንያት አለኝ እንዳመሰግንህ

CHORUS
ሌላ ምን እላለሁ
ጌታዬ አንተን እያየሁ
ሌላ ምን እሻሁ
አምላኬ አንተን እያየሁ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lela min elalehu
Getaye anten eyayehu
Lela min eshahu
Amlake anten eyayehu

VERSE 1
Sew alemun biyaterf hulu binorew
Ante keleleኸw ejg bado new
Bego sit’otaye hebte berekete
Menoriya ante neh yesemayu abate

CHORUS
Lela min elalehu
Getaye anten eyayehu
Lela min eshahu
Amlake anten eyayehu

VERSE 2
+++
Lirget’ew bahrun eyayehu wedante
Aywedqm fithn yetemelekete
Ante yetekelkew endesaron ts’ge yadgal tet’ebqo

CHORUS
Lela min elalehu
Getaye anten eyayehu
Lela min eshahu
Amlake anten eyayehu

VERSE 3
Manm alafere getawn t’ebqo
+++
At’egebe honeh beqegne sitsera
Abate honeኸgn silene sitrara

CHORUS
Lela min elalehu
Getaye anten eyayehu
Lela min eshahu
Amlake anten eyayehu

VERSE 4
Tekleh asadgeh beqdus meqdesh
Bizu miknyat alegn endamesegnh

CHORUS
Lela min elalehu
Getaye anten eyayehu
Lela min eshahu
Amlake anten eyayehu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'lela-mn-elalew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Lemaryam Negeni (lemaryam-negeni)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 1
ካህናት በመቅደስ የሚያገለግሏት
ታቦተ ሚስጥሩ የቅዱስ ቃል እናት
የክህነት መኣዛ የሽቷቸው ሙዳይ
የእጣኑ ማእጠንት ሰዋሰው የአዶናይ(፪)

VERSE 2
በአሚነ ዚአሀ ለማርያም ንገኒ

VERSE 3
እስራኤል ከስደት ከግብጽ ሲድኑ
ታላቁን እጅ አይተው በሙሴ እንዳመኑ
ከጸላኤ ሰናይ ግዞት ላመለጥን
የታመነች እናት ከመስቀል ተሰጠን

VERSE 4
በኣሚነ ዚኣሀ ለማርያም ንገኒ

VERSE 5
ለእርሷ ካልተገዛ ህዝቡና መንግስቱ
ፈጽሞ ይጠፋል ይላል በትንቢቱ
ጽዮን ጽይወናችን ሐዲሲቷ ሐምር
የተስፋው ፍጻሜ ሲሳይ ናት ሲሳይ ናት ለፍጡር

VERSE 6
በአሚነ ዚአሀ ለማርያም ንገኒ',
      lyrics_transliteration = 'Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)

VERSE 1
Kahnat bemeqdes yemiyageleglwat
Tabote mist’ru yeqdus qal enat
Yekhnet meaza yeshtwachew muday
Yeet’anu maet’ent sewasew yeadonay (2)

VERSE 2
Beamine ziahe leMaryam nigeni

VERSE 3
Esrael kesdet kegbts’ sidnu
Talaqun ej aytew bemuse endamenu
Kets’elae senay gizot lamelet’n
Yetamenech enat kemesqel teset’en

VERSE 4
Beamine ziahe leMaryam nigeni

VERSE 5
Leerswa kaltegeza hizbuna mengstu
Fets’mo yit’efal yilal betnbitu
Ts’yon ts’ywenachn hedisitwa hemr
Yetesfaw fits’ame sisay nat sisay nat left’ur

VERSE 6
Beamine ziahe leMaryam nigeni',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'lemaryam-negeni'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 1
ካህናት በመቅደስ የሚያገለግሏት
ታቦተ ሚስጥሩ የቅዱስ ቃል እናት
የክህነት መኣዛ የሽቷቸው ሙዳይ
የእጣኑ ማእጠንት ሰዋሰው የአዶናይ(፪)

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 2
በአሚነ ዚአሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 3
እስራኤል ከስደት ከግብጽ ሲድኑ
ታላቁን እጅ አይተው በሙሴ እንዳመኑ
ከጸላኤ ሰናይ ግዞት ላመለጥን
የታመነች እናት ከመስቀል ተሰጠን

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 4
በኣሚነ ዚኣሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 5
ለእርሷ ካልተገዛ ህዝቡና መንግስቱ
ፈጽሞ ይጠፋል ይላል በትንቢቱ
ጽዮን ጽይወናችን ሐዲሲቷ ሐምር
የተስፋው ፍጻሜ ሲሳይ ናት ሲሳይ ናት ለፍጡር

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)

VERSE 6
በአሚነ ዚአሀ ለማርያም ንገኒ

CHORUS
ፍጥረትን በሚያስምር በናቱ ልመና
ክርስቶስ ይማረን መሀሪ ነውና (፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)

VERSE 1
Kahnat bemeqdes yemiyageleglwat
Tabote mist’ru yeqdus qal enat
Yekhnet meaza yeshtwachew muday
Yeet’anu maet’ent sewasew yeadonay (2)

CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)

VERSE 2
Beamine ziahe leMaryam nigeni

CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)

VERSE 3
Esrael kesdet kegbts’ sidnu
Talaqun ej aytew bemuse endamenu
Kets’elae senay gizot lamelet’n
Yetamenech enat kemesqel teset’en

CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)

VERSE 4
Beamine ziahe leMaryam nigeni

CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)

VERSE 5
Leerswa kaltegeza hizbuna mengstu
Fets’mo yit’efal yilal betnbitu
Ts’yon ts’ywenachn hedisitwa hemr
Yetesfaw fits’ame sisay nat sisay nat left’ur

CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)

VERSE 6
Beamine ziahe leMaryam nigeni

CHORUS
Fit’retn bemiyasmr benatu limena
Kristos yimaren meheri newna (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'lemaryam-negeni', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Lemen Telahegn Wendeme (lemen-telahegn-wendeme)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 1
የተካፈልኩትን ንብረት አጥፍቸ ብመለስ ዛሬ
አባቴ ናፍቆኝ ብመጣ ልቤን አንገቴን ሰብሬ
ለሁላችንም ይበቃል ብዙነው የሱ መንግስት
አይክፋህ ባክህ ወንድሜ ፍቅር ይበልጣል ከሀብት

VERSE 2
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወንድሜ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 3
ፊትህ በሃዘን አይጥቆር ድንጋዩን ጣለው ወንድሜ
ተቅበዝባዥ እንዳያደርግ እጅህ ቆሽሾ በደሜ
ልብህን መልካም ብታደርግ ያንተም መስዋእት ያረጋል
ጌታ ለሁሉም እኩል ነው መታዘዝ ንጉስ ያደርጋል

VERSE 4
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 5
ብልጥ ስለሆንኩ አይደለም የተባረኩት በጌታ
ጽኑ መሻቴን አይቶ ነው በኩር ያደረገኝ ስመታ
የበቀል ጦርክን ሸሽቼ በባእድ ሀገር ብኖርም
በልጅ በትዳር ባርኮኛል አብረን እንኑር በሰላም

VERSE 6
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን',
      lyrics_transliteration = 'Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 1
Yetekafelkutn nibret at’fche bimeles zare
Abate nafqogn bimet’a liben angeten sebre
Lehulachnm yibeqal bizunew yesu mengst
Aykfah bakh wendme fiqr yibelt’al kehebt

VERSE 2
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wendme yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 3
Fith behazen ayt’qor dingayun t’alew wendme
Teqbezbazh endayaderg ejh qoshsho bedeme
Libhn melkam bitaderg yantem meswaet yaregal
Geta lehulum ekul new metazez nigus yadergal

VERSE 4
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 5
Bilt’ silehonku aydelem yetebarekut begeta
Ts’nu meshaten ayto new bekur yaderegegn simeta
Yebeqel t’orkn sheshche bebaed heger binorm
Belj betdar barkognal abren ennur beselam

VERSE 6
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'lemen-telahegn-wendeme'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 1
የተካፈልኩትን ንብረት አጥፍቸ ብመለስ ዛሬ
አባቴ ናፍቆኝ ብመጣ ልቤን አንገቴን ሰብሬ
ለሁላችንም ይበቃል ብዙነው የሱ መንግስት
አይክፋህ ባክህ ወንድሜ ፍቅር ይበልጣል ከሀብት

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 2
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወንድሜ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 3
ፊትህ በሃዘን አይጥቆር ድንጋዩን ጣለው ወንድሜ
ተቅበዝባዥ እንዳያደርግ እጅህ ቆሽሾ በደሜ
ልብህን መልካም ብታደርግ ያንተም መስዋእት ያረጋል
ጌታ ለሁሉም እኩል ነው መታዘዝ ንጉስ ያደርጋል

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 4
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 5
ብልጥ ስለሆንኩ አይደለም የተባረኩት በጌታ
ጽኑ መሻቴን አይቶ ነው በኩር ያደረገኝ ስመታ
የበቀል ጦርክን ሸሽቼ በባእድ ሀገር ብኖርም
በልጅ በትዳር ባርኮኛል አብረን እንኑር በሰላም

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

VERSE 6
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን

CHORUS
ለምን ጠላሀኝ ወንድሜ ያንድ አባት ልጆች እኮነን /
ለምን ጠላሀኝ ወዳጄ ያንድ እናት ልጆች እኮነን
ብዙነው መንግስቱ አብረን እንወርሳለን
ስፊነው ግዛቱ አብረን እንወርሳለን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 1
Yetekafelkutn nibret at’fche bimeles zare
Abate nafqogn bimet’a liben angeten sebre
Lehulachnm yibeqal bizunew yesu mengst
Aykfah bakh wendme fiqr yibelt’al kehebt

CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 2
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wendme yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 3
Fith behazen ayt’qor dingayun t’alew wendme
Teqbezbazh endayaderg ejh qoshsho bedeme
Libhn melkam bitaderg yantem meswaet yaregal
Geta lehulum ekul new metazez nigus yadergal

CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 4
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 5
Bilt’ silehonku aydelem yetebarekut begeta
Ts’nu meshaten ayto new bekur yaderegegn simeta
Yebeqel t’orkn sheshche bebaed heger binorm
Belj betdar barkognal abren ennur beselam

CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

VERSE 6
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen

CHORUS
Lemn t’elahegn wendme yand abat lijoch ekonen /
Lemn t’elahegn wedaje yand enat lijoch ekonen
Bizunew mengstu abren enwersalen
Sifinew gizatu abren enwersalen'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'lemen-telahegn-wendeme', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Lemititeragn Leanite (lemititeragn-leanite)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ

VERSE 1
ለምትጠራኝ ላንተ ኃጢያቴን በሙሉ በአንተ ላይ ጥያለሁ
ለምትጠራኝ ላንተ በደሌን ክፋቴን እኔ እናዘዛለሁ
ለምትጠራኝ ላንተ የማትዘነጋኝ ነህ በዘመኔ ሁሉ
ለምትጠራኝ ላንተ ማረኝ ይቅር በለኝ ይብቃኝ መበደሉ

VERSE 2
ለምትጠራኝ ላንተ ከአፍህ የወጣው ቃል ያረሰርሰኛል
ለምትጠራኝ ላንተ ህግህን አድምጬ ህይወት ሆኖልኛል
ለምትጠራኝ ላንተ እንደ አንበሳ አድብቷል ያ ክፉ ጠላቴ
ለምትጠራኝ ላንተ ከልቤ እንዳይነቅለው ጠብቀኝ አባቴ

VERSE 3
ለምትጠራኝ ላንተ ወጀብ ቢያይልብኝ ቢከብደኝ ፈተና
ለምትጠራኝ ላንተ አምላኬ የአንተ ምክር ትጸናለችና
ለምትጠራኝ ላንተ ጌታውን የጠበቀ ይከብራል ብለሃል
ለምትጠራኝ ላንተ ነቅ የሌለው እምነት ከልቤ ተክለሃል

VERSE 4
ለምትጠራኝ ላንተ ድምጽህን ሰምቼ ልቤ እንዳይከብድብኝ
ለምትጠራኝ ላንተ ያስተማርከኝ ሁሉ ፍርድ እንዳይሆንብኝ
ለምትጠራኝ ላንተ በሰጠኸኝ ጸጋ እጠነቀቃለሁ
ለምትጠራኝ ላንተ ከቶ እንዳትወስድብኝ በእንባ ደምደሜያለሁ',
      lyrics_transliteration = 'Lemtt’eragn lante enbi endall ene
Mastewal adlegn behywet zemene
Mekreh astemreh fiqr yegelets’klgn
Yesemahutn qal lehywet arglgn

VERSE 1
Lemtt’eragn lante hat’iyaten bemulu beante lay t’yalehu
Lemtt’eragn lante bedelen kifaten ene enazezalehu
Lemtt’eragn lante yematzenegagn neh bezemene hulu
Lemtt’eragn lante maregn yiqr belegn yibqagn mebedelu

VERSE 2
Lemtt’eragn lante keafh yewet’aw qal yaresersegnal
Lemtt’eragn lante highn admch’e hiywet honolgnal
Lemtt’eragn lante ende anbesa adbtwal ya kifu t’elate
Lemtt’eragn lante kelbe endayneqlew t’ebqegn abate

VERSE 3
Lemtt’eragn lante wejeb biyaylbgn bikebdegn fetena
Lemtt’eragn lante amlake yeante mikr tits’enalechna
Lemtt’eragn lante getawn yet’ebeqe yikebral bilehal
Lemtt’eragn lante neq yelelew emnet kelbe teklehal

VERSE 4
Lemtt’eragn lante dimts’hn semche libe endaykebdbgn
Lemtt’eragn lante yastemarkegn hulu fird endayhonbgn
Lemtt’eragn lante beset’eኸgn ts’ega et’eneqeqalehu
Lemtt’eragn lante keto endatwesdbgn beenba demdemeyalehu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'lemititeragn-leanite'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ

VERSE 1
ለምትጠራኝ ላንተ ኃጢያቴን በሙሉ በአንተ ላይ ጥያለሁ
ለምትጠራኝ ላንተ በደሌን ክፋቴን እኔ እናዘዛለሁ
ለምትጠራኝ ላንተ የማትዘነጋኝ ነህ በዘመኔ ሁሉ
ለምትጠራኝ ላንተ ማረኝ ይቅር በለኝ ይብቃኝ መበደሉ

CHORUS
ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ

VERSE 2
ለምትጠራኝ ላንተ ከአፍህ የወጣው ቃል ያረሰርሰኛል
ለምትጠራኝ ላንተ ህግህን አድምጬ ህይወት ሆኖልኛል
ለምትጠራኝ ላንተ እንደ አንበሳ አድብቷል ያ ክፉ ጠላቴ
ለምትጠራኝ ላንተ ከልቤ እንዳይነቅለው ጠብቀኝ አባቴ

CHORUS
ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ

VERSE 3
ለምትጠራኝ ላንተ ወጀብ ቢያይልብኝ ቢከብደኝ ፈተና
ለምትጠራኝ ላንተ አምላኬ የአንተ ምክር ትጸናለችና
ለምትጠራኝ ላንተ ጌታውን የጠበቀ ይከብራል ብለሃል
ለምትጠራኝ ላንተ ነቅ የሌለው እምነት ከልቤ ተክለሃል

CHORUS
ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ

VERSE 4
ለምትጠራኝ ላንተ ድምጽህን ሰምቼ ልቤ እንዳይከብድብኝ
ለምትጠራኝ ላንተ ያስተማርከኝ ሁሉ ፍርድ እንዳይሆንብኝ
ለምትጠራኝ ላንተ በሰጠኸኝ ጸጋ እጠነቀቃለሁ
ለምትጠራኝ ላንተ ከቶ እንዳትወስድብኝ በእንባ ደምደሜያለሁ

CHORUS
ለምትጠራኝ ላንተ እንቢ እንዳልል እኔ
ማስተዋል አድለኝ በህይወት ዘመኔ
መክረህ አስተምረህ ፍቅር የገለፅክልኝ
የሰማሁትን ቃል ለህይወት አርግልኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lemtt’eragn lante enbi endall ene
Mastewal adlegn behywet zemene
Mekreh astemreh fiqr yegelets’klgn
Yesemahutn qal lehywet arglgn

VERSE 1
Lemtt’eragn lante hat’iyaten bemulu beante lay t’yalehu
Lemtt’eragn lante bedelen kifaten ene enazezalehu
Lemtt’eragn lante yematzenegagn neh bezemene hulu
Lemtt’eragn lante maregn yiqr belegn yibqagn mebedelu

CHORUS
Lemtt’eragn lante enbi endall ene
Mastewal adlegn behywet zemene
Mekreh astemreh fiqr yegelets’klgn
Yesemahutn qal lehywet arglgn

VERSE 2
Lemtt’eragn lante keafh yewet’aw qal yaresersegnal
Lemtt’eragn lante highn admch’e hiywet honolgnal
Lemtt’eragn lante ende anbesa adbtwal ya kifu t’elate
Lemtt’eragn lante kelbe endayneqlew t’ebqegn abate

CHORUS
Lemtt’eragn lante enbi endall ene
Mastewal adlegn behywet zemene
Mekreh astemreh fiqr yegelets’klgn
Yesemahutn qal lehywet arglgn

VERSE 3
Lemtt’eragn lante wejeb biyaylbgn bikebdegn fetena
Lemtt’eragn lante amlake yeante mikr tits’enalechna
Lemtt’eragn lante getawn yet’ebeqe yikebral bilehal
Lemtt’eragn lante neq yelelew emnet kelbe teklehal

CHORUS
Lemtt’eragn lante enbi endall ene
Mastewal adlegn behywet zemene
Mekreh astemreh fiqr yegelets’klgn
Yesemahutn qal lehywet arglgn

VERSE 4
Lemtt’eragn lante dimts’hn semche libe endaykebdbgn
Lemtt’eragn lante yastemarkegn hulu fird endayhonbgn
Lemtt’eragn lante beset’eኸgn ts’ega et’eneqeqalehu
Lemtt’eragn lante keto endatwesdbgn beenba demdemeyalehu

CHORUS
Lemtt’eragn lante enbi endall ene
Mastewal adlegn behywet zemene
Mekreh astemreh fiqr yegelets’klgn
Yesemahutn qal lehywet arglgn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'lemititeragn-leanite', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Lene Yederegew Mikaiel Bizu New (lene-yederegew-mikaiel-bizu-new)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ለኔ የደረገው ሚካኤል ብዙ ነው (፪)
ከእግዚአብሔር ተልኮ ድንቅ ነገር አደረገልኝ
አፅነኝና እርዳት ሚካኤል ሆነኝ

VERSE 1
ታናሽ ብላቴና ስምክህን የማልረሳ
ደግፈኝ ሚካኤል ስውድቅ እንድነሳ
ስምህን በልቤ ፅላት እፅፋለሁ
በክንፎች ጥለ ዛሬም አርፈለሁ

VERSE 2
ወለታ እንዳይጠፋ ሁሌም ከሀሰቤ
ሚካኤል ሰልለይ ፍቅርህን ከልቤ
አንተ የዋህ መለአክ የርግብ አምሰል
የብርሃን አክሊል ነህ ሚካኤል ሃያል

VERSE 3
ለኔ ያለው ፍቅር በአይኔ አይቼዋለሁ
ውለታህን ሳስብ እጅግ አደንቀለሁ
በነፍስም በሥጋ ነህ መታመኛዬ
የሚጠብቀኝ መከታ ጋሸዬ

VERSE 4
ስወጣ ስገባ ከልሎኝ ከእንቅፋት
ሚካኤል ጠብቀኝ ከሚገጠመኝ ጥፋት
ደግ ነው ሚካኤል ፍቅሩ በዝቶልኛል
በዘመኔ ሁሉ እርሱ ይረደኛል',
      lyrics_transliteration = 'Lene yederegew Mikaiel bizu new (2)
KeEgziabhier telko dink neger aderegelign
Atsenegnna erdat Mikaiel honegn

VERSE 1
Tanash blatenna smkehn yemalresa
Degfegn Mikaiel swdqi endenesa
Smhen belbie tslat itsfalehu
Bekinfoch tile zarem arefelehu

VERSE 2
Weleta endaytefa hulem kehasbie
Mikaiel selley fiqren kelbie
Ante yewah melaek yergib amsel
Yebrhan aklil neh Mikaiel hayal

VERSE 3
Lene yalew fiqer beayne aychewalehu
Weletahn sasib ejig adenqelehu
Benefsim besga neh metamenyaye
Yemit''ebeqegn meketta gasheye

VERSE 4
Seweta sigeiba kellogn keenkifat
Mikaiel tebqegn kemigetamgn tifat
Deg new Mikaiel fiqru beztolegnal
Bezemenie hulu ersu yiredagnal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'lene-yederegew-mikaiel-bizu-new'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለኔ የደረገው ሚካኤል ብዙ ነው (፪)
ከእግዚአብሔር ተልኮ ድንቅ ነገር አደረገልኝ
አፅነኝና እርዳት ሚካኤል ሆነኝ

VERSE 1
ታናሽ ብላቴና ስምክህን የማልረሳ
ደግፈኝ ሚካኤል ስውድቅ እንድነሳ
ስምህን በልቤ ፅላት እፅፋለሁ
በክንፎች ጥለ ዛሬም አርፈለሁ

CHORUS
ለኔ የደረገው ሚካኤል ብዙ ነው (፪)
ከእግዚአብሔር ተልኮ ድንቅ ነገር አደረገልኝ
አፅነኝና እርዳት ሚካኤል ሆነኝ

VERSE 2
ወለታ እንዳይጠፋ ሁሌም ከሀሰቤ
ሚካኤል ሰልለይ ፍቅርህን ከልቤ
አንተ የዋህ መለአክ የርግብ አምሰል
የብርሃን አክሊል ነህ ሚካኤል ሃያል

CHORUS
ለኔ የደረገው ሚካኤል ብዙ ነው (፪)
ከእግዚአብሔር ተልኮ ድንቅ ነገር አደረገልኝ
አፅነኝና እርዳት ሚካኤል ሆነኝ

VERSE 3
ለኔ ያለው ፍቅር በአይኔ አይቼዋለሁ
ውለታህን ሳስብ እጅግ አደንቀለሁ
በነፍስም በሥጋ ነህ መታመኛዬ
የሚጠብቀኝ መከታ ጋሸዬ

CHORUS
ለኔ የደረገው ሚካኤል ብዙ ነው (፪)
ከእግዚአብሔር ተልኮ ድንቅ ነገር አደረገልኝ
አፅነኝና እርዳት ሚካኤል ሆነኝ

VERSE 4
ስወጣ ስገባ ከልሎኝ ከእንቅፋት
ሚካኤል ጠብቀኝ ከሚገጠመኝ ጥፋት
ደግ ነው ሚካኤል ፍቅሩ በዝቶልኛል
በዘመኔ ሁሉ እርሱ ይረደኛል

CHORUS
ለኔ የደረገው ሚካኤል ብዙ ነው (፪)
ከእግዚአብሔር ተልኮ ድንቅ ነገር አደረገልኝ
አፅነኝና እርዳት ሚካኤል ሆነኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lene yederegew Mikaiel bizu new (2)
KeEgziabhier telko dink neger aderegelign
Atsenegnna erdat Mikaiel honegn

VERSE 1
Tanash blatenna smkehn yemalresa
Degfegn Mikaiel swdqi endenesa
Smhen belbie tslat itsfalehu
Bekinfoch tile zarem arefelehu

CHORUS
Lene yederegew Mikaiel bizu new (2)
KeEgziabhier telko dink neger aderegelign
Atsenegnna erdat Mikaiel honegn

VERSE 2
Weleta endaytefa hulem kehasbie
Mikaiel selley fiqren kelbie
Ante yewah melaek yergib amsel
Yebrhan aklil neh Mikaiel hayal

CHORUS
Lene yederegew Mikaiel bizu new (2)
KeEgziabhier telko dink neger aderegelign
Atsenegnna erdat Mikaiel honegn

VERSE 3
Lene yalew fiqer beayne aychewalehu
Weletahn sasib ejig adenqelehu
Benefsim besga neh metamenyaye
Yemit''ebeqegn meketta gasheye

CHORUS
Lene yederegew Mikaiel bizu new (2)
KeEgziabhier telko dink neger aderegelign
Atsenegnna erdat Mikaiel honegn

VERSE 4
Seweta sigeiba kellogn keenkifat
Mikaiel tebqegn kemigetamgn tifat
Deg new Mikaiel fiqru beztolegnal
Bezemenie hulu ersu yiredagnal

CHORUS
Lene yederegew Mikaiel bizu new (2)
KeEgziabhier telko dink neger aderegelign
Atsenegnna erdat Mikaiel honegn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'lene-yederegew-mikaiel-bizu-new', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Lenefise Nefiswa Nesh Lemenigede Fana (lenefise-nefiswa-nesh-lemenigede-fana)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 1
አንቺ ግን አንዲት ነሽ የለሽም ጭማሪ
ትኖሪያለሽ እንጂ ትውልድ ስታስምሪ
ያንቺን ሥም ተማጽኖ ያንቺን ሥም ቀድሶ
አንቺን አመስግኖ አንቺን አወድሶ

VERSE 2
የተጠቀመ እንጂ በረከት አግኝቶ
አልታየም እስካሁን የተጎዳ ከቶ
ጎርጎርዮስና ሊቁ ዮሐንስ
አትናቴዎስና ሊቁ ባስልዮስ

VERSE 3
አባ ኤፍሬምና አባ ጊዮርጊስ
ተጠቅመዋል በአንቺ በሥጋም በነፍስ
አባትህን ጠይቅ ስለሚለን ቃሉ
ብንጠይቃቸው ቅዱሳኑን ሁሉ

VERSE 4
ስላንቺ ነገሩን ክብር ተዓምራትሽን
ለሰው ዘር በሙሉ አማላጅ መሆንሽን
ገብርኤል ከሰማይ ኤልሳቤጥ ከምድር
በአንድ መሠከሩ ስለ ድንግል ክብር

VERSE 5
ሰዓሊ ለነ ብሎ ተማጽኖ በአንቺ ስም
የተጠቀመ እንጂ የተጎዳ የለም',
      lyrics_transliteration = 'Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehadis binzerezrachew

VERSE 1
Anchi gin andit nesh yeleshm ch’mari
Tinoriyalesh enji tiwld sitasmri
Yanchin sim temats’no yanchin sim qedso
Anchin amesgno anchin awedso

VERSE 2
Yetet’eqeme enji bereket aggnto
Altayem eskahun yetegoda keto
Gorgoryosna liqu yohens
Atnatewosna liqu baslyos

VERSE 3
Aba efremna aba Giyorgis
Tet’eqmewal beanchi besgam benefs
Abathn t’eyq silemilen qalu
Bint’eyqachew qidusanun hulu

VERSE 4
Silanchi negerun kibir teamratshn
Lesew zer bemulu amalaj mehonshn
Gebriel kesemay elsabet’ kemdr
Beand mesekeru sile Dingil kibir

VERSE 5
Seali lene bilo temats’no beanchi sim
Yetet’eqeme enji yetegoda yelem',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'lenefise-nefiswa-nesh-lemenigede-fana'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 1
አንቺ ግን አንዲት ነሽ የለሽም ጭማሪ
ትኖሪያለሽ እንጂ ትውልድ ስታስምሪ
ያንቺን ሥም ተማጽኖ ያንቺን ሥም ቀድሶ
አንቺን አመስግኖ አንቺን አወድሶ

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 2
የተጠቀመ እንጂ በረከት አግኝቶ
አልታየም እስካሁን የተጎዳ ከቶ
ጎርጎርዮስና ሊቁ ዮሐንስ
አትናቴዎስና ሊቁ ባስልዮስ

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 3
አባ ኤፍሬምና አባ ጊዮርጊስ
ተጠቅመዋል በአንቺ በሥጋም በነፍስ
አባትህን ጠይቅ ስለሚለን ቃሉ
ብንጠይቃቸው ቅዱሳኑን ሁሉ

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 4
ስላንቺ ነገሩን ክብር ተዓምራትሽን
ለሰው ዘር በሙሉ አማላጅ መሆንሽን
ገብርኤል ከሰማይ ኤልሳቤጥ ከምድር
በአንድ መሠከሩ ስለ ድንግል ክብር

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው

VERSE 5
ሰዓሊ ለነ ብሎ ተማጽኖ በአንቺ ስም
የተጠቀመ እንጂ የተጎዳ የለም

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና/2/
የፃድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሃዲስ ብንዘረዝራቸው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehadis binzerezrachew

VERSE 1
Anchi gin andit nesh yeleshm ch’mari
Tinoriyalesh enji tiwld sitasmri
Yanchin sim temats’no yanchin sim qedso
Anchin amesgno anchin awedso

CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehadis binzerezrachew

VERSE 2
Yetet’eqeme enji bereket aggnto
Altayem eskahun yetegoda keto
Gorgoryosna liqu yohens
Atnatewosna liqu baslyos

CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehadis binzerezrachew

VERSE 3
Aba efremna aba Giyorgis
Tet’eqmewal beanchi besgam benefs
Abathn t’eyq silemilen qalu
Bint’eyqachew qidusanun hulu

CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehadis binzerezrachew

VERSE 4
Silanchi negerun kibir teamratshn
Lesew zer bemulu amalaj mehonshn
Gebriel kesemay elsabet’ kemdr
Beand mesekeru sile Dingil kibir

CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehadis binzerezrachew

VERSE 5
Seali lene bilo temats’no beanchi sim
Yetet’eqeme enji yetegoda yelem

CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehadis binzerezrachew'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'lenefise-nefiswa-nesh-lemenigede-fana', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: lenefse nefswa mindaye birhanu (lenefse-nefswa-mindaye-birhanu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና /2/
የጻድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሐዲስ ብንዘረዝራቸው

VERSE 1
አንቺ ግን አንዲት ነሽ የለሽም ጭማሪ
ትኖሪያለሽ እንጂ ትውልድ ስታስምሪ
የአንቺን ስም ተማጽኖ የአንቺን ስም ቀድሶ
አንቺን አመስግኖ አንቺን አወድሶ

VERSE 2
የተጠቀመ እንጂ በረከት አግኝቶ
አልታየም እስካሁን የተጎዳ ከቶ
ጎርጎርዮስና ሊቁ ዮሐንስ
አትናቴዎስና ሊቁ ባስልዮስ

VERSE 3
አባ ኤፍሬምና አባ ጊዮርጊ
ተጠቅመዋል በአንቺ በስጋም በነፍስ
አባትህን ጠይቅ ስለሚለን ቃሉ
ብንጠይቃቸው ቅዱሳኑን ሁሉ

VERSE 4
ስለአንቺ ነገሩን ክብር ተዓምራትሽን
ለሰው ዘር በሙሉ አማላጅ መሆንሽን
ገብርኤል ከሰማይ ኤልሳቤጥ ከምድር
በአንድ መሰከሩ ስለ ድንግል ክብር

VERSE 5
ሰዓሊ ለነ ብሎ ተማጽኖ በአንቺ ስም
የተጠቀመ እንጂ የተጎዳ የለም',
      lyrics_transliteration = 'Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehedis binzerezrachew

VERSE 1
Anchi gin andit nesh yeleshm ch’mari
Tinoriyalesh enji tiwld sitasmri
Yeanchin sim temats’no yeanchin sim qedso
Anchin amesgno anchin awedso

VERSE 2
Yetet’eqeme enji bereket aggnto
Altayem eskahun yetegoda keto
Gorgoryosna liqu yohens
Atnatewosna liqu baslyos

VERSE 3
Aba efremna aba giyorgi
Tet’eqmewal beanchi besgam benefs
Abathn t’eyq silemilen qalu
Bint’eyqachew qidusanun hulu

VERSE 4
Sileanchi negerun kibir teamratshn
Lesew zer bemulu amalaj mehonshn
Gebriel kesemay elsabet’ kemdr
Beand mesekeru sile Dingil kibir

VERSE 5
Seali lene bilo temats’no beanchi sim
Yetet’eqeme enji yetegoda yelem',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'lenefse-nefswa-mindaye-birhanu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና /2/
የጻድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሐዲስ ብንዘረዝራቸው

VERSE 1
አንቺ ግን አንዲት ነሽ የለሽም ጭማሪ
ትኖሪያለሽ እንጂ ትውልድ ስታስምሪ
የአንቺን ስም ተማጽኖ የአንቺን ስም ቀድሶ
አንቺን አመስግኖ አንቺን አወድሶ

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና /2/
የጻድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሐዲስ ብንዘረዝራቸው

VERSE 2
የተጠቀመ እንጂ በረከት አግኝቶ
አልታየም እስካሁን የተጎዳ ከቶ
ጎርጎርዮስና ሊቁ ዮሐንስ
አትናቴዎስና ሊቁ ባስልዮስ

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና /2/
የጻድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሐዲስ ብንዘረዝራቸው

VERSE 3
አባ ኤፍሬምና አባ ጊዮርጊ
ተጠቅመዋል በአንቺ በስጋም በነፍስ
አባትህን ጠይቅ ስለሚለን ቃሉ
ብንጠይቃቸው ቅዱሳኑን ሁሉ

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና /2/
የጻድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሐዲስ ብንዘረዝራቸው

VERSE 4
ስለአንቺ ነገሩን ክብር ተዓምራትሽን
ለሰው ዘር በሙሉ አማላጅ መሆንሽን
ገብርኤል ከሰማይ ኤልሳቤጥ ከምድር
በአንድ መሰከሩ ስለ ድንግል ክብር

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና /2/
የጻድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሐዲስ ብንዘረዝራቸው

VERSE 5
ሰዓሊ ለነ ብሎ ተማጽኖ በአንቺ ስም
የተጠቀመ እንጂ የተጎዳ የለም

CHORUS
ለነፍሴ ነፍሷ ነሽ ለመንገዴ ፋና
እንዳልጠፋ አምናለሁ የአንቺ ልጅ ነኝና /2/
የጻድቃን እናቶች እጅግ ብዙ ናቸው
ከብሉይ ከሐዲስ ብንዘረዝራቸው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehedis binzerezrachew

VERSE 1
Anchi gin andit nesh yeleshm ch’mari
Tinoriyalesh enji tiwld sitasmri
Yeanchin sim temats’no yeanchin sim qedso
Anchin amesgno anchin awedso

CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehedis binzerezrachew

VERSE 2
Yetet’eqeme enji bereket aggnto
Altayem eskahun yetegoda keto
Gorgoryosna liqu yohens
Atnatewosna liqu baslyos

CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehedis binzerezrachew

VERSE 3
Aba efremna aba giyorgi
Tet’eqmewal beanchi besgam benefs
Abathn t’eyq silemilen qalu
Bint’eyqachew qidusanun hulu

CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehedis binzerezrachew

VERSE 4
Sileanchi negerun kibir teamratshn
Lesew zer bemulu amalaj mehonshn
Gebriel kesemay elsabet’ kemdr
Beand mesekeru sile Dingil kibir

CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehedis binzerezrachew

VERSE 5
Seali lene bilo temats’no beanchi sim
Yetet’eqeme enji yetegoda yelem

CHORUS
Lenefse nefswa nesh lemengede fana
Endalt’efa amnalehu yeanchi lij negnna (2)
Yets’adqan enatoch ejg bizu nachew
Kebluy kehedis binzerezrachew'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'lenefse-nefswa-mindaye-birhanu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Let us give praise (let-us-give-praise)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'Let us give praise (2) to the Almighty God
We praise Him for He is glorified (2)

VERSE 1
We have crossed through the sea the waters have run dry
Upon our enemies triumphantly we rise
We were freed from their hold the chains of slavery
The bread that gives us life is truly heavenly

VERSE 2
Trials that caused us fear abundant they all were
We have passed through them all with our Lord and Savior
Though we may lose our strength weakened by obstacles
Our salvation is God He makes all possible

VERSE 3
We drank holy water that flowed from the boulder
We praise God Almighty who is full of wonder
Come all let us rejoice our lives have been redeemed
Our enemy Satan he has left in defeat',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'let-us-give-praise'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Let us give praise (2) to the Almighty God
We praise Him for He is glorified (2)

VERSE 1
We have crossed through the sea the waters have run dry
Upon our enemies triumphantly we rise
We were freed from their hold the chains of slavery
The bread that gives us life is truly heavenly

CHORUS
Let us give praise (2) to the Almighty God
We praise Him for He is glorified (2)

VERSE 2
Trials that caused us fear abundant they all were
We have passed through them all with our Lord and Savior
Though we may lose our strength weakened by obstacles
Our salvation is God He makes all possible

CHORUS
Let us give praise (2) to the Almighty God
We praise Him for He is glorified (2)

VERSE 3
We drank holy water that flowed from the boulder
We praise God Almighty who is full of wonder
Come all let us rejoice our lives have been redeemed
Our enemy Satan he has left in defeat

CHORUS
Let us give praise (2) to the Almighty God
We praise Him for He is glorified (2)'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'let-us-give-praise', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Letaot Anisegidim Bilew (letaot-anisegidim-bilew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/

VERSE 1
በንጉሱ ቁጣ ልባቸው ሳይርድ
አንዳችም ሣይፈሩ በእሣቱ መንደድ
በእምነት በርትተው መከራን ታገሱ
የታመኑት ጌታ ፈረደ ለነሱ

VERSE 2
በመካከል ታየ ከእነሱ ጋር
መላኩ ገብርኤል ታዞ ከእግዚአብሔር
በእሳቱ መካከል ምስጋናን ጀመሩ
ስቡህ እኔ ብለው ለስሙ ዘመሩ

VERSE 3
የሳቱን ነበልባል ውሀ እያደረገ
የእግዚአብሔር መላክ ነብሳቱን ታደገ
አንዳች ሳይነኩ ከእሳቱ ወጡ
የእግዚአብሔርን ክብር ለዓለም ገለጡ

VERSE 4
ተመላልሰው ታዩ በእሳቱ መሀል
ከራሳቸው ፀጉር አንዲቶአ ሳትጎል
የቀለዳውያን የእሳት ምድጃቸው
ህፃናቱን ትቶ እነሱን በላቸው',
      lyrics_transliteration = 'Let’aot ansegdm bilew 3tu hits’anat embi alu
Yemnamelkew amlak kesat yawet’al eyalu (2)

VERSE 1
Bengusu qut’a libachew sayrd
Andachm sayferu beesatu mended
Beemnet berttew mekeran tagesu
Yetamenut Geta ferede lenesu

VERSE 2
Bemekakel taye keenesu gar
Melaku Gebriel tazo keegziabher
Beesatu mekakel misganan jemeru
Sibuh ene bilew lesmu zemeru

VERSE 3
Yesatun nebelbal wihe eyaderege
YeEgziabher melak nebsatun tadege
Andach sayneku keesatu wet’u
Yeegziabhern kibir lealem gelet’u

VERSE 4
Temelalsew tayu beesatu mehel
Kerasachew ts’egur anditoa satgol
Yeqeledawyan yeesat midjachew
Hits’anatun tito enesun belachew',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'letaot-anisegidim-bilew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/

VERSE 1
በንጉሱ ቁጣ ልባቸው ሳይርድ
አንዳችም ሣይፈሩ በእሣቱ መንደድ
በእምነት በርትተው መከራን ታገሱ
የታመኑት ጌታ ፈረደ ለነሱ

CHORUS
ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/

VERSE 2
በመካከል ታየ ከእነሱ ጋር
መላኩ ገብርኤል ታዞ ከእግዚአብሔር
በእሳቱ መካከል ምስጋናን ጀመሩ
ስቡህ እኔ ብለው ለስሙ ዘመሩ

CHORUS
ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/

VERSE 3
የሳቱን ነበልባል ውሀ እያደረገ
የእግዚአብሔር መላክ ነብሳቱን ታደገ
አንዳች ሳይነኩ ከእሳቱ ወጡ
የእግዚአብሔርን ክብር ለዓለም ገለጡ

CHORUS
ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/

VERSE 4
ተመላልሰው ታዩ በእሳቱ መሀል
ከራሳቸው ፀጉር አንዲቶአ ሳትጎል
የቀለዳውያን የእሳት ምድጃቸው
ህፃናቱን ትቶ እነሱን በላቸው

CHORUS
ለጣኦት አንሰግድም ብለው 3ቱ ህፃናት እምቢ አሉ
የምናመልከው አምላክ ከሣት ያወጣል እያሉ/2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Let’aot ansegdm bilew 3tu hits’anat embi alu
Yemnamelkew amlak kesat yawet’al eyalu (2)

VERSE 1
Bengusu qut’a libachew sayrd
Andachm sayferu beesatu mended
Beemnet berttew mekeran tagesu
Yetamenut Geta ferede lenesu

CHORUS
Let’aot ansegdm bilew 3tu hits’anat embi alu
Yemnamelkew amlak kesat yawet’al eyalu (2)

VERSE 2
Bemekakel taye keenesu gar
Melaku Gebriel tazo keegziabher
Beesatu mekakel misganan jemeru
Sibuh ene bilew lesmu zemeru

CHORUS
Let’aot ansegdm bilew 3tu hits’anat embi alu
Yemnamelkew amlak kesat yawet’al eyalu (2)

VERSE 3
Yesatun nebelbal wihe eyaderege
YeEgziabher melak nebsatun tadege
Andach sayneku keesatu wet’u
Yeegziabhern kibir lealem gelet’u

CHORUS
Let’aot ansegdm bilew 3tu hits’anat embi alu
Yemnamelkew amlak kesat yawet’al eyalu (2)

VERSE 4
Temelalsew tayu beesatu mehel
Kerasachew ts’egur anditoa satgol
Yeqeledawyan yeesat midjachew
Hits’anatun tito enesun belachew

CHORUS
Let’aot ansegdm bilew 3tu hits’anat embi alu
Yemnamelkew amlak kesat yawet’al eyalu (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'letaot-anisegidim-bilew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Lewahiyu Liba # (lewahiyu-liba)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ

VERSE 1
ወዲ ሰብ ክጠፍእ ልባ ዘይገብረላ
ኪዳና ኣሚኑ ኣደይ ንዝበላ
ዓስብ ዘይትከልኦ ንዝተማሕጽና
ፍጹም እትረድኦ ብፍቅሪ ጠሚታ(3)

VERSE 2
ኣብቲ ህሮሩማ ኣብቲ ሽግር ግዜ
ኣብቲ ምድረበዳ ሓዘን ምስ ትካዜ
ደቀይ ይንድያ ትብል ንብዓት ኣቀዲማ
ጸግዒ ናይ ውጹዓት ጸገምና ጸገማ (3)

VERSE 3
ንድኹማን ትቀውም ኣብ የማን ወዳ
ፍጹም ኸይንጠፍእ ምሕረት ዝልማዳ
ኣሕሊፋ ዘይትህብ ዘውትር ኣማሊዳ
ጽብቁና ትምነ ''ደ'' ፍቅርና ዘንድዳ (3)

VERSE 4
ዘይትጠፍእ ብርሃን ናይ ኩሉና ተስፋ
ጸልማትና ኣብሪሃቶ ጸሓይ ተወንዚፋ
ብርሃንዩ መንገድና ማርያምና ሒዝና
ለዋህዩ ድዩ ልባ ርህርህተ ህሊና (3)',
      lyrics_transliteration = 'Lewahyu liba ch’kane zeyfelt’o
Sima zits’ewea hasabu ziselt’o
Nidኹm nihat’e tesfu tiኾno
Ts’ega maldota mihretyu ziኾno

VERSE 1
Wedi seb kit’efe liba zeygebrela
Kidana aminu adey nizbela
Asb zeytkelo niztemahts’na
Fits’um etredo bifqri t’emita (3)

VERSE 2
Abti hiroruma abti shgr gize
Abti midrebeda hazen mis tikaze
Deqey yindya tibl nibat aqedima
Ts’egi nay wits’uat ts’egemna ts’egema (3)

VERSE 3
Nidኹman tiqewm ab yeman weda
Fits’um ኸynt’efe mihret zilmada
Ahlifa zeythb zewtr amalida
Ts’bquna timne ''de'' fiqrna zendda (3)

VERSE 4
Zeytt’efe birhan nay kuluna tesfa
Ts’elmatna abrihato ts’ehay tewenzifa
Birhanyu mengedna maryamna hizna
Lewahyu diyu liba rihrhte hilina (3)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'lewahiyu-liba'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ

VERSE 1
ወዲ ሰብ ክጠፍእ ልባ ዘይገብረላ
ኪዳና ኣሚኑ ኣደይ ንዝበላ
ዓስብ ዘይትከልኦ ንዝተማሕጽና
ፍጹም እትረድኦ ብፍቅሪ ጠሚታ(3)

CHORUS
ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ

VERSE 2
ኣብቲ ህሮሩማ ኣብቲ ሽግር ግዜ
ኣብቲ ምድረበዳ ሓዘን ምስ ትካዜ
ደቀይ ይንድያ ትብል ንብዓት ኣቀዲማ
ጸግዒ ናይ ውጹዓት ጸገምና ጸገማ (3)

CHORUS
ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ

VERSE 3
ንድኹማን ትቀውም ኣብ የማን ወዳ
ፍጹም ኸይንጠፍእ ምሕረት ዝልማዳ
ኣሕሊፋ ዘይትህብ ዘውትር ኣማሊዳ
ጽብቁና ትምነ ''ደ'' ፍቅርና ዘንድዳ (3)

CHORUS
ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ

VERSE 4
ዘይትጠፍእ ብርሃን ናይ ኩሉና ተስፋ
ጸልማትና ኣብሪሃቶ ጸሓይ ተወንዚፋ
ብርሃንዩ መንገድና ማርያምና ሒዝና
ለዋህዩ ድዩ ልባ ርህርህተ ህሊና (3)

CHORUS
ለዋህዩ ልባ ጭካነ ዘይፈልጦ
ስማ ዝጸወዐ ሓሳቡ ዝሰልጦ
ንድኹም ንሓጥእ ተስፍኡ ትኾኖ
ጸጋ ማልዶታ ምሕረትዩ ዝኾኖ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lewahyu liba ch’kane zeyfelt’o
Sima zits’ewea hasabu ziselt’o
Nidኹm nihat’e tesfu tiኾno
Ts’ega maldota mihretyu ziኾno

VERSE 1
Wedi seb kit’efe liba zeygebrela
Kidana aminu adey nizbela
Asb zeytkelo niztemahts’na
Fits’um etredo bifqri t’emita (3)

CHORUS
Lewahyu liba ch’kane zeyfelt’o
Sima zits’ewea hasabu ziselt’o
Nidኹm nihat’e tesfu tiኾno
Ts’ega maldota mihretyu ziኾno

VERSE 2
Abti hiroruma abti shgr gize
Abti midrebeda hazen mis tikaze
Deqey yindya tibl nibat aqedima
Ts’egi nay wits’uat ts’egemna ts’egema (3)

CHORUS
Lewahyu liba ch’kane zeyfelt’o
Sima zits’ewea hasabu ziselt’o
Nidኹm nihat’e tesfu tiኾno
Ts’ega maldota mihretyu ziኾno

VERSE 3
Nidኹman tiqewm ab yeman weda
Fits’um ኸynt’efe mihret zilmada
Ahlifa zeythb zewtr amalida
Ts’bquna timne ''de'' fiqrna zendda (3)

CHORUS
Lewahyu liba ch’kane zeyfelt’o
Sima zits’ewea hasabu ziselt’o
Nidኹm nihat’e tesfu tiኾno
Ts’ega maldota mihretyu ziኾno

VERSE 4
Zeytt’efe birhan nay kuluna tesfa
Ts’elmatna abrihato ts’ehay tewenzifa
Birhanyu mengedna maryamna hizna
Lewahyu diyu liba rihrhte hilina (3)

CHORUS
Lewahyu liba ch’kane zeyfelt’o
Sima zits’ewea hasabu ziselt’o
Nidኹm nihat’e tesfu tiኾno
Ts’ega maldota mihretyu ziኾno'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'lewahiyu-liba', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Libe Yawikewal (libe-yawikewal)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 1
መስቀል ተሸክመል በደም ርሰህ
እኔን በመከራ ዳግም ወልድህ
በክብር ተሻገርኩ ክስህልኝ
በሕይወት አቆምከኝ ወድቀህልኝ

VERSE 2
የበደሌን ጥር አቀበቱን
የባርነት ሰነድ እዳ ክሱን
አጥፍተኽው ጌታ መዳን ሆነ
እርቃኔ በእርቃንህ ተሸፈነ

VERSE 3
በፍቅርህ መኣዛ ረክቷል ልቤ
በማይቆም መዉደድህ ተከብቤ
የሕይወቴ ወደብ መስቀልህ ነው
ወጀብና ንፋስ የማይነቅለው

VERSE 4
የሾህ አክሊል ደፍተህ ኤልሻዳይ
እፎይ አለ ልብ ከስቃይ
ሆኖልኛል መዳን አንተ ታማህ
ነፃ ወጣሁ ሸክሜን ተሽክመህ

VERSE 5
ዙፍንህን አሰተውህ የኔ ፍቅር
ከሰማይ ሀገርህ መጣህ ከምድር
ታየህ ስትፍልጉኝ ልጅ ብልህ
ፈራጅና አፅዳቂ አምላኬ ነህ',
      lyrics_transliteration = 'Libe yawuqewal yaderekln neger
Yesrahlgnn sira
Medhanealem awet’aኽgn kemekera
Beqal gulbet aywera

VERSE 1
Mesqel teshekmel bedem riseh
Enen bemekera dagm weldh
Bekbr teshagerku kishlgn
Behywet aqomkegn wedqehlgn

VERSE 2
Yebedelen t’r aqebetun
Yebarnet sened eda kisun
At’fteኽw Geta medan hone
Erqane beerqanh teshefene

VERSE 3
Befqrh meaza rektwal libe
Bemayqom mewudedh tekebbe
Yehywete wedeb mesqelh new
Wejebna nifas yemayneqlew

VERSE 4
Yeshoh aklil defteh elshaday
Efoy ale lib kesqay
Honolgnal medan ante tamah
Nets’a wet’ahu shekmen teshkmeh

VERSE 5
Zufnhn asetewh yene fiqr
Kesemay hegerh met’ah kemdr
Tayeh sitflgugn lij bilh
Ferajna ats’daqi amlake neh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'libe-yawikewal'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 1
መስቀል ተሸክመል በደም ርሰህ
እኔን በመከራ ዳግም ወልድህ
በክብር ተሻገርኩ ክስህልኝ
በሕይወት አቆምከኝ ወድቀህልኝ

CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 2
የበደሌን ጥር አቀበቱን
የባርነት ሰነድ እዳ ክሱን
አጥፍተኽው ጌታ መዳን ሆነ
እርቃኔ በእርቃንህ ተሸፈነ

CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 3
በፍቅርህ መኣዛ ረክቷል ልቤ
በማይቆም መዉደድህ ተከብቤ
የሕይወቴ ወደብ መስቀልህ ነው
ወጀብና ንፋስ የማይነቅለው

CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 4
የሾህ አክሊል ደፍተህ ኤልሻዳይ
እፎይ አለ ልብ ከስቃይ
ሆኖልኛል መዳን አንተ ታማህ
ነፃ ወጣሁ ሸክሜን ተሽክመህ

CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 5
ዙፍንህን አሰተውህ የኔ ፍቅር
ከሰማይ ሀገርህ መጣህ ከምድር
ታየህ ስትፍልጉኝ ልጅ ብልህ
ፈራጅና አፅዳቂ አምላኬ ነህ

CHORUS
ልቤ ያዉቀዋል ያደረክልን ነገር
የሥራህልኝን ሥራ
መድሃኔዓለም አወጣኽኝ ከመከራ
በቃል ጉልበት አይወራ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Libe yawuqewal yaderekln neger
Yesrahlgnn sira
Medhanealem awet’aኽgn kemekera
Beqal gulbet aywera

VERSE 1
Mesqel teshekmel bedem riseh
Enen bemekera dagm weldh
Bekbr teshagerku kishlgn
Behywet aqomkegn wedqehlgn

CHORUS
Libe yawuqewal yaderekln neger
Yesrahlgnn sira
Medhanealem awet’aኽgn kemekera
Beqal gulbet aywera

VERSE 2
Yebedelen t’r aqebetun
Yebarnet sened eda kisun
At’fteኽw Geta medan hone
Erqane beerqanh teshefene

CHORUS
Libe yawuqewal yaderekln neger
Yesrahlgnn sira
Medhanealem awet’aኽgn kemekera
Beqal gulbet aywera

VERSE 3
Befqrh meaza rektwal libe
Bemayqom mewudedh tekebbe
Yehywete wedeb mesqelh new
Wejebna nifas yemayneqlew

CHORUS
Libe yawuqewal yaderekln neger
Yesrahlgnn sira
Medhanealem awet’aኽgn kemekera
Beqal gulbet aywera

VERSE 4
Yeshoh aklil defteh elshaday
Efoy ale lib kesqay
Honolgnal medan ante tamah
Nets’a wet’ahu shekmen teshkmeh

CHORUS
Libe yawuqewal yaderekln neger
Yesrahlgnn sira
Medhanealem awet’aኽgn kemekera
Beqal gulbet aywera

VERSE 5
Zufnhn asetewh yene fiqr
Kesemay hegerh met’ah kemdr
Tayeh sitflgugn lij bilh
Ferajna ats’daqi amlake neh

CHORUS
Libe yawuqewal yaderekln neger
Yesrahlgnn sira
Medhanealem awet’aኽgn kemekera
Beqal gulbet aywera'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'libe-yawikewal', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Libe Yawikewal Yaderekilignin Neger (libe-yawikewal-yaderekilignin-neger)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ልቤ ያውቀዋል ያደረክልኝን ነገር
የሰራህልኝን ስራ
መድኃኔዓለም አወጣኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 1
መስቀል ተሸክመህ በደም ርሰህ
እኔን በመከራ ዳግም ወልደህ
በክብር ተሻገርኩ ክሰህልኝ
በሕይወት አቆምከኝ ወድቀህልኝ /2/

VERSE 2
የበደሌን ጋራ አቀበቱን
የባርነት ሰነድ እዳ ክሱን
አጥፍተኸው ጌታ መዳን ሆነ

VERSE 3
እርቃኔ በእርቃንህ ተሸፈነ /2/
በፍቅርህ መዓዛ ረክቷል ልቤ
በማይቆም መውደድህ ተከብቤ

VERSE 4
የሕይወቴ ወደብ መስቀልህ ነው
ወጀብ እና ነፋስ የማይነቅለው /2/
የእሾህ አክሊል ደፍተህ ኤልሻዳይ

VERSE 5
እፎይ አለ ልቤ ከስቃይ
ሆኖልኛል መዳን አንተ ታመህ
ነጻ ወጣው ሸክሜን ተሸክመህ /2/

VERSE 6
ዙፋንህን አስተወህ የእኔ ፍቅር
ከሰማይ ሀገርህ መጣህ ከምድር
ታየ ስትፈልገኝ ልጄ ብለህ
ፈራጅ እና አጽዳቂ አምላክ ሆነህ',
      lyrics_transliteration = 'Libe yawqewal yadereklgnn neger
Yeserahlgnn sira
Medhanealem awet’agn kemekera
Beqal gulbet aywera

VERSE 1
Mesqel teshekmeh bedem riseh
Enen bemekera dagm weldeh
Bekbr teshagerku kisehlgn
Behywet aqomkegn wedqehlgn (2)

VERSE 2
Yebedelen gara aqebetun
Yebarnet sened eda kisun
At’fteኸw Geta medan hone

VERSE 3
Erqane beerqanh teshefene (2)
Befqrh meaza rektwal libe
Bemayqom mewdedh tekebbe

VERSE 4
Yehywete wedeb mesqelh new
Wejeb ena nefas yemayneqlew (2)
Yeeshoh aklil defteh elshaday

VERSE 5
Efoy ale libe kesqay
Honolgnal medan ante tameh
Nets’a wet’aw shekmen teshekmeh (2)

VERSE 6
Zufanhn asteweh yeene fiqr
Kesemay hegerh met’ah kemdr
Taye sitfelgegn lije bileh
Feraj ena ats’daqi amlak honeh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'libe-yawikewal-yaderekilignin-neger'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ልቤ ያውቀዋል ያደረክልኝን ነገር
የሰራህልኝን ስራ
መድኃኔዓለም አወጣኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 1
መስቀል ተሸክመህ በደም ርሰህ
እኔን በመከራ ዳግም ወልደህ
በክብር ተሻገርኩ ክሰህልኝ
በሕይወት አቆምከኝ ወድቀህልኝ /2/

CHORUS
ልቤ ያውቀዋል ያደረክልኝን ነገር
የሰራህልኝን ስራ
መድኃኔዓለም አወጣኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 2
አዝ
የበደሌን ጋራ አቀበቱን
የባርነት ሰነድ እዳ ክሱን
አጥፍተኸው ጌታ መዳን ሆነ

CHORUS
ልቤ ያውቀዋል ያደረክልኝን ነገር
የሰራህልኝን ስራ
መድኃኔዓለም አወጣኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 3
እርቃኔ በእርቃንህ ተሸፈነ /2/
አዝ
በፍቅርህ መዓዛ ረክቷል ልቤ
በማይቆም መውደድህ ተከብቤ

CHORUS
ልቤ ያውቀዋል ያደረክልኝን ነገር
የሰራህልኝን ስራ
መድኃኔዓለም አወጣኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 4
የሕይወቴ ወደብ መስቀልህ ነው
ወጀብ እና ነፋስ የማይነቅለው /2/
አዝ
የእሾህ አክሊል ደፍተህ ኤልሻዳይ

CHORUS
ልቤ ያውቀዋል ያደረክልኝን ነገር
የሰራህልኝን ስራ
መድኃኔዓለም አወጣኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 5
እፎይ አለ ልቤ ከስቃይ
ሆኖልኛል መዳን አንተ ታመህ
ነጻ ወጣው ሸክሜን ተሸክመህ /2/
አዝ

CHORUS
ልቤ ያውቀዋል ያደረክልኝን ነገር
የሰራህልኝን ስራ
መድኃኔዓለም አወጣኝ ከመከራ
በቃል ጉልበት አይወራ

VERSE 6
ዙፋንህን አስተወህ የእኔ ፍቅር
ከሰማይ ሀገርህ መጣህ ከምድር
ታየ ስትፈልገኝ ልጄ ብለህ
ፈራጅ እና አጽዳቂ አምላክ ሆነህ

CHORUS
ልቤ ያውቀዋል ያደረክልኝን ነገር
የሰራህልኝን ስራ
መድኃኔዓለም አወጣኝ ከመከራ
በቃል ጉልበት አይወራ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Libe yawqewal yadereklgnn neger
Yeserahlgnn sira
Medhanealem awet’agn kemekera
Beqal gulbet aywera

VERSE 1
Mesqel teshekmeh bedem riseh
Enen bemekera dagm weldeh
Bekbr teshagerku kisehlgn
Behywet aqomkegn wedqehlgn (2)

CHORUS
Libe yawqewal yadereklgnn neger
Yeserahlgnn sira
Medhanealem awet’agn kemekera
Beqal gulbet aywera

VERSE 2
CHORUS
Yebedelen gara aqebetun
Yebarnet sened eda kisun
At’fteኸw Geta medan hone

CHORUS
Libe yawqewal yadereklgnn neger
Yeserahlgnn sira
Medhanealem awet’agn kemekera
Beqal gulbet aywera

VERSE 3
Erqane beerqanh teshefene (2)
CHORUS
Befqrh meaza rektwal libe
Bemayqom mewdedh tekebbe

CHORUS
Libe yawqewal yadereklgnn neger
Yeserahlgnn sira
Medhanealem awet’agn kemekera
Beqal gulbet aywera

VERSE 4
Yehywete wedeb mesqelh new
Wejeb ena nefas yemayneqlew (2)
CHORUS
Yeeshoh aklil defteh elshaday

CHORUS
Libe yawqewal yadereklgnn neger
Yeserahlgnn sira
Medhanealem awet’agn kemekera
Beqal gulbet aywera

VERSE 5
Efoy ale libe kesqay
Honolgnal medan ante tameh
Nets’a wet’aw shekmen teshekmeh (2)
CHORUS

CHORUS
Libe yawqewal yadereklgnn neger
Yeserahlgnn sira
Medhanealem awet’agn kemekera
Beqal gulbet aywera

VERSE 6
Zufanhn asteweh yeene fiqr
Kesemay hegerh met’ah kemdr
Taye sitfelgegn lije bileh
Feraj ena ats’daqi amlak honeh

CHORUS
Libe yawqewal yadereklgnn neger
Yeserahlgnn sira
Medhanealem awet’agn kemekera
Beqal gulbet aywera'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'libe-yawikewal-yaderekilignin-neger', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Libona Habeni (libona-habeni)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ክሒደካ ኣይኮንኩን ተታሊለ''የ እምበር
ፀሊአካ ኣይኮንኩን ደኪሙኒ እምበር
"ኣብ ደምበ ሓጥያተይ ሱቅ''ለ ዘዕወንዉን
ዓቅሚ ስኢነ እምበር መችኡኒ ኣይኮነን(2)

VERSE 1
ልበይ''ዛ ቤት መቅደስካ ብደምካ ዝተሃንፀት
ሰፈር ከፍኣት ገይረያ መናገዲ ናይ ሓጥያት
ዝከፈልካለይ ዋጋ ዘይ ከምንዓይ ቆፂረ
ኣብቲ ዝሰዓርካለይ እነኩ ተኣሲረ

VERSE 2
"ካብዚ ዘለክዎ ናይ ሓጥያት ባርነት
ፈንጢሰ ክወፅእ ስደደለይ ምሕረት
ከም እሳት ክቃፀል ፍቅርካ ኣብ ልበይ
ዘፀናንዐኒ መንፈሰ ልኣከለይ

VERSE 3
ኣዥማች
ንዓካን ንዓለምን ማዕረ ማዕረ ሰሪዐ
ነቲ ካልእ ከይሓድጎ ከይተርፈኒ ዉን''ቲ ሓደ
ብክልቲአን ኣእጋረይ ምሕንካሰ ልምደይ ኮይኑ

VERSE 4
ጎይታይ ቅድሰ መንፈስካ ኣብ ቤተይ ስፍራ ስኢኑ
"መሓረኒ ጎይታይ ካ���ዚ መንነተይ
ባርያ ክልተ ጎይቶት ካብዚ ማንታ ልበይ
ስጋይ ምሰ ትምኒቱ ምስቃል ክከኣለኒ

VERSE 5
ፍቅርካ ዘይርስዕ ልቦና ሃበኒ
ንዓካ ዘይርሰዕ ልቦና ሃበኒ(3)',
      lyrics_transliteration = 'Kihideka aykonkun tetalile''ye ember
Ts’eliaka aykonkun dekimuni ember
"ab dembe hat’yatey suq''le zeewenwun
Aqmi siine ember mechuni aykonen (2)

VERSE 1
Libey''za bet meqdeska bidemka zitehants’et
Sefer kefat geyreya menagedi nay hat’yat
Zikefelkaley waga zey kemnay qots’ire
Abti zisearkaley eneku teasire

VERSE 2
"kabzi zelekwo nay hat’yat barnet
Fent’ise kiwets’e sidedeley mihret
Kem esat kiqats’el fiqrka ab libey
Zets’enanani menfese liakeley

VERSE 3
Azhmach
Niakan nialemn maere maere seria
Neti kale keyhadgo keyterfeni wun''ti hade
Bikltian aegarey mihnkase limdey koynu

VERSE 4
Goytay qidse menfeska ab betey sifra siinu
"mehareni goytay ka���zi mennetey
Barya kilte goytot kabzi manta libey
Sigay mise timnitu misqal kikealeni

VERSE 5
Fiqrka zeyrse libona habeni
Niaka zeyrsee libona habeni (3)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'libona-habeni'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ክሒደካ ኣይኮንኩን ተታሊለ''የ እምበር
ፀሊአካ ኣይኮንኩን ደኪሙኒ እምበር
"ኣብ ደምበ ሓጥያተይ ሱቅ''ለ ዘዕወንዉን
ዓቅሚ ስኢነ እምበር መችኡኒ ኣይኮነን(2)

VERSE 1
ልበይ''ዛ ቤት መቅደስካ ብደምካ ዝተሃንፀት
ሰፈር ከፍኣት ገይረያ መናገዲ ናይ ሓጥያት
ዝከፈልካለይ ዋጋ ዘይ ከምንዓይ ቆፂረ
ኣብቲ ዝሰዓርካለይ እነኩ ተኣሲረ

CHORUS
ክሒደካ ኣይኮንኩን ተታሊለ''የ እምበር
ፀሊአካ ኣይኮንኩን ደኪሙኒ እምበር
"ኣብ ደምበ ሓጥያተይ ሱቅ''ለ ዘዕወንዉን
ዓቅሚ ስኢነ እምበር መችኡኒ ኣይኮነን(2)

VERSE 2
"ካብዚ ዘለክዎ ናይ ሓጥያት ባርነት
ፈንጢሰ ክወፅእ ስደደለይ ምሕረት
ከም እሳት ክቃፀል ፍቅርካ ኣብ ልበይ
ዘፀናንዐኒ መንፈሰ ልኣከለይ

CHORUS
ክሒደካ ኣይኮንኩን ተታሊለ''የ እምበር
ፀሊአካ ኣይኮንኩን ደኪሙኒ እምበር
"ኣብ ደምበ ሓጥያተይ ሱቅ''ለ ዘዕወንዉን
ዓቅሚ ስኢነ እምበር መችኡኒ ኣይኮነን(2)

VERSE 3
ኣዥማች
ንዓካን ንዓለምን ማዕረ ማዕረ ሰሪዐ
ነቲ ካልእ ከይሓድጎ ከይተርፈኒ ዉን''ቲ ሓደ
ብክልቲአን ኣእጋረይ ምሕንካሰ ልምደይ ኮይኑ

CHORUS
ክሒደካ ኣይኮንኩን ተታሊለ''የ እምበር
ፀሊአካ ኣይኮንኩን ደኪሙኒ እምበር
"ኣብ ደምበ ሓጥያተይ ሱቅ''ለ ዘዕወንዉን
ዓቅሚ ስኢነ እምበር መችኡኒ ኣይኮነን(2)

VERSE 4
ጎይታይ ቅድሰ መንፈስካ ኣብ ቤተይ ስፍራ ስኢኑ
"መሓረኒ ጎይታይ ካ���ዚ መንነተይ
ባርያ ክልተ ጎይቶት ካብዚ ማንታ ልበይ
ስጋይ ምሰ ትምኒቱ ምስቃል ክከኣለኒ

CHORUS
ክሒደካ ኣይኮንኩን ተታሊለ''የ እምበር
ፀሊአካ ኣይኮንኩን ደኪሙኒ እምበር
"ኣብ ደምበ ሓጥያተይ ሱቅ''ለ ዘዕወንዉን
ዓቅሚ ስኢነ እምበር መችኡኒ ኣይኮነን(2)

VERSE 5
ፍቅርካ ዘይርስዕ ልቦና ሃበኒ
ንዓካ ዘይርሰዕ ልቦና ሃበኒ(3)

CHORUS
ክሒደካ ኣይኮንኩን ተታሊለ''የ እምበር
ፀሊአካ ኣይኮንኩን ደኪሙኒ እምበር
"ኣብ ደምበ ሓጥያተይ ሱቅ''ለ ዘዕወንዉን
ዓቅሚ ስኢነ እምበር መችኡኒ ኣይኮነን(2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kihideka aykonkun tetalile''ye ember
Ts’eliaka aykonkun dekimuni ember
"ab dembe hat’yatey suq''le zeewenwun
Aqmi siine ember mechuni aykonen (2)

VERSE 1
Libey''za bet meqdeska bidemka zitehants’et
Sefer kefat geyreya menagedi nay hat’yat
Zikefelkaley waga zey kemnay qots’ire
Abti zisearkaley eneku teasire

CHORUS
Kihideka aykonkun tetalile''ye ember
Ts’eliaka aykonkun dekimuni ember
"ab dembe hat’yatey suq''le zeewenwun
Aqmi siine ember mechuni aykonen (2)

VERSE 2
"kabzi zelekwo nay hat’yat barnet
Fent’ise kiwets’e sidedeley mihret
Kem esat kiqats’el fiqrka ab libey
Zets’enanani menfese liakeley

CHORUS
Kihideka aykonkun tetalile''ye ember
Ts’eliaka aykonkun dekimuni ember
"ab dembe hat’yatey suq''le zeewenwun
Aqmi siine ember mechuni aykonen (2)

VERSE 3
Azhmach
Niakan nialemn maere maere seria
Neti kale keyhadgo keyterfeni wun''ti hade
Bikltian aegarey mihnkase limdey koynu

CHORUS
Kihideka aykonkun tetalile''ye ember
Ts’eliaka aykonkun dekimuni ember
"ab dembe hat’yatey suq''le zeewenwun
Aqmi siine ember mechuni aykonen (2)

VERSE 4
Goytay qidse menfeska ab betey sifra siinu
"mehareni goytay ka���zi mennetey
Barya kilte goytot kabzi manta libey
Sigay mise timnitu misqal kikealeni

CHORUS
Kihideka aykonkun tetalile''ye ember
Ts’eliaka aykonkun dekimuni ember
"ab dembe hat’yatey suq''le zeewenwun
Aqmi siine ember mechuni aykonen (2)

VERSE 5
Fiqrka zeyrse libona habeni
Niaka zeyrsee libona habeni (3)

CHORUS
Kihideka aykonkun tetalile''ye ember
Ts’eliaka aykonkun dekimuni ember
"ab dembe hat’yatey suq''le zeewenwun
Aqmi siine ember mechuni aykonen (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'libona-habeni', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Libonaye Yawita (libonaye-yawita)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = '♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 1
ስላንቺ የሚነገር አለን ድንቅ ነገር/2/
የነቢያት ድንግል የአበው ምሳሌ
እናቴ እልሻለሁ ቢበዛም በደሌ
ከቅዱሳን ሁሉ ያንቺ ክብር ይበልጣል

VERSE 2
አምላክን ልጄ ነው ማንስ ብሎት ያውቃል
ሄዋን ባትታዘዝ ለእግዚአብሔር ቃል
ሞትና መርገሙ በዓለም ገብቷል
የመላኩን ብስራት በእምነት ብትሰሚ

VERSE 3
ሞገስን ተቀበልሽ በቀኙ እንድትቆሚ
ፍቅርሽ ጉልበት አለው ባህሩን ያሻግራል
ልመናሽ ፅኑ ነው ግዳጅ ይፈፅማል
ስለዚህ ድንግል ሆይ እንወድሻለን

VERSE 4
ስምሽን ለልጅ ልጅ እንዘክራለን
ቀድሞም አልነበረም ወደፊትም አይኖር
ከፍጥረታት ሁሉ በሰማይ በምድር
ከእግዚአብሔር በታች ዛሬም ተሞሸራ

VERSE 5
ድንግል ትታያለች ከከበሩት ከብራ
ሊቀ መዘምራን ቴዎድሮስ ዮሴፍ
┈┈┈┈◉❖◉┈┈┈
@Yemezmurgtm

VERSE 6
┈┈┈┈◉❖◉┈┈┈',
      lyrics_transliteration = '♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager

VERSE 1
Silanchi yemineger alen dinq neger (2)
Yenebiyat Dingil yeabew misale
Enate elshalehu bibezam bedele
Keqdusan hulu yanchi kibir yibelt’al

VERSE 2
Amlakn lije new mans bilot yawqal
Hewan battazez leEgziabher qal
Motna mergemu bealem gebtwal
Yemelakun bisrat beemnet bitsemi

VERSE 3
Mogesn teqebelsh beqegnu endtqomi
Fiqrsh gulbet alew bahrun yashagral
Limenash ts’nu new gidaj yifets’mal
Silezih Dingil hoy enwedshalen

VERSE 4
Simshn lelj lij enzekralen
Qedmom alneberem wedefitm aynor
Keft’retat hulu besemay bemdr
Keegziabher betach zarem temoshera

VERSE 5
Dingil titayalech kekeberut kebra
Liqe mezemran tewodros yosef
┈┈┈┈◉❖◉┈┈┈
@Yemezmurgtm

VERSE 6
┈┈┈┈◉❖◉┈┈┈',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'libonaye-yawita'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 1
ስላንቺ የሚነገር አለን ድንቅ ነገር/2/
የነቢያት ድንግል የአበው ምሳሌ
እናቴ እልሻለሁ ቢበዛም በደሌ
ከቅዱሳን ሁሉ ያንቺ ክብር ይበልጣል

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 2
አምላክን ልጄ ነው ማንስ ብሎት ያውቃል
ሄዋን ባትታዘዝ ለእግዚአብሔር ቃል
ሞትና መርገሙ በዓለም ገብቷል
የመላኩን ብስራት በእምነት ብትሰሚ

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 3
ሞገስን ተቀበልሽ በቀኙ እንድትቆሚ
ፍቅርሽ ጉልበት አለው ባህሩን ያሻግራል
ልመናሽ ፅኑ ነው ግዳጅ ይፈፅማል
ስለዚህ ድንግል ሆይ እንወድሻለን

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 4
ስምሽን ለልጅ ልጅ እንዘክራለን
ቀድሞም አልነበረም ወደፊትም አይኖር
ከፍጥረታት ሁሉ በሰማይ በምድር
ከእግዚአብሔር በታች ዛሬም ተሞሸራ

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 5
ድንግል ትታያለች ከከበሩት ከብራ
ሊቀ መዘምራን ቴዎድሮስ ዮሴፍ
┈┈┈┈◉❖◉┈┈┈
@Yemezmurgtm

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር

VERSE 6
┈┈┈┈◉❖◉┈┈┈

CHORUS
♡ ልቦናዬ ያውጣ ♡
ልቦናዬ ያውጣ ውዳሴ ለክብርሽ
ሰላም ለኪ ድንግል ፀጋን የሞላብሽ
የእግዚአብሔር ከተማ የመለኮት ሃገር'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager

VERSE 1
Silanchi yemineger alen dinq neger (2)
Yenebiyat Dingil yeabew misale
Enate elshalehu bibezam bedele
Keqdusan hulu yanchi kibir yibelt’al

CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager

VERSE 2
Amlakn lije new mans bilot yawqal
Hewan battazez leEgziabher qal
Motna mergemu bealem gebtwal
Yemelakun bisrat beemnet bitsemi

CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager

VERSE 3
Mogesn teqebelsh beqegnu endtqomi
Fiqrsh gulbet alew bahrun yashagral
Limenash ts’nu new gidaj yifets’mal
Silezih Dingil hoy enwedshalen

CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager

VERSE 4
Simshn lelj lij enzekralen
Qedmom alneberem wedefitm aynor
Keft’retat hulu besemay bemdr
Keegziabher betach zarem temoshera

CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager

VERSE 5
Dingil titayalech kekeberut kebra
Liqe mezemran tewodros yosef
┈┈┈┈◉❖◉┈┈┈
@Yemezmurgtm

CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager

VERSE 6
┈┈┈┈◉❖◉┈┈┈

CHORUS
♡ libonaye yawt’a ♡
Libonaye yawt’a widase lekbrsh
Selam leki Dingil ts’egan yemolabsh
YeEgziabher ketema yemelekot hager'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'libonaye-yawita', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Like Mezemeran Tewodros Yoseph (like-mezemeran-tewodros-yoseph)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 1
እንደ አባቴ ዳዊት በበገና እዘምራለሁ
ቀን ከሌሊት ሳልል ለምስጋና እተጋለሁ
የኃጢአቴ ቁስል እንዲፈወስ እጮሃለሁ
ምርኩዜ ነሽና እመቤቴ በአንቺ እመካለሁ

VERSE 2
አ.ዝ \\
እመቤቴ በእውነት እንወድሻለን
የእውነተኛ መብል ክርስቶስን ወለድሽልን
ምክንያተ ድሂን ሆይ ድንግልማርያም የአምላክመገኛ

VERSE 3
በአማላጅነትሽ በመታመን እንጮሃን እኛ
ምሕረትን አድይን ኪዳነምህረት የዓለም መዳኛ
አ.ዝ \\
ስለ ቸርነትሽ እመቤቴ ለእኔ እናቴ ነሽ

VERSE 4
ስለ ንግሥትነትሽ እመቤቴ ነሽ
ዝናባት ሳያጠጡት አየራት ሳያሳድጉት
ሰማያዊ እንጀራ የሰጠሸን ቤተልሔማዊት
ቅድስተ ቅዱሳን የኖህ መርከብ የአምላክ እናት

VERSE 5
አ.ዝ \\
ቃና ዘገሊላ በሰርጉ ቤት በዚያ ተገኝተሽ ሳለሽ
ውኃውን ወደ ወይን ባንቺ ምልጃ እዳስለወጥሽ
ዛሬም የእኔ ሕይወት ወይኑ አልቆ ባዶ ሆኖአልና

VERSE 6
አንቺየአምላክ እናት ንጽሂትቅድስት ርኅሪሂተ ህሊና
ሕይወቴን አድሰሽ ቀድሰሽ ሙይው በምስጋና',
      lyrics_transliteration = 'Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu

VERSE 1
Ende abate dawit bebegena ezemralehu
Qen kelelit sall lemsgana etegalehu
Yehat’iate qusl endifewes ech’ohalehu
Mirkuze neshna Emebete beanchi emekalehu

VERSE 2
A.z \\
Emebete beewnet enwedshalen
Yeewnetegna mebl Kristosn weledshln
Miknyate dihin hoy dinglmaryam yeamlakmegegna

VERSE 3
Beamalajnetsh bemetamen ench’ohan egna
Mihretn adyn kidanemhret yealem medagna
A.z \\
Sile chernetsh Emebete leene enate nesh

VERSE 4
Sile nigstnetsh Emebete nesh
Zinabat sayat’et’ut ayerat sayasadgut
Semayawi enjera yeset’eshen betelhemawit
Qidste Kidusan yenoh merkeb yeamlak enat

VERSE 5
A.z \\
Qana zegelila besergu bet beziya tegegntesh salesh
Wihawn wede weyn banchi milja edaslewet’sh
Zarem yeene hiywet weynu alqo bado honoalna

VERSE 6
Anchiyeamlak enat nits’hitqdst rihrihite hilina
Hiyweten adsesh qedsesh muyw bemsgana',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'like-mezemeran-tewodros-yoseph'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 1
እንደ አባቴ ዳዊት በበገና እዘምራለሁ
ቀን ከሌሊት ሳልል ለምስጋና እተጋለሁ
የኃጢአቴ ቁስል እንዲፈወስ እጮሃለሁ
ምርኩዜ ነሽና እመቤቴ በአንቺ እመካለሁ

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 2
አ.ዝ \\
እመቤቴ በእውነት እንወድሻለን
የእውነተኛ መብል ክርስቶስን ወለድሽልን
ምክንያተ ድሂን ሆይ ድንግልማርያም የአምላክመገኛ

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 3
በአማላጅነትሽ በመታመን እንጮሃን እኛ
ምሕረትን አድይን ኪዳነምህረት የዓለም መዳኛ
አ.ዝ \\
ስለ ቸርነትሽ እመቤቴ ለእኔ እናቴ ነሽ

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 4
ስለ ንግሥትነትሽ እመቤቴ ነሽ
ዝናባት ሳያጠጡት አየራት ሳያሳድጉት
ሰማያዊ እንጀራ የሰጠሸን ቤተልሔማዊት
ቅድስተ ቅዱሳን የኖህ መርከብ የአምላክ እናት

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 5
አ.ዝ \\
ቃና ዘገሊላ በሰርጉ ቤት በዚያ ተገኝተሽ ሳለሽ
ውኃውን ወደ ወይን ባንቺ ምልጃ እዳስለወጥሽ
ዛሬም የእኔ ሕይወት ወይኑ አልቆ ባዶ ሆኖአልና

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ

VERSE 6
አንቺየአምላክ እናት ንጽሂትቅድስት ርኅሪሂተ ህሊና
ሕይወቴን አድሰሽ ቀድሰሽ ሙይው በምስጋና

CHORUS
ጎሳ ልብየ ቃለ ሰናየ/2/
ወአነ አይድ ቅዳሴሃ ለማርያም/2/
አ.ዝ \\
እኔስ የማርያምን ውዳሴዋን እናገራለሁ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu

VERSE 1
Ende abate dawit bebegena ezemralehu
Qen kelelit sall lemsgana etegalehu
Yehat’iate qusl endifewes ech’ohalehu
Mirkuze neshna Emebete beanchi emekalehu

CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu

VERSE 2
A.z \\
Emebete beewnet enwedshalen
Yeewnetegna mebl Kristosn weledshln
Miknyate dihin hoy dinglmaryam yeamlakmegegna

CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu

VERSE 3
Beamalajnetsh bemetamen ench’ohan egna
Mihretn adyn kidanemhret yealem medagna
A.z \\
Sile chernetsh Emebete leene enate nesh

CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu

VERSE 4
Sile nigstnetsh Emebete nesh
Zinabat sayat’et’ut ayerat sayasadgut
Semayawi enjera yeset’eshen betelhemawit
Qidste Kidusan yenoh merkeb yeamlak enat

CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu

VERSE 5
A.z \\
Qana zegelila besergu bet beziya tegegntesh salesh
Wihawn wede weyn banchi milja edaslewet’sh
Zarem yeene hiywet weynu alqo bado honoalna

CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu

VERSE 6
Anchiyeamlak enat nits’hitqdst rihrihite hilina
Hiyweten adsesh qedsesh muyw bemsgana

CHORUS
Gosa libye qale senaye (2)
Weane ayd qidaseha leMaryam (2)
A.z \\
Enes yemaryamn widasewan enageralehu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'like-mezemeran-tewodros-yoseph', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Like Mezemiran Kinetibeb W: Kirkos (like-mezemiran-kinetibeb-w-kirkos)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 1
ትውልዱ ተመታ በታላቅ በሽታ (2)
እረ በልክ ይሁን ጭፈራ እና ደስታ (2)
በማዕበል በጎርፍ እያየን ሲቀጣ (2)
አሁንም ተመለስ የከፋ ሳይመጣ

VERSE 2
አሁንም ተመለስ የባሰ ሳይመጣ
ተው አለም ተመለስ
ነነዌ ሊያጠፋ የወረደው እሳት (2)
አንተን እንዳይመታህ ተነሳ ለጸሎት (2)

VERSE 3
አለም ብትሰጥህ አንተ እንድትተጋ (2)
ኃልዎተ እግዚአብሔር እንድምን ይዘንጋ (2)
ተው አለም ተመለስ
ችግር ለበዛበት እጅግ ለታወከ (2)

VERSE 4
አምላክ መሃሪ ነው ለተንበረከ(2)
የአለም መድኃኒት የአለምን ቤዛ (2)
ጠይቀው ምህረትን ሰው ሆይ ልብ ግዛ (2)
ተው አለም ተመለስ ተው አለም ተገታ

VERSE 5
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ',
      lyrics_transliteration = 'Tew alem temeles
Tew alem tegeta
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta

VERSE 1
Tiwldu temeta betalaq beshta (2)
Ere belk yihun ch’fera ena desta (2)
Bemaebel begorf eyayen siqet’a (2)
Ahunm temeles yekefa saymet’a

VERSE 2
Ahunm temeles yebase saymet’a
Tew alem temeles
Nenewe liyat’efa yeweredew esat (2)
Anten endaymetah tenesa lets’elot (2)

VERSE 3
Alem bitset’h ante endttega (2)
Halwote Egziabher endmn yizenga (2)
Tew alem temeles
Chgr lebezabet ejg letaweke (2)

VERSE 4
Amlak mehari new letenbereke (2)
Yealem medhanit yealemn beza (2)
T’eyqew mihretn sew hoy lib giza (2)
Tew alem temeles tew alem tegeta

VERSE 5
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'like-mezemiran-kinetibeb-w-kirkos'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 1
ትውልዱ ተመታ በታላቅ በሽታ (2)
እረ በልክ ይሁን ጭፈራ እና ደስታ (2)
በማዕበል በጎርፍ እያየን ሲቀጣ (2)
አሁንም ተመለስ የከፋ ሳይመጣ

CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 2
አሁንም ተመለስ የባሰ ሳይመጣ
ተው አለም ተመለስ
ነነዌ ሊያጠፋ የወረደው እሳት (2)
አንተን እንዳይመታህ ተነሳ ለጸሎት (2)

CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 3
አለም ብትሰጥህ አንተ እንድትተጋ (2)
ኃልዎተ እግዚአብሔር እንድምን ይዘንጋ (2)
ተው አለም ተመለስ
ችግር ለበዛበት እጅግ ለታወከ (2)

CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 4
አምላክ መሃሪ ነው ለተንበረከ(2)
የአለም መድኃኒት የአለምን ቤዛ (2)
ጠይቀው ምህረትን ሰው ሆይ ልብ ግዛ (2)
ተው አለም ተመለስ ተው አለም ተገታ

CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

VERSE 5
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ

CHORUS
ተው አለም ተመለስ
ተው አለም ተገታ
በቁጣ መዓቱ ይቀጣሃል ጌታ
ይቀጣሃል ጌታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tew alem temeles
Tew alem tegeta
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta

VERSE 1
Tiwldu temeta betalaq beshta (2)
Ere belk yihun ch’fera ena desta (2)
Bemaebel begorf eyayen siqet’a (2)
Ahunm temeles yekefa saymet’a

CHORUS
Tew alem temeles
Tew alem tegeta
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta

VERSE 2
Ahunm temeles yebase saymet’a
Tew alem temeles
Nenewe liyat’efa yeweredew esat (2)
Anten endaymetah tenesa lets’elot (2)

CHORUS
Tew alem temeles
Tew alem tegeta
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta

VERSE 3
Alem bitset’h ante endttega (2)
Halwote Egziabher endmn yizenga (2)
Tew alem temeles
Chgr lebezabet ejg letaweke (2)

CHORUS
Tew alem temeles
Tew alem tegeta
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta

VERSE 4
Amlak mehari new letenbereke (2)
Yealem medhanit yealemn beza (2)
T’eyqew mihretn sew hoy lib giza (2)
Tew alem temeles tew alem tegeta

CHORUS
Tew alem temeles
Tew alem tegeta
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta

VERSE 5
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta

CHORUS
Tew alem temeles
Tew alem tegeta
Bequt’a meatu yiqet’ahal Geta
Yiqet’ahal Geta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'like-mezemiran-kinetibeb-w-kirkos', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Like Mezemiran Kinetibeb Welidekirikos Alem Atalay Nat (Ethiopian Orthodox Mezmur) (like-mezemiran-kinetibeb-welidekirikos-alem-atalay-nat-ethiopian-orthodo)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አለም አታላይ ነው አለም ወረተኛ፪
ያንቺ ዝምድና ይቅርብኛ አለም ወረተኛ፪
አለም ከንቱ ለኔ፬
አንቺን ስከተል ቀኑ መሼ አለቀ ዘመኔ፪

VERSE 1
አለም ያንቺን መውደ ያንቺ ፍቅር፪
አይዘልቅምና ይቅር ይቅር አለም ያንቺ ፍቅር፪
መዝሙር በመሰንቆ መዝሙር በባገና፪
የነፍስ ምግብ ልዩቃና መዝሙር በበገና ፪

VERSE 2
ጾም ጸሎት ስግደት፬
የነፍስ የስጋ መድኅኒት ጾም ጸሎት ስግደት፪',
      lyrics_transliteration = 'Alem atalay new alem weretegna2
Yanchi zimdna yiqrbgna alem weretegna2
Alem kentu lene4
Anchin siketel qenu meshe aleqe zemene2

VERSE 1
Alem yanchin mewde yanchi fiqr2
Ayzelqmna yiqr yiqr alem yanchi fiqr2
Mezmur bemesenqo mezmur bebagena2
Yenefs migb liyuqana mezmur bebegena 2

VERSE 2
Ts’om ts’elot sigdet4
Yenefs yesga medhnit ts’om ts’elot sigdet2',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'like-mezemiran-kinetibeb-welidekirikos-alem-atalay-nat-ethiopian-orthodo'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አለም አታላይ ነው አለም ወረተኛ፪
ያንቺ ዝምድና ይቅርብኛ አለም ወረተኛ፪
አለም ከንቱ ለኔ፬
አንቺን ስከተል ቀኑ መሼ አለቀ ዘመኔ፪

VERSE 1
አለም ያንቺን መውደ ያንቺ ፍቅር፪
አይዘልቅምና ይቅር ይቅር አለም ያንቺ ፍቅር፪
መዝሙር በመሰንቆ መዝሙር በባገና፪
የነፍስ ምግብ ልዩቃና መዝሙር በበገና ፪

CHORUS
አለም አታላይ ነው አለም ወረተኛ፪
ያንቺ ዝምድና ይቅርብኛ አለም ወረተኛ፪
አለም ከንቱ ለኔ፬
አንቺን ስከተል ቀኑ መሼ አለቀ ዘመኔ፪

VERSE 2
ጾም ጸሎት ስግደት፬
የነፍስ የስጋ መድኅኒት ጾም ጸሎት ስግደት፪

CHORUS
አለም አታላይ ነው አለም ወረተኛ፪
ያንቺ ዝምድና ይቅርብኛ አለም ወረተኛ፪
አለም ከንቱ ለኔ፬
አንቺን ስከተል ቀኑ መሼ አለቀ ዘመኔ፪'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Alem atalay new alem weretegna2
Yanchi zimdna yiqrbgna alem weretegna2
Alem kentu lene4
Anchin siketel qenu meshe aleqe zemene2

VERSE 1
Alem yanchin mewde yanchi fiqr2
Ayzelqmna yiqr yiqr alem yanchi fiqr2
Mezmur bemesenqo mezmur bebagena2
Yenefs migb liyuqana mezmur bebegena 2

CHORUS
Alem atalay new alem weretegna2
Yanchi zimdna yiqrbgna alem weretegna2
Alem kentu lene4
Anchin siketel qenu meshe aleqe zemene2

VERSE 2
Ts’om ts’elot sigdet4
Yenefs yesga medhnit ts’om ts’elot sigdet2

CHORUS
Alem atalay new alem weretegna2
Yanchi zimdna yiqrbgna alem weretegna2
Alem kentu lene4
Anchin siketel qenu meshe aleqe zemene2'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'like-mezemiran-kinetibeb-welidekirikos-alem-atalay-nat-ethiopian-orthodo', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Limeskir zemari yeabkal desalegn (limeskir-zemari-yeabkal-desalegn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 1
የዘላለም መዳን ሕይወት የሚሰጥ
ከጥልቁ ሚነጥቅ ከሞት ሚያስመልጥ
የተላከው መሲህ የተቀባው ጌታ
የእምነታችን ራስ ፈጻሚ ነው ዋልታ

VERSE 2
እንደ ቅዱሳኑ እንደ ሰማዕታቱ
ልክ እንደ አባቶቼ እንደ ቀደሙቱ
ስለ ስሙ ክብር ታምነው እንደሞቱ
ገና አገንሃለሁ ይሄው ነው እውነቱ

VERSE 3
ያንተ ብቻ እንድሆን አላማህ ነውና
በስምህ ቃኸኸው የአንደበቴን ቃና
ጠጥቼ ረክቼ ከቃሉ ወለላ
አልመችም አለ ሕይወቴ ለሌላ

VERSE 4
እንደ ቅዱሳኑ እንደ ሰማዕታቱ
ልክ እንደ አባቶቼ እንደ ቀደሙቱ
ስለ ስሙ ክብር ታምነው እንደሞቱ
ገና አገንሃለሁ ይሄው ነው እውነቱ

VERSE 5
ለሚጠፋ መብል አልተጋም ለሥጋ
ክርስቲያን ነኝና ሰማያዊ ዜጋ
ታይቶ ለሚጠፋ ለጊዜያዊው ደስታ
ዋናዬ ኢየሱስን አልሸሽግም ላፍታ

VERSE 6
እንደ ቅዱሳኑ እንደ ሰማዕታቱ
ልክ እንደ አባቶቼ እንደ ቀደሙቱ
ስለ ስሙ ክብር ታምነው እንደሞቱ
ገና አገንሃለሁ ይሄው ነው እውነቱ

VERSE 7
የሚለ የኝ የለም ከሞተልኝ ጋራ
ድኛለሁና እንዲያው በእርሱ ስራ
ያመንኩት ኢየሱስ ድፍረት ሆኖልኛል
በነቀፉኝ ቁጥር ፀጋው በዝቶልኛል

VERSE 8
እንደ ቅዱሳኑ እንደ ሰማዕታቱ
ልክ እንደ አባቶቼ እንደ ቀደሙቱ
ስለ ስሙ ክብር ታምነው እንደሞቱ
ገና አገንሃለሁ ይሄው ነው እውነቱ',
      lyrics_transliteration = 'Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 1
Yezelalem medan hiywet yemiset’
Ket’lqu minet’q kemot miyasmelt’
Yetelakew mesih yeteqebaw Geta
Yeemnetachn ras fets’ami new walta

VERSE 2
Ende qidusanu ende semaetatu
Lik ende abatoche ende qedemutu
Sile simu kibir tamnew endemotu
Gena agenhalehu yihew new ewnetu

VERSE 3
Yante bicha endhon alamah newna
Besmh qaኸኸw yeandebeten qana
T’et’che rekche keqalu welela
Almechm ale hiywete lelela

VERSE 4
Ende qidusanu ende semaetatu
Lik ende abatoche ende qedemutu
Sile simu kibir tamnew endemotu
Gena agenhalehu yihew new ewnetu

VERSE 5
Lemit’efa mebl altegam lesga
Kirstiyan negnna semayawi zega
Tayto lemit’efa legizeyawiw desta
Wanaye iyesusn alsheshgm lafta

VERSE 6
Ende qidusanu ende semaetatu
Lik ende abatoche ende qedemutu
Sile simu kibir tamnew endemotu
Gena agenhalehu yihew new ewnetu

VERSE 7
Yemile yegn yelem kemotelgn gara
Dignalehuna endiyaw beersu sira
Yamenkut Iyesus difret honolgnal
Beneqefugn qut’r ts’egaw beztolgnal

VERSE 8
Ende qidusanu ende semaetatu
Lik ende abatoche ende qedemutu
Sile simu kibir tamnew endemotu
Gena agenhalehu yihew new ewnetu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'limeskir-zemari-yeabkal-desalegn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 1
የዘላለም መዳን ሕይወት የሚሰጥ
ከጥልቁ ሚነጥቅ ከሞት ሚያስመልጥ
የተላከው መሲህ የተቀባው ጌታ
የእምነታችን ራስ ፈጻሚ ነው ዋልታ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 2
እንደ ቅዱሳኑ እንደ ሰማዕታቱ
ልክ እንደ አባቶቼ እንደ ቀደሙቱ
ስለ ስሙ ክብር ታምነው እንደሞቱ
ገና አገንሃለሁ ይሄው ነው እውነቱ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 3
ያንተ ብቻ እንድሆን አላማህ ነውና
በስምህ ቃኸኸው የአንደበቴን ቃና
ጠጥቼ ረክቼ ከቃሉ ወለላ
አልመችም አለ ሕይወቴ ለሌላ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 4
እንደ ቅዱሳኑ እንደ ሰማዕታቱ
ልክ እንደ አባቶቼ እንደ ቀደሙቱ
ስለ ስሙ ክብር ታምነው እንደሞቱ
ገና አገንሃለሁ ይሄው ነው እውነቱ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 5
ለሚጠፋ መብል አልተጋም ለሥጋ
ክርስቲያን ነኝና ሰማያዊ ዜጋ
ታይቶ ለሚጠፋ ለጊዜያዊው ደስታ
ዋናዬ ኢየሱስን አልሸሽግም ላፍታ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 6
እንደ ቅዱሳኑ እንደ ሰማዕታቱ
ልክ እንደ አባቶቼ እንደ ቀደሙቱ
ስለ ስሙ ክብር ታምነው እንደሞቱ
ገና አገንሃለሁ ይሄው ነው እውነቱ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 7
የሚለ የኝ የለም ከሞተልኝ ጋራ
ድኛለሁና እንዲያው በእርሱ ስራ
ያመንኩት ኢየሱስ ድፍረት ሆኖልኛል
በነቀፉኝ ቁጥር ፀጋው በዝቶልኛል

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት

VERSE 8
እንደ ቅዱሳኑ እንደ ሰማዕታቱ
ልክ እንደ አባቶቼ እንደ ቀደሙቱ
ስለ ስሙ ክብር ታምነው እንደሞቱ
ገና አገንሃለሁ ይሄው ነው እውነቱ

CHORUS
ልመስክር ያንተን ስራ
ማዳንክን ለዓለም ላውራ
ቀርቶልኝ ባርነት
ድኛለሁ በአንተ ሞት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 1
Yezelalem medan hiywet yemiset’
Ket’lqu minet’q kemot miyasmelt’
Yetelakew mesih yeteqebaw Geta
Yeemnetachn ras fets’ami new walta

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 2
Ende qidusanu ende semaetatu
Lik ende abatoche ende qedemutu
Sile simu kibir tamnew endemotu
Gena agenhalehu yihew new ewnetu

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 3
Yante bicha endhon alamah newna
Besmh qaኸኸw yeandebeten qana
T’et’che rekche keqalu welela
Almechm ale hiywete lelela

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 4
Ende qidusanu ende semaetatu
Lik ende abatoche ende qedemutu
Sile simu kibir tamnew endemotu
Gena agenhalehu yihew new ewnetu

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 5
Lemit’efa mebl altegam lesga
Kirstiyan negnna semayawi zega
Tayto lemit’efa legizeyawiw desta
Wanaye iyesusn alsheshgm lafta

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 6
Ende qidusanu ende semaetatu
Lik ende abatoche ende qedemutu
Sile simu kibir tamnew endemotu
Gena agenhalehu yihew new ewnetu

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 7
Yemile yegn yelem kemotelgn gara
Dignalehuna endiyaw beersu sira
Yamenkut Iyesus difret honolgnal
Beneqefugn qut’r ts’egaw beztolgnal

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot

VERSE 8
Ende qidusanu ende semaetatu
Lik ende abatoche ende qedemutu
Sile simu kibir tamnew endemotu
Gena agenhalehu yihew new ewnetu

CHORUS
Limeskr yanten sira
Madankn lealem lawra
Qertolgn barnet
Dignalehu beante mot'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'limeskir-zemari-yeabkal-desalegn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: LIredagn meta (liredagn-meta)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 1
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 2
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል
መንገድ የመራኸው - - ኃያል ቅዱስ ሚካኤል
የኤርትራን ባህር - - ኃያል ሚካኤል

VERSE 3
ከፍለህ ያሻገርከው - - ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ክብርህ ከመላእክት - - ኃያል ሚካኤል

VERSE 4
ከፍ ከፍ ያለ ነው - - ኃያል ቅዱስ ሚካኤል
ታላቁ አለቃ - - ኃያል ሚካኤል
ከቶ እንዳንተ ማነው - - ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 5
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
በኃጢአት በረሃ - - ኃያል ሚካኤል
መጠለያ ሁነን - - ኃያል ቅዱስ ሚካኤል
ጠላት በመንገድ ላይ - - ኃያል ሚካኤል

VERSE 6
እንዳያስፈራራን - - ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 7
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል',
      lyrics_transliteration = 'Liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 1
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 2
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael
Menged yemeraኸw - - hayal Kidus Mikael
Yeertran bahr - - hayal Mikael

VERSE 3
Kefleh yashagerkew - - hayal Kidus Mikael
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Kibrh kemelaekt - - hayal Mikael

VERSE 4
Kef kef yale new - - hayal Kidus Mikael
Talaqu aleqa - - hayal Mikael
Keto endante manew - - hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 5
Yit’ebqegnal hayal Kidus Mikael
Behat’iat bereha - - hayal Mikael
Met’eleya hunen - - hayal Kidus Mikael
T’elat bemenged lay - - hayal Mikael

VERSE 6
Endayasferaran - - hayal Kidus Mikael
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 7
Yit’ebqegnal hayal Kidus Mikael',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'liredagn-meta'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 1
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

CHORUS
ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 2
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
የሙሴ ጠባቂ - - ኃያል ሚካኤል
መንገድ የመራኸው - - ኃያል ቅዱስ ሚካኤል
የኤርትራን ባህር - - ኃያል ሚካኤል

CHORUS
ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 3
ከፍለህ ያሻገርከው - - ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ክብርህ ከመላእክት - - ኃያል ሚካኤል

CHORUS
ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 4
ከፍ ከፍ ያለ ነው - - ኃያል ቅዱስ ሚካኤል
ታላቁ አለቃ - - ኃያል ሚካኤል
ከቶ እንዳንተ ማነው - - ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

CHORUS
ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 5
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
በኃጢአት በረሃ - - ኃያል ሚካኤል
መጠለያ ሁነን - - ኃያል ቅዱስ ሚካኤል
ጠላት በመንገድ ላይ - - ኃያል ሚካኤል

CHORUS
ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 6
እንዳያስፈራራን - - ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

CHORUS
ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል

VERSE 7
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል

CHORUS
ሊረዳኝ መጣ
ሊረዳኝ መጣ ኃያል ሚካኤል
ይጠብቀኛል ኃያል ቅዱስ ሚካኤል
ሊረዳኝ መጣ ኃያል ሚካኤል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 1
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

CHORUS
Liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 2
Yit’ebqegnal hayal Kidus Mikael
Yemuse t’ebaqi - - hayal Mikael
Menged yemeraኸw - - hayal Kidus Mikael
Yeertran bahr - - hayal Mikael

CHORUS
Liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 3
Kefleh yashagerkew - - hayal Kidus Mikael
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Kibrh kemelaekt - - hayal Mikael

CHORUS
Liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 4
Kef kef yale new - - hayal Kidus Mikael
Talaqu aleqa - - hayal Mikael
Keto endante manew - - hayal Kidus Mikael
Liredagn met’a hayal Mikael

CHORUS
Liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 5
Yit’ebqegnal hayal Kidus Mikael
Behat’iat bereha - - hayal Mikael
Met’eleya hunen - - hayal Kidus Mikael
T’elat bemenged lay - - hayal Mikael

CHORUS
Liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 6
Endayasferaran - - hayal Kidus Mikael
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

CHORUS
Liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael

VERSE 7
Yit’ebqegnal hayal Kidus Mikael

CHORUS
Liredagn met’a
Liredagn met’a hayal Mikael
Yit’ebqegnal hayal Kidus Mikael
Liredagn met’a hayal Mikael'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'liredagn-meta', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Liredan Meta Mikael (liredan-meta-mikael)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሊረዳን መጣ ኃያል ሚካኤል
ይጠብቀናል ኃያል ሚካኤል
የሙሴ ጠባቂ ኃያል ሚካኤል

VERSE 1
መንገድ የመራኸው ››
የኤርትራን ባህር ››
ከፍለህ ያሻገርከው ››

VERSE 2
ክብርህ ከመላእክት ኃያል ሚካኤል
ከፍ ከፍ ያለ ነው ››
ታላቁ አለቃ ››
ከቶ እንዳንተ ማነው ››

VERSE 3
ከሃጢያት በረሃ ኃያል ሚካኤል
መጠለያ ሆነን ››
ጠላት በመንገድ ላይ ››
እንዳያስፈራራን ››',
      lyrics_transliteration = 'Liredan meta hayal Mikael
Yit’ebekinal hayal Mikael
YeMuse t’ebaqi hayal Mikael

VERSE 1
Menged yemarakhew ››
Ye’Ertra bahir ››
Kefleh yashagerkew ››

VERSE 2
Kibirih kemela’ikt hayal Mikael
Kef kef yale new ››
Talaku aleqa ››
Keto endet ante manew ››

VERSE 3
Kehat’iyat bereha hayal Mikael
Met’eleya honen ››
T’elaṭ bemenged lay ››
Endayasferaran ››',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'liredan-meta-mikael'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሊረዳን መጣ ኃያል ሚካኤል
ይጠብቀናል ኃያል ሚካኤል
የሙሴ ጠባቂ ኃያል ሚካኤል

VERSE 1
መንገድ የመራኸው ››
የኤርትራን ባህር ››
ከፍለህ ያሻገርከው ››

CHORUS
ሊረዳን መጣ ኃያል ሚካኤል
ይጠብቀናል ኃያል ሚካኤል
የሙሴ ጠባቂ ኃያል ሚካኤል

VERSE 2
ክብርህ ከመላእክት ኃያል ሚካኤል
ከፍ ከፍ ያለ ነው ››
ታላቁ አለቃ ››
ከቶ እንዳንተ ማነው ››

CHORUS
ሊረዳን መጣ ኃያል ሚካኤል
ይጠብቀናል ኃያል ሚካኤል
የሙሴ ጠባቂ ኃያል ሚካኤል

VERSE 3
ከሃጢያት በረሃ ኃያል ሚካኤል
መጠለያ ሆነን ››
ጠላት በመንገድ ላይ ››
እንዳያስፈራራን ››

CHORUS
ሊረዳን መጣ ኃያል ሚካኤል
ይጠብቀናል ኃያል ሚካኤል
የሙሴ ጠባቂ ኃያል ሚካኤል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Liredan meta hayal Mikael
Yit’ebekinal hayal Mikael
YeMuse t’ebaqi hayal Mikael

VERSE 1
Menged yemarakhew ››
Ye’Ertra bahir ››
Kefleh yashagerkew ››

CHORUS
Liredan meta hayal Mikael
Yit’ebekinal hayal Mikael
YeMuse t’ebaqi hayal Mikael

VERSE 2
Kibirih kemela’ikt hayal Mikael
Kef kef yale new ››
Talaku aleqa ››
Keto endet ante manew ››

CHORUS
Liredan meta hayal Mikael
Yit’ebekinal hayal Mikael
YeMuse t’ebaqi hayal Mikael

VERSE 3
Kehat’iyat bereha hayal Mikael
Met’eleya honen ››
T’elaṭ bemenged lay ››
Endayasferaran ››

CHORUS
Liredan meta hayal Mikael
Yit’ebekinal hayal Mikael
YeMuse t’ebaqi hayal Mikael'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'liredan-meta-mikael', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Litatibegn Demih Fesese (litatibegn-demih-fesese)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 1
እንደ በግ በሸላቹ ፊት
ሲጎተት ስለ እኔ ህይወት
ተረስቶኝ የሞትህ ዋጋ
ስጠፋ ወጣህ ፍለጋ

VERSE 2
ስበረው አለቱ ልቤን
አርቀው ክፉ ሀሳቤን
ልማረክ እጄን ልዘርጋ
ጨለማው ሌሉቱ ይንጋ

VERSE 3
ቀና እንደል የተደፋኸው
ሸክሜን የተሸከምከው
በምኔ ምን ብትወደኝ ነው
ቅዱሱ የተሰዋኸው

VERSE 4
ይገለጥ የአይኔ ቅርፊት
ልመልከት ይህንን እውነት
ይወገድ አዚም ከላዬ
ላምልክህ ሁለንተናዬ

VERSE 5
ስለ አንዴ ጥለህ ሌላውን
የፈለክ በደለኛውን
ከጥልቁ እጄን ጎትተህ
አወጣኸን እዳዬን ከፍለህ

VERSE 6
ሳይኖረኝ አንዳች በጎነት
ልጅ የሚያስብል የምኮርበት
አብሰህ የአይኖቼን እንባ
ዘመርኩኝ አልኩኝ አባባ',
      lyrics_transliteration = 'Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn

VERSE 1
Ende beg beshelachu fit
Sigotet sile ene hiywet
Terestogn yemoth waga
Sit’efa wet’ah filega

VERSE 2
Siberew aletu liben
Arqew kifu hesaben
Limarek ejen lizerga
Ch’elemaw lelutu yinga

VERSE 3
Qena endel yetedefaኸw
Shekmen yeteshekemkew
Bemne min bitwedegn new
Qidusu yetesewaኸw

VERSE 4
Yigelet’ yeayne qirfit
Limelket yihnn ewnet
Yiweged azim kelaye
Lamlkh hulentenaye

VERSE 5
Sile ande t’leh lelawn
Yefelek bedelegnawn
Ket’lqu ejen gotteh
Awet’aኸn edayen kefleh

VERSE 6
Saynoregn andach begonet
Lij yemiyasbl yemkorbet
Abseh yeaynochen enba
Zemerkugn alkugn ababa',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'litatibegn-demih-fesese'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 1
እንደ በግ በሸላቹ ፊት
ሲጎተት ስለ እኔ ህይወት
ተረስቶኝ የሞትህ ዋጋ
ስጠፋ ወጣህ ፍለጋ

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 2
ስበረው አለቱ ልቤን
አርቀው ክፉ ሀሳቤን
ልማረክ እጄን ልዘርጋ
ጨለማው ሌሉቱ ይንጋ

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 3
ቀና እንደል የተደፋኸው
ሸክሜን የተሸከምከው
በምኔ ምን ብትወደኝ ነው
ቅዱሱ የተሰዋኸው

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 4
ይገለጥ የአይኔ ቅርፊት
ልመልከት ይህንን እውነት
ይወገድ አዚም ከላዬ
ላምልክህ ሁለንተናዬ

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 5
ስለ አንዴ ጥለህ ሌላውን
የፈለክ በደለኛውን
ከጥልቁ እጄን ጎትተህ
አወጣኸን እዳዬን ከፍለህ

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ

VERSE 6
ሳይኖረኝ አንዳች በጎነት
ልጅ የሚያስብል የምኮርበት
አብሰህ የአይኖቼን እንባ
ዘመርኩኝ አልኩኝ አባባ

CHORUS
ልታጥበኝ ደምህ ፈሰሰ
የጠላት ሴራ ፈረሰ
ድካምህ ብርታት ሊሆነኝ
ቅዱሱ ተሰቀልክልኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn

VERSE 1
Ende beg beshelachu fit
Sigotet sile ene hiywet
Terestogn yemoth waga
Sit’efa wet’ah filega

CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn

VERSE 2
Siberew aletu liben
Arqew kifu hesaben
Limarek ejen lizerga
Ch’elemaw lelutu yinga

CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn

VERSE 3
Qena endel yetedefaኸw
Shekmen yeteshekemkew
Bemne min bitwedegn new
Qidusu yetesewaኸw

CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn

VERSE 4
Yigelet’ yeayne qirfit
Limelket yihnn ewnet
Yiweged azim kelaye
Lamlkh hulentenaye

CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn

VERSE 5
Sile ande t’leh lelawn
Yefelek bedelegnawn
Ket’lqu ejen gotteh
Awet’aኸn edayen kefleh

CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn

VERSE 6
Saynoregn andach begonet
Lij yemiyasbl yemkorbet
Abseh yeaynochen enba
Zemerkugn alkugn ababa

CHORUS
Litat’begn demh fesese
Yet’elat sera ferese
Dikamh birtat lihonegn
Qidusu teseqelklgn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'litatibegn-demih-fesese', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Live (live)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 1
ገዳዩ ሞት በርሱ ድል መንሳት ተዋጠና
ሰንሰለቴን ቀንበሬን ተካው በበገና
ሞት ሆይ መውጊያህ የታል እያልን ምንዘምረው
መስቀልህ ጦር ስምህ ጋሻችን ሆኖልን ነው ዳንን የምንለው

VERSE 2
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 3
ተሻግረናል ስላሻገርከን ለዘላለም
በመቃብር ሞት ይይዘን ዘንድ ከቶ አልቻለም
ሃይለኛውን በሃይል አስረኸው ላይፈታ
ዘመርንልህ አሸናፊ ነህ የኛ ጌታ ከፍ በል በልልታ

VERSE 4
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 5
ሞቶ ማዳን ለማን ተችሏል ካንተ በቀር
ጌትነትህ ስራህ ይኖራል ሲመሰክር
ወዳጄ ሆይ ውበትህ ውብ ነው የሚያበራ
ተጨነቀ ተንቀጠቀጠ ጠላት ፈራ እጹብ ያንተ ስራ

VERSE 6
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 7
መስክሩለት የምስራች ነው ታላቅ ዜና
መላእክቱ ነጭ ለብሰዋል ድል ነውና
ከተማዋ አንዳች ሆናለች በሌሊቱ
በዝማሬ ተንቀጠቀጠ ወህኒ ቤቱ ከበሮውን ምቱ

VERSE 8
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ',
      lyrics_transliteration = 'Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 1
Gedayu mot bersu dil mensat tewat’ena
Senseleten qenberen tekaw bebegena
Mot hoy mewgiyah yetal eyaln minzemrew
Mesqelh t’or simh gashachn honoln new dann yemnlew

VERSE 2
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 3
Teshagrenal silashagerken lezelalem
Bemeqabr mot yiyzen zend keto alchalem
Haylegnawn behayl asreኸw layfeta
Zemernlh ashenafi neh yegna Geta kef bel bellta

VERSE 4
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 5
Moto madan leman techlwal kante beqer
Getneth sirah yinoral simesekr
Wedaje hoy wibeth wib new yemiyabera
Tech’eneqe tenqet’eqet’e t’elat fera ets’ub yante sira

VERSE 6
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 7
Meskrulet yemsrach new talaq zena
Melaektu nech’ lebsewal dil newna
Ketemawa andach honalech belelitu
Bezmare tenqet’eqet’e wehni betu keberown mitu

VERSE 8
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'live'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 1
ገዳዩ ሞት በርሱ ድል መንሳት ተዋጠና
ሰንሰለቴን ቀንበሬን ተካው በበገና
ሞት ሆይ መውጊያህ የታል እያልን ምንዘምረው
መስቀልህ ጦር ስምህ ጋሻችን ሆኖልን ነው ዳንን የምንለው

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 2
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 3
ተሻግረናል ስላሻገርከን ለዘላለም
በመቃብር ሞት ይይዘን ዘንድ ከቶ አልቻለም
ሃይለኛውን በሃይል አስረኸው ላይፈታ
ዘመርንልህ አሸናፊ ነህ የኛ ጌታ ከፍ በል በልልታ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 4
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 5
ሞቶ ማዳን ለማን ተችሏል ካንተ በቀር
ጌትነትህ ስራህ ይኖራል ሲመሰክር
ወዳጄ ሆይ ውበትህ ውብ ነው የሚያበራ
ተጨነቀ ተንቀጠቀጠ ጠላት ፈራ እጹብ ያንተ ስራ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 6
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 7
መስክሩለት የምስራች ነው ታላቅ ዜና
መላእክቱ ነጭ ለብሰዋል ድል ነውና
ከተማዋ አንዳች ሆናለች በሌሊቱ
በዝማሬ ተንቀጠቀጠ ወህኒ ቤቱ ከበሮውን ምቱ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

VERSE 8
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ

CHORUS
ሂዱ ንገሩ አውሩ ዓለም
ተነስቷል በዚህ የለም (2)
መድሃኔዓለም ሞት የማይችለው የበረታ
ሃያል ነው ማይረታ ማህተሙን የፈታ የትንሳኤው ጌታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 1
Gedayu mot bersu dil mensat tewat’ena
Senseleten qenberen tekaw bebegena
Mot hoy mewgiyah yetal eyaln minzemrew
Mesqelh t’or simh gashachn honoln new dann yemnlew

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 2
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 3
Teshagrenal silashagerken lezelalem
Bemeqabr mot yiyzen zend keto alchalem
Haylegnawn behayl asreኸw layfeta
Zemernlh ashenafi neh yegna Geta kef bel bellta

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 4
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 5
Moto madan leman techlwal kante beqer
Getneth sirah yinoral simesekr
Wedaje hoy wibeth wib new yemiyabera
Tech’eneqe tenqet’eqet’e t’elat fera ets’ub yante sira

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 6
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 7
Meskrulet yemsrach new talaq zena
Melaektu nech’ lebsewal dil newna
Ketemawa andach honalech belelitu
Bezmare tenqet’eqet’e wehni betu keberown mitu

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

VERSE 8
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta

CHORUS
Hidu nigeru awru alem
Tenestwal bezih yelem (2)
Medhanealem mot yemaychlew yebereta
Hayal new mayreta mahtemun yefeta yetnsaew Geta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'live', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Live (live-1908)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'የሚጠብቀኝ አይተኛም/2/
አያንቀላፋም
++++++
ቤት ባይኖረኝም እደጅ ባድርም

VERSE 1
ቀን እና ለሊት ከኔ አይርቅም
ድምጸ አራዊት የለሊት ግርማ
ወደኔ አይቀርብም ድምጽህ ሲሰማ

VERSE 2
መሰናክልን ለእግሮቼ አይሰጥም
ይሰውረኛል በቀኙ ሰላም
ፀሐይም በቀን አይተኩሰኝም
የአጋንንትም ሀይል አያስፈራኝም

VERSE 3
ነፍሴን ጠበቃት ከጠላት ወጥመድ
ጌታዬ መራኝ በጽድቅ መንገድ
መውጣት መግባቴን እየጠበቀ
ለዚህ አበቃኝ እርሱ ባወቀ

VERSE 4
የሰማዩን ጠል እታገሳለው
ሰው ከጨከነ ምን እሆናለው
ለሊት በድብቅ ለሚጎበኙኝ
ለጻድቃኑ ክብር አምላክ ይስጥልኝ

VERSE 5
እንቅልፌን ባርኮ ለሰጠኝ የጌታ
በአለም ሀሳብ ሳልንገላታ
የእለት ምግቤንም ላልነሳኝ ፍጹም
ምስጋና ላቅርብ እስከ ዘለዓለም',
      lyrics_transliteration = 'Yemit’ebqegn aytegnam (2)
Ayanqelafam
++++++
Bet baynoregnm edej badrm

VERSE 1
Qen ena lelit kene ayrqm
Dimts’e arawit yelelit girma
Wedene ayqerbm dimts’h sisema

VERSE 2
Mesenakln leegroche ayset’m
Yisewregnal beqegnu selam
Ts’eheym beqen aytekusegnm
Yeaganntm heyl ayasferagnm

VERSE 3
Nefsen t’ebeqat ket’elat wet’med
Getaye meragn bets’dq menged
Mewt’at megbaten eyet’ebeqe
Lezih abeqagn ersu baweqe

VERSE 4
Yesemayun t’el etagesalew
Sew kech’ekene min ehonalew
Lelit bedbq lemigobegnugn
Lets’adqanu kibir amlak yist’lgn

VERSE 5
Enqlfen barko leset’egn yegeta
Bealem hesab salngelata
Yeelet migbenm lalnesagn fits’um
Misgana laqrb eske zelealem',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'live-1908'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የሚጠብቀኝ አይተኛም/2/
አያንቀላፋም
++++++
ቤት ባይኖረኝም እደጅ ባድርም

VERSE 1
ቀን እና ለሊት ከኔ አይርቅም
ድምጸ አራዊት የለሊት ግርማ
ወደኔ አይቀርብም ድምጽህ ሲሰማ

CHORUS
የሚጠብቀኝ አይተኛም/2/
አያንቀላፋም
++++++
ቤት ባይኖረኝም እደጅ ባድርም

VERSE 2
መሰናክልን ለእግሮቼ አይሰጥም
ይሰውረኛል በቀኙ ሰላም
ፀሐይም በቀን አይተኩሰኝም
የአጋንንትም ሀይል አያስፈራኝም

CHORUS
የሚጠብቀኝ አይተኛም/2/
አያንቀላፋም
++++++
ቤት ባይኖረኝም እደጅ ባድርም

VERSE 3
ነፍሴን ጠበቃት ከጠላት ወጥመድ
ጌታዬ መራኝ በጽድቅ መንገድ
መውጣት መግባቴን እየጠበቀ
ለዚህ አበቃኝ እርሱ ባወቀ

CHORUS
የሚጠብቀኝ አይተኛም/2/
አያንቀላፋም
++++++
ቤት ባይኖረኝም እደጅ ባድርም

VERSE 4
የሰማዩን ጠል እታገሳለው
ሰው ከጨከነ ምን እሆናለው
ለሊት በድብቅ ለሚጎበኙኝ
ለጻድቃኑ ክብር አምላክ ይስጥልኝ

CHORUS
የሚጠብቀኝ አይተኛም/2/
አያንቀላፋም
++++++
ቤት ባይኖረኝም እደጅ ባድርም

VERSE 5
እንቅልፌን ባርኮ ለሰጠኝ የጌታ
በአለም ሀሳብ ሳልንገላታ
የእለት ምግቤንም ላልነሳኝ ፍጹም
ምስጋና ላቅርብ እስከ ዘለዓለም

CHORUS
የሚጠብቀኝ አይተኛም/2/
አያንቀላፋም
++++++
ቤት ባይኖረኝም እደጅ ባድርም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yemit’ebqegn aytegnam (2)
Ayanqelafam
++++++
Bet baynoregnm edej badrm

VERSE 1
Qen ena lelit kene ayrqm
Dimts’e arawit yelelit girma
Wedene ayqerbm dimts’h sisema

CHORUS
Yemit’ebqegn aytegnam (2)
Ayanqelafam
++++++
Bet baynoregnm edej badrm

VERSE 2
Mesenakln leegroche ayset’m
Yisewregnal beqegnu selam
Ts’eheym beqen aytekusegnm
Yeaganntm heyl ayasferagnm

CHORUS
Yemit’ebqegn aytegnam (2)
Ayanqelafam
++++++
Bet baynoregnm edej badrm

VERSE 3
Nefsen t’ebeqat ket’elat wet’med
Getaye meragn bets’dq menged
Mewt’at megbaten eyet’ebeqe
Lezih abeqagn ersu baweqe

CHORUS
Yemit’ebqegn aytegnam (2)
Ayanqelafam
++++++
Bet baynoregnm edej badrm

VERSE 4
Yesemayun t’el etagesalew
Sew kech’ekene min ehonalew
Lelit bedbq lemigobegnugn
Lets’adqanu kibir amlak yist’lgn

CHORUS
Yemit’ebqegn aytegnam (2)
Ayanqelafam
++++++
Bet baynoregnm edej badrm

VERSE 5
Enqlfen barko leset’egn yegeta
Bealem hesab salngelata
Yeelet migbenm lalnesagn fits’um
Misgana laqrb eske zelealem

CHORUS
Yemit’ebqegn aytegnam (2)
Ayanqelafam
++++++
Bet baynoregnm edej badrm'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'live-1908', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Live (live-2694)
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
  WHERE slug = 'live-2694'
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
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'live-2694', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Live mezmur /eritrean orthodox worship song /reyeka bayney / zemari Bereket tikue (live-mezmur-eritrean-orthodox-worship-song-reyeka-bayney-zemari-bereket)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 1
ጓሂ ልበይ ኣብ ውሽጠይ ምስ በዝሐ ተሓሊለ ሕልናይ ምስ ዓረበ
መን''ዩ ሞ ከማኻ ብይቅሬታ ምሕረት ንዓይ ዝበጽሓኒ
ከማኻስ መን እሞ እናጸናንዐ ሓጎስ ዝኾነኒ
ሕጂ ግዳ ርእየካ ብዓይነይ

VERSE 2
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
(ከመስግነካ''የ ኣነ እንታይ ኣሎኒ)"2"
ጓሂ ልበይ ኣብ ውሽጠይ ምስ በዝሐ ተሓሊለ ሕልናይ ምስ ዓረበ

VERSE 3
መናሎ ከማኻ ብይቅሬታ ምሕረት ንዓይ ዝበጽሓኒ
ከማኻስ መን እሞ እናጸናንዐ ሓጎስ ዝኾነኒ
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ

VERSE 4
እንታይ ስኢነ እንታይ ጎዱሉኒ
(ከመስግነካ''የ ኣነ እንታይ ኣሎኒ)"2"
መን ኣሎ ድዩ ንስለ ፍቅሪ ክብል
መን ኣሎ ድዩ ምይቱ ሞተይ ዝስዕር

VERSE 5
መን ኣሎ ከማኻ ብፍጽምቲ ፍቅሪ ክሳብ ሞት ዘፍቀረ
ብዓይነ ልቦናይ ሕጅስ ርእየካ እየ ኢየሱስ መድሕነይ
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ

VERSE 6
እንታይ ስኢነ እንታይ ጎዱሉኒ
(ከመስግነካ''የ ኣነ እንታይ ኣሎኒ)"2"
ጓሂ ልበይ ኣብ ውሽጠይ ምስ በዝሐ ተሓሊለ ሕልናይ ምስ ዓረበ
መን''ዩ ሞ ከማኻ ብይቅሬታ ምሕረት ንዓይ ዝበጽሓኒ

VERSE 7
ከማኻስ መን እሞ እናጸናንዐ ሓጎስ ዝኾነኒ
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ

VERSE 8
(ከመስግነካ''የ ኣነ እንታይ ኣሎኒ)"2"',
      lyrics_transliteration = 'Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 1
Gwahi libey ab wisht’ey mis bezhe tehalile hilnay mis arebe
Men''yu mo kemaኻ biyqreta mihret niay zibets’hani
Kemaኻs men emo enats’enana hagos ziኾneni
Hiji gida rieyeka biayney

VERSE 2
Hiji gida kefilkayo eday
Entay siine entay goduluni
(kemesgneka''ye ane entay aloni)"2"
Gwahi libey ab wisht’ey mis bezhe tehalile hilnay mis arebe

VERSE 3
Menalo kemaኻ biyqreta mihret niay zibets’hani
Kemaኻs men emo enats’enana hagos ziኾneni
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday

VERSE 4
Entay siine entay goduluni
(kemesgneka''ye ane entay aloni)"2"
Men alo diyu nisle fiqri kibl
Men alo diyu miytu motey ziser

VERSE 5
Men alo kemaኻ bifts’mti fiqri kisab mot zefqere
Biayne libonay hijs rieyeka eye Iyesus medhney
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday

VERSE 6
Entay siine entay goduluni
(kemesgneka''ye ane entay aloni)"2"
Gwahi libey ab wisht’ey mis bezhe tehalile hilnay mis arebe
Men''yu mo kemaኻ biyqreta mihret niay zibets’hani

VERSE 7
Kemaኻs men emo enats’enana hagos ziኾneni
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni

VERSE 8
(kemesgneka''ye ane entay aloni)"2"',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'live-mezmur-eritrean-orthodox-worship-song-reyeka-bayney-zemari-bereket'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 1
ጓሂ ልበይ ኣብ ውሽጠይ ምስ በዝሐ ተሓሊለ ሕልናይ ምስ ዓረበ
መን''ዩ ሞ ከማኻ ብይቅሬታ ምሕረት ንዓይ ዝበጽሓኒ
ከማኻስ መን እሞ እናጸናንዐ ሓጎስ ዝኾነኒ
ሕጂ ግዳ ርእየካ ብዓይነይ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 2
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
(ከመስግነካ''የ ኣነ እንታይ ኣሎኒ)"2"
ጓሂ ልበይ ኣብ ውሽጠይ ምስ በዝሐ ተሓሊለ ሕልናይ ምስ ዓረበ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 3
መናሎ ከማኻ ብይቅሬታ ምሕረት ንዓይ ዝበጽሓኒ
ከማኻስ መን እሞ እናጸናንዐ ሓጎስ ዝኾነኒ
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 4
እንታይ ስኢነ እንታይ ጎዱሉኒ
(ከመስግነካ''የ ኣነ እንታይ ኣሎኒ)"2"
መን ኣሎ ድዩ ንስለ ፍቅሪ ክብል
መን ኣሎ ድዩ ምይቱ ሞተይ ዝስዕር

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 5
መን ኣሎ ከማኻ ብፍጽምቲ ፍቅሪ ክሳብ ሞት ዘፍቀረ
ብዓይነ ልቦናይ ሕጅስ ርእየካ እየ ኢየሱስ መድሕነይ
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 6
እንታይ ስኢነ እንታይ ጎዱሉኒ
(ከመስግነካ''የ ኣነ እንታይ ኣሎኒ)"2"
ጓሂ ልበይ ኣብ ውሽጠይ ምስ በዝሐ ተሓሊለ ሕልናይ ምስ ዓረበ
መን''ዩ ሞ ከማኻ ብይቅሬታ ምሕረት ንዓይ ዝበጽሓኒ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 7
ከማኻስ መን እሞ እናጸናንዐ ሓጎስ ዝኾነኒ
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 8
(ከመስግነካ''የ ኣነ እንታይ ኣሎኒ)"2"

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 1
Gwahi libey ab wisht’ey mis bezhe tehalile hilnay mis arebe
Men''yu mo kemaኻ biyqreta mihret niay zibets’hani
Kemaኻs men emo enats’enana hagos ziኾneni
Hiji gida rieyeka biayney

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 2
Hiji gida kefilkayo eday
Entay siine entay goduluni
(kemesgneka''ye ane entay aloni)"2"
Gwahi libey ab wisht’ey mis bezhe tehalile hilnay mis arebe

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 3
Menalo kemaኻ biyqreta mihret niay zibets’hani
Kemaኻs men emo enats’enana hagos ziኾneni
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 4
Entay siine entay goduluni
(kemesgneka''ye ane entay aloni)"2"
Men alo diyu nisle fiqri kibl
Men alo diyu miytu motey ziser

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 5
Men alo kemaኻ bifts’mti fiqri kisab mot zefqere
Biayne libonay hijs rieyeka eye Iyesus medhney
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 6
Entay siine entay goduluni
(kemesgneka''ye ane entay aloni)"2"
Gwahi libey ab wisht’ey mis bezhe tehalile hilnay mis arebe
Men''yu mo kemaኻ biyqreta mihret niay zibets’hani

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 7
Kemaኻs men emo enats’enana hagos ziኾneni
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 8
(kemesgneka''ye ane entay aloni)"2"

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'live-mezmur-eritrean-orthodox-worship-song-reyeka-bayney-zemari-bereket', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: LIVE PERFORMANCE (live-performance-3150)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያልክው ማንን ነው
ሀጢአቱ በዝቶበት
በደሉ በዝቶበት የማርክው. ((((2))

VERSE 1
እንደ እኔ ክቶ ማ ነው
በሞገስ አስጊጠህ በዜማ ቃኝህኝ
ፊትህ እምታቆመኝ. ጌታየ እኔ ማን ነኝ
ለእኔ ያበዛህው. አቤት ደግነትህ

VERSE 2
ምርህኝ ምርህኝ አያልቅም ምህርትህ
አይተህኝ በምህርት. አይተህኝ በምህርት
ዜሬም አለሁኝ በህይወት
አዝማች +

VERSE 3
የምስጋና መስዋዕት.ማቅርቢያ መስዊህ
ልቤ ንፁህ ባይሆን. ፀጋዬን አልቀማህ
ትቀበለኛለህ. ሞልተህ በጎደለ
እኔን የወደደ. እንደ አንተ ማን አለ

VERSE 4
አይተህኝ በምህርት. አይተህኝ በምህርት
ዛሬም. አለሁኝ በህይወት
በምኙት ተስቤ. ለሀጢአት ተሽጨ

VERSE 5
ለመስቀልህ ስራ. ክሞት ጣር አምልጨ
አንተ እንዳዳንክው. ስው መሆን ቢቅትም
እኔ ተስፈ ብቁርጥ
ተስፋ አትቁርጥብኝም

VERSE 6
አይተህኝ በምህርት.
አይተህኝ በምህርት
ዛሬም አለሁኝ በህይወት

VERSE 7
የኖርኩበት ዘመን. የቁጣ ልጅ ሆኝ
ምዕራፍ ተዘጋ በአንተ በአዳኘ
ክእኔ ምንም ሳይኖር አንተ ሁሉን ሆነህ
ስገነት ታየሁኝ. ስለ እኔ ተንቀህ

VERSE 8
አይተህኝ በምህርት ፣አይተህኝ በምህርት
ዛሬም. አለሁኝ በህይወት
እኔ ማርኝ ክምል ክፊትህ ወድቄ

VERSE 9
በሌላው ፍራጅ ነኝ ራሴን አፃድቂ
መመልክት ባልችልም የአይኔን ምሰሶ
ሚኖርኝ ፍቅርህ ነው ይህን ሁሉ ታግሶ
አይተህኝ በምህርት

VERSE 10
አይተህኝ በምህርት
ዛሬም አለሁኝ በህይወት
እንደ እኔ የማርክው ማንን ነው

VERSE 11
እንደ እኔ ይቅር ያለው ማንን ነው
ሀጢቱ በዝቱበት
በደሉ በዝቶበት የማርክው
እንደ እኔ ክቶ ማን ነው

VERSE 12
ይቅር ስላልከኝ ነዉ የእኔ መቆም ፣
ደግሞ እንዳልፈርድ እርዳኝ፣
በሰዎች ድካም።
ባታለብሰኝ ኖሮ ነዉሬን ሸፍነህ ፣

VERSE 13
በታቆመኝ ኖሮ በደሌን ከድነህ፣
በጠፋ ነበር ስም አጠራሬ ፣
ድካሜ ብዙ ነዉ እንደ ራስ ፀጉሬ።
ጉዲፉን አልይ የወንድሜን በደል፣

VERSE 14
አለ በነ ላይ ምሶሶን የምያህል።',
      lyrics_transliteration = 'Ende ene yemarkw mann new
Ende ene yiqr yalkw mann new
Het’iatu beztobet
Bedelu beztobet yemarkw. ((( (2))

VERSE 1
Ende ene kito ma new
Bemoges asgit’eh bezema qagnhgn
Fith emtaqomegn. getaye ene man negn
Leene yabezahw. abet degneth

VERSE 2
Mirhgn mirhgn ayalqm mihrth
Aytehgn bemhrt. aytehgn bemhrt
Zerem alehugn behywet

VERSE 3
Yemsgana meswaet.maqrbiya meswih
Libe nits’uh bayhon. ts’egayen alqemah
Tiqebelegnaleh. molteh begodele
Enen yewedede. ende ante man ale

VERSE 4
Aytehgn bemhrt. aytehgn bemhrt
Zarem. alehugn behywet
Bemgnut tesbe. lehet’iat teshch’e

VERSE 5
Lemesqelh sira. kimot t’ar amlch’e
Ante endadankw. siw mehon biqtm
Ene tesfe biqurt’
Tesfa atqurt’bgnm

VERSE 6
Aytehgn bemhrt.
Aytehgn bemhrt
Zarem alehugn behywet

VERSE 7
Yenorkubet zemen. yequt’a lij hogn
Mieraf tezega beante beadagne
Kiene minm saynor ante hulun honeh
Sigenet tayehugn. sile ene tenqeh

VERSE 8
Aytehgn bemhrt ,aytehgn bemhrt
Zarem. alehugn behywet
Ene margn kiml kifith wedqe

VERSE 9
Belelaw firaj negn rasen ats’adqi
Memelkt balchlm yeaynen miseso
Minorgn fiqrh new yihn hulu tagso
Aytehgn bemhrt

VERSE 10
Aytehgn bemhrt
Zarem alehugn behywet
Ende ene yemarkw mann new

VERSE 11
Ende ene yiqr yalew mann new
Het’itu beztubet
Bedelu beztobet yemarkw
Ende ene kito man new

VERSE 12
Yiqr silalkegn newu yeene meqom ,
Degmo endalferd erdagn,
Besewoch dikam.
Batalebsegn noro newuren shefneh ,

VERSE 13
Betaqomegn noro bedelen kedneh,
Bet’efa neber sim at’erare ,
Dikame bizu newu ende ras ts’egure.
Gudifun aly yewendmen bedel,

VERSE 14
Ale bene lay misoson yemyahl.',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'live-performance-3150'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያልክው ማንን ነው
ሀጢአቱ በዝቶበት
በደሉ በዝቶበት የማርክው. ((((2))

VERSE 1
እንደ እኔ ክቶ ማ ነው
በሞገስ አስጊጠህ በዜማ ቃኝህኝ
ፊትህ እምታቆመኝ. ጌታየ እኔ ማን ነኝ
ለእኔ ያበዛህው. አቤት ደግነትህ

CHORUS
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያልክው ማንን ነው
ሀጢአቱ በዝቶበት
በደሉ በዝቶበት የማርክው. ((((2))

VERSE 2
ምርህኝ ምርህኝ አያልቅም ምህርትህ
አይተህኝ በምህርት. አይተህኝ በምህርት
ዜሬም አለሁኝ በህይወት
አዝማች +

CHORUS
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያልክው ማንን ነው
ሀጢአቱ በዝቶበት
በደሉ በዝቶበት የማርክው. ((((2))

VERSE 3
የምስጋና መስዋዕት.ማቅርቢያ መስዊህ
ልቤ ንፁህ ባይሆን. ፀጋዬን አልቀማህ
ትቀበለኛለህ. ሞልተህ በጎደለ
እኔን የወደደ. እንደ አንተ ማን አለ

CHORUS
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያልክው ማንን ነው
ሀጢአቱ በዝቶበት
በደሉ በዝቶበት የማርክው. ((((2))

VERSE 4
አይተህኝ በምህርት. አይተህኝ በምህርት
ዛሬም. አለሁኝ በህይወት
አዝማች
በምኙት ተስቤ. ለሀጢአት ተሽጨ

CHORUS
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያልክው ማንን ነው
ሀጢአቱ በዝቶበት
በደሉ በዝቶበት የማርክው. ((((2))

VERSE 5
ለመስቀልህ ስራ. ክሞት ጣር አምልጨ
አንተ እንዳዳንክው. ስው መሆን ቢቅትም
እኔ ተስፈ ብቁርጥ
ተስፋ አትቁርጥብኝም

CHORUS
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያልክው ማንን ነው
ሀጢአቱ በዝቶበት
በደሉ በዝቶበት የማርክው. ((((2))

VERSE 6
አይተህኝ በምህርት.
አይተህኝ በምህርት
ዛሬም አለሁኝ በህይወት
አዝማች

CHORUS
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያልክው ማንን ነው
ሀጢአቱ በዝቶበት
በደሉ በዝቶበት የማርክው. ((((2))

VERSE 7
የኖርኩበት ዘመን. የቁጣ ልጅ ሆኝ
ምዕራፍ ተዘጋ በአንተ በአዳኘ
ክእኔ ምንም ሳይኖር አንተ ሁሉን ሆነህ
ስገነት ታየሁኝ. ስለ እኔ ተንቀህ

CHORUS
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያልክው ማንን ነው
ሀጢአቱ በዝቶበት
በደሉ በዝቶበት የማርክው. ((((2))

VERSE 8
አይተህኝ በምህርት ፣አይተህኝ በምህርት
ዛሬም. አለሁኝ በህይወት
አዝማች
እኔ ማርኝ ክምል ክፊትህ ወድቄ

CHORUS
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያልክው ማንን ነው
ሀጢአቱ በዝቶበት
በደሉ በዝቶበት የማርክው. ((((2))

VERSE 9
በሌላው ፍራጅ ነኝ ራሴን አፃድቂ
መመልክት ባልችልም የአይኔን ምሰሶ
ሚኖርኝ ፍቅርህ ነው ይህን ሁሉ ታግሶ
አይተህኝ በምህርት

CHORUS
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያልክው ማንን ነው
ሀጢአቱ በዝቶበት
በደሉ በዝቶበት የማርክው. ((((2))

VERSE 10
አይተህኝ በምህርት
ዛሬም አለሁኝ በህይወት
አዝማች
እንደ እኔ የማርክው ማንን ነው

CHORUS
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያልክው ማንን ነው
ሀጢአቱ በዝቶበት
በደሉ በዝቶበት የማርክው. ((((2))

VERSE 11
እንደ እኔ ይቅር ያለው ማንን ነው
ሀጢቱ በዝቱበት
በደሉ በዝቶበት የማርክው
እንደ እኔ ክቶ ማን ነው

CHORUS
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያልክው ማንን ነው
ሀጢአቱ በዝቶበት
በደሉ በዝቶበት የማርክው. ((((2))

VERSE 12
ይቅር ስላልከኝ ነዉ የእኔ መቆም ፣
ደግሞ እንዳልፈርድ እርዳኝ፣
በሰዎች ድካም።
ባታለብሰኝ ኖሮ ነዉሬን ሸፍነህ ፣

CHORUS
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያልክው ማንን ነው
ሀጢአቱ በዝቶበት
በደሉ በዝቶበት የማርክው. ((((2))

VERSE 13
በታቆመኝ ኖሮ በደሌን ከድነህ፣
በጠፋ ነበር ስም አጠራሬ ፣
ድካሜ ብዙ ነዉ እንደ ራስ ፀጉሬ።
ጉዲፉን አልይ የወንድሜን በደል፣

CHORUS
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያልክው ማንን ነው
ሀጢአቱ በዝቶበት
በደሉ በዝቶበት የማርክው. ((((2))

VERSE 14
አለ በነ ላይ ምሶሶን የምያህል።

CHORUS
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያልክው ማንን ነው
ሀጢአቱ በዝቶበት
በደሉ በዝቶበት የማርክው. ((((2))'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ende ene yemarkw mann new
Ende ene yiqr yalkw mann new
Het’iatu beztobet
Bedelu beztobet yemarkw. ((( (2))

VERSE 1
Ende ene kito ma new
Bemoges asgit’eh bezema qagnhgn
Fith emtaqomegn. getaye ene man negn
Leene yabezahw. abet degneth

CHORUS
Ende ene yemarkw mann new
Ende ene yiqr yalkw mann new
Het’iatu beztobet
Bedelu beztobet yemarkw. ((( (2))

VERSE 2
Mirhgn mirhgn ayalqm mihrth
Aytehgn bemhrt. aytehgn bemhrt
Zerem alehugn behywet
CHORUS

CHORUS
Ende ene yemarkw mann new
Ende ene yiqr yalkw mann new
Het’iatu beztobet
Bedelu beztobet yemarkw. ((( (2))

VERSE 3
Yemsgana meswaet.maqrbiya meswih
Libe nits’uh bayhon. ts’egayen alqemah
Tiqebelegnaleh. molteh begodele
Enen yewedede. ende ante man ale

CHORUS
Ende ene yemarkw mann new
Ende ene yiqr yalkw mann new
Het’iatu beztobet
Bedelu beztobet yemarkw. ((( (2))

VERSE 4
Aytehgn bemhrt. aytehgn bemhrt
Zarem. alehugn behywet
CHORUS
Bemgnut tesbe. lehet’iat teshch’e

CHORUS
Ende ene yemarkw mann new
Ende ene yiqr yalkw mann new
Het’iatu beztobet
Bedelu beztobet yemarkw. ((( (2))

VERSE 5
Lemesqelh sira. kimot t’ar amlch’e
Ante endadankw. siw mehon biqtm
Ene tesfe biqurt’
Tesfa atqurt’bgnm

CHORUS
Ende ene yemarkw mann new
Ende ene yiqr yalkw mann new
Het’iatu beztobet
Bedelu beztobet yemarkw. ((( (2))

VERSE 6
Aytehgn bemhrt.
Aytehgn bemhrt
Zarem alehugn behywet
CHORUS

CHORUS
Ende ene yemarkw mann new
Ende ene yiqr yalkw mann new
Het’iatu beztobet
Bedelu beztobet yemarkw. ((( (2))

VERSE 7
Yenorkubet zemen. yequt’a lij hogn
Mieraf tezega beante beadagne
Kiene minm saynor ante hulun honeh
Sigenet tayehugn. sile ene tenqeh

CHORUS
Ende ene yemarkw mann new
Ende ene yiqr yalkw mann new
Het’iatu beztobet
Bedelu beztobet yemarkw. ((( (2))

VERSE 8
Aytehgn bemhrt ,aytehgn bemhrt
Zarem. alehugn behywet
CHORUS
Ene margn kiml kifith wedqe

CHORUS
Ende ene yemarkw mann new
Ende ene yiqr yalkw mann new
Het’iatu beztobet
Bedelu beztobet yemarkw. ((( (2))

VERSE 9
Belelaw firaj negn rasen ats’adqi
Memelkt balchlm yeaynen miseso
Minorgn fiqrh new yihn hulu tagso
Aytehgn bemhrt

CHORUS
Ende ene yemarkw mann new
Ende ene yiqr yalkw mann new
Het’iatu beztobet
Bedelu beztobet yemarkw. ((( (2))

VERSE 10
Aytehgn bemhrt
Zarem alehugn behywet
CHORUS
Ende ene yemarkw mann new

CHORUS
Ende ene yemarkw mann new
Ende ene yiqr yalkw mann new
Het’iatu beztobet
Bedelu beztobet yemarkw. ((( (2))

VERSE 11
Ende ene yiqr yalew mann new
Het’itu beztubet
Bedelu beztobet yemarkw
Ende ene kito man new

CHORUS
Ende ene yemarkw mann new
Ende ene yiqr yalkw mann new
Het’iatu beztobet
Bedelu beztobet yemarkw. ((( (2))

VERSE 12
Yiqr silalkegn newu yeene meqom ,
Degmo endalferd erdagn,
Besewoch dikam.
Batalebsegn noro newuren shefneh ,

CHORUS
Ende ene yemarkw mann new
Ende ene yiqr yalkw mann new
Het’iatu beztobet
Bedelu beztobet yemarkw. ((( (2))

VERSE 13
Betaqomegn noro bedelen kedneh,
Bet’efa neber sim at’erare ,
Dikame bizu newu ende ras ts’egure.
Gudifun aly yewendmen bedel,

CHORUS
Ende ene yemarkw mann new
Ende ene yiqr yalkw mann new
Het’iatu beztobet
Bedelu beztobet yemarkw. ((( (2))

VERSE 14
Ale bene lay misoson yemyahl.

CHORUS
Ende ene yemarkw mann new
Ende ene yiqr yalkw mann new
Het’iatu beztobet
Bedelu beztobet yemarkw. ((( (2))'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'live-performance-3150', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Lord it is your grace (lord-it-is-your-grace)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)

VERSE 1
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)',
      lyrics_transliteration = 'Cherinetih new yaderesegn eske zare
Cherinetih new yetebeqegn eske zare
Lamesginih yene Geta be zimare

VERSE 1
Cherinetih new yaderesegn eske zare
Cherinetih new yetebeqegn eske zare
Lamesginih yene Geta be zimare',
      lyrics_english = 'Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)

VERSE 1
If I hide my talents and displease you
If I don’t have my lamp nor wait for you
Don’t forget me my Lord won’t you forgive
With love save me from death so I can live

VERSE 2
I’m never satisfied away from you
I’m feeling so empty and hopeless too
I know you will offer me salvation
I’ve come in repentance with devotion

VERSE 3
Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)

VERSE 4
I have nothing else left you’re my last hope
But you are kind to me that’s how I cope
The weight on my shoulders is lighter now
I received your mercy to you I bow

VERSE 5
When I sing you this hymn in your temple
When I tell others of your miracle
Who am I to praise you it''s not my place
Lord I marvel at your abundant grace

VERSE 6
Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)

VERSE 7
I stopped putting my faith onto others
Through mercy and kindness you''re my helper
With you sustaining me my life has healed
You are my medicine you are my shield

VERSE 8
I’m falling short of what you asked of me
The mystery on the Cross I failed to see
My Lord disperse the fog that blocks my sight
Then I’ll focus on you dear Jesus Christ

VERSE 9
Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)

VERSE 10
Cherinetih new yaderesegn eske zare
Cherinetih new yetebeqegn eske zare
Lamesginih yene Geta be zimare (2)

VERSE 11
Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'lord-it-is-your-grace'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)

VERSE 1
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)

CHORUS
ቸርነትህ ነው ያደረሰኝ እስከ ዛሬ
ቸርነትህ ነው የጠበቀኝ እስከ ዛሬ
ላመስግንህ የኔ ጌታ በዝማሬ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Cherinetih new yaderesegn eske zare
Cherinetih new yetebeqegn eske zare
Lamesginih yene Geta be zimare

VERSE 1
Cherinetih new yaderesegn eske zare
Cherinetih new yetebeqegn eske zare
Lamesginih yene Geta be zimare

CHORUS
Cherinetih new yaderesegn eske zare
Cherinetih new yetebeqegn eske zare
Lamesginih yene Geta be zimare'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)

VERSE 1
If I hide my talents and displease you
If I don’t have my lamp nor wait for you
Don’t forget me my Lord won’t you forgive
With love save me from death so I can live

CHORUS
Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)

VERSE 2
I’m never satisfied away from you
I’m feeling so empty and hopeless too
I know you will offer me salvation
I’ve come in repentance with devotion

CHORUS
Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)

VERSE 3
Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)

CHORUS
Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)

VERSE 4
I have nothing else left you’re my last hope
But you are kind to me that’s how I cope
The weight on my shoulders is lighter now
I received your mercy to you I bow

CHORUS
Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)

VERSE 5
When I sing you this hymn in your temple
When I tell others of your miracle
Who am I to praise you it''s not my place
Lord I marvel at your abundant grace

CHORUS
Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)

VERSE 6
Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)

CHORUS
Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)

VERSE 7
I stopped putting my faith onto others
Through mercy and kindness you''re my helper
With you sustaining me my life has healed
You are my medicine you are my shield

CHORUS
Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)

VERSE 8
I’m falling short of what you asked of me
The mystery on the Cross I failed to see
My Lord disperse the fog that blocks my sight
Then I’ll focus on you dear Jesus Christ

CHORUS
Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)

VERSE 9
Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)

CHORUS
Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)

VERSE 10
Cherinetih new yaderesegn eske zare
Cherinetih new yetebeqegn eske zare
Lamesginih yene Geta be zimare (2)

CHORUS
Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)

VERSE 11
Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)

CHORUS
Lord it is your grace that preserves me for all my days
Lord it is your grace that shepherds me for all my days
Unto you I will chant these words to offer praise (2)'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'lord-it-is-your-grace', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Lyric (lyric-1245)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 1
ከመሬት ላይ ያለች ሁለተኛ ሰማይ
ልጇ ከፍ አረገን ወሰደን ወደላይ
የእግዚአብሔር ጥበቡ የተፃፈብሽ
ማንም የማይነካው ድንቅ መዝገብ ነሽ

VERSE 2
የሚያውቀውን ሚስጥር የሰማውን ድንቅ
አለም ይቸኩላል ለሰው ሊያሳውቅ
ከንቱውን ምስጋና አትሻውምና
ያንን ልዩ መዝገብ በልቧ ያዘችው ድንግል በትህትና

VERSE 3
መላኩ ሲነግራት ትወልጃለሽ ብሎ
አምና ተቀበለች አለች እንደ ቃሉ
እጅግ የሚፈራ የሚነገር ነበር
ያደረው በሆዷ የሰማችው ሚስጥር

VERSE 4
የሚያውቀውን ሚስጥር የሰማውን ድንቅ
አለም ይቸኩላል ለሰው ሊያሳውቅ
ከንቱውን ምስጋና አትሻውምና
ያንን ልዩ መዝገብ በልቧ ያዘችው ድንግል በትህትና

VERSE 5
ፀጋንና ክብርን ከተቀበሉት
ባማረ ማጌጫ ከተሸለሙት
የሚስተካከላት የሚያክላት ማነው
ክብሯ ከአድባራቱ ከፍ ከፍ ያለ ነው

VERSE 6
የሚያውቀውን ሚስጥር የሰማውን ድንቅ
አለም ይቸኩላል ለሰው ሊያሳውቅ
ከንቱውን ምስጋና አትሻውምና
ያንን ልዩ መዝገብ በልቧ ያዘችው ድንግል በትህትና

VERSE 7
መላኩ ሲነግራት ትወልጃለሽ ብሎ
አምና ተቀበለች አለች እንደ ቃሉ
እጅግ የሚፈራ የሚነገር ነበር
ያደረው በሆዷ የሰማችው ሚስጥር

VERSE 8
የሚያውቀውን ሚስጥር የሰማውን ድንቅ
አለም ይቸኩላል ለሰው ሊያሳውቅ
ከንቱውን ምስጋና አትሻውምና
ያንን ልዩ መዝገብ በልቧ ያዘችው ድንግል በትህትና

VERSE 9
አዝማች (፪)',
      lyrics_transliteration = 'Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 1
Kemeret lay yalech huletegna semay
Lijwa kef aregen weseden wedelay
YeEgziabher t’bebu yetets’afebsh
Manm yemaynekaw dinq mezgeb nesh

VERSE 2
Yemiyawqewn mist’r yesemawn dinq
Alem yichekulal lesew liyasawq
Kentuwn misgana atshawmna
Yann liyu mezgeb belbwa yazechw Dingil bethtna

VERSE 3
Melaku sinegrat tiweljalesh bilo
Amna teqebelech alech ende qalu
Ejg yemifera yemineger neber
Yaderew behodwa yesemachw mist’r

VERSE 4
Yemiyawqewn mist’r yesemawn dinq
Alem yichekulal lesew liyasawq
Kentuwn misgana atshawmna
Yann liyu mezgeb belbwa yazechw Dingil bethtna

VERSE 5
Ts’eganna kibrn keteqebelut
Bamare magech’a keteshelemut
Yemistekakelat yemiyaklat manew
Kibrwa keadbaratu kef kef yale new

VERSE 6
Yemiyawqewn mist’r yesemawn dinq
Alem yichekulal lesew liyasawq
Kentuwn misgana atshawmna
Yann liyu mezgeb belbwa yazechw Dingil bethtna

VERSE 7
Melaku sinegrat tiweljalesh bilo
Amna teqebelech alech ende qalu
Ejg yemifera yemineger neber
Yaderew behodwa yesemachw mist’r

VERSE 8
Yemiyawqewn mist’r yesemawn dinq
Alem yichekulal lesew liyasawq
Kentuwn misgana atshawmna
Yann liyu mezgeb belbwa yazechw Dingil bethtna

VERSE 9',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'lyric-1245'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 1
ከመሬት ላይ ያለች ሁለተኛ ሰማይ
ልጇ ከፍ አረገን ወሰደን ወደላይ
የእግዚአብሔር ጥበቡ የተፃፈብሽ
ማንም የማይነካው ድንቅ መዝገብ ነሽ

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 2
የሚያውቀውን ሚስጥር የሰማውን ድንቅ
አለም ይቸኩላል ለሰው ሊያሳውቅ
ከንቱውን ምስጋና አትሻውምና
ያንን ልዩ መዝገብ በልቧ ያዘችው ድንግል በትህትና

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 3
መላኩ ሲነግራት ትወልጃለሽ ብሎ
አምና ተቀበለች አለች እንደ ቃሉ
እጅግ የሚፈራ የሚነገር ነበር
ያደረው በሆዷ የሰማችው ሚስጥር

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 4
የሚያውቀውን ሚስጥር የሰማውን ድንቅ
አለም ይቸኩላል ለሰው ሊያሳውቅ
ከንቱውን ምስጋና አትሻውምና
ያንን ልዩ መዝገብ በልቧ ያዘችው ድንግል በትህትና

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 5
ፀጋንና ክብርን ከተቀበሉት
ባማረ ማጌጫ ከተሸለሙት
የሚስተካከላት የሚያክላት ማነው
ክብሯ ከአድባራቱ ከፍ ከፍ ያለ ነው

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 6
የሚያውቀውን ሚስጥር የሰማውን ድንቅ
አለም ይቸኩላል ለሰው ሊያሳውቅ
ከንቱውን ምስጋና አትሻውምና
ያንን ልዩ መዝገብ በልቧ ያዘችው ድንግል በትህትና

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 7
መላኩ ሲነግራት ትወልጃለሽ ብሎ
አምና ተቀበለች አለች እንደ ቃሉ
እጅግ የሚፈራ የሚነገር ነበር
ያደረው በሆዷ የሰማችው ሚስጥር

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 8
የሚያውቀውን ሚስጥር የሰማውን ድንቅ
አለም ይቸኩላል ለሰው ሊያሳውቅ
ከንቱውን ምስጋና አትሻውምና
ያንን ልዩ መዝገብ በልቧ ያዘችው ድንግል በትህትና

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)

VERSE 9
አዝማች (፪)

CHORUS
በልቧ ትጠብቀው ነበር ( ፪)
ለርሷ ያደረገው ያንን ድንቅ ነገር
ታላቁን መገለጥ ያንን ድንቅ ነገር
በልቧ ትጠብቀው ነበር (፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 1
Kemeret lay yalech huletegna semay
Lijwa kef aregen weseden wedelay
YeEgziabher t’bebu yetets’afebsh
Manm yemaynekaw dinq mezgeb nesh

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 2
Yemiyawqewn mist’r yesemawn dinq
Alem yichekulal lesew liyasawq
Kentuwn misgana atshawmna
Yann liyu mezgeb belbwa yazechw Dingil bethtna

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 3
Melaku sinegrat tiweljalesh bilo
Amna teqebelech alech ende qalu
Ejg yemifera yemineger neber
Yaderew behodwa yesemachw mist’r

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 4
Yemiyawqewn mist’r yesemawn dinq
Alem yichekulal lesew liyasawq
Kentuwn misgana atshawmna
Yann liyu mezgeb belbwa yazechw Dingil bethtna

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 5
Ts’eganna kibrn keteqebelut
Bamare magech’a keteshelemut
Yemistekakelat yemiyaklat manew
Kibrwa keadbaratu kef kef yale new

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 6
Yemiyawqewn mist’r yesemawn dinq
Alem yichekulal lesew liyasawq
Kentuwn misgana atshawmna
Yann liyu mezgeb belbwa yazechw Dingil bethtna

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 7
Melaku sinegrat tiweljalesh bilo
Amna teqebelech alech ende qalu
Ejg yemifera yemineger neber
Yaderew behodwa yesemachw mist’r

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 8
Yemiyawqewn mist’r yesemawn dinq
Alem yichekulal lesew liyasawq
Kentuwn misgana atshawmna
Yann liyu mezgeb belbwa yazechw Dingil bethtna

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)

VERSE 9
CHORUS

CHORUS
Belbwa tit’ebqew neber (2)
Lerswa yaderegew yann dinq neger
Talaqun megelet’ yann dinq neger
Belbwa tit’ebqew neber (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'lyric-1245', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Maedote (maedote)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ

VERSE 1
በመስቀሉ ጉዞ በእድካሚው ተራራ
ዘንጌን አንቺን ይዤ ዳገቱን ሳልፈራ
ስንቅ ነው እያልኩኝ ስምሽ ለመንገዴ
ካየልኝ ገባለሁ የብርሃን አምዴ

VERSE 2
መንፈሳዊት መርከብ ድንግላዊት መጾር
የመለኮት አትሮንስ የሰላሜ ቅጥር
የመድኃኒቴ ደጅ ከሰርጉ መግቢያዬ
የድህነት ማህተሜ ሞትን ማለፊያዬ

VERSE 3
ምድር ወፍጮ ሆና መጅ ቢሆን ሰማዩ
ተራሮች ተንደው ቢነደል ቀላዩ
የሚያደርጉኝ የለም አልፈው የእርሷን ስም
አልሰጋ አልደነግጥ አልፈራም ፍጹም

VERSE 4
የረአብ ቀይ ፈትል ከሞት እንዳስጣላት
ምልክት ሆኖኛል የልጅሽ ደም ቅላት
እሳት በዳሰሱት ቅዱሳት እጆችሽ
ከሚመጣው መቅሰፍት እድናለሁ ልጅሽ',
      lyrics_transliteration = 'Maedote new miljash maedote
Meshageriyaye medresha kerste
Etonu esat wejebu bikebdbgn
Yemiyasmeka kidansh alelgn

VERSE 1
Bemesqelu guzo beedkamiw terara
Zengen anchin yizhe dagetun salfera
Sinq new eyalkugn simsh lemengede
Kayelgn gebalehu yebrhan amde

VERSE 2
Menfesawit merkeb dinglawit mets’or
Yemelekot atrons yeselame qit’r
Yemedhanite dej kesergu megbiyaye
Yedhnet mahteme motn malefiyaye

VERSE 3
Midr wefch’o hona mej bihon semayu
Teraroch tendew binedel qelayu
Yemiyadergugn yelem alfew yeerswan sim
Alsega aldenegt’ alferam fits’um

VERSE 4
Yereab qey fetl kemot endast’alat
Milkt honognal yeljsh dem qilat
Esat bedasesut qidusat ejochsh
Kemimet’aw meqseft ednalehu lijsh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'maedote'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ

VERSE 1
በመስቀሉ ጉዞ በእድካሚው ተራራ
ዘንጌን አንቺን ይዤ ዳገቱን ሳልፈራ
ስንቅ ነው እያልኩኝ ስምሽ ለመንገዴ
ካየልኝ ገባለሁ የብርሃን አምዴ

CHORUS
ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ

VERSE 2
መንፈሳዊት መርከብ ድንግላዊት መጾር
የመለኮት አትሮንስ የሰላሜ ቅጥር
የመድኃኒቴ ደጅ ከሰርጉ መግቢያዬ
የድህነት ማህተሜ ሞትን ማለፊያዬ

CHORUS
ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ

VERSE 3
ምድር ወፍጮ ሆና መጅ ቢሆን ሰማዩ
ተራሮች ተንደው ቢነደል ቀላዩ
የሚያደርጉኝ የለም አልፈው የእርሷን ስም
አልሰጋ አልደነግጥ አልፈራም ፍጹም

CHORUS
ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ

VERSE 4
የረአብ ቀይ ፈትል ከሞት እንዳስጣላት
ምልክት ሆኖኛል የልጅሽ ደም ቅላት
እሳት በዳሰሱት ቅዱሳት እጆችሽ
ከሚመጣው መቅሰፍት እድናለሁ ልጅሽ

CHORUS
ማዕዶቴ ነው ምልጃሽ ማዕዶቴ
መሻገሪያዬ መድረሻ ከርስቴ
እቶኑ እሳት ወጀቡ ቢከብድብኝ
የሚያስመካ ኪዳንሽ አለልኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maedote new miljash maedote
Meshageriyaye medresha kerste
Etonu esat wejebu bikebdbgn
Yemiyasmeka kidansh alelgn

VERSE 1
Bemesqelu guzo beedkamiw terara
Zengen anchin yizhe dagetun salfera
Sinq new eyalkugn simsh lemengede
Kayelgn gebalehu yebrhan amde

CHORUS
Maedote new miljash maedote
Meshageriyaye medresha kerste
Etonu esat wejebu bikebdbgn
Yemiyasmeka kidansh alelgn

VERSE 2
Menfesawit merkeb dinglawit mets’or
Yemelekot atrons yeselame qit’r
Yemedhanite dej kesergu megbiyaye
Yedhnet mahteme motn malefiyaye

CHORUS
Maedote new miljash maedote
Meshageriyaye medresha kerste
Etonu esat wejebu bikebdbgn
Yemiyasmeka kidansh alelgn

VERSE 3
Midr wefch’o hona mej bihon semayu
Teraroch tendew binedel qelayu
Yemiyadergugn yelem alfew yeerswan sim
Alsega aldenegt’ alferam fits’um

CHORUS
Maedote new miljash maedote
Meshageriyaye medresha kerste
Etonu esat wejebu bikebdbgn
Yemiyasmeka kidansh alelgn

VERSE 4
Yereab qey fetl kemot endast’alat
Milkt honognal yeljsh dem qilat
Esat bedasesut qidusat ejochsh
Kemimet’aw meqseft ednalehu lijsh

CHORUS
Maedote new miljash maedote
Meshageriyaye medresha kerste
Etonu esat wejebu bikebdbgn
Yemiyasmeka kidansh alelgn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'maedote', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Maetebe Tirigum New (maetebe-tirigum-new)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 1
የማይበጠስ ነው በእምነት የታሰረ፣
በአምላኬ ፍቅር በደም የከበረ
አንገቴ ላይ ያለው በልቤም ውስጥ ጠልቋል፣
ማሀይተቤን ሊያስበጥስ ከቶ ማን ይችላል(2)

VERSE 2
ከክስ ማምለጫ የእምነት ምልክቴ፣
እየመሰከረ ይኖራል በአንገቴ(2)
መሀተቤ ትርጉም ነው የክርስትናየ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ

VERSE 3
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)
መከራ መሆኑ የተቀደሰ ነው
ዳግመኛ ስወለድ ካህኑ ያሰረው

VERSE 4
የእምነቴ ማህተብ አርማየ ነው እና፣
ይኖራል በአንገቴ እንደ መቅረዝ ፋና(2)
ከክስ ማምለጫ የእምነት ምልክቴ፣
እየመሰከረ ይኖራል በአንገቴ(2)

VERSE 5
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 6
ጠላት ይፈራዋል የነብሴ መንገሻ፣
የሰማይ መንገዴ ድልድይ መዳረሻ ፣
ማሀይተቤን እያየ አይችልም ሊፀና፣
በመስቀሉ አፍሮ ተቀጥቅጧል እና (2)

VERSE 7
ከክስ ማምለጫ የእምነት ምልክቴ፣
እየመሰከረ ይኖራል በአንገቴ(2)
መሀይተቤ ትርጉም ነው ለክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ

VERSE 8
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)',
      lyrics_transliteration = 'Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 1
Yemaybet’es new beemnet yetasere,
Beamlake fiqr bedem yekebere
Angete lay yalew belbem wist’ t’elqwal,
Maheyteben liyasbet’s keto man yichlal (2)

VERSE 2
Keks mamlech’a yeemnet milkte,
Eyemesekere yinoral beangete (2)
Mehetebe tirgum new yekrstnaye,
Teketelegn bilo yeset’egn getaye

VERSE 3
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)
Mekera mehonu yeteqedese new
Dagmegna siweled kahnu yaserew

VERSE 4
Yeemnete mahteb armaye new ena,
Yinoral beangete ende meqrez fana (2)
Keks mamlech’a yeemnet milkte,
Eyemesekere yinoral beangete (2)

VERSE 5
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 6
T’elat yiferawal yenebse mengesha,
Yesemay mengede dildy medaresha ,
Maheyteben eyaye aychlm lits’ena,
Bemesqelu afro teqet’qt’wal ena (2)

VERSE 7
Keks mamlech’a yeemnet milkte,
Eyemesekere yinoral beangete (2)
Meheytebe tirgum new lekrstnaye ,
Teketelegn bilo yeset’egn getaye

VERSE 8
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'maetebe-tirigum-new'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 1
የማይበጠስ ነው በእምነት የታሰረ፣
በአምላኬ ፍቅር በደም የከበረ
አንገቴ ላይ ያለው በልቤም ውስጥ ጠልቋል፣
ማሀይተቤን ሊያስበጥስ ከቶ ማን ይችላል(2)

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 2
ከክስ ማምለጫ የእምነት ምልክቴ፣
እየመሰከረ ይኖራል በአንገቴ(2)
መሀተቤ ትርጉም ነው የክርስትናየ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 3
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)
መከራ መሆኑ የተቀደሰ ነው
ዳግመኛ ስወለድ ካህኑ ያሰረው

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 4
የእምነቴ ማህተብ አርማየ ነው እና፣
ይኖራል በአንገቴ እንደ መቅረዝ ፋና(2)
ከክስ ማምለጫ የእምነት ምልክቴ፣
እየመሰከረ ይኖራል በአንገቴ(2)

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 5
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 6
ጠላት ይፈራዋል የነብሴ መንገሻ፣
የሰማይ መንገዴ ድልድይ መዳረሻ ፣
ማሀይተቤን እያየ አይችልም ሊፀና፣
በመስቀሉ አፍሮ ተቀጥቅጧል እና (2)

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 7
ከክስ ማምለጫ የእምነት ምልክቴ፣
እየመሰከረ ይኖራል በአንገቴ(2)
መሀይተቤ ትርጉም ነው ለክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

VERSE 8
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)

CHORUS
መሀይተቤ ትርጉም ነው የክርስትናየ ፣
ተከተለኝ ብሎ የሰጠኝ ጌታየ
በመስቀሉ ፍቅር ስጋየን ገድየ
እሸከመዋለው ምኞቴን ሰቅየ(2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 1
Yemaybet’es new beemnet yetasere,
Beamlake fiqr bedem yekebere
Angete lay yalew belbem wist’ t’elqwal,
Maheyteben liyasbet’s keto man yichlal (2)

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 2
Keks mamlech’a yeemnet milkte,
Eyemesekere yinoral beangete (2)
Mehetebe tirgum new yekrstnaye,
Teketelegn bilo yeset’egn getaye

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 3
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)
Mekera mehonu yeteqedese new
Dagmegna siweled kahnu yaserew

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 4
Yeemnete mahteb armaye new ena,
Yinoral beangete ende meqrez fana (2)
Keks mamlech’a yeemnet milkte,
Eyemesekere yinoral beangete (2)

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 5
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 6
T’elat yiferawal yenebse mengesha,
Yesemay mengede dildy medaresha ,
Maheyteben eyaye aychlm lits’ena,
Bemesqelu afro teqet’qt’wal ena (2)

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 7
Keks mamlech’a yeemnet milkte,
Eyemesekere yinoral beangete (2)
Meheytebe tirgum new lekrstnaye ,
Teketelegn bilo yeset’egn getaye

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

VERSE 8
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)

CHORUS
Meheytebe tirgum new yekrstnaye ,
Teketelegn bilo yeset’egn getaye
Bemesqelu fiqr sigayen gedye
Eshekemewalew mignoten seqye (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'maetebe-tirigum-new', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Man Yimeramer (man-yimeramer)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 1
ማን ይመራመር?
"በቀዳማይ ዕለት ፣ ቀዳማይ ሰዓት፥
መፍጠር እስክትጀምር አራት ባሕርያት፥
ለምን አልፈጠርክም ቀድመህ?" ቢል ደራሲ፥

VERSE 2
አይመረመርም "ቅድመ ዓለም ነጋሢ"
ያንተን ሥራ. . . .
እሳትና ውኃ ነፋስና መሬት፥
"እም ኀበ አልቦ" መጡ ካለመኖር እንዴት?

VERSE 3
በአርምሞ ሰባት ፣ በቃሉም ዐሥራ አራት፥
የመፍጠሩን ጥበብ ማን ሊመረምራት?
ያንተን ሥራ
ስፉህ ፣ ምጡቅ መልኩን በእጁ ፣ ባ''ፈር መሣል፥

VERSE 4
በእስትፋንሱ ነፍስ ሕያው ፣ በፀጋም ልጅ ማስባል፥
"የፍጥረቱም ገዢ ታደርገው ዘንድ ሰው..
ምንድር ነው?" ያለ ዳዊት መቼ መረመረው?
ያንተን ሥራ. . .

VERSE 5
ከፈጠረበትም ያዳነበት ጥበብ፥
የሚረቅ ነውና ሥጋዌው ሊታሰብ፥
እንደ ሕርያቆስ በነፋስ ትከሻ፥
ተጭነን መብረርን መመርመር አንሻ!

VERSE 6
ወደ ቀድሞ ነገር በእምነት መመለሻ፥
ጸሎተ ሃይማኖት ነው መነሻ መድረሻ።
ያንተን ሥራ
ስለዚያችም ሰዓት ፣ ዕለተ ምጽአት፥

VERSE 7
ከአብ ብቻ በቀር በግብር ማን ሊያውቃት፥
ወልድ በቃልነቱ ትለፍ ሳይል ዓለሙን፥
ሥጋውን በልተነው ተቀብለን ደሙን፥
"አይመረመሬው ሳይመራመረን"

VERSE 8
በደል ተደምስሶ መንግሥቱን ይቸረን!
ያንተን ሥራ',
      lyrics_transliteration = 'Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 1
Man yimeramer?
"beqedamay elet , qedamay seat:
Meft’er esktjemr arat bahryat:
Lemn alfet’erkm qedmeh?" bil derasi:

VERSE 2
Aymeremerm "qidme alem negasi"
Yanten sira. . . .
Esatna wiha nefasna meret:
"em hebe albo" met’u kalemenor endet?

VERSE 3
Bearmmo sebat , beqalum asra arat:
Yemeft’erun t’beb man limeremrat?
Yanten sira
Sifuh , mit’uq melkun beeju , ba''fer mesal:

VERSE 4
Beestfansu nefs hiyaw , bets’egam lij masbal:
"yeft’retum gezhi tadergew zend sew..
Mindr new?" yale dawit meche meremerew?
Yanten sira. . .

VERSE 5
Kefet’erebetm yadanebet t’beb:
Yemireq newna sigawew litaseb:
Ende hiryaqos benefas tikesha:
Tech’nen mebrern memermer ansha!

VERSE 6
Wede qedmo neger beemnet memelesha:
Ts’elote haymanot new menesha medresha.
Yanten sira
Sileziyachm seat , elete mits’at:

VERSE 7
Keab bicha beqer begbr man liyawqat:
Weld beqalnetu tilef sayl alemun:
Sigawn beltenew teqeblen demun:
"aymeremerew saymerameren"

VERSE 8
Bedel tedemsso mengstun yicheren!
Yanten sira',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'man-yimeramer'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 1
ማን ይመራመር?
"በቀዳማይ ዕለት ፣ ቀዳማይ ሰዓት፥
መፍጠር እስክትጀምር አራት ባሕርያት፥
ለምን አልፈጠርክም ቀድመህ?" ቢል ደራሲ፥

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 2
አይመረመርም "ቅድመ ዓለም ነጋሢ"
ያንተን ሥራ. . . .
እሳትና ውኃ ነፋስና መሬት፥
"እም ኀበ አልቦ" መጡ ካለመኖር እንዴት?

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 3
በአርምሞ ሰባት ፣ በቃሉም ዐሥራ አራት፥
የመፍጠሩን ጥበብ ማን ሊመረምራት?
ያንተን ሥራ
ስፉህ ፣ ምጡቅ መልኩን በእጁ ፣ ባ''ፈር መሣል፥

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 4
በእስትፋንሱ ነፍስ ሕያው ፣ በፀጋም ልጅ ማስባል፥
"የፍጥረቱም ገዢ ታደርገው ዘንድ ሰው..
ምንድር ነው?" ያለ ዳዊት መቼ መረመረው?
ያንተን ሥራ. . .

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 5
ከፈጠረበትም ያዳነበት ጥበብ፥
የሚረቅ ነውና ሥጋዌው ሊታሰብ፥
እንደ ሕርያቆስ በነፋስ ትከሻ፥
ተጭነን መብረርን መመርመር አንሻ!

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 6
ወደ ቀድሞ ነገር በእምነት መመለሻ፥
ጸሎተ ሃይማኖት ነው መነሻ መድረሻ።
ያንተን ሥራ
ስለዚያችም ሰዓት ፣ ዕለተ ምጽአት፥

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 7
ከአብ ብቻ በቀር በግብር ማን ሊያውቃት፥
ወልድ በቃልነቱ ትለፍ ሳይል ዓለሙን፥
ሥጋውን በልተነው ተቀብለን ደሙን፥
"አይመረመሬው ሳይመራመረን"

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር

VERSE 8
በደል ተደምስሶ መንግሥቱን ይቸረን!
ያንተን ሥራ

CHORUS
ማን ይመራመር?
ማን ይመራመር? ማን ይመራመር?
ያንተን ሥራ
ያንተን ግብር'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 1
Man yimeramer?
"beqedamay elet , qedamay seat:
Meft’er esktjemr arat bahryat:
Lemn alfet’erkm qedmeh?" bil derasi:

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 2
Aymeremerm "qidme alem negasi"
Yanten sira. . . .
Esatna wiha nefasna meret:
"em hebe albo" met’u kalemenor endet?

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 3
Bearmmo sebat , beqalum asra arat:
Yemeft’erun t’beb man limeremrat?
Yanten sira
Sifuh , mit’uq melkun beeju , ba''fer mesal:

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 4
Beestfansu nefs hiyaw , bets’egam lij masbal:
"yeft’retum gezhi tadergew zend sew..
Mindr new?" yale dawit meche meremerew?
Yanten sira. . .

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 5
Kefet’erebetm yadanebet t’beb:
Yemireq newna sigawew litaseb:
Ende hiryaqos benefas tikesha:
Tech’nen mebrern memermer ansha!

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 6
Wede qedmo neger beemnet memelesha:
Ts’elote haymanot new menesha medresha.
Yanten sira
Sileziyachm seat , elete mits’at:

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 7
Keab bicha beqer begbr man liyawqat:
Weld beqalnetu tilef sayl alemun:
Sigawn beltenew teqeblen demun:
"aymeremerew saymerameren"

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr

VERSE 8
Bedel tedemsso mengstun yicheren!
Yanten sira

CHORUS
Man yimeramer?
Man yimeramer? man yimeramer?
Yanten sira
Yanten gibr'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'man-yimeramer', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Manew Befikiru Yalitelewete (manew-befikiru-yalitelewete-3442)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሞትን ዘለፈዉ መሳሪያዉን ቆረጠ
ማነዉ በፍቅሩ ያልተለወጠ
አዳነን ገዛን በደሙ
ምስጋና ለስሙ

VERSE 1
ወረደ በአባቱ ፍቃድ
የእንባችን ጅረት እንዲያደርቅ
የሞትን ክንዱን ሰብሮልን
ህይወትን ለብሰን መርን

VERSE 2
አቤቱ እንወድሃለን
ምስጋና ለአንተ እንሰጣለን
እልልታ ዉዳሴ ቀናይ
ዘለዓለም ለአንተ አዶናይ

VERSE 3
ሲኦልን በእግሩ እረገጠ
በደሙ ጠላትን ገለጠ
ዝማሬዉ አሁን የድል ነዉ
ለአዳኙ የምንሰዋዉ

VERSE 4
ሊያድነን እሱ ታመመ
ሲቆስል ሁሉን አከመ
ሰላምን በምድር መላ
ተሰቅሎ ሆነልን ተድላ

VERSE 5
ወለደን ከማይጠፋ ዘር
አዲስ ሰዉ ሆነን በእግዚአብሔር
ክሳችን በእሱ ተቀዳ
አለብን የዉለታ ዕዳ',
      lyrics_transliteration = 'Motn zelefewu mesariyawun qoret’e
Manewu befqru yaltelewet’e
Adanen gezan bedemu
Misgana lesmu

VERSE 1
Werede beabatu fiqad
Yeenbachn jiret endiyaderq
Yemotn kindun sebroln
Hiywetn lebsen mern

VERSE 2
Abetu enwedhalen
Misgana leante enset’alen
Ellta wudase qenay
Zelealem leante adonay

VERSE 3
Sioln beegru ereget’e
Bedemu t’elatn gelet’e
Zimarewu ahun yedl newu
Leadagnu yemnsewawu

VERSE 4
Liyadnen esu tameme
Siqosl hulun akeme
Selamn bemdr mela
Teseqlo honeln tedla

VERSE 5
Weleden kemayt’efa zer
Adis sewu honen beEgziabher
Kisachn beesu teqeda
Alebn yewuleta eda',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'manew-befikiru-yalitelewete-3442'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሞትን ዘለፈዉ መሳሪያዉን ቆረጠ
ማነዉ በፍቅሩ ያልተለወጠ
አዳነን ገዛን በደሙ
ምስጋና ለስሙ

VERSE 1
ወረደ በአባቱ ፍቃድ
የእንባችን ጅረት እንዲያደርቅ
የሞትን ክንዱን ሰብሮልን
ህይወትን ለብሰን መርን

CHORUS
ሞትን ዘለፈዉ መሳሪያዉን ቆረጠ
ማነዉ በፍቅሩ ያልተለወጠ
አዳነን ገዛን በደሙ
ምስጋና ለስሙ

VERSE 2
አቤቱ እንወድሃለን
ምስጋና ለአንተ እንሰጣለን
እልልታ ዉዳሴ ቀናይ
ዘለዓለም ለአንተ አዶናይ

CHORUS
ሞትን ዘለፈዉ መሳሪያዉን ቆረጠ
ማነዉ በፍቅሩ ያልተለወጠ
አዳነን ገዛን በደሙ
ምስጋና ለስሙ

VERSE 3
ሲኦልን በእግሩ እረገጠ
በደሙ ጠላትን ገለጠ
ዝማሬዉ አሁን የድል ነዉ
ለአዳኙ የምንሰዋዉ

CHORUS
ሞትን ዘለፈዉ መሳሪያዉን ቆረጠ
ማነዉ በፍቅሩ ያልተለወጠ
አዳነን ገዛን በደሙ
ምስጋና ለስሙ

VERSE 4
ሊያድነን እሱ ታመመ
ሲቆስል ሁሉን አከመ
ሰላምን በምድር መላ
ተሰቅሎ ሆነልን ተድላ

CHORUS
ሞትን ዘለፈዉ መሳሪያዉን ቆረጠ
ማነዉ በፍቅሩ ያልተለወጠ
አዳነን ገዛን በደሙ
ምስጋና ለስሙ

VERSE 5
ወለደን ከማይጠፋ ዘር
አዲስ ሰዉ ሆነን በእግዚአብሔር
ክሳችን በእሱ ተቀዳ
አለብን የዉለታ ዕዳ

CHORUS
ሞትን ዘለፈዉ መሳሪያዉን ቆረጠ
ማነዉ በፍቅሩ ያልተለወጠ
አዳነን ገዛን በደሙ
ምስጋና ለስሙ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Motn zelefewu mesariyawun qoret’e
Manewu befqru yaltelewet’e
Adanen gezan bedemu
Misgana lesmu

VERSE 1
Werede beabatu fiqad
Yeenbachn jiret endiyaderq
Yemotn kindun sebroln
Hiywetn lebsen mern

CHORUS
Motn zelefewu mesariyawun qoret’e
Manewu befqru yaltelewet’e
Adanen gezan bedemu
Misgana lesmu

VERSE 2
Abetu enwedhalen
Misgana leante enset’alen
Ellta wudase qenay
Zelealem leante adonay

CHORUS
Motn zelefewu mesariyawun qoret’e
Manewu befqru yaltelewet’e
Adanen gezan bedemu
Misgana lesmu

VERSE 3
Sioln beegru ereget’e
Bedemu t’elatn gelet’e
Zimarewu ahun yedl newu
Leadagnu yemnsewawu

CHORUS
Motn zelefewu mesariyawun qoret’e
Manewu befqru yaltelewet’e
Adanen gezan bedemu
Misgana lesmu

VERSE 4
Liyadnen esu tameme
Siqosl hulun akeme
Selamn bemdr mela
Teseqlo honeln tedla

CHORUS
Motn zelefewu mesariyawun qoret’e
Manewu befqru yaltelewet’e
Adanen gezan bedemu
Misgana lesmu

VERSE 5
Weleden kemayt’efa zer
Adis sewu honen beEgziabher
Kisachn beesu teqeda
Alebn yewuleta eda

CHORUS
Motn zelefewu mesariyawun qoret’e
Manewu befqru yaltelewet’e
Adanen gezan bedemu
Misgana lesmu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'manew-befikiru-yalitelewete-3442', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Manew Mekomew Fethe (manew-mekomew-fethe)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 1
መኖር አየተመኘሁ እንደቃልህ
ስጋ አሸንፎኛል አልቻልኩም ልጂህ
ልዉጣ ከባቢሎን ግፊን መስራት ትቼ
ዉስጤን ለዉጥልኝ ልቁም ፀንቼ

VERSE 2
ህግህን በልቤ ብታኖርም ፅፈህ
በምኞት ታስሬ ዉስጤ መች ታዘዘህ
ለፊትህ የሚቀርብ በጎ ምግባር አጣሁ
የት ይሆን መግቢያዬ በበደሌ ፈራሁ

VERSE 3
የወይንህን ሃረግ በደጂህ
ተክለኸኛ ታፈራለች ብለህ
በትጋት ጠበከኝ ፍሬዬን አስበህ ባመቱ ብትመጣ
መራረ ፍሬ አገኘህ ከእኔ ምግባር ታጣ

VERSE 4
አንደበቴ ሞልቶ ቃልህ ቢትረፈረፍ
አልቻለም ለልቤ ለዉስጤ ለማትረፍ
በስጋዊ ምኞት ነፍሴ ተፈተነች
የዚህን አለም መንገድ እየተከተለች

VERSE 5
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም(2)',
      lyrics_transliteration = 'Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)

VERSE 1
Menor ayetemegnehu endeqalh
Siga ashenfognal alchalkum lijih
Liwut’a kebabilon gifin mesrat tiche
Wust’en lewut’lgn liqum ts’enche

VERSE 2
Highn belbe bitanorm ts’feh
Bemgnot tasre wust’e mech tazezeh
Lefith yemiqerb bego migbar at’ahu
Yet yihon megbiyaye bebedele ferahu

VERSE 3
Yeweynhn hareg bedejih
Tekleኸgna taferalech bileh
Betgat t’ebekegn fireyen asbeh bametu bitmet’a
Merare fire agegneh keene migbar tat’a

VERSE 4
Andebete molto qalh bitreferef
Alchalem lelbe lewust’e lematref
Besgawi mignot nefse tefetenech
Yezihn alem menged eyeteketelech

VERSE 5
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'manew-mekomew-fethe'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 1
መኖር አየተመኘሁ እንደቃልህ
ስጋ አሸንፎኛል አልቻልኩም ልጂህ
ልዉጣ ከባቢሎን ግፊን መስራት ትቼ
ዉስጤን ለዉጥልኝ ልቁም ፀንቼ

CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 2
ህግህን በልቤ ብታኖርም ፅፈህ
በምኞት ታስሬ ዉስጤ መች ታዘዘህ
ለፊትህ የሚቀርብ በጎ ምግባር አጣሁ
የት ይሆን መግቢያዬ በበደሌ ፈራሁ

CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 3
የወይንህን ሃረግ በደጂህ
ተክለኸኛ ታፈራለች ብለህ
በትጋት ጠበከኝ ፍሬዬን አስበህ ባመቱ ብትመጣ
መራረ ፍሬ አገኘህ ከእኔ ምግባር ታጣ

CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 4
አንደበቴ ሞልቶ ቃልህ ቢትረፈረፍ
አልቻለም ለልቤ ለዉስጤ ለማትረፍ
በስጋዊ ምኞት ነፍሴ ተፈተነች
የዚህን አለም መንገድ እየተከተለች

CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)

VERSE 5
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም(2)

CHORUS
ማነዉ ሚቆመዉ ፊትህ
ሁሉም ጎሎታል ፅድቅህ
ቃልህን ጠብቆ ያለ በዚህ አለም
ማንም አልተገኝም የሰዉ ፍፁም የለም (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)

VERSE 1
Menor ayetemegnehu endeqalh
Siga ashenfognal alchalkum lijih
Liwut’a kebabilon gifin mesrat tiche
Wust’en lewut’lgn liqum ts’enche

CHORUS
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)

VERSE 2
Highn belbe bitanorm ts’feh
Bemgnot tasre wust’e mech tazezeh
Lefith yemiqerb bego migbar at’ahu
Yet yihon megbiyaye bebedele ferahu

CHORUS
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)

VERSE 3
Yeweynhn hareg bedejih
Tekleኸgna taferalech bileh
Betgat t’ebekegn fireyen asbeh bametu bitmet’a
Merare fire agegneh keene migbar tat’a

CHORUS
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)

VERSE 4
Andebete molto qalh bitreferef
Alchalem lelbe lewust’e lematref
Besgawi mignot nefse tefetenech
Yezihn alem menged eyeteketelech

CHORUS
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)

VERSE 5
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)

CHORUS
Manewu miqomewu fith
Hulum golotal ts’dqh
Qalhn t’ebqo yale bezih alem
Manm altegegnm yesewu fits’um yelem (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'manew-mekomew-fethe', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mar Michael (mar-michael)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 1
እንድጸና አውቃለሁ ከፊቴ ስትቀድም
ፍጻሜዬ እንዲያምር እንዲዋብ በቤትህ
አበርታኝ ልበርታ አጽናኝ ልጽና ልጅህ
ባህሩን ክፈለው በደረቅ እዳልፈው

VERSE 2
እንዳልፈራ አበርታኝ እጄን በእጅህ ያዘው
ከእንቅልፌ ያነቃኛል የደጅህ ደውል
በሌሊት መጥቼ ቤትህ እድውል
በሄድኩበት ሁሉ ካፌ አትነጠልም

VERSE 3
የማር ወለላ ነው ሚካኤል ያንተ ስም
ማር ሚካኤል ስልህ ማር ማር አለው አፌ
መውደዴ እውነት ነው በምልጃህ ተርፌ
በሞቱ ቀጠሮ ሠርግ የደገስክለት

VERSE 4
ምና ባህራን ስታተርፈው ከሞት
ዛሬም ታምርህን ትድግናህን አይተው
ብዙዎች ይሉሀል ሚካኤል ሙት አንሳው
ረዳኤ ምንዱባን በስደት ደጋፊ

VERSE 5
ከክፉ ከልለህ በድል አሳላፊ
አለቱን ከፍለህው በበትረ መስቀል
ከጭንጫው ሰጠኸን ማርና ጸበል
ቀድሞ ለእስራኤል ያኔ እንዳደረከው

VERSE 6
ያን የሰማነውን ዛሬ ሆኖ አየነው
የብርሃኑን አምድ ፋና ተከትለን
ከቅዱሳን ስፍራ ዛጅርማኤል ደረስን
ከእንቅልፌ ያነቃኛል የደጅህ ደውል

VERSE 7
በሌሊት መጥቼ ቤትህ እድውል
በሄድኩበት ሁሉ ካፌ አትነጠልም
የማር ወለላ ነው ሚካኤል ያንተ ስም
ማር ሚካኤል ስልህ ማር ማር አለው አፌ

VERSE 8
መውደዴ እውነት ነው በምልጃህ ተርፌ።',
      lyrics_transliteration = 'Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 1
Endts’ena awqalehu kefite sitqedm
Fits’ameye endiyamr endiwab bebeth
Abertagn liberta ats’nagn lits’na lijh
Bahrun kifelew bedereq edalfew

VERSE 2
Endalfera abertagn ejen beejh yazew
Keenqlfe yaneqagnal yedejh dewl
Belelit met’che beth edwl
Behedkubet hulu kafe atnet’elm

VERSE 3
Yemar welela new Mikael yante sim
Mar Mikael silh mar mar alew afe
Mewdede ewnet new bemljah terfe
Bemotu qet’ero serg yedegesklet

VERSE 4
Mina bahran sitaterfew kemot
Zarem tamrhn tidgnahn aytew
Bizuwoch yiluhel Mikael mut ansaw
Redae minduban besdet degafi

VERSE 5
Kekfu kelleh bedl asalafi
Aletun keflehw bebetre mesqel
Kech’nch’aw set’eኸn marna ts’ebel
Qedmo leesrael yane endaderekew

VERSE 6
Yan yesemanewn zare hono ayenew
Yebrhanun amd fana teketlen
Keqdusan sifra zajrmael deresn
Keenqlfe yaneqagnal yedejh dewl

VERSE 7
Belelit met’che beth edwl
Behedkubet hulu kafe atnet’elm
Yemar welela new Mikael yante sim
Mar Mikael silh mar mar alew afe

VERSE 8
Mewdede ewnet new bemljah terfe.',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mar-michael'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 1
እንድጸና አውቃለሁ ከፊቴ ስትቀድም
ፍጻሜዬ እንዲያምር እንዲዋብ በቤትህ
አበርታኝ ልበርታ አጽናኝ ልጽና ልጅህ
ባህሩን ክፈለው በደረቅ እዳልፈው

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 2
እንዳልፈራ አበርታኝ እጄን በእጅህ ያዘው
ከእንቅልፌ ያነቃኛል የደጅህ ደውል
በሌሊት መጥቼ ቤትህ እድውል
በሄድኩበት ሁሉ ካፌ አትነጠልም

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 3
የማር ወለላ ነው ሚካኤል ያንተ ስም
ማር ሚካኤል ስልህ ማር ማር አለው አፌ
መውደዴ እውነት ነው በምልጃህ ተርፌ
በሞቱ ቀጠሮ ሠርግ የደገስክለት

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 4
ምና ባህራን ስታተርፈው ከሞት
ዛሬም ታምርህን ትድግናህን አይተው
ብዙዎች ይሉሀል ሚካኤል ሙት አንሳው
ረዳኤ ምንዱባን በስደት ደጋፊ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 5
ከክፉ ከልለህ በድል አሳላፊ
አለቱን ከፍለህው በበትረ መስቀል
ከጭንጫው ሰጠኸን ማርና ጸበል
ቀድሞ ለእስራኤል ያኔ እንዳደረከው

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 6
ያን የሰማነውን ዛሬ ሆኖ አየነው
የብርሃኑን አምድ ፋና ተከትለን
ከቅዱሳን ስፍራ ዛጅርማኤል ደረስን
ከእንቅልፌ ያነቃኛል የደጅህ ደውል

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 7
በሌሊት መጥቼ ቤትህ እድውል
በሄድኩበት ሁሉ ካፌ አትነጠልም
የማር ወለላ ነው ሚካኤል ያንተ ስም
ማር ሚካኤል ስልህ ማር ማር አለው አፌ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም

VERSE 8
መውደዴ እውነት ነው በምልጃህ ተርፌ።

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 1
Endts’ena awqalehu kefite sitqedm
Fits’ameye endiyamr endiwab bebeth
Abertagn liberta ats’nagn lits’na lijh
Bahrun kifelew bedereq edalfew

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 2
Endalfera abertagn ejen beejh yazew
Keenqlfe yaneqagnal yedejh dewl
Belelit met’che beth edwl
Behedkubet hulu kafe atnet’elm

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 3
Yemar welela new Mikael yante sim
Mar Mikael silh mar mar alew afe
Mewdede ewnet new bemljah terfe
Bemotu qet’ero serg yedegesklet

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 4
Mina bahran sitaterfew kemot
Zarem tamrhn tidgnahn aytew
Bizuwoch yiluhel Mikael mut ansaw
Redae minduban besdet degafi

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 5
Kekfu kelleh bedl asalafi
Aletun keflehw bebetre mesqel
Kech’nch’aw set’eኸn marna ts’ebel
Qedmo leesrael yane endaderekew

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 6
Yan yesemanewn zare hono ayenew
Yebrhanun amd fana teketlen
Keqdusan sifra zajrmael deresn
Keenqlfe yaneqagnal yedejh dewl

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 7
Belelit met’che beth edwl
Behedkubet hulu kafe atnet’elm
Yemar welela new Mikael yante sim
Mar Mikael silh mar mar alew afe

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm

VERSE 8
Mewdede ewnet new bemljah terfe.

CHORUS
Mar Mikael libel
Mar Mikael libelh
Barkeh asadekegn beqne bezema mezmur alsestm abate leantema
Jimariye tanash yalbeqahu bihonm'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mar-michael', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mar Mikael Libel (mar-mikael-libelih)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 1
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም
እንድጸና አውቃለሁ ከፊቴ ስትቀድም
ፍጻሜዬ እንዲያምር እንዲዋብ በቤትህ
አበርታኝ ልበርታ አጽናኝ ልጽና ልጅህ

VERSE 2
ባህሩን ክፈለው በደረቅ እዳልፈው
እንዳልፈራ አበርታኝ እጄን በእጅህ ያዘው

VERSE 3
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 4
ከእንቅልፌ ያነቃኛል የደጅህ ደውል
በሌሊት መጥቼ ቤትህ እድውል
በሄድኩበት ሁሉ ካፌ አትነጠልም
የማር ወለላ ነው ሚካኤል ያንተ ስም

VERSE 5
ማር ሚካኤል ስልህ ማር ማር አለው አፌ
መውደዴ እውነት ነው በምልጃህ ተርፌ

VERSE 6
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 7
በሞቱ ቀጠሮ ሠርግ የደገስክለት
ምና ባህራን ስታተርፈው ከሞት
ዛሬም ታምርህን ትድግናህን አይተው
ብዙዎች ይሉሀል ሚካኤል ሙት አንሳው

VERSE 8
ረዳኤ ምንዱባን በስደት ደጋፊ
ከክፉ ከልለህ በድል አሳላፊ

VERSE 9
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 10
አለቱን ከፍለህው በበትረ መስቀል
ከጭንጫው ሰጠኸን ማርና ጸበል
ቀድሞ ለእስራኤል ያኔ እንዳደረከው
ያን የሰማነውን ዛሬ ሆኖ አየነው

VERSE 11
የብርሃኑን አምድ ፋና ተከትለን
ከቅዱሳን ስፍራ ዛጅርማኤል ደረስን

VERSE 12
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 13
ከእንቅልፌ ያነቃኛል የደጅህ ደውል
በሌሊት መጥቼ ቤትህ እድውል
በሄድኩበት ሁሉ ካፌ አትነጠልም
የማር ወለላ ነው ሚካኤል ያንተ ስም

VERSE 14
ማር ሚካኤል ስልህ ማር ማር አለው አፌ
መውደዴ እውነት ነው በምልጃህ ተርፌ።

VERSE 15
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ',
      lyrics_transliteration = 'mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 1
jmariye tanash yalbeqahu bhonm
ndtsena ewqalehu kefite stqedm
ftsameye ndiyamr ndiwab bebeth

VERSE 2
ebertany lberta etsnany ltsna ljh
bahrun kfelew bedereq dalfew
ndalfera ebertany jen bejh yazew

VERSE 3
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 4
kenqlfe yaneqanyal yedejh dewl
belelit metche beth dwl
behedkubet hulu kafe etnetelm

VERSE 5
yemar welela new mikael yante sm
mar mikael slh mar mar elew efe
mewdede wnet new bemljah terfe

VERSE 6
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 7
bemotu qetero serg yedegesklet
mna bahran staterfew kemot
zarem tamrhn tdgnahn eytew

VERSE 8
bzuwoch yluhel mikael mut ensaw
redae mnduban besdet degafi
kekfu kelleh bedl esalafi

VERSE 9
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 10
eletun keflehw bebetre mesqel
kechnchaw setehen marna tsebel
qedmo lesrael yane ndaderekew

VERSE 11
yan yesemanewn zare hono eyenew
yebrhanun emd fana teketlen
keqdusan sfra zajrmael deresn

VERSE 12
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 13
kenqlfe yaneqanyal yedejh dewl
belelit metche beth dwl
behedkubet hulu kafe etnetelm

VERSE 14
yemar welela new mikael yante sm
mar mikael slh mar mar elew efe
mewdede wnet new bemljah terfe

VERSE 15
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mar-mikael-libelih'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 1
ጅማሪዬ ታናሽ ያልበቃሁ ብሆንም
እንድጸና አውቃለሁ ከፊቴ ስትቀድም
ፍጻሜዬ እንዲያምር እንዲዋብ በቤትህ
አበርታኝ ልበርታ አጽናኝ ልጽና ልጅህ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 2
ባህሩን ክፈለው በደረቅ እዳልፈው
እንዳልፈራ አበርታኝ እጄን በእጅህ ያዘው

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 3
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 4
ከእንቅልፌ ያነቃኛል የደጅህ ደውል
በሌሊት መጥቼ ቤትህ እድውል
በሄድኩበት ሁሉ ካፌ አትነጠልም
የማር ወለላ ነው ሚካኤል ያንተ ስም

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 5
ማር ሚካኤል ስልህ ማር ማር አለው አፌ
መውደዴ እውነት ነው በምልጃህ ተርፌ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 6
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 7
በሞቱ ቀጠሮ ሠርግ የደገስክለት
ምና ባህራን ስታተርፈው ከሞት
ዛሬም ታምርህን ትድግናህን አይተው
ብዙዎች ይሉሀል ሚካኤል ሙት አንሳው

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 8
ረዳኤ ምንዱባን በስደት ደጋፊ
ከክፉ ከልለህ በድል አሳላፊ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 9
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 10
አለቱን ከፍለህው በበትረ መስቀል
ከጭንጫው ሰጠኸን ማርና ጸበል
ቀድሞ ለእስራኤል ያኔ እንዳደረከው
ያን የሰማነውን ዛሬ ሆኖ አየነው

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 11
የብርሃኑን አምድ ፋና ተከትለን
ከቅዱሳን ስፍራ ዛጅርማኤል ደረስን

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 12
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 13
ከእንቅልፌ ያነቃኛል የደጅህ ደውል
በሌሊት መጥቼ ቤትህ እድውል
በሄድኩበት ሁሉ ካፌ አትነጠልም
የማር ወለላ ነው ሚካኤል ያንተ ስም

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 14
ማር ሚካኤል ስልህ ማር ማር አለው አፌ
መውደዴ እውነት ነው በምልጃህ ተርፌ።

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

VERSE 15
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ

CHORUS
ማር ሚካኤል ልበል
ማር ሚካኤል ልበልህ
ባርከህ አሳደከኝ በቅኔ በዜማ መዝሙር አልሰስትም አባቴ ለአንተማ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 1
jmariye tanash yalbeqahu bhonm
ndtsena ewqalehu kefite stqedm
ftsameye ndiyamr ndiwab bebeth

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 2
ebertany lberta etsnany ltsna ljh
bahrun kfelew bedereq dalfew
ndalfera ebertany jen bejh yazew

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 3
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 4
kenqlfe yaneqanyal yedejh dewl
belelit metche beth dwl
behedkubet hulu kafe etnetelm

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 5
yemar welela new mikael yante sm
mar mikael slh mar mar elew efe
mewdede wnet new bemljah terfe

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 6
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 7
bemotu qetero serg yedegesklet
mna bahran staterfew kemot
zarem tamrhn tdgnahn eytew

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 8
bzuwoch yluhel mikael mut ensaw
redae mnduban besdet degafi
kekfu kelleh bedl esalafi

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 9
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 10
eletun keflehw bebetre mesqel
kechnchaw setehen marna tsebel
qedmo lesrael yane ndaderekew

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 11
yan yesemanewn zare hono eyenew
yebrhanun emd fana teketlen
keqdusan sfra zajrmael deresn

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 12
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 13
kenqlfe yaneqanyal yedejh dewl
belelit metche beth dwl
behedkubet hulu kafe etnetelm

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 14
yemar welela new mikael yante sm
mar mikael slh mar mar elew efe
mewdede wnet new bemljah terfe

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

VERSE 15
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema

CHORUS
mar mikael lbel
mar mikael lbelh
barkeh esadekeny beqne bezema mezmur elsestm ebate leentema'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mar-mikael-libelih', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: MARANATA (maranata)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 1
ሕይወት ጸልሚታ ብርሃና ሓቢኣ
ክፍኣት ተጎልቢባ ረሲሓ ሓጢኣ
ፋኑስ መብራህትና መንገዲ ሓጎስና
ማራናታ ጎይታ ክርስቶስ ምጸና

VERSE 2
“ማራናታ ጎይታ ክርስቶስ ምጸና(2)”
ሓጎስን ሓዘንን ብኽያት ምስ ፍሽኽታ
ስሓቕን ብኽያትን ኣዉያት ምስ እልልታ
እንዳተቐያየሩ ስቓይና ኣብዚሖም

VERSE 3
ማራናታ ጎይታ ንዓ መድሕን ዓለም
“ማራናታ ጎይታ ክርስቶስ ምጸና(2)”
መንገዲ ጸበባ ዓለም ብጸልማታ
ተረሲዑ ሓጎስ ሓዘን ብወጋሕታ

VERSE 4
ተስፋ ኣይንቖርጽን ጸልሚቱና ኢልና
ማራናታ ጎይታ ንብል ብርሃን ክትኮነልና
“ማራናታ ጎይታ ክርስቶስ ምጸና(2)”
ዘይትግመት ህይወት ሃንደበት ሓቒፋ

VERSE 5
እንዳ ዓንቀፈት ተፀነትና ተስፋ
ተስፋና ኣብ ዓለም ፈጺሙ ኣይኮነን
ንረኽበላን ንኸስበላን ወላሓደ የለን
“ማራናታ ጎይታ ክርስቶስ ምጸና(2)”',
      lyrics_transliteration = 'Misaኻ nimkhwan bitesfa bimeman
Bits’dqna zeykones bits’elot Kidusan
Iyesus maranata enho nibleka
Habirna kinnebr abti mengstኻ

VERSE 1
Hiywet ts’elmita birhana habia
Kifat tegolbiba resiha hat’ia
Fanus mebrahtna mengedi hagosna
Maranata goyta Kristos mits’ena

VERSE 2
“maranata goyta Kristos mits’ena (2)”
Hagosn hazenn biኽyat mis fishኽta
Sihaቕn biኽyatn awuyat mis ellta
Endateቐyayeru siቓyna abzihom

VERSE 3
Maranata goyta nia medhn alem
“maranata goyta Kristos mits’ena (2)”
Mengedi ts’ebeba alem bits’elmata
Teresiu hagos hazen biwegahta

VERSE 4
Tesfa aynቖrts’n ts’elmituna ilna
Maranata goyta nibl birhan kitkonelna
“maranata goyta Kristos mits’ena (2)”
Zeytgmet hiywet handebet haቒfa

VERSE 5
Enda anqefet tets’enetna tesfa
Tesfana ab alem fets’imu aykonen
Nireኽbelan niኸsbelan welahade yelen
“maranata goyta Kristos mits’ena (2)”',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'maranata'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 1
ሕይወት ጸልሚታ ብርሃና ሓቢኣ
ክፍኣት ተጎልቢባ ረሲሓ ሓጢኣ
ፋኑስ መብራህትና መንገዲ ሓጎስና
ማራናታ ጎይታ ክርስቶስ ምጸና

CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 2
“ማራናታ ጎይታ ክርስቶስ ምጸና(2)”
ሓጎስን ሓዘንን ብኽያት ምስ ፍሽኽታ
ስሓቕን ብኽያትን ኣዉያት ምስ እልልታ
እንዳተቐያየሩ ስቓይና ኣብዚሖም

CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 3
ማራናታ ጎይታ ንዓ መድሕን ዓለም
“ማራናታ ጎይታ ክርስቶስ ምጸና(2)”
መንገዲ ጸበባ ዓለም ብጸልማታ
ተረሲዑ ሓጎስ ሓዘን ብወጋሕታ

CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 4
ተስፋ ኣይንቖርጽን ጸልሚቱና ኢልና
ማራናታ ጎይታ ንብል ብርሃን ክትኮነልና
“ማራናታ ጎይታ ክርስቶስ ምጸና(2)”
ዘይትግመት ህይወት ሃንደበት ሓቒፋ

CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ

VERSE 5
እንዳ ዓንቀፈት ተፀነትና ተስፋ
ተስፋና ኣብ ዓለም ፈጺሙ ኣይኮነን
ንረኽበላን ንኸስበላን ወላሓደ የለን
“ማራናታ ጎይታ ክርስቶስ ምጸና(2)”

CHORUS
ምሳኻ ንምዃን ብተስፋ ብምእማን
ብጽድቅና ዘይኮነስ ብጸሎት ቅዱሳን
ኢየሱስ ማራናታ እንሆ ንብለካ
ሓቢርና ክንነብር ኣብቲ መንግስትኻ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Misaኻ nimkhwan bitesfa bimeman
Bits’dqna zeykones bits’elot Kidusan
Iyesus maranata enho nibleka
Habirna kinnebr abti mengstኻ

VERSE 1
Hiywet ts’elmita birhana habia
Kifat tegolbiba resiha hat’ia
Fanus mebrahtna mengedi hagosna
Maranata goyta Kristos mits’ena

CHORUS
Misaኻ nimkhwan bitesfa bimeman
Bits’dqna zeykones bits’elot Kidusan
Iyesus maranata enho nibleka
Habirna kinnebr abti mengstኻ

VERSE 2
“maranata goyta Kristos mits’ena (2)”
Hagosn hazenn biኽyat mis fishኽta
Sihaቕn biኽyatn awuyat mis ellta
Endateቐyayeru siቓyna abzihom

CHORUS
Misaኻ nimkhwan bitesfa bimeman
Bits’dqna zeykones bits’elot Kidusan
Iyesus maranata enho nibleka
Habirna kinnebr abti mengstኻ

VERSE 3
Maranata goyta nia medhn alem
“maranata goyta Kristos mits’ena (2)”
Mengedi ts’ebeba alem bits’elmata
Teresiu hagos hazen biwegahta

CHORUS
Misaኻ nimkhwan bitesfa bimeman
Bits’dqna zeykones bits’elot Kidusan
Iyesus maranata enho nibleka
Habirna kinnebr abti mengstኻ

VERSE 4
Tesfa aynቖrts’n ts’elmituna ilna
Maranata goyta nibl birhan kitkonelna
“maranata goyta Kristos mits’ena (2)”
Zeytgmet hiywet handebet haቒfa

CHORUS
Misaኻ nimkhwan bitesfa bimeman
Bits’dqna zeykones bits’elot Kidusan
Iyesus maranata enho nibleka
Habirna kinnebr abti mengstኻ

VERSE 5
Enda anqefet tets’enetna tesfa
Tesfana ab alem fets’imu aykonen
Nireኽbelan niኸsbelan welahade yelen
“maranata goyta Kristos mits’ena (2)”

CHORUS
Misaኻ nimkhwan bitesfa bimeman
Bits’dqna zeykones bits’elot Kidusan
Iyesus maranata enho nibleka
Habirna kinnebr abti mengstኻ'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'maranata', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mariam Aregalech (mariam-aregalech)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 1
ወርቁን ተጎናፅፋ በቀኙ ልትቆም
ወደ አምላክ ማደሪያ ወደ ሰማያት
ዐርገች በእልልታ ድንግል የእኛ እናት
ዐርጋለች ማርያም ተነሥታለች

VERSE 2
ሰማያት ይከፈት ደመናም ይዘርጋ
ዝምታም አይኖርም እመ አምላክ ዐርጋ
አንደበት ይከፈት ማርያምን ያመስግን
ከዘለዓለም ጥፋት በምልጃዋ እንድንድን

VERSE 3
ዐርጋለች ማርያም ተነሥታለች
የአምላክ ማደሪያ ያ ቅዱስ ሥጋሽ
አምላክን ያቀፉት እነዚያ እጆችሽ
ሙስና መቃብር ይዞ አላስቀራቸው

VERSE 4
ተነሥተዋል በክብር በእምነት አየናቸው
ዐርጋለች ማርያም ተነሥታለች
ሐዋርያት አበው እንኳን ደስ አላችሁ
በክብር ዐረገች ማርያም ሞገሳችሁ

VERSE 5
ወደ ዓለምም ውጡ ሰበኑዋን ይዛችሁ
የድንግል ዕርገቱዋን ንገሩ ተግታችሁ
ዐርጋለች ማርያም ተነሥታለች',
      lyrics_transliteration = 'Maryam argalech wede genet (2)
Yesemay melaekt yaregaguwat
Ersuwam ende lijuwa tenestalech
Yeabatwa dawitn tinbit litfets’m

VERSE 1
Werqun tegonats’fa beqegnu litqom
Wede amlak maderiya wede semayat
Argech beellta Dingil yeegna enat
Argalech Maryam tenestalech

VERSE 2
Semayat yikefet demenam yizerga
Zimtam aynorm eme amlak arga
Andebet yikefet Maryamn yamesgn
Kezelealem t’fat bemljawa endndn

VERSE 3
Argalech Maryam tenestalech
Yeamlak maderiya ya Kidus sigash
Amlakn yaqefut eneziya ejochsh
Musna meqabr yizo alasqerachew

VERSE 4
Tenestewal bekbr beemnet ayenachew
Argalech Maryam tenestalech
Hewaryat abew enkwan des alachhu
Bekbr aregech Maryam mogesachhu

VERSE 5
Wede alemm wit’u sebenuwan yizachhu
Yedngl ergetuwan nigeru tegtachhu
Argalech Maryam tenestalech',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mariam-aregalech'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 1
ወርቁን ተጎናፅፋ በቀኙ ልትቆም
ወደ አምላክ ማደሪያ ወደ ሰማያት
ዐርገች በእልልታ ድንግል የእኛ እናት
ዐርጋለች ማርያም ተነሥታለች

CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 2
ሰማያት ይከፈት ደመናም ይዘርጋ
ዝምታም አይኖርም እመ አምላክ ዐርጋ
አንደበት ይከፈት ማርያምን ያመስግን
ከዘለዓለም ጥፋት በምልጃዋ እንድንድን

CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 3
ዐርጋለች ማርያም ተነሥታለች
የአምላክ ማደሪያ ያ ቅዱስ ሥጋሽ
አምላክን ያቀፉት እነዚያ እጆችሽ
ሙስና መቃብር ይዞ አላስቀራቸው

CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 4
ተነሥተዋል በክብር በእምነት አየናቸው
ዐርጋለች ማርያም ተነሥታለች
ሐዋርያት አበው እንኳን ደስ አላችሁ
በክብር ዐረገች ማርያም ሞገሳችሁ

CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም

VERSE 5
ወደ ዓለምም ውጡ ሰበኑዋን ይዛችሁ
የድንግል ዕርገቱዋን ንገሩ ተግታችሁ
ዐርጋለች ማርያም ተነሥታለች

CHORUS
ማርያም ዐርጋለች ወደ ገነት (፪)
የሰማይ መላእክት ያረጋጉዋት
እርሱዋም እንደ ልጁዋ ተነሥታለች
የአባቷ ዳዊትን ትንቢት ልትፈፅም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt yaregaguwat
Ersuwam ende lijuwa tenestalech
Yeabatwa dawitn tinbit litfets’m

VERSE 1
Werqun tegonats’fa beqegnu litqom
Wede amlak maderiya wede semayat
Argech beellta Dingil yeegna enat
Argalech Maryam tenestalech

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt yaregaguwat
Ersuwam ende lijuwa tenestalech
Yeabatwa dawitn tinbit litfets’m

VERSE 2
Semayat yikefet demenam yizerga
Zimtam aynorm eme amlak arga
Andebet yikefet Maryamn yamesgn
Kezelealem t’fat bemljawa endndn

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt yaregaguwat
Ersuwam ende lijuwa tenestalech
Yeabatwa dawitn tinbit litfets’m

VERSE 3
Argalech Maryam tenestalech
Yeamlak maderiya ya Kidus sigash
Amlakn yaqefut eneziya ejochsh
Musna meqabr yizo alasqerachew

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt yaregaguwat
Ersuwam ende lijuwa tenestalech
Yeabatwa dawitn tinbit litfets’m

VERSE 4
Tenestewal bekbr beemnet ayenachew
Argalech Maryam tenestalech
Hewaryat abew enkwan des alachhu
Bekbr aregech Maryam mogesachhu

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt yaregaguwat
Ersuwam ende lijuwa tenestalech
Yeabatwa dawitn tinbit litfets’m

VERSE 5
Wede alemm wit’u sebenuwan yizachhu
Yedngl ergetuwan nigeru tegtachhu
Argalech Maryam tenestalech

CHORUS
Maryam argalech wede genet (2)
Yesemay melaekt yaregaguwat
Ersuwam ende lijuwa tenestalech
Yeabatwa dawitn tinbit litfets’m'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mariam-aregalech', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Marign Ena Lihid (marign-ena-lihid)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ማሪኝ እና ልሂድ ወደ ቤቴ ልግባ
ይበቃሻል በይኝ የማነባው እንባ
ደጅሽ ላይ ከወደኩ አለፉ ዘመናት
ፈውስን ተጠምቼ አቃተኝ መጽናናት

VERSE 1
አቃተኝ መጽናናት

VERSE 2
ቆዩ ከተዘጉ የቤቴ መቃኖች
እጅግ ራቁብኝ የመዳኔ ቀኖች
ዛሬስ ይበቃኛ ልነሳ ካልጋዬ
በምልጃ ፀሎትሽ በሽታዬን ጥዬ

VERSE 3
አይነቀል እግሬ ዘላለም ከደጅሽ
ተመላለሽ ብሎ ካልዳሰሰኝ ልጅሽ

VERSE 4
ወገን ዘመድ የለኝ የሚረዳኝ ቀርቦ
ልቤ ተሰበረ በሃዘን ተከቦ
እንኳን የሚደግፍ የሚሰማኝም ጠፋ
አሳይኝ በአይኔ ይህቺም ቀን አልፋ

VERSE 5
ያሰብኩት እስኪሆን አይኔ አያንቀላፋ
ምህረት ከሞላበት ከደጅሽ አልጠፋ

VERSE 6
የሚያድንሽ የለም እያሉኝ ብዙዎች
ገብተው ቆጠሩብኝ የሞቴን ቀናቶች
በሃዘን አጎንብሼ እንባዬን እረጫለሁ
ድንግል ካልዳሰስሽኝ መቼ ቀና እላለሁ

VERSE 7
እኖራለሁ በተስፋ አንቺን ተጠግቼ
አልቀርም ዘላለም የተገፋሁ ሆኜ

VERSE 8
የእግሮቼን ሰንሰለት ላውልቅ ተፈውሼ
አዲሱን ሰውነት በምልጃሽ ለብሼ
አትድንም ባሉኝ ፊት ልቁም በምስጋና
ህመሜን መሸፈን ይቻልሻል እና

VERSE 9
ማቃሰቴ ቆሞ ልሞላ ዝማሬ
ድንግል በጸሎትሽ ታጥሮልኝ ድንበሬ',
      lyrics_transliteration = 'Marign ena lihid wede bete ligba
Yibeqashal beygn yemanebaw enba
Dejsh lay kewedeku alefu zemenat
Fewsn tet’emche aqategn mets’nanat

VERSE 1
Aqategn mets’nanat

VERSE 2
Qoyu ketezegu yebete meqanoch
Ejg raqubgn yemedane qenoch
Zares yibeqagna linesa kalgaye
Bemlja ts’elotsh beshtayen t’ye

VERSE 3
Ayneqel egre zelalem kedejsh
Temelalesh bilo kaldasesegn lijsh

VERSE 4
Wegen zemed yelegn yemiredagn qerbo
Libe tesebere behazen tekebo
Enkwan yemidegf yemisemagnm t’efa
Asaygn beayne yihchim qen alfa

VERSE 5
Yasebkut eskihon ayne ayanqelafa
Mihret kemolabet kedejsh alt’efa

VERSE 6
Yemiyadnsh yelem eyalugn bizuwoch
Gebtew qot’erubgn yemoten qenatoch
Behazen agonbshe enbayen erech’alehu
Dingil kaldasesshgn meche qena elalehu

VERSE 7
Enoralehu betesfa anchin tet’egche
Alqerm zelalem yetegefahu hogne

VERSE 8
Yeegrochen senselet lawlq tefewshe
Adisun sewnet bemljash lebshe
Atdnm balugn fit liqum bemsgana
Himemen meshefen yichalshal ena

VERSE 9
Maqasete qomo limola zimare
Dingil bets’elotsh tat’rolgn dinbere',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'marign-ena-lihid'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማሪኝ እና ልሂድ ወደ ቤቴ ልግባ
ይበቃሻል በይኝ የማነባው እንባ
ደጅሽ ላይ ከወደኩ አለፉ ዘመናት
ፈውስን ተጠምቼ አቃተኝ መጽናናት

VERSE 1
አቃተኝ መጽናናት

CHORUS
ማሪኝ እና ልሂድ ወደ ቤቴ ልግባ
ይበቃሻል በይኝ የማነባው እንባ
ደጅሽ ላይ ከወደኩ አለፉ ዘመናት
ፈውስን ተጠምቼ አቃተኝ መጽናናት

VERSE 2
ቆዩ ከተዘጉ የቤቴ መቃኖች
እጅግ ራቁብኝ የመዳኔ ቀኖች
ዛሬስ ይበቃኛ ልነሳ ካልጋዬ
በምልጃ ፀሎትሽ በሽታዬን ጥዬ

CHORUS
ማሪኝ እና ልሂድ ወደ ቤቴ ልግባ
ይበቃሻል በይኝ የማነባው እንባ
ደጅሽ ላይ ከወደኩ አለፉ ዘመናት
ፈውስን ተጠምቼ አቃተኝ መጽናናት

VERSE 3
አይነቀል እግሬ ዘላለም ከደጅሽ
ተመላለሽ ብሎ ካልዳሰሰኝ ልጅሽ

CHORUS
ማሪኝ እና ልሂድ ወደ ቤቴ ልግባ
ይበቃሻል በይኝ የማነባው እንባ
ደጅሽ ላይ ከወደኩ አለፉ ዘመናት
ፈውስን ተጠምቼ አቃተኝ መጽናናት

VERSE 4
ወገን ዘመድ የለኝ የሚረዳኝ ቀርቦ
ልቤ ተሰበረ በሃዘን ተከቦ
እንኳን የሚደግፍ የሚሰማኝም ጠፋ
አሳይኝ በአይኔ ይህቺም ቀን አልፋ

CHORUS
ማሪኝ እና ልሂድ ወደ ቤቴ ልግባ
ይበቃሻል በይኝ የማነባው እንባ
ደጅሽ ላይ ከወደኩ አለፉ ዘመናት
ፈውስን ተጠምቼ አቃተኝ መጽናናት

VERSE 5
ያሰብኩት እስኪሆን አይኔ አያንቀላፋ
ምህረት ከሞላበት ከደጅሽ አልጠፋ

CHORUS
ማሪኝ እና ልሂድ ወደ ቤቴ ልግባ
ይበቃሻል በይኝ የማነባው እንባ
ደጅሽ ላይ ከወደኩ አለፉ ዘመናት
ፈውስን ተጠምቼ አቃተኝ መጽናናት

VERSE 6
የሚያድንሽ የለም እያሉኝ ብዙዎች
ገብተው ቆጠሩብኝ የሞቴን ቀናቶች
በሃዘን አጎንብሼ እንባዬን እረጫለሁ
ድንግል ካልዳሰስሽኝ መቼ ቀና እላለሁ

CHORUS
ማሪኝ እና ልሂድ ወደ ቤቴ ልግባ
ይበቃሻል በይኝ የማነባው እንባ
ደጅሽ ላይ ከወደኩ አለፉ ዘመናት
ፈውስን ተጠምቼ አቃተኝ መጽናናት

VERSE 7
እኖራለሁ በተስፋ አንቺን ተጠግቼ
አልቀርም ዘላለም የተገፋሁ ሆኜ

CHORUS
ማሪኝ እና ልሂድ ወደ ቤቴ ልግባ
ይበቃሻል በይኝ የማነባው እንባ
ደጅሽ ላይ ከወደኩ አለፉ ዘመናት
ፈውስን ተጠምቼ አቃተኝ መጽናናት

VERSE 8
የእግሮቼን ሰንሰለት ላውልቅ ተፈውሼ
አዲሱን ሰውነት በምልጃሽ ለብሼ
አትድንም ባሉኝ ፊት ልቁም በምስጋና
ህመሜን መሸፈን ይቻልሻል እና

CHORUS
ማሪኝ እና ልሂድ ወደ ቤቴ ልግባ
ይበቃሻል በይኝ የማነባው እንባ
ደጅሽ ላይ ከወደኩ አለፉ ዘመናት
ፈውስን ተጠምቼ አቃተኝ መጽናናት

VERSE 9
ማቃሰቴ ቆሞ ልሞላ ዝማሬ
ድንግል በጸሎትሽ ታጥሮልኝ ድንበሬ

CHORUS
ማሪኝ እና ልሂድ ወደ ቤቴ ልግባ
ይበቃሻል በይኝ የማነባው እንባ
ደጅሽ ላይ ከወደኩ አለፉ ዘመናት
ፈውስን ተጠምቼ አቃተኝ መጽናናት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Marign ena lihid wede bete ligba
Yibeqashal beygn yemanebaw enba
Dejsh lay kewedeku alefu zemenat
Fewsn tet’emche aqategn mets’nanat

VERSE 1
Aqategn mets’nanat

CHORUS
Marign ena lihid wede bete ligba
Yibeqashal beygn yemanebaw enba
Dejsh lay kewedeku alefu zemenat
Fewsn tet’emche aqategn mets’nanat

VERSE 2
Qoyu ketezegu yebete meqanoch
Ejg raqubgn yemedane qenoch
Zares yibeqagna linesa kalgaye
Bemlja ts’elotsh beshtayen t’ye

CHORUS
Marign ena lihid wede bete ligba
Yibeqashal beygn yemanebaw enba
Dejsh lay kewedeku alefu zemenat
Fewsn tet’emche aqategn mets’nanat

VERSE 3
Ayneqel egre zelalem kedejsh
Temelalesh bilo kaldasesegn lijsh

CHORUS
Marign ena lihid wede bete ligba
Yibeqashal beygn yemanebaw enba
Dejsh lay kewedeku alefu zemenat
Fewsn tet’emche aqategn mets’nanat

VERSE 4
Wegen zemed yelegn yemiredagn qerbo
Libe tesebere behazen tekebo
Enkwan yemidegf yemisemagnm t’efa
Asaygn beayne yihchim qen alfa

CHORUS
Marign ena lihid wede bete ligba
Yibeqashal beygn yemanebaw enba
Dejsh lay kewedeku alefu zemenat
Fewsn tet’emche aqategn mets’nanat

VERSE 5
Yasebkut eskihon ayne ayanqelafa
Mihret kemolabet kedejsh alt’efa

CHORUS
Marign ena lihid wede bete ligba
Yibeqashal beygn yemanebaw enba
Dejsh lay kewedeku alefu zemenat
Fewsn tet’emche aqategn mets’nanat

VERSE 6
Yemiyadnsh yelem eyalugn bizuwoch
Gebtew qot’erubgn yemoten qenatoch
Behazen agonbshe enbayen erech’alehu
Dingil kaldasesshgn meche qena elalehu

CHORUS
Marign ena lihid wede bete ligba
Yibeqashal beygn yemanebaw enba
Dejsh lay kewedeku alefu zemenat
Fewsn tet’emche aqategn mets’nanat

VERSE 7
Enoralehu betesfa anchin tet’egche
Alqerm zelalem yetegefahu hogne

CHORUS
Marign ena lihid wede bete ligba
Yibeqashal beygn yemanebaw enba
Dejsh lay kewedeku alefu zemenat
Fewsn tet’emche aqategn mets’nanat

VERSE 8
Yeegrochen senselet lawlq tefewshe
Adisun sewnet bemljash lebshe
Atdnm balugn fit liqum bemsgana
Himemen meshefen yichalshal ena

CHORUS
Marign ena lihid wede bete ligba
Yibeqashal beygn yemanebaw enba
Dejsh lay kewedeku alefu zemenat
Fewsn tet’emche aqategn mets’nanat

VERSE 9
Maqasete qomo limola zimare
Dingil bets’elotsh tat’rolgn dinbere

CHORUS
Marign ena lihid wede bete ligba
Yibeqashal beygn yemanebaw enba
Dejsh lay kewedeku alefu zemenat
Fewsn tet’emche aqategn mets’nanat'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'marign-ena-lihid', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mariyam Aniti (mariyam-aniti)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ማርያም አንቲ ደመና ሰማይ ዘአኃዝኪ ዝናመ(፪)
ተክላተ መሬት አዳም ወሔዋን ዘፈረዩ ብኪ ዳግመ(፪)
ከመሬት የተገኙ አዳምና ሔዋን ሕይወት ያገኙብሽ (፪)
ዝናምን የያዝሽ የሰማይ ደመና ማርያም አንቺ ነሽ( ፪)

VERSE 1
ማርያም አንቲ ደመና ሰማይ ዘአኃዝኪ ዝናመ(፪)
ተክላተ መሬት አዳም ወሔዋን ዘፈረዩ ብኪ ዳግመ(፪)
ከመሬት የተገኙ አዳምና ሔዋን ሕይወት ያገኙብሽ (፪)
ዝናምን የያዝሽ የሰማይ ደመና ማርያም አንቺ ነሽ( ፪)',
      lyrics_transliteration = 'Maryam anti demena semay zeahazki ziname (2)
Teklate meret adam wehewan zefereyu biki dagme (2)
Kemeret yetegegnu adamna hewan hiywet yagegnubsh (2)
Zinamn yeyazsh yesemay demena Maryam anchi nesh (2)

VERSE 1
Maryam anti demena semay zeahazki ziname (2)
Teklate meret adam wehewan zefereyu biki dagme (2)
Kemeret yetegegnu adamna hewan hiywet yagegnubsh (2)
Zinamn yeyazsh yesemay demena Maryam anchi nesh (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mariyam-aniti'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም አንቲ ደመና ሰማይ ዘአኃዝኪ ዝናመ(፪)
ተክላተ መሬት አዳም ወሔዋን ዘፈረዩ ብኪ ዳግመ(፪)
ከመሬት የተገኙ አዳምና ሔዋን ሕይወት ያገኙብሽ (፪)
ዝናምን የያዝሽ የሰማይ ደመና ማርያም አንቺ ነሽ( ፪)

VERSE 1
ማርያም አንቲ ደመና ሰማይ ዘአኃዝኪ ዝናመ(፪)
ተክላተ መሬት አዳም ወሔዋን ዘፈረዩ ብኪ ዳግመ(፪)
ከመሬት የተገኙ አዳምና ሔዋን ሕይወት ያገኙብሽ (፪)
ዝናምን የያዝሽ የሰማይ ደመና ማርያም አንቺ ነሽ( ፪)

CHORUS
ማርያም አንቲ ደመና ሰማይ ዘአኃዝኪ ዝናመ(፪)
ተክላተ መሬት አዳም ወሔዋን ዘፈረዩ ብኪ ዳግመ(፪)
ከመሬት የተገኙ አዳምና ሔዋን ሕይወት ያገኙብሽ (፪)
ዝናምን የያዝሽ የሰማይ ደመና ማርያም አንቺ ነሽ( ፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam anti demena semay zeahazki ziname (2)
Teklate meret adam wehewan zefereyu biki dagme (2)
Kemeret yetegegnu adamna hewan hiywet yagegnubsh (2)
Zinamn yeyazsh yesemay demena Maryam anchi nesh (2)

VERSE 1
Maryam anti demena semay zeahazki ziname (2)
Teklate meret adam wehewan zefereyu biki dagme (2)
Kemeret yetegegnu adamna hewan hiywet yagegnubsh (2)
Zinamn yeyazsh yesemay demena Maryam anchi nesh (2)

CHORUS
Maryam anti demena semay zeahazki ziname (2)
Teklate meret adam wehewan zefereyu biki dagme (2)
Kemeret yetegegnu adamna hewan hiywet yagegnubsh (2)
Zinamn yeyazsh yesemay demena Maryam anchi nesh (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mariyam-aniti', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mariyam Des Yibelish (mariyam-des-yibelish)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ

VERSE 1
የዜናው አብሳሪ ገብርኤል ነበረ
ድንግል ተቀምጣ በቤተመቅደስ
ሃር ወርቁን አስማምታ ስትፈትል ንግስት
ገብርኤል ገብርኤል ዜናዊ ሐዲስ

VERSE 2
የአምላክን መወለድ ስጋ በመልበስ
ገብርኤል ሲያበስራት ድንግል ስትሰማ
በእሷ ላይ አደረ የመለኮት ግርማ
እዉነተኛ መልአክ መሆኑን ስላየች

VERSE 3
ይሁንልኝ ብላ ቃሉን ተቀበለች
ድንግል ተቀምጣ በቤተመቅደስ
ሃር ወርቁን አስማምታ ስትፈትል ንግስት
ገብርኤል ገብርኤል ዜናዊ አዲስ

VERSE 4
የአምላክን መወለድ ስጋ በመልበስ',
      lyrics_transliteration = 'Maryam (3) des yibelsh begebrel selamota beanchi siladere yealem hulu Geta (2)
Yeamlak chernetu feqadu sihon
Ch’elemaw tegefo siwet’a birhan
Medhanit simet’a seyt’an endafere

VERSE 1
Yezenaw absari Gebriel nebere
Dingil teqemt’a bebetemeqdes
Har werqun asmamta sitfetl nigst
Gebriel Gebriel zenawi hedis

VERSE 2
Yeamlakn meweled siga bemelbes
Gebriel siyabesrat Dingil sitsema
Beeswa lay adere yemelekot girma
Ewunetegna melak mehonun silayech

VERSE 3
Yihunlgn bila qalun teqebelech
Dingil teqemt’a bebetemeqdes
Har werqun asmamta sitfetl nigst
Gebriel Gebriel zenawi adis

VERSE 4
Yeamlakn meweled siga bemelbes',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mariyam-des-yibelish'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ

VERSE 1
የዜናው አብሳሪ ገብርኤል ነበረ
ድንግል ተቀምጣ በቤተመቅደስ
ሃር ወርቁን አስማምታ ስትፈትል ንግስት
ገብርኤል ገብርኤል ዜናዊ ሐዲስ

CHORUS
ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ

VERSE 2
የአምላክን መወለድ ስጋ በመልበስ
ገብርኤል ሲያበስራት ድንግል ስትሰማ
በእሷ ላይ አደረ የመለኮት ግርማ
እዉነተኛ መልአክ መሆኑን ስላየች

CHORUS
ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ

VERSE 3
ይሁንልኝ ብላ ቃሉን ተቀበለች
ድንግል ተቀምጣ በቤተመቅደስ
ሃር ወርቁን አስማምታ ስትፈትል ንግስት
ገብርኤል ገብርኤል ዜናዊ አዲስ

CHORUS
ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ

VERSE 4
የአምላክን መወለድ ስጋ በመልበስ

CHORUS
ማርያም /3/ ደስ ይበልሽ በገብርኤል ሰላሞታ በአንቺ ስላደረ የዓለም ሁሉ ጌታ /2/
የአምላክ ቸርነቱ ፈቃዱ ሲሆን
ጨለማው ተገፎ ሲወጣ ብርሃን
መድኃኒት ሲመጣ ሰይጣን እንዳፈረ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam (3) des yibelsh begebrel selamota beanchi siladere yealem hulu Geta (2)
Yeamlak chernetu feqadu sihon
Ch’elemaw tegefo siwet’a birhan
Medhanit simet’a seyt’an endafere

VERSE 1
Yezenaw absari Gebriel nebere
Dingil teqemt’a bebetemeqdes
Har werqun asmamta sitfetl nigst
Gebriel Gebriel zenawi hedis

CHORUS
Maryam (3) des yibelsh begebrel selamota beanchi siladere yealem hulu Geta (2)
Yeamlak chernetu feqadu sihon
Ch’elemaw tegefo siwet’a birhan
Medhanit simet’a seyt’an endafere

VERSE 2
Yeamlakn meweled siga bemelbes
Gebriel siyabesrat Dingil sitsema
Beeswa lay adere yemelekot girma
Ewunetegna melak mehonun silayech

CHORUS
Maryam (3) des yibelsh begebrel selamota beanchi siladere yealem hulu Geta (2)
Yeamlak chernetu feqadu sihon
Ch’elemaw tegefo siwet’a birhan
Medhanit simet’a seyt’an endafere

VERSE 3
Yihunlgn bila qalun teqebelech
Dingil teqemt’a bebetemeqdes
Har werqun asmamta sitfetl nigst
Gebriel Gebriel zenawi adis

CHORUS
Maryam (3) des yibelsh begebrel selamota beanchi siladere yealem hulu Geta (2)
Yeamlak chernetu feqadu sihon
Ch’elemaw tegefo siwet’a birhan
Medhanit simet’a seyt’an endafere

VERSE 4
Yeamlakn meweled siga bemelbes

CHORUS
Maryam (3) des yibelsh begebrel selamota beanchi siladere yealem hulu Geta (2)
Yeamlak chernetu feqadu sihon
Ch’elemaw tegefo siwet’a birhan
Medhanit simet’a seyt’an endafere'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mariyam-des-yibelish', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mariyam Dinigil (mariyam-dinigil)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት

VERSE 1
በክንፎችሽ ጋርደሽ ሰውረሽ ከመአት
ቃሉን ተመግበን ፍቅሩን ተረድተን
ልጆችሽ ለመሆን ምልጃሽ እረዳን
ማርያም እንወድሻለን።

VERSE 2
እኛ ልጆችሽን በፍቅር ሰብስበሽ
በሀዘን በደስታ ከኛ ጋር ሆነሽ
ማእበሉ ቆሞ ወጀቡን አልፈን
በልጅሽ ቸርነት ለዚህች ቀን በቃን

VERSE 3
ማርያም እንወድሻለን።
እናቅርብ ምስጋና እንዘምር ዝማሬ
ለነገስታት ንጉስ ለማሕጸንሽ ፍሬ
ድንግል የአምላክ እናት እናወድስሽ

VERSE 4
ቃላት አይገልጸውም ልዩ ነው ፍቅርሽ
ማርያም እንወድሻለን።',
      lyrics_transliteration = 'Maryam Dingil enwedshalen (2)
Yehywetn migb set’teshnalna yehywetn met’et’ set’teshnalna
Lanch yigebal kibrna misgana eኸ eኸ eኸ
Beziyach bekfu qen bekhdet werat

VERSE 1
Beknfochsh gardesh sewresh kemeat
Qalun temegben fiqrun teredten
Lijochsh lemehon miljash eredan
Maryam enwedshalen.

VERSE 2
Egna lijochshn befqr sebsbesh
Behezen bedesta kegna gar honesh
Maebelu qomo wejebun alfen
Beljsh chernet lezihch qen beqan

VERSE 3
Maryam enwedshalen.
Enaqrb misgana enzemr zimare
Lenegestat nigus lemahts’ensh fire
Dingil yeamlak enat enawedssh

VERSE 4
Qalat aygelts’ewm liyu new fiqrsh
Maryam enwedshalen.',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mariyam-dinigil'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት

VERSE 1
በክንፎችሽ ጋርደሽ ሰውረሽ ከመአት
ቃሉን ተመግበን ፍቅሩን ተረድተን
ልጆችሽ ለመሆን ምልጃሽ እረዳን
ማርያም እንወድሻለን።

CHORUS
ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት

VERSE 2
እኛ ልጆችሽን በፍቅር ሰብስበሽ
በሀዘን በደስታ ከኛ ጋር ሆነሽ
ማእበሉ ቆሞ ወጀቡን አልፈን
በልጅሽ ቸርነት ለዚህች ቀን በቃን

CHORUS
ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት

VERSE 3
ማርያም እንወድሻለን።
እናቅርብ ምስጋና እንዘምር ዝማሬ
ለነገስታት ንጉስ ለማሕጸንሽ ፍሬ
ድንግል የአምላክ እናት እናወድስሽ

CHORUS
ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት

VERSE 4
ቃላት አይገልጸውም ልዩ ነው ፍቅርሽ
ማርያም እንወድሻለን።

CHORUS
ማርያም ድንግል እንወድሻለን(2)
የሕይወትን ምግብ ሰጥተሽናልና የሕይወትን መጠጥ ሰጥተሽናልና
ላንች ይገባል ክብርና ምስጋና እኸ እኸ እኸ
በዚያች በክፉ ቀን በክህደት ወራት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam Dingil enwedshalen (2)
Yehywetn migb set’teshnalna yehywetn met’et’ set’teshnalna
Lanch yigebal kibrna misgana eኸ eኸ eኸ
Beziyach bekfu qen bekhdet werat

VERSE 1
Beknfochsh gardesh sewresh kemeat
Qalun temegben fiqrun teredten
Lijochsh lemehon miljash eredan
Maryam enwedshalen.

CHORUS
Maryam Dingil enwedshalen (2)
Yehywetn migb set’teshnalna yehywetn met’et’ set’teshnalna
Lanch yigebal kibrna misgana eኸ eኸ eኸ
Beziyach bekfu qen bekhdet werat

VERSE 2
Egna lijochshn befqr sebsbesh
Behezen bedesta kegna gar honesh
Maebelu qomo wejebun alfen
Beljsh chernet lezihch qen beqan

CHORUS
Maryam Dingil enwedshalen (2)
Yehywetn migb set’teshnalna yehywetn met’et’ set’teshnalna
Lanch yigebal kibrna misgana eኸ eኸ eኸ
Beziyach bekfu qen bekhdet werat

VERSE 3
Maryam enwedshalen.
Enaqrb misgana enzemr zimare
Lenegestat nigus lemahts’ensh fire
Dingil yeamlak enat enawedssh

CHORUS
Maryam Dingil enwedshalen (2)
Yehywetn migb set’teshnalna yehywetn met’et’ set’teshnalna
Lanch yigebal kibrna misgana eኸ eኸ eኸ
Beziyach bekfu qen bekhdet werat

VERSE 4
Qalat aygelts’ewm liyu new fiqrsh
Maryam enwedshalen.

CHORUS
Maryam Dingil enwedshalen (2)
Yehywetn migb set’teshnalna yehywetn met’et’ set’teshnalna
Lanch yigebal kibrna misgana eኸ eኸ eኸ
Beziyach bekfu qen bekhdet werat'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mariyam-dinigil', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mariyam Eniwedishalen (mariyam-eniwedishalen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 1
በኃጢአት መውደቄን - - - ማርያም
ተስፋዬ አንቺዉ ነሽ - - - ማርያም
እስከ እለተ ሞቴ - - - ማርያም
ላልከዳሽ ምያለሁ - - - - ማርያም

VERSE 2
ከስርሽ ላልጠፋ - - - ማርያም
ገፀ በረከቴ - - - ማርያም
የሕይወት ዋስትና - - - ማርያም
የምእመናን ውበት - - - ማርያም

VERSE 3
ዘውድ አክሊላቸው - - - ማርያም
ድንግል አንቺ እኮ - - - ማርያም
ነሽ የመንገድ ስንቃቸው - - - ማርያም
ምስክር ነን ላንቺ - - - ማርያም

VERSE 4
እንደ ነቢያቱ - - - ማርያም
ስጦታ መሆንሽን - - - ማርያም
ለአዳም ልጆች ሁሉ - - - ማርያም
ሞገስና ፀጋ - - - - ማርያም

VERSE 5
በጌታ ፊት ያለሽ - - - ማርያም
ከሰይጣን መሸሻ - - - ማርያም
ዋስ ጠበቃችን ነሽ - - - ማርያም
እንዴት ነበር ያኔ - - - ማርያም

VERSE 6
ጌታን ስትወልጂ - - - - ማርያም
የእረኞቹ ደስታ - - - ማርያም
የመላእክት ዝማሬ - - - ማርያም',
      lyrics_transliteration = 'Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam

VERSE 1
Behat’iat mewdeqen - - - Maryam
Tesfaye anchiwu nesh - - - Maryam
Eske elete mote - - - Maryam
Lalkedash miyalehu - - - - Maryam

VERSE 2
Kesrsh lalt’efa - - - Maryam
Gets’e berekete - - - Maryam
Yehywet wastna - - - Maryam
Yememenan wibet - - - Maryam

VERSE 3
Zewd aklilachew - - - Maryam
Dingil anchi eko - - - Maryam
Nesh yemenged sinqachew - - - Maryam
Miskr nen lanchi - - - Maryam

VERSE 4
Ende nebiyatu - - - Maryam
Sit’ota mehonshn - - - Maryam
Leadam lijoch hulu - - - Maryam
Mogesna ts’ega - - - - Maryam

VERSE 5
Begeta fit yalesh - - - Maryam
Keseyt’an meshesha - - - Maryam
Was t’ebeqachn nesh - - - Maryam
Endet neber yane - - - Maryam

VERSE 6
Getan sitwelji - - - - Maryam
Yeeregnochu desta - - - Maryam
Yemelaekt zimare - - - Maryam',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mariyam-eniwedishalen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 1
በኃጢአት መውደቄን - - - ማርያም
ተስፋዬ አንቺዉ ነሽ - - - ማርያም
እስከ እለተ ሞቴ - - - ማርያም
ላልከዳሽ ምያለሁ - - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 2
ከስርሽ ላልጠፋ - - - ማርያም
ገፀ በረከቴ - - - ማርያም
የሕይወት ዋስትና - - - ማርያም
የምእመናን ውበት - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 3
ዘውድ አክሊላቸው - - - ማርያም
ድንግል አንቺ እኮ - - - ማርያም
ነሽ የመንገድ ስንቃቸው - - - ማርያም
ምስክር ነን ላንቺ - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 4
እንደ ነቢያቱ - - - ማርያም
ስጦታ መሆንሽን - - - ማርያም
ለአዳም ልጆች ሁሉ - - - ማርያም
ሞገስና ፀጋ - - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 5
በጌታ ፊት ያለሽ - - - ማርያም
ከሰይጣን መሸሻ - - - ማርያም
ዋስ ጠበቃችን ነሽ - - - ማርያም
እንዴት ነበር ያኔ - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም

VERSE 6
ጌታን ስትወልጂ - - - - ማርያም
የእረኞቹ ደስታ - - - ማርያም
የመላእክት ዝማሬ - - - ማርያም

CHORUS
ማርያም እንወድሻለን(፪)
ስለወለድሽ የሕይወት ምግብን
ማርያም እንወድሻለን
ድክመቴን አትይ - - - ማርያም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam

VERSE 1
Behat’iat mewdeqen - - - Maryam
Tesfaye anchiwu nesh - - - Maryam
Eske elete mote - - - Maryam
Lalkedash miyalehu - - - - Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam

VERSE 2
Kesrsh lalt’efa - - - Maryam
Gets’e berekete - - - Maryam
Yehywet wastna - - - Maryam
Yememenan wibet - - - Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam

VERSE 3
Zewd aklilachew - - - Maryam
Dingil anchi eko - - - Maryam
Nesh yemenged sinqachew - - - Maryam
Miskr nen lanchi - - - Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam

VERSE 4
Ende nebiyatu - - - Maryam
Sit’ota mehonshn - - - Maryam
Leadam lijoch hulu - - - Maryam
Mogesna ts’ega - - - - Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam

VERSE 5
Begeta fit yalesh - - - Maryam
Keseyt’an meshesha - - - Maryam
Was t’ebeqachn nesh - - - Maryam
Endet neber yane - - - Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam

VERSE 6
Getan sitwelji - - - - Maryam
Yeeregnochu desta - - - Maryam
Yemelaekt zimare - - - Maryam

CHORUS
Maryam enwedshalen (2)
Sileweledsh yehywet migbn
Maryam enwedshalen
Dikmeten aty - - - Maryam'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mariyam-eniwedishalen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mariyam Mariyam (mariyam-mariyam)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ

VERSE 1
ማር ልበል በምድር ያም ልበል በሰማይ
የማይጠግቡት መና የማይጨርሱት ሲሳይ
መንፈስ ቅዱስ ቃኝቶት ሰርቶ በምስጢሩ

VERSE 2
አፌ ላይ ጣፈጠኝ ስምሽ አጠራሩ/2/
መድሃኒት ታቅፈሽ የአለሙን ጌታ
ከቤተሌሄም ደጅ እስከ ጎለጌታ

VERSE 3
የዓለሙን ህመም የአለሙን በሽታ
ታክሚው ነበረ ድንግል በዝምታ/2/
በምን እንመስልሽ የለሽም ምሳሌ

VERSE 4
አንጠግብም ብንጠራሽ ብንዘምርልሽ ሁሌ
ምስክር አያሻም ያንቺ ልዕልና
የአለሙን ንጉስ ወልደሽዋልና/2/

VERSE 5
የወርቅ ማዕጠንት እሳት የታቀፍሽ
የአዲስ ኪዳን ክሩብ ማርያም አንቺ ነሽ
ያ''ርያም እጣን ነሽ መዓዛሽ ያምረ
ዘለዓለም አይወድቅም አንቺን ያከበረ/2/',
      lyrics_transliteration = 'Maryam Maryam libel
Erefte hoy besmsh lit’elal
Yeqal enat yadnal qalsh
Teamr yiseral simsh

VERSE 1
Mar libel bemdr yam libel besemay
Yemayt’egbut mena yemaych’ersut sisay
Menfes Kidus qagntot serto bemst’iru

VERSE 2
Afe lay t’afet’egn simsh at’eraru (2)
Medhanit taqfesh yealemun Geta
Kebetelehem dej eske golegeta

VERSE 3
Yealemun himem yealemun beshta
Takmiw nebere Dingil bezmta (2)
Bemn enmeslsh yeleshm misale

VERSE 4
Ant’egbm bint’erash binzemrlsh hule
Miskr ayasham yanchi lielna
Yealemun nigus weldeshwalna (2)

VERSE 5
Yewerq maet’ent esat yetaqefsh
Yeadis kidan kirub Maryam anchi nesh
Ya''riyam et’an nesh meazash yamre
Zelealem aywedqm anchin yakebere (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mariyam-mariyam'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ

VERSE 1
አዝ
ማር ልበል በምድር ያም ልበል በሰማይ
የማይጠግቡት መና የማይጨርሱት ሲሳይ
መንፈስ ቅዱስ ቃኝቶት ሰርቶ በምስጢሩ

CHORUS
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ

VERSE 2
አፌ ላይ ጣፈጠኝ ስምሽ አጠራሩ/2/
አዝ
መድሃኒት ታቅፈሽ የአለሙን ጌታ
ከቤተሌሄም ደጅ እስከ ጎለጌታ

CHORUS
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ

VERSE 3
የዓለሙን ህመም የአለሙን በሽታ
ታክሚው ነበረ ድንግል በዝምታ/2/
አዝ
በምን እንመስልሽ የለሽም ምሳሌ

CHORUS
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ

VERSE 4
አንጠግብም ብንጠራሽ ብንዘምርልሽ ሁሌ
ምስክር አያሻም ያንቺ ልዕልና
የአለሙን ንጉስ ወልደሽዋልና/2/
አዝ

CHORUS
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ

VERSE 5
የወርቅ ማዕጠንት እሳት የታቀፍሽ
የአዲስ ኪዳን ክሩብ ማርያም አንቺ ነሽ
ያ''ርያም እጣን ነሽ መዓዛሽ ያምረ
ዘለዓለም አይወድቅም አንቺን ያከበረ/2/

CHORUS
ማርያም ማርያም ልበል
እረፍቴ ሆይ በስምሽ ልጠላል
የቃል እናት ያድናል ቃልሽ
ተዓምር ይሰራል ስምሽ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam Maryam libel
Erefte hoy besmsh lit’elal
Yeqal enat yadnal qalsh
Teamr yiseral simsh

VERSE 1
CHORUS
Mar libel bemdr yam libel besemay
Yemayt’egbut mena yemaych’ersut sisay
Menfes Kidus qagntot serto bemst’iru

CHORUS
Maryam Maryam libel
Erefte hoy besmsh lit’elal
Yeqal enat yadnal qalsh
Teamr yiseral simsh

VERSE 2
Afe lay t’afet’egn simsh at’eraru (2)
CHORUS
Medhanit taqfesh yealemun Geta
Kebetelehem dej eske golegeta

CHORUS
Maryam Maryam libel
Erefte hoy besmsh lit’elal
Yeqal enat yadnal qalsh
Teamr yiseral simsh

VERSE 3
Yealemun himem yealemun beshta
Takmiw nebere Dingil bezmta (2)
CHORUS
Bemn enmeslsh yeleshm misale

CHORUS
Maryam Maryam libel
Erefte hoy besmsh lit’elal
Yeqal enat yadnal qalsh
Teamr yiseral simsh

VERSE 4
Ant’egbm bint’erash binzemrlsh hule
Miskr ayasham yanchi lielna
Yealemun nigus weldeshwalna (2)
CHORUS

CHORUS
Maryam Maryam libel
Erefte hoy besmsh lit’elal
Yeqal enat yadnal qalsh
Teamr yiseral simsh

VERSE 5
Yewerq maet’ent esat yetaqefsh
Yeadis kidan kirub Maryam anchi nesh
Ya''riyam et’an nesh meazash yamre
Zelealem aywedqm anchin yakebere (2)

CHORUS
Maryam Maryam libel
Erefte hoy besmsh lit’elal
Yeqal enat yadnal qalsh
Teamr yiseral simsh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mariyam-mariyam', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mariyam Mariyam (mariyam-mariyam-4090)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ማርያም ማርያም ብዬ ስምሽን ልጥራው
አይደክመኝም እኔ ብደጋግመው
አሁንም ጠራሁሽ አላስችልህ ቢለኝ
አውቀዋለሁ ስምሽን እናቴ ስትወለደኝ/2/

VERSE 1
ገና በማህፀን በእናቴ የምጥ ቀን
ደጋግሜ ሰማሁ ሲጠሩት ስምሽን
በሰከንዳት እድሜ የማውቃት አንዲት ቃል
ልቤላይ ያለው ስም ማርያም ማርያም ይላል

VERSE 2
ማርያም ማርያም
ሔዋን ምጧ ቀሎ ልጆቿን ታቀፈች
በአመላጅነትሽ እናቴም ታመነች

VERSE 3
በተወለድኩባት በመጀመሪያው ቀን
ስምሽን እየሰማሁ ወጣሁ ከማህፀን
ማርያም ማርያም

VERSE 4
ከቃልኪዳን ስም ጋር አደኩኝ አብሬ
ምልጃሽ ሳይለየኝ አለሁ እስከዛሬ
የሕይወቴን ፈደል ካንቺ ላይ ቆጠርኩኝ
በልጅሽ አምኜ ዳግም ተወለድኩኝ

VERSE 5
ማርያም ማርያም
የክፉ ቀን ስንቄ ያዘልኩሽ በልቤ
የሕይወቴ ምግብ እንጀራ መሶቤ

VERSE 6
እንደትላንትናው ዛሬም እጠራሻለሁ
የመስቅል ስር ክብሬን እንዴት እረሳለሁ
የመስቅል ስር ክብሬን እንዴት እተዋለሁ',
      lyrics_transliteration = 'Maryam Maryam biye simshn lit’raw
Aydekmegnm ene bidegagmew
Ahunm t’erahush alaschlh bilegn
Awqewalehu simshn enate sitweledegn (2)

VERSE 1
Gena bemahts’en beenate yemt’ qen
Degagme semahu sit’erut simshn
Besekendat edme yemawqat andit qal
Libelay yalew sim Maryam Maryam yilal

VERSE 2
Maryam Maryam
Hewan mit’wa qelo lijochwan taqefech
Beamelajnetsh enatem tamenech

VERSE 3
Beteweledkubat bemejemeriyaw qen
Simshn eyesemahu wet’ahu kemahts’en
Maryam Maryam

VERSE 4
Keqalkidan sim gar adekugn abre
Miljash sayleyegn alehu eskezare
Yehyweten fedel kanchi lay qot’erkugn
Beljsh amgne dagm teweledkugn

VERSE 5
Maryam Maryam
Yekfu qen sinqe yazelkush belbe
Yehywete migb enjera mesobe

VERSE 6
Endetlantnaw zarem et’erashalehu
Yemesql sir kibren endet eresalehu
Yemesql sir kibren endet etewalehu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mariyam-mariyam-4090'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ማርያም ብዬ ስምሽን ልጥራው
አይደክመኝም እኔ ብደጋግመው
አሁንም ጠራሁሽ አላስችልህ ቢለኝ
አውቀዋለሁ ስምሽን እናቴ ስትወለደኝ/2/

VERSE 1
ገና በማህፀን በእናቴ የምጥ ቀን
ደጋግሜ ሰማሁ ሲጠሩት ስምሽን
በሰከንዳት እድሜ የማውቃት አንዲት ቃል
ልቤላይ ያለው ስም ማርያም ማርያም ይላል

CHORUS
ማርያም ማርያም ብዬ ስምሽን ልጥራው
አይደክመኝም እኔ ብደጋግመው
አሁንም ጠራሁሽ አላስችልህ ቢለኝ
አውቀዋለሁ ስምሽን እናቴ ስትወለደኝ/2/

VERSE 2
ማርያም ማርያም
አዝ
ሔዋን ምጧ ቀሎ ልጆቿን ታቀፈች
በአመላጅነትሽ እናቴም ታመነች

CHORUS
ማርያም ማርያም ብዬ ስምሽን ልጥራው
አይደክመኝም እኔ ብደጋግመው
አሁንም ጠራሁሽ አላስችልህ ቢለኝ
አውቀዋለሁ ስምሽን እናቴ ስትወለደኝ/2/

VERSE 3
በተወለድኩባት በመጀመሪያው ቀን
ስምሽን እየሰማሁ ወጣሁ ከማህፀን
ማርያም ማርያም
አዝ

CHORUS
ማርያም ማርያም ብዬ ስምሽን ልጥራው
አይደክመኝም እኔ ብደጋግመው
አሁንም ጠራሁሽ አላስችልህ ቢለኝ
አውቀዋለሁ ስምሽን እናቴ ስትወለደኝ/2/

VERSE 4
ከቃልኪዳን ስም ጋር አደኩኝ አብሬ
ምልጃሽ ሳይለየኝ አለሁ እስከዛሬ
የሕይወቴን ፈደል ካንቺ ላይ ቆጠርኩኝ
በልጅሽ አምኜ ዳግም ተወለድኩኝ

CHORUS
ማርያም ማርያም ብዬ ስምሽን ልጥራው
አይደክመኝም እኔ ብደጋግመው
አሁንም ጠራሁሽ አላስችልህ ቢለኝ
አውቀዋለሁ ስምሽን እናቴ ስትወለደኝ/2/

VERSE 5
ማርያም ማርያም
አዝ
የክፉ ቀን ስንቄ ያዘልኩሽ በልቤ
የሕይወቴ ምግብ እንጀራ መሶቤ

CHORUS
ማርያም ማርያም ብዬ ስምሽን ልጥራው
አይደክመኝም እኔ ብደጋግመው
አሁንም ጠራሁሽ አላስችልህ ቢለኝ
አውቀዋለሁ ስምሽን እናቴ ስትወለደኝ/2/

VERSE 6
እንደትላንትናው ዛሬም እጠራሻለሁ
የመስቅል ስር ክብሬን እንዴት እረሳለሁ
የመስቅል ስር ክብሬን እንዴት እተዋለሁ

CHORUS
ማርያም ማርያም ብዬ ስምሽን ልጥራው
አይደክመኝም እኔ ብደጋግመው
አሁንም ጠራሁሽ አላስችልህ ቢለኝ
አውቀዋለሁ ስምሽን እናቴ ስትወለደኝ/2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam Maryam biye simshn lit’raw
Aydekmegnm ene bidegagmew
Ahunm t’erahush alaschlh bilegn
Awqewalehu simshn enate sitweledegn (2)

VERSE 1
Gena bemahts’en beenate yemt’ qen
Degagme semahu sit’erut simshn
Besekendat edme yemawqat andit qal
Libelay yalew sim Maryam Maryam yilal

CHORUS
Maryam Maryam biye simshn lit’raw
Aydekmegnm ene bidegagmew
Ahunm t’erahush alaschlh bilegn
Awqewalehu simshn enate sitweledegn (2)

VERSE 2
Maryam Maryam
CHORUS
Hewan mit’wa qelo lijochwan taqefech
Beamelajnetsh enatem tamenech

CHORUS
Maryam Maryam biye simshn lit’raw
Aydekmegnm ene bidegagmew
Ahunm t’erahush alaschlh bilegn
Awqewalehu simshn enate sitweledegn (2)

VERSE 3
Beteweledkubat bemejemeriyaw qen
Simshn eyesemahu wet’ahu kemahts’en
Maryam Maryam
CHORUS

CHORUS
Maryam Maryam biye simshn lit’raw
Aydekmegnm ene bidegagmew
Ahunm t’erahush alaschlh bilegn
Awqewalehu simshn enate sitweledegn (2)

VERSE 4
Keqalkidan sim gar adekugn abre
Miljash sayleyegn alehu eskezare
Yehyweten fedel kanchi lay qot’erkugn
Beljsh amgne dagm teweledkugn

CHORUS
Maryam Maryam biye simshn lit’raw
Aydekmegnm ene bidegagmew
Ahunm t’erahush alaschlh bilegn
Awqewalehu simshn enate sitweledegn (2)

VERSE 5
Maryam Maryam
CHORUS
Yekfu qen sinqe yazelkush belbe
Yehywete migb enjera mesobe

CHORUS
Maryam Maryam biye simshn lit’raw
Aydekmegnm ene bidegagmew
Ahunm t’erahush alaschlh bilegn
Awqewalehu simshn enate sitweledegn (2)

VERSE 6
Endetlantnaw zarem et’erashalehu
Yemesql sir kibren endet eresalehu
Yemesql sir kibren endet etewalehu

CHORUS
Maryam Maryam biye simshn lit’raw
Aydekmegnm ene bidegagmew
Ahunm t’erahush alaschlh bilegn
Awqewalehu simshn enate sitweledegn (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mariyam-mariyam-4090', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mariyam Nitsihit (mariyam-nitsihit)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ማርያም ንጽሕት ድንግል ማእምንት
ወላዲተ አምላክ ሰአሊተ ምሕረት ለውሉደ ሰብእ
ሰአሊለነ ኀበ ክርስቶስ ወልድኪ
ይሥረይ ኃጢአተነ ሰ��ሊለነ ቅድስት

VERSE 1
ማርያም ንጽሕት ድንግል ታማኝ
አምላክን የወለድሽ
የምሕረት አማላጅ ለሰው ልጆች
አማልጂን ከልጅሽ ከክርስቶስ ይቅር እንዲለን

VERSE 2
ቅድስት ሆይ ለምኚልን',
      lyrics_transliteration = 'Maryam nits’ht Dingil maemnt
Weladite amlak sealite mihret lewlude sebe
Sealilene hebe Kristos weldki
Yisrey hat’iatene se��lilene Kidist

VERSE 1
Maryam nits’ht Dingil tamagn
Amlakn yeweledsh
Yemhret amalaj lesew lijoch
Amaljin keljsh kekrstos yiqr endilen

VERSE 2
Kidist hoy lemgniln',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mariyam-nitsihit'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ንጽሕት ድንግል ማእምንት
ወላዲተ አምላክ ሰአሊተ ምሕረት ለውሉደ ሰብእ
ሰአሊለነ ኀበ ክርስቶስ ወልድኪ
ይሥረይ ኃጢአተነ ሰ��ሊለነ ቅድስት

VERSE 1
ማርያም ንጽሕት ድንግል ታማኝ
አምላክን የወለድሽ
የምሕረት አማላጅ ለሰው ልጆች
አማልጂን ከልጅሽ ከክርስቶስ ይቅር እንዲለን

CHORUS
ማርያም ንጽሕት ድንግል ማእምንት
ወላዲተ አምላክ ሰአሊተ ምሕረት ለውሉደ ሰብእ
ሰአሊለነ ኀበ ክርስቶስ ወልድኪ
ይሥረይ ኃጢአተነ ሰ��ሊለነ ቅድስት

VERSE 2
ቅድስት ሆይ ለምኚልን

CHORUS
ማርያም ንጽሕት ድንግል ማእምንት
ወላዲተ አምላክ ሰአሊተ ምሕረት ለውሉደ ሰብእ
ሰአሊለነ ኀበ ክርስቶስ ወልድኪ
ይሥረይ ኃጢአተነ ሰ��ሊለነ ቅድስት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam nits’ht Dingil maemnt
Weladite amlak sealite mihret lewlude sebe
Sealilene hebe Kristos weldki
Yisrey hat’iatene se��lilene Kidist

VERSE 1
Maryam nits’ht Dingil tamagn
Amlakn yeweledsh
Yemhret amalaj lesew lijoch
Amaljin keljsh kekrstos yiqr endilen

CHORUS
Maryam nits’ht Dingil maemnt
Weladite amlak sealite mihret lewlude sebe
Sealilene hebe Kristos weldki
Yisrey hat’iatene se��lilene Kidist

VERSE 2
Kidist hoy lemgniln

CHORUS
Maryam nits’ht Dingil maemnt
Weladite amlak sealite mihret lewlude sebe
Sealilene hebe Kristos weldki
Yisrey hat’iatene se��lilene Kidist'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mariyam-nitsihit', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mariyam Teabi (mariyam-teabi)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ማርያም ተዓቢ እምኩሉ ፍጥረት
ኢያውዓያ እሳተ መለኮት

VERSE 1
ማርያም ተዓቢ እምኩሉ ፍጥረት
ኢያውዓያ እሳተ መለኮት',
      lyrics_transliteration = 'Maryam teabi emkulu fit’ret
Iyawaya esate melekot

VERSE 1
Maryam teabi emkulu fit’ret
Iyawaya esate melekot',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mariyam-teabi'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ተዓቢ እምኩሉ ፍጥረት
ኢያውዓያ እሳተ መለኮት

VERSE 1
ማርያም ተዓቢ እምኩሉ ፍጥረት
ኢያውዓያ እሳተ መለኮት

CHORUS
ማርያም ተዓቢ እምኩሉ ፍጥረት
ኢያውዓያ እሳተ መለኮት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam teabi emkulu fit’ret
Iyawaya esate melekot

VERSE 1
Maryam teabi emkulu fit’ret
Iyawaya esate melekot

CHORUS
Maryam teabi emkulu fit’ret
Iyawaya esate melekot'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mariyam-teabi', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mariyam Yelibe Nesh (mariyam-yelibe-nesh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 1
የማዋያት ውስጤን ጓዳ ጎርጓዳዬን
ድንግል አደራሽን አሳስቢ ጉዳዬን
እንዳዘንኩኝ ታስሬ እንዳልቀር ደግፊኝ
ቅስሜ ተሰብሮ

VERSE 2
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 3
ለንግግሬ ማር ጣፋጭ ለአንደበቴ
የሀሳቤ ማሰሪያ በሰው ፊት ኩራቴ
ደምግባቴ ባይጸድቅ በሰው እጅ ብልጫ
ልጅሽ ነው ሞገሴ ያኖረኝ በብቻ

VERSE 4
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 5
ሰሌዳ ሆነሽ ቃልን ያስተማርሽኝ
ደግሞ መሶበ ወርቅ ህብስቴን የሰጠሽኝ
በምን መሰለሽ ምሳሌው ደከመ
መስቀሉ ስር አለው አንቺን ተሸለመ

VERSE 6
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ',
      lyrics_transliteration = 'Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 1
Yemawayat wist’en gwada gorgwadayen
Dingil aderashn asasbi gudayen
Endazenkugn tasre endalqer degfign
Qisme tesebro

VERSE 2
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 3
Lenggre mar t’afach’ leandebete
Yehesabe maseriya besew fit kurate
Demgbate bayts’edq besew ej bilch’a
Lijsh new mogese yanoregn bebcha

VERSE 4
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 5
Seleda honesh qaln yastemarshgn
Degmo mesobe werq hibsten yeset’eshgn
Bemn meselesh misalew dekeme
Mesqelu sir alew anchin tesheleme

VERSE 6
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mariyam-yelibe-nesh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 1
የማዋያት ውስጤን ጓዳ ጎርጓዳዬን
ድንግል አደራሽን አሳስቢ ጉዳዬን
እንዳዘንኩኝ ታስሬ እንዳልቀር ደግፊኝ
ቅስሜ ተሰብሮ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 2
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 3
ለንግግሬ ማር ጣፋጭ ለአንደበቴ
የሀሳቤ ማሰሪያ በሰው ፊት ኩራቴ
ደምግባቴ ባይጸድቅ በሰው እጅ ብልጫ
ልጅሽ ነው ሞገሴ ያኖረኝ በብቻ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 4
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 5
ሰሌዳ ሆነሽ ቃልን ያስተማርሽኝ
ደግሞ መሶበ ወርቅ ህብስቴን የሰጠሽኝ
በምን መሰለሽ ምሳሌው ደከመ
መስቀሉ ስር አለው አንቺን ተሸለመ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

VERSE 6
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ

CHORUS
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ
ማርያም የልቤ ነሽ አዛኝቱ የቅርቤ ነሽ
ዘምራለሁ ለክብርሽ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 1
Yemawayat wist’en gwada gorgwadayen
Dingil aderashn asasbi gudayen
Endazenkugn tasre endalqer degfign
Qisme tesebro

CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 2
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 3
Lenggre mar t’afach’ leandebete
Yehesabe maseriya besew fit kurate
Demgbate bayts’edq besew ej bilch’a
Lijsh new mogese yanoregn bebcha

CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 4
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 5
Seleda honesh qaln yastemarshgn
Degmo mesobe werq hibsten yeset’eshgn
Bemn meselesh misalew dekeme
Mesqelu sir alew anchin tesheleme

CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

VERSE 6
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh

CHORUS
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh
Maryam yelbe nesh azagntu yeqrbe nesh
Zemralehu lekbrsh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mariyam-yelibe-nesh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mariyam Yemilew Sim (mariyam-yemilew-sim)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 1
ዘወትር ይኖራል እየሆነኝ ክብሬ
ምክንያት ስላረገሽ ጌታ በማዳኑ
ካንቺ ጋር ተሳስሯል ልቤ ቃልኪዳኑ
ላመስግንሽ ብዬ ቃል ከአፌ ባይወጣም

VERSE 2
አለ በደም ስሬ ማርያም የሚለው ስም
ባልጸናው አእምሮ በልጅነታችን
ማርያም ጣታችን ነሽ መታረቂያችን
አሁንም ላደፈው ለጨለመው አለም

VERSE 3
የእርቅ ሰነድ ነሽ የፍቅር የሰላም
የእናትነት ፍቅርሽ እጅጉን ይደንቃል
የምህረት እጆችሽ ሁሌም ተዘርግቷል
የልቤ ናፍቆቱ አንቺ ነሽ ማርያም

VERSE 4
ያደራ እናቴ ነሽ ካንቺ አልለይም
ከፍጥረት በሚልቅ የመወደድ ግርማ
ነግሰሽ የምትኖሪ በንጉስ ከተማ
ማርያም ሰላማ ነሽ የክብሬ መገኛ

VERSE 5
ድኅነትን ያስገኘሽ ለፍጥረት መዳኛ',
      lyrics_transliteration = 'Lanchi kalegn fiqr yetenesa
Alwlm aladrm simshn salanesa
Fiqrsh bedem sire simsh bekenfere
Dingil hoy yinoral eyehonelgn kibre

VERSE 1
Zewetr yinoral eyehonegn kibre
Miknyat silaregesh Geta bemadanu
Kanchi gar tesasrwal libe qalkidanu
Lamesgnsh biye qal keafe baywet’am

VERSE 2
Ale bedem sire Maryam yemilew sim
Balts’enaw aemro beljnetachn
Maryam t’atachn nesh metareqiyachn
Ahunm ladefew lech’elemew alem

VERSE 3
Yeerq sened nesh yefqr yeselam
Yeenatnet fiqrsh ejgun yidenqal
Yemhret ejochsh hulem tezergtwal
Yelbe nafqotu anchi nesh Maryam

VERSE 4
Yadera enate nesh kanchi alleym
Keft’ret bemilq yemeweded girma
Negsesh yemtnori bengus ketema
Maryam selama nesh yekbre megegna

VERSE 5
Dihnetn yasgegnesh left’ret medagna',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mariyam-yemilew-sim'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 1
ዘወትር ይኖራል እየሆነኝ ክብሬ
ምክንያት ስላረገሽ ጌታ በማዳኑ
ካንቺ ጋር ተሳስሯል ልቤ ቃልኪዳኑ
ላመስግንሽ ብዬ ቃል ከአፌ ባይወጣም

CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 2
አለ በደም ስሬ ማርያም የሚለው ስም
ባልጸናው አእምሮ በልጅነታችን
ማርያም ጣታችን ነሽ መታረቂያችን
አሁንም ላደፈው ለጨለመው አለም

CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 3
የእርቅ ሰነድ ነሽ የፍቅር የሰላም
የእናትነት ፍቅርሽ እጅጉን ይደንቃል
የምህረት እጆችሽ ሁሌም ተዘርግቷል
የልቤ ናፍቆቱ አንቺ ነሽ ማርያም

CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 4
ያደራ እናቴ ነሽ ካንቺ አልለይም
ከፍጥረት በሚልቅ የመወደድ ግርማ
ነግሰሽ የምትኖሪ በንጉስ ከተማ
ማርያም ሰላማ ነሽ የክብሬ መገኛ

CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ

VERSE 5
ድኅነትን ያስገኘሽ ለፍጥረት መዳኛ

CHORUS
ላንቺ ካለኝ ፍቅር የተነሳ
አልውልም አላድርም ስምሽን ሳላነሳ
ፍቅርሽ በደም ስሬ ስምሽ በከንፈሬ
ድንግል ሆይ ይኖራል እየሆነልኝ ክብሬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lanchi kalegn fiqr yetenesa
Alwlm aladrm simshn salanesa
Fiqrsh bedem sire simsh bekenfere
Dingil hoy yinoral eyehonelgn kibre

VERSE 1
Zewetr yinoral eyehonegn kibre
Miknyat silaregesh Geta bemadanu
Kanchi gar tesasrwal libe qalkidanu
Lamesgnsh biye qal keafe baywet’am

CHORUS
Lanchi kalegn fiqr yetenesa
Alwlm aladrm simshn salanesa
Fiqrsh bedem sire simsh bekenfere
Dingil hoy yinoral eyehonelgn kibre

VERSE 2
Ale bedem sire Maryam yemilew sim
Balts’enaw aemro beljnetachn
Maryam t’atachn nesh metareqiyachn
Ahunm ladefew lech’elemew alem

CHORUS
Lanchi kalegn fiqr yetenesa
Alwlm aladrm simshn salanesa
Fiqrsh bedem sire simsh bekenfere
Dingil hoy yinoral eyehonelgn kibre

VERSE 3
Yeerq sened nesh yefqr yeselam
Yeenatnet fiqrsh ejgun yidenqal
Yemhret ejochsh hulem tezergtwal
Yelbe nafqotu anchi nesh Maryam

CHORUS
Lanchi kalegn fiqr yetenesa
Alwlm aladrm simshn salanesa
Fiqrsh bedem sire simsh bekenfere
Dingil hoy yinoral eyehonelgn kibre

VERSE 4
Yadera enate nesh kanchi alleym
Keft’ret bemilq yemeweded girma
Negsesh yemtnori bengus ketema
Maryam selama nesh yekbre megegna

CHORUS
Lanchi kalegn fiqr yetenesa
Alwlm aladrm simshn salanesa
Fiqrsh bedem sire simsh bekenfere
Dingil hoy yinoral eyehonelgn kibre

VERSE 5
Dihnetn yasgegnesh left’ret medagna

CHORUS
Lanchi kalegn fiqr yetenesa
Alwlm aladrm simshn salanesa
Fiqrsh bedem sire simsh bekenfere
Dingil hoy yinoral eyehonelgn kibre'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mariyam-yemilew-sim', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: ‘Mariyamyene yene (mariyamyene-yene)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መሸሸጊያዬ እናት አለሜ
ድንግል ሰላሜ
ሁኘ ባንች እቅፍ
ይሄን ዘመን ልለፍ(2)

VERSE 1
በምልጃሽ ልከለል በፍቅርሽ ልጋረድ
አልፈዋለሁና ያንን የሞት መንገድ
የማትፈርሽ መቅደስ የረፍቴ ዋሻ ነሽ
ከሚያሳደኝ ጠላት መደበቂያ ነሸ

VERSE 2
እናቴ የኔ የኔ
ላፍስስልሽ ቅኔ
ማርያም የኔ የኔ
ነሽ የክፋ ቀኔ

VERSE 3
እጄን ይዘሽ ምሪኝ ባንች ልበል ቀና
ጨለማው ይገፈፍ ሆነሽልኝ ፋና
ዳገቱን አግዠኝ አድርጊልኝ ቀላል
ማርያም ነሽና የህይወት መሰላል

VERSE 4
እናቴ የኔ የኔ
ላፍስስልሽ ቅኔ
ማርያም የኔ የኔ
የሽ የክፋ ቅኔ

VERSE 5
ከቀስቱ አስመልጭኝ ከሚወረወረው
ይፈታልኝ ልሂድ በኔ የታሰረው
መመኪያ ድንግል መተማመኛዬ
እናቴ እንትሆኝ የሰጠኝ ጌታዬ

VERSE 6
እናቴ የኔ የኔ
ላፍስስልሽ ቅኔ
ማርያም የኔ የኔ
ነሽ የክፋ ቀኔ

VERSE 7
አስፈሪውን ጊዜ አሳልፊኝ ድንግል
መጠጊያ ታዛዬ ደግፊኝ እንዳልዝል
ቀን ሰብሮኝ እንዳይቀር ሰው አድርጊኝ ዳግም
ምስክርሽ ልሁን ለወለታሽ ማሪያም

VERSE 8
እናቴ የኔ የኔ
ላፍስስልሽ ቅኔ
ማርያም የኔ የኔ
ነሽ የክፉ ቀኔ',
      lyrics_transliteration = 'Mesheshegiyaye enat aleme
Dingil selame
Hugne banch eqf
Yihen zemen lilef (2)

VERSE 1
Bemljash likelel befqrsh ligared
Alfewalehuna yann yemot menged
Yematfersh meqdes yerefte washa nesh
Kemiyasadegn t’elat medebeqiya neshe

VERSE 2
Enate yene yene
Lafsslsh qine
Maryam yene yene
Nesh yekfa qene

VERSE 3
Ejen yizesh mirign banch libel qena
Ch’elemaw yigefef honeshlgn fana
Dagetun agzhegn adrgilgn qelal
Maryam neshna yehywet meselal

VERSE 4
Enate yene yene
Lafsslsh qine
Maryam yene yene
Yesh yekfa qine

VERSE 5
Keqestu asmelch’gn kemiwerewerew
Yifetalgn lihid bene yetaserew
Memekiya Dingil metemamegnaye
Enate enthogn yeset’egn Getaye

VERSE 6
Enate yene yene
Lafsslsh qine
Maryam yene yene
Nesh yekfa qene

VERSE 7
Asferiwn gize asalfign Dingil
Met’egiya tazaye degfign endalzl
Qen sebrogn endayqer sew adrgign dagm
Miskrsh lihun leweletash mariyam

VERSE 8
Enate yene yene
Lafsslsh qine
Maryam yene yene
Nesh yekfu qene',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mariyamyene-yene'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መሸሸጊያዬ እናት አለሜ
ድንግል ሰላሜ
ሁኘ ባንች እቅፍ
ይሄን ዘመን ልለፍ(2)

VERSE 1
በምልጃሽ ልከለል በፍቅርሽ ልጋረድ
አልፈዋለሁና ያንን የሞት መንገድ
የማትፈርሽ መቅደስ የረፍቴ ዋሻ ነሽ
ከሚያሳደኝ ጠላት መደበቂያ ነሸ

CHORUS
መሸሸጊያዬ እናት አለሜ
ድንግል ሰላሜ
ሁኘ ባንች እቅፍ
ይሄን ዘመን ልለፍ(2)

VERSE 2
እናቴ የኔ የኔ
ላፍስስልሽ ቅኔ
ማርያም የኔ የኔ
ነሽ የክፋ ቀኔ

CHORUS
መሸሸጊያዬ እናት አለሜ
ድንግል ሰላሜ
ሁኘ ባንች እቅፍ
ይሄን ዘመን ልለፍ(2)

VERSE 3
እጄን ይዘሽ ምሪኝ ባንች ልበል ቀና
ጨለማው ይገፈፍ ሆነሽልኝ ፋና
ዳገቱን አግዠኝ አድርጊልኝ ቀላል
ማርያም ነሽና የህይወት መሰላል

CHORUS
መሸሸጊያዬ እናት አለሜ
ድንግል ሰላሜ
ሁኘ ባንች እቅፍ
ይሄን ዘመን ልለፍ(2)

VERSE 4
እናቴ የኔ የኔ
ላፍስስልሽ ቅኔ
ማርያም የኔ የኔ
የሽ የክፋ ቅኔ

CHORUS
መሸሸጊያዬ እናት አለሜ
ድንግል ሰላሜ
ሁኘ ባንች እቅፍ
ይሄን ዘመን ልለፍ(2)

VERSE 5
ከቀስቱ አስመልጭኝ ከሚወረወረው
ይፈታልኝ ልሂድ በኔ የታሰረው
መመኪያ ድንግል መተማመኛዬ
እናቴ እንትሆኝ የሰጠኝ ጌታዬ

CHORUS
መሸሸጊያዬ እናት አለሜ
ድንግል ሰላሜ
ሁኘ ባንች እቅፍ
ይሄን ዘመን ልለፍ(2)

VERSE 6
እናቴ የኔ የኔ
ላፍስስልሽ ቅኔ
ማርያም የኔ የኔ
ነሽ የክፋ ቀኔ

CHORUS
መሸሸጊያዬ እናት አለሜ
ድንግል ሰላሜ
ሁኘ ባንች እቅፍ
ይሄን ዘመን ልለፍ(2)

VERSE 7
አስፈሪውን ጊዜ አሳልፊኝ ድንግል
መጠጊያ ታዛዬ ደግፊኝ እንዳልዝል
ቀን ሰብሮኝ እንዳይቀር ሰው አድርጊኝ ዳግም
ምስክርሽ ልሁን ለወለታሽ ማሪያም

CHORUS
መሸሸጊያዬ እናት አለሜ
ድንግል ሰላሜ
ሁኘ ባንች እቅፍ
ይሄን ዘመን ልለፍ(2)

VERSE 8
እናቴ የኔ የኔ
ላፍስስልሽ ቅኔ
ማርያም የኔ የኔ
ነሽ የክፉ ቀኔ

CHORUS
መሸሸጊያዬ እናት አለሜ
ድንግል ሰላሜ
ሁኘ ባንች እቅፍ
ይሄን ዘመን ልለፍ(2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mesheshegiyaye enat aleme
Dingil selame
Hugne banch eqf
Yihen zemen lilef (2)

VERSE 1
Bemljash likelel befqrsh ligared
Alfewalehuna yann yemot menged
Yematfersh meqdes yerefte washa nesh
Kemiyasadegn t’elat medebeqiya neshe

CHORUS
Mesheshegiyaye enat aleme
Dingil selame
Hugne banch eqf
Yihen zemen lilef (2)

VERSE 2
Enate yene yene
Lafsslsh qine
Maryam yene yene
Nesh yekfa qene

CHORUS
Mesheshegiyaye enat aleme
Dingil selame
Hugne banch eqf
Yihen zemen lilef (2)

VERSE 3
Ejen yizesh mirign banch libel qena
Ch’elemaw yigefef honeshlgn fana
Dagetun agzhegn adrgilgn qelal
Maryam neshna yehywet meselal

CHORUS
Mesheshegiyaye enat aleme
Dingil selame
Hugne banch eqf
Yihen zemen lilef (2)

VERSE 4
Enate yene yene
Lafsslsh qine
Maryam yene yene
Yesh yekfa qine

CHORUS
Mesheshegiyaye enat aleme
Dingil selame
Hugne banch eqf
Yihen zemen lilef (2)

VERSE 5
Keqestu asmelch’gn kemiwerewerew
Yifetalgn lihid bene yetaserew
Memekiya Dingil metemamegnaye
Enate enthogn yeset’egn Getaye

CHORUS
Mesheshegiyaye enat aleme
Dingil selame
Hugne banch eqf
Yihen zemen lilef (2)

VERSE 6
Enate yene yene
Lafsslsh qine
Maryam yene yene
Nesh yekfa qene

CHORUS
Mesheshegiyaye enat aleme
Dingil selame
Hugne banch eqf
Yihen zemen lilef (2)

VERSE 7
Asferiwn gize asalfign Dingil
Met’egiya tazaye degfign endalzl
Qen sebrogn endayqer sew adrgign dagm
Miskrsh lihun leweletash mariyam

CHORUS
Mesheshegiyaye enat aleme
Dingil selame
Hugne banch eqf
Yihen zemen lilef (2)

VERSE 8
Enate yene yene
Lafsslsh qine
Maryam yene yene
Nesh yekfu qene

CHORUS
Mesheshegiyaye enat aleme
Dingil selame
Hugne banch eqf
Yihen zemen lilef (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mariyamyene-yene', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Maryam Argalech (maryam-argalech)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 1
የአባቱዋን ዳዊትን ትንቢት ልትፈፅም
ወርቁን ተጎናጽፋ በቀኙ ልትቆም
ወደ አምላክ ማደሪያ ወደ ሰማያት
አረገች በእልልታ ድንግል የእኛ እናት

VERSE 2
አርጋለች ማርያም ተነስታለች

VERSE 3
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 4
ሰማያት ይከፈት ደመናም ይዘርጋ
ዝምታም አይኖርም እመ አምላክ አርጋ
አንደበት ይከፈት ማርያምን ያመስግን
ከዘለዓለም ጥፋት በምልጃዋ እንድንድን

VERSE 5
አርጋለች ማርያም ተነስታለች

VERSE 6
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 7
የአምላክ ማደሪያ ያ ቅዱስ ስጋሽ
አምላክን ያቀፉት እነዚያ እጆችሽ
ሙስና መቃብር ይዞ አላስቀራቸው
ተነስተዋል በክብር በእምነት አየናቸው

VERSE 8
አርጋለች ማርያም ተነስታለች

VERSE 9
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 10
ሐዋርያት አበው እንኳን ደስ አላችሁ
በክብር አረገች ማርያም ሞገሳችሁ
ወደ ዓለምም ውጡ ሰበኑዋን ይዛችሁ
የድንግል እርገቷን ንገሩ ተግታችሁ

VERSE 11
አርጋለች ማርያም ተነስታለች

VERSE 12
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች',
      lyrics_transliteration = 'Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 1
Ye abatuwa Dawitin tenbit litfetsm
Werqun tegonatsfa beqeghu litqom
Wede Amlak maderiya wede semayat

VERSE 2
Aregech be ellilta Dengel yegna Enat
Aregalech Maryam tenestalech
Maryam argalach wede genet (2)

VERSE 3
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 4
Semayat yiqefet demenam yizerga
Zimtam aynorm Eme Amlak arga
Andebet yiqefet Maryamin yamesgn

VERSE 5
Ke zelalem tfat bemiljawa endendn
Aregalech Maryam tenestalech
Maryam argalach wede genet (2)

VERSE 6
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 7
Ye Amlak maderiya ya qidus segash
Amlakn yaqefut inezya ejochish
Musna meqabir yizo alasqerachew

VERSE 8
Tenestewal be kibr be emnet ayenachew
Aregalech Maryam tenestalech
Maryam argalach wede genet (2)

VERSE 9
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 10
Hawaryat abew enkwan des alachu
Be kibr aregech Maryam mogesachu
Wede alemem wotu sebenuwan yizachu

VERSE 11
Ye Dengel ergetwan nigeru tegtachu
Aregalech Maryam tenestalech
Maryam argalach wede genet (2)

VERSE 12
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'maryam-argalech'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 1
የአባቱዋን ዳዊትን ትንቢት ልትፈፅም
ወርቁን ተጎናጽፋ በቀኙ ልትቆም
ወደ አምላክ ማደሪያ ወደ ሰማያት
አረገች በእልልታ ድንግል የእኛ እናት

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 2
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 3
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 4
ሰማያት ይከፈት ደመናም ይዘርጋ
ዝምታም አይኖርም እመ አምላክ አርጋ
አንደበት ይከፈት ማርያምን ያመስግን
ከዘለዓለም ጥፋት በምልጃዋ እንድንድን

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 5
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 6
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 7
የአምላክ ማደሪያ ያ ቅዱስ ስጋሽ
አምላክን ያቀፉት እነዚያ እጆችሽ
ሙስና መቃብር ይዞ አላስቀራቸው
ተነስተዋል በክብር በእምነት አየናቸው

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 8
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 9
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 10
ሐዋርያት አበው እንኳን ደስ አላችሁ
በክብር አረገች ማርያም ሞገሳችሁ
ወደ ዓለምም ውጡ ሰበኑዋን ይዛችሁ
የድንግል እርገቷን ንገሩ ተግታችሁ

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 11
አርጋለች ማርያም ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

VERSE 12
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች

CHORUS
ማርያም አርጋለች ወደ ገነት (2)
የሰማይ መላእክት እያረጓጓት
እርሷም እንደ ልጅዋ ተነስታለች'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 1
Ye abatuwa Dawitin tenbit litfetsm
Werqun tegonatsfa beqeghu litqom
Wede Amlak maderiya wede semayat

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 2
Aregech be ellilta Dengel yegna Enat
Aregalech Maryam tenestalech
Maryam argalach wede genet (2)

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 3
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 4
Semayat yiqefet demenam yizerga
Zimtam aynorm Eme Amlak arga
Andebet yiqefet Maryamin yamesgn

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 5
Ke zelalem tfat bemiljawa endendn
Aregalech Maryam tenestalech
Maryam argalach wede genet (2)

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 6
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 7
Ye Amlak maderiya ya qidus segash
Amlakn yaqefut inezya ejochish
Musna meqabir yizo alasqerachew

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 8
Tenestewal be kibr be emnet ayenachew
Aregalech Maryam tenestalech
Maryam argalach wede genet (2)

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 9
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 10
Hawaryat abew enkwan des alachu
Be kibr aregech Maryam mogesachu
Wede alemem wotu sebenuwan yizachu

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 11
Ye Dengel ergetwan nigeru tegtachu
Aregalech Maryam tenestalech
Maryam argalach wede genet (2)

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

VERSE 12
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech

CHORUS
Maryam argalach wede genet (2)
Yesemay melaekt eyaregagwat
Erswam enda lijwa tenestalech'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'maryam-argalech', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Masitewal Sitilin (masitewal-sitilin)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 1
በአምስቱ አዕማድ የጸናችዉ ቁማ፤
የነፍስ ዕረፍት ነች ያለች አስቀድማ፤
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፪)

VERSE 2
ያላቸዉ ከሚመስል የአምልኮ መልክ፤
ኃይልህን ለካዱት ሀሰት በመስበክ፤
ከሠራሃት ቅጽርህ በጽኑ መሠረት፤
ከመንጋዉ ተለዩ በኑፋቄ ትምህርት፤

VERSE 3
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፪)
ማርያም ማርያም ብትል በሠርክ በማለዳ፤
ስለሰጠችን ነዉ መድኃኒትን ወልዳ፤

VERSE 4
ነገረ ቅዱሳን ቢሰበክ በአዋጅ፤
መች ጋረዱንና ገለጡልን እንጅ፤
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፪)

VERSE 5
ከ 3000 ዘመን ቀድማ ለታነጸች፤
አምላክ ወልደ አምላክ መሆኑን ላመነች፤
አይሆንም እየሱስ እንግዳ ዜናዋ፤
እርሱ ነዉ ያሰገኛት እርሱ ነዉ ሰሪዋ፤

VERSE 6
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፪)
የስጋን ነዉ እንጅ የነፍስን ሳያዩ፤
ከፀጋዉ ግምጃ ቤት ርቀዉ ተለዩ፤

VERSE 7
ሃይማኖት እያለኝ ምግባር ለጎደለኝ፤
ለኔም ማስተዋሉን አይምሮን ስጠኝ::',
      lyrics_transliteration = 'Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 1
Beamstu aemad yets’enachwu quma;
Yenefs ereft nech yalech asqedma;
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (2)

VERSE 2
Yalachewu kemimesl yeamlko melk;
Haylhn lekadut heset bemesbek;
Keserahat qits’rh bets’nu meseret;
Kemengawu teleyu benufaqe timhrt;

VERSE 3
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (2)
Maryam Maryam bitl beserk bemaleda;
Sileset’echn newu medhanitn welda;

VERSE 4
Negere Kidusan bisebek beawaj;
Mech garedunna gelet’uln enj;
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (2)

VERSE 5
Ke 3000 zemen qedma letanets’ech;
Amlak welde amlak mehonun lamenech;
Ayhonm eyesus engda zenawa;
Ersu newu yasegegnat ersu newu seriwa;

VERSE 6
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (2)
Yesgan newu enj yenefsn sayayu;
Kets’egawu gimja bet riqewu teleyu;

VERSE 7
Haymanot eyalegn migbar legodelegn;
Lenem mastewalun aymron sit’egn::',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'masitewal-sitilin'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 1
በአምስቱ አዕማድ የጸናችዉ ቁማ፤
የነፍስ ዕረፍት ነች ያለች አስቀድማ፤
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፪)

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 2
ያላቸዉ ከሚመስል የአምልኮ መልክ፤
ኃይልህን ለካዱት ሀሰት በመስበክ፤
ከሠራሃት ቅጽርህ በጽኑ መሠረት፤
ከመንጋዉ ተለዩ በኑፋቄ ትምህርት፤

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 3
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፪)
ማርያም ማርያም ብትል በሠርክ በማለዳ፤
ስለሰጠችን ነዉ መድኃኒትን ወልዳ፤

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 4
ነገረ ቅዱሳን ቢሰበክ በአዋጅ፤
መች ጋረዱንና ገለጡልን እንጅ፤
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፪)

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 5
ከ 3000 ዘመን ቀድማ ለታነጸች፤
አምላክ ወልደ አምላክ መሆኑን ላመነች፤
አይሆንም እየሱስ እንግዳ ዜናዋ፤
እርሱ ነዉ ያሰገኛት እርሱ ነዉ ሰሪዋ፤

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 6
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፪)
የስጋን ነዉ እንጅ የነፍስን ሳያዩ፤
ከፀጋዉ ግምጃ ቤት ርቀዉ ተለዩ፤

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤

VERSE 7
ሃይማኖት እያለኝ ምግባር ለጎደለኝ፤
ለኔም ማስተዋሉን አይምሮን ስጠኝ::

CHORUS
ማስተዋል ስጥልን አይምሮን ስጥልን፤
አከበርን ብለው ለጣሉት ክብርህን፤(፬)
ዓለቱን ፈልፍላ መቅደስ ለተከለች፤
ስጋዉና ደሙን ለሕይወት የሰጠች፤'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 1
Beamstu aemad yets’enachwu quma;
Yenefs ereft nech yalech asqedma;
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (2)

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 2
Yalachewu kemimesl yeamlko melk;
Haylhn lekadut heset bemesbek;
Keserahat qits’rh bets’nu meseret;
Kemengawu teleyu benufaqe timhrt;

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 3
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (2)
Maryam Maryam bitl beserk bemaleda;
Sileset’echn newu medhanitn welda;

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 4
Negere Kidusan bisebek beawaj;
Mech garedunna gelet’uln enj;
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (2)

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 5
Ke 3000 zemen qedma letanets’ech;
Amlak welde amlak mehonun lamenech;
Ayhonm eyesus engda zenawa;
Ersu newu yasegegnat ersu newu seriwa;

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 6
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (2)
Yesgan newu enj yenefsn sayayu;
Kets’egawu gimja bet riqewu teleyu;

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;

VERSE 7
Haymanot eyalegn migbar legodelegn;
Lenem mastewalun aymron sit’egn::

CHORUS
Mastewal sit’ln aymron sit’ln;
Akebern bilew let’alut kibrhn; (4)
Aletun felfla meqdes letekelech;
Sigawuna demun lehywet yeset’ech;'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'masitewal-sitilin', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Medafa Lay (medafa-lay)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 1
ቁስሎቼ ላይ ዘይት ያኖረ እኔን የማረኝ
በትከሻው የተሸከመኝ ችሉ ያኖረኝ
ባምጽበት ምን ብበድለው
እርሱ እንደው ያው ነው

VERSE 2
አልጠቆረም አልጠፋም ፊቱ የአባትነቱ
ደዌን የሚያውቅ ታማኙ እረኛ ለአፍታ ማይተኛ
ሲጠብቀኝ ውሎ የሚያድር በፍቅር አጥር
ባይኖቼ ላይ እንደተሳለ አሁንም አለ

VERSE 3
እግሬ በእምነት ተከታትሎታል ልቤም ወዶታል
የተቤዤኝ ህይወቱን ጥሎ ማእረጉን ጥሎ
እኔን ሊያድን እርሱ ታመመ መስቀል ላይ ቆመ
በጁ መሀል ሰንሰለት ገባ ስለኔ አነባ

VERSE 4
ባደባባይ መሰከረልኝ ሞቴን ሞተልኝ
የደም ጅረት የደም ነጠብጠብ የእግዚአብሔር ጥበብ
በዚህ መንገድ ህይወት አበዛ በደሙ ገዛ
እረፍቴ ሆይ ውዴ እለዋለሁ እኔ አምንዋለሁ

VERSE 5
ያከበረኝ የዋጀኝ እርሱ ያውም በነፍሱ',
      lyrics_transliteration = 'Medafa lay qusl kayachhu
Yehmam sew kastewalachhu
Wide ersu new nefsen yegezat
Beenqu sayhon bedem yegezat (X4)

VERSE 1
Qusloche lay zeyt yanore enen yemaregn
Betkeshaw yeteshekemegn chlu yanoregn
Bamts’bet min bibedlew
Ersu endew yaw new

VERSE 2
Alt’eqorem alt’efam fitu yeabatnetu
Dewen yemiyawq tamagnu eregna leafta maytegna
Sit’ebqegn wilo yemiyadr befqr at’r
Baynoche lay endetesale ahunm ale

VERSE 3
Egre beemnet teketatlotal libem wedotal
Yetebezhegn hiywetun t’lo maeregun t’lo
Enen liyadn ersu tameme mesqel lay qome
Beju mehel senselet geba silene aneba

VERSE 4
Badebabay mesekerelgn moten motelgn
Yedem jiret yedem net’ebt’eb yeEgziabher t’beb
Bezih menged hiywet abeza bedemu geza
Erefte hoy wide elewalehu ene amnwalehu

VERSE 5
Yakeberegn yewajegn ersu yawm benefsu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'medafa-lay'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 1
ቁስሎቼ ላይ ዘይት ያኖረ እኔን የማረኝ
በትከሻው የተሸከመኝ ችሉ ያኖረኝ
ባምጽበት ምን ብበድለው
እርሱ እንደው ያው ነው

CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 2
አልጠቆረም አልጠፋም ፊቱ የአባትነቱ
ደዌን የሚያውቅ ታማኙ እረኛ ለአፍታ ማይተኛ
ሲጠብቀኝ ውሎ የሚያድር በፍቅር አጥር
ባይኖቼ ላይ እንደተሳለ አሁንም አለ

CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 3
እግሬ በእምነት ተከታትሎታል ልቤም ወዶታል
የተቤዤኝ ህይወቱን ጥሎ ማእረጉን ጥሎ
እኔን ሊያድን እርሱ ታመመ መስቀል ላይ ቆመ
በጁ መሀል ሰንሰለት ገባ ስለኔ አነባ

CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 4
ባደባባይ መሰከረልኝ ሞቴን ሞተልኝ
የደም ጅረት የደም ነጠብጠብ የእግዚአብሔር ጥበብ
በዚህ መንገድ ህይወት አበዛ በደሙ ገዛ
እረፍቴ ሆይ ውዴ እለዋለሁ እኔ አምንዋለሁ

CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)

VERSE 5
ያከበረኝ የዋጀኝ እርሱ ያውም በነፍሱ

CHORUS
መዳፋ ላይ ቁስል ካያችሁ
የህማም ሰው ካስተዋላችሁ
ውዴ እርሱ ነው ነፍሴን የገዛት
በእንቁ ሳይሆን በደም የገዛት (X4)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Medafa lay qusl kayachhu
Yehmam sew kastewalachhu
Wide ersu new nefsen yegezat
Beenqu sayhon bedem yegezat (X4)

VERSE 1
Qusloche lay zeyt yanore enen yemaregn
Betkeshaw yeteshekemegn chlu yanoregn
Bamts’bet min bibedlew
Ersu endew yaw new

CHORUS
Medafa lay qusl kayachhu
Yehmam sew kastewalachhu
Wide ersu new nefsen yegezat
Beenqu sayhon bedem yegezat (X4)

VERSE 2
Alt’eqorem alt’efam fitu yeabatnetu
Dewen yemiyawq tamagnu eregna leafta maytegna
Sit’ebqegn wilo yemiyadr befqr at’r
Baynoche lay endetesale ahunm ale

CHORUS
Medafa lay qusl kayachhu
Yehmam sew kastewalachhu
Wide ersu new nefsen yegezat
Beenqu sayhon bedem yegezat (X4)

VERSE 3
Egre beemnet teketatlotal libem wedotal
Yetebezhegn hiywetun t’lo maeregun t’lo
Enen liyadn ersu tameme mesqel lay qome
Beju mehel senselet geba silene aneba

CHORUS
Medafa lay qusl kayachhu
Yehmam sew kastewalachhu
Wide ersu new nefsen yegezat
Beenqu sayhon bedem yegezat (X4)

VERSE 4
Badebabay mesekerelgn moten motelgn
Yedem jiret yedem net’ebt’eb yeEgziabher t’beb
Bezih menged hiywet abeza bedemu geza
Erefte hoy wide elewalehu ene amnwalehu

CHORUS
Medafa lay qusl kayachhu
Yehmam sew kastewalachhu
Wide ersu new nefsen yegezat
Beenqu sayhon bedem yegezat (X4)

VERSE 5
Yakeberegn yewajegn ersu yawm benefsu

CHORUS
Medafa lay qusl kayachhu
Yehmam sew kastewalachhu
Wide ersu new nefsen yegezat
Beenqu sayhon bedem yegezat (X4)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'medafa-lay', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Medahanalem adanen Ethiopian (medahanalem-adanen-ethiopian)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መድኃኒዓለም አዳነን በማይሻር ቃሉ:
ደስ ይበለን(2x) እልል በሉ(2x)
አዳነን በማይሻር ቃሉ::

VERSE 1
መድኃኒዓለም አዳነን በማይሻር ቃሉ:
ደስ ይበለን(2x) እልል በሉ(2x)
አዳነን በማይሻር ቃሉ::',
      lyrics_transliteration = 'Medhanialem adanen bemayshar qalu:
Des yibelen(2x) ell belu(2x)
Adanen bemayshar qalu::

VERSE 1
Medhanialem adanen bemayshar qalu:
Des yibelen(2x) ell belu(2x)
Adanen bemayshar qalu::',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'medahanalem-adanen-ethiopian'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መድኃኒዓለም አዳነን በማይሻር ቃሉ:
ደስ ይበለን(2x) እልል በሉ(2x)
አዳነን በማይሻር ቃሉ::

VERSE 1
መድኃኒዓለም አዳነን በማይሻር ቃሉ:
ደስ ይበለን(2x) እልል በሉ(2x)
አዳነን በማይሻር ቃሉ::

CHORUS
መድኃኒዓለም አዳነን በማይሻር ቃሉ:
ደስ ይበለን(2x) እልል በሉ(2x)
አዳነን በማይሻር ቃሉ::'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Medhanialem adanen bemayshar qalu:
Des yibelen(2x) ell belu(2x)
Adanen bemayshar qalu::

VERSE 1
Medhanialem adanen bemayshar qalu:
Des yibelen(2x) ell belu(2x)
Adanen bemayshar qalu::

CHORUS
Medhanialem adanen bemayshar qalu:
Des yibelen(2x) ell belu(2x)
Adanen bemayshar qalu::'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'medahanalem-adanen-ethiopian', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Medhanealem Simeh Genana (medhanealem-simeh-genana)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መድኅኔዓለም ስምህ ገናና

VERSE 1
በሰማያት ላይ ከፍ ክፍ በል
ክብርህም በምድር ይነገራል
ዘመን የሚዋጅ አለን ምስጋና
መድኃኔዓለም ስምህ ገናና (2)

VERSE 2
መድኅኔዓለም ስምህ ገናና

VERSE 3
እልፍ አእላፍ መላእክት
ቢቆሙ ካንተ ፊት
አያርፉም ይተጋሉ
ሥሉስ ቅዱስ አያሉ

VERSE 4
ያለና የሚኖር አንተ ነህ እግዚአብሔር

VERSE 5
መድኅኔዓለም ስምህ ገናና

VERSE 6
በሰማያት ላይ ከፍ ክፍ በል
ክብርህም በምድር ይነገራል
ዘመን የሚዋጅ አለን ምስጋና
መድኃኔዓለም ስምህ ገናና (2)

VERSE 7
መድኅኔዓለም ስምህ ገናና

VERSE 8
ሊቃናት ይጮኻሉ
በጉ ድል ነሳ እያሉ
የወርቅ ጽና የያዙ
ምስጋናህን አበዙ

VERSE 9
ያለና የሚኖር አንተ ነህ እግዚአብሔር

VERSE 10
መድኅኔዓለም ስምህ ገናና

VERSE 11
በሰማያት ላይ ከፍ ክፍ በል
ክብርህም በምድር ይነገራል
ዘመን የሚዋጅ አለን ምስጋና
መድኃኔዓለም ስምህ ገናና (2)

VERSE 12
መድኅኔዓለም ስምህ ገናና

VERSE 13
በደምህ የታተሙ
ሀይልህን ተሸከሙ
የቅኔ ኡደት ሆነ
ክብርህ በአለም ገነነ

VERSE 14
ያለና የሚኖር አንተ ነህ እግዚአብሔር

VERSE 15
መድኅኔዓለም ስምህ ገናና

VERSE 16
በሰማያት ላይ ከፍ ክፍ በል
ክብርህም በምድር ይነገራል
ዘመን የሚዋጅ አለን ምስጋና
መድኃኔዓለም ስምህ ገናና (2)

VERSE 17
መድኅኔዓለም ስምህ ገናና

VERSE 18
በዙፋንህ ስር ካሉት
ከሰባቱ መናፍስት
ከታመነው ምስክር
አዲስ ውዳሴ መዝሙር

VERSE 19
ያለና የሚኖር አንተ ነህ እግዚአብሔር

VERSE 20
መድኅኔዓለም ስምህ ገናና

VERSE 21
በሰማያት ላይ ከፍ ክፍ በል
ክብርህም በምድር ይነገራል
ዘመን የሚዋጅ አለን ምስጋና
መድኃኔዓለም ስምህ ገናና (2)

VERSE 22
መድኅኔዓለም ስምህ ገናና',
      lyrics_transliteration = 'Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 1
Medhanealem simeh genana (2)
Ilf a''elaf mela''ikt
Bi-qomu kante fit

VERSE 2
Ayarfum yitegalu
Medhanealem simeh genana
Be-semayat lay kef kef bel

VERSE 3
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana
Sillus Qidus iyalu

VERSE 4
Yalena yiminor ante neh Igziabher
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral

VERSE 5
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 6
Zemen yemiyewaj alen misgana
Medhanealem simeh genana (2)
Liqanat yichohalu

VERSE 7
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral

VERSE 8
Zemen yemiyewaj alen misgana
Begu dil nesa iyalu
Yewerq tsina yayazu

VERSE 9
Misganahin abezu
Yalena yiminor ante neh Igziabher
Medhanealem simeh genana

VERSE 10
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 11
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana
Medhanealem simeh genana (2)

VERSE 12
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral

VERSE 13
Zemen yemiyewaj alen misgana
Be-demih yetatemu
Haylihin teshekemu

VERSE 14
Yeqine udet hone
Medhanealem simeh genana
Be-semayat lay kef kef bel

VERSE 15
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana
Kibreh be-alem genene

VERSE 16
Yalena yiminor ante neh Igziabher
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral

VERSE 17
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 18
Zemen yemiyewaj alen misgana
Medhanealem simeh genana (2)
Be-zufanih sir kalut

VERSE 19
Kesebatu menafist
Medhanealem simeh genana
Be-semayat lay kef kef bel

VERSE 20
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana
Ketamenew misikir

VERSE 21
Addis widase mezmur
Yalena yiminor ante neh Igziabher
Medhanealem simeh genana

VERSE 22
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'medhanealem-simeh-genana'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 1
በሰማያት ላይ ከፍ ክፍ በል
ክብርህም በምድር ይነገራል
ዘመን የሚዋጅ አለን ምስጋና
መድኃኔዓለም ስምህ ገናና (2)

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 2
መድኅኔዓለም ስምህ ገናና

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 3
እልፍ አእላፍ መላእክት
ቢቆሙ ካንተ ፊት
አያርፉም ይተጋሉ
ሥሉስ ቅዱስ አያሉ

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 4
ያለና የሚኖር አንተ ነህ እግዚአብሔር

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 5
መድኅኔዓለም ስምህ ገናና

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 6
በሰማያት ላይ ከፍ ክፍ በል
ክብርህም በምድር ይነገራል
ዘመን የሚዋጅ አለን ምስጋና
መድኃኔዓለም ስምህ ገናና (2)

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 7
መድኅኔዓለም ስምህ ገናና

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 8
ሊቃናት ይጮኻሉ
በጉ ድል ነሳ እያሉ
የወርቅ ጽና የያዙ
ምስጋናህን አበዙ

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 9
ያለና የሚኖር አንተ ነህ እግዚአብሔር

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 10
መድኅኔዓለም ስምህ ገናና

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 11
በሰማያት ላይ ከፍ ክፍ በል
ክብርህም በምድር ይነገራል
ዘመን የሚዋጅ አለን ምስጋና
መድኃኔዓለም ስምህ ገናና (2)

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 12
መድኅኔዓለም ስምህ ገናና

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 13
በደምህ የታተሙ
ሀይልህን ተሸከሙ
የቅኔ ኡደት ሆነ
ክብርህ በአለም ገነነ

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 14
ያለና የሚኖር አንተ ነህ እግዚአብሔር

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 15
መድኅኔዓለም ስምህ ገናና

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 16
በሰማያት ላይ ከፍ ክፍ በል
ክብርህም በምድር ይነገራል
ዘመን የሚዋጅ አለን ምስጋና
መድኃኔዓለም ስምህ ገናና (2)

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 17
መድኅኔዓለም ስምህ ገናና

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 18
በዙፋንህ ስር ካሉት
ከሰባቱ መናፍስት
ከታመነው ምስክር
አዲስ ውዳሴ መዝሙር

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 19
ያለና የሚኖር አንተ ነህ እግዚአብሔር

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 20
መድኅኔዓለም ስምህ ገናና

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 21
በሰማያት ላይ ከፍ ክፍ በል
ክብርህም በምድር ይነገራል
ዘመን የሚዋጅ አለን ምስጋና
መድኃኔዓለም ስምህ ገናና (2)

CHORUS
መድኅኔዓለም ስምህ ገናና

VERSE 22
መድኅኔዓለም ስምህ ገናና

CHORUS
መድኅኔዓለም ስምህ ገናና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 1
Medhanealem simeh genana (2)
Ilf a''elaf mela''ikt
Bi-qomu kante fit

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 2
Ayarfum yitegalu
Medhanealem simeh genana
Be-semayat lay kef kef bel

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 3
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana
Sillus Qidus iyalu

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 4
Yalena yiminor ante neh Igziabher
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 5
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 6
Zemen yemiyewaj alen misgana
Medhanealem simeh genana (2)
Liqanat yichohalu

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 7
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 8
Zemen yemiyewaj alen misgana
Begu dil nesa iyalu
Yewerq tsina yayazu

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 9
Misganahin abezu
Yalena yiminor ante neh Igziabher
Medhanealem simeh genana

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 10
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 11
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana
Medhanealem simeh genana (2)

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 12
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 13
Zemen yemiyewaj alen misgana
Be-demih yetatemu
Haylihin teshekemu

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 14
Yeqine udet hone
Medhanealem simeh genana
Be-semayat lay kef kef bel

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 15
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana
Kibreh be-alem genene

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 16
Yalena yiminor ante neh Igziabher
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 17
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 18
Zemen yemiyewaj alen misgana
Medhanealem simeh genana (2)
Be-zufanih sir kalut

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 19
Kesebatu menafist
Medhanealem simeh genana
Be-semayat lay kef kef bel

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 20
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana
Ketamenew misikir

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 21
Addis widase mezmur
Yalena yiminor ante neh Igziabher
Medhanealem simeh genana

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

VERSE 22
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana

CHORUS
Medhanealem simeh genana
Be-semayat lay kef kef bel
Kibrehim be-midir yinegeral
Zemen yemiyewaj alen misgana'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'medhanealem-simeh-genana', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: media (media-1839)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'የሚጠብቀኝ አይተኛም/2/
አያንቀላፋም
++++++
ቤት ባይኖረኝም እደጅ ባድርም

VERSE 1
ቀን እና ለሊት ከኔ አይርቅም
ድምጸ አራዊት የለሊት ግርማ
ወደኔ አይቀርብም ድምጽህ ሲሰማ

VERSE 2
መሰናክልን ለእግሮቼ አይሰጥም
ይሰውረኛል በቀኙ ሰላም
ፀሐይም በቀን አይተኩሰኝም
የአጋንንትም ሀይል አያስፈራኝም

VERSE 3
ነፍሴን ጠበቃት ከጠላት ወጥመድ
ጌታዬ መራኝ በጽድቅ መንገድ
መውጣት መግባቴን እየጠበቀ
ለዚህ አበቃኝ እርሱ ባወቀ

VERSE 4
የሰማዩን ጠል እታገሳለው
ሰው ከጨከነ ምን እሆናለው
ለሊት በድብቅ ለሚጎበኙኝ
ለጻድቃኑ ክብር አምላክ ይስጥልኝ

VERSE 5
እንቅልፌን ባርኮ ለሰጠኝ የጌታ
በአለም ሀሳብ ሳልንገላታ
የእለት ምግቤንም ላልነሳኝ ፍጹም
ምስጋና ላቅርብ እስከ ዘለዓለም',
      lyrics_transliteration = 'Yemit’ebqegn aytegnam (2)
Ayanqelafam
++++++
Bet baynoregnm edej badrm

VERSE 1
Qen ena lelit kene ayrqm
Dimts’e arawit yelelit girma
Wedene ayqerbm dimts’h sisema

VERSE 2
Mesenakln leegroche ayset’m
Yisewregnal beqegnu selam
Ts’eheym beqen aytekusegnm
Yeaganntm heyl ayasferagnm

VERSE 3
Nefsen t’ebeqat ket’elat wet’med
Getaye meragn bets’dq menged
Mewt’at megbaten eyet’ebeqe
Lezih abeqagn ersu baweqe

VERSE 4
Yesemayun t’el etagesalew
Sew kech’ekene min ehonalew
Lelit bedbq lemigobegnugn
Lets’adqanu kibir amlak yist’lgn

VERSE 5
Enqlfen barko leset’egn yegeta
Bealem hesab salngelata
Yeelet migbenm lalnesagn fits’um
Misgana laqrb eske zelealem',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'media-1839'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የሚጠብቀኝ አይተኛም/2/
አያንቀላፋም
++++++
ቤት ባይኖረኝም እደጅ ባድርም

VERSE 1
ቀን እና ለሊት ከኔ አይርቅም
ድምጸ አራዊት የለሊት ግርማ
ወደኔ አይቀርብም ድምጽህ ሲሰማ

CHORUS
የሚጠብቀኝ አይተኛም/2/
አያንቀላፋም
++++++
ቤት ባይኖረኝም እደጅ ባድርም

VERSE 2
መሰናክልን ለእግሮቼ አይሰጥም
ይሰውረኛል በቀኙ ሰላም
ፀሐይም በቀን አይተኩሰኝም
የአጋንንትም ሀይል አያስፈራኝም

CHORUS
የሚጠብቀኝ አይተኛም/2/
አያንቀላፋም
++++++
ቤት ባይኖረኝም እደጅ ባድርም

VERSE 3
ነፍሴን ጠበቃት ከጠላት ወጥመድ
ጌታዬ መራኝ በጽድቅ መንገድ
መውጣት መግባቴን እየጠበቀ
ለዚህ አበቃኝ እርሱ ባወቀ

CHORUS
የሚጠብቀኝ አይተኛም/2/
አያንቀላፋም
++++++
ቤት ባይኖረኝም እደጅ ባድርም

VERSE 4
የሰማዩን ጠል እታገሳለው
ሰው ከጨከነ ምን እሆናለው
ለሊት በድብቅ ለሚጎበኙኝ
ለጻድቃኑ ክብር አምላክ ይስጥልኝ

CHORUS
የሚጠብቀኝ አይተኛም/2/
አያንቀላፋም
++++++
ቤት ባይኖረኝም እደጅ ባድርም

VERSE 5
እንቅልፌን ባርኮ ለሰጠኝ የጌታ
በአለም ሀሳብ ሳልንገላታ
የእለት ምግቤንም ላልነሳኝ ፍጹም
ምስጋና ላቅርብ እስከ ዘለዓለም

CHORUS
የሚጠብቀኝ አይተኛም/2/
አያንቀላፋም
++++++
ቤት ባይኖረኝም እደጅ ባድርም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yemit’ebqegn aytegnam (2)
Ayanqelafam
++++++
Bet baynoregnm edej badrm

VERSE 1
Qen ena lelit kene ayrqm
Dimts’e arawit yelelit girma
Wedene ayqerbm dimts’h sisema

CHORUS
Yemit’ebqegn aytegnam (2)
Ayanqelafam
++++++
Bet baynoregnm edej badrm

VERSE 2
Mesenakln leegroche ayset’m
Yisewregnal beqegnu selam
Ts’eheym beqen aytekusegnm
Yeaganntm heyl ayasferagnm

CHORUS
Yemit’ebqegn aytegnam (2)
Ayanqelafam
++++++
Bet baynoregnm edej badrm

VERSE 3
Nefsen t’ebeqat ket’elat wet’med
Getaye meragn bets’dq menged
Mewt’at megbaten eyet’ebeqe
Lezih abeqagn ersu baweqe

CHORUS
Yemit’ebqegn aytegnam (2)
Ayanqelafam
++++++
Bet baynoregnm edej badrm

VERSE 4
Yesemayun t’el etagesalew
Sew kech’ekene min ehonalew
Lelit bedbq lemigobegnugn
Lets’adqanu kibir amlak yist’lgn

CHORUS
Yemit’ebqegn aytegnam (2)
Ayanqelafam
++++++
Bet baynoregnm edej badrm

VERSE 5
Enqlfen barko leset’egn yegeta
Bealem hesab salngelata
Yeelet migbenm lalnesagn fits’um
Misgana laqrb eske zelealem

CHORUS
Yemit’ebqegn aytegnam (2)
Ayanqelafam
++++++
Bet baynoregnm edej badrm'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'media-1839', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Medihanealem (medihanealem-789)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 1
" አዝማች "
አልቅሼ ነገርኩህ በሀዘን ደክሜ
አብዝቼ ጠራሁህ ከመቅደስህ ቆሜ
አዘነበልክልኝ ቃሌን መቼ አለፍከው

VERSE 2
አይዞሽ ልጄ ብለህ እንባዬን አበስከው
" አዝማች"
ከፊት እየቀደምክ መንገድ የምትመራ
ብርሐን የሆንክልን በመስቀልህ ስራ

VERSE 3
እውነተኛ መድህን የሒወት እንጀራ
የሁሉ አስገኚ ግሩም የሱ ስራ
" አዝማች "
ያላለፍኩት የለም አንተን ተጠግቼ

VERSE 4
መጽናቴ በአንተ ነው ስምህን ጠርቼ
የበረከቴ ምንጭ የጎጆዬ ሙላት
ለደከመች ነፍሴ ማረፊያ ሆንክላት
" አዝማች "

VERSE 5
ዳግም ልጅ ተባልኩ በደሌን ሻርክልኝ
በከበረው ደምህ ባሪያህን ገዛህኝ
ሳወድስህ ልኑር ዘወትር በዝማሬ
መድኃኒአለም ሆንከኝ ሞገስና ክብሬ',
      lyrics_transliteration = 'Medhahenialem ante man yimeslal
Yekebeden besmh yiqelal
Yemachlew yelem yemisanh neger
Qelayat ayts’enum ante sitnager

VERSE 1
" azmach "
Alqshe negerkuh behezen dekme
Abzche t’erahuh kemeqdesh qome
Azenebelklgn qalen meche alefkew

VERSE 2
Ayzosh lije bileh enbayen abeskew
" azmach"
Kefit eyeqedemk menged yemtmera
Birhen yehonkln bemesqelh sira

VERSE 3
Ewnetegna medhn yehiwet enjera
Yehulu asgegni girum yesu sira
" azmach "
Yalalefkut yelem anten tet’egche

VERSE 4
Mets’nate beante new simhn t’erche
Yeberekete minch’ yegojoye mulat
Ledekemech nefse marefiya honklat
" azmach "

VERSE 5
Dagm lij tebalku bedelen sharklgn
Bekeberew demh bariyahn gezahgn
Sawedsh linur zewetr bezmare
Medhanialem honkegn mogesna kibre',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'medihanealem-789'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 1
" አዝማች "
አልቅሼ ነገርኩህ በሀዘን ደክሜ
አብዝቼ ጠራሁህ ከመቅደስህ ቆሜ
አዘነበልክልኝ ቃሌን መቼ አለፍከው

CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 2
አይዞሽ ልጄ ብለህ እንባዬን አበስከው
" አዝማች"
ከፊት እየቀደምክ መንገድ የምትመራ
ብርሐን የሆንክልን በመስቀልህ ስራ

CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 3
እውነተኛ መድህን የሒወት እንጀራ
የሁሉ አስገኚ ግሩም የሱ ስራ
" አዝማች "
ያላለፍኩት የለም አንተን ተጠግቼ

CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 4
መጽናቴ በአንተ ነው ስምህን ጠርቼ
የበረከቴ ምንጭ የጎጆዬ ሙላት
ለደከመች ነፍሴ ማረፊያ ሆንክላት
" አዝማች "

CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር

VERSE 5
ዳግም ልጅ ተባልኩ በደሌን ሻርክልኝ
በከበረው ደምህ ባሪያህን ገዛህኝ
ሳወድስህ ልኑር ዘወትር በዝማሬ
መድኃኒአለም ሆንከኝ ሞገስና ክብሬ

CHORUS
መድኃሐኒአለም አንተ ማን ይመስላል
የከበደን በስምህ ይቀላል
የማችለው የለም የሚሳንህ ነገር
ቀላያት አይፀኑም አንተ ስትናገር'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Medhahenialem ante man yimeslal
Yekebeden besmh yiqelal
Yemachlew yelem yemisanh neger
Qelayat ayts’enum ante sitnager

VERSE 1
" azmach "
Alqshe negerkuh behezen dekme
Abzche t’erahuh kemeqdesh qome
Azenebelklgn qalen meche alefkew

CHORUS
Medhahenialem ante man yimeslal
Yekebeden besmh yiqelal
Yemachlew yelem yemisanh neger
Qelayat ayts’enum ante sitnager

VERSE 2
Ayzosh lije bileh enbayen abeskew
" azmach"
Kefit eyeqedemk menged yemtmera
Birhen yehonkln bemesqelh sira

CHORUS
Medhahenialem ante man yimeslal
Yekebeden besmh yiqelal
Yemachlew yelem yemisanh neger
Qelayat ayts’enum ante sitnager

VERSE 3
Ewnetegna medhn yehiwet enjera
Yehulu asgegni girum yesu sira
" azmach "
Yalalefkut yelem anten tet’egche

CHORUS
Medhahenialem ante man yimeslal
Yekebeden besmh yiqelal
Yemachlew yelem yemisanh neger
Qelayat ayts’enum ante sitnager

VERSE 4
Mets’nate beante new simhn t’erche
Yeberekete minch’ yegojoye mulat
Ledekemech nefse marefiya honklat
" azmach "

CHORUS
Medhahenialem ante man yimeslal
Yekebeden besmh yiqelal
Yemachlew yelem yemisanh neger
Qelayat ayts’enum ante sitnager

VERSE 5
Dagm lij tebalku bedelen sharklgn
Bekeberew demh bariyahn gezahgn
Sawedsh linur zewetr bezmare
Medhanialem honkegn mogesna kibre

CHORUS
Medhahenialem ante man yimeslal
Yekebeden besmh yiqelal
Yemachlew yelem yemisanh neger
Qelayat ayts’enum ante sitnager'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'medihanealem-789', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Medihanealem Yelem Yemisanew (medihanealem-yelem-yemisanew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው

VERSE 1
አላስብም ነበር አልፈዋለሁ ብዬ
ጉንጭ አልፎ ትራሴን እያጠበ እንባዬን
እየተፈጸመ ኃይሉ በድካሜ
ማእበሉን አለፍኩኝ ቀለለልኝ ሸክሜ

VERSE 2
የቤቴ እራስ ነው የእቅዴ መሪ
በክፉም በደጉም ነፍሴን አስተማሪ
ፈጥሮ የማይረሳኝ ቤዛዬ ደረሰ
ቤቴን ደስታ ሞላው እንባዬ ታበሰ

VERSE 3
ትናንት ባዶ ነበር የለኝ የሚሰፈር
አንዳች አልነበረኝ ሚታይ የሚቆጠር
ከርሱ የተነሳ ዛሬ ግን ሙሉ ነኝ
ክብር ለእርሱ ይሁን አለ የማይተወኝ

VERSE 4
እየከለከለ ለእኔ ማይጠቅመኝን
በጊዜ እየሰጠ ደግሞ የሚረባኝን
ሁሉ በእርሱ ሆኗል አልሆነም ያለ እርሱ
ውዳሴ ምስጋና ይድረስ ለንጉሱ',
      lyrics_transliteration = 'Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew

VERSE 1
Alasbm neber alfewalehu biye
Gunch’ alfo tirasen eyat’ebe enbayen
Eyetefets’eme haylu bedkame
Maebelun alefkugn qelelelgn shekme

VERSE 2
Yebete eras new yeeqde meri
Bekfum bedegum nefsen astemari
Fet’ro yemayresagn bezaye derese
Beten desta molaw enbaye tabese

VERSE 3
Tinant bado neber yelegn yemisefer
Andach alneberegn mitay yemiqot’er
Kersu yetenesa zare gin mulu negn
Kibir leersu yihun ale yemaytewegn

VERSE 4
Eyekelekele leene mayt’eqmegnn
Begize eyeset’e degmo yemirebagnn
Hulu beersu honwal alhonem yale ersu
Widase misgana yidres lengusu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'medihanealem-yelem-yemisanew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው

VERSE 1
አላስብም ነበር አልፈዋለሁ ብዬ
ጉንጭ አልፎ ትራሴን እያጠበ እንባዬን
እየተፈጸመ ኃይሉ በድካሜ
ማእበሉን አለፍኩኝ ቀለለልኝ ሸክሜ

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው

VERSE 2
የቤቴ እራስ ነው የእቅዴ መሪ
በክፉም በደጉም ነፍሴን አስተማሪ
ፈጥሮ የማይረሳኝ ቤዛዬ ደረሰ
ቤቴን ደስታ ሞላው እንባዬ ታበሰ

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው

VERSE 3
ትናንት ባዶ ነበር የለኝ የሚሰፈር
አንዳች አልነበረኝ ሚታይ የሚቆጠር
ከርሱ የተነሳ ዛሬ ግን ሙሉ ነኝ
ክብር ለእርሱ ይሁን አለ የማይተወኝ

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው

VERSE 4
እየከለከለ ለእኔ ማይጠቅመኝን
በጊዜ እየሰጠ ደግሞ የሚረባኝን
ሁሉ በእርሱ ሆኗል አልሆነም ያለ እርሱ
ውዳሴ ምስጋና ይድረስ ለንጉሱ

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew

VERSE 1
Alasbm neber alfewalehu biye
Gunch’ alfo tirasen eyat’ebe enbayen
Eyetefets’eme haylu bedkame
Maebelun alefkugn qelelelgn shekme

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew

VERSE 2
Yebete eras new yeeqde meri
Bekfum bedegum nefsen astemari
Fet’ro yemayresagn bezaye derese
Beten desta molaw enbaye tabese

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew

VERSE 3
Tinant bado neber yelegn yemisefer
Andach alneberegn mitay yemiqot’er
Kersu yetenesa zare gin mulu negn
Kibir leersu yihun ale yemaytewegn

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew

VERSE 4
Eyekelekele leene mayt’eqmegnn
Begize eyeset’e degmo yemirebagnn
Hulu beersu honwal alhonem yale ersu
Widase misgana yidres lengusu

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'medihanealem-yelem-yemisanew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Medihanit Neh Anite (medihanit-neh-anite)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 1
ከስም ሁሉ በላይ ስምህስ ልዩ ነው
ከሰማያት በላይ እንድንድንበት
ተሰጠን ይኸ ስም እንድናምንበት
ማዕበሉን ያቆመ ባህር የከፈለው

VERSE 2
የአምላካችን ስሙ የፀና ግንብ ነው
ለፍርድ ቢያቆሙንም በሸንጓቸው ከሰው
እንዳታስተምሩ በኢሱስ ስም ብለው
አይሁድን ሳንፈራ ሰበክነው በአዋጅ

VERSE 3
ስለተገለጠ አለሙን ሊዋጅ
ከሰው ይልቅ ለአምላክ ይገባል መታዘዝ
እንዴት እንኖራለን ቅዱሱን ስም ሳንይዝ
ሞት ነው ወይስ እርሃብ

VERSE 4
ስደት ወይ መከራ
እኛን የሚያዘገይ ስሙን እንዳንጠራ
ሽባውን ተርተርነን እውር ያበራነው
ጎባጣን አቅንተን ድንቅን ያደረግነው

VERSE 5
በእርሱ ስም ሰብከን ነው
በእርሱ ስም ተማፅነን
አልጫውን ዓለም በወንጌል ያጣፈጥን
የሚመጣው ቢሆን ያለውም ቢሆን

VERSE 6
ሊያቆመን አይችልም ከእርሱ ሊለየን
ከመከራ ስጋ ከመከራ ነፍስ
ስሙ ነው መድሃኒት
ስሙ እኮ ነው ፈውስ',
      lyrics_transliteration = 'Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new

VERSE 1
Kesm hulu belay simhs liyu new
Kesemayat belay endndnbet
Teset’en yiኸ sim endnamnbet
Maebelun yaqome bahr yekefelew

VERSE 2
Yeamlakachn simu yets’ena ginb new
Lefrd biyaqomunm beshengwachew kesew
Endatastemru beisus sim bilew
Ayhudn sanfera sebeknew beawaj

VERSE 3
Siletegelet’e alemun liwaj
Kesew yilq leamlak yigebal metazez
Endet ennoralen qidusun sim sanyz
Mot new weys erhab

VERSE 4
Sidet wey mekera
Egnan yemiyazegey simun endant’era
Shbawn terternen ewr yaberanew
Gobat’an aqnten dinqn yaderegnew

VERSE 5
Beersu sim sebken new
Beersu sim temats’nen
Alch’awn alem bewengel yat’afet’n
Yemimet’aw bihon yalewm bihon

VERSE 6
Liyaqomen aychlm keersu lileyen
Kemekera siga kemekera nefs
Simu new medhanit
Simu eko new fews',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'medihanit-neh-anite'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 1
ከስም ሁሉ በላይ ስምህስ ልዩ ነው
ከሰማያት በላይ እንድንድንበት
ተሰጠን ይኸ ስም እንድናምንበት
ማዕበሉን ያቆመ ባህር የከፈለው

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 2
የአምላካችን ስሙ የፀና ግንብ ነው
ለፍርድ ቢያቆሙንም በሸንጓቸው ከሰው
እንዳታስተምሩ በኢሱስ ስም ብለው
አይሁድን ሳንፈራ ሰበክነው በአዋጅ

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 3
ስለተገለጠ አለሙን ሊዋጅ
ከሰው ይልቅ ለአምላክ ይገባል መታዘዝ
እንዴት እንኖራለን ቅዱሱን ስም ሳንይዝ
ሞት ነው ወይስ እርሃብ

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 4
ስደት ወይ መከራ
እኛን የሚያዘገይ ስሙን እንዳንጠራ
ሽባውን ተርተርነን እውር ያበራነው
ጎባጣን አቅንተን ድንቅን ያደረግነው

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 5
በእርሱ ስም ሰብከን ነው
በእርሱ ስም ተማፅነን
አልጫውን ዓለም በወንጌል ያጣፈጥን
የሚመጣው ቢሆን ያለውም ቢሆን

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው

VERSE 6
ሊያቆመን አይችልም ከእርሱ ሊለየን
ከመከራ ስጋ ከመከራ ነፍስ
ስሙ ነው መድሃኒት
ስሙ እኮ ነው ፈውስ

CHORUS
መድሃኒት ነህና በስጋ በነፍስ
እንጠራለን ብለን ኢየሱስ
ጥዑመ ስም ያልነው
ስለጣፈጠን ነው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new

VERSE 1
Kesm hulu belay simhs liyu new
Kesemayat belay endndnbet
Teset’en yiኸ sim endnamnbet
Maebelun yaqome bahr yekefelew

CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new

VERSE 2
Yeamlakachn simu yets’ena ginb new
Lefrd biyaqomunm beshengwachew kesew
Endatastemru beisus sim bilew
Ayhudn sanfera sebeknew beawaj

CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new

VERSE 3
Siletegelet’e alemun liwaj
Kesew yilq leamlak yigebal metazez
Endet ennoralen qidusun sim sanyz
Mot new weys erhab

CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new

VERSE 4
Sidet wey mekera
Egnan yemiyazegey simun endant’era
Shbawn terternen ewr yaberanew
Gobat’an aqnten dinqn yaderegnew

CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new

VERSE 5
Beersu sim sebken new
Beersu sim temats’nen
Alch’awn alem bewengel yat’afet’n
Yemimet’aw bihon yalewm bihon

CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new

VERSE 6
Liyaqomen aychlm keersu lileyen
Kemekera siga kemekera nefs
Simu new medhanit
Simu eko new fews

CHORUS
Medhanit nehna besga benefs
Ent’eralen bilen Iyesus
T’ume sim yalnew
Silet’afet’en new'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'medihanit-neh-anite', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mekeraw Kirisitinayen Atafetew (mekeraw-kirisitinayen-atafetew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መከራው ክርስትናዬን አጣፈጠው
ስደቱ ማህተቤን አጠበቀው
በሞት መንደር በሃዘን ውስጥ በመከራ
አየሁት እግዚአብሄርን ከእኔ ጋራ

VERSE 1
ክርስቲያን ተብለን በክርስቶስ ስም የተጠራነው
በጥልቁ ውስጥም በእግዚአብሄር እንድናምን ነው
ለጥቂት ጊዜ ቢበረታብን ስደት ሃዘኑ
አምላካችን ግን መውጫ ያዘጋጃል በዚህ ተፅናኑ

VERSE 2
በስደት ሳለን ከአፋችን ቢደርቅ የፅዮን ዜማ
ከወንዙ አጠገብ ቁጭ ብለን ሳለን ድምፁን ሳንሰማ
በእግዚአብሄር ጊዜ ከባቢሎን ምድር እንለቃለን
መሰንቆአችንን ከ አርያ ዛፍ ላይ እናወርዳለን

VERSE 3
ደካሞች ስንሆን በስሙ ያን ጊዜ እንበረታለን
ድሆች ስንባል ባለፀጎችም እናደርጋለን
በምድር ካሉ ቅዱስ ህዝብ አድርጎ ለእርስቱ ለየን
ጨለማው አልፎ በቸርነቱ ብርሃን አሳየን

VERSE 4
ከፀጋ በላይ እንዳንፈተን ይከልለናል
በቁስላችን ላይ የፈውሱን ዘይት ያፈስልናል
በጊዜውም ቢሆን ያለጊዜውም በእርሱ እንፅና
እንካን ስደቱን ሞቱን ሊረታው ይችላልና',
      lyrics_transliteration = 'Mekeraw kirstnayen at’afet’ew
Sidetu mahteben at’ebeqew
Bemot mender behazen wist’ bemekera
Ayehut egziabhern keene gara

VERSE 1
Kirstiyan teblen beKristos sim yetet’eranew
Bet’lqu wist’m beegziabher endnamn new
Let’qit gize biberetabn sidet hazenu
Amlakachn gin mewch’a yazegajal bezih tets’nanu

VERSE 2
Besdet salen keafachn biderq yets’yon zema
Kewenzu at’egeb quch’ bilen salen dimts’un sansema
Beegziabher gize kebabilon midr enleqalen
Mesenqoachnn ke arya zaf lay enawerdalen

VERSE 3
Dekamoch sinhon besmu yan gize enberetalen
Dihoch sinbal balets’egochm enadergalen
Bemdr kalu Kidus hizb adrgo leerstu leyen
Ch’elemaw alfo bechernetu birhan asayen

VERSE 4
Kets’ega belay endanfeten yikellenal
Bequslachn lay yefewsun zeyt yafeslnal
Begizewm bihon yalegizewm beersu ents’na
Enkan sidetun motun liretaw yichlalna',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mekeraw-kirisitinayen-atafetew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መከራው ክርስትናዬን አጣፈጠው
ስደቱ ማህተቤን አጠበቀው
በሞት መንደር በሃዘን ውስጥ በመከራ
አየሁት እግዚአብሄርን ከእኔ ጋራ

VERSE 1
ክርስቲያን ተብለን በክርስቶስ ስም የተጠራነው
በጥልቁ ውስጥም በእግዚአብሄር እንድናምን ነው
ለጥቂት ጊዜ ቢበረታብን ስደት ሃዘኑ
አምላካችን ግን መውጫ ያዘጋጃል በዚህ ተፅናኑ

CHORUS
መከራው ክርስትናዬን አጣፈጠው
ስደቱ ማህተቤን አጠበቀው
በሞት መንደር በሃዘን ውስጥ በመከራ
አየሁት እግዚአብሄርን ከእኔ ጋራ

VERSE 2
በስደት ሳለን ከአፋችን ቢደርቅ የፅዮን ዜማ
ከወንዙ አጠገብ ቁጭ ብለን ሳለን ድምፁን ሳንሰማ
በእግዚአብሄር ጊዜ ከባቢሎን ምድር እንለቃለን
መሰንቆአችንን ከ አርያ ዛፍ ላይ እናወርዳለን

CHORUS
መከራው ክርስትናዬን አጣፈጠው
ስደቱ ማህተቤን አጠበቀው
በሞት መንደር በሃዘን ውስጥ በመከራ
አየሁት እግዚአብሄርን ከእኔ ጋራ

VERSE 3
ደካሞች ስንሆን በስሙ ያን ጊዜ እንበረታለን
ድሆች ስንባል ባለፀጎችም እናደርጋለን
በምድር ካሉ ቅዱስ ህዝብ አድርጎ ለእርስቱ ለየን
ጨለማው አልፎ በቸርነቱ ብርሃን አሳየን

CHORUS
መከራው ክርስትናዬን አጣፈጠው
ስደቱ ማህተቤን አጠበቀው
በሞት መንደር በሃዘን ውስጥ በመከራ
አየሁት እግዚአብሄርን ከእኔ ጋራ

VERSE 4
ከፀጋ በላይ እንዳንፈተን ይከልለናል
በቁስላችን ላይ የፈውሱን ዘይት ያፈስልናል
በጊዜውም ቢሆን ያለጊዜውም በእርሱ እንፅና
እንካን ስደቱን ሞቱን ሊረታው ይችላልና

CHORUS
መከራው ክርስትናዬን አጣፈጠው
ስደቱ ማህተቤን አጠበቀው
በሞት መንደር በሃዘን ውስጥ በመከራ
አየሁት እግዚአብሄርን ከእኔ ጋራ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mekeraw kirstnayen at’afet’ew
Sidetu mahteben at’ebeqew
Bemot mender behazen wist’ bemekera
Ayehut egziabhern keene gara

VERSE 1
Kirstiyan teblen beKristos sim yetet’eranew
Bet’lqu wist’m beegziabher endnamn new
Let’qit gize biberetabn sidet hazenu
Amlakachn gin mewch’a yazegajal bezih tets’nanu

CHORUS
Mekeraw kirstnayen at’afet’ew
Sidetu mahteben at’ebeqew
Bemot mender behazen wist’ bemekera
Ayehut egziabhern keene gara

VERSE 2
Besdet salen keafachn biderq yets’yon zema
Kewenzu at’egeb quch’ bilen salen dimts’un sansema
Beegziabher gize kebabilon midr enleqalen
Mesenqoachnn ke arya zaf lay enawerdalen

CHORUS
Mekeraw kirstnayen at’afet’ew
Sidetu mahteben at’ebeqew
Bemot mender behazen wist’ bemekera
Ayehut egziabhern keene gara

VERSE 3
Dekamoch sinhon besmu yan gize enberetalen
Dihoch sinbal balets’egochm enadergalen
Bemdr kalu Kidus hizb adrgo leerstu leyen
Ch’elemaw alfo bechernetu birhan asayen

CHORUS
Mekeraw kirstnayen at’afet’ew
Sidetu mahteben at’ebeqew
Bemot mender behazen wist’ bemekera
Ayehut egziabhern keene gara

VERSE 4
Kets’ega belay endanfeten yikellenal
Bequslachn lay yefewsun zeyt yafeslnal
Begizewm bihon yalegizewm beersu ents’na
Enkan sidetun motun liretaw yichlalna

CHORUS
Mekeraw kirstnayen at’afet’ew
Sidetu mahteben at’ebeqew
Bemot mender behazen wist’ bemekera
Ayehut egziabhern keene gara'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mekeraw-kirisitinayen-atafetew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mekifel Yemalichilew Alebign Wileta (mekifel-yemalichilew-alebign-wileta)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 1
በዘመኔ ሁሉ የደገፍከኝ በእጆችህ
ጌታ ዘርዝሬ ኣልጨርሰው ውለታህ
ምስኪን ባርያ ለውለታህ ኣሁን ምን እከፍላለው
ሌላ ኣትሻም ኣንተ የኣቅሜን ይሄው ኣመሰግናሃለው

VERSE 2
ስናቅ እንዳልነበር እኔ በሰዎች ተጥዬ
ከውድቀቴ ኣንስተህ ሰው ኣረከኝ ቸር ጌታዬ
ነብሴ ለውለታህ በምስጋና ተሞልታለች
ጥዋት ማታ ስምክን እያነሳች ታመሰግናለች

VERSE 3
ነብሴ መሸሸግያ ኣጥታ ኣንተ ስላየሃት
ከለምለም መስክ ወስደህ ጌታ ኣሳረፍካት
የከበዳት ሸክም ቀሎ ባንተ ረፍት ኣገኘች
ይኸው በሰዎች ፊት ያንተን ክብር ትመሰክራለች

VERSE 4
ኣይቸኩልም እግዚአብሔር ለርሱ ኣለው ጊዜ
ሲጠሩት ይሰማል ፈጣኖ ያወጣል ከትካዜ
የፅድቅንም መንገድ እያሳየ ይመራናል
ወደ ህይወት መንገድ እረኛችን ወስዶ ያሳርፈናል

VERSE 5
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይቺው ነች ኣቅሜ ለስጦታ (2)',
      lyrics_transliteration = 'Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichw nech aqme lest’ota (2)

VERSE 1
Bezemene hulu yedegefkegn beejochh
Geta zerzre alch’ersew wiletah
Miskin barya lewletah ahun min ekeflalew
Lela atsham ante yeaqmen yihew amesegnahalew

VERSE 2
Sinaq endalneber ene besewoch tet’ye
Kewdqete ansteh sew arekegn cher Getaye
Nebse lewletah bemsgana temoltalech
T’wat mata simkn eyanesach tamesegnalech

VERSE 3
Nebse mesheshegya at’ta ante silayehat
Kelemlem mesk wesdeh Geta asarefkat
Yekebedat shekm qelo bante reft agegnech
Yiኸw besewoch fit yanten kibir timesekralech

VERSE 4
Aychekulm Egziabher lersu alew gize
Sit’erut yisemal fet’ano yawet’al ketkaze
Yets’dqnm menged eyasaye yimeranal
Wede hiywet menged eregnachn wesdo yasarfenal

VERSE 5
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichiw nech aqme lest’ota (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mekifel-yemalichilew-alebign-wileta'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 1
በዘመኔ ሁሉ የደገፍከኝ በእጆችህ
ጌታ ዘርዝሬ ኣልጨርሰው ውለታህ
ምስኪን ባርያ ለውለታህ ኣሁን ምን እከፍላለው
ሌላ ኣትሻም ኣንተ የኣቅሜን ይሄው ኣመሰግናሃለው

CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 2
ስናቅ እንዳልነበር እኔ በሰዎች ተጥዬ
ከውድቀቴ ኣንስተህ ሰው ኣረከኝ ቸር ጌታዬ
ነብሴ ለውለታህ በምስጋና ተሞልታለች
ጥዋት ማታ ስምክን እያነሳች ታመሰግናለች

CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 3
ነብሴ መሸሸግያ ኣጥታ ኣንተ ስላየሃት
ከለምለም መስክ ወስደህ ጌታ ኣሳረፍካት
የከበዳት ሸክም ቀሎ ባንተ ረፍት ኣገኘች
ይኸው በሰዎች ፊት ያንተን ክብር ትመሰክራለች

CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 4
ኣይቸኩልም እግዚአብሔር ለርሱ ኣለው ጊዜ
ሲጠሩት ይሰማል ፈጣኖ ያወጣል ከትካዜ
የፅድቅንም መንገድ እያሳየ ይመራናል
ወደ ህይወት መንገድ እረኛችን ወስዶ ያሳርፈናል

CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)

VERSE 5
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይቺው ነች ኣቅሜ ለስጦታ (2)

CHORUS
መክፈል የማልችለው (ኣለብኝ ውለታ.2)
ተነግሮ የማያልቅ (ኣለብኝ ውለታ.2)
ኣምላክ ተመስገን የኔ ጌታ
ይችው ነች ኣቅሜ ለስጦታ(2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichw nech aqme lest’ota (2)

VERSE 1
Bezemene hulu yedegefkegn beejochh
Geta zerzre alch’ersew wiletah
Miskin barya lewletah ahun min ekeflalew
Lela atsham ante yeaqmen yihew amesegnahalew

CHORUS
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichw nech aqme lest’ota (2)

VERSE 2
Sinaq endalneber ene besewoch tet’ye
Kewdqete ansteh sew arekegn cher Getaye
Nebse lewletah bemsgana temoltalech
T’wat mata simkn eyanesach tamesegnalech

CHORUS
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichw nech aqme lest’ota (2)

VERSE 3
Nebse mesheshegya at’ta ante silayehat
Kelemlem mesk wesdeh Geta asarefkat
Yekebedat shekm qelo bante reft agegnech
Yiኸw besewoch fit yanten kibir timesekralech

CHORUS
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichw nech aqme lest’ota (2)

VERSE 4
Aychekulm Egziabher lersu alew gize
Sit’erut yisemal fet’ano yawet’al ketkaze
Yets’dqnm menged eyasaye yimeranal
Wede hiywet menged eregnachn wesdo yasarfenal

CHORUS
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichw nech aqme lest’ota (2)

VERSE 5
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichiw nech aqme lest’ota (2)

CHORUS
Mekfel yemalchlew (alebgn wileta.2)
Tenegro yemayalq (alebgn wileta.2)
Amlak temesgen yene Geta
Yichw nech aqme lest’ota (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mekifel-yemalichilew-alebign-wileta', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mekneyat Selalegn (mekneyat-selalegn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ምክንያት ስላለኝ ነው የምዘምርልሽ
ምክንያት ስላለኝ ነው ቅኔ የምቀኝልሽ
አሁንም ይብዛልኝ ፍቅርሽ(፪)
ከዚህ በላይ እንዳመሰግንሽ

VERSE 1
አውቃለሁ ከደጅሽ ምን እንዳገኘሁኝ
አስታውሰዋለሁ ሸክሜን እንደጣልኩኝ
የለመንኩሽ ሁሉ መቼ ከንቱ ቀረ
ሰይጣን ተመለሰ እንዳቀረቀረ

VERSE 2
ጠላት ቢከፋውም ለአንቺ በመቆሜ
አደገድጋለሁ ደግሜ ደግሜ
ልቤ አርፏል በአንቺ በእናቴ አማላጄ
እንቅፋት እሾሁ አይበቅልም በደጄ

VERSE 3
በሚጣፍጥ ዜማ በኤፍሬም ውዳሴ
ሳሸበሽብልሽ ትረካለች ነፍሴ ጠላት
ቢከፋውም ለአንቺ በመቆሜ
አደገድጋለሁ ደግሜ ደግሜ

VERSE 4
ውለታ ያለበት የማይከፈል
ሲመሽም ሲነጋም ያመሰግናል
ማርያም ማርያም ይላል ምድርና ሰማዩ
በልጅሽ መከራ አልፎለት ገዳዩ

VERSE 5
ጠላት ቢከፋውም ለአንቺ በመቆሜ
አደገድጋለሁ ደግሜ ደግሜ',
      lyrics_transliteration = 'Miknyat silalegn new yemzemrlsh
Miknyat silalegn new qine yemqegnlsh
Ahunm yibzalgn fiqrsh (2)
Kezih belay endamesegnsh

VERSE 1
Awqalehu kedejsh min endagegnehugn
Astawsewalehu shekmen endet’alkugn
Yelemenkush hulu meche kentu qere
Seyt’an temelese endaqereqere

VERSE 2
T’elat bikefawm leanchi bemeqome
Adegedgalehu degme degme
Libe arfwal beanchi beenate amalaje
Enqfat eshohu aybeqlm bedeje

VERSE 3
Bemit’aft’ zema beefrem widase
Sashebeshblsh tirekalech nefse t’elat
Bikefawm leanchi bemeqome
Adegedgalehu degme degme

VERSE 4
Wileta yalebet yemaykefel
Simeshm sinegam yamesegnal
Maryam Maryam yilal midrna semayu
Beljsh mekera alfolet gedayu

VERSE 5
T’elat bikefawm leanchi bemeqome
Adegedgalehu degme degme',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mekneyat-selalegn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምክንያት ስላለኝ ነው የምዘምርልሽ
ምክንያት ስላለኝ ነው ቅኔ የምቀኝልሽ
አሁንም ይብዛልኝ ፍቅርሽ(፪)
ከዚህ በላይ እንዳመሰግንሽ

VERSE 1
አውቃለሁ ከደጅሽ ምን እንዳገኘሁኝ
አስታውሰዋለሁ ሸክሜን እንደጣልኩኝ
የለመንኩሽ ሁሉ መቼ ከንቱ ቀረ
ሰይጣን ተመለሰ እንዳቀረቀረ

CHORUS
ምክንያት ስላለኝ ነው የምዘምርልሽ
ምክንያት ስላለኝ ነው ቅኔ የምቀኝልሽ
አሁንም ይብዛልኝ ፍቅርሽ(፪)
ከዚህ በላይ እንዳመሰግንሽ

VERSE 2
ጠላት ቢከፋውም ለአንቺ በመቆሜ
አደገድጋለሁ ደግሜ ደግሜ
ልቤ አርፏል በአንቺ በእናቴ አማላጄ
እንቅፋት እሾሁ አይበቅልም በደጄ

CHORUS
ምክንያት ስላለኝ ነው የምዘምርልሽ
ምክንያት ስላለኝ ነው ቅኔ የምቀኝልሽ
አሁንም ይብዛልኝ ፍቅርሽ(፪)
ከዚህ በላይ እንዳመሰግንሽ

VERSE 3
በሚጣፍጥ ዜማ በኤፍሬም ውዳሴ
ሳሸበሽብልሽ ትረካለች ነፍሴ ጠላት
ቢከፋውም ለአንቺ በመቆሜ
አደገድጋለሁ ደግሜ ደግሜ

CHORUS
ምክንያት ስላለኝ ነው የምዘምርልሽ
ምክንያት ስላለኝ ነው ቅኔ የምቀኝልሽ
አሁንም ይብዛልኝ ፍቅርሽ(፪)
ከዚህ በላይ እንዳመሰግንሽ

VERSE 4
ውለታ ያለበት የማይከፈል
ሲመሽም ሲነጋም ያመሰግናል
ማርያም ማርያም ይላል ምድርና ሰማዩ
በልጅሽ መከራ አልፎለት ገዳዩ

CHORUS
ምክንያት ስላለኝ ነው የምዘምርልሽ
ምክንያት ስላለኝ ነው ቅኔ የምቀኝልሽ
አሁንም ይብዛልኝ ፍቅርሽ(፪)
ከዚህ በላይ እንዳመሰግንሽ

VERSE 5
ጠላት ቢከፋውም ለአንቺ በመቆሜ
አደገድጋለሁ ደግሜ ደግሜ

CHORUS
ምክንያት ስላለኝ ነው የምዘምርልሽ
ምክንያት ስላለኝ ነው ቅኔ የምቀኝልሽ
አሁንም ይብዛልኝ ፍቅርሽ(፪)
ከዚህ በላይ እንዳመሰግንሽ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Miknyat silalegn new yemzemrlsh
Miknyat silalegn new qine yemqegnlsh
Ahunm yibzalgn fiqrsh (2)
Kezih belay endamesegnsh

VERSE 1
Awqalehu kedejsh min endagegnehugn
Astawsewalehu shekmen endet’alkugn
Yelemenkush hulu meche kentu qere
Seyt’an temelese endaqereqere

CHORUS
Miknyat silalegn new yemzemrlsh
Miknyat silalegn new qine yemqegnlsh
Ahunm yibzalgn fiqrsh (2)
Kezih belay endamesegnsh

VERSE 2
T’elat bikefawm leanchi bemeqome
Adegedgalehu degme degme
Libe arfwal beanchi beenate amalaje
Enqfat eshohu aybeqlm bedeje

CHORUS
Miknyat silalegn new yemzemrlsh
Miknyat silalegn new qine yemqegnlsh
Ahunm yibzalgn fiqrsh (2)
Kezih belay endamesegnsh

VERSE 3
Bemit’aft’ zema beefrem widase
Sashebeshblsh tirekalech nefse t’elat
Bikefawm leanchi bemeqome
Adegedgalehu degme degme

CHORUS
Miknyat silalegn new yemzemrlsh
Miknyat silalegn new qine yemqegnlsh
Ahunm yibzalgn fiqrsh (2)
Kezih belay endamesegnsh

VERSE 4
Wileta yalebet yemaykefel
Simeshm sinegam yamesegnal
Maryam Maryam yilal midrna semayu
Beljsh mekera alfolet gedayu

CHORUS
Miknyat silalegn new yemzemrlsh
Miknyat silalegn new qine yemqegnlsh
Ahunm yibzalgn fiqrsh (2)
Kezih belay endamesegnsh

VERSE 5
T’elat bikefawm leanchi bemeqome
Adegedgalehu degme degme

CHORUS
Miknyat silalegn new yemzemrlsh
Miknyat silalegn new qine yemqegnlsh
Ahunm yibzalgn fiqrsh (2)
Kezih belay endamesegnsh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mekneyat-selalegn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Meliak (meliak)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 1
የታየህ አገልጋይ ይታየኝ
ሰልፉ ሲበረታ እንዳልፈራ
ያንን ቅዱስ መልኣክ ጌታ ሆይ አደራ
እኖራለሁ በሞገስ እኖራለሁ በፀጋ

VERSE 2
በጨለመዉ ለሊት መልሶ እየነጋ
አባቴ መልአኩን አዘኸዉ ስለኔ
የመዉጣት የመዉረስ የምርኮ ነዉ ቀኔ

VERSE 3
ታላቁ ሚካኤል ያንተ ወዳጅ
ዘንዶዉን የጣለ በፀናች እጅ
ስለሙሴም ስጋ ሲከራከር
አየዉ በመንፈሴ ሰይጣንን ሲያሳፍር

VERSE 4
እግሮቼ በድንጋይ ላይሰናከሉ
አለ ካጠገቤ በመንገዴ ሁሉ
ከደመናዉ በታች ይጓዛል እስራኤል
ምክሩን ይፈፅማል ታዛዡ ሚካኤል

VERSE 5
ወይኒዉ ወለል አለ ተከፈተ
ህመሜም ታመመ ሞቴም ሞተ
አምላክ ከኔ ጋራ ስለሆነ

VERSE 6
በዉስጥም በዉጭም ሰላም ሆነ
ከእስረሮቹ መሀል አንዳች ነክቶት ጎኔ
ልክ እንደ ጴጥሮስ ማምለጥ ሆኗል ለኔ
አየሁት ጎጆዬን ቤቴ በእሳት ታጥሮ

VERSE 7
የጌታዬን ማዳን የእረፍቴን ቀጥሮ',
      lyrics_transliteration = 'Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 1
Yetayeh agelgay yitayegn
Selfu sibereta endalfera
Yann Kidus melak Geta hoy adera
Enoralehu bemoges enoralehu bets’ega

VERSE 2
Bech’elemewu lelit melso eyenega
Abate melakun azeኸwu silene
Yemewut’at yemewures yemrko newu qene

VERSE 3
Talaqu Mikael yante wedaj
Zendowun yet’ale bets’enach ej
Silemusem siga sikeraker
Ayewu bemenfese seyt’ann siyasafr

VERSE 4
Egroche bedngay laysenakelu
Ale kat’egebe bemengede hulu
Kedemenawu betach yigwazal esrael
Mikrun yifets’mal tazazhu Mikael

VERSE 5
Weyniwu welel ale tekefete
Himemem tameme motem mote
Amlak kene gara silehone

VERSE 6
Bewust’m bewuch’m selam hone
Keesrerochu mehel andach nektot gone
Lik ende p’et’ros mamlet’ honwal lene
Ayehut gojoyen bete beesat tat’ro

VERSE 7
Yegetayen madan yeereften qet’ro',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'meliak'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 1
የታየህ አገልጋይ ይታየኝ
ሰልፉ ሲበረታ እንዳልፈራ
ያንን ቅዱስ መልኣክ ጌታ ሆይ አደራ
እኖራለሁ በሞገስ እኖራለሁ በፀጋ

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 2
በጨለመዉ ለሊት መልሶ እየነጋ
አባቴ መልአኩን አዘኸዉ ስለኔ
የመዉጣት የመዉረስ የምርኮ ነዉ ቀኔ
አዝ

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 3
ታላቁ ሚካኤል ያንተ ወዳጅ
ዘንዶዉን የጣለ በፀናች እጅ
ስለሙሴም ስጋ ሲከራከር
አየዉ በመንፈሴ ሰይጣንን ሲያሳፍር

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 4
እግሮቼ በድንጋይ ላይሰናከሉ
አለ ካጠገቤ በመንገዴ ሁሉ
ከደመናዉ በታች ይጓዛል እስራኤል
ምክሩን ይፈፅማል ታዛዡ ሚካኤል

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 5
አዝ
ወይኒዉ ወለል አለ ተከፈተ
ህመሜም ታመመ ሞቴም ሞተ
አምላክ ከኔ ጋራ ስለሆነ

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 6
በዉስጥም በዉጭም ሰላም ሆነ
ከእስረሮቹ መሀል አንዳች ነክቶት ጎኔ
ልክ እንደ ጴጥሮስ ማምለጥ ሆኗል ለኔ
አየሁት ጎጆዬን ቤቴ በእሳት ታጥሮ

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 7
የጌታዬን ማዳን የእረፍቴን ቀጥሮ
አዝ

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 1
Yetayeh agelgay yitayegn
Selfu sibereta endalfera
Yann Kidus melak Geta hoy adera
Enoralehu bemoges enoralehu bets’ega

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 2
Bech’elemewu lelit melso eyenega
Abate melakun azeኸwu silene
Yemewut’at yemewures yemrko newu qene
CHORUS

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 3
Talaqu Mikael yante wedaj
Zendowun yet’ale bets’enach ej
Silemusem siga sikeraker
Ayewu bemenfese seyt’ann siyasafr

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 4
Egroche bedngay laysenakelu
Ale kat’egebe bemengede hulu
Kedemenawu betach yigwazal esrael
Mikrun yifets’mal tazazhu Mikael

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 5
CHORUS
Weyniwu welel ale tekefete
Himemem tameme motem mote
Amlak kene gara silehone

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 6
Bewust’m bewuch’m selam hone
Keesrerochu mehel andach nektot gone
Lik ende p’et’ros mamlet’ honwal lene
Ayehut gojoyen bete beesat tat’ro

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 7
Yegetayen madan yeereften qet’ro
CHORUS

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'meliak', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Meliake Adihino Diyakon Zemari Enidale Dereje (meliake-adihino-diyakon-zemari-enidale-dereje)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)

VERSE 1
ደርሷል በጭንቄ - ሁሉም ሲርቀኝ
በምክንያት ነው - ለክብሩ ''ምቀኝ
ከእሳቱ ከወላፈኑ - ነጥቆ ያዳነኝ
ኃጢአተኛው ሰው - ከቶ እኔ ማን ነኝ?

VERSE 2
ሳለሁ በኀዘን - ደስታ አበሠረኝ
ደጅ ስጸናው - ማልዶ አስማረኝ
ይመራኛል በጽድቅ - ሠርክ በለምለም
ከቶ አይተወኝም - ብቻዬን ላለም

VERSE 3
የበለዓም - የራዕዩ ኮከብ
የሰላም የፍቅር - የጥበብ መርከብ
ማስተዋሉን ክብሩን - ጸጋውን ያደለኝ
የሚጠብቀኝ - ገብርኤል አለልኝ

VERSE 4
የጌታ ልደት - ሐዋርያ ነው
እንደ ገብርኤል - ገናና ማነው!?
ሁልጊዜ ዘውትር - ልመስክረው ክብሩን
ዐይቻለሁኝ - ድንቅ ታምሩን።',
      lyrics_transliteration = 'Kidus Gebriel - melake adhno
Man afro yawqal - bemljaw tamno
Simun t’erche - dersolgn dankugn
Dasogn tefewesku - mulu sew ኾnkugn (2)

VERSE 1
Derswal bech’nqe - hulum sirqegn
Bemknyat new - lekbru ''miqegn
Keesatu kewelafenu - net’qo yadanegn
Hat’iategnaw sew - keto ene man negn?

VERSE 2
Salehu behezen - desta abeseregn
Dej sits’enaw - maldo asmaregn
Yimeragnal bets’dq - serk belemlem
Keto aytewegnm - bichayen lalem

VERSE 3
Yebeleam - yeraeyu kokeb
Yeselam yefqr - yet’beb merkeb
Mastewalun kibrun - ts’egawn yadelegn
Yemit’ebqegn - Gebriel alelgn

VERSE 4
Yegeta lidet - hewarya new
Ende Gebriel - genana manew!?
Hulgize zewtr - limeskrew kibrun
Aychalehugn - dinq tamrun.',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'meliake-adihino-diyakon-zemari-enidale-dereje'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)

VERSE 1
ደርሷል በጭንቄ - ሁሉም ሲርቀኝ
በምክንያት ነው - ለክብሩ ''ምቀኝ
ከእሳቱ ከወላፈኑ - ነጥቆ ያዳነኝ
ኃጢአተኛው ሰው - ከቶ እኔ ማን ነኝ?

CHORUS
ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)

VERSE 2
ሳለሁ በኀዘን - ደስታ አበሠረኝ
ደጅ ስጸናው - ማልዶ አስማረኝ
ይመራኛል በጽድቅ - ሠርክ በለምለም
ከቶ አይተወኝም - ብቻዬን ላለም

CHORUS
ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)

VERSE 3
የበለዓም - የራዕዩ ኮከብ
የሰላም የፍቅር - የጥበብ መርከብ
ማስተዋሉን ክብሩን - ጸጋውን ያደለኝ
የሚጠብቀኝ - ገብርኤል አለልኝ

CHORUS
ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)

VERSE 4
የጌታ ልደት - ሐዋርያ ነው
እንደ ገብርኤል - ገናና ማነው!?
ሁልጊዜ ዘውትር - ልመስክረው ክብሩን
ዐይቻለሁኝ - ድንቅ ታምሩን።

CHORUS
ቅዱስ ገብርኤል - መልአከ አድኅኖ
ማን አፍሮ ያውቃል - በምልጃው ታምኖ
ስሙን ጠርቼ - ደርሶልኝ ዳንኩኝ
ዳሶኝ ተፈወስኩ - ሙሉ ሰው ኾንኩኝ(፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kidus Gebriel - melake adhno
Man afro yawqal - bemljaw tamno
Simun t’erche - dersolgn dankugn
Dasogn tefewesku - mulu sew ኾnkugn (2)

VERSE 1
Derswal bech’nqe - hulum sirqegn
Bemknyat new - lekbru ''miqegn
Keesatu kewelafenu - net’qo yadanegn
Hat’iategnaw sew - keto ene man negn?

CHORUS
Kidus Gebriel - melake adhno
Man afro yawqal - bemljaw tamno
Simun t’erche - dersolgn dankugn
Dasogn tefewesku - mulu sew ኾnkugn (2)

VERSE 2
Salehu behezen - desta abeseregn
Dej sits’enaw - maldo asmaregn
Yimeragnal bets’dq - serk belemlem
Keto aytewegnm - bichayen lalem

CHORUS
Kidus Gebriel - melake adhno
Man afro yawqal - bemljaw tamno
Simun t’erche - dersolgn dankugn
Dasogn tefewesku - mulu sew ኾnkugn (2)

VERSE 3
Yebeleam - yeraeyu kokeb
Yeselam yefqr - yet’beb merkeb
Mastewalun kibrun - ts’egawn yadelegn
Yemit’ebqegn - Gebriel alelgn

CHORUS
Kidus Gebriel - melake adhno
Man afro yawqal - bemljaw tamno
Simun t’erche - dersolgn dankugn
Dasogn tefewesku - mulu sew ኾnkugn (2)

VERSE 4
Yegeta lidet - hewarya new
Ende Gebriel - genana manew!?
Hulgize zewtr - limeskrew kibrun
Aychalehugn - dinq tamrun.

CHORUS
Kidus Gebriel - melake adhno
Man afro yawqal - bemljaw tamno
Simun t’erche - dersolgn dankugn
Dasogn tefewesku - mulu sew ኾnkugn (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'meliake-adihino-diyakon-zemari-enidale-dereje', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Melisegn Limeles (melisegn-limeles)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 1
ስንት ጊዜ አልተወኩም ወደ ኋላ አየዋት ደግሜ
ምንኛ ከንቱ ነኝ ሳልለወጥ ባለሁበት ቆሜ
ይነዳል ከተማው ይቃጠላል በቁጣ
እጄን ይዘህ አውጣኝ ዞር ሳልደርስ ጌታዬ እንዳልሞት

VERSE 2
ጨው አልባ ቢሆን በምን ይጣፍጣል
አጣፍጠኝ በቃልህ ከደጅ እንዳልጣል
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል

VERSE 3
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ
ሆኛለው ተሰንቄ አስራ ያሰረችኝ
ስሸሽ አግኝታ ከባህሩ ከጥልቁ

VERSE 4
ወፎች ለቅመውትም ቅዱስ ቃልህ የታለ?
ውስጤ አዘገየኝ እንጂ ያ ጠላቴ
መልሰኝ ልመለስ በለቅሶ
አዛኝ በሩን ክፈትልኝ ወደ ቤትህ ልግባ

VERSE 5
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 6
ገንዘቤን የሰጠኝን አፍስሼ በችሮታ
ራሴን አገኘሁ አመሻሽ ላይ ከተናቀው ቦታ
ጨልሟል ዙሪያዬ ምይዘውን ነገር አጥቻለሁ
የድሮ አይደለም የኔ ጌታ ዛሬ ደክሚያለሁ

VERSE 7
መንገድ ለጠፋው ሰው ክንድ ወዳጅ የለም
ምህረትህ እራሱን ለጣለ አለ
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል

VERSE 8
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ
ማለዳ ስነቃ ዘምሬልህ
ሲመሽ ግን ሌላ ነኝ

VERSE 9
ቃልህ ያላወቀኝ ያልቀየረኝ ጌታዬ
ልቤ አይወስንም ያመነታል ይሸሻል አጥብቆ
ሆይ! ዘላለም ላይ እንደላላ
እስከመቼ አንተ ተደብቀህ?

VERSE 10
እንዲወስን እርዳኝ ይበርታ ጉልበቴ
ጠላት ጭንቅላቱን ይስፋ እቀፈኝ አባቴ
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል

VERSE 11
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ
ነፍሴ ሆይ ነፍሴ ሆይ
እግዚአብሔርን በቅን አገልግይ

VERSE 12
የተቀበለ በቀራንዮ ያን ሁሉ መከራ
በመስቀሉ ላይ ላንቺ ሲል ነውና
ነፍሴ ሆይ ተዘጋጅተሽ ኑሪ ሁልጊዜ
በነገ በዛሬ እንዳትታለይ እንዳትታለይ

VERSE 13
ነፍሴ ሆይ በንስሃ ጠምቂ ቀጥተሽ ክቡር ደሙን ጠጪ
ስጋዊን እምቢ ስጋዊን እምቢ
ነፍሴ ሆይ ዘላለም በደስታ እንድትኖሪ
ከዘላለም ቤትሽ መንግስተ ሰማይ መንግስተ ሰማይ

VERSE 14
ነፍሴ ሆይ ነፍሴ ሆይ
እግዚአብሔርን በቅን አገልግይ',
      lyrics_transliteration = 'Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 1
Sint gize altewekum wede hwala ayewat degme
Mingna kentu negn sallewet’ balehubet qome
Yinedal ketemaw yiqat’elal bequt’a
Ejen yizeh awt’agn zor salders Getaye endalmot

VERSE 2
Ch’ew alba bihon bemn yit’aft’al
At’aft’egn beqalh kedej endalt’al
Tinantna keante gar
Zare degmo kelela selchtognal

VERSE 3
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala
Hognalew tesenqe asra yaserechgn
Sishesh aggnta kebahru ket’lqu

VERSE 4
Wefoch leqmewtm Kidus qalh yetale?
Wist’e azegeyegn enji ya t’elate
Melsegn limeles beleqso
Azagn berun kifetlgn wede beth ligba

VERSE 5
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 6
Genzeben yeset’egnn afsshe bechrota
Rasen agegnehu ameshash lay ketenaqew bota
Ch’elmwal zuriyaye miyzewn neger at’chalehu
Yedro aydelem yene Geta zare dekmiyalehu

VERSE 7
Menged let’efaw sew kind wedaj yelem
Mihreth erasun let’ale ale
Tinantna keante gar
Zare degmo kelela selchtognal

VERSE 8
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala
Maleda sineqa zemrelh
Simesh gin lela negn

VERSE 9
Qalh yalaweqegn yalqeyeregn Getaye
Libe aywesnm yamenetal yisheshal at’bqo
Hoy! zelalem lay endelala
Eskemeche ante tedebqeh?

VERSE 10
Endiwesn erdagn yiberta gulbete
T’elat ch’nqlatun yisfa eqefegn abate
Tinantna keante gar
Zare degmo kelela selchtognal

VERSE 11
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala
Nefse hoy nefse hoy
Egziabhern beqn agelgy

VERSE 12
Yeteqebele beqeranyo yan hulu mekera
Bemesqelu lay lanchi sil newna
Nefse hoy tezegajtesh nuri hulgize
Benege bezare endattaley endattaley

VERSE 13
Nefse hoy bensha t’emqi qet’tesh kibur demun t’ech’i
Sigawin embi sigawin embi
Nefse hoy zelalem bedesta endtnori
Kezelalem betsh mengste semay mengste semay

VERSE 14
Nefse hoy nefse hoy
Egziabhern beqn agelgy',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'melisegn-limeles'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 1
ስንት ጊዜ አልተወኩም ወደ ኋላ አየዋት ደግሜ
ምንኛ ከንቱ ነኝ ሳልለወጥ ባለሁበት ቆሜ
ይነዳል ከተማው ይቃጠላል በቁጣ
እጄን ይዘህ አውጣኝ ዞር ሳልደርስ ጌታዬ እንዳልሞት

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 2
ጨው አልባ ቢሆን በምን ይጣፍጣል
አጣፍጠኝ በቃልህ ከደጅ እንዳልጣል
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 3
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ
ሆኛለው ተሰንቄ አስራ ያሰረችኝ
ስሸሽ አግኝታ ከባህሩ ከጥልቁ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 4
ወፎች ለቅመውትም ቅዱስ ቃልህ የታለ?
ውስጤ አዘገየኝ እንጂ ያ ጠላቴ
መልሰኝ ልመለስ በለቅሶ
አዛኝ በሩን ክፈትልኝ ወደ ቤትህ ልግባ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 5
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 6
ገንዘቤን የሰጠኝን አፍስሼ በችሮታ
ራሴን አገኘሁ አመሻሽ ላይ ከተናቀው ቦታ
ጨልሟል ዙሪያዬ ምይዘውን ነገር አጥቻለሁ
የድሮ አይደለም የኔ ጌታ ዛሬ ደክሚያለሁ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 7
መንገድ ለጠፋው ሰው ክንድ ወዳጅ የለም
ምህረትህ እራሱን ለጣለ አለ
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 8
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ
ማለዳ ስነቃ ዘምሬልህ
ሲመሽ ግን ሌላ ነኝ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 9
ቃልህ ያላወቀኝ ያልቀየረኝ ጌታዬ
ልቤ አይወስንም ያመነታል ይሸሻል አጥብቆ
ሆይ! ዘላለም ላይ እንደላላ
እስከመቼ አንተ ተደብቀህ?

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 10
እንዲወስን እርዳኝ ይበርታ ጉልበቴ
ጠላት ጭንቅላቱን ይስፋ እቀፈኝ አባቴ
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 11
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ
ነፍሴ ሆይ ነፍሴ ሆይ
እግዚአብሔርን በቅን አገልግይ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 12
የተቀበለ በቀራንዮ ያን ሁሉ መከራ
በመስቀሉ ላይ ላንቺ ሲል ነውና
ነፍሴ ሆይ ተዘጋጅተሽ ኑሪ ሁልጊዜ
በነገ በዛሬ እንዳትታለይ እንዳትታለይ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 13
ነፍሴ ሆይ በንስሃ ጠምቂ ቀጥተሽ ክቡር ደሙን ጠጪ
ስጋዊን እምቢ ስጋዊን እምቢ
ነፍሴ ሆይ ዘላለም በደስታ እንድትኖሪ
ከዘላለም ቤትሽ መንግስተ ሰማይ መንግስተ ሰማይ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ

VERSE 14
ነፍሴ ሆይ ነፍሴ ሆይ
እግዚአብሔርን በቅን አገልግይ

CHORUS
ትናንትና ከአንተ ጋር
ዛሬ ደግሞ ከሌላ ሰልችቶኛል
አባቴ ሆይ ሁሌ መሄድ ወደ ኋላ
ሁሌ መጓዝ ወደ ኋላ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 1
Sint gize altewekum wede hwala ayewat degme
Mingna kentu negn sallewet’ balehubet qome
Yinedal ketemaw yiqat’elal bequt’a
Ejen yizeh awt’agn zor salders Getaye endalmot

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 2
Ch’ew alba bihon bemn yit’aft’al
At’aft’egn beqalh kedej endalt’al
Tinantna keante gar
Zare degmo kelela selchtognal

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 3
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala
Hognalew tesenqe asra yaserechgn
Sishesh aggnta kebahru ket’lqu

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 4
Wefoch leqmewtm Kidus qalh yetale?
Wist’e azegeyegn enji ya t’elate
Melsegn limeles beleqso
Azagn berun kifetlgn wede beth ligba

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 5
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 6
Genzeben yeset’egnn afsshe bechrota
Rasen agegnehu ameshash lay ketenaqew bota
Ch’elmwal zuriyaye miyzewn neger at’chalehu
Yedro aydelem yene Geta zare dekmiyalehu

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 7
Menged let’efaw sew kind wedaj yelem
Mihreth erasun let’ale ale
Tinantna keante gar
Zare degmo kelela selchtognal

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 8
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala
Maleda sineqa zemrelh
Simesh gin lela negn

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 9
Qalh yalaweqegn yalqeyeregn Getaye
Libe aywesnm yamenetal yisheshal at’bqo
Hoy! zelalem lay endelala
Eskemeche ante tedebqeh?

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 10
Endiwesn erdagn yiberta gulbete
T’elat ch’nqlatun yisfa eqefegn abate
Tinantna keante gar
Zare degmo kelela selchtognal

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 11
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala
Nefse hoy nefse hoy
Egziabhern beqn agelgy

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 12
Yeteqebele beqeranyo yan hulu mekera
Bemesqelu lay lanchi sil newna
Nefse hoy tezegajtesh nuri hulgize
Benege bezare endattaley endattaley

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 13
Nefse hoy bensha t’emqi qet’tesh kibur demun t’ech’i
Sigawin embi sigawin embi
Nefse hoy zelalem bedesta endtnori
Kezelalem betsh mengste semay mengste semay

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala

VERSE 14
Nefse hoy nefse hoy
Egziabhern beqn agelgy

CHORUS
Tinantna keante gar
Zare degmo kelela selchtognal
Abate hoy hule mehed wede hwala
Hule megwaz wede hwala'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'melisegn-limeles', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Melody of Yared (melody-of-yared)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Ye Yared wub zema Dingil Emebete
Sitotaye nesh
Bemin andebete endetis bale kal
Mariam libelish',
      lyrics_english = 'Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 1
The heavens and the earth they speak of your marvels
And all of creation testifies with novels
A tale that is ceaseless, wondrous are your deeds
Oh My Virgin Mary to you none supersede

VERSE 2
Mother of all Saint Mary my strength and aid
You swiftly come when I call I’m not afraid
Your miracles and wonders I have witnessed
Zion Mary you have cured me of emptiness

VERSE 3
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 4
The wisdom of our Lord unveiled by you Virgin
Adam''s children escaped the death that came from sin
It is you my mother the root of salvation
Who became the ladder for all of creation

VERSE 5
If the future''s uncertain full of dismay
With you as my rod I cannot be led astray
I’ll stand before you to give praise night and day
With humbleness I call you Mary I pray

VERSE 6
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 7
Generations as one they will stand to give praise
You’ve abolished the curse saved them from sorrow days
Adam and his children on Earth and in the skies
He will sing songs to you may his prayers arise

VERSE 8
The shadows of this dark world from me they part
Intercessions made by you have calmed my heart
When you’re with me Saint Mary I shall know peace
The clench from the pit of sorrow will be released

VERSE 9
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 10
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 11
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 12
Ye Yared wub zema Dingil Emebete
Sitotaye nesh
Bemin andebete endetis bale kal
Mariam libelish

VERSE 13
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'melody-of-yared'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ye Yared wub zema Dingil Emebete
Sitotaye nesh
Bemin andebete endetis bale kal
Mariam libelish'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 1
The heavens and the earth they speak of your marvels
And all of creation testifies with novels
A tale that is ceaseless, wondrous are your deeds
Oh My Virgin Mary to you none supersede

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 2
Mother of all Saint Mary my strength and aid
You swiftly come when I call I’m not afraid
Your miracles and wonders I have witnessed
Zion Mary you have cured me of emptiness

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 3
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 4
The wisdom of our Lord unveiled by you Virgin
Adam''s children escaped the death that came from sin
It is you my mother the root of salvation
Who became the ladder for all of creation

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 5
If the future''s uncertain full of dismay
With you as my rod I cannot be led astray
I’ll stand before you to give praise night and day
With humbleness I call you Mary I pray

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 6
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 7
Generations as one they will stand to give praise
You’ve abolished the curse saved them from sorrow days
Adam and his children on Earth and in the skies
He will sing songs to you may his prayers arise

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 8
The shadows of this dark world from me they part
Intercessions made by you have calmed my heart
When you’re with me Saint Mary I shall know peace
The clench from the pit of sorrow will be released

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 9
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 10
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 11
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 12
Ye Yared wub zema Dingil Emebete
Sitotaye nesh
Bemin andebete endetis bale kal
Mariam libelish

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

VERSE 13
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love

CHORUS
Melody of Yared My Lady St Mary
a treasure from above
In which fitting words or in what language can I
express to you my love'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'melody-of-yared', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Menale Betastemeregn (menale-betastemeregn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በክብር በሞገስ በመወደስ ፈንታ
መቀመጥ እንድችል ከመዋረድ ተርታ
ስድብን እስየሰማሁ ያላንዳች ሁካታ
ለመቆም እንድችል ልቤ ሳይረታ

VERSE 1
ምናል ብታስተምረኝ ብታስችለኝ ጌታ ፪
ለኔም አሰተምረኝ ባላጠፈት ጥፋት
በፀጋ መቀበል የእይሁድን ትፋት
እንዴት እንደሚቻል ሳያጉረመርሙ

VERSE 2
ንገረኝ ጌታዬ ይረዳኝ ትርጉሙ
ምናል ብታስተምረኝ ብታስችለኝ ጌታ ፪
የመናቅን ጥበብ የውርደትን ዘዴ
እባክህ አሰረዳኝ አሰተምረኝ አንዴ

VERSE 3
ብኤል ዜቡል ተበለህ ያልተበሳጨከው
የኃጢአተኞች ወዳጅ መባል ያልጠላ ከው
ጋኔል ይዞታልን የስማህ በፀጋ
ለኔም አሰተምረኝ በቂም አልወጋ ፪)

VERSE 4
አልወጋ እባክህ በመራርነት ጦር
በቁጣ ጥላቻ ነፍሴ አትስበር
እንዴት ነበር ያኔ የይሁዳን እግር
ዝቅ ብለህ ያጠብከው ስታውቅ ሁሉን ነገር

VERSE 5
ለኔም አሰተምረኝ ብዙ ሳልናገር ፪
በችካር ተጣብቀህ ከመስቀሉ ጋር
የደምህ ነጠብጣብ ገና ሳያባራ
አያውቁትምና የሚያደርጉትን

VERSE 6
ይቅርታ የለመንክ ላጠጡህ ሐሞትን
ምናል ብታስተምረኝ እንዲህ ያለ ሕይወትን፪
አሁን ምንቸገረህ ብትስጠኝ ለአንድ አፍት
የትህትናን ቀሚስ የትዕግስትን ኩታ

VERSE 7
እያየህ አይደል ውይ ነፍሴ እንዲህ ተራቁታ
የመስደብን ዘውድ የመናቅን ካባ
ምናል ብትኖር (ይህቺ ልቤ ደርባ ፪
ትዕቢት ለተሞላው ላትንኩኝ ባይ ልቤ

VERSE 8
ለክብሩ ለሚኖር ለኮርማው ሀሳቤ
ምናል ብትቀባው የትህትናን ሽቶ
እንደዚህ ከሚኖር ሽቶ ተበላሽቶ
አረ እኔስ አልቻልኩም አቅቶኛል በጣም

VERSE 9
ስድብንም መስቀል ሀሜትን ማጠጠሞ
ስተርከው እንጂ ስኖረው አቃተኝ
ይህን መራር ኑሮ አንተው ይዘህ ጋተኝ ፪',
      lyrics_transliteration = 'Bekbr bemoges bemewedes fenta
Meqemet’ endchl kemewared terta
Sidbn esyesemahu yalandach hukata
Lemeqom endchl libe sayreta

VERSE 1
Minal bitastemregn bitaschlegn Geta 2
Lenem asetemregn balat’efet t’fat
Bets’ega meqebel yeeyhudn tifat
Endet endemichal sayaguremermu

VERSE 2
Nigeregn Getaye yiredagn tirgumu
Minal bitastemregn bitaschlegn Geta 2
Yemenaqn t’beb yewrdetn zede
Ebakh aseredagn asetemregn ande

VERSE 3
Biel zebul tebeleh yaltebesach’ekew
Yehat’iategnoch wedaj mebal yalt’ela kew
Ganel yizotaln yesmah bets’ega
Lenem asetemregn beqim alwega 2)

VERSE 4
Alwega ebakh bemerarnet t’or
Bequt’a t’lacha nefse atsber
Endet neber yane yeyhudan egr
Ziq bileh yat’ebkew sitawq hulun neger

VERSE 5
Lenem asetemregn bizu salnager 2
Bechkar tet’abqeh kemesqelu gar
Yedemh net’ebt’ab gena sayabara
Ayawqutmna yemiyadergutn

VERSE 6
Yiqrta yelemenk lat’et’uh hemotn
Minal bitastemregn endih yale hiywetn2
Ahun minchegereh bitst’egn leand aft
Yethtnan qemis yetegstn kuta

VERSE 7
Eyayeh aydel wiy nefse endih teraquta
Yemesdebn zewd yemenaqn kaba
Minal bitnor (yihchi libe derba 2
Tiebit letemolaw latnkugn bay libe

VERSE 8
Lekbru leminor lekormaw hesabe
Minal bitqebaw yethtnan shto
Endezih keminor shto tebelashto
Are enes alchalkum aqtognal bet’am

VERSE 9
Sidbnm mesqel hemetn mat’et’emo
Siterkew enji sinorew aqategn
Yihn merar nuro antew yizeh gategn 2',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'menale-betastemeregn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በክብር በሞገስ በመወደስ ፈንታ
መቀመጥ እንድችል ከመዋረድ ተርታ
ስድብን እስየሰማሁ ያላንዳች ሁካታ
ለመቆም እንድችል ልቤ ሳይረታ

VERSE 1
ምናል ብታስተምረኝ ብታስችለኝ ጌታ ፪
ለኔም አሰተምረኝ ባላጠፈት ጥፋት
በፀጋ መቀበል የእይሁድን ትፋት
እንዴት እንደሚቻል ሳያጉረመርሙ

CHORUS
በክብር በሞገስ በመወደስ ፈንታ
መቀመጥ እንድችል ከመዋረድ ተርታ
ስድብን እስየሰማሁ ያላንዳች ሁካታ
ለመቆም እንድችል ልቤ ሳይረታ

VERSE 2
ንገረኝ ጌታዬ ይረዳኝ ትርጉሙ
ምናል ብታስተምረኝ ብታስችለኝ ጌታ ፪
የመናቅን ጥበብ የውርደትን ዘዴ
እባክህ አሰረዳኝ አሰተምረኝ አንዴ

CHORUS
በክብር በሞገስ በመወደስ ፈንታ
መቀመጥ እንድችል ከመዋረድ ተርታ
ስድብን እስየሰማሁ ያላንዳች ሁካታ
ለመቆም እንድችል ልቤ ሳይረታ

VERSE 3
ብኤል ዜቡል ተበለህ ያልተበሳጨከው
የኃጢአተኞች ወዳጅ መባል ያልጠላ ከው
ጋኔል ይዞታልን የስማህ በፀጋ
ለኔም አሰተምረኝ በቂም አልወጋ ፪)

CHORUS
በክብር በሞገስ በመወደስ ፈንታ
መቀመጥ እንድችል ከመዋረድ ተርታ
ስድብን እስየሰማሁ ያላንዳች ሁካታ
ለመቆም እንድችል ልቤ ሳይረታ

VERSE 4
አልወጋ እባክህ በመራርነት ጦር
በቁጣ ጥላቻ ነፍሴ አትስበር
እንዴት ነበር ያኔ የይሁዳን እግር
ዝቅ ብለህ ያጠብከው ስታውቅ ሁሉን ነገር

CHORUS
በክብር በሞገስ በመወደስ ፈንታ
መቀመጥ እንድችል ከመዋረድ ተርታ
ስድብን እስየሰማሁ ያላንዳች ሁካታ
ለመቆም እንድችል ልቤ ሳይረታ

VERSE 5
ለኔም አሰተምረኝ ብዙ ሳልናገር ፪
በችካር ተጣብቀህ ከመስቀሉ ጋር
የደምህ ነጠብጣብ ገና ሳያባራ
አያውቁትምና የሚያደርጉትን

CHORUS
በክብር በሞገስ በመወደስ ፈንታ
መቀመጥ እንድችል ከመዋረድ ተርታ
ስድብን እስየሰማሁ ያላንዳች ሁካታ
ለመቆም እንድችል ልቤ ሳይረታ

VERSE 6
ይቅርታ የለመንክ ላጠጡህ ሐሞትን
ምናል ብታስተምረኝ እንዲህ ያለ ሕይወትን፪
አሁን ምንቸገረህ ብትስጠኝ ለአንድ አፍት
የትህትናን ቀሚስ የትዕግስትን ኩታ

CHORUS
በክብር በሞገስ በመወደስ ፈንታ
መቀመጥ እንድችል ከመዋረድ ተርታ
ስድብን እስየሰማሁ ያላንዳች ሁካታ
ለመቆም እንድችል ልቤ ሳይረታ

VERSE 7
እያየህ አይደል ውይ ነፍሴ እንዲህ ተራቁታ
የመስደብን ዘውድ የመናቅን ካባ
ምናል ብትኖር (ይህቺ ልቤ ደርባ ፪
ትዕቢት ለተሞላው ላትንኩኝ ባይ ልቤ

CHORUS
በክብር በሞገስ በመወደስ ፈንታ
መቀመጥ እንድችል ከመዋረድ ተርታ
ስድብን እስየሰማሁ ያላንዳች ሁካታ
ለመቆም እንድችል ልቤ ሳይረታ

VERSE 8
ለክብሩ ለሚኖር ለኮርማው ሀሳቤ
ምናል ብትቀባው የትህትናን ሽቶ
እንደዚህ ከሚኖር ሽቶ ተበላሽቶ
አረ እኔስ አልቻልኩም አቅቶኛል በጣም

CHORUS
በክብር በሞገስ በመወደስ ፈንታ
መቀመጥ እንድችል ከመዋረድ ተርታ
ስድብን እስየሰማሁ ያላንዳች ሁካታ
ለመቆም እንድችል ልቤ ሳይረታ

VERSE 9
ስድብንም መስቀል ሀሜትን ማጠጠሞ
ስተርከው እንጂ ስኖረው አቃተኝ
ይህን መራር ኑሮ አንተው ይዘህ ጋተኝ ፪

CHORUS
በክብር በሞገስ በመወደስ ፈንታ
መቀመጥ እንድችል ከመዋረድ ተርታ
ስድብን እስየሰማሁ ያላንዳች ሁካታ
ለመቆም እንድችል ልቤ ሳይረታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bekbr bemoges bemewedes fenta
Meqemet’ endchl kemewared terta
Sidbn esyesemahu yalandach hukata
Lemeqom endchl libe sayreta

VERSE 1
Minal bitastemregn bitaschlegn Geta 2
Lenem asetemregn balat’efet t’fat
Bets’ega meqebel yeeyhudn tifat
Endet endemichal sayaguremermu

CHORUS
Bekbr bemoges bemewedes fenta
Meqemet’ endchl kemewared terta
Sidbn esyesemahu yalandach hukata
Lemeqom endchl libe sayreta

VERSE 2
Nigeregn Getaye yiredagn tirgumu
Minal bitastemregn bitaschlegn Geta 2
Yemenaqn t’beb yewrdetn zede
Ebakh aseredagn asetemregn ande

CHORUS
Bekbr bemoges bemewedes fenta
Meqemet’ endchl kemewared terta
Sidbn esyesemahu yalandach hukata
Lemeqom endchl libe sayreta

VERSE 3
Biel zebul tebeleh yaltebesach’ekew
Yehat’iategnoch wedaj mebal yalt’ela kew
Ganel yizotaln yesmah bets’ega
Lenem asetemregn beqim alwega 2)

CHORUS
Bekbr bemoges bemewedes fenta
Meqemet’ endchl kemewared terta
Sidbn esyesemahu yalandach hukata
Lemeqom endchl libe sayreta

VERSE 4
Alwega ebakh bemerarnet t’or
Bequt’a t’lacha nefse atsber
Endet neber yane yeyhudan egr
Ziq bileh yat’ebkew sitawq hulun neger

CHORUS
Bekbr bemoges bemewedes fenta
Meqemet’ endchl kemewared terta
Sidbn esyesemahu yalandach hukata
Lemeqom endchl libe sayreta

VERSE 5
Lenem asetemregn bizu salnager 2
Bechkar tet’abqeh kemesqelu gar
Yedemh net’ebt’ab gena sayabara
Ayawqutmna yemiyadergutn

CHORUS
Bekbr bemoges bemewedes fenta
Meqemet’ endchl kemewared terta
Sidbn esyesemahu yalandach hukata
Lemeqom endchl libe sayreta

VERSE 6
Yiqrta yelemenk lat’et’uh hemotn
Minal bitastemregn endih yale hiywetn2
Ahun minchegereh bitst’egn leand aft
Yethtnan qemis yetegstn kuta

CHORUS
Bekbr bemoges bemewedes fenta
Meqemet’ endchl kemewared terta
Sidbn esyesemahu yalandach hukata
Lemeqom endchl libe sayreta

VERSE 7
Eyayeh aydel wiy nefse endih teraquta
Yemesdebn zewd yemenaqn kaba
Minal bitnor (yihchi libe derba 2
Tiebit letemolaw latnkugn bay libe

CHORUS
Bekbr bemoges bemewedes fenta
Meqemet’ endchl kemewared terta
Sidbn esyesemahu yalandach hukata
Lemeqom endchl libe sayreta

VERSE 8
Lekbru leminor lekormaw hesabe
Minal bitqebaw yethtnan shto
Endezih keminor shto tebelashto
Are enes alchalkum aqtognal bet’am

CHORUS
Bekbr bemoges bemewedes fenta
Meqemet’ endchl kemewared terta
Sidbn esyesemahu yalandach hukata
Lemeqom endchl libe sayreta

VERSE 9
Sidbnm mesqel hemetn mat’et’emo
Siterkew enji sinorew aqategn
Yihn merar nuro antew yizeh gategn 2

CHORUS
Bekbr bemoges bemewedes fenta
Meqemet’ endchl kemewared terta
Sidbn esyesemahu yalandach hukata
Lemeqom endchl libe sayreta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'menale-betastemeregn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: menbeye yersun degnet linager (menbeye-yersun-degnet-linager)
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
  WHERE slug = 'menbeye-yersun-degnet-linager'
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
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'menbeye-yersun-degnet-linager', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mendo Alo Eyu Zemarit Biruktawit Gebremedhin Tigrigna Orthodox Mezmur (mendo-alo-eyu-zemarit-biruktawit-gebremedhin-tigrigna-orthodox-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ

VERSE 1
ከም ጭካነ ናይ ሰባት ደኣ መዝገብና ተዓጽዩ እንድዩ
ግን ንስኻ ዘይሰመርካዮ ምኽሪ
ዋላ ይደርደር ከቶ የብሉን ዕምሪ
ከንቱ ኢኻ ትገብሮ ከምዘየፍሪ

VERSE 2
ኣዝ
ዕምቆቱን ስፍሓቱን ልክዕ መጠኑ ብምርዳእ
ስቡር ልብና ክትዝንኖ ንምልዓልና ትትንስእ
እዚ እምበኣር''ዩ ውሽጥና ዘህድኦ

VERSE 3
ጸዓቱ ኮይኑ ከይደክም ዘበርትዖ
ኣብዚ ፈታኒ ግዜ ፍጹም ዘጽንዖ
ኣዝ
ሞት ናይ ሓደ እኳ ኣይትፈቱን ኢኻ

VERSE 4
እቲ በዳሊ ንኽጠዓስ ንሱ''ዩ ትባህግኻ
አዒንቱ ክፈት ነቲ ኣብ ሓዉ ዝለዓል
ካብ ክፉእ ግብሩ ክምለስ ሃብ ምስትውዓል
ሓድሕድካ ምጥፍፋእ ደጊምስ ይእከል',
      lyrics_transliteration = 'Men''do alo''yu bizeykaኻ wisht’na zifwso
Nibatna zihbso
Beynኻ iኻ Egziabher hazenna tidbso
Ch’rash zeyt’efaena sala mihretkayu

VERSE 1
Kem ch’kane nay sebat dea mezgebna teats’yu endyu
Gin nisኻ zeysemerkayo miኽri
Wala yiderder keto yeblun emri
Kentu iኻ tigebro kemzeyefri

VERSE 2
Az
Emqotun sifhatun like met’enu bimrdae
Sibur libna kitznno nimlalna titnse
Ezi embear''yu wisht’na zehdo

VERSE 3
Ts’eatu koynu keydekm zeberto
Abzi fetani gize fits’um zets’no
Az
Mot nay hade ekwa aytfetun iኻ

VERSE 4
Eti bedali niኽt’eas nisu''yu tibahgኻ
Aintu kifet neti ab hawu zileal
Kab kifue gibru kimles hab mistwal
Hadhdka mit’ffae degims yiekel',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mendo-alo-eyu-zemarit-biruktawit-gebremedhin-tigrigna-orthodox-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ

VERSE 1
ከም ጭካነ ናይ ሰባት ደኣ መዝገብና ተዓጽዩ እንድዩ
ግን ንስኻ ዘይሰመርካዮ ምኽሪ
ዋላ ይደርደር ከቶ የብሉን ዕምሪ
ከንቱ ኢኻ ትገብሮ ከምዘየፍሪ

CHORUS
መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ

VERSE 2
ኣዝ
ዕምቆቱን ስፍሓቱን ልክዕ መጠኑ ብምርዳእ
ስቡር ልብና ክትዝንኖ ንምልዓልና ትትንስእ
እዚ እምበኣር''ዩ ውሽጥና ዘህድኦ

CHORUS
መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ

VERSE 3
ጸዓቱ ኮይኑ ከይደክም ዘበርትዖ
ኣብዚ ፈታኒ ግዜ ፍጹም ዘጽንዖ
ኣዝ
ሞት ናይ ሓደ እኳ ኣይትፈቱን ኢኻ

CHORUS
መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ

VERSE 4
እቲ በዳሊ ንኽጠዓስ ንሱ''ዩ ትባህግኻ
አዒንቱ ክፈት ነቲ ኣብ ሓዉ ዝለዓል
ካብ ክፉእ ግብሩ ክምለስ ሃብ ምስትውዓል
ሓድሕድካ ምጥፍፋእ ደጊምስ ይእከል

CHORUS
መን''ዶ ኣሎ''ዩ ብዘይካኻ ውሽጥና ዝፍውሶ
ንብዓትና ዝሕብሶ
በይንኻ ኢኻ እግዚአብሔር ሓዘንና ትድብሶ
ጭራሽ ዘይጠፋእና ሳላ ምሕረትካዩ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Men''do alo''yu bizeykaኻ wisht’na zifwso
Nibatna zihbso
Beynኻ iኻ Egziabher hazenna tidbso
Ch’rash zeyt’efaena sala mihretkayu

VERSE 1
Kem ch’kane nay sebat dea mezgebna teats’yu endyu
Gin nisኻ zeysemerkayo miኽri
Wala yiderder keto yeblun emri
Kentu iኻ tigebro kemzeyefri

CHORUS
Men''do alo''yu bizeykaኻ wisht’na zifwso
Nibatna zihbso
Beynኻ iኻ Egziabher hazenna tidbso
Ch’rash zeyt’efaena sala mihretkayu

VERSE 2
Az
Emqotun sifhatun like met’enu bimrdae
Sibur libna kitznno nimlalna titnse
Ezi embear''yu wisht’na zehdo

CHORUS
Men''do alo''yu bizeykaኻ wisht’na zifwso
Nibatna zihbso
Beynኻ iኻ Egziabher hazenna tidbso
Ch’rash zeyt’efaena sala mihretkayu

VERSE 3
Ts’eatu koynu keydekm zeberto
Abzi fetani gize fits’um zets’no
Az
Mot nay hade ekwa aytfetun iኻ

CHORUS
Men''do alo''yu bizeykaኻ wisht’na zifwso
Nibatna zihbso
Beynኻ iኻ Egziabher hazenna tidbso
Ch’rash zeyt’efaena sala mihretkayu

VERSE 4
Eti bedali niኽt’eas nisu''yu tibahgኻ
Aintu kifet neti ab hawu zileal
Kab kifue gibru kimles hab mistwal
Hadhdka mit’ffae degims yiekel

CHORUS
Men''do alo''yu bizeykaኻ wisht’na zifwso
Nibatna zihbso
Beynኻ iኻ Egziabher hazenna tidbso
Ch’rash zeyt’efaena sala mihretkayu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mendo-alo-eyu-zemarit-biruktawit-gebremedhin-tigrigna-orthodox-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Menfes kidus Ethiopian Orthodox Mezmure (menfes-kidus-ethiopian-orthodox-mezmure)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'የድፍረት ሀጥያት እዳይገዛኝ
መንፈስ ቅዱስ ጠብቀኝ
ካወኩህ ከገባኝ ብኋላ
ፈርቼ አልይ ወደኋላ

VERSE 1
ቆርጬ እንድወጣ አበርታኝ
ከሳሼን ትጥቄን ሳያስፈታኝ
ቅዱስ መንፈስህ አይዘንብኝ
አርነት ሃጢያት አይሁንብኝ

VERSE 2
በቃኤል መንገድ መሔድ ይብቃኝ
በቃልህ ባተ ብቻ ልቃኝ',
      lyrics_transliteration = 'Yedfret het’yat edaygezagn
Menfes Kidus t’ebqegn
Kawekuh kegebagn bihwala
Ferche aly wedehwala

VERSE 1
Qorch’e endwet’a abertagn
Kesashen tit’qen sayasfetagn
Kidus menfesh ayzenbgn
Arnet hat’iyat ayhunbgn

VERSE 2
Beqael menged mehed yibqagn
Beqalh bate bicha liqagn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'menfes-kidus-ethiopian-orthodox-mezmure'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የድፍረት ሀጥያት እዳይገዛኝ
መንፈስ ቅዱስ ጠብቀኝ
ካወኩህ ከገባኝ ብኋላ
ፈርቼ አልይ ወደኋላ

VERSE 1
ቆርጬ እንድወጣ አበርታኝ
ከሳሼን ትጥቄን ሳያስፈታኝ
ቅዱስ መንፈስህ አይዘንብኝ
አርነት ሃጢያት አይሁንብኝ

CHORUS
የድፍረት ሀጥያት እዳይገዛኝ
መንፈስ ቅዱስ ጠብቀኝ
ካወኩህ ከገባኝ ብኋላ
ፈርቼ አልይ ወደኋላ

VERSE 2
በቃኤል መንገድ መሔድ ይብቃኝ
በቃልህ ባተ ብቻ ልቃኝ

CHORUS
የድፍረት ሀጥያት እዳይገዛኝ
መንፈስ ቅዱስ ጠብቀኝ
ካወኩህ ከገባኝ ብኋላ
ፈርቼ አልይ ወደኋላ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yedfret het’yat edaygezagn
Menfes Kidus t’ebqegn
Kawekuh kegebagn bihwala
Ferche aly wedehwala

VERSE 1
Qorch’e endwet’a abertagn
Kesashen tit’qen sayasfetagn
Kidus menfesh ayzenbgn
Arnet hat’iyat ayhunbgn

CHORUS
Yedfret het’yat edaygezagn
Menfes Kidus t’ebqegn
Kawekuh kegebagn bihwala
Ferche aly wedehwala

VERSE 2
Beqael menged mehed yibqagn
Beqalh bate bicha liqagn

CHORUS
Yedfret het’yat edaygezagn
Menfes Kidus t’ebqegn
Kawekuh kegebagn bihwala
Ferche aly wedehwala'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'menfes-kidus-ethiopian-orthodox-mezmure', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: menfes qdus /zemari berket tikue / Live orthodox worship mezmur (menfes-qdus-zemari-berket-tikue-live-orthodox-worship-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ

VERSE 1
ፈሪሐ ከይጥምት ንድሕረይ
ቆሪጸ ክወጽእ ርድኣኒ
ከሰስተይ ዕጥቀይ ከየፍትሑኒ
ቅዱስ መንፈስካ ከይሓዝነለይ

VERSE 2
ንሓጥያት ከይከውን ሓርነተይ
ይእከለኒ መንገዲ ቃኤል
ቃንየኒ ብናይ በይንኻ ቃል
እናፈለጥኩ ኣጥፊአ ከይርከብ

VERSE 3
ግንሓኒ ሂወት ንኽረክብ
ኩለንትናይ ውረሶ ኢኻ
ካብ ልበይ ኣይንጸፍ ፉቕርኻ
ንሓላፊ ትምኔተይ ክብል

VERSE 4
ከይወድቕ ክወርድ ንቑልቁል
ፍርሓተይ ብፍቕርኻ እሰራ
ሂወተይ ናትካ"ዶ ግበራ',
      lyrics_transliteration = 'Nay difret hat’yat keygezani
Nay difret hat’yat keymelkeni
Menfes Kidus ridani
Teredia mis berhaley

VERSE 1
Ferihe keyt’mt nidhrey
Qorits’e kiwets’e ridani
Kesestey et’qey keyefthuni
Kidus menfeska keyhazneley

VERSE 2
Nihat’yat keykewn harnetey
Yiekeleni mengedi qael
Qanyeni binay beynኻ qal
Enafelet’ku at’fia keyrkeb

VERSE 3
Ginhani hiwet niኽrekb
Kulentnay wireso iኻ
Kab libey aynts’ef fuቕrኻ
Nihalafi timnetey kibl

VERSE 4
Keywedቕ kiwerd niቑlqul
Firhatey bifቕrኻ esera
Hiwetey natka"do gibera',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'menfes-qdus-zemari-berket-tikue-live-orthodox-worship-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ

VERSE 1
ፈሪሐ ከይጥምት ንድሕረይ
ቆሪጸ ክወጽእ ርድኣኒ
ከሰስተይ ዕጥቀይ ከየፍትሑኒ
ቅዱስ መንፈስካ ከይሓዝነለይ

CHORUS
ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ

VERSE 2
ንሓጥያት ከይከውን ሓርነተይ
ይእከለኒ መንገዲ ቃኤል
ቃንየኒ ብናይ በይንኻ ቃል
እናፈለጥኩ ኣጥፊአ ከይርከብ

CHORUS
ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ

VERSE 3
ግንሓኒ ሂወት ንኽረክብ
ኩለንትናይ ውረሶ ኢኻ
ካብ ልበይ ኣይንጸፍ ፉቕርኻ
ንሓላፊ ትምኔተይ ክብል

CHORUS
ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ

VERSE 4
ከይወድቕ ክወርድ ንቑልቁል
ፍርሓተይ ብፍቕርኻ እሰራ
ሂወተይ ናትካ"ዶ ግበራ

CHORUS
ናይ ድፍረት ሓጥያት ከይገዝኣኒ
ናይ ድፍረት ሓጥያት ከይመልከኒ
መንፈስ ቅዱስ ርድኣኒ
ተረዲአ ምስ በርሃለይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nay difret hat’yat keygezani
Nay difret hat’yat keymelkeni
Menfes Kidus ridani
Teredia mis berhaley

VERSE 1
Ferihe keyt’mt nidhrey
Qorits’e kiwets’e ridani
Kesestey et’qey keyefthuni
Kidus menfeska keyhazneley

CHORUS
Nay difret hat’yat keygezani
Nay difret hat’yat keymelkeni
Menfes Kidus ridani
Teredia mis berhaley

VERSE 2
Nihat’yat keykewn harnetey
Yiekeleni mengedi qael
Qanyeni binay beynኻ qal
Enafelet’ku at’fia keyrkeb

CHORUS
Nay difret hat’yat keygezani
Nay difret hat’yat keymelkeni
Menfes Kidus ridani
Teredia mis berhaley

VERSE 3
Ginhani hiwet niኽrekb
Kulentnay wireso iኻ
Kab libey aynts’ef fuቕrኻ
Nihalafi timnetey kibl

CHORUS
Nay difret hat’yat keygezani
Nay difret hat’yat keymelkeni
Menfes Kidus ridani
Teredia mis berhaley

VERSE 4
Keywedቕ kiwerd niቑlqul
Firhatey bifቕrኻ esera
Hiwetey natka"do gibera

CHORUS
Nay difret hat’yat keygezani
Nay difret hat’yat keymelkeni
Menfes Kidus ridani
Teredia mis berhaley'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'menfes-qdus-zemari-berket-tikue-live-orthodox-worship-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Menigisite Silase (menigisite-silase)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም

VERSE 1
ንግበር ሰብአ ብለው አማን በአማን
አዳምን ፈጥረውት አማን በአማን
በቸርነትና በፍቅር ጎበኙት
ሁሉን በእጁ አድርገው ሁሉን አስገዙለት

VERSE 2
የፍቅር የደስታ አማን በአማን
የበረከት አባት አማን በአማን
መንግስቱ ዘለዓለም ህልፈት የሌለበት
በአፈ መላዕክት የሚመሰገኑት

VERSE 3
የዚያን የደግ አባት አማን በአማን
የአብርሃምን ቤት አማን በአማን
እንደባረኩለት የእኛንም ባርኩልን
የቤታችን ዋልታ መሰረት ሁኑልን

VERSE 4
በመከራ ጊዜ አማን በአማን
ከጭንቅ የሚያውጡን አማን በአማን
ስሙን ሳመሰግን ትረካለች ነፍሴ
የነሙሴ አምላክ የአብርሃሙ ስላሴ',
      lyrics_transliteration = 'Aman beaman aman beaman
Aman beaman aman beaman
Mengste Silassie zelealem
Mengste Silassie zelealem

VERSE 1
Nigber seba bilew aman beaman
Adamn fet’rewt aman beaman
Bechernetna befqr gobegnut
Hulun beeju adrgew hulun asgezulet

VERSE 2
Yefqr yedesta aman beaman
Yebereket abat aman beaman
Mengstu zelealem hilfet yelelebet
Beafe melaekt yemimesegenut

VERSE 3
Yeziyan yedeg abat aman beaman
Yeabrhamn bet aman beaman
Endebarekulet yeegnanm barkuln
Yebetachn walta meseret hunuln

VERSE 4
Bemekera gize aman beaman
Kech’nq yemiyawt’un aman beaman
Simun samesegn tirekalech nefse
Yenemuse amlak yeabrhamu Silassie',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'menigisite-silase'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም

VERSE 1
ንግበር ሰብአ ብለው አማን በአማን
አዳምን ፈጥረውት አማን በአማን
በቸርነትና በፍቅር ጎበኙት
ሁሉን በእጁ አድርገው ሁሉን አስገዙለት

CHORUS
አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም

VERSE 2
የፍቅር የደስታ አማን በአማን
የበረከት አባት አማን በአማን
መንግስቱ ዘለዓለም ህልፈት የሌለበት
በአፈ መላዕክት የሚመሰገኑት

CHORUS
አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም

VERSE 3
የዚያን የደግ አባት አማን በአማን
የአብርሃምን ቤት አማን በአማን
እንደባረኩለት የእኛንም ባርኩልን
የቤታችን ዋልታ መሰረት ሁኑልን

CHORUS
አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም

VERSE 4
በመከራ ጊዜ አማን በአማን
ከጭንቅ የሚያውጡን አማን በአማን
ስሙን ሳመሰግን ትረካለች ነፍሴ
የነሙሴ አምላክ የአብርሃሙ ስላሴ

CHORUS
አማን በአማን አማን በአማን
አማን በአማን አማን በአማን
መንግስተ ስላሴ ዘለዓለም
መንግስተ ስላሴ ዘለዓለም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aman beaman aman beaman
Aman beaman aman beaman
Mengste Silassie zelealem
Mengste Silassie zelealem

VERSE 1
Nigber seba bilew aman beaman
Adamn fet’rewt aman beaman
Bechernetna befqr gobegnut
Hulun beeju adrgew hulun asgezulet

CHORUS
Aman beaman aman beaman
Aman beaman aman beaman
Mengste Silassie zelealem
Mengste Silassie zelealem

VERSE 2
Yefqr yedesta aman beaman
Yebereket abat aman beaman
Mengstu zelealem hilfet yelelebet
Beafe melaekt yemimesegenut

CHORUS
Aman beaman aman beaman
Aman beaman aman beaman
Mengste Silassie zelealem
Mengste Silassie zelealem

VERSE 3
Yeziyan yedeg abat aman beaman
Yeabrhamn bet aman beaman
Endebarekulet yeegnanm barkuln
Yebetachn walta meseret hunuln

CHORUS
Aman beaman aman beaman
Aman beaman aman beaman
Mengste Silassie zelealem
Mengste Silassie zelealem

VERSE 4
Bemekera gize aman beaman
Kech’nq yemiyawt’un aman beaman
Simun samesegn tirekalech nefse
Yenemuse amlak yeabrhamu Silassie

CHORUS
Aman beaman aman beaman
Aman beaman aman beaman
Mengste Silassie zelealem
Mengste Silassie zelealem'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'menigisite-silase', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Merehalew Belegn (merehalew-belegn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 1
የምህረት አይኖችህ ይዩኝ በይቅርታ
ስለ ድንግል ማርያም እስራቴን ፍታ /2
ምሬሃለዉ በለኝ ስለ ድንግል ማርያም /2
መሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

VERSE 2
ቸል በማለቴ የደምህን ዋጋ
ተመልሼ ገባሁ ከጥፋት መጋጋ
ሰላሜ ደፍርሶ ተቅበዝባዥ ሆኛለሁ
ስለ እናትህ ብለህ ማረኝ እልሃለሁ

VERSE 3
ስለ ድንግል ማርያም ማረኝ እልሃለሁ
ምሬሃለሁ በለኝ ስለ ድንግል ማርያም /2
መሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በከንቱ መሻቴ ስጋ ነብሴን ቀብሮ

VERSE 4
አቅም አጥቻለሁ አጥንቴ ተሰብሮ
ከበረዶ ይልቅ ነጭ እንድታደርገኝ
ስለ ድንግል ማርያም ከሀጥያቴ እጠበኝ
ስለ ድንግል ማርያም ምሬሃለሁ በለኝ

VERSE 5
ምሬሃለሁ በለኝ ስለ ድንግል ማርያም
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
ከንፈሮቼን ከፍተህ ልቁም ለምስጋና
አንተን የጋረደኝ ጣርያ ይነሳና

VERSE 6
አልብሰኝ ፅድቅህን ይቅር መራቆቴ
ስል ድንግል ማርያም መልሰኝ ከቤቴ/2
ምሬሃለዉ በለኝ ስለ ድንግል ማርያም /2
መሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም(2)',
      lyrics_transliteration = 'Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e

VERSE 1
Yemhret aynochh yiyugn beyqrta
Sile Dingil Maryam esraten fita /2
Mirehalewu belegn sile Dingil Maryam /2
Mehariw medhani alem yiqr bay endante yelem

VERSE 2
Chel bemalete yedemhn waga
Temelshe gebahu ket’fat megaga
Selame defrso teqbezbazh hognalehu
Sile enath bileh maregn elhalehu

VERSE 3
Sile Dingil Maryam maregn elhalehu
Mirehalehu belegn sile Dingil Maryam /2
Mehariw medhani alem yiqr bay endante yelem
Bekentu meshate siga nebsen qebro

VERSE 4
Aqm at’chalehu at’nte tesebro
Keberedo yilq nech’ endtadergegn
Sile Dingil Maryam kehet’yate et’ebegn
Sile Dingil Maryam mirehalehu belegn

VERSE 5
Mirehalehu belegn sile Dingil Maryam
Mihariw medhani alem yiqr bay endante yelem
Kenferochen kefteh liqum lemsgana
Anten yegaredegn t’arya yinesana

VERSE 6
Albsegn ts’dqhn yiqr meraqote
Sil Dingil Maryam melsegn kebete/2
Mirehalewu belegn sile Dingil Maryam /2
Mehariw medhani alem yiqr bay endante yelem (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'merehalew-belegn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 1
የምህረት አይኖችህ ይዩኝ በይቅርታ
ስለ ድንግል ማርያም እስራቴን ፍታ /2
ምሬሃለዉ በለኝ ስለ ድንግል ማርያም /2
መሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 2
ቸል በማለቴ የደምህን ዋጋ
ተመልሼ ገባሁ ከጥፋት መጋጋ
ሰላሜ ደፍርሶ ተቅበዝባዥ ሆኛለሁ
ስለ እናትህ ብለህ ማረኝ እልሃለሁ

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 3
ስለ ድንግል ማርያም ማረኝ እልሃለሁ
ምሬሃለሁ በለኝ ስለ ድንግል ማርያም /2
መሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በከንቱ መሻቴ ስጋ ነብሴን ቀብሮ

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 4
አቅም አጥቻለሁ አጥንቴ ተሰብሮ
ከበረዶ ይልቅ ነጭ እንድታደርገኝ
ስለ ድንግል ማርያም ከሀጥያቴ እጠበኝ
ስለ ድንግል ማርያም ምሬሃለሁ በለኝ

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 5
ምሬሃለሁ በለኝ ስለ ድንግል ማርያም
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
ከንፈሮቼን ከፍተህ ልቁም ለምስጋና
አንተን የጋረደኝ ጣርያ ይነሳና

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ

VERSE 6
አልብሰኝ ፅድቅህን ይቅር መራቆቴ
ስል ድንግል ማርያም መልሰኝ ከቤቴ/2
ምሬሃለዉ በለኝ ስለ ድንግል ማርያም /2
መሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም(2)

CHORUS
ምሬሃለዉ በለኝ ስል ድንግል ማርያም /2
ምሃሪው መድኃኒ አለም ይቅር ባይ እንዳንተ የለም
በሀጥያት ድንኳኖች ይበቃ መቀመጤ
የቀናውን መንፈስ አድሰው በውስጤ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e

VERSE 1
Yemhret aynochh yiyugn beyqrta
Sile Dingil Maryam esraten fita /2
Mirehalewu belegn sile Dingil Maryam /2
Mehariw medhani alem yiqr bay endante yelem

CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e

VERSE 2
Chel bemalete yedemhn waga
Temelshe gebahu ket’fat megaga
Selame defrso teqbezbazh hognalehu
Sile enath bileh maregn elhalehu

CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e

VERSE 3
Sile Dingil Maryam maregn elhalehu
Mirehalehu belegn sile Dingil Maryam /2
Mehariw medhani alem yiqr bay endante yelem
Bekentu meshate siga nebsen qebro

CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e

VERSE 4
Aqm at’chalehu at’nte tesebro
Keberedo yilq nech’ endtadergegn
Sile Dingil Maryam kehet’yate et’ebegn
Sile Dingil Maryam mirehalehu belegn

CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e

VERSE 5
Mirehalehu belegn sile Dingil Maryam
Mihariw medhani alem yiqr bay endante yelem
Kenferochen kefteh liqum lemsgana
Anten yegaredegn t’arya yinesana

CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e

VERSE 6
Albsegn ts’dqhn yiqr meraqote
Sil Dingil Maryam melsegn kebete/2
Mirehalewu belegn sile Dingil Maryam /2
Mehariw medhani alem yiqr bay endante yelem (2)

CHORUS
Mirehalewu belegn sil Dingil Maryam /2
Mihariw medhani alem yiqr bay endante yelem
Behet’yat dinkwanoch yibeqa meqemet’e
Yeqenawn menfes adsew bewst’e'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'merehalew-belegn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mesach Mezimur Asa Mebilat Ayidelem Kesis Ashenafi Gebiremariyam (mesach-mezimur-asa-mebilat-ayidelem-kesis-ashenafi-gebiremariyam)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 1
ከኔ ዮሴፍ ጋራ ላውርድህ ከመስቀል
ከነ ማርያም ጋራ ልውጣ ጎልጎታ
ወደ ጥልቁ ፈቀቅ አርገኝ የኔ ጌታ
ተጠርቶ ከቤቱ መንገድ ላይ የቀረ

VERSE 2
በረሃ የበላው በዓለም ላይ ያደረ
መስቀል ተሸክሞ ያልገባው መስቀሉ
የሚያድር ተስማምቶ ከተገኘ ሁሉ
አላማ የሌለው መሽቶበት አዳሪ

VERSE 3
እንደ ኖህ አሞራ በወጣበት ቀሪ
ለምን እሆናለሁ በለስ ያለ ፍሬ
ስቀለው እንዳልል ለክብርህ ዘምሬ
ወደ ጥልቁ ፈቀቅ ነበር ክርስትና

VERSE 4
በአውሎና በወጀብ በባህር ጎዳና
በሸንጎ ፊት መቆም ጅራፍ መቀበል
ስቀለው ስቀለው ይወገድ መባል
አላማ የሌለው መሽቶበት አዳሪ

VERSE 5
እንደ ኖህ አሞራ በወጣበት ቀሪ
ለምን እሆናለሁ በለስ ያለ ፍሬ
ስቀለው እንዳልል ለክብርህ ዘምሬ
በሞት ጥላ መሀል በህይወት መውጣት

VERSE 6
ከእረኛው ጋራ በስንጥቅ አለት
በፀጋው ለዳኑ ስሙን ለሚወዱ
አልጋ በአልጋ አይደለም ከባድ ነው መንገዱ
አላማ የሌለው መሽቶበት አዳሪ

VERSE 7
እንደ ኖህ አሞራ በወጣበት ቀሪ
ለምን እሆናለሁ በለስ ያለ ፍሬ
ስቀለው እንዳልል ለክብርህ ዘምሬ',
      lyrics_transliteration = 'Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 1
Kene yosef gara lawrdh kemesqel
Kene Maryam gara liwt’a golgota
Wede t’lqu feqeq argegn yene Geta
Tet’erto kebetu menged lay yeqere

VERSE 2
Bereha yebelaw bealem lay yadere
Mesqel teshekmo yalgebaw mesqelu
Yemiyadr tesmamto ketegegne hulu
Alama yelelew meshtobet adari

VERSE 3
Ende noh amora bewet’abet qeri
Lemn ehonalehu beles yale fire
Siqelew endall lekbrh zemre
Wede t’lqu feqeq neber kirstna

VERSE 4
Beawlona bewejeb bebahr godana
Beshengo fit meqom jiraf meqebel
Siqelew siqelew yiweged mebal
Alama yelelew meshtobet adari

VERSE 5
Ende noh amora bewet’abet qeri
Lemn ehonalehu beles yale fire
Siqelew endall lekbrh zemre
Bemot t’la mehel behywet mewt’at

VERSE 6
Keeregnaw gara besnt’q alet
Bets’egaw ledanu simun lemiwedu
Alga bealga aydelem kebad new mengedu
Alama yelelew meshtobet adari

VERSE 7
Ende noh amora bewet’abet qeri
Lemn ehonalehu beles yale fire
Siqelew endall lekbrh zemre',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mesach-mezimur-asa-mebilat-ayidelem-kesis-ashenafi-gebiremariyam'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 1
ከኔ ዮሴፍ ጋራ ላውርድህ ከመስቀል
ከነ ማርያም ጋራ ልውጣ ጎልጎታ
ወደ ጥልቁ ፈቀቅ አርገኝ የኔ ጌታ
ተጠርቶ ከቤቱ መንገድ ላይ የቀረ

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 2
በረሃ የበላው በዓለም ላይ ያደረ
መስቀል ተሸክሞ ያልገባው መስቀሉ
የሚያድር ተስማምቶ ከተገኘ ሁሉ
አላማ የሌለው መሽቶበት አዳሪ

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 3
እንደ ኖህ አሞራ በወጣበት ቀሪ
ለምን እሆናለሁ በለስ ያለ ፍሬ
ስቀለው እንዳልል ለክብርህ ዘምሬ
ወደ ጥልቁ ፈቀቅ ነበር ክርስትና

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 4
በአውሎና በወጀብ በባህር ጎዳና
በሸንጎ ፊት መቆም ጅራፍ መቀበል
ስቀለው ስቀለው ይወገድ መባል
አላማ የሌለው መሽቶበት አዳሪ

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 5
እንደ ኖህ አሞራ በወጣበት ቀሪ
ለምን እሆናለሁ በለስ ያለ ፍሬ
ስቀለው እንዳልል ለክብርህ ዘምሬ
በሞት ጥላ መሀል በህይወት መውጣት

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 6
ከእረኛው ጋራ በስንጥቅ አለት
በፀጋው ለዳኑ ስሙን ለሚወዱ
አልጋ በአልጋ አይደለም ከባድ ነው መንገዱ
አላማ የሌለው መሽቶበት አዳሪ

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል

VERSE 7
እንደ ኖህ አሞራ በወጣበት ቀሪ
ለምን እሆናለሁ በለስ ያለ ፍሬ
ስቀለው እንዳልል ለክብርህ ዘምሬ

CHORUS
ዓሳ መብላት አይደለም የህይወቴ አላማ
ታምር ማየት አይደለም የህይወቴ አላማ
ግፍያ ብቻ መች ሆነ የህይወቴ አላማ
ጨርቄን ላንጥፍልህ ሆሳዕና ልበል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 1
Kene yosef gara lawrdh kemesqel
Kene Maryam gara liwt’a golgota
Wede t’lqu feqeq argegn yene Geta
Tet’erto kebetu menged lay yeqere

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 2
Bereha yebelaw bealem lay yadere
Mesqel teshekmo yalgebaw mesqelu
Yemiyadr tesmamto ketegegne hulu
Alama yelelew meshtobet adari

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 3
Ende noh amora bewet’abet qeri
Lemn ehonalehu beles yale fire
Siqelew endall lekbrh zemre
Wede t’lqu feqeq neber kirstna

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 4
Beawlona bewejeb bebahr godana
Beshengo fit meqom jiraf meqebel
Siqelew siqelew yiweged mebal
Alama yelelew meshtobet adari

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 5
Ende noh amora bewet’abet qeri
Lemn ehonalehu beles yale fire
Siqelew endall lekbrh zemre
Bemot t’la mehel behywet mewt’at

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 6
Keeregnaw gara besnt’q alet
Bets’egaw ledanu simun lemiwedu
Alga bealga aydelem kebad new mengedu
Alama yelelew meshtobet adari

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel

VERSE 7
Ende noh amora bewet’abet qeri
Lemn ehonalehu beles yale fire
Siqelew endall lekbrh zemre

CHORUS
Asa meblat aydelem yehywete alama
Tamr mayet aydelem yehywete alama
Gifya bicha mech hone yehywete alama
Ch’erqen lant’flh hosaena libel'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mesach-mezimur-asa-mebilat-ayidelem-kesis-ashenafi-gebiremariyam', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mesach Mezimur Bezimita Zemari Kesis Ashenafi Gebiremariyam (mesach-mezimur-bezimita-zemari-kesis-ashenafi-gebiremariyam)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በዝምታ መልስ አለ ከጌታ (6)
ለእግዚአብሔር ነግሮ ለሰው ዝም የሚል
ተሸክሞ ኖሮ እርጥቡን መስቀል
ስለራሱ ትቶ እውነት የሚያወራ

VERSE 1
ይሻገራል ገደል ይወጣል ተራራ
እወቁልኝ ብሎ ስሙኝ ስሙኝ ያለ
ነፋስ ተደገፈ ጉምን ተከተለ
ሰው በራሱ ጥላ እንደማይጠለል

VERSE 2
ከሰማይ ካልሆነ ምስክር የታል
ዳንኤል ዝም አለ ፍርድን ሲቀበል
አልተከራከረም ለአንበሶች ሲጣል
እግዚአብሔር ሲናገር ተረፈ ከሞት

VERSE 3
ስንፍናና ስህተት አልተገኘበት
የእግዚአብሔር ልጅ ያለው ምስክር አለው
መንፈሱ ነውና የሚናገረው
ሸንጎ ቢያቆሟችሁ ልባችሁ ይበርታ

VERSE 4
ስለናንተ ሆኖ ይናገራል ጌታ
በዝምታ መልስ አለ ከጌታ (6)',
      lyrics_transliteration = 'Bezmta mels ale kegeta (6)
LeEgziabher negro lesew zim yemil
Teshekmo noro ert’bun mesqel
Silerasu tito ewnet yemiyawera

VERSE 1
Yishageral gedel yiwet’al terara
Ewequlgn bilo simugn simugn yale
Nefas tedegefe gumn teketele
Sew berasu t’la endemayt’elel

VERSE 2
Kesemay kalhone miskr yetal
Danel zim ale firdn siqebel
Altekerakerem leanbesoch sit’al
Egziabher sinager terefe kemot

VERSE 3
Sinfnana sihtet altegegnebet
YeEgziabher lij yalew miskr alew
Menfesu newna yeminagerew
Shengo biyaqomwachhu libachhu yiberta

VERSE 4
Silenante hono yinageral Geta
Bezmta mels ale kegeta (6)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mesach-mezimur-bezimita-zemari-kesis-ashenafi-gebiremariyam'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በዝምታ መልስ አለ ከጌታ (6)
ለእግዚአብሔር ነግሮ ለሰው ዝም የሚል
ተሸክሞ ኖሮ እርጥቡን መስቀል
ስለራሱ ትቶ እውነት የሚያወራ

VERSE 1
ይሻገራል ገደል ይወጣል ተራራ
እወቁልኝ ብሎ ስሙኝ ስሙኝ ያለ
ነፋስ ተደገፈ ጉምን ተከተለ
ሰው በራሱ ጥላ እንደማይጠለል

CHORUS
በዝምታ መልስ አለ ከጌታ (6)
ለእግዚአብሔር ነግሮ ለሰው ዝም የሚል
ተሸክሞ ኖሮ እርጥቡን መስቀል
ስለራሱ ትቶ እውነት የሚያወራ

VERSE 2
ከሰማይ ካልሆነ ምስክር የታል
ዳንኤል ዝም አለ ፍርድን ሲቀበል
አልተከራከረም ለአንበሶች ሲጣል
እግዚአብሔር ሲናገር ተረፈ ከሞት

CHORUS
በዝምታ መልስ አለ ከጌታ (6)
ለእግዚአብሔር ነግሮ ለሰው ዝም የሚል
ተሸክሞ ኖሮ እርጥቡን መስቀል
ስለራሱ ትቶ እውነት የሚያወራ

VERSE 3
ስንፍናና ስህተት አልተገኘበት
የእግዚአብሔር ልጅ ያለው ምስክር አለው
መንፈሱ ነውና የሚናገረው
ሸንጎ ቢያቆሟችሁ ልባችሁ ይበርታ

CHORUS
በዝምታ መልስ አለ ከጌታ (6)
ለእግዚአብሔር ነግሮ ለሰው ዝም የሚል
ተሸክሞ ኖሮ እርጥቡን መስቀል
ስለራሱ ትቶ እውነት የሚያወራ

VERSE 4
ስለናንተ ሆኖ ይናገራል ጌታ
በዝምታ መልስ አለ ከጌታ (6)

CHORUS
በዝምታ መልስ አለ ከጌታ (6)
ለእግዚአብሔር ነግሮ ለሰው ዝም የሚል
ተሸክሞ ኖሮ እርጥቡን መስቀል
ስለራሱ ትቶ እውነት የሚያወራ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bezmta mels ale kegeta (6)
LeEgziabher negro lesew zim yemil
Teshekmo noro ert’bun mesqel
Silerasu tito ewnet yemiyawera

VERSE 1
Yishageral gedel yiwet’al terara
Ewequlgn bilo simugn simugn yale
Nefas tedegefe gumn teketele
Sew berasu t’la endemayt’elel

CHORUS
Bezmta mels ale kegeta (6)
LeEgziabher negro lesew zim yemil
Teshekmo noro ert’bun mesqel
Silerasu tito ewnet yemiyawera

VERSE 2
Kesemay kalhone miskr yetal
Danel zim ale firdn siqebel
Altekerakerem leanbesoch sit’al
Egziabher sinager terefe kemot

CHORUS
Bezmta mels ale kegeta (6)
LeEgziabher negro lesew zim yemil
Teshekmo noro ert’bun mesqel
Silerasu tito ewnet yemiyawera

VERSE 3
Sinfnana sihtet altegegnebet
YeEgziabher lij yalew miskr alew
Menfesu newna yeminagerew
Shengo biyaqomwachhu libachhu yiberta

CHORUS
Bezmta mels ale kegeta (6)
LeEgziabher negro lesew zim yemil
Teshekmo noro ert’bun mesqel
Silerasu tito ewnet yemiyawera

VERSE 4
Silenante hono yinageral Geta
Bezmta mels ale kegeta (6)

CHORUS
Bezmta mels ale kegeta (6)
LeEgziabher negro lesew zim yemil
Teshekmo noro ert’bun mesqel
Silerasu tito ewnet yemiyawera'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mesach-mezimur-bezimita-zemari-kesis-ashenafi-gebiremariyam', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Meskel Abeba Neh Wub Abeba (meskel-abeba-wub-abeba)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 1
መስቀል አበባ ተቀብሮ ሲኖር
አደይ አበባ ስነ ስቅለቱ
መስቀል አበባ እሌኒ አገኘች
አደይ አበባ ደገኛይቱ

VERSE 2
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 3
መስቀል አበባ ጥራጊውን ሞልተው
አደይ አበባ አይሁድ በክፋት
መስቀል አበባ ጢሱ ሰገደ
አደይ አበባ መስቀል ካለበት

VERSE 4
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 5
መስቀል አበባ ወንዙ ጅረቱ
አደይ አበባ ሸለቆ ዱሩ
መስቀል አበባ አሸብርቀው ደምቀው
አደይ አበባ ላንተ መሰከሩ

VERSE 6
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 7
መስቀል አበባ ተቀብሮ ሲኖር
አደይ አበባ ስነ ስቅለቱ
መስቀል አበባ እሌኒ አገኘች
አደይ አበባ ደገኛይቱ

VERSE 8
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ',
      lyrics_transliteration = 'Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 1
Meskel abeba teqebro sinor
Adey abeba sine siqletu
Meskel abeba Eleni agenyech
Adey abeba degegnayitu

VERSE 2
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 3
Meskel abeba tiragiwun moltew
Adey abeba Ayihud be-kifat
Meskel abeba tisu segede
Adey abeba Meskel kalebet

VERSE 4
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 5
Meskel abeba wenzu jiretu
Adey abeba sheleqo duru
Meskel abeba ashebirqew demqew
Adey abeba lante mesekeru

VERSE 6
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 7
Meskel abeba teqebro sinor
Adey abeba sine siqletu
Meskel abeba Eleni agenyech
Adey abeba degegnayitu

VERSE 8
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'meskel-abeba-wub-abeba'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 1
መስቀል አበባ ተቀብሮ ሲኖር
አደይ አበባ ስነ ስቅለቱ
መስቀል አበባ እሌኒ አገኘች
አደይ አበባ ደገኛይቱ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 2
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 3
መስቀል አበባ ጥራጊውን ሞልተው
አደይ አበባ አይሁድ በክፋት
መስቀል አበባ ጢሱ ሰገደ
አደይ አበባ መስቀል ካለበት

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 4
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 5
መስቀል አበባ ወንዙ ጅረቱ
አደይ አበባ ሸለቆ ዱሩ
መስቀል አበባ አሸብርቀው ደምቀው
አደይ አበባ ላንተ መሰከሩ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 6
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 7
መስቀል አበባ ተቀብሮ ሲኖር
አደይ አበባ ስነ ስቅለቱ
መስቀል አበባ እሌኒ አገኘች
አደይ አበባ ደገኛይቱ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 8
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

CHORUS
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 1
Meskel abeba teqebro sinor
Adey abeba sine siqletu
Meskel abeba Eleni agenyech
Adey abeba degegnayitu

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 2
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 3
Meskel abeba tiragiwun moltew
Adey abeba Ayihud be-kifat
Meskel abeba tisu segede
Adey abeba Meskel kalebet

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 4
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 5
Meskel abeba wenzu jiretu
Adey abeba sheleqo duru
Meskel abeba ashebirqew demqew
Adey abeba lante mesekeru

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 6
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 7
Meskel abeba teqebro sinor
Adey abeba sine siqletu
Meskel abeba Eleni agenyech
Adey abeba degegnayitu

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

VERSE 8
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba

CHORUS
Meskel abeba neh wub abeba
Adey abeba nesh wub abeba'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'meskel-abeba-wub-abeba', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Meskel Birhane (meskel-birhane)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መስቀል ብርሀነ ለኵሉ ዓለም መሠረተ ቤተክርስቲያን (፪)
ወሀቤ ሰላም መድኃኔዓለም መስቀል መድኅን ለዕለ ነአምን (፪)

VERSE 1
መስቀል ብርሃን ነው ለመላው ዓለም መሠረት ነው የቤተክርስቲያን (፪)
ሰላምን ሰጪ ነው መድኃኔዓለም መስቀል አዳኝ ነው ለምናምን ሰዎች (፪)',
      lyrics_transliteration = 'Meskel birhane lekulu alem meserete betekrstian (2)
Wehabe selam medhanialem meskel medhin le’ele ne’amin (2)

VERSE 1
Meskel birhan new lemelaw alem meseret new ye’betekrstian (2)
Selamin sechi new medhanialem meskel adagn new leminamin sewoch (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'meskel-birhane'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መስቀል ብርሀነ ለኵሉ ዓለም መሠረተ ቤተክርስቲያን (፪)
ወሀቤ ሰላም መድኃኔዓለም መስቀል መድኅን ለዕለ ነአምን (፪)

VERSE 1
መስቀል ብርሃን ነው ለመላው ዓለም መሠረት ነው የቤተክርስቲያን (፪)
ሰላምን ሰጪ ነው መድኃኔዓለም መስቀል አዳኝ ነው ለምናምን ሰዎች (፪)

CHORUS
መስቀል ብርሀነ ለኵሉ ዓለም መሠረተ ቤተክርስቲያን (፪)
ወሀቤ ሰላም መድኃኔዓለም መስቀል መድኅን ለዕለ ነአምን (፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Meskel birhane lekulu alem meserete betekrstian (2)
Wehabe selam medhanialem meskel medhin le’ele ne’amin (2)

VERSE 1
Meskel birhan new lemelaw alem meseret new ye’betekrstian (2)
Selamin sechi new medhanialem meskel adagn new leminamin sewoch (2)

CHORUS
Meskel birhane lekulu alem meserete betekrstian (2)
Wehabe selam medhanialem meskel medhin le’ele ne’amin (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'meskel-birhane', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Meskel Lay Yayehut Fikir (meskel-lay-yayehut-fikir)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 1
Awakened I will sing for my Lord who’s above (2)

VERSE 2
መስቀል ላይ ያየሁት ፍቅር (2)

VERSE 3
ይቀሰቅሰኛል ለስሙ እንድዘምር (2)

VERSE 4
He endured agony for they had struck His face (2)

VERSE 5
Even though He was pierced He gives unending grace (2)

VERSE 6
His love never wavered when they acted in wrath (2)

VERSE 7
Though He was chained and shoved He still protects their path (2)

VERSE 8
On the Cross I witnessed His love (2)

VERSE 9
Awakened I will sing for my Lord who’s above (2)

VERSE 10
The saint now a sinner the truth became a lie (2)

VERSE 11
When they boldly shouted saying that He should die (2)

VERSE 12
He was tested by man the Maker was demeaned (2)

VERSE 13
Christ was imprisoned and then Barabbas was freed (2)

VERSE 14
On the Cross I witnessed His love (2)

VERSE 15
Awakened I will sing for my Lord who’s above (2)

VERSE 16
Although His back was whipped without any pity (2)

VERSE 17
He embraces them with forgiveness and mercy (2)

VERSE 18
In harshness they gave Him the bitter vinegar (2)

VERSE 19
And when they pierced His side out came blood and water (2)

VERSE 20
On the Cross I witnessed His love (2)

VERSE 21
Awakened I will sing for my Lord who’s above (2)

VERSE 22
He wore a purple robe after they stripped His clothes (2)

VERSE 23
They placed it on His head the braided crown of thorns (2)

VERSE 24
O Hail King of the Jews they said mocking in strife (2)

VERSE 25
But the death of Jesus provided them with life (2)

VERSE 26
On the Cross I witnessed His love (2)

VERSE 27
Awakened I will sing for my Lord who’s above (2)

VERSE 28
መስቀል ላይ ያየሁት ፍቅር (2)

VERSE 29
ይቀሰቅሰኛል ለስሙ እንድዘምር (2)',
      lyrics_transliteration = 'Meskel lay yayehut fikir (2)

VERSE 1
Yiqesqesegnial le-simu indezemir (2)

VERSE 2
Yiqesqesegnial le-simu indezemir (2)

VERSE 3
Yiqesqesegnial le-simu indezemir (2)

VERSE 4
Yiqesqesegnial le-simu indezemir (2)

VERSE 5
Yiqesqesegnial le-simu indezemir (2)

VERSE 6
Yiqesqesegnial le-simu indezemir (2)

VERSE 7
Yiqesqesegnial le-simu indezemir (2)

VERSE 8
Yiqesqesegnial le-simu indezemir (2)

VERSE 9
Yiqesqesegnial le-simu indezemir (2)

VERSE 10
Yiqesqesegnial le-simu indezemir (2)

VERSE 11
Yiqesqesegnial le-simu indezemir (2)

VERSE 12
Yiqesqesegnial le-simu indezemir (2)

VERSE 13
Yiqesqesegnial le-simu indezemir (2)

VERSE 14
Yiqesqesegnial le-simu indezemir (2)

VERSE 15
Yiqesqesegnial le-simu indezemir (2)

VERSE 16
Yiqesqesegnial le-simu indezemir (2)

VERSE 17
Yiqesqesegnial le-simu indezemir (2)

VERSE 18
Yiqesqesegnial le-simu indezemir (2)

VERSE 19
Yiqesqesegnial le-simu indezemir (2)

VERSE 20
Yiqesqesegnial le-simu indezemir (2)

VERSE 21
Yiqesqesegnial le-simu indezemir (2)

VERSE 22
Yiqesqesegnial le-simu indezemir (2)

VERSE 23
Yiqesqesegnial le-simu indezemir (2)

VERSE 24
Yiqesqesegnial le-simu indezemir (2)

VERSE 25
Yiqesqesegnial le-simu indezemir (2)

VERSE 26
Yiqesqesegnial le-simu indezemir (2)

VERSE 27
Yiqesqesegnial le-simu indezemir (2)

VERSE 28
Yiqesqesegnial le-simu indezemir (2)

VERSE 29
Yiqesqesegnial le-simu indezemir (2)',
      lyrics_english = 'On the Cross I witnessed His love /2/
Awakened I will sing for my Lord who’s above /2/

VERSE 1
He endured agony for they had struck His face
Even though He was pierced He gives unending grace
His love never wavered when they acted in wrath
Though He was chained and shoved He still protects their path

VERSE 2
The saint now a sinner the truth became a lie
When they boldly shouted saying that He should die
He was tested by man the Maker was demeaned
Christ was imprisoned and then Barabbas was freed

VERSE 3
Although His back was whipped without any pity
He embraces them with forgiveness and mercy
In harshness they gave Him the bitter vinegar
And when they pierced His side out came blood and water

VERSE 4
He wore a purple robe after they stripped His clothes
They placed it on His head the braided crown of thorns
O Hail King of the Jews they said mocking in strife
But the death of Jesus provided them with life

VERSE 5
On the Cross I witnessed His love /2/
Awakened I will sing for my Lord who’s above /2/',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'meskel-lay-yayehut-fikir'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 1
Awakened I will sing for my Lord who’s above (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 2
መስቀል ላይ ያየሁት ፍቅር (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 3
ይቀሰቅሰኛል ለስሙ እንድዘምር (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 4
He endured agony for they had struck His face (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 5
Even though He was pierced He gives unending grace (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 6
His love never wavered when they acted in wrath (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 7
Though He was chained and shoved He still protects their path (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 8
On the Cross I witnessed His love (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 9
Awakened I will sing for my Lord who’s above (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 10
The saint now a sinner the truth became a lie (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 11
When they boldly shouted saying that He should die (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 12
He was tested by man the Maker was demeaned (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 13
Christ was imprisoned and then Barabbas was freed (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 14
On the Cross I witnessed His love (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 15
Awakened I will sing for my Lord who’s above (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 16
Although His back was whipped without any pity (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 17
He embraces them with forgiveness and mercy (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 18
In harshness they gave Him the bitter vinegar (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 19
And when they pierced His side out came blood and water (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 20
On the Cross I witnessed His love (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 21
Awakened I will sing for my Lord who’s above (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 22
He wore a purple robe after they stripped His clothes (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 23
They placed it on His head the braided crown of thorns (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 24
O Hail King of the Jews they said mocking in strife (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 25
But the death of Jesus provided them with life (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 26
On the Cross I witnessed His love (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 27
Awakened I will sing for my Lord who’s above (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 28
መስቀል ላይ ያየሁት ፍቅር (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)

VERSE 29
ይቀሰቅሰኛል ለስሙ እንድዘምር (2)

CHORUS
On the cross i witnessed his love
On the Cross I witnessed His love (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Meskel lay yayehut fikir (2)

VERSE 1
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 2
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 3
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 4
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 5
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 6
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 7
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 8
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 9
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 10
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 11
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 12
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 13
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 14
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 15
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 16
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 17
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 18
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 19
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 20
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 21
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 22
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 23
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 24
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 25
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 26
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 27
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 28
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)

VERSE 29
Yiqesqesegnial le-simu indezemir (2)

CHORUS
Meskel lay yayehut fikir (2)'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
On the Cross I witnessed His love /2/
Awakened I will sing for my Lord who’s above /2/

VERSE 1
He endured agony for they had struck His face
Even though He was pierced He gives unending grace
His love never wavered when they acted in wrath
Though He was chained and shoved He still protects their path

CHORUS
On the Cross I witnessed His love /2/
Awakened I will sing for my Lord who’s above /2/

VERSE 2
The saint now a sinner the truth became a lie
When they boldly shouted saying that He should die
He was tested by man the Maker was demeaned
Christ was imprisoned and then Barabbas was freed

CHORUS
On the Cross I witnessed His love /2/
Awakened I will sing for my Lord who’s above /2/

VERSE 3
Although His back was whipped without any pity
He embraces them with forgiveness and mercy
In harshness they gave Him the bitter vinegar
And when they pierced His side out came blood and water

CHORUS
On the Cross I witnessed His love /2/
Awakened I will sing for my Lord who’s above /2/

VERSE 4
He wore a purple robe after they stripped His clothes
They placed it on His head the braided crown of thorns
O Hail King of the Jews they said mocking in strife
But the death of Jesus provided them with life

CHORUS
On the Cross I witnessed His love /2/
Awakened I will sing for my Lord who’s above /2/

VERSE 5
On the Cross I witnessed His love /2/
Awakened I will sing for my Lord who’s above /2/

CHORUS
On the Cross I witnessed His love /2/
Awakened I will sing for my Lord who’s above /2/'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'meskel-lay-yayehut-fikir', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Meskelike Yikunene Beza (meskelike-yikunene-beza)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መስቀልከ ይኩነነ ቤዛ (፪)
ይኩነነ ቤዛ (፬)
መስቀልከ ይኩነነ ቤዛ (፪)

VERSE 1
መስቀልከ ይኩነነ ቤዛ (፪)
ይኩነነ ቤዛ (፬)
መስቀልከ ይኩነነ ቤዛ (፪)',
      lyrics_transliteration = 'Meskelike yikunene beza (2)
Yikunene beza (4)
Meskelike yikunene beza (2)

VERSE 1
Meskelike yikunene beza (2)
Yikunene beza (4)
Meskelike yikunene beza (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'meskelike-yikunene-beza'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መስቀልከ ይኩነነ ቤዛ (፪)
ይኩነነ ቤዛ (፬)
መስቀልከ ይኩነነ ቤዛ (፪)

VERSE 1
መስቀልከ ይኩነነ ቤዛ (፪)
ይኩነነ ቤዛ (፬)
መስቀልከ ይኩነነ ቤዛ (፪)

CHORUS
መስቀልከ ይኩነነ ቤዛ (፪)
ይኩነነ ቤዛ (፬)
መስቀልከ ይኩነነ ቤዛ (፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Meskelike yikunene beza (2)
Yikunene beza (4)
Meskelike yikunene beza (2)

VERSE 1
Meskelike yikunene beza (2)
Yikunene beza (4)
Meskelike yikunene beza (2)

CHORUS
Meskelike yikunene beza (2)
Yikunene beza (4)
Meskelike yikunene beza (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'meskelike-yikunene-beza', v_updated;
  END IF;
  v_total := v_total + v_updated;

  IF v_total <> 100 THEN
    RAISE EXCEPTION 'Batch 06 count mismatch: expected 100, got %', v_total;
  END IF;

  RAISE EXCEPTION 'DRY RUN BATCH 06 SUCCESS: Verified % hymns. Rolling back cleanly.', v_total;
END $batch_06$;
