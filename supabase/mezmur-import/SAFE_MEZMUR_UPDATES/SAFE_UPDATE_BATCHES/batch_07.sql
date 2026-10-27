-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 07 OF 32
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
  -- subscribe ("subscribe")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '72ffb6d5-e5ca-44e1-ab3d-38c0c8c3d185'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 1
ዘወድቀ ውስተ ፍኖተ
ሲዘራ ያለቀው አእዋፈ ሰማይ
መሳጢ ነጠቀው
ዘወድቀ ዲበ ኮሕ

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 2
ጥልቅ አፈር ከሌለው
በደስታ እየሰማ በችግር የካደው
ዘወድቀ ውስተ ሶክ
ተጨንቆ እንዳይወጣ በአለም ትካዜ

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 3
በስፍጠተ ብዕል ታንቆ ፍሬ ያጣው
ውስተ ምድር ሰናይ
የወደቀም ነበር ዘወሀበ ፍሬ ሰምቶ የሚተገብር
ጌታዬ ከአራቱ ስፍራዎች በምሳሌ ካልከው

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 4
ወዴት ወድቆ ይሆን ከእኔ ልብ የላከው
እባክህ ጎተራ አበጅተህ ለአጨዳ ስትመጣ
ከፍሬያማው ክምር እድል እንዳላጣ
ከእሾህ ከጭንጫ ላይ ከመንገድ እንዳልቀር

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 5
ልቤ ልብ አግኝቶ በምግባር እንዲኖር
እራሴን መስማት ትቼ ለአንተ ፈቃድ ልደር
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 6
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

VERSE 1
Zewedqe wiste finote
Sizera yaleqew aewafe semay
Mesat’i net’eqew
Zewedqe dibe koh

CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

VERSE 2
T’lq afer kelelew
Bedesta eyesema bechgr yekadew
Zewedqe wiste sok
Tech’enqo endaywet’a bealem tikaze

CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

VERSE 3
Besft’ete biel tanqo fire yat’aw
Wiste midr senay
Yewedeqem neber zewehebe fire semto yemitegebr
Getaye kearatu sifrawoch bemsale kalkew

CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

VERSE 4
Wedet wedqo yihon keene lib yelakew
Ebakh gotera abejteh leach’eda sitmet’a
Kefreyamaw kimr edl endalat’a
Keeshoh kech’nch’a lay kemenged endalqer

CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

VERSE 5
Libe lib aggnto bemgbar endinor
Erasen mesmat tiche leante feqad lider
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)

CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

VERSE 6
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 1
ዘወድቀ ውስተ ፍኖተ
ሲዘራ ያለቀው አእዋፈ ሰማይ
መሳጢ ነጠቀው
ዘወድቀ ዲበ ኮሕ

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 2
ጥልቅ አፈር ከሌለው
በደስታ እየሰማ በችግር የካደው
ዘወድቀ ውስተ ሶክ
ተጨንቆ እንዳይወጣ በአለም ትካዜ

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 3
በስፍጠተ ብዕል ታንቆ ፍሬ ያጣው
ውስተ ምድር ሰናይ
የወደቀም ነበር ዘወሀበ ፍሬ ሰምቶ የሚተገብር
ጌታዬ ከአራቱ ስፍራዎች በምሳሌ ካልከው

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 4
ወዴት ወድቆ ይሆን ከእኔ ልብ የላከው
እባክህ ጎተራ አበጅተህ ለአጨዳ ስትመጣ
ከፍሬያማው ክምር እድል እንዳላጣ
ከእሾህ ከጭንጫ ላይ ከመንገድ እንዳልቀር

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 5
ልቤ ልብ አግኝቶ በምግባር እንዲኖር
እራሴን መስማት ትቼ ለአንተ ፈቃድ ልደር
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 6
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)',
        lyrics_transliteration = 'CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

VERSE 1
Zewedqe wiste finote
Sizera yaleqew aewafe semay
Mesat’i net’eqew
Zewedqe dibe koh

CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

VERSE 2
T’lq afer kelelew
Bedesta eyesema bechgr yekadew
Zewedqe wiste sok
Tech’enqo endaywet’a bealem tikaze

CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

VERSE 3
Besft’ete biel tanqo fire yat’aw
Wiste midr senay
Yewedeqem neber zewehebe fire semto yemitegebr
Getaye kearatu sifrawoch bemsale kalkew

CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

VERSE 4
Wedet wedqo yihon keene lib yelakew
Ebakh gotera abejteh leach’eda sitmet’a
Kefreyamaw kimr edl endalat’a
Keeshoh kech’nch’a lay kemenged endalqer

CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

VERSE 5
Libe lib aggnto bemgbar endinor
Erasen mesmat tiche leante feqad lider
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)

CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

VERSE 6
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)

CHORUS
Enkrdad nufaqen geberew leyto
Melkam zer sizera wedemasaw wet’to (2)
Leach’edaw mits’at lebegaw azmera
Wedet wedqo yihon kiremt yetezera (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '72ffb6d5-e5ca-44e1-ab3d-38c0c8c3d185'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 1
ዘወድቀ ውስተ ፍኖተ
ሲዘራ ያለቀው አእዋፈ ሰማይ
መሳጢ ነጠቀው
ዘወድቀ ዲበ ኮሕ

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 2
ጥልቅ አፈር ከሌለው
በደስታ እየሰማ በችግር የካደው
ዘወድቀ ውስተ ሶክ
ተጨንቆ እንዳይወጣ በአለም ትካዜ

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 3
በስፍጠተ ብዕል ታንቆ ፍሬ ያጣው
ውስተ ምድር ሰናይ
የወደቀም ነበር ዘወሀበ ፍሬ ሰምቶ የሚተገብር
ጌታዬ ከአራቱ ስፍራዎች በምሳሌ ካልከው

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 4
ወዴት ወድቆ ይሆን ከእኔ ልብ የላከው
እባክህ ጎተራ አበጅተህ ለአጨዳ ስትመጣ
ከፍሬያማው ክምር እድል እንዳላጣ
ከእሾህ ከጭንጫ ላይ ከመንገድ እንዳልቀር

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 5
ልቤ ልብ አግኝቶ በምግባር እንዲኖር
እራሴን መስማት ትቼ ለአንተ ፈቃድ ልደር
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

VERSE 6
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)

