-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 08 OF 32
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
  -- simih-lezelealem-misigun-silehone ("Simih Lezelealem Misigun Silehone")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '177ddb62-688f-43e9-a892-48567adec1fe'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምህ ለዘለአለም ምስጉን ስለሆነ
ፍጥረት በአኮቴት ስቡህ ብሎ ዳነ
ስቡህ
ስምህ ለዘለአለም ምስጉን ነው ስቡህ

VERSE 1
መኸርን ለሰው ልጅ ምግብን የሰጠህ
የተራበችው ነፍስ በምድር በበረከት
በመገብካት ጊዜ ታመሰግናለች ስቡህ።
እንዳንተ ያለ ማነው ወቅት የሚያፈራርቅ

CHORUS
ስምህ ለዘለአለም ምስጉን ስለሆነ
ፍጥረት በአኮቴት ስቡህ ብሎ ዳነ
ስቡህ
ስምህ ለዘለአለም ምስጉን ነው ስቡህ

VERSE 2
ምድርን በበረከት ሰማይን በጽድቅ
ተራሮች በአበባ ወንዞች የሚሞሉት
ስለጠገቡ ነው ከስጦታ ብዛት ስቡህ
የሚያበራው ገጹ ፊቱ የሚያወዛው

CHORUS
ስምህ ለዘለአለም ምስጉን ስለሆነ
ፍጥረት በአኮቴት ስቡህ ብሎ ዳነ
ስቡህ
ስምህ ለዘለአለም ምስጉን ነው ስቡህ

VERSE 3
ከአንተ በሚቀዳው ከቸርነትህ ነው
የምድር ልምላሜ የፍጥረታት ደስታ
ሲዘምር ይውላል ለለጋሹ ጌታ ስቡህ

CHORUS
ስምህ ለዘለአለም ምስጉን ስለሆነ
ፍጥረት በአኮቴት ስቡህ ብሎ ዳነ
ስቡህ
ስምህ ለዘለአለም ምስጉን ነው ስቡህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Simh lezelealem misgun silehone
Fit’ret beakotet sibuh bilo dane
Sibuh
Simh lezelealem misgun new sibuh

VERSE 1
Meኸrn lesew lij migbn yeset’eh
Yeterabechw nefs bemdr bebereket
Bemegebkat gize tamesegnalech sibuh.
Endante yale manew weqt yemiyaferarq

CHORUS
Simh lezelealem misgun silehone
Fit’ret beakotet sibuh bilo dane
Sibuh
Simh lezelealem misgun new sibuh

VERSE 2
Midrn bebereket semayn bets’dq
Teraroch beabeba wenzoch yemimolut
Silet’egebu new kest’ota bizat sibuh
Yemiyaberaw gets’u fitu yemiyawezaw

CHORUS
Simh lezelealem misgun silehone
Fit’ret beakotet sibuh bilo dane
Sibuh
Simh lezelealem misgun new sibuh

VERSE 3
Keante bemiqedaw kecherneth new
Yemdr limlame yeft’retat desta
Sizemr yiwlal lelegashu Geta sibuh

CHORUS
Simh lezelealem misgun silehone
Fit’ret beakotet sibuh bilo dane
Sibuh
Simh lezelealem misgun new sibuh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስምህ ለዘለአለም ምስጉን ስለሆነ
ፍጥረት በአኮቴት ስቡህ ብሎ ዳነ
ስቡህ
ስምህ ለዘለአለም ምስጉን ነው ስቡህ

VERSE 1
መኸርን ለሰው ልጅ ምግብን የሰጠህ
የተራበችው ነፍስ በምድር በበረከት
በመገብካት ጊዜ ታመሰግናለች ስቡህ።
እንዳንተ ያለ ማነው ወቅት የሚያፈራርቅ

CHORUS
ስምህ ለዘለአለም ምስጉን ስለሆነ
ፍጥረት በአኮቴት ስቡህ ብሎ ዳነ
ስቡህ
ስምህ ለዘለአለም ምስጉን ነው ስቡህ

VERSE 2
ምድርን በበረከት ሰማይን በጽድቅ
ተራሮች በአበባ ወንዞች የሚሞሉት
ስለጠገቡ ነው ከስጦታ ብዛት ስቡህ
የሚያበራው ገጹ ፊቱ የሚያወዛው

CHORUS
ስምህ ለዘለአለም ምስጉን ስለሆነ
ፍጥረት በአኮቴት ስቡህ ብሎ ዳነ
ስቡህ
ስምህ ለዘለአለም ምስጉን ነው ስቡህ

VERSE 3
ከአንተ በሚቀዳው ከቸርነትህ ነው
የምድር ልምላሜ የፍጥረታት ደስታ
ሲዘምር ይውላል ለለጋሹ ጌታ ስቡህ

CHORUS
ስምህ ለዘለአለም ምስጉን ስለሆነ
ፍጥረት በአኮቴት ስቡህ ብሎ ዳነ
ስቡህ
ስምህ ለዘለአለም ምስጉን ነው ስቡህ',
        lyrics_transliteration = 'CHORUS
Simh lezelealem misgun silehone
Fit’ret beakotet sibuh bilo dane
Sibuh
Simh lezelealem misgun new sibuh

VERSE 1
Meኸrn lesew lij migbn yeset’eh
Yeterabechw nefs bemdr bebereket
Bemegebkat gize tamesegnalech sibuh.
Endante yale manew weqt yemiyaferarq

CHORUS
Simh lezelealem misgun silehone
Fit’ret beakotet sibuh bilo dane
Sibuh
Simh lezelealem misgun new sibuh

VERSE 2
Midrn bebereket semayn bets’dq
Teraroch beabeba wenzoch yemimolut
Silet’egebu new kest’ota bizat sibuh
Yemiyaberaw gets’u fitu yemiyawezaw

CHORUS
Simh lezelealem misgun silehone
Fit’ret beakotet sibuh bilo dane
Sibuh
Simh lezelealem misgun new sibuh

VERSE 3
Keante bemiqedaw kecherneth new
Yemdr limlame yeft’retat desta
Sizemr yiwlal lelegashu Geta sibuh

CHORUS
Simh lezelealem misgun silehone
Fit’ret beakotet sibuh bilo dane
Sibuh
Simh lezelealem misgun new sibuh',
        updated_at = clock_timestamp()::text
    WHERE import_id = '177ddb62-688f-43e9-a892-48567adec1fe'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምህ ለዘለአለም ምስጉን ስለሆነ
ፍጥረት በአኮቴት ስቡህ ብሎ ዳነ
ስቡህ
ስምህ ለዘለአለም ምስጉን ነው ስቡህ

VERSE 1
መኸርን ለሰው ልጅ ምግብን የሰጠህ
የተራበችው ነፍስ በምድር በበረከት
በመገብካት ጊዜ ታመሰግናለች ስቡህ።
እንዳንተ ያለ ማነው ወቅት የሚያፈራርቅ

CHORUS
ስምህ ለዘለአለም ምስጉን ስለሆነ
ፍጥረት በአኮቴት ስቡህ ብሎ ዳነ
ስቡህ
ስምህ ለዘለአለም ምስጉን ነው ስቡህ

VERSE 2
ምድርን በበረከት ሰማይን በጽድቅ
ተራሮች በአበባ ወንዞች የሚሞሉት
ስለጠገቡ ነው ከስጦታ ብዛት ስቡህ
የሚያበራው ገጹ ፊቱ የሚያወዛው

CHORUS
ስምህ ለዘለአለም ምስጉን ስለሆነ
ፍጥረት በአኮቴት ስቡህ ብሎ ዳነ
ስቡህ
ስምህ ለዘለአለም ምስጉን ነው ስቡህ

VERSE 3
ከአንተ በሚቀዳው ከቸርነትህ ነው
የምድር ልምላሜ የፍጥረታት ደስታ
ሲዘምር ይውላል ለለጋሹ ጌታ ስቡህ

CHORUS
ስምህ ለዘለአለም ምስጉን ስለሆነ
ፍጥረት በአኮቴት ስቡህ ብሎ ዳነ
ስቡህ
ስምህ ለዘለአለም ምስጉን ነው ስቡህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '177ddb62-688f-43e9-a892-48567adec1fe'::uuid, 'simih-lezelealem-misigun-silehone', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beabate-bet ("Beabate Bet")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '17893bf2-e88c-4ede-b295-ceb9fe2f2d83'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ታናሹ ልጅህ መቼ ይሆን ወደ ልቤ ምመለሰው',
        lyrics_transliteration = 'CHORUS
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
Tanashu lijh meche yihon wede libe mimelesew',
        updated_at = clock_timestamp()::text
    WHERE import_id = '17893bf2-e88c-4ede-b295-ceb9fe2f2d83'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '17893bf2-e88c-4ede-b295-ceb9fe2f2d83'::uuid, 'beabate-bet', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ene-ante-bet ("Ene Ante Bet")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f3b1af51-d36b-4cd9-aff0-9eb3a9d85a8e'::uuid
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
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 5
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 6
ቃል ኪዳንህን አክባሪ
ታማኝ ነህ ሁሌ መሃሪ
የማልከውንም መሃላ
አትረሳም አትልም ችላ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 7
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ
ፍቅር ነህ ከአባትም በላይ
የሰማይ የምድር ሲሳይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 8
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

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
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 11
ቃል ኪዳንህን አክባሪ
ታማኝ ነህ ሁሌ መሃሪ
የማልከውንም መሃላ
አትረሳም አትልም ችላ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 12
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ
ፍቅር ነህ ከአባትም በላይ
የሰማይ የምድር ሲሳይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 13
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 14
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 15
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 16
መሻቴን ብቻ ስላየህ
ደካማ ልጅህን ጎበኘህ
ብቃቴ መቼ ሆነና
ያቆመኝ ላንተ ምስጋና

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 17
አንኳኩ ስላልክ አንኳኳሁ
ጠይቁ ስላልክ ጠየቅሁህ
ከፍተሃል በርህን ለኔ
የታተምኩብህ መድህኔ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 18
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 19
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 20
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
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 1
tselote bihon leweret
godolo bihon yene mnet
barekeny nen kesemay
bedel tfatenm satay

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 2
qebaheny terteheny kedur
seteheny kef yale wenber
saynoreny endm begonet
barekeny bejh bereket

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 3
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 4
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 5
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 6
qal kidanhn ekbari
tamany neh hule mehari
yemalkewnm mehala
etresam etlm chla

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 7
mekari dnq memhre
lante new zema mezmure
fqr neh keebatm belay
yesemay yemdr sisay

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 8
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 9
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 10
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 11
qal kidanhn ekbari
tamany neh hule mehari
yemalkewnm mehala
etresam etlm chla

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 12
mekari dnq memhre
lante new zema mezmure
fqr neh keebatm belay
yesemay yemdr sisay

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 13
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 14
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 15
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 16
meshaten bcha slayeh
dekama ljhn gobenyeh
bqate meche honena
yaqomeny lante msgana

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 17
enku slalk enhu
teyqu slalk teyeqhuh
keftehal berhn lene
yetatemkubh medhne

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 18
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 19
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 20
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem'
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
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 5
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 6
ቃል ኪዳንህን አክባሪ
ታማኝ ነህ ሁሌ መሃሪ
የማልከውንም መሃላ
አትረሳም አትልም ችላ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 7
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ
ፍቅር ነህ ከአባትም በላይ
የሰማይ የምድር ሲሳይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 8
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

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
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 11
ቃል ኪዳንህን አክባሪ
ታማኝ ነህ ሁሌ መሃሪ
የማልከውንም መሃላ
አትረሳም አትልም ችላ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 12
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ
ፍቅር ነህ ከአባትም በላይ
የሰማይ የምድር ሲሳይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 13
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 14
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 15
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 16
መሻቴን ብቻ ስላየህ
ደካማ ልጅህን ጎበኘህ
ብቃቴ መቼ ሆነና
ያቆመኝ ላንተ ምስጋና

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 17
አንኳኩ ስላልክ አንኳኳሁ
ጠይቁ ስላልክ ጠየቅሁህ
ከፍተሃል በርህን ለኔ
የታተምኩብህ መድህኔ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 18
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 19
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 20
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
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 1
tselote bihon leweret
godolo bihon yene mnet
barekeny nen kesemay
bedel tfatenm satay

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 2
qebaheny terteheny kedur
seteheny kef yale wenber
saynoreny endm begonet
barekeny bejh bereket

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 3
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 4
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 5
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 6
qal kidanhn ekbari
tamany neh hule mehari
yemalkewnm mehala
etresam etlm chla

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 7
mekari dnq memhre
lante new zema mezmure
fqr neh keebatm belay
yesemay yemdr sisay

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 8
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 9
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 10
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 11
qal kidanhn ekbari
tamany neh hule mehari
yemalkewnm mehala
etresam etlm chla

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 12
mekari dnq memhre
lante new zema mezmure
fqr neh keebatm belay
yesemay yemdr sisay

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 13
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 14
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 15
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 16
meshaten bcha slayeh
dekama ljhn gobenyeh
bqate meche honena
yaqomeny lante msgana

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 17
enku slalk enhu
teyqu slalk teyeqhuh
keftehal berhn lene
yetatemkubh medhne

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 18
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 19
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 20
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f3b1af51-d36b-4cd9-aff0-9eb3a9d85a8e'::uuid
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
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 5
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 6
ቃል ኪዳንህን አክባሪ
ታማኝ ነህ ሁሌ መሃሪ
የማልከውንም መሃላ
አትረሳም አትልም ችላ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 7
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ
ፍቅር ነህ ከአባትም በላይ
የሰማይ የምድር ሲሳይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 8
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

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
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 11
ቃል ኪዳንህን አክባሪ
ታማኝ ነህ ሁሌ መሃሪ
የማልከውንም መሃላ
አትረሳም አትልም ችላ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 12
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ
ፍቅር ነህ ከአባትም በላይ
የሰማይ የምድር ሲሳይ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 13
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 14
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 15
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 16
መሻቴን ብቻ ስላየህ
ደካማ ልጅህን ጎበኘህ
ብቃቴ መቼ ሆነና
ያቆመኝ ላንተ ምስጋና

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 17
አንኳኩ ስላልክ አንኳኳሁ
ጠይቁ ስላልክ ጠየቅሁህ
ከፍተሃል በርህን ለኔ
የታተምኩብህ መድህኔ

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 18
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 19
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

CHORUS
እኔ አንተ ቤት እኔ አንተ ፊት
የምቆም ሰው አይደለሁም
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም

VERSE 20
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
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 1
tselote bihon leweret
godolo bihon yene mnet
barekeny nen kesemay
bedel tfatenm satay

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 2
qebaheny terteheny kedur
seteheny kef yale wenber
saynoreny endm begonet
barekeny bejh bereket

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 3
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 4
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 5
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 6
qal kidanhn ekbari
tamany neh hule mehari
yemalkewnm mehala
etresam etlm chla

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 7
mekari dnq memhre
lante new zema mezmure
fqr neh keebatm belay
yesemay yemdr sisay

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 8
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 9
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 10
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 11
qal kidanhn ekbari
tamany neh hule mehari
yemalkewnm mehala
etresam etlm chla

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 12
mekari dnq memhre
lante new zema mezmure
fqr neh keebatm belay
yesemay yemdr sisay

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 13
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 14
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 15
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 16
meshaten bcha slayeh
dekama ljhn gobenyeh
bqate meche honena
yaqomeny lante msgana

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 17
enku slalk enhu
teyqu slalk teyeqhuh
keftehal berhn lene
yetatemkubh medhne

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 18
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 19
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

VERSE 20
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem

CHORUS
ne ente bet ne ente fit
yemqom sew eydelehum
gn fqr neh lezelalem
yemimeslh manm yelem';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f3b1af51-d36b-4cd9-aff0-9eb3a9d85a8e'::uuid, 'ene-ante-bet', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- n-seboka-gudeta ("n_seboka_gudeta")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '190b5634-4511-41f7-bb97-e0cde207f6d7'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ልግባ ከእቅፍህ ትዳን ህይወቴ',
        lyrics_transliteration = 'CHORUS
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
Ligba keeqfh tidan hiywete',
        updated_at = clock_timestamp()::text
    WHERE import_id = '190b5634-4511-41f7-bb97-e0cde207f6d7'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '190b5634-4511-41f7-bb97-e0cde207f6d7'::uuid, 'n-seboka-gudeta', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- selame-nesh-dengle ("Selame Nesh Dengle")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '17fcea84-dc4f-43ad-b50a-0516f7441fd7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 1
