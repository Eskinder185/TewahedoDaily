-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 15 OF 32
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
  -- sebatu-menitolayit ("Sebatu Menitolayit")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '035f9338-2b0a-4016-a86a-36b478465d9c'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
በአንቺ ላይ ሲፈጸም እንግዳ ሥርዓት',
        lyrics_transliteration = 'CHORUS
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
Beanchi lay sifets’em engda sirat',
        updated_at = clock_timestamp()::text
    WHERE import_id = '035f9338-2b0a-4016-a86a-36b478465d9c'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '035f9338-2b0a-4016-a86a-36b478465d9c'::uuid, 'sebatu-menitolayit', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yeerefite-enat ("Yeerefite Enat")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '665f8c44-5744-4b9e-b9c8-4e3b6833f1d7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 1
ንፅሕት ድንኻን
በእመነት ያጌጥኩብሽ
ሰላም ሆነ ብአማኒኤል ልጅስ (፪)
የብርሃን

CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 2
ዝናር ባይኖረኝም
በንጉስ ፊት
ተሸልሜ በቆም
በልጅሽ ነው ውቤቴ ማማሩ

CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 3
ብምልጃሽ ነው
ስሜ መቀየረ
በልቤ ላይ
ተነበበ ልጅሽ

CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 4
አሁን ስሜ
ተጠርቷል በልጅሽ
ከታች ብምድር
እሰከሰማይ ድረስ

CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 5
ድርሻዬ ነው
ስምሽን ማወደስ

CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kidane mihret
Yeereft enat
Selam hone
Bianchi amalajnet

VERSE 1
Nits’ht dinኻn
Beemenet yaget’kubsh
Selam hone biamaniel lijs (2)
Yebrhan

CHORUS
Kidane mihret
Yeereft enat
Selam hone
Bianchi amalajnet

VERSE 2
Zinar baynoregnm
Bengus fit
Teshelme beqom
Beljsh new wibete mamaru

CHORUS
Kidane mihret
Yeereft enat
Selam hone
Bianchi amalajnet

VERSE 3
Bimljash new
Sime meqeyere
Belbe lay
Tenebebe lijsh

CHORUS
Kidane mihret
Yeereft enat
Selam hone
Bianchi amalajnet

VERSE 4
Ahun sime
Tet’ertwal beljsh
Ketach bimdr
Esekesemay dires

CHORUS
Kidane mihret
Yeereft enat
Selam hone
Bianchi amalajnet

VERSE 5
Dirshaye new
Simshn mawedes

CHORUS
Kidane mihret
Yeereft enat
Selam hone
Bianchi amalajnet'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 1
ንፅሕት ድንኻን
በእመነት ያጌጥኩብሽ
ሰላም ሆነ ብአማኒኤል ልጅስ (፪)
የብርሃን

CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 2
ዝናር ባይኖረኝም
በንጉስ ፊት
ተሸልሜ በቆም
በልጅሽ ነው ውቤቴ ማማሩ

CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 3
ብምልጃሽ ነው
ስሜ መቀየረ
በልቤ ላይ
ተነበበ ልጅሽ

CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 4
አሁን ስሜ
ተጠርቷል በልጅሽ
ከታች ብምድር
እሰከሰማይ ድረስ

CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 5
ድርሻዬ ነው
ስምሽን ማወደስ

CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት',
        lyrics_transliteration = 'CHORUS
Kidane mihret
Yeereft enat
Selam hone
Bianchi amalajnet

VERSE 1
Nits’ht dinኻn
Beemenet yaget’kubsh
Selam hone biamaniel lijs (2)
Yebrhan

CHORUS
Kidane mihret
Yeereft enat
Selam hone
Bianchi amalajnet

VERSE 2
Zinar baynoregnm
Bengus fit
Teshelme beqom
Beljsh new wibete mamaru

CHORUS
Kidane mihret
Yeereft enat
Selam hone
Bianchi amalajnet

VERSE 3
Bimljash new
Sime meqeyere
Belbe lay
Tenebebe lijsh

CHORUS
Kidane mihret
Yeereft enat
Selam hone
Bianchi amalajnet

VERSE 4
Ahun sime
Tet’ertwal beljsh
Ketach bimdr
Esekesemay dires

CHORUS
Kidane mihret
Yeereft enat
Selam hone
Bianchi amalajnet

VERSE 5
Dirshaye new
Simshn mawedes

CHORUS
Kidane mihret
Yeereft enat
Selam hone
Bianchi amalajnet',
        updated_at = clock_timestamp()::text
    WHERE import_id = '665f8c44-5744-4b9e-b9c8-4e3b6833f1d7'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 1
ንፅሕት ድንኻን
በእመነት ያጌጥኩብሽ
ሰላም ሆነ ብአማኒኤል ልጅስ (፪)
የብርሃን

CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 2
ዝናር ባይኖረኝም
በንጉስ ፊት
ተሸልሜ በቆም
በልጅሽ ነው ውቤቴ ማማሩ

CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 3
ብምልጃሽ ነው
ስሜ መቀየረ
በልቤ ላይ
ተነበበ ልጅሽ

CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 4
አሁን ስሜ
ተጠርቷል በልጅሽ
ከታች ብምድር
እሰከሰማይ ድረስ

CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት

VERSE 5
ድርሻዬ ነው
ስምሽን ማወደስ