CHORUS
እንክርዳድ ኑፋቄን ገበሬው ለይቶ
መልካም ዘር ሲዘራ ወደማሳው ወጥቶ(፪)
ለአጨዳው ምጽአት ለበጋው አዝመራ
ወዴት ወድቆ ይሆን ክረምት የተዘራ(፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '72ffb6d5-e5ca-44e1-ab3d-38c0c8c3d185'::uuid, 'subscribe', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kene-nesh ("kene Nesh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '77ba1985-c46d-4367-8750-91fea18f9d71'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 1
ግብሬ ክፉ ስራ መንገዴ የግፍ
ፅልመት ያጨለመው ከድካም ማላርፍ
አንቺ ስትሰጪኝ ከመስቀሉ ግርጌ
እንዴት ላመስግንሽ እንዴትስ አድርጌ

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 2
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 3
ቅኔ ነሽ የማይቆም ዝማሬ
ያፈልቃል መወድስ ከንፈሬ
ሞገስ ነሽ ለምስኪናን ሁሉ
ማርያም ምልዕተ ኩሉ

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 4
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 5
አቦጊዳዬ ነሽ ፅድቅ የተማርኩብሽ
የፊደል ገበታ ጌታን ያወኩብሽ
የህይወት መገኛ ቤተልሔም ለህብስቱ
ተቀዳ ከሆድሽ ህይወት ለፍጥረቱ

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 6
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 7
ርግብየ ንኢ ሰናይትየ
ልቤ አያርፍ ልጅሽን ካላየ
መገኛ የሰላም የዕረፍቱ
ላመነሽ ቅጥር ነሽ ዕርስቱ

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 8
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 9
ምዕሊተ ፀጋ የንጉስ ሙሽራ
ለተጠማ ውሻ ልብሽ የሚራራ
ሸልሞ ከሰጠኝ አንቺን ለእናትነት
በስምሽ ልጠራ እንድታወቅበት

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 10
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 11
ጣፋጭ ነሽ ከማር ከወለላ
ምስጋናሽ አንደበቴን ይሙላ
ለንጉስ ኪሩብ ለመንግስቱ
ማረፊያ ድንግል ለፍጥረቱ

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 12
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 1
Gibre kifu sira mengede yegif
Tsilmet yach''elemew kedikam malarif
Anchi sitisetsign kemeskelu girge
Indet lamesginish indetis adirge

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 2
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 3
K''ine nesh yemayikom zimare
Yafelkal mewedis kenfere
Moges nesh lemiskinan hulu
Maryam milite kulu

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 4
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 5
Abogidaye nesh tsidik yetemarkubish
Yefidel gebeta getan yawekubish
Yehiwot megenya betelihem lehibistu
Tek''eda kehodish hiwot lefitretu

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 6
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 7
Rigbiye ni''i senayitiye
Libe ayarif lijishin kalaye
Megenya yeselam ye''irefitu
Lamenesh kit''ir nesh iristu

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 8
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 9
Mi''ilite tsega yenigus mushira
Letetema wusha libish yemirara
Shelmo kesetegn anchin le''inatinet
Besimish litera inditawek''ibet

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 10
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 11
Tafach'' nesh kemar kewelela
Misganash andebeten yimula
Lenigus kirub lemengistu
Marefiya dingil lefitretu

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 12
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 1
ግብሬ ክፉ ስራ መንገዴ የግፍ
ፅልመት ያጨለመው ከድካም ማላርፍ
አንቺ ስትሰጪኝ ከመስቀሉ ግርጌ
እንዴት ላመስግንሽ እንዴትስ አድርጌ

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 2
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 3
ቅኔ ነሽ የማይቆም ዝማሬ
ያፈልቃል መወድስ ከንፈሬ
ሞገስ ነሽ ለምስኪናን ሁሉ
ማርያም ምልዕተ ኩሉ

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 4
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 5
አቦጊዳዬ ነሽ ፅድቅ የተማርኩብሽ
የፊደል ገበታ ጌታን ያወኩብሽ
የህይወት መገኛ ቤተልሔም ለህብስቱ
ተቀዳ ከሆድሽ ህይወት ለፍጥረቱ

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 6
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 7
ርግብየ ንኢ ሰናይትየ
ልቤ አያርፍ ልጅሽን ካላየ
መገኛ የሰላም የዕረፍቱ
ላመነሽ ቅጥር ነሽ ዕርስቱ

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 8
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 9
ምዕሊተ ፀጋ የንጉስ ሙሽራ
ለተጠማ ውሻ ልብሽ የሚራራ
ሸልሞ ከሰጠኝ አንቺን ለእናትነት
በስምሽ ልጠራ እንድታወቅበት

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 10
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 11
ጣፋጭ ነሽ ከማር ከወለላ
ምስጋናሽ አንደበቴን ይሙላ
ለንጉስ ኪሩብ ለመንግስቱ
ማረፊያ ድንግል ለፍጥረቱ

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 12
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው',
        lyrics_transliteration = 'CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 1
Gibre kifu sira mengede yegif
Tsilmet yach''elemew kedikam malarif
Anchi sitisetsign kemeskelu girge
Indet lamesginish indetis adirge

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 2
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 3
K''ine nesh yemayikom zimare
Yafelkal mewedis kenfere
Moges nesh lemiskinan hulu
Maryam milite kulu

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 4
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 5
Abogidaye nesh tsidik yetemarkubish
Yefidel gebeta getan yawekubish
Yehiwot megenya betelihem lehibistu
Tek''eda kehodish hiwot lefitretu

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 6
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 7
Rigbiye ni''i senayitiye
Libe ayarif lijishin kalaye
Megenya yeselam ye''irefitu
Lamenesh kit''ir nesh iristu

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 8
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 9
Mi''ilite tsega yenigus mushira
Letetema wusha libish yemirara
Shelmo kesetegn anchin le''inatinet
Besimish litera inditawek''ibet

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 10
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 11
Tafach'' nesh kemar kewelela
Misganash andebeten yimula
Lenigus kirub lemengistu
Marefiya dingil lefitretu

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 12
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew',
        updated_at = clock_timestamp()::text
    WHERE import_id = '77ba1985-c46d-4367-8750-91fea18f9d71'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 1
ግብሬ ክፉ ስራ መንገዴ የግፍ
ፅልመት ያጨለመው ከድካም ማላርፍ
አንቺ ስትሰጪኝ ከመስቀሉ ግርጌ
እንዴት ላመስግንሽ እንዴትስ አድርጌ

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 2
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 3
ቅኔ ነሽ የማይቆም ዝማሬ
ያፈልቃል መወድስ ከንፈሬ
ሞገስ ነሽ ለምስኪናን ሁሉ
ማርያም ምልዕተ ኩሉ

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 4
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 5
አቦጊዳዬ ነሽ ፅድቅ የተማርኩብሽ
የፊደል ገበታ ጌታን ያወኩብሽ
የህይወት መገኛ ቤተልሔም ለህብስቱ
ተቀዳ ከሆድሽ ህይወት ለፍጥረቱ

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 6
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 7
ርግብየ ንኢ ሰናይትየ
ልቤ አያርፍ ልጅሽን ካላየ
መገኛ የሰላም የዕረፍቱ
ላመነሽ ቅጥር ነሽ ዕርስቱ

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 8
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 9
ምዕሊተ ፀጋ የንጉስ ሙሽራ
ለተጠማ ውሻ ልብሽ የሚራራ
ሸልሞ ከሰጠኝ አንቺን ለእናትነት
በስምሽ ልጠራ እንድታወቅበት

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 10
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 11
ጣፋጭ ነሽ ከማር ከወለላ
ምስጋናሽ አንደበቴን ይሙላ
ለንጉስ ኪሩብ ለመንግስቱ
ማረፊያ ድንግል ለፍጥረቱ

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

VERSE 12
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው

CHORUS
ልጠራ ልሰየም ድንግል በስምሽ
ከሰጠኝ በመስቀል እናቴ አድርጎሽ
ግቢ ወደ ቤቴ ወደ ጎሰቆለው
ሀዘን በበዛበት ባይተዋር በሆነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 1
Gibre kifu sira mengede yegif
Tsilmet yach''elemew kedikam malarif
Anchi sitisetsign kemeskelu girge
Indet lamesginish indetis adirge

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 2
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 3
K''ine nesh yemayikom zimare
Yafelkal mewedis kenfere
Moges nesh lemiskinan hulu
Maryam milite kulu

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 4
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 5
Abogidaye nesh tsidik yetemarkubish
Yefidel gebeta getan yawekubish
Yehiwot megenya betelihem lehibistu
Tek''eda kehodish hiwot lefitretu

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 6
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 7
Rigbiye ni''i senayitiye
Libe ayarif lijishin kalaye
Megenya yeselam ye''irefitu
Lamenesh kit''ir nesh iristu

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 8
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 9
Mi''ilite tsega yenigus mushira
Letetema wusha libish yemirara
Shelmo kesetegn anchin le''inatinet
Besimish litera inditawek''ibet

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 10
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 11
Tafach'' nesh kemar kewelela
Misganash andebeten yimula
Lenigus kirub lemengistu
Marefiya dingil lefitretu

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

VERSE 12
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew

CHORUS
Litera liseyem dingil besimish
Kesetegn bemeskel inate adirgosh
Gibi wode bete wode gosekolew
Hazen bebezabet baytewar behonew';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '77ba1985-c46d-4367-8750-91fea18f9d71'::uuid, 'kene-nesh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- lenefse-nefswa-mindaye-birhanu ("lenefse nefswa mindaye birhanu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0e1884d9-632a-4160-9cb0-96d818196994'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ከብሉይ ከሐዲስ ብንዘረዝራቸው',
        lyrics_transliteration = 'CHORUS
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
Kebluy kehedis binzerezrachew',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0e1884d9-632a-4160-9cb0-96d818196994'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0e1884d9-632a-4160-9cb0-96d818196994'::uuid, 'lenefse-nefswa-mindaye-birhanu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yemayimotew-mote-3359 ("Yemayimotew Mote")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '0ee0f7f1-4eaf-480a-b819-e6608ff3cea0'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኦ የማይሞተው ሞተ/፪/
ሄደ ቀራንዮ እየተጐተተ
ወድቆ እየተነሳ እንዲያ እየቃተተ
ሞትን ይሽረው ዘንድ የማይሞተው ሞተ/፪/

VERSE 1
እጅና እግሩን ታስሮ ሄደ አደባባይ
እየተገረፈ ታግሶ ስቃይ
አለቀሰች ቆማ ድንግል ማርያም
ተሰቅሎባት ልጇ መድኀኔዓለም

CHORUS
ኦ የማይሞተው ሞተ/፪/
ሄደ ቀራንዮ እየተጐተተ
ወድቆ እየተነሳ እንዲያ እየቃተተ
ሞትን ይሽረው ዘንድ የማይሞተው ሞተ/፪/

VERSE 2
በአይሁድ አደባባይ ፍርድ ተንጋደደ
ወንበዴ ተለቆ ንጹሕ በግ ታረደ
የማይሞተው ሞተ ለሰው ፍቅር ብሎ
ዋለ ቀራንዮ በእንጨት ላይ ተሰቅሎ

CHORUS
ኦ የማይሞተው ሞተ/፪/
ሄደ ቀራንዮ እየተጐተተ
ወድቆ እየተነሳ እንዲያ እየቃተተ
ሞትን ይሽረው ዘንድ የማይሞተው ሞተ/፪/

VERSE 3
ዮሴፍ ኒቆዲሞስ ሥጋውን ለመኑ
እንዲፈቅድላቸው ሄደው ከመስፍኑ
ገንዘው ቀበሩት በአዲሱ መቃብር
ቅዱስ ቅዱስ ኃያል እያሉ በክብር/፪/

CHORUS
ኦ የማይሞተው ሞተ/፪/
ሄደ ቀራንዮ እየተጐተተ
ወድቆ እየተነሳ እንዲያ እየቃተተ
ሞትን ይሽረው ዘንድ የማይሞተው ሞተ/፪/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
O yemaymotew mote (2)
Hede qeranyo eyetegwetete
Wedqo eyetenesa endiya eyeqatete
Motn yishrew zend yemaymotew mote (2)

VERSE 1
Ejna egrun tasro hede adebabay
Eyetegerefe tagso siqay
Aleqesech qoma Dingil Maryam
Teseqlobat lijwa medhenealem

CHORUS
O yemaymotew mote (2)
Hede qeranyo eyetegwetete
Wedqo eyetenesa endiya eyeqatete
Motn yishrew zend yemaymotew mote (2)

VERSE 2
Beayhud adebabay fird tengadede
Wenbede teleqo nits’uh beg tarede
Yemaymotew mote lesew fiqr bilo
Wale qeranyo beench’et lay teseqlo

CHORUS
O yemaymotew mote (2)
Hede qeranyo eyetegwetete
Wedqo eyetenesa endiya eyeqatete
Motn yishrew zend yemaymotew mote (2)

VERSE 3
Yosef niqodimos sigawn lemenu
Endifeqdlachew hedew kemesfnu
Genzew qeberut beadisu meqabr
Kidus Kidus hayal eyalu bekbr (2)

CHORUS
O yemaymotew mote (2)
Hede qeranyo eyetegwetete
Wedqo eyetenesa endiya eyeqatete
Motn yishrew zend yemaymotew mote (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኦ የማይሞተው ሞተ/፪/
ሄደ ቀራንዮ እየተጐተተ
ወድቆ እየተነሳ እንዲያ እየቃተተ
ሞትን ይሽረው ዘንድ የማይሞተው ሞተ/፪/

VERSE 1
እጅና እግሩን ታስሮ ሄደ አደባባይ
እየተገረፈ ታግሶ ስቃይ
አለቀሰች ቆማ ድንግል ማርያም
ተሰቅሎባት ልጇ መድኀኔዓለም

CHORUS
ኦ የማይሞተው ሞተ/፪/
ሄደ ቀራንዮ እየተጐተተ
ወድቆ እየተነሳ እንዲያ እየቃተተ
ሞትን ይሽረው ዘንድ የማይሞተው ሞተ/፪/

VERSE 2
በአይሁድ አደባባይ ፍርድ ተንጋደደ
ወንበዴ ተለቆ ንጹሕ በግ ታረደ
የማይሞተው ሞተ ለሰው ፍቅር ብሎ
ዋለ ቀራንዮ በእንጨት ላይ ተሰቅሎ

CHORUS
ኦ የማይሞተው ሞተ/፪/
ሄደ ቀራንዮ እየተጐተተ
ወድቆ እየተነሳ እንዲያ እየቃተተ
ሞትን ይሽረው ዘንድ የማይሞተው ሞተ/፪/

VERSE 3
ዮሴፍ ኒቆዲሞስ ሥጋውን ለመኑ
እንዲፈቅድላቸው ሄደው ከመስፍኑ
ገንዘው ቀበሩት በአዲሱ መቃብር
ቅዱስ ቅዱስ ኃያል እያሉ በክብር/፪/

CHORUS
ኦ የማይሞተው ሞተ/፪/
ሄደ ቀራንዮ እየተጐተተ
ወድቆ እየተነሳ እንዲያ እየቃተተ
ሞትን ይሽረው ዘንድ የማይሞተው ሞተ/፪/',
        lyrics_transliteration = 'CHORUS
O yemaymotew mote (2)
Hede qeranyo eyetegwetete
Wedqo eyetenesa endiya eyeqatete
Motn yishrew zend yemaymotew mote (2)

VERSE 1
Ejna egrun tasro hede adebabay
Eyetegerefe tagso siqay
Aleqesech qoma Dingil Maryam
Teseqlobat lijwa medhenealem

CHORUS
O yemaymotew mote (2)
Hede qeranyo eyetegwetete
Wedqo eyetenesa endiya eyeqatete
Motn yishrew zend yemaymotew mote (2)

VERSE 2
Beayhud adebabay fird tengadede
Wenbede teleqo nits’uh beg tarede
Yemaymotew mote lesew fiqr bilo
Wale qeranyo beench’et lay teseqlo

CHORUS
O yemaymotew mote (2)
Hede qeranyo eyetegwetete
Wedqo eyetenesa endiya eyeqatete
Motn yishrew zend yemaymotew mote (2)

VERSE 3
Yosef niqodimos sigawn lemenu
Endifeqdlachew hedew kemesfnu
Genzew qeberut beadisu meqabr
Kidus Kidus hayal eyalu bekbr (2)

CHORUS
O yemaymotew mote (2)
Hede qeranyo eyetegwetete
Wedqo eyetenesa endiya eyeqatete
Motn yishrew zend yemaymotew mote (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '0ee0f7f1-4eaf-480a-b819-e6608ff3cea0'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኦ የማይሞተው ሞተ/፪/
ሄደ ቀራንዮ እየተጐተተ
ወድቆ እየተነሳ እንዲያ እየቃተተ
ሞትን ይሽረው ዘንድ የማይሞተው ሞተ/፪/

VERSE 1
እጅና እግሩን ታስሮ ሄደ አደባባይ
እየተገረፈ ታግሶ ስቃይ
አለቀሰች ቆማ ድንግል ማርያም
ተሰቅሎባት ልጇ መድኀኔዓለም

CHORUS
ኦ የማይሞተው ሞተ/፪/
ሄደ ቀራንዮ እየተጐተተ
ወድቆ እየተነሳ እንዲያ እየቃተተ
ሞትን ይሽረው ዘንድ የማይሞተው ሞተ/፪/

VERSE 2
በአይሁድ አደባባይ ፍርድ ተንጋደደ
ወንበዴ ተለቆ ንጹሕ በግ ታረደ
የማይሞተው ሞተ ለሰው ፍቅር ብሎ
ዋለ ቀራንዮ በእንጨት ላይ ተሰቅሎ

CHORUS
ኦ የማይሞተው ሞተ/፪/
ሄደ ቀራንዮ እየተጐተተ
ወድቆ እየተነሳ እንዲያ እየቃተተ
ሞትን ይሽረው ዘንድ የማይሞተው ሞተ/፪/

VERSE 3
ዮሴፍ ኒቆዲሞስ ሥጋውን ለመኑ
እንዲፈቅድላቸው ሄደው ከመስፍኑ
ገንዘው ቀበሩት በአዲሱ መቃብር
ቅዱስ ቅዱስ ኃያል እያሉ በክብር/፪/

CHORUS
ኦ የማይሞተው ሞተ/፪/
ሄደ ቀራንዮ እየተጐተተ
ወድቆ እየተነሳ እንዲያ እየቃተተ
ሞትን ይሽረው ዘንድ የማይሞተው ሞተ/፪/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '0ee0f7f1-4eaf-480a-b819-e6608ff3cea0'::uuid, 'yemayimotew-mote-3359', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- aklilachen-nesh-wubetachen ("Aklilachen Nesh Wubetachen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f09ae0b4-3011-472a-be37-91f5baecd3fe'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል

VERSE 1
ፍሬ የሞላብሽ መልካሟ ተክል
መፈወሻችን የሕይወት ጠበል
በምልጃሽ ፋና ዓይናችን በርቶ
ክብርሽን አየን በብርሃን ፈክቶ

CHORUS
አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል

VERSE 2
ጨው የሞላብሽ አዲስ ማሰሮ
ዓለም ጣፈጠ ምሬት ተሽሮ
ተለውጠናል አዲስ ሆነናል
ድንግል ለክብርሽ እጅ ነስተናል

CHORUS
አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል

VERSE 3
መሰረቶችሽ የተቀደሱ
ክብርና ግርማ ጽድቅ የለበሱ
እንከን የሌለሽ ንፁህ ተራራ
በልጅሽ ፀዳል ዓለሙ በራ

CHORUS
አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል

VERSE 4
ውዳሴሽ በዛ በአፋችን
ፍቅርሽ ታተመ በልባችን
ማርያም (2) ነው አዲስ ምስጋና
ለንጉሱ እናት ይገባልና

CHORUS
አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal

VERSE 1
Fere yemolabsih melkamua tekel
Mefeweshachen yehiywet tebel
Bemeljash fana ayinachen berto
Kibrishn ayen bebrihan fekto

CHORUS
Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal

VERSE 2
Chew yemolabsih addis masero
Alem tafete miret teshiro
Telowetenal addis honenal
Dingil lekibrish ej nestenal

CHORUS
Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal

VERSE 3
Meseretochish yeteqedesu
Kibrina girma tsidiq yelebesu
Enken yelelesh nitsuh terara
Belijish tsedal alemu bera

CHORUS
Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal

VERSE 4
Wudasesh beza beafachen
Fiqrish tateme belibachen
Mariyam (2) new addis misgana
Lenigusu enat yigebalina

CHORUS
Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል

VERSE 1
ፍሬ የሞላብሽ መልካሟ ተክል
መፈወሻችን የሕይወት ጠበል
በምልጃሽ ፋና ዓይናችን በርቶ
ክብርሽን አየን በብርሃን ፈክቶ

CHORUS
አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል

VERSE 2
ጨው የሞላብሽ አዲስ ማሰሮ
ዓለም ጣፈጠ ምሬት ተሽሮ
ተለውጠናል አዲስ ሆነናል
ድንግል ለክብርሽ እጅ ነስተናል

CHORUS
አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል

VERSE 3
መሰረቶችሽ የተቀደሱ
ክብርና ግርማ ጽድቅ የለበሱ
እንከን የሌለሽ ንፁህ ተራራ
በልጅሽ ፀዳል ዓለሙ በራ

CHORUS
አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል

VERSE 4
ውዳሴሽ በዛ በአፋችን
ፍቅርሽ ታተመ በልባችን
ማርያም (2) ነው አዲስ ምስጋና
ለንጉሱ እናት ይገባልና

CHORUS
አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል',
        lyrics_transliteration = 'CHORUS
Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal

VERSE 1
Fere yemolabsih melkamua tekel
Mefeweshachen yehiywet tebel
Bemeljash fana ayinachen berto
Kibrishn ayen bebrihan fekto

CHORUS
Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal

VERSE 2
Chew yemolabsih addis masero
Alem tafete miret teshiro
Telowetenal addis honenal
Dingil lekibrish ej nestenal

CHORUS
Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal

VERSE 3
Meseretochish yeteqedesu
Kibrina girma tsidiq yelebesu
Enken yelelesh nitsuh terara
Belijish tsedal alemu bera

CHORUS
Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal

VERSE 4
Wudasesh beza beafachen
Fiqrish tateme belibachen
Mariyam (2) new addis misgana
Lenigusu enat yigebalina

CHORUS
Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f09ae0b4-3011-472a-be37-91f5baecd3fe'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል

VERSE 1
ፍሬ የሞላብሽ መልካሟ ተክል
መፈወሻችን የሕይወት ጠበል
በምልጃሽ ፋና ዓይናችን በርቶ
ክብርሽን አየን በብርሃን ፈክቶ

CHORUS
አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል

VERSE 2
ጨው የሞላብሽ አዲስ ማሰሮ
ዓለም ጣፈጠ ምሬት ተሽሮ
ተለውጠናል አዲስ ሆነናል
ድንግል ለክብርሽ እጅ ነስተናል

CHORUS
አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል

VERSE 3
መሰረቶችሽ የተቀደሱ
ክብርና ግርማ ጽድቅ የለበሱ
እንከን የሌለሽ ንፁህ ተራራ
በልጅሽ ፀዳል ዓለሙ በራ

CHORUS
አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል

VERSE 4
ውዳሴሽ በዛ በአፋችን
ፍቅርሽ ታተመ በልባችን
ማርያም (2) ነው አዲስ ምስጋና
ለንጉሱ እናት ይገባልና

CHORUS
አክሊላችን ነሽ ውበታችን
ትምክህታችን መፅናኛችን
ስምሽን ጠርተን ከሞት ድነናል
ምልጃሽ ረድቶን ቀና ብለናል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal

VERSE 1
Fere yemolabsih melkamua tekel
Mefeweshachen yehiywet tebel
Bemeljash fana ayinachen berto
Kibrishn ayen bebrihan fekto

CHORUS
Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal

VERSE 2
Chew yemolabsih addis masero
Alem tafete miret teshiro
Telowetenal addis honenal
Dingil lekibrish ej nestenal

CHORUS
Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal

VERSE 3
Meseretochish yeteqedesu
Kibrina girma tsidiq yelebesu
Enken yelelesh nitsuh terara
Belijish tsedal alemu bera

CHORUS
Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal

VERSE 4
Wudasesh beza beafachen
Fiqrish tateme belibachen
Mariyam (2) new addis misgana
Lenigusu enat yigebalina

CHORUS
Aklilachen nesh wubetachen
Timkihtachen metsenagnachen
Simshin terten kemot dinenal
Miljash redton qena bilenal';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f09ae0b4-3011-472a-be37-91f5baecd3fe'::uuid, 'aklilachen-nesh-wubetachen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- fikirih-marekeny ("Fikirih Marekeny")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ec57cc73-381f-400e-b5a5-63f7189237e8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸከሜ እርቋል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ እንደ አቅሜ አገኝሃለሁ (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 3
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 4
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 5
ጣቴ በገና ይደረድራል በቀን በሌሊት ያመስግናል (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 6
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 7
ክብርህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 8
ባንተ ተመካሁ በፈጣሪያችን አዳኝ በሆንከው በንጉሳችን (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 9
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 1
Tegezichalehu bewerk demih
Alemn tiche lagelgelih
Motih hiywote lene honognal

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 2
Bante mekera shekeme irkwal
Lekibirih qome ezemiralew ende aqme agenyihalehu (x2)
Fikirih marekeny behiywote bezemene

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 3
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 4
Midrina semay illil yibelu
Misgana lante yidres iyalu
Mesay yelehim leqidistnah

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 5
Aqerbalewign lante misgana
Tate begena yideredral beqen belelit yamesegnal (x2)
Fikirih marekeny behiywote bezemene

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 6
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 7
Kibirihn aytew telatoch feru
Legetnetih wedkew tegezu
Endih neh amlak endih neh geta

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 8
Hulun befikir yemitereta
Bante temekahu befetariyachin adañ behonkew benigusachin (x2)
Fikirih marekeny behiywote bezemene

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 9
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸከሜ እርቋል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ እንደ አቅሜ አገኝሃለሁ (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 3
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 4
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 5
ጣቴ በገና ይደረድራል በቀን በሌሊት ያመስግናል (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 6
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 7
ክብርህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 8
ባንተ ተመካሁ በፈጣሪያችን አዳኝ በሆንከው በንጉሳችን (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 9
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)',
        lyrics_transliteration = 'CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 1
Tegezichalehu bewerk demih
Alemn tiche lagelgelih
Motih hiywote lene honognal

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 2
Bante mekera shekeme irkwal
Lekibirih qome ezemiralew ende aqme agenyihalehu (x2)
Fikirih marekeny behiywote bezemene

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 3
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 4
Midrina semay illil yibelu
Misgana lante yidres iyalu
Mesay yelehim leqidistnah

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 5
Aqerbalewign lante misgana
Tate begena yideredral beqen belelit yamesegnal (x2)
Fikirih marekeny behiywote bezemene

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 6
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 7
Kibirihn aytew telatoch feru
Legetnetih wedkew tegezu
Endih neh amlak endih neh geta

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 8
Hulun befikir yemitereta
Bante temekahu befetariyachin adañ behonkew benigusachin (x2)
Fikirih marekeny behiywote bezemene

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 9
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ec57cc73-381f-400e-b5a5-63f7189237e8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 1
ተገዝቻለሁ በወርቅ ደምህ
ዓለምን ትቼ ላገለግልህ
ሞትህ ህይወቴ ለኔ ሆኖኛል
ባንተ መከራ ሸከሜ እርቋል

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 2
ለክብርህ ቆሜ እዘምራለሁ እንደ አቅሜ አገኝሃለሁ (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 3
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 4
ምድርና ሰማይ እልል ይበሉ
ምስጋና ላንተ ይድረስ እያሉ
መሳይ የለህም ለቅድስናህ
አቀርባለሁኝ ላንተ ምስጋና

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 5
ጣቴ በገና ይደረድራል በቀን በሌሊት ያመስግናል (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 6
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 7
ክብርህን አይተው ጠላቶች ፈሩ
ለጌትነትህ ወድቀው ተገዙ
እንዲህ ነህ አምላክ እንዲህ ነህ ጌታ
ሁሉን በፍቅር የምትረታ

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 8
ባንተ ተመካሁ በፈጣሪያችን አዳኝ በሆንከው በንጉሳችን (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

VERSE 9
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)

CHORUS
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
ፍቅርህ ማረከኝ በሕይወቴ በዘመኔ
እግዚአብሔር ለኔ መድሃኒቴ
ፍቅርህ ማረከኝ በህይወቴ በዘመኔ (x2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 1
Tegezichalehu bewerk demih
Alemn tiche lagelgelih
Motih hiywote lene honognal

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 2
Bante mekera shekeme irkwal
Lekibirih qome ezemiralew ende aqme agenyihalehu (x2)
Fikirih marekeny behiywote bezemene

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 3
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 4
Midrina semay illil yibelu
Misgana lante yidres iyalu
Mesay yelehim leqidistnah

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 5
Aqerbalewign lante misgana
Tate begena yideredral beqen belelit yamesegnal (x2)
Fikirih marekeny behiywote bezemene

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 6
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 7
Kibirihn aytew telatoch feru
Legetnetih wedkew tegezu
Endih neh amlak endih neh geta

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 8
Hulun befikir yemitereta
Bante temekahu befetariyachin adañ behonkew benigusachin (x2)
Fikirih marekeny behiywote bezemene

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

VERSE 9
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)

CHORUS
Fikirih marekeny behiywote bezemene
Fikirih marekeny behiywote bezemene
Egziabher lene medhanite
Fikirih marekeny behiywote bezemene (x2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ec57cc73-381f-400e-b5a5-63f7189237e8'::uuid, 'fikirih-marekeny', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- amen-ye-atbiya-kokebe-deacon-zemari-hawaz-tegegn-vidio-clip ("Amen ye atbiya kokebe deacon zemari Hawaz tegegn / vidio clip")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '12f2e4f2-3e98-44c1-b790-ec62b867fcd4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 1
ደመና ባይኖር ማን ይወድስሃል
ምድረበዳውን ኣረስርሰሃል
ኣሜን
የዘይቱ ቀን ይዘላል ፊቴ

CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 2
ቅብኣለ ዜሬ ድል ኣለ ቤቴ
በሩን ክፈቱት ይግባ ወዳጄ
የነፍሴ ነፍስዋን የወይን ጠዤ
ኣሜን

CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 3
ሰባቱ መቅረዝ ኣሉ በፊት
ዛሬም ህያው ነው ታላቅነት
የዝግብዋላ ተንቀጠቀጠ
ድምጽህን ሰምቶ ሞት ደነገጠ

CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 4
ኣሜን
ከሁሉ ይበልጣል ውዴ ልዩ ነው
በቆንዳላውላይ ውብ ሽቶ ይለው
የ ጥበብ ሰዎች ኣዩት ስያበራ

CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 5
ይጥብያ ኮኮቤ ውዶ ሙሽራ
ኣሜን

CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amen yet’bya kokobe dimeq belbe bira
Kiberlgn eyesus afe zinahn yiwra (2)
Alegn mawera alegn talaq qal
Kidus menfesn endawlo yinet’qal

VERSE 1
Demena baynor man yiwedshal
Midrebedawn aresrsehal
Amen
Yezeytu qen yizelal fite

CHORUS
Amen yet’bya kokobe dimeq belbe bira
Kiberlgn eyesus afe zinahn yiwra (2)
Alegn mawera alegn talaq qal
Kidus menfesn endawlo yinet’qal

VERSE 2
Qibale zere dil ale bete
Berun kifetut yigba wedaje
Yenefse nefswan yeweyn t’ezhe
Amen

CHORUS
Amen yet’bya kokobe dimeq belbe bira
Kiberlgn eyesus afe zinahn yiwra (2)
Alegn mawera alegn talaq qal
Kidus menfesn endawlo yinet’qal

VERSE 3
Sebatu meqrez alu befit
Zarem hiyaw new talaqnet
Yezgbwala tenqet’eqet’e
Dimts’hn semto mot deneget’e

CHORUS
Amen yet’bya kokobe dimeq belbe bira
Kiberlgn eyesus afe zinahn yiwra (2)
Alegn mawera alegn talaq qal
Kidus menfesn endawlo yinet’qal

VERSE 4
Amen
Kehulu yibelt’al wide liyu new
Beqondalawlay wib shto yilew
Ye t’beb sewoch ayut siyabera

CHORUS
Amen yet’bya kokobe dimeq belbe bira
Kiberlgn eyesus afe zinahn yiwra (2)
Alegn mawera alegn talaq qal
Kidus menfesn endawlo yinet’qal

VERSE 5
Yit’bya kokobe wido mushra
Amen

CHORUS
Amen yet’bya kokobe dimeq belbe bira
Kiberlgn eyesus afe zinahn yiwra (2)
Alegn mawera alegn talaq qal
Kidus menfesn endawlo yinet’qal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 1
ደመና ባይኖር ማን ይወድስሃል
ምድረበዳውን ኣረስርሰሃል
ኣሜን
የዘይቱ ቀን ይዘላል ፊቴ

CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 2
ቅብኣለ ዜሬ ድል ኣለ ቤቴ
በሩን ክፈቱት ይግባ ወዳጄ
የነፍሴ ነፍስዋን የወይን ጠዤ
ኣሜን

CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 3
ሰባቱ መቅረዝ ኣሉ በፊት
ዛሬም ህያው ነው ታላቅነት
የዝግብዋላ ተንቀጠቀጠ
ድምጽህን ሰምቶ ሞት ደነገጠ

CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 4
ኣሜን
ከሁሉ ይበልጣል ውዴ ልዩ ነው
በቆንዳላውላይ ውብ ሽቶ ይለው
የ ጥበብ ሰዎች ኣዩት ስያበራ

CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 5
ይጥብያ ኮኮቤ ውዶ ሙሽራ
ኣሜን

CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል',
        lyrics_transliteration = 'CHORUS
Amen yet’bya kokobe dimeq belbe bira
Kiberlgn eyesus afe zinahn yiwra (2)
Alegn mawera alegn talaq qal
Kidus menfesn endawlo yinet’qal

VERSE 1
Demena baynor man yiwedshal
Midrebedawn aresrsehal
Amen
Yezeytu qen yizelal fite

CHORUS
Amen yet’bya kokobe dimeq belbe bira
Kiberlgn eyesus afe zinahn yiwra (2)
Alegn mawera alegn talaq qal
Kidus menfesn endawlo yinet’qal

VERSE 2
Qibale zere dil ale bete
Berun kifetut yigba wedaje
Yenefse nefswan yeweyn t’ezhe
Amen

CHORUS
Amen yet’bya kokobe dimeq belbe bira
Kiberlgn eyesus afe zinahn yiwra (2)
Alegn mawera alegn talaq qal
Kidus menfesn endawlo yinet’qal

VERSE 3
Sebatu meqrez alu befit
Zarem hiyaw new talaqnet
Yezgbwala tenqet’eqet’e
Dimts’hn semto mot deneget’e

CHORUS
Amen yet’bya kokobe dimeq belbe bira
Kiberlgn eyesus afe zinahn yiwra (2)
Alegn mawera alegn talaq qal
Kidus menfesn endawlo yinet’qal

VERSE 4
Amen
Kehulu yibelt’al wide liyu new
Beqondalawlay wib shto yilew
Ye t’beb sewoch ayut siyabera

CHORUS
Amen yet’bya kokobe dimeq belbe bira
Kiberlgn eyesus afe zinahn yiwra (2)
Alegn mawera alegn talaq qal
Kidus menfesn endawlo yinet’qal

VERSE 5
Yit’bya kokobe wido mushra
Amen

CHORUS
Amen yet’bya kokobe dimeq belbe bira
Kiberlgn eyesus afe zinahn yiwra (2)
Alegn mawera alegn talaq qal
Kidus menfesn endawlo yinet’qal',
        updated_at = clock_timestamp()::text
    WHERE import_id = '12f2e4f2-3e98-44c1-b790-ec62b867fcd4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 1
ደመና ባይኖር ማን ይወድስሃል
ምድረበዳውን ኣረስርሰሃል
ኣሜን
የዘይቱ ቀን ይዘላል ፊቴ

CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 2
ቅብኣለ ዜሬ ድል ኣለ ቤቴ
በሩን ክፈቱት ይግባ ወዳጄ
የነፍሴ ነፍስዋን የወይን ጠዤ
ኣሜን

CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 3
ሰባቱ መቅረዝ ኣሉ በፊት
ዛሬም ህያው ነው ታላቅነት
የዝግብዋላ ተንቀጠቀጠ
ድምጽህን ሰምቶ ሞት ደነገጠ

CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 4
ኣሜን
ከሁሉ ይበልጣል ውዴ ልዩ ነው
በቆንዳላውላይ ውብ ሽቶ ይለው
የ ጥበብ ሰዎች ኣዩት ስያበራ

CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል

VERSE 5
ይጥብያ ኮኮቤ ውዶ ሙሽራ
ኣሜን

CHORUS
ኣሜን የጥብያ ኮኮቤ ድመቅ በልቤ ብራ
ክበርልኝ እየሱስ ኣፌ ዝናህን ይውራ(2)
ኣለኝ ማወራ ኣለኝ ታላቅ ቃል
ቅዱስ መንፈስን እንዳውሎ ይነጥቃል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '12f2e4f2-3e98-44c1-b790-ec62b867fcd4'::uuid, 'amen-ye-atbiya-kokebe-deacon-zemari-hawaz-tegegn-vidio-clip', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- above-everything ("Above Everything")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1b700fb7-25a3-432b-9237-ffe3f715d4be'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 1
We believe in their co-existence.
Above everything, I believe
and have faith in Your three person.
Above everything, I believe

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 2
and have faith in Your three person Lord.
I seek the prayer
of the Mother of God.
Then I seek the prayer

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 3
of the Mother of God.
You are who chose me from my mother''s womb
and birthed me through baptism.
Like the apple of an eye, who kept me.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 4
It is You that I worship.
It is You that I worship,
the Holy Trinity above everything.
I believe and have faith in Your three person Lord.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 5
Then I seek the prayer of the Mother of God.
In personhood, I say You are three
but one nature of God Almighty.
God the Father, God the Son, God the Holy Spirit.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 6
One God made the world and everything within it.
Above everything, I believe
and have faith in Your three personhood
that I seek the prayer

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 7
of the Mother of God.
From the three persons, God the Son came down, the Word of God.
The Father has shown.
He took on the flesh that He created

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 8
through the Virgin Mary
through the Virgin Mary. He is incarnated above everything.
I believe
and have faith in Your three person.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 9
Then I seek the prayer
of the Mother of God.
Because of His flesh, God died for mankind.
For He is divine, yet He healed the blind.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 10
In one divine will, the Son took my loss.
I am bought by His blood.
I am bought by His blood
and His work on the cross above everything.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 11
I believe and have faith in Your three person.
Then I seek the prayer
of the Mother of God.
I beseech Your mercy by her who bore You.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 12
Her pleading will be granted as true to stand on Your right side when You will come back.
Her prayer will always guide me on the right path. Amen.
Amen. Amen. Amen. Amen. Amen.
Amen. Amen. Amen.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 1
We believe in their co-existence.
Above everything, I believe
And have faith in Your three person.
Above everything, I believe

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 2
And have faith in Your three person Lord.
I seek the prayer
Of the Mother of God.
Then I seek the prayer

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 3
Of the Mother of God.
You are who chose me from my mother''s womb
And birthed me through baptism.
Like the apple of an eye, who kept me.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 4
It is You that I worship.
It is You that I worship,
The Holy Trinity above everything.
I believe and have faith in Your three person Lord.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 5
Then I seek the prayer of the Mother of God.
In personhood, I say You are three
But one nature of God Almighty.
God the Father, God the Son, God the Holy Spirit.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 6
One God made the world and everything within it.
Above everything, I believe
And have faith in Your three personhood
That I seek the prayer

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 7
Of the Mother of God.
From the three persons, God the Son came down, the Word of God.
The Father has shown.
He took on the flesh that He created

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 8
Through the Virgin Mary
Through the Virgin Mary. He is incarnated above everything.
I believe
And have faith in Your three person.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 9
Then I seek the prayer
Of the Mother of God.
Because of His flesh, God died for mankind.
For He is divine, yet He healed the blind.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 10
In one divine will, the Son took my loss.
I am bought by His blood.
I am bought by His blood
And His work on the cross above everything.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 11
I believe and have faith in Your three person.
Then I seek the prayer
Of the Mother of God.
I beseech Your mercy by her who bore You.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 12
Her pleading will be granted as true to stand on Your right side when You will come back.
Her prayer will always guide me on the right path. Amen.
Amen. Amen. Amen. Amen. Amen.
Amen. Amen. Amen.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 1
We believe in their co-existence.
Above everything, I believe
and have faith in Your three person.
Above everything, I believe

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 2
and have faith in Your three person Lord.
I seek the prayer
of the Mother of God.
Then I seek the prayer

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 3
of the Mother of God.
You are who chose me from my mother''s womb
and birthed me through baptism.
Like the apple of an eye, who kept me.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 4
It is You that I worship.
It is You that I worship,
the Holy Trinity above everything.
I believe and have faith in Your three person Lord.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 5
Then I seek the prayer of the Mother of God.
In personhood, I say You are three
but one nature of God Almighty.
God the Father, God the Son, God the Holy Spirit.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 6
One God made the world and everything within it.
Above everything, I believe
and have faith in Your three personhood
that I seek the prayer

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 7
of the Mother of God.
From the three persons, God the Son came down, the Word of God.
The Father has shown.
He took on the flesh that He created

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 8
through the Virgin Mary
through the Virgin Mary. He is incarnated above everything.
I believe
and have faith in Your three person.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 9
Then I seek the prayer
of the Mother of God.
Because of His flesh, God died for mankind.
For He is divine, yet He healed the blind.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 10
In one divine will, the Son took my loss.
I am bought by His blood.
I am bought by His blood
and His work on the cross above everything.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 11
I believe and have faith in Your three person.
Then I seek the prayer
of the Mother of God.
I beseech Your mercy by her who bore You.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 12
Her pleading will be granted as true to stand on Your right side when You will come back.
Her prayer will always guide me on the right path. Amen.
Amen. Amen. Amen. Amen. Amen.
Amen. Amen. Amen.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.',
        lyrics_transliteration = 'CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 1
We believe in their co-existence.
Above everything, I believe
And have faith in Your three person.
Above everything, I believe

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 2
And have faith in Your three person Lord.
I seek the prayer
Of the Mother of God.
Then I seek the prayer

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 3
Of the Mother of God.
You are who chose me from my mother''s womb
And birthed me through baptism.
Like the apple of an eye, who kept me.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 4
It is You that I worship.
It is You that I worship,
The Holy Trinity above everything.
I believe and have faith in Your three person Lord.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 5
Then I seek the prayer of the Mother of God.
In personhood, I say You are three
But one nature of God Almighty.
God the Father, God the Son, God the Holy Spirit.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 6
One God made the world and everything within it.
Above everything, I believe
And have faith in Your three personhood
That I seek the prayer

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 7
Of the Mother of God.
From the three persons, God the Son came down, the Word of God.
The Father has shown.
He took on the flesh that He created

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 8
Through the Virgin Mary
Through the Virgin Mary. He is incarnated above everything.
I believe
And have faith in Your three person.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 9
Then I seek the prayer
Of the Mother of God.
Because of His flesh, God died for mankind.
For He is divine, yet He healed the blind.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 10
In one divine will, the Son took my loss.
I am bought by His blood.
I am bought by His blood
And His work on the cross above everything.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 11
I believe and have faith in Your three person.
Then I seek the prayer
Of the Mother of God.
I beseech Your mercy by her who bore You.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.

VERSE 12
Her pleading will be granted as true to stand on Your right side when You will come back.
Her prayer will always guide me on the right path. Amen.
Amen. Amen. Amen. Amen. Amen.
Amen. Amen. Amen.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
And we truly believe
In the Son, and we also truly believe in the Holy Spirit.',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1b700fb7-25a3-432b-9237-ffe3f715d4be'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 1
We believe in their co-existence.
Above everything, I believe
and have faith in Your three person.
Above everything, I believe

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 2
and have faith in Your three person Lord.
I seek the prayer
of the Mother of God.
Then I seek the prayer

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 3
of the Mother of God.
You are who chose me from my mother''s womb
and birthed me through baptism.
Like the apple of an eye, who kept me.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 4
It is You that I worship.
It is You that I worship,
the Holy Trinity above everything.
I believe and have faith in Your three person Lord.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 5
Then I seek the prayer of the Mother of God.
In personhood, I say You are three
but one nature of God Almighty.
God the Father, God the Son, God the Holy Spirit.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 6
One God made the world and everything within it.
Above everything, I believe
and have faith in Your three personhood
that I seek the prayer

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 7
of the Mother of God.
From the three persons, God the Son came down, the Word of God.
The Father has shown.
He took on the flesh that He created

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 8
through the Virgin Mary
through the Virgin Mary. He is incarnated above everything.
I believe
and have faith in Your three person.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 9
Then I seek the prayer
of the Mother of God.
Because of His flesh, God died for mankind.
For He is divine, yet He healed the blind.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 10
In one divine will, the Son took my loss.
I am bought by His blood.
I am bought by His blood
and His work on the cross above everything.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 11
I believe and have faith in Your three person.
Then I seek the prayer
of the Mother of God.
I beseech Your mercy by her who bore You.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.

VERSE 12
Her pleading will be granted as true to stand on Your right side when You will come back.
Her prayer will always guide me on the right path. Amen.
Amen. Amen. Amen. Amen. Amen.
Amen. Amen. Amen.

CHORUS
In the name of the Father, and the Son, and the Holy Spirit, one God. Amen.
We truly believe in the Father,
and we truly believe
in the Son, and we also truly believe in the Holy Spirit.'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1b700fb7-25a3-432b-9237-ffe3f715d4be'::uuid, 'above-everything', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kidane-mihiret-enate-661 ("Kidane Mihiret Enate")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '718f003c-6f91-467c-929c-8d119910163c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳነምህረት እናቴ
መጽናኛዬ ነሽ ትምክህቴ
አረሳም እኔ ውለታሽን(3)
ደጅሽ መጥቼ የነገርኩሽን

VERSE 1
የልቤን ሁሉ ያዋየሁሽን
መቼ ቀረብኝ አየሽ መሻቴ
በቃል ኪዳንሽ ጸና ጉልበቴ
ያገኘሁትን እኔ አውቃለሁ

CHORUS
ኪዳነምህረት እናቴ
መጽናኛዬ ነሽ ትምክህቴ
አረሳም እኔ ውለታሽን(3)
ደጅሽ መጥቼ የነገርኩሽን

VERSE 2
የቱንስ ትቼ የቱን ነግራለሁ
ሚስጥረኛዬ አጽናኝ ዘመዴ
ክብር ሆኖኛል አንቺን መውደዴ
የውዳሴሸን ቃል ጣዕሙ ብዙ ነው

CHORUS
ኪዳነምህረት እናቴ
መጽናኛዬ ነሽ ትምክህቴ
አረሳም እኔ ውለታሽን(3)
ደጅሽ መጥቼ የነገርኩሽን

VERSE 3
አንቺን የያዘ ዛሬም ብረቱ ነው
ገዳዬ ቢዝት መች ይችለኛል
ኪዳንሽ ዛሬም ይሸፍነኛል
የጌታዬ እናት አማላጂቱ

CHORUS
ኪዳነምህረት እናቴ
መጽናኛዬ ነሽ ትምክህቴ
አረሳም እኔ ውለታሽን(3)
ደጅሽ መጥቼ የነገርኩሽን

VERSE 4
ለፍጥረት ሁሉ ነሽ አዛኝቱ
እኔ አንቺን ይዤመንገዴ ቀና
ሠላም እለኪ እመ ትህትና
የጭንቄ ደራሽ እንባዬን አባሽ

CHORUS
ኪዳነምህረት እናቴ
መጽናኛዬ ነሽ ትምክህቴ
አረሳም እኔ ውለታሽን(3)
ደጅሽ መጥቼ የነገርኩሽን

VERSE 5
አንዴት አድራለው አንቺን ሳልጠራሽ
ሰላም ሆኛለው ደጅሽ አድጌ
ልዘምርልሽ እኔ አደግድጌ

CHORUS
ኪዳነምህረት እናቴ
መጽናኛዬ ነሽ ትምክህቴ
አረሳም እኔ ውለታሽን(3)
ደጅሽ መጥቼ የነገርኩሽን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kidanemhret enate
Mets’nagnaye nesh timkhte
Aresam ene wiletashn (3)
Dejsh met’che yenegerkushn

VERSE 1
Yelben hulu yawayehushn
Meche qerebgn ayesh meshate
Beqal kidansh ts’ena gulbete
Yagegnehutn ene awqalehu

CHORUS
Kidanemhret enate
Mets’nagnaye nesh timkhte
Aresam ene wiletashn (3)
Dejsh met’che yenegerkushn

VERSE 2
Yetuns tiche yetun negralehu
Mist’regnaye ats’nagn zemede
Kibir honognal anchin mewdede
Yewdaseshen qal t’aemu bizu new

CHORUS
Kidanemhret enate
Mets’nagnaye nesh timkhte
Aresam ene wiletashn (3)
Dejsh met’che yenegerkushn

VERSE 3
Anchin yeyaze zarem biretu new
Gedaye bizt mech yichlegnal
Kidansh zarem yishefnegnal
Yegetaye enat amalajitu

CHORUS
Kidanemhret enate
Mets’nagnaye nesh timkhte
Aresam ene wiletashn (3)
Dejsh met’che yenegerkushn

VERSE 4
Left’ret hulu nesh azagntu
Ene anchin yizhemengede qena
Selam eleki eme tihtna
Yech’nqe derash enbayen abash

CHORUS
Kidanemhret enate
Mets’nagnaye nesh timkhte
Aresam ene wiletashn (3)
Dejsh met’che yenegerkushn

VERSE 5
Andet adralew anchin salt’erash
Selam hognalew dejsh adge
Lizemrlsh ene adegdge

CHORUS
Kidanemhret enate
Mets’nagnaye nesh timkhte
Aresam ene wiletashn (3)
Dejsh met’che yenegerkushn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኪዳነምህረት እናቴ
መጽናኛዬ ነሽ ትምክህቴ
አረሳም እኔ ውለታሽን(3)
ደጅሽ መጥቼ የነገርኩሽን

VERSE 1
የልቤን ሁሉ ያዋየሁሽን
መቼ ቀረብኝ አየሽ መሻቴ
በቃል ኪዳንሽ ጸና ጉልበቴ
ያገኘሁትን እኔ አውቃለሁ

CHORUS
ኪዳነምህረት እናቴ
መጽናኛዬ ነሽ ትምክህቴ
አረሳም እኔ ውለታሽን(3)
ደጅሽ መጥቼ የነገርኩሽን

VERSE 2
የቱንስ ትቼ የቱን ነግራለሁ
ሚስጥረኛዬ አጽናኝ ዘመዴ
ክብር ሆኖኛል አንቺን መውደዴ
የውዳሴሸን ቃል ጣዕሙ ብዙ ነው

CHORUS
ኪዳነምህረት እናቴ
መጽናኛዬ ነሽ ትምክህቴ
አረሳም እኔ ውለታሽን(3)
ደጅሽ መጥቼ የነገርኩሽን

VERSE 3
አንቺን የያዘ ዛሬም ብረቱ ነው
ገዳዬ ቢዝት መች ይችለኛል
ኪዳንሽ ዛሬም ይሸፍነኛል
የጌታዬ እናት አማላጂቱ

CHORUS
ኪዳነምህረት እናቴ
መጽናኛዬ ነሽ ትምክህቴ
አረሳም እኔ ውለታሽን(3)
ደጅሽ መጥቼ የነገርኩሽን

VERSE 4
ለፍጥረት ሁሉ ነሽ አዛኝቱ
እኔ አንቺን ይዤመንገዴ ቀና
ሠላም እለኪ እመ ትህትና
የጭንቄ ደራሽ እንባዬን አባሽ

CHORUS
ኪዳነምህረት እናቴ
መጽናኛዬ ነሽ ትምክህቴ
አረሳም እኔ ውለታሽን(3)
ደጅሽ መጥቼ የነገርኩሽን

VERSE 5
አንዴት አድራለው አንቺን ሳልጠራሽ
ሰላም ሆኛለው ደጅሽ አድጌ
ልዘምርልሽ እኔ አደግድጌ

CHORUS
ኪዳነምህረት እናቴ
መጽናኛዬ ነሽ ትምክህቴ
አረሳም እኔ ውለታሽን(3)
ደጅሽ መጥቼ የነገርኩሽን',
        lyrics_transliteration = 'CHORUS
Kidanemhret enate
Mets’nagnaye nesh timkhte
Aresam ene wiletashn (3)
Dejsh met’che yenegerkushn

VERSE 1
Yelben hulu yawayehushn
Meche qerebgn ayesh meshate
Beqal kidansh ts’ena gulbete
Yagegnehutn ene awqalehu

CHORUS
Kidanemhret enate
Mets’nagnaye nesh timkhte
Aresam ene wiletashn (3)
Dejsh met’che yenegerkushn

VERSE 2
Yetuns tiche yetun negralehu
Mist’regnaye ats’nagn zemede
Kibir honognal anchin mewdede
Yewdaseshen qal t’aemu bizu new

CHORUS
Kidanemhret enate
Mets’nagnaye nesh timkhte
Aresam ene wiletashn (3)
Dejsh met’che yenegerkushn

VERSE 3
Anchin yeyaze zarem biretu new
Gedaye bizt mech yichlegnal
Kidansh zarem yishefnegnal
Yegetaye enat amalajitu

CHORUS
Kidanemhret enate
Mets’nagnaye nesh timkhte
Aresam ene wiletashn (3)
Dejsh met’che yenegerkushn

VERSE 4
Left’ret hulu nesh azagntu
Ene anchin yizhemengede qena
Selam eleki eme tihtna
Yech’nqe derash enbayen abash

CHORUS
Kidanemhret enate
Mets’nagnaye nesh timkhte
Aresam ene wiletashn (3)
Dejsh met’che yenegerkushn

VERSE 5
Andet adralew anchin salt’erash
Selam hognalew dejsh adge
Lizemrlsh ene adegdge

CHORUS
Kidanemhret enate
Mets’nagnaye nesh timkhte
Aresam ene wiletashn (3)
Dejsh met’che yenegerkushn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '718f003c-6f91-467c-929c-8d119910163c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኪዳነምህረት እናቴ
መጽናኛዬ ነሽ ትምክህቴ
አረሳም እኔ ውለታሽን(3)
ደጅሽ መጥቼ የነገርኩሽን

VERSE 1
የልቤን ሁሉ ያዋየሁሽን
መቼ ቀረብኝ አየሽ መሻቴ
በቃል ኪዳንሽ ጸና ጉልበቴ
ያገኘሁትን እኔ አውቃለሁ

CHORUS
ኪዳነምህረት እናቴ
መጽናኛዬ ነሽ ትምክህቴ
አረሳም እኔ ውለታሽን(3)
ደጅሽ መጥቼ የነገርኩሽን

VERSE 2
የቱንስ ትቼ የቱን ነግራለሁ
ሚስጥረኛዬ አጽናኝ ዘመዴ
ክብር ሆኖኛል አንቺን መውደዴ
የውዳሴሸን ቃል ጣዕሙ ብዙ ነው

CHORUS
ኪዳነምህረት እናቴ
መጽናኛዬ ነሽ ትምክህቴ
አረሳም እኔ ውለታሽን(3)
ደጅሽ መጥቼ የነገርኩሽን

VERSE 3
አንቺን የያዘ ዛሬም ብረቱ ነው
ገዳዬ ቢዝት መች ይችለኛል
ኪዳንሽ ዛሬም ይሸፍነኛል
የጌታዬ እናት አማላጂቱ

CHORUS
ኪዳነምህረት እናቴ
መጽናኛዬ ነሽ ትምክህቴ
አረሳም እኔ ውለታሽን(3)
ደጅሽ መጥቼ የነገርኩሽን

VERSE 4
ለፍጥረት ሁሉ ነሽ አዛኝቱ
እኔ አንቺን ይዤመንገዴ ቀና
ሠላም እለኪ እመ ትህትና
የጭንቄ ደራሽ እንባዬን አባሽ

CHORUS
ኪዳነምህረት እናቴ
መጽናኛዬ ነሽ ትምክህቴ
አረሳም እኔ ውለታሽን(3)
ደጅሽ መጥቼ የነገርኩሽን

VERSE 5
አንዴት አድራለው አንቺን ሳልጠራሽ
ሰላም ሆኛለው ደጅሽ አድጌ
ልዘምርልሽ እኔ አደግድጌ

CHORUS
ኪዳነምህረት እናቴ
መጽናኛዬ ነሽ ትምክህቴ
አረሳም እኔ ውለታሽን(3)
ደጅሽ መጥቼ የነገርኩሽን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '718f003c-6f91-467c-929c-8d119910163c'::uuid, 'kidane-mihiret-enate-661', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- wisite-mahitsene-dinigil ("Wisite Mahitsene Dinigil")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'bde11ffd-5197-4a90-87d2-534cd54646de'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
❤ ዉስተ ማሕፀነ ድንግል ኀደረ በማሕፀነ ድንግል( 2)
ሰማይ ወምድር ዘኢያገምሮ (2×)ዮም ተወልደ (2) (ኧኸ)❤

VERSE 1
❤ ዉስተ ማሕፀነ ድንግል ኀደረ በማሕፀነ ድንግል( 2)
ሰማይ ወምድር ዘኢያገምሮ (2×)ዮም ተወልደ (2) (ኧኸ)❤

CHORUS
❤ ዉስተ ማሕፀነ ድንግል ኀደረ በማሕፀነ ድንግል( 2)
ሰማይ ወምድር ዘኢያገምሮ (2×)ዮም ተወልደ (2) (ኧኸ)❤'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
❤ wuste mahts’ene Dingil hedere bemahts’ene Dingil (2)
Semay wemdr zeiyagemro (2×)yom tewelde (2) (ኧኸ)❤

VERSE 1
❤ wuste mahts’ene Dingil hedere bemahts’ene Dingil (2)
Semay wemdr zeiyagemro (2×)yom tewelde (2) (ኧኸ)❤

CHORUS
❤ wuste mahts’ene Dingil hedere bemahts’ene Dingil (2)
Semay wemdr zeiyagemro (2×)yom tewelde (2) (ኧኸ)❤'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
❤ ዉስተ ማሕፀነ ድንግል ኀደረ በማሕፀነ ድንግል( 2)
ሰማይ ወምድር ዘኢያገምሮ (2×)ዮም ተወልደ (2) (ኧኸ)❤

VERSE 1
❤ ዉስተ ማሕፀነ ድንግል ኀደረ በማሕፀነ ድንግል( 2)
ሰማይ ወምድር ዘኢያገምሮ (2×)ዮም ተወልደ (2) (ኧኸ)❤

CHORUS
❤ ዉስተ ማሕፀነ ድንግል ኀደረ በማሕፀነ ድንግል( 2)
ሰማይ ወምድር ዘኢያገምሮ (2×)ዮም ተወልደ (2) (ኧኸ)❤',
        lyrics_transliteration = 'CHORUS
❤ wuste mahts’ene Dingil hedere bemahts’ene Dingil (2)
Semay wemdr zeiyagemro (2×)yom tewelde (2) (ኧኸ)❤

VERSE 1
❤ wuste mahts’ene Dingil hedere bemahts’ene Dingil (2)
Semay wemdr zeiyagemro (2×)yom tewelde (2) (ኧኸ)❤

CHORUS
❤ wuste mahts’ene Dingil hedere bemahts’ene Dingil (2)
Semay wemdr zeiyagemro (2×)yom tewelde (2) (ኧኸ)❤',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'bde11ffd-5197-4a90-87d2-534cd54646de'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
❤ ዉስተ ማሕፀነ ድንግል ኀደረ በማሕፀነ ድንግል( 2)
ሰማይ ወምድር ዘኢያገምሮ (2×)ዮም ተወልደ (2) (ኧኸ)❤

VERSE 1
❤ ዉስተ ማሕፀነ ድንግል ኀደረ በማሕፀነ ድንግል( 2)
ሰማይ ወምድር ዘኢያገምሮ (2×)ዮም ተወልደ (2) (ኧኸ)❤

CHORUS
❤ ዉስተ ማሕፀነ ድንግል ኀደረ በማሕፀነ ድንግል( 2)
ሰማይ ወምድር ዘኢያገምሮ (2×)ዮም ተወልደ (2) (ኧኸ)❤'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'bde11ffd-5197-4a90-87d2-534cd54646de'::uuid, 'wisite-mahitsene-dinigil', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zetikat ("Zetikat")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1448481e-ff54-46cb-a856-636e2aa3bfe8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
አምላክ የሰው እረኛ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Amlak yesew eregna'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '1448481e-ff54-46cb-a856-636e2aa3bfe8'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
አምላክ የሰው እረኛ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1448481e-ff54-46cb-a856-636e2aa3bfe8'::uuid, 'zetikat', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bemin-bemin-enimesilat-dinigil-mariyamin ("Bemin Bemin Enimesilat Dinigil Mariyamin")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '3ccbe811-3031-4ba3-affb-e13d1e212f33'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን

VERSE 1
የብርሃን መውጫ የኖኅ ድንቅ መርከብ
የመላዕክት እህት የሩሩሃን ርግብ /፪/
የሰሎሞን አክሊል የአሮን በትር
የዕዝራ መሰንቆ የጌዲዮን ጸምር

CHORUS
በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን

VERSE 2
ድንግል እመቤት ናት የጻድቃኖች በር
ሆና የተገኘች የአምላክ ማህደር/፪/
የቅዱሳን እናት የዓለም ንግስት
ችላ ተሸከመች መለኮት እሳት

CHORUS
በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን

VERSE 3
ብርሃን ትሁነን ጨለማን ገላልጣ
አማልዳ ታስምረን ከዚህ ዓለም ጣጣ/፪/
ከማር ይጣፍጣል የድንግል መዓዛ
አምላክን አቅፋለች በሁለት እጇ ይዛ

CHORUS
በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን

VERSE 4
ዓለም ሁሉ የዳነው በልጅሽ ነውና
እናታችን ጽዮን ይድረስሽ ምስጋና/፪/

CHORUS
በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bemn bemn enmeslat Dingil Maryamn (2)
Misale yelatm yelatm kibrwan yemimet’n (2)
Yemuse ts’lat nesh yemhret qalkidan
Yeyaeqob meselal yeabrham dinkwan

VERSE 1
Yebrhan mewch’a yenoh dinq merkeb
Yemelaekt eht yeruruhan rigb (2)
Yeselomon aklil yearon betr
Yeezra mesenqo yegediyon ts’emr

CHORUS
Bemn bemn enmeslat Dingil Maryamn (2)
Misale yelatm yelatm kibrwan yemimet’n (2)
Yemuse ts’lat nesh yemhret qalkidan
Yeyaeqob meselal yeabrham dinkwan

VERSE 2
Dingil emebet nat yets’adqanoch ber
Hona yetegegnech yeamlak mahder (2)
Yeqdusan enat yealem nigst
Chla teshekemech melekot esat

CHORUS
Bemn bemn enmeslat Dingil Maryamn (2)
Misale yelatm yelatm kibrwan yemimet’n (2)
Yemuse ts’lat nesh yemhret qalkidan
Yeyaeqob meselal yeabrham dinkwan

VERSE 3
Birhan tihunen ch’eleman gelalt’a
Amalda tasmren kezih alem t’at’a (2)
Kemar yit’aft’al yedngl meaza
Amlakn aqfalech behulet ejwa yiza

CHORUS
Bemn bemn enmeslat Dingil Maryamn (2)
Misale yelatm yelatm kibrwan yemimet’n (2)
Yemuse ts’lat nesh yemhret qalkidan
Yeyaeqob meselal yeabrham dinkwan

VERSE 4
Alem hulu yedanew beljsh newna
Enatachn ts’yon yidressh misgana (2)

CHORUS
Bemn bemn enmeslat Dingil Maryamn (2)
Misale yelatm yelatm kibrwan yemimet’n (2)
Yemuse ts’lat nesh yemhret qalkidan
Yeyaeqob meselal yeabrham dinkwan'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን

VERSE 1
የብርሃን መውጫ የኖኅ ድንቅ መርከብ
የመላዕክት እህት የሩሩሃን ርግብ /፪/
የሰሎሞን አክሊል የአሮን በትር
የዕዝራ መሰንቆ የጌዲዮን ጸምር

CHORUS
በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን

VERSE 2
ድንግል እመቤት ናት የጻድቃኖች በር
ሆና የተገኘች የአምላክ ማህደር/፪/
የቅዱሳን እናት የዓለም ንግስት
ችላ ተሸከመች መለኮት እሳት

CHORUS
በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን

VERSE 3
ብርሃን ትሁነን ጨለማን ገላልጣ
አማልዳ ታስምረን ከዚህ ዓለም ጣጣ/፪/
ከማር ይጣፍጣል የድንግል መዓዛ
አምላክን አቅፋለች በሁለት እጇ ይዛ

CHORUS
በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን

VERSE 4
ዓለም ሁሉ የዳነው በልጅሽ ነውና
እናታችን ጽዮን ይድረስሽ ምስጋና/፪/

CHORUS
በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን',
        lyrics_transliteration = 'CHORUS
Bemn bemn enmeslat Dingil Maryamn (2)
Misale yelatm yelatm kibrwan yemimet’n (2)
Yemuse ts’lat nesh yemhret qalkidan
Yeyaeqob meselal yeabrham dinkwan

VERSE 1
Yebrhan mewch’a yenoh dinq merkeb
Yemelaekt eht yeruruhan rigb (2)
Yeselomon aklil yearon betr
Yeezra mesenqo yegediyon ts’emr

CHORUS
Bemn bemn enmeslat Dingil Maryamn (2)
Misale yelatm yelatm kibrwan yemimet’n (2)
Yemuse ts’lat nesh yemhret qalkidan
Yeyaeqob meselal yeabrham dinkwan

VERSE 2
Dingil emebet nat yets’adqanoch ber
Hona yetegegnech yeamlak mahder (2)
Yeqdusan enat yealem nigst
Chla teshekemech melekot esat

CHORUS
Bemn bemn enmeslat Dingil Maryamn (2)
Misale yelatm yelatm kibrwan yemimet’n (2)
Yemuse ts’lat nesh yemhret qalkidan
Yeyaeqob meselal yeabrham dinkwan

VERSE 3
Birhan tihunen ch’eleman gelalt’a
Amalda tasmren kezih alem t’at’a (2)
Kemar yit’aft’al yedngl meaza
Amlakn aqfalech behulet ejwa yiza

CHORUS
Bemn bemn enmeslat Dingil Maryamn (2)
Misale yelatm yelatm kibrwan yemimet’n (2)
Yemuse ts’lat nesh yemhret qalkidan
Yeyaeqob meselal yeabrham dinkwan

VERSE 4
Alem hulu yedanew beljsh newna
Enatachn ts’yon yidressh misgana (2)

CHORUS
Bemn bemn enmeslat Dingil Maryamn (2)
Misale yelatm yelatm kibrwan yemimet’n (2)
Yemuse ts’lat nesh yemhret qalkidan
Yeyaeqob meselal yeabrham dinkwan',
        updated_at = clock_timestamp()::text
    WHERE import_id = '3ccbe811-3031-4ba3-affb-e13d1e212f33'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን

VERSE 1
የብርሃን መውጫ የኖኅ ድንቅ መርከብ
የመላዕክት እህት የሩሩሃን ርግብ /፪/
የሰሎሞን አክሊል የአሮን በትር
የዕዝራ መሰንቆ የጌዲዮን ጸምር

CHORUS
በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን

VERSE 2
ድንግል እመቤት ናት የጻድቃኖች በር
ሆና የተገኘች የአምላክ ማህደር/፪/
የቅዱሳን እናት የዓለም ንግስት
ችላ ተሸከመች መለኮት እሳት

CHORUS
በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን

VERSE 3
ብርሃን ትሁነን ጨለማን ገላልጣ
አማልዳ ታስምረን ከዚህ ዓለም ጣጣ/፪/
ከማር ይጣፍጣል የድንግል መዓዛ
አምላክን አቅፋለች በሁለት እጇ ይዛ

CHORUS
በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን

VERSE 4
ዓለም ሁሉ የዳነው በልጅሽ ነውና
እናታችን ጽዮን ይድረስሽ ምስጋና/፪/

CHORUS
በምን በምን እንመስላት ድንግል ማርያምን /፪/
ምሳሌ የላትም የላትም ክብሯን የሚመጥን /፪/
የሙሴ ጽላት ነሽ የምህረት ቃልኪዳን
የያዕቆብ መሰላል የአብርሃም ድንኳን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '3ccbe811-3031-4ba3-affb-e13d1e212f33'::uuid, 'bemin-bemin-enimesilat-dinigil-mariyamin', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yene-mehari-by-zemari-yeabkal-desalegn ("Yene mehari by Zemari Yeabkal Desalegn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'da58e2db-c81b-4b6a-8e60-01ce933fd86f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
እንደ ህልም አልፏል ትናንትናዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Ende hilm alfwal tinantnaye'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'da58e2db-c81b-4b6a-8e60-01ce933fd86f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
እንደ ህልም አልፏል ትናንትናዬ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'da58e2db-c81b-4b6a-8e60-01ce933fd86f'::uuid, 'yene-mehari-by-zemari-yeabkal-desalegn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- i-found-tranquility ("I found tranquility")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ed7486fa-df58-49f6-b383-132071f92632'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
I found tranquility it is within Your home
Help me out of chaos I ask you Lord of hope

VERSE 1
Thinking of all my sins my heart beats anxiously
Being far from you Lord my soul lives fearfully
Return me to Your grace I''ll find my way back home
The one true holy peace I found in Your abode

CHORUS
I found tranquility it is within Your home
Help me out of chaos I ask you Lord of hope

VERSE 2
For prayer liturgy I could not persevere
I stood before the crowd my praises not sincere
My endless temptations have dragged me far from You
Save me Emmanuel with faith that I once knew

CHORUS
I found tranquility it is within Your home
Help me out of chaos I ask you Lord of hope

VERSE 3
Let my eyes pour their tears as they cry for my sins
May the rest of my days be spent in repentance
At the very hour the moment I''m redeemed
Thinking of Your love Lord I''ve fallen at Your feet

CHORUS
I found tranquility it is within Your home
Help me out of chaos I ask you Lord of hope

VERSE 4
Ewnetegna selam yalew ke betih new
Erdagn alinawet eleminihalew

CHORUS
I found tranquility it is within Your home
Help me out of chaos I ask you Lord of hope'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Ewnetegna selam yalew ke betih new
Erdagn alinawet eleminihalew'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
I found tranquility it is within Your home
Help me out of chaos I ask you Lord of hope

VERSE 1
Thinking of all my sins my heart beats anxiously
Being far from you Lord my soul lives fearfully
Return me to Your grace I''ll find my way back home
The one true holy peace I found in Your abode

CHORUS
I found tranquility it is within Your home
Help me out of chaos I ask you Lord of hope

VERSE 2
For prayer liturgy I could not persevere
I stood before the crowd my praises not sincere
My endless temptations have dragged me far from You
Save me Emmanuel with faith that I once knew

CHORUS
I found tranquility it is within Your home
Help me out of chaos I ask you Lord of hope

VERSE 3
Let my eyes pour their tears as they cry for my sins
May the rest of my days be spent in repentance
At the very hour the moment I''m redeemed
Thinking of Your love Lord I''ve fallen at Your feet

CHORUS
I found tranquility it is within Your home
Help me out of chaos I ask you Lord of hope

VERSE 4
Ewnetegna selam yalew ke betih new
Erdagn alinawet eleminihalew

CHORUS
I found tranquility it is within Your home
Help me out of chaos I ask you Lord of hope',
        lyrics_transliteration = 'Ewnetegna selam yalew ke betih new
Erdagn alinawet eleminihalew',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ed7486fa-df58-49f6-b383-132071f92632'::uuid
      AND deleted_at IS NULL
      AND lyrics_english IS NOT DISTINCT FROM 'CHORUS
I found tranquility it is within Your home
Help me out of chaos I ask you Lord of hope

VERSE 1
Thinking of all my sins my heart beats anxiously
Being far from you Lord my soul lives fearfully
Return me to Your grace I''ll find my way back home
The one true holy peace I found in Your abode

CHORUS
I found tranquility it is within Your home
Help me out of chaos I ask you Lord of hope

VERSE 2
For prayer liturgy I could not persevere
I stood before the crowd my praises not sincere
My endless temptations have dragged me far from You
Save me Emmanuel with faith that I once knew

CHORUS
I found tranquility it is within Your home
Help me out of chaos I ask you Lord of hope

VERSE 3
Let my eyes pour their tears as they cry for my sins
May the rest of my days be spent in repentance
At the very hour the moment I''m redeemed
Thinking of Your love Lord I''ve fallen at Your feet

CHORUS
I found tranquility it is within Your home
Help me out of chaos I ask you Lord of hope

VERSE 4
Ewnetegna selam yalew ke betih new
Erdagn alinawet eleminihalew

CHORUS
I found tranquility it is within Your home
Help me out of chaos I ask you Lord of hope'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Ewnetegna selam yalew ke betih new
Erdagn alinawet eleminihalew';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ed7486fa-df58-49f6-b383-132071f92632'::uuid, 'i-found-tranquility', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sisemaw-yadekut ("Sisemaw Yadekut")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '15773b58-0af3-4a85-91e8-6299ecb4f0a3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 1
አስረጂ አልፈልግም ስላቺ ሚነገረኝ
ኪዳንሽ ያገዘኝ እኔው ምስክር ነኝ
በሹክሹክታ ድምጸት ምስጥሬን ነግሬሽ
ጉድለቴን ሞልተሻል ለልጅሽ አሳስበሽ

CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 2
መች አፈርኩኝ ድንግል በስምሽ ታምኜ
መቅረቢያዬ እኮ ነሸ ከልጅሸ ከአዳኜ
በማህጸንሽ ፍሬ በሰጠሽኝ መና
ነፍሴ ለምልማለች ይድረስሽ ምስጋና

CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 3
መንበረ ልዑል ነሽ ለቃሉ ማህደር
እናት ሳለሽ ድንግል እመ እግዚአብሔር
መተኪያ የሌለሸ ከፍጥረት ብቸኛ
ምክንያተ ድሂን መመኪያችን የእኛ

CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 4
በዘመን ፍጻሜ በመምጫው ዋዜማ
በመልአኩ ገብርኤል የምስራች ዜማ
በልብሽ ይሁንታ በጸናች እምነትሽ
አለሙ ተጽናንቷል በወለድሽው ልጅሽ

CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 5
የዜማዬ ጣዕም የስንኜ ጉልበት
ስምሽ ነዉ እመ አምላክ የመዝሙሬ ዉበት

CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sisemaw yadekut t’afach’ sim
Sit’eraw sazemew yemit’m
Qwanqwaye nesh Maryam lisane
Leandebete wubet nesh qine

VERSE 1
Asreji alfelgm silachi minegeregn
Kidansh yagezegn enew miskr negn
Beshukshukta dimts’et mist’ren negresh
Gudleten molteshal leljsh asasbesh

CHORUS
Sisemaw yadekut t’afach’ sim
Sit’eraw sazemew yemit’m
Qwanqwaye nesh Maryam lisane
Leandebete wubet nesh qine

VERSE 2
Mech aferkugn Dingil besmsh tamgne
Meqrebiyaye eko neshe keljshe keadagne
Bemahts’ensh fire beset’eshgn mena
Nefse lemlmalech yidressh misgana

CHORUS
Sisemaw yadekut t’afach’ sim
Sit’eraw sazemew yemit’m
Qwanqwaye nesh Maryam lisane
Leandebete wubet nesh qine

VERSE 3
Menbere liul nesh leqalu mahder
Enat salesh Dingil eme Egziabher
Metekiya yeleleshe keft’ret bichegna
Miknyate dihin memekiyachn yeegna

CHORUS
Sisemaw yadekut t’afach’ sim
Sit’eraw sazemew yemit’m
Qwanqwaye nesh Maryam lisane
Leandebete wubet nesh qine

VERSE 4
Bezemen fits’ame bememch’aw wazema
Bemelaku Gebriel yemsrach zema
Belbsh yihunta bets’enach emnetsh
Alemu tets’nantwal beweledshw lijsh

CHORUS
Sisemaw yadekut t’afach’ sim
Sit’eraw sazemew yemit’m
Qwanqwaye nesh Maryam lisane
Leandebete wubet nesh qine

VERSE 5
Yezemaye t’aem yesngne gulbet
Simsh newu eme amlak yemezmure wubet

CHORUS
Sisemaw yadekut t’afach’ sim
Sit’eraw sazemew yemit’m
Qwanqwaye nesh Maryam lisane
Leandebete wubet nesh qine'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 1
አስረጂ አልፈልግም ስላቺ ሚነገረኝ
ኪዳንሽ ያገዘኝ እኔው ምስክር ነኝ
በሹክሹክታ ድምጸት ምስጥሬን ነግሬሽ
ጉድለቴን ሞልተሻል ለልጅሽ አሳስበሽ

CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 2
መች አፈርኩኝ ድንግል በስምሽ ታምኜ
መቅረቢያዬ እኮ ነሸ ከልጅሸ ከአዳኜ
በማህጸንሽ ፍሬ በሰጠሽኝ መና
ነፍሴ ለምልማለች ይድረስሽ ምስጋና

CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 3
መንበረ ልዑል ነሽ ለቃሉ ማህደር
እናት ሳለሽ ድንግል እመ እግዚአብሔር
መተኪያ የሌለሸ ከፍጥረት ብቸኛ
ምክንያተ ድሂን መመኪያችን የእኛ

CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 4
በዘመን ፍጻሜ በመምጫው ዋዜማ
በመልአኩ ገብርኤል የምስራች ዜማ
በልብሽ ይሁንታ በጸናች እምነትሽ
አለሙ ተጽናንቷል በወለድሽው ልጅሽ

CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 5
የዜማዬ ጣዕም የስንኜ ጉልበት
ስምሽ ነዉ እመ አምላክ የመዝሙሬ ዉበት

CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ',
        lyrics_transliteration = 'CHORUS
Sisemaw yadekut t’afach’ sim
Sit’eraw sazemew yemit’m
Qwanqwaye nesh Maryam lisane
Leandebete wubet nesh qine

VERSE 1
Asreji alfelgm silachi minegeregn
Kidansh yagezegn enew miskr negn
Beshukshukta dimts’et mist’ren negresh
Gudleten molteshal leljsh asasbesh

CHORUS
Sisemaw yadekut t’afach’ sim
Sit’eraw sazemew yemit’m
Qwanqwaye nesh Maryam lisane
Leandebete wubet nesh qine

VERSE 2
Mech aferkugn Dingil besmsh tamgne
Meqrebiyaye eko neshe keljshe keadagne
Bemahts’ensh fire beset’eshgn mena
Nefse lemlmalech yidressh misgana

CHORUS
Sisemaw yadekut t’afach’ sim
Sit’eraw sazemew yemit’m
Qwanqwaye nesh Maryam lisane
Leandebete wubet nesh qine

VERSE 3
Menbere liul nesh leqalu mahder
Enat salesh Dingil eme Egziabher
Metekiya yeleleshe keft’ret bichegna
Miknyate dihin memekiyachn yeegna

CHORUS
Sisemaw yadekut t’afach’ sim
Sit’eraw sazemew yemit’m
Qwanqwaye nesh Maryam lisane
Leandebete wubet nesh qine

VERSE 4
Bezemen fits’ame bememch’aw wazema
Bemelaku Gebriel yemsrach zema
Belbsh yihunta bets’enach emnetsh
Alemu tets’nantwal beweledshw lijsh

CHORUS
Sisemaw yadekut t’afach’ sim
Sit’eraw sazemew yemit’m
Qwanqwaye nesh Maryam lisane
Leandebete wubet nesh qine

VERSE 5
Yezemaye t’aem yesngne gulbet
Simsh newu eme amlak yemezmure wubet

CHORUS
Sisemaw yadekut t’afach’ sim
Sit’eraw sazemew yemit’m
Qwanqwaye nesh Maryam lisane
Leandebete wubet nesh qine',
        updated_at = clock_timestamp()::text
    WHERE import_id = '15773b58-0af3-4a85-91e8-6299ecb4f0a3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 1
አስረጂ አልፈልግም ስላቺ ሚነገረኝ
ኪዳንሽ ያገዘኝ እኔው ምስክር ነኝ
በሹክሹክታ ድምጸት ምስጥሬን ነግሬሽ
ጉድለቴን ሞልተሻል ለልጅሽ አሳስበሽ

CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 2
መች አፈርኩኝ ድንግል በስምሽ ታምኜ
መቅረቢያዬ እኮ ነሸ ከልጅሸ ከአዳኜ
በማህጸንሽ ፍሬ በሰጠሽኝ መና
ነፍሴ ለምልማለች ይድረስሽ ምስጋና

CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 3
መንበረ ልዑል ነሽ ለቃሉ ማህደር
እናት ሳለሽ ድንግል እመ እግዚአብሔር
መተኪያ የሌለሸ ከፍጥረት ብቸኛ
ምክንያተ ድሂን መመኪያችን የእኛ

CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 4
በዘመን ፍጻሜ በመምጫው ዋዜማ
በመልአኩ ገብርኤል የምስራች ዜማ
በልብሽ ይሁንታ በጸናች እምነትሽ
አለሙ ተጽናንቷል በወለድሽው ልጅሽ

CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ

VERSE 5
የዜማዬ ጣዕም የስንኜ ጉልበት
ስምሽ ነዉ እመ አምላክ የመዝሙሬ ዉበት

CHORUS
ስሰማው ያደኩት ጣፋጭ ስም
ስጠራው ሳዜመው የሚጥም
ቋንቋዬ ነሽ ማርያም ልሳኔ
ለአንደበቴ ዉበት ነሽ ቅኔ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '15773b58-0af3-4a85-91e8-6299ecb4f0a3'::uuid, 'sisemaw-yadekut', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ye-tsidk-ber-nesh ("YeTsidk Ber Nesh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'eeb17c4f-9f83-4669-bf06-1a0426a2d28e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/

VERSE 1
እመቤታችን የእኛ ምርኩዝ ነሽ እመቤታችን ከለላም ሆንሽን
›› የእሳት ሙዳይ ›› እሳት ታቀፍሽ
›› በብርሃን ተከበሽ ›› ወርቅ ለብሰሽ
›› ከሴቶች ሁሉ ›› አብ መረጠሽ

CHORUS
የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/

VERSE 2
እመቤታችን ድንግል ሆይ ልጆችሽ እመቤታችን ዘውትር ይጠሩሻል
›› ስምሽን ለልጅ ልጅ ›› ያሳስቡልሻል
›› በተሰጠሽ ጸጋ ›› ባማላጅነትሽ
›› ምህረትን አሰጪን ›› ከመሃሪው ልጅሽ

CHORUS
የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/

VERSE 3
እመቤታችን ያልታረሰች እርሻ እመቤታችን ዘር ያልተዘራባት
›› የህይወትን ፍሬ ›› ሰጠችን የእኛ እናት
›› የታረደው መሲ ›› እናቱን ወደዳት
›› በቀኙ ቆማለች ›› ድንግል እመቤት ናት

CHORUS
የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/

VERSE 4
እመቤታችን የእውነት ደመና እመቤታችን ዝናብ የታየባት
›› ወዳናለች ድንግል ›› የታተመች ገነት
›› ክብር ለሆነችው ›› ኑ እንዘምርላት
›› ደስ ይበልሽ እንበል ›› የብርሃን እናት

CHORUS
የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)

VERSE 1
Emebetachin ye’egna mirkuz nesh emebetachin kelela honshin
›› Ye isat muday ›› isat takefsh
›› Be birhan tekebesh ›› werq lebesh
›› Ke setoch hulu ›› Ab meretesh

CHORUS
Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)

VERSE 2
Emebetachin dingil hoy lijochish emebetachin zawtir yiterushal
›› Simishin leliji lij ›› yasasbulshal
›› Betesetesh tsega ›› bemalagninetish
›› Mihretin aset’egin ›› kemahariew lijish

CHORUS
Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)

VERSE 3
Emebetachin yalt’aresetch irsha emebetachin zer yalt’ezrabat
›› Ye hiywetn firé ›› setechin ye’egna enat
›› Ye taredew Mesi ›› enatun wededat
›› Be qenyu qomaletch ›› dingil emebet nat

CHORUS
Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)

VERSE 4
Emebetachin ye’ewnet demena emebetachin zinab yetayebat
›› Wodanaletch dingil ›› yetatemetch genet
›› Kibir lehonetch ›› nu enzemirlât
›› Des yibelish enbel ›› ye birhan enat

CHORUS
Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/

VERSE 1
እመቤታችን የእኛ ምርኩዝ ነሽ እመቤታችን ከለላም ሆንሽን
›› የእሳት ሙዳይ ›› እሳት ታቀፍሽ
›› በብርሃን ተከበሽ ›› ወርቅ ለብሰሽ
›› ከሴቶች ሁሉ ›› አብ መረጠሽ

CHORUS
የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/

VERSE 2
እመቤታችን ድንግል ሆይ ልጆችሽ እመቤታችን ዘውትር ይጠሩሻል
›› ስምሽን ለልጅ ልጅ ›› ያሳስቡልሻል
›› በተሰጠሽ ጸጋ ›› ባማላጅነትሽ
›› ምህረትን አሰጪን ›› ከመሃሪው ልጅሽ

CHORUS
የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/

VERSE 3
እመቤታችን ያልታረሰች እርሻ እመቤታችን ዘር ያልተዘራባት
›› የህይወትን ፍሬ ›› ሰጠችን የእኛ እናት
›› የታረደው መሲ ›› እናቱን ወደዳት
›› በቀኙ ቆማለች ›› ድንግል እመቤት ናት

CHORUS
የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/

VERSE 4
እመቤታችን የእውነት ደመና እመቤታችን ዝናብ የታየባት
›› ወዳናለች ድንግል ›› የታተመች ገነት
›› ክብር ለሆነችው ›› ኑ እንዘምርላት
›› ደስ ይበልሽ እንበል ›› የብርሃን እናት

CHORUS
የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/',
        lyrics_transliteration = 'CHORUS
Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)

VERSE 1
Emebetachin ye’egna mirkuz nesh emebetachin kelela honshin
›› Ye isat muday ›› isat takefsh
›› Be birhan tekebesh ›› werq lebesh
›› Ke setoch hulu ›› Ab meretesh

CHORUS
Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)

VERSE 2
Emebetachin dingil hoy lijochish emebetachin zawtir yiterushal
›› Simishin leliji lij ›› yasasbulshal
›› Betesetesh tsega ›› bemalagninetish
›› Mihretin aset’egin ›› kemahariew lijish

CHORUS
Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)

VERSE 3
Emebetachin yalt’aresetch irsha emebetachin zer yalt’ezrabat
›› Ye hiywetn firé ›› setechin ye’egna enat
›› Ye taredew Mesi ›› enatun wededat
›› Be qenyu qomaletch ›› dingil emebet nat

CHORUS
Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)

VERSE 4
Emebetachin ye’ewnet demena emebetachin zinab yetayebat
›› Wodanaletch dingil ›› yetatemetch genet
›› Kibir lehonetch ›› nu enzemirlât
›› Des yibelish enbel ›› ye birhan enat

CHORUS
Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'eeb17c4f-9f83-4669-bf06-1a0426a2d28e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/

VERSE 1
እመቤታችን የእኛ ምርኩዝ ነሽ እመቤታችን ከለላም ሆንሽን
›› የእሳት ሙዳይ ›› እሳት ታቀፍሽ
›› በብርሃን ተከበሽ ›› ወርቅ ለብሰሽ
›› ከሴቶች ሁሉ ›› አብ መረጠሽ

CHORUS
የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/

VERSE 2
እመቤታችን ድንግል ሆይ ልጆችሽ እመቤታችን ዘውትር ይጠሩሻል
›› ስምሽን ለልጅ ልጅ ›› ያሳስቡልሻል
›› በተሰጠሽ ጸጋ ›› ባማላጅነትሽ
›› ምህረትን አሰጪን ›› ከመሃሪው ልጅሽ

CHORUS
የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/

VERSE 3
እመቤታችን ያልታረሰች እርሻ እመቤታችን ዘር ያልተዘራባት
›› የህይወትን ፍሬ ›› ሰጠችን የእኛ እናት
›› የታረደው መሲ ›› እናቱን ወደዳት
›› በቀኙ ቆማለች ›› ድንግል እመቤት ናት

CHORUS
የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/

VERSE 4
እመቤታችን የእውነት ደመና እመቤታችን ዝናብ የታየባት
›› ወዳናለች ድንግል ›› የታተመች ገነት
›› ክብር ለሆነችው ›› ኑ እንዘምርላት
›› ደስ ይበልሽ እንበል ›› የብርሃን እናት

CHORUS
የጽድቅ በር ነሽ የሙሴ ጽላት
አክሊለ ሰማዕታት ምዕራገ ጸሎት
የጌታዬ እናት ንጹህ አክሊላችን
ሐመልማለ ሲና እመቤታችን/2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)

VERSE 1
Emebetachin ye’egna mirkuz nesh emebetachin kelela honshin
›› Ye isat muday ›› isat takefsh
›› Be birhan tekebesh ›› werq lebesh
›› Ke setoch hulu ›› Ab meretesh

CHORUS
Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)

VERSE 2
Emebetachin dingil hoy lijochish emebetachin zawtir yiterushal
›› Simishin leliji lij ›› yasasbulshal
›› Betesetesh tsega ›› bemalagninetish
›› Mihretin aset’egin ›› kemahariew lijish

CHORUS
Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)

VERSE 3
Emebetachin yalt’aresetch irsha emebetachin zer yalt’ezrabat
›› Ye hiywetn firé ›› setechin ye’egna enat
›› Ye taredew Mesi ›› enatun wededat
›› Be qenyu qomaletch ›› dingil emebet nat

CHORUS
Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)

VERSE 4
Emebetachin ye’ewnet demena emebetachin zinab yetayebat
›› Wodanaletch dingil ›› yetatemetch genet
›› Kibir lehonetch ›› nu enzemirlât
›› Des yibelish enbel ›› ye birhan enat

CHORUS
Ye tsidk ber nesh yeMuse ts’ilat
Aklile sema’etat mi’irage tselot
Ye getaye enat nits’uh aklilachin
Hamelmale Sina emebetachin (x2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'eeb17c4f-9f83-4669-bf06-1a0426a2d28e'::uuid, 'ye-tsidk-ber-nesh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- layiredagn-lesew ("Layiredagn Lesew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '15a8381b-5758-475d-be94-9638ab8e933f'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ላንች ይበቃል የሆንኩቱን መናገሩ',
        lyrics_transliteration = 'CHORUS
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
Lanch yibeqal yehonkutun menageru',
        updated_at = clock_timestamp()::text
    WHERE import_id = '15a8381b-5758-475d-be94-9638ab8e933f'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '15a8381b-5758-475d-be94-9638ab8e933f'::uuid, 'layiredagn-lesew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ewinet-beewinet ("Ewinet Beewinet")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '890b5e8f-829e-4b8a-8328-7b71be5af962'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2x/
በሞቱ አጥፍቶ ሙስና መቃብር

VERSE 1
የሙታን በኩር ሆኖ ተነሥቷል ጌታችን /2x/
አዝ
ሳጥን ቢደረደር አፈር ቢረበረብ
ድንጋይ በድንጋይ ላይ ደሞም ቢደራረብ

CHORUS
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2x/
በሞቱ አጥፍቶ ሙስና መቃብር

VERSE 2
ምድር አልቻለችም አምላኳን ለመቅበር
አዝ
የንጉሦች ንጉሥ ሰማያዊ አንበሳ
ሞትን ድል አድርጎ በሰንበት ተነሣ /2x/

CHORUS
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2x/
በሞቱ አጥፍቶ ሙስና መቃብር

VERSE 3
አዝ
ተቀድሰናል በጌታችን ደም
ፍቅሩንም የሰጠን እንደርሱ የለም
ሕያው ነው የሚኖር ለዘለዓለም

CHORUS
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2x/
በሞቱ አጥፍቶ ሙስና መቃብር

VERSE 4
አዝ/2x/

CHORUS
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2x/
በሞቱ አጥፍቶ ሙስና መቃብር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ewnet beewnet Geta tenestwal
Tenestwal bekbr
Motn dil adrgwal /2x/
Bemotu at’fto musna meqabr

VERSE 1
Yemutan bekur hono tenestwal Getachen /2x/
CHORUS
Sat’n bidereder afer birebereb
Dingay bedngay lay demom biderareb

CHORUS
Ewnet beewnet Geta tenestwal
Tenestwal bekbr
Motn dil adrgwal /2x/
Bemotu at’fto musna meqabr

VERSE 2
Midr alchalechm amlakwan lemeqber
CHORUS
Yengusoch nigus semayawi anbesa
Motn dil adrgo besenbet tenesa /2x/

CHORUS
Ewnet beewnet Geta tenestwal
Tenestwal bekbr
Motn dil adrgwal /2x/
Bemotu at’fto musna meqabr

VERSE 3
CHORUS
Teqedsenal begetachn dem
Fiqrunm yeset’en endersu yelem
Hiyaw new yeminor lezelealem

CHORUS
Ewnet beewnet Geta tenestwal
Tenestwal bekbr
Motn dil adrgwal /2x/
Bemotu at’fto musna meqabr

VERSE 4
CHORUS

CHORUS
Ewnet beewnet Geta tenestwal
Tenestwal bekbr
Motn dil adrgwal /2x/
Bemotu at’fto musna meqabr'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2x/
በሞቱ አጥፍቶ ሙስና መቃብር

VERSE 1
የሙታን በኩር ሆኖ ተነሥቷል ጌታችን /2x/
አዝ
ሳጥን ቢደረደር አፈር ቢረበረብ
ድንጋይ በድንጋይ ላይ ደሞም ቢደራረብ

CHORUS
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2x/
በሞቱ አጥፍቶ ሙስና መቃብር

VERSE 2
ምድር አልቻለችም አምላኳን ለመቅበር
አዝ
የንጉሦች ንጉሥ ሰማያዊ አንበሳ
ሞትን ድል አድርጎ በሰንበት ተነሣ /2x/

CHORUS
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2x/
በሞቱ አጥፍቶ ሙስና መቃብር

VERSE 3
አዝ
ተቀድሰናል በጌታችን ደም
ፍቅሩንም የሰጠን እንደርሱ የለም
ሕያው ነው የሚኖር ለዘለዓለም

CHORUS
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2x/
በሞቱ አጥፍቶ ሙስና መቃብር

VERSE 4
አዝ/2x/

CHORUS
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2x/
በሞቱ አጥፍቶ ሙስና መቃብር',
        lyrics_transliteration = 'CHORUS
Ewnet beewnet Geta tenestwal
Tenestwal bekbr
Motn dil adrgwal /2x/
Bemotu at’fto musna meqabr

VERSE 1
Yemutan bekur hono tenestwal Getachen /2x/
CHORUS
Sat’n bidereder afer birebereb
Dingay bedngay lay demom biderareb

CHORUS
Ewnet beewnet Geta tenestwal
Tenestwal bekbr
Motn dil adrgwal /2x/
Bemotu at’fto musna meqabr

VERSE 2
Midr alchalechm amlakwan lemeqber
CHORUS
Yengusoch nigus semayawi anbesa
Motn dil adrgo besenbet tenesa /2x/

CHORUS
Ewnet beewnet Geta tenestwal
Tenestwal bekbr
Motn dil adrgwal /2x/
Bemotu at’fto musna meqabr

VERSE 3
CHORUS
Teqedsenal begetachn dem
Fiqrunm yeset’en endersu yelem
Hiyaw new yeminor lezelealem

CHORUS
Ewnet beewnet Geta tenestwal
Tenestwal bekbr
Motn dil adrgwal /2x/
Bemotu at’fto musna meqabr

VERSE 4
CHORUS

CHORUS
Ewnet beewnet Geta tenestwal
Tenestwal bekbr
Motn dil adrgwal /2x/
Bemotu at’fto musna meqabr',
        updated_at = clock_timestamp()::text
    WHERE import_id = '890b5e8f-829e-4b8a-8328-7b71be5af962'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2x/
በሞቱ አጥፍቶ ሙስና መቃብር
የሙታን በኩር ሆኖ ተነሥቷል ጌታችን /2x/
አዝ======
ሳጥን ቢደረደር አፈር ቢረበረብ
ድንጋይ በድንጋይ ላይ ደሞም ቢደራረብ
ምድር አልቻለችም አምላኳን ለመቅበር
አዝ======
የንጉሦች ንጉሥ ሰማያዊ አንበሳ
ሞትን ድል አድርጎ በሰንበት ተነሣ /2x/
አዝ=======
ተቀድሰናል በጌታችን ደም
ፍቅሩንም የሰጠን እንደርሱ የለም
ሕያው ነው የሚኖር ለዘለዓለም
አዝ=======/2x/

VERSE 1
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2x/
በሞቱ አጥፍቶ ሙስና መቃብር
የሙታን በኩር ሆኖ ተነሥቷል ጌታችን /2x/
አዝ======
ሳጥን ቢደረደር አፈር ቢረበረብ
ድንጋይ በድንጋይ ላይ ደሞም ቢደራረብ
ምድር አልቻለችም አምላኳን ለመቅበር
አዝ======
የንጉሦች ንጉሥ ሰማያዊ አንበሳ
ሞትን ድል አድርጎ በሰንበት ተነሣ /2x/
አዝ=======
ተቀድሰናል በጌታችን ደም
ፍቅሩንም የሰጠን እንደርሱ የለም
ሕያው ነው የሚኖር ለዘለዓለም
አዝ=======/2x/

CHORUS
እውነት በእውነት ጌታ ተነሥቷል
ተነሥቷል በክብር
ሞትን ድል አድርጓል /2x/
በሞቱ አጥፍቶ ሙስና መቃብር
የሙታን በኩር ሆኖ ተነሥቷል ጌታችን /2x/
አዝ======
ሳጥን ቢደረደር አፈር ቢረበረብ
ድንጋይ በድንጋይ ላይ ደሞም ቢደራረብ
ምድር አልቻለችም አምላኳን ለመቅበር
አዝ======
የንጉሦች ንጉሥ ሰማያዊ አንበሳ
ሞትን ድል አድርጎ በሰንበት ተነሣ /2x/
አዝ=======
ተቀድሰናል በጌታችን ደም
ፍቅሩንም የሰጠን እንደርሱ የለም
ሕያው ነው የሚኖር ለዘለዓለም
አዝ=======/2x/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '890b5e8f-829e-4b8a-8328-7b71be5af962'::uuid, 'ewinet-beewinet', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tv-keyari-tarikey ("TV: KEYARI TARIKEY")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1694e22d-ed51-4ad0-90a8-23b0e4f235f1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 1
ሊዕሊ ዛ ነብሰይ ዝሓለካለይ
ወዲ ህያው ኣምላክ ቀያሪ ታሪከይ
ካብ መርኮ ሰይጣን ንብዙሕ ዘመናት
ጽድቀይ ናተቆጽረ ቀዳድ ጨርቂ ሪክሰት

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 2
ብተስፋ ኪጽበ ኪርኢ ምድሓነይ
ካብ ሰማይ ወሪድካ ሞይትካዮ ንሞትይ
ንፍቅርካ''ሞ ኪዝምር የ ጌና ማንነተይ ቀይርካዮ ኢካ
ጌታ ለፍቅርህ እዘምራለው ገና ማንኔተ ቀይረሃል አና

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 3
ማእሰርቲ ለጌዎን ምስ ጸኒዓ ነብሰይ
ለይቲ ምስ መዓልቲ መቃብር ኪከውን ስፍራይ
ከመይ ኪርስዖ ''ቲ ዚገበርካለይ
መዝሙር ቀይርካዮ ኢካ ናይ ትማል ኣውያተይ

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 4
እቲ ካ ብድፍረት ንቤትካ ከሳዲድ
ኣመንቲ ደቅካ ካብ ቤቶም ኪሳጉግ
ናይ ትማሊ ሳኦል ናይ ሎሚ ግን ፓውሎስ
ሕሩይ ኣቅሓ ጌርካ ሸሙካኒ ክርስቶስ

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 5
መን ዩ ዘይፍወስ ንስምካ ጸዊዑ
መንዪ ዝተነጽገ ናባካ ቀሪቡ
መንገዲን ሓቅን ሂወትን ኢካ ንዓይ
ኣብ ፍቃድካ ምንባር ኮይኑሎ ምርጫይ

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 6
ጎይታ ታሪክና ቀይሩ ናብ ቤቱ ዪምለሰና

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley

VERSE 1
Lieli za nebsey zihalekaley
Wedi hiyaw amlak qeyari tarikey
Kab merko seyt’an nibzuh zemenat
Ts’dqey nateqots’re qedad ch’erqi rikset

CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley

VERSE 2
Bitesfa kits’be kiri midhaney
Kab semay weridka moytkayo nimoty
Nifqrka''mo kizmr ye gena mannetey qeyrkayo ika
Geta lefqrh ezemralew gena mannete qeyrehal ana

CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley

VERSE 3
Maeserti legewon mis ts’enia nebsey
Leyti mis mealti meqabr kikewn sifray
Kemey kirso ''ti zigeberkaley
Mezmur qeyrkayo ika nay timal awyatey

CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley

VERSE 4
Eti ka bidfret nibetka kesadid
Amenti deqka kab betom kisagug
Nay timali saol nay lomi gin pawlos
Hiruy aqha gerka shemukani Kristos

CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley

VERSE 5
Men yu zeyfwes nismka ts’ewiu
Menyi zitenets’ge nabaka qeribu
Mengedin haqn hiwetn ika niay
Ab fiqadka minbar koynulo mirch’ay

CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley

VERSE 6
Goyta tarikna qeyru nab betu yimlesena

CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 1
ሊዕሊ ዛ ነብሰይ ዝሓለካለይ
ወዲ ህያው ኣምላክ ቀያሪ ታሪከይ
ካብ መርኮ ሰይጣን ንብዙሕ ዘመናት
ጽድቀይ ናተቆጽረ ቀዳድ ጨርቂ ሪክሰት

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 2
ብተስፋ ኪጽበ ኪርኢ ምድሓነይ
ካብ ሰማይ ወሪድካ ሞይትካዮ ንሞትይ
ንፍቅርካ''ሞ ኪዝምር የ ጌና ማንነተይ ቀይርካዮ ኢካ
ጌታ ለፍቅርህ እዘምራለው ገና ማንኔተ ቀይረሃል አና

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 3
ማእሰርቲ ለጌዎን ምስ ጸኒዓ ነብሰይ
ለይቲ ምስ መዓልቲ መቃብር ኪከውን ስፍራይ
ከመይ ኪርስዖ ''ቲ ዚገበርካለይ
መዝሙር ቀይርካዮ ኢካ ናይ ትማል ኣውያተይ

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 4
እቲ ካ ብድፍረት ንቤትካ ከሳዲድ
ኣመንቲ ደቅካ ካብ ቤቶም ኪሳጉግ
ናይ ትማሊ ሳኦል ናይ ሎሚ ግን ፓውሎስ
ሕሩይ ኣቅሓ ጌርካ ሸሙካኒ ክርስቶስ

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 5
መን ዩ ዘይፍወስ ንስምካ ጸዊዑ
መንዪ ዝተነጽገ ናባካ ቀሪቡ
መንገዲን ሓቅን ሂወትን ኢካ ንዓይ
ኣብ ፍቃድካ ምንባር ኮይኑሎ ምርጫይ

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 6
ጎይታ ታሪክና ቀይሩ ናብ ቤቱ ዪምለሰና

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ',
        lyrics_transliteration = 'CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley

VERSE 1
Lieli za nebsey zihalekaley
Wedi hiyaw amlak qeyari tarikey
Kab merko seyt’an nibzuh zemenat
Ts’dqey nateqots’re qedad ch’erqi rikset

CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley

VERSE 2
Bitesfa kits’be kiri midhaney
Kab semay weridka moytkayo nimoty
Nifqrka''mo kizmr ye gena mannetey qeyrkayo ika
Geta lefqrh ezemralew gena mannete qeyrehal ana

CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley

VERSE 3
Maeserti legewon mis ts’enia nebsey
Leyti mis mealti meqabr kikewn sifray
Kemey kirso ''ti zigeberkaley
Mezmur qeyrkayo ika nay timal awyatey

CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley

VERSE 4
Eti ka bidfret nibetka kesadid
Amenti deqka kab betom kisagug
Nay timali saol nay lomi gin pawlos
Hiruy aqha gerka shemukani Kristos

CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley

VERSE 5
Men yu zeyfwes nismka ts’ewiu
Menyi zitenets’ge nabaka qeribu
Mengedin haqn hiwetn ika niay
Ab fiqadka minbar koynulo mirch’ay

CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley

VERSE 6
Goyta tarikna qeyru nab betu yimlesena

CHORUS
Bizey niska men aleni deyu ts’egi
Bizey qilts’mkas men neruni degafi.
Hasab dehan yu hasabka niay
Iyesus Kristos goyta kibereley',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1694e22d-ed51-4ad0-90a8-23b0e4f235f1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 1
ሊዕሊ ዛ ነብሰይ ዝሓለካለይ
ወዲ ህያው ኣምላክ ቀያሪ ታሪከይ
ካብ መርኮ ሰይጣን ንብዙሕ ዘመናት
ጽድቀይ ናተቆጽረ ቀዳድ ጨርቂ ሪክሰት

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 2
ብተስፋ ኪጽበ ኪርኢ ምድሓነይ
ካብ ሰማይ ወሪድካ ሞይትካዮ ንሞትይ
ንፍቅርካ''ሞ ኪዝምር የ ጌና ማንነተይ ቀይርካዮ ኢካ
ጌታ ለፍቅርህ እዘምራለው ገና ማንኔተ ቀይረሃል አና

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 3
ማእሰርቲ ለጌዎን ምስ ጸኒዓ ነብሰይ
ለይቲ ምስ መዓልቲ መቃብር ኪከውን ስፍራይ
ከመይ ኪርስዖ ''ቲ ዚገበርካለይ
መዝሙር ቀይርካዮ ኢካ ናይ ትማል ኣውያተይ

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 4
እቲ ካ ብድፍረት ንቤትካ ከሳዲድ
ኣመንቲ ደቅካ ካብ ቤቶም ኪሳጉግ
ናይ ትማሊ ሳኦል ናይ ሎሚ ግን ፓውሎስ
ሕሩይ ኣቅሓ ጌርካ ሸሙካኒ ክርስቶስ

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 5
መን ዩ ዘይፍወስ ንስምካ ጸዊዑ
መንዪ ዝተነጽገ ናባካ ቀሪቡ
መንገዲን ሓቅን ሂወትን ኢካ ንዓይ
ኣብ ፍቃድካ ምንባር ኮይኑሎ ምርጫይ

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ

VERSE 6
ጎይታ ታሪክና ቀይሩ ናብ ቤቱ ዪምለሰና

CHORUS
ብዘይ ንስካ መን ኣለኒ ደዩ ጸግዒ
ብዘይ ቅልጽምካስ መን ኔሩኒ ደጋፊ.
ሓሳብ ደሓን ዩ ሓሳብካ ንዓይ
ኢየሱስ ክርስቶስ ጎይታ ኪበረለይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1694e22d-ed51-4ad0-90a8-23b0e4f235f1'::uuid, 'tv-keyari-tarikey', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- amanuel-amlak-misgana-yigebahal ("Amanuel Amlak Misgana Yigebahal")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f045b02e-558d-4657-90dc-0a4ba999af06'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ

VERSE 1
እንደምስኪን ደሃ አንገቱን ቀልሶ……እሰይ የምስራች
ምህረት ላረገልን እምባችን አብሶ… እሰይ የምስራች
ከባርነት ቀምበር ፍፁም ነፃ ወጣ …እሰይ የምስራች
ደስይለናል ባንተ በትንሳኤው ብርሃን…እሰይየምስራች

CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ

VERSE 2
ከለሜዳ ለብሶ እርቃኑን የቆመው …..እሰይ የምስራች
የኛ መድኃኒዓለም ሞትን ድልአረገው…እሰይ የምስራች
ጨረቃና ከዋክብት ደም ለአለቀሱለት…እሰይ የምስራች
ሞትን ድልለነሳው እናመስግን በእውነት…እሰይ የምስራች

CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ

VERSE 3
መቅደላዊት ማርያም በጣም ደስይበልሽ…እሰይየምስራች
አምላክሽ ተነስቷል ከሐጢአት ያነፃሽ…እሰይ የምስራች
እናንተ ሐዋርያት በእምነት የፀናችሁ…እሰይ የምስራች
ፍራቻው ይወገድ ተነስቷል ጌታችሁ…እሰይ የምስራች

CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ

VERSE 4
ንገሩ ለዓለም ያረገላችሁን…… ……እሰይ የምስራች
ከሲኦል እስራት ያላቀቃችሁን…… …እሰይ የምስራች
እሰይ የምስራች ሰይጣን ድል ተመታ…እሰይ የምስራች
ዝማሬን እናቅርብ ሁላችን በእልልታ …እሰይ የምስራች

CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta

VERSE 1
Endemskin deha angetun qelso……esey yemsrach
Mihret laregeln embachn abso… esey yemsrach
Kebarnet qember fits’um nets’a wet’a …esey yemsrach
Desylenal bante betnsaew birhan…eseyyemsrach

CHORUS
Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta

VERSE 2
Kelemeda lebso erqanun yeqomew …..esey yemsrach
Yegna medhanialem motn dilaregew…esey yemsrach
Ch’ereqana kewakbt dem lealeqesulet…esey yemsrach
Motn dillenesaw enamesgn beewnet…esey yemsrach

CHORUS
Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta

VERSE 3
Meqdelawit Maryam bet’am desybelsh…eseyyemsrach
Amlaksh tenestwal kehet’iat yanets’ash…esey yemsrach
Enante hewaryat beemnet yets’enachhu…esey yemsrach
Firachaw yiweged tenestwal getachhu…esey yemsrach

CHORUS
Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta

VERSE 4
Nigeru lealem yaregelachhun…… ……esey yemsrach
Kesiol esrat yalaqeqachhun…… …esey yemsrach
Esey yemsrach seyt’an dil temeta…esey yemsrach
Zimaren enaqrb hulachn beellta …esey yemsrach

CHORUS
Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ

VERSE 1
እንደምስኪን ደሃ አንገቱን ቀልሶ……እሰይ የምስራች
ምህረት ላረገልን እምባችን አብሶ… እሰይ የምስራች
ከባርነት ቀምበር ፍፁም ነፃ ወጣ …እሰይ የምስራች
ደስይለናል ባንተ በትንሳኤው ብርሃን…እሰይየምስራች

CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ

VERSE 2
ከለሜዳ ለብሶ እርቃኑን የቆመው …..እሰይ የምስራች
የኛ መድኃኒዓለም ሞትን ድልአረገው…እሰይ የምስራች
ጨረቃና ከዋክብት ደም ለአለቀሱለት…እሰይ የምስራች
ሞትን ድልለነሳው እናመስግን በእውነት…እሰይ የምስራች

CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ

VERSE 3
መቅደላዊት ማርያም በጣም ደስይበልሽ…እሰይየምስራች
አምላክሽ ተነስቷል ከሐጢአት ያነፃሽ…እሰይ የምስራች
እናንተ ሐዋርያት በእምነት የፀናችሁ…እሰይ የምስራች
ፍራቻው ይወገድ ተነስቷል ጌታችሁ…እሰይ የምስራች

CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ

VERSE 4
ንገሩ ለዓለም ያረገላችሁን…… ……እሰይ የምስራች
ከሲኦል እስራት ያላቀቃችሁን…… …እሰይ የምስራች
እሰይ የምስራች ሰይጣን ድል ተመታ…እሰይ የምስራች
ዝማሬን እናቅርብ ሁላችን በእልልታ …እሰይ የምስራች

CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ',
        lyrics_transliteration = 'CHORUS
Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta

VERSE 1
Endemskin deha angetun qelso……esey yemsrach
Mihret laregeln embachn abso… esey yemsrach
Kebarnet qember fits’um nets’a wet’a …esey yemsrach
Desylenal bante betnsaew birhan…eseyyemsrach

CHORUS
Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta

VERSE 2
Kelemeda lebso erqanun yeqomew …..esey yemsrach
Yegna medhanialem motn dilaregew…esey yemsrach
Ch’ereqana kewakbt dem lealeqesulet…esey yemsrach
Motn dillenesaw enamesgn beewnet…esey yemsrach

CHORUS
Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta

VERSE 3
Meqdelawit Maryam bet’am desybelsh…eseyyemsrach
Amlaksh tenestwal kehet’iat yanets’ash…esey yemsrach
Enante hewaryat beemnet yets’enachhu…esey yemsrach
Firachaw yiweged tenestwal getachhu…esey yemsrach

CHORUS
Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta

VERSE 4
Nigeru lealem yaregelachhun…… ……esey yemsrach
Kesiol esrat yalaqeqachhun…… …esey yemsrach
Esey yemsrach seyt’an dil temeta…esey yemsrach
Zimaren enaqrb hulachn beellta …esey yemsrach

CHORUS
Amanuel amlak misgana yigebahel
Leadam lijoch hulu hiywetn set’tehel
Ellllllllta yigebal letalaqu Geta
Mihretn leset’en behet’iatachn fanta',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f045b02e-558d-4657-90dc-0a4ba999af06'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ
እንደምስኪን ደሃ አንገቱን ቀልሶ……እሰይ የምስራች
ምህረት ላረገልን እምባችን አብሶ… እሰይ የምስራች
ከባርነት ቀምበር ፍፁም ነፃ ወጣ …እሰይ የምስራች
ደስይለናል ባንተ በትንሳኤው ብርሃን…እሰይየምስራች
/አዝ/---------
ከለሜዳ ለብሶ እርቃኑን የቆመው …..እሰይ የምስራች
የኛ መድኃኒዓለም ሞትን ድልአረገው…እሰይ የምስራች
ጨረቃና ከዋክብት ደም ለአለቀሱለት…እሰይ የምስራች
ሞትን ድልለነሳው እናመስግን በእውነት…እሰይ የምስራች
/አዝ/---------
መቅደላዊት ማርያም በጣም ደስይበልሽ…እሰይየምስራች
አምላክሽ ተነስቷል ከሐጢአት ያነፃሽ…እሰይ የምስራች
እናንተ ሐዋርያት በእምነት የፀናችሁ…እሰይ የምስራች
ፍራቻው ይወገድ ተነስቷል ጌታችሁ…እሰይ የምስራች
/አዝ/---------
ንገሩ ለዓለም ያረገላችሁን…… ……እሰይ የምስራች
ከሲኦል እስራት ያላቀቃችሁን…… …እሰይ የምስራች
እሰይ የምስራች ሰይጣን ድል ተመታ…እሰይ የምስራች
ዝማሬን እናቅርብ ሁላችን በእልልታ …እሰይ የምስራች

VERSE 1
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ
እንደምስኪን ደሃ አንገቱን ቀልሶ……እሰይ የምስራች
ምህረት ላረገልን እምባችን አብሶ… እሰይ የምስራች
ከባርነት ቀምበር ፍፁም ነፃ ወጣ …እሰይ የምስራች
ደስይለናል ባንተ በትንሳኤው ብርሃን…እሰይየምስራች
/አዝ/---------
ከለሜዳ ለብሶ እርቃኑን የቆመው …..እሰይ የምስራች
የኛ መድኃኒዓለም ሞትን ድልአረገው…እሰይ የምስራች
ጨረቃና ከዋክብት ደም ለአለቀሱለት…እሰይ የምስራች
ሞትን ድልለነሳው እናመስግን በእውነት…እሰይ የምስራች
/አዝ/---------
መቅደላዊት ማርያም በጣም ደስይበልሽ…እሰይየምስራች
አምላክሽ ተነስቷል ከሐጢአት ያነፃሽ…እሰይ የምስራች
እናንተ ሐዋርያት በእምነት የፀናችሁ…እሰይ የምስራች
ፍራቻው ይወገድ ተነስቷል ጌታችሁ…እሰይ የምስራች
/አዝ/---------
ንገሩ ለዓለም ያረገላችሁን…… ……እሰይ የምስራች
ከሲኦል እስራት ያላቀቃችሁን…… …እሰይ የምስራች
እሰይ የምስራች ሰይጣን ድል ተመታ…እሰይ የምስራች
ዝማሬን እናቅርብ ሁላችን በእልልታ …እሰይ የምስራች

CHORUS
አማኑኤል አምላክ ምስጋና ይገባሀል
ለአዳም ልጆች ሁሉ ህይወትን ሰጥተሀል
እልልልልልልልልታ ይገባል ለታላቁ ጌታ
ምሕረትን ለሰጠን በሐጢአታችን ፋንታ
እንደምስኪን ደሃ አንገቱን ቀልሶ……እሰይ የምስራች
ምህረት ላረገልን እምባችን አብሶ… እሰይ የምስራች
ከባርነት ቀምበር ፍፁም ነፃ ወጣ …እሰይ የምስራች
ደስይለናል ባንተ በትንሳኤው ብርሃን…እሰይየምስራች
/አዝ/---------
ከለሜዳ ለብሶ እርቃኑን የቆመው …..እሰይ የምስራች
የኛ መድኃኒዓለም ሞትን ድልአረገው…እሰይ የምስራች
ጨረቃና ከዋክብት ደም ለአለቀሱለት…እሰይ የምስራች
ሞትን ድልለነሳው እናመስግን በእውነት…እሰይ የምስራች
/አዝ/---------
መቅደላዊት ማርያም በጣም ደስይበልሽ…እሰይየምስራች
አምላክሽ ተነስቷል ከሐጢአት ያነፃሽ…እሰይ የምስራች
እናንተ ሐዋርያት በእምነት የፀናችሁ…እሰይ የምስራች
ፍራቻው ይወገድ ተነስቷል ጌታችሁ…እሰይ የምስራች
/አዝ/---------
ንገሩ ለዓለም ያረገላችሁን…… ……እሰይ የምስራች
ከሲኦል እስራት ያላቀቃችሁን…… …እሰይ የምስራች
እሰይ የምስራች ሰይጣን ድል ተመታ…እሰይ የምስራች
ዝማሬን እናቅርብ ሁላችን በእልልታ …እሰይ የምስራች'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
emanuel emlak msgana ygebahel
leedam ljoch hulu hywetn settehel
llllllllta ygebal letalaqu geta
mhretn leseten behetietachn fanta
ndemskin deha engetun qelso……sey yemsrach
mhret laregeln mbachn ebso… sey yemsrach
kebarnet qember ftsum netsa weta …sey yemsrach
desylenal bante betnsaew brhan…seyyemsrach
/ez/---------
kelemeda lebso rqanun yeqomew …..sey yemsrach
yenya medhanialem motn dleregew…sey yemsrach
chereqana kewakbt dem leeleqesulet…sey yemsrach
motn dllenesaw namesgn bewnet…sey yemsrach
/ez/---------
meqdelawit maryam betam desybelsh…seyyemsrach
emlaksh tenesl kehetiet yanetsash…sey yemsrach
nante hewaryat bemnet yetsenachhu…sey yemsrach
frachaw yweged tenesl getachhu…sey yemsrach
/ez/---------
ngeru lealem yaregelachhun…… ……sey yemsrach
kesiol srat yalaqeqachhun…… …sey yemsrach
sey yemsrach seytan dl temeta…sey yemsrach
zmaren naqrb hulachn bellta …sey yemsrach

VERSE 1
emanuel emlak msgana ygebahel
leedam ljoch hulu hywetn settehel
llllllllta ygebal letalaqu geta
mhretn leseten behetietachn fanta
ndemskin deha engetun qelso……sey yemsrach
mhret laregeln mbachn ebso… sey yemsrach
kebarnet qember ftsum netsa weta …sey yemsrach
desylenal bante betnsaew brhan…seyyemsrach
/ez/---------
kelemeda lebso rqanun yeqomew …..sey yemsrach
yenya medhanialem motn dleregew…sey yemsrach
chereqana kewakbt dem leeleqesulet…sey yemsrach
motn dllenesaw namesgn bewnet…sey yemsrach
/ez/---------
meqdelawit maryam betam desybelsh…seyyemsrach
emlaksh tenesl kehetiet yanetsash…sey yemsrach
nante hewaryat bemnet yetsenachhu…sey yemsrach
frachaw yweged tenesl getachhu…sey yemsrach
/ez/---------
ngeru lealem yaregelachhun…… ……sey yemsrach
kesiol srat yalaqeqachhun…… …sey yemsrach
sey yemsrach seytan dl temeta…sey yemsrach
zmaren naqrb hulachn bellta …sey yemsrach

CHORUS
emanuel emlak msgana ygebahel
leedam ljoch hulu hywetn settehel
llllllllta ygebal letalaqu geta
mhretn leseten behetietachn fanta
ndemskin deha engetun qelso……sey yemsrach
mhret laregeln mbachn ebso… sey yemsrach
kebarnet qember ftsum netsa weta …sey yemsrach
desylenal bante betnsaew brhan…seyyemsrach
/ez/---------
kelemeda lebso rqanun yeqomew …..sey yemsrach
yenya medhanialem motn dleregew…sey yemsrach
chereqana kewakbt dem leeleqesulet…sey yemsrach
motn dllenesaw namesgn bewnet…sey yemsrach
/ez/---------
meqdelawit maryam betam desybelsh…seyyemsrach
emlaksh tenesl kehetiet yanetsash…sey yemsrach
nante hewaryat bemnet yetsenachhu…sey yemsrach
frachaw yweged tenesl getachhu…sey yemsrach
/ez/---------
ngeru lealem yaregelachhun…… ……sey yemsrach
kesiol srat yalaqeqachhun…… …sey yemsrach
sey yemsrach seytan dl temeta…sey yemsrach
zmaren naqrb hulachn bellta …sey yemsrach';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f045b02e-558d-4657-90dc-0a4ba999af06'::uuid, 'amanuel-amlak-misgana-yigebahal', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bemin-des-lasegnih ("Bemin Des Lasegnih")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c6f6c62a-cb45-459a-afd0-9841b2dc7a92'::uuid
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
    WHERE import_id = 'c6f6c62a-cb45-459a-afd0-9841b2dc7a92'::uuid
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
        'c6f6c62a-cb45-459a-afd0-9841b2dc7a92'::uuid, 'bemin-des-lasegnih', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- my-home-is-filled ("My Home is Filled")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f07548ed-55dc-4333-8f83-781a7f635723'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Bedinkuane elilta mulu new
Bedinkuane zimare mulu new
Bemaninete lay Egziabher talak new'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
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
For greater is the Lord that resides within me',
        lyrics_transliteration = 'Bedinkuane elilta mulu new
Bedinkuane zimare mulu new
Bemaninete lay Egziabher talak new',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f07548ed-55dc-4333-8f83-781a7f635723'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM 'Bedinkuane elilta mulu new
Bedinkuane zimare mulu new
Bemaninete lay Egziabher talak new';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f07548ed-55dc-4333-8f83-781a7f635723'::uuid, 'my-home-is-filled', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- miragn ("Miragn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '16e31e44-dcd4-4e8b-ace8-4f1b4dc665c7'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
በሠማርያ ስትመጣ ከያዕቆብ ጉድጓድ ብትደርስ',
        lyrics_transliteration = 'CHORUS
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
Besemarya sitmet’a keyaeqob gudgwad bitders',
        updated_at = clock_timestamp()::text
    WHERE import_id = '16e31e44-dcd4-4e8b-ace8-4f1b4dc665c7'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '16e31e44-dcd4-4e8b-ace8-4f1b4dc665c7'::uuid, 'miragn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zemari-berehet-tihue-beza-kulu-beza-kulu-bereket-tikue ("Zemari.berehet Tihue# Beza Kulu Beza Kulu# Bereket Tikue")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '17204da1-50db-431a-8900-f14c7760328a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ቀራንዬ ብድኻም በጽሐ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Qeranye bidኻm bets’he'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = '17204da1-50db-431a-8900-f14c7760328a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ቀራንዬ ብድኻም በጽሐ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '17204da1-50db-431a-8900-f14c7760328a'::uuid, 'zemari-berehet-tihue-beza-kulu-beza-kulu-bereket-tikue', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- enidetenagere-tenesitwal ("Enidetenagere Tenesitwal")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'de3afde3-e61f-443b-956a-6598a423db4d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ይብዛ ሰላማችሁ
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ሰላም ለሁላችሁ

VERSE 1
እንደተናገረው በገሊላ ሳለ
በኃጥያተኞች እጅ በእንጨት ተሰቀለ
በሶስተኛውም ቀን ከሙታን ተነሳ
ሞትን አሸንፎ የይሁዳ አንበሳ

CHORUS
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ይብዛ ሰላማችሁ
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ሰላም ለሁላችሁ

VERSE 2
መግደላዊት ማርያም ወጣች በማለዳ
ሽቶ ልትቀባው ከመቃብር ወርዳ
የመቃብር መዝጊያው ድንጋይ ተንከባሏል
ስጋው በዚያ የለም ኢየሱስ ተነስቷል

CHORUS
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ይብዛ ሰላማችሁ
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ሰላም ለሁላችሁ

VERSE 3
ነፍሴን የመለሰው ከአጥያት ጎዳና
ጌታዬ ተወስዷል ስትል በእንባ ሆና
ለምን ታለቅሻለሽ ሲላት የነበረው
የአትክልት ጠባቂው አደለም ጌታ ነው

CHORUS
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ይብዛ ሰላማችሁ
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ሰላም ለሁላችሁ

VERSE 4
የጌታን መነሳት አትጠራጠሩ
ጴጥሮስም አትሂድ ወደ መቃብሩ
ቅዠት መስሎ ዜናው ከቶ አይታያችሁ
የሆነው ድንቅ ነው ይቀበል ልባችሁ

CHORUS
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ይብዛ ሰላማችሁ
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ሰላም ለሁላችሁ

VERSE 5
በሲዖል ባልተወን ባከበረን ጌታ
ሰላም ታወጀልን አለን በፀጥታ
መውጊያው ወዴት አለ ብለን የዘመርነው
በትንሳኤው ብርሃን ሞት ድል ተነስቶ ነው

CHORUS
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ይብዛ ሰላማችሁ
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ሰላም ለሁላችሁ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal yibza selamachhu
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal selam lehulachhu

VERSE 1
Endetenagerew begelila sale
Behat’yategnoch ej beench’et teseqele
Besostegnawm qen kemutan tenesa
Motn ashenfo yeyhuda anbesa

CHORUS
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal yibza selamachhu
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal selam lehulachhu

VERSE 2
Megdelawit Maryam wet’ach bemaleda
Shto litqebaw kemeqabr werda
Yemeqabr mezgiyaw dingay tenkebalwal
Sigaw beziya yelem Iyesus tenestwal

CHORUS
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal yibza selamachhu
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal selam lehulachhu

VERSE 3
Nefsen yemelesew keat’yat godana
Getaye tewesdwal sitl beenba hona
Lemn taleqshalesh silat yeneberew
Yeatklt t’ebaqiw adelem Geta new

CHORUS
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal yibza selamachhu
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal selam lehulachhu

VERSE 4
Yegetan menesat att’erat’eru
P’et’rosm athid wede meqabru
Qizhet meslo zenaw keto aytayachhu
Yehonew dinq new yiqebel libachhu

CHORUS
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal yibza selamachhu
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal selam lehulachhu

VERSE 5
Besiol baltewen bakeberen Geta
Selam tawejeln alen bets’et’ta
Mewgiyaw wedet ale bilen yezemernew
Betnsaew birhan mot dil tenesto new

CHORUS
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal yibza selamachhu
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal selam lehulachhu'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ይብዛ ሰላማችሁ
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ሰላም ለሁላችሁ

VERSE 1
እንደተናገረው በገሊላ ሳለ
በኃጥያተኞች እጅ በእንጨት ተሰቀለ
በሶስተኛውም ቀን ከሙታን ተነሳ
ሞትን አሸንፎ የይሁዳ አንበሳ

CHORUS
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ይብዛ ሰላማችሁ
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ሰላም ለሁላችሁ

VERSE 2
መግደላዊት ማርያም ወጣች በማለዳ
ሽቶ ልትቀባው ከመቃብር ወርዳ
የመቃብር መዝጊያው ድንጋይ ተንከባሏል
ስጋው በዚያ የለም ኢየሱስ ተነስቷል

CHORUS
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ይብዛ ሰላማችሁ
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ሰላም ለሁላችሁ

VERSE 3
ነፍሴን የመለሰው ከአጥያት ጎዳና
ጌታዬ ተወስዷል ስትል በእንባ ሆና
ለምን ታለቅሻለሽ ሲላት የነበረው
የአትክልት ጠባቂው አደለም ጌታ ነው

CHORUS
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ይብዛ ሰላማችሁ
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ሰላም ለሁላችሁ

VERSE 4
የጌታን መነሳት አትጠራጠሩ
ጴጥሮስም አትሂድ ወደ መቃብሩ
ቅዠት መስሎ ዜናው ከቶ አይታያችሁ
የሆነው ድንቅ ነው ይቀበል ልባችሁ

CHORUS
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ይብዛ ሰላማችሁ
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ሰላም ለሁላችሁ

VERSE 5
በሲዖል ባልተወን ባከበረን ጌታ
ሰላም ታወጀልን አለን በፀጥታ
መውጊያው ወዴት አለ ብለን የዘመርነው
በትንሳኤው ብርሃን ሞት ድል ተነስቶ ነው

CHORUS
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ይብዛ ሰላማችሁ
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ሰላም ለሁላችሁ',
        lyrics_transliteration = 'CHORUS
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal yibza selamachhu
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal selam lehulachhu

VERSE 1
Endetenagerew begelila sale
Behat’yategnoch ej beench’et teseqele
Besostegnawm qen kemutan tenesa
Motn ashenfo yeyhuda anbesa

CHORUS
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal yibza selamachhu
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal selam lehulachhu

VERSE 2
Megdelawit Maryam wet’ach bemaleda
Shto litqebaw kemeqabr werda
Yemeqabr mezgiyaw dingay tenkebalwal
Sigaw beziya yelem Iyesus tenestwal

CHORUS
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal yibza selamachhu
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal selam lehulachhu

VERSE 3
Nefsen yemelesew keat’yat godana
Getaye tewesdwal sitl beenba hona
Lemn taleqshalesh silat yeneberew
Yeatklt t’ebaqiw adelem Geta new

CHORUS
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal yibza selamachhu
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal selam lehulachhu

VERSE 4
Yegetan menesat att’erat’eru
P’et’rosm athid wede meqabru
Qizhet meslo zenaw keto aytayachhu
Yehonew dinq new yiqebel libachhu

CHORUS
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal yibza selamachhu
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal selam lehulachhu

VERSE 5
Besiol baltewen bakeberen Geta
Selam tawejeln alen bets’et’ta
Mewgiyaw wedet ale bilen yezemernew
Betnsaew birhan mot dil tenesto new

CHORUS
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal yibza selamachhu
Hiyawn kemutan mehel lemn felegachhu
Tenestwal Geta tenestwal selam lehulachhu',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'de3afde3-e61f-443b-956a-6598a423db4d'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ይብዛ ሰላማችሁ
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ሰላም ለሁላችሁ

VERSE 1
እንደተናገረው በገሊላ ሳለ
በኃጥያተኞች እጅ በእንጨት ተሰቀለ
በሶስተኛውም ቀን ከሙታን ተነሳ
ሞትን አሸንፎ የይሁዳ አንበሳ

CHORUS
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ይብዛ ሰላማችሁ
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ሰላም ለሁላችሁ

VERSE 2
መግደላዊት ማርያም ወጣች በማለዳ
ሽቶ ልትቀባው ከመቃብር ወርዳ
የመቃብር መዝጊያው ድንጋይ ተንከባሏል
ስጋው በዚያ የለም ኢየሱስ ተነስቷል

CHORUS
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ይብዛ ሰላማችሁ
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ሰላም ለሁላችሁ

VERSE 3
ነፍሴን የመለሰው ከአጥያት ጎዳና
ጌታዬ ተወስዷል ስትል በእንባ ሆና
ለምን ታለቅሻለሽ ሲላት የነበረው
የአትክልት ጠባቂው አደለም ጌታ ነው

CHORUS
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ይብዛ ሰላማችሁ
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ሰላም ለሁላችሁ

VERSE 4
የጌታን መነሳት አትጠራጠሩ
ጴጥሮስም አትሂድ ወደ መቃብሩ
ቅዠት መስሎ ዜናው ከቶ አይታያችሁ
የሆነው ድንቅ ነው ይቀበል ልባችሁ

CHORUS
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ይብዛ ሰላማችሁ
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ሰላም ለሁላችሁ

VERSE 5
በሲዖል ባልተወን ባከበረን ጌታ
ሰላም ታወጀልን አለን በፀጥታ
መውጊያው ወዴት አለ ብለን የዘመርነው
በትንሳኤው ብርሃን ሞት ድል ተነስቶ ነው

CHORUS
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ይብዛ ሰላማችሁ
ህያውን ከሙታን መሀል ለምን ፈለጋችሁ
ተነስቷል ጌታ ተነስቷል ሰላም ለሁላችሁ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'de3afde3-e61f-443b-956a-6598a423db4d'::uuid, 'enidetenagere-tenesitwal', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bizu-lijoch-alut ("Bizu Lijoch Alut")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f1536944-2df2-4c94-873c-2515b756ee8b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 1
ከመላዕክት ክብሩ ከፍ ከፍ ብሎ
በአምላኬ ተሾመ ዘንዶውንም ጥሎ
አሳዳጊዬ ነው ሆኖ እናት አባቴ
ሚካኤል ባለበት ይሸሻል ጠላቴ

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 2
ከሚታየው ሁሉ ልቤ ከሚፈራው
ካላየሁት ነገር ጠላት ከሰወረው
ያድነኛል ፈጥኖ በመንገዴ ወቶ
ሚካኤል ሀያሉ ክንፎቹን ዘርግቶ

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 3
በባህራን ታሪክ በነተላፊኖስ
በአፎምያ መትረፍ በነ ዱራታኦስ
በነብዩ ዳንኤል መች ይፈጸምና
የሚካኤል ስራ ይቀጥላል ገና

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 4
በጉዞ የረዳቹ በባህር በየብሱ
ፈጥኖ ደርሶላቹ እንባን ስታፈሱ
ስለታችሁ ሰምሯል ቁሙ ለዝማሬ
በሚካኤል ምልጃ የቆማችሁ ዛሬ

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 5
ክብር ለሚገባው ክብርን እንሰጣለን
ንጉሥ ለወደደው አንሰግድለታለን
እንኳን ለሚካኤል ለሚቆም ጌታ ፊት
ክብርን እንሰጥ የለ ለምድር ሹማምንት

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bizu lijoch alut lesmu miskr
Bezuriyaw yalutn abqtwal lekbr
Silefts’um miljaw lenegn yileyal
Melaku Mikael silew des yilegnal

VERSE 1
Kemelaekt kibru kef kef bilo
Beamlake teshome zendownm t’lo
Asadagiye new hono enat abate
Mikael balebet yisheshal t’elate

CHORUS
Bizu lijoch alut lesmu miskr
Bezuriyaw yalutn abqtwal lekbr
Silefts’um miljaw lenegn yileyal
Melaku Mikael silew des yilegnal

VERSE 2
Kemitayew hulu libe kemiferaw
Kalayehut neger t’elat kesewerew
Yadnegnal fet’no bemengede weto
Mikael heyalu kinfochun zergto

CHORUS
Bizu lijoch alut lesmu miskr
Bezuriyaw yalutn abqtwal lekbr
Silefts’um miljaw lenegn yileyal
Melaku Mikael silew des yilegnal

VERSE 3
Bebahran tarik benetelafinos
Beafomya metref bene durataos
Benebyu danel mech yifets’emna
YeMikael sira yiqet’lal gena

CHORUS
Bizu lijoch alut lesmu miskr
Bezuriyaw yalutn abqtwal lekbr
Silefts’um miljaw lenegn yileyal
Melaku Mikael silew des yilegnal

VERSE 4
Beguzo yeredachu bebahr beyebsu
Fet’no dersolachu enban sitafesu
Siletachhu semrwal qumu lezmare
Bemikael milja yeqomachhu zare

CHORUS
Bizu lijoch alut lesmu miskr
Bezuriyaw yalutn abqtwal lekbr
Silefts’um miljaw lenegn yileyal
Melaku Mikael silew des yilegnal

VERSE 5
Kibir lemigebaw kibrn enset’alen
Nigus lewededew ansegdletalen
Enkwan leMikael lemiqom Geta fit
Kibrn enset’ yele lemdr shumamnt

CHORUS
Bizu lijoch alut lesmu miskr
Bezuriyaw yalutn abqtwal lekbr
Silefts’um miljaw lenegn yileyal
Melaku Mikael silew des yilegnal'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 1
ከመላዕክት ክብሩ ከፍ ከፍ ብሎ
በአምላኬ ተሾመ ዘንዶውንም ጥሎ
አሳዳጊዬ ነው ሆኖ እናት አባቴ
ሚካኤል ባለበት ይሸሻል ጠላቴ

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 2
ከሚታየው ሁሉ ልቤ ከሚፈራው
ካላየሁት ነገር ጠላት ከሰወረው
ያድነኛል ፈጥኖ በመንገዴ ወቶ
ሚካኤል ሀያሉ ክንፎቹን ዘርግቶ

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 3
በባህራን ታሪክ በነተላፊኖስ
በአፎምያ መትረፍ በነ ዱራታኦስ
በነብዩ ዳንኤል መች ይፈጸምና
የሚካኤል ስራ ይቀጥላል ገና

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 4
በጉዞ የረዳቹ በባህር በየብሱ
ፈጥኖ ደርሶላቹ እንባን ስታፈሱ
ስለታችሁ ሰምሯል ቁሙ ለዝማሬ
በሚካኤል ምልጃ የቆማችሁ ዛሬ

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 5
ክብር ለሚገባው ክብርን እንሰጣለን
ንጉሥ ለወደደው አንሰግድለታለን
እንኳን ለሚካኤል ለሚቆም ጌታ ፊት
ክብርን እንሰጥ የለ ለምድር ሹማምንት

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል',
        lyrics_transliteration = 'CHORUS
Bizu lijoch alut lesmu miskr
Bezuriyaw yalutn abqtwal lekbr
Silefts’um miljaw lenegn yileyal
Melaku Mikael silew des yilegnal

VERSE 1
Kemelaekt kibru kef kef bilo
Beamlake teshome zendownm t’lo
Asadagiye new hono enat abate
Mikael balebet yisheshal t’elate

CHORUS
Bizu lijoch alut lesmu miskr
Bezuriyaw yalutn abqtwal lekbr
Silefts’um miljaw lenegn yileyal
Melaku Mikael silew des yilegnal

VERSE 2
Kemitayew hulu libe kemiferaw
Kalayehut neger t’elat kesewerew
Yadnegnal fet’no bemengede weto
Mikael heyalu kinfochun zergto

CHORUS
Bizu lijoch alut lesmu miskr
Bezuriyaw yalutn abqtwal lekbr
Silefts’um miljaw lenegn yileyal
Melaku Mikael silew des yilegnal

VERSE 3
Bebahran tarik benetelafinos
Beafomya metref bene durataos
Benebyu danel mech yifets’emna
YeMikael sira yiqet’lal gena

CHORUS
Bizu lijoch alut lesmu miskr
Bezuriyaw yalutn abqtwal lekbr
Silefts’um miljaw lenegn yileyal
Melaku Mikael silew des yilegnal

VERSE 4
Beguzo yeredachu bebahr beyebsu
Fet’no dersolachu enban sitafesu
Siletachhu semrwal qumu lezmare
Bemikael milja yeqomachhu zare

CHORUS
Bizu lijoch alut lesmu miskr
Bezuriyaw yalutn abqtwal lekbr
Silefts’um miljaw lenegn yileyal
Melaku Mikael silew des yilegnal

VERSE 5
Kibir lemigebaw kibrn enset’alen
Nigus lewededew ansegdletalen
Enkwan leMikael lemiqom Geta fit
Kibrn enset’ yele lemdr shumamnt

CHORUS
Bizu lijoch alut lesmu miskr
Bezuriyaw yalutn abqtwal lekbr
Silefts’um miljaw lenegn yileyal
Melaku Mikael silew des yilegnal',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f1536944-2df2-4c94-873c-2515b756ee8b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 1
አዝ......

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 2
ከመላዕክት ክብሩ ከፍ ከፍ ብሎ
በአምላኬ ተሾመ ዘንዶውንም ጥሎ
አሳዳጊዬ ነው ሆኖ እናት አባቴ
ሚካኤል ባለበት ይሸሻል ጠላቴ

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 3
አዝ.......

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 4
ከሚታየው ሁሉ ልቤ ከሚፈራው
ካላየሁት ነገር ጠላት ከሰወረው
ያድነኛል ፈጥኖ በመንገዴ ወቶ
ሚካኤል ሀያሉ ክንፎቹን ዘርግቶ

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 5
አዝ.........

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 6
በባህራን ታሪክ በነተላፊኖስ
በአፎምያ መትረፍ በነ ዱራታኦስ
በነብዩ ዳንኤል መች ይፈጸምና
የሚካኤል ስራ ይቀጥላል ገና

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 7
አዝ........

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 8
በጉዞ የረዳቹ በባህር በየብሱ
ፈጥኖ ደርሶላቹ እንባን ስታፈሱ
ስለታችሁ ሰምሯል ቁሙ ለዝማሬ
በሚካኤል ምልጃ የቆማችሁ ዛሬ

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 9
አዝ.......

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል

VERSE 10
ክብር ለሚገባው ክብርን እንሰጣለን
ንጉሥ ለወደደው አንሰግድለታለን
እንኳን ለሚካኤል ለሚቆም ጌታ ፊት
ክብርን እንሰጥ የለ ለምድር ሹማምንት

CHORUS
ብዙ ልጆች አሉት ለስሙ ምስክር
በዙሪያው ያሉትን አብቅቷል ለክብር
ስለፍፁም ምልጃው ለኔግን ይለያል
መላኩ ሚካኤል ስለው ደስ ይለኛል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bizu lijoch alut le-simu miskir
Be-zuriyaw yalut-in abki-twal le-kibir
Sile-fitsum miljâw le-negin yileyal
Mel-aku Mika''el silew des yilegnal

VERSE 1
Az...

CHORUS
Bizu lijoch alut le-simu miskir
Be-zuriyaw yalut-in abki-twal le-kibir
Sile-fitsum miljâw le-negin yileyal
Mel-aku Mika''el silew des yilegnal

VERSE 2
Ke-mela''ikt kibru kef kef bilo
Be-amlakie teshome zendow-nim t''ilo
Asadagiyie-new hono enat abbate
Mika''el balebet yisheshal t''elatte

CHORUS
Bizu lijoch alut le-simu miskir
Be-zuriyaw yalut-in abki-twal le-kibir
Sile-fitsum miljâw le-negin yileyal
Mel-aku Mika''el silew des yilegnal

VERSE 3
Az...

CHORUS
Bizu lijoch alut le-simu miskir
Be-zuriyaw yalut-in abki-twal le-kibir
Sile-fitsum miljâw le-negin yileyal
Mel-aku Mika''el silew des yilegnal

VERSE 4
Ke-mitayew hulu libie kemiferaw
Kalayehut neger t''elat kesewerew
Yadinegnal fetno be-mengedie wetto
Mika''el hayalu kinfochun zergitto

CHORUS
Bizu lijoch alut le-simu miskir
Be-zuriyaw yalut-in abki-twal le-kibir
Sile-fitsum miljâw le-negin yileyal
Mel-aku Mika''el silew des yilegnal

VERSE 5
Az...

CHORUS
Bizu lijoch alut le-simu miskir
Be-zuriyaw yalut-in abki-twal le-kibir
Sile-fitsum miljâw le-negin yileyal
Mel-aku Mika''el silew des yilegnal

VERSE 6
Be-Bahran tarik be-Netelafinos
Be-Afomiya metref be-ne Durata''os
Be-nebiyu Dani''el mech yifetsem-na
Ye-Mika''el sira yiket''elal gena

CHORUS
Bizu lijoch alut le-simu miskir
Be-zuriyaw yalut-in abki-twal le-kibir
Sile-fitsum miljâw le-negin yileyal
Mel-aku Mika''el silew des yilegnal

VERSE 7
Az...

CHORUS
Bizu lijoch alut le-simu miskir
Be-zuriyaw yalut-in abki-twal le-kibir
Sile-fitsum miljâw le-negin yileyal
Mel-aku Mika''el silew des yilegnal

VERSE 8
Be-guzo yeredachu be-bahir be-yebsu
Fetno dersolachu inba sitafesu
Siletachu semruwal qumu le-zimare
Be-Mika''el milja yeqomachihu zare

CHORUS
Bizu lijoch alut le-simu miskir
Be-zuriyaw yalut-in abki-twal le-kibir
Sile-fitsum miljâw le-negin yileyal
Mel-aku Mika''el silew des yilegnal

VERSE 9
Az...

CHORUS
Bizu lijoch alut le-simu miskir
Be-zuriyaw yalut-in abki-twal le-kibir
Sile-fitsum miljâw le-negin yileyal
Mel-aku Mika''el silew des yilegnal

VERSE 10
Kibir lemi-gebaw kibrin insetallen
Nigus le-wededew an-segd-letallen
Inkuwan le-Mika''el lemi-qom Geta fit
Kibrin inset-yele le-midir shumamint

CHORUS
Bizu lijoch alut le-simu miskir
Be-zuriyaw yalut-in abki-twal le-kibir
Sile-fitsum miljâw le-negin yileyal
Mel-aku Mika''el silew des yilegnal';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f1536944-2df2-4c94-873c-2515b756ee8b'::uuid, 'bizu-lijoch-alut', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- simishin-le-lij-lij ("Simishin Le-Lij Lij")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7284336c-41d6-4fda-b04e-5779ef063993'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 1
እመቤቴ ብዬ ስምሽን መጥራቴ
ቢራቆትብኝ ነው ባዶ ቢሆን ቤቴ
አይኖቼን ከንእንባ ከለቅሶ ከልክይ
ልብሽ ይራራልኝ ወደኔ አዘንብይ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 2
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 3
አዝ፡
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 4
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 5
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 6
ባህሩም ቢሞላ አምናለሁ በልጅሽ
አንገት አያስደፍም እናቴ ጸሎትሽ
ስምሽን ስጠራ እጆቼን ዘርግቼ
ቀስታቸውን ሁሉ ጣሉ ጠላቾቼ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 7
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 8
አዝ፡
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 9
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 10
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 11
ሰላም አለኝ አሁን ይህንን አውቃለሁ
እጅግ ብዙ ነገር ባንቺ አግኝቻለሁ
ማድጋዬ ሞልቶ አለም ተመልክቷል
ምድረ በዳው ልቤ በጸሎትሽ ረክቶል

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 12
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 13
አዝ፡
ባህሩም ቢሞላ አምናለሁ በልጅሽ
አንገት አያስደፍም እናቴ ጸሎትሽ
ስምሽን ስጠራ እጆቼን ዘርግቼ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 14
ቀስታቸውን ሁሉ ጣሉ ጠላቶቼ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 15
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 16
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 17
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 1
Emebete biye simishin metrate
Biraqotibign new bado bihon bete
Aynochen ke-inba ke-leqso kelkiyi

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 2
Libish yiraralign wedene azenbiyi
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 3
Maebel sayineqlign
Az:
Simishin le-lij lij inegralehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 4
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign
Simishin le-lij lij inegralehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 5
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 6
Bahirum bimola amnalehu be-lijish
Anget ayisdefim enate tselotish
Simishin sitera ejochen zergiche
Qestachewn hulu talu telatoche

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 7
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 8
Maebel sayineqlign
Az:
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 9
Emebete silish neylign
Maebel sayineqlign
Simishin le-lij lij inegralehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 10
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign
Selam alegn ahun yihinin awqalehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 11
Ejig bizu neger banchi agnyichalehu
Madgaye molto alem temelkitwal
Midre bedaw libe be-tselotish rektol

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 12
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 13
Az:
Bahirum bimola amnalehu be-lijish
Anget ayisdefim enate tselotish

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 14
Simishin sitera ejochen zergiche
Qestachewn hulu talu telatoche
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 15
Emebete silish neylign
Maebel sayineqlign
Simishin le-lij lij inegralehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 16
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign
Simishin le-lij lij inegralehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 17
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 1
እመቤቴ ብዬ ስምሽን መጥራቴ
ቢራቆትብኝ ነው ባዶ ቢሆን ቤቴ
አይኖቼን ከንእንባ ከለቅሶ ከልክይ
ልብሽ ይራራልኝ ወደኔ አዘንብይ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 2
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 3
አዝ፡
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 4
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 5
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 6
ባህሩም ቢሞላ አምናለሁ በልጅሽ
አንገት አያስደፍም እናቴ ጸሎትሽ
ስምሽን ስጠራ እጆቼን ዘርግቼ
ቀስታቸውን ሁሉ ጣሉ ጠላቾቼ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 7
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 8
አዝ፡
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 9
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 10
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 11
ሰላም አለኝ አሁን ይህንን አውቃለሁ
እጅግ ብዙ ነገር ባንቺ አግኝቻለሁ
ማድጋዬ ሞልቶ አለም ተመልክቷል
ምድረ በዳው ልቤ በጸሎትሽ ረክቶል

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 12
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 13
አዝ፡
ባህሩም ቢሞላ አምናለሁ በልጅሽ
አንገት አያስደፍም እናቴ ጸሎትሽ
ስምሽን ስጠራ እጆቼን ዘርግቼ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 14
ቀስታቸውን ሁሉ ጣሉ ጠላቶቼ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 15
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 16
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 17
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ',
        lyrics_transliteration = 'CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 1
Emebete biye simishin metrate
Biraqotibign new bado bihon bete
Aynochen ke-inba ke-leqso kelkiyi

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 2
Libish yiraralign wedene azenbiyi
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 3
Maebel sayineqlign
Az:
Simishin le-lij lij inegralehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 4
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign
Simishin le-lij lij inegralehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 5
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 6
Bahirum bimola amnalehu be-lijish
Anget ayisdefim enate tselotish
Simishin sitera ejochen zergiche
Qestachewn hulu talu telatoche

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 7
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 8
Maebel sayineqlign
Az:
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 9
Emebete silish neylign
Maebel sayineqlign
Simishin le-lij lij inegralehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 10
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign
Selam alegn ahun yihinin awqalehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 11
Ejig bizu neger banchi agnyichalehu
Madgaye molto alem temelkitwal
Midre bedaw libe be-tselotish rektol

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 12
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 13
Az:
Bahirum bimola amnalehu be-lijish
Anget ayisdefim enate tselotish

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 14
Simishin sitera ejochen zergiche
Qestachewn hulu talu telatoche
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 15
Emebete silish neylign
Maebel sayineqlign
Simishin le-lij lij inegralehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 16
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign
Simishin le-lij lij inegralehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 17
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7284336c-41d6-4fda-b04e-5779ef063993'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 1
እመቤቴ ብዬ ስምሽን መጥራቴ
ቢራቆትብኝ ነው ባዶ ቢሆን ቤቴ
አይኖቼን ከንእንባ ከለቅሶ ከልክይ
ልብሽ ይራራልኝ ወደኔ አዘንብይ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 2
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 3
አዝ፡
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 4
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 5
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 6
ባህሩም ቢሞላ አምናለሁ በልጅሽ
አንገት አያስደፍም እናቴ ጸሎትሽ
ስምሽን ስጠራ እጆቼን ዘርግቼ
ቀስታቸውን ሁሉ ጣሉ ጠላቾቼ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 7
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 8
አዝ፡
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 9
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 10
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 11
ሰላም አለኝ አሁን ይህንን አውቃለሁ
እጅግ ብዙ ነገር ባንቺ አግኝቻለሁ
ማድጋዬ ሞልቶ አለም ተመልክቷል
ምድረ በዳው ልቤ በጸሎትሽ ረክቶል

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 12
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 13
አዝ፡
ባህሩም ቢሞላ አምናለሁ በልጅሽ
አንገት አያስደፍም እናቴ ጸሎትሽ
ስምሽን ስጠራ እጆቼን ዘርግቼ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 14
ቀስታቸውን ሁሉ ጣሉ ጠላቶቼ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 15
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 16
ስምሽን ለልጅ ልጅ እነግራለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

VERSE 17
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ

CHORUS
ስምሽን ለልጅ ልጅ እነግርሀለሁ
እናቴ በምልጃሽ ሰው ሆኛለሁ
እመቤቴ ስልሽ ነይልኝ
ማዕበል ሳይነቅለኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 1
Emebete biye simishin metrate
Biraqotibign new bado bihon bete
Aynochen ke-inba ke-leqso kelkiyi

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 2
Libish yiraralign wedene azenbiyi
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 3
Maebel sayineqlign
Az:
Simishin le-lij lij inegralehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 4
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign
Simishin le-lij lij inegralehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 5
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 6
Bahirum bimola amnalehu be-lijish
Anget ayisdefim enate tselotish
Simishin sitera ejochen zergiche
Qestachewn hulu talu telatoche

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 7
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 8
Maebel sayineqlign
Az:
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 9
Emebete silish neylign
Maebel sayineqlign
Simishin le-lij lij inegralehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 10
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign
Selam alegn ahun yihinin awqalehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 11
Ejig bizu neger banchi agnyichalehu
Madgaye molto alem temelkitwal
Midre bedaw libe be-tselotish rektol

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 12
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 13
Az:
Bahirum bimola amnalehu be-lijish
Anget ayisdefim enate tselotish

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 14
Simishin sitera ejochen zergiche
Qestachewn hulu talu telatoche
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 15
Emebete silish neylign
Maebel sayineqlign
Simishin le-lij lij inegralehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 16
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign
Simishin le-lij lij inegralehu

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

VERSE 17
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign

CHORUS
Simishin le-lij lij inegralehu
Enate be-miljash sew hoyalehu
Emebete silish neylign
Maebel sayineqlign';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7284336c-41d6-4fda-b04e-5779ef063993'::uuid, 'simishin-le-lij-lij', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kedametsega ("Kedametsega")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7be7273e-42bf-4465-a437-036fc040c5b2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 1
ውበትና ሞገሴ
ግርማ ሆነህ ለነፍሴ
ሰማያዊው ጥበቤ
ታበራለህ በልቤ

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 2
የእግዚአብሔር አብ ቀኝ
ከሞት ያዳንከኝ
ቀዳሚሁ ቃል
ጌታ ተመስገን

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 3
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 4
ንፁሁ በግ ክርስቶስ
ኃጢአቴን ያስወገድከው
ይቅር ባይ ነህ አምላኬ
ለኔ በደል የሞትከው

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 5
የእግዚአብሔር አብ ቀኝ
ከሞት ያዳንከኝ
ቀዳሚሁ ቃል
ጌታ ተመስገን

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 6
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 7
ዓለምን ካለመኖር
በጥበብ አምጥተህ
መወለድ መሰቀልህ
ይደንቃል ማዳንህ

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 8
የእግዚአብሔር አብ ቀኝ
ከሞት ያዳንከኝ
ቀዳሚሁ ቃል
ጌታ ተመስገን

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 9
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 10
በሞትህ ሞቴ ጠፍቶ
ዛሬ በህይወት ቆሜያለሁ
የአብ ኃይሉ ጥበቡ
አመሰግንሃለሁ

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 11
የእግዚአብሔር አብ ቀኝ
ከሞት ያዳንከኝ
ቀዳሚሁ ቃል
ጌታ ተመስገን

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 12
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 13
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 1
Wibetna mogese
Girma honeh lenefse
Semayawiw t’bebe
Taberaleh belbe

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 2
YeEgziabher Ab qegn
Kemot yadankegn
Qedamihu qal
Geta temesgen

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 3
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 4
Nits’uhu beg Kristos
Hat’iaten yaswegedkew
Yiqr bay neh amlake
Lene bedel yemotkew

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 5
YeEgziabher Ab qegn
Kemot yadankegn
Qedamihu qal
Geta temesgen

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 6
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 7
Alemn kalemenor
Bet’beb amt’teh
Meweled meseqelh
Yidenqal madanh

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 8
YeEgziabher Ab qegn
Kemot yadankegn
Qedamihu qal
Geta temesgen

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 9
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 10
Bemoth mote t’efto
Zare behywet qomeyalehu
Yeab haylu t’bebu
Amesegnhalehu

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 11
YeEgziabher Ab qegn
Kemot yadankegn
Qedamihu qal
Geta temesgen

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 12
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 13
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 1
ውበትና ሞገሴ
ግርማ ሆነህ ለነፍሴ
ሰማያዊው ጥበቤ
ታበራለህ በልቤ

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 2
የእግዚአብሔር አብ ቀኝ
ከሞት ያዳንከኝ
ቀዳሚሁ ቃል
ጌታ ተመስገን

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 3
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 4
ንፁሁ በግ ክርስቶስ
ኃጢአቴን ያስወገድከው
ይቅር ባይ ነህ አምላኬ
ለኔ በደል የሞትከው

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 5
የእግዚአብሔር አብ ቀኝ
ከሞት ያዳንከኝ
ቀዳሚሁ ቃል
ጌታ ተመስገን

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 6
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 7
ዓለምን ካለመኖር
በጥበብ አምጥተህ
መወለድ መሰቀልህ
ይደንቃል ማዳንህ

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 8
የእግዚአብሔር አብ ቀኝ
ከሞት ያዳንከኝ
ቀዳሚሁ ቃል
ጌታ ተመስገን

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 9
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 10
በሞትህ ሞቴ ጠፍቶ
ዛሬ በህይወት ቆሜያለሁ
የአብ ኃይሉ ጥበቡ
አመሰግንሃለሁ

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 11
የእግዚአብሔር አብ ቀኝ
ከሞት ያዳንከኝ
ቀዳሚሁ ቃል
ጌታ ተመስገን

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 12
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 13
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና',
        lyrics_transliteration = 'CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 1
Wibetna mogese
Girma honeh lenefse
Semayawiw t’bebe
Taberaleh belbe

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 2
YeEgziabher Ab qegn
Kemot yadankegn
Qedamihu qal
Geta temesgen

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 3
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 4
Nits’uhu beg Kristos
Hat’iaten yaswegedkew
Yiqr bay neh amlake
Lene bedel yemotkew

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 5
YeEgziabher Ab qegn
Kemot yadankegn
Qedamihu qal
Geta temesgen

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 6
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 7
Alemn kalemenor
Bet’beb amt’teh
Meweled meseqelh
Yidenqal madanh

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 8
YeEgziabher Ab qegn
Kemot yadankegn
Qedamihu qal
Geta temesgen

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 9
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 10
Bemoth mote t’efto
Zare behywet qomeyalehu
Yeab haylu t’bebu
Amesegnhalehu

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 11
YeEgziabher Ab qegn
Kemot yadankegn
Qedamihu qal
Geta temesgen

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 12
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

VERSE 13
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana

CHORUS
Qedamets’ega Iyesus
Yeab yemanu Kristos
Getaye amlake nehna
Lesmh laqrb misgana',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7be7273e-42bf-4465-a437-036fc040c5b2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 1
ውበትና ሞገሴ
ግርማ ሆነህ ለነፍሴ
ሰማያዊው ጥበቤ
ታበራለህ በልቤ

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 2
የእግዚአብሔር አብ ቀኝ
ከሞት ያዳንከኝ
ቀዳሚሁ ቃል
ጌታ ተመስገን

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 3
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 4
ንፁሁ በግ ክርስቶስ
ኃጢአቴን ያስወገድከው
ይቅር ባይ ነህ አምላኬ
ለኔ በደል የሞትከው

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 5
የእግዚአብሔር አብ ቀኝ
ከሞት ያዳንከኝ
ቀዳሚሁ ቃል
ጌታ ተመስገን

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 6
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 7
ዓለምን ካለመኖር
በጥበብ አምጥተህ
መወለድ መሰቀልህ
ይደንቃል ማዳንህ

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 8
የእግዚአብሔር አብ ቀኝ
ከሞት ያዳንከኝ
ቀዳሚሁ ቃል
ጌታ ተመስገን

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 9
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 10
በሞትህ ሞቴ ጠፍቶ
ዛሬ በህይወት ቆሜያለሁ
የአብ ኃይሉ ጥበቡ
አመሰግንሃለሁ

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 11
የእግዚአብሔር አብ ቀኝ
ከሞት ያዳንከኝ
ቀዳሚሁ ቃል
ጌታ ተመስገን

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 12
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

VERSE 13
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና

CHORUS
ቀዳሜጸጋ ኢየሱስ
የአብ የማኑ ክርስቶስ
ጌታየ አምላኬ ነህና
ለስምህ ላቅርብ ምስጋና'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7be7273e-42bf-4465-a437-036fc040c5b2'::uuid, 'kedametsega', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ene-anite-bet ("Ene Anite Bet")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c4b79fd2-7433-44aa-994d-bcd6cc6cc7be'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም

VERSE 1
የሚመስልህ ማንም የለም።(2×)
ፀሎቴ ቢሆን የወረት
ጎደሎ ቢሆን የኔ እምነት
ባረከኝ እኔን ከሰማይ

CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም

VERSE 2
በደል ጥፋቴንም ሳታይ
ቀባኀኝ ጠርተኀኝ ከዱር
ሰጠኀኝ ከፍ ያለ መንበር
ሳይኖረኝ ምንም በጎነት

CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም

VERSE 3
ባረከኝ እኔን በረከት
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም

CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም

VERSE 4
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም።
ቃልኪዳንህን ኣክባሪ
ታማኝ ነህ ሁሌም መሀሪ

CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም

VERSE 5
የማልከውንም መኃላ
ኣትረሳም ኣትልም ችላ
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ

CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም

VERSE 6
ፍቅር ነህ ካባትም በላይ
የሰማይ የምድር ሲሳይ።

CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ene ante bet
Ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem

VERSE 1
Yemimeslh manm yelem.(2×)
Ts’elote bihon yeweret
Godelo bihon yene emnet
Barekegn enen kesemay

CHORUS
Ene ante bet
Ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem

VERSE 2
Bedel t’fatenm satay
Qebahegn t’ertehegn kedur
Set’ehegn kef yale menber
Saynoregn minm begonet

CHORUS
Ene ante bet
Ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem

VERSE 3
Barekegn enen bereket
Ene ante bet
Ene ante fit
Yemqom sew aydelehum

CHORUS
Ene ante bet
Ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem

VERSE 4
Gin fiqr neh lezelalem
Yemimeslh manm yelem.
Qalkidanhn akbari
Tamagn neh hulem meheri

CHORUS
Ene ante bet
Ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem

VERSE 5
Yemalkewnm mehala
Atresam atlm chla
Mekari dinq memhre
Lante new zema mezmure

CHORUS
Ene ante bet
Ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem

VERSE 6
Fiqr neh kabatm belay
Yesemay yemdr sisay.

CHORUS
Ene ante bet
Ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም

VERSE 1
የሚመስልህ ማንም የለም።(2×)
ፀሎቴ ቢሆን የወረት
ጎደሎ ቢሆን የኔ እምነት
ባረከኝ እኔን ከሰማይ

CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም

VERSE 2
በደል ጥፋቴንም ሳታይ
ቀባኀኝ ጠርተኀኝ ከዱር
ሰጠኀኝ ከፍ ያለ መንበር
ሳይኖረኝ ምንም በጎነት

CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም

VERSE 3
ባረከኝ እኔን በረከት
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም

CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም

VERSE 4
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም።
ቃልኪዳንህን ኣክባሪ
ታማኝ ነህ ሁሌም መሀሪ

CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም

VERSE 5
የማልከውንም መኃላ
ኣትረሳም ኣትልም ችላ
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ

CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም

VERSE 6
ፍቅር ነህ ካባትም በላይ
የሰማይ የምድር ሲሳይ።

CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም',
        lyrics_transliteration = 'CHORUS
Ene ante bet
Ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem

VERSE 1
Yemimeslh manm yelem.(2×)
Ts’elote bihon yeweret
Godelo bihon yene emnet
Barekegn enen kesemay

CHORUS
Ene ante bet
Ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem

VERSE 2
Bedel t’fatenm satay
Qebahegn t’ertehegn kedur
Set’ehegn kef yale menber
Saynoregn minm begonet

CHORUS
Ene ante bet
Ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem

VERSE 3
Barekegn enen bereket
Ene ante bet
Ene ante fit
Yemqom sew aydelehum

CHORUS
Ene ante bet
Ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem

VERSE 4
Gin fiqr neh lezelalem
Yemimeslh manm yelem.
Qalkidanhn akbari
Tamagn neh hulem meheri

CHORUS
Ene ante bet
Ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem

VERSE 5
Yemalkewnm mehala
Atresam atlm chla
Mekari dinq memhre
Lante new zema mezmure

CHORUS
Ene ante bet
Ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem

VERSE 6
Fiqr neh kabatm belay
Yesemay yemdr sisay.

CHORUS
Ene ante bet
Ene ante fit
Yemqom sew aydelehum
Gin fiqr neh lezelalem',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c4b79fd2-7433-44aa-994d-bcd6cc6cc7be'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም

VERSE 1
የሚመስልህ ማንም የለም።(2×)
ፀሎቴ ቢሆን የወረት
ጎደሎ ቢሆን የኔ እምነት
ባረከኝ እኔን ከሰማይ

CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም

VERSE 2
በደል ጥፋቴንም ሳታይ
ቀባኀኝ ጠርተኀኝ ከዱር
ሰጠኀኝ ከፍ ያለ መንበር
ሳይኖረኝ ምንም በጎነት

CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም

VERSE 3
ባረከኝ እኔን በረከት
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም

CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም

VERSE 4
ግን ፍቅር ነህ ለዘላለም
የሚመስልህ ማንም የለም።
ቃልኪዳንህን ኣክባሪ
ታማኝ ነህ ሁሌም መሀሪ

CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም

VERSE 5
የማልከውንም መኃላ
ኣትረሳም ኣትልም ችላ
መካሪ ድንቅ መምህሬ
ላንተ ነው ዜማ መዝሙሬ

CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም

VERSE 6
ፍቅር ነህ ካባትም በላይ
የሰማይ የምድር ሲሳይ።

CHORUS
እኔ ኣንተ ቤት
እኔ ኣንተ ፊት
የምቆም ሰው ኣይደለሁም
ግን ፍቅር ነህ ለዘላለም'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c4b79fd2-7433-44aa-994d-bcd6cc6cc7be'::uuid, 'ene-anite-bet', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- menale-betastemeregn ("Menale Betastemeregn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '1774a543-b14a-478c-8273-63e2f2a70492'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ለመቆም እንድችል ልቤ ሳይረታ',
        lyrics_transliteration = 'CHORUS
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
Lemeqom endchl libe sayreta',
        updated_at = clock_timestamp()::text
    WHERE import_id = '1774a543-b14a-478c-8273-63e2f2a70492'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '1774a543-b14a-478c-8273-63e2f2a70492'::uuid, 'menale-betastemeregn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bete-christianen-antewum-zemarit-fasika ("Bete Christianen Antewum' Zemarit Fasika")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '177a2735-d296-447f-bf6d-31f3042cd5a1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 1
ሁሉንም በሁሉ በሚሞላው ጌታ
ሙሽራው የሆነች ቤቱ ተሰኝታ
በክብር በሞገስ በጸጋ ተሞልታ
ደምቃ ትኖራለች ለዓለም አብርታ(፪)

CHORUS
ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 2
ዲያቢሎስ ቢጨርስ ቀስቶቹን በሙሉ
ወጥመድ ቢዘረጋ በጉዟችን ሁሉ
እንሻገራለን የአምላክን ስም ጠርተን
አንዳች አይነካንም እርሱን ተጠግተን(፪)

CHORUS
ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 3
በስሙ መሰብሰብ በስሙ መስራት
ስለ ስሙ መኖር ለስሙ መሞት
ጠላት ዲያቢሎስን ምን ባያስደስትም
ይህ ነው ክርስትና ይሄ ነው ህይወት(፪)

CHORUS
ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 4
ከትውልድ ለትውልድ የምናስረክበው
ለልጅ ልጅ አውርሰን ደስ የምንሰኘው
አይደል ብርና ወርቅ አይደል ሌላ ሀብት
ሐማኖታችን ነው የኛ እርስት ጉልት(፪)

CHORUS
ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bete kirstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 1
Hulunm behulu bemimolaw Geta
Mushraw yehonech betu tesegnta
Bekbr bemoges bets’ega temolta
Demqa tinoralech lealem abrta (2)

CHORUS
Bete kirstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 2
Diyabilos bich’ers qestochun bemulu
Wet’med bizerega beguzwachn hulu
Enshageralen yeamlakn sim t’erten
Andach aynekanm ersun tet’egten (2)

CHORUS
Bete kirstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 3
Besmu mesebseb besmu mesrat
Sile simu menor lesmu memot
T’elat diyabilosn min bayasdestm
Yih new kirstna yihe new hiywet (2)

CHORUS
Bete kirstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 4
Ketwld letwld yemnasrekbew
Lelj lij awrsen des yemnsegnew
Aydel birna werq aydel lela hebt
Hemanotachn new yegna erst gult (2)

CHORUS
Bete kirstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 1
ሁሉንም በሁሉ በሚሞላው ጌታ
ሙሽራው የሆነች ቤቱ ተሰኝታ
በክብር በሞገስ በጸጋ ተሞልታ
ደምቃ ትኖራለች ለዓለም አብርታ(፪)

CHORUS
ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 2
ዲያቢሎስ ቢጨርስ ቀስቶቹን በሙሉ
ወጥመድ ቢዘረጋ በጉዟችን ሁሉ
እንሻገራለን የአምላክን ስም ጠርተን
አንዳች አይነካንም እርሱን ተጠግተን(፪)

CHORUS
ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 3
በስሙ መሰብሰብ በስሙ መስራት
ስለ ስሙ መኖር ለስሙ መሞት
ጠላት ዲያቢሎስን ምን ባያስደስትም
ይህ ነው ክርስትና ይሄ ነው ህይወት(፪)

CHORUS
ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 4
ከትውልድ ለትውልድ የምናስረክበው
ለልጅ ልጅ አውርሰን ደስ የምንሰኘው
አይደል ብርና ወርቅ አይደል ሌላ ሀብት
ሐማኖታችን ነው የኛ እርስት ጉልት(፪)

CHORUS
ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ',
        lyrics_transliteration = 'CHORUS
Bete kirstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 1
Hulunm behulu bemimolaw Geta
Mushraw yehonech betu tesegnta
Bekbr bemoges bets’ega temolta
Demqa tinoralech lealem abrta (2)

CHORUS
Bete kirstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 2
Diyabilos bich’ers qestochun bemulu
Wet’med bizerega beguzwachn hulu
Enshageralen yeamlakn sim t’erten
Andach aynekanm ersun tet’egten (2)

CHORUS
Bete kirstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 3
Besmu mesebseb besmu mesrat
Sile simu menor lesmu memot
T’elat diyabilosn min bayasdestm
Yih new kirstna yihe new hiywet (2)

CHORUS
Bete kirstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 4
Ketwld letwld yemnasrekbew
Lelj lij awrsen des yemnsegnew
Aydel birna werq aydel lela hebt
Hemanotachn new yegna erst gult (2)

CHORUS
Bete kirstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto',
        updated_at = clock_timestamp()::text
    WHERE import_id = '177a2735-d296-447f-bf6d-31f3042cd5a1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 1
ሁሉንም በሁሉ በሚሞላው ጌታ
ሙሽራው የሆነች ቤቱ ተሰኝታ
በክብር በሞገስ በጸጋ ተሞልታ
ደምቃ ትኖራለች ለዓለም አብርታ(፪)

CHORUS
ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 2
ዲያቢሎስ ቢጨርስ ቀስቶቹን በሙሉ
ወጥመድ ቢዘረጋ በጉዟችን ሁሉ
እንሻገራለን የአምላክን ስም ጠርተን
አንዳች አይነካንም እርሱን ተጠግተን(፪)

CHORUS
ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 3
በስሙ መሰብሰብ በስሙ መስራት
ስለ ስሙ መኖር ለስሙ መሞት
ጠላት ዲያቢሎስን ምን ባያስደስትም
ይህ ነው ክርስትና ይሄ ነው ህይወት(፪)

CHORUS
ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 4
ከትውልድ ለትውልድ የምናስረክበው
ለልጅ ልጅ አውርሰን ደስ የምንሰኘው
አይደል ብርና ወርቅ አይደል ሌላ ሀብት
ሐማኖታችን ነው የኛ እርስት ጉልት(፪)

CHORUS
ቤተ ክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '177a2735-d296-447f-bf6d-31f3042cd5a1'::uuid, 'bete-christianen-antewum-zemarit-fasika', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- cherinetih-bizu-mihiretih-bizu ("Cherinetih Bizu Mihiretih Bizu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '2db7d034-6b1f-4a25-a175-885065a46d14'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ

VERSE 1
አስራኤል ወደቀ እስራኤል ተነሳ2x
መንገዱ አልቀናውም አምላኩን ቢረሳ2x
የያዕቆብ አምላክ እግዚአብሔርን ይዞ2x
ምን እንዳተረፈ አውቆታል በጉዞ2x

CHORUS
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ

VERSE 2
መንገዱ አይታክትም ጎዳናዉ የቀና2x
እግዚአብሔር በፊትም ከኋላሞ አለና2x
እርሱ በሌለበት ቢመችም መንገዱ2x
አቅጣጫው ወደ ሞት አይቀርም መውሰዱ2x

CHORUS
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ

VERSE 3
በመንገዱ ዝለን ወድቀን መች ቀርተናል2x
የያዕቆብ አምላክ ደግፎ አንስቶናል2x
እግዚአብሔር ሲጠራን በቀደመው መንገድ2x
ጉዞአችን ወዴት ነው በሞት ለመወሰድ2x

CHORUS
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ

VERSE 4
አምላክ ሆይ ፍቅርህን በልባችን ሳለው2x
እስከሞት በመስቀል የወደደን ማነው2x
በበረሃዉ ጽናት ሲጸናብን ርሀቡ2x
በረከት ሞላኸን ተረፈልን ምግቡ2x

CHORUS
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq newu leegna ante neh melkam eregna

VERSE 1
Asrael wedeqe esrael tenesa2x
Mengedu alqenawm amlakun biresa2x
Yeyaeqob amlak Egziabhern yizo2x
Min endaterefe awqotal beguzo2x

CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq newu leegna ante neh melkam eregna

VERSE 2
Mengedu aytaktm godanawu yeqena2x
Egziabher befitm kehwalamo alena2x
Ersu belelebet bimechm mengedu2x
Aqt’ach’aw wede mot ayqerm mewsedu2x

CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq newu leegna ante neh melkam eregna

VERSE 3
Bemengedu zilen wedqen mech qertenal2x
Yeyaeqob amlak degfo anstonal2x
Egziabher sit’eran beqedemew menged2x
Guzoachn wedet new bemot lemewesed2x

CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq newu leegna ante neh melkam eregna

VERSE 4
Amlak hoy fiqrhn belbachn salew2x
Eskemot bemesqel yewededen manew2x
Beberehawu ts’nat sits’enabn rihebu2x
Bereket molaኸn terefeln migbu2x

CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq newu leegna ante neh melkam eregna'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ

VERSE 1
አስራኤል ወደቀ እስራኤል ተነሳ2x
መንገዱ አልቀናውም አምላኩን ቢረሳ2x
የያዕቆብ አምላክ እግዚአብሔርን ይዞ2x
ምን እንዳተረፈ አውቆታል በጉዞ2x

CHORUS
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ

VERSE 2
መንገዱ አይታክትም ጎዳናዉ የቀና2x
እግዚአብሔር በፊትም ከኋላሞ አለና2x
እርሱ በሌለበት ቢመችም መንገዱ2x
አቅጣጫው ወደ ሞት አይቀርም መውሰዱ2x

CHORUS
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ

VERSE 3
በመንገዱ ዝለን ወድቀን መች ቀርተናል2x
የያዕቆብ አምላክ ደግፎ አንስቶናል2x
እግዚአብሔር ሲጠራን በቀደመው መንገድ2x
ጉዞአችን ወዴት ነው በሞት ለመወሰድ2x

CHORUS
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ

VERSE 4
አምላክ ሆይ ፍቅርህን በልባችን ሳለው2x
እስከሞት በመስቀል የወደደን ማነው2x
በበረሃዉ ጽናት ሲጸናብን ርሀቡ2x
በረከት ሞላኸን ተረፈልን ምግቡ2x

CHORUS
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ',
        lyrics_transliteration = 'CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq newu leegna ante neh melkam eregna

VERSE 1
Asrael wedeqe esrael tenesa2x
Mengedu alqenawm amlakun biresa2x
Yeyaeqob amlak Egziabhern yizo2x
Min endaterefe awqotal beguzo2x

CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq newu leegna ante neh melkam eregna

VERSE 2
Mengedu aytaktm godanawu yeqena2x
Egziabher befitm kehwalamo alena2x
Ersu belelebet bimechm mengedu2x
Aqt’ach’aw wede mot ayqerm mewsedu2x

CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq newu leegna ante neh melkam eregna

VERSE 3
Bemengedu zilen wedqen mech qertenal2x
Yeyaeqob amlak degfo anstonal2x
Egziabher sit’eran beqedemew menged2x
Guzoachn wedet new bemot lemewesed2x

CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq newu leegna ante neh melkam eregna

VERSE 4
Amlak hoy fiqrhn belbachn salew2x
Eskemot bemesqel yewededen manew2x
Beberehawu ts’nat sits’enabn rihebu2x
Bereket molaኸn terefeln migbu2x

CHORUS
Cherneth bizu mihreth bizu
Beguzwachn erdan t’ebab new mengedu
Dinq new amlak hoy fiqrh leegna
Dinq newu leegna ante neh melkam eregna',
        updated_at = clock_timestamp()::text
    WHERE import_id = '2db7d034-6b1f-4a25-a175-885065a46d14'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ

VERSE 1
አስራኤል ወደቀ እስራኤል ተነሳ2x
መንገዱ አልቀናውም አምላኩን ቢረሳ2x
የያዕቆብ አምላክ እግዚአብሔርን ይዞ2x
ምን እንዳተረፈ አውቆታል በጉዞ2x

CHORUS
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ

VERSE 2
መንገዱ አይታክትም ጎዳናዉ የቀና2x
እግዚአብሔር በፊትም ከኋላሞ አለና2x
እርሱ በሌለበት ቢመችም መንገዱ2x
አቅጣጫው ወደ ሞት አይቀርም መውሰዱ2x

CHORUS
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ

VERSE 3
በመንገዱ ዝለን ወድቀን መች ቀርተናል2x
የያዕቆብ አምላክ ደግፎ አንስቶናል2x
እግዚአብሔር ሲጠራን በቀደመው መንገድ2x
ጉዞአችን ወዴት ነው በሞት ለመወሰድ2x

CHORUS
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ

VERSE 4
አምላክ ሆይ ፍቅርህን በልባችን ሳለው2x
እስከሞት በመስቀል የወደደን ማነው2x
በበረሃዉ ጽናት ሲጸናብን ርሀቡ2x
በረከት ሞላኸን ተረፈልን ምግቡ2x

CHORUS
ቸርነትህ ብዙ ምሕረትህ ብዙ
በጉዟችን እርዳን ጠባብ ነው መንገዱ
ድንቅ ነው አምላክ ሆይ ፍቅርህ ለእኛ
ድንቅ ነዉ ለእኛ አንተ ነህ መልካም እረኛ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '2db7d034-6b1f-4a25-a175-885065a46d14'::uuid, 'cherinetih-bizu-mihiretih-bizu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- manew-befikiru-yalitelewete-3442 ("Manew Befikiru Yalitelewete")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7bd81dad-7be6-40de-973e-77ea1b28cd32'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ምስጋና ለስሙ',
        lyrics_transliteration = 'CHORUS
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
Misgana lesmu',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7bd81dad-7be6-40de-973e-77ea1b28cd32'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7bd81dad-7be6-40de-973e-77ea1b28cd32'::uuid, 'manew-befikiru-yalitelewete-3442', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kemelaket-gar ("KeMelaket Gar")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f1d8d415-f0ad-4f91-bbf7-b97c88287bcd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከመላእክት ጋራ ሲገለጥ በሰማይ
ጸንተን እንጠብቀው ክብሩን ሁሉ እንድናይ
በግርማ ሲመጣ በአስደንጋጭ ሁኔታ
ወዮልሽ ነፍሴ ሆይ ወየው የዛን ለታ

VERSE 1
ኧኸ ምስጋና ይድረስህ ሁል ጊዜ ጧት ማታ
ሃሌ ሃሌ ሉያ የሠራዊት ጌታ /2/

CHORUS
ከመላእክት ጋራ ሲገለጥ በሰማይ
ጸንተን እንጠብቀው ክብሩን ሁሉ እንድናይ
በግርማ ሲመጣ በአስደንጋጭ ሁኔታ
ወዮልሽ ነፍሴ ሆይ ወየው የዛን ለታ

VERSE 2
ሰማይና ምድር ከፊቱ ሲሸሹ
መግቢያ አጥቶ ይጮሃል ትልቁም ትንሹ
ጻድቃን ሲደሰቱ የኃጥአን ፈንታ
ሆኖ ጠበቃቸው ለቅሶና ዋይታ

CHORUS
ከመላእክት ጋራ ሲገለጥ በሰማይ
ጸንተን እንጠብቀው ክብሩን ሁሉ እንድናይ
በግርማ ሲመጣ በአስደንጋጭ ሁኔታ
ወዮልሽ ነፍሴ ሆይ ወየው የዛን ለታ

VERSE 3
ስለማይታወቅ አምላክ አመጣጥህ
በመንፈስህ አጽናን ጸንተን እንጠብቅህ
ጠላት እንዳይገዛን በመንግሥት ቦታ
እግዚኦ ሰውረን ከመሰውር ጌታ

CHORUS
ከመላእክት ጋራ ሲገለጥ በሰማይ
ጸንተን እንጠብቀው ክብሩን ሁሉ እንድናይ
በግርማ ሲመጣ በአስደንጋጭ ሁኔታ
ወዮልሽ ነፍሴ ሆይ ወየው የዛን ለታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
KeMelaket Gar Sigelet Besemay
Tsenten Entebekew Kibrun Hulu Endenay
Begirma Simeta Beasdengach Huneta
Weyolish Nefse Hoy Weyo Yezan Leta

VERSE 1
Ehe Misgana Yidreshe Hulgize Tewat Mata
Hale Haleluya Yeserawit Geta /2/

CHORUS
KeMelaket Gar Sigelet Besemay
Tsenten Entebekew Kibrun Hulu Endenay
Begirma Simeta Beasdengach Huneta
Weyolish Nefse Hoy Weyo Yezan Leta

VERSE 2
Semaye ena Mider Kefitu Sisheshu
Megbya Ateto Yechohal Tilekum Tinishu
Tsadekan Sidesetu Yehatan Fanta
Hono Tebekachew Leksona Wayta

CHORUS
KeMelaket Gar Sigelet Besemay
Tsenten Entebekew Kibrun Hulu Endenay
Begirma Simeta Beasdengach Huneta
Weyolish Nefse Hoy Weyo Yezan Leta

VERSE 3
Silemaytawek Amlak Ametatehe
Bemenfeshe Atsenane Tsenten Entebekehe
Telat Endaygezan Bemengist Bota
Egzio Seweren Kemsewer Geta

CHORUS
KeMelaket Gar Sigelet Besemay
Tsenten Entebekew Kibrun Hulu Endenay
Begirma Simeta Beasdengach Huneta
Weyolish Nefse Hoy Weyo Yezan Leta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ከመላእክት ጋራ ሲገለጥ በሰማይ
ጸንተን እንጠብቀው ክብሩን ሁሉ እንድናይ
በግርማ ሲመጣ በአስደንጋጭ ሁኔታ
ወዮልሽ ነፍሴ ሆይ ወየው የዛን ለታ

VERSE 1
ኧኸ ምስጋና ይድረስህ ሁል ጊዜ ጧት ማታ
ሃሌ ሃሌ ሉያ የሠራዊት ጌታ /2/

CHORUS
ከመላእክት ጋራ ሲገለጥ በሰማይ
ጸንተን እንጠብቀው ክብሩን ሁሉ እንድናይ
በግርማ ሲመጣ በአስደንጋጭ ሁኔታ
ወዮልሽ ነፍሴ ሆይ ወየው የዛን ለታ

VERSE 2
ሰማይና ምድር ከፊቱ ሲሸሹ
መግቢያ አጥቶ ይጮሃል ትልቁም ትንሹ
ጻድቃን ሲደሰቱ የኃጥአን ፈንታ
ሆኖ ጠበቃቸው ለቅሶና ዋይታ

CHORUS
ከመላእክት ጋራ ሲገለጥ በሰማይ
ጸንተን እንጠብቀው ክብሩን ሁሉ እንድናይ
በግርማ ሲመጣ በአስደንጋጭ ሁኔታ
ወዮልሽ ነፍሴ ሆይ ወየው የዛን ለታ

VERSE 3
ስለማይታወቅ አምላክ አመጣጥህ
በመንፈስህ አጽናን ጸንተን እንጠብቅህ
ጠላት እንዳይገዛን በመንግሥት ቦታ
እግዚኦ ሰውረን ከመሰውር ጌታ

CHORUS
ከመላእክት ጋራ ሲገለጥ በሰማይ
ጸንተን እንጠብቀው ክብሩን ሁሉ እንድናይ
በግርማ ሲመጣ በአስደንጋጭ ሁኔታ
ወዮልሽ ነፍሴ ሆይ ወየው የዛን ለታ',
        lyrics_transliteration = 'CHORUS
KeMelaket Gar Sigelet Besemay
Tsenten Entebekew Kibrun Hulu Endenay
Begirma Simeta Beasdengach Huneta
Weyolish Nefse Hoy Weyo Yezan Leta

VERSE 1
Ehe Misgana Yidreshe Hulgize Tewat Mata
Hale Haleluya Yeserawit Geta /2/

CHORUS
KeMelaket Gar Sigelet Besemay
Tsenten Entebekew Kibrun Hulu Endenay
Begirma Simeta Beasdengach Huneta
Weyolish Nefse Hoy Weyo Yezan Leta

VERSE 2
Semaye ena Mider Kefitu Sisheshu
Megbya Ateto Yechohal Tilekum Tinishu
Tsadekan Sidesetu Yehatan Fanta
Hono Tebekachew Leksona Wayta

CHORUS
KeMelaket Gar Sigelet Besemay
Tsenten Entebekew Kibrun Hulu Endenay
Begirma Simeta Beasdengach Huneta
Weyolish Nefse Hoy Weyo Yezan Leta

VERSE 3
Silemaytawek Amlak Ametatehe
Bemenfeshe Atsenane Tsenten Entebekehe
Telat Endaygezan Bemengist Bota
Egzio Seweren Kemsewer Geta

CHORUS
KeMelaket Gar Sigelet Besemay
Tsenten Entebekew Kibrun Hulu Endenay
Begirma Simeta Beasdengach Huneta
Weyolish Nefse Hoy Weyo Yezan Leta',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f1d8d415-f0ad-4f91-bbf7-b97c88287bcd'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከመላእክት ጋራ ሲገለጥ በሰማይ
ጸንተን እንጠብቀው ክብሩን ሁሉ እንድናይ
በግርማ ሲመጣ በአስደንጋጭ ሁኔታ
ወዮልሽ ነፍሴ ሆይ ወየው የዛን ለታ

VERSE 1
ኧኸ ምስጋና ይድረስህ ሁል ጊዜ ጧት ማታ
ሃሌ ሃሌ ሉያ የሠራዊት ጌታ /2/

CHORUS
ከመላእክት ጋራ ሲገለጥ በሰማይ
ጸንተን እንጠብቀው ክብሩን ሁሉ እንድናይ
በግርማ ሲመጣ በአስደንጋጭ ሁኔታ
ወዮልሽ ነፍሴ ሆይ ወየው የዛን ለታ

VERSE 2
ሰማይና ምድር ከፊቱ ሲሸሹ
መግቢያ አጥቶ ይጮሃል ትልቁም ትንሹ
ጻድቃን ሲደሰቱ የኃጥአን ፈንታ
ሆኖ ጠበቃቸው ለቅሶና ዋይታ

CHORUS
ከመላእክት ጋራ ሲገለጥ በሰማይ
ጸንተን እንጠብቀው ክብሩን ሁሉ እንድናይ
በግርማ ሲመጣ በአስደንጋጭ ሁኔታ
ወዮልሽ ነፍሴ ሆይ ወየው የዛን ለታ

VERSE 3
ስለማይታወቅ አምላክ አመጣጥህ
በመንፈስህ አጽናን ጸንተን እንጠብቅህ
ጠላት እንዳይገዛን በመንግሥት ቦታ
እግዚኦ ሰውረን ከመሰውር ጌታ

CHORUS
ከመላእክት ጋራ ሲገለጥ በሰማይ
ጸንተን እንጠብቀው ክብሩን ሁሉ እንድናይ
በግርማ ሲመጣ በአስደንጋጭ ሁኔታ
ወዮልሽ ነፍሴ ሆይ ወየው የዛን ለታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
KeMelaket Gar Sigelet Besemay
Tsenten Entebekew Kibrun Hulu Endenay
Begirma Simeta Beasdengach Huneta
Weyolish Nefse Hoy Weyo Yezan Leta

VERSE 1
Ehe Misgana Yidreshe Hulgize Tewat Mata
Hale Haleluya Yeserawit Geta /2/

CHORUS
KeMelaket Gar Sigelet Besemay
Tsenten Entebekew Kibrun Hulu Endenay
Begirma Simeta Beasdengach Huneta
Weyolish Nefse Hoy Weyo Yezan Leta

VERSE 2
Semaye ena Mider Kefitu Sisheshu
Megbya Ateto Yechohal Tilekum Tinishu
Tsadekan Sidesetu Yehatan Fanta
Hono Tebekachew Leksona Wayta

CHORUS
KeMelaket Gar Sigelet Besemay
Tsenten Entebekew Kibrun Hulu Endenay
Begirma Simeta Beasdengach Huneta
Weyolish Nefse Hoy Weyo Yezan Leta

VERSE 3
Silemaytawek Amlak Ametatehe
Bemenfeshe Atsenane Tsenten Entebekehe
Telat Endaygezan Bemengist Bota
Egzio Seweren Kemsewer Geta

CHORUS
KeMelaket Gar Sigelet Besemay
Tsenten Entebekew Kibrun Hulu Endenay
Begirma Simeta Beasdengach Huneta
Weyolish Nefse Hoy Weyo Yezan Leta';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f1d8d415-f0ad-4f91-bbf7-b97c88287bcd'::uuid, 'kemelaket-gar', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