ወገን ዘመድ ያልኩትሁሉ እራቀኝ
ሀዘን ፅልመት ችግር ገዝፎ ታየኝ
ብራብ ምግቤ ሆነሽልኝ አይቻለሁ
ሰላም ባጣም ባንቺ እፅናናለሁ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 2
ፍቅርን ወልደሽ ሰላምን አገኘው
ድንግል በምልጃሽ ተፈውሻለሁ
የሰላም ምንጭ የነፃነት አርማ
ክብር የምትሰጭ ሞገስ ታላቅ ግርማ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 3
አንቺን ተስፋ አድርጌ ወጥቻለሁ
ቀን እና ሌት ንኢ እልሻለሁ
ላንቺ ልንበርከክ አይዛል ጉልበቴ
ውዳሴሽ ይብዛ ከአንደበቴ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 4
ሱላማጢስ ስልሽ እረካለሁ
በህይወቴ ሰላም አግቻለሁ
እንደሰው ልጅ ቀን እያየሽ የማትርቂ
የአማኑኤል እናት ዛሬም ባርኪኝ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 5
ተባርኪያለሁ ድንግል በልጅሽ
ይኸው ቆሚያለሁ ላመሰግንሽ
ወገን ዘመድ ያልኩት ሁሉ ራቀኝ
ሀዘን ጽልመት ችግር ገዝፎ ታየኝ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 6
ብራብ ምግቤ ሆነሽልኝ አይቻለሁ
ሰላም ባጣም ባንቺ እናናለሁ
ፍቅርን ወልደሽ ሰላምን አገኘሁ
ድንግል በምልጃሽ ተፈውሻለሁ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme

VERSE 1
Wegen zemed yalkuthulu eraqegn
Hezen ts’lmet chgr gezfo tayegn
Birab migbe honeshlgn aychalehu
Selam bat’am banchi ets’nanalehu

CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme

VERSE 2
Fiqrn weldesh selamn agegnew
Dingil bemljash tefewshalehu
Yeselam minch’ yenets’anet arma
Kibir yemtsech’ moges talaq girma

CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme

VERSE 3
Anchin tesfa adrge wet’chalehu
Qen ena let nii elshalehu
Lanchi linberkek ayzal gulbete
Widasesh yibza keandebete

CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme

VERSE 4
Sulamat’is silsh erekalehu
Behywete selam agchalehu
Endesew lij qen eyayesh yematrqi
YeAmanuel enat zarem barkign

CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme

VERSE 5
Tebarkiyalehu Dingil beljsh
Yiኸw qomiyalehu lamesegnsh
Wegen zemed yalkut hulu raqegn
Hezen ts’lmet chgr gezfo tayegn

CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme

VERSE 6
Birab migbe honeshlgn aychalehu
Selam bat’am banchi enanalehu
Fiqrn weldesh selamn agegnehu
Dingil bemljash tefewshalehu

CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 1
ወገን ዘመድ ያልኩትሁሉ እራቀኝ
ሀዘን ፅልመት ችግር ገዝፎ ታየኝ
ብራብ ምግቤ ሆነሽልኝ አይቻለሁ
ሰላም ባጣም ባንቺ እፅናናለሁ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 2
ፍቅርን ወልደሽ ሰላምን አገኘው
ድንግል በምልጃሽ ተፈውሻለሁ
የሰላም ምንጭ የነፃነት አርማ
ክብር የምትሰጭ ሞገስ ታላቅ ግርማ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 3
አንቺን ተስፋ አድርጌ ወጥቻለሁ
ቀን እና ሌት ንኢ እልሻለሁ
ላንቺ ልንበርከክ አይዛል ጉልበቴ
ውዳሴሽ ይብዛ ከአንደበቴ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 4
ሱላማጢስ ስልሽ እረካለሁ
በህይወቴ ሰላም አግቻለሁ
እንደሰው ልጅ ቀን እያየሽ የማትርቂ
የአማኑኤል እናት ዛሬም ባርኪኝ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 5
ተባርኪያለሁ ድንግል በልጅሽ
ይኸው ቆሚያለሁ ላመሰግንሽ
ወገን ዘመድ ያልኩት ሁሉ ራቀኝ
ሀዘን ጽልመት ችግር ገዝፎ ታየኝ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 6
ብራብ ምግቤ ሆነሽልኝ አይቻለሁ
ሰላም ባጣም ባንቺ እናናለሁ
ፍቅርን ወልደሽ ሰላምን አገኘሁ
ድንግል በምልጃሽ ተፈውሻለሁ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ',
        lyrics_transliteration = 'CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme

VERSE 1
Wegen zemed yalkuthulu eraqegn
Hezen ts’lmet chgr gezfo tayegn
Birab migbe honeshlgn aychalehu
Selam bat’am banchi ets’nanalehu

CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme

VERSE 2
Fiqrn weldesh selamn agegnew
Dingil bemljash tefewshalehu
Yeselam minch’ yenets’anet arma
Kibir yemtsech’ moges talaq girma

CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme

VERSE 3
Anchin tesfa adrge wet’chalehu
Qen ena let nii elshalehu
Lanchi linberkek ayzal gulbete
Widasesh yibza keandebete

CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme

VERSE 4
Sulamat’is silsh erekalehu
Behywete selam agchalehu
Endesew lij qen eyayesh yematrqi
YeAmanuel enat zarem barkign

CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme

VERSE 5
Tebarkiyalehu Dingil beljsh
Yiኸw qomiyalehu lamesegnsh
Wegen zemed yalkut hulu raqegn
Hezen ts’lmet chgr gezfo tayegn

CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme

VERSE 6
Birab migbe honeshlgn aychalehu
Selam bat’am banchi enanalehu
Fiqrn weldesh selamn agegnehu
Dingil bemljash tefewshalehu

CHORUS
Selame nesh Dingil wastnaye
Wibete nesh Maryam alegntaye
Yech’nqete derash yehmeme
Tefetalgn banchi ts’nu hilme',
        updated_at = clock_timestamp()::text
    WHERE import_id = '17fcea84-dc4f-43ad-b50a-0516f7441fd7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 1
ወገን ዘመድ ያልኩትሁሉ እራቀኝ
ሀዘን ፅልመት ችግር ገዝፎ ታየኝ
ብራብ ምግቤ ሆነሽልኝ አይቻለሁ
ሰላም ባጣም ባንቺ እፅናናለሁ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 2
ፍቅርን ወልደሽ ሰላምን አገኘው
ድንግል በምልጃሽ ተፈውሻለሁ
የሰላም ምንጭ የነፃነት አርማ
ክብር የምትሰጭ ሞገስ ታላቅ ግርማ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 3
አንቺን ተስፋ አድርጌ ወጥቻለሁ
ቀን እና ሌት ንኢ እልሻለሁ
ላንቺ ልንበርከክ አይዛል ጉልበቴ
ውዳሴሽ ይብዛ ከአንደበቴ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 4
ሱላማጢስ ስልሽ እረካለሁ
በህይወቴ ሰላም አግቻለሁ
እንደሰው ልጅ ቀን እያየሽ የማትርቂ
የአማኑኤል እናት ዛሬም ባርኪኝ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 5
ተባርኪያለሁ ድንግል በልጅሽ
ይኸው ቆሚያለሁ ላመሰግንሽ
ወገን ዘመድ ያልኩት ሁሉ ራቀኝ
ሀዘን ጽልመት ችግር ገዝፎ ታየኝ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ

VERSE 6
ብራብ ምግቤ ሆነሽልኝ አይቻለሁ
ሰላም ባጣም ባንቺ እናናለሁ
ፍቅርን ወልደሽ ሰላምን አገኘሁ
ድንግል በምልጃሽ ተፈውሻለሁ

CHORUS
ሰላሜ ነሽ ድንግል ዋስትናዬ
ውበቴ ነሽ ማርያም አለኝታዬ
የጭንቀቴ ደራሽ የህመሜ
ተፈታልኝ ባንቺ ጽኑ ህልሜ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '17fcea84-dc4f-43ad-b50a-0516f7441fd7'::uuid, 'selame-nesh-dengle', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kedan-esike-berisabeh ("Kedan Esike Berisabeh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c3ef949f-f981-492e-a6cb-d5994a7f90ae'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 1
በገና ተነስ እንዚራ
ማዳኑን እንድናወራ
ምትቀድሙ ምትከተሉ
ሁላችሁ ሆሳዕና በሉ (፪)

CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 2
እግዚአብሔር ዘመን ከሰጠ
ይዘምር የተለወጠ
እልልታ ይሁን ለስሙ
ለዋጀን በወርቀ ደሙ (፪)

CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 3
የክብሬ የቤቴ ጌታ
ለነፍሴ ባለውልታ
ኤፉዱ ነው በፍታው ለብሴ
ዘማሪ ነኝ ለንጉሴ (፪)

CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 4
ሰገነት ላይ የወጣችሁ
ዝምታን የመረጣችሁ
ካፋችሁ ኩራት አይዉጣ
እርሱ ነው ቀን የሚያወጣ

CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 5
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፪)

CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (3)

VERSE 1
Begena tenes enzira
Madanun endnawera
Mitqedmu mitketelu
Hulachhu hosaena belu (2)

CHORUS
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (3)

VERSE 2
Egziabher zemen keset’e
Yizemr yetelewet’e
Ellta yihun lesmu
Lewajen bewerqe demu (2)

CHORUS
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (3)

VERSE 3
Yekbre yebete Geta
Lenefse balewlta
Efudu new beftaw lebse
Zemari negn lenguse (2)

CHORUS
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (3)

VERSE 4
Segenet lay yewet’achhu
Zimtan yemeret’achhu
Kafachhu kurat aywut’a
Ersu new qen yemiyawet’a

CHORUS
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (3)

VERSE 5
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (2)

CHORUS
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (3)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 1
በገና ተነስ እንዚራ
ማዳኑን እንድናወራ
ምትቀድሙ ምትከተሉ
ሁላችሁ ሆሳዕና በሉ (፪)

CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 2
እግዚአብሔር ዘመን ከሰጠ
ይዘምር የተለወጠ
እልልታ ይሁን ለስሙ
ለዋጀን በወርቀ ደሙ (፪)

CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 3
የክብሬ የቤቴ ጌታ
ለነፍሴ ባለውልታ
ኤፉዱ ነው በፍታው ለብሴ
ዘማሪ ነኝ ለንጉሴ (፪)

CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 4
ሰገነት ላይ የወጣችሁ
ዝምታን የመረጣችሁ
ካፋችሁ ኩራት አይዉጣ
እርሱ ነው ቀን የሚያወጣ

CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 5
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፪)

CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)',
        lyrics_transliteration = 'CHORUS
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (3)

VERSE 1
Begena tenes enzira
Madanun endnawera
Mitqedmu mitketelu
Hulachhu hosaena belu (2)

CHORUS
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (3)

VERSE 2
Egziabher zemen keset’e
Yizemr yetelewet’e
Ellta yihun lesmu
Lewajen bewerqe demu (2)

CHORUS
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (3)

VERSE 3
Yekbre yebete Geta
Lenefse balewlta
Efudu new beftaw lebse
Zemari negn lenguse (2)

CHORUS
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (3)

VERSE 4
Segenet lay yewet’achhu
Zimtan yemeret’achhu
Kafachhu kurat aywut’a
Ersu new qen yemiyawet’a

CHORUS
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (3)

VERSE 5
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (2)

CHORUS
Kedan eske bersabeh
Zare moltwal misganah
Tenesa libe zemr
Legeta leEgziabher (3)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c3ef949f-f981-492e-a6cb-d5994a7f90ae'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 1
በገና ተነስ እንዚራ
ማዳኑን እንድናወራ
ምትቀድሙ ምትከተሉ
ሁላችሁ ሆሳዕና በሉ (፪)

CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 2
እግዚአብሔር ዘመን ከሰጠ
ይዘምር የተለወጠ
እልልታ ይሁን ለስሙ
ለዋጀን በወርቀ ደሙ (፪)

CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 3
የክብሬ የቤቴ ጌታ
ለነፍሴ ባለውልታ
ኤፉዱ ነው በፍታው ለብሴ
ዘማሪ ነኝ ለንጉሴ (፪)

CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 4
ሰገነት ላይ የወጣችሁ
ዝምታን የመረጣችሁ
ካፋችሁ ኩራት አይዉጣ
እርሱ ነው ቀን የሚያወጣ

CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)

VERSE 5
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፪)

CHORUS
ከዳን እስከ ቤርሳቤህ
ዛሬ ሞልቷል ምስጋናህ
ተነሳ ልቤ ዘምር
ለጌታ ለእግዚአብሔር (፫)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c3ef949f-f981-492e-a6cb-d5994a7f90ae'::uuid, 'kedan-esike-berisabeh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enewedatalen ("ENEWEDATALEN")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1953fd3e-bf31-4ff7-b3af-2353e845e9cd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 1
አዝ
በመረገም ተይዞ ዓለም በጨለማ
ድህነት እየራበው ጽድቅ እየተጠማ
ከቁስል ለመዳን የመድኃኒት እናት

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 2
የሕይወት ውኃ ምንጩን መቸ አመስገናት
"እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
አለም ምንም ይበል እንወዳታለን"!
አዝ

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 3
በደሙ አክምናል የእርሷ የሆድ ፍሬ
ዓለም ክብሯ ርቆት ይጠብቃል ዛሬ
ታላቁ እውነታ ምሥጥሩ ይሄ ነው
አምላክን ያየነው በእርሷ እናትነት ነው

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 4
" እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
ዓለም ምንም ይበል እንወዳታለን"!
አዝ
ለእናቶች ቀን ሠጥቶ ዓለሙ ሲዘክር

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 5
እንዴት ይቃወማል የእርሷን ምስጋና ክብር
እግዚአብሔር ማስተዋል ጥበቡን ገልጦለት
የድንግሊቱን ፍቅር በልቡ ይሳልለት
"እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 6
ዓለም ምንም ይበል እንወዳታለን"!
አዝ
በቀኙ የምትቆም ማርያም ንግስቲቱ
ለክብሯ መዘመረ ምኑ ነው ስህተቱ?

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 7
ከቅዱስ ገብርኤል እንደ ስማነው ቃል
መልካሙ ምስጋና ልባችን ይፈልቃል
" እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
ዓለም ምንም ይበል እንወዳታለን "!

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 8
አዝ

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 1
CHORUS
Bemeregem teyzo alem bech’elema
Dihnet eyerabew ts’dq eyetet’ema
Kequsl lemedan yemedhanit enat

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 2
Yehywet wiha minch’un meche amesgenat
"egna gin kibir alen egna gin fiqr alen
Alem minm yibel enwedatalen"!
CHORUS

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 3
Bedemu akmnal yeerswa yehod fire
Alem kibrwa riqot yit’ebqal zare
Talaqu ewneta mist’ru yihe new
Amlakn yayenew beerswa enatnet new

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 4
" egna gin kibir alen egna gin fiqr alen
Alem minm yibel enwedatalen"!
CHORUS
Leenatoch qen set’to alemu sizekr

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 5
Endet yiqawemal yeerswan misgana kibir
Egziabher mastewal t’bebun gelt’olet
Yednglitun fiqr belbu yisallet
"egna gin kibir alen egna gin fiqr alen

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 6
Alem minm yibel enwedatalen"!
CHORUS
Beqegnu yemtqom Maryam nigstitu
Lekbrwa mezemere minu new sihtetu?

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 7
Keqdus Gebriel ende simanew qal
Melkamu misgana libachn yifelqal
" egna gin kibir alen egna gin fiqr alen
Alem minm yibel enwedatalen "!

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 8
CHORUS

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 1
አዝ
በመረገም ተይዞ ዓለም በጨለማ
ድህነት እየራበው ጽድቅ እየተጠማ
ከቁስል ለመዳን የመድኃኒት እናት

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 2
የሕይወት ውኃ ምንጩን መቸ አመስገናት
"እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
አለም ምንም ይበል እንወዳታለን"!
አዝ

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 3
በደሙ አክምናል የእርሷ የሆድ ፍሬ
ዓለም ክብሯ ርቆት ይጠብቃል ዛሬ
ታላቁ እውነታ ምሥጥሩ ይሄ ነው
አምላክን ያየነው በእርሷ እናትነት ነው

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 4
" እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
ዓለም ምንም ይበል እንወዳታለን"!
አዝ
ለእናቶች ቀን ሠጥቶ ዓለሙ ሲዘክር

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 5
እንዴት ይቃወማል የእርሷን ምስጋና ክብር
እግዚአብሔር ማስተዋል ጥበቡን ገልጦለት
የድንግሊቱን ፍቅር በልቡ ይሳልለት
"እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 6
ዓለም ምንም ይበል እንወዳታለን"!
አዝ
በቀኙ የምትቆም ማርያም ንግስቲቱ
ለክብሯ መዘመረ ምኑ ነው ስህተቱ?

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 7
ከቅዱስ ገብርኤል እንደ ስማነው ቃል
መልካሙ ምስጋና ልባችን ይፈልቃል
" እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
ዓለም ምንም ይበል እንወዳታለን "!

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)

VERSE 8
አዝ

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)',
        lyrics_transliteration = 'CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 1
CHORUS
Bemeregem teyzo alem bech’elema
Dihnet eyerabew ts’dq eyetet’ema
Kequsl lemedan yemedhanit enat

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 2
Yehywet wiha minch’un meche amesgenat
"egna gin kibir alen egna gin fiqr alen
Alem minm yibel enwedatalen"!
CHORUS

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 3
Bedemu akmnal yeerswa yehod fire
Alem kibrwa riqot yit’ebqal zare
Talaqu ewneta mist’ru yihe new
Amlakn yayenew beerswa enatnet new

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 4
" egna gin kibir alen egna gin fiqr alen
Alem minm yibel enwedatalen"!
CHORUS
Leenatoch qen set’to alemu sizekr

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 5
Endet yiqawemal yeerswan misgana kibir
Egziabher mastewal t’bebun gelt’olet
Yednglitun fiqr belbu yisallet
"egna gin kibir alen egna gin fiqr alen

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 6
Alem minm yibel enwedatalen"!
CHORUS
Beqegnu yemtqom Maryam nigstitu
Lekbrwa mezemere minu new sihtetu?

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 7
Keqdus Gebriel ende simanew qal
Melkamu misgana libachn yifelqal
" egna gin kibir alen egna gin fiqr alen
Alem minm yibel enwedatalen "!

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)

