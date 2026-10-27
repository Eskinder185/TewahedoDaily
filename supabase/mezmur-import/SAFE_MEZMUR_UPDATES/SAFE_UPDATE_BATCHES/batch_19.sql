-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 19 OF 32
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
  -- nitsum-tsoma ("Nitsum Tsoma")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '15bb95c2-fa34-406c-b0e8-29a12f6d169c'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ንትፋቀር በበይናቲነ',
        lyrics_transliteration = 'CHORUS
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
Nitfaker bebeynatine',
        updated_at = clock_timestamp()::text
    WHERE import_id = '15bb95c2-fa34-406c-b0e8-29a12f6d169c'::uuid
      AND deleted_at IS NULL
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
Nitfaker bebeynatine';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '15bb95c2-fa34-406c-b0e8-29a12f6d169c'::uuid, 'nitsum-tsoma', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yebirihan-dej-nat ("Yebirihan Dej Nat")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c89328de-d3aa-4e9e-a634-9dabfcfeda3c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የብርሃን ደጅ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽም ሰላምሽም ድህነትም ይሁነን ኦኦ
ፍጥረት በሙሉ በሙሉ ፊትሽ ይወድቃሉ

VERSE 1
ፀጋሽ ይድረሰን ይድረሰን ይሰጠን እያሉ
የኔ ልብ ምን ፅድቅ አለው አንቺን ለማስተናገድ
የኀጢአት ጎተራ ነው የተሞላ በስስት
ኧረ እንዴት ኧረ እንዴት ድንግል ትኑርበት ኦኦ

CHORUS
የብርሃን ደጅ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽም ሰላምሽም ድህነትም ይሁነን ኦኦ
ፍጥረት በሙሉ በሙሉ ፊትሽ ይወድቃሉ

VERSE 2
አትፀየፍም የኔን ልብ ታሰናዳዋለች
ስለ ኀጥያቴ የእኔ እናት ምልጃ ታቀርባለች
/አዝ
ልባቸውን የዘጉ ድንግልን ለማስገባት

CHORUS
የብርሃን ደጅ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽም ሰላምሽም ድህነትም ይሁነን ኦኦ
ፍጥረት በሙሉ በሙሉ ፊትሽ ይወድቃሉ

VERSE 3
ሕሊናቸው ይመለስ እንፀልይ ለዚህ ጥፋት
አምላክን ይዛ ነው ድንግል የምትመጣው ኦኦ
እርሷን ስንመልስ ጌታን ነው የምናስቀይመው❨፪×❩

CHORUS
የብርሃን ደጅ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽም ሰላምሽም ድህነትም ይሁነን ኦኦ
ፍጥረት በሙሉ በሙሉ ፊትሽ ይወድቃሉ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yebrhan dej nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshm selamshm dihnetm yihunen oo
Fit’ret bemulu bemulu fitsh yiwedqalu

VERSE 1
Ts’egash yidresen yidresen yiset’en eyalu
Yene lib min ts’dq alew anchin lemastenaged
Yehet’iat gotera new yetemola besst
ኧre endet ኧre endet Dingil tinurbet oo

CHORUS
Yebrhan dej nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshm selamshm dihnetm yihunen oo
Fit’ret bemulu bemulu fitsh yiwedqalu

VERSE 2
Atts’eyefm yenen lib tasenadawalech
Sile het’yate yeene enat milja taqerbalech
/az
Libachewn yezegu dingln lemasgebat

CHORUS
Yebrhan dej nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshm selamshm dihnetm yihunen oo
Fit’ret bemulu bemulu fitsh yiwedqalu

VERSE 3
Hilinachew yimeles ents’ely lezih t’fat
Amlakn yiza new Dingil yemtmet’aw oo
Erswan sinmels getan new yemnasqeymew❨2×❩

CHORUS
Yebrhan dej nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshm selamshm dihnetm yihunen oo
Fit’ret bemulu bemulu fitsh yiwedqalu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የብርሃን ደጅ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽም ሰላምሽም ድህነትም ይሁነን ኦኦ
ፍጥረት በሙሉ በሙሉ ፊትሽ ይወድቃሉ

VERSE 1
ፀጋሽ ይድረሰን ይድረሰን ይሰጠን እያሉ
የኔ ልብ ምን ፅድቅ አለው አንቺን ለማስተናገድ
የኀጢአት ጎተራ ነው የተሞላ በስስት
ኧረ እንዴት ኧረ እንዴት ድንግል ትኑርበት ኦኦ

CHORUS
የብርሃን ደጅ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽም ሰላምሽም ድህነትም ይሁነን ኦኦ
ፍጥረት በሙሉ በሙሉ ፊትሽ ይወድቃሉ

VERSE 2
አትፀየፍም የኔን ልብ ታሰናዳዋለች
ስለ ኀጥያቴ የእኔ እናት ምልጃ ታቀርባለች
/አዝ
ልባቸውን የዘጉ ድንግልን ለማስገባት

CHORUS
የብርሃን ደጅ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽም ሰላምሽም ድህነትም ይሁነን ኦኦ
ፍጥረት በሙሉ በሙሉ ፊትሽ ይወድቃሉ

VERSE 3
ሕሊናቸው ይመለስ እንፀልይ ለዚህ ጥፋት
አምላክን ይዛ ነው ድንግል የምትመጣው ኦኦ
እርሷን ስንመልስ ጌታን ነው የምናስቀይመው❨፪×❩

CHORUS
የብርሃን ደጅ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽም ሰላምሽም ድህነትም ይሁነን ኦኦ
ፍጥረት በሙሉ በሙሉ ፊትሽ ይወድቃሉ',
        lyrics_transliteration = 'CHORUS
Yebrhan dej nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshm selamshm dihnetm yihunen oo
Fit’ret bemulu bemulu fitsh yiwedqalu

VERSE 1
Ts’egash yidresen yidresen yiset’en eyalu
Yene lib min ts’dq alew anchin lemastenaged
Yehet’iat gotera new yetemola besst
ኧre endet ኧre endet Dingil tinurbet oo

CHORUS
Yebrhan dej nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshm selamshm dihnetm yihunen oo
Fit’ret bemulu bemulu fitsh yiwedqalu

VERSE 2
Atts’eyefm yenen lib tasenadawalech
Sile het’yate yeene enat milja taqerbalech
/az
Libachewn yezegu dingln lemasgebat

CHORUS
Yebrhan dej nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshm selamshm dihnetm yihunen oo
Fit’ret bemulu bemulu fitsh yiwedqalu

VERSE 3
Hilinachew yimeles ents’ely lezih t’fat
Amlakn yiza new Dingil yemtmet’aw oo
Erswan sinmels getan new yemnasqeymew❨2×❩

CHORUS
Yebrhan dej nat Dingil enatachn
Kesemay eyaberach des alew libachn
Fiqrshm selamshm dihnetm yihunen oo
Fit’ret bemulu bemulu fitsh yiwedqalu',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c89328de-d3aa-4e9e-a634-9dabfcfeda3c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የብርሃን ደጅ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽም ሰላምሽም ድህነትም ይሁነን ኦኦ
ፍጥረት በሙሉ በሙሉ ፊትሽ ይወድቃሉ
ፀጋሽ ይድረሰን ይድረሰን ይሰጠን እያሉ
የኔ ልብ ምን ፅድቅ አለው አንቺን ለማስተናገድ
የኀጢአት ጎተራ ነው የተሞላ በስስት
ኧረ እንዴት ኧረ እንዴት ድንግል ትኑርበት ኦኦ
አትፀየፍም የኔን ልብ ታሰናዳዋለች
ስለ ኀጥያቴ የእኔ እናት ምልጃ ታቀርባለች
/አዝ = = = = =
ልባቸውን የዘጉ ድንግልን ለማስገባት
ሕሊናቸው ይመለስ እንፀልይ ለዚህ ጥፋት
አምላክን ይዛ ነው ድንግል የምትመጣው ኦኦ
እርሷን ስንመልስ ጌታን ነው የምናስቀይመው❨፪×❩

VERSE 1
የብርሃን ደጅ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽም ሰላምሽም ድህነትም ይሁነን ኦኦ
ፍጥረት በሙሉ በሙሉ ፊትሽ ይወድቃሉ
ፀጋሽ ይድረሰን ይድረሰን ይሰጠን እያሉ
የኔ ልብ ምን ፅድቅ አለው አንቺን ለማስተናገድ
የኀጢአት ጎተራ ነው የተሞላ በስስት
ኧረ እንዴት ኧረ እንዴት ድንግል ትኑርበት ኦኦ
አትፀየፍም የኔን ልብ ታሰናዳዋለች
ስለ ኀጥያቴ የእኔ እናት ምልጃ ታቀርባለች
/አዝ = = = = =
ልባቸውን የዘጉ ድንግልን ለማስገባት
ሕሊናቸው ይመለስ እንፀልይ ለዚህ ጥፋት
አምላክን ይዛ ነው ድንግል የምትመጣው ኦኦ
እርሷን ስንመልስ ጌታን ነው የምናስቀይመው❨፪×❩