CHORUS
ኪዳነ ምህረት
የእረፍት እናት
ሰላም ሆነ
ብኣንቺ ኣማላጅነት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '665f8c44-5744-4b9e-b9c8-4e3b6833f1d7'::uuid, 'yeerefite-enat', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mariyamyene-yene ("‘Mariyamyene yene")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6261d644-917d-4c85-a3df-e4d1146b4f1c'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ይሄን ዘመን ልለፍ(2)',
        lyrics_transliteration = 'CHORUS
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
Yihen zemen lilef (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6261d644-917d-4c85-a3df-e4d1146b4f1c'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6261d644-917d-4c85-a3df-e4d1146b4f1c'::uuid, 'mariyamyene-yene', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ante-bicha ("ANTE BICHA")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '036d2caf-0bf2-4a38-ac6a-b788a09af04e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 1
አልጠግብ እኔ አይሆንህ ካሣ
እስከሽበት ስምህን ባነሣ

CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 2
ያስተማርከኝ የውድህ ፊዴል
የተከልከው በልቤ ወለል
እያነቃኝ አመልክሃለሁ
ካንተ ወዲያ ማንን አውቃለሁ

CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 3
ሰውነቴ ከግፍ ቢጸዳ
ኅሊናዬ አንተን ቢረዳ
ተጠየፈ የሰውን ምርኩዝ
ስታበራ በልቤ መቅረዝ

CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 4
ከእንቅብ በታች በእጅህ ተነሳሁ
በተራራው እግሬን አጸናሁ
መገዛቴ ለፍቅርህ ቀንበር
ሰው አረገኝ አንስቶ ከአፈር

CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 5
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የኔፍሴ መጽናኛ
ተመስገን እግዚአብሔር የነፍሴ መጽናኛ

CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Silefqrh qome baneba
Bafeslh yeqne meba

VERSE 1
Alt’egb ene ayhonh kasa
Eskeshbet simhn banesa

CHORUS
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Silefqrh qome baneba
Bafeslh yeqne meba

VERSE 2
Yastemarkegn yewdh fidel
Yetekelkew belbe welel
Eyaneqagn amelkhalehu
Kante wediya mann awqalehu

CHORUS
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Silefqrh qome baneba
Bafeslh yeqne meba

VERSE 3
Sewnete kegf bits’eda
Hilinaye anten bireda
Tet’eyefe yesewn mirkuz
Sitabera belbe meqrez

CHORUS
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Silefqrh qome baneba
Bafeslh yeqne meba

VERSE 4
Keenqb betach beejh tenesahu
Beteraraw egren ats’enahu
Megezate lefqrh qenber
Sew aregegn ansto keafer

CHORUS
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Silefqrh qome baneba
Bafeslh yeqne meba

VERSE 5
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Temesgen Egziabher yenefse mets’nagna

CHORUS
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Silefqrh qome baneba
Bafeslh yeqne meba'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 1
አልጠግብ እኔ አይሆንህ ካሣ
እስከሽበት ስምህን ባነሣ

CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 2
ያስተማርከኝ የውድህ ፊዴል
የተከልከው በልቤ ወለል
እያነቃኝ አመልክሃለሁ
ካንተ ወዲያ ማንን አውቃለሁ

CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 3
ሰውነቴ ከግፍ ቢጸዳ
ኅሊናዬ አንተን ቢረዳ
ተጠየፈ የሰውን ምርኩዝ
ስታበራ በልቤ መቅረዝ

CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 4
ከእንቅብ በታች በእጅህ ተነሳሁ
በተራራው እግሬን አጸናሁ
መገዛቴ ለፍቅርህ ቀንበር
ሰው አረገኝ አንስቶ ከአፈር

CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 5
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የኔፍሴ መጽናኛ
ተመስገን እግዚአብሔር የነፍሴ መጽናኛ

CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ',
        lyrics_transliteration = 'CHORUS
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Silefqrh qome baneba
Bafeslh yeqne meba

VERSE 1
Alt’egb ene ayhonh kasa
Eskeshbet simhn banesa

CHORUS
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Silefqrh qome baneba
Bafeslh yeqne meba

VERSE 2
Yastemarkegn yewdh fidel
Yetekelkew belbe welel
Eyaneqagn amelkhalehu
Kante wediya mann awqalehu

CHORUS
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Silefqrh qome baneba
Bafeslh yeqne meba

VERSE 3
Sewnete kegf bits’eda
Hilinaye anten bireda
Tet’eyefe yesewn mirkuz
Sitabera belbe meqrez

CHORUS
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Silefqrh qome baneba
Bafeslh yeqne meba

VERSE 4
Keenqb betach beejh tenesahu
Beteraraw egren ats’enahu
Megezate lefqrh qenber
Sew aregegn ansto keafer

CHORUS
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Silefqrh qome baneba
Bafeslh yeqne meba

VERSE 5
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Temesgen Egziabher yenefse mets’nagna

CHORUS
Ante bicha nigus ante bicha dagna
Temesgen iyesus yenefse mets’nagna
Silefqrh qome baneba
Bafeslh yeqne meba',
        updated_at = clock_timestamp()::text
    WHERE import_id = '036d2caf-0bf2-4a38-ac6a-b788a09af04e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 1
አልጠግብ እኔ አይሆንህ ካሣ
እስከሽበት ስምህን ባነሣ

CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 2
ያስተማርከኝ የውድህ ፊዴል
የተከልከው በልቤ ወለል
እያነቃኝ አመልክሃለሁ
ካንተ ወዲያ ማንን አውቃለሁ

CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 3
ሰውነቴ ከግፍ ቢጸዳ
ኅሊናዬ አንተን ቢረዳ
ተጠየፈ የሰውን ምርኩዝ
ስታበራ በልቤ መቅረዝ

CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 4
ከእንቅብ በታች በእጅህ ተነሳሁ
በተራራው እግሬን አጸናሁ
መገዛቴ ለፍቅርህ ቀንበር
ሰው አረገኝ አንስቶ ከአፈር

CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ

VERSE 5
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የኔፍሴ መጽናኛ
ተመስገን እግዚአብሔር የነፍሴ መጽናኛ

CHORUS
አንተ ብቻ ንጉሥ አንተ ብቻ ዳኛ
ተመስገን ኢየሱሥ የነፍሴ መጽናኛ
ስለፍቅርህ ቆሜ ባነባ
ባፈስልህ የቅኔ መባ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '036d2caf-0bf2-4a38-ac6a-b788a09af04e'::uuid, 'ante-bicha', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-tewahdo-mezmur-kabaka-zterekbet ("eritrean tewahdo mezmur kabaka zterekbet")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9e4a2f29-14a6-4e63-8104-5a7e31e91ddc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 1
ኣነ ዉን ጎይታይ ንመስቀልካ ጸይረ
ብዓቢ ሓጎስ ኣብ ቤትካ ከቢረ
እንታይ ውሬታ(3) ክንመልሰልካ ኢና ጎይታ
እንታይ ውሬታሞ እንታይ ውሬታ(2) ክንመልሰልካ ኢና ጎይታ

CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 2
ኣዝ
ብዝርጉሕ ቅልጽም እንተ ዘይሃነጽካ
ድኻም እዩ ጻዕረይ ከንቱ እየ ባርያኻ
ንዝፈርሑኻ ጥበብካ ትምህሮም

CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 3
ኣብ ማእከል ኣሕዛብ ብጸጋ ተንብሮም
እንታይ ውሬታ(3) ክንመልሰልካ ኢና ጎይታ
እንታይ ውሬታሞ እንታይ ውሬታ(2) ክንመልሰልካ ኢና ጎይታ
ኣዝ

CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 4
ተመጣጢረ ብፍቃድ ናይ ርእሰይ
ዓወት ስኢነ ተቆሪጹ ተስፋይ
ንስኻ ግና ንተስፋይ ቀጺልካ
ድሕሪ ደጊምሲ ይኹን ከምፍቃድካ

CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 5
እንታይ ውሬታ(3) ክንመልሰልካ ኢና ጎይታ
እንታይ ውሬታሞ እንታይ ውሬታ(2) ክንመልሰልካ ኢና ጎይታ

CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kabaኻ zitereኽbet mealti hagos elet desta
Kinwdseka ina kinzmrelka melsi wieletatka
Eti bits’aeri binbat zihars
Endaetu hizu biellta yimles

VERSE 1
Ane wun goytay nimesqelka ts’eyre
Biabi hagos ab betka kebire
Entay wireta (3) kinmelselka ina goyta
Entay wiretamo entay wireta (2) kinmelselka ina goyta

CHORUS
Kabaኻ zitereኽbet mealti hagos elet desta
Kinwdseka ina kinzmrelka melsi wieletatka
Eti bits’aeri binbat zihars
Endaetu hizu biellta yimles

VERSE 2
Az
Bizrguh qilts’m ente zeyhanets’ka
Diኻm eyu ts’aerey kentu eye baryaኻ
Nizferhuኻ t’bebka timhrom

CHORUS
Kabaኻ zitereኽbet mealti hagos elet desta
Kinwdseka ina kinzmrelka melsi wieletatka
Eti bits’aeri binbat zihars
Endaetu hizu biellta yimles

VERSE 3
Ab maekel ahzab bits’ega tenbrom
Entay wireta (3) kinmelselka ina goyta
Entay wiretamo entay wireta (2) kinmelselka ina goyta
Az

CHORUS
Kabaኻ zitereኽbet mealti hagos elet desta
Kinwdseka ina kinzmrelka melsi wieletatka
Eti bits’aeri binbat zihars
Endaetu hizu biellta yimles

VERSE 4
Temet’at’ire bifqad nay riesey
Awet siine teqorits’u tesfay
Nisኻ gina nitesfay qets’ilka
Dihri degimsi yiኹn kemfqadka

CHORUS
Kabaኻ zitereኽbet mealti hagos elet desta
Kinwdseka ina kinzmrelka melsi wieletatka
Eti bits’aeri binbat zihars
Endaetu hizu biellta yimles

VERSE 5
Entay wireta (3) kinmelselka ina goyta
Entay wiretamo entay wireta (2) kinmelselka ina goyta

CHORUS
Kabaኻ zitereኽbet mealti hagos elet desta
Kinwdseka ina kinzmrelka melsi wieletatka
Eti bits’aeri binbat zihars
Endaetu hizu biellta yimles'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 1
ኣነ ዉን ጎይታይ ንመስቀልካ ጸይረ
ብዓቢ ሓጎስ ኣብ ቤትካ ከቢረ
እንታይ ውሬታ(3) ክንመልሰልካ ኢና ጎይታ
እንታይ ውሬታሞ እንታይ ውሬታ(2) ክንመልሰልካ ኢና ጎይታ

CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 2
ኣዝ
ብዝርጉሕ ቅልጽም እንተ ዘይሃነጽካ
ድኻም እዩ ጻዕረይ ከንቱ እየ ባርያኻ
ንዝፈርሑኻ ጥበብካ ትምህሮም

CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 3
ኣብ ማእከል ኣሕዛብ ብጸጋ ተንብሮም
እንታይ ውሬታ(3) ክንመልሰልካ ኢና ጎይታ
እንታይ ውሬታሞ እንታይ ውሬታ(2) ክንመልሰልካ ኢና ጎይታ
ኣዝ

CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 4
ተመጣጢረ ብፍቃድ ናይ ርእሰይ
ዓወት ስኢነ ተቆሪጹ ተስፋይ
ንስኻ ግና ንተስፋይ ቀጺልካ
ድሕሪ ደጊምሲ ይኹን ከምፍቃድካ

CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 5
እንታይ ውሬታ(3) ክንመልሰልካ ኢና ጎይታ
እንታይ ውሬታሞ እንታይ ውሬታ(2) ክንመልሰልካ ኢና ጎይታ

CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ',
        lyrics_transliteration = 'CHORUS
Kabaኻ zitereኽbet mealti hagos elet desta
Kinwdseka ina kinzmrelka melsi wieletatka
Eti bits’aeri binbat zihars
Endaetu hizu biellta yimles

VERSE 1
Ane wun goytay nimesqelka ts’eyre
Biabi hagos ab betka kebire
Entay wireta (3) kinmelselka ina goyta
Entay wiretamo entay wireta (2) kinmelselka ina goyta

CHORUS
Kabaኻ zitereኽbet mealti hagos elet desta
Kinwdseka ina kinzmrelka melsi wieletatka
Eti bits’aeri binbat zihars
Endaetu hizu biellta yimles

VERSE 2
Az
Bizrguh qilts’m ente zeyhanets’ka
Diኻm eyu ts’aerey kentu eye baryaኻ
Nizferhuኻ t’bebka timhrom

CHORUS
Kabaኻ zitereኽbet mealti hagos elet desta
Kinwdseka ina kinzmrelka melsi wieletatka
Eti bits’aeri binbat zihars
Endaetu hizu biellta yimles

VERSE 3
Ab maekel ahzab bits’ega tenbrom
Entay wireta (3) kinmelselka ina goyta
Entay wiretamo entay wireta (2) kinmelselka ina goyta
Az

CHORUS
Kabaኻ zitereኽbet mealti hagos elet desta
Kinwdseka ina kinzmrelka melsi wieletatka
Eti bits’aeri binbat zihars
Endaetu hizu biellta yimles

VERSE 4
Temet’at’ire bifqad nay riesey
Awet siine teqorits’u tesfay
Nisኻ gina nitesfay qets’ilka
Dihri degimsi yiኹn kemfqadka

CHORUS
Kabaኻ zitereኽbet mealti hagos elet desta
Kinwdseka ina kinzmrelka melsi wieletatka
Eti bits’aeri binbat zihars
Endaetu hizu biellta yimles

VERSE 5
Entay wireta (3) kinmelselka ina goyta
Entay wiretamo entay wireta (2) kinmelselka ina goyta

CHORUS
Kabaኻ zitereኽbet mealti hagos elet desta
Kinwdseka ina kinzmrelka melsi wieletatka
Eti bits’aeri binbat zihars
Endaetu hizu biellta yimles',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9e4a2f29-14a6-4e63-8104-5a7e31e91ddc'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 1
ኣነ ዉን ጎይታይ ንመስቀልካ ጸይረ
ብዓቢ ሓጎስ ኣብ ቤትካ ከቢረ
እንታይ ውሬታ(3) ክንመልሰልካ ኢና ጎይታ
እንታይ ውሬታሞ እንታይ ውሬታ(2) ክንመልሰልካ ኢና ጎይታ

CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 2
ኣዝ
ብዝርጉሕ ቅልጽም እንተ ዘይሃነጽካ
ድኻም እዩ ጻዕረይ ከንቱ እየ ባርያኻ
ንዝፈርሑኻ ጥበብካ ትምህሮም

CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 3
ኣብ ማእከል ኣሕዛብ ብጸጋ ተንብሮም
እንታይ ውሬታ(3) ክንመልሰልካ ኢና ጎይታ
እንታይ ውሬታሞ እንታይ ውሬታ(2) ክንመልሰልካ ኢና ጎይታ
ኣዝ

CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 4
ተመጣጢረ ብፍቃድ ናይ ርእሰይ
ዓወት ስኢነ ተቆሪጹ ተስፋይ
ንስኻ ግና ንተስፋይ ቀጺልካ
ድሕሪ ደጊምሲ ይኹን ከምፍቃድካ

CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ

VERSE 5
እንታይ ውሬታ(3) ክንመልሰልካ ኢና ጎይታ
እንታይ ውሬታሞ እንታይ ውሬታ(2) ክንመልሰልካ ኢና ጎይታ

CHORUS
ካባኻ ዝተረኽበት መዓልቲ ሓጎስ ዕለት ደስታ
ክንውድሰካ ኢና ክንዝምረልካ መልሲ ውዕለታትካ
እቲ ብጻዕሪ ብንብዓት ዝሓርስ
እንዳእቱ ሒዙ ብእልልታ ይምለስ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9e4a2f29-14a6-4e63-8104-5a7e31e91ddc'::uuid, 'eritrean-tewahdo-mezmur-kabaka-zterekbet', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- anichin-bicha-betelihem-2000 ("Anichin Bicha Betelihem")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '66c918d6-53f9-4d63-a21e-b05eeb9606eb'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 1
ዮሴፍንም አላየንም ሊቶስጥራ ጎልጎታ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 2
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል ብስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስትሰሚ ደንግጠሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ 2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 3
ሕፃኑን ስትወልጂ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደት ነው እንጂ የታሉ በሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 4
የግብፅን በረሀ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነሱ እየፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 5
ሐሙስ ዕለት ፋሲካን ሲበሉ ያመሹ
አርብ ዕለት ተነሥተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበር ላይክዱት መሀላ
ድንግል ካንቺ በቀር ማን ነበር ሌላ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 6
በሠላሳ ዘመን በሥጋ ወራቱ
መች ነበሩ ከቶ ደቀመዛሙርቱ
የእጆቹን ታምራት ቀን ከሌሊት እያየሽ
በቃሉ ብርታት ፊት አንቺ ብቻ ታየሽ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 7
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል መሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 1
Yosefnm alayenm litost’ra golgota

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 2
Gena bemaleda benazretwa meqdes
Gebriel bisrat yizo kegelila siders
Yan zena sitsemi dengt’esh bebrtu
Anchi bicha nebersh bilatenaytu 2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 3
Hits’anun sitwelji girgm yeneberu
Yelum bemekeraw qeranyon feru
Beldet new enji yetalu bemotu
Abreshw yenebersh anchi bicha enatu2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 4
Yegbts’n berehe abrewsh yewet’u
Beqeyafa gibi endemn almet’u
Ersu lemigeref enesu eyeferu
Anchin bicha titew bemender neberu2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 5
Hemus elet fasikan sibelu yameshu
Arb elet tenestew keto wedet sheshu
Qal gebtew neber laykdut mehela
Dingil kanchi beqer man neber lela2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 6
Beselasa zemen besga weratu
Mech neberu keto deqemezamurtu
Yeejochun tamrat qen kelelit eyayesh
Beqalu birtat fit anchi bicha tayesh2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 7
Betelhem yalu qeranyo yelum
Qeranyom yalu girgm alneberum
Behonebet zemen bemesqel memotu
Abreshw yenebersh anchi bicha enatu

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 1
ዮሴፍንም አላየንም ሊቶስጥራ ጎልጎታ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 2
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል ብስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስትሰሚ ደንግጠሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ 2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 3
ሕፃኑን ስትወልጂ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደት ነው እንጂ የታሉ በሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 4
የግብፅን በረሀ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነሱ እየፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 5
ሐሙስ ዕለት ፋሲካን ሲበሉ ያመሹ
አርብ ዕለት ተነሥተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበር ላይክዱት መሀላ
ድንግል ካንቺ በቀር ማን ነበር ሌላ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 6
በሠላሳ ዘመን በሥጋ ወራቱ
መች ነበሩ ከቶ ደቀመዛሙርቱ
የእጆቹን ታምራት ቀን ከሌሊት እያየሽ
በቃሉ ብርታት ፊት አንቺ ብቻ ታየሽ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 7
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል መሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ',
        lyrics_transliteration = 'CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 1
Yosefnm alayenm litost’ra golgota

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 2
Gena bemaleda benazretwa meqdes
Gebriel bisrat yizo kegelila siders
Yan zena sitsemi dengt’esh bebrtu
Anchi bicha nebersh bilatenaytu 2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 3
Hits’anun sitwelji girgm yeneberu
Yelum bemekeraw qeranyon feru
Beldet new enji yetalu bemotu
Abreshw yenebersh anchi bicha enatu2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 4
Yegbts’n berehe abrewsh yewet’u
Beqeyafa gibi endemn almet’u
Ersu lemigeref enesu eyeferu
Anchin bicha titew bemender neberu2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 5
Hemus elet fasikan sibelu yameshu
Arb elet tenestew keto wedet sheshu
Qal gebtew neber laykdut mehela
Dingil kanchi beqer man neber lela2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 6
Beselasa zemen besga weratu
Mech neberu keto deqemezamurtu
Yeejochun tamrat qen kelelit eyayesh
Beqalu birtat fit anchi bicha tayesh2

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta

VERSE 7
Betelhem yalu qeranyo yelum
Qeranyom yalu girgm alneberum
Behonebet zemen bemesqel memotu
Abreshw yenebersh anchi bicha enatu

CHORUS
Anchin bicha betelhem
Anchin bicha beziya girgm
Yohensn begelila beefrata alayenm
Anchin bicha qeranyo anchin bicha bekorebta',
        updated_at = clock_timestamp()::text
    WHERE import_id = '66c918d6-53f9-4d63-a21e-b05eeb9606eb'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 1
ዮሴፍንም አላየንም ሊቶስጥራ ጎልጎታ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 2
ገና በማለዳ በናዝሬቷ መቅደስ
ገብርኤል ብስራት ይዞ ከገሊላ ሲደርስ
ያን ዜና ስትሰሚ ደንግጠሽ በብርቱ
አንቺ ብቻ ነበርሽ ብላቴናይቱ 2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 3
ሕፃኑን ስትወልጂ ግርግም የነበሩ
የሉም በመከራው ቀራንዮን ፈሩ
በልደት ነው እንጂ የታሉ በሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 4
የግብፅን በረሀ አብረውሽ የወጡ
በቀያፋ ግቢ እንደምን አልመጡ
እርሱ ለሚገረፍ እነሱ እየፈሩ
አንቺን ብቻ ትተው በመንደር ነበሩ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 5
ሐሙስ ዕለት ፋሲካን ሲበሉ ያመሹ
አርብ ዕለት ተነሥተው ከቶ ወዴት ሸሹ
ቃል ገብተው ነበር ላይክዱት መሀላ
ድንግል ካንቺ በቀር ማን ነበር ሌላ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 6
በሠላሳ ዘመን በሥጋ ወራቱ
መች ነበሩ ከቶ ደቀመዛሙርቱ
የእጆቹን ታምራት ቀን ከሌሊት እያየሽ
በቃሉ ብርታት ፊት አንቺ ብቻ ታየሽ2

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ

VERSE 7
ቤተልሄም ያሉ ቀራንዮ የሉም
ቀራንዮም ያሉ ግርግም አልነበሩም
በሆነበት ዘመን በመስቀል መሞቱ
አብረሽው የነበርሽ አንቺ ብቻ እናቱ

CHORUS
አንቺን ብቻ ቤተልሔም
አንቺን ብቻ በዚያ ግርግም
ዮሀንስን በገሊላ በኤፍራታ አላየንም
አንቺን ብቻ ቀራንዮ አንቺን ብቻ በኮረብታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '66c918d6-53f9-4d63-a21e-b05eeb9606eb'::uuid, 'anichin-bicha-betelihem-2000', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- fikirih-marekegn-1180 ("Fikirih Marekegn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '672610d3-c760-43fd-b225-316abb98e83d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸክሜ እርቋል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ
እንደ አቅሜ አገኝሃለሁ (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 3
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 4
ጣቴ በገና ይደረድራል
በቀን በሌሊት ያመስግናል (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 5
ክንድህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 6
ባንተ ተመካን በፈጣሪያችን
አዳኝ በሆንከው በንጉሳችን (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 1
Tegezchalehu bewerq demh
Alemn tiche lageleglh
Moth hiywete lene honognal
Bante mekera shekme erqwal

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 2
Lekbrh qome ezemralehu
Ende aqme agegnhalehu (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 3
Midrna semay ell yibelu
Misgana lante yidres eyalu
Mesay yelehm leqdsnah
Aqerbalehugn lante misgana

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 4
T’ate begena yideredral
Beqen belelit yamesgnal (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 5
Kindhn aytew t’elatoch feru
Legetneth wedqew tegezu
Endih neh amlak endih neh Geta
Hulun befqr yemtreta

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 6
Bante temekan befet’ariyachn
Adagn behonkew bengusachn (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸክሜ እርቋል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ
እንደ አቅሜ አገኝሃለሁ (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 3
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 4
ጣቴ በገና ይደረድራል
በቀን በሌሊት ያመስግናል (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 5
ክንድህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 6
ባንተ ተመካን በፈጣሪያችን
አዳኝ በሆንከው በንጉሳችን (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)',
        lyrics_transliteration = 'CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 1
Tegezchalehu bewerq demh
Alemn tiche lageleglh
Moth hiywete lene honognal
Bante mekera shekme erqwal

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 2
Lekbrh qome ezemralehu
Ende aqme agegnhalehu (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 3
Midrna semay ell yibelu
Misgana lante yidres eyalu
Mesay yelehm leqdsnah
Aqerbalehugn lante misgana

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 4
T’ate begena yideredral
Beqen belelit yamesgnal (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 5
Kindhn aytew t’elatoch feru
Legetneth wedqew tegezu
Endih neh amlak endih neh Geta
Hulun befqr yemtreta

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)

VERSE 6
Bante temekan befet’ariyachn
Adagn behonkew bengusachn (X2)

CHORUS
Fiqrh marekegn behywete bezemene
Fiqrh marekegn behywete bezemene
Egziabher lene medhanite
Fiqrh marekegn behywete bezemene (X2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '672610d3-c760-43fd-b225-316abb98e83d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸክሜ እርቋል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ
እንደ አቅሜ አገኝሃለሁ (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 3
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 4
ጣቴ በገና ይደረድራል
በቀን በሌሊት ያመስግናል (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 5
ክንድህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)

VERSE 6
ባንተ ተመካን በፈጣሪያችን
አዳኝ በሆንከው በንጉሳችን (X2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (X2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '672610d3-c760-43fd-b225-316abb98e83d'::uuid, 'fikirih-marekegn-1180', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- werasi-eritrean-orthodox-tewahdo-mezmur-zemari-bereket-tikue ("\ werasi \ Eritrean orthodox tewahdo mezmur \ zemari Bereket Tikue")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '67cd3cf4-04b5-4c1d-9d65-e96f389a3860'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 1
ኣብ ኩሉ ኩነታት ኢየሱሰይ ክበር
ጸልሚቱኒ ድነ ሞት እንክኸበኒ
ሓደኳ ክስእን ተስፋ ዝህበኒ
ብጥቓይ ክትሓልፍ ጎይታይ ሰሚዐ ድምጽኻ

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 2
ወዲ ዳዊት መሓረኒ‘ለ ጸዊዐካ
ደንጊጽካለይ ግልጽ ኢልካ ንምርደእይ
ብምሕረትካ ብርሃን ልበይ ተኸፍተለይ
ዘይንጹህነተይ ሓጢኣተይ ከይከልከለካ

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 3
ትሓቁፈኒ ፈናፍንተይ’ና ኣለኻ
ዓርኪ ኣመናዝርን ቀረጽትን’ና በሉኻ
ንምድሓነይ ብኣይ ሓጥእ ዘይሓፈርካ
ከምቲ ንሓኪም ዘድልይዎ’ቶም ሕሙማት

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 4
ንዓይ ክትደልስ ወሪድካለይ ካብ ሰማያት
ዓስቢ ሓጢኣት’ት ዘይፈደኽዎ ዕዳይ
ከፊልካዮ ጎዳጉደይ ደፊንካለይ
ልብሲ ጸጋ ካባ ሓጎስ ንኽለብስ

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 5
ጥራይ ዝባንካ ተሰቒልካለይ ኢየሱስ
ብዘይትመን ብክቡር ደምካ ዓዲግካኒ
ውሉድ ጸጋ ወራሲ ቤትካ ጌርካኒ
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 6
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር
ኣብ ኩሉ ኩነታት ኢየሱሰይ ክበር

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber

VERSE 1
Ab kulu kunetat iyesusey kiber
Ts’elmituni dine mot enkኸbeni
Hadekwa kisen tesfa zihbeni
Bit’ቓy kithalf goytay semia dimts’ኻ

CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber

VERSE 2
Wedi dawit mehareni‘le ts’ewiaka
Dengits’kaley gilts’ ilka nimrdeey
Bimhretka birhan libey teኸfteley
Zeynts’uhnetey hat’iatey keykelkeleka

CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber

VERSE 3
Tihaqufeni fenafntey’na aleኻ
Arki amenazrn qerets’tn’na beluኻ
Nimdhaney biay hat’e zeyhaferka
Kemti nihakim zedlywo’tom himumat

CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber

VERSE 4
Niay kitdels weridkaley kab semayat
Asbi hat’iat’t zeyfedeኽwo eday
Kefilkayo godagudey definkaley
Libsi ts’ega kaba hagos niኽlebs

CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber

VERSE 5
T’ray zibanka teseቒlkaley Iyesus
Bizeytmen bikbur demka adigkani
Wilud ts’ega werasi betka gerkani
Zerzire aywdon siley ziኾnkayo

CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber

VERSE 6
Aboy niweletka entay’le kewryo
Kab hamed alika seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber
Ab kulu kunetat iyesusey kiber

CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 1
ኣብ ኩሉ ኩነታት ኢየሱሰይ ክበር
ጸልሚቱኒ ድነ ሞት እንክኸበኒ
ሓደኳ ክስእን ተስፋ ዝህበኒ
ብጥቓይ ክትሓልፍ ጎይታይ ሰሚዐ ድምጽኻ

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 2
ወዲ ዳዊት መሓረኒ‘ለ ጸዊዐካ
ደንጊጽካለይ ግልጽ ኢልካ ንምርደእይ
ብምሕረትካ ብርሃን ልበይ ተኸፍተለይ
ዘይንጹህነተይ ሓጢኣተይ ከይከልከለካ

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 3
ትሓቁፈኒ ፈናፍንተይ’ና ኣለኻ
ዓርኪ ኣመናዝርን ቀረጽትን’ና በሉኻ
ንምድሓነይ ብኣይ ሓጥእ ዘይሓፈርካ
ከምቲ ንሓኪም ዘድልይዎ’ቶም ሕሙማት

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 4
ንዓይ ክትደልስ ወሪድካለይ ካብ ሰማያት
ዓስቢ ሓጢኣት’ት ዘይፈደኽዎ ዕዳይ
ከፊልካዮ ጎዳጉደይ ደፊንካለይ
ልብሲ ጸጋ ካባ ሓጎስ ንኽለብስ

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 5
ጥራይ ዝባንካ ተሰቒልካለይ ኢየሱስ
ብዘይትመን ብክቡር ደምካ ዓዲግካኒ
ውሉድ ጸጋ ወራሲ ቤትካ ጌርካኒ
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 6
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር
ኣብ ኩሉ ኩነታት ኢየሱሰይ ክበር

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር',
        lyrics_transliteration = 'CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber

VERSE 1
Ab kulu kunetat iyesusey kiber
Ts’elmituni dine mot enkኸbeni
Hadekwa kisen tesfa zihbeni
Bit’ቓy kithalf goytay semia dimts’ኻ

CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber

VERSE 2
Wedi dawit mehareni‘le ts’ewiaka
Dengits’kaley gilts’ ilka nimrdeey
Bimhretka birhan libey teኸfteley
Zeynts’uhnetey hat’iatey keykelkeleka

CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber

VERSE 3
Tihaqufeni fenafntey’na aleኻ
Arki amenazrn qerets’tn’na beluኻ
Nimdhaney biay hat’e zeyhaferka
Kemti nihakim zedlywo’tom himumat

CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber

VERSE 4
Niay kitdels weridkaley kab semayat
Asbi hat’iat’t zeyfedeኽwo eday
Kefilkayo godagudey definkaley
Libsi ts’ega kaba hagos niኽlebs

CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber

VERSE 5
T’ray zibanka teseቒlkaley Iyesus
Bizeytmen bikbur demka adigkani
Wilud ts’ega werasi betka gerkani
Zerzire aywdon siley ziኾnkayo

CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber

VERSE 6
Aboy niweletka entay’le kewryo
Kab hamed alika seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber
Ab kulu kunetat iyesusey kiber

CHORUS
Zerzire aywdon siley ziኾnkayo
Aboy niweletka entay’le kewryo
Kab hamed alilka seb endiኻ tigebr
Sile ኹlu neger o elshaday kiber',
        updated_at = clock_timestamp()::text
    WHERE import_id = '67cd3cf4-04b5-4c1d-9d65-e96f389a3860'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 1
ኣብ ኩሉ ኩነታት ኢየሱሰይ ክበር
ጸልሚቱኒ ድነ ሞት እንክኸበኒ
ሓደኳ ክስእን ተስፋ ዝህበኒ
ብጥቓይ ክትሓልፍ ጎይታይ ሰሚዐ ድምጽኻ

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 2
ወዲ ዳዊት መሓረኒ‘ለ ጸዊዐካ
ደንጊጽካለይ ግልጽ ኢልካ ንምርደእይ
ብምሕረትካ ብርሃን ልበይ ተኸፍተለይ
ዘይንጹህነተይ ሓጢኣተይ ከይከልከለካ

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 3
ትሓቁፈኒ ፈናፍንተይ’ና ኣለኻ
ዓርኪ ኣመናዝርን ቀረጽትን’ና በሉኻ
ንምድሓነይ ብኣይ ሓጥእ ዘይሓፈርካ
ከምቲ ንሓኪም ዘድልይዎ’ቶም ሕሙማት

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 4
ንዓይ ክትደልስ ወሪድካለይ ካብ ሰማያት
ዓስቢ ሓጢኣት’ት ዘይፈደኽዎ ዕዳይ
ከፊልካዮ ጎዳጉደይ ደፊንካለይ
ልብሲ ጸጋ ካባ ሓጎስ ንኽለብስ

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 5
ጥራይ ዝባንካ ተሰቒልካለይ ኢየሱስ
ብዘይትመን ብክቡር ደምካ ዓዲግካኒ
ውሉድ ጸጋ ወራሲ ቤትካ ጌርካኒ
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር

VERSE 6
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር
ኣብ ኩሉ ኩነታት ኢየሱሰይ ክበር

CHORUS
ዘርዚረ ኣይውድኦን ስለይ ዝኾንካዮ
ኣቦይ ንውዕለትካ እንታይ’ለ ከውርዮ
ካብ ሓመድ ኣልዒልካ ሰብ እንዲኻ ትገብር
ስለ ኹሉ ነገር ኦ ኤልሻዳይ ክበር'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '67cd3cf4-04b5-4c1d-9d65-e96f389a3860'::uuid, 'werasi-eritrean-orthodox-tewahdo-mezmur-zemari-bereket-tikue', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- galatee-famaadhaa-amaa-baraabaraattee ("Galatee famaadhaa amaa baraabaraattee")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '67ece858-b4df-4820-a04f-279ed764544b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 1
Hunda dura akka jirtu
lafaa fi samiin haa dubbatu
Hundi darbees ni jiraatta
yaa Waaqakoo siif galata

CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 2
Baraan hin daanga''uu ulfinniif aangoon kee
Ililleen si faarsa dhaabbadhee fuulakee
Warri kaleessa mootii turan
darbaniiru har''a hin jiran

CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 3
Beektoonni fi ogeessonni
liqimfamanii du''anii
Dhaloonni dhalootaan barri yoo darbu baraan
Ati ni jiraatta mootii bara baraan

CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 4
Ergamoonni samiirratti
ni faarfatu maqaa keetiif
Ilmaan namaa jilbeeffannaan
si waaqessu siif bitamu

CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 5
Dureessa hiyyoomsitee beela''aa quubsita
Addunyaa kanarra eenyuut siin qixxaa

CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 1
Hunda dura akka jirtu
Lafaa fi samiin haa dubbatu
Hundi darbees ni jiraatta
Yaa Waaqakoo siif galata

CHORUS
Galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 2
Baraan hin daanga''uu ulfinniif aangoon kee
Ililleen si faarsa dhaabbadhee fuulakee
Warri kaleessa mootii turan
Darbaniiru har''a hin jiran

CHORUS
Galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 3
Beektoonni fi ogeessonni
Liqimfamanii du''anii
Dhaloonni dhalootaan barri yoo darbu baraan
Ati ni jiraatta mootii bara baraan

CHORUS
Galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 4
Ergamoonni samiirratti
Ni faarfatu maqaa keetiif
Ilmaan namaa jilbeeffannaan
Si waaqessu siif bitamu

CHORUS
Galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 5
Dureessa hiyyoomsitee beela''aa quubsita
Addunyaa kanarra eenyuut siin qixxaa

CHORUS
Galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 1
Hunda dura akka jirtu
lafaa fi samiin haa dubbatu
Hundi darbees ni jiraatta
yaa Waaqakoo siif galata

CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 2
Baraan hin daanga''uu ulfinniif aangoon kee
Ililleen si faarsa dhaabbadhee fuulakee
Warri kaleessa mootii turan
darbaniiru har''a hin jiran

CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 3
Beektoonni fi ogeessonni
liqimfamanii du''anii
Dhaloonni dhalootaan barri yoo darbu baraan
Ati ni jiraatta mootii bara baraan

CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 4
Ergamoonni samiirratti
ni faarfatu maqaa keetiif
Ilmaan namaa jilbeeffannaan
si waaqessu siif bitamu

CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 5
Dureessa hiyyoomsitee beela''aa quubsita
Addunyaa kanarra eenyuut siin qixxaa

CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2',
        lyrics_transliteration = 'CHORUS
Galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 1
Hunda dura akka jirtu
Lafaa fi samiin haa dubbatu
Hundi darbees ni jiraatta
Yaa Waaqakoo siif galata

CHORUS
Galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 2
Baraan hin daanga''uu ulfinniif aangoon kee
Ililleen si faarsa dhaabbadhee fuulakee
Warri kaleessa mootii turan
Darbaniiru har''a hin jiran

CHORUS
Galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 3
Beektoonni fi ogeessonni
Liqimfamanii du''anii
Dhaloonni dhalootaan barri yoo darbu baraan
Ati ni jiraatta mootii bara baraan

CHORUS
Galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 4
Ergamoonni samiirratti
Ni faarfatu maqaa keetiif
Ilmaan namaa jilbeeffannaan
Si waaqessu siif bitamu

CHORUS
Galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 5
Dureessa hiyyoomsitee beela''aa quubsita
Addunyaa kanarra eenyuut siin qixxaa

CHORUS
Galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2',
        updated_at = clock_timestamp()::text
    WHERE import_id = '67ece858-b4df-4820-a04f-279ed764544b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 1
Hunda dura akka jirtu
lafaa fi samiin haa dubbatu
Hundi darbees ni jiraatta
yaa Waaqakoo siif galata

CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 2
Baraan hin daanga''uu ulfinniif aangoon kee
Ililleen si faarsa dhaabbadhee fuulakee
Warri kaleessa mootii turan
darbaniiru har''a hin jiran

CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 3
Beektoonni fi ogeessonni
liqimfamanii du''anii
Dhaloonni dhalootaan barri yoo darbu baraan
Ati ni jiraatta mootii bara baraan

CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 4
Ergamoonni samiirratti
ni faarfatu maqaa keetiif
Ilmaan namaa jilbeeffannaan
si waaqessu siif bitamu

CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2

VERSE 5
Dureessa hiyyoomsitee beela''aa quubsita
Addunyaa kanarra eenyuut siin qixxaa

CHORUS
galatee famaadhaa hamma bara baraatti x 2
Hamma bara baraatti mootiidha ati x 2
Eyyee
Hamma bara baraatti mootiidha ati x 2'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '67ece858-b4df-4820-a04f-279ed764544b'::uuid, 'galatee-famaadhaa-amaa-baraabaraattee', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kidanemhret-tigrigna-orthodox-tewahedo-mezmur ("Kidanemhret Tigrigna Orthodox Tewahedo mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'bdf76c2d-f7fd-4339-9446-b7dacfae3aad'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ

VERSE 1
:::::::::::::::::::::::::::::::::::::::::::
ሳላ ቃል ኪዳንኺ አብ ተስፋይ ጸንዐ
ብአማላድነትኺ ምሕረት ጎይታ ርኤ
ምኽንያት ምድሓነይ መሰላል ናይ ፍቕር

CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ

VERSE 2
ንዓኺ ይትስፍዉ ብሰማይ ብምድር
:::::::::::::::::::::::::::::::::::::::::::
ካብ አመና ፍቕር ልፈልፈለ ብኽያት
አዶነትኺ የስተማቕር ዓጂበ ብንብዓት

CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ

VERSE 3
ስምኺ እንትፅዉዕ እዚ ጎልዳፍ አፈይ
አመና ይበዚሕ ጸጋ በረከተይ
::::::::::::::::::::::::::::::::::::::::::
ዘመኑ ኸፍኡ ኮይኑ አካሒዳ

CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ

VERSE 4
ምድር ብልምልሙ ኮይኑ ምድረ በዳ
ንስኺ እንተለኺ ተስፋ ናይዛ ምድር
ከመይሉ ይተርፍ ከንቱ ኮይኑ ፃዕር
::::::::::::::::::::::::::::::::::::::::::

CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ

VERSE 5
ሕልፊ ዝወላዲ ወላዲት ናይ ስጋይ
ትቀርቢ ትበልፂ ንስኺ እኺ ንዓይ
ቲዘጓነፈኒ ፅቡቕ ይኹን መዓት
ንዓኺ ይነግር አደይ ኪዳነ ምሕረት

CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ

VERSE 6
:::::::::::::::::::::::::::::::::::::::::::
ኪዳነ ምሕረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ

CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kidane mihret bialti wueletay
Selaኺ eyu emo tebarኹ gezay
Entrfi misgana entay kiኸfleki
Nisa eya aቕmey wuhbtoy wagaኺ

VERSE 1
:::::::::::::::::::::::::::::::::::::::::::
Sala qal kidanኺ Ab tesfay ts’ena
Biamaladnetኺ mihret goyta rie
Miኽnyat midhaney meselal nay fiቕr

CHORUS
Kidane mihret bialti wueletay
Selaኺ eyu emo tebarኹ gezay
Entrfi misgana entay kiኸfleki
Nisa eya aቕmey wuhbtoy wagaኺ

VERSE 2
Niaኺ yitsfwu bisemay bimdr
:::::::::::::::::::::::::::::::::::::::::::
Kab amena fiቕr lifelfele biኽyat
Adonetኺ yestemaቕr ajibe binbat

CHORUS
Kidane mihret bialti wueletay
Selaኺ eyu emo tebarኹ gezay
Entrfi misgana entay kiኸfleki
Nisa eya aቕmey wuhbtoy wagaኺ

VERSE 3
Simኺ entts’wue ezi goldaf afey
Amena yibezih ts’ega bereketey
::::::::::::::::::::::::::::::::::::::::::
Zemenu ኸfu koynu akahida

CHORUS
Kidane mihret bialti wueletay
Selaኺ eyu emo tebarኹ gezay
Entrfi misgana entay kiኸfleki
Nisa eya aቕmey wuhbtoy wagaኺ

VERSE 4
Midr bilmlmu koynu midre beda
Nisኺ enteleኺ tesfa nayza midr
Kemeylu yiterf kentu koynu ts’aer
::::::::::::::::::::::::::::::::::::::::::

CHORUS
Kidane mihret bialti wueletay
Selaኺ eyu emo tebarኹ gezay
Entrfi misgana entay kiኸfleki
Nisa eya aቕmey wuhbtoy wagaኺ

VERSE 5
Hilfi ziweladi weladit nay sigay
Tiqerbi tibelts’i nisኺ eኺ niay
Tizegwanefeni ts’buቕ yiኹn meat
Niaኺ yinegr adey kidane mihret

CHORUS
Kidane mihret bialti wueletay
Selaኺ eyu emo tebarኹ gezay
Entrfi misgana entay kiኸfleki
Nisa eya aቕmey wuhbtoy wagaኺ

VERSE 6
:::::::::::::::::::::::::::::::::::::::::::
Kidane mihret bialti wueletay
Selaኺ eyu emo tebarኹ gezay
Entrfi misgana entay kiኸfleki

CHORUS
Kidane mihret bialti wueletay
Selaኺ eyu emo tebarኹ gezay
Entrfi misgana entay kiኸfleki
Nisa eya aቕmey wuhbtoy wagaኺ'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ

VERSE 1
:::::::::::::::::::::::::::::::::::::::::::
ሳላ ቃል ኪዳንኺ አብ ተስፋይ ጸንዐ
ብአማላድነትኺ ምሕረት ጎይታ ርኤ
ምኽንያት ምድሓነይ መሰላል ናይ ፍቕር

CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ

VERSE 2
ንዓኺ ይትስፍዉ ብሰማይ ብምድር
:::::::::::::::::::::::::::::::::::::::::::
ካብ አመና ፍቕር ልፈልፈለ ብኽያት
አዶነትኺ የስተማቕር ዓጂበ ብንብዓት

CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ

VERSE 3
ስምኺ እንትፅዉዕ እዚ ጎልዳፍ አፈይ
አመና ይበዚሕ ጸጋ በረከተይ
::::::::::::::::::::::::::::::::::::::::::
ዘመኑ ኸፍኡ ኮይኑ አካሒዳ

CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ

VERSE 4
ምድር ብልምልሙ ኮይኑ ምድረ በዳ
ንስኺ እንተለኺ ተስፋ ናይዛ ምድር
ከመይሉ ይተርፍ ከንቱ ኮይኑ ፃዕር
::::::::::::::::::::::::::::::::::::::::::

CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ

VERSE 5
ሕልፊ ዝወላዲ ወላዲት ናይ ስጋይ
ትቀርቢ ትበልፂ ንስኺ እኺ ንዓይ
ቲዘጓነፈኒ ፅቡቕ ይኹን መዓት
ንዓኺ ይነግር አደይ ኪዳነ ምሕረት

CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ

VERSE 6
:::::::::::::::::::::::::::::::::::::::::::
ኪዳነ ምሕረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ

CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ',
        lyrics_transliteration = 'CHORUS
Kidane mihret bialti wueletay
Selaኺ eyu emo tebarኹ gezay
Entrfi misgana entay kiኸfleki
Nisa eya aቕmey wuhbtoy wagaኺ

VERSE 1
:::::::::::::::::::::::::::::::::::::::::::
Sala qal kidanኺ Ab tesfay ts’ena
Biamaladnetኺ mihret goyta rie
Miኽnyat midhaney meselal nay fiቕr

CHORUS
Kidane mihret bialti wueletay
Selaኺ eyu emo tebarኹ gezay
Entrfi misgana entay kiኸfleki
Nisa eya aቕmey wuhbtoy wagaኺ

VERSE 2
Niaኺ yitsfwu bisemay bimdr
:::::::::::::::::::::::::::::::::::::::::::
Kab amena fiቕr lifelfele biኽyat
Adonetኺ yestemaቕr ajibe binbat

CHORUS
Kidane mihret bialti wueletay
Selaኺ eyu emo tebarኹ gezay
Entrfi misgana entay kiኸfleki
Nisa eya aቕmey wuhbtoy wagaኺ

VERSE 3
Simኺ entts’wue ezi goldaf afey
Amena yibezih ts’ega bereketey
::::::::::::::::::::::::::::::::::::::::::
Zemenu ኸfu koynu akahida

CHORUS
Kidane mihret bialti wueletay
Selaኺ eyu emo tebarኹ gezay
Entrfi misgana entay kiኸfleki
Nisa eya aቕmey wuhbtoy wagaኺ

VERSE 4
Midr bilmlmu koynu midre beda
Nisኺ enteleኺ tesfa nayza midr
Kemeylu yiterf kentu koynu ts’aer
::::::::::::::::::::::::::::::::::::::::::

CHORUS
Kidane mihret bialti wueletay
Selaኺ eyu emo tebarኹ gezay
Entrfi misgana entay kiኸfleki
Nisa eya aቕmey wuhbtoy wagaኺ

VERSE 5
Hilfi ziweladi weladit nay sigay
Tiqerbi tibelts’i nisኺ eኺ niay
Tizegwanefeni ts’buቕ yiኹn meat
Niaኺ yinegr adey kidane mihret

CHORUS
Kidane mihret bialti wueletay
Selaኺ eyu emo tebarኹ gezay
Entrfi misgana entay kiኸfleki
Nisa eya aቕmey wuhbtoy wagaኺ

VERSE 6
:::::::::::::::::::::::::::::::::::::::::::
Kidane mihret bialti wueletay
Selaኺ eyu emo tebarኹ gezay
Entrfi misgana entay kiኸfleki

CHORUS
Kidane mihret bialti wueletay
Selaኺ eyu emo tebarኹ gezay
Entrfi misgana entay kiኸfleki
Nisa eya aቕmey wuhbtoy wagaኺ',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'bdf76c2d-f7fd-4339-9446-b7dacfae3aad'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ

VERSE 1
:::::::::::::::::::::::::::::::::::::::::::
ሳላ ቃል ኪዳንኺ አብ ተስፋይ ጸንዐ
ብአማላድነትኺ ምሕረት ጎይታ ርኤ
ምኽንያት ምድሓነይ መሰላል ናይ ፍቕር

CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ

VERSE 2
ንዓኺ ይትስፍዉ ብሰማይ ብምድር
:::::::::::::::::::::::::::::::::::::::::::
ካብ አመና ፍቕር ልፈልፈለ ብኽያት
አዶነትኺ የስተማቕር ዓጂበ ብንብዓት

CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ

VERSE 3
ስምኺ እንትፅዉዕ እዚ ጎልዳፍ አፈይ
አመና ይበዚሕ ጸጋ በረከተይ
::::::::::::::::::::::::::::::::::::::::::
ዘመኑ ኸፍኡ ኮይኑ አካሒዳ

CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ

VERSE 4
ምድር ብልምልሙ ኮይኑ ምድረ በዳ
ንስኺ እንተለኺ ተስፋ ናይዛ ምድር
ከመይሉ ይተርፍ ከንቱ ኮይኑ ፃዕር
::::::::::::::::::::::::::::::::::::::::::

CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ

VERSE 5
ሕልፊ ዝወላዲ ወላዲት ናይ ስጋይ
ትቀርቢ ትበልፂ ንስኺ እኺ ንዓይ
ቲዘጓነፈኒ ፅቡቕ ይኹን መዓት
ንዓኺ ይነግር አደይ ኪዳነ ምሕረት

CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ

VERSE 6
:::::::::::::::::::::::::::::::::::::::::::
ኪዳነ ምሕረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ

CHORUS
ኪዳነ ምህረት ብዓልቲ ዉዕለታይ
ሰላኺ እዩ እሞ ተባርኹ ገዛይ
እንትርፊ ምስጋና እንታይ ክኸፍለኪ
ንሳ እያ ዓቕመይ ዉህብቶይ ዋጋኺ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'bdf76c2d-f7fd-4339-9446-b7dacfae3aad'::uuid, 'kidanemhret-tigrigna-orthodox-tewahedo-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kiristos-waaqako-zemarit-fasika-mekonnen ("KIRISTOS WAAQAKO Zemarit Fasika Mekonnen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '4d9970a4-f301-48e2-8c2f-9b3790e3fb93'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
Iyesusi kiristos waaqa koo',
        lyrics_transliteration = 'CHORUS
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
Iyesusi kiristos waaqa koo',
        updated_at = clock_timestamp()::text
    WHERE import_id = '4d9970a4-f301-48e2-8c2f-9b3790e3fb93'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '4d9970a4-f301-48e2-8c2f-9b3790e3fb93'::uuid, 'kiristos-waaqako-zemarit-fasika-mekonnen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- lene-yederegew-mikaiel-bizu-new ("Lene Yederegew Mikaiel Bizu New")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '03ff5ee9-d2ee-498d-91ae-eeb55e635fdf'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
አፅነኝና እርዳት ሚካኤል ሆነኝ',
        lyrics_transliteration = 'CHORUS
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
Atsenegnna erdat Mikaiel honegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '03ff5ee9-d2ee-498d-91ae-eeb55e635fdf'::uuid
      AND deleted_at IS NULL
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
Atsenegnna erdat Mikaiel honegn';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '03ff5ee9-d2ee-498d-91ae-eeb55e635fdf'::uuid, 'lene-yederegew-mikaiel-bizu-new', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bizu-lifat-sibeza-yihinin-zemiru ("Bizu Lifat Sibeza Yihinin Zemiru")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '04368e5d-0d79-4e6d-8ce5-3f522a837816'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
እጅህ ከእኛ ጋር በጥበብ ይሰራል',
        lyrics_transliteration = 'CHORUS
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
Ejh keegna gar bet’beb yiseral',
        updated_at = clock_timestamp()::text
    WHERE import_id = '04368e5d-0d79-4e6d-8ce5-3f522a837816'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '04368e5d-0d79-4e6d-8ce5-3f522a837816'::uuid, 'bizu-lifat-sibeza-yihinin-zemiru', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- emun-arki-lbey-by-zemari-henok-fikadu-eritrean-orthodox-tewahdo-mezmur ("~Emun Arki Lbey~By Zemari Henok Fikadu~ Eritrean Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '687fd3c0-c2a4-4aa3-86ee-40b393a8e261'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 1
ፍቕሩ ገሊጹለይ፡ ''ዛ ሕይወቱ ሂቡ፡
ዘየዳሉ አምላክ፡ ሓዳግ''ዩ ንዅሉ፡
ክብሉኻ ሰሚዐስ፡ ብለይቲ መጺአ''ሎኹ፡
ረቡኒ መሃረኒ፡ ''ቲ ናይ ሰማይ ሃብቲ፡ ከመይ ከም ምዃኑ፡

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 2
ድነ ጸልማት ኰይኑ፡ ጕዕዞ ናይ ሕይወተይ፡
''ዛ ልበይ ኪህበካስ፡ ብርሃነይ ኩነኒ፡ ኢየሱስ ንጉሠይ።
ንናተይ ዕዳ፡ ንስኻ ክትከፍሎ፡
ንአበሳይ፡ ኣብ ዝባንካ ክትጾሮ፡

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 3
ብዓይነይ ርእየ''የ፡ ኣብቲ ቀራንዮ፡.
ፍቕርኻ ኪትገልጽ፡ ንሞተይ ሞይትካዮ፡
ኣዝ
ካባኻ ብምህዳመይ፡ ትእዛዝካ ጥሒሰ፡

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 4
ኣብዛ ቅድሚ ዓይነይ፡ ይሰቕሉኻ''ዶ ኢለ፡
ፍቱወይ በዲለካ፡ ግብረይ ኣሕፊሩኒ፡ ኣነስ ተጣዒሰ፡
ምሕረቱ ዘይውዳእ፡ አቦ ፍቕሪ ኢኻ''ሞ፡
ገስጸኒ እምበር፡ ኣይትመንነኒ፡ ኪዳንካ ዘክሮ፡

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 5
ንናተይ ዕዳ፡ ንስኻ ክትከፍሎ፡
ንአበሳይ፡ ኣብ ዝባንካ ክትጾሮ፡
ብዓይነይ ርእየ''የ፡ ኣብቲ ቀራንዮ፡
ፍቕርኻ ክትገልጽ ንሞተይ ሞትካዮ

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 6
ኣዝ
ንኽረኽበካ ኢለ፡ ክንደይ ዲየ ደይበ፡
''ሰንኪ ሕጽረት ግብረይ፡ ክርእየካ ከመይ''ለ፡
ኣብ ጫውጫውታ ህዝቢ፡ ንድምጸይ ትሰምዖ፡ ተቕልበለይ''ዶ ኢለ፡

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 7
ድሌት ውሽጢ ልበይ፡ እትፈልጥ ልብኻ፡
ምሳይ''ያ ዘምሰየት፡ ምድኃን ውሽጢ ቤተይ፡ ንኽትመልስ ኢላ።
እዚ ዋና ልበይ፡ ክንደይ የፍቅረኒ፡
ዓቀብ ቍልቍል፡ ወሪዱ መጺኡኒ

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 8
ውሽጢ ቤተይ ኣምስዩስ፡ ምሳይ እንክድረር፡
ዓጊበ''የ በቃ፡ ርእየ ''ዚ ተአምር።

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Wey''zi lewah gweytay emun arki libey
Fits’um ayeኽalon ane bimt’faay
Aelaf melaektu ''kelewu ab zuryau🏼
Niay niኽdeli kab semay weridu

VERSE 1
Fiቕru gelits’uley ''za hiywetu hibu
Zeyedalu amlak hadag''yu nikhwlu
Kibluኻ semias bileyti mets’ia''loኹ
Rebuni mehareni ''ti nay semay habti kemey kem mikhwanu

CHORUS
Wey''zi lewah gweytay emun arki libey
Fits’um ayeኽalon ane bimt’faay
Aelaf melaektu ''kelewu ab zuryau🏼
Niay niኽdeli kab semay weridu

VERSE 2
Dine ts’elmat kweynu gwezo nay hiywetey
''za libey kihbekas birhaney kuneni Iyesus nigusey.
Ninatey eda nisኻ kitkeflo
Niabesay ab zibanka kitts’oro

CHORUS
Wey''zi lewah gweytay emun arki libey
Fits’um ayeኽalon ane bimt’faay
Aelaf melaektu ''kelewu ab zuryau🏼
Niay niኽdeli kab semay weridu

VERSE 3
Biayney rieye''ye abti qeranyo .
Fiቕrኻ kitgelts’ nimotey moytkayo
Az
Kabaኻ bimhdamey tiezazka t’hise

CHORUS
Wey''zi lewah gweytay emun arki libey
Fits’um ayeኽalon ane bimt’faay
Aelaf melaektu ''kelewu ab zuryau🏼
Niay niኽdeli kab semay weridu

VERSE 4
Abza qidmi ayney yiseቕluኻ''do ile
Fituwey bedileka gibrey ahfiruni anes tet’aise
Mihretu zeywdae abo fiቕri iኻ''mo
Gests’eni ember aytmenneni kidanka zekro

CHORUS
Wey''zi lewah gweytay emun arki libey
Fits’um ayeኽalon ane bimt’faay
Aelaf melaektu ''kelewu ab zuryau🏼
Niay niኽdeli kab semay weridu

VERSE 5
Ninatey eda nisኻ kitkeflo
Niabesay ab zibanka kitts’oro
Biayney rieye''ye abti qeranyo
Fiቕrኻ kitgelts’ nimotey motkayo

CHORUS
Wey''zi lewah gweytay emun arki libey
Fits’um ayeኽalon ane bimt’faay
Aelaf melaektu ''kelewu ab zuryau🏼
Niay niኽdeli kab semay weridu

VERSE 6
Az
Niኽreኽbeka ile kindey diye deybe
''senki hits’ret gibrey kireyeka kemey''le
Ab ch’awch’awta hizbi nidmts’ey tisemo teቕlbeley''do ile

CHORUS
Wey''zi lewah gweytay emun arki libey
Fits’um ayeኽalon ane bimt’faay
Aelaf melaektu ''kelewu ab zuryau🏼
Niay niኽdeli kab semay weridu

VERSE 7
Dilet wisht’i libey etfelt’ libኻ
Misay''ya zemseyet midhan wisht’i betey niኽtmels ila.
Ezi wana libey kindey yefqreni
Aqeb qwlqwl weridu mets’iuni

CHORUS
Wey''zi lewah gweytay emun arki libey
Fits’um ayeኽalon ane bimt’faay
Aelaf melaektu ''kelewu ab zuryau🏼
Niay niኽdeli kab semay weridu

VERSE 8
Wisht’i betey amsyus misay enkdrer
Agibe''ye beqa rieye ''zi teamr.

CHORUS
Wey''zi lewah gweytay emun arki libey
Fits’um ayeኽalon ane bimt’faay
Aelaf melaektu ''kelewu ab zuryau🏼
Niay niኽdeli kab semay weridu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 1
ፍቕሩ ገሊጹለይ፡ ''ዛ ሕይወቱ ሂቡ፡
ዘየዳሉ አምላክ፡ ሓዳግ''ዩ ንዅሉ፡
ክብሉኻ ሰሚዐስ፡ ብለይቲ መጺአ''ሎኹ፡
ረቡኒ መሃረኒ፡ ''ቲ ናይ ሰማይ ሃብቲ፡ ከመይ ከም ምዃኑ፡

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 2
ድነ ጸልማት ኰይኑ፡ ጕዕዞ ናይ ሕይወተይ፡
''ዛ ልበይ ኪህበካስ፡ ብርሃነይ ኩነኒ፡ ኢየሱስ ንጉሠይ።
ንናተይ ዕዳ፡ ንስኻ ክትከፍሎ፡
ንአበሳይ፡ ኣብ ዝባንካ ክትጾሮ፡

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 3
ብዓይነይ ርእየ''የ፡ ኣብቲ ቀራንዮ፡.
ፍቕርኻ ኪትገልጽ፡ ንሞተይ ሞይትካዮ፡
ኣዝ
ካባኻ ብምህዳመይ፡ ትእዛዝካ ጥሒሰ፡

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 4
ኣብዛ ቅድሚ ዓይነይ፡ ይሰቕሉኻ''ዶ ኢለ፡
ፍቱወይ በዲለካ፡ ግብረይ ኣሕፊሩኒ፡ ኣነስ ተጣዒሰ፡
ምሕረቱ ዘይውዳእ፡ አቦ ፍቕሪ ኢኻ''ሞ፡
ገስጸኒ እምበር፡ ኣይትመንነኒ፡ ኪዳንካ ዘክሮ፡

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 5
ንናተይ ዕዳ፡ ንስኻ ክትከፍሎ፡
ንአበሳይ፡ ኣብ ዝባንካ ክትጾሮ፡
ብዓይነይ ርእየ''የ፡ ኣብቲ ቀራንዮ፡
ፍቕርኻ ክትገልጽ ንሞተይ ሞትካዮ

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 6
ኣዝ
ንኽረኽበካ ኢለ፡ ክንደይ ዲየ ደይበ፡
''ሰንኪ ሕጽረት ግብረይ፡ ክርእየካ ከመይ''ለ፡
ኣብ ጫውጫውታ ህዝቢ፡ ንድምጸይ ትሰምዖ፡ ተቕልበለይ''ዶ ኢለ፡

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 7
ድሌት ውሽጢ ልበይ፡ እትፈልጥ ልብኻ፡
ምሳይ''ያ ዘምሰየት፡ ምድኃን ውሽጢ ቤተይ፡ ንኽትመልስ ኢላ።
እዚ ዋና ልበይ፡ ክንደይ የፍቅረኒ፡
ዓቀብ ቍልቍል፡ ወሪዱ መጺኡኒ

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 8
ውሽጢ ቤተይ ኣምስዩስ፡ ምሳይ እንክድረር፡
ዓጊበ''የ በቃ፡ ርእየ ''ዚ ተአምር።

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡',
        lyrics_transliteration = 'CHORUS
Wey''zi lewah gweytay emun arki libey
Fits’um ayeኽalon ane bimt’faay
Aelaf melaektu ''kelewu ab zuryau🏼
Niay niኽdeli kab semay weridu

VERSE 1
Fiቕru gelits’uley ''za hiywetu hibu
Zeyedalu amlak hadag''yu nikhwlu
Kibluኻ semias bileyti mets’ia''loኹ
Rebuni mehareni ''ti nay semay habti kemey kem mikhwanu

CHORUS
Wey''zi lewah gweytay emun arki libey
Fits’um ayeኽalon ane bimt’faay
Aelaf melaektu ''kelewu ab zuryau🏼
Niay niኽdeli kab semay weridu

VERSE 2
Dine ts’elmat kweynu gwezo nay hiywetey
''za libey kihbekas birhaney kuneni Iyesus nigusey.
Ninatey eda nisኻ kitkeflo
Niabesay ab zibanka kitts’oro

CHORUS
Wey''zi lewah gweytay emun arki libey
Fits’um ayeኽalon ane bimt’faay
Aelaf melaektu ''kelewu ab zuryau🏼
Niay niኽdeli kab semay weridu

VERSE 3
Biayney rieye''ye abti qeranyo .
Fiቕrኻ kitgelts’ nimotey moytkayo
Az
Kabaኻ bimhdamey tiezazka t’hise

CHORUS
Wey''zi lewah gweytay emun arki libey
Fits’um ayeኽalon ane bimt’faay
Aelaf melaektu ''kelewu ab zuryau🏼
Niay niኽdeli kab semay weridu

VERSE 4
Abza qidmi ayney yiseቕluኻ''do ile
Fituwey bedileka gibrey ahfiruni anes tet’aise
Mihretu zeywdae abo fiቕri iኻ''mo
Gests’eni ember aytmenneni kidanka zekro

CHORUS
Wey''zi lewah gweytay emun arki libey
Fits’um ayeኽalon ane bimt’faay
Aelaf melaektu ''kelewu ab zuryau🏼
Niay niኽdeli kab semay weridu

VERSE 5
Ninatey eda nisኻ kitkeflo
Niabesay ab zibanka kitts’oro
Biayney rieye''ye abti qeranyo
Fiቕrኻ kitgelts’ nimotey motkayo

CHORUS
Wey''zi lewah gweytay emun arki libey
Fits’um ayeኽalon ane bimt’faay
Aelaf melaektu ''kelewu ab zuryau🏼
Niay niኽdeli kab semay weridu

VERSE 6
Az
Niኽreኽbeka ile kindey diye deybe
''senki hits’ret gibrey kireyeka kemey''le
Ab ch’awch’awta hizbi nidmts’ey tisemo teቕlbeley''do ile

CHORUS
Wey''zi lewah gweytay emun arki libey
Fits’um ayeኽalon ane bimt’faay
Aelaf melaektu ''kelewu ab zuryau🏼
Niay niኽdeli kab semay weridu

VERSE 7
Dilet wisht’i libey etfelt’ libኻ
Misay''ya zemseyet midhan wisht’i betey niኽtmels ila.
Ezi wana libey kindey yefqreni
Aqeb qwlqwl weridu mets’iuni

CHORUS
Wey''zi lewah gweytay emun arki libey
Fits’um ayeኽalon ane bimt’faay
Aelaf melaektu ''kelewu ab zuryau🏼
Niay niኽdeli kab semay weridu

VERSE 8
Wisht’i betey amsyus misay enkdrer
Agibe''ye beqa rieye ''zi teamr.

CHORUS
Wey''zi lewah gweytay emun arki libey
Fits’um ayeኽalon ane bimt’faay
Aelaf melaektu ''kelewu ab zuryau🏼
Niay niኽdeli kab semay weridu',
        updated_at = clock_timestamp()::text
    WHERE import_id = '687fd3c0-c2a4-4aa3-86ee-40b393a8e261'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 1
ፍቕሩ ገሊጹለይ፡ ''ዛ ሕይወቱ ሂቡ፡
ዘየዳሉ አምላክ፡ ሓዳግ''ዩ ንዅሉ፡
ክብሉኻ ሰሚዐስ፡ ብለይቲ መጺአ''ሎኹ፡
ረቡኒ መሃረኒ፡ ''ቲ ናይ ሰማይ ሃብቲ፡ ከመይ ከም ምዃኑ፡

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 2
ድነ ጸልማት ኰይኑ፡ ጕዕዞ ናይ ሕይወተይ፡
''ዛ ልበይ ኪህበካስ፡ ብርሃነይ ኩነኒ፡ ኢየሱስ ንጉሠይ።
ንናተይ ዕዳ፡ ንስኻ ክትከፍሎ፡
ንአበሳይ፡ ኣብ ዝባንካ ክትጾሮ፡

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 3
ብዓይነይ ርእየ''የ፡ ኣብቲ ቀራንዮ፡.
ፍቕርኻ ኪትገልጽ፡ ንሞተይ ሞይትካዮ፡
ኣዝ
ካባኻ ብምህዳመይ፡ ትእዛዝካ ጥሒሰ፡

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 4
ኣብዛ ቅድሚ ዓይነይ፡ ይሰቕሉኻ''ዶ ኢለ፡
ፍቱወይ በዲለካ፡ ግብረይ ኣሕፊሩኒ፡ ኣነስ ተጣዒሰ፡
ምሕረቱ ዘይውዳእ፡ አቦ ፍቕሪ ኢኻ''ሞ፡
ገስጸኒ እምበር፡ ኣይትመንነኒ፡ ኪዳንካ ዘክሮ፡

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 5
ንናተይ ዕዳ፡ ንስኻ ክትከፍሎ፡
ንአበሳይ፡ ኣብ ዝባንካ ክትጾሮ፡
ብዓይነይ ርእየ''የ፡ ኣብቲ ቀራንዮ፡
ፍቕርኻ ክትገልጽ ንሞተይ ሞትካዮ

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 6
ኣዝ
ንኽረኽበካ ኢለ፡ ክንደይ ዲየ ደይበ፡
''ሰንኪ ሕጽረት ግብረይ፡ ክርእየካ ከመይ''ለ፡
ኣብ ጫውጫውታ ህዝቢ፡ ንድምጸይ ትሰምዖ፡ ተቕልበለይ''ዶ ኢለ፡

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 7
ድሌት ውሽጢ ልበይ፡ እትፈልጥ ልብኻ፡
ምሳይ''ያ ዘምሰየት፡ ምድኃን ውሽጢ ቤተይ፡ ንኽትመልስ ኢላ።
እዚ ዋና ልበይ፡ ክንደይ የፍቅረኒ፡
ዓቀብ ቍልቍል፡ ወሪዱ መጺኡኒ

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡

VERSE 8
ውሽጢ ቤተይ ኣምስዩስ፡ ምሳይ እንክድረር፡
ዓጊበ''የ በቃ፡ ርእየ ''ዚ ተአምር።

CHORUS
ወይ''ዚ ለዋህ ጐይታይ፡ እሙን ዓርኪ ልበይ፡
ፍጹም ኣየኽኣሎን፡ ኣነ ብምጥፋአይ፡
ኣእላፍ መላእክቱ፡ ''ከለዉ ኣብ ዙርያኡ🏼
ንዓይ ንኽደሊ፡ ካብ ሰማይ ወሪዱ፡'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '687fd3c0-c2a4-4aa3-86ee-40b393a8e261'::uuid, 'emun-arki-lbey-by-zemari-henok-fikadu-eritrean-orthodox-tewahdo-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yichen-met-tewgne ("yichen met tewgne")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f233856b-2867-4382-8be4-141f9a3ef40a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
አውቃለሁ አምላኬ ፍሬየን ለመልቀም እንዳመላለስኩህ ፤'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Awqalehu amlake fireyen lemelqem endamelaleskuh ;'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f233856b-2867-4382-8be4-141f9a3ef40a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
አውቃለሁ አምላኬ ፍሬየን ለመልቀም እንዳመላለስኩህ ፤'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f233856b-2867-4382-8be4-141f9a3ef40a'::uuid, 'yichen-met-tewgne', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-4024 ("Eritrean Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b8c22fb3-8d3f-45d7-8113-f8c994edd1ad'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 1
ብተምሳል ግብርኻ ምስልኻ ኣብ ዙርያይ ከቢቡኒ ይነብር
መንፈስካ ሓይልኻን ብእምነት ሰኒቀ ማዕበል ባሕሪ ይሰግር
ኣዝ. . .
ኣብቲ ጉዕዞ ህይወት ስቅታ ከም ጽላሎት ደድሕረይ ክመጽእ

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 2
ሰላም ርሒቁኒ ተገሪሙ ልበይ ምፍጣረይ ክጸልእ
ብሃንደበት መጺኡ ድምጸይ ከይሰምዐ ማዕጹኡ መን ኣርሕዩ
ደበስ ኮይኑ ቃሉ ተስፋይ ዘሐደሰ ድሕነተይ ተመንዩ
ኣዝ. . .

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 3
ነፍሰይ ነይሰኣነት ኣብ ሕቅፍኡ ዘሙቋ ዝሓልየላ ኣብሊጹ
ባዲመ ኽይተርፍ ካብ ምልኣቱ ጸጋ ኣብ ውሽጠይ ኣስሪጹ
አምላኸይ መድሕነይ ኣይገድፈንን በይነይ ምሳይ ኣሎ ኩሉ
ካብ በላዒ ካብቲ ሓያል ጥዑም ዘውጽእ እንድዩ ሓይሉ

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 4
ኣዝ. . .
መርዛም ቀስቲ ሰባት ቃላት ተጠሚዑ ሕልናይ ከቁስል
ክብረት ከምዘይብሉ በቃ ዕዙም ኮይነ በይኑ ዘስተማስል
ሕያዋይ ሳምራዊ ገጽ ሰባት ከይጥምት ኣይፈቀደን ልቡ

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 5
ምሒር ካብ ምፍቃፉስ ክብረት ከንግሰለይ ወዱ በጃ ሂቡ
ኣዝ. . .
ቤተይ ካብ መጻእካ ዘፈርፈር ክዳንካ ልበይ ክትንክዮ
ውሉድካ ክኸውን ካብ ሃብካኒ መሰል ብምስጢር ቀራንዮ

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 6
ንዘይገደፍካኒ ናይ ሰላም መንፈስካ ካባይ ንክኽእለ
ቃለይ ቃል ልሳነይ ቃንዩ’ለኹ ጎይታይ ንምስጋናኻ ኢለ
ኣዝ. . .

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye

VERSE 1
Bitemsal gibrኻ mislኻ ab zuryay kebibuni yinebr
Menfeska haylኻn biemnet seniqe maebel bahri yisegr
Az. . .
Abti guezo hiywet siqta kem ts’lalot dedhrey kimets’e

CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye

VERSE 2
Selam rihiquni tegerimu libey mift’arey kits’ele
Bihandebet mets’iu dimts’ey keysema maets’uu men arhyu
Debes koynu qalu tesfay zehedese dihnetey temenyu
Az. . .

CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye

VERSE 3
Nefsey neyseanet ab hiqfu zemuqwa zihalyela ablits’u
Badime ኽyterf kab milatu ts’ega ab wisht’ey asrits’u
Amlaኸy medhney aygedfenn beyney misay alo kulu
Kab belai kabti hayal t’um zewts’e endyu haylu

CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye

VERSE 4
Az. . .
Merzam qesti sebat qalat tet’emiu hilnay kequsl
Kibret kemzeyblu beqa ezum koyne beynu zestemasl
Hiyaway samrawi gets’ sebat keyt’mt ayfeqeden libu

CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye

VERSE 5
Mihir kab mifqafus kibret kengseley wedu beja hibu
Az. . .
Betey kab mets’aeka zeferfer kidanka libey kitnkyo
Wiludka kiኸwn kab habkani mesel bimst’ir qeranyo

CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye

VERSE 6
Nizeygedefkani nay selam menfeska kabay nikኽele
Qaley qal lisaney qanyu’leኹ goytay nimsganaኻ ile
Az. . .

CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 1
ብተምሳል ግብርኻ ምስልኻ ኣብ ዙርያይ ከቢቡኒ ይነብር
መንፈስካ ሓይልኻን ብእምነት ሰኒቀ ማዕበል ባሕሪ ይሰግር
ኣዝ. . .
ኣብቲ ጉዕዞ ህይወት ስቅታ ከም ጽላሎት ደድሕረይ ክመጽእ

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 2
ሰላም ርሒቁኒ ተገሪሙ ልበይ ምፍጣረይ ክጸልእ
ብሃንደበት መጺኡ ድምጸይ ከይሰምዐ ማዕጹኡ መን ኣርሕዩ
ደበስ ኮይኑ ቃሉ ተስፋይ ዘሐደሰ ድሕነተይ ተመንዩ
ኣዝ. . .

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 3
ነፍሰይ ነይሰኣነት ኣብ ሕቅፍኡ ዘሙቋ ዝሓልየላ ኣብሊጹ
ባዲመ ኽይተርፍ ካብ ምልኣቱ ጸጋ ኣብ ውሽጠይ ኣስሪጹ
አምላኸይ መድሕነይ ኣይገድፈንን በይነይ ምሳይ ኣሎ ኩሉ
ካብ በላዒ ካብቲ ሓያል ጥዑም ዘውጽእ እንድዩ ሓይሉ

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 4
ኣዝ. . .
መርዛም ቀስቲ ሰባት ቃላት ተጠሚዑ ሕልናይ ከቁስል
ክብረት ከምዘይብሉ በቃ ዕዙም ኮይነ በይኑ ዘስተማስል
ሕያዋይ ሳምራዊ ገጽ ሰባት ከይጥምት ኣይፈቀደን ልቡ

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 5
ምሒር ካብ ምፍቃፉስ ክብረት ከንግሰለይ ወዱ በጃ ሂቡ
ኣዝ. . .
ቤተይ ካብ መጻእካ ዘፈርፈር ክዳንካ ልበይ ክትንክዮ
ውሉድካ ክኸውን ካብ ሃብካኒ መሰል ብምስጢር ቀራንዮ

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 6
ንዘይገደፍካኒ ናይ ሰላም መንፈስካ ካባይ ንክኽእለ
ቃለይ ቃል ልሳነይ ቃንዩ’ለኹ ጎይታይ ንምስጋናኻ ኢለ
ኣዝ. . .

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ',
        lyrics_transliteration = 'CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye

VERSE 1
Bitemsal gibrኻ mislኻ ab zuryay kebibuni yinebr
Menfeska haylኻn biemnet seniqe maebel bahri yisegr
Az. . .
Abti guezo hiywet siqta kem ts’lalot dedhrey kimets’e

CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye

VERSE 2
Selam rihiquni tegerimu libey mift’arey kits’ele
Bihandebet mets’iu dimts’ey keysema maets’uu men arhyu
Debes koynu qalu tesfay zehedese dihnetey temenyu
Az. . .

CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye

VERSE 3
Nefsey neyseanet ab hiqfu zemuqwa zihalyela ablits’u
Badime ኽyterf kab milatu ts’ega ab wisht’ey asrits’u
Amlaኸy medhney aygedfenn beyney misay alo kulu
Kab belai kabti hayal t’um zewts’e endyu haylu

CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye

VERSE 4
Az. . .
Merzam qesti sebat qalat tet’emiu hilnay kequsl
Kibret kemzeyblu beqa ezum koyne beynu zestemasl
Hiyaway samrawi gets’ sebat keyt’mt ayfeqeden libu

CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye

VERSE 5
Mihir kab mifqafus kibret kengseley wedu beja hibu
Az. . .
Betey kab mets’aeka zeferfer kidanka libey kitnkyo
Wiludka kiኸwn kab habkani mesel bimst’ir qeranyo

CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye

VERSE 6
Nizeygedefkani nay selam menfeska kabay nikኽele
Qaley qal lisaney qanyu’leኹ goytay nimsganaኻ ile
Az. . .

CHORUS
Aygdefkann amlaኸy gets’ka aykewelkan
Misay iኻ kulu kabay ayrehaqkan ab hiwetey
Neti men alewo ezgi’yu zelewo kibehal semia
Misay kem zeleኻ biqalat zeykones biayney’ye rieye',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b8c22fb3-8d3f-45d7-8113-f8c994edd1ad'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 1
ብተምሳል ግብርኻ ምስልኻ ኣብ ዙርያይ ከቢቡኒ ይነብር
መንፈስካ ሓይልኻን ብእምነት ሰኒቀ ማዕበል ባሕሪ ይሰግር
ኣዝ. . .
ኣብቲ ጉዕዞ ህይወት ስቅታ ከም ጽላሎት ደድሕረይ ክመጽእ

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 2
ሰላም ርሒቁኒ ተገሪሙ ልበይ ምፍጣረይ ክጸልእ
ብሃንደበት መጺኡ ድምጸይ ከይሰምዐ ማዕጹኡ መን ኣርሕዩ
ደበስ ኮይኑ ቃሉ ተስፋይ ዘሐደሰ ድሕነተይ ተመንዩ
ኣዝ. . .

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 3
ነፍሰይ ነይሰኣነት ኣብ ሕቅፍኡ ዘሙቋ ዝሓልየላ ኣብሊጹ
ባዲመ ኽይተርፍ ካብ ምልኣቱ ጸጋ ኣብ ውሽጠይ ኣስሪጹ
አምላኸይ መድሕነይ ኣይገድፈንን በይነይ ምሳይ ኣሎ ኩሉ
ካብ በላዒ ካብቲ ሓያል ጥዑም ዘውጽእ እንድዩ ሓይሉ

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 4
ኣዝ. . .
መርዛም ቀስቲ ሰባት ቃላት ተጠሚዑ ሕልናይ ከቁስል
ክብረት ከምዘይብሉ በቃ ዕዙም ኮይነ በይኑ ዘስተማስል
ሕያዋይ ሳምራዊ ገጽ ሰባት ከይጥምት ኣይፈቀደን ልቡ

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 5
ምሒር ካብ ምፍቃፉስ ክብረት ከንግሰለይ ወዱ በጃ ሂቡ
ኣዝ. . .
ቤተይ ካብ መጻእካ ዘፈርፈር ክዳንካ ልበይ ክትንክዮ
ውሉድካ ክኸውን ካብ ሃብካኒ መሰል ብምስጢር ቀራንዮ

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ

VERSE 6
ንዘይገደፍካኒ ናይ ሰላም መንፈስካ ካባይ ንክኽእለ
ቃለይ ቃል ልሳነይ ቃንዩ’ለኹ ጎይታይ ንምስጋናኻ ኢለ
ኣዝ. . .

CHORUS
ኣይግደፍካንን ኣምላኸይ ገጽካ ኣይከወልካን
ምሳይ ኢኻ ኩሉ ካባይ ኣይረሓቅካን ኣብ ሂወተይ
ነቲ መን ኣለዎ እዝጊ’ዩ ዘለዎ ክበሃል ሰሚዐ
ምሳይ ከም ዘለኻ ብቃላት ዘይኮነስ ብዓይነይ’የ ርእየ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b8c22fb3-8d3f-45d7-8113-f8c994edd1ad'::uuid, 'eritrean-orthodox-tewahdo-mezmur-4024', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yebegena-mezimur-adis ("Yebegena Mezimur Adis")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6a048bc8-a6ba-43aa-99af-75c3a2c99d5f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 1
ሰው የለኝም ላልኩት አንተው ተስፋ ሁነኝ
ብዙ ቁስል አለ ለሰው የማልነግረው
በሀዘን የሞላኝ ልቤን የሰበረው
አለኝ የማወራው ከአንተ ጋራ ብቻ

CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 2
በውስጤ ያኖርኩት በሰዎች ፍራቻ
ይዘብትብኛል ችግሬን የሰማ
ይሳለቃል ሲያየኝ ቆሜ በጨለማ
አምላኩ የት አለ እንዳይሉ አድነኝ

CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 3
ነፍሴን ተስፋ ሙላት የጠፋሁ ልጅህ ነኝ
መድረሻ የሌለው ከንቱ መጻተኛ
ወገን ዘመድ ያጣ ሆኖ ስደተኛ
ተስፋ የሚያደርግህ አንተን ብቻ እኮ ነው

CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 4
ምስካየ ኅዙናን ስደት የቀመስከው
የዳዊት ልጅ ማረኝ በሀዘን ልቤ ደምቷል
ዝም በል የሚለኝ ሰው በመንገዱ ሞልቷል
ሕዝቡን ገለል አርገህ ናልኝ የእኔ ጌታ

CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 5
ተስፋ እንደሌለው ሰው እንዳልንገላታ

CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tesfa yalqoret’kut Getaye beante new
Amnalehu beene lay madanh dinq new
Etemamenalehu endemattewegn
Sew yelegnm lalkut digaf gulbet hunegn

VERSE 1
Sew yelegnm lalkut antew tesfa hunegn
Bizu qusl ale lesew yemalnegrew
Behezen yemolagn liben yeseberew
Alegn yemaweraw keante gara bicha

CHORUS
Tesfa yalqoret’kut Getaye beante new
Amnalehu beene lay madanh dinq new
Etemamenalehu endemattewegn
Sew yelegnm lalkut digaf gulbet hunegn

VERSE 2
Bewst’e yanorkut besewoch firacha
Yizebtbgnal chgren yesema
Yisaleqal siyayegn qome bech’elema
Amlaku yet ale endaylu adnegn

CHORUS
Tesfa yalqoret’kut Getaye beante new
Amnalehu beene lay madanh dinq new
Etemamenalehu endemattewegn
Sew yelegnm lalkut digaf gulbet hunegn

VERSE 3
Nefsen tesfa mulat yet’efahu lijh negn
Medresha yelelew kentu mets’ategna
Wegen zemed yat’a hono sidetegna
Tesfa yemiyadergh anten bicha eko new

CHORUS
Tesfa yalqoret’kut Getaye beante new
Amnalehu beene lay madanh dinq new
Etemamenalehu endemattewegn
Sew yelegnm lalkut digaf gulbet hunegn

VERSE 4
Miskaye hizunan sidet yeqemeskew
Yedawit lij maregn behezen libe demtwal
Zim bel yemilegn sew bemengedu moltwal
Hizbun gelel argeh nalgn yeene Geta

CHORUS
Tesfa yalqoret’kut Getaye beante new
Amnalehu beene lay madanh dinq new
Etemamenalehu endemattewegn
Sew yelegnm lalkut digaf gulbet hunegn

VERSE 5
Tesfa endelelew sew endalngelata

CHORUS
Tesfa yalqoret’kut Getaye beante new
Amnalehu beene lay madanh dinq new
Etemamenalehu endemattewegn
Sew yelegnm lalkut digaf gulbet hunegn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 1
ሰው የለኝም ላልኩት አንተው ተስፋ ሁነኝ
ብዙ ቁስል አለ ለሰው የማልነግረው
በሀዘን የሞላኝ ልቤን የሰበረው
አለኝ የማወራው ከአንተ ጋራ ብቻ

CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 2
በውስጤ ያኖርኩት በሰዎች ፍራቻ
ይዘብትብኛል ችግሬን የሰማ
ይሳለቃል ሲያየኝ ቆሜ በጨለማ
አምላኩ የት አለ እንዳይሉ አድነኝ

CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 3
ነፍሴን ተስፋ ሙላት የጠፋሁ ልጅህ ነኝ
መድረሻ የሌለው ከንቱ መጻተኛ
ወገን ዘመድ ያጣ ሆኖ ስደተኛ
ተስፋ የሚያደርግህ አንተን ብቻ እኮ ነው

CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 4
ምስካየ ኅዙናን ስደት የቀመስከው
የዳዊት ልጅ ማረኝ በሀዘን ልቤ ደምቷል
ዝም በል የሚለኝ ሰው በመንገዱ ሞልቷል
ሕዝቡን ገለል አርገህ ናልኝ የእኔ ጌታ

CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 5
ተስፋ እንደሌለው ሰው እንዳልንገላታ

CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ',
        lyrics_transliteration = 'CHORUS
Tesfa yalqoret’kut Getaye beante new
Amnalehu beene lay madanh dinq new
Etemamenalehu endemattewegn
Sew yelegnm lalkut digaf gulbet hunegn

VERSE 1
Sew yelegnm lalkut antew tesfa hunegn
Bizu qusl ale lesew yemalnegrew
Behezen yemolagn liben yeseberew
Alegn yemaweraw keante gara bicha

CHORUS
Tesfa yalqoret’kut Getaye beante new
Amnalehu beene lay madanh dinq new
Etemamenalehu endemattewegn
Sew yelegnm lalkut digaf gulbet hunegn

VERSE 2
Bewst’e yanorkut besewoch firacha
Yizebtbgnal chgren yesema
Yisaleqal siyayegn qome bech’elema
Amlaku yet ale endaylu adnegn

CHORUS
Tesfa yalqoret’kut Getaye beante new
Amnalehu beene lay madanh dinq new
Etemamenalehu endemattewegn
Sew yelegnm lalkut digaf gulbet hunegn

VERSE 3
Nefsen tesfa mulat yet’efahu lijh negn
Medresha yelelew kentu mets’ategna
Wegen zemed yat’a hono sidetegna
Tesfa yemiyadergh anten bicha eko new

CHORUS
Tesfa yalqoret’kut Getaye beante new
Amnalehu beene lay madanh dinq new
Etemamenalehu endemattewegn
Sew yelegnm lalkut digaf gulbet hunegn

VERSE 4
Miskaye hizunan sidet yeqemeskew
Yedawit lij maregn behezen libe demtwal
Zim bel yemilegn sew bemengedu moltwal
Hizbun gelel argeh nalgn yeene Geta

CHORUS
Tesfa yalqoret’kut Getaye beante new
Amnalehu beene lay madanh dinq new
Etemamenalehu endemattewegn
Sew yelegnm lalkut digaf gulbet hunegn

VERSE 5
Tesfa endelelew sew endalngelata

CHORUS
Tesfa yalqoret’kut Getaye beante new
Amnalehu beene lay madanh dinq new
Etemamenalehu endemattewegn
Sew yelegnm lalkut digaf gulbet hunegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6a048bc8-a6ba-43aa-99af-75c3a2c99d5f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 1
ሰው የለኝም ላልኩት አንተው ተስፋ ሁነኝ
ብዙ ቁስል አለ ለሰው የማልነግረው
በሀዘን የሞላኝ ልቤን የሰበረው
አለኝ የማወራው ከአንተ ጋራ ብቻ

CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 2
በውስጤ ያኖርኩት በሰዎች ፍራቻ
ይዘብትብኛል ችግሬን የሰማ
ይሳለቃል ሲያየኝ ቆሜ በጨለማ
አምላኩ የት አለ እንዳይሉ አድነኝ

CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 3
ነፍሴን ተስፋ ሙላት የጠፋሁ ልጅህ ነኝ
መድረሻ የሌለው ከንቱ መጻተኛ
ወገን ዘመድ ያጣ ሆኖ ስደተኛ
ተስፋ የሚያደርግህ አንተን ብቻ እኮ ነው

CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 4
ምስካየ ኅዙናን ስደት የቀመስከው
የዳዊት ልጅ ማረኝ በሀዘን ልቤ ደምቷል
ዝም በል የሚለኝ ሰው በመንገዱ ሞልቷል
ሕዝቡን ገለል አርገህ ናልኝ የእኔ ጌታ

CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ

VERSE 5
ተስፋ እንደሌለው ሰው እንዳልንገላታ

CHORUS
ተስፋ ያልቆረጥኩት ጌታዬ በአንተ ነው
አምናለሁ በእኔ ላይ ማዳንህ ድንቅ ነው
እተማመናለሁ እንደማትተወኝ
ሰው የለኝም ላልኩት ድጋፍ ጉልበት ሁነኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6a048bc8-a6ba-43aa-99af-75c3a2c99d5f'::uuid, 'yebegena-mezimur-adis', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kentu-eye ("kentu eye")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '69b7df2f-8b5d-4758-b9d2-420528166400'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ

VERSE 1
ኣምላኸይ ጥራይ’ዩ ዘጸናንዓኒ
ኣነስ ንጉሥ ነይረ ብኽብሪ ዘጌጽኩ
ኵሉ ኣብዚ ምድሪ ብጥበብ ፈጸምኩ
ደስታ እዛ ዓለም ዋላ ኣየዋጽኣንን

CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ

VERSE 2
መዓልተይ ኣኺሉ ሞትውን ወሲዱኒ/2/
ኣብ ትሕቲ እዛ ጸሓይ ሓድሽ ነገር የለን
ሰባት ግን ይደኽሙ ካብ ዘመን ናብ ዘመን
ን ጥበብ ክደሊ ደኺመየ ምሒር

CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ

VERSE 3
ኵሉ ከንቱ ኮይኑ ተሪፉ ኣብ መቓብር /2/
ቅድመይ ዝነብሩ ክቡራት ናይ ዓለም
ኣለዉ ኣብ መቓብር ሓመድ ተደፊኖም
ፍልጠትን ዕብዳንን ኵለን ፈሊጠየን

CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ

VERSE 4
ኵሎም ከንቱ እዮም ቀወምቲ ኣይኮኑን /2/
ልበይ ዝሃብክዎ ተስፋ ዘንበርኩሉ
ምጭባጥ ኣብዩኒ ክሕዞ ኣይከኣልኩን
ጥበብ ብምብዝሐይ እነሆ ተኪዘ

CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ

VERSE 5
ኣነስ ኣብዛ ዓለም ዘይጠቅም ፍጥረት’የ/2/
ብብዙሕ ታሕጓስ ልበይ ፈቲነዮ
ናይዚ ዓለም ለውጢ ኣስተማቒረዮ
ሰሓቕ’ውን ኣብ ውሽጠይ ይሰራሰር ነይሩ

CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ

VERSE 6
ኣብ ሓመድ ተሪፉ ኵሉ ከንቱ ኮይኑ/2/

CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kentu’ye nay kentu kentu’ye
Wahsn t’ebeቓn amlaኽ tezeygere
Tesfa ziኾneni hiywet zihbeni
Egziabher t’ray’yu zets’enanani

VERSE 1
Amlaኸy t’ray’yu zets’enanani
Anes nigus neyre biኽbri zegets’ku
Kwlu abzi midri bit’beb fets’emku
Desta eza alem wala ayewats’ann

CHORUS
Kentu’ye nay kentu kentu’ye
Wahsn t’ebeቓn amlaኽ tezeygere
Tesfa ziኾneni hiywet zihbeni
Egziabher t’ray’yu zets’enanani

VERSE 2
Mealtey aኺlu motwn wesiduni (2)
Ab tihti eza ts’ehay hadsh neger yelen
Sebat gin yideኽmu kab zemen nab zemen
N t’beb kideli deኺmeye mihir

CHORUS
Kentu’ye nay kentu kentu’ye
Wahsn t’ebeቓn amlaኽ tezeygere
Tesfa ziኾneni hiywet zihbeni
Egziabher t’ray’yu zets’enanani

VERSE 3
Kwlu kentu koynu terifu ab meቓbr (2)
Qidmey zinebru kiburat nay alem
Alewu ab meቓbr hamed tedefinom
Filt’etn ebdann kwlen felit’eyen

CHORUS
Kentu’ye nay kentu kentu’ye
Wahsn t’ebeቓn amlaኽ tezeygere
Tesfa ziኾneni hiywet zihbeni
Egziabher t’ray’yu zets’enanani

VERSE 4
Kwlom kentu eyom qewemti aykonun (2)
Libey zihabkwo tesfa zenberkulu
Mich’bat’ abyuni kihzo aykealkun
T’beb bimbzhey eneho tekize

CHORUS
Kentu’ye nay kentu kentu’ye
Wahsn t’ebeቓn amlaኽ tezeygere
Tesfa ziኾneni hiywet zihbeni
Egziabher t’ray’yu zets’enanani

VERSE 5
Anes abza alem zeyt’eqm fit’ret’ye (2)
Bibzuh tahgwas libey fetineyo
Nayzi alem lewt’i astemaቒreyo
Sehaቕ’wn ab wisht’ey yiseraser neyru

CHORUS
Kentu’ye nay kentu kentu’ye
Wahsn t’ebeቓn amlaኽ tezeygere
Tesfa ziኾneni hiywet zihbeni
Egziabher t’ray’yu zets’enanani

VERSE 6
Ab hamed terifu kwlu kentu koynu (2)

CHORUS
Kentu’ye nay kentu kentu’ye
Wahsn t’ebeቓn amlaኽ tezeygere
Tesfa ziኾneni hiywet zihbeni
Egziabher t’ray’yu zets’enanani'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ

VERSE 1
ኣምላኸይ ጥራይ’ዩ ዘጸናንዓኒ
ኣነስ ንጉሥ ነይረ ብኽብሪ ዘጌጽኩ
ኵሉ ኣብዚ ምድሪ ብጥበብ ፈጸምኩ
ደስታ እዛ ዓለም ዋላ ኣየዋጽኣንን

CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ

VERSE 2
መዓልተይ ኣኺሉ ሞትውን ወሲዱኒ/2/
ኣብ ትሕቲ እዛ ጸሓይ ሓድሽ ነገር የለን
ሰባት ግን ይደኽሙ ካብ ዘመን ናብ ዘመን
ን ጥበብ ክደሊ ደኺመየ ምሒር

CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ

VERSE 3
ኵሉ ከንቱ ኮይኑ ተሪፉ ኣብ መቓብር /2/
ቅድመይ ዝነብሩ ክቡራት ናይ ዓለም
ኣለዉ ኣብ መቓብር ሓመድ ተደፊኖም
ፍልጠትን ዕብዳንን ኵለን ፈሊጠየን

CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ

VERSE 4
ኵሎም ከንቱ እዮም ቀወምቲ ኣይኮኑን /2/
ልበይ ዝሃብክዎ ተስፋ ዘንበርኩሉ
ምጭባጥ ኣብዩኒ ክሕዞ ኣይከኣልኩን
ጥበብ ብምብዝሐይ እነሆ ተኪዘ

CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ

VERSE 5
ኣነስ ኣብዛ ዓለም ዘይጠቅም ፍጥረት’የ/2/
ብብዙሕ ታሕጓስ ልበይ ፈቲነዮ
ናይዚ ዓለም ለውጢ ኣስተማቒረዮ
ሰሓቕ’ውን ኣብ ውሽጠይ ይሰራሰር ነይሩ

CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ

VERSE 6
ኣብ ሓመድ ተሪፉ ኵሉ ከንቱ ኮይኑ/2/

CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ',
        lyrics_transliteration = 'CHORUS
Kentu’ye nay kentu kentu’ye
Wahsn t’ebeቓn amlaኽ tezeygere
Tesfa ziኾneni hiywet zihbeni
Egziabher t’ray’yu zets’enanani

VERSE 1
Amlaኸy t’ray’yu zets’enanani
Anes nigus neyre biኽbri zegets’ku
Kwlu abzi midri bit’beb fets’emku
Desta eza alem wala ayewats’ann

CHORUS
Kentu’ye nay kentu kentu’ye
Wahsn t’ebeቓn amlaኽ tezeygere
Tesfa ziኾneni hiywet zihbeni
Egziabher t’ray’yu zets’enanani

VERSE 2
Mealtey aኺlu motwn wesiduni (2)
Ab tihti eza ts’ehay hadsh neger yelen
Sebat gin yideኽmu kab zemen nab zemen
N t’beb kideli deኺmeye mihir

CHORUS
Kentu’ye nay kentu kentu’ye
Wahsn t’ebeቓn amlaኽ tezeygere
Tesfa ziኾneni hiywet zihbeni
Egziabher t’ray’yu zets’enanani

VERSE 3
Kwlu kentu koynu terifu ab meቓbr (2)
Qidmey zinebru kiburat nay alem
Alewu ab meቓbr hamed tedefinom
Filt’etn ebdann kwlen felit’eyen

CHORUS
Kentu’ye nay kentu kentu’ye
Wahsn t’ebeቓn amlaኽ tezeygere
Tesfa ziኾneni hiywet zihbeni
Egziabher t’ray’yu zets’enanani

VERSE 4
Kwlom kentu eyom qewemti aykonun (2)
Libey zihabkwo tesfa zenberkulu
Mich’bat’ abyuni kihzo aykealkun
T’beb bimbzhey eneho tekize

CHORUS
Kentu’ye nay kentu kentu’ye
Wahsn t’ebeቓn amlaኽ tezeygere
Tesfa ziኾneni hiywet zihbeni
Egziabher t’ray’yu zets’enanani

VERSE 5
Anes abza alem zeyt’eqm fit’ret’ye (2)
Bibzuh tahgwas libey fetineyo
Nayzi alem lewt’i astemaቒreyo
Sehaቕ’wn ab wisht’ey yiseraser neyru

CHORUS
Kentu’ye nay kentu kentu’ye
Wahsn t’ebeቓn amlaኽ tezeygere
Tesfa ziኾneni hiywet zihbeni
Egziabher t’ray’yu zets’enanani

VERSE 6
Ab hamed terifu kwlu kentu koynu (2)

CHORUS
Kentu’ye nay kentu kentu’ye
Wahsn t’ebeቓn amlaኽ tezeygere
Tesfa ziኾneni hiywet zihbeni
Egziabher t’ray’yu zets’enanani',
        updated_at = clock_timestamp()::text
    WHERE import_id = '69b7df2f-8b5d-4758-b9d2-420528166400'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ

VERSE 1
ኣምላኸይ ጥራይ’ዩ ዘጸናንዓኒ
ኣነስ ንጉሥ ነይረ ብኽብሪ ዘጌጽኩ
ኵሉ ኣብዚ ምድሪ ብጥበብ ፈጸምኩ
ደስታ እዛ ዓለም ዋላ ኣየዋጽኣንን

CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ

VERSE 2
መዓልተይ ኣኺሉ ሞትውን ወሲዱኒ/2/
ኣብ ትሕቲ እዛ ጸሓይ ሓድሽ ነገር የለን
ሰባት ግን ይደኽሙ ካብ ዘመን ናብ ዘመን
ን ጥበብ ክደሊ ደኺመየ ምሒር

CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ

VERSE 3
ኵሉ ከንቱ ኮይኑ ተሪፉ ኣብ መቓብር /2/
ቅድመይ ዝነብሩ ክቡራት ናይ ዓለም
ኣለዉ ኣብ መቓብር ሓመድ ተደፊኖም
ፍልጠትን ዕብዳንን ኵለን ፈሊጠየን

CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ

VERSE 4
ኵሎም ከንቱ እዮም ቀወምቲ ኣይኮኑን /2/
ልበይ ዝሃብክዎ ተስፋ ዘንበርኩሉ
ምጭባጥ ኣብዩኒ ክሕዞ ኣይከኣልኩን
ጥበብ ብምብዝሐይ እነሆ ተኪዘ

CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ

VERSE 5
ኣነስ ኣብዛ ዓለም ዘይጠቅም ፍጥረት’የ/2/
ብብዙሕ ታሕጓስ ልበይ ፈቲነዮ
ናይዚ ዓለም ለውጢ ኣስተማቒረዮ
ሰሓቕ’ውን ኣብ ውሽጠይ ይሰራሰር ነይሩ

CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ

VERSE 6
ኣብ ሓመድ ተሪፉ ኵሉ ከንቱ ኮይኑ/2/

CHORUS
ከንቱ’የ ናይ ከንቱ ከንቱ’የ
ዋሕስን ጠበቓን ኣምላኽ ተዘይጌረ
ተስፋ ዝኾነኒ ሕይወት ዝህበኒ
እግዚአብሔር ጥራይ’ዩ ዘጸናንዓኒ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '69b7df2f-8b5d-4758-b9d2-420528166400'::uuid, 'kentu-eye', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sobe-tezekerineha-letsiyon ("Sobe Tezekerineha Letsiyon")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6a03121b-3b83-4013-b101-0eaab04f3e7e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 1
እንዚራቲነ ሰቀልነ ውስተ ኲሓቲሃ
ባሰብናት ጊዜ ጽዮንን
ባሰብናት ጊዜ ኢትዮጵያንን
በባቢሎን ወንዞች አጠገብ

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 2
ተቀምጠን አለቀስን
መሰንቆአችንን ሰቀልን በዛፎቿ ላይ
/አዝ
ፅኑ መከራን ተቀበልን ተጨነቅን በፈተና

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 3
የደዌ ሞት በላያችን እንደዝናብ ወርዷልና
አሕዛብም ዘበቱብን እንዲህ ብለው በየተራ
ዘምሩለት ለአምላካችሁ ቢያድናችሁ ከመከራ
እግዚአብሔር ጽዮንን በመንግስቱ መርጧታል እና

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 4
ማደሪያው ትሆነው ዘንድ ወዷታል እና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 5
/አዝ
የማረኩን በጦራቸው በኃይላቸው የተመኩ
በጽዮን ደጅ ያለፍርሃት የጽዮንን ክብሯን ነኩ
ይህን ያየ ከላይ ሆኖ በደመና ተሸፍኖ

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 6
ባቢሎንን አሻገረ የማረኩንን በትኖ
እግዚአብሔር ጽዮንን ለመንግስቱ መርጧታል እና
ማደሪያው ትሆነው ዘንድ ወዷታል እና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 7
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን
/አዝ
ስጋችንን ይገል ዘንድ የሞት ጥላ ቢያጠላም

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 8
እናልፋለን ሁሉን ባንቺ
የአምላክ እናት ድንግል ማርያም
ቅድስት ሆይ ከባረክሽን
እንድናለን ከደዌያችን

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 9
ለስጋና ለነብሳችን መድኃኒት ነሽ እናታችን
እግዚአብሔር ጽዮንን በመንግስቱ መርጧታልና
ማደሪያው ትሆነው ዘንድ ወዷታልና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 10
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 1
Enziratine seqelne wiste kwihatiha
Basebnat gize ts’yonn
Basebnat gize ityop’yann
Bebabilon wenzoch at’egeb

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 2
Teqemt’en aleqesn
Mesenqoachnn seqeln bezafochwa lay
/az
Ts’nu mekeran teqebeln tech’eneqn befetena

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 3
Yedewe mot belayachn endeznab werdwalna
Ahzabm zebetubn endih bilew beyetera
Zemrulet leamlakachhu biyadnachhu kemekera
Egziabher ts’yonn bemengstu mert’watal ena

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 4
Maderiyaw tihonew zend wedwatal ena
Ts’yon hoy enatachn Kidist Dingil Maryam
Ts’yon hoy enatachn Kidist Bete Kristian
Anchin binresa qegnachn tirsan

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 5
/az
Yemarekun bet’orachew behaylachew yetemeku
Bets’yon dej yalefrhat yets’yonn kibrwan neku
Yihn yaye kelay hono bedemena teshefno

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 6
Babilonn ashagere yemarekunn betno
Egziabher ts’yonn lemengstu mert’watal ena
Maderiyaw tihonew zend wedwatal ena
Ts’yon hoy enatachn Kidist Dingil Maryam

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 7
Ts’yon hoy enatachn Kidist Bete Kristian
Anchin binresa qegnachn tirsan
/az
Sigachnn yigel zend yemot t’la biyat’elam

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 8
Enalfalen hulun banchi
Yeamlak enat Dingil Maryam
Kidist hoy kebarekshn
Endnalen kedeweyachn

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 9
Lesgana lenebsachn medhanit nesh enatachn
Egziabher ts’yonn bemengstu mert’watalna
Maderiyaw tihonew zend wedwatalna
Ts’yon hoy enatachn Kidist Dingil Maryam

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 10
Ts’yon hoy enatachn Kidist Bete Kristian
Anchin binresa qegnachn tirsan

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 1
እንዚራቲነ ሰቀልነ ውስተ ኲሓቲሃ
ባሰብናት ጊዜ ጽዮንን
ባሰብናት ጊዜ ኢትዮጵያንን
በባቢሎን ወንዞች አጠገብ

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 2
ተቀምጠን አለቀስን
መሰንቆአችንን ሰቀልን በዛፎቿ ላይ
/አዝ
ፅኑ መከራን ተቀበልን ተጨነቅን በፈተና

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 3
የደዌ ሞት በላያችን እንደዝናብ ወርዷልና
አሕዛብም ዘበቱብን እንዲህ ብለው በየተራ
ዘምሩለት ለአምላካችሁ ቢያድናችሁ ከመከራ
እግዚአብሔር ጽዮንን በመንግስቱ መርጧታል እና

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 4
ማደሪያው ትሆነው ዘንድ ወዷታል እና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 5
/አዝ
የማረኩን በጦራቸው በኃይላቸው የተመኩ
በጽዮን ደጅ ያለፍርሃት የጽዮንን ክብሯን ነኩ
ይህን ያየ ከላይ ሆኖ በደመና ተሸፍኖ

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 6
ባቢሎንን አሻገረ የማረኩንን በትኖ
እግዚአብሔር ጽዮንን ለመንግስቱ መርጧታል እና
ማደሪያው ትሆነው ዘንድ ወዷታል እና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 7
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን
/አዝ
ስጋችንን ይገል ዘንድ የሞት ጥላ ቢያጠላም

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 8
እናልፋለን ሁሉን ባንቺ
የአምላክ እናት ድንግል ማርያም
ቅድስት ሆይ ከባረክሽን
እንድናለን ከደዌያችን

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 9
ለስጋና ለነብሳችን መድኃኒት ነሽ እናታችን
እግዚአብሔር ጽዮንን በመንግስቱ መርጧታልና
ማደሪያው ትሆነው ዘንድ ወዷታልና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ

VERSE 10
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ',
        lyrics_transliteration = 'CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 1
Enziratine seqelne wiste kwihatiha
Basebnat gize ts’yonn
Basebnat gize ityop’yann
Bebabilon wenzoch at’egeb

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 2
Teqemt’en aleqesn
Mesenqoachnn seqeln bezafochwa lay
/az
Ts’nu mekeran teqebeln tech’eneqn befetena

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 3
Yedewe mot belayachn endeznab werdwalna
Ahzabm zebetubn endih bilew beyetera
Zemrulet leamlakachhu biyadnachhu kemekera
Egziabher ts’yonn bemengstu mert’watal ena

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 4
Maderiyaw tihonew zend wedwatal ena
Ts’yon hoy enatachn Kidist Dingil Maryam
Ts’yon hoy enatachn Kidist Bete Kristian
Anchin binresa qegnachn tirsan

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 5
/az
Yemarekun bet’orachew behaylachew yetemeku
Bets’yon dej yalefrhat yets’yonn kibrwan neku
Yihn yaye kelay hono bedemena teshefno

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 6
Babilonn ashagere yemarekunn betno
Egziabher ts’yonn lemengstu mert’watal ena
Maderiyaw tihonew zend wedwatal ena
Ts’yon hoy enatachn Kidist Dingil Maryam

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 7
Ts’yon hoy enatachn Kidist Bete Kristian
Anchin binresa qegnachn tirsan
/az
Sigachnn yigel zend yemot t’la biyat’elam

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 8
Enalfalen hulun banchi
Yeamlak enat Dingil Maryam
Kidist hoy kebarekshn
Endnalen kedeweyachn

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 9
Lesgana lenebsachn medhanit nesh enatachn
Egziabher ts’yonn bemengstu mert’watalna
Maderiyaw tihonew zend wedwatalna
Ts’yon hoy enatachn Kidist Dingil Maryam

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne

VERSE 10
Ts’yon hoy enatachn Kidist Bete Kristian
Anchin binresa qegnachn tirsan

CHORUS
Sobe tezekernaha lets’yon
Sobe tezekernaha lets’yon
Wiste aflage babilon
Hiye neberne webekeyne',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6a03121b-3b83-4013-b101-0eaab04f3e7e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ
እንዚራቲነ ሰቀልነ ውስተ ኲሓቲሃ
ባሰብናት ጊዜ ጽዮንን
ባሰብናት ጊዜ ኢትዮጵያንን
በባቢሎን ወንዞች አጠገብ
ተቀምጠን አለቀስን
መሰንቆአችንን ሰቀልን በዛፎቿ ላይ
/አዝ=====
ፅኑ መከራን ተቀበልን ተጨነቅን በፈተና
የደዌ ሞት በላያችን እንደዝናብ ወርዷልና
አሕዛብም ዘበቱብን እንዲህ ብለው በየተራ
ዘምሩለት ለአምላካችሁ ቢያድናችሁ ከመከራ
እግዚአብሔር ጽዮንን በመንግስቱ መርጧታል እና
ማደሪያው ትሆነው ዘንድ ወዷታል እና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን
/አዝ=====
የማረኩን በጦራቸው በኃይላቸው የተመኩ
በጽዮን ደጅ ያለፍርሃት የጽዮንን ክብሯን ነኩ
ይህን ያየ ከላይ ሆኖ በደመና ተሸፍኖ
ባቢሎንን አሻገረ የማረኩንን በትኖ
እግዚአብሔር ጽዮንን ለመንግስቱ መርጧታል እና
ማደሪያው ትሆነው ዘንድ ወዷታል እና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን
/አዝ=====
ስጋችንን ይገል ዘንድ የሞት ጥላ ቢያጠላም
እናልፋለን ሁሉን ባንቺ
የአምላክ እናት ድንግል ማርያም
ቅድስት ሆይ ከባረክሽን
እንድናለን ከደዌያችን
ለስጋና ለነብሳችን መድኃኒት ነሽ እናታችን
እግዚአብሔር ጽዮንን በመንግስቱ መርጧታልና
ማደሪያው ትሆነው ዘንድ ወዷታልና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን

VERSE 1
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ
እንዚራቲነ ሰቀልነ ውስተ ኲሓቲሃ
ባሰብናት ጊዜ ጽዮንን
ባሰብናት ጊዜ ኢትዮጵያንን
በባቢሎን ወንዞች አጠገብ
ተቀምጠን አለቀስን
መሰንቆአችንን ሰቀልን በዛፎቿ ላይ
/አዝ=====
ፅኑ መከራን ተቀበልን ተጨነቅን በፈተና
የደዌ ሞት በላያችን እንደዝናብ ወርዷልና
አሕዛብም ዘበቱብን እንዲህ ብለው በየተራ
ዘምሩለት ለአምላካችሁ ቢያድናችሁ ከመከራ
እግዚአብሔር ጽዮንን በመንግስቱ መርጧታል እና
ማደሪያው ትሆነው ዘንድ ወዷታል እና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን
/አዝ=====
የማረኩን በጦራቸው በኃይላቸው የተመኩ
በጽዮን ደጅ ያለፍርሃት የጽዮንን ክብሯን ነኩ
ይህን ያየ ከላይ ሆኖ በደመና ተሸፍኖ
ባቢሎንን አሻገረ የማረኩንን በትኖ
እግዚአብሔር ጽዮንን ለመንግስቱ መርጧታል እና
ማደሪያው ትሆነው ዘንድ ወዷታል እና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን
/አዝ=====
ስጋችንን ይገል ዘንድ የሞት ጥላ ቢያጠላም
እናልፋለን ሁሉን ባንቺ
የአምላክ እናት ድንግል ማርያም
ቅድስት ሆይ ከባረክሽን
እንድናለን ከደዌያችን
ለስጋና ለነብሳችን መድኃኒት ነሽ እናታችን
እግዚአብሔር ጽዮንን በመንግስቱ መርጧታልና
ማደሪያው ትሆነው ዘንድ ወዷታልና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን

CHORUS
ሶበ ተዘከርናሃ ለጽዮን
ሶበ ተዘከርናሃ ለጽዮን
ውስተ አፍላገ ባቢሎን
ህየ ነበርነ ወበከይነ
እንዚራቲነ ሰቀልነ ውስተ ኲሓቲሃ
ባሰብናት ጊዜ ጽዮንን
ባሰብናት ጊዜ ኢትዮጵያንን
በባቢሎን ወንዞች አጠገብ
ተቀምጠን አለቀስን
መሰንቆአችንን ሰቀልን በዛፎቿ ላይ
/አዝ=====
ፅኑ መከራን ተቀበልን ተጨነቅን በፈተና
የደዌ ሞት በላያችን እንደዝናብ ወርዷልና
አሕዛብም ዘበቱብን እንዲህ ብለው በየተራ
ዘምሩለት ለአምላካችሁ ቢያድናችሁ ከመከራ
እግዚአብሔር ጽዮንን በመንግስቱ መርጧታል እና
ማደሪያው ትሆነው ዘንድ ወዷታል እና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን
/አዝ=====
የማረኩን በጦራቸው በኃይላቸው የተመኩ
በጽዮን ደጅ ያለፍርሃት የጽዮንን ክብሯን ነኩ
ይህን ያየ ከላይ ሆኖ በደመና ተሸፍኖ
ባቢሎንን አሻገረ የማረኩንን በትኖ
እግዚአብሔር ጽዮንን ለመንግስቱ መርጧታል እና
ማደሪያው ትሆነው ዘንድ ወዷታል እና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን
/አዝ=====
ስጋችንን ይገል ዘንድ የሞት ጥላ ቢያጠላም
እናልፋለን ሁሉን ባንቺ
የአምላክ እናት ድንግል ማርያም
ቅድስት ሆይ ከባረክሽን
እንድናለን ከደዌያችን
ለስጋና ለነብሳችን መድኃኒት ነሽ እናታችን
እግዚአብሔር ጽዮንን በመንግስቱ መርጧታልና
ማደሪያው ትሆነው ዘንድ ወዷታልና
ጽዮን ሆይ እናታችን ቅድስት ድንግል ማርያም
ጽዮን ሆይ እናታችን ቅድስት ቤተ ክርስቲያን
አንቺን ብንረሳ ቀኛችን ትርሳን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6a03121b-3b83-4013-b101-0eaab04f3e7e'::uuid, 'sobe-tezekerineha-letsiyon', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- erisu-bicha-yemayimot-new ("Erisu Bicha Yemayimot New")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0e37328d-4d48-4043-a154-82dc8a67c99a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል

VERSE 1
ሁሉም ነገር ይለወጣል
ሳይደበዝዝ የሚያበራ
ሁሌ ፅኑ የእርሱ ስራ
የአይሁድ ትግል ያልነቀለዉ

CHORUS
እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል

VERSE 2
ክፋታቸው ያልሸፈነው
የደም ሐውልት ምሰሶአችን
በርሱ ጸንቷል ከፍታችን
የአለም ጀግኖች ተቀብረዋል

CHORUS
እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል

VERSE 3
የበረቱ ተሰብረዋል
ገዳዩን ሞት የገደለ
እንደ ጌታ ወዴት አለ
መቃብርን የቀበረ

CHORUS
እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል

VERSE 4
ሀይለኛውን የሰበረ
እየሱስ ነው ፅኑ ጌታ
ማይሸነፍ ማይረታ

CHORUS
እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ersu bicha yemaymot new
Beabatu qegn ale negso
Amanuel kibrn lebso
Tinantnan zare wit’wal

VERSE 1
Hulum neger yilewet’al
Saydebezz yemiyabera
Hule ts’nu yeersu sira
Yeayhud tigl yalneqelewu

CHORUS
Ersu bicha yemaymot new
Beabatu qegn ale negso
Amanuel kibrn lebso
Tinantnan zare wit’wal

VERSE 2
Kifatachew yalshefenew
Yedem hewlt misesoachn
Bersu ts’entwal keftachn
Yealem jegnoch teqebrewal

CHORUS
Ersu bicha yemaymot new
Beabatu qegn ale negso
Amanuel kibrn lebso
Tinantnan zare wit’wal

VERSE 3
Yeberetu tesebrewal
Gedayun mot yegedele
Ende Geta wedet ale
Meqabrn yeqebere

CHORUS
Ersu bicha yemaymot new
Beabatu qegn ale negso
Amanuel kibrn lebso
Tinantnan zare wit’wal

VERSE 4
Heylegnawn yesebere
Eyesus new ts’nu Geta
Mayshenef mayreta

CHORUS
Ersu bicha yemaymot new
Beabatu qegn ale negso
Amanuel kibrn lebso
Tinantnan zare wit’wal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል

VERSE 1
ሁሉም ነገር ይለወጣል
ሳይደበዝዝ የሚያበራ
ሁሌ ፅኑ የእርሱ ስራ
የአይሁድ ትግል ያልነቀለዉ

CHORUS
እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል

VERSE 2
ክፋታቸው ያልሸፈነው
የደም ሐውልት ምሰሶአችን
በርሱ ጸንቷል ከፍታችን
የአለም ጀግኖች ተቀብረዋል

CHORUS
እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል

VERSE 3
የበረቱ ተሰብረዋል
ገዳዩን ሞት የገደለ
እንደ ጌታ ወዴት አለ
መቃብርን የቀበረ

CHORUS
እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል

VERSE 4
ሀይለኛውን የሰበረ
እየሱስ ነው ፅኑ ጌታ
ማይሸነፍ ማይረታ

CHORUS
እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል',
        lyrics_transliteration = 'CHORUS
Ersu bicha yemaymot new
Beabatu qegn ale negso
Amanuel kibrn lebso
Tinantnan zare wit’wal

VERSE 1
Hulum neger yilewet’al
Saydebezz yemiyabera
Hule ts’nu yeersu sira
Yeayhud tigl yalneqelewu

CHORUS
Ersu bicha yemaymot new
Beabatu qegn ale negso
Amanuel kibrn lebso
Tinantnan zare wit’wal

VERSE 2
Kifatachew yalshefenew
Yedem hewlt misesoachn
Bersu ts’entwal keftachn
Yealem jegnoch teqebrewal

CHORUS
Ersu bicha yemaymot new
Beabatu qegn ale negso
Amanuel kibrn lebso
Tinantnan zare wit’wal

VERSE 3
Yeberetu tesebrewal
Gedayun mot yegedele
Ende Geta wedet ale
Meqabrn yeqebere

CHORUS
Ersu bicha yemaymot new
Beabatu qegn ale negso
Amanuel kibrn lebso
Tinantnan zare wit’wal

VERSE 4
Heylegnawn yesebere
Eyesus new ts’nu Geta
Mayshenef mayreta

CHORUS
Ersu bicha yemaymot new
Beabatu qegn ale negso
Amanuel kibrn lebso
Tinantnan zare wit’wal',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0e37328d-4d48-4043-a154-82dc8a67c99a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል

VERSE 1
ሁሉም ነገር ይለወጣል
ሳይደበዝዝ የሚያበራ
ሁሌ ፅኑ የእርሱ ስራ
የአይሁድ ትግል ያልነቀለዉ

CHORUS
እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል

VERSE 2
ክፋታቸው ያልሸፈነው
የደም ሐውልት ምሰሶአችን
በርሱ ጸንቷል ከፍታችን
የአለም ጀግኖች ተቀብረዋል

CHORUS
እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል

VERSE 3
የበረቱ ተሰብረዋል
ገዳዩን ሞት የገደለ
እንደ ጌታ ወዴት አለ
መቃብርን የቀበረ

CHORUS
እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል

VERSE 4
ሀይለኛውን የሰበረ
እየሱስ ነው ፅኑ ጌታ
ማይሸነፍ ማይረታ

CHORUS
እርሱ ብቻ የማይሞት ነው
በአባቱ ቀኝ አለ ነግሶ
አማኑኤል ክብርን ለብሶ
ትናንትናን ዛሬ ውጧል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0e37328d-4d48-4043-a154-82dc8a67c99a'::uuid, 'erisu-bicha-yemayimot-new', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- amen-libel-amen-zemari-yeabkal-desalegn ("Amen libel Amen zemari yeabkal desalegn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '97065d61-1285-4f21-a73c-f4c14b48d8a1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 1
ማጉረምረሜ በቅቶ ተመስገን ማለት
ተለማምጃለሁ ስኖር በህይወት
የሚያስጨንቀኝን በእምነት ፊትህ ጥዬ
ያልከው ሆኖልኛል እንዳልከው ጌታዬ

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 2
በጉድለት ቢሆን በከፍታ
በሙላት ቢሆን በዝቅታ
ደህና ነው በሉ አሜን በእምነት
በአሜን አለና ሰላም እረፍት

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 3
በሰጠኸኝ ብዛት ከማመስገን ይልቅ
ባጣሁት ሳማርር ዘመኔ እንዳያልቅ
የእጅህን በረከት እንዲያይ የልብ አይኔ
ሁንልኝ አብርሆት ኢየሱስ መድህኔ

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 4
በጉድለት ቢሆን በከፍታ
በሙላት ቢሆን በዝቅታ
ደህና ነው በሉ አሜን በእምነት
በአሜን አለና ሰላም እረፍት

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 5
ባለፈው ሳነባ በትናንትናዬ
ከዛሬው በከፋ እንዳይሆን ነገዬ
ትክክል ነህ ማለት ተለማምጃለሁ
በምስጋና ሙላት መትረፍረፍ ስላየሁ

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 6
በጉድለት ቢሆን በከፍታ
በሙላት ቢሆን በዝቅታ
ደህና ነው በሉ አሜን በእምነት
በአሜን አለና ሰላም እረፍት

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 7
ብታገል ወዮልኝ ከሰሪዬ ጋራ
አትባልምና እንዲህ ስራ አትሰራ
እንደ ሀሳብህ ይሁን በእኔ ያለህ እቅድ
ስለምታውቅልኝ የሕይወቴን መንገድ

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 8
በጉድለት ቢሆን በከፍታ
በሙላት ቢሆን በዝቅታ
ደህና ነው በሉ አሜን በእምነት
በአሜን አለና ሰላም እረፍት

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 1
Maguremreme beqto temesgen malet
Telemamjalehu sinor behywet
Yemiyasch’enqegnn beemnet fith t’ye
Yalkew honolgnal endalkew Getaye

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 2
Begudlet bihon bekefta
Bemulat bihon bezqta
Dehna new belu Amen beemnet
Beamen alena selam ereft

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 3
Beset’eኸgn bizat kemamesgen yilq
Bat’ahut samarr zemene endayalq
Yeejhn bereket endiyay yelb ayne
Hunlgn abrhot Iyesus medhne

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 4
Begudlet bihon bekefta
Bemulat bihon bezqta
Dehna new belu Amen beemnet
Beamen alena selam ereft

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 5
Balefew saneba betnantnaye
Kezarew bekefa endayhon negeye
Tikkl neh malet telemamjalehu
Bemsgana mulat metrefref silayehu

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 6
Begudlet bihon bekefta
Bemulat bihon bezqta
Dehna new belu Amen beemnet
Beamen alena selam ereft

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 7
Bitagel weyolgn keseriye gara
Atbalmna endih sira atsera
Ende hesabh yihun beene yaleh eqd
Silemtawqlgn yehyweten menged

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 8
Begudlet bihon bekefta
Bemulat bihon bezqta
Dehna new belu Amen beemnet
Beamen alena selam ereft

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 1
ማጉረምረሜ በቅቶ ተመስገን ማለት
ተለማምጃለሁ ስኖር በህይወት
የሚያስጨንቀኝን በእምነት ፊትህ ጥዬ
ያልከው ሆኖልኛል እንዳልከው ጌታዬ

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 2
በጉድለት ቢሆን በከፍታ
በሙላት ቢሆን በዝቅታ
ደህና ነው በሉ አሜን በእምነት
በአሜን አለና ሰላም እረፍት

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 3
በሰጠኸኝ ብዛት ከማመስገን ይልቅ
ባጣሁት ሳማርር ዘመኔ እንዳያልቅ
የእጅህን በረከት እንዲያይ የልብ አይኔ
ሁንልኝ አብርሆት ኢየሱስ መድህኔ

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 4
በጉድለት ቢሆን በከፍታ
በሙላት ቢሆን በዝቅታ
ደህና ነው በሉ አሜን በእምነት
በአሜን አለና ሰላም እረፍት

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 5
ባለፈው ሳነባ በትናንትናዬ
ከዛሬው በከፋ እንዳይሆን ነገዬ
ትክክል ነህ ማለት ተለማምጃለሁ
በምስጋና ሙላት መትረፍረፍ ስላየሁ

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 6
በጉድለት ቢሆን በከፍታ
በሙላት ቢሆን በዝቅታ
ደህና ነው በሉ አሜን በእምነት
በአሜን አለና ሰላም እረፍት

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 7
ብታገል ወዮልኝ ከሰሪዬ ጋራ
አትባልምና እንዲህ ስራ አትሰራ
እንደ ሀሳብህ ይሁን በእኔ ያለህ እቅድ
ስለምታውቅልኝ የሕይወቴን መንገድ

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 8
በጉድለት ቢሆን በከፍታ
በሙላት ቢሆን በዝቅታ
ደህና ነው በሉ አሜን በእምነት
በአሜን አለና ሰላም እረፍት

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና',
        lyrics_transliteration = 'CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 1
Maguremreme beqto temesgen malet
Telemamjalehu sinor behywet
Yemiyasch’enqegnn beemnet fith t’ye
Yalkew honolgnal endalkew Getaye

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 2
Begudlet bihon bekefta
Bemulat bihon bezqta
Dehna new belu Amen beemnet
Beamen alena selam ereft

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 3
Beset’eኸgn bizat kemamesgen yilq
Bat’ahut samarr zemene endayalq
Yeejhn bereket endiyay yelb ayne
Hunlgn abrhot Iyesus medhne

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 4
Begudlet bihon bekefta
Bemulat bihon bezqta
Dehna new belu Amen beemnet
Beamen alena selam ereft

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 5
Balefew saneba betnantnaye
Kezarew bekefa endayhon negeye
Tikkl neh malet telemamjalehu
Bemsgana mulat metrefref silayehu

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 6
Begudlet bihon bekefta
Bemulat bihon bezqta
Dehna new belu Amen beemnet
Beamen alena selam ereft

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 7
Bitagel weyolgn keseriye gara
Atbalmna endih sira atsera
Ende hesabh yihun beene yaleh eqd
Silemtawqlgn yehyweten menged

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana

VERSE 8
Begudlet bihon bekefta
Bemulat bihon bezqta
Dehna new belu Amen beemnet
Beamen alena selam ereft

CHORUS
Amen libel Amen
Ante yalkew yihun
Dehna libel libel dehna
Kibir alena bemsgana',
        updated_at = clock_timestamp()::text
    WHERE import_id = '97065d61-1285-4f21-a73c-f4c14b48d8a1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 1
ማጉረምረሜ በቅቶ ተመስገን ማለት
ተለማምጃለሁ ስኖር በህይወት
የሚያስጨንቀኝን በእምነት ፊትህ ጥዬ
ያልከው ሆኖልኛል እንዳልከው ጌታዬ

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 2
በጉድለት ቢሆን በከፍታ
በሙላት ቢሆን በዝቅታ
ደህና ነው በሉ አሜን በእምነት
በአሜን አለና ሰላም እረፍት

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 3
በሰጠኸኝ ብዛት ከማመስገን ይልቅ
ባጣሁት ሳማርር ዘመኔ እንዳያልቅ
የእጅህን በረከት እንዲያይ የልብ አይኔ
ሁንልኝ አብርሆት ኢየሱስ መድህኔ

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 4
በጉድለት ቢሆን በከፍታ
በሙላት ቢሆን በዝቅታ
ደህና ነው በሉ አሜን በእምነት
በአሜን አለና ሰላም እረፍት

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 5
ባለፈው ሳነባ በትናንትናዬ
ከዛሬው በከፋ እንዳይሆን ነገዬ
ትክክል ነህ ማለት ተለማምጃለሁ
በምስጋና ሙላት መትረፍረፍ ስላየሁ

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 6
በጉድለት ቢሆን በከፍታ
በሙላት ቢሆን በዝቅታ
ደህና ነው በሉ አሜን በእምነት
በአሜን አለና ሰላም እረፍት

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 7
ብታገል ወዮልኝ ከሰሪዬ ጋራ
አትባልምና እንዲህ ስራ አትሰራ
እንደ ሀሳብህ ይሁን በእኔ ያለህ እቅድ
ስለምታውቅልኝ የሕይወቴን መንገድ

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና

VERSE 8
በጉድለት ቢሆን በከፍታ
በሙላት ቢሆን በዝቅታ
ደህና ነው በሉ አሜን በእምነት
በአሜን አለና ሰላም እረፍት

CHORUS
አሜን ልበል አሜን
አንተ ያልከው ይሁን
ደህና ልበል ልበል ደህና
ክብር አለና በምስጋና'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '97065d61-1285-4f21-a73c-f4c14b48d8a1'::uuid, 'amen-libel-amen-zemari-yeabkal-desalegn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yared-kahenu-zemre ("Yared Kahenu zemre")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '058b3ce5-d6f6-46e5-ad8c-16574f153a2a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 1
ማኅሌት ጀመረ ያሬድ ዘመረ
ዜማውን ከመልእክት እያስተባበረ
ምስጋና አቀረበ ያሬድ ዘመረ
በዜማ መሣሪያ ያሬድ ዘመረ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 2
ጸናጽል አነሳ ከበሮ መቋሚያ
አዝ
በግዕዝ በዕዝል ያሬድ ዘመረ
በአራራይ ዜማ ያሬድ ዘመረ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 3
ከብሉይ ከሐዲስ ምስጢር እያስማማ
በዜማው ምልክት ያሬድ ዘመረ
የአምላክን መከራ ያሬድ ዘመረ
የመስቀሉን ነገር የማዳኑን ስራ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 4
አዝ
ደሙ እየፈለቀ ያሬድ ዘመረ
በጦር ተወግቶ ያሬድ ዘመረ
ሊቁ ማኅሌታይ በመንፈስ ተቃኝቶ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 5
በጥዑም ልሳኑ ያሬድ ዘመረ
በተሰጠው ጸጋ ያሬድ ዘመረ
ለንጉሥ እግዚአብሔር ለአልፋ ዖሜጋ
አዝ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 6
ድጓ ጾመድጓ ያሬድ ዘመረ
ምዕራፍ መዋሲት ያሬድ ዘመረ
ምሥጢር ተገልጦለት በሰማይ መላእክት
የዜማ መሠረት ያሬድ ዘመረ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 7
ተንበለ ዝማሬ ያሬድ ዘመረ
የኢትዮጲያ ኩራት የተዋህዶ ፍሬ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 1
Mahlet jemere yared zemere
Zemawn kemelekt eyastebabere
Misgana aqerebe yared zemere
Bezema mesariya yared zemere

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 2
Ts’enats’l anesa kebero meqwamiya
CHORUS
Begez beezl yared zemere
Beararay zema yared zemere

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 3
Kebluy kehedis mist’ir eyasmama
Bezemaw milkt yared zemere
Yeamlakn mekera yared zemere
Yemesqelun neger yemadanun sira

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 4
CHORUS
Demu eyefeleqe yared zemere
Bet’or tewegto yared zemere
Liqu mahletay bemenfes teqagnto

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 5
Bet’um lisanu yared zemere
Beteset’ew ts’ega yared zemere
Lengus Egziabher lealfa omega
CHORUS

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 6
Digwa ts’omedgwa yared zemere
Mieraf mewasit yared zemere
Mist’ir tegelt’olet besemay melaekt
Yezema meseret yared zemere

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 7
Tenbele zimare yared zemere
Yeityop’iya kurat yetewahdo fire

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 1
ማኅሌት ጀመረ ያሬድ ዘመረ
ዜማውን ከመልእክት እያስተባበረ
ምስጋና አቀረበ ያሬድ ዘመረ
በዜማ መሣሪያ ያሬድ ዘመረ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 2
ጸናጽል አነሳ ከበሮ መቋሚያ
አዝ
በግዕዝ በዕዝል ያሬድ ዘመረ
በአራራይ ዜማ ያሬድ ዘመረ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 3
ከብሉይ ከሐዲስ ምስጢር እያስማማ
በዜማው ምልክት ያሬድ ዘመረ
የአምላክን መከራ ያሬድ ዘመረ
የመስቀሉን ነገር የማዳኑን ስራ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 4
አዝ
ደሙ እየፈለቀ ያሬድ ዘመረ
በጦር ተወግቶ ያሬድ ዘመረ
ሊቁ ማኅሌታይ በመንፈስ ተቃኝቶ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 5
በጥዑም ልሳኑ ያሬድ ዘመረ
በተሰጠው ጸጋ ያሬድ ዘመረ
ለንጉሥ እግዚአብሔር ለአልፋ ዖሜጋ
አዝ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 6
ድጓ ጾመድጓ ያሬድ ዘመረ
ምዕራፍ መዋሲት ያሬድ ዘመረ
ምሥጢር ተገልጦለት በሰማይ መላእክት
የዜማ መሠረት ያሬድ ዘመረ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ

VERSE 7
ተንበለ ዝማሬ ያሬድ ዘመረ
የኢትዮጲያ ኩራት የተዋህዶ ፍሬ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ',
        lyrics_transliteration = 'CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 1
Mahlet jemere yared zemere
Zemawn kemelekt eyastebabere
Misgana aqerebe yared zemere
Bezema mesariya yared zemere

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 2
Ts’enats’l anesa kebero meqwamiya
CHORUS
Begez beezl yared zemere
Beararay zema yared zemere

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 3
Kebluy kehedis mist’ir eyasmama
Bezemaw milkt yared zemere
Yeamlakn mekera yared zemere
Yemesqelun neger yemadanun sira

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 4
CHORUS
Demu eyefeleqe yared zemere
Bet’or tewegto yared zemere
Liqu mahletay bemenfes teqagnto

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 5
Bet’um lisanu yared zemere
Beteset’ew ts’ega yared zemere
Lengus Egziabher lealfa omega
CHORUS

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 6
Digwa ts’omedgwa yared zemere
Mieraf mewasit yared zemere
Mist’ir tegelt’olet besemay melaekt
Yezema meseret yared zemere

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere

VERSE 7
Tenbele zimare yared zemere
Yeityop’iya kurat yetewahdo fire

CHORUS
Yared kahnu zemere (2)
Zemere yared zemere
Amlakun amesegene
Aryam bemalet yared zemere',
        updated_at = clock_timestamp()::text
    WHERE import_id = '058b3ce5-d6f6-46e5-ad8c-16574f153a2a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ
ማኅሌት ጀመረ ያሬድ ዘመረ
ዜማውን ከመልእክት እያስተባበረ
ምስጋና አቀረበ ያሬድ ዘመረ
በዜማ መሣሪያ ያሬድ ዘመረ
ጸናጽል አነሳ ከበሮ መቋሚያ
አዝ===========
በግዕዝ በዕዝል ያሬድ ዘመረ
በአራራይ ዜማ ያሬድ ዘመረ
ከብሉይ ከሐዲስ ምስጢር እያስማማ
በዜማው ምልክት ያሬድ ዘመረ
የአምላክን መከራ ያሬድ ዘመረ
የመስቀሉን ነገር የማዳኑን ስራ
አዝ=======
ደሙ እየፈለቀ ያሬድ ዘመረ
በጦር ተወግቶ ያሬድ ዘመረ
ሊቁ ማኅሌታይ በመንፈስ ተቃኝቶ
በጥዑም ልሳኑ ያሬድ ዘመረ
በተሰጠው ጸጋ ያሬድ ዘመረ
ለንጉሥ እግዚአብሔር ለአልፋ ዖሜጋ
አዝ ========
ድጓ ጾመድጓ ያሬድ ዘመረ
ምዕራፍ መዋሲት ያሬድ ዘመረ
ምሥጢር ተገልጦለት በሰማይ መላእክት
የዜማ መሠረት ያሬድ ዘመረ
ተንበለ ዝማሬ ያሬድ ዘመረ
የኢትዮጲያ ኩራት የተዋህዶ ፍሬ

VERSE 1
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ
ማኅሌት ጀመረ ያሬድ ዘመረ
ዜማውን ከመልእክት እያስተባበረ
ምስጋና አቀረበ ያሬድ ዘመረ
በዜማ መሣሪያ ያሬድ ዘመረ
ጸናጽል አነሳ ከበሮ መቋሚያ
አዝ===========
በግዕዝ በዕዝል ያሬድ ዘመረ
በአራራይ ዜማ ያሬድ ዘመረ
ከብሉይ ከሐዲስ ምስጢር እያስማማ
በዜማው ምልክት ያሬድ ዘመረ
የአምላክን መከራ ያሬድ ዘመረ
የመስቀሉን ነገር የማዳኑን ስራ
አዝ=======
ደሙ እየፈለቀ ያሬድ ዘመረ
በጦር ተወግቶ ያሬድ ዘመረ
ሊቁ ማኅሌታይ በመንፈስ ተቃኝቶ
በጥዑም ልሳኑ ያሬድ ዘመረ
በተሰጠው ጸጋ ያሬድ ዘመረ
ለንጉሥ እግዚአብሔር ለአልፋ ዖሜጋ
አዝ ========
ድጓ ጾመድጓ ያሬድ ዘመረ
ምዕራፍ መዋሲት ያሬድ ዘመረ
ምሥጢር ተገልጦለት በሰማይ መላእክት
የዜማ መሠረት ያሬድ ዘመረ
ተንበለ ዝማሬ ያሬድ ዘመረ
የኢትዮጲያ ኩራት የተዋህዶ ፍሬ

CHORUS
ያሬድ ካህኑ ዘመረ(2)
ዘመረ ያሬድ ዘመረ
አምላኩን አመሰገነ
አርያም በማለት ያሬድ ዘመረ
ማኅሌት ጀመረ ያሬድ ዘመረ
ዜማውን ከመልእክት እያስተባበረ
ምስጋና አቀረበ ያሬድ ዘመረ
በዜማ መሣሪያ ያሬድ ዘመረ
ጸናጽል አነሳ ከበሮ መቋሚያ
አዝ===========
በግዕዝ በዕዝል ያሬድ ዘመረ
በአራራይ ዜማ ያሬድ ዘመረ
ከብሉይ ከሐዲስ ምስጢር እያስማማ
በዜማው ምልክት ያሬድ ዘመረ
የአምላክን መከራ ያሬድ ዘመረ
የመስቀሉን ነገር የማዳኑን ስራ
አዝ=======
ደሙ እየፈለቀ ያሬድ ዘመረ
በጦር ተወግቶ ያሬድ ዘመረ
ሊቁ ማኅሌታይ በመንፈስ ተቃኝቶ
በጥዑም ልሳኑ ያሬድ ዘመረ
በተሰጠው ጸጋ ያሬድ ዘመረ
ለንጉሥ እግዚአብሔር ለአልፋ ዖሜጋ
አዝ ========
ድጓ ጾመድጓ ያሬድ ዘመረ
ምዕራፍ መዋሲት ያሬድ ዘመረ
ምሥጢር ተገልጦለት በሰማይ መላእክት
የዜማ መሠረት ያሬድ ዘመረ
ተንበለ ዝማሬ ያሬድ ዘመረ
የኢትዮጲያ ኩራት የተዋህዶ ፍሬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '058b3ce5-d6f6-46e5-ad8c-16574f153a2a'::uuid, 'yared-kahenu-zemre', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mariyam-mariyam-4090 ("Mariyam Mariyam")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0a8c3d7d-078e-4a43-a801-ea87b3252fb4'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
አውቀዋለሁ ስምሽን እናቴ ስትወለደኝ/2/',
        lyrics_transliteration = 'CHORUS
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
Awqewalehu simshn enate sitweledegn (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0a8c3d7d-078e-4a43-a801-ea87b3252fb4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም ማርያም ብዬ ስምሽን ልጥራው
አይደክመኝም እኔ ብደጋግመው
አሁንም ጠራሁሽ አላስችልህ ቢለኝ
አውቀዋለሁ ስምሽን እናቴ ስትወለደኝ/2/
ገና በማህፀን በእናቴ የምጥ ቀን
ደጋግሜ ሰማሁ ሲጠሩት ስምሽን
በሰከንዳት እድሜ የማውቃት አንዲት ቃል
ልቤላይ ያለው ስም ማርያም ማርያም ይላል
ማርያም...ማርያም
አዝ= = = = =
ሔዋን ምጧ ቀሎ ልጆቿን ታቀፈች
በአመላጅነትሽ እናቴም ታመነች
በተወለድኩባት በመጀመሪያው ቀን
ስምሽን እየሰማሁ ወጣሁ ከማህፀን
ማርያም...ማርያም
አዝ= = = = =
ከቃልኪዳን ስም ጋር አደኩኝ አብሬ
ምልጃሽ ሳይለየኝ አለሁ እስከዛሬ
የሕይወቴን ፈደል ካንቺ ላይ ቆጠርኩኝ
በልጅሽ አምኜ ዳግም ተወለድኩኝ
ማርያም...ማርያም
አዝ= = = = =
የክፉ ቀን ስንቄ ያዘልኩሽ በልቤ
የሕይወቴ ምግብ እንጀራ መሶቤ
እንደትላንትናው ዛሬም እጠራሻለሁ
የመስቅል ስር ክብሬን እንዴት እረሳለሁ
የመስቅል ስር ክብሬን እንዴት እተዋለሁ

VERSE 1
ማርያም ማርያም ብዬ ስምሽን ልጥራው
አይደክመኝም እኔ ብደጋግመው
አሁንም ጠራሁሽ አላስችልህ ቢለኝ
አውቀዋለሁ ስምሽን እናቴ ስትወለደኝ/2/
ገና በማህፀን በእናቴ የምጥ ቀን
ደጋግሜ ሰማሁ ሲጠሩት ስምሽን
በሰከንዳት እድሜ የማውቃት አንዲት ቃል
ልቤላይ ያለው ስም ማርያም ማርያም ይላል
ማርያም...ማርያም
አዝ= = = = =
ሔዋን ምጧ ቀሎ ልጆቿን ታቀፈች
በአመላጅነትሽ እናቴም ታመነች
በተወለድኩባት በመጀመሪያው ቀን
ስምሽን እየሰማሁ ወጣሁ ከማህፀን
ማርያም...ማርያም
አዝ= = = = =
ከቃልኪዳን ስም ጋር አደኩኝ አብሬ
ምልጃሽ ሳይለየኝ አለሁ እስከዛሬ
የሕይወቴን ፈደል ካንቺ ላይ ቆጠርኩኝ
በልጅሽ አምኜ ዳግም ተወለድኩኝ
ማርያም...ማርያም
አዝ= = = = =
የክፉ ቀን ስንቄ ያዘልኩሽ በልቤ
የሕይወቴ ምግብ እንጀራ መሶቤ
እንደትላንትናው ዛሬም እጠራሻለሁ
የመስቅል ስር ክብሬን እንዴት እረሳለሁ
የመስቅል ስር ክብሬን እንዴት እተዋለሁ

CHORUS
ማርያም ማርያም ብዬ ስምሽን ልጥራው
አይደክመኝም እኔ ብደጋግመው
አሁንም ጠራሁሽ አላስችልህ ቢለኝ
አውቀዋለሁ ስምሽን እናቴ ስትወለደኝ/2/
ገና በማህፀን በእናቴ የምጥ ቀን
ደጋግሜ ሰማሁ ሲጠሩት ስምሽን
በሰከንዳት እድሜ የማውቃት አንዲት ቃል
ልቤላይ ያለው ስም ማርያም ማርያም ይላል
ማርያም...ማርያም
አዝ= = = = =
ሔዋን ምጧ ቀሎ ልጆቿን ታቀፈች
በአመላጅነትሽ እናቴም ታመነች
በተወለድኩባት በመጀመሪያው ቀን
ስምሽን እየሰማሁ ወጣሁ ከማህፀን
ማርያም...ማርያም
አዝ= = = = =
ከቃልኪዳን ስም ጋር አደኩኝ አብሬ
ምልጃሽ ሳይለየኝ አለሁ እስከዛሬ
የሕይወቴን ፈደል ካንቺ ላይ ቆጠርኩኝ
በልጅሽ አምኜ ዳግም ተወለድኩኝ
ማርያም...ማርያም
አዝ= = = = =
የክፉ ቀን ስንቄ ያዘልኩሽ በልቤ
የሕይወቴ ምግብ እንጀራ መሶቤ
እንደትላንትናው ዛሬም እጠራሻለሁ
የመስቅል ስር ክብሬን እንዴት እረሳለሁ
የመስቅል ስር ክብሬን እንዴት እተዋለሁ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0a8c3d7d-078e-4a43-a801-ea87b3252fb4'::uuid, 'mariyam-mariyam-4090', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- demenaw-bayitay ("Demenaw Bayitay")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f81d5c0a-0f6f-49af-a9fb-762c9b892299'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ

VERSE 1
አስፈሪ ነው ያልኩት ድቅድቁ ጨለማ
በብርሃን ይዋጣል ድምፅ ስታሰማ
ያ የታወጀብኝ አስፈሪው አዋጄ
ከዙሪያዬ ሸሸ ስታንኳኳው ደጄን

CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ

VERSE 2
እርሱ ቃል አይበላም ያለውን ይፈጽማል
የደረቀ አጥንትን በሕይወት ያቆማል
የጠበቅኩህ አምላክ በመጠበቂያዬ
በልቅሶዬ ወራት ያልተውከኝ ጌታዬ

CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ

VERSE 3
ልታቆመኝ ስትፈቅድ ሰዓትህ ስትደስ
መባረክ ታውቃለህ በብዙ ሞገስ
እርሱ ቃል አይበላም ያለውን ይፈጽማል
የደረቀ አጥንትን በሕይወት ያቆማል

CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ

VERSE 4
እጄን በአፌ የጫንኩት በብዙ መገረም
የእንባ ሳግ ማነባው በሐዘን አይደለም
አልብሰከሰክም ትናንቴን እያሰብኩ
ከፊቴ የተሻለ መኖሩን ስላወኩ

CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ

VERSE 5
እርሱ ቃል አይበላም ያለውን ይፈጽማል
የደረቀ አጥንትን በሕይወት ያቆማል
ያለፈውን ትቼ ወደ ፊት ልራመድ
እርሱ ባሰበልኝ ባሰመረው መንገድ

CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ

VERSE 6
ከእንግዲህ አልሰጋም በምርትህ ሄጄ
ዝምታ ለምኔ ባንተ ተወድጄ
እርሱ ቃል አይበላም ያለውን ይፈጽማል
የደረቀ አጥንትን በሕይወት ያቆማል

CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Demena baytay nefasu baynefsm
Sheleqow yimolal yalewn ayat’fm
Qere balkut neger abeqa tezega
Bemamshaw yimet’al liben liyaregaga

VERSE 1
Asferi new yalkut diqdqu ch’elema
Bebrhan yiwat’al dimts’ sitasema
Ya yetawejebgn asferiw awaje
Kezuriyaye sheshe sitankwakwaw dejen

CHORUS
Demena baytay nefasu baynefsm
Sheleqow yimolal yalewn ayat’fm
Qere balkut neger abeqa tezega
Bemamshaw yimet’al liben liyaregaga

VERSE 2
Ersu qal aybelam yalewn yifets’mal
Yedereqe at’ntn behywet yaqomal
Yet’ebeqkuh amlak bemet’ebeqiyaye
Belqsoye werat yaltewkegn Getaye

CHORUS
Demena baytay nefasu baynefsm
Sheleqow yimolal yalewn ayat’fm
Qere balkut neger abeqa tezega
Bemamshaw yimet’al liben liyaregaga

VERSE 3
Litaqomegn sitfeqd seath sitdes
Mebarek tawqaleh bebzu moges
Ersu qal aybelam yalewn yifets’mal
Yedereqe at’ntn behywet yaqomal

CHORUS
Demena baytay nefasu baynefsm
Sheleqow yimolal yalewn ayat’fm
Qere balkut neger abeqa tezega
Bemamshaw yimet’al liben liyaregaga

VERSE 4
Ejen beafe yech’ankut bebzu megerem
Yeenba sag manebaw behezen aydelem
Albsekesekm tinanten eyasebku
Kefite yeteshale menorun silaweku

CHORUS
Demena baytay nefasu baynefsm
Sheleqow yimolal yalewn ayat’fm
Qere balkut neger abeqa tezega
Bemamshaw yimet’al liben liyaregaga

VERSE 5
Ersu qal aybelam yalewn yifets’mal
Yedereqe at’ntn behywet yaqomal
Yalefewn tiche wede fit liramed
Ersu basebelgn basemerew menged

CHORUS
Demena baytay nefasu baynefsm
Sheleqow yimolal yalewn ayat’fm
Qere balkut neger abeqa tezega
Bemamshaw yimet’al liben liyaregaga

VERSE 6
Keengdih alsegam bemrth heje
Zimta lemne bante tewedje
Ersu qal aybelam yalewn yifets’mal
Yedereqe at’ntn behywet yaqomal

CHORUS
Demena baytay nefasu baynefsm
Sheleqow yimolal yalewn ayat’fm
Qere balkut neger abeqa tezega
Bemamshaw yimet’al liben liyaregaga'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ

VERSE 1
አስፈሪ ነው ያልኩት ድቅድቁ ጨለማ
በብርሃን ይዋጣል ድምፅ ስታሰማ
ያ የታወጀብኝ አስፈሪው አዋጄ
ከዙሪያዬ ሸሸ ስታንኳኳው ደጄን

CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ

VERSE 2
እርሱ ቃል አይበላም ያለውን ይፈጽማል
የደረቀ አጥንትን በሕይወት ያቆማል
የጠበቅኩህ አምላክ በመጠበቂያዬ
በልቅሶዬ ወራት ያልተውከኝ ጌታዬ

CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ

VERSE 3
ልታቆመኝ ስትፈቅድ ሰዓትህ ስትደስ
መባረክ ታውቃለህ በብዙ ሞገስ
እርሱ ቃል አይበላም ያለውን ይፈጽማል
የደረቀ አጥንትን በሕይወት ያቆማል

CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ

VERSE 4
እጄን በአፌ የጫንኩት በብዙ መገረም
የእንባ ሳግ ማነባው በሐዘን አይደለም
አልብሰከሰክም ትናንቴን እያሰብኩ
ከፊቴ የተሻለ መኖሩን ስላወኩ

CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ

VERSE 5
እርሱ ቃል አይበላም ያለውን ይፈጽማል
የደረቀ አጥንትን በሕይወት ያቆማል
ያለፈውን ትቼ ወደ ፊት ልራመድ
እርሱ ባሰበልኝ ባሰመረው መንገድ

CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ

VERSE 6
ከእንግዲህ አልሰጋም በምርትህ ሄጄ
ዝምታ ለምኔ ባንተ ተወድጄ
እርሱ ቃል አይበላም ያለውን ይፈጽማል
የደረቀ አጥንትን በሕይወት ያቆማል

CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ',
        lyrics_transliteration = 'CHORUS
Demena baytay nefasu baynefsm
Sheleqow yimolal yalewn ayat’fm
Qere balkut neger abeqa tezega
Bemamshaw yimet’al liben liyaregaga

VERSE 1
Asferi new yalkut diqdqu ch’elema
Bebrhan yiwat’al dimts’ sitasema
Ya yetawejebgn asferiw awaje
Kezuriyaye sheshe sitankwakwaw dejen

CHORUS
Demena baytay nefasu baynefsm
Sheleqow yimolal yalewn ayat’fm
Qere balkut neger abeqa tezega
Bemamshaw yimet’al liben liyaregaga

VERSE 2
Ersu qal aybelam yalewn yifets’mal
Yedereqe at’ntn behywet yaqomal
Yet’ebeqkuh amlak bemet’ebeqiyaye
Belqsoye werat yaltewkegn Getaye

CHORUS
Demena baytay nefasu baynefsm
Sheleqow yimolal yalewn ayat’fm
Qere balkut neger abeqa tezega
Bemamshaw yimet’al liben liyaregaga

VERSE 3
Litaqomegn sitfeqd seath sitdes
Mebarek tawqaleh bebzu moges
Ersu qal aybelam yalewn yifets’mal
Yedereqe at’ntn behywet yaqomal

CHORUS
Demena baytay nefasu baynefsm
Sheleqow yimolal yalewn ayat’fm
Qere balkut neger abeqa tezega
Bemamshaw yimet’al liben liyaregaga

VERSE 4
Ejen beafe yech’ankut bebzu megerem
Yeenba sag manebaw behezen aydelem
Albsekesekm tinanten eyasebku
Kefite yeteshale menorun silaweku

CHORUS
Demena baytay nefasu baynefsm
Sheleqow yimolal yalewn ayat’fm
Qere balkut neger abeqa tezega
Bemamshaw yimet’al liben liyaregaga

VERSE 5
Ersu qal aybelam yalewn yifets’mal
Yedereqe at’ntn behywet yaqomal
Yalefewn tiche wede fit liramed
Ersu basebelgn basemerew menged

CHORUS
Demena baytay nefasu baynefsm
Sheleqow yimolal yalewn ayat’fm
Qere balkut neger abeqa tezega
Bemamshaw yimet’al liben liyaregaga

VERSE 6
Keengdih alsegam bemrth heje
Zimta lemne bante tewedje
Ersu qal aybelam yalewn yifets’mal
Yedereqe at’ntn behywet yaqomal

CHORUS
Demena baytay nefasu baynefsm
Sheleqow yimolal yalewn ayat’fm
Qere balkut neger abeqa tezega
Bemamshaw yimet’al liben liyaregaga',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f81d5c0a-0f6f-49af-a9fb-762c9b892299'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ

VERSE 1
አስፈሪ ነው ያልኩት ድቅድቁ ጨለማ
በብርሃን ይዋጣል ድምፅ ስታሰማ
ያ የታወጀብኝ አስፈሪው አዋጄ
ከዙሪያዬ ሸሸ ስታንኳኳው ደጄን

CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ

VERSE 2
እርሱ ቃል አይበላም ያለውን ይፈጽማል
የደረቀ አጥንትን በሕይወት ያቆማል
የጠበቅኩህ አምላክ በመጠበቂያዬ
በልቅሶዬ ወራት ያልተውከኝ ጌታዬ

CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ

VERSE 3
ልታቆመኝ ስትፈቅድ ሰዓትህ ስትደስ
መባረክ ታውቃለህ በብዙ ሞገስ
እርሱ ቃል አይበላም ያለውን ይፈጽማል
የደረቀ አጥንትን በሕይወት ያቆማል

CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ

VERSE 4
እጄን በአፌ የጫንኩት በብዙ መገረም
የእንባ ሳግ ማነባው በሐዘን አይደለም
አልብሰከሰክም ትናንቴን እያሰብኩ
ከፊቴ የተሻለ መኖሩን ስላወኩ

CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ

VERSE 5
እርሱ ቃል አይበላም ያለውን ይፈጽማል
የደረቀ አጥንትን በሕይወት ያቆማል
ያለፈውን ትቼ ወደ ፊት ልራመድ
እርሱ ባሰበልኝ ባሰመረው መንገድ

CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ

VERSE 6
ከእንግዲህ አልሰጋም በምርትህ ሄጄ
ዝምታ ለምኔ ባንተ ተወድጄ
እርሱ ቃል አይበላም ያለውን ይፈጽማል
የደረቀ አጥንትን በሕይወት ያቆማል

CHORUS
ደመና ባይታይ ነፋሱ ባይነፍስም
ሸለቆው ይሞላል ያለውን አያጥፍም
ቀረ ባልኩት ነገር አበቃ ተዘጋ
በማምሻው ይመጣል ልቤን ሊያረጋጋ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f81d5c0a-0f6f-49af-a9fb-762c9b892299'::uuid, 'demenaw-bayitay', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- libona-habeni ("Libona Habeni")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6b691bb6-1840-4513-8c10-2cd05f661afd'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ዓቅሚ ስኢነ እምበር መችኡኒ ኣይኮነን(2)',
        lyrics_transliteration = 'CHORUS
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
Aqmi siine ember mechuni aykonen (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6b691bb6-1840-4513-8c10-2cd05f661afd'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6b691bb6-1840-4513-8c10-2cd05f661afd'::uuid, 'libona-habeni', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- i-wont-forget ("I won't Forget")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b967a131-6fe7-41b6-98c4-5d52697676ec'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 1
To defeat my adversary
I sold my soul to the serpent
I was stripped of being Your son
I was alone and deserted

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 2
Until my fate you reverted.
You saved the wretched one like me
Though I don’t deserve to be
You surrendered Yourself for me

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 3
With Your blood You set me free.
The weight of my sin was a burden
My condition seem to worsen
But then you came for the rescue

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 4
And paid my debt that I was due.
You saved the wretched one like me
Though I don’t deserve to be
You surrendered Yourself for me

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 5
With Your blood You set me free.
Never deserved, your divine gift
Up to the cross, you loved me first
And now I shout, from the rooftops

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 6
I’ll sing for You, I will not stop.
You saved the wretched one like me
Though I don’t deserve to be
You surrendered Yourself for me

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 7
With Your blood You set me free

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 1
To defeat my adversary
I sold my soul to the serpent
I was stripped of being Your son
I was alone and deserted

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 2
Until my fate you reverted.
You saved the wretched one like me
Though I don’t deserve to be
You surrendered Yourself for me

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 3
With Your blood You set me free.
The weight of my sin was a burden
My condition seem to worsen
But then you came for the rescue

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 4
And paid my debt that I was due.
You saved the wretched one like me
Though I don’t deserve to be
You surrendered Yourself for me

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 5
With Your blood You set me free.
Never deserved, your divine gift
Up to the cross, you loved me first
And now I shout, from the rooftops

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 6
I’ll sing for You, I will not stop.
You saved the wretched one like me
Though I don’t deserve to be
You surrendered Yourself for me

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 7
With Your blood You set me free

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me',
        lyrics_transliteration = NULL,
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b967a131-6fe7-41b6-98c4-5d52697676ec'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 1
To defeat my adversary
I sold my soul to the serpent
I was stripped of being Your son
I was alone and deserted

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 2
Until my fate you reverted.
You saved the wretched one like me
Though I don’t deserve to be
You surrendered Yourself for me

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 3
With Your blood You set me free.
The weight of my sin was a burden
My condition seem to worsen
But then you came for the rescue

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 4
And paid my debt that I was due.
You saved the wretched one like me
Though I don’t deserve to be
You surrendered Yourself for me

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 5
With Your blood You set me free.
Never deserved, your divine gift
Up to the cross, you loved me first
And now I shout, from the rooftops

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 6
I’ll sing for You, I will not stop.
You saved the wretched one like me
Though I don’t deserve to be
You surrendered Yourself for me

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me

VERSE 7
With Your blood You set me free

CHORUS
I won’t forget what you did for me
Oh, Lord you went to hell for me
To save me from misery
Oh, Lord You went to hell for me'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b967a131-6fe7-41b6-98c4-5d52697676ec'::uuid, 'i-wont-forget', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- according-to-your-mercy ("According To Your Mercy")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0bf979d8-fc99-49d0-ad9c-e533456ac839'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 1
According to your mercy Oh God
and not according to our sin
At that time the Word who made the skies, He speaks, and the earth.
May that time we be seeing the new light.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 2
The Father crowns the Son with all might.
At that time, according to your word our God, and not according to our sin.
According to your word our God, and not according to our sin.
According to your word our God, and not according to our sin.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 3
At that time the books shall be laid bare.
All revealed, not hidden in any place.
At that time all flesh in silent fright, standing all in trembling at the sight.
According to Your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 4
According to Your mercy, our God, and not according to our sin.
According to Your mercy, our God, and not according to our sin.
At that time no high, no low, rank remains.
All as one, no race or richness sustains.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 5
At that time no man be judged but for his deeds done in life.
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 6
At the time, the righteous stand on the right.
The sinners on the left with loud cries.
At the time, Oh Lord, do not forsake us, for we are Your creation, Jesus.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 7
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 1
According to your mercy Oh God
And not according to our sin
At that time the Word who made the skies, He speaks, and the earth.
May that time we be seeing the new light.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 2
The Father crowns the Son with all might.
At that time, according to your word our God, and not according to our sin.
According to your word our God, and not according to our sin.
According to your word our God, and not according to our sin.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 3
At that time the books shall be laid bare.
All revealed, not hidden in any place.
At that time all flesh in silent fright, standing all in trembling at the sight.
According to Your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 4
According to Your mercy, our God, and not according to our sin.
According to Your mercy, our God, and not according to our sin.
At that time no high, no low, rank remains.
All as one, no race or richness sustains.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 5
At that time no man be judged but for his deeds done in life.
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 6
At the time, the righteous stand on the right.
The sinners on the left with loud cries.
At the time, Oh Lord, do not forsake us, for we are Your creation, Jesus.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 7
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 1
According to your mercy Oh God
and not according to our sin
At that time the Word who made the skies, He speaks, and the earth.
May that time we be seeing the new light.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 2
The Father crowns the Son with all might.
At that time, according to your word our God, and not according to our sin.
According to your word our God, and not according to our sin.
According to your word our God, and not according to our sin.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 3
At that time the books shall be laid bare.
All revealed, not hidden in any place.
At that time all flesh in silent fright, standing all in trembling at the sight.
According to Your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 4
According to Your mercy, our God, and not according to our sin.
According to Your mercy, our God, and not according to our sin.
At that time no high, no low, rank remains.
All as one, no race or richness sustains.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 5
At that time no man be judged but for his deeds done in life.
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 6
At the time, the righteous stand on the right.
The sinners on the left with loud cries.
At the time, Oh Lord, do not forsake us, for we are Your creation, Jesus.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 7
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin',
        lyrics_transliteration = 'CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 1
According to your mercy Oh God
And not according to our sin
At that time the Word who made the skies, He speaks, and the earth.
May that time we be seeing the new light.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 2
The Father crowns the Son with all might.
At that time, according to your word our God, and not according to our sin.
According to your word our God, and not according to our sin.
According to your word our God, and not according to our sin.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 3
At that time the books shall be laid bare.
All revealed, not hidden in any place.
At that time all flesh in silent fright, standing all in trembling at the sight.
According to Your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 4
According to Your mercy, our God, and not according to our sin.
According to Your mercy, our God, and not according to our sin.
At that time no high, no low, rank remains.
All as one, no race or richness sustains.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 5
At that time no man be judged but for his deeds done in life.
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 6
At the time, the righteous stand on the right.
The sinners on the left with loud cries.
At the time, Oh Lord, do not forsake us, for we are Your creation, Jesus.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin

VERSE 7
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
And not according to our sin
According to your mercy Oh God
And not according to our sin',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0bf979d8-fc99-49d0-ad9c-e533456ac839'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 1
According to your mercy Oh God
and not according to our sin
At that time the Word who made the skies, He speaks, and the earth.
May that time we be seeing the new light.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 2
The Father crowns the Son with all might.
At that time, according to your word our God, and not according to our sin.
According to your word our God, and not according to our sin.
According to your word our God, and not according to our sin.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 3
At that time the books shall be laid bare.
All revealed, not hidden in any place.
At that time all flesh in silent fright, standing all in trembling at the sight.
According to Your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 4
According to Your mercy, our God, and not according to our sin.
According to Your mercy, our God, and not according to our sin.
At that time no high, no low, rank remains.
All as one, no race or richness sustains.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 5
At that time no man be judged but for his deeds done in life.
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 6
At the time, the righteous stand on the right.
The sinners on the left with loud cries.
At the time, Oh Lord, do not forsake us, for we are Your creation, Jesus.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin

VERSE 7
According to your mercy, our God, and not according to our sin.
According to your mercy, our God, and not according to our sin.

CHORUS
According to your mercy Oh God
and not according to our sin
According to your mercy Oh God
and not according to our sin'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0bf979d8-fc99-49d0-ad9c-e533456ac839'::uuid, 'according-to-your-mercy', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kidane-mihiret-574 ("Kidane Mihiret")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6c5505bf-0a15-460c-9db2-f234f657b126'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳነ ምህረት ልዩ ነሽ ለኔ
ሳዝን ስጨነቅ አትራቂኝ ከጎኔ
የችግሬ ደራሽ እመ እግዚአብሔር
ቃል ኪዳንሽ ይርዳኝ ካንቺ ጋር ልኑር(፪)

VERSE 1
የአዳም ተስፋው ነሽ የሴት ቸርነቱ
ኪዳነምህረት ነሽ የኖህ ምልክቱ
አዳም ደጅ የጠናሽ ሲገባ ንስሀ
ኖህም ድኖብሻል ከጥፋቱ ውሃ

CHORUS
ኪዳነ ምህረት ልዩ ነሽ ለኔ
ሳዝን ስጨነቅ አትራቂኝ ከጎኔ
የችግሬ ደራሽ እመ እግዚአብሔር
ቃል ኪዳንሽ ይርዳኝ ካንቺ ጋር ልኑር(፪)

VERSE 2
የአብርሃም ድንኳን ነሽ የሙሴ ፅላቱ
ማርያም አንቺ ነሽ የፈጣሪ እናቱ
የእስራኤል መሰላል የሴም እጣ ክፍሉ
እመብርሃን ስሚኝ ልመናየን ሁሉ

CHORUS
ኪዳነ ምህረት ልዩ ነሽ ለኔ
ሳዝን ስጨነቅ አትራቂኝ ከጎኔ
የችግሬ ደራሽ እመ እግዚአብሔር
ቃል ኪዳንሽ ይርዳኝ ካንቺ ጋር ልኑር(፪)

VERSE 3
የሰሎሞን አክሊል የዳዊት ዝማሬ
ድንግል መሆንሽን ትመስክር ከንፈሬ
ለተጠማው ውሻ የሚራራው ልብሽ
ለኔም እራርቶልኝ አስታርቂኝ ከልጅሽ

CHORUS
ኪዳነ ምህረት ልዩ ነሽ ለኔ
ሳዝን ስጨነቅ አትራቂኝ ከጎኔ
የችግሬ ደራሽ እመ እግዚአብሔር
ቃል ኪዳንሽ ይርዳኝ ካንቺ ጋር ልኑር(፪)

VERSE 4
የአብርሃም ድንኳን ነሽ የሙሴ ፅላቱ
ማርያም አንች ነሽ የፈጣሪ እናቱ
የእስራኤል መሰላል የሴም እጣ ክፍሉ
እመብርሃን ስሚኝ ልመናዬን ሁሉ

CHORUS
ኪዳነ ምህረት ልዩ ነሽ ለኔ
ሳዝን ስጨነቅ አትራቂኝ ከጎኔ
የችግሬ ደራሽ እመ እግዚአብሔር
ቃል ኪዳንሽ ይርዳኝ ካንቺ ጋር ልኑር(፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kidane mihret liyu nesh lene
Sazn sich’eneq atraqign kegone
Yechgre derash eme Egziabher
Qal kidansh yirdagn kanchi gar linur (2)

VERSE 1
Yeadam tesfaw nesh yeset chernetu
Kidanemhret nesh yenoh milktu
Adam dej yet’enash sigeba nishe
Nohm dinobshal ket’fatu wiha

CHORUS
Kidane mihret liyu nesh lene
Sazn sich’eneq atraqign kegone
Yechgre derash eme Egziabher
Qal kidansh yirdagn kanchi gar linur (2)

VERSE 2
Yeabrham dinkwan nesh yemuse ts’latu
Maryam anchi nesh yefet’ari enatu
Yeesrael meselal yesem et’a kiflu
Emebrhan simign limenayen hulu

CHORUS
Kidane mihret liyu nesh lene
Sazn sich’eneq atraqign kegone
Yechgre derash eme Egziabher
Qal kidansh yirdagn kanchi gar linur (2)

VERSE 3
Yeselomon aklil yedawit zimare
Dingil mehonshn timeskr kenfere
Letet’emaw wisha yemiraraw libsh
Lenem erartolgn astarqign keljsh

CHORUS
Kidane mihret liyu nesh lene
Sazn sich’eneq atraqign kegone
Yechgre derash eme Egziabher
Qal kidansh yirdagn kanchi gar linur (2)

VERSE 4
Yeabrham dinkwan nesh yemuse ts’latu
Maryam anch nesh yefet’ari enatu
Yeesrael meselal yesem et’a kiflu
Emebrhan simign limenayen hulu

CHORUS
Kidane mihret liyu nesh lene
Sazn sich’eneq atraqign kegone
Yechgre derash eme Egziabher
Qal kidansh yirdagn kanchi gar linur (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኪዳነ ምህረት ልዩ ነሽ ለኔ
ሳዝን ስጨነቅ አትራቂኝ ከጎኔ
የችግሬ ደራሽ እመ እግዚአብሔር
ቃል ኪዳንሽ ይርዳኝ ካንቺ ጋር ልኑር(፪)

VERSE 1
የአዳም ተስፋው ነሽ የሴት ቸርነቱ
ኪዳነምህረት ነሽ የኖህ ምልክቱ
አዳም ደጅ የጠናሽ ሲገባ ንስሀ
ኖህም ድኖብሻል ከጥፋቱ ውሃ

CHORUS
ኪዳነ ምህረት ልዩ ነሽ ለኔ
ሳዝን ስጨነቅ አትራቂኝ ከጎኔ
የችግሬ ደራሽ እመ እግዚአብሔር
ቃል ኪዳንሽ ይርዳኝ ካንቺ ጋር ልኑር(፪)

VERSE 2
የአብርሃም ድንኳን ነሽ የሙሴ ፅላቱ
ማርያም አንቺ ነሽ የፈጣሪ እናቱ
የእስራኤል መሰላል የሴም እጣ ክፍሉ
እመብርሃን ስሚኝ ልመናየን ሁሉ

CHORUS
ኪዳነ ምህረት ልዩ ነሽ ለኔ
ሳዝን ስጨነቅ አትራቂኝ ከጎኔ
የችግሬ ደራሽ እመ እግዚአብሔር
ቃል ኪዳንሽ ይርዳኝ ካንቺ ጋር ልኑር(፪)

VERSE 3
የሰሎሞን አክሊል የዳዊት ዝማሬ
ድንግል መሆንሽን ትመስክር ከንፈሬ
ለተጠማው ውሻ የሚራራው ልብሽ
ለኔም እራርቶልኝ አስታርቂኝ ከልጅሽ

CHORUS
ኪዳነ ምህረት ልዩ ነሽ ለኔ
ሳዝን ስጨነቅ አትራቂኝ ከጎኔ
የችግሬ ደራሽ እመ እግዚአብሔር
ቃል ኪዳንሽ ይርዳኝ ካንቺ ጋር ልኑር(፪)

VERSE 4
የአብርሃም ድንኳን ነሽ የሙሴ ፅላቱ
ማርያም አንች ነሽ የፈጣሪ እናቱ
የእስራኤል መሰላል የሴም እጣ ክፍሉ
እመብርሃን ስሚኝ ልመናዬን ሁሉ

CHORUS
ኪዳነ ምህረት ልዩ ነሽ ለኔ
ሳዝን ስጨነቅ አትራቂኝ ከጎኔ
የችግሬ ደራሽ እመ እግዚአብሔር
ቃል ኪዳንሽ ይርዳኝ ካንቺ ጋር ልኑር(፪)',
        lyrics_transliteration = 'CHORUS
Kidane mihret liyu nesh lene
Sazn sich’eneq atraqign kegone
Yechgre derash eme Egziabher
Qal kidansh yirdagn kanchi gar linur (2)

VERSE 1
Yeadam tesfaw nesh yeset chernetu
Kidanemhret nesh yenoh milktu
Adam dej yet’enash sigeba nishe
Nohm dinobshal ket’fatu wiha

CHORUS
Kidane mihret liyu nesh lene
Sazn sich’eneq atraqign kegone
Yechgre derash eme Egziabher
Qal kidansh yirdagn kanchi gar linur (2)

VERSE 2
Yeabrham dinkwan nesh yemuse ts’latu
Maryam anchi nesh yefet’ari enatu
Yeesrael meselal yesem et’a kiflu
Emebrhan simign limenayen hulu

CHORUS
Kidane mihret liyu nesh lene
Sazn sich’eneq atraqign kegone
Yechgre derash eme Egziabher
Qal kidansh yirdagn kanchi gar linur (2)

VERSE 3
Yeselomon aklil yedawit zimare
Dingil mehonshn timeskr kenfere
Letet’emaw wisha yemiraraw libsh
Lenem erartolgn astarqign keljsh

CHORUS
Kidane mihret liyu nesh lene
Sazn sich’eneq atraqign kegone
Yechgre derash eme Egziabher
Qal kidansh yirdagn kanchi gar linur (2)

VERSE 4
Yeabrham dinkwan nesh yemuse ts’latu
Maryam anch nesh yefet’ari enatu
Yeesrael meselal yesem et’a kiflu
Emebrhan simign limenayen hulu

CHORUS
Kidane mihret liyu nesh lene
Sazn sich’eneq atraqign kegone
Yechgre derash eme Egziabher
Qal kidansh yirdagn kanchi gar linur (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6c5505bf-0a15-460c-9db2-f234f657b126'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳነ ምህረት ልዩ ነሽ ለኔ
ሳዝን ስጨነቅ አትራቂኝ ከጎኔ
የችግሬ ደራሽ እመ እግዚአብሔር
ቃል ኪዳንሽ ይርዳኝ ካንቺ ጋር ልኑር(፪)

VERSE 1
የአዳም ተስፋው ነሽ የሴት ቸርነቱ
ኪዳነምህረት ነሽ የኖህ ምልክቱ
አዳም ደጅ የጠናሽ ሲገባ ንስሀ
ኖህም ድኖብሻል ከጥፋቱ ውሃ

CHORUS
ኪዳነ ምህረት ልዩ ነሽ ለኔ
ሳዝን ስጨነቅ አትራቂኝ ከጎኔ
የችግሬ ደራሽ እመ እግዚአብሔር
ቃል ኪዳንሽ ይርዳኝ ካንቺ ጋር ልኑር(፪)

VERSE 2
የአብርሃም ድንኳን ነሽ የሙሴ ፅላቱ
ማርያም አንቺ ነሽ የፈጣሪ እናቱ
የእስራኤል መሰላል የሴም እጣ ክፍሉ
እመብርሃን ስሚኝ ልመናየን ሁሉ

CHORUS
ኪዳነ ምህረት ልዩ ነሽ ለኔ
ሳዝን ስጨነቅ አትራቂኝ ከጎኔ
የችግሬ ደራሽ እመ እግዚአብሔር
ቃል ኪዳንሽ ይርዳኝ ካንቺ ጋር ልኑር(፪)

VERSE 3
የሰሎሞን አክሊል የዳዊት ዝማሬ
ድንግል መሆንሽን ትመስክር ከንፈሬ
ለተጠማው ውሻ የሚራራው ልብሽ
ለኔም እራርቶልኝ አስታርቂኝ ከልጅሽ

CHORUS
ኪዳነ ምህረት ልዩ ነሽ ለኔ
ሳዝን ስጨነቅ አትራቂኝ ከጎኔ
የችግሬ ደራሽ እመ እግዚአብሔር
ቃል ኪዳንሽ ይርዳኝ ካንቺ ጋር ልኑር(፪)

VERSE 4
የአብርሃም ድንኳን ነሽ የሙሴ ፅላቱ
ማርያም አንች ነሽ የፈጣሪ እናቱ
የእስራኤል መሰላል የሴም እጣ ክፍሉ
እመብርሃን ስሚኝ ልመናዬን ሁሉ

CHORUS
ኪዳነ ምህረት ልዩ ነሽ ለኔ
ሳዝን ስጨነቅ አትራቂኝ ከጎኔ
የችግሬ ደራሽ እመ እግዚአብሔር
ቃል ኪዳንሽ ይርዳኝ ካንቺ ጋር ልኑር(፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6c5505bf-0a15-460c-9db2-f234f657b126'::uuid, 'kidane-mihiret-574', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yeaelafat-zimare-mezimur ("Yeaelafat Zimare Mezimur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '6c8556cd-9f90-4a1f-b89d-0c18bbf3d455'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 1
ባንቺ ተፈጸመ የሰው ልጆች ደስታ
በደይን የተጣለች ሔዋን ተደሰተች
የደስታ መፍለቂያ አንቺን ስላገኘች
የበረከት ፍሬ ካንቺ ተገኘልን

CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 2
የወይን ቦታ ነሽ ድንግል እናታችን
ወልድም ባሕርይሽን ባሕርይ አድርጎት
ለፍጥረታት ጌታ መዐዛሽ ተስማምቶት
ካንቺ ይወለድ ዘንድ ፍጹም ሊላላክሽ

CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 3
በጥቂት አደገ ተልኮና ታዞሽ
ከድንግልና ጋር አንድ የኾነ ሐሊብ
በሩካቤ ሳይሆን በብሥራት እንደ ንብ
ከሆድ መጥበብ ጋር የመለኮት ስፋት

CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 4
አንቺ ኾነሽ ሳለ ታናሿ ሙሽሪት
በፍጡር ሕሊና የማይመረመር
ዕጹብ ነው ድንቅ ነው የመፅነሷ ነገር
እሳተ ነበልባል በሆድሽ ውስጥ ሲያድር

CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 5
ነደ ነበልባሉ አልፈጀሽም ነበር

CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yet’efa beg adam | liqe-mezemran yilma haylu
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 1
Banchi tefets’eme yesew lijoch desta
Bedeyn yetet’alech hewan tedesetech
Yedesta mefleqiya anchin silagegnech
Yebereket fire kanchi tegegneln

CHORUS
Yet’efa beg adam | liqe-mezemran yilma haylu
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 2
Yeweyn bota nesh Dingil enatachn
Weldm bahryshn bahry adrgot
Left’retat Geta meazash tesmamtot
Kanchi yiweled zend fits’um lilalaksh

CHORUS
Yet’efa beg adam | liqe-mezemran yilma haylu
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 3
Bet’qit adege telkona tazosh
Kednglna gar and yeኾne helib
Berukabe sayhon bebsrat ende nib
Kehod met’beb gar yemelekot sifat

CHORUS
Yet’efa beg adam | liqe-mezemran yilma haylu
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 4
Anchi ኾnesh sale tanashwa mushrit
Beft’ur hilina yemaymeremer
Ets’ub new dinq new yemets’neswa neger
Esate nebelbal behodsh wist’ siyadr

CHORUS
Yet’efa beg adam | liqe-mezemran yilma haylu
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 5
Nede nebelbalu alfejeshm neber

CHORUS
Yet’efa beg adam | liqe-mezemran yilma haylu
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 1
ባንቺ ተፈጸመ የሰው ልጆች ደስታ
በደይን የተጣለች ሔዋን ተደሰተች
የደስታ መፍለቂያ አንቺን ስላገኘች
የበረከት ፍሬ ካንቺ ተገኘልን

CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 2
የወይን ቦታ ነሽ ድንግል እናታችን
ወልድም ባሕርይሽን ባሕርይ አድርጎት
ለፍጥረታት ጌታ መዐዛሽ ተስማምቶት
ካንቺ ይወለድ ዘንድ ፍጹም ሊላላክሽ

CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 3
በጥቂት አደገ ተልኮና ታዞሽ
ከድንግልና ጋር አንድ የኾነ ሐሊብ
በሩካቤ ሳይሆን በብሥራት እንደ ንብ
ከሆድ መጥበብ ጋር የመለኮት ስፋት

CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 4
አንቺ ኾነሽ ሳለ ታናሿ ሙሽሪት
በፍጡር ሕሊና የማይመረመር
ዕጹብ ነው ድንቅ ነው የመፅነሷ ነገር
እሳተ ነበልባል በሆድሽ ውስጥ ሲያድር

CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 5
ነደ ነበልባሉ አልፈጀሽም ነበር

CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ',
        lyrics_transliteration = 'CHORUS
Yet’efa beg adam | liqe-mezemran yilma haylu
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 1
Banchi tefets’eme yesew lijoch desta
Bedeyn yetet’alech hewan tedesetech
Yedesta mefleqiya anchin silagegnech
Yebereket fire kanchi tegegneln

CHORUS
Yet’efa beg adam | liqe-mezemran yilma haylu
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 2
Yeweyn bota nesh Dingil enatachn
Weldm bahryshn bahry adrgot
Left’retat Geta meazash tesmamtot
Kanchi yiweled zend fits’um lilalaksh

CHORUS
Yet’efa beg adam | liqe-mezemran yilma haylu
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 3
Bet’qit adege telkona tazosh
Kednglna gar and yeኾne helib
Berukabe sayhon bebsrat ende nib
Kehod met’beb gar yemelekot sifat

CHORUS
Yet’efa beg adam | liqe-mezemran yilma haylu
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 4
Anchi ኾnesh sale tanashwa mushrit
Beft’ur hilina yemaymeremer
Ets’ub new dinq new yemets’neswa neger
Esate nebelbal behodsh wist’ siyadr

CHORUS
Yet’efa beg adam | liqe-mezemran yilma haylu
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta

VERSE 5
Nede nebelbalu alfejeshm neber

CHORUS
Yet’efa beg adam | liqe-mezemran yilma haylu
Wedanchi yemet’aw bebruh demena
Kesostu akal andu Kristos newna
Yet’efa beg adam tadese begeta',
        updated_at = clock_timestamp()::text
    WHERE import_id = '6c8556cd-9f90-4a1f-b89d-0c18bbf3d455'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 1
ባንቺ ተፈጸመ የሰው ልጆች ደስታ
በደይን የተጣለች ሔዋን ተደሰተች
የደስታ መፍለቂያ አንቺን ስላገኘች
የበረከት ፍሬ ካንቺ ተገኘልን

CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 2
የወይን ቦታ ነሽ ድንግል እናታችን
ወልድም ባሕርይሽን ባሕርይ አድርጎት
ለፍጥረታት ጌታ መዐዛሽ ተስማምቶት
ካንቺ ይወለድ ዘንድ ፍጹም ሊላላክሽ

CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 3
በጥቂት አደገ ተልኮና ታዞሽ
ከድንግልና ጋር አንድ የኾነ ሐሊብ
በሩካቤ ሳይሆን በብሥራት እንደ ንብ
ከሆድ መጥበብ ጋር የመለኮት ስፋት

CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 4
አንቺ ኾነሽ ሳለ ታናሿ ሙሽሪት
በፍጡር ሕሊና የማይመረመር
ዕጹብ ነው ድንቅ ነው የመፅነሷ ነገር
እሳተ ነበልባል በሆድሽ ውስጥ ሲያድር

CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ

VERSE 5
ነደ ነበልባሉ አልፈጀሽም ነበር

CHORUS
የጠፋ በግ አዳም | ሊቀ-መዘምራን ይልማ ኃይሉ
ወዳንቺ የመጣው በብሩህ ደመና
ከሦስቱ አካል አንዱ ክርስቶስ ነውና
የጠፋ በግ አዳም ታደሰ በጌታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '6c8556cd-9f90-4a1f-b89d-0c18bbf3d455'::uuid, 'yeaelafat-zimare-mezimur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- live-performance-3150 ("LIVE PERFORMANCE")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a1d10712-a54e-4b2f-9e2f-46c99e425b06'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
በደሉ በዝቶበት የማርክው. ((((2))',
        lyrics_transliteration = 'CHORUS
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
Bedelu beztobet yemarkw. ((( (2))',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a1d10712-a54e-4b2f-9e2f-46c99e425b06'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያልክው ማንን ነው
ሀጢአቱ በዝቶበት
በደሉ በዝቶበት የማርክው. ((((2))
እንደ እኔ ክቶ ማ ነው
በሞገስ አስጊጠህ በዜማ ቃኝህኝ
ፊትህ እምታቆመኝ. ጌታየ እኔ ማን ነኝ
ለእኔ ያበዛህው. አቤት ደግነትህ
ምርህኝ ምርህኝ አያልቅም ምህርትህ
አይተህኝ በምህርት. አይተህኝ በምህርት
ዜሬም አለሁኝ በህይወት
---------አዝማች----+
የምስጋና መስዋዕት.ማቅርቢያ መስዊህ
ልቤ ንፁህ ባይሆን. ፀጋዬን አልቀማህ
ትቀበለኛለህ. ሞልተህ በጎደለ
እኔን የወደደ. እንደ አንተ ማን አለ
አይተህኝ በምህርት. አይተህኝ በምህርት
ዛሬም. አለሁኝ በህይወት
---አዝማች---
በምኙት ተስቤ. ለሀጢአት ተሽጨ
ለመስቀልህ ስራ. ክሞት ጣር አምልጨ
አንተ እንዳዳንክው. ስው መሆን ቢቅትም
እኔ ተስፈ ብቁርጥ
ተስፋ አትቁርጥብኝም
አይተህኝ በምህርት.
አይተህኝ በምህርት
ዛሬም አለሁኝ በህይወት
---------አዝማች_
የኖርኩበት ዘመን. የቁጣ ልጅ ሆኝ
ምዕራፍ ተዘጋ በአንተ በአዳኘ
ክእኔ ምንም ሳይኖር አንተ ሁሉን ሆነህ
ስገነት ታየሁኝ. ስለ እኔ ተንቀህ
አይተህኝ በምህርት ፣አይተህኝ በምህርት
ዛሬም. አለሁኝ በህይወት
---አዝማች--
እኔ ማርኝ ክምል ክፊትህ ወድቄ
በሌላው ፍራጅ ነኝ ራሴን አፃድቂ
መመልክት ባልችልም የአይኔን ምሰሶ
ሚኖርኝ ፍቅርህ ነው ይህን ሁሉ ታግሶ
አይተህኝ በምህርት
አይተህኝ በምህርት
ዛሬም አለሁኝ በህይወት
----አዝማች-----
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያለው ማንን ነው
ሀጢቱ በዝቱበት
በደሉ በዝቶበት የማርክው
እንደ እኔ ክቶ ማን ነው
ይቅር ስላልከኝ ነዉ የእኔ መቆም ፣
ደግሞ እንዳልፈርድ እርዳኝ፣
በሰዎች ድካም።
ባታለብሰኝ ኖሮ ነዉሬን ሸፍነህ ፣
በታቆመኝ ኖሮ በደሌን ከድነህ፣
በጠፋ ነበር ስም አጠራሬ ፣
ድካሜ ብዙ ነዉ እንደ ራስ ፀጉሬ።
ጉዲፉን አልይ የወንድሜን በደል፣
አለ በነ ላይ ምሶሶን የምያህል።

VERSE 1
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያልክው ማንን ነው
ሀጢአቱ በዝቶበት
በደሉ በዝቶበት የማርክው. ((((2))
እንደ እኔ ክቶ ማ ነው
በሞገስ አስጊጠህ በዜማ ቃኝህኝ
ፊትህ እምታቆመኝ. ጌታየ እኔ ማን ነኝ
ለእኔ ያበዛህው. አቤት ደግነትህ
ምርህኝ ምርህኝ አያልቅም ምህርትህ
አይተህኝ በምህርት. አይተህኝ በምህርት
ዜሬም አለሁኝ በህይወት
---------አዝማች----+
የምስጋና መስዋዕት.ማቅርቢያ መስዊህ
ልቤ ንፁህ ባይሆን. ፀጋዬን አልቀማህ
ትቀበለኛለህ. ሞልተህ በጎደለ
እኔን የወደደ. እንደ አንተ ማን አለ
አይተህኝ በምህርት. አይተህኝ በምህርት
ዛሬም. አለሁኝ በህይወት
---አዝማች---
በምኙት ተስቤ. ለሀጢአት ተሽጨ
ለመስቀልህ ስራ. ክሞት ጣር አምልጨ
አንተ እንዳዳንክው. ስው መሆን ቢቅትም
እኔ ተስፈ ብቁርጥ
ተስፋ አትቁርጥብኝም
አይተህኝ በምህርት.
አይተህኝ በምህርት
ዛሬም አለሁኝ በህይወት
---------አዝማች_
የኖርኩበት ዘመን. የቁጣ ልጅ ሆኝ
ምዕራፍ ተዘጋ በአንተ በአዳኘ
ክእኔ ምንም ሳይኖር አንተ ሁሉን ሆነህ
ስገነት ታየሁኝ. ስለ እኔ ተንቀህ
አይተህኝ በምህርት ፣አይተህኝ በምህርት
ዛሬም. አለሁኝ በህይወት
---አዝማች--
እኔ ማርኝ ክምል ክፊትህ ወድቄ
በሌላው ፍራጅ ነኝ ራሴን አፃድቂ
መመልክት ባልችልም የአይኔን ምሰሶ
ሚኖርኝ ፍቅርህ ነው ይህን ሁሉ ታግሶ
አይተህኝ በምህርት
አይተህኝ በምህርት
ዛሬም አለሁኝ በህይወት
----አዝማች-----
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያለው ማንን ነው
ሀጢቱ በዝቱበት
በደሉ በዝቶበት የማርክው
እንደ እኔ ክቶ ማን ነው
ይቅር ስላልከኝ ነዉ የእኔ መቆም ፣
ደግሞ እንዳልፈርድ እርዳኝ፣
በሰዎች ድካም።
ባታለብሰኝ ኖሮ ነዉሬን ሸፍነህ ፣
በታቆመኝ ኖሮ በደሌን ከድነህ፣
በጠፋ ነበር ስም አጠራሬ ፣
ድካሜ ብዙ ነዉ እንደ ራስ ፀጉሬ።
ጉዲፉን አልይ የወንድሜን በደል፣
አለ በነ ላይ ምሶሶን የምያህል።

CHORUS
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያልክው ማንን ነው
ሀጢአቱ በዝቶበት
በደሉ በዝቶበት የማርክው. ((((2))
እንደ እኔ ክቶ ማ ነው
በሞገስ አስጊጠህ በዜማ ቃኝህኝ
ፊትህ እምታቆመኝ. ጌታየ እኔ ማን ነኝ
ለእኔ ያበዛህው. አቤት ደግነትህ
ምርህኝ ምርህኝ አያልቅም ምህርትህ
አይተህኝ በምህርት. አይተህኝ በምህርት
ዜሬም አለሁኝ በህይወት
---------አዝማች----+
የምስጋና መስዋዕት.ማቅርቢያ መስዊህ
ልቤ ንፁህ ባይሆን. ፀጋዬን አልቀማህ
ትቀበለኛለህ. ሞልተህ በጎደለ
እኔን የወደደ. እንደ አንተ ማን አለ
አይተህኝ በምህርት. አይተህኝ በምህርት
ዛሬም. አለሁኝ በህይወት
---አዝማች---
በምኙት ተስቤ. ለሀጢአት ተሽጨ
ለመስቀልህ ስራ. ክሞት ጣር አምልጨ
አንተ እንዳዳንክው. ስው መሆን ቢቅትም
እኔ ተስፈ ብቁርጥ
ተስፋ አትቁርጥብኝም
አይተህኝ በምህርት.
አይተህኝ በምህርት
ዛሬም አለሁኝ በህይወት
---------አዝማች_
የኖርኩበት ዘመን. የቁጣ ልጅ ሆኝ
ምዕራፍ ተዘጋ በአንተ በአዳኘ
ክእኔ ምንም ሳይኖር አንተ ሁሉን ሆነህ
ስገነት ታየሁኝ. ስለ እኔ ተንቀህ
አይተህኝ በምህርት ፣አይተህኝ በምህርት
ዛሬም. አለሁኝ በህይወት
---አዝማች--
እኔ ማርኝ ክምል ክፊትህ ወድቄ
በሌላው ፍራጅ ነኝ ራሴን አፃድቂ
መመልክት ባልችልም የአይኔን ምሰሶ
ሚኖርኝ ፍቅርህ ነው ይህን ሁሉ ታግሶ
አይተህኝ በምህርት
አይተህኝ በምህርት
ዛሬም አለሁኝ በህይወት
----አዝማች-----
እንደ እኔ የማርክው ማንን ነው
እንደ እኔ ይቅር ያለው ማንን ነው
ሀጢቱ በዝቱበት
በደሉ በዝቶበት የማርክው
እንደ እኔ ክቶ ማን ነው
ይቅር ስላልከኝ ነዉ የእኔ መቆም ፣
ደግሞ እንዳልፈርድ እርዳኝ፣
በሰዎች ድካም።
ባታለብሰኝ ኖሮ ነዉሬን ሸፍነህ ፣
በታቆመኝ ኖሮ በደሌን ከድነህ፣
በጠፋ ነበር ስም አጠራሬ ፣
ድካሜ ብዙ ነዉ እንደ ራስ ፀጉሬ።
ጉዲፉን አልይ የወንድሜን በደል፣
አለ በነ ላይ ምሶሶን የምያህል።'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a1d10712-a54e-4b2f-9e2f-46c99e425b06'::uuid, 'live-performance-3150', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- welden-fikir-sabew ("Welden Fikir Sabew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '06be12a9-bc36-4695-8df1-4b7c117f139f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ

VERSE 1
የሱን ለኛ የኛን ለእርሱ
ክብር ይሁን ለንጉሱ(2)
ጻድቅ ፈራጅ ድንቅ ዳኛ
ክብሩን ጥሎ ግርግም ተኛ

CHORUS
ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ

VERSE 2
ሳይጎልበት ሆነ ባዶ
በፍጹም ፍቅር እኛን ወዶ (2)
ሁለተኛው አዳም መጣ
የማይጠልቀው ጸሀይ ወጣ

CHORUS
ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ

VERSE 3
የዲያብሎስ ስራ ፈርሷል
መንጋው ሁሉ ጽድቅን ለብሷል(2)
ስለ ሁሉ አንዱ ሞተ
እንድንለብስ ተራቆተ

CHORUS
ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ

VERSE 4
በከፈለው የደም ዋጋ
አዲስ ሆንን ባለፀጋ(2)

CHORUS
ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Weldn fiqr sabew kesemay hegeru (2)
Ersu dihe hone lijochu endikebru (2)
YeEgziabher beg tegelet’e
Lezelalem mot tewat’e

VERSE 1
Yesun legna yegnan leersu
Kibir yihun lengusu (2)
Ts’adq feraj dinq dagna
Kibrun t’lo girgm tegna

CHORUS
Weldn fiqr sabew kesemay hegeru (2)
Ersu dihe hone lijochu endikebru (2)
YeEgziabher beg tegelet’e
Lezelalem mot tewat’e

VERSE 2
Saygolbet hone bado
Befts’um fiqr egnan wedo (2)
Huletegnaw adam met’a
Yemayt’elqew ts’ehey wet’a

CHORUS
Weldn fiqr sabew kesemay hegeru (2)
Ersu dihe hone lijochu endikebru (2)
YeEgziabher beg tegelet’e
Lezelalem mot tewat’e

VERSE 3
Yediyablos sira ferswal
Mengaw hulu ts’dqn lebswal (2)
Sile hulu andu mote
Endnlebs teraqote

CHORUS
Weldn fiqr sabew kesemay hegeru (2)
Ersu dihe hone lijochu endikebru (2)
YeEgziabher beg tegelet’e
Lezelalem mot tewat’e

VERSE 4
Bekefelew yedem waga
Adis honn balets’ega (2)

CHORUS
Weldn fiqr sabew kesemay hegeru (2)
Ersu dihe hone lijochu endikebru (2)
YeEgziabher beg tegelet’e
Lezelalem mot tewat’e'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ

VERSE 1
የሱን ለኛ የኛን ለእርሱ
ክብር ይሁን ለንጉሱ(2)
ጻድቅ ፈራጅ ድንቅ ዳኛ
ክብሩን ጥሎ ግርግም ተኛ

CHORUS
ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ

VERSE 2
ሳይጎልበት ሆነ ባዶ
በፍጹም ፍቅር እኛን ወዶ (2)
ሁለተኛው አዳም መጣ
የማይጠልቀው ጸሀይ ወጣ

CHORUS
ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ

VERSE 3
የዲያብሎስ ስራ ፈርሷል
መንጋው ሁሉ ጽድቅን ለብሷል(2)
ስለ ሁሉ አንዱ ሞተ
እንድንለብስ ተራቆተ

CHORUS
ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ

VERSE 4
በከፈለው የደም ዋጋ
አዲስ ሆንን ባለፀጋ(2)

CHORUS
ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ',
        lyrics_transliteration = 'CHORUS
Weldn fiqr sabew kesemay hegeru (2)
Ersu dihe hone lijochu endikebru (2)
YeEgziabher beg tegelet’e
Lezelalem mot tewat’e

VERSE 1
Yesun legna yegnan leersu
Kibir yihun lengusu (2)
Ts’adq feraj dinq dagna
Kibrun t’lo girgm tegna

CHORUS
Weldn fiqr sabew kesemay hegeru (2)
Ersu dihe hone lijochu endikebru (2)
YeEgziabher beg tegelet’e
Lezelalem mot tewat’e

VERSE 2
Saygolbet hone bado
Befts’um fiqr egnan wedo (2)
Huletegnaw adam met’a
Yemayt’elqew ts’ehey wet’a

CHORUS
Weldn fiqr sabew kesemay hegeru (2)
Ersu dihe hone lijochu endikebru (2)
YeEgziabher beg tegelet’e
Lezelalem mot tewat’e

VERSE 3
Yediyablos sira ferswal
Mengaw hulu ts’dqn lebswal (2)
Sile hulu andu mote
Endnlebs teraqote

CHORUS
Weldn fiqr sabew kesemay hegeru (2)
Ersu dihe hone lijochu endikebru (2)
YeEgziabher beg tegelet’e
Lezelalem mot tewat’e

VERSE 4
Bekefelew yedem waga
Adis honn balets’ega (2)

CHORUS
Weldn fiqr sabew kesemay hegeru (2)
Ersu dihe hone lijochu endikebru (2)
YeEgziabher beg tegelet’e
Lezelalem mot tewat’e',
        updated_at = clock_timestamp()::text
    WHERE import_id = '06be12a9-bc36-4695-8df1-4b7c117f139f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ

VERSE 1
የሱን ለኛ የኛን ለእርሱ
ክብር ይሁን ለንጉሱ(2)
ጻድቅ ፈራጅ ድንቅ ዳኛ
ክብሩን ጥሎ ግርግም ተኛ

CHORUS
ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ

VERSE 2
ሳይጎልበት ሆነ ባዶ
በፍጹም ፍቅር እኛን ወዶ (2)
ሁለተኛው አዳም መጣ
የማይጠልቀው ጸሀይ ወጣ

CHORUS
ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ

VERSE 3
የዲያብሎስ ስራ ፈርሷል
መንጋው ሁሉ ጽድቅን ለብሷል(2)
ስለ ሁሉ አንዱ ሞተ
እንድንለብስ ተራቆተ

CHORUS
ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ

VERSE 4
በከፈለው የደም ዋጋ
አዲስ ሆንን ባለፀጋ(2)

CHORUS
ወልድን ፍቅር ሳበው ከሰማይ ሀገሩ (2)
እርሱ ድሀ ሆነ ልጆቹ እንዲከብሩ (2)
የእግዚአብሔር በግ ተገለጠ
ለዘላለም ሞት ተዋጠ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '06be12a9-bc36-4695-8df1-4b7c117f139f'::uuid, 'welden-fikir-sabew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zemari-abel-egeziabhire-yewedekuten-yanesal ("Zemari Abel Egeziabhire Yewedekuten Yanesal")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '39e87db9-7e0c-48c4-95be-8fcb2e36fa53'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
አንተ በክብር ላይ ክብር ስጨምር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Ante bekbr lay kibir sich’emr'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '39e87db9-7e0c-48c4-95be-8fcb2e36fa53'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
አንተ በክብር ላይ ክብር ስጨምር'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '39e87db9-7e0c-48c4-95be-8fcb2e36fa53'::uuid, 'zemari-abel-egeziabhire-yewedekuten-yanesal', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yeteshale-neger-asibehilign-new ("Yeteshale Neger Asibehilign New")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b97ac57f-d8e2-4102-b912-db6541f1ffe6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Andandema beqa restognal elalehu enen titognal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b97ac57f-d8e2-4102-b912-db6541f1ffe6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
አንዳንዴማ በቃ ሬስቶኛል እላለሁ እኔን ትቶኛል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b97ac57f-d8e2-4102-b912-db6541f1ffe6'::uuid, 'yeteshale-neger-asibehilign-new', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mekeraw-kirisitinayen-atafetew ("Mekeraw Kirisitinayen Atafetew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'bd3a9b59-e39f-427e-a316-5ac6e7198ed9'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
አየሁት እግዚአብሄርን ከእኔ ጋራ',
        lyrics_transliteration = 'CHORUS
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
Ayehut egziabhern keene gara',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'bd3a9b59-e39f-427e-a316-5ac6e7198ed9'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'bd3a9b59-e39f-427e-a316-5ac6e7198ed9'::uuid, 'mekeraw-kirisitinayen-atafetew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