VERSE 8
CHORUS

CHORUS
Yech’elemaw zemen mabqiya milkt nat
Lezih new Maryamn ejg yemnwedat
Ayqenesm kibrwa alem minm ale
Bamesgena endet betadele (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1953fd3e-bf31-4ff7-b3af-2353e845e9cd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)
አዝ=======
በመረገም ተይዞ ዓለም በጨለማ
ድህነት እየራበው ጽድቅ እየተጠማ
ከቁስል ለመዳን የመድኃኒት እናት
የሕይወት ውኃ ምንጩን መቸ አመስገናት
"እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
አለም ምንም ይበል እንወዳታለን"!
አዝ===================
በደሙ አክምናል የእርሷ የሆድ ፍሬ
ዓለም ክብሯ ርቆት ይጠብቃል ዛሬ
ታላቁ እውነታ ምሥጥሩ ይሄ ነው
አምላክን ያየነው በእርሷ እናትነት ነው
" እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
ዓለም ምንም ይበል እንወዳታለን"!
አዝ================
ለእናቶች ቀን ሠጥቶ ዓለሙ ሲዘክር
እንዴት ይቃወማል የእርሷን ምስጋና ክብር
እግዚአብሔር ማስተዋል ጥበቡን ገልጦለት
የድንግሊቱን ፍቅር በልቡ ይሳልለት
"እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
ዓለም ምንም ይበል እንወዳታለን"!
አዝ=====================
በቀኙ የምትቆም ማርያም ንግስቲቱ
ለክብሯ መዘመረ ምኑ ነው ስህተቱ?
ከቅዱስ ገብርኤል እንደ ስማነው ቃል
መልካሙ ምስጋና ልባችን ይፈልቃል
" እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
ዓለም ምንም ይበል እንወዳታለን "!
አዝ====================

VERSE 1
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)
አዝ=======
በመረገም ተይዞ ዓለም በጨለማ
ድህነት እየራበው ጽድቅ እየተጠማ
ከቁስል ለመዳን የመድኃኒት እናት
የሕይወት ውኃ ምንጩን መቸ አመስገናት
"እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
አለም ምንም ይበል እንወዳታለን"!
አዝ===================
በደሙ አክምናል የእርሷ የሆድ ፍሬ
ዓለም ክብሯ ርቆት ይጠብቃል ዛሬ
ታላቁ እውነታ ምሥጥሩ ይሄ ነው
አምላክን ያየነው በእርሷ እናትነት ነው
" እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
ዓለም ምንም ይበል እንወዳታለን"!
አዝ================
ለእናቶች ቀን ሠጥቶ ዓለሙ ሲዘክር
እንዴት ይቃወማል የእርሷን ምስጋና ክብር
እግዚአብሔር ማስተዋል ጥበቡን ገልጦለት
የድንግሊቱን ፍቅር በልቡ ይሳልለት
"እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
ዓለም ምንም ይበል እንወዳታለን"!
አዝ=====================
በቀኙ የምትቆም ማርያም ንግስቲቱ
ለክብሯ መዘመረ ምኑ ነው ስህተቱ?
ከቅዱስ ገብርኤል እንደ ስማነው ቃል
መልካሙ ምስጋና ልባችን ይፈልቃል
" እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
ዓለም ምንም ይበል እንወዳታለን "!
አዝ====================

