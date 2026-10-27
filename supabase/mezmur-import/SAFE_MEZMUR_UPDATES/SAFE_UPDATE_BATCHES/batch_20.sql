-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 20 OF 32
-- Target Table: public.mezmur_data_import
-- Total Records in Batch: 34
-- Target Condition: WHERE import_id = '<UUID>'::uuid (Primary Key)
-- Concurrency Protection: IS NOT DISTINCT FROM baseline values
-- Atomicity: PL/pgSQL block rolls back entirely on any 0-row update (ERRCODE 40001)
-- Idempotency: EXISTS check ensures safe re-runs without duplicate execution
-- ============================================================================
BEGIN;

DO $$
DECLARE
  v_rows integer;
BEGIN
  -- be-efrata-midir ("be efrata midir")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '937a9478-cd54-4a99-af44-79bcbd09134e'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ፍጥረትም ዘመረ ሀሌ ሉያ እያለ/2/',
        lyrics_transliteration = 'CHORUS
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
Fit’retm zemere hele luya eyale (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '937a9478-cd54-4a99-af44-79bcbd09134e'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '937a9478-cd54-4a99-af44-79bcbd09134e'::uuid, 'be-efrata-midir', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- anichin-yeyaze-sew ("Anichin Yeyaze Sew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '93a13614-ffc6-4a8a-af7b-02b5c8437282'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ሁሉም ይሸፍነናል',
        lyrics_transliteration = 'CHORUS
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
Hulum yishefnenal',
        updated_at = clock_timestamp()::text
    WHERE import_id = '93a13614-ffc6-4a8a-af7b-02b5c8437282'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '93a13614-ffc6-4a8a-af7b-02b5c8437282'::uuid, 'anichin-yeyaze-sew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- hawaryaw-menekuse-yemeretuh-selase ("Ḥawaryaw Menekuse")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '169c6371-9c62-4ae5-b017-eefdd6940ee2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 1
ዳሞት ትናገረው የአንተን ሐዋርያነት
የወንጌል ገበሬ የጣኦታት ጠላት
ጸሎተኛው ቅዱስ አባ ተክለሐይማኖት
ክንፍን የተሸለምክ እንደ ሰማይ መልአክ (2)

CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 2
ብራናው ሲገለጽ ገድለ ተክለሐይማኖት
ከሰወ ልጅ ልቦና ያወጣል አጋንት
የቅዳሴው ዕጣን ሲወጣ ከዋሻው
ምድርን ይባርካል ጸሎቱ ምህላው (2)

CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 3
የኢትዮጵያን ምድር አርስከው በመስቀል
ጭንጫው ፈራረሰ ተዘራበት ወንጌል
ትላንት የዘራኽው ዛሬ ለእኛ ሆኗል
አምላከ ተክልዬ ብለን ተምረናል (2)

CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 4
ከሱራፌል ተርታ ቆመህ ስታጥን
ቅዱስ ቅዱስ ብለህ ስታመሰግን
ጸሎት ትሩፋትህ ትህትና ስግደትህ
ፆምህ ከፍ አድርጎ ሰማይ አደረሰህ (2)

CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 5
ዛፉ ሲመነገል አምላክ የተባለው
መቶሎሚ ሲያፍር ትልቅ ሰው ነኝ ያለው
የተክልዬ ጸሎት ብዙ ነወ ምስጢሩ
ስድስት ክንፍ አወጣ ቢቆረጥ አንድ እግሩ (2)

CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 1
Damot ṭenagerew Ye-anten ḥawaryanat
Ye-wengel gebere Ye-ṭaotat ṭelat
Tselotenghaw kidus Abba Tekle Haymanot
Kenfihin yetešhelemk enda semay mal’ak (2)

CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 2
Beranaw sigeleṣ gedle Tekle Haymanot
Kesew lej lebona yaweṭal agannt
Ye-qedasew eṭan siweṭa kewashaw
Medren yebarkal Tselotu mehlaw (2)

CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 3
YeEthiopyan medr arsekew bemeskel
Chincaw ferarese tezerabet wengel
Telant yezeraghew zare leegha honwal
Amlake Tekleye blen temrenal (2)

CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 4
Kesurafel terta komeh seṭaṭen
Kidus kidus bleh seṭamesgen
Tselot terufathe teḥetna segdathe
Tsomeh kef adergo semay adereseh (2)

CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 5
Zafu simeneggel amlak yeṭebalew
Metolomi siafr teleq sew neghe yalew
YeTekleye tselot bezu nw mestiru
Sedest kenf aweṭa biqoret andu egru (2)

CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 1
ዳሞት ትናገረው የአንተን ሐዋርያነት
የወንጌል ገበሬ የጣኦታት ጠላት
ጸሎተኛው ቅዱስ አባ ተክለሐይማኖት
ክንፍን የተሸለምክ እንደ ሰማይ መልአክ (2)

CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 2
ብራናው ሲገለጽ ገድለ ተክለሐይማኖት
ከሰወ ልጅ ልቦና ያወጣል አጋንት
የቅዳሴው ዕጣን ሲወጣ ከዋሻው
ምድርን ይባርካል ጸሎቱ ምህላው (2)

CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 3
የኢትዮጵያን ምድር አርስከው በመስቀል
ጭንጫው ፈራረሰ ተዘራበት ወንጌል
ትላንት የዘራኽው ዛሬ ለእኛ ሆኗል
አምላከ ተክልዬ ብለን ተምረናል (2)

CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 4
ከሱራፌል ተርታ ቆመህ ስታጥን
ቅዱስ ቅዱስ ብለህ ስታመሰግን
ጸሎት ትሩፋትህ ትህትና ስግደትህ
ፆምህ ከፍ አድርጎ ሰማይ አደረሰህ (2)

CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 5
ዛፉ ሲመነገል አምላክ የተባለው
መቶሎሚ ሲያፍር ትልቅ ሰው ነኝ ያለው
የተክልዬ ጸሎት ብዙ ነወ ምስጢሩ
ስድስት ክንፍ አወጣ ቢቆረጥ አንድ እግሩ (2)

CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ',
        lyrics_transliteration = 'CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 1
Damot ṭenagerew Ye-anten ḥawaryanat
Ye-wengel gebere Ye-ṭaotat ṭelat
Tselotenghaw kidus Abba Tekle Haymanot
Kenfihin yetešhelemk enda semay mal’ak (2)

CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 2
Beranaw sigeleṣ gedle Tekle Haymanot
Kesew lej lebona yaweṭal agannt
Ye-qedasew eṭan siweṭa kewashaw
Medren yebarkal Tselotu mehlaw (2)

CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 3
YeEthiopyan medr arsekew bemeskel
Chincaw ferarese tezerabet wengel
Telant yezeraghew zare leegha honwal
Amlake Tekleye blen temrenal (2)

CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 4
Kesurafel terta komeh seṭaṭen
Kidus kidus bleh seṭamesgen
Tselot terufathe teḥetna segdathe
Tsomeh kef adergo semay adereseh (2)

CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 5
Zafu simeneggel amlak yeṭebalew
Metolomi siafr teleq sew neghe yalew
YeTekleye tselot bezu nw mestiru
Sedest kenf aweṭa biqoret andu egru (2)

CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse',
        updated_at = clock_timestamp()::text
    WHERE import_id = '169c6371-9c62-4ae5-b017-eefdd6940ee2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 1
ዳሞት ትናገረው የአንተን ሐዋርያነት
የወንጌል ገበሬ የጣኦታት ጠላት
ጸሎተኛው ቅዱስ አባ ተክለሐይማኖት
ክንፍን የተሸለምክ እንደ ሰማይ መልአክ (2)

CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 2
ብራናው ሲገለጽ ገድለ ተክለሐይማኖት
ከሰወ ልጅ ልቦና ያወጣል አጋንት
የቅዳሴው ዕጣን ሲወጣ ከዋሻው
ምድርን ይባርካል ጸሎቱ ምህላው (2)

CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 3
የኢትዮጵያን ምድር አርስከው በመስቀል
ጭንጫው ፈራረሰ ተዘራበት ወንጌል
ትላንት የዘራኽው ዛሬ ለእኛ ሆኗል
አምላከ ተክልዬ ብለን ተምረናል (2)

CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 4
ከሱራፌል ተርታ ቆመህ ስታጥን
ቅዱስ ቅዱስ ብለህ ስታመሰግን
ጸሎት ትሩፋትህ ትህትና ስግደትህ
ፆምህ ከፍ አድርጎ ሰማይ አደረሰህ (2)

CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ

VERSE 5
ዛፉ ሲመነገል አምላክ የተባለው
መቶሎሚ ሲያፍር ትልቅ ሰው ነኝ ያለው
የተክልዬ ጸሎት ብዙ ነወ ምስጢሩ
ስድስት ክንፍ አወጣ ቢቆረጥ አንድ እግሩ (2)

CHORUS
ሐዋርያው መነኩሴ የመረጡህ ሥላሴ (2)
ዋስ ጠበቃ ሁናት ተክልዬ ለነፍሴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 1
Damot ṭenagerew Ye-anten ḥawaryanat
Ye-wengel gebere Ye-ṭaotat ṭelat
Tselotenghaw kidus Abba Tekle Haymanot
Kenfihin yetešhelemk enda semay mal’ak (2)

CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 2
Beranaw sigeleṣ gedle Tekle Haymanot
Kesew lej lebona yaweṭal agannt
Ye-qedasew eṭan siweṭa kewashaw
Medren yebarkal Tselotu mehlaw (2)

CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 3
YeEthiopyan medr arsekew bemeskel
Chincaw ferarese tezerabet wengel
Telant yezeraghew zare leegha honwal
Amlake Tekleye blen temrenal (2)

CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 4
Kesurafel terta komeh seṭaṭen
Kidus kidus bleh seṭamesgen
Tselot terufathe teḥetna segdathe
Tsomeh kef adergo semay adereseh (2)

CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse

VERSE 5
Zafu simeneggel amlak yeṭebalew
Metolomi siafr teleq sew neghe yalew
YeTekleye tselot bezu nw mestiru
Sedest kenf aweṭa biqoret andu egru (2)

CHORUS
Ḥawaryaw menekuse yemeretu selase (2)
Was ṭebeqa hunat Tekleye la-nefse';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '169c6371-9c62-4ae5-b017-eefdd6940ee2'::uuid, 'hawaryaw-menekuse-yemeretuh-selase', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- wedase-maryam ("Wedase Maryam")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1a432717-9a39-4ae4-ba82-de7b3b85f685'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 1
ውዳሴ ማርያም በሰርክ ጸሎት ላይ ውዳሴ ማርያም ዜማ ስናደርስ
›› ድንግል ትመጣለች ›› በቤተ መቅደስ
›› የብርሃን ምንጣፍ ›› ከፊቷ ተነጥፏል
›› ቅዱስ ኤፍሬም ታጥቆ ›› ያመሰግናታል

CHORUS
ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 2
ውዳሴ ማርያም አባ ህርያቆስ ውዳሴ ማርያም ምስጋና ያደርሳል
›› የቅዳሴው ዜማ ›› ልብን ይመስጣል
›› በጎ ነገር ልቤ ›› አወጣ አያለ
›› ዳዊት በገናውን ›› እየደረደረ

CHORUS
ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 3
ውዳሴ ማርያም የንጽህናችን ውዳሴ ማርያም መሰረት ነሽና
›› አንቺን ለማመስገን ›› ልቦናዬ ይጽና
›› ተፈስሒ ድንግል ›› ኦ ቤተልሔም
›› ካንቺ ተወለደ ›› መድሃኒዓለም

CHORUS
ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 4
ውዳሴ ማርያም ቅድሳት ሁሉ ውዳሴ ማርያም ዙሪያስን ከበዋል
›› አባ ጊዮርጊስም ›› ንኢ ድንግል ይላል
›› በወርቅ ዙፋን ላይ ›› ተቀምጠሽ ሳይሽ
›› ልቤ ተሰወረ ›› ድንግል በግርማሽ

CHORUS
ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign

VERSE 1
Wedase Maryam beserk tselot lay wedase Maryam zema sinaders
›› Dingil timetaletch ›› bete meqdes
›› Ye birhan mint’af ›› kefitwa tenet’fwal
›› Kidus Efrem tat’ko ›› yamesegnatal

CHORUS
Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign

VERSE 2
Wedase Maryam Aba Hiryaqos wedase Maryam misgana yadersal
›› Ye kidasew zema ›› libn yimest’al
›› Bego neger libe ›› aweta ayale
›› Dawit begnawn ›› eyederedere

CHORUS
Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign

VERSE 3
Wedase Maryam ye nits’ihnatchin wedase Maryam meseret neshna
›› Anchin lememesgen ›› libonaye yits’na
›› Tefes’hi dingil ›› o Betlehem
›› Kanchi teweledé ›› Medhanealem

CHORUS
Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign

VERSE 4
Wedase Maryam kidusat hulu wedase Maryam zuriyasin kebewal
›› Aba Giyorgis ›› ni’i dingil yilal
›› Beworq zufan lay ›› teqemtesh sayish
›› Libe tesewere ›› dingil begirmash

CHORUS
Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 1
ውዳሴ ማርያም በሰርክ ጸሎት ላይ ውዳሴ ማርያም ዜማ ስናደርስ
›› ድንግል ትመጣለች ›› በቤተ መቅደስ
›› የብርሃን ምንጣፍ ›› ከፊቷ ተነጥፏል
›› ቅዱስ ኤፍሬም ታጥቆ ›› ያመሰግናታል

CHORUS
ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 2
ውዳሴ ማርያም አባ ህርያቆስ ውዳሴ ማርያም ምስጋና ያደርሳል
›› የቅዳሴው ዜማ ›› ልብን ይመስጣል
›› በጎ ነገር ልቤ ›› አወጣ አያለ
›› ዳዊት በገናውን ›› እየደረደረ

CHORUS
ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 3
ውዳሴ ማርያም የንጽህናችን ውዳሴ ማርያም መሰረት ነሽና
›› አንቺን ለማመስገን ›› ልቦናዬ ይጽና
›› ተፈስሒ ድንግል ›› ኦ ቤተልሔም
›› ካንቺ ተወለደ ›› መድሃኒዓለም

CHORUS
ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 4
ውዳሴ ማርያም ቅድሳት ሁሉ ውዳሴ ማርያም ዙሪያስን ከበዋል
›› አባ ጊዮርጊስም ›› ንኢ ድንግል ይላል
›› በወርቅ ዙፋን ላይ ›› ተቀምጠሽ ሳይሽ
›› ልቤ ተሰወረ ›› ድንግል በግርማሽ

CHORUS
ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ',
        lyrics_transliteration = 'CHORUS
Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign

VERSE 1
Wedase Maryam beserk tselot lay wedase Maryam zema sinaders
›› Dingil timetaletch ›› bete meqdes
›› Ye birhan mint’af ›› kefitwa tenet’fwal
›› Kidus Efrem tat’ko ›› yamesegnatal

CHORUS
Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign

VERSE 2
Wedase Maryam Aba Hiryaqos wedase Maryam misgana yadersal
›› Ye kidasew zema ›› libn yimest’al
›› Bego neger libe ›› aweta ayale
›› Dawit begnawn ›› eyederedere

CHORUS
Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign

VERSE 3
Wedase Maryam ye nits’ihnatchin wedase Maryam meseret neshna
›› Anchin lememesgen ›› libonaye yits’na
›› Tefes’hi dingil ›› o Betlehem
›› Kanchi teweledé ›› Medhanealem

CHORUS
Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign

VERSE 4
Wedase Maryam kidusat hulu wedase Maryam zuriyasin kebewal
›› Aba Giyorgis ›› ni’i dingil yilal
›› Beworq zufan lay ›› teqemtesh sayish
›› Libe tesewere ›› dingil begirmash

CHORUS
Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1a432717-9a39-4ae4-ba82-de7b3b85f685'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 1
ውዳሴ ማርያም በሰርክ ጸሎት ላይ ውዳሴ ማርያም ዜማ ስናደርስ
›› ድንግል ትመጣለች ›› በቤተ መቅደስ
›› የብርሃን ምንጣፍ ›› ከፊቷ ተነጥፏል
›› ቅዱስ ኤፍሬም ታጥቆ ›› ያመሰግናታል

CHORUS
ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 2
ውዳሴ ማርያም አባ ህርያቆስ ውዳሴ ማርያም ምስጋና ያደርሳል
›› የቅዳሴው ዜማ ›› ልብን ይመስጣል
›› በጎ ነገር ልቤ ›› አወጣ አያለ
›› ዳዊት በገናውን ›› እየደረደረ

CHORUS
ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 3
ውዳሴ ማርያም የንጽህናችን ውዳሴ ማርያም መሰረት ነሽና
›› አንቺን ለማመስገን ›› ልቦናዬ ይጽና
›› ተፈስሒ ድንግል ›› ኦ ቤተልሔም
›› ካንቺ ተወለደ ›› መድሃኒዓለም

CHORUS
ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ

VERSE 4
ውዳሴ ማርያም ቅድሳት ሁሉ ውዳሴ ማርያም ዙሪያስን ከበዋል
›› አባ ጊዮርጊስም ›› ንኢ ድንግል ይላል
›› በወርቅ ዙፋን ላይ ›› ተቀምጠሽ ሳይሽ
›› ልቤ ተሰወረ ›› ድንግል በግርማሽ

CHORUS
ውዳሴ ማርያም እጮሃለሁ
ድንግል እናቴን እጣራለሁ
እንደ አባ ኤፍሬም ነይ ባርኪኝ
ወድሰኒ ልጄ በይኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign

VERSE 1
Wedase Maryam beserk tselot lay wedase Maryam zema sinaders
›› Dingil timetaletch ›› bete meqdes
›› Ye birhan mint’af ›› kefitwa tenet’fwal
›› Kidus Efrem tat’ko ›› yamesegnatal

CHORUS
Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign

VERSE 2
Wedase Maryam Aba Hiryaqos wedase Maryam misgana yadersal
›› Ye kidasew zema ›› libn yimest’al
›› Bego neger libe ›› aweta ayale
›› Dawit begnawn ›› eyederedere

CHORUS
Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign

VERSE 3
Wedase Maryam ye nits’ihnatchin wedase Maryam meseret neshna
›› Anchin lememesgen ›› libonaye yits’na
›› Tefes’hi dingil ›› o Betlehem
›› Kanchi teweledé ›› Medhanealem

CHORUS
Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign

VERSE 4
Wedase Maryam kidusat hulu wedase Maryam zuriyasin kebewal
›› Aba Giyorgis ›› ni’i dingil yilal
›› Beworq zufan lay ›› teqemtesh sayish
›› Libe tesewere ›› dingil begirmash

CHORUS
Wedase Maryam ichohalew
Dingil enaten it’aralew
Ende Aba Efrem ney barkign
Wedseni lijé beyign';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1a432717-9a39-4ae4-ba82-de7b3b85f685'::uuid, 'wedase-maryam', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yeelet-yeamet-yezemenat-geta ("Yeelet Yeamet Yezemenat Geta")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '37d1770a-a1f4-4724-b4be-fa6881d078d3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን

VERSE 1
ለዚህ ዕለት ለዚህ ዓመት ላደረሰን ሁላችንን/፪/
የሰው ልጆች እድሜ ጥንቱንም ሲጀመር
ምን ቢወጣ ቢወርድ ቢበዛ ቢደመር
አንድ ቀን አይሞላም እንደ አንተ አቆጣጠር /፪/

CHORUS
የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን

VERSE 2
ስለዚህ አምላክ ሆይ ንዑድ ነው ክቡር ነው
ወደአንተ እንዲመለስ ቀን የሰጠኸው ሰው
ደካማ ነውና ሰው እድሜ ከራበው/፪/
እጅግ አደንቃለሁ የአምላክን ጥበብ

CHORUS
የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን

VERSE 3
ምድርን በአበባ ሰማዩን በኮከብ
እንዳሸበረቀ አስተውዬ ሳስብ/፪/
ከንቱ ካሳለፍኩት ጊዜዬን በዋዛ
ምን ያደርግልኛል ዘመኔ ቢበዛ

CHORUS
የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን

VERSE 4
ደግሞም በጠቅላላው ዓለምን ብገዛ/፪/
ወርኃ ክረምት አልፎ መስከረም ሲጠባ
ምድር በልምላሜ ስታጌጥ በአበባ
እናምናለን ለአንተ ምስጋና እንዲገባ/፪/

CHORUS
የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yeelet yeamet yezemenat Geta
Lezih ladereskegn zemenen satgeta
Aqerblhahu yekbr selamta (2)
Nu enamesgn kelbachn yesemayun abatachnn

VERSE 1
Lezih elet lezih amet laderesen hulachnn (2)
Yesew lijoch edme t’ntunm sijemer
Min biwet’a biwerd bibeza bidemer
And qen aymolam ende ante aqot’at’er (2)

CHORUS
Yeelet yeamet yezemenat Geta
Lezih ladereskegn zemenen satgeta
Aqerblhahu yekbr selamta (2)
Nu enamesgn kelbachn yesemayun abatachnn

VERSE 2
Silezih amlak hoy niud new kibur new
Wedeante endimeles qen yeset’eኸw sew
Dekama newna sew edme kerabew (2)
Ejg adenqalehu yeamlakn t’beb

CHORUS
Yeelet yeamet yezemenat Geta
Lezih ladereskegn zemenen satgeta
Aqerblhahu yekbr selamta (2)
Nu enamesgn kelbachn yesemayun abatachnn

VERSE 3
Midrn beabeba semayun bekokeb
Endashebereqe astewye sasb (2)
Kentu kasalefkut gizeyen bewaza
Min yaderglgnal zemene bibeza

CHORUS
Yeelet yeamet yezemenat Geta
Lezih ladereskegn zemenen satgeta
Aqerblhahu yekbr selamta (2)
Nu enamesgn kelbachn yesemayun abatachnn

VERSE 4
Degmom bet’eqlalaw alemn bigeza (2)
Werha kiremt alfo meskerem sit’eba
Midr belmlame sitaget’ beabeba
Enamnalen leante misgana endigeba (2)

CHORUS
Yeelet yeamet yezemenat Geta
Lezih ladereskegn zemenen satgeta
Aqerblhahu yekbr selamta (2)
Nu enamesgn kelbachn yesemayun abatachnn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን

VERSE 1
ለዚህ ዕለት ለዚህ ዓመት ላደረሰን ሁላችንን/፪/
የሰው ልጆች እድሜ ጥንቱንም ሲጀመር
ምን ቢወጣ ቢወርድ ቢበዛ ቢደመር
አንድ ቀን አይሞላም እንደ አንተ አቆጣጠር /፪/

CHORUS
የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን

VERSE 2
ስለዚህ አምላክ ሆይ ንዑድ ነው ክቡር ነው
ወደአንተ እንዲመለስ ቀን የሰጠኸው ሰው
ደካማ ነውና ሰው እድሜ ከራበው/፪/
እጅግ አደንቃለሁ የአምላክን ጥበብ

CHORUS
የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን

VERSE 3
ምድርን በአበባ ሰማዩን በኮከብ
እንዳሸበረቀ አስተውዬ ሳስብ/፪/
ከንቱ ካሳለፍኩት ጊዜዬን በዋዛ
ምን ያደርግልኛል ዘመኔ ቢበዛ

CHORUS
የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን

VERSE 4
ደግሞም በጠቅላላው ዓለምን ብገዛ/፪/
ወርኃ ክረምት አልፎ መስከረም ሲጠባ
ምድር በልምላሜ ስታጌጥ በአበባ
እናምናለን ለአንተ ምስጋና እንዲገባ/፪/

CHORUS
የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን',
        lyrics_transliteration = 'CHORUS
Yeelet yeamet yezemenat Geta
Lezih ladereskegn zemenen satgeta
Aqerblhahu yekbr selamta (2)
Nu enamesgn kelbachn yesemayun abatachnn

VERSE 1
Lezih elet lezih amet laderesen hulachnn (2)
Yesew lijoch edme t’ntunm sijemer
Min biwet’a biwerd bibeza bidemer
And qen aymolam ende ante aqot’at’er (2)

CHORUS
Yeelet yeamet yezemenat Geta
Lezih ladereskegn zemenen satgeta
Aqerblhahu yekbr selamta (2)
Nu enamesgn kelbachn yesemayun abatachnn

VERSE 2
Silezih amlak hoy niud new kibur new
Wedeante endimeles qen yeset’eኸw sew
Dekama newna sew edme kerabew (2)
Ejg adenqalehu yeamlakn t’beb

CHORUS
Yeelet yeamet yezemenat Geta
Lezih ladereskegn zemenen satgeta
Aqerblhahu yekbr selamta (2)
Nu enamesgn kelbachn yesemayun abatachnn

VERSE 3
Midrn beabeba semayun bekokeb
Endashebereqe astewye sasb (2)
Kentu kasalefkut gizeyen bewaza
Min yaderglgnal zemene bibeza

CHORUS
Yeelet yeamet yezemenat Geta
Lezih ladereskegn zemenen satgeta
Aqerblhahu yekbr selamta (2)
Nu enamesgn kelbachn yesemayun abatachnn

VERSE 4
Degmom bet’eqlalaw alemn bigeza (2)
Werha kiremt alfo meskerem sit’eba
Midr belmlame sitaget’ beabeba
Enamnalen leante misgana endigeba (2)

CHORUS
Yeelet yeamet yezemenat Geta
Lezih ladereskegn zemenen satgeta
Aqerblhahu yekbr selamta (2)
Nu enamesgn kelbachn yesemayun abatachnn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '37d1770a-a1f4-4724-b4be-fa6881d078d3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን

VERSE 1
ለዚህ ዕለት ለዚህ ዓመት ላደረሰን ሁላችንን/፪/
የሰው ልጆች እድሜ ጥንቱንም ሲጀመር
ምን ቢወጣ ቢወርድ ቢበዛ ቢደመር
አንድ ቀን አይሞላም እንደ አንተ አቆጣጠር /፪/

CHORUS
የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን

VERSE 2
ስለዚህ አምላክ ሆይ ንዑድ ነው ክቡር ነው
ወደአንተ እንዲመለስ ቀን የሰጠኸው ሰው
ደካማ ነውና ሰው እድሜ ከራበው/፪/
እጅግ አደንቃለሁ የአምላክን ጥበብ

CHORUS
የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን

VERSE 3
ምድርን በአበባ ሰማዩን በኮከብ
እንዳሸበረቀ አስተውዬ ሳስብ/፪/
ከንቱ ካሳለፍኩት ጊዜዬን በዋዛ
ምን ያደርግልኛል ዘመኔ ቢበዛ

CHORUS
የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን

VERSE 4
ደግሞም በጠቅላላው ዓለምን ብገዛ/፪/
ወርኃ ክረምት አልፎ መስከረም ሲጠባ
ምድር በልምላሜ ስታጌጥ በአበባ
እናምናለን ለአንተ ምስጋና እንዲገባ/፪/

CHORUS
የዕለት የዓመት የዘመናት ጌታ
ለዚህ ላደረስከኝ ዘመኔን ሳትገታ
አቀርብልሃሁ የክብር ሰላምታ/፪/
ኑ እናመስግን ከልባችን የሰማዩን አባታችንን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '37d1770a-a1f4-4724-b4be-fa6881d078d3'::uuid, 'yeelet-yeamet-yezemenat-geta', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yemisirach-des-yibelen-yealem-medihanit-teweledelin-oritodokis-tewahido ("Yemisirach Des Yibelen Yealem Medihanit Teweledelin : Oritodokis Tewahido Mezimur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6ad23cf2-d994-4333-adce-7f63dc1eaa52'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ኢየሱስ /የዓለም ቤዛ/ (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Iyesus /yealem beza/ (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '6ad23cf2-d994-4333-adce-7f63dc1eaa52'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የምስራች ደስ ይበለን (፪)
የዓለም መድኃኒት ተወለደልን
የምስራች ደስ ይበለን
ኢየሱስ /የዓለም ቤዛ/ (፪)
የዓለም ቤዛ (፫) ለኛ ተወለደልን
አዝ = = = = =
ንጉሥ ሄሮድስ ይህን ሲሰማ (፪)
ፈልጋችሁ አምጡት በቀን በጨለማ (፪)
አዝ = = = = =
ሰብዐሰገል እንደታዘዙት (፪)
በኮከብ ተመርተው ህፃኑን አገኙት (፪)
አዝ = = = = =
ሰገዱለት ከመሬት ወድቀው (፪)
ወርቅ እጣን ከርቤውን በረከቱን ሰጥተው (፪)

VERSE 1
የምስራች ደስ ይበለን (፪)
የዓለም መድኃኒት ተወለደልን
የምስራች ደስ ይበለን
ኢየሱስ /የዓለም ቤዛ/ (፪)
የዓለም ቤዛ (፫) ለኛ ተወለደልን
አዝ = = = = =
ንጉሥ ሄሮድስ ይህን ሲሰማ (፪)
ፈልጋችሁ አምጡት በቀን በጨለማ (፪)
አዝ = = = = =
ሰብዐሰገል እንደታዘዙት (፪)
በኮከብ ተመርተው ህፃኑን አገኙት (፪)
አዝ = = = = =
ሰገዱለት ከመሬት ወድቀው (፪)
ወርቅ እጣን ከርቤውን በረከቱን ሰጥተው (፪)

CHORUS
የምስራች ደስ ይበለን (፪)
የዓለም መድኃኒት ተወለደልን
የምስራች ደስ ይበለን
ኢየሱስ /የዓለም ቤዛ/ (፪)
የዓለም ቤዛ (፫) ለኛ ተወለደልን
አዝ = = = = =
ንጉሥ ሄሮድስ ይህን ሲሰማ (፪)
ፈልጋችሁ አምጡት በቀን በጨለማ (፪)
አዝ = = = = =
ሰብዐሰገል እንደታዘዙት (፪)
በኮከብ ተመርተው ህፃኑን አገኙት (፪)
አዝ = = = = =
ሰገዱለት ከመሬት ወድቀው (፪)
ወርቅ እጣን ከርቤውን በረከቱን ሰጥተው (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6ad23cf2-d994-4333-adce-7f63dc1eaa52'::uuid, 'yemisirach-des-yibelen-yealem-medihanit-teweledelin-oritodokis-tewahido', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yohanis-yinager ("Yohanis Yinager")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c96f4ab5-33f4-4a00-9a83-c63a4d3c2e83'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ድንግል ስትናገር ምን እንዳዘለለው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Dingil sitnager min endazelelew'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c96f4ab5-33f4-4a00-9a83-c63a4d3c2e83'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ድንግል ስትናገር ምን እንዳዘለለው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c96f4ab5-33f4-4a00-9a83-c63a4d3c2e83'::uuid, 'yohanis-yinager', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kidanmhret-emebete ("kidanmhret emebete")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '16a6a1b4-12e0-497d-ac05-7b3d7b8b9d55'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 1
የምድር ፍጥረታት ማርያም ማርይም ሲሉሽ
የቃል እናት እመቤቴ ነይ በሰረገላሽ(2)
አዝማ..
ከፀጥታው ወደብ ከፍቅር አውድማ(2)

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 2
ከሰላሙ መንደር ከእውነትከተማ
ሳሊለነ ቅድስት ውዳሴሽ ሲሰማ (2)
ከሚካኤል ከገብርኤል ጋ ነይልን ከራማ (2)
አዝማ

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 3
ዘርፋፋው ቀሚስሽ ይውረድ ከሰማያት (2)
እምባንችን ይታበስ ባንች አማላጅነት
የፅዮን ዝማሬ ተመላች ነፍሳችን (2)
ነይ ነይ ነይ እንበል እንዳባቶቻችን (2)

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 4
አዝማ..
ፍጥረታት ሊድኑ ባማላጅነትሽ (2)
የዘላለም ኪዳን አማኑኤል ሰጠሽ
ትውልድ ይህን አምኖ ብፅዕት ይልሻል (2)

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 5
እናቴ መመኬይዬ ምርኩዜ ሁነሻል (2)
አዝማ
የልብን ሲያዋዬሽ ሰምትሽ ዝም አትይም (2)
ችግረኛን አይቶ ልብሽ አይጨክንም

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 6
ከአይን ጥቅሻ ፈጥነሽ ትድርሽለታለሽ (2)
ከሀዘን ከመከራ ታሳርፊዋለሽ (2)
አዝማ

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)

VERSE 1
Yemdr fit’retat Maryam marym silush
Yeqal enat Emebete ney beseregelash (2)
CHORUS
Kets’et’taw wedeb kefqr awdma (2)

CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)

VERSE 2
Keselamu mender keewnetketema
Salilene Kidist widasesh sisema (2)
Kemikael kegebrel ga neyln kerama (2)
CHORUS

CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)

VERSE 3
Zerfafaw qemissh yiwred kesemayat (2)
Embanchn yitabes banch amalajnet
Yets’yon zimare temelach nefsachn (2)
Ney ney ney enbel endabatochachn (2)

CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)

