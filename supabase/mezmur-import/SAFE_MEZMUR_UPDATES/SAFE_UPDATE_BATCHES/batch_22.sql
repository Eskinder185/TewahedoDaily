-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 22 OF 32
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
  -- besew-zenid ("Besew Zenid")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b1afa0f3-8cb8-410b-a91a-9f8e9f9e676b'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ክርስቶስ አለልን የሚያሳይ አብርቶ/2/',
        lyrics_transliteration = 'CHORUS
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
Kristos aleln yemiyasay abrto (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b1afa0f3-8cb8-410b-a91a-9f8e9f9e676b'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b1afa0f3-8cb8-410b-a91a-9f8e9f9e676b'::uuid, 'besew-zenid', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- addis-amet-mezmur-4131 ("Addis amet mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b3d990a2-e2f7-40f5-979d-5a0a01193f35'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ትተበደለኝ',
        lyrics_transliteration = 'CHORUS
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
Titebedelegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b3d990a2-e2f7-40f5-979d-5a0a01193f35'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b3d990a2-e2f7-40f5-979d-5a0a01193f35'::uuid, 'addis-amet-mezmur-4131', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nii-emilibanos ("Nii Emilibanos")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b5abc9e0-5df5-44c9-a23e-9b702042b246'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ዝናብ የቋጠረች ታናሿ ደመና',
        lyrics_transliteration = 'CHORUS
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
Zinab yeqwat’erech tanashwa demena',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b5abc9e0-5df5-44c9-a23e-9b702042b246'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b5abc9e0-5df5-44c9-a23e-9b702042b246'::uuid, 'nii-emilibanos', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- misigana-yigebal ("Misigana Yigebal")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b76f9b6a-2272-4e63-a22e-5cc11daf80e1'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ምስጋና ይገባል ለወልድ ዓለምን ኹሉ ለፈጠረ/፪/',
        lyrics_transliteration = 'CHORUS
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
Misgana yigebal leweld alemn ኹlu lefet’ere (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b76f9b6a-2272-4e63-a22e-5cc11daf80e1'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b76f9b6a-2272-4e63-a22e-5cc11daf80e1'::uuid, 'misigana-yigebal', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bikoter-noro ("Bikoter Noro")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b7990c49-8e5a-408c-8b7a-5dab8925eb17'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
በፊትህ አባቴ',
        lyrics_transliteration = 'CHORUS
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
Befith abate',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b7990c49-8e5a-408c-8b7a-5dab8925eb17'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b7990c49-8e5a-408c-8b7a-5dab8925eb17'::uuid, 'bikoter-noro', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- girum-dinik-neh-amilake-bemuhaze-sibihat-dagimawi-deribe ("Girum Dinik Neh Amilake Bemuhaze Sibihat Dagimawi Deribe")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b8a39ab2-9683-43d7-84f1-bdbc462273b4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 1
።።።።።።።
ከቤተ ሳይዳ ያነሳል ባልጋ ያለውን
መጠመቅ ሽቶ እረዳት ወገን ያጣውን
ካጢያተኛው ቤት ይገባል እራት ሊበላ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 2
በቀል አያውቅም ጌታዬ ከፍቅር ሌላ
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 3
እንዳማኑኤል ማንም የለም ፪
።።።።።።።
የበደለውን አይንቅም ያነሳል በእጁ
ፍፁም ይራራል በእውነት ጌታ ለልጁ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 4
ከሳምራዊው ጋር ይውላል እንደ ጉዋደኛ
ሁሉን በፍቅር የሚያስብ ታማኝ እረኛ
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 5
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪
።።።።።።።
ሰው የናቀውን አንስቶ ሾሞ ያከብራል

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 6
ዘይት አፍሶ ባርያውን በእጁ ይቀባል
አክሊል ይደፋል አንስቶ ላጎነበሰው
ክብርና ጋሻ መከታ ዝናር ሊሆነው
እንዳምላካችን ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 7
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪
።።።።።።።

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 8
ያዘነውን ሰው ያፅናናል ፍቅር እየዘራ
ያነሳለታል የጭንቁን ግዙፍ ተራራ
ደግሞ አይኖርም በቤቱ የእስር ቀንበር
እርሱን ተማምኖ የቆመ ከመቅደሱ ስር

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 9
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 10
አሜን ዝማሬ መላእክትን ያሰማልን።

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 1
.......
Kebete sayda yanesal balga yalewn
Met’emeq shto eredat wegen yat’awn
Kat’iyategnaw bet yigebal erat libela

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 2
Beqel ayawqm Getaye kefqr lela
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 3
Endamanuel manm yelem 2
.......
Yebedelewn aynqm yanesal beeju
Fits’um yiraral beewnet Geta lelju

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 4
Kesamrawiw gar yiwlal ende guwadegna
Hulun befqr yemiyasb tamagn eregna
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 5
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2
.......
Sew yenaqewn ansto shomo yakebral

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 6
Zeyt afso baryawn beeju yiqebal
Aklil yidefal ansto lagonebesew
Kibrna gasha meketa zinar lihonew
Endamlakachn manm yelem 2

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 7
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2
.......

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 8
Yazenewn sew yats’nanal fiqr eyezera
Yanesaletal yech’nqun gizuf terara
Degmo aynorm bebetu yeesr qenber
Ersun temamno yeqome kemeqdesu sir

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 9
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 10
Amen zimare melaektn yasemaln.

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 1
።።።።።።።
ከቤተ ሳይዳ ያነሳል ባልጋ ያለውን
መጠመቅ ሽቶ እረዳት ወገን ያጣውን
ካጢያተኛው ቤት ይገባል እራት ሊበላ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 2
በቀል አያውቅም ጌታዬ ከፍቅር ሌላ
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 3
እንዳማኑኤል ማንም የለም ፪
።።።።።።።
የበደለውን አይንቅም ያነሳል በእጁ
ፍፁም ይራራል በእውነት ጌታ ለልጁ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 4
ከሳምራዊው ጋር ይውላል እንደ ጉዋደኛ
ሁሉን በፍቅር የሚያስብ ታማኝ እረኛ
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 5
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪
።።።።።።።
ሰው የናቀውን አንስቶ ሾሞ ያከብራል

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 6
ዘይት አፍሶ ባርያውን በእጁ ይቀባል
አክሊል ይደፋል አንስቶ ላጎነበሰው
ክብርና ጋሻ መከታ ዝናር ሊሆነው
እንዳምላካችን ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 7
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪
።።።።።።።

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 8
ያዘነውን ሰው ያፅናናል ፍቅር እየዘራ
ያነሳለታል የጭንቁን ግዙፍ ተራራ
ደግሞ አይኖርም በቤቱ የእስር ቀንበር
እርሱን ተማምኖ የቆመ ከመቅደሱ ስር

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 9
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 10
አሜን ዝማሬ መላእክትን ያሰማልን።

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ',
        lyrics_transliteration = 'CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 1
.......
Kebete sayda yanesal balga yalewn
Met’emeq shto eredat wegen yat’awn
Kat’iyategnaw bet yigebal erat libela

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 2
Beqel ayawqm Getaye kefqr lela
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 3
Endamanuel manm yelem 2
.......
Yebedelewn aynqm yanesal beeju
Fits’um yiraral beewnet Geta lelju

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 4
Kesamrawiw gar yiwlal ende guwadegna
Hulun befqr yemiyasb tamagn eregna
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 5
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2
.......
Sew yenaqewn ansto shomo yakebral

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 6
Zeyt afso baryawn beeju yiqebal
Aklil yidefal ansto lagonebesew
Kibrna gasha meketa zinar lihonew
Endamlakachn manm yelem 2

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 7
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2
.......

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 8
Yazenewn sew yats’nanal fiqr eyezera
Yanesaletal yech’nqun gizuf terara
Degmo aynorm bebetu yeesr qenber
Ersun temamno yeqome kemeqdesu sir

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 9
Endamlakachn manm yelem 2
Ende egziabher manm yelem 2
Ende fet’ari manm yelem 2
Endamanuel manm yelem 2

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh

VERSE 10
Amen zimare melaektn yasemaln.

CHORUS
Girum dinq neh amlake girum dinq neh
Girum dinq neh Getaye girum dinq neh
Sew yet’alewn kemdr kef tadergaleh
Yeteresawn amlake tastawsaleh',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b8a39ab2-9683-43d7-84f1-bdbc462273b4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 1
።።።።።።።
ከቤተ ሳይዳ ያነሳል ባልጋ ያለውን
መጠመቅ ሽቶ እረዳት ወገን ያጣውን
ካጢያተኛው ቤት ይገባል እራት ሊበላ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 2
በቀል አያውቅም ጌታዬ ከፍቅር ሌላ
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 3
እንዳማኑኤል ማንም የለም ፪
።።።።።።።
የበደለውን አይንቅም ያነሳል በእጁ
ፍፁም ይራራል በእውነት ጌታ ለልጁ

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 4
ከሳምራዊው ጋር ይውላል እንደ ጉዋደኛ
ሁሉን በፍቅር የሚያስብ ታማኝ እረኛ
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 5
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪
።።።።።።።
ሰው የናቀውን አንስቶ ሾሞ ያከብራል

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 6
ዘይት አፍሶ ባርያውን በእጁ ይቀባል
አክሊል ይደፋል አንስቶ ላጎነበሰው
ክብርና ጋሻ መከታ ዝናር ሊሆነው
እንዳምላካችን ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 7
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪
።።።።።።።

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 8
ያዘነውን ሰው ያፅናናል ፍቅር እየዘራ
ያነሳለታል የጭንቁን ግዙፍ ተራራ
ደግሞ አይኖርም በቤቱ የእስር ቀንበር
እርሱን ተማምኖ የቆመ ከመቅደሱ ስር

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 9
እንዳምላካችን ማንም የለም ፪
እንደ እግዚአብሄር ማንም የለም ፪
እንደ ፈጣሪ ማንም የለም ፪
እንዳማኑኤል ማንም የለም ፪

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ

VERSE 10
አሜን ዝማሬ መላእክትን ያሰማልን።

CHORUS
ግሩም ድንቅ ነህ አምላኬ ግሩም ድንቅ ነህ
ግሩም ድንቅ ነህ ጌታዬ ግሩም ድንቅ ነህ
ሰው የጣለውን ከምድር ከፍ ታደርጋለህ
የተረሳውን አምላኬ ታስታውሳለህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b8a39ab2-9683-43d7-84f1-bdbc462273b4'::uuid, 'girum-dinik-neh-amilake-bemuhaze-sibihat-dagimawi-deribe', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yene-tamagn-wedaj ("Yene Tamagn Wedaj")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'bd38bf39-f6ac-405d-aa23-0e274f6cc352'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ሚካኤል አባቴ - ለኔ ደርሶልኛል(፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Mikael abate - lene dersolgnal (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'bd38bf39-f6ac-405d-aa23-0e274f6cc352'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ሚካኤል አባቴ - ለኔ ደርሶልኛል(፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'bd38bf39-f6ac-405d-aa23-0e274f6cc352'::uuid, 'yene-tamagn-wedaj', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zbarekayo-zemarit-tirhas-gebre-egziabher ("Zbarekayo Zemarit Tirhas Gebre Egziabher")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'bdcabe91-a297-4555-a222-e146b456217e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ኣልዒልካ ዘዕረፍካኒ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Alilka zeerefkani'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'bdcabe91-a297-4555-a222-e146b456217e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ኣልዒልካ ዘዕረፍካኒ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'bdcabe91-a297-4555-a222-e146b456217e'::uuid, 'zbarekayo-zemarit-tirhas-gebre-egziabher', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- new-live-version-heartfelt-eritrean-orthodox-worship-song-2024-aboy-zema ("New Live Version Heartfelt Eritrean Orthodox Worship Song 2024 Aboy Zemari Bereket Tikue")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'be29727a-9698-4e66-a70a-c0562b8ec466'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ካባኻ ተፈልያ ኣይጥዓማን ነብሰይ (2)',
        lyrics_transliteration = 'CHORUS
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
Kabaኻ tefelya ayt’aman nebsey (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'be29727a-9698-4e66-a70a-c0562b8ec466'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'be29727a-9698-4e66-a70a-c0562b8ec466'::uuid, 'new-live-version-heartfelt-eritrean-orthodox-worship-song-2024-aboy-zema', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bemin-des-lasegnih-getaye-hoy ("Bemin Des Lasegnih Getaye Hoy")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'bef83a3e-8006-4572-a0c9-ac5001a45f41'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
የፈጠርከው ሁሉ ያንተው አይደለም ወይ',
        lyrics_transliteration = 'CHORUS
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
Yefet’erkew hulu yantew aydelem wey',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'bef83a3e-8006-4572-a0c9-ac5001a45f41'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'bef83a3e-8006-4572-a0c9-ac5001a45f41'::uuid, 'bemin-des-lasegnih-getaye-hoy', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- lela-mn-elalew ("lela mn elalew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c0144fc7-4e60-40a7-8204-70ab8a365965'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
አምላኬ አንተን እያየሁ',
        lyrics_transliteration = 'CHORUS
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
Amlake anten eyayehu',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c0144fc7-4e60-40a7-8204-70ab8a365965'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c0144fc7-4e60-40a7-8204-70ab8a365965'::uuid, 'lela-mn-elalew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- new-ethiopia-orthodox-tewahedo-mezmur-by-zemarit-kidist-mitiku-ende-nech ("NEW ETHIOPIA ORTHODOX TEWAHEDO MEZMUR BY,ZEMARIT KIDIST MITIKUENDE NECH INQU YEMIYABERA")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c01ef378-28d5-467e-a91d-6381bab53dbf'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
አርፈናል ስሟን ስንጠራ(2)',
        lyrics_transliteration = 'CHORUS
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
Arfenal simwan sint’era (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c01ef378-28d5-467e-a91d-6381bab53dbf'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c01ef378-28d5-467e-a91d-6381bab53dbf'::uuid, 'new-ethiopia-orthodox-tewahedo-mezmur-by-zemarit-kidist-mitiku-ende-nech', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- dej-tenahu-koyiche-kidane-mihiretin ("Dej Tenahu Koyiche Kidane Mihiretin")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c062064c-f26a-4efd-bb78-f88303221e42'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 1
ሞገስ ሁኚኝ ቀሪው ዘመኔን(2×)
የመከራው ዘመን አለፈ እንደዋዛ
አንቺን ተጠግቼ የአለሟን ቤዛ፤
የልጅሽ ቸርነት ያአንቺም ደግነት

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 2
ባርያሽን ሰወረኝ ካስጨናቂ ሞት
እናቴ ስምሽን ስጠራ
አለፈ ያሁሉ መከራ፤
እንባዬ ከፊትሽ ፈሰሰ

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 3
እምዬ ባንቺ እየታበሰ፤
ሰላም አለኪ
ልቤ ባንቺ ፀና ከፍከፍም አለ
በጠላቶቼም ላይ አፌ ተናገረ፤

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 4
በማዳንሽ ስራ ባርያሽ ደስ በሎኛል
የሀያላኑን ቀንድ ልጅሽ ሰ���ሮልኛል፤
እናቴ ስምሽን ስጠራ
አለፈ ያሁሉ መከራ፤

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 5
እንባዬ ከፊትሽ ፈሰሰ
እምዬ ባንቺ እየታበሰ፤
ሰላም አለኪ
እጄ በዶ ሲሆን ወዳጆቼም ሸሹ

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 6
በመርገም ምክራቸው ሊለያዩኝ ሲሹ፤
እርሱ የሰጠኝን እርሱ ወሰደ አልኳቸው
እመቤቴ አለችኝ ብዬ አሳፈርኳቸው፤
እናቴ ስምሽን ስጠራ

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 7
አለፈ ያሁሉ መከራ፤
እንባዬ ከፊትሽ ፈሰሰ
እምዬ ባንቺ እየታበሰ፤
ሰላም አለኪ

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 8
ከአውደምህረቱ ሆኜ ስጠራት
ዘንበል ብላ አየቺኝ ኪዳነምህረት፤
ሀሳብሽን ምንም የለም የሚመስለው
እረፍት ያገኘሁት እናቴ ባንቺ ነው

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 9
እናቴ ስምሽን ስጠራ
አለፈ ያሁሉ መከራ፤
እንባዬ ከፊትሽ ፈሰሰ
እምዬ ባንቺ እየታበሰ፤

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 1
Moges hugnign qeriw zemenen(2×)
Yemekeraw zemen alefe endewaza
Anchin tet’egche yealemwan beza;
Yeljsh chernet yaanchim degnet

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 2
Baryashn seweregn kasch’enaqi mot
Enate simshn sit’era
Alefe yahulu mekera;
Enbaye kefitsh fesese

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 3
Emye banchi eyetabese;
Selam aleki
Libe banchi ts’ena kefkefm ale
Bet’elatochem lay afe tenagere;

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 4
Bemadansh sira baryash des belognal
Yeheyalanun qend lijsh se���rolgnal;
Enate simshn sit’era
Alefe yahulu mekera;

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 5
Enbaye kefitsh fesese
Emye banchi eyetabese;
Selam aleki
Eje bedo sihon wedajochem sheshu

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 6
Bemergem mikrachew lileyayugn sishu;
Ersu yeset’egnn ersu wesede alkwachew
Emebete alechgn biye asaferkwachew;
Enate simshn sit’era

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 7
Alefe yahulu mekera;
Enbaye kefitsh fesese
Emye banchi eyetabese;
Selam aleki

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 8
Keawdemhretu hogne sit’erat
Zenbel bila ayechign kidanemhret;
Hesabshn minm yelem yemimeslew
Ereft yagegnehut enate banchi new

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 9
Enate simshn sit’era
Alefe yahulu mekera;
Enbaye kefitsh fesese
Emye banchi eyetabese;

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 1
ሞገስ ሁኚኝ ቀሪው ዘመኔን(2×)
የመከራው ዘመን አለፈ እንደዋዛ
አንቺን ተጠግቼ የአለሟን ቤዛ፤
የልጅሽ ቸርነት ያአንቺም ደግነት

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 2
ባርያሽን ሰወረኝ ካስጨናቂ ሞት
እናቴ ስምሽን ስጠራ
አለፈ ያሁሉ መከራ፤
እንባዬ ከፊትሽ ፈሰሰ

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 3
እምዬ ባንቺ እየታበሰ፤
ሰላም አለኪ
ልቤ ባንቺ ፀና ከፍከፍም አለ
በጠላቶቼም ላይ አፌ ተናገረ፤

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 4
በማዳንሽ ስራ ባርያሽ ደስ በሎኛል
የሀያላኑን ቀንድ ልጅሽ ሰ���ሮልኛል፤
እናቴ ስምሽን ስጠራ
አለፈ ያሁሉ መከራ፤

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 5
እንባዬ ከፊትሽ ፈሰሰ
እምዬ ባንቺ እየታበሰ፤
ሰላም አለኪ
እጄ በዶ ሲሆን ወዳጆቼም ሸሹ

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 6
በመርገም ምክራቸው ሊለያዩኝ ሲሹ፤
እርሱ የሰጠኝን እርሱ ወሰደ አልኳቸው
እመቤቴ አለችኝ ብዬ አሳፈርኳቸው፤
እናቴ ስምሽን ስጠራ

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 7
አለፈ ያሁሉ መከራ፤
እንባዬ ከፊትሽ ፈሰሰ
እምዬ ባንቺ እየታበሰ፤
ሰላም አለኪ

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 8
ከአውደምህረቱ ሆኜ ስጠራት
ዘንበል ብላ አየቺኝ ኪዳነምህረት፤
ሀሳብሽን ምንም የለም የሚመስለው
እረፍት ያገኘሁት እናቴ ባንቺ ነው

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 9
እናቴ ስምሽን ስጠራ
አለፈ ያሁሉ መከራ፤
እንባዬ ከፊትሽ ፈሰሰ
እምዬ ባንቺ እየታበሰ፤

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን',
        lyrics_transliteration = 'CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 1
Moges hugnign qeriw zemenen(2×)
Yemekeraw zemen alefe endewaza
Anchin tet’egche yealemwan beza;
Yeljsh chernet yaanchim degnet

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 2
Baryashn seweregn kasch’enaqi mot
Enate simshn sit’era
Alefe yahulu mekera;
Enbaye kefitsh fesese

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 3
Emye banchi eyetabese;
Selam aleki
Libe banchi ts’ena kefkefm ale
Bet’elatochem lay afe tenagere;

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 4
Bemadansh sira baryash des belognal
Yeheyalanun qend lijsh se���rolgnal;
Enate simshn sit’era
Alefe yahulu mekera;

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 5
Enbaye kefitsh fesese
Emye banchi eyetabese;
Selam aleki
Eje bedo sihon wedajochem sheshu

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 6
Bemergem mikrachew lileyayugn sishu;
Ersu yeset’egnn ersu wesede alkwachew
Emebete alechgn biye asaferkwachew;
Enate simshn sit’era

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 7
Alefe yahulu mekera;
Enbaye kefitsh fesese
Emye banchi eyetabese;
Selam aleki

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 8
Keawdemhretu hogne sit’erat
Zenbel bila ayechign kidanemhret;
Hesabshn minm yelem yemimeslew
Ereft yagegnehut enate banchi new

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen

VERSE 9
Enate simshn sit’era
Alefe yahulu mekera;
Enbaye kefitsh fesese
Emye banchi eyetabese;

CHORUS
Dejt’enahu
Qoyche kidanemhretn
Tets’nanahugn eresaw hezenen;
Yeamlak enat Emebetachen',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c062064c-f26a-4efd-bb78-f88303221e42'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 1
ሞገስ ሁኚኝ ቀሪው ዘመኔን(2×)
የመከራው ዘመን አለፈ እንደዋዛ
አንቺን ተጠግቼ የአለሟን ቤዛ፤
የልጅሽ ቸርነት ያአንቺም ደግነት

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 2
ባርያሽን ሰወረኝ ካስጨናቂ ሞት
እናቴ ስምሽን ስጠራ
አለፈ ያሁሉ መከራ፤
እንባዬ ከፊትሽ ፈሰሰ

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 3
እምዬ ባንቺ እየታበሰ፤
ሰላም አለኪ
ልቤ ባንቺ ፀና ከፍከፍም አለ
በጠላቶቼም ላይ አፌ ተናገረ፤

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 4
በማዳንሽ ስራ ባርያሽ ደስ በሎኛል
የሀያላኑን ቀንድ ልጅሽ ሰ���ሮልኛል፤
እናቴ ስምሽን ስጠራ
አለፈ ያሁሉ መከራ፤

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 5
እንባዬ ከፊትሽ ፈሰሰ
እምዬ ባንቺ እየታበሰ፤
ሰላም አለኪ
እጄ በዶ ሲሆን ወዳጆቼም ሸሹ

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 6
በመርገም ምክራቸው ሊለያዩኝ ሲሹ፤
እርሱ የሰጠኝን እርሱ ወሰደ አልኳቸው
እመቤቴ አለችኝ ብዬ አሳፈርኳቸው፤
እናቴ ስምሽን ስጠራ

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 7
አለፈ ያሁሉ መከራ፤
እንባዬ ከፊትሽ ፈሰሰ
እምዬ ባንቺ እየታበሰ፤
ሰላም አለኪ

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 8
ከአውደምህረቱ ሆኜ ስጠራት
ዘንበል ብላ አየቺኝ ኪዳነምህረት፤
ሀሳብሽን ምንም የለም የሚመስለው
እረፍት ያገኘሁት እናቴ ባንቺ ነው

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን

VERSE 9
እናቴ ስምሽን ስጠራ
አለፈ ያሁሉ መከራ፤
እንባዬ ከፊትሽ ፈሰሰ
እምዬ ባንቺ እየታበሰ፤

CHORUS
ደጅጠናሁ
ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ እረሳው ሀዘኔን፤
የአምላክ እናት እመቤታችን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c062064c-f26a-4efd-bb78-f88303221e42'::uuid, 'dej-tenahu-koyiche-kidane-mihiretin', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ewinetegna-selam-yalew-kebetih-new ("Ewinetegna Selam Yalew Kebetih New")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c2866495-900f-48d2-8359-ba596c6c9a41'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ኃጢያቴን ሳስበው ልቤ ይጨነቃል',
        lyrics_transliteration = 'CHORUS
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
Hat’iyaten sasbew libe yich’eneqal',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c2866495-900f-48d2-8359-ba596c6c9a41'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c2866495-900f-48d2-8359-ba596c6c9a41'::uuid, 'ewinetegna-selam-yalew-kebetih-new', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zewerede-3043 ("Zewerede")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ddf2b167-4654-4269-afe9-ece020b02ce6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ቤዛ ኩሉ ፍጥረት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Beza kulu fit’ret'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ddf2b167-4654-4269-afe9-ece020b02ce6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ቤዛ ኩሉ ፍጥረት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ddf2b167-4654-4269-afe9-ece020b02ce6'::uuid, 'zewerede-3043', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-4179 ("ERITREAN ORTHODOX TEWAHDO MEZMUR")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f5748a2f-cca9-4a81-a429-dc437783cd74'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ተፈንፊኑ ይበሃል ኣኺሉ ጊዜኡ',
        lyrics_transliteration = 'CHORUS
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
Tefenfinu yibehal aኺlu gizeu',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f5748a2f-cca9-4a81-a429-dc437783cd74'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f5748a2f-cca9-4a81-a429-dc437783cd74'::uuid, 'eritrean-orthodox-tewahdo-mezmur-4179', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tigrigna-orthodox-mezmur-by-betelhem-brhane ("Tigrigna Orthodox mezmur By Betelhem Brhane")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ffb049ba-8277-4ae9-8356-f933566b019e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 1
መዓልቲ እንትፈርሰ ዕንይንይ ትገንሖ
ዝወደቐ ኦም ምሳር እንትበዝሖ
ኣብ ጎኑ ደው ይብል ይሰምዕ ናይ ልቡ
ሰብ ንዘይብሉ ሰብ ኣማኑኤል ሰቡ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 2
ኣሜነይ ዝሃብካኒ
ኣሜን ኢኻ ጎይታ
ኣይሓልፎን ዝበልኩ ሪአዮ ሓሊፉ
መዓልቲ ፍተናይ ድኻመይ ዓሪፉ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 3
ነዚ ዘርአየኒ ኣይኮነን ዕድለይ
ካብ ጎይታይ እዩ ኹሉ ካባይ ልኾን የለይ
አሜነይ ዝሃብካኒ
ኣሜን ኢኻ ጎይታ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 4
ካብኡ ዝረሓቓ እንተለዋ መርከባት
ጎይታ ዝቖመላ ሃሰዮማ ማዕበላት
ኣድሕነኒ እንትብሎ ኣእዳው ዘርገሐ
ህድኣተይ መሊሱ ፀልማተይ ኣውገሐ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 5
ኣሜነይ ዝሃብካኒ
ኣሜን ኢኻ ጎይታ
ንምንታይ ይፍተን ዝኣምን ብጎይታ
ናበልኹ እንትነብዕ ተመንጢለ ባህታ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 6
ለካሰ ዝዓበየ ፀጋ ኣዲልዩለይ
እንሆ ዕልልታ መሊእዎ ኣፈይ
አሜነይ ዝሃብካኒ
ኣሜን ኢኻ ጎይታ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni

VERSE 1
Mealti entferse enyny tigenho
Ziwedeቐ om misar entbezho
Ab gonu dew yibl yiseme nay libu
Seb nizeyblu seb amanuel sebu

CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni

VERSE 2
Ameney zihabkani
Amen iኻ goyta
Ayhalfon zibelku riayo halifu
Mealti fitenay diኻmey arifu

CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni

VERSE 3
Nezi zerayeni aykonen edley
Kab goytay eyu ኹlu kabay liኾn yeley
Ameney zihabkani
Amen iኻ goyta

CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni

VERSE 4
Kabu zirehaቓ entelewa merkebat
Goyta ziቖmela haseyoma maebelat
Adhneni entblo aedaw zergehe
Hidatey melisu ts’elmatey awgehe

CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni

VERSE 5
Ameney zihabkani
Amen iኻ goyta
Nimntay yiften ziamn bigoyta
Nabelኹ entnebe tement’ile bahta

CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni

VERSE 6
Lekase ziabeye ts’ega adilyuley
Enho ellta meliewo afey
Ameney zihabkani
Amen iኻ goyta

CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 1
መዓልቲ እንትፈርሰ ዕንይንይ ትገንሖ
ዝወደቐ ኦም ምሳር እንትበዝሖ
ኣብ ጎኑ ደው ይብል ይሰምዕ ናይ ልቡ
ሰብ ንዘይብሉ ሰብ ኣማኑኤል ሰቡ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 2
ኣሜነይ ዝሃብካኒ
ኣሜን ኢኻ ጎይታ
ኣይሓልፎን ዝበልኩ ሪአዮ ሓሊፉ
መዓልቲ ፍተናይ ድኻመይ ዓሪፉ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 3
ነዚ ዘርአየኒ ኣይኮነን ዕድለይ
ካብ ጎይታይ እዩ ኹሉ ካባይ ልኾን የለይ
አሜነይ ዝሃብካኒ
ኣሜን ኢኻ ጎይታ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 4
ካብኡ ዝረሓቓ እንተለዋ መርከባት
ጎይታ ዝቖመላ ሃሰዮማ ማዕበላት
ኣድሕነኒ እንትብሎ ኣእዳው ዘርገሐ
ህድኣተይ መሊሱ ፀልማተይ ኣውገሐ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 5
ኣሜነይ ዝሃብካኒ
ኣሜን ኢኻ ጎይታ
ንምንታይ ይፍተን ዝኣምን ብጎይታ
ናበልኹ እንትነብዕ ተመንጢለ ባህታ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 6
ለካሰ ዝዓበየ ፀጋ ኣዲልዩለይ
እንሆ ዕልልታ መሊእዎ ኣፈይ
አሜነይ ዝሃብካኒ
ኣሜን ኢኻ ጎይታ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ',
        lyrics_transliteration = 'CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni

VERSE 1
Mealti entferse enyny tigenho
Ziwedeቐ om misar entbezho
Ab gonu dew yibl yiseme nay libu
Seb nizeyblu seb amanuel sebu

CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni

VERSE 2
Ameney zihabkani
Amen iኻ goyta
Ayhalfon zibelku riayo halifu
Mealti fitenay diኻmey arifu

CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni

VERSE 3
Nezi zerayeni aykonen edley
Kab goytay eyu ኹlu kabay liኾn yeley
Ameney zihabkani
Amen iኻ goyta

CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni

VERSE 4
Kabu zirehaቓ entelewa merkebat
Goyta ziቖmela haseyoma maebelat
Adhneni entblo aedaw zergehe
Hidatey melisu ts’elmatey awgehe

CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni

VERSE 5
Ameney zihabkani
Amen iኻ goyta
Nimntay yiften ziamn bigoyta
Nabelኹ entnebe tement’ile bahta

CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni

VERSE 6
Lekase ziabeye ts’ega adilyuley
Enho ellta meliewo afey
Ameney zihabkani
Amen iኻ goyta

CHORUS
Ameney zigelhe ch’nqetey definu
Bifቕru eyu ember biserhey do ኾynu
Armmo zihalf entey qal aleni
Melise enthasebo nibat yimets’eni',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ffb049ba-8277-4ae9-8356-f933566b019e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 1
መዓልቲ እንትፈርሰ ዕንይንይ ትገንሖ
ዝወደቐ ኦም ምሳር እንትበዝሖ
ኣብ ጎኑ ደው ይብል ይሰምዕ ናይ ልቡ
ሰብ ንዘይብሉ ሰብ ኣማኑኤል ሰቡ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 2
ኣሜነይ ዝሃብካኒ
ኣሜን ኢኻ ጎይታ
ኣይሓልፎን ዝበልኩ ሪአዮ ሓሊፉ
መዓልቲ ፍተናይ ድኻመይ ዓሪፉ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 3
ነዚ ዘርአየኒ ኣይኮነን ዕድለይ
ካብ ጎይታይ እዩ ኹሉ ካባይ ልኾን የለይ
አሜነይ ዝሃብካኒ
ኣሜን ኢኻ ጎይታ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 4
ካብኡ ዝረሓቓ እንተለዋ መርከባት
ጎይታ ዝቖመላ ሃሰዮማ ማዕበላት
ኣድሕነኒ እንትብሎ ኣእዳው ዘርገሐ
ህድኣተይ መሊሱ ፀልማተይ ኣውገሐ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 5
ኣሜነይ ዝሃብካኒ
ኣሜን ኢኻ ጎይታ
ንምንታይ ይፍተን ዝኣምን ብጎይታ
ናበልኹ እንትነብዕ ተመንጢለ ባህታ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ

VERSE 6
ለካሰ ዝዓበየ ፀጋ ኣዲልዩለይ
እንሆ ዕልልታ መሊእዎ ኣፈይ
አሜነይ ዝሃብካኒ
ኣሜን ኢኻ ጎይታ

CHORUS
ኣሜነይ ዝገልሀ ጭንቀተይ ደፊኑ
ብፍቕሩ እዩ እምበር ብሰርሐይ ዶ ኾይኑ
ኣርምሞ ዝሓልፍ እንተይ ቃል ኣለኒ
መሊሰ እንትሓሰቦ ንብዓት ይመፀኒ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ffb049ba-8277-4ae9-8356-f933566b019e'::uuid, 'tigrigna-orthodox-mezmur-by-betelhem-brhane', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- aboy-mezimur-nay-nisiha-b-zemari-berehet-tikue-new-eritrean-orthodox-mez ("#aboy_mezimur_nay_nisiha_b_zemari_berehet_tikue#New_eritrean_orthodox_mezmur_aboy_2021_Bereket_Tikue")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c6a39cee-dbc3-4cc0-8fe6-06b5458b2ea1'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ካባኻ ተፈልያ ኣይጥዓማን ነብሰይ (2)',
        lyrics_transliteration = 'CHORUS
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
Kabaኻ tefelya ayt’aman nebsey (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c6a39cee-dbc3-4cc0-8fe6-06b5458b2ea1'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c6a39cee-dbc3-4cc0-8fe6-06b5458b2ea1'::uuid, 'aboy-mezimur-nay-nisiha-b-zemari-berehet-tikue-new-eritrean-orthodox-mez', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-1977 ("Eritrean Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c95feebc-5b3d-413f-9a1c-bea0d7c42a99'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ብተነጽፈ ልበይ ክቅበለካ''የ',
        lyrics_transliteration = 'CHORUS
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
Bitenets’fe libey kiqbeleka''ye',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c95feebc-5b3d-413f-9a1c-bea0d7c42a99'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c95feebc-5b3d-413f-9a1c-bea0d7c42a99'::uuid, 'eritrean-orthodox-tewahdo-mezmur-1977', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- dej-tenahu-koyiche-kidane-mihiretini ("Dej Tenahu Koyiche Kidane Mihiretini")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c8b43dbc-958b-4eea-9623-a565ea61c3dd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 1
የመከራው ዘመን አለፈ እንደዋዛ
አንቺን ተጠግቼ የዓለሟን ቤዛ
የልጅሽ ቸርነት የአንቺም ደግነት
ባሪያሽን ሰወረኝ ከአስጨናቂ ሞት

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 2
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 3
አዝ
ልቤ በአንቺ ፀና ከፍ ከፍም አለ
በጠላቶቼም ላይ አፌ ተናገረ
በማዳንሽ ሥራ ባሪያሽ ደስ ብሎኛል

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 4
የኃያሉን ቀስት ልጅሽ ሰብሮልኛል
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 5
እምዬ በአንቺ እየታበሰ ሠላም እለኪ
አዝ
እጄ ባዶ ሲሆን ወዳጆቼም ሸሹ
በመርገም ምክራቸው ሊለይልዩን ሲሹ

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 6
እርሱ የሰጠኝን እርሱ ወሰደ አልኳቸው
እመቤቴ አለችኝ ብዬ አሳፈርኳቸው
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 7
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ
አዝ
ከዓውደ ምህረቱ ሆኜ ስጠራት

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 8
ዘንበል ብላ አየችኝ ኪዳነምህረት
ሐሳብሽን ምንም የለም የሚመስለው
እረፍት ያገኘሁት እናቴ በአንቺ ነው
እናቴ ሥምሽን ስጠራ

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 9
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 1
Yemekeraw zemen alefe endewaza
Anchin tet’egche yealemwan beza
Yeljsh chernet yeanchim degnet
Bariyashn seweregn keasch’enaqi mot

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 2
Enate simshn sit’era
Alefe ya hulu mekera
Enbaye befitsh fesese
Emye beanchi eyetabese selam eleki

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 3
CHORUS
Libe beanchi ts’ena kef kefm ale
Bet’elatochem lay afe tenagere
Bemadansh sira bariyash des bilognal

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 4
Yehayalun qest lijsh sebrolgnal
Enate simshn sit’era
Alefe ya hulu mekera
Enbaye befitsh fesese

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 5
Emye beanchi eyetabese selam eleki
CHORUS
Eje bado sihon wedajochem sheshu
Bemergem mikrachew lileylyun sishu

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 6
Ersu yeset’egnn ersu wesede alkwachew
Emebete alechgn biye asaferkwachew
Enate simshn sit’era
Alefe ya hulu mekera

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 7
Enbaye befitsh fesese
Emye beanchi eyetabese selam eleki
CHORUS
Keawde mihretu hogne sit’erat

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 8
Zenbel bila ayechgn kidanemhret
Hesabshn minm yelem yemimeslew
Ereft yagegnehut enate beanchi new
Enate simshn sit’era

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 9
Alefe ya hulu mekera
Enbaye befitsh fesese
Emye beanchi eyetabese selam eleki

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 1
የመከራው ዘመን አለፈ እንደዋዛ
አንቺን ተጠግቼ የዓለሟን ቤዛ
የልጅሽ ቸርነት የአንቺም ደግነት
ባሪያሽን ሰወረኝ ከአስጨናቂ ሞት

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 2
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 3
አዝ
ልቤ በአንቺ ፀና ከፍ ከፍም አለ
በጠላቶቼም ላይ አፌ ተናገረ
በማዳንሽ ሥራ ባሪያሽ ደስ ብሎኛል

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 4
የኃያሉን ቀስት ልጅሽ ሰብሮልኛል
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 5
እምዬ በአንቺ እየታበሰ ሠላም እለኪ
አዝ
እጄ ባዶ ሲሆን ወዳጆቼም ሸሹ
በመርገም ምክራቸው ሊለይልዩን ሲሹ

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 6
እርሱ የሰጠኝን እርሱ ወሰደ አልኳቸው
እመቤቴ አለችኝ ብዬ አሳፈርኳቸው
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 7
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ
አዝ
ከዓውደ ምህረቱ ሆኜ ስጠራት

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 8
ዘንበል ብላ አየችኝ ኪዳነምህረት
ሐሳብሽን ምንም የለም የሚመስለው
እረፍት ያገኘሁት እናቴ በአንቺ ነው
እናቴ ሥምሽን ስጠራ

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)

VERSE 9
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)',
        lyrics_transliteration = 'CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 1
Yemekeraw zemen alefe endewaza
Anchin tet’egche yealemwan beza
Yeljsh chernet yeanchim degnet
Bariyashn seweregn keasch’enaqi mot

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 2
Enate simshn sit’era
Alefe ya hulu mekera
Enbaye befitsh fesese
Emye beanchi eyetabese selam eleki

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 3
CHORUS
Libe beanchi ts’ena kef kefm ale
Bet’elatochem lay afe tenagere
Bemadansh sira bariyash des bilognal

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 4
Yehayalun qest lijsh sebrolgnal
Enate simshn sit’era
Alefe ya hulu mekera
Enbaye befitsh fesese

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 5
Emye beanchi eyetabese selam eleki
CHORUS
Eje bado sihon wedajochem sheshu
Bemergem mikrachew lileylyun sishu

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 6
Ersu yeset’egnn ersu wesede alkwachew
Emebete alechgn biye asaferkwachew
Enate simshn sit’era
Alefe ya hulu mekera

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 7
Enbaye befitsh fesese
Emye beanchi eyetabese selam eleki
CHORUS
Keawde mihretu hogne sit’erat

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 8
Zenbel bila ayechgn kidanemhret
Hesabshn minm yelem yemimeslew
Ereft yagegnehut enate beanchi new
Enate simshn sit’era

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)

VERSE 9
Alefe ya hulu mekera
Enbaye befitsh fesese
Emye beanchi eyetabese selam eleki

CHORUS
Dej t’enahu qoyche kidanemhretn
Tets’nanahugn resahu hazenen
Yeamlak enat Emebetachen
Moges hugnign qeriw zemenen (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c8b43dbc-958b-4eea-9623-a565ea61c3dd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)
የመከራው ዘመን አለፈ እንደዋዛ
አንቺን ተጠግቼ የዓለሟን ቤዛ
የልጅሽ ቸርነት የአንቺም ደግነት
ባሪያሽን ሰወረኝ ከአስጨናቂ ሞት
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ
አዝ 🌿❤️🌹💚 =========
ልቤ በአንቺ ፀና ከፍ ከፍም አለ
በጠላቶቼም ላይ አፌ ተናገረ
በማዳንሽ ሥራ ባሪያሽ ደስ ብሎኛል
የኃያሉን ቀስት ልጅሽ ሰብሮልኛል
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ
አዝ 🌿❤️🌹💚 ========
እጄ ባዶ ሲሆን ወዳጆቼም ሸሹ
በመርገም ምክራቸው ሊለይልዩን ሲሹ
እርሱ የሰጠኝን እርሱ ወሰደ አልኳቸው
እመቤቴ አለችኝ ብዬ አሳፈርኳቸው
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ
አዝ 🌿❤️🌹💚 ===========
ከዓውደ ምህረቱ ሆኜ ስጠራት
ዘንበል ብላ አየችኝ ኪዳነምህረት
ሐሳብሽን ምንም የለም የሚመስለው
እረፍት ያገኘሁት እናቴ በአንቺ ነው
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ

VERSE 1
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)
የመከራው ዘመን አለፈ እንደዋዛ
አንቺን ተጠግቼ የዓለሟን ቤዛ
የልጅሽ ቸርነት የአንቺም ደግነት
ባሪያሽን ሰወረኝ ከአስጨናቂ ሞት
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ
አዝ 🌿❤️🌹💚 =========
ልቤ በአንቺ ፀና ከፍ ከፍም አለ
በጠላቶቼም ላይ አፌ ተናገረ
በማዳንሽ ሥራ ባሪያሽ ደስ ብሎኛል
የኃያሉን ቀስት ልጅሽ ሰብሮልኛል
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ
አዝ 🌿❤️🌹💚 ========
እጄ ባዶ ሲሆን ወዳጆቼም ሸሹ
በመርገም ምክራቸው ሊለይልዩን ሲሹ
እርሱ የሰጠኝን እርሱ ወሰደ አልኳቸው
እመቤቴ አለችኝ ብዬ አሳፈርኳቸው
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ
አዝ 🌿❤️🌹💚 ===========
ከዓውደ ምህረቱ ሆኜ ስጠራት
ዘንበል ብላ አየችኝ ኪዳነምህረት
ሐሳብሽን ምንም የለም የሚመስለው
እረፍት ያገኘሁት እናቴ በአንቺ ነው
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ

CHORUS
ደጅ ጠናሁ ቆይቼ ኪዳነምህረትን
ተፅናናሁኝ ረሳሁ ሃዘኔን
የአምላክ እናት እመቤታችን
ሞገስ ሁኚኝ ቀሪው ዘመኔን (2)
የመከራው ዘመን አለፈ እንደዋዛ
አንቺን ተጠግቼ የዓለሟን ቤዛ
የልጅሽ ቸርነት የአንቺም ደግነት
ባሪያሽን ሰወረኝ ከአስጨናቂ ሞት
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ
አዝ 🌿❤️🌹💚 =========
ልቤ በአንቺ ፀና ከፍ ከፍም አለ
በጠላቶቼም ላይ አፌ ተናገረ
በማዳንሽ ሥራ ባሪያሽ ደስ ብሎኛል
የኃያሉን ቀስት ልጅሽ ሰብሮልኛል
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ
አዝ 🌿❤️🌹💚 ========
እጄ ባዶ ሲሆን ወዳጆቼም ሸሹ
በመርገም ምክራቸው ሊለይልዩን ሲሹ
እርሱ የሰጠኝን እርሱ ወሰደ አልኳቸው
እመቤቴ አለችኝ ብዬ አሳፈርኳቸው
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ
አዝ 🌿❤️🌹💚 ===========
ከዓውደ ምህረቱ ሆኜ ስጠራት
ዘንበል ብላ አየችኝ ኪዳነምህረት
ሐሳብሽን ምንም የለም የሚመስለው
እረፍት ያገኘሁት እናቴ በአንቺ ነው
እናቴ ሥምሽን ስጠራ
አለፈ ያ ሁሉ መከራ
እንባዬ በፊትሽ ፈሰሰ
እምዬ በአንቺ እየታበሰ ሠላም እለኪ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c8b43dbc-958b-4eea-9623-a565ea61c3dd'::uuid, 'dej-tenahu-koyiche-kidane-mihiretini', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kanite-yehone-melikam-new ("Kanite Yehone Melikam New")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c6e04859-a22c-4019-bcc3-70c19edabec4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም

VERSE 1
ለምለሙን እንጀራ ስቡን ብታበቅልም
በሙላት ወጥታችሁ ባዶ አትመለሱ
የእስራኤልን ቅዱስ ቃል ኪዳን አስታውሱ
ሩት አትለፊ የቦኤዝን እርሻ

CHORUS
ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም

VERSE 2
ጌታ ፈቅዶልሻል የእንጀራሽን ድርሻ
ያለኝ ይበቃኛል ብለው ለሚያምኑት
እጅግ አትርፈዋል ሰላም በረከት
እስማኤል አይደለም የእግዚአብሔር ስጦታ

CHORUS
ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም

VERSE 3
አብርሃም ሆይ ጽና ባለህበት ቦታ
ሰላም እናፍቅር ይዞ የሚመጣው
ይስሐቅ ይወለዳል ቢዘገይም ጊዜው
ሰዶም ብታበቅልም ለምለሙን ቄጤማ

CHORUS
ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም

VERSE 4
ለእግዚአብሔር ልጆች ነች የማትስማማ
ድንጋይ እንኳን ቢመስል የአብርሃም ርስት
ጠግበዋል ልጆቹ ማርና ወተት

CHORUS
ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kante yehonew melkam new (2)
Hulun begizew sitseraw
Kante yehonew melkam new
Yenohamin rist moab aydelechm

VERSE 1
Lemlemun enjera sibun bitabeqlm
Bemulat wet’tachhu bado atmelesu
Yeesraeln Kidus qal kidan astawsu
Rut atlefi yeboezn ersha

CHORUS
Kante yehonew melkam new (2)
Hulun begizew sitseraw
Kante yehonew melkam new
Yenohamin rist moab aydelechm

VERSE 2
Geta feqdolshal yeenjerashn dirsha
Yalegn yibeqagnal bilew lemiyamnut
Ejg atrfewal selam bereket
Esmael aydelem yeEgziabher sit’ota

CHORUS
Kante yehonew melkam new (2)
Hulun begizew sitseraw
Kante yehonew melkam new
Yenohamin rist moab aydelechm

VERSE 3
Abrham hoy ts’na balehbet bota
Selam enafqr yizo yemimet’aw
Yisheq yiweledal bizegeym gizew
Sedom bitabeqlm lemlemun qet’ema

CHORUS
Kante yehonew melkam new (2)
Hulun begizew sitseraw
Kante yehonew melkam new
Yenohamin rist moab aydelechm

VERSE 4
LeEgziabher lijoch nech yematsmama
Dingay enkwan bimesl yeabrham rist
T’egbewal lijochu marna wetet

CHORUS
Kante yehonew melkam new (2)
Hulun begizew sitseraw
Kante yehonew melkam new
Yenohamin rist moab aydelechm'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም

VERSE 1
ለምለሙን እንጀራ ስቡን ብታበቅልም
በሙላት ወጥታችሁ ባዶ አትመለሱ
የእስራኤልን ቅዱስ ቃል ኪዳን አስታውሱ
ሩት አትለፊ የቦኤዝን እርሻ

CHORUS
ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም

VERSE 2
ጌታ ፈቅዶልሻል የእንጀራሽን ድርሻ
ያለኝ ይበቃኛል ብለው ለሚያምኑት
እጅግ አትርፈዋል ሰላም በረከት
እስማኤል አይደለም የእግዚአብሔር ስጦታ

CHORUS
ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም

VERSE 3
አብርሃም ሆይ ጽና ባለህበት ቦታ
ሰላም እናፍቅር ይዞ የሚመጣው
ይስሐቅ ይወለዳል ቢዘገይም ጊዜው
ሰዶም ብታበቅልም ለምለሙን ቄጤማ

CHORUS
ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም

VERSE 4
ለእግዚአብሔር ልጆች ነች የማትስማማ
ድንጋይ እንኳን ቢመስል የአብርሃም ርስት
ጠግበዋል ልጆቹ ማርና ወተት

CHORUS
ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም',
        lyrics_transliteration = 'CHORUS
Kante yehonew melkam new (2)
Hulun begizew sitseraw
Kante yehonew melkam new
Yenohamin rist moab aydelechm

VERSE 1
Lemlemun enjera sibun bitabeqlm
Bemulat wet’tachhu bado atmelesu
Yeesraeln Kidus qal kidan astawsu
Rut atlefi yeboezn ersha

CHORUS
Kante yehonew melkam new (2)
Hulun begizew sitseraw
Kante yehonew melkam new
Yenohamin rist moab aydelechm

VERSE 2
Geta feqdolshal yeenjerashn dirsha
Yalegn yibeqagnal bilew lemiyamnut
Ejg atrfewal selam bereket
Esmael aydelem yeEgziabher sit’ota

CHORUS
Kante yehonew melkam new (2)
Hulun begizew sitseraw
Kante yehonew melkam new
Yenohamin rist moab aydelechm

VERSE 3
Abrham hoy ts’na balehbet bota
Selam enafqr yizo yemimet’aw
Yisheq yiweledal bizegeym gizew
Sedom bitabeqlm lemlemun qet’ema

CHORUS
Kante yehonew melkam new (2)
Hulun begizew sitseraw
Kante yehonew melkam new
Yenohamin rist moab aydelechm

VERSE 4
LeEgziabher lijoch nech yematsmama
Dingay enkwan bimesl yeabrham rist
T’egbewal lijochu marna wetet

CHORUS
Kante yehonew melkam new (2)
Hulun begizew sitseraw
Kante yehonew melkam new
Yenohamin rist moab aydelechm',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c6e04859-a22c-4019-bcc3-70c19edabec4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም

VERSE 1
ለምለሙን እንጀራ ስቡን ብታበቅልም
በሙላት ወጥታችሁ ባዶ አትመለሱ
የእስራኤልን ቅዱስ ቃል ኪዳን አስታውሱ
ሩት አትለፊ የቦኤዝን እርሻ

CHORUS
ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም

VERSE 2
ጌታ ፈቅዶልሻል የእንጀራሽን ድርሻ
ያለኝ ይበቃኛል ብለው ለሚያምኑት
እጅግ አትርፈዋል ሰላም በረከት
እስማኤል አይደለም የእግዚአብሔር ስጦታ

CHORUS
ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም

VERSE 3
አብርሃም ሆይ ጽና ባለህበት ቦታ
ሰላም እናፍቅር ይዞ የሚመጣው
ይስሐቅ ይወለዳል ቢዘገይም ጊዜው
ሰዶም ብታበቅልም ለምለሙን ቄጤማ

CHORUS
ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም

VERSE 4
ለእግዚአብሔር ልጆች ነች የማትስማማ
ድንጋይ እንኳን ቢመስል የአብርሃም ርስት
ጠግበዋል ልጆቹ ማርና ወተት

CHORUS
ካንተ የሆነው መልካም ነው /2/
ሁሉን በጊዜው ስትሰራው
ካንተ የሆነው መልካም ነው
የኖሃሚን ርስት ሞአብ አይደለችም'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c6e04859-a22c-4019-bcc3-70c19edabec4'::uuid, 'kanite-yehone-melikam-new', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- marign-ena-lihid ("Marign Ena Lihid")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'cb6545b5-e537-4898-b720-84c318b15bbf'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ፈውስን ተጠምቼ አቃተኝ መጽናናት',
        lyrics_transliteration = 'CHORUS
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
Fewsn tet’emche aqategn mets’nanat',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'cb6545b5-e537-4898-b720-84c318b15bbf'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'cb6545b5-e537-4898-b720-84c318b15bbf'::uuid, 'marign-ena-lihid', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yetsidik-ber-nesh ("Yetsidik Ber Nesh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'cc24be46-8ecc-481a-aa0a-e5eac38b53ec'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ሐመልማለ ሲና እመቤታችን (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Hemelmale sina Emebetachen (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'cc24be46-8ecc-481a-aa0a-e5eac38b53ec'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ሐመልማለ ሲና እመቤታችን (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'cc24be46-8ecc-481a-aa0a-e5eac38b53ec'::uuid, 'yetsidik-ber-nesh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- simishin-teriche ("Simishin Teriche")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'cd9203b3-d001-4df5-8870-1389d885528b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 1
።።።።።።።።።አዝ።።።።።።።።።።።።።
ጨለማ ውጦኝ በጠላት ሀገር
ለዘመናትም ስረገጥ ስኖር
ዲያቢሎስ ማርኮ ሲያሰቃየኝ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 2
የአለሙን መድን ወለድሽልኝ
ከአባቶች እርስት ከሀገር ወጥቼ
በአሕዛብ ሀገር ስኖር ተሽጬ
ደርሰሽ አፅናንተሽ አከበርሽኝ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 3
ብቸኝነቴን አስረሳሽኝ
።።።።።።።።።አዝ።።።።።።።።።።።።።
ድንኩዋኑ ሞልቶ ሰው ታድሞ
አስተናባሪው በጭንቀት ቆሞ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 4
ምን አቀርባለው ብዬ ስቸገር
ምልጃሽ ደርሶልኝ ዳንኩኝ ከማፈር
ያሰብኩት ሀሳብ ደመና ሆኖ
ቢበተንብኝ እንደ ጉም ተኖ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 5
ይሆናል ያልኩት ሳይሆን ቢቀርም
በእማምላክ እኔስ ተስፍም አልቆርጥም
።።።።።።።።።አዝ።።።።።።።።።።።።።
እናት አባቴ ባያስታውሱኝ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 6
ይቺ አለም ንቃ ገፍታ ብታየኝ
አንቺ ካለሽኝ ምን እሆናለው
አውሎንፍሱን ባህሩን አልፍለው
ጠላቴ ደርሶ ቢያንገላታኝ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 7
መከራ አብዝቶ ቢያሰቃየኝ
አላቁዋርጥም ያንቺን ምስጋና
ውለታሽ ድንግል አለብኝ ገና
።።።።።።።።።አዝ።።።።።።።።።።።።።

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 8
ክፍዎች ደርሰው ቢዝቱብኝ
አንቺን መውደዴን አያስተውኝ
በአሕዛብ መሀል ስምሽን ስጠራ
መከታ ሁኚኝ እናቴ አደራ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 9
ጠላቴ ደርሶ ቢያንገላታኝ
መከራ አብዝቶ ቢያስጨንቀኝ
አልአቁዋርጥም ያንቺን ምስጋና
ውለታሽ ድንግል አለብኝ ገና

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 1
.........az.............
Ch’elema wit’ogn bet’elat heger
Lezemenatm sireget’ sinor
Diyabilos marko siyaseqayegn

CHORUS
Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 2
Yealemun medn weledshlgn
Keabatoch erst keheger wet’che
Beahzab heger sinor teshch’e
Dersesh ats’nantesh akebershgn

CHORUS
Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 3
Bichegnneten asresashgn
.........az.............
Dinkuwanu molto sew tadmo
Astenabariw bech’nqet qomo

CHORUS
Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 4
Min aqerbalew biye sicheger
Miljash dersolgn dankugn kemafer
Yasebkut hesab demena hono
Bibetenbgn ende gum teno

CHORUS
Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 5
Yihonal yalkut sayhon biqerm
Beemamlak enes tesfm alqort’m
.........az.............
Enat abate bayastawsugn

CHORUS
Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 6
Yichi alem niqa gefta bitayegn
Anchi kaleshgn min ehonalew
Awlonfsun bahrun alflew
T’elate derso biyangelatagn

CHORUS
Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 7
Mekera abzto biyaseqayegn
Alaquwart’m yanchin misgana
Wiletash Dingil alebgn gena
.........az.............

CHORUS
Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 8
Kifwoch dersew biztubgn
Anchin mewdeden ayastewgn
Beahzab mehel simshn sit’era
Meketa hugnign enate adera

CHORUS
Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 9
T’elate derso biyangelatagn
Mekera abzto biyasch’enqegn
Alaquwart’m yanchin misgana
Wiletash Dingil alebgn gena

CHORUS
Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 1
።።።።።።።።።አዝ።።።።።።።።።።።።።
ጨለማ ውጦኝ በጠላት ሀገር
ለዘመናትም ስረገጥ ስኖር
ዲያቢሎስ ማርኮ ሲያሰቃየኝ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 2
የአለሙን መድን ወለድሽልኝ
ከአባቶች እርስት ከሀገር ወጥቼ
በአሕዛብ ሀገር ስኖር ተሽጬ
ደርሰሽ አፅናንተሽ አከበርሽኝ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 3
ብቸኝነቴን አስረሳሽኝ
።።።።።።።።።አዝ።።።።።።።።።።።።።
ድንኩዋኑ ሞልቶ ሰው ታድሞ
አስተናባሪው በጭንቀት ቆሞ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 4
ምን አቀርባለው ብዬ ስቸገር
ምልጃሽ ደርሶልኝ ዳንኩኝ ከማፈር
ያሰብኩት ሀሳብ ደመና ሆኖ
ቢበተንብኝ እንደ ጉም ተኖ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 5
ይሆናል ያልኩት ሳይሆን ቢቀርም
በእማምላክ እኔስ ተስፍም አልቆርጥም
።።።።።።።።።አዝ።።።።።።።።።።።።።
እናት አባቴ ባያስታውሱኝ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 6
ይቺ አለም ንቃ ገፍታ ብታየኝ
አንቺ ካለሽኝ ምን እሆናለው
አውሎንፍሱን ባህሩን አልፍለው
ጠላቴ ደርሶ ቢያንገላታኝ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 7
መከራ አብዝቶ ቢያሰቃየኝ
አላቁዋርጥም ያንቺን ምስጋና
ውለታሽ ድንግል አለብኝ ገና
።።።።።።።።።አዝ።።።።።።።።።።።።።

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 8
ክፍዎች ደርሰው ቢዝቱብኝ
አንቺን መውደዴን አያስተውኝ
በአሕዛብ መሀል ስምሽን ስጠራ
መከታ ሁኚኝ እናቴ አደራ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 9
ጠላቴ ደርሶ ቢያንገላታኝ
መከራ አብዝቶ ቢያስጨንቀኝ
አልአቁዋርጥም ያንቺን ምስጋና
ውለታሽ ድንግል አለብኝ ገና

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና',
        lyrics_transliteration = 'CHORUS
Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 1
.........az.............
Ch’elema wit’ogn bet’elat heger
Lezemenatm sireget’ sinor
Diyabilos marko siyaseqayegn

CHORUS
Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 2
Yealemun medn weledshlgn
Keabatoch erst keheger wet’che
Beahzab heger sinor teshch’e
Dersesh ats’nantesh akebershgn

CHORUS
Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 3
Bichegnneten asresashgn
.........az.............
Dinkuwanu molto sew tadmo
Astenabariw bech’nqet qomo

CHORUS
Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 4
Min aqerbalew biye sicheger
Miljash dersolgn dankugn kemafer
Yasebkut hesab demena hono
Bibetenbgn ende gum teno

CHORUS
Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 5
Yihonal yalkut sayhon biqerm
Beemamlak enes tesfm alqort’m
.........az.............
Enat abate bayastawsugn

CHORUS
Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 6
Yichi alem niqa gefta bitayegn
Anchi kaleshgn min ehonalew
Awlonfsun bahrun alflew
T’elate derso biyangelatagn

CHORUS
Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 7
Mekera abzto biyaseqayegn
Alaquwart’m yanchin misgana
Wiletash Dingil alebgn gena
.........az.............

CHORUS
Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 8
Kifwoch dersew biztubgn
Anchin mewdeden ayastewgn
Beahzab mehel simshn sit’era
Meketa hugnign enate adera

CHORUS
Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana

VERSE 9
T’elate derso biyangelatagn
Mekera abzto biyasch’enqegn
Alaquwart’m yanchin misgana
Wiletash Dingil alebgn gena

CHORUS
Simshn t’erche meche afralew
Maryam biye mech ewedqalew
Yemts’nanabet simsh newna
Dingil hoy laqrb lanchi misgana',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'cd9203b3-d001-4df5-8870-1389d885528b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 1
።።።።።።።።።አዝ።።።።።።።።።።።።።
ጨለማ ውጦኝ በጠላት ሀገር
ለዘመናትም ስረገጥ ስኖር
ዲያቢሎስ ማርኮ ሲያሰቃየኝ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 2
የአለሙን መድን ወለድሽልኝ
ከአባቶች እርስት ከሀገር ወጥቼ
በአሕዛብ ሀገር ስኖር ተሽጬ
ደርሰሽ አፅናንተሽ አከበርሽኝ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 3
ብቸኝነቴን አስረሳሽኝ
።።።።።።።።።አዝ።።።።።።።።።።።።።
ድንኩዋኑ ሞልቶ ሰው ታድሞ
አስተናባሪው በጭንቀት ቆሞ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 4
ምን አቀርባለው ብዬ ስቸገር
ምልጃሽ ደርሶልኝ ዳንኩኝ ከማፈር
ያሰብኩት ሀሳብ ደመና ሆኖ
ቢበተንብኝ እንደ ጉም ተኖ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 5
ይሆናል ያልኩት ሳይሆን ቢቀርም
በእማምላክ እኔስ ተስፍም አልቆርጥም
።።።።።።።።።አዝ።።።።።።።።።።።።።
እናት አባቴ ባያስታውሱኝ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 6
ይቺ አለም ንቃ ገፍታ ብታየኝ
አንቺ ካለሽኝ ምን እሆናለው
አውሎንፍሱን ባህሩን አልፍለው
ጠላቴ ደርሶ ቢያንገላታኝ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 7
መከራ አብዝቶ ቢያሰቃየኝ
አላቁዋርጥም ያንቺን ምስጋና
ውለታሽ ድንግል አለብኝ ገና
።።።።።።።።።አዝ።።።።።።።።።።።።።

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 8
ክፍዎች ደርሰው ቢዝቱብኝ
አንቺን መውደዴን አያስተውኝ
በአሕዛብ መሀል ስምሽን ስጠራ
መከታ ሁኚኝ እናቴ አደራ

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና

VERSE 9
ጠላቴ ደርሶ ቢያንገላታኝ
መከራ አብዝቶ ቢያስጨንቀኝ
አልአቁዋርጥም ያንቺን ምስጋና
ውለታሽ ድንግል አለብኝ ገና

CHORUS
ስምሽን ጠርቼ መቼ አፍራለው
ማርያም ብዬ መች እወድቃለው
የምፅናናበት ስምሽ ነውና
ድንግል ሆይ ላቅርብ ላንቺ ምስጋና'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'cd9203b3-d001-4df5-8870-1389d885528b'::uuid, 'simishin-teriche', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- degu-samirawi ("Degu Samirawi")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ce3c53d9-6525-4f9e-a51f-ae1ff591163c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 1
ኣብ ሞንጎ ህይወትን ሞትን እንከለኹ
ዘልዕለኒ ደልየ ብብርቱዕ ጸዋዕኩ
ርጋጽ ሓደ ካህን ካብ ርሑቕ ሰማዕኩ
ንኸልዕለኒ ውን ብዙሕ ተመነኹ

CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 2
ፍንትት ኢሉ ኸደ ተጸይኑ ቁስለይ
መሲሉኒ ኔሩ ዝመጸ መድሕነይ
ሓደ ሌዋዊ ሰብ ብመንገደይ መጸ
ኣልዕለኒ በለት ልበይ እናሓዘነት

CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 3
ናባይ እንክጽጋዕ ርጋጹ ሰሚዐ
ኣልዕለኒ በልኩ ኣእዳወይ ዘርጊሐ
ፍንትት ኢሉ ኸደ ተጸይኑ ቁስለይ
መሲሉኒ ኔሩ ዝመጸ መድሕነይ

CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 4
ሓደ ሳምራዊ ግን ርእዩኒ ቀረበ
ብፍጹም ትሕትና ናባይ ተጸገዐ
ንቑስለይ ሓጺቡ ኣፍሰሰለይ ዘይቱ
ቅንዕ ኣበለኒ ኣእዳዉ ዘርጊሑ

CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 5
ብኽልተ ዲናር ከፊሉ ሓለውቲ
ጐይታይ ኣድሓነኒ ካብ ክፉእ መንጣሊ

CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anta rihruh samrawi hilef bimengedey
Ab wesen iyariko derbyuni ts’elaeyey
Nefsey nab ts’nue mot qeriba’ya zela
Nay alem medhanit Kristos tolo nea Iyesus tolo nea

VERSE 1
Ab mongo hiywetn motn enkeleኹ
Zeleleni delye bibrtue ts’ewaeku
Rigats’ hade kahn kab rihuቕ semaeku
Niኸleleni win bizuh temeneኹ

CHORUS
Anta rihruh samrawi hilef bimengedey
Ab wesen iyariko derbyuni ts’elaeyey
Nefsey nab ts’nue mot qeriba’ya zela
Nay alem medhanit Kristos tolo nea Iyesus tolo nea

VERSE 2
Fintt ilu ኸde tets’eynu qusley
Mesiluni neru zimets’e medhney
Hade lewawi seb bimengedey mets’e
Aleleni belet libey enahazenet

CHORUS
Anta rihruh samrawi hilef bimengedey
Ab wesen iyariko derbyuni ts’elaeyey
Nefsey nab ts’nue mot qeriba’ya zela
Nay alem medhanit Kristos tolo nea Iyesus tolo nea

VERSE 3
Nabay enkts’gae rigats’u semia
Aleleni belku aedawey zergihe
Fintt ilu ኸde tets’eynu qusley
Mesiluni neru zimets’e medhney

CHORUS
Anta rihruh samrawi hilef bimengedey
Ab wesen iyariko derbyuni ts’elaeyey
Nefsey nab ts’nue mot qeriba’ya zela
Nay alem medhanit Kristos tolo nea Iyesus tolo nea

VERSE 4
Hade samrawi gin rieyuni qerebe
Bifts’um tihtna nabay tets’egea
Niቑsley hats’ibu afseseley zeytu
Qine abeleni aedawu zergihu

CHORUS
Anta rihruh samrawi hilef bimengedey
Ab wesen iyariko derbyuni ts’elaeyey
Nefsey nab ts’nue mot qeriba’ya zela
Nay alem medhanit Kristos tolo nea Iyesus tolo nea

VERSE 5
Biኽlte dinar kefilu halewti
Gweytay adhaneni kab kifue ment’ali

CHORUS
Anta rihruh samrawi hilef bimengedey
Ab wesen iyariko derbyuni ts’elaeyey
Nefsey nab ts’nue mot qeriba’ya zela
Nay alem medhanit Kristos tolo nea Iyesus tolo nea'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 1
ኣብ ሞንጎ ህይወትን ሞትን እንከለኹ
ዘልዕለኒ ደልየ ብብርቱዕ ጸዋዕኩ
ርጋጽ ሓደ ካህን ካብ ርሑቕ ሰማዕኩ
ንኸልዕለኒ ውን ብዙሕ ተመነኹ

CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 2
ፍንትት ኢሉ ኸደ ተጸይኑ ቁስለይ
መሲሉኒ ኔሩ ዝመጸ መድሕነይ
ሓደ ሌዋዊ ሰብ ብመንገደይ መጸ
ኣልዕለኒ በለት ልበይ እናሓዘነት

CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 3
ናባይ እንክጽጋዕ ርጋጹ ሰሚዐ
ኣልዕለኒ በልኩ ኣእዳወይ ዘርጊሐ
ፍንትት ኢሉ ኸደ ተጸይኑ ቁስለይ
መሲሉኒ ኔሩ ዝመጸ መድሕነይ

CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 4
ሓደ ሳምራዊ ግን ርእዩኒ ቀረበ
ብፍጹም ትሕትና ናባይ ተጸገዐ
ንቑስለይ ሓጺቡ ኣፍሰሰለይ ዘይቱ
ቅንዕ ኣበለኒ ኣእዳዉ ዘርጊሑ

CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 5
ብኽልተ ዲናር ከፊሉ ሓለውቲ
ጐይታይ ኣድሓነኒ ካብ ክፉእ መንጣሊ

CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ',
        lyrics_transliteration = 'CHORUS
Anta rihruh samrawi hilef bimengedey
Ab wesen iyariko derbyuni ts’elaeyey
Nefsey nab ts’nue mot qeriba’ya zela
Nay alem medhanit Kristos tolo nea Iyesus tolo nea

VERSE 1
Ab mongo hiywetn motn enkeleኹ
Zeleleni delye bibrtue ts’ewaeku
Rigats’ hade kahn kab rihuቕ semaeku
Niኸleleni win bizuh temeneኹ

CHORUS
Anta rihruh samrawi hilef bimengedey
Ab wesen iyariko derbyuni ts’elaeyey
Nefsey nab ts’nue mot qeriba’ya zela
Nay alem medhanit Kristos tolo nea Iyesus tolo nea

VERSE 2
Fintt ilu ኸde tets’eynu qusley
Mesiluni neru zimets’e medhney
Hade lewawi seb bimengedey mets’e
Aleleni belet libey enahazenet

CHORUS
Anta rihruh samrawi hilef bimengedey
Ab wesen iyariko derbyuni ts’elaeyey
Nefsey nab ts’nue mot qeriba’ya zela
Nay alem medhanit Kristos tolo nea Iyesus tolo nea

VERSE 3
Nabay enkts’gae rigats’u semia
Aleleni belku aedawey zergihe
Fintt ilu ኸde tets’eynu qusley
Mesiluni neru zimets’e medhney

CHORUS
Anta rihruh samrawi hilef bimengedey
Ab wesen iyariko derbyuni ts’elaeyey
Nefsey nab ts’nue mot qeriba’ya zela
Nay alem medhanit Kristos tolo nea Iyesus tolo nea

VERSE 4
Hade samrawi gin rieyuni qerebe
Bifts’um tihtna nabay tets’egea
Niቑsley hats’ibu afseseley zeytu
Qine abeleni aedawu zergihu

CHORUS
Anta rihruh samrawi hilef bimengedey
Ab wesen iyariko derbyuni ts’elaeyey
Nefsey nab ts’nue mot qeriba’ya zela
Nay alem medhanit Kristos tolo nea Iyesus tolo nea

VERSE 5
Biኽlte dinar kefilu halewti
Gweytay adhaneni kab kifue ment’ali

CHORUS
Anta rihruh samrawi hilef bimengedey
Ab wesen iyariko derbyuni ts’elaeyey
Nefsey nab ts’nue mot qeriba’ya zela
Nay alem medhanit Kristos tolo nea Iyesus tolo nea',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ce3c53d9-6525-4f9e-a51f-ae1ff591163c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 1
ኣብ ሞንጎ ህይወትን ሞትን እንከለኹ
ዘልዕለኒ ደልየ ብብርቱዕ ጸዋዕኩ
ርጋጽ ሓደ ካህን ካብ ርሑቕ ሰማዕኩ
ንኸልዕለኒ ውን ብዙሕ ተመነኹ

CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 2
ፍንትት ኢሉ ኸደ ተጸይኑ ቁስለይ
መሲሉኒ ኔሩ ዝመጸ መድሕነይ
ሓደ ሌዋዊ ሰብ ብመንገደይ መጸ
ኣልዕለኒ በለት ልበይ እናሓዘነት

CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 3
ናባይ እንክጽጋዕ ርጋጹ ሰሚዐ
ኣልዕለኒ በልኩ ኣእዳወይ ዘርጊሐ
ፍንትት ኢሉ ኸደ ተጸይኑ ቁስለይ
መሲሉኒ ኔሩ ዝመጸ መድሕነይ

CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 4
ሓደ ሳምራዊ ግን ርእዩኒ ቀረበ
ብፍጹም ትሕትና ናባይ ተጸገዐ
ንቑስለይ ሓጺቡ ኣፍሰሰለይ ዘይቱ
ቅንዕ ኣበለኒ ኣእዳዉ ዘርጊሑ

CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ

VERSE 5
ብኽልተ ዲናር ከፊሉ ሓለውቲ
ጐይታይ ኣድሓነኒ ካብ ክፉእ መንጣሊ

CHORUS
ኣንታ ርህሩህ ሳምራዊ ሕለፍ ብመንገደይ
ኣብ ወሰን ኢያሪኮ ደርብዩኒ ጸላእየይ
ነፍሰይ ናብ ጽኑዕ ሞት ቀሪባ’ያ ዘላ
ናይ ዓለም መድሓኒት ክርስቶስ ቶሎ ነዓ ኢየሱስ ቶሎ ነዓ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ce3c53d9-6525-4f9e-a51f-ae1ff591163c'::uuid, 'degu-samirawi', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- amilake-esirael ("Amilake Esirael")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd179a8ee-52ee-406f-9d2a-a33de97b5a10'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
> እንዳንተ ያለ ከየት ይገኛል?',
        lyrics_transliteration = 'CHORUS
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
> endante yale keyet yigegnal?',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd179a8ee-52ee-406f-9d2a-a33de97b5a10'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd179a8ee-52ee-406f-9d2a-a33de97b5a10'::uuid, 'amilake-esirael', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- aminen-tenesitenal ("Aminen Tenesitenal")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd3ec3482-8ada-4c52-a492-2178d2774a14'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ቀኝህ ስትረዳን ምድርን እንወርሳለን',
        lyrics_transliteration = 'CHORUS
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
Qegnh sitredan midrn enwersalen',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd3ec3482-8ada-4c52-a492-2178d2774a14'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd3ec3482-8ada-4c52-a492-2178d2774a14'::uuid, 'aminen-tenesitenal', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ethiopia ("Ethiopia")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd3f2078e-5db9-4146-81f3-e9e86f26eca5'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ገነትን ለማየት',
        lyrics_transliteration = 'CHORUS
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
Genetn lemayet',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd3f2078e-5db9-4146-81f3-e9e86f26eca5'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd3f2078e-5db9-4146-81f3-e9e86f26eca5'::uuid, 'ethiopia', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- elil-belu-beanidinet-zemiru ("Elil Belu Beanidinet Zemiru")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd51077f0-fc22-4687-9fea-e431a0780e59'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 1
በኃጢያት ባርነት ስንኖር ተገዝተን
ከቤቱ ስንርቅ ትእዛዙን አፍርሰን
አይቶ ዝም ላላለን ጠላቶቹ ስንሆን
ውለታው ብዙ ነው ክብር ለዕርሱ ይሁን/2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 2
አ.ዝ //
ራሱን አዋርዶ እኛን አከበረን
ሥጋውና ደሙን ብሉ ጠጡ አለን
መልካም እረኛ ነው የሚያሳጣን የለም

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 3
ምስጋና ይድረሰው ለመድሐኔአለም/2/
አ.ዝ //
ሕይወቱን የሰዋ እንደ አምላክ ማን አለ
ለሰው ልች ብሎ በመስቀል የዋለ

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 4
ፍቅሩ አይለካ አያልቅም ቢወራ
ከሰማያትወርዶ ሆነ ከእኛ ጋራ/2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 5
ሥራውን እናድንቅ እንዲህ ለወደደን
ከማያልቀው ፍቅሩ በረከት ላደለን
ለማይነገረው ለአምላክ ስጦታ
ውዳሴን እናቅርብ እንዘምር በእልልታ /2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ell belu beandnet zemru
Amesgnu lekbru zemrulet
Ende Egziabher yale manm yelem belu
A.z //

VERSE 1
Behat’iyat barnet sinnor tegezten
Kebetu sinrq tiezazun afrsen
Ayto zim lalalen t’elatochu sinhon
Wiletaw bizu new kibir leersu yihun (2)

CHORUS
Ell belu beandnet zemru
Amesgnu lekbru zemrulet
Ende Egziabher yale manm yelem belu
A.z //

VERSE 2
A.z //
Rasun awardo egnan akeberen
Sigawna demun bilu t’et’u alen
Melkam eregna new yemiyasat’an yelem

CHORUS
Ell belu beandnet zemru
Amesgnu lekbru zemrulet
Ende Egziabher yale manm yelem belu
A.z //

VERSE 3
Misgana yidresew lemedhenealem (2)
A.z //
Hiywetun yesewa ende amlak man ale
Lesew lich bilo bemesqel yewale

CHORUS
Ell belu beandnet zemru
Amesgnu lekbru zemrulet
Ende Egziabher yale manm yelem belu
A.z //

VERSE 4
Fiqru ayleka ayalqm biwera
Kesemayatwerdo hone keegna gara (2)

CHORUS
Ell belu beandnet zemru
Amesgnu lekbru zemrulet
Ende Egziabher yale manm yelem belu
A.z //

VERSE 5
Sirawn enadnq endih lewededen
Kemayalqew fiqru bereket ladelen
Lemaynegerew leamlak sit’ota
Widasen enaqrb enzemr beellta (2)

CHORUS
Ell belu beandnet zemru
Amesgnu lekbru zemrulet
Ende Egziabher yale manm yelem belu
A.z //'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 1
በኃጢያት ባርነት ስንኖር ተገዝተን
ከቤቱ ስንርቅ ትእዛዙን አፍርሰን
አይቶ ዝም ላላለን ጠላቶቹ ስንሆን
ውለታው ብዙ ነው ክብር ለዕርሱ ይሁን/2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 2
አ.ዝ //
ራሱን አዋርዶ እኛን አከበረን
ሥጋውና ደሙን ብሉ ጠጡ አለን
መልካም እረኛ ነው የሚያሳጣን የለም

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 3
ምስጋና ይድረሰው ለመድሐኔአለም/2/
አ.ዝ //
ሕይወቱን የሰዋ እንደ አምላክ ማን አለ
ለሰው ልች ብሎ በመስቀል የዋለ

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 4
ፍቅሩ አይለካ አያልቅም ቢወራ
ከሰማያትወርዶ ሆነ ከእኛ ጋራ/2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 5
ሥራውን እናድንቅ እንዲህ ለወደደን
ከማያልቀው ፍቅሩ በረከት ላደለን
ለማይነገረው ለአምላክ ስጦታ
ውዳሴን እናቅርብ እንዘምር በእልልታ /2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //',
        lyrics_transliteration = 'CHORUS
Ell belu beandnet zemru
Amesgnu lekbru zemrulet
Ende Egziabher yale manm yelem belu
A.z //

VERSE 1
Behat’iyat barnet sinnor tegezten
Kebetu sinrq tiezazun afrsen
Ayto zim lalalen t’elatochu sinhon
Wiletaw bizu new kibir leersu yihun (2)

CHORUS
Ell belu beandnet zemru
Amesgnu lekbru zemrulet
Ende Egziabher yale manm yelem belu
A.z //

VERSE 2
A.z //
Rasun awardo egnan akeberen
Sigawna demun bilu t’et’u alen
Melkam eregna new yemiyasat’an yelem

CHORUS
Ell belu beandnet zemru
Amesgnu lekbru zemrulet
Ende Egziabher yale manm yelem belu
A.z //

VERSE 3
Misgana yidresew lemedhenealem (2)
A.z //
Hiywetun yesewa ende amlak man ale
Lesew lich bilo bemesqel yewale

CHORUS
Ell belu beandnet zemru
Amesgnu lekbru zemrulet
Ende Egziabher yale manm yelem belu
A.z //

VERSE 4
Fiqru ayleka ayalqm biwera
Kesemayatwerdo hone keegna gara (2)

CHORUS
Ell belu beandnet zemru
Amesgnu lekbru zemrulet
Ende Egziabher yale manm yelem belu
A.z //

VERSE 5
Sirawn enadnq endih lewededen
Kemayalqew fiqru bereket ladelen
Lemaynegerew leamlak sit’ota
Widasen enaqrb enzemr beellta (2)

CHORUS
Ell belu beandnet zemru
Amesgnu lekbru zemrulet
Ende Egziabher yale manm yelem belu
A.z //',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd51077f0-fc22-4687-9fea-e431a0780e59'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 1
በኃጢያት ባርነት ስንኖር ተገዝተን
ከቤቱ ስንርቅ ትእዛዙን አፍርሰን
አይቶ ዝም ላላለን ጠላቶቹ ስንሆን
ውለታው ብዙ ነው ክብር ለዕርሱ ይሁን/2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 2
አ.ዝ //
ራሱን አዋርዶ እኛን አከበረን
ሥጋውና ደሙን ብሉ ጠጡ አለን
መልካም እረኛ ነው የሚያሳጣን የለም

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 3
ምስጋና ይድረሰው ለመድሐኔአለም/2/
አ.ዝ //
ሕይወቱን የሰዋ እንደ አምላክ ማን አለ
ለሰው ልች ብሎ በመስቀል የዋለ

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 4
ፍቅሩ አይለካ አያልቅም ቢወራ
ከሰማያትወርዶ ሆነ ከእኛ ጋራ/2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //

VERSE 5
ሥራውን እናድንቅ እንዲህ ለወደደን
ከማያልቀው ፍቅሩ በረከት ላደለን
ለማይነገረው ለአምላክ ስጦታ
ውዳሴን እናቅርብ እንዘምር በእልልታ /2/

CHORUS
እልል በሉ በአንድነት ዘምሩ
አመስግኑ ለክብሩ ዘምሩለት
እንደ እግዚአብሔር ያለ ማንም የለም በሉ
አ.ዝ //'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd51077f0-fc22-4687-9fea-e431a0780e59'::uuid, 'elil-belu-beanidinet-zemiru', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- wibete-hoy-nii ("Wibete Hoy Nii")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd5a37571-94c4-497b-9737-65f3a1ba62da'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 1
ላንቺ ነው ማርያም ማኅደረ አዶናይ
ከክርስቶስ ጋራ ነይ ሙሽራዬ
ሸክሜ ይቅለልልኝ ይክሰም መከራዬ
ወጀቡን አሻግረሽ ሰላሜን አውጂ

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 2
ዕድሜዬን አስውቢ መዋዕሌን ዋጂ
ሰበንሽን ይዣለሁ ለምልክት ትእምርት
ከቶማስ በመቅሰም አማናዊን ትም''ህርት
ይታወቅ በይፋ የጽዮን መሆኔ

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 3
ስምሽን እየጠራሁ ይለምልም ዘመኔ
በወንጌል አላፍርም ድንቅ እውነት ልናገር
ማርያም ብፅዕት የእግዚአብሔር ሀገር
ያንደበቴ አውታር የልቤ ቅኝቱ

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 4
ይላል አማላጄ ድንግል አዛኝቱ
በኪዳን በምልጃሽ ዓለሙ ተማረ
የአበው ሱባዔ ፍጻሜው አማረ
አንዲት ነሽ ለሐና መደምደምያ ርግቤ

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 5
ያደራ እናቴ የሕይወት መዝገቤ
ተጎናፅፈሽ ፃይን ላለሽው በቀኙ
አፈወ ፍጥረታት ምስጋናን ተቀኙ
መዳኒታቸውን ኃጣን አይዘነጉ

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 6
ሳይጠሩሽ አያድሩ ባርምሞ አያነጉ
ዳግሚቱ ሰማይ ምድርን የማረክሻት
ወላዲተ ትንቢት ያዳም ጸሎት መሻት
ባንቺ ተመለሰ ከቀድሞው ማደሪያው

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 7
ኪዳነ ምሕረት ኾነሽው መክበሪያው::

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 1
Lanchi new Maryam mahdere adonay
Kekrstos gara ney mushraye
Shekme yiqlellgn yiksem mekeraye
Wejebun ashagresh selamen awji

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 2
Edmeyen aswbi mewaelen waji
Sebenshn yizhalehu lemlkt tiemrt
Ketomas bemeqsem amanawin tim''hirt
Yitaweq beyfa yets’yon mehone

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 3
Simshn eyet’erahu yilemlm zemene
Bewengel alafrm dinq ewnet linager
Maryam bits’et yeEgziabher heger
Yandebete awtar yelbe qigntu

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 4
Yilal amalaje Dingil azagntu
Bekidan bemljash alemu temare
Yeabew subae fits’amew amare
Andit nesh lehena medemdemya rigbe

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 5
Yadera enate yehywet mezgebe
Tegonats’fesh ts’ayn laleshw beqegnu
Afewe fit’retat misganan teqegnu
Medanitachewn hat’an ayzenegu

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 6
Sayt’erush ayadru barmmo ayanegu
Dagmitu semay midrn yemarekshat
Weladite tinbit yadam ts’elot meshat
Banchi temelese keqedmow maderiyaw

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 7
Kidane mihret ኾneshw mekberiyaw::

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 1
ላንቺ ነው ማርያም ማኅደረ አዶናይ
ከክርስቶስ ጋራ ነይ ሙሽራዬ
ሸክሜ ይቅለልልኝ ይክሰም መከራዬ
ወጀቡን አሻግረሽ ሰላሜን አውጂ

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 2
ዕድሜዬን አስውቢ መዋዕሌን ዋጂ
ሰበንሽን ይዣለሁ ለምልክት ትእምርት
ከቶማስ በመቅሰም አማናዊን ትም''ህርት
ይታወቅ በይፋ የጽዮን መሆኔ

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 3
ስምሽን እየጠራሁ ይለምልም ዘመኔ
በወንጌል አላፍርም ድንቅ እውነት ልናገር
ማርያም ብፅዕት የእግዚአብሔር ሀገር
ያንደበቴ አውታር የልቤ ቅኝቱ

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 4
ይላል አማላጄ ድንግል አዛኝቱ
በኪዳን በምልጃሽ ዓለሙ ተማረ
የአበው ሱባዔ ፍጻሜው አማረ
አንዲት ነሽ ለሐና መደምደምያ ርግቤ

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 5
ያደራ እናቴ የሕይወት መዝገቤ
ተጎናፅፈሽ ፃይን ላለሽው በቀኙ
አፈወ ፍጥረታት ምስጋናን ተቀኙ
መዳኒታቸውን ኃጣን አይዘነጉ

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 6
ሳይጠሩሽ አያድሩ ባርምሞ አያነጉ
ዳግሚቱ ሰማይ ምድርን የማረክሻት
ወላዲተ ትንቢት ያዳም ጸሎት መሻት
ባንቺ ተመለሰ ከቀድሞው ማደሪያው

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 7
ኪዳነ ምሕረት ኾነሽው መክበሪያው::

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ',
        lyrics_transliteration = 'CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 1
Lanchi new Maryam mahdere adonay
Kekrstos gara ney mushraye
Shekme yiqlellgn yiksem mekeraye
Wejebun ashagresh selamen awji

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 2
Edmeyen aswbi mewaelen waji
Sebenshn yizhalehu lemlkt tiemrt
Ketomas bemeqsem amanawin tim''hirt
Yitaweq beyfa yets’yon mehone

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 3
Simshn eyet’erahu yilemlm zemene
Bewengel alafrm dinq ewnet linager
Maryam bits’et yeEgziabher heger
Yandebete awtar yelbe qigntu

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 4
Yilal amalaje Dingil azagntu
Bekidan bemljash alemu temare
Yeabew subae fits’amew amare
Andit nesh lehena medemdemya rigbe

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 5
Yadera enate yehywet mezgebe
Tegonats’fesh ts’ayn laleshw beqegnu
Afewe fit’retat misganan teqegnu
Medanitachewn hat’an ayzenegu

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 6
Sayt’erush ayadru barmmo ayanegu
Dagmitu semay midrn yemarekshat
Weladite tinbit yadam ts’elot meshat
Banchi temelese keqedmow maderiyaw

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay

VERSE 7
Kidane mihret ኾneshw mekberiyaw::

CHORUS
Wibete hoy
Wibete hoy nii
Rigbye tensi
Yet’ebibu zema yeselomon ginay',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd5a37571-94c4-497b-9737-65f3a1ba62da'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 1
ላንቺ ነው ማርያም ማኅደረ አዶናይ
ከክርስቶስ ጋራ ነይ ሙሽራዬ
ሸክሜ ይቅለልልኝ ይክሰም መከራዬ
ወጀቡን አሻግረሽ ሰላሜን አውጂ

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 2
ዕድሜዬን አስውቢ መዋዕሌን ዋጂ
ሰበንሽን ይዣለሁ ለምልክት ትእምርት
ከቶማስ በመቅሰም አማናዊን ትም''ህርት
ይታወቅ በይፋ የጽዮን መሆኔ

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 3
ስምሽን እየጠራሁ ይለምልም ዘመኔ
በወንጌል አላፍርም ድንቅ እውነት ልናገር
ማርያም ብፅዕት የእግዚአብሔር ሀገር
ያንደበቴ አውታር የልቤ ቅኝቱ

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 4
ይላል አማላጄ ድንግል አዛኝቱ
በኪዳን በምልጃሽ ዓለሙ ተማረ
የአበው ሱባዔ ፍጻሜው አማረ
አንዲት ነሽ ለሐና መደምደምያ ርግቤ

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 5
ያደራ እናቴ የሕይወት መዝገቤ
ተጎናፅፈሽ ፃይን ላለሽው በቀኙ
አፈወ ፍጥረታት ምስጋናን ተቀኙ
መዳኒታቸውን ኃጣን አይዘነጉ

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 6
ሳይጠሩሽ አያድሩ ባርምሞ አያነጉ
ዳግሚቱ ሰማይ ምድርን የማረክሻት
ወላዲተ ትንቢት ያዳም ጸሎት መሻት
ባንቺ ተመለሰ ከቀድሞው ማደሪያው

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ

VERSE 7
ኪዳነ ምሕረት ኾነሽው መክበሪያው::

CHORUS
ውበቴ ሆይ
ውበቴ ሆይ ንዒ
ርግብየ ተንሥኢ
የጠቢቡ ዜማ የሰሎሞን ግናይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd5a37571-94c4-497b-9737-65f3a1ba62da'::uuid, 'wibete-hoy-nii', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- timikihite-zemedine ("Timikihite Zemedine")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd5dd3f1d-d065-452a-a843-2074d2f36b59'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 1
የሕይወት መሰረት ነሽ ድንግል እናታችን
አንቺን ለኛ ዘርን ባይስቀር
እንደ ጥንቱ እንደ ሰዶም ምድር
ሁላችንም በጠፋን ነበር

CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 2
የአብርሃም ድንኳን ነሽ አምላክ ያደረብሽ
የጌድዮንም ፀምር ለይቶ ያከበረሽ
የእኛ ቤዛ በጉ የተያዘብሽ
የዋህ ርግብ ከአበው ስር የተገኘሽ

CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 3
እፀ ሳቤቅ የሕይወት ሐረግ ነሽ
አምላክ ከሰማይ ሆኖ ይህችን ዓለም ሲቃኝ
ንጽህት ቅድስት ሆነሽ ማርያም አንቺን ቢያገኝ
ትሕትናሽን ሕይወትሽንም ወዶ

CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 4
ቃል ሰው ሆነ ከሰማያት ወርዶ
አከበረሽ በፍጹም ተዋህዶ
የመዳናችን ምክንያት የሰው ልጆች ሰላም
ከኃጢአት ከመርገም የዳነብሽ ዓለም

CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 5
አምስት ሺህ አምስት መቶ ዘመን
በሲኦል ውስጥ ተግዘን የኖርን
ድንግል ባአንቺ ነፃነት አገኘን

CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Timkhte zemedne
Timkhte zemedne (2) Maryam emne
Maryam timkhte zemedne
Yedhdetachn arma yenets’anetachn

VERSE 1
Yehywet meseret nesh Dingil enatachn
Anchin legna zern baysqer
Ende t’ntu ende sedom midr
Hulachnm bet’efan neber

CHORUS
Timkhte zemedne
Timkhte zemedne (2) Maryam emne
Maryam timkhte zemedne
Yedhdetachn arma yenets’anetachn

VERSE 2
Yeabrham dinkwan nesh amlak yaderebsh
Yegedyonm ts’emr leyto yakeberesh
Yeegna beza begu yeteyazebsh
Yewah rigb keabew sir yetegegnesh

CHORUS
Timkhte zemedne
Timkhte zemedne (2) Maryam emne
Maryam timkhte zemedne
Yedhdetachn arma yenets’anetachn

VERSE 3
Ets’e sabeq yehywet hereg nesh
Amlak kesemay hono yihchn alem siqagn
Nits’ht Kidist honesh Maryam anchin biyagegn
Tihtnashn hiywetshnm wedo

CHORUS
Timkhte zemedne
Timkhte zemedne (2) Maryam emne
Maryam timkhte zemedne
Yedhdetachn arma yenets’anetachn

VERSE 4
Qal sew hone kesemayat werdo
Akeberesh befts’um Tewahedo
Yemedanachn miknyat yesew lijoch selam
Kehat’iat kemergem yedanebsh alem

CHORUS
Timkhte zemedne
Timkhte zemedne (2) Maryam emne
Maryam timkhte zemedne
Yedhdetachn arma yenets’anetachn

VERSE 5
Amst shih amst meto zemen
Besiol wist’ tegzen yenorn
Dingil baanchi nets’anet agegnen

CHORUS
Timkhte zemedne
Timkhte zemedne (2) Maryam emne
Maryam timkhte zemedne
Yedhdetachn arma yenets’anetachn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 1
የሕይወት መሰረት ነሽ ድንግል እናታችን
አንቺን ለኛ ዘርን ባይስቀር
እንደ ጥንቱ እንደ ሰዶም ምድር
ሁላችንም በጠፋን ነበር

CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 2
የአብርሃም ድንኳን ነሽ አምላክ ያደረብሽ
የጌድዮንም ፀምር ለይቶ ያከበረሽ
የእኛ ቤዛ በጉ የተያዘብሽ
የዋህ ርግብ ከአበው ስር የተገኘሽ

CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 3
እፀ ሳቤቅ የሕይወት ሐረግ ነሽ
አምላክ ከሰማይ ሆኖ ይህችን ዓለም ሲቃኝ
ንጽህት ቅድስት ሆነሽ ማርያም አንቺን ቢያገኝ
ትሕትናሽን ሕይወትሽንም ወዶ

CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 4
ቃል ሰው ሆነ ከሰማያት ወርዶ
አከበረሽ በፍጹም ተዋህዶ
የመዳናችን ምክንያት የሰው ልጆች ሰላም
ከኃጢአት ከመርገም የዳነብሽ ዓለም

CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 5
አምስት ሺህ አምስት መቶ ዘመን
በሲኦል ውስጥ ተግዘን የኖርን
ድንግል ባአንቺ ነፃነት አገኘን

CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን',
        lyrics_transliteration = 'CHORUS
Timkhte zemedne
Timkhte zemedne (2) Maryam emne
Maryam timkhte zemedne
Yedhdetachn arma yenets’anetachn

VERSE 1
Yehywet meseret nesh Dingil enatachn
Anchin legna zern baysqer
Ende t’ntu ende sedom midr
Hulachnm bet’efan neber

CHORUS
Timkhte zemedne
Timkhte zemedne (2) Maryam emne
Maryam timkhte zemedne
Yedhdetachn arma yenets’anetachn

VERSE 2
Yeabrham dinkwan nesh amlak yaderebsh
Yegedyonm ts’emr leyto yakeberesh
Yeegna beza begu yeteyazebsh
Yewah rigb keabew sir yetegegnesh

CHORUS
Timkhte zemedne
Timkhte zemedne (2) Maryam emne
Maryam timkhte zemedne
Yedhdetachn arma yenets’anetachn

VERSE 3
Ets’e sabeq yehywet hereg nesh
Amlak kesemay hono yihchn alem siqagn
Nits’ht Kidist honesh Maryam anchin biyagegn
Tihtnashn hiywetshnm wedo

CHORUS
Timkhte zemedne
Timkhte zemedne (2) Maryam emne
Maryam timkhte zemedne
Yedhdetachn arma yenets’anetachn

VERSE 4
Qal sew hone kesemayat werdo
Akeberesh befts’um Tewahedo
Yemedanachn miknyat yesew lijoch selam
Kehat’iat kemergem yedanebsh alem

CHORUS
Timkhte zemedne
Timkhte zemedne (2) Maryam emne
Maryam timkhte zemedne
Yedhdetachn arma yenets’anetachn

VERSE 5
Amst shih amst meto zemen
Besiol wist’ tegzen yenorn
Dingil baanchi nets’anet agegnen

CHORUS
Timkhte zemedne
Timkhte zemedne (2) Maryam emne
Maryam timkhte zemedne
Yedhdetachn arma yenets’anetachn',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd5dd3f1d-d065-452a-a843-2074d2f36b59'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 1
የሕይወት መሰረት ነሽ ድንግል እናታችን
አንቺን ለኛ ዘርን ባይስቀር
እንደ ጥንቱ እንደ ሰዶም ምድር
ሁላችንም በጠፋን ነበር

CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 2
የአብርሃም ድንኳን ነሽ አምላክ ያደረብሽ
የጌድዮንም ፀምር ለይቶ ያከበረሽ
የእኛ ቤዛ በጉ የተያዘብሽ
የዋህ ርግብ ከአበው ስር የተገኘሽ

CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 3
እፀ ሳቤቅ የሕይወት ሐረግ ነሽ
አምላክ ከሰማይ ሆኖ ይህችን ዓለም ሲቃኝ
ንጽህት ቅድስት ሆነሽ ማርያም አንቺን ቢያገኝ
ትሕትናሽን ሕይወትሽንም ወዶ

CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 4
ቃል ሰው ሆነ ከሰማያት ወርዶ
አከበረሽ በፍጹም ተዋህዶ
የመዳናችን ምክንያት የሰው ልጆች ሰላም
ከኃጢአት ከመርገም የዳነብሽ ዓለም

CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን

VERSE 5
አምስት ሺህ አምስት መቶ ዘመን
በሲኦል ውስጥ ተግዘን የኖርን
ድንግል ባአንቺ ነፃነት አገኘን

CHORUS
ትምክሕተ ዘመድነ
ትምክሕተ ዘመድነ(፪) ማርያም እምነ
ማርያም ትምክሕተ ዘመድነ
የድኅደታችን አርማ የነፃነታችን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd5dd3f1d-d065-452a-a843-2074d2f36b59'::uuid, 'timikihite-zemedine', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- latitewegn-zemari-yeabkal-desalegn ("Latitewegn zemari yeabkal desalegn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd73dc371-f2d7-4e7e-ab08-f9a6bc4e5829'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ብዙ ቅኔ ውዳሴ ምስጋና አለኝ',
        lyrics_transliteration = 'CHORUS
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
Bizu qine widase misgana alegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd73dc371-f2d7-4e7e-ab08-f9a6bc4e5829'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd73dc371-f2d7-4e7e-ab08-f9a6bc4e5829'::uuid, 'latitewegn-zemari-yeabkal-desalegn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- akotet-nay-like-mezemiran-yilima-hayilu-mezimur-bizemari-di-n-filimona-g ("#akotet_nay Like Mezemiran Yilima Hayilu Mezimur Bizemari Di/n Filimona Gebiru AKOTET ZEMARI D.N FILMONA GEBRU")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd754c19b-4b53-475e-91d6-33615e41ffef'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ስግደት ንዓኻ ይግባእ',
        lyrics_transliteration = 'CHORUS
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
Sigdet niaኻ yigbae',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd754c19b-4b53-475e-91d6-33615e41ffef'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd754c19b-4b53-475e-91d6-33615e41ffef'::uuid, 'akotet-nay-like-mezemiran-yilima-hayilu-mezimur-bizemari-di-n-filimona-g', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kanesagn-kafer-ketibiya-belikesiyuman ("Kanesagn Kafer Ketibiya//belikesiyuman")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd7e8d16a-fa4e-4b13-93c0-f49568b6adea'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 1
አዝ▸▸▸▸▸▸▸▸▸▸►
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ
ስደተኛ ሰው ብሆንም

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 2
አልተለየኝም ልጁን
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የሕይወት ራስ መድኃኒት

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 3
የነፍሴ ክብር ነህና
አዝ▸▸▸▸▸▸▸▸▸▸►
ተነዋወጠ ወይኒው
በመዝሙር ሳወድሰው

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 4
የእጄን ሰንሰለት የፈታ
ብዙ ነው ሥራው የጌታ
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 5
የሕይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና
አዝ▸▸▸▸▸▸▸▸▸▸►
አይቻለሁኝ እጁን

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 6
አብርቶልኛል ፊቱን
በልዑል ጥላ ስኖር
ወሰን በሌለው ፍቅር
ከቤቴ ግባ መምህሩ

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 7
እፈወሳለሁ በጤና
የሕይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 1
CHORUS
Yeanbesochn af yezega
Enen lemadan yetega
Sidetegna sew bihonm

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 2
Alteleyegnm lijun
Kebete giba memhru
Efewesalehu bet’ena
Yehywet ras medhanit

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 3
Yenefse kibir nehna
CHORUS
Tenewawet’e weyniw
Bemezmur sawedsew

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 4
Yeejen senselet yefeta
Bizu new siraw yegeta
Kebete giba memhru
Efewesalehu bet’ena

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 5
Yehywet ras medhanit
Yenefse kibir nehna
CHORUS
Aychalehugn ejun

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 6
Abrtolgnal fitun
Belul t’la sinor
Wesen belelew fiqr
Kebete giba memhru

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 7
Efewesalehu bet’ena
Yehywet ras medhanit
Yenefse kibir nehna

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 1
አዝ▸▸▸▸▸▸▸▸▸▸►
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ
ስደተኛ ሰው ብሆንም

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 2
አልተለየኝም ልጁን
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የሕይወት ራስ መድኃኒት

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 3
የነፍሴ ክብር ነህና
አዝ▸▸▸▸▸▸▸▸▸▸►
ተነዋወጠ ወይኒው
በመዝሙር ሳወድሰው

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 4
የእጄን ሰንሰለት የፈታ
ብዙ ነው ሥራው የጌታ
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 5
የሕይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና
አዝ▸▸▸▸▸▸▸▸▸▸►
አይቻለሁኝ እጁን

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 6
አብርቶልኛል ፊቱን
በልዑል ጥላ ስኖር
ወሰን በሌለው ፍቅር
ከቤቴ ግባ መምህሩ

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 7
እፈወሳለሁ በጤና
የሕይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)',
        lyrics_transliteration = 'CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 1
CHORUS
Yeanbesochn af yezega
Enen lemadan yetega
Sidetegna sew bihonm

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 2
Alteleyegnm lijun
Kebete giba memhru
Efewesalehu bet’ena
Yehywet ras medhanit

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 3
Yenefse kibir nehna
CHORUS
Tenewawet’e weyniw
Bemezmur sawedsew

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 4
Yeejen senselet yefeta
Bizu new siraw yegeta
Kebete giba memhru
Efewesalehu bet’ena

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 5
Yehywet ras medhanit
Yenefse kibir nehna
CHORUS
Aychalehugn ejun

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 6
Abrtolgnal fitun
Belul t’la sinor
Wesen belelew fiqr
Kebete giba memhru

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)

VERSE 7
Efewesalehu bet’ena
Yehywet ras medhanit
Yenefse kibir nehna

CHORUS
Kanesagn keafer ketbiya
Kaqomegn besegenet
Ezemralehu leEgziabher
Bemoges kaget’kubet (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd7e8d16a-fa4e-4b13-93c0-f49568b6adea'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 1
አዝ▸▸▸▸▸▸▸▸▸▸►
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ
ስደተኛ ሰው ብሆንም

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 2
አልተለየኝም ልጁን
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና
የሕይወት ራስ መድኃኒት

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 3
የነፍሴ ክብር ነህና
አዝ▸▸▸▸▸▸▸▸▸▸►
ተነዋወጠ ወይኒው
በመዝሙር ሳወድሰው

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 4
የእጄን ሰንሰለት የፈታ
ብዙ ነው ሥራው የጌታ
ከቤቴ ግባ መምህሩ
እፈወሳለሁ በጤና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 5
የሕይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና
አዝ▸▸▸▸▸▸▸▸▸▸►
አይቻለሁኝ እጁን

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 6
አብርቶልኛል ፊቱን
በልዑል ጥላ ስኖር
ወሰን በሌለው ፍቅር
ከቤቴ ግባ መምህሩ

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)

VERSE 7
እፈወሳለሁ በጤና
የሕይወት ራስ መድኃኒት
የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ከአፈር ከትቢያ
ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር
በሞገስ ካጌጥኩበት (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd7e8d16a-fa4e-4b13-93c0-f49568b6adea'::uuid, 'kanesagn-kafer-ketibiya-belikesiyuman', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