CHORUS
የጨለማው ዘመን ማብቂያ ምልክት ናት
ለዚህ ነው ማርያምን እጅግ የምንወዳት
አይቀነስም ክብሯ ዓለም ምንም አለ
ባመስገና እንዴት በታደለ(፪)
አዝ=======
በመረገም ተይዞ ዓለም በጨለማ
ድህነት እየራበው ጽድቅ እየተጠማ
ከቁስል ለመዳን የመድኃኒት እናት
የሕይወት ውኃ ምንጩን መቸ አመስገናት
"እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
አለም ምንም ይበል እንወዳታለን"!
አዝ===================
በደሙ አክምናል የእርሷ የሆድ ፍሬ
ዓለም ክብሯ ርቆት ይጠብቃል ዛሬ
ታላቁ እውነታ ምሥጥሩ ይሄ ነው
አምላክን ያየነው በእርሷ እናትነት ነው
" እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
ዓለም ምንም ይበል እንወዳታለን"!
አዝ================
ለእናቶች ቀን ሠጥቶ ዓለሙ ሲዘክር
እንዴት ይቃወማል የእርሷን ምስጋና ክብር
እግዚአብሔር ማስተዋል ጥበቡን ገልጦለት
የድንግሊቱን ፍቅር በልቡ ይሳልለት
"እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
ዓለም ምንም ይበል እንወዳታለን"!
አዝ=====================
በቀኙ የምትቆም ማርያም ንግስቲቱ
ለክብሯ መዘመረ ምኑ ነው ስህተቱ?
ከቅዱስ ገብርኤል እንደ ስማነው ቃል
መልካሙ ምስጋና ልባችን ይፈልቃል
" እኛ ግን ክብር አለን እኛ ግን ፍቅር አለን
ዓለም ምንም ይበል እንወዳታለን "!
አዝ===================='
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1953fd3e-bf31-4ff7-b3af-2353e845e9cd'::uuid, 'enewedatalen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enidiwedih ("Enidiwedih")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '50e703d4-66c4-4cda-ac23-9489d0d11093'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ዶሮ ሳይጮህ ሀሙስ ማታ መካዴን (፪)',
        lyrics_transliteration = 'CHORUS
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
Doro saych’oh hemus mata mekaden (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '50e703d4-66c4-4cda-ac23-9489d0d11093'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '50e703d4-66c4-4cda-ac23-9489d0d11093'::uuid, 'enidiwedih', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beene-bitekur-semay-kiber-balegn-neger-zik-biye-lameseginew ("Beene Bitekur Semay Kiber Balegn Neger Zik Biye Lameseginew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c71ab263-42d6-4613-b00f-647b8ea89fca'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
በነፋሳት የማይጠፋ ፋኖሴ',
        lyrics_transliteration = 'CHORUS
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
Benefasat yemayt’efa fanose',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c71ab263-42d6-4613-b00f-647b8ea89fca'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c71ab263-42d6-4613-b00f-647b8ea89fca'::uuid, 'beene-bitekur-semay-kiber-balegn-neger-zik-biye-lameseginew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- wedseni-byign-by-zemari-deacon-begna-girma ("wedseni byign by zemari Deacon Begna Girma")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1a51b224-c5fa-46ef-861b-92a29350373f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወድሰኒ በይኝ የኤፍሬም ጥበብ
የደግነት ሃገር የፍቅር መዝገብ
እናቴ እመቤቴ እሙ ለእግዚነ
ቃል ካንቺ ሲወለድ ደንቅ ነገር ሆነ

VERSE 1
ጰጦስ የተበለች ዕፅ ያልተቃጠለለች ቁጥቋጦ
ጨለማች ተገፈፈ ብርሃን ባንቺ ተገልጦ
የእግዚአብሔር መዝገብ ነሽና ስላንቺ ብዙ እንላለን
ታናሽ ደመና ተወልደሽ ዝናብን የወለድሽልን

CHORUS
ወድሰኒ በይኝ የኤፍሬም ጥበብ
የደግነት ሃገር የፍቅር መዝገብ
እናቴ እመቤቴ እሙ ለእግዚነ
ቃል ካንቺ ሲወለድ ደንቅ ነገር ሆነ

VERSE 2
ሙዳዬ መና ድንግል ጠገብን በፋሲካው
ምግብ ነው ልጅሽ ኢየሱስ በእምነት ለሚበላው
ሠርግ ቤት እንልሻለን መፍሰሻ የፍቅር የደስታ
ማርያም ጣፋኝ ከመ ማር የተወደደች በጌታ

CHORUS
ወድሰኒ በይኝ የኤፍሬም ጥበብ
የደግነት ሃገር የፍቅር መዝገብ
እናቴ እመቤቴ እሙ ለእግዚነ
ቃል ካንቺ ሲወለድ ደንቅ ነገር ሆነ

VERSE 3
ከንፈሬን እሳት ሲነካው የመንፈስ ቅዱስ ጉጠት
ከኤፍሬም ሃገር ደርሼ እላላሁ ድንግል ብፅዕት
ወደኔ ትመጭ ዘንድ ማን ሆኜ ምድነው ቤቴ?
ፅንስ ያዘልላል ስላምታሽ ሞጉስሽ የእመቤቴ

CHORUS
ወድሰኒ በይኝ የኤፍሬም ጥበብ
የደግነት ሃገር የፍቅር መዝገብ
እናቴ እመቤቴ እሙ ለእግዚነ
ቃል ካንቺ ሲወለድ ደንቅ ነገር ሆነ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wedseni beygn yeefrem t’beb
Yedegnet hager yefqr mezgeb
Enate Emebete emu leegzine
Qal kanchi siweled denq neger hone

VERSE 1
P’et’os yetebelech ets’ yalteqat’elelech qut’qwat’o
Ch’elemach tegefefe birhan banchi tegelt’o
YeEgziabher mezgeb neshna silanchi bizu enlalen
Tanash demena teweldesh zinabn yeweledshln

CHORUS
Wedseni beygn yeefrem t’beb
Yedegnet hager yefqr mezgeb
Enate Emebete emu leegzine
Qal kanchi siweled denq neger hone

VERSE 2
Mudaye mena Dingil t’egebn befasikaw
Migb new lijsh Iyesus beemnet lemibelaw
Serg bet enlshalen mefsesha yefqr yedesta
Maryam t’afagn keme mar yetewededech begeta

CHORUS
Wedseni beygn yeefrem t’beb
Yedegnet hager yefqr mezgeb
Enate Emebete emu leegzine
Qal kanchi siweled denq neger hone

VERSE 3
Kenferen esat sinekaw yemenfes Kidus gut’et
Keefrem hager dershe elalahu Dingil bits’et
Wedene timech’ zend man hogne midnew bete?
Ts’ns yazellal silamtash mogussh yeemebete

CHORUS
Wedseni beygn yeefrem t’beb
Yedegnet hager yefqr mezgeb
Enate Emebete emu leegzine
Qal kanchi siweled denq neger hone'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ወድሰኒ በይኝ የኤፍሬም ጥበብ
የደግነት ሃገር የፍቅር መዝገብ
እናቴ እመቤቴ እሙ ለእግዚነ
ቃል ካንቺ ሲወለድ ደንቅ ነገር ሆነ

VERSE 1
ጰጦስ የተበለች ዕፅ ያልተቃጠለለች ቁጥቋጦ
ጨለማች ተገፈፈ ብርሃን ባንቺ ተገልጦ
የእግዚአብሔር መዝገብ ነሽና ስላንቺ ብዙ እንላለን
ታናሽ ደመና ተወልደሽ ዝናብን የወለድሽልን

CHORUS
ወድሰኒ በይኝ የኤፍሬም ጥበብ
የደግነት ሃገር የፍቅር መዝገብ
እናቴ እመቤቴ እሙ ለእግዚነ
ቃል ካንቺ ሲወለድ ደንቅ ነገር ሆነ

VERSE 2
ሙዳዬ መና ድንግል ጠገብን በፋሲካው
ምግብ ነው ልጅሽ ኢየሱስ በእምነት ለሚበላው
ሠርግ ቤት እንልሻለን መፍሰሻ የፍቅር የደስታ
ማርያም ጣፋኝ ከመ ማር የተወደደች በጌታ

CHORUS
ወድሰኒ በይኝ የኤፍሬም ጥበብ
የደግነት ሃገር የፍቅር መዝገብ
እናቴ እመቤቴ እሙ ለእግዚነ
ቃል ካንቺ ሲወለድ ደንቅ ነገር ሆነ

VERSE 3
ከንፈሬን እሳት ሲነካው የመንፈስ ቅዱስ ጉጠት
ከኤፍሬም ሃገር ደርሼ እላላሁ ድንግል ብፅዕት
ወደኔ ትመጭ ዘንድ ማን ሆኜ ምድነው ቤቴ?
ፅንስ ያዘልላል ስላምታሽ ሞጉስሽ የእመቤቴ

CHORUS
ወድሰኒ በይኝ የኤፍሬም ጥበብ
የደግነት ሃገር የፍቅር መዝገብ
እናቴ እመቤቴ እሙ ለእግዚነ
ቃል ካንቺ ሲወለድ ደንቅ ነገር ሆነ',
        lyrics_transliteration = 'CHORUS
Wedseni beygn yeefrem t’beb
Yedegnet hager yefqr mezgeb
Enate Emebete emu leegzine
Qal kanchi siweled denq neger hone

VERSE 1
P’et’os yetebelech ets’ yalteqat’elelech qut’qwat’o
Ch’elemach tegefefe birhan banchi tegelt’o
YeEgziabher mezgeb neshna silanchi bizu enlalen
Tanash demena teweldesh zinabn yeweledshln

CHORUS
Wedseni beygn yeefrem t’beb
Yedegnet hager yefqr mezgeb
Enate Emebete emu leegzine
Qal kanchi siweled denq neger hone

VERSE 2
Mudaye mena Dingil t’egebn befasikaw
Migb new lijsh Iyesus beemnet lemibelaw
Serg bet enlshalen mefsesha yefqr yedesta
Maryam t’afagn keme mar yetewededech begeta

CHORUS
Wedseni beygn yeefrem t’beb
Yedegnet hager yefqr mezgeb
Enate Emebete emu leegzine
Qal kanchi siweled denq neger hone

VERSE 3
Kenferen esat sinekaw yemenfes Kidus gut’et
Keefrem hager dershe elalahu Dingil bits’et
Wedene timech’ zend man hogne midnew bete?
Ts’ns yazellal silamtash mogussh yeemebete

CHORUS
Wedseni beygn yeefrem t’beb
Yedegnet hager yefqr mezgeb
Enate Emebete emu leegzine
Qal kanchi siweled denq neger hone',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1a51b224-c5fa-46ef-861b-92a29350373f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወድሰኒ በይኝ የኤፍሬም ጥበብ
የደግነት ሃገር የፍቅር መዝገብ
እናቴ እመቤቴ እሙ ለእግዚነ
ቃል ካንቺ ሲወለድ ደንቅ ነገር ሆነ

VERSE 1
ጰጦስ የተበለች ዕፅ ያልተቃጠለለች ቁጥቋጦ
ጨለማች ተገፈፈ ብርሃን ባንቺ ተገልጦ
የእግዚአብሔር መዝገብ ነሽና ስላንቺ ብዙ እንላለን
ታናሽ ደመና ተወልደሽ ዝናብን የወለድሽልን

CHORUS
ወድሰኒ በይኝ የኤፍሬም ጥበብ
የደግነት ሃገር የፍቅር መዝገብ
እናቴ እመቤቴ እሙ ለእግዚነ
ቃል ካንቺ ሲወለድ ደንቅ ነገር ሆነ

VERSE 2
ሙዳዬ መና ድንግል ጠገብን በፋሲካው
ምግብ ነው ልጅሽ ኢየሱስ በእምነት ለሚበላው
ሠርግ ቤት እንልሻለን መፍሰሻ የፍቅር የደስታ
ማርያም ጣፋኝ ከመ ማር የተወደደች በጌታ

CHORUS
ወድሰኒ በይኝ የኤፍሬም ጥበብ
የደግነት ሃገር የፍቅር መዝገብ
እናቴ እመቤቴ እሙ ለእግዚነ
ቃል ካንቺ ሲወለድ ደንቅ ነገር ሆነ

VERSE 3
ከንፈሬን እሳት ሲነካው የመንፈስ ቅዱስ ጉጠት
ከኤፍሬም ሃገር ደርሼ እላላሁ ድንግል ብፅዕት
ወደኔ ትመጭ ዘንድ ማን ሆኜ ምድነው ቤቴ?
ፅንስ ያዘልላል ስላምታሽ ሞጉስሽ የእመቤቴ

CHORUS
ወድሰኒ በይኝ የኤፍሬም ጥበብ
የደግነት ሃገር የፍቅር መዝገብ
እናቴ እመቤቴ እሙ ለእግዚነ
ቃል ካንቺ ሲወለድ ደንቅ ነገር ሆነ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1a51b224-c5fa-46ef-861b-92a29350373f'::uuid, 'wedseni-byign-by-zemari-deacon-begna-girma', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- libe-yawikewal-yaderekilignin-neger ("Libe Yawikewal Yaderekilignin Neger")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '56eebdc9-33ee-4cf9-b84f-a040fd5fd08f'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
በቃል ጉልበት አይወራ',
        lyrics_transliteration = 'CHORUS
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
Beqal gulbet aywera',
        updated_at = clock_timestamp()::text
    WHERE import_id = '56eebdc9-33ee-4cf9-b84f-a040fd5fd08f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ልቤ ያውቀዋል ያደረክልኝን ነገር
የሰራህልኝን ስራ
መድኃኔዓለም አወጣኝ ከመከራ
በቃል ጉልበት አይወራ
መስቀል ተሸክመህ በደም ርሰህ
እኔን በመከራ ዳግም ወልደህ
በክብር ተሻገርኩ ክሰህልኝ
በሕይወት አቆምከኝ ወድቀህልኝ /2/
አዝ=====
የበደሌን ጋራ አቀበቱን
የባርነት ሰነድ እዳ ክሱን
አጥፍተኸው ጌታ መዳን ሆነ
እርቃኔ በእርቃንህ ተሸፈነ /2/
አዝ=====
በፍቅርህ መዓዛ ረክቷል ልቤ
በማይቆም መውደድህ ተከብቤ
የሕይወቴ ወደብ መስቀልህ ነው
ወጀብ እና ነፋስ የማይነቅለው /2/
አዝ=====
የእሾህ አክሊል ደፍተህ ኤልሻዳይ
እፎይ አለ ልቤ ከስቃይ
ሆኖልኛል መዳን አንተ ታመህ
ነጻ ወጣው ሸክሜን ተሸክመህ /2/
አዝ=====
ዙፋንህን አስተወህ የእኔ ፍቅር
ከሰማይ ሀገርህ መጣህ ከምድር
ታየ ስትፈልገኝ ልጄ ብለህ
ፈራጅ እና አጽዳቂ አምላክ ሆነህ

VERSE 1
ልቤ ያውቀዋል ያደረክልኝን ነገር
የሰራህልኝን ስራ
መድኃኔዓለም አወጣኝ ከመከራ
በቃል ጉልበት አይወራ
መስቀል ተሸክመህ በደም ርሰህ
እኔን በመከራ ዳግም ወልደህ
በክብር ተሻገርኩ ክሰህልኝ
በሕይወት አቆምከኝ ወድቀህልኝ /2/
አዝ=====
የበደሌን ጋራ አቀበቱን
የባርነት ሰነድ እዳ ክሱን
አጥፍተኸው ጌታ መዳን ሆነ
እርቃኔ በእርቃንህ ተሸፈነ /2/
አዝ=====
በፍቅርህ መዓዛ ረክቷል ልቤ
በማይቆም መውደድህ ተከብቤ
የሕይወቴ ወደብ መስቀልህ ነው
ወጀብ እና ነፋስ የማይነቅለው /2/
አዝ=====
የእሾህ አክሊል ደፍተህ ኤልሻዳይ
እፎይ አለ ልቤ ከስቃይ
ሆኖልኛል መዳን አንተ ታመህ
ነጻ ወጣው ሸክሜን ተሸክመህ /2/
አዝ=====
ዙፋንህን አስተወህ የእኔ ፍቅር
ከሰማይ ሀገርህ መጣህ ከምድር
ታየ ስትፈልገኝ ልጄ ብለህ
ፈራጅ እና አጽዳቂ አምላክ ሆነህ

CHORUS
ልቤ ያውቀዋል ያደረክልኝን ነገር
የሰራህልኝን ስራ
መድኃኔዓለም አወጣኝ ከመከራ
በቃል ጉልበት አይወራ
መስቀል ተሸክመህ በደም ርሰህ
እኔን በመከራ ዳግም ወልደህ
በክብር ተሻገርኩ ክሰህልኝ
በሕይወት አቆምከኝ ወድቀህልኝ /2/
አዝ=====
የበደሌን ጋራ አቀበቱን
የባርነት ሰነድ እዳ ክሱን
አጥፍተኸው ጌታ መዳን ሆነ
እርቃኔ በእርቃንህ ተሸፈነ /2/
አዝ=====
በፍቅርህ መዓዛ ረክቷል ልቤ
በማይቆም መውደድህ ተከብቤ
የሕይወቴ ወደብ መስቀልህ ነው
ወጀብ እና ነፋስ የማይነቅለው /2/
አዝ=====
የእሾህ አክሊል ደፍተህ ኤልሻዳይ
እፎይ አለ ልቤ ከስቃይ
ሆኖልኛል መዳን አንተ ታመህ
ነጻ ወጣው ሸክሜን ተሸክመህ /2/
አዝ=====
ዙፋንህን አስተወህ የእኔ ፍቅር
ከሰማይ ሀገርህ መጣህ ከምድር
ታየ ስትፈልገኝ ልጄ ብለህ
ፈራጅ እና አጽዳቂ አምላክ ሆነህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '56eebdc9-33ee-4cf9-b84f-a040fd5fd08f'::uuid, 'libe-yawikewal-yaderekilignin-neger', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- simishin-biteru-693 ("Simishin Biteru")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1cd1b7f5-ad8f-432b-974d-b1e0a7f48c93'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ

VERSE 1
የምንዱባን ሰፈር የሞላብሽ ግርማ
ቡራኬሽ ይድረሰኝ እናቴ ይህ ፍቅርሽ
ነፍሴን በምስጋና ለአንቺዉ ላድርስልሽ
የዕለም አርነት ጽህፈት ያለብሽ

CHORUS
ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ

VERSE 2
የሕይወት ፍደሌ ጽድቅ የተማርኩብሽ
ቢያነቡሽ አታልቅ ምስጥርሽ የሰፋ
ስምሽ ማራኪ ነዉ ከልብ የማይጠፋ
በሰዉ አገር ስኖር ሰዉ ጠፍቶ ከጎኔ

CHORUS
ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ

VERSE 3
ባልንጀራ ሆነሽ የሌሊት ብርሃኔ
ተስፋየን አብዝተሽ ጥሜን አስታሸግዉ
በብዙ በረከት ጎጆዬን ሞላሽዉ
ፍፁም ሩህሩህ ነሽ ስምሸ ጣዕም ያለዉ

CHORUS
ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ

VERSE 4
ኀዘኔ ሲበዛ በአንች እጽናናለሁ
የዕለም እርጋታ የሰላም ዉጥን ነሽ
ግዜ ለጣለዉ ሰዉ አይጨክንም ልብሽ

CHORUS
ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Simshn bit’eru yematt’egebi
Yemenged sinqe nesh yenefse megabi
Misganash yibzalgn wedebete gibi
Ts’adqan yeweresush yeEgziabher ketema

VERSE 1
Yemnduban sefer yemolabsh girma
Burakesh yidresegn enate yih fiqrsh
Nefsen bemsgana leanchiwu ladrslsh
Yeelem arnet ts’hfet yalebsh

CHORUS
Simshn bit’eru yematt’egebi
Yemenged sinqe nesh yenefse megabi
Misganash yibzalgn wedebete gibi
Ts’adqan yeweresush yeEgziabher ketema

VERSE 2
Yehywet fidele ts’dq yetemarkubsh
Biyanebush atalq mist’rsh yesefa
Simsh maraki newu kelb yemayt’efa
Besewu ager sinor sewu t’efto kegone

CHORUS
Simshn bit’eru yematt’egebi
Yemenged sinqe nesh yenefse megabi
Misganash yibzalgn wedebete gibi
Ts’adqan yeweresush yeEgziabher ketema

VERSE 3
Balnjera honesh yelelit birhane
Tesfayen abztesh t’men astashegwu
Bebzu bereket gojoyen molashwu
Fits’um ruhruh nesh simshe t’aem yalewu

CHORUS
Simshn bit’eru yematt’egebi
Yemenged sinqe nesh yenefse megabi
Misganash yibzalgn wedebete gibi
Ts’adqan yeweresush yeEgziabher ketema

VERSE 4
Hezene sibeza beanch ets’nanalehu
Yeelem ergata yeselam wut’n nesh
Gize let’alewu sewu aych’eknm libsh

CHORUS
Simshn bit’eru yematt’egebi
Yemenged sinqe nesh yenefse megabi
Misganash yibzalgn wedebete gibi
Ts’adqan yeweresush yeEgziabher ketema'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ

VERSE 1
የምንዱባን ሰፈር የሞላብሽ ግርማ
ቡራኬሽ ይድረሰኝ እናቴ ይህ ፍቅርሽ
ነፍሴን በምስጋና ለአንቺዉ ላድርስልሽ
የዕለም አርነት ጽህፈት ያለብሽ

CHORUS
ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ

VERSE 2
የሕይወት ፍደሌ ጽድቅ የተማርኩብሽ
ቢያነቡሽ አታልቅ ምስጥርሽ የሰፋ
ስምሽ ማራኪ ነዉ ከልብ የማይጠፋ
በሰዉ አገር ስኖር ሰዉ ጠፍቶ ከጎኔ

CHORUS
ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ

VERSE 3
ባልንጀራ ሆነሽ የሌሊት ብርሃኔ
ተስፋየን አብዝተሽ ጥሜን አስታሸግዉ
በብዙ በረከት ጎጆዬን ሞላሽዉ
ፍፁም ሩህሩህ ነሽ ስምሸ ጣዕም ያለዉ

CHORUS
ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ

VERSE 4
ኀዘኔ ሲበዛ በአንች እጽናናለሁ
የዕለም እርጋታ የሰላም ዉጥን ነሽ
ግዜ ለጣለዉ ሰዉ አይጨክንም ልብሽ

CHORUS
ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ',
        lyrics_transliteration = 'CHORUS
Simshn bit’eru yematt’egebi
Yemenged sinqe nesh yenefse megabi
Misganash yibzalgn wedebete gibi
Ts’adqan yeweresush yeEgziabher ketema

VERSE 1
Yemnduban sefer yemolabsh girma
Burakesh yidresegn enate yih fiqrsh
Nefsen bemsgana leanchiwu ladrslsh
Yeelem arnet ts’hfet yalebsh

CHORUS
Simshn bit’eru yematt’egebi
Yemenged sinqe nesh yenefse megabi
Misganash yibzalgn wedebete gibi
Ts’adqan yeweresush yeEgziabher ketema

VERSE 2
Yehywet fidele ts’dq yetemarkubsh
Biyanebush atalq mist’rsh yesefa
Simsh maraki newu kelb yemayt’efa
Besewu ager sinor sewu t’efto kegone

CHORUS
Simshn bit’eru yematt’egebi
Yemenged sinqe nesh yenefse megabi
Misganash yibzalgn wedebete gibi
Ts’adqan yeweresush yeEgziabher ketema

VERSE 3
Balnjera honesh yelelit birhane
Tesfayen abztesh t’men astashegwu
Bebzu bereket gojoyen molashwu
Fits’um ruhruh nesh simshe t’aem yalewu

CHORUS
Simshn bit’eru yematt’egebi
Yemenged sinqe nesh yenefse megabi
Misganash yibzalgn wedebete gibi
Ts’adqan yeweresush yeEgziabher ketema

VERSE 4
Hezene sibeza beanch ets’nanalehu
Yeelem ergata yeselam wut’n nesh
Gize let’alewu sewu aych’eknm libsh

CHORUS
Simshn bit’eru yematt’egebi
Yemenged sinqe nesh yenefse megabi
Misganash yibzalgn wedebete gibi
Ts’adqan yeweresush yeEgziabher ketema',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1cd1b7f5-ad8f-432b-974d-b1e0a7f48c93'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ

VERSE 1
የምንዱባን ሰፈር የሞላብሽ ግርማ
ቡራኬሽ ይድረሰኝ እናቴ ይህ ፍቅርሽ
ነፍሴን በምስጋና ለአንቺዉ ላድርስልሽ
የዕለም አርነት ጽህፈት ያለብሽ

CHORUS
ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ

VERSE 2
የሕይወት ፍደሌ ጽድቅ የተማርኩብሽ
ቢያነቡሽ አታልቅ ምስጥርሽ የሰፋ
ስምሽ ማራኪ ነዉ ከልብ የማይጠፋ
በሰዉ አገር ስኖር ሰዉ ጠፍቶ ከጎኔ

CHORUS
ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ

VERSE 3
ባልንጀራ ሆነሽ የሌሊት ብርሃኔ
ተስፋየን አብዝተሽ ጥሜን አስታሸግዉ
በብዙ በረከት ጎጆዬን ሞላሽዉ
ፍፁም ሩህሩህ ነሽ ስምሸ ጣዕም ያለዉ

CHORUS
ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ

VERSE 4
ኀዘኔ ሲበዛ በአንች እጽናናለሁ
የዕለም እርጋታ የሰላም ዉጥን ነሽ
ግዜ ለጣለዉ ሰዉ አይጨክንም ልብሽ

CHORUS
ስምሽን ብጠሩ የማትጠገቢ
የመንገድ ስንቄ ነሽ የነፍሴ መጋቢ
ምስጋናሽ ይብዛልኝ ወደቤቴ ግቢ
ጻድቃን የወረሱሽ የእግዚአብሔር ከተማ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1cd1b7f5-ad8f-432b-974d-b1e0a7f48c93'::uuid, 'simishin-biteru-693', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zemarit-enkusilase-gossa-o-gebriel-o-gebiriel-lyrics-video ("Zemarit Enkusilase Gossa O Gebriel O Gebiriel (Lyrics Video)")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1b282d00-08f2-47b8-960f-04b0ea6df69a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
በእሳቱ መሀል ብትታይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Beesatu mehel bittay'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '1b282d00-08f2-47b8-960f-04b0ea6df69a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
በእሳቱ መሀል ብትታይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1b282d00-08f2-47b8-960f-04b0ea6df69a'::uuid, 'zemarit-enkusilase-gossa-o-gebriel-o-gebiriel-lyrics-video', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mezmur-by-zemari-besufekad-andargachew ("mezmur by Zemari Besufekad Andargachew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e2195051-a5e7-49ac-89e4-5c158fd59fab'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ቤቴልሄም " "',
        lyrics_transliteration = 'CHORUS
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
Betelhem " "',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e2195051-a5e7-49ac-89e4-5c158fd59fab'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e2195051-a5e7-49ac-89e4-5c158fd59fab'::uuid, 'mezmur-by-zemari-besufekad-andargachew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- feradi-zemarit-ruftaliem-tsigab-eritrean-orthodox-tewahdo-mezmur ("~ Feradi ~Zemarit Ruftaliem Tsigab Eritrean Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '84ba2f51-7fad-4a81-aa8e-3fd936cd96ab'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ክቅጻዕ ተፈሪደ ድሒነ ኣርኪብካለይ',
        lyrics_transliteration = 'CHORUS
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
Kiqts’ae teferide dihine arkibkaley',
        updated_at = clock_timestamp()::text
    WHERE import_id = '84ba2f51-7fad-4a81-aa8e-3fd936cd96ab'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '84ba2f51-7fad-4a81-aa8e-3fd936cd96ab'::uuid, 'feradi-zemarit-ruftaliem-tsigab-eritrean-orthodox-tewahdo-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- chohin-chohin ("Chohin Chohin")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8eeae537-e481-44e2-80fc-6117303be93d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 1
በመስቀሉ ፍቅርን ተምረን ከጌታ።
የእስራኤልን ጩኸት አምላካችን ሰምቶ፣
ፈርኦንን ጥሎታል ሙሴን አስነስቶ።
አ.ዝ

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 2
ሀገርን የሰራን ድንበር ያስከበርን፣
ነፃነት የሰጠን ቅርስን ያስረከብን።
በውስጥም በውጭም መሪ ለነበርነው፣
ጩኸታችን ዛሬ ያልተሰማ ምነው?

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 3
አ.ዝ
ሰማዕታት እንጂ አንቆጥርም እሬሳ፣
አምነው የሞቱትን ስለማንረሳ።
እንደሚታረድ በግ እንዲሁ ዝም ያልነው፣

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 4
ልብሳችንን ሸጠን ሰይፍ እንዳንገዛ ነው።
አ.ዝ
ጥበብና ማዳን ሀይልም የእግዚአብሔር ነው፣
ሾተል አንመዝም ድል ያለው ከእርሱ ነው።

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 5
መከራ እና ስቃይ እስር ሰንሰለቱ፣
ለተዋህዶ እንግዳ አይደለም እሳቱ።
አ.ዝ
በተዋህዶ ላይ እንዲያ የጨከኑ፣

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 6
የሮማ ቄሳሮች የሉም በዙፋኑ።
መከራው አለቀ ስቃዩም አበቃ፣
ቤተክርስቲያን ግን ዛሬም አለች ደምቃ።

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,

VERSE 1
Bemesqelu fiqrn temren kegeta.
Yeesraeln ch’uኸt amlakachn semto,
Feronn t’lotal musen asnesto.
A.z

CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,

VERSE 2
Hegern yeseran dinber yaskebern,
Nets’anet yeset’en qirsn yasrekebn.
Bewst’m bewch’m meri lenebernew,
Ch’uኸtachn zare yaltesema minew?

CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,

VERSE 3
A.z
Semaetat enji anqot’rm eresa,
Amnew yemotutn silemanresa.
Endemitared beg endihu zim yalnew,

CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,

VERSE 4
Libsachnn shet’en seyf endangeza new.
A.z
T’bebna madan heylm yeEgziabher new,
Shotel anmezm dil yalew keersu new.

CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,

VERSE 5
Mekera ena siqay esr senseletu,
Letewahdo engda aydelem esatu.
A.z
Betewahdo lay endiya yech’ekenu,

CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,

VERSE 6
Yeroma qesaroch yelum bezufanu.
Mekeraw aleqe siqayum abeqa,
Bete Kristian gin zarem alech demqa.

CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 1
በመስቀሉ ፍቅርን ተምረን ከጌታ።
የእስራኤልን ጩኸት አምላካችን ሰምቶ፣
ፈርኦንን ጥሎታል ሙሴን አስነስቶ።
አ.ዝ

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 2
ሀገርን የሰራን ድንበር ያስከበርን፣
ነፃነት የሰጠን ቅርስን ያስረከብን።
በውስጥም በውጭም መሪ ለነበርነው፣
ጩኸታችን ዛሬ ያልተሰማ ምነው?

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 3
አ.ዝ
ሰማዕታት እንጂ አንቆጥርም እሬሳ፣
አምነው የሞቱትን ስለማንረሳ።
እንደሚታረድ በግ እንዲሁ ዝም ያልነው፣

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 4
ልብሳችንን ሸጠን ሰይፍ እንዳንገዛ ነው።
አ.ዝ
ጥበብና ማዳን ሀይልም የእግዚአብሔር ነው፣
ሾተል አንመዝም ድል ያለው ከእርሱ ነው።

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 5
መከራ እና ስቃይ እስር ሰንሰለቱ፣
ለተዋህዶ እንግዳ አይደለም እሳቱ።
አ.ዝ
በተዋህዶ ላይ እንዲያ የጨከኑ፣

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 6
የሮማ ቄሳሮች የሉም በዙፋኑ።
መከራው አለቀ ስቃዩም አበቃ፣
ቤተክርስቲያን ግን ዛሬም አለች ደምቃ።

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣',
        lyrics_transliteration = 'CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,

VERSE 1
Bemesqelu fiqrn temren kegeta.
Yeesraeln ch’uኸt amlakachn semto,
Feronn t’lotal musen asnesto.
A.z

CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,

VERSE 2
Hegern yeseran dinber yaskebern,
Nets’anet yeset’en qirsn yasrekebn.
Bewst’m bewch’m meri lenebernew,
Ch’uኸtachn zare yaltesema minew?

CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,

VERSE 3
A.z
Semaetat enji anqot’rm eresa,
Amnew yemotutn silemanresa.
Endemitared beg endihu zim yalnew,

CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,

VERSE 4
Libsachnn shet’en seyf endangeza new.
A.z
T’bebna madan heylm yeEgziabher new,
Shotel anmezm dil yalew keersu new.

CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,

VERSE 5
Mekera ena siqay esr senseletu,
Letewahdo engda aydelem esatu.
A.z
Betewahdo lay endiya yech’ekenu,

CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,

VERSE 6
Yeroma qesaroch yelum bezufanu.
Mekeraw aleqe siqayum abeqa,
Bete Kristian gin zarem alech demqa.

CHORUS
Nebaine nebaine , keme zeinebaine kone. (2)
Ch’ohn ch’ohn , endalch’ohn teqot’ern. (2)
A.z
Sibketachn selam mihret yiqrta,',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8eeae537-e481-44e2-80fc-6117303be93d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 1
በመስቀሉ ፍቅርን ተምረን ከጌታ።
የእስራኤልን ጩኸት አምላካችን ሰምቶ፣
ፈርኦንን ጥሎታል ሙሴን አስነስቶ።
አ.ዝ

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 2
ሀገርን የሰራን ድንበር ያስከበርን፣
ነፃነት የሰጠን ቅርስን ያስረከብን።
በውስጥም በውጭም መሪ ለነበርነው፣
ጩኸታችን ዛሬ ያልተሰማ ምነው?

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 3
አ.ዝ
ሰማዕታት እንጂ አንቆጥርም እሬሳ፣
አምነው የሞቱትን ስለማንረሳ።
እንደሚታረድ በግ እንዲሁ ዝም ያልነው፣

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 4
ልብሳችንን ሸጠን ሰይፍ እንዳንገዛ ነው።
አ.ዝ
ጥበብና ማዳን ሀይልም የእግዚአብሔር ነው፣
ሾተል አንመዝም ድል ያለው ከእርሱ ነው።

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 5
መከራ እና ስቃይ እስር ሰንሰለቱ፣
ለተዋህዶ እንግዳ አይደለም እሳቱ።
አ.ዝ
በተዋህዶ ላይ እንዲያ የጨከኑ፣

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣

VERSE 6
የሮማ ቄሳሮች የሉም በዙፋኑ።
መከራው አለቀ ስቃዩም አበቃ፣
ቤተክርስቲያን ግን ዛሬም አለች ደምቃ።

CHORUS
ነባኢነ ነባኢነ ፣ ከመ ዘኢነባኢነ ኮነ። (፪)
ጮህን ጮህን ፣ እንዳልጮህን ተቆጠርን። (፪)
አ.ዝ
ስብከታችን ሰላም ምህረት ይቅርታ፣'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8eeae537-e481-44e2-80fc-6117303be93d'::uuid, 'chohin-chohin', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enide-kidus-dawit ("Enide Kidus Dawit")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1d3c2190-9684-4564-b74e-cde6ca805d33'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 1
ሄሮድያዳ ሆይ ዘፈንሽ ሐይል አጧል
የእግዚአብሔር ምስጋና ምድራችን ከድኗል
ዝም የማይል ልሳን ሰቶኛል ጌታዬ
ለስሙ ዘምሬ ቆምኩኝ ሰው ተብዬ

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 2
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና
አዝ
ግብረ ተልኮዬ ቅኔ ነው መዝሙር

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 3
በልቤ ነግሰህል ቅዱስ እግዚአብሔር
ከወገኔ ጋራ ልጥራህ በእልልታ
ያሳደከኝ አምላክ ናፍቆቴ ነህ ጌታ
ከተጠራን ከተሰጠን ለስሙ ምስጋና

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 4
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና
አዝ
ጀርባህን አያለው እርቄም ብወጣ
ስለ ቀደምከልኝ ከፊት ስለ ወጣ

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 5
በየተኛው ቋንቋ ተመስገን ልበልህ
ዘምሬ ዘምሬ አልቸንኣልም ልጠግብህ
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 6
አዝ
ምስክር አልሻም እንድ ዘምርልህ
ይቀሰቅሰኛል ፍቅር እና ምረትህ
እስካጣ እስከደክም እንቅልፌ አይኖቼ

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 7
ንሴብኦ ልበል መቅደስህ ገብቼ
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደ ገና

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 1
Herodyada hoy zefensh heyl at’wal
YeEgziabher misgana midrachn kednwal
Zim yemayl lisan setognal Getaye
Lesmu zemre qomkugn sew tebye

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 2
Ketet’eran keteset’en lesmu misgana
Amen yibel midr semay zarem endegena
CHORUS
Gibre telkoye qine new mezmur

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 3
Belbe negsehl Kidus Egziabher
Kewegene gara lit’rah beellta
Yasadekegn amlak nafqote neh Geta
Ketet’eran keteset’en lesmu misgana

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 4
Amen yibel midr semay zarem endegena
CHORUS
Jerbahn ayalew erqem biwet’a
Sile qedemkelgn kefit sile wet’a

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 5
Beyetegnaw qwanqwa temesgen libelh
Zemre zemre alchenalm lit’egbh
Ketet’eran keteset’en lesmu misgana
Amen yibel midr semay zarem endegena

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 6
CHORUS
Miskr alsham end zemrlh
Yiqeseqsegnal fiqr ena mireth
Eskat’a eskedekm enqlfe aynoche

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 7
Nisebo libel meqdesh gebche
Ketet’eran keteset’en lesmu misgana
Amen yibel midr semay zarem ende gena

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 1
ሄሮድያዳ ሆይ ዘፈንሽ ሐይል አጧል
የእግዚአብሔር ምስጋና ምድራችን ከድኗል
ዝም የማይል ልሳን ሰቶኛል ጌታዬ
ለስሙ ዘምሬ ቆምኩኝ ሰው ተብዬ

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 2
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና
አዝ
ግብረ ተልኮዬ ቅኔ ነው መዝሙር

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 3
በልቤ ነግሰህል ቅዱስ እግዚአብሔር
ከወገኔ ጋራ ልጥራህ በእልልታ
ያሳደከኝ አምላክ ናፍቆቴ ነህ ጌታ
ከተጠራን ከተሰጠን ለስሙ ምስጋና

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 4
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና
አዝ
ጀርባህን አያለው እርቄም ብወጣ
ስለ ቀደምከልኝ ከፊት ስለ ወጣ

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 5
በየተኛው ቋንቋ ተመስገን ልበልህ
ዘምሬ ዘምሬ አልቸንኣልም ልጠግብህ
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 6
አዝ
ምስክር አልሻም እንድ ዘምርልህ
ይቀሰቅሰኛል ፍቅር እና ምረትህ
እስካጣ እስከደክም እንቅልፌ አይኖቼ

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና

VERSE 7
ንሴብኦ ልበል መቅደስህ ገብቼ
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደ ገና

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና',
        lyrics_transliteration = 'CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 1
Herodyada hoy zefensh heyl at’wal
YeEgziabher misgana midrachn kednwal
Zim yemayl lisan setognal Getaye
Lesmu zemre qomkugn sew tebye

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 2
Ketet’eran keteset’en lesmu misgana
Amen yibel midr semay zarem endegena
CHORUS
Gibre telkoye qine new mezmur

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 3
Belbe negsehl Kidus Egziabher
Kewegene gara lit’rah beellta
Yasadekegn amlak nafqote neh Geta
Ketet’eran keteset’en lesmu misgana

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 4
Amen yibel midr semay zarem endegena
CHORUS
Jerbahn ayalew erqem biwet’a
Sile qedemkelgn kefit sile wet’a

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 5
Beyetegnaw qwanqwa temesgen libelh
Zemre zemre alchenalm lit’egbh
Ketet’eran keteset’en lesmu misgana
Amen yibel midr semay zarem endegena

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 6
CHORUS
Miskr alsham end zemrlh
Yiqeseqsegnal fiqr ena mireth
Eskat’a eskedekm enqlfe aynoche

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna

VERSE 7
Nisebo libel meqdesh gebche
Ketet’eran keteset’en lesmu misgana
Amen yibel midr semay zarem ende gena

CHORUS
Ende Kidus dawit andebeten fita
Yeqne yemezmur yeybabe Geta
Yireflgn libe lamesgnh ena
Mihreth beene lay zelalem newna',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1d3c2190-9684-4564-b74e-cde6ca805d33'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና
ሄሮድያዳ ሆይ ዘፈንሽ ሐይል አጧል
የእግዚአብሔር ምስጋና ምድራችን ከድኗል
ዝም የማይል ልሳን ሰቶኛል ጌታዬ
ለስሙ ዘምሬ ቆምኩኝ ሰው ተብዬ
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና
አዝ=======
ግብረ ተልኮዬ ቅኔ ነው መዝሙር
በልቤ ነግሰህል ቅዱስ እግዚአብሔር
ከወገኔ ጋራ ልጥራህ በእልልታ
ያሳደከኝ አምላክ ናፍቆቴ ነህ ጌታ
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና
አዝ=======
ጀርባህን አያለው እርቄም ብወጣ
ስለ ቀደምከልኝ ከፊት ስለ ወጣ
በየተኛው ቋንቋ ተመስገን ልበልህ
ዘምሬ ዘምሬ አልቸንኣልም ልጠግብህ
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና
አዝ======
ምስክር አልሻም እንድ ዘምርልህ
ይቀሰቅሰኛል ፍቅር እና ምረትህ
እስካጣ እስከደክም እንቅልፌ አይኖቼ
ንሴብኦ ልበል መቅደስህ ገብቼ
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደ ገና

VERSE 1
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና
ሄሮድያዳ ሆይ ዘፈንሽ ሐይል አጧል
የእግዚአብሔር ምስጋና ምድራችን ከድኗል
ዝም የማይል ልሳን ሰቶኛል ጌታዬ
ለስሙ ዘምሬ ቆምኩኝ ሰው ተብዬ
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና
አዝ=======
ግብረ ተልኮዬ ቅኔ ነው መዝሙር
በልቤ ነግሰህል ቅዱስ እግዚአብሔር
ከወገኔ ጋራ ልጥራህ በእልልታ
ያሳደከኝ አምላክ ናፍቆቴ ነህ ጌታ
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና
አዝ=======
ጀርባህን አያለው እርቄም ብወጣ
ስለ ቀደምከልኝ ከፊት ስለ ወጣ
በየተኛው ቋንቋ ተመስገን ልበልህ
ዘምሬ ዘምሬ አልቸንኣልም ልጠግብህ
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና
አዝ======
ምስክር አልሻም እንድ ዘምርልህ
ይቀሰቅሰኛል ፍቅር እና ምረትህ
እስካጣ እስከደክም እንቅልፌ አይኖቼ
ንሴብኦ ልበል መቅደስህ ገብቼ
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደ ገና

CHORUS
እንደ ቅዱስ ዳዊት አንደበቴን ፍታ
የቅኔ የመዝሙር የይባቤ ጌታ
ይረፍልኝ ልቤ ላመስግንህ እና
ምሕረትህ በእኔ ላይ ዘላለም ነውና
ሄሮድያዳ ሆይ ዘፈንሽ ሐይል አጧል
የእግዚአብሔር ምስጋና ምድራችን ከድኗል
ዝም የማይል ልሳን ሰቶኛል ጌታዬ
ለስሙ ዘምሬ ቆምኩኝ ሰው ተብዬ
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና
አዝ=======
ግብረ ተልኮዬ ቅኔ ነው መዝሙር
በልቤ ነግሰህል ቅዱስ እግዚአብሔር
ከወገኔ ጋራ ልጥራህ በእልልታ
ያሳደከኝ አምላክ ናፍቆቴ ነህ ጌታ
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና
አዝ=======
ጀርባህን አያለው እርቄም ብወጣ
ስለ ቀደምከልኝ ከፊት ስለ ወጣ
በየተኛው ቋንቋ ተመስገን ልበልህ
ዘምሬ ዘምሬ አልቸንኣልም ልጠግብህ
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደገና
አዝ======
ምስክር አልሻም እንድ ዘምርልህ
ይቀሰቅሰኛል ፍቅር እና ምረትህ
እስካጣ እስከደክም እንቅልፌ አይኖቼ
ንሴብኦ ልበል መቅደስህ ገብቼ
ከተጠራን ከተሰጠን ለስሙ ምስጋና
አሜን ይበል ምድር ሰማይ ዛሬም እንደ ገና'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1d3c2190-9684-4564-b74e-cde6ca805d33'::uuid, 'enide-kidus-dawit', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yeabiriham-dinikwan-nesh ("Yeabiriham Dinikwan Nesh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8c97642a-8c82-4388-953d-98943e73a319'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 1
ኅቱም ድንግልና ፍፁም ትኅትና
በሥጋም በነፍስም ፍጽምት ነሽና
ውበትሽን ወድዶ እናቱ አደረገሽ
የሲና ሐመልማል በምን ልመስልሽ

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 2
ሰላም ለኪ ሰላም ለኪ ልበል ለክብርሽ
ደግሜ ደግሜ ላመስግንሽ ደግሜ ላወድስሽ
አዝ….
እርሱ ከመረጠሽ እርሱ ካፀናሽ

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 3
እንዴት ይቻለኛል ከእኔ ላርቅሽ
የተስፋ ፍፃሜ ሁኚ ከእኔ ጋራ
እሻገረዋለሁ የዓለምን መከራ
ሰላም ለኪ ሰላም ለኪ ልበል ለክብርሽ

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 4
ደግሜ ደግሜ ላመስግንሽ ደግሜ ላወድስሽ
አዝ….
ድንግል ፍቀጂልኝ ላወድስ ስምሽን
ፀጋው ከበዛልኝ ልመስክር ክብርሽን

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 5
ያገለግልሽ ዘንድ ልቦናዬ ሻተ
በፍቅር ሞልተሽው ስለተደሰተ
ሰላም ለኪ ሰላም ለኪ ልበል ለክብርሽ
ደግሜ ደግሜ ላመስግንሽ ደግሜ ላወድስሽ

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 6
አዝ…(፪)

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh

VERSE 1
Hitum dingilina fits’um tihtna
Besgam benefsm fits’mt neshna
Wibetshn weddo enatu aderegesh
Yesina hemelmal bemn limeslsh

CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh

VERSE 2
Selam leki selam leki libel lekbrsh
Degme degme lamesgnsh degme lawedssh
CHORUS
Ersu kemeret’esh ersu kats’enash

CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh

VERSE 3
Endet yichalegnal keene larqsh
Yetesfa fits’ame hugni keene gara
Eshagerewalehu yealemn mekera
Selam leki selam leki libel lekbrsh

CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh

VERSE 4
Degme degme lamesgnsh degme lawedssh
CHORUS
Dingil fiqejilgn laweds simshn
Ts’egaw kebezalgn limeskr kibrshn

CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh

VERSE 5
Yageleglsh zend libonaye shate
Befqr molteshw siletedesete
Selam leki selam leki libel lekbrsh
Degme degme lamesgnsh degme lawedssh

CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh

VERSE 6
CHORUS

CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 1
ኅቱም ድንግልና ፍፁም ትኅትና
በሥጋም በነፍስም ፍጽምት ነሽና
ውበትሽን ወድዶ እናቱ አደረገሽ
የሲና ሐመልማል በምን ልመስልሽ

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 2
ሰላም ለኪ ሰላም ለኪ ልበል ለክብርሽ
ደግሜ ደግሜ ላመስግንሽ ደግሜ ላወድስሽ
አዝ….
እርሱ ከመረጠሽ እርሱ ካፀናሽ

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 3
እንዴት ይቻለኛል ከእኔ ላርቅሽ
የተስፋ ፍፃሜ ሁኚ ከእኔ ጋራ
እሻገረዋለሁ የዓለምን መከራ
ሰላም ለኪ ሰላም ለኪ ልበል ለክብርሽ

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 4
ደግሜ ደግሜ ላመስግንሽ ደግሜ ላወድስሽ
አዝ….
ድንግል ፍቀጂልኝ ላወድስ ስምሽን
ፀጋው ከበዛልኝ ልመስክር ክብርሽን

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 5
ያገለግልሽ ዘንድ ልቦናዬ ሻተ
በፍቅር ሞልተሽው ስለተደሰተ
ሰላም ለኪ ሰላም ለኪ ልበል ለክብርሽ
ደግሜ ደግሜ ላመስግንሽ ደግሜ ላወድስሽ

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 6
አዝ…(፪)

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ',
        lyrics_transliteration = 'CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh

VERSE 1
Hitum dingilina fits’um tihtna
Besgam benefsm fits’mt neshna
Wibetshn weddo enatu aderegesh
Yesina hemelmal bemn limeslsh

CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh

VERSE 2
Selam leki selam leki libel lekbrsh
Degme degme lamesgnsh degme lawedssh
CHORUS
Ersu kemeret’esh ersu kats’enash

CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh

VERSE 3
Endet yichalegnal keene larqsh
Yetesfa fits’ame hugni keene gara
Eshagerewalehu yealemn mekera
Selam leki selam leki libel lekbrsh

CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh

VERSE 4
Degme degme lamesgnsh degme lawedssh
CHORUS
Dingil fiqejilgn laweds simshn
Ts’egaw kebezalgn limeskr kibrshn

CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh

VERSE 5
Yageleglsh zend libonaye shate
Befqr molteshw siletedesete
Selam leki selam leki libel lekbrsh
Degme degme lamesgnsh degme lawedssh

CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh

VERSE 6
CHORUS

CHORUS
Yeabrham dinkwan nesh
Yeyaeqob meselal nesh
Maryam selam libelsh misganan laqrblsh
Maryam selam libelsh widasen laqrblsh',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8c97642a-8c82-4388-953d-98943e73a319'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 1
ኅቱም ድንግልና ፍፁም ትኅትና
በሥጋም በነፍስም ፍጽምት ነሽና
ውበትሽን ወድዶ እናቱ አደረገሽ
የሲና ሐመልማል በምን ልመስልሽ

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 2
ሰላም ለኪ ሰላም ለኪ ልበል ለክብርሽ
ደግሜ ደግሜ ላመስግንሽ ደግሜ ላወድስሽ
አዝ….
እርሱ ከመረጠሽ እርሱ ካፀናሽ

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 3
እንዴት ይቻለኛል ከእኔ ላርቅሽ
የተስፋ ፍፃሜ ሁኚ ከእኔ ጋራ
እሻገረዋለሁ የዓለምን መከራ
ሰላም ለኪ ሰላም ለኪ ልበል ለክብርሽ

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 4
ደግሜ ደግሜ ላመስግንሽ ደግሜ ላወድስሽ
አዝ….
ድንግል ፍቀጂልኝ ላወድስ ስምሽን
ፀጋው ከበዛልኝ ልመስክር ክብርሽን

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 5
ያገለግልሽ ዘንድ ልቦናዬ ሻተ
በፍቅር ሞልተሽው ስለተደሰተ
ሰላም ለኪ ሰላም ለኪ ልበል ለክብርሽ
ደግሜ ደግሜ ላመስግንሽ ደግሜ ላወድስሽ

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ

VERSE 6
አዝ…(፪)

CHORUS
የአብርሃም ድንኳን ነሽ
የያዕቆብ መሰላል ነሽ
ማርያም ሰላም ልበልሽ ምስጋናን ላቅርብልሽ
ማርያም ሰላም ልበልሽ ውዳሴን ላቅርብልሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8c97642a-8c82-4388-953d-98943e73a319'::uuid, 'yeabiriham-dinikwan-nesh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beewinet-semaetat ("Beewinet Semaetat")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8eaf7996-fec7-4311-b50b-fcc0aa07bae5'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
በእውነት ሰማዕታት ምርጦችህ ሆኑ /2',
        lyrics_transliteration = 'CHORUS
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
Beewnet semaetat mirt’ochh honu /2',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8eaf7996-fec7-4311-b50b-fcc0aa07bae5'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8eaf7996-fec7-4311-b50b-fcc0aa07bae5'::uuid, 'beewinet-semaetat', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- begol-sekebe ("Begol Sekebe")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1f3083d6-378f-4718-89e6-c194cd414fe2'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ዮም ተወለደ',
        lyrics_transliteration = 'CHORUS
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
Yom tewelede',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1f3083d6-378f-4718-89e6-c194cd414fe2'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1f3083d6-378f-4718-89e6-c194cd414fe2'::uuid, 'begol-sekebe', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eyuna-emenu-sewoch-like-mezemiran-yilima-hayilu ("Eyuna Emenu Sewoch Like Mezemiran Yilima Hayilu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2d8d1dfe-f731-47ca-af81-62859e16d7c5'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
የሞት ኃይል ተዋርዷል ዛሬ፣ሲዖልም ተመሰቃቅሏል(፪)',
        lyrics_transliteration = 'CHORUS
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
Yemot hayl tewardwal zare,siolm temeseqaqlwal (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2d8d1dfe-f731-47ca-af81-62859e16d7c5'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2d8d1dfe-f731-47ca-af81-62859e16d7c5'::uuid, 'eyuna-emenu-sewoch-like-mezemiran-yilima-hayilu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- hes-done-wonders-for-me ("He's Done Wonders for Me")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '90b173dd-7974-4254-8bd1-3edd02cc462d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ

VERSE 1
He’s done wonders for me Without counting my sins
He’s done wonders for me He called me to His home
He’s done wonders for me While I had been worthless
He’s done wonders for me Told me my child come

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ

VERSE 2
He’s done wonders for me In His Second Coming
He’s done wonders for me To give me His kingdom

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ

VERSE 3
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya

VERSE 1
He’s done wonders for me Without counting my sins
He’s done wonders for me He called me to His home
He’s done wonders for me While I had been worthless

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya

VERSE 2
He’s done wonders for me Told me my child come
He’s done wonders for me In His Second Coming
He’s done wonders for me To give me His kingdom
He’s done wonders for me the Lord God Almighty

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya

VERSE 3
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ

VERSE 1
He’s done wonders for me Without counting my sins
He’s done wonders for me He called me to His home
He’s done wonders for me While I had been worthless
He’s done wonders for me Told me my child come

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ

VERSE 2
He’s done wonders for me In His Second Coming
He’s done wonders for me To give me His kingdom

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ

VERSE 3
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ',
        lyrics_transliteration = 'CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya

VERSE 1
He’s done wonders for me Without counting my sins
He’s done wonders for me He called me to His home
He’s done wonders for me While I had been worthless

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya

VERSE 2
He’s done wonders for me Told me my child come
He’s done wonders for me In His Second Coming
He’s done wonders for me To give me His kingdom
He’s done wonders for me the Lord God Almighty

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya

VERSE 3
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya',
        updated_at = clock_timestamp()::text
    WHERE import_id = '90b173dd-7974-4254-8bd1-3edd02cc462d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ

VERSE 1
He’s done wonders for me Without counting my sins
He’s done wonders for me He called me to His home
He’s done wonders for me While I had been worthless
He’s done wonders for me Told me my child come

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ

VERSE 2
He’s done wonders for me In His Second Coming
He’s done wonders for me To give me His kingdom

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ

VERSE 3
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
ድንቅ አድርጎልኛል የሠራዊት ጌታ
አልረሳኝም አምላክ አነሳኝ ከትቢያ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya

VERSE 1
He’s done wonders for me Without counting my sins
He’s done wonders for me He called me to His home
He’s done wonders for me While I had been worthless

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya

VERSE 2
He’s done wonders for me Told me my child come
He’s done wonders for me In His Second Coming
He’s done wonders for me To give me His kingdom
He’s done wonders for me the Lord God Almighty

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya

VERSE 3
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya

CHORUS
He’s done wonders for me the Lord God Almighty
Lifted me from the dust He never forgot me
dnq edrgolnyal yeserawit geta
elresanym emlak enesany ketbiya';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '90b173dd-7974-4254-8bd1-3edd02cc462d'::uuid, 'hes-done-wonders-for-me', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yadanegnen-awkewalehu ("Yadanegnen Awkewalehu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '09c14161-d87d-4fa6-9c77-ebb23162ed0e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();

VERSE 1
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();

CHORUS
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();

VERSE 1
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();

CHORUS
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();

VERSE 1
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();

CHORUS
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();',
        lyrics_transliteration = 'CHORUS
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();

VERSE 1
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();

CHORUS
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();',
        updated_at = clock_timestamp()::text
    WHERE import_id = '09c14161-d87d-4fa6-9c77-ebb23162ed0e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();

VERSE 1
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();

CHORUS
(function(){function c(){var b=a.contentDocument||(a.contentWindow&&a.contentWindow.document);if(b){var d=b.createElement(''script'');d.innerHTML="window.__CF$cv$params={r:''a4f57d173d0c7a0b'',t:''MTc5MjgwODI4Mg==''};var a=document.createElement(''script'');a.src=''/cdn-cgi/challenge-platform/scripts/jsd/main.js'';document.getElementsByTagName(''head'')[0].appendChild(a);";b.getElementsByTagName(''head'')[0].appendChild(d)}}if(document.body){var a=document.createElement(''iframe'');a.height=1;a.width=1;a.style.position=''absolute'';a.style.top=0;a.style.left=0;a.style.border=''none'';a.style.visibility=''hidden'';document.body.appendChild(a);if(''loading''!==document.readyState)c();else if(window.addEventListener)document.addEventListener(''DOMContentLoaded'',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);''loading''!==document.readyState&&(document.onreadystatechange=e,c())}}}})();'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '09c14161-d87d-4fa6-9c77-ebb23162ed0e'::uuid, 'yadanegnen-awkewalehu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- haile-bertate-kebre-moges ("Haile Bertate Kebre Moges")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '20949368-b5f0-4482-958f-581628cb2d2c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 1
በአንድነት ሶስትነት በዙፋኑ ሞልቶ
የሚሳነው የለም ለስላሴ ከቶ
አዝ…
ከመንገድ ዳር ልቁም የወደቀ ላንሳ

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 2
የተራበ ላብላ የታመመ አልርሳ
እንደ አብርሃም አርገኝ እንደ ደጉ አባት
ቤቴ እንዲሞላ በአንተ በረከት
አዝ…

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 3
ጠፈሩት በውሃ በጥበብ የሰራ
እኔስ ይገርመኛል የስላሴ ስራ
ኑና ተመልከቱ ተዓምራት ሲሰራ
ሰዎች እልል በሉ ወላድ ሆነች ሳራ

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 4
አዝ…
አብ አንድያ ልጁን እስኪስጥ ወዶናል
ወልድ በተዋህዶ እኛንም መስሎናል
ኃይሉ ተገለጠ የመንፈስ ቅዱስ

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 5
በቅዱሳን አድሮ ሲያድን ሲፈውስ
አዝ…

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabrhamu Silassie (2)
Temeret’ech nefse anten lemawedes
Kelay kearyam keslase meqdes

VERSE 1
Beandnet sostnet bezufanu molto
Yemisanew yelem leSilassie keto
CHORUS
Kemenged dar liqum yewedeqe lansa

CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabrhamu Silassie (2)
Temeret’ech nefse anten lemawedes
Kelay kearyam keslase meqdes

VERSE 2
Yeterabe labla yetameme alrsa
Ende abrham argegn ende degu abat
Bete endimola beante bereket
CHORUS

CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabrhamu Silassie (2)
Temeret’ech nefse anten lemawedes
Kelay kearyam keslase meqdes

VERSE 3
T’eferut bewha bet’beb yesera
Enes yigermegnal yeslase sira
Nuna temelketu teamrat sisera
Sewoch ell belu welad honech sara

CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabrhamu Silassie (2)
Temeret’ech nefse anten lemawedes
Kelay kearyam keslase meqdes

VERSE 4
CHORUS
Ab andya lijun eskist’ wedonal
Weld betewahdo egnanm meslonal
Haylu tegelet’e yemenfes Kidus

CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabrhamu Silassie (2)
Temeret’ech nefse anten lemawedes
Kelay kearyam keslase meqdes

VERSE 5
Beqdusan adro siyadn sifews
CHORUS

CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabrhamu Silassie (2)
Temeret’ech nefse anten lemawedes
Kelay kearyam keslase meqdes'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 1
በአንድነት ሶስትነት በዙፋኑ ሞልቶ
የሚሳነው የለም ለስላሴ ከቶ
አዝ…
ከመንገድ ዳር ልቁም የወደቀ ላንሳ

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 2
የተራበ ላብላ የታመመ አልርሳ
እንደ አብርሃም አርገኝ እንደ ደጉ አባት
ቤቴ እንዲሞላ በአንተ በረከት
አዝ…

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 3
ጠፈሩት በውሃ በጥበብ የሰራ
እኔስ ይገርመኛል የስላሴ ስራ
ኑና ተመልከቱ ተዓምራት ሲሰራ
ሰዎች እልል በሉ ወላድ ሆነች ሳራ

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 4
አዝ…
አብ አንድያ ልጁን እስኪስጥ ወዶናል
ወልድ በተዋህዶ እኛንም መስሎናል
ኃይሉ ተገለጠ የመንፈስ ቅዱስ

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 5
በቅዱሳን አድሮ ሲያድን ሲፈውስ
አዝ…

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ',
        lyrics_transliteration = 'CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabrhamu Silassie (2)
Temeret’ech nefse anten lemawedes
Kelay kearyam keslase meqdes

VERSE 1
Beandnet sostnet bezufanu molto
Yemisanew yelem leSilassie keto
CHORUS
Kemenged dar liqum yewedeqe lansa

CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabrhamu Silassie (2)
Temeret’ech nefse anten lemawedes
Kelay kearyam keslase meqdes

VERSE 2
Yeterabe labla yetameme alrsa
Ende abrham argegn ende degu abat
Bete endimola beante bereket
CHORUS

CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabrhamu Silassie (2)
Temeret’ech nefse anten lemawedes
Kelay kearyam keslase meqdes

VERSE 3
T’eferut bewha bet’beb yesera
Enes yigermegnal yeslase sira
Nuna temelketu teamrat sisera
Sewoch ell belu welad honech sara

CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabrhamu Silassie (2)
Temeret’ech nefse anten lemawedes
Kelay kearyam keslase meqdes

VERSE 4
CHORUS
Ab andya lijun eskist’ wedonal
Weld betewahdo egnanm meslonal
Haylu tegelet’e yemenfes Kidus

CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabrhamu Silassie (2)
Temeret’ech nefse anten lemawedes
Kelay kearyam keslase meqdes

VERSE 5
Beqdusan adro siyadn sifews
CHORUS

CHORUS
Hayle birtate kibre mogese (2)
Yezelealemu yeabrhamu Silassie (2)
Temeret’ech nefse anten lemawedes
Kelay kearyam keslase meqdes',
        updated_at = clock_timestamp()::text
    WHERE import_id = '20949368-b5f0-4482-958f-581628cb2d2c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 1
በአንድነት ሶስትነት በዙፋኑ ሞልቶ
የሚሳነው የለም ለስላሴ ከቶ
አዝ…
ከመንገድ ዳር ልቁም የወደቀ ላንሳ

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 2
የተራበ ላብላ የታመመ አልርሳ
እንደ አብርሃም አርገኝ እንደ ደጉ አባት
ቤቴ እንዲሞላ በአንተ በረከት
አዝ…

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 3
ጠፈሩት በውሃ በጥበብ የሰራ
እኔስ ይገርመኛል የስላሴ ስራ
ኑና ተመልከቱ ተዓምራት ሲሰራ
ሰዎች እልል በሉ ወላድ ሆነች ሳራ

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 4
አዝ…
አብ አንድያ ልጁን እስኪስጥ ወዶናል
ወልድ በተዋህዶ እኛንም መስሎናል
ኃይሉ ተገለጠ የመንፈስ ቅዱስ

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ

VERSE 5
በቅዱሳን አድሮ ሲያድን ሲፈውስ
አዝ…

CHORUS
ኃይሌ ብርታቴ ክብሬ ሞገሴ (2)
የዘለዓለሙ የአብርሃሙ ስላሴ (2)
ተመረጠች ነፍሴ አንተን ለማወደስ
ከላይ ከአርያም ከስላሴ መቅደስ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '20949368-b5f0-4482-958f-581628cb2d2c'::uuid, 'haile-bertate-kebre-moges', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- emikebikabe-welida-ledinigil ("Emikebikabe Welida Ledinigil")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '21899ff7-5a24-4729-aee1-e325125cfa31'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 1
ኧ
እምከብካበ
ወልዳ ለድንግል (2)
ቃለ አብ ህያው የመረጠሽ

CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 2
በተዋህዶ ያደረብሽ
አማናዊት ፂሆን ማርያም አንቺ ነሽ
ማህደረ መለኮት ድንግል አንቺ ነሽ
ረቂቅ ቃልየተፃፈብሽ

CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 3
ድህነታችን የታወጀብሽ
ህትምት ሰሌዳ ንፅሂት አንቺ ነሽ
የኪዳሉ ፅላት ብፅሂት አንቺ ነሽ(2)
ሙሽራሽ ሆነ ቸሩ ልጅሽ

CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 4
ስጋችንን ነስቶከስጋሽ
በመርገመ ሀጥያት ስንቆሽሽ
ህይወትን አደለን ሆነልን ፈዋሽ
ንግስተ ሰማይ በመሆንሽ

CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 5
ባለሟልነትን ስለታደልሽ
ከሰርጉ እንዳይለየን ቅዱሱ ልጅሽ
ተማፅነንብሻል እኛ ልጆችሽ

CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Enze nibl
Inthagol
Emkebkabe
Welda ledngl (2)

VERSE 1
ኧ
Emkebkabe
Welda ledngl (2)
Qale Ab hiyaw yemeret’esh

CHORUS
Enze nibl
Inthagol
Emkebkabe
Welda ledngl (2)

VERSE 2
Betewahdo yaderebsh
Amanawit ts’ihon Maryam anchi nesh
Mahdere melekot Dingil anchi nesh
Reqiq qalyetets’afebsh

CHORUS
Enze nibl
Inthagol
Emkebkabe
Welda ledngl (2)

VERSE 3
Dihnetachn yetawejebsh
Hitmt seleda nits’hit anchi nesh
Yekidalu ts’lat bits’hit anchi nesh (2)
Mushrash hone cheru lijsh

CHORUS
Enze nibl
Inthagol
Emkebkabe
Welda ledngl (2)

VERSE 4
Sigachnn nestokesgash
Bemergeme het’yat sinqoshsh
Hiywetn adelen honeln fewash
Nigste semay bemehonsh

CHORUS
Enze nibl
Inthagol
Emkebkabe
Welda ledngl (2)

VERSE 5
Balemwalnetn siletadelsh
Kesergu endayleyen qidusu lijsh
Temats’nenbshal egna lijochsh

CHORUS
Enze nibl
Inthagol
Emkebkabe
Welda ledngl (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 1
ኧ
እምከብካበ
ወልዳ ለድንግል (2)
ቃለ አብ ህያው የመረጠሽ

CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 2
በተዋህዶ ያደረብሽ
አማናዊት ፂሆን ማርያም አንቺ ነሽ
ማህደረ መለኮት ድንግል አንቺ ነሽ
ረቂቅ ቃልየተፃፈብሽ

CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 3
ድህነታችን የታወጀብሽ
ህትምት ሰሌዳ ንፅሂት አንቺ ነሽ
የኪዳሉ ፅላት ብፅሂት አንቺ ነሽ(2)
ሙሽራሽ ሆነ ቸሩ ልጅሽ

CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 4
ስጋችንን ነስቶከስጋሽ
በመርገመ ሀጥያት ስንቆሽሽ
ህይወትን አደለን ሆነልን ፈዋሽ
ንግስተ ሰማይ በመሆንሽ

CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 5
ባለሟልነትን ስለታደልሽ
ከሰርጉ እንዳይለየን ቅዱሱ ልጅሽ
ተማፅነንብሻል እኛ ልጆችሽ

CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)',
        lyrics_transliteration = 'CHORUS
Enze nibl
Inthagol
Emkebkabe
Welda ledngl (2)

VERSE 1
ኧ
Emkebkabe
Welda ledngl (2)
Qale Ab hiyaw yemeret’esh

CHORUS
Enze nibl
Inthagol
Emkebkabe
Welda ledngl (2)

VERSE 2
Betewahdo yaderebsh
Amanawit ts’ihon Maryam anchi nesh
Mahdere melekot Dingil anchi nesh
Reqiq qalyetets’afebsh

CHORUS
Enze nibl
Inthagol
Emkebkabe
Welda ledngl (2)

VERSE 3
Dihnetachn yetawejebsh
Hitmt seleda nits’hit anchi nesh
Yekidalu ts’lat bits’hit anchi nesh (2)
Mushrash hone cheru lijsh

CHORUS
Enze nibl
Inthagol
Emkebkabe
Welda ledngl (2)

VERSE 4
Sigachnn nestokesgash
Bemergeme het’yat sinqoshsh
Hiywetn adelen honeln fewash
Nigste semay bemehonsh

CHORUS
Enze nibl
Inthagol
Emkebkabe
Welda ledngl (2)

VERSE 5
Balemwalnetn siletadelsh
Kesergu endayleyen qidusu lijsh
Temats’nenbshal egna lijochsh

CHORUS
Enze nibl
Inthagol
Emkebkabe
Welda ledngl (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '21899ff7-5a24-4729-aee1-e325125cfa31'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 1
ኧ
እምከብካበ
ወልዳ ለድንግል (2)
ቃለ አብ ህያው የመረጠሽ

CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 2
በተዋህዶ ያደረብሽ
አማናዊት ፂሆን ማርያም አንቺ ነሽ
ማህደረ መለኮት ድንግል አንቺ ነሽ
ረቂቅ ቃልየተፃፈብሽ

CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 3
ድህነታችን የታወጀብሽ
ህትምት ሰሌዳ ንፅሂት አንቺ ነሽ
የኪዳሉ ፅላት ብፅሂት አንቺ ነሽ(2)
ሙሽራሽ ሆነ ቸሩ ልጅሽ

CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 4
ስጋችንን ነስቶከስጋሽ
በመርገመ ሀጥያት ስንቆሽሽ
ህይወትን አደለን ሆነልን ፈዋሽ
ንግስተ ሰማይ በመሆንሽ

CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)

VERSE 5
ባለሟልነትን ስለታደልሽ
ከሰርጉ እንዳይለየን ቅዱሱ ልጅሽ
ተማፅነንብሻል እኛ ልጆችሽ

CHORUS
እንዘ ንብል
ኢንትኃጎል
እምከብካበ
ወልዳ ለድንግል (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '21899ff7-5a24-4729-aee1-e325125cfa31'::uuid, 'emikebikabe-welida-ledinigil', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- akime-ante-neh ("akime ante neh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '98e821f1-700d-4ed8-a763-f4f8edfded03'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
በረከት ያደልከኝ ገብተህ ከድንኳኔ',
        lyrics_transliteration = 'CHORUS
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
Bereket yadelkegn gebteh kednkwane',
        updated_at = clock_timestamp()::text
    WHERE import_id = '98e821f1-700d-4ed8-a763-f4f8edfded03'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '98e821f1-700d-4ed8-a763-f4f8edfded03'::uuid, 'akime-ante-neh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ayiferidekiniye-beleni ("Ayiferidekiniye Beleni")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '21dec133-d114-4edd-818b-9e66190c4c1c'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
‎ምክሪ ከሰስተይ(2) ብምሕረት ስዓሮ',
        lyrics_transliteration = 'CHORUS
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
‎mkri kesestey (2) bimhret siaro',
        updated_at = clock_timestamp()::text
    WHERE import_id = '21dec133-d114-4edd-818b-9e66190c4c1c'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '21dec133-d114-4edd-818b-9e66190c4c1c'::uuid, 'ayiferidekiniye-beleni', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yemalikedash ("Yemalikedash")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '22d4a8e8-deee-4ca8-926d-535e201b0c43'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 1
መደበቂያዬ ነሽ በከፋኝ ጊዜ
ያመለጥኩብሽ ከሀዘን ትካዜ
ገሪዛን ድንግል የምሕረት አንባ
የደረብሽልኝ የፅድቅ ካባ

CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 2
በረከቴ ነሽ በረከቴ
የሸለመኝ ኢየሱስ አባቴ
የቱን አንስቼ የቱን ልተወው
ያደረግሽልኝ እጅግ ብዙ ነው

CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 3
ተስፋዬ ሲከስም ተስፋ የሆንሺኝ
ሰው ፊት ሲነሳኝ ፊት ያልነሳሺኝ
ያበራሺልኝ የነፍሴን ፅልመት
የፈፀምሺልኝ የልቤን ምኞት

CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 4
ኪዳነ ምህረት አንቺ እኮ ነሽ
የመኖርን ጣዕም ያየሁብሽ
ጠላት በምላሱ ሰብሮ ሲጥለኝ
ወዳጅ ያደረኩት ጀርባውን ሲሰጠኝ

CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 5
ያልተለየሺኝ በሐዘን ደስታዬ
እመ ምህረት መሸሸጊያዬ

CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yemets’nanat milkte
Yemalkedash wid enate
Kidanemhret t’laye nesh
Sintun mekera yalefkubsh

VERSE 1
Medebeqiyaye nesh bekefagn gize
Yamelet’kubsh kehezen tikaze
Gerizan Dingil yemhret anba
Yederebshlgn yets’dq kaba

CHORUS
Yemets’nanat milkte
Yemalkedash wid enate
Kidanemhret t’laye nesh
Sintun mekera yalefkubsh

VERSE 2
Berekete nesh berekete
Yeshelemegn Iyesus abate
Yetun ansche yetun litewew
Yaderegshlgn ejg bizu new

CHORUS
Yemets’nanat milkte
Yemalkedash wid enate
Kidanemhret t’laye nesh
Sintun mekera yalefkubsh

VERSE 3
Tesfaye sikesm tesfa yehonshign
Sew fit sinesagn fit yalnesashign
Yaberashilgn yenefsen ts’lmet
Yefets’emshilgn yelben mignot

CHORUS
Yemets’nanat milkte
Yemalkedash wid enate
Kidanemhret t’laye nesh
Sintun mekera yalefkubsh

VERSE 4
Kidane mihret anchi eko nesh
Yemenorn t’aem yayehubsh
T’elat bemlasu sebro sit’legn
Wedaj yaderekut jerbawn siset’egn

CHORUS
Yemets’nanat milkte
Yemalkedash wid enate
Kidanemhret t’laye nesh
Sintun mekera yalefkubsh

VERSE 5
Yalteleyeshign behezen destaye
Eme mihret mesheshegiyaye

CHORUS
Yemets’nanat milkte
Yemalkedash wid enate
Kidanemhret t’laye nesh
Sintun mekera yalefkubsh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 1
መደበቂያዬ ነሽ በከፋኝ ጊዜ
ያመለጥኩብሽ ከሀዘን ትካዜ
ገሪዛን ድንግል የምሕረት አንባ
የደረብሽልኝ የፅድቅ ካባ

CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 2
በረከቴ ነሽ በረከቴ
የሸለመኝ ኢየሱስ አባቴ
የቱን አንስቼ የቱን ልተወው
ያደረግሽልኝ እጅግ ብዙ ነው

CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 3
ተስፋዬ ሲከስም ተስፋ የሆንሺኝ
ሰው ፊት ሲነሳኝ ፊት ያልነሳሺኝ
ያበራሺልኝ የነፍሴን ፅልመት
የፈፀምሺልኝ የልቤን ምኞት

CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 4
ኪዳነ ምህረት አንቺ እኮ ነሽ
የመኖርን ጣዕም ያየሁብሽ
ጠላት በምላሱ ሰብሮ ሲጥለኝ
ወዳጅ ያደረኩት ጀርባውን ሲሰጠኝ

CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 5
ያልተለየሺኝ በሐዘን ደስታዬ
እመ ምህረት መሸሸጊያዬ

CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ',
        lyrics_transliteration = 'CHORUS
Yemets’nanat milkte
Yemalkedash wid enate
Kidanemhret t’laye nesh
Sintun mekera yalefkubsh

VERSE 1
Medebeqiyaye nesh bekefagn gize
Yamelet’kubsh kehezen tikaze
Gerizan Dingil yemhret anba
Yederebshlgn yets’dq kaba

CHORUS
Yemets’nanat milkte
Yemalkedash wid enate
Kidanemhret t’laye nesh
Sintun mekera yalefkubsh

VERSE 2
Berekete nesh berekete
Yeshelemegn Iyesus abate
Yetun ansche yetun litewew
Yaderegshlgn ejg bizu new

CHORUS
Yemets’nanat milkte
Yemalkedash wid enate
Kidanemhret t’laye nesh
Sintun mekera yalefkubsh

VERSE 3
Tesfaye sikesm tesfa yehonshign
Sew fit sinesagn fit yalnesashign
Yaberashilgn yenefsen ts’lmet
Yefets’emshilgn yelben mignot

CHORUS
Yemets’nanat milkte
Yemalkedash wid enate
Kidanemhret t’laye nesh
Sintun mekera yalefkubsh

VERSE 4
Kidane mihret anchi eko nesh
Yemenorn t’aem yayehubsh
T’elat bemlasu sebro sit’legn
Wedaj yaderekut jerbawn siset’egn

CHORUS
Yemets’nanat milkte
Yemalkedash wid enate
Kidanemhret t’laye nesh
Sintun mekera yalefkubsh

VERSE 5
Yalteleyeshign behezen destaye
Eme mihret mesheshegiyaye

CHORUS
Yemets’nanat milkte
Yemalkedash wid enate
Kidanemhret t’laye nesh
Sintun mekera yalefkubsh',
        updated_at = clock_timestamp()::text
    WHERE import_id = '22d4a8e8-deee-4ca8-926d-535e201b0c43'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 1
መደበቂያዬ ነሽ በከፋኝ ጊዜ
ያመለጥኩብሽ ከሀዘን ትካዜ
ገሪዛን ድንግል የምሕረት አንባ
የደረብሽልኝ የፅድቅ ካባ

CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 2
በረከቴ ነሽ በረከቴ
የሸለመኝ ኢየሱስ አባቴ
የቱን አንስቼ የቱን ልተወው
ያደረግሽልኝ እጅግ ብዙ ነው

CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 3
ተስፋዬ ሲከስም ተስፋ የሆንሺኝ
ሰው ፊት ሲነሳኝ ፊት ያልነሳሺኝ
ያበራሺልኝ የነፍሴን ፅልመት
የፈፀምሺልኝ የልቤን ምኞት

CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 4
ኪዳነ ምህረት አንቺ እኮ ነሽ
የመኖርን ጣዕም ያየሁብሽ
ጠላት በምላሱ ሰብሮ ሲጥለኝ
ወዳጅ ያደረኩት ጀርባውን ሲሰጠኝ

CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ

VERSE 5
ያልተለየሺኝ በሐዘን ደስታዬ
እመ ምህረት መሸሸጊያዬ

CHORUS
የመፅናናት ምልክቴ
የማልከዳሽ ውድ እናቴ
ኪዳነምህረት ጥላዬ ነሽ
ስንቱን መከራ ያለፍኩብሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '22d4a8e8-deee-4ca8-926d-535e201b0c43'::uuid, 'yemalikedash', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-1035 ("Eritrean orthodox tewahdo mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f69620e2-5b82-4652-9cce-719b9e50530b'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ሓራ ከውጽአና ሞትና ተቋዲሱ (2)',
        lyrics_transliteration = 'CHORUS
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
Hara kewts’ana motna teqwadisu (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f69620e2-5b82-4652-9cce-719b9e50530b'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f69620e2-5b82-4652-9cce-719b9e50530b'::uuid, 'eritrean-orthodox-tewahdo-mezmur-1035', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kanesagn-keafer-ketbiya-by-d-n-begna-girma ("Kanesagn keafer ketbiya by D/n Begna Girma")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '91bf5572-d7a5-404f-8e85-3601776718d1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 1
የአምበሶቹን አፍ የዘጋ
እኔን ለማዳን የተጋ
ስደተኛ ሰው ብሆንም
አልተለየኝም ልጁን

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 2
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 3
ተነዋወጠ ወይኒው
በመዝሙር ሳወድሰው
የእጄን ሰንሰለት የፈታ
ብዙ ነው ስራው የጌታ

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 4
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 5
አይቻለሁኝ እጁን
አብርቶልኛል ፊቱን
በልዑል ጥላ ስኖር
ወሰን በሌለው ፍቅር

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 6
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 7
አይቻለሁኝ እጁን
አብርቶልኛል ፊቱን
በልዑል ጥላ ስኖር
ወሰን በሌለው ፍቅር

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 8
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 1
Yeambesochun af yezega
Enen lemadan yetega
Sidetegna sew bihonm
Alteleyegnm lijun

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 2
Kebete giba memhru
Efewesalehu bet’ena
Yehywet ras medhanit
Yenefse kibir nehna

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 3
Tenewawet’e weyniw
Bemezmur sawedsew
Yeejen senselet yefeta
Bizu new siraw yegeta

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 4
Kebete giba memhru
Efewesalehu bet’ena
Yehywet ras medhanit
Yenefse kibir nehna

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 5
Aychalehugn ejun
Abrtolgnal fitun
Belul t’la sinor
Wesen belelew fiqr

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 6
Kebete giba memhru
Efewesalehu bet’ena
Yehywet ras medhanit
Yenefse kibir nehna

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 7
Aychalehugn ejun
Abrtolgnal fitun
Belul t’la sinor
Wesen belelew fiqr

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 8
Kebete giba memhru
Efewesalehu bet’ena
Yehywet ras medhanit
Yenefse kibir nehna

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 1
የአምበሶቹን አፍ የዘጋ
እኔን ለማዳን የተጋ
ስደተኛ ሰው ብሆንም
አልተለየኝም ልጁን

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 2
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 3
ተነዋወጠ ወይኒው
በመዝሙር ሳወድሰው
የእጄን ሰንሰለት የፈታ
ብዙ ነው ስራው የጌታ

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 4
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 5
አይቻለሁኝ እጁን
አብርቶልኛል ፊቱን
በልዑል ጥላ ስኖር
ወሰን በሌለው ፍቅር

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 6
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 7
አይቻለሁኝ እጁን
አብርቶልኛል ፊቱን
በልዑል ጥላ ስኖር
ወሰን በሌለው ፍቅር

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 8
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት',
        lyrics_transliteration = 'CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 1
Yeambesochun af yezega
Enen lemadan yetega
Sidetegna sew bihonm
Alteleyegnm lijun

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 2
Kebete giba memhru
Efewesalehu bet’ena
Yehywet ras medhanit
Yenefse kibir nehna

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 3
Tenewawet’e weyniw
Bemezmur sawedsew
Yeejen senselet yefeta
Bizu new siraw yegeta

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 4
Kebete giba memhru
Efewesalehu bet’ena
Yehywet ras medhanit
Yenefse kibir nehna

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 5
Aychalehugn ejun
Abrtolgnal fitun
Belul t’la sinor
Wesen belelew fiqr

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 6
Kebete giba memhru
Efewesalehu bet’ena
Yehywet ras medhanit
Yenefse kibir nehna

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 7
Aychalehugn ejun
Abrtolgnal fitun
Belul t’la sinor
Wesen belelew fiqr

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet

VERSE 8
Kebete giba memhru
Efewesalehu bet’ena
Yehywet ras medhanit
Yenefse kibir nehna

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet',
        updated_at = clock_timestamp()::text
    WHERE import_id = '91bf5572-d7a5-404f-8e85-3601776718d1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 1
የአምበሶቹን አፍ የዘጋ
እኔን ለማዳን የተጋ
ስደተኛ ሰው ብሆንም
አልተለየኝም ልጁን

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 2
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 3
ተነዋወጠ ወይኒው
በመዝሙር ሳወድሰው
የእጄን ሰንሰለት የፈታ
ብዙ ነው ስራው የጌታ

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 4
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 5
አይቻለሁኝ እጁን
አብርቶልኛል ፊቱን
በልዑል ጥላ ስኖር
ወሰን በሌለው ፍቅር

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 6
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 7
አይቻለሁኝ እጁን
አብርቶልኛል ፊቱን
በልዑል ጥላ ስኖር
ወሰን በሌለው ፍቅር

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት

VERSE 8
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '91bf5572-d7a5-404f-8e85-3601776718d1'::uuid, 'kanesagn-keafer-ketbiya-by-d-n-begna-girma', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beselam-ni ("Beselam Ni")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f6be786c-2ac1-4c16-bf5e-a275750dde1c'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ንዒ ማርያም (2)',
        lyrics_transliteration = 'CHORUS
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
Ni Mariyam (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f6be786c-2ac1-4c16-bf5e-a275750dde1c'::uuid
      AND deleted_at IS NULL
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
Ni Mariyam (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f6be786c-2ac1-4c16-bf5e-a275750dde1c'::uuid, 'beselam-ni', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ye-awaj-negari-qal ("YeAwaj Negarit Qal")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'fdd89805-bbed-4b2e-9784-6f2fa2db2f30'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 1
ምስክርነቱን ዮሐንስ አስረዳ
ልባችን ለጌታ መልካም መንገድ ይሁን

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 2
የደናግል መመኪያ የነብያት ገዳም
አውደ ዓመቱን ባርኪልኝ ድንግል ማርያም /2/

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 3
ተራራው ዝቅ ይበል ጠማማውም ይቅና
ካልተስተካከለ መንገድ የለምና

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 4
የእግዚአብሔርን መንገድ እንመስርት ሁላችን
ማረፊያ እንዲሆነን ለመጪው ሐብታችን

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 5
ክፋትና ተንኮል ከልባችን ይጥፋ
ጽድቅና ርህራሄ በእኛ ላይ ይስፋፋ

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 6
ስጋና ደምህን በክብር አግኝተናል
ሕይወት እንደሆነን አምላክ ተማጽነናል

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 7
ሁለት ልብሶች ያሉት ከማብዛት ልብሱን
ለሌለው ያድለው ሁለተኛውን

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 8
ከበደላችንም አንጻን አደራህን
በክፉ እንዳንጠፋ እኛ ልጆችህ

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 1
Miskirnetun Yohannes asreda
Libachin legeta melkam menged yihun

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 2
Ye danagil memekiya ye nebiyat gedam
Awde ametun barkilign Dingil Maryam (x2)

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 3
Teraraw zik yibel t’amamawim yiqna
Kaltestekakele menged yelemna

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 4
YeEgziabherin menged enmesirt hulachin
Marefiya endihonen lemetchiw habtachin

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 5
Kifatna tenkol kelibachin yit’fa
Tsidkna rihrahe be’enya lay yisfafa

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 6
Siga na demhin bekibir agnytenal
Hiywet endehonen Amlak tematsnenal

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 7
Hulet libsoch yalut kemabzat libswn
Lelel’ew yadilew huletengnawn

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 8
Kebedelachinm antsan aderahn
Bekifu endant’efa enya lijochih

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 1
ምስክርነቱን ዮሐንስ አስረዳ
ልባችን ለጌታ መልካም መንገድ ይሁን

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 2
የደናግል መመኪያ የነብያት ገዳም
አውደ ዓመቱን ባርኪልኝ ድንግል ማርያም /2/

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 3
ተራራው ዝቅ ይበል ጠማማውም ይቅና
ካልተስተካከለ መንገድ የለምና

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 4
የእግዚአብሔርን መንገድ እንመስርት ሁላችን
ማረፊያ እንዲሆነን ለመጪው ሐብታችን

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 5
ክፋትና ተንኮል ከልባችን ይጥፋ
ጽድቅና ርህራሄ በእኛ ላይ ይስፋፋ

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 6
ስጋና ደምህን በክብር አግኝተናል
ሕይወት እንደሆነን አምላክ ተማጽነናል

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 7
ሁለት ልብሶች ያሉት ከማብዛት ልብሱን
ለሌለው ያድለው ሁለተኛውን

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 8
ከበደላችንም አንጻን አደራህን
በክፉ እንዳንጠፋ እኛ ልጆችህ

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ',
        lyrics_transliteration = 'CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 1
Miskirnetun Yohannes asreda
Libachin legeta melkam menged yihun

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 2
Ye danagil memekiya ye nebiyat gedam
Awde ametun barkilign Dingil Maryam (x2)

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 3
Teraraw zik yibel t’amamawim yiqna
Kaltestekakele menged yelemna

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 4
YeEgziabherin menged enmesirt hulachin
Marefiya endihonen lemetchiw habtachin

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 5
Kifatna tenkol kelibachin yit’fa
Tsidkna rihrahe be’enya lay yisfafa

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 6
Siga na demhin bekibir agnytenal
Hiywet endehonen Amlak tematsnenal

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 7
Hulet libsoch yalut kemabzat libswn
Lelel’ew yadilew huletengnawn

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 8
Kebedelachinm antsan aderahn
Bekifu endant’efa enya lijochih

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'fdd89805-bbed-4b2e-9784-6f2fa2db2f30'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 1
ምስክርነቱን ዮሐንስ አስረዳ
ልባችን ለጌታ መልካም መንገድ ይሁን

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 2
የደናግል መመኪያ የነብያት ገዳም
አውደ ዓመቱን ባርኪልኝ ድንግል ማርያም /2/

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 3
ተራራው ዝቅ ይበል ጠማማውም ይቅና
ካልተስተካከለ መንገድ የለምና

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 4
የእግዚአብሔርን መንገድ እንመስርት ሁላችን
ማረፊያ እንዲሆነን ለመጪው ሐብታችን

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 5
ክፋትና ተንኮል ከልባችን ይጥፋ
ጽድቅና ርህራሄ በእኛ ላይ ይስፋፋ

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 6
ስጋና ደምህን በክብር አግኝተናል
ሕይወት እንደሆነን አምላክ ተማጽነናል

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 7
ሁለት ልብሶች ያሉት ከማብዛት ልብሱን
ለሌለው ያድለው ሁለተኛውን

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ

VERSE 8
ከበደላችንም አንጻን አደራህን
በክፉ እንዳንጠፋ እኛ ልጆችህ

CHORUS
የአዋጅ ነጋሪት ቃል በበረሃ እያለ
የእግዚአብሔር መንገድ አስተካክሉ እያለ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 1
Miskirnetun Yohannes asreda
Libachin legeta melkam menged yihun

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 2
Ye danagil memekiya ye nebiyat gedam
Awde ametun barkilign Dingil Maryam (x2)

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 3
Teraraw zik yibel t’amamawim yiqna
Kaltestekakele menged yelemna

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 4
YeEgziabherin menged enmesirt hulachin
Marefiya endihonen lemetchiw habtachin

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 5
Kifatna tenkol kelibachin yit’fa
Tsidkna rihrahe be’enya lay yisfafa

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 6
Siga na demhin bekibir agnytenal
Hiywet endehonen Amlak tematsnenal

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 7
Hulet libsoch yalut kemabzat libswn
Lelel’ew yadilew huletengnawn

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale

VERSE 8
Kebedelachinm antsan aderahn
Bekifu endant’efa enya lijochih

CHORUS
Ye awaj negarit qal beberha eyale
YeEgziabher menged astekaklu eyale';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'fdd89805-bbed-4b2e-9784-6f2fa2db2f30'::uuid, 'ye-awaj-negari-qal', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kibire-new-kibirihin-menagere-28gigilxh-q ("Kibire New Kibirihin Menagere")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2406d6dc-53ed-45e5-a93f-56a6f5688a14'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 1
አይቼ የእጅህን ታምራት
ሰምቼ የቃልህን ትምህርት
ሆኛለሁ ምስክር ለአዳኝነትህ
ሥጋን ተዋህደህ ለእኛ መገለጥህ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 2
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 3
ተከተልኩህ ሁሉን ነገር ንቄ
መድሐኒት መሆንክን አውቄ
ከመልካሟ ቤትህ ተጠልያለሁ
የእጅህን በረከት ካንተ እጠግባለሁ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 4
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 5
እርፍ ይዤ ላላርስ ወደኋላ
እያየሁ መረቤን ስትሞላ
እመካብሀለው ባንተ መድህኔ
አምላኬ ነህና የምትራራ ለእኔ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 6
አባቴ ነህና የምታስብ ለእኔ
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 7
ስጠራህ ሳመልክህ ኖራለሁ
ቸርነት ምህረት ከበዛልኝ
ለስምህ ውዳሴ ቅኔ አለኝ
ክብሬና ሞገሴ አንተ ነህ ጌታ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 8
ተመስገን ተመስገን ጠዋትና ማታ
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 9
ስጠራህ ሳመልክህ ኖራለሁ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 1
Ayche yeejhn tamrat
Semche yeqalhn timhrt
Hognalehu miskr leadagnneth
Sigan tewahdeh leegna megelet’h

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 2
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 3
Teketelkuh hulun neger niqe
Medhenit mehonkn awqe
Kemelkamwa beth tet’elyalehu
Yeejhn bereket kante et’egbalehu

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 4
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 5
Erf yizhe lalars wedehwala
Eyayehu mereben sitmola
Emekabhelew bante medhne
Amlake nehna yemtrara leene

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 6
Abate nehna yemtasb leene
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 7
Sit’erah samelkh noralehu
Chernet mihret kebezalgn
Lesmh widase qine alegn
Kibrena mogese ante neh Geta

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 8
Temesgen temesgen t’ewatna mata
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 9
Sit’erah samelkh noralehu

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 1
አይቼ የእጅህን ታምራት
ሰምቼ የቃልህን ትምህርት
ሆኛለሁ ምስክር ለአዳኝነትህ
ሥጋን ተዋህደህ ለእኛ መገለጥህ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 2
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 3
ተከተልኩህ ሁሉን ነገር ንቄ
መድሐኒት መሆንክን አውቄ
ከመልካሟ ቤትህ ተጠልያለሁ
የእጅህን በረከት ካንተ እጠግባለሁ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 4
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 5
እርፍ ይዤ ላላርስ ወደኋላ
እያየሁ መረቤን ስትሞላ
እመካብሀለው ባንተ መድህኔ
አምላኬ ነህና የምትራራ ለእኔ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 6
አባቴ ነህና የምታስብ ለእኔ
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 7
ስጠራህ ሳመልክህ ኖራለሁ
ቸርነት ምህረት ከበዛልኝ
ለስምህ ውዳሴ ቅኔ አለኝ
ክብሬና ሞገሴ አንተ ነህ ጌታ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 8
ተመስገን ተመስገን ጠዋትና ማታ
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 9
ስጠራህ ሳመልክህ ኖራለሁ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ',
        lyrics_transliteration = 'CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 1
Ayche yeejhn tamrat
Semche yeqalhn timhrt
Hognalehu miskr leadagnneth
Sigan tewahdeh leegna megelet’h

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 2
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 3
Teketelkuh hulun neger niqe
Medhenit mehonkn awqe
Kemelkamwa beth tet’elyalehu
Yeejhn bereket kante et’egbalehu

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 4
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 5
Erf yizhe lalars wedehwala
Eyayehu mereben sitmola
Emekabhelew bante medhne
Amlake nehna yemtrara leene

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 6
Abate nehna yemtasb leene
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 7
Sit’erah samelkh noralehu
Chernet mihret kebezalgn
Lesmh widase qine alegn
Kibrena mogese ante neh Geta

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 8
Temesgen temesgen t’ewatna mata
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu

VERSE 9
Sit’erah samelkh noralehu

CHORUS
Kibre new kibrhn menagere
Ts’dqe new fiqrhn memeskere
Getaye amlake elhelew
Sit’erah samelkh noralehu',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2406d6dc-53ed-45e5-a93f-56a6f5688a14'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 1
አይቼ የእጅህን ታምራት
ሰምቼ የቃልህን ትምህርት
ሆኛለሁ ምስክር ለአዳኝነትህ
ሥጋን ተዋህደህ ለእኛ መገለጥህ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 2
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 3
ተከተልኩህ ሁሉን ነገር ንቄ
መድሐኒት መሆንክን አውቄ
ከመልካሟ ቤትህ ተጠልያለሁ
የእጅህን በረከት ካንተ እጠግባለሁ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 4
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 5
እርፍ ይዤ ላላርስ ወደኋላ
እያየሁ መረቤን ስትሞላ
እመካብሀለው ባንተ መድህኔ
አምላኬ ነህና የምትራራ ለእኔ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 6
አባቴ ነህና የምታስብ ለእኔ
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 7
ስጠራህ ሳመልክህ ኖራለሁ
ቸርነት ምህረት ከበዛልኝ
ለስምህ ውዳሴ ቅኔ አለኝ
ክብሬና ሞገሴ አንተ ነህ ጌታ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 8
ተመስገን ተመስገን ጠዋትና ማታ
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ

VERSE 9
ስጠራህ ሳመልክህ ኖራለሁ

CHORUS
ክብሬ ነው ክብርህን መናገሬ
ጽድቄ ነው ፍቅርህን መመስከሬ
ጌታዬ አምላኬ እልሀለው
ስጠራህ ሳመልክህ ኖራለሁ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2406d6dc-53ed-45e5-a93f-56a6f5688a14'::uuid, 'kibire-new-kibirihin-menagere-28gigilxh-q', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ethiopia-like-zemariyan-yilma-haylu-ethiopia-orthodox-tewahdo-mezmur ("Ethiopia_like zemariyan yilma haylu ethiopia orthodox tewahdo mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '24f3057c-0c0d-4914-a9ff-e602bd2acf89'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ይቅር ብለኸኝ ባሸፋፍነው',
        lyrics_transliteration = 'CHORUS
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
Yiqr bileኸgn bashefafnew',
        updated_at = clock_timestamp()::text
    WHERE import_id = '24f3057c-0c0d-4914-a9ff-e602bd2acf89'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '24f3057c-0c0d-4914-a9ff-e602bd2acf89'::uuid, 'ethiopia-like-zemariyan-yilma-haylu-ethiopia-orthodox-tewahdo-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