VERSE 4
CHORUS
Fit’retat lidnu bamalajnetsh (2)
Yezelalem kidan Amanuel set’esh
Tiwld yihn amno bits’et yilshal (2)

CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)

VERSE 5
Enate memekeyye mirkuze huneshal (2)
CHORUS
Yelbn siyawayesh semtsh zim atym (2)
Chgregnan ayto libsh aych’eknm

CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)

VERSE 6
Keayn t’qsha fet’nesh tidrshletalesh (2)
Kehezen kemekera tasarfiwalesh (2)
CHORUS

CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 1
የምድር ፍጥረታት ማርያም ማርይም ሲሉሽ
የቃል እናት እመቤቴ ነይ በሰረገላሽ(2)
አዝማ..
ከፀጥታው ወደብ ከፍቅር አውድማ(2)

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 2
ከሰላሙ መንደር ከእውነትከተማ
ሳሊለነ ቅድስት ውዳሴሽ ሲሰማ (2)
ከሚካኤል ከገብርኤል ጋ ነይልን ከራማ (2)
አዝማ

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 3
ዘርፋፋው ቀሚስሽ ይውረድ ከሰማያት (2)
እምባንችን ይታበስ ባንች አማላጅነት
የፅዮን ዝማሬ ተመላች ነፍሳችን (2)
ነይ ነይ ነይ እንበል እንዳባቶቻችን (2)

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 4
አዝማ..
ፍጥረታት ሊድኑ ባማላጅነትሽ (2)
የዘላለም ኪዳን አማኑኤል ሰጠሽ
ትውልድ ይህን አምኖ ብፅዕት ይልሻል (2)

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 5
እናቴ መመኬይዬ ምርኩዜ ሁነሻል (2)
አዝማ
የልብን ሲያዋዬሽ ሰምትሽ ዝም አትይም (2)
ችግረኛን አይቶ ልብሽ አይጨክንም

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 6
ከአይን ጥቅሻ ፈጥነሽ ትድርሽለታለሽ (2)
ከሀዘን ከመከራ ታሳርፊዋለሽ (2)
አዝማ

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)',
        lyrics_transliteration = 'CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)

