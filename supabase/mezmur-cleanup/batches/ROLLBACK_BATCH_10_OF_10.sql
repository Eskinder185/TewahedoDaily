-- =========================================================================
-- ROLLBACK BATCH 10 of 10: 89 Hymns (901 to 989)
-- Target: public.mezmur_data_import
-- =========================================================================

DO $rollback_batch_10$
DECLARE
  v_updated integer := 0;
  v_total integer := 0;
BEGIN

  -- Hymn rollback: Yemitebikegn Ayitegnam (yemitebikegn-ayitegnam-3283)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
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
ቤት ባይኖረኝም እደጅ ባድርም',
      lyrics_transliteration = 'CHORUS
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
Bet baynoregnm edej badrm',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yemitebikegn-ayitegnam-3283'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የሚጠብቀኝ አይተኛም/2/
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
ምስጋና ላቅርብ እስከ ዘለዓለም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yemit’ebqegn aytegnam (2)
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
Misgana laqrb eske zelealem'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yemitebikegn-ayitegnam-3283', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yemsrach Des Yibelen (yemsrach-des-yibelen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የምስራች ደስ ይበለን (፪)
የዓለም መድኃኒት ተወለደልን
የምስራች ደስ ይበለን
ኢየሱስ /የዓለም ቤዛ/ (፪)

VERSE 1
የዓለም ቤዛ (፫) ለኛ ተወለደልን
አዝ
ንጉሥ ሄሮድስ ይህን ሲሰማ (፪)
ፈልጋችሁ አምጡት በቀን በጨለማ (፪)

CHORUS
የምስራች ደስ ይበለን (፪)
የዓለም መድኃኒት ተወለደልን
የምስራች ደስ ይበለን
ኢየሱስ /የዓለም ቤዛ/ (፪)

VERSE 2
አዝ
ሰብዐሰገል እንደታዘዙት (፪)
በኮከብ ተመርተው ህፃኑን አገኙት (፪)
አዝ

CHORUS
የምስራች ደስ ይበለን (፪)
የዓለም መድኃኒት ተወለደልን
የምስራች ደስ ይበለን
ኢየሱስ /የዓለም ቤዛ/ (፪)

VERSE 3
ሰገዱለት ከመሬት ወድቀው (፪)
ወርቅ እጣን ከርቤውን በረከቱን ሰጥተው (፪)

CHORUS
የምስራች ደስ ይበለን (፪)
የዓለም መድኃኒት ተወለደልን
የምስራች ደስ ይበለን
ኢየሱስ /የዓለም ቤዛ/ (፪)',
      lyrics_transliteration = 'CHORUS
Yemsrach des yibelen (2)
Yealem medhanit teweledeln
Yemsrach des yibelen
Iyesus /yealem beza/ (2)

VERSE 1
Yealem beza (3) legna teweledeln
CHORUS
Nigus herods yihn sisema (2)
Felgachhu amt’ut beqen bech’elema (2)

CHORUS
Yemsrach des yibelen (2)
Yealem medhanit teweledeln
Yemsrach des yibelen
Iyesus /yealem beza/ (2)

VERSE 2
CHORUS
Sebasegel endetazezut (2)
Bekokeb temertew hits’anun agegnut (2)
CHORUS

CHORUS
Yemsrach des yibelen (2)
Yealem medhanit teweledeln
Yemsrach des yibelen
Iyesus /yealem beza/ (2)

VERSE 3
Segedulet kemeret wedqew (2)
Werq et’an kerbewn bereketun set’tew (2)

CHORUS
Yemsrach des yibelen (2)
Yealem medhanit teweledeln
Yemsrach des yibelen
Iyesus /yealem beza/ (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yemsrach-des-yibelen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የምስራች ደስ ይበለን (፪)
የዓለም መድኃኒት ተወለደልን
የምስራች ደስ ይበለን
ኢየሱስ /የዓለም ቤዛ/ (፪)

VERSE 1
የዓለም ቤዛ (፫) ለኛ ተወለደልን
ንጉሥ ሄሮድስ ይህን ሲሰማ (፪)
ፈልጋችሁ አምጡት በቀን በጨለማ (፪)

VERSE 2
ሰብዐሰገል እንደታዘዙት (፪)
በኮከብ ተመርተው ህፃኑን አገኙት (፪)

VERSE 3
ሰገዱለት ከመሬት ወድቀው (፪)
ወርቅ እጣን ከርቤውን በረከቱን ሰጥተው (፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yemsrach des yibelen (2)
Yealem medhanit teweledeln
Yemsrach des yibelen
Iyesus /yealem beza/ (2)

VERSE 1
Yealem beza (3) legna teweledeln
Nigus herods yihn sisema (2)
Felgachhu amt’ut beqen bech’elema (2)

VERSE 2
Sebasegel endetazezut (2)
Bekokeb temertew hits’anun agegnut (2)

VERSE 3
Segedulet kemeret wedqew (2)
Werq et’an kerbewn bereketun set’tew (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yemsrach-des-yibelen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yene Geta (yene-geta)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 1
ስጋት መከራዬ ይነቀል ከልቤ
ጭንቀትን ይነቅላል እርጋታን ይተክላል
ቃልህ ስልጣን አለው ያፈርሳል ይሰራል
አይወድቅም አንተን የሰማ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 2
ድምጽህን ልጂህ ልጠማ
በቅዱስ መንፈስህ ይዋሃደኝ ቃልህ
የኔ ጌታ
ችግሬ ታላቅ ነው አይበል ከንፈሬ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 3
ታላቅነትህን ልንገር ለችግሬ
ጠላቴ ፊት ስቆም ፊትህ ተንበርክኬ
የድል ነው ዘመኔ የድል ነው ታሪኬ
አይወድቅም አንተን የሰማ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 4
ድምጽህን ልጂህ ልጠማ
በቅዱስ መንፈስህ ይዋሀደኝ ቃልህ
የኔ ጌታ
ዝናብ ታመጣለህ ባይኖርም ደመና

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 5
በረከትን ልጥገብ እሽ ልበልና
ያደረክላትን ልንገራት ለነፍሴ
ልጠማ ጧት ማታ ልሰማ በመንፈሴ
አይወድቅም አንተን የሰማ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 6
ድምጽህን ልጂህ ልጠማ
በቅዱስ መንፈስህ ይዋሀደኝ ቃልህ
የኔ ጌታ
በፊትህ ምንድነው የሴረኞች ስራ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 7
ቃልህ ጉልበት አለው ይኖዳል ተራራ
በእርሱ መዶሻነት በደሌ ሲመታ
ጫጫታው ያልፍና ይሰፍናል ፀጥታ
አይወድቅም አንተን የሰማ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 8
ድምጽህን ልጂህ ልጠማ
በቅዱስ መንፈስህ ይዋሀደኝ ቃልህ
የኔ ጌታ
አያፍረኝ አይፈራኝ ቃልህ መስታወቴ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 9
ሁሌ ይነግረኛል ስለማንነቴ
ወዴት እንደወደኩ ወዴትስ እንዳለሁ
ሽንገላን በማያውቅ በቃልህ አውቃለሁ

CHORUS
ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ',
      lyrics_transliteration = 'CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 1
Sigat mekeraye yineqel kelbe
Ch’nqetn yineqlal ergatan yiteklal
Qalh silt’an alew yafersal yiseral
Aywedqm anten yesema

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 2
Dimts’hn lijih lit’ema
Beqdus menfesh yiwahadegn qalh
Yene Geta
Chgre talaq new aybel kenfere

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 3
Talaqnethn linger lechgre
T’elate fit siqom fith tenberkke
Yedl new zemene yedl new tarike
Aywedqm anten yesema

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 4
Dimts’hn lijih lit’ema
Beqdus menfesh yiwahedegn qalh
Yene Geta
Zinab tamet’aleh baynorm demena

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 5
Bereketn lit’geb esh libelna
Yadereklatn lingerat lenefse
Lit’ema t’wat mata lisema bemenfese
Aywedqm anten yesema

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 6
Dimts’hn lijih lit’ema
Beqdus menfesh yiwahedegn qalh
Yene Geta
Befith mindnew yeseregnoch sira

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 7
Qalh gulbet alew yinodal terara
Beersu medoshanet bedele simeta
Ch’ach’ataw yalfna yisefnal ts’et’ta
Aywedqm anten yesema

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 8
Dimts’hn lijih lit’ema
Beqdus menfesh yiwahedegn qalh
Yene Geta
Ayafregn ayferagn qalh mestawete

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 9
Hule yinegregnal silemannete
Wedet endewedeku wedets endalehu
Shngelan bemayawq beqalh awqalehu

CHORUS
Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yene-geta'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሰምቼህ አድምጬህ
ልቀመጥ በእርጋታ
መንፈሴን አበርታ (፪)
ፈጥኖ ይስማማና ሐሳብህ ከሀሳቤ

VERSE 1
ስጋት መከራዬ ይነቀል ከልቤ
ጭንቀትን ይነቅላል እርጋታን ይተክላል
ቃልህ ስልጣን አለው ያፈርሳል ይሰራል
አይወድቅም አንተን የሰማ

VERSE 2
ድምጽህን ልጂህ ልጠማ
በቅዱስ መንፈስህ ይዋሃደኝ ቃልህ
የኔ ጌታ
ችግሬ ታላቅ ነው አይበል ከንፈሬ

VERSE 3
ታላቅነትህን ልንገር ለችግሬ
ጠላቴ ፊት ስቆም ፊትህ ተንበርክኬ
የድል ነው ዘመኔ የድል ነው ታሪኬ
አይወድቅም አንተን የሰማ

VERSE 4
ድምጽህን ልጂህ ልጠማ
በቅዱስ መንፈስህ ይዋሀደኝ ቃልህ
የኔ ጌታ
ዝናብ ታመጣለህ ባይኖርም ደመና

VERSE 5
በረከትን ልጥገብ እሽ ልበልና
ያደረክላትን ልንገራት ለነፍሴ
ልጠማ ጧት ማታ ልሰማ በመንፈሴ
አይወድቅም አንተን የሰማ

VERSE 6
ድምጽህን ልጂህ ልጠማ
በቅዱስ መንፈስህ ይዋሀደኝ ቃልህ
የኔ ጌታ
በፊትህ ምንድነው የሴረኞች ስራ

VERSE 7
ቃልህ ጉልበት አለው ይኖዳል ተራራ
በእርሱ መዶሻነት በደሌ ሲመታ
ጫጫታው ያልፍና ይሰፍናል ፀጥታ
አይወድቅም አንተን የሰማ

VERSE 8
ድምጽህን ልጂህ ልጠማ
በቅዱስ መንፈስህ ይዋሀደኝ ቃልህ
የኔ ጌታ
አያፍረኝ አይፈራኝ ቃልህ መስታወቴ

VERSE 9
ሁሌ ይነግረኛል ስለማንነቴ
ወዴት እንደወደኩ ወዴትስ እንዳለሁ
ሽንገላን በማያውቅ በቃልህ አውቃለሁ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Semcheh admch’eh
Liqemet’ beergata
Menfesen aberta (2)
Fet’no yismamana hesabh kehesabe

VERSE 1
Sigat mekeraye yineqel kelbe
Ch’nqetn yineqlal ergatan yiteklal
Qalh silt’an alew yafersal yiseral
Aywedqm anten yesema

VERSE 2
Dimts’hn lijih lit’ema
Beqdus menfesh yiwahadegn qalh
Yene Geta
Chgre talaq new aybel kenfere

VERSE 3
Talaqnethn linger lechgre
T’elate fit siqom fith tenberkke
Yedl new zemene yedl new tarike
Aywedqm anten yesema

VERSE 4
Dimts’hn lijih lit’ema
Beqdus menfesh yiwahedegn qalh
Yene Geta
Zinab tamet’aleh baynorm demena

VERSE 5
Bereketn lit’geb esh libelna
Yadereklatn lingerat lenefse
Lit’ema t’wat mata lisema bemenfese
Aywedqm anten yesema

VERSE 6
Dimts’hn lijih lit’ema
Beqdus menfesh yiwahedegn qalh
Yene Geta
Befith mindnew yeseregnoch sira

VERSE 7
Qalh gulbet alew yinodal terara
Beersu medoshanet bedele simeta
Ch’ach’ataw yalfna yisefnal ts’et’ta
Aywedqm anten yesema

VERSE 8
Dimts’hn lijih lit’ema
Beqdus menfesh yiwahedegn qalh
Yene Geta
Ayafregn ayferagn qalh mestawete

VERSE 9
Hule yinegregnal silemannete
Wedet endewedeku wedets endalehu
Shngelan bemayawq beqalh awqalehu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yene-geta', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yene Mehari (yene-mehari)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 1
ለፅድቁ ባርያ ሆኛለው
ሳገለግለው እኖራለሁ
የእንባ ዘለላን ያቀፈው
አይኔም እልልታ ተረፈው

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 2
ደልዳዩ መዳፍ ደርሶልኝ
ተራራው ሜዳ ሆነልኝ
አይኖቼን ከጉድ ጋርዶልኝ
ክንዶቼን በጁ ይዞልኝ

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 3
ከእግሬ በታች ነው ወጀቡ
አሁን ታይቶኛል ወደቡ
ሰላም ይነፍሳል ዙሪያዬ
እረፍት ሆኖልኝ ጌታዬ

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 4
የባረከኝን ባርኬ
ተለወጠልኝ ታሪኬ
ብርሃንህ ገፏል ድቅድቁን
በልቤ ተክሏል ሰንደቁን

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 5
ተቆጣጥሮኛል መውደዱ
መንገዴ ሆኖአል መንገዱ
ያበቃው ነገር ቀጥሏል
ጭንቄ በሞቱ ተሰቅሏል

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 6
የኢየሱስ ሁኝኜ ምን አጣው
ሁሉን በስሙ ተወጣሁ
እንደኔ ማንን ታግሷል
ይቅርታ ፍቅሩን አልብሷል

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 7
ማይገባኝን አድርጎ
ያሳለፈኝን ሸሽጎ
መልካም ነው ለኔስ መልካም
ፀጋው ያገዘኝ ስደክም

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 8
ሞትኩኝ ስል ምህረት ደርቦ
አቆመኝ በሕይወት አስውቦ

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ',
      lyrics_transliteration = 'CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 1
Lets’dqu barya hognalew
Sageleglew enoralehu
Yeenba zelelan yaqefew
Aynem ellta terefew

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 2
Deldayu medaf dersolgn
Teraraw meda honelgn
Aynochen kegud gardolgn
Kindochen beju yizolgn

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 3
Keegre betach new wejebu
Ahun taytognal wedebu
Selam yinefsal zuriyaye
Ereft honolgn Getaye

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 4
Yebarekegnn barke
Telewet’elgn tarike
Birhanh gefwal diqdqun
Belbe teklwal sendequn

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 5
Teqot’at’rognal mewdedu
Mengede honoal mengedu
Yabeqaw neger qet’lwal
Ch’nqe bemotu teseqlwal

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 6
Yeiyesus hugngne min at’aw
Hulun besmu tewet’ahu
Endene mann tagswal
Yiqrta fiqrun albswal

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 7
Maygebagnn adrgo
Yasalefegnn sheshgo
Melkam new lenes melkam
Ts’egaw yagezegn sidekm

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 8
Motkugn sil mihret derbo
Aqomegn behywet aswbo

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yene-mehari'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 1
ለፅድቁ ባርያ ሆኛለው
ሳገለግለው እኖራለሁ
የእንባ ዘለላን ያቀፈው
አይኔም እልልታ ተረፈው

VERSE 2
ደልዳዩ መዳፍ ደርሶልኝ
ተራራው ሜዳ ሆነልኝ
አይኖቼን ከጉድ ጋርዶልኝ
ክንዶቼን በጁ ይዞልኝ

VERSE 3
ከእግሬ በታች ነው ወጀቡ
አሁን ታይቶኛል ወደቡ
ሰላም ይነፍሳል ዙሪያዬ
እረፍት ሆኖልኝ ጌታዬ

VERSE 4
የባረከኝን ባርኬ
ተለወጠልኝ ታሪኬ
ብርሃንህ ገፏል ድቅድቁን
በልቤ ተክሏል ሰንደቁን

VERSE 5
ተቆጣጥሮኛል መውደዱ
መንገዴ ሆኖአል መንገዱ
ያበቃው ነገር ቀጥሏል
ጭንቄ በሞቱ ተሰቅሏል

VERSE 6
የኢየሱስ ሁኝኜ ምን አጣው
ሁሉን በስሙ ተወጣሁ
እንደኔ ማንን ታግሷል
ይቅርታ ፍቅሩን አልብሷል

VERSE 7
ማይገባኝን አድርጎ
ያሳለፈኝን ሸሽጎ
መልካም ነው ለኔስ መልካም
ፀጋው ያገዘኝ ስደክም

VERSE 8
ሞትኩኝ ስል ምህረት ደርቦ
አቆመኝ በሕይወት አስውቦ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 1
Lets’dqu barya hognalew
Sageleglew enoralehu
Yeenba zelelan yaqefew
Aynem ellta terefew

VERSE 2
Deldayu medaf dersolgn
Teraraw meda honelgn
Aynochen kegud gardolgn
Kindochen beju yizolgn

VERSE 3
Keegre betach new wejebu
Ahun taytognal wedebu
Selam yinefsal zuriyaye
Ereft honolgn Getaye

VERSE 4
Yebarekegnn barke
Telewet’elgn tarike
Birhanh gefwal diqdqun
Belbe teklwal sendequn

VERSE 5
Teqot’at’rognal mewdedu
Mengede honoal mengedu
Yabeqaw neger qet’lwal
Ch’nqe bemotu teseqlwal

VERSE 6
Yeiyesus hugngne min at’aw
Hulun besmu tewet’ahu
Endene mann tagswal
Yiqrta fiqrun albswal

VERSE 7
Maygebagnn adrgo
Yasalefegnn sheshgo
Melkam new lenes melkam
Ts’egaw yagezegn sidekm

VERSE 8
Motkugn sil mihret derbo
Aqomegn behywet aswbo'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yene-mehari', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yene mehari by Zemari Yeabkal Desalegn (yene-mehari-by-zemari-yeabkal-desalegn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የኔ መሃሪ
የኔ መሀሪ ሁሉን መርሻዬ
ሁሉን መርሻዬ
እንደ ህልም አልፏል ትናንትናዬ

VERSE 1
ባንተ ጌታዬ (2)

CHORUS
የኔ መሃሪ
የኔ መሀሪ ሁሉን መርሻዬ
ሁሉን መርሻዬ
እንደ ህልም አልፏል ትናንትናዬ

VERSE 2
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ
የፅድቁ ባሪያው ሆኛለው
ሳገለግለው ኖራለው።

CHORUS
የኔ መሃሪ
የኔ መሀሪ ሁሉን መርሻዬ
ሁሉን መርሻዬ
እንደ ህልም አልፏል ትናንትናዬ

VERSE 3
የእንባ ዘለላን ያቀፈው
አይኔም እልልታ ተረፈው
ደልዳዩ መዳፍ ደርሶሎኝ
ተራራው ሜዳ ሆነልኝ።

CHORUS
የኔ መሃሪ
የኔ መሀሪ ሁሉን መርሻዬ
ሁሉን መርሻዬ
እንደ ህልም አልፏል ትናንትናዬ

VERSE 4
አይኖቼን ከጉድ ጋርዶልኝ
ክንዶቼን በእጁ ይዞልኝ
ከእግሬ በታች ነው ወጀቡ
አሁን ታይቶኛል ወደቡ።

CHORUS
የኔ መሃሪ
የኔ መሀሪ ሁሉን መርሻዬ
ሁሉን መርሻዬ
እንደ ህልም አልፏል ትናንትናዬ

VERSE 5
ሰላም ይነፍሳል ዙሪያዬ
እረፍት ሆኖልኝ ጌታዬ
የባረከኝን ባርኬ
ተለወጠልኝ ታሪኬ።

CHORUS
የኔ መሃሪ
የኔ መሀሪ ሁሉን መርሻዬ
ሁሉን መርሻዬ
እንደ ህልም አልፏል ትናንትናዬ

VERSE 6
ብርሃንህ ገፏል ድቅድቁን
በልቤ ተክሏል ሰንደቁን
ተቆጣጥሮኛል መውደዱ
መንገዴ ሆኗል መንገዱ።

CHORUS
የኔ መሃሪ
የኔ መሀሪ ሁሉን መርሻዬ
ሁሉን መርሻዬ
እንደ ህልም አልፏል ትናንትናዬ

VERSE 7
ያበቃው ነገር ቀጥሏል
ጭንቄ በሞቱ ተሰቅሏል
የእየሱስ ሆኜ ምን አጣሁ
ሁሉን በስሙ ተወጣሁ።

CHORUS
የኔ መሃሪ
የኔ መሀሪ ሁሉን መርሻዬ
ሁሉን መርሻዬ
እንደ ህልም አልፏል ትናንትናዬ

VERSE 8
እንደኔ ማንን ታግሷል
ይቅርታ ፍቅሩን አልብሷል
ማይገባኝን አድርጎ
ያሳለፈልኝ ሸሽጎ።

CHORUS
የኔ መሃሪ
የኔ መሀሪ ሁሉን መርሻዬ
ሁሉን መርሻዬ
እንደ ህልም አልፏል ትናንትናዬ

VERSE 9
መልካም ነው ለኔስ መልካም
ፀጋው ያገዘኝ ስደክም
ሞትኩኝ ስል ምህረት ደርቦ
አቆመኝ በህይወት አስዉቦ።

CHORUS
የኔ መሃሪ
የኔ መሀሪ ሁሉን መርሻዬ
ሁሉን መርሻዬ
እንደ ህልም አልፏል ትናንትናዬ',
      lyrics_transliteration = 'CHORUS
Yene mehari
Yene meheri hulun mershaye
Hulun mershaye
Ende hilm alfwal tinantnaye

VERSE 1
Bante Getaye (2)

CHORUS
Yene mehari
Yene meheri hulun mershaye
Hulun mershaye
Ende hilm alfwal tinantnaye

VERSE 2
Adafaw libse kenets’a
Keeda kefetagn benets’a
Yets’dqu bariyaw hognalew
Sageleglew noralew.

CHORUS
Yene mehari
Yene meheri hulun mershaye
Hulun mershaye
Ende hilm alfwal tinantnaye

VERSE 3
Yeenba zelelan yaqefew
Aynem ellta terefew
Deldayu medaf dersologn
Teraraw meda honelgn.

CHORUS
Yene mehari
Yene meheri hulun mershaye
Hulun mershaye
Ende hilm alfwal tinantnaye

VERSE 4
Aynochen kegud gardolgn
Kindochen beeju yizolgn
Keegre betach new wejebu
Ahun taytognal wedebu.

CHORUS
Yene mehari
Yene meheri hulun mershaye
Hulun mershaye
Ende hilm alfwal tinantnaye

VERSE 5
Selam yinefsal zuriyaye
Ereft honolgn Getaye
Yebarekegnn barke
Telewet’elgn tarike.

CHORUS
Yene mehari
Yene meheri hulun mershaye
Hulun mershaye
Ende hilm alfwal tinantnaye

VERSE 6
Birhanh gefwal diqdqun
Belbe teklwal sendequn
Teqot’at’rognal mewdedu
Mengede honwal mengedu.

CHORUS
Yene mehari
Yene meheri hulun mershaye
Hulun mershaye
Ende hilm alfwal tinantnaye

VERSE 7
Yabeqaw neger qet’lwal
Ch’nqe bemotu teseqlwal
Yeeyesus hogne min at’ahu
Hulun besmu tewet’ahu.

CHORUS
Yene mehari
Yene meheri hulun mershaye
Hulun mershaye
Ende hilm alfwal tinantnaye

VERSE 8
Endene mann tagswal
Yiqrta fiqrun albswal
Maygebagnn adrgo
Yasalefelgn sheshgo.

CHORUS
Yene mehari
Yene meheri hulun mershaye
Hulun mershaye
Ende hilm alfwal tinantnaye

VERSE 9
Melkam new lenes melkam
Ts’egaw yagezegn sidekm
Motkugn sil mihret derbo
Aqomegn behywet aswubo.

CHORUS
Yene mehari
Yene meheri hulun mershaye
Hulun mershaye
Ende hilm alfwal tinantnaye',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yene-mehari-by-zemari-yeabkal-desalegn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የኔ መሃሪ
የኔ መሀሪ ሁሉን መርሻዬ
ሁሉን መርሻዬ
እንደ ህልም አልፏል ትናንትናዬ

VERSE 1
ባንተ ጌታዬ (2)

VERSE 2
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ
የፅድቁ ባሪያው ሆኛለው
ሳገለግለው ኖራለው።

VERSE 3
የእንባ ዘለላን ያቀፈው
አይኔም እልልታ ተረፈው
ደልዳዩ መዳፍ ደርሶሎኝ
ተራራው ሜዳ ሆነልኝ።

VERSE 4
አይኖቼን ከጉድ ጋርዶልኝ
ክንዶቼን በእጁ ይዞልኝ
ከእግሬ በታች ነው ወጀቡ
አሁን ታይቶኛል ወደቡ።

VERSE 5
ሰላም ይነፍሳል ዙሪያዬ
እረፍት ሆኖልኝ ጌታዬ
የባረከኝን ባርኬ
ተለወጠልኝ ታሪኬ።

VERSE 6
ብርሃንህ ገፏል ድቅድቁን
በልቤ ተክሏል ሰንደቁን
ተቆጣጥሮኛል መውደዱ
መንገዴ ሆኗል መንገዱ።

VERSE 7
ያበቃው ነገር ቀጥሏል
ጭንቄ በሞቱ ተሰቅሏል
የእየሱስ ሆኜ ምን አጣሁ
ሁሉን በስሙ ተወጣሁ።

VERSE 8
እንደኔ ማንን ታግሷል
ይቅርታ ፍቅሩን አልብሷል
ማይገባኝን አድርጎ
ያሳለፈልኝ ሸሽጎ።

VERSE 9
መልካም ነው ለኔስ መልካም
ፀጋው ያገዘኝ ስደክም
ሞትኩኝ ስል ምህረት ደርቦ
አቆመኝ በህይወት አስዉቦ።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yene mehari
Yene meheri hulun mershaye
Hulun mershaye
Ende hilm alfwal tinantnaye

VERSE 1
Bante Getaye (2)

VERSE 2
Adafaw libse kenets’a
Keeda kefetagn benets’a
Yets’dqu bariyaw hognalew
Sageleglew noralew.

VERSE 3
Yeenba zelelan yaqefew
Aynem ellta terefew
Deldayu medaf dersologn
Teraraw meda honelgn.

VERSE 4
Aynochen kegud gardolgn
Kindochen beeju yizolgn
Keegre betach new wejebu
Ahun taytognal wedebu.

VERSE 5
Selam yinefsal zuriyaye
Ereft honolgn Getaye
Yebarekegnn barke
Telewet’elgn tarike.

VERSE 6
Birhanh gefwal diqdqun
Belbe teklwal sendequn
Teqot’at’rognal mewdedu
Mengede honwal mengedu.

VERSE 7
Yabeqaw neger qet’lwal
Ch’nqe bemotu teseqlwal
Yeeyesus hogne min at’ahu
Hulun besmu tewet’ahu.

VERSE 8
Endene mann tagswal
Yiqrta fiqrun albswal
Maygebagnn adrgo
Yasalefelgn sheshgo.

VERSE 9
Melkam new lenes melkam
Ts’egaw yagezegn sidekm
Motkugn sil mihret derbo
Aqomegn behywet aswubo.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yene-mehari-by-zemari-yeabkal-desalegn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yene Mehari Hulun Merishaye (yene-mehari-hulun-merishaye)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 1
ለፅድቁ ባርያ ሆኛለው
ሳገለግለው እኖራለሁ
የእንባ ዘለላን ያቀፈው
አይኔም እልልታ ተረፈው

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 2
ደልዳዩ መዳፍ ደርሶልኝ
ተራራው ሜዳ ሆነልኝ
አይኖቼን ከጉድ ጋርዶልኝ
ክንዶቼን በጁ ይዞልኝ

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 3
ከእግሬ በታች ነው ወጀቡ
አሁን ታይቶኛል ወደቡ
ሰላም ይነፍሳል ዙሪያዬ
እረፍት ሆኖልኝ ጌታዬ

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 4
የባረከኝን ባርኬ
ተለወጠልኝ ታሪኬ
ብርሃንህ ገፏል ድቅድቁን
በልቤ ተክሏል ሰንደቁን

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 5
ተቆጣጥሮኛል መውደዱ
መንገዴ ሆኖአል መንገዱ
ያበቃው ነገር ቀጥሏል
ጭንቄ በሞቱ ተሰቅሏል

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 6
የኢየሱስ ሁኝዔ ምን አጣው
ሁሉን በስሙ ተወጣሁ
እንደኔ ማንን ታግሷል
ይቅርታ ፍቅሩን አልብሷል

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 7
ማይገባኝን አድርጎ
ያሳለፈኝን ሸሽጎ
መልካም ነው ለኔስ መልካም
ፀጋው ያገዘኝ ስደክም

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 8
ሞትኩኝ ስል ምህረት ደርቦ
አቆመኝ በሕይወት አስውቦ

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ',
      lyrics_transliteration = 'CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 1
Lets’dqu barya hognalew
Sageleglew enoralehu
Yeenba zelelan yaqefew
Aynem ellta terefew

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 2
Deldayu medaf dersolgn
Teraraw meda honelgn
Aynochen kegud gardolgn
Kindochen beju yizolgn

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 3
Keegre betach new wejebu
Ahun taytognal wedebu
Selam yinefsal zuriyaye
Ereft honolgn Getaye

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 4
Yebarekegnn barke
Telewet’elgn tarike
Birhanh gefwal diqdqun
Belbe teklwal sendequn

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 5
Teqot’at’rognal mewdedu
Mengede honoal mengedu
Yabeqaw neger qet’lwal
Ch’nqe bemotu teseqlwal

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 6
Yeiyesus hugne min at’aw
Hulun besmu tewet’ahu
Endene mann tagswal
Yiqrta fiqrun albswal

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 7
Maygebagnn adrgo
Yasalefegnn sheshgo
Melkam new lenes melkam
Ts’egaw yagezegn sidekm

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 8
Motkugn sil mihret derbo
Aqomegn behywet aswbo

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yene-mehari-hulun-merishaye'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 1
ለፅድቁ ባርያ ሆኛለው
ሳገለግለው እኖራለሁ
የእንባ ዘለላን ያቀፈው
አይኔም እልልታ ተረፈው

VERSE 2
ደልዳዩ መዳፍ ደርሶልኝ
ተራራው ሜዳ ሆነልኝ
አይኖቼን ከጉድ ጋርዶልኝ
ክንዶቼን በጁ ይዞልኝ

VERSE 3
ከእግሬ በታች ነው ወጀቡ
አሁን ታይቶኛል ወደቡ
ሰላም ይነፍሳል ዙሪያዬ
እረፍት ሆኖልኝ ጌታዬ

VERSE 4
የባረከኝን ባርኬ
ተለወጠልኝ ታሪኬ
ብርሃንህ ገፏል ድቅድቁን
በልቤ ተክሏል ሰንደቁን

VERSE 5
ተቆጣጥሮኛል መውደዱ
መንገዴ ሆኖአል መንገዱ
ያበቃው ነገር ቀጥሏል
ጭንቄ በሞቱ ተሰቅሏል

VERSE 6
የኢየሱስ ሁኝዔ ምን አጣው
ሁሉን በስሙ ተወጣሁ
እንደኔ ማንን ታግሷል
ይቅርታ ፍቅሩን አልብሷል

VERSE 7
ማይገባኝን አድርጎ
ያሳለፈኝን ሸሽጎ
መልካም ነው ለኔስ መልካም
ፀጋው ያገዘኝ ስደክም

VERSE 8
ሞትኩኝ ስል ምህረት ደርቦ
አቆመኝ በሕይወት አስውቦ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 1
Lets’dqu barya hognalew
Sageleglew enoralehu
Yeenba zelelan yaqefew
Aynem ellta terefew

VERSE 2
Deldayu medaf dersolgn
Teraraw meda honelgn
Aynochen kegud gardolgn
Kindochen beju yizolgn

VERSE 3
Keegre betach new wejebu
Ahun taytognal wedebu
Selam yinefsal zuriyaye
Ereft honolgn Getaye

VERSE 4
Yebarekegnn barke
Telewet’elgn tarike
Birhanh gefwal diqdqun
Belbe teklwal sendequn

VERSE 5
Teqot’at’rognal mewdedu
Mengede honoal mengedu
Yabeqaw neger qet’lwal
Ch’nqe bemotu teseqlwal

VERSE 6
Yeiyesus hugne min at’aw
Hulun besmu tewet’ahu
Endene mann tagswal
Yiqrta fiqrun albswal

VERSE 7
Maygebagnn adrgo
Yasalefegnn sheshgo
Melkam new lenes melkam
Ts’egaw yagezegn sidekm

VERSE 8
Motkugn sil mihret derbo
Aqomegn behywet aswbo'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yene-mehari-hulun-merishaye', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yene Mehari Hulun Merishaye (yene-mehari-hulun-merishaye-1840)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 1
ለፅድቁ ባርያ ሆኛለው
ሳገለግለው እኖራለሁ
የእንባ ዘለላን ያቀፈው
አይኔም እልልታ ተረፈው

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 2
ደልዳዩ መዳፍ ደርሶልኝ
ተራራው ሜዳ ሆነልኝ
አይኖቼን ከጉድ ጋርዶልኝ
ክንዶቼን በጁ ይዞልኝ

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 3
ከእግሬ በታች ነው ወጀቡ
አሁን ታይቶኛል ወደቡ
ሰላም ይነፍሳል ዙሪያዬ
እረፍት ሆኖልኝ ጌታዬ

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 4
የባረከኝን ባርኬ
ተለወጠልኝ ታሪኬ
ብርሃንህ ገፏል ድቅድቁን
በልቤ ተክሏል ሰንደቁን

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 5
ተቆጣጥሮኛል መውደዱ
መንገዴ ሆኖአል መንገዱ
ያበቃው ነገር ቀጥሏል
ጭንቄ በሞቱ ተሰቅሏል

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 6
የኢየሱስ ሁኝዔ ምን አጣው
ሁሉን በስሙ ተወጣሁ
እንደኔ ማንን ታግሷል
ይቅርታ ፍቅሩን አልብሷል

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 7
ማይገባኝን አድርጎ
ያሳለፈኝን ሸሽጎ
መልካም ነው ለኔስ መልካም
ፀጋው ያገዘኝ ስደክም

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 8
ሞትኩኝ ስል ምህረት ደርቦ
አቆመኝ በሕይወት አስውቦ

CHORUS
የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ',
      lyrics_transliteration = 'CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 1
Lets’dqu barya hognalew
Sageleglew enoralehu
Yeenba zelelan yaqefew
Aynem ellta terefew

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 2
Deldayu medaf dersolgn
Teraraw meda honelgn
Aynochen kegud gardolgn
Kindochen beju yizolgn

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 3
Keegre betach new wejebu
Ahun taytognal wedebu
Selam yinefsal zuriyaye
Ereft honolgn Getaye

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 4
Yebarekegnn barke
Telewet’elgn tarike
Birhanh gefwal diqdqun
Belbe teklwal sendequn

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 5
Teqot’at’rognal mewdedu
Mengede honoal mengedu
Yabeqaw neger qet’lwal
Ch’nqe bemotu teseqlwal

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 6
Yeiyesus hugne min at’aw
Hulun besmu tewet’ahu
Endene mann tagswal
Yiqrta fiqrun albswal

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 7
Maygebagnn adrgo
Yasalefegnn sheshgo
Melkam new lenes melkam
Ts’egaw yagezegn sidekm

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 8
Motkugn sil mihret derbo
Aqomegn behywet aswbo

CHORUS
Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yene-mehari-hulun-merishaye-1840'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የኔ መሃሪ ሁሉን መርሻዬ ሁሉን መርሻዬ
እንደ ሕልም አልፏል ትላንትናዬ ባንተ ጌታዬ
አዳፋው ልብሴ ከነፃ
ከእዳ ከፈታኝ በነፃ

VERSE 1
ለፅድቁ ባርያ ሆኛለው
ሳገለግለው እኖራለሁ
የእንባ ዘለላን ያቀፈው
አይኔም እልልታ ተረፈው

VERSE 2
ደልዳዩ መዳፍ ደርሶልኝ
ተራራው ሜዳ ሆነልኝ
አይኖቼን ከጉድ ጋርዶልኝ
ክንዶቼን በጁ ይዞልኝ

VERSE 3
ከእግሬ በታች ነው ወጀቡ
አሁን ታይቶኛል ወደቡ
ሰላም ይነፍሳል ዙሪያዬ
እረፍት ሆኖልኝ ጌታዬ

VERSE 4
የባረከኝን ባርኬ
ተለወጠልኝ ታሪኬ
ብርሃንህ ገፏል ድቅድቁን
በልቤ ተክሏል ሰንደቁን

VERSE 5
ተቆጣጥሮኛል መውደዱ
መንገዴ ሆኖአል መንገዱ
ያበቃው ነገር ቀጥሏል
ጭንቄ በሞቱ ተሰቅሏል

VERSE 6
የኢየሱስ ሁኝዔ ምን አጣው
ሁሉን በስሙ ተወጣሁ
እንደኔ ማንን ታግሷል
ይቅርታ ፍቅሩን አልብሷል

VERSE 7
ማይገባኝን አድርጎ
ያሳለፈኝን ሸሽጎ
መልካም ነው ለኔስ መልካም
ፀጋው ያገዘኝ ስደክም

VERSE 8
ሞትኩኝ ስል ምህረት ደርቦ
አቆመኝ በሕይወት አስውቦ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yene mehari hulun mershaye hulun mershaye
Ende hilm alfwal tilantnaye bante Getaye
Adafaw libse kenets’a
Keeda kefetagn benets’a

VERSE 1
Lets’dqu barya hognalew
Sageleglew enoralehu
Yeenba zelelan yaqefew
Aynem ellta terefew

VERSE 2
Deldayu medaf dersolgn
Teraraw meda honelgn
Aynochen kegud gardolgn
Kindochen beju yizolgn

VERSE 3
Keegre betach new wejebu
Ahun taytognal wedebu
Selam yinefsal zuriyaye
Ereft honolgn Getaye

VERSE 4
Yebarekegnn barke
Telewet’elgn tarike
Birhanh gefwal diqdqun
Belbe teklwal sendequn

VERSE 5
Teqot’at’rognal mewdedu
Mengede honoal mengedu
Yabeqaw neger qet’lwal
Ch’nqe bemotu teseqlwal

VERSE 6
Yeiyesus hugne min at’aw
Hulun besmu tewet’ahu
Endene mann tagswal
Yiqrta fiqrun albswal

VERSE 7
Maygebagnn adrgo
Yasalefegnn sheshgo
Melkam new lenes melkam
Ts’egaw yagezegn sidekm

VERSE 8
Motkugn sil mihret derbo
Aqomegn behywet aswbo'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yene-mehari-hulun-merishaye-1840', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yene Tamagn Wedaj (yene-tamagn-wedaj)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
መልአከ ፍሥሓ - ደስታን ''የሚያቀዳጅ
ቅዱስ ሚካኤል ነው - የኔ ታማኝ ወዳጅ
መልአኩ እንባዬን- ካ''ይኔ አብሶልኛል
ሚካኤል አባቴ - ለኔ ደርሶልኛል(፪)

VERSE 1
''ማዋየው ወዳጄ - እኔ ''ማማክረው
ሳዝን ስደሰትም - የልቤን ''ምነግረው
የሕይወት መንገዴን - የሚያቀናልኝ
ለእኔስ አባቴ - ሚካኤል አለልኝ

CHORUS
መልአከ ፍሥሓ - ደስታን ''የሚያቀዳጅ
ቅዱስ ሚካኤል ነው - የኔ ታማኝ ወዳጅ
መልአኩ እንባዬን- ካ''ይኔ አብሶልኛል
ሚካኤል አባቴ - ለኔ ደርሶልኛል(፪)

VERSE 2
ፍጹም ካ''ጠገቤ -ከጎኔ አይርቅም
ሳላመሰግነው - ፀሓይ አትጠልቅም
ድንቅ አድራጊ መላክ - ለክብር ሚያበቃ
ማዕረጌ ሆኗል - የኔ ዋስ ጠበቃ

CHORUS
መልአከ ፍሥሓ - ደስታን ''የሚያቀዳጅ
ቅዱስ ሚካኤል ነው - የኔ ታማኝ ወዳጅ
መልአኩ እንባዬን- ካ''ይኔ አብሶልኛል
ሚካኤል አባቴ - ለኔ ደርሶልኛል(፪)

VERSE 3
በአክናፉ ከክፉ - ከልሎ የጠበቀኝ
ለቅኔው ያተጋኝ - ለስሙ እንድቀኝ
ማለዳ ቀስቅሶ - ደጁ የሚወስደኝ
በእግዚአብሔር ፊት ቆሞ - የሚያማልደኝ

CHORUS
መልአከ ፍሥሓ - ደስታን ''የሚያቀዳጅ
ቅዱስ ሚካኤል ነው - የኔ ታማኝ ወዳጅ
መልአኩ እንባዬን- ካ''ይኔ አብሶልኛል
ሚካኤል አባቴ - ለኔ ደርሶልኛል(፪)

VERSE 4
በክብር የተሾመ - ዘንዶውን ተዋግቶ
ዘውትር ''ሚጠብቀኝ - ክንፎቹን ዘርግቶ
ሚካኤል እያለ - አፌ ይዘምራል
ስሙን ስጠራ - ጠላት ይሸበራል።

CHORUS
መልአከ ፍሥሓ - ደስታን ''የሚያቀዳጅ
ቅዱስ ሚካኤል ነው - የኔ ታማኝ ወዳጅ
መልአኩ እንባዬን- ካ''ይኔ አብሶልኛል
ሚካኤል አባቴ - ለኔ ደርሶልኛል(፪)',
      lyrics_transliteration = 'CHORUS
Melake fisha - destan ''yemiyaqedaj
Kidus Mikael new - yene tamagn wedaj
Melaku enbayen- ka''yine absolgnal
Mikael abate - lene dersolgnal (2)

VERSE 1
''mawayew wedaje - ene ''mamakrew
Sazn sidesetm - yelben ''minegrew
Yehywet mengeden - yemiyaqenalgn
Leenes abate - Mikael alelgn

CHORUS
Melake fisha - destan ''yemiyaqedaj
Kidus Mikael new - yene tamagn wedaj
Melaku enbayen- ka''yine absolgnal
Mikael abate - lene dersolgnal (2)

VERSE 2
Fits’um ka''t’egebe -kegone ayrqm
Salamesegnew - ts’ehay att’elqm
Dinq adragi melak - lekbr miyabeqa
Maerege honwal - yene was t’ebeqa

CHORUS
Melake fisha - destan ''yemiyaqedaj
Kidus Mikael new - yene tamagn wedaj
Melaku enbayen- ka''yine absolgnal
Mikael abate - lene dersolgnal (2)

VERSE 3
Beaknafu kekfu - kello yet’ebeqegn
Leqnew yategagn - lesmu endqegn
Maleda qesqso - deju yemiwesdegn
BeEgziabher fit qomo - yemiyamaldegn

CHORUS
Melake fisha - destan ''yemiyaqedaj
Kidus Mikael new - yene tamagn wedaj
Melaku enbayen- ka''yine absolgnal
Mikael abate - lene dersolgnal (2)

VERSE 4
Bekbr yeteshome - zendown tewagto
Zewtr ''mit’ebqegn - kinfochun zergto
Mikael eyale - afe yizemral
Simun sit’era - t’elat yisheberal.

CHORUS
Melake fisha - destan ''yemiyaqedaj
Kidus Mikael new - yene tamagn wedaj
Melaku enbayen- ka''yine absolgnal
Mikael abate - lene dersolgnal (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yene-tamagn-wedaj'
    AND lyrics_amharic IS NOT DISTINCT FROM 'መልአከ ፍሥሓ - ደስታን ''የሚያቀዳጅ
ቅዱስ ሚካኤል ነው - የኔ ታማኝ ወዳጅ
መልአኩ እንባዬን- ካ''ይኔ አብሶልኛል
ሚካኤል አባቴ - ለኔ ደርሶልኛል(፪)

VERSE 1
''ማዋየው ወዳጄ - እኔ ''ማማክረው
ሳዝን ስደሰትም - የልቤን ''ምነግረው
የሕይወት መንገዴን - የሚያቀናልኝ
ለእኔስ አባቴ - ሚካኤል አለልኝ

VERSE 2
ፍጹም ካ''ጠገቤ -ከጎኔ አይርቅም
ሳላመሰግነው - ፀሓይ አትጠልቅም
ድንቅ አድራጊ መላክ - ለክብር ሚያበቃ
ማዕረጌ ሆኗል - የኔ ዋስ ጠበቃ

VERSE 3
በአክናፉ ከክፉ - ከልሎ የጠበቀኝ
ለቅኔው ያተጋኝ - ለስሙ እንድቀኝ
ማለዳ ቀስቅሶ - ደጁ የሚወስደኝ
በእግዚአብሔር ፊት ቆሞ - የሚያማልደኝ

VERSE 4
በክብር የተሾመ - ዘንዶውን ተዋግቶ
ዘውትር ''ሚጠብቀኝ - ክንፎቹን ዘርግቶ
ሚካኤል እያለ - አፌ ይዘምራል
ስሙን ስጠራ - ጠላት ይሸበራል።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Melake fisha - destan ''yemiyaqedaj
Kidus Mikael new - yene tamagn wedaj
Melaku enbayen- ka''yine absolgnal
Mikael abate - lene dersolgnal (2)

VERSE 1
''mawayew wedaje - ene ''mamakrew
Sazn sidesetm - yelben ''minegrew
Yehywet mengeden - yemiyaqenalgn
Leenes abate - Mikael alelgn

VERSE 2
Fits’um ka''t’egebe -kegone ayrqm
Salamesegnew - ts’ehay att’elqm
Dinq adragi melak - lekbr miyabeqa
Maerege honwal - yene was t’ebeqa

VERSE 3
Beaknafu kekfu - kello yet’ebeqegn
Leqnew yategagn - lesmu endqegn
Maleda qesqso - deju yemiwesdegn
BeEgziabher fit qomo - yemiyamaldegn

VERSE 4
Bekbr yeteshome - zendown tewagto
Zewtr ''mit’ebqegn - kinfochun zergto
Mikael eyale - afe yizemral
Simun sit’era - t’elat yisheberal.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yene-tamagn-wedaj', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yepetirosin Eniba (yepetirosin-eniba)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ

VERSE 1
ቸርነትህ በዝቶ ምህረት ቢያሰጠኝ
እጆቼን ዘርግቼ እማጸናለሁኝ
ደምህ የፈሰሰው ለኔ ስለሆነ /2/
በኃጢአት ልትተወኝ ልብህ አልጨከነም

CHORUS
የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ

VERSE 2
ዓለማዊ ምግባር ልቤ ቢከተልም
ከዚህ ሁሉ ማዳን ጌታ አይሳንህም
ኃጢአት እየሰራሁኝ ባስቀይምህም/2/
በሂሶጵ እርጨኝ ጌታ እጠበኝ እባክህ

CHORUS
የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ

VERSE 3
ዲያቢሎስ ያመጣው ጸጸቴ ውድቀት ነው
የይሁዳ ምሬት የሞት ነው ፍፃሜው
ይህንን መማረር እኔ አልፈልግም /2/
የውድቀት ጉዞ እንጂ ትንሳኤ የለውም

CHORUS
የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ

VERSE 4
ጴጥሮስ አባ ብሎ የተማጸነበት
ፍቅሩን በንስሀ ስቦ ያመጣበት
ፍጻሜው የሚያምር ንስሀ ስጠኝ /2/
የልቅሶ አምሐ የእንባን ህይወት ስጠኝ

CHORUS
የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ',
      lyrics_transliteration = 'CHORUS
Yep’et’rosn enba sit’egn elhelehu
Hat’iaten linazez fiqrhn eyayehu
Bemot t’la wist’ enkwan bihed Geta hoy (2)
Liben befqr wiha et’ebew ebakh

VERSE 1
Cherneth bezto mihret biyaset’egn
Ejochen zergche emats’enalehugn
Demh yefesesew lene silehone (2)
Behat’iat littewegn libh alch’ekenem

CHORUS
Yep’et’rosn enba sit’egn elhelehu
Hat’iaten linazez fiqrhn eyayehu
Bemot t’la wist’ enkwan bihed Geta hoy (2)
Liben befqr wiha et’ebew ebakh

VERSE 2
Alemawi migbar libe biketelm
Kezih hulu madan Geta aysanhm
Hat’iat eyeserahugn basqeymhm (2)
Behisop’ erch’egn Geta et’ebegn ebakh

CHORUS
Yep’et’rosn enba sit’egn elhelehu
Hat’iaten linazez fiqrhn eyayehu
Bemot t’la wist’ enkwan bihed Geta hoy (2)
Liben befqr wiha et’ebew ebakh

VERSE 3
Diyabilos yamet’aw ts’ets’ete widqet new
Yeyhuda miret yemot new fits’amew
Yihnn memarer ene alfelgm (2)
Yewdqet guzo enji tinsae yelewm

CHORUS
Yep’et’rosn enba sit’egn elhelehu
Hat’iaten linazez fiqrhn eyayehu
Bemot t’la wist’ enkwan bihed Geta hoy (2)
Liben befqr wiha et’ebew ebakh

VERSE 4
P’et’ros aba bilo yetemats’enebet
Fiqrun benshe sibo yamet’abet
Fits’amew yemiyamr nishe sit’egn (2)
Yelqso amhe yeenban hiywet sit’egn

CHORUS
Yep’et’rosn enba sit’egn elhelehu
Hat’iaten linazez fiqrhn eyayehu
Bemot t’la wist’ enkwan bihed Geta hoy (2)
Liben befqr wiha et’ebew ebakh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yepetirosin-eniba'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የጴጥሮስን እንባ ስጠኝ እልሀለሁ
ኃጢአቴን ልናዘዝ ፍቅርህን እያየሁ
በሞት ጥላ ውስጥ እንኳን ብሄድ ጌታ ሆይ /2/
ልቤን በፍቅር ውሃ እጠበው እባክህ

VERSE 1
ቸርነትህ በዝቶ ምህረት ቢያሰጠኝ
እጆቼን ዘርግቼ እማጸናለሁኝ
ደምህ የፈሰሰው ለኔ ስለሆነ /2/
በኃጢአት ልትተወኝ ልብህ አልጨከነም

VERSE 2
ዓለማዊ ምግባር ልቤ ቢከተልም
ከዚህ ሁሉ ማዳን ጌታ አይሳንህም
ኃጢአት እየሰራሁኝ ባስቀይምህም/2/
በሂሶጵ እርጨኝ ጌታ እጠበኝ እባክህ

VERSE 3
ዲያቢሎስ ያመጣው ጸጸቴ ውድቀት ነው
የይሁዳ ምሬት የሞት ነው ፍፃሜው
ይህንን መማረር እኔ አልፈልግም /2/
የውድቀት ጉዞ እንጂ ትንሳኤ የለውም

VERSE 4
ጴጥሮስ አባ ብሎ የተማጸነበት
ፍቅሩን በንስሀ ስቦ ያመጣበት
ፍጻሜው የሚያምር ንስሀ ስጠኝ /2/
የልቅሶ አምሐ የእንባን ህይወት ስጠኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yep’et’rosn enba sit’egn elhelehu
Hat’iaten linazez fiqrhn eyayehu
Bemot t’la wist’ enkwan bihed Geta hoy (2)
Liben befqr wiha et’ebew ebakh

VERSE 1
Cherneth bezto mihret biyaset’egn
Ejochen zergche emats’enalehugn
Demh yefesesew lene silehone (2)
Behat’iat littewegn libh alch’ekenem

VERSE 2
Alemawi migbar libe biketelm
Kezih hulu madan Geta aysanhm
Hat’iat eyeserahugn basqeymhm (2)
Behisop’ erch’egn Geta et’ebegn ebakh

VERSE 3
Diyabilos yamet’aw ts’ets’ete widqet new
Yeyhuda miret yemot new fits’amew
Yihnn memarer ene alfelgm (2)
Yewdqet guzo enji tinsae yelewm

VERSE 4
P’et’ros aba bilo yetemats’enebet
Fiqrun benshe sibo yamet’abet
Fits’amew yemiyamr nishe sit’egn (2)
Yelqso amhe yeenban hiywet sit’egn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yepetirosin-eniba', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yeramaw Le’ul Gebriel (yeramaw-gebriel)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 1
ብርሃን ልብሱ እሳታዊ መልአክ
አንተ አማልደን ከመሃሪው አምላክ /2/

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 2
የምስራች ነጋሪ ድንቅ ልደት አብሳሪ
የጽድቅ ፋና የምህረት ጎዳና /2/

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 3
ላመኑብህ ለተማጸኑብህ
ፈጥኖ ደራሽ አለኝታቸው ነህ /2/

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 4
የአናንያ የአዛርያ የሚሳኤል ከለላቸው
ከእሳት ነበልባል ያዳንካቸው /2/

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 5
ምሰሶ አምባችን መጠጊያችን
ቅዱስ ገብርኤል ጠባቂያችን /2/

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 6
ዕለት ዕለት የምንማልድህ
ልጀችህን ይምራን መንፈስህ

CHORUS
የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/',
      lyrics_transliteration = 'CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 1
Birhan libsu esatawi mel’ak
Ante amalden ke-mehariw amlak (x2)

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 2
Yemesrach negari dinq lidet absari
Yetsidk fana yemihret godana (x2)

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 3
Lamenubih letemats’enubih
Fet’eno derash aleñtachew neh (x2)

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 4
YeAnanya yeAzarya yeMisa’el kelelatchew
Ke’esat nebelbal yadanekatchew (x2)

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 5
Miseso ambachin metegiyachin
Qidus Gebriel tebaqiyachin (x2)

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 6
Elet elet yeminmaldih
Lijetchihin yimran menfesih

CHORUS
Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yeramaw-gebriel'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የራማው ልዑል ገብርኤል /2/
ተመላለስ መሀላችን ስምህን ጠርተን ና ስንል /2/

VERSE 1
ብርሃን ልብሱ እሳታዊ መልአክ
አንተ አማልደን ከመሃሪው አምላክ /2/

VERSE 2
የምስራች ነጋሪ ድንቅ ልደት አብሳሪ
የጽድቅ ፋና የምህረት ጎዳና /2/

VERSE 3
ላመኑብህ ለተማጸኑብህ
ፈጥኖ ደራሽ አለኝታቸው ነህ /2/

VERSE 4
የአናንያ የአዛርያ የሚሳኤል ከለላቸው
ከእሳት ነበልባል ያዳንካቸው /2/

VERSE 5
ምሰሶ አምባችን መጠጊያችን
ቅዱስ ገብርኤል ጠባቂያችን /2/

VERSE 6
ዕለት ዕለት የምንማልድህ
ልጀችህን ይምራን መንፈስህ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yeramaw le’ul Gebriel (x2)
Temelales mehalachin simehn terten na sinil (x2)

VERSE 1
Birhan libsu esatawi mel’ak
Ante amalden ke-mehariw amlak (x2)

VERSE 2
Yemesrach negari dinq lidet absari
Yetsidk fana yemihret godana (x2)

VERSE 3
Lamenubih letemats’enubih
Fet’eno derash aleñtachew neh (x2)

VERSE 4
YeAnanya yeAzarya yeMisa’el kelelatchew
Ke’esat nebelbal yadanekatchew (x2)

VERSE 5
Miseso ambachin metegiyachin
Qidus Gebriel tebaqiyachin (x2)

VERSE 6
Elet elet yeminmaldih
Lijetchihin yimran menfesih'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yeramaw-gebriel', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yeramaw Liul (yeramaw-liul)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 1
‎
‎ለሰላስቱ ደቂቅ- ገብርኤል ስለው
እሳትን አጥፍቷል-ገብርኤል ስለው
ችግሬም በፊቱ-ገብርኤል ስለው

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 2
እንደ ሰም ይቀልጣል-ገብርኤል ስለው
ሕይወቴን በሙሉ ውብ አርገኽልኛል
ገብርኤል አባቴ ስልህ ደስ ይለኛል
መልካም ዜና ይዞ-ገብርኤል ስለው

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 3
ለምህረት የሚመጣ-ገብርኤል ስለው
የራማው ልዑል ነው-ገብርኤል ስለው
ከጭንቅ የሚያወጣ-ገብርኤል ስለው
‎ሕወቴን በሙሉ ውብ አረገኽልኛል

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 4
‎ገብርኤል አባቴ ስልህ ደስስ ይለኛል
‎

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 5
‎- ከደጁ አድጊያለሁ- ገብርኤል ስለው
‎ስሙን እየጠራው -ገብርኤል ስለው
‎- ሕይወቴን ባርኮልኝ-ገብርኤል ስለው
‎ዛሬም ዘምራለሁ-ገብርኤል ስለው

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 6
‎ሕወቴን በሙሉ ውብ አረገኽልኛል
‎ገብርኤል አባቴ ስልህ ደስስ ይለኛል
‎

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 7
‎የጎደላኝ የለም-ገብርኤል ስለው
‎ሰላም ሰፍኖልኛል-ገብርኤል ስለው
‎ከጌታ ፊት ሚቆም-ገብርኤል ስለው
‎ገብርኤል ደርሶርልኛል-ገብርኤል ስለው

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 8
‎ሕወቴን በሙሉ ውብ አረገኽልኛል
‎ገብርኤል አባቴ ስልህ ደስስ ይለኛል
‎

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ',
      lyrics_transliteration = 'CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 1
‎
‎leselastu deqiq- Gebriel silew
Esatn at’ftwal-Gebriel silew
Chgrem befitu-Gebriel silew

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 2
Ende sem yiqelt’al-Gebriel silew
Hiyweten bemulu wib argeኽlgnal
Gebriel abate silh des yilegnal
Melkam zena yizo-Gebriel silew

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 3
Lemhret yemimet’a-Gebriel silew
Yeramaw liul new-Gebriel silew
Kech’nq yemiyawet’a-Gebriel silew
‎hweten bemulu wib aregeኽlgnal

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 4
‎Gebriel abate silh dess yilegnal
‎

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 5
‎- kedeju adgiyalehu- Gebriel silew
‎smun eyet’eraw -Gebriel silew
‎- hiyweten barkolgn-Gebriel silew
‎zarem zemralehu-Gebriel silew

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 6
‎hweten bemulu wib aregeኽlgnal
‎Gebriel abate silh dess yilegnal
‎

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 7
‎yegodelagn yelem-Gebriel silew
‎selam sefnolgnal-Gebriel silew
‎kegeta fit miqom-Gebriel silew
‎Gebriel dersorlgnal-Gebriel silew

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 8
‎hweten bemulu wib aregeኽlgnal
‎Gebriel abate silh dess yilegnal
‎

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yeramaw-liul'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 1
‎
‎ለሰላስቱ ደቂቅ- ገብርኤል ስለው
እሳትን አጥፍቷል-ገብርኤል ስለው
ችግሬም በፊቱ-ገብርኤል ስለው

VERSE 2
እንደ ሰም ይቀልጣል-ገብርኤል ስለው
ሕይወቴን በሙሉ ውብ አርገኽልኛል
ገብርኤል አባቴ ስልህ ደስ ይለኛል
መልካም ዜና ይዞ-ገብርኤል ስለው

VERSE 3
ለምህረት የሚመጣ-ገብርኤል ስለው
የራማው ልዑል ነው-ገብርኤል ስለው
ከጭንቅ የሚያወጣ-ገብርኤል ስለው
‎ሕወቴን በሙሉ ውብ አረገኽልኛል

VERSE 4
‎ገብርኤል አባቴ ስልህ ደስስ ይለኛል
‎

VERSE 5
‎- ከደጁ አድጊያለሁ- ገብርኤል ስለው
‎ስሙን እየጠራው -ገብርኤል ስለው
‎- ሕይወቴን ባርኮልኝ-ገብርኤል ስለው
‎ዛሬም ዘምራለሁ-ገብርኤል ስለው

VERSE 6
‎ሕወቴን በሙሉ ውብ አረገኽልኛል
‎ገብርኤል አባቴ ስልህ ደስስ ይለኛል
‎

VERSE 7
‎የጎደላኝ የለም-ገብርኤል ስለው
‎ሰላም ሰፍኖልኛል-ገብርኤል ስለው
‎ከጌታ ፊት ሚቆም-ገብርኤል ስለው
‎ገብርኤል ደርሶርልኛል-ገብርኤል ስለው

VERSE 8
‎ሕወቴን በሙሉ ውብ አረገኽልኛል
‎ገብርኤል አባቴ ስልህ ደስስ ይለኛል
‎'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 1
‎
‎leselastu deqiq- Gebriel silew
Esatn at’ftwal-Gebriel silew
Chgrem befitu-Gebriel silew

VERSE 2
Ende sem yiqelt’al-Gebriel silew
Hiyweten bemulu wib argeኽlgnal
Gebriel abate silh des yilegnal
Melkam zena yizo-Gebriel silew

VERSE 3
Lemhret yemimet’a-Gebriel silew
Yeramaw liul new-Gebriel silew
Kech’nq yemiyawet’a-Gebriel silew
‎hweten bemulu wib aregeኽlgnal

VERSE 4
‎Gebriel abate silh dess yilegnal
‎

VERSE 5
‎- kedeju adgiyalehu- Gebriel silew
‎smun eyet’eraw -Gebriel silew
‎- hiyweten barkolgn-Gebriel silew
‎zarem zemralehu-Gebriel silew

VERSE 6
‎hweten bemulu wib aregeኽlgnal
‎Gebriel abate silh dess yilegnal
‎

VERSE 7
‎yegodelagn yelem-Gebriel silew
‎selam sefnolgnal-Gebriel silew
‎kegeta fit miqom-Gebriel silew
‎Gebriel dersorlgnal-Gebriel silew

VERSE 8
‎hweten bemulu wib aregeኽlgnal
‎Gebriel abate silh dess yilegnal
‎'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yeramaw-liul', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yerasen Tsegur Kutirun Yawikewal (yerasen-tsegur-kutirun-yawikewal)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 1
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 2
ስለምግብና ስለምለብሰው
ብዙ ብጨነቅ ጥቅሙ ምንድነው
አበባን ለምድር ምግብን ለወፎች
የሚሰጥ አባት አለኝ ሳይሰለች

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 3
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 4
የማያምኑትን ስሙን ሳያውቁ
የሚያገኙትን ሳይጨነቁ
ስለምን ልድከም በከንቱ መሻት
እያለ ጌታ ያዳነኝ ከሞት

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 5
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 6
የክፉዎች ሰልፍ ቢሰፍር በላዬ
ዝናሩን ታጥቆ ቢዝት ገዳዬ
በሞት ጥላ ውስጥ ብጓዝ ብሔድም
የሚጠብቀኝ አያንቀላፋም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 7
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 8
ሀሳቤን ልጣል በእረኛዬ
በሚያሰማራኝ ቸር ጠባቂዬ
ከበረከት ምንጭ አያሳጣኝም
በግ ስለራሱ ተጨንቆ አያውቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 9
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 10
መንግስቱን ልሻ ልፈልግ ፅድቁን
ስለሚሰጠኝ ጌታ ሌላውን
ስለሚጨነቅ ነገ ለራሱ
ላመስግን ዛሬ ታምኜ በእርሱ

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 11
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 12
እግዚአብሔር አለ አልጨነቅም

CHORUS
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም',
      lyrics_transliteration = 'CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 1
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher yawqal alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 2
Silemgbna silemlebsew
Bizu bich’eneq t’qmu mindnew
Abeban lemdr migbn lewefoch
Yemiset’ abat alegn sayselech

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 3
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher yawqal alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 4
Yemayamnutn simun sayawqu
Yemiyagegnutn saych’enequ
Silemn lidkem bekentu meshat
Eyale Geta yadanegn kemot

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 5
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 6
Yekfuwoch self bisefr belaye
Zinarun tat’qo bizt gedaye
Bemot t’la wist’ bigwaz bihedm
Yemit’ebqegn ayanqelafam

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 7
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher yawqal alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 8
Hesaben lit’al beeregnaye
Bemiyasemaragn cher t’ebaqiye
Kebereket minch’ ayasat’agnm
Beg silerasu tech’enqo ayawqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 9
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher yawqal alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 10
Mengstun lisha lifelg ts’dqun
Silemiset’egn Geta lelawn
Silemich’eneq nege lerasu
Lamesgn zare tamgne beersu

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 11
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher yawqal alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 12
Egziabher ale alch’eneqm

CHORUS
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yerasen-tsegur-kutirun-yawikewal'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 1
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

VERSE 2
ስለምግብና ስለምለብሰው
ብዙ ብጨነቅ ጥቅሙ ምንድነው
አበባን ለምድር ምግብን ለወፎች
የሚሰጥ አባት አለኝ ሳይሰለች

VERSE 3
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

VERSE 4
የማያምኑትን ስሙን ሳያውቁ
የሚያገኙትን ሳይጨነቁ
ስለምን ልድከም በከንቱ መሻት
እያለ ጌታ ያዳነኝ ከሞት

VERSE 5
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር አለ አልጨነቅም

VERSE 6
የክፉዎች ሰልፍ ቢሰፍር በላዬ
ዝናሩን ታጥቆ ቢዝት ገዳዬ
በሞት ጥላ ውስጥ ብጓዝ ብሔድም
የሚጠብቀኝ አያንቀላፋም

VERSE 7
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

VERSE 8
ሀሳቤን ልጣል በእረኛዬ
በሚያሰማራኝ ቸር ጠባቂዬ
ከበረከት ምንጭ አያሳጣኝም
በግ ስለራሱ ተጨንቆ አያውቅም

VERSE 9
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

VERSE 10
መንግስቱን ልሻ ልፈልግ ፅድቁን
ስለሚሰጠኝ ጌታ ሌላውን
ስለሚጨነቅ ነገ ለራሱ
ላመስግን ዛሬ ታምኜ በእርሱ

VERSE 11
የራሴን ፀጉር ቁጥሩን ያውቀዋል
የእጁ ስራ ነኝ መች ይረሳኛል
የልቤ መሻት ዛሬ ባይሞላም
እግዚአብሔር ያውቃል አልጨነቅም

VERSE 12
እግዚአብሔር አለ አልጨነቅም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 1
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher yawqal alch’eneqm

VERSE 2
Silemgbna silemlebsew
Bizu bich’eneq t’qmu mindnew
Abeban lemdr migbn lewefoch
Yemiset’ abat alegn sayselech

VERSE 3
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher yawqal alch’eneqm

VERSE 4
Yemayamnutn simun sayawqu
Yemiyagegnutn saych’enequ
Silemn lidkem bekentu meshat
Eyale Geta yadanegn kemot

VERSE 5
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher ale alch’eneqm

VERSE 6
Yekfuwoch self bisefr belaye
Zinarun tat’qo bizt gedaye
Bemot t’la wist’ bigwaz bihedm
Yemit’ebqegn ayanqelafam

VERSE 7
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher yawqal alch’eneqm

VERSE 8
Hesaben lit’al beeregnaye
Bemiyasemaragn cher t’ebaqiye
Kebereket minch’ ayasat’agnm
Beg silerasu tech’enqo ayawqm

VERSE 9
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher yawqal alch’eneqm

VERSE 10
Mengstun lisha lifelg ts’dqun
Silemiset’egn Geta lelawn
Silemich’eneq nege lerasu
Lamesgn zare tamgne beersu

VERSE 11
Yerasen ts’egur qut’run yawqewal
Yeeju sira negn mech yiresagnal
Yelbe meshat zare baymolam
Egziabher yawqal alch’eneqm

VERSE 12
Egziabher ale alch’eneqm'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yerasen-tsegur-kutirun-yawikewal', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yeselame sew yalkut (yeselame-sew-yalkut)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡

VERSE 1
ወዳጄ ብዬ ያልኩት ታዲያ ዛሬ የት አለ፡
የታል ወዳጄ የታል አምጡልኝ የልቤን ሰው፡
ፍቅሩ ቢጎድልብኝ ነው እንባዬን የማፈሰው፡፡
በጭራሽ እንዳልከፋዉ ስሲቅ ሲጫወት ውሎ፡

CHORUS
የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡

VERSE 2
አመሻሹ ላይ ወጣ አቤት የቀን ጎደሎ፡
አቤት የቀን ክፋቱ ማን ይህን ጠረጠረ፡
ወዳጄ ማነው ታዲያ ገንዘብ ሰው ከቀየረ፡፡
መሃላ ቃልኪዳኑ ያ ሁሉ ብዙ ቃላት፡

CHORUS
የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡

VERSE 3
ዛሬ ሁሉም ተረሳ ተዘነጋ እንደዘበት፡
የት አለ መዋደዳችን የት አለ የጥንቱ ፍቅር፡
ቀና ማለት ይሻላል በድሎ ከማቀርቀር፡፡
ሰላሳ ዲናር ወስዶ ይሳምም ይንከሰኝ፡

CHORUS
የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡

VERSE 4
አፈር ስሆን እያለ አፈር የሚያስበላኝ፡
እርሱን ሰው ይቅር በለው እርሱን ሰው ማርልኝ፡
ይቅር ማለት ሳውቅ ነው ይቅር የምትለኝ፡፡

CHORUS
የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡',
      lyrics_transliteration = 'CHORUS
Yeselame sew yalkut enjerayen yebela
Yeselame sewyalkut wesdo keeje yebela
Wedaje yihuda yetal qerebgn wede hwala (2)
Tilant abrogn nebere ts’waye molto sale

VERSE 1
Wedaje biye yalkut tadiya zare yet ale
Yetal wedaje yetal amt’ulgn yelben sew
Fiqru bigodlbgn new enbayen yemafesew
Bech’rash endalkefawu sisiq sich’awet wilo

CHORUS
Yeselame sew yalkut enjerayen yebela
Yeselame sewyalkut wesdo keeje yebela
Wedaje yihuda yetal qerebgn wede hwala (2)
Tilant abrogn nebere ts’waye molto sale

VERSE 2
Ameshashu lay wet’a abet yeqen godelo
Abet yeqen kifatu man yihn t’eret’ere
Wedaje manew tadiya genzeb sew keqeyere
Mehala qalkidanu ya hulu bizu qalat

CHORUS
Yeselame sew yalkut enjerayen yebela
Yeselame sewyalkut wesdo keeje yebela
Wedaje yihuda yetal qerebgn wede hwala (2)
Tilant abrogn nebere ts’waye molto sale

VERSE 3
Zare hulum teresa tezenega endezebet
Yet ale mewadedachn yet ale yet’ntu fiqr
Qena malet yishalal bedlo kemaqerqer
Selasa dinar wesdo yisamm yinkesegn

CHORUS
Yeselame sew yalkut enjerayen yebela
Yeselame sewyalkut wesdo keeje yebela
Wedaje yihuda yetal qerebgn wede hwala (2)
Tilant abrogn nebere ts’waye molto sale

VERSE 4
Afer sihon eyale afer yemiyasbelagn
Ersun sew yiqr belew ersun sew marlgn
Yiqr malet sawq new yiqr yemtlegn

CHORUS
Yeselame sew yalkut enjerayen yebela
Yeselame sewyalkut wesdo keeje yebela
Wedaje yihuda yetal qerebgn wede hwala (2)
Tilant abrogn nebere ts’waye molto sale',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yeselame-sew-yalkut'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የሰላሜ ሰው ያልኩት እንጀራዬን የበላ፡
የሰላሜ ሰውያልኩት ወስዶ ከእጄ የበላ፡
ወዳጄ ይሁዳ የታል ቀረብኝ ወደ ኋላ፡፡(2)
ትላንት አብሮኝ ነበረ ፅዋዬ ሞልቶ ሳለ፡

VERSE 1
ወዳጄ ብዬ ያልኩት ታዲያ ዛሬ የት አለ፡
የታል ወዳጄ የታል አምጡልኝ የልቤን ሰው፡
ፍቅሩ ቢጎድልብኝ ነው እንባዬን የማፈሰው፡፡
በጭራሽ እንዳልከፋዉ ስሲቅ ሲጫወት ውሎ፡

VERSE 2
አመሻሹ ላይ ወጣ አቤት የቀን ጎደሎ፡
አቤት የቀን ክፋቱ ማን ይህን ጠረጠረ፡
ወዳጄ ማነው ታዲያ ገንዘብ ሰው ከቀየረ፡፡
መሃላ ቃልኪዳኑ ያ ሁሉ ብዙ ቃላት፡

VERSE 3
ዛሬ ሁሉም ተረሳ ተዘነጋ እንደዘበት፡
የት አለ መዋደዳችን የት አለ የጥንቱ ፍቅር፡
ቀና ማለት ይሻላል በድሎ ከማቀርቀር፡፡
ሰላሳ ዲናር ወስዶ ይሳምም ይንከሰኝ፡

VERSE 4
አፈር ስሆን እያለ አፈር የሚያስበላኝ፡
እርሱን ሰው ይቅር በለው እርሱን ሰው ማርልኝ፡
ይቅር ማለት ሳውቅ ነው ይቅር የምትለኝ፡፡'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yeselame sew yalkut enjerayen yebela
Yeselame sewyalkut wesdo keeje yebela
Wedaje yihuda yetal qerebgn wede hwala (2)
Tilant abrogn nebere ts’waye molto sale

VERSE 1
Wedaje biye yalkut tadiya zare yet ale
Yetal wedaje yetal amt’ulgn yelben sew
Fiqru bigodlbgn new enbayen yemafesew
Bech’rash endalkefawu sisiq sich’awet wilo

VERSE 2
Ameshashu lay wet’a abet yeqen godelo
Abet yeqen kifatu man yihn t’eret’ere
Wedaje manew tadiya genzeb sew keqeyere
Mehala qalkidanu ya hulu bizu qalat

VERSE 3
Zare hulum teresa tezenega endezebet
Yet ale mewadedachn yet ale yet’ntu fiqr
Qena malet yishalal bedlo kemaqerqer
Selasa dinar wesdo yisamm yinkesegn

VERSE 4
Afer sihon eyale afer yemiyasbelagn
Ersun sew yiqr belew ersun sew marlgn
Yiqr malet sawq new yiqr yemtlegn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yeselame-sew-yalkut', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yesemayim Yemidirim Geta Belike Lisanat Cherinet Senay (yesemayim-yemidirim-geta-belike-lisanat-cherinet-senay)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 1
አዝ…..
በማይዝሉ ጽኑ ክንዶችህ
ተደገፍን በቸርነትህ
የፍቅር አባት ላመኑት ጥላ

CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 2
ክርስቶስ ነህ የኛ ከለላ
አዝ…..
ፍጹም ቆምን በንጹህ ደምህ
ተፈወስን በቅዱስ ቃልህ

CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 3
መዛል ደካም ከቶ አይነካንም
ኃይላችን ነው ሁሌም የአንተ ስም
አዝ…..
ያጣው ሲጮህ ፊትህ ተደፍቶ

CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 4
ሲያማክርህ ሚስጥሩን ገልጦ
አባት ለልጁ እንደሚራራ
አወጣኸው ከሙታን ስፍራ
አዝ…..

CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 5
ምስክር ነን ለዓለም ሁሉ
ስላዳነን በህያው ቃሉ
ለውለታው ምላሽ ባይኖርም
ከምስጋና ከቶ አንቦዝንም

CHORUS
የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ',
      lyrics_transliteration = 'CHORUS
Yesemaym yemdrm Geta
Beztolnal ejg sit’ota
Begoneth chernethm
Ridtonal kibur simh

VERSE 1
CHORUS
Bemayzlu ts’nu kindochh
Tedegefn becherneth
Yefqr abat lamenut t’la

CHORUS
Yesemaym yemdrm Geta
Beztolnal ejg sit’ota
Begoneth chernethm
Ridtonal kibur simh

VERSE 2
Kristos neh yegna kelela
CHORUS
Fits’um qomn bents’uh demh
Tefewesn beqdus qalh

CHORUS
Yesemaym yemdrm Geta
Beztolnal ejg sit’ota
Begoneth chernethm
Ridtonal kibur simh

VERSE 3
Mezal dekam keto aynekanm
Haylachn new hulem yeante sim
CHORUS
Yat’aw sich’oh fith tedefto

CHORUS
Yesemaym yemdrm Geta
Beztolnal ejg sit’ota
Begoneth chernethm
Ridtonal kibur simh

VERSE 4
Siyamakrh mist’run gelt’o
Abat lelju endemirara
Awet’aኸw kemutan sifra
CHORUS

CHORUS
Yesemaym yemdrm Geta
Beztolnal ejg sit’ota
Begoneth chernethm
Ridtonal kibur simh

VERSE 5
Miskr nen lealem hulu
Siladanen behyaw qalu
Lewletaw milash baynorm
Kemsgana keto anboznm

CHORUS
Yesemaym yemdrm Geta
Beztolnal ejg sit’ota
Begoneth chernethm
Ridtonal kibur simh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yesemayim-yemidirim-geta-belike-lisanat-cherinet-senay'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የሰማይም የምድርም ጌታ
በዝቶልናል እጅግ ስጦታ
በጎነትህ ቸርነትህም
ርድቶናል ክቡር ስምህ

VERSE 1
አዝ…..
በማይዝሉ ጽኑ ክንዶችህ
ተደገፍን በቸርነትህ
የፍቅር አባት ላመኑት ጥላ

VERSE 2
ክርስቶስ ነህ የኛ ከለላ
አዝ…..
ፍጹም ቆምን በንጹህ ደምህ
ተፈወስን በቅዱስ ቃልህ

VERSE 3
መዛል ደካም ከቶ አይነካንም
ኃይላችን ነው ሁሌም የአንተ ስም
አዝ…..
ያጣው ሲጮህ ፊትህ ተደፍቶ

VERSE 4
ሲያማክርህ ሚስጥሩን ገልጦ
አባት ለልጁ እንደሚራራ
አወጣኸው ከሙታን ስፍራ
አዝ…..

VERSE 5
ምስክር ነን ለዓለም ሁሉ
ስላዳነን በህያው ቃሉ
ለውለታው ምላሽ ባይኖርም
ከምስጋና ከቶ አንቦዝንም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yesemaym yemdrm Geta
Beztolnal ejg sit’ota
Begoneth chernethm
Ridtonal kibur simh

VERSE 1
Bemayzlu ts’nu kindochh
Tedegefn becherneth
Yefqr abat lamenut t’la

VERSE 2
Kristos neh yegna kelela
Fits’um qomn bents’uh demh
Tefewesn beqdus qalh

VERSE 3
Mezal dekam keto aynekanm
Haylachn new hulem yeante sim
Yat’aw sich’oh fith tedefto

VERSE 4
Siyamakrh mist’run gelt’o
Abat lelju endemirara
Awet’aኸw kemutan sifra

VERSE 5
Miskr nen lealem hulu
Siladanen behyaw qalu
Lewletaw milash baynorm
Kemsgana keto anboznm'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yesemayim-yemidirim-geta-belike-lisanat-cherinet-senay', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yesew Zemenu Eyesheshe (yesew-zemenu-eyesheshe)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 1
አዝ……
በጣም ፈጣን ነው ሰው ዘመኑ
ቀንሶ ሚያድር በየቀኑ
እውነት ነው ጠላት ይህን ያውቃል

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 2
በየሰበቡ ያዘገያል
በእሾህ መሀል እንዳለ ዘር
አድጎ በፍሬ ማይቆጠር
ታንቆ የቀረ በዚህ ዓለም

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 3
እንደኔ ሰነፍ ማንም የለም
አዝ……
በወደቀው ሰው እራሴን ለካሁ
መመዘኛዬን ቃሉን እረሳሁ

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 4
ስለበደሌ ከመፀፀት
ተፅናና ልቤ በወደቁት
ችላ ባዬ ሆኜ ነገ ዛሬ
አለሁ በቅጠል ያለ ፍሬ

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 5
በዓለም ጨክኜ እንድቆርጥ
እባክህ ጌታ ልቤን ለውጥ
አዝ……
ለፀሎት መትጋት ማስቀደሱ

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 6
ሁሌ መገኘት በመቅደሱ
ነበር ተብሎ ከተወራ
በቅጠል ቀርቶል ሳያፈራ
ወደ ኋላ እርፍ ይዞ ከታረሰ

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 7
ፅድቁን በርኩሰት ከጨረሰ
ነውና ሰይጣን ያዘገየው
የዕርሱ አሟሟት የከፋ ነው
አዝ……

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 8
በመንፈስ ሆነው የቀደሙት
በስጋ ስራ ደመደሙ
የሕይወት ቃልን የቀመሱ
ለአመጽ ለሐጥያት ይህው ባሱ

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 9
ቁሜአለሁ የሚለው እንዳይወድቅ
ያለ ትትና የለም ፅድቅ
ባርያ ነኝ ይበል የማልጠቅም
ታምኖ ይሰማራ በአምላክ ስም

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 10
አዝ……

CHORUS
የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ',
      lyrics_transliteration = 'CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 1
CHORUS
Bet’am fet’an new sew zemenu
Qenso miyadr beyeqenu
Ewnet new t’elat yihn yawqal

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 2
Beyesebebu yazegeyal
Beeshoh mehel endale zer
Adgo befre mayqot’er
Tanqo yeqere bezih alem

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 3
Endene senef manm yelem
CHORUS
Bewedeqew sew erasen lekahu
Memezegnayen qalun eresahu

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 4
Silebedele kemets’ets’et
Tets’nana libe bewedequt
Chla baye hogne nege zare
Alehu beqt’el yale fire

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 5
Bealem ch’ekgne endqort’
Ebakh Geta liben lewt’
CHORUS
Lets’elot metgat masqedesu

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 6
Hule megegnet bemeqdesu
Neber teblo ketewera
Beqt’el qertol sayafera
Wede hwala erf yizo ketarese

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 7
Ts’dqun berkuset kech’erese
Newna seyt’an yazegeyew
Yeersu amwamwat yekefa new
CHORUS

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 8
Bemenfes honew yeqedemut
Besga sira demedemu
Yehywet qaln yeqemesu
Leamets’ lehet’yat yihw basu

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 9
Qumealehu yemilew endaywedq
Yale titna yelem ts’dq
Barya negn yibel yemalt’eqm
Tamno yisemara beamlak sim

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 10
CHORUS

CHORUS
Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yesew-zemenu-eyesheshe'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የሰው ዘመኑ እየሸሸ
ቀን እንደሄደ አውቆ እየመሸ
በፅድቁ መንገድ በጉዞ ላይ
ያደርጋል ጠላት እንዲዘገይ

VERSE 1
አዝ……
በጣም ፈጣን ነው ሰው ዘመኑ
ቀንሶ ሚያድር በየቀኑ
እውነት ነው ጠላት ይህን ያውቃል

VERSE 2
በየሰበቡ ያዘገያል
በእሾህ መሀል እንዳለ ዘር
አድጎ በፍሬ ማይቆጠር
ታንቆ የቀረ በዚህ ዓለም

VERSE 3
እንደኔ ሰነፍ ማንም የለም
አዝ……
በወደቀው ሰው እራሴን ለካሁ
መመዘኛዬን ቃሉን እረሳሁ

VERSE 4
ስለበደሌ ከመፀፀት
ተፅናና ልቤ በወደቁት
ችላ ባዬ ሆኜ ነገ ዛሬ
አለሁ በቅጠል ያለ ፍሬ

VERSE 5
በዓለም ጨክኜ እንድቆርጥ
እባክህ ጌታ ልቤን ለውጥ
አዝ……
ለፀሎት መትጋት ማስቀደሱ

VERSE 6
ሁሌ መገኘት በመቅደሱ
ነበር ተብሎ ከተወራ
በቅጠል ቀርቶል ሳያፈራ
ወደ ኋላ እርፍ ይዞ ከታረሰ

VERSE 7
ፅድቁን በርኩሰት ከጨረሰ
ነውና ሰይጣን ያዘገየው
የዕርሱ አሟሟት የከፋ ነው
አዝ……

VERSE 8
በመንፈስ ሆነው የቀደሙት
በስጋ ስራ ደመደሙ
የሕይወት ቃልን የቀመሱ
ለአመጽ ለሐጥያት ይህው ባሱ

VERSE 9
ቁሜአለሁ የሚለው እንዳይወድቅ
ያለ ትትና የለም ፅድቅ
ባርያ ነኝ ይበል የማልጠቅም
ታምኖ ይሰማራ በአምላክ ስም

VERSE 10
አዝ……'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yesew zemenu eyesheshe
Qen endehede awqo eyemeshe
Bets’dqu menged beguzo lay
Yadergal t’elat endizegey

VERSE 1
Bet’am fet’an new sew zemenu
Qenso miyadr beyeqenu
Ewnet new t’elat yihn yawqal

VERSE 2
Beyesebebu yazegeyal
Beeshoh mehel endale zer
Adgo befre mayqot’er
Tanqo yeqere bezih alem

VERSE 3
Endene senef manm yelem
Bewedeqew sew erasen lekahu
Memezegnayen qalun eresahu

VERSE 4
Silebedele kemets’ets’et
Tets’nana libe bewedequt
Chla baye hogne nege zare
Alehu beqt’el yale fire

VERSE 5
Bealem ch’ekgne endqort’
Ebakh Geta liben lewt’
Lets’elot metgat masqedesu

VERSE 6
Hule megegnet bemeqdesu
Neber teblo ketewera
Beqt’el qertol sayafera
Wede hwala erf yizo ketarese

VERSE 7
Ts’dqun berkuset kech’erese
Newna seyt’an yazegeyew
Yeersu amwamwat yekefa new

VERSE 8
Bemenfes honew yeqedemut
Besga sira demedemu
Yehywet qaln yeqemesu
Leamets’ lehet’yat yihw basu

VERSE 9
Qumealehu yemilew endaywedq
Yale titna yelem ts’dq
Barya negn yibel yemalt’eqm
Tamno yisemara beamlak sim

VERSE 10'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yesew-zemenu-eyesheshe', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: yesiklet mezmur (yesiklet-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የአብርሃም አምላክ የይስሐቅም ቤዛ /፪/
ወገኖቹን ሁሉ በራሱ ደም ገዛ/፪/
የሐስት ምስክር አቁመው ከሰሱት /፪/
በሞት እንዲቀጣ ሁሉም ፈረዱበት/፪/

VERSE 1
ጲላጦስ ገረፈው በሰንሰለት አስሮ/፪/
ከሮማዊው መንግሥት እንዲኖር ተፋቅሮ/፪/
ድንግል አልቻለችም እንባዋን ልትገታ /፪/
እያየች በመስቀል ልጇ ሲንገላታ /፪/

CHORUS
የአብርሃም አምላክ የይስሐቅም ቤዛ /፪/
ወገኖቹን ሁሉ በራሱ ደም ገዛ/፪/
የሐስት ምስክር አቁመው ከሰሱት /፪/
በሞት እንዲቀጣ ሁሉም ፈረዱበት/፪/

VERSE 2
በብርሃን ዙፋን ላይ የቆሙት እግሮቹ /፪/
በችንካር ላይ ቆመው ምንም ሳይሰለቹ /፪/
የብርሃን አክሊልን ለሰማእት ያደለ/፪/
የሾክ አክሊል ደፍቶ ቀራንዮ ዋለ /፪/

CHORUS
የአብርሃም አምላክ የይስሐቅም ቤዛ /፪/
ወገኖቹን ሁሉ በራሱ ደም ገዛ/፪/
የሐስት ምስክር አቁመው ከሰሱት /፪/
በሞት እንዲቀጣ ሁሉም ፈረዱበት/፪/',
      lyrics_transliteration = 'CHORUS
Yeabrham amlak yeysheqm beza (2)
Wegenochun hulu berasu dem geza (2)
Yehest miskr aqumew kesesut (2)
Bemot endiqet’a hulum feredubet (2)

VERSE 1
P’ilat’os gerefew besenselet asro (2)
Keromawiw mengst endinor tefaqro (2)
Dingil alchalechm enbawan litgeta (2)
Eyayech bemesqel lijwa singelata (2)

CHORUS
Yeabrham amlak yeysheqm beza (2)
Wegenochun hulu berasu dem geza (2)
Yehest miskr aqumew kesesut (2)
Bemot endiqet’a hulum feredubet (2)

VERSE 2
Bebrhan zufan lay yeqomut egrochu (2)
Bechnkar lay qomew minm sayselechu (2)
Yebrhan akliln lesemaet yadele (2)
Yeshok aklil defto qeranyo wale (2)

CHORUS
Yeabrham amlak yeysheqm beza (2)
Wegenochun hulu berasu dem geza (2)
Yehest miskr aqumew kesesut (2)
Bemot endiqet’a hulum feredubet (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yesiklet-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የአብርሃም አምላክ የይስሐቅም ቤዛ /፪/
ወገኖቹን ሁሉ በራሱ ደም ገዛ/፪/
የሐስት ምስክር አቁመው ከሰሱት /፪/
በሞት እንዲቀጣ ሁሉም ፈረዱበት/፪/

VERSE 1
ጲላጦስ ገረፈው በሰንሰለት አስሮ/፪/
ከሮማዊው መንግሥት እንዲኖር ተፋቅሮ/፪/
ድንግል አልቻለችም እንባዋን ልትገታ /፪/
እያየች በመስቀል ልጇ ሲንገላታ /፪/

VERSE 2
በብርሃን ዙፋን ላይ የቆሙት እግሮቹ /፪/
በችንካር ላይ ቆመው ምንም ሳይሰለቹ /፪/
የብርሃን አክሊልን ለሰማእት ያደለ/፪/
የሾክ አክሊል ደፍቶ ቀራንዮ ዋለ /፪/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yeabrham amlak yeysheqm beza (2)
Wegenochun hulu berasu dem geza (2)
Yehest miskr aqumew kesesut (2)
Bemot endiqet’a hulum feredubet (2)

VERSE 1
P’ilat’os gerefew besenselet asro (2)
Keromawiw mengst endinor tefaqro (2)
Dingil alchalechm enbawan litgeta (2)
Eyayech bemesqel lijwa singelata (2)

VERSE 2
Bebrhan zufan lay yeqomut egrochu (2)
Bechnkar lay qomew minm sayselechu (2)
Yebrhan akliln lesemaet yadele (2)
Yeshok aklil defto qeranyo wale (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yesiklet-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yesilasen Menber (yesilasen-menber)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የስላሴን መንበር ቅዱሳን ከበውት
ኪሩቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላዕክት ሲሰግዱ በፍራሃት

VERSE 1
እዩት ተመልከቱት የሰማዩን ድምቀት
እዩት ተመልከቱት የሰማዩን አባት /2x/
የስላሴን መንበር ቅዱሳን ከበውት
እያሸበሸቡ በሰማይ መላዕክት

CHORUS
የስላሴን መንበር ቅዱሳን ከበውት
ኪሩቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላዕክት ሲሰግዱ በፍራሃት

VERSE 2
ካህናተ ከሰመይ ቅዱስ ቅዱስ ቅዱስ ሲሉ
ይህን ልዩ ታምር ሊያዩ የታደሉ
በፅድቅ ስራቸው በምድር ይታያሉ /2x/
የቅዱሳን ህብረት የቅዱሳን ሀገር

CHORUS
የስላሴን መንበር ቅዱሳን ከበውት
ኪሩቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላዕክት ሲሰግዱ በፍራሃት

VERSE 3
ሲያወድስ ይኖራል የስላሴን ክብር
ፅድቅና ርህራሄ የተሞላ ሰማይ
እግዚአብሔር ያድለን በትንሣኤ እንድናይ /3x/
የስላሴን መንበር ቅዱሳን ከበውት

CHORUS
የስላሴን መንበር ቅዱሳን ከበውት
ኪሩቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላዕክት ሲሰግዱ በፍራሃት

VERSE 4
እያሸበሸቡ በሰማይ መላዕክት
ካህናተ ከሰመይ ቅዱስ ቅዱስ ቅዱስ ሲሉ
ይህን ልዩ ታምር ሊያዩ የታደሉ
በፅድቅ ስራቸው በምድር ይታያሉ /2x/

CHORUS
የስላሴን መንበር ቅዱሳን ከበውት
ኪሩቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላዕክት ሲሰግዱ በፍራሃት',
      lyrics_transliteration = 'CHORUS
Yesilasen Meniberi k’dusan Kebewit
Kirubeli Bedemena Zufanun Yizewit
Dinigilin Kemehāli Mikaelin Kefit
Ailaf Melekit Sisegidu Befirahat

VERSE 1
Iyut Temeliketut Yesemayun Dimiket
Iyut Temeliketut Yesemayun Abat /2x/
Yesilasen Meniber Kidusan Kebewit
Iyashebeshebu Besemayi Melaikit

CHORUS
Yesilasen Meniberi k’dusan Kebewit
Kirubeli Bedemena Zufanun Yizewit
Dinigilin Kemehāli Mikaelin Kefit
Ailaf Melekit Sisegidu Befirahat

VERSE 2
Kahinate Kesemeyi Kidus Kidus Kidus Silu
Yihin liyu Tamir Liyayu Yetadelu
Besidik Sirachew Bemidir Yitayalu /2x/
Yekidusan Hibiret Yekidusan Kibir Hager

CHORUS
Yesilasen Meniberi k’dusan Kebewit
Kirubeli Bedemena Zufanun Yizewit
Dinigilin Kemehāli Mikaelin Kefit
Ailaf Melekit Sisegidu Befirahat

VERSE 3
Siyaweds Yinorale Yeslasen Kiber
Tsedqna Rerahie Yetmola Semayi
Igziyabher Ydelale Betinsaie Endnayi /3x/
Yesilasen Meniber Kidusan Kebewit

CHORUS
Yesilasen Meniberi k’dusan Kebewit
Kirubeli Bedemena Zufanun Yizewit
Dinigilin Kemehāli Mikaelin Kefit
Ailaf Melekit Sisegidu Befirahat

VERSE 4
Iyashebeshebu Besemayi Melaikit
Kahinate Kesemeyi Kidus Kidus Kidus Silu
Yihin liyu Tamir Liyayu Yetadelu
Besidik Sirachew Bemidir Yitayalu /2x/

CHORUS
Yesilasen Meniberi k’dusan Kebewit
Kirubeli Bedemena Zufanun Yizewit
Dinigilin Kemehāli Mikaelin Kefit
Ailaf Melekit Sisegidu Befirahat',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yesilasen-menber'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የስላሴን መንበር ቅዱሳን ከበውት
ኪሩቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላዕክት ሲሰግዱ በፍራሃት

VERSE 1
እዩት ተመልከቱት የሰማዩን ድምቀት
እዩት ተመልከቱት የሰማዩን አባት /2x/
የስላሴን መንበር ቅዱሳን ከበውት
እያሸበሸቡ በሰማይ መላዕክት

VERSE 2
ካህናተ ከሰመይ ቅዱስ ቅዱስ ቅዱስ ሲሉ
ይህን ልዩ ታምር ሊያዩ የታደሉ
በፅድቅ ስራቸው በምድር ይታያሉ /2x/
የቅዱሳን ህብረት የቅዱሳን ሀገር

VERSE 3
ሲያወድስ ይኖራል የስላሴን ክብር
ፅድቅና ርህራሄ የተሞላ ሰማይ
እግዚአብሔር ያድለን በትንሣኤ እንድናይ /3x/
የስላሴን መንበር ቅዱሳን ከበውት

VERSE 4
እያሸበሸቡ በሰማይ መላዕክት
ካህናተ ከሰመይ ቅዱስ ቅዱስ ቅዱስ ሲሉ
ይህን ልዩ ታምር ሊያዩ የታደሉ
በፅድቅ ስራቸው በምድር ይታያሉ /2x/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yesilasen Meniberi k’dusan Kebewit
Kirubeli Bedemena Zufanun Yizewit
Dinigilin Kemehāli Mikaelin Kefit
Ailaf Melekit Sisegidu Befirahat

VERSE 1
Iyut Temeliketut Yesemayun Dimiket
Iyut Temeliketut Yesemayun Abat /2x/
Yesilasen Meniber Kidusan Kebewit
Iyashebeshebu Besemayi Melaikit

VERSE 2
Kahinate Kesemeyi Kidus Kidus Kidus Silu
Yihin liyu Tamir Liyayu Yetadelu
Besidik Sirachew Bemidir Yitayalu /2x/
Yekidusan Hibiret Yekidusan Kibir Hager

VERSE 3
Siyaweds Yinorale Yeslasen Kiber
Tsedqna Rerahie Yetmola Semayi
Igziyabher Ydelale Betinsaie Endnayi /3x/
Yesilasen Meniber Kidusan Kebewit

VERSE 4
Iyashebeshebu Besemayi Melaikit
Kahinate Kesemeyi Kidus Kidus Kidus Silu
Yihin liyu Tamir Liyayu Yetadelu
Besidik Sirachew Bemidir Yitayalu /2x/'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yesilasen-menber', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yesilasen Meniber Kidusan Kebewit (yesilasen-meniber-kidusan-kebewit)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 1
እዩት ተመልከቱት የሰማዩን ድምቀት
እዩት ተመልከቱት የሰማዩን አባት
አዝ ።።።።።።። ።።።።።። ።።።።።።
የሥላሴን መንበር ቅዱሳን ከበውት

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 2
እያሸበሸቡ የሰማይ መላእክት
ካህናተ ሰመ ቅዱስ ቅዱስ ሲሉ
ይህን ልዩ ታምር ሊያዩ የታደሉ
በጽድቅ ስራቸው ደምቀው ይታያሉ

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 3
በጽድቅ ስራቸው ደምቀው ይታያሉ
አዝ ።።።።።።። ።።።።።። ።።።።።።
የቅዱሳን ህብረት የቅዱሳን ሀገር
ሲያወድስ ይኖራል የስላሴን ክብር

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 4
ጽድቅና ራዕይን የተሞላ ሰማይ
እግዚአብሔር ያድለን በተንሳኤ እንድናይ
አዝ ።።።።።። ።።።።።።። ።።።።።
የሥላሴን መንበር ቅዱሳን ከበውት

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 5
እያሸበሸቡ የሰማይ መላእክት
ካህናት ሰማይ ቅዱስ ቅዱስ ቅዱስ ሲሉ
ይህን ልዩ ታምር ሊያ የታደሉ
በጽድቅ ስራቸው በምድር ይታያሉ

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 6
በጽድቅ ስራቸው በምድር ይታያሉ

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት',
      lyrics_transliteration = 'CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat

VERSE 1
Eyut temelketut yesemayun dimqet
Eyut temelketut yesemayun abat
CHORUS
Yeslasen menber Kidusan kebewt

CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat

VERSE 2
Eyashebeshebu yesemay melaekt
Kahnate seme Kidus Kidus silu
Yihn liyu tamr liyayu yetadelu
Bets’dq sirachew demqew yitayalu

CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat

VERSE 3
Bets’dq sirachew demqew yitayalu
CHORUS
Yeqdusan hibret yeqdusan heger
Siyaweds yinoral yeslasen kibir

CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat

VERSE 4
Ts’dqna raeyn yetemola semay
Egziabher yadlen betensae endnay
CHORUS
Yeslasen menber Kidusan kebewt

CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat

VERSE 5
Eyashebeshebu yesemay melaekt
Kahnat semay Kidus Kidus Kidus silu
Yihn liyu tamr liya yetadelu
Bets’dq sirachew bemdr yitayalu

CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat

VERSE 6
Bets’dq sirachew bemdr yitayalu

CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yesilasen-meniber-kidusan-kebewit'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 1
እዩት ተመልከቱት የሰማዩን ድምቀት
እዩት ተመልከቱት የሰማዩን አባት
አዝ ።።።።።።። ።።።።።። ።።።።።።
የሥላሴን መንበር ቅዱሳን ከበውት

VERSE 2
እያሸበሸቡ የሰማይ መላእክት
ካህናተ ሰመ ቅዱስ ቅዱስ ሲሉ
ይህን ልዩ ታምር ሊያዩ የታደሉ
በጽድቅ ስራቸው ደምቀው ይታያሉ

VERSE 3
በጽድቅ ስራቸው ደምቀው ይታያሉ
አዝ ።።።።።።። ።።።።።። ።።።።።።
የቅዱሳን ህብረት የቅዱሳን ሀገር
ሲያወድስ ይኖራል የስላሴን ክብር

VERSE 4
ጽድቅና ራዕይን የተሞላ ሰማይ
እግዚአብሔር ያድለን በተንሳኤ እንድናይ
አዝ ።።።።።። ።።።።።።። ።።።።።
የሥላሴን መንበር ቅዱሳን ከበውት

VERSE 5
እያሸበሸቡ የሰማይ መላእክት
ካህናት ሰማይ ቅዱስ ቅዱስ ቅዱስ ሲሉ
ይህን ልዩ ታምር ሊያ የታደሉ
በጽድቅ ስራቸው በምድር ይታያሉ

VERSE 6
በጽድቅ ስራቸው በምድር ይታያሉ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat

VERSE 1
Eyut temelketut yesemayun dimqet
Eyut temelketut yesemayun abat
Yeslasen menber Kidusan kebewt

VERSE 2
Eyashebeshebu yesemay melaekt
Kahnate seme Kidus Kidus silu
Yihn liyu tamr liyayu yetadelu
Bets’dq sirachew demqew yitayalu

VERSE 3
Bets’dq sirachew demqew yitayalu
Yeqdusan hibret yeqdusan heger
Siyaweds yinoral yeslasen kibir

VERSE 4
Ts’dqna raeyn yetemola semay
Egziabher yadlen betensae endnay
Yeslasen menber Kidusan kebewt

VERSE 5
Eyashebeshebu yesemay melaekt
Kahnat semay Kidus Kidus Kidus silu
Yihn liyu tamr liya yetadelu
Bets’dq sirachew bemdr yitayalu

VERSE 6
Bets’dq sirachew bemdr yitayalu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yesilasen-meniber-kidusan-kebewit', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yesilonidis Tibeb (yesilonidis-tibeb)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 1
ተጨንቄሃለሁ ልንገርሽ
ምስጢረኛዬ እናቴ ነሽ
ሰው ያልሰማውን ብርቱ ምስጢር
ድንግል ሆይ ላንቺ ላማክር

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 2
ለቁስለኛውም መድኃኒቱ
የአዳም ዘር ሁሉ ነሽ ሕይወቱ
መፍትዬ አለ በእጅሽ
ተንበርክኬ ነው ምማጸንሽ

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 3
አዝ የሲሎንዲስ ጥበብ
ሳልናገረው ይገባሻል
የውስጤ ሁሉ ይታይሻል
ድረሽ እናቴ ተራዲኝ

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 4
ያላንቺ ለኔ ማን አለኝ
ደስታዬ ደስታ የሚሆነው
በአዘኔም የምጽናናሁ
አንቺ ከእኔ ጋር ስለሆንሽ

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 5
ተጽናንቼሃለሁ በስምሽ
አዝ የሲሎንዲስ ጥበብ
ወንድሞቼ እንኩአ ቢሸጡኝ
ሰው ሁሉ ጠላት ቢሆነኝ

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 6
በእመአምላክ ሃይል ተምሬሃለሁ
በጠላቴ ላይ ሰልጥኜሃለሁ
የረሱኝ በሙሉ ያስቡኛል
የተጣሉኝም ያከብሩኛል

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 7
አዝ የሲሎንዲስ ጥበብ
መንገዴ እረዝሞ ደክሜብሽ
መከራው በዝቶ ታምሜብሽ
ወድቄ ሳዝን ድረሺልኝ

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 8
ለባሪያሽ ሃይሉን እንድትሰጪኝ
ፍቅርሽ በውስጤ ተንሰራፋ
በእናትነትሽ ልቤ ሰፋ
የሚለያየን ማንም የለም

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 9
ማርያም ልበልሽ ለዘለአለም

CHORUS
የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/',
      lyrics_transliteration = 'CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 1
Tech’enqehalehu lingersh
Mist’iregnaye enate nesh
Sew yalsemawn birtu mist’ir
Dingil hoy lanchi lamakr

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 2
Lequslegnawm medhanitu
Yeadam zer hulu nesh hiywetu
Meftye ale beejsh
Tenberkke new mimats’ensh

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 3
CHORUS
Salnagerew yigebashal
Yewst’e hulu yitayshal
Diresh enate teradign

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 4
Yalanchi lene man alegn
Destaye desta yemihonew
Beazenem yemts’nanahu
Anchi keene gar silehonsh

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 5
Tets’nanchehalehu besmsh
CHORUS
Wendmoche enkua bishet’ugn
Sew hulu t’elat bihonegn

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 6
Beemeamlak hayl temrehalehu
Bet’elate lay selt’gnehalehu
Yeresugn bemulu yasbugnal
Yetet’alugnm yakebrugnal

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 7
CHORUS
Mengede erezmo dekmebsh
Mekeraw bezto tammebsh
Wedqe sazn direshilgn

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 8
Lebariyash haylun endtsech’ign
Fiqrsh bewst’e tenserafa
Beenatnetsh libe sefa
Yemileyayen manm yelem

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 9
Maryam libelsh lezelealem

CHORUS
Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yesilonidis-tibeb'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የሲሎንዲስ ጥበብ እወድሻለሁ
የናሆም መድኃኒት እወድሻለሁ
ማርያም አከብርሻለሁ
ማርያም እወድሻለሁ /2/

VERSE 1
ተጨንቄሃለሁ ልንገርሽ
ምስጢረኛዬ እናቴ ነሽ
ሰው ያልሰማውን ብርቱ ምስጢር
ድንግል ሆይ ላንቺ ላማክር

VERSE 2
ለቁስለኛውም መድኃኒቱ
የአዳም ዘር ሁሉ ነሽ ሕይወቱ
መፍትዬ አለ በእጅሽ
ተንበርክኬ ነው ምማጸንሽ

VERSE 3
አዝ የሲሎንዲስ ጥበብ
ሳልናገረው ይገባሻል
የውስጤ ሁሉ ይታይሻል
ድረሽ እናቴ ተራዲኝ

VERSE 4
ያላንቺ ለኔ ማን አለኝ
ደስታዬ ደስታ የሚሆነው
በአዘኔም የምጽናናሁ
አንቺ ከእኔ ጋር ስለሆንሽ

VERSE 5
ተጽናንቼሃለሁ በስምሽ
አዝ የሲሎንዲስ ጥበብ
ወንድሞቼ እንኩአ ቢሸጡኝ
ሰው ሁሉ ጠላት ቢሆነኝ

VERSE 6
በእመአምላክ ሃይል ተምሬሃለሁ
በጠላቴ ላይ ሰልጥኜሃለሁ
የረሱኝ በሙሉ ያስቡኛል
የተጣሉኝም ያከብሩኛል

VERSE 7
አዝ የሲሎንዲስ ጥበብ
መንገዴ እረዝሞ ደክሜብሽ
መከራው በዝቶ ታምሜብሽ
ወድቄ ሳዝን ድረሺልኝ

VERSE 8
ለባሪያሽ ሃይሉን እንድትሰጪኝ
ፍቅርሽ በውስጤ ተንሰራፋ
በእናትነትሽ ልቤ ሰፋ
የሚለያየን ማንም የለም

VERSE 9
ማርያም ልበልሽ ለዘለአለም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yesilondis t’beb ewedshalehu
Yenahom medhanit ewedshalehu
Maryam akebrshalehu
Maryam ewedshalehu (2)

VERSE 1
Tech’enqehalehu lingersh
Mist’iregnaye enate nesh
Sew yalsemawn birtu mist’ir
Dingil hoy lanchi lamakr

VERSE 2
Lequslegnawm medhanitu
Yeadam zer hulu nesh hiywetu
Meftye ale beejsh
Tenberkke new mimats’ensh

VERSE 3
Salnagerew yigebashal
Yewst’e hulu yitayshal
Diresh enate teradign

VERSE 4
Yalanchi lene man alegn
Destaye desta yemihonew
Beazenem yemts’nanahu
Anchi keene gar silehonsh

VERSE 5
Tets’nanchehalehu besmsh
Wendmoche enkua bishet’ugn
Sew hulu t’elat bihonegn

VERSE 6
Beemeamlak hayl temrehalehu
Bet’elate lay selt’gnehalehu
Yeresugn bemulu yasbugnal
Yetet’alugnm yakebrugnal

VERSE 7
Mengede erezmo dekmebsh
Mekeraw bezto tammebsh
Wedqe sazn direshilgn

VERSE 8
Lebariyash haylun endtsech’ign
Fiqrsh bewst’e tenserafa
Beenatnetsh libe sefa
Yemileyayen manm yelem

VERSE 9
Maryam libelsh lezelealem'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yesilonidis-tibeb', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yesimu Tirguame (yesimu-tirguame)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 1
እኛን የሚረዳን ዘወትር በምልጃው
የመላዕክት አለቃ ቅዱስ ሚካኤል ነው

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 2
ከጉድጓድ ተጥሎ ፍጹም ከሚያስፈራው
ከተራቡ አናብስት ዳንኤልን ያዳንከው

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 3
እኛንም ተራዳን ቸል አትበለን
ሰይጣን በተንኮሉ ወጥመድ ሳይጥለን

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 4
የክፉ ሰው ስራው ክፉ ሐሳብ ነውና
በቅንነት መንገድ ከቶ አይሄድምና

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 5
የሞቱን ደብዳቤ ለባህራን ሲሰጠው
ሚካኤል አጥፍቶ በደስታ ለወጠው

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 6
ገና ብላቴና ሳለሁ አንድ ፍሬ
ሰው ሁሉ ሲንቀኝ ምስጋናን ጀምሬ

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 7
ጸጋዬን አብዝቶ ያበቃኝ ለዚህ ክብር
የሚካኤል አምላክ ይመስገን እግዚአብሔር

CHORUS
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው',
      lyrics_transliteration = 'CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 1
Enyan yemiredan zawit’r bemilijaw
Yemela’ikt aleqa Kidus Mikael new

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 2
Kegudgwad tet’lo fits’um kemiyasferaw
Keterabu anabist Danieln yadanekew

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 3
Enyanem teradan chel at’belen
Seytan betenkolu wet’med sayit’len

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 4
Yekifu sew siraw kifu hasab newna
Beqinnet menged keto ayhedimna

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 5
Yemotun debdabe lebahran siset’ew
Mikael at’fito bedest’a lewet’ew

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 6
Gena bilatena salehu and firé
Sew hulu sinqegn misganan jemré

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 7
Tsegayen abzito yabekagn lezih kibir
YeMikael Amlak yimesgen Egziabher

CHORUS
Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yesimu-tirguame'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
የሰውን ወደ አምላክ የአምላክን ወደ ሰው

VERSE 1
እኛን የሚረዳን ዘወትር በምልጃው
የመላዕክት አለቃ ቅዱስ ሚካኤል ነው

VERSE 2
ከጉድጓድ ተጥሎ ፍጹም ከሚያስፈራው
ከተራቡ አናብስት ዳንኤልን ያዳንከው

VERSE 3
እኛንም ተራዳን ቸል አትበለን
ሰይጣን በተንኮሉ ወጥመድ ሳይጥለን

VERSE 4
የክፉ ሰው ስራው ክፉ ሐሳብ ነውና
በቅንነት መንገድ ከቶ አይሄድምና

VERSE 5
የሞቱን ደብዳቤ ለባህራን ሲሰጠው
ሚካኤል አጥፍቶ በደስታ ለወጠው

VERSE 6
ገና ብላቴና ሳለሁ አንድ ፍሬ
ሰው ሁሉ ሲንቀኝ ምስጋናን ጀምሬ

VERSE 7
ጸጋዬን አብዝቶ ያበቃኝ ለዚህ ክብር
የሚካኤል አምላክ ይመስገን እግዚአብሔር'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yesimu tirguame man ende Egziabher new
Yesewn wede Amlak yeAmlakn wede sew

VERSE 1
Enyan yemiredan zawit’r bemilijaw
Yemela’ikt aleqa Kidus Mikael new

VERSE 2
Kegudgwad tet’lo fits’um kemiyasferaw
Keterabu anabist Danieln yadanekew

VERSE 3
Enyanem teradan chel at’belen
Seytan betenkolu wet’med sayit’len

VERSE 4
Yekifu sew siraw kifu hasab newna
Beqinnet menged keto ayhedimna

VERSE 5
Yemotun debdabe lebahran siset’ew
Mikael at’fito bedest’a lewet’ew

VERSE 6
Gena bilatena salehu and firé
Sew hulu sinqegn misganan jemré

VERSE 7
Tsegayen abzito yabekagn lezih kibir
YeMikael Amlak yimesgen Egziabher'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yesimu-tirguame', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yetamenk YeNefs Wodaj (yetamenk-yenefs-wodaj)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
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
አዝ፡
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 4
ለድንግል ነገርህ ገብርኤል
የአናብስቱን አፍ ዘጋኸው
ወኅኒውን አናወጽከው
በሕይወት መንገድ የምትመራ

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 5
ለእግዚአብሔር ሕዝብ የምትራራ
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 6
ለድንግል ነገርህ ገብርኤል
አዝ፡
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
ጸሎት ይዞ የሚወጣ
ምሕረት ይዞ የሚመጣ

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 8
ዘወትር የሚያይ የአምላኩን ፊት
ቅዱስ ገብርኤል ሊቀ መላእክት
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 9
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
አዝ፡
መላእክቱን በሰማይ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 10
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
በመዐልትና በሌሊት

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 11
የሚያድነን ከጥፋት
ዙሪያችንን የሚሰፍር
የሚያማልድ ከእግዚአብሔር
መላእክቱን በሰማይ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር

VERSE 12
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል

CHORUS
የታመንክ የነፍስ ወዳጅ
የምሕረት አማላጅ
አንተ ነህ ገብርኤል
የምትቆም በቅድመ እግዚአብሔር',
      lyrics_transliteration = 'CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 1
Nebelbalun wuha aderegkew
Senseletun betateskew
Yenededew isat tefitwal
Ke-igna gar Gebriel qomal

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 2
Melaiktun besemay Gebriel
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 3
Az:
Melaiktun besemay Gebriel
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 4
Le-dingil negerih Gebriel
Ye-anabistun af zegahew
Wehiniwun anawetsikew
Be-hiywot menged yemitimera

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 5
Le-Igziabher hizb yemitirara
Melaiktun besemay Gebriel
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 6
Le-dingil negerih Gebriel
Az:
Melaiktun besemay Gebriel
Indaregagah Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 7
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel
Tselot yizo yemiweta
Mihiret yizo yemimeta

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 8
Zewetir yemiyay ye-amlakun fit
Qidus Gebriel liqe melaikt
Melaiktun besemay Gebriel
Indaregagah Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 9
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel
Az:
Melaiktun besemay Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 10
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel
Bemealtina belelit

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 11
Yemiyadinen ketifat
Zuriyachinin yemisefir
Yemiyamalid ke-Igziabher
Melaiktun besemay Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 12
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel

CHORUS
Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yetamenk-yenefs-wodaj'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የታመንክ የነፍስ ወዳጅ
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
አዝ፡
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል

VERSE 4
ለድንግል ነገርህ ገብርኤል
የአናብስቱን አፍ ዘጋኸው
ወኅኒውን አናወጽከው
በሕይወት መንገድ የምትመራ

VERSE 5
ለእግዚአብሔር ሕዝብ የምትራራ
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል

VERSE 6
ለድንግል ነገርህ ገብርኤል
አዝ፡
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል

VERSE 7
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
ጸሎት ይዞ የሚወጣ
ምሕረት ይዞ የሚመጣ

VERSE 8
ዘወትር የሚያይ የአምላኩን ፊት
ቅዱስ ገብርኤል ሊቀ መላእክት
መላእክቱን በሰማይ ገብርኤል
እንዳረጋጋህ ገብርኤል

VERSE 9
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
አዝ፡
መላእክቱን በሰማይ ገብርኤል

VERSE 10
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል
በመዐልትና በሌሊት

VERSE 11
የሚያድነን ከጥፋት
ዙሪያችንን የሚሰፍር
የሚያማልድ ከእግዚአብሔር
መላእክቱን በሰማይ ገብርኤል

VERSE 12
እንዳረጋጋህ ገብርኤል
የአምላክን ሰው መሆን ገብርኤል
ለድንግል ነገርህ ገብርኤል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yetamenk ye-nefs wodaj
Ye-mihiret amalaj
Ante neh Gebriel
Yemitikom beqidme Igziabher

VERSE 1
Nebelbalun wuha aderegkew
Senseletun betateskew
Yenededew isat tefitwal
Ke-igna gar Gebriel qomal

VERSE 2
Melaiktun besemay Gebriel
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel

VERSE 3
Az:
Melaiktun besemay Gebriel
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel

VERSE 4
Le-dingil negerih Gebriel
Ye-anabistun af zegahew
Wehiniwun anawetsikew
Be-hiywot menged yemitimera

VERSE 5
Le-Igziabher hizb yemitirara
Melaiktun besemay Gebriel
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel

VERSE 6
Le-dingil negerih Gebriel
Az:
Melaiktun besemay Gebriel
Indaregagah Gebriel

VERSE 7
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel
Tselot yizo yemiweta
Mihiret yizo yemimeta

VERSE 8
Zewetir yemiyay ye-amlakun fit
Qidus Gebriel liqe melaikt
Melaiktun besemay Gebriel
Indaregagah Gebriel

VERSE 9
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel
Az:
Melaiktun besemay Gebriel

VERSE 10
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel
Bemealtina belelit

VERSE 11
Yemiyadinen ketifat
Zuriyachinin yemisefir
Yemiyamalid ke-Igziabher
Melaiktun besemay Gebriel

VERSE 12
Indaregagah Gebriel
Ye-amlakin sew mehon Gebriel
Le-dingil negerih Gebriel'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yetamenk-yenefs-wodaj', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yetegnaw Siraye (yetegnaw-siraye)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 1
በመዳፍህ ቀርፀህ ሁሌ ታየኛለህ
መድሀኒቴ ኢየሱስ በደሌን እረስተህ
ቢምረኝ ነው ቢምረኝ በመቅደሱ ያቆመኝ
ቢያስበኝ ነው ቢያስበኝ በከፍታው ያኖረኝ

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 2
የአብርሀምን ምግባር የዮሴፍን እምነት
ፅድቅን ባልኳለው ባላደርግ መቀነት
ማህተቡን ይዣለሁ የደሙን ጠብታ
መድሀኒቴ ኢየሱስ አክብሮኛል ጌታ

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 3
ቢምረኝ ነው ቢምረኝ በመቅደሱ ያቆመኝ
ቢያስበኝ ነው ቢያስበኝ በከፍታው ያኖረኝ
እንዳልፈው የረዳኝ የእሳቱን ባህር
ምን ምግባር ኖሮኝ ነው ከፅድቅ የሚቆጠር

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 4
የልቤ ኩራት ነው የአይኔ ከፍታ
መድሀኒቴ ኢየሱስ የሠራዊት ጌታ
ቢምረኝ ነው ቢምረኝ በመቅደሱ ያቆመኝ
ቢያስበኝ ነው ቢያስበኝ በከፍታው ያኖረኝ

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 5
ዘይቱ እንዴት ፈላ በራሴ ያፈሰስከው
ዙፋን ልታወርሰኝ ልቤን የመረጥከው
የኔ የተወደደው ከኤልያም ደም ግባት
መድሀኒቴ ኢየሱስ ሆነኸኝ ነው ውበት

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 6
ቢምረኝ ነው ቢምረኝ በመቅደሱ ያቆመኝ
ቢያስበኝ ነው ቢያስበኝ በከፍታው ያኖረኝ/2/

CHORUS
የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት',
      lyrics_transliteration = 'CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot

VERSE 1
Bemedafh qerts’eh hule tayegnaleh
Medhenite Iyesus bedelen eresteh
Bimregn new bimregn bemeqdesu yaqomegn
Biyasbegn new biyasbegn bekeftaw yanoregn

CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot

VERSE 2
Yeabrhemn migbar yeyosefn emnet
Ts’dqn balkwalew baladerg meqenet
Mahtebun yizhalehu yedemun t’ebta
Medhenite Iyesus akbrognal Geta

CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot

VERSE 3
Bimregn new bimregn bemeqdesu yaqomegn
Biyasbegn new biyasbegn bekeftaw yanoregn
Endalfew yeredagn yeesatun bahr
Min migbar norogn new kets’dq yemiqot’er

CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot

VERSE 4
Yelbe kurat new yeayne kefta
Medhenite Iyesus yeserawit Geta
Bimregn new bimregn bemeqdesu yaqomegn
Biyasbegn new biyasbegn bekeftaw yanoregn

CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot

VERSE 5
Zeytu endet fela berase yafeseskew
Zufan litawersegn liben yemeret’kew
Yene yetewededew keelyam dem gibat
Medhenite Iyesus honeኸgn new wibet

CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot

VERSE 6
Bimregn new bimregn bemeqdesu yaqomegn
Biyasbegn new biyasbegn bekeftaw yanoregn (2)

CHORUS
Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yetegnaw-siraye'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የትኛው ስራዬ ነው የትኛው ህይወቴ/2/
ሞገስ ሆኖኝ እንጂ እግዚአብሔር አባቴ/2/
ልጅዋን ትረሳ ዘንድ እናት እንኳን ብትስት
አንተ ግን ወደድከኝ ላትረሳኝ በሞት

VERSE 1
በመዳፍህ ቀርፀህ ሁሌ ታየኛለህ
መድሀኒቴ ኢየሱስ በደሌን እረስተህ
ቢምረኝ ነው ቢምረኝ በመቅደሱ ያቆመኝ
ቢያስበኝ ነው ቢያስበኝ በከፍታው ያኖረኝ

VERSE 2
የአብርሀምን ምግባር የዮሴፍን እምነት
ፅድቅን ባልኳለው ባላደርግ መቀነት
ማህተቡን ይዣለሁ የደሙን ጠብታ
መድሀኒቴ ኢየሱስ አክብሮኛል ጌታ

VERSE 3
ቢምረኝ ነው ቢምረኝ በመቅደሱ ያቆመኝ
ቢያስበኝ ነው ቢያስበኝ በከፍታው ያኖረኝ
እንዳልፈው የረዳኝ የእሳቱን ባህር
ምን ምግባር ኖሮኝ ነው ከፅድቅ የሚቆጠር

VERSE 4
የልቤ ኩራት ነው የአይኔ ከፍታ
መድሀኒቴ ኢየሱስ የሠራዊት ጌታ
ቢምረኝ ነው ቢምረኝ በመቅደሱ ያቆመኝ
ቢያስበኝ ነው ቢያስበኝ በከፍታው ያኖረኝ

VERSE 5
ዘይቱ እንዴት ፈላ በራሴ ያፈሰስከው
ዙፋን ልታወርሰኝ ልቤን የመረጥከው
የኔ የተወደደው ከኤልያም ደም ግባት
መድሀኒቴ ኢየሱስ ሆነኸኝ ነው ውበት

VERSE 6
ቢምረኝ ነው ቢምረኝ በመቅደሱ ያቆመኝ
ቢያስበኝ ነው ቢያስበኝ በከፍታው ያኖረኝ/2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yetgnaw siraye new yetgnaw hiywete (2)
Moges honogn enji Egziabher abate (2)
Lijwan tiresa zend enat enkwan bitst
Ante gin wededkegn latresagn bemot

VERSE 1
Bemedafh qerts’eh hule tayegnaleh
Medhenite Iyesus bedelen eresteh
Bimregn new bimregn bemeqdesu yaqomegn
Biyasbegn new biyasbegn bekeftaw yanoregn

VERSE 2
Yeabrhemn migbar yeyosefn emnet
Ts’dqn balkwalew baladerg meqenet
Mahtebun yizhalehu yedemun t’ebta
Medhenite Iyesus akbrognal Geta

VERSE 3
Bimregn new bimregn bemeqdesu yaqomegn
Biyasbegn new biyasbegn bekeftaw yanoregn
Endalfew yeredagn yeesatun bahr
Min migbar norogn new kets’dq yemiqot’er

VERSE 4
Yelbe kurat new yeayne kefta
Medhenite Iyesus yeserawit Geta
Bimregn new bimregn bemeqdesu yaqomegn
Biyasbegn new biyasbegn bekeftaw yanoregn

VERSE 5
Zeytu endet fela berase yafeseskew
Zufan litawersegn liben yemeret’kew
Yene yetewededew keelyam dem gibat
Medhenite Iyesus honeኸgn new wibet

VERSE 6
Bimregn new bimregn bemeqdesu yaqomegn
Biyasbegn new biyasbegn bekeftaw yanoregn (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yetegnaw-siraye', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yeteshale Neger (yeteshale-neger)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 1
አንተ ግን ስጦታህ ብዙ ነው ታደርግኛለህ በጊዜው
አንተ እኮ አትፈልግም ውድቀቴን ሁልጊዜ በጭንቀት ማንባቴን
አንዱን ችግር ሳልሻገረው ይደረባ ገዝፎ ሌላኛው
የሕይወትን ውጣውረድ አይቻለሁ ስንቱን መንገድ

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 2
ጨለማ ቢረዝም ሌሊቱ አይኔ አይቅርም ብርሃን ማየቱ እሩቅ የመሰለው ይቀርባል ሰላም ወደ ቤቴ ይገባል
ፈተናዬ ቢበዛብኝ የሃዘኔ ማብቂያው ቢርቅ አምላክ ባንተ ታሪክ ይሆናል
የደስታ ቀን ወደ እኔም ይመጣል
አንተ አትሳሳትም በስራህ ፍፁም እና መልካም አባት ነህ እስከሚሆን ድረስ ተራዬ እጠብቅሃለው ጌታዬ

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 3
አለፈ እኮ ዘመኔ እያልኩ
በማጉረምረም ይሄው አለሁ ጽናት ጎድሎት ልቤ ቢያማርር ያሰብክልኝ ያልከው አይቀርም
አንተ ግን ስጦታህ ብዙ ነው ታደርግልኛለህ በጊዜው አንተ እኮ አትፈልግም ውድቀቴን
ሁልጊዜ በጭንቀት ማንባቴን

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል',
      lyrics_transliteration = 'CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 1
Ante gin sit’otah bizu new taderggnaleh begizew
Ante eko atfelgm widqeten hulgize bech’nqet manbaten
Andun chgr salshagerew yidereba gezfo lelagnaw
Yehywetn wit’awred aychalehu sintun menged

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 2
Ch’elema birezm lelitu ayne ayqrm birhan mayetu eruq yemeselew yiqerbal selam wede bete yigebal
Fetenaye bibezabgn yehazene mabqiyaw birq amlak bante tarik yihonal
Yedesta qen wede enem yimet’al
Ante atsasatm besrah fits’um ena melkam abat neh eskemihon dires teraye et’ebqhalew Getaye

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 3
Alefe eko zemene eyalku
Bemaguremrem yihew alehu ts’nat godlot libe biyamarr yasebklgn yalkew ayqerm
Ante gin sit’otah bizu new taderglgnaleh begizew ante eko atfelgm widqeten
Hulgize bech’nqet manbaten

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yeteshale-neger'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 1
አንተ ግን ስጦታህ ብዙ ነው ታደርግኛለህ በጊዜው
አንተ እኮ አትፈልግም ውድቀቴን ሁልጊዜ በጭንቀት ማንባቴን
አንዱን ችግር ሳልሻገረው ይደረባ ገዝፎ ሌላኛው
የሕይወትን ውጣውረድ አይቻለሁ ስንቱን መንገድ

VERSE 2
ጨለማ ቢረዝም ሌሊቱ አይኔ አይቅርም ብርሃን ማየቱ እሩቅ የመሰለው ይቀርባል ሰላም ወደ ቤቴ ይገባል
ፈተናዬ ቢበዛብኝ የሃዘኔ ማብቂያው ቢርቅ አምላክ ባንተ ታሪክ ይሆናል
የደስታ ቀን ወደ እኔም ይመጣል
አንተ አትሳሳትም በስራህ ፍፁም እና መልካም አባት ነህ እስከሚሆን ድረስ ተራዬ እጠብቅሃለው ጌታዬ

VERSE 3
አለፈ እኮ ዘመኔ እያልኩ
በማጉረምረም ይሄው አለሁ ጽናት ጎድሎት ልቤ ቢያማርር ያሰብክልኝ ያልከው አይቀርም
አንተ ግን ስጦታህ ብዙ ነው ታደርግልኛለህ በጊዜው አንተ እኮ አትፈልግም ውድቀቴን
ሁልጊዜ በጭንቀት ማንባቴን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 1
Ante gin sit’otah bizu new taderggnaleh begizew
Ante eko atfelgm widqeten hulgize bech’nqet manbaten
Andun chgr salshagerew yidereba gezfo lelagnaw
Yehywetn wit’awred aychalehu sintun menged

VERSE 2
Ch’elema birezm lelitu ayne ayqrm birhan mayetu eruq yemeselew yiqerbal selam wede bete yigebal
Fetenaye bibezabgn yehazene mabqiyaw birq amlak bante tarik yihonal
Yedesta qen wede enem yimet’al
Ante atsasatm besrah fits’um ena melkam abat neh eskemihon dires teraye et’ebqhalew Getaye

VERSE 3
Alefe eko zemene eyalku
Bemaguremrem yihew alehu ts’nat godlot libe biyamarr yasebklgn yalkew ayqerm
Ante gin sit’otah bizu new taderglgnaleh begizew ante eko atfelgm widqeten
Hulgize bech’nqet manbaten'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yeteshale-neger', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yeteshale Neger (yeteshale-neger-3977)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 1
አንተ ግን ስጦታህ ብዙ ነው ታደርግኛለህ በጊዜው
አንተ እኮ አትፈልግም ውድቀቴን ሁልጊዜ በጭንቀት ማንባቴን
አንዱን ችግር ሳልሻገረው ይደረባ ገዝፎ ሌላኛው
የሕይወትን ውጣውረድ አይቻለሁ ስንቱን መንገድ

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 2
ጨለማ ቢረዝም ሌሊቱ አይኔ አይቅርም ብርሃን ማየቱ እሩቅ የመሰለው ይቀርባል ሰላም ወደ ቤቴ ይገባል
ፈተናዬ ቢበዛብኝ የሃዘኔ ማብቂያው ቢርቅ አምላክ ባንተ ታሪክ ይሆናል
የደስታ ቀን ወደ እኔም ይመጣል
አንተ አትሳሳትም በስራህ ፍፁም እና መልካም አባት ነህ እስከሚሆን ድረስ ተራዬ እጠብቅሃለው ጌታዬ

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 3
አለፈ እኮ ዘመኔ እያልኩ
በማጉረምረም ይሄው አለሁ ጽናት ጎድሎት ልቤ ቢያማርር ያሰብክልኝ ያልከው አይቀርም
አንተ ግን ስጦታህ ብዙ ነው ታደርግልኛለህ በጊዜው አንተ እኮ አትፈልግም ውድቀቴን
ሁልጊዜ በጭንቀት ማንባቴን

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል',
      lyrics_transliteration = 'CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 1
Ante gin sit’otah bizu new taderggnaleh begizew
Ante eko atfelgm widqeten hulgize bech’nqet manbaten
Andun chgr salshagerew yidereba gezfo lelagnaw
Yehywetn wit’awred aychalehu sintun menged

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 2
Ch’elema birezm lelitu ayne ayqrm birhan mayetu eruq yemeselew yiqerbal selam wede bete yigebal
Fetenaye bibezabgn yehazene mabqiyaw birq amlak bante tarik yihonal
Yedesta qen wede enem yimet’al
Ante atsasatm besrah fits’um ena melkam abat neh eskemihon dires teraye et’ebqhalew Getaye

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 3
Alefe eko zemene eyalku
Bemaguremrem yihew alehu ts’nat godlot libe biyamarr yasebklgn yalkew ayqerm
Ante gin sit’otah bizu new taderglgnaleh begizew ante eko atfelgm widqeten
Hulgize bech’nqet manbaten

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yeteshale-neger-3977'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 1
አንተ ግን ስጦታህ ብዙ ነው ታደርግኛለህ በጊዜው
አንተ እኮ አትፈልግም ውድቀቴን ሁልጊዜ በጭንቀት ማንባቴን
አንዱን ችግር ሳልሻገረው ይደረባ ገዝፎ ሌላኛው
የሕይወትን ውጣውረድ አይቻለሁ ስንቱን መንገድ

VERSE 2
ጨለማ ቢረዝም ሌሊቱ አይኔ አይቅርም ብርሃን ማየቱ እሩቅ የመሰለው ይቀርባል ሰላም ወደ ቤቴ ይገባል
ፈተናዬ ቢበዛብኝ የሃዘኔ ማብቂያው ቢርቅ አምላክ ባንተ ታሪክ ይሆናል
የደስታ ቀን ወደ እኔም ይመጣል
አንተ አትሳሳትም በስራህ ፍፁም እና መልካም አባት ነህ እስከሚሆን ድረስ ተራዬ እጠብቅሃለው ጌታዬ

VERSE 3
አለፈ እኮ ዘመኔ እያልኩ
በማጉረምረም ይሄው አለሁ ጽናት ጎድሎት ልቤ ቢያማርር ያሰብክልኝ ያልከው አይቀርም
አንተ ግን ስጦታህ ብዙ ነው ታደርግልኛለህ በጊዜው አንተ እኮ አትፈልግም ውድቀቴን
ሁልጊዜ በጭንቀት ማንባቴን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 1
Ante gin sit’otah bizu new taderggnaleh begizew
Ante eko atfelgm widqeten hulgize bech’nqet manbaten
Andun chgr salshagerew yidereba gezfo lelagnaw
Yehywetn wit’awred aychalehu sintun menged

VERSE 2
Ch’elema birezm lelitu ayne ayqrm birhan mayetu eruq yemeselew yiqerbal selam wede bete yigebal
Fetenaye bibezabgn yehazene mabqiyaw birq amlak bante tarik yihonal
Yedesta qen wede enem yimet’al
Ante atsasatm besrah fits’um ena melkam abat neh eskemihon dires teraye et’ebqhalew Getaye

VERSE 3
Alefe eko zemene eyalku
Bemaguremrem yihew alehu ts’nat godlot libe biyamarr yasebklgn yalkew ayqerm
Ante gin sit’otah bizu new taderglgnaleh begizew ante eko atfelgm widqeten
Hulgize bech’nqet manbaten'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yeteshale-neger-3977', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yeteshale Neger Asibehilign New (yeteshale-neger-asibehilign-new)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 1
አንተ ግን ስጦታህ ብዙ ነው ታደርግኛለህ በጊዜው
አንተ እኮ አትፈልግም ውድቀቴን ሁልጊዜ በጭንቀት ማንባቴን
አንዱን ችግር ሳልሻገረው ይደረባ ገዝፎ ሌላኛው
የሕይወትን ውጣውረድ አይቻለሁ ስንቱን መንገድ

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 2
ጨለማ ቢረዝም ሌሊቱ አይኔ አይቅርም ብርሃን ማየቱ እሩቅ የመሰለው ይቀርባል ሰላም ወደ ቤቴ ይገባል
ፈተናዬ ቢበዛብኝ የሃዘኔ ማብቂያው ቢርቅ አምላክ ባንተ ታሪክ ይሆናል
የደስታ ቀን ወደ እኔም ይመጣል
አንተ አትሳሳትም በስራህ ፍፁም እና መልካም አባት ነህ እስከሚሆን ድረስ ተራዬ እጠብቅሃለው ጌታዬ

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 3
አለፈ እኮ ዘመኔ እያልኩ
በማጉረምረም ይሄው አለሁ ጽናት ጎድሎት ልቤ ቢያማርር ያሰብክልኝ ያልከው አይቀርም
አንተ ግን ስጦታህ ብዙ ነው ታደርግልኛለህ በጊዜው አንተ እኮ አትፈልግም ውድቀቴን
ሁልጊዜ በጭንቀት ማንባቴን

CHORUS
የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል',
      lyrics_transliteration = 'CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 1
Ante gin sit’otah bizu new taderggnaleh begizew
Ante eko atfelgm widqeten hulgize bech’nqet manbaten
Andun chgr salshagerew yidereba gezfo lelagnaw
Yehywetn wit’awred aychalehu sintun menged

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 2
Ch’elema birezm lelitu ayne ayqrm birhan mayetu eruq yemeselew yiqerbal selam wede bete yigebal
Fetenaye bibezabgn yehazene mabqiyaw birq amlak bante tarik yihonal
Yedesta qen wede enem yimet’al
Ante atsasatm besrah fits’um ena melkam abat neh eskemihon dires teraye et’ebqhalew Getaye

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 3
Alefe eko zemene eyalku
Bemaguremrem yihew alehu ts’nat godlot libe biyamarr yasebklgn yalkew ayqerm
Ante gin sit’otah bizu new taderglgnaleh begizew ante eko atfelgm widqeten
Hulgize bech’nqet manbaten

CHORUS
Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yeteshale-neger-asibehilign-new'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የተሻለ ነገር አስበህልኝ ነው ፈተናው የበዛው
ነገ መልካሙን ቀን አያለሁ በዚህም አምናለሁ (2)
ሰው ነኝ መቼም እቸኩላለሁ የሃሳቤን ቶሎ እሻለሁ
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል

VERSE 1
አንተ ግን ስጦታህ ብዙ ነው ታደርግኛለህ በጊዜው
አንተ እኮ አትፈልግም ውድቀቴን ሁልጊዜ በጭንቀት ማንባቴን
አንዱን ችግር ሳልሻገረው ይደረባ ገዝፎ ሌላኛው
የሕይወትን ውጣውረድ አይቻለሁ ስንቱን መንገድ

VERSE 2
ጨለማ ቢረዝም ሌሊቱ አይኔ አይቅርም ብርሃን ማየቱ እሩቅ የመሰለው ይቀርባል ሰላም ወደ ቤቴ ይገባል
ፈተናዬ ቢበዛብኝ የሃዘኔ ማብቂያው ቢርቅ አምላክ ባንተ ታሪክ ይሆናል
የደስታ ቀን ወደ እኔም ይመጣል
አንተ አትሳሳትም በስራህ ፍፁም እና መልካም አባት ነህ እስከሚሆን ድረስ ተራዬ እጠብቅሃለው ጌታዬ

VERSE 3
አለፈ እኮ ዘመኔ እያልኩ
በማጉረምረም ይሄው አለሁ ጽናት ጎድሎት ልቤ ቢያማርር ያሰብክልኝ ያልከው አይቀርም
አንተ ግን ስጦታህ ብዙ ነው ታደርግልኛለህ በጊዜው አንተ እኮ አትፈልግም ውድቀቴን
ሁልጊዜ በጭንቀት ማንባቴን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yeteshale neger asbehlgn new fetenaw yebezaw
Nege melkamun qen ayalehu bezihm amnalehu (2)
Sew negn mechem echekulalehu yehasaben tolo eshalehu
Andandema beqa restognal elalehu enen titognal

VERSE 1
Ante gin sit’otah bizu new taderggnaleh begizew
Ante eko atfelgm widqeten hulgize bech’nqet manbaten
Andun chgr salshagerew yidereba gezfo lelagnaw
Yehywetn wit’awred aychalehu sintun menged

VERSE 2
Ch’elema birezm lelitu ayne ayqrm birhan mayetu eruq yemeselew yiqerbal selam wede bete yigebal
Fetenaye bibezabgn yehazene mabqiyaw birq amlak bante tarik yihonal
Yedesta qen wede enem yimet’al
Ante atsasatm besrah fits’um ena melkam abat neh eskemihon dires teraye et’ebqhalew Getaye

VERSE 3
Alefe eko zemene eyalku
Bemaguremrem yihew alehu ts’nat godlot libe biyamarr yasebklgn yalkew ayqerm
Ante gin sit’otah bizu new taderglgnaleh begizew ante eko atfelgm widqeten
Hulgize bech’nqet manbaten'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yeteshale-neger-asibehilign-new', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yetewedede Ken (yetewedede-ken)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 1
አምሽቶ የመጣ አይገባም አትበሉ
አባክኖ የመጣ አይገባም አትበሉ
ፍቅር ሰለሆነ እግዚአብሔር ለሁሉ
ልጅ ቤቱን ይወርሳል እንደተሰፋ ቃሉ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 2
ከናዝሬት መልካም ሰው አይወጣም እያሉ
ፊልጶስ ናትናኤል ይነጋገራሉ
አድርጎታልና ውሀውን ወይን
ዛሬም ለውጦኛል ወስዶታል ልቤን

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 3
እኔ ነኝ አላማው እኔ ነኝ ሀሳቡ
አባቴ ደግ ነው የሚራራ ልቡ
ዘጠና ዘጠኙን ታምነውት እያለ
አንዱን ይፈልጋል ወዴት ነህ እያለ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 4
ሁሉን አይቻለሁ ሁሉን መርምሬአለሁ
በዓለም ካንተ ሌላ እንደሌለ አውቃለሁ
እንደማይለወጥ አባትነትህ ወዳጅነትህ
ጠፍቼ ስመጣ አየሁት ልጅህ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 5
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት x2

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2',
      lyrics_transliteration = 'CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 1
Amshto yemet’a aygebam atbelu
Abakno yemet’a aygebam atbelu
Fiqr selehone Egziabher lehulu
Lij betun yiwersal endetesefa qalu

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 2
Kenazret melkam sew aywet’am eyalu
Filp’os natnael yinegageralu
Adrgotalna wihewn weyn
Zarem lewt’ognal wesdotal liben

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 3
Ene negn alamaw ene negn hesabu
Abate deg new yemirara libu
Zet’ena zet’egnun tamnewt eyale
Andun yifelgal wedet neh eyale

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 4
Hulun aychalehu hulun mermrealehu
Bealem kante lela endelele awqalehu
Endemaylewet’ abatneth wedajneth
T’efche simet’a ayehut lijh

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 5
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet x2

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yetewedede-ken'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 1
አምሽቶ የመጣ አይገባም አትበሉ
አባክኖ የመጣ አይገባም አትበሉ
ፍቅር ሰለሆነ እግዚአብሔር ለሁሉ
ልጅ ቤቱን ይወርሳል እንደተሰፋ ቃሉ

VERSE 2
ከናዝሬት መልካም ሰው አይወጣም እያሉ
ፊልጶስ ናትናኤል ይነጋገራሉ
አድርጎታልና ውሀውን ወይን
ዛሬም ለውጦኛል ወስዶታል ልቤን

VERSE 3
እኔ ነኝ አላማው እኔ ነኝ ሀሳቡ
አባቴ ደግ ነው የሚራራ ልቡ
ዘጠና ዘጠኙን ታምነውት እያለ
አንዱን ይፈልጋል ወዴት ነህ እያለ

VERSE 4
ሁሉን አይቻለሁ ሁሉን መርምሬአለሁ
በዓለም ካንተ ሌላ እንደሌለ አውቃለሁ
እንደማይለወጥ አባትነትህ ወዳጅነትህ
ጠፍቼ ስመጣ አየሁት ልጅህ

VERSE 5
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት x2'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 1
Amshto yemet’a aygebam atbelu
Abakno yemet’a aygebam atbelu
Fiqr selehone Egziabher lehulu
Lij betun yiwersal endetesefa qalu

VERSE 2
Kenazret melkam sew aywet’am eyalu
Filp’os natnael yinegageralu
Adrgotalna wihewn weyn
Zarem lewt’ognal wesdotal liben

VERSE 3
Ene negn alamaw ene negn hesabu
Abate deg new yemirara libu
Zet’ena zet’egnun tamnewt eyale
Andun yifelgal wedet neh eyale

VERSE 4
Hulun aychalehu hulun mermrealehu
Bealem kante lela endelele awqalehu
Endemaylewet’ abatneth wedajneth
T’efche simet’a ayehut lijh

VERSE 5
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet x2'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yetewedede-ken', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yetewedede Ken…zemarit Betselot Asimare (yetewedede-ken-zemarit-betselot-asimare)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 1
አምሽቶ የመጣ አይገባም አትበሉ
አባክኖ የመጣ አይገባም አትበሉ
ፍቅር ሰለ��ነ እግዚአብሔር ለሁሉ
ልጅ ቤቱን ይወርሳል እንደተሰፋ ቃሉ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 2
ከናዝሬት መልካም ሰው አይወጣም እያሉ
ፊልጶስ ናትናኤል ይነጋገራሉ
አድርጎታልና ውሀውን ወይን
ዛሬም ለውጦኛል ወስዶታል ልቤን

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 3
እኔ ነኝ አላማው እኔ ነኝ ሀሳቡ
አባቴ ደግ ነው የሚራራ ልቡ
ዘጠና ዘጠኙን ታምነውት እያለ
አንዱን ይፈልጋል ወዴት ነህ እያለ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 4
ሁሉን አይቻለሁ ሁሉን መርምሬአለሁ
በዓለም ካንተ ሌላ እንደሌለ አውቃለሁ
እንደማይለወጥ አባትነትህ ወዳጅነትህ
ጠፍቼ ስመጣ አየሁት ልጅህ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 5
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት x2

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2',
      lyrics_transliteration = 'CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 1
Amshto yemet’a aygebam atbelu
Abakno yemet’a aygebam atbelu
Fiqr sele��ne Egziabher lehulu
Lij betun yiwersal endetesefa qalu

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 2
Kenazret melkam sew aywet’am eyalu
Filp’os natnael yinegageralu
Adrgotalna wihewn weyn
Zarem lewt’ognal wesdotal liben

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 3
Ene negn alamaw ene negn hesabu
Abate deg new yemirara libu
Zet’ena zet’egnun tamnewt eyale
Andun yifelgal wedet neh eyale

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 4
Hulun aychalehu hulun mermrealehu
Bealem kante lela endelele awqalehu
Endemaylewet’ abatneth wedajneth
T’efche simet’a ayehut lijh

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 5
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet x2

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yetewedede-ken-zemarit-betselot-asimare'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 1
አምሽቶ የመጣ አይገባም አትበሉ
አባክኖ የመጣ አይገባም አትበሉ
ፍቅር ሰለ��ነ እግዚአብሔር ለሁሉ
ልጅ ቤቱን ይወርሳል እንደተሰፋ ቃሉ

VERSE 2
ከናዝሬት መልካም ሰው አይወጣም እያሉ
ፊልጶስ ናትናኤል ይነጋገራሉ
አድርጎታልና ውሀውን ወይን
ዛሬም ለውጦኛል ወስዶታል ልቤን

VERSE 3
እኔ ነኝ አላማው እኔ ነኝ ሀሳቡ
አባቴ ደግ ነው የሚራራ ልቡ
ዘጠና ዘጠኙን ታምነውት እያለ
አንዱን ይፈልጋል ወዴት ነህ እያለ

VERSE 4
ሁሉን አይቻለሁ ሁሉን መርምሬአለሁ
በዓለም ካንተ ሌላ እንደሌለ አውቃለሁ
እንደማይለወጥ አባትነትህ ወዳጅነትህ
ጠፍቼ ስመጣ አየሁት ልጅህ

VERSE 5
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት x2'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 1
Amshto yemet’a aygebam atbelu
Abakno yemet’a aygebam atbelu
Fiqr sele��ne Egziabher lehulu
Lij betun yiwersal endetesefa qalu

VERSE 2
Kenazret melkam sew aywet’am eyalu
Filp’os natnael yinegageralu
Adrgotalna wihewn weyn
Zarem lewt’ognal wesdotal liben

VERSE 3
Ene negn alamaw ene negn hesabu
Abate deg new yemirara libu
Zet’ena zet’egnun tamnewt eyale
Andun yifelgal wedet neh eyale

VERSE 4
Hulun aychalehu hulun mermrealehu
Bealem kante lela endelele awqalehu
Endemaylewet’ abatneth wedajneth
T’efche simet’a ayehut lijh

VERSE 5
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet x2'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yetewedede-ken-zemarit-betselot-asimare', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yetibeb Sewoch Metu (yetibeb-sewoch-metu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ

VERSE 1
አዝ
የጥበብ ሰዎች መጡ/፪/ ሰምተውት በዜና /፪
እያበራላቸው ኮከብ እንደፋና /፪
አዝ

CHORUS
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ

VERSE 2
ድንግል እመቤቴ ሰላምታ ይድረስሽ
ለአምላክ ወገኖች መመኪያቸው የሆንሽ
ከአንቺ ተወለደ የዓለም መድኅን
ኩነኔን አጥፍቶ ጽድቅን ሊያወርሰን

CHORUS
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ

VERSE 3
አዝ
ጌታችን ሲወለድ በቤተልሔም
ሐዘን ተደምስሶ ሰፈነ ሰላም
እንጨቶች አፈሩ ፍሬ በረከት

CHORUS
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ

VERSE 4
ወንዞች ሁሉ ሆኑ ማርና ወተት
አዝ
ሰብአ ሰገል መጡ ሊሰግዱ በሙሉ
የእስራኤል ንጉሥ ወደ የት አለ እያሉ

CHORUS
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ

VERSE 5
እጅ መንሻውን ሰጡት እንደየሥርዓቱ
እጣኑን ለክህነት ወርቁን ለመንግሥቱ
አሜን ዝማሬ መላእክትን ያሰማልን

CHORUS
ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ',
      lyrics_transliteration = 'CHORUS
Semayna midr yemaywesnutn
Tewesno ayenew bet’ebab deret
Zet’ena zet’egnun melaektn tito
Agegnenew zare beberet tegnto

VERSE 1
CHORUS
Yet’beb sewoch met’u (2) semtewt bezena /2
Eyaberalachew kokeb endefana /2
CHORUS

CHORUS
Semayna midr yemaywesnutn
Tewesno ayenew bet’ebab deret
Zet’ena zet’egnun melaektn tito
Agegnenew zare beberet tegnto

VERSE 2
Dingil Emebete selamta yidressh
Leamlak wegenoch memekiyachew yehonsh
Keanchi tewelede yealem medhn
Kunenen at’fto ts’dqn liyawersen

CHORUS
Semayna midr yemaywesnutn
Tewesno ayenew bet’ebab deret
Zet’ena zet’egnun melaektn tito
Agegnenew zare beberet tegnto

VERSE 3
CHORUS
Getachen siweled bebetelhem
Hezen tedemsso sefene selam
Ench’etoch aferu fire bereket

CHORUS
Semayna midr yemaywesnutn
Tewesno ayenew bet’ebab deret
Zet’ena zet’egnun melaektn tito
Agegnenew zare beberet tegnto

VERSE 4
Wenzoch hulu honu marna wetet
CHORUS
Seba segel met’u lisegdu bemulu
Yeesrael nigus wede yet ale eyalu

CHORUS
Semayna midr yemaywesnutn
Tewesno ayenew bet’ebab deret
Zet’ena zet’egnun melaektn tito
Agegnenew zare beberet tegnto

VERSE 5
Ej menshawn set’ut endeyesratu
Et’anun lekhnet werqun lemengstu
Amen zimare melaektn yasemaln

CHORUS
Semayna midr yemaywesnutn
Tewesno ayenew bet’ebab deret
Zet’ena zet’egnun melaektn tito
Agegnenew zare beberet tegnto',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yetibeb-sewoch-metu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ሰማይና ምድር የማይወስኑትን
ተወስኖ አየነው በጠባብ ደረት
ዘጠና ዘጠኙን መላእክትን ትቶ
አገኘነው ዛሬ በበረት ተኝቶ

VERSE 1
የጥበብ ሰዎች መጡ/፪/ ሰምተውት በዜና /፪
እያበራላቸው ኮከብ እንደፋና /፪

VERSE 2
ድንግል እመቤቴ ሰላምታ ይድረስሽ
ለአምላክ ወገኖች መመኪያቸው የሆንሽ
ከአንቺ ተወለደ የዓለም መድኅን
ኩነኔን አጥፍቶ ጽድቅን ሊያወርሰን

VERSE 3
ጌታችን ሲወለድ በቤተልሔም
ሐዘን ተደምስሶ ሰፈነ ሰላም
እንጨቶች አፈሩ ፍሬ በረከት

VERSE 4
ወንዞች ሁሉ ሆኑ ማርና ወተት
ሰብአ ሰገል መጡ ሊሰግዱ በሙሉ
የእስራኤል ንጉሥ ወደ የት አለ እያሉ

VERSE 5
እጅ መንሻውን ሰጡት እንደየሥርዓቱ
እጣኑን ለክህነት ወርቁን ለመንግሥቱ
አሜን ዝማሬ መላእክትን ያሰማልን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Semayna midr yemaywesnutn
Tewesno ayenew bet’ebab deret
Zet’ena zet’egnun melaektn tito
Agegnenew zare beberet tegnto

VERSE 1
Yet’beb sewoch met’u (2) semtewt bezena /2
Eyaberalachew kokeb endefana /2

VERSE 2
Dingil Emebete selamta yidressh
Leamlak wegenoch memekiyachew yehonsh
Keanchi tewelede yealem medhn
Kunenen at’fto ts’dqn liyawersen

VERSE 3
Getachen siweled bebetelhem
Hezen tedemsso sefene selam
Ench’etoch aferu fire bereket

VERSE 4
Wenzoch hulu honu marna wetet
Seba segel met’u lisegdu bemulu
Yeesrael nigus wede yet ale eyalu

VERSE 5
Ej menshawn set’ut endeyesratu
Et’anun lekhnet werqun lemengstu
Amen zimare melaektn yasemaln'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yetibeb-sewoch-metu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yetsadik Sew Tselot (yetsadik-sew-tselot)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል

VERSE 1
የኢያሱ ፀሎት ግዳጅን ፈፅሟል
በገባኦት ሰማይ ፀሀይን አቁሟል
ማድጋዋ ሟልቶል በኤልሳ በረከት
ከርሀብ ድናለች ሱናማዊቷ ሴት

CHORUS
የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል

VERSE 2
ህያው እንድትሆን ጴጥሮስ ፀለየላት
ጣቢታ ተነሳች ሞት ተሸንፎላት
ከሰገነት ወድቆ ቢሞት አዉጣኪስ
ህይወት ሰጠዉ አቅፎ ቅዱስ ጳዉሎስ

CHORUS
የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል

VERSE 3
በስሙ መከራን ለተቀበሉት
ይለመናል ጌታ ስለሰማዕታት
በፃድቅ ስም ዉሀ ለመስጠት የተጋ
ያገኛል ከእግዚአብሔር የፃድቁን ዋጋ

CHORUS
የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል

VERSE 4
ቃል ኪዳን ስላለዉ ከመረጣቸው
ስለማለላቸዉ በፅኑ መሀላዉ
ጌታ ስለነርሱ እንደሚማለድን
በመንፈስ ቅዱስ አፍ መፅሐፍ ነገረን

CHORUS
የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል',
      lyrics_transliteration = 'CHORUS
Yets’adq sewu ts’elot heyln yadergal
Ts’eheyn yaqomal mutan yasnesal
Ket’elat diyabilos nefsatn yinet’qal
Badowun madga bezeyt yimolal

VERSE 1
Yeiyasu ts’elot gidajn fets’mwal
Begebaot semay ts’eheyn aqumwal
Madgawa mwaltol beelsa bereket
Kerheb dinalech sunamawitwa set

CHORUS
Yets’adq sewu ts’elot heyln yadergal
Ts’eheyn yaqomal mutan yasnesal
Ket’elat diyabilos nefsatn yinet’qal
Badowun madga bezeyt yimolal

VERSE 2
Hiyaw endthon p’et’ros ts’eleyelat
T’abita tenesach mot teshenfolat
Kesegenet wedqo bimot awut’akis
Hiywet set’ewu aqfo Kidus p’awulos

CHORUS
Yets’adq sewu ts’elot heyln yadergal
Ts’eheyn yaqomal mutan yasnesal
Ket’elat diyabilos nefsatn yinet’qal
Badowun madga bezeyt yimolal

VERSE 3
Besmu mekeran leteqebelut
Yilemenal Geta silesemaetat
Bets’adq sim wuhe lemest’et yetega
Yagegnal keegziabher yets’adqun waga

CHORUS
Yets’adq sewu ts’elot heyln yadergal
Ts’eheyn yaqomal mutan yasnesal
Ket’elat diyabilos nefsatn yinet’qal
Badowun madga bezeyt yimolal

VERSE 4
Qal kidan silalewu kemeret’achew
Silemalelachewu bets’nu mehelawu
Geta silenersu endemimaledn
Bemenfes Kidus af mets’hef negeren

CHORUS
Yets’adq sewu ts’elot heyln yadergal
Ts’eheyn yaqomal mutan yasnesal
Ket’elat diyabilos nefsatn yinet’qal
Badowun madga bezeyt yimolal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yetsadik-sew-tselot'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የፃድቅ ሰዉ ፀሎት ሀይልን ያደርጋል
ፀሀይን ያቆማል ሙታን ያስነሳል
ከጠላት ዲያቢሎስ ነፍሳትን ይነጥቃል
ባዶዉን ማድጋ በዘይት ይሞላል

VERSE 1
የኢያሱ ፀሎት ግዳጅን ፈፅሟል
በገባኦት ሰማይ ፀሀይን አቁሟል
ማድጋዋ ሟልቶል በኤልሳ በረከት
ከርሀብ ድናለች ሱናማዊቷ ሴት

VERSE 2
ህያው እንድትሆን ጴጥሮስ ፀለየላት
ጣቢታ ተነሳች ሞት ተሸንፎላት
ከሰገነት ወድቆ ቢሞት አዉጣኪስ
ህይወት ሰጠዉ አቅፎ ቅዱስ ጳዉሎስ

VERSE 3
በስሙ መከራን ለተቀበሉት
ይለመናል ጌታ ስለሰማዕታት
በፃድቅ ስም ዉሀ ለመስጠት የተጋ
ያገኛል ከእግዚአብሔር የፃድቁን ዋጋ

VERSE 4
ቃል ኪዳን ስላለዉ ከመረጣቸው
ስለማለላቸዉ በፅኑ መሀላዉ
ጌታ ስለነርሱ እንደሚማለድን
በመንፈስ ቅዱስ አፍ መፅሐፍ ነገረን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yets’adq sewu ts’elot heyln yadergal
Ts’eheyn yaqomal mutan yasnesal
Ket’elat diyabilos nefsatn yinet’qal
Badowun madga bezeyt yimolal

VERSE 1
Yeiyasu ts’elot gidajn fets’mwal
Begebaot semay ts’eheyn aqumwal
Madgawa mwaltol beelsa bereket
Kerheb dinalech sunamawitwa set

VERSE 2
Hiyaw endthon p’et’ros ts’eleyelat
T’abita tenesach mot teshenfolat
Kesegenet wedqo bimot awut’akis
Hiywet set’ewu aqfo Kidus p’awulos

VERSE 3
Besmu mekeran leteqebelut
Yilemenal Geta silesemaetat
Bets’adq sim wuhe lemest’et yetega
Yagegnal keegziabher yets’adqun waga

VERSE 4
Qal kidan silalewu kemeret’achew
Silemalelachewu bets’nu mehelawu
Geta silenersu endemimaledn
Bemenfes Kidus af mets’hef negeren'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yetsadik-sew-tselot', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yetsidik Ber Nesh (yetsidik-ber-nesh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የፅድቅ በር ነሽ የሙሴ ፅላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንፁህ አክሊላችን
ሐመልማለ ሲና እመቤታችን (2)

VERSE 1
እመቤታችን ለእኛ ምርኩዝ ነሽ
እመቤታችን ከለላም ሆንሽን
እመቤታችን የእሳት ሙዳይ
እመቤታችን እሳት ታቀፍሽ

CHORUS
የፅድቅ በር ነሽ የሙሴ ፅላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንፁህ አክሊላችን
ሐመልማለ ሲና እመቤታችን (2)

VERSE 2
እመቤታችን በብርሀን ተከበሽ
እመቤታችን ወርቅ ለብሰሽ
እመቤታችን ከሴቶቹ ሁሉ
አመቤታችን አብ መረጠሽ

CHORUS
የፅድቅ በር ነሽ የሙሴ ፅላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንፁህ አክሊላችን
ሐመልማለ ሲና እመቤታችን (2)

VERSE 3
እመቤታችን ድንግል ሆይ ልጆችሽ
እመቤታችን ዘውትር ይጠሩሻል
እመቤታችን ስምሽን ለልጅ ልጅ
እመቤታችን ያሳስቡልሻል

CHORUS
የፅድቅ በር ነሽ የሙሴ ፅላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንፁህ አክሊላችን
ሐመልማለ ሲና እመቤታችን (2)

VERSE 4
እመቤታችን በተሰጠሽ ፀጋ
እመቤታችን ባአማላጅነትሽ
እመቤታችን ምህረትን አሰጪን
እመቤታችን ከመሀሪው ልጅሽ

CHORUS
የፅድቅ በር ነሽ የሙሴ ፅላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንፁህ አክሊላችን
ሐመልማለ ሲና እመቤታችን (2)

VERSE 5
እመቤታችን ያልታረሰች እርሻ
እመቤታችን ዘር ያልተዘራባት
እመቤታችን የህይወትን ፍሬ
እመቤታችን ሰጠችን የእኛ እናት

CHORUS
የፅድቅ በር ነሽ የሙሴ ፅላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንፁህ አክሊላችን
ሐመልማለ ሲና እመቤታችን (2)

VERSE 6
እመቤታችን የታረደው መሲህ
እመቤታችን እናቱን ወደዳት
እመቤታችን በቀኙ ቆማለች
እመቤታችን ድንግል እመቤት ናት

CHORUS
የፅድቅ በር ነሽ የሙሴ ፅላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንፁህ አክሊላችን
ሐመልማለ ሲና እመቤታችን (2)

VERSE 7
እመቤታችን የእውነት ደመና
እመቤታችን ዝናብ የታየባት
እመቤታችን ወዳናለች ድንግል
እመቤታችን የታተመች ገነት

CHORUS
የፅድቅ በር ነሽ የሙሴ ፅላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንፁህ አክሊላችን
ሐመልማለ ሲና እመቤታችን (2)

VERSE 8
እመቤታችን ክብርት ለሆነችው
እመቤታችን ኑ እንዘምርላት
እመቤታችን ደስ ይበልሽ እንበል
እመቤታችን ለብርሃን እናት

CHORUS
የፅድቅ በር ነሽ የሙሴ ፅላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንፁህ አክሊላችን
ሐመልማለ ሲና እመቤታችን (2)

VERSE 9
የፅድቅ በር ነሽ የሙሴ ፅላት
አክሊለ ሰማእታት ምእራገ ፀሎት
የጌታዬ እናት ንፁህ አክሊላችን
ሐመልማለ ሲና እመቤታችን (2)

CHORUS
የፅድቅ በር ነሽ የሙሴ ፅላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንፁህ አክሊላችን
ሐመልማለ ሲና እመቤታችን (2)',
      lyrics_transliteration = 'CHORUS
Yets’dq ber nesh yemuse ts’lat
Aklile semaetat mierage ts’elot
Yegetaye enat nits’uh aklilachn
Hemelmale sina Emebetachen (2)

VERSE 1
Emebetachen leegna mirkuz nesh
Emebetachen kelelam honshn
Emebetachen yeesat muday
Emebetachen esat taqefsh

CHORUS
Yets’dq ber nesh yemuse ts’lat
Aklile semaetat mierage ts’elot
Yegetaye enat nits’uh aklilachn
Hemelmale sina Emebetachen (2)

VERSE 2
Emebetachen bebrhen tekebesh
Emebetachen werq lebsesh
Emebetachen kesetochu hulu
Amebetachn Ab meret’esh

CHORUS
Yets’dq ber nesh yemuse ts’lat
Aklile semaetat mierage ts’elot
Yegetaye enat nits’uh aklilachn
Hemelmale sina Emebetachen (2)

VERSE 3
Emebetachen Dingil hoy lijochsh
Emebetachen zewtr yit’erushal
Emebetachen simshn lelj lij
Emebetachen yasasbulshal

CHORUS
Yets’dq ber nesh yemuse ts’lat
Aklile semaetat mierage ts’elot
Yegetaye enat nits’uh aklilachn
Hemelmale sina Emebetachen (2)

VERSE 4
Emebetachen beteset’esh ts’ega
Emebetachen baamalajnetsh
Emebetachen mihretn asech’in
Emebetachen kemeheriw lijsh

CHORUS
Yets’dq ber nesh yemuse ts’lat
Aklile semaetat mierage ts’elot
Yegetaye enat nits’uh aklilachn
Hemelmale sina Emebetachen (2)

VERSE 5
Emebetachen yaltaresech ersha
Emebetachen zer yaltezerabat
Emebetachen yehywetn fire
Emebetachen set’echn yeegna enat

CHORUS
Yets’dq ber nesh yemuse ts’lat
Aklile semaetat mierage ts’elot
Yegetaye enat nits’uh aklilachn
Hemelmale sina Emebetachen (2)

VERSE 6
Emebetachen yetaredew mesih
Emebetachen enatun wededat
Emebetachen beqegnu qomalech
Emebetachen Dingil emebet nat

CHORUS
Yets’dq ber nesh yemuse ts’lat
Aklile semaetat mierage ts’elot
Yegetaye enat nits’uh aklilachn
Hemelmale sina Emebetachen (2)

VERSE 7
Emebetachen yeewnet demena
Emebetachen zinab yetayebat
Emebetachen wedanalech Dingil
Emebetachen yetatemech genet

CHORUS
Yets’dq ber nesh yemuse ts’lat
Aklile semaetat mierage ts’elot
Yegetaye enat nits’uh aklilachn
Hemelmale sina Emebetachen (2)

VERSE 8
Emebetachen kibrt lehonechw
Emebetachen nu enzemrlat
Emebetachen des yibelsh enbel
Emebetachen lebrhan enat

CHORUS
Yets’dq ber nesh yemuse ts’lat
Aklile semaetat mierage ts’elot
Yegetaye enat nits’uh aklilachn
Hemelmale sina Emebetachen (2)

VERSE 9
Yets’dq ber nesh yemuse ts’lat
Aklile semaetat mierage ts’elot
Yegetaye enat nits’uh aklilachn
Hemelmale sina Emebetachen (2)

CHORUS
Yets’dq ber nesh yemuse ts’lat
Aklile semaetat mierage ts’elot
Yegetaye enat nits’uh aklilachn
Hemelmale sina Emebetachen (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yetsidik-ber-nesh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የፅድቅ በር ነሽ የሙሴ ፅላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንፁህ አክሊላችን
ሐመልማለ ሲና እመቤታችን (2)

VERSE 1
እመቤታችን ለእኛ ምርኩዝ ነሽ
እመቤታችን ከለላም ሆንሽን
እመቤታችን የእሳት ሙዳይ
እመቤታችን እሳት ታቀፍሽ

VERSE 2
እመቤታችን በብርሀን ተከበሽ
እመቤታችን ወርቅ ለብሰሽ
እመቤታችን ከሴቶቹ ሁሉ
አመቤታችን አብ መረጠሽ

VERSE 3
እመቤታችን ድንግል ሆይ ልጆችሽ
እመቤታችን ዘውትር ይጠሩሻል
እመቤታችን ስምሽን ለልጅ ልጅ
እመቤታችን ያሳስቡልሻል

VERSE 4
እመቤታችን በተሰጠሽ ፀጋ
እመቤታችን ባአማላጅነትሽ
እመቤታችን ምህረትን አሰጪን
እመቤታችን ከመሀሪው ልጅሽ

VERSE 5
እመቤታችን ያልታረሰች እርሻ
እመቤታችን ዘር ያልተዘራባት
እመቤታችን የህይወትን ፍሬ
እመቤታችን ሰጠችን የእኛ እናት

VERSE 6
እመቤታችን የታረደው መሲህ
እመቤታችን እናቱን ወደዳት
እመቤታችን በቀኙ ቆማለች
እመቤታችን ድንግል እመቤት ናት

VERSE 7
እመቤታችን የእውነት ደመና
እመቤታችን ዝናብ የታየባት
እመቤታችን ወዳናለች ድንግል
እመቤታችን የታተመች ገነት

VERSE 8
እመቤታችን ክብርት ለሆነችው
እመቤታችን ኑ እንዘምርላት
እመቤታችን ደስ ይበልሽ እንበል
እመቤታችን ለብርሃን እናት

VERSE 9
የፅድቅ በር ነሽ የሙሴ ፅላት
አክሊለ ሰማእታት ምእራገ ፀሎት
የጌታዬ እናት ንፁህ አክሊላችን
ሐመልማለ ሲና እመቤታችን (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yets’dq ber nesh yemuse ts’lat
Aklile semaetat mierage ts’elot
Yegetaye enat nits’uh aklilachn
Hemelmale sina Emebetachen (2)

VERSE 1
Emebetachen leegna mirkuz nesh
Emebetachen kelelam honshn
Emebetachen yeesat muday
Emebetachen esat taqefsh

VERSE 2
Emebetachen bebrhen tekebesh
Emebetachen werq lebsesh
Emebetachen kesetochu hulu
Amebetachn Ab meret’esh

VERSE 3
Emebetachen Dingil hoy lijochsh
Emebetachen zewtr yit’erushal
Emebetachen simshn lelj lij
Emebetachen yasasbulshal

VERSE 4
Emebetachen beteset’esh ts’ega
Emebetachen baamalajnetsh
Emebetachen mihretn asech’in
Emebetachen kemeheriw lijsh

VERSE 5
Emebetachen yaltaresech ersha
Emebetachen zer yaltezerabat
Emebetachen yehywetn fire
Emebetachen set’echn yeegna enat

VERSE 6
Emebetachen yetaredew mesih
Emebetachen enatun wededat
Emebetachen beqegnu qomalech
Emebetachen Dingil emebet nat

VERSE 7
Emebetachen yeewnet demena
Emebetachen zinab yetayebat
Emebetachen wedanalech Dingil
Emebetachen yetatemech genet

VERSE 8
Emebetachen kibrt lehonechw
Emebetachen nu enzemrlat
Emebetachen des yibelsh enbel
Emebetachen lebrhan enat

VERSE 9
Yets’dq ber nesh yemuse ts’lat
Aklile semaetat mierage ts’elot
Yegetaye enat nits’uh aklilachn
Hemelmale sina Emebetachen (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yetsidik-ber-nesh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yewededegn Geta (yewededegn-geta)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 1
ሰካራም ዘማዊ ወንበዴ ነበርኩኝ
ያመፀኞች መሪ ደምን ያፈሰስኩኝ
ዛሬ ግን ታሪኬን ጌታ ቀይሮታል
ለኃያሉ ጌታ ምስጋና ይገባል

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 2
ጌታ እኮ ነው ይህን ያደረገ
አምላኬ ነው ለኔ የታመነው
በዘመኔ ሁሉ ድንቅን የፈፀመው
ጌታ እኮ ነው ይህን ያደረገ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 3
ሳይከብድብኝ የዓለም ዝና
ተንበርክኬ ልስጥህ ምስጋና
ምክንያት አለኝ ለማዘንበሌ
ናታኔም ነኝ ይህቺ ናት ቃሌ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 4
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደ ዋጋ
አከበርከኝ ባንተ ፀጋ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 5
ናታኔም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 6
ህይወት ሰላምን ትቼ
የማይታይ አይቼ
ላንተ ብሰጥ ጀርባዬን
ልተዋወቅ ጠላቴን

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 7
የከበበኝ ውጊያ ነው
የተረፈኝ ፀፀት ነው
የሻርክልኝ ቁስለቴን
ተሰቅለህ ነው አባቴ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 8
በዋጋ ገዝተኸኛል እና
ስለእኔ ደም ከፍለሀል እና
በዋጋ ገዝተኸኛል እና
ስለእኔ ደም ከፍለሀል እና

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 9
ልሳኔ ያውጃል ክብርህን
አልረሳም ጌታ ውለታህን
ልሳኔ ያውጃል ክብርህን
አልረሳም ጌታ ውለታህን

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 10
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና ከአምላኬ ፊት ልስገድ
ወደላይ በሰማይ ወደታች በጥልቀት
አምላኬ የት አለ የምትገኝበት

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 11
አምላኬ የት አለ የምትገኝበት
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተው አይደለም ወይ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 12
የፈጠርከው ሁሉ ያንተው አይደለም ወይ
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተው አይደለም ወይ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 13
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ',
      lyrics_transliteration = 'CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 1
Sekaram zemawi wenbede neberkugn
Yamets’egnoch meri demn yafeseskugn
Zare gin tariken Geta qeyrotal
Lehayalu Geta misgana yigebal

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 2
Geta eko new yihn yaderege
Amlake new lene yetamenew
Bezemene hulu dinqn yefets’emew
Geta eko new yihn yaderege

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 3
Saykebdbgn yealem zina
Tenberkke list’h misgana
Miknyat alegn lemazenbele
Natanem negn yihchi nat qale

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 4
Dej hogne kante ber
Tesfa adrge sizemr
Qot’rehlgn ende waga
Akeberkegn bante ts’ega

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 5
Natanem negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 6
Hiywet selamn tiche
Yemaytay ayche
Lante biset’ jerbayen
Litewaweq t’elaten

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 7
Yekebebegn wigiya new
Yeterefegn ts’ets’et new
Yesharklgn qusleten
Teseqleh new abate

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 8
Bewaga gezteኸgnal ena
Sileene dem keflehel ena
Bewaga gezteኸgnal ena
Sileene dem keflehel ena

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 9
Lisane yawjal kibrhn
Alresam Geta wiletahn
Lisane yawjal kibrhn
Alresam Geta wiletahn

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 10
Qidusun meswaet liul silemiwed
Min yizhe limt’ana keamlake fit lisged
Wedelay besemay wedetach bet’lqet
Amlake yet ale yemtgegnbet

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 11
Amlake yet ale yemtgegnbet
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 12
Yefet’erkew hulu yantew aydelem wey
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 13
Yefet’erkew hulu yantew aydelem wey

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yewededegn-geta'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 1
ሰካራም ዘማዊ ወንበዴ ነበርኩኝ
ያመፀኞች መሪ ደምን ያፈሰስኩኝ
ዛሬ ግን ታሪኬን ጌታ ቀይሮታል
ለኃያሉ ጌታ ምስጋና ይገባል

VERSE 2
ጌታ እኮ ነው ይህን ያደረገ
አምላኬ ነው ለኔ የታመነው
በዘመኔ ሁሉ ድንቅን የፈፀመው
ጌታ እኮ ነው ይህን ያደረገ

VERSE 3
ሳይከብድብኝ የዓለም ዝና
ተንበርክኬ ልስጥህ ምስጋና
ምክንያት አለኝ ለማዘንበሌ
ናታኔም ነኝ ይህቺ ናት ቃሌ

VERSE 4
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደ ዋጋ
አከበርከኝ ባንተ ፀጋ

VERSE 5
ናታኔም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ

VERSE 6
ህይወት ሰላምን ትቼ
የማይታይ አይቼ
ላንተ ብሰጥ ጀርባዬን
ልተዋወቅ ጠላቴን

VERSE 7
የከበበኝ ውጊያ ነው
የተረፈኝ ፀፀት ነው
የሻርክልኝ ቁስለቴን
ተሰቅለህ ነው አባቴ

VERSE 8
በዋጋ ገዝተኸኛል እና
ስለእኔ ደም ከፍለሀል እና
በዋጋ ገዝተኸኛል እና
ስለእኔ ደም ከፍለሀል እና

VERSE 9
ልሳኔ ያውጃል ክብርህን
አልረሳም ጌታ ውለታህን
ልሳኔ ያውጃል ክብርህን
አልረሳም ጌታ ውለታህን

VERSE 10
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና ከአምላኬ ፊት ልስገድ
ወደላይ በሰማይ ወደታች በጥልቀት
አምላኬ የት አለ የምትገኝበት

VERSE 11
አምላኬ የት አለ የምትገኝበት
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተው አይደለም ወይ

VERSE 12
የፈጠርከው ሁሉ ያንተው አይደለም ወይ
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተው አይደለም ወይ

VERSE 13
የፈጠርከው ሁሉ ያንተው አይደለም ወይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 1
Sekaram zemawi wenbede neberkugn
Yamets’egnoch meri demn yafeseskugn
Zare gin tariken Geta qeyrotal
Lehayalu Geta misgana yigebal

VERSE 2
Geta eko new yihn yaderege
Amlake new lene yetamenew
Bezemene hulu dinqn yefets’emew
Geta eko new yihn yaderege

VERSE 3
Saykebdbgn yealem zina
Tenberkke list’h misgana
Miknyat alegn lemazenbele
Natanem negn yihchi nat qale

VERSE 4
Dej hogne kante ber
Tesfa adrge sizemr
Qot’rehlgn ende waga
Akeberkegn bante ts’ega

VERSE 5
Natanem negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta

VERSE 6
Hiywet selamn tiche
Yemaytay ayche
Lante biset’ jerbayen
Litewaweq t’elaten

VERSE 7
Yekebebegn wigiya new
Yeterefegn ts’ets’et new
Yesharklgn qusleten
Teseqleh new abate

VERSE 8
Bewaga gezteኸgnal ena
Sileene dem keflehel ena
Bewaga gezteኸgnal ena
Sileene dem keflehel ena

VERSE 9
Lisane yawjal kibrhn
Alresam Geta wiletahn
Lisane yawjal kibrhn
Alresam Geta wiletahn

VERSE 10
Qidusun meswaet liul silemiwed
Min yizhe limt’ana keamlake fit lisged
Wedelay besemay wedetach bet’lqet
Amlake yet ale yemtgegnbet

VERSE 11
Amlake yet ale yemtgegnbet
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey

VERSE 12
Yefet’erkew hulu yantew aydelem wey
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey

VERSE 13
Yefet’erkew hulu yantew aydelem wey'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yewededegn-geta', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yewededegn Geta Min Adirigelet New Bemuhaze Sibihat Dagimawi Deribe (yewededegn-geta-min-adirigelet-new-bemuhaze-sibihat-dagimawi-deribe)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 1
አ.ዝ //
በኢያሪኮ መንገድ ስለምን ቁጭ ብዬ
ብርሐን እጅግ ናፍቆኝ ከሰው ተገልዬ
የብርሐን ጌታ ወደ እኔ መጣና

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 2
ዓይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
ለብዙ ዘመናት አልጋ ላይ ተኝቼ
የሚረዳኝ አጣሁ ጠሉኝ ዘመዶቼ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 3
የእኔ ጌታ አምላኬ ወደእኔ መጣና
አይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
አሥራ ሁለት ዓመት ደም እየፈሰሰኝ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 4
ምራቅ እየተፉ ሁሉም ሲያንቋሽሹኝ
የጌታዬ ልብሱን ጫፉን ብዳስሰው
ሃይል ከእርሱ ወጣ ደሜን ቀጥ አረገው
አ.ዝ //

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 5
ሰካራም ዘማዊ ወንበዴ ነበርኩኝ
ያመፀኞች መሪ ደምን ያፈሰስኩኝ
ዛሬ ግን ታሪኬን ጌታ ቀይሮታል
ለሃያሉ ጌታ ምስጋና ይገባዋል

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ',
      lyrics_transliteration = 'CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 1
A.z //
Beiyariko menged silemn quch’ biye
Birhen ejg nafqogn kesew tegelye
Yebrhen Geta wede ene met’ana

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 2
Aynen aberalgn beeju dasesena
A.z //
Lebzu zemenat alga lay tegnche
Yemiredagn at’ahu t’elugn zemedoche

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 3
Yeene Geta amlake wedeene met’ana
Aynen aberalgn beeju dasesena
A.z //
Asra hulet amet dem eyefesesegn

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 4
Miraq eyetefu hulum siyanqwashshugn
Yegetaye libsun ch’afun bidassew
Hayl keersu wet’a demen qet’ aregew
A.z //

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 5
Sekaram zemawi wenbede neberkugn
Yamets’egnoch meri demn yafeseskugn
Zare gin tariken Geta qeyrotal
Lehayalu Geta misgana yigebawal

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yewededegn-geta-min-adirigelet-new-bemuhaze-sibihat-dagimawi-deribe'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 1
አ.ዝ //
በኢያሪኮ መንገድ ስለምን ቁጭ ብዬ
ብርሐን እጅግ ናፍቆኝ ከሰው ተገልዬ
የብርሐን ጌታ ወደ እኔ መጣና

VERSE 2
ዓይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
ለብዙ ዘመናት አልጋ ላይ ተኝቼ
የሚረዳኝ አጣሁ ጠሉኝ ዘመዶቼ

VERSE 3
የእኔ ጌታ አምላኬ ወደእኔ መጣና
አይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
አሥራ ሁለት ዓመት ደም እየፈሰሰኝ

VERSE 4
ምራቅ እየተፉ ሁሉም ሲያንቋሽሹኝ
የጌታዬ ልብሱን ጫፉን ብዳስሰው
ሃይል ከእርሱ ወጣ ደሜን ቀጥ አረገው
አ.ዝ //

VERSE 5
ሰካራም ዘማዊ ወንበዴ ነበርኩኝ
ያመፀኞች መሪ ደምን ያፈሰስኩኝ
ዛሬ ግን ታሪኬን ጌታ ቀይሮታል
ለሃያሉ ጌታ ምስጋና ይገባዋል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 1
A.z //
Beiyariko menged silemn quch’ biye
Birhen ejg nafqogn kesew tegelye
Yebrhen Geta wede ene met’ana

VERSE 2
Aynen aberalgn beeju dasesena
A.z //
Lebzu zemenat alga lay tegnche
Yemiredagn at’ahu t’elugn zemedoche

VERSE 3
Yeene Geta amlake wedeene met’ana
Aynen aberalgn beeju dasesena
A.z //
Asra hulet amet dem eyefesesegn

VERSE 4
Miraq eyetefu hulum siyanqwashshugn
Yegetaye libsun ch’afun bidassew
Hayl keersu wet’a demen qet’ aregew
A.z //

VERSE 5
Sekaram zemawi wenbede neberkugn
Yamets’egnoch meri demn yafeseskugn
Zare gin tariken Geta qeyrotal
Lehayalu Geta misgana yigebawal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yewededegn-geta-min-adirigelet-new-bemuhaze-sibihat-dagimawi-deribe', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yewodedegn Geta (yewodedegn-geta)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 1
አ.ዝ //
በኢያሪኮ መንገድ ስለምን ቁጭ ብዬ
ብርሐን እጅግ ናፍቆኝ ከሰው ተገልዬ
የብርሐን ጌታ ወደ እኔ መጣና

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 2
ዓይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
ለብዙ ዘመናት አልጋ ላይ ተኝቼ
የሚረዳኝ አጣሁ ጠሉኝ ዘመዶቼ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 3
የእኔ ጌታ አምላኬ ወደእኔ መጣና
አይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
አሥራ ሁለት ዓመት ደም እየፈሰሰኝ

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 4
ምራቅ እየተፉ ሁሉም ሲያንቋሽሹኝ
የጌታዬ ልብሱን ጫፉን ብዳስሰው
ሃይል ከእርሱ ወጣ ደሜን ቀጥ አረገው
አ.ዝ //

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 5
ሰካራም ዘማዊ ወንበዴ ነበርኩኝ
ያመፀኞች መሪ ደምን ያፈሰስኩኝ
ዛሬ ግን ታሪኬን ጌታ ቀይሮታል
ለሃያሉ ጌታ ምስጋና ይገባዋል

CHORUS
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ',
      lyrics_transliteration = 'CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 1
A.z //
Beiyariko menged silemn quch’ biye
Birhen ejg nafqogn kesew tegelye
Yebrhen Geta wede ene met’ana

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 2
Aynen aberalgn beeju dasesena
A.z //
Lebzu zemenat alga lay tegnche
Yemiredagn at’ahu t’elugn zemedoche

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 3
Yeene Geta amlake wedeene met’ana
Aynen aberalgn beeju dasesena
A.z //
Asra hulet amet dem eyefesesegn

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 4
Miraq eyetefu hulum siyanqwashshugn
Yegetaye libsun ch’afun bidassew
Hayl keersu wet’a demen qet’ aregew
A.z //

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 5
Sekaram zemawi wenbede neberkugn
Yamets’egnoch meri demn yafeseskugn
Zare gin tariken Geta qeyrotal
Lehayalu Geta misgana yigebawal

CHORUS
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yewodedegn-geta'
    AND lyrics_amharic IS NOT DISTINCT FROM 'የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

VERSE 1
አ.ዝ //
በኢያሪኮ መንገድ ስለምን ቁጭ ብዬ
ብርሐን እጅግ ናፍቆኝ ከሰው ተገልዬ
የብርሐን ጌታ ወደ እኔ መጣና

VERSE 2
ዓይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
ለብዙ ዘመናት አልጋ ላይ ተኝቼ
የሚረዳኝ አጣሁ ጠሉኝ ዘመዶቼ

VERSE 3
የእኔ ጌታ አምላኬ ወደእኔ መጣና
አይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
አሥራ ሁለት ዓመት ደም እየፈሰሰኝ

VERSE 4
ምራቅ እየተፉ ሁሉም ሲያንቋሽሹኝ
የጌታዬ ልብሱን ጫፉን ብዳስሰው
ሃይል ከእርሱ ወጣ ደሜን ቀጥ አረገው
አ.ዝ //

VERSE 5
ሰካራም ዘማዊ ወንበዴ ነበርኩኝ
ያመፀኞች መሪ ደምን ያፈሰስኩኝ
ዛሬ ግን ታሪኬን ጌታ ቀይሮታል
ለሃያሉ ጌታ ምስጋና ይገባዋል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

VERSE 1
A.z //
Beiyariko menged silemn quch’ biye
Birhen ejg nafqogn kesew tegelye
Yebrhen Geta wede ene met’ana

VERSE 2
Aynen aberalgn beeju dasesena
A.z //
Lebzu zemenat alga lay tegnche
Yemiredagn at’ahu t’elugn zemedoche

VERSE 3
Yeene Geta amlake wedeene met’ana
Aynen aberalgn beeju dasesena
A.z //
Asra hulet amet dem eyefesesegn

VERSE 4
Miraq eyetefu hulum siyanqwashshugn
Yegetaye libsun ch’afun bidassew
Hayl keersu wet’a demen qet’ aregew
A.z //

VERSE 5
Sekaram zemawi wenbede neberkugn
Yamets’egnoch meri demn yafeseskugn
Zare gin tariken Geta qeyrotal
Lehayalu Geta misgana yigebawal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yewodedegn-geta', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Ygrem aleku / Bereket tikue (ygrem-aleku-bereket-tikue)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ ''ዩ ስራሕካ
ሂወት ከሞ ዘይብለይ ርኢኻ
ሂወትካ ሂብካዮ ንባርያኻ

VERSE 1
ይድነቕ ኣለኹ ብኣኻ
ክርስቶስ ግሩም''ዩ ግብርኻ
ወገን ከም ዘይብለይ ርኢኻ
ካብ ዙፋን ወሪድካ ንባርያኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ ''ዩ ስራሕካ
ሂወት ከሞ ዘይብለይ ርኢኻ
ሂወትካ ሂብካዮ ንባርያኻ

VERSE 2
ዓለም''ዩ ዘመንን ፍቕርኻ
ጎይታይ ንምንታይ ዘይሓፈርካ
ዕርቃንካ ኣብ መስቀል ስለይ ተዋሪድካ ዝሞትካለይ’
ክሰብኮ''የ ስምካ ክሳብ መኸተምታ ዘመነይ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ ''ዩ ስራሕካ
ሂወት ከሞ ዘይብለይ ርኢኻ
ሂወትካ ሂብካዮ ንባርያኻ

VERSE 3
ተስፋይ ኣይጎድልን ኣይሓፍርን ፍጹም ብኣኻ
ልዕሊ ማንም እንዴ ኣብ ሂወይ ኩሉ ዝሰርዓካ
ከምቲ ነቶም ስምካ ዝፈትዉ
ዝመሓርካ ስምዓኒ ንዓይ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ ''ዩ ስራሕካ
ሂወት ከሞ ዘይብለይ ርኢኻ
ሂወትካ ሂብካዮ ንባርያኻ

VERSE 4
ንስጉምተይ ኩሉ ኣብ ቃልካ ኣጽንዓዮ ከይወድቕ''
እከይ ከይመልከኒ ፈተና ጸላእተይ ካባይ ኣርሕቕ
ገጽካ ኣብርሃለይ ስርዓትካ ኸኣ ምሃረኒ
ኪንዮ ምብዛሕ ቃላት ብመንፈስ ክህሉ ርድኣኒ (2)

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ ''ዩ ስራሕካ
ሂወት ከሞ ዘይብለይ ርኢኻ
ሂወትካ ሂብካዮ ንባርያኻ',
      lyrics_transliteration = 'CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy ''yu sirahka
Hiwet kemo zeybley riiኻ
Hiwetka hibkayo nibaryaኻ

VERSE 1
Yidneቕ aleኹ biaኻ
Kristos girum''yu gibrኻ
Wegen kem zeybley riiኻ
Kab zufan weridka nibaryaኻ

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy ''yu sirahka
Hiwet kemo zeybley riiኻ
Hiwetka hibkayo nibaryaኻ

VERSE 2
Alem''yu zemenn fiቕrኻ
Goytay nimntay zeyhaferka
Erqanka ab mesqel siley tewaridka zimotkaley’
Kisebko''ye simka kisab meኸtemta zemeney

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy ''yu sirahka
Hiwet kemo zeybley riiኻ
Hiwetka hibkayo nibaryaኻ

VERSE 3
Tesfay aygodln ayhafrn fits’um biaኻ
Lieli manm ende ab hiwey kulu ziseraka
Kemti netom simka zifetwu
Zimeharka simani niay

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy ''yu sirahka
Hiwet kemo zeybley riiኻ
Hiwetka hibkayo nibaryaኻ

VERSE 4
Nisgumtey kulu ab qalka ats’nayo keywedቕ''
Ekey keymelkeni fetena ts’elaetey kabay arhቕ
Gets’ka abrhaley siratka ኸa mihareni
Kinyo mibzah qalat bimenfes kihlu ridani (2)

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy ''yu sirahka
Hiwet kemo zeybley riiኻ
Hiwetka hibkayo nibaryaኻ',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ygrem-aleku-bereket-tikue'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ ''ዩ ስራሕካ
ሂወት ከሞ ዘይብለይ ርኢኻ
ሂወትካ ሂብካዮ ንባርያኻ

VERSE 1
ይድነቕ ኣለኹ ብኣኻ
ክርስቶስ ግሩም''ዩ ግብርኻ
ወገን ከም ዘይብለይ ርኢኻ
ካብ ዙፋን ወሪድካ ንባርያኻ

VERSE 2
ዓለም''ዩ ዘመንን ፍቕርኻ
ጎይታይ ንምንታይ ዘይሓፈርካ
ዕርቃንካ ኣብ መስቀል ስለይ ተዋሪድካ ዝሞትካለይ’
ክሰብኮ''የ ስምካ ክሳብ መኸተምታ ዘመነይ

VERSE 3
ተስፋይ ኣይጎድልን ኣይሓፍርን ፍጹም ብኣኻ
ልዕሊ ማንም እንዴ ኣብ ሂወይ ኩሉ ዝሰርዓካ
ከምቲ ነቶም ስምካ ዝፈትዉ
ዝመሓርካ ስምዓኒ ንዓይ

VERSE 4
ንስጉምተይ ኩሉ ኣብ ቃልካ ኣጽንዓዮ ከይወድቕ''
እከይ ከይመልከኒ ፈተና ጸላእተይ ካባይ ኣርሕቕ
ገጽካ ኣብርሃለይ ስርዓትካ ኸኣ ምሃረኒ
ኪንዮ ምብዛሕ ቃላት ብመንፈስ ክህሉ ርድኣኒ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yigrem aleኹ biaኻ
Nigusey filuy ''yu sirahka
Hiwet kemo zeybley riiኻ
Hiwetka hibkayo nibaryaኻ

VERSE 1
Yidneቕ aleኹ biaኻ
Kristos girum''yu gibrኻ
Wegen kem zeybley riiኻ
Kab zufan weridka nibaryaኻ

VERSE 2
Alem''yu zemenn fiቕrኻ
Goytay nimntay zeyhaferka
Erqanka ab mesqel siley tewaridka zimotkaley’
Kisebko''ye simka kisab meኸtemta zemeney

VERSE 3
Tesfay aygodln ayhafrn fits’um biaኻ
Lieli manm ende ab hiwey kulu ziseraka
Kemti netom simka zifetwu
Zimeharka simani niay

VERSE 4
Nisgumtey kulu ab qalka ats’nayo keywedቕ''
Ekey keymelkeni fetena ts’elaetey kabay arhቕ
Gets’ka abrhaley siratka ኸa mihareni
Kinyo mibzah qalat bimenfes kihlu ridani (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'ygrem-aleku-bereket-tikue', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: #YGREM_ALEKU_NEW_ERITREAN_ORTHODOX_MEZMUR_yigirem_alehu #bizemari_berehet_tikue_2021 (ygrem-aleku-new-eritrean-orthodox-mezmur-yigirem-alehu-bizemari-berehet)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 1
ይድነቅ ኣለኹ ብኣኻ
ክርስቶስ ግሩም''ዪ ግብርኻ
ወገን ከም ዘይብለይ ርኢኻ
ካብ ዙፋን ወሪድካ ንባርያኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 2
ዓለም''ዪ ዘመንን ፍቅርኻ
ጎይታይ ምእንታይ ዘይሓፈርካ
ዕርቃንካ ኣብ መስቀል ስለይ ተዋሪድካ
ዝሞትካለይ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 3
ክሰብኮ''የ ስምካ ክሳብ መኸተምታ ዘመነይ
ተስፋይ ኣይጎድልን ኣይሓፍርን ፍጹም ብኣኻ
ልዕሊ ማንም እንዴ ኣብ ሂወተይ ክሉ ዝሰርዐካ
ይግረም ኣለኹ ብኣኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 4
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ
ይድነቅ ኣለኹ ብኣኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 5
ክርስቶስ ግሩም''ዪ ግብርኻ
ወገን ከም ዘይብለይ ርኢኻ
ካብ ዙፋን ወሪድካ ንባርያኻ
ከምቲ ነቶም ስምካ ዝፈትዉ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 6
ዝመሓርካ ስምዓኒ ንዓይ
ንስጉምተይ ኩሉ ኣብ ቃልካ ኣጽንዓዬ
ከይወድቅ
እከይ ከይመልከኒ ፈተና ጸላእተይ ካባይ ኣርሕቅ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 7
ገጽካ ኣብርሃለይ ስርዓታትካ ኸኣ ምሃረኒ
ኪንዬ ምብዛሕ ቃላት ብመንፈስ ክህሉ ርድኣኒ
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 8
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ
ይድነቅ ኣለኹ ብኣኻ
ክርስቶስ ግሩም''ዪ ግብርኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 9
ወገን ከም ዘይብለይ ርኢኻ
ካብ ዙፋን ወሪድካ ንባርያኻ

CHORUS
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ',
      lyrics_transliteration = 'CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 1
Yidneq aleኹ biaኻ
Kristos girum''yi gibrኻ
Wegen kem zeybley riiኻ
Kab zufan weridka nibaryaኻ

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 2
Alem''yi zemenn fiqrኻ
Goytay mientay zeyhaferka
Erqanka ab mesqel siley tewaridka
Zimotkaley

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 3
Kisebko''ye simka kisab meኸtemta zemeney
Tesfay aygodln ayhafrn fits’um biaኻ
Lieli manm ende ab hiwetey kilu ziseraka
Yigrem aleኹ biaኻ

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 4
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ
Yidneq aleኹ biaኻ

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 5
Kristos girum''yi gibrኻ
Wegen kem zeybley riiኻ
Kab zufan weridka nibaryaኻ
Kemti netom simka zifetwu

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 6
Zimeharka simani niay
Nisgumtey kulu ab qalka ats’naye
Keywedq
Ekey keymelkeni fetena ts’elaetey kabay arhq

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 7
Gets’ka abrhaley siratatka ኸa mihareni
Kinye mibzah qalat bimenfes kihlu ridani
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 8
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ
Yidneq aleኹ biaኻ
Kristos girum''yi gibrኻ

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 9
Wegen kem zeybley riiኻ
Kab zufan weridka nibaryaኻ

CHORUS
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ygrem-aleku-new-eritrean-orthodox-mezmur-yigirem-alehu-bizemari-berehet'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ

VERSE 1
ይድነቅ ኣለኹ ብኣኻ
ክርስቶስ ግሩም''ዪ ግብርኻ
ወገን ከም ዘይብለይ ርኢኻ
ካብ ዙፋን ወሪድካ ንባርያኻ

VERSE 2
ዓለም''ዪ ዘመንን ፍቅርኻ
ጎይታይ ምእንታይ ዘይሓፈርካ
ዕርቃንካ ኣብ መስቀል ስለይ ተዋሪድካ
ዝሞትካለይ

VERSE 3
ክሰብኮ''የ ስምካ ክሳብ መኸተምታ ዘመነይ
ተስፋይ ኣይጎድልን ኣይሓፍርን ፍጹም ብኣኻ
ልዕሊ ማንም እንዴ ኣብ ሂወተይ ክሉ ዝሰርዐካ
ይግረም ኣለኹ ብኣኻ

VERSE 4
ንጉሰይ ፍሉይ''ዪ ስራሕካ
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ
ይድነቅ ኣለኹ ብኣኻ

VERSE 5
ክርስቶስ ግሩም''ዪ ግብርኻ
ወገን ከም ዘይብለይ ርኢኻ
ካብ ዙፋን ወሪድካ ንባርያኻ
ከምቲ ነቶም ስምካ ዝፈትዉ

VERSE 6
ዝመሓርካ ስምዓኒ ንዓይ
ንስጉምተይ ኩሉ ኣብ ቃልካ ኣጽንዓዬ
ከይወድቅ
እከይ ከይመልከኒ ፈተና ጸላእተይ ካባይ ኣርሕቅ

VERSE 7
ገጽካ ኣብርሃለይ ስርዓታትካ ኸኣ ምሃረኒ
ኪንዬ ምብዛሕ ቃላት ብመንፈስ ክህሉ ርድኣኒ
ይግረም ኣለኹ ብኣኻ
ንጉሰይ ፍሉይ''ዪ ስራሕካ

VERSE 8
ሂወት ከም ዘይብለይ ርኢኻ
ሂወትካ ሂብካዬ ንባርያኻ
ይድነቅ ኣለኹ ብኣኻ
ክርስቶስ ግሩም''ዪ ግብርኻ

VERSE 9
ወገን ከም ዘይብለይ ርኢኻ
ካብ ዙፋን ወሪድካ ንባርያኻ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ

VERSE 1
Yidneq aleኹ biaኻ
Kristos girum''yi gibrኻ
Wegen kem zeybley riiኻ
Kab zufan weridka nibaryaኻ

VERSE 2
Alem''yi zemenn fiqrኻ
Goytay mientay zeyhaferka
Erqanka ab mesqel siley tewaridka
Zimotkaley

VERSE 3
Kisebko''ye simka kisab meኸtemta zemeney
Tesfay aygodln ayhafrn fits’um biaኻ
Lieli manm ende ab hiwetey kilu ziseraka
Yigrem aleኹ biaኻ

VERSE 4
Nigusey filuy''yi sirahka
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ
Yidneq aleኹ biaኻ

VERSE 5
Kristos girum''yi gibrኻ
Wegen kem zeybley riiኻ
Kab zufan weridka nibaryaኻ
Kemti netom simka zifetwu

VERSE 6
Zimeharka simani niay
Nisgumtey kulu ab qalka ats’naye
Keywedq
Ekey keymelkeni fetena ts’elaetey kabay arhq

VERSE 7
Gets’ka abrhaley siratatka ኸa mihareni
Kinye mibzah qalat bimenfes kihlu ridani
Yigrem aleኹ biaኻ
Nigusey filuy''yi sirahka

VERSE 8
Hiwet kem zeybley riiኻ
Hiwetka hibkaye nibaryaኻ
Yidneq aleኹ biaኻ
Kristos girum''yi gibrኻ

VERSE 9
Wegen kem zeybley riiኻ
Kab zufan weridka nibaryaኻ'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'ygrem-aleku-new-eritrean-orthodox-mezmur-yigirem-alehu-bizemari-berehet', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yibae (yibae)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ይባእ ንጉሠ ስብሐት /2/
ይባእ አምላከ ምሕረት /4/

VERSE 1
ይባእ ንጉሠ ስብሐት /2/
ይባእ አምላከ ምሕረት /4/

CHORUS
ይባእ ንጉሠ ስብሐት /2/
ይባእ አምላከ ምሕረት /4/',
      lyrics_transliteration = 'CHORUS
yba nguse sbhet /2/
yba emlake mhret /4/

VERSE 1
yba nguse sbhet /2/
yba emlake mhret /4/

CHORUS
yba nguse sbhet /2/
yba emlake mhret /4/',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yibae'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ይባእ ንጉሠ ስብሐት /2/
ይባእ አምላከ ምሕረት /4/

VERSE 1
ይባእ ንጉሠ ስብሐት /2/
ይባእ አምላከ ምሕረት /4/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'yba nguse sbhet /2/
yba emlake mhret /4/

VERSE 1
yba nguse sbhet /2/
yba emlake mhret /4/'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yibae', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yibelomu Iyesus (yibelomu-iyesus)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ይቤሎሙ ኢየሱስ (፪) ለአይሁድ (፪)
እመኑ ብየ ወእመኑ በአቡየ
አበርህ በመስቀልየ ለእሊያየ (፪)

VERSE 1
ይቤሎሙ ኢየሱስ ለአይሁድ እመኑ ብየ (፪)
ወእመኑ በአቡየ አበርህ (፪)
በመስቀልየ (፪)

CHORUS
ይቤሎሙ ኢየሱስ (፪) ለአይሁድ (፪)
እመኑ ብየ ወእመኑ በአቡየ
አበርህ በመስቀልየ ለእሊያየ (፪)',
      lyrics_transliteration = 'CHORUS
Yibelomu Iyesus (2) le’Ayhud (2)
Emenu b’ye we’emenu be’abuye
Aberih bemeskelye le’iliyaye (2)

VERSE 1
Yibelomu Iyesus le’Ayhud emenu b’ye (2)
We’emenu be’abuye aberih (2)
Bemeskelye (2)

CHORUS
Yibelomu Iyesus (2) le’Ayhud (2)
Emenu b’ye we’emenu be’abuye
Aberih bemeskelye le’iliyaye (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yibelomu-iyesus'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ይቤሎሙ ኢየሱስ (፪) ለአይሁድ (፪)
እመኑ ብየ ወእመኑ በአቡየ
አበርህ በመስቀልየ ለእሊያየ (፪)

VERSE 1
ይቤሎሙ ኢየሱስ ለአይሁድ እመኑ ብየ (፪)
ወእመኑ በአቡየ አበርህ (፪)
በመስቀልየ (፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yibelomu Iyesus (2) le’Ayhud (2)
Emenu b’ye we’emenu be’abuye
Aberih bemeskelye le’iliyaye (2)

VERSE 1
Yibelomu Iyesus le’Ayhud emenu b’ye (2)
We’emenu be’abuye aberih (2)
Bemeskelye (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yibelomu-iyesus', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yiberal Be-kinfu (yiberal-bekinfu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 1
ከፊቴ ቀደመ ደመናን ዘርግቶ
እንዳልደናቀፍ ጉድባዎቼን ሞልቶ
ዛሬ ላለሁበት ብሩቱ ጉልበት ሆነኝ
ሰው ለመባል በቃሁ ሚካኤል ደገፈኝ

CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 2
በእናቴ እቅፍ ገብቼ መቅደሱ
አለሁ እስከዛሬ አጥሮኝ በመንፈሱ
የህይወቴን ሰልፎች አለፍኩ ከርሱ ጋራ
ተፅፏል በልቤ የሚካኤል ስራ

CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 3
በዙሪያዬ ተክሎ የእሳት ምሰሶውን
ፅድቅ እየመገበ ኣሳደገኝ ልጁን
የአምላኬን ምስጋና ዘውትር እያስጠናኝ
እርሱ ነው ሚካኤል በመዝሙር የሞላኝ

CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 4
ፊት ለፊት ተተክሎ ከታናሿ መንደር
ይስማኝ ነበረ ቅኔው ሲደረደር
ይወስደኛል ደጁ እየቀሰቀሰ
ታላቁን በረከት በውስጤ አፈሰሰ

CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 5
ሴኬምን እንዳላይ ክንፎቹን ጋረደ
መራኝ ወደ ህይወት መዳኔን ወደደ
የሞአብን ቋንቋ ከአፌ ላይ አጥፍቶ
በፀጋው ቃል ቃኘኝ በበረከት ሞል

CHORUS
ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/',
      lyrics_transliteration = 'CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 1
Ke-fitie qedeme demenan zergito
Indal-denaqef gudbawochien molto
Zare lalluhubet burtu gulbet honnegn
Sew le-mebal beqahu Mika''el degeffegn

CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 2
Be-innate iqif gebichie meqdesu
Allehu iskezare atirogn be-menfesu
Ye-hiywotie’n selfoch alefku kersu gara
Tesfiwal be-libie ye-Mika''el sira

CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 3
Be-zuriya-yie teklo ye-isat misesown
Tsidq iyemigebe asadegign lijun
Ye-amlakien misgana zewtir iyastenyegn
Irsu new Mika''el be-mezmur ye-mollagn

CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 4
Fit le-fit teteklo ke-tanashwa mender
Yisman nebere qiniew si-dereder
Yiwsedegnal deju iye-qeseqese
Talaqun bereket be-wustie afessese

CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 5
Sekiemin indalay kinfochun garede
Meragn wede hiywot medanien wedede
Ye-Moabin quanqua ke-afie lay atfito
Be-tsegaw qal kagonegn be-bereket molto

CHORUS
Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yiberal-bekinfu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ይበራል በክንፉ ምልጃውም ፈጣን ነው
የአምላክ ስም አለበት ስሙ ሚካኤል ነው
ያሳደገኝ መልአክ ዛሬም ከኔ ጋር ነው /2x/

VERSE 1
ከፊቴ ቀደመ ደመናን ዘርግቶ
እንዳልደናቀፍ ጉድባዎቼን ሞልቶ
ዛሬ ላለሁበት ብሩቱ ጉልበት ሆነኝ
ሰው ለመባል በቃሁ ሚካኤል ደገፈኝ

VERSE 2
በእናቴ እቅፍ ገብቼ መቅደሱ
አለሁ እስከዛሬ አጥሮኝ በመንፈሱ
የህይወቴን ሰልፎች አለፍኩ ከርሱ ጋራ
ተፅፏል በልቤ የሚካኤል ስራ

VERSE 3
በዙሪያዬ ተክሎ የእሳት ምሰሶውን
ፅድቅ እየመገበ ኣሳደገኝ ልጁን
የአምላኬን ምስጋና ዘውትር እያስጠናኝ
እርሱ ነው ሚካኤል በመዝሙር የሞላኝ

VERSE 4
ፊት ለፊት ተተክሎ ከታናሿ መንደር
ይስማኝ ነበረ ቅኔው ሲደረደር
ይወስደኛል ደጁ እየቀሰቀሰ
ታላቁን በረከት በውስጤ አፈሰሰ

VERSE 5
ሴኬምን እንዳላይ ክንፎቹን ጋረደ
መራኝ ወደ ህይወት መዳኔን ወደደ
የሞአብን ቋንቋ ከአፌ ላይ አጥፍቶ
በፀጋው ቃል ቃኘኝ በበረከት ሞል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yiberal be-kinfu miljawnim fet-tan new
Ye-amlak sim alebet simu Mika''el new
Yasadigegn mel’ak zare-m kegne gara new (2)

VERSE 1
Ke-fitie qedeme demenan zergito
Indal-denaqef gudbawochien molto
Zare lalluhubet burtu gulbet honnegn
Sew le-mebal beqahu Mika''el degeffegn

VERSE 2
Be-innate iqif gebichie meqdesu
Allehu iskezare atirogn be-menfesu
Ye-hiywotie’n selfoch alefku kersu gara
Tesfiwal be-libie ye-Mika''el sira

VERSE 3
Be-zuriya-yie teklo ye-isat misesown
Tsidq iyemigebe asadegign lijun
Ye-amlakien misgana zewtir iyastenyegn
Irsu new Mika''el be-mezmur ye-mollagn

VERSE 4
Fit le-fit teteklo ke-tanashwa mender
Yisman nebere qiniew si-dereder
Yiwsedegnal deju iye-qeseqese
Talaqun bereket be-wustie afessese

VERSE 5
Sekiemin indalay kinfochun garede
Meragn wede hiywot medanien wedede
Ye-Moabin quanqua ke-afie lay atfito
Be-tsegaw qal kagonegn be-bereket molto'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yiberal-bekinfu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: yichen met tewgne (yichen-met-tewgne)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ከዓመት እስከአመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኞ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዲያው ለብ እንዳልኩኝ ፤
አለሁኝ በቤትህ ለሙን መሬትህን እያጎሳቆልኩኝ ፤
አውቃለሁ አምላኬ ፍሬየን ለመልቀም እንዳመላለስኩህ ፤

VERSE 1
ዛሬም ሳላፈራ እሾህን አብቅየ ደርቄ ጠበኩህ ፤
ያልተደረገልኝ ያላፈሰስክብኝ ያልሰጠኸኝ የለም ፤
ነገር ግን ይህ ሁሉ አላርምህ አለኝ አልለየኝም ከአለም ።
የማትሰለቸኝ ሆይ ተነስቼ እስክቆም እባክህ ታገሰኝ ፤

CHORUS
ከዓመት እስከአመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኞ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዲያው ለብ እንዳልኩኝ ፤
አለሁኝ በቤትህ ለሙን መሬትህን እያጎሳቆልኩኝ ፤
አውቃለሁ አምላኬ ፍሬየን ለመልቀም እንዳመላለስኩህ ፤

VERSE 2
የኔን ክፋት ተወዉ መልአክህን ሰምተህ ይችን ዓመት ተወኝ ።
አውቃለሁ ታውቃለህ ቀጠሮን ሰጥቼ እንደማላከብር፤
ብዙ ግዜ አቅጄ ብዙ ጊዜ ዝቼ በወሬ እንደምቀር ።
ዘንድሮስ እንዳልኩኝ አምና ይኸ ጊዜ ሰምተኸኝ ነበረ፤

CHORUS
ከዓመት እስከአመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኞ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዲያው ለብ እንዳልኩኝ ፤
አለሁኝ በቤትህ ለሙን መሬትህን እያጎሳቆልኩኝ ፤
አውቃለሁ አምላኬ ፍሬየን ለመልቀም እንዳመላለስኩህ ፤

VERSE 3
ምንም ሳልለወጥ ዘንድሮየ አልፎ ባዲስ ተቀየረ ።
ፍሬ የማይወጣኝ እኔን በመኮትኮት እጆችህ ደከሙ ፤
እኔ ግን አለሁኝ ዛሬም አልበቃኝም በኃጢአት መታመሙ ።
የቃልህን ውሐ በድንጋይ ልጅህ ላይ ሳትታክት ስታፈስ ዘመን ተቆጠረ ፤

CHORUS
ከዓመት እስከአመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኞ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዲያው ለብ እንዳልኩኝ ፤
አለሁኝ በቤትህ ለሙን መሬትህን እያጎሳቆልኩኝ ፤
አውቃለሁ አምላኬ ፍሬየን ለመልቀም እንዳመላለስኩህ ፤

VERSE 4
ወደልቤ ሳይሰርግ ህይወቴን ሳይለውጥ እንዲያው ፈስሶ ቀረ ።
ቃልህን ጠግቤ እያገሳሁት ነው ሌሎች እስኪሰሙ ፤
በቃልህ መኖር ግን አልያዝህ አለኝ ከበደኝ ቀለሙ ።
ብዙ ጥቅስ አገኝሁ ከቅዱስ መጽሐፍህ ገልጬ አይቼ ፤

CHORUS
ከዓመት እስከአመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኞ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዲያው ለብ እንዳልኩኝ ፤
አለሁኝ በቤትህ ለሙን መሬትህን እያጎሳቆልኩኝ ፤
አውቃለሁ አምላኬ ፍሬየን ለመልቀም እንዳመላለስኩህ ፤

VERSE 5
ከራሴ ላይ ብቻ አንድ ጥቅስ አጣሁንኝ በበደል ተኝቼ ።
ውጤቴ ደካማ ትምህርት የማይሰርጸኝ ተማሪ ብሆንም ፤
ይችን ዓመት ተወኝ ተደግሞ ትንሽ ልማር ታገሰኝ አሁንም ።
እባክህ አልቆረጥ በቅዱስ መሬትህ ልቆይ ፍቀድልኝ ፤

CHORUS
ከዓመት እስከአመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኞ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዲያው ለብ እንዳልኩኝ ፤
አለሁኝ በቤትህ ለሙን መሬትህን እያጎሳቆልኩኝ ፤
አውቃለሁ አምላኬ ፍሬየን ለመልቀም እንዳመላለስኩህ ፤

VERSE 6
ያፈሩት ቅዱሳን የፍሬያቸው ሽታ መአዛ እንዲደርሰኝ ።
የተሸከምከኝ ሆይ ዛሬም ተሸከመኝ አትሰልቸኝ አደራ ፤
ማን ይታገሰኛል ጠላት እየሆንኩት እየሰሩ ስሰራ ።
አታውጣኝ ከቤትህ ብዙ ቦታ አልይዝም ፍሬ ስለሌለኝ

CHORUS
ከዓመት እስከአመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኞ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዲያው ለብ እንዳልኩኝ ፤
አለሁኝ በቤትህ ለሙን መሬትህን እያጎሳቆልኩኝ ፤
አውቃለሁ አምላኬ ፍሬየን ለመልቀም እንዳመላለስኩህ ፤

VERSE 7
ስፍራ የማያሻኝ ቤት የማላጣብብ ፍሬ አልባ በለስ ነኝ ።
ቦታ የሚይዙት ባለምግባሮቹ ቅዱሳንህ ናቸው ፤
ልክ እንደዘንባባ የተንዠረገገ ተጋድሎ ጽድቃቸው ።
ከሊባኖስ ዝግባ እጅጉን የበዛ ገድል ትሩፋታቸው ፤

CHORUS
ከዓመት እስከአመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኞ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዲያው ለብ እንዳልኩኝ ፤
አለሁኝ በቤትህ ለሙን መሬትህን እያጎሳቆልኩኝ ፤
አውቃለሁ አምላኬ ፍሬየን ለመልቀም እንዳመላለስኩህ ፤

VERSE 8
እኔ አይደለሁም ቦታስ የምትይዘው የአንተው እናት ናት ፤
ስሮቿ በምድር ጫፎቿ በሰማይ ሲደርሱ ያየናት ፤
ይችን አመት ተወኝ ከስሯ እሆናለሁ ባፈራ ምናልባት ፤
ይቺን ዓመት ተወኝ እባክህ አምላኬ አንድ ዓመት ምንህ ናት ፤

CHORUS
ከዓመት እስከአመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኞ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዲያው ለብ እንዳልኩኝ ፤
አለሁኝ በቤትህ ለሙን መሬትህን እያጎሳቆልኩኝ ፤
አውቃለሁ አምላኬ ፍሬየን ለመልቀም እንዳመላለስኩህ ፤

VERSE 9
ሺህ ዓመት አንድ ቀን አይደለም ወይ ላንተ ዓመት ኢምንትህ ናት ።
ይኸ ዓመት አልፎ ደግሞ ዓመት ስጠኝ እስከምልህ ድረስ ፤
እባክህ ጌታየ ይችን ዓመት ተወኝ የወጉን እንዳደርስ ።

CHORUS
ከዓመት እስከአመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኞ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዲያው ለብ እንዳልኩኝ ፤
አለሁኝ በቤትህ ለሙን መሬትህን እያጎሳቆልኩኝ ፤
አውቃለሁ አምላኬ ፍሬየን ለመልቀም እንዳመላለስኩህ ፤',
      lyrics_transliteration = 'CHORUS
Keamet eskeamet firen salafera dereq endehonkugno
Berad weym tikus huletunm salhon endiyaw leb endalkugn ;
Alehugn bebeth lemun merethn eyagosaqolkugn ;
Awqalehu amlake fireyen lemelqem endamelaleskuh ;

VERSE 1
Zarem salafera eshohn abqye derqe t’ebekuh ;
Yaltederegelgn yalafeseskbgn yalset’eኸgn yelem ;
Neger gin yih hulu alarmh alegn alleyegnm kealem .
Yematselechegn hoy tenesche eskqom ebakh tagesegn ;

CHORUS
Keamet eskeamet firen salafera dereq endehonkugno
Berad weym tikus huletunm salhon endiyaw leb endalkugn ;
Alehugn bebeth lemun merethn eyagosaqolkugn ;
Awqalehu amlake fireyen lemelqem endamelaleskuh ;

VERSE 2
Yenen kifat tewewu melakhn semteh yichn amet tewegn .
Awqalehu tawqaleh qet’eron set’che endemalakebr;
Bizu gize aqje bizu gize ziche bewere endemqer .
Zendros endalkugn amna yiኸ gize semteኸgn nebere;

CHORUS
Keamet eskeamet firen salafera dereq endehonkugno
Berad weym tikus huletunm salhon endiyaw leb endalkugn ;
Alehugn bebeth lemun merethn eyagosaqolkugn ;
Awqalehu amlake fireyen lemelqem endamelaleskuh ;

VERSE 3
Minm sallewet’ zendroye alfo badis teqeyere .
Fire yemaywet’agn enen bemekotkot ejochh dekemu ;
Ene gin alehugn zarem albeqagnm behat’iat metamemu .
Yeqalhn wihe bedngay lijh lay sattakt sitafes zemen teqot’ere ;

CHORUS
Keamet eskeamet firen salafera dereq endehonkugno
Berad weym tikus huletunm salhon endiyaw leb endalkugn ;
Alehugn bebeth lemun merethn eyagosaqolkugn ;
Awqalehu amlake fireyen lemelqem endamelaleskuh ;

VERSE 4
Wedelbe sayserg hiyweten saylewt’ endiyaw fesso qere .
Qalhn t’egbe eyagesahut new leloch eskisemu ;
Beqalh menor gin alyazh alegn kebedegn qelemu .
Bizu t’qs agegnhu keqdus mets’hefh gelch’e ayche ;

CHORUS
Keamet eskeamet firen salafera dereq endehonkugno
Berad weym tikus huletunm salhon endiyaw leb endalkugn ;
Alehugn bebeth lemun merethn eyagosaqolkugn ;
Awqalehu amlake fireyen lemelqem endamelaleskuh ;

VERSE 5
Kerase lay bicha and t’qs at’ahungn bebedel tegnche .
Wit’ete dekama timhrt yemayserts’egn temari bihonm ;
Yichn amet tewegn tedegmo tinsh limar tagesegn ahunm .
Ebakh alqoret’ beqdus mereth liqoy fiqedlgn ;

CHORUS
Keamet eskeamet firen salafera dereq endehonkugno
Berad weym tikus huletunm salhon endiyaw leb endalkugn ;
Alehugn bebeth lemun merethn eyagosaqolkugn ;
Awqalehu amlake fireyen lemelqem endamelaleskuh ;

VERSE 6
Yaferut Kidusan yefreyachew shta meaza endidersegn .
Yeteshekemkegn hoy zarem teshekemegn atselchegn adera ;
Man yitagesegnal t’elat eyehonkut eyeseru sisera .
Atawt’agn kebeth bizu bota alyzm fire silelelegn

CHORUS
Keamet eskeamet firen salafera dereq endehonkugno
Berad weym tikus huletunm salhon endiyaw leb endalkugn ;
Alehugn bebeth lemun merethn eyagosaqolkugn ;
Awqalehu amlake fireyen lemelqem endamelaleskuh ;

VERSE 7
Sifra yemayashagn bet yemalat’abb fire alba beles negn .
Bota yemiyzut balemgbarochu qidusanh nachew ;
Lik endezenbaba yetenzheregege tegadlo ts’dqachew .
Kelibanos zigba ejgun yebeza gedl tirufatachew ;

CHORUS
Keamet eskeamet firen salafera dereq endehonkugno
Berad weym tikus huletunm salhon endiyaw leb endalkugn ;
Alehugn bebeth lemun merethn eyagosaqolkugn ;
Awqalehu amlake fireyen lemelqem endamelaleskuh ;

VERSE 8
Ene aydelehum botas yemtyzew yeantew enat nat ;
Sirochwa bemdr ch’afochwa besemay sidersu yayenat ;
Yichn amet tewegn kesrwa ehonalehu bafera minalbat ;
Yichin amet tewegn ebakh amlake and amet minh nat ;

CHORUS
Keamet eskeamet firen salafera dereq endehonkugno
Berad weym tikus huletunm salhon endiyaw leb endalkugn ;
Alehugn bebeth lemun merethn eyagosaqolkugn ;
Awqalehu amlake fireyen lemelqem endamelaleskuh ;

VERSE 9
Shih amet and qen aydelem wey lante amet imnth nat .
Yiኸ amet alfo degmo amet sit’egn eskemlh dires ;
Ebakh getaye yichn amet tewegn yewegun endaders .

CHORUS
Keamet eskeamet firen salafera dereq endehonkugno
Berad weym tikus huletunm salhon endiyaw leb endalkugn ;
Alehugn bebeth lemun merethn eyagosaqolkugn ;
Awqalehu amlake fireyen lemelqem endamelaleskuh ;',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yichen-met-tewgne'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከዓመት እስከአመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኞ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዲያው ለብ እንዳልኩኝ ፤
አለሁኝ በቤትህ ለሙን መሬትህን እያጎሳቆልኩኝ ፤
አውቃለሁ አምላኬ ፍሬየን ለመልቀም እንዳመላለስኩህ ፤

VERSE 1
ዛሬም ሳላፈራ እሾህን አብቅየ ደርቄ ጠበኩህ ፤
ያልተደረገልኝ ያላፈሰስክብኝ ያልሰጠኸኝ የለም ፤
ነገር ግን ይህ ሁሉ አላርምህ አለኝ አልለየኝም ከአለም ።
የማትሰለቸኝ ሆይ ተነስቼ እስክቆም እባክህ ታገሰኝ ፤

VERSE 2
የኔን ክፋት ተወዉ መልአክህን ሰምተህ ይችን ዓመት ተወኝ ።
አውቃለሁ ታውቃለህ ቀጠሮን ሰጥቼ እንደማላከብር፤
ብዙ ግዜ አቅጄ ብዙ ጊዜ ዝቼ በወሬ እንደምቀር ።
ዘንድሮስ እንዳልኩኝ አምና ይኸ ጊዜ ሰምተኸኝ ነበረ፤

VERSE 3
ምንም ሳልለወጥ ዘንድሮየ አልፎ ባዲስ ተቀየረ ።
ፍሬ የማይወጣኝ እኔን በመኮትኮት እጆችህ ደከሙ ፤
እኔ ግን አለሁኝ ዛሬም አልበቃኝም በኃጢአት መታመሙ ።
የቃልህን ውሐ በድንጋይ ልጅህ ላይ ሳትታክት ስታፈስ ዘመን ተቆጠረ ፤

VERSE 4
ወደልቤ ሳይሰርግ ህይወቴን ሳይለውጥ እንዲያው ፈስሶ ቀረ ።
ቃልህን ጠግቤ እያገሳሁት ነው ሌሎች እስኪሰሙ ፤
በቃልህ መኖር ግን አልያዝህ አለኝ ከበደኝ ቀለሙ ።
ብዙ ጥቅስ አገኝሁ ከቅዱስ መጽሐፍህ ገልጬ አይቼ ፤

VERSE 5
ከራሴ ላይ ብቻ አንድ ጥቅስ አጣሁንኝ በበደል ተኝቼ ።
ውጤቴ ደካማ ትምህርት የማይሰርጸኝ ተማሪ ብሆንም ፤
ይችን ዓመት ተወኝ ተደግሞ ትንሽ ልማር ታገሰኝ አሁንም ።
እባክህ አልቆረጥ በቅዱስ መሬትህ ልቆይ ፍቀድልኝ ፤

VERSE 6
ያፈሩት ቅዱሳን የፍሬያቸው ሽታ መአዛ እንዲደርሰኝ ።
የተሸከምከኝ ሆይ ዛሬም ተሸከመኝ አትሰልቸኝ አደራ ፤
ማን ይታገሰኛል ጠላት እየሆንኩት እየሰሩ ስሰራ ።
አታውጣኝ ከቤትህ ብዙ ቦታ አልይዝም ፍሬ ስለሌለኝ

VERSE 7
ስፍራ የማያሻኝ ቤት የማላጣብብ ፍሬ አልባ በለስ ነኝ ።
ቦታ የሚይዙት ባለምግባሮቹ ቅዱሳንህ ናቸው ፤
ልክ እንደዘንባባ የተንዠረገገ ተጋድሎ ጽድቃቸው ።
ከሊባኖስ ዝግባ እጅጉን የበዛ ገድል ትሩፋታቸው ፤

VERSE 8
እኔ አይደለሁም ቦታስ የምትይዘው የአንተው እናት ናት ፤
ስሮቿ በምድር ጫፎቿ በሰማይ ሲደርሱ ያየናት ፤
ይችን አመት ተወኝ ከስሯ እሆናለሁ ባፈራ ምናልባት ፤
ይቺን ዓመት ተወኝ እባክህ አምላኬ አንድ ዓመት ምንህ ናት ፤

VERSE 9
ሺህ ዓመት አንድ ቀን አይደለም ወይ ላንተ ዓመት ኢምንትህ ናት ።
ይኸ ዓመት አልፎ ደግሞ ዓመት ስጠኝ እስከምልህ ድረስ ፤
እባክህ ጌታየ ይችን ዓመት ተወኝ የወጉን እንዳደርስ ።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Keamet eskeamet firen salafera dereq endehonkugno
Berad weym tikus huletunm salhon endiyaw leb endalkugn ;
Alehugn bebeth lemun merethn eyagosaqolkugn ;
Awqalehu amlake fireyen lemelqem endamelaleskuh ;

VERSE 1
Zarem salafera eshohn abqye derqe t’ebekuh ;
Yaltederegelgn yalafeseskbgn yalset’eኸgn yelem ;
Neger gin yih hulu alarmh alegn alleyegnm kealem .
Yematselechegn hoy tenesche eskqom ebakh tagesegn ;

VERSE 2
Yenen kifat tewewu melakhn semteh yichn amet tewegn .
Awqalehu tawqaleh qet’eron set’che endemalakebr;
Bizu gize aqje bizu gize ziche bewere endemqer .
Zendros endalkugn amna yiኸ gize semteኸgn nebere;

VERSE 3
Minm sallewet’ zendroye alfo badis teqeyere .
Fire yemaywet’agn enen bemekotkot ejochh dekemu ;
Ene gin alehugn zarem albeqagnm behat’iat metamemu .
Yeqalhn wihe bedngay lijh lay sattakt sitafes zemen teqot’ere ;

VERSE 4
Wedelbe sayserg hiyweten saylewt’ endiyaw fesso qere .
Qalhn t’egbe eyagesahut new leloch eskisemu ;
Beqalh menor gin alyazh alegn kebedegn qelemu .
Bizu t’qs agegnhu keqdus mets’hefh gelch’e ayche ;

VERSE 5
Kerase lay bicha and t’qs at’ahungn bebedel tegnche .
Wit’ete dekama timhrt yemayserts’egn temari bihonm ;
Yichn amet tewegn tedegmo tinsh limar tagesegn ahunm .
Ebakh alqoret’ beqdus mereth liqoy fiqedlgn ;

VERSE 6
Yaferut Kidusan yefreyachew shta meaza endidersegn .
Yeteshekemkegn hoy zarem teshekemegn atselchegn adera ;
Man yitagesegnal t’elat eyehonkut eyeseru sisera .
Atawt’agn kebeth bizu bota alyzm fire silelelegn

VERSE 7
Sifra yemayashagn bet yemalat’abb fire alba beles negn .
Bota yemiyzut balemgbarochu qidusanh nachew ;
Lik endezenbaba yetenzheregege tegadlo ts’dqachew .
Kelibanos zigba ejgun yebeza gedl tirufatachew ;

VERSE 8
Ene aydelehum botas yemtyzew yeantew enat nat ;
Sirochwa bemdr ch’afochwa besemay sidersu yayenat ;
Yichn amet tewegn kesrwa ehonalehu bafera minalbat ;
Yichin amet tewegn ebakh amlake and amet minh nat ;

VERSE 9
Shih amet and qen aydelem wey lante amet imnth nat .
Yiኸ amet alfo degmo amet sit’egn eskemlh dires ;
Ebakh getaye yichn amet tewegn yewegun endaders .'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yichen-met-tewgne', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yihichin Amet Tewegn (yihichin-amet-tewegn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 1
ዛሬም ሳላፈራ እሾህን አብቅዬ ደርቄ ጠበቅኩኝ
ያልተደረገልኝ ያላፈሰስክብኝ ያልሰጠኸኝ የለም ነገር ግን ይህ ሁሉ አላርምህ አለኝ አልለየኝም ከዓለም
የማትስለቸኝ ሆይ ተነስቼ እስክቆም እባክህ ታገሰኝ
የእኔን ክፋት ተወው መልአክህን ሰምተህ ይህቺን ዓመት ተወኝ።

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 2
አውቃለሁ ታውቃለህ ቀጠሮን ሰጥቼ እንደማላከብር
ብዙ ጊዜ አቅጄ ብዙ ግዜ ዝቼ በወሬ እንደምቀር
ዘንድሮስ እንዳልኩኝ አምና ይኄን ጊዜ ሰምተኸኝ ነበረ
ምንም ሳልለወጥ ዘንድሮዬ አልፎ በአዲስ ተቀየረ።

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 3
ፍሬ የማይወጣኝ እኔን በመኮትኮት እጆችህ ደከሙ
እኔ ግን አለሁኝ ዛሬም አልበቃኝም በኃጢአት መታመሙ
የቃልህን ውሃ በድንጋይ ልጅህ ላይ ሳትታክት ስታፈስ ዘመን ተቆጠረ
ወደ ልቤ ሳይሰርግ ሕይወቴን ሳይለውጥ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 4
እንዳው ፈስሶ ቀረ።
ቃልህን ጠግቤ እያገሳሁት ነው ሌሎች እስኪሰሙ
በቃልህ መኖር ግን አልያዝህ አለኝ ከበደኝ ቀለሙ
ብዙ ጥቅስ አገኘሁ ከቅዱስ መጽሐፍህ ገልጬ አይቼ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 5
ከራሴ ላይ ብቻ አንድ ጥቅስ አጣሁኝ በበደል ተኝቼ።
ውጤቴ ደካማ ትምህርት የማይሰርጸኝ ተማሪ ብሆንም
ይህቺን ዓመት ተወኝ ደግሞ ትንሽ ልማር ታገሰኝ አሁንም
እባክህ አልቆረጥ በቅዱስ መሬትህ ልቆይ ፍቀድልኝ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 6
ያፈሩት ቅዱሳን የፍሬአቸው ሽታ መዓዛ እንዲደርሰኝ።
የተሸከምከኝ ሆይ ዛሬም ተሸከመኝ አትሰልቸኝ አደራ
ማን ይታገሰኛል ጠላት እየሆንኩት አይሰሩ ስሰራ
አታውጣኝ ከቤትህ ብዙ ቦታ አልይዝም ፍሬ ስለሌለኝ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 7
ስፍራ የማያሻኝ ቤት የማላጣብብ ፍሬ አልባ በለስ ነኝ።
ቦታስ የሚይዙት ባለ ምግባሮቹ ቅዱሳንህ ናቸው
ልክ እንደ ዘንባባ የተንዠረገገ ተጋድሎ ጽድቃቸው
ከሊባኖስ ዝግባ እጅጉን የበዛ ገድል ትሩፋታቸው።

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 8
እኔ አይደለሁም ቦታስ የምትይዘው ያንተው እናት ናት
ስሮቿ በምድር ጫፎቿ በሰማይ ሲደርሱ ያየናት
ይህቺን ዓመት ተወኝ ከስሯ እሆናለሁ ባፈራ ምናልባት።
ይህቺን ዓመት ተወኝ እባክህ አምላኬ አንድ ዓመት ምንህ ናት

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 9
ሺ ዓመት አንድ ቀን አይደለም ወይ ለአንተ ዓመት ኢምንት ናት
ይኄ ዓመት አልፎ ዳግም ዓመት ስጠኝ እስከምልህ ድረስ
እባክህን ጌታ ይህቺን ዓመት ተወኝ የወጉን እንዳደርስ።

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ',
      lyrics_transliteration = 'CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 1
Zarem salafera eshohn abqye derqe t’ebeqkugn
Yaltederegelgn yalafeseskbgn yalset’eኸgn yelem neger gin yih hulu alarmh alegn alleyegnm kealem
Yematslechegn hoy tenesche eskqom ebakh tagesegn
Yeenen kifat tewew melakhn semteh yihchin amet tewegn.

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 2
Awqalehu tawqaleh qet’eron set’che endemalakebr
Bizu gize aqje bizu gize ziche bewere endemqer
Zendros endalkugn amna yihen gize semteኸgn nebere
Minm sallewet’ zendroye alfo beadis teqeyere.

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 3
Fire yemaywet’agn enen bemekotkot ejochh dekemu
Ene gin alehugn zarem albeqagnm behat’iat metamemu
Yeqalhn wiha bedngay lijh lay sattakt sitafes zemen teqot’ere
Wede libe sayserg hiyweten saylewt’

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 4
Endaw fesso qere.
Qalhn t’egbe eyagesahut new leloch eskisemu
Beqalh menor gin alyazh alegn kebedegn qelemu
Bizu t’qs agegnehu keqdus mets’hefh gelch’e ayche

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 5
Kerase lay bicha and t’qs at’ahugn bebedel tegnche.
Wit’ete dekama timhrt yemayserts’egn temari bihonm
Yihchin amet tewegn degmo tinsh limar tagesegn ahunm
Ebakh alqoret’ beqdus mereth liqoy fiqedlgn

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 6
Yaferut Kidusan yefreachew shta meaza endidersegn.
Yeteshekemkegn hoy zarem teshekemegn atselchegn adera
Man yitagesegnal t’elat eyehonkut ayseru sisera
Atawt’agn kebeth bizu bota alyzm fire silelelegn

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 7
Sifra yemayashagn bet yemalat’abb fire alba beles negn.
Botas yemiyzut bale migbarochu qidusanh nachew
Lik ende zenbaba yetenzheregege tegadlo ts’dqachew
Kelibanos zigba ejgun yebeza gedl tirufatachew.

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 8
Ene aydelehum botas yemtyzew yantew enat nat
Sirochwa bemdr ch’afochwa besemay sidersu yayenat
Yihchin amet tewegn kesrwa ehonalehu bafera minalbat.
Yihchin amet tewegn ebakh amlake and amet minh nat

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 9
Shi amet and qen aydelem wey leante amet imnt nat
Yihe amet alfo dagm amet sit’egn eskemlh dires
Ebakhn Geta yihchin amet tewegn yewegun endaders.

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yihichin-amet-tewegn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ።
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 1
ዛሬም ሳላፈራ እሾህን አብቅዬ ደርቄ ጠበቅኩኝ
ያልተደረገልኝ ያላፈሰስክብኝ ያልሰጠኸኝ የለም ነገር ግን ይህ ሁሉ አላርምህ አለኝ አልለየኝም ከዓለም
የማትስለቸኝ ሆይ ተነስቼ እስክቆም እባክህ ታገሰኝ
የእኔን ክፋት ተወው መልአክህን ሰምተህ ይህቺን ዓመት ተወኝ።

VERSE 2
አውቃለሁ ታውቃለህ ቀጠሮን ሰጥቼ እንደማላከብር
ብዙ ጊዜ አቅጄ ብዙ ግዜ ዝቼ በወሬ እንደምቀር
ዘንድሮስ እንዳልኩኝ አምና ይኄን ጊዜ ሰምተኸኝ ነበረ
ምንም ሳልለወጥ ዘንድሮዬ አልፎ በአዲስ ተቀየረ።

VERSE 3
ፍሬ የማይወጣኝ እኔን በመኮትኮት እጆችህ ደከሙ
እኔ ግን አለሁኝ ዛሬም አልበቃኝም በኃጢአት መታመሙ
የቃልህን ውሃ በድንጋይ ልጅህ ላይ ሳትታክት ስታፈስ ዘመን ተቆጠረ
ወደ ልቤ ሳይሰርግ ሕይወቴን ሳይለውጥ

VERSE 4
እንዳው ፈስሶ ቀረ።
ቃልህን ጠግቤ እያገሳሁት ነው ሌሎች እስኪሰሙ
በቃልህ መኖር ግን አልያዝህ አለኝ ከበደኝ ቀለሙ
ብዙ ጥቅስ አገኘሁ ከቅዱስ መጽሐፍህ ገልጬ አይቼ

VERSE 5
ከራሴ ላይ ብቻ አንድ ጥቅስ አጣሁኝ በበደል ተኝቼ።
ውጤቴ ደካማ ትምህርት የማይሰርጸኝ ተማሪ ብሆንም
ይህቺን ዓመት ተወኝ ደግሞ ትንሽ ልማር ታገሰኝ አሁንም
እባክህ አልቆረጥ በቅዱስ መሬትህ ልቆይ ፍቀድልኝ

VERSE 6
ያፈሩት ቅዱሳን የፍሬአቸው ሽታ መዓዛ እንዲደርሰኝ።
የተሸከምከኝ ሆይ ዛሬም ተሸከመኝ አትሰልቸኝ አደራ
ማን ይታገሰኛል ጠላት እየሆንኩት አይሰሩ ስሰራ
አታውጣኝ ከቤትህ ብዙ ቦታ አልይዝም ፍሬ ስለሌለኝ

VERSE 7
ስፍራ የማያሻኝ ቤት የማላጣብብ ፍሬ አልባ በለስ ነኝ።
ቦታስ የሚይዙት ባለ ምግባሮቹ ቅዱሳንህ ናቸው
ልክ እንደ ዘንባባ የተንዠረገገ ተጋድሎ ጽድቃቸው
ከሊባኖስ ዝግባ እጅጉን የበዛ ገድል ትሩፋታቸው።

VERSE 8
እኔ አይደለሁም ቦታስ የምትይዘው ያንተው እናት ናት
ስሮቿ በምድር ጫፎቿ በሰማይ ሲደርሱ ያየናት
ይህቺን ዓመት ተወኝ ከስሯ እሆናለሁ ባፈራ ምናልባት።
ይህቺን ዓመት ተወኝ እባክህ አምላኬ አንድ ዓመት ምንህ ናት

VERSE 9
ሺ ዓመት አንድ ቀን አይደለም ወይ ለአንተ ዓመት ኢምንት ናት
ይኄ ዓመት አልፎ ዳግም ዓመት ስጠኝ እስከምልህ ድረስ
እባክህን ጌታ ይህቺን ዓመት ተወኝ የወጉን እንዳደርስ።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn.
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 1
Zarem salafera eshohn abqye derqe t’ebeqkugn
Yaltederegelgn yalafeseskbgn yalset’eኸgn yelem neger gin yih hulu alarmh alegn alleyegnm kealem
Yematslechegn hoy tenesche eskqom ebakh tagesegn
Yeenen kifat tewew melakhn semteh yihchin amet tewegn.

VERSE 2
Awqalehu tawqaleh qet’eron set’che endemalakebr
Bizu gize aqje bizu gize ziche bewere endemqer
Zendros endalkugn amna yihen gize semteኸgn nebere
Minm sallewet’ zendroye alfo beadis teqeyere.

VERSE 3
Fire yemaywet’agn enen bemekotkot ejochh dekemu
Ene gin alehugn zarem albeqagnm behat’iat metamemu
Yeqalhn wiha bedngay lijh lay sattakt sitafes zemen teqot’ere
Wede libe sayserg hiyweten saylewt’

VERSE 4
Endaw fesso qere.
Qalhn t’egbe eyagesahut new leloch eskisemu
Beqalh menor gin alyazh alegn kebedegn qelemu
Bizu t’qs agegnehu keqdus mets’hefh gelch’e ayche

VERSE 5
Kerase lay bicha and t’qs at’ahugn bebedel tegnche.
Wit’ete dekama timhrt yemayserts’egn temari bihonm
Yihchin amet tewegn degmo tinsh limar tagesegn ahunm
Ebakh alqoret’ beqdus mereth liqoy fiqedlgn

VERSE 6
Yaferut Kidusan yefreachew shta meaza endidersegn.
Yeteshekemkegn hoy zarem teshekemegn atselchegn adera
Man yitagesegnal t’elat eyehonkut ayseru sisera
Atawt’agn kebeth bizu bota alyzm fire silelelegn

VERSE 7
Sifra yemayashagn bet yemalat’abb fire alba beles negn.
Botas yemiyzut bale migbarochu qidusanh nachew
Lik ende zenbaba yetenzheregege tegadlo ts’dqachew
Kelibanos zigba ejgun yebeza gedl tirufatachew.

VERSE 8
Ene aydelehum botas yemtyzew yantew enat nat
Sirochwa bemdr ch’afochwa besemay sidersu yayenat
Yihchin amet tewegn kesrwa ehonalehu bafera minalbat.
Yihchin amet tewegn ebakh amlake and amet minh nat

VERSE 9
Shi amet and qen aydelem wey leante amet imnt nat
Yihe amet alfo dagm amet sit’egn eskemlh dires
Ebakhn Geta yihchin amet tewegn yewegun endaders.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yihichin-amet-tewegn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yihichin Amet Tewegn (yihichin-amet-tewegn-1238)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 1
ዛሬም ሳላፈራ እሾህን አብቅዬ ደርቄ ጠበቅኩኝ
ያልተደረገልኝ ያላፈሰስክብኝ ያልሰጠኸኝ የለም ነገር ግን ይህ ሁሉ አላርምህ አለኝ አልለየኝም ከዓለም
የማትስለቸኝ ሆይ ተነስቼ እስክቆም እባክህ ታገሰኝ
የእኔን ክፋት ተወው መልአክህን ሰምተህ ይህቺን ዓመት ተወኝ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 2
አውቃለሁ ታውቃለህ ቀጠሮን ሰጥቼ እንደማላከብር
ብዙ ጊዜ አቅጄ ብዙ ግዜ ዝቼ በወሬ እንደምቀር
ዘንድሮስ እንዳልኩኝ አምና ይኄን ጊዜ ሰምተኸኝ ነበረ
ምንም ሳልለወጥ ዘንድሮዬ አልፎ በአዲስ ተቀየረ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 3
ፍሬ የማይወጣኝ እኔን በመኮትኮት እጆችህ ደከሙ
እኔ ግን አለሁኝ ዛሬም አልበቃኝም በኃጢአት መታመሙ
የቃልህን ውሃ በድንጋይ ልጅህ ላይ ሳትታክት ስታፈስ ዘመን ተቆጠረ
ወደ ልቤ ሳይሰርግ ሕይወቴን ሳይለውጥ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 4
እንዳው ፈስሶ ቀረ
ቃልህን ጠግቤ እያገሳሁት ነው ሌሎች እስኪሰሙ
በቃልህ መኖር ግን አልያዝህ አለኝ ከበደኝ ቀለሙ
ብዙ ጥቅስ አገኘሁ ከቅዱስ መጽሐፍህ ገልጬ አይቼ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 5
ከራሴ ላይ ብቻ አንድ ጥቅስ አጣሁኝ በበደል ተኝቼ
ውጤቴ ደካማ ትምህርት የማይሰርጸኝ ተማሪ ብሆንም
ይህቺን ዓመት ተወኝ ደግሞ ትንሽ ልማር ታገሰኝ አሁንም
እባክህ አልቆረጥ በቅዱስ መሬትህ ልቆይ ፍቀድልኝ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 6
ያፈሩት ቅዱሳን የፍሬአቸው ሽታ መዓዛ እንዲደርሰኝ
የተሸከምከኝ ሆይ ዛሬም ተሸከመኝ አትሰልቸኝ አደራ
ማን ይታገሰኛል ጠላት እየሆንኩት አይሰሩ ስሰራ
አታውጣኝ ከቤትህ ብዙ ቦታ አልይዝም ፍሬ ስለሌለኝ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 7
ስፍራ የማያሻኝ ቤት የማላጣብብ ፍሬ አልባ በለስ ነኝ
ቦታስ የሚይዙት ባለ ምግባሮቹ ቅዱሳንህ ናቸው
ልክ እንደ ዘንባባ የተንዠረገገ ተጋድሎ ጽድቃቸው
ከሊባኖስ ዝግባ እጅጉን የበዛ ገድል ትሩፋታቸው

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 8
እኔ አይደለሁም ቦታስ የምትይዘው ያንተው እናት ናት
ስሮቿ በምድር ጫፎቿ በሰማይ ሲደርሱ ያየናት
ይህቺን ዓመት ተወኝ ከስሯ እሆናለሁ ባፈራ ምናልባት
ይህቺን ዓመት ተወኝ እባክህ አምላኬ አንድ ዓመት ምንህ ናት

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 9
ሺ ዓመት አንድ ቀን አይደለም ወይ ለአንተ ዓመት ኢምንት ናት
ይኄ ዓመት አልፎ ዳግም ዓመት ስጠኝ እስከምልህ ድረስ
እባክህን ጌታ ይህቺን ዓመት ተወኝ የወጉን እንዳደርስ

CHORUS
ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ',
      lyrics_transliteration = 'CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 1
Zarem salafera eshohn abqye derqe t’ebeqkugn
Yaltederegelgn yalafeseskbgn yalset’eኸgn yelem neger gin yih hulu alarmh alegn alleyegnm kealem
Yematslechegn hoy tenesche eskqom ebakh tagesegn
Yeenen kifat tewew melakhn semteh yihchin amet tewegn

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 2
Awqalehu tawqaleh qet’eron set’che endemalakebr
Bizu gize aqje bizu gize ziche bewere endemqer
Zendros endalkugn amna yihen gize semteኸgn nebere
Minm sallewet’ zendroye alfo beadis teqeyere

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 3
Fire yemaywet’agn enen bemekotkot ejochh dekemu
Ene gin alehugn zarem albeqagnm behat’iat metamemu
Yeqalhn wiha bedngay lijh lay sattakt sitafes zemen teqot’ere
Wede libe sayserg hiyweten saylewt’

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 4
Endaw fesso qere
Qalhn t’egbe eyagesahut new leloch eskisemu
Beqalh menor gin alyazh alegn kebedegn qelemu
Bizu t’qs agegnehu keqdus mets’hefh gelch’e ayche

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 5
Kerase lay bicha and t’qs at’ahugn bebedel tegnche
Wit’ete dekama timhrt yemayserts’egn temari bihonm
Yihchin amet tewegn degmo tinsh limar tagesegn ahunm
Ebakh alqoret’ beqdus mereth liqoy fiqedlgn

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 6
Yaferut Kidusan yefreachew shta meaza endidersegn
Yeteshekemkegn hoy zarem teshekemegn atselchegn adera
Man yitagesegnal t’elat eyehonkut ayseru sisera
Atawt’agn kebeth bizu bota alyzm fire silelelegn

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 7
Sifra yemayashagn bet yemalat’abb fire alba beles negn
Botas yemiyzut bale migbarochu qidusanh nachew
Lik ende zenbaba yetenzheregege tegadlo ts’dqachew
Kelibanos zigba ejgun yebeza gedl tirufatachew

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 8
Ene aydelehum botas yemtyzew yantew enat nat
Sirochwa bemdr ch’afochwa besemay sidersu yayenat
Yihchin amet tewegn kesrwa ehonalehu bafera minalbat
Yihchin amet tewegn ebakh amlake and amet minh nat

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 9
Shi amet and qen aydelem wey leante amet imnt nat
Yihe amet alfo dagm amet sit’egn eskemlh dires
Ebakhn Geta yihchin amet tewegn yewegun endaders

CHORUS
Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yihichin-amet-tewegn-1238'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከዓመት እስከ ዓመት ፍሬን ሳላፈራ ደረቅ እንደሆንኩኝ
በራድ ወይም ትኩስ ሁለቱንም ሳልሆን እንዳው ለብ እንዳልኩኝ
አለሁኝ በቤትህ ለሙን መሬትህን እንዳጎሳቆልኩኝ
አውቃለሁ አምላኬ ፍሬን ለመቀበል እንዳመላለስኩህ

VERSE 1
ዛሬም ሳላፈራ እሾህን አብቅዬ ደርቄ ጠበቅኩኝ
ያልተደረገልኝ ያላፈሰስክብኝ ያልሰጠኸኝ የለም ነገር ግን ይህ ሁሉ አላርምህ አለኝ አልለየኝም ከዓለም
የማትስለቸኝ ሆይ ተነስቼ እስክቆም እባክህ ታገሰኝ
የእኔን ክፋት ተወው መልአክህን ሰምተህ ይህቺን ዓመት ተወኝ

VERSE 2
አውቃለሁ ታውቃለህ ቀጠሮን ሰጥቼ እንደማላከብር
ብዙ ጊዜ አቅጄ ብዙ ግዜ ዝቼ በወሬ እንደምቀር
ዘንድሮስ እንዳልኩኝ አምና ይኄን ጊዜ ሰምተኸኝ ነበረ
ምንም ሳልለወጥ ዘንድሮዬ አልፎ በአዲስ ተቀየረ

VERSE 3
ፍሬ የማይወጣኝ እኔን በመኮትኮት እጆችህ ደከሙ
እኔ ግን አለሁኝ ዛሬም አልበቃኝም በኃጢአት መታመሙ
የቃልህን ውሃ በድንጋይ ልጅህ ላይ ሳትታክት ስታፈስ ዘመን ተቆጠረ
ወደ ልቤ ሳይሰርግ ሕይወቴን ሳይለውጥ

VERSE 4
እንዳው ፈስሶ ቀረ
ቃልህን ጠግቤ እያገሳሁት ነው ሌሎች እስኪሰሙ
በቃልህ መኖር ግን አልያዝህ አለኝ ከበደኝ ቀለሙ
ብዙ ጥቅስ አገኘሁ ከቅዱስ መጽሐፍህ ገልጬ አይቼ

VERSE 5
ከራሴ ላይ ብቻ አንድ ጥቅስ አጣሁኝ በበደል ተኝቼ
ውጤቴ ደካማ ትምህርት የማይሰርጸኝ ተማሪ ብሆንም
ይህቺን ዓመት ተወኝ ደግሞ ትንሽ ልማር ታገሰኝ አሁንም
እባክህ አልቆረጥ በቅዱስ መሬትህ ልቆይ ፍቀድልኝ

VERSE 6
ያፈሩት ቅዱሳን የፍሬአቸው ሽታ መዓዛ እንዲደርሰኝ
የተሸከምከኝ ሆይ ዛሬም ተሸከመኝ አትሰልቸኝ አደራ
ማን ይታገሰኛል ጠላት እየሆንኩት አይሰሩ ስሰራ
አታውጣኝ ከቤትህ ብዙ ቦታ አልይዝም ፍሬ ስለሌለኝ

VERSE 7
ስፍራ የማያሻኝ ቤት የማላጣብብ ፍሬ አልባ በለስ ነኝ
ቦታስ የሚይዙት ባለ ምግባሮቹ ቅዱሳንህ ናቸው
ልክ እንደ ዘንባባ የተንዠረገገ ተጋድሎ ጽድቃቸው
ከሊባኖስ ዝግባ እጅጉን የበዛ ገድል ትሩፋታቸው

VERSE 8
እኔ አይደለሁም ቦታስ የምትይዘው ያንተው እናት ናት
ስሮቿ በምድር ጫፎቿ በሰማይ ሲደርሱ ያየናት
ይህቺን ዓመት ተወኝ ከስሯ እሆናለሁ ባፈራ ምናልባት
ይህቺን ዓመት ተወኝ እባክህ አምላኬ አንድ ዓመት ምንህ ናት

VERSE 9
ሺ ዓመት አንድ ቀን አይደለም ወይ ለአንተ ዓመት ኢምንት ናት
ይኄ ዓመት አልፎ ዳግም ዓመት ስጠኝ እስከምልህ ድረስ
እባክህን ጌታ ይህቺን ዓመት ተወኝ የወጉን እንዳደርስ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Keamet eske amet firen salafera dereq endehonkugn
Berad weym tikus huletunm salhon endaw leb endalkugn
Alehugn bebeth lemun merethn endagosaqolkugn
Awqalehu amlake firen lemeqebel endamelaleskuh

VERSE 1
Zarem salafera eshohn abqye derqe t’ebeqkugn
Yaltederegelgn yalafeseskbgn yalset’eኸgn yelem neger gin yih hulu alarmh alegn alleyegnm kealem
Yematslechegn hoy tenesche eskqom ebakh tagesegn
Yeenen kifat tewew melakhn semteh yihchin amet tewegn

VERSE 2
Awqalehu tawqaleh qet’eron set’che endemalakebr
Bizu gize aqje bizu gize ziche bewere endemqer
Zendros endalkugn amna yihen gize semteኸgn nebere
Minm sallewet’ zendroye alfo beadis teqeyere

VERSE 3
Fire yemaywet’agn enen bemekotkot ejochh dekemu
Ene gin alehugn zarem albeqagnm behat’iat metamemu
Yeqalhn wiha bedngay lijh lay sattakt sitafes zemen teqot’ere
Wede libe sayserg hiyweten saylewt’

VERSE 4
Endaw fesso qere
Qalhn t’egbe eyagesahut new leloch eskisemu
Beqalh menor gin alyazh alegn kebedegn qelemu
Bizu t’qs agegnehu keqdus mets’hefh gelch’e ayche

VERSE 5
Kerase lay bicha and t’qs at’ahugn bebedel tegnche
Wit’ete dekama timhrt yemayserts’egn temari bihonm
Yihchin amet tewegn degmo tinsh limar tagesegn ahunm
Ebakh alqoret’ beqdus mereth liqoy fiqedlgn

VERSE 6
Yaferut Kidusan yefreachew shta meaza endidersegn
Yeteshekemkegn hoy zarem teshekemegn atselchegn adera
Man yitagesegnal t’elat eyehonkut ayseru sisera
Atawt’agn kebeth bizu bota alyzm fire silelelegn

VERSE 7
Sifra yemayashagn bet yemalat’abb fire alba beles negn
Botas yemiyzut bale migbarochu qidusanh nachew
Lik ende zenbaba yetenzheregege tegadlo ts’dqachew
Kelibanos zigba ejgun yebeza gedl tirufatachew

VERSE 8
Ene aydelehum botas yemtyzew yantew enat nat
Sirochwa bemdr ch’afochwa besemay sidersu yayenat
Yihchin amet tewegn kesrwa ehonalehu bafera minalbat
Yihchin amet tewegn ebakh amlake and amet minh nat

VERSE 9
Shi amet and qen aydelem wey leante amet imnt nat
Yihe amet alfo dagm amet sit’egn eskemlh dires
Ebakhn Geta yihchin amet tewegn yewegun endaders'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yihichin-amet-tewegn-1238', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yikerta (yikerta)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 1
አለፈኝ በከንቱ ዘመኔ በዋዛ
በዚህ አለም ፍቅር ጌታየ በምኞት ደንዝዛ
ጀንበሯ ዘቅዝቃ ቀኑ እየመሸ ነው
አንቃኝ ሙሽራየ ጌታየ መቅረዜ ባዶ ነው

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 2
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 3
ጥሪውን ሳልሰማ ጆሮየን ደፍኜ
ለምጠፋው ዓለም ተሸነፍኩ በፍቅሯ መንኜ
ብዙ ዘመን ርቄ አምላኬ ጠፍቻለሁና
ከመንጋህ ቀላቅለኝ ይቅር በለኝና

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 4
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 5
ስለ ክፉ ፈንታ ለልጅህ በጎን አድርገህ
አጥብቄ ስሸሽህ ፈለከኝ አጥብቀህ
የማይበርደው ፍቅርህ አባቴ ዛሬም ይሞቀኛል
እንዲህ ያለ ወዳጅ አምላኬ ከወዴት ይገኛል

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 6
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 7
በትርህ ፍቅር ነው ልብን የሚመታ
ስበድል ለኖርኩት ቁጣህም ዝምታ
አሁን ተቀበለኝ በፍቅርህ ማርከኸኛልና
አባቴ ልበልህ ፍቀድልኝና

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 8
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ',
      lyrics_transliteration = 'CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 1
Alefegn bekentu zemene bewaza
Bezih alem fiqr getaye bemgnot denzza
Jenberwa zeqzqa qenu eyemeshe new
Anqagn mushraye getaye meqreze bado new

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 2
O Egzi’o maregn amlake
Elemnhelehu fith tenberkke

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 3
T’riwn salsema joroyen defgne
Lemt’efaw alem teshenefku befqrwa mengne
Bizu zemen riqe amlake t’efchalehuna
Kemengah qelaqlegn yiqr belegnna

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 4
O Egzi’o maregn amlake
Elemnhelehu fith tenberkke

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 5
Sile kifu fenta leljh begon adrgeh
At’bqe sisheshh felekegn at’bqeh
Yemayberdew fiqrh abate zarem yimoqegnal
Endih yale wedaj amlake kewedet yigegnal

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 6
O Egzi’o maregn amlake
Elemnhelehu fith tenberkke

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 7
Betrh fiqr new libn yemimeta
Sibedl lenorkut qut’ahm zimta
Ahun teqebelegn befqrh markeኸgnalna
Abate libelh fiqedlgnna

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 8
O Egzi’o maregn amlake
Elemnhelehu fith tenberkke

CHORUS
Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yikerta'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 1
አለፈኝ በከንቱ ዘመኔ በዋዛ
በዚህ አለም ፍቅር ጌታየ በምኞት ደንዝዛ
ጀንበሯ ዘቅዝቃ ቀኑ እየመሸ ነው
አንቃኝ ሙሽራየ ጌታየ መቅረዜ ባዶ ነው

VERSE 2
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

VERSE 3
ጥሪውን ሳልሰማ ጆሮየን ደፍኜ
ለምጠፋው ዓለም ተሸነፍኩ በፍቅሯ መንኜ
ብዙ ዘመን ርቄ አምላኬ ጠፍቻለሁና
ከመንጋህ ቀላቅለኝ ይቅር በለኝና

VERSE 4
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

VERSE 5
ስለ ክፉ ፈንታ ለልጅህ በጎን አድርገህ
አጥብቄ ስሸሽህ ፈለከኝ አጥብቀህ
የማይበርደው ፍቅርህ አባቴ ዛሬም ይሞቀኛል
እንዲህ ያለ ወዳጅ አምላኬ ከወዴት ይገኛል

VERSE 6
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

VERSE 7
በትርህ ፍቅር ነው ልብን የሚመታ
ስበድል ለኖርኩት ቁጣህም ዝምታ
አሁን ተቀበለኝ በፍቅርህ ማርከኸኛልና
አባቴ ልበልህ ፍቀድልኝና

VERSE 8
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yiqrta (2) libelh yiqrta
Elohe (2)libelh yene Geta
Eskahun kalehugn befqrh zimta
Eskahun alehugn befqrh zimta

VERSE 1
Alefegn bekentu zemene bewaza
Bezih alem fiqr getaye bemgnot denzza
Jenberwa zeqzqa qenu eyemeshe new
Anqagn mushraye getaye meqreze bado new

VERSE 2
O Egzi’o maregn amlake
Elemnhelehu fith tenberkke

VERSE 3
T’riwn salsema joroyen defgne
Lemt’efaw alem teshenefku befqrwa mengne
Bizu zemen riqe amlake t’efchalehuna
Kemengah qelaqlegn yiqr belegnna

VERSE 4
O Egzi’o maregn amlake
Elemnhelehu fith tenberkke

VERSE 5
Sile kifu fenta leljh begon adrgeh
At’bqe sisheshh felekegn at’bqeh
Yemayberdew fiqrh abate zarem yimoqegnal
Endih yale wedaj amlake kewedet yigegnal

VERSE 6
O Egzi’o maregn amlake
Elemnhelehu fith tenberkke

VERSE 7
Betrh fiqr new libn yemimeta
Sibedl lenorkut qut’ahm zimta
Ahun teqebelegn befqrh markeኸgnalna
Abate libelh fiqedlgnna

VERSE 8
O Egzi’o maregn amlake
Elemnhelehu fith tenberkke'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yikerta', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yikuneni (yikuneni)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 1
የአዳም ቃልኪዳን መፈጸሚያው ሲደርስ
ላከው ገብርኤልን ወደ ቤተመቅደስ
በእግዚአብሔር እሊና ተስላ የነበረች
ከሰማይ የመጣ ቃሉን ተቀበለች

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 2
ዳግሚት ሰማይ አርያም ሆነች
ይደረግ ብላ በትዕትና ተቀበለች
አዝ……………………………………………………………
ማርያም ሆይ አትፍሪ ብሎ እያረጋጋት

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 3
ካንቺ የሚወለደው መድኃኒት ነው አላት
ወንድ ስለማላውቅ ይሄ እንዴት ይሆናል
ብላ ጠየቀችው ድንግልም ደንቋታል
ከሴቶች መሀል አንቺ ልዩነሽ

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 4
በህግ ሳይሆን በድንግልና ትፀንሻለሽ
አዝ……………………………………………………………
ሕይወት ቢቀዳባት አድሮኋል በማህጸኗ
አይኖርም ከእንግዲህ የሔዋን መርገሟ

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 5
የአዲሱ ኪዳን አዲስ ብስራታችን
ምክንያተ ድህነት አለች እናታችን
ቃልህ ይፈጸም ይደረግ ብላ
ታምር ተሰማ እየሩሳሌም ናዝሬት ገሊላ

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 6
አዝ…………………………………………………………
እጅግ አስገረመኝ የገብርኤል ዜና
የነ ዘካርያሰ ከቶ አይደለምና
የተመረጠችው የደረስው ብስራት

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 7
አለምን ከመሞት ከመርገሟ ዋጃት
ከሴቶች መሀል አንቺ ልዩነሽ
በህግ ሳይሆን በድንግልና ትፀንሻለሽ

CHORUS
ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………',
      lyrics_transliteration = 'CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 1
Yeadam qalkidan mefets’emiyaw siders
Lakew gebreln wede betemeqdes
BeEgziabher elina tesla yeneberech
Kesemay yemet’a qalun teqebelech

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 2
Dagmit semay aryam honech
Yidereg bila betetna teqebelech
CHORUS
Maryam hoy atfri bilo eyaregagat

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 3
Kanchi yemiweledew medhanit new alat
Wend silemalawq yihe endet yihonal
Bila t’eyeqechw dinglm denqwatal
Kesetoch mehel anchi liyunesh

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 4
Behg sayhon bedingilina tits’enshalesh
CHORUS
Hiywet biqedabat adrohwal bemahts’enwa
Aynorm keengdih yehewan mergemwa

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 5
Yeadisu kidan adis bisratachn
Miknyate dihnet alech enatachn
Qalh yifets’em yidereg bila
Tamr tesema eyerusalem nazret gelila

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 6
CHORUS
Ejg asgeremegn yeGebriel zena
Yene zekaryase keto aydelemna
Yetemeret’echw yederesw bisrat

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 7
Alemn kememot kemergemwa wajat
Kesetoch mehel anchi liyunesh
Behg sayhon bedingilina tits’enshalesh

CHORUS
Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yikuneni'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ይኩነኒ በከመ ትቤለኒ /2/
አለች የእኛ እናት በትዕትና በስጋም በነፍሰም ንፅህይት ናትና
አለች የእኛ እናት በትዕትና ድንግል በክልኤ ንፅህይት ናትና
አዝ……………………………………………………………

VERSE 1
የአዳም ቃልኪዳን መፈጸሚያው ሲደርስ
ላከው ገብርኤልን ወደ ቤተመቅደስ
በእግዚአብሔር እሊና ተስላ የነበረች
ከሰማይ የመጣ ቃሉን ተቀበለች

VERSE 2
ዳግሚት ሰማይ አርያም ሆነች
ይደረግ ብላ በትዕትና ተቀበለች
አዝ……………………………………………………………
ማርያም ሆይ አትፍሪ ብሎ እያረጋጋት

VERSE 3
ካንቺ የሚወለደው መድኃኒት ነው አላት
ወንድ ስለማላውቅ ይሄ እንዴት ይሆናል
ብላ ጠየቀችው ድንግልም ደንቋታል
ከሴቶች መሀል አንቺ ልዩነሽ

VERSE 4
በህግ ሳይሆን በድንግልና ትፀንሻለሽ
አዝ……………………………………………………………
ሕይወት ቢቀዳባት አድሮኋል በማህጸኗ
አይኖርም ከእንግዲህ የሔዋን መርገሟ

VERSE 5
የአዲሱ ኪዳን አዲስ ብስራታችን
ምክንያተ ድህነት አለች እናታችን
ቃልህ ይፈጸም ይደረግ ብላ
ታምር ተሰማ እየሩሳሌም ናዝሬት ገሊላ

VERSE 6
አዝ…………………………………………………………
እጅግ አስገረመኝ የገብርኤል ዜና
የነ ዘካርያሰ ከቶ አይደለምና
የተመረጠችው የደረስው ብስራት

VERSE 7
አለምን ከመሞት ከመርገሟ ዋጃት
ከሴቶች መሀል አንቺ ልዩነሽ
በህግ ሳይሆን በድንግልና ትፀንሻለሽ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yikuneni bekeme tibeleni (2)
Alech yeegna enat betetna besgam benefsem nits’hyt natna
Alech yeegna enat betetna Dingil bekle nits’hyt natna
CHORUS

VERSE 1
Yeadam qalkidan mefets’emiyaw siders
Lakew gebreln wede betemeqdes
BeEgziabher elina tesla yeneberech
Kesemay yemet’a qalun teqebelech

VERSE 2
Dagmit semay aryam honech
Yidereg bila betetna teqebelech
Maryam hoy atfri bilo eyaregagat

VERSE 3
Kanchi yemiweledew medhanit new alat
Wend silemalawq yihe endet yihonal
Bila t’eyeqechw dinglm denqwatal
Kesetoch mehel anchi liyunesh

VERSE 4
Behg sayhon bedingilina tits’enshalesh
Hiywet biqedabat adrohwal bemahts’enwa
Aynorm keengdih yehewan mergemwa

VERSE 5
Yeadisu kidan adis bisratachn
Miknyate dihnet alech enatachn
Qalh yifets’em yidereg bila
Tamr tesema eyerusalem nazret gelila

VERSE 6
Ejg asgeremegn yeGebriel zena
Yene zekaryase keto aydelemna
Yetemeret’echw yederesw bisrat

VERSE 7
Alemn kememot kemergemwa wajat
Kesetoch mehel anchi liyunesh
Behg sayhon bedingilina tits’enshalesh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yikuneni', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yilal Andebete (yilal-andebete)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 1
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 2
የትናንት ህይወቴን ዞር ብዬ ሳየው
ማምለጫ የሌለው አጥሩምሾ ነው
ወደ እረፍት የወጣሁ ይድረስ ምስጋናዬ
በጆር ቢዝጉብኝ በሩ ነውኝ ጌታዬ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 3
በጆር ቢዝጉብኝ በሩ ነውኝ ጌታዬ
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 4
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ
በድሉ በረሃ ምግብ መጠጦ ነው
መንገዴን አቅናው እጅህ በአፍ ያሻገረኝ
በእሳትና በውሃ መካከል አልፌ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 5
ተመስገን እላለሁ ክብር ይሁንህ አፌ
ተመስገን እላለሁ ክብር ይሁንህ አፌ
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 6
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ
የብቸኝነቴን ማዕበል ገስጾአል
ለኔ ብርሃን ሆኖ የከሳሽ ጸልሟል

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 7
ቀስቱን እያደፈ ታደገኝ ከስቃይ
የጌታዬ ሀሳብ ፍቅር ነው በእኔ ላይ
የጌታዬ ሀሳብ ፍቅር ነው በእኔ ላይ
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 8
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ
ትናንት ዛሬ ነገ ዘላለም ጠባቂ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 9
የልቤን ፍላጎት ሳልነግረው አዋቂ
በባህርየው ቅዱስ የሌለው አምሳያ
ስሙ ወደበየ ነው መልኬን መጥራያ
ስሙ ወደበየ ነው መልኬን መጥራያ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 10
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

CHORUS
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ',
      lyrics_transliteration = 'CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 1
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 2
Yetnant hiyweten zor biye sayew
Mamlech’a yelelew at’rumsho new
Wede ereft yewet’ahu yidres misganaye
Bejor bizgubgn beru newgn Getaye

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 3
Bejor bizgubgn beru newgn Getaye
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 4
Tilehalech nefse fiqr new Getaye
Bedlu bereha migb met’et’o new
Mengeden aqnaw ejh beaf yashageregn
Beesatna bewha mekakel alfe

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 5
Temesgen elalehu kibir yihunh afe
Temesgen elalehu kibir yihunh afe
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 6
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye
Yebchegnneten maebel gests’oal
Lene birhan hono yekesash ts’elmwal

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 7
Qestun eyadefe tadegegn kesqay
Yegetaye hesab fiqr new beene lay
Yegetaye hesab fiqr new beene lay
Yilal andebete Egziabher Kidus new

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 8
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye
Tinant zare nege zelalem t’ebaqi

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 9
Yelben filagot salnegrew awaqi
Bebahryew Kidus yelelew amsaya
Simu wedebeye new melken met’raya
Simu wedebeye new melken met’raya

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 10
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

CHORUS
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yilal-andebete'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 1
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ

VERSE 2
የትናንት ህይወቴን ዞር ብዬ ሳየው
ማምለጫ የሌለው አጥሩምሾ ነው
ወደ እረፍት የወጣሁ ይድረስ ምስጋናዬ
በጆር ቢዝጉብኝ በሩ ነውኝ ጌታዬ

VERSE 3
በጆር ቢዝጉብኝ በሩ ነውኝ ጌታዬ
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ

VERSE 4
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ
በድሉ በረሃ ምግብ መጠጦ ነው
መንገዴን አቅናው እጅህ በአፍ ያሻገረኝ
በእሳትና በውሃ መካከል አልፌ

VERSE 5
ተመስገን እላለሁ ክብር ይሁንህ አፌ
ተመስገን እላለሁ ክብር ይሁንህ አፌ
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው

VERSE 6
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ
የብቸኝነቴን ማዕበል ገስጾአል
ለኔ ብርሃን ሆኖ የከሳሽ ጸልሟል

VERSE 7
ቀስቱን እያደፈ ታደገኝ ከስቃይ
የጌታዬ ሀሳብ ፍቅር ነው በእኔ ላይ
የጌታዬ ሀሳብ ፍቅር ነው በእኔ ላይ
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው

VERSE 8
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ
ትናንት ዛሬ ነገ ዘላለም ጠባቂ

VERSE 9
የልቤን ፍላጎት ሳልነግረው አዋቂ
በባህርየው ቅዱስ የሌለው አምሳያ
ስሙ ወደበየ ነው መልኬን መጥራያ
ስሙ ወደበየ ነው መልኬን መጥራያ

VERSE 10
ይላል አንደበቴ እግዚአብሔር ቅዱስ ነው
አይተወኝምና ወላጅ እንደሌለው
ትናንት የጠበቀኝ የነገም ተስፋዬ
ትለሃለች ነፍሴ ፍቅር ነው ጌታዬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 1
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye

VERSE 2
Yetnant hiyweten zor biye sayew
Mamlech’a yelelew at’rumsho new
Wede ereft yewet’ahu yidres misganaye
Bejor bizgubgn beru newgn Getaye

VERSE 3
Bejor bizgubgn beru newgn Getaye
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye

VERSE 4
Tilehalech nefse fiqr new Getaye
Bedlu bereha migb met’et’o new
Mengeden aqnaw ejh beaf yashageregn
Beesatna bewha mekakel alfe

VERSE 5
Temesgen elalehu kibir yihunh afe
Temesgen elalehu kibir yihunh afe
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew

VERSE 6
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye
Yebchegnneten maebel gests’oal
Lene birhan hono yekesash ts’elmwal

VERSE 7
Qestun eyadefe tadegegn kesqay
Yegetaye hesab fiqr new beene lay
Yegetaye hesab fiqr new beene lay
Yilal andebete Egziabher Kidus new

VERSE 8
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye
Tinant zare nege zelalem t’ebaqi

VERSE 9
Yelben filagot salnegrew awaqi
Bebahryew Kidus yelelew amsaya
Simu wedebeye new melken met’raya
Simu wedebeye new melken met’raya

VERSE 10
Yilal andebete Egziabher Kidus new
Aytewegnmna welaj endelelew
Tinant yet’ebeqegn yenegem tesfaye
Tilehalech nefse fiqr new Getaye'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yilal-andebete', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yilal Anidebete (yilal-anidebete)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ

VERSE 1
የትላንት ህይወቴን ዞር ብዬ ሳየው
ማምለጫ የሌለው አጥሩም እሾህ ነው
ወደ እረፍቴ ወጣው ይድረስ ምስጋናዬ
ደጆች ቢዘጉብኝ በር ሆኖኝ ጌታዬ(x2)

CHORUS
ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ

VERSE 2
በጥልቁ በረሀ ምግብ መጠጥ ሆኖኝ
መንገዴን አቀናው እጄን በአፌ አስጫነኝ
በእሳት እና ውሀ መካከል አልፌ
ተመስገን እላለው ቅኔ ሞልቶት አፌን(x2)

CHORUS
ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ

VERSE 3
የብቸኝነቴን ማእበል ገስፃል
ለእኔ ብርሀን ሆኖ ለከሳሽ ጨልሟል
ቀስቱን እያጠፈ ታደገኝ ከስቃይ
የጌታዬ ሀሳብ ፍቅር ነው በኔ ላይ(x2)

CHORUS
ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ

VERSE 4
ትላንት ዛሬ ነገ ዘላለም ጠባቂ
የልቤን ፍላጎት ሳልነግረው አዋቂ
በባህሪው ቅዱስ የሌለው አምሳያ
ስሙ ወደቤ ነው መልሕቄን መጣያ(x2)

CHORUS
ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ',
      lyrics_transliteration = 'CHORUS
Yilal andebete egziabher Kidus new
Aytewegnm ena welaj endelelew
Tilant yet’ebeqegn yenegem tesfaye
Tilhelech nefse fiqr neh Getaye

VERSE 1
Yetlant hiyweten zor biye sayew
Mamlech’a yelelew at’rum eshoh new
Wede erefte wet’aw yidres misganaye
Dejoch bizegubgn ber honogn Getaye(x2)

CHORUS
Yilal andebete egziabher Kidus new
Aytewegnm ena welaj endelelew
Tilant yet’ebeqegn yenegem tesfaye
Tilhelech nefse fiqr neh Getaye

VERSE 2
Bet’lqu berehe migb met’et’ honogn
Mengeden aqenaw ejen beafe asch’anegn
Beesat ena wihe mekakel alfe
Temesgen elalew qine moltot afen(x2)

CHORUS
Yilal andebete egziabher Kidus new
Aytewegnm ena welaj endelelew
Tilant yet’ebeqegn yenegem tesfaye
Tilhelech nefse fiqr neh Getaye

VERSE 3
Yebchegnneten maebel gests’al
Leene birhen hono lekesash ch’elmwal
Qestun eyat’efe tadegegn kesqay
Yegetaye hesab fiqr new bene lay(x2)

CHORUS
Yilal andebete egziabher Kidus new
Aytewegnm ena welaj endelelew
Tilant yet’ebeqegn yenegem tesfaye
Tilhelech nefse fiqr neh Getaye

VERSE 4
Tilant zare nege zelalem t’ebaqi
Yelben filagot salnegrew awaqi
Bebahriw Kidus yelelew amsaya
Simu wedebe new melhqen met’aya(x2)

CHORUS
Yilal andebete egziabher Kidus new
Aytewegnm ena welaj endelelew
Tilant yet’ebeqegn yenegem tesfaye
Tilhelech nefse fiqr neh Getaye',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yilal-anidebete'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ይላል አንደበቴ እግዚአብሄር ቅዱስ ነው
አይተወኝም እና ወላጅ እንደሌለው
ትላንት የጠበቀኝ የነገም ተስፋዬ
ትልሀለች ነፍሴ ፍቅር ነህ ጌታዬ

VERSE 1
የትላንት ህይወቴን ዞር ብዬ ሳየው
ማምለጫ የሌለው አጥሩም እሾህ ነው
ወደ እረፍቴ ወጣው ይድረስ ምስጋናዬ
ደጆች ቢዘጉብኝ በር ሆኖኝ ጌታዬ(x2)

VERSE 2
በጥልቁ በረሀ ምግብ መጠጥ ሆኖኝ
መንገዴን አቀናው እጄን በአፌ አስጫነኝ
በእሳት እና ውሀ መካከል አልፌ
ተመስገን እላለው ቅኔ ሞልቶት አፌን(x2)

VERSE 3
የብቸኝነቴን ማእበል ገስፃል
ለእኔ ብርሀን ሆኖ ለከሳሽ ጨልሟል
ቀስቱን እያጠፈ ታደገኝ ከስቃይ
የጌታዬ ሀሳብ ፍቅር ነው በኔ ላይ(x2)

VERSE 4
ትላንት ዛሬ ነገ ዘላለም ጠባቂ
የልቤን ፍላጎት ሳልነግረው አዋቂ
በባህሪው ቅዱስ የሌለው አምሳያ
ስሙ ወደቤ ነው መልሕቄን መጣያ(x2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yilal andebete egziabher Kidus new
Aytewegnm ena welaj endelelew
Tilant yet’ebeqegn yenegem tesfaye
Tilhelech nefse fiqr neh Getaye

VERSE 1
Yetlant hiyweten zor biye sayew
Mamlech’a yelelew at’rum eshoh new
Wede erefte wet’aw yidres misganaye
Dejoch bizegubgn ber honogn Getaye(x2)

VERSE 2
Bet’lqu berehe migb met’et’ honogn
Mengeden aqenaw ejen beafe asch’anegn
Beesat ena wihe mekakel alfe
Temesgen elalew qine moltot afen(x2)

VERSE 3
Yebchegnneten maebel gests’al
Leene birhen hono lekesash ch’elmwal
Qestun eyat’efe tadegegn kesqay
Yegetaye hesab fiqr new bene lay(x2)

VERSE 4
Tilant zare nege zelalem t’ebaqi
Yelben filagot salnegrew awaqi
Bebahriw Kidus yelelew amsaya
Simu wedebe new melhqen met’aya(x2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yilal-anidebete', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yinafkal libe Tegegn Begena mezmur (yinafkal-libe-tegegn-begena-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ

VERSE 1
በፍቅርህ ስታየኝ አነባለሁኝ
በውስጤ ይፈሳል ፍቅርህ እንደዘይት
እንዴት ልርሳው ቸርነትክን ከተለወጥኩብህ
ለፍርድ አትቸኩልም በልጆችህ ላይ

CHORUS
ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ

VERSE 2
ልቦናዬን ማርከኸዋል ከምንም በላይ
የእኔ አይደለምና የምድር ሰውነቴ
ላገልግልህ ባሪያህ ሆኜ ቸር ነህ መዳኒቴ
አመፅን ለመስራት ስፈጥን ከመንገድ

CHORUS
ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ

VERSE 3
ከአጠገብ
አይሃለሁ እብደቴን ስታግድ እንደምን ወደድከኝ ምን እከፍልሃለሁ
ከሰው ምንም የማትወስድ
መሆንክን አውቃለሁ

CHORUS
ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ

VERSE 4
እንግዳ ነህ ለእኔ አዲስ ነህ ለቤቴ
ትልቁ ዘመዴ ለብቸኝነቴ
ዳር ሆነህ አታየኝ ሀዘን ሲገርፈኝ
ለጥያቄዎቼ ሁሉ መልስ የምትሆነኝ

CHORUS
ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ',
      lyrics_transliteration = 'CHORUS
Yinafqal libe bebzu
Litazezh ligezalh liyageleglh
Hat’iatm ende hilm
Wist’en sigezagn

VERSE 1
Befqrh sitayegn anebalehugn
Bewst’e yifesal fiqrh endezeyt
Endet lirsaw chernetkn ketelewet’kubh
Lefrd atchekulm beljochh lay

CHORUS
Yinafqal libe bebzu
Litazezh ligezalh liyageleglh
Hat’iatm ende hilm
Wist’en sigezagn

VERSE 2
Libonayen markeኸwal kemnm belay
Yeene aydelemna yemdr sewnete
Lagelglh bariyah hogne cher neh medanite
Amets’n lemesrat sifet’n kemenged

CHORUS
Yinafqal libe bebzu
Litazezh ligezalh liyageleglh
Hat’iatm ende hilm
Wist’en sigezagn

VERSE 3
Keat’egeb
Ayhalehu ebdeten sitagd endemn wededkegn min ekeflhalehu
Kesew minm yematwesd
Mehonkn awqalehu

CHORUS
Yinafqal libe bebzu
Litazezh ligezalh liyageleglh
Hat’iatm ende hilm
Wist’en sigezagn

VERSE 4
Engda neh leene adis neh lebete
Tilqu zemede lebchegnnete
Dar honeh atayegn hezen sigerfegn
Let’yaqewoche hulu mels yemthonegn

CHORUS
Yinafqal libe bebzu
Litazezh ligezalh liyageleglh
Hat’iatm ende hilm
Wist’en sigezagn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yinafkal-libe-tegegn-begena-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ይናፍቃል ልቤ በብዙ
ሊታዘዝህ ሊገዛልህ ሊያገለግልህ
ኃጢአትም እንደ ህልም
ውስጤን ሲገዛኝ

VERSE 1
በፍቅርህ ስታየኝ አነባለሁኝ
በውስጤ ይፈሳል ፍቅርህ እንደዘይት
እንዴት ልርሳው ቸርነትክን ከተለወጥኩብህ
ለፍርድ አትቸኩልም በልጆችህ ላይ

VERSE 2
ልቦናዬን ማርከኸዋል ከምንም በላይ
የእኔ አይደለምና የምድር ሰውነቴ
ላገልግልህ ባሪያህ ሆኜ ቸር ነህ መዳኒቴ
አመፅን ለመስራት ስፈጥን ከመንገድ

VERSE 3
ከአጠገብ
አይሃለሁ እብደቴን ስታግድ እንደምን ወደድከኝ ምን እከፍልሃለሁ
ከሰው ምንም የማትወስድ
መሆንክን አውቃለሁ

VERSE 4
እንግዳ ነህ ለእኔ አዲስ ነህ ለቤቴ
ትልቁ ዘመዴ ለብቸኝነቴ
ዳር ሆነህ አታየኝ ሀዘን ሲገርፈኝ
ለጥያቄዎቼ ሁሉ መልስ የምትሆነኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yinafqal libe bebzu
Litazezh ligezalh liyageleglh
Hat’iatm ende hilm
Wist’en sigezagn

VERSE 1
Befqrh sitayegn anebalehugn
Bewst’e yifesal fiqrh endezeyt
Endet lirsaw chernetkn ketelewet’kubh
Lefrd atchekulm beljochh lay

VERSE 2
Libonayen markeኸwal kemnm belay
Yeene aydelemna yemdr sewnete
Lagelglh bariyah hogne cher neh medanite
Amets’n lemesrat sifet’n kemenged

VERSE 3
Keat’egeb
Ayhalehu ebdeten sitagd endemn wededkegn min ekeflhalehu
Kesew minm yematwesd
Mehonkn awqalehu

VERSE 4
Engda neh leene adis neh lebete
Tilqu zemede lebchegnnete
Dar honeh atayegn hezen sigerfegn
Let’yaqewoche hulu mels yemthonegn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yinafkal-libe-tegegn-begena-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yiqirta Libelih (yiqirta-libelih)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 1
አለፈኝ በከንቱ ዘመኔ በዋዛ
በዚህ አለም ፍቅር ጌታየ በምኞት ደንዝዛ
ጀንበሯ ዘቅዝቃ ቀኑ እየመሸ ነው
አንቃኝ ሙሽራየ ጌታየ መቅረዜ ባዶ ነው

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 2
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 3
ጥሪውን ሳልሰማ ጆሮየን ደፍኜ
ለምጠፋው ዓለም ተሸነፍኩ በፍቅሯ መንኜ
ብዙ ዘመን ርቄ አምላኬ ጠፍቻለሁና
ከመንጋህ ቀላቅለኝ ይቅር በለኝና

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 4
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 5
ስለ ክፉ ፈንታ ለልጅህ በጎን አድርገህ
አጥብቄ ስሸሽህ ፈለከኝ አጥብቀህ
የማይበርደው ፍቅርህአባቴዛሬምይሞቀኛል
እንዲህ ያለ ወዳጅ አምላኬ ከወዴትይገኛል

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 6
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 7
በትርህ ፍቅር ነው ልብን የሚመታ
ስበድል ለኖርኩት ቁጣህም ዝምታ
አሁን ተቀበለኝ በፍቅርህ ማርከኸኛልና
አባቴ ልበልህ ፍቀድልኝና

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 8
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

CHORUS
ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ',
      lyrics_transliteration = 'CHORUS
yqrta() lbelh yqrta
elohe()lbelh yene geta
skahun kalehuny befqrh zmta
skahun elehuny befqrh zmta

VERSE 1
ez
elefeny bekentu zemene bewaza
bezih elem fqr getaye bemnyot denzza
jenbe zeqzqa qenu yemeshe new

CHORUS
yqrta() lbelh yqrta
elohe()lbelh yene geta
skahun kalehuny befqrh zmta
skahun elehuny befqrh zmta

VERSE 2
enqany mushraye getaye meqreze bado new
o gzio mareny emlake
lemnhelehu fith tenberkke

CHORUS
yqrta() lbelh yqrta
elohe()lbelh yene geta
skahun kalehuny befqrh zmta
skahun elehuny befqrh zmta

VERSE 3
ez
triwn salsema joroyen defnye
lemtefaw alem teshenefku befq mennye
bzu zemen rqe emlake tefchalehuna

CHORUS
yqrta() lbelh yqrta
elohe()lbelh yene geta
skahun kalehuny befqrh zmta
skahun elehuny befqrh zmta

VERSE 4
kemengah qelaqleny yqr belenyna
o gzio mareny emlake
lemnhelehu fith tenberkke

CHORUS
yqrta() lbelh yqrta
elohe()lbelh yene geta
skahun kalehuny befqrh zmta
skahun elehuny befqrh zmta

VERSE 5
ez
sle kfu fenta leljh begon edrgeh
etbqe ssheshh felekeny etbqeh
yemayberdew fqrhebatezaremymoqenyal

CHORUS
yqrta() lbelh yqrta
elohe()lbelh yene geta
skahun kalehuny befqrh zmta
skahun elehuny befqrh zmta

VERSE 6
ndih yale wedaj emlake kewedetygenyal
o gzio mareny emlake
lemnhelehu fith tenberkke

CHORUS
yqrta() lbelh yqrta
elohe()lbelh yene geta
skahun kalehuny befqrh zmta
skahun elehuny befqrh zmta

VERSE 7
ez
betrh fqr new lbn yemimeta
sbedl lenorkut qutahm zmta
ehun teqebeleny befqrh markehenyalna

CHORUS
yqrta() lbelh yqrta
elohe()lbelh yene geta
skahun kalehuny befqrh zmta
skahun elehuny befqrh zmta

VERSE 8
ebate lbelh fqedlnyna
o gzio mareny emlake
lemnhelehu fith tenberkke

CHORUS
yqrta() lbelh yqrta
elohe()lbelh yene geta
skahun kalehuny befqrh zmta
skahun elehuny befqrh zmta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yiqirta-libelih'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ይቅርታ(፪) ልበልህ ይቅርታ
ኤሎሔ(፪)ልበልህ የኔ ጌታ
እስካሁን ካለሁኝ በፍቅርህ ዝምታ
እስካሁን አለሁኝ በፍቅርህ ዝምታ

VERSE 1
አለፈኝ በከንቱ ዘመኔ በዋዛ
በዚህ አለም ፍቅር ጌታየ በምኞት ደንዝዛ
ጀንበሯ ዘቅዝቃ ቀኑ እየመሸ ነው
አንቃኝ ሙሽራየ ጌታየ መቅረዜ ባዶ ነው

VERSE 2
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

VERSE 3
ጥሪውን ሳልሰማ ጆሮየን ደፍኜ
ለምጠፋው ዓለም ተሸነፍኩ በፍቅሯ መንኜ
ብዙ ዘመን ርቄ አምላኬ ጠፍቻለሁና
ከመንጋህ ቀላቅለኝ ይቅር በለኝና

VERSE 4
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

VERSE 5
ስለ ክፉ ፈንታ ለልጅህ በጎን አድርገህ
አጥብቄ ስሸሽህ ፈለከኝ አጥብቀህ
የማይበርደው ፍቅርህአባቴዛሬምይሞቀኛል
እንዲህ ያለ ወዳጅ አምላኬ ከወዴትይገኛል

VERSE 6
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ

VERSE 7
በትርህ ፍቅር ነው ልብን የሚመታ
ስበድል ለኖርኩት ቁጣህም ዝምታ
አሁን ተቀበለኝ በፍቅርህ ማርከኸኛልና
አባቴ ልበልህ ፍቀድልኝና

VERSE 8
ኦ እግዚኦ ማረኝ አምላኬ
እለምንሀለሁ ፊትህ ተንበርክኬ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'yqrta() lbelh yqrta
elohe()lbelh yene geta
skahun kalehuny befqrh zmta
skahun elehuny befqrh zmta

VERSE 1
ez
elefeny bekentu zemene bewaza
bezih elem fqr getaye bemnyot denzza
jenbe zeqzqa qenu yemeshe new

VERSE 2
enqany mushraye getaye meqreze bado new
o gzio mareny emlake
lemnhelehu fith tenberkke

VERSE 3
ez
triwn salsema joroyen defnye
lemtefaw alem teshenefku befq mennye
bzu zemen rqe emlake tefchalehuna

VERSE 4
kemengah qelaqleny yqr belenyna
o gzio mareny emlake
lemnhelehu fith tenberkke

VERSE 5
ez
sle kfu fenta leljh begon edrgeh
etbqe ssheshh felekeny etbqeh
yemayberdew fqrhebatezaremymoqenyal

VERSE 6
ndih yale wedaj emlake kewedetygenyal
o gzio mareny emlake
lemnhelehu fith tenberkke

VERSE 7
ez
betrh fqr new lbn yemimeta
sbedl lenorkut qutahm zmta
ehun teqebeleny befqrh markehenyalna

VERSE 8
ebate lbelh fqedlnyna
o gzio mareny emlake
lemnhelehu fith tenberkke'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yiqirta-libelih', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yitekal (yitekal)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)

VERSE 1
የሙሴ በረከት ደርሷል የኢያሱ
አምላክ በቃ ብሎ ሲጠራው ወደ እርሱ
ኢያሱን አቆመው በበረታ ጸጋ
የነገሥታት ንጉስ አልፋና ዖሜጋ (2)

CHORUS
ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)

VERSE 2
መጎናጸፊያውን ለኤልሳ ትቶለት
ኤልያስ ቢሄድም ቢነጠቅ በእሳት
እጥፍ ድርብ ጸጋ ከሁሉ የሚልቅ
አምላክ ስለሰጠው ፈጽሟል ድንቃቅንቅ /(2)/

CHORUS
ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)

VERSE 3
ከእኔ ብቻ በቀር ማነው ያለው ሌላ
ትጉ አገልግሎት ዝናሩ ያልላላ
እንዲህ አትበሉ እግዚአብሔር ዘገየ
ይሾማል ለቤቱ ጠላት ዓይኑ እያየ /(2)/

CHORUS
ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)

VERSE 4
ቀድሰን ዘምረን ወንጌሉን መስክረን
ወደ ሰማዩ ቤት ደግሞ እነሄዳለን
እግዚአብሔር ያስነሳል ዳግም እንደገና
ዘመኑን የዋጀ እጅጉን የጸና /(2)/

CHORUS
ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)',
      lyrics_transliteration = 'CHORUS
Yitekal Egziabher agelgay lebetu
Kezarew yemilq yemayzl gulbetu
Aysestm ena ts’egan bemakafel
Birtun yasnesal ketwldu mehal (2)

VERSE 1
Yemuse bereket derswal yeiyasu
Amlak beqa bilo sit’eraw wede ersu
Iyasun aqomew bebereta ts’ega
Yenegestat nigus alfana omega (2)

CHORUS
Yitekal Egziabher agelgay lebetu
Kezarew yemilq yemayzl gulbetu
Aysestm ena ts’egan bemakafel
Birtun yasnesal ketwldu mehal (2)

VERSE 2
Megonats’efiyawn leelsa titolet
Elyas bihedm binet’eq beesat
Et’f dirb ts’ega kehulu yemilq
Amlak sileset’ew fets’mwal dinqaqnq / (2)/

CHORUS
Yitekal Egziabher agelgay lebetu
Kezarew yemilq yemayzl gulbetu
Aysestm ena ts’egan bemakafel
Birtun yasnesal ketwldu mehal (2)

VERSE 3
Keene bicha beqer manew yalew lela
Tigu agelglot zinaru yallala
Endih atbelu Egziabher zegeye
Yishomal lebetu t’elat aynu eyaye / (2)/

CHORUS
Yitekal Egziabher agelgay lebetu
Kezarew yemilq yemayzl gulbetu
Aysestm ena ts’egan bemakafel
Birtun yasnesal ketwldu mehal (2)

VERSE 4
Qedsen zemren wengelun meskren
Wede semayu bet degmo enehedalen
Egziabher yasnesal dagm endegena
Zemenun yewaje ejgun yets’ena / (2)/

CHORUS
Yitekal Egziabher agelgay lebetu
Kezarew yemilq yemayzl gulbetu
Aysestm ena ts’egan bemakafel
Birtun yasnesal ketwldu mehal (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yitekal'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ይተካል እግዚአብሔር አገልጋይ ለቤቱ
ከዛሬው የሚልቅ የማይዝል ጉልበቱ
አይሰስትም እና ጸጋን በማካፈል
ብርቱን ያስነሳል ከትውልዱ መሃል (2)

VERSE 1
የሙሴ በረከት ደርሷል የኢያሱ
አምላክ በቃ ብሎ ሲጠራው ወደ እርሱ
ኢያሱን አቆመው በበረታ ጸጋ
የነገሥታት ንጉስ አልፋና ዖሜጋ (2)

VERSE 2
መጎናጸፊያውን ለኤልሳ ትቶለት
ኤልያስ ቢሄድም ቢነጠቅ በእሳት
እጥፍ ድርብ ጸጋ ከሁሉ የሚልቅ
አምላክ ስለሰጠው ፈጽሟል ድንቃቅንቅ /(2)/

VERSE 3
ከእኔ ብቻ በቀር ማነው ያለው ሌላ
ትጉ አገልግሎት ዝናሩ ያልላላ
እንዲህ አትበሉ እግዚአብሔር ዘገየ
ይሾማል ለቤቱ ጠላት ዓይኑ እያየ /(2)/

VERSE 4
ቀድሰን ዘምረን ወንጌሉን መስክረን
ወደ ሰማዩ ቤት ደግሞ እነሄዳለን
እግዚአብሔር ያስነሳል ዳግም እንደገና
ዘመኑን የዋጀ እጅጉን የጸና /(2)/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yitekal Egziabher agelgay lebetu
Kezarew yemilq yemayzl gulbetu
Aysestm ena ts’egan bemakafel
Birtun yasnesal ketwldu mehal (2)

VERSE 1
Yemuse bereket derswal yeiyasu
Amlak beqa bilo sit’eraw wede ersu
Iyasun aqomew bebereta ts’ega
Yenegestat nigus alfana omega (2)

VERSE 2
Megonats’efiyawn leelsa titolet
Elyas bihedm binet’eq beesat
Et’f dirb ts’ega kehulu yemilq
Amlak sileset’ew fets’mwal dinqaqnq / (2)/

VERSE 3
Keene bicha beqer manew yalew lela
Tigu agelglot zinaru yallala
Endih atbelu Egziabher zegeye
Yishomal lebetu t’elat aynu eyaye / (2)/

VERSE 4
Qedsen zemren wengelun meskren
Wede semayu bet degmo enehedalen
Egziabher yasnesal dagm endegena
Zemenun yewaje ejgun yets’ena / (2)/'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yitekal', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yiwedisiwa (yiwedisiwa)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ይዌድስዋ መላዕክት መላዕክት ለማርያም
በውስጠ ውስጤ መንጦላዕት ይብልዋ
በሀኪ ማርያም ሐዳስዮ ጣዕዋ

VERSE 1
ይዌድስዋ መላዕክት መላዕክት ለማርያም
በውስጠ ውስጤ መንጦላዕት ይብልዋ
በሀኪ ማርያም ሐዳስዮ ጣዕዋ

CHORUS
ይዌድስዋ መላዕክት መላዕክት ለማርያም
በውስጠ ውስጤ መንጦላዕት ይብልዋ
በሀኪ ማርያም ሐዳስዮ ጣዕዋ',
      lyrics_transliteration = 'CHORUS
Yiwedswa melaekt melaekt leMaryam
Bewst’e wist’e ment’olaet yiblwa
Beheki Maryam hedasyo t’aewa

VERSE 1
Yiwedswa melaekt melaekt leMaryam
Bewst’e wist’e ment’olaet yiblwa
Beheki Maryam hedasyo t’aewa

CHORUS
Yiwedswa melaekt melaekt leMaryam
Bewst’e wist’e ment’olaet yiblwa
Beheki Maryam hedasyo t’aewa',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yiwedisiwa'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ይዌድስዋ መላዕክት መላዕክት ለማርያም
በውስጠ ውስጤ መንጦላዕት ይብልዋ
በሀኪ ማርያም ሐዳስዮ ጣዕዋ

VERSE 1
ይዌድስዋ መላዕክት መላዕክት ለማርያም
በውስጠ ውስጤ መንጦላዕት ይብልዋ
በሀኪ ማርያም ሐዳስዮ ጣዕዋ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yiwedswa melaekt melaekt leMaryam
Bewst’e wist’e ment’olaet yiblwa
Beheki Maryam hedasyo t’aewa

VERSE 1
Yiwedswa melaekt melaekt leMaryam
Bewst’e wist’e ment’olaet yiblwa
Beheki Maryam hedasyo t’aewa'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yiwedisiwa', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yohanis Yinager (yohanis-yinager)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 1
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

CHORUS
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 2
የእናቱ ማኅፀን የእግሬ ርስቶ ነች
ድንግል የአምላክ እናት ፊቱ ስለጎበች
በሐሴት ዘለለ ዘመረ በደስታ
ከድንግል ሲወጣ ለጣቃ ሰላምታ

CHORUS
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 3
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

CHORUS
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 4
በድንግል ማኅፀን ስላየ ጌታውን
ከመወለድ ቀድሞ ሰማ ነው መዝሙሩን
ትንቢቱ ሲፈፀም በሆዷ ሲመክት
ሰገደ ለአምላኩ የእስራኤል ወጥንስ

CHORUS
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 5
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

CHORUS
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 6
ጀምረ ስብከቱን ገና ሳይወለድ
ተፈጥሮ አይቻለን ነብዩን ማገድ
አፉ ተከፈተ በታላቅ ምስጋና
በእናቱ ማህፀን ድምፁን አሰማና

CHORUS
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 7
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

CHORUS
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 8
የዮሐንስ እናት ኤልሳቤጥ ገረማት
ልጇ በማህፀን ቅኔ ሲቀኝባት
ድምጿን ከፍ አደረገች አለም እንዲሰማ
በእውነት መንፈስ ቅዱስ ለምዝሙር ለዜማ

CHORUS
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 9
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

CHORUS
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 10
የዮሐንስ እናት ኤልሳቤጥ ገረማት
ልጇ በማህፀን ቅኔ ሲቀኝባት
ድምጿን ከፍ አደረገች ሃገር እንዲሰማ
በእውነት መንፈስ ቅዱስ ለምዝሙር ለዜማ

CHORUS
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 11
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

CHORUS
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው',
      lyrics_transliteration = 'CHORUS
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

VERSE 1
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

CHORUS
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

VERSE 2
Yeenatu mahts’en yeegre risto nech
Dingil yeamlak enat fitu silegobech
Beheset zelele zemere bedesta
Kedngl siwet’a let’aqa selamta

CHORUS
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

VERSE 3
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

CHORUS
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

VERSE 4
Bedngl mahts’en silaye getawn
Kemeweled qedmo sema new mezmurun
Tinbitu sifets’em behodwa simekt
Segede leamlaku yeesrael wet’ns

CHORUS
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

VERSE 5
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

CHORUS
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

VERSE 6
Jemre sibketun gena sayweled
Tefet’ro aychalen nebyun maged
Afu tekefete betalaq misgana
Beenatu mahts’en dimts’un asemana

CHORUS
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

VERSE 7
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

CHORUS
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

VERSE 8
Yeyohens enat elsabet’ geremat
Lijwa bemahts’en qine siqegnbat
Dimts’wan kef aderegech alem endisema
Beewnet menfes Kidus lemzmur lezema

CHORUS
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

VERSE 9
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

CHORUS
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

VERSE 10
Yeyohens enat elsabet’ geremat
Lijwa bemahts’en qine siqegnbat
Dimts’wan kef aderegech hager endisema
Beewnet menfes Kidus lemzmur lezema

CHORUS
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

VERSE 11
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

CHORUS
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yohanis-yinager'
    AND lyrics_amharic IS NOT DISTINCT FROM 'በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 1
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 2
የእናቱ ማኅፀን የእግሬ ርስቶ ነች
ድንግል የአምላክ እናት ፊቱ ስለጎበች
በሐሴት ዘለለ ዘመረ በደስታ
ከድንግል ሲወጣ ለጣቃ ሰላምታ

VERSE 3
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 4
በድንግል ማኅፀን ስላየ ጌታውን
ከመወለድ ቀድሞ ሰማ ነው መዝሙሩን
ትንቢቱ ሲፈፀም በሆዷ ሲመክት
ሰገደ ለአምላኩ የእስራኤል ወጥንስ

VERSE 5
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 6
ጀምረ ስብከቱን ገና ሳይወለድ
ተፈጥሮ አይቻለን ነብዩን ማገድ
አፉ ተከፈተ በታላቅ ምስጋና
በእናቱ ማህፀን ድምፁን አሰማና

VERSE 7
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 8
የዮሐንስ እናት ኤልሳቤጥ ገረማት
ልጇ በማህፀን ቅኔ ሲቀኝባት
ድምጿን ከፍ አደረገች አለም እንዲሰማ
በእውነት መንፈስ ቅዱስ ለምዝሙር ለዜማ

VERSE 9
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው

VERSE 10
የዮሐንስ እናት ኤልሳቤጥ ገረማት
ልጇ በማህፀን ቅኔ ሲቀኝባት
ድምጿን ከፍ አደረገች ሃገር እንዲሰማ
በእውነት መንፈስ ቅዱስ ለምዝሙር ለዜማ

VERSE 11
በማኅፀንሽ ቀን እኔ ለማርያም ተሰማ
በተራራማ አገር በኤፍሬም ከተማ
ዮሐንስ ይናገር በረሃ ያደገው
ድንግል ስትናገር ምን እንዳዘለለው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

VERSE 1
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

VERSE 2
Yeenatu mahts’en yeegre risto nech
Dingil yeamlak enat fitu silegobech
Beheset zelele zemere bedesta
Kedngl siwet’a let’aqa selamta

VERSE 3
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

VERSE 4
Bedngl mahts’en silaye getawn
Kemeweled qedmo sema new mezmurun
Tinbitu sifets’em behodwa simekt
Segede leamlaku yeesrael wet’ns

VERSE 5
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

VERSE 6
Jemre sibketun gena sayweled
Tefet’ro aychalen nebyun maged
Afu tekefete betalaq misgana
Beenatu mahts’en dimts’un asemana

VERSE 7
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

VERSE 8
Yeyohens enat elsabet’ geremat
Lijwa bemahts’en qine siqegnbat
Dimts’wan kef aderegech alem endisema
Beewnet menfes Kidus lemzmur lezema

VERSE 9
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew

VERSE 10
Yeyohens enat elsabet’ geremat
Lijwa bemahts’en qine siqegnbat
Dimts’wan kef aderegech hager endisema
Beewnet menfes Kidus lemzmur lezema

VERSE 11
Bemahts’ensh qen ene leMaryam tesema
Beterarama ager beefrem ketema
Yohens yinager bereha yadegew
Dingil sitnager min endazelelew'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yohanis-yinager', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yohans Mohammed (yohans-mohammed)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ተይዘን በበደለን ተራቁተን በፊቱ
የጠላት መከራ ፀንቶብን ግዞቱ
ተሰምቶ ፀባኦት ጭንቀት ድምፀታችን
ተወለደ ኢየሱስ አዳኝ ንጉሣችን

VERSE 1
የፀድቅ ባለቤት ከበደል ገላጋይ
ረዥሙ ፈትል ወረደ ከሰማይ
ተጠቅልሎ በጨረቅ አቀፈችው ድንግል
ምድር አስተጋባች በእልልታ በመዝሙር

CHORUS
ተይዘን በበደለን ተራቁተን በፊቱ
የጠላት መከራ ፀንቶብን ግዞቱ
ተሰምቶ ፀባኦት ጭንቀት ድምፀታችን
ተወለደ ኢየሱስ አዳኝ ንጉሣችን

VERSE 2
ያጥፍ ዘንድ ቃሉን መች ሆነና እንደሰው
ከዲኑን ሊፈፅም ተገልጧል በጊዜው
ምድር እና ሰማይ በአንድ ላይ ዘመሩ
ሰውና መላክት ተቀኙ ለክብሩ

CHORUS
ተይዘን በበደለን ተራቁተን በፊቱ
የጠላት መከራ ፀንቶብን ግዞቱ
ተሰምቶ ፀባኦት ጭንቀት ድምፀታችን
ተወለደ ኢየሱስ አዳኝ ንጉሣችን

VERSE 3
ዜማችን ሊቀየር ለቅሷችን ሊያበቃ
እረፍት ሊሆነን የሰላም አለቃ
መፍትሔ የሀዘን ምስጢር የደስታ
መሲሁ ተወልዷል የፍጥረት እፎይታ

CHORUS
ተይዘን በበደለን ተራቁተን በፊቱ
የጠላት መከራ ፀንቶብን ግዞቱ
ተሰምቶ ፀባኦት ጭንቀት ድምፀታችን
ተወለደ ኢየሱስ አዳኝ ንጉሣችን

VERSE 4
አዳኝ ንጉሣችን
ውበት ድምቀታችን
መታያ ጌጣችን
ክብር ማዕረጋችን

CHORUS
ተይዘን በበደለን ተራቁተን በፊቱ
የጠላት መከራ ፀንቶብን ግዞቱ
ተሰምቶ ፀባኦት ጭንቀት ድምፀታችን
ተወለደ ኢየሱስ አዳኝ ንጉሣችን

VERSE 5
ሰላም ፍሰሀችን
መሲህ አዳኛችን

CHORUS
ተይዘን በበደለን ተራቁተን በፊቱ
የጠላት መከራ ፀንቶብን ግዞቱ
ተሰምቶ ፀባኦት ጭንቀት ድምፀታችን
ተወለደ ኢየሱስ አዳኝ ንጉሣችን',
      lyrics_transliteration = 'CHORUS
Teyzen bebedelen teraquten befitu
Yet’elat mekera ts’entobn gizotu
Tesemto ts’ebaot ch’nqet dimts’etachn
Tewelede Iyesus adagn nigusachn

VERSE 1
Yets’edq balebet kebedel gelagay
Rezhmu fetl werede kesemay
Tet’eqllo bech’ereq aqefechw Dingil
Midr astegabach beellta bemezmur

CHORUS
Teyzen bebedelen teraquten befitu
Yet’elat mekera ts’entobn gizotu
Tesemto ts’ebaot ch’nqet dimts’etachn
Tewelede Iyesus adagn nigusachn

VERSE 2
Yat’f zend qalun mech honena endesew
Kedinun lifets’m tegelt’wal begizew
Midr ena semay beand lay zemeru
Sewna melakt teqegnu lekbru

CHORUS
Teyzen bebedelen teraquten befitu
Yet’elat mekera ts’entobn gizotu
Tesemto ts’ebaot ch’nqet dimts’etachn
Tewelede Iyesus adagn nigusachn

VERSE 3
Zemachn liqeyer leqswachn liyabeqa
Ereft lihonen yeselam aleqa
Mefthe yehezen mist’ir yedesta
Mesihu teweldwal yeft’ret efoyta

CHORUS
Teyzen bebedelen teraquten befitu
Yet’elat mekera ts’entobn gizotu
Tesemto ts’ebaot ch’nqet dimts’etachn
Tewelede Iyesus adagn nigusachn

VERSE 4
Adagn nigusachn
Wibet dimqetachn
Metaya get’achn
Kibir maeregachn

CHORUS
Teyzen bebedelen teraquten befitu
Yet’elat mekera ts’entobn gizotu
Tesemto ts’ebaot ch’nqet dimts’etachn
Tewelede Iyesus adagn nigusachn

VERSE 5
Selam fisehechn
Mesih adagnachn

CHORUS
Teyzen bebedelen teraquten befitu
Yet’elat mekera ts’entobn gizotu
Tesemto ts’ebaot ch’nqet dimts’etachn
Tewelede Iyesus adagn nigusachn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yohans-mohammed'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ተይዘን በበደለን ተራቁተን በፊቱ
የጠላት መከራ ፀንቶብን ግዞቱ
ተሰምቶ ፀባኦት ጭንቀት ድምፀታችን
ተወለደ ኢየሱስ አዳኝ ንጉሣችን

VERSE 1
የፀድቅ ባለቤት ከበደል ገላጋይ
ረዥሙ ፈትል ወረደ ከሰማይ
ተጠቅልሎ በጨረቅ አቀፈችው ድንግል
ምድር አስተጋባች በእልልታ በመዝሙር

VERSE 2
ያጥፍ ዘንድ ቃሉን መች ሆነና እንደሰው
ከዲኑን ሊፈፅም ተገልጧል በጊዜው
ምድር እና ሰማይ በአንድ ላይ ዘመሩ
ሰውና መላክት ተቀኙ ለክብሩ

VERSE 3
ዜማችን ሊቀየር ለቅሷችን ሊያበቃ
እረፍት ሊሆነን የሰላም አለቃ
መፍትሔ የሀዘን ምስጢር የደስታ
መሲሁ ተወልዷል የፍጥረት እፎይታ

VERSE 4
አዳኝ ንጉሣችን
ውበት ድምቀታችን
መታያ ጌጣችን
ክብር ማዕረጋችን

VERSE 5
ሰላም ፍሰሀችን
መሲህ አዳኛችን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Teyzen bebedelen teraquten befitu
Yet’elat mekera ts’entobn gizotu
Tesemto ts’ebaot ch’nqet dimts’etachn
Tewelede Iyesus adagn nigusachn

VERSE 1
Yets’edq balebet kebedel gelagay
Rezhmu fetl werede kesemay
Tet’eqllo bech’ereq aqefechw Dingil
Midr astegabach beellta bemezmur

VERSE 2
Yat’f zend qalun mech honena endesew
Kedinun lifets’m tegelt’wal begizew
Midr ena semay beand lay zemeru
Sewna melakt teqegnu lekbru

VERSE 3
Zemachn liqeyer leqswachn liyabeqa
Ereft lihonen yeselam aleqa
Mefthe yehezen mist’ir yedesta
Mesihu teweldwal yeft’ret efoyta

VERSE 4
Adagn nigusachn
Wibet dimqetachn
Metaya get’achn
Kibir maeregachn

VERSE 5
Selam fisehechn
Mesih adagnachn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yohans-mohammed', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yom Fiseha Kone (yom-fiseha-kone)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ዮም ፍስሃ ኮነ በእንተ ልደታ ለማርያም
ፍስሃ ኮነ በእንተ ልደታ ለማርያም

VERSE 1
በባርነት ሳለን ፍስሃ ኮነ
ኃጢአት በዓለም ነግሳ ፍስሃ ኮነ
በድንግል መወለድ ፍስሃ ኮነ
ቀረልን አበሳ ፍስሃ ኮነ

CHORUS
ዮም ፍስሃ ኮነ በእንተ ልደታ ለማርያም
ፍስሃ ኮነ በእንተ ልደታ ለማርያም

VERSE 2
እግዚአብሔር መረጠሽ ፍስሃ ኮነ
ልትሆኚው እናቱ ፍስሃ ኮነ
ይኸው ተፈጸመ ፍስሃ ኮነ
የዳዊት ትንቢቱ ፍስሃ ኮነ

CHORUS
ዮም ፍስሃ ኮነ በእንተ ልደታ ለማርያም
ፍስሃ ኮነ በእንተ ልደታ ለማርያም

VERSE 3
ዮም ፍስሃ ኮነ በእንተ ልደታ ለማርያም
ፍስሃ ኮነ በእንተ ልደታ ለማርያም

CHORUS
ዮም ፍስሃ ኮነ በእንተ ልደታ ለማርያም
ፍስሃ ኮነ በእንተ ልደታ ለማርያም

VERSE 4
የሔዋን ተስፋዋ ፍስሃ ኮነ
የአዳም ሕይወት ፍስሃ ኮነ
የኢያቄም የሐና ፍስሃ ኮነ
ፍሬ በረከት ፍስሃ ኮነ

CHORUS
ዮም ፍስሃ ኮነ በእንተ ልደታ ለማርያም
ፍስሃ ኮነ በእንተ ልደታ ለማርያም

VERSE 5
ምክንያተ ድኅነት ፍስሃ ኮነ
ኪዳን ምሕረት ፍስሃ ኮነ
ድንግል ተወለደች ፍስሃ ኮነ
የአምላክ እናት ፍስሃ ኮነ

CHORUS
ዮም ፍስሃ ኮነ በእንተ ልደታ ለማርያም
ፍስሃ ኮነ በእንተ ልደታ ለማርያም

VERSE 6
ዮም ፍስሃ ኮነ በእንተ ልደታ ለማርያም
ፍስሃ ኮነ በእንተ ልደታ ለማርያም

CHORUS
ዮም ፍስሃ ኮነ በእንተ ልደታ ለማርያም
ፍስሃ ኮነ በእንተ ልደታ ለማርያም

VERSE 7
በሔዋን ምክንያት ፍስሃ ኮነ
የአጣነውን ሰላም ፍስሃ ኮነ
ዛሬ አገኘነው ፍስሃ ኮነ
በድንግል ማርያም ፍስሃ ኮነ

CHORUS
ዮም ፍስሃ ኮነ በእንተ ልደታ ለማርያም
ፍስሃ ኮነ በእንተ ልደታ ለማርያም

VERSE 8
የምሥራች እንበል ፍስሃ ኮነ
ሐዘናችን ይጥፋ ፍስሃ ኮነ
ተወልዳለችና ፍስሃ ኮነ
የዓለም ሁሉ ተስፋ ፍስሃ ኮነ

CHORUS
ዮም ፍስሃ ኮነ በእንተ ልደታ ለማርያም
ፍስሃ ኮነ በእንተ ልደታ ለማርያም

VERSE 9
ዮም ፍስሃ ኮነ በእንተ ልደታ ለማርያም
ፍስሃ ኮነ በእንተ ልደታ ለማርያም

CHORUS
ዮም ፍስሃ ኮነ በእንተ ልደታ ለማርያም
ፍስሃ ኮነ በእንተ ልደታ ለማርያም',
      lyrics_transliteration = 'CHORUS
Yom fiseha kone be-ente lideta le-Mariam
Fiseha kone be-ente lideta le-Mariam
Bebarinet salen fiseha kone
Hatiyat be-alem negisa fiseha kone

VERSE 1
Be-Dingil meweled fiseha kone
Qerelin abesa fiseha kone
Igziabher meretesh fiseha kone

CHORUS
Yom fiseha kone be-ente lideta le-Mariam
Fiseha kone be-ente lideta le-Mariam
Bebarinet salen fiseha kone
Hatiyat be-alem negisa fiseha kone

VERSE 2
Litihonyew inatu fiseha kone
Yihew tefetseme fiseha kone
Ye-Dawit tinbitu fiseha kone

CHORUS
Yom fiseha kone be-ente lideta le-Mariam
Fiseha kone be-ente lideta le-Mariam
Bebarinet salen fiseha kone
Hatiyat be-alem negisa fiseha kone

VERSE 3
Yom fiseha kone be-ente lideta le-Mariam
Fiseha kone be-ente lideta le-Mariam
Ye-Hewan tesfawa fiseha kone

CHORUS
Yom fiseha kone be-ente lideta le-Mariam
Fiseha kone be-ente lideta le-Mariam
Bebarinet salen fiseha kone
Hatiyat be-alem negisa fiseha kone

VERSE 4
Yadam hiyiwet fiseha kone
Ye-Iyaqem ye-Hanna fiseha kone
Fire bereket fiseha kone

CHORUS
Yom fiseha kone be-ente lideta le-Mariam
Fiseha kone be-ente lideta le-Mariam
Bebarinet salen fiseha kone
Hatiyat be-alem negisa fiseha kone

VERSE 5
Mikniyate dihnit fiseha kone
Kidan mihret fiseha kone
Dingil teweledech fiseha kone
Ye-Amlak innat fiseha kone

CHORUS
Yom fiseha kone be-ente lideta le-Mariam
Fiseha kone be-ente lideta le-Mariam
Bebarinet salen fiseha kone
Hatiyat be-alem negisa fiseha kone

VERSE 6
Yom fiseha kone be-ente lideta le-Mariam
Fiseha kone be-ente lideta le-Mariam
Be-Hewan mikniyat fiseha kone

CHORUS
Yom fiseha kone be-ente lideta le-Mariam
Fiseha kone be-ente lideta le-Mariam
Bebarinet salen fiseha kone
Hatiyat be-alem negisa fiseha kone

VERSE 7
Yatanewin selam fiseha kone
Zare agenyenew fiseha kone
Be-Dingil Mariyam fiseha kone

CHORUS
Yom fiseha kone be-ente lideta le-Mariam
Fiseha kone be-ente lideta le-Mariam
Bebarinet salen fiseha kone
Hatiyat be-alem negisa fiseha kone

VERSE 8
Yemisrach inibel fiseha kone
Hazenachin yitfa fiseha kone
Tewelidalechina fiseha kone

CHORUS
Yom fiseha kone be-ente lideta le-Mariam
Fiseha kone be-ente lideta le-Mariam
Bebarinet salen fiseha kone
Hatiyat be-alem negisa fiseha kone

VERSE 9
Ye-alem hulu tesifa fiseha kone
Yom fiseha kone be-ente lideta le-Mariam
Fiseha kone be-ente lideta le-Mariam

CHORUS
Yom fiseha kone be-ente lideta le-Mariam
Fiseha kone be-ente lideta le-Mariam
Bebarinet salen fiseha kone
Hatiyat be-alem negisa fiseha kone',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yom-fiseha-kone'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ዮም ፍስሃ ኮነ በእንተ ልደታ ለማርያም
ፍስሃ ኮነ በእንተ ልደታ ለማርያም

VERSE 1
በባርነት ሳለን ፍስሃ ኮነ
ኃጢአት በዓለም ነግሳ ፍስሃ ኮነ
በድንግል መወለድ ፍስሃ ኮነ
ቀረልን አበሳ ፍስሃ ኮነ

VERSE 2
እግዚአብሔር መረጠሽ ፍስሃ ኮነ
ልትሆኚው እናቱ ፍስሃ ኮነ
ይኸው ተፈጸመ ፍስሃ ኮነ
የዳዊት ትንቢቱ ፍስሃ ኮነ

VERSE 3
ዮም ፍስሃ ኮነ በእንተ ልደታ ለማርያም
ፍስሃ ኮነ በእንተ ልደታ ለማርያም

VERSE 4
የሔዋን ተስፋዋ ፍስሃ ኮነ
የአዳም ሕይወት ፍስሃ ኮነ
የኢያቄም የሐና ፍስሃ ኮነ
ፍሬ በረከት ፍስሃ ኮነ

VERSE 5
ምክንያተ ድኅነት ፍስሃ ኮነ
ኪዳን ምሕረት ፍስሃ ኮነ
ድንግል ተወለደች ፍስሃ ኮነ
የአምላክ እናት ፍስሃ ኮነ

VERSE 6
ዮም ፍስሃ ኮነ በእንተ ልደታ ለማርያም
ፍስሃ ኮነ በእንተ ልደታ ለማርያም

VERSE 7
በሔዋን ምክንያት ፍስሃ ኮነ
የአጣነውን ሰላም ፍስሃ ኮነ
ዛሬ አገኘነው ፍስሃ ኮነ
በድንግል ማርያም ፍስሃ ኮነ

VERSE 8
የምሥራች እንበል ፍስሃ ኮነ
ሐዘናችን ይጥፋ ፍስሃ ኮነ
ተወልዳለችና ፍስሃ ኮነ
የዓለም ሁሉ ተስፋ ፍስሃ ኮነ

VERSE 9
ዮም ፍስሃ ኮነ በእንተ ልደታ ለማርያም
ፍስሃ ኮነ በእንተ ልደታ ለማርያም'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yom fiseha kone be-ente lideta le-Mariam
Fiseha kone be-ente lideta le-Mariam
Bebarinet salen fiseha kone
Hatiyat be-alem negisa fiseha kone

VERSE 1
Be-Dingil meweled fiseha kone
Qerelin abesa fiseha kone
Igziabher meretesh fiseha kone

VERSE 2
Litihonyew inatu fiseha kone
Yihew tefetseme fiseha kone
Ye-Dawit tinbitu fiseha kone

VERSE 3
Yom fiseha kone be-ente lideta le-Mariam
Fiseha kone be-ente lideta le-Mariam
Ye-Hewan tesfawa fiseha kone

VERSE 4
Yadam hiyiwet fiseha kone
Ye-Iyaqem ye-Hanna fiseha kone
Fire bereket fiseha kone

VERSE 5
Mikniyate dihnit fiseha kone
Kidan mihret fiseha kone
Dingil teweledech fiseha kone
Ye-Amlak innat fiseha kone

VERSE 6
Yom fiseha kone be-ente lideta le-Mariam
Fiseha kone be-ente lideta le-Mariam
Be-Hewan mikniyat fiseha kone

VERSE 7
Yatanewin selam fiseha kone
Zare agenyenew fiseha kone
Be-Dingil Mariyam fiseha kone

VERSE 8
Yemisrach inibel fiseha kone
Hazenachin yitfa fiseha kone
Tewelidalechina fiseha kone

VERSE 9
Ye-alem hulu tesifa fiseha kone
Yom fiseha kone be-ente lideta le-Mariam
Fiseha kone be-ente lideta le-Mariam'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yom-fiseha-kone', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yom Fisha Kone (yom-fisha-kone)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ዮም ፍስሐ ኮነ ሰንበተ ክርስቲያን
እስመ ትንስአ ክርስቶስ እሙታን (2)
ቀደሣ ወአክበራ (2) ወዓልዓላ
እምኩሎን መዋዕል (2)

VERSE 1
ዮም ፍስሐ ኮነ ሰንበተ ክርስቲያን
እስመ ትንስአ ክርስቶስ እሙታን (2)
ቀደሣ ወአክበራ (2) ወዓልዓላ
እምኩሎን መዋዕል (2)

CHORUS
ዮም ፍስሐ ኮነ ሰንበተ ክርስቲያን
እስመ ትንስአ ክርስቶስ እሙታን (2)
ቀደሣ ወአክበራ (2) ወዓልዓላ
እምኩሎን መዋዕል (2)',
      lyrics_transliteration = 'CHORUS
Yom fisha kone senbete kristian
Esme yensea Christos emutan (2)
Qedesa weakbera (2) wealala
emkulun mewael (2)

VERSE 1
Yom fisha kone senbete kristian
Esme yensea Christos emutan (2)
Qedesa weakbera (2) wealala
emkulun mewael (2)

CHORUS
Yom fisha kone senbete kristian
Esme yensea Christos emutan (2)
Qedesa weakbera (2) wealala
emkulun mewael (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yom-fisha-kone'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ዮም ፍስሐ ኮነ ሰንበተ ክርስቲያን
እስመ ትንስአ ክርስቶስ እሙታን (2)
ቀደሣ ወአክበራ (2) ወዓልዓላ
እምኩሎን መዋዕል (2)

VERSE 1
ዮም ፍስሐ ኮነ ሰንበተ ክርስቲያን
እስመ ትንስአ ክርስቶስ እሙታን (2)
ቀደሣ ወአክበራ (2) ወዓልዓላ
እምኩሎን መዋዕል (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yom fisha kone senbete kristian
Esme yensea Christos emutan (2)
Qedesa weakbera (2) wealala
emkulun mewael (2)

VERSE 1
Yom fisha kone senbete kristian
Esme yensea Christos emutan (2)
Qedesa weakbera (2) wealala
emkulun mewael (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yom-fisha-kone', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yom Fisiha Kone (yom-fisiha-kone)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 1
ቅዱስ ያሬድ ፣ ሉቃ. 2:10
የያዕቆብ ኮከብ ፍስሐ ኮነ
የዳዊት ሆድ ፍሬ ፍስሐ ኮነ
የአብርሃም ተስፋ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 2
ተፈጸመ ዛሬ ፍስሐ ኮነ
የሰው ልጆች ሁሉ ፍስሐ ኮነ
በአንድነት ተነሡ ፍስሐ ኮነ
መድኃኒት ተወልዶአል ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 3
እልል በሉ ለእሱ ፍስሐ ኮነ
ዘኁ. 24:17 ፤ መዝ. 131:11
አንቺ ቤተልሔም ፍስሐ ኮነ
የዳዊት ከተማ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 4
ተንቀሽ አትቀሪም ፍስሐ ኮነ
ተብለሽ ባድማ ፍስሐ ኮነ
የብርሃን ድንኳን ፍስሐ ኮነ
ባንቺ ተተከለ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 5
ጎዳናሽ አበራ ፍስሐ ኮነ
ሰማይን መሰለ ፍስሐ ኮነ
ሚክ. 5:2 ፤ አርጋኖን ዘሰኑይ
እረኞች ሆይ ስሙ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 6
ተአምር ልንገራችሁ ፍስሐ ኮነ
ቤተ ልሔም ሒዱ ፍስሐ ኮነ
በጎቹን ትታችሁ ፍስሐ ኮነ
በፍጥነት ገስግሡ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 7
ማንም ሳይቀድማችሁ ፍስሐ ኮነ
ለዓለም የሚበቃ ፍስሐ ኮነ
በግ ታገኛላችሁ ፍስሐ ኮነ
ሉቃ. 2:12 ፤ ዮሐ. 1:36

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 8
ድንቅ መካር ኃያል ፍስሐ ኮነ
የሰላም አለቃ ፍስሐ ኮነ
ተወልዶ ሲገለጥ ፍስሐ ኮነ
ዕንባችን አበቃ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 9
የእኛ መድኃኔዓለም ፍስሐ ኮነ
የእኛ ንጉሥ ፍስሐ ኮነ
ተወልደህ ወለድኸን ፍስሐ ኮነ
ስምህ ይቀደስ ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 10
ኢሳ. 9:6 ፤ ማቴ. 9
መላእክት ዘመሩ ፍስሐ ኮነ
ሔሮድስ ተጨነቀ ፍስሐ ኮነ
አህያ ገዢውን ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 11
አምላኩን አወቀ ፍስሐ ኮነ
ኮከብ መንገድ መራ ፍስሐ ኮነ
ነገሥታት ሰገዱ ፍስሐ ኮነ
የዚህ ድንቅ ሕፃን ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 12
ልዩ ነው መንገዱ ፍስሐ ኮነ
ማቴ. 2:3 ፤ ኢሳ. 1:3
እሳት ተሸክማ ፍስሐ ኮነ
እሳት የወለደች ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 13
እሳትን ታቅፋ ፍስሐ ኮነ
እሳት ያሳደገች ፍስሐ ኮነ
ዕፀ ጳጦስ ሆና ፍስሐ ኮነ
በሲና ያያት ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 14
አምላክን የቻለች ፍስሐ ኮነ
ድንግል ማርያም ናት ፍስሐ ኮነ

CHORUS
ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን',
      lyrics_transliteration = 'CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 1
Kidus yared , luqa. 2:10
Yeyaeqob kokeb fishe kone
Yedawit hod fire fishe kone
Yeabrham tesfa fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 2
Tefets’eme zare fishe kone
Yesew lijoch hulu fishe kone
Beandnet tenesu fishe kone
Medhanit teweldoal fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 3
Ell belu leesu fishe kone
Zehu. 24:17 ; mez. 131:11
Anchi betelhem fishe kone
Yedawit ketema fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 4
Tenqesh atqerim fishe kone
Teblesh badma fishe kone
Yebrhan dinkwan fishe kone
Banchi tetekele fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 5
Godanash abera fishe kone
Semayn mesele fishe kone
Mik. 5:2 ; arganon zesenuy
Eregnoch hoy simu fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 6
Teamr lingerachhu fishe kone
Bete lihem hidu fishe kone
Begochun titachhu fishe kone
Beft’net gesgsu fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 7
Manm sayqedmachhu fishe kone
Lealem yemibeqa fishe kone
Beg tagegnalachhu fishe kone
Luqa. 2:12 ; yohe. 1:36

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 8
Dinq mekar hayal fishe kone
Yeselam aleqa fishe kone
Teweldo sigelet’ fishe kone
Enbachn abeqa fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 9
Yeegna Medhanealem fishe kone
Yeegna nigus fishe kone
Teweldeh weledኸn fishe kone
Simh yiqedes fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 10
Isa. 9:6 ; mate. 9
Melaekt zemeru fishe kone
Herods tech’eneqe fishe kone
Ahya gezhiwn fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 11
Amlakun aweqe fishe kone
Kokeb menged mera fishe kone
Negestat segedu fishe kone
Yezih dinq hits’an fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 12
Liyu new mengedu fishe kone
Mate. 2:3 ; isa. 1:3
Esat teshekma fishe kone
Esat yeweledech fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 13
Esatn taqfa fishe kone
Esat yasadegech fishe kone
Ets’e p’at’os hona fishe kone
Besina yayat fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 14
Amlakn yechalech fishe kone
Dingil Maryam nat fishe kone

CHORUS
Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yom-fisiha-kone'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ዮም ፍስሐ ኮነ ፍስሐ ኮነ
በእንተ ልደቱ ለመድኃኒነ
ዛሬ ሆነ ደስታችን ሆነ ደስታችን
ተወልዶአልና መድኃኒታችን

VERSE 1
ቅዱስ ያሬድ ፣ ሉቃ. 2:10
የያዕቆብ ኮከብ ፍስሐ ኮነ
የዳዊት ሆድ ፍሬ ፍስሐ ኮነ
የአብርሃም ተስፋ ፍስሐ ኮነ

VERSE 2
ተፈጸመ ዛሬ ፍስሐ ኮነ
የሰው ልጆች ሁሉ ፍስሐ ኮነ
በአንድነት ተነሡ ፍስሐ ኮነ
መድኃኒት ተወልዶአል ፍስሐ ኮነ

VERSE 3
እልል በሉ ለእሱ ፍስሐ ኮነ
ዘኁ. 24:17 ፤ መዝ. 131:11
አንቺ ቤተልሔም ፍስሐ ኮነ
የዳዊት ከተማ ፍስሐ ኮነ

VERSE 4
ተንቀሽ አትቀሪም ፍስሐ ኮነ
ተብለሽ ባድማ ፍስሐ ኮነ
የብርሃን ድንኳን ፍስሐ ኮነ
ባንቺ ተተከለ ፍስሐ ኮነ

VERSE 5
ጎዳናሽ አበራ ፍስሐ ኮነ
ሰማይን መሰለ ፍስሐ ኮነ
ሚክ. 5:2 ፤ አርጋኖን ዘሰኑይ
እረኞች ሆይ ስሙ ፍስሐ ኮነ

VERSE 6
ተአምር ልንገራችሁ ፍስሐ ኮነ
ቤተ ልሔም ሒዱ ፍስሐ ኮነ
በጎቹን ትታችሁ ፍስሐ ኮነ
በፍጥነት ገስግሡ ፍስሐ ኮነ

VERSE 7
ማንም ሳይቀድማችሁ ፍስሐ ኮነ
ለዓለም የሚበቃ ፍስሐ ኮነ
በግ ታገኛላችሁ ፍስሐ ኮነ
ሉቃ. 2:12 ፤ ዮሐ. 1:36

VERSE 8
ድንቅ መካር ኃያል ፍስሐ ኮነ
የሰላም አለቃ ፍስሐ ኮነ
ተወልዶ ሲገለጥ ፍስሐ ኮነ
ዕንባችን አበቃ ፍስሐ ኮነ

VERSE 9
የእኛ መድኃኔዓለም ፍስሐ ኮነ
የእኛ ንጉሥ ፍስሐ ኮነ
ተወልደህ ወለድኸን ፍስሐ ኮነ
ስምህ ይቀደስ ፍስሐ ኮነ

VERSE 10
ኢሳ. 9:6 ፤ ማቴ. 9
መላእክት ዘመሩ ፍስሐ ኮነ
ሔሮድስ ተጨነቀ ፍስሐ ኮነ
አህያ ገዢውን ፍስሐ ኮነ

VERSE 11
አምላኩን አወቀ ፍስሐ ኮነ
ኮከብ መንገድ መራ ፍስሐ ኮነ
ነገሥታት ሰገዱ ፍስሐ ኮነ
የዚህ ድንቅ ሕፃን ፍስሐ ኮነ

VERSE 12
ልዩ ነው መንገዱ ፍስሐ ኮነ
ማቴ. 2:3 ፤ ኢሳ. 1:3
እሳት ተሸክማ ፍስሐ ኮነ
እሳት የወለደች ፍስሐ ኮነ

VERSE 13
እሳትን ታቅፋ ፍስሐ ኮነ
እሳት ያሳደገች ፍስሐ ኮነ
ዕፀ ጳጦስ ሆና ፍስሐ ኮነ
በሲና ያያት ፍስሐ ኮነ

VERSE 14
አምላክን የቻለች ፍስሐ ኮነ
ድንግል ማርያም ናት ፍስሐ ኮነ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yom fishe kone fishe kone
Beente lidetu lemedhanine
Zare hone destachn hone destachn
Teweldoalna medhanitachn

VERSE 1
Kidus yared , luqa. 2:10
Yeyaeqob kokeb fishe kone
Yedawit hod fire fishe kone
Yeabrham tesfa fishe kone

VERSE 2
Tefets’eme zare fishe kone
Yesew lijoch hulu fishe kone
Beandnet tenesu fishe kone
Medhanit teweldoal fishe kone

VERSE 3
Ell belu leesu fishe kone
Zehu. 24:17 ; mez. 131:11
Anchi betelhem fishe kone
Yedawit ketema fishe kone

VERSE 4
Tenqesh atqerim fishe kone
Teblesh badma fishe kone
Yebrhan dinkwan fishe kone
Banchi tetekele fishe kone

VERSE 5
Godanash abera fishe kone
Semayn mesele fishe kone
Mik. 5:2 ; arganon zesenuy
Eregnoch hoy simu fishe kone

VERSE 6
Teamr lingerachhu fishe kone
Bete lihem hidu fishe kone
Begochun titachhu fishe kone
Beft’net gesgsu fishe kone

VERSE 7
Manm sayqedmachhu fishe kone
Lealem yemibeqa fishe kone
Beg tagegnalachhu fishe kone
Luqa. 2:12 ; yohe. 1:36

VERSE 8
Dinq mekar hayal fishe kone
Yeselam aleqa fishe kone
Teweldo sigelet’ fishe kone
Enbachn abeqa fishe kone

VERSE 9
Yeegna Medhanealem fishe kone
Yeegna nigus fishe kone
Teweldeh weledኸn fishe kone
Simh yiqedes fishe kone

VERSE 10
Isa. 9:6 ; mate. 9
Melaekt zemeru fishe kone
Herods tech’eneqe fishe kone
Ahya gezhiwn fishe kone

VERSE 11
Amlakun aweqe fishe kone
Kokeb menged mera fishe kone
Negestat segedu fishe kone
Yezih dinq hits’an fishe kone

VERSE 12
Liyu new mengedu fishe kone
Mate. 2:3 ; isa. 1:3
Esat teshekma fishe kone
Esat yeweledech fishe kone

VERSE 13
Esatn taqfa fishe kone
Esat yasadegech fishe kone
Ets’e p’at’os hona fishe kone
Besina yayat fishe kone

VERSE 14
Amlakn yechalech fishe kone
Dingil Maryam nat fishe kone'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yom-fisiha-kone', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yom Semayawi (yom-semayawi)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ዮም ሰማያዊ በጎል ሰከበ
ለዘተወልደ እም ቅድስት ድንግል
ርእይዎ ኖሎት (2)
አእኰትዎ መላዕክት (2)

VERSE 1
ዛሬ ሰማያዊው በበረት ተኛ
የተወለደው ከቅድስት ድንግል
እረኞች አዩት (2)
አመሰገኑት መላዕክት (2)

CHORUS
ዮም ሰማያዊ በጎል ሰከበ
ለዘተወልደ እም ቅድስት ድንግል
ርእይዎ ኖሎት (2)
አእኰትዎ መላዕክት (2)',
      lyrics_transliteration = 'CHORUS
Yom semayawi begol sekebe
Lezetewelde em Kidist Dingil
Rieywo nolot (2)
Aekwetwo melaekt (2)

VERSE 1
Zare semayawiw beberet tegna
Yeteweledew keqdst Dingil
Eregnoch ayut (2)
Amesegenut melaekt (2)

CHORUS
Yom semayawi begol sekebe
Lezetewelde em Kidist Dingil
Rieywo nolot (2)
Aekwetwo melaekt (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yom-semayawi'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ዮም ሰማያዊ በጎል ሰከበ
ለዘተወልደ እም ቅድስት ድንግል
ርእይዎ ኖሎት (2)
አእኰትዎ መላዕክት (2)

VERSE 1
ዛሬ ሰማያዊው በበረት ተኛ
የተወለደው ከቅድስት ድንግል
እረኞች አዩት (2)
አመሰገኑት መላዕክት (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yom semayawi begol sekebe
Lezetewelde em Kidist Dingil
Rieywo nolot (2)
Aekwetwo melaekt (2)

VERSE 1
Zare semayawiw beberet tegna
Yeteweledew keqdst Dingil
Eregnoch ayut (2)
Amesegenut melaekt (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yom-semayawi', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Yomse Le’iliyaye (yomse-leiliyaye)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ዮምሰ ለእሊአየ (፪)
አበርህ በመስቀልየ (፬)

VERSE 1
ዮምሰ ለእሊአየ (፪)
አበርህ በመስቀልየ (፬)

CHORUS
ዮምሰ ለእሊአየ (፪)
አበርህ በመስቀልየ (፬)',
      lyrics_transliteration = 'CHORUS
Yomse le’iliyaye (2)
Aberih bemeskeliye (4)

VERSE 1
Yomse le’iliyaye (2)
Aberih bemeskeliye (4)

CHORUS
Yomse le’iliyaye (2)
Aberih bemeskeliye (4)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'yomse-leiliyaye'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ዮምሰ ለእሊአየ (፪)
አበርህ በመስቀልየ (፬)

VERSE 1
ዮምሰ ለእሊአየ (፪)
አበርህ በመስቀልየ (፬)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yomse le’iliyaye (2)
Aberih bemeskeliye (4)

VERSE 1
Yomse le’iliyaye (2)
Aberih bemeskeliye (4)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'yomse-leiliyaye', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: You Are Without Fault (you-are-without-fault)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
አልብኪ ነውር ወኢምንትኒ በላዕሌኪ(x2)
ፃኢ እምሊባኖስ እኅትየ መርዓት(x4)

VERSE 1
አልብኪ ነውር ወኢምንትኒ በላዕሌኪ(x2)
ፃኢ እምሊባኖስ እኅትየ መርዓት(x4)

CHORUS
አልብኪ ነውር ወኢምንትኒ በላዕሌኪ(x2)
ፃኢ እምሊባኖስ እኅትየ መርዓት(x4)',
      lyrics_transliteration = 'CHORUS
Albeki newer weementeni bela’elaeki
Tsaee imlebanos ehitiye merat

VERSE 1
Albeki newer weementeni bela’elaeki
Tsaee imlebanos ehitiye merat

CHORUS
Albeki newer weementeni bela’elaeki
Tsaee imlebanos ehitiye merat',
      lyrics_english = 'You are without fault also you have no blemish upon you (x2)
Come forth from Lebanon O’ my sister and my bride
Come forth from Lebanon O’ my sister and bride (2)

Albeki newer we’eementeni bela’elaeki (x2)
Tsaee imlebanos ehitiye merat (4)',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'you-are-without-fault'
    AND lyrics_amharic IS NOT DISTINCT FROM 'አልብኪ ነውር ወኢምንትኒ በላዕሌኪ(x2)
ፃኢ እምሊባኖስ እኅትየ መርዓት(x4)

VERSE 1
አልብኪ ነውር ወኢምንትኒ በላዕሌኪ(x2)
ፃኢ እምሊባኖስ እኅትየ መርዓት(x4)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Albeki newer weementeni bela’elaeki
Tsaee imlebanos ehitiye merat

VERSE 1
Albeki newer weementeni bela’elaeki
Tsaee imlebanos ehitiye merat'
    AND lyrics_english IS NOT DISTINCT FROM 'You are without fault also you have no blemish upon you (x2)
Come forth from Lebanon O’ my sister and my bride
Come forth from Lebanon O’ my sister and bride (2)

Albeki newer we’eementeni bela’elaeki (x2)
Tsaee imlebanos ehitiye merat (4)'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'you-are-without-fault', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: You Who Saved From Fire (you-who-saved-from-fire)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'CHORUS
You who saved from fire, Kirkos and his mother
Save us as well /2/ Oh Archangel
Save us as well /2/ Gabriel the archange

VERSE 1
You who saved from fire, Kirkos and his mother
Save us as well /2/ Oh Archangel
Save us as well /2/ Gabriel the archange

CHORUS
You who saved from fire, Kirkos and his mother
Save us as well /2/ Oh Archangel
Save us as well /2/ Gabriel the archange',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'you-who-saved-from-fire'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'You who saved from fire, Kirkos and his mother
Save us as well /2/ Oh Archangel
Save us as well /2/ Gabriel the archange

VERSE 1
You who saved from fire, Kirkos and his mother
Save us as well /2/ Oh Archangel
Save us as well /2/ Gabriel the archange'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'you-who-saved-from-fire', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Your Love Allured Me (your-love-allured-me)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ (2)
እግዚአብሔር ለኔ መድኃኒቴ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ

VERSE 1
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ (2)
እግዚአብሔር ለኔ መድኃኒቴ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ (2)
እግዚአብሔር ለኔ መድኃኒቴ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ',
      lyrics_transliteration = 'CHORUS
Fikrih marekegn behiywete bezemene
Egziabher lene medhanite
Fikrih marekegn behiywete bezemene

VERSE 1
Fikrih marekegn behiywete bezemene
Egziabher lene medhanite
Fikrih marekegn behiywete bezemene

CHORUS
Fikrih marekegn behiywete bezemene
Egziabher lene medhanite
Fikrih marekegn behiywete bezemene',
      lyrics_english = 'CHORUS
Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years

VERSE 1
I have been purchased by Your precious blood
So I may serve You and leave this dark world
Because of Your death I received my life
With Your suffering my burdens have died

CHORUS
Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years

VERSE 2
For Your grace I’ll stand and sing songs for You
Limited I am but still I’ll praise You

CHORUS
Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years

VERSE 3
Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years

CHORUS
Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years

VERSE 4
The heavens and earth out loud they will shout
To honor and praise worship they will sprout
There is none like You and Your righteousness
I will sing to You my hearts offerings

CHORUS
Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years

VERSE 5
My fingers will play the strings of the harp
With psalm day and night they will never stop

CHORUS
Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years

VERSE 6
Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years

CHORUS
Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years

VERSE 7
Scattered they all were when they saw Your grace
For virtue they fell and they all obeyed
Creator of the earth almighty You are
With love You conquer the hearts of us all

CHORUS
Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years

VERSE 8
Supported we are throughout our lives
By You our King with You by our side

CHORUS
Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years

VERSE 9
Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years

CHORUS
Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years

VERSE 10
Fikrih marekegn behiywete bezemene (2)
Egziabher lene medhanite
Fikrih marekegn behiywete bezemene

CHORUS
Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years

VERSE 11
Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years

CHORUS
Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'your-love-allured-me'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ (2)
እግዚአብሔር ለኔ መድኃኒቴ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ

VERSE 1
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ (2)
እግዚአብሔር ለኔ መድኃኒቴ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Fikrih marekegn behiywete bezemene
Egziabher lene medhanite
Fikrih marekegn behiywete bezemene

VERSE 1
Fikrih marekegn behiywete bezemene
Egziabher lene medhanite
Fikrih marekegn behiywete bezemene'
    AND lyrics_english IS NOT DISTINCT FROM 'Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years

VERSE 1
I have been purchased by Your precious blood
So I may serve You and leave this dark world
Because of Your death I received my life
With Your suffering my burdens have died

VERSE 2
For Your grace I’ll stand and sing songs for You
Limited I am but still I’ll praise You

VERSE 3
Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years

VERSE 4
The heavens and earth out loud they will shout
To honor and praise worship they will sprout
There is none like You and Your righteousness
I will sing to You my hearts offerings

VERSE 5
My fingers will play the strings of the harp
With psalm day and night they will never stop

VERSE 6
Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years

VERSE 7
Scattered they all were when they saw Your grace
For virtue they fell and they all obeyed
Creator of the earth almighty You are
With love You conquer the hearts of us all

VERSE 8
Supported we are throughout our lives
By You our King with You by our side

VERSE 9
Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years

VERSE 10
Fikrih marekegn behiywete bezemene (2)
Egziabher lene medhanite
Fikrih marekegn behiywete bezemene

VERSE 11
Your love allured me throughout my life and all my years (2)
God my salvation my medicine
Your love allured me throughout my life and all my years'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'your-love-allured-me', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: You’re the Soul for My Soul (youre-the-soul-for-my-soul)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Lenefese nefeswa nesh, lemengede fana
Endaltefa amnalew, yanchi lij negna',
      lyrics_english = 'CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 1
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 2
Mothers of the righteous, in number they’re many
Before and after Christ, truly they are plenty
But Mary You are one, there is no one like You
You live on for ages, guiding us all to You

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 3
All those who call on you, all who honor your name
All who offer praises, your glory who proclaims
Truly he does profit, and truly does he gain
There is none who loses, there is none put to shame

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 4
Saint Gregory and the, righteous father St John
St Basil who is Great, and St. Athanasius
Our teacher St. Ephrem and St George our father
All profited from you, calling you their Mother

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 5
Go and ask your Fathers, is what the Word proclaims
And when we did ask them, all of the righteous saints
They did tell us of You, how you endlessly love
How you plead for mankind, saving us from above

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 6
Gabriel from heaven, Elizabeth from Earth
Together they did preach, honor to Virgin birth
Whoever pleads to You, calling upon Your name
He can only profit, no one is put to shame

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'youre-the-soul-for-my-soul'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Lenefese nefeswa nesh, lemengede fana
Endaltefa amnalew, yanchi lij negna'
    AND lyrics_english IS NOT DISTINCT FROM 'Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna

VERSE 1
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 2
Mothers of the righteous, in number they’re many
Before and after Christ, truly they are plenty
But Mary You are one, there is no one like You
You live on for ages, guiding us all to You

VERSE 3
All those who call on you, all who honor your name
All who offer praises, your glory who proclaims
Truly he does profit, and truly does he gain
There is none who loses, there is none put to shame

VERSE 4
Saint Gregory and the, righteous father St John
St Basil who is Great, and St. Athanasius
Our teacher St. Ephrem and St George our father
All profited from you, calling you their Mother

VERSE 5
Go and ask your Fathers, is what the Word proclaims
And when we did ask them, all of the righteous saints
They did tell us of You, how you endlessly love
How you plead for mankind, saving us from above

VERSE 6
Gabriel from heaven, Elizabeth from Earth
Together they did preach, honor to Virgin birth
Whoever pleads to You, calling upon Your name
He can only profit, no one is put to shame'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'youre-the-soul-for-my-soul', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zarem Alesh Belibe (zarem-alesh-belibe)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 1
እደ ሀፃቴ ብዛት እደበደሌማ
የጥልቁ ሰንሰለት ሲያንሰኝ ነው ጨለማ
ግን ያንቺ ሆንኩና ሁሉንም አለፍኩት
ያንን የሞት ባህር በምልጃሽ ቀዘፍኩት

CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 2
አዝማች""""""""
አርፏል ልቤ ባንቺ ባዛኝቷ ማርያም
ውስጤ እያፈሰሰ ፍቅር እና ሰላም
ህመሜን ቢያስረሳኝ የውዳሴሽ ቃና

CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 3
እመቤቴ እላለሁ ዛሬም እንደገና
አዝማች"""""""""
እናታችን ፅዮን ሰው ሁሉ ይልሻል
ዳዋት በበገና ያመሰግንሻል

CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 4
ያሴቦን ነገስታት ለክብርሽ ዘምሩ
የማትፈርሽ መቅደስ የእዛአብሄር ሀገሩ
አዝማች"""""""""""
እጅግ ብዙ ነገር አድርገሽልኛል

CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 5
ይቅር ባዩም ልጅሽ በፍቅር አይቶኛል
እኔስ እኖራለሁ ድንግል ባንቺ ጥላ
ጨለማን አላይም ከእንግዲህ በኋላ

CHORUS
ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""',
      lyrics_transliteration = 'CHORUS
Zarem alesh
Zarem alesh belbe (3)
Dingil hoy wiletash ayt’efam kasabe
CHORUS

VERSE 1
Ede hets’ate bizat edebedelema
Yet’lqu senselet siyansegn new ch’elema
Gin yanchi honkuna hulunm alefkut
Yann yemot bahr bemljash qezefkut

CHORUS
Zarem alesh
Zarem alesh belbe (3)
Dingil hoy wiletash ayt’efam kasabe
CHORUS

VERSE 2
CHORUS
Arfwal libe banchi bazagntwa Maryam
Wist’e eyafesese fiqr ena selam
Himemen biyasresagn yewdasesh qana

CHORUS
Zarem alesh
Zarem alesh belbe (3)
Dingil hoy wiletash ayt’efam kasabe
CHORUS

VERSE 3
Emebete elalehu zarem endegena
CHORUS
Enatachn ts’yon sew hulu yilshal
Dawat bebegena yamesegnshal

CHORUS
Zarem alesh
Zarem alesh belbe (3)
Dingil hoy wiletash ayt’efam kasabe
CHORUS

VERSE 4
Yasebon negestat lekbrsh zemru
Yematfersh meqdes yeezaabher hegeru
CHORUS
Ejg bizu neger adrgeshlgnal

CHORUS
Zarem alesh
Zarem alesh belbe (3)
Dingil hoy wiletash ayt’efam kasabe
CHORUS

VERSE 5
Yiqr bayum lijsh befqr aytognal
Enes enoralehu Dingil banchi t’la
Ch’eleman alaym keengdih behwala

CHORUS
Zarem alesh
Zarem alesh belbe (3)
Dingil hoy wiletash ayt’efam kasabe
CHORUS',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zarem-alesh-belibe'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ዛሬም አለሽ
ዛሬም አለሽ በልቤ(3)
ድንግል ሆይ ውለታሽ አይጠፋም ካሳቤ
አዝማች""""""""

VERSE 1
እደ ሀፃቴ ብዛት እደበደሌማ
የጥልቁ ሰንሰለት ሲያንሰኝ ነው ጨለማ
ግን ያንቺ ሆንኩና ሁሉንም አለፍኩት
ያንን የሞት ባህር በምልጃሽ ቀዘፍኩት

VERSE 2
አዝማች""""""""
አርፏል ልቤ ባንቺ ባዛኝቷ ማርያም
ውስጤ እያፈሰሰ ፍቅር እና ሰላም
ህመሜን ቢያስረሳኝ የውዳሴሽ ቃና

VERSE 3
እመቤቴ እላለሁ ዛሬም እንደገና
አዝማች"""""""""
እናታችን ፅዮን ሰው ሁሉ ይልሻል
ዳዋት በበገና ያመሰግንሻል

VERSE 4
ያሴቦን ነገስታት ለክብርሽ ዘምሩ
የማትፈርሽ መቅደስ የእዛአብሄር ሀገሩ
አዝማች"""""""""""
እጅግ ብዙ ነገር አድርገሽልኛል

VERSE 5
ይቅር ባዩም ልጅሽ በፍቅር አይቶኛል
እኔስ እኖራለሁ ድንግል ባንቺ ጥላ
ጨለማን አላይም ከእንግዲህ በኋላ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Zarem alesh
Zarem alesh belbe (3)
Dingil hoy wiletash ayt’efam kasabe
CHORUS

VERSE 1
Ede hets’ate bizat edebedelema
Yet’lqu senselet siyansegn new ch’elema
Gin yanchi honkuna hulunm alefkut
Yann yemot bahr bemljash qezefkut

VERSE 2
Arfwal libe banchi bazagntwa Maryam
Wist’e eyafesese fiqr ena selam
Himemen biyasresagn yewdasesh qana

VERSE 3
Emebete elalehu zarem endegena
Enatachn ts’yon sew hulu yilshal
Dawat bebegena yamesegnshal

VERSE 4
Yasebon negestat lekbrsh zemru
Yematfersh meqdes yeezaabher hegeru
Ejg bizu neger adrgeshlgnal

VERSE 5
Yiqr bayum lijsh befqr aytognal
Enes enoralehu Dingil banchi t’la
Ch’eleman alaym keengdih behwala'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zarem-alesh-belibe', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zares Teyizhalehugn Like Mezemiran Yilima Hayilu (zares-teyizhalehugn-like-mezemiran-yilima-hayilu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ዛሬ ተይዣለሁ በፍቅርህ ስጦታ
ውለታህ ማርኮኛል የሠራዊት ጌታ
ከአመድ ያነሳኸኝ በትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ /2/

VERSE 1
ያልሰጠኸኝ ነገር በዚህ ምድር የለም
ፍቅርህ ወሰን የለው ድንቅ ነው ዘላለም
እኔነቴን ሳየው ምንድነኝ እላለሁ
ፍቅርህን ሳስተውል ሁልጊዜ አለቅሳለሁ /2/

CHORUS
ዛሬ ተይዣለሁ በፍቅርህ ስጦታ
ውለታህ ማርኮኛል የሠራዊት ጌታ
ከአመድ ያነሳኸኝ በትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ /2/

VERSE 2
ለብቻዬ ሆኜ አምላኬን ሳስበው
ከሕሊና በላይ ውለታህ ብዙ ነው
የተጣለውን ሰው ማንሳት ያውቅበታል
ምስኪኑን ሲያጽናና ከሁሉ ይበልጣል

CHORUS
ዛሬ ተይዣለሁ በፍቅርህ ስጦታ
ውለታህ ማርኮኛል የሠራዊት ጌታ
ከአመድ ያነሳኸኝ በትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ /2/

VERSE 3
ሰው ነህ ተብያለሁ አንተ ሰው ስላልከኝ
ማን ያስታውሰኛል አንተ ባታከብረኝ
አትጣለኝ አንተ ሁሉም ያከብሩኛል
ኃጢአቴን ባትቆጥር ለእኔ ይበቃኛል

CHORUS
ዛሬ ተይዣለሁ በፍቅርህ ስጦታ
ውለታህ ማርኮኛል የሠራዊት ጌታ
ከአመድ ያነሳኸኝ በትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ /2/',
      lyrics_transliteration = 'CHORUS
Zare teyzhalehu befqrh sit’ota
Wiletah markognal yeserawit Geta
Keamed yanesaኸgn betbiya tet’ye
Wiletah kebedegn marekegn Getaye (2)

VERSE 1
Yalset’eኸgn neger bezih midr yelem
Fiqrh wesen yelew dinq new zelalem
Eneneten sayew mindnegn elalehu
Fiqrhn sastewl hulgize aleqsalehu (2)

CHORUS
Zare teyzhalehu befqrh sit’ota
Wiletah markognal yeserawit Geta
Keamed yanesaኸgn betbiya tet’ye
Wiletah kebedegn marekegn Getaye (2)

VERSE 2
Lebchaye hogne amlaken sasbew
Kehlina belay wiletah bizu new
Yetet’alewn sew mansat yawqbetal
Miskinun siyats’nana kehulu yibelt’al

CHORUS
Zare teyzhalehu befqrh sit’ota
Wiletah markognal yeserawit Geta
Keamed yanesaኸgn betbiya tet’ye
Wiletah kebedegn marekegn Getaye (2)

VERSE 3
Sew neh tebyalehu ante sew silalkegn
Man yastawsegnal ante batakebregn
Att’alegn ante hulum yakebrugnal
Hat’iaten batqot’r leene yibeqagnal

CHORUS
Zare teyzhalehu befqrh sit’ota
Wiletah markognal yeserawit Geta
Keamed yanesaኸgn betbiya tet’ye
Wiletah kebedegn marekegn Getaye (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zares-teyizhalehugn-like-mezemiran-yilima-hayilu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ዛሬ ተይዣለሁ በፍቅርህ ስጦታ
ውለታህ ማርኮኛል የሠራዊት ጌታ
ከአመድ ያነሳኸኝ በትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ /2/

VERSE 1
ያልሰጠኸኝ ነገር በዚህ ምድር የለም
ፍቅርህ ወሰን የለው ድንቅ ነው ዘላለም
እኔነቴን ሳየው ምንድነኝ እላለሁ
ፍቅርህን ሳስተውል ሁልጊዜ አለቅሳለሁ /2/

VERSE 2
ለብቻዬ ሆኜ አምላኬን ሳስበው
ከሕሊና በላይ ውለታህ ብዙ ነው
የተጣለውን ሰው ማንሳት ያውቅበታል
ምስኪኑን ሲያጽናና ከሁሉ ይበልጣል

VERSE 3
ሰው ነህ ተብያለሁ አንተ ሰው ስላልከኝ
ማን ያስታውሰኛል አንተ ባታከብረኝ
አትጣለኝ አንተ ሁሉም ያከብሩኛል
ኃጢአቴን ባትቆጥር ለእኔ ይበቃኛል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Zare teyzhalehu befqrh sit’ota
Wiletah markognal yeserawit Geta
Keamed yanesaኸgn betbiya tet’ye
Wiletah kebedegn marekegn Getaye (2)

VERSE 1
Yalset’eኸgn neger bezih midr yelem
Fiqrh wesen yelew dinq new zelalem
Eneneten sayew mindnegn elalehu
Fiqrhn sastewl hulgize aleqsalehu (2)

VERSE 2
Lebchaye hogne amlaken sasbew
Kehlina belay wiletah bizu new
Yetet’alewn sew mansat yawqbetal
Miskinun siyats’nana kehulu yibelt’al

VERSE 3
Sew neh tebyalehu ante sew silalkegn
Man yastawsegnal ante batakebregn
Att’alegn ante hulum yakebrugnal
Hat’iaten batqot’r leene yibeqagnal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zares-teyizhalehugn-like-mezemiran-yilima-hayilu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zbarekayo Zemarit Tirhas Gebre Egziabher (zbarekayo-zemarit-tirhas-gebre-egziabher)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ዝባረኽካዮ
ሕይወተይ ዘጥዓምካዮ
ምንባረይ ዝኸበደኒ
ኣልዒልካ ዘዕረፍካኒ

VERSE 1
ብሳህልኻ ኢየሱስ ኢኻ
ከምቲኳ ኣናህብ ኣብ ዙርያ ዕንበባ
ወትሩ ዝዝንብያ ዝቕሰም ክረኽባ
ግብሪ ናይ ኣእዳውካ ምስ ኣዕረፎ ልበይ

CHORUS
ዝባረኽካዮ
ሕይወተይ ዘጥዓምካዮ
ምንባረይ ዝኸበደኒ
ኣልዒልካ ዘዕረፍካኒ

VERSE 2
ምስጋና ውዕለትካስ ኣይፈልን እዩ ኣፈይ
ቆፅላ ከምዘይረግፍ ኦም ሩባ ለምሊመ
ብኽብርኻ ኣለኹ ፀጋ ተሰሊመ
ሕያወይቲ ኢድካ ቀዲማ ኣብ ሕይወተይ

CHORUS
ዝባረኽካዮ
ሕይወተይ ዘጥዓምካዮ
ምንባረይ ዝኸበደኒ
ኣልዒልካ ዘዕረፍካኒ

VERSE 3
ብምልኣት በረከት ኣፅጊብካያ ነብሰይ
ሰማይ ኣንቃዕሪረ ኦ ኢየሱስ ኢለ
ኣብ ድንኳን ባርያኻ የለን ዝጎደለ
ካብ ኣኽራናት ፅዮን ከም ዝወርድ ፍፁም

CHORUS
ዝባረኽካዮ
ሕይወተይ ዘጥዓምካዮ
ምንባረይ ዝኸበደኒ
ኣልዒልካ ዘዕረፍካኒ

VERSE 4
ከምትጠሊ ሄርሞን በዚሑለይ ሰላም
ኣብ ርስቲ ዙፋንካ ዙፋነይ ክተክል
ብጣዕሚ ፍቕርኻ ሩፍ ኢለ ክዕንግል
መዕረፊ ዓይንኻ ገይርካኒ ኢኻ ኢየሱስ

CHORUS
ዝባረኽካዮ
ሕይወተይ ዘጥዓምካዮ
ምንባረይ ዝኸበደኒ
ኣልዒልካ ዘዕረፍካኒ

VERSE 5
ልበይ መብልዕ ማል እዩ እንሀልካ ንገስ

CHORUS
ዝባረኽካዮ
ሕይወተይ ዘጥዓምካዮ
ምንባረይ ዝኸበደኒ
ኣልዒልካ ዘዕረፍካኒ',
      lyrics_transliteration = 'CHORUS
Zibareኽkayo
Hiywetey zet’amkayo
Minbarey ziኸbedeni
Alilka zeerefkani

VERSE 1
Bisahlኻ Iyesus iኻ
Kemtikwa anahb ab zurya enbeba
Wetru ziznbya ziቕsem kireኽba
Gibri nay aedawka mis aerefo libey

CHORUS
Zibareኽkayo
Hiywetey zet’amkayo
Minbarey ziኸbedeni
Alilka zeerefkani

VERSE 2
Misgana wieletkas ayfeln eyu afey
Qots’la kemzeyregf om ruba lemlime
Biኽbrኻ aleኹ ts’ega teselime
Hiyaweyti idka qedima ab hiywetey

CHORUS
Zibareኽkayo
Hiywetey zet’amkayo
Minbarey ziኸbedeni
Alilka zeerefkani

VERSE 3
Bimlat bereket ats’gibkaya nebsey
Semay anqaerire o Iyesus ile
Ab dinkwan baryaኻ yelen zigodele
Kab aኽranat ts’yon kem ziwerd fits’um

CHORUS
Zibareኽkayo
Hiywetey zet’amkayo
Minbarey ziኸbedeni
Alilka zeerefkani

VERSE 4
Kemtt’eli hermon bezihuley selam
Ab risti zufanka zufaney kitekl
Bit’aemi fiቕrኻ ruf ile kiengl
Meerefi aynኻ geyrkani iኻ Iyesus

CHORUS
Zibareኽkayo
Hiywetey zet’amkayo
Minbarey ziኸbedeni
Alilka zeerefkani

VERSE 5
Libey meble mal eyu enhelka niges

CHORUS
Zibareኽkayo
Hiywetey zet’amkayo
Minbarey ziኸbedeni
Alilka zeerefkani',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zbarekayo-zemarit-tirhas-gebre-egziabher'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ዝባረኽካዮ
ሕይወተይ ዘጥዓምካዮ
ምንባረይ ዝኸበደኒ
ኣልዒልካ ዘዕረፍካኒ

VERSE 1
ብሳህልኻ ኢየሱስ ኢኻ
ከምቲኳ ኣናህብ ኣብ ዙርያ ዕንበባ
ወትሩ ዝዝንብያ ዝቕሰም ክረኽባ
ግብሪ ናይ ኣእዳውካ ምስ ኣዕረፎ ልበይ

VERSE 2
ምስጋና ውዕለትካስ ኣይፈልን እዩ ኣፈይ
ቆፅላ ከምዘይረግፍ ኦም ሩባ ለምሊመ
ብኽብርኻ ኣለኹ ፀጋ ተሰሊመ
ሕያወይቲ ኢድካ ቀዲማ ኣብ ሕይወተይ

VERSE 3
ብምልኣት በረከት ኣፅጊብካያ ነብሰይ
ሰማይ ኣንቃዕሪረ ኦ ኢየሱስ ኢለ
ኣብ ድንኳን ባርያኻ የለን ዝጎደለ
ካብ ኣኽራናት ፅዮን ከም ዝወርድ ፍፁም

VERSE 4
ከምትጠሊ ሄርሞን በዚሑለይ ሰላም
ኣብ ርስቲ ዙፋንካ ዙፋነይ ክተክል
ብጣዕሚ ፍቕርኻ ሩፍ ኢለ ክዕንግል
መዕረፊ ዓይንኻ ገይርካኒ ኢኻ ኢየሱስ

VERSE 5
ልበይ መብልዕ ማል እዩ እንሀልካ ንገስ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Zibareኽkayo
Hiywetey zet’amkayo
Minbarey ziኸbedeni
Alilka zeerefkani

VERSE 1
Bisahlኻ Iyesus iኻ
Kemtikwa anahb ab zurya enbeba
Wetru ziznbya ziቕsem kireኽba
Gibri nay aedawka mis aerefo libey

VERSE 2
Misgana wieletkas ayfeln eyu afey
Qots’la kemzeyregf om ruba lemlime
Biኽbrኻ aleኹ ts’ega teselime
Hiyaweyti idka qedima ab hiywetey

VERSE 3
Bimlat bereket ats’gibkaya nebsey
Semay anqaerire o Iyesus ile
Ab dinkwan baryaኻ yelen zigodele
Kab aኽranat ts’yon kem ziwerd fits’um

VERSE 4
Kemtt’eli hermon bezihuley selam
Ab risti zufanka zufaney kitekl
Bit’aemi fiቕrኻ ruf ile kiengl
Meerefi aynኻ geyrkani iኻ Iyesus

VERSE 5
Libey meble mal eyu enhelka niges'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zbarekayo-zemarit-tirhas-gebre-egziabher', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Ze’awredke Mena (zeawredke-mena)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
አንተኑ ሚካኤል መና መና ዘአውረድከ፣
ወአንተኑ ለእስራኤል መና ዘአውረድከ።

VERSE 1
ዘአውረድከ መና (፪)
ሚካኤል (፪) ዘአውረድከ መና።

CHORUS
አንተኑ ሚካኤል መና መና ዘአውረድከ፣
ወአንተኑ ለእስራኤል መና ዘአውረድከ።',
      lyrics_transliteration = 'CHORUS
Antenu Mika’el mena mena ze’awredke,
We antenu le’Isra’el mena ze’awredke.

VERSE 1
Ze’awredke mena (x2)
Mika’el (x2) ze’awredke mena.

CHORUS
Antenu Mika’el mena mena ze’awredke,
We antenu le’Isra’el mena ze’awredke.',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zeawredke-mena'
    AND lyrics_amharic IS NOT DISTINCT FROM 'አንተኑ ሚካኤል መና መና ዘአውረድከ፣
ወአንተኑ ለእስራኤል መና ዘአውረድከ።

VERSE 1
ዘአውረድከ መና (፪)
ሚካኤል (፪) ዘአውረድከ መና።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Antenu Mika’el mena mena ze’awredke,
We antenu le’Isra’el mena ze’awredke.

VERSE 1
Ze’awredke mena (x2)
Mika’el (x2) ze’awredke mena.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zeawredke-mena', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Ze’etan Antsere (zeetan-antsere)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ዘእጣን አንጸረ (፪)
በጎልጎታ ተረክበ ዕፀ መስቀል (፪)

VERSE 1
ዘእጣን አንጸረ (፪)
በጎልጎታ ተረክበ ዕፀ መስቀል (፪)

CHORUS
ዘእጣን አንጸረ (፪)
በጎልጎታ ተረክበ ዕፀ መስቀል (፪)',
      lyrics_transliteration = 'CHORUS
Ze’etan antsere (2)
BeGolgota terekbe etse meskel (2)

VERSE 1
Ze’etan antsere (2)
BeGolgota terekbe etse meskel (2)

CHORUS
Ze’etan antsere (2)
BeGolgota terekbe etse meskel (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zeetan-antsere'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ዘእጣን አንጸረ (፪)
በጎልጎታ ተረክበ ዕፀ መስቀል (፪)

VERSE 1
ዘእጣን አንጸረ (፪)
በጎልጎታ ተረክበ ዕፀ መስቀል (፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ze’etan antsere (2)
BeGolgota terekbe etse meskel (2)

VERSE 1
Ze’etan antsere (2)
BeGolgota terekbe etse meskel (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zeetan-antsere', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zekariyas Hoy (zekariyas-hoy)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ

VERSE 1
ያንተ ብቻ አይደለም የዮሐንስ ልደት
ምክንያት ነው እርሱ ለፍጥረት መደሰት
መንገድን ይጠርጋል ለሰማይ ፈጣሪ
የሕግ መምህር ነው የሁሉ መካሪ

CHORUS
ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ

VERSE 2
ማንም አይመስለውም ከሴት ልጆች ሁሉ
ብሎ ያከበረው ክርስቶስ በቃሉ
ነቢዩ ዮሐንስ ቅዱስ ሐዋርያ
ካህንና ሰማዕት ነው የእርሱ መጠሪያ

CHORUS
ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ

VERSE 3
ጫማውን ልፈታ አይገባኝም ሲል
አምላኩን በማጥመቅ አየነው ከፍ ሲል
አርጅቼአለሁ ብሎ ላዘነው በከንቱ
የማታ እንጀራ ነው ዮሐንስ ለአባቱ

CHORUS
ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ

VERSE 4
ገና ሳይወለድ መንፈስ ሞልቶበታል
መናኝ ነው እርሱ በዱር ተንከራትቶአል
እዩት ተመልከቱት ዮሐንስ ትጋቱን
በእናቱ ማሕፀን ጀመረ ስግደቱን

CHORUS
ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ',
      lyrics_transliteration = 'CHORUS
Zekaryas hoy atfra
Ts’eloth argoal keet’anh gara
Tiweldlhalech elsabet’ agarh
Yohens yohens tilewaleh

VERSE 1
Yante bicha aydelem yeyohens lidet
Miknyat new ersu left’ret medeset
Mengedn yit’ergal lesemay fet’ari
Yehg memhr new yehulu mekari

CHORUS
Zekaryas hoy atfra
Ts’eloth argoal keet’anh gara
Tiweldlhalech elsabet’ agarh
Yohens yohens tilewaleh

VERSE 2
Manm aymeslewm keset lijoch hulu
Bilo yakeberew Kristos beqalu
Nebiyu yohens Kidus hewarya
Kahnna semaet new yeersu met’eriya

CHORUS
Zekaryas hoy atfra
Ts’eloth argoal keet’anh gara
Tiweldlhalech elsabet’ agarh
Yohens yohens tilewaleh

VERSE 3
Ch’amawn lifeta aygebagnm sil
Amlakun bemat’meq ayenew kef sil
Arjchealehu bilo lazenew bekentu
Yemata enjera new yohens leabatu

CHORUS
Zekaryas hoy atfra
Ts’eloth argoal keet’anh gara
Tiweldlhalech elsabet’ agarh
Yohens yohens tilewaleh

VERSE 4
Gena sayweled menfes moltobetal
Menagn new ersu bedur tenkerattoal
Eyut temelketut yohens tigatun
Beenatu mahts’en jemere sigdetun

CHORUS
Zekaryas hoy atfra
Ts’eloth argoal keet’anh gara
Tiweldlhalech elsabet’ agarh
Yohens yohens tilewaleh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zekariyas-hoy'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ዘካርያስ ሆይ አትፍራ
ጸሎትህ ዐርጎአል ከዕጣንህ ጋራ
ትወልድልሃለች ኤልሳቤጥ አጋርህ
ዮሐንስ ዮሐንስ ትለዋለህ

VERSE 1
ያንተ ብቻ አይደለም የዮሐንስ ልደት
ምክንያት ነው እርሱ ለፍጥረት መደሰት
መንገድን ይጠርጋል ለሰማይ ፈጣሪ
የሕግ መምህር ነው የሁሉ መካሪ

VERSE 2
ማንም አይመስለውም ከሴት ልጆች ሁሉ
ብሎ ያከበረው ክርስቶስ በቃሉ
ነቢዩ ዮሐንስ ቅዱስ ሐዋርያ
ካህንና ሰማዕት ነው የእርሱ መጠሪያ

VERSE 3
ጫማውን ልፈታ አይገባኝም ሲል
አምላኩን በማጥመቅ አየነው ከፍ ሲል
አርጅቼአለሁ ብሎ ላዘነው በከንቱ
የማታ እንጀራ ነው ዮሐንስ ለአባቱ

VERSE 4
ገና ሳይወለድ መንፈስ ሞልቶበታል
መናኝ ነው እርሱ በዱር ተንከራትቶአል
እዩት ተመልከቱት ዮሐንስ ትጋቱን
በእናቱ ማሕፀን ጀመረ ስግደቱን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Zekaryas hoy atfra
Ts’eloth argoal keet’anh gara
Tiweldlhalech elsabet’ agarh
Yohens yohens tilewaleh

VERSE 1
Yante bicha aydelem yeyohens lidet
Miknyat new ersu left’ret medeset
Mengedn yit’ergal lesemay fet’ari
Yehg memhr new yehulu mekari

VERSE 2
Manm aymeslewm keset lijoch hulu
Bilo yakeberew Kristos beqalu
Nebiyu yohens Kidus hewarya
Kahnna semaet new yeersu met’eriya

VERSE 3
Ch’amawn lifeta aygebagnm sil
Amlakun bemat’meq ayenew kef sil
Arjchealehu bilo lazenew bekentu
Yemata enjera new yohens leabatu

VERSE 4
Gena sayweled menfes moltobetal
Menagn new ersu bedur tenkerattoal
Eyut temelketut yohens tigatun
Beenatu mahts’en jemere sigdetun'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zekariyas-hoy', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: ~Zekreni~By Zemari Henok Fikadu~ Eritrean Orthodox Tewahdo Mezmur (zekreni-by-zemari-henok-fikadu-eritrean-orthodox-tewahdo-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 1
ኣዝ
እቲ’ ኳ ክትውለድ ጎይታይ ኣብ መብልዕማል ከብቲ
ትህትና ክትምህር ሓዲግካ ንሃብቲ
ፈታሪ ከለኻ መላኺ ዛምድሪ

CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 2
ርእስካ ናሕሰርካ ክትህበኒ ክብሪ
ፍቅርካ ረሲዐስ ኮይነልካ ከታሪ
ኣዝ
ዘይከም በርጤሜዎስ ኮይነ ልቦናይ ዘይሪእይ

CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 3
ሃብታም ድኻ ኮይነ ክስእን ረዳኢ
ፈውስኻ ሲኢነ መንገዲ ከዕነኒ
ወዲ ዳዊት ጎይታይ ንዓ መሓረኒ
ብመንፈስ ዘርእያ ኣዕንቲ ሃበኒ

CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 4
ኣዝ
ይቕረ ዝልማዱ እንዲኻ መፍቀሬ ንስሓ
ዝዋውዕ በደለይ ከምበረድ አጻዕዲኻ
ታሪኸይ ክትቅይር ናይትማሊ ዛንታ

CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 5
ሕሉፈይ ረሲዕካ ከምየማናይ ሽፍታ
ኣብታ መንግስትኻ ዘክረኒ ጎይታይ
ዘክረኒ(2) ኢኻ ኣብቲ መንግስትኻ(4)

CHORUS
ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ',
      lyrics_transliteration = 'CHORUS
Kem mihretka ileye zilm
Nibariyaኻ gontay aytch’ekn
Werasi kiኸwn nayzelalem riestኻ
Zekreni iኻ abti mengstኻ

VERSE 1
Az
Eti’ kwa kitwled goytay ab meblemal kebti
Tihtna kitmhr hadigka nihabti
Fetari keleኻ melaኺ zamdri

CHORUS
Kem mihretka ileye zilm
Nibariyaኻ gontay aytch’ekn
Werasi kiኸwn nayzelalem riestኻ
Zekreni iኻ abti mengstኻ

VERSE 2
Rieska nahserka kithbeni kibri
Fiqrka resias koynelka ketari
Az
Zeykem bert’emewos koyne libonay zeyriey

CHORUS
Kem mihretka ileye zilm
Nibariyaኻ gontay aytch’ekn
Werasi kiኸwn nayzelalem riestኻ
Zekreni iኻ abti mengstኻ

VERSE 3
Habtam diኻ koyne kisen redai
Fewsኻ siine mengedi keeneni
Wedi dawit goytay nia mehareni
Bimenfes zereya aenti habeni

CHORUS
Kem mihretka ileye zilm
Nibariyaኻ gontay aytch’ekn
Werasi kiኸwn nayzelalem riestኻ
Zekreni iኻ abti mengstኻ

VERSE 4
Az
Yiቕre zilmadu endiኻ mefqere nisha
Ziwawe bedeley kembered ats’aediኻ
Tariኸy kitqyr naytmali zanta

CHORUS
Kem mihretka ileye zilm
Nibariyaኻ gontay aytch’ekn
Werasi kiኸwn nayzelalem riestኻ
Zekreni iኻ abti mengstኻ

VERSE 5
Hilufey resieka kemyemanay shfta
Abta mengstኻ zekreni goytay
Zekreni (2) iኻ abti mengstኻ (4)

CHORUS
Kem mihretka ileye zilm
Nibariyaኻ gontay aytch’ekn
Werasi kiኸwn nayzelalem riestኻ
Zekreni iኻ abti mengstኻ',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zekreni-by-zemari-henok-fikadu-eritrean-orthodox-tewahdo-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ከም ምሕረትካ ኢለየ ዝልም
ንባሪያኻ ጎንታይ ኣይትጨክን
ወራሲ ክኸውን ናይዘላለም ርእስትኻ
ዘክረኒ ኢኻ ኣብቲ መንግስትኻ

VERSE 1
ኣዝ
እቲ’ ኳ ክትውለድ ጎይታይ ኣብ መብልዕማል ከብቲ
ትህትና ክትምህር ሓዲግካ ንሃብቲ
ፈታሪ ከለኻ መላኺ ዛምድሪ

VERSE 2
ርእስካ ናሕሰርካ ክትህበኒ ክብሪ
ፍቅርካ ረሲዐስ ኮይነልካ ከታሪ
ኣዝ
ዘይከም በርጤሜዎስ ኮይነ ልቦናይ ዘይሪእይ

VERSE 3
ሃብታም ድኻ ኮይነ ክስእን ረዳኢ
ፈውስኻ ሲኢነ መንገዲ ከዕነኒ
ወዲ ዳዊት ጎይታይ ንዓ መሓረኒ
ብመንፈስ ዘርእያ ኣዕንቲ ሃበኒ

VERSE 4
ኣዝ
ይቕረ ዝልማዱ እንዲኻ መፍቀሬ ንስሓ
ዝዋውዕ በደለይ ከምበረድ አጻዕዲኻ
ታሪኸይ ክትቅይር ናይትማሊ ዛንታ

VERSE 5
ሕሉፈይ ረሲዕካ ከምየማናይ ሽፍታ
ኣብታ መንግስትኻ ዘክረኒ ጎይታይ
ዘክረኒ(2) ኢኻ ኣብቲ መንግስትኻ(4)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kem mihretka ileye zilm
Nibariyaኻ gontay aytch’ekn
Werasi kiኸwn nayzelalem riestኻ
Zekreni iኻ abti mengstኻ

VERSE 1
Az
Eti’ kwa kitwled goytay ab meblemal kebti
Tihtna kitmhr hadigka nihabti
Fetari keleኻ melaኺ zamdri

VERSE 2
Rieska nahserka kithbeni kibri
Fiqrka resias koynelka ketari
Az
Zeykem bert’emewos koyne libonay zeyriey

VERSE 3
Habtam diኻ koyne kisen redai
Fewsኻ siine mengedi keeneni
Wedi dawit goytay nia mehareni
Bimenfes zereya aenti habeni

VERSE 4
Az
Yiቕre zilmadu endiኻ mefqere nisha
Ziwawe bedeley kembered ats’aediኻ
Tariኸy kitqyr naytmali zanta

VERSE 5
Hilufey resieka kemyemanay shfta
Abta mengstኻ zekreni goytay
Zekreni (2) iኻ abti mengstኻ (4)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zekreni-by-zemari-henok-fikadu-eritrean-orthodox-tewahdo-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zelesegna Mezmur (zelesegna-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 1
እድልን ስጠኝ እንደገና
በቸርነትህ እየኝና
እድልን ስጠኝ እንደገና
… በምህረትህ ብዛት ማረኝ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 2
ይህችን ዓመት ደግሞ ተወኝ
ፍሬ እስካፈራ ታገሰኝ
መልዓኩም እኔን ይጠብቀኝ
የህይወት ቃልህን ይመግበኝ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 3
መልዓኩም እኔን ይጠብቀኝ
የህይወት ቃልህን ይመግበኝ
… በምህረትህ ብዛት ማረኝ
ብበድልህም እለት እለት

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 4
ባስመርርህም በሃጥያት
አትቆርጥብኝም በኔ ተስፋ
ምንም ብቆሽሽ ምን ብከፋ
አትቆርጥብኝም በኔ ተስፋ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 5
ምንም ብቆሽሽ ምን ብከፋ
… በምህረትህ ብዛት ማረኝ
ጌታ ለእኔ አለህ
ፍቅር ነውና አላማህ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 6
አትወድምና የኔን ማልቀስ
ሁሌም ትሻለህ እንድመለስ
አትወድምና የኔን ማልቀስ
ሁሌም ትሻለህ እንድመለስ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 7
… በምህረትህ ብዛት ማረኝ
ይገለጽ በኔ ሃይልህ
ጌታየ አብዝቼ ልውደድህ
አንጻኝ እጠበኝ ቀድሰኝ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 8
በደሌን ከድነህ አቁመኝ
አንጻኝ እጠበኝ ቀድሰኝ
በደሌን ከድነህ አቁመኝ
… በምህረትህ ብዛት ማረኝ

CHORUS
… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና',
      lyrics_transliteration = 'CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 1
Edln sit’egn endegena
Becherneth eyegnna
Edln sit’egn endegena
… bemhreth bizat maregn

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 2
Yihchn amet degmo tewegn
Fire eskafera tagesegn
Melakum enen yit’ebqegn
Yehywet qalhn yimegbegn

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 3
Melakum enen yit’ebqegn
Yehywet qalhn yimegbegn
… bemhreth bizat maregn
Bibedlhm elet elet

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 4
Basmerrhm behat’yat
Atqort’bgnm bene tesfa
Minm biqoshsh min bikefa
Atqort’bgnm bene tesfa

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 5
Minm biqoshsh min bikefa
… bemhreth bizat maregn
Geta leene aleh
Fiqr newna alamah

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 6
Atwedmna yenen malqes
Hulem tishaleh endmeles
Atwedmna yenen malqes
Hulem tishaleh endmeles

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 7
… bemhreth bizat maregn
Yigelets’ bene haylh
Getaye abzche liwdedh
Ants’agn et’ebegn qedsegn

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 8
Bedelen kedneh aqumegn
Ants’agn et’ebegn qedsegn
Bedelen kedneh aqumegn
… bemhreth bizat maregn

CHORUS
… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zelesegna-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM '… በምህረትህ ብዛት ማረኝ
ቅጠል ብቻ ነኝ ፍሬ የሌለኝ
ባክህ ጌታየ አትቁረጠኝ
በቸርነትህ እየኝና

VERSE 1
እድልን ስጠኝ እንደገና
በቸርነትህ እየኝና
እድልን ስጠኝ እንደገና
… በምህረትህ ብዛት ማረኝ

VERSE 2
ይህችን ዓመት ደግሞ ተወኝ
ፍሬ እስካፈራ ታገሰኝ
መልዓኩም እኔን ይጠብቀኝ
የህይወት ቃልህን ይመግበኝ

VERSE 3
መልዓኩም እኔን ይጠብቀኝ
የህይወት ቃልህን ይመግበኝ
… በምህረትህ ብዛት ማረኝ
ብበድልህም እለት እለት

VERSE 4
ባስመርርህም በሃጥያት
አትቆርጥብኝም በኔ ተስፋ
ምንም ብቆሽሽ ምን ብከፋ
አትቆርጥብኝም በኔ ተስፋ

VERSE 5
ምንም ብቆሽሽ ምን ብከፋ
… በምህረትህ ብዛት ማረኝ
ጌታ ለእኔ አለህ
ፍቅር ነውና አላማህ

VERSE 6
አትወድምና የኔን ማልቀስ
ሁሌም ትሻለህ እንድመለስ
አትወድምና የኔን ማልቀስ
ሁሌም ትሻለህ እንድመለስ

VERSE 7
… በምህረትህ ብዛት ማረኝ
ይገለጽ በኔ ሃይልህ
ጌታየ አብዝቼ ልውደድህ
አንጻኝ እጠበኝ ቀድሰኝ

VERSE 8
በደሌን ከድነህ አቁመኝ
አንጻኝ እጠበኝ ቀድሰኝ
በደሌን ከድነህ አቁመኝ
… በምህረትህ ብዛት ማረኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM '… bemhreth bizat maregn
Qit’el bicha negn fire yelelegn
Bakh getaye atquret’egn
Becherneth eyegnna

VERSE 1
Edln sit’egn endegena
Becherneth eyegnna
Edln sit’egn endegena
… bemhreth bizat maregn

VERSE 2
Yihchn amet degmo tewegn
Fire eskafera tagesegn
Melakum enen yit’ebqegn
Yehywet qalhn yimegbegn

VERSE 3
Melakum enen yit’ebqegn
Yehywet qalhn yimegbegn
… bemhreth bizat maregn
Bibedlhm elet elet

VERSE 4
Basmerrhm behat’yat
Atqort’bgnm bene tesfa
Minm biqoshsh min bikefa
Atqort’bgnm bene tesfa

VERSE 5
Minm biqoshsh min bikefa
… bemhreth bizat maregn
Geta leene aleh
Fiqr newna alamah

VERSE 6
Atwedmna yenen malqes
Hulem tishaleh endmeles
Atwedmna yenen malqes
Hulem tishaleh endmeles

VERSE 7
… bemhreth bizat maregn
Yigelets’ bene haylh
Getaye abzche liwdedh
Ants’agn et’ebegn qedsegn

VERSE 8
Bedelen kedneh aqumegn
Ants’agn et’ebegn qedsegn
Bedelen kedneh aqumegn
… bemhreth bizat maregn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zelesegna-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zema Dawit Mezmur (zema-dawit-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 1
የሰማይ ሰራዊት ኀይላት ስልጣናት
ምስጋና ይሰዋሉ ለእግዚአብሔር መንግስት
አጽናፍ ዓለሙን የፈጠረ ያለ የሚኖር የነበረ
የሁሉ አስገኚ እግዚአብሔር አለ

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 2
ፍርዱ የተቃና መኮንነ ጽድቅ
ዙፋኑ ተከቧል በእሳት መብረቅ
ዓለማትን ፈጥሮ ፍጥረቱን ይገዛል
ማእበል ነፋሳቱም ለእርሱ ይታዘዛል

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 3
አጽናፍ ዓለሙን የፈጠረ ያለ የሚኖር የነበረ
የሁሉ አስገኚ እግዚአብሔር አለ
በዘመናት ሁሉ የሸመገለ ነው
መንግስቱ ለትውልድ ጽድቁም ለልጅ ልጅ ነው

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 4
የቀሚሱ ዘርፎች መቅደሱን ሞልቶታል
በረጅም ዙፋን ላይ ኢሳይያስ አይቶታል
አጽናፍ ዓለሙን የፈጠረ ያለ የሚኖር የነበረ
የሁሉ አስገኚ እግዚአብሔር አለ

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 5
የተርሴስ የዓረብ የሳባ ነገሥታት
አምኃ ያቀርባሉ ለፈጣሪ ስብሐት
የነገሥታት ንጉሥ የጌቶች ጌታ ነው
ከአማልእክት እርሱን የለም የሚመስለው

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 6
አጽናፍ ዓለሙን የፈጠረ ያለ የሚኖር የነበረ
የሁሉ አስገኚ እግዚአብሔር አለ

CHORUS
መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም',
      lyrics_transliteration = 'CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm

VERSE 1
Yesemay serawit heylat silt’anat
Misgana yisewalu leEgziabher mengst
Ats’naf alemun yefet’ere yale yeminor yenebere
Yehulu asgegni Egziabher ale

CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm

VERSE 2
Firdu yeteqana mekonne ts’dq
Zufanu tekebwal beesat mebreq
Alematn fet’ro fit’retun yigezal
Maebel nefasatum leersu yitazezal

CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm

VERSE 3
Ats’naf alemun yefet’ere yale yeminor yenebere
Yehulu asgegni Egziabher ale
Bezemenat hulu yeshemegele new
Mengstu letwld ts’dqum lelj lij new

CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm

VERSE 4
Yeqemisu zerfoch meqdesun moltotal
Berejm zufan lay isayyas aytotal
Ats’naf alemun yefet’ere yale yeminor yenebere
Yehulu asgegni Egziabher ale

CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm

VERSE 5
Yeterses yeareb yesaba negestat
Amha yaqerbalu lefet’ari sibhet
Yenegestat nigus yegetoch Geta new
Keamalekt ersun yelem yemimeslew

CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm

VERSE 6
Ats’naf alemun yefet’ere yale yeminor yenebere
Yehulu asgegni Egziabher ale

CHORUS
Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zema-dawit-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'መንግስቱ ዘለዓለም
ወምኩናኑኒ ለትውልደ ትውልድ /4/
ለግዛቱ ወሰን ክብሩ ጽንፍ የለውም
ዘላለም ንጉስ ነው ማንም አይሽረውም

VERSE 1
የሰማይ ሰራዊት ኀይላት ስልጣናት
ምስጋና ይሰዋሉ ለእግዚአብሔር መንግስት
አጽናፍ ዓለሙን የፈጠረ ያለ የሚኖር የነበረ
የሁሉ አስገኚ እግዚአብሔር አለ

VERSE 2
ፍርዱ የተቃና መኮንነ ጽድቅ
ዙፋኑ ተከቧል በእሳት መብረቅ
ዓለማትን ፈጥሮ ፍጥረቱን ይገዛል
ማእበል ነፋሳቱም ለእርሱ ይታዘዛል

VERSE 3
አጽናፍ ዓለሙን የፈጠረ ያለ የሚኖር የነበረ
የሁሉ አስገኚ እግዚአብሔር አለ
በዘመናት ሁሉ የሸመገለ ነው
መንግስቱ ለትውልድ ጽድቁም ለልጅ ልጅ ነው

VERSE 4
የቀሚሱ ዘርፎች መቅደሱን ሞልቶታል
በረጅም ዙፋን ላይ ኢሳይያስ አይቶታል
አጽናፍ ዓለሙን የፈጠረ ያለ የሚኖር የነበረ
የሁሉ አስገኚ እግዚአብሔር አለ

VERSE 5
የተርሴስ የዓረብ የሳባ ነገሥታት
አምኃ ያቀርባሉ ለፈጣሪ ስብሐት
የነገሥታት ንጉሥ የጌቶች ጌታ ነው
ከአማልእክት እርሱን የለም የሚመስለው

VERSE 6
አጽናፍ ዓለሙን የፈጠረ ያለ የሚኖር የነበረ
የሁሉ አስገኚ እግዚአብሔር አለ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Mengstu zelealem
Wemkunanuni letwlde tiwld (4)
Legzatu wesen kibru ts’nf yelewm
Zelalem nigus new manm ayshrewm

VERSE 1
Yesemay serawit heylat silt’anat
Misgana yisewalu leEgziabher mengst
Ats’naf alemun yefet’ere yale yeminor yenebere
Yehulu asgegni Egziabher ale

VERSE 2
Firdu yeteqana mekonne ts’dq
Zufanu tekebwal beesat mebreq
Alematn fet’ro fit’retun yigezal
Maebel nefasatum leersu yitazezal

VERSE 3
Ats’naf alemun yefet’ere yale yeminor yenebere
Yehulu asgegni Egziabher ale
Bezemenat hulu yeshemegele new
Mengstu letwld ts’dqum lelj lij new

VERSE 4
Yeqemisu zerfoch meqdesun moltotal
Berejm zufan lay isayyas aytotal
Ats’naf alemun yefet’ere yale yeminor yenebere
Yehulu asgegni Egziabher ale

VERSE 5
Yeterses yeareb yesaba negestat
Amha yaqerbalu lefet’ari sibhet
Yenegestat nigus yegetoch Geta new
Keamalekt ersun yelem yemimeslew

VERSE 6
Ats’naf alemun yefet’ere yale yeminor yenebere
Yehulu asgegni Egziabher ale'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zema-dawit-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zemari Abel Egeziabhire Yewedekuten Yanesal (zemari-abel-egeziabhire-yewedekuten-yanesal)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
እግዚአብሔር የወደቁትን
ያነሳል የተረሱት ያስታውሳል
የተናቁት ያከብራል
አንተ በክብር ላይ ክብር ስጨምር

VERSE 1
እረኛው ይሻማል በንጉስ ወንበር
ጌታ ትውዳለ የተናቁትን አንተ
ልብን እንጂ አታይም ፊትን

CHORUS
እግዚአብሔር የወደቁትን
ያነሳል የተረሱት ያስታውሳል
የተናቁት ያከብራል
አንተ በክብር ላይ ክብር ስጨምር

VERSE 2
ሳሙኤል ልከ ጠርተ ትቀባለክ
ያንበሶቹን አፍ አንተ ትዘጋለክ
በጌርጌሲኖር በመቃብር ስፍራ
አየሁ አምላኬ ለሰው ልጅ ስትራራ

CHORUS
እግዚአብሔር የወደቁትን
ያነሳል የተረሱት ያስታውሳል
የተናቁት ያከብራል
አንተ በክብር ላይ ክብር ስጨምር

VERSE 3
ጠላታችን ደርሳ ቢያስጨንቀንም
ትሞታለ ብሎ ቢዝትብንም
በሃሰት ቢጥለን ከመከራ ቤት
በእግዚአብሔር ቸርነት ወጣን ከስራት

CHORUS
እግዚአብሔር የወደቁትን
ያነሳል የተረሱት ያስታውሳል
የተናቁት ያከብራል
አንተ በክብር ላይ ክብር ስጨምር

VERSE 4
ይደግፋል ክንድህ የተጋቁትን
ከሰው በታች ሆኑ የሚኖሩትን
ደስታ ትሰጣል ሃዘን አርቀህ
አይቀርም አልቅሶ አንተን ያመነህ

CHORUS
እግዚአብሔር የወደቁትን
ያነሳል የተረሱት ያስታውሳል
የተናቁት ያከብራል
አንተ በክብር ላይ ክብር ስጨምር

VERSE 5
ጠላታችን ደርሳ ቢያስጨንቀንም
ትሞታለ ብሎ ቢዝትብንም
በሃሰት ቢጥለን ከመከራ ቤት
በእግዚአብሔር ቸርነት ወጣን ከስራት

CHORUS
እግዚአብሔር የወደቁትን
ያነሳል የተረሱት ያስታውሳል
የተናቁት ያከብራል
አንተ በክብር ላይ ክብር ስጨምር',
      lyrics_transliteration = 'CHORUS
Egziabher yewedequtn
Yanesal yeteresut yastawsal
Yetenaqut yakebral
Ante bekbr lay kibir sich’emr

VERSE 1
Eregnaw yishamal bengus wenber
Geta tiwdale yetenaqutn ante
Libn enji ataym fitn

CHORUS
Egziabher yewedequtn
Yanesal yeteresut yastawsal
Yetenaqut yakebral
Ante bekbr lay kibir sich’emr

VERSE 2
Samuel like t’erte tiqebalek
Yanbesochun af ante tizegalek
Begergesinor bemeqabr sifra
Ayehu amlake lesew lij sitrara

CHORUS
Egziabher yewedequtn
Yanesal yeteresut yastawsal
Yetenaqut yakebral
Ante bekbr lay kibir sich’emr

VERSE 3
T’elatachn dersa biyasch’enqenm
Timotale bilo biztbnm
Behaset bit’len kemekera bet
BeEgziabher chernet wet’an kesrat

CHORUS
Egziabher yewedequtn
Yanesal yeteresut yastawsal
Yetenaqut yakebral
Ante bekbr lay kibir sich’emr

VERSE 4
Yidegfal kindh yetegaqutn
Kesew betach honu yeminorutn
Desta tiset’al hazen arqeh
Ayqerm alqso anten yameneh

CHORUS
Egziabher yewedequtn
Yanesal yeteresut yastawsal
Yetenaqut yakebral
Ante bekbr lay kibir sich’emr

VERSE 5
T’elatachn dersa biyasch’enqenm
Timotale bilo biztbnm
Behaset bit’len kemekera bet
BeEgziabher chernet wet’an kesrat

CHORUS
Egziabher yewedequtn
Yanesal yeteresut yastawsal
Yetenaqut yakebral
Ante bekbr lay kibir sich’emr',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zemari-abel-egeziabhire-yewedekuten-yanesal'
    AND lyrics_amharic IS NOT DISTINCT FROM 'እግዚአብሔር የወደቁትን
ያነሳል የተረሱት ያስታውሳል
የተናቁት ያከብራል
አንተ በክብር ላይ ክብር ስጨምር

VERSE 1
እረኛው ይሻማል በንጉስ ወንበር
ጌታ ትውዳለ የተናቁትን አንተ
ልብን እንጂ አታይም ፊትን

VERSE 2
ሳሙኤል ልከ ጠርተ ትቀባለክ
ያንበሶቹን አፍ አንተ ትዘጋለክ
በጌርጌሲኖር በመቃብር ስፍራ
አየሁ አምላኬ ለሰው ልጅ ስትራራ

VERSE 3
ጠላታችን ደርሳ ቢያስጨንቀንም
ትሞታለ ብሎ ቢዝትብንም
በሃሰት ቢጥለን ከመከራ ቤት
በእግዚአብሔር ቸርነት ወጣን ከስራት

VERSE 4
ይደግፋል ክንድህ የተጋቁትን
ከሰው በታች ሆኑ የሚኖሩትን
ደስታ ትሰጣል ሃዘን አርቀህ
አይቀርም አልቅሶ አንተን ያመነህ

VERSE 5
ጠላታችን ደርሳ ቢያስጨንቀንም
ትሞታለ ብሎ ቢዝትብንም
በሃሰት ቢጥለን ከመከራ ቤት
በእግዚአብሔር ቸርነት ወጣን ከስራት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Egziabher yewedequtn
Yanesal yeteresut yastawsal
Yetenaqut yakebral
Ante bekbr lay kibir sich’emr

VERSE 1
Eregnaw yishamal bengus wenber
Geta tiwdale yetenaqutn ante
Libn enji ataym fitn

VERSE 2
Samuel like t’erte tiqebalek
Yanbesochun af ante tizegalek
Begergesinor bemeqabr sifra
Ayehu amlake lesew lij sitrara

VERSE 3
T’elatachn dersa biyasch’enqenm
Timotale bilo biztbnm
Behaset bit’len kemekera bet
BeEgziabher chernet wet’an kesrat

VERSE 4
Yidegfal kindh yetegaqutn
Kesew betach honu yeminorutn
Desta tiset’al hazen arqeh
Ayqerm alqso anten yameneh

VERSE 5
T’elatachn dersa biyasch’enqenm
Timotale bilo biztbnm
Behaset bit’len kemekera bet
BeEgziabher chernet wet’an kesrat'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zemari-abel-egeziabhire-yewedekuten-yanesal', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zemari.berehet Tihue# Beza Kulu Beza Kulu# Bereket Tikue (zemari-berehet-tihue-beza-kulu-beza-kulu-bereket-tikue)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2
ዓዲግካና ብኽቡር ደምካ
ኣማኑኤል ሕይወትካ ሂብካ
ቀራንዬ ብድኻም በጽሐ

VERSE 1
ኣፍቂሩና ደሙ እናፍሰሰ
ተረዲአ ናይ ፍቅሩ ትሩጉም
ምስ ሞተለይ መድኃኒ ዓለም
ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2
ዓዲግካና ብኽቡር ደምካ
ኣማኑኤል ሕይወትካ ሂብካ
ቀራንዬ ብድኻም በጽሐ

VERSE 2
ዓዲግካና ብኽቡር ደምካ
ኣማኑኤል ሕይወትካ ሂብካ
ዋጋ ሂቡ ነብሱ ኣሕሊፉ
ፈቲሑና ሰይጣን ኣሲሩ

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2
ዓዲግካና ብኽቡር ደምካ
ኣማኑኤል ሕይወትካ ሂብካ
ቀራንዬ ብድኻም በጽሐ

VERSE 3
ካሕሳ ኾይኑ ከፊሉ ዕዳ
ኣይገደፈናን ኣብ ምድረ በዳ
ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2
ዓዲግካና ብኽቡር ደምካ

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2
ዓዲግካና ብኽቡር ደምካ
ኣማኑኤል ሕይወትካ ሂብካ
ቀራንዬ ብድኻም በጽሐ

VERSE 4
ኣማኑኤል ሕይወትካ ሂብካ
ነዚ ፍቅሩ ከይትርስዑ
ዕለት ዕለ ስሙ ቀድሱ
ኪዳኑ''ዪ ዘናብረኩም

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2
ዓዲግካና ብኽቡር ደምካ
ኣማኑኤል ሕይወትካ ሂብካ
ቀራንዬ ብድኻም በጽሐ

VERSE 5
ትም ከይብል እቲ ልሳንኩም
ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2
ዓዲግካና ብኽቡር ደምካ
ኣማኑኤል ሕይወትካ ሂብካ

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2
ዓዲግካና ብኽቡር ደምካ
ኣማኑኤል ሕይወትካ ሂብካ
ቀራንዬ ብድኻም በጽሐ

VERSE 6
ብመከራ ተበጅዉና
ዳግም ህዝቡ ደቁ ጌሩና
ኣይገዘኣናን መቃብር ሞትን
ኣውሪስና ሓድሽ ሕይወት

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2
ዓዲግካና ብኽቡር ደምካ
ኣማኑኤል ሕይወትካ ሂብካ
ቀራንዬ ብድኻም በጽሐ

VERSE 7
ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2
ዓዲግካና ብኽቡር ደምካ
ኣማኑኤል ሕይወትካ ሂብካ
ቀራንዬ ብድኻም በጽሐ

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2
ዓዲግካና ብኽቡር ደምካ
ኣማኑኤል ሕይወትካ ሂብካ
ቀራንዬ ብድኻም በጽሐ

VERSE 8
ኣፍቂሩና ደሙ እናፍሰሰ
ተረዲአ ናይ ፍቅሩ ትሩጉም
ምስ ሞተለይ መድኃኒ ዓለም
ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2
ዓዲግካና ብኽቡር ደምካ
ኣማኑኤል ሕይወትካ ሂብካ
ቀራንዬ ብድኻም በጽሐ

VERSE 9
ዓዲግካና ብኽቡር ደምካ
ኣማኑኤል ሕይወትካ ሂብካ

CHORUS
ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2
ዓዲግካና ብኽቡር ደምካ
ኣማኑኤል ሕይወትካ ሂብካ
ቀራንዬ ብድኻም በጽሐ',
      lyrics_transliteration = 'CHORUS
Beza kulu nay kulu beza X2
Adigkana biኽbur demka
Amanuel hiywetka hibka
Qeranye bidኻm bets’he

VERSE 1
Afqiruna demu enafsese
Teredia nay fiqru tirugum
Mis moteley medhani alem
Beza kulu nay kulu beza X2

CHORUS
Beza kulu nay kulu beza X2
Adigkana biኽbur demka
Amanuel hiywetka hibka
Qeranye bidኻm bets’he

VERSE 2
Adigkana biኽbur demka
Amanuel hiywetka hibka
Waga hibu nebsu ahlifu
Fetihuna seyt’an asiru

CHORUS
Beza kulu nay kulu beza X2
Adigkana biኽbur demka
Amanuel hiywetka hibka
Qeranye bidኻm bets’he

VERSE 3
Kahsa ኾynu kefilu eda
Aygedefenan ab midre beda
Beza kulu nay kulu beza X2
Adigkana biኽbur demka

CHORUS
Beza kulu nay kulu beza X2
Adigkana biኽbur demka
Amanuel hiywetka hibka
Qeranye bidኻm bets’he

VERSE 4
Amanuel hiywetka hibka
Nezi fiqru keytrsu
Elet ele simu qedsu
Kidanu''yi zenabrekum

CHORUS
Beza kulu nay kulu beza X2
Adigkana biኽbur demka
Amanuel hiywetka hibka
Qeranye bidኻm bets’he

VERSE 5
Tim keybl eti lisankum
Beza kulu nay kulu beza X2
Adigkana biኽbur demka
Amanuel hiywetka hibka

CHORUS
Beza kulu nay kulu beza X2
Adigkana biኽbur demka
Amanuel hiywetka hibka
Qeranye bidኻm bets’he

VERSE 6
Bimekera tebejwuna
Dagm hizbu dequ geruna
Aygezeanan meqabr motn
Awrisna hadsh hiywet

CHORUS
Beza kulu nay kulu beza X2
Adigkana biኽbur demka
Amanuel hiywetka hibka
Qeranye bidኻm bets’he

VERSE 7
Beza kulu nay kulu beza X2
Adigkana biኽbur demka
Amanuel hiywetka hibka
Qeranye bidኻm bets’he

CHORUS
Beza kulu nay kulu beza X2
Adigkana biኽbur demka
Amanuel hiywetka hibka
Qeranye bidኻm bets’he

VERSE 8
Afqiruna demu enafsese
Teredia nay fiqru tirugum
Mis moteley medhani alem
Beza kulu nay kulu beza X2

CHORUS
Beza kulu nay kulu beza X2
Adigkana biኽbur demka
Amanuel hiywetka hibka
Qeranye bidኻm bets’he

VERSE 9
Adigkana biኽbur demka
Amanuel hiywetka hibka

CHORUS
Beza kulu nay kulu beza X2
Adigkana biኽbur demka
Amanuel hiywetka hibka
Qeranye bidኻm bets’he',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zemari-berehet-tihue-beza-kulu-beza-kulu-bereket-tikue'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2
ዓዲግካና ብኽቡር ደምካ
ኣማኑኤል ሕይወትካ ሂብካ
ቀራንዬ ብድኻም በጽሐ

VERSE 1
ኣፍቂሩና ደሙ እናፍሰሰ
ተረዲአ ናይ ፍቅሩ ትሩጉም
ምስ ሞተለይ መድኃኒ ዓለም
ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2

VERSE 2
ዓዲግካና ብኽቡር ደምካ
ኣማኑኤል ሕይወትካ ሂብካ
ዋጋ ሂቡ ነብሱ ኣሕሊፉ
ፈቲሑና ሰይጣን ኣሲሩ

VERSE 3
ካሕሳ ኾይኑ ከፊሉ ዕዳ
ኣይገደፈናን ኣብ ምድረ በዳ
ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2
ዓዲግካና ብኽቡር ደምካ

VERSE 4
ኣማኑኤል ሕይወትካ ሂብካ
ነዚ ፍቅሩ ከይትርስዑ
ዕለት ዕለ ስሙ ቀድሱ
ኪዳኑ''ዪ ዘናብረኩም

VERSE 5
ትም ከይብል እቲ ልሳንኩም
ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2
ዓዲግካና ብኽቡር ደምካ
ኣማኑኤል ሕይወትካ ሂብካ

VERSE 6
ብመከራ ተበጅዉና
ዳግም ህዝቡ ደቁ ጌሩና
ኣይገዘኣናን መቃብር ሞትን
ኣውሪስና ሓድሽ ሕይወት

VERSE 7
ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2
ዓዲግካና ብኽቡር ደምካ
ኣማኑኤል ሕይወትካ ሂብካ
ቀራንዬ ብድኻም በጽሐ

VERSE 8
ኣፍቂሩና ደሙ እናፍሰሰ
ተረዲአ ናይ ፍቅሩ ትሩጉም
ምስ ሞተለይ መድኃኒ ዓለም
ቤዛ ኩሉ ናይ ኩሉ ቤዛ X2

VERSE 9
ዓዲግካና ብኽቡር ደምካ
ኣማኑኤል ሕይወትካ ሂብካ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Beza kulu nay kulu beza X2
Adigkana biኽbur demka
Amanuel hiywetka hibka
Qeranye bidኻm bets’he

VERSE 1
Afqiruna demu enafsese
Teredia nay fiqru tirugum
Mis moteley medhani alem
Beza kulu nay kulu beza X2

VERSE 2
Adigkana biኽbur demka
Amanuel hiywetka hibka
Waga hibu nebsu ahlifu
Fetihuna seyt’an asiru

VERSE 3
Kahsa ኾynu kefilu eda
Aygedefenan ab midre beda
Beza kulu nay kulu beza X2
Adigkana biኽbur demka

VERSE 4
Amanuel hiywetka hibka
Nezi fiqru keytrsu
Elet ele simu qedsu
Kidanu''yi zenabrekum

VERSE 5
Tim keybl eti lisankum
Beza kulu nay kulu beza X2
Adigkana biኽbur demka
Amanuel hiywetka hibka

VERSE 6
Bimekera tebejwuna
Dagm hizbu dequ geruna
Aygezeanan meqabr motn
Awrisna hadsh hiywet

VERSE 7
Beza kulu nay kulu beza X2
Adigkana biኽbur demka
Amanuel hiywetka hibka
Qeranye bidኻm bets’he

VERSE 8
Afqiruna demu enafsese
Teredia nay fiqru tirugum
Mis moteley medhani alem
Beza kulu nay kulu beza X2

VERSE 9
Adigkana biኽbur demka
Amanuel hiywetka hibka'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zemari-berehet-tihue-beza-kulu-beza-kulu-bereket-tikue', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zemari Besufkad Andargacew-adis Zimare_yikirita New Tesifaye Zemari Besufikad Anidarigachew (zemari-besufkad-andargacew-adis-zimare-yikirita-new-tesifaye-zemari-besu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 1
መጣብኝ መርዶ ነጋሪ
የሃጥያት ስራ አባሪ
አንተን እንዳላይ ሊያደርገኝ
ናልኝ ጌታዬ አድነኝ

CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 2
ምርኩዜ ከእጄ አምልጦ
አነባሁ በትሬ ጎብጦ
ጌታዬ እርዳኝ እባክህን
ዘመኔ አልፎ ሳላዝን

CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 3
አፅናኝ እሻለሁኝ ተድላ
ላግኘው የአንተን ጥላ
አድለኝ የንስሃ ኤድሜን
ልልበሰው ልዩ ምረትክን

CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 4
የዛሉ ክዶች ይበርቱ
ሰይጣናት ባንተ ይመቱ
ልቅመሰው ጣፋጭ ፍቅርህን
ላመስግን ላውጅ ስራህን

CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 5
ማእዶት ሆነልኝ ልበል
ባህሪህ ምህረት ነው ልዑል
መሀሪው ምሮኛል እዩኝ
ስባዝን በምረት አይቶኝ

CHORUS
ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ',
      lyrics_transliteration = 'CHORUS
Yiqrtah new tesfaye
Mihreth new tesfaye
Akmegn medhwanite
Adnegn medhwanite

VERSE 1
Met’abgn merdo negari
Yehat’yat sira abari
Anten endalay liyadergegn
Nalgn Getaye adnegn

CHORUS
Yiqrtah new tesfaye
Mihreth new tesfaye
Akmegn medhwanite
Adnegn medhwanite

VERSE 2
Mirkuze keeje amlt’o
Anebahu betre gobt’o
Getaye erdagn ebakhn
Zemene alfo salazn

CHORUS
Yiqrtah new tesfaye
Mihreth new tesfaye
Akmegn medhwanite
Adnegn medhwanite

VERSE 3
Ats’nagn eshalehugn tedla
Laggnew yeanten t’la
Adlegn yensha edmen
Lilbesew liyu miretkn

CHORUS
Yiqrtah new tesfaye
Mihreth new tesfaye
Akmegn medhwanite
Adnegn medhwanite

VERSE 4
Yezalu kidoch yibertu
Seyt’anat bante yimetu
Liqmesew t’afach’ fiqrhn
Lamesgn lawj sirahn

CHORUS
Yiqrtah new tesfaye
Mihreth new tesfaye
Akmegn medhwanite
Adnegn medhwanite

VERSE 5
Maedot honelgn libel
Bahrih mihret new liul
Meheriw mirognal eyugn
Sibazn bemret aytogn

CHORUS
Yiqrtah new tesfaye
Mihreth new tesfaye
Akmegn medhwanite
Adnegn medhwanite',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zemari-besufkad-andargacew-adis-zimare-yikirita-new-tesifaye-zemari-besu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ይቅርታህ ነው ተስፋዬ
ምህረትህ ነው ተስፋዬ
አክመኝ መድኋኒቴ
አድነኝ መድኋኒቴ

VERSE 1
መጣብኝ መርዶ ነጋሪ
የሃጥያት ስራ አባሪ
አንተን እንዳላይ ሊያደርገኝ
ናልኝ ጌታዬ አድነኝ

VERSE 2
ምርኩዜ ከእጄ አምልጦ
አነባሁ በትሬ ጎብጦ
ጌታዬ እርዳኝ እባክህን
ዘመኔ አልፎ ሳላዝን

VERSE 3
አፅናኝ እሻለሁኝ ተድላ
ላግኘው የአንተን ጥላ
አድለኝ የንስሃ ኤድሜን
ልልበሰው ልዩ ምረትክን

VERSE 4
የዛሉ ክዶች ይበርቱ
ሰይጣናት ባንተ ይመቱ
ልቅመሰው ጣፋጭ ፍቅርህን
ላመስግን ላውጅ ስራህን

VERSE 5
ማእዶት ሆነልኝ ልበል
ባህሪህ ምህረት ነው ልዑል
መሀሪው ምሮኛል እዩኝ
ስባዝን በምረት አይቶኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yiqrtah new tesfaye
Mihreth new tesfaye
Akmegn medhwanite
Adnegn medhwanite

VERSE 1
Met’abgn merdo negari
Yehat’yat sira abari
Anten endalay liyadergegn
Nalgn Getaye adnegn

VERSE 2
Mirkuze keeje amlt’o
Anebahu betre gobt’o
Getaye erdagn ebakhn
Zemene alfo salazn

VERSE 3
Ats’nagn eshalehugn tedla
Laggnew yeanten t’la
Adlegn yensha edmen
Lilbesew liyu miretkn

VERSE 4
Yezalu kidoch yibertu
Seyt’anat bante yimetu
Liqmesew t’afach’ fiqrhn
Lamesgn lawj sirahn

VERSE 5
Maedot honelgn libel
Bahrih mihret new liul
Meheriw mirognal eyugn
Sibazn bemret aytogn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zemari-besufkad-andargacew-adis-zimare-yikirita-new-tesifaye-zemari-besu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zemari Di N Kedametsega Yohanis Simishin Siteraw Dinigil (zemari-di-n-kedametsega-yohanis-simishin-siteraw-dinigil)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም

VERSE 1
ትውልድ ነኝና ልጅሽ የፈጠረኝ
ድንግል እመቤቴ ላንቺ ምስጋና አለኝ
በፈቃደ እግዛቤር ባባቶቼ ፀጋ
ሳሊለነ እላለው ሲነሽም ሲነጋ

CHORUS
ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም

VERSE 2
በጠየቅሽው ጊዜ ወይኑን እንዲመላ
አክብሮሻልና በቃና ገሊላ
የሰላም እናት ሆይ ሰላም ልበልሽ
ዘመኔ ይፈፀም ሳመሰግንሽ

CHORUS
ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም

VERSE 3
በሰላምታ ድምፅሽ መንፈስ ተመልቼ
አደግድጌ ልቁም እጆቼን ዘርግቼ
በአብይ ቃል ጮሄ ልመስክር በብርቱ
ቅድስት ድንግል ማርያም የእግዚአብሄር እናቱ

CHORUS
ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም

VERSE 4
ከሰማይ ሲገኝ ነው አንችን ማወደስ
ሲገለጥ ሲፈቀድ ከመንፈስ ቅድስ
ማርያም ህይወቴ ነሽ ምክንያት ለመዳኔ
ብዙ ነው ምስጢሩ አንችን ማመስገኔ።

CHORUS
ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም',
      lyrics_transliteration = 'CHORUS
Simshn sit’eraw Dingil
Simshn sit’eraw Maryam
Landebete mar new lelbe selam
Simshn sit’eraw Maryam

VERSE 1
Tiwld negnna lijsh yefet’eregn
Dingil Emebete lanchi misgana alegn
Befeqade egzaber babatoche ts’ega
Salilene elalew sineshm sinega

CHORUS
Simshn sit’eraw Dingil
Simshn sit’eraw Maryam
Landebete mar new lelbe selam
Simshn sit’eraw Maryam

VERSE 2
Bet’eyeqshw gize weynun endimela
Akbroshalna beqana gelila
Yeselam enat hoy selam libelsh
Zemene yifets’em samesegnsh

CHORUS
Simshn sit’eraw Dingil
Simshn sit’eraw Maryam
Landebete mar new lelbe selam
Simshn sit’eraw Maryam

VERSE 3
Beselamta dimts’sh menfes temelche
Adegdge liqum ejochen zergche
Beaby qal ch’ohe limeskr bebrtu
Kidist Dingil Maryam yeegziabher enatu

CHORUS
Simshn sit’eraw Dingil
Simshn sit’eraw Maryam
Landebete mar new lelbe selam
Simshn sit’eraw Maryam

VERSE 4
Kesemay sigegn new anchn mawedes
Sigelet’ sifeqed kemenfes qids
Maryam hiywete nesh miknyat lemedane
Bizu new mist’iru anchn mamesgene.

CHORUS
Simshn sit’eraw Dingil
Simshn sit’eraw Maryam
Landebete mar new lelbe selam
Simshn sit’eraw Maryam',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zemari-di-n-kedametsega-yohanis-simishin-siteraw-dinigil'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስምሽን ስጠራው ድንግል
ስምሽን ስጠራው ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራው ማርያም

VERSE 1
ትውልድ ነኝና ልጅሽ የፈጠረኝ
ድንግል እመቤቴ ላንቺ ምስጋና አለኝ
በፈቃደ እግዛቤር ባባቶቼ ፀጋ
ሳሊለነ እላለው ሲነሽም ሲነጋ

VERSE 2
በጠየቅሽው ጊዜ ወይኑን እንዲመላ
አክብሮሻልና በቃና ገሊላ
የሰላም እናት ሆይ ሰላም ልበልሽ
ዘመኔ ይፈፀም ሳመሰግንሽ

VERSE 3
በሰላምታ ድምፅሽ መንፈስ ተመልቼ
አደግድጌ ልቁም እጆቼን ዘርግቼ
በአብይ ቃል ጮሄ ልመስክር በብርቱ
ቅድስት ድንግል ማርያም የእግዚአብሄር እናቱ

VERSE 4
ከሰማይ ሲገኝ ነው አንችን ማወደስ
ሲገለጥ ሲፈቀድ ከመንፈስ ቅድስ
ማርያም ህይወቴ ነሽ ምክንያት ለመዳኔ
ብዙ ነው ምስጢሩ አንችን ማመስገኔ።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Simshn sit’eraw Dingil
Simshn sit’eraw Maryam
Landebete mar new lelbe selam
Simshn sit’eraw Maryam

VERSE 1
Tiwld negnna lijsh yefet’eregn
Dingil Emebete lanchi misgana alegn
Befeqade egzaber babatoche ts’ega
Salilene elalew sineshm sinega

VERSE 2
Bet’eyeqshw gize weynun endimela
Akbroshalna beqana gelila
Yeselam enat hoy selam libelsh
Zemene yifets’em samesegnsh

VERSE 3
Beselamta dimts’sh menfes temelche
Adegdge liqum ejochen zergche
Beaby qal ch’ohe limeskr bebrtu
Kidist Dingil Maryam yeegziabher enatu

VERSE 4
Kesemay sigegn new anchn mawedes
Sigelet’ sifeqed kemenfes qids
Maryam hiywete nesh miknyat lemedane
Bizu new mist’iru anchn mamesgene.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zemari-di-n-kedametsega-yohanis-simishin-siteraw-dinigil', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: +++ / / /Zemari G/Yohannes G/Tsadik (zemari-g-yohannes-g-tsadik)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ

VERSE 1
እጅህ ሰፊ እንደሆነ አውቃለሁ ጌታዬ
የጎደለው ሞልቷል ይድረስ ምስጋናዬ
ያጣሁትን ካንተ አግኝቻለሁ
ሁሉን ነገር ለበጎ ብያለሁ /2/

CHORUS
ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ

VERSE 2
ማቄን የቀደደው ደስታ አስታጠቀኝ
ባዶ የነበርኩት ደስታ ተሰጠኝ
ሰጪም ነሺም እግዚአብሔር ብቻ ነው
የሰው ድርሻ በር ማንኳኳት ነው /2/

CHORUS
ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ

VERSE 3
እገፋለሁ እንጂ እኔ አልጨነቅም
መሠረቴ አንተ ነህ ከቶ አልናወጥም
ስትሰጠኝ የሚታየውን
እንዳትነሳኝ የዘላለሙን /2/

CHORUS
ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ

VERSE 4
ቢሰጥ አያልቅበት ለጋስ ክቡር ጌታ
ሁሉን ከወነልኝ በልዩ ችሮታ
ድሆች ስንሆን ሁሉ አለንና
አማላካችን ይድረሰው ምስጋና /2/

CHORUS
ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ',
      lyrics_transliteration = 'CHORUS
Misgun new yetemesegene
Baryawn enen yiqr yale
Yemesgen yimesgenlgn
Gojoyen amlak molalgn

VERSE 1
Ejh sefi endehone awqalehu Getaye
Yegodelew moltwal yidres misganaye
Yat’ahutn kante aggnchalehu
Hulun neger lebego biyalehu (2)

CHORUS
Misgun new yetemesegene
Baryawn enen yiqr yale
Yemesgen yimesgenlgn
Gojoyen amlak molalgn

VERSE 2
Maqen yeqededew desta astat’eqegn
Bado yeneberkut desta teset’egn
Sech’im neshim Egziabher bicha new
Yesew dirsha ber mankwakwat new (2)

CHORUS
Misgun new yetemesegene
Baryawn enen yiqr yale
Yemesgen yimesgenlgn
Gojoyen amlak molalgn

VERSE 3
Egefalehu enji ene alch’eneqm
Meserete ante neh keto alnawet’m
Sitset’egn yemitayewn
Endatnesagn yezelalemun (2)

CHORUS
Misgun new yetemesegene
Baryawn enen yiqr yale
Yemesgen yimesgenlgn
Gojoyen amlak molalgn

VERSE 4
Biset’ ayalqbet legas kibur Geta
Hulun kewenelgn belyu chrota
Dihoch sinhon hulu alenna
Amalakachn yidresew misgana (2)

CHORUS
Misgun new yetemesegene
Baryawn enen yiqr yale
Yemesgen yimesgenlgn
Gojoyen amlak molalgn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zemari-g-yohannes-g-tsadik'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ምስጉን ነው የተመሰገነ
ባርያውን እኔን ይቅር ያለ
ይመስገን ይመስገንልኝ
ጎጆዬን አምላክ ሞላልኝ

VERSE 1
እጅህ ሰፊ እንደሆነ አውቃለሁ ጌታዬ
የጎደለው ሞልቷል ይድረስ ምስጋናዬ
ያጣሁትን ካንተ አግኝቻለሁ
ሁሉን ነገር ለበጎ ብያለሁ /2/

VERSE 2
ማቄን የቀደደው ደስታ አስታጠቀኝ
ባዶ የነበርኩት ደስታ ተሰጠኝ
ሰጪም ነሺም እግዚአብሔር ብቻ ነው
የሰው ድርሻ በር ማንኳኳት ነው /2/

VERSE 3
እገፋለሁ እንጂ እኔ አልጨነቅም
መሠረቴ አንተ ነህ ከቶ አልናወጥም
ስትሰጠኝ የሚታየውን
እንዳትነሳኝ የዘላለሙን /2/

VERSE 4
ቢሰጥ አያልቅበት ለጋስ ክቡር ጌታ
ሁሉን ከወነልኝ በልዩ ችሮታ
ድሆች ስንሆን ሁሉ አለንና
አማላካችን ይድረሰው ምስጋና /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Misgun new yetemesegene
Baryawn enen yiqr yale
Yemesgen yimesgenlgn
Gojoyen amlak molalgn

VERSE 1
Ejh sefi endehone awqalehu Getaye
Yegodelew moltwal yidres misganaye
Yat’ahutn kante aggnchalehu
Hulun neger lebego biyalehu (2)

VERSE 2
Maqen yeqededew desta astat’eqegn
Bado yeneberkut desta teset’egn
Sech’im neshim Egziabher bicha new
Yesew dirsha ber mankwakwat new (2)

VERSE 3
Egefalehu enji ene alch’eneqm
Meserete ante neh keto alnawet’m
Sitset’egn yemitayewn
Endatnesagn yezelalemun (2)

VERSE 4
Biset’ ayalqbet legas kibur Geta
Hulun kewenelgn belyu chrota
Dihoch sinhon hulu alenna
Amalakachn yidresew misgana (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zemari-g-yohannes-g-tsadik', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zemari Mikiyas Aregawi Bemecheresha Eninesalen Kemutan (zemari-mikiyas-aregawi-bemecheresha-eninesalen-kemutan)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
በመጨረሻው እንነሳለን ከሙታን
ጌታ ሲመጣ በአየር ሆነን እያየን
ብርሃን ሆኖ ለሚኖሩት ይህ ክብር
የሚናፈቅ ነው በልቦናቸው የሚኖር

VERSE 1
የስንዴ ቅንጣት ትንሳኤካላት በምድር
ተስፋ አለን እኛ በሰማይ አገር ልንኖር

CHORUS
በመጨረሻው እንነሳለን ከሙታን
ጌታ ሲመጣ በአየር ሆነን እያየን
ብርሃን ሆኖ ለሚኖሩት ይህ ክብር
የሚናፈቅ ነው በልቦናቸው የሚኖር

VERSE 2
ፀሐይ ሲጨልም ክዋክብትም ሲረግፉ
ምድርና ሞላዋ ለዘላለም ሲያልፉ
በሰማይ ኃይላት ንውፅውፅታ ሲሰማ
ጌታ ይመጣል በመለኮቱ ግርማ

CHORUS
በመጨረሻው እንነሳለን ከሙታን
ጌታ ሲመጣ በአየር ሆነን እያየን
ብርሃን ሆኖ ለሚኖሩት ይህ ክብር
የሚናፈቅ ነው በልቦናቸው የሚኖር

VERSE 3
እልፍአእላፋት መላእክትም ሲታዩ
ብርሃን ሲሞላ ምድርና ሰማዩ
የምድር ዳረቻ በነፋሳት ኃይል ሲመታ
ከጭንቅ አድነን አማኑኤል የኛ ጌታ

CHORUS
በመጨረሻው እንነሳለን ከሙታን
ጌታ ሲመጣ በአየር ሆነን እያየን
ብርሃን ሆኖ ለሚኖሩት ይህ ክብር
የሚናፈቅ ነው በልቦናቸው የሚኖር

VERSE 4
ለሚታመኑ በሃይማኖት ለፀኑ
ይታያል በግልፅ የጌታችን ማዳኑ
በምድር እያሉ ኃጢያትን ለሚሰሩ
ያስደንግጣል ያስፈራቸዋል ክብሩ

CHORUS
በመጨረሻው እንነሳለን ከሙታን
ጌታ ሲመጣ በአየር ሆነን እያየን
ብርሃን ሆኖ ለሚኖሩት ይህ ክብር
የሚናፈቅ ነው በልቦናቸው የሚኖር

VERSE 5
ጌታ በዚያ ቀን እንዳንጣል ሲኦል
ቅዱስ ስምህን ይዘናል ተማፅነናል
በበደላችን እንዳትከፍለን አደራ

CHORUS
በመጨረሻው እንነሳለን ከሙታን
ጌታ ሲመጣ በአየር ሆነን እያየን
ብርሃን ሆኖ ለሚኖሩት ይህ ክብር
የሚናፈቅ ነው በልቦናቸው የሚኖር',
      lyrics_transliteration = 'CHORUS
Bemech’ereshaw ennesalen kemutan
Geta simet’a beayer honen eyayen
Birhan hono leminorut yih kibir
Yeminafeq new belbonachew yeminor

VERSE 1
Yesnde qint’at tinsaekalat bemdr
Tesfa alen egna besemay ager linnor

CHORUS
Bemech’ereshaw ennesalen kemutan
Geta simet’a beayer honen eyayen
Birhan hono leminorut yih kibir
Yeminafeq new belbonachew yeminor

VERSE 2
Ts’ehey sich’elm kiwakbtm siregfu
Midrna molawa lezelalem siyalfu
Besemay haylat niwts’wts’ta sisema
Geta yimet’al bemelekotu girma

CHORUS
Bemech’ereshaw ennesalen kemutan
Geta simet’a beayer honen eyayen
Birhan hono leminorut yih kibir
Yeminafeq new belbonachew yeminor

VERSE 3
Elfaelafat melaektm sitayu
Birhan simola midrna semayu
Yemdr darecha benefasat hayl simeta
Kech’nq adnen Amanuel yegna Geta

CHORUS
Bemech’ereshaw ennesalen kemutan
Geta simet’a beayer honen eyayen
Birhan hono leminorut yih kibir
Yeminafeq new belbonachew yeminor

VERSE 4
Lemitamenu behaymanot lets’enu
Yitayal beglts’ yegetachn madanu
Bemdr eyalu hat’iyatn lemiseru
Yasdengt’al yasferachewal kibru

CHORUS
Bemech’ereshaw ennesalen kemutan
Geta simet’a beayer honen eyayen
Birhan hono leminorut yih kibir
Yeminafeq new belbonachew yeminor

VERSE 5
Geta beziya qen endant’al siol
Kidus simhn yizenal temats’nenal
Bebedelachn endatkeflen adera

CHORUS
Bemech’ereshaw ennesalen kemutan
Geta simet’a beayer honen eyayen
Birhan hono leminorut yih kibir
Yeminafeq new belbonachew yeminor',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zemari-mikiyas-aregawi-bemecheresha-eninesalen-kemutan'
    AND lyrics_amharic IS NOT DISTINCT FROM 'በመጨረሻው እንነሳለን ከሙታን
ጌታ ሲመጣ በአየር ሆነን እያየን
ብርሃን ሆኖ ለሚኖሩት ይህ ክብር
የሚናፈቅ ነው በልቦናቸው የሚኖር

VERSE 1
የስንዴ ቅንጣት ትንሳኤካላት በምድር
ተስፋ አለን እኛ በሰማይ አገር ልንኖር

VERSE 2
ፀሐይ ሲጨልም ክዋክብትም ሲረግፉ
ምድርና ሞላዋ ለዘላለም ሲያልፉ
በሰማይ ኃይላት ንውፅውፅታ ሲሰማ
ጌታ ይመጣል በመለኮቱ ግርማ

VERSE 3
እልፍአእላፋት መላእክትም ሲታዩ
ብርሃን ሲሞላ ምድርና ሰማዩ
የምድር ዳረቻ በነፋሳት ኃይል ሲመታ
ከጭንቅ አድነን አማኑኤል የኛ ጌታ

VERSE 4
ለሚታመኑ በሃይማኖት ለፀኑ
ይታያል በግልፅ የጌታችን ማዳኑ
በምድር እያሉ ኃጢያትን ለሚሰሩ
ያስደንግጣል ያስፈራቸዋል ክብሩ

VERSE 5
ጌታ በዚያ ቀን እንዳንጣል ሲኦል
ቅዱስ ስምህን ይዘናል ተማፅነናል
በበደላችን እንዳትከፍለን አደራ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Bemech’ereshaw ennesalen kemutan
Geta simet’a beayer honen eyayen
Birhan hono leminorut yih kibir
Yeminafeq new belbonachew yeminor

VERSE 1
Yesnde qint’at tinsaekalat bemdr
Tesfa alen egna besemay ager linnor

VERSE 2
Ts’ehey sich’elm kiwakbtm siregfu
Midrna molawa lezelalem siyalfu
Besemay haylat niwts’wts’ta sisema
Geta yimet’al bemelekotu girma

VERSE 3
Elfaelafat melaektm sitayu
Birhan simola midrna semayu
Yemdr darecha benefasat hayl simeta
Kech’nq adnen Amanuel yegna Geta

VERSE 4
Lemitamenu behaymanot lets’enu
Yitayal beglts’ yegetachn madanu
Bemdr eyalu hat’iyatn lemiseru
Yasdengt’al yasferachewal kibru

VERSE 5
Geta beziya qen endant’al siol
Kidus simhn yizenal temats’nenal
Bebedelachn endatkeflen adera'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zemari-mikiyas-aregawi-bemecheresha-eninesalen-kemutan', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zemarit Azeb Kebede (zemarit-azeb-kebede)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ክብርህን አይቶ ማነው የሚፀና
የእስራኤል ቅዱስ ሀያል ነህ ገናና
ስምህን ሰምቶ ሞት ይደነግጣል
ክንድህ ብርቱ ነው ማን ያሸንፍሃል

VERSE 1
<<
ሚገዳደሩህ ካንተ የሚጣሉ
በቁጣህ እሳት በክንድህ ይደቃሉ
የፈጠርካቸው ተስፋ ያደርጉሀል

CHORUS
ክብርህን አይቶ ማነው የሚፀና
የእስራኤል ቅዱስ ሀያል ነህ ገናና
ስምህን ሰምቶ ሞት ይደነግጣል
ክንድህ ብርቱ ነው ማን ያሸንፍሃል

VERSE 2
ማዳንክን አልፎ ማን ይነካቸዋል
<<
በደብረታቦር ግርማ መለኮትን
ከልብስ ጨረር ሲወጣ ብርሃን

CHORUS
ክብርህን አይቶ ማነው የሚፀና
የእስራኤል ቅዱስ ሀያል ነህ ገናና
ስምህን ሰምቶ ሞት ይደነግጣል
ክንድህ ብርቱ ነው ማን ያሸንፍሃል

VERSE 3
ፀንተው አልቆሙም ከፊትህ ወደቁ
አምላክነትህን ስልጣንህን አወቁ
<<
አንተ ስትቆም ይርዳል ፍጥረት

CHORUS
ክብርህን አይቶ ማነው የሚፀና
የእስራኤል ቅዱስ ሀያል ነህ ገናና
ስምህን ሰምቶ ሞት ይደነግጣል
ክንድህ ብርቱ ነው ማን ያሸንፍሃል

VERSE 4
መቆም አይችሉም ሁሉም ባንተ ፊት
የማይገሰፅ ዙፋንህ የፀና
አማኑኤል ሆይ ይድረስህ ምስጋና
<<

CHORUS
ክብርህን አይቶ ማነው የሚፀና
የእስራኤል ቅዱስ ሀያል ነህ ገናና
ስምህን ሰምቶ ሞት ይደነግጣል
ክንድህ ብርቱ ነው ማን ያሸንፍሃል

VERSE 5
እግዚአብሔር የለም ያሉ ተመተዋል
ስራህ ተገልፆ በፊትህ አፍረዋል
ዛሬም አንተ ነህ ነገም ድል አድራጊ
የክብራችን ዘውድ የህዝብ ታዳጊ

CHORUS
ክብርህን አይቶ ማነው የሚፀና
የእስራኤል ቅዱስ ሀያል ነህ ገናና
ስምህን ሰምቶ ሞት ይደነግጣል
ክንድህ ብርቱ ነው ማን ያሸንፍሃል',
      lyrics_transliteration = 'CHORUS
Kibrhn ayto manew yemits’ena
Yeesrael Kidus heyal neh genana
Simhn semto mot yidenegt’al
Kindh birtu new man yashenfhal

VERSE 1
<<
Migedaderuh kante yemit’alu
Bequt’ah esat bekndh yideqalu
Yefet’erkachew tesfa yaderguhel

CHORUS
Kibrhn ayto manew yemits’ena
Yeesrael Kidus heyal neh genana
Simhn semto mot yidenegt’al
Kindh birtu new man yashenfhal

VERSE 2
Madankn alfo man yinekachewal
<<
Bedebretabor girma melekotn
Kelbs ch’erer siwet’a birhan

CHORUS
Kibrhn ayto manew yemits’ena
Yeesrael Kidus heyal neh genana
Simhn semto mot yidenegt’al
Kindh birtu new man yashenfhal

VERSE 3
Ts’entew alqomum kefith wedequ
Amlaknethn silt’anhn awequ
<<
Ante sitqom yirdal fit’ret

CHORUS
Kibrhn ayto manew yemits’ena
Yeesrael Kidus heyal neh genana
Simhn semto mot yidenegt’al
Kindh birtu new man yashenfhal

VERSE 4
Meqom aychlum hulum bante fit
Yemaygesets’ zufanh yets’ena
Amanuel hoy yidresh misgana
<<

CHORUS
Kibrhn ayto manew yemits’ena
Yeesrael Kidus heyal neh genana
Simhn semto mot yidenegt’al
Kindh birtu new man yashenfhal

VERSE 5
Egziabher yelem yalu temetewal
Sirah tegelts’o befith afrewal
Zarem ante neh negem dil adragi
Yekbrachn zewd yehzb tadagi

CHORUS
Kibrhn ayto manew yemits’ena
Yeesrael Kidus heyal neh genana
Simhn semto mot yidenegt’al
Kindh birtu new man yashenfhal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zemarit-azeb-kebede'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ክብርህን አይቶ ማነው የሚፀና
የእስራኤል ቅዱስ ሀያል ነህ ገናና
ስምህን ሰምቶ ሞት ይደነግጣል
ክንድህ ብርቱ ነው ማን ያሸንፍሃል

VERSE 1
<<
ሚገዳደሩህ ካንተ የሚጣሉ
በቁጣህ እሳት በክንድህ ይደቃሉ
የፈጠርካቸው ተስፋ ያደርጉሀል

VERSE 2
ማዳንክን አልፎ ማን ይነካቸዋል
<<
በደብረታቦር ግርማ መለኮትን
ከልብስ ጨረር ሲወጣ ብርሃን

VERSE 3
ፀንተው አልቆሙም ከፊትህ ወደቁ
አምላክነትህን ስልጣንህን አወቁ
<<
አንተ ስትቆም ይርዳል ፍጥረት

VERSE 4
መቆም አይችሉም ሁሉም ባንተ ፊት
የማይገሰፅ ዙፋንህ የፀና
አማኑኤል ሆይ ይድረስህ ምስጋና
<<

VERSE 5
እግዚአብሔር የለም ያሉ ተመተዋል
ስራህ ተገልፆ በፊትህ አፍረዋል
ዛሬም አንተ ነህ ነገም ድል አድራጊ
የክብራችን ዘውድ የህዝብ ታዳጊ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kibrhn ayto manew yemits’ena
Yeesrael Kidus heyal neh genana
Simhn semto mot yidenegt’al
Kindh birtu new man yashenfhal

VERSE 1
<<
Migedaderuh kante yemit’alu
Bequt’ah esat bekndh yideqalu
Yefet’erkachew tesfa yaderguhel

VERSE 2
Madankn alfo man yinekachewal
<<
Bedebretabor girma melekotn
Kelbs ch’erer siwet’a birhan

VERSE 3
Ts’entew alqomum kefith wedequ
Amlaknethn silt’anhn awequ
<<
Ante sitqom yirdal fit’ret

VERSE 4
Meqom aychlum hulum bante fit
Yemaygesets’ zufanh yets’ena
Amanuel hoy yidresh misgana
<<

VERSE 5
Egziabher yelem yalu temetewal
Sirah tegelts’o befith afrewal
Zarem ante neh negem dil adragi
Yekbrachn zewd yehzb tadagi'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zemarit-azeb-kebede', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zemarit Enkusilase Gossa "O Gebriel" O Gebiriel (Lyrics Video) (zemarit-enkusilase-gossa-o-gebriel-o-gebiriel-lyrics-video)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ኦ ገብርኤል መልአከ ልዑል(2×)
በሀዘኔ አለ ከጎኔ(2×)
ተልከሕ ከላይ ከሰማይ
በእሳቱ መሀል ብትታይ

VERSE 1
ዘመርኩኝ በአዲሱ ቅኔ
በምልጃህ ሆኖ መዳኔ

CHORUS
ኦ ገብርኤል መልአከ ልዑል(2×)
በሀዘኔ አለ ከጎኔ(2×)
ተልከሕ ከላይ ከሰማይ
በእሳቱ መሀል ብትታይ

VERSE 2
ነበልባል ፍሙ ምኔነው
ከአንተ ጋር እሳት በረድ ነው
በጭንቅ ውስጥ ቅኔ አስተማርከኝ
የላከህ እጅግ ባረከኝ

CHORUS
ኦ ገብርኤል መልአከ ልዑል(2×)
በሀዘኔ አለ ከጎኔ(2×)
ተልከሕ ከላይ ከሰማይ
በእሳቱ መሀል ብትታይ

VERSE 3
ለዓመታት ሰላም ናፍቄ
ከመርገም ተቆጥሮ ጽድቄ
ብስራትህ ዕረፍት ሆኖኛል
ከቤቴል መድኅኔ ወቷል

CHORUS
ኦ ገብርኤል መልአከ ልዑል(2×)
በሀዘኔ አለ ከጎኔ(2×)
ተልከሕ ከላይ ከሰማይ
በእሳቱ መሀል ብትታይ

VERSE 4
ከጥልቁ ጠላት ሲያዛጋ
ካደባው ከሞት መንጋጋ
ተተፋዉ ባምላክህ ፈቃድ
ገብርኤል አንተ ስትወርድ

CHORUS
ኦ ገብርኤል መልአከ ልዑል(2×)
በሀዘኔ አለ ከጎኔ(2×)
ተልከሕ ከላይ ከሰማይ
በእሳቱ መሀል ብትታይ',
      lyrics_transliteration = 'CHORUS
O Gebriel melake liul(2×)
Behezene ale kegone(2×)
Telkeh kelay kesemay
Beesatu mehel bittay

VERSE 1
Zemerkugn beadisu qine
Bemljah hono medane

CHORUS
O Gebriel melake liul(2×)
Behezene ale kegone(2×)
Telkeh kelay kesemay
Beesatu mehel bittay

VERSE 2
Nebelbal fimu minenew
Keante gar esat bered new
Bech’nq wist’ qine astemarkegn
Yelakeh ejg barekegn

CHORUS
O Gebriel melake liul(2×)
Behezene ale kegone(2×)
Telkeh kelay kesemay
Beesatu mehel bittay

VERSE 3
Leametat selam nafqe
Kemergem teqot’ro ts’dqe
Bisrath ereft honognal
Kebetel medhne wetwal

CHORUS
O Gebriel melake liul(2×)
Behezene ale kegone(2×)
Telkeh kelay kesemay
Beesatu mehel bittay

VERSE 4
Ket’lqu t’elat siyazaga
Kadebaw kemot mengaga
Tetefawu bamlakh feqad
Gebriel ante sitwerd

CHORUS
O Gebriel melake liul(2×)
Behezene ale kegone(2×)
Telkeh kelay kesemay
Beesatu mehel bittay',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zemarit-enkusilase-gossa-o-gebriel-o-gebiriel-lyrics-video'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ኦ ገብርኤል መልአከ ልዑል(2×)
በሀዘኔ አለ ከጎኔ(2×)
ተልከሕ ከላይ ከሰማይ
በእሳቱ መሀል ብትታይ

VERSE 1
ዘመርኩኝ በአዲሱ ቅኔ
በምልጃህ ሆኖ መዳኔ

VERSE 2
ነበልባል ፍሙ ምኔነው
ከአንተ ጋር እሳት በረድ ነው
በጭንቅ ውስጥ ቅኔ አስተማርከኝ
የላከህ እጅግ ባረከኝ

VERSE 3
ለዓመታት ሰላም ናፍቄ
ከመርገም ተቆጥሮ ጽድቄ
ብስራትህ ዕረፍት ሆኖኛል
ከቤቴል መድኅኔ ወቷል

VERSE 4
ከጥልቁ ጠላት ሲያዛጋ
ካደባው ከሞት መንጋጋ
ተተፋዉ ባምላክህ ፈቃድ
ገብርኤል አንተ ስትወርድ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'O Gebriel melake liul(2×)
Behezene ale kegone(2×)
Telkeh kelay kesemay
Beesatu mehel bittay

VERSE 1
Zemerkugn beadisu qine
Bemljah hono medane

VERSE 2
Nebelbal fimu minenew
Keante gar esat bered new
Bech’nq wist’ qine astemarkegn
Yelakeh ejg barekegn

VERSE 3
Leametat selam nafqe
Kemergem teqot’ro ts’dqe
Bisrath ereft honognal
Kebetel medhne wetwal

VERSE 4
Ket’lqu t’elat siyazaga
Kadebaw kemot mengaga
Tetefawu bamlakh feqad
Gebriel ante sitwerd'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zemarit-enkusilase-gossa-o-gebriel-o-gebiriel-lyrics-video', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: +++ /Zemarit Lemlem Kebede adanegn Geta adanegne (zemarit-lemlem-kebede-adanegn-geta-adanegne)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በእንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
ከእንግዲህ ላንተ ምስክር ሆኛለሁ
ስራህን ለአለም ሁሌም እነግራለሁ[፪]

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
በእጅህ ወዴቄ መኖር ተሽሎኛል

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 3
የሃዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ እድሜ ጨመረሰክልኝ
ከአልጋየ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህርትህ[፪]

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ህይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብርህ መዝገብ በእጅህ ተጽፋለች

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 5
የሃሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሰንሰለቱ[፪]

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 6
በሃማ መስቀል መርደቀክዮስ የለም
የናቁት ሄደ በከንቱ አልቀርም
የእውነት ዳኛ ጌታ ስትመጣ
የሃሰቱ ሰው ግፈኛው ተቀጣ

CHORUS
አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ',
      lyrics_transliteration = 'CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn

VERSE 1
Yalfal yalalkut alfolgn ayche
Beenba tat’ebkugn kedqdq wet’che
Keengdih lante miskr hognalehu
Sirahn lealem hulem enegralehu[2]

CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn

VERSE 2
Kindh birtu new dekaman lemerdat
Tawqbetaleh yezalen mabertat
Aynen kesewoch maraqe t’eqmognal
Beejh wedeqe menor teshlognal

CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn

VERSE 3
Yehazenen maq awlqeh t’alklgn
Moten sit’ebq edme ch’emereseklgn
Kealgaye lay anesugn ejochh
Tefewshalehu zare bemhrth[2]

CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn

VERSE 4
Qalh ts’nu new dagm yit’egnal
Gobat’a aqnto shbawn tertrwal
Hiywete bante zare adis honalech
Bekbrh mezgeb beejh tets’falech

CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn

VERSE 5
Yehasetn fird Geta qelebeskew
Tets’nantwal bante ya yetegefa sew
Yegfn ts’wa araqkew kefitu
Beeju lay yelem zare senseletu[2]

CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn

VERSE 6
Behama mesqel merdeqekyos yelem
Yenaqut hede bekentu alqerm
Yeewnet dagna Geta sitmet’a
Yehasetu sew gifegnaw teqet’a

CHORUS
Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zemarit-lemlem-kebede-adanegn-geta-adanegne'
    AND lyrics_amharic IS NOT DISTINCT FROM 'አዳነኝ ጌታ አዳነኝ
ፈውሰኝ ጌታ ፍወሰኝ[፪]
እግዚአብሔር አዳነኝ
ሀጢአተኛውን ወደደኝ

VERSE 1
ያልፋል ያላልኩት አልፎልኝ አይቼ
በእንባ ታጠብኩኝ ከድቅድቅ ወጥቼ
ከእንግዲህ ላንተ ምስክር ሆኛለሁ
ስራህን ለአለም ሁሌም እነግራለሁ[፪]

VERSE 2
ክንድህ ብርቱ ነው ደካማን ለመርዳት
ታውቅበታለህ የዛለን ማበርታት
አይኔን ከሰዎች ማራቄ ጠቅሞኛል
በእጅህ ወዴቄ መኖር ተሽሎኛል

VERSE 3
የሃዘኔን ማቅ አውልቀህ ጣልክልኝ
ሞቴን ስጠብቅ እድሜ ጨመረሰክልኝ
ከአልጋየ ላይ አነሱኝ እጆችህ
ተፈውሻለሁ ዛሬ በምህርትህ[፪]

VERSE 4
ቃልህ ጽኑ ነው ዳግም ይጠግናል
ጎባጣ አቅንቶ ሽባውን ተርትሯል
ህይወቴ ባንተ ዛሬ አዲስ ሆናለች
በክብርህ መዝገብ በእጅህ ተጽፋለች

VERSE 5
የሃሰትን ፍርድ ጌታ ቀለበስከው
ተጽናንቷል ባንተ ያ የተገፋ ሰው
የግፍን ጽዋ አራቅከው ከፊቱ
በእጁ ላይ የለም ዛሬ ሰንሰለቱ[፪]

VERSE 6
በሃማ መስቀል መርደቀክዮስ የለም
የናቁት ሄደ በከንቱ አልቀርም
የእውነት ዳኛ ጌታ ስትመጣ
የሃሰቱ ሰው ግፈኛው ተቀጣ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Adanegn Geta adanegn
Fewsegn Geta fiwesegn[2]
Egziabher adanegn
Het’iategnawn wededegn

VERSE 1
Yalfal yalalkut alfolgn ayche
Beenba tat’ebkugn kedqdq wet’che
Keengdih lante miskr hognalehu
Sirahn lealem hulem enegralehu[2]

VERSE 2
Kindh birtu new dekaman lemerdat
Tawqbetaleh yezalen mabertat
Aynen kesewoch maraqe t’eqmognal
Beejh wedeqe menor teshlognal

VERSE 3
Yehazenen maq awlqeh t’alklgn
Moten sit’ebq edme ch’emereseklgn
Kealgaye lay anesugn ejochh
Tefewshalehu zare bemhrth[2]

VERSE 4
Qalh ts’nu new dagm yit’egnal
Gobat’a aqnto shbawn tertrwal
Hiywete bante zare adis honalech
Bekbrh mezgeb beejh tets’falech

VERSE 5
Yehasetn fird Geta qelebeskew
Tets’nantwal bante ya yetegefa sew
Yegfn ts’wa araqkew kefitu
Beeju lay yelem zare senseletu[2]

VERSE 6
Behama mesqel merdeqekyos yelem
Yenaqut hede bekentu alqerm
Yeewnet dagna Geta sitmet’a
Yehasetu sew gifegnaw teqet’a'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zemarit-lemlem-kebede-adanegn-geta-adanegne', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zemarit Marita Hayile Silase Simih Behulu Temesegene (zemarit-marita-hayile-silase-simih-behulu-temesegene)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 1
አምላክ ተመስገን በሰማያት
ስምህ ይወደስ በፍጥረታት
ከህፃናት አፍ ምስጋና ይውጣ
አንተን ማመስገን ይሁን የኛ ዕጣ /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 2
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 3
በምግብ እጦት ብንሰቃይም
ማህሌትህን አናቁአርጥም
የመከራ ዶፍ ቢወርድብንም
እንዘምራለን ለአምላካችን ስም /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 4
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 5
ሰማዩ ዝናብ ደመና ቢያጣ
ፍቅርህ በእኛ ውስጥ ከቶ አይታጣ
ቸርነትህን እንጠብቃለን
ከአንተ ደጅ አምላክ የት እንሄዳለን /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 6
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

CHORUS
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/',
      lyrics_transliteration = 'CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 1
Amlak temesgen besemayat
Simh yiwedes beft’retat
Kehts’anat af misgana yiwt’a
Anten mamesgen yihun yegna et’a (2)

CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 2
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 3
Bemgb et’ot binseqaym
Mahlethn anaquart’m
Yemekera dof biwerdbnm
Enzemralen leamlakachn sim (2)

CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 4
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 5
Semayu zinab demena biyat’a
Fiqrh beegna wist’ keto aytat’a
Chernethn ent’ebqalen
Keante dej amlak yet enhedalen (2)

CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 6
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

CHORUS
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zemarit-marita-hayile-silase-simih-behulu-temesegene'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 1
አምላክ ተመስገን በሰማያት
ስምህ ይወደስ በፍጥረታት
ከህፃናት አፍ ምስጋና ይውጣ
አንተን ማመስገን ይሁን የኛ ዕጣ /2/

VERSE 2
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 3
በምግብ እጦት ብንሰቃይም
ማህሌትህን አናቁአርጥም
የመከራ ዶፍ ቢወርድብንም
እንዘምራለን ለአምላካችን ስም /2/

VERSE 4
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/

VERSE 5
ሰማዩ ዝናብ ደመና ቢያጣ
ፍቅርህ በእኛ ውስጥ ከቶ አይታጣ
ቸርነትህን እንጠብቃለን
ከአንተ ደጅ አምላክ የት እንሄዳለን /2/

VERSE 6
ስምህ በሁሉ ተመሰገነ
ከክብር በላይ ክብርህ ገነነ
አንተን ማወደስ ያስደስተናል
ስምህን ማክበር ክብራችን ሆኖአል /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 1
Amlak temesgen besemayat
Simh yiwedes beft’retat
Kehts’anat af misgana yiwt’a
Anten mamesgen yihun yegna et’a (2)

VERSE 2
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 3
Bemgb et’ot binseqaym
Mahlethn anaquart’m
Yemekera dof biwerdbnm
Enzemralen leamlakachn sim (2)

VERSE 4
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)

VERSE 5
Semayu zinab demena biyat’a
Fiqrh beegna wist’ keto aytat’a
Chernethn ent’ebqalen
Keante dej amlak yet enhedalen (2)

VERSE 6
Simh behulu temesegene
Kekbr belay kibrh genene
Anten mawedes yasdestenal
Simhn makber kibrachn honoal (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zemarit-marita-hayile-silase-simih-behulu-temesegene', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zemarit Mirtineshi Tilahun//kana Ze Gelila//ye D.daniel Wendimu Ye Sergi Mereha Gibir Lay (zemarit-mirtineshi-tilahun-kana-ze-gelila-ye-d-daniel-wendimu-ye-sergi-m)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 1
በዛ በሰርግ ግብዣ
ተገኝተሻል ድንግል
ከእናንተ ጋር
እጀገነሽ ቆመሽ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 2
የጠማበዙበት
ሲበሉ ሲጠጡ
ወይን ደርቆ ገጨ
ድንግል እናታችን

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 3
የእግዚአብሔር ታአምር
ባንቺ ተደረሸ
በእሾክ አማለደ
ከእናት ጋራ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 4
አና
ዘገሊላ
አና
ዘገሊላ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 5
በዛ በሰርግ ግብዣ
ተገኝተሻል ድንግል
እለትሽ ባረ
ተነግተሻል ጌታ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 6
ከእናንተ ጋራ
አንቺ ያልለሽ
ወገር የለባት
ሁሉ ይቻልሻል

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 7
ወይን ምን አላት
ማአትግያው ባዶነ
በነሸ ተናገር
የገላን አሳሰብሽ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 8
እመቤታችን
አና
ዘገሊላ
አና

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 9
ዘገሊላ
በዛ በሰርግ ግብዣ
ተገኝተሻል ድንግል
እለትሽ ባረ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 10
ተነግተሻል ጌታ
ከእናንተ ጋራ
የጌታ አምላክነት
የተገለጠባት

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 11
መኔም የላት
የመዶቂ ማስብ
ዛሬ ህብረት
በፀቀል ሁልጊዜ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 12
ከከን በስጋ ነው
አና
ዘገሊላ
አና

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 13
ዘገሊላ
በዛ በሰርግ ግብዣ
ተገኝተሻል ድንግል
እለትሽ ባረ

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 14
ተነግተሻል ጌታ
ከእናንተ ጋራ
አንቺ ያልለሽ
ወገር የለባት

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 15
ሁሉ ይቻልሻል
ወይን ምን አላት
በአደካው ባዶ ነው
ብነሸ ተናገር

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 16
የገላን አሳሰብሽ
እመቤታችን

CHORUS
አና
ዘገሊላ
አና
ዘገሊላ',
      lyrics_transliteration = 'CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 1
Beza beserg gibzha
Tegegnteshal Dingil
Keenante gar
Ejegenesh qomesh

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 2
Yet’emabezubet
Sibelu sit’et’u
Weyn derqo gech’e
Dingil enatachn

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 3
YeEgziabher taamr
Banchi tedereshe
Beeshok amalede
Keenat gara

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 4
Ana
Zegelila
Ana
Zegelila

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 5
Beza beserg gibzha
Tegegnteshal Dingil
Eletsh bare
Tenegteshal Geta

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 6
Keenante gara
Anchi yallesh
Weger yelebat
Hulu yichalshal

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 7
Weyn min alat
Maatgyaw badone
Beneshe tenager
Yegelan asasebsh

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 8
Emebetachen
Ana
Zegelila
Ana

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 9
Zegelila
Beza beserg gibzha
Tegegnteshal Dingil
Eletsh bare

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 10
Tenegteshal Geta
Keenante gara
Yegeta amlaknet
Yetegelet’ebat

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 11
Menem yelat
Yemedoqi masb
Zare hibret
Bets’eqel hulgize

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 12
Keken besga new
Ana
Zegelila
Ana

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 13
Zegelila
Beza beserg gibzha
Tegegnteshal Dingil
Eletsh bare

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 14
Tenegteshal Geta
Keenante gara
Anchi yallesh
Weger yelebat

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 15
Hulu yichalshal
Weyn min alat
Beadekaw bado new
Bineshe tenager

CHORUS
Ana
Zegelila
Ana
Zegelila

VERSE 16
Yegelan asasebsh
Emebetachen

CHORUS
Ana
Zegelila
Ana
Zegelila',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zemarit-mirtineshi-tilahun-kana-ze-gelila-ye-d-daniel-wendimu-ye-sergi-m'
    AND lyrics_amharic IS NOT DISTINCT FROM 'አና
ዘገሊላ
አና
ዘገሊላ

VERSE 1
በዛ በሰርግ ግብዣ
ተገኝተሻል ድንግል
ከእናንተ ጋር
እጀገነሽ ቆመሽ

VERSE 2
የጠማበዙበት
ሲበሉ ሲጠጡ
ወይን ደርቆ ገጨ
ድንግል እናታችን

VERSE 3
የእግዚአብሔር ታአምር
ባንቺ ተደረሸ
በእሾክ አማለደ
ከእናት ጋራ

VERSE 4
አና
ዘገሊላ
አና
ዘገሊላ

VERSE 5
በዛ በሰርግ ግብዣ
ተገኝተሻል ድንግል
እለትሽ ባረ
ተነግተሻል ጌታ

VERSE 6
ከእናንተ ጋራ
አንቺ ያልለሽ
ወገር የለባት
ሁሉ ይቻልሻል

VERSE 7
ወይን ምን አላት
ማአትግያው ባዶነ
በነሸ ተናገር
የገላን አሳሰብሽ

VERSE 8
እመቤታችን
አና
ዘገሊላ
አና

VERSE 9
ዘገሊላ
በዛ በሰርግ ግብዣ
ተገኝተሻል ድንግል
እለትሽ ባረ

VERSE 10
ተነግተሻል ጌታ
ከእናንተ ጋራ
የጌታ አምላክነት
የተገለጠባት

VERSE 11
መኔም የላት
የመዶቂ ማስብ
ዛሬ ህብረት
በፀቀል ሁልጊዜ

VERSE 12
ከከን በስጋ ነው
አና
ዘገሊላ
አና

VERSE 13
ዘገሊላ
በዛ በሰርግ ግብዣ
ተገኝተሻል ድንግል
እለትሽ ባረ

VERSE 14
ተነግተሻል ጌታ
ከእናንተ ጋራ
አንቺ ያልለሽ
ወገር የለባት

VERSE 15
ሁሉ ይቻልሻል
ወይን ምን አላት
በአደካው ባዶ ነው
ብነሸ ተናገር

VERSE 16
የገላን አሳሰብሽ
እመቤታችን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ana
Zegelila
Ana
Zegelila

VERSE 1
Beza beserg gibzha
Tegegnteshal Dingil
Keenante gar
Ejegenesh qomesh

VERSE 2
Yet’emabezubet
Sibelu sit’et’u
Weyn derqo gech’e
Dingil enatachn

VERSE 3
YeEgziabher taamr
Banchi tedereshe
Beeshok amalede
Keenat gara

VERSE 4
Ana
Zegelila
Ana
Zegelila

VERSE 5
Beza beserg gibzha
Tegegnteshal Dingil
Eletsh bare
Tenegteshal Geta

VERSE 6
Keenante gara
Anchi yallesh
Weger yelebat
Hulu yichalshal

VERSE 7
Weyn min alat
Maatgyaw badone
Beneshe tenager
Yegelan asasebsh

VERSE 8
Emebetachen
Ana
Zegelila
Ana

VERSE 9
Zegelila
Beza beserg gibzha
Tegegnteshal Dingil
Eletsh bare

VERSE 10
Tenegteshal Geta
Keenante gara
Yegeta amlaknet
Yetegelet’ebat

VERSE 11
Menem yelat
Yemedoqi masb
Zare hibret
Bets’eqel hulgize

VERSE 12
Keken besga new
Ana
Zegelila
Ana

VERSE 13
Zegelila
Beza beserg gibzha
Tegegnteshal Dingil
Eletsh bare

VERSE 14
Tenegteshal Geta
Keenante gara
Anchi yallesh
Weger yelebat

VERSE 15
Hulu yichalshal
Weyn min alat
Beadekaw bado new
Bineshe tenager

VERSE 16
Yegelan asasebsh
Emebetachen'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zemarit-mirtineshi-tilahun-kana-ze-gelila-ye-d-daniel-wendimu-ye-sergi-m', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: # Zemarit Saron Yohannes Eritrean Orthodox Tewahdo Mezmur (zemarit-saron-yohannes-eritrean-orthodox-tewahdo-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ

VERSE 1
ስጋሰብ ዝቅለብ ህምየት ዘኩርዓኒ
ሓጥየተይ ከለኒ ሓጥያት ሰብ ዝዳኒ
ኢደይ ዘወጣውጥ ረሲዐ ገበነይ
ኣብ መጋባያ ፍርድስ እንታይ ኮን ዩ ፍርደይ

CHORUS
ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ

VERSE 2
ልቅሉቅ መቃብር በድኒ ጸይረ ውሽተይ
እነኩ ይልምን ክትቅይር ህየወትይ
ኦ ኣቦይ በጃካ ኣይትርእ በደለይ
ዝሰግዶ ብፍቅዲ ፍቅርካ ኣልቦ ቁጽሪ

CHORUS
ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ

VERSE 3
ዘፍቃርካኒ ሓቂ ሓጥያተይ ግን ጽርዲ
ምስተሃህደ ግብረይ ክህባእ መቁጽልቲ
ባዕለይ ምስ ሓጣዕኩ ምክኒተይ ደርዳሪ
ምህረት ምስ ሓብካኒ ኣይ ሰሙን ሳልስቲ

CHORUS
ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ

VERSE 4
መሊሰ ዝሓጥዕ ዘይብለይ መዳርግቲ
ደይበ ኣትራኖስ ዝብል ተነስሁ
ንስሓስ ንዓዩ ዛነብሰይ ዘርሳህኩ

CHORUS
ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ',
      lyrics_transliteration = 'CHORUS
Kabli zits’omku libey qim meliu
Migbarey bikfat kulu tirbait’u
Gets’ey ats’emle mits’amey ziewj
Ts’dqi zeybley ts’dqka ewj

VERSE 1
Sigaseb ziqleb himyet zekurani
Hat’yetey keleni hat’yat seb zidani
Idey zewet’awt’ resia gebeney
Ab megabaya firds entay kon yu firdey

CHORUS
Kabli zits’omku libey qim meliu
Migbarey bikfat kulu tirbait’u
Gets’ey ats’emle mits’amey ziewj
Ts’dqi zeybley ts’dqka ewj

VERSE 2
Liqluq meqabr bedni ts’eyre wishtey
Eneku yilmn kitqyr hiyewety
O aboy bejaka aytre bedeley
Zisegdo bifqdi fiqrka albo quts’ri

CHORUS
Kabli zits’omku libey qim meliu
Migbarey bikfat kulu tirbait’u
Gets’ey ats’emle mits’amey ziewj
Ts’dqi zeybley ts’dqka ewj

VERSE 3
Zefqarkani haqi hat’yatey gin ts’rdi
Mistehahde gibrey kihbae mequts’lti
Baeley mis hat’aeku miknitey derdari
Mihret mis habkani ay semun salsti

CHORUS
Kabli zits’omku libey qim meliu
Migbarey bikfat kulu tirbait’u
Gets’ey ats’emle mits’amey ziewj
Ts’dqi zeybley ts’dqka ewj

VERSE 4
Melise zihat’e zeybley medargti
Deybe atranos zibl teneshu
Nishas niayu zanebsey zersahku

CHORUS
Kabli zits’omku libey qim meliu
Migbarey bikfat kulu tirbait’u
Gets’ey ats’emle mits’amey ziewj
Ts’dqi zeybley ts’dqka ewj',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zemarit-saron-yohannes-eritrean-orthodox-tewahdo-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ካብልዒ ዝጾምኩ ልበይ ቂም መሊኡ
ምግባረይ ብክፋት ኩሉ ትርባዒጡ
ገጸይ ኣጸምሌ ምጻመይ ዝእውጅ
ጽድቂ ዘይብለይ ጽድቅካ እውጅ

VERSE 1
ስጋሰብ ዝቅለብ ህምየት ዘኩርዓኒ
ሓጥየተይ ከለኒ ሓጥያት ሰብ ዝዳኒ
ኢደይ ዘወጣውጥ ረሲዐ ገበነይ
ኣብ መጋባያ ፍርድስ እንታይ ኮን ዩ ፍርደይ

VERSE 2
ልቅሉቅ መቃብር በድኒ ጸይረ ውሽተይ
እነኩ ይልምን ክትቅይር ህየወትይ
ኦ ኣቦይ በጃካ ኣይትርእ በደለይ
ዝሰግዶ ብፍቅዲ ፍቅርካ ኣልቦ ቁጽሪ

VERSE 3
ዘፍቃርካኒ ሓቂ ሓጥያተይ ግን ጽርዲ
ምስተሃህደ ግብረይ ክህባእ መቁጽልቲ
ባዕለይ ምስ ሓጣዕኩ ምክኒተይ ደርዳሪ
ምህረት ምስ ሓብካኒ ኣይ ሰሙን ሳልስቲ

VERSE 4
መሊሰ ዝሓጥዕ ዘይብለይ መዳርግቲ
ደይበ ኣትራኖስ ዝብል ተነስሁ
ንስሓስ ንዓዩ ዛነብሰይ ዘርሳህኩ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Kabli zits’omku libey qim meliu
Migbarey bikfat kulu tirbait’u
Gets’ey ats’emle mits’amey ziewj
Ts’dqi zeybley ts’dqka ewj

VERSE 1
Sigaseb ziqleb himyet zekurani
Hat’yetey keleni hat’yat seb zidani
Idey zewet’awt’ resia gebeney
Ab megabaya firds entay kon yu firdey

VERSE 2
Liqluq meqabr bedni ts’eyre wishtey
Eneku yilmn kitqyr hiyewety
O aboy bejaka aytre bedeley
Zisegdo bifqdi fiqrka albo quts’ri

VERSE 3
Zefqarkani haqi hat’yatey gin ts’rdi
Mistehahde gibrey kihbae mequts’lti
Baeley mis hat’aeku miknitey derdari
Mihret mis habkani ay semun salsti

VERSE 4
Melise zihat’e zeybley medargti
Deybe atranos zibl teneshu
Nishas niayu zanebsey zersahku'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zemarit-saron-yohannes-eritrean-orthodox-tewahdo-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zemenen Amesgenekut (zemenen-amesgenekut)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 1
ገና እዘምራለሁ ምስጋና አለኝ ገና
ካበቃኝ ለዛሬ ከደረስኩ በደህና
እስትንፋሴ እስኪቆም ወደርሱ እስክጠራ
ውዳሴ ማቅረብ ነው ግብሬ የእኔ ስራ

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 2
ከያቦክ ወንዝ ዳር ክፉ ስሜን ጣለው
ለስሙ እድዘምር እዳመሰግነው
ትናንትን አልፌ በቃሁኝ ለዛሬ
በጌልጌላ ምድር ተወግዶ ነውሬ

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 3
ለጣቶቼ ሰልፍን ለእጆቼ በገና
አስተምሮ አቆመኝ ለስሙ ምስጋና
ለመዝሙር ቢቀባኝ ገና ሕጻን ሳለሁ
በደሌ ቢበዛም ዛሬም ዘምራለሁ

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 4
ሜልኮል ዝም አላለች ዛሬምከመተቸት
በሰገነት ሆና መዝሙሬን እያየች
ከእግዚአብሔር በላይ እኔ ምን ክብር አለኝ
ክብሬም ምስጋናዬም ለእሱ ነው ለሾመኝ

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 5
መዝሙር ምስጋናዬ መዝሙር ነው ፀሎቴ
የሚፈጸምበት ልመና መሻቴ
ማእበሉ ወጀቡ የበረታው ጭንቀት
ለስሙ እየዘመርኩ ስንቱን ጌዜ አለፍኩት

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 6
ሀይል አለው ዝማሬ ፈውስ ነው በገና
ከደዌ ከጭንቀት ይፈውሳልና
የጠላትን ሀሳብ ቅጥሩን ያፈረስኩት
ስሙን ጠርቼ ነው በበረታ ጩኸት

CHORUS
ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን',
      lyrics_transliteration = 'CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten

VERSE 1
Gena ezemralehu misgana alegn gena
Kabeqagn lezare kederesku bedehna
Estnfase eskiqom wedersu eskt’era
Widase maqreb new gibre yeene sira

CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten

VERSE 2
Keyabok wenz dar kifu simen t’alew
Lesmu edzemr edamesegnew
Tinantn alfe beqahugn lezare
Begelgela midr tewegdo newre

CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten

VERSE 3
Let’atoche selfn leejoche begena
Astemro aqomegn lesmu misgana
Lemezmur biqebagn gena hits’an salehu
Bedele bibezam zarem zemralehu

CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten

VERSE 4
Melkol zim alalech zaremkemetechet
Besegenet hona mezmuren eyayech
Keegziabher belay ene min kibir alegn
Kibrem misganayem leesu new leshomegn

CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten

VERSE 5
Mezmur misganaye mezmur new ts’elote
Yemifets’embet limena meshate
Maebelu wejebu yeberetaw ch’nqet
Lesmu eyezemerku sintun geze alefkut

CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten

VERSE 6
Heyl alew zimare fews new begena
Kedewe kech’nqet yifewsalna
Yet’elatn hesab qit’run yafereskut
Simun t’erche new bebereta ch’uኸt

CHORUS
Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zemenen-amesgenekut'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ዘመኔን አመሰገንኩት ጌታዬ
እድሜዬን አመሰገንኩት ጌታዬ
እርሱ እየሸፈነ ያደፈ ምግባሬን
ስወድቅ እያቆመ አጽንቶ ጉልበቴን

VERSE 1
ገና እዘምራለሁ ምስጋና አለኝ ገና
ካበቃኝ ለዛሬ ከደረስኩ በደህና
እስትንፋሴ እስኪቆም ወደርሱ እስክጠራ
ውዳሴ ማቅረብ ነው ግብሬ የእኔ ስራ

VERSE 2
ከያቦክ ወንዝ ዳር ክፉ ስሜን ጣለው
ለስሙ እድዘምር እዳመሰግነው
ትናንትን አልፌ በቃሁኝ ለዛሬ
በጌልጌላ ምድር ተወግዶ ነውሬ

VERSE 3
ለጣቶቼ ሰልፍን ለእጆቼ በገና
አስተምሮ አቆመኝ ለስሙ ምስጋና
ለመዝሙር ቢቀባኝ ገና ሕጻን ሳለሁ
በደሌ ቢበዛም ዛሬም ዘምራለሁ

VERSE 4
ሜልኮል ዝም አላለች ዛሬምከመተቸት
በሰገነት ሆና መዝሙሬን እያየች
ከእግዚአብሔር በላይ እኔ ምን ክብር አለኝ
ክብሬም ምስጋናዬም ለእሱ ነው ለሾመኝ

VERSE 5
መዝሙር ምስጋናዬ መዝሙር ነው ፀሎቴ
የሚፈጸምበት ልመና መሻቴ
ማእበሉ ወጀቡ የበረታው ጭንቀት
ለስሙ እየዘመርኩ ስንቱን ጌዜ አለፍኩት

VERSE 6
ሀይል አለው ዝማሬ ፈውስ ነው በገና
ከደዌ ከጭንቀት ይፈውሳልና
የጠላትን ሀሳብ ቅጥሩን ያፈረስኩት
ስሙን ጠርቼ ነው በበረታ ጩኸት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Zemenen amesegenkut Getaye
Edmeyen amesegenkut Getaye
Ersu eyeshefene yadefe migbaren
Siwedq eyaqome ats’nto gulbeten

VERSE 1
Gena ezemralehu misgana alegn gena
Kabeqagn lezare kederesku bedehna
Estnfase eskiqom wedersu eskt’era
Widase maqreb new gibre yeene sira

VERSE 2
Keyabok wenz dar kifu simen t’alew
Lesmu edzemr edamesegnew
Tinantn alfe beqahugn lezare
Begelgela midr tewegdo newre

VERSE 3
Let’atoche selfn leejoche begena
Astemro aqomegn lesmu misgana
Lemezmur biqebagn gena hits’an salehu
Bedele bibezam zarem zemralehu

VERSE 4
Melkol zim alalech zaremkemetechet
Besegenet hona mezmuren eyayech
Keegziabher belay ene min kibir alegn
Kibrem misganayem leesu new leshomegn

VERSE 5
Mezmur misganaye mezmur new ts’elote
Yemifets’embet limena meshate
Maebelu wejebu yeberetaw ch’nqet
Lesmu eyezemerku sintun geze alefkut

VERSE 6
Heyl alew zimare fews new begena
Kedewe kech’nqet yifewsalna
Yet’elatn hesab qit’run yafereskut
Simun t’erche new bebereta ch’uኸt'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zemenen-amesgenekut', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zemenish Zemene Hone (zemenish-zemene-hone)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 1
ባህር ዘን ባህር አካል ዘእም አካል
ወልድም ከእግዚአብሔር አብ ቀድመ አለም ተወልዷል
ድህራለምም ጌታ ሲወለድ ከማርያም
እመቤታችን ፍፁም ህማም የለባትም

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 2
ዘመንሽ ዘመኔ ሆነ አለ እግዚያብሐየር አብ (2)
ቅድማለም የወለደው ሲወለድ ከማርያም (2)
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት ( እግዚአብሄር አብን መስላለች)2

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 3
እርሱን ስሙት እዳለ (እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ ( ልጄን ስሙት ብላለች)2
አብም ከወልድ በቀር የለውም ሌላ ልጅ
ሀይሉ ጥበቡ እርሱ ነው የአባቱ ቀኝ እጅ

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 4
ድንግልም አልወለደች ከዚህችው ቃል በቀር
እስቄኤል በራእይ ያያት የተዘጋችው በር
ዘመንሽ ዘመኔ ሆነ አለ እግዚያብሐየር አብ (2)
ቅድማለም የወለደው ሲወለድ ከማርያም (2)

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 5
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 6
ቅድመ አለም ተወልዶ እርሱ ያለ እናት
እንድትወልድ አረጋት ድህረ አለም ያላባት
ድንግል ለሀዋርያት ይህንን አስተማረች
ባማን ወላዲት አምላክ የሚስጥሩ መዝገብ ነች

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 7
‹‹
ዘመንሽ ዘመኔ ሆነ አለ እግዚያብሐየር አብ (2)
ቅድማለም የወለደው ሲወለድ ከማርያም (2)
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 8
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2
የባህሪ አባቱ በታቦር ሲመሰክር

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 9
የምወደውን ልጄን እርሱን ስሙት ሲል ነበር
የሥጋችንን ባህሪ በእርሱዋ የነታባት
እናቱን ብላናለች እርሱን ስሙት
ዘመንሽ ዘመኔ ሆነ አለ እግዚያብሐየር አብ (2)

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 10
ቅድማለም የወለደው ሲወለድ ከማርያም (2)
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 11
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)

CHORUS
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2',
      lyrics_transliteration = 'CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 1
Bahr zen bahr akal zeem akal
Weldm keegziabher Ab qedme alem teweldwal
Dihralemm Geta siweled kemaryam
Emebetachen fits’um himam yelebatm

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 2
Zemensh zemene hone ale egziyabheyer Ab (2)
Qidmalem yeweledew siweled kemaryam (2)
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat ( egziabher abn meslalech)2

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 3
Ersun simut edale (ersu simut bilalech)2
Lijen simut edale ( lijen simut bilalech)2
Abm keweld beqer yelewm lela lij
Heylu t’bebu ersu new yeabatu qegn ej

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 4
Dinglm alweledech kezihchw qal beqer
Esqeel beraey yayat yetezegachw ber
Zemensh zemene hone ale egziyabheyer Ab (2)
Qidmalem yeweledew siweled kemaryam (2)

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 5
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 6
Qidme alem teweldo ersu yale enat
Endtweld aregat dihre alem yalabat
Dingil lehewaryat yihnn astemarech
Baman weladit amlak yemist’ru mezgeb nech

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 7
‹‹
Zemensh zemene hone ale egziyabheyer Ab (2)
Qidmalem yeweledew siweled kemaryam (2)
Dingil Maryam (egziabher abn meslalech)2

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 8
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2
Yebahri abatu betabor simesekr

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 9
Yemwedewn lijen ersun simut sil neber
Yesgachnn bahri beersuwa yenetabat
Enatun bilanalech ersun simut
Zemensh zemene hone ale egziyabheyer Ab (2)

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 10
Qidmalem yeweledew siweled kemaryam (2)
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 11
Lijen simut edale( lijen simut bilalech)

CHORUS
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zemenish-zemene-hone'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 1
ባህር ዘን ባህር አካል ዘእም አካል
ወልድም ከእግዚአብሔር አብ ቀድመ አለም ተወልዷል
ድህራለምም ጌታ ሲወለድ ከማርያም
እመቤታችን ፍፁም ህማም የለባትም

VERSE 2
ዘመንሽ ዘመኔ ሆነ አለ እግዚያብሐየር አብ (2)
ቅድማለም የወለደው ሲወለድ ከማርያም (2)
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት ( እግዚአብሄር አብን መስላለች)2

VERSE 3
እርሱን ስሙት እዳለ (እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ ( ልጄን ስሙት ብላለች)2
አብም ከወልድ በቀር የለውም ሌላ ልጅ
ሀይሉ ጥበቡ እርሱ ነው የአባቱ ቀኝ እጅ

VERSE 4
ድንግልም አልወለደች ከዚህችው ቃል በቀር
እስቄኤል በራእይ ያያት የተዘጋችው በር
ዘመንሽ ዘመኔ ሆነ አለ እግዚያብሐየር አብ (2)
ቅድማለም የወለደው ሲወለድ ከማርያም (2)

VERSE 5
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2

VERSE 6
ቅድመ አለም ተወልዶ እርሱ ያለ እናት
እንድትወልድ አረጋት ድህረ አለም ያላባት
ድንግል ለሀዋርያት ይህንን አስተማረች
ባማን ወላዲት አምላክ የሚስጥሩ መዝገብ ነች

VERSE 7
‹‹
ዘመንሽ ዘመኔ ሆነ አለ እግዚያብሐየር አብ (2)
ቅድማለም የወለደው ሲወለድ ከማርያም (2)
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2

VERSE 8
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)2
የባህሪ አባቱ በታቦር ሲመሰክር

VERSE 9
የምወደውን ልጄን እርሱን ስሙት ሲል ነበር
የሥጋችንን ባህሪ በእርሱዋ የነታባት
እናቱን ብላናለች እርሱን ስሙት
ዘመንሽ ዘመኔ ሆነ አለ እግዚያብሐየር አብ (2)

VERSE 10
ቅድማለም የወለደው ሲወለድ ከማርያም (2)
ድንግል ማርያም (እግዚአብሄር አብን መስላለች)2
ያምላኬ እናት( እግዚአብሄር አብን መስላለች)2
እርሱን ስሙት እዳለ(እርሱ ስሙት ብላለች)2

VERSE 11
ልጄን ስሙት እዳለ( ልጄን ስሙት ብላለች)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 1
Bahr zen bahr akal zeem akal
Weldm keegziabher Ab qedme alem teweldwal
Dihralemm Geta siweled kemaryam
Emebetachen fits’um himam yelebatm

VERSE 2
Zemensh zemene hone ale egziyabheyer Ab (2)
Qidmalem yeweledew siweled kemaryam (2)
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat ( egziabher abn meslalech)2

VERSE 3
Ersun simut edale (ersu simut bilalech)2
Lijen simut edale ( lijen simut bilalech)2
Abm keweld beqer yelewm lela lij
Heylu t’bebu ersu new yeabatu qegn ej

VERSE 4
Dinglm alweledech kezihchw qal beqer
Esqeel beraey yayat yetezegachw ber
Zemensh zemene hone ale egziyabheyer Ab (2)
Qidmalem yeweledew siweled kemaryam (2)

VERSE 5
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2

VERSE 6
Qidme alem teweldo ersu yale enat
Endtweld aregat dihre alem yalabat
Dingil lehewaryat yihnn astemarech
Baman weladit amlak yemist’ru mezgeb nech

VERSE 7
‹‹
Zemensh zemene hone ale egziyabheyer Ab (2)
Qidmalem yeweledew siweled kemaryam (2)
Dingil Maryam (egziabher abn meslalech)2

VERSE 8
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2
Lijen simut edale( lijen simut bilalech)2
Yebahri abatu betabor simesekr

VERSE 9
Yemwedewn lijen ersun simut sil neber
Yesgachnn bahri beersuwa yenetabat
Enatun bilanalech ersun simut
Zemensh zemene hone ale egziyabheyer Ab (2)

VERSE 10
Qidmalem yeweledew siweled kemaryam (2)
Dingil Maryam (egziabher abn meslalech)2
Yamlake enat( egziabher abn meslalech)2
Ersun simut edale(ersu simut bilalech)2

VERSE 11
Lijen simut edale( lijen simut bilalech)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zemenish-zemene-hone', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zemir Zemir Alegn (zemir-zemir-alegn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ዘምር ዘምር አለኝ ልቤ ተነሳሳ /2/
የአምላኬን ቸርነት እንዴት ብዬ ልርሳ
ያደረገልኝን እንዴት ብዬ ልርሳ

VERSE 1
የሚቃጠለው ስም በፊትህ ምንድን ነው
ሰማይ እና ምድር ሁሉም ገንዘብህ ነው
ያለኝን ሰብስቤ ባሆረው በፊትህ ዋጋ
አይሆንም ጌታ ስለቸርነትህ

CHORUS
ዘምር ዘምር አለኝ ልቤ ተነሳሳ /2/
የአምላኬን ቸርነት እንዴት ብዬ ልርሳ
ያደረገልኝን እንዴት ብዬ ልርሳ

VERSE 2
ይበዛል ይሰፋል የእግዚአብሄር ምስጋና
አይቆምም በዘመን ማዕበል ነው እና
እንኳን ድንጋይ ቀርቶ ጣርያው ቢናድብን
የከንፈሬን ፍሬ ማንም አይወስድብኝ

CHORUS
ዘምር ዘምር አለኝ ልቤ ተነሳሳ /2/
የአምላኬን ቸርነት እንዴት ብዬ ልርሳ
ያደረገልኝን እንዴት ብዬ ልርሳ

VERSE 3
የጶውሎስ የሲላስ መከራው ቢፀና
አልተውም ቅኔውን የአምላኬን ምስጋና
ሊያስጥለኝ አይችልም እስር ሰንሰለቴ
አለብኝ ውለታ ለሰማይ አባቴ

CHORUS
ዘምር ዘምር አለኝ ልቤ ተነሳሳ /2/
የአምላኬን ቸርነት እንዴት ብዬ ልርሳ
ያደረገልኝን እንዴት ብዬ ልርሳ

VERSE 4
የተደረገለት ብዙ የተቀበለ
ይኖራል በፍቅሩ እየተቃጠለ
ክብሬን ሁሉ ትቼ ልዘምርልህ
ይህ ነው ችሎታዬ ላንተ የምሰጥህ

CHORUS
ዘምር ዘምር አለኝ ልቤ ተነሳሳ /2/
የአምላኬን ቸርነት እንዴት ብዬ ልርሳ
ያደረገልኝን እንዴት ብዬ ልርሳ',
      lyrics_transliteration = 'CHORUS
Zemr zemr alegn libe tenesasa (2)
Yeamlaken chernet endet biye lirsa
Yaderegelgnn endet biye lirsa

VERSE 1
Yemiqat’elew sim befith mindn new
Semay ena midr hulum genzebh new
Yalegnn sebsbe bahorew befith waga
Ayhonm Geta silecherneth

CHORUS
Zemr zemr alegn libe tenesasa (2)
Yeamlaken chernet endet biye lirsa
Yaderegelgnn endet biye lirsa

VERSE 2
Yibezal yisefal yeegziabher misgana
Ayqomm bezemen maebel new ena
Enkwan dingay qerto t’aryaw binadbn
Yekenferen fire manm aywesdbgn

CHORUS
Zemr zemr alegn libe tenesasa (2)
Yeamlaken chernet endet biye lirsa
Yaderegelgnn endet biye lirsa

VERSE 3
Yep’owlos yesilas mekeraw bits’ena
Altewm qinewn yeamlaken misgana
Liyast’legn aychlm esr senselete
Alebgn wileta lesemay abate

CHORUS
Zemr zemr alegn libe tenesasa (2)
Yeamlaken chernet endet biye lirsa
Yaderegelgnn endet biye lirsa

VERSE 4
Yetederegelet bizu yeteqebele
Yinoral befqru eyeteqat’ele
Kibren hulu tiche lizemrlh
Yih new chlotaye lante yemset’h

CHORUS
Zemr zemr alegn libe tenesasa (2)
Yeamlaken chernet endet biye lirsa
Yaderegelgnn endet biye lirsa',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zemir-zemir-alegn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ዘምር ዘምር አለኝ ልቤ ተነሳሳ /2/
የአምላኬን ቸርነት እንዴት ብዬ ልርሳ
ያደረገልኝን እንዴት ብዬ ልርሳ

VERSE 1
የሚቃጠለው ስም በፊትህ ምንድን ነው
ሰማይ እና ምድር ሁሉም ገንዘብህ ነው
ያለኝን ሰብስቤ ባሆረው በፊትህ ዋጋ
አይሆንም ጌታ ስለቸርነትህ

VERSE 2
ይበዛል ይሰፋል የእግዚአብሄር ምስጋና
አይቆምም በዘመን ማዕበል ነው እና
እንኳን ድንጋይ ቀርቶ ጣርያው ቢናድብን
የከንፈሬን ፍሬ ማንም አይወስድብኝ

VERSE 3
የጶውሎስ የሲላስ መከራው ቢፀና
አልተውም ቅኔውን የአምላኬን ምስጋና
ሊያስጥለኝ አይችልም እስር ሰንሰለቴ
አለብኝ ውለታ ለሰማይ አባቴ

VERSE 4
የተደረገለት ብዙ የተቀበለ
ይኖራል በፍቅሩ እየተቃጠለ
ክብሬን ሁሉ ትቼ ልዘምርልህ
ይህ ነው ችሎታዬ ላንተ የምሰጥህ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Zemr zemr alegn libe tenesasa (2)
Yeamlaken chernet endet biye lirsa
Yaderegelgnn endet biye lirsa

VERSE 1
Yemiqat’elew sim befith mindn new
Semay ena midr hulum genzebh new
Yalegnn sebsbe bahorew befith waga
Ayhonm Geta silecherneth

VERSE 2
Yibezal yisefal yeegziabher misgana
Ayqomm bezemen maebel new ena
Enkwan dingay qerto t’aryaw binadbn
Yekenferen fire manm aywesdbgn

VERSE 3
Yep’owlos yesilas mekeraw bits’ena
Altewm qinewn yeamlaken misgana
Liyast’legn aychlm esr senselete
Alebgn wileta lesemay abate

VERSE 4
Yetederegelet bizu yeteqebele
Yinoral befqru eyeteqat’ele
Kibren hulu tiche lizemrlh
Yih new chlotaye lante yemset’h'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zemir-zemir-alegn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zetikat (zetikat)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ንጉሥ ነው ሲሉኝ ፍጥረታት
ተዋርዶ ኖሯል በሰው ፊት
ትላንትም ዛሬም አየን እኛ
አምላክ የሰው እረኛ

VERSE 1
ወልደ አምላክ እንኳ መሞቱ
ለእኛ ብሎ ነው ለፍጥረቱ
በመለኮቱ ይነሳል
አብነቱን ያውቃል

CHORUS
ንጉሥ ነው ሲሉኝ ፍጥረታት
ተዋርዶ ኖሯል በሰው ፊት
ትላንትም ዛሬም አየን እኛ
አምላክ የሰው እረኛ

VERSE 2
ሐምሌ በባተ በሰባት
ሥላሴ መተው ከእርሱ ቤት
አብርሃም ልጁን መረቀው
ና ተባረክ አለው

CHORUS
ንጉሥ ነው ሲሉኝ ፍጥረታት
ተዋርዶ ኖሯል በሰው ፊት
ትላንትም ዛሬም አየን እኛ
አምላክ የሰው እረኛ

VERSE 3
ቃለ አዋዲው ዮሐንስ
ተጣልቶህ ሳለ ሄሮድስ
ምትመገበው አላጣህ
ምነው ስለት በላህ

CHORUS
ንጉሥ ነው ሲሉኝ ፍጥረታት
ተዋርዶ ኖሯል በሰው ፊት
ትላንትም ዛሬም አየን እኛ
አምላክ የሰው እረኛ

VERSE 4
ሰሪው ፍጥረቱን አታለለ
በኖራ ሰራሁ እያለ
መች ይፈርስ ነበር ቤታችን
እውነት ኖራ ቢሆን

CHORUS
ንጉሥ ነው ሲሉኝ ፍጥረታት
ተዋርዶ ኖሯል በሰው ፊት
ትላንትም ዛሬም አየን እኛ
አምላክ የሰው እረኛ

VERSE 5
ያፈራል ያልነው አትክልት
ጠወለገ አሉኝ በጠዋት
እስኪ እባካችሁ ዘር አትርፉ
ወጣት አበቦች ረገፉ

CHORUS
ንጉሥ ነው ሲሉኝ ፍጥረታት
ተዋርዶ ኖሯል በሰው ፊት
ትላንትም ዛሬም አየን እኛ
አምላክ የሰው እረኛ

VERSE 6
በደሌ በዝቶ ተጨነቅሁ
እንዴት አማላጅ ሰው አጣሁ
ወንድምና እህት መቼ አለህ
አንተ ሰው በናትህ።

CHORUS
ንጉሥ ነው ሲሉኝ ፍጥረታት
ተዋርዶ ኖሯል በሰው ፊት
ትላንትም ዛሬም አየን እኛ
አምላክ የሰው እረኛ',
      lyrics_transliteration = 'CHORUS
Nigus new silugn fit’retat
Tewardo norwal besew fit
Tilantm zarem ayen egna
Amlak yesew eregna

VERSE 1
Welde amlak enkwa memotu
Leegna bilo new left’retu
Bemelekotu yinesal
Abnetun yawqal

CHORUS
Nigus new silugn fit’retat
Tewardo norwal besew fit
Tilantm zarem ayen egna
Amlak yesew eregna

VERSE 2
Hemle bebate besebat
Silassie metew keersu bet
Abrham lijun mereqew
Na tebarek alew

CHORUS
Nigus new silugn fit’retat
Tewardo norwal besew fit
Tilantm zarem ayen egna
Amlak yesew eregna

VERSE 3
Qale awadiw yohens
Tet’altoh sale herods
Mitmegebew alat’ah
Minew silet belah

CHORUS
Nigus new silugn fit’retat
Tewardo norwal besew fit
Tilantm zarem ayen egna
Amlak yesew eregna

VERSE 4
Seriw fit’retun atalele
Benora serahu eyale
Mech yifers neber betachn
Ewnet nora bihon

CHORUS
Nigus new silugn fit’retat
Tewardo norwal besew fit
Tilantm zarem ayen egna
Amlak yesew eregna

VERSE 5
Yaferal yalnew atklt
T’ewelege alugn bet’ewat
Eski ebakachhu zer atrfu
Wet’at abeboch regefu

CHORUS
Nigus new silugn fit’retat
Tewardo norwal besew fit
Tilantm zarem ayen egna
Amlak yesew eregna

VERSE 6
Bedele bezto tech’eneqhu
Endet amalaj sew at’ahu
Wendmna eht meche aleh
Ante sew benath.

CHORUS
Nigus new silugn fit’retat
Tewardo norwal besew fit
Tilantm zarem ayen egna
Amlak yesew eregna',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zetikat'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ንጉሥ ነው ሲሉኝ ፍጥረታት
ተዋርዶ ኖሯል በሰው ፊት
ትላንትም ዛሬም አየን እኛ
አምላክ የሰው እረኛ

VERSE 1
ወልደ አምላክ እንኳ መሞቱ
ለእኛ ብሎ ነው ለፍጥረቱ
በመለኮቱ ይነሳል
አብነቱን ያውቃል

VERSE 2
ሐምሌ በባተ በሰባት
ሥላሴ መተው ከእርሱ ቤት
አብርሃም ልጁን መረቀው
ና ተባረክ አለው

VERSE 3
ቃለ አዋዲው ዮሐንስ
ተጣልቶህ ሳለ ሄሮድስ
ምትመገበው አላጣህ
ምነው ስለት በላህ

VERSE 4
ሰሪው ፍጥረቱን አታለለ
በኖራ ሰራሁ እያለ
መች ይፈርስ ነበር ቤታችን
እውነት ኖራ ቢሆን

VERSE 5
ያፈራል ያልነው አትክልት
ጠወለገ አሉኝ በጠዋት
እስኪ እባካችሁ ዘር አትርፉ
ወጣት አበቦች ረገፉ

VERSE 6
በደሌ በዝቶ ተጨነቅሁ
እንዴት አማላጅ ሰው አጣሁ
ወንድምና እህት መቼ አለህ
አንተ ሰው በናትህ።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Nigus new silugn fit’retat
Tewardo norwal besew fit
Tilantm zarem ayen egna
Amlak yesew eregna

VERSE 1
Welde amlak enkwa memotu
Leegna bilo new left’retu
Bemelekotu yinesal
Abnetun yawqal

VERSE 2
Hemle bebate besebat
Silassie metew keersu bet
Abrham lijun mereqew
Na tebarek alew

VERSE 3
Qale awadiw yohens
Tet’altoh sale herods
Mitmegebew alat’ah
Minew silet belah

VERSE 4
Seriw fit’retun atalele
Benora serahu eyale
Mech yifers neber betachn
Ewnet nora bihon

VERSE 5
Yaferal yalnew atklt
T’ewelege alugn bet’ewat
Eski ebakachhu zer atrfu
Wet’at abeboch regefu

VERSE 6
Bedele bezto tech’eneqhu
Endet amalaj sew at’ahu
Wendmna eht meche aleh
Ante sew benath.'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zetikat', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zewerede (zewerede-3043)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ዘወረደ እምላዕሉ
መድኃኒተ ኩሉ
ወወረደ እምሰማያት
ቤዛ ኩሉ ፍጥረት

VERSE 1
በአባቱ ፈቃድ በመንፈስ ቅዱስም
በፈቃዱ ታየ ኢየሱስ በሚል ስም
አካላዊ ቃል ነው ከላይ የወረደ
አዳምን በሞቱ ሊያድን የወደደ

CHORUS
ዘወረደ እምላዕሉ
መድኃኒተ ኩሉ
ወወረደ እምሰማያት
ቤዛ ኩሉ ፍጥረት

VERSE 2
ከዙፋኑ መጣ ከአባቱ ሳይለይ
በድንግል አደረ የማይታይ ሊታይ
ትንቢተ ነቢያት ይኸው ተፈጸመ
እርቀ አዳም ሆነ ሕይወት ለመለመ

CHORUS
ዘወረደ እምላዕሉ
መድኃኒተ ኩሉ
ወወረደ እምሰማያት
ቤዛ ኩሉ ፍጥረት

VERSE 3
ምን ይሆን ምስጢሩ ከሰማይ መውረድህ
ከመላእክት አይደል ከሰው መወለድህ
እንዴትስ ብትወደን ካንተ የተዛመድነው
ሰውን ታስበው ዘንድ የሰው ልጅ ምንድነው

CHORUS
ዘወረደ እምላዕሉ
መድኃኒተ ኩሉ
ወወረደ እምሰማያት
ቤዛ ኩሉ ፍጥረት

VERSE 4
እውነተኛ ፍቅር ከሰማይ ያወርዳል
አማናዊ ፍቅር ኃጥእ ያስወድዳል
በዚህ ፍቅር አክመኝ ዳግመኛ ልወለድ
ከጎኔ ያሉትን ወንድሞቼን ልውደድ

CHORUS
ዘወረደ እምላዕሉ
መድኃኒተ ኩሉ
ወወረደ እምሰማያት
ቤዛ ኩሉ ፍጥረት',
      lyrics_transliteration = 'CHORUS
Zewerede emlaelu
Medhanite kulu
Wewerede emsemayat
Beza kulu fit’ret

VERSE 1
Beabatu feqad bemenfes qidusm
Befeqadu taye Iyesus bemil sim
Akalawi qal new kelay yewerede
Adamn bemotu liyadn yewedede

CHORUS
Zewerede emlaelu
Medhanite kulu
Wewerede emsemayat
Beza kulu fit’ret

VERSE 2
Kezufanu met’a keabatu sayley
Bedngl adere yemaytay litay
Tinbite nebiyat yiኸw tefets’eme
Erqe adam hone hiywet lemeleme

CHORUS
Zewerede emlaelu
Medhanite kulu
Wewerede emsemayat
Beza kulu fit’ret

VERSE 3
Min yihon mist’iru kesemay mewredh
Kemelaekt aydel kesew meweledh
Endets bitweden kante yetezamednew
Sewn tasbew zend yesew lij mindnew

CHORUS
Zewerede emlaelu
Medhanite kulu
Wewerede emsemayat
Beza kulu fit’ret

VERSE 4
Ewnetegna fiqr kesemay yawerdal
Amanawi fiqr hat’e yasweddal
Bezih fiqr akmegn dagmegna liweled
Kegone yalutn wendmochen liwded

CHORUS
Zewerede emlaelu
Medhanite kulu
Wewerede emsemayat
Beza kulu fit’ret',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zewerede-3043'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ዘወረደ እምላዕሉ
መድኃኒተ ኩሉ
ወወረደ እምሰማያት
ቤዛ ኩሉ ፍጥረት

VERSE 1
በአባቱ ፈቃድ በመንፈስ ቅዱስም
በፈቃዱ ታየ ኢየሱስ በሚል ስም
አካላዊ ቃል ነው ከላይ የወረደ
አዳምን በሞቱ ሊያድን የወደደ

VERSE 2
ከዙፋኑ መጣ ከአባቱ ሳይለይ
በድንግል አደረ የማይታይ ሊታይ
ትንቢተ ነቢያት ይኸው ተፈጸመ
እርቀ አዳም ሆነ ሕይወት ለመለመ

VERSE 3
ምን ይሆን ምስጢሩ ከሰማይ መውረድህ
ከመላእክት አይደል ከሰው መወለድህ
እንዴትስ ብትወደን ካንተ የተዛመድነው
ሰውን ታስበው ዘንድ የሰው ልጅ ምንድነው

VERSE 4
እውነተኛ ፍቅር ከሰማይ ያወርዳል
አማናዊ ፍቅር ኃጥእ ያስወድዳል
በዚህ ፍቅር አክመኝ ዳግመኛ ልወለድ
ከጎኔ ያሉትን ወንድሞቼን ልውደድ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Zewerede emlaelu
Medhanite kulu
Wewerede emsemayat
Beza kulu fit’ret

VERSE 1
Beabatu feqad bemenfes qidusm
Befeqadu taye Iyesus bemil sim
Akalawi qal new kelay yewerede
Adamn bemotu liyadn yewedede

VERSE 2
Kezufanu met’a keabatu sayley
Bedngl adere yemaytay litay
Tinbite nebiyat yiኸw tefets’eme
Erqe adam hone hiywet lemeleme

VERSE 3
Min yihon mist’iru kesemay mewredh
Kemelaekt aydel kesew meweledh
Endets bitweden kante yetezamednew
Sewn tasbew zend yesew lij mindnew

VERSE 4
Ewnetegna fiqr kesemay yawerdal
Amanawi fiqr hat’e yasweddal
Bezih fiqr akmegn dagmegna liweled
Kegone yalutn wendmochen liwded'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zewerede-3043', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zewitir Bikefagn (zewitir-bikefagn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ዘውትር (ሁሌም) ሲከፋኝ ደጅሽ መጥቼ እጽናናለሁ
ያላንቺ የለኝም ብሶቴን የምነግረው
እዘኝልኝ ድንግል ራርተሽ ስሚኝ ስማጸንሽ
ድንግል ክብሬ ለእኔ ነሽ የሀዘኔ ደራሽ

VERSE 1
አስጨናቂው ዓለም ከፊቴ ድቅን ቢልብኝ
የመከራ ወጀብ አየሩ ዙሪያዬን ቢከበኝ
መውጫ ቀዳዳ አጥቼ ስባዝን ስቸገር
እጄን ይዘሽ ምሪኝ እናቴ ካንቺ ጋራ ልኑር

CHORUS
ዘውትር (ሁሌም) ሲከፋኝ ደጅሽ መጥቼ እጽናናለሁ
ያላንቺ የለኝም ብሶቴን የምነግረው
እዘኝልኝ ድንግል ራርተሽ ስሚኝ ስማጸንሽ
ድንግል ክብሬ ለእኔ ነሽ የሀዘኔ ደራሽ

VERSE 2
ሀዘን ያጎበጠው ኑሮዬ በፍርሃት ተሞልቷል
ለማንስ ልንገረው የልቤን የኔስ እጅግ ከብዷል
ጽናት ያጣው ልቤን አበርቺው በጸጋሽ ጎብኚና
ከኔ ዘንድ አርቂው ብሶቴን ከፊቴ ቁሚና

CHORUS
ዘውትር (ሁሌም) ሲከፋኝ ደጅሽ መጥቼ እጽናናለሁ
ያላንቺ የለኝም ብሶቴን የምነግረው
እዘኝልኝ ድንግል ራርተሽ ስሚኝ ስማጸንሽ
ድንግል ክብሬ ለእኔ ነሽ የሀዘኔ ደራሽ

VERSE 3
የምቆጥረው ነገር ዙሪያዬ ወገንም የለኝ
ለችግሬ ደርሶ ከጎኔ አለው የሚለኝ
ይህን ክፉ ጊዜ አሻግሪኝ ድልድዬ ሁኚና
በእጆችሽ ይደገፍ ጉልበቴ ልቁም ልበርታና

CHORUS
ዘውትር (ሁሌም) ሲከፋኝ ደጅሽ መጥቼ እጽናናለሁ
ያላንቺ የለኝም ብሶቴን የምነግረው
እዘኝልኝ ድንግል ራርተሽ ስሚኝ ስማጸንሽ
ድንግል ክብሬ ለእኔ ነሽ የሀዘኔ ደራሽ

VERSE 4
የሞት ሆኗል የኔስ መንገዴ የበዛው ፈተና
ቀና ብዬ ማየት አልቻልኩም ስብራቴ ጸና
እንደምን ይፈወስ ህመሜ ከሰው ፊት ያራቀኝ
በጨለመዉ ቤቴ ግቢና ይሙላ የጎደለኝ

CHORUS
ዘውትር (ሁሌም) ሲከፋኝ ደጅሽ መጥቼ እጽናናለሁ
ያላንቺ የለኝም ብሶቴን የምነግረው
እዘኝልኝ ድንግል ራርተሽ ስሚኝ ስማጸንሽ
ድንግል ክብሬ ለእኔ ነሽ የሀዘኔ ደራሽ',
      lyrics_transliteration = 'CHORUS
Zewtr (hulem) sikefagn dejsh met’che ets’nanalehu
Yalanchi yelegnm bisoten yemnegrew
Ezegnlgn Dingil rartesh simign simats’ensh
Dingil kibre leene nesh yehezene derash

VERSE 1
Asch’enaqiw alem kefite diqn bilbgn
Yemekera wejeb ayeru zuriyayen bikebegn
Mewch’a qedada at’che sibazn sicheger
Ejen yizesh mirign enate kanchi gara linur

CHORUS
Zewtr (hulem) sikefagn dejsh met’che ets’nanalehu
Yalanchi yelegnm bisoten yemnegrew
Ezegnlgn Dingil rartesh simign simats’ensh
Dingil kibre leene nesh yehezene derash

VERSE 2
Hezen yagobet’ew nuroye befrhat temoltwal
Lemans lingerew yelben yenes ejg kebdwal
Ts’nat yat’aw liben aberchiw bets’egash gobgnina
Kene zend arqiw bisoten kefite qumina

CHORUS
Zewtr (hulem) sikefagn dejsh met’che ets’nanalehu
Yalanchi yelegnm bisoten yemnegrew
Ezegnlgn Dingil rartesh simign simats’ensh
Dingil kibre leene nesh yehezene derash

VERSE 3
Yemqot’rew neger zuriyaye wegenm yelegn
Lechgre derso kegone alew yemilegn
Yihn kifu gize ashagrign dildye hugnina
Beejochsh yidegef gulbete liqum libertana

CHORUS
Zewtr (hulem) sikefagn dejsh met’che ets’nanalehu
Yalanchi yelegnm bisoten yemnegrew
Ezegnlgn Dingil rartesh simign simats’ensh
Dingil kibre leene nesh yehezene derash

VERSE 4
Yemot honwal yenes mengede yebezaw fetena
Qena biye mayet alchalkum sibrate ts’ena
Endemn yifewes himeme kesew fit yaraqegn
Bech’elemewu bete gibina yimula yegodelegn

CHORUS
Zewtr (hulem) sikefagn dejsh met’che ets’nanalehu
Yalanchi yelegnm bisoten yemnegrew
Ezegnlgn Dingil rartesh simign simats’ensh
Dingil kibre leene nesh yehezene derash',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zewitir-bikefagn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ዘውትር (ሁሌም) ሲከፋኝ ደጅሽ መጥቼ እጽናናለሁ
ያላንቺ የለኝም ብሶቴን የምነግረው
እዘኝልኝ ድንግል ራርተሽ ስሚኝ ስማጸንሽ
ድንግል ክብሬ ለእኔ ነሽ የሀዘኔ ደራሽ

VERSE 1
አስጨናቂው ዓለም ከፊቴ ድቅን ቢልብኝ
የመከራ ወጀብ አየሩ ዙሪያዬን ቢከበኝ
መውጫ ቀዳዳ አጥቼ ስባዝን ስቸገር
እጄን ይዘሽ ምሪኝ እናቴ ካንቺ ጋራ ልኑር

VERSE 2
ሀዘን ያጎበጠው ኑሮዬ በፍርሃት ተሞልቷል
ለማንስ ልንገረው የልቤን የኔስ እጅግ ከብዷል
ጽናት ያጣው ልቤን አበርቺው በጸጋሽ ጎብኚና
ከኔ ዘንድ አርቂው ብሶቴን ከፊቴ ቁሚና

VERSE 3
የምቆጥረው ነገር ዙሪያዬ ወገንም የለኝ
ለችግሬ ደርሶ ከጎኔ አለው የሚለኝ
ይህን ክፉ ጊዜ አሻግሪኝ ድልድዬ ሁኚና
በእጆችሽ ይደገፍ ጉልበቴ ልቁም ልበርታና

VERSE 4
የሞት ሆኗል የኔስ መንገዴ የበዛው ፈተና
ቀና ብዬ ማየት አልቻልኩም ስብራቴ ጸና
እንደምን ይፈወስ ህመሜ ከሰው ፊት ያራቀኝ
በጨለመዉ ቤቴ ግቢና ይሙላ የጎደለኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Zewtr (hulem) sikefagn dejsh met’che ets’nanalehu
Yalanchi yelegnm bisoten yemnegrew
Ezegnlgn Dingil rartesh simign simats’ensh
Dingil kibre leene nesh yehezene derash

VERSE 1
Asch’enaqiw alem kefite diqn bilbgn
Yemekera wejeb ayeru zuriyayen bikebegn
Mewch’a qedada at’che sibazn sicheger
Ejen yizesh mirign enate kanchi gara linur

VERSE 2
Hezen yagobet’ew nuroye befrhat temoltwal
Lemans lingerew yelben yenes ejg kebdwal
Ts’nat yat’aw liben aberchiw bets’egash gobgnina
Kene zend arqiw bisoten kefite qumina

VERSE 3
Yemqot’rew neger zuriyaye wegenm yelegn
Lechgre derso kegone alew yemilegn
Yihn kifu gize ashagrign dildye hugnina
Beejochsh yidegef gulbete liqum libertana

VERSE 4
Yemot honwal yenes mengede yebezaw fetena
Qena biye mayet alchalkum sibrate ts’ena
Endemn yifewes himeme kesew fit yaraqegn
Bech’elemewu bete gibina yimula yegodelegn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zewitir-bikefagn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zik Biye Lamesiginew (zik-biye-lamesiginew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 1
ምን አገኘ ሰው ይለኛል ፤
ላያኖረኝ ይጨነቃል ።
መኖሪያዬ በሰማይ ፤
አባት አለኝ ኤልሻዳይ ።

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 2
አባት እና ንጉስ ፤
ጌታ ቅዱስ ለነብስ ፤
ሕይወቴ ነው ክርስቶስ ።
ተራመድኩኝ በጉልበቴ ፤

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 3
ስላቆመኝ ደጉ አባቴ ።
እሩቅ አይደል ቅርቤ ላለው ፤
ምስጋናዬ ለእርሱ ይድረሰው ።
አባት እና ንጉስ ፤

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 4
ጌታ ቅዱስ ለነብስ ፤
ሕይወቴ ነው ክርስቶስ ።
የከበረ የተፈራ ፤
ምሕረት ያለው የሚራራ ።

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 5
ያገኘኝን አይቻለሁ ፤
ሞት አያዬኝ ፊቱ እያለሁ ።
አባት እና ንጉስ ፤
ጌታ ቅዱስ ለነብስ ፤

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 6
ሕይወቴ ነው ክርስቶስ ።
ርህራሄው ስላኖረኝ ፤
ከሰው ድንኳን ሞት ትርፍ አለኝ ።
የእኔስ ጌታ ያስደንቃል ፤

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 7
በልቤ ላይ ቤቱን ሰርቷል ።
አባት እና ንጉስ ፤
ጌታ ቅዱስ ለነብስ ፤
ሕይወቴ ነው ክርስቶስ ።

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 8
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

CHORUS
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።',
      lyrics_transliteration = 'CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 1
Min agegne sew yilegnal ;
Layanoregn yich’eneqal .
Menoriyaye besemay ;
Abat alegn elshaday .

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 2
Abat ena nigus ;
Geta Kidus lenebs ;
Hiywete new Kristos .
Teramedkugn begulbete ;

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 3
Silaqomegn degu abate .
Eruq aydel qirbe lalew ;
Misganaye leersu yidresew .
Abat ena nigus ;

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 4
Geta Kidus lenebs ;
Hiywete new Kristos .
Yekebere yetefera ;
Mihret yalew yemirara .

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 5
Yagegnegnn aychalehu ;
Mot ayayegn fitu eyalehu .
Abat ena nigus ;
Geta Kidus lenebs ;

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 6
Hiywete new Kristos .
Rihrahew silanoregn ;
Kesew dinkwan mot tirf alegn .
Yeenes Geta yasdenqal ;

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 7
Belbe lay betun sertwal .
Abat ena nigus ;
Geta Kidus lenebs ;
Hiywete new Kristos .

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 8
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

CHORUS
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zik-biye-lamesiginew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።

VERSE 1
ምን አገኘ ሰው ይለኛል ፤
ላያኖረኝ ይጨነቃል ።
መኖሪያዬ በሰማይ ፤
አባት አለኝ ኤልሻዳይ ።

VERSE 2
አባት እና ንጉስ ፤
ጌታ ቅዱስ ለነብስ ፤
ሕይወቴ ነው ክርስቶስ ።
ተራመድኩኝ በጉልበቴ ፤

VERSE 3
ስላቆመኝ ደጉ አባቴ ።
እሩቅ አይደል ቅርቤ ላለው ፤
ምስጋናዬ ለእርሱ ይድረሰው ።
አባት እና ንጉስ ፤

VERSE 4
ጌታ ቅዱስ ለነብስ ፤
ሕይወቴ ነው ክርስቶስ ።
የከበረ የተፈራ ፤
ምሕረት ያለው የሚራራ ።

VERSE 5
ያገኘኝን አይቻለሁ ፤
ሞት አያዬኝ ፊቱ እያለሁ ።
አባት እና ንጉስ ፤
ጌታ ቅዱስ ለነብስ ፤

VERSE 6
ሕይወቴ ነው ክርስቶስ ።
ርህራሄው ስላኖረኝ ፤
ከሰው ድንኳን ሞት ትርፍ አለኝ ።
የእኔስ ጌታ ያስደንቃል ፤

VERSE 7
በልቤ ላይ ቤቱን ሰርቷል ።
አባት እና ንጉስ ፤
ጌታ ቅዱስ ለነብስ ፤
ሕይወቴ ነው ክርስቶስ ።

VERSE 8
ዝቅ ብዬ ላመስግነው ፤
ጉልበቴ ነው ላወድሰው ።
የፍቅሩ እሳት ልቤን ነክቷል ፤
የድል ዜማ በአፌ ሞልቷል ።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .

VERSE 1
Min agegne sew yilegnal ;
Layanoregn yich’eneqal .
Menoriyaye besemay ;
Abat alegn elshaday .

VERSE 2
Abat ena nigus ;
Geta Kidus lenebs ;
Hiywete new Kristos .
Teramedkugn begulbete ;

VERSE 3
Silaqomegn degu abate .
Eruq aydel qirbe lalew ;
Misganaye leersu yidresew .
Abat ena nigus ;

VERSE 4
Geta Kidus lenebs ;
Hiywete new Kristos .
Yekebere yetefera ;
Mihret yalew yemirara .

VERSE 5
Yagegnegnn aychalehu ;
Mot ayayegn fitu eyalehu .
Abat ena nigus ;
Geta Kidus lenebs ;

VERSE 6
Hiywete new Kristos .
Rihrahew silanoregn ;
Kesew dinkwan mot tirf alegn .
Yeenes Geta yasdenqal ;

VERSE 7
Belbe lay betun sertwal .
Abat ena nigus ;
Geta Kidus lenebs ;
Hiywete new Kristos .

VERSE 8
Ziq biye lamesgnew ;
Gulbete new lawedsew .
Yefqru esat liben nektwal ;
Yedl zema beafe moltwal .'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zik-biye-lamesiginew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn rollback: Zm. Mirtnesh (zm-mirtnesh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 1
ስንቱን ኣለፍኩት ስንቱን መከራ
ለካ ሲያልፍ ቀን ሁሉም ይረሳል
ርሐብ ስደቱን ማን ያስታውሳል
ኣዝ

CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 2
ጽዋዬን ባርከህ ተትረፈረፈ
የጠላቴም ጦር በላዬ ኣለፈ
በሺ ቃላቶች ኣፌን ሞልቼ
ልዘምርልህ ጉያህ ገብቼ

CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 3
ኣዝ
ገዳዬ ቢሮጥ በቀን በማታ
እያለ ኣንድዬ እያለ ጌታ
ለሞት ኣልተኛም ቢደነቅ ኣለም

CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 4
ተክሎኛልና ለዘለ ኣለም
ኣዝ
ምስጋና ሆኖ ምግቤ መጠጤ
ተቀጣጠለ ፍቅርህ በውስጤ

CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 5
ኣላቀረቅር ኣልደፋ ኣንገቴን
እሞላዋለው በእልልታ ቤቴን
ኣዝ

CHORUS
ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ',
      lyrics_transliteration = 'CHORUS
Yalante Geta desta mech ale yalante amlake hiwet mech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane
Ejochen yizeh ante eyemerah

VERSE 1
Sintun alefkut sintun mekera
Leka siyalf qen hulum yiresal
Riheb sidetun man yastawsal
Az

CHORUS
Yalante Geta desta mech ale yalante amlake hiwet mech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane
Ejochen yizeh ante eyemerah

VERSE 2
Ts’wayen barkeh tetreferefe
Yet’elatem t’or belaye alefe
Beshi qalatoch afen molche
Lizemrlh guyah gebche

CHORUS
Yalante Geta desta mech ale yalante amlake hiwet mech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane
Ejochen yizeh ante eyemerah

VERSE 3
Az
Gedaye birot’ beqen bemata
Eyale andye eyale Geta
Lemot altegnam bideneq alem

CHORUS
Yalante Geta desta mech ale yalante amlake hiwet mech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane
Ejochen yizeh ante eyemerah

VERSE 4
Teklognalna lezele alem
Az
Misgana hono migbe met’et’e
Teqet’at’ele fiqrh bewst’e

CHORUS
Yalante Geta desta mech ale yalante amlake hiwet mech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane
Ejochen yizeh ante eyemerah

VERSE 5
Alaqereqr aldefa angeten
Emolawalew beellta beten
Az

CHORUS
Yalante Geta desta mech ale yalante amlake hiwet mech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane
Ejochen yizeh ante eyemerah',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'zm-mirtnesh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
ስምህን ጠርቶ የተማጸነ
ከእሳቱም ወጣ ከሞትም ዳነ
እጆቼን ይዘህ ኣንተ እየመራህ

VERSE 1
ስንቱን ኣለፍኩት ስንቱን መከራ
ለካ ሲያልፍ ቀን ሁሉም ይረሳል
ርሐብ ስደቱን ማን ያስታውሳል
ኣዝ

VERSE 2
ጽዋዬን ባርከህ ተትረፈረፈ
የጠላቴም ጦር በላዬ ኣለፈ
በሺ ቃላቶች ኣፌን ሞልቼ
ልዘምርልህ ጉያህ ገብቼ

VERSE 3
ኣዝ
ገዳዬ ቢሮጥ በቀን በማታ
እያለ ኣንድዬ እያለ ጌታ
ለሞት ኣልተኛም ቢደነቅ ኣለም

VERSE 4
ተክሎኛልና ለዘለ ኣለም
ኣዝ
ምስጋና ሆኖ ምግቤ መጠጤ
ተቀጣጠለ ፍቅርህ በውስጤ

VERSE 5
ኣላቀረቅር ኣልደፋ ኣንገቴን
እሞላዋለው በእልልታ ቤቴን
ኣዝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yalante Geta desta mech ale yalante amlake hiwet mech ale
Simhn t’erto yetemats’ene
Keesatum wet’a kemotm dane
Ejochen yizeh ante eyemerah

VERSE 1
Sintun alefkut sintun mekera
Leka siyalf qen hulum yiresal
Riheb sidetun man yastawsal
Az

VERSE 2
Ts’wayen barkeh tetreferefe
Yet’elatem t’or belaye alefe
Beshi qalatoch afen molche
Lizemrlh guyah gebche

VERSE 3
Az
Gedaye birot’ beqen bemata
Eyale andye eyale Geta
Lemot altegnam bideneq alem

VERSE 4
Teklognalna lezele alem
Az
Misgana hono migbe met’et’e
Teqet’at’ele fiqrh bewst’e

VERSE 5
Alaqereqr aldefa angeten
Emolawalew beellta beten
Az'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', 'zm-mirtnesh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  IF v_total <> 89 THEN
    RAISE EXCEPTION 'Rollback batch 10 count mismatch: expected 89, got %', v_total;
  END IF;

  RAISE NOTICE 'SUCCESS: Rollback batch 10 completed: % hymns restored.', v_total;
END $rollback_batch_10$;
