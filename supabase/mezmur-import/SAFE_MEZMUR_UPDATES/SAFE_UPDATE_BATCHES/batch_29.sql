-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 29 OF 32
-- Target Table: public.mezmur_data_import
-- Total Records in Batch: 34
-- Target Condition: WHERE import_id = '<UUID>'::uuid (Primary Key)
-- Concurrency Protection: Dual-compatible guard (supports formatted or raw baseline)
-- Transliteration Guard: lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = ''
-- Atomicity: PL/pgSQL block rolls back entirely on any 0-row update (ERRCODE 40001)
-- Idempotency: EXISTS check ensures safe re-runs without duplicate execution
-- ============================================================================
BEGIN;

DO $$
DECLARE
  v_rows integer;
BEGIN
  -- nu-bebirihanu-temelalesu ("Nu Bebirihanu Temelalesu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'eb16a47c-b69e-41bd-9005-7983e5ff8b95'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Nu bebrhanu temelalesu (2)
Yefqrn hiywet endtlebsu
Nu bebrhanu temelalesu
Hulun bemichl beamlak t’la

VERSE 1
Beereft wiha sir arfenalna
Selamna fiqr hiywet yemiset’
Wede Getachen enhid enrut’
CHORUS

CHORUS
Nu bebrhanu temelalesu (2)
Yefqrn hiywet endtlebsu
Nu bebrhanu temelalesu
Hulun bemichl beamlak t’la

VERSE 2
Mihretna firdebeeju yeyazew
Yeselam abat medhanialem new
Hiywet yehonen bemesqel wilo
Birhan set’en ch’eleman shro

CHORUS
Nu bebrhanu temelalesu (2)
Yefqrn hiywet endtlebsu
Nu bebrhanu temelalesu
Hulun bemichl beamlak t’la

VERSE 3
CHORUS
Yemiyasdenegt’ yemiyasch’enqen
Yalfalna ersun temats’nen
Fiqr kemigel filats’a hono

CHORUS
Nu bebrhanu temelalesu (2)
Yefqrn hiywet endtlebsu
Nu bebrhanu temelalesu
Hulun bemichl beamlak t’la

VERSE 4
Yitadegenal beqdus qalu
CHORUS
Egrh bedngay endaymeta
Befetena wist’ endtbereta

CHORUS
Nu bebrhanu temelalesu (2)
Yefqrn hiywet endtlebsu
Nu bebrhanu temelalesu
Hulun bemichl beamlak t’la

VERSE 5
Meqseft kebeth endkelekel
Yit’ebqhel lelitna qen
CHORUS
Simun yaweqe hiywet mehonun

CHORUS
Nu bebrhanu temelalesu (2)
Yefqrn hiywet endtlebsu
Nu bebrhanu temelalesu
Hulun bemichl beamlak t’la

VERSE 6
Yimelalesal kehayl wede hayl
Rejm edme yit’egbal ersu
Birhan yihonal yets’ega libs
CHORUS

CHORUS
Nu bebrhanu temelalesu (2)
Yefqrn hiywet endtlebsu
Nu bebrhanu temelalesu
Hulun bemichl beamlak t’la

VERSE 7
Abetu ante tesfa nehna
Yemtmegb yefqr mena
Madann egnan asdestonal
Endih yale kibir keyet yigegnal

CHORUS
Nu bebrhanu temelalesu (2)
Yefqrn hiywet endtlebsu
Nu bebrhanu temelalesu
Hulun bemichl beamlak t’la'
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
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ሁሉን በሚችል በአምላክ ጥላ',
        lyrics_transliteration = 'CHORUS
Nu bebrhanu temelalesu (2)
Yefqrn hiywet endtlebsu
Nu bebrhanu temelalesu
Hulun bemichl beamlak t’la

VERSE 1
Beereft wiha sir arfenalna
Selamna fiqr hiywet yemiset’
Wede Getachen enhid enrut’
CHORUS

CHORUS
Nu bebrhanu temelalesu (2)
Yefqrn hiywet endtlebsu
Nu bebrhanu temelalesu
Hulun bemichl beamlak t’la

VERSE 2
Mihretna firdebeeju yeyazew
Yeselam abat medhanialem new
Hiywet yehonen bemesqel wilo
Birhan set’en ch’eleman shro

CHORUS
Nu bebrhanu temelalesu (2)
Yefqrn hiywet endtlebsu
Nu bebrhanu temelalesu
Hulun bemichl beamlak t’la

VERSE 3
CHORUS
Yemiyasdenegt’ yemiyasch’enqen
Yalfalna ersun temats’nen
Fiqr kemigel filats’a hono

CHORUS
Nu bebrhanu temelalesu (2)
Yefqrn hiywet endtlebsu
Nu bebrhanu temelalesu
Hulun bemichl beamlak t’la

VERSE 4
Yitadegenal beqdus qalu
CHORUS
Egrh bedngay endaymeta
Befetena wist’ endtbereta

CHORUS
Nu bebrhanu temelalesu (2)
Yefqrn hiywet endtlebsu
Nu bebrhanu temelalesu
Hulun bemichl beamlak t’la

VERSE 5
Meqseft kebeth endkelekel
Yit’ebqhel lelitna qen
CHORUS
Simun yaweqe hiywet mehonun

CHORUS
Nu bebrhanu temelalesu (2)
Yefqrn hiywet endtlebsu
Nu bebrhanu temelalesu
Hulun bemichl beamlak t’la

VERSE 6
Yimelalesal kehayl wede hayl
Rejm edme yit’egbal ersu
Birhan yihonal yets’ega libs
CHORUS

CHORUS
Nu bebrhanu temelalesu (2)
Yefqrn hiywet endtlebsu
Nu bebrhanu temelalesu
Hulun bemichl beamlak t’la

VERSE 7
Abetu ante tesfa nehna
Yemtmegb yefqr mena
Madann egnan asdestonal
Endih yale kibir keyet yigegnal

CHORUS
Nu bebrhanu temelalesu (2)
Yefqrn hiywet endtlebsu
Nu bebrhanu temelalesu
Hulun bemichl beamlak t’la',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'eb16a47c-b69e-41bd-9005-7983e5ff8b95'::uuid
      AND deleted_at IS NULL
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
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'eb16a47c-b69e-41bd-9005-7983e5ff8b95'::uuid, 'nu-bebirihanu-temelalesu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- siman-egiziabiher ("Siman Egiziabiher")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'eb29781a-9b34-4dfe-b95a-69496130b3ad'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Yeityop’ya dinkwanoch bemekera tech’enequ. siman egziabher. nits’uhan alequ.
Yegfachn ts’wa ejg molto bezto fesswal. siman egziabher. fetenachn biswal.

VERSE 1
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Nits’uhan taredu. bech’kane teqoret’u. siman egziabher. ende sib qelet’u.
Yesewoch ch’kane bemdritu berttalech. siman egziabher. fiqr qezqzalech.
Egzi’o meherene kirstos. siman egziabher. fithn atmels.

CHORUS
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Yeityop’ya dinkwanoch bemekera tech’enequ. siman egziabher. nits’uhan alequ.
Yegfachn ts’wa ejg molto bezto fesswal. siman egziabher. fetenachn biswal.

VERSE 2
Yet’fat demena yanzhabbal besemay. siman egziabher. bezabn siqay.
Qut’ahn bemhret melsln abatachn. siman egziabher. antew neh tesfachn.
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Seyfn yemimezzu yit’efalu beseyfachew. siman egziabher. ayqerm firdachew.

CHORUS
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Yeityop’ya dinkwanoch bemekera tech’enequ. siman egziabher. nits’uhan alequ.
Yegfachn ts’wa ejg molto bezto fesswal. siman egziabher. fetenachn biswal.

VERSE 3
Keleqswachn bizat aynochachn fezzewal. siman egziabher. libachn qoslwal.
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Hits’anat azawunt enbachewun afesesu. siman egziabher. ayzegybn melsu.
Dem yet’et’aw awre ers beers siyabalan. siman egziabher. selamn at’an.

CHORUS
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Yeityop’ya dinkwanoch bemekera tech’enequ. siman egziabher. nits’uhan alequ.
Yegfachn ts’wa ejg molto bezto fesswal. siman egziabher. fetenachn biswal.

VERSE 4
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Egzi’o meherene kirstos. siman egziabher. fithn atmels.

CHORUS
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Yeityop’ya dinkwanoch bemekera tech’enequ. siman egziabher. nits’uhan alequ.
Yegfachn ts’wa ejg molto bezto fesswal. siman egziabher. fetenachn biswal.'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።

VERSE 1
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
ንፁሃን ታረዱ። በጭካኔ ተቆረጡ። ስማን እግዚአብሔር። እንደ ስብ ቀለጡ።
የሰዎች ጭካኔ በምድሪቱ በርትታለች። ስማን እግዚአብሔር። ፍቅር ቀዝቅዛለች።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።

CHORUS
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።

VERSE 2
የጥፋት ደመና ያንዣብባል በሰማይ። ስማን እግዚአብሔር። በዛብን ስቃይ።
ቁጣህን በምህረት መልስልን አባታችን። ስማን እግዚአብሔር። አንተው ነህ ተስፋችን።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
ሰይፍን የሚመዝዙ ይጠፋሉ በሰይፋቸው። ስማን እግዚአብሔር። አይቀርም ፍርዳቸው።

CHORUS
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።

VERSE 3
ከለቅሷችን ብዛት ዓይኖቻችን ፈዝዘዋል። ስማን እግዚአብሔር። ልባችን ቆስሏል።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
ህፃናት አዛዉንት እንባቸዉን አፈሰሱ። ስማን እግዚአብሔር። አይዘግይብን መልሱ።
ደም የጠጣው አውሬ እርስ በእርስ ሲያባላን። ስማን እግዚአብሔር። ሰላምን አጣን።

CHORUS
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።

VERSE 4
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።

CHORUS
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።

VERSE 1
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
ንፁሃን ታረዱ። በጭካኔ ተቆረጡ። ስማን እግዚአብሔር። እንደ ስብ ቀለጡ።
የሰዎች ጭካኔ በምድሪቱ በርትታለች። ስማን እግዚአብሔር። ፍቅር ቀዝቅዛለች።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።

CHORUS
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።

VERSE 2
የጥፋት ደመና ያንዣብባል በሰማይ። ስማን እግዚአብሔር። በዛብን ስቃይ።
ቁጣህን በምህረት መልስልን አባታችን። ስማን እግዚአብሔር። አንተው ነህ ተስፋችን።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
ሰይፍን የሚመዝዙ ይጠፋሉ በሰይፋቸው። ስማን እግዚአብሔር። አይቀርም ፍርዳቸው።

CHORUS
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።

VERSE 3
ከለቅሷችን ብዛት ዓይኖቻችን ፈዝዘዋል። ስማን እግዚአብሔር። ልባችን ቆስሏል።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
ህፃናት አዛዉንት እንባቸዉን አፈሰሱ። ስማን እግዚአብሔር። አይዘግይብን መልሱ።
ደም የጠጣው አውሬ እርስ በእርስ ሲያባላን። ስማን እግዚአብሔር። ሰላምን አጣን።

CHORUS
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።

VERSE 4
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።

CHORUS
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።',
        lyrics_transliteration = 'CHORUS
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Yeityop’ya dinkwanoch bemekera tech’enequ. siman egziabher. nits’uhan alequ.
Yegfachn ts’wa ejg molto bezto fesswal. siman egziabher. fetenachn biswal.

VERSE 1
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Nits’uhan taredu. bech’kane teqoret’u. siman egziabher. ende sib qelet’u.
Yesewoch ch’kane bemdritu berttalech. siman egziabher. fiqr qezqzalech.
Egzi’o meherene kirstos. siman egziabher. fithn atmels.

CHORUS
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Yeityop’ya dinkwanoch bemekera tech’enequ. siman egziabher. nits’uhan alequ.
Yegfachn ts’wa ejg molto bezto fesswal. siman egziabher. fetenachn biswal.

VERSE 2
Yet’fat demena yanzhabbal besemay. siman egziabher. bezabn siqay.
Qut’ahn bemhret melsln abatachn. siman egziabher. antew neh tesfachn.
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Seyfn yemimezzu yit’efalu beseyfachew. siman egziabher. ayqerm firdachew.

CHORUS
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Yeityop’ya dinkwanoch bemekera tech’enequ. siman egziabher. nits’uhan alequ.
Yegfachn ts’wa ejg molto bezto fesswal. siman egziabher. fetenachn biswal.

VERSE 3
Keleqswachn bizat aynochachn fezzewal. siman egziabher. libachn qoslwal.
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Hits’anat azawunt enbachewun afesesu. siman egziabher. ayzegybn melsu.
Dem yet’et’aw awre ers beers siyabalan. siman egziabher. selamn at’an.

CHORUS
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Yeityop’ya dinkwanoch bemekera tech’enequ. siman egziabher. nits’uhan alequ.
Yegfachn ts’wa ejg molto bezto fesswal. siman egziabher. fetenachn biswal.

VERSE 4
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Egzi’o meherene kirstos. siman egziabher. fithn atmels.

CHORUS
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Egzi’o meherene kirstos. siman egziabher. fithn atmels.
Yeityop’ya dinkwanoch bemekera tech’enequ. siman egziabher. nits’uhan alequ.
Yegfachn ts’wa ejg molto bezto fesswal. siman egziabher. fetenachn biswal.',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'eb29781a-9b34-4dfe-b95a-69496130b3ad'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።

VERSE 1
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
ንፁሃን ታረዱ። በጭካኔ ተቆረጡ። ስማን እግዚአብሔር። እንደ ስብ ቀለጡ።
የሰዎች ጭካኔ በምድሪቱ በርትታለች። ስማን እግዚአብሔር። ፍቅር ቀዝቅዛለች።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።

CHORUS
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።

VERSE 2
የጥፋት ደመና ያንዣብባል በሰማይ። ስማን እግዚአብሔር። በዛብን ስቃይ።
ቁጣህን በምህረት መልስልን አባታችን። ስማን እግዚአብሔር። አንተው ነህ ተስፋችን።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
ሰይፍን የሚመዝዙ ይጠፋሉ በሰይፋቸው። ስማን እግዚአብሔር። አይቀርም ፍርዳቸው።

CHORUS
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።

VERSE 3
ከለቅሷችን ብዛት ዓይኖቻችን ፈዝዘዋል። ስማን እግዚአብሔር። ልባችን ቆስሏል።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
ህፃናት አዛዉንት እንባቸዉን አፈሰሱ። ስማን እግዚአብሔር። አይዘግይብን መልሱ።
ደም የጠጣው አውሬ እርስ በእርስ ሲያባላን። ስማን እግዚአብሔር። ሰላምን አጣን።

CHORUS
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።

VERSE 4
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።

CHORUS
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
እግዚኦ መሐረነ ክርስቶስ። ስማን እግዚአብሔር። ፊትህን አትመልስ።
የኢትዮጵያ ድንኳኖች በመከራ ተጨነቁ። ስማን እግዚአብሔር። ንፁሃን አለቁ።
የግፋችን ፅዋ እጅግ ሞልቶ በዝቶ ፈስሷል። ስማን እግዚአብሔር። ፈተናችን ብሷል።'
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'eb29781a-9b34-4dfe-b95a-69496130b3ad'::uuid, 'siman-egiziabiher', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enes-tesifa-alikoritim-yeemebetachin-zimare-bezemarit-sara-menigisitu-ye ("Enes Tesifa Alikoritim Yeemebetachin Zimare Bezemarit Sara Menigisitu Yetsiyon Dejoch Kelijinet Anidebete")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f618800b-4ffa-4d20-822a-86d9b6e2c965'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yets’yon dejoch
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera

VERSE 1
Arfenal simwan sint’era (2)
Hayln bemiyadergew letewedaj simsh
Yezema eqachnn anesan lijochsh
Mahteme burakesh belbachn ale

CHORUS
Yets’yon dejoch
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera

VERSE 2
Afachn Maryam sil ch’nqachn qelele
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera

CHORUS
Yets’yon dejoch
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera

VERSE 3
Arfenal simwan sint’era (2)
Yemsgana t’beb yeqne habt ts’ega
Kedejafsh met’ten gezan yale waga
T’lqun wet’tenewal betkeshash honen

CHORUS
Yets’yon dejoch
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera

VERSE 4
Ts’yonn beellta bezema shefnen
Enes tesfa alqort’m
Enes tesfa alqort’m hule t’erashalehu (2)
Amalaje anchin yizhlehu

CHORUS
Yets’yon dejoch
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera

VERSE 5
Azagntu anchin yizhlehu
Zuryayen sich’elm birhan honshgn
Wedajm sikedagn alew alshgn (2)
Hiywete ket’lqu man melsew

CHORUS
Yets’yon dejoch
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera

VERSE 6
Qena qena yalkut bemljash new (2)
Enes tesfa alqort’m hule t’erashalehu (2)
Amalaje anchin yizhlehu
Azagntu anchin yizhlehu

CHORUS
Yets’yon dejoch
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera

VERSE 7
Keljnet andebete
Dingil nech behesab behlina
Yaget’ech befts’um tihtna
Silasen behodwa astenagda

CHORUS
Yets’yon dejoch
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera

VERSE 8
Ayenat misle fiqur welda
Kekirubel Dingil tibelt’alech
Kesurafel Dingil tibelt’alech
LeEgziabher qal maderiya honalech

CHORUS
Yets’yon dejoch
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera

VERSE 9
Keljnet andebete
Alegn misgana leemebete
Kekoltafaw andebete
Alegn ellta leemebete

CHORUS
Yets’yon dejoch
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 1
አርፈናል ስሟን ስንጠራ(2)
ኃይልን በሚያደርገው ለተወዳጅ ስምሽ
የዜማ እቃችንን አነሳን ልጆችሽ
ማህተመ ቡራኬሽ በልባችን አለ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 2
አፋችን ማርያም ሲል ጭንቃችን ቀለለ
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 3
አርፈናል ስሟን ስንጠራ(2)
የምስጋና ጥበብ የቅኔ ሃብት ፀጋ
ከደጃፍሽ መጥተን ገዛን ያለ ዋጋ
ጥልቁን ወጥተነዋል በትከሻሽ ሆነን

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 4
ፅዮንን በእልልታ በዜማ ሸፍነን
እኔስ ተስፋ አልቆርጥም
እኔስ ተስፋ አልቆርጥም ሁሌ ጠራሻለሁ(2)
አማላጄ አንቺን ይዥለሁ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 5
አዛኝቱ አንቺን ይዥለሁ
ዙርያዬን ሲጨልም ብርሃን ሆንሽኝ
ወዳጅም ሲከዳኝ አለው አልሽኝ(2)
ህይወቴ ከጥልቁ ማን መልሰው

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 6
ቀና ቀና ያልኩት በምልጃሽ ነው(2)
እኔስ ተስፋ አልቆርጥም ሁሌ ጠራሻለሁ(2)
አማላጄ አንቺን ይዥለሁ
አዛኝቱ አንቺን ይዥለሁ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 7
ከልጅነት አንደበቴ
ድንግል ነች በሀሳብ በሕሊና
ያጌጠች በፍፁም ትህትና
ስላሴን በሆዷ አስተናግዳ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 8
አየናት ምስለ ፍቁር ወልዳ
ከኪሩቤል ድንግል ትበልጣለች
ከሱራፌል ድንግል ትበልጣለች
ለእግዚአብሔር ቃል ማደሪያ ሆናለች

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 9
ከልጅነት አንደበቴ
አለኝ ምስጋና ለእመቤቴ
ከኮልታፋው አንደበቴ
አለኝ እልልታ ለእመቤቴ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 1
አርፈናል ስሟን ስንጠራ(2)
ኃይልን በሚያደርገው ለተወዳጅ ስምሽ
የዜማ እቃችንን አነሳን ልጆችሽ
ማህተመ ቡራኬሽ በልባችን አለ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 2
አፋችን ማርያም ሲል ጭንቃችን ቀለለ
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 3
አርፈናል ስሟን ስንጠራ(2)
የምስጋና ጥበብ የቅኔ ሃብት ፀጋ
ከደጃፍሽ መጥተን ገዛን ያለ ዋጋ
ጥልቁን ወጥተነዋል በትከሻሽ ሆነን

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 4
ፅዮንን በእልልታ በዜማ ሸፍነን
እኔስ ተስፋ አልቆርጥም
እኔስ ተስፋ አልቆርጥም ሁሌ ጠራሻለሁ(2)
አማላጄ አንቺን ይዥለሁ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 5
አዛኝቱ አንቺን ይዥለሁ
ዙርያዬን ሲጨልም ብርሃን ሆንሽኝ
ወዳጅም ሲከዳኝ አለው አልሽኝ(2)
ህይወቴ ከጥልቁ ማን መልሰው

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 6
ቀና ቀና ያልኩት በምልጃሽ ነው(2)
እኔስ ተስፋ አልቆርጥም ሁሌ ጠራሻለሁ(2)
አማላጄ አንቺን ይዥለሁ
አዛኝቱ አንቺን ይዥለሁ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 7
ከልጅነት አንደበቴ
ድንግል ነች በሀሳብ በሕሊና
ያጌጠች በፍፁም ትህትና
ስላሴን በሆዷ አስተናግዳ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 8
አየናት ምስለ ፍቁር ወልዳ
ከኪሩቤል ድንግል ትበልጣለች
ከሱራፌል ድንግል ትበልጣለች
ለእግዚአብሔር ቃል ማደሪያ ሆናለች

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 9
ከልጅነት አንደበቴ
አለኝ ምስጋና ለእመቤቴ
ከኮልታፋው አንደበቴ
አለኝ እልልታ ለእመቤቴ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ',
        lyrics_transliteration = 'CHORUS
Yets’yon dejoch
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera

VERSE 1
Arfenal simwan sint’era (2)
Hayln bemiyadergew letewedaj simsh
Yezema eqachnn anesan lijochsh
Mahteme burakesh belbachn ale

CHORUS
Yets’yon dejoch
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera

VERSE 2
Afachn Maryam sil ch’nqachn qelele
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera

CHORUS
Yets’yon dejoch
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera

VERSE 3
Arfenal simwan sint’era (2)
Yemsgana t’beb yeqne habt ts’ega
Kedejafsh met’ten gezan yale waga
T’lqun wet’tenewal betkeshash honen

CHORUS
Yets’yon dejoch
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera

VERSE 4
Ts’yonn beellta bezema shefnen
Enes tesfa alqort’m
Enes tesfa alqort’m hule t’erashalehu (2)
Amalaje anchin yizhlehu

CHORUS
Yets’yon dejoch
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera

VERSE 5
Azagntu anchin yizhlehu
Zuryayen sich’elm birhan honshgn
Wedajm sikedagn alew alshgn (2)
Hiywete ket’lqu man melsew

CHORUS
Yets’yon dejoch
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera

VERSE 6
Qena qena yalkut bemljash new (2)
Enes tesfa alqort’m hule t’erashalehu (2)
Amalaje anchin yizhlehu
Azagntu anchin yizhlehu

CHORUS
Yets’yon dejoch
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera

VERSE 7
Keljnet andebete
Dingil nech behesab behlina
Yaget’ech befts’um tihtna
Silasen behodwa astenagda

CHORUS
Yets’yon dejoch
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera

VERSE 8
Ayenat misle fiqur welda
Kekirubel Dingil tibelt’alech
Kesurafel Dingil tibelt’alech
LeEgziabher qal maderiya honalech

CHORUS
Yets’yon dejoch
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera

VERSE 9
Keljnet andebete
Alegn misgana leemebete
Kekoltafaw andebete
Alegn ellta leemebete

CHORUS
Yets’yon dejoch
Yets’yon dejoch qinen temolu
Ledngl kibir ell eyalu
Ende nech’ enqu yemiyabera',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f618800b-4ffa-4d20-822a-86d9b6e2c965'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 1
አርፈናል ስሟን ስንጠራ(2)
ኃይልን በሚያደርገው ለተወዳጅ ስምሽ
የዜማ እቃችንን አነሳን ልጆችሽ
ማህተመ ቡራኬሽ በልባችን አለ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 2
አፋችን ማርያም ሲል ጭንቃችን ቀለለ
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 3
አርፈናል ስሟን ስንጠራ(2)
የምስጋና ጥበብ የቅኔ ሃብት ፀጋ
ከደጃፍሽ መጥተን ገዛን ያለ ዋጋ
ጥልቁን ወጥተነዋል በትከሻሽ ሆነን

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 4
ፅዮንን በእልልታ በዜማ ሸፍነን
እኔስ ተስፋ አልቆርጥም
እኔስ ተስፋ አልቆርጥም ሁሌ ጠራሻለሁ(2)
አማላጄ አንቺን ይዥለሁ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 5
አዛኝቱ አንቺን ይዥለሁ
ዙርያዬን ሲጨልም ብርሃን ሆንሽኝ
ወዳጅም ሲከዳኝ አለው አልሽኝ(2)
ህይወቴ ከጥልቁ ማን መልሰው

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 6
ቀና ቀና ያልኩት በምልጃሽ ነው(2)
እኔስ ተስፋ አልቆርጥም ሁሌ ጠራሻለሁ(2)
አማላጄ አንቺን ይዥለሁ
አዛኝቱ አንቺን ይዥለሁ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 7
ከልጅነት አንደበቴ
ድንግል ነች በሀሳብ በሕሊና
ያጌጠች በፍፁም ትህትና
ስላሴን በሆዷ አስተናግዳ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 8
አየናት ምስለ ፍቁር ወልዳ
ከኪሩቤል ድንግል ትበልጣለች
ከሱራፌል ድንግል ትበልጣለች
ለእግዚአብሔር ቃል ማደሪያ ሆናለች

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ

VERSE 9
ከልጅነት አንደበቴ
አለኝ ምስጋና ለእመቤቴ
ከኮልታፋው አንደበቴ
አለኝ እልልታ ለእመቤቴ

CHORUS
የጽዮን ደጆች
የጽዮን ደጆች ቅኔን ተሞሉ
ለድንግል ክብር እልል እያሉ
እንደ ነጭ እንቁ የሚያበራ'
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f618800b-4ffa-4d20-822a-86d9b6e2c965'::uuid, 'enes-tesifa-alikoritim-yeemebetachin-zimare-bezemarit-sara-menigisitu-ye', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yeaben-biderat-orthodox-mezmure-live-newsong ("YEABEN BIDERAT / ORTHODOX MEZMURE LIVE NEWSONG")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f728b85e-9a83-4f30-ae3f-2ad3a73fa0cc'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Beante lemeweded miknyat
Sebeb baynoregn dem gibat
Endihu mewded maykebdh
Benets’a mafqer maykebdh

VERSE 1
Bets’adq lijh ferdehal
At’h baryahn mirhal
Tebedlehm kisehm
Antes qwanqwa maygelt’h

CHORUS
Beante lemeweded miknyat
Sebeb baynoregn dem gibat
Endihu mewded maykebdh
Benets’a mafqer maykebdh

VERSE 2
Yeabn bidrat yan wileta
Bedem yaget’ewn wib sit’ota
Andebeten qedmo ayne awera
Enban sile fiqru eyezera

CHORUS
Beante lemeweded miknyat
Sebeb baynoregn dem gibat
Endihu mewded maykebdh
Benets’a mafqer maykebdh'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በአንተ ለመወደድ ምክንያት
ሰበብ ባይኖረኝ ደም ግባት
እንዲሁ መውደድ ማይከብድህ
በነፃ ማፍቀር ማይከብድህ

VERSE 1
በፃድቅ ልጅህ ፈርደሃል
አጥህ ባርያህን ምርሃል
ተበድለህም ክሰህም
አንተስ ቋንቋ ማይገልጥህ

CHORUS
በአንተ ለመወደድ ምክንያት
ሰበብ ባይኖረኝ ደም ግባት
እንዲሁ መውደድ ማይከብድህ
በነፃ ማፍቀር ማይከብድህ

VERSE 2
የአብን ብድራት ያን ውለታ
በደም ያጌጠውን ውብ ስጦታ
አንደበቴን ቀድሞ ዓይኔ አወራ
እንባን ስለ ፍቅሩ እየዘራ

CHORUS
በአንተ ለመወደድ ምክንያት
ሰበብ ባይኖረኝ ደም ግባት
እንዲሁ መውደድ ማይከብድህ
በነፃ ማፍቀር ማይከብድህ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በአንተ ለመወደድ ምክንያት
ሰበብ ባይኖረኝ ደም ግባት
እንዲሁ መውደድ ማይከብድህ
በነፃ ማፍቀር ማይከብድህ

VERSE 1
በፃድቅ ልጅህ ፈርደሃል
አጥህ ባርያህን ምርሃል
ተበድለህም ክሰህም
አንተስ ቋንቋ ማይገልጥህ

CHORUS
በአንተ ለመወደድ ምክንያት
ሰበብ ባይኖረኝ ደም ግባት
እንዲሁ መውደድ ማይከብድህ
በነፃ ማፍቀር ማይከብድህ

VERSE 2
የአብን ብድራት ያን ውለታ
በደም ያጌጠውን ውብ ስጦታ
አንደበቴን ቀድሞ ዓይኔ አወራ
እንባን ስለ ፍቅሩ እየዘራ

CHORUS
በአንተ ለመወደድ ምክንያት
ሰበብ ባይኖረኝ ደም ግባት
እንዲሁ መውደድ ማይከብድህ
በነፃ ማፍቀር ማይከብድህ',
        lyrics_transliteration = 'CHORUS
Beante lemeweded miknyat
Sebeb baynoregn dem gibat
Endihu mewded maykebdh
Benets’a mafqer maykebdh

VERSE 1
Bets’adq lijh ferdehal
At’h baryahn mirhal
Tebedlehm kisehm
Antes qwanqwa maygelt’h

CHORUS
Beante lemeweded miknyat
Sebeb baynoregn dem gibat
Endihu mewded maykebdh
Benets’a mafqer maykebdh

VERSE 2
Yeabn bidrat yan wileta
Bedem yaget’ewn wib sit’ota
Andebeten qedmo ayne awera
Enban sile fiqru eyezera

CHORUS
Beante lemeweded miknyat
Sebeb baynoregn dem gibat
Endihu mewded maykebdh
Benets’a mafqer maykebdh',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f728b85e-9a83-4f30-ae3f-2ad3a73fa0cc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በአንተ ለመወደድ ምክንያት
ሰበብ ባይኖረኝ ደም ግባት
እንዲሁ መውደድ ማይከብድህ
በነፃ ማፍቀር ማይከብድህ

VERSE 1
በፃድቅ ልጅህ ፈርደሃል
አጥህ ባርያህን ምርሃል
ተበድለህም ክሰህም
አንተስ ቋንቋ ማይገልጥህ

CHORUS
በአንተ ለመወደድ ምክንያት
ሰበብ ባይኖረኝ ደም ግባት
እንዲሁ መውደድ ማይከብድህ
በነፃ ማፍቀር ማይከብድህ

VERSE 2
የአብን ብድራት ያን ውለታ
በደም ያጌጠውን ውብ ስጦታ
አንደበቴን ቀድሞ ዓይኔ አወራ
እንባን ስለ ፍቅሩ እየዘራ

CHORUS
በአንተ ለመወደድ ምክንያት
ሰበብ ባይኖረኝ ደም ግባት
እንዲሁ መውደድ ማይከብድህ
በነፃ ማፍቀር ማይከብድህ'
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f728b85e-9a83-4f30-ae3f-2ad3a73fa0cc'::uuid, 'yeaben-biderat-orthodox-mezmure-live-newsong', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- beguzwachin-eridan ("በጉዟችን እርዳን")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'dc02e125-e168-4e31-98ff-970a7aa0299b'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq new leegna ante neh melkam eregna

VERSE 1
Esrael wedeqe (esrael tenesa(2×))
Mengedu alqenawm (amlakun biresa(2×))
Yeyaeqobn amlak (Egziabhern yizo(2×))
Min endaterefe (awqotal beguzo(2×))

CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq new leegna ante neh melkam eregna

VERSE 2
Mengedu aytaktm (godanaw yeqena(2×))
Egziabher kefitm (kehwalam alena(2×))
Ersu kelelebet (bimechm mengedu(2×))
Aqt’ach’aw wedemot (ayqerm mewsedu(2×))

CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq new leegna ante neh melkam eregna

VERSE 3
Bemengedu zilen (wedqen mech qertenal(2×))
Yeyaeqob amlak (degfo anstonal(2×))
Egziabher sit’eran (beqedemew menged(2×))
Guzwachn wedet new (bemot lemewesed(2×))

CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq new leegna ante neh melkam eregna

VERSE 4
Amlak hoy fiqrhn (belbachn salew(2×))
Eskemot bemesqel (yewededen manew(2×))
Beberehew ts’nat (sits’enabn rihebu(2×))
Bereket molaln (terefeln migbu(2×))

CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq new leegna ante neh melkam eregna'
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
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ' THEN lyrics_amharic 
          ELSE 'CHORUS
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
        END,
        lyrics_transliteration = 'CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq new leegna ante neh melkam eregna

VERSE 1
Esrael wedeqe (esrael tenesa(2×))
Mengedu alqenawm (amlakun biresa(2×))
Yeyaeqobn amlak (Egziabhern yizo(2×))
Min endaterefe (awqotal beguzo(2×))

CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq new leegna ante neh melkam eregna

VERSE 2
Mengedu aytaktm (godanaw yeqena(2×))
Egziabher kefitm (kehwalam alena(2×))
Ersu kelelebet (bimechm mengedu(2×))
Aqt’ach’aw wedemot (ayqerm mewsedu(2×))

CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq new leegna ante neh melkam eregna

VERSE 3
Bemengedu zilen (wedqen mech qertenal(2×))
Yeyaeqob amlak (degfo anstonal(2×))
Egziabher sit’eran (beqedemew menged(2×))
Guzwachn wedet new (bemot lemewesed(2×))

CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq new leegna ante neh melkam eregna

VERSE 4
Amlak hoy fiqrhn (belbachn salew(2×))
Eskemot bemesqel (yewededen manew(2×))
Beberehew ts’nat (sits’enabn rihebu(2×))
Bereket molaln (terefeln migbu(2×))

CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq new leegna ante neh melkam eregna',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'dc02e125-e168-4e31-98ff-970a7aa0299b'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
        OR lyrics_amharic IS NOT DISTINCT FROM 'ቸርነትህ ብዙ ምህረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነው ለእኛ አንተ ነህ መልካም እረኛ
.................................
እስራኤል ወደቀ (እስራኤል ተነሳ(2×))
መንገዱ አልቀናውም (አምላኩን ቢረሳ(2×))
የያዕቆብን አምላክ (እግዚአብሔርን ይዞ(2×))
ምን እንዳተረፈ (አውቆታል በጉዞ(2×))
..................................
መንገዱ አይታክትም (ጎዳናው የቀና(2×))
እግዚአብሔር ከፊትም (ከኋላም አለና(2×))
እርሱ ከሌለበት (ቢመችም መንገዱ(2×))
አቅጣጫው ወደሞት (አይቀርም መውሰዱ(2×))
......................................
በመንገዱ ዝለን (ወድቀን መች ቀርተናል(2×))
የያዕቆብ አምላክ (ደግፎ አንስቶናል(2×))
እግዚአብሔር ሲጠራን (በቀደመው መንገድ(2×))
ጉዟችን ወዴት ነው (በሞት ለመወሰድ(2×))
...............................
አምላክ ሆይ ፍቅርህን (በልባችን ሳለው(2×))
እስከሞት በመስቀል (የወደደን ማነው(2×))
በበረሀው ፅናት (ሲጸናብን ርሀቡ(2×))
በረከት ሞላልን (ተረፈልን ምግቡ(2×))'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'dc02e125-e168-4e31-98ff-970a7aa0299b'::uuid, 'beguzwachin-eridan', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tihitinash-girum-new ("ትህትናሽ ግሩም ነው")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a70a38af-579f-44f5-94a9-a37e7faa2851'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tihtnash girum new degnetshm 2
Enatu honeshal lemedhanialem 2
Nits’ht silehonsh Emebete Emebete
Enken yelelebsh Emebete Emebete

VERSE 1
Yeft’retat Geta Emebete Emebete
Beanchi yaderebsh Emebete Emebete
Yedngl memeret’ Emebete Emebete
Zenaw asgeremegn Emebete Emebete

CHORUS
Tihtnash girum new degnetshm 2
Enatu honeshal lemedhanialem 2
Nits’ht silehonsh Emebete Emebete
Enken yelelebsh Emebete Emebete

VERSE 2
Esatun taqefech Emebete Emebete
Yemaychalewn Emebete Emebete

CHORUS
Tihtnash girum new degnetshm 2
Enatu honeshal lemedhanialem 2
Nits’ht silehonsh Emebete Emebete
Enken yelelebsh Emebete Emebete

VERSE 3
Mirkuze libelsh Emebete Emebete
T’la kelelaye Emebete Emebete
Gashaye nesh anchi Emebete Emebete
Yeene memekiyaye Emebete Emebete

CHORUS
Tihtnash girum new degnetshm 2
Enatu honeshal lemedhanialem 2
Nits’ht silehonsh Emebete Emebete
Enken yelelebsh Emebete Emebete

VERSE 4
Bealem endalt’efa Emebete Emebete
Nuroye merobgn Emebete Emebete
Ende weyn at’afch’w Emebete Emebete
Maryam direshilgn Emebete Emebete

CHORUS
Tihtnash girum new degnetshm 2
Enatu honeshal lemedhanialem 2
Nits’ht silehonsh Emebete Emebete
Enken yelelebsh Emebete Emebete

VERSE 5
Yemsraq dejaf nesh Emebete Emebete
Yehulachn tesfa Emebete Emebete
Emu lets’ehey ts’dq Emebete Emebete
Yehulu t’ebeqa Emebete Emebete

CHORUS
Tihtnash girum new degnetshm 2
Enatu honeshal lemedhanialem 2
Nits’ht silehonsh Emebete Emebete
Enken yelelebsh Emebete Emebete

VERSE 6
Dingil yedl aklil Emebete Emebete
Dingil yets’dq sira Emebete Emebete
Dingil meselal nesh Emebete Emebete
Yetewahdo tesfa Emebete Emebete

CHORUS
Tihtnash girum new degnetshm 2
Enatu honeshal lemedhanialem 2
Nits’ht silehonsh Emebete Emebete
Enken yelelebsh Emebete Emebete'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 1
የፍጥረታት ጌታ እመቤቴ እመቤቴ
በአንቺ ያደረብሽ እመቤቴ እመቤቴ
የድንግል መመረጥ እመቤቴ እመቤቴ
ዜናው አስገረመኝ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 2
እሳቱን ታቀፈች እመቤቴ እመቤቴ
የማይቻለውን እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 3
ምርኩዜ ልበልሽ እመቤቴ እመቤቴ
ጥላ ከለላዬ እመቤቴ እመቤቴ
ጋሻዬ ነሽ አንቺ እመቤቴ እመቤቴ
የእኔ መመኪያዬ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 4
በአለም እንዳልጠፋ እመቤቴ እመቤቴ
ኑሮዬ መሮብኝ እመቤቴ እመቤቴ
እንደ ወይን አጣፍጭው እመቤቴ እመቤቴ
ማርያም ድረሺልኝ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 5
የምሥራቅ ደጃፍ ነሽ እመቤቴ እመቤቴ
የሁላችን ተስፋ እመቤቴ እመቤቴ
እሙ ለፀሐይ ጽድቅ እመቤቴ እመቤቴ
የሁሉ ጠበቃ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 6
ድንግል የድል አክሊል እመቤቴ እመቤቴ
ድንግል የጽድቅ ሥራ እመቤቴ እመቤቴ
ድንግል መሰላል ነሽ እመቤቴ እመቤቴ
የተዋሕዶ ተስፋ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 1
የፍጥረታት ጌታ እመቤቴ እመቤቴ
በአንቺ ያደረብሽ እመቤቴ እመቤቴ
የድንግል መመረጥ እመቤቴ እመቤቴ
ዜናው አስገረመኝ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 2
እሳቱን ታቀፈች እመቤቴ እመቤቴ
የማይቻለውን እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 3
ምርኩዜ ልበልሽ እመቤቴ እመቤቴ
ጥላ ከለላዬ እመቤቴ እመቤቴ
ጋሻዬ ነሽ አንቺ እመቤቴ እመቤቴ
የእኔ መመኪያዬ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 4
በአለም እንዳልጠፋ እመቤቴ እመቤቴ
ኑሮዬ መሮብኝ እመቤቴ እመቤቴ
እንደ ወይን አጣፍጭው እመቤቴ እመቤቴ
ማርያም ድረሺልኝ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 5
የምሥራቅ ደጃፍ ነሽ እመቤቴ እመቤቴ
የሁላችን ተስፋ እመቤቴ እመቤቴ
እሙ ለፀሐይ ጽድቅ እመቤቴ እመቤቴ
የሁሉ ጠበቃ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 6
ድንግል የድል አክሊል እመቤቴ እመቤቴ
ድንግል የጽድቅ ሥራ እመቤቴ እመቤቴ
ድንግል መሰላል ነሽ እመቤቴ እመቤቴ
የተዋሕዶ ተስፋ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ' THEN lyrics_amharic 
          ELSE 'CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 1
የፍጥረታት ጌታ እመቤቴ እመቤቴ
በአንቺ ያደረብሽ እመቤቴ እመቤቴ
የድንግል መመረጥ እመቤቴ እመቤቴ
ዜናው አስገረመኝ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 2
እሳቱን ታቀፈች እመቤቴ እመቤቴ
የማይቻለውን እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 3
ምርኩዜ ልበልሽ እመቤቴ እመቤቴ
ጥላ ከለላዬ እመቤቴ እመቤቴ
ጋሻዬ ነሽ አንቺ እመቤቴ እመቤቴ
የእኔ መመኪያዬ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 4
በአለም እንዳልጠፋ እመቤቴ እመቤቴ
ኑሮዬ መሮብኝ እመቤቴ እመቤቴ
እንደ ወይን አጣፍጭው እመቤቴ እመቤቴ
ማርያም ድረሺልኝ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 5
የምሥራቅ ደጃፍ ነሽ እመቤቴ እመቤቴ
የሁላችን ተስፋ እመቤቴ እመቤቴ
እሙ ለፀሐይ ጽድቅ እመቤቴ እመቤቴ
የሁሉ ጠበቃ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 6
ድንግል የድል አክሊል እመቤቴ እመቤቴ
ድንግል የጽድቅ ሥራ እመቤቴ እመቤቴ
ድንግል መሰላል ነሽ እመቤቴ እመቤቴ
የተዋሕዶ ተስፋ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ' 
        END,
        lyrics_transliteration = 'CHORUS
Tihtnash girum new degnetshm 2
Enatu honeshal lemedhanialem 2
Nits’ht silehonsh Emebete Emebete
Enken yelelebsh Emebete Emebete

VERSE 1
Yeft’retat Geta Emebete Emebete
Beanchi yaderebsh Emebete Emebete
Yedngl memeret’ Emebete Emebete
Zenaw asgeremegn Emebete Emebete

CHORUS
Tihtnash girum new degnetshm 2
Enatu honeshal lemedhanialem 2
Nits’ht silehonsh Emebete Emebete
Enken yelelebsh Emebete Emebete

VERSE 2
Esatun taqefech Emebete Emebete
Yemaychalewn Emebete Emebete

CHORUS
Tihtnash girum new degnetshm 2
Enatu honeshal lemedhanialem 2
Nits’ht silehonsh Emebete Emebete
Enken yelelebsh Emebete Emebete

VERSE 3
Mirkuze libelsh Emebete Emebete
T’la kelelaye Emebete Emebete
Gashaye nesh anchi Emebete Emebete
Yeene memekiyaye Emebete Emebete

CHORUS
Tihtnash girum new degnetshm 2
Enatu honeshal lemedhanialem 2
Nits’ht silehonsh Emebete Emebete
Enken yelelebsh Emebete Emebete

VERSE 4
Bealem endalt’efa Emebete Emebete
Nuroye merobgn Emebete Emebete
Ende weyn at’afch’w Emebete Emebete
Maryam direshilgn Emebete Emebete

CHORUS
Tihtnash girum new degnetshm 2
Enatu honeshal lemedhanialem 2
Nits’ht silehonsh Emebete Emebete
Enken yelelebsh Emebete Emebete

VERSE 5
Yemsraq dejaf nesh Emebete Emebete
Yehulachn tesfa Emebete Emebete
Emu lets’ehey ts’dq Emebete Emebete
Yehulu t’ebeqa Emebete Emebete

CHORUS
Tihtnash girum new degnetshm 2
Enatu honeshal lemedhanialem 2
Nits’ht silehonsh Emebete Emebete
Enken yelelebsh Emebete Emebete

VERSE 6
Dingil yedl aklil Emebete Emebete
Dingil yets’dq sira Emebete Emebete
Dingil meselal nesh Emebete Emebete
Yetewahdo tesfa Emebete Emebete

CHORUS
Tihtnash girum new degnetshm 2
Enatu honeshal lemedhanialem 2
Nits’ht silehonsh Emebete Emebete
Enken yelelebsh Emebete Emebete',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a70a38af-579f-44f5-94a9-a37e7faa2851'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 1
የፍጥረታት ጌታ እመቤቴ እመቤቴ
በአንቺ ያደረብሽ እመቤቴ እመቤቴ
የድንግል መመረጥ እመቤቴ እመቤቴ
ዜናው አስገረመኝ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 2
እሳቱን ታቀፈች እመቤቴ እመቤቴ
የማይቻለውን እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 3
ምርኩዜ ልበልሽ እመቤቴ እመቤቴ
ጥላ ከለላዬ እመቤቴ እመቤቴ
ጋሻዬ ነሽ አንቺ እመቤቴ እመቤቴ
የእኔ መመኪያዬ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 4
በአለም እንዳልጠፋ እመቤቴ እመቤቴ
ኑሮዬ መሮብኝ እመቤቴ እመቤቴ
እንደ ወይን አጣፍጭው እመቤቴ እመቤቴ
ማርያም ድረሺልኝ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 5
የምሥራቅ ደጃፍ ነሽ እመቤቴ እመቤቴ
የሁላችን ተስፋ እመቤቴ እመቤቴ
እሙ ለፀሐይ ጽድቅ እመቤቴ እመቤቴ
የሁሉ ጠበቃ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ

VERSE 6
ድንግል የድል አክሊል እመቤቴ እመቤቴ
ድንግል የጽድቅ ሥራ እመቤቴ እመቤቴ
ድንግል መሰላል ነሽ እመቤቴ እመቤቴ
የተዋሕዶ ተስፋ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ
እንከን የሌለብሽ እመቤቴ እመቤቴ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ትህትናሽ ግሩም ነው ደግነትሽም ፪
እናቱ ሆነሻል ለመድኃኒዓለም ፪
ንጽሕት ስለሆንሽ ------- እመቤቴ እመቤቴ
እንከን የሌለብሽ ------- እመቤቴ እመቤቴ
የፍጥረታት ጌታ------- እመቤቴ እመቤቴ
በአንቺ ያደረብሽ ------- እመቤቴ እመቤቴ
የድንግል መመረጥ------- እመቤቴ እመቤቴ
ዜናው አስገረመኝ ------- እመቤቴ እመቤቴ
እሳቱን ታቀፈች ------- እመቤቴ እመቤቴ
የማይቻለውን ------- እመቤቴ እመቤቴ
አዝ......
ምርኩዜ ልበልሽ ------- እመቤቴ እመቤቴ
ጥላ ከለላዬ ------- እመቤቴ እመቤቴ
ጋሻዬ ነሽ አንቺ ------- እመቤቴ እመቤቴ
የእኔ መመኪያዬ ------- እመቤቴ እመቤቴ
በአለም እንዳልጠፋ ------- እመቤቴ እመቤቴ
ኑሮዬ መሮብኝ ------- እመቤቴ እመቤቴ
እንደ ወይን አጣፍጭው ------- እመቤቴ እመቤቴ
ማርያም ድረሺልኝ ------- እመቤቴ እመቤቴ
አዝ....
የምሥራቅ ደጃፍ ነሽ ------- እመቤቴ እመቤቴ
የሁላችን ተስፋ ------- እመቤቴ እመቤቴ
እሙ ለፀሐይ ጽድቅ ------- እመቤቴ እመቤቴ
የሁሉ ጠበቃ ------- እመቤቴ እመቤቴ
ድንግል የድል አክሊል ------- እመቤቴ እመቤቴ
ድንግል የጽድቅ ሥራ ------- እመቤቴ እመቤቴ
ድንግል መሰላል ነሽ ------- እመቤቴ እመቤቴ
የተዋሕዶ ተስፋ------- እመቤቴ እመቤቴ
አዝ....'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a70a38af-579f-44f5-94a9-a37e7faa2851'::uuid, 'tihitinash-girum-new', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- emebetachin-banchi-melja-yeserg-mezmur ("እመቤታችን በአንቺ ምልጃ ተወዳጅ የሰርግ ዝማሬ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '801cc2bf-8109-4738-a79b-3ffc5e841fe8'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 1
Temert’a tadla bemaye qana
Mejemeriya honech bemaye qana
Qana zegelila bemaye qana
Qanan liyadergat yetamru qedami sifra

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 2
Yednglm kibir tegelet’e yemlja sira
Tawqwat silalechw bemaye qana
Weynke albomu bemaye qana
Wiha weyn sihon bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 3
Hulu ayu semu bemaye qana
Qanan liyadergat yetamru qedami sifra
Yednglm kibir tegelet’e yemlja sira
Asalafiwochu bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 4
Gira bigebachew bemaye qana
Yedngl Maryam lij bemaye qana
Kech’nq awet’achew bemaye qana
Qanan liyadergat yetamru qedami sifra

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 5
Yednglm kibir tegelet’e yemlja sira
Egnam enamnalen bemaye qana
Beerswa tinblna bemaye qana
Sile qalkidanwa bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 6
Hulu endemiqena bemaye qana
Qanan liyadergat yetamru qedami sifra
Yednglm kibir tegelet’e yemlja sira
Tesfamichael

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 1
ተመርጣ ታድላ በማየ ቃና
መጀመሪያ ሆነች በማየ ቃና
ቃና ዘገሊላ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 2
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
ታውቋት ስላለችው በማየ ቃና
ወይንኬ አልቦሙ በማየ ቃና
ውሃ ወይን ሲሆን በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 3
ሁሉ አዩ ሰሙ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
አሳላፊዎቹ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 4
ግራ ቢገባቸው በማየ ቃና
የድንግል ማርያም ልጅ በማየ ቃና
ከጭንቅ አወጣቸው በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 5
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
እኛም እናምናለን በማየ ቃና
በእርሷ ትንብልና በማየ ቃና
ስለ ቃልኪዳኗ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 6
ሁሉ እንደሚቀና በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
tesfamichael

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 1
ተመርጣ ታድላ በማየ ቃና
መጀመሪያ ሆነች በማየ ቃና
ቃና ዘገሊላ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 2
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
ታውቋት ስላለችው በማየ ቃና
ወይንኬ አልቦሙ በማየ ቃና
ውሃ ወይን ሲሆን በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 3
ሁሉ አዩ ሰሙ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
አሳላፊዎቹ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 4
ግራ ቢገባቸው በማየ ቃና
የድንግል ማርያም ልጅ በማየ ቃና
ከጭንቅ አወጣቸው በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 5
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
እኛም እናምናለን በማየ ቃና
በእርሷ ትንብልና በማየ ቃና
ስለ ቃልኪዳኗ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 6
ሁሉ እንደሚቀና በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
tesfamichael

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና' THEN lyrics_amharic 
          ELSE 'CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 1
ተመርጣ ታድላ በማየ ቃና
መጀመሪያ ሆነች በማየ ቃና
ቃና ዘገሊላ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 2
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
ታውቋት ስላለችው በማየ ቃና
ወይንኬ አልቦሙ በማየ ቃና
ውሃ ወይን ሲሆን በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 3
ሁሉ አዩ ሰሙ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
አሳላፊዎቹ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 4
ግራ ቢገባቸው በማየ ቃና
የድንግል ማርያም ልጅ በማየ ቃና
ከጭንቅ አወጣቸው በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 5
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
እኛም እናምናለን በማየ ቃና
በእርሷ ትንብልና በማየ ቃና
ስለ ቃልኪዳኗ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 6
ሁሉ እንደሚቀና በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
tesfamichael

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና' 
        END,
        lyrics_transliteration = 'CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 1
Temert’a tadla bemaye qana
Mejemeriya honech bemaye qana
Qana zegelila bemaye qana
Qanan liyadergat yetamru qedami sifra

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 2
Yednglm kibir tegelet’e yemlja sira
Tawqwat silalechw bemaye qana
Weynke albomu bemaye qana
Wiha weyn sihon bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 3
Hulu ayu semu bemaye qana
Qanan liyadergat yetamru qedami sifra
Yednglm kibir tegelet’e yemlja sira
Asalafiwochu bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 4
Gira bigebachew bemaye qana
Yedngl Maryam lij bemaye qana
Kech’nq awet’achew bemaye qana
Qanan liyadergat yetamru qedami sifra

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 5
Yednglm kibir tegelet’e yemlja sira
Egnam enamnalen bemaye qana
Beerswa tinblna bemaye qana
Sile qalkidanwa bemaye qana

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana

VERSE 6
Hulu endemiqena bemaye qana
Qanan liyadergat yetamru qedami sifra
Yednglm kibir tegelet’e yemlja sira
Tesfamichael

CHORUS
Emebetachen banchi milja banchi milja
Dingil Maryam banchi milja
Medhanialem tamr sera bemaye qana x2
Legetachn teamr bemaye qana',
        updated_at = clock_timestamp()::text
    WHERE import_id = '801cc2bf-8109-4738-a79b-3ffc5e841fe8'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 1
ተመርጣ ታድላ በማየ ቃና
መጀመሪያ ሆነች በማየ ቃና
ቃና ዘገሊላ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 2
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
ታውቋት ስላለችው በማየ ቃና
ወይንኬ አልቦሙ በማየ ቃና
ውሃ ወይን ሲሆን በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 3
ሁሉ አዩ ሰሙ በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
አሳላፊዎቹ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 4
ግራ ቢገባቸው በማየ ቃና
የድንግል ማርያም ልጅ በማየ ቃና
ከጭንቅ አወጣቸው በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 5
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
እኛም እናምናለን በማየ ቃና
በእርሷ ትንብልና በማየ ቃና
ስለ ቃልኪዳኗ በማየ ቃና

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና

VERSE 6
ሁሉ እንደሚቀና በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
tesfamichael

CHORUS
እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር በማየ ቃና'
        OR lyrics_amharic IS NOT DISTINCT FROM 'እመቤታችን ባንቺ ምልጃ ባንቺ ምልጃ
ድንግል ማርያም ባንቺ ምልጃ
መድኃኒዓለም ታምር ሰራ በማየ ቃና x2
ለጌታችን ተዓምር ........በማየ ቃና
ተመርጣ ታድላ ..........በማየ ቃና
መጀመሪያ ሆነች ........በማየ ቃና
ቃና ዘገሊላ ...............በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
ታውቋት ስላለችው ......በማየ ቃና
ወይንኬ አልቦሙ.........በማየ ቃና
ውሃ ወይን ሲሆን ........በማየ ቃና
ሁሉ አዩ ሰሙ ............በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
አሳላፊዎቹ .....................በማየ ቃና
ግራ ቢገባቸው ...............በማየ ቃና
የድንግል ማርያም ልጅ .....በማየ ቃና
ከጭንቅ አወጣቸው ........በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
እኛም እናምናለን.........በማየ ቃና
በእርሷ ትንብልና .........በማየ ቃና
ስለ ቃልኪዳኗ............በማየ ቃና
ሁሉ እንደሚቀና .........በማየ ቃና
ቃናን ሊያደርጋት የታምሩ ቀዳሚ ስፍራ
የድንግልም ክብር ተገለጠ የምልጃ ሥራ
tesfamichael'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '801cc2bf-8109-4738-a79b-3ffc5e841fe8'::uuid, 'emebetachin-banchi-melja-yeserg-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ethiopian-orthodox-medina-ena-zelesegna-mezmur ("የመዲና እና ዘለሰኛ መዘሙሮች")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '72bb10e8-1dd6-48a4-9b1a-6676b7028dae'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
… abetu maren amlakachn
Abetu maren amlakachn
Ejg beztwal bedelachn
Silemaryam yiqr belen

VERSE 1
Temats’nenhal fith wedqen
Dawit gezche beasr bir
Adhnin limar
Engdih enkwa enja memaren

CHORUS
… abetu maren amlakachn
Abetu maren amlakachn
Ejg beztwal bedelachn
Silemaryam yiqr belen

VERSE 2
Keamlakye medresen
… abetu maren Getachen
Qola werje t’t’ bizera
Alabb alegn alafera

CHORUS
… abetu maren amlakachn
Abetu maren amlakachn
Ejg beztwal bedelachn
Silemaryam yiqr belen

VERSE 3
Lehwala libse yizolgnal
Aferalehu bilognal
… abetu maren medhanealem
Yeljagered awtata

CHORUS
… abetu maren amlakachn
Abetu maren amlakachn
Ejg beztwal bedelachn
Silemaryam yiqr belen

VERSE 4
Kemengedu dar tegnta
Tey tenesh belwat minew
Yihe alem afer new
… abetu maren amlakachn

CHORUS
… abetu maren amlakachn
Abetu maren amlakachn
Ejg beztwal bedelachn
Silemaryam yiqr belen

VERSE 5
Yeeyerusalem negade
T’alebet alu wenbede
Legenzebuma man azene
Awey nefsun ladane

CHORUS
… abetu maren amlakachn
Abetu maren amlakachn
Ejg beztwal bedelachn
Silemaryam yiqr belen

VERSE 6
… abetu maren medhanealem
Yezare samnt arb qen
Talaq nech’ beg arden
Yetamemutm hulu danu

CHORUS
… abetu maren amlakachn
Abetu maren amlakachn
Ejg beztwal bedelachn
Silemaryam yiqr belen

VERSE 7
Besgawna bedemu
… abetu maren amlakachn
Qola werje t’t’ bizera
Alabb alegn alafera

CHORUS
… abetu maren amlakachn
Abetu maren amlakachn
Ejg beztwal bedelachn
Silemaryam yiqr belen

VERSE 8
Lehwala libse yizolgnal
Aferalehu bilognal
… abetu maren amlakachn

CHORUS
… abetu maren amlakachn
Abetu maren amlakachn
Ejg beztwal bedelachn
Silemaryam yiqr belen'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 1
ተማጽነንሃል ፊትህ ወድቀን
ዳዊት ገዝቼ በአስር ብር
አድህኒን ልማር
እንግዲህ እንኳ እንጃ መማሬን

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 2
ከአምላክየ መድረሴን
… አቤቱ ማረን ጌታችን
ቆላ ወርጄ ጥጥ ብዘራ
አላብብ አለኝ አላፈራ

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 3
ለኋላ ልብሴ ይዞልኛል
አፈራለሁ ብሎኛል
… አቤቱ ማረን መድሃኔዓለም
የልጃገረድ አውታታ

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 4
ከመንገዱ ዳር ተኝታ
ተይ ተነሽ በሏት ምነው
ይሄ ዓለም አፈር ነው
… አቤቱ ማረን አምላካችን

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 5
የእየሩሳሌም ነጋዴ
ጣለበት አሉ ወንበዴ
ለገንዘቡማ ማን አዘነ
አወይ ነፍሱን ላዳነ

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 6
… አቤቱ ማረን መድሃኔዓለም
የዛሬ ሳምንት አርብ ቀን
ታላቅ ነጭ በግ አርደን
የታመሙትም ሁሉ ዳኑ

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 7
በስጋውና በደሙ
… አቤቱ ማረን አምላካችን
ቆላ ወርጄ ጥጥ ብዘራ
አላብብ አለኝ አላፈራ

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 8
ለኋላ ልብሴ ይዞልኛል
አፈራለሁ ብሎኛል
… አቤቱ ማረን አምላካችን

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 1
ተማጽነንሃል ፊትህ ወድቀን
ዳዊት ገዝቼ በአስር ብር
አድህኒን ልማር
እንግዲህ እንኳ እንጃ መማሬን

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 2
ከአምላክየ መድረሴን
… አቤቱ ማረን ጌታችን
ቆላ ወርጄ ጥጥ ብዘራ
አላብብ አለኝ አላፈራ

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 3
ለኋላ ልብሴ ይዞልኛል
አፈራለሁ ብሎኛል
… አቤቱ ማረን መድሃኔዓለም
የልጃገረድ አውታታ

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 4
ከመንገዱ ዳር ተኝታ
ተይ ተነሽ በሏት ምነው
ይሄ ዓለም አፈር ነው
… አቤቱ ማረን አምላካችን

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 5
የእየሩሳሌም ነጋዴ
ጣለበት አሉ ወንበዴ
ለገንዘቡማ ማን አዘነ
አወይ ነፍሱን ላዳነ

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 6
… አቤቱ ማረን መድሃኔዓለም
የዛሬ ሳምንት አርብ ቀን
ታላቅ ነጭ በግ አርደን
የታመሙትም ሁሉ ዳኑ

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 7
በስጋውና በደሙ
… አቤቱ ማረን አምላካችን
ቆላ ወርጄ ጥጥ ብዘራ
አላብብ አለኝ አላፈራ

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 8
ለኋላ ልብሴ ይዞልኛል
አፈራለሁ ብሎኛል
… አቤቱ ማረን አምላካችን

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን' THEN lyrics_amharic 
          ELSE 'CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 1
ተማጽነንሃል ፊትህ ወድቀን
ዳዊት ገዝቼ በአስር ብር
አድህኒን ልማር
እንግዲህ እንኳ እንጃ መማሬን

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 2
ከአምላክየ መድረሴን
… አቤቱ ማረን ጌታችን
ቆላ ወርጄ ጥጥ ብዘራ
አላብብ አለኝ አላፈራ

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 3
ለኋላ ልብሴ ይዞልኛል
አፈራለሁ ብሎኛል
… አቤቱ ማረን መድሃኔዓለም
የልጃገረድ አውታታ

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 4
ከመንገዱ ዳር ተኝታ
ተይ ተነሽ በሏት ምነው
ይሄ ዓለም አፈር ነው
… አቤቱ ማረን አምላካችን

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 5
የእየሩሳሌም ነጋዴ
ጣለበት አሉ ወንበዴ
ለገንዘቡማ ማን አዘነ
አወይ ነፍሱን ላዳነ

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 6
… አቤቱ ማረን መድሃኔዓለም
የዛሬ ሳምንት አርብ ቀን
ታላቅ ነጭ በግ አርደን
የታመሙትም ሁሉ ዳኑ

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 7
በስጋውና በደሙ
… አቤቱ ማረን አምላካችን
ቆላ ወርጄ ጥጥ ብዘራ
አላብብ አለኝ አላፈራ

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 8
ለኋላ ልብሴ ይዞልኛል
አፈራለሁ ብሎኛል
… አቤቱ ማረን አምላካችን

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን' 
        END,
        lyrics_transliteration = 'CHORUS
… abetu maren amlakachn
Abetu maren amlakachn
Ejg beztwal bedelachn
Silemaryam yiqr belen

VERSE 1
Temats’nenhal fith wedqen
Dawit gezche beasr bir
Adhnin limar
Engdih enkwa enja memaren

CHORUS
… abetu maren amlakachn
Abetu maren amlakachn
Ejg beztwal bedelachn
Silemaryam yiqr belen

VERSE 2
Keamlakye medresen
… abetu maren Getachen
Qola werje t’t’ bizera
Alabb alegn alafera

CHORUS
… abetu maren amlakachn
Abetu maren amlakachn
Ejg beztwal bedelachn
Silemaryam yiqr belen

VERSE 3
Lehwala libse yizolgnal
Aferalehu bilognal
… abetu maren medhanealem
Yeljagered awtata

CHORUS
… abetu maren amlakachn
Abetu maren amlakachn
Ejg beztwal bedelachn
Silemaryam yiqr belen

VERSE 4
Kemengedu dar tegnta
Tey tenesh belwat minew
Yihe alem afer new
… abetu maren amlakachn

CHORUS
… abetu maren amlakachn
Abetu maren amlakachn
Ejg beztwal bedelachn
Silemaryam yiqr belen

VERSE 5
Yeeyerusalem negade
T’alebet alu wenbede
Legenzebuma man azene
Awey nefsun ladane

CHORUS
… abetu maren amlakachn
Abetu maren amlakachn
Ejg beztwal bedelachn
Silemaryam yiqr belen

VERSE 6
… abetu maren medhanealem
Yezare samnt arb qen
Talaq nech’ beg arden
Yetamemutm hulu danu

CHORUS
… abetu maren amlakachn
Abetu maren amlakachn
Ejg beztwal bedelachn
Silemaryam yiqr belen

VERSE 7
Besgawna bedemu
… abetu maren amlakachn
Qola werje t’t’ bizera
Alabb alegn alafera

CHORUS
… abetu maren amlakachn
Abetu maren amlakachn
Ejg beztwal bedelachn
Silemaryam yiqr belen

VERSE 8
Lehwala libse yizolgnal
Aferalehu bilognal
… abetu maren amlakachn

CHORUS
… abetu maren amlakachn
Abetu maren amlakachn
Ejg beztwal bedelachn
Silemaryam yiqr belen',
        updated_at = clock_timestamp()::text
    WHERE import_id = '72bb10e8-1dd6-48a4-9b1a-6676b7028dae'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 1
ተማጽነንሃል ፊትህ ወድቀን
ዳዊት ገዝቼ በአስር ብር
አድህኒን ልማር
እንግዲህ እንኳ እንጃ መማሬን

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 2
ከአምላክየ መድረሴን
… አቤቱ ማረን ጌታችን
ቆላ ወርጄ ጥጥ ብዘራ
አላብብ አለኝ አላፈራ

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 3
ለኋላ ልብሴ ይዞልኛል
አፈራለሁ ብሎኛል
… አቤቱ ማረን መድሃኔዓለም
የልጃገረድ አውታታ

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 4
ከመንገዱ ዳር ተኝታ
ተይ ተነሽ በሏት ምነው
ይሄ ዓለም አፈር ነው
… አቤቱ ማረን አምላካችን

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 5
የእየሩሳሌም ነጋዴ
ጣለበት አሉ ወንበዴ
ለገንዘቡማ ማን አዘነ
አወይ ነፍሱን ላዳነ

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 6
… አቤቱ ማረን መድሃኔዓለም
የዛሬ ሳምንት አርብ ቀን
ታላቅ ነጭ በግ አርደን
የታመሙትም ሁሉ ዳኑ

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 7
በስጋውና በደሙ
… አቤቱ ማረን አምላካችን
ቆላ ወርጄ ጥጥ ብዘራ
አላብብ አለኝ አላፈራ

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን

VERSE 8
ለኋላ ልብሴ ይዞልኛል
አፈራለሁ ብሎኛል
… አቤቱ ማረን አምላካችን

CHORUS
… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን'
        OR lyrics_amharic IS NOT DISTINCT FROM '… አቤቱ ማረን አምላካችን
አቤቱ ማረን አምላካችን
እጅግ በዝቷል በደላችን
ስለማርያም ይቅር በለን
ተማጽነንሃል ፊትህ ወድቀን
ዳዊት ገዝቼ በአስር ብር
አድህኒን ልማር
እንግዲህ እንኳ እንጃ መማሬን
ከአምላክየ መድረሴን
… አቤቱ ማረን ጌታችን
ቆላ ወርጄ ጥጥ ብዘራ
አላብብ አለኝ አላፈራ
ለኋላ ልብሴ ይዞልኛል
አፈራለሁ ብሎኛል
… አቤቱ ማረን መድሃኔዓለም
የልጃገረድ አውታታ
ከመንገዱ ዳር ተኝታ
ተይ ተነሽ በሏት ምነው
ይሄ ዓለም አፈር ነው
… አቤቱ ማረን አምላካችን
የእየሩሳሌም ነጋዴ
ጣለበት አሉ ወንበዴ
ለገንዘቡማ ማን አዘነ
አወይ ነፍሱን ላዳነ
… አቤቱ ማረን መድሃኔዓለም
የዛሬ ሳምንት አርብ ቀን
ታላቅ ነጭ በግ አርደን
የታመሙትም ሁሉ ዳኑ
በስጋውና በደሙ
… አቤቱ ማረን አምላካችን
ቆላ ወርጄ ጥጥ ብዘራ
አላብብ አለኝ አላፈራ
ለኋላ ልብሴ ይዞልኛል
አፈራለሁ ብሎኛል
… አቤቱ ማረን አምላካችን'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '72bb10e8-1dd6-48a4-9b1a-6676b7028dae'::uuid, 'ethiopian-orthodox-medina-ena-zelesegna-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ye-meskel-mezmur-meskel-abeba-tiln-bemeskelu-gedele ("የመስቀል ዝማሬ መስቀል አበባ ጥልን በመስቀሉ ገደለ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '52b13b95-1917-45d1-b864-052530fa351e'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mesqel abeba
Mesqel abeba neh wib abeba
Adey abeba nesh wib abeba

VERSE 1
Mesqel abeba teqebro sinor
Adey abeba sine siqletu
Mesqel abeba eleni agegnech
Adey abeba degegnaytu

CHORUS
Mesqel abeba
Mesqel abeba neh wib abeba
Adey abeba nesh wib abeba

VERSE 2
Mesqel abeba t’ragiwn moltew
Adey abeba ayhud bekfat
Mesqel abeba t’isu segede
Adey abeba mesqel kalebet

CHORUS
Mesqel abeba
Mesqel abeba neh wib abeba
Adey abeba nesh wib abeba

VERSE 3
Mesqel abeba wenzu jiretu
Adey abeba sheleqo duru
Mesqel abeba ashebrqew demqew
Adey abeba lante mesekeru

CHORUS
Mesqel abeba
Mesqel abeba neh wib abeba
Adey abeba nesh wib abeba

VERSE 4
Mesqel abeba teqebro sinor
Adey abeba sine siqletu
Mesqel abeba eleni agegnech
Adey abeba degegnaytu

CHORUS
Mesqel abeba
Mesqel abeba neh wib abeba
Adey abeba nesh wib abeba

VERSE 5
T’ln bemesqelu gedele
T’ln bemesqelu gedele (2)
Bemesqelu lesew lij selamn adele (2)

CHORUS
Mesqel abeba
Mesqel abeba neh wib abeba
Adey abeba nesh wib abeba'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 1
መስቀል አበባ ተቀብሮ ሲኖር
አደይ አበባ ስነ ስቅለቱ
መስቀል አበባ እሌኒ አገኘች
አደይ አበባ ደገኛይቱ

CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 2
መስቀል አበባ ጥራጊውን ሞልተው
አደይ አበባ አይሁድ በክፋት
መስቀል አበባ ጢሱ ሰገደ
አደይ አበባ መስቀል ካለበት

CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 3
መስቀል አበባ ወንዙ ጅረቱ
አደይ አበባ ሸለቆ ዱሩ
መስቀል አበባ አሸብርቀው ደምቀው
አደይ አበባ ላንተ መሰከሩ

CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 4
መስቀል አበባ ተቀብሮ ሲኖር
አደይ አበባ ስነ ስቅለቱ
መስቀል አበባ እሌኒ አገኘች
አደይ አበባ ደገኛይቱ

CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 5
ጥልን በመስቀሉ ገደለ
ጥልን በመስቀሉ ገደለ (2)
በመስቀሉ ለሰው ልጅ ሰላምን አደለ (2)

CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 1
መስቀል አበባ ተቀብሮ ሲኖር
አደይ አበባ ስነ ስቅለቱ
መስቀል አበባ እሌኒ አገኘች
አደይ አበባ ደገኛይቱ

CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 2
መስቀል አበባ ጥራጊውን ሞልተው
አደይ አበባ አይሁድ በክፋት
መስቀል አበባ ጢሱ ሰገደ
አደይ አበባ መስቀል ካለበት

CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 3
መስቀል አበባ ወንዙ ጅረቱ
አደይ አበባ ሸለቆ ዱሩ
መስቀል አበባ አሸብርቀው ደምቀው
አደይ አበባ ላንተ መሰከሩ

CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 4
መስቀል አበባ ተቀብሮ ሲኖር
አደይ አበባ ስነ ስቅለቱ
መስቀል አበባ እሌኒ አገኘች
አደይ አበባ ደገኛይቱ

CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 5
ጥልን በመስቀሉ ገደለ
ጥልን በመስቀሉ ገደለ (2)
በመስቀሉ ለሰው ልጅ ሰላምን አደለ (2)

CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ' THEN lyrics_amharic 
          ELSE 'CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 1
መስቀል አበባ ተቀብሮ ሲኖር
አደይ አበባ ስነ ስቅለቱ
መስቀል አበባ እሌኒ አገኘች
አደይ አበባ ደገኛይቱ

CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 2
መስቀል አበባ ጥራጊውን ሞልተው
አደይ አበባ አይሁድ በክፋት
መስቀል አበባ ጢሱ ሰገደ
አደይ አበባ መስቀል ካለበት

CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 3
መስቀል አበባ ወንዙ ጅረቱ
አደይ አበባ ሸለቆ ዱሩ
መስቀል አበባ አሸብርቀው ደምቀው
አደይ አበባ ላንተ መሰከሩ

CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 4
መስቀል አበባ ተቀብሮ ሲኖር
አደይ አበባ ስነ ስቅለቱ
መስቀል አበባ እሌኒ አገኘች
አደይ አበባ ደገኛይቱ

CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 5
ጥልን በመስቀሉ ገደለ
ጥልን በመስቀሉ ገደለ (2)
በመስቀሉ ለሰው ልጅ ሰላምን አደለ (2)

CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ' 
        END,
        lyrics_transliteration = 'CHORUS
Mesqel abeba
Mesqel abeba neh wib abeba
Adey abeba nesh wib abeba

VERSE 1
Mesqel abeba teqebro sinor
Adey abeba sine siqletu
Mesqel abeba eleni agegnech
Adey abeba degegnaytu

CHORUS
Mesqel abeba
Mesqel abeba neh wib abeba
Adey abeba nesh wib abeba

VERSE 2
Mesqel abeba t’ragiwn moltew
Adey abeba ayhud bekfat
Mesqel abeba t’isu segede
Adey abeba mesqel kalebet

CHORUS
Mesqel abeba
Mesqel abeba neh wib abeba
Adey abeba nesh wib abeba

VERSE 3
Mesqel abeba wenzu jiretu
Adey abeba sheleqo duru
Mesqel abeba ashebrqew demqew
Adey abeba lante mesekeru

CHORUS
Mesqel abeba
Mesqel abeba neh wib abeba
Adey abeba nesh wib abeba

VERSE 4
Mesqel abeba teqebro sinor
Adey abeba sine siqletu
Mesqel abeba eleni agegnech
Adey abeba degegnaytu

CHORUS
Mesqel abeba
Mesqel abeba neh wib abeba
Adey abeba nesh wib abeba

VERSE 5
T’ln bemesqelu gedele
T’ln bemesqelu gedele (2)
Bemesqelu lesew lij selamn adele (2)

CHORUS
Mesqel abeba
Mesqel abeba neh wib abeba
Adey abeba nesh wib abeba',
        updated_at = clock_timestamp()::text
    WHERE import_id = '52b13b95-1917-45d1-b864-052530fa351e'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 1
መስቀል አበባ ተቀብሮ ሲኖር
አደይ አበባ ስነ ስቅለቱ
መስቀል አበባ እሌኒ አገኘች
አደይ አበባ ደገኛይቱ

CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 2
መስቀል አበባ ጥራጊውን ሞልተው
አደይ አበባ አይሁድ በክፋት
መስቀል አበባ ጢሱ ሰገደ
አደይ አበባ መስቀል ካለበት

CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 3
መስቀል አበባ ወንዙ ጅረቱ
አደይ አበባ ሸለቆ ዱሩ
መስቀል አበባ አሸብርቀው ደምቀው
አደይ አበባ ላንተ መሰከሩ

CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 4
መስቀል አበባ ተቀብሮ ሲኖር
አደይ አበባ ስነ ስቅለቱ
መስቀል አበባ እሌኒ አገኘች
አደይ አበባ ደገኛይቱ

CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ

VERSE 5
ጥልን በመስቀሉ ገደለ
ጥልን በመስቀሉ ገደለ (2)
በመስቀሉ ለሰው ልጅ ሰላምን አደለ (2)

CHORUS
መስቀል አበባ
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ'
        OR lyrics_amharic IS NOT DISTINCT FROM '✝️መስቀል አበባ✝️
መስቀል አበባ ነህ ውብ አበባ
አደይ አበባ ነሽ ውብ አበባ
አዝ_
መስቀል አበባ ተቀብሮ ሲኖር
አደይ አበባ ስነ ስቅለቱ
መስቀል አበባ እሌኒ አገኘች
አደይ አበባ ደገኛይቱ
አዝ____
መስቀል አበባ ጥራጊውን ሞልተው
አደይ አበባ አይሁድ በክፋት
መስቀል አበባ ጢሱ ሰገደ
አደይ አበባ መስቀል ካለበት
አዝ____
መስቀል አበባ ወንዙ ጅረቱ
አደይ አበባ ሸለቆ ዱሩ
መስቀል አበባ አሸብርቀው ደምቀው
አደይ አበባ ላንተ መሰከሩ
አዝ_
መስቀል አበባ ተቀብሮ ሲኖር
አደይ አበባ ስነ ስቅለቱ
መስቀል አበባ እሌኒ አገኘች
አደይ አበባ ደገኛይቱ
✝️ጥልን በመስቀሉ ገደለ✝️
ጥልን በመስቀሉ ገደለ (*2)
በመስቀሉ ለሰው ልጅ ሰላምን አደለ (*2)'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '52b13b95-1917-45d1-b864-052530fa351e'::uuid, 'ye-meskel-mezmur-meskel-abeba-tiln-bemeskelu-gedele', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- betach ("ከፈጣሪ በታች ከፍጡራን በላይ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2ee511d0-16c7-4c1c-a15b-0ee5abb8bcd4'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kefet’ari betach keft’uran belay
Man ale endanch emu leadonay (2)

VERSE 1
Kebete siwet’a dejochshn sime
Yelben sinegrsh sielsh fit qome
Alkelekelshgnm yeejshn bereket
Aqomshgn bemljash kedesta segenet

CHORUS
Kefet’ari betach keft’uran belay
Man ale endanch emu leadonay (2)

VERSE 2
Yefqrsh net’ebt’ab net’bwal kelbe lay
Ch’ereqan tech’amtesh negseshal besemay
Kewakbt aklilsh ts’eheyn lebseshal
Ts’won des yibelsh Egziabher wedoshal

CHORUS
Kefet’ari betach keft’uran belay
Man ale endanch emu leadonay (2)

VERSE 3
Zelalemawi new yach diglna
Liul adrgoshal yet’bebu fana
Yesemayun Geta fet’arishn weldesh
Yekebersh honeshal kesew teleytesh

CHORUS
Kefet’ari betach keft’uran belay
Man ale endanch emu leadonay (2)

VERSE 4
Bemanna bemn Dingil enmeslsh
Andm fit’ur yelem yemitekakelsh
Yengusu enat yeadam zer emebet
Libonachn tasrwal befqrsh qelebet

CHORUS
Kefet’ari betach keft’uran belay
Man ale endanch emu leadonay (2)'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)

VERSE 1
ከቤቴ ስወጣ ደጆችሽን ስሜ
የልቤን ስነግርሽ ስዕልሽ ፊት ቆሜ
አልከለከልሽኝም የእጅሽን በረከት
አቆምሽኝ በምልጃሽ ከደስታ ሰገነት

CHORUS
ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)

VERSE 2
የፍቅርሽ ነጠብጣብ ነጥቧል ከልቤ ላይ
ጨረቃን ተጫምተሽ ነግሰሻል በሰማይ
ከዋክብት አክሊልሽ ፀሀይን ለብሰሻል
ጽዎን ደስ ይበልሽ እግዚአብሔር ወዶሻል

CHORUS
ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)

VERSE 3
ዘላለማዊ ነው ያች ድግልና
ልዑል አድርጎሻል የጥበቡ ፋና
የሰማዩን ጌታ ፈጣሪሽን ወልደሽ
የከበርሽ ሆነሻል ከሰው ተለይተሽ

CHORUS
ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)

VERSE 4
በማንና በምን ድንግል እንመስልሽ
አንድም ፍጡር የለም የሚተካከልሽ
የንጉሱ እናት የአዳም ዘር እመቤት
ልቦናችን ታስሯል በፍቅርሽ ቀለበት

CHORUS
ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)

VERSE 1
ከቤቴ ስወጣ ደጆችሽን ስሜ
የልቤን ስነግርሽ ስዕልሽ ፊት ቆሜ
አልከለከልሽኝም የእጅሽን በረከት
አቆምሽኝ በምልጃሽ ከደስታ ሰገነት

CHORUS
ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)

VERSE 2
የፍቅርሽ ነጠብጣብ ነጥቧል ከልቤ ላይ
ጨረቃን ተጫምተሽ ነግሰሻል በሰማይ
ከዋክብት አክሊልሽ ፀሀይን ለብሰሻል
ጽዎን ደስ ይበልሽ እግዚአብሔር ወዶሻል

CHORUS
ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)

VERSE 3
ዘላለማዊ ነው ያች ድግልና
ልዑል አድርጎሻል የጥበቡ ፋና
የሰማዩን ጌታ ፈጣሪሽን ወልደሽ
የከበርሽ ሆነሻል ከሰው ተለይተሽ

CHORUS
ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)

VERSE 4
በማንና በምን ድንግል እንመስልሽ
አንድም ፍጡር የለም የሚተካከልሽ
የንጉሱ እናት የአዳም ዘር እመቤት
ልቦናችን ታስሯል በፍቅርሽ ቀለበት

CHORUS
ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)' THEN lyrics_amharic 
          ELSE 'CHORUS
ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)

VERSE 1
ከቤቴ ስወጣ ደጆችሽን ስሜ
የልቤን ስነግርሽ ስዕልሽ ፊት ቆሜ
አልከለከልሽኝም የእጅሽን በረከት
አቆምሽኝ በምልጃሽ ከደስታ ሰገነት

CHORUS
ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)

VERSE 2
የፍቅርሽ ነጠብጣብ ነጥቧል ከልቤ ላይ
ጨረቃን ተጫምተሽ ነግሰሻል በሰማይ
ከዋክብት አክሊልሽ ፀሀይን ለብሰሻል
ጽዎን ደስ ይበልሽ እግዚአብሔር ወዶሻል

CHORUS
ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)

VERSE 3
ዘላለማዊ ነው ያች ድግልና
ልዑል አድርጎሻል የጥበቡ ፋና
የሰማዩን ጌታ ፈጣሪሽን ወልደሽ
የከበርሽ ሆነሻል ከሰው ተለይተሽ

CHORUS
ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)

VERSE 4
በማንና በምን ድንግል እንመስልሽ
አንድም ፍጡር የለም የሚተካከልሽ
የንጉሱ እናት የአዳም ዘር እመቤት
ልቦናችን ታስሯል በፍቅርሽ ቀለበት

CHORUS
ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)' 
        END,
        lyrics_transliteration = 'CHORUS
Kefet’ari betach keft’uran belay
Man ale endanch emu leadonay (2)

VERSE 1
Kebete siwet’a dejochshn sime
Yelben sinegrsh sielsh fit qome
Alkelekelshgnm yeejshn bereket
Aqomshgn bemljash kedesta segenet

CHORUS
Kefet’ari betach keft’uran belay
Man ale endanch emu leadonay (2)

VERSE 2
Yefqrsh net’ebt’ab net’bwal kelbe lay
Ch’ereqan tech’amtesh negseshal besemay
Kewakbt aklilsh ts’eheyn lebseshal
Ts’won des yibelsh Egziabher wedoshal

CHORUS
Kefet’ari betach keft’uran belay
Man ale endanch emu leadonay (2)

VERSE 3
Zelalemawi new yach diglna
Liul adrgoshal yet’bebu fana
Yesemayun Geta fet’arishn weldesh
Yekebersh honeshal kesew teleytesh

CHORUS
Kefet’ari betach keft’uran belay
Man ale endanch emu leadonay (2)

VERSE 4
Bemanna bemn Dingil enmeslsh
Andm fit’ur yelem yemitekakelsh
Yengusu enat yeadam zer emebet
Libonachn tasrwal befqrsh qelebet

CHORUS
Kefet’ari betach keft’uran belay
Man ale endanch emu leadonay (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2ee511d0-16c7-4c1c-a15b-0ee5abb8bcd4'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)

VERSE 1
ከቤቴ ስወጣ ደጆችሽን ስሜ
የልቤን ስነግርሽ ስዕልሽ ፊት ቆሜ
አልከለከልሽኝም የእጅሽን በረከት
አቆምሽኝ በምልጃሽ ከደስታ ሰገነት

CHORUS
ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)

VERSE 2
የፍቅርሽ ነጠብጣብ ነጥቧል ከልቤ ላይ
ጨረቃን ተጫምተሽ ነግሰሻል በሰማይ
ከዋክብት አክሊልሽ ፀሀይን ለብሰሻል
ጽዎን ደስ ይበልሽ እግዚአብሔር ወዶሻል

CHORUS
ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)

VERSE 3
ዘላለማዊ ነው ያች ድግልና
ልዑል አድርጎሻል የጥበቡ ፋና
የሰማዩን ጌታ ፈጣሪሽን ወልደሽ
የከበርሽ ሆነሻል ከሰው ተለይተሽ

CHORUS
ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)

VERSE 4
በማንና በምን ድንግል እንመስልሽ
አንድም ፍጡር የለም የሚተካከልሽ
የንጉሱ እናት የአዳም ዘር እመቤት
ልቦናችን ታስሯል በፍቅርሽ ቀለበት

CHORUS
ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ከፈጣሪ በታች ከፍጡራን በላይ
ማን አለ እንዳንች እሙ ለአዶናይ(2)
አዝ
ከቤቴ ስወጣ ደጆችሽን ስሜ
የልቤን ስነግርሽ ስዕልሽ ፊት ቆሜ
አልከለከልሽኝም የእጅሽን በረከት
አቆምሽኝ በምልጃሽ ከደስታ ሰገነት
አዝ
የፍቅርሽ ነጠብጣብ ነጥቧል ከልቤ ላይ
ጨረቃን ተጫምተሽ ነግሰሻል በሰማይ
ከዋክብት አክሊልሽ ፀሀይን ለብሰሻል
ጽዎን ደስ ይበልሽ እግዚአብሔር ወዶሻል
አዝ
ዘላለማዊ ነው ያች ድግልና
ልዑል አድርጎሻል የጥበቡ ፋና
የሰማዩን ጌታ ፈጣሪሽን ወልደሽ
የከበርሽ ሆነሻል ከሰው ተለይተሽ
አዝ
በማንና በምን ድንግል እንመስልሽ
አንድም ፍጡር የለም የሚተካከልሽ
የንጉሱ እናት የአዳም ዘር እመቤት
ልቦናችን ታስሯል በፍቅርሽ ቀለበት'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2ee511d0-16c7-4c1c-a15b-0ee5abb8bcd4'::uuid, 'betach', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- dinik-yehibiret-zimare-anurognal-cherinetih ("ድንቅ የህብረት ዝማሬ አኑሮኛል ቸርነትህ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b7f0ff4e-3507-4baa-af3e-64cee4ab6506'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anurognal cherneth
Lik yelelew degneth
Ende ante aynet ket yigegnal
Hulum neger tiz yilegnal

VERSE 1
A/z
Yachi fewash adagn ejhzarem leene tezergta
Behet’iyat erqe edalgwaz asreኸgnal bewleta
Degmos hiwet mirch’a bihon

CHORUS
Anurognal cherneth
Lik yelelew degneth
Ende ante aynet ket yigegnal
Hulum neger tiz yilegnal

VERSE 2
Kante wedeman yikedal
Abate fiqrh ekogetaye fiqrk eko
Alemn yaskdal
A/z

CHORUS
Anurognal cherneth
Lik yelelew degneth
Ende ante aynet ket yigegnal
Hulum neger tiz yilegnal

VERSE 3
Moche neber teqebre Geta wedene batmet’a
Ante moten batmotlgn wedet neber yeene et’a
Kentu neber manneteteshenafi lezich alem
Gin ante yeyazkew abate

CHORUS
Anurognal cherneth
Lik yelelew degneth
Ende ante aynet ket yigegnal
Hulum neger tiz yilegnal

VERSE 4
Yeyazkew yinoral zelalem

CHORUS
Anurognal cherneth
Lik yelelew degneth
Ende ante aynet ket yigegnal
Hulum neger tiz yilegnal

VERSE 5
Meqdeskn tet’egche aychalehu bizu neger
Belbewst’yasqemet’kutedihlesew
Mayneger
Gin yehonew hulum hono yelem zare yalalefe

CHORUS
Anurognal cherneth
Lik yelelew degneth
Ende ante aynet ket yigegnal
Hulum neger tiz yilegnal

VERSE 6
Yemekeraw esat yefetenaw esatbante eyetalefe

CHORUS
Anurognal cherneth
Lik yelelew degneth
Ende ante aynet ket yigegnal
Hulum neger tiz yilegnal

VERSE 7
Ayt’efagnm yafegegtah lije bileh yasayኸgn
Amets’egnamet’fom hogne betkeshah layyanorkegn
Endim yale wedaj ale eyet’elut yemiyafeqr
Simumeyesusnewsmumeyesusnew

CHORUS
Anurognal cherneth
Lik yelelew degneth
Ende ante aynet ket yigegnal
Hulum neger tiz yilegnal

VERSE 8
Yets’dqachn mist’ir

CHORUS
Anurognal cherneth
Lik yelelew degneth
Ende ante aynet ket yigegnal
Hulum neger tiz yilegnal'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 1
አ/ዝ
ያቺ ፈዋሽ አዳኝ እጅህዛሬም ለእኔ ተዘርግታ
በሀጢያት እርቄ እዳልጓዝ አስረኸኛል በውለታ
ደግሞስ ሒወት ምርጫ ቢሆን

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 2
ካንተ ወደማን ይኬዳል
አባቴ ፍቅርህ እኮጌታዬ ፍቅርክ እኮ
አለምን ያስክዳል
አ/ዝ

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 3
ሞቼ ነበር ተቀብሬ ጌታ ወደኔ ባትመጣ
አንተ ሞቴን ባትሞትልኝ ወዴት ነበር የእኔ እጣ
ከንቱ ነበር ማንነቴተሸናፊ ለዚች አለም
ግን አንተ የያዝከው አባቴ

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 4
የያዝከው ይኖራል ዘላለም

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 5
መቅደስክን ተጠግቼ አይቻለሁ ብዙ ነገር
በልቤውስጥያስቀመጥኩትእዲህለሰው
ማይነገር
ግን የሆነው ሁሉም ሆኖ የለም ዛሬ ያላለፈ

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 6
የመከራው እሳት የፈተናው እሳትባንተ እየታለፈ

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 7
አይጠፋኝም ያፈገግታህ ልጄ ብለህ ያሳይኸኝ
አመፀኛመጥፎም ሆኜ በትከሻህ ላይያኖርከኝ
እንዲም ያለ ወዳጅ አለ እየጠሉት የሚያፈቅር
ስሙምእየሱስነውስሙምእየሱስነው

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 8
የፅድቃችን ሚስጢር

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 1
አ/ዝ
ያቺ ፈዋሽ አዳኝ እጅህዛሬም ለእኔ ተዘርግታ
በሀጢያት እርቄ እዳልጓዝ አስረኸኛል በውለታ
ደግሞስ ሒወት ምርጫ ቢሆን

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 2
ካንተ ወደማን ይኬዳል
አባቴ ፍቅርህ እኮጌታዬ ፍቅርክ እኮ
አለምን ያስክዳል
አ/ዝ

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 3
ሞቼ ነበር ተቀብሬ ጌታ ወደኔ ባትመጣ
አንተ ሞቴን ባትሞትልኝ ወዴት ነበር የእኔ እጣ
ከንቱ ነበር ማንነቴተሸናፊ ለዚች አለም
ግን አንተ የያዝከው አባቴ

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 4
የያዝከው ይኖራል ዘላለም

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 5
መቅደስክን ተጠግቼ አይቻለሁ ብዙ ነገር
በልቤውስጥያስቀመጥኩትእዲህለሰው
ማይነገር
ግን የሆነው ሁሉም ሆኖ የለም ዛሬ ያላለፈ

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 6
የመከራው እሳት የፈተናው እሳትባንተ እየታለፈ

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 7
አይጠፋኝም ያፈገግታህ ልጄ ብለህ ያሳይኸኝ
አመፀኛመጥፎም ሆኜ በትከሻህ ላይያኖርከኝ
እንዲም ያለ ወዳጅ አለ እየጠሉት የሚያፈቅር
ስሙምእየሱስነውስሙምእየሱስነው

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 8
የፅድቃችን ሚስጢር

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል' THEN lyrics_amharic 
          ELSE 'CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 1
አ/ዝ
ያቺ ፈዋሽ አዳኝ እጅህዛሬም ለእኔ ተዘርግታ
በሀጢያት እርቄ እዳልጓዝ አስረኸኛል በውለታ
ደግሞስ ሒወት ምርጫ ቢሆን

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 2
ካንተ ወደማን ይኬዳል
አባቴ ፍቅርህ እኮጌታዬ ፍቅርክ እኮ
አለምን ያስክዳል
አ/ዝ

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 3
ሞቼ ነበር ተቀብሬ ጌታ ወደኔ ባትመጣ
አንተ ሞቴን ባትሞትልኝ ወዴት ነበር የእኔ እጣ
ከንቱ ነበር ማንነቴተሸናፊ ለዚች አለም
ግን አንተ የያዝከው አባቴ

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 4
የያዝከው ይኖራል ዘላለም

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 5
መቅደስክን ተጠግቼ አይቻለሁ ብዙ ነገር
በልቤውስጥያስቀመጥኩትእዲህለሰው
ማይነገር
ግን የሆነው ሁሉም ሆኖ የለም ዛሬ ያላለፈ

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 6
የመከራው እሳት የፈተናው እሳትባንተ እየታለፈ

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 7
አይጠፋኝም ያፈገግታህ ልጄ ብለህ ያሳይኸኝ
አመፀኛመጥፎም ሆኜ በትከሻህ ላይያኖርከኝ
እንዲም ያለ ወዳጅ አለ እየጠሉት የሚያፈቅር
ስሙምእየሱስነውስሙምእየሱስነው

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 8
የፅድቃችን ሚስጢር

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል' 
        END,
        lyrics_transliteration = 'CHORUS
Anurognal cherneth
Lik yelelew degneth
Ende ante aynet ket yigegnal
Hulum neger tiz yilegnal

VERSE 1
A/z
Yachi fewash adagn ejhzarem leene tezergta
Behet’iyat erqe edalgwaz asreኸgnal bewleta
Degmos hiwet mirch’a bihon

CHORUS
Anurognal cherneth
Lik yelelew degneth
Ende ante aynet ket yigegnal
Hulum neger tiz yilegnal

VERSE 2
Kante wedeman yikedal
Abate fiqrh ekogetaye fiqrk eko
Alemn yaskdal
A/z

CHORUS
Anurognal cherneth
Lik yelelew degneth
Ende ante aynet ket yigegnal
Hulum neger tiz yilegnal

VERSE 3
Moche neber teqebre Geta wedene batmet’a
Ante moten batmotlgn wedet neber yeene et’a
Kentu neber manneteteshenafi lezich alem
Gin ante yeyazkew abate

CHORUS
Anurognal cherneth
Lik yelelew degneth
Ende ante aynet ket yigegnal
Hulum neger tiz yilegnal

VERSE 4
Yeyazkew yinoral zelalem

CHORUS
Anurognal cherneth
Lik yelelew degneth
Ende ante aynet ket yigegnal
Hulum neger tiz yilegnal

VERSE 5
Meqdeskn tet’egche aychalehu bizu neger
Belbewst’yasqemet’kutedihlesew
Mayneger
Gin yehonew hulum hono yelem zare yalalefe

CHORUS
Anurognal cherneth
Lik yelelew degneth
Ende ante aynet ket yigegnal
Hulum neger tiz yilegnal

VERSE 6
Yemekeraw esat yefetenaw esatbante eyetalefe

CHORUS
Anurognal cherneth
Lik yelelew degneth
Ende ante aynet ket yigegnal
Hulum neger tiz yilegnal

VERSE 7
Ayt’efagnm yafegegtah lije bileh yasayኸgn
Amets’egnamet’fom hogne betkeshah layyanorkegn
Endim yale wedaj ale eyet’elut yemiyafeqr
Simumeyesusnewsmumeyesusnew

CHORUS
Anurognal cherneth
Lik yelelew degneth
Ende ante aynet ket yigegnal
Hulum neger tiz yilegnal

VERSE 8
Yets’dqachn mist’ir

CHORUS
Anurognal cherneth
Lik yelelew degneth
Ende ante aynet ket yigegnal
Hulum neger tiz yilegnal',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b7f0ff4e-3507-4baa-af3e-64cee4ab6506'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 1
አ/ዝ
ያቺ ፈዋሽ አዳኝ እጅህዛሬም ለእኔ ተዘርግታ
በሀጢያት እርቄ እዳልጓዝ አስረኸኛል በውለታ
ደግሞስ ሒወት ምርጫ ቢሆን

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 2
ካንተ ወደማን ይኬዳል
አባቴ ፍቅርህ እኮጌታዬ ፍቅርክ እኮ
አለምን ያስክዳል
አ/ዝ

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 3
ሞቼ ነበር ተቀብሬ ጌታ ወደኔ ባትመጣ
አንተ ሞቴን ባትሞትልኝ ወዴት ነበር የእኔ እጣ
ከንቱ ነበር ማንነቴተሸናፊ ለዚች አለም
ግን አንተ የያዝከው አባቴ

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 4
የያዝከው ይኖራል ዘላለም

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 5
መቅደስክን ተጠግቼ አይቻለሁ ብዙ ነገር
በልቤውስጥያስቀመጥኩትእዲህለሰው
ማይነገር
ግን የሆነው ሁሉም ሆኖ የለም ዛሬ ያላለፈ

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 6
የመከራው እሳት የፈተናው እሳትባንተ እየታለፈ

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 7
አይጠፋኝም ያፈገግታህ ልጄ ብለህ ያሳይኸኝ
አመፀኛመጥፎም ሆኜ በትከሻህ ላይያኖርከኝ
እንዲም ያለ ወዳጅ አለ እየጠሉት የሚያፈቅር
ስሙምእየሱስነውስሙምእየሱስነው

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል

VERSE 8
የፅድቃችን ሚስጢር

CHORUS
አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል'
        OR lyrics_amharic IS NOT DISTINCT FROM 'አኑሮኛል ቸርነትህ
ልክ የሌለው ደግነትህ
እንደ አንተ አይነት ኬት ይገኛል
ሁሉም ነገር ትዝ ይለኛል
አ/ዝ
ያቺ ፈዋሽ አዳኝ እጅህዛሬም ለእኔ ተዘርግታ
በሀጢያት እርቄ እዳልጓዝ አስረኸኛል በውለታ
ደግሞስ ሒወት ምርጫ ቢሆን
ካንተ ወደማን ይኬዳል
አባቴ ፍቅርህ እኮጌታዬ ፍቅርክ እኮ
አለምን ያስክዳል
አ/ዝ
ሞቼ ነበር ተቀብሬ ጌታ ወደኔ ባትመጣ
አንተ ሞቴን ባትሞትልኝ ወዴት ነበር የእኔ እጣ
ከንቱ ነበር ማንነቴተሸናፊ ለዚች አለም
ግን አንተ የያዝከው አባቴ
የያዝከው ይኖራል ዘላለም
አዝ
መቅደስክን ተጠግቼ አይቻለሁ ብዙ ነገር
በልቤውስጥያስቀመጥኩትእዲህለሰው
ማይነገር
ግን የሆነው ሁሉም ሆኖ የለም ዛሬ ያላለፈ
የመከራው እሳት የፈተናው እሳትባንተ እየታለፈ
አዝ
አይጠፋኝም ያፈገግታህ ልጄ ብለህ ያሳይኸኝ
አመፀኛመጥፎም ሆኜ በትከሻህ ላይያኖርከኝ
እንዲም ያለ ወዳጅ አለ እየጠሉት የሚያፈቅር
ስሙምእየሱስነውስሙምእየሱስነው
የፅድቃችን ሚስጢር'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b7f0ff4e-3507-4baa-af3e-64cee4ab6506'::uuid, 'dinik-yehibiret-zimare-anurognal-cherinetih', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- emenu-beerisu-dinik-yaderigal-geta ("እመኑ በእርሱ ድንቅ ያደርጋል ጌታ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ab668ecf-bcdd-4cba-b421-e9377f0a4459'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Emenu beersu
Emenu beersu dinq yadergal Geta
Beredo aznbo t’elat eyemeta
Wiqyanos t’lqun fet’no eyatenene

VERSE 1
Neger lewet’e hulu bersu hone

CHORUS
Emenu beersu
Emenu beersu dinq yadergal Geta
Beredo aznbo t’elat eyemeta
Wiqyanos t’lqun fet’no eyatenene

VERSE 2
Emenu beersu teraraw tenade
Emenu beersu sheleqow taweke
Emenu beersu zigbaw tesebabro
Emenu beersu aletu deqeqe

CHORUS
Emenu beersu
Emenu beersu dinq yadergal Geta
Beredo aznbo t’elat eyemeta
Wiqyanos t’lqun fet’no eyatenene

VERSE 3
Emenu beersu yeahzab t’aotat
Emenu beersu befitu regefu
Emenu beersu besmu yetamenu
Emenu beersu wejebun qezefu

CHORUS
Emenu beersu
Emenu beersu dinq yadergal Geta
Beredo aznbo t’elat eyemeta
Wiqyanos t’lqun fet’no eyatenene

VERSE 4
Emenu beersu yemaynega lelit
Emenu beersu yemayalf qen yelem
Emenu beersu hulu yichalewal
Emenu beersu Geta Medhanealem

CHORUS
Emenu beersu
Emenu beersu dinq yadergal Geta
Beredo aznbo t’elat eyemeta
Wiqyanos t’lqun fet’no eyatenene

VERSE 5
Emenu beersu fiqr new zelealem
Emenu beersu deg abat lelju
Emenu beersu hule tezergta
Emenu beersu tinoralech eju

CHORUS
Emenu beersu
Emenu beersu dinq yadergal Geta
Beredo aznbo t’elat eyemeta
Wiqyanos t’lqun fet’no eyatenene

VERSE 6
Emenu beersu moged yemaysebrew
Emenu beersu ts’nu merkb alen
Emenu beersu anferam ansegam
Emenu beersu kersu gar eyalen

CHORUS
Emenu beersu
Emenu beersu dinq yadergal Geta
Beredo aznbo t’elat eyemeta
Wiqyanos t’lqun fet’no eyatenene

VERSE 7
Emenu beersu t’elat teshenfwal
Emenu beersu seyt’an afrwal zare
Emenu beersu wehniw yinewawets’
Emenu beersu betalaq zimare

CHORUS
Emenu beersu
Emenu beersu dinq yadergal Geta
Beredo aznbo t’elat eyemeta
Wiqyanos t’lqun fet’no eyatenene

VERSE 8
Emenu beersu bado new ayseram
Emenu beersu yet’elat fukera
Emenu beersu yemaytewen Geta
Emenu beersu ale kegna gara

CHORUS
Emenu beersu
Emenu beersu dinq yadergal Geta
Beredo aznbo t’elat eyemeta
Wiqyanos t’lqun fet’no eyatenene

VERSE 9
Emenu beersu ejg atrefrfo
Emenu beersu ts’ega kebezaln
Emenu beersu bemot jerba qomen
Emenu beersu gena enzemralen

CHORUS
Emenu beersu
Emenu beersu dinq yadergal Geta
Beredo aznbo t’elat eyemeta
Wiqyanos t’lqun fet’no eyatenene'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 1
ነገር ለወጠ ሁሉ በርሱ ሆነ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 2
እመኑ በእርሱ ተራራው ተናደ
እመኑ በእርሱ ሸለቆው ታወከ
እመኑ በእርሱ ዝግባው ተሰባብሮ
እመኑ በእርሱ አለቱ ደቀቀ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 3
እመኑ በእርሱ የአሕዛብ ጣዖታት
እመኑ በእርሱ በፊቱ ረገፉ
እመኑ በእርሱ በስሙ የታመኑ
እመኑ በእርሱ ወጀቡን ቀዘፉ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 4
እመኑ በእርሱ የማይነጋ ሌሊት
እመኑ በእርሱ የማያልፍ ቀን የለም
እመኑ በእርሱ ሁሉ ይቻለዋል
እመኑ በእርሱ ጌታ መድኃኔዓለም

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 5
እመኑ በእርሱ ፍቅር ነው ዘለዓለም
እመኑ በእርሱ ደግ አባት ለልጁ
እመኑ በእርሱ ሁሌ ተዘርግታ
እመኑ በእርሱ ትኖራለች እጁ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 6
እመኑ በእርሱ ሞገድ የማይሰብረው
እመኑ በእርሱ ጽኑ መርክብ አለን
እመኑ በእርሱ አንፈራም አንሰጋም
እመኑ በእርሱ ከርሱ ጋር እያለን

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 7
እመኑ በእርሱ ጠላት ተሸንፏል
እመኑ በእርሱ ሰይጣን አፍሯል ዛሬ
እመኑ በእርሱ ወህኒው ይነዋወጽ
እመኑ በእርሱ በታላቅ ዝማሬ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 8
እመኑ በእርሱ ባዶ ነው አይሰራም
እመኑ በእርሱ የጠላት ፉከራ
እመኑ በእርሱ የማይተወን ጌታ
እመኑ በእርሱ አለ ከኛ ጋራ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 9
እመኑ በእርሱ እጅግ አትረፍርፎ
እመኑ በእርሱ ጸጋ ከበዛልን
እመኑ በእርሱ በሞት ጀርባ ቆመን
እመኑ በእርሱ ገና እንዘምራለን

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 1
ነገር ለወጠ ሁሉ በርሱ ሆነ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 2
እመኑ በእርሱ ተራራው ተናደ
እመኑ በእርሱ ሸለቆው ታወከ
እመኑ በእርሱ ዝግባው ተሰባብሮ
እመኑ በእርሱ አለቱ ደቀቀ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 3
እመኑ በእርሱ የአሕዛብ ጣዖታት
እመኑ በእርሱ በፊቱ ረገፉ
እመኑ በእርሱ በስሙ የታመኑ
እመኑ በእርሱ ወጀቡን ቀዘፉ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 4
እመኑ በእርሱ የማይነጋ ሌሊት
እመኑ በእርሱ የማያልፍ ቀን የለም
እመኑ በእርሱ ሁሉ ይቻለዋል
እመኑ በእርሱ ጌታ መድኃኔዓለም

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 5
እመኑ በእርሱ ፍቅር ነው ዘለዓለም
እመኑ በእርሱ ደግ አባት ለልጁ
እመኑ በእርሱ ሁሌ ተዘርግታ
እመኑ በእርሱ ትኖራለች እጁ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 6
እመኑ በእርሱ ሞገድ የማይሰብረው
እመኑ በእርሱ ጽኑ መርክብ አለን
እመኑ በእርሱ አንፈራም አንሰጋም
እመኑ በእርሱ ከርሱ ጋር እያለን

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 7
እመኑ በእርሱ ጠላት ተሸንፏል
እመኑ በእርሱ ሰይጣን አፍሯል ዛሬ
እመኑ በእርሱ ወህኒው ይነዋወጽ
እመኑ በእርሱ በታላቅ ዝማሬ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 8
እመኑ በእርሱ ባዶ ነው አይሰራም
እመኑ በእርሱ የጠላት ፉከራ
እመኑ በእርሱ የማይተወን ጌታ
እመኑ በእርሱ አለ ከኛ ጋራ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 9
እመኑ በእርሱ እጅግ አትረፍርፎ
እመኑ በእርሱ ጸጋ ከበዛልን
እመኑ በእርሱ በሞት ጀርባ ቆመን
እመኑ በእርሱ ገና እንዘምራለን

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ' THEN lyrics_amharic 
          ELSE 'CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 1
ነገር ለወጠ ሁሉ በርሱ ሆነ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 2
እመኑ በእርሱ ተራራው ተናደ
እመኑ በእርሱ ሸለቆው ታወከ
እመኑ በእርሱ ዝግባው ተሰባብሮ
እመኑ በእርሱ አለቱ ደቀቀ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 3
እመኑ በእርሱ የአሕዛብ ጣዖታት
እመኑ በእርሱ በፊቱ ረገፉ
እመኑ በእርሱ በስሙ የታመኑ
እመኑ በእርሱ ወጀቡን ቀዘፉ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 4
እመኑ በእርሱ የማይነጋ ሌሊት
እመኑ በእርሱ የማያልፍ ቀን የለም
እመኑ በእርሱ ሁሉ ይቻለዋል
እመኑ በእርሱ ጌታ መድኃኔዓለም

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 5
እመኑ በእርሱ ፍቅር ነው ዘለዓለም
እመኑ በእርሱ ደግ አባት ለልጁ
እመኑ በእርሱ ሁሌ ተዘርግታ
እመኑ በእርሱ ትኖራለች እጁ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 6
እመኑ በእርሱ ሞገድ የማይሰብረው
እመኑ በእርሱ ጽኑ መርክብ አለን
እመኑ በእርሱ አንፈራም አንሰጋም
እመኑ በእርሱ ከርሱ ጋር እያለን

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 7
እመኑ በእርሱ ጠላት ተሸንፏል
እመኑ በእርሱ ሰይጣን አፍሯል ዛሬ
እመኑ በእርሱ ወህኒው ይነዋወጽ
እመኑ በእርሱ በታላቅ ዝማሬ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 8
እመኑ በእርሱ ባዶ ነው አይሰራም
እመኑ በእርሱ የጠላት ፉከራ
እመኑ በእርሱ የማይተወን ጌታ
እመኑ በእርሱ አለ ከኛ ጋራ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 9
እመኑ በእርሱ እጅግ አትረፍርፎ
እመኑ በእርሱ ጸጋ ከበዛልን
እመኑ በእርሱ በሞት ጀርባ ቆመን
እመኑ በእርሱ ገና እንዘምራለን

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ' 
        END,
        lyrics_transliteration = 'CHORUS
Emenu beersu
Emenu beersu dinq yadergal Geta
Beredo aznbo t’elat eyemeta
Wiqyanos t’lqun fet’no eyatenene

VERSE 1
Neger lewet’e hulu bersu hone

CHORUS
Emenu beersu
Emenu beersu dinq yadergal Geta
Beredo aznbo t’elat eyemeta
Wiqyanos t’lqun fet’no eyatenene

VERSE 2
Emenu beersu teraraw tenade
Emenu beersu sheleqow taweke
Emenu beersu zigbaw tesebabro
Emenu beersu aletu deqeqe

CHORUS
Emenu beersu
Emenu beersu dinq yadergal Geta
Beredo aznbo t’elat eyemeta
Wiqyanos t’lqun fet’no eyatenene

VERSE 3
Emenu beersu yeahzab t’aotat
Emenu beersu befitu regefu
Emenu beersu besmu yetamenu
Emenu beersu wejebun qezefu

CHORUS
Emenu beersu
Emenu beersu dinq yadergal Geta
Beredo aznbo t’elat eyemeta
Wiqyanos t’lqun fet’no eyatenene

VERSE 4
Emenu beersu yemaynega lelit
Emenu beersu yemayalf qen yelem
Emenu beersu hulu yichalewal
Emenu beersu Geta Medhanealem

CHORUS
Emenu beersu
Emenu beersu dinq yadergal Geta
Beredo aznbo t’elat eyemeta
Wiqyanos t’lqun fet’no eyatenene

VERSE 5
Emenu beersu fiqr new zelealem
Emenu beersu deg abat lelju
Emenu beersu hule tezergta
Emenu beersu tinoralech eju

CHORUS
Emenu beersu
Emenu beersu dinq yadergal Geta
Beredo aznbo t’elat eyemeta
Wiqyanos t’lqun fet’no eyatenene

VERSE 6
Emenu beersu moged yemaysebrew
Emenu beersu ts’nu merkb alen
Emenu beersu anferam ansegam
Emenu beersu kersu gar eyalen

CHORUS
Emenu beersu
Emenu beersu dinq yadergal Geta
Beredo aznbo t’elat eyemeta
Wiqyanos t’lqun fet’no eyatenene

VERSE 7
Emenu beersu t’elat teshenfwal
Emenu beersu seyt’an afrwal zare
Emenu beersu wehniw yinewawets’
Emenu beersu betalaq zimare

CHORUS
Emenu beersu
Emenu beersu dinq yadergal Geta
Beredo aznbo t’elat eyemeta
Wiqyanos t’lqun fet’no eyatenene

VERSE 8
Emenu beersu bado new ayseram
Emenu beersu yet’elat fukera
Emenu beersu yemaytewen Geta
Emenu beersu ale kegna gara

CHORUS
Emenu beersu
Emenu beersu dinq yadergal Geta
Beredo aznbo t’elat eyemeta
Wiqyanos t’lqun fet’no eyatenene

VERSE 9
Emenu beersu ejg atrefrfo
Emenu beersu ts’ega kebezaln
Emenu beersu bemot jerba qomen
Emenu beersu gena enzemralen

CHORUS
Emenu beersu
Emenu beersu dinq yadergal Geta
Beredo aznbo t’elat eyemeta
Wiqyanos t’lqun fet’no eyatenene',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ab668ecf-bcdd-4cba-b421-e9377f0a4459'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 1
ነገር ለወጠ ሁሉ በርሱ ሆነ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 2
እመኑ በእርሱ ተራራው ተናደ
እመኑ በእርሱ ሸለቆው ታወከ
እመኑ በእርሱ ዝግባው ተሰባብሮ
እመኑ በእርሱ አለቱ ደቀቀ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 3
እመኑ በእርሱ የአሕዛብ ጣዖታት
እመኑ በእርሱ በፊቱ ረገፉ
እመኑ በእርሱ በስሙ የታመኑ
እመኑ በእርሱ ወጀቡን ቀዘፉ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 4
እመኑ በእርሱ የማይነጋ ሌሊት
እመኑ በእርሱ የማያልፍ ቀን የለም
እመኑ በእርሱ ሁሉ ይቻለዋል
እመኑ በእርሱ ጌታ መድኃኔዓለም

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 5
እመኑ በእርሱ ፍቅር ነው ዘለዓለም
እመኑ በእርሱ ደግ አባት ለልጁ
እመኑ በእርሱ ሁሌ ተዘርግታ
እመኑ በእርሱ ትኖራለች እጁ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 6
እመኑ በእርሱ ሞገድ የማይሰብረው
እመኑ በእርሱ ጽኑ መርክብ አለን
እመኑ በእርሱ አንፈራም አንሰጋም
እመኑ በእርሱ ከርሱ ጋር እያለን

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 7
እመኑ በእርሱ ጠላት ተሸንፏል
እመኑ በእርሱ ሰይጣን አፍሯል ዛሬ
እመኑ በእርሱ ወህኒው ይነዋወጽ
እመኑ በእርሱ በታላቅ ዝማሬ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 8
እመኑ በእርሱ ባዶ ነው አይሰራም
እመኑ በእርሱ የጠላት ፉከራ
እመኑ በእርሱ የማይተወን ጌታ
እመኑ በእርሱ አለ ከኛ ጋራ

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ

VERSE 9
እመኑ በእርሱ እጅግ አትረፍርፎ
እመኑ በእርሱ ጸጋ ከበዛልን
እመኑ በእርሱ በሞት ጀርባ ቆመን
እመኑ በእርሱ ገና እንዘምራለን

CHORUS
እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'እመኑ በእርሱ
እመኑ በእርሱ ድንቅ ያደርጋል ጌታ
በረዶ አዝንቦ ጠላት እየመታ
ውቅያኖስ ጥልቁን ፈጥኖ እያተነነ
ነገር ለወጠ ሁሉ በርሱ ሆነ
አዝ
እመኑ በእርሱ.......ተራራው ተናደ
እመኑ በእርሱ.............ሸለቆው ታወከ
እመኑ በእርሱ.............ዝግባው ተሰባብሮ
እመኑ በእርሱ..............አለቱ ደቀቀ
እመኑ በእርሱ..............የአሕዛብ ጣዖታት
እመኑ በእርሱ .............በፊቱ ረገፉ
እመኑ በእርሱ .............በስሙ የታመኑ
እመኑ በእርሱ .............ወጀቡን ቀዘፉ
አዝ
እመኑ በእርሱ............የማይነጋ ሌሊት
እመኑ በእርሱ...........የማያልፍ ቀን የለም
እመኑ በእርሱ ............. ሁሉ ይቻለዋል
እመኑ በእርሱ ............. ጌታ መድኃኔዓለም
እመኑ በእርሱ ............. ፍቅር ነው ዘለዓለም
እመኑ በእርሱ ............. ደግ አባት ለልጁ
እመኑ በእርሱ ............. ሁሌ ተዘርግታ
እመኑ በእርሱ ............. ትኖራለች እጁ
አዝ
እመኑ በእርሱ ............. ሞገድ የማይሰብረው
እመኑ በእርሱ ............. ጽኑ መርክብ አለን
እመኑ በእርሱ ............. አንፈራም አንሰጋም
እመኑ በእርሱ ............. ከርሱ ጋር እያለን
እመኑ በእርሱ ............. ጠላት ተሸንፏል
እመኑ በእርሱ ............. ሰይጣን አፍሯል ዛሬ
እመኑ በእርሱ ............. ወህኒው ይነዋወጽ
እመኑ በእርሱ ............. በታላቅ ዝማሬ
አዝ
እመኑ በእርሱ ............. ባዶ ነው አይሰራም
እመኑ በእርሱ ............. የጠላት ፉከራ
እመኑ በእርሱ ............. የማይተወን ጌታ
እመኑ በእርሱ ............. አለ ከኛ ጋራ
እመኑ በእርሱ ............. እጅግ አትረፍርፎ
እመኑ በእርሱ ............. ጸጋ ከበዛልን
እመኑ በእርሱ ............. በሞት ጀርባ ቆመን
እመኑ በእርሱ ............. ገና እንዘምራለን'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ab668ecf-bcdd-4cba-b421-e9377f0a4459'::uuid, 'emenu-beerisu-dinik-yaderigal-geta', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tehetenashe-girum ("ትህትናሽ ግሩም ነው")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '374103cf-567e-45ed-a6d8-ead8cc15beaa'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tihtnash girum new
Tihtnash girum new degnetshm (2)
Enatu honeshal lemedhanialem (2)
Nits’ht silehonsh Emebete Emebete

VERSE 1
Enken yelelebsh Emebete Emebete
Yeft’retat Geta Emebete Emebete
Beanchi yaderebsh Emebete Emebete
Yedngl memeret’ Emebete Emebete

CHORUS
Tihtnash girum new
Tihtnash girum new degnetshm (2)
Enatu honeshal lemedhanialem (2)
Nits’ht silehonsh Emebete Emebete

VERSE 2
Zenaw asgeremegn Emebete Emebete
Esatun taqefech Emebete Emebete
Yemaychalewn Emebete Emebete
Mirkuze libelsh Emebete Emebete

CHORUS
Tihtnash girum new
Tihtnash girum new degnetshm (2)
Enatu honeshal lemedhanialem (2)
Nits’ht silehonsh Emebete Emebete

VERSE 3
T’la kelelaye Emebete Emebete
Gashaye nesh anchi Emebete Emebete
Yeene memekiyaye Emebete Emebete
Bealem endalt’efa Emebete Emebete

CHORUS
Tihtnash girum new
Tihtnash girum new degnetshm (2)
Enatu honeshal lemedhanialem (2)
Nits’ht silehonsh Emebete Emebete

VERSE 4
Nuroye merobgn Emebete Emebete
Ende weyn at’afch’w Emebete Emebete
Maryam direshilgn Emebete Emebete
Yemsraq dejaf nesh Emebete Emebete

CHORUS
Tihtnash girum new
Tihtnash girum new degnetshm (2)
Enatu honeshal lemedhanialem (2)
Nits’ht silehonsh Emebete Emebete

VERSE 5
Yehulachn tesfa Emebete Emebete
Emu lets’ehey ts’dq Emebete Emebete
Yehulu alegnta Emebete Emebete
Dingil yedl aklil Emebete Emebete

CHORUS
Tihtnash girum new
Tihtnash girum new degnetshm (2)
Enatu honeshal lemedhanialem (2)
Nits’ht silehonsh Emebete Emebete

VERSE 6
Dingil yets’dq sira Emebete Emebete
Dingil meselal nesh Emebete Emebete
Yetewahdo tesfa Emebete Emebete

CHORUS
Tihtnash girum new
Tihtnash girum new degnetshm (2)
Enatu honeshal lemedhanialem (2)
Nits’ht silehonsh Emebete Emebete'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 1
እንከን የሌለብሽ እመቤቴ እመቤቴ
የፍጥረታት ጌታ እመቤቴ እመቤቴ
በአንቺ ያደረብሽ እመቤቴ እመቤቴ
የድንግል መመረጥ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 2
ዜናው አስገረመኝ እመቤቴ እመቤቴ
እሳቱን ታቀፈች እመቤቴ እመቤቴ
የማይቻለውን እመቤቴ እመቤቴ
ምርኩዜ ልበልሽ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 3
ጥላ ከለላዬ እመቤቴ እመቤቴ
ጋሻዬ ነሽ አንቺ እመቤቴ እመቤቴ
የእኔ መመኪያዬ እመቤቴ እመቤቴ
በአለም እንዳልጠፋ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 4
ኑሮዬ መሮብኝ እመቤቴ እመቤቴ
እንደ ወይን አጣፍጭው እመቤቴ እመቤቴ
ማርያም ድረሺልኝ እመቤቴ እመቤቴ
የምሥራቅ ደጃፍ ነሽ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 5
የሁላችን ተስፋ እመቤቴ እመቤቴ
እሙ ለፀሐይ ጽድቅ እመቤቴ እመቤቴ
የሁሉ አለኝታ እመቤቴ እመቤቴ
ድንግል የድል አክሊል እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 6
ድንግል የጽድቅ ሥራ እመቤቴ እመቤቴ
ድንግል መሰላል ነሽ እመቤቴ እመቤቴ
የተዋሕዶ ተስፋ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 1
እንከን የሌለብሽ እመቤቴ እመቤቴ
የፍጥረታት ጌታ እመቤቴ እመቤቴ
በአንቺ ያደረብሽ እመቤቴ እመቤቴ
የድንግል መመረጥ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 2
ዜናው አስገረመኝ እመቤቴ እመቤቴ
እሳቱን ታቀፈች እመቤቴ እመቤቴ
የማይቻለውን እመቤቴ እመቤቴ
ምርኩዜ ልበልሽ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 3
ጥላ ከለላዬ እመቤቴ እመቤቴ
ጋሻዬ ነሽ አንቺ እመቤቴ እመቤቴ
የእኔ መመኪያዬ እመቤቴ እመቤቴ
በአለም እንዳልጠፋ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 4
ኑሮዬ መሮብኝ እመቤቴ እመቤቴ
እንደ ወይን አጣፍጭው እመቤቴ እመቤቴ
ማርያም ድረሺልኝ እመቤቴ እመቤቴ
የምሥራቅ ደጃፍ ነሽ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 5
የሁላችን ተስፋ እመቤቴ እመቤቴ
እሙ ለፀሐይ ጽድቅ እመቤቴ እመቤቴ
የሁሉ አለኝታ እመቤቴ እመቤቴ
ድንግል የድል አክሊል እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 6
ድንግል የጽድቅ ሥራ እመቤቴ እመቤቴ
ድንግል መሰላል ነሽ እመቤቴ እመቤቴ
የተዋሕዶ ተስፋ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ' THEN lyrics_amharic 
          ELSE 'CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 1
እንከን የሌለብሽ እመቤቴ እመቤቴ
የፍጥረታት ጌታ እመቤቴ እመቤቴ
በአንቺ ያደረብሽ እመቤቴ እመቤቴ
የድንግል መመረጥ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 2
ዜናው አስገረመኝ እመቤቴ እመቤቴ
እሳቱን ታቀፈች እመቤቴ እመቤቴ
የማይቻለውን እመቤቴ እመቤቴ
ምርኩዜ ልበልሽ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 3
ጥላ ከለላዬ እመቤቴ እመቤቴ
ጋሻዬ ነሽ አንቺ እመቤቴ እመቤቴ
የእኔ መመኪያዬ እመቤቴ እመቤቴ
በአለም እንዳልጠፋ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 4
ኑሮዬ መሮብኝ እመቤቴ እመቤቴ
እንደ ወይን አጣፍጭው እመቤቴ እመቤቴ
ማርያም ድረሺልኝ እመቤቴ እመቤቴ
የምሥራቅ ደጃፍ ነሽ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 5
የሁላችን ተስፋ እመቤቴ እመቤቴ
እሙ ለፀሐይ ጽድቅ እመቤቴ እመቤቴ
የሁሉ አለኝታ እመቤቴ እመቤቴ
ድንግል የድል አክሊል እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 6
ድንግል የጽድቅ ሥራ እመቤቴ እመቤቴ
ድንግል መሰላል ነሽ እመቤቴ እመቤቴ
የተዋሕዶ ተስፋ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ' 
        END,
        lyrics_transliteration = 'CHORUS
Tihtnash girum new
Tihtnash girum new degnetshm (2)
Enatu honeshal lemedhanialem (2)
Nits’ht silehonsh Emebete Emebete

VERSE 1
Enken yelelebsh Emebete Emebete
Yeft’retat Geta Emebete Emebete
Beanchi yaderebsh Emebete Emebete
Yedngl memeret’ Emebete Emebete

CHORUS
Tihtnash girum new
Tihtnash girum new degnetshm (2)
Enatu honeshal lemedhanialem (2)
Nits’ht silehonsh Emebete Emebete

VERSE 2
Zenaw asgeremegn Emebete Emebete
Esatun taqefech Emebete Emebete
Yemaychalewn Emebete Emebete
Mirkuze libelsh Emebete Emebete

CHORUS
Tihtnash girum new
Tihtnash girum new degnetshm (2)
Enatu honeshal lemedhanialem (2)
Nits’ht silehonsh Emebete Emebete

VERSE 3
T’la kelelaye Emebete Emebete
Gashaye nesh anchi Emebete Emebete
Yeene memekiyaye Emebete Emebete
Bealem endalt’efa Emebete Emebete

CHORUS
Tihtnash girum new
Tihtnash girum new degnetshm (2)
Enatu honeshal lemedhanialem (2)
Nits’ht silehonsh Emebete Emebete

VERSE 4
Nuroye merobgn Emebete Emebete
Ende weyn at’afch’w Emebete Emebete
Maryam direshilgn Emebete Emebete
Yemsraq dejaf nesh Emebete Emebete

CHORUS
Tihtnash girum new
Tihtnash girum new degnetshm (2)
Enatu honeshal lemedhanialem (2)
Nits’ht silehonsh Emebete Emebete

VERSE 5
Yehulachn tesfa Emebete Emebete
Emu lets’ehey ts’dq Emebete Emebete
Yehulu alegnta Emebete Emebete
Dingil yedl aklil Emebete Emebete

CHORUS
Tihtnash girum new
Tihtnash girum new degnetshm (2)
Enatu honeshal lemedhanialem (2)
Nits’ht silehonsh Emebete Emebete

VERSE 6
Dingil yets’dq sira Emebete Emebete
Dingil meselal nesh Emebete Emebete
Yetewahdo tesfa Emebete Emebete

CHORUS
Tihtnash girum new
Tihtnash girum new degnetshm (2)
Enatu honeshal lemedhanialem (2)
Nits’ht silehonsh Emebete Emebete',
        updated_at = clock_timestamp()::text
    WHERE import_id = '374103cf-567e-45ed-a6d8-ead8cc15beaa'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 1
እንከን የሌለብሽ እመቤቴ እመቤቴ
የፍጥረታት ጌታ እመቤቴ እመቤቴ
በአንቺ ያደረብሽ እመቤቴ እመቤቴ
የድንግል መመረጥ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 2
ዜናው አስገረመኝ እመቤቴ እመቤቴ
እሳቱን ታቀፈች እመቤቴ እመቤቴ
የማይቻለውን እመቤቴ እመቤቴ
ምርኩዜ ልበልሽ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 3
ጥላ ከለላዬ እመቤቴ እመቤቴ
ጋሻዬ ነሽ አንቺ እመቤቴ እመቤቴ
የእኔ መመኪያዬ እመቤቴ እመቤቴ
በአለም እንዳልጠፋ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 4
ኑሮዬ መሮብኝ እመቤቴ እመቤቴ
እንደ ወይን አጣፍጭው እመቤቴ እመቤቴ
ማርያም ድረሺልኝ እመቤቴ እመቤቴ
የምሥራቅ ደጃፍ ነሽ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 5
የሁላችን ተስፋ እመቤቴ እመቤቴ
እሙ ለፀሐይ ጽድቅ እመቤቴ እመቤቴ
የሁሉ አለኝታ እመቤቴ እመቤቴ
ድንግል የድል አክሊል እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ

VERSE 6
ድንግል የጽድቅ ሥራ እመቤቴ እመቤቴ
ድንግል መሰላል ነሽ እመቤቴ እመቤቴ
የተዋሕዶ ተስፋ እመቤቴ እመቤቴ

CHORUS
ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ እመቤቴ እመቤቴ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ትህትናሽ ግሩም ነው
ትህትናሽ ግሩም ነው ደግነትሽም /2/
እናቱ ሆነሻል ለመድኃኒዓለም /2/
ንጽሕት ስለሆንሽ ------- እመቤቴ እመቤቴ
እንከን የሌለብሽ ------- እመቤቴ እመቤቴ
የፍጥረታት ጌታ------- እመቤቴ እመቤቴ
በአንቺ ያደረብሽ ------- እመቤቴ እመቤቴ
የድንግል መመረጥ------- እመቤቴ እመቤቴ
ዜናው አስገረመኝ ------- እመቤቴ እመቤቴ
እሳቱን ታቀፈች ------- እመቤቴ እመቤቴ
የማይቻለውን ------- እመቤቴ እመቤቴ
ምርኩዜ ልበልሽ ------- እመቤቴ እመቤቴ
ጥላ ከለላዬ ------- እመቤቴ እመቤቴ
ጋሻዬ ነሽ አንቺ ------- እመቤቴ እመቤቴ
የእኔ መመኪያዬ ------- እመቤቴ እመቤቴ
በአለም እንዳልጠፋ ------- እመቤቴ እመቤቴ
ኑሮዬ መሮብኝ ------- እመቤቴ እመቤቴ
እንደ ወይን አጣፍጭው ------- እመቤቴ እመቤቴ
ማርያም ድረሺልኝ ------- እመቤቴ እመቤቴ
የምሥራቅ ደጃፍ ነሽ ------- እመቤቴ እመቤቴ
የሁላችን ተስፋ ------- እመቤቴ እመቤቴ
እሙ ለፀሐይ ጽድቅ ------- እመቤቴ እመቤቴ
የሁሉ አለኝታ ------- እመቤቴ እመቤቴ
ድንግል የድል አክሊል ------- እመቤቴ እመቤቴ
ድንግል የጽድቅ ሥራ ------- እመቤቴ እመቤቴ
ድንግል መሰላል ነሽ ------- እመቤቴ እመቤቴ
የተዋሕዶ ተስፋ------- እመቤቴ እመቤቴ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '374103cf-567e-45ed-a6d8-ead8cc15beaa'::uuid, 'tehetenashe-girum', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- neamn-beslasie-eyom ("ነኣምን በስላሴ # ናይሕብረት መዝሙር: ዲ.የዉሓንስ:ኣቤል:ሳንድሮ:ዪኤል:ሳይሞን:ራህዋ: ሄርሜላ: ቅሳነት")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '33067532-4b80-405a-aea3-4567e2d345bd'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Niamn beslase
Wenamn beslase
Selase''yom alem zifet’eru
Selase''yom kebirom zinebru

VERSE 1
Silassie''yom mist’ir nay emnetna
Silassie''yom tirgum hilawena (2)
Silassie ab dewatat memre enkelo abrham
Silassie misli nay goytau rieyu bimgram

CHORUS
Niamn beslase
Wenamn beslase
Selase''yom alem zifet’eru
Selase''yom kebirom zinebru

VERSE 2
Silassie keglglom ilu nabom mis qerebe
Silese mist’ir selestnet ab betu reኸbe
Az""""
Silassie mist’ir niኽezeb t’emetku nab semay

CHORUS
Niamn beslase
Wenamn beslase
Selase''yom alem zifet’eru
Selase''yom kebirom zinebru

VERSE 3
Silasenkulu kitmgb riaኽwa ts’hay
Silassie mulue akal birhan muቐt win alewa
Silassie ts’hay ember maas ts’hayat yiblwa
Az''''''''

CHORUS
Niamn beslase
Wenamn beslase
Selase''yom alem zifet’eru
Selase''yom kebirom zinebru

VERSE 4
Silassie ab demena semay dimts’i angodgode
Silassie biamsale rigbi menfes Kidus werede
Silassie tizfetwo wedey iluwn ameskere
Silassie ab riba yordanos Kristos kebere

CHORUS
Niamn beslase
Wenamn beslase
Selase''yom alem zifet’eru
Selase''yom kebirom zinebru

VERSE 5
Az''''''
Silassie mist’ir nay Silassie kemey''yu zeytblu
Silassie kemey gerkum iኹm akalom tegudlu
Silassie melekotom hade akalom seleste

CHORUS
Niamn beslase
Wenamn beslase
Selase''yom alem zifet’eru
Selase''yom kebirom zinebru

VERSE 6
Silassie aynbln ina kilte wey arbaete
Zimere melaeኽti yesmalna ehwatna
Wesbhat leEgziabher luul

CHORUS
Niamn beslase
Wenamn beslase
Selase''yom alem zifet’eru
Selase''yom kebirom zinebru'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 1
ስላሴ''ዮም ምስጢር ናይ እምነትና
ስላሴ''ዮም ትርጉም ህላዌና(2)
ስላሴ ኣብ ደዋታት መምሬ እንከሎ ኣብርሃም
ስላሴ ምስሊ ናይ ጎይታኡ ርእዩ ብምግራም

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 2
ስላሴ ከግልግሎም ኢሉ ናብኦም ምስ ቀረበ
ስለሴ ምስጢር ሰለስትነት ኣብ ቤቱ ረኸበ
ኣዝ""""
ስላሴ ምስጢር ንኽዕዘብ ጠመትኩ ናብ ሰማይ

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 3
ስላሴንኩሉ ክትምግብ ርኣኽዋ ጽሓይ
ስላሴ ሙሉእ ኣካል ብርሃን ሙቐት ውን ኣለዋ
ስላሴ ጽሓይ እምበር ማዓስ ጽሓያት ይብልዋ
ኣዝ''''''''

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 4
ስላሴ ኣብ ደመና ሰማይ ድምጺ ኣንጎድጎደ
ስላሴ ብኣምሳለ ርግቢ መንፈስ ቅዱስ ወረደ
ስላሴ ትዝፈትዎ ወደይ ኢሉውን ኣመስከረ
ስላሴ ኣብ ርባ ዮርዳኖስ ክርስቶስ ከበረ

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 5
ኣዝ''''''
ስላሴ ምስጢር ናይ ስላሴ ከመይ''ዩ ዘይትብሉ
ስላሴ ከመይ ጌርኩም ኢኹም ኣካሎም ተጉድሉ
ስላሴ መለኮቶም ሓደ ኣካሎም ሰለስተ

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 6
ስላሴ ኣይንብልን ኢና ክልተ ወይ ኣርባዕተ
ዝመሬ መላእኽቲ የስምዓልና እሕዋትና
ወስብሃት ለእግዚአብሔር ሉኡል

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 1
ስላሴ''ዮም ምስጢር ናይ እምነትና
ስላሴ''ዮም ትርጉም ህላዌና(2)
ስላሴ ኣብ ደዋታት መምሬ እንከሎ ኣብርሃም
ስላሴ ምስሊ ናይ ጎይታኡ ርእዩ ብምግራም

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 2
ስላሴ ከግልግሎም ኢሉ ናብኦም ምስ ቀረበ
ስለሴ ምስጢር ሰለስትነት ኣብ ቤቱ ረኸበ
ኣዝ""""
ስላሴ ምስጢር ንኽዕዘብ ጠመትኩ ናብ ሰማይ

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 3
ስላሴንኩሉ ክትምግብ ርኣኽዋ ጽሓይ
ስላሴ ሙሉእ ኣካል ብርሃን ሙቐት ውን ኣለዋ
ስላሴ ጽሓይ እምበር ማዓስ ጽሓያት ይብልዋ
ኣዝ''''''''

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 4
ስላሴ ኣብ ደመና ሰማይ ድምጺ ኣንጎድጎደ
ስላሴ ብኣምሳለ ርግቢ መንፈስ ቅዱስ ወረደ
ስላሴ ትዝፈትዎ ወደይ ኢሉውን ኣመስከረ
ስላሴ ኣብ ርባ ዮርዳኖስ ክርስቶስ ከበረ

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 5
ኣዝ''''''
ስላሴ ምስጢር ናይ ስላሴ ከመይ''ዩ ዘይትብሉ
ስላሴ ከመይ ጌርኩም ኢኹም ኣካሎም ተጉድሉ
ስላሴ መለኮቶም ሓደ ኣካሎም ሰለስተ

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 6
ስላሴ ኣይንብልን ኢና ክልተ ወይ ኣርባዕተ
ዝመሬ መላእኽቲ የስምዓልና እሕዋትና
ወስብሃት ለእግዚአብሔር ሉኡል

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ' THEN lyrics_amharic 
          ELSE 'CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 1
ስላሴ''ዮም ምስጢር ናይ እምነትና
ስላሴ''ዮም ትርጉም ህላዌና(2)
ስላሴ ኣብ ደዋታት መምሬ እንከሎ ኣብርሃም
ስላሴ ምስሊ ናይ ጎይታኡ ርእዩ ብምግራም

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 2
ስላሴ ከግልግሎም ኢሉ ናብኦም ምስ ቀረበ
ስለሴ ምስጢር ሰለስትነት ኣብ ቤቱ ረኸበ
ኣዝ""""
ስላሴ ምስጢር ንኽዕዘብ ጠመትኩ ናብ ሰማይ

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 3
ስላሴንኩሉ ክትምግብ ርኣኽዋ ጽሓይ
ስላሴ ሙሉእ ኣካል ብርሃን ሙቐት ውን ኣለዋ
ስላሴ ጽሓይ እምበር ማዓስ ጽሓያት ይብልዋ
ኣዝ''''''''

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 4
ስላሴ ኣብ ደመና ሰማይ ድምጺ ኣንጎድጎደ
ስላሴ ብኣምሳለ ርግቢ መንፈስ ቅዱስ ወረደ
ስላሴ ትዝፈትዎ ወደይ ኢሉውን ኣመስከረ
ስላሴ ኣብ ርባ ዮርዳኖስ ክርስቶስ ከበረ

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 5
ኣዝ''''''
ስላሴ ምስጢር ናይ ስላሴ ከመይ''ዩ ዘይትብሉ
ስላሴ ከመይ ጌርኩም ኢኹም ኣካሎም ተጉድሉ
ስላሴ መለኮቶም ሓደ ኣካሎም ሰለስተ

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 6
ስላሴ ኣይንብልን ኢና ክልተ ወይ ኣርባዕተ
ዝመሬ መላእኽቲ የስምዓልና እሕዋትና
ወስብሃት ለእግዚአብሔር ሉኡል

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ' 
        END,
        lyrics_transliteration = 'CHORUS
Niamn beslase
Wenamn beslase
Selase''yom alem zifet’eru
Selase''yom kebirom zinebru

VERSE 1
Silassie''yom mist’ir nay emnetna
Silassie''yom tirgum hilawena (2)
Silassie ab dewatat memre enkelo abrham
Silassie misli nay goytau rieyu bimgram

CHORUS
Niamn beslase
Wenamn beslase
Selase''yom alem zifet’eru
Selase''yom kebirom zinebru

VERSE 2
Silassie keglglom ilu nabom mis qerebe
Silese mist’ir selestnet ab betu reኸbe
Az""""
Silassie mist’ir niኽezeb t’emetku nab semay

CHORUS
Niamn beslase
Wenamn beslase
Selase''yom alem zifet’eru
Selase''yom kebirom zinebru

VERSE 3
Silasenkulu kitmgb riaኽwa ts’hay
Silassie mulue akal birhan muቐt win alewa
Silassie ts’hay ember maas ts’hayat yiblwa
Az''''''''

CHORUS
Niamn beslase
Wenamn beslase
Selase''yom alem zifet’eru
Selase''yom kebirom zinebru

VERSE 4
Silassie ab demena semay dimts’i angodgode
Silassie biamsale rigbi menfes Kidus werede
Silassie tizfetwo wedey iluwn ameskere
Silassie ab riba yordanos Kristos kebere

CHORUS
Niamn beslase
Wenamn beslase
Selase''yom alem zifet’eru
Selase''yom kebirom zinebru

VERSE 5
Az''''''
Silassie mist’ir nay Silassie kemey''yu zeytblu
Silassie kemey gerkum iኹm akalom tegudlu
Silassie melekotom hade akalom seleste

CHORUS
Niamn beslase
Wenamn beslase
Selase''yom alem zifet’eru
Selase''yom kebirom zinebru

VERSE 6
Silassie aynbln ina kilte wey arbaete
Zimere melaeኽti yesmalna ehwatna
Wesbhat leEgziabher luul

CHORUS
Niamn beslase
Wenamn beslase
Selase''yom alem zifet’eru
Selase''yom kebirom zinebru',
        updated_at = clock_timestamp()::text
    WHERE import_id = '33067532-4b80-405a-aea3-4567e2d345bd'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 1
ስላሴ''ዮም ምስጢር ናይ እምነትና
ስላሴ''ዮም ትርጉም ህላዌና(2)
ስላሴ ኣብ ደዋታት መምሬ እንከሎ ኣብርሃም
ስላሴ ምስሊ ናይ ጎይታኡ ርእዩ ብምግራም

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 2
ስላሴ ከግልግሎም ኢሉ ናብኦም ምስ ቀረበ
ስለሴ ምስጢር ሰለስትነት ኣብ ቤቱ ረኸበ
ኣዝ""""
ስላሴ ምስጢር ንኽዕዘብ ጠመትኩ ናብ ሰማይ

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 3
ስላሴንኩሉ ክትምግብ ርኣኽዋ ጽሓይ
ስላሴ ሙሉእ ኣካል ብርሃን ሙቐት ውን ኣለዋ
ስላሴ ጽሓይ እምበር ማዓስ ጽሓያት ይብልዋ
ኣዝ''''''''

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 4
ስላሴ ኣብ ደመና ሰማይ ድምጺ ኣንጎድጎደ
ስላሴ ብኣምሳለ ርግቢ መንፈስ ቅዱስ ወረደ
ስላሴ ትዝፈትዎ ወደይ ኢሉውን ኣመስከረ
ስላሴ ኣብ ርባ ዮርዳኖስ ክርስቶስ ከበረ

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 5
ኣዝ''''''
ስላሴ ምስጢር ናይ ስላሴ ከመይ''ዩ ዘይትብሉ
ስላሴ ከመይ ጌርኩም ኢኹም ኣካሎም ተጉድሉ
ስላሴ መለኮቶም ሓደ ኣካሎም ሰለስተ

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ

VERSE 6
ስላሴ ኣይንብልን ኢና ክልተ ወይ ኣርባዕተ
ዝመሬ መላእኽቲ የስምዓልና እሕዋትና
ወስብሃት ለእግዚአብሔር ሉኡል

CHORUS
ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ንኣምን በስላሴ
ወንኣምን በስላሴ
ሰላሴ''ዮም ዓለም ዝፈጠሩ
ሰላሴ''ዮም ከቢሮም ዝነብሩ
ስላሴ''ዮም ምስጢር ናይ እምነትና
ስላሴ''ዮም ትርጉም ህላዌና(2)
ስላሴ ኣብ ደዋታት መምሬ እንከሎ ኣብርሃም
ስላሴ ምስሊ ናይ ጎይታኡ ርእዩ ብምግራም
ስላሴ ከግልግሎም ኢሉ ናብኦም ምስ ቀረበ
ስለሴ ምስጢር ሰለስትነት ኣብ ቤቱ ረኸበ
ኣዝ""""
ስላሴ ምስጢር ንኽዕዘብ ጠመትኩ ናብ ሰማይ
ስላሴንኩሉ ክትምግብ ርኣኽዋ ጽሓይ
ስላሴ ሙሉእ ኣካል ብርሃን ሙቐት ውን ኣለዋ
ስላሴ ጽሓይ እምበር ማዓስ ጽሓያት ይብልዋ
ኣዝ''''''''
ስላሴ ኣብ ደመና ሰማይ ድምጺ ኣንጎድጎደ
ስላሴ ብኣምሳለ ርግቢ መንፈስ ቅዱስ ወረደ
ስላሴ ትዝፈትዎ ወደይ ኢሉውን ኣመስከረ
ስላሴ ኣብ ርባ ዮርዳኖስ ክርስቶስ ከበረ
ኣዝ''''''❤
ስላሴ ምስጢር ናይ ስላሴ ከመይ''ዩ ዘይትብሉ
ስላሴ ከመይ ጌርኩም ኢኹም ኣካሎም ተጉድሉ
ስላሴ መለኮቶም ሓደ ኣካሎም ሰለስተ
ስላሴ ኣይንብልን ኢና ክልተ ወይ ኣርባዕተ
ዝመሬ መላእኽቲ የስምዓልና እሕዋትና
ወስብሃት ለእግዚአብሔር ሉኡል'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '33067532-4b80-405a-aea3-4567e2d345bd'::uuid, 'neamn-beslasie-eyom', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- come-forth-emmanuel ("ናና አማኑኤል")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '5133362a-f25c-450b-99d2-80dc24797c59'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 1
Na na Amanuel
Na medhenite
Fiqrhn albsegn
Yiqr meraqwte

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 2
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 3
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 4
The father of mercy
Lord of benevolence
The light of forgiveness
Shines from Your countenance

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 5
More than the love of one
Father has for his son
Our Lord loves his own
He will not forsake us

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 6
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 7
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 8
O Lord my remedy
You saved me by Your death
My many wounds were healed
Through Your wounds and Your death

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 9
I betrayed You forgave
I pierced You and beheld
How Your Love guards and saves
And all sorrow it quells

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 10
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 11
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 12
I know You are with me
Yes, truly You are here
Your presence conquered the
Mountain of my worries

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 13
Amidst all your people
My mouth declares You Lord
Because Your precious Blood
Liberated my soul

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 14
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 15
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 16
The seed of the Virgin
Of the blessed Woman
The pillar of my home
The ransom of my soul

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 17
You are my foundation
And the hand that raised me
You won''t leave me behind
Since I''m your child truly

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 18
Na na Amanuel
Na medhenite
Fiqrhn albsegn
Yiqr meraqwte

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 19
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 1
ና ና አማኑኤል
ና መድሐኒቴ
ፍቅርህን አልብሰኝ
ይቅር መራቍቴ

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 2
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 3
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 4
The father of mercy
Lord of benevolence
The light of forgiveness
Shines from Your countenance

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 5
More than the love of one
Father has for his son
Our Lord loves his own
He will not forsake us

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 6
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 7
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 8
O Lord my remedy
You saved me by Your death
My many wounds were healed
Through Your wounds and Your death

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 9
I betrayed You forgave
I pierced You and beheld
How Your Love guards and saves
And all sorrow it quells

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 10
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 11
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 12
I know You are with me
Yes, truly You are here
Your presence conquered the
mountain of my worries

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 13
Amidst all your people
My mouth declares You Lord
Because Your precious Blood
Liberated my soul

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 14
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 15
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 16
The seed of the Virgin
Of the blessed Woman
The pillar of my home
The ransom of my soul

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 17
You are my foundation
And the hand that raised me
You won''t leave me behind
Since I''m your child truly

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 18
ና ና አማኑኤል
ና መድሐኒቴ
ፍቅርህን አልብሰኝ
ይቅር መራቍቴ

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 19
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 1
ና ና አማኑኤል
ና መድሐኒቴ
ፍቅርህን አልብሰኝ
ይቅር መራቍቴ

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 2
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 3
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 4
The father of mercy
Lord of benevolence
The light of forgiveness
Shines from Your countenance

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 5
More than the love of one
Father has for his son
Our Lord loves his own
He will not forsake us

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 6
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 7
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 8
O Lord my remedy
You saved me by Your death
My many wounds were healed
Through Your wounds and Your death

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 9
I betrayed You forgave
I pierced You and beheld
How Your Love guards and saves
And all sorrow it quells

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 10
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 11
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 12
I know You are with me
Yes, truly You are here
Your presence conquered the
mountain of my worries

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 13
Amidst all your people
My mouth declares You Lord
Because Your precious Blood
Liberated my soul

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 14
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 15
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 16
The seed of the Virgin
Of the blessed Woman
The pillar of my home
The ransom of my soul

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 17
You are my foundation
And the hand that raised me
You won''t leave me behind
Since I''m your child truly

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 18
ና ና አማኑኤል
ና መድሐኒቴ
ፍቅርህን አልብሰኝ
ይቅር መራቍቴ

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 19
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ' THEN lyrics_amharic 
          ELSE 'CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 1
ና ና አማኑኤል
ና መድሐኒቴ
ፍቅርህን አልብሰኝ
ይቅር መራቍቴ

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 2
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 3
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 4
The father of mercy
Lord of benevolence
The light of forgiveness
Shines from Your countenance

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 5
More than the love of one
Father has for his son
Our Lord loves his own
He will not forsake us

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 6
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 7
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 8
O Lord my remedy
You saved me by Your death
My many wounds were healed
Through Your wounds and Your death

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 9
I betrayed You forgave
I pierced You and beheld
How Your Love guards and saves
And all sorrow it quells

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 10
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 11
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 12
I know You are with me
Yes, truly You are here
Your presence conquered the
mountain of my worries

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 13
Amidst all your people
My mouth declares You Lord
Because Your precious Blood
Liberated my soul

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 14
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 15
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 16
The seed of the Virgin
Of the blessed Woman
The pillar of my home
The ransom of my soul

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 17
You are my foundation
And the hand that raised me
You won''t leave me behind
Since I''m your child truly

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 18
ና ና አማኑኤል
ና መድሐኒቴ
ፍቅርህን አልብሰኝ
ይቅር መራቍቴ

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 19
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ' 
        END,
        lyrics_transliteration = 'CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 1
Na na Amanuel
Na medhenite
Fiqrhn albsegn
Yiqr meraqwte

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 2
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 3
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 4
The father of mercy
Lord of benevolence
The light of forgiveness
Shines from Your countenance

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 5
More than the love of one
Father has for his son
Our Lord loves his own
He will not forsake us

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 6
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 7
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 8
O Lord my remedy
You saved me by Your death
My many wounds were healed
Through Your wounds and Your death

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 9
I betrayed You forgave
I pierced You and beheld
How Your Love guards and saves
And all sorrow it quells

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 10
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 11
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 12
I know You are with me
Yes, truly You are here
Your presence conquered the
Mountain of my worries

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 13
Amidst all your people
My mouth declares You Lord
Because Your precious Blood
Liberated my soul

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 14
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 15
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 16
The seed of the Virgin
Of the blessed Woman
The pillar of my home
The ransom of my soul

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 17
You are my foundation
And the hand that raised me
You won''t leave me behind
Since I''m your child truly

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 18
Na na Amanuel
Na medhenite
Fiqrhn albsegn
Yiqr meraqwte

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte

VERSE 19
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
Na na Amanuel
Na medhenite
Ts’dqhn albsegn
Yiqr meraqwte',
        updated_at = clock_timestamp()::text
    WHERE import_id = '5133362a-f25c-450b-99d2-80dc24797c59'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 1
ና ና አማኑኤል
ና መድሐኒቴ
ፍቅርህን አልብሰኝ
ይቅር መራቍቴ

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 2
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 3
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 4
The father of mercy
Lord of benevolence
The light of forgiveness
Shines from Your countenance

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 5
More than the love of one
Father has for his son
Our Lord loves his own
He will not forsake us

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 6
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 7
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 8
O Lord my remedy
You saved me by Your death
My many wounds were healed
Through Your wounds and Your death

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 9
I betrayed You forgave
I pierced You and beheld
How Your Love guards and saves
And all sorrow it quells

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 10
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 11
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 12
I know You are with me
Yes, truly You are here
Your presence conquered the
mountain of my worries

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 13
Amidst all your people
My mouth declares You Lord
Because Your precious Blood
Liberated my soul

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 14
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 15
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 16
The seed of the Virgin
Of the blessed Woman
The pillar of my home
The ransom of my soul

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 17
You are my foundation
And the hand that raised me
You won''t leave me behind
Since I''m your child truly

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 18
ና ና አማኑኤል
ና መድሐኒቴ
ፍቅርህን አልብሰኝ
ይቅር መራቍቴ

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ

VERSE 19
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love

CHORUS
ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ና ና አማኑኤል
ና መድሐኒቴ
ጽድቅህን አልብሰኝ
ይቅር መራቍቴ
ና ና አማኑኤል
ና መድሐኒቴ
ፍቅርህን አልብሰኝ
ይቅር መራቍቴ
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love
The father of mercy
Lord of benevolence
The light of forgiveness
Shines from Your countenance
More than the love of one
Father has for his son
Our Lord loves his own
He will not forsake us
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love
O Lord my remedy
You saved me by Your death
My many wounds were healed
Through Your wounds and Your death
I betrayed You forgave
I pierced You and beheld
How Your Love guards and saves
And all sorrow it quells
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love
I know You are with me
Yes, truly You are here
Your presence conquered the
mountain of my worries
Amidst all your people
My mouth declares You Lord
Because Your precious Blood
Liberated my soul
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with righteousness
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love
The seed of the Virgin
Of the blessed Woman
The pillar of my home
The ransom of my soul
You are my foundation
And the hand that raised me
You won''t leave me behind
Since I''m your child truly
ና ና አማኑኤል
ና መድሐኒቴ
ፍቅርህን አልብሰኝ
ይቅር መራቍቴ
Come forth Emmanuel
O come my Savior
Save me from nakedness
Clothe me with divine love'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '5133362a-f25c-450b-99d2-80dc24797c59'::uuid, 'come-forth-emmanuel', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tewedaj-mezimur ("ተወዳጅ መዝሙር")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8d1641ad-ddb6-40f4-b1d6-3fe767faef89'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bark lene Egzi’o zente amete mihretne bebzha hirutke lehzbke ityop’ya/afrikawiyan/keme nigney lesmke Kidus (2)
Wekeme yikun nibretene beselam webedahna bezntu amet (2)
Barkln abetu yihnn yemhret ametachn becherneth bizat lehzbochh ityop’yan/afrikawyan/endngeza leqdus simh (2)
Endihonln nuroachn yeselam yedehna bezih amet (2)

VERSE 1
Bark lene Egzi’o zente amete mihretne bebzha hirutke lehzbke ityop’ya/afrikawiyan/keme nigney lesmke Kidus (2)
Wekeme yikun nibretene beselam webedahna bezntu amet (2)
Barkln abetu yihnn yemhret ametachn becherneth bizat lehzbochh ityop’yan/afrikawyan/endngeza leqdus simh (2)
Endihonln nuroachn yeselam yedehna bezih amet (2)

CHORUS
Bark lene Egzi’o zente amete mihretne bebzha hirutke lehzbke ityop’ya/afrikawiyan/keme nigney lesmke Kidus (2)
Wekeme yikun nibretene beselam webedahna bezntu amet (2)
Barkln abetu yihnn yemhret ametachn becherneth bizat lehzbochh ityop’yan/afrikawyan/endngeza leqdus simh (2)
Endihonln nuroachn yeselam yedehna bezih amet (2)'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባርክ ለነ እግዚኦ ዘንተ ዓመተ ምሕረትነ በብዝኃ ኂሩትከ ለሕዝብከ ኢትዮጵያ/አፍሪካዊያን/ከመ ንግነይ ለስምከ ቅዱስ/፪/
ወከመ ይኩን ንብረተነ በሰላም ወበዳኅና በዝንቱ ዓመት/፪/
ባርክልን አቤቱ ይህንን የምሕረት ዓመታችን በቸርነትህ ብዛት ለሕዝቦችህ ኢትዮጵያን/አፍሪካውያን/እንድንገዛ ለቅዱስ ስምህ/፪/
እንዲሆንልን ኑሮአችን የሰላም የደህና በዚህ ዓመት /፪/

VERSE 1
ባርክ ለነ እግዚኦ ዘንተ ዓመተ ምሕረትነ በብዝኃ ኂሩትከ ለሕዝብከ ኢትዮጵያ/አፍሪካዊያን/ከመ ንግነይ ለስምከ ቅዱስ/፪/
ወከመ ይኩን ንብረተነ በሰላም ወበዳኅና በዝንቱ ዓመት/፪/
ባርክልን አቤቱ ይህንን የምሕረት ዓመታችን በቸርነትህ ብዛት ለሕዝቦችህ ኢትዮጵያን/አፍሪካውያን/እንድንገዛ ለቅዱስ ስምህ/፪/
እንዲሆንልን ኑሮአችን የሰላም የደህና በዚህ ዓመት /፪/

CHORUS
ባርክ ለነ እግዚኦ ዘንተ ዓመተ ምሕረትነ በብዝኃ ኂሩትከ ለሕዝብከ ኢትዮጵያ/አፍሪካዊያን/ከመ ንግነይ ለስምከ ቅዱስ/፪/
ወከመ ይኩን ንብረተነ በሰላም ወበዳኅና በዝንቱ ዓመት/፪/
ባርክልን አቤቱ ይህንን የምሕረት ዓመታችን በቸርነትህ ብዛት ለሕዝቦችህ ኢትዮጵያን/አፍሪካውያን/እንድንገዛ ለቅዱስ ስምህ/፪/
እንዲሆንልን ኑሮአችን የሰላም የደህና በዚህ ዓመት /፪/'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባርክ ለነ እግዚኦ ዘንተ ዓመተ ምሕረትነ በብዝኃ ኂሩትከ ለሕዝብከ ኢትዮጵያ/አፍሪካዊያን/ከመ ንግነይ ለስምከ ቅዱስ/፪/
ወከመ ይኩን ንብረተነ በሰላም ወበዳኅና በዝንቱ ዓመት/፪/
ባርክልን አቤቱ ይህንን የምሕረት ዓመታችን በቸርነትህ ብዛት ለሕዝቦችህ ኢትዮጵያን/አፍሪካውያን/እንድንገዛ ለቅዱስ ስምህ/፪/
እንዲሆንልን ኑሮአችን የሰላም የደህና በዚህ ዓመት /፪/

VERSE 1
ባርክ ለነ እግዚኦ ዘንተ ዓመተ ምሕረትነ በብዝኃ ኂሩትከ ለሕዝብከ ኢትዮጵያ/አፍሪካዊያን/ከመ ንግነይ ለስምከ ቅዱስ/፪/
ወከመ ይኩን ንብረተነ በሰላም ወበዳኅና በዝንቱ ዓመት/፪/
ባርክልን አቤቱ ይህንን የምሕረት ዓመታችን በቸርነትህ ብዛት ለሕዝቦችህ ኢትዮጵያን/አፍሪካውያን/እንድንገዛ ለቅዱስ ስምህ/፪/
እንዲሆንልን ኑሮአችን የሰላም የደህና በዚህ ዓመት /፪/

CHORUS
ባርክ ለነ እግዚኦ ዘንተ ዓመተ ምሕረትነ በብዝኃ ኂሩትከ ለሕዝብከ ኢትዮጵያ/አፍሪካዊያን/ከመ ንግነይ ለስምከ ቅዱስ/፪/
ወከመ ይኩን ንብረተነ በሰላም ወበዳኅና በዝንቱ ዓመት/፪/
ባርክልን አቤቱ ይህንን የምሕረት ዓመታችን በቸርነትህ ብዛት ለሕዝቦችህ ኢትዮጵያን/አፍሪካውያን/እንድንገዛ ለቅዱስ ስምህ/፪/
እንዲሆንልን ኑሮአችን የሰላም የደህና በዚህ ዓመት /፪/' THEN lyrics_amharic 
          ELSE 'CHORUS
ባርክ ለነ እግዚኦ ዘንተ ዓመተ ምሕረትነ በብዝኃ ኂሩትከ ለሕዝብከ ኢትዮጵያ/አፍሪካዊያን/ከመ ንግነይ ለስምከ ቅዱስ/፪/
ወከመ ይኩን ንብረተነ በሰላም ወበዳኅና በዝንቱ ዓመት/፪/
ባርክልን አቤቱ ይህንን የምሕረት ዓመታችን በቸርነትህ ብዛት ለሕዝቦችህ ኢትዮጵያን/አፍሪካውያን/እንድንገዛ ለቅዱስ ስምህ/፪/
እንዲሆንልን ኑሮአችን የሰላም የደህና በዚህ ዓመት /፪/

VERSE 1
ባርክ ለነ እግዚኦ ዘንተ ዓመተ ምሕረትነ በብዝኃ ኂሩትከ ለሕዝብከ ኢትዮጵያ/አፍሪካዊያን/ከመ ንግነይ ለስምከ ቅዱስ/፪/
ወከመ ይኩን ንብረተነ በሰላም ወበዳኅና በዝንቱ ዓመት/፪/
ባርክልን አቤቱ ይህንን የምሕረት ዓመታችን በቸርነትህ ብዛት ለሕዝቦችህ ኢትዮጵያን/አፍሪካውያን/እንድንገዛ ለቅዱስ ስምህ/፪/
እንዲሆንልን ኑሮአችን የሰላም የደህና በዚህ ዓመት /፪/

CHORUS
ባርክ ለነ እግዚኦ ዘንተ ዓመተ ምሕረትነ በብዝኃ ኂሩትከ ለሕዝብከ ኢትዮጵያ/አፍሪካዊያን/ከመ ንግነይ ለስምከ ቅዱስ/፪/
ወከመ ይኩን ንብረተነ በሰላም ወበዳኅና በዝንቱ ዓመት/፪/
ባርክልን አቤቱ ይህንን የምሕረት ዓመታችን በቸርነትህ ብዛት ለሕዝቦችህ ኢትዮጵያን/አፍሪካውያን/እንድንገዛ ለቅዱስ ስምህ/፪/
እንዲሆንልን ኑሮአችን የሰላም የደህና በዚህ ዓመት /፪/' 
        END,
        lyrics_transliteration = 'CHORUS
Bark lene Egzi’o zente amete mihretne bebzha hirutke lehzbke ityop’ya/afrikawiyan/keme nigney lesmke Kidus (2)
Wekeme yikun nibretene beselam webedahna bezntu amet (2)
Barkln abetu yihnn yemhret ametachn becherneth bizat lehzbochh ityop’yan/afrikawyan/endngeza leqdus simh (2)
Endihonln nuroachn yeselam yedehna bezih amet (2)

VERSE 1
Bark lene Egzi’o zente amete mihretne bebzha hirutke lehzbke ityop’ya/afrikawiyan/keme nigney lesmke Kidus (2)
Wekeme yikun nibretene beselam webedahna bezntu amet (2)
Barkln abetu yihnn yemhret ametachn becherneth bizat lehzbochh ityop’yan/afrikawyan/endngeza leqdus simh (2)
Endihonln nuroachn yeselam yedehna bezih amet (2)

CHORUS
Bark lene Egzi’o zente amete mihretne bebzha hirutke lehzbke ityop’ya/afrikawiyan/keme nigney lesmke Kidus (2)
Wekeme yikun nibretene beselam webedahna bezntu amet (2)
Barkln abetu yihnn yemhret ametachn becherneth bizat lehzbochh ityop’yan/afrikawyan/endngeza leqdus simh (2)
Endihonln nuroachn yeselam yedehna bezih amet (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8d1641ad-ddb6-40f4-b1d6-3fe767faef89'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባርክ ለነ እግዚኦ ዘንተ ዓመተ ምሕረትነ በብዝኃ ኂሩትከ ለሕዝብከ ኢትዮጵያ/አፍሪካዊያን/ከመ ንግነይ ለስምከ ቅዱስ/፪/
ወከመ ይኩን ንብረተነ በሰላም ወበዳኅና በዝንቱ ዓመት/፪/
ባርክልን አቤቱ ይህንን የምሕረት ዓመታችን በቸርነትህ ብዛት ለሕዝቦችህ ኢትዮጵያን/አፍሪካውያን/እንድንገዛ ለቅዱስ ስምህ/፪/
እንዲሆንልን ኑሮአችን የሰላም የደህና በዚህ ዓመት /፪/

VERSE 1
ባርክ ለነ እግዚኦ ዘንተ ዓመተ ምሕረትነ በብዝኃ ኂሩትከ ለሕዝብከ ኢትዮጵያ/አፍሪካዊያን/ከመ ንግነይ ለስምከ ቅዱስ/፪/
ወከመ ይኩን ንብረተነ በሰላም ወበዳኅና በዝንቱ ዓመት/፪/
ባርክልን አቤቱ ይህንን የምሕረት ዓመታችን በቸርነትህ ብዛት ለሕዝቦችህ ኢትዮጵያን/አፍሪካውያን/እንድንገዛ ለቅዱስ ስምህ/፪/
እንዲሆንልን ኑሮአችን የሰላም የደህና በዚህ ዓመት /፪/

CHORUS
ባርክ ለነ እግዚኦ ዘንተ ዓመተ ምሕረትነ በብዝኃ ኂሩትከ ለሕዝብከ ኢትዮጵያ/አፍሪካዊያን/ከመ ንግነይ ለስምከ ቅዱስ/፪/
ወከመ ይኩን ንብረተነ በሰላም ወበዳኅና በዝንቱ ዓመት/፪/
ባርክልን አቤቱ ይህንን የምሕረት ዓመታችን በቸርነትህ ብዛት ለሕዝቦችህ ኢትዮጵያን/አፍሪካውያን/እንድንገዛ ለቅዱስ ስምህ/፪/
እንዲሆንልን ኑሮአችን የሰላም የደህና በዚህ ዓመት /፪/'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ባርክ ለነ እግዚኦ ዘንተ ዓመተ ምሕረትነ በብዝኃ ኂሩትከ ለሕዝብከ ኢትዮጵያ/አፍሪካዊያን/ከመ ንግነይ ለስምከ ቅዱስ/፪/
ወከመ ይኩን ንብረተነ በሰላም ወበዳኅና በዝንቱ ዓመት/፪/
ባርክልን አቤቱ ይህንን የምሕረት ዓመታችን በቸርነትህ ብዛት ለሕዝቦችህ ኢትዮጵያን/አፍሪካውያን/እንድንገዛ ለቅዱስ ስምህ/፪/
እንዲሆንልን ኑሮአችን የሰላም የደህና በዚህ ዓመት /፪/'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8d1641ad-ddb6-40f4-b1d6-3fe767faef89'::uuid, 'tewedaj-mezimur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- o-my-savior ("መድኃኔ ዓለም የለም የሚሳነው")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b2d6e545-a9f6-401b-9b3f-ea3b32d74b6c'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 1
I never thought I could pass this adversity
My bed was drenched with tears, as they rolled down my cheeks
His strength is made perfect, in the face of weakness
I passed through rough waters, my burden became less

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 2
He’s the crown of my home, Advisor to my plans
The teacher of my soul, through the good and the bad
He didn’t forget me, in the day of my need
He wiped my tears away, and filled my home with glee

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 3
Yesterday I was poor, I had nothing to claim
I had not one title, and nothing to my name
But I’m made whole today, only by His mercy,
Glory be to my God, He who never leaves me

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 4
He removes from my path, that which is not for me,
And by His Will He gives, that which does profit me
All things were made by Him, and without Him was naught
Glory and Praise be to, our King Jesus Christ

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 1
I never thought I could pass this adversity
My bed was drenched with tears, as they rolled down my cheeks
His strength is made perfect, in the face of weakness
I passed through rough waters, my burden became less

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 2
He’s the crown of my home, Advisor to my plans
The teacher of my soul, through the good and the bad
He didn’t forget me, in the day of my need
He wiped my tears away, and filled my home with glee

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 3
Yesterday I was poor, I had nothing to claim
I had not one title, and nothing to my name
But I’m made whole today, only by His mercy,
Glory be to my God, He who never leaves me

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 4
He removes from my path, that which is not for me,
And by His Will He gives, that which does profit me
All things were made by Him, and without Him was naught
Glory and Praise be to, our King Jesus Christ

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 1
I never thought I could pass this adversity
My bed was drenched with tears, as they rolled down my cheeks
His strength is made perfect, in the face of weakness
I passed through rough waters, my burden became less

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 2
He’s the crown of my home, Advisor to my plans
The teacher of my soul, through the good and the bad
He didn’t forget me, in the day of my need
He wiped my tears away, and filled my home with glee

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 3
Yesterday I was poor, I had nothing to claim
I had not one title, and nothing to my name
But I’m made whole today, only by His mercy,
Glory be to my God, He who never leaves me

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 4
He removes from my path, that which is not for me,
And by His Will He gives, that which does profit me
All things were made by Him, and without Him was naught
Glory and Praise be to, our King Jesus Christ

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You' THEN lyrics_amharic 
          ELSE 'CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 1
I never thought I could pass this adversity
My bed was drenched with tears, as they rolled down my cheeks
His strength is made perfect, in the face of weakness
I passed through rough waters, my burden became less

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 2
He’s the crown of my home, Advisor to my plans
The teacher of my soul, through the good and the bad
He didn’t forget me, in the day of my need
He wiped my tears away, and filled my home with glee

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 3
Yesterday I was poor, I had nothing to claim
I had not one title, and nothing to my name
But I’m made whole today, only by His mercy,
Glory be to my God, He who never leaves me

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 4
He removes from my path, that which is not for me,
And by His Will He gives, that which does profit me
All things were made by Him, and without Him was naught
Glory and Praise be to, our King Jesus Christ

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You' 
        END,
        lyrics_transliteration = 'CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 1
I never thought I could pass this adversity
My bed was drenched with tears, as they rolled down my cheeks
His strength is made perfect, in the face of weakness
I passed through rough waters, my burden became less

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 2
He’s the crown of my home, Advisor to my plans
The teacher of my soul, through the good and the bad
He didn’t forget me, in the day of my need
He wiped my tears away, and filled my home with glee

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 3
Yesterday I was poor, I had nothing to claim
I had not one title, and nothing to my name
But I’m made whole today, only by His mercy,
Glory be to my God, He who never leaves me

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 4
He removes from my path, that which is not for me,
And by His Will He gives, that which does profit me
All things were made by Him, and without Him was naught
Glory and Praise be to, our King Jesus Christ

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b2d6e545-a9f6-401b-9b3f-ea3b32d74b6c'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 1
I never thought I could pass this adversity
My bed was drenched with tears, as they rolled down my cheeks
His strength is made perfect, in the face of weakness
I passed through rough waters, my burden became less

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 2
He’s the crown of my home, Advisor to my plans
The teacher of my soul, through the good and the bad
He didn’t forget me, in the day of my need
He wiped my tears away, and filled my home with glee

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 3
Yesterday I was poor, I had nothing to claim
I had not one title, and nothing to my name
But I’m made whole today, only by His mercy,
Glory be to my God, He who never leaves me

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You

VERSE 4
He removes from my path, that which is not for me,
And by His Will He gives, that which does profit me
All things were made by Him, and without Him was naught
Glory and Praise be to, our King Jesus Christ

CHORUS
O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You'
        OR lyrics_amharic IS NOT DISTINCT FROM 'O My Savior, I can do all through You
Emmanuel, I can do all through You
Only declare the word, and mountains will be moved
O My Savior, I can do all through You
I never thought I could pass this adversity
My bed was drenched with tears, as they rolled down my cheeks
His strength is made perfect, in the face of weakness
I passed through rough waters, my burden became less
He’s the crown of my home, Advisor to my plans
The teacher of my soul, through the good and the bad
He didn’t forget me, in the day of my need
He wiped my tears away, and filled my home with glee
Yesterday I was poor, I had nothing to claim
I had not one title, and nothing to my name
But I’m made whole today, only by His mercy,
Glory be to my God, He who never leaves me
He removes from my path, that which is not for me,
And by His Will He gives, that which does profit me
All things were made by Him, and without Him was naught
Glory and Praise be to, our King Jesus Christ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b2d6e545-a9f6-401b-9b3f-ea3b32d74b6c'::uuid, 'o-my-savior', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- des-yebelene-elel-belu ("ደስ ይበለን እልል በሉ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6d0445a8-90e7-4e5c-ae45-19ceac700581'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Des yibelen ell belu (2)
Alqerem teqebro tegegne mesqelu (2)
Bebrhan melat alemun bemulu (2)
.... az...

VERSE 1
Minbitebaberu (( miqegnoch bit’ru (2)
Kidus mesqelunm sheshgew ((bisewru (2)
Alchalum liyat’efut min bitebaberu 2
.... az...

CHORUS
Des yibelen ell belu (2)
Alqerem teqebro tegegne mesqelu (2)
Bebrhan melat alemun bemulu (2)
.... az...

VERSE 2
Beterara tesewro ((lezemenat (2)
Tet’lo betenkwel tedebqo ((kenorebet (2)
Tegelet’e zare bedemera esat (2)
..... az...

CHORUS
Des yibelen ell belu (2)
Alqerem teqebro tegegne mesqelu (2)
Bebrhan melat alemun bemulu (2)
.... az...

VERSE 3
Eleni nat yihn mist’ir ((yasgegnechw (2)
Demeran bet’beb bebotaw ((yasqomechw (2)
Yetenekweln terara yasqoferechw (2)
.... az...

CHORUS
Des yibelen ell belu (2)
Alqerem teqebro tegegne mesqelu (2)
Bebrhan melat alemun bemulu (2)
.... az...

VERSE 4
Tarikawi yeKristos ((hiyaw mesqel (2)
Yiኸw tegelet’e bekbr ((begrum hayl (2)
Mingizem siyabera endih yinoral (2)

CHORUS
Des yibelen ell belu (2)
Alqerem teqebro tegegne mesqelu (2)
Bebrhan melat alemun bemulu (2)
.... az...'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።

VERSE 1
ምንቢተባበሩ (( ምቀኞች ቢጥሩ( 2)
ቅዱስ መስቀሉንም ሸሽገው ((ቢሰውሩ(2)
አልቻሉም ሊያጠፉት ምን ቢተባበሩ 2
።።።። አዝ።።።

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።

VERSE 2
በተራራ ተሰውሮ ((ለዘመናት (2)
ተጥሎ በተንኰል ተደብቆ ((ከኖረበት (2)
ተገለጠ ዛሬ በደመራ እሳት (2)
።።።።። አዝ።።።

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።

VERSE 3
እሌኒ ናት ይህን ምስጢር ((ያስገኘችው (2)
ደመራን በጥበብ በቦታው ((ያስቆመችው (2)
የተነኰልን ተራራ ያስቆፈረችው (2)
።።።። አዝ።።።

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።

VERSE 4
ታሪካዊ የክርስቶስ ((ሕያው መስቀል (2)
ይኸው ተገለጠ በክብር ((በግሩም ኃይል (2)
ምንጊዜም ሲያበራ እንዲህ ይኖራል (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።

VERSE 1
ምንቢተባበሩ (( ምቀኞች ቢጥሩ( 2)
ቅዱስ መስቀሉንም ሸሽገው ((ቢሰውሩ(2)
አልቻሉም ሊያጠፉት ምን ቢተባበሩ 2
።።።። አዝ።።።

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።

VERSE 2
በተራራ ተሰውሮ ((ለዘመናት (2)
ተጥሎ በተንኰል ተደብቆ ((ከኖረበት (2)
ተገለጠ ዛሬ በደመራ እሳት (2)
።።።።። አዝ።።።

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።

VERSE 3
እሌኒ ናት ይህን ምስጢር ((ያስገኘችው (2)
ደመራን በጥበብ በቦታው ((ያስቆመችው (2)
የተነኰልን ተራራ ያስቆፈረችው (2)
።።።። አዝ።።።

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።

VERSE 4
ታሪካዊ የክርስቶስ ((ሕያው መስቀል (2)
ይኸው ተገለጠ በክብር ((በግሩም ኃይል (2)
ምንጊዜም ሲያበራ እንዲህ ይኖራል (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።' THEN lyrics_amharic 
          ELSE 'CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።

VERSE 1
ምንቢተባበሩ (( ምቀኞች ቢጥሩ( 2)
ቅዱስ መስቀሉንም ሸሽገው ((ቢሰውሩ(2)
አልቻሉም ሊያጠፉት ምን ቢተባበሩ 2
።።።። አዝ።።።

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።

VERSE 2
በተራራ ተሰውሮ ((ለዘመናት (2)
ተጥሎ በተንኰል ተደብቆ ((ከኖረበት (2)
ተገለጠ ዛሬ በደመራ እሳት (2)
።።።።። አዝ።።።

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።

VERSE 3
እሌኒ ናት ይህን ምስጢር ((ያስገኘችው (2)
ደመራን በጥበብ በቦታው ((ያስቆመችው (2)
የተነኰልን ተራራ ያስቆፈረችው (2)
።።።። አዝ።።።

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።

VERSE 4
ታሪካዊ የክርስቶስ ((ሕያው መስቀል (2)
ይኸው ተገለጠ በክብር ((በግሩም ኃይል (2)
ምንጊዜም ሲያበራ እንዲህ ይኖራል (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።' 
        END,
        lyrics_transliteration = 'CHORUS
Des yibelen ell belu (2)
Alqerem teqebro tegegne mesqelu (2)
Bebrhan melat alemun bemulu (2)
.... az...

VERSE 1
Minbitebaberu (( miqegnoch bit’ru (2)
Kidus mesqelunm sheshgew ((bisewru (2)
Alchalum liyat’efut min bitebaberu 2
.... az...

CHORUS
Des yibelen ell belu (2)
Alqerem teqebro tegegne mesqelu (2)
Bebrhan melat alemun bemulu (2)
.... az...

VERSE 2
Beterara tesewro ((lezemenat (2)
Tet’lo betenkwel tedebqo ((kenorebet (2)
Tegelet’e zare bedemera esat (2)
..... az...

CHORUS
Des yibelen ell belu (2)
Alqerem teqebro tegegne mesqelu (2)
Bebrhan melat alemun bemulu (2)
.... az...

VERSE 3
Eleni nat yihn mist’ir ((yasgegnechw (2)
Demeran bet’beb bebotaw ((yasqomechw (2)
Yetenekweln terara yasqoferechw (2)
.... az...

CHORUS
Des yibelen ell belu (2)
Alqerem teqebro tegegne mesqelu (2)
Bebrhan melat alemun bemulu (2)
.... az...

VERSE 4
Tarikawi yeKristos ((hiyaw mesqel (2)
Yiኸw tegelet’e bekbr ((begrum hayl (2)
Mingizem siyabera endih yinoral (2)

CHORUS
Des yibelen ell belu (2)
Alqerem teqebro tegegne mesqelu (2)
Bebrhan melat alemun bemulu (2)
.... az...',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6d0445a8-90e7-4e5c-ae45-19ceac700581'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።

VERSE 1
ምንቢተባበሩ (( ምቀኞች ቢጥሩ( 2)
ቅዱስ መስቀሉንም ሸሽገው ((ቢሰውሩ(2)
አልቻሉም ሊያጠፉት ምን ቢተባበሩ 2
።።።። አዝ።።።

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።

VERSE 2
በተራራ ተሰውሮ ((ለዘመናት (2)
ተጥሎ በተንኰል ተደብቆ ((ከኖረበት (2)
ተገለጠ ዛሬ በደመራ እሳት (2)
።።።።። አዝ።።።

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።

VERSE 3
እሌኒ ናት ይህን ምስጢር ((ያስገኘችው (2)
ደመራን በጥበብ በቦታው ((ያስቆመችው (2)
የተነኰልን ተራራ ያስቆፈረችው (2)
።።።። አዝ።።።

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።

VERSE 4
ታሪካዊ የክርስቶስ ((ሕያው መስቀል (2)
ይኸው ተገለጠ በክብር ((በግሩም ኃይል (2)
ምንጊዜም ሲያበራ እንዲህ ይኖራል (2)

CHORUS
ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ደስ ይበለን እልል በሉ (2)
አልቀረም ተቀብሮ ተገኘ መስቀሉ (2)
በብርሃን መላት ዓለሙን በሙሉ (2)
።።።። አዝ።።።
ምንቢተባበሩ (( ምቀኞች ቢጥሩ( 2)
ቅዱስ መስቀሉንም ሸሽገው ((ቢሰውሩ(2)
አልቻሉም ሊያጠፉት ምን ቢተባበሩ 2
።።።። አዝ።።።
በተራራ ተሰውሮ ((ለዘመናት (2)
ተጥሎ በተንኰል ተደብቆ ((ከኖረበት (2)
ተገለጠ ዛሬ በደመራ እሳት (2)
።።።።። አዝ።።።
እሌኒ ናት ይህን ምስጢር ((ያስገኘችው (2)
ደመራን በጥበብ በቦታው ((ያስቆመችው (2)
የተነኰልን ተራራ ያስቆፈረችው (2)
።።።። አዝ።።።
ታሪካዊ የክርስቶስ ((ሕያው መስቀል (2)
ይኸው ተገለጠ በክብር ((በግሩም ኃይል (2)
ምንጊዜም ሲያበራ እንዲህ ይኖራል (2)'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6d0445a8-90e7-4e5c-ae45-19ceac700581'::uuid, 'des-yebelene-elel-belu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tewelide-nahu-em-dinigil ("ተወልደ ናሁ እም ድንግል")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8f5fa39e-54d6-40e0-8102-70733a2ab988'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tewelde nahu em Dingil 2
Sineger nebere benebyate af
Tewelde nahu em Dingil 2
Beandu beegziyaabher bandu bemenfes

VERSE 1
Tewelde nahu em Dingil 2
And qen endihon ts’ehey endiwet’a
Tewelde nahu em Dingil 2
Yenafeqnew nigus siga lebso met’a

CHORUS
Tewelde nahu em Dingil 2
Sineger nebere benebyate af
Tewelde nahu em Dingil 2
Beandu beegziyaabher bandu bemenfes

VERSE 2
Tewelde nahu em Dingil 2

CHORUS
Tewelde nahu em Dingil 2
Sineger nebere benebyate af
Tewelde nahu em Dingil 2
Beandu beegziyaabher bandu bemenfes'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተወልደ ናሁ እም ድንግል ፪
ሲነገር ነበረ በነብያተ አፍ
ተወልደ ናሁ እም ድንግል ፪
በአንዱ በእግዚያአብሔር ባንዱ በመንፈስ

VERSE 1
ተወልደ ናሁ እም ድንግል ፪
አንድ ቀን እንዲሆን ፀሐይ እንዲወጣ
ተወልደ ናሁ እም ድንግል ፪
የናፈቅነው ንጉሥ ሥጋ ለብሶ መጣ

CHORUS
ተወልደ ናሁ እም ድንግል ፪
ሲነገር ነበረ በነብያተ አፍ
ተወልደ ናሁ እም ድንግል ፪
በአንዱ በእግዚያአብሔር ባንዱ በመንፈስ

VERSE 2
ተወልደ ናሁ እም ድንግል ፪

CHORUS
ተወልደ ናሁ እም ድንግል ፪
ሲነገር ነበረ በነብያተ አፍ
ተወልደ ናሁ እም ድንግል ፪
በአንዱ በእግዚያአብሔር ባንዱ በመንፈስ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተወልደ ናሁ እም ድንግል ፪
ሲነገር ነበረ በነብያተ አፍ
ተወልደ ናሁ እም ድንግል ፪
በአንዱ በእግዚያአብሔር ባንዱ በመንፈስ

VERSE 1
ተወልደ ናሁ እም ድንግል ፪
አንድ ቀን እንዲሆን ፀሐይ እንዲወጣ
ተወልደ ናሁ እም ድንግል ፪
የናፈቅነው ንጉሥ ሥጋ ለብሶ መጣ

CHORUS
ተወልደ ናሁ እም ድንግል ፪
ሲነገር ነበረ በነብያተ አፍ
ተወልደ ናሁ እም ድንግል ፪
በአንዱ በእግዚያአብሔር ባንዱ በመንፈስ

VERSE 2
ተወልደ ናሁ እም ድንግል ፪

CHORUS
ተወልደ ናሁ እም ድንግል ፪
ሲነገር ነበረ በነብያተ አፍ
ተወልደ ናሁ እም ድንግል ፪
በአንዱ በእግዚያአብሔር ባንዱ በመንፈስ' THEN lyrics_amharic 
          ELSE 'CHORUS
ተወልደ ናሁ እም ድንግል ፪
ሲነገር ነበረ በነብያተ አፍ
ተወልደ ናሁ እም ድንግል ፪
በአንዱ በእግዚያአብሔር ባንዱ በመንፈስ

VERSE 1
ተወልደ ናሁ እም ድንግል ፪
አንድ ቀን እንዲሆን ፀሐይ እንዲወጣ
ተወልደ ናሁ እም ድንግል ፪
የናፈቅነው ንጉሥ ሥጋ ለብሶ መጣ

CHORUS
ተወልደ ናሁ እም ድንግል ፪
ሲነገር ነበረ በነብያተ አፍ
ተወልደ ናሁ እም ድንግል ፪
በአንዱ በእግዚያአብሔር ባንዱ በመንፈስ

VERSE 2
ተወልደ ናሁ እም ድንግል ፪

CHORUS
ተወልደ ናሁ እም ድንግል ፪
ሲነገር ነበረ በነብያተ አፍ
ተወልደ ናሁ እም ድንግል ፪
በአንዱ በእግዚያአብሔር ባንዱ በመንፈስ' 
        END,
        lyrics_transliteration = 'CHORUS
Tewelde nahu em Dingil 2
Sineger nebere benebyate af
Tewelde nahu em Dingil 2
Beandu beegziyaabher bandu bemenfes

VERSE 1
Tewelde nahu em Dingil 2
And qen endihon ts’ehey endiwet’a
Tewelde nahu em Dingil 2
Yenafeqnew nigus siga lebso met’a

CHORUS
Tewelde nahu em Dingil 2
Sineger nebere benebyate af
Tewelde nahu em Dingil 2
Beandu beegziyaabher bandu bemenfes

VERSE 2
Tewelde nahu em Dingil 2

CHORUS
Tewelde nahu em Dingil 2
Sineger nebere benebyate af
Tewelde nahu em Dingil 2
Beandu beegziyaabher bandu bemenfes',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8f5fa39e-54d6-40e0-8102-70733a2ab988'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተወልደ ናሁ እም ድንግል ፪
ሲነገር ነበረ በነብያተ አፍ
ተወልደ ናሁ እም ድንግል ፪
በአንዱ በእግዚያአብሔር ባንዱ በመንፈስ

VERSE 1
ተወልደ ናሁ እም ድንግል ፪
አንድ ቀን እንዲሆን ፀሐይ እንዲወጣ
ተወልደ ናሁ እም ድንግል ፪
የናፈቅነው ንጉሥ ሥጋ ለብሶ መጣ

CHORUS
ተወልደ ናሁ እም ድንግል ፪
ሲነገር ነበረ በነብያተ አፍ
ተወልደ ናሁ እም ድንግል ፪
በአንዱ በእግዚያአብሔር ባንዱ በመንፈስ

VERSE 2
ተወልደ ናሁ እም ድንግል ፪

CHORUS
ተወልደ ናሁ እም ድንግል ፪
ሲነገር ነበረ በነብያተ አፍ
ተወልደ ናሁ እም ድንግል ፪
በአንዱ በእግዚያአብሔር ባንዱ በመንፈስ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ተወልደ ናሁ እም ድንግል ፪
ሲነገር ነበረ በነብያተ አፍ
ተወልደ ናሁ እም ድንግል ፪
በአንዱ በእግዚያአብሔር ባንዱ በመንፈስ
ተወልደ ናሁ እም ድንግል ፪
አንድ ቀን እንዲሆን ፀሐይ እንዲወጣ
ተወልደ ናሁ እም ድንግል ፪
የናፈቅነው ንጉሥ ሥጋ ለብሶ መጣ
ተወልደ ናሁ እም ድንግል ፪'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8f5fa39e-54d6-40e0-8102-70733a2ab988'::uuid, 'tewelide-nahu-em-dinigil', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- youre-the-soul-for-my-soul-english-orthodox-tewahedo-hymn ("youre-the-soul-for-my-soul-english-orthodox-tewahedo-hymn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b2d9f92e-be76-4ccc-be20-d9ed93a3cb25'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 1
Mothers of the righteous, in number they’re many
Before and after Christ, truly they are plenty
But Mary You are one, there is no one like You
You live on for ages, guiding us all to You

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 2
All those who call on you, all who honor your name
All who offer praises, your glory who proclaims
Truly he does profit, and truly does he gain
There is none who loses, there is none put to shame

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 3
Saint Gregory and the, righteous father St John
St Basil who is Great, and St. Athanasius
Our teacher St. Ephrem and St George our father
All profited from you, calling you their Mother

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 4
Go and ask your Fathers, is what the Word proclaims
And when we did ask them, all of the righteous saints
They did tell us of You, how you endlessly love
How you plead for mankind, saving us from above

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 5
Gabriel from heaven, Elizabeth from Earth
Together they did preach, honor to Virgin birth
Whoever pleads to You, calling upon Your name
He can only profit, no one is put to shame

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 1
Mothers of the righteous, in number they’re many
Before and after Christ, truly they are plenty
But Mary You are one, there is no one like You
You live on for ages, guiding us all to You

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 2
All those who call on you, all who honor your name
All who offer praises, your glory who proclaims
Truly he does profit, and truly does he gain
There is none who loses, there is none put to shame

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 3
Saint Gregory and the, righteous father St John
St Basil who is Great, and St. Athanasius
Our teacher St. Ephrem and St George our father
All profited from you, calling you their Mother

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 4
Go and ask your Fathers, is what the Word proclaims
And when we did ask them, all of the righteous saints
They did tell us of You, how you endlessly love
How you plead for mankind, saving us from above

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 5
Gabriel from heaven, Elizabeth from Earth
Together they did preach, honor to Virgin birth
Whoever pleads to You, calling upon Your name
He can only profit, no one is put to shame

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 1
Mothers of the righteous, in number they’re many
Before and after Christ, truly they are plenty
But Mary You are one, there is no one like You
You live on for ages, guiding us all to You

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 2
All those who call on you, all who honor your name
All who offer praises, your glory who proclaims
Truly he does profit, and truly does he gain
There is none who loses, there is none put to shame

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 3
Saint Gregory and the, righteous father St John
St Basil who is Great, and St. Athanasius
Our teacher St. Ephrem and St George our father
All profited from you, calling you their Mother

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 4
Go and ask your Fathers, is what the Word proclaims
And when we did ask them, all of the righteous saints
They did tell us of You, how you endlessly love
How you plead for mankind, saving us from above

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 5
Gabriel from heaven, Elizabeth from Earth
Together they did preach, honor to Virgin birth
Whoever pleads to You, calling upon Your name
He can only profit, no one is put to shame

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours' THEN lyrics_amharic 
          ELSE 'CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 1
Mothers of the righteous, in number they’re many
Before and after Christ, truly they are plenty
But Mary You are one, there is no one like You
You live on for ages, guiding us all to You

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 2
All those who call on you, all who honor your name
All who offer praises, your glory who proclaims
Truly he does profit, and truly does he gain
There is none who loses, there is none put to shame

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 3
Saint Gregory and the, righteous father St John
St Basil who is Great, and St. Athanasius
Our teacher St. Ephrem and St George our father
All profited from you, calling you their Mother

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 4
Go and ask your Fathers, is what the Word proclaims
And when we did ask them, all of the righteous saints
They did tell us of You, how you endlessly love
How you plead for mankind, saving us from above

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 5
Gabriel from heaven, Elizabeth from Earth
Together they did preach, honor to Virgin birth
Whoever pleads to You, calling upon Your name
He can only profit, no one is put to shame

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours' 
        END,
        lyrics_transliteration = 'CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 1
Mothers of the righteous, in number they’re many
Before and after Christ, truly they are plenty
But Mary You are one, there is no one like You
You live on for ages, guiding us all to You

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 2
All those who call on you, all who honor your name
All who offer praises, your glory who proclaims
Truly he does profit, and truly does he gain
There is none who loses, there is none put to shame

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 3
Saint Gregory and the, righteous father St John
St Basil who is Great, and St. Athanasius
Our teacher St. Ephrem and St George our father
All profited from you, calling you their Mother

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 4
Go and ask your Fathers, is what the Word proclaims
And when we did ask them, all of the righteous saints
They did tell us of You, how you endlessly love
How you plead for mankind, saving us from above

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 5
Gabriel from heaven, Elizabeth from Earth
Together they did preach, honor to Virgin birth
Whoever pleads to You, calling upon Your name
He can only profit, no one is put to shame

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b2d9f92e-be76-4ccc-be20-d9ed93a3cb25'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 1
Mothers of the righteous, in number they’re many
Before and after Christ, truly they are plenty
But Mary You are one, there is no one like You
You live on for ages, guiding us all to You

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 2
All those who call on you, all who honor your name
All who offer praises, your glory who proclaims
Truly he does profit, and truly does he gain
There is none who loses, there is none put to shame

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 3
Saint Gregory and the, righteous father St John
St Basil who is Great, and St. Athanasius
Our teacher St. Ephrem and St George our father
All profited from you, calling you their Mother

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 4
Go and ask your Fathers, is what the Word proclaims
And when we did ask them, all of the righteous saints
They did tell us of You, how you endlessly love
How you plead for mankind, saving us from above

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours

VERSE 5
Gabriel from heaven, Elizabeth from Earth
Together they did preach, honor to Virgin birth
Whoever pleads to You, calling upon Your name
He can only profit, no one is put to shame

CHORUS
Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours'
        OR lyrics_amharic IS NOT DISTINCT FROM 'Lenefese nefeswa nesh, Lemengede fana
Endaltefa amnalew, Yanchi lij Negna
You’re the soul for my soul, and the Light of my path
I know I won’t perish i’m a child of Yours
Mothers of the righteous, in number they’re many
Before and after Christ, truly they are plenty
But Mary You are one, there is no one like You
You live on for ages, guiding us all to You
All those who call on you, all who honor your name
All who offer praises, your glory who proclaims
Truly he does profit, and truly does he gain
There is none who loses, there is none put to shame
Saint Gregory and the, righteous father St John
St Basil who is Great, and St. Athanasius
Our teacher St. Ephrem and St George our father
All profited from you, calling you their Mother
Go and ask your Fathers, is what the Word proclaims
And when we did ask them, all of the righteous saints
They did tell us of You, how you endlessly love
How you plead for mankind, saving us from above
Gabriel from heaven, Elizabeth from Earth
Together they did preach, honor to Virgin birth
Whoever pleads to You, calling upon Your name
He can only profit, no one is put to shame'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b2d9f92e-be76-4ccc-be20-d9ed93a3cb25'::uuid, 'youre-the-soul-for-my-soul-english-orthodox-tewahedo-hymn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- faarsaa-cuuphaa-best-afaan-oromoo-orthodox-mezmur-gurguddootaa-dhiisee-i ("faarsaa-cuuphaa-best-afaan-oromoo-orthodox-mezmur-gurguddootaa-dhiisee-i")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b51d1863-7116-4390-8d12-99363c7c6d11'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 1
Maqaa sooratne isa ittin bullu
Waaqayyoo nuuf keenne affuura qulqulluu
Ofii irraat arginaan yoordanoos uummaa isaa
Teellati deebi''ee mul''isee sodaa isaa

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 2
Gooftaan hundaa uumee gad of qabuudhaanii
Cuuphammudhan kunoo nuuf bu''ee nagaanii
Daawit mul''ataasaan akkumaa dubbaate
Arjummaan gooftichaa sirriitti mul''aate

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 3
Lafti ifaan guutees lammuun dukkanaa''uu
Jira yeroo dhiphuu waaqni inni nuuf nahuu
Jireenyi garbummaa seexanna harkaa ba''ee
Aangoo Iyeesuusiin har''a barbada''ee

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 4
Galataaf dhabbannee nuuttis dhugaa baanaa
Maqaa Kiristoosiin nama ifa taanaa
Gurguddoo dhiisee isaa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 1
Maqaa sooratne isa ittin bullu
Waaqayyoo nuuf keenne affuura qulqulluu
Ofii irraat arginaan yoordanoos uummaa isaa
Teellati deebi''ee mul''isee sodaa isaa

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 2
Gooftaan hundaa uumee gad of qabuudhaanii
Cuuphammudhan kunoo nuuf bu''ee nagaanii
Daawit mul''ataasaan akkumaa dubbaate
Arjummaan gooftichaa sirriitti mul''aate

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 3
Lafti ifaan guutees lammuun dukkanaa''uu
Jira yeroo dhiphuu waaqni inni nuuf nahuu
Jireenyi garbummaa seexanna harkaa ba''ee
Aangoo Iyeesuusiin har''a barbada''ee

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 4
Galataaf dhabbannee nuuttis dhugaa baanaa
Maqaa Kiristoosiin nama ifa taanaa
Gurguddoo dhiisee isaa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 1
Maqaa sooratne isa ittin bullu
Waaqayyoo nuuf keenne affuura qulqulluu
Ofii irraat arginaan yoordanoos uummaa isaa
Teellati deebi''ee mul''isee sodaa isaa

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 2
Gooftaan hundaa uumee gad of qabuudhaanii
Cuuphammudhan kunoo nuuf bu''ee nagaanii
Daawit mul''ataasaan akkumaa dubbaate
Arjummaan gooftichaa sirriitti mul''aate

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 3
Lafti ifaan guutees lammuun dukkanaa''uu
Jira yeroo dhiphuu waaqni inni nuuf nahuu
Jireenyi garbummaa seexanna harkaa ba''ee
Aangoo Iyeesuusiin har''a barbada''ee

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 4
Galataaf dhabbannee nuuttis dhugaa baanaa
Maqaa Kiristoosiin nama ifa taanaa
Gurguddoo dhiisee isaa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase' THEN lyrics_amharic 
          ELSE 'CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 1
Maqaa sooratne isa ittin bullu
Waaqayyoo nuuf keenne affuura qulqulluu
Ofii irraat arginaan yoordanoos uummaa isaa
Teellati deebi''ee mul''isee sodaa isaa

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 2
Gooftaan hundaa uumee gad of qabuudhaanii
Cuuphammudhan kunoo nuuf bu''ee nagaanii
Daawit mul''ataasaan akkumaa dubbaate
Arjummaan gooftichaa sirriitti mul''aate

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 3
Lafti ifaan guutees lammuun dukkanaa''uu
Jira yeroo dhiphuu waaqni inni nuuf nahuu
Jireenyi garbummaa seexanna harkaa ba''ee
Aangoo Iyeesuusiin har''a barbada''ee

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 4
Galataaf dhabbannee nuuttis dhugaa baanaa
Maqaa Kiristoosiin nama ifa taanaa
Gurguddoo dhiisee isaa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase' 
        END,
        lyrics_transliteration = 'CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 1
Maqaa sooratne isa ittin bullu
Waaqayyoo nuuf keenne affuura qulqulluu
Ofii irraat arginaan yoordanoos uummaa isaa
Teellati deebi''ee mul''isee sodaa isaa

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 2
Gooftaan hundaa uumee gad of qabuudhaanii
Cuuphammudhan kunoo nuuf bu''ee nagaanii
Daawit mul''ataasaan akkumaa dubbaate
Arjummaan gooftichaa sirriitti mul''aate

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 3
Lafti ifaan guutees lammuun dukkanaa''uu
Jira yeroo dhiphuu waaqni inni nuuf nahuu
Jireenyi garbummaa seexanna harkaa ba''ee
Aangoo Iyeesuusiin har''a barbada''ee

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 4
Galataaf dhabbannee nuuttis dhugaa baanaa
Maqaa Kiristoosiin nama ifa taanaa
Gurguddoo dhiisee isaa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b51d1863-7116-4390-8d12-99363c7c6d11'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 1
Maqaa sooratne isa ittin bullu
Waaqayyoo nuuf keenne affuura qulqulluu
Ofii irraat arginaan yoordanoos uummaa isaa
Teellati deebi''ee mul''isee sodaa isaa

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 2
Gooftaan hundaa uumee gad of qabuudhaanii
Cuuphammudhan kunoo nuuf bu''ee nagaanii
Daawit mul''ataasaan akkumaa dubbaate
Arjummaan gooftichaa sirriitti mul''aate

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 3
Lafti ifaan guutees lammuun dukkanaa''uu
Jira yeroo dhiphuu waaqni inni nuuf nahuu
Jireenyi garbummaa seexanna harkaa ba''ee
Aangoo Iyeesuusiin har''a barbada''ee

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase

VERSE 4
Galataaf dhabbannee nuuttis dhugaa baanaa
Maqaa Kiristoosiin nama ifa taanaa
Gurguddoo dhiisee isaa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.

CHORUS
Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase'
        OR lyrics_amharic IS NOT DISTINCT FROM 'Gurguddootaa dhiisee isa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.
Iccitii isaa guddaa abbaan ifa baasee
Ilmaa isa jaallatuu gooftaa nuu badhaase
Maqaa sooratne isa ittin bullu
Waaqayyoo nuuf keenne affuura qulqulluu
Ofii irraat arginaan yoordanoos uummaa isaa
Teellati deebi''ee mul''isee sodaa isaa
Gooftaan hundaa uumee gad of qabuudhaanii
Cuuphammudhan kunoo nuuf bu''ee nagaanii
Daawit mul''ataasaan akkumaa dubbaate
Arjummaan gooftichaa sirriitti mul''aate
Lafti ifaan guutees lammuun dukkanaa''uu
Jira yeroo dhiphuu waaqni inni nuuf nahuu
Jireenyi garbummaa seexanna harkaa ba''ee
Aangoo Iyeesuusiin har''a barbada''ee
Galataaf dhabbannee nuuttis dhugaa baanaa
Maqaa Kiristoosiin nama ifa taanaa
Gurguddoo dhiisee isaa bade barbaachaa(2x)
Walakkaa galanaa dhabbate walakkaa galanaa.'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b51d1863-7116-4390-8d12-99363c7c6d11'::uuid, 'faarsaa-cuuphaa-best-afaan-oromoo-orthodox-mezmur-gurguddootaa-dhiisee-i', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kesit-demena ("ቀስት ደመና")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'd4aa6de9-1b14-4c80-a13d-fb6c5ff6214f'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Qeste demena yenoh qalkidan metemamegna
Qal gebtwal beanchi endayat’efan bemot dagmegna
Medhanit weldesh let’efaw alem desta yehonsh
Sendeqachn nesh lealem mint’equmsh

VERSE 1
.
Geta milkt yiset’achhwal
Yedngl firem yadnachhwal
Yeadam tarik tegelebet’e

CHORUS
Qeste demena yenoh qalkidan metemamegna
Qal gebtwal beanchi endayat’efan bemot dagmegna
Medhanit weldesh let’efaw alem desta yehonsh
Sendeqachn nesh lealem mint’equmsh

VERSE 2
Mot beljsh mot siletewat’e (2x)

CHORUS
Qeste demena yenoh qalkidan metemamegna
Qal gebtwal beanchi endayat’efan bemot dagmegna
Medhanit weldesh let’efaw alem desta yehonsh
Sendeqachn nesh lealem mint’equmsh

VERSE 3
Aselfonal lekbrsh zema
Yememats’egna yedl ketema
Molto yifesal ts’ega miljash
Kibrachn beztwal sinakebrsh (2x)

CHORUS
Qeste demena yenoh qalkidan metemamegna
Qal gebtwal beanchi endayat’efan bemot dagmegna
Medhanit weldesh let’efaw alem desta yehonsh
Sendeqachn nesh lealem mint’equmsh

VERSE 4
Melak negeren talaqun neger
Endemtweljiw yale wend zer
Geta belbu silesalesh
Yih hulu fit’ret bits’yt alesh (2x)

CHORUS
Qeste demena yenoh qalkidan metemamegna
Qal gebtwal beanchi endayat’efan bemot dagmegna
Medhanit weldesh let’efaw alem desta yehonsh
Sendeqachn nesh lealem mint’equmsh

VERSE 5
Fiqr newna alamaw beegna
YeEgziabher Ab lij tamagnu eregna
Begochun liyadn sigelet’ bealem
Hereg yehonew ende anchi yelem (2x)

CHORUS
Qeste demena yenoh qalkidan metemamegna
Qal gebtwal beanchi endayat’efan bemot dagmegna
Medhanit weldesh let’efaw alem desta yehonsh
Sendeqachn nesh lealem mint’equmsh'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ

VERSE 1
.
ጌታ ምልክት ይሰጣችኋል
የድንግል ፍሬም ያድናችኋል
የአዳም ታሪክ ተገለበጠ

CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ

VERSE 2
ሞት በልጅሽ ሞት ስለተዋጠ (2x)

CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ

VERSE 3
አሰልፎናል ለክብርሽ ዜማ
የመማፀኛ የድል ከተማ
ሞልቶ ይፈሳል ፀጋ ምልጃሽ
ክብራችን በዝቷል ስናከብርሽ (2x)

CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ

VERSE 4
መልዐክ ነገረን ታላቁን ነገር
እንደምትወልጂው ያለ ወንድ ዘር
ጌታ በልቡ ስለሳለሽ
ይህ ሁሉ ፍጥረት ብፅይት አለሽ (2x)

CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ

VERSE 5
ፍቅር ነውና ዓላማው በእኛ
የእግዚአብሔር አብ ልጅ ታማኙ እረኛ
በጎቹን ሊያድን ሲገለጥ በዓለም
ሐረግ የሆነው እንደ አንቺ የለም (2x)

CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ

VERSE 1
.
ጌታ ምልክት ይሰጣችኋል
የድንግል ፍሬም ያድናችኋል
የአዳም ታሪክ ተገለበጠ

CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ

VERSE 2
ሞት በልጅሽ ሞት ስለተዋጠ (2x)

CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ

VERSE 3
አሰልፎናል ለክብርሽ ዜማ
የመማፀኛ የድል ከተማ
ሞልቶ ይፈሳል ፀጋ ምልጃሽ
ክብራችን በዝቷል ስናከብርሽ (2x)

CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ

VERSE 4
መልዐክ ነገረን ታላቁን ነገር
እንደምትወልጂው ያለ ወንድ ዘር
ጌታ በልቡ ስለሳለሽ
ይህ ሁሉ ፍጥረት ብፅይት አለሽ (2x)

CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ

VERSE 5
ፍቅር ነውና ዓላማው በእኛ
የእግዚአብሔር አብ ልጅ ታማኙ እረኛ
በጎቹን ሊያድን ሲገለጥ በዓለም
ሐረግ የሆነው እንደ አንቺ የለም (2x)

CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ' THEN lyrics_amharic 
          ELSE 'CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ

VERSE 1
.
ጌታ ምልክት ይሰጣችኋል
የድንግል ፍሬም ያድናችኋል
የአዳም ታሪክ ተገለበጠ

CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ

VERSE 2
ሞት በልጅሽ ሞት ስለተዋጠ (2x)

CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ

VERSE 3
አሰልፎናል ለክብርሽ ዜማ
የመማፀኛ የድል ከተማ
ሞልቶ ይፈሳል ፀጋ ምልጃሽ
ክብራችን በዝቷል ስናከብርሽ (2x)

CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ

VERSE 4
መልዐክ ነገረን ታላቁን ነገር
እንደምትወልጂው ያለ ወንድ ዘር
ጌታ በልቡ ስለሳለሽ
ይህ ሁሉ ፍጥረት ብፅይት አለሽ (2x)

CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ

VERSE 5
ፍቅር ነውና ዓላማው በእኛ
የእግዚአብሔር አብ ልጅ ታማኙ እረኛ
በጎቹን ሊያድን ሲገለጥ በዓለም
ሐረግ የሆነው እንደ አንቺ የለም (2x)

CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ' 
        END,
        lyrics_transliteration = 'CHORUS
Qeste demena yenoh qalkidan metemamegna
Qal gebtwal beanchi endayat’efan bemot dagmegna
Medhanit weldesh let’efaw alem desta yehonsh
Sendeqachn nesh lealem mint’equmsh

VERSE 1
.
Geta milkt yiset’achhwal
Yedngl firem yadnachhwal
Yeadam tarik tegelebet’e

CHORUS
Qeste demena yenoh qalkidan metemamegna
Qal gebtwal beanchi endayat’efan bemot dagmegna
Medhanit weldesh let’efaw alem desta yehonsh
Sendeqachn nesh lealem mint’equmsh

VERSE 2
Mot beljsh mot siletewat’e (2x)

CHORUS
Qeste demena yenoh qalkidan metemamegna
Qal gebtwal beanchi endayat’efan bemot dagmegna
Medhanit weldesh let’efaw alem desta yehonsh
Sendeqachn nesh lealem mint’equmsh

VERSE 3
Aselfonal lekbrsh zema
Yememats’egna yedl ketema
Molto yifesal ts’ega miljash
Kibrachn beztwal sinakebrsh (2x)

CHORUS
Qeste demena yenoh qalkidan metemamegna
Qal gebtwal beanchi endayat’efan bemot dagmegna
Medhanit weldesh let’efaw alem desta yehonsh
Sendeqachn nesh lealem mint’equmsh

VERSE 4
Melak negeren talaqun neger
Endemtweljiw yale wend zer
Geta belbu silesalesh
Yih hulu fit’ret bits’yt alesh (2x)

CHORUS
Qeste demena yenoh qalkidan metemamegna
Qal gebtwal beanchi endayat’efan bemot dagmegna
Medhanit weldesh let’efaw alem desta yehonsh
Sendeqachn nesh lealem mint’equmsh

VERSE 5
Fiqr newna alamaw beegna
YeEgziabher Ab lij tamagnu eregna
Begochun liyadn sigelet’ bealem
Hereg yehonew ende anchi yelem (2x)

CHORUS
Qeste demena yenoh qalkidan metemamegna
Qal gebtwal beanchi endayat’efan bemot dagmegna
Medhanit weldesh let’efaw alem desta yehonsh
Sendeqachn nesh lealem mint’equmsh',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'd4aa6de9-1b14-4c80-a13d-fb6c5ff6214f'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ

VERSE 1
.
ጌታ ምልክት ይሰጣችኋል
የድንግል ፍሬም ያድናችኋል
የአዳም ታሪክ ተገለበጠ

CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ

VERSE 2
ሞት በልጅሽ ሞት ስለተዋጠ (2x)

CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ

VERSE 3
አሰልፎናል ለክብርሽ ዜማ
የመማፀኛ የድል ከተማ
ሞልቶ ይፈሳል ፀጋ ምልጃሽ
ክብራችን በዝቷል ስናከብርሽ (2x)

CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ

VERSE 4
መልዐክ ነገረን ታላቁን ነገር
እንደምትወልጂው ያለ ወንድ ዘር
ጌታ በልቡ ስለሳለሽ
ይህ ሁሉ ፍጥረት ብፅይት አለሽ (2x)

CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ

VERSE 5
ፍቅር ነውና ዓላማው በእኛ
የእግዚአብሔር አብ ልጅ ታማኙ እረኛ
በጎቹን ሊያድን ሲገለጥ በዓለም
ሐረግ የሆነው እንደ አንቺ የለም (2x)

CHORUS
ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ቀስተ ደመና የኖኅ ቃልኪዳን መተማመኛ
ቃል ገብቷል በአንቺ እንዳያጠፋን በሞት ዳግመኛ
መድኃኒት ወልደሽ ለጠፋው ዓለም ደስታ የሆንሽ
ሰንደቃችን ነሽ ለዓለም ምንጠቁምሽ
አዝ..
.
ጌታ ምልክት ይሰጣችኋል
የድንግል ፍሬም ያድናችኋል
የአዳም ታሪክ ተገለበጠ
ሞት በልጅሽ ሞት ስለተዋጠ (2x)
አዝ...
አሰልፎናል ለክብርሽ ዜማ
የመማፀኛ የድል ከተማ
ሞልቶ ይፈሳል ፀጋ ምልጃሽ
ክብራችን በዝቷል ስናከብርሽ (2x)
አዝ...
መልዐክ ነገረን ታላቁን ነገር
እንደምትወልጂው ያለ ወንድ ዘር
ጌታ በልቡ ስለሳለሽ
ይህ ሁሉ ፍጥረት ብፅይት አለሽ (2x)
አዝ...
ፍቅር ነውና ዓላማው በእኛ
የእግዚአብሔር አብ ልጅ ታማኙ እረኛ
በጎቹን ሊያድን ሲገለጥ በዓለም
ሐረግ የሆነው እንደ አንቺ የለም (2x)'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'd4aa6de9-1b14-4c80-a13d-fb6c5ff6214f'::uuid, 'kesit-demena', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tv-bealti-xelot ("ዕፀሳቤቕ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3663b55e-0e95-4c07-9133-ea3b5551e24b'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Adey Maryam bealti ts’elot
Nisan wedan dew enda belet (2)
Adey Maryam (bealti ts’elotye) (2)
Nisan wedan dew enda belet eye

VERSE 1
Awgihata meret (2)
Tesfa tesewiru meret enkmesi
Mealtat halifu nisgay kesasi
Beta ayne menfes wezbi amaedya

CHORUS
Adey Maryam bealti ts’elot
Nisan wedan dew enda belet (2)
Adey Maryam (bealti ts’elotye) (2)
Nisan wedan dew enda belet eye

VERSE 2
Qoyma sile kulu sile zeyfleya
Teselenqo lomi nilbey keawr
Zewde wiqabu ennadefa mihir
Keysageb asgiu enatemets’ekyo

CHORUS
Adey Maryam bealti ts’elot
Nisan wedan dew enda belet (2)
Adey Maryam (bealti ts’elotye) (2)
Nisan wedan dew enda belet eye

VERSE 3
Dingil ade t’beb t’bebki habyo
Fiqri ahwat ahat nay selam gubae
Zimare miemenan rihuq zitesema
Hasisu keyterf natebahle aye

CHORUS
Adey Maryam bealti ts’elot
Nisan wedan dew enda belet (2)
Adey Maryam (bealti ts’elotye) (2)
Nisan wedan dew enda belet eye

VERSE 4
Mahlet nay welesa dine keywedeye

CHORUS
Adey Maryam bealti ts’elot
Nisan wedan dew enda belet (2)
Adey Maryam (bealti ts’elotye) (2)
Nisan wedan dew enda belet eye'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ

VERSE 1
ኣውጊሓታ መሬት(2)
ተስፋ ተሰዊሩ መሬት እንክመሲ
መዓልታት ሓሊፉ ንስጋይ ከሳሲ
በታ ዓይነ መንፈስ ወዝቢ ኣማዕድያ

CHORUS
ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ

VERSE 2
ቆይማ ስለ ኩሉ ስለ ዘይፍለያ
ተሰሌንቆ ሎሚ ንልበይ ከዐውር
ዘውደ ውቃብኡ እንናደፍአ ሚሒር
ከይሳገብ ኣስጊኡ እናተመጸክዮ

CHORUS
ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ

VERSE 3
ድንግል ኣደ ጥበብ ጥበብኪ ሃብዮ
ፍቅሪ ኣሕዋት ኣሓት ናይ ሰላም ጉባኤ
ዝማሬ ምእመናን ርሑቅ ዝተሰምዐ
ሃሲሱ ከይተርፍ ናተባህለ ኣየ

CHORUS
ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ

VERSE 4
ማህለት ናይ ወለሳ ድነ ከይወደየ

CHORUS
ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ

VERSE 1
ኣውጊሓታ መሬት(2)
ተስፋ ተሰዊሩ መሬት እንክመሲ
መዓልታት ሓሊፉ ንስጋይ ከሳሲ
በታ ዓይነ መንፈስ ወዝቢ ኣማዕድያ

CHORUS
ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ

VERSE 2
ቆይማ ስለ ኩሉ ስለ ዘይፍለያ
ተሰሌንቆ ሎሚ ንልበይ ከዐውር
ዘውደ ውቃብኡ እንናደፍአ ሚሒር
ከይሳገብ ኣስጊኡ እናተመጸክዮ

CHORUS
ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ

VERSE 3
ድንግል ኣደ ጥበብ ጥበብኪ ሃብዮ
ፍቅሪ ኣሕዋት ኣሓት ናይ ሰላም ጉባኤ
ዝማሬ ምእመናን ርሑቅ ዝተሰምዐ
ሃሲሱ ከይተርፍ ናተባህለ ኣየ

CHORUS
ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ

VERSE 4
ማህለት ናይ ወለሳ ድነ ከይወደየ

CHORUS
ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ' THEN lyrics_amharic 
          ELSE 'CHORUS
ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ

VERSE 1
ኣውጊሓታ መሬት(2)
ተስፋ ተሰዊሩ መሬት እንክመሲ
መዓልታት ሓሊፉ ንስጋይ ከሳሲ
በታ ዓይነ መንፈስ ወዝቢ ኣማዕድያ

CHORUS
ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ

VERSE 2
ቆይማ ስለ ኩሉ ስለ ዘይፍለያ
ተሰሌንቆ ሎሚ ንልበይ ከዐውር
ዘውደ ውቃብኡ እንናደፍአ ሚሒር
ከይሳገብ ኣስጊኡ እናተመጸክዮ

CHORUS
ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ

VERSE 3
ድንግል ኣደ ጥበብ ጥበብኪ ሃብዮ
ፍቅሪ ኣሕዋት ኣሓት ናይ ሰላም ጉባኤ
ዝማሬ ምእመናን ርሑቅ ዝተሰምዐ
ሃሲሱ ከይተርፍ ናተባህለ ኣየ

CHORUS
ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ

VERSE 4
ማህለት ናይ ወለሳ ድነ ከይወደየ

CHORUS
ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ' 
        END,
        lyrics_transliteration = 'CHORUS
Adey Maryam bealti ts’elot
Nisan wedan dew enda belet (2)
Adey Maryam (bealti ts’elotye) (2)
Nisan wedan dew enda belet eye

VERSE 1
Awgihata meret (2)
Tesfa tesewiru meret enkmesi
Mealtat halifu nisgay kesasi
Beta ayne menfes wezbi amaedya

CHORUS
Adey Maryam bealti ts’elot
Nisan wedan dew enda belet (2)
Adey Maryam (bealti ts’elotye) (2)
Nisan wedan dew enda belet eye

VERSE 2
Qoyma sile kulu sile zeyfleya
Teselenqo lomi nilbey keawr
Zewde wiqabu ennadefa mihir
Keysageb asgiu enatemets’ekyo

CHORUS
Adey Maryam bealti ts’elot
Nisan wedan dew enda belet (2)
Adey Maryam (bealti ts’elotye) (2)
Nisan wedan dew enda belet eye

VERSE 3
Dingil ade t’beb t’bebki habyo
Fiqri ahwat ahat nay selam gubae
Zimare miemenan rihuq zitesema
Hasisu keyterf natebahle aye

CHORUS
Adey Maryam bealti ts’elot
Nisan wedan dew enda belet (2)
Adey Maryam (bealti ts’elotye) (2)
Nisan wedan dew enda belet eye

VERSE 4
Mahlet nay welesa dine keywedeye

CHORUS
Adey Maryam bealti ts’elot
Nisan wedan dew enda belet (2)
Adey Maryam (bealti ts’elotye) (2)
Nisan wedan dew enda belet eye',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3663b55e-0e95-4c07-9133-ea3b5551e24b'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ

VERSE 1
ኣውጊሓታ መሬት(2)
ተስፋ ተሰዊሩ መሬት እንክመሲ
መዓልታት ሓሊፉ ንስጋይ ከሳሲ
በታ ዓይነ መንፈስ ወዝቢ ኣማዕድያ

CHORUS
ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ

VERSE 2
ቆይማ ስለ ኩሉ ስለ ዘይፍለያ
ተሰሌንቆ ሎሚ ንልበይ ከዐውር
ዘውደ ውቃብኡ እንናደፍአ ሚሒር
ከይሳገብ ኣስጊኡ እናተመጸክዮ

CHORUS
ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ

VERSE 3
ድንግል ኣደ ጥበብ ጥበብኪ ሃብዮ
ፍቅሪ ኣሕዋት ኣሓት ናይ ሰላም ጉባኤ
ዝማሬ ምእመናን ርሑቅ ዝተሰምዐ
ሃሲሱ ከይተርፍ ናተባህለ ኣየ

CHORUS
ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ

VERSE 4
ማህለት ናይ ወለሳ ድነ ከይወደየ

CHORUS
ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ኣደይ ማርያም በዓልቲ ጸሎት
ንሳን ወዳን ደው እንዳ በለት (2)
ኣደይ ማርያም (በዓልቲ ጸሎትየ)(2)
ንሳን ወዳን ደው እንዳ በለት እየ
ኣውጊሓታ መሬት(2)
ተስፋ ተሰዊሩ መሬት እንክመሲ
መዓልታት ሓሊፉ ንስጋይ ከሳሲ
በታ ዓይነ መንፈስ ወዝቢ ኣማዕድያ
ቆይማ ስለ ኩሉ ስለ ዘይፍለያ
ተሰሌንቆ ሎሚ ንልበይ ከዐውር
ዘውደ ውቃብኡ እንናደፍአ ሚሒር
ከይሳገብ ኣስጊኡ እናተመጸክዮ
ድንግል ኣደ ጥበብ ጥበብኪ ሃብዮ
ፍቅሪ ኣሕዋት ኣሓት ናይ ሰላም ጉባኤ
ዝማሬ ምእመናን ርሑቅ ዝተሰምዐ
ሃሲሱ ከይተርፍ ናተባህለ ኣየ
ማህለት ናይ ወለሳ ድነ ከይወደየ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3663b55e-0e95-4c07-9133-ea3b5551e24b'::uuid, 'tv-bealti-xelot', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- gerkaley-eka-emo-bereket-tikue-hermela-yhsho-rahwa-tekeste ("ጌርካለይ ኢኻ# ዘመርቲ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '44fee195-4c99-4410-bcf5-d31bbfc35510'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Gerkaley iኻ mo bimhretka
Ell enabelku kemesgneka
Nizelealem amanuel
Kigzaka’ye Medhanealem (2)

VERSE 1
Kulu ts’elmituni ts’edfi kiኸbeni
Nay shgr mahleኻ haliኹ hizuni
Redai zeybley kimesleni beyney
Desta melieኻyo zihazene libey

CHORUS
Gerkaley iኻ mo bimhretka
Ell enabelku kemesgneka
Nizelealem amanuel
Kigzaka’ye Medhanealem (2)

VERSE 2
Amlaኸy gulbetey memekhi hayley
Ts’elai mehferi walta nay emnetey
Kab zeleni kulu niaኻ amine
Kemzeytgedfeni efelt’ eye ane

CHORUS
Gerkaley iኻ mo bimhretka
Ell enabelku kemesgneka
Nizelealem amanuel
Kigzaka’ye Medhanealem (2)

VERSE 3
Biwhud nibzuh etmgb goyta
Ente seanku’kwa zimelso wireta
Biቐtri bileyti biኹlu etebrh
Menkr nibahriኻ dinqi natka sirah

CHORUS
Gerkaley iኻ mo bimhretka
Ell enabelku kemesgneka
Nizelealem amanuel
Kigzaka’ye Medhanealem (2)

VERSE 4
Amlaኸy niaኻ yigbae misgana
Neza miskin betey bereketa iኻ
Diኻ eye aybln habtey nisኻ iኻ
Genay melieኻyo kemzeygodl gerka

CHORUS
Gerkaley iኻ mo bimhretka
Ell enabelku kemesgneka
Nizelealem amanuel
Kigzaka’ye Medhanealem (2)'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)

VERSE 1
ኩሉ ፀልሚቱኒ ፀድፊ ክኸበኒ
ናይ ሽግር ማሕለኻ ሓሊኹ ሒዙኒ
ረዳኢ ዘይብለይ ክመስለኒ በይነይ
ደስታ መሊእኻዮ ዝሓዘነ ልበይ

CHORUS
ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)

VERSE 2
ኣምላኸይ ጉልበተይ መመክሒ ሓይለይ
ፀላኢ መሕፈሪ ዋልታ ናይ እምነተይ
ካብ ዘለኒ ኩሉ ንዓኻ ኣሚነ
ከምዘይትገድፈኒ እፈልጥ እየ ኣነ

CHORUS
ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)

VERSE 3
ብውሑድ ንብዙሕ እትምግብ ጎይታ
እንተ ሰኣንኩ’ኳ ዝመልሶ ውሬታ
ብቐትሪ ብለይቲ ብኹሉ እተብርህ
መንክር ንባህሪኻ ድንቂ ናትካ ስራሕ

CHORUS
ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)

VERSE 4
ኣምላኸይ ንዓኻ ይግባእ ምስጋና
ነዛ ምስኪን ቤተይ በረከታ ኢኻ
ድኻ እየ ኣይብልን ሃብተይ ንስኻ ኢኻ
ገንአይ መሊእኻዮ ከምዘይጎድል ጌርካ

CHORUS
ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)

VERSE 1
ኩሉ ፀልሚቱኒ ፀድፊ ክኸበኒ
ናይ ሽግር ማሕለኻ ሓሊኹ ሒዙኒ
ረዳኢ ዘይብለይ ክመስለኒ በይነይ
ደስታ መሊእኻዮ ዝሓዘነ ልበይ

CHORUS
ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)

VERSE 2
ኣምላኸይ ጉልበተይ መመክሒ ሓይለይ
ፀላኢ መሕፈሪ ዋልታ ናይ እምነተይ
ካብ ዘለኒ ኩሉ ንዓኻ ኣሚነ
ከምዘይትገድፈኒ እፈልጥ እየ ኣነ

CHORUS
ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)

VERSE 3
ብውሑድ ንብዙሕ እትምግብ ጎይታ
እንተ ሰኣንኩ’ኳ ዝመልሶ ውሬታ
ብቐትሪ ብለይቲ ብኹሉ እተብርህ
መንክር ንባህሪኻ ድንቂ ናትካ ስራሕ

CHORUS
ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)

VERSE 4
ኣምላኸይ ንዓኻ ይግባእ ምስጋና
ነዛ ምስኪን ቤተይ በረከታ ኢኻ
ድኻ እየ ኣይብልን ሃብተይ ንስኻ ኢኻ
ገንአይ መሊእኻዮ ከምዘይጎድል ጌርካ

CHORUS
ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)' THEN lyrics_amharic 
          ELSE 'CHORUS
ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)

VERSE 1
ኩሉ ፀልሚቱኒ ፀድፊ ክኸበኒ
ናይ ሽግር ማሕለኻ ሓሊኹ ሒዙኒ
ረዳኢ ዘይብለይ ክመስለኒ በይነይ
ደስታ መሊእኻዮ ዝሓዘነ ልበይ

CHORUS
ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)

VERSE 2
ኣምላኸይ ጉልበተይ መመክሒ ሓይለይ
ፀላኢ መሕፈሪ ዋልታ ናይ እምነተይ
ካብ ዘለኒ ኩሉ ንዓኻ ኣሚነ
ከምዘይትገድፈኒ እፈልጥ እየ ኣነ

CHORUS
ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)

VERSE 3
ብውሑድ ንብዙሕ እትምግብ ጎይታ
እንተ ሰኣንኩ’ኳ ዝመልሶ ውሬታ
ብቐትሪ ብለይቲ ብኹሉ እተብርህ
መንክር ንባህሪኻ ድንቂ ናትካ ስራሕ

CHORUS
ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)

VERSE 4
ኣምላኸይ ንዓኻ ይግባእ ምስጋና
ነዛ ምስኪን ቤተይ በረከታ ኢኻ
ድኻ እየ ኣይብልን ሃብተይ ንስኻ ኢኻ
ገንአይ መሊእኻዮ ከምዘይጎድል ጌርካ

CHORUS
ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)' 
        END,
        lyrics_transliteration = 'CHORUS
Gerkaley iኻ mo bimhretka
Ell enabelku kemesgneka
Nizelealem amanuel
Kigzaka’ye Medhanealem (2)

VERSE 1
Kulu ts’elmituni ts’edfi kiኸbeni
Nay shgr mahleኻ haliኹ hizuni
Redai zeybley kimesleni beyney
Desta melieኻyo zihazene libey

CHORUS
Gerkaley iኻ mo bimhretka
Ell enabelku kemesgneka
Nizelealem amanuel
Kigzaka’ye Medhanealem (2)

VERSE 2
Amlaኸy gulbetey memekhi hayley
Ts’elai mehferi walta nay emnetey
Kab zeleni kulu niaኻ amine
Kemzeytgedfeni efelt’ eye ane

CHORUS
Gerkaley iኻ mo bimhretka
Ell enabelku kemesgneka
Nizelealem amanuel
Kigzaka’ye Medhanealem (2)

VERSE 3
Biwhud nibzuh etmgb goyta
Ente seanku’kwa zimelso wireta
Biቐtri bileyti biኹlu etebrh
Menkr nibahriኻ dinqi natka sirah

CHORUS
Gerkaley iኻ mo bimhretka
Ell enabelku kemesgneka
Nizelealem amanuel
Kigzaka’ye Medhanealem (2)

VERSE 4
Amlaኸy niaኻ yigbae misgana
Neza miskin betey bereketa iኻ
Diኻ eye aybln habtey nisኻ iኻ
Genay melieኻyo kemzeygodl gerka

CHORUS
Gerkaley iኻ mo bimhretka
Ell enabelku kemesgneka
Nizelealem amanuel
Kigzaka’ye Medhanealem (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '44fee195-4c99-4410-bcf5-d31bbfc35510'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)

VERSE 1
ኩሉ ፀልሚቱኒ ፀድፊ ክኸበኒ
ናይ ሽግር ማሕለኻ ሓሊኹ ሒዙኒ
ረዳኢ ዘይብለይ ክመስለኒ በይነይ
ደስታ መሊእኻዮ ዝሓዘነ ልበይ

CHORUS
ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)

VERSE 2
ኣምላኸይ ጉልበተይ መመክሒ ሓይለይ
ፀላኢ መሕፈሪ ዋልታ ናይ እምነተይ
ካብ ዘለኒ ኩሉ ንዓኻ ኣሚነ
ከምዘይትገድፈኒ እፈልጥ እየ ኣነ

CHORUS
ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)

VERSE 3
ብውሑድ ንብዙሕ እትምግብ ጎይታ
እንተ ሰኣንኩ’ኳ ዝመልሶ ውሬታ
ብቐትሪ ብለይቲ ብኹሉ እተብርህ
መንክር ንባህሪኻ ድንቂ ናትካ ስራሕ

CHORUS
ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)

VERSE 4
ኣምላኸይ ንዓኻ ይግባእ ምስጋና
ነዛ ምስኪን ቤተይ በረከታ ኢኻ
ድኻ እየ ኣይብልን ሃብተይ ንስኻ ኢኻ
ገንአይ መሊእኻዮ ከምዘይጎድል ጌርካ

CHORUS
ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ጌርካለይ ኢኻ ሞ ብምሕረትካ
ዕልል እናበልኩ ከመስግነካ
ንዘለዓለም ኣማኑኤል
ክግዝኣካ’የ መድኃኔዓለም (2)
ኩሉ ፀልሚቱኒ ፀድፊ ክኸበኒ
ናይ ሽግር ማሕለኻ ሓሊኹ ሒዙኒ
ረዳኢ ዘይብለይ ክመስለኒ በይነይ
ደስታ መሊእኻዮ ዝሓዘነ ልበይ
ኣምላኸይ ጉልበተይ መመክሒ ሓይለይ
ፀላኢ መሕፈሪ ዋልታ ናይ እምነተይ
ካብ ዘለኒ ኩሉ ንዓኻ ኣሚነ
ከምዘይትገድፈኒ እፈልጥ እየ ኣነ
ብውሑድ ንብዙሕ እትምግብ ጎይታ
እንተ ሰኣንኩ’ኳ ዝመልሶ ውሬታ
ብቐትሪ ብለይቲ ብኹሉ እተብርህ
መንክር ንባህሪኻ ድንቂ ናትካ ስራሕ
ኣምላኸይ ንዓኻ ይግባእ ምስጋና
ነዛ ምስኪን ቤተይ በረከታ ኢኻ
ድኻ እየ ኣይብልን ሃብተይ ንስኻ ኢኻ
ገንአይ መሊእኻዮ ከምዘይጎድል ጌርካ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '44fee195-4c99-4410-bcf5-d31bbfc35510'::uuid, 'gerkaley-eka-emo-bereket-tikue-hermela-yhsho-rahwa-tekeste', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- geta-tenesitwal ("ጌታ ተነስቷል")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3e08e679-934d-4cf3-8909-cae05e8b182c'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Geta tenestwal ell ell belu
Amlak tenestwal yemsrach belu
Musna meqabr behaylu at’fto
Hulachn ayenew Kristos tenesto

VERSE 1
Adamn lemadan qalkidan gebtolet
Zemenun t’ebqo kasa likefllet
Kesemayat werdo yeteseqelew
Motn bemot shro yiኸw ayenew

CHORUS
Geta tenestwal ell ell belu
Amlak tenestwal yemsrach belu
Musna meqabr behaylu at’fto
Hulachn ayenew Kristos tenesto

VERSE 2
CHORUS
Deqe mezamurtu ejgun tech’enqew
Begetachew memot behezen temetew
Betezega dejaf tesebsbew sale

CHORUS
Geta tenestwal ell ell belu
Amlak tenestwal yemsrach belu
Musna meqabr behaylu at’fto
Hulachn ayenew Kristos tenesto

VERSE 3
Ejochun zergto selam leenante ale
CHORUS
Maryam megdelawit eyegesegesech
Belelit tenesta wede amlakwa hedech

CHORUS
Geta tenestwal ell ell belu
Amlak tenestwal yemsrach belu
Musna meqabr behaylu at’fto
Hulachn ayenew Kristos tenesto

VERSE 4
Ayhud angelatew yeseqelut Geta
Tenesto aggntaw temelach bedesta

CHORUS
Geta tenestwal ell ell belu
Amlak tenestwal yemsrach belu
Musna meqabr behaylu at’fto
Hulachn ayenew Kristos tenesto'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

VERSE 1
አዳምን ለማዳን ቃልኪዳን ገብቶለት
ዘመኑን ጠብቆ ካሳ ሊከፍልለት
ከሰማያት ወርዶ የተሰቀለው
ሞትን በሞት ሽሮ ይኸው አየነው

CHORUS
ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

VERSE 2
አዝ
ደቀ መዛሙርቱ እጅጉን ተጨንቀው
በጌታቸው መሞት በኀዘን ተመተው
በተዘጋ ደጃፍ ተሰብስበው ሳለ

CHORUS
ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

VERSE 3
እጆቹን ዘርግቶ ሰላም ለእናንተ አለ
አዝ
ማርያም መግደላዊት እየገሰገሰች
በለሊት ተነስታ ወደ አምላኳ ሄደች

CHORUS
ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

VERSE 4
አይሁድ አንገላተው የሰቀሉት ጌታ
ተነስቶ አግኝታው ተመላች በደስታ

CHORUS
ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

VERSE 1
አዳምን ለማዳን ቃልኪዳን ገብቶለት
ዘመኑን ጠብቆ ካሳ ሊከፍልለት
ከሰማያት ወርዶ የተሰቀለው
ሞትን በሞት ሽሮ ይኸው አየነው

CHORUS
ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

VERSE 2
አዝ
ደቀ መዛሙርቱ እጅጉን ተጨንቀው
በጌታቸው መሞት በኀዘን ተመተው
በተዘጋ ደጃፍ ተሰብስበው ሳለ

CHORUS
ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

VERSE 3
እጆቹን ዘርግቶ ሰላም ለእናንተ አለ
አዝ
ማርያም መግደላዊት እየገሰገሰች
በለሊት ተነስታ ወደ አምላኳ ሄደች

CHORUS
ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

VERSE 4
አይሁድ አንገላተው የሰቀሉት ጌታ
ተነስቶ አግኝታው ተመላች በደስታ

CHORUS
ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ' THEN lyrics_amharic 
          ELSE 'CHORUS
ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

VERSE 1
አዳምን ለማዳን ቃልኪዳን ገብቶለት
ዘመኑን ጠብቆ ካሳ ሊከፍልለት
ከሰማያት ወርዶ የተሰቀለው
ሞትን በሞት ሽሮ ይኸው አየነው

CHORUS
ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

VERSE 2
አዝ
ደቀ መዛሙርቱ እጅጉን ተጨንቀው
በጌታቸው መሞት በኀዘን ተመተው
በተዘጋ ደጃፍ ተሰብስበው ሳለ

CHORUS
ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

VERSE 3
እጆቹን ዘርግቶ ሰላም ለእናንተ አለ
አዝ
ማርያም መግደላዊት እየገሰገሰች
በለሊት ተነስታ ወደ አምላኳ ሄደች

CHORUS
ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

VERSE 4
አይሁድ አንገላተው የሰቀሉት ጌታ
ተነስቶ አግኝታው ተመላች በደስታ

CHORUS
ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ' 
        END,
        lyrics_transliteration = 'CHORUS
Geta tenestwal ell ell belu
Amlak tenestwal yemsrach belu
Musna meqabr behaylu at’fto
Hulachn ayenew Kristos tenesto

VERSE 1
Adamn lemadan qalkidan gebtolet
Zemenun t’ebqo kasa likefllet
Kesemayat werdo yeteseqelew
Motn bemot shro yiኸw ayenew

CHORUS
Geta tenestwal ell ell belu
Amlak tenestwal yemsrach belu
Musna meqabr behaylu at’fto
Hulachn ayenew Kristos tenesto

VERSE 2
CHORUS
Deqe mezamurtu ejgun tech’enqew
Begetachew memot behezen temetew
Betezega dejaf tesebsbew sale

CHORUS
Geta tenestwal ell ell belu
Amlak tenestwal yemsrach belu
Musna meqabr behaylu at’fto
Hulachn ayenew Kristos tenesto

VERSE 3
Ejochun zergto selam leenante ale
CHORUS
Maryam megdelawit eyegesegesech
Belelit tenesta wede amlakwa hedech

CHORUS
Geta tenestwal ell ell belu
Amlak tenestwal yemsrach belu
Musna meqabr behaylu at’fto
Hulachn ayenew Kristos tenesto

VERSE 4
Ayhud angelatew yeseqelut Geta
Tenesto aggntaw temelach bedesta

CHORUS
Geta tenestwal ell ell belu
Amlak tenestwal yemsrach belu
Musna meqabr behaylu at’fto
Hulachn ayenew Kristos tenesto',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3e08e679-934d-4cf3-8909-cae05e8b182c'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

VERSE 1
አዳምን ለማዳን ቃልኪዳን ገብቶለት
ዘመኑን ጠብቆ ካሳ ሊከፍልለት
ከሰማያት ወርዶ የተሰቀለው
ሞትን በሞት ሽሮ ይኸው አየነው

CHORUS
ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

VERSE 2
አዝ
ደቀ መዛሙርቱ እጅጉን ተጨንቀው
በጌታቸው መሞት በኀዘን ተመተው
በተዘጋ ደጃፍ ተሰብስበው ሳለ

CHORUS
ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

VERSE 3
እጆቹን ዘርግቶ ሰላም ለእናንተ አለ
አዝ
ማርያም መግደላዊት እየገሰገሰች
በለሊት ተነስታ ወደ አምላኳ ሄደች

CHORUS
ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ

VERSE 4
አይሁድ አንገላተው የሰቀሉት ጌታ
ተነስቶ አግኝታው ተመላች በደስታ

CHORUS
ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ጌታ ተነስቷል እልል እልል በሉ
አምላክ ተነስቷል የምስራች በሉ
ሙስና መቃብር በኃይሉ አጥፍቶ
ሁላችን አየነው ክርስቶስ ተነስቶ
አዳምን ለማዳን ቃልኪዳን ገብቶለት
ዘመኑን ጠብቆ ካሳ ሊከፍልለት
ከሰማያት ወርዶ የተሰቀለው
ሞትን በሞት ሽሮ ይኸው አየነው
አዝ= = = = =
ደቀ መዛሙርቱ እጅጉን ተጨንቀው
በጌታቸው መሞት በኀዘን ተመተው
በተዘጋ ደጃፍ ተሰብስበው ሳለ
እጆቹን ዘርግቶ ሰላም ለእናንተ አለ
አዝ= = = = =
ማርያም መግደላዊት እየገሰገሰች
በለሊት ተነስታ ወደ አምላኳ ሄደች
አይሁድ አንገላተው የሰቀሉት ጌታ
ተነስቶ አግኝታው ተመላች በደስታ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3e08e679-934d-4cf3-8909-cae05e8b182c'::uuid, 'geta-tenesitwal', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-church ("ሕፃናት ናባይ ይምጽኡ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7ed24cd0-68cb-424b-a89f-f5e8910e843d'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hits’anat nabay yimts’u hidewom
Yibl alo goyta aytanqfwom
Nab betu kinkeyd bereኸt rediat niኽnqbel
Keymalaana nay hat’iat mael

VERSE 1
Wildo enkelena ets’uq keynbele
Ts’abuu setina biemnet kints’ets’e
Niu zibelena Kristos yu baelu
Tihtna lebisna siratu kinhlu

CHORUS
Hits’anat nabay yimts’u hidewom
Yibl alo goyta aytanqfwom
Nab betu kinkeyd bereኸt rediat niኽnqbel
Keymalaana nay hat’iat mael

VERSE 2
Aruyuna weledi tiqnue mengedi
Biu kinmelales kindhn kab firdi
Fetena diyablos gena keyjemere
Tigerhi libna bitebit keyterere

CHORUS
Hits’anat nabay yimts’u hidewom
Yibl alo goyta aytanqfwom
Nab betu kinkeyd bereኸt rediat niኽnqbel
Keymalaana nay hat’iat mael

VERSE 3
Entetemelalesna nafti Kidus sifra
Nay nefsi ereftyu kab nay alem mekera
Qalatu kinseme kinwds amlaኽna
Niaኹm kibret eyu ataababyana

CHORUS
Hits’anat nabay yimts’u hidewom
Yibl alo goyta aytanqfwom
Nab betu kinkeyd bereኸt rediat niኽnqbel
Keymalaana nay hat’iat mael

VERSE 4
Zihafere yelen abu zitets’ega
Kem niay hits’an qirqos adiu zetba
Kem Kidus abanob niemnet kinqale
Aኽlil teselimna mengstu kinwers

CHORUS
Hits’anat nabay yimts’u hidewom
Yibl alo goyta aytanqfwom
Nab betu kinkeyd bereኸt rediat niኽnqbel
Keymalaana nay hat’iat mael'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል

VERSE 1
ውልዶ እንከለና ዕጹቅ ከይንበልዕ
ጻቡኡ ሰቲና ብእምነት ክንጸጽዕ
ንዑ ዝበለና ክርስቶስ ዩ ባዕሉ
ትሕትና ለቢስና ስርዓቱ ክንሕሉ

CHORUS
ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል

VERSE 2
ኣርኡዩና ወለዲ ትቅኑዕ መንገዲ
ብኡ ክንመላለስ ክንድሕን ካብ ፍርዲ
ፈተና ድያብሎስ ጌና ከይጀመረ
ትገርሂ ልብና ብትዕቢት ከይተረረ

CHORUS
ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል

VERSE 3
እንተተመላለስና ናፍቲ ቅዱስ ስፍራ
ናይ ነፍሲ ዕረፍትዩ ካብ ናይ ዓለም መከራ
ቃላቱ ክንሰምዕ ክንውድስ ኣምላኽና
ንዓኹም ክብረት እዩ ኣታዓባብያና

CHORUS
ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል

VERSE 4
ዝሓፈረ የለን ኣብኡ ዝተጸግዐ
ከም ንኣይ ህጻን ቂርቆስ ኣዲኡ ዘትብዐ
ከም ቅዱስ ኣባኖብ ንእምነት ክንቃለ
ኣኽሊል ተሰሊምና መንግስቱ ክንወርስ

CHORUS
ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል

VERSE 1
ውልዶ እንከለና ዕጹቅ ከይንበልዕ
ጻቡኡ ሰቲና ብእምነት ክንጸጽዕ
ንዑ ዝበለና ክርስቶስ ዩ ባዕሉ
ትሕትና ለቢስና ስርዓቱ ክንሕሉ

CHORUS
ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል

VERSE 2
ኣርኡዩና ወለዲ ትቅኑዕ መንገዲ
ብኡ ክንመላለስ ክንድሕን ካብ ፍርዲ
ፈተና ድያብሎስ ጌና ከይጀመረ
ትገርሂ ልብና ብትዕቢት ከይተረረ

CHORUS
ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል

VERSE 3
እንተተመላለስና ናፍቲ ቅዱስ ስፍራ
ናይ ነፍሲ ዕረፍትዩ ካብ ናይ ዓለም መከራ
ቃላቱ ክንሰምዕ ክንውድስ ኣምላኽና
ንዓኹም ክብረት እዩ ኣታዓባብያና

CHORUS
ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል

VERSE 4
ዝሓፈረ የለን ኣብኡ ዝተጸግዐ
ከም ንኣይ ህጻን ቂርቆስ ኣዲኡ ዘትብዐ
ከም ቅዱስ ኣባኖብ ንእምነት ክንቃለ
ኣኽሊል ተሰሊምና መንግስቱ ክንወርስ

CHORUS
ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል' THEN lyrics_amharic 
          ELSE 'CHORUS
ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል

VERSE 1
ውልዶ እንከለና ዕጹቅ ከይንበልዕ
ጻቡኡ ሰቲና ብእምነት ክንጸጽዕ
ንዑ ዝበለና ክርስቶስ ዩ ባዕሉ
ትሕትና ለቢስና ስርዓቱ ክንሕሉ

CHORUS
ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል

VERSE 2
ኣርኡዩና ወለዲ ትቅኑዕ መንገዲ
ብኡ ክንመላለስ ክንድሕን ካብ ፍርዲ
ፈተና ድያብሎስ ጌና ከይጀመረ
ትገርሂ ልብና ብትዕቢት ከይተረረ

CHORUS
ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል

VERSE 3
እንተተመላለስና ናፍቲ ቅዱስ ስፍራ
ናይ ነፍሲ ዕረፍትዩ ካብ ናይ ዓለም መከራ
ቃላቱ ክንሰምዕ ክንውድስ ኣምላኽና
ንዓኹም ክብረት እዩ ኣታዓባብያና

CHORUS
ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል

VERSE 4
ዝሓፈረ የለን ኣብኡ ዝተጸግዐ
ከም ንኣይ ህጻን ቂርቆስ ኣዲኡ ዘትብዐ
ከም ቅዱስ ኣባኖብ ንእምነት ክንቃለ
ኣኽሊል ተሰሊምና መንግስቱ ክንወርስ

CHORUS
ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል' 
        END,
        lyrics_transliteration = 'CHORUS
Hits’anat nabay yimts’u hidewom
Yibl alo goyta aytanqfwom
Nab betu kinkeyd bereኸt rediat niኽnqbel
Keymalaana nay hat’iat mael

VERSE 1
Wildo enkelena ets’uq keynbele
Ts’abuu setina biemnet kints’ets’e
Niu zibelena Kristos yu baelu
Tihtna lebisna siratu kinhlu

CHORUS
Hits’anat nabay yimts’u hidewom
Yibl alo goyta aytanqfwom
Nab betu kinkeyd bereኸt rediat niኽnqbel
Keymalaana nay hat’iat mael

VERSE 2
Aruyuna weledi tiqnue mengedi
Biu kinmelales kindhn kab firdi
Fetena diyablos gena keyjemere
Tigerhi libna bitebit keyterere

CHORUS
Hits’anat nabay yimts’u hidewom
Yibl alo goyta aytanqfwom
Nab betu kinkeyd bereኸt rediat niኽnqbel
Keymalaana nay hat’iat mael

VERSE 3
Entetemelalesna nafti Kidus sifra
Nay nefsi ereftyu kab nay alem mekera
Qalatu kinseme kinwds amlaኽna
Niaኹm kibret eyu ataababyana

CHORUS
Hits’anat nabay yimts’u hidewom
Yibl alo goyta aytanqfwom
Nab betu kinkeyd bereኸt rediat niኽnqbel
Keymalaana nay hat’iat mael

VERSE 4
Zihafere yelen abu zitets’ega
Kem niay hits’an qirqos adiu zetba
Kem Kidus abanob niemnet kinqale
Aኽlil teselimna mengstu kinwers

CHORUS
Hits’anat nabay yimts’u hidewom
Yibl alo goyta aytanqfwom
Nab betu kinkeyd bereኸt rediat niኽnqbel
Keymalaana nay hat’iat mael',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7ed24cd0-68cb-424b-a89f-f5e8910e843d'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል

VERSE 1
ውልዶ እንከለና ዕጹቅ ከይንበልዕ
ጻቡኡ ሰቲና ብእምነት ክንጸጽዕ
ንዑ ዝበለና ክርስቶስ ዩ ባዕሉ
ትሕትና ለቢስና ስርዓቱ ክንሕሉ

CHORUS
ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል

VERSE 2
ኣርኡዩና ወለዲ ትቅኑዕ መንገዲ
ብኡ ክንመላለስ ክንድሕን ካብ ፍርዲ
ፈተና ድያብሎስ ጌና ከይጀመረ
ትገርሂ ልብና ብትዕቢት ከይተረረ

CHORUS
ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል

VERSE 3
እንተተመላለስና ናፍቲ ቅዱስ ስፍራ
ናይ ነፍሲ ዕረፍትዩ ካብ ናይ ዓለም መከራ
ቃላቱ ክንሰምዕ ክንውድስ ኣምላኽና
ንዓኹም ክብረት እዩ ኣታዓባብያና

CHORUS
ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል

VERSE 4
ዝሓፈረ የለን ኣብኡ ዝተጸግዐ
ከም ንኣይ ህጻን ቂርቆስ ኣዲኡ ዘትብዐ
ከም ቅዱስ ኣባኖብ ንእምነት ክንቃለ
ኣኽሊል ተሰሊምና መንግስቱ ክንወርስ

CHORUS
ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ህጻናት ናባይ ይምጽኡ ሕደዎም
ይብል ኣሎ ጎይታ ኣይትዓንቅፍዎም
ናብ ቤቱ ክንከይድ በረኸት ረዲአት ንኽንቅበል
ከይማላኣና ናይ ሓጢኣት ማዕል
ውልዶ እንከለና ዕጹቅ ከይንበልዕ
ጻቡኡ ሰቲና ብእምነት ክንጸጽዕ
ንዑ ዝበለና ክርስቶስ ዩ ባዕሉ
ትሕትና ለቢስና ስርዓቱ ክንሕሉ
ኣርኡዩና ወለዲ ትቅኑዕ መንገዲ
ብኡ ክንመላለስ ክንድሕን ካብ ፍርዲ
ፈተና ድያብሎስ ጌና ከይጀመረ
ትገርሂ ልብና ብትዕቢት ከይተረረ
እንተተመላለስና ናፍቲ ቅዱስ ስፍራ
ናይ ነፍሲ ዕረፍትዩ ካብ ናይ ዓለም መከራ
ቃላቱ ክንሰምዕ ክንውድስ ኣምላኽና
ንዓኹም ክብረት እዩ ኣታዓባብያና
ዝሓፈረ የለን ኣብኡ ዝተጸግዐ
ከም ንኣይ ህጻን ቂርቆስ ኣዲኡ ዘትብዐ
ከም ቅዱስ ኣባኖብ ንእምነት ክንቃለ
ኣኽሊል ተሰሊምና መንግስቱ ክንወርስ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7ed24cd0-68cb-424b-a89f-f5e8910e843d'::uuid, 'eritrean-orthodox-tewahdo-church', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- with-what-shall-i-please-you ("በምን ደስ ላሰኝህ")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9ba4ea8a-6fb1-4e10-a3c4-8d2ff133ae18'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bemn bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yante aydelem wey
Yefet’erkew ኹlu yante aydelem wey

VERSE 1
With what then shall I please You, O God my King
How then shall I please You Lord with anything
Does not the world and its fullness belong to You
Does not all that You created belong to You

CHORUS
Bemn bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yante aydelem wey
Yefet’erkew ኹlu yante aydelem wey

VERSE 2
Cherubim seraphim sing “Holy Trinity”
The angels in Rama worship in unity
O Wonderful Counselor, El Shaddai you’re divine (isaiah 9:6)
I’m but dust; what can i give you that’s truly mine

CHORUS
Bemn bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yante aydelem wey
Yefet’erkew ኹlu yante aydelem wey

VERSE 3
Since You, the Most High God, love a pure sacrifice,
What will I offer You that’s worthy in your eyes
Whether in the heavens or the depths of the sea
O Lord where is the place in which You would not be

CHORUS
Bemn bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yante aydelem wey
Yefet’erkew ኹlu yante aydelem wey

VERSE 4
Through the Litany’s prayers, Liturgy and hours,
You bestowed to us gifts through the Spirit’s powers
If we praise with these gifts, what have we really done
Overlook our boldness towards You O Holy One

CHORUS
Bemn bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yante aydelem wey
Yefet’erkew ኹlu yante aydelem wey

VERSE 5
What have I to boast of, whether my strength or wealth
Who besides You granted me wellbeing and health
In the time You gave me, through the years of my life,
Of all my possessions, which one is truly mine

CHORUS
Bemn bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yante aydelem wey
Yefet’erkew ኹlu yante aydelem wey

VERSE 6
Even of my body, which part is truly mine

CHORUS
Bemn bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yante aydelem wey
Yefet’erkew ኹlu yante aydelem wey'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 1
with what then shall I please You, O God my King
how then shall I please You Lord with anything
Does not the world and its fullness belong to You
Does not all that You created belong to You

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 2
cherubim seraphim sing “Holy Trinity”
The angels in Rama worship in unity
O Wonderful Counselor, El Shaddai you’re divine (isaiah 9:6)
i’m but dust; what can i give you that’s truly mine

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 3
Since You, the Most High God, love a pure sacrifice,
What will I offer You that’s worthy in your eyes
whether in the heavens or the depths of the sea
O Lord where is the place in which You would not be

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 4
Through the Litany’s prayers, Liturgy and hours,
You bestowed to us gifts through the Spirit’s powers
If we praise with these gifts, what have we really done
Overlook our boldness towards You O Holy One

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 5
what have I to boast of, whether my strength or wealth
Who besides You granted me wellbeing and health
In the time You gave me, through the years of my life,
Of all my possessions, which one is truly mine

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 6
Even of my body, which part is truly mine

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 1
with what then shall I please You, O God my King
how then shall I please You Lord with anything
Does not the world and its fullness belong to You
Does not all that You created belong to You

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 2
cherubim seraphim sing “Holy Trinity”
The angels in Rama worship in unity
O Wonderful Counselor, El Shaddai you’re divine (isaiah 9:6)
i’m but dust; what can i give you that’s truly mine

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 3
Since You, the Most High God, love a pure sacrifice,
What will I offer You that’s worthy in your eyes
whether in the heavens or the depths of the sea
O Lord where is the place in which You would not be

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 4
Through the Litany’s prayers, Liturgy and hours,
You bestowed to us gifts through the Spirit’s powers
If we praise with these gifts, what have we really done
Overlook our boldness towards You O Holy One

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 5
what have I to boast of, whether my strength or wealth
Who besides You granted me wellbeing and health
In the time You gave me, through the years of my life,
Of all my possessions, which one is truly mine

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 6
Even of my body, which part is truly mine

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ' THEN lyrics_amharic 
          ELSE 'CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 1
with what then shall I please You, O God my King
how then shall I please You Lord with anything
Does not the world and its fullness belong to You
Does not all that You created belong to You

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 2
cherubim seraphim sing “Holy Trinity”
The angels in Rama worship in unity
O Wonderful Counselor, El Shaddai you’re divine (isaiah 9:6)
i’m but dust; what can i give you that’s truly mine

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 3
Since You, the Most High God, love a pure sacrifice,
What will I offer You that’s worthy in your eyes
whether in the heavens or the depths of the sea
O Lord where is the place in which You would not be

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 4
Through the Litany’s prayers, Liturgy and hours,
You bestowed to us gifts through the Spirit’s powers
If we praise with these gifts, what have we really done
Overlook our boldness towards You O Holy One

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 5
what have I to boast of, whether my strength or wealth
Who besides You granted me wellbeing and health
In the time You gave me, through the years of my life,
Of all my possessions, which one is truly mine

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 6
Even of my body, which part is truly mine

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ' 
        END,
        lyrics_transliteration = 'CHORUS
Bemn bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yante aydelem wey
Yefet’erkew ኹlu yante aydelem wey

VERSE 1
With what then shall I please You, O God my King
How then shall I please You Lord with anything
Does not the world and its fullness belong to You
Does not all that You created belong to You

CHORUS
Bemn bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yante aydelem wey
Yefet’erkew ኹlu yante aydelem wey

VERSE 2
Cherubim seraphim sing “Holy Trinity”
The angels in Rama worship in unity
O Wonderful Counselor, El Shaddai you’re divine (isaiah 9:6)
I’m but dust; what can i give you that’s truly mine

CHORUS
Bemn bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yante aydelem wey
Yefet’erkew ኹlu yante aydelem wey

VERSE 3
Since You, the Most High God, love a pure sacrifice,
What will I offer You that’s worthy in your eyes
Whether in the heavens or the depths of the sea
O Lord where is the place in which You would not be

CHORUS
Bemn bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yante aydelem wey
Yefet’erkew ኹlu yante aydelem wey

VERSE 4
Through the Litany’s prayers, Liturgy and hours,
You bestowed to us gifts through the Spirit’s powers
If we praise with these gifts, what have we really done
Overlook our boldness towards You O Holy One

CHORUS
Bemn bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yante aydelem wey
Yefet’erkew ኹlu yante aydelem wey

VERSE 5
What have I to boast of, whether my strength or wealth
Who besides You granted me wellbeing and health
In the time You gave me, through the years of my life,
Of all my possessions, which one is truly mine

CHORUS
Bemn bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yante aydelem wey
Yefet’erkew ኹlu yante aydelem wey

VERSE 6
Even of my body, which part is truly mine

CHORUS
Bemn bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yante aydelem wey
Yefet’erkew ኹlu yante aydelem wey',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9ba4ea8a-6fb1-4e10-a3c4-8d2ff133ae18'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 1
with what then shall I please You, O God my King
how then shall I please You Lord with anything
Does not the world and its fullness belong to You
Does not all that You created belong to You

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 2
cherubim seraphim sing “Holy Trinity”
The angels in Rama worship in unity
O Wonderful Counselor, El Shaddai you’re divine (isaiah 9:6)
i’m but dust; what can i give you that’s truly mine

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 3
Since You, the Most High God, love a pure sacrifice,
What will I offer You that’s worthy in your eyes
whether in the heavens or the depths of the sea
O Lord where is the place in which You would not be

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 4
Through the Litany’s prayers, Liturgy and hours,
You bestowed to us gifts through the Spirit’s powers
If we praise with these gifts, what have we really done
Overlook our boldness towards You O Holy One

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 5
what have I to boast of, whether my strength or wealth
Who besides You granted me wellbeing and health
In the time You gave me, through the years of my life,
Of all my possessions, which one is truly mine

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ

VERSE 6
Even of my body, which part is truly mine

CHORUS
በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'በምን በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
ዓለምና መላው ያንተ አይደለም ወይ
የፈጠርከው ኹሉ ያንተ አይደለም ወይ
with what then shall I please You, O God my King
how then shall I please You Lord with anything
Does not the world and its fullness belong to You
Does not all that You created belong to You
cherubim seraphim sing “Holy Trinity”
The angels in Rama worship in unity
O Wonderful Counselor, El Shaddai you’re divine (isaiah 9:6)
i’m but dust; what can i give you that’s truly mine
Since You, the Most High God, love a pure sacrifice,
What will I offer You that’s worthy in your eyes
whether in the heavens or the depths of the sea
O Lord where is the place in which You would not be
Through the Litany’s prayers, Liturgy and hours,
You bestowed to us gifts through the Spirit’s powers
If we praise with these gifts, what have we really done
Overlook our boldness towards You O Holy One
what have I to boast of, whether my strength or wealth
Who besides You granted me wellbeing and health
In the time You gave me, through the years of my life,
Of all my possessions, which one is truly mine
Even of my body, which part is truly mine'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9ba4ea8a-6fb1-4e10-a3c4-8d2ff133ae18'::uuid, 'with-what-shall-i-please-you', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mezmur-awetna-eritrean-orthodox-tewhdo-mezmor ("መዝሙር ዓወትና ናይ ናይ ሕብረት መዝሙር")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7e0216d9-6afa-426e-8202-74c206cdb3ff'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 1
Tensuu Iyesus biaby silt’an
Bimotu mis amlaኽ kab teareቕna
Bihiwetu kindey zeyndhn azina
Ab zufan kibri midhna kab teቐmet’e

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 2
Nisu''yu mogesna yiflet’ zeyfelet’e
Biu ina nira yiflet’ zeyfelet’e
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 3
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan
Tensiu Iyesus biaby silt’an
Tibat alena nihna qine enblelu

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 4
Nab qidmi liul kem wulud niቐrbelu
Tizteharde genshel kefilwo''yu edana
Niu nizelalem yiኹno misgana
Nigoyta Iyesus yiኹno misgana

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 5
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 6
Tensiu Iyesus biaby silt’an
Omot bilhኻ lomi mewgeka abey''lo
Mezmur awetna''ziyu degagimna niblo
Merho motn hiywetn ab idu hizu''yu goytana

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 7
Bezi hiyaw tesfa wuhus''yu midhana
Abzi hiyaw tesfa yiseret emnetna
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 8
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan
Tensiu Iyesus biaby silt’an
Bimotu mis amlaኽ kab teareቕna

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 9
Bihiwetu kindey zeyndhn azina
Ab zufan kibri medhanina kab teቐmet’e
Nisu''yu mogosna yiflet’ zeyfelet’e
Bii ina nira yiflet’ zeyfelet’e

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 10
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 11
Tensiu Iyesus biaby silt’an (2)

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 1
ተንሱኡ ኢየሱስ ብዓብይ ስልጣን
ብሞቱ ምስ ኣምላኽ ካብ ተዓረቕና
ብሂወቱ ክንደይ ዘይንድሕን ኣዚና
ኣብ ዙፋን ክብሪ ምድሕና ካብ ተቐመጠ

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 2
ንሱ''ዩ ሞገስና ይፍለጥ ዘይፈለጠ
ብኡ ኢና ንርአ ይፍለጥ ዘይፈለጠ
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 3
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን
ተንሲኡ ኢየሱስ ብዓብይ ስልጣን
ትብዓት ኣለና ንሕና ቅንዕ እንብለሉ

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 4
ናብ ቅድሚ ልዑል ከም ዉሉድ ንቐርበሉ
ትዝተሓርደ ገንሸል ከፊልዎ''ዩ ዕዳና
ንዑ ንዘልኣለም ይኹኖ ምስጋና
ንጎይታ ኢየሱስ ይኹኖ ምስጋና

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 5
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 6
ተንሲኡ ኢየሱስ ብዓብይ ስልጣን
ኦሞት ብልሕኻ ሎሚ መውግእካ ኣበይ''ሎ
መዝሙር ዓወትና''ዚዩ ደጋጊምና ንብሎ
መርሖ ሞትን ህይወትን ኣብ ኢዱ ሒዙ''ዩ ጎይታና

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 7
በዚ ህያው ተስፋ ዉሑስ''ዩ ምድሓና
ኣብዚ ሂያው ተስፋ ይሰረት እምነትና
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 8
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን
ተንሲኡ ኢየሱስ ብዓብይ ስልጣን
ብሞቱ ምስ ኣምላኽ ካብ ተዓረቕና

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 9
ብሂወቱ ክንደይ ዘይንድሕን ኣዚና
ኣብ ዙፋን ክብሪ መድሓኒና ካብ ተቐመጠ
ንሱ''ዩ ሞጎስና ይፍለጥ ዘይፈለጠ
ብኢ ኢና ንርአ ይፍለጥ ዘይፈለጠ

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 10
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 11
ተንሲኡ ኢየሱስ ብዓብይ ስልጣን(2)

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 1
ተንሱኡ ኢየሱስ ብዓብይ ስልጣን
ብሞቱ ምስ ኣምላኽ ካብ ተዓረቕና
ብሂወቱ ክንደይ ዘይንድሕን ኣዚና
ኣብ ዙፋን ክብሪ ምድሕና ካብ ተቐመጠ

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 2
ንሱ''ዩ ሞገስና ይፍለጥ ዘይፈለጠ
ብኡ ኢና ንርአ ይፍለጥ ዘይፈለጠ
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 3
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን
ተንሲኡ ኢየሱስ ብዓብይ ስልጣን
ትብዓት ኣለና ንሕና ቅንዕ እንብለሉ

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 4
ናብ ቅድሚ ልዑል ከም ዉሉድ ንቐርበሉ
ትዝተሓርደ ገንሸል ከፊልዎ''ዩ ዕዳና
ንዑ ንዘልኣለም ይኹኖ ምስጋና
ንጎይታ ኢየሱስ ይኹኖ ምስጋና

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 5
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 6
ተንሲኡ ኢየሱስ ብዓብይ ስልጣን
ኦሞት ብልሕኻ ሎሚ መውግእካ ኣበይ''ሎ
መዝሙር ዓወትና''ዚዩ ደጋጊምና ንብሎ
መርሖ ሞትን ህይወትን ኣብ ኢዱ ሒዙ''ዩ ጎይታና

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 7
በዚ ህያው ተስፋ ዉሑስ''ዩ ምድሓና
ኣብዚ ሂያው ተስፋ ይሰረት እምነትና
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 8
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን
ተንሲኡ ኢየሱስ ብዓብይ ስልጣን
ብሞቱ ምስ ኣምላኽ ካብ ተዓረቕና

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 9
ብሂወቱ ክንደይ ዘይንድሕን ኣዚና
ኣብ ዙፋን ክብሪ መድሓኒና ካብ ተቐመጠ
ንሱ''ዩ ሞጎስና ይፍለጥ ዘይፈለጠ
ብኢ ኢና ንርአ ይፍለጥ ዘይፈለጠ

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 10
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 11
ተንሲኡ ኢየሱስ ብዓብይ ስልጣን(2)

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን' THEN lyrics_amharic 
          ELSE 'CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 1
ተንሱኡ ኢየሱስ ብዓብይ ስልጣን
ብሞቱ ምስ ኣምላኽ ካብ ተዓረቕና
ብሂወቱ ክንደይ ዘይንድሕን ኣዚና
ኣብ ዙፋን ክብሪ ምድሕና ካብ ተቐመጠ

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 2
ንሱ''ዩ ሞገስና ይፍለጥ ዘይፈለጠ
ብኡ ኢና ንርአ ይፍለጥ ዘይፈለጠ
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 3
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን
ተንሲኡ ኢየሱስ ብዓብይ ስልጣን
ትብዓት ኣለና ንሕና ቅንዕ እንብለሉ

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 4
ናብ ቅድሚ ልዑል ከም ዉሉድ ንቐርበሉ
ትዝተሓርደ ገንሸል ከፊልዎ''ዩ ዕዳና
ንዑ ንዘልኣለም ይኹኖ ምስጋና
ንጎይታ ኢየሱስ ይኹኖ ምስጋና

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 5
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 6
ተንሲኡ ኢየሱስ ብዓብይ ስልጣን
ኦሞት ብልሕኻ ሎሚ መውግእካ ኣበይ''ሎ
መዝሙር ዓወትና''ዚዩ ደጋጊምና ንብሎ
መርሖ ሞትን ህይወትን ኣብ ኢዱ ሒዙ''ዩ ጎይታና

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 7
በዚ ህያው ተስፋ ዉሑስ''ዩ ምድሓና
ኣብዚ ሂያው ተስፋ ይሰረት እምነትና
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 8
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን
ተንሲኡ ኢየሱስ ብዓብይ ስልጣን
ብሞቱ ምስ ኣምላኽ ካብ ተዓረቕና

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 9
ብሂወቱ ክንደይ ዘይንድሕን ኣዚና
ኣብ ዙፋን ክብሪ መድሓኒና ካብ ተቐመጠ
ንሱ''ዩ ሞጎስና ይፍለጥ ዘይፈለጠ
ብኢ ኢና ንርአ ይፍለጥ ዘይፈለጠ

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 10
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 11
ተንሲኡ ኢየሱስ ብዓብይ ስልጣን(2)

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን' 
        END,
        lyrics_transliteration = 'CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 1
Tensuu Iyesus biaby silt’an
Bimotu mis amlaኽ kab teareቕna
Bihiwetu kindey zeyndhn azina
Ab zufan kibri midhna kab teቐmet’e

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 2
Nisu''yu mogesna yiflet’ zeyfelet’e
Biu ina nira yiflet’ zeyfelet’e
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 3
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan
Tensiu Iyesus biaby silt’an
Tibat alena nihna qine enblelu

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 4
Nab qidmi liul kem wulud niቐrbelu
Tizteharde genshel kefilwo''yu edana
Niu nizelalem yiኹno misgana
Nigoyta Iyesus yiኹno misgana

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 5
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 6
Tensiu Iyesus biaby silt’an
Omot bilhኻ lomi mewgeka abey''lo
Mezmur awetna''ziyu degagimna niblo
Merho motn hiywetn ab idu hizu''yu goytana

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 7
Bezi hiyaw tesfa wuhus''yu midhana
Abzi hiyaw tesfa yiseret emnetna
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 8
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan
Tensiu Iyesus biaby silt’an
Bimotu mis amlaኽ kab teareቕna

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 9
Bihiwetu kindey zeyndhn azina
Ab zufan kibri medhanina kab teቐmet’e
Nisu''yu mogosna yiflet’ zeyfelet’e
Bii ina nira yiflet’ zeyfelet’e

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 10
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan

VERSE 11
Tensiu Iyesus biaby silt’an (2)

CHORUS
Asbi hat’iyatna mot silezኾne
Biana teraeyu Iyesus teኾnene
Nihna bieu ts’dqi amlaኽ kinkewn
Tensiu Iyesus niana nimdhan',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7e0216d9-6afa-426e-8202-74c206cdb3ff'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 1
ተንሱኡ ኢየሱስ ብዓብይ ስልጣን
ብሞቱ ምስ ኣምላኽ ካብ ተዓረቕና
ብሂወቱ ክንደይ ዘይንድሕን ኣዚና
ኣብ ዙፋን ክብሪ ምድሕና ካብ ተቐመጠ

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 2
ንሱ''ዩ ሞገስና ይፍለጥ ዘይፈለጠ
ብኡ ኢና ንርአ ይፍለጥ ዘይፈለጠ
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 3
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን
ተንሲኡ ኢየሱስ ብዓብይ ስልጣን
ትብዓት ኣለና ንሕና ቅንዕ እንብለሉ

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 4
ናብ ቅድሚ ልዑል ከም ዉሉድ ንቐርበሉ
ትዝተሓርደ ገንሸል ከፊልዎ''ዩ ዕዳና
ንዑ ንዘልኣለም ይኹኖ ምስጋና
ንጎይታ ኢየሱስ ይኹኖ ምስጋና

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 5
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 6
ተንሲኡ ኢየሱስ ብዓብይ ስልጣን
ኦሞት ብልሕኻ ሎሚ መውግእካ ኣበይ''ሎ
መዝሙር ዓወትና''ዚዩ ደጋጊምና ንብሎ
መርሖ ሞትን ህይወትን ኣብ ኢዱ ሒዙ''ዩ ጎይታና

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 7
በዚ ህያው ተስፋ ዉሑስ''ዩ ምድሓና
ኣብዚ ሂያው ተስፋ ይሰረት እምነትና
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 8
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን
ተንሲኡ ኢየሱስ ብዓብይ ስልጣን
ብሞቱ ምስ ኣምላኽ ካብ ተዓረቕና

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 9
ብሂወቱ ክንደይ ዘይንድሕን ኣዚና
ኣብ ዙፋን ክብሪ መድሓኒና ካብ ተቐመጠ
ንሱ''ዩ ሞጎስና ይፍለጥ ዘይፈለጠ
ብኢ ኢና ንርአ ይፍለጥ ዘይፈለጠ

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 10
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን

VERSE 11
ተንሲኡ ኢየሱስ ብዓብይ ስልጣን(2)

CHORUS
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን
ተንሱኡ ኢየሱስ ብዓብይ ስልጣን
ብሞቱ ምስ ኣምላኽ ካብ ተዓረቕና
ብሂወቱ ክንደይ ዘይንድሕን ኣዚና
ኣብ ዙፋን ክብሪ ምድሕና ካብ ተቐመጠ
ንሱ''ዩ ሞገስና ይፍለጥ ዘይፈለጠ
ብኡ ኢና ንርአ ይፍለጥ ዘይፈለጠ
~~~~~~~~~~~~~~~~~~~~~~
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን
ተንሲኡ ኢየሱስ ብዓብይ ስልጣን
ትብዓት ኣለና ንሕና ቅንዕ እንብለሉ
ናብ ቅድሚ ልዑል ከም ዉሉድ ንቐርበሉ
ትዝተሓርደ ገንሸል ከፊልዎ''ዩ ዕዳና
ንዑ ንዘልኣለም ይኹኖ ምስጋና
ንጎይታ ኢየሱስ ይኹኖ ምስጋና
~~~~~~~~~~~~~~~~~~~~~~
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን
ተንሲኡ ኢየሱስ ብዓብይ ስልጣን
ኦሞት ብልሕኻ ሎሚ መውግእካ ኣበይ''ሎ
መዝሙር ዓወትና''ዚዩ ደጋጊምና ንብሎ
መርሖ ሞትን ህይወትን ኣብ ኢዱ ሒዙ''ዩ ጎይታና
በዚ ህያው ተስፋ ዉሑስ''ዩ ምድሓና
ኣብዚ ሂያው ተስፋ ይሰረት እምነትና
~~~~~~~~~~~~~~~~~~~~~~
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን
ተንሲኡ ኢየሱስ ብዓብይ ስልጣን
ብሞቱ ምስ ኣምላኽ ካብ ተዓረቕና
ብሂወቱ ክንደይ ዘይንድሕን ኣዚና
ኣብ ዙፋን ክብሪ መድሓኒና ካብ ተቐመጠ
ንሱ''ዩ ሞጎስና ይፍለጥ ዘይፈለጠ
ብኢ ኢና ንርአ ይፍለጥ ዘይፈለጠ
~~~~~~~~~~~~~~~~~~~~~~
ዓስቢ ሓጢያትና ሞት ስለዝኾነ
ብኣና ተራእዩ ኢየሱስ ተኾነነ
ንሕና ብእኡ ጽድቂ ኣምላኽ ክንከውን
ተንሲኡ ኢየሱስ ንዓና ንምድሓን
ተንሲኡ ኢየሱስ ብዓብይ ስልጣን(2)'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7e0216d9-6afa-426e-8202-74c206cdb3ff'::uuid, 'mezmur-awetna-eritrean-orthodox-tewhdo-mezmor', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- heavenly-gardner-rejoice ("heavenly-gardner-rejoice")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '430bd026-de2d-4977-b7d6-7f72589db66c'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
In our exile and bear fruit
When you see before your words.
When I have fully in my heart.
And when I said the salvation becomes hard

VERSE 1
And once I hear it will be snatched by the world.
I keep forgeting that your kingom is again today
I pray. Today I pray.
Let me listen to you.

CHORUS
In our exile and bear fruit
When you see before your words.
When I have fully in my heart.
And when I said the salvation becomes hard

VERSE 2
Let me in your word my faith and words.
Let it be 100
And sometimes when I become so emotional
I want to change my passion

CHORUS
In our exile and bear fruit
When you see before your words.
When I have fully in my heart.
And when I said the salvation becomes hard

VERSE 3
On the rocky soul and nothing to me.
Today I pray. Today I pray.
And my heart.
So we all when the season your to grow.

CHORUS
In our exile and bear fruit
When you see before your words.
When I have fully in my heart.
And when I said the salvation becomes hard

VERSE 4
The fruits are chopped by the short of this world
Within I so freely I''m distracted
Not focused on eternity
Today I pray today I pray for a heart of mine

CHORUS
In our exile and bear fruit
When you see before your words.
When I have fully in my heart.
And when I said the salvation becomes hard

VERSE 5
And if you cross and all your life was the king
And you see for his earth.
Never you see Glory
Rejoice the in heaven.

CHORUS
In our exile and bear fruit
When you see before your words.
When I have fully in my heart.
And when I said the salvation becomes hard

VERSE 6
Rejoice the ever virgin and the true king.
Rejoice again. Rejoice to come.
Holy is the king.
He is the hero strength

CHORUS
In our exile and bear fruit
When you see before your words.
When I have fully in my heart.
And when I said the salvation becomes hard

VERSE 7
You rejoice among the world.
You are full of praise.
Rejoice as our save the human race.
Rejoice the gift we receive under the holy cross.

CHORUS
In our exile and bear fruit
When you see before your words.
When I have fully in my heart.
And when I said the salvation becomes hard

VERSE 8
Rejoice you are the peace proje.
On the wedding of rejoice
Bring the rejection
That the angels glory

CHORUS
In our exile and bear fruit
When you see before your words.
When I have fully in my heart.
And when I said the salvation becomes hard

VERSE 9
He is my father.
Holy is the king.
Holy is the king who strengthen you.
Rejoice the fruit of Jess

CHORUS
In our exile and bear fruit
When you see before your words.
When I have fully in my heart.
And when I said the salvation becomes hard'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 1
and once I hear it will be snatched by the world.
I keep forgeting that your kingom is again today
I pray. Today I pray.
Let me listen to you.

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 2
Let me in your word my faith and words.
Let it be 100
And sometimes when I become so emotional
I want to change my passion

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 3
on the rocky soul and nothing to me.
Today I pray. Today I pray.
and my heart.
So we all when the season your to grow.

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 4
The fruits are chopped by the short of this world
within I so freely I''m distracted
not focused on eternity
today I pray today I pray for a heart of mine

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 5
And if you cross and all your life was the king
and you see for his earth.
Never you see Glory
rejoice the in heaven.

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 6
Rejoice the ever virgin and the true king.
Rejoice again. Rejoice to come.
Holy is the king.
He is the hero strength

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 7
you rejoice among the world.
You are full of praise.
Rejoice as our save the human race.
Rejoice the gift we receive under the holy cross.

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 8
Rejoice you are the peace proje.
on the wedding of rejoice
bring the rejection
that the angels glory

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 9
He is my father.
Holy is the king.
Holy is the king who strengthen you.
Rejoice the fruit of Jess

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 1
and once I hear it will be snatched by the world.
I keep forgeting that your kingom is again today
I pray. Today I pray.
Let me listen to you.

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 2
Let me in your word my faith and words.
Let it be 100
And sometimes when I become so emotional
I want to change my passion

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 3
on the rocky soul and nothing to me.
Today I pray. Today I pray.
and my heart.
So we all when the season your to grow.

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 4
The fruits are chopped by the short of this world
within I so freely I''m distracted
not focused on eternity
today I pray today I pray for a heart of mine

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 5
And if you cross and all your life was the king
and you see for his earth.
Never you see Glory
rejoice the in heaven.

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 6
Rejoice the ever virgin and the true king.
Rejoice again. Rejoice to come.
Holy is the king.
He is the hero strength

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 7
you rejoice among the world.
You are full of praise.
Rejoice as our save the human race.
Rejoice the gift we receive under the holy cross.

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 8
Rejoice you are the peace proje.
on the wedding of rejoice
bring the rejection
that the angels glory

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 9
He is my father.
Holy is the king.
Holy is the king who strengthen you.
Rejoice the fruit of Jess

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard' THEN lyrics_amharic 
          ELSE 'CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 1
and once I hear it will be snatched by the world.
I keep forgeting that your kingom is again today
I pray. Today I pray.
Let me listen to you.

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 2
Let me in your word my faith and words.
Let it be 100
And sometimes when I become so emotional
I want to change my passion

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 3
on the rocky soul and nothing to me.
Today I pray. Today I pray.
and my heart.
So we all when the season your to grow.

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 4
The fruits are chopped by the short of this world
within I so freely I''m distracted
not focused on eternity
today I pray today I pray for a heart of mine

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 5
And if you cross and all your life was the king
and you see for his earth.
Never you see Glory
rejoice the in heaven.

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 6
Rejoice the ever virgin and the true king.
Rejoice again. Rejoice to come.
Holy is the king.
He is the hero strength

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 7
you rejoice among the world.
You are full of praise.
Rejoice as our save the human race.
Rejoice the gift we receive under the holy cross.

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 8
Rejoice you are the peace proje.
on the wedding of rejoice
bring the rejection
that the angels glory

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 9
He is my father.
Holy is the king.
Holy is the king who strengthen you.
Rejoice the fruit of Jess

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard' 
        END,
        lyrics_transliteration = 'CHORUS
In our exile and bear fruit
When you see before your words.
When I have fully in my heart.
And when I said the salvation becomes hard

VERSE 1
And once I hear it will be snatched by the world.
I keep forgeting that your kingom is again today
I pray. Today I pray.
Let me listen to you.

CHORUS
In our exile and bear fruit
When you see before your words.
When I have fully in my heart.
And when I said the salvation becomes hard

VERSE 2
Let me in your word my faith and words.
Let it be 100
And sometimes when I become so emotional
I want to change my passion

CHORUS
In our exile and bear fruit
When you see before your words.
When I have fully in my heart.
And when I said the salvation becomes hard

VERSE 3
On the rocky soul and nothing to me.
Today I pray. Today I pray.
And my heart.
So we all when the season your to grow.

CHORUS
In our exile and bear fruit
When you see before your words.
When I have fully in my heart.
And when I said the salvation becomes hard

VERSE 4
The fruits are chopped by the short of this world
Within I so freely I''m distracted
Not focused on eternity
Today I pray today I pray for a heart of mine

CHORUS
In our exile and bear fruit
When you see before your words.
When I have fully in my heart.
And when I said the salvation becomes hard

VERSE 5
And if you cross and all your life was the king
And you see for his earth.
Never you see Glory
Rejoice the in heaven.

CHORUS
In our exile and bear fruit
When you see before your words.
When I have fully in my heart.
And when I said the salvation becomes hard

VERSE 6
Rejoice the ever virgin and the true king.
Rejoice again. Rejoice to come.
Holy is the king.
He is the hero strength

CHORUS
In our exile and bear fruit
When you see before your words.
When I have fully in my heart.
And when I said the salvation becomes hard

VERSE 7
You rejoice among the world.
You are full of praise.
Rejoice as our save the human race.
Rejoice the gift we receive under the holy cross.

CHORUS
In our exile and bear fruit
When you see before your words.
When I have fully in my heart.
And when I said the salvation becomes hard

VERSE 8
Rejoice you are the peace proje.
On the wedding of rejoice
Bring the rejection
That the angels glory

CHORUS
In our exile and bear fruit
When you see before your words.
When I have fully in my heart.
And when I said the salvation becomes hard

VERSE 9
He is my father.
Holy is the king.
Holy is the king who strengthen you.
Rejoice the fruit of Jess

CHORUS
In our exile and bear fruit
When you see before your words.
When I have fully in my heart.
And when I said the salvation becomes hard',
        updated_at = clock_timestamp()::text
    WHERE import_id = '430bd026-de2d-4977-b7d6-7f72589db66c'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 1
and once I hear it will be snatched by the world.
I keep forgeting that your kingom is again today
I pray. Today I pray.
Let me listen to you.

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 2
Let me in your word my faith and words.
Let it be 100
And sometimes when I become so emotional
I want to change my passion

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 3
on the rocky soul and nothing to me.
Today I pray. Today I pray.
and my heart.
So we all when the season your to grow.

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 4
The fruits are chopped by the short of this world
within I so freely I''m distracted
not focused on eternity
today I pray today I pray for a heart of mine

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 5
And if you cross and all your life was the king
and you see for his earth.
Never you see Glory
rejoice the in heaven.

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 6
Rejoice the ever virgin and the true king.
Rejoice again. Rejoice to come.
Holy is the king.
He is the hero strength

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 7
you rejoice among the world.
You are full of praise.
Rejoice as our save the human race.
Rejoice the gift we receive under the holy cross.

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 8
Rejoice you are the peace proje.
on the wedding of rejoice
bring the rejection
that the angels glory

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard

VERSE 9
He is my father.
Holy is the king.
Holy is the king who strengthen you.
Rejoice the fruit of Jess

CHORUS
in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard'
        OR lyrics_amharic IS NOT DISTINCT FROM 'in our exile and bear fruit
when you see before your words.
when I have fully in my heart.
And when I said the salvation becomes hard
and once I hear it will be snatched by the world.
I keep forgeting that your kingom is again today
I pray. Today I pray.
Let me listen to you.
Let me in your word my faith and words.
Let it be 100
And sometimes when I become so emotional
I want to change my passion
on the rocky soul and nothing to me.
Today I pray. Today I pray.
and my heart.
So we all when the season your to grow.
The fruits are chopped by the short of this world
within I so freely I''m distracted
not focused on eternity
today I pray today I pray for a heart of mine
And if you cross and all your life was the king
and you see for his earth.
Never you see Glory
rejoice the in heaven.
Rejoice the ever virgin and the true king.
Rejoice again. Rejoice to come.
Holy is the king.
He is the hero strength
you rejoice among the world.
You are full of praise.
Rejoice as our save the human race.
Rejoice the gift we receive under the holy cross.
Rejoice you are the peace proje.
on the wedding of rejoice
bring the rejection
that the angels glory
He is my father.
Holy is the king.
Holy is the king who strengthen you.
Rejoice the fruit of Jess'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '430bd026-de2d-4977-b7d6-7f72589db66c'::uuid, 'heavenly-gardner-rejoice', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-499 ("እነሆ ብስራት")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '745b453a-aab8-4f98-aba6-4a05206d2849'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
…enho bisrat git’mn zeman di nega girmay…
Halleluya enho bisrat
Ab betelhem adi dawit
Lomi tewelde eti medhanit

VERSE 1
Misana koynu goyta serawit
Degim abqiu eti newih tits’bit.
Miኽri ts’elai kifrs
Widuቕ bahrna kihds

CHORUS
…enho bisrat git’mn zeman di nega girmay…
Halleluya enho bisrat
Ab betelhem adi dawit
Lomi tewelde eti medhanit

VERSE 2
Kibur zifanu hadigu
Misana kiኸwn bihigu.
Ts’elamna ziቕnt’t’ hits’an
Abo zelalem mesfn selam

CHORUS
…enho bisrat git’mn zeman di nega girmay…
Halleluya enho bisrat
Ab betelhem adi dawit
Lomi tewelde eti medhanit

VERSE 3
Bibrhanu kebrhalna
Ts’ehay ts’dqi tewelidlna.
Wedi amlaኽ siga lebisu
Ab mebli mal enho deqisu

CHORUS
…enho bisrat git’mn zeman di nega girmay…
Halleluya enho bisrat
Ab betelhem adi dawit
Lomi tewelde eti medhanit

VERSE 4
Mets’iulna zemen ellta
Kebero alelu nifhu enblta.
Eti zeywsen tewesinu
Biach’rqti tet’eቕlilu

CHORUS
…enho bisrat git’mn zeman di nega girmay…
Halleluya enho bisrat
Ab betelhem adi dawit
Lomi tewelde eti medhanit

VERSE 5
Aiyntna rieyeneo
Neti wetru ziharfeo.

CHORUS
…enho bisrat git’mn zeman di nega girmay…
Halleluya enho bisrat
Ab betelhem adi dawit
Lomi tewelde eti medhanit'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት

VERSE 1
ምሳና ኮይኑ ጎይታ ሰራዊት
ደጊም ኣብቂዑ እቲ ነዊሕ ትጽቢት።
ምኽሪ ጸላኢ ክፍርስ
ውዱቕ ባህርና ክሕድስ

CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት

VERSE 2
ክቡር ዝፋኑ ሓዲጉ
ምሳና ክኸውን ብሂጉ።
ጸላምና ዝቕንጥጥ ሕፃን
ኣቦ ዘልኣለም መስፍን ሰላም

CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት

VERSE 3
ብብርሃኑ ከብርሃልና
ጸሓይ ጽድቂ ተወሊድልና።
ወዲ ኣምላኽ ስጋ ለቢሱ
ኣብ መብልዒ ማል እንሆ ደቂሱ

CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት

VERSE 4
መጺኡልና ዘመን ዕልልታ
ከበሮ ኣልዕሉ ንፍሑ እንብልታ።
እቲ ዘይውሰን ተወሲኑ
ብኣጭርቅቲ ተጠቕሊሉ

CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት

VERSE 5
ኣዒይንትና ርእየነኦ
ነቲ ወትሩ ዝሃርፈኦ።

CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት

VERSE 1
ምሳና ኮይኑ ጎይታ ሰራዊት
ደጊም ኣብቂዑ እቲ ነዊሕ ትጽቢት።
ምኽሪ ጸላኢ ክፍርስ
ውዱቕ ባህርና ክሕድስ

CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት

VERSE 2
ክቡር ዝፋኑ ሓዲጉ
ምሳና ክኸውን ብሂጉ።
ጸላምና ዝቕንጥጥ ሕፃን
ኣቦ ዘልኣለም መስፍን ሰላም

CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት

VERSE 3
ብብርሃኑ ከብርሃልና
ጸሓይ ጽድቂ ተወሊድልና።
ወዲ ኣምላኽ ስጋ ለቢሱ
ኣብ መብልዒ ማል እንሆ ደቂሱ

CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት

VERSE 4
መጺኡልና ዘመን ዕልልታ
ከበሮ ኣልዕሉ ንፍሑ እንብልታ።
እቲ ዘይውሰን ተወሲኑ
ብኣጭርቅቲ ተጠቕሊሉ

CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት

VERSE 5
ኣዒይንትና ርእየነኦ
ነቲ ወትሩ ዝሃርፈኦ።

CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት' THEN lyrics_amharic 
          ELSE 'CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት

VERSE 1
ምሳና ኮይኑ ጎይታ ሰራዊት
ደጊም ኣብቂዑ እቲ ነዊሕ ትጽቢት።
ምኽሪ ጸላኢ ክፍርስ
ውዱቕ ባህርና ክሕድስ

CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት

VERSE 2
ክቡር ዝፋኑ ሓዲጉ
ምሳና ክኸውን ብሂጉ።
ጸላምና ዝቕንጥጥ ሕፃን
ኣቦ ዘልኣለም መስፍን ሰላም

CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት

VERSE 3
ብብርሃኑ ከብርሃልና
ጸሓይ ጽድቂ ተወሊድልና።
ወዲ ኣምላኽ ስጋ ለቢሱ
ኣብ መብልዒ ማል እንሆ ደቂሱ

CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት

VERSE 4
መጺኡልና ዘመን ዕልልታ
ከበሮ ኣልዕሉ ንፍሑ እንብልታ።
እቲ ዘይውሰን ተወሲኑ
ብኣጭርቅቲ ተጠቕሊሉ

CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት

VERSE 5
ኣዒይንትና ርእየነኦ
ነቲ ወትሩ ዝሃርፈኦ።

CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት' 
        END,
        lyrics_transliteration = 'CHORUS
…enho bisrat git’mn zeman di nega girmay…
Halleluya enho bisrat
Ab betelhem adi dawit
Lomi tewelde eti medhanit

VERSE 1
Misana koynu goyta serawit
Degim abqiu eti newih tits’bit.
Miኽri ts’elai kifrs
Widuቕ bahrna kihds

CHORUS
…enho bisrat git’mn zeman di nega girmay…
Halleluya enho bisrat
Ab betelhem adi dawit
Lomi tewelde eti medhanit

VERSE 2
Kibur zifanu hadigu
Misana kiኸwn bihigu.
Ts’elamna ziቕnt’t’ hits’an
Abo zelalem mesfn selam

CHORUS
…enho bisrat git’mn zeman di nega girmay…
Halleluya enho bisrat
Ab betelhem adi dawit
Lomi tewelde eti medhanit

VERSE 3
Bibrhanu kebrhalna
Ts’ehay ts’dqi tewelidlna.
Wedi amlaኽ siga lebisu
Ab mebli mal enho deqisu

CHORUS
…enho bisrat git’mn zeman di nega girmay…
Halleluya enho bisrat
Ab betelhem adi dawit
Lomi tewelde eti medhanit

VERSE 4
Mets’iulna zemen ellta
Kebero alelu nifhu enblta.
Eti zeywsen tewesinu
Biach’rqti tet’eቕlilu

CHORUS
…enho bisrat git’mn zeman di nega girmay…
Halleluya enho bisrat
Ab betelhem adi dawit
Lomi tewelde eti medhanit

VERSE 5
Aiyntna rieyeneo
Neti wetru ziharfeo.

CHORUS
…enho bisrat git’mn zeman di nega girmay…
Halleluya enho bisrat
Ab betelhem adi dawit
Lomi tewelde eti medhanit',
        updated_at = clock_timestamp()::text
    WHERE import_id = '745b453a-aab8-4f98-aba6-4a05206d2849'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት

VERSE 1
ምሳና ኮይኑ ጎይታ ሰራዊት
ደጊም ኣብቂዑ እቲ ነዊሕ ትጽቢት።
ምኽሪ ጸላኢ ክፍርስ
ውዱቕ ባህርና ክሕድስ

CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት

VERSE 2
ክቡር ዝፋኑ ሓዲጉ
ምሳና ክኸውን ብሂጉ።
ጸላምና ዝቕንጥጥ ሕፃን
ኣቦ ዘልኣለም መስፍን ሰላም

CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት

VERSE 3
ብብርሃኑ ከብርሃልና
ጸሓይ ጽድቂ ተወሊድልና።
ወዲ ኣምላኽ ስጋ ለቢሱ
ኣብ መብልዒ ማል እንሆ ደቂሱ

CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት

VERSE 4
መጺኡልና ዘመን ዕልልታ
ከበሮ ኣልዕሉ ንፍሑ እንብልታ።
እቲ ዘይውሰን ተወሲኑ
ብኣጭርቅቲ ተጠቕሊሉ

CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት

VERSE 5
ኣዒይንትና ርእየነኦ
ነቲ ወትሩ ዝሃርፈኦ።

CHORUS
…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት'
        OR lyrics_amharic IS NOT DISTINCT FROM '…እንሆ ብስራት ግጥምን ዜማን ዲ ነጋ ግርማይ…
ሃሌሉያ እንሆ ብስራት
ኣብ ቤተልሔም ዓዲ ዳዊት
ሎሚ ተወልደ እቲ መድሓኒት
ምሳና ኮይኑ ጎይታ ሰራዊት
ደጊም ኣብቂዑ እቲ ነዊሕ ትጽቢት።
ምኽሪ ጸላኢ ክፍርስ
ውዱቕ ባህርና ክሕድስ
ክቡር ዝፋኑ ሓዲጉ
ምሳና ክኸውን ብሂጉ።
ጸላምና ዝቕንጥጥ ሕፃን
ኣቦ ዘልኣለም መስፍን ሰላም
ብብርሃኑ ከብርሃልና
ጸሓይ ጽድቂ ተወሊድልና።
ወዲ ኣምላኽ ስጋ ለቢሱ
ኣብ መብልዒ ማል እንሆ ደቂሱ
መጺኡልና ዘመን ዕልልታ
ከበሮ ኣልዕሉ ንፍሑ እንብልታ።
እቲ ዘይውሰን ተወሲኑ
ብኣጭርቅቲ ተጠቕሊሉ
ኣዒይንትና ርእየነኦ
ነቲ ወትሩ ዝሃርፈኦ።'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '745b453a-aab8-4f98-aba6-4a05206d2849'::uuid, 'eritrean-orthodox-tewahdo-mezmur-499', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mezmur-kzareb-kzareb ("ምምስጋን ጥራይ ሕብረት መዝሙር # # ክዛረብ ክዛረብ #")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '23882f88-f8e4-4e7a-b535-3c6510ea3c49'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Mimsgan mimsgan t’ray eyu sirhey
Mizmar mizmar t’ray eyu tegbarey
Nisኻ aytfleyn kab afey
Nisኻ aytnets’fn kab kenferey

VERSE 1
Wieletka fitwey zeleaeleni
Nigho biwegahta azymo zibleni
Zit’eame fiqri natka yu fitwey
Kemey yeኽelo mo keymeskero afey

CHORUS
Mimsgan mimsgan t’ray eyu sirhey
Mizmar mizmar t’ray eyu tegbarey
Nisኻ aytfleyn kab afey
Nisኻ aytnets’fn kab kenferey

VERSE 2
Kizareb kizareb natka neger
Kemlኽ kiewji bihadsh mezmur
Ayts’egbekan ayts’egbekan kizmrelka
Nisኻ mo nisኻ mo filuy iኻ

CHORUS
Mimsgan mimsgan t’ray eyu sirhey
Mizmar mizmar t’ray eyu tegbarey
Nisኻ aytfleyn kab afey
Nisኻ aytnets’fn kab kenferey

VERSE 3
Iyesus filuy iኻ (4)fitwey filuy iኻ
Kab qwanqwa yiabi kab qalat nilaeli
Semay zeydrto zeywsno midri
Aቐnu aybets’hon met’en nay fiቕrኻ

CHORUS
Mimsgan mimsgan t’ray eyu sirhey
Mizmar mizmar t’ray eyu tegbarey
Nisኻ aytfleyn kab afey
Nisኻ aytnets’fn kab kenferey

VERSE 4
Ets’ub ets’ub ile kiswe misgana
Kizareb kizareb natka neger
Kemlኽ kiewji bihadsh mezmur
Ayts’egbekan ayts’egbekan kizmrelka

CHORUS
Mimsgan mimsgan t’ray eyu sirhey
Mizmar mizmar t’ray eyu tegbarey
Nisኻ aytfleyn kab afey
Nisኻ aytnets’fn kab kenferey

VERSE 5
Nisኻ mo nisኻ mo filuy iኻ
Iyesus filuy iኻ (4)fitwey filuy iኻ
Ab qidmi ts’elaetey bimegos aቚmka
Neti ziኸfa (wishat’e nay kifat)ts’elmat asagirka

CHORUS
Mimsgan mimsgan t’ray eyu sirhey
Mizmar mizmar t’ray eyu tegbarey
Nisኻ aytfleyn kab afey
Nisኻ aytnets’fn kab kenferey

VERSE 6
Ab qidmi neaቕtey ts’ebiቑ negerey
Iyesus mikhwanka wudase mezmurey
Kizareb kizareb natka neger
Kemlኽ kiewji bihadsh mezmur

CHORUS
Mimsgan mimsgan t’ray eyu sirhey
Mizmar mizmar t’ray eyu tegbarey
Nisኻ aytfleyn kab afey
Nisኻ aytnets’fn kab kenferey

VERSE 7
Ayts’egbekan ayts’egbekan kizmrelka
Nisኻ mo nisኻ mo filuy iኻ
Iyesus filuy iኻ (4)fitwey filuy iኻ
Simka kits’wo erefti koynuley

CHORUS
Mimsgan mimsgan t’ray eyu sirhey
Mizmar mizmar t’ray eyu tegbarey
Nisኻ aytfleyn kab afey
Nisኻ aytnets’fn kab kenferey

VERSE 8
Amen eyu mezmurey misaኻ minbarey
Migurmram wun yelen misgana t’ray ''yu
Wala yimlae yigudel Iyesus goytay ''yu
Kizareb kizareb natka neger

CHORUS
Mimsgan mimsgan t’ray eyu sirhey
Mizmar mizmar t’ray eyu tegbarey
Nisኻ aytfleyn kab afey
Nisኻ aytnets’fn kab kenferey

VERSE 9
Kemlኽ kiewji bihadsh mezmur
Ayts’egbekan ayts’egbekan kizmrelka
Nisኻ mo nisኻ mo filuy iኻ
Iyesus filuy iኻ (4)fitwey filuy iኻ

CHORUS
Mimsgan mimsgan t’ray eyu sirhey
Mizmar mizmar t’ray eyu tegbarey
Nisኻ aytfleyn kab afey
Nisኻ aytnets’fn kab kenferey'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 1
ውዕለትካ ፍትወይ ዘለዓዕለኒ
ንግሆ ብወጋሕታ ኣዝይሞ ዝብለኒ
ዝጠዓመ ፍቅሪ ናትካ ዩ ፍትወይ
ከመይ የኽእሎ ሞ ከይመስከሮ አፈይ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 2
ክዛረብ ክዛረብ ናትካ ነገር
ከምልኽ ክእውጂ ብሓድሽ መዝሙር
ኣይጸግበካን ኣይጸግበካን ክዝምረልካ
ንስኻ ሞ ንስኻ ሞ ፍሉይ ኢኻ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 3
ኢየሱስ ፍሉይ ኢኻ (4)ፍትወይ ፍሉይ ኢኻ
ካብ ቋንቋ ይዓቢ ካብ ቃላት ንላዕሊ
ሰማይ ዘይድርቶ ዘይውስኖ ምድሪ
ዓቐኑ ኣይበጽሖን መጠን ናይ ፍቕርኻ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 4
ዕጹብ ዕጹብ ኢለ ክስውእ ምስጋና
ክዛረብ ክዛረብ ናትካ ነገር
ከምልኽ ክእውጂ ብሓድሽ መዝሙር
ኣይጸግበካን ኣይጸግበካን ክዝምረልካ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 5
ንስኻ ሞ ንስኻ ሞ ፍሉይ ኢኻ
ኢየሱስ ፍሉይ ኢኻ (4)ፍትወይ ፍሉይ ኢኻ
ኣብ ቅድሚ ጸላእተይ ብመጎስ ኣቚምካ
ነቲ ዝኸፍአ (ውሻጠ ናይ ክፍኣት)ጸልማት ኣሳጊርካ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 6
ኣብ ቅድሚ ነዓቕተይ ጸቢቑ ነገረይ
ኢየሱስ ምዃንካ ዉዳሴ መዝሙረይ
ክዛረብ ክዛረብ ናትካ ነገር
ከምልኽ ክእውጂ ብሓድሽ መዝሙር

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 7
ኣይጸግበካን ኣይጸግበካን ክዝምረልካ
ንስኻ ሞ ንስኻ ሞ ፍሉይ ኢኻ
ኢየሱስ ፍሉይ ኢኻ (4)ፍትወይ ፍሉይ ኢኻ
ስምካ ክጽውዖ ዕረፍቲ ኮይኑለይ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 8
ኣሜን እዩ መዝሙረይ ምሳኻ ምንባረይ
ምጉርምራም ዉን የለን ምስጋና ጥራይ ''ዩ
ዋላ ይምላእ ይጉደል ኢየሱስ ጎይታይ ''ዩ
ክዛረብ ክዛረብ ናትካ ነገር

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 9
ከምልኽ ክእውጂ ብሓድሽ መዝሙር
ኣይጸግበካን ኣይጸግበካን ክዝምረልካ
ንስኻ ሞ ንስኻ ሞ ፍሉይ ኢኻ
ኢየሱስ ፍሉይ ኢኻ (4)ፍትወይ ፍሉይ ኢኻ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 1
ውዕለትካ ፍትወይ ዘለዓዕለኒ
ንግሆ ብወጋሕታ ኣዝይሞ ዝብለኒ
ዝጠዓመ ፍቅሪ ናትካ ዩ ፍትወይ
ከመይ የኽእሎ ሞ ከይመስከሮ አፈይ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 2
ክዛረብ ክዛረብ ናትካ ነገር
ከምልኽ ክእውጂ ብሓድሽ መዝሙር
ኣይጸግበካን ኣይጸግበካን ክዝምረልካ
ንስኻ ሞ ንስኻ ሞ ፍሉይ ኢኻ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 3
ኢየሱስ ፍሉይ ኢኻ (4)ፍትወይ ፍሉይ ኢኻ
ካብ ቋንቋ ይዓቢ ካብ ቃላት ንላዕሊ
ሰማይ ዘይድርቶ ዘይውስኖ ምድሪ
ዓቐኑ ኣይበጽሖን መጠን ናይ ፍቕርኻ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 4
ዕጹብ ዕጹብ ኢለ ክስውእ ምስጋና
ክዛረብ ክዛረብ ናትካ ነገር
ከምልኽ ክእውጂ ብሓድሽ መዝሙር
ኣይጸግበካን ኣይጸግበካን ክዝምረልካ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 5
ንስኻ ሞ ንስኻ ሞ ፍሉይ ኢኻ
ኢየሱስ ፍሉይ ኢኻ (4)ፍትወይ ፍሉይ ኢኻ
ኣብ ቅድሚ ጸላእተይ ብመጎስ ኣቚምካ
ነቲ ዝኸፍአ (ውሻጠ ናይ ክፍኣት)ጸልማት ኣሳጊርካ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 6
ኣብ ቅድሚ ነዓቕተይ ጸቢቑ ነገረይ
ኢየሱስ ምዃንካ ዉዳሴ መዝሙረይ
ክዛረብ ክዛረብ ናትካ ነገር
ከምልኽ ክእውጂ ብሓድሽ መዝሙር

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 7
ኣይጸግበካን ኣይጸግበካን ክዝምረልካ
ንስኻ ሞ ንስኻ ሞ ፍሉይ ኢኻ
ኢየሱስ ፍሉይ ኢኻ (4)ፍትወይ ፍሉይ ኢኻ
ስምካ ክጽውዖ ዕረፍቲ ኮይኑለይ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 8
ኣሜን እዩ መዝሙረይ ምሳኻ ምንባረይ
ምጉርምራም ዉን የለን ምስጋና ጥራይ ''ዩ
ዋላ ይምላእ ይጉደል ኢየሱስ ጎይታይ ''ዩ
ክዛረብ ክዛረብ ናትካ ነገር

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 9
ከምልኽ ክእውጂ ብሓድሽ መዝሙር
ኣይጸግበካን ኣይጸግበካን ክዝምረልካ
ንስኻ ሞ ንስኻ ሞ ፍሉይ ኢኻ
ኢየሱስ ፍሉይ ኢኻ (4)ፍትወይ ፍሉይ ኢኻ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ' THEN lyrics_amharic 
          ELSE 'CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 1
ውዕለትካ ፍትወይ ዘለዓዕለኒ
ንግሆ ብወጋሕታ ኣዝይሞ ዝብለኒ
ዝጠዓመ ፍቅሪ ናትካ ዩ ፍትወይ
ከመይ የኽእሎ ሞ ከይመስከሮ አፈይ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 2
ክዛረብ ክዛረብ ናትካ ነገር
ከምልኽ ክእውጂ ብሓድሽ መዝሙር
ኣይጸግበካን ኣይጸግበካን ክዝምረልካ
ንስኻ ሞ ንስኻ ሞ ፍሉይ ኢኻ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 3
ኢየሱስ ፍሉይ ኢኻ (4)ፍትወይ ፍሉይ ኢኻ
ካብ ቋንቋ ይዓቢ ካብ ቃላት ንላዕሊ
ሰማይ ዘይድርቶ ዘይውስኖ ምድሪ
ዓቐኑ ኣይበጽሖን መጠን ናይ ፍቕርኻ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 4
ዕጹብ ዕጹብ ኢለ ክስውእ ምስጋና
ክዛረብ ክዛረብ ናትካ ነገር
ከምልኽ ክእውጂ ብሓድሽ መዝሙር
ኣይጸግበካን ኣይጸግበካን ክዝምረልካ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 5
ንስኻ ሞ ንስኻ ሞ ፍሉይ ኢኻ
ኢየሱስ ፍሉይ ኢኻ (4)ፍትወይ ፍሉይ ኢኻ
ኣብ ቅድሚ ጸላእተይ ብመጎስ ኣቚምካ
ነቲ ዝኸፍአ (ውሻጠ ናይ ክፍኣት)ጸልማት ኣሳጊርካ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 6
ኣብ ቅድሚ ነዓቕተይ ጸቢቑ ነገረይ
ኢየሱስ ምዃንካ ዉዳሴ መዝሙረይ
ክዛረብ ክዛረብ ናትካ ነገር
ከምልኽ ክእውጂ ብሓድሽ መዝሙር

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 7
ኣይጸግበካን ኣይጸግበካን ክዝምረልካ
ንስኻ ሞ ንስኻ ሞ ፍሉይ ኢኻ
ኢየሱስ ፍሉይ ኢኻ (4)ፍትወይ ፍሉይ ኢኻ
ስምካ ክጽውዖ ዕረፍቲ ኮይኑለይ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 8
ኣሜን እዩ መዝሙረይ ምሳኻ ምንባረይ
ምጉርምራም ዉን የለን ምስጋና ጥራይ ''ዩ
ዋላ ይምላእ ይጉደል ኢየሱስ ጎይታይ ''ዩ
ክዛረብ ክዛረብ ናትካ ነገር

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 9
ከምልኽ ክእውጂ ብሓድሽ መዝሙር
ኣይጸግበካን ኣይጸግበካን ክዝምረልካ
ንስኻ ሞ ንስኻ ሞ ፍሉይ ኢኻ
ኢየሱስ ፍሉይ ኢኻ (4)ፍትወይ ፍሉይ ኢኻ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ' 
        END,
        lyrics_transliteration = 'CHORUS
Mimsgan mimsgan t’ray eyu sirhey
Mizmar mizmar t’ray eyu tegbarey
Nisኻ aytfleyn kab afey
Nisኻ aytnets’fn kab kenferey

VERSE 1
Wieletka fitwey zeleaeleni
Nigho biwegahta azymo zibleni
Zit’eame fiqri natka yu fitwey
Kemey yeኽelo mo keymeskero afey

CHORUS
Mimsgan mimsgan t’ray eyu sirhey
Mizmar mizmar t’ray eyu tegbarey
Nisኻ aytfleyn kab afey
Nisኻ aytnets’fn kab kenferey

VERSE 2
Kizareb kizareb natka neger
Kemlኽ kiewji bihadsh mezmur
Ayts’egbekan ayts’egbekan kizmrelka
Nisኻ mo nisኻ mo filuy iኻ

CHORUS
Mimsgan mimsgan t’ray eyu sirhey
Mizmar mizmar t’ray eyu tegbarey
Nisኻ aytfleyn kab afey
Nisኻ aytnets’fn kab kenferey

VERSE 3
Iyesus filuy iኻ (4)fitwey filuy iኻ
Kab qwanqwa yiabi kab qalat nilaeli
Semay zeydrto zeywsno midri
Aቐnu aybets’hon met’en nay fiቕrኻ

CHORUS
Mimsgan mimsgan t’ray eyu sirhey
Mizmar mizmar t’ray eyu tegbarey
Nisኻ aytfleyn kab afey
Nisኻ aytnets’fn kab kenferey

VERSE 4
Ets’ub ets’ub ile kiswe misgana
Kizareb kizareb natka neger
Kemlኽ kiewji bihadsh mezmur
Ayts’egbekan ayts’egbekan kizmrelka

CHORUS
Mimsgan mimsgan t’ray eyu sirhey
Mizmar mizmar t’ray eyu tegbarey
Nisኻ aytfleyn kab afey
Nisኻ aytnets’fn kab kenferey

VERSE 5
Nisኻ mo nisኻ mo filuy iኻ
Iyesus filuy iኻ (4)fitwey filuy iኻ
Ab qidmi ts’elaetey bimegos aቚmka
Neti ziኸfa (wishat’e nay kifat)ts’elmat asagirka

CHORUS
Mimsgan mimsgan t’ray eyu sirhey
Mizmar mizmar t’ray eyu tegbarey
Nisኻ aytfleyn kab afey
Nisኻ aytnets’fn kab kenferey

VERSE 6
Ab qidmi neaቕtey ts’ebiቑ negerey
Iyesus mikhwanka wudase mezmurey
Kizareb kizareb natka neger
Kemlኽ kiewji bihadsh mezmur

CHORUS
Mimsgan mimsgan t’ray eyu sirhey
Mizmar mizmar t’ray eyu tegbarey
Nisኻ aytfleyn kab afey
Nisኻ aytnets’fn kab kenferey

VERSE 7
Ayts’egbekan ayts’egbekan kizmrelka
Nisኻ mo nisኻ mo filuy iኻ
Iyesus filuy iኻ (4)fitwey filuy iኻ
Simka kits’wo erefti koynuley

CHORUS
Mimsgan mimsgan t’ray eyu sirhey
Mizmar mizmar t’ray eyu tegbarey
Nisኻ aytfleyn kab afey
Nisኻ aytnets’fn kab kenferey

VERSE 8
Amen eyu mezmurey misaኻ minbarey
Migurmram wun yelen misgana t’ray ''yu
Wala yimlae yigudel Iyesus goytay ''yu
Kizareb kizareb natka neger

CHORUS
Mimsgan mimsgan t’ray eyu sirhey
Mizmar mizmar t’ray eyu tegbarey
Nisኻ aytfleyn kab afey
Nisኻ aytnets’fn kab kenferey

VERSE 9
Kemlኽ kiewji bihadsh mezmur
Ayts’egbekan ayts’egbekan kizmrelka
Nisኻ mo nisኻ mo filuy iኻ
Iyesus filuy iኻ (4)fitwey filuy iኻ

CHORUS
Mimsgan mimsgan t’ray eyu sirhey
Mizmar mizmar t’ray eyu tegbarey
Nisኻ aytfleyn kab afey
Nisኻ aytnets’fn kab kenferey',
        updated_at = clock_timestamp()::text
    WHERE import_id = '23882f88-f8e4-4e7a-b535-3c6510ea3c49'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 1
ውዕለትካ ፍትወይ ዘለዓዕለኒ
ንግሆ ብወጋሕታ ኣዝይሞ ዝብለኒ
ዝጠዓመ ፍቅሪ ናትካ ዩ ፍትወይ
ከመይ የኽእሎ ሞ ከይመስከሮ አፈይ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 2
ክዛረብ ክዛረብ ናትካ ነገር
ከምልኽ ክእውጂ ብሓድሽ መዝሙር
ኣይጸግበካን ኣይጸግበካን ክዝምረልካ
ንስኻ ሞ ንስኻ ሞ ፍሉይ ኢኻ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 3
ኢየሱስ ፍሉይ ኢኻ (4)ፍትወይ ፍሉይ ኢኻ
ካብ ቋንቋ ይዓቢ ካብ ቃላት ንላዕሊ
ሰማይ ዘይድርቶ ዘይውስኖ ምድሪ
ዓቐኑ ኣይበጽሖን መጠን ናይ ፍቕርኻ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 4
ዕጹብ ዕጹብ ኢለ ክስውእ ምስጋና
ክዛረብ ክዛረብ ናትካ ነገር
ከምልኽ ክእውጂ ብሓድሽ መዝሙር
ኣይጸግበካን ኣይጸግበካን ክዝምረልካ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 5
ንስኻ ሞ ንስኻ ሞ ፍሉይ ኢኻ
ኢየሱስ ፍሉይ ኢኻ (4)ፍትወይ ፍሉይ ኢኻ
ኣብ ቅድሚ ጸላእተይ ብመጎስ ኣቚምካ
ነቲ ዝኸፍአ (ውሻጠ ናይ ክፍኣት)ጸልማት ኣሳጊርካ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 6
ኣብ ቅድሚ ነዓቕተይ ጸቢቑ ነገረይ
ኢየሱስ ምዃንካ ዉዳሴ መዝሙረይ
ክዛረብ ክዛረብ ናትካ ነገር
ከምልኽ ክእውጂ ብሓድሽ መዝሙር

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 7
ኣይጸግበካን ኣይጸግበካን ክዝምረልካ
ንስኻ ሞ ንስኻ ሞ ፍሉይ ኢኻ
ኢየሱስ ፍሉይ ኢኻ (4)ፍትወይ ፍሉይ ኢኻ
ስምካ ክጽውዖ ዕረፍቲ ኮይኑለይ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 8
ኣሜን እዩ መዝሙረይ ምሳኻ ምንባረይ
ምጉርምራም ዉን የለን ምስጋና ጥራይ ''ዩ
ዋላ ይምላእ ይጉደል ኢየሱስ ጎይታይ ''ዩ
ክዛረብ ክዛረብ ናትካ ነገር

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ

VERSE 9
ከምልኽ ክእውጂ ብሓድሽ መዝሙር
ኣይጸግበካን ኣይጸግበካን ክዝምረልካ
ንስኻ ሞ ንስኻ ሞ ፍሉይ ኢኻ
ኢየሱስ ፍሉይ ኢኻ (4)ፍትወይ ፍሉይ ኢኻ

CHORUS
ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ምምስጋን ምምስጋን ጥራይ እዩ ስርሐይ
ምዝማር ምዝማር ጥራይ እዩ ተግባረይ
ንስኻ ኣይትፍለይን ካብ ኣፈይ
ንስኻ ኣይትነጽፍን ካብ ከንፈረይ
ውዕለትካ ፍትወይ ዘለዓዕለኒ
ንግሆ ብወጋሕታ ኣዝይሞ ዝብለኒ
ዝጠዓመ ፍቅሪ ናትካ ዩ ፍትወይ
ከመይ የኽእሎ ሞ ከይመስከሮ አፈይ
ክዛረብ ክዛረብ ናትካ ነገር
ከምልኽ ክእውጂ ብሓድሽ መዝሙር
ኣይጸግበካን ኣይጸግበካን ክዝምረልካ
ንስኻ ሞ ንስኻ ሞ ፍሉይ ኢኻ
ኢየሱስ ፍሉይ ኢኻ (4)ፍትወይ ፍሉይ ኢኻ
ካብ ቋንቋ ይዓቢ ካብ ቃላት ንላዕሊ
ሰማይ ዘይድርቶ ዘይውስኖ ምድሪ
ዓቐኑ ኣይበጽሖን መጠን ናይ ፍቕርኻ
ዕጹብ ዕጹብ ኢለ ክስውእ ምስጋና
ክዛረብ ክዛረብ ናትካ ነገር
ከምልኽ ክእውጂ ብሓድሽ መዝሙር
ኣይጸግበካን ኣይጸግበካን ክዝምረልካ
ንስኻ ሞ ንስኻ ሞ ፍሉይ ኢኻ
ኢየሱስ ፍሉይ ኢኻ (4)ፍትወይ ፍሉይ ኢኻ
ኣብ ቅድሚ ጸላእተይ ብመጎስ ኣቚምካ
ነቲ ዝኸፍአ (ውሻጠ ናይ ክፍኣት)ጸልማት ኣሳጊርካ
ኣብ ቅድሚ ነዓቕተይ ጸቢቑ ነገረይ
ኢየሱስ ምዃንካ ዉዳሴ መዝሙረይ
ክዛረብ ክዛረብ ናትካ ነገር
ከምልኽ ክእውጂ ብሓድሽ መዝሙር
ኣይጸግበካን ኣይጸግበካን ክዝምረልካ
ንስኻ ሞ ንስኻ ሞ ፍሉይ ኢኻ
ኢየሱስ ፍሉይ ኢኻ (4)ፍትወይ ፍሉይ ኢኻ
ስምካ ክጽውዖ ዕረፍቲ ኮይኑለይ
ኣሜን እዩ መዝሙረይ ምሳኻ ምንባረይ
ምጉርምራም ዉን የለን ምስጋና ጥራይ ''ዩ
ዋላ ይምላእ ይጉደል ኢየሱስ ጎይታይ ''ዩ
ክዛረብ ክዛረብ ናትካ ነገር
ከምልኽ ክእውጂ ብሓድሽ መዝሙር
ኣይጸግበካን ኣይጸግበካን ክዝምረልካ
ንስኻ ሞ ንስኻ ሞ ፍሉይ ኢኻ
ኢየሱስ ፍሉይ ኢኻ (4)ፍትወይ ፍሉይ ኢኻ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '23882f88-f8e4-4e7a-b535-3c6510ea3c49'::uuid, 'mezmur-kzareb-kzareb', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ante-yalkew-yehun-begena-dawit-harp ("በገና አንተ ያልከው")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'cb8f2989-d858-47dd-a5e0-7e397ea8e334'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 1
Met’ebeq sigebagn higna feqadhn
Tadiya lemn yihon yasch’eneqegn enen (2)
Keengdih behwala ene alch’eneqm
Lebego newna bihonm bayhonm

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 2
Et’enekralehu ante aleh lehulum (2)
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm abat hoy kante gin aybelt’m
Liul hoy kante gin aybelt’m

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 3
Adrgew qoyehugn eneneten lene
Fits’um mognnet new yasalefkut wene
Zare gin leqekugn mayet chlwal ayne (2)
Yematanqelafaw eregnaye eyaleh

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 4
Lalt’ebq erasen wet’ahu kemedafh
Megbot gibrh new sira endelmadh (2)
Hulunm ayche endemayhonlgn
Yefet’erkew enen endtrekebegn

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 5
Ante yalkew yihun biye temarekugn
Yefeqedkew yihun biye temarekugn
Yefeqedkew yihun kengdih behwala
Enenete ena ene yelen lela

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 6
Endante cher abat anagegnm lela
Endante cher nigus anagegnm lela
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm abat hoy kante gin aybelt’m

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 7
Ante batchekulm mechem atzegeym
Yerot’e enkwan binor ch’rash ayqedmhm
Bante zend kinwn miknyat alew hulum
Bante zend hunate miknyat alehu hulum

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 8
Beermjah miragn qedme endgegn
Betgsth yazegn chkola andayt’legn
Dekama negn ena feqadkn nigeregn (2)
Esatna fitft bemayleyew eje

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 9
Sigors norealehu esatn wedje
Mastewaln limar att’fa kedeje
Mastewaln laggn athid kedeje
Eje bicha aydelem aynem bizu sitwal

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 10
Yemiyayewn hulu enderasu qot’rwal
Yemayewm ayne leka yante norwal (2)
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 11
Niguse kante gin aybelt’m
And qen almeshe and qen alnega bene filsfna
Bizu zemen lene kesrobgnalna
Ebakhn saymesh siragn endegena (2)

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 12
Ch’uኧt baysema fird enkwan bigwadel
Bandach salmeka wegen alegn sall
Wedante new kise lehonebgn bedel (2)
Beqelm yantew new firdna kunene

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 13
Befith widq new ya hulu zemene
Behaqmh kalnorkugn aqm yelegnm ene
Behaylh kalnorkugn hayl yelegnm ene
Binor bicha aydelem bimotm yantew negn

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 14
Hulem yantenete zare new yegebagn
Beermjah miragn keengdihs yibqagn
Ejen anschalehu befeqadh miragn
Ante yalkew yihun biye hulun tichewalew

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 15
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 1
መጠበቅ ሲገባኝ ህግና ፈቃድህን
ታዲያ ለምን ይሆን ያስጨነቀኝ እኔን (2)
ከእንግዲህ በኋላ እኔ አልጨነቅም
ለበጎ ነውና ቢሆንም ባይሆንም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 2
እጠነክራለሁ አንተ አለህ ለሁሉም(2)
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አባት ሆይ ካንተ ግን አይበልጥም
ልዑል ሆይ ካንተ ግን አይበልጥም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 3
አድርጌው ቆየሁኝ እኔነቴን ለኔ
ፍጹም ሞኝነት ነው ያሳለፍኩት ወኔ
ዛሬ ግን ለቀኩኝ ማየት ችሏል አይኔ (2)
የማታንቀላፋው እረኛዬ እያለህ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 4
ላልጠብቅ እራሴን ወጣሁ ከመዳፍህ
መግቦት ግብርህ ነው ሥራ እንደልማድህ (2)
ሁሉንም አይቼ እንደማይሆንልኝ
የፈጠርከው እኔን እንድትረከበኝ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 5
አንተ ያልከው ይሁን ብዬ ተማረኩኝ
የፈቀድከው ይሁን ብዬ ተማረኩኝ
የፈቀድከው ይሁን ከንግዲህ በኋላ
እኔነቴ እና እኔ የለን ሌላ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 6
እንዳንተ ቸር አባት አናገኝም ሌላ
እንዳንተ ቸር ንጉሥ አናገኝም ሌላ
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አባት ሆይ ካንተ ግን አይበልጥም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 7
አንተ ባትቸኩልም መቼም አትዘገይም
የሮጠ እንኳን ቢኖር ጭራሽ አይቀድምህም
ባንተ ዘንድ ክንውን ምክንያት አለው ሁሉም
ባንተ ዘንድ ሁናቴ ምክንያት አለሁ ሁሉም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 8
በእርምጃህ ምራኝ ቀድሜ እንድገኝ
በትግስትህ ያዘኝ ችኮላ አንዳይጥለኝ
ደካማ ነኝ እና ፈቃድክን ንገረኝ(2)
እሳትና ፍትፍት በማይለየው እጄ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 9
ስጎርስ ኖሬአለሁ እሳትን ወድጄ
ማስተዋልን ልማር አትጥፋ ከደጄ
ማስተዋልን ላግኝ አትሂድ ከደጄ
እጄ ብቻ አይደለም አይኔም ብዙ ስቷል

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 10
የሚያየውን ሁሉ እንደራሱ ቆጥሯል
የማየውም አይኔ ለካ ያንተ ኖሯል (2)
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 11
ንጉሤ ካንተ ግን አይበልጥም
አንድ ቀን አልመሸ አንድ ቀን አልነጋ በኔ ፍልስፍና
ብዙ ዘመን ለኔ ከስሮብኛልና
እባክህን ሳይመሽ ስራኝ እንደገና (2)

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 12
ጩኧት ባይሰማ ፍርድ እንኳን ቢጓደል
ባንዳች ሳልመካ ወገን አለኝ ሳልል
ወዳንተ ነው ክሴ ለሆነብኝ በደል (2)
በቀልም ያንተው ነው ፍርድና ኩነኔ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 13
በፊትህ ውድቅ ነው ያ ሁሉ ዘመኔ
በሃቅምህ ካልኖርኩኝ አቅም የለኝም እኔ
በሃይልህ ካልኖርኩኝ ሃይል የለኝም እኔ
ብኖር ብቻ አይደለም ብሞትም ያንተው ነኝ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 14
ሁሌም ያንተነቴ ዛሬ ነው የገባኝ
በእርምጃህ ምራኝ ከእንግዲህስ ይብቃኝ
እጄን አንስቻለሁ በፈቃድህ ምራኝ
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 15
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 1
መጠበቅ ሲገባኝ ህግና ፈቃድህን
ታዲያ ለምን ይሆን ያስጨነቀኝ እኔን (2)
ከእንግዲህ በኋላ እኔ አልጨነቅም
ለበጎ ነውና ቢሆንም ባይሆንም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 2
እጠነክራለሁ አንተ አለህ ለሁሉም(2)
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አባት ሆይ ካንተ ግን አይበልጥም
ልዑል ሆይ ካንተ ግን አይበልጥም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 3
አድርጌው ቆየሁኝ እኔነቴን ለኔ
ፍጹም ሞኝነት ነው ያሳለፍኩት ወኔ
ዛሬ ግን ለቀኩኝ ማየት ችሏል አይኔ (2)
የማታንቀላፋው እረኛዬ እያለህ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 4
ላልጠብቅ እራሴን ወጣሁ ከመዳፍህ
መግቦት ግብርህ ነው ሥራ እንደልማድህ (2)
ሁሉንም አይቼ እንደማይሆንልኝ
የፈጠርከው እኔን እንድትረከበኝ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 5
አንተ ያልከው ይሁን ብዬ ተማረኩኝ
የፈቀድከው ይሁን ብዬ ተማረኩኝ
የፈቀድከው ይሁን ከንግዲህ በኋላ
እኔነቴ እና እኔ የለን ሌላ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 6
እንዳንተ ቸር አባት አናገኝም ሌላ
እንዳንተ ቸር ንጉሥ አናገኝም ሌላ
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አባት ሆይ ካንተ ግን አይበልጥም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 7
አንተ ባትቸኩልም መቼም አትዘገይም
የሮጠ እንኳን ቢኖር ጭራሽ አይቀድምህም
ባንተ ዘንድ ክንውን ምክንያት አለው ሁሉም
ባንተ ዘንድ ሁናቴ ምክንያት አለሁ ሁሉም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 8
በእርምጃህ ምራኝ ቀድሜ እንድገኝ
በትግስትህ ያዘኝ ችኮላ አንዳይጥለኝ
ደካማ ነኝ እና ፈቃድክን ንገረኝ(2)
እሳትና ፍትፍት በማይለየው እጄ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 9
ስጎርስ ኖሬአለሁ እሳትን ወድጄ
ማስተዋልን ልማር አትጥፋ ከደጄ
ማስተዋልን ላግኝ አትሂድ ከደጄ
እጄ ብቻ አይደለም አይኔም ብዙ ስቷል

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 10
የሚያየውን ሁሉ እንደራሱ ቆጥሯል
የማየውም አይኔ ለካ ያንተ ኖሯል (2)
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 11
ንጉሤ ካንተ ግን አይበልጥም
አንድ ቀን አልመሸ አንድ ቀን አልነጋ በኔ ፍልስፍና
ብዙ ዘመን ለኔ ከስሮብኛልና
እባክህን ሳይመሽ ስራኝ እንደገና (2)

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 12
ጩኧት ባይሰማ ፍርድ እንኳን ቢጓደል
ባንዳች ሳልመካ ወገን አለኝ ሳልል
ወዳንተ ነው ክሴ ለሆነብኝ በደል (2)
በቀልም ያንተው ነው ፍርድና ኩነኔ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 13
በፊትህ ውድቅ ነው ያ ሁሉ ዘመኔ
በሃቅምህ ካልኖርኩኝ አቅም የለኝም እኔ
በሃይልህ ካልኖርኩኝ ሃይል የለኝም እኔ
ብኖር ብቻ አይደለም ብሞትም ያንተው ነኝ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 14
ሁሌም ያንተነቴ ዛሬ ነው የገባኝ
በእርምጃህ ምራኝ ከእንግዲህስ ይብቃኝ
እጄን አንስቻለሁ በፈቃድህ ምራኝ
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 15
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው' THEN lyrics_amharic 
          ELSE 'CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 1
መጠበቅ ሲገባኝ ህግና ፈቃድህን
ታዲያ ለምን ይሆን ያስጨነቀኝ እኔን (2)
ከእንግዲህ በኋላ እኔ አልጨነቅም
ለበጎ ነውና ቢሆንም ባይሆንም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 2
እጠነክራለሁ አንተ አለህ ለሁሉም(2)
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አባት ሆይ ካንተ ግን አይበልጥም
ልዑል ሆይ ካንተ ግን አይበልጥም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 3
አድርጌው ቆየሁኝ እኔነቴን ለኔ
ፍጹም ሞኝነት ነው ያሳለፍኩት ወኔ
ዛሬ ግን ለቀኩኝ ማየት ችሏል አይኔ (2)
የማታንቀላፋው እረኛዬ እያለህ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 4
ላልጠብቅ እራሴን ወጣሁ ከመዳፍህ
መግቦት ግብርህ ነው ሥራ እንደልማድህ (2)
ሁሉንም አይቼ እንደማይሆንልኝ
የፈጠርከው እኔን እንድትረከበኝ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 5
አንተ ያልከው ይሁን ብዬ ተማረኩኝ
የፈቀድከው ይሁን ብዬ ተማረኩኝ
የፈቀድከው ይሁን ከንግዲህ በኋላ
እኔነቴ እና እኔ የለን ሌላ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 6
እንዳንተ ቸር አባት አናገኝም ሌላ
እንዳንተ ቸር ንጉሥ አናገኝም ሌላ
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አባት ሆይ ካንተ ግን አይበልጥም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 7
አንተ ባትቸኩልም መቼም አትዘገይም
የሮጠ እንኳን ቢኖር ጭራሽ አይቀድምህም
ባንተ ዘንድ ክንውን ምክንያት አለው ሁሉም
ባንተ ዘንድ ሁናቴ ምክንያት አለሁ ሁሉም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 8
በእርምጃህ ምራኝ ቀድሜ እንድገኝ
በትግስትህ ያዘኝ ችኮላ አንዳይጥለኝ
ደካማ ነኝ እና ፈቃድክን ንገረኝ(2)
እሳትና ፍትፍት በማይለየው እጄ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 9
ስጎርስ ኖሬአለሁ እሳትን ወድጄ
ማስተዋልን ልማር አትጥፋ ከደጄ
ማስተዋልን ላግኝ አትሂድ ከደጄ
እጄ ብቻ አይደለም አይኔም ብዙ ስቷል

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 10
የሚያየውን ሁሉ እንደራሱ ቆጥሯል
የማየውም አይኔ ለካ ያንተ ኖሯል (2)
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 11
ንጉሤ ካንተ ግን አይበልጥም
አንድ ቀን አልመሸ አንድ ቀን አልነጋ በኔ ፍልስፍና
ብዙ ዘመን ለኔ ከስሮብኛልና
እባክህን ሳይመሽ ስራኝ እንደገና (2)

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 12
ጩኧት ባይሰማ ፍርድ እንኳን ቢጓደል
ባንዳች ሳልመካ ወገን አለኝ ሳልል
ወዳንተ ነው ክሴ ለሆነብኝ በደል (2)
በቀልም ያንተው ነው ፍርድና ኩነኔ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 13
በፊትህ ውድቅ ነው ያ ሁሉ ዘመኔ
በሃቅምህ ካልኖርኩኝ አቅም የለኝም እኔ
በሃይልህ ካልኖርኩኝ ሃይል የለኝም እኔ
ብኖር ብቻ አይደለም ብሞትም ያንተው ነኝ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 14
ሁሌም ያንተነቴ ዛሬ ነው የገባኝ
በእርምጃህ ምራኝ ከእንግዲህስ ይብቃኝ
እጄን አንስቻለሁ በፈቃድህ ምራኝ
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 15
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው' 
        END,
        lyrics_transliteration = 'CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 1
Met’ebeq sigebagn higna feqadhn
Tadiya lemn yihon yasch’eneqegn enen (2)
Keengdih behwala ene alch’eneqm
Lebego newna bihonm bayhonm

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 2
Et’enekralehu ante aleh lehulum (2)
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm abat hoy kante gin aybelt’m
Liul hoy kante gin aybelt’m

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 3
Adrgew qoyehugn eneneten lene
Fits’um mognnet new yasalefkut wene
Zare gin leqekugn mayet chlwal ayne (2)
Yematanqelafaw eregnaye eyaleh

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 4
Lalt’ebq erasen wet’ahu kemedafh
Megbot gibrh new sira endelmadh (2)
Hulunm ayche endemayhonlgn
Yefet’erkew enen endtrekebegn

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 5
Ante yalkew yihun biye temarekugn
Yefeqedkew yihun biye temarekugn
Yefeqedkew yihun kengdih behwala
Enenete ena ene yelen lela

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 6
Endante cher abat anagegnm lela
Endante cher nigus anagegnm lela
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm abat hoy kante gin aybelt’m

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 7
Ante batchekulm mechem atzegeym
Yerot’e enkwan binor ch’rash ayqedmhm
Bante zend kinwn miknyat alew hulum
Bante zend hunate miknyat alehu hulum

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 8
Beermjah miragn qedme endgegn
Betgsth yazegn chkola andayt’legn
Dekama negn ena feqadkn nigeregn (2)
Esatna fitft bemayleyew eje

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 9
Sigors norealehu esatn wedje
Mastewaln limar att’fa kedeje
Mastewaln laggn athid kedeje
Eje bicha aydelem aynem bizu sitwal

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 10
Yemiyayewn hulu enderasu qot’rwal
Yemayewm ayne leka yante norwal (2)
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 11
Niguse kante gin aybelt’m
And qen almeshe and qen alnega bene filsfna
Bizu zemen lene kesrobgnalna
Ebakhn saymesh siragn endegena (2)

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 12
Ch’uኧt baysema fird enkwan bigwadel
Bandach salmeka wegen alegn sall
Wedante new kise lehonebgn bedel (2)
Beqelm yantew new firdna kunene

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 13
Befith widq new ya hulu zemene
Behaqmh kalnorkugn aqm yelegnm ene
Behaylh kalnorkugn hayl yelegnm ene
Binor bicha aydelem bimotm yantew negn

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 14
Hulem yantenete zare new yegebagn
Beermjah miragn keengdihs yibqagn
Ejen anschalehu befeqadh miragn
Ante yalkew yihun biye hulun tichewalew

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew

VERSE 15
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m

CHORUS
Ante yalkew yihun biye hulun tichewalew
Qeregn yemlew binoregnm amlake kante gin aybelt’m
Cheru hoy kante gin aybelt’m
Ante yalkew layqer yihun yalkew',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'cb8f2989-d858-47dd-a5e0-7e397ea8e334'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 1
መጠበቅ ሲገባኝ ህግና ፈቃድህን
ታዲያ ለምን ይሆን ያስጨነቀኝ እኔን (2)
ከእንግዲህ በኋላ እኔ አልጨነቅም
ለበጎ ነውና ቢሆንም ባይሆንም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 2
እጠነክራለሁ አንተ አለህ ለሁሉም(2)
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አባት ሆይ ካንተ ግን አይበልጥም
ልዑል ሆይ ካንተ ግን አይበልጥም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 3
አድርጌው ቆየሁኝ እኔነቴን ለኔ
ፍጹም ሞኝነት ነው ያሳለፍኩት ወኔ
ዛሬ ግን ለቀኩኝ ማየት ችሏል አይኔ (2)
የማታንቀላፋው እረኛዬ እያለህ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 4
ላልጠብቅ እራሴን ወጣሁ ከመዳፍህ
መግቦት ግብርህ ነው ሥራ እንደልማድህ (2)
ሁሉንም አይቼ እንደማይሆንልኝ
የፈጠርከው እኔን እንድትረከበኝ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 5
አንተ ያልከው ይሁን ብዬ ተማረኩኝ
የፈቀድከው ይሁን ብዬ ተማረኩኝ
የፈቀድከው ይሁን ከንግዲህ በኋላ
እኔነቴ እና እኔ የለን ሌላ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 6
እንዳንተ ቸር አባት አናገኝም ሌላ
እንዳንተ ቸር ንጉሥ አናገኝም ሌላ
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አባት ሆይ ካንተ ግን አይበልጥም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 7
አንተ ባትቸኩልም መቼም አትዘገይም
የሮጠ እንኳን ቢኖር ጭራሽ አይቀድምህም
ባንተ ዘንድ ክንውን ምክንያት አለው ሁሉም
ባንተ ዘንድ ሁናቴ ምክንያት አለሁ ሁሉም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 8
በእርምጃህ ምራኝ ቀድሜ እንድገኝ
በትግስትህ ያዘኝ ችኮላ አንዳይጥለኝ
ደካማ ነኝ እና ፈቃድክን ንገረኝ(2)
እሳትና ፍትፍት በማይለየው እጄ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 9
ስጎርስ ኖሬአለሁ እሳትን ወድጄ
ማስተዋልን ልማር አትጥፋ ከደጄ
ማስተዋልን ላግኝ አትሂድ ከደጄ
እጄ ብቻ አይደለም አይኔም ብዙ ስቷል

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 10
የሚያየውን ሁሉ እንደራሱ ቆጥሯል
የማየውም አይኔ ለካ ያንተ ኖሯል (2)
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 11
ንጉሤ ካንተ ግን አይበልጥም
አንድ ቀን አልመሸ አንድ ቀን አልነጋ በኔ ፍልስፍና
ብዙ ዘመን ለኔ ከስሮብኛልና
እባክህን ሳይመሽ ስራኝ እንደገና (2)

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 12
ጩኧት ባይሰማ ፍርድ እንኳን ቢጓደል
ባንዳች ሳልመካ ወገን አለኝ ሳልል
ወዳንተ ነው ክሴ ለሆነብኝ በደል (2)
በቀልም ያንተው ነው ፍርድና ኩነኔ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 13
በፊትህ ውድቅ ነው ያ ሁሉ ዘመኔ
በሃቅምህ ካልኖርኩኝ አቅም የለኝም እኔ
በሃይልህ ካልኖርኩኝ ሃይል የለኝም እኔ
ብኖር ብቻ አይደለም ብሞትም ያንተው ነኝ

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 14
ሁሌም ያንተነቴ ዛሬ ነው የገባኝ
በእርምጃህ ምራኝ ከእንግዲህስ ይብቃኝ
እጄን አንስቻለሁ በፈቃድህ ምራኝ
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው

VERSE 15
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም

CHORUS
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው'
        OR lyrics_amharic IS NOT DISTINCT FROM 'አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም
አንተ ያልከው ላይቀር ይሁን ያልከው
መጠበቅ ሲገባኝ ህግና ፈቃድህን
ታዲያ ለምን ይሆን ያስጨነቀኝ እኔን (2)
ከእንግዲህ በኋላ እኔ አልጨነቅም
ለበጎ ነውና ቢሆንም ባይሆንም
እጠነክራለሁ አንተ አለህ ለሁሉም(2)
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አባት ሆይ ካንተ ግን አይበልጥም
ልዑል ሆይ ካንተ ግን አይበልጥም
አድርጌው ቆየሁኝ እኔነቴን ለኔ
ፍጹም ሞኝነት ነው ያሳለፍኩት ወኔ
ዛሬ ግን ለቀኩኝ ማየት ችሏል አይኔ (2)
የማታንቀላፋው እረኛዬ እያለህ
ላልጠብቅ እራሴን ወጣሁ ከመዳፍህ
መግቦት ግብርህ ነው ሥራ እንደልማድህ (2)
ሁሉንም አይቼ እንደማይሆንልኝ
የፈጠርከው እኔን እንድትረከበኝ
አንተ ያልከው ይሁን ብዬ ተማረኩኝ
የፈቀድከው ይሁን ብዬ ተማረኩኝ
የፈቀድከው ይሁን ከንግዲህ በኋላ
እኔነቴ እና እኔ የለን ሌላ
እንዳንተ ቸር አባት አናገኝም ሌላ
እንዳንተ ቸር ንጉሥ አናገኝም ሌላ
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አባት ሆይ ካንተ ግን አይበልጥም
አንተ ባትቸኩልም መቼም አትዘገይም
የሮጠ እንኳን ቢኖር ጭራሽ አይቀድምህም
ባንተ ዘንድ ክንውን ምክንያት አለው ሁሉም
ባንተ ዘንድ ሁናቴ ምክንያት አለሁ ሁሉም
በእርምጃህ ምራኝ ቀድሜ እንድገኝ
በትግስትህ ያዘኝ ችኮላ አንዳይጥለኝ
ደካማ ነኝ እና ፈቃድክን ንገረኝ(2)
እሳትና ፍትፍት በማይለየው እጄ
ስጎርስ ኖሬአለሁ እሳትን ወድጄ
ማስተዋልን ልማር አትጥፋ ከደጄ
ማስተዋልን ላግኝ አትሂድ ከደጄ
እጄ ብቻ አይደለም አይኔም ብዙ ስቷል
የሚያየውን ሁሉ እንደራሱ ቆጥሯል
የማየውም አይኔ ለካ ያንተ ኖሯል (2)
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ንጉሤ ካንተ ግን አይበልጥም
አንድ ቀን አልመሸ አንድ ቀን አልነጋ በኔ ፍልስፍና
ብዙ ዘመን ለኔ ከስሮብኛልና
እባክህን ሳይመሽ ስራኝ እንደገና (2)
ጩኧት ባይሰማ ፍርድ እንኳን ቢጓደል
ባንዳች ሳልመካ ወገን አለኝ ሳልል
ወዳንተ ነው ክሴ ለሆነብኝ በደል (2)
በቀልም ያንተው ነው ፍርድና ኩነኔ
በፊትህ ውድቅ ነው ያ ሁሉ ዘመኔ
በሃቅምህ ካልኖርኩኝ አቅም የለኝም እኔ
በሃይልህ ካልኖርኩኝ ሃይል የለኝም እኔ
ብኖር ብቻ አይደለም ብሞትም ያንተው ነኝ
ሁሌም ያንተነቴ ዛሬ ነው የገባኝ
በእርምጃህ ምራኝ ከእንግዲህስ ይብቃኝ
እጄን አንስቻለሁ በፈቃድህ ምራኝ
አንተ ያልከው ይሁን ብዬ ሁሉን ትቼዋለው
ቀረኝ የምለው ቢኖረኝም አምላኬ ካንተ ግን አይበልጥም
ቸሩ ሆይ ካንተ ግን አይበልጥም'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'cb8f2989-d858-47dd-a5e0-7e397ea8e334'::uuid, 'ante-yalkew-yehun-begena-dawit-harp', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- held-captive-egeziharya-yilma ("held-captive-egeziharya-yilma")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a8f18395-4409-4060-8f4f-b3307e3e8b06'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Zares teyzhalew befqr sit’ota
Wiletah markognal yeserawit Geta
Kamed yanesaኸgn ketbiya tet’ye
Wiletah kebedegn marekegn Getaye

VERSE 1
Yalset’eኸgn neger bezih midr yelem
Fiqrh wesen yelew dinq new zelalem
Eneneten sayew mindnegn elalew
Fiqrhn sasbew hulgize aleqsalew

CHORUS
Zares teyzhalew befqr sit’ota
Wiletah markognal yeserawit Geta
Kamed yanesaኸgn ketbiya tet’ye
Wiletah kebedegn marekegn Getaye

VERSE 2
Lebchaye hogne amlaken sasbew
Kehlina belay wiletah bizu new
Yetet’alewn sew mansat yawqbetal
Miskinun siyats’nana kehulum yibelt’al

CHORUS
Zares teyzhalew befqr sit’ota
Wiletah markognal yeserawit Geta
Kamed yanesaኸgn ketbiya tet’ye
Wiletah kebedegn marekegn Getaye

VERSE 3
I am now held captive by the gift of true love,
Redeemed by Your great debt, Lord of hosts from above.
From ashes, You lift me, from the dust I was cast,
Your mercy burdens me, and frees my soul at last.

CHORUS
Zares teyzhalew befqr sit’ota
Wiletah markognal yeserawit Geta
Kamed yanesaኸgn ketbiya tet’ye
Wiletah kebedegn marekegn Getaye

VERSE 4
On earth, there is nothing You have deprived me of,
Your grace is eternal, boundless, limitless love.
When I gaze at myself, I wonder what I am,
Recalling Your kindness, my tears leave my face damp

CHORUS
Zares teyzhalew befqr sit’ota
Wiletah markognal yeserawit Geta
Kamed yanesaኸgn ketbiya tet’ye
Wiletah kebedegn marekegn Getaye

VERSE 5
Alone in solitude, I reminisce my Lord,
Beyond comprehension, His grace I can''t afford.
The fallen forgotten, He raises from the dust,
To all the abandoned, His power is our trust.

CHORUS
Zares teyzhalew befqr sit’ota
Wiletah markognal yeserawit Geta
Kamed yanesaኸgn ketbiya tet’ye
Wiletah kebedegn marekegn Getaye'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ

VERSE 1
ያልሰጠኸኝ ነገር በዚህ ምድር የለም
ፍቅርህ ወሰን የለው ድንቅ ነው ዘላለም
እኔነቴን ሳየው ምንድነኝ እላለው
ፍቅርህን ሳስበው ሁልጊዜ አለቅሳለው

CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ

VERSE 2
ለብቻዬ ሆኜ አምላኬን ሳስበው
ከህሊና በላይ ውለታህ ብዙ ነው
የተጣለውን ሰው ማንሳት ያውቅበታል
ምስኪኑን ሲያፅናና ከሁሉም ይበልጣል፡

CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ

VERSE 3
I am now held captive by the gift of true love,
Redeemed by Your great debt, Lord of hosts from above.
From ashes, You lift me, from the dust I was cast,
Your mercy burdens me, and frees my soul at last.

CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ

VERSE 4
On earth, there is nothing You have deprived me of,
Your grace is eternal, boundless, limitless love.
When I gaze at myself, I wonder what I am,
Recalling Your kindness, my tears leave my face damp

CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ

VERSE 5
Alone in solitude, I reminisce my Lord,
Beyond comprehension, His grace I can''t afford.
The fallen forgotten, He raises from the dust,
To all the abandoned, His power is our trust.

CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ

VERSE 1
ያልሰጠኸኝ ነገር በዚህ ምድር የለም
ፍቅርህ ወሰን የለው ድንቅ ነው ዘላለም
እኔነቴን ሳየው ምንድነኝ እላለው
ፍቅርህን ሳስበው ሁልጊዜ አለቅሳለው

CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ

VERSE 2
ለብቻዬ ሆኜ አምላኬን ሳስበው
ከህሊና በላይ ውለታህ ብዙ ነው
የተጣለውን ሰው ማንሳት ያውቅበታል
ምስኪኑን ሲያፅናና ከሁሉም ይበልጣል፡

CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ

VERSE 3
I am now held captive by the gift of true love,
Redeemed by Your great debt, Lord of hosts from above.
From ashes, You lift me, from the dust I was cast,
Your mercy burdens me, and frees my soul at last.

CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ

VERSE 4
On earth, there is nothing You have deprived me of,
Your grace is eternal, boundless, limitless love.
When I gaze at myself, I wonder what I am,
Recalling Your kindness, my tears leave my face damp

CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ

VERSE 5
Alone in solitude, I reminisce my Lord,
Beyond comprehension, His grace I can''t afford.
The fallen forgotten, He raises from the dust,
To all the abandoned, His power is our trust.

CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ' THEN lyrics_amharic 
          ELSE 'CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ

VERSE 1
ያልሰጠኸኝ ነገር በዚህ ምድር የለም
ፍቅርህ ወሰን የለው ድንቅ ነው ዘላለም
እኔነቴን ሳየው ምንድነኝ እላለው
ፍቅርህን ሳስበው ሁልጊዜ አለቅሳለው

CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ

VERSE 2
ለብቻዬ ሆኜ አምላኬን ሳስበው
ከህሊና በላይ ውለታህ ብዙ ነው
የተጣለውን ሰው ማንሳት ያውቅበታል
ምስኪኑን ሲያፅናና ከሁሉም ይበልጣል፡

CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ

VERSE 3
I am now held captive by the gift of true love,
Redeemed by Your great debt, Lord of hosts from above.
From ashes, You lift me, from the dust I was cast,
Your mercy burdens me, and frees my soul at last.

CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ

VERSE 4
On earth, there is nothing You have deprived me of,
Your grace is eternal, boundless, limitless love.
When I gaze at myself, I wonder what I am,
Recalling Your kindness, my tears leave my face damp

CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ

VERSE 5
Alone in solitude, I reminisce my Lord,
Beyond comprehension, His grace I can''t afford.
The fallen forgotten, He raises from the dust,
To all the abandoned, His power is our trust.

CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ' 
        END,
        lyrics_transliteration = 'CHORUS
Zares teyzhalew befqr sit’ota
Wiletah markognal yeserawit Geta
Kamed yanesaኸgn ketbiya tet’ye
Wiletah kebedegn marekegn Getaye

VERSE 1
Yalset’eኸgn neger bezih midr yelem
Fiqrh wesen yelew dinq new zelalem
Eneneten sayew mindnegn elalew
Fiqrhn sasbew hulgize aleqsalew

CHORUS
Zares teyzhalew befqr sit’ota
Wiletah markognal yeserawit Geta
Kamed yanesaኸgn ketbiya tet’ye
Wiletah kebedegn marekegn Getaye

VERSE 2
Lebchaye hogne amlaken sasbew
Kehlina belay wiletah bizu new
Yetet’alewn sew mansat yawqbetal
Miskinun siyats’nana kehulum yibelt’al

CHORUS
Zares teyzhalew befqr sit’ota
Wiletah markognal yeserawit Geta
Kamed yanesaኸgn ketbiya tet’ye
Wiletah kebedegn marekegn Getaye

VERSE 3
I am now held captive by the gift of true love,
Redeemed by Your great debt, Lord of hosts from above.
From ashes, You lift me, from the dust I was cast,
Your mercy burdens me, and frees my soul at last.

CHORUS
Zares teyzhalew befqr sit’ota
Wiletah markognal yeserawit Geta
Kamed yanesaኸgn ketbiya tet’ye
Wiletah kebedegn marekegn Getaye

VERSE 4
On earth, there is nothing You have deprived me of,
Your grace is eternal, boundless, limitless love.
When I gaze at myself, I wonder what I am,
Recalling Your kindness, my tears leave my face damp

CHORUS
Zares teyzhalew befqr sit’ota
Wiletah markognal yeserawit Geta
Kamed yanesaኸgn ketbiya tet’ye
Wiletah kebedegn marekegn Getaye

VERSE 5
Alone in solitude, I reminisce my Lord,
Beyond comprehension, His grace I can''t afford.
The fallen forgotten, He raises from the dust,
To all the abandoned, His power is our trust.

CHORUS
Zares teyzhalew befqr sit’ota
Wiletah markognal yeserawit Geta
Kamed yanesaኸgn ketbiya tet’ye
Wiletah kebedegn marekegn Getaye',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a8f18395-4409-4060-8f4f-b3307e3e8b06'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ

VERSE 1
ያልሰጠኸኝ ነገር በዚህ ምድር የለም
ፍቅርህ ወሰን የለው ድንቅ ነው ዘላለም
እኔነቴን ሳየው ምንድነኝ እላለው
ፍቅርህን ሳስበው ሁልጊዜ አለቅሳለው

CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ

VERSE 2
ለብቻዬ ሆኜ አምላኬን ሳስበው
ከህሊና በላይ ውለታህ ብዙ ነው
የተጣለውን ሰው ማንሳት ያውቅበታል
ምስኪኑን ሲያፅናና ከሁሉም ይበልጣል፡

CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ

VERSE 3
I am now held captive by the gift of true love,
Redeemed by Your great debt, Lord of hosts from above.
From ashes, You lift me, from the dust I was cast,
Your mercy burdens me, and frees my soul at last.

CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ

VERSE 4
On earth, there is nothing You have deprived me of,
Your grace is eternal, boundless, limitless love.
When I gaze at myself, I wonder what I am,
Recalling Your kindness, my tears leave my face damp

CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ

VERSE 5
Alone in solitude, I reminisce my Lord,
Beyond comprehension, His grace I can''t afford.
The fallen forgotten, He raises from the dust,
To all the abandoned, His power is our trust.

CHORUS
ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ዛሬስ ተይዣለው በፍቅር ስጦታ
ውለታህ ማርኮኛል የሰራዊት ጌታ
ካመድ ያነሳኸኝ ከትቢያ ተጥዬ
ውለታህ ከበደኝ ማረከኝ ጌታዬ
ያልሰጠኸኝ ነገር በዚህ ምድር የለም
ፍቅርህ ወሰን የለው ድንቅ ነው ዘላለም
እኔነቴን ሳየው ምንድነኝ እላለው
ፍቅርህን ሳስበው ሁልጊዜ አለቅሳለው
ለብቻዬ ሆኜ አምላኬን ሳስበው
ከህሊና በላይ ውለታህ ብዙ ነው
የተጣለውን ሰው ማንሳት ያውቅበታል
ምስኪኑን ሲያፅናና ከሁሉም ይበልጣል፡
I am now held captive by the gift of true love,
Redeemed by Your great debt, Lord of hosts from above.
From ashes, You lift me, from the dust I was cast,
Your mercy burdens me, and frees my soul at last.
On earth, there is nothing You have deprived me of,
Your grace is eternal, boundless, limitless love.
When I gaze at myself, I wonder what I am,
Recalling Your kindness, my tears leave my face damp
Alone in solitude, I reminisce my Lord,
Beyond comprehension, His grace I can''t afford.
The fallen forgotten, He raises from the dust,
To all the abandoned, His power is our trust.'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a8f18395-4409-4060-8f4f-b3307e3e8b06'::uuid, 'held-captive-egeziharya-yilma', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kidanish-ayalikim ("ኪዳንሽ አያልቅም")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c58a0960-f176-4750-ac8f-5fe8a6bac5eb'::uuid
      AND deleted_at IS NULL
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kidansh ayalqm Maryam Dingil
Qal set’toshal amlak semayawi qal
Lant’efa lanmot dagmegna
Was hononal simsh metamegna (2)

VERSE 1
Kekidan belay new Dingil yeanchi kidan
T’rgn wiha yibeqal bemljash lemedan
Simun belae seb miskr new ena
Bets’elotsh dinol behewaryat zena

CHORUS
Kidansh ayalqm Maryam Dingil
Qal set’toshal amlak semayawi qal
Lant’efa lanmot dagmegna
Was hononal simsh metamegna (2)

VERSE 2
CHORUS
Yeadam tesfaw nesh medhanit enatu
Beljsh t’efalet yezelalem motu
Behewan miknyat genet bitzega

CHORUS
Kidansh ayalqm Maryam Dingil
Qal set’toshal amlak semayawi qal
Lant’efa lanmot dagmegna
Was hononal simsh metamegna (2)

VERSE 3
Beanchi kefeteln qalun sayzenega
CHORUS
Anchi nesh Maryam yeqereshln zer
Ende sedom t’eften wedqen endanqer

CHORUS
Kidansh ayalqm Maryam Dingil
Qal set’toshal amlak semayawi qal
Lant’efa lanmot dagmegna
Was hononal simsh metamegna (2)

VERSE 4
Egziabher meret’esh nits’nashn wedo
Alemun adane anchin Tewahedo
CHORUS
Dingil Maryam yeamlak enat

CHORUS
Kidansh ayalqm Maryam Dingil
Qal set’toshal amlak semayawi qal
Lant’efa lanmot dagmegna
Was hononal simsh metamegna (2)

VERSE 5
Qirb nesh let’erush kidane mihret
Mihret lemgnln sinch’oh wede anchi
Nigeriw leljsh aych’eknm beanchi

CHORUS
Kidansh ayalqm Maryam Dingil
Qal set’toshal amlak semayawi qal
Lant’efa lanmot dagmegna
Was hononal simsh metamegna (2)'
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)

VERSE 1
ከኪዳን በላይ ነው ድንግል የአንቺ ኪዳን
ጥርኝ ውሃ ይበቃል በምልጃሽ ለመዳን
ስሙን በላኤ ሰብ ምስክር ነው እና
በጸሎትሽ ድኖል በሐዋርያት ዜና

CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)

VERSE 2
አዝ።።።።።።።።።።።።።።።።።።።።
የአዳም ተስፋው ነሽ መድኃኒት እናቱ
በልጅሽ ጠፋለት የዘላለም ሞቱ
በሔዋን ምክንያት ገነት ብትዘጋ

CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)

VERSE 3
በአንቺ ከፈተልን ቃሉን ሳይዘነጋ
አዝ።።።።።።።።።።።።።።።።።።
አንቺ ነሽ ማርያም የቀረሽልን ዘር
እንደ ሰዶም ጠፍተን ወድቀን እንዳንቀር

CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)

VERSE 4
እግዚአብሔር መረጠሽ ንጽናሽን ወዶ
አለሙን አዳነ አንቺን ተዋህዶ
አዝ።።።።።።።።።።።።።።።።።።።
ድንግል ማርያም የአምላክ እናት

CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)

VERSE 5
ቅርብ ነሽ ለጠሩሽ ኪዳነ ምሕረት
ምሕረት ለምኝልን ሥንጮህ ወደ አንቺ
ንገሪው ለልጅሽ አይጨክንም በአንቺ

CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)'
  ) THEN
    NULL; -- Already formatted and transliterated, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = CASE 
          WHEN lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)

VERSE 1
ከኪዳን በላይ ነው ድንግል የአንቺ ኪዳን
ጥርኝ ውሃ ይበቃል በምልጃሽ ለመዳን
ስሙን በላኤ ሰብ ምስክር ነው እና
በጸሎትሽ ድኖል በሐዋርያት ዜና

CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)

VERSE 2
አዝ።።።።።።።።።።።።።።።።።።።።
የአዳም ተስፋው ነሽ መድኃኒት እናቱ
በልጅሽ ጠፋለት የዘላለም ሞቱ
በሔዋን ምክንያት ገነት ብትዘጋ

CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)

VERSE 3
በአንቺ ከፈተልን ቃሉን ሳይዘነጋ
አዝ።።።።።።።።።።።።።።።።።።
አንቺ ነሽ ማርያም የቀረሽልን ዘር
እንደ ሰዶም ጠፍተን ወድቀን እንዳንቀር

CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)

VERSE 4
እግዚአብሔር መረጠሽ ንጽናሽን ወዶ
አለሙን አዳነ አንቺን ተዋህዶ
አዝ።።።።።።።።።።።።።።።።።።።
ድንግል ማርያም የአምላክ እናት

CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)

VERSE 5
ቅርብ ነሽ ለጠሩሽ ኪዳነ ምሕረት
ምሕረት ለምኝልን ሥንጮህ ወደ አንቺ
ንገሪው ለልጅሽ አይጨክንም በአንቺ

CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)' THEN lyrics_amharic 
          ELSE 'CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)

VERSE 1
ከኪዳን በላይ ነው ድንግል የአንቺ ኪዳን
ጥርኝ ውሃ ይበቃል በምልጃሽ ለመዳን
ስሙን በላኤ ሰብ ምስክር ነው እና
በጸሎትሽ ድኖል በሐዋርያት ዜና

CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)

VERSE 2
አዝ።።።።።።።።።።።።።።።።።።።።
የአዳም ተስፋው ነሽ መድኃኒት እናቱ
በልጅሽ ጠፋለት የዘላለም ሞቱ
በሔዋን ምክንያት ገነት ብትዘጋ

CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)

VERSE 3
በአንቺ ከፈተልን ቃሉን ሳይዘነጋ
አዝ።።።።።።።።።።።።።።።።።።
አንቺ ነሽ ማርያም የቀረሽልን ዘር
እንደ ሰዶም ጠፍተን ወድቀን እንዳንቀር

CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)

VERSE 4
እግዚአብሔር መረጠሽ ንጽናሽን ወዶ
አለሙን አዳነ አንቺን ተዋህዶ
አዝ።።።።።።።።።።።።።።።።።።።
ድንግል ማርያም የአምላክ እናት

CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)

VERSE 5
ቅርብ ነሽ ለጠሩሽ ኪዳነ ምሕረት
ምሕረት ለምኝልን ሥንጮህ ወደ አንቺ
ንገሪው ለልጅሽ አይጨክንም በአንቺ

CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)' 
        END,
        lyrics_transliteration = 'CHORUS
Kidansh ayalqm Maryam Dingil
Qal set’toshal amlak semayawi qal
Lant’efa lanmot dagmegna
Was hononal simsh metamegna (2)

VERSE 1
Kekidan belay new Dingil yeanchi kidan
T’rgn wiha yibeqal bemljash lemedan
Simun belae seb miskr new ena
Bets’elotsh dinol behewaryat zena

CHORUS
Kidansh ayalqm Maryam Dingil
Qal set’toshal amlak semayawi qal
Lant’efa lanmot dagmegna
Was hononal simsh metamegna (2)

VERSE 2
CHORUS
Yeadam tesfaw nesh medhanit enatu
Beljsh t’efalet yezelalem motu
Behewan miknyat genet bitzega

CHORUS
Kidansh ayalqm Maryam Dingil
Qal set’toshal amlak semayawi qal
Lant’efa lanmot dagmegna
Was hononal simsh metamegna (2)

VERSE 3
Beanchi kefeteln qalun sayzenega
CHORUS
Anchi nesh Maryam yeqereshln zer
Ende sedom t’eften wedqen endanqer

CHORUS
Kidansh ayalqm Maryam Dingil
Qal set’toshal amlak semayawi qal
Lant’efa lanmot dagmegna
Was hononal simsh metamegna (2)

VERSE 4
Egziabher meret’esh nits’nashn wedo
Alemun adane anchin Tewahedo
CHORUS
Dingil Maryam yeamlak enat

CHORUS
Kidansh ayalqm Maryam Dingil
Qal set’toshal amlak semayawi qal
Lant’efa lanmot dagmegna
Was hononal simsh metamegna (2)

VERSE 5
Qirb nesh let’erush kidane mihret
Mihret lemgnln sinch’oh wede anchi
Nigeriw leljsh aych’eknm beanchi

CHORUS
Kidansh ayalqm Maryam Dingil
Qal set’toshal amlak semayawi qal
Lant’efa lanmot dagmegna
Was hononal simsh metamegna (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c58a0960-f176-4750-ac8f-5fe8a6bac5eb'::uuid
      AND deleted_at IS NULL
      AND (
        lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)

VERSE 1
ከኪዳን በላይ ነው ድንግል የአንቺ ኪዳን
ጥርኝ ውሃ ይበቃል በምልጃሽ ለመዳን
ስሙን በላኤ ሰብ ምስክር ነው እና
በጸሎትሽ ድኖል በሐዋርያት ዜና

CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)

VERSE 2
አዝ።።።።።።።።።።።።።።።።።።።።
የአዳም ተስፋው ነሽ መድኃኒት እናቱ
በልጅሽ ጠፋለት የዘላለም ሞቱ
በሔዋን ምክንያት ገነት ብትዘጋ

CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)

VERSE 3
በአንቺ ከፈተልን ቃሉን ሳይዘነጋ
አዝ።።።።።።።።።።።።።።።።።።
አንቺ ነሽ ማርያም የቀረሽልን ዘር
እንደ ሰዶም ጠፍተን ወድቀን እንዳንቀር

CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)

VERSE 4
እግዚአብሔር መረጠሽ ንጽናሽን ወዶ
አለሙን አዳነ አንቺን ተዋህዶ
አዝ።።።።።።።።።።።።።።።።።።።
ድንግል ማርያም የአምላክ እናት

CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)

VERSE 5
ቅርብ ነሽ ለጠሩሽ ኪዳነ ምሕረት
ምሕረት ለምኝልን ሥንጮህ ወደ አንቺ
ንገሪው ለልጅሽ አይጨክንም በአንቺ

CHORUS
ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)'
        OR lyrics_amharic IS NOT DISTINCT FROM 'ኪዳንሽ አያልቅም ማርያም ድንግል
ቃል ሰጥቶሻል አምላክ ሰማያዊ ቃል
ላንጠፋ ላንሞት ዳግመኛ
ዋስ ሆኖናል ስምሽ መታመኛ(፪)
ከኪዳን በላይ ነው ድንግል የአንቺ ኪዳን
ጥርኝ ውሃ ይበቃል በምልጃሽ ለመዳን
ስሙን በላኤ ሰብ ምስክር ነው እና
በጸሎትሽ ድኖል በሐዋርያት ዜና
አዝ።።።።።።።።።።።።።።።።።።።።
የአዳም ተስፋው ነሽ መድኃኒት እናቱ
በልጅሽ ጠፋለት የዘላለም ሞቱ
በሔዋን ምክንያት ገነት ብትዘጋ
በአንቺ ከፈተልን ቃሉን ሳይዘነጋ
አዝ።።።።።።።።።።።።።።።።።።
አንቺ ነሽ ማርያም የቀረሽልን ዘር
እንደ ሰዶም ጠፍተን ወድቀን እንዳንቀር
እግዚአብሔር መረጠሽ ንጽናሽን ወዶ
አለሙን አዳነ አንቺን ተዋህዶ
አዝ።።።።።።።።።።።።።።።።።።።
ድንግል ማርያም የአምላክ እናት
ቅርብ ነሽ ለጠሩሽ ኪዳነ ምሕረት
ምሕረት ለምኝልን ሥንጮህ ወደ አንቺ
ንገሪው ለልጅሽ አይጨክንም በአንቺ'
      )
      AND (lyrics_transliteration IS NULL OR trim(lyrics_transliteration) = '');
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c58a0960-f176-4750-ac8f-5fe8a6bac5eb'::uuid, 'kidanish-ayalikim', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  RAISE NOTICE 'Batch 29 executed successfully: 34 records processed.';
END $$;

COMMIT;