VERSE 1
Yemdr fit’retat Maryam marym silush
Yeqal enat Emebete ney beseregelash (2)
CHORUS
Kets’et’taw wedeb kefqr awdma (2)

CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)

VERSE 2
Keselamu mender keewnetketema
Salilene Kidist widasesh sisema (2)
Kemikael kegebrel ga neyln kerama (2)
CHORUS

CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)

VERSE 3
Zerfafaw qemissh yiwred kesemayat (2)
Embanchn yitabes banch amalajnet
Yets’yon zimare temelach nefsachn (2)
Ney ney ney enbel endabatochachn (2)

CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)

VERSE 4
CHORUS
Fit’retat lidnu bamalajnetsh (2)
Yezelalem kidan Amanuel set’esh
Tiwld yihn amno bits’et yilshal (2)

CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)

VERSE 5
Enate memekeyye mirkuze huneshal (2)
CHORUS
Yelbn siyawayesh semtsh zim atym (2)
Chgregnan ayto libsh aych’eknm

CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)

VERSE 6
Keayn t’qsha fet’nesh tidrshletalesh (2)
Kehezen kemekera tasarfiwalesh (2)
CHORUS

CHORUS
Kidanemhret emebet (2)
Neyln (2) kalenbet (2)
Kesemayatbelay kalew kemaderyash (2)
Zimare kemolaw kezelalem betsh (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '16a6a1b4-12e0-497d-ac05-7b3d7b8b9d55'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 1
የምድር ፍጥረታት ማርያም ማርይም ሲሉሽ
የቃል እናት እመቤቴ ነይ በሰረገላሽ(2)
አዝማ..
ከፀጥታው ወደብ ከፍቅር አውድማ(2)

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 2
ከሰላሙ መንደር ከእውነትከተማ
ሳሊለነ ቅድስት ውዳሴሽ ሲሰማ (2)
ከሚካኤል ከገብርኤል ጋ ነይልን ከራማ (2)
አዝማ

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 3
ዘርፋፋው ቀሚስሽ ይውረድ ከሰማያት (2)
እምባንችን ይታበስ ባንች አማላጅነት
የፅዮን ዝማሬ ተመላች ነፍሳችን (2)
ነይ ነይ ነይ እንበል እንዳባቶቻችን (2)

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 4
አዝማ..
ፍጥረታት ሊድኑ ባማላጅነትሽ (2)
የዘላለም ኪዳን አማኑኤል ሰጠሽ
ትውልድ ይህን አምኖ ብፅዕት ይልሻል (2)

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 5
እናቴ መመኬይዬ ምርኩዜ ሁነሻል (2)
አዝማ
የልብን ሲያዋዬሽ ሰምትሽ ዝም አትይም (2)
ችግረኛን አይቶ ልብሽ አይጨክንም

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)

VERSE 6
ከአይን ጥቅሻ ፈጥነሽ ትድርሽለታለሽ (2)
ከሀዘን ከመከራ ታሳርፊዋለሽ (2)
አዝማ

