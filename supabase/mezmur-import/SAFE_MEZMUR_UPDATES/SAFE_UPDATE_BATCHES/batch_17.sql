-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 17 OF 32
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
  -- tsegereda-besimeh-tamegnalehu ("Tsegereda, Besimeh Tamegnalehu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'e4c958b6-b05d-4141-95ab-a045d9068c20'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 1
፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥
፥፥ልኝ
በለስም ባታፈራ ዘይትም ባይኖር
የህሊና ሰላም አለኝ ካንተ ጋር ስኖር

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 2
በአባቶቼ በረከት የበራከኝ
የእስራኤል ታደጊያቸው ክበርልኝ
ዘልአለም ከፍ በል ተመስገንልኝ
፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 3
፥፥፥፥
የፈተናዬ መውጫ መልሴ ነህ አንተ
ጨለማውን አሻግረኝ እልፍኙን ከፍተህ
ስታጽናናኝ ኖሬአለው ለብዙ ዘመን

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 4
ተገፍቶ መች ይወድቃል ባንተ የሚታመን
አይሞትም ይኖራል ባንተ የሚታመን
፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥
፥፥፥፥

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 5
ይቅርታና ምህረትህ እነርሱ ይምሩኝ
ወጥመድና እንቅፋቱ እንዳያደክሙኝ
በጽድቅህ ሃሴት ላድርግ በንተ ልበርታ
መተከዝ ማልቀስ ይብቃኝ አጽናናኝ ጌታ

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 6
ተነግሮ አያልቅም የአምላኬ ውለታ

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 1
::::::::::::::::::::::::::::::
::lgn
Belesm batafera zeytm baynor
Yehlina selam alegn kante gar sinor

CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 2
Beabatoche bereket yeberakegn
Yeesrael tadegiyachew kiberlgn
Zelalem kef bel temesgenlgn
:::::::::::::::::::::::::::::

CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 3
::::
Yefetenaye mewch’a melse neh ante
Ch’elemawn ashagregn elfgnun kefteh
Sitats’nanagn norealew lebzu zemen

CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 4
Tegefto mech yiwedqal bante yemitamen
Aymotm yinoral bante yemitamen
::::::::::::::::::::::::::::::::
::::

CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 5
Yiqrtana mihreth enersu yimrugn
Wet’medna enqfatu endayadekmugn
Bets’dqh haset ladrg bente liberta
Metekez malqes yibqagn ats’nanagn Geta

CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 6
Tenegro ayalqm yeamlake wileta

CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 1
፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥
፥፥ልኝ
በለስም ባታፈራ ዘይትም ባይኖር
የህሊና ሰላም አለኝ ካንተ ጋር ስኖር

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 2
በአባቶቼ በረከት የበራከኝ
የእስራኤል ታደጊያቸው ክበርልኝ
ዘልአለም ከፍ በል ተመስገንልኝ
፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 3
፥፥፥፥
የፈተናዬ መውጫ መልሴ ነህ አንተ
ጨለማውን አሻግረኝ እልፍኙን ከፍተህ
ስታጽናናኝ ኖሬአለው ለብዙ ዘመን

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 4
ተገፍቶ መች ይወድቃል ባንተ የሚታመን
አይሞትም ይኖራል ባንተ የሚታመን
፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥
፥፥፥፥

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 5
ይቅርታና ምህረትህ እነርሱ ይምሩኝ
ወጥመድና እንቅፋቱ እንዳያደክሙኝ
በጽድቅህ ሃሴት ላድርግ በንተ ልበርታ
መተከዝ ማልቀስ ይብቃኝ አጽናናኝ ጌታ

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 6
ተነግሮ አያልቅም የአምላኬ ውለታ

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ',
        lyrics_transliteration = 'CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 1
::::::::::::::::::::::::::::::
::lgn
Belesm batafera zeytm baynor
Yehlina selam alegn kante gar sinor

CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 2
Beabatoche bereket yeberakegn
Yeesrael tadegiyachew kiberlgn
Zelalem kef bel temesgenlgn
:::::::::::::::::::::::::::::

CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 3
::::
Yefetenaye mewch’a melse neh ante
Ch’elemawn ashagregn elfgnun kefteh
Sitats’nanagn norealew lebzu zemen

CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 4
Tegefto mech yiwedqal bante yemitamen
Aymotm yinoral bante yemitamen
::::::::::::::::::::::::::::::::
::::

CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 5
Yiqrtana mihreth enersu yimrugn
Wet’medna enqfatu endayadekmugn
Bets’dqh haset ladrg bente liberta
Metekez malqes yibqagn ats’nanagn Geta

CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite

VERSE 6
Tenegro ayalqm yeamlake wileta

CHORUS
Besmh tamgnalew endattewegn
Lemiyasaddegn t’elat lemot atst’egn
Ts’et’tayen leyteh selem erefte
Guzoyen ante aqnalgn qidem kefite',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'e4c958b6-b05d-4141-95ab-a045d9068c20'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 1
፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥
፥፥ልኝ
በለስም ባታፈራ ዘይትም ባይኖር
የህሊና ሰላም አለኝ ካንተ ጋር ስኖር

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 2
በአባቶቼ በረከት የበራከኝ
የእስራኤል ታደጊያቸው ክበርልኝ
ዘልአለም ከፍ በል ተመስገንልኝ
፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 3
፥፥፥፥
የፈተናዬ መውጫ መልሴ ነህ አንተ
ጨለማውን አሻግረኝ እልፍኙን ከፍተህ
ስታጽናናኝ ኖሬአለው ለብዙ ዘመን

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 4
ተገፍቶ መች ይወድቃል ባንተ የሚታመን
አይሞትም ይኖራል ባንተ የሚታመን
፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥፥
፥፥፥፥

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 5
ይቅርታና ምህረትህ እነርሱ ይምሩኝ
ወጥመድና እንቅፋቱ እንዳያደክሙኝ
በጽድቅህ ሃሴት ላድርግ በንተ ልበርታ
መተከዝ ማልቀስ ይብቃኝ አጽናናኝ ጌታ

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ

VERSE 6
ተነግሮ አያልቅም የአምላኬ ውለታ

CHORUS
በስምህ ታምኛለው እንዳትተወኝ
ለሚያሳድደኝ ጠላት ለሞት አትስጠኝ
ጸጥታዬን ለይተህ ሰለም እረፍቴ
ጉዞዬን አንተ አቅናልኝ ቅደም ከፊቴ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'e4c958b6-b05d-4141-95ab-a045d9068c20'::uuid, 'tsegereda-besimeh-tamegnalehu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ke-karan-seweta ("Ke Karan Seweta")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f0c9a339-74ad-483f-90cc-5f52ee72e857'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ

VERSE 1
በረከት አግኝቼ ዘሬን አበዛሁኝ

CHORUS
ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ

VERSE 2
ሲማኝ ምሬቱ የቀድሞው ኑሮዬ
ከቅርቡ ታሪኬ ጨለመ ኋላዬ
ካራን ያስተማረኝ ተስፋ ቢስ ህይወት ነው
ስጠራኝ ያየሁት የነገን ክብሬን ነው

CHORUS
ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ

VERSE 3
ከቶ ማን ሆኜ ነው እንዲህ ያከበርከኝ
ካህዛብ ለይተህ ከፍ ከፍ ያረከኝ
አብርሐም ሆይ አልከኝ የወደድከኝ አምላክ
ልገዛ ላምልክህ ለክብርህ ልንበርከክ

CHORUS
ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ

VERSE 4
ህዝብህን ታደገው በረከት አይጥፋ
መሆንክን ይወቀው የዘለዓለም ተስፋ
ዓለማመን ይራቅ ጥርጥር ይወገድ
ልጆችህ ይጓዙ በአንዲቱ መንገድ

CHORUS
ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kekaran siwet’a
Kekaran siwet’a wede adisu menged
Alawqm nebere wedet endemhed
Yanten qal new ana bemamen wet’ahugn

VERSE 1
Bereket aggnche zeren abezahugn

CHORUS
Kekaran siwet’a
Kekaran siwet’a wede adisu menged
Alawqm nebere wedet endemhed
Yanten qal new ana bemamen wet’ahugn

VERSE 2
Simagn miretu yeqedmow nuroye
Keqrbu tarike ch’eleme hwalaye
Karan yastemaregn tesfa bis hiywet new
Sit’eragn yayehut yenegen kibren new

CHORUS
Kekaran siwet’a
Kekaran siwet’a wede adisu menged
Alawqm nebere wedet endemhed
Yanten qal new ana bemamen wet’ahugn

VERSE 3
Keto man hogne new endih yakeberkegn
Kahzab leyteh kef kef yarekegn
Abrhem hoy alkegn yewededkegn amlak
Ligeza lamlkh lekbrh linberkek

CHORUS
Kekaran siwet’a
Kekaran siwet’a wede adisu menged
Alawqm nebere wedet endemhed
Yanten qal new ana bemamen wet’ahugn

VERSE 4
Hizbhn tadegew bereket ayt’fa
Mehonkn yiweqew yezelealem tesfa
Alemamen yiraq t’rt’r yiweged
Lijochh yigwazu beanditu menged

CHORUS
Kekaran siwet’a
Kekaran siwet’a wede adisu menged
Alawqm nebere wedet endemhed
Yanten qal new ana bemamen wet’ahugn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ

VERSE 1
በረከት አግኝቼ ዘሬን አበዛሁኝ

CHORUS
ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ

VERSE 2
ሲማኝ ምሬቱ የቀድሞው ኑሮዬ
ከቅርቡ ታሪኬ ጨለመ ኋላዬ
ካራን ያስተማረኝ ተስፋ ቢስ ህይወት ነው
ስጠራኝ ያየሁት የነገን ክብሬን ነው

CHORUS
ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ

VERSE 3
ከቶ ማን ሆኜ ነው እንዲህ ያከበርከኝ
ካህዛብ ለይተህ ከፍ ከፍ ያረከኝ
አብርሐም ሆይ አልከኝ የወደድከኝ አምላክ
ልገዛ ላምልክህ ለክብርህ ልንበርከክ

CHORUS
ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ

VERSE 4
ህዝብህን ታደገው በረከት አይጥፋ
መሆንክን ይወቀው የዘለዓለም ተስፋ
ዓለማመን ይራቅ ጥርጥር ይወገድ
ልጆችህ ይጓዙ በአንዲቱ መንገድ

CHORUS
ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ',
        lyrics_transliteration = 'CHORUS
Kekaran siwet’a
Kekaran siwet’a wede adisu menged
Alawqm nebere wedet endemhed
Yanten qal new ana bemamen wet’ahugn

VERSE 1
Bereket aggnche zeren abezahugn

CHORUS
Kekaran siwet’a
Kekaran siwet’a wede adisu menged
Alawqm nebere wedet endemhed
Yanten qal new ana bemamen wet’ahugn

VERSE 2
Simagn miretu yeqedmow nuroye
Keqrbu tarike ch’eleme hwalaye
Karan yastemaregn tesfa bis hiywet new
Sit’eragn yayehut yenegen kibren new

CHORUS
Kekaran siwet’a
Kekaran siwet’a wede adisu menged
Alawqm nebere wedet endemhed
Yanten qal new ana bemamen wet’ahugn

VERSE 3
Keto man hogne new endih yakeberkegn
Kahzab leyteh kef kef yarekegn
Abrhem hoy alkegn yewededkegn amlak
Ligeza lamlkh lekbrh linberkek

CHORUS
Kekaran siwet’a
Kekaran siwet’a wede adisu menged
Alawqm nebere wedet endemhed
Yanten qal new ana bemamen wet’ahugn

VERSE 4
Hizbhn tadegew bereket ayt’fa
Mehonkn yiweqew yezelealem tesfa
Alemamen yiraq t’rt’r yiweged
Lijochh yigwazu beanditu menged

CHORUS
Kekaran siwet’a
Kekaran siwet’a wede adisu menged
Alawqm nebere wedet endemhed
Yanten qal new ana bemamen wet’ahugn',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f0c9a339-74ad-483f-90cc-5f52ee72e857'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ

VERSE 1
በረከት አግኝቼ ዘሬን አበዛሁኝ

CHORUS
ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ

VERSE 2
ሲማኝ ምሬቱ የቀድሞው ኑሮዬ
ከቅርቡ ታሪኬ ጨለመ ኋላዬ
ካራን ያስተማረኝ ተስፋ ቢስ ህይወት ነው
ስጠራኝ ያየሁት የነገን ክብሬን ነው

CHORUS
ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ

VERSE 3
ከቶ ማን ሆኜ ነው እንዲህ ያከበርከኝ
ካህዛብ ለይተህ ከፍ ከፍ ያረከኝ
አብርሐም ሆይ አልከኝ የወደድከኝ አምላክ
ልገዛ ላምልክህ ለክብርህ ልንበርከክ

CHORUS
ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ

VERSE 4
ህዝብህን ታደገው በረከት አይጥፋ
መሆንክን ይወቀው የዘለዓለም ተስፋ
ዓለማመን ይራቅ ጥርጥር ይወገድ
ልጆችህ ይጓዙ በአንዲቱ መንገድ

CHORUS
ከካራን ስወጣ
ከካራን ስወጣ ወደ አዲሱ መንገድ
አላውቅም ነበረ ወዴት እንደምሄድ
ያንተን ቃል ነው አና በማመን ወጣሁኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f0c9a339-74ad-483f-90cc-5f52ee72e857'::uuid, 'ke-karan-seweta', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sidiben-arqesh ("Sidiben Arqesh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c0fa10f4-3c7b-480d-ae78-83e39a676f8c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 1
አ.ዝ \\

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 2
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 3
ነውር አለብኝ ብዙ ስድብ
አንጀት የሚልጥ ልብ የሚያቆስል
ስሜን ለውጠው ቢያንቋሽሹኝ
በሀዘን በለቅሶ ድንግል መጣሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 4
እንደ ሃና ሆኜ በቤተ መቅደስ
በመረረ ሐዘን ነው የማለቅስ
ፍረጅልን እና ልመለስ ከቤቴ
ሐዘኔን በደስታ ለውጪው እናቴ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 5
በግራም በቀኝም ጠላት ቢከበኝ
አብዝቼ እጮሃለው እናቴ ስሚኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 6
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 7
አ.ዝ \\

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 8
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 9
መከራው በዝቶ ግራ ገብቶኛል
ድምፅሽን ልስማ ያረጋጋኛል
የሰው ህይወቱ ብርቱ ሰልፍ ነው
ደስታና ሐዘን የማይለየው

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 10
በእጃችን ወድቋል ሲሉ ጠላቶቼ
አመለጥኳቸው ስምሽን ጠርቼ
ሰው የዘራውን ያንኑ ያጭዳል
በቆፈረው ጉድጓድ ራሱ ይገባል

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 11
እናቴ እመቤቴ ብዬ ስጠራሽ
ከመከራ ሁሉ ታወጪኛለሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 12
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 13
አ.ዝ \\

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 14
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 15
በሙርኮ ሳለሁ በሰው ሀገር
ግፍ ውለውብኝ ስኖር በእስር
ምልጃሽ ደርሶልኝ ተፈትቻለሁ
በታምራትሽ እኔ ድኛለሁ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 16
ቃልሽን ሰምቶ ጽንሱ ሰገደ
ብላለች ኤልሳቤጥ ነው የተወደደ
የጌታዬ እናት እኔን አሰበችኝ
ታሪኬን ቀይራ ይኽው ባረከችኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 17
የእመቤቴ ከሆንኩ ማን ይቃወመኛል
ወጀቡም ማእበሉም ይታዘዙልኛል

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 18
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 19
አ.ዝ \\

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 20
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 21
ወይንኮ አልቋል የዶኪማስ ቤት
ድንግል አማልጅው ነይ የእኛ እመቤት
ስምሽ ሲጠራ በየቦታው
ይሞላልና የጎደለው

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 22
ግራ የገባው የቸገረው
ድንግልን ይጥራ እንድትረዳው
ሳዝን ስተክዝ የምታጽናና
እናት አለችኝ እርህርህይተ ልቦና

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 23
እናቴ እመቤቴ ብዬ ስጠራሽ
ከመከራ ሁሉ ታወጪኛለሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 24
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 1
Az
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 2
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ
Newr alebign, bizu sidib

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 3
Anjet yemilit’ lib yemiyaqosil
Simen lewtew biyank’washw
Be-hazen be-leqso Dengel met’awñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 4
Ende Hana hone be-bete mekdes
Be-merere hazen new yemalek’es
Fikejilignna limeles ke-bete

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 5
Hazenen bedesta lewichiw enate
Be-giram be-qenyim telat bikebegn
Abizche ichohalew enate simiñ
Sidiben arqesh, newren shefeneshw

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 6
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 7
Az
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 8
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ
Mekeraw bezzito gira gebetognal

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 9
Dimsishin lisma yaregagagnal
Yesew hiywotu birtu self new
Desta na hazen yemayleyew

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 10
Be-ejachen wedkwal silu telatoche
Amelet’k’wachew simishin terchew
Sew yezerawein yaninu yachidal
Be-qoferaw gudguad rasu yigebal

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 11
Enate, Emebete, biye siterash
Ke-mekera hulu tawetchignalish
Sidiben arqesh, newren shefeneshw

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 12
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 13
Az
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 14
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ
Be-murko salehu be-sew hager

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 15
Gif wulewebign sinor be-esir
Miljash dersolign tefet’chalew
Be-tamratish ine dinyalew
Qalishin semto ts’nisu segejde

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 16
Bilalet’ Elsabetch new yetewedede
Ye-getayeh enat enen asebechñ
Tariken qeyra yek’iw barekechñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 17
Ye-Emebete kehonk’u man yiqawemegn
Wejebum ma’ebellum yit’azezulñal
Sidiben arqesh, newren shefeneshw

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 18
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 19
Az
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 20
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ
Weyniko alkwal, ye-Dokimas bet
Dengel amaljiw ney, ye-egna Emebet

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 21
Simish sitera be-yebotaw
Yimolalna ye-godelewe
Gira yegebaw, ye-chegerwe

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 22
Dengel’n yitra endetiredaw
Sazen sitek’iz yemitatsnana
Enat alechñ, erherhiyte libona

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 23
Enate, Emebete, biye siterash
Ke-mekera hulu tawetchignalish
Sidiben arqesh, newren shefeneshw

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 24
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 1
አ.ዝ \\

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 2
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 3
ነውር አለብኝ ብዙ ስድብ
አንጀት የሚልጥ ልብ የሚያቆስል
ስሜን ለውጠው ቢያንቋሽሹኝ
በሀዘን በለቅሶ ድንግል መጣሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 4
እንደ ሃና ሆኜ በቤተ መቅደስ
በመረረ ሐዘን ነው የማለቅስ
ፍረጅልን እና ልመለስ ከቤቴ
ሐዘኔን በደስታ ለውጪው እናቴ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 5
በግራም በቀኝም ጠላት ቢከበኝ
አብዝቼ እጮሃለው እናቴ ስሚኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 6
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 7
አ.ዝ \\

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 8
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 9
መከራው በዝቶ ግራ ገብቶኛል
ድምፅሽን ልስማ ያረጋጋኛል
የሰው ህይወቱ ብርቱ ሰልፍ ነው
ደስታና ሐዘን የማይለየው

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 10
በእጃችን ወድቋል ሲሉ ጠላቶቼ
አመለጥኳቸው ስምሽን ጠርቼ
ሰው የዘራውን ያንኑ ያጭዳል
በቆፈረው ጉድጓድ ራሱ ይገባል

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 11
እናቴ እመቤቴ ብዬ ስጠራሽ
ከመከራ ሁሉ ታወጪኛለሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 12
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 13
አ.ዝ \\

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 14
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 15
በሙርኮ ሳለሁ በሰው ሀገር
ግፍ ውለውብኝ ስኖር በእስር
ምልጃሽ ደርሶልኝ ተፈትቻለሁ
በታምራትሽ እኔ ድኛለሁ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 16
ቃልሽን ሰምቶ ጽንሱ ሰገደ
ብላለች ኤልሳቤጥ ነው የተወደደ
የጌታዬ እናት እኔን አሰበችኝ
ታሪኬን ቀይራ ይኽው ባረከችኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 17
የእመቤቴ ከሆንኩ ማን ይቃወመኛል
ወጀቡም ማእበሉም ይታዘዙልኛል

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 18
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 19
አ.ዝ \\

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 20
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 21
ወይንኮ አልቋል የዶኪማስ ቤት
ድንግል አማልጅው ነይ የእኛ እመቤት
ስምሽ ሲጠራ በየቦታው
ይሞላልና የጎደለው

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 22
ግራ የገባው የቸገረው
ድንግልን ይጥራ እንድትረዳው
ሳዝን ስተክዝ የምታጽናና
እናት አለችኝ እርህርህይተ ልቦና

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 23
እናቴ እመቤቴ ብዬ ስጠራሽ
ከመከራ ሁሉ ታወጪኛለሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 24
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ',
        lyrics_transliteration = 'CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 1
Az
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 2
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ
Newr alebign, bizu sidib

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 3
Anjet yemilit’ lib yemiyaqosil
Simen lewtew biyank’washw
Be-hazen be-leqso Dengel met’awñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 4
Ende Hana hone be-bete mekdes
Be-merere hazen new yemalek’es
Fikejilignna limeles ke-bete

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 5
Hazenen bedesta lewichiw enate
Be-giram be-qenyim telat bikebegn
Abizche ichohalew enate simiñ
Sidiben arqesh, newren shefeneshw

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 6
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 7
Az
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 8
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ
Mekeraw bezzito gira gebetognal

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 9
Dimsishin lisma yaregagagnal
Yesew hiywotu birtu self new
Desta na hazen yemayleyew

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 10
Be-ejachen wedkwal silu telatoche
Amelet’k’wachew simishin terchew
Sew yezerawein yaninu yachidal
Be-qoferaw gudguad rasu yigebal

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 11
Enate, Emebete, biye siterash
Ke-mekera hulu tawetchignalish
Sidiben arqesh, newren shefeneshw

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 12
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 13
Az
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 14
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ
Be-murko salehu be-sew hager

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 15
Gif wulewebign sinor be-esir
Miljash dersolign tefet’chalew
Be-tamratish ine dinyalew
Qalishin semto ts’nisu segejde

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 16
Bilalet’ Elsabetch new yetewedede
Ye-getayeh enat enen asebechñ
Tariken qeyra yek’iw barekechñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 17
Ye-Emebete kehonk’u man yiqawemegn
Wejebum ma’ebellum yit’azezulñal
Sidiben arqesh, newren shefeneshw

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 18
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 19
Az
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 20
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ
Weyniko alkwal, ye-Dokimas bet
Dengel amaljiw ney, ye-egna Emebet

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 21
Simish sitera be-yebotaw
Yimolalna ye-godelewe
Gira yegebaw, ye-chegerwe

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 22
Dengel’n yitra endetiredaw
Sazen sitek’iz yemitatsnana
Enat alechñ, erherhiyte libona

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 23
Enate, Emebete, biye siterash
Ke-mekera hulu tawetchignalish
Sidiben arqesh, newren shefeneshw

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 24
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c0fa10f4-3c7b-480d-ae78-83e39a676f8c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 1
አ.ዝ \\

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 2
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 3
ነውር አለብኝ ብዙ ስድብ
አንጀት የሚልጥ ልብ የሚያቆስል
ስሜን ለውጠው ቢያንቋሽሹኝ
በሀዘን በለቅሶ ድንግል መጣሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 4
እንደ ሃና ሆኜ በቤተ መቅደስ
በመረረ ሐዘን ነው የማለቅስ
ፍረጅልን እና ልመለስ ከቤቴ
ሐዘኔን በደስታ ለውጪው እናቴ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 5
በግራም በቀኝም ጠላት ቢከበኝ
አብዝቼ እጮሃለው እናቴ ስሚኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 6
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 7
አ.ዝ \\

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 8
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 9
መከራው በዝቶ ግራ ገብቶኛል
ድምፅሽን ልስማ ያረጋጋኛል
የሰው ህይወቱ ብርቱ ሰልፍ ነው
ደስታና ሐዘን የማይለየው

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 10
በእጃችን ወድቋል ሲሉ ጠላቶቼ
አመለጥኳቸው ስምሽን ጠርቼ
ሰው የዘራውን ያንኑ ያጭዳል
በቆፈረው ጉድጓድ ራሱ ይገባል

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 11
እናቴ እመቤቴ ብዬ ስጠራሽ
ከመከራ ሁሉ ታወጪኛለሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 12
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 13
አ.ዝ \\

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 14
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 15
በሙርኮ ሳለሁ በሰው ሀገር
ግፍ ውለውብኝ ስኖር በእስር
ምልጃሽ ደርሶልኝ ተፈትቻለሁ
በታምራትሽ እኔ ድኛለሁ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 16
ቃልሽን ሰምቶ ጽንሱ ሰገደ
ብላለች ኤልሳቤጥ ነው የተወደደ
የጌታዬ እናት እኔን አሰበችኝ
ታሪኬን ቀይራ ይኽው ባረከችኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 17
የእመቤቴ ከሆንኩ ማን ይቃወመኛል
ወጀቡም ማእበሉም ይታዘዙልኛል

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 18
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 19
አ.ዝ \\

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 20
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 21
ወይንኮ አልቋል የዶኪማስ ቤት
ድንግል አማልጅው ነይ የእኛ እመቤት
ስምሽ ሲጠራ በየቦታው
ይሞላልና የጎደለው

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 22
ግራ የገባው የቸገረው
ድንግልን ይጥራ እንድትረዳው
ሳዝን ስተክዝ የምታጽናና
እናት አለችኝ እርህርህይተ ልቦና

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 23
እናቴ እመቤቴ ብዬ ስጠራሽ
ከመከራ ሁሉ ታወጪኛለሽ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

VERSE 24
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ

CHORUS
ስድቤን አርቀሽ ነውሬን ሸፈንሽው
እማ አምላክ በአንቺ መቼም አላፍርም
ስምሽን ጠርቼ እጽናናለሁኝ
ሀዘኔን በአንቺ እረሳለሁኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 1
Az
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 2
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ
Newr alebign, bizu sidib

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 3
Anjet yemilit’ lib yemiyaqosil
Simen lewtew biyank’washw
Be-hazen be-leqso Dengel met’awñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 4
Ende Hana hone be-bete mekdes
Be-merere hazen new yemalek’es
Fikejilignna limeles ke-bete

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 5
Hazenen bedesta lewichiw enate
Be-giram be-qenyim telat bikebegn
Abizche ichohalew enate simiñ
Sidiben arqesh, newren shefeneshw

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 6
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 7
Az
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 8
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ
Mekeraw bezzito gira gebetognal

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 9
Dimsishin lisma yaregagagnal
Yesew hiywotu birtu self new
Desta na hazen yemayleyew

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 10
Be-ejachen wedkwal silu telatoche
Amelet’k’wachew simishin terchew
Sew yezerawein yaninu yachidal
Be-qoferaw gudguad rasu yigebal

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 11
Enate, Emebete, biye siterash
Ke-mekera hulu tawetchignalish
Sidiben arqesh, newren shefeneshw

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 12
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 13
Az
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 14
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ
Be-murko salehu be-sew hager

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 15
Gif wulewebign sinor be-esir
Miljash dersolign tefet’chalew
Be-tamratish ine dinyalew
Qalishin semto ts’nisu segejde

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 16
Bilalet’ Elsabetch new yetewedede
Ye-getayeh enat enen asebechñ
Tariken qeyra yek’iw barekechñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 17
Ye-Emebete kehonk’u man yiqawemegn
Wejebum ma’ebellum yit’azezulñal
Sidiben arqesh, newren shefeneshw

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 18
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 19
Az
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 20
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ
Weyniko alkwal, ye-Dokimas bet
Dengel amaljiw ney, ye-egna Emebet

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 21
Simish sitera be-yebotaw
Yimolalna ye-godelewe
Gira yegebaw, ye-chegerwe

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 22
Dengel’n yitra endetiredaw
Sazen sitek’iz yemitatsnana
Enat alechñ, erherhiyte libona

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 23
Enate, Emebete, biye siterash
Ke-mekera hulu tawetchignalish
Sidiben arqesh, newren shefeneshw

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

VERSE 24
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ

CHORUS
Sidiben arqesh, newren shefeneshw
Ema Amlak be-anchi mechem alafirm
Simeshin terche itsnanalewñ
Hazenen be-anchi iresalewñ';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c0fa10f4-3c7b-480d-ae78-83e39a676f8c'::uuid, 'sidiben-arqesh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nsu-eyu-eritrean-orthodox-tewahdo-mezmur-zemari-bereket-tikue ("Nsu eyu / Eritrean orthodox tewahdo mezmur / zemari Bereket Tikue")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '759e7bb0-c98e-4971-9225-fa4eed36387b'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ንሱ ''ዩ ምኽንያቱ ኢየሱስ ጎይታይ',
        lyrics_transliteration = 'CHORUS
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
Nisu ''yu miኽnyatu Iyesus goytay',
        updated_at = clock_timestamp()::text
    WHERE import_id = '759e7bb0-c98e-4971-9225-fa4eed36387b'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '759e7bb0-c98e-4971-9225-fa4eed36387b'::uuid, 'nsu-eyu-eritrean-orthodox-tewahdo-mezmur-zemari-bereket-tikue', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yohans-mohammed ("Yohans Mohammed")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7774a468-f816-4d85-a9e4-3eec11f6182e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ተወለደ ኢየሱስ አዳኝ ንጉሣችን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Tewelede Iyesus adagn nigusachn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '7774a468-f816-4d85-a9e4-3eec11f6182e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ተወለደ ኢየሱስ አዳኝ ንጉሣችን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7774a468-f816-4d85-a9e4-3eec11f6182e'::uuid, 'yohans-mohammed', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- na-medhanite ("na medhanite")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c4bf1504-0095-4550-9446-747dbf5e444a'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ፍቅርህን አልብሰኝ ይቅር መራቆቴ /2/',
        lyrics_transliteration = 'CHORUS
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
Fiqrhn albsegn yiqr meraqote (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c4bf1504-0095-4550-9446-747dbf5e444a'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c4bf1504-0095-4550-9446-747dbf5e444a'::uuid, 'na-medhanite', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- teklehaymanot-live-mezmur ("Teklehaymanot / / Live mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7807ca5a-c4fd-48a2-befa-45a0cee4d79d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 1
ደጊም ፈትየ አለኹ ክመስል ንዓኻ
ከምቲ ንስኻ እዉን ንክርስቶስ ዝመሰልካ። /2/''
ሽሕ እዃ እንተነበረ ሕሬት ኣዕቢኻዮ ግና ጸጋኻ ብእምነት
ብልቢ ስዒብካ ቃል ወንጌል ክርስቶስ

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 2
ናይ ስጋ ገዲፍካስ ነቢርካ ብመንፈስ
አብሎ ንልበይ ብጥበብ ጸጋኻ
ድሕሪት ተመሊሰ ክነብሮ ምንባርካ።
እቲ ዝመስል

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 3
ቃል አምለኽ ምዃኑ ምስጢር ምግቢ ህይወት
ኪንዮ ብልዒ ስጋ ናይ ነፍሲ ዕንጋሎት
ሰሪጹ አብ ልብኻ ህያዉ ናይ ጎይታ ቃል
ወጺኻዮ ብጾም ተመስገን ብምባል

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 4
ንገሮ ንኸርሰይ ነቲ ስሱዕ ሸዉሃት
ብልዒ ንኸብዲ እምበር ከም ዘየዉህብ ህይወት
እቲ ዝመስል
አብቲ ከቢድ እዋን ተፈታኒ ህሞት

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 5
ቅልስ ምስ ሰይጣን ወጺኻ ብዓወት
መሳርያ ኣይነበረን ናይ ዓወትካ ሚስጢር
ጾም ጸሎት እዩ ነይሩ እቲ ናይ ጽድቂ ኣጽዋር
ኩሉ ትናኻ አብነት ጽድቂ ኢኻ

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 6
ወሲነ ክለበሶ ዕጥቂ ናይ ገልኻ
እቲ
እስቲ ተመልከቱ ነቶም መራሕትኹም
ኣሰሮም ሰዓቡ ገድሎም እናስተንተንኩም

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 7
ከም ዝበሎ ጎይታ ኣብቲ ቅዱስ ወንጌል
ተበጊሰ አለኹ ንዓኻ ክመስል
እንተ ኣነ ግና ካባኻ ዝደሊ ተኽልየ ጸሎትካ እዩ ዘዉህበኒ ሓይሊ።
እቲ ዝመስል

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 1
Degim fetye aleኹ kimesl niaኻ
Kemti nisኻ ewun nikrstos zimeselka. (2)''
Shh ekhwa entenebere hiret aebiኻyo gina ts’egaኻ biemnet
Bilbi siibka qal wengel Kristos

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 2
Nay siga gedifkas nebirka bimenfes
Ablo nilbey bit’beb ts’egaኻ
Dihrit temelise kinebro minbarka.
Eti zimesl

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 3
Qal amleኽ mikhwanu mist’ir migbi hiywet
Kinyo bili siga nay nefsi engalot
Serits’u Ab libኻ hiyawu nay goyta qal
Wets’iኻyo bits’om temesgen bimbal

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 4
Nigero niኸrsey neti sisue shewuhat
Bili niኸbdi ember kem zeyewuhb hiywet
Eti zimesl
Abti kebid ewan tefetani himot

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 5
Qils mis seyt’an wets’iኻ biawet
Mesarya ayneberen nay awetka mist’ir
Ts’om ts’elot eyu neyru eti nay ts’dqi ats’war
Kulu tinaኻ abnet ts’dqi iኻ

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 6
Wesine kilebeso et’qi nay gelኻ
Eti
Esti temelketu netom merahtኹm
Aserom seabu gedlom enastentenkum

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 7
Kem zibelo goyta abti Kidus wengel
Tebegise aleኹ niaኻ kimesl
Ente ane gina kabaኻ zideli teኽlye ts’elotka eyu zewuhbeni hayli.
Eti zimesl

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 1
ደጊም ፈትየ አለኹ ክመስል ንዓኻ
ከምቲ ንስኻ እዉን ንክርስቶስ ዝመሰልካ። /2/''
ሽሕ እዃ እንተነበረ ሕሬት ኣዕቢኻዮ ግና ጸጋኻ ብእምነት
ብልቢ ስዒብካ ቃል ወንጌል ክርስቶስ

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 2
ናይ ስጋ ገዲፍካስ ነቢርካ ብመንፈስ
አብሎ ንልበይ ብጥበብ ጸጋኻ
ድሕሪት ተመሊሰ ክነብሮ ምንባርካ።
እቲ ዝመስል

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 3
ቃል አምለኽ ምዃኑ ምስጢር ምግቢ ህይወት
ኪንዮ ብልዒ ስጋ ናይ ነፍሲ ዕንጋሎት
ሰሪጹ አብ ልብኻ ህያዉ ናይ ጎይታ ቃል
ወጺኻዮ ብጾም ተመስገን ብምባል

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 4
ንገሮ ንኸርሰይ ነቲ ስሱዕ ሸዉሃት
ብልዒ ንኸብዲ እምበር ከም ዘየዉህብ ህይወት
እቲ ዝመስል
አብቲ ከቢድ እዋን ተፈታኒ ህሞት

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 5
ቅልስ ምስ ሰይጣን ወጺኻ ብዓወት
መሳርያ ኣይነበረን ናይ ዓወትካ ሚስጢር
ጾም ጸሎት እዩ ነይሩ እቲ ናይ ጽድቂ ኣጽዋር
ኩሉ ትናኻ አብነት ጽድቂ ኢኻ

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 6
ወሲነ ክለበሶ ዕጥቂ ናይ ገልኻ
እቲ
እስቲ ተመልከቱ ነቶም መራሕትኹም
ኣሰሮም ሰዓቡ ገድሎም እናስተንተንኩም

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 7
ከም ዝበሎ ጎይታ ኣብቲ ቅዱስ ወንጌል
ተበጊሰ አለኹ ንዓኻ ክመስል
እንተ ኣነ ግና ካባኻ ዝደሊ ተኽልየ ጸሎትካ እዩ ዘዉህበኒ ሓይሊ።
እቲ ዝመስል

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ',
        lyrics_transliteration = 'CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 1
Degim fetye aleኹ kimesl niaኻ
Kemti nisኻ ewun nikrstos zimeselka. (2)''
Shh ekhwa entenebere hiret aebiኻyo gina ts’egaኻ biemnet
Bilbi siibka qal wengel Kristos

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 2
Nay siga gedifkas nebirka bimenfes
Ablo nilbey bit’beb ts’egaኻ
Dihrit temelise kinebro minbarka.
Eti zimesl

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 3
Qal amleኽ mikhwanu mist’ir migbi hiywet
Kinyo bili siga nay nefsi engalot
Serits’u Ab libኻ hiyawu nay goyta qal
Wets’iኻyo bits’om temesgen bimbal

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 4
Nigero niኸrsey neti sisue shewuhat
Bili niኸbdi ember kem zeyewuhb hiywet
Eti zimesl
Abti kebid ewan tefetani himot

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 5
Qils mis seyt’an wets’iኻ biawet
Mesarya ayneberen nay awetka mist’ir
Ts’om ts’elot eyu neyru eti nay ts’dqi ats’war
Kulu tinaኻ abnet ts’dqi iኻ

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 6
Wesine kilebeso et’qi nay gelኻ
Eti
Esti temelketu netom merahtኹm
Aserom seabu gedlom enastentenkum

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri

VERSE 7
Kem zibelo goyta abti Kidus wengel
Tebegise aleኹ niaኻ kimesl
Ente ane gina kabaኻ zideli teኽlye ts’elotka eyu zewuhbeni hayli.
Eti zimesl

CHORUS
Eti zimesl bifts’um zeykeal
Ziኸalka bihayli eti liul
Kinyo hasab nebirka bigbri
Zitelabeska nay Kidusan kibri',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7807ca5a-c4fd-48a2-befa-45a0cee4d79d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 1
ደጊም ፈትየ አለኹ ክመስል ንዓኻ
ከምቲ ንስኻ እዉን ንክርስቶስ ዝመሰልካ። /2/''
ሽሕ እዃ እንተነበረ ሕሬት ኣዕቢኻዮ ግና ጸጋኻ ብእምነት
ብልቢ ስዒብካ ቃል ወንጌል ክርስቶስ

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 2
ናይ ስጋ ገዲፍካስ ነቢርካ ብመንፈስ
አብሎ ንልበይ ብጥበብ ጸጋኻ
ድሕሪት ተመሊሰ ክነብሮ ምንባርካ።
እቲ ዝመስል

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 3
ቃል አምለኽ ምዃኑ ምስጢር ምግቢ ህይወት
ኪንዮ ብልዒ ስጋ ናይ ነፍሲ ዕንጋሎት
ሰሪጹ አብ ልብኻ ህያዉ ናይ ጎይታ ቃል
ወጺኻዮ ብጾም ተመስገን ብምባል

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 4
ንገሮ ንኸርሰይ ነቲ ስሱዕ ሸዉሃት
ብልዒ ንኸብዲ እምበር ከም ዘየዉህብ ህይወት
እቲ ዝመስል
አብቲ ከቢድ እዋን ተፈታኒ ህሞት

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 5
ቅልስ ምስ ሰይጣን ወጺኻ ብዓወት
መሳርያ ኣይነበረን ናይ ዓወትካ ሚስጢር
ጾም ጸሎት እዩ ነይሩ እቲ ናይ ጽድቂ ኣጽዋር
ኩሉ ትናኻ አብነት ጽድቂ ኢኻ

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 6
ወሲነ ክለበሶ ዕጥቂ ናይ ገልኻ
እቲ
እስቲ ተመልከቱ ነቶም መራሕትኹም
ኣሰሮም ሰዓቡ ገድሎም እናስተንተንኩም

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ

VERSE 7
ከም ዝበሎ ጎይታ ኣብቲ ቅዱስ ወንጌል
ተበጊሰ አለኹ ንዓኻ ክመስል
እንተ ኣነ ግና ካባኻ ዝደሊ ተኽልየ ጸሎትካ እዩ ዘዉህበኒ ሓይሊ።
እቲ ዝመስል

CHORUS
እቲ ዝመስል ብፍጹም ዘይከኣል
ዝኸኣልካ ብሓይሊ እቲ ልዑል
ኪንዮ ሓሳብ ነቢርካ ብግብሪ
ዝተላበስካ ናይ ቅዱሳን ክብሪ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7807ca5a-c4fd-48a2-befa-45a0cee4d79d'::uuid, 'teklehaymanot-live-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- hayilih-sigelet ("Hayilih Sigelet")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '78084e01-cc1c-4395-b580-ae2dae37c215'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 1
አቤት ቀንደ መለከት ሲነፋ
አዋጅ ሲታወጅ በይፋ
ጻድቃን ሲጠሩ ለተድላ
ምን ይሆን የእኛ ተስፋ

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 2
አቤት መላእክት ሰማዩን ሲያርሱት
ቀድመው ሲሰሙ መባርቅት
ያልታየና ያልተሰማ
ድምጽ ሲሰማ ከራማ

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 3
አቤት ሰባቱ ነፋስ ተከፍተው
ምድርን ሲያውኳት ቀዝፈው
ሲታዘዝ የባሕር ሞገድ
ምድሪቷን ሊከድናት ለፍርድ

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 4
አቤት ሲጠሩ ጻድቃን ቅዱሳን
መልካም የሰሩ ቡሩካን
በምድር የሰሩ ትሩፋት
ሲያቀርቡ ለአምላክ ስብሐት

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 5
አቤት ኃጥአን ግን ለፍርድ ሲጠሩ
በጨለማ ዓለም ሊቀሩ
የማይጠቅም ዋይታ ሆኖ
መዋረድ ይሆናል ባክኖ

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 6
አቤት ሲጠሩ ጻድቃን ቅዱሳን
መልካም የሰሩ ቡሩካን
በምድር የሰሩ ትሩፋት
ሲያሰሙ ለአምላክ ስብሐት

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 7
አዝማች 🏾

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 1
Abet qende meleket sinefa
Awaj sitawej beyfa
Ts’adqan sit’eru letedla
Min yihon yeegna tesfa

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 2
Abet melaekt semayun siyarsut
Qedmew sisemu mebarqt
Yaltayena yaltesema
Dimts’ sisema kerama

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 3
Abet sebatu nefas tekeftew
Midrn siyawkwat qezfew
Sitazez yebahr moged
Midritwan likednat lefrd

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 4
Abet sit’eru ts’adqan Kidusan
Melkam yeseru burukan
Bemdr yeseru tirufat
Siyaqerbu leamlak sibhet

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 5
Abet hat’an gin lefrd sit’eru
Bech’elema alem liqeru
Yemayt’eqm wayta hono
Mewared yihonal bakno

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 6
Abet sit’eru ts’adqan Kidusan
Melkam yeseru burukan
Bemdr yeseru tirufat
Siyasemu leamlak sibhet

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 7
CHORUS

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 1
አቤት ቀንደ መለከት ሲነፋ
አዋጅ ሲታወጅ በይፋ
ጻድቃን ሲጠሩ ለተድላ
ምን ይሆን የእኛ ተስፋ

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 2
አቤት መላእክት ሰማዩን ሲያርሱት
ቀድመው ሲሰሙ መባርቅት
ያልታየና ያልተሰማ
ድምጽ ሲሰማ ከራማ

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 3
አቤት ሰባቱ ነፋስ ተከፍተው
ምድርን ሲያውኳት ቀዝፈው
ሲታዘዝ የባሕር ሞገድ
ምድሪቷን ሊከድናት ለፍርድ

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 4
አቤት ሲጠሩ ጻድቃን ቅዱሳን
መልካም የሰሩ ቡሩካን
በምድር የሰሩ ትሩፋት
ሲያቀርቡ ለአምላክ ስብሐት

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 5
አቤት ኃጥአን ግን ለፍርድ ሲጠሩ
በጨለማ ዓለም ሊቀሩ
የማይጠቅም ዋይታ ሆኖ
መዋረድ ይሆናል ባክኖ

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 6
አቤት ሲጠሩ ጻድቃን ቅዱሳን
መልካም የሰሩ ቡሩካን
በምድር የሰሩ ትሩፋት
ሲያሰሙ ለአምላክ ስብሐት

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 7
አዝማች 🏾

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን',
        lyrics_transliteration = 'CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 1
Abet qende meleket sinefa
Awaj sitawej beyfa
Ts’adqan sit’eru letedla
Min yihon yeegna tesfa

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 2
Abet melaekt semayun siyarsut
Qedmew sisemu mebarqt
Yaltayena yaltesema
Dimts’ sisema kerama

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 3
Abet sebatu nefas tekeftew
Midrn siyawkwat qezfew
Sitazez yebahr moged
Midritwan likednat lefrd

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 4
Abet sit’eru ts’adqan Kidusan
Melkam yeseru burukan
Bemdr yeseru tirufat
Siyaqerbu leamlak sibhet

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 5
Abet hat’an gin lefrd sit’eru
Bech’elema alem liqeru
Yemayt’eqm wayta hono
Mewared yihonal bakno

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 6
Abet sit’eru ts’adqan Kidusan
Melkam yeseru burukan
Bemdr yeseru tirufat
Siyasemu leamlak sibhet

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon

VERSE 7
CHORUS

CHORUS
Haylh sigelet’ besemay (2)
Abet man yiqom yihon kefith
Man yiqom yihon (2) kefith
Man yiqom yihon',
        updated_at = clock_timestamp()::text
    WHERE import_id = '78084e01-cc1c-4395-b580-ae2dae37c215'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 1
አቤት ቀንደ መለከት ሲነፋ
አዋጅ ሲታወጅ በይፋ
ጻድቃን ሲጠሩ ለተድላ
ምን ይሆን የእኛ ተስፋ

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 2
አቤት መላእክት ሰማዩን ሲያርሱት
ቀድመው ሲሰሙ መባርቅት
ያልታየና ያልተሰማ
ድምጽ ሲሰማ ከራማ

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 3
አቤት ሰባቱ ነፋስ ተከፍተው
ምድርን ሲያውኳት ቀዝፈው
ሲታዘዝ የባሕር ሞገድ
ምድሪቷን ሊከድናት ለፍርድ

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 4
አቤት ሲጠሩ ጻድቃን ቅዱሳን
መልካም የሰሩ ቡሩካን
በምድር የሰሩ ትሩፋት
ሲያቀርቡ ለአምላክ ስብሐት

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 5
አቤት ኃጥአን ግን ለፍርድ ሲጠሩ
በጨለማ ዓለም ሊቀሩ
የማይጠቅም ዋይታ ሆኖ
መዋረድ ይሆናል ባክኖ

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 6
አቤት ሲጠሩ ጻድቃን ቅዱሳን
መልካም የሰሩ ቡሩካን
በምድር የሰሩ ትሩፋት
ሲያሰሙ ለአምላክ ስብሐት

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን

VERSE 7
አዝማች 🏾

CHORUS
ኃይልህ ሲገለጥ በሰማይ/2/
አቤት ማን ይቆም ይሆን ከፊትህ
ማን ይቆም ይሆን/2/ ከፊትህ
ማን ይቆም ይሆን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '78084e01-cc1c-4395-b580-ae2dae37c215'::uuid, 'hayilih-sigelet', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- jesus-orthodox-tewahdo-mezmur-zemari-bereket-tikue ("Jesus Orthodox tewahdo mezmur / Zemari Bereket Tikue")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '781fc9bf-69c4-4596-b1ca-012b4c0ec3f7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 1
ምሕረትካ ግን በዚሑለይ
ኣይፈደኻንን ከም ግብረይ
ምስማዕሲ ሰሚዐ ብዙሕ ብዛዕባኻ
ሎሚ ግን ሪአዮ ትዓቢ ሳህልኻ

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 2
ኣድሕነኒ ኢለ ብልበይ ምስ ጸዋዕኩ
ደበኽ ኢኻ ኢልካለይ ቃለይ ከይወዳእኩ
ኣዝ
ኣብቲ ሕሱም ጭንቂ ሰዓት

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 3
ከንቀጥቅጥ ብምሒር ፍርሓት
ከም ውሕጅ ክፈስስ ንብዓተይ
ረዳኢ ኮንካያ ንነብሰይ
ከመይለ ''ርስዖ ትዓቢ ምድሓንካ

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 4
ከተናግፈኒ ጉድጓደይ ደፊንካ
ትናይ ሞተይ ኣዋጅ ብኣዋጅ ክትስዕሮ
ሓዘነይ ብሓጎስ ቅጽበት ክትቅይሮ
ኣዝ

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 5
ደጊምሲ ናትካ''ያ ሂወተይ
ኣባኻ አግዝኦ ፍቓደይ
ኩል ግዜ ስሌኻ ክምስክር
ንስምካ ከልዕሎ''የ ልዑል

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 6
ተጌሩለዩ''ሞ ኣዝዩ ዓቢ ነገር
ብቓላት ዘይግለጽ ዘደንጹ ተኣምር
ተዘይ ክኣልኩኳ ውዕለትካ ክመልሶ
ከመስግነካ''የ ስምካ ክውድሶ

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ

VERSE 1
Mihretka gin bezihuley
Ayfedeኻnn kem gibrey
Mismaesi semia bizuh bizaebaኻ
Lomi gin riayo tiabi sahlኻ

CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ

VERSE 2
Adhneni ile bilbey mis ts’ewaeku
Debeኽ iኻ ilkaley qaley keywedaeku
Az
Abti hisum ch’nqi seat

CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ

VERSE 3
Kenqet’qt’ bimhir firhat
Kem wihj kifess nibatey
Redai konkaya ninebsey
Kemeyle ''riso tiabi midhanka

CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ

VERSE 4
Ketenagfeni gudgwadey definka
Tinay motey awaj biawaj kitsero
Hazeney bihagos qits’bet kitqyro
Az

CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ

VERSE 5
Degimsi natka''ya hiwetey
Abaኻ agzo fiቓdey
Kul gize sileኻ kimskr
Nismka kelelo''ye liul

CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ

VERSE 6
Tegeruleyu''mo azyu abi neger
Biቓlat zeyglets’ zedents’u teamr
Tezey kialkukwa wieletka kimelso
Kemesgneka''ye simka kiwdso

CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 1
ምሕረትካ ግን በዚሑለይ
ኣይፈደኻንን ከም ግብረይ
ምስማዕሲ ሰሚዐ ብዙሕ ብዛዕባኻ
ሎሚ ግን ሪአዮ ትዓቢ ሳህልኻ

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 2
ኣድሕነኒ ኢለ ብልበይ ምስ ጸዋዕኩ
ደበኽ ኢኻ ኢልካለይ ቃለይ ከይወዳእኩ
ኣዝ
ኣብቲ ሕሱም ጭንቂ ሰዓት

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 3
ከንቀጥቅጥ ብምሒር ፍርሓት
ከም ውሕጅ ክፈስስ ንብዓተይ
ረዳኢ ኮንካያ ንነብሰይ
ከመይለ ''ርስዖ ትዓቢ ምድሓንካ

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 4
ከተናግፈኒ ጉድጓደይ ደፊንካ
ትናይ ሞተይ ኣዋጅ ብኣዋጅ ክትስዕሮ
ሓዘነይ ብሓጎስ ቅጽበት ክትቅይሮ
ኣዝ

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 5
ደጊምሲ ናትካ''ያ ሂወተይ
ኣባኻ አግዝኦ ፍቓደይ
ኩል ግዜ ስሌኻ ክምስክር
ንስምካ ከልዕሎ''የ ልዑል

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 6
ተጌሩለዩ''ሞ ኣዝዩ ዓቢ ነገር
ብቓላት ዘይግለጽ ዘደንጹ ተኣምር
ተዘይ ክኣልኩኳ ውዕለትካ ክመልሶ
ከመስግነካ''የ ስምካ ክውድሶ

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ',
        lyrics_transliteration = 'CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ

VERSE 1
Mihretka gin bezihuley
Ayfedeኻnn kem gibrey
Mismaesi semia bizuh bizaebaኻ
Lomi gin riayo tiabi sahlኻ

CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ

VERSE 2
Adhneni ile bilbey mis ts’ewaeku
Debeኽ iኻ ilkaley qaley keywedaeku
Az
Abti hisum ch’nqi seat

CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ

VERSE 3
Kenqet’qt’ bimhir firhat
Kem wihj kifess nibatey
Redai konkaya ninebsey
Kemeyle ''riso tiabi midhanka

CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ

VERSE 4
Ketenagfeni gudgwadey definka
Tinay motey awaj biawaj kitsero
Hazeney bihagos qits’bet kitqyro
Az

CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ

VERSE 5
Degimsi natka''ya hiwetey
Abaኻ agzo fiቓdey
Kul gize sileኻ kimskr
Nismka kelelo''ye liul

CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ

VERSE 6
Tegeruleyu''mo azyu abi neger
Biቓlat zeyglets’ zedents’u teamr
Tezey kialkukwa wieletka kimelso
Kemesgneka''ye simka kiwdso

CHORUS
Iyesus fiቕrኻ bizuh''yu fiቕrኻ
Aboye mihretka bizuh''yu mihretka
Zeyezuz bedali enkeleኹ
O aboy niaኻ zeguhaኹ',
        updated_at = clock_timestamp()::text
    WHERE import_id = '781fc9bf-69c4-4596-b1ca-012b4c0ec3f7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 1
ምሕረትካ ግን በዚሑለይ
ኣይፈደኻንን ከም ግብረይ
ምስማዕሲ ሰሚዐ ብዙሕ ብዛዕባኻ
ሎሚ ግን ሪአዮ ትዓቢ ሳህልኻ

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 2
ኣድሕነኒ ኢለ ብልበይ ምስ ጸዋዕኩ
ደበኽ ኢኻ ኢልካለይ ቃለይ ከይወዳእኩ
ኣዝ
ኣብቲ ሕሱም ጭንቂ ሰዓት

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 3
ከንቀጥቅጥ ብምሒር ፍርሓት
ከም ውሕጅ ክፈስስ ንብዓተይ
ረዳኢ ኮንካያ ንነብሰይ
ከመይለ ''ርስዖ ትዓቢ ምድሓንካ

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 4
ከተናግፈኒ ጉድጓደይ ደፊንካ
ትናይ ሞተይ ኣዋጅ ብኣዋጅ ክትስዕሮ
ሓዘነይ ብሓጎስ ቅጽበት ክትቅይሮ
ኣዝ

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 5
ደጊምሲ ናትካ''ያ ሂወተይ
ኣባኻ አግዝኦ ፍቓደይ
ኩል ግዜ ስሌኻ ክምስክር
ንስምካ ከልዕሎ''የ ልዑል

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ

VERSE 6
ተጌሩለዩ''ሞ ኣዝዩ ዓቢ ነገር
ብቓላት ዘይግለጽ ዘደንጹ ተኣምር
ተዘይ ክኣልኩኳ ውዕለትካ ክመልሶ
ከመስግነካ''የ ስምካ ክውድሶ

CHORUS
ኢየሱስ ፍቕርኻ ብዙሕ''ዩ ፍቕርኻ
ኣቦየ ምሕረትካ ብዙሕ''ዩ ምሕረትካ
ዘይእዙዝ በዳሊ እንከለኹ
ኦ ኣቦይ ንዓኻ ዘጉሃኹ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '781fc9bf-69c4-4596-b1ca-012b4c0ec3f7'::uuid, 'jesus-orthodox-tewahdo-mezmur-zemari-bereket-tikue', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- i-know-the-one-who-has-saved-me ("I know the one who has saved me")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0af16e6a-0495-4d15-9127-68cf84cfac7b'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 1
Banishing the darkness away
He is the one who shined His light
Because of Christ I am complete
I will follow Him day and night

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 2
I saw the brilliant light of God
Always ahead guiding me now
His love brought me toward the church
I chose to worship Him and bow

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 3
I will give praise (3) For He loves me always

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 4
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 5
He gave me rest in His embrace
My corrupted life He maintains
Dying on the cross for my sins
I was healed while He was in pain

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 6
His tireless arms carry me
So that I may live in honor
For my salvation He came down
Humbly He laid in a manger

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 7
I will give praise (3) For He loves me always

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 8
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 9
To glorify I will sing songs
On the cross Jesus shed His blood
For the sake of His children’s lives
He gave His life for those He loved

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 10
This love brought Christ from the heavens
The humble God came for my gain
I became holy through the lamb
On Calvary the Lord was slain

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 11
I will give praise (3) For He loves me always

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 12
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 13
The King who wore a crown of thorns
Left His throne and glory for me
He guided me to my honor
With holy blood I was redeemed

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 14
Bowing His head He raised me up
His righteousness brightens my face
I will live the rest of my days
With Jesus Christ who gives me grace

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 15
I will give praise (3) For He loves me always

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 16
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 17
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 18
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 19
Yadanegnin awkewalew
Yemotelign Eyesus new
Silelelegn yemikeflew
Sitotaye misgana new

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 20
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Yadanegnin awkewalew
Yemotelign Eyesus new
Silelelegn yemikeflew
Sitotaye misgana new'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 1
Banishing the darkness away
He is the one who shined His light
Because of Christ I am complete
I will follow Him day and night

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 2
I saw the brilliant light of God
Always ahead guiding me now
His love brought me toward the church
I chose to worship Him and bow

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 3
I will give praise (3) For He loves me always

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 4
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 5
He gave me rest in His embrace
My corrupted life He maintains
Dying on the cross for my sins
I was healed while He was in pain

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 6
His tireless arms carry me
So that I may live in honor
For my salvation He came down
Humbly He laid in a manger

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 7
I will give praise (3) For He loves me always

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 8
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 9
To glorify I will sing songs
On the cross Jesus shed His blood
For the sake of His children’s lives
He gave His life for those He loved

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 10
This love brought Christ from the heavens
The humble God came for my gain
I became holy through the lamb
On Calvary the Lord was slain

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 11
I will give praise (3) For He loves me always

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 12
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 13
The King who wore a crown of thorns
Left His throne and glory for me
He guided me to my honor
With holy blood I was redeemed

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 14
Bowing His head He raised me up
His righteousness brightens my face
I will live the rest of my days
With Jesus Christ who gives me grace

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 15
I will give praise (3) For He loves me always

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 16
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 17
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 18
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 19
Yadanegnin awkewalew
Yemotelign Eyesus new
Silelelegn yemikeflew
Sitotaye misgana new

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 20
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory',
        lyrics_transliteration = 'Yadanegnin awkewalew
Yemotelign Eyesus new
Silelelegn yemikeflew
Sitotaye misgana new',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0af16e6a-0495-4d15-9127-68cf84cfac7b'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 1
Banishing the darkness away
He is the one who shined His light
Because of Christ I am complete
I will follow Him day and night

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 2
I saw the brilliant light of God
Always ahead guiding me now
His love brought me toward the church
I chose to worship Him and bow

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 3
I will give praise (3) For He loves me always

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 4
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 5
He gave me rest in His embrace
My corrupted life He maintains
Dying on the cross for my sins
I was healed while He was in pain

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 6
His tireless arms carry me
So that I may live in honor
For my salvation He came down
Humbly He laid in a manger

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 7
I will give praise (3) For He loves me always

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 8
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 9
To glorify I will sing songs
On the cross Jesus shed His blood
For the sake of His children’s lives
He gave His life for those He loved

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 10
This love brought Christ from the heavens
The humble God came for my gain
I became holy through the lamb
On Calvary the Lord was slain

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 11
I will give praise (3) For He loves me always

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 12
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 13
The King who wore a crown of thorns
Left His throne and glory for me
He guided me to my honor
With holy blood I was redeemed

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 14
Bowing His head He raised me up
His righteousness brightens my face
I will live the rest of my days
With Jesus Christ who gives me grace

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 15
I will give praise (3) For He loves me always

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 16
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 17
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 18
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 19
Yadanegnin awkewalew
Yemotelign Eyesus new
Silelelegn yemikeflew
Sitotaye misgana new

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

VERSE 20
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory

CHORUS
I know the one who has saved me
Jesus the Lord who died for me
Since I have no way to repay
I will give Him praise and glory'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Yadanegnin awkewalew
Yemotelign Eyesus new
Silelelegn yemikeflew
Sitotaye misgana new';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0af16e6a-0495-4d15-9127-68cf84cfac7b'::uuid, 'i-know-the-one-who-has-saved-me', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- haleluya-zemarit-fasika-mekonen ("Haleluya Zemarit Fasika Mekonen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '787fe310-d3bc-47b7-87e5-7f717bf38736'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሃሌ ሉያ በኵሉ ጊዜ ወበኵሉ ሰዓት
ሃሌ ሉያ በኵሉ አዝማን ወበኵሉ ዓመታት
በትውልዱ አንደበት ይገባዋል ምስጋና
የፍጥረታት አስገኝ እግዚአብሔር ነውና

VERSE 1
እምቅድመ ይፍጥር መላእክተ ለክብር ወለቅዳሴ
እምቅድመ ይፍጥሮ ለአዳም ለአምልኮ ወለውዳሴ
ፀሐይ ከዋክብትን ጨረቃን በቃሉ ቀድሞ ሳይፈጥር
አመስጋኝ ሳይሻ ቅድመ ዓለም ንጉሥ ምስጉን ነበር

CHORUS
ሃሌ ሉያ በኵሉ ጊዜ ወበኵሉ ሰዓት
ሃሌ ሉያ በኵሉ አዝማን ወበኵሉ ዓመታት
በትውልዱ አንደበት ይገባዋል ምስጋና
የፍጥረታት አስገኝ እግዚአብሔር ነውና

VERSE 2
ስሙን በመቀደስ እንዲኖሩ ክብሩንም እንዲያወርሳቸው
እንዲያመሰግኑ ሌትና ቀን መላእክቱን ፈጠራቸው
ዲያቢሎስ ከክፋት ከክህደቱ መመለስ እንዳይሻ አውቆ
አዳምን ተካበት በአምሳሉ ፈጥሮ በክብር አልቆ

CHORUS
ሃሌ ሉያ በኵሉ ጊዜ ወበኵሉ ሰዓት
ሃሌ ሉያ በኵሉ አዝማን ወበኵሉ ዓመታት
በትውልዱ አንደበት ይገባዋል ምስጋና
የፍጥረታት አስገኝ እግዚአብሔር ነውና

VERSE 3
ኪሩቤል ዙፋኑን ተሸክመው ሳያርፋ ያወድሳሉ
ሱራፌል ካህናት የሰማዩን መቅደስ ዘወትር ያጥናሉ
በሰጠኸን ጸጋ እናመስግን እኛም እንደየ አቅማችን
የምስጋና መስዋዕት እንሰዋ ለአንተ ለአምላካችን

CHORUS
ሃሌ ሉያ በኵሉ ጊዜ ወበኵሉ ሰዓት
ሃሌ ሉያ በኵሉ አዝማን ወበኵሉ ዓመታት
በትውልዱ አንደበት ይገባዋል ምስጋና
የፍጥረታት አስገኝ እግዚአብሔር ነውና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Halleluya bekwlu gize webekwlu seat
Halleluya bekwlu azman webekwlu ametat
Betwldu andebet yigebawal misgana
Yeft’retat asgegn Egziabher newna

VERSE 1
Emqdme yift’r melaekte lekbr weleqdase
Emqdme yift’ro leadam leamlko welewdase
Ts’ehey kewakbtn ch’ereqan beqalu qedmo sayfet’r
Amesgagn saysha qidme alem nigus misgun neber

CHORUS
Halleluya bekwlu gize webekwlu seat
Halleluya bekwlu azman webekwlu ametat
Betwldu andebet yigebawal misgana
Yeft’retat asgegn Egziabher newna

VERSE 2
Simun bemeqedes endinoru kibrunm endiyawersachew
Endiyamesegnu letna qen melaektun fet’erachew
Diyabilos kekfat kekhdetu memeles endaysha awqo
Adamn tekabet beamsalu fet’ro bekbr alqo

CHORUS
Halleluya bekwlu gize webekwlu seat
Halleluya bekwlu azman webekwlu ametat
Betwldu andebet yigebawal misgana
Yeft’retat asgegn Egziabher newna

VERSE 3
Kirubel zufanun teshekmew sayarfa yawedsalu
Surafel kahnat yesemayun meqdes zewetr yat’nalu
Beset’eኸn ts’ega enamesgn egnam endeye aqmachn
Yemsgana meswaet ensewa leante leamlakachn

CHORUS
Halleluya bekwlu gize webekwlu seat
Halleluya bekwlu azman webekwlu ametat
Betwldu andebet yigebawal misgana
Yeft’retat asgegn Egziabher newna'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሃሌ ሉያ በኵሉ ጊዜ ወበኵሉ ሰዓት
ሃሌ ሉያ በኵሉ አዝማን ወበኵሉ ዓመታት
በትውልዱ አንደበት ይገባዋል ምስጋና
የፍጥረታት አስገኝ እግዚአብሔር ነውና

VERSE 1
እምቅድመ ይፍጥር መላእክተ ለክብር ወለቅዳሴ
እምቅድመ ይፍጥሮ ለአዳም ለአምልኮ ወለውዳሴ
ፀሐይ ከዋክብትን ጨረቃን በቃሉ ቀድሞ ሳይፈጥር
አመስጋኝ ሳይሻ ቅድመ ዓለም ንጉሥ ምስጉን ነበር

CHORUS
ሃሌ ሉያ በኵሉ ጊዜ ወበኵሉ ሰዓት
ሃሌ ሉያ በኵሉ አዝማን ወበኵሉ ዓመታት
በትውልዱ አንደበት ይገባዋል ምስጋና
የፍጥረታት አስገኝ እግዚአብሔር ነውና

VERSE 2
ስሙን በመቀደስ እንዲኖሩ ክብሩንም እንዲያወርሳቸው
እንዲያመሰግኑ ሌትና ቀን መላእክቱን ፈጠራቸው
ዲያቢሎስ ከክፋት ከክህደቱ መመለስ እንዳይሻ አውቆ
አዳምን ተካበት በአምሳሉ ፈጥሮ በክብር አልቆ

CHORUS
ሃሌ ሉያ በኵሉ ጊዜ ወበኵሉ ሰዓት
ሃሌ ሉያ በኵሉ አዝማን ወበኵሉ ዓመታት
በትውልዱ አንደበት ይገባዋል ምስጋና
የፍጥረታት አስገኝ እግዚአብሔር ነውና

VERSE 3
ኪሩቤል ዙፋኑን ተሸክመው ሳያርፋ ያወድሳሉ
ሱራፌል ካህናት የሰማዩን መቅደስ ዘወትር ያጥናሉ
በሰጠኸን ጸጋ እናመስግን እኛም እንደየ አቅማችን
የምስጋና መስዋዕት እንሰዋ ለአንተ ለአምላካችን

CHORUS
ሃሌ ሉያ በኵሉ ጊዜ ወበኵሉ ሰዓት
ሃሌ ሉያ በኵሉ አዝማን ወበኵሉ ዓመታት
በትውልዱ አንደበት ይገባዋል ምስጋና
የፍጥረታት አስገኝ እግዚአብሔር ነውና',
        lyrics_transliteration = 'CHORUS
Halleluya bekwlu gize webekwlu seat
Halleluya bekwlu azman webekwlu ametat
Betwldu andebet yigebawal misgana
Yeft’retat asgegn Egziabher newna

VERSE 1
Emqdme yift’r melaekte lekbr weleqdase
Emqdme yift’ro leadam leamlko welewdase
Ts’ehey kewakbtn ch’ereqan beqalu qedmo sayfet’r
Amesgagn saysha qidme alem nigus misgun neber

CHORUS
Halleluya bekwlu gize webekwlu seat
Halleluya bekwlu azman webekwlu ametat
Betwldu andebet yigebawal misgana
Yeft’retat asgegn Egziabher newna

VERSE 2
Simun bemeqedes endinoru kibrunm endiyawersachew
Endiyamesegnu letna qen melaektun fet’erachew
Diyabilos kekfat kekhdetu memeles endaysha awqo
Adamn tekabet beamsalu fet’ro bekbr alqo

CHORUS
Halleluya bekwlu gize webekwlu seat
Halleluya bekwlu azman webekwlu ametat
Betwldu andebet yigebawal misgana
Yeft’retat asgegn Egziabher newna

VERSE 3
Kirubel zufanun teshekmew sayarfa yawedsalu
Surafel kahnat yesemayun meqdes zewetr yat’nalu
Beset’eኸn ts’ega enamesgn egnam endeye aqmachn
Yemsgana meswaet ensewa leante leamlakachn

CHORUS
Halleluya bekwlu gize webekwlu seat
Halleluya bekwlu azman webekwlu ametat
Betwldu andebet yigebawal misgana
Yeft’retat asgegn Egziabher newna',
        updated_at = clock_timestamp()::text
    WHERE import_id = '787fe310-d3bc-47b7-87e5-7f717bf38736'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሃሌ ሉያ በኵሉ ጊዜ ወበኵሉ ሰዓት
ሃሌ ሉያ በኵሉ አዝማን ወበኵሉ ዓመታት
በትውልዱ አንደበት ይገባዋል ምስጋና
የፍጥረታት አስገኝ እግዚአብሔር ነውና

VERSE 1
እምቅድመ ይፍጥር መላእክተ ለክብር ወለቅዳሴ
እምቅድመ ይፍጥሮ ለአዳም ለአምልኮ ወለውዳሴ
ፀሐይ ከዋክብትን ጨረቃን በቃሉ ቀድሞ ሳይፈጥር
አመስጋኝ ሳይሻ ቅድመ ዓለም ንጉሥ ምስጉን ነበር

CHORUS
ሃሌ ሉያ በኵሉ ጊዜ ወበኵሉ ሰዓት
ሃሌ ሉያ በኵሉ አዝማን ወበኵሉ ዓመታት
በትውልዱ አንደበት ይገባዋል ምስጋና
የፍጥረታት አስገኝ እግዚአብሔር ነውና

VERSE 2
ስሙን በመቀደስ እንዲኖሩ ክብሩንም እንዲያወርሳቸው
እንዲያመሰግኑ ሌትና ቀን መላእክቱን ፈጠራቸው
ዲያቢሎስ ከክፋት ከክህደቱ መመለስ እንዳይሻ አውቆ
አዳምን ተካበት በአምሳሉ ፈጥሮ በክብር አልቆ

CHORUS
ሃሌ ሉያ በኵሉ ጊዜ ወበኵሉ ሰዓት
ሃሌ ሉያ በኵሉ አዝማን ወበኵሉ ዓመታት
በትውልዱ አንደበት ይገባዋል ምስጋና
የፍጥረታት አስገኝ እግዚአብሔር ነውና

VERSE 3
ኪሩቤል ዙፋኑን ተሸክመው ሳያርፋ ያወድሳሉ
ሱራፌል ካህናት የሰማዩን መቅደስ ዘወትር ያጥናሉ
በሰጠኸን ጸጋ እናመስግን እኛም እንደየ አቅማችን
የምስጋና መስዋዕት እንሰዋ ለአንተ ለአምላካችን

CHORUS
ሃሌ ሉያ በኵሉ ጊዜ ወበኵሉ ሰዓት
ሃሌ ሉያ በኵሉ አዝማን ወበኵሉ ዓመታት
በትውልዱ አንደበት ይገባዋል ምስጋና
የፍጥረታት አስገኝ እግዚአብሔር ነውና'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '787fe310-d3bc-47b7-87e5-7f717bf38736'::uuid, 'haleluya-zemarit-fasika-mekonen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- selam-leki-eyale ("Selam Leki Eyale")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c23578c5-47a5-47c1-a1a3-86c4f5902ba5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 1
ተሰማ የገብርኤል ድምጽ ተሰማ
ውሃ ስትቀጂ ክንፉን እያማታ
ሊያበስርሽ የመጣው በታላቅ ደስታ
ከሞገስሽ ብዛት /2/ ሲታጠቅ ስፈታ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 2
አቅርቦልሽ ነበር የክብር ሰላምታ
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 3
ተሰማ የመልአኩ ድምፅ ተሰማ
ተሰማ የገብርኤል ድምጽ ተሰማ
የምሥራቹን ቃል ምስጢር ተሸክሞ
ገብርኤል ተላከ ሊያረጋጋት ደግሞ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 4
እርጋታን ተሞልታ /2/ ነገሩን መርምራ
የመልአኩን ብሥራት ሰማችው በተራ
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 5
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ
ተሰማ የገብርኤል ድምጽ ተሰማ
ይደሰታል እንጂ መንፈሴ በአምላኬ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 6
በምስጋና ሳድር ዘወትር ተንበርክኬ
ሃሳቤ ለቅፅበት /2/ ሌላ መች ያስባል
ለእኔ ልጅን መውለድ እንዴት ይቻለኛል
ሰላም ለኪ እያለ /2/

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 7
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ
ተሰማ የገብርኤል ድምጽ ተሰማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 8
ከአንቺ የሚወለደው ልዑል ነው ክቡር
የተመስገነ በሰማይ በምድር
ምስጢሩ ኃያል ነው /2/ ይረቃል ይሰፋል
ከአንቺ በቀር ይኼን ማን ይሸከመዋል

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 9
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 10
ተሰማ የገብርኤል ድምጽ ተሰማ
እጹብ ነው ድንቅ ነው አንቺን የፈጠረ
አንቺን በመውደዱ ሰውን አከበረ
ዓለም ይባረካል /2/ በማሕፀንሽ ፍሬ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 11
ክብርሽን አልዘልቅም ዘርዝሬ ዘርዝሬ
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 12
ተሰማ የመልአኩ ድምፅ ተሰማ
ተሰማ የገብርኤል ድምጽ ተሰማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 1
Tesema ye-Gebriel dimts tesema
Wuha sitqeji kinfun eyamata
Liyabesirish yemetaw betalaq desta
Ke-mogesish bizat (2) sitataq sifeta

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 2
Aqirbolish neber ye-kibir selamta
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 3
Tesema ye-melaku dimts tesema
Tesema ye-Gebriel dimts tesema
Ye-misirachun qal mistir teshekimo
Gebriel telake liyaregagat degmo

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 4
Ergatan temolta (2) negerun mermira
Ye-melakun bisirat semachiw betera
Selam leki eyale (2)
Harna werqun sitasmama

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 5
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema
Tesema ye-Gebriel dimts tesema
Yidesetal inji menfese beamlake

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 6
Be-misgana sadir zewetir tenberkike
Hasabe leqitsbet (2) lela mech yasibal
Le-ene lijin mewled endet yichalegnal

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 7
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 8
Tesema ye-Gebriel dimts tesema
Ke-anchi yemiwoledew liul new kibur
Ye-temesgene besemay bemidir
Mistiru hayal new (2) yireqal yisefal

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 9
Ke-anchi beqer yihen man yishekemewal
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 10
Tesema ye-melaku dimts tesema
Tesema ye-Gebriel dimts tesema
Itsub new dinq new anchin yefetere
Anchin bemewdedu sewin akebere

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 11
Alem yibarekal (2) be-mahitsensh fire
Kibirishin alzelqim zerzire zerzire
Selam leki eyale (2)
Harna werqun sitasmama

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 12
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema
Tesema ye-Gebriel dimts tesema

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 1
ተሰማ የገብርኤል ድምጽ ተሰማ
ውሃ ስትቀጂ ክንፉን እያማታ
ሊያበስርሽ የመጣው በታላቅ ደስታ
ከሞገስሽ ብዛት /2/ ሲታጠቅ ስፈታ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 2
አቅርቦልሽ ነበር የክብር ሰላምታ
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 3
ተሰማ የመልአኩ ድምፅ ተሰማ
ተሰማ የገብርኤል ድምጽ ተሰማ
የምሥራቹን ቃል ምስጢር ተሸክሞ
ገብርኤል ተላከ ሊያረጋጋት ደግሞ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 4
እርጋታን ተሞልታ /2/ ነገሩን መርምራ
የመልአኩን ብሥራት ሰማችው በተራ
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 5
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ
ተሰማ የገብርኤል ድምጽ ተሰማ
ይደሰታል እንጂ መንፈሴ በአምላኬ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 6
በምስጋና ሳድር ዘወትር ተንበርክኬ
ሃሳቤ ለቅፅበት /2/ ሌላ መች ያስባል
ለእኔ ልጅን መውለድ እንዴት ይቻለኛል
ሰላም ለኪ እያለ /2/

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 7
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ
ተሰማ የገብርኤል ድምጽ ተሰማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 8
ከአንቺ የሚወለደው ልዑል ነው ክቡር
የተመስገነ በሰማይ በምድር
ምስጢሩ ኃያል ነው /2/ ይረቃል ይሰፋል
ከአንቺ በቀር ይኼን ማን ይሸከመዋል

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 9
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 10
ተሰማ የገብርኤል ድምጽ ተሰማ
እጹብ ነው ድንቅ ነው አንቺን የፈጠረ
አንቺን በመውደዱ ሰውን አከበረ
ዓለም ይባረካል /2/ በማሕፀንሽ ፍሬ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 11
ክብርሽን አልዘልቅም ዘርዝሬ ዘርዝሬ
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 12
ተሰማ የመልአኩ ድምፅ ተሰማ
ተሰማ የገብርኤል ድምጽ ተሰማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ',
        lyrics_transliteration = 'CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 1
Tesema ye-Gebriel dimts tesema
Wuha sitqeji kinfun eyamata
Liyabesirish yemetaw betalaq desta
Ke-mogesish bizat (2) sitataq sifeta

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 2
Aqirbolish neber ye-kibir selamta
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 3
Tesema ye-melaku dimts tesema
Tesema ye-Gebriel dimts tesema
Ye-misirachun qal mistir teshekimo
Gebriel telake liyaregagat degmo

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 4
Ergatan temolta (2) negerun mermira
Ye-melakun bisirat semachiw betera
Selam leki eyale (2)
Harna werqun sitasmama

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 5
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema
Tesema ye-Gebriel dimts tesema
Yidesetal inji menfese beamlake

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 6
Be-misgana sadir zewetir tenberkike
Hasabe leqitsbet (2) lela mech yasibal
Le-ene lijin mewled endet yichalegnal

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 7
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 8
Tesema ye-Gebriel dimts tesema
Ke-anchi yemiwoledew liul new kibur
Ye-temesgene besemay bemidir
Mistiru hayal new (2) yireqal yisefal

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 9
Ke-anchi beqer yihen man yishekemewal
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 10
Tesema ye-melaku dimts tesema
Tesema ye-Gebriel dimts tesema
Itsub new dinq new anchin yefetere
Anchin bemewdedu sewin akebere

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 11
Alem yibarekal (2) be-mahitsensh fire
Kibirishin alzelqim zerzire zerzire
Selam leki eyale (2)
Harna werqun sitasmama

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 12
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema
Tesema ye-Gebriel dimts tesema

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c23578c5-47a5-47c1-a1a3-86c4f5902ba5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 1
ተሰማ የገብርኤል ድምጽ ተሰማ
ውሃ ስትቀጂ ክንፉን እያማታ
ሊያበስርሽ የመጣው በታላቅ ደስታ
ከሞገስሽ ብዛት /2/ ሲታጠቅ ስፈታ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 2
አቅርቦልሽ ነበር የክብር ሰላምታ
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 3
ተሰማ የመልአኩ ድምፅ ተሰማ
ተሰማ የገብርኤል ድምጽ ተሰማ
የምሥራቹን ቃል ምስጢር ተሸክሞ
ገብርኤል ተላከ ሊያረጋጋት ደግሞ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 4
እርጋታን ተሞልታ /2/ ነገሩን መርምራ
የመልአኩን ብሥራት ሰማችው በተራ
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 5
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ
ተሰማ የገብርኤል ድምጽ ተሰማ
ይደሰታል እንጂ መንፈሴ በአምላኬ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 6
በምስጋና ሳድር ዘወትር ተንበርክኬ
ሃሳቤ ለቅፅበት /2/ ሌላ መች ያስባል
ለእኔ ልጅን መውለድ እንዴት ይቻለኛል
ሰላም ለኪ እያለ /2/

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 7
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ
ተሰማ የገብርኤል ድምጽ ተሰማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 8
ከአንቺ የሚወለደው ልዑል ነው ክቡር
የተመስገነ በሰማይ በምድር
ምስጢሩ ኃያል ነው /2/ ይረቃል ይሰፋል
ከአንቺ በቀር ይኼን ማን ይሸከመዋል

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 9
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 10
ተሰማ የገብርኤል ድምጽ ተሰማ
እጹብ ነው ድንቅ ነው አንቺን የፈጠረ
አንቺን በመውደዱ ሰውን አከበረ
ዓለም ይባረካል /2/ በማሕፀንሽ ፍሬ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 11
ክብርሽን አልዘልቅም ዘርዝሬ ዘርዝሬ
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ

VERSE 12
ተሰማ የመልአኩ ድምፅ ተሰማ
ተሰማ የገብርኤል ድምጽ ተሰማ

CHORUS
ሰላም ለኪ እያለ /2/
ሓርና ወርቁን ስታስማማ
የገብርኤል ድምፅ ተሰማ
ተሰማ የመልአኩ ድምፅ ተሰማ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 1
Tesema ye-Gebriel dimts tesema
Wuha sitqeji kinfun eyamata
Liyabesirish yemetaw betalaq desta
Ke-mogesish bizat (2) sitataq sifeta

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 2
Aqirbolish neber ye-kibir selamta
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 3
Tesema ye-melaku dimts tesema
Tesema ye-Gebriel dimts tesema
Ye-misirachun qal mistir teshekimo
Gebriel telake liyaregagat degmo

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 4
Ergatan temolta (2) negerun mermira
Ye-melakun bisirat semachiw betera
Selam leki eyale (2)
Harna werqun sitasmama

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 5
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema
Tesema ye-Gebriel dimts tesema
Yidesetal inji menfese beamlake

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 6
Be-misgana sadir zewetir tenberkike
Hasabe leqitsbet (2) lela mech yasibal
Le-ene lijin mewled endet yichalegnal

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 7
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 8
Tesema ye-Gebriel dimts tesema
Ke-anchi yemiwoledew liul new kibur
Ye-temesgene besemay bemidir
Mistiru hayal new (2) yireqal yisefal

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 9
Ke-anchi beqer yihen man yishekemewal
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 10
Tesema ye-melaku dimts tesema
Tesema ye-Gebriel dimts tesema
Itsub new dinq new anchin yefetere
Anchin bemewdedu sewin akebere

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 11
Alem yibarekal (2) be-mahitsensh fire
Kibirishin alzelqim zerzire zerzire
Selam leki eyale (2)
Harna werqun sitasmama

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema

VERSE 12
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema
Tesema ye-Gebriel dimts tesema

CHORUS
Selam leki eyale (2)
Harna werqun sitasmama
Ye-Gebriel dimts tesema
Tesema ye-melaku dimts tesema';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c23578c5-47a5-47c1-a1a3-86c4f5902ba5'::uuid, 'selam-leki-eyale', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- gebriel-simu ("GEBRIEL SIMU")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0ea82c16-419f-4f4d-b721-e32d79fb6447'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
አቅዲሙ ዜነዋ ለደብረ ልዑል ኢየሩሳሌም',
        lyrics_transliteration = 'CHORUS
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
Aqdimu zenewa ledebre liul iyerusalem',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0ea82c16-419f-4f4d-b721-e32d79fb6447'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0ea82c16-419f-4f4d-b721-e32d79fb6447'::uuid, 'gebriel-simu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eskemaezenu ("Eskemaezenu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '79f6c934-e376-4bc3-ab79-d3679c440361'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
እስከ መቼ ድረስ እመቤቴ ሆይ',
        lyrics_transliteration = 'CHORUS
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
Eske meche dires Emebete hoy',
        updated_at = clock_timestamp()::text
    WHERE import_id = '79f6c934-e376-4bc3-ab79-d3679c440361'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '79f6c934-e376-4bc3-ab79-d3679c440361'::uuid, 'eskemaezenu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- o-egiziabiher-ab ("O Egiziabiher Ab")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0b192072-c4c1-4c14-abb6-f3e3951f73e1'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኦ እግዚአብሔር አብ አኃዜ ኩሉ መሐረነ ኦ ወልድ ዋህድ ኢየሱስ ክርስቶስ ተሣሃለነ /፪/
ኦ ጰራቅሊጦስ መንፈሰ ጽድቅ ሥረይ /፪/ ለነ ሀሉ ምስሌነ /፪/

VERSE 1
ኦ እግዚአብሔር አብ አኃዜ ኩሉ መሐረነ ኦ ወልድ ዋህድ ኢየሱስ ክርስቶስ ተሣሃለነ /፪/
ኦ ጰራቅሊጦስ መንፈሰ ጽድቅ ሥረይ /፪/ ለነ ሀሉ ምስሌነ /፪/

CHORUS
ኦ እግዚአብሔር አብ አኃዜ ኩሉ መሐረነ ኦ ወልድ ዋህድ ኢየሱስ ክርስቶስ ተሣሃለነ /፪/
ኦ ጰራቅሊጦስ መንፈሰ ጽድቅ ሥረይ /፪/ ለነ ሀሉ ምስሌነ /፪/',
        lyrics_transliteration = 'CHORUS
O Egziabher Ab ahaze kulu meherene o Weld wahd Iyesus Kristos tesahalene (2)
O p’eraqlit’os menfese ts’dq sirey (2) lene helu mislene (2)

VERSE 1
O Egziabher Ab ahaze kulu meherene o Weld wahd Iyesus Kristos tesahalene (2)
O p’eraqlit’os menfese ts’dq sirey (2) lene helu mislene (2)

CHORUS
O Egziabher Ab ahaze kulu meherene o Weld wahd Iyesus Kristos tesahalene (2)
O p’eraqlit’os menfese ts’dq sirey (2) lene helu mislene (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0b192072-c4c1-4c14-abb6-f3e3951f73e1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኦ እግዚአብሔር አብ አኃዜ ኩሉ መሐረነ ኦ ወልድ ዋህድ ኢየሱስ ክርስቶስ ተሣሃለነ /፪/
ኦ ጰራቅሊጦስ መንፈሰ ጽድቅ ሥረይ /፪/ ለነ ሀሉ ምስሌነ /፪/

VERSE 1
ኦ እግዚአብሔር አብ አኃዜ ኩሉ መሐረነ ኦ ወልድ ዋህድ ኢየሱስ ክርስቶስ ተሣሃለነ /፪/
ኦ ጰራቅሊጦስ መንፈሰ ጽድቅ ሥረይ /፪/ ለነ ሀሉ ምስሌነ /፪/

CHORUS
ኦ እግዚአብሔር አብ አኃዜ ኩሉ መሐረነ ኦ ወልድ ዋህድ ኢየሱስ ክርስቶስ ተሣሃለነ /፪/
ኦ ጰራቅሊጦስ መንፈሰ ጽድቅ ሥረይ /፪/ ለነ ሀሉ ምስሌነ /፪/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0b192072-c4c1-4c14-abb6-f3e3951f73e1'::uuid, 'o-egiziabiher-ab', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ethiopian-orthodox-tewahdo-mezmur-1347 ("Ethiopian Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '79e73941-4420-4859-af68-cfac036cbd4b'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
አምላኬ ያደረገልኝ ብዙ ነው:: /2x/',
        lyrics_transliteration = 'CHORUS
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
Amlake yaderegelgn bizu new:: /2x/',
        updated_at = clock_timestamp()::text
    WHERE import_id = '79e73941-4420-4859-af68-cfac036cbd4b'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '79e73941-4420-4859-af68-cfac036cbd4b'::uuid, 'ethiopian-orthodox-tewahdo-mezmur-1347', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- asagiruni-zemari-bereket-tikue ("Asagiruni / / / Zemari Bereket Tikue")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7a017446-f215-48b2-b412-2e80859ca2b8'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ናይ ሞት ታሪኸይ ተዓጽዪ',
        lyrics_transliteration = 'CHORUS
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
Nay mot tariኸy teats’yi',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7a017446-f215-48b2-b412-2e80859ca2b8'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7a017446-f215-48b2-b412-2e80859ca2b8'::uuid, 'asagiruni-zemari-bereket-tikue', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ethiopian-orthodox-tewahdo-mezmur-1339 ("Ethiopian Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7a214945-6024-42a1-b542-3fa6fa1266ae'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ይፈሳል እንባዬ ከልቤ ሳስብህ',
        lyrics_transliteration = 'CHORUS
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
Yifesal enbaye kelbe sasbh',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7a214945-6024-42a1-b542-3fa6fa1266ae'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7a214945-6024-42a1-b542-3fa6fa1266ae'::uuid, 'ethiopian-orthodox-tewahdo-mezmur-1339', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- i-have-a-reason ("I Have A Reason")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '05eb0ffd-d19b-40ed-a32d-6fa23c793f58'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 1
The Mother of the Lord, the boast of all the saints
The voice of their prayers support that doesn''t shame
If I sing saying im proud you are my mother
I have reason to testify to your honor

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 2
When Adam became subject to death, through his sin
Retreated in vigil, praying while standing still
Saw the light within him, through whom he would be saved
My Lord’s Mother he said, ‘my life’ became her name

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 3
I too have a reason to boast of my lady,
With good reason I will sing of her name Mary
Protector of my life, from the merciless sea
Rainbow after the storm, from wrath she protects me

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 4
She preserved him from death, Semblance of Noah’s ark,
The safeguard of my soul, through her I receive life
She is my advocate I will witness of her
At all times with reason her name I’ll remember

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 5
At the mount Sinai when Moses saw her
Aron with the sistrum sang praises unto her
Ezra with mesenqo, King David with the harp
In faith I saw them all, praises they did impart

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 6
Deep down I’m awoken, to praise her from my heart
She is my hymnody the reason for my songs
When the angel of good news called her the bles-sed
Elizabeth bowed down my Lord’s mother she said

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 7
St Yaried in his hymns, Ephraim in his praises
Hiryaqos followed on, Liturgy he arranged
When her honor’s revealed in heaven and on earth
I have reason to sing praises of her honor

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 1
The Mother of the Lord, the boast of all the saints
The voice of their prayers support that doesn''t shame
If I sing saying im proud you are my mother
I have reason to testify to your honor

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 2
When Adam became subject to death, through his sin
Retreated in vigil, praying while standing still
Saw the light within him, through whom he would be saved
My Lord’s Mother he said, ‘my life’ became her name

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 3
I too have a reason to boast of my lady,
With good reason I will sing of her name Mary
Protector of my life, from the merciless sea
Rainbow after the storm, from wrath she protects me

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 4
She preserved him from death, Semblance of Noah’s ark,
The safeguard of my soul, through her I receive life
She is my advocate I will witness of her
At all times with reason her name I’ll remember

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 5
At the mount Sinai when Moses saw her
Aron with the sistrum sang praises unto her
Ezra with mesenqo, King David with the harp
In faith I saw them all, praises they did impart

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 6
Deep down I’m awoken, to praise her from my heart
She is my hymnody the reason for my songs
When the angel of good news called her the bles-sed
Elizabeth bowed down my Lord’s mother she said

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 7
St Yaried in his hymns, Ephraim in his praises
Hiryaqos followed on, Liturgy he arranged
When her honor’s revealed in heaven and on earth
I have reason to sing praises of her honor

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 1
The Mother of the Lord, the boast of all the saints
The voice of their prayers support that doesn''t shame
If I sing saying im proud you are my mother
I have reason to testify to your honor

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 2
When Adam became subject to death, through his sin
Retreated in vigil, praying while standing still
Saw the light within him, through whom he would be saved
My Lord’s Mother he said, ‘my life’ became her name

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 3
I too have a reason to boast of my lady,
With good reason I will sing of her name Mary
Protector of my life, from the merciless sea
Rainbow after the storm, from wrath she protects me

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 4
She preserved him from death, Semblance of Noah’s ark,
The safeguard of my soul, through her I receive life
She is my advocate I will witness of her
At all times with reason her name I’ll remember

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 5
At the mount Sinai when Moses saw her
Aron with the sistrum sang praises unto her
Ezra with mesenqo, King David with the harp
In faith I saw them all, praises they did impart

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 6
Deep down I’m awoken, to praise her from my heart
She is my hymnody the reason for my songs
When the angel of good news called her the bles-sed
Elizabeth bowed down my Lord’s mother she said

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 7
St Yaried in his hymns, Ephraim in his praises
Hiryaqos followed on, Liturgy he arranged
When her honor’s revealed in heaven and on earth
I have reason to sing praises of her honor

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku',
        lyrics_transliteration = 'CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 1
The Mother of the Lord, the boast of all the saints
The voice of their prayers support that doesn''t shame
If I sing saying im proud you are my mother
I have reason to testify to your honor

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 2
When Adam became subject to death, through his sin
Retreated in vigil, praying while standing still
Saw the light within him, through whom he would be saved
My Lord’s Mother he said, ‘my life’ became her name

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 3
I too have a reason to boast of my lady,
With good reason I will sing of her name Mary
Protector of my life, from the merciless sea
Rainbow after the storm, from wrath she protects me

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 4
She preserved him from death, Semblance of Noah’s ark,
The safeguard of my soul, through her I receive life
She is my advocate I will witness of her
At all times with reason her name I’ll remember

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 5
At the mount Sinai when Moses saw her
Aron with the sistrum sang praises unto her
Ezra with mesenqo, King David with the harp
In faith I saw them all, praises they did impart

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 6
Deep down I’m awoken, to praise her from my heart
She is my hymnody the reason for my songs
When the angel of good news called her the bles-sed
Elizabeth bowed down my Lord’s mother she said

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku

VERSE 7
St Yaried in his hymns, Ephraim in his praises
Hiryaqos followed on, Liturgy he arranged
When her honor’s revealed in heaven and on earth
I have reason to sing praises of her honor

CHORUS
Maryam ade gweyta timkhti Kidusan Maryam Ade Goyta timkihtī qidusan
Zeytehfr ts’egi nay ts’elotom lisan zeyte-hifir tsegī nay tselotom lisan
Enkwae adey konet ile ente zemerku Inqua adey konet īle inte zemerku
Miኽnyat aloni bezi entemeskerku mikhniyat alonī bezī inte meskerku',
        updated_at = clock_timestamp()::text
    WHERE import_id = '05eb0ffd-d19b-40ed-a32d-6fa23c793f58'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 1
The Mother of the Lord, the boast of all the saints
The voice of their prayers support that doesn''t shame
If I sing saying im proud you are my mother
I have reason to testify to your honor

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 2
When Adam became subject to death, through his sin
Retreated in vigil, praying while standing still
Saw the light within him, through whom he would be saved
My Lord’s Mother he said, ‘my life’ became her name

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 3
I too have a reason to boast of my lady,
With good reason I will sing of her name Mary
Protector of my life, from the merciless sea
Rainbow after the storm, from wrath she protects me

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 4
She preserved him from death, Semblance of Noah’s ark,
The safeguard of my soul, through her I receive life
She is my advocate I will witness of her
At all times with reason her name I’ll remember

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 5
At the mount Sinai when Moses saw her
Aron with the sistrum sang praises unto her
Ezra with mesenqo, King David with the harp
In faith I saw them all, praises they did impart

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 6
Deep down I’m awoken, to praise her from my heart
She is my hymnody the reason for my songs
When the angel of good news called her the bles-sed
Elizabeth bowed down my Lord’s mother she said

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku

VERSE 7
St Yaried in his hymns, Ephraim in his praises
Hiryaqos followed on, Liturgy he arranged
When her honor’s revealed in heaven and on earth
I have reason to sing praises of her honor

CHORUS
ማርያም ኣደ ጐይታ ትምክሕቲ ቅዱሳን Maryam Ade Goyta timkihtī qidusan
ዘይተሕፍር ጸግዒ ናይ ጸሎቶም ልሳን zeyte-hifir tsegī nay tselotom lisan
እንኳዕ ኣደይ ኮነት ኢለ እንተ ዘመርኩ Inqua adey konet īle inte zemerku
ምኽንያት ኣሎኒ በዚ እንተመስከርኩ mikhniyat alonī bezī inte meskerku'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '05eb0ffd-d19b-40ed-a32d-6fa23c793f58'::uuid, 'i-have-a-reason', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- begol-begol-ethiopian-gena-mezmur ("begol begol Ethiopian Gena Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7af401b0-690c-498e-9c40-4f13506bb302'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ፀሐይ ሰረቀ ክርስቶስ ተጠምቀ /4/',
        lyrics_transliteration = 'CHORUS
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
Ts’ehey sereqe Kristos tet’emqe (4)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7af401b0-690c-498e-9c40-4f13506bb302'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7af401b0-690c-498e-9c40-4f13506bb302'::uuid, 'begol-begol-ethiopian-gena-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zewitir-bikefagn ("Zewitir Bikefagn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c6636d13-d2c6-498f-861e-18b9ff7a388c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ድንግል ክብሬ ለእኔ ነሽ የሀዘኔ ደራሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Dingil kibre leene nesh yehezene derash'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c6636d13-d2c6-498f-861e-18b9ff7a388c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ድንግል ክብሬ ለእኔ ነሽ የሀዘኔ ደራሽ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c6636d13-d2c6-498f-861e-18b9ff7a388c'::uuid, 'zewitir-bikefagn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- abetu-lanite ("Abetu Lanite")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f2315901-fe61-43e4-b1be-3babfe282e13'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
እንዳንተ ያለ እግዚአብሔር ማንስ አለና(2)',
        lyrics_transliteration = 'CHORUS
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
Endante yale Egziabher mans alena (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f2315901-fe61-43e4-b1be-3babfe282e13'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f2315901-fe61-43e4-b1be-3babfe282e13'::uuid, 'abetu-lanite', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mot-new-rehab ("Mot New Rehab")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7bb1161f-9e86-4d4d-899e-b86fcb6786dc'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ሐዋርያት ጸጋህ በዝቶላቸው',
        lyrics_transliteration = 'CHORUS
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
Hewaryat ts’egah beztolachew',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7bb1161f-9e86-4d4d-899e-b86fcb6786dc'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7bb1161f-9e86-4d4d-899e-b86fcb6786dc'::uuid, 'mot-new-rehab', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bemahitsen-kine ("Bemahitsen Kine")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ba45faa4-3b74-469c-ba02-a71724e59f12'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ድንግል ስትናገር ምን እንዳዘለለው',
        lyrics_transliteration = 'CHORUS
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
Dingil sitnager min endazelelew',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ba45faa4-3b74-469c-ba02-a71724e59f12'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ba45faa4-3b74-469c-ba02-a71724e59f12'::uuid, 'bemahitsen-kine', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ya-diha-tetara ("Ya Diha Tetara")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7c59dae2-e191-486e-b1e6-2e10d0b82321'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 1
አምላክ በቸርነት
በምህረት ጎበኘው
ባለቀሰ ጊዜ
ገራ የገባው ሰው

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 2
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 3
ነገሩ ችግር ግን
የውስጥህ ህስውት
ይሸረዋልና
አስፈሪው ህይወት

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 4
ገራ የጠቃባው
የተከፋው ገጽ
ይበራል በጸሎት
አምላክን ጠርተህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 5
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 6
ለወገን ለዘመድህ
ያስቸገረው መላ
ሲቀልጥ ታየዋለህ
ካነባህ በኋሏ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 7
ሳገና ንዴትህ
ይቀራል ይሻራል
በእርሱ ፈንታ ሰላም
ፍቅር ይገብሃል

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 8
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 9
በከንቱ መጨነቅ
ራስህን መጥላትህ
ነውና የአጋንንት
መግቢያ ምልክቱ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 10
ሀዘን በል ይንሀ
በፍሰሰ ጊዜ
ንገረው ለአምላክህ
የልብህን ትካዜ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 11
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 12
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 13
አምላክ በቸርነት
በምህረት ጎበኘው
ባለቀሰ ጊዜ
ገራ የገባው ሰው

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 14
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 15
ነገሩ ችግር ግን
የውስጥህ ህስውት
ይሸረዋልና
አስፈሪው ህይወት

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 16
ገራ የጠቃባው
የተከፋው ገጽ
ይበራል በጸሎት
አምላክን ጠርተህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 17
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 18
ለወገን ለዘመድህ
ያስቸገረው መላ
ሲቀልጥ ታየዋለህ
ካነባህ በኋሏ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 19
ሳገና ንዴትህ
ይቀራል ይሻራል
በእርሱ ፈንታ ሰላም
ፍቅር ይገብሃል

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 20
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 21
በከንቱ መጨነቅ
ራስህን መጥላትህ
ነውና የአጋንንት
መግቢያ ምልክቱ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 22
ሀዘን በል ይንሀ
በፍሰሰ ጊዜ
ንገረው ለአምላክህ
የልብህን ትካዜ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 23
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 1
Amlak bechernet
Bemhret gobegnew
Baleqese gize
Gera yegebaw sew

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 2
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 3
Negeru chgr gin
Yewst’h hiswt
Yisherewalna
Asferiw hiywet

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 4
Gera yet’eqabaw
Yetekefaw gets’
Yiberal bets’elot
Amlakn t’erteh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 5
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 6
Lewegen lezemedh
Yaschegerew mela
Siqelt’ tayewaleh
Kanebah behwalwa

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 7
Sagena nideth
Yiqeral yisharal
Beersu fenta selam
Fiqr yigebhal

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 8
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 9
Bekentu mech’eneq
Rashn met’lath
Newna yeagannt
Megbiya milktu

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 10
Hezen bel yinhe
Befsese gize
Nigerew leamlakh
Yelbhn tikaze

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 11
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 12
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 13
Amlak bechernet
Bemhret gobegnew
Baleqese gize
Gera yegebaw sew

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 14
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 15
Negeru chgr gin
Yewst’h hiswt
Yisherewalna
Asferiw hiywet

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 16
Gera yet’eqabaw
Yetekefaw gets’
Yiberal bets’elot
Amlakn t’erteh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 17
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 18
Lewegen lezemedh
Yaschegerew mela
Siqelt’ tayewaleh
Kanebah behwalwa

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 19
Sagena nideth
Yiqeral yisharal
Beersu fenta selam
Fiqr yigebhal

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 20
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 21
Bekentu mech’eneq
Rashn met’lath
Newna yeagannt
Megbiya milktu

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 22
Hezen bel yinhe
Befsese gize
Nigerew leamlakh
Yelbhn tikaze

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 23
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 1
አምላክ በቸርነት
በምህረት ጎበኘው
ባለቀሰ ጊዜ
ገራ የገባው ሰው

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 2
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 3
ነገሩ ችግር ግን
የውስጥህ ህስውት
ይሸረዋልና
አስፈሪው ህይወት

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 4
ገራ የጠቃባው
የተከፋው ገጽ
ይበራል በጸሎት
አምላክን ጠርተህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 5
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 6
ለወገን ለዘመድህ
ያስቸገረው መላ
ሲቀልጥ ታየዋለህ
ካነባህ በኋሏ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 7
ሳገና ንዴትህ
ይቀራል ይሻራል
በእርሱ ፈንታ ሰላም
ፍቅር ይገብሃል

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 8
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 9
በከንቱ መጨነቅ
ራስህን መጥላትህ
ነውና የአጋንንት
መግቢያ ምልክቱ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 10
ሀዘን በል ይንሀ
በፍሰሰ ጊዜ
ንገረው ለአምላክህ
የልብህን ትካዜ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 11
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 12
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 13
አምላክ በቸርነት
በምህረት ጎበኘው
ባለቀሰ ጊዜ
ገራ የገባው ሰው

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 14
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 15
ነገሩ ችግር ግን
የውስጥህ ህስውት
ይሸረዋልና
አስፈሪው ህይወት

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 16
ገራ የጠቃባው
የተከፋው ገጽ
ይበራል በጸሎት
አምላክን ጠርተህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 17
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 18
ለወገን ለዘመድህ
ያስቸገረው መላ
ሲቀልጥ ታየዋለህ
ካነባህ በኋሏ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 19
ሳገና ንዴትህ
ይቀራል ይሻራል
በእርሱ ፈንታ ሰላም
ፍቅር ይገብሃል

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 20
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 21
በከንቱ መጨነቅ
ራስህን መጥላትህ
ነውና የአጋንንት
መግቢያ ምልክቱ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 22
ሀዘን በል ይንሀ
በፍሰሰ ጊዜ
ንገረው ለአምላክህ
የልብህን ትካዜ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 23
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው',
        lyrics_transliteration = 'CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 1
Amlak bechernet
Bemhret gobegnew
Baleqese gize
Gera yegebaw sew

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 2
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 3
Negeru chgr gin
Yewst’h hiswt
Yisherewalna
Asferiw hiywet

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 4
Gera yet’eqabaw
Yetekefaw gets’
Yiberal bets’elot
Amlakn t’erteh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 5
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 6
Lewegen lezemedh
Yaschegerew mela
Siqelt’ tayewaleh
Kanebah behwalwa

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 7
Sagena nideth
Yiqeral yisharal
Beersu fenta selam
Fiqr yigebhal

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 8
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 9
Bekentu mech’eneq
Rashn met’lath
Newna yeagannt
Megbiya milktu

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 10
Hezen bel yinhe
Befsese gize
Nigerew leamlakh
Yelbhn tikaze

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 11
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 12
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 13
Amlak bechernet
Bemhret gobegnew
Baleqese gize
Gera yegebaw sew

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 14
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 15
Negeru chgr gin
Yewst’h hiswt
Yisherewalna
Asferiw hiywet

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 16
Gera yet’eqabaw
Yetekefaw gets’
Yiberal bets’elot
Amlakn t’erteh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 17
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 18
Lewegen lezemedh
Yaschegerew mela
Siqelt’ tayewaleh
Kanebah behwalwa

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 19
Sagena nideth
Yiqeral yisharal
Beersu fenta selam
Fiqr yigebhal

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 20
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 21
Bekentu mech’eneq
Rashn met’lath
Newna yeagannt
Megbiya milktu

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 22
Hezen bel yinhe
Befsese gize
Nigerew leamlakh
Yelbhn tikaze

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw

VERSE 23
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh
Meshath bicha new yemifelegbh
Egziabhern t’rah min tidnaleh

CHORUS
Yadha tit’ara
Egziabherm semaw
Dersu silalkwakwa
Kets’ewatu libaw',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7c59dae2-e191-486e-b1e6-2e10d0b82321'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 1
አምላክ በቸርነት
በምህረት ጎበኘው
ባለቀሰ ጊዜ
ገራ የገባው ሰው

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 2
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 3
ነገሩ ችግር ግን
የውስጥህ ህስውት
ይሸረዋልና
አስፈሪው ህይወት

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 4
ገራ የጠቃባው
የተከፋው ገጽ
ይበራል በጸሎት
አምላክን ጠርተህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 5
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 6
ለወገን ለዘመድህ
ያስቸገረው መላ
ሲቀልጥ ታየዋለህ
ካነባህ በኋሏ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 7
ሳገና ንዴትህ
ይቀራል ይሻራል
በእርሱ ፈንታ ሰላም
ፍቅር ይገብሃል

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 8
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 9
በከንቱ መጨነቅ
ራስህን መጥላትህ
ነውና የአጋንንት
መግቢያ ምልክቱ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 10
ሀዘን በል ይንሀ
በፍሰሰ ጊዜ
ንገረው ለአምላክህ
የልብህን ትካዜ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 11
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 12
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 13
አምላክ በቸርነት
በምህረት ጎበኘው
ባለቀሰ ጊዜ
ገራ የገባው ሰው

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 14
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 15
ነገሩ ችግር ግን
የውስጥህ ህስውት
ይሸረዋልና
አስፈሪው ህይወት

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 16
ገራ የጠቃባው
የተከፋው ገጽ
ይበራል በጸሎት
አምላክን ጠርተህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 17
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 18
ለወገን ለዘመድህ
ያስቸገረው መላ
ሲቀልጥ ታየዋለህ
ካነባህ በኋሏ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 19
ሳገና ንዴትህ
ይቀራል ይሻራል
በእርሱ ፈንታ ሰላም
ፍቅር ይገብሃል

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 20
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 21
በከንቱ መጨነቅ
ራስህን መጥላትህ
ነውና የአጋንንት
መግቢያ ምልክቱ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 22
ሀዘን በል ይንሀ
በፍሰሰ ጊዜ
ንገረው ለአምላክህ
የልብህን ትካዜ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው

VERSE 23
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ
መሻትህ ብቻ ነው የሚፈለግብህ
እግዚአብሔርን ጥራህ ምን ትድናለህ

CHORUS
ያድሃ ትጣራ
እግዚአብሔርም ሰማው
ደርሱ ስላልኳኳ
ከጸዋቱ ልባው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7c59dae2-e191-486e-b1e6-2e10d0b82321'::uuid, 'ya-diha-tetara', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- erdagn-getaye-d-zelalem-takele ("Erdagn Getaye' D Zelalem Takele")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'db7ff9e7-6b72-42cf-8631-d07e4b8537a2'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
እንዳላማርር በ አፌ ስቼ',
        lyrics_transliteration = 'CHORUS
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
Endalamarr be afe siche',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'db7ff9e7-6b72-42cf-8631-d07e4b8537a2'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'db7ff9e7-6b72-42cf-8631-d07e4b8537a2'::uuid, 'erdagn-getaye-d-zelalem-takele', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yesilasen-menber ("Yesilasen Menber")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c76f9ac2-0888-4cef-bc9f-91540cadf3ba'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
አእላፍ መላዕክት ሲሰግዱ በፍራሃት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Ailaf Melekit Sisegidu Befirahat'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c76f9ac2-0888-4cef-bc9f-91540cadf3ba'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
አእላፍ መላዕክት ሲሰግዱ በፍራሃት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Ailaf Melekit Sisegidu Befirahat';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c76f9ac2-0888-4cef-bc9f-91540cadf3ba'::uuid, 'yesilasen-menber', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- min-semah-yohanes ("min semah yohanes")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7c9e7d79-1238-4a62-9c8e-f5e2638aeea7'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ምን ዓይነት ድምጽ ነው ምን ዓይነት ሰላምታ(2)',
        lyrics_transliteration = 'CHORUS
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
Min aynet dimts’ new min aynet selamta (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7c9e7d79-1238-4a62-9c8e-f5e2638aeea7'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7c9e7d79-1238-4a62-9c8e-f5e2638aeea7'::uuid, 'min-semah-yohanes', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- begol-begol ("Begol Begol")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7e663857-e455-48d0-8374-6d6d8d0d4acf'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ፀሐይ ፪ ፀሀይ ሠረቀ ፪',
        lyrics_transliteration = 'CHORUS
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
Ts’ehey 2 ts’ehey sereqe 2',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7e663857-e455-48d0-8374-6d6d8d0d4acf'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7e663857-e455-48d0-8374-6d6d8d0d4acf'::uuid, 'begol-begol', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- simishin-siteraw-dinigil ("Simishin Siteraw Dinigil")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7da94851-81ab-45d7-b7bb-e0f4b481e42a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም

VERSE 1
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራዉ ማርያም
አዝ
ትዉልድ ነኝ እና ልጅሽ የፈጠረኝ

CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም

VERSE 2
ድንግል እመቤቴ ላንቺ ምስጋና አለኝ
በፈቃደ እግዚአብሔር በአባቶቼ ጸጋ
ሰአሊለነ እላለሁ ሲመሽም ሲነጋ
አዝ

CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም

VERSE 3
በጠየቅሽዉ ግዜ ወይኑን እንዲመላ
አክብሮሻል እና በቃና ገሊላ
የሰላም እናት ሆይ ሰላም ልበልሽ
ዘመኔ ይፈጸም ሳመሰግንሽ

CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም

VERSE 4
አዝ
በሰላምታ ድምጽሽ መንፈስ ተመልቼ
አደግድጌ ልቁም እጆቼን ዘርግቼ
በዐቢይ ቃል ጮሄ ልመስክር በብርቱ

CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም

VERSE 5
ቅድስት ድንግል ማርያምን የእግዚአብሔር እናቱ
አዝ
ከሰማይ ሲገኝ ነው አንቺን ማወደስ
ሲገለጥ ሲፈቀድ ከመንፈስ ቅዱስ

CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም

VERSE 6
ማርያም ሕይወቴ ነሽ ምክንያት ለመዳኔ
ብዙ ነዉ ምስጢሩ አንቺን ማመስገኔ

CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam

VERSE 1
Landebete mar new lelbe selam
Simshn sit’erawu Maryam
CHORUS
Tiwuld negn ena lijsh yefet’eregn

CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam

VERSE 2
Dingil Emebete lanchi misgana alegn
Befeqade Egziabher beabatoche ts’ega
Sealilene elalehu simeshm sinega
CHORUS

CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam

VERSE 3
Bet’eyeqshwu gize weynun endimela
Akbroshal ena beqana gelila
Yeselam enat hoy selam libelsh
Zemene yifets’em samesegnsh

CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam

VERSE 4
CHORUS
Beselamta dimts’sh menfes temelche
Adegdge liqum ejochen zergche
Beabiy qal ch’ohe limeskr bebrtu

CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam

VERSE 5
Kidist Dingil Maryamn yeEgziabher enatu
CHORUS
Kesemay sigegn new anchin mawedes
Sigelet’ sifeqed kemenfes Kidus

CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam

VERSE 6
Maryam hiywete nesh miknyat lemedane
Bizu newu mist’iru anchin mamesgene

CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም

VERSE 1
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራዉ ማርያም
አዝ
ትዉልድ ነኝ እና ልጅሽ የፈጠረኝ

CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም

VERSE 2
ድንግል እመቤቴ ላንቺ ምስጋና አለኝ
በፈቃደ እግዚአብሔር በአባቶቼ ጸጋ
ሰአሊለነ እላለሁ ሲመሽም ሲነጋ
አዝ

CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም

VERSE 3
በጠየቅሽዉ ግዜ ወይኑን እንዲመላ
አክብሮሻል እና በቃና ገሊላ
የሰላም እናት ሆይ ሰላም ልበልሽ
ዘመኔ ይፈጸም ሳመሰግንሽ

CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም

VERSE 4
አዝ
በሰላምታ ድምጽሽ መንፈስ ተመልቼ
አደግድጌ ልቁም እጆቼን ዘርግቼ
በዐቢይ ቃል ጮሄ ልመስክር በብርቱ

CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም

VERSE 5
ቅድስት ድንግል ማርያምን የእግዚአብሔር እናቱ
አዝ
ከሰማይ ሲገኝ ነው አንቺን ማወደስ
ሲገለጥ ሲፈቀድ ከመንፈስ ቅዱስ

CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም

VERSE 6
ማርያም ሕይወቴ ነሽ ምክንያት ለመዳኔ
ብዙ ነዉ ምስጢሩ አንቺን ማመስገኔ

CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም',
        lyrics_transliteration = 'CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam

VERSE 1
Landebete mar new lelbe selam
Simshn sit’erawu Maryam
CHORUS
Tiwuld negn ena lijsh yefet’eregn

CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam

VERSE 2
Dingil Emebete lanchi misgana alegn
Befeqade Egziabher beabatoche ts’ega
Sealilene elalehu simeshm sinega
CHORUS

CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam

VERSE 3
Bet’eyeqshwu gize weynun endimela
Akbroshal ena beqana gelila
Yeselam enat hoy selam libelsh
Zemene yifets’em samesegnsh

CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam

VERSE 4
CHORUS
Beselamta dimts’sh menfes temelche
Adegdge liqum ejochen zergche
Beabiy qal ch’ohe limeskr bebrtu

CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam

VERSE 5
Kidist Dingil Maryamn yeEgziabher enatu
CHORUS
Kesemay sigegn new anchin mawedes
Sigelet’ sifeqed kemenfes Kidus

CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam

VERSE 6
Maryam hiywete nesh miknyat lemedane
Bizu newu mist’iru anchin mamesgene

CHORUS
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam
Simshn sit’erawu Dingil
Simshn sit’erawu Maryam',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7da94851-81ab-45d7-b7bb-e0f4b481e42a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራዉ ማርያም
አዝ=========
ትዉልድ ነኝ እና ልጅሽ የፈጠረኝ
ድንግል እመቤቴ ላንቺ ምስጋና አለኝ
በፈቃደ እግዚአብሔር በአባቶቼ ጸጋ
ሰአሊለነ እላለሁ ሲመሽም ሲነጋ
አዝ========
በጠየቅሽዉ ግዜ ወይኑን እንዲመላ
አክብሮሻል እና በቃና ገሊላ
የሰላም እናት ሆይ ሰላም ልበልሽ
ዘመኔ ይፈጸም ሳመሰግንሽ
አዝ=========
በሰላምታ ድምጽሽ መንፈስ ተመልቼ
አደግድጌ ልቁም እጆቼን ዘርግቼ
በዐቢይ ቃል ጮሄ ልመስክር በብርቱ
ቅድስት ድንግል ማርያምን የእግዚአብሔር እናቱ
አዝ=========
ከሰማይ ሲገኝ ነው አንቺን ማወደስ
ሲገለጥ ሲፈቀድ ከመንፈስ ቅዱስ
ማርያም ሕይወቴ ነሽ ምክንያት ለመዳኔ
ብዙ ነዉ ምስጢሩ አንቺን ማመስገኔ

VERSE 1
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራዉ ማርያም
አዝ=========
ትዉልድ ነኝ እና ልጅሽ የፈጠረኝ
ድንግል እመቤቴ ላንቺ ምስጋና አለኝ
በፈቃደ እግዚአብሔር በአባቶቼ ጸጋ
ሰአሊለነ እላለሁ ሲመሽም ሲነጋ
አዝ========
በጠየቅሽዉ ግዜ ወይኑን እንዲመላ
አክብሮሻል እና በቃና ገሊላ
የሰላም እናት ሆይ ሰላም ልበልሽ
ዘመኔ ይፈጸም ሳመሰግንሽ
አዝ=========
በሰላምታ ድምጽሽ መንፈስ ተመልቼ
አደግድጌ ልቁም እጆቼን ዘርግቼ
በዐቢይ ቃል ጮሄ ልመስክር በብርቱ
ቅድስት ድንግል ማርያምን የእግዚአብሔር እናቱ
አዝ=========
ከሰማይ ሲገኝ ነው አንቺን ማወደስ
ሲገለጥ ሲፈቀድ ከመንፈስ ቅዱስ
ማርያም ሕይወቴ ነሽ ምክንያት ለመዳኔ
ብዙ ነዉ ምስጢሩ አንቺን ማመስገኔ

CHORUS
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ስምሽን ስጠራዉ ድንግል
ስምሽን ስጠራዉ ማርያም
ላንደበቴ ማር ነው ለልቤ ሰላም
ስምሽን ስጠራዉ ማርያም
አዝ=========
ትዉልድ ነኝ እና ልጅሽ የፈጠረኝ
ድንግል እመቤቴ ላንቺ ምስጋና አለኝ
በፈቃደ እግዚአብሔር በአባቶቼ ጸጋ
ሰአሊለነ እላለሁ ሲመሽም ሲነጋ
አዝ========
በጠየቅሽዉ ግዜ ወይኑን እንዲመላ
አክብሮሻል እና በቃና ገሊላ
የሰላም እናት ሆይ ሰላም ልበልሽ
ዘመኔ ይፈጸም ሳመሰግንሽ
አዝ=========
በሰላምታ ድምጽሽ መንፈስ ተመልቼ
አደግድጌ ልቁም እጆቼን ዘርግቼ
በዐቢይ ቃል ጮሄ ልመስክር በብርቱ
ቅድስት ድንግል ማርያምን የእግዚአብሔር እናቱ
አዝ=========
ከሰማይ ሲገኝ ነው አንቺን ማወደስ
ሲገለጥ ሲፈቀድ ከመንፈስ ቅዱስ
ማርያም ሕይወቴ ነሽ ምክንያት ለመዳኔ
ብዙ ነዉ ምስጢሩ አንቺን ማመስገኔ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7da94851-81ab-45d7-b7bb-e0f4b481e42a'::uuid, 'simishin-siteraw-dinigil', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- alasebebignim-hatiyaten ("Alasebebignim Hatiyaten")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7e856788-660b-4c22-800c-57222345bace'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ጌታ በፍቅር ልቡ ይወደኛል',
        lyrics_transliteration = 'CHORUS
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
Geta befqr libu yiwedegnal',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7e856788-660b-4c22-800c-57222345bace'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7e856788-660b-4c22-800c-57222345bace'::uuid, 'alasebebignim-hatiyaten', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- abunearegawi-zemarit-betselot-asmare ("AbuneAregawi Zemarit Betselot Asmare")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7ec8cf85-7e89-4011-ba91-6fb314a60b14'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ቡሩክ ታላቅ አባት ነው ፅድቅን የወረሰ',
        lyrics_transliteration = 'CHORUS
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
Buruk talaq abat new ts’dqn yewerese',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7ec8cf85-7e89-4011-ba91-6fb314a60b14'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7ec8cf85-7e89-4011-ba91-6fb314a60b14'::uuid, 'abunearegawi-zemarit-betselot-asmare', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-3941 ("Eritrean Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '80bd1d91-6906-4082-bc94-488b685d3931'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ከምቶም ዘቕረብካዮ ባሮት ባዕልኻ ኣቕርቦ',
        lyrics_transliteration = 'CHORUS
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
Kemtom zeቕrebkayo barot baelኻ aቕrbo',
        updated_at = clock_timestamp()::text
    WHERE import_id = '80bd1d91-6906-4082-bc94-488b685d3931'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '80bd1d91-6906-4082-bc94-488b685d3931'::uuid, 'eritrean-orthodox-tewahdo-mezmur-3941', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yehiyiwet-meselal-amarigna-mezimur ("Yehiyiwet Meselal Amarigna Mezimur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '80db989b-8027-4337-83d2-01b1f0c8f793'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተተክላ የቆመች ከምድር እስከ ሰማይ ፣
የሕይወት መሰላል በጽድቅ የምትታይ ፣
የወጡባት የወረዱባት መላእክተ/፪/ ሰማይ ፣
ድንግል ሆይ /፪/ ምሳሌዋ አንቺ ነሽ /፪/

VERSE 1
በቅድስና ያጌጠች የንጹሕ ዕጣን ሙዳይ ፣
ጸሎት ማሳረጊያ ወደ አምላክ አዶናይ ፣
ንጹሕ መዓዛቸው ለመላእክተ ሰማይ፣
ድንግል ሆይ /፪/ የወርቅ ማዕጠንት /፪/

CHORUS
ተተክላ የቆመች ከምድር እስከ ሰማይ ፣
የሕይወት መሰላል በጽድቅ የምትታይ ፣
የወጡባት የወረዱባት መላእክተ/፪/ ሰማይ ፣
ድንግል ሆይ /፪/ ምሳሌዋ አንቺ ነሽ /፪/

VERSE 2
ለምልማ የተገኘች የአሮን በትር ፣
ውኃ ሳያጠጧት ሳይተክሏት በምድር
አብባ ያፈራች ያለወንድ/፪/ ዘር፣
ድንግል ሆይ /፪/ የአምላክ ማኅደር /፪/

CHORUS
ተተክላ የቆመች ከምድር እስከ ሰማይ ፣
የሕይወት መሰላል በጽድቅ የምትታይ ፣
የወጡባት የወረዱባት መላእክተ/፪/ ሰማይ ፣
ድንግል ሆይ /፪/ ምሳሌዋ አንቺ ነሽ /፪/

VERSE 3
በዚያች ቤተልሔም በግርግም ስፍራ ፣
ሰብአ ሰገል ሰግደዋል ገብተው በየተራ ፣
በእቅፍሽ ስላዩ የሕይወትን/፪/ እንጀራ፣
ድንግል ሆይ /፪/ የተስፋ አዝመራ /፪/

CHORUS
ተተክላ የቆመች ከምድር እስከ ሰማይ ፣
የሕይወት መሰላል በጽድቅ የምትታይ ፣
የወጡባት የወረዱባት መላእክተ/፪/ ሰማይ ፣
ድንግል ሆይ /፪/ ምሳሌዋ አንቺ ነሽ /፪/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tetekla yeqomech kemdr eske semay ,
Yehywet meselal bets’dq yemttay ,
Yewet’ubat yeweredubat melaekte (2) semay ,
Dingil hoy (2) misalewa anchi nesh (2)

VERSE 1
Beqdsna yaget’ech yents’uh et’an muday ,
Ts’elot masaregiya wede amlak adonay ,
Nits’uh meazachew lemelaekte semay,
Dingil hoy (2) yewerq maet’ent (2)

CHORUS
Tetekla yeqomech kemdr eske semay ,
Yehywet meselal bets’dq yemttay ,
Yewet’ubat yeweredubat melaekte (2) semay ,
Dingil hoy (2) misalewa anchi nesh (2)

VERSE 2
Lemlma yetegegnech yearon betr ,
Wiha sayat’et’wat sayteklwat bemdr
Abba yaferach yalewend (2) zer,
Dingil hoy (2) yeamlak mahder (2)

CHORUS
Tetekla yeqomech kemdr eske semay ,
Yehywet meselal bets’dq yemttay ,
Yewet’ubat yeweredubat melaekte (2) semay ,
Dingil hoy (2) misalewa anchi nesh (2)

VERSE 3
Beziyach betelhem begrgm sifra ,
Seba segel segdewal gebtew beyetera ,
Beeqfsh silayu yehywetn (2) enjera,
Dingil hoy (2) yetesfa azmera (2)

CHORUS
Tetekla yeqomech kemdr eske semay ,
Yehywet meselal bets’dq yemttay ,
Yewet’ubat yeweredubat melaekte (2) semay ,
Dingil hoy (2) misalewa anchi nesh (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ተተክላ የቆመች ከምድር እስከ ሰማይ ፣
የሕይወት መሰላል በጽድቅ የምትታይ ፣
የወጡባት የወረዱባት መላእክተ/፪/ ሰማይ ፣
ድንግል ሆይ /፪/ ምሳሌዋ አንቺ ነሽ /፪/

VERSE 1
በቅድስና ያጌጠች የንጹሕ ዕጣን ሙዳይ ፣
ጸሎት ማሳረጊያ ወደ አምላክ አዶናይ ፣
ንጹሕ መዓዛቸው ለመላእክተ ሰማይ፣
ድንግል ሆይ /፪/ የወርቅ ማዕጠንት /፪/

CHORUS
ተተክላ የቆመች ከምድር እስከ ሰማይ ፣
የሕይወት መሰላል በጽድቅ የምትታይ ፣
የወጡባት የወረዱባት መላእክተ/፪/ ሰማይ ፣
ድንግል ሆይ /፪/ ምሳሌዋ አንቺ ነሽ /፪/

VERSE 2
ለምልማ የተገኘች የአሮን በትር ፣
ውኃ ሳያጠጧት ሳይተክሏት በምድር
አብባ ያፈራች ያለወንድ/፪/ ዘር፣
ድንግል ሆይ /፪/ የአምላክ ማኅደር /፪/

CHORUS
ተተክላ የቆመች ከምድር እስከ ሰማይ ፣
የሕይወት መሰላል በጽድቅ የምትታይ ፣
የወጡባት የወረዱባት መላእክተ/፪/ ሰማይ ፣
ድንግል ሆይ /፪/ ምሳሌዋ አንቺ ነሽ /፪/

VERSE 3
በዚያች ቤተልሔም በግርግም ስፍራ ፣
ሰብአ ሰገል ሰግደዋል ገብተው በየተራ ፣
በእቅፍሽ ስላዩ የሕይወትን/፪/ እንጀራ፣
ድንግል ሆይ /፪/ የተስፋ አዝመራ /፪/

CHORUS
ተተክላ የቆመች ከምድር እስከ ሰማይ ፣
የሕይወት መሰላል በጽድቅ የምትታይ ፣
የወጡባት የወረዱባት መላእክተ/፪/ ሰማይ ፣
ድንግል ሆይ /፪/ ምሳሌዋ አንቺ ነሽ /፪/',
        lyrics_transliteration = 'CHORUS
Tetekla yeqomech kemdr eske semay ,
Yehywet meselal bets’dq yemttay ,
Yewet’ubat yeweredubat melaekte (2) semay ,
Dingil hoy (2) misalewa anchi nesh (2)

VERSE 1
Beqdsna yaget’ech yents’uh et’an muday ,
Ts’elot masaregiya wede amlak adonay ,
Nits’uh meazachew lemelaekte semay,
Dingil hoy (2) yewerq maet’ent (2)

CHORUS
Tetekla yeqomech kemdr eske semay ,
Yehywet meselal bets’dq yemttay ,
Yewet’ubat yeweredubat melaekte (2) semay ,
Dingil hoy (2) misalewa anchi nesh (2)

VERSE 2
Lemlma yetegegnech yearon betr ,
Wiha sayat’et’wat sayteklwat bemdr
Abba yaferach yalewend (2) zer,
Dingil hoy (2) yeamlak mahder (2)

CHORUS
Tetekla yeqomech kemdr eske semay ,
Yehywet meselal bets’dq yemttay ,
Yewet’ubat yeweredubat melaekte (2) semay ,
Dingil hoy (2) misalewa anchi nesh (2)

VERSE 3
Beziyach betelhem begrgm sifra ,
Seba segel segdewal gebtew beyetera ,
Beeqfsh silayu yehywetn (2) enjera,
Dingil hoy (2) yetesfa azmera (2)

CHORUS
Tetekla yeqomech kemdr eske semay ,
Yehywet meselal bets’dq yemttay ,
Yewet’ubat yeweredubat melaekte (2) semay ,
Dingil hoy (2) misalewa anchi nesh (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '80db989b-8027-4337-83d2-01b1f0c8f793'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተተክላ የቆመች ከምድር እስከ ሰማይ ፣
የሕይወት መሰላል በጽድቅ የምትታይ ፣
የወጡባት የወረዱባት መላእክተ/፪/ ሰማይ ፣
ድንግል ሆይ /፪/ ምሳሌዋ አንቺ ነሽ /፪/

VERSE 1
በቅድስና ያጌጠች የንጹሕ ዕጣን ሙዳይ ፣
ጸሎት ማሳረጊያ ወደ አምላክ አዶናይ ፣
ንጹሕ መዓዛቸው ለመላእክተ ሰማይ፣
ድንግል ሆይ /፪/ የወርቅ ማዕጠንት /፪/

CHORUS
ተተክላ የቆመች ከምድር እስከ ሰማይ ፣
የሕይወት መሰላል በጽድቅ የምትታይ ፣
የወጡባት የወረዱባት መላእክተ/፪/ ሰማይ ፣
ድንግል ሆይ /፪/ ምሳሌዋ አንቺ ነሽ /፪/

VERSE 2
ለምልማ የተገኘች የአሮን በትር ፣
ውኃ ሳያጠጧት ሳይተክሏት በምድር
አብባ ያፈራች ያለወንድ/፪/ ዘር፣
ድንግል ሆይ /፪/ የአምላክ ማኅደር /፪/

CHORUS
ተተክላ የቆመች ከምድር እስከ ሰማይ ፣
የሕይወት መሰላል በጽድቅ የምትታይ ፣
የወጡባት የወረዱባት መላእክተ/፪/ ሰማይ ፣
ድንግል ሆይ /፪/ ምሳሌዋ አንቺ ነሽ /፪/

VERSE 3
በዚያች ቤተልሔም በግርግም ስፍራ ፣
ሰብአ ሰገል ሰግደዋል ገብተው በየተራ ፣
በእቅፍሽ ስላዩ የሕይወትን/፪/ እንጀራ፣
ድንግል ሆይ /፪/ የተስፋ አዝመራ /፪/

CHORUS
ተተክላ የቆመች ከምድር እስከ ሰማይ ፣
የሕይወት መሰላል በጽድቅ የምትታይ ፣
የወጡባት የወረዱባት መላእክተ/፪/ ሰማይ ፣
ድንግል ሆይ /፪/ ምሳሌዋ አንቺ ነሽ /፪/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '80db989b-8027-4337-83d2-01b1f0c8f793'::uuid, 'yehiyiwet-meselal-amarigna-mezimur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
