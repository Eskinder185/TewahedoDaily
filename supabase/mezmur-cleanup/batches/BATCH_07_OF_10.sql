-- =========================================================================
-- BATCH 07 of 10: 100 Hymns (601 to 700)
-- Target: public.mezmur_data_import
-- Strict 5-Column Concurrency Check + Atomic Transaction
-- =========================================================================

DO $batch_07$
DECLARE
  v_updated integer := 0;
  v_total integer := 0;
BEGIN

  -- Hymn: Meskelun Sisalem Orthodox Tewahido Song Zemari Hawaz Tegegn (meskelun-sisalem-orthodox-tewahido-song-zemari-hawaz-tegegn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 1
ባርከኒ በመስቀልከ ክቡር
ሃሳቤ ታውሮ በምኞት ተጋርዶ
አይነ ህሊናዬ ወደ ተምና ወርዶ
ደጄን እያንካካህ ሣለህ ከበራፌ

VERSE 2
ለበደል ስጀግን ለጽድቅህ ሰንፌ
አሁን ግን መለስከኝ ግርዶሹ ገፈፈ
የመስቀልህ ብርሃን ሞቴን አሸነፈ
ተስፋ የተለየው የራቀው ደስታ

VERSE 3
ነውር ያደቀቀው ለአለም የተረታ
ሆኜ እንዳልነበር የአመጽ ጦር እቃ
ሳልጠፋ ታደግኸኝ ቀኔ ሳያበቃ
አጋጣሚ አይደለም ፈቅደህ ነው ጌታዬ

VERSE 4
በመስቀልህ ቀረ የውድቀት ጉዞዬ
ካህኑ መዳፍ ላይ ሳየው መስቀልህን
ድቅን አለ በአይኔ ሳልኩት ችንካርህን
የእሾህ አክሊል ጦሩ ጅራፍ ግርፋቱ

VERSE 5
ስለሕይወቴ ነው እንዳልቀር በከንቱ
ቅዱስ ምልክትህ ሆነልኝ መዳኛ
መስቀልህ አርገኝ የፍቅርህ ምርኮኛ
የተጣለች ነፍሴ በደምህ ተዋጅታ

VERSE 6
አሁን አዲስ ነው ነኝ ቸርነትህ በዝታ
አለምም ለእኔ እኔም ለአለም ሞትኩ
አምላኬ በቤትህ ለመኖር ተመረጥኩ
እግሮቼ ከእንግዲህ ላንተ ይሮጣሉ

VERSE 7
ቃላቶቼ ፍቅርህን ይመስከራሉ
ኢየሱስ ስምህን በእምነት እጠራለሁ
ቅዱስ መስቀልህን እሳለመዋለሁ',
      lyrics_transliteration = 'Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 1
Barkeni bemesqelke kibur
Hasabe tawro bemgnot tegardo
Ayne hilinaye wede temna werdo
Dejen eyankakah saleh keberafe

VERSE 2
Lebedel sijegn lets’dqh senfe
Ahun gin meleskegn girdoshu gefefe
Yemesqelh birhan moten ashenefe
Tesfa yeteleyew yeraqew desta

VERSE 3
Newr yadeqeqew lealem yetereta
Hogne endalneber yeamets’ t’or eqa
Salt’efa tadegኸgn qene sayabeqa
Agat’ami aydelem feqdeh new Getaye

VERSE 4
Bemesqelh qere yewdqet guzoye
Kahnu medaf lay sayew mesqelhn
Diqn ale beayne salkut chnkarhn
Yeeshoh aklil t’oru jiraf girfatu

VERSE 5
Silehywete new endalqer bekentu
Kidus milkth honelgn medagna
Mesqelh argegn yefqrh mirkogna
Yetet’alech nefse bedemh tewajta

VERSE 6
Ahun adis new negn cherneth bezta
Alemm leene enem lealem motku
Amlake bebeth lemenor temeret’ku
Egroche keengdih lante yirot’alu

VERSE 7
Qalatoche fiqrhn yimeskeralu
Iyesus simhn beemnet et’eralehu
Kidus mesqelhn esalemewalehu',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'meskelun-sisalem-orthodox-tewahido-song-zemari-hawaz-tegegn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 1
ባርከኒ በመስቀልከ ክቡር
ሃሳቤ ታውሮ በምኞት ተጋርዶ
አይነ ህሊናዬ ወደ ተምና ወርዶ
ደጄን እያንካካህ ሣለህ ከበራፌ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 2
ለበደል ስጀግን ለጽድቅህ ሰንፌ
አሁን ግን መለስከኝ ግርዶሹ ገፈፈ
የመስቀልህ ብርሃን ሞቴን አሸነፈ
ተስፋ የተለየው የራቀው ደስታ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 3
ነውር ያደቀቀው ለአለም የተረታ
ሆኜ እንዳልነበር የአመጽ ጦር እቃ
ሳልጠፋ ታደግኸኝ ቀኔ ሳያበቃ
አጋጣሚ አይደለም ፈቅደህ ነው ጌታዬ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 4
በመስቀልህ ቀረ የውድቀት ጉዞዬ
ካህኑ መዳፍ ላይ ሳየው መስቀልህን
ድቅን አለ በአይኔ ሳልኩት ችንካርህን
የእሾህ አክሊል ጦሩ ጅራፍ ግርፋቱ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 5
ስለሕይወቴ ነው እንዳልቀር በከንቱ
ቅዱስ ምልክትህ ሆነልኝ መዳኛ
መስቀልህ አርገኝ የፍቅርህ ምርኮኛ
የተጣለች ነፍሴ በደምህ ተዋጅታ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 6
አሁን አዲስ ነው ነኝ ቸርነትህ በዝታ
አለምም ለእኔ እኔም ለአለም ሞትኩ
አምላኬ በቤትህ ለመኖር ተመረጥኩ
እግሮቼ ከእንግዲህ ላንተ ይሮጣሉ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ

VERSE 7
ቃላቶቼ ፍቅርህን ይመስከራሉ
ኢየሱስ ስምህን በእምነት እጠራለሁ
ቅዱስ መስቀልህን እሳለመዋለሁ

CHORUS
አይኔ ላይ ተሣለ ርህራሄ ፍቅሩ
ጦር የወጋው ጎኑ ታወሠኝ ችንካሩ
ለአመጽ ያስቸኮለኝ አሳች ተሠደደ
መስቀሉን ስሳለም ልቤ ሠማይ ሄደ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 1
Barkeni bemesqelke kibur
Hasabe tawro bemgnot tegardo
Ayne hilinaye wede temna werdo
Dejen eyankakah saleh keberafe

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 2
Lebedel sijegn lets’dqh senfe
Ahun gin meleskegn girdoshu gefefe
Yemesqelh birhan moten ashenefe
Tesfa yeteleyew yeraqew desta

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 3
Newr yadeqeqew lealem yetereta
Hogne endalneber yeamets’ t’or eqa
Salt’efa tadegኸgn qene sayabeqa
Agat’ami aydelem feqdeh new Getaye

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 4
Bemesqelh qere yewdqet guzoye
Kahnu medaf lay sayew mesqelhn
Diqn ale beayne salkut chnkarhn
Yeeshoh aklil t’oru jiraf girfatu

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 5
Silehywete new endalqer bekentu
Kidus milkth honelgn medagna
Mesqelh argegn yefqrh mirkogna
Yetet’alech nefse bedemh tewajta

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 6
Ahun adis new negn cherneth bezta
Alemm leene enem lealem motku
Amlake bebeth lemenor temeret’ku
Egroche keengdih lante yirot’alu

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede

VERSE 7
Qalatoche fiqrhn yimeskeralu
Iyesus simhn beemnet et’eralehu
Kidus mesqelhn esalemewalehu

CHORUS
Ayne lay tesale rihrahe fiqru
T’or yewegaw gonu tawesegn chnkaru
Leamets’ yaschekolegn asach tesedede
Mesqelun sisalem libe semay hede'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'meskelun-sisalem-orthodox-tewahido-song-zemari-hawaz-tegegn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Metadel New (metadel-new)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ

VERSE 1
የሚያስገርም ጥበብ ነው እጅግ የሚደንቅ
ከህሊና በላይ ነው ከአይምሮ ሚረቅ
ታላቁን መገለጥ ነው የምናወራው
የእግዚአብሔር ልጅ የሰው ልጅ መሆኑ እንዴት ነው

VERSE 2
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ
እንዴት ሆኖ እረ እንዴት ተከናወነ
ቤቱ መንገድ አምላክ ሰው ሰው አምላክ ሆነ

VERSE 3
በማህፀንሽ ያደረው ብሩክ ነው ቅዱስ
ይገባዋል አምልኮ ስግደት በመንፈስ
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ

VERSE 4
አማኑኤል እግዚአብሔር ከእኛ ጋር ሆነ
የዓለም ቤዛ ክርስቶስ ባንቺ አደረ
ያዳኛችን የበጉ ታላቅ አዳራሽ
ሰላም ላንቺ ድንግል ሆይ ጸጋ የተሞላሽ

VERSE 5
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ
እንዴት ሆኖ እረ እንዴት ተከናወነ
ቤቱ መንገድ አምላክ ሰው ሰው አምላክ ሆነ

VERSE 6
በማህፀንሽ ያደረው ብሩክ ነው ቅዱስ
ይገባዋል አምልኮ ስግደት በመንፈስ
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ

VERSE 7
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ',
      lyrics_transliteration = 'Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza

VERSE 1
Yemiyasgerm t’beb new ejg yemidenq
Kehlina belay new keaymro mireq
Talaqun megelet’ new yemnaweraw
YeEgziabher lij yesew lij mehonu endet new

VERSE 2
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza
Endet hono ere endet tekenawene
Betu menged amlak sew sew amlak hone

VERSE 3
Bemahts’ensh yaderew biruk new Kidus
Yigebawal amlko sigdet bemenfes
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza

VERSE 4
Amanuel Egziabher keegna gar hone
Yealem beza Kristos banchi adere
Yadagnachn yebegu talaq adarash
Selam lanchi Dingil hoy ts’ega yetemolash

VERSE 5
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza
Endet hono ere endet tekenawene
Betu menged amlak sew sew amlak hone

VERSE 6
Bemahts’ensh yaderew biruk new Kidus
Yigebawal amlko sigdet bemenfes
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza

VERSE 7
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'metadel-new'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ

VERSE 1
የሚያስገርም ጥበብ ነው እጅግ የሚደንቅ
ከህሊና በላይ ነው ከአይምሮ ሚረቅ
ታላቁን መገለጥ ነው የምናወራው
የእግዚአብሔር ልጅ የሰው ልጅ መሆኑ እንዴት ነው

CHORUS
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ

VERSE 2
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ
እንዴት ሆኖ እረ እንዴት ተከናወነ
ቤቱ መንገድ አምላክ ሰው ሰው አምላክ ሆነ

CHORUS
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ

VERSE 3
በማህፀንሽ ያደረው ብሩክ ነው ቅዱስ
ይገባዋል አምልኮ ስግደት በመንፈስ
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ

CHORUS
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ

VERSE 4
አማኑኤል እግዚአብሔር ከእኛ ጋር ሆነ
የዓለም ቤዛ ክርስቶስ ባንቺ አደረ
ያዳኛችን የበጉ ታላቅ አዳራሽ
ሰላም ላንቺ ድንግል ሆይ ጸጋ የተሞላሽ

CHORUS
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ

VERSE 5
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ
እንዴት ሆኖ እረ እንዴት ተከናወነ
ቤቱ መንገድ አምላክ ሰው ሰው አምላክ ሆነ

CHORUS
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ

VERSE 6
በማህፀንሽ ያደረው ብሩክ ነው ቅዱስ
ይገባዋል አምልኮ ስግደት በመንፈስ
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ

CHORUS
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ

VERSE 7
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ

CHORUS
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ
ድንግል ምን መታደል ነው ማርያም ሆይ ጸጋሽ በዛ
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza

VERSE 1
Yemiyasgerm t’beb new ejg yemidenq
Kehlina belay new keaymro mireq
Talaqun megelet’ new yemnaweraw
YeEgziabher lij yesew lij mehonu endet new

CHORUS
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza

VERSE 2
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza
Endet hono ere endet tekenawene
Betu menged amlak sew sew amlak hone

CHORUS
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza

VERSE 3
Bemahts’ensh yaderew biruk new Kidus
Yigebawal amlko sigdet bemenfes
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza

CHORUS
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza

VERSE 4
Amanuel Egziabher keegna gar hone
Yealem beza Kristos banchi adere
Yadagnachn yebegu talaq adarash
Selam lanchi Dingil hoy ts’ega yetemolash

CHORUS
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza

VERSE 5
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza
Endet hono ere endet tekenawene
Betu menged amlak sew sew amlak hone

CHORUS
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza

VERSE 6
Bemahts’ensh yaderew biruk new Kidus
Yigebawal amlko sigdet bemenfes
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza

CHORUS
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza

VERSE 7
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza

CHORUS
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza
Dingil min metadel new Maryam hoy ts’egash beza
Weldesh t’ut yat’bashw ets’ub yealemun beza'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'metadel-new', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: mezmur by Besufekad Andargachew (mezmur-by-besufekad-andargachew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ

VERSE 1
ቸሩ አባታችን "
መች ትገኝ ነበረ "
ገነት ምድራችን "
ብርሃን ወጣላቸው እሰይእሰይ

VERSE 2
ለመላ ሕዝቦቹ "
በጨለማው ጉዞ "
እንዲያሲሰላቹ "
እንደ ጠል ወረደ እሰይ እሰይ

VERSE 3
ከሰማይ ወደ እኛ "
ወገኖቹን ሊያድን "
ከኃጢአት ቁራኛ "
እግዚአብሔር አብ ላከ እሰይ እሰይ

VERSE 4
አንድያ ልጁን "
እርሱ ወዷልና "
እንዲሁ ዓለሙን "',
      lyrics_transliteration = 'Esey esey tewelede (2)
Kesemaye semayat werede (2)
Kedngl Maryam tewelede
Esu bayweled esey esey

VERSE 1
Cheru Abatachen "
Mech tigegn nebere "
Genet midrachn "
Birhan wet’alachew eseyesey

VERSE 2
Lemela hizbochu "
Bech’elemaw guzo "
Endiyasiselachu "
Ende t’el werede esey esey

VERSE 3
Kesemay wede egna "
Wegenochun liyadn "
Kehat’iat quragna "
Egziabher Ab lake esey esey

VERSE 4
Andya lijun "
Ersu wedwalna "
Endihu alemun "',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mezmur-by-besufekad-andargachew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ

VERSE 1
ቸሩ አባታችን "
መች ትገኝ ነበረ "
ገነት ምድራችን "
ብርሃን ወጣላቸው እሰይእሰይ

CHORUS
እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ

VERSE 2
ለመላ ሕዝቦቹ "
በጨለማው ጉዞ "
እንዲያሲሰላቹ "
እንደ ጠል ወረደ እሰይ እሰይ

CHORUS
እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ

VERSE 3
ከሰማይ ወደ እኛ "
ወገኖቹን ሊያድን "
ከኃጢአት ቁራኛ "
እግዚአብሔር አብ ላከ እሰይ እሰይ

CHORUS
እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ

VERSE 4
አንድያ ልጁን "
እርሱ ወዷልና "
እንዲሁ ዓለሙን "

CHORUS
እሰይ እሰይ ተወለደ (፪)
ከሰማየ ሰማያት ወረደ (፪)
ከድንግል ማርያም ተወለደ
እሱ ባይወለድ እሰይ እሰይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Esey esey tewelede (2)
Kesemaye semayat werede (2)
Kedngl Maryam tewelede
Esu bayweled esey esey

VERSE 1
Cheru Abatachen "
Mech tigegn nebere "
Genet midrachn "
Birhan wet’alachew eseyesey

CHORUS
Esey esey tewelede (2)
Kesemaye semayat werede (2)
Kedngl Maryam tewelede
Esu bayweled esey esey

VERSE 2
Lemela hizbochu "
Bech’elemaw guzo "
Endiyasiselachu "
Ende t’el werede esey esey

CHORUS
Esey esey tewelede (2)
Kesemaye semayat werede (2)
Kedngl Maryam tewelede
Esu bayweled esey esey

VERSE 3
Kesemay wede egna "
Wegenochun liyadn "
Kehat’iat quragna "
Egziabher Ab lake esey esey

CHORUS
Esey esey tewelede (2)
Kesemaye semayat werede (2)
Kedngl Maryam tewelede
Esu bayweled esey esey

VERSE 4
Andya lijun "
Ersu wedwalna "
Endihu alemun "

CHORUS
Esey esey tewelede (2)
Kesemaye semayat werede (2)
Kedngl Maryam tewelede
Esu bayweled esey esey'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mezmur-by-besufekad-andargachew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: mezmur by Zemari Besufekad Andargachew (mezmur-by-zemari-besufekad-andargachew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ተፈስሂ ተፈሰሂ ማርያም
ተፈሰሂ ተፈስሂ ማርያም ተፈስሂ(2)
የነቢያት ሀገር ተፈስሂ
ቤቴልሄም " "

VERSE 1
ከአንቺ ተገኘ " "
ዳግማዊ አዳም " "
መልአኩ ገብርኤል ተፈስሂ
እያረጋጋ " "

VERSE 2
ተፈስሂ አለሽ " "
መልዕክተ ፀጋ " "
ኤልሳቤጥ ስታይ ተፈስሂ
የአንቺ ሰላምታ " "

VERSE 3
ፅንሱ ዘለለ " "
በታላቅ ደስታ " "
ሙዳይ ነሽ ተፈስሂ
የአብ ሙሽራ " "

VERSE 4
ታቦት ዘዶር ነሽ " "
ንፅህት ደብተራ " "
ቅድስት ነሽና ተፈስሂ
ሰላማዊት " "

VERSE 5
እመ ብዙሃን " "
ኖህተ ፆት " "
በስጋሽ ድንግል ተፈስሂ
በህሊናሽ " "

VERSE 6
የእግዚያብርሔርአብ ልጅ " "
ያደረብሽ " "',
      lyrics_transliteration = 'Tefeshi tefesehi Maryam
Tefesehi tefeshi Maryam tefeshi (2)
Yenebiyat heger tefeshi
Betelhem " "

VERSE 1
Keanchi tegegne " "
Dagmawi adam " "
Melaku Gebriel tefeshi
Eyaregaga " "

VERSE 2
Tefeshi alesh " "
Melekte ts’ega " "
Elsabet’ sitay tefeshi
Yeanchi selamta " "

VERSE 3
Ts’nsu zelele " "
Betalaq desta " "
Muday nesh tefeshi
Yeab mushra " "

VERSE 4
Tabot zedor nesh " "
Nits’ht debtera " "
Kidist neshna tefeshi
Selamawit " "

VERSE 5
Eme bizuhan " "
Nohte ts’ot " "
Besgash Dingil tefeshi
Behlinash " "

VERSE 6
Yeegziyabrherab lij " "
Yaderebsh " "',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mezmur-by-zemari-besufekad-andargachew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተፈስሂ ተፈሰሂ ማርያም
ተፈሰሂ ተፈስሂ ማርያም ተፈስሂ(2)
የነቢያት ሀገር ተፈስሂ
ቤቴልሄም " "

VERSE 1
ከአንቺ ተገኘ " "
ዳግማዊ አዳም " "
መልአኩ ገብርኤል ተፈስሂ
እያረጋጋ " "

CHORUS
ተፈስሂ ተፈሰሂ ማርያም
ተፈሰሂ ተፈስሂ ማርያም ተፈስሂ(2)
የነቢያት ሀገር ተፈስሂ
ቤቴልሄም " "

VERSE 2
ተፈስሂ አለሽ " "
መልዕክተ ፀጋ " "
ኤልሳቤጥ ስታይ ተፈስሂ
የአንቺ ሰላምታ " "

CHORUS
ተፈስሂ ተፈሰሂ ማርያም
ተፈሰሂ ተፈስሂ ማርያም ተፈስሂ(2)
የነቢያት ሀገር ተፈስሂ
ቤቴልሄም " "

VERSE 3
ፅንሱ ዘለለ " "
በታላቅ ደስታ " "
ሙዳይ ነሽ ተፈስሂ
የአብ ሙሽራ " "

CHORUS
ተፈስሂ ተፈሰሂ ማርያም
ተፈሰሂ ተፈስሂ ማርያም ተፈስሂ(2)
የነቢያት ሀገር ተፈስሂ
ቤቴልሄም " "

VERSE 4
ታቦት ዘዶር ነሽ " "
ንፅህት ደብተራ " "
ቅድስት ነሽና ተፈስሂ
ሰላማዊት " "

CHORUS
ተፈስሂ ተፈሰሂ ማርያም
ተፈሰሂ ተፈስሂ ማርያም ተፈስሂ(2)
የነቢያት ሀገር ተፈስሂ
ቤቴልሄም " "

VERSE 5
እመ ብዙሃን " "
ኖህተ ፆት " "
በስጋሽ ድንግል ተፈስሂ
በህሊናሽ " "

CHORUS
ተፈስሂ ተፈሰሂ ማርያም
ተፈሰሂ ተፈስሂ ማርያም ተፈስሂ(2)
የነቢያት ሀገር ተፈስሂ
ቤቴልሄም " "

VERSE 6
የእግዚያብርሔርአብ ልጅ " "
ያደረብሽ " "

CHORUS
ተፈስሂ ተፈሰሂ ማርያም
ተፈሰሂ ተፈስሂ ማርያም ተፈስሂ(2)
የነቢያት ሀገር ተፈስሂ
ቤቴልሄም " "'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tefeshi tefesehi Maryam
Tefesehi tefeshi Maryam tefeshi (2)
Yenebiyat heger tefeshi
Betelhem " "

VERSE 1
Keanchi tegegne " "
Dagmawi adam " "
Melaku Gebriel tefeshi
Eyaregaga " "

CHORUS
Tefeshi tefesehi Maryam
Tefesehi tefeshi Maryam tefeshi (2)
Yenebiyat heger tefeshi
Betelhem " "

VERSE 2
Tefeshi alesh " "
Melekte ts’ega " "
Elsabet’ sitay tefeshi
Yeanchi selamta " "

CHORUS
Tefeshi tefesehi Maryam
Tefesehi tefeshi Maryam tefeshi (2)
Yenebiyat heger tefeshi
Betelhem " "

VERSE 3
Ts’nsu zelele " "
Betalaq desta " "
Muday nesh tefeshi
Yeab mushra " "

CHORUS
Tefeshi tefesehi Maryam
Tefesehi tefeshi Maryam tefeshi (2)
Yenebiyat heger tefeshi
Betelhem " "

VERSE 4
Tabot zedor nesh " "
Nits’ht debtera " "
Kidist neshna tefeshi
Selamawit " "

CHORUS
Tefeshi tefesehi Maryam
Tefesehi tefeshi Maryam tefeshi (2)
Yenebiyat heger tefeshi
Betelhem " "

VERSE 5
Eme bizuhan " "
Nohte ts’ot " "
Besgash Dingil tefeshi
Behlinash " "

CHORUS
Tefeshi tefesehi Maryam
Tefesehi tefeshi Maryam tefeshi (2)
Yenebiyat heger tefeshi
Betelhem " "

VERSE 6
Yeegziyabrherab lij " "
Yaderebsh " "

CHORUS
Tefeshi tefesehi Maryam
Tefesehi tefeshi Maryam tefeshi (2)
Yenebiyat heger tefeshi
Betelhem " "'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mezmur-by-zemari-besufekad-andargachew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Michael Wedaje Zemarit Betselot Asmare (michael-wedaje-zemarit-betselot-asmare)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 1
የልቤን የነገርኩት
ቀርቤ ያማከርኩት
የፈታው ቋጠሮዬን
ያቃና ጎዳናዬን

VERSE 2
ሚካኤል ወደጄ ነው
ጠርቼው እፅናናለው
የውስጤን ያውቅልኛል
በምልጃው ይረዳኛል

VERSE 3
ታምኜ የምጠራው
እንባዬን ከአይኔ ያበሰው
ያስመለጠኝ ከክፉ
የጋረደኝ በክንፉ

VERSE 4
ሚካኤል ወዳጄ ነው
ጠርቼው እፅናናለው
የውስጤን ያውቅልኛል
በምልጃው ይረዳኛል

VERSE 5
ያፅናናኝ ከሃዘኔ
ያገዘኝ ሆኖ ጎኔ
መሻቴን የፈፀመ
ጠላቴን ያደከመ

VERSE 6
ሚካኤል ወዳጄ ነው
ጠርቼው እፅናናለው
የውስጤን ያውቅልኛል
በምልጃው ይረዳኛል

VERSE 7
ጉልበቴን ያበረታ
ያማለደኝ ከጌታ
የመራኝ ከፊት ቀድሞ
ያከበረኝ ሸልሞ

VERSE 8
ሚካኤል ወዳጄ ነው
ጠርቼው እፅናናለው
የውስጤን ያውቅልኛል
በምልጃው ይረዳኛል',
      lyrics_transliteration = 'Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 1
Yelben yenegerkut
Qerbe yamakerkut
Yefetaw qwat’eroyen
Yaqana godanayen

VERSE 2
Mikael wedeje new
T’erchew ets’nanalew
Yewst’en yawqlgnal
Bemljaw yiredagnal

VERSE 3
Tamgne yemt’eraw
Enbayen keayne yabesew
Yasmelet’egn kekfu
Yegaredegn beknfu

VERSE 4
Mikael wedaje new
T’erchew ets’nanalew
Yewst’en yawqlgnal
Bemljaw yiredagnal

VERSE 5
Yats’nanagn kehazene
Yagezegn hono gone
Meshaten yefets’eme
T’elaten yadekeme

VERSE 6
Mikael wedaje new
T’erchew ets’nanalew
Yewst’en yawqlgnal
Bemljaw yiredagnal

VERSE 7
Gulbeten yabereta
Yamaledegn kegeta
Yemeragn kefit qedmo
Yakeberegn shelmo

VERSE 8
Mikael wedaje new
T’erchew ets’nanalew
Yewst’en yawqlgnal
Bemljaw yiredagnal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'michael-wedaje-zemarit-betselot-asmare'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 1
የልቤን የነገርኩት
ቀርቤ ያማከርኩት
የፈታው ቋጠሮዬን
ያቃና ጎዳናዬን

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 2
ሚካኤል ወደጄ ነው
ጠርቼው እፅናናለው
የውስጤን ያውቅልኛል
በምልጃው ይረዳኛል

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 3
ታምኜ የምጠራው
እንባዬን ከአይኔ ያበሰው
ያስመለጠኝ ከክፉ
የጋረደኝ በክንፉ

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 4
ሚካኤል ወዳጄ ነው
ጠርቼው እፅናናለው
የውስጤን ያውቅልኛል
በምልጃው ይረዳኛል

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 5
ያፅናናኝ ከሃዘኔ
ያገዘኝ ሆኖ ጎኔ
መሻቴን የፈፀመ
ጠላቴን ያደከመ

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 6
ሚካኤል ወዳጄ ነው
ጠርቼው እፅናናለው
የውስጤን ያውቅልኛል
በምልጃው ይረዳኛል

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 7
ጉልበቴን ያበረታ
ያማለደኝ ከጌታ
የመራኝ ከፊት ቀድሞ
ያከበረኝ ሸልሞ

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው

VERSE 8
ሚካኤል ወዳጄ ነው
ጠርቼው እፅናናለው
የውስጤን ያውቅልኛል
በምልጃው ይረዳኛል

CHORUS
ለጠሩት ፈጥኖ ደራሽ
እሩህሩህ ደግሞ አስታዋሽ
ሃያሉ ሚካኤል ነው
በአምላክ ፊት የሚቆመው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 1
Yelben yenegerkut
Qerbe yamakerkut
Yefetaw qwat’eroyen
Yaqana godanayen

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 2
Mikael wedeje new
T’erchew ets’nanalew
Yewst’en yawqlgnal
Bemljaw yiredagnal

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 3
Tamgne yemt’eraw
Enbayen keayne yabesew
Yasmelet’egn kekfu
Yegaredegn beknfu

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 4
Mikael wedaje new
T’erchew ets’nanalew
Yewst’en yawqlgnal
Bemljaw yiredagnal

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 5
Yats’nanagn kehazene
Yagezegn hono gone
Meshaten yefets’eme
T’elaten yadekeme

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 6
Mikael wedaje new
T’erchew ets’nanalew
Yewst’en yawqlgnal
Bemljaw yiredagnal

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 7
Gulbeten yabereta
Yamaledegn kegeta
Yemeragn kefit qedmo
Yakeberegn shelmo

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew

VERSE 8
Mikael wedaje new
T’erchew ets’nanalew
Yewst’en yawqlgnal
Bemljaw yiredagnal

CHORUS
Let’erut fet’no derash
Eruhruh degmo astawash
Hayalu Mikael new
Beamlak fit yemiqomew'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'michael-wedaje-zemarit-betselot-asmare', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mikael (mikael-730)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'መልአከ ኪዳኑ ለክርስቶስ መልአከ ምክሩ ለልዑል
እኅወ ማርያም እምነ ርእሰ ሊቃናት ሚካኤል
ባርክ ባርክ እግዚኦ በበትረ መስቀልከ ሣህል /2/
አቃቤ ቅዱሳን ሊቀ መናብርቱ

VERSE 1
የሰው ልጅ እንዳይሞት እንዳያልፍ በከንቱ
ለልመና ምትቆም ከአምላካችን ፊቱ
ወተአዛዚ ወተአዛዚ ለሰብእ በዲበ ሰናይቱ
ለምሕረት ስትላክ ባለም ግዞት ላሉ

VERSE 2
በምልጃህ ረድኤት ተስፋ ሚጠለሉ
እየተደሰቱ ኃጥዓን ነፍሳት ሁሉ
መጻእከኑ መጻእከኑ ሀቤነ ሚካኤል ይብሉ
በመስቀል ማዕተብ የምታስርድ ጠላት

VERSE 3
የትጉሃን ወዳጅ የድኩማን ረዳት
የርግብ ዓይኖች ያሉኽ የዋህ ሊቀ ኃይላት
ሰአል ሚካኤል ሰአል ሚካኤል ለነፍሰ ኵሉ ፍጥረት',
      lyrics_transliteration = 'Melake kidanu leKristos melake mikru lelul
Ehwe Maryam emne riese liqanat Mikael
Bark bark Egzi’o bebetre mesqelke sahl (2)
Aqabe Kidusan liqe menabrtu

VERSE 1
Yesew lij endaymot endayalf bekentu
Lelmena mitqom keamlakachn fitu
Weteazazi weteazazi lesebe bedibe senaytu
Lemhret sitlak balem gizot lalu

VERSE 2
Bemljah redet tesfa mit’elelu
Eyetedesetu hat’an nefsat hulu
Mets’aekenu mets’aekenu hebene Mikael yiblu
Bemesqel maeteb yemtasrd t’elat

VERSE 3
Yetguhan wedaj yedkuman redat
Yergb aynoch yaluኽ yewah liqe haylat
Seal Mikael seal Mikael lenefse kwlu fit’ret',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mikael-730'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መልአከ ኪዳኑ ለክርስቶስ መልአከ ምክሩ ለልዑል
እኅወ ማርያም እምነ ርእሰ ሊቃናት ሚካኤል
ባርክ ባርክ እግዚኦ በበትረ መስቀልከ ሣህል /2/
አቃቤ ቅዱሳን ሊቀ መናብርቱ

VERSE 1
የሰው ልጅ እንዳይሞት እንዳያልፍ በከንቱ
ለልመና ምትቆም ከአምላካችን ፊቱ
ወተአዛዚ ወተአዛዚ ለሰብእ በዲበ ሰናይቱ
ለምሕረት ስትላክ ባለም ግዞት ላሉ

CHORUS
መልአከ ኪዳኑ ለክርስቶስ መልአከ ምክሩ ለልዑል
እኅወ ማርያም እምነ ርእሰ ሊቃናት ሚካኤል
ባርክ ባርክ እግዚኦ በበትረ መስቀልከ ሣህል /2/
አቃቤ ቅዱሳን ሊቀ መናብርቱ

VERSE 2
በምልጃህ ረድኤት ተስፋ ሚጠለሉ
እየተደሰቱ ኃጥዓን ነፍሳት ሁሉ
መጻእከኑ መጻእከኑ ሀቤነ ሚካኤል ይብሉ
በመስቀል ማዕተብ የምታስርድ ጠላት

CHORUS
መልአከ ኪዳኑ ለክርስቶስ መልአከ ምክሩ ለልዑል
እኅወ ማርያም እምነ ርእሰ ሊቃናት ሚካኤል
ባርክ ባርክ እግዚኦ በበትረ መስቀልከ ሣህል /2/
አቃቤ ቅዱሳን ሊቀ መናብርቱ

VERSE 3
የትጉሃን ወዳጅ የድኩማን ረዳት
የርግብ ዓይኖች ያሉኽ የዋህ ሊቀ ኃይላት
ሰአል ሚካኤል ሰአል ሚካኤል ለነፍሰ ኵሉ ፍጥረት

CHORUS
መልአከ ኪዳኑ ለክርስቶስ መልአከ ምክሩ ለልዑል
እኅወ ማርያም እምነ ርእሰ ሊቃናት ሚካኤል
ባርክ ባርክ እግዚኦ በበትረ መስቀልከ ሣህል /2/
አቃቤ ቅዱሳን ሊቀ መናብርቱ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Melake kidanu leKristos melake mikru lelul
Ehwe Maryam emne riese liqanat Mikael
Bark bark Egzi’o bebetre mesqelke sahl (2)
Aqabe Kidusan liqe menabrtu

VERSE 1
Yesew lij endaymot endayalf bekentu
Lelmena mitqom keamlakachn fitu
Weteazazi weteazazi lesebe bedibe senaytu
Lemhret sitlak balem gizot lalu

CHORUS
Melake kidanu leKristos melake mikru lelul
Ehwe Maryam emne riese liqanat Mikael
Bark bark Egzi’o bebetre mesqelke sahl (2)
Aqabe Kidusan liqe menabrtu

VERSE 2
Bemljah redet tesfa mit’elelu
Eyetedesetu hat’an nefsat hulu
Mets’aekenu mets’aekenu hebene Mikael yiblu
Bemesqel maeteb yemtasrd t’elat

CHORUS
Melake kidanu leKristos melake mikru lelul
Ehwe Maryam emne riese liqanat Mikael
Bark bark Egzi’o bebetre mesqelke sahl (2)
Aqabe Kidusan liqe menabrtu

VERSE 3
Yetguhan wedaj yedkuman redat
Yergb aynoch yaluኽ yewah liqe haylat
Seal Mikael seal Mikael lenefse kwlu fit’ret

CHORUS
Melake kidanu leKristos melake mikru lelul
Ehwe Maryam emne riese liqanat Mikael
Bark bark Egzi’o bebetre mesqelke sahl (2)
Aqabe Kidusan liqe menabrtu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mikael-730', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mikael Like Melaekit (mikael-like-melaekit)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሚካኤል ሊቀ መላዕክት/2/
አንተ አድነን/2/ ከከፉ መዓት
እስቲ ላመስግንህ የጌታን ባለሟል
ክብር የተሰጠህ ነህ ከቸሩ እግዚአብሔር

VERSE 1
ታምሩን ለሚያምኑ በአማላጅነቱ
ለሚስኪኖች ደራሽ ሚካኤል ነህ ፈዋሻ
ሚካኤል
ዛሬም እንደ ቀድሞ እንደነአፎምያ

VERSE 2
እኛንም ጠብቀን ከክፉ መከራ
በአማላጅነትህ ዘወትር ሲማጸኑ
ፈጥነህ ትደርሳለህ ልታድናቸው ሚካኤል
ስምህን ለሚጠሩ ዝክርህን ለዘከሩ

VERSE 3
ዋስ ጠበቃቸው ነህ አንተን ለሚያከብሩ
ጸበልህ ፈዋሽ ነው በእምነት ለቀረቡት
ጥበቃህ አይለየን ሚካኤል ሆይ እርዳን ሚካኤል
ዛሬም እንደ ቀድሞ እንደነአፎምያ

VERSE 4
እኛንም ጠብቀን ከክፉ መከራ
በአማላጅነትህ ዘወትር ሲማጸኑ
ፈጥነህ ትደርሳለህ ልታድናቸው ሚካኤል',
      lyrics_transliteration = 'Mikael liqe melaekt (2)
Ante adnen (2) kekefu meat
Esti lamesgnh yegetan balemwal
Kibir yeteset’eh neh kecheru Egziabher

VERSE 1
Tamrun lemiyamnu beamalajnetu
Lemiskinoch derash Mikael neh fewasha
Mikael
Zarem ende qedmo endeneafomya

VERSE 2
Egnanm t’ebqen kekfu mekera
Beamalajneth zewetr simats’enu
Fet’neh tidersaleh litadnachew Mikael
Simhn lemit’eru zikrhn lezekeru

VERSE 3
Was t’ebeqachew neh anten lemiyakebru
Ts’ebelh fewash new beemnet leqerebut
T’beqah ayleyen Mikael hoy erdan Mikael
Zarem ende qedmo endeneafomya

VERSE 4
Egnanm t’ebqen kekfu mekera
Beamalajneth zewetr simats’enu
Fet’neh tidersaleh litadnachew Mikael',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mikael-like-melaekit'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሚካኤል ሊቀ መላዕክት/2/
አንተ አድነን/2/ ከከፉ መዓት
እስቲ ላመስግንህ የጌታን ባለሟል
ክብር የተሰጠህ ነህ ከቸሩ እግዚአብሔር

VERSE 1
ታምሩን ለሚያምኑ በአማላጅነቱ
ለሚስኪኖች ደራሽ ሚካኤል ነህ ፈዋሻ
ሚካኤል
ዛሬም እንደ ቀድሞ እንደነአፎምያ

CHORUS
ሚካኤል ሊቀ መላዕክት/2/
አንተ አድነን/2/ ከከፉ መዓት
እስቲ ላመስግንህ የጌታን ባለሟል
ክብር የተሰጠህ ነህ ከቸሩ እግዚአብሔር

VERSE 2
እኛንም ጠብቀን ከክፉ መከራ
በአማላጅነትህ ዘወትር ሲማጸኑ
ፈጥነህ ትደርሳለህ ልታድናቸው ሚካኤል
ስምህን ለሚጠሩ ዝክርህን ለዘከሩ

CHORUS
ሚካኤል ሊቀ መላዕክት/2/
አንተ አድነን/2/ ከከፉ መዓት
እስቲ ላመስግንህ የጌታን ባለሟል
ክብር የተሰጠህ ነህ ከቸሩ እግዚአብሔር

VERSE 3
ዋስ ጠበቃቸው ነህ አንተን ለሚያከብሩ
ጸበልህ ፈዋሽ ነው በእምነት ለቀረቡት
ጥበቃህ አይለየን ሚካኤል ሆይ እርዳን ሚካኤል
ዛሬም እንደ ቀድሞ እንደነአፎምያ

CHORUS
ሚካኤል ሊቀ መላዕክት/2/
አንተ አድነን/2/ ከከፉ መዓት
እስቲ ላመስግንህ የጌታን ባለሟል
ክብር የተሰጠህ ነህ ከቸሩ እግዚአብሔር

VERSE 4
እኛንም ጠብቀን ከክፉ መከራ
በአማላጅነትህ ዘወትር ሲማጸኑ
ፈጥነህ ትደርሳለህ ልታድናቸው ሚካኤል

CHORUS
ሚካኤል ሊቀ መላዕክት/2/
አንተ አድነን/2/ ከከፉ መዓት
እስቲ ላመስግንህ የጌታን ባለሟል
ክብር የተሰጠህ ነህ ከቸሩ እግዚአብሔር'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mikael liqe melaekt (2)
Ante adnen (2) kekefu meat
Esti lamesgnh yegetan balemwal
Kibir yeteset’eh neh kecheru Egziabher

VERSE 1
Tamrun lemiyamnu beamalajnetu
Lemiskinoch derash Mikael neh fewasha
Mikael
Zarem ende qedmo endeneafomya

CHORUS
Mikael liqe melaekt (2)
Ante adnen (2) kekefu meat
Esti lamesgnh yegetan balemwal
Kibir yeteset’eh neh kecheru Egziabher

VERSE 2
Egnanm t’ebqen kekfu mekera
Beamalajneth zewetr simats’enu
Fet’neh tidersaleh litadnachew Mikael
Simhn lemit’eru zikrhn lezekeru

CHORUS
Mikael liqe melaekt (2)
Ante adnen (2) kekefu meat
Esti lamesgnh yegetan balemwal
Kibir yeteset’eh neh kecheru Egziabher

VERSE 3
Was t’ebeqachew neh anten lemiyakebru
Ts’ebelh fewash new beemnet leqerebut
T’beqah ayleyen Mikael hoy erdan Mikael
Zarem ende qedmo endeneafomya

CHORUS
Mikael liqe melaekt (2)
Ante adnen (2) kekefu meat
Esti lamesgnh yegetan balemwal
Kibir yeteset’eh neh kecheru Egziabher

VERSE 4
Egnanm t’ebqen kekfu mekera
Beamalajneth zewetr simats’enu
Fet’neh tidersaleh litadnachew Mikael

CHORUS
Mikael liqe melaekt (2)
Ante adnen (2) kekefu meat
Esti lamesgnh yegetan balemwal
Kibir yeteset’eh neh kecheru Egziabher'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mikael-like-melaekit', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mikael Silew Mikael (mikael-silew-mikael)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 1
የአፎሚያ ረዳት የባህራን አባት
እስራኤል ዘስጋን የመራቸው ከፊት
ዛሬ አስምር ብለው ደጁ ለሚጠኑ
ከአምላክ የተሰጠው ፅኑ ናት ኪዳኑ

VERSE 2
ልክ እንደ ትናንቱ የምትጠብቀኝ
በበጉ ዙፋን ፊት የምትቆምልኝ
መንገድ ለጠፋው ሰው ለሚቅበዘበዘው
አንገቱን በሐዘን ለሚወዘውዘው

VERSE 3
ምልጃህ ነው የረዳው ጌታ ፊት መቆምህ
ለእኔም መልስ ሆነሃል ሚካኤል ሆይ ስልህ
ልክ እንደ ትናንቱ የምትጠብቀኝ
በበጉ ዙፋን ፊት የምትቆምልኝ

VERSE 4
ስምህክን እየጠራሁ ደጅህ አድጌያለሁ
ምልጃህ እያገዘኝ ስንቱን አልፌለሁ
ለሰው ማይነገር ላንተ የነገሬህ
ችግሬ ተፈቷል በፊቴ ቀድመህ

VERSE 5
ልክ እንደ ትናንቱ የምትጠብቀኝ
በበጉ ዙፋን ፊት የምትቆምልኝ
የመዳንን መንገድ መንግስቱን እንድወርስ
ስደክም ያገዝከኝ ቀርበኸኝ በሞገስ

VERSE 6
ሃይላት ስልጣናትን መናፍቱን ረትተህ
በሰማይ አልፈሃል ሚካኤል ድንቅ ነህ
ልክ እንደ ትናንቱ የምትጠብቀኝ
በበጉ ዙፋን ፊት የምትቆምልኝ',
      lyrics_transliteration = 'Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal

VERSE 1
Yeafomiya redat yebahran abat
Esrael zesgan yemerachew kefit
Zare asmr bilew deju lemit’enu
Keamlak yeteset’ew ts’nu nat kidanu

VERSE 2
Lik ende tinantu yemtt’ebqegn
Bebegu zufan fit yemtqomlgn
Menged let’efaw sew lemiqbezebezew
Angetun behezen lemiwezewzew

VERSE 3
Miljah new yeredaw Geta fit meqomh
Leenem mels honehal Mikael hoy silh
Lik ende tinantu yemtt’ebqegn
Bebegu zufan fit yemtqomlgn

VERSE 4
Simhkn eyet’erahu dejh adgeyalehu
Miljah eyagezegn sintun alfelehu
Lesew mayneger lante yenegereh
Chgre tefetwal befite qedmeh

VERSE 5
Lik ende tinantu yemtt’ebqegn
Bebegu zufan fit yemtqomlgn
Yemedann menged mengstun endwers
Sidekm yagezkegn qerbeኸgn bemoges

VERSE 6
Haylat silt’anatn menaftun retteh
Besemay alfehal Mikael dinq neh
Lik ende tinantu yemtt’ebqegn
Bebegu zufan fit yemtqomlgn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mikael-silew-mikael'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 1
የአፎሚያ ረዳት የባህራን አባት
እስራኤል ዘስጋን የመራቸው ከፊት
ዛሬ አስምር ብለው ደጁ ለሚጠኑ
ከአምላክ የተሰጠው ፅኑ ናት ኪዳኑ

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 2
ልክ እንደ ትናንቱ የምትጠብቀኝ
በበጉ ዙፋን ፊት የምትቆምልኝ
መንገድ ለጠፋው ሰው ለሚቅበዘበዘው
አንገቱን በሐዘን ለሚወዘውዘው

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 3
ምልጃህ ነው የረዳው ጌታ ፊት መቆምህ
ለእኔም መልስ ሆነሃል ሚካኤል ሆይ ስልህ
ልክ እንደ ትናንቱ የምትጠብቀኝ
በበጉ ዙፋን ፊት የምትቆምልኝ

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 4
ስምህክን እየጠራሁ ደጅህ አድጌያለሁ
ምልጃህ እያገዘኝ ስንቱን አልፌለሁ
ለሰው ማይነገር ላንተ የነገሬህ
ችግሬ ተፈቷል በፊቴ ቀድመህ

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 5
ልክ እንደ ትናንቱ የምትጠብቀኝ
በበጉ ዙፋን ፊት የምትቆምልኝ
የመዳንን መንገድ መንግስቱን እንድወርስ
ስደክም ያገዝከኝ ቀርበኸኝ በሞገስ

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል

VERSE 6
ሃይላት ስልጣናትን መናፍቱን ረትተህ
በሰማይ አልፈሃል ሚካኤል ድንቅ ነህ
ልክ እንደ ትናንቱ የምትጠብቀኝ
በበጉ ዙፋን ፊት የምትቆምልኝ

CHORUS
ክብሩ ከመላእክት ከፍ ከፍ ያለ ነው
የስሙ ትርጓሜ ማን እንደ እግዚአብሔር ነው
ሚካኤል ስለው ሚካኤል
ያስጨነቀኝ ከቅጥሬ ሸሽቷል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal

VERSE 1
Yeafomiya redat yebahran abat
Esrael zesgan yemerachew kefit
Zare asmr bilew deju lemit’enu
Keamlak yeteset’ew ts’nu nat kidanu

CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal

VERSE 2
Lik ende tinantu yemtt’ebqegn
Bebegu zufan fit yemtqomlgn
Menged let’efaw sew lemiqbezebezew
Angetun behezen lemiwezewzew

CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal

VERSE 3
Miljah new yeredaw Geta fit meqomh
Leenem mels honehal Mikael hoy silh
Lik ende tinantu yemtt’ebqegn
Bebegu zufan fit yemtqomlgn

CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal

VERSE 4
Simhkn eyet’erahu dejh adgeyalehu
Miljah eyagezegn sintun alfelehu
Lesew mayneger lante yenegereh
Chgre tefetwal befite qedmeh

CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal

VERSE 5
Lik ende tinantu yemtt’ebqegn
Bebegu zufan fit yemtqomlgn
Yemedann menged mengstun endwers
Sidekm yagezkegn qerbeኸgn bemoges

CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal

VERSE 6
Haylat silt’anatn menaftun retteh
Besemay alfehal Mikael dinq neh
Lik ende tinantu yemtt’ebqegn
Bebegu zufan fit yemtqomlgn

CHORUS
Kibru kemelaekt kef kef yale new
Yesmu tirgwame man ende Egziabher new
Mikael silew Mikael
Yasch’eneqegn keqt’re sheshtwal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mikael-silew-mikael', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mikael Siyum (mikael-siyum)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት

VERSE 1
አዘጋጅተኸኛል ለሰማይ መንግስትህ

VERSE 2
በከንቱ እንዳልደክም ነብሴ እንዳትዝል
ትመግበኝ ነበር የህወትን ቃል
ወጣሁኝ ከአለም ተሰሎንቄን ረሣሁ
መጠማቴ ቀረ የህይወት ውሀ ጠጣሁ

VERSE 3
መዳንን እንድወርስ ሞትን እንዳላይ
ትረዳኝ ነበረ ከኔ ሣትለይ
በመንገዴ ሁሉ ከፊቴ ቀደምክ
አማኑኤል ብዬ ጌታን እንዳመልክ

VERSE 4
ምልጃህን ታምኜ ስኖር በመቅደስህ
ታሻግረኝ ነበር እጆቼን ይዘህ
በጎልማሣ ነቴ ነህና ከጎኔ
ጉልበቴም አንተው ነህ በእርጅና ዘመኔ',
      lyrics_transliteration = 'Mikael siyum (3)liqe melaekt mezgebe rirahe (3)weyewah
Yedehe adegun lij sileteqebelkegn
Beawde mihreth befqr asadekegn
Kemeqdes tekleh megebkegn hiywet

VERSE 1
Azegajteኸgnal lesemay mengsth

VERSE 2
Bekentu endaldekm nebse endatzl
Timegbegn neber yehwetn qal
Wet’ahugn kealem teselonqen resahu
Met’emate qere yehywet wihe t’et’ahu

VERSE 3
Medann endwers motn endalay
Tiredagn nebere kene satley
Bemengede hulu kefite qedemk
Amanuel biye getan endamelk

VERSE 4
Miljahn tamgne sinor bemeqdesh
Tashagregn neber ejochen yizeh
Begolmasa nete nehna kegone
Gulbetem antew neh beerjna zemene',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mikael-siyum'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት

VERSE 1
አዘጋጅተኸኛል ለሰማይ መንግስትህ

CHORUS
ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት

VERSE 2
በከንቱ እንዳልደክም ነብሴ እንዳትዝል
ትመግበኝ ነበር የህወትን ቃል
ወጣሁኝ ከአለም ተሰሎንቄን ረሣሁ
መጠማቴ ቀረ የህይወት ውሀ ጠጣሁ

CHORUS
ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት

VERSE 3
መዳንን እንድወርስ ሞትን እንዳላይ
ትረዳኝ ነበረ ከኔ ሣትለይ
በመንገዴ ሁሉ ከፊቴ ቀደምክ
አማኑኤል ብዬ ጌታን እንዳመልክ

CHORUS
ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት

VERSE 4
ምልጃህን ታምኜ ስኖር በመቅደስህ
ታሻግረኝ ነበር እጆቼን ይዘህ
በጎልማሣ ነቴ ነህና ከጎኔ
ጉልበቴም አንተው ነህ በእርጅና ዘመኔ

CHORUS
ሚካኤል ስዩም /3/ሊቀ መላእክት መዝገበ ርራሄ/3/ወየዋህ
የደሀ አደጉን ልጅ ስለተቀበልከኝ
በአውደ ምህረትህ በፍቅር አሳደከኝ
ከመቅደስ ተክለህ መገብከኝ ህይወት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mikael siyum (3)liqe melaekt mezgebe rirahe (3)weyewah
Yedehe adegun lij sileteqebelkegn
Beawde mihreth befqr asadekegn
Kemeqdes tekleh megebkegn hiywet

VERSE 1
Azegajteኸgnal lesemay mengsth

CHORUS
Mikael siyum (3)liqe melaekt mezgebe rirahe (3)weyewah
Yedehe adegun lij sileteqebelkegn
Beawde mihreth befqr asadekegn
Kemeqdes tekleh megebkegn hiywet

VERSE 2
Bekentu endaldekm nebse endatzl
Timegbegn neber yehwetn qal
Wet’ahugn kealem teselonqen resahu
Met’emate qere yehywet wihe t’et’ahu

CHORUS
Mikael siyum (3)liqe melaekt mezgebe rirahe (3)weyewah
Yedehe adegun lij sileteqebelkegn
Beawde mihreth befqr asadekegn
Kemeqdes tekleh megebkegn hiywet

VERSE 3
Medann endwers motn endalay
Tiredagn nebere kene satley
Bemengede hulu kefite qedemk
Amanuel biye getan endamelk

CHORUS
Mikael siyum (3)liqe melaekt mezgebe rirahe (3)weyewah
Yedehe adegun lij sileteqebelkegn
Beawde mihreth befqr asadekegn
Kemeqdes tekleh megebkegn hiywet

VERSE 4
Miljahn tamgne sinor bemeqdesh
Tashagregn neber ejochen yizeh
Begolmasa nete nehna kegone
Gulbetem antew neh beerjna zemene

CHORUS
Mikael siyum (3)liqe melaekt mezgebe rirahe (3)weyewah
Yedehe adegun lij sileteqebelkegn
Beawde mihreth befqr asadekegn
Kemeqdes tekleh megebkegn hiywet'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mikael-siyum', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mikiniyat Silalegn New (mikiniyat-silalegn-new)
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
  WHERE slug = 'mikiniyat-silalegn-new'
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
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mikiniyat-silalegn-new', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: mikurab (mikurab)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 1
መዓዛ ቅዱሳን ቤተልሔም ቅድስት
ቤተክርስቲያን ናት ቀራንዮ ውድስት
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ
ዙፋኔ ናትና ጸሎት ማሳረጊያ

VERSE 2
አዝ…
ሰሎሞን የሠራት ይህቺ ቤተ መቅደስ
ዘለዓለም ሕያው ናት አትፈርስ አትታደስ
ክብሯን ለተረዳ ደጇ ለማለለ

VERSE 3
ከሰልሎሞን ሚበልጥ በዕውነት በእርሷ አለ
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ
ዙፋኔ ናትና ጸሎት ማሳረጊያ
አዝ…

VERSE 4
በደሙ ነውና ዙሪያዋን ያጠራት
በመስቀል ሸልሞ በፍቅር ሞሸራት
ድንጋይ ሲያነሱበት ዝምታን መረጠ
ገበያ ሲያደርጓት ጅራፉን ገለጠ

VERSE 5
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ
ዙፋኔ ናትና ጸሎት ማሳረጊያ
አዝ…
ዛሬም የርሷን ውበት በገበያ ሸማ

VERSE 6
የሚሸፍን አለ ሊያቆሽሽ ሊያደማ
ከልዑሉ መንበር ሳይወርድበት ቁጣ
በቃሉ ይታረም ጅራፉ ሳይመጣ
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ

VERSE 7
ዙፋኔ ናትና ጸሎት ማሳረጊያ
አዝ…
መቅደስ ማለት ልቤ አንተ የምታድርበት
ተድላና ፍስሐ የሚደረግበት

VERSE 8
ልቤን ካቆሸሸው ግብዝነት እንዳርፍ
ገርፈህ አባርልኝ በወንጌልህ ጅራፍ
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ
ዙፋኔ ናትና ጸሎት ማሳረጊያ

VERSE 9
አዝ…',
      lyrics_transliteration = 'Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 1
Meaza Kidusan betelhem Kidist
Bete Kristian nat qeranyo widst
Beten atadrgwat sheqet’ mesheshegiya
Zufane natna ts’elot masaregiya

VERSE 2
Selomon yeserat yihchi bete meqdes
Zelealem hiyaw nat atfers attades
Kibrwan letereda dejwa lemalele

VERSE 3
Kesellomon mibelt’ beewnet beerswa ale
Beten atadrgwat sheqet’ mesheshegiya
Zufane natna ts’elot masaregiya

VERSE 4
Bedemu newna zuriyawan yat’erat
Bemesqel shelmo befqr mosherat
Dingay siyanesubet zimtan meret’e
Gebeya siyadergwat jirafun gelet’e

VERSE 5
Beten atadrgwat sheqet’ mesheshegiya
Zufane natna ts’elot masaregiya
Zarem yerswan wibet begebeya shema

VERSE 6
Yemishefn ale liyaqoshsh liyadema
Kelulu menber saywerdbet qut’a
Beqalu yitarem jirafu saymet’a
Beten atadrgwat sheqet’ mesheshegiya

VERSE 7
Zufane natna ts’elot masaregiya
Meqdes malet libe ante yemtadrbet
Tedlana fishe yemideregbet

VERSE 8
Liben kaqosheshew gibznet endarf
Gerfeh abarlgn bewengelh jiraf
Beten atadrgwat sheqet’ mesheshegiya
Zufane natna ts’elot masaregiya

VERSE 9',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mikurab'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 1
መዓዛ ቅዱሳን ቤተልሔም ቅድስት
ቤተክርስቲያን ናት ቀራንዮ ውድስት
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ
ዙፋኔ ናትና ጸሎት ማሳረጊያ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 2
አዝ…
ሰሎሞን የሠራት ይህቺ ቤተ መቅደስ
ዘለዓለም ሕያው ናት አትፈርስ አትታደስ
ክብሯን ለተረዳ ደጇ ለማለለ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 3
ከሰልሎሞን ሚበልጥ በዕውነት በእርሷ አለ
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ
ዙፋኔ ናትና ጸሎት ማሳረጊያ
አዝ…

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 4
በደሙ ነውና ዙሪያዋን ያጠራት
በመስቀል ሸልሞ በፍቅር ሞሸራት
ድንጋይ ሲያነሱበት ዝምታን መረጠ
ገበያ ሲያደርጓት ጅራፉን ገለጠ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 5
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ
ዙፋኔ ናትና ጸሎት ማሳረጊያ
አዝ…
ዛሬም የርሷን ውበት በገበያ ሸማ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 6
የሚሸፍን አለ ሊያቆሽሽ ሊያደማ
ከልዑሉ መንበር ሳይወርድበት ቁጣ
በቃሉ ይታረም ጅራፉ ሳይመጣ
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 7
ዙፋኔ ናትና ጸሎት ማሳረጊያ
አዝ…
መቅደስ ማለት ልቤ አንተ የምታድርበት
ተድላና ፍስሐ የሚደረግበት

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 8
ልቤን ካቆሸሸው ግብዝነት እንዳርፍ
ገርፈህ አባርልኝ በወንጌልህ ጅራፍ
ቤቴን አታድርጓት ሸቀጥ መሸሸጊያ
ዙፋኔ ናትና ጸሎት ማሳረጊያ

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ

VERSE 9
አዝ…

CHORUS
ማረፊያ የሆነች ለደቂቀ እግዚአብሔር
ቤተክርስቲያን ነች የክርስቶስ ሀገር
አንቀጸ መድኃኒት ሰናይት ሙሽራ
እንደ ንጋት ፀሀይ መልኳ የሚያበራ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 1
Meaza Kidusan betelhem Kidist
Bete Kristian nat qeranyo widst
Beten atadrgwat sheqet’ mesheshegiya
Zufane natna ts’elot masaregiya

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 2
CHORUS
Selomon yeserat yihchi bete meqdes
Zelealem hiyaw nat atfers attades
Kibrwan letereda dejwa lemalele

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 3
Kesellomon mibelt’ beewnet beerswa ale
Beten atadrgwat sheqet’ mesheshegiya
Zufane natna ts’elot masaregiya
CHORUS

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 4
Bedemu newna zuriyawan yat’erat
Bemesqel shelmo befqr mosherat
Dingay siyanesubet zimtan meret’e
Gebeya siyadergwat jirafun gelet’e

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 5
Beten atadrgwat sheqet’ mesheshegiya
Zufane natna ts’elot masaregiya
CHORUS
Zarem yerswan wibet begebeya shema

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 6
Yemishefn ale liyaqoshsh liyadema
Kelulu menber saywerdbet qut’a
Beqalu yitarem jirafu saymet’a
Beten atadrgwat sheqet’ mesheshegiya

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 7
Zufane natna ts’elot masaregiya
CHORUS
Meqdes malet libe ante yemtadrbet
Tedlana fishe yemideregbet

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 8
Liben kaqosheshew gibznet endarf
Gerfeh abarlgn bewengelh jiraf
Beten atadrgwat sheqet’ mesheshegiya
Zufane natna ts’elot masaregiya

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera

VERSE 9
CHORUS

CHORUS
Marefiya yehonech ledeqiqe Egziabher
Bete Kristian nech yeKristos heger
Anqets’e medhanit senayt mushra
Ende nigat ts’ehey melkwa yemiyabera'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mikurab', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Milikite Nesh (milikite-nesh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 1
ፀጋሽ ጎብኝቶኝ ቃልኪዳንሽ(2)
እዝ
ተስፋ ያረግሁት አልተበተነም
እምባዬም መሬት ከቶ አልወደቀም

VERSE 2
ለበጎ ሆነ ማልቀስ ማንባቴ
ሰላም ሰፈነ በእልፍኝ በቤቴ
ቅኔ ነጠቅሁኝ የአባ ጊዮርጊስን
ቆምኩኝ ቅዳሴ የህርያቆስን

VERSE 3
የያሬድ ዜማ ሞላ በልቤ
የለም ወጀቡ ቀርባኝ መርከቤ
እዝ
ወገቤን ታጠቅሁ ጭንቀቴን ጥዬ

VERSE 4
ዛሬስ በደስታ ይፍሰስ እምባዬ
የሐዘን ልብሴን ድንግል ቀይራ
የደበዘዘው ህይወቴ በራ
የአራራይ ዜማ ዛሬ ተማርኩኝ

VERSE 5
ፍቅሯ አሸነፈኝ እጄን ሰጠሁኝ
ቅኔ በልቤ ተመላለሰ
የድንግል ክብር ውስጤ ነገሰ
እዝ

VERSE 6
የዘረጋሁት እጄ ተሞላ
ማርያም ሆናልኝ ጥላ ከለላ
የውስጤ ፀሎት ዛሬ ሌላ ነው
የድንግል ክብር ምልጃ ቀየረው

VERSE 7
ዛሬ ጎጆዬ አንፀባረቀች
ያማረ ሰልፌ እንቁ መሰለች
ክንዴ ከፍ ከፍ አለልኝና
ሰዋሁ ለድንግል ይህን ምስጋና

VERSE 8
ዘማሪ ዲያቆን አቤል መክበብ',
      lyrics_transliteration = 'Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 1
Ts’egash gobgntogn qalkidansh (2)
Ez
Tesfa yareghut altebetenem
Embayem meret keto alwedeqem

VERSE 2
Lebego hone malqes manbate
Selam sefene beelfgn bebete
Qine net’eqhugn yeaba giyorgisn
Qomkugn qidase yehryaqosn

VERSE 3
Yeyared zema mola belbe
Yelem wejebu qerbagn merkebe
Ez
Wegeben tat’eqhu ch’nqeten t’ye

VERSE 4
Zares bedesta yifses embaye
Yehezen libsen Dingil qeyra
Yedebezezew hiywete bera
Yeararay zema zare temarkugn

VERSE 5
Fiqrwa ashenefegn ejen set’ehugn
Qine belbe temelalese
Yedngl kibir wist’e negese
Ez

VERSE 6
Yezeregahut eje temola
Maryam honalgn t’la kelela
Yewst’e ts’elot zare lela new
Yedngl kibir milja qeyerew

VERSE 7
Zare gojoye ants’ebareqech
Yamare selfe enqu meselech
Kinde kef kef alelgnna
Sewahu ledngl yihn misgana

VERSE 8
Zemari diyaqon abel mekbeb',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'milikite-nesh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 1
ፀጋሽ ጎብኝቶኝ ቃልኪዳንሽ(2)
እዝ
ተስፋ ያረግሁት አልተበተነም
እምባዬም መሬት ከቶ አልወደቀም

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 2
ለበጎ ሆነ ማልቀስ ማንባቴ
ሰላም ሰፈነ በእልፍኝ በቤቴ
ቅኔ ነጠቅሁኝ የአባ ጊዮርጊስን
ቆምኩኝ ቅዳሴ የህርያቆስን

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 3
የያሬድ ዜማ ሞላ በልቤ
የለም ወጀቡ ቀርባኝ መርከቤ
እዝ
ወገቤን ታጠቅሁ ጭንቀቴን ጥዬ

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 4
ዛሬስ በደስታ ይፍሰስ እምባዬ
የሐዘን ልብሴን ድንግል ቀይራ
የደበዘዘው ህይወቴ በራ
የአራራይ ዜማ ዛሬ ተማርኩኝ

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 5
ፍቅሯ አሸነፈኝ እጄን ሰጠሁኝ
ቅኔ በልቤ ተመላለሰ
የድንግል ክብር ውስጤ ነገሰ
እዝ

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 6
የዘረጋሁት እጄ ተሞላ
ማርያም ሆናልኝ ጥላ ከለላ
የውስጤ ፀሎት ዛሬ ሌላ ነው
የድንግል ክብር ምልጃ ቀየረው

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 7
ዛሬ ጎጆዬ አንፀባረቀች
ያማረ ሰልፌ እንቁ መሰለች
ክንዴ ከፍ ከፍ አለልኝና
ሰዋሁ ለድንግል ይህን ምስጋና

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ

VERSE 8
ዘማሪ ዲያቆን አቤል መክበብ

CHORUS
ምልክቴ ነሽ ደንግል ለህይወቴ
ምልክቴ ነሽ ድንግል ለህይወቴ
ባንች ተፈታሁ ከእስራቴ
ቀና ብያለሁ አሁን ልጅሽ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 1
Ts’egash gobgntogn qalkidansh (2)
Ez
Tesfa yareghut altebetenem
Embayem meret keto alwedeqem

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 2
Lebego hone malqes manbate
Selam sefene beelfgn bebete
Qine net’eqhugn yeaba giyorgisn
Qomkugn qidase yehryaqosn

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 3
Yeyared zema mola belbe
Yelem wejebu qerbagn merkebe
Ez
Wegeben tat’eqhu ch’nqeten t’ye

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 4
Zares bedesta yifses embaye
Yehezen libsen Dingil qeyra
Yedebezezew hiywete bera
Yeararay zema zare temarkugn

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 5
Fiqrwa ashenefegn ejen set’ehugn
Qine belbe temelalese
Yedngl kibir wist’e negese
Ez

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 6
Yezeregahut eje temola
Maryam honalgn t’la kelela
Yewst’e ts’elot zare lela new
Yedngl kibir milja qeyerew

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 7
Zare gojoye ants’ebareqech
Yamare selfe enqu meselech
Kinde kef kef alelgnna
Sewahu ledngl yihn misgana

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh

VERSE 8
Zemari diyaqon abel mekbeb

CHORUS
Milkte nesh dengl lehywete
Milkte nesh Dingil lehywete
Banch tefetahu keesrate
Qena biyalehu ahun lijsh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'milikite-nesh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Min Bitiwedegn New (min-bitiwedegn-new)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ምን ብትወደኝ ነው ምን ብታፈቅረኝ (2)
የአዲስ ዘመንን ቀን ያሳየኸኝ (2)
ኦ አምላኬ ዘመንን ካየው ከተሻገርኩ
ኦ ማስያስ እዘምራለሁ ስቡህ እያልኩ

VERSE 1
ጠዋትም የለኝ ካንተ በቀር ማለዳዬ ነህ
ማምሻዬም አንተ አልሻገርም አንተ ካልፈቀድህ
ማዕበሉን ወጀቡን አሳልፈህ
ጨለማውን አብርተህ

VERSE 2
ላምልክህ ሳልሰለች በዘመኔ
ካንተ ሌላ ማን አለኝ ከቶ ለኔ
እልፍ እንድትሆን አንተ የባረካት ከመሬት ወድቃ
ትላንትናዬን ጠል አልብሰኸው ወዜን ባርከኸው ለዚህ ብበቃ

VERSE 3
ባጌጠችው የምድር መሃል ሆኜ
እቀኛለሁ ምስጋናን ስለ አዳኜ
አበባውን በምድር ስላፈካ
ውዳሴ አለኝ በዘመን ማይለካ

VERSE 4
ፍሬ ፈልገህ መጣህ ወደኔ በብርሀን ጸዳል
ፀሐይ አውጥተህ ልትባርከው ጌታ ፈቅደሃል
ያንተ ወንዞች በውሃ ከተሞሉ
ተራሮችም ምስጋናን ያመጣሉ

VERSE 5
በሸለቆ በአለቱ ንቃቃት
ያሉት ሁሉ ያቀርባሉ ስብሐት
ማለፍ በክንድህ አዲስ ዘመንን ላንተ መዋጀት
ግዛው ዘመኔን ውረሰው ውዴ የኔን ማንነት

VERSE 6
አዝማናቱ ስራህን እያሳየ
ልሁንልህ ከዓለም የተለየ
ብበድልህ ባስከፋህ ሳትቀየም
አዲስ ዘመን አመጣህ ጌታ ለኔም

VERSE 7
ቀን ብቆጥር ዘመን ባሰላ ካልተለወጥኩ
ከጸጋህ ዙፋን በእምነት ቀርቤ ካልተፈወስኩ
ምን ሊረባኝ ካንተ ጋ ካላረጀው
ያለ ቃልህ በዘመን እንዲያው ባጀው

VERSE 8
በአዲስ ዘመን ጌታዬ ስራኝና
ላገልግልህ በዜማ እንደገና',
      lyrics_transliteration = 'Min bitwedegn new min bitafeqregn (2)
Yeadis zemenn qen yasayeኸgn (2)
O amlake zemenn kayew keteshagerku
O masyas ezemralehu sibuh eyalku

VERSE 1
T’ewatm yelegn kante beqer maledaye neh
Mamshayem ante alshagerm ante kalfeqedh
Maebelun wejebun asalfeh
Ch’elemawn abrteh

VERSE 2
Lamlkh salselech bezemene
Kante lela man alegn keto lene
Elf endthon ante yebarekat kemeret wedqa
Tilantnayen t’el albseኸw wezen barkeኸw lezih bibeqa

VERSE 3
Baget’echw yemdr mehal hogne
Eqegnalehu misganan sile adagne
Abebawn bemdr silafeka
Widase alegn bezemen mayleka

VERSE 4
Fire felgeh met’ah wedene bebrhen ts’edal
Ts’ehey awt’teh litbarkew Geta feqdehal
Yante wenzoch bewha ketemolu
Terarochm misganan yamet’alu

VERSE 5
Besheleqo bealetu niqaqat
Yalut hulu yaqerbalu sibhet
Malef bekndh adis zemenn lante mewajet
Gizaw zemenen wiresew wide yenen mannet

VERSE 6
Lihunlh kealem yeteleye
Bibedlh baskefah satqeyem
Adis zemen amet’ah Geta lenem

VERSE 7
Qen biqot’r zemen basela kaltelewet’ku
Kets’egah zufan beemnet qerbe kaltefewesku
Min lirebagn kante ga kalarejew
Yale qalh bezemen endiyaw bajew

VERSE 8
Beadis zemen Getaye siragnna
Lagelglh bezema endegena',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'min-bitiwedegn-new'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምን ብትወደኝ ነው ምን ብታፈቅረኝ (2)
የአዲስ ዘመንን ቀን ያሳየኸኝ (2)
ኦ አምላኬ ዘመንን ካየው ከተሻገርኩ
ኦ ማስያስ እዘምራለሁ ስቡህ እያልኩ

VERSE 1
ጠዋትም የለኝ ካንተ በቀር ማለዳዬ ነህ
ማምሻዬም አንተ አልሻገርም አንተ ካልፈቀድህ
ማዕበሉን ወጀቡን አሳልፈህ
ጨለማውን አብርተህ

CHORUS
ምን ብትወደኝ ነው ምን ብታፈቅረኝ (2)
የአዲስ ዘመንን ቀን ያሳየኸኝ (2)
ኦ አምላኬ ዘመንን ካየው ከተሻገርኩ
ኦ ማስያስ እዘምራለሁ ስቡህ እያልኩ

VERSE 2
ላምልክህ ሳልሰለች በዘመኔ
ካንተ ሌላ ማን አለኝ ከቶ ለኔ
እልፍ እንድትሆን አንተ የባረካት ከመሬት ወድቃ
ትላንትናዬን ጠል አልብሰኸው ወዜን ባርከኸው ለዚህ ብበቃ

CHORUS
ምን ብትወደኝ ነው ምን ብታፈቅረኝ (2)
የአዲስ ዘመንን ቀን ያሳየኸኝ (2)
ኦ አምላኬ ዘመንን ካየው ከተሻገርኩ
ኦ ማስያስ እዘምራለሁ ስቡህ እያልኩ

VERSE 3
ባጌጠችው የምድር መሃል ሆኜ
እቀኛለሁ ምስጋናን ስለ አዳኜ
አበባውን በምድር ስላፈካ
ውዳሴ አለኝ በዘመን ማይለካ

CHORUS
ምን ብትወደኝ ነው ምን ብታፈቅረኝ (2)
የአዲስ ዘመንን ቀን ያሳየኸኝ (2)
ኦ አምላኬ ዘመንን ካየው ከተሻገርኩ
ኦ ማስያስ እዘምራለሁ ስቡህ እያልኩ

VERSE 4
ፍሬ ፈልገህ መጣህ ወደኔ በብርሀን ጸዳል
ፀሐይ አውጥተህ ልትባርከው ጌታ ፈቅደሃል
ያንተ ወንዞች በውሃ ከተሞሉ
ተራሮችም ምስጋናን ያመጣሉ

CHORUS
ምን ብትወደኝ ነው ምን ብታፈቅረኝ (2)
የአዲስ ዘመንን ቀን ያሳየኸኝ (2)
ኦ አምላኬ ዘመንን ካየው ከተሻገርኩ
ኦ ማስያስ እዘምራለሁ ስቡህ እያልኩ

VERSE 5
በሸለቆ በአለቱ ንቃቃት
ያሉት ሁሉ ያቀርባሉ ስብሐት
ማለፍ በክንድህ አዲስ ዘመንን ላንተ መዋጀት
ግዛው ዘመኔን ውረሰው ውዴ የኔን ማንነት

CHORUS
ምን ብትወደኝ ነው ምን ብታፈቅረኝ (2)
የአዲስ ዘመንን ቀን ያሳየኸኝ (2)
ኦ አምላኬ ዘመንን ካየው ከተሻገርኩ
ኦ ማስያስ እዘምራለሁ ስቡህ እያልኩ

VERSE 6
አዝማናቱ ስራህን እያሳየ
ልሁንልህ ከዓለም የተለየ
ብበድልህ ባስከፋህ ሳትቀየም
አዲስ ዘመን አመጣህ ጌታ ለኔም

CHORUS
ምን ብትወደኝ ነው ምን ብታፈቅረኝ (2)
የአዲስ ዘመንን ቀን ያሳየኸኝ (2)
ኦ አምላኬ ዘመንን ካየው ከተሻገርኩ
ኦ ማስያስ እዘምራለሁ ስቡህ እያልኩ

VERSE 7
ቀን ብቆጥር ዘመን ባሰላ ካልተለወጥኩ
ከጸጋህ ዙፋን በእምነት ቀርቤ ካልተፈወስኩ
ምን ሊረባኝ ካንተ ጋ ካላረጀው
ያለ ቃልህ በዘመን እንዲያው ባጀው

CHORUS
ምን ብትወደኝ ነው ምን ብታፈቅረኝ (2)
የአዲስ ዘመንን ቀን ያሳየኸኝ (2)
ኦ አምላኬ ዘመንን ካየው ከተሻገርኩ
ኦ ማስያስ እዘምራለሁ ስቡህ እያልኩ

VERSE 8
በአዲስ ዘመን ጌታዬ ስራኝና
ላገልግልህ በዜማ እንደገና

CHORUS
ምን ብትወደኝ ነው ምን ብታፈቅረኝ (2)
የአዲስ ዘመንን ቀን ያሳየኸኝ (2)
ኦ አምላኬ ዘመንን ካየው ከተሻገርኩ
ኦ ማስያስ እዘምራለሁ ስቡህ እያልኩ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Min bitwedegn new min bitafeqregn (2)
Yeadis zemenn qen yasayeኸgn (2)
O amlake zemenn kayew keteshagerku
O masyas ezemralehu sibuh eyalku

VERSE 1
T’ewatm yelegn kante beqer maledaye neh
Mamshayem ante alshagerm ante kalfeqedh
Maebelun wejebun asalfeh
Ch’elemawn abrteh

CHORUS
Min bitwedegn new min bitafeqregn (2)
Yeadis zemenn qen yasayeኸgn (2)
O amlake zemenn kayew keteshagerku
O masyas ezemralehu sibuh eyalku

VERSE 2
Lamlkh salselech bezemene
Kante lela man alegn keto lene
Elf endthon ante yebarekat kemeret wedqa
Tilantnayen t’el albseኸw wezen barkeኸw lezih bibeqa

CHORUS
Min bitwedegn new min bitafeqregn (2)
Yeadis zemenn qen yasayeኸgn (2)
O amlake zemenn kayew keteshagerku
O masyas ezemralehu sibuh eyalku

VERSE 3
Baget’echw yemdr mehal hogne
Eqegnalehu misganan sile adagne
Abebawn bemdr silafeka
Widase alegn bezemen mayleka

CHORUS
Min bitwedegn new min bitafeqregn (2)
Yeadis zemenn qen yasayeኸgn (2)
O amlake zemenn kayew keteshagerku
O masyas ezemralehu sibuh eyalku

VERSE 4
Fire felgeh met’ah wedene bebrhen ts’edal
Ts’ehey awt’teh litbarkew Geta feqdehal
Yante wenzoch bewha ketemolu
Terarochm misganan yamet’alu

CHORUS
Min bitwedegn new min bitafeqregn (2)
Yeadis zemenn qen yasayeኸgn (2)
O amlake zemenn kayew keteshagerku
O masyas ezemralehu sibuh eyalku

VERSE 5
Besheleqo bealetu niqaqat
Yalut hulu yaqerbalu sibhet
Malef bekndh adis zemenn lante mewajet
Gizaw zemenen wiresew wide yenen mannet

CHORUS
Min bitwedegn new min bitafeqregn (2)
Yeadis zemenn qen yasayeኸgn (2)
O amlake zemenn kayew keteshagerku
O masyas ezemralehu sibuh eyalku

VERSE 6
CHORUS
Lihunlh kealem yeteleye
Bibedlh baskefah satqeyem
Adis zemen amet’ah Geta lenem

CHORUS
Min bitwedegn new min bitafeqregn (2)
Yeadis zemenn qen yasayeኸgn (2)
O amlake zemenn kayew keteshagerku
O masyas ezemralehu sibuh eyalku

VERSE 7
Qen biqot’r zemen basela kaltelewet’ku
Kets’egah zufan beemnet qerbe kaltefewesku
Min lirebagn kante ga kalarejew
Yale qalh bezemen endiyaw bajew

CHORUS
Min bitwedegn new min bitafeqregn (2)
Yeadis zemenn qen yasayeኸgn (2)
O amlake zemenn kayew keteshagerku
O masyas ezemralehu sibuh eyalku

VERSE 8
Beadis zemen Getaye siragnna
Lagelglh bezema endegena

CHORUS
Min bitwedegn new min bitafeqregn (2)
Yeadis zemenn qen yasayeኸgn (2)
O amlake zemenn kayew keteshagerku
O masyas ezemralehu sibuh eyalku'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'min-bitiwedegn-new', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Min Biye (min-biye)
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
  WHERE slug = 'min-biye'
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
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'min-biye', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Min Libel (min-libel)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ

VERSE 1
በሞት ጥላ ምድር ያሳለፈኝ መርቶ
ደግሞም ዛሬ አነሣኝ በልጁ ሞት ጠርቶ
ክብሬን ለማይረባ ነገር አልለውጥም
ከአመድ ስላነሳኝ ክብሩ ለዘለዓለም

VERSE 2
የሺሖርን ውኃ ለምን እጠጣለሁ
ፊቴን የማዞረው ምን አግኝቼበት ነው
ሁልጊዜ እየራራ ሳይዘነጋኝ ላፍታ
እኔ የዓይኑ ስስት እርሱ የኔ ርካታ

VERSE 3
ስለምን ሆምጣጣ ፍሬ አፈራ ብለህ
እኔ አልተነቀልኩም ስለፍጹም ፍቅርህ
ቢቀላ እንዳለላ ነጣ እንደባዘቶ
የተከፋው ልቤ ሄደ ተደስቶ

VERSE 4
ከወዜ ላይ ቀለብ ምናልባት ቢሰፍሩ
ወራቶቼ እንባን መከራን ቢያዘሩ
ልቤን ያስነከሰው ያ ቀን አለፈና
የበፍታዬን ኤፋድ ለበስኩ እንደገና',
      lyrics_transliteration = 'Engdih min libel
Engdih min lawra
Ejen beafe asch’anegn
YeAmanuel sira

VERSE 1
Bemot t’la midr yasalefegn merto
Degmom zare anesagn belju mot t’erto
Kibren lemayreba neger allewt’m
Keamed silanesagn kibru lezelealem

VERSE 2
Yeshihorn wiha lemn et’et’alehu
Fiten yemazorew min aggnchebet new
Hulgize eyerara sayzenegagn lafta
Ene yeaynu sist ersu yene rikata

VERSE 3
Silemn homt’at’a fire afera bileh
Ene alteneqelkum silefts’um fiqrh
Biqela endalela net’a endebazeto
Yetekefaw libe hede tedesto

VERSE 4
Keweze lay qeleb minalbat bisefru
Weratoche enban mekeran biyazeru
Liben yasnekesew ya qen alefena
Yebeftayen efad lebesku endegena',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'min-libel'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ

VERSE 1
በሞት ጥላ ምድር ያሳለፈኝ መርቶ
ደግሞም ዛሬ አነሣኝ በልጁ ሞት ጠርቶ
ክብሬን ለማይረባ ነገር አልለውጥም
ከአመድ ስላነሳኝ ክብሩ ለዘለዓለም

CHORUS
እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ

VERSE 2
የሺሖርን ውኃ ለምን እጠጣለሁ
ፊቴን የማዞረው ምን አግኝቼበት ነው
ሁልጊዜ እየራራ ሳይዘነጋኝ ላፍታ
እኔ የዓይኑ ስስት እርሱ የኔ ርካታ

CHORUS
እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ

VERSE 3
ስለምን ሆምጣጣ ፍሬ አፈራ ብለህ
እኔ አልተነቀልኩም ስለፍጹም ፍቅርህ
ቢቀላ እንዳለላ ነጣ እንደባዘቶ
የተከፋው ልቤ ሄደ ተደስቶ

CHORUS
እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ

VERSE 4
ከወዜ ላይ ቀለብ ምናልባት ቢሰፍሩ
ወራቶቼ እንባን መከራን ቢያዘሩ
ልቤን ያስነከሰው ያ ቀን አለፈና
የበፍታዬን ኤፋድ ለበስኩ እንደገና

CHORUS
እንግዲህ ምን ልበል
እንግዲህ ምን ላውራ
እጄን በአፌ አስጫነኝ
የአማኑኤል ስራ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Engdih min libel
Engdih min lawra
Ejen beafe asch’anegn
YeAmanuel sira

VERSE 1
Bemot t’la midr yasalefegn merto
Degmom zare anesagn belju mot t’erto
Kibren lemayreba neger allewt’m
Keamed silanesagn kibru lezelealem

CHORUS
Engdih min libel
Engdih min lawra
Ejen beafe asch’anegn
YeAmanuel sira

VERSE 2
Yeshihorn wiha lemn et’et’alehu
Fiten yemazorew min aggnchebet new
Hulgize eyerara sayzenegagn lafta
Ene yeaynu sist ersu yene rikata

CHORUS
Engdih min libel
Engdih min lawra
Ejen beafe asch’anegn
YeAmanuel sira

VERSE 3
Silemn homt’at’a fire afera bileh
Ene alteneqelkum silefts’um fiqrh
Biqela endalela net’a endebazeto
Yetekefaw libe hede tedesto

CHORUS
Engdih min libel
Engdih min lawra
Ejen beafe asch’anegn
YeAmanuel sira

VERSE 4
Keweze lay qeleb minalbat bisefru
Weratoche enban mekeran biyazeru
Liben yasnekesew ya qen alefena
Yebeftayen efad lebesku endegena

CHORUS
Engdih min libel
Engdih min lawra
Ejen beafe asch’anegn
YeAmanuel sira'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'min-libel', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: min semah yohanes (min-semah-yohanes)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ምን ሰማህ ዮሃንስ በማህፀን ሳለህ (2)
ህጻን ሆነህ ነብይ ለክብር የተጠራህ
እንደ እምቦሳ ጥጃ ያዘለልህ ደስታ
ምን ዓይነት ድምጽ ነው ምን ዓይነት ሰላምታ(2)

VERSE 1
ከተፈጥሮ በላይ ያሰገደህ ክብር
እንዴት ቢገባህ ነው የእናታችን ፍቅር(2)
ሌላ ድምጽ አልሰማም ከእንግዲህ በኋላ
ለውጦኛል ና የሰላምታ ቃሏ (2)

VERSE 2
በረሃ ያስገባህ ለብዙ ዘመናት
ምን ያለ ራእይ ነው እንዴት ያለ ብስራት
እንደ አዲስ ምስጋና ስልቱ የተዋበ
ተደምጦ የማያውቅ ጭራሽ ያልታሰበ

VERSE 3
ከሴት ከተገኙ ከደቂቀ አዳም
ድንግል ስለሆነ በህይወቱ ፍፁም
ከማህፀን ሳለ ተመርጦ በጌታ
ለማዳመጥ በቃ የኪዳን ሰላምታ',
      lyrics_transliteration = 'Min semah yohans bemahts’en saleh (2)
Hits’an honeh neby lekbr yetet’erah
Ende embosa t’ja yazelelh desta
Min aynet dimts’ new min aynet selamta (2)

VERSE 1
Ketefet’ro belay yasegedeh kibir
Endet bigebah new yeenatachn fiqr (2)
Lela dimts’ alsemam keengdih behwala
Lewt’ognal na yeselamta qalwa (2)

VERSE 2
Bereha yasgebah lebzu zemenat
Min yale raey new endet yale bisrat
Ende adis misgana siltu yetewabe
Tedemt’o yemayawq ch’rash yaltasebe

VERSE 3
Keset ketegegnu kedeqiqe adam
Dingil silehone behywetu fits’um
Kemahts’en sale temert’o begeta
Lemadamet’ beqa yekidan selamta',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'min-semah-yohanes'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምን ሰማህ ዮሃንስ በማህፀን ሳለህ (2)
ህጻን ሆነህ ነብይ ለክብር የተጠራህ
እንደ እምቦሳ ጥጃ ያዘለልህ ደስታ
ምን ዓይነት ድምጽ ነው ምን ዓይነት ሰላምታ(2)

VERSE 1
ከተፈጥሮ በላይ ያሰገደህ ክብር
እንዴት ቢገባህ ነው የእናታችን ፍቅር(2)
ሌላ ድምጽ አልሰማም ከእንግዲህ በኋላ
ለውጦኛል ና የሰላምታ ቃሏ (2)

CHORUS
ምን ሰማህ ዮሃንስ በማህፀን ሳለህ (2)
ህጻን ሆነህ ነብይ ለክብር የተጠራህ
እንደ እምቦሳ ጥጃ ያዘለልህ ደስታ
ምን ዓይነት ድምጽ ነው ምን ዓይነት ሰላምታ(2)

VERSE 2
በረሃ ያስገባህ ለብዙ ዘመናት
ምን ያለ ራእይ ነው እንዴት ያለ ብስራት
እንደ አዲስ ምስጋና ስልቱ የተዋበ
ተደምጦ የማያውቅ ጭራሽ ያልታሰበ

CHORUS
ምን ሰማህ ዮሃንስ በማህፀን ሳለህ (2)
ህጻን ሆነህ ነብይ ለክብር የተጠራህ
እንደ እምቦሳ ጥጃ ያዘለልህ ደስታ
ምን ዓይነት ድምጽ ነው ምን ዓይነት ሰላምታ(2)

VERSE 3
ከሴት ከተገኙ ከደቂቀ አዳም
ድንግል ስለሆነ በህይወቱ ፍፁም
ከማህፀን ሳለ ተመርጦ በጌታ
ለማዳመጥ በቃ የኪዳን ሰላምታ

CHORUS
ምን ሰማህ ዮሃንስ በማህፀን ሳለህ (2)
ህጻን ሆነህ ነብይ ለክብር የተጠራህ
እንደ እምቦሳ ጥጃ ያዘለልህ ደስታ
ምን ዓይነት ድምጽ ነው ምን ዓይነት ሰላምታ(2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Min semah yohans bemahts’en saleh (2)
Hits’an honeh neby lekbr yetet’erah
Ende embosa t’ja yazelelh desta
Min aynet dimts’ new min aynet selamta (2)

VERSE 1
Ketefet’ro belay yasegedeh kibir
Endet bigebah new yeenatachn fiqr (2)
Lela dimts’ alsemam keengdih behwala
Lewt’ognal na yeselamta qalwa (2)

CHORUS
Min semah yohans bemahts’en saleh (2)
Hits’an honeh neby lekbr yetet’erah
Ende embosa t’ja yazelelh desta
Min aynet dimts’ new min aynet selamta (2)

VERSE 2
Bereha yasgebah lebzu zemenat
Min yale raey new endet yale bisrat
Ende adis misgana siltu yetewabe
Tedemt’o yemayawq ch’rash yaltasebe

CHORUS
Min semah yohans bemahts’en saleh (2)
Hits’an honeh neby lekbr yetet’erah
Ende embosa t’ja yazelelh desta
Min aynet dimts’ new min aynet selamta (2)

VERSE 3
Keset ketegegnu kedeqiqe adam
Dingil silehone behywetu fits’um
Kemahts’en sale temert’o begeta
Lemadamet’ beqa yekidan selamta

CHORUS
Min semah yohans bemahts’en saleh (2)
Hits’an honeh neby lekbr yetet’erah
Ende embosa t’ja yazelelh desta
Min aynet dimts’ new min aynet selamta (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'min-semah-yohanes', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Min Semah Yohannes (min-semah-yohannes)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ምን ሰማህ ዮሐንስ በማህፀን ሳለህ/2/
ህጻን ሆነህ ነብይ ለክብር የተጠራህ/2/

VERSE 1
እንደ አንበሳ ጥጃ ያዘለለ ደስታ/2/
ምን ዓይነት ድምጽ ነው ምን አይነት ሰላምታ/2/

VERSE 2
ከተፈጥሮ በላይ ያሰገደህ ክብር
እንዴት ቢገባህ ነው የአምላክ እናት ፍቅር/2/

VERSE 3
ሌላ ድምጽ አልሰማም ከእንግዲህ በኋላ
ለውጦኛል እና የሰላምታ ቃሏ/2/

VERSE 4
በረሃ ያስገባህ ለብዙ ዘመናት
ምን ያለ ራዕይ እንዴት ያለ ብስራት/2/

VERSE 5
እንደ አዲስ ምስጋና ስልቱ የተዋበ
ተደምጦ የማያውቅ ጭራሽ ያልታሰበ/2/

VERSE 6
ከሴት የተገኘ ከደቂቀ አዳም
ድንግል ስለሆነ በሕይወቱ ፍፁም/2/

VERSE 7
ከማህፀን ሳለ ተመርጦ በጌታ
ለማዳመጥ በቃ የኪዳን ሰላምታ/2/',
      lyrics_transliteration = 'Min semah Yohannes bemah’tsen saleh (x2)
Hits’an honeh nebiy lekibir yetet’erah (x2)

VERSE 1
Ende anbessa tigija yazelele desta (x2)
Min ayinet dimts new min ayinet selamta (x2)

VERSE 2
Ketefet’ro belay yasegedah kibir
Endet bigebah new yeAmlak enat fiqir (x2)

VERSE 3
Lela dimts alsemam ke’engidih behuala
Lewtogna new ye selamta qalwa (x2)

VERSE 4
Bereha yasgebah lebizu zemenat
Min yale ra’iy endet yale bisrat (x2)

VERSE 5
Ende adis misgana seltu yetewabe
Tedemto yemayawik ch’rash yaltasebe (x2)

VERSE 6
Keset yetegenye kedekike Adam
Dingil silehone behiywetu fits’um (x2)

VERSE 7
Kemah’tsen sale temerto bege’ta
Lemadamegt beqa yekidan selamta (x2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'min-semah-yohannes'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምን ሰማህ ዮሐንስ በማህፀን ሳለህ/2/
ህጻን ሆነህ ነብይ ለክብር የተጠራህ/2/

VERSE 1
እንደ አንበሳ ጥጃ ያዘለለ ደስታ/2/
ምን ዓይነት ድምጽ ነው ምን አይነት ሰላምታ/2/

CHORUS
ምን ሰማህ ዮሐንስ በማህፀን ሳለህ/2/
ህጻን ሆነህ ነብይ ለክብር የተጠራህ/2/

VERSE 2
ከተፈጥሮ በላይ ያሰገደህ ክብር
እንዴት ቢገባህ ነው የአምላክ እናት ፍቅር/2/

CHORUS
ምን ሰማህ ዮሐንስ በማህፀን ሳለህ/2/
ህጻን ሆነህ ነብይ ለክብር የተጠራህ/2/

VERSE 3
ሌላ ድምጽ አልሰማም ከእንግዲህ በኋላ
ለውጦኛል እና የሰላምታ ቃሏ/2/

CHORUS
ምን ሰማህ ዮሐንስ በማህፀን ሳለህ/2/
ህጻን ሆነህ ነብይ ለክብር የተጠራህ/2/

VERSE 4
በረሃ ያስገባህ ለብዙ ዘመናት
ምን ያለ ራዕይ እንዴት ያለ ብስራት/2/

CHORUS
ምን ሰማህ ዮሐንስ በማህፀን ሳለህ/2/
ህጻን ሆነህ ነብይ ለክብር የተጠራህ/2/

VERSE 5
እንደ አዲስ ምስጋና ስልቱ የተዋበ
ተደምጦ የማያውቅ ጭራሽ ያልታሰበ/2/

CHORUS
ምን ሰማህ ዮሐንስ በማህፀን ሳለህ/2/
ህጻን ሆነህ ነብይ ለክብር የተጠራህ/2/

VERSE 6
ከሴት የተገኘ ከደቂቀ አዳም
ድንግል ስለሆነ በሕይወቱ ፍፁም/2/

CHORUS
ምን ሰማህ ዮሐንስ በማህፀን ሳለህ/2/
ህጻን ሆነህ ነብይ ለክብር የተጠራህ/2/

VERSE 7
ከማህፀን ሳለ ተመርጦ በጌታ
ለማዳመጥ በቃ የኪዳን ሰላምታ/2/

CHORUS
ምን ሰማህ ዮሐንስ በማህፀን ሳለህ/2/
ህጻን ሆነህ ነብይ ለክብር የተጠራህ/2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Min semah Yohannes bemah’tsen saleh (x2)
Hits’an honeh nebiy lekibir yetet’erah (x2)

VERSE 1
Ende anbessa tigija yazelele desta (x2)
Min ayinet dimts new min ayinet selamta (x2)

CHORUS
Min semah Yohannes bemah’tsen saleh (x2)
Hits’an honeh nebiy lekibir yetet’erah (x2)

VERSE 2
Ketefet’ro belay yasegedah kibir
Endet bigebah new yeAmlak enat fiqir (x2)

CHORUS
Min semah Yohannes bemah’tsen saleh (x2)
Hits’an honeh nebiy lekibir yetet’erah (x2)

VERSE 3
Lela dimts alsemam ke’engidih behuala
Lewtogna new ye selamta qalwa (x2)

CHORUS
Min semah Yohannes bemah’tsen saleh (x2)
Hits’an honeh nebiy lekibir yetet’erah (x2)

VERSE 4
Bereha yasgebah lebizu zemenat
Min yale ra’iy endet yale bisrat (x2)

CHORUS
Min semah Yohannes bemah’tsen saleh (x2)
Hits’an honeh nebiy lekibir yetet’erah (x2)

VERSE 5
Ende adis misgana seltu yetewabe
Tedemto yemayawik ch’rash yaltasebe (x2)

CHORUS
Min semah Yohannes bemah’tsen saleh (x2)
Hits’an honeh nebiy lekibir yetet’erah (x2)

VERSE 6
Keset yetegenye kedekike Adam
Dingil silehone behiywetu fits’um (x2)

CHORUS
Min semah Yohannes bemah’tsen saleh (x2)
Hits’an honeh nebiy lekibir yetet’erah (x2)

VERSE 7
Kemah’tsen sale temerto bege’ta
Lemadamegt beqa yekidan selamta (x2)

CHORUS
Min semah Yohannes bemah’tsen saleh (x2)
Hits’an honeh nebiy lekibir yetet’erah (x2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'min-semah-yohannes', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mindaye Berhanu- Selam Leki (mindaye-berhanu-selam-leki)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሠላም ለኪ እንዘ ንሠግድ ንብለኪ
ማርያም እምነ ናስትበቑ አኪ
እምአርዌ ናዊ ተምሕፀነ ብኪ ፪
በ እንተ ሐና እምኪ ወ ኢያቄም አቡኪ

VERSE 1
ማህበረነ ዮም /፬/ድንግል ባርኪ ፪',
      lyrics_transliteration = 'Selam leki enze nisegd nibleki
Maryam emne nastbeቑ aki
Emarwe nawi temhts’ene biki 2
Be ente hena emki we iyaqem abuki

VERSE 1
Mahberene yom (4)Dingil barki 2',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mindaye-berhanu-selam-leki'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሠላም ለኪ እንዘ ንሠግድ ንብለኪ
ማርያም እምነ ናስትበቑ አኪ
እምአርዌ ናዊ ተምሕፀነ ብኪ ፪
በ እንተ ሐና እምኪ ወ ኢያቄም አቡኪ

VERSE 1
ማህበረነ ዮም /፬/ድንግል ባርኪ ፪

CHORUS
ሠላም ለኪ እንዘ ንሠግድ ንብለኪ
ማርያም እምነ ናስትበቑ አኪ
እምአርዌ ናዊ ተምሕፀነ ብኪ ፪
በ እንተ ሐና እምኪ ወ ኢያቄም አቡኪ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Selam leki enze nisegd nibleki
Maryam emne nastbeቑ aki
Emarwe nawi temhts’ene biki 2
Be ente hena emki we iyaqem abuki

VERSE 1
Mahberene yom (4)Dingil barki 2

CHORUS
Selam leki enze nisegd nibleki
Maryam emne nastbeቑ aki
Emarwe nawi temhts’ene biki 2
Be ente hena emki we iyaqem abuki'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mindaye-berhanu-selam-leki', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Miragn (miragn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ጌታ ሆይ መንገድህን ምራኝ ፍለጋህንም አስተምረኝ
የመድኀኒቴ አምላክ ቃልህ ምርኩዝ ይሁነኝ
ከሰዎች ተሸሽጋ ፍቅርህን የተጠማች አንዲት ነፍስ
በሠማርያ ስትመጣ ከያዕቆብ ጉድጓድ ብትደርስ

VERSE 1
ጌታ ቀድመህ ተገኝተህ ልታቀናት ከድካሟ
የልቧን ስትነግራት በቃልህ ዳነች ከህመሟ
(ቅድመ አዝማች)
ንጹህ ልቡና ስጠኝ ጌታዬ ንጹህ ልቡና

VERSE 2
ልመለስ ከአጸድህ አምላኬ በቤትህ ልጽና
በፊልጶስ ጥሪ ሲመጣ በሰዎች ፊት ሳትገልጥበት
ከበለስ ስር እንዳየኸው በሥውር ቃልህ ገለፅክለት
ሽንገላ በልቡ የሌለ ንጹሕ እሥራኤላዊ

VERSE 3
ሊከተልህ ወደደ ጉዞውም ሆነ ሰማያዊ
(ቅድመ አዝማች)
የፀፀት እንባን ያዘለች ከእግችህ ስር ለንሰሀ ተደፍታ
ሽቱ በላይህ አኖረች አልባስጥሮስን ለጌታ

VERSE 4
በጎ እረኛ ጌታችን ለአንዷ በግህ የምታዝን
ከኃጢአት ደዌ አዳንካት አስተምረኃት ወንጌልን
(ቅድመ አዝማች)',
      lyrics_transliteration = 'Geta hoy mengedhn miragn filegahnm astemregn
Yemedhenite amlak qalh mirkuz yihunegn
Kesewoch tesheshga fiqrhn yetet’emach andit nefs
Besemarya sitmet’a keyaeqob gudgwad bitders

VERSE 1
Geta qedmeh tegegnteh litaqenat kedkamwa
Yelbwan sitnegrat beqalh danech kehmemwa
(qidme azmach)
Nits’uh libuna sit’egn Getaye nits’uh libuna

VERSE 2
Limeles keats’edh amlake bebeth lits’na
Befilp’os t’ri simet’a besewoch fit satgelt’bet
Kebeles sir endayeኸw beswr qalh gelets’klet
Shngela belbu yelele nits’uh esraelawi

VERSE 3
Liketelh wedede guzowm hone semayawi
(qidme azmach)
Yets’ets’et enban yazelech keegchh sir lensehe tedefta
Shtu belayh anorech albast’rosn legeta

VERSE 4
Bego eregna Getachen leandwa begh yemtazn
Kehat’iat dewe adankat astemrehat wengeln
(qidme azmach)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'miragn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጌታ ሆይ መንገድህን ምራኝ ፍለጋህንም አስተምረኝ
የመድኀኒቴ አምላክ ቃልህ ምርኩዝ ይሁነኝ
ከሰዎች ተሸሽጋ ፍቅርህን የተጠማች አንዲት ነፍስ
በሠማርያ ስትመጣ ከያዕቆብ ጉድጓድ ብትደርስ

VERSE 1
ጌታ ቀድመህ ተገኝተህ ልታቀናት ከድካሟ
የልቧን ስትነግራት በቃልህ ዳነች ከህመሟ
(ቅድመ አዝማች)
ንጹህ ልቡና ስጠኝ ጌታዬ ንጹህ ልቡና

CHORUS
ጌታ ሆይ መንገድህን ምራኝ ፍለጋህንም አስተምረኝ
የመድኀኒቴ አምላክ ቃልህ ምርኩዝ ይሁነኝ
ከሰዎች ተሸሽጋ ፍቅርህን የተጠማች አንዲት ነፍስ
በሠማርያ ስትመጣ ከያዕቆብ ጉድጓድ ብትደርስ

VERSE 2
ልመለስ ከአጸድህ አምላኬ በቤትህ ልጽና
በፊልጶስ ጥሪ ሲመጣ በሰዎች ፊት ሳትገልጥበት
ከበለስ ስር እንዳየኸው በሥውር ቃልህ ገለፅክለት
ሽንገላ በልቡ የሌለ ንጹሕ እሥራኤላዊ

CHORUS
ጌታ ሆይ መንገድህን ምራኝ ፍለጋህንም አስተምረኝ
የመድኀኒቴ አምላክ ቃልህ ምርኩዝ ይሁነኝ
ከሰዎች ተሸሽጋ ፍቅርህን የተጠማች አንዲት ነፍስ
በሠማርያ ስትመጣ ከያዕቆብ ጉድጓድ ብትደርስ

VERSE 3
ሊከተልህ ወደደ ጉዞውም ሆነ ሰማያዊ
(ቅድመ አዝማች)
የፀፀት እንባን ያዘለች ከእግችህ ስር ለንሰሀ ተደፍታ
ሽቱ በላይህ አኖረች አልባስጥሮስን ለጌታ

CHORUS
ጌታ ሆይ መንገድህን ምራኝ ፍለጋህንም አስተምረኝ
የመድኀኒቴ አምላክ ቃልህ ምርኩዝ ይሁነኝ
ከሰዎች ተሸሽጋ ፍቅርህን የተጠማች አንዲት ነፍስ
በሠማርያ ስትመጣ ከያዕቆብ ጉድጓድ ብትደርስ

VERSE 4
በጎ እረኛ ጌታችን ለአንዷ በግህ የምታዝን
ከኃጢአት ደዌ አዳንካት አስተምረኃት ወንጌልን
(ቅድመ አዝማች)

CHORUS
ጌታ ሆይ መንገድህን ምራኝ ፍለጋህንም አስተምረኝ
የመድኀኒቴ አምላክ ቃልህ ምርኩዝ ይሁነኝ
ከሰዎች ተሸሽጋ ፍቅርህን የተጠማች አንዲት ነፍስ
በሠማርያ ስትመጣ ከያዕቆብ ጉድጓድ ብትደርስ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Geta hoy mengedhn miragn filegahnm astemregn
Yemedhenite amlak qalh mirkuz yihunegn
Kesewoch tesheshga fiqrhn yetet’emach andit nefs
Besemarya sitmet’a keyaeqob gudgwad bitders

VERSE 1
Geta qedmeh tegegnteh litaqenat kedkamwa
Yelbwan sitnegrat beqalh danech kehmemwa
(qidme azmach)
Nits’uh libuna sit’egn Getaye nits’uh libuna

CHORUS
Geta hoy mengedhn miragn filegahnm astemregn
Yemedhenite amlak qalh mirkuz yihunegn
Kesewoch tesheshga fiqrhn yetet’emach andit nefs
Besemarya sitmet’a keyaeqob gudgwad bitders

VERSE 2
Limeles keats’edh amlake bebeth lits’na
Befilp’os t’ri simet’a besewoch fit satgelt’bet
Kebeles sir endayeኸw beswr qalh gelets’klet
Shngela belbu yelele nits’uh esraelawi

CHORUS
Geta hoy mengedhn miragn filegahnm astemregn
Yemedhenite amlak qalh mirkuz yihunegn
Kesewoch tesheshga fiqrhn yetet’emach andit nefs
Besemarya sitmet’a keyaeqob gudgwad bitders

VERSE 3
Liketelh wedede guzowm hone semayawi
(qidme azmach)
Yets’ets’et enban yazelech keegchh sir lensehe tedefta
Shtu belayh anorech albast’rosn legeta

CHORUS
Geta hoy mengedhn miragn filegahnm astemregn
Yemedhenite amlak qalh mirkuz yihunegn
Kesewoch tesheshga fiqrhn yetet’emach andit nefs
Besemarya sitmet’a keyaeqob gudgwad bitders

VERSE 4
Bego eregna Getachen leandwa begh yemtazn
Kehat’iat dewe adankat astemrehat wengeln
(qidme azmach)

CHORUS
Geta hoy mengedhn miragn filegahnm astemregn
Yemedhenite amlak qalh mirkuz yihunegn
Kesewoch tesheshga fiqrhn yetet’emach andit nefs
Besemarya sitmet’a keyaeqob gudgwad bitders'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'miragn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mirtinesh Tilahun {{Yalante Geta Desta Mech Ale }} (mirtinesh-tilahun-yalante-geta-desta-mech-ale)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ያላንተ ጌታ ደስታ መች ኣለ ያላንተ ኣምላኬ ሂወት መች አለ
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
ኣዝ',
      lyrics_transliteration = 'Yalante Geta desta mech ale yalante amlake hiwet mech ale
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
Az',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mirtinesh-tilahun-yalante-geta-desta-mech-ale'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
እጆቼን ይዘህ ኣንተ እየመራህ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Ejochen yizeh ante eyemerah'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mirtinesh-tilahun-yalante-geta-desta-mech-ale', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Misgana be Meqdesih (misgana-be-meqdesih)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ

VERSE 1
ሰገነት አይመቸኝ ካባዬ ክብር አይሆነኝ
ሁሉንም ንቄዋለው የአንተን ቤት መርጫለው (፪)

VERSE 2
ያረጃል የዓለም ዝና ጥበብም ሆኖ መና
አንተ ግን ያው አንተ ነህ በሁሉ ትፀናለህ (፪)

VERSE 3
ከሰማይ በዓይንህ ታየው በፍቅርህ ተጎበኘው
በባሕሪህ ባለጸጋ ፈወስከኝ በደም ዋጋ (፪)

VERSE 4
ቃልህን ነፍሴ ሰምታ ተዋበች በእልልታ
ወደ እግርህ መረገጫ መስገዴ አለው ብልጫ (፪)',
      lyrics_transliteration = 'Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta

VERSE 1
Segenet ayimecheghe, kabaye kibr ayhoneneghe
Hulunim neqewalew, ye’anten bet merchalew (2)

VERSE 2
Yarejal yealem zina, tibebim hono mena
Ante gin yaw ante neh, behulu titsenaleh (2)

VERSE 3
Kesemay beayinhi tayewe, befikrih tegobeghew
Bebahrih baletṣega, feweskegh bedem waga (2)

VERSE 4
Qalihn nefse semta tewabetch bellilta
Wede egerih meregecha, mesgede alew bilcha (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'misgana-be-meqdesih'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ

VERSE 1
ሰገነት አይመቸኝ ካባዬ ክብር አይሆነኝ
ሁሉንም ንቄዋለው የአንተን ቤት መርጫለው (፪)

CHORUS
ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ

VERSE 2
ያረጃል የዓለም ዝና ጥበብም ሆኖ መና
አንተ ግን ያው አንተ ነህ በሁሉ ትፀናለህ (፪)

CHORUS
ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ

VERSE 3
ከሰማይ በዓይንህ ታየው በፍቅርህ ተጎበኘው
በባሕሪህ ባለጸጋ ፈወስከኝ በደም ዋጋ (፪)

CHORUS
ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ

VERSE 4
ቃልህን ነፍሴ ሰምታ ተዋበች በእልልታ
ወደ እግርህ መረገጫ መስገዴ አለው ብልጫ (፪)

CHORUS
ምስጋና በመቅደስህ ዝማሬ በማደርያህ
ልሰዋ ጠዋት ማታ ክብሬ ነህ የኔ ጌታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta

VERSE 1
Segenet ayimecheghe, kabaye kibr ayhoneneghe
Hulunim neqewalew, ye’anten bet merchalew (2)

CHORUS
Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta

VERSE 2
Yarejal yealem zina, tibebim hono mena
Ante gin yaw ante neh, behulu titsenaleh (2)

CHORUS
Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta

VERSE 3
Kesemay beayinhi tayewe, befikrih tegobeghew
Bebahrih baletṣega, feweskegh bedem waga (2)

CHORUS
Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta

VERSE 4
Qalihn nefse semta tewabetch bellilta
Wede egerih meregecha, mesgede alew bilcha (2)

CHORUS
Misgana be-meqdesih, zimare be-maderyah
Lisewa tewat mata, kibre neh yene geta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'misgana-be-meqdesih', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Misigana Yigebal (misigana-yigebal)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ስብሐት ለአብ ለአኀዜ ኵሉ ዓለም ስብሐት ለወልድ ለገባሬ ኵሉ ዓለም/፪/
ስብሐት ለመንፈስ ቅዱስ ለዘያርሁ ክረምተ በበዓመት/፪/
ምስጋና ይገባል ለአብ ዓለምን ኹሉ ለያዘ
ምስጋና ይገባል ለወልድ ዓለምን ኹሉ ለፈጠረ/፪/

VERSE 1
ምስጋና ይገባል ለመንፈስ ቅዱስ
በየዓመቱ ክረምትን ለሚከፍት/፪/',
      lyrics_transliteration = 'Sibhet leab leaheze kwlu alem sibhet leweld legebare kwlu alem (2)
Sibhet lemenfes Kidus lezeyarhu kiremte bebeamet (2)
Misgana yigebal leab alemn ኹlu leyaze
Misgana yigebal leweld alemn ኹlu lefet’ere (2)

VERSE 1
Misgana yigebal lemenfes Kidus
Beyeametu kiremtn lemikeft (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'misigana-yigebal'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስብሐት ለአብ ለአኀዜ ኵሉ ዓለም ስብሐት ለወልድ ለገባሬ ኵሉ ዓለም/፪/
ስብሐት ለመንፈስ ቅዱስ ለዘያርሁ ክረምተ በበዓመት/፪/
ምስጋና ይገባል ለአብ ዓለምን ኹሉ ለያዘ
ምስጋና ይገባል ለወልድ ዓለምን ኹሉ ለፈጠረ/፪/

VERSE 1
ምስጋና ይገባል ለመንፈስ ቅዱስ
በየዓመቱ ክረምትን ለሚከፍት/፪/

CHORUS
ስብሐት ለአብ ለአኀዜ ኵሉ ዓለም ስብሐት ለወልድ ለገባሬ ኵሉ ዓለም/፪/
ስብሐት ለመንፈስ ቅዱስ ለዘያርሁ ክረምተ በበዓመት/፪/
ምስጋና ይገባል ለአብ ዓለምን ኹሉ ለያዘ
ምስጋና ይገባል ለወልድ ዓለምን ኹሉ ለፈጠረ/፪/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sibhet leab leaheze kwlu alem sibhet leweld legebare kwlu alem (2)
Sibhet lemenfes Kidus lezeyarhu kiremte bebeamet (2)
Misgana yigebal leab alemn ኹlu leyaze
Misgana yigebal leweld alemn ኹlu lefet’ere (2)

VERSE 1
Misgana yigebal lemenfes Kidus
Beyeametu kiremtn lemikeft (2)

CHORUS
Sibhet leab leaheze kwlu alem sibhet leweld legebare kwlu alem (2)
Sibhet lemenfes Kidus lezeyarhu kiremte bebeamet (2)
Misgana yigebal leab alemn ኹlu leyaze
Misgana yigebal leweld alemn ኹlu lefet’ere (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'misigana-yigebal', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Misiganaw Yiketil (misiganaw-yiketil)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው

VERSE 1
የሰማዕይታቱ ደም የፈሰሰው በምድር
አይተናል ሲያስቀጥል የክርስታናን ዘር
እንድናምን ብቻ መች ተጠራን እና

VERSE 2
በእሳቱም መካከል ቅኔ አለን ምስጋና
መች ማጥፋት ይቻላል እሳትን በእሳት
አይቆምም ማሕሌት ቅዳሴ ሰአታት
ከሰማይም በላይ ከሰማይም በታች

VERSE 3
ቤተ ክርስቲያን ዛሬም ነገም አለች
የዓለም ጨው ሆነን በዓለም የበዛነው
እየተደበደብን እየተገፋን ነው
በገደሉን ጊዜ ቁጥራችን ይበዛል

VERSE 4
ከሞትም በኃላ ሕይወት ይቀጥላል
የተስፋይቱን ምድር ተነሱ እንወርሳለን
በመዝሙር በእልልታ ቅጥሩን እያፈረስን
የሰላዮቹን ቃል ሰምታችሑ አትፍሩ

VERSE 5
በሀይማኖት ጽኑ በእምነታሑ ኑሩ',
      lyrics_transliteration = 'Misganaw yit’l zimarew yit’l
Egziabher silale keyaze yemayt’l
Bemnayew neger bemnsemaw were
Endayqom misgana endayqom zimarew

VERSE 1
Yesemaeytatu dem yefesesew bemdr
Aytenal siyasqet’l yekrstanan zer
Endnamn bicha mech tet’eran ena

VERSE 2
Beesatum mekakel qine alen misgana
Mech mat’fat yichalal esatn beesat
Ayqomm mahlet qidase seatat
Kesemaym belay kesemaym betach

VERSE 3
Bete Kristian zarem negem alech
Yealem ch’ew honen bealem yebezanew
Eyetedebedebn eyetegefan new
Begedelun gize qut’rachn yibezal

VERSE 4
Kemotm behala hiywet yiqet’lal
Yetesfaytun midr tenesu enwersalen
Bemezmur beellta qit’run eyaferesn
Yeselayochun qal semtachhu atfru

VERSE 5
Beheymanot ts’nu beemnetahu nuru',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'misiganaw-yiketil'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው

VERSE 1
አዝ
የሰማዕይታቱ ደም የፈሰሰው በምድር
አይተናል ሲያስቀጥል የክርስታናን ዘር
እንድናምን ብቻ መች ተጠራን እና

CHORUS
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው

VERSE 2
በእሳቱም መካከል ቅኔ አለን ምስጋና
መች ማጥፋት ይቻላል እሳትን በእሳት
አይቆምም ማሕሌት ቅዳሴ ሰአታት
ከሰማይም በላይ ከሰማይም በታች

CHORUS
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው

VERSE 3
ቤተ ክርስቲያን ዛሬም ነገም አለች
የዓለም ጨው ሆነን በዓለም የበዛነው
እየተደበደብን እየተገፋን ነው
በገደሉን ጊዜ ቁጥራችን ይበዛል

CHORUS
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው

VERSE 4
ከሞትም በኃላ ሕይወት ይቀጥላል
የተስፋይቱን ምድር ተነሱ እንወርሳለን
በመዝሙር በእልልታ ቅጥሩን እያፈረስን
የሰላዮቹን ቃል ሰምታችሑ አትፍሩ

CHORUS
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው

VERSE 5
በሀይማኖት ጽኑ በእምነታሑ ኑሩ
አዝ

CHORUS
ምስጋናው ይጥል ዝማሬው ይጥል
እግዚአብሔር ስላለ ከያዘ የማይጥል
በምናየው ነገር በምንሰማው ወሬ
እንዳይቆም ምስጋና እንዳይቆም ዝማሬው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Misganaw yit’l zimarew yit’l
Egziabher silale keyaze yemayt’l
Bemnayew neger bemnsemaw were
Endayqom misgana endayqom zimarew

VERSE 1
CHORUS
Yesemaeytatu dem yefesesew bemdr
Aytenal siyasqet’l yekrstanan zer
Endnamn bicha mech tet’eran ena

CHORUS
Misganaw yit’l zimarew yit’l
Egziabher silale keyaze yemayt’l
Bemnayew neger bemnsemaw were
Endayqom misgana endayqom zimarew

VERSE 2
Beesatum mekakel qine alen misgana
Mech mat’fat yichalal esatn beesat
Ayqomm mahlet qidase seatat
Kesemaym belay kesemaym betach

CHORUS
Misganaw yit’l zimarew yit’l
Egziabher silale keyaze yemayt’l
Bemnayew neger bemnsemaw were
Endayqom misgana endayqom zimarew

VERSE 3
Bete Kristian zarem negem alech
Yealem ch’ew honen bealem yebezanew
Eyetedebedebn eyetegefan new
Begedelun gize qut’rachn yibezal

CHORUS
Misganaw yit’l zimarew yit’l
Egziabher silale keyaze yemayt’l
Bemnayew neger bemnsemaw were
Endayqom misgana endayqom zimarew

VERSE 4
Kemotm behala hiywet yiqet’lal
Yetesfaytun midr tenesu enwersalen
Bemezmur beellta qit’run eyaferesn
Yeselayochun qal semtachhu atfru

CHORUS
Misganaw yit’l zimarew yit’l
Egziabher silale keyaze yemayt’l
Bemnayew neger bemnsemaw were
Endayqom misgana endayqom zimarew

VERSE 5
Beheymanot ts’nu beemnetahu nuru
CHORUS

CHORUS
Misganaw yit’l zimarew yit’l
Egziabher silale keyaze yemayt’l
Bemnayew neger bemnsemaw were
Endayqom misgana endayqom zimarew'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'misiganaw-yiketil', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Misiganayen (misiganayen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/

VERSE 1
ዘንባባዬን ይዤ እንደ ሕፃናቱ
ሆሳዕና ልበለው ሰግጄ በፊቱ
ምንም ባዶ ብሆን እውቀት ቢጎድለኝም
ለስሙ ልዘምር ከልካይም የለኝም /2/

VERSE 2
አምላኬ በፊትህ ቃል አለብኝ እኔ
ቋንቋዬ መዝሙር ነው ያንተ እንደመሆኔ
በአሚናዳብ ደጃፍ በቅድመ ታቦቱ
ያ የክብርህ ዑደት ጠራኝ ማኅሌቱ /2/

VERSE 3
የሕይወት ትርጉሜ አንተ ነህ ደስታዬ
ስምህን ማገልገል ክብሬ ነው ሥራዬ
ለታመነው ጌታ ምስክር የሆኑ
ከብረው ተመለሱ ለበረከት ሆኑ /2/

VERSE 4
መነሻዬ አንተ ነህ ጉልበቴና ክብሬ
መድረሻዬም አንተ መደምደሚያ ቅጥሬ
በጽዮን ተራራ ስትገለጥ ያኔ
ነጩን ልብስ አልብሰህ አስነሳኝ ለቅኔ /2/',
      lyrics_transliteration = 'misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/

VERSE 1
zenibabayēni yizhē inide ḥit͟s’anatu
hosana libelew segijē befītu
minim bado bihon ewiket bīgodilenyim
lesimu lizemir kelikayim yelenyim /2/

VERSE 2
āmilake befītihi kal ālebinyi ene
kwanikwayē mezmur new yanite endemehonē
beāmīnadabi dejaf bekidime tabotu
ya yekibirihi udeti teranyi maḫilētu /2/

VERSE 3
yeḥiyiwet tirigumē ānte nehi desitayē
simihin mageligel kibirē new siraye
letamenew gēta misikir yehonu
kebirewi temelesu lebereket honu /2/

VERSE 4
meneshayē ānte nehi gulibetēna kibirē
medireshayēm ānte medemidemīya kitirē
betsiyon terara sitigelet yanē
nechun libis ālibisehi āsinesanyi lekinē /2/',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'misiganayen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/

VERSE 1
ዘንባባዬን ይዤ እንደ ሕፃናቱ
ሆሳዕና ልበለው ሰግጄ በፊቱ
ምንም ባዶ ብሆን እውቀት ቢጎድለኝም
ለስሙ ልዘምር ከልካይም የለኝም /2/

CHORUS
ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/

VERSE 2
አምላኬ በፊትህ ቃል አለብኝ እኔ
ቋንቋዬ መዝሙር ነው ያንተ እንደመሆኔ
በአሚናዳብ ደጃፍ በቅድመ ታቦቱ
ያ የክብርህ ዑደት ጠራኝ ማኅሌቱ /2/

CHORUS
ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/

VERSE 3
የሕይወት ትርጉሜ አንተ ነህ ደስታዬ
ስምህን ማገልገል ክብሬ ነው ሥራዬ
ለታመነው ጌታ ምስክር የሆኑ
ከብረው ተመለሱ ለበረከት ሆኑ /2/

CHORUS
ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/

VERSE 4
መነሻዬ አንተ ነህ ጉልበቴና ክብሬ
መድረሻዬም አንተ መደምደሚያ ቅጥሬ
በጽዮን ተራራ ስትገለጥ ያኔ
ነጩን ልብስ አልብሰህ አስነሳኝ ለቅኔ /2/

CHORUS
ምስጋናዬን ለአምላኬ አቀርባሁ
በማደሪያው ገብቼ እሰግድለታለሁ
ኤልሻዳይ ነው ጌታ ሁሉን ቻይ
ይፈጸማል አምናለሁ የልቤ ጉዳይ /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/

VERSE 1
zenibabayēni yizhē inide ḥit͟s’anatu
hosana libelew segijē befītu
minim bado bihon ewiket bīgodilenyim
lesimu lizemir kelikayim yelenyim /2/

CHORUS
misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/

VERSE 2
āmilake befītihi kal ālebinyi ene
kwanikwayē mezmur new yanite endemehonē
beāmīnadabi dejaf bekidime tabotu
ya yekibirihi udeti teranyi maḫilētu /2/

CHORUS
misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/

VERSE 3
yeḥiyiwet tirigumē ānte nehi desitayē
simihin mageligel kibirē new siraye
letamenew gēta misikir yehonu
kebirewi temelesu lebereket honu /2/

CHORUS
misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/

VERSE 4
meneshayē ānte nehi gulibetēna kibirē
medireshayēm ānte medemidemīya kitirē
betsiyon terara sitigelet yanē
nechun libis ālibisehi āsinesanyi lekinē /2/

CHORUS
misiganayēni leāmilakē ākeribahu
bemaderīyawi gebichē esegidiletalehu
ēlishadayi new gēta hulun chayi
yifetsemal āminalehu yelibe gudayi /2/'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'misiganayen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Misirak Yetsehay Mewicha (misirak-yetsehay-mewicha)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 1
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 2
አባቶቻችን ያስተማሩን የበዛላቸው ፀጋ
አንቺን ስላሉ አትርፈዋል በረከት ልዩ ዋጋ
ከቀዳሞት አበው የወረስነው አለን ያንቺ ምስጋና
እንጠራሻለን በውዳሴ አብዝተን እንደገና

VERSE 3
ቅዱስ አፍሬም ብሏል እንወድሻለን
እኛም ልጆቹ ነን እንወድሻለን እናከብርሻለን
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ

VERSE 4
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል
በምስራቅ በኩል ለወጣልን የፀሃይ የወልድ እናት
በፅልመት ዘመን ፋኖስ ብርሃን የማጠፊ ነሽ መብራት

VERSE 5
የዕርቅ ሰነድ የሰማዩ የኖህ ቀስተ ደመና
አምላክ ፊት ለኛ የሞትቆሚ ለምህረት ለልመና
አዛኝቷ እናት አስታራቂያችን ሆይ
ለነፍስ አምላጅ ነሽ ለስጋችን ሲሳይ ለስጋችን ሲሳይ

VERSE 6
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 7
የአዳም ዘር ሀጢያት የሌለብሽ ጉድፍ ያልተገኘብሽ
ባለፈው አለም በዚያ ዘመን ከሁሉም ንፅህይት ነሽ
በዚህም ዘመን በወዲያኛው አንዳንቺ ቅድስት የለም
መና ስንቅነሽ ለሚወድሽ አማላጅ ለአለም ጣዕም

VERSE 8
እንዳአባቶቻችን ፍቅርሽ ለኛም ይብዛ
ስምሽ ሞገስ አለው ልብን የሚገዛ ልብን የሚገዛ
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ

VERSE 9
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ

VERSE 10
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል',
      lyrics_transliteration = 'Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 1
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 2
Abatochachn yastemarun yebezalachew ts’ega
Anchin silalu atrfewal bereket liyu waga
Keqedamot abew yeweresnew alen yanchi misgana
Ent’erashalen bewdase abzten endegena

VERSE 3
Kidus afrem bilwal enwedshalen
Egnam lijochu nen enwedshalen enakebrshalen
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush

VERSE 4
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal
Bemsraq bekul lewet’aln yets’ehay yeweld enat
Bets’lmet zemen fanos birhan yemat’efi nesh mebrat

VERSE 5
Yeerq sened yesemayu yenoh qeste demena
Amlak fit legna yemotqomi lemhret lelmena
Azagntwa enat astaraqiyachn hoy
Lenefs amlaj nesh lesgachn sisay lesgachn sisay

VERSE 6
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 7
Yeadam zer het’iyat yelelebsh gudf yaltegegnebsh
Balefew alem beziya zemen kehulum nits’hyt nesh
Bezihm zemen bewediyagnaw andanchi Kidist yelem
Mena sinqnesh lemiwedsh amalaj lealem t’aem

VERSE 8
Endaabatochachn fiqrsh legnam yibza
Simsh moges alew libn yemigeza libn yemigeza
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush

VERSE 9
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush

VERSE 10
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'misirak-yetsehay-mewicha'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 1
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 2
አባቶቻችን ያስተማሩን የበዛላቸው ፀጋ
አንቺን ስላሉ አትርፈዋል በረከት ልዩ ዋጋ
ከቀዳሞት አበው የወረስነው አለን ያንቺ ምስጋና
እንጠራሻለን በውዳሴ አብዝተን እንደገና

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 3
ቅዱስ አፍሬም ብሏል እንወድሻለን
እኛም ልጆቹ ነን እንወድሻለን እናከብርሻለን
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 4
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል
በምስራቅ በኩል ለወጣልን የፀሃይ የወልድ እናት
በፅልመት ዘመን ፋኖስ ብርሃን የማጠፊ ነሽ መብራት

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 5
የዕርቅ ሰነድ የሰማዩ የኖህ ቀስተ ደመና
አምላክ ፊት ለኛ የሞትቆሚ ለምህረት ለልመና
አዛኝቷ እናት አስታራቂያችን ሆይ
ለነፍስ አምላጅ ነሽ ለስጋችን ሲሳይ ለስጋችን ሲሳይ

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 6
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 7
የአዳም ዘር ሀጢያት የሌለብሽ ጉድፍ ያልተገኘብሽ
ባለፈው አለም በዚያ ዘመን ከሁሉም ንፅህይት ነሽ
በዚህም ዘመን በወዲያኛው አንዳንቺ ቅድስት የለም
መና ስንቅነሽ ለሚወድሽ አማላጅ ለአለም ጣዕም

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 8
እንዳአባቶቻችን ፍቅርሽ ለኛም ይብዛ
ስምሽ ሞገስ አለው ልብን የሚገዛ ልብን የሚገዛ
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 9
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

VERSE 10
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል

CHORUS
ምስራቅ የፀሐይ መውጫ ነሽ
አዛኝ የዋህት ዘውትር ለሚጠሩሽ
ድንግል ስምሽ ይጣፍጣል
አንቺን ያመነ ከክህደት ጦር ይከለላል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 1
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 2
Abatochachn yastemarun yebezalachew ts’ega
Anchin silalu atrfewal bereket liyu waga
Keqedamot abew yeweresnew alen yanchi misgana
Ent’erashalen bewdase abzten endegena

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 3
Kidus afrem bilwal enwedshalen
Egnam lijochu nen enwedshalen enakebrshalen
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 4
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal
Bemsraq bekul lewet’aln yets’ehay yeweld enat
Bets’lmet zemen fanos birhan yemat’efi nesh mebrat

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 5
Yeerq sened yesemayu yenoh qeste demena
Amlak fit legna yemotqomi lemhret lelmena
Azagntwa enat astaraqiyachn hoy
Lenefs amlaj nesh lesgachn sisay lesgachn sisay

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 6
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 7
Yeadam zer het’iyat yelelebsh gudf yaltegegnebsh
Balefew alem beziya zemen kehulum nits’hyt nesh
Bezihm zemen bewediyagnaw andanchi Kidist yelem
Mena sinqnesh lemiwedsh amalaj lealem t’aem

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 8
Endaabatochachn fiqrsh legnam yibza
Simsh moges alew libn yemigeza libn yemigeza
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 9
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

VERSE 10
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal

CHORUS
Misraq yets’ehey mewch’a nesh
Azagn yewaht zewtr lemit’erush
Dingil simsh yit’aft’al
Anchin yamene kekhdet t’or yikelelal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'misirak-yetsehay-mewicha', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Misle Mikael We Gebriel (misle-mikael-we-gebriel)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ምስለ ሚካኤል ወገብርኤል
ንዒ ሰናይትዬ ማርያም (፪)

VERSE 1
ንዒ ••ንዒ•• ንዒ •• ንዒ /፬/

VERSE 2
እም አምላክ ንዒ ማርያም (፪)',
      lyrics_transliteration = 'Misle Mikael we Gebriel
Ni senaytye Maryam (×2)

VERSE 1
Ni •• ni •• ni •• ni (×4)

VERSE 2
Em Amlak ni Maryam (×2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'misle-mikael-we-gebriel'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስለ ሚካኤል ወገብርኤል
ንዒ ሰናይትዬ ማርያም (፪)

VERSE 1
ንዒ ••ንዒ•• ንዒ •• ንዒ /፬/

CHORUS
ምስለ ሚካኤል ወገብርኤል
ንዒ ሰናይትዬ ማርያም (፪)

VERSE 2
እም አምላክ ንዒ ማርያም (፪)

CHORUS
ምስለ ሚካኤል ወገብርኤል
ንዒ ሰናይትዬ ማርያም (፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Misle Mikael we Gebriel
Ni senaytye Maryam (×2)

VERSE 1
Ni •• ni •• ni •• ni (×4)

CHORUS
Misle Mikael we Gebriel
Ni senaytye Maryam (×2)

VERSE 2
Em Amlak ni Maryam (×2)

CHORUS
Misle Mikael we Gebriel
Ni senaytye Maryam (×2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'misle-mikael-we-gebriel', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Awqewalehu Dejishin (mistiregnaye-nesh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 1
ከአጸደ መቅደስሽ ከስዕልሽ ስር
እረፍቴ በዚያ ነው በቅዱሱ ደብር
ከተራራው አናት ከደጅሽ መጥቼ
ሰምሮልኛል ስምሽን ጠርቼ

VERSE 2
ሚስጥረኛዬ ነሽ ሚስጥረኛዬ ነሽ
ኪዳነ ምህረት መፅናኛዬ (2)

VERSE 3
የሮማን አበባ መዓዛሽ ተወዳጅ
በረከትን ልቅሰም ሳልለይ ካንቺ ደጅ
አስራትሽ አድርጊኝ ጠቅልይኝ እናቴ
ታብብልኝ ትፍካልኝ ሕይወቴ

VERSE 4
ሚስጥረኛዬ ነሽ ሚስጥረኛዬ ነሽ
ኪዳነ ምህረት መፅናኛዬ (2)

VERSE 5
አጠገቤ ጎኔ በዙሪያዬ እንዳለሽ
እንደርሱ ነው ልቤ እማ የሚያወራሽ
አልቅሼ ሲቀለኝ ነግሬሽ የውስጤን
አትዘገይም ስትሠሪልኝ ቤቴን

VERSE 6
ሚስጥረኛዬ ነሽ ሚስጥረኛዬ ነሽ
ኪዳነ ምህረት መፅናኛዬ (2)

VERSE 7
የእንጦጦዋ እናቴ እምዬ የምልሽ
ኪዳንኪ ደጓ የልብን ሰሚ ነሽ
በሄድኩበት አለሽ ተከትለሽኛል
ስላለሽኝ ሰላም ይሰማኛል

VERSE 8
ሚስጥረኛዬ ነሽ ሚስጥረኛዬ ነሽ
ኪዳነ ምህረት መፅናኛዬ (2)',
      lyrics_transliteration = 'Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 1
Ke-atsede meqdesish ke-si''ilish sir
Irefte beziya new be-qidusu debir
Keteraraw anat kedejish metiche
Semrolignal simishin teteriche

VERSE 2
Mistregnayayen nesh mistregnayayen nesh
Kidane Mihret metsnagnayayen (2)

VERSE 3
Ye-roman abeba me’azash tewodaj
Bereketin liqsem saliley kanchi dej
Asratish adrigign teqligign innate
Tabiblign tifikalign hiywote

VERSE 4
Mistregnayayen nesh mistregnayayen nesh
Kidane Mihret metsnagnayayen (2)

VERSE 5
Atigebe gone be-zuriyaye indallesh
Indersu new libbe imma yemiyaworash
Alqishe siqelign negresh yewostien
Atzegeyim sitserilign betien

VERSE 6
Mistregnayayen nesh mistregnayayen nesh
Kidane Mihret metsnagnayayen (2)

VERSE 7
Ye-Entotowa innate immiye yemilish
Kidanki degua yelibin semi nesh
Be-hedkubet allesh tekittileshingal
Silalleshign selam yisimagnal

VERSE 8
Mistregnayayen nesh mistregnayayen nesh
Kidane Mihret metsnagnayayen (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mistiregnaye-nesh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 1
ከአጸደ መቅደስሽ ከስዕልሽ ስር
እረፍቴ በዚያ ነው በቅዱሱ ደብር
ከተራራው አናት ከደጅሽ መጥቼ
ሰምሮልኛል ስምሽን ጠርቼ

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 2
ሚስጥረኛዬ ነሽ ሚስጥረኛዬ ነሽ
ኪዳነ ምህረት መፅናኛዬ (2)

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 3
የሮማን አበባ መዓዛሽ ተወዳጅ
በረከትን ልቅሰም ሳልለይ ካንቺ ደጅ
አስራትሽ አድርጊኝ ጠቅልይኝ እናቴ
ታብብልኝ ትፍካልኝ ሕይወቴ

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 4
ሚስጥረኛዬ ነሽ ሚስጥረኛዬ ነሽ
ኪዳነ ምህረት መፅናኛዬ (2)

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 5
አጠገቤ ጎኔ በዙሪያዬ እንዳለሽ
እንደርሱ ነው ልቤ እማ የሚያወራሽ
አልቅሼ ሲቀለኝ ነግሬሽ የውስጤን
አትዘገይም ስትሠሪልኝ ቤቴን

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 6
ሚስጥረኛዬ ነሽ ሚስጥረኛዬ ነሽ
ኪዳነ ምህረት መፅናኛዬ (2)

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 7
የእንጦጦዋ እናቴ እምዬ የምልሽ
ኪዳንኪ ደጓ የልብን ሰሚ ነሽ
በሄድኩበት አለሽ ተከትለሽኛል
ስላለሽኝ ሰላም ይሰማኛል

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)

VERSE 8
ሚስጥረኛዬ ነሽ ሚስጥረኛዬ ነሽ
ኪዳነ ምህረት መፅናኛዬ (2)

CHORUS
አውቀዋለሁ ደጅሽን የእረፍት ቦታዬን
ጽኑ ሰላም ጸጥታ ማግኛዬን
የት እሄዳለው አልልም ሲከፋኝ
ኪዳነ ምህረት አንቺ እያለሽልኝ (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 1
Ke-atsede meqdesish ke-si''ilish sir
Irefte beziya new be-qidusu debir
Keteraraw anat kedejish metiche
Semrolignal simishin teteriche

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 2
Mistregnayayen nesh mistregnayayen nesh
Kidane Mihret metsnagnayayen (2)

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 3
Ye-roman abeba me’azash tewodaj
Bereketin liqsem saliley kanchi dej
Asratish adrigign teqligign innate
Tabiblign tifikalign hiywote

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 4
Mistregnayayen nesh mistregnayayen nesh
Kidane Mihret metsnagnayayen (2)

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 5
Atigebe gone be-zuriyaye indallesh
Indersu new libbe imma yemiyaworash
Alqishe siqelign negresh yewostien
Atzegeyim sitserilign betien

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 6
Mistregnayayen nesh mistregnayayen nesh
Kidane Mihret metsnagnayayen (2)

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 7
Ye-Entotowa innate immiye yemilish
Kidanki degua yelibin semi nesh
Be-hedkubet allesh tekittileshingal
Silalleshign selam yisimagnal

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)

VERSE 8
Mistregnayayen nesh mistregnayayen nesh
Kidane Mihret metsnagnayayen (2)

CHORUS
Awqewalehu dejishin yereft botayen
Tsnu selam tsetita magnyayen
Yet ihedalehu alilm sikifagn
Kidane Mihret anchi iyalleshilign (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mistiregnaye-nesh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: mn setuh yehuda winta atsbha (mn-setuh-yehuda-winta-atsbha)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ምን ሰጡህ ይሁዳ? ሙትን ልታስነሳ ድውይን ልትፈውስ
ሥልጣን ሰጥቶህ ነበር ኢየሱስ ክርስቶስ
ልታስር ልትፈታ በነፍስም በሥጋ (2x)
ሥልጣን ሰጥቶህ ነበር አልፋና ኦሜጋ (2x)

VERSE 1
ምን ሰጡህ ይሁዳ አይሁድ ዘመዶችህ
ለነርሱ አሳልፈህ ጌታህን የሰጠህ
ከሁሉም የሚበልጥ ሥልጣን ሰጥቶህ ሳለ(2x)
ብርን ለመቀበል ልብህ ተታለለ (2x)

VERSE 2
ሰማይና ምድርን በቃሉ የፈጠረ
እንዴት በመቃብር ሶስት ቀን አደረ
አንተ የሰጠኸው አሳልፈህ ለሞት (2x)
ሞትን ድል አድርጎ ተነሳ በሰንበት (2x)',
      lyrics_transliteration = 'Min set’uh yihuda? mutn litasnesa diwyn litfews
Silt’an set’toh neber Iyesus Kristos
Litasr litfeta benefsm besga (2x)
Silt’an set’toh neber alfana omega (2x)

VERSE 1
Min set’uh yihuda ayhud zemedochh
Lenersu asalfeh getahn yeset’eh
Kehulum yemibelt’ silt’an set’toh sale(2x)
Birn lemeqebel libh tetalele (2x)

VERSE 2
Semayna midrn beqalu yefet’ere
Endet bemeqabr sost qen adere
Ante yeset’eኸw asalfeh lemot (2x)
Motn dil adrgo tenesa besenbet (2x)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mn-setuh-yehuda-winta-atsbha'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምን ሰጡህ ይሁዳ? ሙትን ልታስነሳ ድውይን ልትፈውስ
ሥልጣን ሰጥቶህ ነበር ኢየሱስ ክርስቶስ
ልታስር ልትፈታ በነፍስም በሥጋ (2x)
ሥልጣን ሰጥቶህ ነበር አልፋና ኦሜጋ (2x)

VERSE 1
ምን ሰጡህ ይሁዳ አይሁድ ዘመዶችህ
ለነርሱ አሳልፈህ ጌታህን የሰጠህ
ከሁሉም የሚበልጥ ሥልጣን ሰጥቶህ ሳለ(2x)
ብርን ለመቀበል ልብህ ተታለለ (2x)

CHORUS
ምን ሰጡህ ይሁዳ? ሙትን ልታስነሳ ድውይን ልትፈውስ
ሥልጣን ሰጥቶህ ነበር ኢየሱስ ክርስቶስ
ልታስር ልትፈታ በነፍስም በሥጋ (2x)
ሥልጣን ሰጥቶህ ነበር አልፋና ኦሜጋ (2x)

VERSE 2
ሰማይና ምድርን በቃሉ የፈጠረ
እንዴት በመቃብር ሶስት ቀን አደረ
አንተ የሰጠኸው አሳልፈህ ለሞት (2x)
ሞትን ድል አድርጎ ተነሳ በሰንበት (2x)

CHORUS
ምን ሰጡህ ይሁዳ? ሙትን ልታስነሳ ድውይን ልትፈውስ
ሥልጣን ሰጥቶህ ነበር ኢየሱስ ክርስቶስ
ልታስር ልትፈታ በነፍስም በሥጋ (2x)
ሥልጣን ሰጥቶህ ነበር አልፋና ኦሜጋ (2x)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Min set’uh yihuda? mutn litasnesa diwyn litfews
Silt’an set’toh neber Iyesus Kristos
Litasr litfeta benefsm besga (2x)
Silt’an set’toh neber alfana omega (2x)

VERSE 1
Min set’uh yihuda ayhud zemedochh
Lenersu asalfeh getahn yeset’eh
Kehulum yemibelt’ silt’an set’toh sale(2x)
Birn lemeqebel libh tetalele (2x)

CHORUS
Min set’uh yihuda? mutn litasnesa diwyn litfews
Silt’an set’toh neber Iyesus Kristos
Litasr litfeta benefsm besga (2x)
Silt’an set’toh neber alfana omega (2x)

VERSE 2
Semayna midrn beqalu yefet’ere
Endet bemeqabr sost qen adere
Ante yeset’eኸw asalfeh lemot (2x)
Motn dil adrgo tenesa besenbet (2x)

CHORUS
Min set’uh yihuda? mutn litasnesa diwyn litfews
Silt’an set’toh neber Iyesus Kristos
Litasr litfeta benefsm besga (2x)
Silt’an set’toh neber alfana omega (2x)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mn-setuh-yehuda-winta-atsbha', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Moges Honehegnal (moges-honehegnal)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ

VERSE 1
ከእናቴ ማህፀን ከሕፃንነቴ
የጠበከኝ አንተ የሆንከኝ አባቴ
ስበድል ሳጠፋ በፍቅር እያለፍከኝ
ተሸክመኸኛል እግዚአብሔር ተመስገን

VERSE 2
ከአንተ ከመልካሙ ወዴት እሄዳለሁ
ከህይወት ውሃዬ እንዴት እሸሻለሁ
የነፍሴ የስጋ ቸሩ ፈጣሪዬ
አመስግኜው ልኑር እግዚአብሔር አምላኬ

VERSE 3
ቸርነትህ ብዙ ምህረት የሰጠኸኝ
ድብቁን ሃጢአቴን እየሸፈንክልኝ
አቆምከኝ ለቅኔ ለታላቅ ምስጋና
የፍቅር አምላክ ነህ ክብርህም ገናና

VERSE 4
ከእናቴ ማህፀን ከሕፃንነቴ
የጠበከኝ አንተ የሆንከኝ አባቴ
ስበድል ሳጠፋ በፍቅር እያለፍከኝ
ተሸክመኸኛል እግዚአብሔር ተመስገን',
      lyrics_transliteration = 'Moges honeኸgnal hiywetena kibre
Mamlech’a alete yehywet aklile
Feqdeh yewededkegn yenebse alegnta
Misgana aqerbalehu leserawit Geta

VERSE 1
Keenate mahts’en kehts’annete
Yet’ebekegn ante yehonkegn abate
Sibedl sat’efa befqr eyalefkegn
Teshekmeኸgnal Egziabher temesgen

VERSE 2
Keante kemelkamu wedet ehedalehu
Kehywet wihaye endet esheshalehu
Yenefse yesga cheru fet’ariye
Amesggnew linur Egziabher amlake

VERSE 3
Cherneth bizu mihret yeset’eኸgn
Dibqun hat’iaten eyeshefenklgn
Aqomkegn leqne letalaq misgana
Yefqr amlak neh kibrhm genana

VERSE 4
Keenate mahts’en kehts’annete
Yet’ebekegn ante yehonkegn abate
Sibedl sat’efa befqr eyalefkegn
Teshekmeኸgnal Egziabher temesgen',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'moges-honehegnal'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ

VERSE 1
ከእናቴ ማህፀን ከሕፃንነቴ
የጠበከኝ አንተ የሆንከኝ አባቴ
ስበድል ሳጠፋ በፍቅር እያለፍከኝ
ተሸክመኸኛል እግዚአብሔር ተመስገን

CHORUS
ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ

VERSE 2
ከአንተ ከመልካሙ ወዴት እሄዳለሁ
ከህይወት ውሃዬ እንዴት እሸሻለሁ
የነፍሴ የስጋ ቸሩ ፈጣሪዬ
አመስግኜው ልኑር እግዚአብሔር አምላኬ

CHORUS
ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ

VERSE 3
ቸርነትህ ብዙ ምህረት የሰጠኸኝ
ድብቁን ሃጢአቴን እየሸፈንክልኝ
አቆምከኝ ለቅኔ ለታላቅ ምስጋና
የፍቅር አምላክ ነህ ክብርህም ገናና

CHORUS
ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ

VERSE 4
ከእናቴ ማህፀን ከሕፃንነቴ
የጠበከኝ አንተ የሆንከኝ አባቴ
ስበድል ሳጠፋ በፍቅር እያለፍከኝ
ተሸክመኸኛል እግዚአብሔር ተመስገን

CHORUS
ሞገስ ሆነኸኛል ህይወቴና ክብሬ
ማምለጫ አለቴ የህይወት አክሊሌ
ፈቅደህ የወደድከኝ የነብሴ አለኝታ
ምስጋና አቀርባለሁ ለሠራዊት ጌታ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Moges honeኸgnal hiywetena kibre
Mamlech’a alete yehywet aklile
Feqdeh yewededkegn yenebse alegnta
Misgana aqerbalehu leserawit Geta

VERSE 1
Keenate mahts’en kehts’annete
Yet’ebekegn ante yehonkegn abate
Sibedl sat’efa befqr eyalefkegn
Teshekmeኸgnal Egziabher temesgen

CHORUS
Moges honeኸgnal hiywetena kibre
Mamlech’a alete yehywet aklile
Feqdeh yewededkegn yenebse alegnta
Misgana aqerbalehu leserawit Geta

VERSE 2
Keante kemelkamu wedet ehedalehu
Kehywet wihaye endet esheshalehu
Yenefse yesga cheru fet’ariye
Amesggnew linur Egziabher amlake

CHORUS
Moges honeኸgnal hiywetena kibre
Mamlech’a alete yehywet aklile
Feqdeh yewededkegn yenebse alegnta
Misgana aqerbalehu leserawit Geta

VERSE 3
Cherneth bizu mihret yeset’eኸgn
Dibqun hat’iaten eyeshefenklgn
Aqomkegn leqne letalaq misgana
Yefqr amlak neh kibrhm genana

CHORUS
Moges honeኸgnal hiywetena kibre
Mamlech’a alete yehywet aklile
Feqdeh yewededkegn yenebse alegnta
Misgana aqerbalehu leserawit Geta

VERSE 4
Keenate mahts’en kehts’annete
Yet’ebekegn ante yehonkegn abate
Sibedl sat’efa befqr eyalefkegn
Teshekmeኸgnal Egziabher temesgen

CHORUS
Moges honeኸgnal hiywetena kibre
Mamlech’a alete yehywet aklile
Feqdeh yewededkegn yenebse alegnta
Misgana aqerbalehu leserawit Geta'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'moges-honehegnal', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mot New Rehab (mot-new-rehab)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሞት ነው ረሃብ ከክርስቶስ ፍቅር የሚለየን /2/
ኃይሉ በእኛ ላይ አድሮ እንበረታለን
ጸጋው በእኛ ላይ አድሮ እንበረታለን
ሐዋርያት ጸጋህ በዝቶላቸው

VERSE 1
ስለ ፍቅርህ ፈሰሰ ደማቸው
ዛሬም ለእኛ ጸጋህን አብዛልን
እንዳንደክም ፈተና ሲገጥመን
የዓለም ሰይፍ በእኛ ላይ ተስሏል

VERSE 2
ሥጋችንን ሊቆርጠው አድብቷል
ኃይልን ሥጠን እንድናሸንፈው
ጸጋህ ለእኛ የእምነት ጋሻችን ነው
በተዋሕዶ የከበርኸው ጌታ

VERSE 3
መድኃኔዓለም ሁንልን መከታ
ስንደክም ምኞት ሲፈትነን
ኃይልን ሰጥተህ በእጆችህ ደግፈን
ጋሻ ሆነህ እንድትመክትልን

VERSE 4
ቸር አምላክ ሆይ ወደ አንተ እንጮኻለን
ቢገጥመንም ችግር ወይ መከራ
አትለየን ጌታ ከኛ ጋራ
ከአንተ ርቀው ሸሽተውህ የሔዱ

VERSE 5
ጠፋባቸው የጽድቅ መንገዱ
በሥጋዊ ጥበብ ሲፈልጉህ
በመታለል ስንቶች አንተን አጡህ',
      lyrics_transliteration = 'Mot new rehab kekrstos fiqr yemileyen (2)
Haylu beegna lay adro enberetalen
Ts’egaw beegna lay adro enberetalen
Hewaryat ts’egah beztolachew

VERSE 1
Sile fiqrh fesese demachew
Zarem leegna ts’egahn abzaln
Endandekm fetena siget’men
Yealem seyf beegna lay teslwal

VERSE 2
Sigachnn liqort’ew adbtwal
Hayln sit’en endnashenfew
Ts’egah leegna yeemnet gashachn new
Betewahdo yekeberኸw Geta

VERSE 3
Medhanealem hunln meketa
Sindekm mignot sifetnen
Hayln set’teh beejochh degfen
Gasha honeh endtmektln

VERSE 4
Cher amlak hoy wede ante ench’oኻlen
Biget’menm chgr wey mekera
Atleyen Geta kegna gara
Keante riqew sheshtewh yehedu

VERSE 5
T’efabachew yets’dq mengedu
Besgawi t’beb sifelguh
Bemetalel sintoch anten at’uh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mot-new-rehab'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሞት ነው ረሃብ ከክርስቶስ ፍቅር የሚለየን /2/
ኃይሉ በእኛ ላይ አድሮ እንበረታለን
ጸጋው በእኛ ላይ አድሮ እንበረታለን
ሐዋርያት ጸጋህ በዝቶላቸው

VERSE 1
ስለ ፍቅርህ ፈሰሰ ደማቸው
ዛሬም ለእኛ ጸጋህን አብዛልን
እንዳንደክም ፈተና ሲገጥመን
የዓለም ሰይፍ በእኛ ላይ ተስሏል

CHORUS
ሞት ነው ረሃብ ከክርስቶስ ፍቅር የሚለየን /2/
ኃይሉ በእኛ ላይ አድሮ እንበረታለን
ጸጋው በእኛ ላይ አድሮ እንበረታለን
ሐዋርያት ጸጋህ በዝቶላቸው

VERSE 2
ሥጋችንን ሊቆርጠው አድብቷል
ኃይልን ሥጠን እንድናሸንፈው
ጸጋህ ለእኛ የእምነት ጋሻችን ነው
በተዋሕዶ የከበርኸው ጌታ

CHORUS
ሞት ነው ረሃብ ከክርስቶስ ፍቅር የሚለየን /2/
ኃይሉ በእኛ ላይ አድሮ እንበረታለን
ጸጋው በእኛ ላይ አድሮ እንበረታለን
ሐዋርያት ጸጋህ በዝቶላቸው

VERSE 3
መድኃኔዓለም ሁንልን መከታ
ስንደክም ምኞት ሲፈትነን
ኃይልን ሰጥተህ በእጆችህ ደግፈን
ጋሻ ሆነህ እንድትመክትልን

CHORUS
ሞት ነው ረሃብ ከክርስቶስ ፍቅር የሚለየን /2/
ኃይሉ በእኛ ላይ አድሮ እንበረታለን
ጸጋው በእኛ ላይ አድሮ እንበረታለን
ሐዋርያት ጸጋህ በዝቶላቸው

VERSE 4
ቸር አምላክ ሆይ ወደ አንተ እንጮኻለን
ቢገጥመንም ችግር ወይ መከራ
አትለየን ጌታ ከኛ ጋራ
ከአንተ ርቀው ሸሽተውህ የሔዱ

CHORUS
ሞት ነው ረሃብ ከክርስቶስ ፍቅር የሚለየን /2/
ኃይሉ በእኛ ላይ አድሮ እንበረታለን
ጸጋው በእኛ ላይ አድሮ እንበረታለን
ሐዋርያት ጸጋህ በዝቶላቸው

VERSE 5
ጠፋባቸው የጽድቅ መንገዱ
በሥጋዊ ጥበብ ሲፈልጉህ
በመታለል ስንቶች አንተን አጡህ

CHORUS
ሞት ነው ረሃብ ከክርስቶስ ፍቅር የሚለየን /2/
ኃይሉ በእኛ ላይ አድሮ እንበረታለን
ጸጋው በእኛ ላይ አድሮ እንበረታለን
ሐዋርያት ጸጋህ በዝቶላቸው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mot new rehab kekrstos fiqr yemileyen (2)
Haylu beegna lay adro enberetalen
Ts’egaw beegna lay adro enberetalen
Hewaryat ts’egah beztolachew

VERSE 1
Sile fiqrh fesese demachew
Zarem leegna ts’egahn abzaln
Endandekm fetena siget’men
Yealem seyf beegna lay teslwal

CHORUS
Mot new rehab kekrstos fiqr yemileyen (2)
Haylu beegna lay adro enberetalen
Ts’egaw beegna lay adro enberetalen
Hewaryat ts’egah beztolachew

VERSE 2
Sigachnn liqort’ew adbtwal
Hayln sit’en endnashenfew
Ts’egah leegna yeemnet gashachn new
Betewahdo yekeberኸw Geta

CHORUS
Mot new rehab kekrstos fiqr yemileyen (2)
Haylu beegna lay adro enberetalen
Ts’egaw beegna lay adro enberetalen
Hewaryat ts’egah beztolachew

VERSE 3
Medhanealem hunln meketa
Sindekm mignot sifetnen
Hayln set’teh beejochh degfen
Gasha honeh endtmektln

CHORUS
Mot new rehab kekrstos fiqr yemileyen (2)
Haylu beegna lay adro enberetalen
Ts’egaw beegna lay adro enberetalen
Hewaryat ts’egah beztolachew

VERSE 4
Cher amlak hoy wede ante ench’oኻlen
Biget’menm chgr wey mekera
Atleyen Geta kegna gara
Keante riqew sheshtewh yehedu

CHORUS
Mot new rehab kekrstos fiqr yemileyen (2)
Haylu beegna lay adro enberetalen
Ts’egaw beegna lay adro enberetalen
Hewaryat ts’egah beztolachew

VERSE 5
T’efabachew yets’dq mengedu
Besgawi t’beb sifelguh
Bemetalel sintoch anten at’uh

CHORUS
Mot new rehab kekrstos fiqr yemileyen (2)
Haylu beegna lay adro enberetalen
Ts’egaw beegna lay adro enberetalen
Hewaryat ts’egah beztolachew'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mot-new-rehab', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Mother of God (mother-of-god)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Emebete Ye-Amlak enat
Lamesginish qen ke lelit
Lelijishim kibir wedase
Taqerbalech zewtir nefse',
      lyrics_english = 'Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 1
My heart it will arise tuned for praise I will sing
Through my humility I give my offering
Zion you are near me Abraham''s holy tent
Mother of shining light it’s you I lean against

VERSE 2
O Green Meadow of Peace the one He had chosen
Ark of the covenant you''re Isaiah''s virgin
Queen of heaven and Earth standing on the Lord''s right
Honor is due to her we will sing day and night

VERSE 3
Dearest Virgin Mary the mother of us all
With your intercession save me so I don''t fall
Help me cross through the flames keep me on the right path
Death and defeat will cease since I have you at last

VERSE 4
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 5
Emebete Ye-Amlak enat
Lamesginish qen ke lelit
Lelijishim kibir wedase
Taqerbalech zewtir nefse',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'mother-of-god'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Emebete Ye-Amlak enat
Lamesginish qen ke lelit
Lelijishim kibir wedase
Taqerbalech zewtir nefse'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 1
My heart it will arise tuned for praise I will sing
Through my humility I give my offering
Zion you are near me Abraham''s holy tent
Mother of shining light it’s you I lean against

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 2
O Green Meadow of Peace the one He had chosen
Ark of the covenant you''re Isaiah''s virgin
Queen of heaven and Earth standing on the Lord''s right
Honor is due to her we will sing day and night

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 3
Dearest Virgin Mary the mother of us all
With your intercession save me so I don''t fall
Help me cross through the flames keep me on the right path
Death and defeat will cease since I have you at last

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 4
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High

VERSE 5
Emebete Ye-Amlak enat
Lamesginish qen ke lelit
Lelijishim kibir wedase
Taqerbalech zewtir nefse

CHORUS
Mother of God Virgin Mary
Day and night I will sing to thee
Your blessed son I''ll glorify
Worship is due to The Most High'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'mother-of-god', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: moytu zenagf (moytu-zenagf)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 1
> ዓስቢ ሓጢኣተይ ሞት ምስ ኮነ ፍርዱ
ምፍዳዪ ክስእን እቲ ዕዳይ ከቢዱ
ፍጹም ኣይክኣለን እቲ ቦቕባቕ ከብድኻ
በጃ ሓጢኣተይ ኣንጠብጠበ ደምካ

VERSE 2
ተቆርሰ ስጋኻ
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ

VERSE 3
እየሱሰይ ንስኻ ጥራይ
> ንምንታይ ወዲቀ ዝብሎ የብለይን
መርትዖ ዘቅርቦ መናገፊ ዝኸውን
ንምድሓነይ ግና ንስኻ ኢኻ ምኽንያተይ

VERSE 4
ጽዋእ ሞት ጨሊጥካ
ዘውሓስካለይ ስፍራይ ዘስገርካያ ነፍሰይ
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ

VERSE 5
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ
> ውርደተይ''ዪ ኔሩ ዝተዋረድካዬ
ቅንዕ ክብል ኣነ ድንን ዝበልካዬ

VERSE 6
ክሳብ ክንድዚ ድያ መራር እዛ ፍቅሪ
ሞት ዘሕረየትካ ከለኻ ፈጣሪ
ንጉስ ሰማይ ምድሪ
እናደመየ ዝሓከመ ቁስለይ

VERSE 7
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ
> ንስለይ ዝተኸፍለ ከቢድ ዋጋ

VERSE 8
ኣብ መስቀል
ካብ ልበይ ከይሃስስ ከይብሎ ውን ሸለል
ንቅዱስ መንፈስካ ጎይታ ልኣኸለይ
ክዘኻኽረኒ

VERSE 9
ክሕተም ኣብ ልበይ ክሓትሞ ኣብ ልበይ
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ

VERSE 10
እየሱሰይ ንስኻ ጥራይ',
      lyrics_transliteration = 'Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 1
> asbi hat’iatey mot mis kone firdu
Mifdayi kisen eti eday kebidu
Fits’um aykalen eti boቕbaቕ kebdኻ
Beja hat’iatey ant’ebt’ebe demka

VERSE 2
Teqorse sigaኻ
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey

VERSE 3
Eyesusey nisኻ t’ray
> nimntay wediqe ziblo yebleyn
Merto zeqrbo menagefi ziኸwn
Nimdhaney gina nisኻ iኻ miኽnyatey

VERSE 4
Ts’wae mot ch’elit’ka
Zewhaskaley sifray zesgerkaya nefsey
Enademeye zihakeme qusley
Enadeኸme zeberta hayley

VERSE 5
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray
> wirdetey''yi neru zitewaredkaye
Qine kibl ane dinn zibelkaye

VERSE 6
Kisab kindzi diya merar eza fiqri
Mot zehreyetka keleኻ fet’ari
Nigus semay midri
Enademeye zihakeme qusley

VERSE 7
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray
> nisley ziteኸfle kebid waga

VERSE 8
Ab mesqel
Kab libey keyhass keyblo win shelel
Niqdus menfeska goyta liaኸley
Kizeኻኽreni

VERSE 9
Kihtem ab libey kihatmo ab libey
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey

VERSE 10
Eyesusey nisኻ t’ray',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'moytu-zenagf'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 1
> ዓስቢ ሓጢኣተይ ሞት ምስ ኮነ ፍርዱ
ምፍዳዪ ክስእን እቲ ዕዳይ ከቢዱ
ፍጹም ኣይክኣለን እቲ ቦቕባቕ ከብድኻ
በጃ ሓጢኣተይ ኣንጠብጠበ ደምካ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 2
ተቆርሰ ስጋኻ
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 3
እየሱሰይ ንስኻ ጥራይ
> ንምንታይ ወዲቀ ዝብሎ የብለይን
መርትዖ ዘቅርቦ መናገፊ ዝኸውን
ንምድሓነይ ግና ንስኻ ኢኻ ምኽንያተይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 4
ጽዋእ ሞት ጨሊጥካ
ዘውሓስካለይ ስፍራይ ዘስገርካያ ነፍሰይ
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 5
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ
> ውርደተይ''ዪ ኔሩ ዝተዋረድካዬ
ቅንዕ ክብል ኣነ ድንን ዝበልካዬ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 6
ክሳብ ክንድዚ ድያ መራር እዛ ፍቅሪ
ሞት ዘሕረየትካ ከለኻ ፈጣሪ
ንጉስ ሰማይ ምድሪ
እናደመየ ዝሓከመ ቁስለይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 7
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ
> ንስለይ ዝተኸፍለ ከቢድ ዋጋ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 8
ኣብ መስቀል
ካብ ልበይ ከይሃስስ ከይብሎ ውን ሸለል
ንቅዱስ መንፈስካ ጎይታ ልኣኸለይ
ክዘኻኽረኒ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 9
ክሕተም ኣብ ልበይ ክሓትሞ ኣብ ልበይ
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ

VERSE 10
እየሱሰይ ንስኻ ጥራይ

CHORUS
እናደመየ ዝሓከመ ቁስለይ
እናደኸመ ዘበርትዐ ሓይለይ
ሞይቱ ዘናግፍ ንዓይ''ሲ ሕይወተይ
እየሱሰይ ንስኻ ጥራይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 1
> asbi hat’iatey mot mis kone firdu
Mifdayi kisen eti eday kebidu
Fits’um aykalen eti boቕbaቕ kebdኻ
Beja hat’iatey ant’ebt’ebe demka

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 2
Teqorse sigaኻ
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 3
Eyesusey nisኻ t’ray
> nimntay wediqe ziblo yebleyn
Merto zeqrbo menagefi ziኸwn
Nimdhaney gina nisኻ iኻ miኽnyatey

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 4
Ts’wae mot ch’elit’ka
Zewhaskaley sifray zesgerkaya nefsey
Enademeye zihakeme qusley
Enadeኸme zeberta hayley

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 5
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray
> wirdetey''yi neru zitewaredkaye
Qine kibl ane dinn zibelkaye

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 6
Kisab kindzi diya merar eza fiqri
Mot zehreyetka keleኻ fet’ari
Nigus semay midri
Enademeye zihakeme qusley

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 7
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray
> nisley ziteኸfle kebid waga

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 8
Ab mesqel
Kab libey keyhass keyblo win shelel
Niqdus menfeska goyta liaኸley
Kizeኻኽreni

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 9
Kihtem ab libey kihatmo ab libey
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray

VERSE 10
Eyesusey nisኻ t’ray

CHORUS
Enademeye zihakeme qusley
Enadeኸme zeberta hayley
Moytu zenagf niay''si hiywetey
Eyesusey nisኻ t’ray'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'moytu-zenagf', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: msganayen sewahu bemaleda_zemarit kiyaki (msganayen-sewahu-bemaleda-zemarit-kiyaki)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ምስጋዬን ሰዋሁ በማለዳ
አሻግረኸኝ ሳትቆጥር የኔን እዳ
በዘመኔ ሁሉ ላክብር ስምህን
ሰተኸኛልና ባርከህ ይህን ቀን

VERSE 1
ያልተውከኝ ለራሴ ያልተለየኸኝ
የምስጋና እድሜ ቀን ጨመርክልኝ
ጎብኝተኸኝ ፍቅርህን አይቼ
ለምስጋና ቆምኩኝ ድምፄን አሰምቼ

VERSE 2
ሁሉን የምትፈፅም ሁሉን የምትሰራ
አንተ ነህ ሞገሴ ህይወቴን ምትመራ
ምህረትህ በዝቶልኝ ቀን አየሁ
ለመሀሪነትህ እኔ ዕፁብ እላለሁ

VERSE 3
በዝቶ ያንተ ምህረት ዘመኔን አድሶ
ካቆመኝ በህይወት ብዙ ነውሬን ክሶ
ዘመን ለሰጠኸኝ እኔን ላኖርከኝ
ልኑር ሳወድስህ ለክብርህ ስቀኝ

VERSE 4
ትላንት የነበረው ያብቃ ያ ዘመኔ
ማዳንህን አይቷል ተመልክቷል አይኔ
ስራኝ በመንፈስህ እኔን ቃኘኝና
አንደበቴ ያውጅ ያንተን ግሩም ዝና',
      lyrics_transliteration = 'Misgayen sewahu bemaleda
Ashagreኸgn satqot’r yenen eda
Bezemene hulu lakbr simhn
Seteኸgnalna barkeh yihn qen

VERSE 1
Yaltewkegn lerase yalteleyeኸgn
Yemsgana edme qen ch’emerklgn
Gobgnteኸgn fiqrhn ayche
Lemsgana qomkugn dimts’en asemche

VERSE 2
Hulun yemtfets’m hulun yemtsera
Ante neh mogese hiyweten mitmera
Mihreth beztolgn qen ayehu
Lemeherineth ene ets’ub elalehu

VERSE 3
Bezto yante mihret zemenen adso
Kaqomegn behywet bizu newren kiso
Zemen leset’eኸgn enen lanorkegn
Linur sawedsh lekbrh siqegn

VERSE 4
Tilant yeneberew yabqa ya zemene
Madanhn aytwal temelktwal ayne
Siragn bemenfesh enen qagnegnna
Andebete yawj yanten girum zina',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'msganayen-sewahu-bemaleda-zemarit-kiyaki'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምስጋዬን ሰዋሁ በማለዳ
አሻግረኸኝ ሳትቆጥር የኔን እዳ
በዘመኔ ሁሉ ላክብር ስምህን
ሰተኸኛልና ባርከህ ይህን ቀን

VERSE 1
ያልተውከኝ ለራሴ ያልተለየኸኝ
የምስጋና እድሜ ቀን ጨመርክልኝ
ጎብኝተኸኝ ፍቅርህን አይቼ
ለምስጋና ቆምኩኝ ድምፄን አሰምቼ

CHORUS
ምስጋዬን ሰዋሁ በማለዳ
አሻግረኸኝ ሳትቆጥር የኔን እዳ
በዘመኔ ሁሉ ላክብር ስምህን
ሰተኸኛልና ባርከህ ይህን ቀን

VERSE 2
ሁሉን የምትፈፅም ሁሉን የምትሰራ
አንተ ነህ ሞገሴ ህይወቴን ምትመራ
ምህረትህ በዝቶልኝ ቀን አየሁ
ለመሀሪነትህ እኔ ዕፁብ እላለሁ

CHORUS
ምስጋዬን ሰዋሁ በማለዳ
አሻግረኸኝ ሳትቆጥር የኔን እዳ
በዘመኔ ሁሉ ላክብር ስምህን
ሰተኸኛልና ባርከህ ይህን ቀን

VERSE 3
በዝቶ ያንተ ምህረት ዘመኔን አድሶ
ካቆመኝ በህይወት ብዙ ነውሬን ክሶ
ዘመን ለሰጠኸኝ እኔን ላኖርከኝ
ልኑር ሳወድስህ ለክብርህ ስቀኝ

CHORUS
ምስጋዬን ሰዋሁ በማለዳ
አሻግረኸኝ ሳትቆጥር የኔን እዳ
በዘመኔ ሁሉ ላክብር ስምህን
ሰተኸኛልና ባርከህ ይህን ቀን

VERSE 4
ትላንት የነበረው ያብቃ ያ ዘመኔ
ማዳንህን አይቷል ተመልክቷል አይኔ
ስራኝ በመንፈስህ እኔን ቃኘኝና
አንደበቴ ያውጅ ያንተን ግሩም ዝና

CHORUS
ምስጋዬን ሰዋሁ በማለዳ
አሻግረኸኝ ሳትቆጥር የኔን እዳ
በዘመኔ ሁሉ ላክብር ስምህን
ሰተኸኛልና ባርከህ ይህን ቀን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Misgayen sewahu bemaleda
Ashagreኸgn satqot’r yenen eda
Bezemene hulu lakbr simhn
Seteኸgnalna barkeh yihn qen

VERSE 1
Yaltewkegn lerase yalteleyeኸgn
Yemsgana edme qen ch’emerklgn
Gobgnteኸgn fiqrhn ayche
Lemsgana qomkugn dimts’en asemche

CHORUS
Misgayen sewahu bemaleda
Ashagreኸgn satqot’r yenen eda
Bezemene hulu lakbr simhn
Seteኸgnalna barkeh yihn qen

VERSE 2
Hulun yemtfets’m hulun yemtsera
Ante neh mogese hiyweten mitmera
Mihreth beztolgn qen ayehu
Lemeherineth ene ets’ub elalehu

CHORUS
Misgayen sewahu bemaleda
Ashagreኸgn satqot’r yenen eda
Bezemene hulu lakbr simhn
Seteኸgnalna barkeh yihn qen

VERSE 3
Bezto yante mihret zemenen adso
Kaqomegn behywet bizu newren kiso
Zemen leset’eኸgn enen lanorkegn
Linur sawedsh lekbrh siqegn

CHORUS
Misgayen sewahu bemaleda
Ashagreኸgn satqot’r yenen eda
Bezemene hulu lakbr simhn
Seteኸgnalna barkeh yihn qen

VERSE 4
Tilant yeneberew yabqa ya zemene
Madanhn aytwal temelktwal ayne
Siragn bemenfesh enen qagnegnna
Andebete yawj yanten girum zina

CHORUS
Misgayen sewahu bemaleda
Ashagreኸgn satqot’r yenen eda
Bezemene hulu lakbr simhn
Seteኸgnalna barkeh yihn qen'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'msganayen-sewahu-bemaleda-zemarit-kiyaki', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: My Benevolent Lord (my-benevolent-lord)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Balewiletaye
Kamed yanesahegn ketibya tetiye
Temesgen Getaye',
      lyrics_english = 'My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 1
Closed off by Simon with a heavy discernment
Though he looked down on me with self entitlement
With a proclamation the Lord drew me near Him
I washed His feet with tears no longer feeling grim

VERSE 2
Though my job was to tax collect and oversee
I was ordered by Christ to come down from the tree
His overwhelming grace I struggled to carry
For He has blessed my home Jesus Christ set me free

VERSE 3
To be stoned by jurors when I was surrounded
They listed all my sins to see me convicted
Sin returned the verdict to each their own accord
Go home in peace He said my savior and my Lord

VERSE 4
The God that I worship I know Him He is true
For all He''s done for me with abundant virtue
Within my heart I bear His love and His statute
I cannot leave His sight for He has made me new

VERSE 5
Balewiletaye
Kamed yanesahegn ketibya tetiye
Temesgen Getaye',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'my-benevolent-lord'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Balewiletaye
Kamed yanesahegn ketibya tetiye
Temesgen Getaye'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 1
Closed off by Simon with a heavy discernment
Though he looked down on me with self entitlement
With a proclamation the Lord drew me near Him
I washed His feet with tears no longer feeling grim

CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 2
Though my job was to tax collect and oversee
I was ordered by Christ to come down from the tree
His overwhelming grace I struggled to carry
For He has blessed my home Jesus Christ set me free

CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 3
To be stoned by jurors when I was surrounded
They listed all my sins to see me convicted
Sin returned the verdict to each their own accord
Go home in peace He said my savior and my Lord

CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 4
The God that I worship I know Him He is true
For all He''s done for me with abundant virtue
Within my heart I bear His love and His statute
I cannot leave His sight for He has made me new

CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded

VERSE 5
Balewiletaye
Kamed yanesahegn ketibya tetiye
Temesgen Getaye

CHORUS
My Benevolent Lord
He Lifted me from dust when I was discarded
I praise Him safeguarded'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'my-benevolent-lord', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: My Home is Filled (my-home-is-filled)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Bedinkuane elilta mulu new
Bedinkuane zimare mulu new
Bemaninete lay Egziabher talak new',
      lyrics_english = 'My home is filled with a great jubilee
My tent is full with His praise and glory
For greater is the Lord that resides within me

VERSE 1
Bedinkuane elilta mulu new
Bedinkuane zimare mulu new
Bemaninete lay Egziabher talak new

VERSE 2
From the wrath of my enemy''s anger
He shields me close my Lord and Protector
With compassion my Heavenly armor
Peace now resides in my home and shelter

VERSE 3
My home is filled with a great jubilee
My tent is full with His praise and glory
For greater is the Lord that resides within me

VERSE 4
He leads the way for my path shining bright
In my fatigue for my knees he gives might
With victory He leads me from the front
His praise steers me for He’s never distant

VERSE 5
My home is filled with a great jubilee
My tent is full with His praise and glory
For greater is the Lord that resides within me

VERSE 6
Though I have none He always longs for me
I have been filled no longer unworthy
Even in times full of uncertainty
Joyous I am by the Lord Almighty

VERSE 7
My home is filled with a great jubilee
My tent is full with His praise and glory
For greater is the Lord that resides within me

VERSE 8
I will not twine in lament no longer
I''ve filled my speech with wisdom and scripture
Though some days may remind me of my scar
I will pour songs from the praise reservoir

VERSE 9
My home is filled with a great jubilee
My tent is full with His praise and glory
For greater is the Lord that resides within me

VERSE 10
Bedinkuane elilta mulu new
Bedinkuane zimare mulu new
Bemaninete lay Egziabher talak new',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'my-home-is-filled'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Bedinkuane elilta mulu new
Bedinkuane zimare mulu new
Bemaninete lay Egziabher talak new'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
My home is filled with a great jubilee
My tent is full with His praise and glory
For greater is the Lord that resides within me

VERSE 1
Bedinkuane elilta mulu new
Bedinkuane zimare mulu new
Bemaninete lay Egziabher talak new

CHORUS
My home is filled with a great jubilee
My tent is full with His praise and glory
For greater is the Lord that resides within me

VERSE 2
From the wrath of my enemy''s anger
He shields me close my Lord and Protector
With compassion my Heavenly armor
Peace now resides in my home and shelter

CHORUS
My home is filled with a great jubilee
My tent is full with His praise and glory
For greater is the Lord that resides within me

VERSE 3
My home is filled with a great jubilee
My tent is full with His praise and glory
For greater is the Lord that resides within me

CHORUS
My home is filled with a great jubilee
My tent is full with His praise and glory
For greater is the Lord that resides within me

VERSE 4
He leads the way for my path shining bright
In my fatigue for my knees he gives might
With victory He leads me from the front
His praise steers me for He’s never distant

CHORUS
My home is filled with a great jubilee
My tent is full with His praise and glory
For greater is the Lord that resides within me

VERSE 5
My home is filled with a great jubilee
My tent is full with His praise and glory
For greater is the Lord that resides within me

CHORUS
My home is filled with a great jubilee
My tent is full with His praise and glory
For greater is the Lord that resides within me

VERSE 6
Though I have none He always longs for me
I have been filled no longer unworthy
Even in times full of uncertainty
Joyous I am by the Lord Almighty

CHORUS
My home is filled with a great jubilee
My tent is full with His praise and glory
For greater is the Lord that resides within me

VERSE 7
My home is filled with a great jubilee
My tent is full with His praise and glory
For greater is the Lord that resides within me

CHORUS
My home is filled with a great jubilee
My tent is full with His praise and glory
For greater is the Lord that resides within me

VERSE 8
I will not twine in lament no longer
I''ve filled my speech with wisdom and scripture
Though some days may remind me of my scar
I will pour songs from the praise reservoir

CHORUS
My home is filled with a great jubilee
My tent is full with His praise and glory
For greater is the Lord that resides within me

VERSE 9
My home is filled with a great jubilee
My tent is full with His praise and glory
For greater is the Lord that resides within me

CHORUS
My home is filled with a great jubilee
My tent is full with His praise and glory
For greater is the Lord that resides within me

VERSE 10
Bedinkuane elilta mulu new
Bedinkuane zimare mulu new
Bemaninete lay Egziabher talak new

CHORUS
My home is filled with a great jubilee
My tent is full with His praise and glory
For greater is the Lord that resides within me'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'my-home-is-filled', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: My Lord''s Appearance (my-lords-appearance)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ጌታዬ ሆነ ደም ግባት አልባ
ጀርባው በጅራፍ ስለእኔ ደማ
የእኔን መገረፍ እርሱ ተገርፎ
ክብር አለበሰኝ የእርሱ ተገፎ

VERSE 1
ጌታዬ ሆነ ደም ግባት አልባ
ጀርባው በጅራፍ ስለእኔ ደማ
የእኔን መገረፍ እርሱ ተገርፎ
ክብር አለበሰኝ የእርሱ ተገፎ',
      lyrics_transliteration = 'Getaye hone dem gibat alba
Jerbaw bejiraf sile''ene dema

VERSE 1
Yenegn megeraf ersu tegerfo
Kibir alebesegn yersu tegefo',
      lyrics_english = 'My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 1
Trapped within hatred falsely convicted
The Lord gave me life while apprehended
The wicked see Him as an offender
But for me He is my liberator

VERSE 2
You were chained to spare us
My Savior, Christ Jesus

VERSE 3
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 4
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 5
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 6
They had spat on Him mocked and insulted
Boldly ridiculed they were conceited
Encircled by them He refused to speak
To give me a voice stayed quiet and meek

VERSE 7
You were slain to spare us
My Savior, Christ Jesus

VERSE 8
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 9
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 10
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 11
In Him we found life poured from His punctures
Redeemed the watchers and the accusers
When His arms and legs were struck and were nailed
He had plucked my thorn from death we prevailed

VERSE 12
You were pierced to spare us
My Savior, Christ Jesus

VERSE 13
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 14
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 15
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 16
While bare and exposed He covered my shame
Out of His pure love vinegar He drank
With His stream of grace He had quenched my soul
He paid the great price and He made me whole

VERSE 17
You were parched to spare us
My Savior, Christ Jesus

VERSE 18
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 19
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 20
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'my-lords-appearance'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጌታዬ ሆነ ደም ግባት አልባ
ጀርባው በጅራፍ ስለእኔ ደማ
የእኔን መገረፍ እርሱ ተገርፎ
ክብር አለበሰኝ የእርሱ ተገፎ

VERSE 1
ጌታዬ ሆነ ደም ግባት አልባ
ጀርባው በጅራፍ ስለእኔ ደማ
የእኔን መገረፍ እርሱ ተገርፎ
ክብር አለበሰኝ የእርሱ ተገፎ

CHORUS
ጌታዬ ሆነ ደም ግባት አልባ
ጀርባው በጅራፍ ስለእኔ ደማ
የእኔን መገረፍ እርሱ ተገርፎ
ክብር አለበሰኝ የእርሱ ተገፎ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Getaye hone dem gibat alba
Jerbaw bejiraf sile''ene dema

VERSE 1
Yenegn megeraf ersu tegerfo
Kibir alebesegn yersu tegefo

CHORUS
Getaye hone dem gibat alba
Jerbaw bejiraf sile''ene dema'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 1
Trapped within hatred falsely convicted
The Lord gave me life while apprehended
The wicked see Him as an offender
But for me He is my liberator

CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 2
You were chained to spare us
My Savior, Christ Jesus

CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 3
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 4
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 5
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 6
They had spat on Him mocked and insulted
Boldly ridiculed they were conceited
Encircled by them He refused to speak
To give me a voice stayed quiet and meek

CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 7
You were slain to spare us
My Savior, Christ Jesus

CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 8
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 9
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 10
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 11
In Him we found life poured from His punctures
Redeemed the watchers and the accusers
When His arms and legs were struck and were nailed
He had plucked my thorn from death we prevailed

CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 12
You were pierced to spare us
My Savior, Christ Jesus

CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 13
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 14
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 15
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 16
While bare and exposed He covered my shame
Out of His pure love vinegar He drank
With His stream of grace He had quenched my soul
He paid the great price and He made me whole

CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 17
You were parched to spare us
My Savior, Christ Jesus

CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 18
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 19
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

VERSE 20
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace

CHORUS
My Lord’s appearance disfigured and bruised
He bled out for me was whipped and abused
Took on my beatings and lashed in my place
His honor was stripped to clothe me in grace'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'my-lords-appearance', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: My Strength and Power (my-strength-and-power)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኃይሌ ብርታቴ ክብሬ ሞገሴ /2/
የዘለዓለሙ የአብረሃሙ ሥላሴ /2/

VERSE 1
ኃይሌ ብርታቴ ክብሬ ሞገሴ /2/
የዘለዓለሙ የአብረሃሙ ሥላሴ /2/',
      lyrics_transliteration = 'Hayle birtate kibire mogese

VERSE 1
Yezelelmu yeAbrehamu Selase',
      lyrics_english = 'My strength and power my grace and honor(2)
The Trinity is forever and ever (2)

VERSE 1
My soul has been chosen to give praise and honor
To the Holy Spirit to the Son and Father
Governing on the throne they''re one as well as three
Nothing''s impossible to God the Almighty

VERSE 2
My strength and power my grace and honor (2)
The Trinity is forever and ever (2)

VERSE 3
Standing on the roadside helping all the needy
I will feed the hungry and care for the sickly
Make me like Abraham the saint I admire
Fill my home with blessings its what I desire

VERSE 4
My strength and power my grace and honor (2)
The Trinity is forever and ever (2)

VERSE 5
The Earth and the waters our God created
The works of our Lord by them I''m astounded
Come so you can witness the miracles on Earth
Rejoice for the barren Sarah has given birth

VERSE 6
My strength and power my grace and honor (2)
The Trinity is forever and ever (2)

VERSE 7
For He so loved the world He gave His only son
Tewahedo''s mystery God and man became one
The power of the Holy Spirit is revealed
With saints as His vessels His miracles have healed

VERSE 8
My strength and power my grace and honor (2)
The Trinity is forever and ever (2)',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'my-strength-and-power'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ /2/
የዘለዓለሙ የአብረሃሙ ሥላሴ /2/

VERSE 1
ኃይሌ ብርታቴ ክብሬ ሞገሴ /2/
የዘለዓለሙ የአብረሃሙ ሥላሴ /2/

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ /2/
የዘለዓለሙ የአብረሃሙ ሥላሴ /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hayle birtate kibire mogese

VERSE 1
Yezelelmu yeAbrehamu Selase

CHORUS
Hayle birtate kibire mogese'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
My strength and power my grace and honor(2)
The Trinity is forever and ever (2)

VERSE 1
My soul has been chosen to give praise and honor
To the Holy Spirit to the Son and Father
Governing on the throne they''re one as well as three
Nothing''s impossible to God the Almighty

CHORUS
My strength and power my grace and honor(2)
The Trinity is forever and ever (2)

VERSE 2
My strength and power my grace and honor (2)
The Trinity is forever and ever (2)

CHORUS
My strength and power my grace and honor(2)
The Trinity is forever and ever (2)

VERSE 3
Standing on the roadside helping all the needy
I will feed the hungry and care for the sickly
Make me like Abraham the saint I admire
Fill my home with blessings its what I desire

CHORUS
My strength and power my grace and honor(2)
The Trinity is forever and ever (2)

VERSE 4
My strength and power my grace and honor (2)
The Trinity is forever and ever (2)

CHORUS
My strength and power my grace and honor(2)
The Trinity is forever and ever (2)

VERSE 5
The Earth and the waters our God created
The works of our Lord by them I''m astounded
Come so you can witness the miracles on Earth
Rejoice for the barren Sarah has given birth

CHORUS
My strength and power my grace and honor(2)
The Trinity is forever and ever (2)

VERSE 6
My strength and power my grace and honor (2)
The Trinity is forever and ever (2)

CHORUS
My strength and power my grace and honor(2)
The Trinity is forever and ever (2)

VERSE 7
For He so loved the world He gave His only son
Tewahedo''s mystery God and man became one
The power of the Holy Spirit is revealed
With saints as His vessels His miracles have healed

CHORUS
My strength and power my grace and honor(2)
The Trinity is forever and ever (2)

VERSE 8
My strength and power my grace and honor (2)
The Trinity is forever and ever (2)

CHORUS
My strength and power my grace and honor(2)
The Trinity is forever and ever (2)'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'my-strength-and-power', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: n_seboka_gudeta (n-seboka-gudeta)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ጌታዬ አንተ እዘዘኝ
ልዉጣ ከኋላ ቅደም ከፊቴ
አባቴ ልረፍ ከጉያህ
ልግባ ከእቅፍህ ትዳን ህይወቴ

VERSE 1
አምናለሁ አልጠረጥርም
መዳን ባንተ ነዉ ነፍሴ ታምናለች
አምላኬ አይኔ ወደ አንተ
ወደ ማደሪያህ ሰማይ ታያለች

VERSE 2
አቤቱ አቅሜ ጉልበቴ ሆይ
መድሃኒቴ ማረፊያዬ
የተደገፍኩት ይጥለኛል
አንተ እጠረኝ በዙሪያዬ

VERSE 3
በሰዉ መስፈሪያ አትመዝነኝ
አንተ እንደዚያ አይደለህም
አምንብሃለሁ ወዳጄ ሆይ
አሳልፌ አላማህም

VERSE 4
ቤቴ ቆሽሿል የኔ ጌታ
ይሁንልኝ ቃል ተናገር
ወደ ተሻለዉ ሳልጠጋ
አይምሽብኝ ሳልሻገር

VERSE 5
ቀኑ ሲጨልም ያስተማርከኝ
እርሱ ይሁን በህይወቴ
አንተ ካልወጣህ እኔ አልዉጣ
ቅደምልኝ መድሃኒቴ

VERSE 6
በስምህ መረብ ስወረዉር
አሳ ሞላች ታንኳይቱ
ልፋት ነበር ከራሴ ጋር
ሳልረዳህ ሙሉ ሌቱ

VERSE 7
ለካ ያለ አንተ ሁሉ ባዶ
ሁሉ መና ነዉ ጌታዬ
ዛሬን እንዳየዉ የረዳኸኝ
ለመኖሬ ዋስትናዬ

VERSE 8
ህይወት ቢከብድ አልሞላ ቢል
መጉደል ቢሆን ከሰዉ ሃሳብ
ፍጹም አይለየኝ መታረዜ
መገፋቴ ጥም ረኃብ

VERSE 9
ካንተ መልካም ነዉ
የተሰጠኝ የተቸረኝ የሆነልኝ
ያለኝን ትቼ ልከተልህ
ማረፊያዬ ፍቀድልኝ',
      lyrics_transliteration = 'Getaye ante ezezegn
Liwut’a kehwala qidem kefite
Abate liref keguyah
Ligba keeqfh tidan hiywete

VERSE 1
Amnalehu alt’eret’rm
Medan bante newu nefse tamnalech
Amlake ayne wede ante
Wede maderiyah semay tayalech

VERSE 2
Abetu aqme gulbete hoy
Medhanite marefiyaye
Yetedegefkut yit’legnal
Ante et’eregn bezuriyaye

VERSE 3
Besewu mesferiya atmeznegn
Ante endeziya aydelehm
Amnbhalehu wedaje hoy
Asalfe alamahm

VERSE 4
Bete qoshshwal yene Geta
Yihunlgn qal tenager
Wede teshalewu salt’ega
Aymshbgn salshager

VERSE 5
Qenu sich’elm yastemarkegn
Ersu yihun behywete
Ante kalwet’ah ene alwut’a
Qidemlgn medhanite

VERSE 6
Besmh mereb siwerewur
Asa molach tankwaytu
Lifat neber kerase gar
Salredah mulu letu

VERSE 7
Leka yale ante hulu bado
Hulu mena newu Getaye
Zaren endayewu yeredaኸgn
Lemenore wastnaye

VERSE 8
Hiywet bikebd almola bil
Megudel bihon kesewu hasab
Fits’um ayleyegn metareze
Megefate t’m rehab

VERSE 9
Kante melkam newu
Yeteset’egn yetecheregn yehonelgn
Yalegnn tiche liketelh
Marefiyaye fiqedlgn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'n-seboka-gudeta'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጌታዬ አንተ እዘዘኝ
ልዉጣ ከኋላ ቅደም ከፊቴ
አባቴ ልረፍ ከጉያህ
ልግባ ከእቅፍህ ትዳን ህይወቴ

VERSE 1
አምናለሁ አልጠረጥርም
መዳን ባንተ ነዉ ነፍሴ ታምናለች
አምላኬ አይኔ ወደ አንተ
ወደ ማደሪያህ ሰማይ ታያለች

CHORUS
ጌታዬ አንተ እዘዘኝ
ልዉጣ ከኋላ ቅደም ከፊቴ
አባቴ ልረፍ ከጉያህ
ልግባ ከእቅፍህ ትዳን ህይወቴ

VERSE 2
አቤቱ አቅሜ ጉልበቴ ሆይ
መድሃኒቴ ማረፊያዬ
የተደገፍኩት ይጥለኛል
አንተ እጠረኝ በዙሪያዬ

CHORUS
ጌታዬ አንተ እዘዘኝ
ልዉጣ ከኋላ ቅደም ከፊቴ
አባቴ ልረፍ ከጉያህ
ልግባ ከእቅፍህ ትዳን ህይወቴ

VERSE 3
በሰዉ መስፈሪያ አትመዝነኝ
አንተ እንደዚያ አይደለህም
አምንብሃለሁ ወዳጄ ሆይ
አሳልፌ አላማህም

CHORUS
ጌታዬ አንተ እዘዘኝ
ልዉጣ ከኋላ ቅደም ከፊቴ
አባቴ ልረፍ ከጉያህ
ልግባ ከእቅፍህ ትዳን ህይወቴ

VERSE 4
ቤቴ ቆሽሿል የኔ ጌታ
ይሁንልኝ ቃል ተናገር
ወደ ተሻለዉ ሳልጠጋ
አይምሽብኝ ሳልሻገር

CHORUS
ጌታዬ አንተ እዘዘኝ
ልዉጣ ከኋላ ቅደም ከፊቴ
አባቴ ልረፍ ከጉያህ
ልግባ ከእቅፍህ ትዳን ህይወቴ

VERSE 5
ቀኑ ሲጨልም ያስተማርከኝ
እርሱ ይሁን በህይወቴ
አንተ ካልወጣህ እኔ አልዉጣ
ቅደምልኝ መድሃኒቴ

CHORUS
ጌታዬ አንተ እዘዘኝ
ልዉጣ ከኋላ ቅደም ከፊቴ
አባቴ ልረፍ ከጉያህ
ልግባ ከእቅፍህ ትዳን ህይወቴ

VERSE 6
በስምህ መረብ ስወረዉር
አሳ ሞላች ታንኳይቱ
ልፋት ነበር ከራሴ ጋር
ሳልረዳህ ሙሉ ሌቱ

CHORUS
ጌታዬ አንተ እዘዘኝ
ልዉጣ ከኋላ ቅደም ከፊቴ
አባቴ ልረፍ ከጉያህ
ልግባ ከእቅፍህ ትዳን ህይወቴ

VERSE 7
ለካ ያለ አንተ ሁሉ ባዶ
ሁሉ መና ነዉ ጌታዬ
ዛሬን እንዳየዉ የረዳኸኝ
ለመኖሬ ዋስትናዬ

CHORUS
ጌታዬ አንተ እዘዘኝ
ልዉጣ ከኋላ ቅደም ከፊቴ
አባቴ ልረፍ ከጉያህ
ልግባ ከእቅፍህ ትዳን ህይወቴ

VERSE 8
ህይወት ቢከብድ አልሞላ ቢል
መጉደል ቢሆን ከሰዉ ሃሳብ
ፍጹም አይለየኝ መታረዜ
መገፋቴ ጥም ረኃብ

CHORUS
ጌታዬ አንተ እዘዘኝ
ልዉጣ ከኋላ ቅደም ከፊቴ
አባቴ ልረፍ ከጉያህ
ልግባ ከእቅፍህ ትዳን ህይወቴ

VERSE 9
ካንተ መልካም ነዉ
የተሰጠኝ የተቸረኝ የሆነልኝ
ያለኝን ትቼ ልከተልህ
ማረፊያዬ ፍቀድልኝ

CHORUS
ጌታዬ አንተ እዘዘኝ
ልዉጣ ከኋላ ቅደም ከፊቴ
አባቴ ልረፍ ከጉያህ
ልግባ ከእቅፍህ ትዳን ህይወቴ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Getaye ante ezezegn
Liwut’a kehwala qidem kefite
Abate liref keguyah
Ligba keeqfh tidan hiywete

VERSE 1
Amnalehu alt’eret’rm
Medan bante newu nefse tamnalech
Amlake ayne wede ante
Wede maderiyah semay tayalech

CHORUS
Getaye ante ezezegn
Liwut’a kehwala qidem kefite
Abate liref keguyah
Ligba keeqfh tidan hiywete

VERSE 2
Abetu aqme gulbete hoy
Medhanite marefiyaye
Yetedegefkut yit’legnal
Ante et’eregn bezuriyaye

CHORUS
Getaye ante ezezegn
Liwut’a kehwala qidem kefite
Abate liref keguyah
Ligba keeqfh tidan hiywete

VERSE 3
Besewu mesferiya atmeznegn
Ante endeziya aydelehm
Amnbhalehu wedaje hoy
Asalfe alamahm

CHORUS
Getaye ante ezezegn
Liwut’a kehwala qidem kefite
Abate liref keguyah
Ligba keeqfh tidan hiywete

VERSE 4
Bete qoshshwal yene Geta
Yihunlgn qal tenager
Wede teshalewu salt’ega
Aymshbgn salshager

CHORUS
Getaye ante ezezegn
Liwut’a kehwala qidem kefite
Abate liref keguyah
Ligba keeqfh tidan hiywete

VERSE 5
Qenu sich’elm yastemarkegn
Ersu yihun behywete
Ante kalwet’ah ene alwut’a
Qidemlgn medhanite

CHORUS
Getaye ante ezezegn
Liwut’a kehwala qidem kefite
Abate liref keguyah
Ligba keeqfh tidan hiywete

VERSE 6
Besmh mereb siwerewur
Asa molach tankwaytu
Lifat neber kerase gar
Salredah mulu letu

CHORUS
Getaye ante ezezegn
Liwut’a kehwala qidem kefite
Abate liref keguyah
Ligba keeqfh tidan hiywete

VERSE 7
Leka yale ante hulu bado
Hulu mena newu Getaye
Zaren endayewu yeredaኸgn
Lemenore wastnaye

CHORUS
Getaye ante ezezegn
Liwut’a kehwala qidem kefite
Abate liref keguyah
Ligba keeqfh tidan hiywete

VERSE 8
Hiywet bikebd almola bil
Megudel bihon kesewu hasab
Fits’um ayleyegn metareze
Megefate t’m rehab

CHORUS
Getaye ante ezezegn
Liwut’a kehwala qidem kefite
Abate liref keguyah
Ligba keeqfh tidan hiywete

VERSE 9
Kante melkam newu
Yeteset’egn yetecheregn yehonelgn
Yalegnn tiche liketelh
Marefiyaye fiqedlgn

CHORUS
Getaye ante ezezegn
Liwut’a kehwala qidem kefite
Abate liref keguyah
Ligba keeqfh tidan hiywete'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'n-seboka-gudeta', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: na medhanite (na-medhanite)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 1
የምሕረት አባት አማኑኤል
የቸርነት ጌታ ''''
ፊትህ የተመላ ''''
ሁሌ በይቅርታ ''''

VERSE 2
ካለው ፍቅር በላይ ''''
አባት ለአንድ ልጁ ''''
አምላክ ይወደናል ''''
አይጥለንም ከእጁ ''''

VERSE 3
መድኃኒቴ ልበል አማኑኤል
ድኛለው በሞትህ ''''
ቁስሌ ተፈውሷል ''''
በቁስልህ በሞትህ ''''

VERSE 4
ስሸጥህ አቀፍከኝ ''''
ስወጋህ አይኔ በራ ''''
በፍቅርህ አወጣኽኝ ''''
ከዚያ ከመከራ ''''

VERSE 5
አንተ ከኔ ጋር ነህ አማኑኤል
አዎ ከኔ ጋራ ''''
ድል አርገህልኛል ''''
የጭንቄን ተራራ ''''

VERSE 6
በጉባኤ መሀል ''''
አፌ አንተን አወጀ ''''
የከበረ ደምህ ''''
ነፍሴን ስለዋጀ ''''

VERSE 7
የድንግሏ ፍሬ አማኑኤል
የበላቴናዋ ''''
የቤቴ ምሰሶ ''''
የነፍሴ ቤዛዋ ''''

VERSE 8
መሠረቴ አንተ ነህ ''''
ያሳደገኝ እጅህ ''''
አተወኝም አንተ ''''
ስለሆንኩኝ ልጅህ ''''',
      lyrics_transliteration = 'Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Nana Amanuel na medhenite
Fiqrhn albsegn yiqr meraqote (2)

VERSE 1
Yemhret abat Amanuel
Yechernet Geta ''''
Fith yetemela ''''
Hule beyqrta ''''

VERSE 2
Kalew fiqr belay ''''
Abat leand liju ''''
Amlak yiwedenal ''''
Ayt’lenm keeju ''''

VERSE 3
Medhanite libel Amanuel
Dignalew bemoth ''''
Qusle tefewswal ''''
Bequslh bemoth ''''

VERSE 4
Sishet’h aqefkegn ''''
Siwegah ayne bera ''''
Befqrh awet’aኽgn ''''
Keziya kemekera ''''

VERSE 5
Ante kene gar neh Amanuel
Awo kene gara ''''
Dil argehlgnal ''''
Yech’nqen terara ''''

VERSE 6
Begubae mehel ''''
Afe anten aweje ''''
Yekebere demh ''''
Nefsen silewaje ''''

VERSE 7
Yednglwa fire Amanuel
Yebelatenawa ''''
Yebete miseso ''''
Yenefse bezawa ''''

VERSE 8
Meserete ante neh ''''
Yasadegegn ejh ''''
Atewegnm ante ''''
Silehonkugn lijh ''''',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'na-medhanite'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 1
የምሕረት አባት አማኑኤል
የቸርነት ጌታ ''''
ፊትህ የተመላ ''''
ሁሌ በይቅርታ ''''

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 2
ካለው ፍቅር በላይ ''''
አባት ለአንድ ልጁ ''''
አምላክ ይወደናል ''''
አይጥለንም ከእጁ ''''

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 3
መድኃኒቴ ልበል አማኑኤል
ድኛለው በሞትህ ''''
ቁስሌ ተፈውሷል ''''
በቁስልህ በሞትህ ''''

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 4
ስሸጥህ አቀፍከኝ ''''
ስወጋህ አይኔ በራ ''''
በፍቅርህ አወጣኽኝ ''''
ከዚያ ከመከራ ''''

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 5
አንተ ከኔ ጋር ነህ አማኑኤል
አዎ ከኔ ጋራ ''''
ድል አርገህልኛል ''''
የጭንቄን ተራራ ''''

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 6
በጉባኤ መሀል ''''
አፌ አንተን አወጀ ''''
የከበረ ደምህ ''''
ነፍሴን ስለዋጀ ''''

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 7
የድንግሏ ፍሬ አማኑኤል
የበላቴናዋ ''''
የቤቴ ምሰሶ ''''
የነፍሴ ቤዛዋ ''''

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 8
መሠረቴ አንተ ነህ ''''
ያሳደገኝ እጅህ ''''
አተወኝም አንተ ''''
ስለሆንኩኝ ልጅህ ''''

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Nana Amanuel na medhenite
Fiqrhn albsegn yiqr meraqote (2)

VERSE 1
Yemhret abat Amanuel
Yechernet Geta ''''
Fith yetemela ''''
Hule beyqrta ''''

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Nana Amanuel na medhenite
Fiqrhn albsegn yiqr meraqote (2)

VERSE 2
Kalew fiqr belay ''''
Abat leand liju ''''
Amlak yiwedenal ''''
Ayt’lenm keeju ''''

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Nana Amanuel na medhenite
Fiqrhn albsegn yiqr meraqote (2)

VERSE 3
Medhanite libel Amanuel
Dignalew bemoth ''''
Qusle tefewswal ''''
Bequslh bemoth ''''

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Nana Amanuel na medhenite
Fiqrhn albsegn yiqr meraqote (2)

VERSE 4
Sishet’h aqefkegn ''''
Siwegah ayne bera ''''
Befqrh awet’aኽgn ''''
Keziya kemekera ''''

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Nana Amanuel na medhenite
Fiqrhn albsegn yiqr meraqote (2)

VERSE 5
Ante kene gar neh Amanuel
Awo kene gara ''''
Dil argehlgnal ''''
Yech’nqen terara ''''

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Nana Amanuel na medhenite
Fiqrhn albsegn yiqr meraqote (2)

VERSE 6
Begubae mehel ''''
Afe anten aweje ''''
Yekebere demh ''''
Nefsen silewaje ''''

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Nana Amanuel na medhenite
Fiqrhn albsegn yiqr meraqote (2)

VERSE 7
Yednglwa fire Amanuel
Yebelatenawa ''''
Yebete miseso ''''
Yenefse bezawa ''''

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Nana Amanuel na medhenite
Fiqrhn albsegn yiqr meraqote (2)

VERSE 8
Meserete ante neh ''''
Yasadegegn ejh ''''
Atewegnm ante ''''
Silehonkugn lijh ''''

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Nana Amanuel na medhenite
Fiqrhn albsegn yiqr meraqote (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'na-medhanite', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: NAFKOT (nafkot)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 1
ምን አሳይሃለሁ ከበደሌ በቀር
ጣትህ እስኪቆስል ታንኳኳለህ አንተ
ሃጥያት ለጠፈራት የመከነች ፍሬ
ተኝቼ እንዳይመስልህ

VERSE 2
ክፋት ያከረፋው አያስጠጋም ነውሬ(2)
መቼ #ትሄዳለህ
ከዳሰስኸው ቤቴ ተስፋ ማድረግ ትተህ
ካልጎደለ በረት ላንዲት ግልገል ፍቅር ምን አንከራተተህ

VERSE 3
አትፈልገኝ #ልቅር
ይደብቀኝ ቤቴ ሽፍንፍኑን ታኮ
በሚሰጡ እጆች ፊት ለመቀበል ማነስ ያሳፍራል እኮ
መቼ #ትሄዳለህ

VERSE 4
አትግለጡኝ ልቅር ይሸሸግ እርቃኔ ጨለማውን ታኮ
በሚምር ልብ ፊት ለይቅርታ ማነስ ያሳፍራል እኮ
መቼ #ትሄዳለህ
ወደ ክብርህ እልፍኝ ማደርያዬን ከሰህ

VERSE 5
ካልጎደለ በረት ላንዲት ባዶ ግልገል ምን አስተናነሰህ
ባንዲት ድኩን መቃን ካንተ ለመሰወር እንደማልችል ባውቅም
በእፍረት አደቀቀኝ ምህርትህ ጉልበቱ የድፍረቴን አቅም
ተመልከተኝማ ተመልከተኝ እስቲ ጥፋት እኮ ስም ቢፈልግ ኮርቶ በእኔ በተጠራ

VERSE 6
ነውር እኮ ቤት ቢኖረው ሰውነቴ የእርሱ ስፍራ
ሃጥያት እኮ አባት ቢሻ ደም አምጬ በወለድኩት
ክፋት እኮ መልክ ቢሆን ቁርጥ እርሱን በመሰልኩት
በደል እኮ ትግል ቢሻ እኔ እኮ ነኝ ጦር ጉልበቱ

VERSE 7
ዝሙት እኮ ውበት ቢሆን መልኬ ነበር ምልክቱ
ደግ አይደለህ ሁሉን ሸፋኝ ምን በገፄ ተገለጠ
መራቆቴ ምህረት አቅፎት በቸር ክንድህ ባመለጠ
እንኳን ልትፈርድ በሸሸግከው በመረሳት ዋጋ ቀለህ

VERSE 8
እንደገና ለመከዳት ዛሬም በሬን ታለኳኳለህ?
ዛሬም አለህ? #ዛሬም አለህ?
አትለየኝም ወይ!
ምን ምን ፍቅር ቢያስርህ ነው እንዳትጠየፈኝ

VERSE 9
የጥፋቴ ፍሬ ካቆሰለኝ በላይ ትዕግስትህ ገረፈኝ
ስፍር አልባ ፍቅርህ ዛሬም ወደ እቅፉ ቢስበኝም ባርኮ
እንደምን ልነሳ በሚምሩ አይኖች ፊት ለመታየት ማነስ ያሳፍራል
እንጂ #ናፍቀኸኛል

VERSE 10
በዕርያዎች መሃል ረሃብ አስተናንሶኝ
በገፋው እጥፍ ውርደት አጎናብሶኝ
በመከራው ጽናት ፍፁም ተንጠፍጥፎ የልጅነት ወዜ
የፍቅርህን እልፍኝ የእቅፍህን መዐዛ ባስታወስኩት ጊዜ

VERSE 11
አንገቴን ሰብሬ ላራቡኝ አይኖችህ ቀን ከሌት ባነባም
አባቴ ባንተ ፊት ልጅ ልባል አይገባም
አትቀፈኝ ልቅር የምህረትህ ዜማ ቢጣራኝም ማርኮ
እንደምነወ ልነሳ በንፁህ ልብ ፊት ለመፈቀር ማነስ ያሳፍራል እኮ

VERSE 12
መቼ #ትሄዳለህ
ወደ ክብርህ እልፍኝ ማደርያዬን ከሰህ
ካልጎደለ በረት ላንዲት ባዶ ግልገል ምን አስተናነሰህ
ያውም በጨለማ 99 በግ ምድረ በዳ ትተህ

VERSE 13
መዋረድ ሳይገድህ ከጌትነት ማዕረግ አንዲት ሃ ጥል ሽተህ
ከመጓዙ ብዛት ባይዝልም አካልህ አቅፎህ እስኪረካ
እንደምን ልቅረብህ ከመልካም አባት ፈለት ለልጅነት ማነስ ያሳፍራል ለካ
እንጂ #ናፍቀኸኛል

VERSE 14
በስምህ መስክ ላይ አጊጦ መታደስ
በምስጋናህ ውበት ዘላለም መቀደስ
በደስታ ወይን ፊት በሃሴት መዋኘት
ከሰካም እቅፍህ በክብር መገኘት

VERSE 15
እንጂ #ናፍቀኸኛል
በጨለማ ቁስል የብቻ አለም ሙሾ ምደረድር እኔ
ቢቸግረኝ እንጂ ልክ አልባ ፍቅርህን የመሸከም ወኔ
እንጂማ እንኳንስ እንደኔ ላለ ነብስ

VERSE 16
በርኩሰት በረሻ ስምህን ተጠምቶ
ለክብርህ ምስጋና ከመቅደስ ያደረስ
መች ይጠግባል ጠርቶ
መፅፅናናቴ ሆይ

VERSE 17
የልጅነት ልቤን ትዕቢት አስኮብልሎት ከመንገድ ቢቀርም
አንተ ግን አንተ ነህ ፍቅርህ አይቀየርም
በሌት ተንከራተው ከገፋሁት በረት በፍቅር የጠሩኝ
ከፀፀቴ ገዝፈው መማር የቸኮሉት አይኖችህ ሰበሩኝ

VERSE 18
በገፋሁት ልኬት በጠፋሁት መጠን እየተከተለ
ላይተወኝን ፍቅር ላይረሳኝን ስስት ከእግሮችህ ተሳለ
በዚህ ሁሉ መጠን መጎንበስ ልብህን ያላደነደነው
በዚህ ሁሉ ልኬት መገፋት ክብርህን ያልተፈታተነው

VERSE 19
በዚዝህ ሁሉ ስሌት መፈለግ ተስፋህን ያላመነመነው
ዛሬም ከበራፌ አምነህ ምታንኳኳኝ
እንዴት #ብትወደኝ #ነው',
      lyrics_transliteration = 'Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 1
Min asayhalehu kebedele beqer
T’ath eskiqosl tankwakwaleh ante
Hat’yat let’eferat yemekenech fire
Tegnche endaymeslh

VERSE 2
Kifat yakerefaw ayast’egam newre (2)
Meche #thedaleh
Kedasesኸw bete tesfa madreg titeh
Kalgodele beret landit gilgel fiqr min ankerateteh

VERSE 3
Atfelgegn #lqr
Yidebqegn bete shfnfnun tako
Bemiset’u ejoch fit lemeqebel manes yasafral eko
Meche #thedaleh

VERSE 4
Atglet’ugn liqr yishesheg erqane ch’elemawn tako
Bemimr lib fit leyqrta manes yasafral eko
Meche #thedaleh
Wede kibrh elfgn maderyayen keseh

VERSE 5
Kalgodele beret landit bado gilgel min astenaneseh
Bandit dikun meqan kante lemesewer endemalchl bawqm
Beefret adeqeqegn mihrth gulbetu yedfreten aqm
Temelketegnma temelketegn esti t’fat eko sim bifelg korto beene betet’era

VERSE 6
Newr eko bet binorew sewnete yeersu sifra
Hat’yat eko abat bisha dem amch’e beweledkut
Kifat eko melk bihon qurt’ ersun bemeselkut
Bedel eko tigl bisha ene eko negn t’or gulbetu

VERSE 7
Zimut eko wibet bihon melke neber milktu
Deg aydeleh hulun shefagn min begets’e tegelet’e
Meraqote mihret aqfot becher kindh bamelet’e
Enkwan litferd besheshegkew bemeresat waga qeleh

VERSE 8
Endegena lemekedat zarem beren talekwakwaleh?
Zarem aleh? #zarem aleh?
Atleyegnm wey!
Min min fiqr biyasrh new endatt’eyefegn

VERSE 9
Yet’fate fire kaqoselegn belay tiegsth gerefegn
Sifr alba fiqrh zarem wede eqfu bisbegnm barko
Endemn linesa bemimru aynoch fit lemetayet manes yasafral
Enji #nafqeኸgnal

VERSE 10
Beeryawoch mehal rehab astenansogn
Begefaw et’f wirdet agonabsogn
Bemekeraw ts’nat fits’um tent’eft’fo yeljnet weze
Yefqrhn elfgn yeeqfhn meaza bastaweskut gize

VERSE 11
Angeten sebre larabugn aynochh qen kelet banebam
Abate bante fit lij libal aygebam
Atqefegn liqr yemhreth zema bit’aragnm marko
Endemnewe linesa bents’uh lib fit lemefeqer manes yasafral eko

VERSE 12
Meche #thedaleh
Wede kibrh elfgn maderyayen keseh
Kalgodele beret landit bado gilgel min astenaneseh
Yawm bech’elema 99 beg midre beda titeh

VERSE 13
Mewared saygedh kegetnet maereg andit ha t’l shteh
Kemegwazu bizat bayzlm akalh aqfoh eskireka
Endemn liqrebh kemelkam abat felet leljnet manes yasafral leka
Enji #nafqeኸgnal

VERSE 14
Besmh mesk lay agit’o metades
Bemsganah wibet zelalem meqedes
Bedesta weyn fit behaset mewagnet
Kesekam eqfh bekbr megegnet

VERSE 15
Enji #nafqeኸgnal
Bech’elema qusl yebcha alem musho mideredr ene
Bichegregn enji lik alba fiqrhn yemeshekem wene
Enjima enkwans endene lale nebs

VERSE 16
Berkuset beresha simhn tet’emto
Lekbrh misgana kemeqdes yaderes
Mech yit’egbal t’erto
Mets’ts’nanate hoy

VERSE 17
Yeljnet liben tiebit askobllot kemenged biqerm
Ante gin ante neh fiqrh ayqeyerm
Belet tenkeratew kegefahut beret befqr yet’erugn
Kets’ets’ete gezfew memar yechekolut aynochh seberugn

VERSE 18
Begefahut liket bet’efahut met’en eyeteketele
Laytewegnn fiqr layresagnn sist keegrochh tesale
Bezih hulu met’en megonbes libhn yaladenedenew
Bezih hulu liket megefat kibrhn yaltefetatenew

VERSE 19
Bezizh hulu silet mefeleg tesfahn yalamenemenew
Zarem keberafe amneh mitankwakwagn
Endet #btwedegn #new',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nafkot'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 1
ምን አሳይሃለሁ ከበደሌ በቀር
ጣትህ እስኪቆስል ታንኳኳለህ አንተ
ሃጥያት ለጠፈራት የመከነች ፍሬ
ተኝቼ እንዳይመስልህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 2
ክፋት ያከረፋው አያስጠጋም ነውሬ(2)
መቼ #ትሄዳለህ
ከዳሰስኸው ቤቴ ተስፋ ማድረግ ትተህ
ካልጎደለ በረት ላንዲት ግልገል ፍቅር ምን አንከራተተህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 3
አትፈልገኝ #ልቅር
ይደብቀኝ ቤቴ ሽፍንፍኑን ታኮ
በሚሰጡ እጆች ፊት ለመቀበል ማነስ ያሳፍራል እኮ
መቼ #ትሄዳለህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 4
አትግለጡኝ ልቅር ይሸሸግ እርቃኔ ጨለማውን ታኮ
በሚምር ልብ ፊት ለይቅርታ ማነስ ያሳፍራል እኮ
መቼ #ትሄዳለህ
ወደ ክብርህ እልፍኝ ማደርያዬን ከሰህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 5
ካልጎደለ በረት ላንዲት ባዶ ግልገል ምን አስተናነሰህ
ባንዲት ድኩን መቃን ካንተ ለመሰወር እንደማልችል ባውቅም
በእፍረት አደቀቀኝ ምህርትህ ጉልበቱ የድፍረቴን አቅም
ተመልከተኝማ ተመልከተኝ እስቲ ጥፋት እኮ ስም ቢፈልግ ኮርቶ በእኔ በተጠራ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 6
ነውር እኮ ቤት ቢኖረው ሰውነቴ የእርሱ ስፍራ
ሃጥያት እኮ አባት ቢሻ ደም አምጬ በወለድኩት
ክፋት እኮ መልክ ቢሆን ቁርጥ እርሱን በመሰልኩት
በደል እኮ ትግል ቢሻ እኔ እኮ ነኝ ጦር ጉልበቱ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 7
ዝሙት እኮ ውበት ቢሆን መልኬ ነበር ምልክቱ
ደግ አይደለህ ሁሉን ሸፋኝ ምን በገፄ ተገለጠ
መራቆቴ ምህረት አቅፎት በቸር ክንድህ ባመለጠ
እንኳን ልትፈርድ በሸሸግከው በመረሳት ዋጋ ቀለህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 8
እንደገና ለመከዳት ዛሬም በሬን ታለኳኳለህ?
ዛሬም አለህ? #ዛሬም አለህ?
አትለየኝም ወይ!
ምን ምን ፍቅር ቢያስርህ ነው እንዳትጠየፈኝ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 9
የጥፋቴ ፍሬ ካቆሰለኝ በላይ ትዕግስትህ ገረፈኝ
ስፍር አልባ ፍቅርህ ዛሬም ወደ እቅፉ ቢስበኝም ባርኮ
እንደምን ልነሳ በሚምሩ አይኖች ፊት ለመታየት ማነስ ያሳፍራል
እንጂ #ናፍቀኸኛል

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 10
በዕርያዎች መሃል ረሃብ አስተናንሶኝ
በገፋው እጥፍ ውርደት አጎናብሶኝ
በመከራው ጽናት ፍፁም ተንጠፍጥፎ የልጅነት ወዜ
የፍቅርህን እልፍኝ የእቅፍህን መዐዛ ባስታወስኩት ጊዜ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 11
አንገቴን ሰብሬ ላራቡኝ አይኖችህ ቀን ከሌት ባነባም
አባቴ ባንተ ፊት ልጅ ልባል አይገባም
አትቀፈኝ ልቅር የምህረትህ ዜማ ቢጣራኝም ማርኮ
እንደምነወ ልነሳ በንፁህ ልብ ፊት ለመፈቀር ማነስ ያሳፍራል እኮ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 12
መቼ #ትሄዳለህ
ወደ ክብርህ እልፍኝ ማደርያዬን ከሰህ
ካልጎደለ በረት ላንዲት ባዶ ግልገል ምን አስተናነሰህ
ያውም በጨለማ 99 በግ ምድረ በዳ ትተህ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 13
መዋረድ ሳይገድህ ከጌትነት ማዕረግ አንዲት ሃ ጥል ሽተህ
ከመጓዙ ብዛት ባይዝልም አካልህ አቅፎህ እስኪረካ
እንደምን ልቅረብህ ከመልካም አባት ፈለት ለልጅነት ማነስ ያሳፍራል ለካ
እንጂ #ናፍቀኸኛል

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 14
በስምህ መስክ ላይ አጊጦ መታደስ
በምስጋናህ ውበት ዘላለም መቀደስ
በደስታ ወይን ፊት በሃሴት መዋኘት
ከሰካም እቅፍህ በክብር መገኘት

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 15
እንጂ #ናፍቀኸኛል
በጨለማ ቁስል የብቻ አለም ሙሾ ምደረድር እኔ
ቢቸግረኝ እንጂ ልክ አልባ ፍቅርህን የመሸከም ወኔ
እንጂማ እንኳንስ እንደኔ ላለ ነብስ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 16
በርኩሰት በረሻ ስምህን ተጠምቶ
ለክብርህ ምስጋና ከመቅደስ ያደረስ
መች ይጠግባል ጠርቶ
መፅፅናናቴ ሆይ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 17
የልጅነት ልቤን ትዕቢት አስኮብልሎት ከመንገድ ቢቀርም
አንተ ግን አንተ ነህ ፍቅርህ አይቀየርም
በሌት ተንከራተው ከገፋሁት በረት በፍቅር የጠሩኝ
ከፀፀቴ ገዝፈው መማር የቸኮሉት አይኖችህ ሰበሩኝ

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 18
በገፋሁት ልኬት በጠፋሁት መጠን እየተከተለ
ላይተወኝን ፍቅር ላይረሳኝን ስስት ከእግሮችህ ተሳለ
በዚህ ሁሉ መጠን መጎንበስ ልብህን ያላደነደነው
በዚህ ሁሉ ልኬት መገፋት ክብርህን ያልተፈታተነው

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ

VERSE 19
በዚዝህ ሁሉ ስሌት መፈለግ ተስፋህን ያላመነመነው
ዛሬም ከበራፌ አምነህ ምታንኳኳኝ
እንዴት #ብትወደኝ #ነው

CHORUS
አትለየኝም #ወይ
ናፍቆት ባዛላቸው ደጅ የጠኑ ጣቶች
የበሬ መቃኑ ሰርክ ቢቀረቀር
አትዘን ጌታዬ ከፍቼ ብትገባስ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 1
Min asayhalehu kebedele beqer
T’ath eskiqosl tankwakwaleh ante
Hat’yat let’eferat yemekenech fire
Tegnche endaymeslh

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 2
Kifat yakerefaw ayast’egam newre (2)
Meche #thedaleh
Kedasesኸw bete tesfa madreg titeh
Kalgodele beret landit gilgel fiqr min ankerateteh

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 3
Atfelgegn #lqr
Yidebqegn bete shfnfnun tako
Bemiset’u ejoch fit lemeqebel manes yasafral eko
Meche #thedaleh

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 4
Atglet’ugn liqr yishesheg erqane ch’elemawn tako
Bemimr lib fit leyqrta manes yasafral eko
Meche #thedaleh
Wede kibrh elfgn maderyayen keseh

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 5
Kalgodele beret landit bado gilgel min astenaneseh
Bandit dikun meqan kante lemesewer endemalchl bawqm
Beefret adeqeqegn mihrth gulbetu yedfreten aqm
Temelketegnma temelketegn esti t’fat eko sim bifelg korto beene betet’era

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 6
Newr eko bet binorew sewnete yeersu sifra
Hat’yat eko abat bisha dem amch’e beweledkut
Kifat eko melk bihon qurt’ ersun bemeselkut
Bedel eko tigl bisha ene eko negn t’or gulbetu

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 7
Zimut eko wibet bihon melke neber milktu
Deg aydeleh hulun shefagn min begets’e tegelet’e
Meraqote mihret aqfot becher kindh bamelet’e
Enkwan litferd besheshegkew bemeresat waga qeleh

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 8
Endegena lemekedat zarem beren talekwakwaleh?
Zarem aleh? #zarem aleh?
Atleyegnm wey!
Min min fiqr biyasrh new endatt’eyefegn

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 9
Yet’fate fire kaqoselegn belay tiegsth gerefegn
Sifr alba fiqrh zarem wede eqfu bisbegnm barko
Endemn linesa bemimru aynoch fit lemetayet manes yasafral
Enji #nafqeኸgnal

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 10
Beeryawoch mehal rehab astenansogn
Begefaw et’f wirdet agonabsogn
Bemekeraw ts’nat fits’um tent’eft’fo yeljnet weze
Yefqrhn elfgn yeeqfhn meaza bastaweskut gize

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 11
Angeten sebre larabugn aynochh qen kelet banebam
Abate bante fit lij libal aygebam
Atqefegn liqr yemhreth zema bit’aragnm marko
Endemnewe linesa bents’uh lib fit lemefeqer manes yasafral eko

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 12
Meche #thedaleh
Wede kibrh elfgn maderyayen keseh
Kalgodele beret landit bado gilgel min astenaneseh
Yawm bech’elema 99 beg midre beda titeh

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 13
Mewared saygedh kegetnet maereg andit ha t’l shteh
Kemegwazu bizat bayzlm akalh aqfoh eskireka
Endemn liqrebh kemelkam abat felet leljnet manes yasafral leka
Enji #nafqeኸgnal

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 14
Besmh mesk lay agit’o metades
Bemsganah wibet zelalem meqedes
Bedesta weyn fit behaset mewagnet
Kesekam eqfh bekbr megegnet

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 15
Enji #nafqeኸgnal
Bech’elema qusl yebcha alem musho mideredr ene
Bichegregn enji lik alba fiqrhn yemeshekem wene
Enjima enkwans endene lale nebs

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 16
Berkuset beresha simhn tet’emto
Lekbrh misgana kemeqdes yaderes
Mech yit’egbal t’erto
Mets’ts’nanate hoy

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 17
Yeljnet liben tiebit askobllot kemenged biqerm
Ante gin ante neh fiqrh ayqeyerm
Belet tenkeratew kegefahut beret befqr yet’erugn
Kets’ets’ete gezfew memar yechekolut aynochh seberugn

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 18
Begefahut liket bet’efahut met’en eyeteketele
Laytewegnn fiqr layresagnn sist keegrochh tesale
Bezih hulu met’en megonbes libhn yaladenedenew
Bezih hulu liket megefat kibrhn yaltefetatenew

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas

VERSE 19
Bezizh hulu silet mefeleg tesfahn yalamenemenew
Zarem keberafe amneh mitankwakwagn
Endet #btwedegn #new

CHORUS
Atleyegnm #wey
Nafqot bazalachew dej yet’enu t’atoch
Yebere meqanu serk biqereqer
Atzen Getaye kefche bitgebas'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nafkot', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Nahu Tefetseme (nahu-tefetseme-tsige)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ናሁ ተፈጸመ ተፈጸመ ናሁ
ማኀሌተ ጽጌ ሥሙር ተፈጸመ ናሁ /፪/

VERSE 1
አስምኪ ቦቱ አስምኪ ቦቱ
ንግሥተ ሰማያት /፪/',
      lyrics_transliteration = 'Nahu tefetseme tefetseme nahu
Mahlete tsige simur tefetseme nahu (×2)

VERSE 1
Asimki botu asimki botu
Nigistite semayat (×2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nahu-tefetseme-tsige'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናሁ ተፈጸመ ተፈጸመ ናሁ
ማኀሌተ ጽጌ ሥሙር ተፈጸመ ናሁ /፪/

VERSE 1
አስምኪ ቦቱ አስምኪ ቦቱ
ንግሥተ ሰማያት /፪/

CHORUS
ናሁ ተፈጸመ ተፈጸመ ናሁ
ማኀሌተ ጽጌ ሥሙር ተፈጸመ ናሁ /፪/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nahu tefetseme tefetseme nahu
Mahlete tsige simur tefetseme nahu (×2)

VERSE 1
Asimki botu asimki botu
Nigistite semayat (×2)

CHORUS
Nahu tefetseme tefetseme nahu
Mahlete tsige simur tefetseme nahu (×2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nahu-tefetseme-tsige', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Nahu Weteniku (nahu-weteniku)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 1
የምትለምን አንተን ድኅነት እንዲመጣ
ለኃጥእ ለጻድቅ ዘወትር በምትወጣ
ልመሰልህ ወደድኩ በፀሐይ ጸአዳ
ቀን የታየች ፀሐይ ማታ ትጠልቃለች

VERSE 2
የአንተ ልመና ግን ዘወትር ታሰምራለች
በነፍስ በሥጋ ዘወትር ስንቸገር
ፈጥነህ እየደረስክ ከክፉ የምትሰውር
መመኪያ ማረፊያ ተራዳኢ ነህና

VERSE 3
የድርቅ ወር ዝናም በሐሩርም ደመና
በምልጃህ ልጠለል ከዓለም ፈተና
በመልካም መዓዛ መቅደሱን በሚያውድ
ከቅዱሳን ጸሎት ተዋሕዶ በሚያርግ

VERSE 4
በንፁሕ ዕጣን አምሳል ልመስልህ ብወድ
የኃጢአትን ሽታ ከሰው የሚሳድድ
የምልጃህ ሽቱነት ሁሉን ስለሚያውድ
በማያልፈው ዓለም በክብር እንድኖር

VERSE 5
የቀድሞ በደሌ በፍርድ እንዳይታሰብ
በምሕረት እንዲያየኝ የፈጠረኛ አምላክ
በመጠራቴ ቀን በዚያች ጭንቅ ሰዓት
ለነፍሴ ዋስ ሆነህ በአምላክ ፊት ቁምላት

VERSE 6
ለሥጋችን ጽናት ዋስ ጠበቃ ለነፍስ
የምሕረት አማላጅ ሰማዕት ጊዮርጊስ
ለስምህም ዝክር ለክብርህ ስብሐት
ያቀረበችን ነፍስ ሆና በፍርሃት

VERSE 7
የመድኅን ልጁን በምልጃህ አስባት',
      lyrics_transliteration = 'Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 1
Yemtlemn anten dihnet endimet’a
Lehat’e lets’adq zewetr bemtwet’a
Limeselh wededku bets’ehey ts’eada
Qen yetayech ts’ehey mata tit’elqalech

VERSE 2
Yeante limena gin zewetr tasemralech
Benefs besga zewetr sincheger
Fet’neh eyederesk kekfu yemtsewr
Memekiya marefiya teradai nehna

VERSE 3
Yedrq wer zinam beherurm demena
Bemljah lit’elel kealem fetena
Bemelkam meaza meqdesun bemiyawd
Keqdusan ts’elot Tewahedo bemiyarg

VERSE 4
Bents’uh et’an amsal limeslh biwed
Yehat’iatn shta kesew yemisadd
Yemljah shtunet hulun silemiyawd
Bemayalfew alem bekbr endnor

VERSE 5
Yeqedmo bedele befrd endaytaseb
Bemhret endiyayegn yefet’eregna amlak
Bemet’erate qen beziyach ch’nq seat
Lenefse was honeh beamlak fit qumlat

VERSE 6
Lesgachn ts’nat was t’ebeqa lenefs
Yemhret amalaj semaet Giyorgis
Lesmhm zikr lekbrh sibhet
Yaqerebechn nefs hona befrhat

VERSE 7
Yemedhn lijun bemljah asbat',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nahu-weteniku'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 1
የምትለምን አንተን ድኅነት እንዲመጣ
ለኃጥእ ለጻድቅ ዘወትር በምትወጣ
ልመሰልህ ወደድኩ በፀሐይ ጸአዳ
ቀን የታየች ፀሐይ ማታ ትጠልቃለች

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 2
የአንተ ልመና ግን ዘወትር ታሰምራለች
በነፍስ በሥጋ ዘወትር ስንቸገር
ፈጥነህ እየደረስክ ከክፉ የምትሰውር
መመኪያ ማረፊያ ተራዳኢ ነህና

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 3
የድርቅ ወር ዝናም በሐሩርም ደመና
በምልጃህ ልጠለል ከዓለም ፈተና
በመልካም መዓዛ መቅደሱን በሚያውድ
ከቅዱሳን ጸሎት ተዋሕዶ በሚያርግ

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 4
በንፁሕ ዕጣን አምሳል ልመስልህ ብወድ
የኃጢአትን ሽታ ከሰው የሚሳድድ
የምልጃህ ሽቱነት ሁሉን ስለሚያውድ
በማያልፈው ዓለም በክብር እንድኖር

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 5
የቀድሞ በደሌ በፍርድ እንዳይታሰብ
በምሕረት እንዲያየኝ የፈጠረኛ አምላክ
በመጠራቴ ቀን በዚያች ጭንቅ ሰዓት
ለነፍሴ ዋስ ሆነህ በአምላክ ፊት ቁምላት

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 6
ለሥጋችን ጽናት ዋስ ጠበቃ ለነፍስ
የምሕረት አማላጅ ሰማዕት ጊዮርጊስ
ለስምህም ዝክር ለክብርህ ስብሐት
ያቀረበችን ነፍስ ሆና በፍርሃት

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ

VERSE 7
የመድኅን ልጁን በምልጃህ አስባት

CHORUS
ናሁ ወጠንኩ ዝክረ ውዳሴከ
ባሕቱ ምንተኑ እሰምየከ
ምንት ዉእቱ አምሳሊከ
ጊዮርጊስ እግዚአብሔር ዘኀ ረየከ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 1
Yemtlemn anten dihnet endimet’a
Lehat’e lets’adq zewetr bemtwet’a
Limeselh wededku bets’ehey ts’eada
Qen yetayech ts’ehey mata tit’elqalech

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 2
Yeante limena gin zewetr tasemralech
Benefs besga zewetr sincheger
Fet’neh eyederesk kekfu yemtsewr
Memekiya marefiya teradai nehna

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 3
Yedrq wer zinam beherurm demena
Bemljah lit’elel kealem fetena
Bemelkam meaza meqdesun bemiyawd
Keqdusan ts’elot Tewahedo bemiyarg

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 4
Bents’uh et’an amsal limeslh biwed
Yehat’iatn shta kesew yemisadd
Yemljah shtunet hulun silemiyawd
Bemayalfew alem bekbr endnor

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 5
Yeqedmo bedele befrd endaytaseb
Bemhret endiyayegn yefet’eregna amlak
Bemet’erate qen beziyach ch’nq seat
Lenefse was honeh beamlak fit qumlat

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 6
Lesgachn ts’nat was t’ebeqa lenefs
Yemhret amalaj semaet Giyorgis
Lesmhm zikr lekbrh sibhet
Yaqerebechn nefs hona befrhat

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke

VERSE 7
Yemedhn lijun bemljah asbat

CHORUS
Nahu wet’enku zikre widaseke
Bahtu mintenu esemyeke
Mint wuetu amsalike
Giyorgis Egziabher zehe reyeke'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nahu-weteniku', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Nana Amanu’el (nana-amanuel-mpotvgb3kcq)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 1
ፊትህ የተመላ አማኑኤል
ሁሌ በይቅርታ አማኑኤል
ካለው ፍቅር በላይ አማኑኤል
አባት ለአንድ ልጁ አማኑኤል

VERSE 2
አምላክ ይወደናል አማኑኤል
አይጥለንም ከእጁ አማኑኤል
አዝ▸▸▸▸▸▸▸▸▸▸►
መድኃኒቴ ልበል አማኑኤል

VERSE 3
ድኛለው በሞትህ አማኑኤል
ቁስሌ ተፈውሷል አማኑኤል
በቁስልህ በሞትህ አማኑኤል
ስሸጥህ አቀፍከኝ አማኑኤል

VERSE 4
ስወጋህ አይኔ በራ አማኑኤል
በፍቅርህ አወጣኸኝ አማኑኤል
ከዚያ ከመከራ አማኑኤል
አዝ▸▸▸▸▸▸▸▸▸▸►

VERSE 5
አንተ ከኔ ጋር ነህ አማኑኤል
አዎ ከኔ ጋራ አማኑኤል
ድል አርገህልኛል አማኑኤል
የጭንቄን ተራራ አማኑኤል

VERSE 6
በጉባኤ መኃል አማኑኤል
አፌ አንተን አወጀ አማኑኤል
የከበረ ደምህ አማኑኤል
ነፍሴን ስለዋጀ አማኑኤል

VERSE 7
አዝ▸▸▸▸▸▸▸▸▸▸►
የድንግሏ ፍሬ አማኑኤል
የብላቴናዋ አማኑኤል
የቤቴ ምሰሶ አማኑኤል

VERSE 8
የነፍሴ ቤዛዋ አማኑኤል
መሰሬቴ አንተ ነህ አማኑኤል
ያሳደገኝ እጅህ አማኑኤል
አተወኝም አንተ አማኑኤል

VERSE 9
ስለሆንኩኝ ልጅህ አማኑኤል',
      lyrics_transliteration = 'Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 1
Fith yetemela Amanuel
Hule beyqrta Amanuel
Kalew fiqr belay Amanuel
Abat leand liju Amanuel

VERSE 2
Amlak yiwedenal Amanuel
Ayt’lenm keeju Amanuel
Medhanite libel Amanuel

VERSE 3
Dignalew bemoth Amanuel
Qusle tefewswal Amanuel
Bequslh bemoth Amanuel
Sishet’h aqefkegn Amanuel

VERSE 4
Siwegah ayne bera Amanuel
Befqrh awet’aኸgn Amanuel
Keziya kemekera Amanuel

VERSE 5
Ante kene gar neh Amanuel
Awo kene gara Amanuel
Dil argehlgnal Amanuel
Yech’nqen terara Amanuel

VERSE 6
Begubae mehal Amanuel
Afe anten aweje Amanuel
Yekebere demh Amanuel
Nefsen silewaje Amanuel

VERSE 7
Yednglwa fire Amanuel
Yeblatenawa Amanuel
Yebete miseso Amanuel

VERSE 8
Yenefse bezawa Amanuel
Meserete ante neh Amanuel
Yasadegegn ejh Amanuel
Atewegnm ante Amanuel

VERSE 9
Silehonkugn lijh Amanuel',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nana-amanuel-mpotvgb3kcq'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 1
ፊትህ የተመላ አማኑኤል
ሁሌ በይቅርታ አማኑኤል
ካለው ፍቅር በላይ አማኑኤል
አባት ለአንድ ልጁ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 2
አምላክ ይወደናል አማኑኤል
አይጥለንም ከእጁ አማኑኤል
አዝ▸▸▸▸▸▸▸▸▸▸►
መድኃኒቴ ልበል አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 3
ድኛለው በሞትህ አማኑኤል
ቁስሌ ተፈውሷል አማኑኤል
በቁስልህ በሞትህ አማኑኤል
ስሸጥህ አቀፍከኝ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 4
ስወጋህ አይኔ በራ አማኑኤል
በፍቅርህ አወጣኸኝ አማኑኤል
ከዚያ ከመከራ አማኑኤል
አዝ▸▸▸▸▸▸▸▸▸▸►

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 5
አንተ ከኔ ጋር ነህ አማኑኤል
አዎ ከኔ ጋራ አማኑኤል
ድል አርገህልኛል አማኑኤል
የጭንቄን ተራራ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 6
በጉባኤ መኃል አማኑኤል
አፌ አንተን አወጀ አማኑኤል
የከበረ ደምህ አማኑኤል
ነፍሴን ስለዋጀ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 7
አዝ▸▸▸▸▸▸▸▸▸▸►
የድንግሏ ፍሬ አማኑኤል
የብላቴናዋ አማኑኤል
የቤቴ ምሰሶ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 8
የነፍሴ ቤዛዋ አማኑኤል
መሰሬቴ አንተ ነህ አማኑኤል
ያሳደገኝ እጅህ አማኑኤል
አተወኝም አንተ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል

VERSE 9
ስለሆንኩኝ ልጅህ አማኑኤል

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ ፪
የምሕረት አባት አማኑኤል
የቸርነት ጌታ አማኑኤል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 1
Fith yetemela Amanuel
Hule beyqrta Amanuel
Kalew fiqr belay Amanuel
Abat leand liju Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 2
Amlak yiwedenal Amanuel
Ayt’lenm keeju Amanuel
CHORUS
Medhanite libel Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 3
Dignalew bemoth Amanuel
Qusle tefewswal Amanuel
Bequslh bemoth Amanuel
Sishet’h aqefkegn Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 4
Siwegah ayne bera Amanuel
Befqrh awet’aኸgn Amanuel
Keziya kemekera Amanuel
CHORUS

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 5
Ante kene gar neh Amanuel
Awo kene gara Amanuel
Dil argehlgnal Amanuel
Yech’nqen terara Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 6
Begubae mehal Amanuel
Afe anten aweje Amanuel
Yekebere demh Amanuel
Nefsen silewaje Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 7
CHORUS
Yednglwa fire Amanuel
Yeblatenawa Amanuel
Yebete miseso Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 8
Yenefse bezawa Amanuel
Meserete ante neh Amanuel
Yasadegegn ejh Amanuel
Atewegnm ante Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel

VERSE 9
Silehonkugn lijh Amanuel

CHORUS
Nana Amanuel na medhanite
Fiqrhn albsegn yiqr meraqote 2
Yemhret abat Amanuel
Yechernet Geta Amanuel'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nana-amanuel-mpotvgb3kcq', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Nana Amanuel Na Medhanite (nana-amanuel-na-medhanite)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 1
ፊትህ የተመላ " "
ሁሌ ለይቅርታ " "
ካለው ፍቅር በላይ " "
አባት ለአንድ ልጁ " "

VERSE 2
አምላክ ይወደናል " "
አይጥለንም ከጁ " "

VERSE 3
መድኃኒቴ ልበል አማኑኤል
ድኛለው በሞትህ " "
ቁስሌ ተፈውሷል " "
በቁስልህ በሞትህ " "

VERSE 4
ስሸጥህ አቀፍከኝ " "
ስወጋህ አይኔ በራ " "
በፍቅርህ አወጣኸኝ " "
ከዚያ ከመከራ " "

VERSE 5
አንተ ከኔ ጋር ነህ አማኑኤል
አዎ ከኔ ጋራ " "
ድል አርገህልኛል " "
የጭንቄን ተራራ " "

VERSE 6
በጉባኤ መሃል " "
አፌ አንተን አወጀ “ ”
ለከከበረ ደምህ " "
ነብሴን ስላወጀ " "

VERSE 7
የድንግሏ ፍሬ አማኑኤል
የብላቴናዋ " "
የቤቴ ምሶሶ " "
የነብሴ ቤዛዋ " "

VERSE 8
መሰረቴ አንተ ነህ " "
ያሳደገኝ እጅህ " "
አተወኝም አንተ " "
ስለሆንኩኝ ልጅህ',
      lyrics_transliteration = 'Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 1
Fith yetemela " "
Hule leyqrta " "
Kalew fiqr belay " "
Abat leand liju " "

VERSE 2
Amlak yiwedenal " "
Ayt’lenm keju " "

VERSE 3
Medhanite libel Amanuel
Dignalew bemoth " "
Qusle tefewswal " "
Bequslh bemoth " "

VERSE 4
Sishet’h aqefkegn " "
Siwegah ayne bera " "
Befqrh awet’aኸgn " "
Keziya kemekera " "

VERSE 5
Ante kene gar neh Amanuel
Awo kene gara " "
Dil argehlgnal " "
Yech’nqen terara " "

VERSE 6
Begubae mehal " "
Afe anten aweje “ ”
Lekekebere demh " "
Nebsen silaweje " "

VERSE 7
Yednglwa fire Amanuel
Yeblatenawa " "
Yebete misoso " "
Yenebse bezawa " "

VERSE 8
Meserete ante neh " "
Yasadegegn ejh " "
Atewegnm ante " "
Silehonkugn lijh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nana-amanuel-na-medhanite'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 1
ፊትህ የተመላ " "
ሁሌ ለይቅርታ " "
ካለው ፍቅር በላይ " "
አባት ለአንድ ልጁ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 2
አምላክ ይወደናል " "
አይጥለንም ከጁ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 3
መድኃኒቴ ልበል አማኑኤል
ድኛለው በሞትህ " "
ቁስሌ ተፈውሷል " "
በቁስልህ በሞትህ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 4
ስሸጥህ አቀፍከኝ " "
ስወጋህ አይኔ በራ " "
በፍቅርህ አወጣኸኝ " "
ከዚያ ከመከራ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 5
አንተ ከኔ ጋር ነህ አማኑኤል
አዎ ከኔ ጋራ " "
ድል አርገህልኛል " "
የጭንቄን ተራራ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 6
በጉባኤ መሃል " "
አፌ አንተን አወጀ “ ”
ለከከበረ ደምህ " "
ነብሴን ስላወጀ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 7
የድንግሏ ፍሬ አማኑኤል
የብላቴናዋ " "
የቤቴ ምሶሶ " "
የነብሴ ቤዛዋ " "

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "

VERSE 8
መሰረቴ አንተ ነህ " "
ያሳደገኝ እጅህ " "
አተወኝም አንተ " "
ስለሆንኩኝ ልጅህ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሠኝ ይቅር መራቆቴ/፪/
የምህረት አባት አማኑኤል
የቸርነት ጌታ " "'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 1
Fith yetemela " "
Hule leyqrta " "
Kalew fiqr belay " "
Abat leand liju " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 2
Amlak yiwedenal " "
Ayt’lenm keju " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 3
Medhanite libel Amanuel
Dignalew bemoth " "
Qusle tefewswal " "
Bequslh bemoth " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 4
Sishet’h aqefkegn " "
Siwegah ayne bera " "
Befqrh awet’aኸgn " "
Keziya kemekera " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 5
Ante kene gar neh Amanuel
Awo kene gara " "
Dil argehlgnal " "
Yech’nqen terara " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 6
Begubae mehal " "
Afe anten aweje “ ”
Lekekebere demh " "
Nebsen silaweje " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 7
Yednglwa fire Amanuel
Yeblatenawa " "
Yebete misoso " "
Yenebse bezawa " "

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "

VERSE 8
Meserete ante neh " "
Yasadegegn ejh " "
Atewegnm ante " "
Silehonkugn lijh

CHORUS
Nana Amanuel na medhanite
Ts’dqhn albsegn yiqr meraqote (2)
Yemhret abat Amanuel
Yechernet Geta " "'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nana-amanuel-na-medhanite', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Nana Amanu’el (nana-ammanuel)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 1
የምሕረት አባት አማኑኤል
የቸርነት ጌታ
ፊትህ የተመላ
ሁሌ በይቅርታ

VERSE 2
ካለው ፍቅር በላይ
አባት ለአንድ ልጁ
አምላክ ይወደናል
አይጥለንም ከእጁ

VERSE 3
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 4
መድኃኒቴ ልበል አማኑኤል
ድኛለው በሞትህ
ቁስሌ ተፈውሷል
በቁስልህ በሞትህ

VERSE 5
ስሸጥህ አቀፍከኝ
ስወጋህ አይኔ በራ
በፍቅርህ አወጣኽኝ
ከዚያ ከመከራ

VERSE 6
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 7
አንተ ከኔ ጋር ነህ አማኑኤል
አዎ ከኔ ጋራ
ድል አርገህልኛል
የጭንቄን ተራራ

VERSE 8
በጉባኤ መሀል
አፌ አንተን አወጀ
የከበረ ደምህ
ነፍሴን ስለዋጀ

VERSE 9
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 10
የድንግሏ ፍሬ አማኑኤል
የበላቴናዋ
የቤቴ ምሰሶ
የነፍሴ ቤዛዋ

VERSE 11
መሠረቴ አንተ ነህ
ያሳደገኝ እጅህ
አትተወኝም አንተ
ስለሆንኩኝ ልጅህ

VERSE 12
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/',
      lyrics_transliteration = 'Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 1
Ye’mihiret abat Amanu’el
Ye’chernet geta
Fitih yetemela
Hule beyiqirta

VERSE 2
Kalew fiqir belay
Abat le’and liju
Amlak yiwedenal
Ayitilenem ke’eju

VERSE 3
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 4
Medihanité libel Amanu’el
Denyalew be’motih
Quslé tefewusal
Be’quslih be’motih

VERSE 5
Seshetih aqefkeny
Sewegah ayne bera
Be’fiqrih awetaqeny
Ke’ziya ke’mekera

VERSE 6
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 7
Ante ke’ne gar neh Amanu’el
Awo ke’ne gara
Dil argehilñal
Ye’chinqen terara

VERSE 8
Be’guba’e mehal
Afe anten awaje
Ye’kebera demih
Nefsen selawaje

VERSE 9
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 10
Ye’dingela fre Amanu’el
Ye’belatenawa
Ye’bete mesaso
Ye’nefse beza’wa

VERSE 11
Mesarete ante neh
Yasadageny ejih
Atewenyem ante
Selehonkugn lijih

VERSE 12
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nana-ammanuel'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 1
የምሕረት አባት አማኑኤል
የቸርነት ጌታ
ፊትህ የተመላ
ሁሌ በይቅርታ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 2
ካለው ፍቅር በላይ
አባት ለአንድ ልጁ
አምላክ ይወደናል
አይጥለንም ከእጁ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 3
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 4
መድኃኒቴ ልበል አማኑኤል
ድኛለው በሞትህ
ቁስሌ ተፈውሷል
በቁስልህ በሞትህ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 5
ስሸጥህ አቀፍከኝ
ስወጋህ አይኔ በራ
በፍቅርህ አወጣኽኝ
ከዚያ ከመከራ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 6
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 7
አንተ ከኔ ጋር ነህ አማኑኤል
አዎ ከኔ ጋራ
ድል አርገህልኛል
የጭንቄን ተራራ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 8
በጉባኤ መሀል
አፌ አንተን አወጀ
የከበረ ደምህ
ነፍሴን ስለዋጀ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 9
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 10
የድንግሏ ፍሬ አማኑኤል
የበላቴናዋ
የቤቴ ምሰሶ
የነፍሴ ቤዛዋ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 11
መሠረቴ አንተ ነህ
ያሳደገኝ እጅህ
አትተወኝም አንተ
ስለሆንኩኝ ልጅህ

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

VERSE 12
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/

CHORUS
ናና አማኑኤል ና መድኃኒቴ
ጽድቅህን አልብሰኝ ይቅር መራቆቴ /2/
ናና አማኑኤል ና መድኀኒቴ
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 1
Ye’mihiret abat Amanu’el
Ye’chernet geta
Fitih yetemela
Hule beyiqirta

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 2
Kalew fiqir belay
Abat le’and liju
Amlak yiwedenal
Ayitilenem ke’eju

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 3
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 4
Medihanité libel Amanu’el
Denyalew be’motih
Quslé tefewusal
Be’quslih be’motih

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 5
Seshetih aqefkeny
Sewegah ayne bera
Be’fiqrih awetaqeny
Ke’ziya ke’mekera

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 6
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 7
Ante ke’ne gar neh Amanu’el
Awo ke’ne gara
Dil argehilñal
Ye’chinqen terara

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 8
Be’guba’e mehal
Afe anten awaje
Ye’kebera demih
Nefsen selawaje

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 9
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 10
Ye’dingela fre Amanu’el
Ye’belatenawa
Ye’bete mesaso
Ye’nefse beza’wa

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 11
Mesarete ante neh
Yasadageny ejih
Atewenyem ante
Selehonkugn lijih

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

VERSE 12
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)

CHORUS
Nana Amanu’el na medihanité
tsidkihin albseny yiqir meraqoté (x2)
Nana Amanu’el na medihanité
fiqrihin albseny yiqir meraqoté (x2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nana-ammanuel', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Nana yemesegana gieta (nana-yemesegana-gieta)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 1
ኢየሩሳሌም ሆይ
ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ
ሰላምሽ ታውጇል መዳንሽም ቀርቧል

VERSE 2
ጌታ ሊጎበኝሽ ከበራፍሽ ቆሟል
ያልታደልሽው ሀገር
ጌርጌስዮን ሆይ
ለምን ተቃወምሽው አምላክሽን ስታዪው

VERSE 3
የከተማውን በር መዝጊያውን ቆልፈሽ
ከሩቅ የሸኘሽው ሲመጣ ሰላምሽ
የቢታንያ ድንጋይ አንደበት አውጣቶ
ምስጋና ጀመረ አምላኩን ለይቶ

VERSE 4
ሣርና ቅጠሉ ዘንባባው ሰገደ
ፍጥረት ሊያመሰግን አምላኩን ወደደ
ሕፃን ሽማግሌው ምስጋና ሲያቀርቡ
ተቆልፎ ነበር ፈሪሳዊ ልቡ

VERSE 5
ዛሬም ለምስጋና ልባችን ይለወጥ
ሆሳዕና ጌታ ይመላለስበት',
      lyrics_transliteration = 'Nana yemsgana Geta
Nana yemhret Geta
Madanh tegegntalechna
Selamh tegegntalechna

VERSE 1
Iyerusalem hoy
Misgana jemri
Meleketn nifi negarit gosmi
Selamsh tawjwal medanshm qerbwal

VERSE 2
Geta ligobegnsh keberafsh qomwal
Yaltadelshw heger
Gergesyon hoy
Lemn teqawemshw amlakshn sitayiw

VERSE 3
Yeketemawn ber mezgiyawn qolfesh
Keruq yeshegneshw simet’a selamsh
Yebitanya dingay andebet awt’ato
Misgana jemere amlakun leyto

VERSE 4
Sarna qit’elu zenbabaw segede
Fit’ret liyamesegn amlakun wedede
Hits’an shmaglew misgana siyaqerbu
Teqolfo neber ferisawi libu

VERSE 5
Zarem lemsgana libachn yilewet’
Hosaena Geta yimelalesbet',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nana-yemesegana-gieta'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 1
ኢየሩሳሌም ሆይ
ምስጋና ጀምሪ
መለከትን ንፊ ነጋሪት ጎስሚ
ሰላምሽ ታውጇል መዳንሽም ቀርቧል

CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 2
ጌታ ሊጎበኝሽ ከበራፍሽ ቆሟል
ያልታደልሽው ሀገር
ጌርጌስዮን ሆይ
ለምን ተቃወምሽው አምላክሽን ስታዪው

CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 3
የከተማውን በር መዝጊያውን ቆልፈሽ
ከሩቅ የሸኘሽው ሲመጣ ሰላምሽ
የቢታንያ ድንጋይ አንደበት አውጣቶ
ምስጋና ጀመረ አምላኩን ለይቶ

CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 4
ሣርና ቅጠሉ ዘንባባው ሰገደ
ፍጥረት ሊያመሰግን አምላኩን ወደደ
ሕፃን ሽማግሌው ምስጋና ሲያቀርቡ
ተቆልፎ ነበር ፈሪሳዊ ልቡ

CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና

VERSE 5
ዛሬም ለምስጋና ልባችን ይለወጥ
ሆሳዕና ጌታ ይመላለስበት

CHORUS
ናና የምስጋና ጌታ
ናና የምሕረት ጌታ
ማዳንህ ተገኝታለችና
ሰላምህ ተገኝታለችና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nana yemsgana Geta
Nana yemhret Geta
Madanh tegegntalechna
Selamh tegegntalechna

VERSE 1
Iyerusalem hoy
Misgana jemri
Meleketn nifi negarit gosmi
Selamsh tawjwal medanshm qerbwal

CHORUS
Nana yemsgana Geta
Nana yemhret Geta
Madanh tegegntalechna
Selamh tegegntalechna

VERSE 2
Geta ligobegnsh keberafsh qomwal
Yaltadelshw heger
Gergesyon hoy
Lemn teqawemshw amlakshn sitayiw

CHORUS
Nana yemsgana Geta
Nana yemhret Geta
Madanh tegegntalechna
Selamh tegegntalechna

VERSE 3
Yeketemawn ber mezgiyawn qolfesh
Keruq yeshegneshw simet’a selamsh
Yebitanya dingay andebet awt’ato
Misgana jemere amlakun leyto

CHORUS
Nana yemsgana Geta
Nana yemhret Geta
Madanh tegegntalechna
Selamh tegegntalechna

VERSE 4
Sarna qit’elu zenbabaw segede
Fit’ret liyamesegn amlakun wedede
Hits’an shmaglew misgana siyaqerbu
Teqolfo neber ferisawi libu

CHORUS
Nana yemsgana Geta
Nana yemhret Geta
Madanh tegegntalechna
Selamh tegegntalechna

VERSE 5
Zarem lemsgana libachn yilewet’
Hosaena Geta yimelalesbet

CHORUS
Nana yemsgana Geta
Nana yemhret Geta
Madanh tegegntalechna
Selamh tegegntalechna'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nana-yemesegana-gieta', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Natanem Negn (natanem-negn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 1
ከነገደ ሌዊ ባልሆንም
ባልሾምም እንደ አሮን
የዜማ ጣም ባልይዝ በገና
ላመስግንህ በትህትና

VERSE 2
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደዋጋ
አከበርከኝ ባንተ ፀጋ

VERSE 3
ከእረኝነት ከታናሽ ስፍራ
ለንግስና ምንም ብጠራ
ከቀንዲሉ ቀርቧል ሀሳቤ
ብቀኝልህ ተነጥፎ ልቤ

VERSE 4
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደዋጋ
አከበርከኝ ባንተ ዋጋ

VERSE 5
ሳይከብድብኝ የአለም ዝና
ተንበርክኬ ልስጥህ ምስጋና
ምክንያት አለኝ ለማዘንበሌ
ናታኒም ነኝ ይቺ ናት ቃሌ

VERSE 6
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደዋጋ
አከበርከኝ ባንተ ፀጋ

VERSE 7
እንኳን ልቆም በፍታ ለብሼ
አፍርሀለሁ እኔ አጎንብሼ
የትምክህት ካባዬን ጥዬ
ከመቅደስህ ልግባ ጌታዬ

VERSE 8
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደ ዋጋ
አከበርከኝ ባንተ ፀጋ',
      lyrics_transliteration = 'Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 1
Kenegede lewi balhonm
Balshomm ende aron
Yezema t’am balyz begena
Lamesgnh bethtna

VERSE 2
Dej hogne kante ber
Tesfa adrge sizemr
Qot’rehlgn endewaga
Akeberkegn bante ts’ega

VERSE 3
Keeregnnet ketanash sifra
Lengsna minm bit’era
Keqendilu qerbwal hesabe
Biqegnlh tenet’fo libe

VERSE 4
Dej hogne kante ber
Tesfa adrge sizemr
Qot’rehlgn endewaga
Akeberkegn bante waga

VERSE 5
Saykebdbgn yealem zina
Tenberkke list’h misgana
Miknyat alegn lemazenbele
Natanim negn yichi nat qale

VERSE 6
Dej hogne kante ber
Tesfa adrge sizemr
Qot’rehlgn endewaga
Akeberkegn bante ts’ega

VERSE 7
Enkwan liqom befta lebshe
Afrhelehu ene agonbshe
Yetmkht kabayen t’ye
Kemeqdesh ligba Getaye

VERSE 8
Dej hogne kante ber
Tesfa adrge sizemr
Qot’rehlgn ende waga
Akeberkegn bante ts’ega',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'natanem-negn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 1
ከነገደ ሌዊ ባልሆንም
ባልሾምም እንደ አሮን
የዜማ ጣም ባልይዝ በገና
ላመስግንህ በትህትና

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 2
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደዋጋ
አከበርከኝ ባንተ ፀጋ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 3
ከእረኝነት ከታናሽ ስፍራ
ለንግስና ምንም ብጠራ
ከቀንዲሉ ቀርቧል ሀሳቤ
ብቀኝልህ ተነጥፎ ልቤ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 4
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደዋጋ
አከበርከኝ ባንተ ዋጋ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 5
ሳይከብድብኝ የአለም ዝና
ተንበርክኬ ልስጥህ ምስጋና
ምክንያት አለኝ ለማዘንበሌ
ናታኒም ነኝ ይቺ ናት ቃሌ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 6
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደዋጋ
አከበርከኝ ባንተ ፀጋ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 7
እንኳን ልቆም በፍታ ለብሼ
አፍርሀለሁ እኔ አጎንብሼ
የትምክህት ካባዬን ጥዬ
ከመቅደስህ ልግባ ጌታዬ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/

VERSE 8
ደጅ ሆኜ ካንተ በር
ተስፋ አድርጌ ስዘምር
ቆጥረህልኝ እንደ ዋጋ
አከበርከኝ ባንተ ፀጋ

CHORUS
ናታኒም ነኝ በአገልግሎቴ
አይከፋኝም ታናሽነቴ
እጠርጋለሁ ደጅህን ጌታ
ዝቅ ብዬ ላንተ ውለታ/2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 1
Kenegede lewi balhonm
Balshomm ende aron
Yezema t’am balyz begena
Lamesgnh bethtna

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 2
Dej hogne kante ber
Tesfa adrge sizemr
Qot’rehlgn endewaga
Akeberkegn bante ts’ega

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 3
Keeregnnet ketanash sifra
Lengsna minm bit’era
Keqendilu qerbwal hesabe
Biqegnlh tenet’fo libe

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 4
Dej hogne kante ber
Tesfa adrge sizemr
Qot’rehlgn endewaga
Akeberkegn bante waga

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 5
Saykebdbgn yealem zina
Tenberkke list’h misgana
Miknyat alegn lemazenbele
Natanim negn yichi nat qale

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 6
Dej hogne kante ber
Tesfa adrge sizemr
Qot’rehlgn endewaga
Akeberkegn bante ts’ega

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 7
Enkwan liqom befta lebshe
Afrhelehu ene agonbshe
Yetmkht kabayen t’ye
Kemeqdesh ligba Getaye

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)

VERSE 8
Dej hogne kante ber
Tesfa adrge sizemr
Qot’rehlgn ende waga
Akeberkegn bante ts’ega

CHORUS
Natanim negn beagelglote
Aykefagnm tanashnete
Et’ergalehu dejhn Geta
Ziq biye lante wileta (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'natanem-negn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Nation of The Cross (nation-of-the-cross)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'We are the nation of the cross
Our home is built in the heavens (Philippians 3:20)
We love Christ by choice not by force
Our message will be forgiveness

VERSE 1
As it is written for His sake we’re killed all day long (Romans 8:36)
And we desire to live with Him where we belong
If Christ is magnified in our death then let it be
For He''s the one who died on the cross and set us free

VERSE 2
We fear not those who kill the body but not the soul (Matthew 10:28)
But we fear God, He who can destroy both inside hell
When we live on this earth we know that we will suffer (John 16:33)
But Jesus overcame this world so we will cheer.

VERSE 3
The gates of hell shall not prevail against our nation (Matthew 16:18)
It’s built upon the faith of rock that stays unshaken
We are not strange to witness the life of martyrdom
We know that God will honor their blood in His kingdom',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nation-of-the-cross'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
We are the nation of the cross
Our home is built in the heavens (Philippians 3:20)
We love Christ by choice not by force
Our message will be forgiveness

VERSE 1
As it is written for His sake we’re killed all day long (Romans 8:36)
And we desire to live with Him where we belong
If Christ is magnified in our death then let it be
For He''s the one who died on the cross and set us free

CHORUS
We are the nation of the cross
Our home is built in the heavens (Philippians 3:20)
We love Christ by choice not by force
Our message will be forgiveness

VERSE 2
We fear not those who kill the body but not the soul (Matthew 10:28)
But we fear God, He who can destroy both inside hell
When we live on this earth we know that we will suffer (John 16:33)
But Jesus overcame this world so we will cheer.

CHORUS
We are the nation of the cross
Our home is built in the heavens (Philippians 3:20)
We love Christ by choice not by force
Our message will be forgiveness

VERSE 3
The gates of hell shall not prevail against our nation (Matthew 16:18)
It’s built upon the faith of rock that stays unshaken
We are not strange to witness the life of martyrdom
We know that God will honor their blood in His kingdom

CHORUS
We are the nation of the cross
Our home is built in the heavens (Philippians 3:20)
We love Christ by choice not by force
Our message will be forgiveness'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nation-of-the-cross', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Natti Dumessus Samini Faarfattu Fasika Makonin Orthodox (natti-dumessus-samini-faarfattu-fasika-makonin-orthodox)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 1
Qileensaani kan hin dhaamne dungoon koo
Kiristoosi afuurri jireenyako
+++
Isatti of kennetan ba’aa

VERSE 2
Isatti hirkadheetan galaa
Egdu dhoksaa qaba naafu
Bara kootti anaan kan na egu
Anaaf ifakooti waaqayyooni

VERSE 3
Kan na sodaachisu Kan na naassisu enyu?
++++
Biyya ormaa ta’ee qofaakoo
Fira naaf ta’e abbaankoo

VERSE 4
Kiristoos anaf jirenyadhaa
Isatti of kennetan jiraadhaa
Kan sodhaadhu hin jiru barakootti
Ifa jireenyakoo anaaf waaqa kooti

VERSE 5
++++
Anaan hin kennu dinatti
Hin angomu duti narratti
Mara Kan na egu goftaadhaa

VERSE 6
Kan natti darbu dina kamidhaa
Dhigatu mullataa saanqaa manakooirratti
kan addan na baasu enyu waaqakoo irra
+++++

VERSE 7
Kunoo na dhaabe manasaa anan na ege afuurrisaa
Anan kabajuuf inni of kenne
Na bite goftaan du’a koo du’e
Maqaasaaf haa bitamu fonkoof afurkoo

VERSE 8
Isaan waan ta’efi yonaanis ga’unkoo',
      lyrics_transliteration = 'Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 1
Qileensaani kan hin dhaamne dungoon koo
Kiristoosi afuurri jireenyako
+++
Isatti of kennetan ba’aa

VERSE 2
Isatti hirkadheetan galaa
Egdu dhoksaa qaba naafu
Bara kootti anaan kan na egu
Anaaf ifakooti waaqayyooni

VERSE 3
Kan na sodaachisu Kan na naassisu enyu?
++++
Biyya ormaa ta’ee qofaakoo
Fira naaf ta’e abbaankoo

VERSE 4
Kiristoos anaf jirenyadhaa
Isatti of kennetan jiraadhaa
Kan sodhaadhu hin jiru barakootti
Ifa jireenyakoo anaaf waaqa kooti

VERSE 5
++++
Anaan hin kennu dinatti
Hin angomu duti narratti
Mara Kan na egu goftaadhaa

VERSE 6
Kan natti darbu dina kamidhaa
Dhigatu mullataa saanqaa manakooirratti
Kan addan na baasu enyu waaqakoo irra
+++++

VERSE 7
Kunoo na dhaabe manasaa anan na ege afuurrisaa
Anan kabajuuf inni of kenne
Na bite goftaan du’a koo du’e
Maqaasaaf haa bitamu fonkoof afurkoo

VERSE 8
Isaan waan ta’efi yonaanis ga’unkoo',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'natti-dumessus-samini-faarfattu-fasika-makonin-orthodox'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 1
Qileensaani kan hin dhaamne dungoon koo
Kiristoosi afuurri jireenyako
+++
Isatti of kennetan ba’aa

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 2
Isatti hirkadheetan galaa
Egdu dhoksaa qaba naafu
Bara kootti anaan kan na egu
Anaaf ifakooti waaqayyooni

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 3
Kan na sodaachisu Kan na naassisu enyu?
++++
Biyya ormaa ta’ee qofaakoo
Fira naaf ta’e abbaankoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 4
Kiristoos anaf jirenyadhaa
Isatti of kennetan jiraadhaa
Kan sodhaadhu hin jiru barakootti
Ifa jireenyakoo anaaf waaqa kooti

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 5
++++
Anaan hin kennu dinatti
Hin angomu duti narratti
Mara Kan na egu goftaadhaa

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 6
Kan natti darbu dina kamidhaa
Dhigatu mullataa saanqaa manakooirratti
kan addan na baasu enyu waaqakoo irra
+++++

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 7
Kunoo na dhaabe manasaa anan na ege afuurrisaa
Anan kabajuuf inni of kenne
Na bite goftaan du’a koo du’e
Maqaasaaf haa bitamu fonkoof afurkoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 8
Isaan waan ta’efi yonaanis ga’unkoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 1
Qileensaani kan hin dhaamne dungoon koo
Kiristoosi afuurri jireenyako
+++
Isatti of kennetan ba’aa

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 2
Isatti hirkadheetan galaa
Egdu dhoksaa qaba naafu
Bara kootti anaan kan na egu
Anaaf ifakooti waaqayyooni

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 3
Kan na sodaachisu Kan na naassisu enyu?
++++
Biyya ormaa ta’ee qofaakoo
Fira naaf ta’e abbaankoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 4
Kiristoos anaf jirenyadhaa
Isatti of kennetan jiraadhaa
Kan sodhaadhu hin jiru barakootti
Ifa jireenyakoo anaaf waaqa kooti

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 5
++++
Anaan hin kennu dinatti
Hin angomu duti narratti
Mara Kan na egu goftaadhaa

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 6
Kan natti darbu dina kamidhaa
Dhigatu mullataa saanqaa manakooirratti
Kan addan na baasu enyu waaqakoo irra
+++++

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 7
Kunoo na dhaabe manasaa anan na ege afuurrisaa
Anan kabajuuf inni of kenne
Na bite goftaan du’a koo du’e
Maqaasaaf haa bitamu fonkoof afurkoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako

VERSE 8
Isaan waan ta’efi yonaanis ga’unkoo

CHORUS
Natti dumessus samini
Natti dhittullee aduuni
Qileensaani kan hin dhaamne dungoon koo
Iyasusi afuurri jireenyako'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'natti-dumessus-samini-faarfattu-fasika-makonin-orthodox', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Nefise Hoy (nefise-hoy)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ነፍሴ ሆይ( 3) እግዚአብሔር ባረኪ
አጥንቶቼም ሁሉ( 3)
የተቀደስ ስሙ
በደስታ ዘምሪ በአዲስ ምስጋና

VERSE 1
ጽጥታና ሰላም አድሎሻልና
መሰንቆውን አንሺ ቅኔ ተቀኚለት
ለውጦሻልና በደስታ ዘይት
ነፍሴ ሆይ(3) እግዚአብሔር ባርኪ(3)

VERSE 2
አጥንቶቼም ሁሉ( 3)
የተቀደሰ ስሙ
ሀሴትን አድርጊ ነፍሴ ለእግዚአብሔርም
ይሰጥሻልና በክብር ላይ ክብር

VERSE 3
ደሴቶች ሲያወሩ በቅድስት መንፈስ
እየተወያዩ ስሉስ ቅዱስ
ነፍሴ ሆይ( 3)እግዚአብሔር ባርኪ',
      lyrics_transliteration = 'Nefse hoy (3) Egziabher bareki
At’ntochem hulu (3)
Yeteqedes simu
Bedesta zemri beadis misgana

VERSE 1
Ts’t’tana selam adloshalna
Mesenqown anshi qine teqegnilet
Lewt’oshalna bedesta zeyt
Nefse hoy (3) Egziabher barki (3)

VERSE 2
At’ntochem hulu (3)
Yeteqedese simu
Hesetn adrgi nefse leegziabherm
Yiset’shalna bekbr lay kibir

VERSE 3
Desetoch siyaweru beqdst menfes
Eyeteweyayu silus Kidus
Nefse hoy (3)Egziabher barki',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nefise-hoy'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ነፍሴ ሆይ( 3) እግዚአብሔር ባረኪ
አጥንቶቼም ሁሉ( 3)
የተቀደስ ስሙ
በደስታ ዘምሪ በአዲስ ምስጋና

VERSE 1
ጽጥታና ሰላም አድሎሻልና
መሰንቆውን አንሺ ቅኔ ተቀኚለት
ለውጦሻልና በደስታ ዘይት
ነፍሴ ሆይ(3) እግዚአብሔር ባርኪ(3)

CHORUS
ነፍሴ ሆይ( 3) እግዚአብሔር ባረኪ
አጥንቶቼም ሁሉ( 3)
የተቀደስ ስሙ
በደስታ ዘምሪ በአዲስ ምስጋና

VERSE 2
አጥንቶቼም ሁሉ( 3)
የተቀደሰ ስሙ
ሀሴትን አድርጊ ነፍሴ ለእግዚአብሔርም
ይሰጥሻልና በክብር ላይ ክብር

CHORUS
ነፍሴ ሆይ( 3) እግዚአብሔር ባረኪ
አጥንቶቼም ሁሉ( 3)
የተቀደስ ስሙ
በደስታ ዘምሪ በአዲስ ምስጋና

VERSE 3
ደሴቶች ሲያወሩ በቅድስት መንፈስ
እየተወያዩ ስሉስ ቅዱስ
ነፍሴ ሆይ( 3)እግዚአብሔር ባርኪ

CHORUS
ነፍሴ ሆይ( 3) እግዚአብሔር ባረኪ
አጥንቶቼም ሁሉ( 3)
የተቀደስ ስሙ
በደስታ ዘምሪ በአዲስ ምስጋና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nefse hoy (3) Egziabher bareki
At’ntochem hulu (3)
Yeteqedes simu
Bedesta zemri beadis misgana

VERSE 1
Ts’t’tana selam adloshalna
Mesenqown anshi qine teqegnilet
Lewt’oshalna bedesta zeyt
Nefse hoy (3) Egziabher barki (3)

CHORUS
Nefse hoy (3) Egziabher bareki
At’ntochem hulu (3)
Yeteqedes simu
Bedesta zemri beadis misgana

VERSE 2
At’ntochem hulu (3)
Yeteqedese simu
Hesetn adrgi nefse leegziabherm
Yiset’shalna bekbr lay kibir

CHORUS
Nefse hoy (3) Egziabher bareki
At’ntochem hulu (3)
Yeteqedes simu
Bedesta zemri beadis misgana

VERSE 3
Desetoch siyaweru beqdst menfes
Eyeteweyayu silus Kidus
Nefse hoy (3)Egziabher barki

CHORUS
Nefse hoy (3) Egziabher bareki
At’ntochem hulu (3)
Yeteqedes simu
Bedesta zemri beadis misgana'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nefise-hoy', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: NEW ETHIOPIA ORTHODOX TEWAHEDO MEZMUR BY,ZEMARIT KIDIST MITIKU"ENDE NECH INQU YEMIYABERA (new-ethiopia-orthodox-tewahedo-mezmur-by-zemarit-kidist-mitiku-ende-nech)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'የጽዮን ደጆች ቅኔ ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ
አርፈናል ስሟን ስንጠራ(2)

VERSE 1
ኃይልን ለሚያደርገው ለተወዳጅ ስምሽ
የዜማ እቃችንን አነሳን ልጆችሽ
ማህተመ ቡራኬሽ በልባችን አለ
አፋችን ማርያም ሲል ጭንቃችን ቀለለ

VERSE 2
የምስጋና ጥበብ የቅኔ ሃብት ፀጋ
ከደጃፍሽ መጥተን ገዛን ያለ ዋጋ
ጥልቁን ወጥተነዋል በትከሻሽ ሆነን
ፅዮንን በእልልታ በዜማ ሸፍነን

VERSE 3
ጠቢባን ምክራቸው ታየ ተሰውሮ
ምስጢር ተገለጠ በህፃናት አእምሮ
ቤተልሔም ሰማች የብስራቱን ዜማ
ፍቅር ተለቀመ ከእግዚአብሔር ከተማ

VERSE 4
ከአሸናፊው ልጅሽ ከክርስቶስ ጋራ
እንደ ዘበት ወጣን የሞትን ተራራ
ፍሬሽን ቀምሰነው ልቦናችን ረጋ
ሰላም ነው ከእንግዲህ አንኖርም ስንሰጋ',
      lyrics_transliteration = 'Yets’yon dejoch qine temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera
Arfenal simwan sint’era (2)

VERSE 1
Hayln lemiyadergew letewedaj simsh
Yezema eqachnn anesan lijochsh
Mahteme burakesh belbachn ale
Afachn Maryam sil ch’nqachn qelele

VERSE 2
Yemsgana t’beb yeqne habt ts’ega
Kedejafsh met’ten gezan yale waga
T’lqun wet’tenewal betkeshash honen
Ts’yonn beellta bezema shefnen

VERSE 3
T’ebiban mikrachew taye tesewro
Mist’ir tegelet’e behts’anat aemro
Betelhem semach yebsratun zema
Fiqr teleqeme keegziabher ketema

VERSE 4
Keashenafiw lijsh kekrstos gara
Ende zebet wet’an yemotn terara
Fireshn qemsenew libonachn rega
Selam new keengdih annorm sinsega',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'new-ethiopia-orthodox-tewahedo-mezmur-by-zemarit-kidist-mitiku-ende-nech'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የጽዮን ደጆች ቅኔ ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ
አርፈናል ስሟን ስንጠራ(2)

VERSE 1
ኃይልን ለሚያደርገው ለተወዳጅ ስምሽ
የዜማ እቃችንን አነሳን ልጆችሽ
ማህተመ ቡራኬሽ በልባችን አለ
አፋችን ማርያም ሲል ጭንቃችን ቀለለ

CHORUS
የጽዮን ደጆች ቅኔ ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ
አርፈናል ስሟን ስንጠራ(2)

VERSE 2
የምስጋና ጥበብ የቅኔ ሃብት ፀጋ
ከደጃፍሽ መጥተን ገዛን ያለ ዋጋ
ጥልቁን ወጥተነዋል በትከሻሽ ሆነን
ፅዮንን በእልልታ በዜማ ሸፍነን

CHORUS
የጽዮን ደጆች ቅኔ ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ
አርፈናል ስሟን ስንጠራ(2)

VERSE 3
ጠቢባን ምክራቸው ታየ ተሰውሮ
ምስጢር ተገለጠ በህፃናት አእምሮ
ቤተልሔም ሰማች የብስራቱን ዜማ
ፍቅር ተለቀመ ከእግዚአብሔር ከተማ

CHORUS
የጽዮን ደጆች ቅኔ ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ
አርፈናል ስሟን ስንጠራ(2)

VERSE 4
ከአሸናፊው ልጅሽ ከክርስቶስ ጋራ
እንደ ዘበት ወጣን የሞትን ተራራ
ፍሬሽን ቀምሰነው ልቦናችን ረጋ
ሰላም ነው ከእንግዲህ አንኖርም ስንሰጋ

CHORUS
የጽዮን ደጆች ቅኔ ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ
አርፈናል ስሟን ስንጠራ(2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yets’yon dejoch qine temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera
Arfenal simwan sint’era (2)

VERSE 1
Hayln lemiyadergew letewedaj simsh
Yezema eqachnn anesan lijochsh
Mahteme burakesh belbachn ale
Afachn Maryam sil ch’nqachn qelele

CHORUS
Yets’yon dejoch qine temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera
Arfenal simwan sint’era (2)

VERSE 2
Yemsgana t’beb yeqne habt ts’ega
Kedejafsh met’ten gezan yale waga
T’lqun wet’tenewal betkeshash honen
Ts’yonn beellta bezema shefnen

CHORUS
Yets’yon dejoch qine temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera
Arfenal simwan sint’era (2)

VERSE 3
T’ebiban mikrachew taye tesewro
Mist’ir tegelet’e behts’anat aemro
Betelhem semach yebsratun zema
Fiqr teleqeme keegziabher ketema

CHORUS
Yets’yon dejoch qine temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera
Arfenal simwan sint’era (2)

VERSE 4
Keashenafiw lijsh kekrstos gara
Ende zebet wet’an yemotn terara
Fireshn qemsenew libonachn rega
Selam new keengdih annorm sinsega

CHORUS
Yets’yon dejoch qine temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera
Arfenal simwan sint’era (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'new-ethiopia-orthodox-tewahedo-mezmur-by-zemarit-kidist-mitiku-ende-nech', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: NEW,ethiopia.orthodox Tewahedo Mezmur "KINE KEAFE FESESE" By Zemarit Kidist Mitiku (new-ethiopia-orthodox-tewahedo-mezmur-kine-keafe-fesese-by-zemarit-kidis)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ

VERSE 1
ህይወት በሞት ተደምድሞ
ሥጋ በነፍሴ ተሹሞ
ጠላት በሴራው ሳይጥለኝ
ድንግል ምልጃሽ ነው ያዳነኝ

VERSE 2
ነጋ ያ ክፋ ጨለማ
ጥልቁ ስምሽን ሲሰማ
መቼም ጠርቼሽ አላፍርም
ጸንቷል ኪዳንሽ ዘለዓለም

VERSE 3
ጎድሎ አያውቅም መዳፌ
ላንቺ ቅኔ ተሰልፌ
ትርፌ በረከቴ ነሽ
አምሳል ወደር የሌለሽ

VERSE 4
ዛሬ ሚያስፈራኝ የለም
ከቦኝ የልጅሽ ሰላም
ትምክህት ጋሻ ሆንሽኛል
ግርማሽ ዙሪያዬን ከቦኛል',
      lyrics_transliteration = 'Qine keafe fesese
Yanchin sim eyawedese
Maryam Maryam eyalkugn
Selfun bedl alefkugn

VERSE 1
Hiywet bemot tedemdmo
Siga benefse teshumo
T’elat beseraw sayt’legn
Dingil miljash new yadanegn

VERSE 2
Nega ya kifa ch’elema
T’lqu simshn sisema
Mechem t’erchesh alafrm
Ts’entwal kidansh zelealem

VERSE 3
Godlo ayawqm medafe
Lanchi qine teselfe
Tirfe berekete nesh
Amsal weder yelelesh

VERSE 4
Zare miyasferagn yelem
Kebogn yeljsh selam
Timkht gasha honshgnal
Girmash zuriyayen kebognal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'new-ethiopia-orthodox-tewahedo-mezmur-kine-keafe-fesese-by-zemarit-kidis'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ

VERSE 1
ህይወት በሞት ተደምድሞ
ሥጋ በነፍሴ ተሹሞ
ጠላት በሴራው ሳይጥለኝ
ድንግል ምልጃሽ ነው ያዳነኝ

CHORUS
ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ

VERSE 2
ነጋ ያ ክፋ ጨለማ
ጥልቁ ስምሽን ሲሰማ
መቼም ጠርቼሽ አላፍርም
ጸንቷል ኪዳንሽ ዘለዓለም

CHORUS
ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ

VERSE 3
ጎድሎ አያውቅም መዳፌ
ላንቺ ቅኔ ተሰልፌ
ትርፌ በረከቴ ነሽ
አምሳል ወደር የሌለሽ

CHORUS
ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ

VERSE 4
ዛሬ ሚያስፈራኝ የለም
ከቦኝ የልጅሽ ሰላም
ትምክህት ጋሻ ሆንሽኛል
ግርማሽ ዙሪያዬን ከቦኛል

CHORUS
ቅኔ ከአፌ ፈሰሰ
ያንቺን ስም እያወደሰ
ማርያም ማርያም እያልኩኝ
ሰልፉን በድል አለፍኩኝ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Qine keafe fesese
Yanchin sim eyawedese
Maryam Maryam eyalkugn
Selfun bedl alefkugn

VERSE 1
Hiywet bemot tedemdmo
Siga benefse teshumo
T’elat beseraw sayt’legn
Dingil miljash new yadanegn

CHORUS
Qine keafe fesese
Yanchin sim eyawedese
Maryam Maryam eyalkugn
Selfun bedl alefkugn

VERSE 2
Nega ya kifa ch’elema
T’lqu simshn sisema
Mechem t’erchesh alafrm
Ts’entwal kidansh zelealem

CHORUS
Qine keafe fesese
Yanchin sim eyawedese
Maryam Maryam eyalkugn
Selfun bedl alefkugn

VERSE 3
Godlo ayawqm medafe
Lanchi qine teselfe
Tirfe berekete nesh
Amsal weder yelelesh

CHORUS
Qine keafe fesese
Yanchin sim eyawedese
Maryam Maryam eyalkugn
Selfun bedl alefkugn

VERSE 4
Zare miyasferagn yelem
Kebogn yeljsh selam
Timkht gasha honshgnal
Girmash zuriyayen kebognal

CHORUS
Qine keafe fesese
Yanchin sim eyawedese
Maryam Maryam eyalkugn
Selfun bedl alefkugn'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'new-ethiopia-orthodox-tewahedo-mezmur-kine-keafe-fesese-by-zemarit-kidis', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: New Live Version Heartfelt Eritrean Orthodox Worship Song 2024 Aboy Zemari Bereket Tikue (new-live-version-heartfelt-eritrean-orthodox-worship-song-2024-aboy-zema)
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
ኣዒንተይ ዘዕወረን

VERSE 3
" ይፈልጦ''የ ልብኻ ለዋህ ኢኻ ኣመና ጎይታ''የ
እነኹ ተመሊሰ ሕቅፎኻ ናፊቀ''ዬ ኣቦየ
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
ኣጉሄዬ''የ ልብኻ
ከም ሓደ ጉዝእካ ጎይታይ ቁጸረኒ

VERSE 6
ከገልግል ኣብ ቤትካ
" ይፈልጦ''የ ልብኻ ለዋህ ኢኻ ኣመና ጎይታ''የ
እነኹ ተመሊሰ ሕቅፎኻ ናፊቀ''ዬ ኣቦየ',
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
Aintey zeeweren

VERSE 3
" yifelt’o''ye libኻ lewah iኻ amena goyta''ye
Eneኹ temelise hiqfoኻ nafiqe''ye aboye
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
Aguheye''ye libኻ
Kem hade guzeka goytay quts’ereni

VERSE 6
Kegelgl ab betka
" yifelt’o''ye libኻ lewah iኻ amena goyta''ye
Eneኹ temelise hiqfoኻ nafiqe''ye aboye',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'new-live-version-heartfelt-eritrean-orthodox-worship-song-2024-aboy-zema'
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
ኣዒንተይ ዘዕወረን

CHORUS
ንዝተሰብረ መንፈስ ንዝተጣዕሰ ልቢ
ኣይትንዕቆን ኢኻ
ኣቦየ መጼ''ለኹ ናብ ርስቲ ቀደመይ
ካባኻ ተፈልያ ኣይጥዓማን ነብሰይ (2)

VERSE 3
" ይፈልጦ''የ ልብኻ ለዋህ ኢኻ ኣመና ጎይታ''የ
እነኹ ተመሊሰ ሕቅፎኻ ናፊቀ''ዬ ኣቦየ
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
ኣጉሄዬ''የ ልብኻ
ከም ሓደ ጉዝእካ ጎይታይ ቁጸረኒ

CHORUS
ንዝተሰብረ መንፈስ ንዝተጣዕሰ ልቢ
ኣይትንዕቆን ኢኻ
ኣቦየ መጼ''ለኹ ናብ ርስቲ ቀደመይ
ካባኻ ተፈልያ ኣይጥዓማን ነብሰይ (2)

VERSE 6
ከገልግል ኣብ ቤትካ
" ይፈልጦ''የ ልብኻ ለዋህ ኢኻ ኣመና ጎይታ''የ
እነኹ ተመሊሰ ሕቅፎኻ ናፊቀ''ዬ ኣቦየ

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
Aintey zeeweren

CHORUS
Niztesebre menfes niztet’aese libi
Aytneqon iኻ
Aboye mets’e''leኹ nab risti qedemey
Kabaኻ tefelya ayt’aman nebsey (2)

VERSE 3
" yifelt’o''ye libኻ lewah iኻ amena goyta''ye
Eneኹ temelise hiqfoኻ nafiqe''ye aboye
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
Aguheye''ye libኻ
Kem hade guzeka goytay quts’ereni

CHORUS
Niztesebre menfes niztet’aese libi
Aytneqon iኻ
Aboye mets’e''leኹ nab risti qedemey
Kabaኻ tefelya ayt’aman nebsey (2)

VERSE 6
Kegelgl ab betka
" yifelt’o''ye libኻ lewah iኻ amena goyta''ye
Eneኹ temelise hiqfoኻ nafiqe''ye aboye

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
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'new-live-version-heartfelt-eritrean-orthodox-worship-song-2024-aboy-zema', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: NewEritreanOrthodoxMezmur2025 (neweritreanorthodoxmezmur2025)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ልሳነይ ከይገልጻ ይኸብደኒ ኽብራ
ስቅታ ከይመርጽ ውን ይጥዕመኒ ፍቅራ
እንታይ እሞ ክብላ ብኸመይ ክገልጻ
ሓንት''ስ ክውድሳ''የ ብዜማይ ከድምጻ

VERSE 1
ጽቡቅ ዝገበራ መንግስቱ ወረስቲ
ኣለዋ እብል ሞ ብዙሓት ኣንስቲ
ብጽበት ማህጸና ዝሰፍሐት ካብ ሰማይ
ብብርሃን መልክዓ ዝበርሀት ካብ ጸሓይ

VERSE 2
ትመስላ ኣይረኸብኩን ንእመ ኣዶናይ (2)
ኣዝ,,,,,,,,,, ,
ቀለማት በጽቢጸ ክብራ ካብ ዝስእል
ጸሓይ ምስ ሙቀታ ምስኣላ ይቀልል

VERSE 3
ምባሎም ኣቦታት ሓቲተ ምስጢራ
ኪሩቤል ዘይቀርብዎ መለኮት ምጻራ
በዚ ምኽንያት''የ ዝግረም ብኽብራ (2)
ኣዝ,,,,,,,,,,,,,,,,,

VERSE 4
ድንግል እናበልክዋ ኣደ ኮይና እረኽባ
ኣደ እናበልክዋ ድንግል ኮይና እረኽባ
ምስ መን ክምድባ ማርያም ኣደ ጎይታ
ቃላት እንተሰኣንኩ ዝገልጽ ትዕድልታ

VERSE 5
ፍቅራ ግን ኣሎኒ ዘይዕቆር ብስቅታ (2)
ኣዝ,,,,,,,,,,,,,,,
ሱራፌል ንእሳቱ ንዝኽወልዎ
ሰብኣዊ ማህጸና ከመይ ሉ ጸይርዎ

VERSE 6
ጽምኢ ኩሉ ፍጡር ዘርዊ ብማያት
ጸባኣ ኽጠቡ ርእየ ከም ህጻናት
ኣነስ ገሪሙኒ በ''ደ ብርሃን ብርሃናት (2)',
      lyrics_transliteration = 'Lisaney keygelts’a yiኸbdeni ኽbra
Siqta keymerts’ win yit’emeni fiqra
Entay emo kibla biኸmey kigelts’a
Hant''s kiwdsa''ye bizemay kedmts’a

VERSE 1
Ts’buq zigebera mengstu weresti
Alewa ebl mo bizuhat ansti
Bits’bet mahts’ena zisefhet kab semay
Bibrhan melka ziberhet kab ts’ehay

VERSE 2
Timesla ayreኸbkun nieme adonay (2)
Az,,,,,,,,,, ,
Qelemat bets’bits’e kibra kab zisel
Ts’ehay mis muqeta misala yiqell

VERSE 3
Mibalom abotat hatite mist’ira
Kirubel zeyqerbwo melekot mits’ara
Bezi miኽnyat''ye zigrem biኽbra (2)
Az,,,,,,,,,,,,,,,,,

VERSE 4
Dingil enabelkwa ade koyna ereኽba
Ade enabelkwa Dingil koyna ereኽba
Mis men kimdba Maryam ade goyta
Qalat enteseanku zigelts’ tiedlta

VERSE 5
Fiqra gin aloni zeyeqor bisqta (2)
Az,,,,,,,,,,,,,,,
Surafel niesatu nizኽwelwo
Sebawi mahts’ena kemey lu ts’eyrwo

VERSE 6
Ts’mi kulu fit’ur zerwi bimayat
Ts’ebaa ኽt’ebu rieye kem hits’anat
Anes gerimuni be''de birhan birhanat (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'neweritreanorthodoxmezmur2025'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ልሳነይ ከይገልጻ ይኸብደኒ ኽብራ
ስቅታ ከይመርጽ ውን ይጥዕመኒ ፍቅራ
እንታይ እሞ ክብላ ብኸመይ ክገልጻ
ሓንት''ስ ክውድሳ''የ ብዜማይ ከድምጻ

VERSE 1
ጽቡቅ ዝገበራ መንግስቱ ወረስቲ
ኣለዋ እብል ሞ ብዙሓት ኣንስቲ
ብጽበት ማህጸና ዝሰፍሐት ካብ ሰማይ
ብብርሃን መልክዓ ዝበርሀት ካብ ጸሓይ

CHORUS
ልሳነይ ከይገልጻ ይኸብደኒ ኽብራ
ስቅታ ከይመርጽ ውን ይጥዕመኒ ፍቅራ
እንታይ እሞ ክብላ ብኸመይ ክገልጻ
ሓንት''ስ ክውድሳ''የ ብዜማይ ከድምጻ

VERSE 2
ትመስላ ኣይረኸብኩን ንእመ ኣዶናይ (2)
ኣዝ,,,,,,,,,, ,
ቀለማት በጽቢጸ ክብራ ካብ ዝስእል
ጸሓይ ምስ ሙቀታ ምስኣላ ይቀልል

CHORUS
ልሳነይ ከይገልጻ ይኸብደኒ ኽብራ
ስቅታ ከይመርጽ ውን ይጥዕመኒ ፍቅራ
እንታይ እሞ ክብላ ብኸመይ ክገልጻ
ሓንት''ስ ክውድሳ''የ ብዜማይ ከድምጻ

VERSE 3
ምባሎም ኣቦታት ሓቲተ ምስጢራ
ኪሩቤል ዘይቀርብዎ መለኮት ምጻራ
በዚ ምኽንያት''የ ዝግረም ብኽብራ (2)
ኣዝ,,,,,,,,,,,,,,,,,

CHORUS
ልሳነይ ከይገልጻ ይኸብደኒ ኽብራ
ስቅታ ከይመርጽ ውን ይጥዕመኒ ፍቅራ
እንታይ እሞ ክብላ ብኸመይ ክገልጻ
ሓንት''ስ ክውድሳ''የ ብዜማይ ከድምጻ

VERSE 4
ድንግል እናበልክዋ ኣደ ኮይና እረኽባ
ኣደ እናበልክዋ ድንግል ኮይና እረኽባ
ምስ መን ክምድባ ማርያም ኣደ ጎይታ
ቃላት እንተሰኣንኩ ዝገልጽ ትዕድልታ

CHORUS
ልሳነይ ከይገልጻ ይኸብደኒ ኽብራ
ስቅታ ከይመርጽ ውን ይጥዕመኒ ፍቅራ
እንታይ እሞ ክብላ ብኸመይ ክገልጻ
ሓንት''ስ ክውድሳ''የ ብዜማይ ከድምጻ

VERSE 5
ፍቅራ ግን ኣሎኒ ዘይዕቆር ብስቅታ (2)
ኣዝ,,,,,,,,,,,,,,,
ሱራፌል ንእሳቱ ንዝኽወልዎ
ሰብኣዊ ማህጸና ከመይ ሉ ጸይርዎ

CHORUS
ልሳነይ ከይገልጻ ይኸብደኒ ኽብራ
ስቅታ ከይመርጽ ውን ይጥዕመኒ ፍቅራ
እንታይ እሞ ክብላ ብኸመይ ክገልጻ
ሓንት''ስ ክውድሳ''የ ብዜማይ ከድምጻ

VERSE 6
ጽምኢ ኩሉ ፍጡር ዘርዊ ብማያት
ጸባኣ ኽጠቡ ርእየ ከም ህጻናት
ኣነስ ገሪሙኒ በ''ደ ብርሃን ብርሃናት (2)

CHORUS
ልሳነይ ከይገልጻ ይኸብደኒ ኽብራ
ስቅታ ከይመርጽ ውን ይጥዕመኒ ፍቅራ
እንታይ እሞ ክብላ ብኸመይ ክገልጻ
ሓንት''ስ ክውድሳ''የ ብዜማይ ከድምጻ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lisaney keygelts’a yiኸbdeni ኽbra
Siqta keymerts’ win yit’emeni fiqra
Entay emo kibla biኸmey kigelts’a
Hant''s kiwdsa''ye bizemay kedmts’a

VERSE 1
Ts’buq zigebera mengstu weresti
Alewa ebl mo bizuhat ansti
Bits’bet mahts’ena zisefhet kab semay
Bibrhan melka ziberhet kab ts’ehay

CHORUS
Lisaney keygelts’a yiኸbdeni ኽbra
Siqta keymerts’ win yit’emeni fiqra
Entay emo kibla biኸmey kigelts’a
Hant''s kiwdsa''ye bizemay kedmts’a

VERSE 2
Timesla ayreኸbkun nieme adonay (2)
Az,,,,,,,,,, ,
Qelemat bets’bits’e kibra kab zisel
Ts’ehay mis muqeta misala yiqell

CHORUS
Lisaney keygelts’a yiኸbdeni ኽbra
Siqta keymerts’ win yit’emeni fiqra
Entay emo kibla biኸmey kigelts’a
Hant''s kiwdsa''ye bizemay kedmts’a

VERSE 3
Mibalom abotat hatite mist’ira
Kirubel zeyqerbwo melekot mits’ara
Bezi miኽnyat''ye zigrem biኽbra (2)
Az,,,,,,,,,,,,,,,,,

CHORUS
Lisaney keygelts’a yiኸbdeni ኽbra
Siqta keymerts’ win yit’emeni fiqra
Entay emo kibla biኸmey kigelts’a
Hant''s kiwdsa''ye bizemay kedmts’a

VERSE 4
Dingil enabelkwa ade koyna ereኽba
Ade enabelkwa Dingil koyna ereኽba
Mis men kimdba Maryam ade goyta
Qalat enteseanku zigelts’ tiedlta

CHORUS
Lisaney keygelts’a yiኸbdeni ኽbra
Siqta keymerts’ win yit’emeni fiqra
Entay emo kibla biኸmey kigelts’a
Hant''s kiwdsa''ye bizemay kedmts’a

VERSE 5
Fiqra gin aloni zeyeqor bisqta (2)
Az,,,,,,,,,,,,,,,
Surafel niesatu nizኽwelwo
Sebawi mahts’ena kemey lu ts’eyrwo

CHORUS
Lisaney keygelts’a yiኸbdeni ኽbra
Siqta keymerts’ win yit’emeni fiqra
Entay emo kibla biኸmey kigelts’a
Hant''s kiwdsa''ye bizemay kedmts’a

VERSE 6
Ts’mi kulu fit’ur zerwi bimayat
Ts’ebaa ኽt’ebu rieye kem hits’anat
Anes gerimuni be''de birhan birhanat (2)

CHORUS
Lisaney keygelts’a yiኸbdeni ኽbra
Siqta keymerts’ win yit’emeni fiqra
Entay emo kibla biኸmey kigelts’a
Hant''s kiwdsa''ye bizemay kedmts’a'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'neweritreanorthodoxmezmur2025', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Ney Ney Emebete (ney-ney-emebete)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ

VERSE 1
የዘለዓለም ቤቴ (2)
አንቺ ካልቀረብሺኝ (እመቤቴ)
በኀዘን በመከራ (እመቤቴ)
እንዴት እድናለሁ(እመቤቴ)

VERSE 2
ከሰይጣን ፈተና(እመቤቴ)
የዐማኑኤል እናት የጌታዬ እናት
ለንስሐ አብቂኝ እንዳልሞት በድንገት

VERSE 3
አንቺ ምርኩዜ ነሽ(እመቤቴ)
መንገድ ሲያስብ ልቤ(እመቤቴ)
የተሥፋ ስንቄ ነሽ(እመቤቴ)
እንዳይጠና ረሀቤ(እመቤቴ)

VERSE 4
ወገን አልባ ሆኜ እንዳልጨነቅ
ዘመድ ሁኚኝ ድንግል ፍርሃቴም ይራቅ

VERSE 5
እንደ ቅዱስ ኤፍሬም(እመቤቴ)
ጸጋሽ ይብዛልኝ(እመቤቴ)
በዘመኔ ሁሉ(እመቤቴ)
ሰላም እንዳገኝ(እመቤቴ)

VERSE 6
አንቺ ካለሽልኝ ከጎኔ ከሆንሽ
ክፉውን አልፈራም ታፅናኝኛለስ

VERSE 7
የፀጥታ ወደብ(እመቤቴ)
የልቤ ማረፊያ(እመቤቴ)
የምስጋናሽ ጣዕም(እመቤቴ)
በአንደበቴ ይጣፍጥ(እመቤቴ)

VERSE 8
ደጅ እጠናሻለሁ ባለሁበት ቦታ
ዘወትር አስባለሁ ያለሽን ውለታ

VERSE 9
ለታወኩኝ ለእኔ(እመቤቴ)
ብርሃኔ ነሽ ድንግል(እመቤቴ)
ለፈራሁኝ ለእኔ(እመቤቴ)
ብርታቴ ነሽ ድንግል(እመቤቴ)

VERSE 10
ስምሽን ከማወደስ እንዳይዝል ከንፈሬ
የእናትነት ፍቅርሽ ሞገስ ይሁን ክብሬ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ

VERSE 11
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
የዘለዓለም ቤቴ (2)',
      lyrics_transliteration = 'Ney ney Emebete
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete

VERSE 1
Yezelealem bete (2)
Anchi kalqerebshign (Emebete)
Behezen bemekera (Emebete)
Endet ednalehu(Emebete)

VERSE 2
Keseyt’an fetena(Emebete)
Yeamanuel enat yegetaye enat
Lenshe abqign endalmot bednget

VERSE 3
Anchi mirkuze nesh(Emebete)
Menged siyasb libe(Emebete)
Yetesfa sinqe nesh(Emebete)
Endayt’ena rehebe(Emebete)

VERSE 4
Wegen alba hogne endalch’eneq
Zemed hugnign Dingil firhatem yiraq

VERSE 5
Ende Kidus efrem(Emebete)
Ts’egash yibzalgn(Emebete)
Bezemene hulu(Emebete)
Selam endagegn(Emebete)

VERSE 6
Anchi kaleshlgn kegone kehonsh
Kifuwn alferam tats’nagngnales

VERSE 7
Yets’et’ta wedeb(Emebete)
Yelbe marefiya(Emebete)
Yemsganash t’aem(Emebete)
Beandebete yit’aft’(Emebete)

VERSE 8
Dej et’enashalehu balehubet bota
Zewetr asbalehu yaleshn wileta

VERSE 9
Letawekugn leene(Emebete)
Birhane nesh Dingil(Emebete)
Leferahugn leene(Emebete)
Birtate nesh Dingil(Emebete)

VERSE 10
Simshn kemawedes endayzl kenfere
Yeenatnet fiqrsh moges yihun kibre
Ney ney Emebete
Ney ney Emebete

VERSE 11
Ney ney Emebete
Ney ney Emebete
Yezelealem bete (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'ney-ney-emebete'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ

VERSE 1
የዘለዓለም ቤቴ (2)
አንቺ ካልቀረብሺኝ (እመቤቴ)
በኀዘን በመከራ (እመቤቴ)
እንዴት እድናለሁ(እመቤቴ)

CHORUS
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ

VERSE 2
ከሰይጣን ፈተና(እመቤቴ)
የዐማኑኤል እናት የጌታዬ እናት
ለንስሐ አብቂኝ እንዳልሞት በድንገት

CHORUS
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ

VERSE 3
አንቺ ምርኩዜ ነሽ(እመቤቴ)
መንገድ ሲያስብ ልቤ(እመቤቴ)
የተሥፋ ስንቄ ነሽ(እመቤቴ)
እንዳይጠና ረሀቤ(እመቤቴ)

CHORUS
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ

VERSE 4
ወገን አልባ ሆኜ እንዳልጨነቅ
ዘመድ ሁኚኝ ድንግል ፍርሃቴም ይራቅ

CHORUS
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ

VERSE 5
እንደ ቅዱስ ኤፍሬም(እመቤቴ)
ጸጋሽ ይብዛልኝ(እመቤቴ)
በዘመኔ ሁሉ(እመቤቴ)
ሰላም እንዳገኝ(እመቤቴ)

CHORUS
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ

VERSE 6
አንቺ ካለሽልኝ ከጎኔ ከሆንሽ
ክፉውን አልፈራም ታፅናኝኛለስ

CHORUS
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ

VERSE 7
የፀጥታ ወደብ(እመቤቴ)
የልቤ ማረፊያ(እመቤቴ)
የምስጋናሽ ጣዕም(እመቤቴ)
በአንደበቴ ይጣፍጥ(እመቤቴ)

CHORUS
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ

VERSE 8
ደጅ እጠናሻለሁ ባለሁበት ቦታ
ዘወትር አስባለሁ ያለሽን ውለታ

CHORUS
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ

VERSE 9
ለታወኩኝ ለእኔ(እመቤቴ)
ብርሃኔ ነሽ ድንግል(እመቤቴ)
ለፈራሁኝ ለእኔ(እመቤቴ)
ብርታቴ ነሽ ድንግል(እመቤቴ)

CHORUS
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ

VERSE 10
ስምሽን ከማወደስ እንዳይዝል ከንፈሬ
የእናትነት ፍቅርሽ ሞገስ ይሁን ክብሬ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ

CHORUS
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ

VERSE 11
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
የዘለዓለም ቤቴ (2)

CHORUS
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ
ነይ ነይ እመቤቴ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete

VERSE 1
Yezelealem bete (2)
Anchi kalqerebshign (Emebete)
Behezen bemekera (Emebete)
Endet ednalehu(Emebete)

CHORUS
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete

VERSE 2
Keseyt’an fetena(Emebete)
Yeamanuel enat yegetaye enat
Lenshe abqign endalmot bednget

CHORUS
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete

VERSE 3
Anchi mirkuze nesh(Emebete)
Menged siyasb libe(Emebete)
Yetesfa sinqe nesh(Emebete)
Endayt’ena rehebe(Emebete)

CHORUS
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete

VERSE 4
Wegen alba hogne endalch’eneq
Zemed hugnign Dingil firhatem yiraq

CHORUS
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete

VERSE 5
Ende Kidus efrem(Emebete)
Ts’egash yibzalgn(Emebete)
Bezemene hulu(Emebete)
Selam endagegn(Emebete)

CHORUS
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete

VERSE 6
Anchi kaleshlgn kegone kehonsh
Kifuwn alferam tats’nagngnales

CHORUS
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete

VERSE 7
Yets’et’ta wedeb(Emebete)
Yelbe marefiya(Emebete)
Yemsganash t’aem(Emebete)
Beandebete yit’aft’(Emebete)

CHORUS
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete

VERSE 8
Dej et’enashalehu balehubet bota
Zewetr asbalehu yaleshn wileta

CHORUS
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete

VERSE 9
Letawekugn leene(Emebete)
Birhane nesh Dingil(Emebete)
Leferahugn leene(Emebete)
Birtate nesh Dingil(Emebete)

CHORUS
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete

VERSE 10
Simshn kemawedes endayzl kenfere
Yeenatnet fiqrsh moges yihun kibre
Ney ney Emebete
Ney ney Emebete

CHORUS
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete

VERSE 11
Ney ney Emebete
Ney ney Emebete
Yezelealem bete (2)

CHORUS
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete
Ney ney Emebete'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'ney-ney-emebete', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Nii Emilibanos (nii-emilibanos)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'የኖህ መርከቢቱ ሊባኖስ አረፈች
የጌዴዎን ፀመሩም በዚያ ተዘረጋች
ሐመልማላዊት ዕፅ የታየች በሲና
ዝናብ የቋጠረች ታናሿ ደመና

VERSE 1
ውሃ ሳያጠጧት የበቀለች በትር አብባም ያፈራች
በሊባኖስ ደብር የአብርሃም ድንኳን
ድንግል ተተከለች
ንዒ እምሊባኖስ አንቲ ዕንቄ ቢርሊ

VERSE 2
ለክብር ቅድስናሽ አልብኪ ምሳሌ አምላክ ያስተረፋት የቀረችዋ ዘር
ድንግል ተገኝታለች በሊባኖስ ደብር
ስላስወገደልን ፆረ ኅዘን ክቡደ
በልደትኪ ድንግል ንትፌሳሕ ፈድፋደ

VERSE 3
ንዒ እምሊባኖስ ርግብየ አሐቲ
ልደትኪ ድንግል ቡርክት ይእቲ/፪/
ከመዋቲው ኢያቄም ከመካኗ ሐና
በሕግ ሩካቤ ተወልዳለችና

VERSE 4
ክልኤቱ በለሶች አፈሩ ቡቃያ
አስገኙ ለድኅነት የሥጋን ልብስ መስሪያ
ናት የአብ ሙሽራ
እናት ነሽ ለበጉ

VERSE 5
ለኩነተ ሥጋ የለበሰሽ ማጉ/፪/
ኦ መዋዒት እመ አምላክ መዋዒ
ንዒ ንዒ እምሊባኖስ ንዒ
የፍጥረቱ ናፍቆት የወልድ መገለጫ

VERSE 6
ሔዋንን የጎዳት ማሰሪያ መቁረጫ
የልዑል ማደሪያው ሊባኖስ ታነጸ
በልደታ ማርያም ዓለም አንፈራፀ
ንዒ እምሊባኖስ መያጢተ አዳም

VERSE 7
የብሉይ የሐዲስ ነሽና ተንከተም/፪/
ባሕቱ ነአኵት ዘፆረትኪ ማኅፀን
ልደትኪ ማርያም ነው ምክንያተ ድኂን
በዕለተ ሰላም ተወለድሽ ሊባኖስ

VERSE 8
ሰውሪን ከጥፋት እንዳንሞት በነፍስ
ዘንነግር ማርያም ዝክረ ልደትኪ ለእለ ሰዓቱ
ሰአሊ ለነ ቅድስት ኢንጥፋዕ በከንቱ/፪/
ንዒ እምሊባኖስ ደብር

VERSE 9
አንጽሕኒ ማርያም ካበሳ ከነውር
አብሪልን ሶልያና በልደትኪ ማኅቶት
ምሪን ወደ ፀሐይ አውጥተሽ ከጽልመት
ማርያም ድንግል ንስእለኪ ስእለ

VERSE 10
ርኅርኅት እንዳንቺ ከፍጥረት ማን አለ?
ንዒ ትናዝዘነ ኀዘነ ልብነ
ውስተ ዕዝንኪ ድንግል ይባዕ ፅራሕነ/፪',
      lyrics_transliteration = 'Yenoh merkebitu libanos arefech
Yegedewon ts’emerum beziya tezeregach
Hemelmalawit ets’ yetayech besina
Zinab yeqwat’erech tanashwa demena

VERSE 1
Wiha sayat’et’wat yebeqelech betr abbam yaferach
Belibanos debr yeabrham dinkwan
Dingil tetekelech
Nii emlibanos anti enqe birli

VERSE 2
Lekbr qidsnash albki misale amlak yasterefat yeqerechwa zer
Dingil tegegntalech belibanos debr
Silaswegedeln ts’ore hizen kibude
Beldetki Dingil nitfesah fedfade

VERSE 3
Nii emlibanos rigbye aheti
Lidetki Dingil burkt yieti (2)
Kemewatiw iyaqem kemekanwa hena
Behg rukabe teweldalechna

VERSE 4
Kiletu belesoch aferu buqaya
Asgegnu ledhnet yesgan libs mesriya
Nat yeab mushra
Enat nesh lebegu

VERSE 5
Lekunete siga yelebesesh magu (2)
O mewait eme amlak mewai
Nii nii emlibanos nii
Yeft’retu nafqot yeweld megelech’a

VERSE 6
Hewann yegodat maseriya mequrech’a
Yelul maderiyaw libanos tanets’e
Beldeta Maryam alem anferats’e
Nii emlibanos meyat’ite adam

VERSE 7
Yebluy yehedis neshna tenketem (2)
Bahtu neakwt zets’oretki mahts’en
Lidetki Maryam new miknyate dihin
Beelete selam teweledsh libanos

VERSE 8
Sewrin ket’fat endanmot benefs
Zennegr Maryam zikre lidetki leele seatu
Seali lene Kidist int’fae bekentu (2)
Nii emlibanos debr

VERSE 9
Ants’hni Maryam kabesa kenewr
Abriln solyana beldetki mahtot
Mirin wede ts’ehey awt’tesh kets’lmet
Maryam Dingil niseleki siele

VERSE 10
Rihrht endanchi keft’ret man ale?
Nii tinazzene hezene libne
Wiste eznki Dingil yibae ts’rahne/2',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nii-emilibanos'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የኖህ መርከቢቱ ሊባኖስ አረፈች
የጌዴዎን ፀመሩም በዚያ ተዘረጋች
ሐመልማላዊት ዕፅ የታየች በሲና
ዝናብ የቋጠረች ታናሿ ደመና

VERSE 1
ውሃ ሳያጠጧት የበቀለች በትር አብባም ያፈራች
በሊባኖስ ደብር የአብርሃም ድንኳን
ድንግል ተተከለች
ንዒ እምሊባኖስ አንቲ ዕንቄ ቢርሊ

CHORUS
የኖህ መርከቢቱ ሊባኖስ አረፈች
የጌዴዎን ፀመሩም በዚያ ተዘረጋች
ሐመልማላዊት ዕፅ የታየች በሲና
ዝናብ የቋጠረች ታናሿ ደመና

VERSE 2
ለክብር ቅድስናሽ አልብኪ ምሳሌ አምላክ ያስተረፋት የቀረችዋ ዘር
ድንግል ተገኝታለች በሊባኖስ ደብር
ስላስወገደልን ፆረ ኅዘን ክቡደ
በልደትኪ ድንግል ንትፌሳሕ ፈድፋደ

CHORUS
የኖህ መርከቢቱ ሊባኖስ አረፈች
የጌዴዎን ፀመሩም በዚያ ተዘረጋች
ሐመልማላዊት ዕፅ የታየች በሲና
ዝናብ የቋጠረች ታናሿ ደመና

VERSE 3
ንዒ እምሊባኖስ ርግብየ አሐቲ
ልደትኪ ድንግል ቡርክት ይእቲ/፪/
ከመዋቲው ኢያቄም ከመካኗ ሐና
በሕግ ሩካቤ ተወልዳለችና

CHORUS
የኖህ መርከቢቱ ሊባኖስ አረፈች
የጌዴዎን ፀመሩም በዚያ ተዘረጋች
ሐመልማላዊት ዕፅ የታየች በሲና
ዝናብ የቋጠረች ታናሿ ደመና

VERSE 4
ክልኤቱ በለሶች አፈሩ ቡቃያ
አስገኙ ለድኅነት የሥጋን ልብስ መስሪያ
ናት የአብ ሙሽራ
እናት ነሽ ለበጉ

CHORUS
የኖህ መርከቢቱ ሊባኖስ አረፈች
የጌዴዎን ፀመሩም በዚያ ተዘረጋች
ሐመልማላዊት ዕፅ የታየች በሲና
ዝናብ የቋጠረች ታናሿ ደመና

VERSE 5
ለኩነተ ሥጋ የለበሰሽ ማጉ/፪/
ኦ መዋዒት እመ አምላክ መዋዒ
ንዒ ንዒ እምሊባኖስ ንዒ
የፍጥረቱ ናፍቆት የወልድ መገለጫ

CHORUS
የኖህ መርከቢቱ ሊባኖስ አረፈች
የጌዴዎን ፀመሩም በዚያ ተዘረጋች
ሐመልማላዊት ዕፅ የታየች በሲና
ዝናብ የቋጠረች ታናሿ ደመና

VERSE 6
ሔዋንን የጎዳት ማሰሪያ መቁረጫ
የልዑል ማደሪያው ሊባኖስ ታነጸ
በልደታ ማርያም ዓለም አንፈራፀ
ንዒ እምሊባኖስ መያጢተ አዳም

CHORUS
የኖህ መርከቢቱ ሊባኖስ አረፈች
የጌዴዎን ፀመሩም በዚያ ተዘረጋች
ሐመልማላዊት ዕፅ የታየች በሲና
ዝናብ የቋጠረች ታናሿ ደመና

VERSE 7
የብሉይ የሐዲስ ነሽና ተንከተም/፪/
ባሕቱ ነአኵት ዘፆረትኪ ማኅፀን
ልደትኪ ማርያም ነው ምክንያተ ድኂን
በዕለተ ሰላም ተወለድሽ ሊባኖስ

CHORUS
የኖህ መርከቢቱ ሊባኖስ አረፈች
የጌዴዎን ፀመሩም በዚያ ተዘረጋች
ሐመልማላዊት ዕፅ የታየች በሲና
ዝናብ የቋጠረች ታናሿ ደመና

VERSE 8
ሰውሪን ከጥፋት እንዳንሞት በነፍስ
ዘንነግር ማርያም ዝክረ ልደትኪ ለእለ ሰዓቱ
ሰአሊ ለነ ቅድስት ኢንጥፋዕ በከንቱ/፪/
ንዒ እምሊባኖስ ደብር

CHORUS
የኖህ መርከቢቱ ሊባኖስ አረፈች
የጌዴዎን ፀመሩም በዚያ ተዘረጋች
ሐመልማላዊት ዕፅ የታየች በሲና
ዝናብ የቋጠረች ታናሿ ደመና

VERSE 9
አንጽሕኒ ማርያም ካበሳ ከነውር
አብሪልን ሶልያና በልደትኪ ማኅቶት
ምሪን ወደ ፀሐይ አውጥተሽ ከጽልመት
ማርያም ድንግል ንስእለኪ ስእለ

CHORUS
የኖህ መርከቢቱ ሊባኖስ አረፈች
የጌዴዎን ፀመሩም በዚያ ተዘረጋች
ሐመልማላዊት ዕፅ የታየች በሲና
ዝናብ የቋጠረች ታናሿ ደመና

VERSE 10
ርኅርኅት እንዳንቺ ከፍጥረት ማን አለ?
ንዒ ትናዝዘነ ኀዘነ ልብነ
ውስተ ዕዝንኪ ድንግል ይባዕ ፅራሕነ/፪

CHORUS
የኖህ መርከቢቱ ሊባኖስ አረፈች
የጌዴዎን ፀመሩም በዚያ ተዘረጋች
ሐመልማላዊት ዕፅ የታየች በሲና
ዝናብ የቋጠረች ታናሿ ደመና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yenoh merkebitu libanos arefech
Yegedewon ts’emerum beziya tezeregach
Hemelmalawit ets’ yetayech besina
Zinab yeqwat’erech tanashwa demena

VERSE 1
Wiha sayat’et’wat yebeqelech betr abbam yaferach
Belibanos debr yeabrham dinkwan
Dingil tetekelech
Nii emlibanos anti enqe birli

CHORUS
Yenoh merkebitu libanos arefech
Yegedewon ts’emerum beziya tezeregach
Hemelmalawit ets’ yetayech besina
Zinab yeqwat’erech tanashwa demena

VERSE 2
Lekbr qidsnash albki misale amlak yasterefat yeqerechwa zer
Dingil tegegntalech belibanos debr
Silaswegedeln ts’ore hizen kibude
Beldetki Dingil nitfesah fedfade

CHORUS
Yenoh merkebitu libanos arefech
Yegedewon ts’emerum beziya tezeregach
Hemelmalawit ets’ yetayech besina
Zinab yeqwat’erech tanashwa demena

VERSE 3
Nii emlibanos rigbye aheti
Lidetki Dingil burkt yieti (2)
Kemewatiw iyaqem kemekanwa hena
Behg rukabe teweldalechna

CHORUS
Yenoh merkebitu libanos arefech
Yegedewon ts’emerum beziya tezeregach
Hemelmalawit ets’ yetayech besina
Zinab yeqwat’erech tanashwa demena

VERSE 4
Kiletu belesoch aferu buqaya
Asgegnu ledhnet yesgan libs mesriya
Nat yeab mushra
Enat nesh lebegu

CHORUS
Yenoh merkebitu libanos arefech
Yegedewon ts’emerum beziya tezeregach
Hemelmalawit ets’ yetayech besina
Zinab yeqwat’erech tanashwa demena

VERSE 5
Lekunete siga yelebesesh magu (2)
O mewait eme amlak mewai
Nii nii emlibanos nii
Yeft’retu nafqot yeweld megelech’a

CHORUS
Yenoh merkebitu libanos arefech
Yegedewon ts’emerum beziya tezeregach
Hemelmalawit ets’ yetayech besina
Zinab yeqwat’erech tanashwa demena

VERSE 6
Hewann yegodat maseriya mequrech’a
Yelul maderiyaw libanos tanets’e
Beldeta Maryam alem anferats’e
Nii emlibanos meyat’ite adam

CHORUS
Yenoh merkebitu libanos arefech
Yegedewon ts’emerum beziya tezeregach
Hemelmalawit ets’ yetayech besina
Zinab yeqwat’erech tanashwa demena

VERSE 7
Yebluy yehedis neshna tenketem (2)
Bahtu neakwt zets’oretki mahts’en
Lidetki Maryam new miknyate dihin
Beelete selam teweledsh libanos

CHORUS
Yenoh merkebitu libanos arefech
Yegedewon ts’emerum beziya tezeregach
Hemelmalawit ets’ yetayech besina
Zinab yeqwat’erech tanashwa demena

VERSE 8
Sewrin ket’fat endanmot benefs
Zennegr Maryam zikre lidetki leele seatu
Seali lene Kidist int’fae bekentu (2)
Nii emlibanos debr

CHORUS
Yenoh merkebitu libanos arefech
Yegedewon ts’emerum beziya tezeregach
Hemelmalawit ets’ yetayech besina
Zinab yeqwat’erech tanashwa demena

VERSE 9
Ants’hni Maryam kabesa kenewr
Abriln solyana beldetki mahtot
Mirin wede ts’ehey awt’tesh kets’lmet
Maryam Dingil niseleki siele

CHORUS
Yenoh merkebitu libanos arefech
Yegedewon ts’emerum beziya tezeregach
Hemelmalawit ets’ yetayech besina
Zinab yeqwat’erech tanashwa demena

VERSE 10
Rihrht endanchi keft’ret man ale?
Nii tinazzene hezene libne
Wiste eznki Dingil yibae ts’rahne/2

CHORUS
Yenoh merkebitu libanos arefech
Yegedewon ts’emerum beziya tezeregach
Hemelmalawit ets’ yetayech besina
Zinab yeqwat’erech tanashwa demena'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nii-emilibanos', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Nisebiho (nisebiho)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ንሴብሖ /2/
ንሴብሖ ለእግዚአብሔር ስቡሕ ዘተሰብሐ

VERSE 1
እናመስግነው /2/
እግዚአብሔርን ምስጉን ነው የተመሰገነ /2/',
      lyrics_transliteration = 'Nisebiho /2/
Nisebiho le’Egziabher Sibuh zetesebiha

VERSE 1
Enamesginew /2/
Egziabherin Misgun new yetemesegene /2/',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nisebiho'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ንሴብሖ /2/
ንሴብሖ ለእግዚአብሔር ስቡሕ ዘተሰብሐ

VERSE 1
እናመስግነው /2/
እግዚአብሔርን ምስጉን ነው የተመሰገነ /2/

CHORUS
ንሴብሖ /2/
ንሴብሖ ለእግዚአብሔር ስቡሕ ዘተሰብሐ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nisebiho /2/
Nisebiho le’Egziabher Sibuh zetesebiha

VERSE 1
Enamesginew /2/
Egziabherin Misgun new yetemesegene /2/

CHORUS
Nisebiho /2/
Nisebiho le’Egziabher Sibuh zetesebiha'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nisebiho', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: nitsuh bahetawi deacon zemari endale dereje (nitsuh-bahetawi-deacon-zemari-endale-dereje)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል

VERSE 1
ንጹህ ባህታዊ እውነተኛ አገልጋይ
ገብረ መንፈስ ቅዱስ ሆነ ለእኛ ሲሳይ
ኢትዮጵያን ማርልኝ ብለህ እየለመንክ
በዝቋላ ባህር መቶ ዓመት ጸለይክ

VERSE 2
የእምነት ወታደር የፀሎት ወዳጅ
የአቅሌስያ ፀጋ የስምዖን ልጅ
ዝናህ እጅግ ሰፍቶ ተሰማ በአለም
ጻድቅ ሐዋርያ የፍቅር የሠላም

VERSE 3
ፀበልህን ጠጣሁ ከደጅህ ደርሼ
ከህመሜ ዳንኩኝ በእምነትህ ታብሼ
አንበሳና ነብር የሚታዘዙልህ
ገብረ መንፈስ ቅዱስ ልዩ ነው ተጋድሎህ

VERSE 4
ግብፅም ትናገረው ታላቋ በህንሳ
የወንጌል መምህር የተዋህዶ አንበሳ
ምስራች ነጋሪ የጽድቅ ባለሙያ
በረከትህ በዝቷል በኢትዮጵያ',
      lyrics_transliteration = 'Gebre menfes Kidus abate
Gibalgn yibarek bete
Yebereket minch’ honehel
Beqal kidanh tamnenal

VERSE 1
Nits’uh bahtawi ewnetegna agelgay
Gebre menfes Kidus hone leegna sisay
Ityop’yan marlgn bileh eyelemenk
Bezqwala bahr meto amet ts’eleyk

VERSE 2
Yeemnet wetader yets’elot wedaj
Yeaqlesya ts’ega yesmon lij
Zinah ejg sefto tesema bealem
Ts’adq hewarya yefqr yeselam

VERSE 3
Ts’ebelhn t’et’ahu kedejh dershe
Kehmeme dankugn beemneth tabshe
Anbesana nebr yemitazezulh
Gebre menfes Kidus liyu new tegadloh

VERSE 4
Gibts’m tinagerew talaqwa behnsa
Yewengel memhr yetewahdo anbesa
Misrach negari yets’dq balemuya
Bereketh beztwal beityop’ya',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nitsuh-bahetawi-deacon-zemari-endale-dereje'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል

VERSE 1
ንጹህ ባህታዊ እውነተኛ አገልጋይ
ገብረ መንፈስ ቅዱስ ሆነ ለእኛ ሲሳይ
ኢትዮጵያን ማርልኝ ብለህ እየለመንክ
በዝቋላ ባህር መቶ ዓመት ጸለይክ

CHORUS
ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል

VERSE 2
የእምነት ወታደር የፀሎት ወዳጅ
የአቅሌስያ ፀጋ የስምዖን ልጅ
ዝናህ እጅግ ሰፍቶ ተሰማ በአለም
ጻድቅ ሐዋርያ የፍቅር የሠላም

CHORUS
ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል

VERSE 3
ፀበልህን ጠጣሁ ከደጅህ ደርሼ
ከህመሜ ዳንኩኝ በእምነትህ ታብሼ
አንበሳና ነብር የሚታዘዙልህ
ገብረ መንፈስ ቅዱስ ልዩ ነው ተጋድሎህ

CHORUS
ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል

VERSE 4
ግብፅም ትናገረው ታላቋ በህንሳ
የወንጌል መምህር የተዋህዶ አንበሳ
ምስራች ነጋሪ የጽድቅ ባለሙያ
በረከትህ በዝቷል በኢትዮጵያ

CHORUS
ገብረ መንፈስ ቅዱስ አባቴ
ግባልኝ ይባረክ ቤቴ
የበረከት ምንጭ ሆነሀል
በቃል ኪዳንህ ታምነናል'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gebre menfes Kidus abate
Gibalgn yibarek bete
Yebereket minch’ honehel
Beqal kidanh tamnenal

VERSE 1
Nits’uh bahtawi ewnetegna agelgay
Gebre menfes Kidus hone leegna sisay
Ityop’yan marlgn bileh eyelemenk
Bezqwala bahr meto amet ts’eleyk

CHORUS
Gebre menfes Kidus abate
Gibalgn yibarek bete
Yebereket minch’ honehel
Beqal kidanh tamnenal

VERSE 2
Yeemnet wetader yets’elot wedaj
Yeaqlesya ts’ega yesmon lij
Zinah ejg sefto tesema bealem
Ts’adq hewarya yefqr yeselam

CHORUS
Gebre menfes Kidus abate
Gibalgn yibarek bete
Yebereket minch’ honehel
Beqal kidanh tamnenal

VERSE 3
Ts’ebelhn t’et’ahu kedejh dershe
Kehmeme dankugn beemneth tabshe
Anbesana nebr yemitazezulh
Gebre menfes Kidus liyu new tegadloh

CHORUS
Gebre menfes Kidus abate
Gibalgn yibarek bete
Yebereket minch’ honehel
Beqal kidanh tamnenal

VERSE 4
Gibts’m tinagerew talaqwa behnsa
Yewengel memhr yetewahdo anbesa
Misrach negari yets’dq balemuya
Bereketh beztwal beityop’ya

CHORUS
Gebre menfes Kidus abate
Gibalgn yibarek bete
Yebereket minch’ honehel
Beqal kidanh tamnenal'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nitsuh-bahetawi-deacon-zemari-endale-dereje', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Nitsum Tsoma (nitsum-tsoma)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ንጹም ጾመ ወናፍቅር ቢጸነ (፪)
ወንትፋቀር (፬)
ንትፋቀር በበይናቲነ

VERSE 1
ንጹም ጾመ ወናፍቅር ቢጸነ (፪)
ወንትፋቀር (፬)
ንትፋቀር በበይናቲነ',
      lyrics_transliteration = 'Nitsum tsoma wenafkir bitsene (2)
Wentifaker (4)
Nitfaker bebeynatine

VERSE 1
Nitsum tsoma wenafkir bitsene (2)
Wentifaker (4)
Nitfaker bebeynatine',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nitsum-tsoma'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ንጹም ጾመ ወናፍቅር ቢጸነ (፪)
ወንትፋቀር (፬)
ንትፋቀር በበይናቲነ

VERSE 1
ንጹም ጾመ ወናፍቅር ቢጸነ (፪)
ወንትፋቀር (፬)
ንትፋቀር በበይናቲነ

CHORUS
ንጹም ጾመ ወናፍቅር ቢጸነ (፪)
ወንትፋቀር (፬)
ንትፋቀር በበይናቲነ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nitsum tsoma wenafkir bitsene (2)
Wentifaker (4)
Nitfaker bebeynatine

VERSE 1
Nitsum tsoma wenafkir bitsene (2)
Wentifaker (4)
Nitfaker bebeynatine

CHORUS
Nitsum tsoma wenafkir bitsene (2)
Wentifaker (4)
Nitfaker bebeynatine'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nitsum-tsoma', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Nolawi Tiguh Ze’itnewum (nolawi-tiguh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኖላዊ ትጉህ ዘኢትነውም (፪)
ማኅበረነ ማኅበረነ ዕቀብ በሰላም (፪)
የማታንቀላፋ ትጉህ እረኛችን (፪)
ጠብቅልን በሰላም ማኅበራችንን (፪)

VERSE 1
ኖላዊ ትጉህ ዘኢትነውም (፪)
ማኅበረነ ማኅበረነ ዕቀብ በሰላም (፪)
የማታንቀላፋ ትጉህ እረኛችን (፪)
ጠብቅልን በሰላም ማኅበራችንን (፪)',
      lyrics_transliteration = 'Nolawi Tguh Ze’itnewum (2)
Mahberene Mahberene Eqeb Beselam (2)
Yematanqelafa Tguh Eregnachn (2)
Tebqln Beselam Mahberachn’n (2)

VERSE 1
Nolawi Tguh Ze’itnewum (2)
Mahberene Mahberene Eqeb Beselam (2)
Yematanqelafa Tguh Eregnachn (2)
Tebqln Beselam Mahberachn’n (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nolawi-tiguh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኖላዊ ትጉህ ዘኢትነውም (፪)
ማኅበረነ ማኅበረነ ዕቀብ በሰላም (፪)
የማታንቀላፋ ትጉህ እረኛችን (፪)
ጠብቅልን በሰላም ማኅበራችንን (፪)

VERSE 1
ኖላዊ ትጉህ ዘኢትነውም (፪)
ማኅበረነ ማኅበረነ ዕቀብ በሰላም (፪)
የማታንቀላፋ ትጉህ እረኛችን (፪)
ጠብቅልን በሰላም ማኅበራችንን (፪)

CHORUS
ኖላዊ ትጉህ ዘኢትነውም (፪)
ማኅበረነ ማኅበረነ ዕቀብ በሰላም (፪)
የማታንቀላፋ ትጉህ እረኛችን (፪)
ጠብቅልን በሰላም ማኅበራችንን (፪)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nolawi Tguh Ze’itnewum (2)
Mahberene Mahberene Eqeb Beselam (2)
Yematanqelafa Tguh Eregnachn (2)
Tebqln Beselam Mahberachn’n (2)

VERSE 1
Nolawi Tguh Ze’itnewum (2)
Mahberene Mahberene Eqeb Beselam (2)
Yematanqelafa Tguh Eregnachn (2)
Tebqln Beselam Mahberachn’n (2)

CHORUS
Nolawi Tguh Ze’itnewum (2)
Mahberene Mahberene Eqeb Beselam (2)
Yematanqelafa Tguh Eregnachn (2)
Tebqln Beselam Mahberachn’n (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nolawi-tiguh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Nsu eyu / Eritrean orthodox tewahdo mezmur / zemari Bereket Tikue (nsu-eyu-eritrean-orthodox-tewahdo-mezmur-zemari-bereket-tikue)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ምኽንያት ኣለኒ ኣነ ዝዝምረሉ
ብዘይ ምስልካይ ስሙ ዝፅውዓሉ
ምንጪ ሓጎሰይ ፍስሃ ናይ ገፀይ
ንሱ ''ዩ ምኽንያቱ ኢየሱስ ጎይታይ

VERSE 1
ንሱ ''ዩ እቲ ምሒሩ ዘይርብርብ
ንሱ ''ዩ ናይ ሕይወተይ ድባብ
ንሱ ''ዩ ፀግዒ ዝኾነኒ
ጎይታ ''ዩ ወዲቐ ዘይገድፈኒ

VERSE 2
ምኽንያት ኣይደልን ''ዩ ንምፍቃር ብሕሉፍ ኣይምንንን
ክሳብ ሞት ''ዩ ናቱ ፍቕሪ ከም ናይ ሰብ ኣይኮነን
ንሱ ''ዩ መፅሓፍ ዕዳይ ዘንደደ
ንሱ ''ዩ ስለይ ዝተዋረደ

VERSE 3
ንሱ ''ዩ ልዕል ዘበለኒ
ጎይታ ''ዩ ሕይወቱ ዝሃበኒ
ምኽንያት ኣይደልን ''ዩ ንምፍቃር ብሕሉፍ ኣይምንንን
ክሳብ ሞት ''ዩ ናቱ ፍቕሪ ከም ናይ ሰብ ኣይኮነን

VERSE 4
ንሱ ''ዩ ምድሓነይ ግዲ ዝብሎ
ንሱ ''ዩ ልዕሊ ነፍሰይ ዝኣምኖ
ንሱ ''ዩ ምስ ሰሓትኩ መንገደይ
ጎይታ ''ንድዩ ተስፋ ዘይቆረፀ ብኣይ

VERSE 5
ምኽንያት ኣይደልን ''ዩ ንምፍቃር ብሕሉፍ ኣይምንንን
ክሳብ ሞት ''ዩ ናቱ ፍቕሪ ከም ናይ ሰብ ኣይኮነን',
      lyrics_transliteration = 'Miኽnyat aleni ane zizmrelu
Bizey mislkay simu zits’walu
Minch’i hagosey fisha nay gets’ey
Nisu ''yu miኽnyatu Iyesus goytay

VERSE 1
Nisu ''yu eti mihiru zeyrbrb
Nisu ''yu nay hiywetey dibab
Nisu ''yu ts’egi ziኾneni
Goyta ''yu wediቐ zeygedfeni

VERSE 2
Miኽnyat aydeln ''yu nimfqar bihluf aymnnn
Kisab mot ''yu natu fiቕri kem nay seb aykonen
Nisu ''yu mets’haf eday zendede
Nisu ''yu siley zitewarede

VERSE 3
Nisu ''yu liel zebeleni
Goyta ''yu hiywetu zihabeni
Miኽnyat aydeln ''yu nimfqar bihluf aymnnn
Kisab mot ''yu natu fiቕri kem nay seb aykonen

VERSE 4
Nisu ''yu midhaney gidi ziblo
Nisu ''yu lieli nefsey ziamno
Nisu ''yu mis sehatku mengedey
Goyta ''nidyu tesfa zeyqorets’e biay

VERSE 5
Miኽnyat aydeln ''yu nimfqar bihluf aymnnn
Kisab mot ''yu natu fiቕri kem nay seb aykonen',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nsu-eyu-eritrean-orthodox-tewahdo-mezmur-zemari-bereket-tikue'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምኽንያት ኣለኒ ኣነ ዝዝምረሉ
ብዘይ ምስልካይ ስሙ ዝፅውዓሉ
ምንጪ ሓጎሰይ ፍስሃ ናይ ገፀይ
ንሱ ''ዩ ምኽንያቱ ኢየሱስ ጎይታይ

VERSE 1
ንሱ ''ዩ እቲ ምሒሩ ዘይርብርብ
ንሱ ''ዩ ናይ ሕይወተይ ድባብ
ንሱ ''ዩ ፀግዒ ዝኾነኒ
ጎይታ ''ዩ ወዲቐ ዘይገድፈኒ

CHORUS
ምኽንያት ኣለኒ ኣነ ዝዝምረሉ
ብዘይ ምስልካይ ስሙ ዝፅውዓሉ
ምንጪ ሓጎሰይ ፍስሃ ናይ ገፀይ
ንሱ ''ዩ ምኽንያቱ ኢየሱስ ጎይታይ

VERSE 2
ምኽንያት ኣይደልን ''ዩ ንምፍቃር ብሕሉፍ ኣይምንንን
ክሳብ ሞት ''ዩ ናቱ ፍቕሪ ከም ናይ ሰብ ኣይኮነን
ንሱ ''ዩ መፅሓፍ ዕዳይ ዘንደደ
ንሱ ''ዩ ስለይ ዝተዋረደ

CHORUS
ምኽንያት ኣለኒ ኣነ ዝዝምረሉ
ብዘይ ምስልካይ ስሙ ዝፅውዓሉ
ምንጪ ሓጎሰይ ፍስሃ ናይ ገፀይ
ንሱ ''ዩ ምኽንያቱ ኢየሱስ ጎይታይ

VERSE 3
ንሱ ''ዩ ልዕል ዘበለኒ
ጎይታ ''ዩ ሕይወቱ ዝሃበኒ
ምኽንያት ኣይደልን ''ዩ ንምፍቃር ብሕሉፍ ኣይምንንን
ክሳብ ሞት ''ዩ ናቱ ፍቕሪ ከም ናይ ሰብ ኣይኮነን

CHORUS
ምኽንያት ኣለኒ ኣነ ዝዝምረሉ
ብዘይ ምስልካይ ስሙ ዝፅውዓሉ
ምንጪ ሓጎሰይ ፍስሃ ናይ ገፀይ
ንሱ ''ዩ ምኽንያቱ ኢየሱስ ጎይታይ

VERSE 4
ንሱ ''ዩ ምድሓነይ ግዲ ዝብሎ
ንሱ ''ዩ ልዕሊ ነፍሰይ ዝኣምኖ
ንሱ ''ዩ ምስ ሰሓትኩ መንገደይ
ጎይታ ''ንድዩ ተስፋ ዘይቆረፀ ብኣይ

CHORUS
ምኽንያት ኣለኒ ኣነ ዝዝምረሉ
ብዘይ ምስልካይ ስሙ ዝፅውዓሉ
ምንጪ ሓጎሰይ ፍስሃ ናይ ገፀይ
ንሱ ''ዩ ምኽንያቱ ኢየሱስ ጎይታይ

VERSE 5
ምኽንያት ኣይደልን ''ዩ ንምፍቃር ብሕሉፍ ኣይምንንን
ክሳብ ሞት ''ዩ ናቱ ፍቕሪ ከም ናይ ሰብ ኣይኮነን

CHORUS
ምኽንያት ኣለኒ ኣነ ዝዝምረሉ
ብዘይ ምስልካይ ስሙ ዝፅውዓሉ
ምንጪ ሓጎሰይ ፍስሃ ናይ ገፀይ
ንሱ ''ዩ ምኽንያቱ ኢየሱስ ጎይታይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Miኽnyat aleni ane zizmrelu
Bizey mislkay simu zits’walu
Minch’i hagosey fisha nay gets’ey
Nisu ''yu miኽnyatu Iyesus goytay

VERSE 1
Nisu ''yu eti mihiru zeyrbrb
Nisu ''yu nay hiywetey dibab
Nisu ''yu ts’egi ziኾneni
Goyta ''yu wediቐ zeygedfeni

CHORUS
Miኽnyat aleni ane zizmrelu
Bizey mislkay simu zits’walu
Minch’i hagosey fisha nay gets’ey
Nisu ''yu miኽnyatu Iyesus goytay

VERSE 2
Miኽnyat aydeln ''yu nimfqar bihluf aymnnn
Kisab mot ''yu natu fiቕri kem nay seb aykonen
Nisu ''yu mets’haf eday zendede
Nisu ''yu siley zitewarede

CHORUS
Miኽnyat aleni ane zizmrelu
Bizey mislkay simu zits’walu
Minch’i hagosey fisha nay gets’ey
Nisu ''yu miኽnyatu Iyesus goytay

VERSE 3
Nisu ''yu liel zebeleni
Goyta ''yu hiywetu zihabeni
Miኽnyat aydeln ''yu nimfqar bihluf aymnnn
Kisab mot ''yu natu fiቕri kem nay seb aykonen

CHORUS
Miኽnyat aleni ane zizmrelu
Bizey mislkay simu zits’walu
Minch’i hagosey fisha nay gets’ey
Nisu ''yu miኽnyatu Iyesus goytay

VERSE 4
Nisu ''yu midhaney gidi ziblo
Nisu ''yu lieli nefsey ziamno
Nisu ''yu mis sehatku mengedey
Goyta ''nidyu tesfa zeyqorets’e biay

CHORUS
Miኽnyat aleni ane zizmrelu
Bizey mislkay simu zits’walu
Minch’i hagosey fisha nay gets’ey
Nisu ''yu miኽnyatu Iyesus goytay

VERSE 5
Miኽnyat aydeln ''yu nimfqar bihluf aymnnn
Kisab mot ''yu natu fiቕri kem nay seb aykonen

CHORUS
Miኽnyat aleni ane zizmrelu
Bizey mislkay simu zits’walu
Minch’i hagosey fisha nay gets’ey
Nisu ''yu miኽnyatu Iyesus goytay'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nsu-eyu-eritrean-orthodox-tewahdo-mezmur-zemari-bereket-tikue', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Nu BeEgziabher Des Yibelen (nu-be-egziabher-des-yibelen)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 1
ኑ በእግዚአብሔር ኑ በድንግል ደስ ይበለን/2/
የሰማዩን መንግስት እርስቱን ለሰጠን
ከጨለማ አውጥቶ ብርሃንን ላሳየን

VERSE 2
ለዚህ ድንቅ ውለታው ምስጋና ያንሰዋል
በእርሱ ደስ ይበለን ክብር ይገባዋል

VERSE 3
ከአለት ላይ የፈለቀ ውሃ ጠጥተናል
ሰማያዊ መና አምላክ መግቦናል

VERSE 4
ፍቅርህ የበዛልህ ምን ልክፈልህ ጌታ
ስምህን ላመስግነው ከጠዋት እስከማታ

VERSE 5
በቃዴስ በረሃ ምንም በሌለበት
በኤርትራ ባህር ወጀብ በበዛጀት

VERSE 6
ለእርሱ መንገድ አለው ከቶ ምን ተስኖት
ልባችሁ አይፍራ በፍጹም እመኑት

VERSE 7
በባርነት ሳለን በድቅድቅ ዓለም
ብርሃንን አገኘን በድንግል ማርያም

VERSE 8
ያጣነውን ሰላም ዛሬ አገኘን
እጅግ ደስ ይበለን በእመቤታችን

VERSE 9
የሐና የእያቄም የእምነታቸው ፍሬ',
      lyrics_transliteration = 'Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 1
Nu beEgziabher nu bedingil des yibelen (x2)
Yesemayun mengist irstun leseten
Kechelema awt’o birhanen lasayen

VERSE 2
Lezih dinq wuletaw misgana yansawal
Be’ersu des yibelen kibir yigebawal

VERSE 3
Ke’alet lay yefeleqe wuha t’etenal
Semayawi mena Amlak megbonal

VERSE 4
Fiqirh yezalh min likfelh geta
Simhin lamesgnew ket’wat eskemata

VERSE 5
Beqades bereha minim belelebet
Be’ertra bahir wej’eb bebazajet

VERSE 6
Le’ersu menged alew keto min tesnot
Libachihu ayifra befits’um emenut

VERSE 7
Bebarnet salén bedikdik alem
Birhanen agenen bedingil Maryam

VERSE 8
Yat’anewn selam zare agenen
Ijig des yibelen be’emebetachin

VERSE 9
YeHana YeIyaqem ye’emenetachew firé',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nu-be-egziabher-des-yibelen'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 1
ኑ በእግዚአብሔር ኑ በድንግል ደስ ይበለን/2/
የሰማዩን መንግስት እርስቱን ለሰጠን
ከጨለማ አውጥቶ ብርሃንን ላሳየን

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 2
ለዚህ ድንቅ ውለታው ምስጋና ያንሰዋል
በእርሱ ደስ ይበለን ክብር ይገባዋል

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 3
ከአለት ላይ የፈለቀ ውሃ ጠጥተናል
ሰማያዊ መና አምላክ መግቦናል

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 4
ፍቅርህ የበዛልህ ምን ልክፈልህ ጌታ
ስምህን ላመስግነው ከጠዋት እስከማታ

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 5
በቃዴስ በረሃ ምንም በሌለበት
በኤርትራ ባህር ወጀብ በበዛጀት

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 6
ለእርሱ መንገድ አለው ከቶ ምን ተስኖት
ልባችሁ አይፍራ በፍጹም እመኑት

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 7
በባርነት ሳለን በድቅድቅ ዓለም
ብርሃንን አገኘን በድንግል ማርያም

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 8
ያጣነውን ሰላም ዛሬ አገኘን
እጅግ ደስ ይበለን በእመቤታችን

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን

VERSE 9
የሐና የእያቄም የእምነታቸው ፍሬ

CHORUS
ኑ በእግዚአብሔር ደስ ይበለን/2/
ለታላቁ ክብር ለዚህ ላበቃን
ከሞት ወደ ሕይወት ላሸጋገረን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 1
Nu beEgziabher nu bedingil des yibelen (x2)
Yesemayun mengist irstun leseten
Kechelema awt’o birhanen lasayen

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 2
Lezih dinq wuletaw misgana yansawal
Be’ersu des yibelen kibir yigebawal

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 3
Ke’alet lay yefeleqe wuha t’etenal
Semayawi mena Amlak megbonal

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 4
Fiqirh yezalh min likfelh geta
Simhin lamesgnew ket’wat eskemata

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 5
Beqades bereha minim belelebet
Be’ertra bahir wej’eb bebazajet

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 6
Le’ersu menged alew keto min tesnot
Libachihu ayifra befits’um emenut

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 7
Bebarnet salén bedikdik alem
Birhanen agenen bedingil Maryam

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 8
Yat’anewn selam zare agenen
Ijig des yibelen be’emebetachin

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren

VERSE 9
YeHana YeIyaqem ye’emenetachew firé

CHORUS
Nu beEgziabher des yibelen (x2)
Letalaku kibir lezih labekan
Kemot wede hiywet lashagageren'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nu-be-egziabher-des-yibelen', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Nu Bebirhanu Temelalesu (nu-bebirhanu-temelalesu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 1
ሁሉን በሚችል በአምላክ ጥላ
በእረፍት ውሃ ስር አርፈናልና

VERSE 2
ሰላምና ፍቅር ህይወት በሚሰጥ
ወደ ጌታችን እንሂድ እንሩጥ

VERSE 3
ምህረትና ፍርድ በእጁ የያዘው
የሰላም አባት ወድሃኒዓለም ነው

VERSE 4
ህይወት የሆነን በመስቀል ውሎ
ብርሃን ሰጠን ጨለማን ሽሮ

VERSE 5
የሚያስደነግጥ የሚያስጨንቀን
ይጠፋልና እርሱን ተማጽነን

VERSE 6
በቀን ከሚበር ፍላጻ ሁሉ
ይታደገናል በቅዱስ ቃሉ

VERSE 7
እግርህ በድንጋይ እንዳይመታ
በፈተና ውስጥ እንድትበረታ

VERSE 8
መቅሰፍት ከቤትህ እንዲከለከል
ይጠብቅሃል ሌሊትና ቀን

VERSE 9
ስሙን ያወቀ ህይወት መሆኑን
ይመላለሳል ከሃይል ወደ ሃይል

VERSE 10
ረጅም እድሜ ይጠግባል እርሱ
ብርሃን ይሆናል የጸጋ ልብሱ

VERSE 11
አቤቱ አንተ ተስፋ ነህና
የምትመግብ የፍቅር መና

VERSE 12
ማዳንህ እኛን አስደስቶናል
እንዲህ ያለ ክብር ከየት ይገኛል',
      lyrics_transliteration = 'Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 1
Hulun bemichil beAmlak t’ila
Berefit wuha sir arfenalna

VERSE 2
Selamna fiqir hiywet bemiset
Wede getachin enhid enirut

VERSE 3
Mihretna fird be’ijju yeyazew
Yeselam abat Wedhanealem new

VERSE 4
Hiywet yehonen bemeskel wulo
Birhan seten cheleman shiro

VERSE 5
Yemiyasdenegit yemiyaschenk’en
Yit’efalna ersun temats’nen

VERSE 6
Beqen kemiber filatsa hulu
Yit’adeginal beKidus qalu

VERSE 7
Egrh bedingay endetaymeta
Befetena wist endetibereta

VERSE 8
Meqseft kebethih endikellekel
Yit’ebikhal lelitna qen

VERSE 9
Simun yawqe hiywet mehonun
Yimelalesal kehayl wede hayl

VERSE 10
Rejim edme yit’egibal ersu
Birhan yihonal yetsegga libsu

VERSE 11
Abetu ante tesfa nehna
Yemitimegib yefiqir mena

VERSE 12
Madanih enyan asdestonal
Endih yale kibir keyet yigenyal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nu-bebirhanu-temelalesu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 1
ሁሉን በሚችል በአምላክ ጥላ
በእረፍት ውሃ ስር አርፈናልና

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 2
ሰላምና ፍቅር ህይወት በሚሰጥ
ወደ ጌታችን እንሂድ እንሩጥ

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 3
ምህረትና ፍርድ በእጁ የያዘው
የሰላም አባት ወድሃኒዓለም ነው

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 4
ህይወት የሆነን በመስቀል ውሎ
ብርሃን ሰጠን ጨለማን ሽሮ

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 5
የሚያስደነግጥ የሚያስጨንቀን
ይጠፋልና እርሱን ተማጽነን

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 6
በቀን ከሚበር ፍላጻ ሁሉ
ይታደገናል በቅዱስ ቃሉ

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 7
እግርህ በድንጋይ እንዳይመታ
በፈተና ውስጥ እንድትበረታ

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 8
መቅሰፍት ከቤትህ እንዲከለከል
ይጠብቅሃል ሌሊትና ቀን

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 9
ስሙን ያወቀ ህይወት መሆኑን
ይመላለሳል ከሃይል ወደ ሃይል

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 10
ረጅም እድሜ ይጠግባል እርሱ
ብርሃን ይሆናል የጸጋ ልብሱ

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 11
አቤቱ አንተ ተስፋ ነህና
የምትመግብ የፍቅር መና

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ

VERSE 12
ማዳንህ እኛን አስደስቶናል
እንዲህ ያለ ክብር ከየት ይገኛል

CHORUS
ኑ በብርሃኑ ተመላለሱ
የፍቅርን ሕይወት እንድትለብሱ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 1
Hulun bemichil beAmlak t’ila
Berefit wuha sir arfenalna

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 2
Selamna fiqir hiywet bemiset
Wede getachin enhid enirut

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 3
Mihretna fird be’ijju yeyazew
Yeselam abat Wedhanealem new

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 4
Hiywet yehonen bemeskel wulo
Birhan seten cheleman shiro

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 5
Yemiyasdenegit yemiyaschenk’en
Yit’efalna ersun temats’nen

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 6
Beqen kemiber filatsa hulu
Yit’adeginal beKidus qalu

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 7
Egrh bedingay endetaymeta
Befetena wist endetibereta

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 8
Meqseft kebethih endikellekel
Yit’ebikhal lelitna qen

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 9
Simun yawqe hiywet mehonun
Yimelalesal kehayl wede hayl

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 10
Rejim edme yit’egibal ersu
Birhan yihonal yetsegga libsu

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 11
Abetu ante tesfa nehna
Yemitimegib yefiqir mena

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu

VERSE 12
Madanih enyan asdestonal
Endih yale kibir keyet yigenyal

CHORUS
Nu bebirhanu temelalesu
Yefiqirin hiywet endetilebsu'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nu-bebirhanu-temelalesu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Nu Bebirihanu Temelalesu (nu-bebirihanu-temelalesu)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኑ በብርሃኑ ተመላለሱ(2)
የፍቅርን ህይወት እንድትለብሱ
ኑ በብርሃኑ ተመላለሱ
ሁሉን በሚችል በአምላክ ጥላ

VERSE 1
በእረፍት ውኃ ስር አርፈናልና
ሰላምና ፍቅር ሕይወት የሚሰጥ
ወደ ጌታችን እንሂድ እንሩጥ
አዝ…

VERSE 2
ምህረትና ፍርደበእጁ የያዘው
የሰላም አባት መድኃኒዓለም ነው
ሕይወት የሆነን በመስቀል ውሎ
ብርሃን ሰጠን ጨለማን ሽሮ

VERSE 3
አዝ…
የሚያስደነግጥ የሚያስጨንቀን
ያልፋልና እርሱን ተማጽነን
ፍቅር ከሚገል ፍላፃ ሆኖ

VERSE 4
ይታደገናል በቅዱስ ቃሉ
አዝ…
እግርህ በድንጋይ እንዳይመታ
በፈተና ውስጥ እንድትበረታ

VERSE 5
መቅሰፍት ከቤትህ እንድከለከል
ይጠብቅሀል ሌሊትና ቀን
አዝ…
ስሙን ያወቀ ሕይወት መሆኑን

VERSE 6
ይመላለሳል ከኃይል ወደ ኃይል
ረጅም እድሜ ይጠግባል እርሱ
ብርሃን ይሆናል የፀጋ ልብስ
አዝ…

VERSE 7
አቤቱ አንተ ተስፋ ነህና
የምትመግብ የፍቅር መና
ማዳንን እኛን አስደስቶናል
እንዲህ ያለ ክብር ከየት ይገኛል',
      lyrics_transliteration = NULL,
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nu-bebirihanu-temelalesu'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኑ በብርሃኑ ተመላለሱ(2)
የፍቅርን ህይወት እንድትለብሱ
ኑ በብርሃኑ ተመላለሱ
ሁሉን በሚችል በአምላክ ጥላ

VERSE 1
በእረፍት ውኃ ስር አርፈናልና
ሰላምና ፍቅር ሕይወት የሚሰጥ
ወደ ጌታችን እንሂድ እንሩጥ
አዝ…

CHORUS
ኑ በብርሃኑ ተመላለሱ(2)
የፍቅርን ህይወት እንድትለብሱ
ኑ በብርሃኑ ተመላለሱ
ሁሉን በሚችል በአምላክ ጥላ

VERSE 2
ምህረትና ፍርደበእጁ የያዘው
የሰላም አባት መድኃኒዓለም ነው
ሕይወት የሆነን በመስቀል ውሎ
ብርሃን ሰጠን ጨለማን ሽሮ

CHORUS
ኑ በብርሃኑ ተመላለሱ(2)
የፍቅርን ህይወት እንድትለብሱ
ኑ በብርሃኑ ተመላለሱ
ሁሉን በሚችል በአምላክ ጥላ

VERSE 3
አዝ…
የሚያስደነግጥ የሚያስጨንቀን
ያልፋልና እርሱን ተማጽነን
ፍቅር ከሚገል ፍላፃ ሆኖ

CHORUS
ኑ በብርሃኑ ተመላለሱ(2)
የፍቅርን ህይወት እንድትለብሱ
ኑ በብርሃኑ ተመላለሱ
ሁሉን በሚችል በአምላክ ጥላ

VERSE 4
ይታደገናል በቅዱስ ቃሉ
አዝ…
እግርህ በድንጋይ እንዳይመታ
በፈተና ውስጥ እንድትበረታ

CHORUS
ኑ በብርሃኑ ተመላለሱ(2)
የፍቅርን ህይወት እንድትለብሱ
ኑ በብርሃኑ ተመላለሱ
ሁሉን በሚችል በአምላክ ጥላ

VERSE 5
መቅሰፍት ከቤትህ እንድከለከል
ይጠብቅሀል ሌሊትና ቀን
አዝ…
ስሙን ያወቀ ሕይወት መሆኑን

CHORUS
ኑ በብርሃኑ ተመላለሱ(2)
የፍቅርን ህይወት እንድትለብሱ
ኑ በብርሃኑ ተመላለሱ
ሁሉን በሚችል በአምላክ ጥላ

VERSE 6
ይመላለሳል ከኃይል ወደ ኃይል
ረጅም እድሜ ይጠግባል እርሱ
ብርሃን ይሆናል የፀጋ ልብስ
አዝ…

CHORUS
ኑ በብርሃኑ ተመላለሱ(2)
የፍቅርን ህይወት እንድትለብሱ
ኑ በብርሃኑ ተመላለሱ
ሁሉን በሚችል በአምላክ ጥላ

VERSE 7
አቤቱ አንተ ተስፋ ነህና
የምትመግብ የፍቅር መና
ማዳንን እኛን አስደስቶናል
እንዲህ ያለ ክብር ከየት ይገኛል

CHORUS
ኑ በብርሃኑ ተመላለሱ(2)
የፍቅርን ህይወት እንድትለብሱ
ኑ በብርሃኑ ተመላለሱ
ሁሉን በሚችል በአምላክ ጥላ'
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nu-bebirihanu-temelalesu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Nu Beegiziabiher Des Yibeleni, Dinik Adigolignal , Giyorigis Hayal (nu-beegiziabiher-des-yibeleni-dinik-adigolignal-giyorigis-hayal)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 1
ድንቅ አድርጎልኛል ወደቤቱ ጠራኝ
ድንቅ አድርጎልኛል ረክሼ ሳለሁ
ድንቅ አድርጎልኛል ልጄ ሆይ ና አለኝ
ድንቅ አድርጎልኛል በዳግም ምጻቱ

VERSE 2
ድንቅ አድርጎልኛል መንግስቱን ሊያወርሰኝ
አ.ዝ
ድንቅ አድርጎልኛል ከአንበሳ መንጋጋ
ድንቅ አድርጎልኛል ከጉድጓድ አወጣኝ

VERSE 3
ድንቅ አድርጎልኛል በጠላቶቼ ፊት
ድንቅ አድርጎልኛል ግርማ ሞገስ ሰጠኝ
ድንቅ አድርጎልኛል ምን እመልሳለሁ
ድንቅ አድርጎልኛል እንዲ ለወደደኝ

VERSE 4
አ.ዝ
ድንቅ አድርጎልኛል ጠላቶቼ ሁሉ
ድንቅ አድርጎልኛል ሲጓደዱብኝ
ድንቅ አድርጎልኛል ማን ይደርስለታል

VERSE 5
ድንቅ አድርጎልኛል እያሉ ሲሉኝ
ድንቅ አድርጎልኛል ፈጥነህ ደረስክልኝ
ድንቅ አድርጎልኛል ከሞት አዳንከኝ',
      lyrics_transliteration = 'Dinq adrgolgnal yeserawit Geta (2)
Alresagnm amlak anesagn ketbiya (2)
A.z
Dinq adrgolgnal bedelen sayqot’r

VERSE 1
Dinq adrgolgnal wedebetu t’eragn
Dinq adrgolgnal rekshe salehu
Dinq adrgolgnal lije hoy na alegn
Dinq adrgolgnal bedagm mits’atu

VERSE 2
Dinq adrgolgnal mengstun liyawersegn
A.z
Dinq adrgolgnal keanbesa mengaga
Dinq adrgolgnal kegudgwad awet’agn

VERSE 3
Dinq adrgolgnal bet’elatoche fit
Dinq adrgolgnal girma moges set’egn
Dinq adrgolgnal min emelsalehu
Dinq adrgolgnal endi lewededegn

VERSE 4
A.z
Dinq adrgolgnal t’elatoche hulu
Dinq adrgolgnal sigwadedubgn
Dinq adrgolgnal man yidersletal

VERSE 5
Dinq adrgolgnal eyalu silugn
Dinq adrgolgnal fet’neh deresklgn
Dinq adrgolgnal kemot adankegn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nu-beegiziabiher-des-yibeleni-dinik-adigolignal-giyorigis-hayal'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 1
ድንቅ አድርጎልኛል ወደቤቱ ጠራኝ
ድንቅ አድርጎልኛል ረክሼ ሳለሁ
ድንቅ አድርጎልኛል ልጄ ሆይ ና አለኝ
ድንቅ አድርጎልኛል በዳግም ምጻቱ

CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 2
ድንቅ አድርጎልኛል መንግስቱን ሊያወርሰኝ
አ.ዝ
ድንቅ አድርጎልኛል ከአንበሳ መንጋጋ
ድንቅ አድርጎልኛል ከጉድጓድ አወጣኝ

CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 3
ድንቅ አድርጎልኛል በጠላቶቼ ፊት
ድንቅ አድርጎልኛል ግርማ ሞገስ ሰጠኝ
ድንቅ አድርጎልኛል ምን እመልሳለሁ
ድንቅ አድርጎልኛል እንዲ ለወደደኝ

CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 4
አ.ዝ
ድንቅ አድርጎልኛል ጠላቶቼ ሁሉ
ድንቅ አድርጎልኛል ሲጓደዱብኝ
ድንቅ አድርጎልኛል ማን ይደርስለታል

CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር

VERSE 5
ድንቅ አድርጎልኛል እያሉ ሲሉኝ
ድንቅ አድርጎልኛል ፈጥነህ ደረስክልኝ
ድንቅ አድርጎልኛል ከሞት አዳንከኝ

CHORUS
ድንቅ አድርጎልኛል የሠራዊት ጌታ (2)
አልረሳኝም አምላክ አነሳኝ ከትቢያ (2)
አ.ዝ
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dinq adrgolgnal yeserawit Geta (2)
Alresagnm amlak anesagn ketbiya (2)
A.z
Dinq adrgolgnal bedelen sayqot’r

VERSE 1
Dinq adrgolgnal wedebetu t’eragn
Dinq adrgolgnal rekshe salehu
Dinq adrgolgnal lije hoy na alegn
Dinq adrgolgnal bedagm mits’atu

CHORUS
Dinq adrgolgnal yeserawit Geta (2)
Alresagnm amlak anesagn ketbiya (2)
A.z
Dinq adrgolgnal bedelen sayqot’r

VERSE 2
Dinq adrgolgnal mengstun liyawersegn
A.z
Dinq adrgolgnal keanbesa mengaga
Dinq adrgolgnal kegudgwad awet’agn

CHORUS
Dinq adrgolgnal yeserawit Geta (2)
Alresagnm amlak anesagn ketbiya (2)
A.z
Dinq adrgolgnal bedelen sayqot’r

VERSE 3
Dinq adrgolgnal bet’elatoche fit
Dinq adrgolgnal girma moges set’egn
Dinq adrgolgnal min emelsalehu
Dinq adrgolgnal endi lewededegn

CHORUS
Dinq adrgolgnal yeserawit Geta (2)
Alresagnm amlak anesagn ketbiya (2)
A.z
Dinq adrgolgnal bedelen sayqot’r

VERSE 4
A.z
Dinq adrgolgnal t’elatoche hulu
Dinq adrgolgnal sigwadedubgn
Dinq adrgolgnal man yidersletal

CHORUS
Dinq adrgolgnal yeserawit Geta (2)
Alresagnm amlak anesagn ketbiya (2)
A.z
Dinq adrgolgnal bedelen sayqot’r

VERSE 5
Dinq adrgolgnal eyalu silugn
Dinq adrgolgnal fet’neh deresklgn
Dinq adrgolgnal kemot adankegn

CHORUS
Dinq adrgolgnal yeserawit Geta (2)
Alresagnm amlak anesagn ketbiya (2)
A.z
Dinq adrgolgnal bedelen sayqot’r'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nu-beegiziabiher-des-yibeleni-dinik-adigolignal-giyorigis-hayal', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Nu Ena ... Bezemari Besufikad Anidarigachew (nu-ena-bezemari-besufikad-anidarigachew)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 1
አየ አሸተተ ከሰማያት ሆኖ
አምላክ የሚያድርበት ንጹህ ሰው ፈልጎ
ከፍጥረቱ ሁሉ አገኘ ድንግልን
ክብር ለምትሆን ዘምር ለእናታችን

VERSE 2
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
ሰላምታዋ ፅንስን ያዘልላልና

VERSE 3
እንዴት ዝም እላለሁ ናትና ገናና
ማለፊያ የልቤ መዝገያ ለችግሬ
መቼ እጠግብና ለእናቴ ዘምሬ
እናቴ ማርያም ክብሬ

VERSE 4
ልስጥሽ ለስምሽ ዝማሬ
እንቁም ለእናታችን ወገኔ ተነሳ
በፀጋ እንክበር እጃችን ይነሳ

VERSE 5
ፍቅሯን የቀመሰ መቼ ይጠግብና
ከልቡ ይዘምራል ብሩክት ናትና
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ

VERSE 6
ባታመስግናት ምስጉን ናት እናቱ
እረፍት እንድታገኝ ዘምር ለንግስቱ
በምጥ ስትሰቃይ ደርሳላት በክብር

VERSE 7
ልጅ የያዘች እናት ታየች ስትዘምር
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ

VERSE 8
የእመቤታችን ሁሉ ክብሯ እኮ ነው
ትውልዱ ያመስግን ለእናቱ ለጌታው
ፀጋን የተመላሽ ይበል በደስታ
እልልታው ይስማ ከብሮም ይመታ

VERSE 9
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ',
      lyrics_transliteration = 'Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 1
Aye ashetete kesemayat hono
Amlak yemiyadrbet nits’uh sew felgo
Keft’retu hulu agegne dingln
Kibir lemthon zemr leenatachn

VERSE 2
Enate Maryam kibre
List’sh lesmsh zimare
Selamtawa ts’nsn yazellalna

VERSE 3
Endet zim elalehu natna genana
Malefiya yelbe mezgeya lechgre
Meche et’egbna leenate zemre
Enate Maryam kibre

VERSE 4
List’sh lesmsh zimare
Enqum leenatachn wegene tenesa
Bets’ega enkber ejachn yinesa

VERSE 5
Fiqrwan yeqemese meche yit’egbna
Kelbu yizemral birukt natna
Enate Maryam kibre
List’sh lesmsh zimare

VERSE 6
Batamesgnat misgun nat enatu
Ereft endtagegn zemr lengstu
Bemt’ sitseqay dersalat bekbr

VERSE 7
Lij yeyazech enat tayech sitzemr
Enate Maryam kibre
List’sh lesmsh zimare

VERSE 8
Yeemebetachn hulu kibrwa eko new
Tiwldu yamesgn leenatu legetaw
Ts’egan yetemelash yibel bedesta
Elltaw yisma kebrom yimeta

VERSE 9
Enate Maryam kibre
List’sh lesmsh zimare',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nu-ena-bezemari-besufikad-anidarigachew'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 1
አየ አሸተተ ከሰማያት ሆኖ
አምላክ የሚያድርበት ንጹህ ሰው ፈልጎ
ከፍጥረቱ ሁሉ አገኘ ድንግልን
ክብር ለምትሆን ዘምር ለእናታችን

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 2
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ
ሰላምታዋ ፅንስን ያዘልላልና

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 3
እንዴት ዝም እላለሁ ናትና ገናና
ማለፊያ የልቤ መዝገያ ለችግሬ
መቼ እጠግብና ለእናቴ ዘምሬ
እናቴ ማርያም ክብሬ

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 4
ልስጥሽ ለስምሽ ዝማሬ
አዝ
እንቁም ለእናታችን ወገኔ ተነሳ
በፀጋ እንክበር እጃችን ይነሳ

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 5
ፍቅሯን የቀመሰ መቼ ይጠግብና
ከልቡ ይዘምራል ብሩክት ናትና
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 6
አዝ
ባታመስግናት ምስጉን ናት እናቱ
እረፍት እንድታገኝ ዘምር ለንግስቱ
በምጥ ስትሰቃይ ደርሳላት በክብር

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 7
ልጅ የያዘች እናት ታየች ስትዘምር
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 8
የእመቤታችን ሁሉ ክብሯ እኮ ነው
ትውልዱ ያመስግን ለእናቱ ለጌታው
ፀጋን የተመላሽ ይበል በደስታ
እልልታው ይስማ ከብሮም ይመታ

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ

VERSE 9
እናቴ ማርያም ክብሬ
ልስጥሽ ለስምሽ ዝማሬ
አዝ

CHORUS
ኑ እና ማርያምን እናመስግናት
እድለኝነት ነው ከልጇ መሰጠት
ያመሰግናታል ለክብር የተጠራ
ሲያበራ ይኖራል ሲዘምር ለክብሯ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 1
Aye ashetete kesemayat hono
Amlak yemiyadrbet nits’uh sew felgo
Keft’retu hulu agegne dingln
Kibir lemthon zemr leenatachn

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 2
Enate Maryam kibre
List’sh lesmsh zimare
CHORUS
Selamtawa ts’nsn yazellalna

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 3
Endet zim elalehu natna genana
Malefiya yelbe mezgeya lechgre
Meche et’egbna leenate zemre
Enate Maryam kibre

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 4
List’sh lesmsh zimare
CHORUS
Enqum leenatachn wegene tenesa
Bets’ega enkber ejachn yinesa

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 5
Fiqrwan yeqemese meche yit’egbna
Kelbu yizemral birukt natna
Enate Maryam kibre
List’sh lesmsh zimare

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 6
CHORUS
Batamesgnat misgun nat enatu
Ereft endtagegn zemr lengstu
Bemt’ sitseqay dersalat bekbr

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 7
Lij yeyazech enat tayech sitzemr
Enate Maryam kibre
List’sh lesmsh zimare
CHORUS

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 8
Yeemebetachn hulu kibrwa eko new
Tiwldu yamesgn leenatu legetaw
Ts’egan yetemelash yibel bedesta
Elltaw yisma kebrom yimeta

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa

VERSE 9
Enate Maryam kibre
List’sh lesmsh zimare
CHORUS

CHORUS
Nu ena Maryamn enamesgnat
Edlegnnet new keljwa meset’et
Yamesegnatal lekbr yetet’era
Siyabera yinoral sizemr lekbrwa'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nu-ena-bezemari-besufikad-anidarigachew', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Nu Enamesegen Bezimare Be''ililta (nu-enamesegen-bezimare)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኑ እናመስግን በዝማሬ በእልልታ
ጠላት ዲያብሎስን በሞቱ የረታ
ከእኛ ጋር ነውና የሠራዊት ጌታ /፪/

VERSE 1
ጨለማው ኑሮ የስደት ሕይወት
በእግዚአብሔር ፍቅር ብርሃን በራበት
ባርነት ቀርቶ ነፃነት ወጣን
ልመናችንን እግዚአብሔር ሰማን

VERSE 2
መሰናክሉን ክፉውን ፈተና
አልፈነው መጣን በአምላክ ጐዳና
አምላክ ከእኛ ጋር ስለነበረ
ዲያብሎስ አፍሮ ተዋርዶ ቀረ

VERSE 3
የሚያስጨንቀን ዛሬ ተፈታ
የሕዝቡን እንባ አበሰ ጌታ
በምሕረቱ ስለጎበኘን
አምላካችንን ኑ እናመስግን',
      lyrics_transliteration = 'nu namesgn bezmare bellta
telat diyablosn bemotu yereta
kenya gar newna yeserawit geta //

VERSE 1
chelemaw nuro yesdet hywet
begziebher fqr brhan berabet
barnet qerto netsanet wetan
lmenachnn gziebher seman

VERSE 2
mesenaklun kfuwn fetena
elfenew metan beemlak dana
emlak kenya gar slenebere
diyablos efro tewardo qere

VERSE 3
yemiyaschenqen zare tefeta
yehzbun nba ebese geta
bemhretu slegobenyen
emlakachnn nu namesgn',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'nu-enamesegen-bezimare'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኑ እናመስግን በዝማሬ በእልልታ
ጠላት ዲያብሎስን በሞቱ የረታ
ከእኛ ጋር ነውና የሠራዊት ጌታ /፪/

VERSE 1
ጨለማው ኑሮ የስደት ሕይወት
በእግዚአብሔር ፍቅር ብርሃን በራበት
ባርነት ቀርቶ ነፃነት ወጣን
ልመናችንን እግዚአብሔር ሰማን

CHORUS
ኑ እናመስግን በዝማሬ በእልልታ
ጠላት ዲያብሎስን በሞቱ የረታ
ከእኛ ጋር ነውና የሠራዊት ጌታ /፪/

VERSE 2
መሰናክሉን ክፉውን ፈተና
አልፈነው መጣን በአምላክ ጐዳና
አምላክ ከእኛ ጋር ስለነበረ
ዲያብሎስ አፍሮ ተዋርዶ ቀረ

CHORUS
ኑ እናመስግን በዝማሬ በእልልታ
ጠላት ዲያብሎስን በሞቱ የረታ
ከእኛ ጋር ነውና የሠራዊት ጌታ /፪/

VERSE 3
የሚያስጨንቀን ዛሬ ተፈታ
የሕዝቡን እንባ አበሰ ጌታ
በምሕረቱ ስለጎበኘን
አምላካችንን ኑ እናመስግን

CHORUS
ኑ እናመስግን በዝማሬ በእልልታ
ጠላት ዲያብሎስን በሞቱ የረታ
ከእኛ ጋር ነውና የሠራዊት ጌታ /፪/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
nu namesgn bezmare bellta
telat diyablosn bemotu yereta
kenya gar newna yeserawit geta //

VERSE 1
chelemaw nuro yesdet hywet
begziebher fqr brhan berabet
barnet qerto netsanet wetan
lmenachnn gziebher seman

CHORUS
nu namesgn bezmare bellta
telat diyablosn bemotu yereta
kenya gar newna yeserawit geta //

VERSE 2
mesenaklun kfuwn fetena
elfenew metan beemlak dana
emlak kenya gar slenebere
diyablos efro tewardo qere

CHORUS
nu namesgn bezmare bellta
telat diyablosn bemotu yereta
kenya gar newna yeserawit geta //

VERSE 3
yemiyaschenqen zare tefeta
yehzbun nba ebese geta
bemhretu slegobenyen
emlakachnn nu namesgn

CHORUS
nu namesgn bezmare bellta
telat diyablosn bemotu yereta
kenya gar newna yeserawit geta //'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nu-enamesegen-bezimare', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Nu Lemesgana Zemari Kesis Mindaye Berhanu (nu-lemesgana-zemari-kesis-mindaye-berhanu)
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
  WHERE slug = 'nu-lemesgana-zemari-kesis-mindaye-berhanu'
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
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'nu-lemesgana-zemari-kesis-mindaye-berhanu', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: O Egiziabiher Ab (o-egiziabiher-ab)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ኦ እግዚአብሔር አብ አኃዜ ኩሉ መሐረነ ኦ ወልድ ዋህድ ኢየሱስ ክርስቶስ ተሣሃለነ /፪/
ኦ ጰራቅሊጦስ መንፈሰ ጽድቅ ሥረይ /፪/ ለነ ሀሉ ምስሌነ /፪/

VERSE 1
ኦ እግዚአብሔር አብ አኃዜ ኩሉ መሐረነ ኦ ወልድ ዋህድ ኢየሱስ ክርስቶስ ተሣሃለነ /፪/
ኦ ጰራቅሊጦስ መንፈሰ ጽድቅ ሥረይ /፪/ ለነ ሀሉ ምስሌነ /፪/',
      lyrics_transliteration = 'O Egziabher Ab ahaze kulu meherene o Weld wahd Iyesus Kristos tesahalene (2)
O p’eraqlit’os menfese ts’dq sirey (2) lene helu mislene (2)

VERSE 1
O Egziabher Ab ahaze kulu meherene o Weld wahd Iyesus Kristos tesahalene (2)
O p’eraqlit’os menfese ts’dq sirey (2) lene helu mislene (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'o-egiziabiher-ab'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኦ እግዚአብሔር አብ አኃዜ ኩሉ መሐረነ ኦ ወልድ ዋህድ ኢየሱስ ክርስቶስ ተሣሃለነ /፪/
ኦ ጰራቅሊጦስ መንፈሰ ጽድቅ ሥረይ /፪/ ለነ ሀሉ ምስሌነ /፪/

VERSE 1
ኦ እግዚአብሔር አብ አኃዜ ኩሉ መሐረነ ኦ ወልድ ዋህድ ኢየሱስ ክርስቶስ ተሣሃለነ /፪/
ኦ ጰራቅሊጦስ መንፈሰ ጽድቅ ሥረይ /፪/ ለነ ሀሉ ምስሌነ /፪/

CHORUS
ኦ እግዚአብሔር አብ አኃዜ ኩሉ መሐረነ ኦ ወልድ ዋህድ ኢየሱስ ክርስቶስ ተሣሃለነ /፪/
ኦ ጰራቅሊጦስ መንፈሰ ጽድቅ ሥረይ /፪/ ለነ ሀሉ ምስሌነ /፪/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
O Egziabher Ab ahaze kulu meherene o Weld wahd Iyesus Kristos tesahalene (2)
O p’eraqlit’os menfese ts’dq sirey (2) lene helu mislene (2)

VERSE 1
O Egziabher Ab ahaze kulu meherene o Weld wahd Iyesus Kristos tesahalene (2)
O p’eraqlit’os menfese ts’dq sirey (2) lene helu mislene (2)

CHORUS
O Egziabher Ab ahaze kulu meherene o Weld wahd Iyesus Kristos tesahalene (2)
O p’eraqlit’os menfese ts’dq sirey (2) lene helu mislene (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'o-egiziabiher-ab', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: O Fitune Rediet Leberutawit Yederese (o-fitune-rediet-leberutawit-yederese)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 1
ስጋው ሲመተር አልፈራም እሱ
ሰባት አክሊላት ጭኗል በራሱ
በደብረ ይድራስ በዛ ተራራ
የልዳው ፀሐይ ተብሎ ተጠራ

VERSE 2
አለምን ስትዞር በነጭ ፈረስ
አንድ ጊዜ እርዳኝ ጊዮርጊስ ድረስ
ስሙን ለጠራ አምላከ ጊዮርጊስ
ስደርስ ይፈጥናል ከአውሎ ነፋስ

VERSE 3
ለእሳት ለግለት ስጋውን ሲሰጥ
ፍርሃት የለበት ወይም መደንገጥ
ኡዲያኖስ አፍሮ ጣኦት ወደቀ
በጊዮርጊስ ፅናት ጌታ ታወቀ

VERSE 4
ከሹመት ይልቅ መርጠህ መከራ
ወንጌሉን ሰበክ አንዳች ሳትፈራ
በጭንቀት ሆነ ላንተ ንግስት
ብድራትህን አይተሃል እና

VERSE 5
መስተጋድል ነህ ሃያል ገናና
መክብበ ሰማዕት የእምነት ጀግና
ስምክን ስጠራ ከቤትህ ቆሜ
ይቀልልኛል የኃጥያት ሸክሜ',
      lyrics_transliteration = 'Leberutawit yederese
Semaetu Giyorgis gesegese
Fet’no liyawet’agn kemekera
Qomwal kegone kene gara

VERSE 1
Sigaw simeter alferam esu
Sebat aklilat ch’nwal berasu
Bedebre yidras beza terara
Yeldaw ts’ehey teblo tet’era

VERSE 2
Alemn sitzor benech’ feres
And gize erdagn Giyorgis dires
Simun let’era amlake Giyorgis
Siders yifet’nal keawlo nefas

VERSE 3
Leesat leglet sigawn siset’
Firhat yelebet weym medenget’
Udiyanos afro t’aot wedeqe
Begiyorgis ts’nat Geta taweqe

VERSE 4
Keshumet yilq mert’eh mekera
Wengelun sebek andach satfera
Bech’nqet hone lante nigst
Bidrathn aytehal ena

VERSE 5
Mestegadl neh hayal genana
Mekbbe semaet yeemnet jegna
Simkn sit’era kebeth qome
Yiqellgnal yehat’yat shekme',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'o-fitune-rediet-leberutawit-yederese'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 1
ስጋው ሲመተር አልፈራም እሱ
ሰባት አክሊላት ጭኗል በራሱ
በደብረ ይድራስ በዛ ተራራ
የልዳው ፀሐይ ተብሎ ተጠራ

CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 2
አለምን ስትዞር በነጭ ፈረስ
አንድ ጊዜ እርዳኝ ጊዮርጊስ ድረስ
ስሙን ለጠራ አምላከ ጊዮርጊስ
ስደርስ ይፈጥናል ከአውሎ ነፋስ

CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 3
ለእሳት ለግለት ስጋውን ሲሰጥ
ፍርሃት የለበት ወይም መደንገጥ
ኡዲያኖስ አፍሮ ጣኦት ወደቀ
በጊዮርጊስ ፅናት ጌታ ታወቀ

CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 4
ከሹመት ይልቅ መርጠህ መከራ
ወንጌሉን ሰበክ አንዳች ሳትፈራ
በጭንቀት ሆነ ላንተ ንግስት
ብድራትህን አይተሃል እና

CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ

VERSE 5
መስተጋድል ነህ ሃያል ገናና
መክብበ ሰማዕት የእምነት ጀግና
ስምክን ስጠራ ከቤትህ ቆሜ
ይቀልልኛል የኃጥያት ሸክሜ

CHORUS
ለቤሩታዊት የደረሰ
ሰማዕቱ ጊዮርጊስ ገሰገሰ
ፈጥኖ ሊያወጣኝ ከመከራ
ቆሟል ከጎኔ ከኔ ጋራ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Leberutawit yederese
Semaetu Giyorgis gesegese
Fet’no liyawet’agn kemekera
Qomwal kegone kene gara

VERSE 1
Sigaw simeter alferam esu
Sebat aklilat ch’nwal berasu
Bedebre yidras beza terara
Yeldaw ts’ehey teblo tet’era

CHORUS
Leberutawit yederese
Semaetu Giyorgis gesegese
Fet’no liyawet’agn kemekera
Qomwal kegone kene gara

VERSE 2
Alemn sitzor benech’ feres
And gize erdagn Giyorgis dires
Simun let’era amlake Giyorgis
Siders yifet’nal keawlo nefas

CHORUS
Leberutawit yederese
Semaetu Giyorgis gesegese
Fet’no liyawet’agn kemekera
Qomwal kegone kene gara

VERSE 3
Leesat leglet sigawn siset’
Firhat yelebet weym medenget’
Udiyanos afro t’aot wedeqe
Begiyorgis ts’nat Geta taweqe

CHORUS
Leberutawit yederese
Semaetu Giyorgis gesegese
Fet’no liyawet’agn kemekera
Qomwal kegone kene gara

VERSE 4
Keshumet yilq mert’eh mekera
Wengelun sebek andach satfera
Bech’nqet hone lante nigst
Bidrathn aytehal ena

CHORUS
Leberutawit yederese
Semaetu Giyorgis gesegese
Fet’no liyawet’agn kemekera
Qomwal kegone kene gara

VERSE 5
Mestegadl neh hayal genana
Mekbbe semaet yeemnet jegna
Simkn sit’era kebeth qome
Yiqellgnal yehat’yat shekme

CHORUS
Leberutawit yederese
Semaetu Giyorgis gesegese
Fet’no liyawet’agn kemekera
Qomwal kegone kene gara'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'o-fitune-rediet-leberutawit-yederese', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: O Kidus Mikael (o-kidus-mikael)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)

VERSE 1
እረቂቁ መላዕክ መብረቅ ተጎናጽፏል
ለሰማይ ሰራዊት አለቃቸው ሆኗል
የምክሩ አበጋዝ ስሙ የተፈራ
እሱ ነው ሚካኤል ለሕዝቡ የሚራራ (2)

VERSE 2
እግዚአብሔር ኃይሉን የሚገልፅበት
ፀሎት የሚያሳርግ የሚያሰጥ ምህረት
ስለ ትህትናው ከአምላክ የተሾመው
ቅሩበ እግዚአብሔር ቅዱስ ሚካኤል ነው (2)

VERSE 3
እርህሩ ነው እና የነፍሳችን ወዳጅ
ለፍጥረቱ ሁሉ የታመነ አማላጅ
ከቅጥረ ፀሎቱ ነፍሳችን ትጠጋ
ተግቶ እንዲጠብቀን ሲመሽም ሲነጋ (2)

VERSE 4
የነፀብራቅ ዝናር ሚካኤል ታጠቀ
በቅድመ እግዚአብሔር ሕዝቡን አስታረቀ
በእሳታዊው አክናፍ ከክፉ ጋረደ
ልጆቹን ሊባርክ ሚካኤል ወረደ (2)',
      lyrics_transliteration = 'Mikael beamlaku beEgziabher fit qomwal
Letech’eneqech nefs mihret yilemnal
Ch’elemaw endishesh endihon birhan
O Kidus Mikael sealene enbel (2)

VERSE 1
Ereqiqu melaek mebreq tegonats’fwal
Lesemay serawit aleqachew honwal
Yemkru abegaz simu yetefera
Esu new Mikael lehzbu yemirara (2)

VERSE 2
Egziabher haylun yemigelts’bet
Ts’elot yemiyasarg yemiyaset’ mihret
Sile tihtnaw keamlak yeteshomew
Qirube Egziabher Kidus Mikael new (2)

VERSE 3
Erhru new ena yenefsachn wedaj
Left’retu hulu yetamene amalaj
Keqt’re ts’elotu nefsachn tit’ega
Tegto endit’ebqen simeshm sinega (2)

VERSE 4
Yenets’ebraq zinar Mikael tat’eqe
Beqdme Egziabher hizbun astareqe
Beesatawiw aknaf kekfu garede
Lijochun libark Mikael werede (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'o-kidus-mikael'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)

VERSE 1
እረቂቁ መላዕክ መብረቅ ተጎናጽፏል
ለሰማይ ሰራዊት አለቃቸው ሆኗል
የምክሩ አበጋዝ ስሙ የተፈራ
እሱ ነው ሚካኤል ለሕዝቡ የሚራራ (2)

CHORUS
ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)

VERSE 2
እግዚአብሔር ኃይሉን የሚገልፅበት
ፀሎት የሚያሳርግ የሚያሰጥ ምህረት
ስለ ትህትናው ከአምላክ የተሾመው
ቅሩበ እግዚአብሔር ቅዱስ ሚካኤል ነው (2)

CHORUS
ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)

VERSE 3
እርህሩ ነው እና የነፍሳችን ወዳጅ
ለፍጥረቱ ሁሉ የታመነ አማላጅ
ከቅጥረ ፀሎቱ ነፍሳችን ትጠጋ
ተግቶ እንዲጠብቀን ሲመሽም ሲነጋ (2)

CHORUS
ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)

VERSE 4
የነፀብራቅ ዝናር ሚካኤል ታጠቀ
በቅድመ እግዚአብሔር ሕዝቡን አስታረቀ
በእሳታዊው አክናፍ ከክፉ ጋረደ
ልጆቹን ሊባርክ ሚካኤል ወረደ (2)

CHORUS
ሚካኤል በአምላኩ በእግዚአብሔር ፊት ቆሟል
ለተጨነቀች ነፍስ ምህረት ይለምናል
ጨለማው እንዲሸሽ እንዲሆን ብርሃን
ኦ ቅዱስ ሚካኤል ሰዓለነ እንበል (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mikael beamlaku beEgziabher fit qomwal
Letech’eneqech nefs mihret yilemnal
Ch’elemaw endishesh endihon birhan
O Kidus Mikael sealene enbel (2)

VERSE 1
Ereqiqu melaek mebreq tegonats’fwal
Lesemay serawit aleqachew honwal
Yemkru abegaz simu yetefera
Esu new Mikael lehzbu yemirara (2)

CHORUS
Mikael beamlaku beEgziabher fit qomwal
Letech’eneqech nefs mihret yilemnal
Ch’elemaw endishesh endihon birhan
O Kidus Mikael sealene enbel (2)

VERSE 2
Egziabher haylun yemigelts’bet
Ts’elot yemiyasarg yemiyaset’ mihret
Sile tihtnaw keamlak yeteshomew
Qirube Egziabher Kidus Mikael new (2)

CHORUS
Mikael beamlaku beEgziabher fit qomwal
Letech’eneqech nefs mihret yilemnal
Ch’elemaw endishesh endihon birhan
O Kidus Mikael sealene enbel (2)

VERSE 3
Erhru new ena yenefsachn wedaj
Left’retu hulu yetamene amalaj
Keqt’re ts’elotu nefsachn tit’ega
Tegto endit’ebqen simeshm sinega (2)

CHORUS
Mikael beamlaku beEgziabher fit qomwal
Letech’eneqech nefs mihret yilemnal
Ch’elemaw endishesh endihon birhan
O Kidus Mikael sealene enbel (2)

VERSE 4
Yenets’ebraq zinar Mikael tat’eqe
Beqdme Egziabher hizbun astareqe
Beesatawiw aknaf kekfu garede
Lijochun libark Mikael werede (2)

CHORUS
Mikael beamlaku beEgziabher fit qomwal
Letech’eneqech nefs mihret yilemnal
Ch’elemaw endishesh endihon birhan
O Kidus Mikael sealene enbel (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'o-kidus-mikael', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: O My Savior I Can Do All Through You (o-my-savior-i-can-do-all-through-you)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Medhanialem yelem yemesanew
Ammanual yelem yemesanew
Ersu kal seenager teraraw medanew
Medhanialem yelem yemesanew',
      lyrics_english = 'O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 1
Medhanialem yelem yemesanew
Ammanual yelem yemesanew
Ersu Kal Seenager Teraraw medanew
Medhanialem yelem yemesanew

VERSE 2
I never thought I could pass this adversity
My bed was drenched with tears, as they rolled down my cheeks
His strength is made perfect, in the face of weakness
I passed through rough waters,  my burden became less

VERSE 3
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 4
He’s the crown of my home, Advisor to my plans
The teacher of my soul, through the good and the bad
He didn’t forget me, in the day of my need
He wiped my tears away, and filled my home with glee

VERSE 5
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 6
Yesterday I was poor, I had nothing to claim
I had not one title, and nothing to my name
But I’m made whole today, only by His mercy,
Glory be to my God, He who never leaves me

VERSE 7
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 8
He removes from my path, that which is not for me,
And by His Will He gives, that which does profit me
All things were made by Him, and without Him was naught
Glory and Praise be to, our King Jesus Christ

VERSE 9
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 10
Medhanialem yelem yemesanew
Ammanual yelem yemesanew
Ersu Kal Seenager Teraraw medanew
Medhanialem yelem yemesanew',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'o-my-savior-i-can-do-all-through-you'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Medhanialem yelem yemesanew
Ammanual yelem yemesanew
Ersu kal seenager teraraw medanew
Medhanialem yelem yemesanew'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 1
Medhanialem yelem yemesanew
Ammanual yelem yemesanew
Ersu Kal Seenager Teraraw medanew
Medhanialem yelem yemesanew

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 2
I never thought I could pass this adversity
My bed was drenched with tears, as they rolled down my cheeks
His strength is made perfect, in the face of weakness
I passed through rough waters,  my burden became less

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 3
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 4
He’s the crown of my home, Advisor to my plans
The teacher of my soul, through the good and the bad
He didn’t forget me, in the day of my need
He wiped my tears away, and filled my home with glee

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 5
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 6
Yesterday I was poor, I had nothing to claim
I had not one title, and nothing to my name
But I’m made whole today, only by His mercy,
Glory be to my God, He who never leaves me

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 7
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 8
He removes from my path, that which is not for me,
And by His Will He gives, that which does profit me
All things were made by Him, and without Him was naught
Glory and Praise be to, our King Jesus Christ

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 9
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 10
Medhanialem yelem yemesanew
Ammanual yelem yemesanew
Ersu Kal Seenager Teraraw medanew
Medhanialem yelem yemesanew

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'o-my-savior-i-can-do-all-through-you', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: O Rihirihite Hilina (o-rihirihite-hilina)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 1
የእውነተኛው ዝናብ መገኛ
እውነተኛይቱ ደመና
የህይወታችን ህያው መሶብ
የዘለዓለም ህይወት መና

VERSE 2
ጸዋህሪተ መድህን አማኑኤል
ወለተ እያቄም ወሃና
ስርጉት በቅድስና
እትምት በድንግልና

VERSE 3
ማርያም ርህርተ ህሊና

VERSE 4
ለሠው ልጆች ሁሉ አዛኝ እናት
መመኪያ ዘውድ ናት ለኛ ባህሪ
ከፈጣሪ በታች ለዕልናዋ
ከፍጥረታቱ ሁሉ በላይ

VERSE 5
ቃልኪዳኗ በእውነት ያድነናል
ምልጃዋ በምድር በሰማይ
ስርጉት በቅድስና
እትምት በድንግልና

VERSE 6
ማርያም ርህርተ ህሊና

VERSE 7
የተዋህዶ ምስጢር መገለጫ
ጥበበ ጸጳጦስ እንተ ሲና
የህይወት ኪዳን መታረቂያ
ወልድን የወለደች በትህትና

VERSE 8
ለፍጥረቱ ሁሉ የምትራራ
አዛኝ ናት ርህርተ ህሊና
ስርጉት በቅድስና
እትምት በድንግልና

VERSE 9
ማርያም ርህርተ ህሊና',
      lyrics_transliteration = 'Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 1
Yeewnetegnaw zinab megegna
Ewnetegnaytu demena
Yehywetachn hiyaw mesob
Yezelealem hiywet mena

VERSE 2
Ts’ewahrite medhn Amanuel
Welete eyaqem wehana
Sirgut beqdsna
Etmt bedingilina

VERSE 3
Maryam rihrte hilina

VERSE 4
Lesew lijoch hulu azagn enat
Memekiya zewd nat legna bahri
Kefet’ari betach leelnawa
Keft’retatu hulu belay

VERSE 5
Qalkidanwa beewnet yadnenal
Miljawa bemdr besemay
Sirgut beqdsna
Etmt bedingilina

VERSE 6
Maryam rihrte hilina

VERSE 7
Yetewahdo mist’ir megelech’a
T’bebe ts’ep’at’os ente sina
Yehywet kidan metareqiya
Weldn yeweledech bethtna

VERSE 8
Left’retu hulu yemtrara
Azagn nat rihrte hilina
Sirgut beqdsna
Etmt bedingilina

VERSE 9
Maryam rihrte hilina',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'o-rihirihite-hilina'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 1
የእውነተኛው ዝናብ መገኛ
እውነተኛይቱ ደመና
የህይወታችን ህያው መሶብ
የዘለዓለም ህይወት መና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 2
ጸዋህሪተ መድህን አማኑኤል
ወለተ እያቄም ወሃና
ስርጉት በቅድስና
እትምት በድንግልና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 3
ማርያም ርህርተ ህሊና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 4
ለሠው ልጆች ሁሉ አዛኝ እናት
መመኪያ ዘውድ ናት ለኛ ባህሪ
ከፈጣሪ በታች ለዕልናዋ
ከፍጥረታቱ ሁሉ በላይ

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 5
ቃልኪዳኗ በእውነት ያድነናል
ምልጃዋ በምድር በሰማይ
ስርጉት በቅድስና
እትምት በድንግልና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 6
ማርያም ርህርተ ህሊና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 7
የተዋህዶ ምስጢር መገለጫ
ጥበበ ጸጳጦስ እንተ ሲና
የህይወት ኪዳን መታረቂያ
ወልድን የወለደች በትህትና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 8
ለፍጥረቱ ሁሉ የምትራራ
አዛኝ ናት ርህርተ ህሊና
ስርጉት በቅድስና
እትምት በድንግልና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና

VERSE 9
ማርያም ርህርተ ህሊና

CHORUS
ርህርተ ህሊና (3)
ኦ ርህርተ ህሊና
እንተ ኤልያስ ደመና
ርህርተ ህሊና'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 1
Yeewnetegnaw zinab megegna
Ewnetegnaytu demena
Yehywetachn hiyaw mesob
Yezelealem hiywet mena

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 2
Ts’ewahrite medhn Amanuel
Welete eyaqem wehana
Sirgut beqdsna
Etmt bedingilina

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 3
Maryam rihrte hilina

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 4
Lesew lijoch hulu azagn enat
Memekiya zewd nat legna bahri
Kefet’ari betach leelnawa
Keft’retatu hulu belay

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 5
Qalkidanwa beewnet yadnenal
Miljawa bemdr besemay
Sirgut beqdsna
Etmt bedingilina

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 6
Maryam rihrte hilina

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 7
Yetewahdo mist’ir megelech’a
T’bebe ts’ep’at’os ente sina
Yehywet kidan metareqiya
Weldn yeweledech bethtna

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 8
Left’retu hulu yemtrara
Azagn nat rihrte hilina
Sirgut beqdsna
Etmt bedingilina

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina

VERSE 9
Maryam rihrte hilina

CHORUS
Rihrte hilina (3)
O rihrte hilina
Ente elyas demena
Rihrte hilina'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'o-rihirihite-hilina', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: O the Archangel (o-the-archangel)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'O Michael liqe melaikt
Behatiyat endanwedk endanimot
Fetneh teradan atsnan bemnet',
      lyrics_english = 'O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen

VERSE 1
The tribe of Jacob ———— O Saint Michael
For the Israelites ———— O Saint Michael
Their guardian you are ———— O Saint Michael
With angelic might ———— O Saint Michael

VERSE 2
The bearer of love and mercy a father to all hear our pleas

VERSE 3
O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen

VERSE 4
Your garment shimmers ———— O Saint Michael
Descend from above ———— O Saint Michael
Glistening with gold ———— O Saint Michael
With eyes of a dove ———— O Saint Michael

VERSE 5
The bearer of love and mercy a father to all hear our pleas

VERSE 6
O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen

VERSE 7
Before your icon ———— O Saint Michael
I kneel for your grace ———— O Saint Michael
You give me comfort ———— O Saint Michael
In my darkest days ———— O Saint Michael

VERSE 8
The bearer of love and mercy a father to all hear our pleas

VERSE 9
O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen

VERSE 10
O Michael (2) liqe melaikt
Behatiyat endanwedk endanimot
Fetneh teradan atsnan bemnet

VERSE 11
O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'o-the-archangel'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'O Michael liqe melaikt
Behatiyat endanwedk endanimot
Fetneh teradan atsnan bemnet'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen

VERSE 1
The tribe of Jacob ———— O Saint Michael
For the Israelites ———— O Saint Michael
Their guardian you are ———— O Saint Michael
With angelic might ———— O Saint Michael

CHORUS
O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen

VERSE 2
The bearer of love and mercy a father to all hear our pleas

CHORUS
O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen

VERSE 3
O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen

CHORUS
O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen

VERSE 4
Your garment shimmers ———— O Saint Michael
Descend from above ———— O Saint Michael
Glistening with gold ———— O Saint Michael
With eyes of a dove ———— O Saint Michael

CHORUS
O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen

VERSE 5
The bearer of love and mercy a father to all hear our pleas

CHORUS
O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen

VERSE 6
O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen

CHORUS
O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen

VERSE 7
Before your icon ———— O Saint Michael
I kneel for your grace ———— O Saint Michael
You give me comfort ———— O Saint Michael
In my darkest days ———— O Saint Michael

CHORUS
O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen

VERSE 8
The bearer of love and mercy a father to all hear our pleas

CHORUS
O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen

VERSE 9
O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen

CHORUS
O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen

VERSE 10
O Michael (2) liqe melaikt
Behatiyat endanwedk endanimot
Fetneh teradan atsnan bemnet

CHORUS
O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen

VERSE 11
O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen

CHORUS
O the archangel (2) in Heaven Saint Michael
From the death and demise the wages of sin
Deliver us all with faith you strengthen'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'o-the-archangel', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Oh All That You Have Done For Me (oh-all-that-you-have-done-for-me)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = NULL,
      lyrics_english = 'Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/

VERSE 1
The day that became night drowned by the darkness
Suffering through the marsh that took me under it
When I had thought I lost the ones supporting me
He truly stowed away my troubles endlessly

VERSE 2
Our Lord and our strength our glory and power
Humiliated them with faith my wrongdoers
That you won’t forsake me finally I know truth
Above worldly calling I’ve committed to you

VERSE 3
Few became abundant You fed the multitudes
To show my gratitude enough I can’t give you
Through the days and the nights, the one that shines the light
Glorious it all is your works and all Your might

VERSE 4
Deserving you are for praise and admiration
For the humble of heart blessings, you have given
Impoverished I am not you are my fortune
My life is filled by you never again barren',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'oh-all-that-you-have-done-for-me'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM NULL
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/

VERSE 1
The day that became night drowned by the darkness
Suffering through the marsh that took me under it
When I had thought I lost the ones supporting me
He truly stowed away my troubles endlessly

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/

VERSE 2
Our Lord and our strength our glory and power
Humiliated them with faith my wrongdoers
That you won’t forsake me finally I know truth
Above worldly calling I’ve committed to you

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/

VERSE 3
Few became abundant You fed the multitudes
To show my gratitude enough I can’t give you
Through the days and the nights, the one that shines the light
Glorious it all is your works and all Your might

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/

VERSE 4
Deserving you are for praise and admiration
For the humble of heart blessings, you have given
Impoverished I am not you are my fortune
My life is filled by you never again barren

CHORUS
Oh all that you have done for me with humility
I will give praise and worship you with jubilee
Emanuel for eternity I will submit to you my heart fully /x2/'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'oh-all-that-you-have-done-for-me', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Oritodokis Tewahido Hager Nat (oritodokis-tewahido-hager-nat)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በውሀ ግድግዳ በደም መሰረት
ለክብሩ የመረጣት በስሙ የጠራት
ቤተክርስቲያን ተዋህዶ ናት
አትፈርስም ጉልላቷ እርሱ ነው

VERSE 1
የቀደሳት የሰራት ደሙ ነው
ብትፈተን በእሳት በመከራ
ትኖራለች ሁሉንም ተሻግራ
ኦርቶዶክስ ተዋህዶ ሀገር ናት

VERSE 2
የሰጠች ክብር ነፃነት /2/

VERSE 3
የማጠፋ በእሳት የተሰራች
ከምድር ሆና ሰማይ የደረሰች
የእግዚአብሔር የፀጋው ግምጃ ቤት
ተዋህዶ ስንዱዋ እመቤት

VERSE 4
ኦርቶዶክስ ተዋህዶ ሀገር ናት /2/
የሰጠች ክብር ነፃነት /2/

VERSE 5
የፅድቅ ቤት የድህነት መርከብ
መጠሪያ ነች ለሀገር እና ለሕዝብ
ሕይወት ያላት እውነት የምትገልጥ
የማታረጅ የማትለወጥ

VERSE 6
ኦርቶዶክስ ተዋህዶ ሀገር ናት /2/
የሰጠች ክብር ነፃነት /2/

VERSE 7
ተዋህዶ ያለች በቅድምና
ለኢትዮጵያ ሞገሷ ናት እና
ያለ እርሷ ኢትዮጵያ አትኖርም
መለያየት ከቶ አይቻልም

VERSE 8
ኦርቶዶክስ ተዋህዶ ሀገር ናት /2/
የሰጠች ክብር ነፃነት /2/',
      lyrics_transliteration = 'Bewhe gidgda bedem meseret
Lekbru yemeret’at besmu yet’erat
Bete Kristian Tewahedo nat
Atfersm gullatwa ersu new

VERSE 1
Yeqedesat yeserat demu new
Bitfeten beesat bemekera
Tinoralech hulunm teshagra
Ortodoks Tewahedo heger nat

VERSE 2
Yeset’ech kibir nets’anet (2)

VERSE 3
Yemat’efa beesat yeteserach
Kemdr hona semay yederesech
YeEgziabher yets’egaw gimja bet
Tewahedo sinduwa emebet

VERSE 4
Ortodoks Tewahedo heger nat (2)
Yeset’ech kibir nets’anet (2)

VERSE 5
Yets’dq bet yedhnet merkeb
Met’eriya nech leheger ena lehzb
Hiywet yalat ewnet yemtgelt’
Yematarej yematlewet’

VERSE 6
Ortodoks Tewahedo heger nat (2)
Yeset’ech kibir nets’anet (2)

VERSE 7
Tewahedo yalech beqdmna
Leityop’ya mogeswa nat ena
Yale erswa ityop’ya atnorm
Meleyayet keto aychalm

VERSE 8
Ortodoks Tewahedo heger nat (2)
Yeset’ech kibir nets’anet (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'oritodokis-tewahido-hager-nat'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በውሀ ግድግዳ በደም መሰረት
ለክብሩ የመረጣት በስሙ የጠራት
ቤተክርስቲያን ተዋህዶ ናት
አትፈርስም ጉልላቷ እርሱ ነው

VERSE 1
የቀደሳት የሰራት ደሙ ነው
ብትፈተን በእሳት በመከራ
ትኖራለች ሁሉንም ተሻግራ
ኦርቶዶክስ ተዋህዶ ሀገር ናት

CHORUS
በውሀ ግድግዳ በደም መሰረት
ለክብሩ የመረጣት በስሙ የጠራት
ቤተክርስቲያን ተዋህዶ ናት
አትፈርስም ጉልላቷ እርሱ ነው

VERSE 2
የሰጠች ክብር ነፃነት /2/

CHORUS
በውሀ ግድግዳ በደም መሰረት
ለክብሩ የመረጣት በስሙ የጠራት
ቤተክርስቲያን ተዋህዶ ናት
አትፈርስም ጉልላቷ እርሱ ነው

VERSE 3
የማጠፋ በእሳት የተሰራች
ከምድር ሆና ሰማይ የደረሰች
የእግዚአብሔር የፀጋው ግምጃ ቤት
ተዋህዶ ስንዱዋ እመቤት

CHORUS
በውሀ ግድግዳ በደም መሰረት
ለክብሩ የመረጣት በስሙ የጠራት
ቤተክርስቲያን ተዋህዶ ናት
አትፈርስም ጉልላቷ እርሱ ነው

VERSE 4
ኦርቶዶክስ ተዋህዶ ሀገር ናት /2/
የሰጠች ክብር ነፃነት /2/

CHORUS
በውሀ ግድግዳ በደም መሰረት
ለክብሩ የመረጣት በስሙ የጠራት
ቤተክርስቲያን ተዋህዶ ናት
አትፈርስም ጉልላቷ እርሱ ነው

VERSE 5
የፅድቅ ቤት የድህነት መርከብ
መጠሪያ ነች ለሀገር እና ለሕዝብ
ሕይወት ያላት እውነት የምትገልጥ
የማታረጅ የማትለወጥ

CHORUS
በውሀ ግድግዳ በደም መሰረት
ለክብሩ የመረጣት በስሙ የጠራት
ቤተክርስቲያን ተዋህዶ ናት
አትፈርስም ጉልላቷ እርሱ ነው

VERSE 6
ኦርቶዶክስ ተዋህዶ ሀገር ናት /2/
የሰጠች ክብር ነፃነት /2/

CHORUS
በውሀ ግድግዳ በደም መሰረት
ለክብሩ የመረጣት በስሙ የጠራት
ቤተክርስቲያን ተዋህዶ ናት
አትፈርስም ጉልላቷ እርሱ ነው

VERSE 7
ተዋህዶ ያለች በቅድምና
ለኢትዮጵያ ሞገሷ ናት እና
ያለ እርሷ ኢትዮጵያ አትኖርም
መለያየት ከቶ አይቻልም

CHORUS
በውሀ ግድግዳ በደም መሰረት
ለክብሩ የመረጣት በስሙ የጠራት
ቤተክርስቲያን ተዋህዶ ናት
አትፈርስም ጉልላቷ እርሱ ነው

VERSE 8
ኦርቶዶክስ ተዋህዶ ሀገር ናት /2/
የሰጠች ክብር ነፃነት /2/

CHORUS
በውሀ ግድግዳ በደም መሰረት
ለክብሩ የመረጣት በስሙ የጠራት
ቤተክርስቲያን ተዋህዶ ናት
አትፈርስም ጉልላቷ እርሱ ነው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bewhe gidgda bedem meseret
Lekbru yemeret’at besmu yet’erat
Bete Kristian Tewahedo nat
Atfersm gullatwa ersu new

VERSE 1
Yeqedesat yeserat demu new
Bitfeten beesat bemekera
Tinoralech hulunm teshagra
Ortodoks Tewahedo heger nat

CHORUS
Bewhe gidgda bedem meseret
Lekbru yemeret’at besmu yet’erat
Bete Kristian Tewahedo nat
Atfersm gullatwa ersu new

VERSE 2
Yeset’ech kibir nets’anet (2)

CHORUS
Bewhe gidgda bedem meseret
Lekbru yemeret’at besmu yet’erat
Bete Kristian Tewahedo nat
Atfersm gullatwa ersu new

VERSE 3
Yemat’efa beesat yeteserach
Kemdr hona semay yederesech
YeEgziabher yets’egaw gimja bet
Tewahedo sinduwa emebet

CHORUS
Bewhe gidgda bedem meseret
Lekbru yemeret’at besmu yet’erat
Bete Kristian Tewahedo nat
Atfersm gullatwa ersu new

VERSE 4
Ortodoks Tewahedo heger nat (2)
Yeset’ech kibir nets’anet (2)

CHORUS
Bewhe gidgda bedem meseret
Lekbru yemeret’at besmu yet’erat
Bete Kristian Tewahedo nat
Atfersm gullatwa ersu new

VERSE 5
Yets’dq bet yedhnet merkeb
Met’eriya nech leheger ena lehzb
Hiywet yalat ewnet yemtgelt’
Yematarej yematlewet’

CHORUS
Bewhe gidgda bedem meseret
Lekbru yemeret’at besmu yet’erat
Bete Kristian Tewahedo nat
Atfersm gullatwa ersu new

VERSE 6
Ortodoks Tewahedo heger nat (2)
Yeset’ech kibir nets’anet (2)

CHORUS
Bewhe gidgda bedem meseret
Lekbru yemeret’at besmu yet’erat
Bete Kristian Tewahedo nat
Atfersm gullatwa ersu new

VERSE 7
Tewahedo yalech beqdmna
Leityop’ya mogeswa nat ena
Yale erswa ityop’ya atnorm
Meleyayet keto aychalm

CHORUS
Bewhe gidgda bedem meseret
Lekbru yemeret’at besmu yet’erat
Bete Kristian Tewahedo nat
Atfersm gullatwa ersu new

VERSE 8
Ortodoks Tewahedo heger nat (2)
Yeset’ech kibir nets’anet (2)

CHORUS
Bewhe gidgda bedem meseret
Lekbru yemeret’at besmu yet’erat
Bete Kristian Tewahedo nat
Atfersm gullatwa ersu new'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'oritodokis-tewahido-hager-nat', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: orthidox tewahdo song (orthidox-tewahdo-song)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 1
እህ ብርሃነ ከፈነቤ ነህ
የሞታችን ሰንሰል
በግርማ ተፈታ ዛሬ
ሰላም ሆነ በምድር ደስታ

VERSE 2
ከሳሾች ከእንግዲህ
በኛ ላይ አይፈዱም
ጠፍተን አልቀረንም
ሊያጠፉን ቢወዱ

VERSE 3
ብርሃነ ከፈቤ
እህ ብርሃነ ከፈኑ ዲነው
ብርሃነ ከፈኑ ዲነ ነው
መስቀል ተሸክመህ

VERSE 4
እኛን ነጻ ወጣ
ቃልህ ፈመራ
ልዩ የእኛን ሞት ስትከላ ለኛ
እኛ ህይወት ሆነ ከሞት በኋላ

VERSE 5
ብርሃነ ከፈቤ
ከፈቤ ዲቤ
ከፈኖ ዲቤ ነህ
የእስራኤል ማህበር ያረዱ

VERSE 6
ህዝቡ በግንባ ተፋ
እኛን ለመታደግ በኢማሆ መንገድ
እግር ቀድሞ መጣ
የማይጨል በምድራችን ወጣ

VERSE 7
ብርሃነ ከፈቤ
ከፈቤ
ከፈነቤ ነህ
በመስቀል ጠረቀ

VERSE 8
ሞትን የገደልከው
መቃብርን መግለፁን
ፍጡር አላርከው
ዛሬ በብርሃን ህይወታችን ይብራ

VERSE 9
መኖር አጭር ሆነ ከኛ ጋራ
ብርሃነ ከፈኑ ዲቤ
ከፈኑ ዲቤ
እህ ብርሃነ ከፈቤ

VERSE 10
ከፈቤ
ትንሳኤ ለለመነ
ትንሳኤል አነፈኑ ዲቤ
ከፈቤ ባነራ

VERSE 11
ከፈኖ ዲቤ
ከፈኖ ዲቤ ነህ',
      lyrics_transliteration = 'Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 1
Eh birhane kefenebe neh
Yemotachn sensel
Begrma tefeta zare
Selam hone bemdr desta

VERSE 2
Kesashoch keengdih
Begna lay ayfedum
T’eften alqerenm
Liyat’efun biwedu

VERSE 3
Birhane kefebe
Eh birhane kefenu dinew
Birhane kefenu dine new
Mesqel teshekmeh

VERSE 4
Egnan nets’a wet’a
Qalh femera
Liyu yeegnan mot sitkela legna
Egna hiywet hone kemot behwala

VERSE 5
Birhane kefebe
Kefebe dibe
Kefeno dibe neh
Yeesrael mahber yaredu

VERSE 6
Hizbu begnba tefa
Egnan lemetadeg beimaho menged
Egr qedmo met’a
Yemaych’el bemdrachn wet’a

VERSE 7
Birhane kefebe
Kefebe
Kefenebe neh
Bemesqel t’ereqe

VERSE 8
Motn yegedelkew
Meqabrn meglets’un
Fit’ur alarkew
Zare bebrhan hiywetachn yibra

VERSE 9
Menor ach’r hone kegna gara
Birhane kefenu dibe
Kefenu dibe
Eh birhane kefebe

VERSE 10
Kefebe
Tinsae lelemene
Tinsael anefenu dibe
Kefebe banera

VERSE 11
Kefeno dibe
Kefeno dibe neh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'orthidox-tewahdo-song'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 1
እህ ብርሃነ ከፈነቤ ነህ
የሞታችን ሰንሰል
በግርማ ተፈታ ዛሬ
ሰላም ሆነ በምድር ደስታ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 2
ከሳሾች ከእንግዲህ
በኛ ላይ አይፈዱም
ጠፍተን አልቀረንም
ሊያጠፉን ቢወዱ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 3
ብርሃነ ከፈቤ
እህ ብርሃነ ከፈኑ ዲነው
ብርሃነ ከፈኑ ዲነ ነው
መስቀል ተሸክመህ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 4
እኛን ነጻ ወጣ
ቃልህ ፈመራ
ልዩ የእኛን ሞት ስትከላ ለኛ
እኛ ህይወት ሆነ ከሞት በኋላ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 5
ብርሃነ ከፈቤ
ከፈቤ ዲቤ
ከፈኖ ዲቤ ነህ
የእስራኤል ማህበር ያረዱ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 6
ህዝቡ በግንባ ተፋ
እኛን ለመታደግ በኢማሆ መንገድ
እግር ቀድሞ መጣ
የማይጨል በምድራችን ወጣ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 7
ብርሃነ ከፈቤ
ከፈቤ
ከፈነቤ ነህ
በመስቀል ጠረቀ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 8
ሞትን የገደልከው
መቃብርን መግለፁን
ፍጡር አላርከው
ዛሬ በብርሃን ህይወታችን ይብራ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 9
መኖር አጭር ሆነ ከኛ ጋራ
ብርሃነ ከፈኑ ዲቤ
ከፈኑ ዲቤ
እህ ብርሃነ ከፈቤ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 10
ከፈቤ
ትንሳኤ ለለመነ
ትንሳኤል አነፈኑ ዲቤ
ከፈቤ ባነራ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ

VERSE 11
ከፈኖ ዲቤ
ከፈኖ ዲቤ ነህ

CHORUS
ትንሳኤ ለለመ
ትንሳኤ ለለአመ
ብርሃነ ከፈኖቤ
ብርሃነ ከፈቤ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 1
Eh birhane kefenebe neh
Yemotachn sensel
Begrma tefeta zare
Selam hone bemdr desta

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 2
Kesashoch keengdih
Begna lay ayfedum
T’eften alqerenm
Liyat’efun biwedu

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 3
Birhane kefebe
Eh birhane kefenu dinew
Birhane kefenu dine new
Mesqel teshekmeh

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 4
Egnan nets’a wet’a
Qalh femera
Liyu yeegnan mot sitkela legna
Egna hiywet hone kemot behwala

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 5
Birhane kefebe
Kefebe dibe
Kefeno dibe neh
Yeesrael mahber yaredu

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 6
Hizbu begnba tefa
Egnan lemetadeg beimaho menged
Egr qedmo met’a
Yemaych’el bemdrachn wet’a

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 7
Birhane kefebe
Kefebe
Kefenebe neh
Bemesqel t’ereqe

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 8
Motn yegedelkew
Meqabrn meglets’un
Fit’ur alarkew
Zare bebrhan hiywetachn yibra

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 9
Menor ach’r hone kegna gara
Birhane kefenu dibe
Kefenu dibe
Eh birhane kefebe

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 10
Kefebe
Tinsae lelemene
Tinsael anefenu dibe
Kefebe banera

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe

VERSE 11
Kefeno dibe
Kefeno dibe neh

CHORUS
Tinsae leleme
Tinsae leleame
Birhane kefenobe
Birhane kefebe'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'orthidox-tewahdo-song', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: orthodox (orthodox)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 1
ተራቁቼ በአለም ጥጋት
ኃጢአትን ዘወትር ስጋት
ግን ፈተልሽው የሕይወቱ ሸማ
እኔ ልጅሽ እንድለብስ ግርማ

VERSE 2
ይንቆርቆር ዜማዬ
ለክብርሽ እምዬ
ልፍለቅለቅ በፊትሽ
ሸፍኖኝ ከውርደት ቀሚስሽ

VERSE 3
ገጼ ከስሞ አቀርቅሬ ሳለሁ
ልጄ ስትዪኝ በርታ ቀና እላለሁ
እንስፍስፍ ነሽ ለእኔማ አብሶ
ደጅሽ መጣሁ ሞቴ ተቀልብሶ

VERSE 4
ሰመረ ጸሎቴ
ደረሰ ስለቴ
ተባልኩኝ ዘማሪ
የልጅሽ የፍቅርሽ መስካሪ

VERSE 5
ታጥኖ ዕጣኑ ሲነበብ ታምርሽ
ያፈልሰኛል ከምድር ክብርሽ
አትለዪኝ ከጎን ከዙሪያዬ
ኦና አይደል ወይ ያለ አንቺ ኑሮዬ

VERSE 6
ማርማ ማርያም ነሽ
እምዬ የምልሽ
የጓዳ ሚስጥሬ
ያስተማርሽኝ ወልድን መምህሬ',
      lyrics_transliteration = 'T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh

VERSE 1
Teraquche bealem t’gat
Hat’iatn zewetr sigat
Gin fetelshw yehywetu shema
Ene lijsh endlebs girma

VERSE 2
Yinqorqor zemaye
Lekbrsh emye
Lifleqleq befitsh
Shefnogn kewrdet qemissh

VERSE 3
Gets’e kesmo aqerqre salehu
Lije sityign berta qena elalehu
Ensfsf nesh leenema abso
Dejsh met’ahu mote teqelbso

VERSE 4
Semere ts’elote
Derese silete
Tebalkugn zemari
Yeljsh yefqrsh meskari

VERSE 5
Tat’no et’anu sinebeb tamrsh
Yafelsegnal kemdr kibrsh
Atleyign kegon kezuriyaye
Ona aydel wey yale anchi nuroye

VERSE 6
Marma Maryam nesh
Emye yemlsh
Yegwada mist’re
Yastemarshgn weldn memhre',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'orthodox'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 1
ተራቁቼ በአለም ጥጋት
ኃጢአትን ዘወትር ስጋት
ግን ፈተልሽው የሕይወቱ ሸማ
እኔ ልጅሽ እንድለብስ ግርማ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 2
ይንቆርቆር ዜማዬ
ለክብርሽ እምዬ
ልፍለቅለቅ በፊትሽ
ሸፍኖኝ ከውርደት ቀሚስሽ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 3
ገጼ ከስሞ አቀርቅሬ ሳለሁ
ልጄ ስትዪኝ በርታ ቀና እላለሁ
እንስፍስፍ ነሽ ለእኔማ አብሶ
ደጅሽ መጣሁ ሞቴ ተቀልብሶ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 4
ሰመረ ጸሎቴ
ደረሰ ስለቴ
ተባልኩኝ ዘማሪ
የልጅሽ የፍቅርሽ መስካሪ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 5
ታጥኖ ዕጣኑ ሲነበብ ታምርሽ
ያፈልሰኛል ከምድር ክብርሽ
አትለዪኝ ከጎን ከዙሪያዬ
ኦና አይደል ወይ ያለ አንቺ ኑሮዬ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ

VERSE 6
ማርማ ማርያም ነሽ
እምዬ የምልሽ
የጓዳ ሚስጥሬ
ያስተማርሽኝ ወልድን መምህሬ

CHORUS
ጣፈጠው ከንፈሬ ማርያም ስምሽ
ጣፈጠ ሕይወቴ ማርያም ስልሽ
የግሸኗ እመቤቴ ማርያም ስልሽ
የጻድቃኔ የእንጦጦዋ ማርያም ስልሽ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh

VERSE 1
Teraquche bealem t’gat
Hat’iatn zewetr sigat
Gin fetelshw yehywetu shema
Ene lijsh endlebs girma

CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh

VERSE 2
Yinqorqor zemaye
Lekbrsh emye
Lifleqleq befitsh
Shefnogn kewrdet qemissh

CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh

VERSE 3
Gets’e kesmo aqerqre salehu
Lije sityign berta qena elalehu
Ensfsf nesh leenema abso
Dejsh met’ahu mote teqelbso

CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh

VERSE 4
Semere ts’elote
Derese silete
Tebalkugn zemari
Yeljsh yefqrsh meskari

CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh

VERSE 5
Tat’no et’anu sinebeb tamrsh
Yafelsegnal kemdr kibrsh
Atleyign kegon kezuriyaye
Ona aydel wey yale anchi nuroye

CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh

VERSE 6
Marma Maryam nesh
Emye yemlsh
Yegwada mist’re
Yastemarshgn weldn memhre

CHORUS
T’afet’ew kenfere Maryam simsh
T’afet’e hiywete Maryam silsh
Yegshenwa Emebete Maryam silsh
Yets’adqane yeent’ot’owa Maryam silsh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'orthodox', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Orthodox Mezmur Cover (orthodox-mezmur-cover)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እቲ ሓቀኛ ሰላም ኣብ ቤትካ’ዮ ዘሎ/2/
ርዳእ ከይናወጽ ልበይ ይልምን ኣሎ /2/
ኃጢኣተይ እንዝክር ይጭነቅ እቲ ልበይ
ኣድኪምዋ ነፍሰይ ካባኻ ምፍላየይ

VERSE 1
ናባካ አብለኒ ልበይ ይብለካ ኣሎ
እቲ ሓቀኛ ሰላም ኣብ ቤትካ’ዮ ዘሎ
ንጸሎት ቅዳሴ ከይተግህ ዘውትር
ኣብ አደባባይ ስምካ ንከይምስክር

VERSE 2
ወዲቀ አለኹ’ሞ በዚሑ ድካመይ
ርዳእ አማኑኤል ከጽንዕ እምነተይ
ስለ ኃጢኣተይ ይፈልፍል ንብዓተይ
ናይ ንስሓ ይኩን መጻኢ ህይወተይ

VERSE 3
በዛ ለሚ ዕለት መዓልቲ ምድሓነይ
ፍቅርኻ ሓሲበ መጻእኩ ኣምላከይ
ጎይታየ ንጣዕሳይ ንብዓተይ ተቀበል
ኣቦኺ’የ በለኒ ውሉድኻ’የ ክብል

VERSE 4
ዘይቲ ከይቀረብኩ ሃንደበት መጺኻ
ደገ ኣይተቁመኒ ማዕጾኻ ዓጺኻ',
      lyrics_transliteration = 'Eti haqegna selam ab betka’yo zelo (2)
Ridae keynawets’ libey yilmn alo (2)
Hat’iatey enzkr yich’neq eti libey
Adkimwa nefsey kabaኻ miflayey

VERSE 1
Nabaka ableni libey yibleka alo
Eti haqegna selam ab betka’yo zelo
Nits’elot qidase keytegh zewtr
Ab adebabay simka nikeymskr

VERSE 2
Wediqe aleኹ’mo bezihu dikamey
Ridae Amanuel kets’ne emnetey
Sile hat’iatey yifelfl nibatey
Nay nisha yikun mets’ai hiywetey

VERSE 3
Beza lemi elet mealti midhaney
Fiqrኻ hasibe mets’aeku amlakey
Goytaye nit’aesay nibatey teqebel
Aboኺ’ye beleni wiludኻ’ye kibl

VERSE 4
Zeyti keyqerebku handebet mets’iኻ
Dege aytequmeni maets’oኻ ats’iኻ',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'orthodox-mezmur-cover'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እቲ ሓቀኛ ሰላም ኣብ ቤትካ’ዮ ዘሎ/2/
ርዳእ ከይናወጽ ልበይ ይልምን ኣሎ /2/
ኃጢኣተይ እንዝክር ይጭነቅ እቲ ልበይ
ኣድኪምዋ ነፍሰይ ካባኻ ምፍላየይ

VERSE 1
ናባካ አብለኒ ልበይ ይብለካ ኣሎ
እቲ ሓቀኛ ሰላም ኣብ ቤትካ’ዮ ዘሎ
ንጸሎት ቅዳሴ ከይተግህ ዘውትር
ኣብ አደባባይ ስምካ ንከይምስክር

CHORUS
እቲ ሓቀኛ ሰላም ኣብ ቤትካ’ዮ ዘሎ/2/
ርዳእ ከይናወጽ ልበይ ይልምን ኣሎ /2/
ኃጢኣተይ እንዝክር ይጭነቅ እቲ ልበይ
ኣድኪምዋ ነፍሰይ ካባኻ ምፍላየይ

VERSE 2
ወዲቀ አለኹ’ሞ በዚሑ ድካመይ
ርዳእ አማኑኤል ከጽንዕ እምነተይ
ስለ ኃጢኣተይ ይፈልፍል ንብዓተይ
ናይ ንስሓ ይኩን መጻኢ ህይወተይ

CHORUS
እቲ ሓቀኛ ሰላም ኣብ ቤትካ’ዮ ዘሎ/2/
ርዳእ ከይናወጽ ልበይ ይልምን ኣሎ /2/
ኃጢኣተይ እንዝክር ይጭነቅ እቲ ልበይ
ኣድኪምዋ ነፍሰይ ካባኻ ምፍላየይ

VERSE 3
በዛ ለሚ ዕለት መዓልቲ ምድሓነይ
ፍቅርኻ ሓሲበ መጻእኩ ኣምላከይ
ጎይታየ ንጣዕሳይ ንብዓተይ ተቀበል
ኣቦኺ’የ በለኒ ውሉድኻ’የ ክብል

CHORUS
እቲ ሓቀኛ ሰላም ኣብ ቤትካ’ዮ ዘሎ/2/
ርዳእ ከይናወጽ ልበይ ይልምን ኣሎ /2/
ኃጢኣተይ እንዝክር ይጭነቅ እቲ ልበይ
ኣድኪምዋ ነፍሰይ ካባኻ ምፍላየይ

VERSE 4
ዘይቲ ከይቀረብኩ ሃንደበት መጺኻ
ደገ ኣይተቁመኒ ማዕጾኻ ዓጺኻ

CHORUS
እቲ ሓቀኛ ሰላም ኣብ ቤትካ’ዮ ዘሎ/2/
ርዳእ ከይናወጽ ልበይ ይልምን ኣሎ /2/
ኃጢኣተይ እንዝክር ይጭነቅ እቲ ልበይ
ኣድኪምዋ ነፍሰይ ካባኻ ምፍላየይ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eti haqegna selam ab betka’yo zelo (2)
Ridae keynawets’ libey yilmn alo (2)
Hat’iatey enzkr yich’neq eti libey
Adkimwa nefsey kabaኻ miflayey

VERSE 1
Nabaka ableni libey yibleka alo
Eti haqegna selam ab betka’yo zelo
Nits’elot qidase keytegh zewtr
Ab adebabay simka nikeymskr

CHORUS
Eti haqegna selam ab betka’yo zelo (2)
Ridae keynawets’ libey yilmn alo (2)
Hat’iatey enzkr yich’neq eti libey
Adkimwa nefsey kabaኻ miflayey

VERSE 2
Wediqe aleኹ’mo bezihu dikamey
Ridae Amanuel kets’ne emnetey
Sile hat’iatey yifelfl nibatey
Nay nisha yikun mets’ai hiywetey

CHORUS
Eti haqegna selam ab betka’yo zelo (2)
Ridae keynawets’ libey yilmn alo (2)
Hat’iatey enzkr yich’neq eti libey
Adkimwa nefsey kabaኻ miflayey

VERSE 3
Beza lemi elet mealti midhaney
Fiqrኻ hasibe mets’aeku amlakey
Goytaye nit’aesay nibatey teqebel
Aboኺ’ye beleni wiludኻ’ye kibl

CHORUS
Eti haqegna selam ab betka’yo zelo (2)
Ridae keynawets’ libey yilmn alo (2)
Hat’iatey enzkr yich’neq eti libey
Adkimwa nefsey kabaኻ miflayey

VERSE 4
Zeyti keyqerebku handebet mets’iኻ
Dege aytequmeni maets’oኻ ats’iኻ

CHORUS
Eti haqegna selam ab betka’yo zelo (2)
Ridae keynawets’ libey yilmn alo (2)
Hat’iatey enzkr yich’neq eti libey
Adkimwa nefsey kabaኻ miflayey'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'orthodox-mezmur-cover', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Orthodox Tewahdo Mezmur Kabey Koneley (orthodox-tewahdo-mezmur-kabey-koneley)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እንዘ ንብል ኢንትኃጎል (፪)
እምከብካበ ወልዳ ለድንግል (፪) እህ
ቃለ አብ ሕያው የመረጠሽ
በተዋህዶ ያደረብሽ

VERSE 1
አማናዊት ጽዮን ማርያም አንቺ ነሽ
ማህደረ መለኮት ድንግል አንቺ ነሽ
እምከብካበ
ወልዳ ለድንግል (፪)

VERSE 2
ረቂቅ ቃል የተፃፈብሽ
ድኅነታችን የታወጀብሽ
ኅትምት ሰሌዳ ንፅህት አንቺ ነሽ
የኪዳኑ ፅላት ብፅዕት አንቺ ነሽ

VERSE 3
እምከብካበ
ወልዳ ለድንግል (፪)
ሙሽራሽ ሆነ ቸሩ ልጅሽ
ሥጋችንን ነስቶ ከሥጋሽ

VERSE 4
በመርገመ ሀጢያት ስንቆሽሽ
ሕይዎትን አደልን ሆነልን ፈዋሽ
እምከብካበ
ወልዳ ለድንግል (፪)

VERSE 5
ንግስተ ሰማይ በመሆንሽ
ባለሟልነትን ስለታደልሽ
ከሠረጉ እንዳይለየን ቅዱስ ልጅሽ
ተማፅነንብሻል እኛ ልጆችሽ

VERSE 6
ቤዛዊተ ኩሉ ይርዳን ፀሎትሽ
መንግስቱን ለመውረስ ያግዘን ምልጃሽ
እምከብካበ
ወልዳ ለድንግል (፪)',
      lyrics_transliteration = 'Enze nibl inthagol (2)
Emkebkabe welda ledngl (2) eh
Qale Ab hiyaw yemeret’esh
Betewahdo yaderebsh

VERSE 1
Amanawit ts’yon Maryam anchi nesh
Mahdere melekot Dingil anchi nesh
Emkebkabe
Welda ledngl (2)

VERSE 2
Reqiq qal yetets’afebsh
Dihnetachn yetawejebsh
Hitmt seleda nits’ht anchi nesh
Yekidanu ts’lat bits’et anchi nesh

VERSE 3
Emkebkabe
Welda ledngl (2)
Mushrash hone cheru lijsh
Sigachnn nesto kesgash

VERSE 4
Bemergeme het’iyat sinqoshsh
Hiywotn adeln honeln fewash
Emkebkabe
Welda ledngl (2)

VERSE 5
Nigste semay bemehonsh
Balemwalnetn siletadelsh
Keseregu endayleyen Kidus lijsh
Temats’nenbshal egna lijochsh

VERSE 6
Bezawite kulu yirdan ts’elotsh
Mengstun lemewres yagzen miljash
Emkebkabe
Welda ledngl (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'orthodox-tewahdo-mezmur-kabey-koneley'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንዘ ንብል ኢንትኃጎል (፪)
እምከብካበ ወልዳ ለድንግል (፪) እህ
ቃለ አብ ሕያው የመረጠሽ
በተዋህዶ ያደረብሽ

VERSE 1
አማናዊት ጽዮን ማርያም አንቺ ነሽ
ማህደረ መለኮት ድንግል አንቺ ነሽ
እምከብካበ
ወልዳ ለድንግል (፪)

CHORUS
እንዘ ንብል ኢንትኃጎል (፪)
እምከብካበ ወልዳ ለድንግል (፪) እህ
ቃለ አብ ሕያው የመረጠሽ
በተዋህዶ ያደረብሽ

VERSE 2
ረቂቅ ቃል የተፃፈብሽ
ድኅነታችን የታወጀብሽ
ኅትምት ሰሌዳ ንፅህት አንቺ ነሽ
የኪዳኑ ፅላት ብፅዕት አንቺ ነሽ

CHORUS
እንዘ ንብል ኢንትኃጎል (፪)
እምከብካበ ወልዳ ለድንግል (፪) እህ
ቃለ አብ ሕያው የመረጠሽ
በተዋህዶ ያደረብሽ

VERSE 3
እምከብካበ
ወልዳ ለድንግል (፪)
ሙሽራሽ ሆነ ቸሩ ልጅሽ
ሥጋችንን ነስቶ ከሥጋሽ

CHORUS
እንዘ ንብል ኢንትኃጎል (፪)
እምከብካበ ወልዳ ለድንግል (፪) እህ
ቃለ አብ ሕያው የመረጠሽ
በተዋህዶ ያደረብሽ

VERSE 4
በመርገመ ሀጢያት ስንቆሽሽ
ሕይዎትን አደልን ሆነልን ፈዋሽ
እምከብካበ
ወልዳ ለድንግል (፪)

CHORUS
እንዘ ንብል ኢንትኃጎል (፪)
እምከብካበ ወልዳ ለድንግል (፪) እህ
ቃለ አብ ሕያው የመረጠሽ
በተዋህዶ ያደረብሽ

VERSE 5
ንግስተ ሰማይ በመሆንሽ
ባለሟልነትን ስለታደልሽ
ከሠረጉ እንዳይለየን ቅዱስ ልጅሽ
ተማፅነንብሻል እኛ ልጆችሽ

CHORUS
እንዘ ንብል ኢንትኃጎል (፪)
እምከብካበ ወልዳ ለድንግል (፪) እህ
ቃለ አብ ሕያው የመረጠሽ
በተዋህዶ ያደረብሽ

VERSE 6
ቤዛዊተ ኩሉ ይርዳን ፀሎትሽ
መንግስቱን ለመውረስ ያግዘን ምልጃሽ
እምከብካበ
ወልዳ ለድንግል (፪)

CHORUS
እንዘ ንብል ኢንትኃጎል (፪)
እምከብካበ ወልዳ ለድንግል (፪) እህ
ቃለ አብ ሕያው የመረጠሽ
በተዋህዶ ያደረብሽ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Enze nibl inthagol (2)
Emkebkabe welda ledngl (2) eh
Qale Ab hiyaw yemeret’esh
Betewahdo yaderebsh

VERSE 1
Amanawit ts’yon Maryam anchi nesh
Mahdere melekot Dingil anchi nesh
Emkebkabe
Welda ledngl (2)

CHORUS
Enze nibl inthagol (2)
Emkebkabe welda ledngl (2) eh
Qale Ab hiyaw yemeret’esh
Betewahdo yaderebsh

VERSE 2
Reqiq qal yetets’afebsh
Dihnetachn yetawejebsh
Hitmt seleda nits’ht anchi nesh
Yekidanu ts’lat bits’et anchi nesh

CHORUS
Enze nibl inthagol (2)
Emkebkabe welda ledngl (2) eh
Qale Ab hiyaw yemeret’esh
Betewahdo yaderebsh

VERSE 3
Emkebkabe
Welda ledngl (2)
Mushrash hone cheru lijsh
Sigachnn nesto kesgash

CHORUS
Enze nibl inthagol (2)
Emkebkabe welda ledngl (2) eh
Qale Ab hiyaw yemeret’esh
Betewahdo yaderebsh

VERSE 4
Bemergeme het’iyat sinqoshsh
Hiywotn adeln honeln fewash
Emkebkabe
Welda ledngl (2)

CHORUS
Enze nibl inthagol (2)
Emkebkabe welda ledngl (2) eh
Qale Ab hiyaw yemeret’esh
Betewahdo yaderebsh

VERSE 5
Nigste semay bemehonsh
Balemwalnetn siletadelsh
Keseregu endayleyen Kidus lijsh
Temats’nenbshal egna lijochsh

CHORUS
Enze nibl inthagol (2)
Emkebkabe welda ledngl (2) eh
Qale Ab hiyaw yemeret’esh
Betewahdo yaderebsh

VERSE 6
Bezawite kulu yirdan ts’elotsh
Mengstun lemewres yagzen miljash
Emkebkabe
Welda ledngl (2)

CHORUS
Enze nibl inthagol (2)
Emkebkabe welda ledngl (2) eh
Qale Ab hiyaw yemeret’esh
Betewahdo yaderebsh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'orthodox-tewahdo-mezmur-kabey-koneley', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Orthodox Tewahido Mezmur (orthodox-tewahido-mezmur)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 1
ባንተ ለመወደድ ምትክ ናት
ሰበብ ባይኖረኝ ደንግባት
እንዴው መውደድ ማይከብድ
በንፁህ ማፍቀር ማይከብድ

VERSE 2
በጻድቅ ልጅህ ፈርዳሃ
አጥባ ባሪያህን ምረሃ
ተበድለህን ክሳህ
አንተስ ማን ቋንቋ አይገጥም

VERSE 3
ኤሎሄ ኤሎሄ እያለ
በመስቀል ሲቃተተው አለ
ለወጉት ምህረት ማለደ
ለፋ ሲቃ እየታረደ

VERSE 4
የኔን ምትክ እሱ ሆነው
በአንዱ ልጅ ላይ ወሰነ
ወይኔ ለሰውት ኢየሱስ
ደሙ ሽርያለሁ በደምህ

VERSE 5
አንድስ እንኳን ያየኝ የለም
ምስሌ ሊቀርብ አልቻለም
ልጄ ባይተረክ ከኖሮ
ማን ነበር የሚያየኝ ለፍሮ

VERSE 6
በደሙ ከደም ጽፎልኝ
በአጥንቱ በእረፍት ጽፎልኝ
እያቃሰተ ነገረ
ፍቅሩን በፍቅር አሰረ',
      lyrics_transliteration = 'Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera

VERSE 1
Bante lemeweded mitk nat
Sebeb baynoregn dengbat
Endew mewded maykebd
Bents’uh mafqer maykebd

VERSE 2
Bets’adq lijh ferdaha
At’ba bariyahn mireha
Tebedlehn kisah
Antes man qwanqwa ayget’m

VERSE 3
Elohe elohe eyale
Bemesqel siqatetew ale
Lewegut mihret malede
Lefa siqa eyetarede

VERSE 4
Yenen mitk esu honew
Beandu lij lay wesene
Weyne lesewt Iyesus
Demu shryalehu bedemh

VERSE 5
Ands enkwan yayegn yelem
Misle liqerb alchalem
Lije bayterek kenoro
Man neber yemiyayegn lefro

VERSE 6
Bedemu kedem ts’folgn
Beat’ntu beereft ts’folgn
Eyaqasete negere
Fiqrun befqr asere',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'orthodox-tewahido-mezmur'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 1
ባንተ ለመወደድ ምትክ ናት
ሰበብ ባይኖረኝ ደንግባት
እንዴው መውደድ ማይከብድ
በንፁህ ማፍቀር ማይከብድ

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 2
በጻድቅ ልጅህ ፈርዳሃ
አጥባ ባሪያህን ምረሃ
ተበድለህን ክሳህ
አንተስ ማን ቋንቋ አይገጥም

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 3
ኤሎሄ ኤሎሄ እያለ
በመስቀል ሲቃተተው አለ
ለወጉት ምህረት ማለደ
ለፋ ሲቃ እየታረደ

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 4
የኔን ምትክ እሱ ሆነው
በአንዱ ልጅ ላይ ወሰነ
ወይኔ ለሰውት ኢየሱስ
ደሙ ሽርያለሁ በደምህ

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 5
አንድስ እንኳን ያየኝ የለም
ምስሌ ሊቀርብ አልቻለም
ልጄ ባይተረክ ከኖሮ
ማን ነበር የሚያየኝ ለፍሮ

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ

VERSE 6
በደሙ ከደም ጽፎልኝ
በአጥንቱ በእረፍት ጽፎልኝ
እያቃሰተ ነገረ
ፍቅሩን በፍቅር አሰረ

CHORUS
የአብን በድራት ያውቅ ለታ
በደም ያጌጠውን ወብ ስጦታ
አንደበቴ ቀድሞ አይን ያወራ
እምባንስ ለፍቅሩ እያዘራ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera

VERSE 1
Bante lemeweded mitk nat
Sebeb baynoregn dengbat
Endew mewded maykebd
Bents’uh mafqer maykebd

CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera

VERSE 2
Bets’adq lijh ferdaha
At’ba bariyahn mireha
Tebedlehn kisah
Antes man qwanqwa ayget’m

CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera

VERSE 3
Elohe elohe eyale
Bemesqel siqatetew ale
Lewegut mihret malede
Lefa siqa eyetarede

CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera

VERSE 4
Yenen mitk esu honew
Beandu lij lay wesene
Weyne lesewt Iyesus
Demu shryalehu bedemh

CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera

VERSE 5
Ands enkwan yayegn yelem
Misle liqerb alchalem
Lije bayterek kenoro
Man neber yemiyayegn lefro

CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera

VERSE 6
Bedemu kedem ts’folgn
Beat’ntu beereft ts’folgn
Eyaqasete negere
Fiqrun befqr asere

CHORUS
Yeabn bedrat yawq leta
Bedem yaget’ewn web sit’ota
Andebete qedmo ayn yawera
Embans lefqru eyazera'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'orthodox-tewahido-mezmur', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Our Lord and King of Peace (our-lord-and-king-of-peace)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna
Amlak tewelede tetemeke legna',
      lyrics_english = 'Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 1
Amlak tewelede tetemeke legna
Seeing the sins of the world oppression of mankind
He came down leaving 99 legions behind
To fulfill righteousness and free us from our bind

VERSE 2
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake
The mighty King whom the highest heavens could not bear
For when He was born and baptized to make us pure

VERSE 3
The mountains skipped like rams trembling out of fear
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake
The waters became troubled the Jordan turned to flee

VERSE 4
Before the Lord’s face it could not stand to be seen
Just as David foretold within his prophecy
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake

VERSE 5
As he founded righteousness in the Jordan River
Came from the clouds above the Heavenly Father
Testifying to His Son’s true divine nature
Our Lord and King of Peace and our judge full of grace

VERSE 6
Jesus Christ is truly born and baptized for our sake
Just as we find it written in the Holy Gospel
The Holy Spirit came upon Him as a dove
Pointing His wings to the Son and Father above

VERSE 7
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake
Witnessing the waters flee and the mountains leaping
The heavens were opened and the clouds were speaking

VERSE 8
On this day the world has seen this great mystery
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake
Yeselamu meri yeselamu dagna

VERSE 9
Amlak tewelede tetemeke legna',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'our-lord-and-king-of-peace'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna
Amlak tewelede tetemeke legna'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 1
Amlak tewelede tetemeke legna
Seeing the sins of the world oppression of mankind
He came down leaving 99 legions behind
To fulfill righteousness and free us from our bind

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 2
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake
The mighty King whom the highest heavens could not bear
For when He was born and baptized to make us pure

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 3
The mountains skipped like rams trembling out of fear
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake
The waters became troubled the Jordan turned to flee

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 4
Before the Lord’s face it could not stand to be seen
Just as David foretold within his prophecy
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 5
As he founded righteousness in the Jordan River
Came from the clouds above the Heavenly Father
Testifying to His Son’s true divine nature
Our Lord and King of Peace and our judge full of grace

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 6
Jesus Christ is truly born and baptized for our sake
Just as we find it written in the Holy Gospel
The Holy Spirit came upon Him as a dove
Pointing His wings to the Son and Father above

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 7
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake
Witnessing the waters flee and the mountains leaping
The heavens were opened and the clouds were speaking

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 8
On this day the world has seen this great mystery
Our Lord and King of Peace and our judge full of grace
Jesus Christ is truly born and baptized for our sake
Yeselamu meri yeselamu dagna

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna

VERSE 9
Amlak tewelede tetemeke legna

CHORUS
Yealemin bedel yesewin gif ayto
Zetena zetegnun melaektun tito
Tsidkin lemefetsem bedelin atfito
Yeselamu meri yeselamu dagna'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'our-lord-and-king-of-peace', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Praise And Glory (praise-and-glory)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሰብህዎ ለአምላክነ
ሰብህዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 1
ሰብህዎ ለአምላክነ
ሰብህዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/',
      lyrics_transliteration = 'Sebehwo leamlakene
Sebehwo leamlakene halleluya legziabher

VERSE 1
Besemay bemidir',
      lyrics_english = 'Praise and Glory is due unto Him
Hallelujah to our Lord and God /2/
In the Heavens and Earth /6/

VERSE 1
With His word He created all the earth and the heavens
Parting the dark waters apart He split land in portions
We see Him and all His great works shining light on the world
He is Praiseworthy and worshipped by all with praiseful words

VERSE 2
Praise and Glory is due unto Him
Hallelujah to our Lord and God /2/
In the Heavens and Earth /6/

VERSE 3
His great love and His vast mercy is broad and limitless
Our God He is trustworthy He will deliver us
The Provider for His creation Who is full of riches
Those who draw near to Him always will flourish in His grace

VERSE 4
Praise and Glory is due unto Him
Hallelujah to our Lord and God /2/
In the Heavens and Earth /6/

VERSE 5
Let Your Great Name be praised we say those whom He visited
For He saved us from suffering He raised us from the dead
He anoints the humble and meek He will raise them up high
His grace and compassion is vast the Mercy of the most high

VERSE 6
Praise and Glory is due unto Him
Hallelujah to our Lord and God /2/
In the Heavens and Earth /6/

VERSE 7
Angels in the highest heavens sing melodies to Him
And on Earth David played his harp so he could praise his King
We who are the Children of God let us all exalt Him
Let’s worship God of Israel let’s magnify His name

VERSE 8
Praise and Glory is due unto Him
Hallelujah to our Lord and God /2/
In the Heavens and Earth /6/',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'praise-and-glory'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰብህዎ ለአምላክነ
ሰብህዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 1
ሰብህዎ ለአምላክነ
ሰብህዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

CHORUS
ሰብህዎ ለአምላክነ
ሰብህዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sebehwo leamlakene
Sebehwo leamlakene halleluya legziabher

VERSE 1
Besemay bemidir

CHORUS
Sebehwo leamlakene
Sebehwo leamlakene halleluya legziabher'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Praise and Glory is due unto Him
Hallelujah to our Lord and God /2/
In the Heavens and Earth /6/

VERSE 1
With His word He created all the earth and the heavens
Parting the dark waters apart He split land in portions
We see Him and all His great works shining light on the world
He is Praiseworthy and worshipped by all with praiseful words

CHORUS
Praise and Glory is due unto Him
Hallelujah to our Lord and God /2/
In the Heavens and Earth /6/

VERSE 2
Praise and Glory is due unto Him
Hallelujah to our Lord and God /2/
In the Heavens and Earth /6/

CHORUS
Praise and Glory is due unto Him
Hallelujah to our Lord and God /2/
In the Heavens and Earth /6/

VERSE 3
His great love and His vast mercy is broad and limitless
Our God He is trustworthy He will deliver us
The Provider for His creation Who is full of riches
Those who draw near to Him always will flourish in His grace

CHORUS
Praise and Glory is due unto Him
Hallelujah to our Lord and God /2/
In the Heavens and Earth /6/

VERSE 4
Praise and Glory is due unto Him
Hallelujah to our Lord and God /2/
In the Heavens and Earth /6/

CHORUS
Praise and Glory is due unto Him
Hallelujah to our Lord and God /2/
In the Heavens and Earth /6/

VERSE 5
Let Your Great Name be praised we say those whom He visited
For He saved us from suffering He raised us from the dead
He anoints the humble and meek He will raise them up high
His grace and compassion is vast the Mercy of the most high

CHORUS
Praise and Glory is due unto Him
Hallelujah to our Lord and God /2/
In the Heavens and Earth /6/

VERSE 6
Praise and Glory is due unto Him
Hallelujah to our Lord and God /2/
In the Heavens and Earth /6/

CHORUS
Praise and Glory is due unto Him
Hallelujah to our Lord and God /2/
In the Heavens and Earth /6/

VERSE 7
Angels in the highest heavens sing melodies to Him
And on Earth David played his harp so he could praise his King
We who are the Children of God let us all exalt Him
Let’s worship God of Israel let’s magnify His name

CHORUS
Praise and Glory is due unto Him
Hallelujah to our Lord and God /2/
In the Heavens and Earth /6/

VERSE 8
Praise and Glory is due unto Him
Hallelujah to our Lord and God /2/
In the Heavens and Earth /6/

CHORUS
Praise and Glory is due unto Him
Hallelujah to our Lord and God /2/
In the Heavens and Earth /6/'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'praise-and-glory', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Praises of Mary (praises-of-mary)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'Praises of Mary I sing aloud
Virgin with purity you are crowned
Like Aba Ephrem give your blessing
Call me to praise you O my lady

VERSE 1
Praises of Mary I sing aloud
Virgin with purity you are crowned
Like Aba Ephrem give your blessing
Call me to praise you O my lady',
      lyrics_transliteration = 'Wudase Mariam echohalew
Dingil enaten etaralew
Ende Aba Efrem ney barkilign
Wediseni lije beyign

VERSE 1
Wudase Mariam echohalew
Dingil enaten etaralew
Ende Aba Efrem ney barkilign
Wediseni lije beyign',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'praises-of-mary'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Praises of Mary I sing aloud
Virgin with purity you are crowned
Like Aba Ephrem give your blessing
Call me to praise you O my lady

VERSE 1
Praises of Mary I sing aloud
Virgin with purity you are crowned
Like Aba Ephrem give your blessing
Call me to praise you O my lady

CHORUS
Praises of Mary I sing aloud
Virgin with purity you are crowned
Like Aba Ephrem give your blessing
Call me to praise you O my lady'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wudase Mariam echohalew
Dingil enaten etaralew
Ende Aba Efrem ney barkilign
Wediseni lije beyign

VERSE 1
Wudase Mariam echohalew
Dingil enaten etaralew
Ende Aba Efrem ney barkilign
Wediseni lije beyign

CHORUS
Wudase Mariam echohalew
Dingil enaten etaralew
Ende Aba Efrem ney barkilign
Wediseni lije beyign'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'praises-of-mary', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Qewamiyan (qewamiyan)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቀዋምያን ለነፍሳት
እሙንቱ ሊቃናት
ዑራኤል ወሩፋኤል (2)

VERSE 1
ይትፌነዉ ለሳህል (2)
እምኀበ ልዑል (2)

VERSE 2
ለነፍሳት የቆሙ
እነዚህ መላዕክት
ዑራኤልና ሩፋኤል (2)

VERSE 3
ከልዑል ዘንድ ለይቅርታ (2)
ይላካሉ ከልዑል (2)',
      lyrics_transliteration = 'Qewamiyan le nefsat
Emuntu liqanat
Urael we Rufael (2)

VERSE 1
Yitfenew le sahil (2)
Emhabe leul (2)

VERSE 2
Le nefsat yeqomu
Inezih melaekit
Uraelna Rufael (2)

VERSE 3
Ke leul zend le yiqirta (2)
Yilakalu ke leul (2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'qewamiyan'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቀዋምያን ለነፍሳት
እሙንቱ ሊቃናት
ዑራኤል ወሩፋኤል (2)

VERSE 1
ይትፌነዉ ለሳህል (2)
እምኀበ ልዑል (2)

CHORUS
ቀዋምያን ለነፍሳት
እሙንቱ ሊቃናት
ዑራኤል ወሩፋኤል (2)

VERSE 2
ለነፍሳት የቆሙ
እነዚህ መላዕክት
ዑራኤልና ሩፋኤል (2)

CHORUS
ቀዋምያን ለነፍሳት
እሙንቱ ሊቃናት
ዑራኤል ወሩፋኤል (2)

VERSE 3
ከልዑል ዘንድ ለይቅርታ (2)
ይላካሉ ከልዑል (2)

CHORUS
ቀዋምያን ለነፍሳት
እሙንቱ ሊቃናት
ዑራኤል ወሩፋኤል (2)'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Qewamiyan le nefsat
Emuntu liqanat
Urael we Rufael (2)

VERSE 1
Yitfenew le sahil (2)
Emhabe leul (2)

CHORUS
Qewamiyan le nefsat
Emuntu liqanat
Urael we Rufael (2)

VERSE 2
Le nefsat yeqomu
Inezih melaekit
Uraelna Rufael (2)

CHORUS
Qewamiyan le nefsat
Emuntu liqanat
Urael we Rufael (2)

VERSE 3
Ke leul zend le yiqirta (2)
Yilakalu ke leul (2)

CHORUS
Qewamiyan le nefsat
Emuntu liqanat
Urael we Rufael (2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'qewamiyan', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Selestun Dekikan (qirqos-iyelutan)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሰለስቱ ደቂቃን ያወጣ ከእሳት
እኛንም አድነን /፪/ ሊቀ መላእክት
እኛንም አድነን /፪/ ገብርኤል ሊቀ መላእክት።

VERSE 1
ሰለስቱ ደቂቃን ያወጣ ከእሳት
እኛንም አድነን /፪/ ሊቀ መላእክት
እኛንም አድነን /፪/ ገብርኤል ሊቀ መላእክት።',
      lyrics_transliteration = 'Selestun dekikan yawet’a ke’isat
Enyanim adnen (2) liqe mela’ekt
Enyanim adnen (2) Gebri’el liqe mela’ekt

VERSE 1
Selestun dekikan yawet’a ke’isat
Enyanim adnen (2) liqe mela’ekt
Enyanim adnen (2) Gebri’el liqe mela’ekt',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'qirqos-iyelutan'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰለስቱ ደቂቃን ያወጣ ከእሳት
እኛንም አድነን /፪/ ሊቀ መላእክት
እኛንም አድነን /፪/ ገብርኤል ሊቀ መላእክት።

VERSE 1
ሰለስቱ ደቂቃን ያወጣ ከእሳት
እኛንም አድነን /፪/ ሊቀ መላእክት
እኛንም አድነን /፪/ ገብርኤል ሊቀ መላእክት።

CHORUS
ሰለስቱ ደቂቃን ያወጣ ከእሳት
እኛንም አድነን /፪/ ሊቀ መላእክት
እኛንም አድነን /፪/ ገብርኤል ሊቀ መላእክት።'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Selestun dekikan yawet’a ke’isat
Enyanim adnen (2) liqe mela’ekt
Enyanim adnen (2) Gebri’el liqe mela’ekt

VERSE 1
Selestun dekikan yawet’a ke’isat
Enyanim adnen (2) liqe mela’ekt
Enyanim adnen (2) Gebri’el liqe mela’ekt

CHORUS
Selestun dekikan yawet’a ke’isat
Enyanim adnen (2) liqe mela’ekt
Enyanim adnen (2) Gebri’el liqe mela’ekt'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'qirqos-iyelutan', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Quanqaye Nesh Dingil (quanqaye-nesh-dingil)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 1
ባንቺ ቀርቤአለሁ ከአምላኬ ፊት
ቤቴ ሞልቶልኛል በበረከት /2/

VERSE 2
በምን ስራዬ ነው በፊቱ የቆምኩት
መቼ በቅቼ ነው ስሙን የጠራሁት
አስታራቂ እናት አንቺን ስለሰጠኝ
ስለ ቃል ኪዳንሽ አቤት ልጄ በይኝ /2/

VERSE 3
ቅድስና ሕይወት ከኔ ተሰውሮ
በውሸት በሃሜት አንደበቴ ታስሮ
በእመ አምላክ ፍቅር አዲስ ሰው ሆኛለሁ
እንደ መላእክቱ ይኸው እዘምራለሁ /2/

VERSE 4
ስለ እማምላክ ብሎ ያፈረ የለም
ባንቺ ያልከበረ ሰው አይገኝም
እንደ ባለማዕረግ እኔም ሰው መባሌ
አንቺን አግኝቼ ነው ድንግል መሰላሌ /2/

VERSE 5
ሰላም ለኪ ብዬ ስጀምር ሰላምታን
ሐሴት ይሞላዋል መላው ሰውነቴን
እንደ ቅዱስ ኤፍሬም በምስጋናሽ ልጽና
በእጆችሽ ያለው አምላኬ ነውና /2/',
      lyrics_transliteration = 'Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 1
Banchi qerbéalehu keAmlaké fit
Beté moltolignal bebereket (x2)

VERSE 2
Bemin sirayé new befitu yeqomkut
Meche beqché new simun yet’arahut
Astaraki enat anchin silesetegn
Sile qal kidanish abet lijé beyign (x2)

VERSE 3
Qid’sina hiywet kené tesewro
Bewushet behamet andebeté tasro
BeEme Amlak fiqir adis sew honalew
Ende mela’iktu yih’ew ezemiralew (x2)

VERSE 4
Sile Emamlak blo yaferé yelem
Banchi yalkebere sew ayigenim
Ende balema’ereg enem sew mebalé
Anchin agniche new dingil meselalé (x2)

VERSE 5
Selam leki biye s’jemir selamtan
Haset yimolawal melaw sewineten
Ende Kidus Efrem bemisganash lits’na
Be’ijochish yalew Amlaké newna (x2)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'quanqaye-nesh-dingil'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 1
ባንቺ ቀርቤአለሁ ከአምላኬ ፊት
ቤቴ ሞልቶልኛል በበረከት /2/

CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 2
በምን ስራዬ ነው በፊቱ የቆምኩት
መቼ በቅቼ ነው ስሙን የጠራሁት
አስታራቂ እናት አንቺን ስለሰጠኝ
ስለ ቃል ኪዳንሽ አቤት ልጄ በይኝ /2/

CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 3
ቅድስና ሕይወት ከኔ ተሰውሮ
በውሸት በሃሜት አንደበቴ ታስሮ
በእመ አምላክ ፍቅር አዲስ ሰው ሆኛለሁ
እንደ መላእክቱ ይኸው እዘምራለሁ /2/

CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 4
ስለ እማምላክ ብሎ ያፈረ የለም
ባንቺ ያልከበረ ሰው አይገኝም
እንደ ባለማዕረግ እኔም ሰው መባሌ
አንቺን አግኝቼ ነው ድንግል መሰላሌ /2/

CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/

VERSE 5
ሰላም ለኪ ብዬ ስጀምር ሰላምታን
ሐሴት ይሞላዋል መላው ሰውነቴን
እንደ ቅዱስ ኤፍሬም በምስጋናሽ ልጽና
በእጆችሽ ያለው አምላኬ ነውና /2/

CHORUS
ቋንቋዬ ነሽ ድንግል መግባቢያዬ
መልስ የማገኝብሽ ከጌታዬ /2/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 1
Banchi qerbéalehu keAmlaké fit
Beté moltolignal bebereket (x2)

CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 2
Bemin sirayé new befitu yeqomkut
Meche beqché new simun yet’arahut
Astaraki enat anchin silesetegn
Sile qal kidanish abet lijé beyign (x2)

CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 3
Qid’sina hiywet kené tesewro
Bewushet behamet andebeté tasro
BeEme Amlak fiqir adis sew honalew
Ende mela’iktu yih’ew ezemiralew (x2)

CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 4
Sile Emamlak blo yaferé yelem
Banchi yalkebere sew ayigenim
Ende balema’ereg enem sew mebalé
Anchin agniche new dingil meselalé (x2)

CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)

VERSE 5
Selam leki biye s’jemir selamtan
Haset yimolawal melaw sewineten
Ende Kidus Efrem bemisganash lits’na
Be’ijochish yalew Amlaké newna (x2)

CHORUS
Quanqaye nesh dingil megabiyaé
Mels yemagnibish kegetayé (x2)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'quanqaye-nesh-dingil', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Re''iywo Nolot (reiywo-nolot)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ርእይዎ ኖሎት /2/
አእኩትዎ መላእክት /2 ጊዜ/
ዮም ሰማያውዊ በጎል ሰከበ
ለዘ ተወልደ እምቅድስት ድንግል /2 ጊዜ/

VERSE 1
ርእይዎ ኖሎት /2/
አእኩትዎ መላእክት /2 ጊዜ/
ዮም ሰማያውዊ በጎል ሰከበ
ለዘ ተወልደ እምቅድስት ድንግል /2 ጊዜ/',
      lyrics_transliteration = 'rywo nolot /2/
ekutwo melakt /2 gize/
yom semayawwi begol sekebe
leze tewelde mqdst dngl /2 gize/

VERSE 1
rywo nolot /2/
ekutwo melakt /2 gize/
yom semayawwi begol sekebe
leze tewelde mqdst dngl /2 gize/',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'reiywo-nolot'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ርእይዎ ኖሎት /2/
አእኩትዎ መላእክት /2 ጊዜ/
ዮም ሰማያውዊ በጎል ሰከበ
ለዘ ተወልደ እምቅድስት ድንግል /2 ጊዜ/

VERSE 1
ርእይዎ ኖሎት /2/
አእኩትዎ መላእክት /2 ጊዜ/
ዮም ሰማያውዊ በጎል ሰከበ
ለዘ ተወልደ እምቅድስት ድንግል /2 ጊዜ/

CHORUS
ርእይዎ ኖሎት /2/
አእኩትዎ መላእክት /2 ጊዜ/
ዮም ሰማያውዊ በጎል ሰከበ
ለዘ ተወልደ እምቅድስት ድንግል /2 ጊዜ/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
rywo nolot /2/
ekutwo melakt /2 gize/
yom semayawwi begol sekebe
leze tewelde mqdst dngl /2 gize/

VERSE 1
rywo nolot /2/
ekutwo melakt /2 gize/
yom semayawwi begol sekebe
leze tewelde mqdst dngl /2 gize/

CHORUS
rywo nolot /2/
ekutwo melakt /2 gize/
yom semayawwi begol sekebe
leze tewelde mqdst dngl /2 gize/'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'reiywo-nolot', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: #rieka_bayney_new_eritrean_orthodox_mezmur_2021_rieyeka_biayiney (rieka-bayney-new-eritrean-orthodox-mezmur-2021-rieyeka-biayiney)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 1
ጓሂ ልበይ ኣብ ውሽጠይ ምስ በዝሐ
ተሓሊለ ሕልናይ ምስ ዓረበ
መን''ዩ ሞ ከማኻ ብይቅሬታ ምሕረት ንዓይ ዝበጽሓኒ
ከማኻስ መን እሞ እናጸናንዐ ሓጎስ ዝኾነኒ

VERSE 2
መን ኣሎ ድዩ ንስለ ፍቅሪ ክብል
መን ኣሎ ድዩ ምይቱ ሞተይ ዝስዕር
መን ኣሎ ከማኻ ብፍጽምቲ ፍቅሪ ክሳብ ሞት ዘፍቀረ
ብዓይነ ልቦናይ ሕጅስ ርእየካ እየ ኢየሱስ መድሕነይ',
      lyrics_transliteration = 'Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 1
Gwahi libey ab wisht’ey mis bezhe
Tehalile hilnay mis arebe
Men''yu mo kemaኻ biyqreta mihret niay zibets’hani
Kemaኻs men emo enats’enana hagos ziኾneni

VERSE 2
Men alo diyu nisle fiqri kibl
Men alo diyu miytu motey ziser
Men alo kemaኻ bifts’mti fiqri kisab mot zefqere
Biayne libonay hijs rieyeka eye Iyesus medhney',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'rieka-bayney-new-eritrean-orthodox-mezmur-2021-rieyeka-biayiney'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 1
ጓሂ ልበይ ኣብ ውሽጠይ ምስ በዝሐ
ተሓሊለ ሕልናይ ምስ ዓረበ
መን''ዩ ሞ ከማኻ ብይቅሬታ ምሕረት ንዓይ ዝበጽሓኒ
ከማኻስ መን እሞ እናጸናንዐ ሓጎስ ዝኾነኒ

CHORUS
ሕጂ ግዳ ርእየካ ብዓይነይ
ሕጂ ግዳ ከፊልካዮ ዕዳይ
እንታይ ስኢነ እንታይ ጎዱሉኒ
ከመስግነካ''የ ኣነ እንታይ ኣሎኒ(2)

VERSE 2
መን ኣሎ ድዩ ንስለ ፍቅሪ ክብል
መን ኣሎ ድዩ ምይቱ ሞተይ ዝስዕር
መን ኣሎ ከማኻ ብፍጽምቲ ፍቅሪ ክሳብ ሞት ዘፍቀረ
ብዓይነ ልቦናይ ሕጅስ ርእየካ እየ ኢየሱስ መድሕነይ

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
Gwahi libey ab wisht’ey mis bezhe
Tehalile hilnay mis arebe
Men''yu mo kemaኻ biyqreta mihret niay zibets’hani
Kemaኻs men emo enats’enana hagos ziኾneni

CHORUS
Hiji gida rieyeka biayney
Hiji gida kefilkayo eday
Entay siine entay goduluni
Kemesgneka''ye ane entay aloni (2)

VERSE 2
Men alo diyu nisle fiqri kibl
Men alo diyu miytu motey ziser
Men alo kemaኻ bifts’mti fiqri kisab mot zefqere
Biayne libonay hijs rieyeka eye Iyesus medhney

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
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'rieka-bayney-new-eritrean-orthodox-mezmur-2021-rieyeka-biayiney', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Riese Bahitawiyan (riese-bahitawiyan)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 1
በስምሙ ለሚያምኑት አማላጅ ሆነሀል
በፀሎትህም ኃይል ተማምነንብሃል
የክብር ኮከብ ነህ የገዳም መብራት

VERSE 2
አስተምረኸኛል ምግባር ሃይማኖት
የሚያልፈውን አለም የምድሩን ንቀሀል
የታመንከው አምላክ ህያው አድርጎሃል

VERSE 3
በሥጋ በነፍስህ እግዚአብሔር ከበረ
የማስታረቅን ቃል በአንተ ላይ አኖረ
በተጋድሎህ ብዛት በፆም በፀሎትህ

VERSE 4
ትተጋ ነበረ በፀናች እምነትህ
ስለ ቃል ኪዳንህ በረከት ይወርዳል
ያንተ ስም ሲጠራ አጋንንት ይርዳል

VERSE 5
ገብረመንፈስ ቅዱስ የእምነት አባት
አናብርት አናብስት የታዘዙለት
ከንሒሳ ተነስቶ ኢትዮጲያ ደረሰ
ፀጋው በረከቱ በእኛ ላይ ፈሰሰ',
      lyrics_transliteration = 'Be qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 1
Besmmu lemiyamnut amalaj honehel
Bets’elothm hayl temamnenbhal
Yekbr kokeb neh yegedam mebrat

VERSE 2
Astemreኸgnal migbar haymanot
Yemiyalfewn alem yemdrun niqehel
Yetamenkew amlak hiyaw adrgohal

VERSE 3
Besga benefsh Egziabher kebere
Yemastareqn qal beante lay anore
Betegadloh bizat bets’om bets’eloth

VERSE 4
Titega nebere bets’enach emneth
Sile qal kidanh bereket yiwerdal
Yante sim sit’era agannt yirdal

VERSE 5
Gebremenfes Kidus yeemnet abat
Anabrt anabst yetazezulet
Kenhisa tenesto ityop’iya derese
Ts’egaw bereketu beegna lay fesese',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'riese-bahitawiyan'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 1
አዝ
በስምሙ ለሚያምኑት አማላጅ ሆነሀል
በፀሎትህም ኃይል ተማምነንብሃል
የክብር ኮከብ ነህ የገዳም መብራት

CHORUS
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 2
አስተምረኸኛል ምግባር ሃይማኖት
አዝ
የሚያልፈውን አለም የምድሩን ንቀሀል
የታመንከው አምላክ ህያው አድርጎሃል

CHORUS
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 3
በሥጋ በነፍስህ እግዚአብሔር ከበረ
የማስታረቅን ቃል በአንተ ላይ አኖረ
አዝ
በተጋድሎህ ብዛት በፆም በፀሎትህ

CHORUS
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 4
ትተጋ ነበረ በፀናች እምነትህ
ስለ ቃል ኪዳንህ በረከት ይወርዳል
ያንተ ስም ሲጠራ አጋንንት ይርዳል
አዝ

CHORUS
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ

VERSE 5
ገብረመንፈስ ቅዱስ የእምነት አባት
አናብርት አናብስት የታዘዙለት
ከንሒሳ ተነስቶ ኢትዮጲያ ደረሰ
ፀጋው በረከቱ በእኛ ላይ ፈሰሰ

CHORUS
በ ቃልና በኑሮህ ሆነሀል ምስክር
እንደ ፀሐይ አበራህ በእግዚአብሔር አገር
ሰማያዊ ነህ እንጂ አይደለህም ምድራዊ
ገብረ መንፈስቅዱስ ርዕሰ ባሕታዊ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Be qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 1
CHORUS
Besmmu lemiyamnut amalaj honehel
Bets’elothm hayl temamnenbhal
Yekbr kokeb neh yegedam mebrat

CHORUS
Be qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 2
Astemreኸgnal migbar haymanot
CHORUS
Yemiyalfewn alem yemdrun niqehel
Yetamenkew amlak hiyaw adrgohal

CHORUS
Be qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 3
Besga benefsh Egziabher kebere
Yemastareqn qal beante lay anore
CHORUS
Betegadloh bizat bets’om bets’eloth

CHORUS
Be qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 4
Titega nebere bets’enach emneth
Sile qal kidanh bereket yiwerdal
Yante sim sit’era agannt yirdal
CHORUS

CHORUS
Be qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi

VERSE 5
Gebremenfes Kidus yeemnet abat
Anabrt anabst yetazezulet
Kenhisa tenesto ityop’iya derese
Ts’egaw bereketu beegna lay fesese

CHORUS
Be qalna benuroh honehel miskr
Ende ts’ehey aberah beEgziabher ager
Semayawi neh enji aydelehm midrawi
Gebre Menfes Kidus riese bahtawi'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'riese-bahitawiyan', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Rufael Abate (rufael-abate)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'እኔ ያንተ ነኝ ልጅ ዘማሬን ላንሳ
ለኔ ያረከውን ፍፁም ስልረሳ
ትገርመኛለህ ሩፋኤል ትድንቀኛለህ
በደርስኩበት ሳትለየኝ ታከብረ ኛለህ{{ ፪}}

VERSE 1
አይኔን አብርትህ ሩፋኤል
ሰው ልታርገኝ
በእናቴ ማህፀን ጠብቀህ
ዛሬን አየሁኝ

VERSE 2
አሰማንድዮስን አስረከው ተረፍኩኝ ከሞት
እዘምራልሁ ለክብርህ ቀንና ሌሊት
ናልኝ ሩፋኤል አባቴ
ና መዳኒት

VERSE 3
ናልኝ መልእኩ በስህል
የአምላክ ባለሟል',
      lyrics_transliteration = 'Ene yante negn lij zemaren lansa
Lene yarekewn fits’um silresa
Tigermegnaleh Rufael tidnqegnaleh
Bederskubet satleyegn takebre gnaleh{{ 2}}

VERSE 1
Aynen abrth Rufael
Sew litargegn
Beenate mahts’en t’ebqeh
Zaren ayehugn

VERSE 2
Asemandyosn asrekew terefkugn kemot
Ezemralhu lekbrh qenna lelit
Nalgn Rufael abate
Na medanit

VERSE 3
Nalgn meleku beshl
Yeamlak balemwal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'rufael-abate'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኔ ያንተ ነኝ ልጅ ዘማሬን ላንሳ
ለኔ ያረከውን ፍፁም ስልረሳ
ትገርመኛለህ ሩፋኤል ትድንቀኛለህ
በደርስኩበት ሳትለየኝ ታከብረ ኛለህ{{ ፪}}

VERSE 1
አይኔን አብርትህ ሩፋኤል
ሰው ልታርገኝ
በእናቴ ማህፀን ጠብቀህ
ዛሬን አየሁኝ

CHORUS
እኔ ያንተ ነኝ ልጅ ዘማሬን ላንሳ
ለኔ ያረከውን ፍፁም ስልረሳ
ትገርመኛለህ ሩፋኤል ትድንቀኛለህ
በደርስኩበት ሳትለየኝ ታከብረ ኛለህ{{ ፪}}

VERSE 2
አሰማንድዮስን አስረከው ተረፍኩኝ ከሞት
እዘምራልሁ ለክብርህ ቀንና ሌሊት
ናልኝ ሩፋኤል አባቴ
ና መዳኒት

CHORUS
እኔ ያንተ ነኝ ልጅ ዘማሬን ላንሳ
ለኔ ያረከውን ፍፁም ስልረሳ
ትገርመኛለህ ሩፋኤል ትድንቀኛለህ
በደርስኩበት ሳትለየኝ ታከብረ ኛለህ{{ ፪}}

VERSE 3
ናልኝ መልእኩ በስህል
የአምላክ ባለሟል

CHORUS
እኔ ያንተ ነኝ ልጅ ዘማሬን ላንሳ
ለኔ ያረከውን ፍፁም ስልረሳ
ትገርመኛለህ ሩፋኤል ትድንቀኛለህ
በደርስኩበት ሳትለየኝ ታከብረ ኛለህ{{ ፪}}'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ene yante negn lij zemaren lansa
Lene yarekewn fits’um silresa
Tigermegnaleh Rufael tidnqegnaleh
Bederskubet satleyegn takebre gnaleh{{ 2}}

VERSE 1
Aynen abrth Rufael
Sew litargegn
Beenate mahts’en t’ebqeh
Zaren ayehugn

CHORUS
Ene yante negn lij zemaren lansa
Lene yarekewn fits’um silresa
Tigermegnaleh Rufael tidnqegnaleh
Bederskubet satleyegn takebre gnaleh{{ 2}}

VERSE 2
Asemandyosn asrekew terefkugn kemot
Ezemralhu lekbrh qenna lelit
Nalgn Rufael abate
Na medanit

CHORUS
Ene yante negn lij zemaren lansa
Lene yarekewn fits’um silresa
Tigermegnaleh Rufael tidnqegnaleh
Bederskubet satleyegn takebre gnaleh{{ 2}}

VERSE 3
Nalgn meleku beshl
Yeamlak balemwal

CHORUS
Ene yante negn lij zemaren lansa
Lene yarekewn fits’um silresa
Tigermegnaleh Rufael tidnqegnaleh
Bederskubet satleyegn takebre gnaleh{{ 2}}'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'rufael-abate', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Rufael Tekebel Tseloten (rufael-tekebel-tseloten)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 1
ተቀበል ከደጅህ መጥቼ
ተቀበል እጆቼን ዘርግቼ
ተቀበል ልሂድ ወደ ቤቴ
ተቀበል ባንተ ተፈትቼ

VERSE 2
ተቀበል እንደ ጦቢት ጦቢያ
ተቀበል አኔንም ባርከኝ
ተቀበል አምላኬ እግዚአብሔርን
ተቀበል ላመስግን እርዳኝ

VERSE 3
ተቀበል አዛዜልን አስረህ
ተቀበል በጨለማ የጣልክ
ተቀበል በደዌ ስመታ
ተቀበል መዳኒቴ አንተ ነህ

VERSE 4
ተቀበል ከኔ ጋራ ሆነህ
ተቀበል ፀሎቴን አሳርግ
ተቀበል ውስጠ ኖሃ ሰማይ
ተቀበል ከአምላከ አዶናይ

VERSE 5
ተቀበል አስማንዲዎስ ይጥፋ
ተቀበል በመብረቅ ይውደም
ተቀበል እጣኑ ጭስ ሲያርግ
ተቀበል ደዌ ከኔ ይራቅ

VERSE 6
ተቀበል ድንቅን የምታደርግ
ተቀበል በአሳ አንባሪው ላይ
ተቀበል ሩፋኤል አንተ ነህ
ተቀበል እኔ ለኔ በላይ

VERSE 7
ተቀበል አዛዜልን አስረህ
ተቀበል በጨለማ የጣልክ
ተቀበል በደዌ ስመታ
ተቀበል መዳኒቴ አንተ ነህ

VERSE 8
ተቀበል ከኔ ጋራ ሆነህ
ተቀበል ፀሎቴን አሳርግ
ተቀበል ውስጠ ኖሃ ሰማይ
ተቀበል ከአምላከ አዶናይ',
      lyrics_transliteration = 'Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 1
Teqebel kedejh met’che
Teqebel ejochen zergche
Teqebel lihid wede bete
Teqebel bante tefetche

VERSE 2
Teqebel ende t’obit t’obiya
Teqebel anenm barkegn
Teqebel amlake Egziabhern
Teqebel lamesgn erdagn

VERSE 3
Teqebel azazeln asreh
Teqebel bech’elema yet’alk
Teqebel bedewe simeta
Teqebel medanite ante neh

VERSE 4
Teqebel kene gara honeh
Teqebel ts’eloten asarg
Teqebel wist’e noha semay
Teqebel keamlake adonay

VERSE 5
Teqebel asmandiwos yit’fa
Teqebel bemebreq yiwdem
Teqebel et’anu ch’s siyarg
Teqebel dewe kene yiraq

VERSE 6
Teqebel dinqn yemtaderg
Teqebel beasa anbariw lay
Teqebel Rufael ante neh
Teqebel ene lene belay

VERSE 7
Teqebel azazeln asreh
Teqebel bech’elema yet’alk
Teqebel bedewe simeta
Teqebel medanite ante neh

VERSE 8
Teqebel kene gara honeh
Teqebel ts’eloten asarg
Teqebel wist’e noha semay
Teqebel keamlake adonay',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'rufael-tekebel-tseloten'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 1
ተቀበል ከደጅህ መጥቼ
ተቀበል እጆቼን ዘርግቼ
ተቀበል ልሂድ ወደ ቤቴ
ተቀበል ባንተ ተፈትቼ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 2
ተቀበል እንደ ጦቢት ጦቢያ
ተቀበል አኔንም ባርከኝ
ተቀበል አምላኬ እግዚአብሔርን
ተቀበል ላመስግን እርዳኝ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 3
ተቀበል አዛዜልን አስረህ
ተቀበል በጨለማ የጣልክ
ተቀበል በደዌ ስመታ
ተቀበል መዳኒቴ አንተ ነህ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 4
ተቀበል ከኔ ጋራ ሆነህ
ተቀበል ፀሎቴን አሳርግ
ተቀበል ውስጠ ኖሃ ሰማይ
ተቀበል ከአምላከ አዶናይ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 5
ተቀበል አስማንዲዎስ ይጥፋ
ተቀበል በመብረቅ ይውደም
ተቀበል እጣኑ ጭስ ሲያርግ
ተቀበል ደዌ ከኔ ይራቅ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 6
ተቀበል ድንቅን የምታደርግ
ተቀበል በአሳ አንባሪው ላይ
ተቀበል ሩፋኤል አንተ ነህ
ተቀበል እኔ ለኔ በላይ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 7
ተቀበል አዛዜልን አስረህ
ተቀበል በጨለማ የጣልክ
ተቀበል በደዌ ስመታ
ተቀበል መዳኒቴ አንተ ነህ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን

VERSE 8
ተቀበል ከኔ ጋራ ሆነህ
ተቀበል ፀሎቴን አሳርግ
ተቀበል ውስጠ ኖሃ ሰማይ
ተቀበል ከአምላከ አዶናይ

CHORUS
ተቀበል ፀሎቴን አሳርግ ስለቴን
ሩፋኤል ሩፋኤል ፈታሄ ማህፀን'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 1
Teqebel kedejh met’che
Teqebel ejochen zergche
Teqebel lihid wede bete
Teqebel bante tefetche

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 2
Teqebel ende t’obit t’obiya
Teqebel anenm barkegn
Teqebel amlake Egziabhern
Teqebel lamesgn erdagn

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 3
Teqebel azazeln asreh
Teqebel bech’elema yet’alk
Teqebel bedewe simeta
Teqebel medanite ante neh

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 4
Teqebel kene gara honeh
Teqebel ts’eloten asarg
Teqebel wist’e noha semay
Teqebel keamlake adonay

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 5
Teqebel asmandiwos yit’fa
Teqebel bemebreq yiwdem
Teqebel et’anu ch’s siyarg
Teqebel dewe kene yiraq

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 6
Teqebel dinqn yemtaderg
Teqebel beasa anbariw lay
Teqebel Rufael ante neh
Teqebel ene lene belay

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 7
Teqebel azazeln asreh
Teqebel bech’elema yet’alk
Teqebel bedewe simeta
Teqebel medanite ante neh

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en

VERSE 8
Teqebel kene gara honeh
Teqebel ts’eloten asarg
Teqebel wist’e noha semay
Teqebel keamlake adonay

CHORUS
Teqebel ts’eloten asarg sileten
Rufael Rufael fetahe mahts’en'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'rufael-tekebel-tseloten', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Saint Mary Has Ascended (saint-mary-has-ascended)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = NULL,
      lyrics_transliteration = 'Mariam aregalech wede Genet
Yesemay melaikt eyaregaguwat
Esuwam ende lijwa tenestalech',
      lyrics_english = 'Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 1
Mariam aregalech wede Genet/2/
Yesemay Melaikt eyaregaguwat
Esuwam ende Lijwa tenestalech

VERSE 2
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 3
To honor the prophecy, her father David told
To stand at the Lords right, wearing clothes of fine Gold
Our mother ascended, with glory honor praise
Through the seven heavens, where her Lord and Son dwells

VERSE 4
Virgin Mary has ascended into paradise

VERSE 5
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 6
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 7
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 8
Let the heavens open, and let clouds bear witness
No one must be silent, when the Virgin ascends
Let’s all venerate the mother of compassion
Unites us with her son, through her intercession

VERSE 9
Virgin Mary has ascended into paradise

VERSE 10
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 11
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 12
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 13
Your holy flesh that the, Lord has taken from thee
Your holy and pure hands , carried divinity
You are raised by your son, from the firm grasp of death
You are raised with honor, we have seen it through faith

VERSE 14
Virgin Mary has ascended into paradise

VERSE 15
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 16
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 17
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 18
Rejoice all apostles, our holy fathers
The Lord has ascended, St Mary your mother
Take her linens with you, go tell to the nations
Speak how she has risen, with fervent devotion

VERSE 19
Aregalech Mariam tenestalech

VERSE 20
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 21
Mariam aregalech wede Genet/2/
Yesemay Melaikt eyaregaguwat
Esuwam ende Lijwa tenestalech

VERSE 22
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ',
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'saint-mary-has-ascended'
    AND lyrics_amharic IS NOT DISTINCT FROM NULL
    AND lyrics_transliteration IS NOT DISTINCT FROM 'Mariam aregalech wede Genet
Yesemay melaikt eyaregaguwat
Esuwam ende lijwa tenestalech'
    AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 1
Mariam aregalech wede Genet/2/
Yesemay Melaikt eyaregaguwat
Esuwam ende Lijwa tenestalech

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 2
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 3
To honor the prophecy, her father David told
To stand at the Lords right, wearing clothes of fine Gold
Our mother ascended, with glory honor praise
Through the seven heavens, where her Lord and Son dwells

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 4
Virgin Mary has ascended into paradise

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 5
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 6
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 7
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 8
Let the heavens open, and let clouds bear witness
No one must be silent, when the Virgin ascends
Let’s all venerate the mother of compassion
Unites us with her son, through her intercession

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 9
Virgin Mary has ascended into paradise

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 10
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 11
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 12
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 13
Your holy flesh that the, Lord has taken from thee
Your holy and pure hands , carried divinity
You are raised by your son, from the firm grasp of death
You are raised with honor, we have seen it through faith

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 14
Virgin Mary has ascended into paradise

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 15
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 16
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 17
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 18
Rejoice all apostles, our holy fathers
The Lord has ascended, St Mary your mother
Take her linens with you, go tell to the nations
Speak how she has risen, with fervent devotion

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 19
Aregalech Mariam tenestalech

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 20
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 21
Mariam aregalech wede Genet/2/
Yesemay Melaikt eyaregaguwat
Esuwam ende Lijwa tenestalech

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

VERSE 22
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ

CHORUS
Saint Mary has ascended into paradise /2/
Angels surrounding her comfort her with delight
She has risen from death, like her Son Jesus Christ'
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'saint-mary-has-ascended', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Salemin Yemiyasifeligegnin Tawikaleh (salemin-yemiyasifeligegnin-tawikaleh)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሳልለምን
የሚያስፈልገኝን ታውቃለህ
ሳልጠይቅ
የሚያስፈልገኝን ታውቃለህ

VERSE 1
ብቻ ጤናን ስጠኝ
አልጥፋ ከቤትህ እንዳመሰግንህ
በጤናዬ የኖርኩት
በሰላም ያረፍኩት

VERSE 2
ሞልቶ የተረፈው
የቤቴ በረከት
አይደለም ጥበቤ
የጸሎቴ ብዛት

VERSE 3
ስለምታውቀው ነው
የልቤን ፍላጎት
ጠግቤም ተርቤም
ምስጋና አፌ ነው

VERSE 4
ባይሞላልኝ እንኳን
ዝማሬ ዝማሬ ነው
አላስብም ነገን
ምን ይሆናል ብዬ

VERSE 5
በህይወቴም በሞቴም
አንተ ነህ ጌታዬ
ደጅህን ሳልመታ
ምንም ሳልጠይቅ

VERSE 6
ጓዳዬ ሙሉ ነው
መጉደልን ሳያውቅ
በነገሮች ሁሉ
ነፍሴን አስተምረህ

VERSE 7
በሰጠኸኝ ጸጋ
አንተን እንዳከብርህ',
      lyrics_transliteration = 'Sallemn
Yemiyasfelgegnn tawqaleh
Salt’eyq
Yemiyasfelgegnn tawqaleh

VERSE 1
Bicha t’enan sit’egn
Alt’fa kebeth endamesegnh
Bet’enaye yenorkut
Beselam yarefkut

VERSE 2
Molto yeterefew
Yebete bereket
Aydelem t’bebe
Yets’elote bizat

VERSE 3
Silemtawqew new
Yelben filagot
T’egbem terbem
Misgana afe new

VERSE 4
Baymolalgn enkwan
Zimare zimare new
Alasbm negen
Min yihonal biye

VERSE 5
Behywetem bemotem
Ante neh Getaye
Dejhn salmeta
Minm salt’eyq

VERSE 6
Gwadaye mulu new
Megudeln sayawq
Benegeroch hulu
Nefsen astemreh

VERSE 7
Beset’eኸgn ts’ega
Anten endakebrh',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'salemin-yemiyasifeligegnin-tawikaleh'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሳልለምን
የሚያስፈልገኝን ታውቃለህ
ሳልጠይቅ
የሚያስፈልገኝን ታውቃለህ

VERSE 1
ብቻ ጤናን ስጠኝ
አልጥፋ ከቤትህ እንዳመሰግንህ
በጤናዬ የኖርኩት
በሰላም ያረፍኩት

CHORUS
ሳልለምን
የሚያስፈልገኝን ታውቃለህ
ሳልጠይቅ
የሚያስፈልገኝን ታውቃለህ

VERSE 2
ሞልቶ የተረፈው
የቤቴ በረከት
አይደለም ጥበቤ
የጸሎቴ ብዛት

CHORUS
ሳልለምን
የሚያስፈልገኝን ታውቃለህ
ሳልጠይቅ
የሚያስፈልገኝን ታውቃለህ

VERSE 3
ስለምታውቀው ነው
የልቤን ፍላጎት
ጠግቤም ተርቤም
ምስጋና አፌ ነው

CHORUS
ሳልለምን
የሚያስፈልገኝን ታውቃለህ
ሳልጠይቅ
የሚያስፈልገኝን ታውቃለህ

VERSE 4
ባይሞላልኝ እንኳን
ዝማሬ ዝማሬ ነው
አላስብም ነገን
ምን ይሆናል ብዬ

CHORUS
ሳልለምን
የሚያስፈልገኝን ታውቃለህ
ሳልጠይቅ
የሚያስፈልገኝን ታውቃለህ

VERSE 5
በህይወቴም በሞቴም
አንተ ነህ ጌታዬ
ደጅህን ሳልመታ
ምንም ሳልጠይቅ

CHORUS
ሳልለምን
የሚያስፈልገኝን ታውቃለህ
ሳልጠይቅ
የሚያስፈልገኝን ታውቃለህ

VERSE 6
ጓዳዬ ሙሉ ነው
መጉደልን ሳያውቅ
በነገሮች ሁሉ
ነፍሴን አስተምረህ

CHORUS
ሳልለምን
የሚያስፈልገኝን ታውቃለህ
ሳልጠይቅ
የሚያስፈልገኝን ታውቃለህ

VERSE 7
በሰጠኸኝ ጸጋ
አንተን እንዳከብርህ

CHORUS
ሳልለምን
የሚያስፈልገኝን ታውቃለህ
ሳልጠይቅ
የሚያስፈልገኝን ታውቃለህ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sallemn
Yemiyasfelgegnn tawqaleh
Salt’eyq
Yemiyasfelgegnn tawqaleh

VERSE 1
Bicha t’enan sit’egn
Alt’fa kebeth endamesegnh
Bet’enaye yenorkut
Beselam yarefkut

CHORUS
Sallemn
Yemiyasfelgegnn tawqaleh
Salt’eyq
Yemiyasfelgegnn tawqaleh

VERSE 2
Molto yeterefew
Yebete bereket
Aydelem t’bebe
Yets’elote bizat

CHORUS
Sallemn
Yemiyasfelgegnn tawqaleh
Salt’eyq
Yemiyasfelgegnn tawqaleh

VERSE 3
Silemtawqew new
Yelben filagot
T’egbem terbem
Misgana afe new

CHORUS
Sallemn
Yemiyasfelgegnn tawqaleh
Salt’eyq
Yemiyasfelgegnn tawqaleh

VERSE 4
Baymolalgn enkwan
Zimare zimare new
Alasbm negen
Min yihonal biye

CHORUS
Sallemn
Yemiyasfelgegnn tawqaleh
Salt’eyq
Yemiyasfelgegnn tawqaleh

VERSE 5
Behywetem bemotem
Ante neh Getaye
Dejhn salmeta
Minm salt’eyq

CHORUS
Sallemn
Yemiyasfelgegnn tawqaleh
Salt’eyq
Yemiyasfelgegnn tawqaleh

VERSE 6
Gwadaye mulu new
Megudeln sayawq
Benegeroch hulu
Nefsen astemreh

CHORUS
Sallemn
Yemiyasfelgegnn tawqaleh
Salt’eyq
Yemiyasfelgegnn tawqaleh

VERSE 7
Beset’eኸgn ts’ega
Anten endakebrh

CHORUS
Sallemn
Yemiyasfelgegnn tawqaleh
Salt’eyq
Yemiyasfelgegnn tawqaleh'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'salemin-yemiyasifeligegnin-tawikaleh', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Sar Kitelu Seridow (sar-kitelu-seridow)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 1
እልል በይ ቤተልሔም ሃሌ ሃሌ ሉያ
የፍቅር የሰላም ነሽና ገበያ /2/
ያ ትሁት እረኛ ሳለ በታጋት
ብርሃንን ለበሰ በዕኩለ ሌሊት

VERSE 2
ጥሪ ተደርጎለት ከሰማይ ሠራዊት
ለመመልከት በቃ የጌታውን ልደት
አዝ …………………..
የእረኝነት ሥራ ተንቆ እንዲቀር

VERSE 3
ብሎ ሰው በልማድ ደንግጎ ነበር
የብዙ ሰው እራስ መሆኑን እረኛ
ክርስቶስ ሲወለድ ተረዳነው እኛ
አዝ ………………………

VERSE 4
የሩቅ ምስራቅ ሰዎች ሰብአሰገል ሰምተው
ሊሰግዱለት መጡ በኮከብ ተመርተው
እጣንና ከርቤ ወርቁንም አመጡ
እንደየሥርዓቱ እጅ መንሻ ሰጡ

VERSE 5
አዝ ……………………….
ስለተወለደ መድህን የኛ ተስፋ
በደል ተወገደ ሀጥያትም ጠፋ',
      lyrics_transliteration = 'Sar qit’elu serdow senbelet’ qet’emaw
Beziyach qen beziyach wer lemlmo yeneberew
Beellta zemeru bedesta temoltew
Geta meweledun yemserach semtew

VERSE 1
Ell bey betelhem hale Halleluya
Yefqr yeselam neshna gebeya (2)
Ya tihut eregna sale betagat
Birhann lebese beekule lelit

VERSE 2
T’ri tedergolet kesemay serawit
Lememelket beqa yegetawn lidet
Yeeregnnet sira tenqo endiqer

VERSE 3
Bilo sew belmad denggo neber
Yebzu sew eras mehonun eregna
Kristos siweled teredanew egna

VERSE 4
Yeruq misraq sewoch sebasegel semtew
Lisegdulet met’u bekokeb temertew
Et’anna kerbe werqunm amet’u
Endeyesratu ej mensha set’u

VERSE 5
Siletewelede medhn yegna tesfa
Bedel tewegede het’yatm t’efa',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sar-kitelu-seridow'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 1
እልል በይ ቤተልሔም ሃሌ ሃሌ ሉያ
የፍቅር የሰላም ነሽና ገበያ /2/
ያ ትሁት እረኛ ሳለ በታጋት
ብርሃንን ለበሰ በዕኩለ ሌሊት

CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 2
ጥሪ ተደርጎለት ከሰማይ ሠራዊት
ለመመልከት በቃ የጌታውን ልደት
አዝ …………………..
የእረኝነት ሥራ ተንቆ እንዲቀር

CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 3
ብሎ ሰው በልማድ ደንግጎ ነበር
የብዙ ሰው እራስ መሆኑን እረኛ
ክርስቶስ ሲወለድ ተረዳነው እኛ
አዝ ………………………

CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 4
የሩቅ ምስራቅ ሰዎች ሰብአሰገል ሰምተው
ሊሰግዱለት መጡ በኮከብ ተመርተው
እጣንና ከርቤ ወርቁንም አመጡ
እንደየሥርዓቱ እጅ መንሻ ሰጡ

CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው

VERSE 5
አዝ ……………………….
ስለተወለደ መድህን የኛ ተስፋ
በደል ተወገደ ሀጥያትም ጠፋ

CHORUS
ሣር ቅጠሉ ሠርዶው ሰንበሌጥ ቀጤማው
በዚያች ቀን በዚያች ወር ለምልሞ የነበረው
በእልልታ ዘመሩ በደስታ ተሞልተው
ጌታ መወለዱን የምሰራች ሰምተው'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sar qit’elu serdow senbelet’ qet’emaw
Beziyach qen beziyach wer lemlmo yeneberew
Beellta zemeru bedesta temoltew
Geta meweledun yemserach semtew

VERSE 1
Ell bey betelhem hale Halleluya
Yefqr yeselam neshna gebeya (2)
Ya tihut eregna sale betagat
Birhann lebese beekule lelit

CHORUS
Sar qit’elu serdow senbelet’ qet’emaw
Beziyach qen beziyach wer lemlmo yeneberew
Beellta zemeru bedesta temoltew
Geta meweledun yemserach semtew

VERSE 2
T’ri tedergolet kesemay serawit
Lememelket beqa yegetawn lidet
CHORUS
Yeeregnnet sira tenqo endiqer

CHORUS
Sar qit’elu serdow senbelet’ qet’emaw
Beziyach qen beziyach wer lemlmo yeneberew
Beellta zemeru bedesta temoltew
Geta meweledun yemserach semtew

VERSE 3
Bilo sew belmad denggo neber
Yebzu sew eras mehonun eregna
Kristos siweled teredanew egna
CHORUS

CHORUS
Sar qit’elu serdow senbelet’ qet’emaw
Beziyach qen beziyach wer lemlmo yeneberew
Beellta zemeru bedesta temoltew
Geta meweledun yemserach semtew

VERSE 4
Yeruq misraq sewoch sebasegel semtew
Lisegdulet met’u bekokeb temertew
Et’anna kerbe werqunm amet’u
Endeyesratu ej mensha set’u

CHORUS
Sar qit’elu serdow senbelet’ qet’emaw
Beziyach qen beziyach wer lemlmo yeneberew
Beellta zemeru bedesta temoltew
Geta meweledun yemserach semtew

VERSE 5
CHORUS
Siletewelede medhn yegna tesfa
Bedel tewegede het’yatm t’efa

CHORUS
Sar qit’elu serdow senbelet’ qet’emaw
Beziyach qen beziyach wer lemlmo yeneberew
Beellta zemeru bedesta temoltew
Geta meweledun yemserach semtew'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'sar-kitelu-seridow', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Sayegebagn (sayegebagn)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //

VERSE 1
ምን ያላረክልኝ አለ ጌታ ለኔ
ምንም ባሳዝንህ በምግባሬ
ኃጢአቴን ተመልክተህ ቸል ያላልከኝ
በህይወቴ ብዙ ነገር ስራህልኝ

VERSE 2
አ.ዝ //
ውለታህ ብዙ ነው ያንተ ወስን የለው
ተናግሬ እኔ አልጨርስው
ውድቀቴንም ድክመቴንም እኔ አውቃለሁ

VERSE 3
የጠበቀኝ ቸርነትህ ምሕረትህ ነው
አ.ዝ //
ለማይነገረው ፍቅርህ ግሩም ሥራ
ልጆችህን የምጠብቅ ከመከራ

VERSE 4
ምን እንመልሳለን ላንተ ላምላካችን
ከመዋረድ አድነኸን ላከበርከን',
      lyrics_transliteration = 'Saygebagn amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn (2)
A.z //

VERSE 1
Min yalareklgn ale Geta lene
Minm basaznh bemgbare
Hat’iaten temelkteh chel yalalkegn
Behywete bizu neger sirahlgn

VERSE 2
A.z //
Wiletah bizu new yante wesn yelew
Tenagre ene alch’ersw
Widqetenm dikmetenm ene awqalehu

VERSE 3
Yet’ebeqegn cherneth mihreth new
A.z //
Lemaynegerew fiqrh girum sira
Lijochhn yemt’ebq kemekera

VERSE 4
Min enmelsalen lante lamlakachn
Kemewared adneኸn lakeberken',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sayegebagn'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //

VERSE 1
ምን ያላረክልኝ አለ ጌታ ለኔ
ምንም ባሳዝንህ በምግባሬ
ኃጢአቴን ተመልክተህ ቸል ያላልከኝ
በህይወቴ ብዙ ነገር ስራህልኝ

CHORUS
ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //

VERSE 2
አ.ዝ //
ውለታህ ብዙ ነው ያንተ ወስን የለው
ተናግሬ እኔ አልጨርስው
ውድቀቴንም ድክመቴንም እኔ አውቃለሁ

CHORUS
ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //

VERSE 3
የጠበቀኝ ቸርነትህ ምሕረትህ ነው
አ.ዝ //
ለማይነገረው ፍቅርህ ግሩም ሥራ
ልጆችህን የምጠብቅ ከመከራ

CHORUS
ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //

VERSE 4
ምን እንመልሳለን ላንተ ላምላካችን
ከመዋረድ አድነኸን ላከበርከን

CHORUS
ሳይገባኝ አምላክ ሳይገባኝ
ሳይገባኝ ጌታ ሳይገባኝ
ለዚህ ያደረስከኝ እኔ ማነኝ (2)
አ.ዝ //'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Saygebagn amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn (2)
A.z //

VERSE 1
Min yalareklgn ale Geta lene
Minm basaznh bemgbare
Hat’iaten temelkteh chel yalalkegn
Behywete bizu neger sirahlgn

CHORUS
Saygebagn amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn (2)
A.z //

VERSE 2
A.z //
Wiletah bizu new yante wesn yelew
Tenagre ene alch’ersw
Widqetenm dikmetenm ene awqalehu

CHORUS
Saygebagn amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn (2)
A.z //

VERSE 3
Yet’ebeqegn cherneth mihreth new
A.z //
Lemaynegerew fiqrh girum sira
Lijochhn yemt’ebq kemekera

CHORUS
Saygebagn amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn (2)
A.z //

VERSE 4
Min enmelsalen lante lamlakachn
Kemewared adneኸn lakeberken

CHORUS
Saygebagn amlak saygebagn
Saygebagn Geta saygebagn
Lezih yadereskegn ene manegn (2)
A.z //'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'sayegebagn', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Sealu Lene Kidusan Melaekit (sealu-lene-kidusan-melaekit)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 1
ያጸደክውን ማን ይወቅሳለ
ለሚገባው ክብርን መስጠት
ታዝዟልና በመጻሕፍት
ያከበርካቸው ባርያዎችህን ፪

VERSE 2
እናከብራለን ቅዱሳንህን
።።።።።።
ሁሉ መዳንን እንዲይዙ
የሚላኩ የሚያግዙ

VERSE 3
ሠርክ በፊትህ እየቆሙ
ጥዑም ቅዳሴን እያሰሙ
በምስጋናቸው የሚያከብሩህን
እናከብራለን መላእክትህን ፪

VERSE 4
።።።።።።
ጤዛ ልሰው ዳዋ ለብሰው
ዋእይ ቁሩንም ታግስው
በየፍርክታው በየዱሩ

VERSE 5
ሌጦ ለብሰው እየዞሩ
በጽናታቸው የሚያከብሩህን
እናከብራለን ጻድቃንህን ፪
።።።።።።

VERSE 6
እንደሚታረዱ በጎች ሆነው
አንገታቸውን ለስፍ ሰጥተው
ስለ ስምህ እየተጠሉ
ከአንበሳ ጋር እየታገሉ

VERSE 7
በተጋድሏዋቸው የሚያከብሩህን
እናከብራለን ሰማዕታትህን ፪
።።።።።።
ከሕያው ቃልህ እየጠቀሱ

VERSE 8
መናፍቃንን ድል የነሱ
በገዛ ደምህ የዋጀኃትን
ቤተክርስቲያን የጠበቋትን
በሕይወታቸው ያስደሰቱህን

VERSE 9
እናከብራለን ሐዋርያትህን ፪',
      lyrics_transliteration = 'Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 1
Yats’edekwn man yiweqsale
Lemigebaw kibrn mest’et
Tazzwalna bemets’ahft
Yakeberkachew baryawochhn 2

VERSE 2
Enakebralen qidusanhn
......
Hulu medann endiyzu
Yemilaku yemiyagzu

VERSE 3
Serk befith eyeqomu
T’um qidasen eyasemu
Bemsganachew yemiyakebruhn
Enakebralen melaekthn 2

VERSE 4
......
T’eza lisew dawa lebsew
Waey qurunm tagsw
Beyefrktaw beyeduru

VERSE 5
Let’o lebsew eyezoru
Bets’natachew yemiyakebruhn
Enakebralen ts’adqanhn 2
......

VERSE 6
Endemitaredu begoch honew
Angetachewn lesf set’tew
Sile simh eyetet’elu
Keanbesa gar eyetagelu

VERSE 7
Betegadlwawachew yemiyakebruhn
Enakebralen semaetathn 2
......
Kehyaw qalh eyet’eqesu

VERSE 8
Menafqann dil yenesu
Begeza demh yewajehatn
Bete Kristian yet’ebeqwatn
Behywetachew yasdesetuhn

VERSE 9
Enakebralen hewaryathn 2',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sealu-lene-kidusan-melaekit'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 1
ያጸደክውን ማን ይወቅሳለ
ለሚገባው ክብርን መስጠት
ታዝዟልና በመጻሕፍት
ያከበርካቸው ባርያዎችህን ፪

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 2
እናከብራለን ቅዱሳንህን
።።።።።።
ሁሉ መዳንን እንዲይዙ
የሚላኩ የሚያግዙ

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 3
ሠርክ በፊትህ እየቆሙ
ጥዑም ቅዳሴን እያሰሙ
በምስጋናቸው የሚያከብሩህን
እናከብራለን መላእክትህን ፪

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 4
።።።።።።
ጤዛ ልሰው ዳዋ ለብሰው
ዋእይ ቁሩንም ታግስው
በየፍርክታው በየዱሩ

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 5
ሌጦ ለብሰው እየዞሩ
በጽናታቸው የሚያከብሩህን
እናከብራለን ጻድቃንህን ፪
።።።።።።

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 6
እንደሚታረዱ በጎች ሆነው
አንገታቸውን ለስፍ ሰጥተው
ስለ ስምህ እየተጠሉ
ከአንበሳ ጋር እየታገሉ

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 7
በተጋድሏዋቸው የሚያከብሩህን
እናከብራለን ሰማዕታትህን ፪
።።።።።።
ከሕያው ቃልህ እየጠቀሱ

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 8
መናፍቃንን ድል የነሱ
በገዛ ደምህ የዋጀኃትን
ቤተክርስቲያን የጠበቋትን
በሕይወታቸው ያስደሰቱህን

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ

VERSE 9
እናከብራለን ሐዋርያትህን ፪

CHORUS
ስአሉ ለነ ቅዱሳን መላእክት
ስአሉ ለነ ጻድቃን ሰማዕታት
ኅበ አምላክ ምሕረት ስአሉ ለነ ፪
አንተ የመረጥከውን ማን ይከስሳለ'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 1
Yats’edekwn man yiweqsale
Lemigebaw kibrn mest’et
Tazzwalna bemets’ahft
Yakeberkachew baryawochhn 2

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 2
Enakebralen qidusanhn
......
Hulu medann endiyzu
Yemilaku yemiyagzu

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 3
Serk befith eyeqomu
T’um qidasen eyasemu
Bemsganachew yemiyakebruhn
Enakebralen melaekthn 2

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 4
......
T’eza lisew dawa lebsew
Waey qurunm tagsw
Beyefrktaw beyeduru

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 5
Let’o lebsew eyezoru
Bets’natachew yemiyakebruhn
Enakebralen ts’adqanhn 2
......

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 6
Endemitaredu begoch honew
Angetachewn lesf set’tew
Sile simh eyetet’elu
Keanbesa gar eyetagelu

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 7
Betegadlwawachew yemiyakebruhn
Enakebralen semaetathn 2
......
Kehyaw qalh eyet’eqesu

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 8
Menafqann dil yenesu
Begeza demh yewajehatn
Bete Kristian yet’ebeqwatn
Behywetachew yasdesetuhn

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale

VERSE 9
Enakebralen hewaryathn 2

CHORUS
Sialu lene Kidusan melaekt
Sialu lene ts’adqan semaetat
Hibe amlak mihret sialu lene 2
Ante yemeret’kewn man yikessale'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'sealu-lene-kidusan-melaekit', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Sebatu Menitolaet (sebatu-menitolaet)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሰባቱ መንጦላዕት ወዴት ተጋረዱ
ሰባቱ መብራቶች ወዴት ተሰናዱ
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት

VERSE 1
ቅዳሴ ማርያም ፤ መዝ. 104:2 ፤ ራእ. 2:1
አንዴ እየታጠቀ አንዴም እየፈታ
ገብርኤል ሲያበሥርሽ በፍጹም ሰላምታ
ይኩነኒ ብለሽ ስትቀበይው

VERSE 2
መለኮት እንዴት ነው የተዋሐደው?
ሉቃ. 1:38 ፤ ዮሐ. 1:14
ይህን ባሰብኩ ቁጥር ልቤ ይመሰጣል
ከዚህ በላይ ፍቅርስ እንዴት ይገለጣል

VERSE 3
መዝ. 8:3-4 ፤ ዮሐ. 15:13
ሁሉን የሚወስን ባንቺ ተወሰነ
ከሦስቱ አካል አንዱ ቃልም ሥጋ ሆነ
ስፋት እና ጥበት ሰማይ እና ምድር

VERSE 4
ባንቺ ተገናኙ ገባሬ እና ግብር
ምሳ. 30:4 ፤ ዮሐ. :14
ይህን ባሰብኩ ቁጥር ልቤ ይመሰጣል
ከዚህ በላይ ፍቅርስ እንዴት ይገለጣል

VERSE 5
መዝ. 8:3-4 ፤ ዮሐ. 15:13
እንዴት ቢመርጥሽ ነው እንዴት ቢያከብርሽ?
ትናንት እና ዛሬን ያገናኘብሽ
ምልዓትና ወሰን ግዝፈትና ርቀት

VERSE 6
ባንቺ ተዋሐዱ ፈጣሪና ፍጥረት
ሉቃ. 1:30 ፤ ዮሐ. 1:14
ይህን ባሰብኩ ቁጥር ልቤ ይመሰጣል
ከዚህ በላይ ፍቅርስ እንዴት ይገለጣል

VERSE 7
መዝ. 8:3-4 ፤ ዮሐ. 15:13
ምሥጢር ሊመረምር ይወጣል ሕሊና
ያልፋል ይሻገራል ከሰማይ ደመና
ነገር ግን አይችልም ምንም ቢገሠግሥ

VERSE 8
ከመሰወሪያው ዘንድ ከልጅሽም ሊደርስ
2 ቆሮ. 12:2 ፤ መዝ. 138:8
ስለዚህ አቅቶት ደክሞት ይመለሳል
መልክአ ውዳሴሽን በአድናቆት ያደርሳል',
      lyrics_transliteration = 'Sebatu ment’olaet wedet tegaredu
Sebatu mebratoch wedet tesenadu
Tanash mushra nesh yeasra amst amet
Beanchi lay sifets’em engda sirat

VERSE 1
Qidase Maryam ; mez. 104:2 ; rae. 2:1
Ande eyetat’eqe andem eyefeta
Gebriel siyabesrsh befts’um selamta
Yikuneni bilesh sitqebeyw

VERSE 2
Melekot endet new yetewahedew?
Luqa. 1:38 ; yohe. 1:14
Yihn basebku qut’r libe yimeset’al
Kezih belay fiqrs endet yigelet’al

VERSE 3
Mez. 8:3-4 ; yohe. 15:13
Hulun yemiwesn banchi tewesene
Kesostu akal andu qalm siga hone
Sifat ena t’bet semay ena midr

VERSE 4
Banchi tegenagnu gebare ena gibr
Misa. 30:4 ; yohe. :14
Yihn basebku qut’r libe yimeset’al
Kezih belay fiqrs endet yigelet’al

VERSE 5
Mez. 8:3-4 ; yohe. 15:13
Endet bimert’sh new endet biyakebrsh?
Tinant ena zaren yagenagnebsh
Milatna wesen gizfetna riqet

VERSE 6
Banchi tewahedu fet’arina fit’ret
Luqa. 1:30 ; yohe. 1:14
Yihn basebku qut’r libe yimeset’al
Kezih belay fiqrs endet yigelet’al

VERSE 7
Mez. 8:3-4 ; yohe. 15:13
Mist’ir limeremr yiwet’al hilina
Yalfal yishageral kesemay demena
Neger gin aychlm minm bigesegs

VERSE 8
Kemeseweriyaw zend keljshm liders
2 qoro. 12:2 ; mez. 138:8
Silezih aqtot dekmot yimelesal
Melka widaseshn beadnaqot yadersal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sebatu-menitolaet'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰባቱ መንጦላዕት ወዴት ተጋረዱ
ሰባቱ መብራቶች ወዴት ተሰናዱ
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት

VERSE 1
ቅዳሴ ማርያም ፤ መዝ. 104:2 ፤ ራእ. 2:1
አንዴ እየታጠቀ አንዴም እየፈታ
ገብርኤል ሲያበሥርሽ በፍጹም ሰላምታ
ይኩነኒ ብለሽ ስትቀበይው

CHORUS
ሰባቱ መንጦላዕት ወዴት ተጋረዱ
ሰባቱ መብራቶች ወዴት ተሰናዱ
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት

VERSE 2
መለኮት እንዴት ነው የተዋሐደው?
ሉቃ. 1:38 ፤ ዮሐ. 1:14
ይህን ባሰብኩ ቁጥር ልቤ ይመሰጣል
ከዚህ በላይ ፍቅርስ እንዴት ይገለጣል

CHORUS
ሰባቱ መንጦላዕት ወዴት ተጋረዱ
ሰባቱ መብራቶች ወዴት ተሰናዱ
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት

VERSE 3
መዝ. 8:3-4 ፤ ዮሐ. 15:13
ሁሉን የሚወስን ባንቺ ተወሰነ
ከሦስቱ አካል አንዱ ቃልም ሥጋ ሆነ
ስፋት እና ጥበት ሰማይ እና ምድር

CHORUS
ሰባቱ መንጦላዕት ወዴት ተጋረዱ
ሰባቱ መብራቶች ወዴት ተሰናዱ
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት

VERSE 4
ባንቺ ተገናኙ ገባሬ እና ግብር
ምሳ. 30:4 ፤ ዮሐ. :14
ይህን ባሰብኩ ቁጥር ልቤ ይመሰጣል
ከዚህ በላይ ፍቅርስ እንዴት ይገለጣል

CHORUS
ሰባቱ መንጦላዕት ወዴት ተጋረዱ
ሰባቱ መብራቶች ወዴት ተሰናዱ
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት

VERSE 5
መዝ. 8:3-4 ፤ ዮሐ. 15:13
እንዴት ቢመርጥሽ ነው እንዴት ቢያከብርሽ?
ትናንት እና ዛሬን ያገናኘብሽ
ምልዓትና ወሰን ግዝፈትና ርቀት

CHORUS
ሰባቱ መንጦላዕት ወዴት ተጋረዱ
ሰባቱ መብራቶች ወዴት ተሰናዱ
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት

VERSE 6
ባንቺ ተዋሐዱ ፈጣሪና ፍጥረት
ሉቃ. 1:30 ፤ ዮሐ. 1:14
ይህን ባሰብኩ ቁጥር ልቤ ይመሰጣል
ከዚህ በላይ ፍቅርስ እንዴት ይገለጣል

CHORUS
ሰባቱ መንጦላዕት ወዴት ተጋረዱ
ሰባቱ መብራቶች ወዴት ተሰናዱ
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት

VERSE 7
መዝ. 8:3-4 ፤ ዮሐ. 15:13
ምሥጢር ሊመረምር ይወጣል ሕሊና
ያልፋል ይሻገራል ከሰማይ ደመና
ነገር ግን አይችልም ምንም ቢገሠግሥ

CHORUS
ሰባቱ መንጦላዕት ወዴት ተጋረዱ
ሰባቱ መብራቶች ወዴት ተሰናዱ
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት

VERSE 8
ከመሰወሪያው ዘንድ ከልጅሽም ሊደርስ
2 ቆሮ. 12:2 ፤ መዝ. 138:8
ስለዚህ አቅቶት ደክሞት ይመለሳል
መልክአ ውዳሴሽን በአድናቆት ያደርሳል

CHORUS
ሰባቱ መንጦላዕት ወዴት ተጋረዱ
ሰባቱ መብራቶች ወዴት ተሰናዱ
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sebatu ment’olaet wedet tegaredu
Sebatu mebratoch wedet tesenadu
Tanash mushra nesh yeasra amst amet
Beanchi lay sifets’em engda sirat

VERSE 1
Qidase Maryam ; mez. 104:2 ; rae. 2:1
Ande eyetat’eqe andem eyefeta
Gebriel siyabesrsh befts’um selamta
Yikuneni bilesh sitqebeyw

CHORUS
Sebatu ment’olaet wedet tegaredu
Sebatu mebratoch wedet tesenadu
Tanash mushra nesh yeasra amst amet
Beanchi lay sifets’em engda sirat

VERSE 2
Melekot endet new yetewahedew?
Luqa. 1:38 ; yohe. 1:14
Yihn basebku qut’r libe yimeset’al
Kezih belay fiqrs endet yigelet’al

CHORUS
Sebatu ment’olaet wedet tegaredu
Sebatu mebratoch wedet tesenadu
Tanash mushra nesh yeasra amst amet
Beanchi lay sifets’em engda sirat

VERSE 3
Mez. 8:3-4 ; yohe. 15:13
Hulun yemiwesn banchi tewesene
Kesostu akal andu qalm siga hone
Sifat ena t’bet semay ena midr

CHORUS
Sebatu ment’olaet wedet tegaredu
Sebatu mebratoch wedet tesenadu
Tanash mushra nesh yeasra amst amet
Beanchi lay sifets’em engda sirat

VERSE 4
Banchi tegenagnu gebare ena gibr
Misa. 30:4 ; yohe. :14
Yihn basebku qut’r libe yimeset’al
Kezih belay fiqrs endet yigelet’al

CHORUS
Sebatu ment’olaet wedet tegaredu
Sebatu mebratoch wedet tesenadu
Tanash mushra nesh yeasra amst amet
Beanchi lay sifets’em engda sirat

VERSE 5
Mez. 8:3-4 ; yohe. 15:13
Endet bimert’sh new endet biyakebrsh?
Tinant ena zaren yagenagnebsh
Milatna wesen gizfetna riqet

CHORUS
Sebatu ment’olaet wedet tegaredu
Sebatu mebratoch wedet tesenadu
Tanash mushra nesh yeasra amst amet
Beanchi lay sifets’em engda sirat

VERSE 6
Banchi tewahedu fet’arina fit’ret
Luqa. 1:30 ; yohe. 1:14
Yihn basebku qut’r libe yimeset’al
Kezih belay fiqrs endet yigelet’al

CHORUS
Sebatu ment’olaet wedet tegaredu
Sebatu mebratoch wedet tesenadu
Tanash mushra nesh yeasra amst amet
Beanchi lay sifets’em engda sirat

VERSE 7
Mez. 8:3-4 ; yohe. 15:13
Mist’ir limeremr yiwet’al hilina
Yalfal yishageral kesemay demena
Neger gin aychlm minm bigesegs

CHORUS
Sebatu ment’olaet wedet tegaredu
Sebatu mebratoch wedet tesenadu
Tanash mushra nesh yeasra amst amet
Beanchi lay sifets’em engda sirat

VERSE 8
Kemeseweriyaw zend keljshm liders
2 qoro. 12:2 ; mez. 138:8
Silezih aqtot dekmot yimelesal
Melka widaseshn beadnaqot yadersal

CHORUS
Sebatu ment’olaet wedet tegaredu
Sebatu mebratoch wedet tesenadu
Tanash mushra nesh yeasra amst amet
Beanchi lay sifets’em engda sirat'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'sebatu-menitolaet', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Sebatu Menitolayit (sebatu-menitolayit)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሰባቱ መንጦላይት ወዴት ተጋረዱ
ሰባቱ መብራቶች ወዴት ተሰናዱ
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት

VERSE 1
አንዴ እየታጠቀ አንዴም እየፈታ
ገብርኤል ሲያበስርሽ በፍጹም ሰላምታ
ይኩነኒ ብለሽ ስትቀበይው
መለኮት እንዴት ነው የተዋሐደው

VERSE 2
ይህን ባሰብኩ ቁጥር ልቤ ይመሰጣል
ከዚህ በላይ ፍቅርስ እንዴት ይገለጣል

VERSE 3
ሁሉን የሚወስን ባንቺ ተወሰነ
ከሦስቱ አካል አንዱ ቃልም ሥጋ ሆነ
ስፋት እና ጥበት ሰማይ እና ምድር
ባንቺ ተገናኙ ገባሪና ግብር

VERSE 4
ይህን ባሰብኩ ቁጥር ልቤ ይመሰጣል
ከዚህ በላይ ፍቅርስ እንዴት ይገለጣል

VERSE 5
እንዴት ቢመርጥሽ ነው እንዴት ቢያከብርሽ
ትናንት እና ዛሬን ያገናኘብሽ
ምልዐትና ወሰን ግዝፈትና ርቀት
ባንቺ ተዋሐዱ ፈጣሪና ፍጥረት

VERSE 6
ይህን ባሰብኩ ቁጥር ልቤ ይመሰጣል
ከዚህ በላይ ፍቅርስ እንዴት ይገለጣል

VERSE 7
ምስጢር ሊመረምር ይወጣል ኀሊና
ያልፋል ይሻገራል ከሰማይ ደመና
ነገር ግን አይችልም ምንም ቢገሠግሥ
በመሰወሪያው ቀኝ ከልጅሽም ሊደርስ

VERSE 8
ስለዚህ አቅቶት ደክሞት ይመለሳል
መልክዐ ውዳሴሽን በአድናቆት ያደርሳል',
      lyrics_transliteration = 'Sebatu ment’olayt wedet tegaredu
Sebatu mebratoch wedet tesenadu
Tanash mushra nesh yeasra amst amet
Beanchi lay sifets’em engda sirat

VERSE 1
Ande eyetat’eqe andem eyefeta
Gebriel siyabesrsh befts’um selamta
Yikuneni bilesh sitqebeyw
Melekot endet new yetewahedew

VERSE 2
Yihn basebku qut’r libe yimeset’al
Kezih belay fiqrs endet yigelet’al

VERSE 3
Hulun yemiwesn banchi tewesene
Kesostu akal andu qalm siga hone
Sifat ena t’bet semay ena midr
Banchi tegenagnu gebarina gibr

VERSE 4
Yihn basebku qut’r libe yimeset’al
Kezih belay fiqrs endet yigelet’al

VERSE 5
Endet bimert’sh new endet biyakebrsh
Tinant ena zaren yagenagnebsh
Milatna wesen gizfetna riqet
Banchi tewahedu fet’arina fit’ret

VERSE 6
Yihn basebku qut’r libe yimeset’al
Kezih belay fiqrs endet yigelet’al

VERSE 7
Mist’ir limeremr yiwet’al helina
Yalfal yishageral kesemay demena
Neger gin aychlm minm bigesegs
Bemeseweriyaw qegn keljshm liders

VERSE 8
Silezih aqtot dekmot yimelesal
Melka widaseshn beadnaqot yadersal',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sebatu-menitolayit'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
ሰባቱ መብራቶች ወዴት ተሰናዱ
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት

VERSE 1
አንዴ እየታጠቀ አንዴም እየፈታ
ገብርኤል ሲያበስርሽ በፍጹም ሰላምታ
ይኩነኒ ብለሽ ስትቀበይው
መለኮት እንዴት ነው የተዋሐደው

CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
ሰባቱ መብራቶች ወዴት ተሰናዱ
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት

VERSE 2
ይህን ባሰብኩ ቁጥር ልቤ ይመሰጣል
ከዚህ በላይ ፍቅርስ እንዴት ይገለጣል

CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
ሰባቱ መብራቶች ወዴት ተሰናዱ
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት

VERSE 3
ሁሉን የሚወስን ባንቺ ተወሰነ
ከሦስቱ አካል አንዱ ቃልም ሥጋ ሆነ
ስፋት እና ጥበት ሰማይ እና ምድር
ባንቺ ተገናኙ ገባሪና ግብር

CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
ሰባቱ መብራቶች ወዴት ተሰናዱ
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት

VERSE 4
ይህን ባሰብኩ ቁጥር ልቤ ይመሰጣል
ከዚህ በላይ ፍቅርስ እንዴት ይገለጣል

CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
ሰባቱ መብራቶች ወዴት ተሰናዱ
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት

VERSE 5
እንዴት ቢመርጥሽ ነው እንዴት ቢያከብርሽ
ትናንት እና ዛሬን ያገናኘብሽ
ምልዐትና ወሰን ግዝፈትና ርቀት
ባንቺ ተዋሐዱ ፈጣሪና ፍጥረት

CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
ሰባቱ መብራቶች ወዴት ተሰናዱ
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት

VERSE 6
ይህን ባሰብኩ ቁጥር ልቤ ይመሰጣል
ከዚህ በላይ ፍቅርስ እንዴት ይገለጣል

CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
ሰባቱ መብራቶች ወዴት ተሰናዱ
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት

VERSE 7
ምስጢር ሊመረምር ይወጣል ኀሊና
ያልፋል ይሻገራል ከሰማይ ደመና
ነገር ግን አይችልም ምንም ቢገሠግሥ
በመሰወሪያው ቀኝ ከልጅሽም ሊደርስ

CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
ሰባቱ መብራቶች ወዴት ተሰናዱ
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት

VERSE 8
ስለዚህ አቅቶት ደክሞት ይመለሳል
መልክዐ ውዳሴሽን በአድናቆት ያደርሳል

CHORUS
ሰባቱ መንጦላይት ወዴት ተጋረዱ
ሰባቱ መብራቶች ወዴት ተሰናዱ
ታናሽ ሙሽራ ነሽ የአሥራ አምስት ዓመት
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sebatu ment’olayt wedet tegaredu
Sebatu mebratoch wedet tesenadu
Tanash mushra nesh yeasra amst amet
Beanchi lay sifets’em engda sirat

VERSE 1
Ande eyetat’eqe andem eyefeta
Gebriel siyabesrsh befts’um selamta
Yikuneni bilesh sitqebeyw
Melekot endet new yetewahedew

CHORUS
Sebatu ment’olayt wedet tegaredu
Sebatu mebratoch wedet tesenadu
Tanash mushra nesh yeasra amst amet
Beanchi lay sifets’em engda sirat

VERSE 2
Yihn basebku qut’r libe yimeset’al
Kezih belay fiqrs endet yigelet’al

CHORUS
Sebatu ment’olayt wedet tegaredu
Sebatu mebratoch wedet tesenadu
Tanash mushra nesh yeasra amst amet
Beanchi lay sifets’em engda sirat

VERSE 3
Hulun yemiwesn banchi tewesene
Kesostu akal andu qalm siga hone
Sifat ena t’bet semay ena midr
Banchi tegenagnu gebarina gibr

CHORUS
Sebatu ment’olayt wedet tegaredu
Sebatu mebratoch wedet tesenadu
Tanash mushra nesh yeasra amst amet
Beanchi lay sifets’em engda sirat

VERSE 4
Yihn basebku qut’r libe yimeset’al
Kezih belay fiqrs endet yigelet’al

CHORUS
Sebatu ment’olayt wedet tegaredu
Sebatu mebratoch wedet tesenadu
Tanash mushra nesh yeasra amst amet
Beanchi lay sifets’em engda sirat

VERSE 5
Endet bimert’sh new endet biyakebrsh
Tinant ena zaren yagenagnebsh
Milatna wesen gizfetna riqet
Banchi tewahedu fet’arina fit’ret

CHORUS
Sebatu ment’olayt wedet tegaredu
Sebatu mebratoch wedet tesenadu
Tanash mushra nesh yeasra amst amet
Beanchi lay sifets’em engda sirat

VERSE 6
Yihn basebku qut’r libe yimeset’al
Kezih belay fiqrs endet yigelet’al

CHORUS
Sebatu ment’olayt wedet tegaredu
Sebatu mebratoch wedet tesenadu
Tanash mushra nesh yeasra amst amet
Beanchi lay sifets’em engda sirat

VERSE 7
Mist’ir limeremr yiwet’al helina
Yalfal yishageral kesemay demena
Neger gin aychlm minm bigesegs
Bemeseweriyaw qegn keljshm liders

CHORUS
Sebatu ment’olayt wedet tegaredu
Sebatu mebratoch wedet tesenadu
Tanash mushra nesh yeasra amst amet
Beanchi lay sifets’em engda sirat

VERSE 8
Silezih aqtot dekmot yimelesal
Melka widaseshn beadnaqot yadersal

CHORUS
Sebatu ment’olayt wedet tegaredu
Sebatu mebratoch wedet tesenadu
Tanash mushra nesh yeasra amst amet
Beanchi lay sifets’em engda sirat'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'sebatu-menitolayit', v_updated;
  END IF;
  v_total := v_total + v_updated;

  -- Hymn: Sebhiwo Le’amlakine (sebhiwo-leamlakine)
  UPDATE public.mezmur_data_import
  SET lyrics_amharic = 'ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 1
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን
ይታያል ያበራል ጌታ ዛሬም በስራው
ምስጉን ነው ሰራዊት ሁሉ ያመሰገነው

VERSE 2
አዝ፡
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 3
ምህረቱ ይቅርታው ብዙ ከወሰን የሰፋ
አባት ነው ብርቱ መጠጊያ የሰው ልጆች ተስፋ
መጋቢ ለፍጥረት ዓለም ታላቅ ባለጸጋ
ያብባል ይለመልማል እርሱን የተጠጋ

VERSE 4
አዝ፡
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 5
ተመስገን ተመስገን ይላል የተጎበኘ ሰው
ከጥፋት ከጉስቁልና ከሞት የመለሰው
ይቀባል ከታች አንስቶ ከረኝነት ቦታ
ይቅርታው ጸጋው ብዙነው ምህረቱ የጌታ

VERSE 6
አዝ፡
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 7
መላእክት በላይ በሰማይ ይዘምሩለታል
ዳዊትም ከበገናው ጋር በቅኔ ተነስቷል
በምድርም እኛ ልጆቹ እንበል ንሴብሆ
ይገባል ለአምላከ እስራኤል ውዳሴ አምልኮ

VERSE 8
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/',
      lyrics_transliteration = 'Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 1
Semayun yal’mesoso atsentwal be-qalu
Meret’n be-wuhoch mehal mesertwal be-dinberun
Yitayal yaberal Geta zarem be-siraw
Misgun new serawit hulu ya-mesegenew

VERSE 2
Az:
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 3
Mihretu yiqirtaw bizu kewesen yesefa
Abat new birtu metegiya ye-sew lijoch tesfa
Megabi le-fitret alem talaq bale-tsega
Yabibal yilemlemal ersun yetetega

VERSE 4
Az:
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 5
Temesgen temesgen yilal yetegobenye sew
Ketifat kegusqulna kemot yemelesew
Yiqebal ketach ansito kerenyet bota
Yiqirtaw tsegaw bizu new mihretu ye-Geta

VERSE 6
Az:
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 7
Mela’ekt belay be-semay yizemiruletal
Dawit’m kebegenaw gar be-qine tenestwal
Be-midirm igna lijochu enbel Nesebho
Yigebal le-Amlake Israel widase amliko

VERSE 8
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)',
      lyrics_english = NULL,
      lyrics_geez = NULL,
      lyrics_oromo = NULL,
      updated_at = NOW()::text
  WHERE slug = 'sebhiwo-leamlakine'
    AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 1
ሰማዩን ያልምሶሶ አጽንቷል በቃሉ
መሬትን በውሆች መሃል መስርቷል ድንበሩን
ይታያል ያበራል ጌታ ዛሬም በስራው
ምስጉን ነው ሰራዊት ሁሉ ያመሰገነው

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 2
አዝ፡
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 3
ምህረቱ ይቅርታው ብዙ ከወሰን የሰፋ
አባት ነው ብርቱ መጠጊያ የሰው ልጆች ተስፋ
መጋቢ ለፍጥረት ዓለም ታላቅ ባለጸጋ
ያብባል ይለመልማል እርሱን የተጠጋ

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 4
አዝ፡
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 5
ተመስገን ተመስገን ይላል የተጎበኘ ሰው
ከጥፋት ከጉስቁልና ከሞት የመለሰው
ይቀባል ከታች አንስቶ ከረኝነት ቦታ
ይቅርታው ጸጋው ብዙነው ምህረቱ የጌታ

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 6
አዝ፡
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 7
መላእክት በላይ በሰማይ ይዘምሩለታል
ዳዊትም ከበገናው ጋር በቅኔ ተነስቷል
በምድርም እኛ ልጆቹ እንበል ንሴብሆ
ይገባል ለአምላከ እስራኤል ውዳሴ አምልኮ

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

VERSE 8
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/

CHORUS
ሰብሕዎ ለአምላክነ
ሰብሕዎ ለአምላክነ ሃሌ ሉያ ለእግዚአብሔር /፪/
በሰማይ በምድር /፮/'
    AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 1
Semayun yal’mesoso atsentwal be-qalu
Meret’n be-wuhoch mehal mesertwal be-dinberun
Yitayal yaberal Geta zarem be-siraw
Misgun new serawit hulu ya-mesegenew

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 2
Az:
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 3
Mihretu yiqirtaw bizu kewesen yesefa
Abat new birtu metegiya ye-sew lijoch tesfa
Megabi le-fitret alem talaq bale-tsega
Yabibal yilemlemal ersun yetetega

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 4
Az:
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 5
Temesgen temesgen yilal yetegobenye sew
Ketifat kegusqulna kemot yemelesew
Yiqebal ketach ansito kerenyet bota
Yiqirtaw tsegaw bizu new mihretu ye-Geta

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 6
Az:
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 7
Mela’ekt belay be-semay yizemiruletal
Dawit’m kebegenaw gar be-qine tenestwal
Be-midirm igna lijochu enbel Nesebho
Yigebal le-Amlake Israel widase amliko

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

VERSE 8
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)

CHORUS
Sebhiwo le’amlakine
Sebhiwo le’amlakine Halle luya l’Egziabeher (2x)
Be semay be midir (6x)'
    AND lyrics_english IS NOT DISTINCT FROM NULL
    AND lyrics_geez IS NOT DISTINCT FROM NULL
    AND lyrics_oromo IS NOT DISTINCT FROM NULL;
  GET DIAGNOSTICS v_updated = ROW_COUNT;
  IF v_updated <> 1 THEN
    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', 'sebhiwo-leamlakine', v_updated;
  END IF;
  v_total := v_total + v_updated;

  IF v_total <> 100 THEN
    RAISE EXCEPTION 'Batch 07 count mismatch: expected 100, got %', v_total;
  END IF;

  RAISE NOTICE 'SUCCESS: Batch 07 completed: % hymns updated.', v_total;
END $batch_07$;