CHORUS
ኪዳነምህረት እመቤት(2)
ነይልን(2) ካለንበት (2)
ከሰማያትበላይ ካለው ከማደርያሽ(2)
ዝማሬ ከሞላው ከዘላለም ቤትሽ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '16a6a1b4-12e0-497d-ac05-7b3d7b8b9d55'::uuid, 'kidanmhret-emebete', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- astekakleh-yazegn-zemarit-tenaye-asefa-track-03 ("ASTEKAKLEH YAZEGN ZEMARIT TENAYE ASEFA TRACK 03")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8a8136c3-ed4d-4c89-a1ea-97af7a17e98e'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ይቅር በለኝ ጌታ ፣ ይብዛልኝ ቸርነት ።',
        lyrics_transliteration = 'CHORUS
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
Yiqr belegn Geta , yibzalgn chernet .',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8a8136c3-ed4d-4c89-a1ea-97af7a17e98e'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8a8136c3-ed4d-4c89-a1ea-97af7a17e98e'::uuid, 'astekakleh-yazegn-zemarit-tenaye-asefa-track-03', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-mezmur-meqrbey-by-d-yishaq-negasi ("ERITREAN ORTHODOX MEZMUR . MEQRBEY by D.Yishaq Negasi")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '93de32cd-080d-48ae-820b-6ccd7ff05b02'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ሕልፊ ኩሉ መቕርበይ ዝኾንኪ',
        lyrics_transliteration = 'CHORUS
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
Hilfi kulu meቕrbey ziኾnki',
        updated_at = clock_timestamp()::text
    WHERE import_id = '93de32cd-080d-48ae-820b-6ccd7ff05b02'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '93de32cd-080d-48ae-820b-6ccd7ff05b02'::uuid, 'eritrean-orthodox-mezmur-meqrbey-by-d-yishaq-negasi', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- anidit-bete-kirisitiyan-mezimur ("Anidit Bete Kirisitiyan Mezimur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '947c5e3f-761c-4395-9931-08dde71a9d07'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
በአንዲት ቤተ ክርስቲያን መጋደላችንም',
        lyrics_transliteration = 'CHORUS
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
Beandit Bete Kristian megadelachnm',
        updated_at = clock_timestamp()::text
    WHERE import_id = '947c5e3f-761c-4395-9931-08dde71a9d07'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '947c5e3f-761c-4395-9931-08dde71a9d07'::uuid, 'anidit-bete-kirisitiyan-mezimur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yegojoye-selam ("Yegojoye Selam")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '170082b8-4687-4c20-aba7-f1b4b20d7db9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 1
ተፅናናው አንቺን አስቤ ምስጋና ሞልቶ በልቤ
ደነቀኝ ያንቺስ ውለታ በፍቅርሽ ልቤ ተረታ
እናቴ ፀጋሽ በዝቶልኝ መፅናኛ ሆንሽኝ ለቤቴ
በምልጃሽ ተደላደለ ጎስቋላ በራ ህይወቴ

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 2
ስቃዬ ሸክሜ ቀለለ ፀሎትሽ አብሮኝ ስላለ
ማጎንበስ ቀረ ማፈሬ እማምላክ ገብተሽ ከበሬ
አይኖቼ ተስፋ ቢያደርጉም
ተማምነው በፍፁም ምልጃሽ

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 3
በረከት ሰላም ተሞላው በረታው ደካማው ልጅ

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 4
ያ ዘመን የተከዝኩበት አለፈ ሆኖ እንደዘበት
በመዳ ሲበተን ወዜ ማትረፊያ ሆንሽኝ ምርኩዜ
ምኞቴ አሁን ተሳካ ምን ልበል ስለውለታሽ
በደስታ ላፍስስ እንባዬን ገብቼ ወደ ማደሪያሽ

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 5
ጥኡም ነሽ ናርዶስ ሽቶዬ ተባርኳል ባንቺ ጉዋዳዬ
የጠላት ወጥመድ ሳይጥለኝታላቁ ስምሽ ጠበቀኝ
ጉልበቴ ፀንቷል በእጆችሽ
ፈተሽው የውስጤን ችግር

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 6
ይደነቅ አለም በሙሉ ዝናሽን እኔም ልመስክር

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw

VERSE 1
Tets’nanaw anchin asbe misgana molto belbe
Deneqegn yanchis wileta befqrsh libe tereta
Enate ts’egash beztolgn mets’nagna honshgn lebete
Bemljash tedeladele gosqwala bera hiywete

CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw

VERSE 2
Siqaye shekme qelele ts’elotsh abrogn silale
Magonbes qere mafere emamlak gebtesh kebere
Aynoche tesfa biyadergum
Temamnew befts’um miljash

CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw

VERSE 3
Bereket selam temolaw beretaw dekamaw lij

CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw

VERSE 4
Ya zemen yetekezkubet alefe hono endezebet
Bemeda sibeten weze matrefiya honshgn mirkuze
Mignote ahun tesaka min libel silewletash
Bedesta lafss enbayen gebche wede maderiyash

CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw

VERSE 5
T’um nesh nardos shtoye tebarkwal banchi guwadaye
Yet’elat wet’med sayt’legntalaqu simsh t’ebeqegn
Gulbete ts’entwal beejochsh
Feteshw yewst’en chgr

CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw

VERSE 6
Yideneq alem bemulu zinashn enem limeskr

CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 1
ተፅናናው አንቺን አስቤ ምስጋና ሞልቶ በልቤ
ደነቀኝ ያንቺስ ውለታ በፍቅርሽ ልቤ ተረታ
እናቴ ፀጋሽ በዝቶልኝ መፅናኛ ሆንሽኝ ለቤቴ
በምልጃሽ ተደላደለ ጎስቋላ በራ ህይወቴ

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 2
ስቃዬ ሸክሜ ቀለለ ፀሎትሽ አብሮኝ ስላለ
ማጎንበስ ቀረ ማፈሬ እማምላክ ገብተሽ ከበሬ
አይኖቼ ተስፋ ቢያደርጉም
ተማምነው በፍፁም ምልጃሽ

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 3
በረከት ሰላም ተሞላው በረታው ደካማው ልጅ

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 4
ያ ዘመን የተከዝኩበት አለፈ ሆኖ እንደዘበት
በመዳ ሲበተን ወዜ ማትረፊያ ሆንሽኝ ምርኩዜ
ምኞቴ አሁን ተሳካ ምን ልበል ስለውለታሽ
በደስታ ላፍስስ እንባዬን ገብቼ ወደ ማደሪያሽ

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 5
ጥኡም ነሽ ናርዶስ ሽቶዬ ተባርኳል ባንቺ ጉዋዳዬ
የጠላት ወጥመድ ሳይጥለኝታላቁ ስምሽ ጠበቀኝ
ጉልበቴ ፀንቷል በእጆችሽ
ፈተሽው የውስጤን ችግር

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 6
ይደነቅ አለም በሙሉ ዝናሽን እኔም ልመስክር

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው',
        lyrics_transliteration = 'CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw

VERSE 1
Tets’nanaw anchin asbe misgana molto belbe
Deneqegn yanchis wileta befqrsh libe tereta
Enate ts’egash beztolgn mets’nagna honshgn lebete
Bemljash tedeladele gosqwala bera hiywete

CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw

VERSE 2
Siqaye shekme qelele ts’elotsh abrogn silale
Magonbes qere mafere emamlak gebtesh kebere
Aynoche tesfa biyadergum
Temamnew befts’um miljash

CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw

VERSE 3
Bereket selam temolaw beretaw dekamaw lij

CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw

VERSE 4
Ya zemen yetekezkubet alefe hono endezebet
Bemeda sibeten weze matrefiya honshgn mirkuze
Mignote ahun tesaka min libel silewletash
Bedesta lafss enbayen gebche wede maderiyash

CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw

VERSE 5
T’um nesh nardos shtoye tebarkwal banchi guwadaye
Yet’elat wet’med sayt’legntalaqu simsh t’ebeqegn
Gulbete ts’entwal beejochsh
Feteshw yewst’en chgr

CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw

VERSE 6
Yideneq alem bemulu zinashn enem limeskr

CHORUS
Hulgzem masbsh yegojoye selam
Silanchi zim emil andebet yelegn
Dingil wiletashn bemn qal liglets’ew
Ejgun bezalgn lene yaderegshw',
        updated_at = clock_timestamp()::text
    WHERE import_id = '170082b8-4687-4c20-aba7-f1b4b20d7db9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 1
ተፅናናው አንቺን አስቤ ምስጋና ሞልቶ በልቤ
ደነቀኝ ያንቺስ ውለታ በፍቅርሽ ልቤ ተረታ
እናቴ ፀጋሽ በዝቶልኝ መፅናኛ ሆንሽኝ ለቤቴ
በምልጃሽ ተደላደለ ጎስቋላ በራ ህይወቴ

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 2
ስቃዬ ሸክሜ ቀለለ ፀሎትሽ አብሮኝ ስላለ
ማጎንበስ ቀረ ማፈሬ እማምላክ ገብተሽ ከበሬ
አይኖቼ ተስፋ ቢያደርጉም
ተማምነው በፍፁም ምልጃሽ

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 3
በረከት ሰላም ተሞላው በረታው ደካማው ልጅ

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 4
ያ ዘመን የተከዝኩበት አለፈ ሆኖ እንደዘበት
በመዳ ሲበተን ወዜ ማትረፊያ ሆንሽኝ ምርኩዜ
ምኞቴ አሁን ተሳካ ምን ልበል ስለውለታሽ
በደስታ ላፍስስ እንባዬን ገብቼ ወደ ማደሪያሽ

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 5
ጥኡም ነሽ ናርዶስ ሽቶዬ ተባርኳል ባንቺ ጉዋዳዬ
የጠላት ወጥመድ ሳይጥለኝታላቁ ስምሽ ጠበቀኝ
ጉልበቴ ፀንቷል በእጆችሽ
ፈተሽው የውስጤን ችግር

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው

VERSE 6
ይደነቅ አለም በሙሉ ዝናሽን እኔም ልመስክር

CHORUS
ሁልግዜም ማስብሽ የጎጆዬ ሰላም
ስላንቺ ዝም እሚል አንደበት የለኝ
ድንግል ውለታሽን በምን ቃል ልግለፀው
እጅጉን በዛልኝ ለኔ ያደረግሽው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '170082b8-4687-4c20-aba7-f1b4b20d7db9'::uuid, 'yegojoye-selam', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-4006 ("ERITREAN ORTHODOX TEWAHDO MEZMUR")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5ac6aebe-1b74-4c08-b924-7d4be40725f9'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ሚካኤል በሉ ክንፉ ከጽልለልና',
        lyrics_transliteration = 'CHORUS
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
Mikael belu kinfu kets’llelna',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5ac6aebe-1b74-4c08-b924-7d4be40725f9'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5ac6aebe-1b74-4c08-b924-7d4be40725f9'::uuid, 'eritrean-orthodox-tewahdo-mezmur-4006', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- live-2694 ("Live")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '18ef45d3-c383-4e51-bcea-4b91dd2dcfd3'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ስለ ማይነገር ስጦታው አግዚአብሔር ይመስገን፤',
        lyrics_transliteration = 'CHORUS
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
Sile mayneger sit’otaw agziabher yimesgen;',
        updated_at = clock_timestamp()::text
    WHERE import_id = '18ef45d3-c383-4e51-bcea-4b91dd2dcfd3'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '18ef45d3-c383-4e51-bcea-4b91dd2dcfd3'::uuid, 'live-2694', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ahlifkayen-4188 ("Ahlifkayen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '56a049c2-b286-4fd0-81ef-3c2477a3d96f'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ኣሕሊፍካየን ንስኻ "ኣሕሊፋካየን"',
        lyrics_transliteration = 'CHORUS
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
Ahlifkayen nisኻ "ahlifakayen"',
        updated_at = clock_timestamp()::text
    WHERE import_id = '56a049c2-b286-4fd0-81ef-3c2477a3d96f'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '56a049c2-b286-4fd0-81ef-3c2477a3d96f'::uuid, 'ahlifkayen-4188', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ene-ante-fit ("Ene Ante Fit")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'da3ea5f1-e759-4d62-bce7-439a1fea5cb4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 1
ጸሎቴ ቢሆን ለወረት
ጎዶሎ ቢሆን የኔ እምነት
ባረከኝ እኔን ከሰማይ
በደል ጥፋቴንም ሳታይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 2
ቀባኸኝ ጠርተኸኝ ከዱር
ሰጠኸኝ ከፍ ያለ ወንበር
ሳይኖረኝ አንድም በጎነት
ባረከኝ በእጅህ በረከት

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 3
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 4
ቃል ኪዳንህን አክባሪ
ታማኝ ነህ ሁሌ መሃሪ
የማልከውንም መሃላ
አትረሳም አትልም ችላ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 5
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ
ፍቅር ነህ ከአባትም በላይ
የሰማይ የምድር ሲሳይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 6
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 7
ቃል ኪዳንህን አክባሪ
ታማኝ ነህ ሁሌ መሃሪ
የማልከውንም መሃላ
አትረሳም አትልም ችላ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 8
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ
ፍቅር ነህ ከአባትም በላይ
የሰማይ የምድር ሲሳይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 9
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 10
መሻቴን ብቻ ስላየህ
ደካማ ልጅህን ጎበኘህ
ብቃቴ መቼ ሆነና
ያቆመኝ ላንተ ምስጋና

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 11
አንኳኩ ስላልክ አንኳኳሁ
ጠይቁ ስላልክ ጠየቅሁህ
ከፍተሃል በርህን ለኔ
የታተምኩብህ መድህኔ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 12
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 1
Ts’elote bihon leweret
Godolo bihon yene emnet
Barekegn enen kesemay
Bedel t’fatenm satay

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 2
Qebaኸgn t’erteኸgn kedur
Set’eኸgn kef yale wenber
Saynoregn andm begonet
Barekegn beejh bereket

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 3
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 4
Qal kidanhn akbari
Tamagn neh hule mehari
Yemalkewnm mehala
Atresam atlm chla

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 5
Mekari dinq memhre
Lante new zema mezmure
Fiqr neh keabatm belay
Yesemay yemdr sisay

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 6
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 7
Qal kidanhn akbari
Tamagn neh hule mehari
Yemalkewnm mehala
Atresam atlm chla

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 8
Mekari dinq memhre
Lante new zema mezmure
Fiqr neh keabatm belay
Yesemay yemdr sisay

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 9
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 10
Meshaten bicha silayeh
Dekama lijhn gobegneh
Biqate meche honena
Yaqomegn lante misgana

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 11
Ankwaku silalk ankwakwahu
T’eyqu silalk t’eyeqhuh
Keftehal berhn lene
Yetatemkubh medhne

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 12
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 1
ጸሎቴ ቢሆን ለወረት
ጎዶሎ ቢሆን የኔ እምነት
ባረከኝ እኔን ከሰማይ
በደል ጥፋቴንም ሳታይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 2
ቀባኸኝ ጠርተኸኝ ከዱር
ሰጠኸኝ ከፍ ያለ ወንበር
ሳይኖረኝ አንድም በጎነት
ባረከኝ በእጅህ በረከት

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 3
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 4
ቃል ኪዳንህን አክባሪ
ታማኝ ነህ ሁሌ መሃሪ
የማልከውንም መሃላ
አትረሳም አትልም ችላ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 5
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ
ፍቅር ነህ ከአባትም በላይ
የሰማይ የምድር ሲሳይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 6
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 7
ቃል ኪዳንህን አክባሪ
ታማኝ ነህ ሁሌ መሃሪ
የማልከውንም መሃላ
አትረሳም አትልም ችላ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 8
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ
ፍቅር ነህ ከአባትም በላይ
የሰማይ የምድር ሲሳይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 9
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 10
መሻቴን ብቻ ስላየህ
ደካማ ልጅህን ጎበኘህ
ብቃቴ መቼ ሆነና
ያቆመኝ ላንተ ምስጋና

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 11
አንኳኩ ስላልክ አንኳኳሁ
ጠይቁ ስላልክ ጠየቅሁህ
ከፍተሃል በርህን ለኔ
የታተምኩብህ መድህኔ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 12
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም',
        lyrics_transliteration = 'CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 1
Ts’elote bihon leweret
Godolo bihon yene emnet
Barekegn enen kesemay
Bedel t’fatenm satay

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 2
Qebaኸgn t’erteኸgn kedur
Set’eኸgn kef yale wenber
Saynoregn andm begonet
Barekegn beejh bereket

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 3
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 4
Qal kidanhn akbari
Tamagn neh hule mehari
Yemalkewnm mehala
Atresam atlm chla

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 5
Mekari dinq memhre
Lante new zema mezmure
Fiqr neh keabatm belay
Yesemay yemdr sisay

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 6
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 7
Qal kidanhn akbari
Tamagn neh hule mehari
Yemalkewnm mehala
Atresam atlm chla

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 8
Mekari dinq memhre
Lante new zema mezmure
Fiqr neh keabatm belay
Yesemay yemdr sisay

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 9
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 10
Meshaten bicha silayeh
Dekama lijhn gobegneh
Biqate meche honena
Yaqomegn lante misgana

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 11
Ankwaku silalk ankwakwahu
T’eyqu silalk t’eyeqhuh
Keftehal berhn lene
Yetatemkubh medhne

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

VERSE 12
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem

CHORUS
Ene ante bet ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem
Yemimeslh manm yelem',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'da3ea5f1-e759-4d62-bce7-439a1fea5cb4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 1
ጸሎቴ ቢሆን ለወረት
ጎዶሎ ቢሆን የኔ እምነት
ባረከኝ እኔን ከሰማይ
በደል ጥፋቴንም ሳታይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 2
ቀባኸኝ ጠርተኸኝ ከዱር
ሰጠኸኝ ከፍ ያለ ወንበር
ሳይኖረኝ አንድም በጎነት
ባረከኝ በእጅህ በረከት

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 3
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 4
ቃል ኪዳንህን አክባሪ
ታማኝ ነህ ሁሌ መሃሪ
የማልከውንም መሃላ
አትረሳም አትልም ችላ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 5
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ
ፍቅር ነህ ከአባትም በላይ
የሰማይ የምድር ሲሳይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 6
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 7
ቃል ኪዳንህን አክባሪ
ታማኝ ነህ ሁሌ መሃሪ
የማልከውንም መሃላ
አትረሳም አትልም ችላ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 8
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ
ፍቅር ነህ ከአባትም በላይ
የሰማይ የምድር ሲሳይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 9
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 10
መሻቴን ብቻ ስላየህ
ደካማ ልጅህን ጎበኘህ
ብቃቴ መቼ ሆነና
ያቆመኝ ላንተ ምስጋና

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 11
አንኳኩ ስላልክ አንኳኳሁ
ጠይቁ ስላልክ ጠየቅሁህ
ከፍተሃል በርህን ለኔ
የታተምኩብህ መድህኔ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 12
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'da3ea5f1-e759-4d62-bce7-439a1fea5cb4'::uuid, 'ene-ante-fit', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- emun-eka ("Emun eka")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2bc7782c-9b81-4ac8-84eb-6d8ec5f665e8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 1
ጎይታይ ንቅዱስ ስምካ
ማይ"""""""""""""''''''''''''''''''''''
ኪንዮ ርዲኢተይ
እሙን ኢኻ ጎይታይ

CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 2
ዘይተቀየርካ''ኳ
ክትቅይር ዓለመይ
መገደይ ሓርየ ምስ ኣሕዘንኩኻ
ብዝኸዶ ይጥፋኣ ማዓስ እሞ ኢልካ

CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 3
ዝባነይ ሂበካ ክምዘይ ሓጣእኩ
ብጸጋኻ እንዴ ሎሚ ዘለኹ
ማይ" """""''''''''''''''''''''''''''''''''''''''''''''''''''''''''
ምንም ኣብ ዘይብለይ

CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 4
ንስኻ ኣሎኻኒ
ኢደይ እንተመልእ ውን
ኣብኻ ነይበልጸኒ
ልዕሊ ዛነብሰይ እትሓልየለይ

CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 5
ኣቦ ዘልኣለም ክለኻ ምሳይ
ይኣምነካ እምበር ከመይ ዘይኣምን
ገባሪ ጽቡቅ ሰብ''ኳ ይእመን

CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yiamneka''ye ab birhann ts’elamn
Yiamneka''ye ab riኽbetn sienetn
Biኹnetate''ye aylkonye niኸalnetka
Godiluni iles aymarron ayemarron

VERSE 1
Goytay niqdus simka
May"""""""""""""''''''''''''''''''''''
Kinyo ridiitey
Emun iኻ goytay

CHORUS
Yiamneka''ye ab birhann ts’elamn
Yiamneka''ye ab riኽbetn sienetn
Biኹnetate''ye aylkonye niኸalnetka
Godiluni iles aymarron ayemarron

VERSE 2
Zeyteqeyerka''kwa
Kitqyr alemey
Megedey harye mis ahzenkuኻ
Bizኸdo yit’faa maas emo ilka

CHORUS
Yiamneka''ye ab birhann ts’elamn
Yiamneka''ye ab riኽbetn sienetn
Biኹnetate''ye aylkonye niኸalnetka
Godiluni iles aymarron ayemarron

VERSE 3
Zibaney hibeka kimzey hat’aeku
Bits’egaኻ ende lomi zeleኹ
May" """""''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Minm ab zeybley

CHORUS
Yiamneka''ye ab birhann ts’elamn
Yiamneka''ye ab riኽbetn sienetn
Biኹnetate''ye aylkonye niኸalnetka
Godiluni iles aymarron ayemarron

VERSE 4
Nisኻ aloኻni
Idey entemele win
Abኻ neybelts’eni
Lieli zanebsey ethalyeley

CHORUS
Yiamneka''ye ab birhann ts’elamn
Yiamneka''ye ab riኽbetn sienetn
Biኹnetate''ye aylkonye niኸalnetka
Godiluni iles aymarron ayemarron

VERSE 5
Abo zelalem kileኻ misay
Yiamneka ember kemey zeyamn
Gebari ts’buq seb''kwa yiemen

CHORUS
Yiamneka''ye ab birhann ts’elamn
Yiamneka''ye ab riኽbetn sienetn
Biኹnetate''ye aylkonye niኸalnetka
Godiluni iles aymarron ayemarron'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 1
ጎይታይ ንቅዱስ ስምካ
ማይ"""""""""""""''''''''''''''''''''''
ኪንዮ ርዲኢተይ
እሙን ኢኻ ጎይታይ

CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 2
ዘይተቀየርካ''ኳ
ክትቅይር ዓለመይ
መገደይ ሓርየ ምስ ኣሕዘንኩኻ
ብዝኸዶ ይጥፋኣ ማዓስ እሞ ኢልካ

CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 3
ዝባነይ ሂበካ ክምዘይ ሓጣእኩ
ብጸጋኻ እንዴ ሎሚ ዘለኹ
ማይ" """""''''''''''''''''''''''''''''''''''''''''''''''''''''''''
ምንም ኣብ ዘይብለይ

CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 4
ንስኻ ኣሎኻኒ
ኢደይ እንተመልእ ውን
ኣብኻ ነይበልጸኒ
ልዕሊ ዛነብሰይ እትሓልየለይ

CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 5
ኣቦ ዘልኣለም ክለኻ ምሳይ
ይኣምነካ እምበር ከመይ ዘይኣምን
ገባሪ ጽቡቅ ሰብ''ኳ ይእመን

CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን',
        lyrics_transliteration = 'CHORUS
Yiamneka''ye ab birhann ts’elamn
Yiamneka''ye ab riኽbetn sienetn
Biኹnetate''ye aylkonye niኸalnetka
Godiluni iles aymarron ayemarron

VERSE 1
Goytay niqdus simka
May"""""""""""""''''''''''''''''''''''
Kinyo ridiitey
Emun iኻ goytay

CHORUS
Yiamneka''ye ab birhann ts’elamn
Yiamneka''ye ab riኽbetn sienetn
Biኹnetate''ye aylkonye niኸalnetka
Godiluni iles aymarron ayemarron

VERSE 2
Zeyteqeyerka''kwa
Kitqyr alemey
Megedey harye mis ahzenkuኻ
Bizኸdo yit’faa maas emo ilka

CHORUS
Yiamneka''ye ab birhann ts’elamn
Yiamneka''ye ab riኽbetn sienetn
Biኹnetate''ye aylkonye niኸalnetka
Godiluni iles aymarron ayemarron

VERSE 3
Zibaney hibeka kimzey hat’aeku
Bits’egaኻ ende lomi zeleኹ
May" """""''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Minm ab zeybley

CHORUS
Yiamneka''ye ab birhann ts’elamn
Yiamneka''ye ab riኽbetn sienetn
Biኹnetate''ye aylkonye niኸalnetka
Godiluni iles aymarron ayemarron

VERSE 4
Nisኻ aloኻni
Idey entemele win
Abኻ neybelts’eni
Lieli zanebsey ethalyeley

CHORUS
Yiamneka''ye ab birhann ts’elamn
Yiamneka''ye ab riኽbetn sienetn
Biኹnetate''ye aylkonye niኸalnetka
Godiluni iles aymarron ayemarron

VERSE 5
Abo zelalem kileኻ misay
Yiamneka ember kemey zeyamn
Gebari ts’buq seb''kwa yiemen

CHORUS
Yiamneka''ye ab birhann ts’elamn
Yiamneka''ye ab riኽbetn sienetn
Biኹnetate''ye aylkonye niኸalnetka
Godiluni iles aymarron ayemarron',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2bc7782c-9b81-4ac8-84eb-6d8ec5f665e8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 1
ጎይታይ ንቅዱስ ስምካ
ማይ"""""""""""""''''''''''''''''''''''
ኪንዮ ርዲኢተይ
እሙን ኢኻ ጎይታይ

CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 2
ዘይተቀየርካ''ኳ
ክትቅይር ዓለመይ
መገደይ ሓርየ ምስ ኣሕዘንኩኻ
ብዝኸዶ ይጥፋኣ ማዓስ እሞ ኢልካ

CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 3
ዝባነይ ሂበካ ክምዘይ ሓጣእኩ
ብጸጋኻ እንዴ ሎሚ ዘለኹ
ማይ" """""''''''''''''''''''''''''''''''''''''''''''''''''''''''''
ምንም ኣብ ዘይብለይ

CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 4
ንስኻ ኣሎኻኒ
ኢደይ እንተመልእ ውን
ኣብኻ ነይበልጸኒ
ልዕሊ ዛነብሰይ እትሓልየለይ

CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን

VERSE 5
ኣቦ ዘልኣለም ክለኻ ምሳይ
ይኣምነካ እምበር ከመይ ዘይኣምን
ገባሪ ጽቡቅ ሰብ''ኳ ይእመን

CHORUS
ይኣምነካ''የ ኣብ ብርሃንን ጸላምን
ይኣምነካ''የ ኣብ ርኽበትን ስእነትን
ብኹነታተ''የ ኣይልክዖንየ ንኸኣልነትካ
ጎዲሉኒ ኢለስ ኣይማርሮን ኣየማርሮን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2bc7782c-9b81-4ac8-84eb-6d8ec5f665e8'::uuid, 'emun-eka', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- adanegn-geta-zemari-kesis-mindaye-berhanu ("Adanegn Geta Zemari Kesis Mindaye Berhanu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '94b25cad-5aef-4e23-bfe9-c07b6734c37e'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ኃጢአተኛውን ወደደኝ',
        lyrics_transliteration = 'CHORUS
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
Hat’iategnawn wededegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '94b25cad-5aef-4e23-bfe9-c07b6734c37e'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '94b25cad-5aef-4e23-bfe9-c07b6734c37e'::uuid, 'adanegn-geta-zemari-kesis-mindaye-berhanu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nolawi-tiguh ("Nolawi Tiguh Ze’itnewum")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '182eacc2-335a-4b09-8127-bb204cb93444'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ጠብቅልን በሰላም ማኅበራችንን (፪)',
        lyrics_transliteration = 'CHORUS
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
Tebqln Beselam Mahberachn’n (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '182eacc2-335a-4b09-8127-bb204cb93444'::uuid
      AND deleted_at IS NULL
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
Tebqln Beselam Mahberachn’n (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '182eacc2-335a-4b09-8127-bb204cb93444'::uuid, 'nolawi-tiguh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ethiopia-zemarit-fantu-welde-kelebanos ("Ethiopia: Zemarit Fantu Welde Kelebanos")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ec856951-2b37-4503-accc-cdee0d8efb73'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
እንዳይለየኝ , ከሊባኖስ',
        lyrics_transliteration = 'CHORUS
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
Endayleyegn , kelibanos',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ec856951-2b37-4503-accc-cdee0d8efb73'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ec856951-2b37-4503-accc-cdee0d8efb73'::uuid, 'ethiopia-zemarit-fantu-welde-kelebanos', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tv-qolahta-yeintu ("TV: QOLAHTA YEINTU")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '185f2420-0ae3-4dda-863a-85bd692bf885'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 1
ኣዝ
ዊንታ ስጋይ ሓይሉ ቀቲለያ ነብሰይ
ካብ መንገዱ ኣልጊሰ ቀቢረ ሕልናይ
ዓለም መሲሉኒ ትኾነኒ ዑቁባ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 2
ባብ ከምዘይ ኣርሓወት ሕቖኣ''ዶ ሂባ
መን እሞ ቆይሙለይ ኣብታ ሰዓት ጭንቂ
ብዘካ መድሕነይ እቲ ኣምላኽ ሓቂ
ኣዝ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 3
ነገር ስጋ ከይተርፍ ክረኽበኒ ሕሰም
ከናዲ ረዳኢ ተበልኩ ቃሕ ሰም
ዘበት ኣይረከብኩን ሓደካ ዝድግፍ
ኣለኹልኪ ኢሉ ን ስለይ ዚሓለፍ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 4
ንሱ ግን ኔሩኒ ለዋህ እሙን ጓሳ
ነብሱ በጃ ሂቡ ሂወተይ ዘውሕሳ
ኣዝ
ተሰሎንቄ ኔረ ከም ናይ ትማል ዴማስ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 5
ዘሎ መሲሉኒ ''ቲ ዘይነጽፍ ሓጎስ
ዛንታ ጥፉእ ወዲ እንክድገም ኣባይ
''ነኩ ተመሊሰ ኣብ''ታ ቤት ቀደመይ
ለካ ሰናይ የለን ርሒቅካ ካብ ቤቱ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 6
ተቀቢሉኒ አዩ እምበር ብዓይኒ ምሕረቱ
ኣዝ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr

VERSE 1
Az
Winta sigay haylu qetileya nebsey
Kab mengedu algise qebire hilnay
Alem mesiluni tiኾneni uquba

CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr

VERSE 2
Bab kemzey arhawet hiቖa''do hiba
Men emo qoymuley abta seat ch’nqi
Bizeka medhney eti amlaኽ haqi
Az

CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr

VERSE 3
Neger siga keyterf kireኽbeni hisem
Kenadi redai tebelku qah sem
Zebet ayrekebkun hadeka zidgf
Aleኹlki ilu n siley zihalef

CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr

VERSE 4
Nisu gin neruni lewah emun gwasa
Nebsu beja hibu hiwetey zewhsa
Az
Teselonqe nere kem nay timal demas

CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr

VERSE 5
Zelo mesiluni ''ti zeynets’f hagos
Zanta t’fue wedi enkdgem abay
''neku temelise ab''ta bet qedemey
Leka senay yelen rihiqka kab betu

CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr

VERSE 6
Teqebiluni ayu ember biayni mihretu
Az

CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 1
ኣዝ
ዊንታ ስጋይ ሓይሉ ቀቲለያ ነብሰይ
ካብ መንገዱ ኣልጊሰ ቀቢረ ሕልናይ
ዓለም መሲሉኒ ትኾነኒ ዑቁባ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 2
ባብ ከምዘይ ኣርሓወት ሕቖኣ''ዶ ሂባ
መን እሞ ቆይሙለይ ኣብታ ሰዓት ጭንቂ
ብዘካ መድሕነይ እቲ ኣምላኽ ሓቂ
ኣዝ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 3
ነገር ስጋ ከይተርፍ ክረኽበኒ ሕሰም
ከናዲ ረዳኢ ተበልኩ ቃሕ ሰም
ዘበት ኣይረከብኩን ሓደካ ዝድግፍ
ኣለኹልኪ ኢሉ ን ስለይ ዚሓለፍ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 4
ንሱ ግን ኔሩኒ ለዋህ እሙን ጓሳ
ነብሱ በጃ ሂቡ ሂወተይ ዘውሕሳ
ኣዝ
ተሰሎንቄ ኔረ ከም ናይ ትማል ዴማስ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 5
ዘሎ መሲሉኒ ''ቲ ዘይነጽፍ ሓጎስ
ዛንታ ጥፉእ ወዲ እንክድገም ኣባይ
''ነኩ ተመሊሰ ኣብ''ታ ቤት ቀደመይ
ለካ ሰናይ የለን ርሒቅካ ካብ ቤቱ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 6
ተቀቢሉኒ አዩ እምበር ብዓይኒ ምሕረቱ
ኣዝ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር',
        lyrics_transliteration = 'CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr

VERSE 1
Az
Winta sigay haylu qetileya nebsey
Kab mengedu algise qebire hilnay
Alem mesiluni tiኾneni uquba

CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr

VERSE 2
Bab kemzey arhawet hiቖa''do hiba
Men emo qoymuley abta seat ch’nqi
Bizeka medhney eti amlaኽ haqi
Az

CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr

VERSE 3
Neger siga keyterf kireኽbeni hisem
Kenadi redai tebelku qah sem
Zebet ayrekebkun hadeka zidgf
Aleኹlki ilu n siley zihalef

CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr

VERSE 4
Nisu gin neruni lewah emun gwasa
Nebsu beja hibu hiwetey zewhsa
Az
Teselonqe nere kem nay timal demas

CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr

VERSE 5
Zelo mesiluni ''ti zeynets’f hagos
Zanta t’fue wedi enkdgem abay
''neku temelise ab''ta bet qedemey
Leka senay yelen rihiqka kab betu

CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr

VERSE 6
Teqebiluni ayu ember biayni mihretu
Az

CHORUS
Qolahta yeentu zeyfla kabay
Selamu zefsis kem zinab ab lieley
Gibrey do ts’ebiqu milat fiqru ayu amber (2)
Zeykemti abesay genihu zimhr',
        updated_at = clock_timestamp()::text
    WHERE import_id = '185f2420-0ae3-4dda-863a-85bd692bf885'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 1
ኣዝ
ዊንታ ስጋይ ሓይሉ ቀቲለያ ነብሰይ
ካብ መንገዱ ኣልጊሰ ቀቢረ ሕልናይ
ዓለም መሲሉኒ ትኾነኒ ዑቁባ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 2
ባብ ከምዘይ ኣርሓወት ሕቖኣ''ዶ ሂባ
መን እሞ ቆይሙለይ ኣብታ ሰዓት ጭንቂ
ብዘካ መድሕነይ እቲ ኣምላኽ ሓቂ
ኣዝ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 3
ነገር ስጋ ከይተርፍ ክረኽበኒ ሕሰም
ከናዲ ረዳኢ ተበልኩ ቃሕ ሰም
ዘበት ኣይረከብኩን ሓደካ ዝድግፍ
ኣለኹልኪ ኢሉ ን ስለይ ዚሓለፍ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 4
ንሱ ግን ኔሩኒ ለዋህ እሙን ጓሳ
ነብሱ በጃ ሂቡ ሂወተይ ዘውሕሳ
ኣዝ
ተሰሎንቄ ኔረ ከም ናይ ትማል ዴማስ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 5
ዘሎ መሲሉኒ ''ቲ ዘይነጽፍ ሓጎስ
ዛንታ ጥፉእ ወዲ እንክድገም ኣባይ
''ነኩ ተመሊሰ ኣብ''ታ ቤት ቀደመይ
ለካ ሰናይ የለን ርሒቅካ ካብ ቤቱ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር

VERSE 6
ተቀቢሉኒ አዩ እምበር ብዓይኒ ምሕረቱ
ኣዝ

CHORUS
ቆላሕታ የዕንቱ ዘይፍላ ካባይ
ሰላሙ ዘፍሲስ ከም ዝናብ ኣብ ልዕለይ
ግብረይ ዶ ጸቢቁ ምልኣት ፍቅሩ አዩ አምበር(2)
ዘይከምቲ ኣበሳይ ገኒሑ ዝምሕር'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '185f2420-0ae3-4dda-863a-85bd692bf885'::uuid, 'tv-qolahta-yeintu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beene-bitekur-semay ("Beene Bitekur Semay")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'da53dfab-2b67-4d9c-9a4d-4fdc1f13e95c'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ኢየሱስ ነዉ የመኖር እስትንፋሴ፤',
        lyrics_transliteration = 'CHORUS
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
Iyesus newu yemenor estnfase;',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'da53dfab-2b67-4d9c-9a4d-4fdc1f13e95c'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'da53dfab-2b67-4d9c-9a4d-4fdc1f13e95c'::uuid, 'beene-bitekur-semay', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kalh-sineger-lisma-mk-mahbere-kidusan-tr3 ("Kalh sineger lisma mk mahbere kidusan tr3")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4e9f1d94-c541-4aa5-ae76-25904e85f8d8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቃልህ ሲነገር ልስማ ጌታ ሆይ እባክህ/፪/
ልቤን ክፈተው/፬/
የልድያን ልብ እንደከፈትከው/፪/

VERSE 1
ቃልህ ሲነገር ልስማ ጌታ ሆይ እባክህ/፪/
ልቤን ክፈተው/፬/
የልድያን ልብ እንደከፈትከው/፪/

CHORUS
ቃልህ ሲነገር ልስማ ጌታ ሆይ እባክህ/፪/
ልቤን ክፈተው/፬/
የልድያን ልብ እንደከፈትከው/፪/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Qalh sineger lisma Geta hoy ebakh (2)
Liben kifetew (4)
Yeldyan lib endekefetkew (2)

VERSE 1
Qalh sineger lisma Geta hoy ebakh (2)
Liben kifetew (4)
Yeldyan lib endekefetkew (2)

CHORUS
Qalh sineger lisma Geta hoy ebakh (2)
Liben kifetew (4)
Yeldyan lib endekefetkew (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቃልህ ሲነገር ልስማ ጌታ ሆይ እባክህ/፪/
ልቤን ክፈተው/፬/
የልድያን ልብ እንደከፈትከው/፪/

VERSE 1
ቃልህ ሲነገር ልስማ ጌታ ሆይ እባክህ/፪/
ልቤን ክፈተው/፬/
የልድያን ልብ እንደከፈትከው/፪/

CHORUS
ቃልህ ሲነገር ልስማ ጌታ ሆይ እባክህ/፪/
ልቤን ክፈተው/፬/
የልድያን ልብ እንደከፈትከው/፪/',
        lyrics_transliteration = 'CHORUS
Qalh sineger lisma Geta hoy ebakh (2)
Liben kifetew (4)
Yeldyan lib endekefetkew (2)

VERSE 1
Qalh sineger lisma Geta hoy ebakh (2)
Liben kifetew (4)
Yeldyan lib endekefetkew (2)

CHORUS
Qalh sineger lisma Geta hoy ebakh (2)
Liben kifetew (4)
Yeldyan lib endekefetkew (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '4e9f1d94-c541-4aa5-ae76-25904e85f8d8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቃልህ ሲነገር ልስማ ጌታ ሆይ እባክህ/፪/
ልቤን ክፈተው/፬/
የልድያን ልብ እንደከፈትከው/፪/

VERSE 1
ቃልህ ሲነገር ልስማ ጌታ ሆይ እባክህ/፪/
ልቤን ክፈተው/፬/
የልድያን ልብ እንደከፈትከው/፪/

CHORUS
ቃልህ ሲነገር ልስማ ጌታ ሆይ እባክህ/፪/
ልቤን ክፈተው/፬/
የልድያን ልብ እንደከፈትከው/፪/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '4e9f1d94-c541-4aa5-ae76-25904e85f8d8'::uuid, 'kalh-sineger-lisma-mk-mahbere-kidusan-tr3', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- msganayen-sewahu-bemaleda-zemarit-kiyaki ("msganayen sewahu bemaleda_zemarit kiyaki")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '94e61bcb-3018-4054-8160-a3385195669d'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ሰተኸኛልና ባርከህ ይህን ቀን',
        lyrics_transliteration = 'CHORUS
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
Seteኸgnalna barkeh yihn qen',
        updated_at = clock_timestamp()::text
    WHERE import_id = '94e61bcb-3018-4054-8160-a3385195669d'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '94e61bcb-3018-4054-8160-a3385195669d'::uuid, 'msganayen-sewahu-bemaleda-zemarit-kiyaki', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- des-yibelen ("Des Yibelen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '18b8137d-06b9-4326-9a77-d2e0f6e2bfcd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 1
ምን ቢተባበሩ ምቀኞች ቢጥሩ
ቅዱሱ መስቀሉንም ሸሽገው ቢሰውሩ (2)
አልቻሉም ሊያጠፉ ምን ቢተባበሩ (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 2
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 3
በተራራ ተሸፍኖ ለዘመናት (2)
ተጥሎ በተንኮል ተደብቆ ከኖረበት (2)
ተገለጠ እነሆ በደመራ እሳት (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 4
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 5
ታሪካዊ የክርስቶስ ህያው መስቀል (2)
ይኸው ተገለጠ በክብር በግሩም ኃይል (2)
ምንጊዜም ሲያበራ እንዲሁ ይኖራል (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 6
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 7
እሌኒ ነች ይህን ምሥጢር ያስገኘችው (2)
ደመራን በጥበብ በቦታው ያስቆመችው (2)
የተንኮልን ተራራ ያስቆፈረችው (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 1
Min bitebaberu mikegnoch bitru
Kidusu meskelunim sheshigew bisewuru (2)
Alchalum liyatefu min bitebaberu (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 2
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 3
Beterara teshefino lezemenat (2)
Tetilo betenkol tedebiko kenorebet (2)
Tegelete eneho bedemera esat (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 4
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 5
Tarikawi yekiristos hiyaw meskel (2)
Yihew tegelete bekibir begirum hayl (2)
Mingizem siyabera endihu yinoral (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 6
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 7
Eleni nech yihin mistir yasgegnechiw (2)
Demeran betibeb bebotaw yaskomechiw (2)
Yetenkolin terara yaskoferechiw (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 1
ምን ቢተባበሩ ምቀኞች ቢጥሩ
ቅዱሱ መስቀሉንም ሸሽገው ቢሰውሩ (2)
አልቻሉም ሊያጠፉ ምን ቢተባበሩ (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 2
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 3
በተራራ ተሸፍኖ ለዘመናት (2)
ተጥሎ በተንኮል ተደብቆ ከኖረበት (2)
ተገለጠ እነሆ በደመራ እሳት (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 4
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 5
ታሪካዊ የክርስቶስ ህያው መስቀል (2)
ይኸው ተገለጠ በክብር በግሩም ኃይል (2)
ምንጊዜም ሲያበራ እንዲሁ ይኖራል (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 6
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 7
እሌኒ ነች ይህን ምሥጢር ያስገኘችው (2)
ደመራን በጥበብ በቦታው ያስቆመችው (2)
የተንኮልን ተራራ ያስቆፈረችው (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)',
        lyrics_transliteration = 'CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 1
Min bitebaberu mikegnoch bitru
Kidusu meskelunim sheshigew bisewuru (2)
Alchalum liyatefu min bitebaberu (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 2
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 3
Beterara teshefino lezemenat (2)
Tetilo betenkol tedebiko kenorebet (2)
Tegelete eneho bedemera esat (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 4
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 5
Tarikawi yekiristos hiyaw meskel (2)
Yihew tegelete bekibir begirum hayl (2)
Mingizem siyabera endihu yinoral (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 6
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 7
Eleni nech yihin mistir yasgegnechiw (2)
Demeran betibeb bebotaw yaskomechiw (2)
Yetenkolin terara yaskoferechiw (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '18b8137d-06b9-4326-9a77-d2e0f6e2bfcd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 1
ምን ቢተባበሩ ምቀኞች ቢጥሩ
ቅዱሱ መስቀሉንም ሸሽገው ቢሰውሩ (2)
አልቻሉም ሊያጠፉ ምን ቢተባበሩ (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 2
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 3
በተራራ ተሸፍኖ ለዘመናት (2)
ተጥሎ በተንኮል ተደብቆ ከኖረበት (2)
ተገለጠ እነሆ በደመራ እሳት (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 4
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 5
ታሪካዊ የክርስቶስ ህያው መስቀል (2)
ይኸው ተገለጠ በክብር በግሩም ኃይል (2)
ምንጊዜም ሲያበራ እንዲሁ ይኖራል (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 6
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)

VERSE 7
እሌኒ ነች ይህን ምሥጢር ያስገኘችው (2)
ደመራን በጥበብ በቦታው ያስቆመችው (2)
የተንኮልን ተራራ ያስቆፈረችው (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን ሞላት ዓለምን በሙሉ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 1
Min bitebaberu mikegnoch bitru
Kidusu meskelunim sheshigew bisewuru (2)
Alchalum liyatefu min bitebaberu (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 2
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 3
Beterara teshefino lezemenat (2)
Tetilo betenkol tedebiko kenorebet (2)
Tegelete eneho bedemera esat (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 4
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 5
Tarikawi yekiristos hiyaw meskel (2)
Yihew tegelete bekibir begirum hayl (2)
Mingizem siyabera endihu yinoral (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 6
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)

VERSE 7
Eleni nech yihin mistir yasgegnechiw (2)
Demeran betibeb bebotaw yaskomechiw (2)
Yetenkolin terara yaskoferechiw (2)

CHORUS
Des yibelen elil belu (2)
Alkerem tekebro tegegne meskelu (2)
Bebirhan molat alemin bemulu (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '18b8137d-06b9-4326-9a77-d2e0f6e2bfcd'::uuid, 'des-yibelen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mikael-like-melaekit ("Mikael Like Melaekit")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a2f8ade4-0f2b-4c0c-a296-e53e7f2a9db8'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ክብር የተሰጠህ ነህ ከቸሩ እግዚአብሔር',
        lyrics_transliteration = 'CHORUS
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
Kibir yeteset’eh neh kecheru Egziabher',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a2f8ade4-0f2b-4c0c-a296-e53e7f2a9db8'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a2f8ade4-0f2b-4c0c-a296-e53e7f2a9db8'::uuid, 'mikael-like-melaekit', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kidist ("kidist")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd64d4dbe-17c4-44f9-95d2-5d20035faabe'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ያመሰገኑባት ቅዱስ ቅዱስ ብለው',
        lyrics_transliteration = 'CHORUS
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
Yamesegenubat Kidus Kidus bilew',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd64d4dbe-17c4-44f9-95d2-5d20035faabe'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd64d4dbe-17c4-44f9-95d2-5d20035faabe'::uuid, 'kidist', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- welela-eyu-qalka ("Welela Eyu Qalka")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '951f3f15-24d0-4fc5-b293-244846628c78'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ

VERSE 1
በይነይ ከስተማስል ብዙሕ ክዳፋነቕ
ቃልካ የበርትዓ ንድኽምቲ ነፍሰይ
ሓጎስ ይመልኣኒ ይሕደስ መንፈሰይ
ሽዑስ ከም ብተይ እየ ኣዝየ ዝሰራሰር

CHORUS
ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ

VERSE 2
ኣብ ኣደባባያት ንቓልካ እምስክር
ልበይ ተሓጒሱ ብዓውታ እዝምር
መቓውሐይ ኩሉ ፍፁም ይሰባበር
ንዓይ ጸግዐይ ዋልታይ ቃልካ’ዩ ኣምላኸይ

CHORUS
ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ

VERSE 3
ተስፋ ናይ ሕይወተይ ዘዕርፈሉ ቤተይ
ሓበነይ ኩርዓተይ ዝበለፀ ርስተይ
ዝፀነዐ ዕርደይ ሰናይ ብጽሒተይ
ሰማይ ኮነ ምድሪ ብቓልካ ተፈጥሩ

CHORUS
ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ

VERSE 4
ስለዚ ድማ እዮም ጸኒዖም ዝነብሩ
ኩሎም ፍጥረታት’ውን ነዚ ይምስክሩ
ትርጉም ሕይወተይ’ውን ቃልካ’ዩ ምሥጢሩ

CHORUS
ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kab mear zit’em welela’yu qalka
Hiywet yihbeni niay nibaryaኻ
Hayli yiኾneni niay nibaryaኻ
Kihazn keleኹ amrire kich’neቕ

VERSE 1
Beyney kestemasl bizuh kidafaneቕ
Qalka yeberta nidኽmti nefsey
Hagos yimelani yihdes menfesey
Shus kem bitey eye azye ziseraser

CHORUS
Kab mear zit’em welela’yu qalka
Hiywet yihbeni niay nibaryaኻ
Hayli yiኾneni niay nibaryaኻ
Kihazn keleኹ amrire kich’neቕ

VERSE 2
Ab adebabayat niቓlka emskr
Libey tehagwisu biawta ezmr
Meቓwhey kulu fits’um yisebaber
Niay ts’egay waltay qalka’yu amlaኸy

CHORUS
Kab mear zit’em welela’yu qalka
Hiywet yihbeni niay nibaryaኻ
Hayli yiኾneni niay nibaryaኻ
Kihazn keleኹ amrire kich’neቕ

VERSE 3
Tesfa nay hiywetey zeerfelu betey
Habeney kuratey zibelets’e ristey
Zits’enea erdey senay bits’hitey
Semay kone midri biቓlka tefet’ru

CHORUS
Kab mear zit’em welela’yu qalka
Hiywet yihbeni niay nibaryaኻ
Hayli yiኾneni niay nibaryaኻ
Kihazn keleኹ amrire kich’neቕ

VERSE 4
Silezi dima eyom ts’eniom zinebru
Kulom fit’retat’wn nezi yimskru
Tirgum hiywetey’wn qalka’yu mist’iru

CHORUS
Kab mear zit’em welela’yu qalka
Hiywet yihbeni niay nibaryaኻ
Hayli yiኾneni niay nibaryaኻ
Kihazn keleኹ amrire kich’neቕ'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ

VERSE 1
በይነይ ከስተማስል ብዙሕ ክዳፋነቕ
ቃልካ የበርትዓ ንድኽምቲ ነፍሰይ
ሓጎስ ይመልኣኒ ይሕደስ መንፈሰይ
ሽዑስ ከም ብተይ እየ ኣዝየ ዝሰራሰር

CHORUS
ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ

VERSE 2
ኣብ ኣደባባያት ንቓልካ እምስክር
ልበይ ተሓጒሱ ብዓውታ እዝምር
መቓውሐይ ኩሉ ፍፁም ይሰባበር
ንዓይ ጸግዐይ ዋልታይ ቃልካ’ዩ ኣምላኸይ

CHORUS
ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ

VERSE 3
ተስፋ ናይ ሕይወተይ ዘዕርፈሉ ቤተይ
ሓበነይ ኩርዓተይ ዝበለፀ ርስተይ
ዝፀነዐ ዕርደይ ሰናይ ብጽሒተይ
ሰማይ ኮነ ምድሪ ብቓልካ ተፈጥሩ

CHORUS
ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ

VERSE 4
ስለዚ ድማ እዮም ጸኒዖም ዝነብሩ
ኩሎም ፍጥረታት’ውን ነዚ ይምስክሩ
ትርጉም ሕይወተይ’ውን ቃልካ’ዩ ምሥጢሩ

CHORUS
ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ',
        lyrics_transliteration = 'CHORUS
Kab mear zit’em welela’yu qalka
Hiywet yihbeni niay nibaryaኻ
Hayli yiኾneni niay nibaryaኻ
Kihazn keleኹ amrire kich’neቕ

VERSE 1
Beyney kestemasl bizuh kidafaneቕ
Qalka yeberta nidኽmti nefsey
Hagos yimelani yihdes menfesey
Shus kem bitey eye azye ziseraser

CHORUS
Kab mear zit’em welela’yu qalka
Hiywet yihbeni niay nibaryaኻ
Hayli yiኾneni niay nibaryaኻ
Kihazn keleኹ amrire kich’neቕ

VERSE 2
Ab adebabayat niቓlka emskr
Libey tehagwisu biawta ezmr
Meቓwhey kulu fits’um yisebaber
Niay ts’egay waltay qalka’yu amlaኸy

CHORUS
Kab mear zit’em welela’yu qalka
Hiywet yihbeni niay nibaryaኻ
Hayli yiኾneni niay nibaryaኻ
Kihazn keleኹ amrire kich’neቕ

VERSE 3
Tesfa nay hiywetey zeerfelu betey
Habeney kuratey zibelets’e ristey
Zits’enea erdey senay bits’hitey
Semay kone midri biቓlka tefet’ru

CHORUS
Kab mear zit’em welela’yu qalka
Hiywet yihbeni niay nibaryaኻ
Hayli yiኾneni niay nibaryaኻ
Kihazn keleኹ amrire kich’neቕ

VERSE 4
Silezi dima eyom ts’eniom zinebru
Kulom fit’retat’wn nezi yimskru
Tirgum hiywetey’wn qalka’yu mist’iru

CHORUS
Kab mear zit’em welela’yu qalka
Hiywet yihbeni niay nibaryaኻ
Hayli yiኾneni niay nibaryaኻ
Kihazn keleኹ amrire kich’neቕ',
        updated_at = clock_timestamp()::text
    WHERE import_id = '951f3f15-24d0-4fc5-b293-244846628c78'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ

VERSE 1
በይነይ ከስተማስል ብዙሕ ክዳፋነቕ
ቃልካ የበርትዓ ንድኽምቲ ነፍሰይ
ሓጎስ ይመልኣኒ ይሕደስ መንፈሰይ
ሽዑስ ከም ብተይ እየ ኣዝየ ዝሰራሰር

CHORUS
ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ

VERSE 2
ኣብ ኣደባባያት ንቓልካ እምስክር
ልበይ ተሓጒሱ ብዓውታ እዝምር
መቓውሐይ ኩሉ ፍፁም ይሰባበር
ንዓይ ጸግዐይ ዋልታይ ቃልካ’ዩ ኣምላኸይ

CHORUS
ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ

VERSE 3
ተስፋ ናይ ሕይወተይ ዘዕርፈሉ ቤተይ
ሓበነይ ኩርዓተይ ዝበለፀ ርስተይ
ዝፀነዐ ዕርደይ ሰናይ ብጽሒተይ
ሰማይ ኮነ ምድሪ ብቓልካ ተፈጥሩ

CHORUS
ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ

VERSE 4
ስለዚ ድማ እዮም ጸኒዖም ዝነብሩ
ኩሎም ፍጥረታት’ውን ነዚ ይምስክሩ
ትርጉም ሕይወተይ’ውን ቃልካ’ዩ ምሥጢሩ

CHORUS
ካብ መዓር ዝጥዕም ወለላ’ዩ ቃልካ
ሕይወት ይህበኒ ንዓይ ንባርያኻ
ሓይሊ ይኾነኒ ንዓይ ንባርያኻ
ክሓዝን ከለኹ ኣምሪረ ክጭነቕ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '951f3f15-24d0-4fc5-b293-244846628c78'::uuid, 'welela-eyu-qalka', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zemarit-azeb-kebede ("Zemarit Azeb Kebede")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '95249d7f-ff77-4604-aacb-6311624f9e8b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ክንድህ ብርቱ ነው ማን ያሸንፍሃል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Kindh birtu new man yashenfhal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '95249d7f-ff77-4604-aacb-6311624f9e8b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ክንድህ ብርቱ ነው ማን ያሸንፍሃል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '95249d7f-ff77-4604-aacb-6311624f9e8b'::uuid, 'zemarit-azeb-kebede', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zemir-zemir-alegn ("Zemir Zemir Alegn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '97a05c6b-3d9f-4bd6-846b-3f306657bc24'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ያደረገልኝን እንዴት ብዬ ልርሳ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Yaderegelgnn endet biye lirsa'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '97a05c6b-3d9f-4bd6-846b-3f306657bc24'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ያደረገልኝን እንዴት ብዬ ልርሳ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '97a05c6b-3d9f-4bd6-846b-3f306657bc24'::uuid, 'zemir-zemir-alegn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- emebetachin-mariam ("Emebetachin Mariam")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9db40dd9-b10d-4e09-bb0a-b890aee2e299'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤታችን ማርያም
ሀገራችንን ጠብቂልን በምልጃሽ
እመቤታችን ማርያም
ኢትዮጵያን ጠብቂልን በምልጃሽ

VERSE 1
ከጠላት ሰይጣን ከከሀዲያን
ከጠላት ሰይጣን ሰዉረሽ
እንድትጠብቂን በምልጃሽ

CHORUS
እመቤታችን ማርያም
ሀገራችንን ጠብቂልን በምልጃሽ
እመቤታችን ማርያም
ኢትዮጵያን ጠብቂልን በምልጃሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emebetachen Maryam
Hegerachnn t’ebqiln bemljash
Emebetachen Maryam
Ityop’yan t’ebqiln bemljash

VERSE 1
Ket’elat seyt’an kekehediyan
Ket’elat seyt’an sewuresh
Endtt’ebqin bemljash

CHORUS
Emebetachen Maryam
Hegerachnn t’ebqiln bemljash
Emebetachen Maryam
Ityop’yan t’ebqiln bemljash'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እመቤታችን ማርያም
ሀገራችንን ጠብቂልን በምልጃሽ
እመቤታችን ማርያም
ኢትዮጵያን ጠብቂልን በምልጃሽ

VERSE 1
ከጠላት ሰይጣን ከከሀዲያን
ከጠላት ሰይጣን ሰዉረሽ
እንድትጠብቂን በምልጃሽ

CHORUS
እመቤታችን ማርያም
ሀገራችንን ጠብቂልን በምልጃሽ
እመቤታችን ማርያም
ኢትዮጵያን ጠብቂልን በምልጃሽ',
        lyrics_transliteration = 'CHORUS
Emebetachen Maryam
Hegerachnn t’ebqiln bemljash
Emebetachen Maryam
Ityop’yan t’ebqiln bemljash

VERSE 1
Ket’elat seyt’an kekehediyan
Ket’elat seyt’an sewuresh
Endtt’ebqin bemljash

CHORUS
Emebetachen Maryam
Hegerachnn t’ebqiln bemljash
Emebetachen Maryam
Ityop’yan t’ebqiln bemljash',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9db40dd9-b10d-4e09-bb0a-b890aee2e299'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤታችን ማርያም
ሀገራችንን ጠብቂልን በምልጃሽ
እመቤታችን ማርያም
ኢትዮጵያን ጠብቂልን በምልጃሽ

VERSE 1
ከጠላት ሰይጣን ከከሀዲያን
ከጠላት ሰይጣን ሰዉረሽ
እንድትጠብቂን በምልጃሽ

CHORUS
እመቤታችን ማርያም
ሀገራችንን ጠብቂልን በምልጃሽ
እመቤታችን ማርያም
ኢትዮጵያን ጠብቂልን በምልጃሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9db40dd9-b10d-4e09-bb0a-b890aee2e299'::uuid, 'emebetachin-mariam', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yemisirach-tewelede ("Yemisirach Tewelede")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9991d122-faa7-440a-a55f-e64d0b598637'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ

VERSE 1
የሆነውን ኤልሻዳይ
ከአብ አጠገብ ሳይለይ
መጣ ሳይጎድል በላይ
የሌለው ሲሆን መጠን

CHORUS
የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ

VERSE 2
ተወሰነ በማህፀን
እንደምን አላቃጠላት
ልብሱ ቀሚሱ እሳት
ገብቶ ወጣ ሳይከፍት

CHORUS
የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ

VERSE 3
በማይመረመር ርቀት
አንክሮ ይገባል በእውነት
ያለ ዘርዐ ብእሲ ልደት
እንደምን ያለ ጥበብ

CHORUS
የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ

VERSE 4
ከስፋት ጋር ሆድ መጥበብ
መወለዱ ምን ይደንቅ
እሳት ሲጠቀለል በጨርቅ

CHORUS
የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yemsrach Geta tewelede
Kesemayat werede
Yemsrach tewelede
Semay weledech ts’ehey

VERSE 1
Yehonewn elshaday
Keab at’egeb sayley
Met’a saygodl belay
Yelelew sihon met’en

CHORUS
Yemsrach Geta tewelede
Kesemayat werede
Yemsrach tewelede
Semay weledech ts’ehey

VERSE 2
Tewesene bemahts’en
Endemn alaqat’elat
Libsu qemisu esat
Gebto wet’a saykeft

CHORUS
Yemsrach Geta tewelede
Kesemayat werede
Yemsrach tewelede
Semay weledech ts’ehey

VERSE 3
Bemaymeremer riqet
Ankro yigebal beewnet
Yale zera biesi lidet
Endemn yale t’beb

CHORUS
Yemsrach Geta tewelede
Kesemayat werede
Yemsrach tewelede
Semay weledech ts’ehey

VERSE 4
Kesfat gar hod met’beb
Meweledu min yidenq
Esat sit’eqelel bech’erq

CHORUS
Yemsrach Geta tewelede
Kesemayat werede
Yemsrach tewelede
Semay weledech ts’ehey'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ

VERSE 1
የሆነውን ኤልሻዳይ
ከአብ አጠገብ ሳይለይ
መጣ ሳይጎድል በላይ
የሌለው ሲሆን መጠን

CHORUS
የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ

VERSE 2
ተወሰነ በማህፀን
እንደምን አላቃጠላት
ልብሱ ቀሚሱ እሳት
ገብቶ ወጣ ሳይከፍት

CHORUS
የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ

VERSE 3
በማይመረመር ርቀት
አንክሮ ይገባል በእውነት
ያለ ዘርዐ ብእሲ ልደት
እንደምን ያለ ጥበብ

CHORUS
የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ

VERSE 4
ከስፋት ጋር ሆድ መጥበብ
መወለዱ ምን ይደንቅ
እሳት ሲጠቀለል በጨርቅ

CHORUS
የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ',
        lyrics_transliteration = 'CHORUS
Yemsrach Geta tewelede
Kesemayat werede
Yemsrach tewelede
Semay weledech ts’ehey

VERSE 1
Yehonewn elshaday
Keab at’egeb sayley
Met’a saygodl belay
Yelelew sihon met’en

CHORUS
Yemsrach Geta tewelede
Kesemayat werede
Yemsrach tewelede
Semay weledech ts’ehey

VERSE 2
Tewesene bemahts’en
Endemn alaqat’elat
Libsu qemisu esat
Gebto wet’a saykeft

CHORUS
Yemsrach Geta tewelede
Kesemayat werede
Yemsrach tewelede
Semay weledech ts’ehey

VERSE 3
Bemaymeremer riqet
Ankro yigebal beewnet
Yale zera biesi lidet
Endemn yale t’beb

CHORUS
Yemsrach Geta tewelede
Kesemayat werede
Yemsrach tewelede
Semay weledech ts’ehey

VERSE 4
Kesfat gar hod met’beb
Meweledu min yidenq
Esat sit’eqelel bech’erq

CHORUS
Yemsrach Geta tewelede
Kesemayat werede
Yemsrach tewelede
Semay weledech ts’ehey',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9991d122-faa7-440a-a55f-e64d0b598637'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ

VERSE 1
የሆነውን ኤልሻዳይ
ከአብ አጠገብ ሳይለይ
መጣ ሳይጎድል በላይ
የሌለው ሲሆን መጠን

CHORUS
የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ

VERSE 2
ተወሰነ በማህፀን
እንደምን አላቃጠላት
ልብሱ ቀሚሱ እሳት
ገብቶ ወጣ ሳይከፍት

CHORUS
የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ

VERSE 3
በማይመረመር ርቀት
አንክሮ ይገባል በእውነት
ያለ ዘርዐ ብእሲ ልደት
እንደምን ያለ ጥበብ

CHORUS
የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ

VERSE 4
ከስፋት ጋር ሆድ መጥበብ
መወለዱ ምን ይደንቅ
እሳት ሲጠቀለል በጨርቅ

CHORUS
የምስራች ጌታ ተወለደ
ከሰማያት ወረደ
የምስራች ተወለደ
ሰማይ ወለደች ፀሀይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9991d122-faa7-440a-a55f-e64d0b598637'::uuid, 'yemisirach-tewelede', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- adirigehilignalina-becherinetih-mezimur ("Adirigehilignalina Becherinetih Mezimur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '99d76180-85df-4616-8263-f714555e1314'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
የችግር አረንቋ ፊቴ ተደቅኖ',
        lyrics_transliteration = 'CHORUS
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
Yechgr arenqwa fite tedeqno',
        updated_at = clock_timestamp()::text
    WHERE import_id = '99d76180-85df-4616-8263-f714555e1314'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '99d76180-85df-4616-8263-f714555e1314'::uuid, 'adirigehilignalina-becherinetih-mezimur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- besimih-tamignalehu-1618 ("Besimih Tamignalehu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9a1be1df-e653-4997-958b-62bb9d110770'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ',
        lyrics_transliteration = 'CHORUS
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
Guzoyen ante aqnalgn qidem kefite',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9a1be1df-e653-4997-958b-62bb9d110770'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9a1be1df-e653-4997-958b-62bb9d110770'::uuid, 'besimih-tamignalehu-1618', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