CHORUS
የብርሃን ደጅ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽም ሰላምሽም ድህነትም ይሁነን ኦኦ
ፍጥረት በሙሉ በሙሉ ፊትሽ ይወድቃሉ
ፀጋሽ ይድረሰን ይድረሰን ይሰጠን እያሉ
የኔ ልብ ምን ፅድቅ አለው አንቺን ለማስተናገድ
የኀጢአት ጎተራ ነው የተሞላ በስስት
ኧረ እንዴት ኧረ እንዴት ድንግል ትኑርበት ኦኦ
አትፀየፍም የኔን ልብ ታሰናዳዋለች
ስለ ኀጥያቴ የእኔ እናት ምልጃ ታቀርባለች
/አዝ = = = = =
ልባቸውን የዘጉ ድንግልን ለማስገባት
ሕሊናቸው ይመለስ እንፀልይ ለዚህ ጥፋት
አምላክን ይዛ ነው ድንግል የምትመጣው ኦኦ
እርሷን ስንመልስ ጌታን ነው የምናስቀይመው❨፪×❩'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c89328de-d3aa-4e9e-a634-9dabfcfeda3c'::uuid, 'yebirihan-dej-nat', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- aklile-nesh ("Aklile Nesh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0f249ce7-e9c5-4ed4-8f47-04f2fae36a4a'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ያዕቆብም ብሕልሙ መሰላሉን ዓይቷል',
        lyrics_transliteration = 'CHORUS
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
Yaeqobm bihlmu meselalun aytwal',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0f249ce7-e9c5-4ed4-8f47-04f2fae36a4a'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0f249ce7-e9c5-4ed4-8f47-04f2fae36a4a'::uuid, 'aklile-nesh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- getaye-ayitlegnim ("GETAYE AYITLEGNIM")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd1cd0b04-d9d8-4fd2-8efd-c8e01bddd660'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
አልፈራም አልደነግጥ ጌታ አይጥለኝም',
        lyrics_transliteration = 'CHORUS
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
Alferam aldenegt’ Geta ayt’legnm',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd1cd0b04-d9d8-4fd2-8efd-c8e01bddd660'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd1cd0b04-d9d8-4fd2-8efd-c8e01bddd660'::uuid, 'getaye-ayitlegnim', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tamemu-hager-betekirisitiyan ("Tamemu Hager Betekirisitiyan")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8d7db907-b2bc-49eb-b3c1-1cbccfec1f6a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 1
"ከሃገር ማን እንደኛ" ዋኔን፥
እንል ነበር ኮርተን ዋኔን፥
ከሰውነት ጠለል ዋኔን፥
በታች ማን ከተተን ዋኔን።

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 2
አበው "ሰው ሃገሩ"፥
እንዲሉ "ምግባሩ"፥
አይደለም አፈሩ፥
ጋራ ሸንተረሩ፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 3
ሕዝቦች ተፋቀሩ።
ጥል በተገደለበት ማኅተም፥
ጥል ነጋሪት ሲጎሰም፥
ሰው ታረደ እንደ በግ ዋኔን፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 4
ተብሎ በስማም ዋኔን።
ተጋበዘ ሰናክሬም፥
ሕዝቅያሳችን የለም፥
ከጠላት ንክሻ የሚያም፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 5
ሲከዳ ወዳጅ በመሳም።
ግራ ነው ግራ ነው፥
ግራ ነው ግራ ነው፥
የገዛ ማኅፀኗን ወላድ ወጋች ምነው፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 6
ግራ ነው ግራ ነው።
በግፍ መሠረት ላይ ዋኔን፥
የለም መደላደል ዋኔን፥
ይቆጨን ይንደደን ዋኔን፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 7
የሠራነው በደል ዋኔን።
አንድ ሆነን እናልቅስ ዋኔን፥
እንደ ነነዌ ሰው ዋኔን፥
የእሳት የዲኑን ዶፍ ዋኔን፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 8
ፈጥኖ እንዲመልሰው ዋኔን።
በየጓዳው ምትፈስ የኃጢአት ጠብታ፥
ጎርፍ ሆና ሳትወስደን ደራሽ ሆና መጥታ፥
እንቅረብ ከጌታ።

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 1
"kehager man endegna" wanen:
Enl neber korten wanen:
Kesewnet t’elel wanen:
Betach man keteten wanen.

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 2
Abew "sew hageru":
Endilu "migbaru":
Aydelem aferu:
Gara shentereru:

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 3
Hizboch tefaqeru.
T’l betegedelebet mahtem:
T’l negarit sigosem:
Sew tarede ende beg wanen:

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 4
Teblo besmam wanen.
Tegabeze senakrem:
Hizqyasachn yelem:
Ket’elat niksha yemiyam:

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 5
Sikeda wedaj bemesam.
Gira new gira new:
Gira new gira new:
Yegeza mahts’enwan welad wegach minew:

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 6
Gira new gira new.
Begf meseret lay wanen:
Yelem medeladel wanen:
Yiqoch’en yindeden wanen:

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 7
Yeseranew bedel wanen.
And honen enalqs wanen:
Ende nenewe sew wanen:
Yeesat yedinun dof wanen:

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 8
Fet’no endimelsew wanen.
Beyegwadaw mitfes yehat’iat t’ebta:
Gorf hona satwesden derash hona met’ta:
Enqreb kegeta.

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 1
"ከሃገር ማን እንደኛ" ዋኔን፥
እንል ነበር ኮርተን ዋኔን፥
ከሰውነት ጠለል ዋኔን፥
በታች ማን ከተተን ዋኔን።

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 2
አበው "ሰው ሃገሩ"፥
እንዲሉ "ምግባሩ"፥
አይደለም አፈሩ፥
ጋራ ሸንተረሩ፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 3
ሕዝቦች ተፋቀሩ።
ጥል በተገደለበት ማኅተም፥
ጥል ነጋሪት ሲጎሰም፥
ሰው ታረደ እንደ በግ ዋኔን፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 4
ተብሎ በስማም ዋኔን።
ተጋበዘ ሰናክሬም፥
ሕዝቅያሳችን የለም፥
ከጠላት ንክሻ የሚያም፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 5
ሲከዳ ወዳጅ በመሳም።
ግራ ነው ግራ ነው፥
ግራ ነው ግራ ነው፥
የገዛ ማኅፀኗን ወላድ ወጋች ምነው፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 6
ግራ ነው ግራ ነው።
በግፍ መሠረት ላይ ዋኔን፥
የለም መደላደል ዋኔን፥
ይቆጨን ይንደደን ዋኔን፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 7
የሠራነው በደል ዋኔን።
አንድ ሆነን እናልቅስ ዋኔን፥
እንደ ነነዌ ሰው ዋኔን፥
የእሳት የዲኑን ዶፍ ዋኔን፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 8
ፈጥኖ እንዲመልሰው ዋኔን።
በየጓዳው ምትፈስ የኃጢአት ጠብታ፥
ጎርፍ ሆና ሳትወስደን ደራሽ ሆና መጥታ፥
እንቅረብ ከጌታ።

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።',
        lyrics_transliteration = 'CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 1
"kehager man endegna" wanen:
Enl neber korten wanen:
Kesewnet t’elel wanen:
Betach man keteten wanen.

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 2
Abew "sew hageru":
Endilu "migbaru":
Aydelem aferu:
Gara shentereru:

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 3
Hizboch tefaqeru.
T’l betegedelebet mahtem:
T’l negarit sigosem:
Sew tarede ende beg wanen:

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 4
Teblo besmam wanen.
Tegabeze senakrem:
Hizqyasachn yelem:
Ket’elat niksha yemiyam:

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 5
Sikeda wedaj bemesam.
Gira new gira new:
Gira new gira new:
Yegeza mahts’enwan welad wegach minew:

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 6
Gira new gira new.
Begf meseret lay wanen:
Yelem medeladel wanen:
Yiqoch’en yindeden wanen:

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 7
Yeseranew bedel wanen.
And honen enalqs wanen:
Ende nenewe sew wanen:
Yeesat yedinun dof wanen:

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.

VERSE 8
Fet’no endimelsew wanen.
Beyegwadaw mitfes yehat’iat t’ebta:
Gorf hona satwesden derash hona met’ta:
Enqreb kegeta.

CHORUS
Ermyas tet’eyeq wanen:
Tinbith godele wanen:
Yenebr zhngurgur endale:
Yeityop’yawi melku qelele.',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8d7db907-b2bc-49eb-b3c1-1cbccfec1f6a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 1
"ከሃገር ማን እንደኛ" ዋኔን፥
እንል ነበር ኮርተን ዋኔን፥
ከሰውነት ጠለል ዋኔን፥
በታች ማን ከተተን ዋኔን።

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 2
አበው "ሰው ሃገሩ"፥
እንዲሉ "ምግባሩ"፥
አይደለም አፈሩ፥
ጋራ ሸንተረሩ፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 3
ሕዝቦች ተፋቀሩ።
ጥል በተገደለበት ማኅተም፥
ጥል ነጋሪት ሲጎሰም፥
ሰው ታረደ እንደ በግ ዋኔን፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 4
ተብሎ በስማም ዋኔን።
ተጋበዘ ሰናክሬም፥
ሕዝቅያሳችን የለም፥
ከጠላት ንክሻ የሚያም፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 5
ሲከዳ ወዳጅ በመሳም።
ግራ ነው ግራ ነው፥
ግራ ነው ግራ ነው፥
የገዛ ማኅፀኗን ወላድ ወጋች ምነው፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 6
ግራ ነው ግራ ነው።
በግፍ መሠረት ላይ ዋኔን፥
የለም መደላደል ዋኔን፥
ይቆጨን ይንደደን ዋኔን፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 7
የሠራነው በደል ዋኔን።
አንድ ሆነን እናልቅስ ዋኔን፥
እንደ ነነዌ ሰው ዋኔን፥
የእሳት የዲኑን ዶፍ ዋኔን፥

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።

VERSE 8
ፈጥኖ እንዲመልሰው ዋኔን።
በየጓዳው ምትፈስ የኃጢአት ጠብታ፥
ጎርፍ ሆና ሳትወስደን ደራሽ ሆና መጥታ፥
እንቅረብ ከጌታ።

CHORUS
ኤርምያስ ተጠየቅ ዋኔን፥
ትንቢትህ ጎደለ ዋኔን፥
የነብር ዥንጉርጉር እንዳለ፥
የኢትዮጵያዊ መልኩ ቀለለ።'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8d7db907-b2bc-49eb-b3c1-1cbccfec1f6a'::uuid, 'tamemu-hager-betekirisitiyan', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- d-mindaye-birhanu ("D.MINDAYE BIRHANU")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ae83f6ef-d13a-4f33-ab7e-8751ee981bec'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ሊረዳኝ መጣ ኃያል ሚካኤል',
        lyrics_transliteration = 'CHORUS
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
Liredagn met’a hayal Mikael',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ae83f6ef-d13a-4f33-ab7e-8751ee981bec'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ae83f6ef-d13a-4f33-ab7e-8751ee981bec'::uuid, 'd-mindaye-birhanu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ye-birhan-gorf-nat ("YeBirhan Gorf Nat")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '12a9f89b-bca9-47c5-9c88-250b544ac1ae'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 1
ፍጥረት በሙሉ/2/ ፊትሽ ይወድቃሉ
ጸጋሽ ይድረሰን/2/ ይስጠን እያሉ

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 2
የኔ ልብ ምን ፅድቅ አለው አንቺን ለማስተናገድ
የሃጢያት ጎተራ ነው የተሞላ በስስት
ኧረ እንዴት/2/ ድንግል ትኑርበት

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 3
አትፀየፍም የኔን ልብ ታሰናዳዋለች
ስለሃጢያቴ የኔ እናት ምልጃ ታቀርባለች

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 4
ልባቸውን የዘጉ ድንግልን ለማስገባት
ህሊናቸው ይመለስ እንጸልይ ለዚህ ጥፋት

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 5
አምላክን ይዛ ነው የምትመጣው
እርሷን ስንመልስ ጌታን ነው የምናስቀይመው

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 1
Fit’ret bemulu (x2) fitish yiwedikalu
Tsegash yidiresen (x2) yiset’en eyalu

CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 2
Yene lib min ts’idik alew anchin lemastenaged
Ye hat’iyat gotera new yetemola besist
Ere endet (x2) dingil tinurbat

CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 3
At’tseyefim yenen lib tasenadawalech
Sile hat’iyate yene enat milija take’raletch

CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 4
Libachewn yezegu dingiln lemasgeba
Hilinaachew yimeles entseliy lezih t’ifat

CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 5
Amlakn yiza new yemitemet’aw
Ershuan sinemelis getan new yeminaskeymew

CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 1
ፍጥረት በሙሉ/2/ ፊትሽ ይወድቃሉ
ጸጋሽ ይድረሰን/2/ ይስጠን እያሉ

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 2
የኔ ልብ ምን ፅድቅ አለው አንቺን ለማስተናገድ
የሃጢያት ጎተራ ነው የተሞላ በስስት
ኧረ እንዴት/2/ ድንግል ትኑርበት

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 3
አትፀየፍም የኔን ልብ ታሰናዳዋለች
ስለሃጢያቴ የኔ እናት ምልጃ ታቀርባለች

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 4
ልባቸውን የዘጉ ድንግልን ለማስገባት
ህሊናቸው ይመለስ እንጸልይ ለዚህ ጥፋት

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 5
አምላክን ይዛ ነው የምትመጣው
እርሷን ስንመልስ ጌታን ነው የምናስቀይመው

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን',
        lyrics_transliteration = 'CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 1
Fit’ret bemulu (x2) fitish yiwedikalu
Tsegash yidiresen (x2) yiset’en eyalu

CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 2
Yene lib min ts’idik alew anchin lemastenaged
Ye hat’iyat gotera new yetemola besist
Ere endet (x2) dingil tinurbat

CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 3
At’tseyefim yenen lib tasenadawalech
Sile hat’iyate yene enat milija take’raletch

CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 4
Libachewn yezegu dingiln lemasgeba
Hilinaachew yimeles entseliy lezih t’ifat

CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 5
Amlakn yiza new yemitemet’aw
Ershuan sinemelis getan new yeminaskeymew

CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen',
        updated_at = clock_timestamp()::text
    WHERE import_id = '12a9f89b-bca9-47c5-9c88-250b544ac1ae'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 1
ፍጥረት በሙሉ/2/ ፊትሽ ይወድቃሉ
ጸጋሽ ይድረሰን/2/ ይስጠን እያሉ

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 2
የኔ ልብ ምን ፅድቅ አለው አንቺን ለማስተናገድ
የሃጢያት ጎተራ ነው የተሞላ በስስት
ኧረ እንዴት/2/ ድንግል ትኑርበት

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 3
አትፀየፍም የኔን ልብ ታሰናዳዋለች
ስለሃጢያቴ የኔ እናት ምልጃ ታቀርባለች

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 4
ልባቸውን የዘጉ ድንግልን ለማስገባት
ህሊናቸው ይመለስ እንጸልይ ለዚህ ጥፋት

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን

VERSE 5
አምላክን ይዛ ነው የምትመጣው
እርሷን ስንመልስ ጌታን ነው የምናስቀይመው

CHORUS
የብርሃን ጎርፍ ናት ድንግል እናታችን
ከሰማይ እያበራች ደስ አለው ልባችን
ፍቅርሽን ሰላምሽን ድህነት ይሁነን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 1
Fit’ret bemulu (x2) fitish yiwedikalu
Tsegash yidiresen (x2) yiset’en eyalu

CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 2
Yene lib min ts’idik alew anchin lemastenaged
Ye hat’iyat gotera new yetemola besist
Ere endet (x2) dingil tinurbat

CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 3
At’tseyefim yenen lib tasenadawalech
Sile hat’iyate yene enat milija take’raletch

CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 4
Libachewn yezegu dingiln lemasgeba
Hilinaachew yimeles entseliy lezih t’ifat

CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen

VERSE 5
Amlakn yiza new yemitemet’aw
Ershuan sinemelis getan new yeminaskeymew

CHORUS
Ye birhan gorf nat dingil enatachin
Kesemay eyabirach des alew libachin
Fiqirishin selamishin dihinet yihunen';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '12a9f89b-bca9-47c5-9c88-250b544ac1ae'::uuid, 'ye-birhan-gorf-nat', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ethiopia-4021 ("Ethiopia")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a07630e7-1f55-4f16-b87c-c5e44b265cbc'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
በሥላሴ ስምም ጠላቴን ድል እነሳዋለሁ።"',
        lyrics_transliteration = 'CHORUS
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
Beslase simm t’elaten dil enesawalehu."',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a07630e7-1f55-4f16-b87c-c5e44b265cbc'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a07630e7-1f55-4f16-b87c-c5e44b265cbc'::uuid, 'ethiopia-4021', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kidanki-kone ("Kidanki Kone")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '12dcded7-ba49-498b-9b62-3559752e17e2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳንኪ ኮነ (3)
ለኃጥአን ተስፋነ ኪዳንኪ ኮነ
ለኃጥአን ቤዛነ ኪዳንኪ ኮነ (2)

VERSE 1
ኪዳንኪ ኮነ (3)
ለኃጥአን ተስፋነ ኪዳንኪ ኮነ
ለኃጥአን ቤዛነ ኪዳንኪ ኮነ (2)

CHORUS
ኪዳንኪ ኮነ (3)
ለኃጥአን ተስፋነ ኪዳንኪ ኮነ
ለኃጥአን ቤዛነ ኪዳንኪ ኮነ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kidanki kone (3)
Lehatan tesfane kidanki kone
Lehatan bezane kidanki kone (2)

VERSE 1
Kidanki kone (3)
Lehatan tesfane kidanki kone
Lehatan bezane kidanki kone (2)

CHORUS
Kidanki kone (3)
Lehatan tesfane kidanki kone
Lehatan bezane kidanki kone (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኪዳንኪ ኮነ (3)
ለኃጥአን ተስፋነ ኪዳንኪ ኮነ
ለኃጥአን ቤዛነ ኪዳንኪ ኮነ (2)

VERSE 1
ኪዳንኪ ኮነ (3)
ለኃጥአን ተስፋነ ኪዳንኪ ኮነ
ለኃጥአን ቤዛነ ኪዳንኪ ኮነ (2)

CHORUS
ኪዳንኪ ኮነ (3)
ለኃጥአን ተስፋነ ኪዳንኪ ኮነ
ለኃጥአን ቤዛነ ኪዳንኪ ኮነ (2)',
        lyrics_transliteration = 'CHORUS
Kidanki kone (3)
Lehatan tesfane kidanki kone
Lehatan bezane kidanki kone (2)

VERSE 1
Kidanki kone (3)
Lehatan tesfane kidanki kone
Lehatan bezane kidanki kone (2)

CHORUS
Kidanki kone (3)
Lehatan tesfane kidanki kone
Lehatan bezane kidanki kone (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '12dcded7-ba49-498b-9b62-3559752e17e2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳንኪ ኮነ (3)
ለኃጥአን ተስፋነ ኪዳንኪ ኮነ
ለኃጥአን ቤዛነ ኪዳንኪ ኮነ (2)

VERSE 1
ኪዳንኪ ኮነ (3)
ለኃጥአን ተስፋነ ኪዳንኪ ኮነ
ለኃጥአን ቤዛነ ኪዳንኪ ኮነ (2)

CHORUS
ኪዳንኪ ኮነ (3)
ለኃጥአን ተስፋነ ኪዳንኪ ኮነ
ለኃጥአን ቤዛነ ኪዳንኪ ኮነ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kidanki kone (3)
Lehatan tesfane kidanki kone
Lehatan bezane kidanki kone (2)

VERSE 1
Kidanki kone (3)
Lehatan tesfane kidanki kone
Lehatan bezane kidanki kone (2)

CHORUS
Kidanki kone (3)
Lehatan tesfane kidanki kone
Lehatan bezane kidanki kone (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '12dcded7-ba49-498b-9b62-3559752e17e2'::uuid, 'kidanki-kone', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- belibe-ketema-temelalesibet ("Belibe Ketema Temelalesibet")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd547b3a2-f0f7-4b3b-b7fd-862ca796ab63'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
የየሱስ ክርስቶስ',
        lyrics_transliteration = 'CHORUS
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
Yeyesus Kristos',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd547b3a2-f0f7-4b3b-b7fd-862ca796ab63'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd547b3a2-f0f7-4b3b-b7fd-862ca796ab63'::uuid, 'belibe-ketema-temelalesibet', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- agatami-ayidelem ("Agatami Ayidelem")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8f12c1b5-7736-416d-93ce-829e2b6f357b'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
የረዳኝ ጌታ ነዉ ዉዴ የተከተለ',
        lyrics_transliteration = 'CHORUS
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
Yeredagn Geta newu wude yeteketele',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8f12c1b5-7736-416d-93ce-829e2b6f357b'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8f12c1b5-7736-416d-93ce-829e2b6f357b'::uuid, 'agatami-ayidelem', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- emebetachin-banchi-milja-bemaye-qana ("Emebetachin Banchi Milja")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1861059f-6c03-413b-b7fb-bf54efd83b50'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 1
ለጌታችን ተዓምር በማየ ቃና
ተመርጣ ታድላ በማየ ቃና
መጀመሪያ ሆነች በማየ ቃና
ቃና ዘገሊላ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 2
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 3
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 4
ታውቋት ስላለችው በማየ ቃና
ወይንኬ አልቦሙ በማየ ቃና
ውሃ ወይን ሲሆን በማየ ቃና
ሁሉ አዩ ሰሙ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 5
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 6
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 7
አሳላፊዎቹ በማየ ቃና
ግራ ቢገባቸው በማየ ቃና
የድንግል ማርያም ልጅ በማየ ቃና
ከጭንቅ አወጣቸው በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 8
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 9
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 10
እኛም እናምናለን በማየ ቃና
በእርሷ ትንብልና በማየ ቃና
ስለ ቃልኪዳኗ በማየ ቃና
ሁሉ እንደሚቀና በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 11
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 12
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 1
legetachn teamr bemaye qana
temerta tadla bemaye qana
mejemeriya honech bemaye qana

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 2
qana zegelila bemaye qana
qanan liyadergat yetamru qedami sfra
yednglm kbr tegelete yemlja sra

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 3
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 4
tawt slalechw bemaye qana
weynke elbomu bemaye qana
wha weyn sihon bemaye qana

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 5
hulu eyu semu bemaye qana
qanan liyadergat yetamru qedami sfra
yednglm kbr tegelete yemlja sra

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 6
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 7
esalafiwochu bemaye qana
gra bigebachew bemaye qana
yedngl maryam lj bemaye qana

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 8
kechnq ewetachew bemaye qana
qanan liyadergat yetamru qedami sfra
yednglm kbr tegelete yemlja sra

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 9
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 10
nyam namnalen bemaye qana
ber tnblna bemaye qana
sle qalkida bemaye qana

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 11
hulu ndemiqena bemaye qana
qanan liyadergat yetamru qedami sfra
yednglm kbr tegelete yemlja sra

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 12
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 1
ለጌታችን ተዓምር በማየ ቃና
ተመርጣ ታድላ በማየ ቃና
መጀመሪያ ሆነች በማየ ቃና
ቃና ዘገሊላ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 2
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 3
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 4
ታውቋት ስላለችው በማየ ቃና
ወይንኬ አልቦሙ በማየ ቃና
ውሃ ወይን ሲሆን በማየ ቃና
ሁሉ አዩ ሰሙ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 5
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 6
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 7
አሳላፊዎቹ በማየ ቃና
ግራ ቢገባቸው በማየ ቃና
የድንግል ማርያም ልጅ በማየ ቃና
ከጭንቅ አወጣቸው በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 8
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 9
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 10
እኛም እናምናለን በማየ ቃና
በእርሷ ትንብልና በማየ ቃና
ስለ ቃልኪዳኗ በማየ ቃና
ሁሉ እንደሚቀና በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 11
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 12
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2',
        lyrics_transliteration = 'CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 1
legetachn teamr bemaye qana
temerta tadla bemaye qana
mejemeriya honech bemaye qana

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 2
qana zegelila bemaye qana
qanan liyadergat yetamru qedami sfra
yednglm kbr tegelete yemlja sra

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 3
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 4
tawt slalechw bemaye qana
weynke elbomu bemaye qana
wha weyn sihon bemaye qana

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 5
hulu eyu semu bemaye qana
qanan liyadergat yetamru qedami sfra
yednglm kbr tegelete yemlja sra

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 6
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 7
esalafiwochu bemaye qana
gra bigebachew bemaye qana
yedngl maryam lj bemaye qana

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 8
kechnq ewetachew bemaye qana
qanan liyadergat yetamru qedami sfra
yednglm kbr tegelete yemlja sra

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 9
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 10
nyam namnalen bemaye qana
ber tnblna bemaye qana
sle qalkida bemaye qana

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 11
hulu ndemiqena bemaye qana
qanan liyadergat yetamru qedami sfra
yednglm kbr tegelete yemlja sra

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 12
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1861059f-6c03-413b-b7fb-bf54efd83b50'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 1
ለጌታችን ተዓምር በማየ ቃና
ተመርጣ ታድላ በማየ ቃና
መጀመሪያ ሆነች በማየ ቃና
ቃና ዘገሊላ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 2
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 3
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 4
ታውቋት ስላለችው በማየ ቃና
ወይንኬ አልቦሙ በማየ ቃና
ውሃ ወይን ሲሆን በማየ ቃና
ሁሉ አዩ ሰሙ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 5
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 6
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 7
አሳላፊዎቹ በማየ ቃና
ግራ ቢገባቸው በማየ ቃና
የድንግል ማርያም ልጅ በማየ ቃና
ከጭንቅ አወጣቸው በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 8
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 9
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 10
እኛም እናምናለን በማየ ቃና
በእርሷ ትንብልና በማየ ቃና
ስለ ቃልኪዳኗ በማየ ቃና
ሁሉ እንደሚቀና በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 11
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

VERSE 12
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 1
legetachn teamr bemaye qana
temerta tadla bemaye qana
mejemeriya honech bemaye qana

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 2
qana zegelila bemaye qana
qanan liyadergat yetamru qedami sfra
yednglm kbr tegelete yemlja sra

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 3
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 4
tawt slalechw bemaye qana
weynke elbomu bemaye qana
wha weyn sihon bemaye qana

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 5
hulu eyu semu bemaye qana
qanan liyadergat yetamru qedami sfra
yednglm kbr tegelete yemlja sra

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 6
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 7
esalafiwochu bemaye qana
gra bigebachew bemaye qana
yedngl maryam lj bemaye qana

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 8
kechnq ewetachew bemaye qana
qanan liyadergat yetamru qedami sfra
yednglm kbr tegelete yemlja sra

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 9
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 10
nyam namnalen bemaye qana
ber tnblna bemaye qana
sle qalkida bemaye qana

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 11
hulu ndemiqena bemaye qana
qanan liyadergat yetamru qedami sfra
yednglm kbr tegelete yemlja sra

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

VERSE 12
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2

CHORUS
mebetachn banchi mlja banchi mlja
dngl maryam banchi mlja
medhanialem tamr sera bemaye qana x2';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1861059f-6c03-413b-b7fb-bf54efd83b50'::uuid, 'emebetachin-banchi-milja-bemaye-qana', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yemsrach-des-yibelen ("Yemsrach Des Yibelen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '904e9928-87a6-43e2-b37e-29449ada783d'::uuid
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
    WHERE import_id = '904e9928-87a6-43e2-b37e-29449ada783d'::uuid
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
        '904e9928-87a6-43e2-b37e-29449ada783d'::uuid, 'yemsrach-des-yibelen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- adnegn-amlake-like-mezemeran-tewodros-yosef ("Adnegn Amlake Like Mezemeran Tewodros Yosef")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd603fb5f-370f-4a9c-afff-e9fdaba1076c'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ፍቅር ከሰው ልጆች ቀዝቅዞ',
        lyrics_transliteration = 'CHORUS
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
Fiqr kesew lijoch qezqzo',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd603fb5f-370f-4a9c-afff-e9fdaba1076c'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd603fb5f-370f-4a9c-afff-e9fdaba1076c'::uuid, 'adnegn-amlake-like-mezemeran-tewodros-yosef', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mesach-mezimur-bezimita-zemari-kesis-ashenafi-gebiremariyam ("Mesach Mezimur Bezimita Zemari Kesis Ashenafi Gebiremariyam")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '12fef2f0-ce07-42fb-9a60-e6548167da93'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ስለራሱ ትቶ እውነት የሚያወራ',
        lyrics_transliteration = 'CHORUS
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
Silerasu tito ewnet yemiyawera',
        updated_at = clock_timestamp()::text
    WHERE import_id = '12fef2f0-ce07-42fb-9a60-e6548167da93'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '12fef2f0-ce07-42fb-9a60-e6548167da93'::uuid, 'mesach-mezimur-bezimita-zemari-kesis-ashenafi-gebiremariyam', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- min-bitiwedegn-new ("Min Bitiwedegn New")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd7173705-6b25-405c-999c-15b01c44c20d'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ኦ ማስያስ እዘምራለሁ ስቡህ እያልኩ',
        lyrics_transliteration = 'CHORUS
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
O masyas ezemralehu sibuh eyalku',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd7173705-6b25-405c-999c-15b01c44c20d'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd7173705-6b25-405c-999c-15b01c44c20d'::uuid, 'min-bitiwedegn-new', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sebatu-menitolaet ("Sebatu Menitolaet")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '90ed8bc6-8234-4e6b-ac05-9ebb175c0cf5'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት',
        lyrics_transliteration = 'CHORUS
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
Beanchi lay sifets’em engda sirat',
        updated_at = clock_timestamp()::text
    WHERE import_id = '90ed8bc6-8234-4e6b-ac05-9ebb175c0cf5'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '90ed8bc6-8234-4e6b-ac05-9ebb175c0cf5'::uuid, 'sebatu-menitolaet', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- iyesus-diyakon-zemari-enidale-dereje ("Iyesus Diyakon Zemari Enidale Dereje")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '915b8156-ab33-4559-b1bb-cd5eef903477'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 1
እርሱ ነው ክርስቶስ
ይኸው ቀረ ወደ ኃላ የውርደት ሞት
ተሰበረ የሲዖል ደጅ ደሙ ወርሶት
የድል ዜማ የድል ቅኔ ለእርሱ ክብር

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 2
ስለወጣሁ እጄን ይዞ ከመቃብር
በራስ ቅል ላይ አለ ክብር የማልገልጸው
አሳዳጁን ያንን ዘንዶ የረገጠው
ተተከለ ልዩ መውደድ በልቤ ላይ

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 3
የማይጠልቀው ተሰቅሎልኝ ልዩ ፀሐይ
አርክቶኛል ተጠምቶልኝ ደሙን አፍስሶ
ህይወት ሆኗል በእኔ ፈንታ እርሱ ተከሶ
ሰላሜ ነው የኔ ተስፋ የኔ ክብር

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 4
የእግዚአብሔር ልጅ መድኃኒቴ እግዚአብሔር
የቻለኝን ሁሌም ሳስብ ያንን ፍቅር
ያወጣኝን ነጥቆ ልጁን ከሞት ሐገር
ከዚም ያልፋል ለኔ ያየው የኔ ጌታ

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 5
አውሎኛል ማዕረግ ሆኖ በከፍታ
ድል ተነሳ ሞት ስልጣኑ ማሸነፉ
የአማኑኤል የአምላኬ ነው አሁንም ሰልፉ
ከእንግዲህማ ልቤ አይሰጋም በሞት ወሬ

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 6
የበጉ ደም ታትሞብኝ በግንባሬ
ማን ሊዘጋው አሁን ያንን የጽድቅ በር
ዋጋ ከፍሎ ዋጅቶኝ አቁሞኝ በክብር
ገለል ብሏል ከሳሽ ላይቆም ፊትለፊቴ

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 7
ስለገዛኝ በደም ዋጋ መድኃኒቴ

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 1
Ersu new Kristos
Yiኸw qere wede hala yewrdet mot
Tesebere yesiol dej demu wersot
Yedl zema yedl qine leersu kibir

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 2
Silewet’ahu ejen yizo kemeqabr
Beras qil lay ale kibir yemalgelts’ew
Asadajun yann zendo yereget’ew
Tetekele liyu mewded belbe lay

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 3
Yemayt’elqew teseqlolgn liyu ts’ehey
Arktognal tet’emtolgn demun afsso
Hiywet honwal beene fenta ersu tekeso
Selame new yene tesfa yene kibir

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 4
YeEgziabher lij medhanite Egziabher
Yechalegnn hulem sasb yann fiqr
Yawet’agnn net’qo lijun kemot heger
Kezim yalfal lene yayew yene Geta

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 5
Awlognal maereg hono bekefta
Dil tenesa mot silt’anu mashenefu
YeAmanuel yeamlake new ahunm selfu
Keengdihma libe aysegam bemot were

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 6
Yebegu dem tatmobgn begnbare
Man lizegaw ahun yann yets’dq ber
Waga keflo wajtogn aqumogn bekbr
Gelel bilwal kesash layqom fitlefite

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 7
Silegezagn bedem waga medhanite

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 1
እርሱ ነው ክርስቶስ
ይኸው ቀረ ወደ ኃላ የውርደት ሞት
ተሰበረ የሲዖል ደጅ ደሙ ወርሶት
የድል ዜማ የድል ቅኔ ለእርሱ ክብር

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 2
ስለወጣሁ እጄን ይዞ ከመቃብር
በራስ ቅል ላይ አለ ክብር የማልገልጸው
አሳዳጁን ያንን ዘንዶ የረገጠው
ተተከለ ልዩ መውደድ በልቤ ላይ

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 3
የማይጠልቀው ተሰቅሎልኝ ልዩ ፀሐይ
አርክቶኛል ተጠምቶልኝ ደሙን አፍስሶ
ህይወት ሆኗል በእኔ ፈንታ እርሱ ተከሶ
ሰላሜ ነው የኔ ተስፋ የኔ ክብር

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 4
የእግዚአብሔር ልጅ መድኃኒቴ እግዚአብሔር
የቻለኝን ሁሌም ሳስብ ያንን ፍቅር
ያወጣኝን ነጥቆ ልጁን ከሞት ሐገር
ከዚም ያልፋል ለኔ ያየው የኔ ጌታ

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 5
አውሎኛል ማዕረግ ሆኖ በከፍታ
ድል ተነሳ ሞት ስልጣኑ ማሸነፉ
የአማኑኤል የአምላኬ ነው አሁንም ሰልፉ
ከእንግዲህማ ልቤ አይሰጋም በሞት ወሬ

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 6
የበጉ ደም ታትሞብኝ በግንባሬ
ማን ሊዘጋው አሁን ያንን የጽድቅ በር
ዋጋ ከፍሎ ዋጅቶኝ አቁሞኝ በክብር
ገለል ብሏል ከሳሽ ላይቆም ፊትለፊቴ

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 7
ስለገዛኝ በደም ዋጋ መድኃኒቴ

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር',
        lyrics_transliteration = 'CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 1
Ersu new Kristos
Yiኸw qere wede hala yewrdet mot
Tesebere yesiol dej demu wersot
Yedl zema yedl qine leersu kibir

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 2
Silewet’ahu ejen yizo kemeqabr
Beras qil lay ale kibir yemalgelts’ew
Asadajun yann zendo yereget’ew
Tetekele liyu mewded belbe lay

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 3
Yemayt’elqew teseqlolgn liyu ts’ehey
Arktognal tet’emtolgn demun afsso
Hiywet honwal beene fenta ersu tekeso
Selame new yene tesfa yene kibir

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 4
YeEgziabher lij medhanite Egziabher
Yechalegnn hulem sasb yann fiqr
Yawet’agnn net’qo lijun kemot heger
Kezim yalfal lene yayew yene Geta

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 5
Awlognal maereg hono bekefta
Dil tenesa mot silt’anu mashenefu
YeAmanuel yeamlake new ahunm selfu
Keengdihma libe aysegam bemot were

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 6
Yebegu dem tatmobgn begnbare
Man lizegaw ahun yann yets’dq ber
Waga keflo wajtogn aqumogn bekbr
Gelel bilwal kesash layqom fitlefite

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher

VERSE 7
Silegezagn bedem waga medhanite

CHORUS
Iyesus Kristos yehywet meaza
Bedem waga keflo alemun yegeza
Yesioln dejoch yanawets’ew nigus
Ersu new Egziabher',
        updated_at = clock_timestamp()::text
    WHERE import_id = '915b8156-ab33-4559-b1bb-cd5eef903477'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 1
እርሱ ነው ክርስቶስ
ይኸው ቀረ ወደ ኃላ የውርደት ሞት
ተሰበረ የሲዖል ደጅ ደሙ ወርሶት
የድል ዜማ የድል ቅኔ ለእርሱ ክብር

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 2
ስለወጣሁ እጄን ይዞ ከመቃብር
በራስ ቅል ላይ አለ ክብር የማልገልጸው
አሳዳጁን ያንን ዘንዶ የረገጠው
ተተከለ ልዩ መውደድ በልቤ ላይ

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 3
የማይጠልቀው ተሰቅሎልኝ ልዩ ፀሐይ
አርክቶኛል ተጠምቶልኝ ደሙን አፍስሶ
ህይወት ሆኗል በእኔ ፈንታ እርሱ ተከሶ
ሰላሜ ነው የኔ ተስፋ የኔ ክብር

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 4
የእግዚአብሔር ልጅ መድኃኒቴ እግዚአብሔር
የቻለኝን ሁሌም ሳስብ ያንን ፍቅር
ያወጣኝን ነጥቆ ልጁን ከሞት ሐገር
ከዚም ያልፋል ለኔ ያየው የኔ ጌታ

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 5
አውሎኛል ማዕረግ ሆኖ በከፍታ
ድል ተነሳ ሞት ስልጣኑ ማሸነፉ
የአማኑኤል የአምላኬ ነው አሁንም ሰልፉ
ከእንግዲህማ ልቤ አይሰጋም በሞት ወሬ

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 6
የበጉ ደም ታትሞብኝ በግንባሬ
ማን ሊዘጋው አሁን ያንን የጽድቅ በር
ዋጋ ከፍሎ ዋጅቶኝ አቁሞኝ በክብር
ገለል ብሏል ከሳሽ ላይቆም ፊትለፊቴ

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር

VERSE 7
ስለገዛኝ በደም ዋጋ መድኃኒቴ

CHORUS
ኢየሱስ ክርስቶስ የህይወት መአዛ
በደም ዋጋ ከፍሎ አለሙን የገዛ
የሲዖልን ደጆች ያናወፀው ንጉሥ
እርሱ ነው እግዚአብሔር'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '915b8156-ab33-4559-b1bb-cd5eef903477'::uuid, 'iyesus-diyakon-zemari-enidale-dereje', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- salemin-yemiyasifeligegnin-tawikaleh ("Salemin Yemiyasifeligegnin Tawikaleh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ffdb67fe-526e-464e-b1d2-784bd1f5f710'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
የሚያስፈልገኝን ታውቃለህ',
        lyrics_transliteration = 'CHORUS
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
Yemiyasfelgegnn tawqaleh',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ffdb67fe-526e-464e-b1d2-784bd1f5f710'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ffdb67fe-526e-464e-b1d2-784bd1f5f710'::uuid, 'salemin-yemiyasifeligegnin-tawikaleh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mindaye-berhanu-selam-leki ("Mindaye Berhanu- Selam Leki")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '062f60c1-528a-4759-9496-c77b9982e31a'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
በ እንተ ሐና እምኪ ወ ኢያቄም አቡኪ',
        lyrics_transliteration = 'CHORUS
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
Be ente hena emki we iyaqem abuki',
        updated_at = clock_timestamp()::text
    WHERE import_id = '062f60c1-528a-4759-9496-c77b9982e31a'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '062f60c1-528a-4759-9496-c77b9982e31a'::uuid, 'mindaye-berhanu-selam-leki', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eruk-newu ("Eruk Newu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd65be360-3a80-46ef-ac62-593889485f4f'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ጌታዬ የምልህ ውዴ',
        lyrics_transliteration = 'CHORUS
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
Getaye yemlh wide',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd65be360-3a80-46ef-ac62-593889485f4f'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd65be360-3a80-46ef-ac62-593889485f4f'::uuid, 'eruk-newu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bezemenat-yeshemegele ("Bezemenat Yeshemegele")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '14a7d127-8454-4a0a-9855-09fd2021f92b'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
እንደ እግዚአብሔር ኧረ ማን አለ',
        lyrics_transliteration = 'CHORUS
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
Ende Egziabher ኧre man ale',
        updated_at = clock_timestamp()::text
    WHERE import_id = '14a7d127-8454-4a0a-9855-09fd2021f92b'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '14a7d127-8454-4a0a-9855-09fd2021f92b'::uuid, 'bezemenat-yeshemegele', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- forgive-me-an-english-hymn ("Forgive Me an English Hymn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd93a6fb5-45f1-4b62-9c41-aff6ec7b2203'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
For my soul has surrendered, to the will of my flesh',
        lyrics_transliteration = 'CHORUS
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
For my soul has surrendered, to the will of my flesh',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd93a6fb5-45f1-4b62-9c41-aff6ec7b2203'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd93a6fb5-45f1-4b62-9c41-aff6ec7b2203'::uuid, 'forgive-me-an-english-hymn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- adrigeh-lignalen ("Adrigeh Lignalen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1a9d524c-ccbc-4753-a62c-7050ac1c3dd4'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
እገዛልሃለሁ መድሃኒዓለም /2/',
        lyrics_transliteration = 'CHORUS
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
Egezalehulehu Medhanealem (x2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1a9d524c-ccbc-4753-a62c-7050ac1c3dd4'::uuid
      AND deleted_at IS NULL
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
Egezalehulehu Medhanealem (x2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1a9d524c-ccbc-4753-a62c-7050ac1c3dd4'::uuid, 'adrigeh-lignalen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sekokawe-hager ("Sekokawe Hager")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1edc55b0-25d4-4d5c-84e9-b486865dc574'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 1
“ስንሞት እንበዛን” ያለ ጠርጡለስ፥
በዐውደ ኢትዮጵያ ዛሬ ይከሰስ፥
ደሙም ዘር አልሆነ እያደር ማነስ።
ዘቅዝቀው ሰቀሉት ወንድሜን በጣ’ይ፥

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 2
በሰይፍም ቆረጡት ፈርደው በጉባይ፥
የጴጥሮስ ፣ የጳውሎስ ታሪክ ባ’ይኔ ‘ማይ፥
ጦቢያ የመሰለኝ ሮም አይደለም ወይ?
ገበሬን ምን ነካው ምንስ አስነኩት፥

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 3
እንዲህ ሲለኝ ሰማሁ ልቡ ተስቶት፥
"ላሜን አረድኩና ባ''ህያ ጫንኩት፥
ባ''ህያ ጫንኩና ጅብን ንዳ አልኩት፥
ጅብን ንዳ አልኩና ውሻን ሳብ አልኩት፥"

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 4
ኧረ መ''ላ በ''ሉት ተው/ዉ በ''ሉት በ''ሉት! (ጠብቆና ላልቶ ይደገማል)
ምንድን ሆኗል ሰዉ በሽታን ያልቻለ፥
አቅም የሚሰጠው ብርቱካ’ን እያለ፥
መብላቱ መች ጠፍቶት እየከፋፈለ።

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 5
ምን ያገብረኛል መቆም ለወረት፥
ለየትኛው ሰዓታት እያለ መቅረት።
በገሃድ እንዳንጦም ከዝግን ፣ ቅቅሉ፥
እስኪ ጠይቁልን መቼ ዋለ ባ’ሉ?

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 6
እግዚአብሔር ልዑል በመንበሩ ሳለ፥
ሰው በሰው ላይ ወጥቶ “ከፋ’ለ ከፋ’ለ”።

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.

VERSE 1
“snmot enbezan” yale t’ert’ules:
Beawde ityop’ya zare yikeses:
Demum zer alhone eyader manes.
Zeqzqew seqelut wendmen bet’a’y:

CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.

VERSE 2
Beseyfm qoret’ut ferdew begubay:
Yep’et’ros , yep’awlos tarik ba’yne ‘may:
T’obiya yemeselegn rom aydelem wey?
Geberen min nekaw mins asnekut:

CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.

VERSE 3
Endih silegn semahu libu testot:
"lamen aredkuna ba''hiya ch’ankut:
Ba''hiya ch’ankuna jibn nida alkut:
Jibn nida alkuna wishan sab alkut:"

CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.

VERSE 4
ኧre me''la be''lut tew/wu be''lut be''lut! (t’ebqona lalto yidegemal)
Mindn honwal sewu beshtan yalchale:
Aqm yemiset’ew birtuka’n eyale:
Meblatu mech t’eftot eyekefafele.

CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.

VERSE 5
Min yagebregnal meqom leweret:
Leyetgnaw seatat eyale meqret.
Begehad endant’om kezgn , qiqlu:
Eski t’eyquln meche wale ba’lu?

CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.

VERSE 6
Egziabher liul bemenberu sale:
Sew besew lay wet’to “kefa’le kefa’le”.

CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 1
“ስንሞት እንበዛን” ያለ ጠርጡለስ፥
በዐውደ ኢትዮጵያ ዛሬ ይከሰስ፥
ደሙም ዘር አልሆነ እያደር ማነስ።
ዘቅዝቀው ሰቀሉት ወንድሜን በጣ’ይ፥

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 2
በሰይፍም ቆረጡት ፈርደው በጉባይ፥
የጴጥሮስ ፣ የጳውሎስ ታሪክ ባ’ይኔ ‘ማይ፥
ጦቢያ የመሰለኝ ሮም አይደለም ወይ?
ገበሬን ምን ነካው ምንስ አስነኩት፥

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 3
እንዲህ ሲለኝ ሰማሁ ልቡ ተስቶት፥
"ላሜን አረድኩና ባ''ህያ ጫንኩት፥
ባ''ህያ ጫንኩና ጅብን ንዳ አልኩት፥
ጅብን ንዳ አልኩና ውሻን ሳብ አልኩት፥"

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 4
ኧረ መ''ላ በ''ሉት ተው/ዉ በ''ሉት በ''ሉት! (ጠብቆና ላልቶ ይደገማል)
ምንድን ሆኗል ሰዉ በሽታን ያልቻለ፥
አቅም የሚሰጠው ብርቱካ’ን እያለ፥
መብላቱ መች ጠፍቶት እየከፋፈለ።

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 5
ምን ያገብረኛል መቆም ለወረት፥
ለየትኛው ሰዓታት እያለ መቅረት።
በገሃድ እንዳንጦም ከዝግን ፣ ቅቅሉ፥
እስኪ ጠይቁልን መቼ ዋለ ባ’ሉ?

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 6
እግዚአብሔር ልዑል በመንበሩ ሳለ፥
ሰው በሰው ላይ ወጥቶ “ከፋ’ለ ከፋ’ለ”።

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።',
        lyrics_transliteration = 'CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.

VERSE 1
“snmot enbezan” yale t’ert’ules:
Beawde ityop’ya zare yikeses:
Demum zer alhone eyader manes.
Zeqzqew seqelut wendmen bet’a’y:

CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.

VERSE 2
Beseyfm qoret’ut ferdew begubay:
Yep’et’ros , yep’awlos tarik ba’yne ‘may:
T’obiya yemeselegn rom aydelem wey?
Geberen min nekaw mins asnekut:

CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.

VERSE 3
Endih silegn semahu libu testot:
"lamen aredkuna ba''hiya ch’ankut:
Ba''hiya ch’ankuna jibn nida alkut:
Jibn nida alkuna wishan sab alkut:"

CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.

VERSE 4
ኧre me''la be''lut tew/wu be''lut be''lut! (t’ebqona lalto yidegemal)
Mindn honwal sewu beshtan yalchale:
Aqm yemiset’ew birtuka’n eyale:
Meblatu mech t’eftot eyekefafele.

CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.

VERSE 5
Min yagebregnal meqom leweret:
Leyetgnaw seatat eyale meqret.
Begehad endant’om kezgn , qiqlu:
Eski t’eyquln meche wale ba’lu?

CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.

VERSE 6
Egziabher liul bemenberu sale:
Sew besew lay wet’to “kefa’le kefa’le”.

CHORUS
Ende dawit mezmur , ende awtar misgana:
Yiኸw tewelede be’gena , be’gena.
Eski besmam biye wendmen lired:
Zendro "mesqel" new yebila mored.',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1edc55b0-25d4-4d5c-84e9-b486865dc574'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 1
“ስንሞት እንበዛን” ያለ ጠርጡለስ፥
በዐውደ ኢትዮጵያ ዛሬ ይከሰስ፥
ደሙም ዘር አልሆነ እያደር ማነስ።
ዘቅዝቀው ሰቀሉት ወንድሜን በጣ’ይ፥

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 2
በሰይፍም ቆረጡት ፈርደው በጉባይ፥
የጴጥሮስ ፣ የጳውሎስ ታሪክ ባ’ይኔ ‘ማይ፥
ጦቢያ የመሰለኝ ሮም አይደለም ወይ?
ገበሬን ምን ነካው ምንስ አስነኩት፥

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 3
እንዲህ ሲለኝ ሰማሁ ልቡ ተስቶት፥
"ላሜን አረድኩና ባ''ህያ ጫንኩት፥
ባ''ህያ ጫንኩና ጅብን ንዳ አልኩት፥
ጅብን ንዳ አልኩና ውሻን ሳብ አልኩት፥"

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 4
ኧረ መ''ላ በ''ሉት ተው/ዉ በ''ሉት በ''ሉት! (ጠብቆና ላልቶ ይደገማል)
ምንድን ሆኗል ሰዉ በሽታን ያልቻለ፥
አቅም የሚሰጠው ብርቱካ’ን እያለ፥
መብላቱ መች ጠፍቶት እየከፋፈለ።

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 5
ምን ያገብረኛል መቆም ለወረት፥
ለየትኛው ሰዓታት እያለ መቅረት።
በገሃድ እንዳንጦም ከዝግን ፣ ቅቅሉ፥
እስኪ ጠይቁልን መቼ ዋለ ባ’ሉ?

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።

VERSE 6
እግዚአብሔር ልዑል በመንበሩ ሳለ፥
ሰው በሰው ላይ ወጥቶ “ከፋ’ለ ከፋ’ለ”።

CHORUS
እንደ ዳዊት መዝሙር ፣ እንደ አውታር ምስጋና፥
ይኸው ተወለደ በ’ገና ፣ በ’ገና።
እስኪ በስማም ብዬ ወንድሜን ልረድ፥
ዘንድሮ "መስቀል" ነው የቢላ ሞረድ።'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1edc55b0-25d4-4d5c-84e9-b486865dc574'::uuid, 'sekokawe-hager', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kifun-alferam-zemarit-fasika-mekonen ("Kifun Alferam Zemarit Fasika Mekonen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '924d63a7-d4b1-4a80-a6e8-0cfab70ae208'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
በሕይወቴ የለም የሚያሳጣኝ',
        lyrics_transliteration = 'CHORUS
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
Behywete yelem yemiyasat’agn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '924d63a7-d4b1-4a80-a6e8-0cfab70ae208'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '924d63a7-d4b1-4a80-a6e8-0cfab70ae208'::uuid, 'kifun-alferam-zemarit-fasika-mekonen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mikiniyat-silalegn-new ("Mikiniyat Silalegn New")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '92670597-89f4-435b-ad31-edffbdee1bcc'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ከዚህ በላይ እንዳመሰግንሽ',
        lyrics_transliteration = 'CHORUS
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
Kezih belay endamesegnsh',
        updated_at = clock_timestamp()::text
    WHERE import_id = '92670597-89f4-435b-ad31-edffbdee1bcc'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '92670597-89f4-435b-ad31-edffbdee1bcc'::uuid, 'mikiniyat-silalegn-new', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- metadel-new ("Metadel New")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '15428d8a-b96c-494d-856a-cbd8cc6bfca8'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ወልደሽ ጡት ያጥባሽው ዕጹብ የዓለሙን ቤዛ',
        lyrics_transliteration = 'CHORUS
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
Weldesh t’ut yat’bashw ets’ub yealemun beza',
        updated_at = clock_timestamp()::text
    WHERE import_id = '15428d8a-b96c-494d-856a-cbd8cc6bfca8'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '15428d8a-b96c-494d-856a-cbd8cc6bfca8'::uuid, 'metadel-new', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- hayilen-gulibeten-tadisaleh ("Hayilen Gulibeten Tadisaleh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '932b2abb-bb6c-4a86-85ab-c76613aeb5fe'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 1
ክንድህ ይዘርጋ ከሞት ልዳን
ባንተ ልሻገር ክፉን ዘመን
ከሚያስጨንቁኝ አድነኝ
ካለአንተ በቀር ማን አለኝ

CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 2
በሩ ይከፈት ያ የሰርጉ
ጌታ አስቀመጠኝ ከማዕረጉ
እድፌን ጣለው ከፊትህ
ከዚህ በላይ ነው ምህረትህ

CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 3
ላገለገልህ ፈቅጄ አለሁ
እጄን ከፊትህ አንስቼ አለሁ
አጥንቴም ይቁም ባንተ ጸንቶ
መንፈስህ ይቃኘኝ ከላይ መቶ

CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 4
በጎና መልካም ካንተ ነው
ከአለም ይሔንን አላገኘው
ክብሬ ነህ አንተ መድኃኒቴ
በቃልህ ዳነች ሰውነቴ

CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 5
በሩ ይከፈት ያ የሰርጉ
ጌታ አስቀመጠኝ ከማዕረጉ
እድፌን ጣለው ከፊትህ
ከዚህ በላይ ነው ምህረትህ

CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Haylen gulbeten tadsaleh
Qena qena endl tadergaleh
Medhanehaalem medhanite
Meriw ante neh lehywete

VERSE 1
Kindh yizerga kemot lidan
Bante lishager kifun zemen
Kemiyasch’enqugn adnegn
Kaleante beqer man alegn

CHORUS
Haylen gulbeten tadsaleh
Qena qena endl tadergaleh
Medhanehaalem medhanite
Meriw ante neh lehywete

VERSE 2
Beru yikefet ya yesergu
Geta asqemet’egn kemaeregu
Edfen t’alew kefith
Kezih belay new mihreth

CHORUS
Haylen gulbeten tadsaleh
Qena qena endl tadergaleh
Medhanehaalem medhanite
Meriw ante neh lehywete

VERSE 3
Lagelegelh feqje alehu
Ejen kefith ansche alehu
At’ntem yiqum bante ts’ento
Menfesh yiqagnegn kelay meto

CHORUS
Haylen gulbeten tadsaleh
Qena qena endl tadergaleh
Medhanehaalem medhanite
Meriw ante neh lehywete

VERSE 4
Begona melkam kante new
Kealem yihenn alagegnew
Kibre neh ante medhanite
Beqalh danech sewnete

CHORUS
Haylen gulbeten tadsaleh
Qena qena endl tadergaleh
Medhanehaalem medhanite
Meriw ante neh lehywete

VERSE 5
Beru yikefet ya yesergu
Geta asqemet’egn kemaeregu
Edfen t’alew kefith
Kezih belay new mihreth

CHORUS
Haylen gulbeten tadsaleh
Qena qena endl tadergaleh
Medhanehaalem medhanite
Meriw ante neh lehywete'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 1
ክንድህ ይዘርጋ ከሞት ልዳን
ባንተ ልሻገር ክፉን ዘመን
ከሚያስጨንቁኝ አድነኝ
ካለአንተ በቀር ማን አለኝ

CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 2
በሩ ይከፈት ያ የሰርጉ
ጌታ አስቀመጠኝ ከማዕረጉ
እድፌን ጣለው ከፊትህ
ከዚህ በላይ ነው ምህረትህ

CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 3
ላገለገልህ ፈቅጄ አለሁ
እጄን ከፊትህ አንስቼ አለሁ
አጥንቴም ይቁም ባንተ ጸንቶ
መንፈስህ ይቃኘኝ ከላይ መቶ

CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 4
በጎና መልካም ካንተ ነው
ከአለም ይሔንን አላገኘው
ክብሬ ነህ አንተ መድኃኒቴ
በቃልህ ዳነች ሰውነቴ

CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 5
በሩ ይከፈት ያ የሰርጉ
ጌታ አስቀመጠኝ ከማዕረጉ
እድፌን ጣለው ከፊትህ
ከዚህ በላይ ነው ምህረትህ

CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ',
        lyrics_transliteration = 'CHORUS
Haylen gulbeten tadsaleh
Qena qena endl tadergaleh
Medhanehaalem medhanite
Meriw ante neh lehywete

VERSE 1
Kindh yizerga kemot lidan
Bante lishager kifun zemen
Kemiyasch’enqugn adnegn
Kaleante beqer man alegn

CHORUS
Haylen gulbeten tadsaleh
Qena qena endl tadergaleh
Medhanehaalem medhanite
Meriw ante neh lehywete

VERSE 2
Beru yikefet ya yesergu
Geta asqemet’egn kemaeregu
Edfen t’alew kefith
Kezih belay new mihreth

CHORUS
Haylen gulbeten tadsaleh
Qena qena endl tadergaleh
Medhanehaalem medhanite
Meriw ante neh lehywete

VERSE 3
Lagelegelh feqje alehu
Ejen kefith ansche alehu
At’ntem yiqum bante ts’ento
Menfesh yiqagnegn kelay meto

CHORUS
Haylen gulbeten tadsaleh
Qena qena endl tadergaleh
Medhanehaalem medhanite
Meriw ante neh lehywete

VERSE 4
Begona melkam kante new
Kealem yihenn alagegnew
Kibre neh ante medhanite
Beqalh danech sewnete

CHORUS
Haylen gulbeten tadsaleh
Qena qena endl tadergaleh
Medhanehaalem medhanite
Meriw ante neh lehywete

VERSE 5
Beru yikefet ya yesergu
Geta asqemet’egn kemaeregu
Edfen t’alew kefith
Kezih belay new mihreth

CHORUS
Haylen gulbeten tadsaleh
Qena qena endl tadergaleh
Medhanehaalem medhanite
Meriw ante neh lehywete',
        updated_at = clock_timestamp()::text
    WHERE import_id = '932b2abb-bb6c-4a86-85ab-c76613aeb5fe'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 1
ክንድህ ይዘርጋ ከሞት ልዳን
ባንተ ልሻገር ክፉን ዘመን
ከሚያስጨንቁኝ አድነኝ
ካለአንተ በቀር ማን አለኝ

CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 2
በሩ ይከፈት ያ የሰርጉ
ጌታ አስቀመጠኝ ከማዕረጉ
እድፌን ጣለው ከፊትህ
ከዚህ በላይ ነው ምህረትህ

CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 3
ላገለገልህ ፈቅጄ አለሁ
እጄን ከፊትህ አንስቼ አለሁ
አጥንቴም ይቁም ባንተ ጸንቶ
መንፈስህ ይቃኘኝ ከላይ መቶ

CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 4
በጎና መልካም ካንተ ነው
ከአለም ይሔንን አላገኘው
ክብሬ ነህ አንተ መድኃኒቴ
በቃልህ ዳነች ሰውነቴ

CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ

VERSE 5
በሩ ይከፈት ያ የሰርጉ
ጌታ አስቀመጠኝ ከማዕረጉ
እድፌን ጣለው ከፊትህ
ከዚህ በላይ ነው ምህረትህ

CHORUS
ሃይሌን ጉልበቴን ታድሳለህ
ቀና ቀና እንድል ታደርጋለህ
መድኃኔሃዓለም መድሃኒቴ
መሪው አንተ ነህ ለህይወቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '932b2abb-bb6c-4a86-85ab-c76613aeb5fe'::uuid, 'hayilen-gulibeten-tadisaleh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- to-mother-mary ("To Mother Mary")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd94eb720-6250-4ff0-b8d7-2960aff66bf5'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 1
The unblemished gate
Ezikiel’s written
She is truly pure
A twofold virgin

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 2
We call out to her
Our foundation
Praise the mother of love and compassion

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 3
To mother Mary/x2/
We will sing to her for eternity/x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 4
Tender hearted dove
The bringer of peace
For my gloomy life
Shine your light on me

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 5
I will plead to your name
Virgin for my soul
Entrusted to you the one who consoles

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 6
To mother Mary/x2/
We will sing to her for eternity/x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 7
It is plentiful
All my love for you
It has no limits
Unspeakable truth

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 8
Through her I''m filled with joy
By Mary I''m proud
Calling to her name I will sing aloud

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 9
To mother Mary/x2/
We will sing to her for eternity/x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 10
I ask her come to me
Through the night and day
She is by my side
Here with me to stay

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 11
Glorifying her
They submit their praise
No words can describe her marvelous ways

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 12
To mother Mary/x2/
We will sing to her for eternity/x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 13
Le Mariam /x2/
Enzemiralen lezelalem /x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 14
To mother Mary/x2/
We will sing to her for eternity/x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Le Mariam
Enzemiralen lezelalem'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 1
The unblemished gate
Ezikiel’s written
She is truly pure
A twofold virgin

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 2
We call out to her
Our foundation
Praise the mother of love and compassion

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 3
To mother Mary/x2/
We will sing to her for eternity/x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 4
Tender hearted dove
The bringer of peace
For my gloomy life
Shine your light on me

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 5
I will plead to your name
Virgin for my soul
Entrusted to you the one who consoles

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 6
To mother Mary/x2/
We will sing to her for eternity/x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 7
It is plentiful
All my love for you
It has no limits
Unspeakable truth

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 8
Through her I''m filled with joy
By Mary I''m proud
Calling to her name I will sing aloud

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 9
To mother Mary/x2/
We will sing to her for eternity/x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 10
I ask her come to me
Through the night and day
She is by my side
Here with me to stay

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 11
Glorifying her
They submit their praise
No words can describe her marvelous ways

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 12
To mother Mary/x2/
We will sing to her for eternity/x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 13
Le Mariam /x2/
Enzemiralen lezelalem /x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 14
To mother Mary/x2/
We will sing to her for eternity/x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/',
        lyrics_transliteration = 'Le Mariam
Enzemiralen lezelalem',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd94eb720-6250-4ff0-b8d7-2960aff66bf5'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 1
The unblemished gate
Ezikiel’s written
She is truly pure
A twofold virgin

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 2
We call out to her
Our foundation
Praise the mother of love and compassion

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 3
To mother Mary/x2/
We will sing to her for eternity/x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 4
Tender hearted dove
The bringer of peace
For my gloomy life
Shine your light on me

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 5
I will plead to your name
Virgin for my soul
Entrusted to you the one who consoles

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 6
To mother Mary/x2/
We will sing to her for eternity/x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 7
It is plentiful
All my love for you
It has no limits
Unspeakable truth

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 8
Through her I''m filled with joy
By Mary I''m proud
Calling to her name I will sing aloud

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 9
To mother Mary/x2/
We will sing to her for eternity/x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 10
I ask her come to me
Through the night and day
She is by my side
Here with me to stay

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 11
Glorifying her
They submit their praise
No words can describe her marvelous ways

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 12
To mother Mary/x2/
We will sing to her for eternity/x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 13
Le Mariam /x2/
Enzemiralen lezelalem /x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/

VERSE 14
To mother Mary/x2/
We will sing to her for eternity/x2/

CHORUS
To mother Mary/x2/
We will sing to her for eternity/x2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Le Mariam
Enzemiralen lezelalem';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd94eb720-6250-4ff0-b8d7-2960aff66bf5'::uuid, 'to-mother-mary', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- dinik-yeabiy-tsom-mezimur ("Dinik Yeabiy Tsom Mezimur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '936576c5-de29-4bf9-a28d-05784f0c2eb3'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '936576c5-de29-4bf9-a28d-05784f0c2eb3'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '936576c5-de29-4bf9-a28d-05784f0c2eb3'::uuid, 'dinik-yeabiy-tsom-mezimur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- orthodox-mezmur-cover ("Orthodox Mezmur Cover")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c321b44e-21aa-4a9f-9933-d8ca6566b0c4'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ኣድኪምዋ ነፍሰይ ካባኻ ምፍላየይ',
        lyrics_transliteration = 'CHORUS
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
Adkimwa nefsey kabaኻ miflayey',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c321b44e-21aa-4a9f-9933-d8ca6566b0c4'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c321b44e-21aa-4a9f-9933-d8ca6566b0c4'::uuid, 'orthodox-mezmur-cover', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- temesigen-581 ("Temesigen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '15943763-b896-495d-8c73-2113e430cbbd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 1
ልቤ ባንተ ፀና ፀሎቴም ተሰማ
በጠላቶቼ ላይ ሆንከኝ ሞገስ ግርማ
ባዶዬን ወጥቼ አትርፌ ተመለስኩ
የትዳር ሲደንቀኝ በልጅም ተባረኩ

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 2
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 3
እጄን በአፌ አስጭነህ ልቤን አስደሰትከው
ቤቴን በበረከት በረድኤት ሞላህው
ከለመንኩህ አንዳች የቀረብኝ የለም
ምስጋና ይድረስህ ቸሩ መድኃኔዓለም

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 4
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 5
ዓይኔን በዓይኔ አየሁኝ ደግሜ ራሴን
ከአብራኬ ተከፋይ ልጅን ሰጠህኝ
ስለማይነገር ሰፊ ስጦታህ
ከምስጋና ሌላ ምኔን ልክፈልህ

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 6
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 1
Libe bante ts’ena ts’elotem tesema
Bet’elatoche lay honkegn moges girma
Badoyen wet’che atrfe temelesku
Yetdar sidenqegn beljm tebareku

CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 2
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 3
Ejen beafe asch’neh liben asdesetkew
Beten bebereket beredet molahw
Kelemenkuh andach yeqerebgn yelem
Misgana yidresh cheru Medhanealem

CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 4
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 5
Aynen beayne ayehugn degme rasen
Keabrake tekefay lijn set’ehgn
Silemayneger sefi sit’otah
Kemsgana lela minen likfelh

CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 6
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 1
ልቤ ባንተ ፀና ፀሎቴም ተሰማ
በጠላቶቼ ላይ ሆንከኝ ሞገስ ግርማ
ባዶዬን ወጥቼ አትርፌ ተመለስኩ
የትዳር ሲደንቀኝ በልጅም ተባረኩ

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 2
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 3
እጄን በአፌ አስጭነህ ልቤን አስደሰትከው
ቤቴን በበረከት በረድኤት ሞላህው
ከለመንኩህ አንዳች የቀረብኝ የለም
ምስጋና ይድረስህ ቸሩ መድኃኔዓለም

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 4
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 5
ዓይኔን በዓይኔ አየሁኝ ደግሜ ራሴን
ከአብራኬ ተከፋይ ልጅን ሰጠህኝ
ስለማይነገር ሰፊ ስጦታህ
ከምስጋና ሌላ ምኔን ልክፈልህ

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 6
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ',
        lyrics_transliteration = 'CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 1
Libe bante ts’ena ts’elotem tesema
Bet’elatoche lay honkegn moges girma
Badoyen wet’che atrfe temelesku
Yetdar sidenqegn beljm tebareku

CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 2
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 3
Ejen beafe asch’neh liben asdesetkew
Beten bebereket beredet molahw
Kelemenkuh andach yeqerebgn yelem
Misgana yidresh cheru Medhanealem

CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 4
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 5
Aynen beayne ayehugn degme rasen
Keabrake tekefay lijn set’ehgn
Silemayneger sefi sit’otah
Kemsgana lela minen likfelh

CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

VERSE 6
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye

CHORUS
Temesgen temesgen temesgenlgn
Belj betdar yihwaw barekegn
Teqebelkugn hulun Amen Amen biye
Desta selam moltwal bebet begwadaye',
        updated_at = clock_timestamp()::text
    WHERE import_id = '15943763-b896-495d-8c73-2113e430cbbd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 1
ልቤ ባንተ ፀና ፀሎቴም ተሰማ
በጠላቶቼ ላይ ሆንከኝ ሞገስ ግርማ
ባዶዬን ወጥቼ አትርፌ ተመለስኩ
የትዳር ሲደንቀኝ በልጅም ተባረኩ

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 2
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 3
እጄን በአፌ አስጭነህ ልቤን አስደሰትከው
ቤቴን በበረከት በረድኤት ሞላህው
ከለመንኩህ አንዳች የቀረብኝ የለም
ምስጋና ይድረስህ ቸሩ መድኃኔዓለም

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 4
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 5
ዓይኔን በዓይኔ አየሁኝ ደግሜ ራሴን
ከአብራኬ ተከፋይ ልጅን ሰጠህኝ
ስለማይነገር ሰፊ ስጦታህ
ከምስጋና ሌላ ምኔን ልክፈልህ

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

VERSE 6
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ

CHORUS
ተመስገን ተመስገን ተመስገንልኝ
በልጅ በትዳር ይኋው ባረከኝ
ተቀበልኩኝ ሁሉን አሜን አሜን ብዬ
ደስታ ሰላም ሞልቷል በቤት በጓዳዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '15943763-b896-495d-8c73-2113e430cbbd'::uuid, 'temesigen-581', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- egiziabiher-hayal-new ("Egiziabiher Hayal New")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8efeb1a9-a1cb-48d0-acc3-40d14c3dcc80'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል

VERSE 1
ማዳንና ጥበብ ኃይል በእጁ ሆኖ
ለሰዉ የማይቻል ለእርሱ ቀሊል ሆኖ
ፈጥኖ ይጎበኛል የምስኪኑን ጓዳ
ፈፅሞ አይዘገይም ጌታ ሲሰናዳ

CHORUS
እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል

VERSE 2
አንዱን እየሻረ አንዱን እየሾመ
የተዋረደዉን ክብር እያሸለመ
በኋላ ያለዉን ከፊት አሳልፎ
በጎ ቀን የመጣል ጨለማዉን ገፍፎ

CHORUS
እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል

VERSE 3
እንደቋትም ቢከብድ የሕይወት ፈተና
ሰዉን የሚያፀና አምላክ አለንና
ደስ ያሰኛ እርሱ መከራን አጥፍቶ
ታግሶ የቆመ ማን አፈረ ከቶ

CHORUS
እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል

VERSE 4
የሚያስፈራ ጊዜ ቢመጣም ክፉ ቀን
እናልፋለን እና እግዚአብሔርን ይዘን
ወራት ከብዶባችሁ ያጎነበሳችሁ
ታሪክ ሆኖ ያልፋል እግዚአብሔር ሲያያችሁ

CHORUS
እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabher hayal new yemisanewu yelem
Bezufanu ts’ento yinoral zelalem
Maebelun keflo hizbun yashagral
Lesewu yemisanewu leersu gin yichalal

VERSE 1
Madanna t’beb hayl beeju hono
Lesewu yemaychal leersu qelil hono
Fet’no yigobegnal yemskinun gwada
Fets’mo ayzegeym Geta sisenada

CHORUS
Egziabher hayal new yemisanewu yelem
Bezufanu ts’ento yinoral zelalem
Maebelun keflo hizbun yashagral
Lesewu yemisanewu leersu gin yichalal

VERSE 2
Andun eyeshare andun eyeshome
Yetewaredewun kibir eyasheleme
Behwala yalewun kefit asalfo
Bego qen yemet’al ch’elemawun geffo

CHORUS
Egziabher hayal new yemisanewu yelem
Bezufanu ts’ento yinoral zelalem
Maebelun keflo hizbun yashagral
Lesewu yemisanewu leersu gin yichalal

VERSE 3
Endeqwatm bikebd yehywet fetena
Sewun yemiyats’ena amlak alenna
Des yasegna ersu mekeran at’fto
Tagso yeqome man afere keto

CHORUS
Egziabher hayal new yemisanewu yelem
Bezufanu ts’ento yinoral zelalem
Maebelun keflo hizbun yashagral
Lesewu yemisanewu leersu gin yichalal

VERSE 4
Yemiyasfera gize bimet’am kifu qen
Enalfalen ena Egziabhern yizen
Werat kebdobachhu yagonebesachhu
Tarik hono yalfal Egziabher siyayachhu

CHORUS
Egziabher hayal new yemisanewu yelem
Bezufanu ts’ento yinoral zelalem
Maebelun keflo hizbun yashagral
Lesewu yemisanewu leersu gin yichalal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል

VERSE 1
ማዳንና ጥበብ ኃይል በእጁ ሆኖ
ለሰዉ የማይቻል ለእርሱ ቀሊል ሆኖ
ፈጥኖ ይጎበኛል የምስኪኑን ጓዳ
ፈፅሞ አይዘገይም ጌታ ሲሰናዳ

CHORUS
እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል

VERSE 2
አንዱን እየሻረ አንዱን እየሾመ
የተዋረደዉን ክብር እያሸለመ
በኋላ ያለዉን ከፊት አሳልፎ
በጎ ቀን የመጣል ጨለማዉን ገፍፎ

CHORUS
እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል

VERSE 3
እንደቋትም ቢከብድ የሕይወት ፈተና
ሰዉን የሚያፀና አምላክ አለንና
ደስ ያሰኛ እርሱ መከራን አጥፍቶ
ታግሶ የቆመ ማን አፈረ ከቶ

CHORUS
እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል

VERSE 4
የሚያስፈራ ጊዜ ቢመጣም ክፉ ቀን
እናልፋለን እና እግዚአብሔርን ይዘን
ወራት ከብዶባችሁ ያጎነበሳችሁ
ታሪክ ሆኖ ያልፋል እግዚአብሔር ሲያያችሁ

CHORUS
እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል',
        lyrics_transliteration = 'CHORUS
Egziabher hayal new yemisanewu yelem
Bezufanu ts’ento yinoral zelalem
Maebelun keflo hizbun yashagral
Lesewu yemisanewu leersu gin yichalal

VERSE 1
Madanna t’beb hayl beeju hono
Lesewu yemaychal leersu qelil hono
Fet’no yigobegnal yemskinun gwada
Fets’mo ayzegeym Geta sisenada

CHORUS
Egziabher hayal new yemisanewu yelem
Bezufanu ts’ento yinoral zelalem
Maebelun keflo hizbun yashagral
Lesewu yemisanewu leersu gin yichalal

VERSE 2
Andun eyeshare andun eyeshome
Yetewaredewun kibir eyasheleme
Behwala yalewun kefit asalfo
Bego qen yemet’al ch’elemawun geffo

CHORUS
Egziabher hayal new yemisanewu yelem
Bezufanu ts’ento yinoral zelalem
Maebelun keflo hizbun yashagral
Lesewu yemisanewu leersu gin yichalal

VERSE 3
Endeqwatm bikebd yehywet fetena
Sewun yemiyats’ena amlak alenna
Des yasegna ersu mekeran at’fto
Tagso yeqome man afere keto

CHORUS
Egziabher hayal new yemisanewu yelem
Bezufanu ts’ento yinoral zelalem
Maebelun keflo hizbun yashagral
Lesewu yemisanewu leersu gin yichalal

VERSE 4
Yemiyasfera gize bimet’am kifu qen
Enalfalen ena Egziabhern yizen
Werat kebdobachhu yagonebesachhu
Tarik hono yalfal Egziabher siyayachhu

CHORUS
Egziabher hayal new yemisanewu yelem
Bezufanu ts’ento yinoral zelalem
Maebelun keflo hizbun yashagral
Lesewu yemisanewu leersu gin yichalal',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8efeb1a9-a1cb-48d0-acc3-40d14c3dcc80'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል

VERSE 1
ማዳንና ጥበብ ኃይል በእጁ ሆኖ
ለሰዉ የማይቻል ለእርሱ ቀሊል ሆኖ
ፈጥኖ ይጎበኛል የምስኪኑን ጓዳ
ፈፅሞ አይዘገይም ጌታ ሲሰናዳ

CHORUS
እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል

VERSE 2
አንዱን እየሻረ አንዱን እየሾመ
የተዋረደዉን ክብር እያሸለመ
በኋላ ያለዉን ከፊት አሳልፎ
በጎ ቀን የመጣል ጨለማዉን ገፍፎ

CHORUS
እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል

VERSE 3
እንደቋትም ቢከብድ የሕይወት ፈተና
ሰዉን የሚያፀና አምላክ አለንና
ደስ ያሰኛ እርሱ መከራን አጥፍቶ
ታግሶ የቆመ ማን አፈረ ከቶ

CHORUS
እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል

VERSE 4
የሚያስፈራ ጊዜ ቢመጣም ክፉ ቀን
እናልፋለን እና እግዚአብሔርን ይዘን
ወራት ከብዶባችሁ ያጎነበሳችሁ
ታሪክ ሆኖ ያልፋል እግዚአብሔር ሲያያችሁ

CHORUS
እግዚአብሔር ኃያል ነው የሚሳነዉ የለም
በዙፋኑ ፀንቶ ይኖራል ዘላለም
ማዕበሉን ከፍሎ ሕዝቡን ያሻግራል
ለሰዉ የሚሳነዉ ለእርሱ ግን ይቻላል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8efeb1a9-a1cb-48d0-acc3-40d14c3dcc80'::uuid, 'egiziabiher-hayal-new', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
