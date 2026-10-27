-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 28 OF 32
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
  -- ebakeh-wedet-neh ("Ebakeh Wedet Neh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a787363e-6ac5-4985-ade5-e9e631c60a81'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 1
ይልሃል እግዚአብሔር እባክህ ወዴት ነህ

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 2
ከዓለም ጉያ ውስጥ ሽብር ከተሞላው
ከስንጥቅ አለቶች ጎድጓዳ ከሆነው
የአራዊቱ ግርማ የአንበሶቹ ግሳት
የጨለማው ክብደት የፍጥረት ማዛጋት

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 3
ከእንዲህ ያለ ስፍራ ተወርውረህ ነወይ
ቀናት ተቆጠሩ አይኖችህን ሳላይ

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 4
ከቅዳሴ የወጣ ምስጋና ስቀበል
ጎላ ያለው ድምጽህ ተሰውሮብኛል

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 5
በቅድስቱ በኩል በምትቆምበት በቅዳሴ ጊዜ
አይኖቼ ስላጡ ፈልገው ፈልገው ይዞኛል ትካዜ

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 6
ልጄ ምን በደልኩህ ምን አጎደልኩብህ
ትተኸኝ የሄድከው እንደዛ ስወድህ

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 7
ዘወትር ፊትህን ሳየው ደስ እያለኝ
ደስታዬን በሀዘን ምነው ለወጥክብኝ

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 1
Yilhál Egziabher ebakeh wedet neh

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 2
Ke’alam guya wist shibir ketemolaw
Kesinit’ik aletotch godgwada kehonaw
Ye’arawitu girma ye’anbesoch gisat
Yechelemáw kibdet yefit’ret mazagat

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 3
Ke’endih yale sifra tewerweréh newey
Qenat teqot’aru aynochih salay

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 4
Keqiddase yeweta misgana siqebel
Gola yalew dimtsih tesewrobnial

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 5
Beqiddistu bekul bemit’qomibet beqiddase gize
Aynoché silatu felgew felgew yizognal tikazé

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 6
Lijé min bedelkuh min agodelkubeh
Titehény yehedkew endezá siwedéh

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 7
Zawitir fitih sayew des eyalégn
Destayen behazen menew lewet’kebign

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 1
ይልሃል እግዚአብሔር እባክህ ወዴት ነህ

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 2
ከዓለም ጉያ ውስጥ ሽብር ከተሞላው
ከስንጥቅ አለቶች ጎድጓዳ ከሆነው
የአራዊቱ ግርማ የአንበሶቹ ግሳት
የጨለማው ክብደት የፍጥረት ማዛጋት

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 3
ከእንዲህ ያለ ስፍራ ተወርውረህ ነወይ
ቀናት ተቆጠሩ አይኖችህን ሳላይ

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 4
ከቅዳሴ የወጣ ምስጋና ስቀበል
ጎላ ያለው ድምጽህ ተሰውሮብኛል

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 5
በቅድስቱ በኩል በምትቆምበት በቅዳሴ ጊዜ
አይኖቼ ስላጡ ፈልገው ፈልገው ይዞኛል ትካዜ

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 6
ልጄ ምን በደልኩህ ምን አጎደልኩብህ
ትተኸኝ የሄድከው እንደዛ ስወድህ

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 7
ዘወትር ፊትህን ሳየው ደስ እያለኝ
ደስታዬን በሀዘን ምነው ለወጥክብኝ

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ',
        lyrics_transliteration = 'CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 1
Yilhál Egziabher ebakeh wedet neh

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 2
Ke’alam guya wist shibir ketemolaw
Kesinit’ik aletotch godgwada kehonaw
Ye’arawitu girma ye’anbesoch gisat
Yechelemáw kibdet yefit’ret mazagat

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 3
Ke’endih yale sifra tewerweréh newey
Qenat teqot’aru aynochih salay

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 4
Keqiddase yeweta misgana siqebel
Gola yalew dimtsih tesewrobnial

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 5
Beqiddistu bekul bemit’qomibet beqiddase gize
Aynoché silatu felgew felgew yizognal tikazé

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 6
Lijé min bedelkuh min agodelkubeh
Titehény yehedkew endezá siwedéh

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 7
Zawitir fitih sayew des eyalégn
Destayen behazen menew lewet’kebign

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a787363e-6ac5-4985-ade5-e9e631c60a81'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 1
ይልሃል እግዚአብሔር እባክህ ወዴት ነህ

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 2
ከዓለም ጉያ ውስጥ ሽብር ከተሞላው
ከስንጥቅ አለቶች ጎድጓዳ ከሆነው
የአራዊቱ ግርማ የአንበሶቹ ግሳት
የጨለማው ክብደት የፍጥረት ማዛጋት

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 3
ከእንዲህ ያለ ስፍራ ተወርውረህ ነወይ
ቀናት ተቆጠሩ አይኖችህን ሳላይ

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 4
ከቅዳሴ የወጣ ምስጋና ስቀበል
ጎላ ያለው ድምጽህ ተሰውሮብኛል

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 5
በቅድስቱ በኩል በምትቆምበት በቅዳሴ ጊዜ
አይኖቼ ስላጡ ፈልገው ፈልገው ይዞኛል ትካዜ

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 6
ልጄ ምን በደልኩህ ምን አጎደልኩብህ
ትተኸኝ የሄድከው እንደዛ ስወድህ

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ

VERSE 7
ዘወትር ፊትህን ሳየው ደስ እያለኝ
ደስታዬን በሀዘን ምነው ለወጥክብኝ

CHORUS
ለመዳኑ ህይወት ለጽድቁ ጠርቼህ
ከዓለም ለይቼ በፍቅሬ መርጬህ
በረከትና ፍቅር ሰላሜን ወርውረህ
ልጁ የምወድህ እባክህ ወዴት ነህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 1
Yilhál Egziabher ebakeh wedet neh

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 2
Ke’alam guya wist shibir ketemolaw
Kesinit’ik aletotch godgwada kehonaw
Ye’arawitu girma ye’anbesoch gisat
Yechelemáw kibdet yefit’ret mazagat

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 3
Ke’endih yale sifra tewerweréh newey
Qenat teqot’aru aynochih salay

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 4
Keqiddase yeweta misgana siqebel
Gola yalew dimtsih tesewrobnial

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 5
Beqiddistu bekul bemit’qomibet beqiddase gize
Aynoché silatu felgew felgew yizognal tikazé

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 6
Lijé min bedelkuh min agodelkubeh
Titehény yehedkew endezá siwedéh

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh

VERSE 7
Zawitir fitih sayew des eyalégn
Destayen behazen menew lewet’kebign

CHORUS
Lemedanu hiywet letsidku t’archéh
Ke’alam leyiché befiqré merchéh
Bereketna fiqir selamen werweréh
Lijé yemwedéh ebakeh wedet neh';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a787363e-6ac5-4985-ade5-e9e631c60a81'::uuid, 'ebakeh-wedet-neh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tadinegn-zenid ("Tadinegn Zenid")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'aabe36fe-df1a-44cf-8258-7cbeb35691f0'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አቤቱ ታድነኝ ዘንድ ውደድ፥
አቤቱ ታድነኝ ዘንድ ፍቀድ፥
ከክፉዎች ምክር ወጥመድ፥
አቤቱ ታድነኝ ዘንድ ውደድ።

VERSE 1
ይሁን ስትል ሆኑ ፣ አዘዝህ ተፈጠሩ፥
በቃልህ ጸንተዋል ምድርና ጠፈሩ፥
ልክ እንደ መፃጉዕ ዳን ያልከው ይድናል፥
በአቅሌስያ ሳይዳ ፍጥረት ደጅ ይጠናል።

CHORUS
አቤቱ ታድነኝ ዘንድ ውደድ፥
አቤቱ ታድነኝ ዘንድ ፍቀድ፥
ከክፉዎች ምክር ወጥመድ፥
አቤቱ ታድነኝ ዘንድ ውደድ።

VERSE 2
ሐዋርያት በታንኳው አድነን እንዳሉ፥
በቃለ ተግሣፅህ ጸጥ እንዲል ማዕበሉ፥
ሞገድ ጾር ተነሥቷል በባሕረ ሥጋዬ፥
ኀድፈኒ ክርስቶስ ሊቀ ሐመርየ፥

CHORUS
አቤቱ ታድነኝ ዘንድ ውደድ፥
አቤቱ ታድነኝ ዘንድ ፍቀድ፥
ከክፉዎች ምክር ወጥመድ፥
አቤቱ ታድነኝ ዘንድ ውደድ።

VERSE 3
አድነኝ አምላኬ አድነኝ ጌታዬ።
ለሞት በተሰጠ ጎስቋላ ሰውነት፥
የማልወደውን ነው የማደርገው በእውነት።
ከሲኦል ከሰዶም ከዓለመ መዓቱ፥

CHORUS
አቤቱ ታድነኝ ዘንድ ውደድ፥
አቤቱ ታድነኝ ዘንድ ፍቀድ፥
ከክፉዎች ምክር ወጥመድ፥
አቤቱ ታድነኝ ዘንድ ውደድ።

VERSE 4
ያውጡኝ እጄን ይዘው እንደ ሎጥ መላእክቱ።
የነፍስ እድፍ ማጠብ ልምዱ ነው የኤልሻዳይ፥
ቢቀላ እንደ አለላ ይነጣል ከአመዳይ፥
በሁሶኘም ይርጨኝ ያንጻኝ ከበረዶ፥

CHORUS
አቤቱ ታድነኝ ዘንድ ውደድ፥
አቤቱ ታድነኝ ዘንድ ፍቀድ፥
ከክፉዎች ምክር ወጥመድ፥
አቤቱ ታድነኝ ዘንድ ውደድ።

VERSE 5
ቸር ወመስተሣህል ድኅነቴን ወዶ።

CHORUS
አቤቱ ታድነኝ ዘንድ ውደድ፥
አቤቱ ታድነኝ ዘንድ ፍቀድ፥
ከክፉዎች ምክር ወጥመድ፥
አቤቱ ታድነኝ ዘንድ ውደድ።'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Abetu tadnegn zend wided:
Abetu tadnegn zend fiqed:
Kekfuwoch mikr wet’med:
Abetu tadnegn zend wided.

VERSE 1
Yihun sitl honu , azezh tefet’eru:
Beqalh ts’entewal midrna t’eferu:
Lik ende mets’ague dan yalkew yidnal:
Beaqlesya sayda fit’ret dej yit’enal.

CHORUS
Abetu tadnegn zend wided:
Abetu tadnegn zend fiqed:
Kekfuwoch mikr wet’med:
Abetu tadnegn zend wided.

VERSE 2
Hewaryat betankwaw adnen endalu:
Beqale tegsats’h ts’et’ endil maebelu:
Moged ts’or tenestwal bebahre sigaye:
Hedfeni Kristos liqe hemerye:

CHORUS
Abetu tadnegn zend wided:
Abetu tadnegn zend fiqed:
Kekfuwoch mikr wet’med:
Abetu tadnegn zend wided.

VERSE 3
Adnegn amlake adnegn getaye.
Lemot beteset’e gosqwala sewnet:
Yemalwedewn new yemadergew beewnet.
Kesiol kesedom kealeme meatu:

CHORUS
Abetu tadnegn zend wided:
Abetu tadnegn zend fiqed:
Kekfuwoch mikr wet’med:
Abetu tadnegn zend wided.

VERSE 4
Yawt’ugn ejen yizew ende lot’ melaektu.
Yenefs edf mat’eb limdu new yeelshaday:
Biqela ende alela yinet’al keameday:
Behusognem yirch’egn yants’agn keberedo:

CHORUS
Abetu tadnegn zend wided:
Abetu tadnegn zend fiqed:
Kekfuwoch mikr wet’med:
Abetu tadnegn zend wided.

VERSE 5
Cher wemestesahl dihneten wedo.

CHORUS
Abetu tadnegn zend wided:
Abetu tadnegn zend fiqed:
Kekfuwoch mikr wet’med:
Abetu tadnegn zend wided.'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አቤቱ ታድነኝ ዘንድ ውደድ፥
አቤቱ ታድነኝ ዘንድ ፍቀድ፥
ከክፉዎች ምክር ወጥመድ፥
አቤቱ ታድነኝ ዘንድ ውደድ።

VERSE 1
ይሁን ስትል ሆኑ ፣ አዘዝህ ተፈጠሩ፥
በቃልህ ጸንተዋል ምድርና ጠፈሩ፥
ልክ እንደ መፃጉዕ ዳን ያልከው ይድናል፥
በአቅሌስያ ሳይዳ ፍጥረት ደጅ ይጠናል።

CHORUS
አቤቱ ታድነኝ ዘንድ ውደድ፥
አቤቱ ታድነኝ ዘንድ ፍቀድ፥
ከክፉዎች ምክር ወጥመድ፥
አቤቱ ታድነኝ ዘንድ ውደድ።

VERSE 2
ሐዋርያት በታንኳው አድነን እንዳሉ፥
በቃለ ተግሣፅህ ጸጥ እንዲል ማዕበሉ፥
ሞገድ ጾር ተነሥቷል በባሕረ ሥጋዬ፥
ኀድፈኒ ክርስቶስ ሊቀ ሐመርየ፥

CHORUS
አቤቱ ታድነኝ ዘንድ ውደድ፥
አቤቱ ታድነኝ ዘንድ ፍቀድ፥
ከክፉዎች ምክር ወጥመድ፥
አቤቱ ታድነኝ ዘንድ ውደድ።

VERSE 3
አድነኝ አምላኬ አድነኝ ጌታዬ።
ለሞት በተሰጠ ጎስቋላ ሰውነት፥
የማልወደውን ነው የማደርገው በእውነት።
ከሲኦል ከሰዶም ከዓለመ መዓቱ፥

CHORUS
አቤቱ ታድነኝ ዘንድ ውደድ፥
አቤቱ ታድነኝ ዘንድ ፍቀድ፥
ከክፉዎች ምክር ወጥመድ፥
አቤቱ ታድነኝ ዘንድ ውደድ።

VERSE 4
ያውጡኝ እጄን ይዘው እንደ ሎጥ መላእክቱ።
የነፍስ እድፍ ማጠብ ልምዱ ነው የኤልሻዳይ፥
ቢቀላ እንደ አለላ ይነጣል ከአመዳይ፥
በሁሶኘም ይርጨኝ ያንጻኝ ከበረዶ፥

CHORUS
አቤቱ ታድነኝ ዘንድ ውደድ፥
አቤቱ ታድነኝ ዘንድ ፍቀድ፥
ከክፉዎች ምክር ወጥመድ፥
አቤቱ ታድነኝ ዘንድ ውደድ።

VERSE 5
ቸር ወመስተሣህል ድኅነቴን ወዶ።

CHORUS
አቤቱ ታድነኝ ዘንድ ውደድ፥
አቤቱ ታድነኝ ዘንድ ፍቀድ፥
ከክፉዎች ምክር ወጥመድ፥
አቤቱ ታድነኝ ዘንድ ውደድ።',
        lyrics_transliteration = 'CHORUS
Abetu tadnegn zend wided:
Abetu tadnegn zend fiqed:
Kekfuwoch mikr wet’med:
Abetu tadnegn zend wided.

VERSE 1
Yihun sitl honu , azezh tefet’eru:
Beqalh ts’entewal midrna t’eferu:
Lik ende mets’ague dan yalkew yidnal:
Beaqlesya sayda fit’ret dej yit’enal.

CHORUS
Abetu tadnegn zend wided:
Abetu tadnegn zend fiqed:
Kekfuwoch mikr wet’med:
Abetu tadnegn zend wided.

VERSE 2
Hewaryat betankwaw adnen endalu:
Beqale tegsats’h ts’et’ endil maebelu:
Moged ts’or tenestwal bebahre sigaye:
Hedfeni Kristos liqe hemerye:

CHORUS
Abetu tadnegn zend wided:
Abetu tadnegn zend fiqed:
Kekfuwoch mikr wet’med:
Abetu tadnegn zend wided.

VERSE 3
Adnegn amlake adnegn getaye.
Lemot beteset’e gosqwala sewnet:
Yemalwedewn new yemadergew beewnet.
Kesiol kesedom kealeme meatu:

CHORUS
Abetu tadnegn zend wided:
Abetu tadnegn zend fiqed:
Kekfuwoch mikr wet’med:
Abetu tadnegn zend wided.

VERSE 4
Yawt’ugn ejen yizew ende lot’ melaektu.
Yenefs edf mat’eb limdu new yeelshaday:
Biqela ende alela yinet’al keameday:
Behusognem yirch’egn yants’agn keberedo:

CHORUS
Abetu tadnegn zend wided:
Abetu tadnegn zend fiqed:
Kekfuwoch mikr wet’med:
Abetu tadnegn zend wided.

VERSE 5
Cher wemestesahl dihneten wedo.

CHORUS
Abetu tadnegn zend wided:
Abetu tadnegn zend fiqed:
Kekfuwoch mikr wet’med:
Abetu tadnegn zend wided.',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'aabe36fe-df1a-44cf-8258-7cbeb35691f0'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አቤቱ ታድነኝ ዘንድ ውደድ፥
አቤቱ ታድነኝ ዘንድ ፍቀድ፥
ከክፉዎች ምክር ወጥመድ፥
አቤቱ ታድነኝ ዘንድ ውደድ።

VERSE 1
ይሁን ስትል ሆኑ ፣ አዘዝህ ተፈጠሩ፥
በቃልህ ጸንተዋል ምድርና ጠፈሩ፥
ልክ እንደ መፃጉዕ ዳን ያልከው ይድናል፥
በአቅሌስያ ሳይዳ ፍጥረት ደጅ ይጠናል።

CHORUS
አቤቱ ታድነኝ ዘንድ ውደድ፥
አቤቱ ታድነኝ ዘንድ ፍቀድ፥
ከክፉዎች ምክር ወጥመድ፥
አቤቱ ታድነኝ ዘንድ ውደድ።

VERSE 2
ሐዋርያት በታንኳው አድነን እንዳሉ፥
በቃለ ተግሣፅህ ጸጥ እንዲል ማዕበሉ፥
ሞገድ ጾር ተነሥቷል በባሕረ ሥጋዬ፥
ኀድፈኒ ክርስቶስ ሊቀ ሐመርየ፥

CHORUS
አቤቱ ታድነኝ ዘንድ ውደድ፥
አቤቱ ታድነኝ ዘንድ ፍቀድ፥
ከክፉዎች ምክር ወጥመድ፥
አቤቱ ታድነኝ ዘንድ ውደድ።

VERSE 3
አድነኝ አምላኬ አድነኝ ጌታዬ።
ለሞት በተሰጠ ጎስቋላ ሰውነት፥
የማልወደውን ነው የማደርገው በእውነት።
ከሲኦል ከሰዶም ከዓለመ መዓቱ፥

CHORUS
አቤቱ ታድነኝ ዘንድ ውደድ፥
አቤቱ ታድነኝ ዘንድ ፍቀድ፥
ከክፉዎች ምክር ወጥመድ፥
አቤቱ ታድነኝ ዘንድ ውደድ።

VERSE 4
ያውጡኝ እጄን ይዘው እንደ ሎጥ መላእክቱ።
የነፍስ እድፍ ማጠብ ልምዱ ነው የኤልሻዳይ፥
ቢቀላ እንደ አለላ ይነጣል ከአመዳይ፥
በሁሶኘም ይርጨኝ ያንጻኝ ከበረዶ፥

CHORUS
አቤቱ ታድነኝ ዘንድ ውደድ፥
አቤቱ ታድነኝ ዘንድ ፍቀድ፥
ከክፉዎች ምክር ወጥመድ፥
አቤቱ ታድነኝ ዘንድ ውደድ።

VERSE 5
ቸር ወመስተሣህል ድኅነቴን ወዶ።

CHORUS
አቤቱ ታድነኝ ዘንድ ውደድ፥
አቤቱ ታድነኝ ዘንድ ፍቀድ፥
ከክፉዎች ምክር ወጥመድ፥
አቤቱ ታድነኝ ዘንድ ውደድ።'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'aabe36fe-df1a-44cf-8258-7cbeb35691f0'::uuid, 'tadinegn-zenid', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ayewate-beayene-best-ethiopian-orthodox-mezmure ("Ayewate beayene / Best Ethiopian Orthodox Mezmure")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b5c2371b-6222-4659-8a71-c3850c2da090'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 1
አዝ፡ //
ድካምና እንቅልፍ እንደምን ሊረታን
ድንጋይ ብንተራስ ፍቅርሽ አያስተኛን
ዓይኔ ቢከደን አለሽ በምናቤ

CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 2
አልተከለልሽም ነግሰሻል በልቤ/2/
አዝ፡ //
መረማመጃ የሎዛ መሰላል
የዜማ በቱ የመቅደስ ጸናፅል

CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 3
የሰማይ ንጉሥ በበላይሽ አለ
ድንኳን አድርጎ አንቺን የተከለ/2/
አዝ፡ //
ስምሽ በሁሉ ስለተወደደ

CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 4
ድንግል ለክብርሽ ፍጥረት አረገደ
ካላመኑት ዘንድ ቢሆንም ዝምታ
ከገብርኤል ነው የስምሽ ሰላምታ/2/
አዝ፡ //

CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 5
ሳደርስ ውደሴ መፃፌን ገልጬ
ተመላለስኩኝ አይኔ እንባ አየረጨ
በገናን ዳዊት መሰንቆም እዝራ
ሰጡኝ ላወድስ በክብሩ ተራራ/2/

CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ayehwat beayne ashagre
Yeyaredn wib zimare
Teqegnehu ende abatoche
Ejen lekbrwa zergche

VERSE 1
CHORUS
Dikamna enqlf endemn liretan
Dingay binteras fiqrsh ayastegnan
Ayne bikeden alesh bemnabe

CHORUS
Ayehwat beayne ashagre
Yeyaredn wib zimare
Teqegnehu ende abatoche
Ejen lekbrwa zergche

VERSE 2
Altekelelshm negseshal belbe (2)
CHORUS
Meremameja yeloza meselal
Yezema betu yemeqdes ts’enats’l

CHORUS
Ayehwat beayne ashagre
Yeyaredn wib zimare
Teqegnehu ende abatoche
Ejen lekbrwa zergche

VERSE 3
Yesemay nigus bebelaysh ale
Dinkwan adrgo anchin yetekele (2)
CHORUS
Simsh behulu siletewedede

CHORUS
Ayehwat beayne ashagre
Yeyaredn wib zimare
Teqegnehu ende abatoche
Ejen lekbrwa zergche

VERSE 4
Dingil lekbrsh fit’ret aregede
Kalamenut zend bihonm zimta
Kegebrel new yesmsh selamta (2)
CHORUS

CHORUS
Ayehwat beayne ashagre
Yeyaredn wib zimare
Teqegnehu ende abatoche
Ejen lekbrwa zergche

VERSE 5
Saders widese mets’afen gelch’e
Temelaleskugn ayne enba ayerech’e
Begenan dawit mesenqom ezra
Set’ugn laweds bekbru terara (2)

CHORUS
Ayehwat beayne ashagre
Yeyaredn wib zimare
Teqegnehu ende abatoche
Ejen lekbrwa zergche'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 1
አዝ፡ //
ድካምና እንቅልፍ እንደምን ሊረታን
ድንጋይ ብንተራስ ፍቅርሽ አያስተኛን
ዓይኔ ቢከደን አለሽ በምናቤ

CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 2
አልተከለልሽም ነግሰሻል በልቤ/2/
አዝ፡ //
መረማመጃ የሎዛ መሰላል
የዜማ በቱ የመቅደስ ጸናፅል

CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 3
የሰማይ ንጉሥ በበላይሽ አለ
ድንኳን አድርጎ አንቺን የተከለ/2/
አዝ፡ //
ስምሽ በሁሉ ስለተወደደ

CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 4
ድንግል ለክብርሽ ፍጥረት አረገደ
ካላመኑት ዘንድ ቢሆንም ዝምታ
ከገብርኤል ነው የስምሽ ሰላምታ/2/
አዝ፡ //

CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 5
ሳደርስ ውደሴ መፃፌን ገልጬ
ተመላለስኩኝ አይኔ እንባ አየረጨ
በገናን ዳዊት መሰንቆም እዝራ
ሰጡኝ ላወድስ በክብሩ ተራራ/2/

CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ',
        lyrics_transliteration = 'CHORUS
Ayehwat beayne ashagre
Yeyaredn wib zimare
Teqegnehu ende abatoche
Ejen lekbrwa zergche

VERSE 1
CHORUS
Dikamna enqlf endemn liretan
Dingay binteras fiqrsh ayastegnan
Ayne bikeden alesh bemnabe

CHORUS
Ayehwat beayne ashagre
Yeyaredn wib zimare
Teqegnehu ende abatoche
Ejen lekbrwa zergche

VERSE 2
Altekelelshm negseshal belbe (2)
CHORUS
Meremameja yeloza meselal
Yezema betu yemeqdes ts’enats’l

CHORUS
Ayehwat beayne ashagre
Yeyaredn wib zimare
Teqegnehu ende abatoche
Ejen lekbrwa zergche

VERSE 3
Yesemay nigus bebelaysh ale
Dinkwan adrgo anchin yetekele (2)
CHORUS
Simsh behulu siletewedede

CHORUS
Ayehwat beayne ashagre
Yeyaredn wib zimare
Teqegnehu ende abatoche
Ejen lekbrwa zergche

VERSE 4
Dingil lekbrsh fit’ret aregede
Kalamenut zend bihonm zimta
Kegebrel new yesmsh selamta (2)
CHORUS

CHORUS
Ayehwat beayne ashagre
Yeyaredn wib zimare
Teqegnehu ende abatoche
Ejen lekbrwa zergche

VERSE 5
Saders widese mets’afen gelch’e
Temelaleskugn ayne enba ayerech’e
Begenan dawit mesenqom ezra
Set’ugn laweds bekbru terara (2)

CHORUS
Ayehwat beayne ashagre
Yeyaredn wib zimare
Teqegnehu ende abatoche
Ejen lekbrwa zergche',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b5c2371b-6222-4659-8a71-c3850c2da090'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 1
አዝ፡ //
ድካምና እንቅልፍ እንደምን ሊረታን
ድንጋይ ብንተራስ ፍቅርሽ አያስተኛን
ዓይኔ ቢከደን አለሽ በምናቤ

CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 2
አልተከለልሽም ነግሰሻል በልቤ/2/
አዝ፡ //
መረማመጃ የሎዛ መሰላል
የዜማ በቱ የመቅደስ ጸናፅል

CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 3
የሰማይ ንጉሥ በበላይሽ አለ
ድንኳን አድርጎ አንቺን የተከለ/2/
አዝ፡ //
ስምሽ በሁሉ ስለተወደደ

CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 4
ድንግል ለክብርሽ ፍጥረት አረገደ
ካላመኑት ዘንድ ቢሆንም ዝምታ
ከገብርኤል ነው የስምሽ ሰላምታ/2/
አዝ፡ //

CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ

VERSE 5
ሳደርስ ውደሴ መፃፌን ገልጬ
ተመላለስኩኝ አይኔ እንባ አየረጨ
በገናን ዳዊት መሰንቆም እዝራ
ሰጡኝ ላወድስ በክብሩ ተራራ/2/

CHORUS
አየኋት በዓይኔ አሻግሬ
የያሬድን ውብ ዝማሬ
ተቀኘሁ እንደ አባቶቼ
እጄን ለክብሯ ዘርግቼ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b5c2371b-6222-4659-8a71-c3850c2da090'::uuid, 'ayewate-beayene-best-ethiopian-orthodox-mezmure', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- dengel-weladite-kal ("Dengel Weladite Kal")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a9f74dd5-aeab-4739-aeec-f86aa0e6b1a1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 1
አሟሟትሽ በጥር ነሐሴ መቃብር ድንግል
የአንቺ ለብቻ ነው ትንሣኤሽ ሲነገር ድንግል
ሥጋሽ በምድር ላይ የታለ እንደ ፍጡር ድንግል
ዐርጓል ወደ ሰማይ ከክርስቶስ መንበር ድንግል

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 2
ድንግል ድንግል ወላዲተ ቃል (2)

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 3
ሥጋሽን ሲያሳርጉ መላእክተ ሰማይ ድንግል
ቶማስ በደመና ሲመጣ መንገድ ላይ ድንግል
መግነዝ ተረከበ ለሐዋርያት ሊያሳይ ድንግል

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 4
ድንግል ድንግል ወላዲተ ቃል (2)

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 5
ትንሣኤሽን ሽተው ግራ ሲገባቸው ድንግል
ሐዋርያት ጾመው ተገለጥሽላቸው ድንግል
ተቀብራ አልቀረችም በምድር ከደጇ ድንግል
ወደ ላይ ዐረገች እርሷም እንደልጇ ድንግል

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 6
ድንግል ድንግል ወላዲተ ቃል (2)

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 7
ለማየት ሲጏጉ የድንግልን ትንሣኤ ድንግል
ዕርገቷን አወቁ በብዙ ሱባዔ ድንግል
እኛም እንጸልይ በራችንን እንዝጋ ድንግል
ከወላዲተ አምላክ እንድናገኝ ዋጋ ድንግል

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 8
ድንግል ድንግል ወላዲተ ቃል (2)

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 1
Amumatesh beter Nehasie mekabir Dengel
Yanchi lebecha new Tinsaesh sineger Dengel
Segash bemider lay yetale endefitur Dengel
Aregwal wede semay keKristos menber Dengel

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 2
Dengel Dengel Weladite Kal (2)

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 3
Segashin siasargu melaekt kesemay Dengel
Thomas bedemena simeta meneged lay Dengel
Megnez terekebe leHawaryat liyasay Dengel

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 4
Dengel Dengel Weladite Kal (2)

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 5
Tensaeshin shitew gira sigebachew Dengel
Hawaryat tsomew tegeletsshilachew Dengel
Teqebra alqerechim bemidir kedejua Dengel
Wedelay aregech ersuam endelijua Dengel

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 6
Dengel Dengel Weladite Kal (2)

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 7
Lemayet siguagu yedinglin tinsae Dengel
Ergetuan aweku bebizu subaie Dengel
Egnam entseliy berachinin enziga Dengel
KeWeladite Amlak endinagegn waga Dengel

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 8
Dengel Dengel Weladite Kal (2)

CHORUS
Dengel Dengel Weladite Kal (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 1
አሟሟትሽ በጥር ነሐሴ መቃብር ድንግል
የአንቺ ለብቻ ነው ትንሣኤሽ ሲነገር ድንግል
ሥጋሽ በምድር ላይ የታለ እንደ ፍጡር ድንግል
ዐርጓል ወደ ሰማይ ከክርስቶስ መንበር ድንግል

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 2
ድንግል ድንግል ወላዲተ ቃል (2)

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 3
ሥጋሽን ሲያሳርጉ መላእክተ ሰማይ ድንግል
ቶማስ በደመና ሲመጣ መንገድ ላይ ድንግል
መግነዝ ተረከበ ለሐዋርያት ሊያሳይ ድንግል

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 4
ድንግል ድንግል ወላዲተ ቃል (2)

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 5
ትንሣኤሽን ሽተው ግራ ሲገባቸው ድንግል
ሐዋርያት ጾመው ተገለጥሽላቸው ድንግል
ተቀብራ አልቀረችም በምድር ከደጇ ድንግል
ወደ ላይ ዐረገች እርሷም እንደልጇ ድንግል

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 6
ድንግል ድንግል ወላዲተ ቃል (2)

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 7
ለማየት ሲጏጉ የድንግልን ትንሣኤ ድንግል
ዕርገቷን አወቁ በብዙ ሱባዔ ድንግል
እኛም እንጸልይ በራችንን እንዝጋ ድንግል
ከወላዲተ አምላክ እንድናገኝ ዋጋ ድንግል

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 8
ድንግል ድንግል ወላዲተ ቃል (2)

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)',
        lyrics_transliteration = 'CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 1
Amumatesh beter Nehasie mekabir Dengel
Yanchi lebecha new Tinsaesh sineger Dengel
Segash bemider lay yetale endefitur Dengel
Aregwal wede semay keKristos menber Dengel

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 2
Dengel Dengel Weladite Kal (2)

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 3
Segashin siasargu melaekt kesemay Dengel
Thomas bedemena simeta meneged lay Dengel
Megnez terekebe leHawaryat liyasay Dengel

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 4
Dengel Dengel Weladite Kal (2)

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 5
Tensaeshin shitew gira sigebachew Dengel
Hawaryat tsomew tegeletsshilachew Dengel
Teqebra alqerechim bemidir kedejua Dengel
Wedelay aregech ersuam endelijua Dengel

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 6
Dengel Dengel Weladite Kal (2)

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 7
Lemayet siguagu yedinglin tinsae Dengel
Ergetuan aweku bebizu subaie Dengel
Egnam entseliy berachinin enziga Dengel
KeWeladite Amlak endinagegn waga Dengel

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 8
Dengel Dengel Weladite Kal (2)

CHORUS
Dengel Dengel Weladite Kal (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a9f74dd5-aeab-4739-aeec-f86aa0e6b1a1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 1
አሟሟትሽ በጥር ነሐሴ መቃብር ድንግል
የአንቺ ለብቻ ነው ትንሣኤሽ ሲነገር ድንግል
ሥጋሽ በምድር ላይ የታለ እንደ ፍጡር ድንግል
ዐርጓል ወደ ሰማይ ከክርስቶስ መንበር ድንግል

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 2
ድንግል ድንግል ወላዲተ ቃል (2)

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 3
ሥጋሽን ሲያሳርጉ መላእክተ ሰማይ ድንግል
ቶማስ በደመና ሲመጣ መንገድ ላይ ድንግል
መግነዝ ተረከበ ለሐዋርያት ሊያሳይ ድንግል

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 4
ድንግል ድንግል ወላዲተ ቃል (2)

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 5
ትንሣኤሽን ሽተው ግራ ሲገባቸው ድንግል
ሐዋርያት ጾመው ተገለጥሽላቸው ድንግል
ተቀብራ አልቀረችም በምድር ከደጇ ድንግል
ወደ ላይ ዐረገች እርሷም እንደልጇ ድንግል

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 6
ድንግል ድንግል ወላዲተ ቃል (2)

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 7
ለማየት ሲጏጉ የድንግልን ትንሣኤ ድንግል
ዕርገቷን አወቁ በብዙ ሱባዔ ድንግል
እኛም እንጸልይ በራችንን እንዝጋ ድንግል
ከወላዲተ አምላክ እንድናገኝ ዋጋ ድንግል

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)

VERSE 8
ድንግል ድንግል ወላዲተ ቃል (2)

CHORUS
ድንግል ድንግል ወላዲተ ቃል (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 1
Amumatesh beter Nehasie mekabir Dengel
Yanchi lebecha new Tinsaesh sineger Dengel
Segash bemider lay yetale endefitur Dengel
Aregwal wede semay keKristos menber Dengel

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 2
Dengel Dengel Weladite Kal (2)

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 3
Segashin siasargu melaekt kesemay Dengel
Thomas bedemena simeta meneged lay Dengel
Megnez terekebe leHawaryat liyasay Dengel

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 4
Dengel Dengel Weladite Kal (2)

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 5
Tensaeshin shitew gira sigebachew Dengel
Hawaryat tsomew tegeletsshilachew Dengel
Teqebra alqerechim bemidir kedejua Dengel
Wedelay aregech ersuam endelijua Dengel

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 6
Dengel Dengel Weladite Kal (2)

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 7
Lemayet siguagu yedinglin tinsae Dengel
Ergetuan aweku bebizu subaie Dengel
Egnam entseliy berachinin enziga Dengel
KeWeladite Amlak endinagegn waga Dengel

CHORUS
Dengel Dengel Weladite Kal (2)

VERSE 8
Dengel Dengel Weladite Kal (2)

CHORUS
Dengel Dengel Weladite Kal (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a9f74dd5-aeab-4739-aeec-f86aa0e6b1a1'::uuid, 'dengel-weladite-kal', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- di-n-teame-segid-mezimur ("Di/n Teame Segid Mezimur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f0820235-d026-4955-b71d-1b7e2c1207a9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 1
ከምቶም ደቂ ዓሳ ሓድሕድ ክንጨኻኸን
ኮይንና ድዩ በቃ ይቅሬታ ክሰኣን
ሓደራ ሓደራ ፍቁራት ኣሕዋትና
ጋሻ ውሕጅ ስጋ ከይተዳህልለና

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 2
ንነብሲ ነዳሉ መታን ክሕሸና
ጽባሕ ንበደልና ሕድገት ክንረኽበሉ
ጾር ኣሕዋትና ንጹር ዋላ ተበደሉ
ጠዋሪ ስኢኑ ምንባር ዝናፈቀ

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 3
ነዛ ድራር እለት ከቶ ዘይሰነቀ
ኣብቲ ጎደናታት ኣሎ ዝወደቀ
ተመሊስካ ትረድኦ ገዲፍካዮ ኣይትእቶ
ምስላ ኣቦታትና ጎይታ ዝሰረቶ

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 4
ርህራሄ ሳምራዊ ልብና ከይስሕቶ
ኣምላክ ክረድኣና ኣብቲ ዳሕራይ ዓለም
ብጻይና ንምርዳእ ሃየ ንቀዳደም
ንዕምቆት ለውሃቱ መን''ዩ ዘስተንትኖ

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 5
ሕያው ኮነ ጉኡዝ ዝኣምኖ ዘይኣምኖ
መን ኣሎና ፍጡር ምሕረቱ ዘይከድኖ
ጽሓይ ኮነ ዝናብ ብልግሲ ዝምግብ
ዘየዳሉ ኣምላኽ ኣቦ ምሉእ ህያብ

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 6
ሂቡ ዘይጣዓስ ምሒሩ ዘይርብርብ
ንዝርጉሓት ኣእዳው ክንህበን ትኳቦ
ይጽበየና''ሎ ምሕረቱ ክንስዕቦ
እንትርፎ ፈጣሪ መን ኣሎና ፍጹም

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 7
ሰብ ጎደሎ ፍጥረት ሰብ ኣበረ ድኻም
ታሪኽ ሕሉፍና''ንድዩ ዛንታ ኣቦና ኣዳም
ወይ''ዚ ጎይታና ግን መጠን ኣልቦ ፍቅሩ
ውርደትና ሓዚሉ መስቀል ምሽንካሩ

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 8
ሓውና ክንሰትር''ዩ በደልና ሰቲሩ
ባሮቱ ዘይኮንስ ክንከውን ኣዕርኽቱ
ኣሕዋት ንደናገጽ ዘኪርና ምሕረቱ

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Meharti mihret kireኽbu''yom kab egziabher
Zibl qal rihrahe qal goyta nizekr
Sigay sigaኻ nibehahal ahwat nifaqer (2)
Wiludn weladn seb mahla kidann

VERSE 1
Kemtom deqi asa hadhd kinch’eኻኸn
Koynna diyu beqa yiqreta kisean
Hadera hadera fiqurat ahwatna
Gasha wihj siga keytedahllena

CHORUS
Meharti mihret kireኽbu''yom kab egziabher
Zibl qal rihrahe qal goyta nizekr
Sigay sigaኻ nibehahal ahwat nifaqer (2)
Wiludn weladn seb mahla kidann

VERSE 2
Ninebsi nedalu metan kihshena
Ts’bah nibedelna hidget kinreኽbelu
Ts’or ahwatna nits’ur wala tebedelu
T’ewari siinu minbar zinafeqe

CHORUS
Meharti mihret kireኽbu''yom kab egziabher
Zibl qal rihrahe qal goyta nizekr
Sigay sigaኻ nibehahal ahwat nifaqer (2)
Wiludn weladn seb mahla kidann

VERSE 3
Neza dirar elet keto zeyseneqe
Abti godenatat alo ziwedeqe
Temeliska tiredo gedifkayo ayteto
Misla abotatna goyta zisereto

CHORUS
Meharti mihret kireኽbu''yom kab egziabher
Zibl qal rihrahe qal goyta nizekr
Sigay sigaኻ nibehahal ahwat nifaqer (2)
Wiludn weladn seb mahla kidann

VERSE 4
Rihrahe samrawi libna keyshto
Amlak kiredana abti dahray alem
Bits’ayna nimrdae haye niqedadem
Niemqot lewhatu men''yu zestentno

CHORUS
Meharti mihret kireኽbu''yom kab egziabher
Zibl qal rihrahe qal goyta nizekr
Sigay sigaኻ nibehahal ahwat nifaqer (2)
Wiludn weladn seb mahla kidann

VERSE 5
Hiyaw kone guuz ziamno zeyamno
Men alona fit’ur mihretu zeykedno
Ts’hay kone zinab bilgsi zimgb
Zeyedalu amlaኽ abo milue hiyab

CHORUS
Meharti mihret kireኽbu''yom kab egziabher
Zibl qal rihrahe qal goyta nizekr
Sigay sigaኻ nibehahal ahwat nifaqer (2)
Wiludn weladn seb mahla kidann

VERSE 6
Hibu zeyt’aas mihiru zeyrbrb
Nizrguhat aedaw kinhben tikwabo
Yits’beyena''lo mihretu kinsebo
Entrfo fet’ari men alona fits’um

CHORUS
Meharti mihret kireኽbu''yom kab egziabher
Zibl qal rihrahe qal goyta nizekr
Sigay sigaኻ nibehahal ahwat nifaqer (2)
Wiludn weladn seb mahla kidann

VERSE 7
Seb godelo fit’ret seb abere diኻm
Tariኽ hilufna''nidyu zanta abona adam
Wey''zi goytana gin met’en albo fiqru
Wirdetna hazilu mesqel mishnkaru

CHORUS
Meharti mihret kireኽbu''yom kab egziabher
Zibl qal rihrahe qal goyta nizekr
Sigay sigaኻ nibehahal ahwat nifaqer (2)
Wiludn weladn seb mahla kidann

VERSE 8
Hawna kinsetr''yu bedelna setiru
Barotu zeykons kinkewn aerኽtu
Ahwat nidenagets’ zekirna mihretu

CHORUS
Meharti mihret kireኽbu''yom kab egziabher
Zibl qal rihrahe qal goyta nizekr
Sigay sigaኻ nibehahal ahwat nifaqer (2)
Wiludn weladn seb mahla kidann'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 1
ከምቶም ደቂ ዓሳ ሓድሕድ ክንጨኻኸን
ኮይንና ድዩ በቃ ይቅሬታ ክሰኣን
ሓደራ ሓደራ ፍቁራት ኣሕዋትና
ጋሻ ውሕጅ ስጋ ከይተዳህልለና

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 2
ንነብሲ ነዳሉ መታን ክሕሸና
ጽባሕ ንበደልና ሕድገት ክንረኽበሉ
ጾር ኣሕዋትና ንጹር ዋላ ተበደሉ
ጠዋሪ ስኢኑ ምንባር ዝናፈቀ

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 3
ነዛ ድራር እለት ከቶ ዘይሰነቀ
ኣብቲ ጎደናታት ኣሎ ዝወደቀ
ተመሊስካ ትረድኦ ገዲፍካዮ ኣይትእቶ
ምስላ ኣቦታትና ጎይታ ዝሰረቶ

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 4
ርህራሄ ሳምራዊ ልብና ከይስሕቶ
ኣምላክ ክረድኣና ኣብቲ ዳሕራይ ዓለም
ብጻይና ንምርዳእ ሃየ ንቀዳደም
ንዕምቆት ለውሃቱ መን''ዩ ዘስተንትኖ

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 5
ሕያው ኮነ ጉኡዝ ዝኣምኖ ዘይኣምኖ
መን ኣሎና ፍጡር ምሕረቱ ዘይከድኖ
ጽሓይ ኮነ ዝናብ ብልግሲ ዝምግብ
ዘየዳሉ ኣምላኽ ኣቦ ምሉእ ህያብ

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 6
ሂቡ ዘይጣዓስ ምሒሩ ዘይርብርብ
ንዝርጉሓት ኣእዳው ክንህበን ትኳቦ
ይጽበየና''ሎ ምሕረቱ ክንስዕቦ
እንትርፎ ፈጣሪ መን ኣሎና ፍጹም

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 7
ሰብ ጎደሎ ፍጥረት ሰብ ኣበረ ድኻም
ታሪኽ ሕሉፍና''ንድዩ ዛንታ ኣቦና ኣዳም
ወይ''ዚ ጎይታና ግን መጠን ኣልቦ ፍቅሩ
ውርደትና ሓዚሉ መስቀል ምሽንካሩ

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 8
ሓውና ክንሰትር''ዩ በደልና ሰቲሩ
ባሮቱ ዘይኮንስ ክንከውን ኣዕርኽቱ
ኣሕዋት ንደናገጽ ዘኪርና ምሕረቱ

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን',
        lyrics_transliteration = 'CHORUS
Meharti mihret kireኽbu''yom kab egziabher
Zibl qal rihrahe qal goyta nizekr
Sigay sigaኻ nibehahal ahwat nifaqer (2)
Wiludn weladn seb mahla kidann

VERSE 1
Kemtom deqi asa hadhd kinch’eኻኸn
Koynna diyu beqa yiqreta kisean
Hadera hadera fiqurat ahwatna
Gasha wihj siga keytedahllena

CHORUS
Meharti mihret kireኽbu''yom kab egziabher
Zibl qal rihrahe qal goyta nizekr
Sigay sigaኻ nibehahal ahwat nifaqer (2)
Wiludn weladn seb mahla kidann

VERSE 2
Ninebsi nedalu metan kihshena
Ts’bah nibedelna hidget kinreኽbelu
Ts’or ahwatna nits’ur wala tebedelu
T’ewari siinu minbar zinafeqe

CHORUS
Meharti mihret kireኽbu''yom kab egziabher
Zibl qal rihrahe qal goyta nizekr
Sigay sigaኻ nibehahal ahwat nifaqer (2)
Wiludn weladn seb mahla kidann

VERSE 3
Neza dirar elet keto zeyseneqe
Abti godenatat alo ziwedeqe
Temeliska tiredo gedifkayo ayteto
Misla abotatna goyta zisereto

CHORUS
Meharti mihret kireኽbu''yom kab egziabher
Zibl qal rihrahe qal goyta nizekr
Sigay sigaኻ nibehahal ahwat nifaqer (2)
Wiludn weladn seb mahla kidann

VERSE 4
Rihrahe samrawi libna keyshto
Amlak kiredana abti dahray alem
Bits’ayna nimrdae haye niqedadem
Niemqot lewhatu men''yu zestentno

CHORUS
Meharti mihret kireኽbu''yom kab egziabher
Zibl qal rihrahe qal goyta nizekr
Sigay sigaኻ nibehahal ahwat nifaqer (2)
Wiludn weladn seb mahla kidann

VERSE 5
Hiyaw kone guuz ziamno zeyamno
Men alona fit’ur mihretu zeykedno
Ts’hay kone zinab bilgsi zimgb
Zeyedalu amlaኽ abo milue hiyab

CHORUS
Meharti mihret kireኽbu''yom kab egziabher
Zibl qal rihrahe qal goyta nizekr
Sigay sigaኻ nibehahal ahwat nifaqer (2)
Wiludn weladn seb mahla kidann

VERSE 6
Hibu zeyt’aas mihiru zeyrbrb
Nizrguhat aedaw kinhben tikwabo
Yits’beyena''lo mihretu kinsebo
Entrfo fet’ari men alona fits’um

CHORUS
Meharti mihret kireኽbu''yom kab egziabher
Zibl qal rihrahe qal goyta nizekr
Sigay sigaኻ nibehahal ahwat nifaqer (2)
Wiludn weladn seb mahla kidann

VERSE 7
Seb godelo fit’ret seb abere diኻm
Tariኽ hilufna''nidyu zanta abona adam
Wey''zi goytana gin met’en albo fiqru
Wirdetna hazilu mesqel mishnkaru

CHORUS
Meharti mihret kireኽbu''yom kab egziabher
Zibl qal rihrahe qal goyta nizekr
Sigay sigaኻ nibehahal ahwat nifaqer (2)
Wiludn weladn seb mahla kidann

VERSE 8
Hawna kinsetr''yu bedelna setiru
Barotu zeykons kinkewn aerኽtu
Ahwat nidenagets’ zekirna mihretu

CHORUS
Meharti mihret kireኽbu''yom kab egziabher
Zibl qal rihrahe qal goyta nizekr
Sigay sigaኻ nibehahal ahwat nifaqer (2)
Wiludn weladn seb mahla kidann',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f0820235-d026-4955-b71d-1b7e2c1207a9'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 1
ከምቶም ደቂ ዓሳ ሓድሕድ ክንጨኻኸን
ኮይንና ድዩ በቃ ይቅሬታ ክሰኣን
ሓደራ ሓደራ ፍቁራት ኣሕዋትና
ጋሻ ውሕጅ ስጋ ከይተዳህልለና

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 2
ንነብሲ ነዳሉ መታን ክሕሸና
ጽባሕ ንበደልና ሕድገት ክንረኽበሉ
ጾር ኣሕዋትና ንጹር ዋላ ተበደሉ
ጠዋሪ ስኢኑ ምንባር ዝናፈቀ

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 3
ነዛ ድራር እለት ከቶ ዘይሰነቀ
ኣብቲ ጎደናታት ኣሎ ዝወደቀ
ተመሊስካ ትረድኦ ገዲፍካዮ ኣይትእቶ
ምስላ ኣቦታትና ጎይታ ዝሰረቶ

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 4
ርህራሄ ሳምራዊ ልብና ከይስሕቶ
ኣምላክ ክረድኣና ኣብቲ ዳሕራይ ዓለም
ብጻይና ንምርዳእ ሃየ ንቀዳደም
ንዕምቆት ለውሃቱ መን''ዩ ዘስተንትኖ

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 5
ሕያው ኮነ ጉኡዝ ዝኣምኖ ዘይኣምኖ
መን ኣሎና ፍጡር ምሕረቱ ዘይከድኖ
ጽሓይ ኮነ ዝናብ ብልግሲ ዝምግብ
ዘየዳሉ ኣምላኽ ኣቦ ምሉእ ህያብ

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 6
ሂቡ ዘይጣዓስ ምሒሩ ዘይርብርብ
ንዝርጉሓት ኣእዳው ክንህበን ትኳቦ
ይጽበየና''ሎ ምሕረቱ ክንስዕቦ
እንትርፎ ፈጣሪ መን ኣሎና ፍጹም

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 7
ሰብ ጎደሎ ፍጥረት ሰብ ኣበረ ድኻም
ታሪኽ ሕሉፍና''ንድዩ ዛንታ ኣቦና ኣዳም
ወይ''ዚ ጎይታና ግን መጠን ኣልቦ ፍቅሩ
ውርደትና ሓዚሉ መስቀል ምሽንካሩ

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን

VERSE 8
ሓውና ክንሰትር''ዩ በደልና ሰቲሩ
ባሮቱ ዘይኮንስ ክንከውን ኣዕርኽቱ
ኣሕዋት ንደናገጽ ዘኪርና ምሕረቱ

CHORUS
መሓርቲ ምሕረት ክረኽቡ''ዮም ካብ እግዚኣብሔር
ዝብል ቃል ርህራሄ ቃል ጎይታ ንዘክር
ስጋይ ስጋኻ ንበሃሃል ኣሕዋት ንፋቀር (2)
ውሉድን ወላድን ሰብ ማሕላ ኪዳንን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f0820235-d026-4955-b71d-1b7e2c1207a9'::uuid, 'di-n-teame-segid-mezimur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ferahu ("Ferahu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f0d1e1dc-69f8-4d9e-969b-1050e188fe75'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 1
እንዴት ነው ሳላውቅ ዘመኔ ያለቀው?
ጊዜዬን ዓለም ወስዳ ተጫወተችው።
እንዴት በድፍረት ደጅህን ልግባ?
ልግባ ወይ አልግባ?

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 2
እንዴት ይመዝናል ያንተ ደም?
በራው ልግባ ወይ አልግባ?
እንዴት ይመዝናል ያንተ ደም?
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 3
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
እኔ ፈራሁ እንጂ፣ አንተ እንኳን አታስፈራም፣
መምጣቴ ነው ደስታ፣ ፍቅርህ ይጣፍጣል፣

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 4
ነፍሴ ተሽምቅቃለች፣ መስቀልህን ሳየው፣ ደምህን እያየሁ።
ልግባ ወይ አልግባ?
እንዴት ይመዝናል ያንተ ደም?
በራው ልግባ ወይ አልግባ?

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 5
እንዴት ይመዝናል ያንተ ደም?
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአቴ ከበደኝ፣ አላራመደኝም።

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 6
አላራመደኝም።
በንጽህና እንዴት እቆማለሁ?
እንደ መላእክቱ ክንፍ የለኝም እኔ፣
መሸፈኛ ክንፍ የለኝም እኔ፣

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 7
ይታያል ኃጢአቴ፣ የበደል እርቃኔ።
ልግባ ወይ አልግባ?
እንዴት ይመዝናል ያንተ ደም?
በራው ልግባ ወይ አልግባ?

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 8
እንዴት ይመዝናል ያንተ ደም?
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአቴ ከበደኝ፣ አላራመደኝም።

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 9
አላራመደኝም።
ጠዋትና ማታ ለመጣውም፣
አምሽቶ ለገባም እኮ ትከፍላለህ።
አብርሃም ወይሳቅ በድንኳን ቢያድሩም፣

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 10
በአንተ መንግስት ግን ከወዲያ ቀድመው።
ልግባ ወይ አልግባ?
እንዴት ይመዝናል ያንተ ደም?
በራው ልግባ ወይ አልግባ?

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 11
እንዴት ይመዝናል ያንተ ደም?

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 1
Endet new salawq zemene yaleqew?
Gizeyen alem wesda tech’awetechw.
Endet bedfret dejhn ligba?
Ligba wey algba?

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 2
Endet yimeznal yante dem?
Beraw ligba wey algba?
Endet yimeznal yante dem?
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 3
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Ene ferahu enji, ante enkwan atasferam,
Memt’ate new desta, fiqrh yit’aft’al,

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 4
Nefse teshmqqalech, mesqelhn sayew, demhn eyayehu.
Ligba wey algba?
Endet yimeznal yante dem?
Beraw ligba wey algba?

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 5
Endet yimeznal yante dem?
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iate kebedegn, alaramedegnm.

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 6
Alaramedegnm.
Bents’hna endet eqomalehu?
Ende melaektu kinf yelegnm ene,
Meshefegna kinf yelegnm ene,

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 7
Yitayal hat’iate, yebedel erqane.
Ligba wey algba?
Endet yimeznal yante dem?
Beraw ligba wey algba?

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 8
Endet yimeznal yante dem?
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iate kebedegn, alaramedegnm.

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 9
Alaramedegnm.
T’ewatna mata lemet’awm,
Amshto legebam eko tikeflaleh.
Abrham weysaq bednkwan biyadrum,

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 10
Beante mengst gin kewediya qedmew.
Ligba wey algba?
Endet yimeznal yante dem?
Beraw ligba wey algba?

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 11
Endet yimeznal yante dem?

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 1
እንዴት ነው ሳላውቅ ዘመኔ ያለቀው?
ጊዜዬን ዓለም ወስዳ ተጫወተችው።
እንዴት በድፍረት ደጅህን ልግባ?
ልግባ ወይ አልግባ?

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 2
እንዴት ይመዝናል ያንተ ደም?
በራው ልግባ ወይ አልግባ?
እንዴት ይመዝናል ያንተ ደም?
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 3
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
እኔ ፈራሁ እንጂ፣ አንተ እንኳን አታስፈራም፣
መምጣቴ ነው ደስታ፣ ፍቅርህ ይጣፍጣል፣

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 4
ነፍሴ ተሽምቅቃለች፣ መስቀልህን ሳየው፣ ደምህን እያየሁ።
ልግባ ወይ አልግባ?
እንዴት ይመዝናል ያንተ ደም?
በራው ልግባ ወይ አልግባ?

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 5
እንዴት ይመዝናል ያንተ ደም?
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአቴ ከበደኝ፣ አላራመደኝም።

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 6
አላራመደኝም።
በንጽህና እንዴት እቆማለሁ?
እንደ መላእክቱ ክንፍ የለኝም እኔ፣
መሸፈኛ ክንፍ የለኝም እኔ፣

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 7
ይታያል ኃጢአቴ፣ የበደል እርቃኔ።
ልግባ ወይ አልግባ?
እንዴት ይመዝናል ያንተ ደም?
በራው ልግባ ወይ አልግባ?

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 8
እንዴት ይመዝናል ያንተ ደም?
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአቴ ከበደኝ፣ አላራመደኝም።

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 9
አላራመደኝም።
ጠዋትና ማታ ለመጣውም፣
አምሽቶ ለገባም እኮ ትከፍላለህ።
አብርሃም ወይሳቅ በድንኳን ቢያድሩም፣

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 10
በአንተ መንግስት ግን ከወዲያ ቀድመው።
ልግባ ወይ አልግባ?
እንዴት ይመዝናል ያንተ ደም?
በራው ልግባ ወይ አልግባ?

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 11
እንዴት ይመዝናል ያንተ ደም?

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።',
        lyrics_transliteration = 'CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 1
Endet new salawq zemene yaleqew?
Gizeyen alem wesda tech’awetechw.
Endet bedfret dejhn ligba?
Ligba wey algba?

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 2
Endet yimeznal yante dem?
Beraw ligba wey algba?
Endet yimeznal yante dem?
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 3
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Ene ferahu enji, ante enkwan atasferam,
Memt’ate new desta, fiqrh yit’aft’al,

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 4
Nefse teshmqqalech, mesqelhn sayew, demhn eyayehu.
Ligba wey algba?
Endet yimeznal yante dem?
Beraw ligba wey algba?

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 5
Endet yimeznal yante dem?
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iate kebedegn, alaramedegnm.

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 6
Alaramedegnm.
Bents’hna endet eqomalehu?
Ende melaektu kinf yelegnm ene,
Meshefegna kinf yelegnm ene,

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 7
Yitayal hat’iate, yebedel erqane.
Ligba wey algba?
Endet yimeznal yante dem?
Beraw ligba wey algba?

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 8
Endet yimeznal yante dem?
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iate kebedegn, alaramedegnm.

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 9
Alaramedegnm.
T’ewatna mata lemet’awm,
Amshto legebam eko tikeflaleh.
Abrham weysaq bednkwan biyadrum,

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 10
Beante mengst gin kewediya qedmew.
Ligba wey algba?
Endet yimeznal yante dem?
Beraw ligba wey algba?

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.

VERSE 11
Endet yimeznal yante dem?

CHORUS
Qenu kerefede, meshebgn met’ahu, dejafh lay qomkugn,
Endalgeba ferahu, bedelen satmezn giba bitlegn,
Hat’iat kebedegn, alaramedegnm, alaramedegnm.
Yesew edmew eko ach’r new t’qit new.',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f0d1e1dc-69f8-4d9e-969b-1050e188fe75'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 1
እንዴት ነው ሳላውቅ ዘመኔ ያለቀው?
ጊዜዬን ዓለም ወስዳ ተጫወተችው።
እንዴት በድፍረት ደጅህን ልግባ?
ልግባ ወይ አልግባ?

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 2
እንዴት ይመዝናል ያንተ ደም?
በራው ልግባ ወይ አልግባ?
እንዴት ይመዝናል ያንተ ደም?
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 3
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
እኔ ፈራሁ እንጂ፣ አንተ እንኳን አታስፈራም፣
መምጣቴ ነው ደስታ፣ ፍቅርህ ይጣፍጣል፣

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 4
ነፍሴ ተሽምቅቃለች፣ መስቀልህን ሳየው፣ ደምህን እያየሁ።
ልግባ ወይ አልግባ?
እንዴት ይመዝናል ያንተ ደም?
በራው ልግባ ወይ አልግባ?

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 5
እንዴት ይመዝናል ያንተ ደም?
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአቴ ከበደኝ፣ አላራመደኝም።

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 6
አላራመደኝም።
በንጽህና እንዴት እቆማለሁ?
እንደ መላእክቱ ክንፍ የለኝም እኔ፣
መሸፈኛ ክንፍ የለኝም እኔ፣

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 7
ይታያል ኃጢአቴ፣ የበደል እርቃኔ።
ልግባ ወይ አልግባ?
እንዴት ይመዝናል ያንተ ደም?
በራው ልግባ ወይ አልግባ?

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 8
እንዴት ይመዝናል ያንተ ደም?
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአቴ ከበደኝ፣ አላራመደኝም።

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 9
አላራመደኝም።
ጠዋትና ማታ ለመጣውም፣
አምሽቶ ለገባም እኮ ትከፍላለህ።
አብርሃም ወይሳቅ በድንኳን ቢያድሩም፣

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 10
በአንተ መንግስት ግን ከወዲያ ቀድመው።
ልግባ ወይ አልግባ?
እንዴት ይመዝናል ያንተ ደም?
በራው ልግባ ወይ አልግባ?

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።

VERSE 11
እንዴት ይመዝናል ያንተ ደም?

CHORUS
ቀኑ ከረፈደ፣ መሸብኝ መጣሁ፣ ደጃፍህ ላይ ቆምኩኝ፣
እንዳልገባ ፈራሁ፣ በደሌን ሳትመዝን ግባ ብትለኝ፣
ኃጢአት ከበደኝ፣ አላራመደኝም፣ አላራመደኝም።
የሰው ዕድሜው እኮ አጭር ነው ጥቂት ነው።'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f0d1e1dc-69f8-4d9e-969b-1050e188fe75'::uuid, 'ferahu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- oritodokis-tewahido-hager-nat ("Oritodokis Tewahido Hager Nat")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f3a334dc-b41c-458a-b5ae-f8efeea7d8c9'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
አትፈርስም ጉልላቷ እርሱ ነው',
        lyrics_transliteration = 'CHORUS
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
Atfersm gullatwa ersu new',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f3a334dc-b41c-458a-b5ae-f8efeea7d8c9'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f3a334dc-b41c-458a-b5ae-f8efeea7d8c9'::uuid, 'oritodokis-tewahido-hager-nat', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- nu-beegiziabiher-des-yibeleni-dinik-adigolignal-giyorigis-hayal ("Nu Beegiziabiher Des Yibeleni, Dinik Adigolignal , Giyorigis Hayal")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'aa0d4952-364e-429c-bf8a-939266c322b3'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ድንቅ አድርጎልኛል በደሌን ሳይቆጥር',
        lyrics_transliteration = 'CHORUS
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
Dinq adrgolgnal bedelen sayqot’r',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'aa0d4952-364e-429c-bf8a-939266c322b3'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'aa0d4952-364e-429c-bf8a-939266c322b3'::uuid, 'nu-beegiziabiher-des-yibeleni-dinik-adigolignal-giyorigis-hayal', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- becherinet ("Becherinet")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ed6ee948-2324-4ff5-a6b0-80244a5c3b65'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 1
ላያድን ላይፈውስ ጽድቃችን
ተጥለን ስንኖር በሞት
በደምህ ወጣን አርነት
በደምህ ወጣን ነጻነት

CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 2
የጭንቀት የመከራ አመት
ተረሳ በኢየሱስ ሞት
በፍጹም ፍቅሩ ወደደን
በሞቱ ከሞት አዳነን

CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 3
ህዝቡን ሲያስጨንቅ የነበረ
የጠላት ክንዱ ተሰበረ
ማልቀስ ቀረልን መቅበዝበዝ
ገነት ገብተናል በእርሱ ወዝ

CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 4
ገነትን ወረስን በእርሱ ወዝ
ሰማይና ምድር ተስማሙ
ታጥበዋልና በደሙ
ነፃነት አዋጅ ተሰማ

CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 5
አዜምን የጽድቁን ዜማ
ዘመርን የጽድቅ ዜማ

CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bechernet beyqrtaw aseben
Befqruna bemhretu gobegnen
Amlakachn bemotu wededen
Tenet’qo selam ereftachn

VERSE 1
Layadn layfews ts’dqachn
Tet’len sinnor bemot
Bedemh wet’an arnet
Bedemh wet’an nets’anet

CHORUS
Bechernet beyqrtaw aseben
Befqruna bemhretu gobegnen
Amlakachn bemotu wededen
Tenet’qo selam ereftachn

VERSE 2
Yech’nqet yemekera amet
Teresa beiyesus mot
Befts’um fiqru wededen
Bemotu kemot adanen

CHORUS
Bechernet beyqrtaw aseben
Befqruna bemhretu gobegnen
Amlakachn bemotu wededen
Tenet’qo selam ereftachn

VERSE 3
Hizbun siyasch’enq yenebere
Yet’elat kindu tesebere
Malqes qereln meqbezbez
Genet gebtenal beersu wez

CHORUS
Bechernet beyqrtaw aseben
Befqruna bemhretu gobegnen
Amlakachn bemotu wededen
Tenet’qo selam ereftachn

VERSE 4
Genetn weresn beersu wez
Semayna midr tesmamu
Tat’bewalna bedemu
Nets’anet awaj tesema

CHORUS
Bechernet beyqrtaw aseben
Befqruna bemhretu gobegnen
Amlakachn bemotu wededen
Tenet’qo selam ereftachn

VERSE 5
Azemn yets’dqun zema
Zemern yets’dq zema

CHORUS
Bechernet beyqrtaw aseben
Befqruna bemhretu gobegnen
Amlakachn bemotu wededen
Tenet’qo selam ereftachn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 1
ላያድን ላይፈውስ ጽድቃችን
ተጥለን ስንኖር በሞት
በደምህ ወጣን አርነት
በደምህ ወጣን ነጻነት

CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 2
የጭንቀት የመከራ አመት
ተረሳ በኢየሱስ ሞት
በፍጹም ፍቅሩ ወደደን
በሞቱ ከሞት አዳነን

CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 3
ህዝቡን ሲያስጨንቅ የነበረ
የጠላት ክንዱ ተሰበረ
ማልቀስ ቀረልን መቅበዝበዝ
ገነት ገብተናል በእርሱ ወዝ

CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 4
ገነትን ወረስን በእርሱ ወዝ
ሰማይና ምድር ተስማሙ
ታጥበዋልና በደሙ
ነፃነት አዋጅ ተሰማ

CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 5
አዜምን የጽድቁን ዜማ
ዘመርን የጽድቅ ዜማ

CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን',
        lyrics_transliteration = 'CHORUS
Bechernet beyqrtaw aseben
Befqruna bemhretu gobegnen
Amlakachn bemotu wededen
Tenet’qo selam ereftachn

VERSE 1
Layadn layfews ts’dqachn
Tet’len sinnor bemot
Bedemh wet’an arnet
Bedemh wet’an nets’anet

CHORUS
Bechernet beyqrtaw aseben
Befqruna bemhretu gobegnen
Amlakachn bemotu wededen
Tenet’qo selam ereftachn

VERSE 2
Yech’nqet yemekera amet
Teresa beiyesus mot
Befts’um fiqru wededen
Bemotu kemot adanen

CHORUS
Bechernet beyqrtaw aseben
Befqruna bemhretu gobegnen
Amlakachn bemotu wededen
Tenet’qo selam ereftachn

VERSE 3
Hizbun siyasch’enq yenebere
Yet’elat kindu tesebere
Malqes qereln meqbezbez
Genet gebtenal beersu wez

CHORUS
Bechernet beyqrtaw aseben
Befqruna bemhretu gobegnen
Amlakachn bemotu wededen
Tenet’qo selam ereftachn

VERSE 4
Genetn weresn beersu wez
Semayna midr tesmamu
Tat’bewalna bedemu
Nets’anet awaj tesema

CHORUS
Bechernet beyqrtaw aseben
Befqruna bemhretu gobegnen
Amlakachn bemotu wededen
Tenet’qo selam ereftachn

VERSE 5
Azemn yets’dqun zema
Zemern yets’dq zema

CHORUS
Bechernet beyqrtaw aseben
Befqruna bemhretu gobegnen
Amlakachn bemotu wededen
Tenet’qo selam ereftachn',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ed6ee948-2324-4ff5-a6b0-80244a5c3b65'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 1
ላያድን ላይፈውስ ጽድቃችን
ተጥለን ስንኖር በሞት
በደምህ ወጣን አርነት
በደምህ ወጣን ነጻነት

CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 2
የጭንቀት የመከራ አመት
ተረሳ በኢየሱስ ሞት
በፍጹም ፍቅሩ ወደደን
በሞቱ ከሞት አዳነን

CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 3
ህዝቡን ሲያስጨንቅ የነበረ
የጠላት ክንዱ ተሰበረ
ማልቀስ ቀረልን መቅበዝበዝ
ገነት ገብተናል በእርሱ ወዝ

CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 4
ገነትን ወረስን በእርሱ ወዝ
ሰማይና ምድር ተስማሙ
ታጥበዋልና በደሙ
ነፃነት አዋጅ ተሰማ

CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን

VERSE 5
አዜምን የጽድቁን ዜማ
ዘመርን የጽድቅ ዜማ

CHORUS
በቸርነት በይቅርታው አሰበን
በፍቅሩና በምሕረቱ ጎበኘን
አምላካችን በሞቱ ወደደን
ተነጥቆ ሰላም እረፍታችን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ed6ee948-2324-4ff5-a6b0-80244a5c3b65'::uuid, 'becherinet', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yelibe-amakari-zemarit-naridos-kasahun ("Yelibe Amakari Zemarit Naridos Kasahun")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f10e8d02-7b57-47ea-8c45-c699629255e3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 1
የኔ መሻት አንቺን ማመስገን ነው
ያከበሩሽ ሲከብሩ ስላየው
በልቤ ያለን ላንቺ በመንገሬ
ሰላም እረፍት አገኘሁኝ ዛሬ

CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 2
አያልቅም አያልቅም ቢነገር
ኪዳነ ምህረት እናቴ ያንቺ ነገር
ልቤን በኪዳንሽ አሳርፌ
ሰላም ነው ቤቴ ብዙ ነው ትርፌ

CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 3
ልቤ ጽኑ ነው ባንቺ አያፍርም
እንኳን በደስታ በሃዘን ብወድቅም
ካ''ዘኔ ጥልቅ ወጣው ባንቺ ምልጃ
ስምሽ ጉልበት ሆኖኝ መጋረጃ

CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 4
ከቃል በላይ ነው ለኔ የሆነው
የቱ የቃል ጉልበት ችሎ ሊገልጸው
ዓለም ክብርሽ ከቶ ባይገባው
አንቺን መውደዴ ሁሌ ጊዜ ልክ ነው

CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 5
ያልተረዳማ የእናትን ጥቅም
ላንቺ የሚሆን ዜማን አያውቅም

CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ba''t’nte yegeba belbe yetateme
Ale yanchi sira nefsen yasdememe
Begize behuneta yematqeyeri
Kidane mihret yelbe amakari

VERSE 1
Yene meshat anchin mamesgen new
Yakeberush sikebru silayew
Belbe yalen lanchi bemengere
Selam ereft agegnehugn zare

CHORUS
Ba''t’nte yegeba belbe yetateme
Ale yanchi sira nefsen yasdememe
Begize behuneta yematqeyeri
Kidane mihret yelbe amakari

VERSE 2
Ayalqm ayalqm bineger
Kidane mihret enate yanchi neger
Liben bekidansh asarfe
Selam new bete bizu new tirfe

CHORUS
Ba''t’nte yegeba belbe yetateme
Ale yanchi sira nefsen yasdememe
Begize behuneta yematqeyeri
Kidane mihret yelbe amakari

VERSE 3
Libe ts’nu new banchi ayafrm
Enkwan bedesta behazen biwedqm
Ka''zene t’lq wet’aw banchi milja
Simsh gulbet honogn megareja

CHORUS
Ba''t’nte yegeba belbe yetateme
Ale yanchi sira nefsen yasdememe
Begize behuneta yematqeyeri
Kidane mihret yelbe amakari

VERSE 4
Keqal belay new lene yehonew
Yetu yeqal gulbet chlo ligelts’ew
Alem kibrsh keto baygebaw
Anchin mewdede hule gize lik new

CHORUS
Ba''t’nte yegeba belbe yetateme
Ale yanchi sira nefsen yasdememe
Begize behuneta yematqeyeri
Kidane mihret yelbe amakari

VERSE 5
Yalteredama yeenatn t’qm
Lanchi yemihon zeman ayawqm

CHORUS
Ba''t’nte yegeba belbe yetateme
Ale yanchi sira nefsen yasdememe
Begize behuneta yematqeyeri
Kidane mihret yelbe amakari'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 1
የኔ መሻት አንቺን ማመስገን ነው
ያከበሩሽ ሲከብሩ ስላየው
በልቤ ያለን ላንቺ በመንገሬ
ሰላም እረፍት አገኘሁኝ ዛሬ

CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 2
አያልቅም አያልቅም ቢነገር
ኪዳነ ምህረት እናቴ ያንቺ ነገር
ልቤን በኪዳንሽ አሳርፌ
ሰላም ነው ቤቴ ብዙ ነው ትርፌ

CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 3
ልቤ ጽኑ ነው ባንቺ አያፍርም
እንኳን በደስታ በሃዘን ብወድቅም
ካ''ዘኔ ጥልቅ ወጣው ባንቺ ምልጃ
ስምሽ ጉልበት ሆኖኝ መጋረጃ

CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 4
ከቃል በላይ ነው ለኔ የሆነው
የቱ የቃል ጉልበት ችሎ ሊገልጸው
ዓለም ክብርሽ ከቶ ባይገባው
አንቺን መውደዴ ሁሌ ጊዜ ልክ ነው

CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 5
ያልተረዳማ የእናትን ጥቅም
ላንቺ የሚሆን ዜማን አያውቅም

CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ',
        lyrics_transliteration = 'CHORUS
Ba''t’nte yegeba belbe yetateme
Ale yanchi sira nefsen yasdememe
Begize behuneta yematqeyeri
Kidane mihret yelbe amakari

VERSE 1
Yene meshat anchin mamesgen new
Yakeberush sikebru silayew
Belbe yalen lanchi bemengere
Selam ereft agegnehugn zare

CHORUS
Ba''t’nte yegeba belbe yetateme
Ale yanchi sira nefsen yasdememe
Begize behuneta yematqeyeri
Kidane mihret yelbe amakari

VERSE 2
Ayalqm ayalqm bineger
Kidane mihret enate yanchi neger
Liben bekidansh asarfe
Selam new bete bizu new tirfe

CHORUS
Ba''t’nte yegeba belbe yetateme
Ale yanchi sira nefsen yasdememe
Begize behuneta yematqeyeri
Kidane mihret yelbe amakari

VERSE 3
Libe ts’nu new banchi ayafrm
Enkwan bedesta behazen biwedqm
Ka''zene t’lq wet’aw banchi milja
Simsh gulbet honogn megareja

CHORUS
Ba''t’nte yegeba belbe yetateme
Ale yanchi sira nefsen yasdememe
Begize behuneta yematqeyeri
Kidane mihret yelbe amakari

VERSE 4
Keqal belay new lene yehonew
Yetu yeqal gulbet chlo ligelts’ew
Alem kibrsh keto baygebaw
Anchin mewdede hule gize lik new

CHORUS
Ba''t’nte yegeba belbe yetateme
Ale yanchi sira nefsen yasdememe
Begize behuneta yematqeyeri
Kidane mihret yelbe amakari

VERSE 5
Yalteredama yeenatn t’qm
Lanchi yemihon zeman ayawqm

CHORUS
Ba''t’nte yegeba belbe yetateme
Ale yanchi sira nefsen yasdememe
Begize behuneta yematqeyeri
Kidane mihret yelbe amakari',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f10e8d02-7b57-47ea-8c45-c699629255e3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 1
የኔ መሻት አንቺን ማመስገን ነው
ያከበሩሽ ሲከብሩ ስላየው
በልቤ ያለን ላንቺ በመንገሬ
ሰላም እረፍት አገኘሁኝ ዛሬ

CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 2
አያልቅም አያልቅም ቢነገር
ኪዳነ ምህረት እናቴ ያንቺ ነገር
ልቤን በኪዳንሽ አሳርፌ
ሰላም ነው ቤቴ ብዙ ነው ትርፌ

CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 3
ልቤ ጽኑ ነው ባንቺ አያፍርም
እንኳን በደስታ በሃዘን ብወድቅም
ካ''ዘኔ ጥልቅ ወጣው ባንቺ ምልጃ
ስምሽ ጉልበት ሆኖኝ መጋረጃ

CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 4
ከቃል በላይ ነው ለኔ የሆነው
የቱ የቃል ጉልበት ችሎ ሊገልጸው
ዓለም ክብርሽ ከቶ ባይገባው
አንቺን መውደዴ ሁሌ ጊዜ ልክ ነው

CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ

VERSE 5
ያልተረዳማ የእናትን ጥቅም
ላንቺ የሚሆን ዜማን አያውቅም

CHORUS
ባ''ጥንቴ የገባ በልቤ የታተመ
አለ ያንቺ ሥራ ነፍሴን ያስደመመ
በጊዜ በሁኔታ የማትቀየሪ
ኪዳነ ምህረት የልቤ አማካሪ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f10e8d02-7b57-47ea-8c45-c699629255e3'::uuid, 'yelibe-amakari-zemarit-naridos-kasahun', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- egziabher-hoy-erdagn ("Egziabher Hoy Erdagn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ade4830b-89bf-4445-bd9e-48000a8a5305'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 1
ጠማማውን ልቤን በቃልህ አቃንተህ
አላውቀውም ብሎ ሲጠየቅ ያመጸው

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 2
ዶሮ እስኪጮህ ድረስ ሶስት ጊዜ የካደው
የጅረት ወንዝ ነው የሰጠኸው እንባ
ጴጥሮስ ተጸጽቶ ንስሐ እንዲገባ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 3
ጽዋው እንዳይደርሰኝ የይሁዳ እድል
ልጅህ ሆኖ ውሎ ኃላ መኮብለል

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 4
ጴጥሮስ እድለኛው አልቅሶ ተማረ
በትዕቢቱ ይሁዳ እንደወጣ ቀረ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 5
ዘመኗን በሙሉ በዝሙት አቃጥላ
በንስሐ ጠራት ጌታ በገሊላ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 6
ታድሳ ተነሳች በእንባዋ ብዛት
እግሩ ስር ተደፍታ ማርያም መግደላዊት

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 7
አመጸኛው ልቤ ዛሬስ መቼ ይተኛል
በሃጢያት በዝሙት በስርቆት ይዋኛል

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 8
ወደ ቀድሞ ግብሩ እንዳይመለስ
ፍቅርህ በእኔ ሰርጾ ሃጢያቴን ደምስስ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 9
በደላችን ሁሉ ሳታስብ ትተህ
በምጽአትህ ሰዓት ከጻድቃን ቆጥረህ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 10
ነጭ ልብስን ለብሰን ሆነን ካንተ ጋራ
በሩ ሳይዘጋ አስገባን አደራ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 1
T’amamawn libe beqalih aqanteh
Alawqewm blo sit’eyeq yameṣew

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 2
Doro iski’choh deres sost gize yekadew
Yejeret wenz new yeset’teh enba
Petros tets’etsto nsiha endigeba

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 3
Ts’ewaw endetayderesegn Yehuda edil
Lijh hono wlo hala meqobelel

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 4
Petros edilgnaw alqso temare
Bet’ibiṭu Yehuda endeweta qere

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 5
Zemenwan bemulu bezimut aqet’ela
Bensiha t’erat geta beGalila

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 6
Tadsa tenesach beenbawa bizat
Egru sir tedifta Maryam Megdelawit

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 7
Amets’egnaw libe zare meche yitenyal
Behatiyat bezimut besirqot yiwanal

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 8
Wede qedemo gebru endetaymelis
Fiqrih bene serṭo hatiyate demesis

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 9
Bedelachin hulu sat’asib titeh
Bemits’athih seat keTs’adqan qot’ereh

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 10
Nech libs lenebsen honen kante gara
Beru sayizega asgebagn adera

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 1
ጠማማውን ልቤን በቃልህ አቃንተህ
አላውቀውም ብሎ ሲጠየቅ ያመጸው

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 2
ዶሮ እስኪጮህ ድረስ ሶስት ጊዜ የካደው
የጅረት ወንዝ ነው የሰጠኸው እንባ
ጴጥሮስ ተጸጽቶ ንስሐ እንዲገባ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 3
ጽዋው እንዳይደርሰኝ የይሁዳ እድል
ልጅህ ሆኖ ውሎ ኃላ መኮብለል

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 4
ጴጥሮስ እድለኛው አልቅሶ ተማረ
በትዕቢቱ ይሁዳ እንደወጣ ቀረ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 5
ዘመኗን በሙሉ በዝሙት አቃጥላ
በንስሐ ጠራት ጌታ በገሊላ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 6
ታድሳ ተነሳች በእንባዋ ብዛት
እግሩ ስር ተደፍታ ማርያም መግደላዊት

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 7
አመጸኛው ልቤ ዛሬስ መቼ ይተኛል
በሃጢያት በዝሙት በስርቆት ይዋኛል

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 8
ወደ ቀድሞ ግብሩ እንዳይመለስ
ፍቅርህ በእኔ ሰርጾ ሃጢያቴን ደምስስ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 9
በደላችን ሁሉ ሳታስብ ትተህ
በምጽአትህ ሰዓት ከጻድቃን ቆጥረህ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 10
ነጭ ልብስን ለብሰን ሆነን ካንተ ጋራ
በሩ ሳይዘጋ አስገባን አደራ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ',
        lyrics_transliteration = 'CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 1
T’amamawn libe beqalih aqanteh
Alawqewm blo sit’eyeq yameṣew

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 2
Doro iski’choh deres sost gize yekadew
Yejeret wenz new yeset’teh enba
Petros tets’etsto nsiha endigeba

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 3
Ts’ewaw endetayderesegn Yehuda edil
Lijh hono wlo hala meqobelel

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 4
Petros edilgnaw alqso temare
Bet’ibiṭu Yehuda endeweta qere

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 5
Zemenwan bemulu bezimut aqet’ela
Bensiha t’erat geta beGalila

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 6
Tadsa tenesach beenbawa bizat
Egru sir tedifta Maryam Megdelawit

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 7
Amets’egnaw libe zare meche yitenyal
Behatiyat bezimut besirqot yiwanal

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 8
Wede qedemo gebru endetaymelis
Fiqrih bene serṭo hatiyate demesis

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 9
Bedelachin hulu sat’asib titeh
Bemits’athih seat keTs’adqan qot’ereh

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 10
Nech libs lenebsen honen kante gara
Beru sayizega asgebagn adera

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ade4830b-89bf-4445-bd9e-48000a8a5305'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 1
ጠማማውን ልቤን በቃልህ አቃንተህ
አላውቀውም ብሎ ሲጠየቅ ያመጸው

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 2
ዶሮ እስኪጮህ ድረስ ሶስት ጊዜ የካደው
የጅረት ወንዝ ነው የሰጠኸው እንባ
ጴጥሮስ ተጸጽቶ ንስሐ እንዲገባ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 3
ጽዋው እንዳይደርሰኝ የይሁዳ እድል
ልጅህ ሆኖ ውሎ ኃላ መኮብለል

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 4
ጴጥሮስ እድለኛው አልቅሶ ተማረ
በትዕቢቱ ይሁዳ እንደወጣ ቀረ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 5
ዘመኗን በሙሉ በዝሙት አቃጥላ
በንስሐ ጠራት ጌታ በገሊላ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 6
ታድሳ ተነሳች በእንባዋ ብዛት
እግሩ ስር ተደፍታ ማርያም መግደላዊት

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 7
አመጸኛው ልቤ ዛሬስ መቼ ይተኛል
በሃጢያት በዝሙት በስርቆት ይዋኛል

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 8
ወደ ቀድሞ ግብሩ እንዳይመለስ
ፍቅርህ በእኔ ሰርጾ ሃጢያቴን ደምስስ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 9
በደላችን ሁሉ ሳታስብ ትተህ
በምጽአትህ ሰዓት ከጻድቃን ቆጥረህ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ

VERSE 10
ነጭ ልብስን ለብሰን ሆነን ካንተ ጋራ
በሩ ሳይዘጋ አስገባን አደራ

CHORUS
እግዚአብሔር ሆይ እርዳኝ ቸርነት አድርገህ
እድሜ ለንስሐ እንደ ህዝቅያስ ሰጥተህ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 1
T’amamawn libe beqalih aqanteh
Alawqewm blo sit’eyeq yameṣew

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 2
Doro iski’choh deres sost gize yekadew
Yejeret wenz new yeset’teh enba
Petros tets’etsto nsiha endigeba

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 3
Ts’ewaw endetayderesegn Yehuda edil
Lijh hono wlo hala meqobelel

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 4
Petros edilgnaw alqso temare
Bet’ibiṭu Yehuda endeweta qere

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 5
Zemenwan bemulu bezimut aqet’ela
Bensiha t’erat geta beGalila

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 6
Tadsa tenesach beenbawa bizat
Egru sir tedifta Maryam Megdelawit

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 7
Amets’egnaw libe zare meche yitenyal
Behatiyat bezimut besirqot yiwanal

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 8
Wede qedemo gebru endetaymelis
Fiqrih bene serṭo hatiyate demesis

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 9
Bedelachin hulu sat’asib titeh
Bemits’athih seat keTs’adqan qot’ereh

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh

VERSE 10
Nech libs lenebsen honen kante gara
Beru sayizega asgebagn adera

CHORUS
Egziabher hoy erdagn chernet adrge
Edme lensiha ende Hezekias set’teh';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ade4830b-89bf-4445-bd9e-48000a8a5305'::uuid, 'egziabher-hoy-erdagn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yesiklet-mezmur ("yesiklet mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ac397216-6384-4ae1-9677-326dda2e1e06'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
በሞት እንዲቀጣ ሁሉም ፈረዱበት/፪/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Bemot endiqet’a hulum feredubet (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ac397216-6384-4ae1-9677-326dda2e1e06'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
በሞት እንዲቀጣ ሁሉም ፈረዱበት/፪/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ac397216-6384-4ae1-9677-326dda2e1e06'::uuid, 'yesiklet-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bicawen-kesis-ashenafi-7 ("Bicawen Kesis Ashenafi # 7")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ad376409-fbcb-496c-82a2-70e3b8bc0656'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 1
ህይወቴ ምስክርህ ነው
በእግዚአብሄር የተወደደ (x2)
ይዲዲያ እኔ ነኝ ቸርነቱ የሚያኖረኝ
ሰጥቶ ሰጥቶ አያልቅበት ምህረቱ አይጎድልበት

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 2
የኔ የዋህ የኔ ጌታ በትግዕስቱ አጌጥኩበት
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 3
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው
ጊዜን አይቶ የማይከዳኝ
ይሹሩን ብሎ የሚጠራኝ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 4
በሸለቆ ታገለኝ ሰውነቴ ዳነችልኝ
አንድ አድርጎ ከቤት አውጥቶ እልፍ አደርጎ የመለሰኝ
በመዝሙሬ በስብከቴ በእልልታዬ ክበርልኝ
ብቻውን የሆነውን ሰው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 5
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 6
ጊዜን አይቶ የማይከዳኝ
ልጄ ብሎ የሚጠራኝ
በሸለቆ ታገለኝ ሰውነቴ ዳነችልኝ
አንድ አድርጎ ከቤት አውጥቶ እልፍ አደርጎ የመለሰኝ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 7
በመዝሙሬ በስብከቴ በእልልታዬ ክበርልኝ
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 8
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው
ጥበበኞች ሃያላን ሳሉ ባለጠጎች ክብር የተመሉ
ገብቶ ሳየው ከበረቴ ቃል አጠረኝ ለአንደበቴ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 9
ወድሃለው በልቤ መዝገብ እኖራለው ቃልክን ስመገብ
አድራሻዬ መስቀልህ ዘማሪ ነኝ ስለክብርህ
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 10
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 1
Hiywete miskrh new
Beegziabher yetewedede (x2)
Yididiya ene negn chernetu yemiyanoregn
Set’to set’to ayalqbet mihretu aygodlbet

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 2
Yene yewah yene Geta betgestu aget’kubet
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 3
Zemene miskrh new
Hiywete miskrh new
Gizen ayto yemaykedagn
Yishurun bilo yemit’eragn

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 4
Besheleqo tagelegn sewnete danechlgn
And adrgo kebet awt’to elf adergo yemelesegn
Bemezmure besbkete beelltaye kiberlgn
Bichawn yehonewn sew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 5
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new
Hiywete miskrh new

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 6
Gizen ayto yemaykedagn
Lije bilo yemit’eragn
Besheleqo tagelegn sewnete danechlgn
And adrgo kebet awt’to elf adergo yemelesegn

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 7
Bemezmure besbkete beelltaye kiberlgn
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 8
Zemene miskrh new
Hiywete miskrh new
T’bebegnoch hayalan salu balet’egoch kibir yetemelu
Gebto sayew keberete qal at’eregn leandebete

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 9
Wedhalew belbe mezgeb enoralew qalkn simegeb
Adrashaye mesqelh zemari negn silekbrh
Bichawn yehonewn sew
Redat yelelewn sew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 10
Endante manew yagezew
Zemene miskrh new
Hiywete miskrh new

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 1
ህይወቴ ምስክርህ ነው
በእግዚአብሄር የተወደደ (x2)
ይዲዲያ እኔ ነኝ ቸርነቱ የሚያኖረኝ
ሰጥቶ ሰጥቶ አያልቅበት ምህረቱ አይጎድልበት

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 2
የኔ የዋህ የኔ ጌታ በትግዕስቱ አጌጥኩበት
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 3
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው
ጊዜን አይቶ የማይከዳኝ
ይሹሩን ብሎ የሚጠራኝ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 4
በሸለቆ ታገለኝ ሰውነቴ ዳነችልኝ
አንድ አድርጎ ከቤት አውጥቶ እልፍ አደርጎ የመለሰኝ
በመዝሙሬ በስብከቴ በእልልታዬ ክበርልኝ
ብቻውን የሆነውን ሰው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 5
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 6
ጊዜን አይቶ የማይከዳኝ
ልጄ ብሎ የሚጠራኝ
በሸለቆ ታገለኝ ሰውነቴ ዳነችልኝ
አንድ አድርጎ ከቤት አውጥቶ እልፍ አደርጎ የመለሰኝ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 7
በመዝሙሬ በስብከቴ በእልልታዬ ክበርልኝ
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 8
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው
ጥበበኞች ሃያላን ሳሉ ባለጠጎች ክብር የተመሉ
ገብቶ ሳየው ከበረቴ ቃል አጠረኝ ለአንደበቴ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 9
ወድሃለው በልቤ መዝገብ እኖራለው ቃልክን ስመገብ
አድራሻዬ መስቀልህ ዘማሪ ነኝ ስለክብርህ
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 10
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው',
        lyrics_transliteration = 'CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 1
Hiywete miskrh new
Beegziabher yetewedede (x2)
Yididiya ene negn chernetu yemiyanoregn
Set’to set’to ayalqbet mihretu aygodlbet

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 2
Yene yewah yene Geta betgestu aget’kubet
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 3
Zemene miskrh new
Hiywete miskrh new
Gizen ayto yemaykedagn
Yishurun bilo yemit’eragn

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 4
Besheleqo tagelegn sewnete danechlgn
And adrgo kebet awt’to elf adergo yemelesegn
Bemezmure besbkete beelltaye kiberlgn
Bichawn yehonewn sew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 5
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new
Hiywete miskrh new

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 6
Gizen ayto yemaykedagn
Lije bilo yemit’eragn
Besheleqo tagelegn sewnete danechlgn
And adrgo kebet awt’to elf adergo yemelesegn

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 7
Bemezmure besbkete beelltaye kiberlgn
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 8
Zemene miskrh new
Hiywete miskrh new
T’bebegnoch hayalan salu balet’egoch kibir yetemelu
Gebto sayew keberete qal at’eregn leandebete

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 9
Wedhalew belbe mezgeb enoralew qalkn simegeb
Adrashaye mesqelh zemari negn silekbrh
Bichawn yehonewn sew
Redat yelelewn sew

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new

VERSE 10
Endante manew yagezew
Zemene miskrh new
Hiywete miskrh new

CHORUS
Bichawn yehonewn sew
Redat yelelewn sew
Endante manew yagezew
Zemene miskrh new',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ad376409-fbcb-496c-82a2-70e3b8bc0656'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 1
ህይወቴ ምስክርህ ነው
በእግዚአብሄር የተወደደ (x2)
ይዲዲያ እኔ ነኝ ቸርነቱ የሚያኖረኝ
ሰጥቶ ሰጥቶ አያልቅበት ምህረቱ አይጎድልበት

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 2
የኔ የዋህ የኔ ጌታ በትግዕስቱ አጌጥኩበት
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 3
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው
ጊዜን አይቶ የማይከዳኝ
ይሹሩን ብሎ የሚጠራኝ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 4
በሸለቆ ታገለኝ ሰውነቴ ዳነችልኝ
አንድ አድርጎ ከቤት አውጥቶ እልፍ አደርጎ የመለሰኝ
በመዝሙሬ በስብከቴ በእልልታዬ ክበርልኝ
ብቻውን የሆነውን ሰው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 5
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 6
ጊዜን አይቶ የማይከዳኝ
ልጄ ብሎ የሚጠራኝ
በሸለቆ ታገለኝ ሰውነቴ ዳነችልኝ
አንድ አድርጎ ከቤት አውጥቶ እልፍ አደርጎ የመለሰኝ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 7
በመዝሙሬ በስብከቴ በእልልታዬ ክበርልኝ
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 8
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው
ጥበበኞች ሃያላን ሳሉ ባለጠጎች ክብር የተመሉ
ገብቶ ሳየው ከበረቴ ቃል አጠረኝ ለአንደበቴ

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 9
ወድሃለው በልቤ መዝገብ እኖራለው ቃልክን ስመገብ
አድራሻዬ መስቀልህ ዘማሪ ነኝ ስለክብርህ
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው

VERSE 10
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው
ህይወቴ ምስክርህ ነው

CHORUS
ብቻውን የሆነውን ሰው
ረዳት የሌለውን ሰው
እንዳንተ ማነው ያገዘው
ዘመኔ ምስክርህ ነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ad376409-fbcb-496c-82a2-70e3b8bc0656'::uuid, 'bicawen-kesis-ashenafi-7', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- xewani-goytay ("Xewani Goytay")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b3268a1e-9b3f-4fb3-ac22-c1a4641e3977'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 1
ሓጢኣት እና ለቀምኩ ሰሃራ በጺሐ
ስጋይ ንኸጥልል ርኽሰት ተለቒሐ
ዝ''ሩባ ድነ ሞት ዘስጥም ታኼላ
መዓስ ኣጥሊሉኒ ነፍሰይ ተቓጺላ

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 2
ኣበኽራናት ትደልየኒ''ለካ ሰሚዐ
በዚ''ለኹ ዝዓወረ ልበይ እንዳ ነበዐ
ክሃድኣለይ ንልበይ ዝምሽት ንፋስ ኣውሎ
ኣድህየኒ ኦ ጎይታይ ኢየሱስ ሕጂ ተሎ

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 3
ብደም ዝተጠርየ ውርሻይ ዓዲለ
የንጀርብበኒ''ሎ ሕሰም በብእብረ
ቆሲሉ ኣእጋረይ ጉዕዞይ ኣቃሪጸ
ይጽበይ ኣለኩ ፍትወይ እንተመጸ

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 4
ኣብ ገዛና ክንደይ ጽጋብ እሞ ዘይሓለፈ
ናፊቀ ኣቦይ ከም ጊላካ ክቑጸር ሃሪፈ
ደንግጸለይ ውሉድካ ክበሃል ዘይበቅዕ
ኣድህየኒ መጥፍአይ ካብ ቤትና ከብቅዕ

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 5
ነገር ሰብ''ዩ ዝብሎ ወልፊ ሓጢኣተይ
ርስተይ መንጢሉኒ እንታይ ሓዲጉለይ
ምስ ክሱስ ሕልናይ ኣብ ቅድሚ ሓቅካ
ከመይለ ክቀውም ኣርኪሰ ፍቕርና

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 6
መሃናየ መዓስ መኒንካዮም ጠፍኤ እምበር
በዚ''ለኩ ዕርቃነይ ረዲኤትካ ይሃርር
ንጽድቅኻ ልብሰይ ንኽገብሮ ተፈዊሰ
ኣድህየኒ ውሽጠይ ብጸላኢ ከይተወርሰ

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)

VERSE 1
Hat’iat ena leqemku sehara bets’ihe
Sigay niኸt’ll riኽset teleቒhe
Z''ruba dine mot zest’m taኼla
Meas at’liluni nefsey teቓts’ila

CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)

VERSE 2
Abeኽranat tidelyeni''leka semia
Bezi''leኹ ziawere libey enda nebea
Kihadaley nilbey zimsht nifas awlo
Adhyeni o goytay Iyesus hiji telo

CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)

VERSE 3
Bidem zitet’erye wirshay adile
Yenjerbbeni''lo hisem bebebre
Qosilu aegarey guezoy aqarits’e
Yits’bey aleku fitwey entemets’e

CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)

VERSE 4
Ab gezana kindey ts’gab emo zeyhalefe
Nafiqe aboy kem gilaka kiቑts’er harife
Dengts’eley wiludka kibehal zeybeqe
Adhyeni met’fay kab betna kebqe

CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)

VERSE 5
Neger seb''yu ziblo welfi hat’iatey
Ristey ment’iluni entay hadiguley
Mis kisus hilnay ab qidmi haqka
Kemeyle kiqewm arkise fiቕrna

CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)

VERSE 6
Mehanaye meas meninkayom t’efe ember
Bezi''leku erqaney redietka yiharr
Nits’dqኻ libsey niኽgebro tefewise
Adhyeni wisht’ey bits’elai keytewerse

CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 1
ሓጢኣት እና ለቀምኩ ሰሃራ በጺሐ
ስጋይ ንኸጥልል ርኽሰት ተለቒሐ
ዝ''ሩባ ድነ ሞት ዘስጥም ታኼላ
መዓስ ኣጥሊሉኒ ነፍሰይ ተቓጺላ

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 2
ኣበኽራናት ትደልየኒ''ለካ ሰሚዐ
በዚ''ለኹ ዝዓወረ ልበይ እንዳ ነበዐ
ክሃድኣለይ ንልበይ ዝምሽት ንፋስ ኣውሎ
ኣድህየኒ ኦ ጎይታይ ኢየሱስ ሕጂ ተሎ

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 3
ብደም ዝተጠርየ ውርሻይ ዓዲለ
የንጀርብበኒ''ሎ ሕሰም በብእብረ
ቆሲሉ ኣእጋረይ ጉዕዞይ ኣቃሪጸ
ይጽበይ ኣለኩ ፍትወይ እንተመጸ

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 4
ኣብ ገዛና ክንደይ ጽጋብ እሞ ዘይሓለፈ
ናፊቀ ኣቦይ ከም ጊላካ ክቑጸር ሃሪፈ
ደንግጸለይ ውሉድካ ክበሃል ዘይበቅዕ
ኣድህየኒ መጥፍአይ ካብ ቤትና ከብቅዕ

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 5
ነገር ሰብ''ዩ ዝብሎ ወልፊ ሓጢኣተይ
ርስተይ መንጢሉኒ እንታይ ሓዲጉለይ
ምስ ክሱስ ሕልናይ ኣብ ቅድሚ ሓቅካ
ከመይለ ክቀውም ኣርኪሰ ፍቕርና

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 6
መሃናየ መዓስ መኒንካዮም ጠፍኤ እምበር
በዚ''ለኩ ዕርቃነይ ረዲኤትካ ይሃርር
ንጽድቅኻ ልብሰይ ንኽገብሮ ተፈዊሰ
ኣድህየኒ ውሽጠይ ብጸላኢ ከይተወርሰ

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)',
        lyrics_transliteration = 'CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)

VERSE 1
Hat’iat ena leqemku sehara bets’ihe
Sigay niኸt’ll riኽset teleቒhe
Z''ruba dine mot zest’m taኼla
Meas at’liluni nefsey teቓts’ila

CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)

VERSE 2
Abeኽranat tidelyeni''leka semia
Bezi''leኹ ziawere libey enda nebea
Kihadaley nilbey zimsht nifas awlo
Adhyeni o goytay Iyesus hiji telo

CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)

VERSE 3
Bidem zitet’erye wirshay adile
Yenjerbbeni''lo hisem bebebre
Qosilu aegarey guezoy aqarits’e
Yits’bey aleku fitwey entemets’e

CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)

VERSE 4
Ab gezana kindey ts’gab emo zeyhalefe
Nafiqe aboy kem gilaka kiቑts’er harife
Dengts’eley wiludka kibehal zeybeqe
Adhyeni met’fay kab betna kebqe

CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)

VERSE 5
Neger seb''yu ziblo welfi hat’iatey
Ristey ment’iluni entay hadiguley
Mis kisus hilnay ab qidmi haqka
Kemeyle kiqewm arkise fiቕrna

CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)

VERSE 6
Mehanaye meas meninkayom t’efe ember
Bezi''leku erqaney redietka yiharr
Nits’dqኻ libsey niኽgebro tefewise
Adhyeni wisht’ey bits’elai keytewerse

CHORUS
Ts’ewani goytay siley zeyttaኸs nolawiher
Nafiቑ''lo libey harifeye ab zibnka kihnger
Keywerseni ts’elam abti ruba dine mot bets’ihe
Ats’enanani bibetrኻn mirkuskan ferihe''ye (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b3268a1e-9b3f-4fb3-ac22-c1a4641e3977'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 1
ሓጢኣት እና ለቀምኩ ሰሃራ በጺሐ
ስጋይ ንኸጥልል ርኽሰት ተለቒሐ
ዝ''ሩባ ድነ ሞት ዘስጥም ታኼላ
መዓስ ኣጥሊሉኒ ነፍሰይ ተቓጺላ

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 2
ኣበኽራናት ትደልየኒ''ለካ ሰሚዐ
በዚ''ለኹ ዝዓወረ ልበይ እንዳ ነበዐ
ክሃድኣለይ ንልበይ ዝምሽት ንፋስ ኣውሎ
ኣድህየኒ ኦ ጎይታይ ኢየሱስ ሕጂ ተሎ

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 3
ብደም ዝተጠርየ ውርሻይ ዓዲለ
የንጀርብበኒ''ሎ ሕሰም በብእብረ
ቆሲሉ ኣእጋረይ ጉዕዞይ ኣቃሪጸ
ይጽበይ ኣለኩ ፍትወይ እንተመጸ

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 4
ኣብ ገዛና ክንደይ ጽጋብ እሞ ዘይሓለፈ
ናፊቀ ኣቦይ ከም ጊላካ ክቑጸር ሃሪፈ
ደንግጸለይ ውሉድካ ክበሃል ዘይበቅዕ
ኣድህየኒ መጥፍአይ ካብ ቤትና ከብቅዕ

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 5
ነገር ሰብ''ዩ ዝብሎ ወልፊ ሓጢኣተይ
ርስተይ መንጢሉኒ እንታይ ሓዲጉለይ
ምስ ክሱስ ሕልናይ ኣብ ቅድሚ ሓቅካ
ከመይለ ክቀውም ኣርኪሰ ፍቕርና

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)

VERSE 6
መሃናየ መዓስ መኒንካዮም ጠፍኤ እምበር
በዚ''ለኩ ዕርቃነይ ረዲኤትካ ይሃርር
ንጽድቅኻ ልብሰይ ንኽገብሮ ተፈዊሰ
ኣድህየኒ ውሽጠይ ብጸላኢ ከይተወርሰ

CHORUS
ጸውዓኒ ጎይታይ ስለይ ዘይትታኸስ ኖላዊሄር
ናፊቑ''ሎ ልበይ ሃሪፈዬ ኣብ ዝብንካ ክሕንገር
ከይወርሰኒ ጸላም ኣብቲ ሩባ ድነ ሞት በጺሐ
ኣጸናንዓኒ ብበትርኻን ምርኩስካን ፈሪሐ''የ (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b3268a1e-9b3f-4fb3-ac22-c1a4641e3977'::uuid, 'xewani-goytay', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- orthodox-tewahdo-mezmur-kabey-koneley ("Orthodox Tewahdo Mezmur Kabey Koneley")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f4ad9550-5dbe-4c87-bf23-efa6068c9029'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
በተዋህዶ ያደረብሽ',
        lyrics_transliteration = 'CHORUS
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
Betewahdo yaderebsh',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f4ad9550-5dbe-4c87-bf23-efa6068c9029'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f4ad9550-5dbe-4c87-bf23-efa6068c9029'::uuid, 'orthodox-tewahdo-mezmur-kabey-koneley', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- an-amazing-spiritual-song-by-d-teame-segid ("An amazing Spiritual Song By D. Teame Segid")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b05febc3-9673-416a-8179-2cc2f1b07be4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 1
ሓጢኣይ ተመንዪኒ ናባኻ ኸይምለስ
ይኣኽለኒ ኢለ ቆሪጸ ኸይብገስ
ኣእጋረይ ሓሊኹ ድሕሪት ዝመልሰኒ
ስጋእ መጋእ እብል ገለ ይሓዘኒ

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 2
ካብ ስልሚ ኣበሳ ኸተውጽኣ ንነፍሰይ
ንጵጥሮስ ዘድኋንካ ኢድካ ስደደለይ/2/
ሰላመይ ሃዲሙ መንፈሰይ ከድውን
ቃንዛ በርቲዑኒ ከልሎ ብሓዘን

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 3
ቅሳነት ሃሪፈ ንእሽቶ ዕርፍቲ
ናባኻ እጥምት ለይቲ ምስ መዓልቲ
ካባኻ ,ዪ. ተስፋይ ከረክ ዕረፍቲ
ሰላመይ ምለሶ ናይ ሰላመይ ጎይታ/2/

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 4
እቲ ዕለት ኣብ ኋጢኣት ክነብር
ኩርባ ናይ ገበነይ ናብ እምባ ከቕየር
ደፋር ,ዶ.ኣይነበርካን ልበይ ኣብቲ ጊዜ
ትብዓትካ ደኣ ኣበይ ,ሎ.ሕጂ ኣብዛ ኑዛዜ

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 5
ሽፊቱ ,ሎ,ልበይ ንስሓ ፈሪሑ
ጥበብካ ይምለስኒ ነነዌ መሪሑ/2/
ኩሉ እና ፈለጥኩ ሠናይካ ኸገብር
ኣብ ጊዜ በድል ግን ካብ ልበይ ይስወር

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 6
ከም ተፍቅረካ ,ሲ, ትፈልጣ ኢኻ ልበይ
እምነታ ኽዓብስ ባርካ ኣምላኸይ
ብዘይካኻ የልቦን ምሕረት ዝኋበኒ
ብእግረ ልቦናይ ናብ ቤትካ ኣብለኒ/2/

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss

VERSE 1
Hat’iay temenyini nabaኻ ኸymles
Yiaኽleni ile qorits’e ኸybges
Aegarey haliኹ dihrit zimelseni
Sigae megae ebl gele yihazeni

CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss

VERSE 2
Kab silmi abesa ኸtewts’a ninefsey
Nip’t’ros zedhwanka idka sidedeley (2)
Selamey hadimu menfesey kedwn
Qanza bertiuni kello bihazen

CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss

VERSE 3
Qisanet harife nieshto erfti
Nabaኻ et’mt leyti mis mealti
Kabaኻ ,yi. tesfay kerek erefti
Selamey mileso nay selamey goyta (2)

CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss

VERSE 4
Eti elet ab hwat’iat kinebr
Kurba nay gebeney nab emba keቕyer
Defar ,do.ayneberkan libey abti gize
Tibatka dea abey ,lo.hiji abza nuzaze

CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss

VERSE 5
Shfitu ,lo,libey nisha ferihu
T’bebka yimlesni nenewe merihu (2)
Kulu ena felet’ku senayka ኸgebr
Ab gize bedl gin kab libey yiswer

CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss

VERSE 6
Kem tefqreka ,si, tifelt’a iኻ libey
Emneta ኽabs barka amlaኸy
Bizeykaኻ yelbon mihret zihwabeni
Biegre libonay nab betka ableni (2)

CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 1
ሓጢኣይ ተመንዪኒ ናባኻ ኸይምለስ
ይኣኽለኒ ኢለ ቆሪጸ ኸይብገስ
ኣእጋረይ ሓሊኹ ድሕሪት ዝመልሰኒ
ስጋእ መጋእ እብል ገለ ይሓዘኒ

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 2
ካብ ስልሚ ኣበሳ ኸተውጽኣ ንነፍሰይ
ንጵጥሮስ ዘድኋንካ ኢድካ ስደደለይ/2/
ሰላመይ ሃዲሙ መንፈሰይ ከድውን
ቃንዛ በርቲዑኒ ከልሎ ብሓዘን

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 3
ቅሳነት ሃሪፈ ንእሽቶ ዕርፍቲ
ናባኻ እጥምት ለይቲ ምስ መዓልቲ
ካባኻ ,ዪ. ተስፋይ ከረክ ዕረፍቲ
ሰላመይ ምለሶ ናይ ሰላመይ ጎይታ/2/

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 4
እቲ ዕለት ኣብ ኋጢኣት ክነብር
ኩርባ ናይ ገበነይ ናብ እምባ ከቕየር
ደፋር ,ዶ.ኣይነበርካን ልበይ ኣብቲ ጊዜ
ትብዓትካ ደኣ ኣበይ ,ሎ.ሕጂ ኣብዛ ኑዛዜ

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 5
ሽፊቱ ,ሎ,ልበይ ንስሓ ፈሪሑ
ጥበብካ ይምለስኒ ነነዌ መሪሑ/2/
ኩሉ እና ፈለጥኩ ሠናይካ ኸገብር
ኣብ ጊዜ በድል ግን ካብ ልበይ ይስወር

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 6
ከም ተፍቅረካ ,ሲ, ትፈልጣ ኢኻ ልበይ
እምነታ ኽዓብስ ባርካ ኣምላኸይ
ብዘይካኻ የልቦን ምሕረት ዝኋበኒ
ብእግረ ልቦናይ ናብ ቤትካ ኣብለኒ/2/

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ',
        lyrics_transliteration = 'CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss

VERSE 1
Hat’iay temenyini nabaኻ ኸymles
Yiaኽleni ile qorits’e ኸybges
Aegarey haliኹ dihrit zimelseni
Sigae megae ebl gele yihazeni

CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss

VERSE 2
Kab silmi abesa ኸtewts’a ninefsey
Nip’t’ros zedhwanka idka sidedeley (2)
Selamey hadimu menfesey kedwn
Qanza bertiuni kello bihazen

CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss

VERSE 3
Qisanet harife nieshto erfti
Nabaኻ et’mt leyti mis mealti
Kabaኻ ,yi. tesfay kerek erefti
Selamey mileso nay selamey goyta (2)

CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss

VERSE 4
Eti elet ab hwat’iat kinebr
Kurba nay gebeney nab emba keቕyer
Defar ,do.ayneberkan libey abti gize
Tibatka dea abey ,lo.hiji abza nuzaze

CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss

VERSE 5
Shfitu ,lo,libey nisha ferihu
T’bebka yimlesni nenewe merihu (2)
Kulu ena felet’ku senayka ኸgebr
Ab gize bedl gin kab libey yiswer

CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss

VERSE 6
Kem tefqreka ,si, tifelt’a iኻ libey
Emneta ኽabs barka amlaኸy
Bizeykaኻ yelbon mihret zihwabeni
Biegre libonay nab betka ableni (2)

CHORUS
Ane zibl ts’oroy keragfo
Hilinay gin nibahgey yiኾlfo
Kisae meas ,ye,ኾn biኽlte ኽhnks
Kem bizhwa sihlኻ niabesay demss',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b05febc3-9673-416a-8179-2cc2f1b07be4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 1
ሓጢኣይ ተመንዪኒ ናባኻ ኸይምለስ
ይኣኽለኒ ኢለ ቆሪጸ ኸይብገስ
ኣእጋረይ ሓሊኹ ድሕሪት ዝመልሰኒ
ስጋእ መጋእ እብል ገለ ይሓዘኒ

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 2
ካብ ስልሚ ኣበሳ ኸተውጽኣ ንነፍሰይ
ንጵጥሮስ ዘድኋንካ ኢድካ ስደደለይ/2/
ሰላመይ ሃዲሙ መንፈሰይ ከድውን
ቃንዛ በርቲዑኒ ከልሎ ብሓዘን

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 3
ቅሳነት ሃሪፈ ንእሽቶ ዕርፍቲ
ናባኻ እጥምት ለይቲ ምስ መዓልቲ
ካባኻ ,ዪ. ተስፋይ ከረክ ዕረፍቲ
ሰላመይ ምለሶ ናይ ሰላመይ ጎይታ/2/

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 4
እቲ ዕለት ኣብ ኋጢኣት ክነብር
ኩርባ ናይ ገበነይ ናብ እምባ ከቕየር
ደፋር ,ዶ.ኣይነበርካን ልበይ ኣብቲ ጊዜ
ትብዓትካ ደኣ ኣበይ ,ሎ.ሕጂ ኣብዛ ኑዛዜ

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 5
ሽፊቱ ,ሎ,ልበይ ንስሓ ፈሪሑ
ጥበብካ ይምለስኒ ነነዌ መሪሑ/2/
ኩሉ እና ፈለጥኩ ሠናይካ ኸገብር
ኣብ ጊዜ በድል ግን ካብ ልበይ ይስወር

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ

VERSE 6
ከም ተፍቅረካ ,ሲ, ትፈልጣ ኢኻ ልበይ
እምነታ ኽዓብስ ባርካ ኣምላኸይ
ብዘይካኻ የልቦን ምሕረት ዝኋበኒ
ብእግረ ልቦናይ ናብ ቤትካ ኣብለኒ/2/

CHORUS
ኣነ ዝብል ጾሮይ ከራግፎ
ሕሊናይ ግን ንባህገይ ይኾልፎ
ክሳዕ መዓስ ,የ,ኾን ብኽልተ ኽሕንክስ
ከም ብዝኋ ሥህልኻ ንኣበሳይ ደምስስ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b05febc3-9673-416a-8179-2cc2f1b07be4'::uuid, 'an-amazing-spiritual-song-by-d-teame-segid', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tenager-alegn ("Tenager Alegn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f5105833-af00-46de-b0ac-535d4160dbfa'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 1
ሰው አድርጎኝ ሞቶ በደሙ
ኑሮዬን ባርኮት ህመሙ
ሰላም አውጥቶ ካስገባ
ልያዝ ለክብሩ ዘንባባ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 2
ሆሳና ልበል መድኃኒት
ከፍ በልልኝ የኔ አባት
ተጠምተህ እኔ ረካሁኝ
ስራህ ግሩም ነው ደነቀኝ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 3
አዝ………….
እጆቹን እዩት በእምነት
ቆሰለ ሊሰጠኝ ህይወት
በዚያ ታትሞ ውበቴ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 4
ኢየሱስ ለኔ ብርታቴ
ከማንም በላይ ከምንም
ለኔ ልዩ ነው ዘላለም
ህይወቴን ለእርሱ አስባርኬ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 5
እኔስ በረታሁ በአምላኬ
የእሾህ አክሊሉ በራሱ
ለእኔ ቤዛነው ሞገሱ
ሞቴን ገድሎታል አባቴ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 6
ሰላሜ እርሱ ነው እረፍቴ
ሰው የመሆኔ ሚስጥሩ
የማይለወጥ ነው ፍቅሩ
የገባኝ እውነት በምድር ላይ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 7
ፍቅር ነው ጌታ ኤልሻዳይ
ክብሩን ለማወጅ ተነሳው
ሲያድነኝ ከሞት እያየው
ገመናን ሸፋኝ ኪዳኔ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 8
ተራበ ውዴ መድኅኔ
ይህ ነው ያቆመኝ በፊቱ
ወሰን የሌለው ምህረቱ
ለዚህ ደግነት ውለታ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 9
ምን ይከፈላል ለጌታ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta

VERSE 1
Sew adrgogn moto bedemu
Nuroyen barkot himemu
Selam awt’to kasgeba
Liyaz lekbru zenbaba

CHORUS
Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta

VERSE 2
Hosana libel medhanit
Kef bellgn yene abat
Tet’emteh ene rekahugn
Sirah girum new deneqegn

CHORUS
Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta

VERSE 3
CHORUS
Ejochun eyut beemnet
Qosele liset’egn hiywet
Beziya tatmo wibete

CHORUS
Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta

VERSE 4
Iyesus lene birtate
Kemanm belay kemnm
Lene liyu new zelalem
Hiyweten leersu asbarke

CHORUS
Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta

VERSE 5
Enes beretahu beamlake
Yeeshoh aklilu berasu
Leene bezanew mogesu
Moten gedlotal abate

CHORUS
Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta

VERSE 6
Selame ersu new erefte
Sew yemehone mist’ru
Yemaylewet’ new fiqru
Yegebagn ewnet bemdr lay

CHORUS
Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta

VERSE 7
Fiqr new Geta elshaday
Kibrun lemawej tenesaw
Siyadnegn kemot eyayew
Gemenan shefagn kidane

CHORUS
Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta

VERSE 8
Terabe wide medhne
Yih new yaqomegn befitu
Wesen yelelew mihretu
Lezih degnet wileta

CHORUS
Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta

VERSE 9
Min yikefelal legeta

CHORUS
Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 1
ሰው አድርጎኝ ሞቶ በደሙ
ኑሮዬን ባርኮት ህመሙ
ሰላም አውጥቶ ካስገባ
ልያዝ ለክብሩ ዘንባባ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 2
ሆሳና ልበል መድኃኒት
ከፍ በልልኝ የኔ አባት
ተጠምተህ እኔ ረካሁኝ
ስራህ ግሩም ነው ደነቀኝ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 3
አዝ………….
እጆቹን እዩት በእምነት
ቆሰለ ሊሰጠኝ ህይወት
በዚያ ታትሞ ውበቴ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 4
ኢየሱስ ለኔ ብርታቴ
ከማንም በላይ ከምንም
ለኔ ልዩ ነው ዘላለም
ህይወቴን ለእርሱ አስባርኬ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 5
እኔስ በረታሁ በአምላኬ
የእሾህ አክሊሉ በራሱ
ለእኔ ቤዛነው ሞገሱ
ሞቴን ገድሎታል አባቴ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 6
ሰላሜ እርሱ ነው እረፍቴ
ሰው የመሆኔ ሚስጥሩ
የማይለወጥ ነው ፍቅሩ
የገባኝ እውነት በምድር ላይ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 7
ፍቅር ነው ጌታ ኤልሻዳይ
ክብሩን ለማወጅ ተነሳው
ሲያድነኝ ከሞት እያየው
ገመናን ሸፋኝ ኪዳኔ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 8
ተራበ ውዴ መድኅኔ
ይህ ነው ያቆመኝ በፊቱ
ወሰን የሌለው ምህረቱ
ለዚህ ደግነት ውለታ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 9
ምን ይከፈላል ለጌታ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ',
        lyrics_transliteration = 'CHORUS
Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta

VERSE 1
Sew adrgogn moto bedemu
Nuroyen barkot himemu
Selam awt’to kasgeba
Liyaz lekbru zenbaba

CHORUS
Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta

VERSE 2
Hosana libel medhanit
Kef bellgn yene abat
Tet’emteh ene rekahugn
Sirah girum new deneqegn

CHORUS
Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta

VERSE 3
CHORUS
Ejochun eyut beemnet
Qosele liset’egn hiywet
Beziya tatmo wibete

CHORUS
Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta

VERSE 4
Iyesus lene birtate
Kemanm belay kemnm
Lene liyu new zelalem
Hiyweten leersu asbarke

CHORUS
Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta

VERSE 5
Enes beretahu beamlake
Yeeshoh aklilu berasu
Leene bezanew mogesu
Moten gedlotal abate

CHORUS
Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta

VERSE 6
Selame ersu new erefte
Sew yemehone mist’ru
Yemaylewet’ new fiqru
Yegebagn ewnet bemdr lay

CHORUS
Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta

VERSE 7
Fiqr new Geta elshaday
Kibrun lemawej tenesaw
Siyadnegn kemot eyayew
Gemenan shefagn kidane

CHORUS
Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta

VERSE 8
Terabe wide medhne
Yih new yaqomegn befitu
Wesen yelelew mihretu
Lezih degnet wileta

CHORUS
Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta

VERSE 9
Min yikefelal legeta

CHORUS
Tenager alegn meskr
Tenager alegn zemr
Leqeranyo wileta armmo yelem zimta
Lemedhanealem wileta armm yelem zimta',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f5105833-af00-46de-b0ac-535d4160dbfa'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 1
ሰው አድርጎኝ ሞቶ በደሙ
ኑሮዬን ባርኮት ህመሙ
ሰላም አውጥቶ ካስገባ
ልያዝ ለክብሩ ዘንባባ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 2
ሆሳና ልበል መድኃኒት
ከፍ በልልኝ የኔ አባት
ተጠምተህ እኔ ረካሁኝ
ስራህ ግሩም ነው ደነቀኝ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 3
አዝ………….
እጆቹን እዩት በእምነት
ቆሰለ ሊሰጠኝ ህይወት
በዚያ ታትሞ ውበቴ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 4
ኢየሱስ ለኔ ብርታቴ
ከማንም በላይ ከምንም
ለኔ ልዩ ነው ዘላለም
ህይወቴን ለእርሱ አስባርኬ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 5
እኔስ በረታሁ በአምላኬ
የእሾህ አክሊሉ በራሱ
ለእኔ ቤዛነው ሞገሱ
ሞቴን ገድሎታል አባቴ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 6
ሰላሜ እርሱ ነው እረፍቴ
ሰው የመሆኔ ሚስጥሩ
የማይለወጥ ነው ፍቅሩ
የገባኝ እውነት በምድር ላይ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 7
ፍቅር ነው ጌታ ኤልሻዳይ
ክብሩን ለማወጅ ተነሳው
ሲያድነኝ ከሞት እያየው
ገመናን ሸፋኝ ኪዳኔ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 8
ተራበ ውዴ መድኅኔ
ይህ ነው ያቆመኝ በፊቱ
ወሰን የሌለው ምህረቱ
ለዚህ ደግነት ውለታ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ

VERSE 9
ምን ይከፈላል ለጌታ

CHORUS
ተናገር አለኝ መስክር
ተናገር አለኝ ዘምር
ለቀራንዮ ውለታ አርምሞ የለም ዝምታ
ለመድኃኔዓለም ውለታ አርምም የለም ዝምታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f5105833-af00-46de-b0ac-535d4160dbfa'::uuid, 'tenager-alegn', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kem-ntfue-wedi-kem-ntfue-wedi-bzemari-bereket-tkue ("… kem ntfue wedi ... kem ntfue wedi bzemari bereket tkue")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f5a70eb6-a72f-4eab-87f6-fba1a9bd7783'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 1
ዘይከም ድኽመት ዘርኪዬስ ዝሓጸሮ ንግቢ
ተጋዊ እንደየ ነይረ ዘይናቱ ኣካቢ
ብፍጽም ትሕትናይ ቃላትካ ከይስከም
ኣብ ሳግላ ትዕቢተይ ሓኹረ ክትዕነን

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 2
ትሪ ልበይ ሴርካ ከፌትካ ንዓይነይ
ቤተይ ምስ ባረኽካ (ርኤካ መድሕነይ(2))
ኣዝ
ይትረፉ ኣነ ንህያው ዝዛረብ ብልሳን

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 3
ሰማይ ኣንቃዕሪራ ዑፍካ ትምስክን
ሎቆታ ከብደይ ግን ተመስገን ደረታ
ብሰሪ ስስዕቲ ንሕግኻ እስሕታ
ሰላመይ ክትመስል ንሓጥያት ከርዲና

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 4
ሓይሊ ኢድ ምሕረትካ (ውሉድካ ኣድሒና(2))
ኣዝ
ከም ጥጦስ ኣይኮንኮን ክብርኻ ዝመሰከረ
ከም ጴጥሮስ ኣይኮንኩን ንስሓ ዝኽበረ

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 5
ንሳቶም ብግብሮም ክስመዮ ጸጋ
ንዓይ ንሓጥእ ግን ግብሪ ኣይነበረንን
ምሕረትካ ዓዚዙ ሂብካኒ ይቅሬታ
ምስጋና ይብጻሕካ (ናይ ሰራዊት ጎይታ(2))

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 6
ኣዝ
በሊሕ ብምርጋጸይ ነብሰይ ከም ትጉዳእ
ኣየናይ’ላቶ ልበይ ንቃልካ ክትርዳእ
ፈቃር ኣምላኽይ ግን እንታይ ይስኣነካ

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 7
ብግሊ ግሌኻ ንርእሰይ ጎልቢብካ
ብዝርጉሕ ቅልጽምካ መሊስካኒ ክብሪ
ክርስቶስ ተመስገን (ለዋህ ኣቦ ፍቅሪ(2))
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 8
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))

VERSE 1
Zeykem diኽmet zerkiyes zihats’ero nigbi
Tegawi endeye neyre zeynatu akabi
Bifts’m tihtnay qalatka keyskem
Ab sagla tiebitey haኹre kitenen

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))

VERSE 2
Tiri libey serka kefetka niayney
Betey mis bareኽka (rieka medhney (2))
Az
Yitrefu ane nihyaw zizareb bilsan

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))

VERSE 3
Semay anqaerira ufka timskn
Loqota kebdey gin temesgen dereta
Biseri siseti nihgኻ eshta
Selamey kitmesl nihat’yat kerdina

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))

VERSE 4
Hayli id mihretka (wiludka adhina (2))
Az
Kem t’t’os aykonkon kibrኻ zimesekere
Kem p’et’ros aykonkun nisha ziኽbere

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))

VERSE 5
Nisatom bigbrom kismeyo ts’ega
Niay nihat’e gin gibri ayneberenn
Mihretka azizu hibkani yiqreta
Misgana yibts’ahka (nay serawit goyta (2))

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))

VERSE 6
Az
Belih bimrgats’ey nebsey kem tigudae
Ayenay’lato libey niqalka kitrdae
Feqar amlaኽy gin entay yisaneka

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))

VERSE 7
Bigli gileኻ niresey golbibka
Bizrguh qilts’mka meliskani kibri
Kristos temesgen (lewah abo fiqri (2))
Kem nit’fue wedi mihretka zet’reyo

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))

VERSE 8
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 1
ዘይከም ድኽመት ዘርኪዬስ ዝሓጸሮ ንግቢ
ተጋዊ እንደየ ነይረ ዘይናቱ ኣካቢ
ብፍጽም ትሕትናይ ቃላትካ ከይስከም
ኣብ ሳግላ ትዕቢተይ ሓኹረ ክትዕነን

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 2
ትሪ ልበይ ሴርካ ከፌትካ ንዓይነይ
ቤተይ ምስ ባረኽካ (ርኤካ መድሕነይ(2))
ኣዝ
ይትረፉ ኣነ ንህያው ዝዛረብ ብልሳን

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 3
ሰማይ ኣንቃዕሪራ ዑፍካ ትምስክን
ሎቆታ ከብደይ ግን ተመስገን ደረታ
ብሰሪ ስስዕቲ ንሕግኻ እስሕታ
ሰላመይ ክትመስል ንሓጥያት ከርዲና

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 4
ሓይሊ ኢድ ምሕረትካ (ውሉድካ ኣድሒና(2))
ኣዝ
ከም ጥጦስ ኣይኮንኮን ክብርኻ ዝመሰከረ
ከም ጴጥሮስ ኣይኮንኩን ንስሓ ዝኽበረ

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 5
ንሳቶም ብግብሮም ክስመዮ ጸጋ
ንዓይ ንሓጥእ ግን ግብሪ ኣይነበረንን
ምሕረትካ ዓዚዙ ሂብካኒ ይቅሬታ
ምስጋና ይብጻሕካ (ናይ ሰራዊት ጎይታ(2))

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 6
ኣዝ
በሊሕ ብምርጋጸይ ነብሰይ ከም ትጉዳእ
ኣየናይ’ላቶ ልበይ ንቃልካ ክትርዳእ
ፈቃር ኣምላኽይ ግን እንታይ ይስኣነካ

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 7
ብግሊ ግሌኻ ንርእሰይ ጎልቢብካ
ብዝርጉሕ ቅልጽምካ መሊስካኒ ክብሪ
ክርስቶስ ተመስገን (ለዋህ ኣቦ ፍቅሪ(2))
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 8
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))',
        lyrics_transliteration = 'CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))

VERSE 1
Zeykem diኽmet zerkiyes zihats’ero nigbi
Tegawi endeye neyre zeynatu akabi
Bifts’m tihtnay qalatka keyskem
Ab sagla tiebitey haኹre kitenen

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))

VERSE 2
Tiri libey serka kefetka niayney
Betey mis bareኽka (rieka medhney (2))
Az
Yitrefu ane nihyaw zizareb bilsan

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))

VERSE 3
Semay anqaerira ufka timskn
Loqota kebdey gin temesgen dereta
Biseri siseti nihgኻ eshta
Selamey kitmesl nihat’yat kerdina

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))

VERSE 4
Hayli id mihretka (wiludka adhina (2))
Az
Kem t’t’os aykonkon kibrኻ zimesekere
Kem p’et’ros aykonkun nisha ziኽbere

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))

VERSE 5
Nisatom bigbrom kismeyo ts’ega
Niay nihat’e gin gibri ayneberenn
Mihretka azizu hibkani yiqreta
Misgana yibts’ahka (nay serawit goyta (2))

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))

VERSE 6
Az
Belih bimrgats’ey nebsey kem tigudae
Ayenay’lato libey niqalka kitrdae
Feqar amlaኽy gin entay yisaneka

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))

VERSE 7
Bigli gileኻ niresey golbibka
Bizrguh qilts’mka meliskani kibri
Kristos temesgen (lewah abo fiqri (2))
Kem nit’fue wedi mihretka zet’reyo

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))

VERSE 8
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))

CHORUS
Kem nit’fue wedi mihretka zet’reyo
Mit’fey meliska midhanka rieyo
Tariኽy qeyrka meliskani kibrey
Amlak senayatey (kiber bimezmurey (2))',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f5a70eb6-a72f-4eab-87f6-fba1a9bd7783'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 1
ዘይከም ድኽመት ዘርኪዬስ ዝሓጸሮ ንግቢ
ተጋዊ እንደየ ነይረ ዘይናቱ ኣካቢ
ብፍጽም ትሕትናይ ቃላትካ ከይስከም
ኣብ ሳግላ ትዕቢተይ ሓኹረ ክትዕነን

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 2
ትሪ ልበይ ሴርካ ከፌትካ ንዓይነይ
ቤተይ ምስ ባረኽካ (ርኤካ መድሕነይ(2))
ኣዝ
ይትረፉ ኣነ ንህያው ዝዛረብ ብልሳን

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 3
ሰማይ ኣንቃዕሪራ ዑፍካ ትምስክን
ሎቆታ ከብደይ ግን ተመስገን ደረታ
ብሰሪ ስስዕቲ ንሕግኻ እስሕታ
ሰላመይ ክትመስል ንሓጥያት ከርዲና

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 4
ሓይሊ ኢድ ምሕረትካ (ውሉድካ ኣድሒና(2))
ኣዝ
ከም ጥጦስ ኣይኮንኮን ክብርኻ ዝመሰከረ
ከም ጴጥሮስ ኣይኮንኩን ንስሓ ዝኽበረ

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 5
ንሳቶም ብግብሮም ክስመዮ ጸጋ
ንዓይ ንሓጥእ ግን ግብሪ ኣይነበረንን
ምሕረትካ ዓዚዙ ሂብካኒ ይቅሬታ
ምስጋና ይብጻሕካ (ናይ ሰራዊት ጎይታ(2))

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 6
ኣዝ
በሊሕ ብምርጋጸይ ነብሰይ ከም ትጉዳእ
ኣየናይ’ላቶ ልበይ ንቃልካ ክትርዳእ
ፈቃር ኣምላኽይ ግን እንታይ ይስኣነካ

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 7
ብግሊ ግሌኻ ንርእሰይ ጎልቢብካ
ብዝርጉሕ ቅልጽምካ መሊስካኒ ክብሪ
ክርስቶስ ተመስገን (ለዋህ ኣቦ ፍቅሪ(2))
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

VERSE 8
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))

CHORUS
ከም ንጥፉእ ወዲ ምሕረትካ ዘጥረዮ
ምጥፍእይ መሊስካ ምድሓንካ ሪእዮ
ታሪኽይ ቀይርካ መሊስካኒ ክብረይ
ኣምላክ ሰናያተይ (ክበር ብመዝሙረይ(2))'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f5a70eb6-a72f-4eab-87f6-fba1a9bd7783'::uuid, 'kem-ntfue-wedi-kem-ntfue-wedi-bzemari-bereket-tkue', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- dinigil-fetariwan-weledechiw ("Dinigil Fetariwan Weledechiw")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f6740002-cbca-4f9d-88d5-e2f0459a4478'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ''''

VERSE 1
''''''''ጨነቃት ጠበባት የዳዊት ከተማ''''''''''''
የጌታ መወለድ ተአምሩ ሲሰማ
ወረደ መልአኩ ምስራች ሊያወራ
የህፃኑ ክብር በምድር አበራ

CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ''''

VERSE 2
ይህ ምስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር(፪)
''''''''''ሰብዐ ሰገል መጡ ከሩቅ ምስራቅ አገር''''''''
ወርቅ ዕጣን ከርቤውን ለርሱ ለመገበር

CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ''''

VERSE 3
በእናቱም እቅፍ አገኙት ህፃኑን
ለዓለም ተናገሩ ንጉሥ መወለዱን
ይህ ምስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር(፪)

CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ''''

VERSE 4
''''''''''የይሁዳ ምድር ምስጋና ተመላ''''''''''
ንጉሥ መጥቷልና ከናዝሬት ገሊላ
ተአምሩን ትናገር ቤተልሔም ታውራ
ዝማሬ ሲውጣት ተረስቶ ቆጠራ

CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ''''

VERSE 5
ይህ ምስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር(፪)
''''''''''''የማይታይ ታየ ተዳሰሰ አንደ ሰው''''''''''''
በጠባቡ ደረት ዓለምን ወሰነው

CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ''''

VERSE 6
ገረማት ጥበቡ ታናሿን ሙሽራ
ተዋህዷልና ቃል ከሥጋ ጋራ
ይህ ምስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር''''''

CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ'''''
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
''''''''Dingil fet’ariwan weledechw''''''''
''''''bemet’eqleyam t’eqeqelelechw''''''''
''''yelemna sifra lengdoch marefiya''''''''
''''''girgm astegnachw bekebtoch maderiya''''

VERSE 1
''''''''ch’eneqat t’ebebat yedawit ketema''''''''''''
Yegeta meweled teamru sisema
Werede melaku misrach liyawera
Yehts’anu kibir bemdr abera

CHORUS
''''''''Dingil fet’ariwan weledechw''''''''
''''''bemet’eqleyam t’eqeqelelechw''''''''
''''yelemna sifra lengdoch marefiya''''''''
''''''girgm astegnachw bekebtoch maderiya''''

VERSE 2
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)
''''''''''seba segel met’u keruq misraq ager''''''''
Werq et’an kerbewn lersu lemegeber

CHORUS
''''''''Dingil fet’ariwan weledechw''''''''
''''''bemet’eqleyam t’eqeqelelechw''''''''
''''yelemna sifra lengdoch marefiya''''''''
''''''girgm astegnachw bekebtoch maderiya''''

VERSE 3
Beenatum eqf agegnut hits’anun
Lealem tenageru nigus meweledun
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)

CHORUS
''''''''Dingil fet’ariwan weledechw''''''''
''''''bemet’eqleyam t’eqeqelelechw''''''''
''''yelemna sifra lengdoch marefiya''''''''
''''''girgm astegnachw bekebtoch maderiya''''

VERSE 4
''''''''''yeyhuda midr misgana temela''''''''''
Nigus met’twalna kenazret gelila
Teamrun tinager betelhem tawra
Zimare siwt’at teresto qot’era

CHORUS
''''''''Dingil fet’ariwan weledechw''''''''
''''''bemet’eqleyam t’eqeqelelechw''''''''
''''yelemna sifra lengdoch marefiya''''''''
''''''girgm astegnachw bekebtoch maderiya''''

VERSE 5
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)
''''''''''''yemaytay taye tedasese ande sew''''''''''''
Bet’ebabu deret alemn wesenew

CHORUS
''''''''Dingil fet’ariwan weledechw''''''''
''''''bemet’eqleyam t’eqeqelelechw''''''''
''''yelemna sifra lengdoch marefiya''''''''
''''''girgm astegnachw bekebtoch maderiya''''

VERSE 6
Geremat t’bebu tanashwan mushra
Tewahdwalna qal kesga gara
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber''''''

CHORUS
''''''''Dingil fet’ariwan weledechw''''''''
''''''bemet’eqleyam t’eqeqelelechw''''''''
''''yelemna sifra lengdoch marefiya''''''''
''''''girgm astegnachw bekebtoch maderiya'''''
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ''''

VERSE 1
''''''''ጨነቃት ጠበባት የዳዊት ከተማ''''''''''''
የጌታ መወለድ ተአምሩ ሲሰማ
ወረደ መልአኩ ምስራች ሊያወራ
የህፃኑ ክብር በምድር አበራ

CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ''''

VERSE 2
ይህ ምስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር(፪)
''''''''''ሰብዐ ሰገል መጡ ከሩቅ ምስራቅ አገር''''''''
ወርቅ ዕጣን ከርቤውን ለርሱ ለመገበር

CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ''''

VERSE 3
በእናቱም እቅፍ አገኙት ህፃኑን
ለዓለም ተናገሩ ንጉሥ መወለዱን
ይህ ምስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር(፪)

CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ''''

VERSE 4
''''''''''የይሁዳ ምድር ምስጋና ተመላ''''''''''
ንጉሥ መጥቷልና ከናዝሬት ገሊላ
ተአምሩን ትናገር ቤተልሔም ታውራ
ዝማሬ ሲውጣት ተረስቶ ቆጠራ

CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ''''

VERSE 5
ይህ ምስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር(፪)
''''''''''''የማይታይ ታየ ተዳሰሰ አንደ ሰው''''''''''''
በጠባቡ ደረት ዓለምን ወሰነው

CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ''''

VERSE 6
ገረማት ጥበቡ ታናሿን ሙሽራ
ተዋህዷልና ቃል ከሥጋ ጋራ
ይህ ምስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር''''''

CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ''''',
        lyrics_transliteration = 'CHORUS
''''''''Dingil fet’ariwan weledechw''''''''
''''''bemet’eqleyam t’eqeqelelechw''''''''
''''yelemna sifra lengdoch marefiya''''''''
''''''girgm astegnachw bekebtoch maderiya''''

VERSE 1
''''''''ch’eneqat t’ebebat yedawit ketema''''''''''''
Yegeta meweled teamru sisema
Werede melaku misrach liyawera
Yehts’anu kibir bemdr abera

CHORUS
''''''''Dingil fet’ariwan weledechw''''''''
''''''bemet’eqleyam t’eqeqelelechw''''''''
''''yelemna sifra lengdoch marefiya''''''''
''''''girgm astegnachw bekebtoch maderiya''''

VERSE 2
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)
''''''''''seba segel met’u keruq misraq ager''''''''
Werq et’an kerbewn lersu lemegeber

CHORUS
''''''''Dingil fet’ariwan weledechw''''''''
''''''bemet’eqleyam t’eqeqelelechw''''''''
''''yelemna sifra lengdoch marefiya''''''''
''''''girgm astegnachw bekebtoch maderiya''''

VERSE 3
Beenatum eqf agegnut hits’anun
Lealem tenageru nigus meweledun
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)

CHORUS
''''''''Dingil fet’ariwan weledechw''''''''
''''''bemet’eqleyam t’eqeqelelechw''''''''
''''yelemna sifra lengdoch marefiya''''''''
''''''girgm astegnachw bekebtoch maderiya''''

VERSE 4
''''''''''yeyhuda midr misgana temela''''''''''
Nigus met’twalna kenazret gelila
Teamrun tinager betelhem tawra
Zimare siwt’at teresto qot’era

CHORUS
''''''''Dingil fet’ariwan weledechw''''''''
''''''bemet’eqleyam t’eqeqelelechw''''''''
''''yelemna sifra lengdoch marefiya''''''''
''''''girgm astegnachw bekebtoch maderiya''''

VERSE 5
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber (2)
''''''''''''yemaytay taye tedasese ande sew''''''''''''
Bet’ebabu deret alemn wesenew

CHORUS
''''''''Dingil fet’ariwan weledechw''''''''
''''''bemet’eqleyam t’eqeqelelechw''''''''
''''yelemna sifra lengdoch marefiya''''''''
''''''girgm astegnachw bekebtoch maderiya''''

VERSE 6
Geremat t’bebu tanashwan mushra
Tewahdwalna qal kesga gara
Yih mist’ir girum new keto yemayneger
Maryamm belbwa tit’ebqew neber''''''

CHORUS
''''''''Dingil fet’ariwan weledechw''''''''
''''''bemet’eqleyam t’eqeqelelechw''''''''
''''yelemna sifra lengdoch marefiya''''''''
''''''girgm astegnachw bekebtoch maderiya''''',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f6740002-cbca-4f9d-88d5-e2f0459a4478'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ''''

VERSE 1
''''''''ጨነቃት ጠበባት የዳዊት ከተማ''''''''''''
የጌታ መወለድ ተአምሩ ሲሰማ
ወረደ መልአኩ ምስራች ሊያወራ
የህፃኑ ክብር በምድር አበራ

CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ''''

VERSE 2
ይህ ምስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር(፪)
''''''''''ሰብዐ ሰገል መጡ ከሩቅ ምስራቅ አገር''''''''
ወርቅ ዕጣን ከርቤውን ለርሱ ለመገበር

CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ''''

VERSE 3
በእናቱም እቅፍ አገኙት ህፃኑን
ለዓለም ተናገሩ ንጉሥ መወለዱን
ይህ ምስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር(፪)

CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ''''

VERSE 4
''''''''''የይሁዳ ምድር ምስጋና ተመላ''''''''''
ንጉሥ መጥቷልና ከናዝሬት ገሊላ
ተአምሩን ትናገር ቤተልሔም ታውራ
ዝማሬ ሲውጣት ተረስቶ ቆጠራ

CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ''''

VERSE 5
ይህ ምስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር(፪)
''''''''''''የማይታይ ታየ ተዳሰሰ አንደ ሰው''''''''''''
በጠባቡ ደረት ዓለምን ወሰነው

CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ''''

VERSE 6
ገረማት ጥበቡ ታናሿን ሙሽራ
ተዋህዷልና ቃል ከሥጋ ጋራ
ይህ ምስጢር ግሩም ነው ከቶ የማይነገር
ማርያምም በልቧ ትጠብቀው ነበር''''''

CHORUS
''''''''ድንግል ፈጣሪዋን ወለደችው''''''''
''''''በመጠቅለያም ጠቀቀለለችው''''''''
''''የለምና ስፍራ ለንግዶች ማረፊያ''''''''
''''''ግርግም አስተኛችው በከብቶች ማደሪያ'''''
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f6740002-cbca-4f9d-88d5-e2f0459a4478'::uuid, 'dinigil-fetariwan-weledechiw', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sewoch-feredubign ("Sewoch Feredubign")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f6d329cc-491e-40f6-aa74-88e55bd10f05'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 1
ሌላ ምን ቃል አለኝ
ሊያልፉኝ አልወደዱም ነቄን ሊሰውሩ
ሰዎች ፈጠኑብኝ በደሌን ሊያወሩ
አንተ ግን ሰብስበህ በፍቅር ሸፈንከኝ

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 2
በመተላለፌ አዝነህ ሳትለየኝ
ይህ ፍቅርህ ሰበረኝ አጣበቀኝ ካንተ
ደጅህ ያመጣኛል ሁሌ እየጎተተ (2)

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 3
መርከሴን አውጀው ሲያነሱብኝ ድንጋይ
ሰወረኝ ተዓምርህ ልጅ ሳልሰቃይ
ወደህ ስለማርከኝ ብዙዎች ተከዙ
ይህ አይደለም ብለው የኃጢአት ደሞዙ

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 4
ካንተ በላይ ጌታ ማን ሊያውቀኝ ይችላል
የፍቅርህን ሚዛን ማንስ ያዛባዋል (2)

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 5
ማዳንህ ይደንቃል ለወደኩት ልጅህ
ምህረትህ ይደፋል ሁሌም በሚዛንህ
እንደሰው አይታይ ፍርድህም ይለያል
ለባርያህ አርነት በምህረት ፈርደሃል

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 6
ፍቅር እየዘረዘርክ መንገዴን የጠረክ
ስለልጅህ ጽድቅን ለድነት የፈረድክ (2)

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 7
እኔ አልፈርድብህም በሰላም ሂድ አልከኝ
ዳግም እንዳልበድል በፍቅር እያየኸኝ
ወደ ጽድቅህ ህጎች ነፍሴን አፈዛለሁ
እንዲህ ከወደድከኝ ወዴት እሄዳለሁ

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 8
አልለይም ካንተ ከፍቅር መድረኬ
አመልካለሁ አንተን ፊትህ ተንበርክኬ (2)

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Sewoch feredubgn
Ante gin adankegn (2)
Amlake hoy temesgenlgn
Getaye hoy temesgenlgn

VERSE 1
Lela min qal alegn
Liyalfugn alwededum neqen lisewru
Sewoch fet’enubgn bedelen liyaweru
Ante gin sebsbeh befqr shefenkegn

CHORUS
Sewoch feredubgn
Ante gin adankegn (2)
Amlake hoy temesgenlgn
Getaye hoy temesgenlgn

VERSE 2
Bemetelalefe azneh satleyegn
Yih fiqrh seberegn at’abeqegn kante
Dejh yamet’agnal hule eyegotete (2)

CHORUS
Sewoch feredubgn
Ante gin adankegn (2)
Amlake hoy temesgenlgn
Getaye hoy temesgenlgn

VERSE 3
Merkesen awjew siyanesubgn dingay
Seweregn teamrh lij salseqay
Wedeh silemarkegn bizuwoch tekezu
Yih aydelem bilew yehat’iat demozu

CHORUS
Sewoch feredubgn
Ante gin adankegn (2)
Amlake hoy temesgenlgn
Getaye hoy temesgenlgn

VERSE 4
Kante belay Geta man liyawqegn yichlal
Yefqrhn mizan mans yazabawal (2)

CHORUS
Sewoch feredubgn
Ante gin adankegn (2)
Amlake hoy temesgenlgn
Getaye hoy temesgenlgn

VERSE 5
Madanh yidenqal lewedekut lijh
Mihreth yidefal hulem bemizanh
Endesew aytay firdhm yileyal
Lebaryah arnet bemhret ferdehal

CHORUS
Sewoch feredubgn
Ante gin adankegn (2)
Amlake hoy temesgenlgn
Getaye hoy temesgenlgn

VERSE 6
Fiqr eyezerezerk mengeden yet’erek
Sileljh ts’dqn lednet yeferedk (2)

CHORUS
Sewoch feredubgn
Ante gin adankegn (2)
Amlake hoy temesgenlgn
Getaye hoy temesgenlgn

VERSE 7
Ene alferdbhm beselam hid alkegn
Dagm endalbedl befqr eyayeኸgn
Wede ts’dqh higoch nefsen afezalehu
Endih kewededkegn wedet ehedalehu

CHORUS
Sewoch feredubgn
Ante gin adankegn (2)
Amlake hoy temesgenlgn
Getaye hoy temesgenlgn

VERSE 8
Alleym kante kefqr medreke
Amelkalehu anten fith tenberkke (2)

CHORUS
Sewoch feredubgn
Ante gin adankegn (2)
Amlake hoy temesgenlgn
Getaye hoy temesgenlgn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 1
ሌላ ምን ቃል አለኝ
ሊያልፉኝ አልወደዱም ነቄን ሊሰውሩ
ሰዎች ፈጠኑብኝ በደሌን ሊያወሩ
አንተ ግን ሰብስበህ በፍቅር ሸፈንከኝ

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 2
በመተላለፌ አዝነህ ሳትለየኝ
ይህ ፍቅርህ ሰበረኝ አጣበቀኝ ካንተ
ደጅህ ያመጣኛል ሁሌ እየጎተተ (2)

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 3
መርከሴን አውጀው ሲያነሱብኝ ድንጋይ
ሰወረኝ ተዓምርህ ልጅ ሳልሰቃይ
ወደህ ስለማርከኝ ብዙዎች ተከዙ
ይህ አይደለም ብለው የኃጢአት ደሞዙ

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 4
ካንተ በላይ ጌታ ማን ሊያውቀኝ ይችላል
የፍቅርህን ሚዛን ማንስ ያዛባዋል (2)

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 5
ማዳንህ ይደንቃል ለወደኩት ልጅህ
ምህረትህ ይደፋል ሁሌም በሚዛንህ
እንደሰው አይታይ ፍርድህም ይለያል
ለባርያህ አርነት በምህረት ፈርደሃል

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 6
ፍቅር እየዘረዘርክ መንገዴን የጠረክ
ስለልጅህ ጽድቅን ለድነት የፈረድክ (2)

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 7
እኔ አልፈርድብህም በሰላም ሂድ አልከኝ
ዳግም እንዳልበድል በፍቅር እያየኸኝ
ወደ ጽድቅህ ህጎች ነፍሴን አፈዛለሁ
እንዲህ ከወደድከኝ ወዴት እሄዳለሁ

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 8
አልለይም ካንተ ከፍቅር መድረኬ
አመልካለሁ አንተን ፊትህ ተንበርክኬ (2)

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ',
        lyrics_transliteration = 'CHORUS
Sewoch feredubgn
Ante gin adankegn (2)
Amlake hoy temesgenlgn
Getaye hoy temesgenlgn

VERSE 1
Lela min qal alegn
Liyalfugn alwededum neqen lisewru
Sewoch fet’enubgn bedelen liyaweru
Ante gin sebsbeh befqr shefenkegn

CHORUS
Sewoch feredubgn
Ante gin adankegn (2)
Amlake hoy temesgenlgn
Getaye hoy temesgenlgn

VERSE 2
Bemetelalefe azneh satleyegn
Yih fiqrh seberegn at’abeqegn kante
Dejh yamet’agnal hule eyegotete (2)

CHORUS
Sewoch feredubgn
Ante gin adankegn (2)
Amlake hoy temesgenlgn
Getaye hoy temesgenlgn

VERSE 3
Merkesen awjew siyanesubgn dingay
Seweregn teamrh lij salseqay
Wedeh silemarkegn bizuwoch tekezu
Yih aydelem bilew yehat’iat demozu

CHORUS
Sewoch feredubgn
Ante gin adankegn (2)
Amlake hoy temesgenlgn
Getaye hoy temesgenlgn

VERSE 4
Kante belay Geta man liyawqegn yichlal
Yefqrhn mizan mans yazabawal (2)

CHORUS
Sewoch feredubgn
Ante gin adankegn (2)
Amlake hoy temesgenlgn
Getaye hoy temesgenlgn

VERSE 5
Madanh yidenqal lewedekut lijh
Mihreth yidefal hulem bemizanh
Endesew aytay firdhm yileyal
Lebaryah arnet bemhret ferdehal

CHORUS
Sewoch feredubgn
Ante gin adankegn (2)
Amlake hoy temesgenlgn
Getaye hoy temesgenlgn

VERSE 6
Fiqr eyezerezerk mengeden yet’erek
Sileljh ts’dqn lednet yeferedk (2)

CHORUS
Sewoch feredubgn
Ante gin adankegn (2)
Amlake hoy temesgenlgn
Getaye hoy temesgenlgn

VERSE 7
Ene alferdbhm beselam hid alkegn
Dagm endalbedl befqr eyayeኸgn
Wede ts’dqh higoch nefsen afezalehu
Endih kewededkegn wedet ehedalehu

CHORUS
Sewoch feredubgn
Ante gin adankegn (2)
Amlake hoy temesgenlgn
Getaye hoy temesgenlgn

VERSE 8
Alleym kante kefqr medreke
Amelkalehu anten fith tenberkke (2)

CHORUS
Sewoch feredubgn
Ante gin adankegn (2)
Amlake hoy temesgenlgn
Getaye hoy temesgenlgn',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f6d329cc-491e-40f6-aa74-88e55bd10f05'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 1
ሌላ ምን ቃል አለኝ
ሊያልፉኝ አልወደዱም ነቄን ሊሰውሩ
ሰዎች ፈጠኑብኝ በደሌን ሊያወሩ
አንተ ግን ሰብስበህ በፍቅር ሸፈንከኝ

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 2
በመተላለፌ አዝነህ ሳትለየኝ
ይህ ፍቅርህ ሰበረኝ አጣበቀኝ ካንተ
ደጅህ ያመጣኛል ሁሌ እየጎተተ (2)

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 3
መርከሴን አውጀው ሲያነሱብኝ ድንጋይ
ሰወረኝ ተዓምርህ ልጅ ሳልሰቃይ
ወደህ ስለማርከኝ ብዙዎች ተከዙ
ይህ አይደለም ብለው የኃጢአት ደሞዙ

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 4
ካንተ በላይ ጌታ ማን ሊያውቀኝ ይችላል
የፍቅርህን ሚዛን ማንስ ያዛባዋል (2)

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 5
ማዳንህ ይደንቃል ለወደኩት ልጅህ
ምህረትህ ይደፋል ሁሌም በሚዛንህ
እንደሰው አይታይ ፍርድህም ይለያል
ለባርያህ አርነት በምህረት ፈርደሃል

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 6
ፍቅር እየዘረዘርክ መንገዴን የጠረክ
ስለልጅህ ጽድቅን ለድነት የፈረድክ (2)

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 7
እኔ አልፈርድብህም በሰላም ሂድ አልከኝ
ዳግም እንዳልበድል በፍቅር እያየኸኝ
ወደ ጽድቅህ ህጎች ነፍሴን አፈዛለሁ
እንዲህ ከወደድከኝ ወዴት እሄዳለሁ

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ

VERSE 8
አልለይም ካንተ ከፍቅር መድረኬ
አመልካለሁ አንተን ፊትህ ተንበርክኬ (2)

CHORUS
ሰዎች ፈረዱብኝ
አንተ ግን አዳንከኝ (2)
አምላኬ ሆይ ተመስገንልኝ
ጌታዬ ሆይ ተመስገንልኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f6d329cc-491e-40f6-aa74-88e55bd10f05'::uuid, 'sewoch-feredubign', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- shishg-lbel-zemarit-tenaye-asefa ("SHISHG LBEL ZEMARIT TENAYE ASEFA")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f7f0231a-2a48-4cbb-9f35-def45d9d8747'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሽሽግ ልበል እርፍ ልበል ድብቅ አድርጊኝ ከክፉ
ብዙ ነው ተግዳሮቱ የሕይወት ብርቱ ሰልፉ
እንቅልፍ አጡ አይኖቼ ማልቀስ ነው እለት በለት
ቸር ልብሽ ይራራልኝ አጽናኚኝ ኪዳነምህረት

VERSE 1
የምድር ባህሪዋ ሲለዋወጥ ሰማይ ሲነጋ ሲጨልም
ህይወቴም እንደዛው ነው ጥቂት ፈገግታ ደስታ የለኝም
መከራው ሰነበተ እንዲሁ ዘመን አስቆጠረ
እፎይ የምልበት ጀንበር ለምን ከኔ ዛሬ ተሰወረ

CHORUS
ሽሽግ ልበል እርፍ ልበል ድብቅ አድርጊኝ ከክፉ
ብዙ ነው ተግዳሮቱ የሕይወት ብርቱ ሰልፉ
እንቅልፍ አጡ አይኖቼ ማልቀስ ነው እለት በለት
ቸር ልብሽ ይራራልኝ አጽናኚኝ ኪዳነምህረት

VERSE 2
ለኔም እንደ እኩዮቼ ይወግን ወጋገኑ
የመጎብኛዬ ወራት ይቸኩል ጊዜ ቀኑ
ይሁን እንደ ሰመመን ያለፈብኝ መከራ
አቁሚኝ ከለምለሙ ሰላም ካለው አዝመራ

CHORUS
ሽሽግ ልበል እርፍ ልበል ድብቅ አድርጊኝ ከክፉ
ብዙ ነው ተግዳሮቱ የሕይወት ብርቱ ሰልፉ
እንቅልፍ አጡ አይኖቼ ማልቀስ ነው እለት በለት
ቸር ልብሽ ይራራልኝ አጽናኚኝ ኪዳነምህረት

VERSE 3
በልፋት ያባከንኩት መውደቅና መነሳቴ
ደም እንባ ያለቀስኩበት ንጋትና ምሽቴ
ይሁንና እንደህልም እንደገና ልነሳ
ትላንት ብዬ ላውራው ላላስብም ይረሳ

CHORUS
ሽሽግ ልበል እርፍ ልበል ድብቅ አድርጊኝ ከክፉ
ብዙ ነው ተግዳሮቱ የሕይወት ብርቱ ሰልፉ
እንቅልፍ አጡ አይኖቼ ማልቀስ ነው እለት በለት
ቸር ልብሽ ይራራልኝ አጽናኚኝ ኪዳነምህረት

VERSE 4
አፅናኝኝ ኪዳነምህረት አፅናኝኝ ደጓ እመቤት
አፅናኝኝ ርህሪቷ አበርቺኝ አማላጂቷ

CHORUS
ሽሽግ ልበል እርፍ ልበል ድብቅ አድርጊኝ ከክፉ
ብዙ ነው ተግዳሮቱ የሕይወት ብርቱ ሰልፉ
እንቅልፍ አጡ አይኖቼ ማልቀስ ነው እለት በለት
ቸር ልብሽ ይራራልኝ አጽናኚኝ ኪዳነምህረት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Shshg libel erf libel dibq adrgign kekfu
Bizu new tegdarotu yehywet birtu selfu
Enqlf at’u aynoche malqes new elet belet
Cher libsh yiraralgn ats’nagnign kidanemhret

VERSE 1
Yemdr bahriwa silewawet’ semay sinega sich’elm
Hiywetem endezaw new t’qit fegegta desta yelegnm
Mekeraw senebete endihu zemen asqot’ere
Efoy yemlbet jenber lemn kene zare tesewere

CHORUS
Shshg libel erf libel dibq adrgign kekfu
Bizu new tegdarotu yehywet birtu selfu
Enqlf at’u aynoche malqes new elet belet
Cher libsh yiraralgn ats’nagnign kidanemhret

VERSE 2
Lenem ende ekuyoche yiwegn wegagenu
Yemegobgnaye werat yichekul gize qenu
Yihun ende sememen yalefebgn mekera
Aqumign kelemlemu selam kalew azmera

CHORUS
Shshg libel erf libel dibq adrgign kekfu
Bizu new tegdarotu yehywet birtu selfu
Enqlf at’u aynoche malqes new elet belet
Cher libsh yiraralgn ats’nagnign kidanemhret

VERSE 3
Belfat yabakenkut mewdeqna menesate
Dem enba yaleqeskubet nigatna mishte
Yihunna endehlm endegena linesa
Tilant biye lawraw lalasbm yiresa

CHORUS
Shshg libel erf libel dibq adrgign kekfu
Bizu new tegdarotu yehywet birtu selfu
Enqlf at’u aynoche malqes new elet belet
Cher libsh yiraralgn ats’nagnign kidanemhret

VERSE 4
Ats’nagngn kidanemhret ats’nagngn degwa emebet
Ats’nagngn rihritwa aberchign amalajitwa

CHORUS
Shshg libel erf libel dibq adrgign kekfu
Bizu new tegdarotu yehywet birtu selfu
Enqlf at’u aynoche malqes new elet belet
Cher libsh yiraralgn ats’nagnign kidanemhret'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሽሽግ ልበል እርፍ ልበል ድብቅ አድርጊኝ ከክፉ
ብዙ ነው ተግዳሮቱ የሕይወት ብርቱ ሰልፉ
እንቅልፍ አጡ አይኖቼ ማልቀስ ነው እለት በለት
ቸር ልብሽ ይራራልኝ አጽናኚኝ ኪዳነምህረት

VERSE 1
የምድር ባህሪዋ ሲለዋወጥ ሰማይ ሲነጋ ሲጨልም
ህይወቴም እንደዛው ነው ጥቂት ፈገግታ ደስታ የለኝም
መከራው ሰነበተ እንዲሁ ዘመን አስቆጠረ
እፎይ የምልበት ጀንበር ለምን ከኔ ዛሬ ተሰወረ

CHORUS
ሽሽግ ልበል እርፍ ልበል ድብቅ አድርጊኝ ከክፉ
ብዙ ነው ተግዳሮቱ የሕይወት ብርቱ ሰልፉ
እንቅልፍ አጡ አይኖቼ ማልቀስ ነው እለት በለት
ቸር ልብሽ ይራራልኝ አጽናኚኝ ኪዳነምህረት

VERSE 2
ለኔም እንደ እኩዮቼ ይወግን ወጋገኑ
የመጎብኛዬ ወራት ይቸኩል ጊዜ ቀኑ
ይሁን እንደ ሰመመን ያለፈብኝ መከራ
አቁሚኝ ከለምለሙ ሰላም ካለው አዝመራ

CHORUS
ሽሽግ ልበል እርፍ ልበል ድብቅ አድርጊኝ ከክፉ
ብዙ ነው ተግዳሮቱ የሕይወት ብርቱ ሰልፉ
እንቅልፍ አጡ አይኖቼ ማልቀስ ነው እለት በለት
ቸር ልብሽ ይራራልኝ አጽናኚኝ ኪዳነምህረት

VERSE 3
በልፋት ያባከንኩት መውደቅና መነሳቴ
ደም እንባ ያለቀስኩበት ንጋትና ምሽቴ
ይሁንና እንደህልም እንደገና ልነሳ
ትላንት ብዬ ላውራው ላላስብም ይረሳ

CHORUS
ሽሽግ ልበል እርፍ ልበል ድብቅ አድርጊኝ ከክፉ
ብዙ ነው ተግዳሮቱ የሕይወት ብርቱ ሰልፉ
እንቅልፍ አጡ አይኖቼ ማልቀስ ነው እለት በለት
ቸር ልብሽ ይራራልኝ አጽናኚኝ ኪዳነምህረት

VERSE 4
አፅናኝኝ ኪዳነምህረት አፅናኝኝ ደጓ እመቤት
አፅናኝኝ ርህሪቷ አበርቺኝ አማላጂቷ

CHORUS
ሽሽግ ልበል እርፍ ልበል ድብቅ አድርጊኝ ከክፉ
ብዙ ነው ተግዳሮቱ የሕይወት ብርቱ ሰልፉ
እንቅልፍ አጡ አይኖቼ ማልቀስ ነው እለት በለት
ቸር ልብሽ ይራራልኝ አጽናኚኝ ኪዳነምህረት',
        lyrics_transliteration = 'CHORUS
Shshg libel erf libel dibq adrgign kekfu
Bizu new tegdarotu yehywet birtu selfu
Enqlf at’u aynoche malqes new elet belet
Cher libsh yiraralgn ats’nagnign kidanemhret

VERSE 1
Yemdr bahriwa silewawet’ semay sinega sich’elm
Hiywetem endezaw new t’qit fegegta desta yelegnm
Mekeraw senebete endihu zemen asqot’ere
Efoy yemlbet jenber lemn kene zare tesewere

CHORUS
Shshg libel erf libel dibq adrgign kekfu
Bizu new tegdarotu yehywet birtu selfu
Enqlf at’u aynoche malqes new elet belet
Cher libsh yiraralgn ats’nagnign kidanemhret

VERSE 2
Lenem ende ekuyoche yiwegn wegagenu
Yemegobgnaye werat yichekul gize qenu
Yihun ende sememen yalefebgn mekera
Aqumign kelemlemu selam kalew azmera

CHORUS
Shshg libel erf libel dibq adrgign kekfu
Bizu new tegdarotu yehywet birtu selfu
Enqlf at’u aynoche malqes new elet belet
Cher libsh yiraralgn ats’nagnign kidanemhret

VERSE 3
Belfat yabakenkut mewdeqna menesate
Dem enba yaleqeskubet nigatna mishte
Yihunna endehlm endegena linesa
Tilant biye lawraw lalasbm yiresa

CHORUS
Shshg libel erf libel dibq adrgign kekfu
Bizu new tegdarotu yehywet birtu selfu
Enqlf at’u aynoche malqes new elet belet
Cher libsh yiraralgn ats’nagnign kidanemhret

VERSE 4
Ats’nagngn kidanemhret ats’nagngn degwa emebet
Ats’nagngn rihritwa aberchign amalajitwa

CHORUS
Shshg libel erf libel dibq adrgign kekfu
Bizu new tegdarotu yehywet birtu selfu
Enqlf at’u aynoche malqes new elet belet
Cher libsh yiraralgn ats’nagnign kidanemhret',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f7f0231a-2a48-4cbb-9f35-def45d9d8747'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሽሽግ ልበል እርፍ ልበል ድብቅ አድርጊኝ ከክፉ
ብዙ ነው ተግዳሮቱ የሕይወት ብርቱ ሰልፉ
እንቅልፍ አጡ አይኖቼ ማልቀስ ነው እለት በለት
ቸር ልብሽ ይራራልኝ አጽናኚኝ ኪዳነምህረት

VERSE 1
የምድር ባህሪዋ ሲለዋወጥ ሰማይ ሲነጋ ሲጨልም
ህይወቴም እንደዛው ነው ጥቂት ፈገግታ ደስታ የለኝም
መከራው ሰነበተ እንዲሁ ዘመን አስቆጠረ
እፎይ የምልበት ጀንበር ለምን ከኔ ዛሬ ተሰወረ

CHORUS
ሽሽግ ልበል እርፍ ልበል ድብቅ አድርጊኝ ከክፉ
ብዙ ነው ተግዳሮቱ የሕይወት ብርቱ ሰልፉ
እንቅልፍ አጡ አይኖቼ ማልቀስ ነው እለት በለት
ቸር ልብሽ ይራራልኝ አጽናኚኝ ኪዳነምህረት

VERSE 2
ለኔም እንደ እኩዮቼ ይወግን ወጋገኑ
የመጎብኛዬ ወራት ይቸኩል ጊዜ ቀኑ
ይሁን እንደ ሰመመን ያለፈብኝ መከራ
አቁሚኝ ከለምለሙ ሰላም ካለው አዝመራ

CHORUS
ሽሽግ ልበል እርፍ ልበል ድብቅ አድርጊኝ ከክፉ
ብዙ ነው ተግዳሮቱ የሕይወት ብርቱ ሰልፉ
እንቅልፍ አጡ አይኖቼ ማልቀስ ነው እለት በለት
ቸር ልብሽ ይራራልኝ አጽናኚኝ ኪዳነምህረት

VERSE 3
በልፋት ያባከንኩት መውደቅና መነሳቴ
ደም እንባ ያለቀስኩበት ንጋትና ምሽቴ
ይሁንና እንደህልም እንደገና ልነሳ
ትላንት ብዬ ላውራው ላላስብም ይረሳ

CHORUS
ሽሽግ ልበል እርፍ ልበል ድብቅ አድርጊኝ ከክፉ
ብዙ ነው ተግዳሮቱ የሕይወት ብርቱ ሰልፉ
እንቅልፍ አጡ አይኖቼ ማልቀስ ነው እለት በለት
ቸር ልብሽ ይራራልኝ አጽናኚኝ ኪዳነምህረት

VERSE 4
አፅናኝኝ ኪዳነምህረት አፅናኝኝ ደጓ እመቤት
አፅናኝኝ ርህሪቷ አበርቺኝ አማላጂቷ

CHORUS
ሽሽግ ልበል እርፍ ልበል ድብቅ አድርጊኝ ከክፉ
ብዙ ነው ተግዳሮቱ የሕይወት ብርቱ ሰልፉ
እንቅልፍ አጡ አይኖቼ ማልቀስ ነው እለት በለት
ቸር ልብሽ ይራራልኝ አጽናኚኝ ኪዳነምህረት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f7f0231a-2a48-4cbb-9f35-def45d9d8747'::uuid, 'shishg-lbel-zemarit-tenaye-asefa', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ney-ney-emebete ("Ney Ney Emebete")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f95894ff-1ad7-4cb9-a460-45b1531bb421'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ነይ ነይ እመቤቴ',
        lyrics_transliteration = 'CHORUS
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
Ney ney Emebete',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f95894ff-1ad7-4cb9-a460-45b1531bb421'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f95894ff-1ad7-4cb9-a460-45b1531bb421'::uuid, 'ney-ney-emebete', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- amisitu-hazenat ("Amisitu Hazenat")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'f7cf6be0-42f0-4a5f-b710-83598e028d97'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 1
በመምጻቱ ወር በአርባኛው ቀን
ስምዖን አረጋዊ ታቀፈና ጌታን
ትንቢት ተናገረ ተገልፆለት ሞቱ
በነፍስሽ ሰይፍ ያልፋል አንቺም እናቲቱ

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 2
ይህንን መከራ ሲሰማ ጆሮዋ
አምርራ አለቀሰች አልቆም አለ እንባዋ

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 3
በ12 ዓመቱ ለማክበር በዓልን
በኢየሩሳሌም ቢገኝ አማኑኤል
ሲጠይቅ ሲሰማ በቤተ መቅደሱ
የኦሪት ካህናት ሲደነቁ በእርሱ

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 4
እስከ ሦስት ቀን ድረስ ብታጣው ፈልጋ
ልቧ ተገረፈ በኃዘን አለንጋ

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 5
ጠዋት በማለዳ በጲላጦስ ደጅ
ሲጸናበት አይታ የጨካኞች እጅ
እርቃኑን አድርገው ያለአንዳች ጥፋት
ከግንድ ጋር አስረው ጀርባው ሲገርፉት

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 6
እንዴትስ አታለቅስ እንዴት አታነባ
ሲገርፉት ሲያዳፉት ልጇን እንደሌባ

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 7
የዓለሙን ፈጣሪ የዓለሙን ዳኛ
ንፁሁን ጌታ መስሏቸው ቀማኛ
እጁና እግሮቹን በችንካር ወጥረው
በወንበዴ መሀል ሰቅለውት ብታየው

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 8
ድንግል አለቀሰች አልቻለች መጽናናት
እንባዋ ወረደ እንደ ክረምት ጅረት

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 9
ዮሴፍ ኒቆዲሞስ በአንድ ሲማከሩ
ቅዱስ ኃያል ብለው ገንዘው ሊቀብሩ
በአዲስ መቃብር በ11ኛው ሰዓት
ስጋውን አኑረው በድንጋይ ቢዘጉት

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 10
እያለች አነባች አንድ ልጄ እኮ ነው
ከሱ የሚቀድም ተከታይ የሌለው

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 1
Bememts’atu wer bearbagnaw qen
Simon aregawi taqefena getan
Tinbit tenagere tegelts’olet motu
Benefssh seyf yalfal anchim enatitu

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 2
Yihnn mekera sisema jorowa
Amrra aleqesech alqom ale enbawa

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 3
Be12 ametu lemakber bealn
Beiyerusalem bigegn Amanuel
Sit’eyq sisema bebete meqdesu
Yeorit kahnat sidenequ beersu

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 4
Eske sost qen dires bitat’aw felga
Libwa tegerefe behazen alenga

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 5
T’ewat bemaleda bep’ilat’os dej
Sits’enabet ayta yech’ekagnoch ej
Erqanun adrgew yaleandach t’fat
Kegnd gar asrew jerbaw sigerfut

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 6
Endets ataleqs endet ataneba
Sigerfut siyadafut lijwan endeleba

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 7
Yealemun fet’ari yealemun dagna
Nits’uhun Geta meslwachew qemagna
Ejuna egrochun bechnkar wet’rew
Bewenbede mehel seqlewt bitayew

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 8
Dingil aleqesech alchalech mets’nanat
Enbawa werede ende kiremt jiret

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 9
Yosef niqodimos beand simakeru
Kidus hayal bilew genzew liqebru
Beadis meqabr be11gnaw seat
Sigawn anurew bedngay bizegut

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 10
Eyalech anebach and lije eko new
Kesu yemiqedm teketay yelelew

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 1
በመምጻቱ ወር በአርባኛው ቀን
ስምዖን አረጋዊ ታቀፈና ጌታን
ትንቢት ተናገረ ተገልፆለት ሞቱ
በነፍስሽ ሰይፍ ያልፋል አንቺም እናቲቱ

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 2
ይህንን መከራ ሲሰማ ጆሮዋ
አምርራ አለቀሰች አልቆም አለ እንባዋ

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 3
በ12 ዓመቱ ለማክበር በዓልን
በኢየሩሳሌም ቢገኝ አማኑኤል
ሲጠይቅ ሲሰማ በቤተ መቅደሱ
የኦሪት ካህናት ሲደነቁ በእርሱ

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 4
እስከ ሦስት ቀን ድረስ ብታጣው ፈልጋ
ልቧ ተገረፈ በኃዘን አለንጋ

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 5
ጠዋት በማለዳ በጲላጦስ ደጅ
ሲጸናበት አይታ የጨካኞች እጅ
እርቃኑን አድርገው ያለአንዳች ጥፋት
ከግንድ ጋር አስረው ጀርባው ሲገርፉት

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 6
እንዴትስ አታለቅስ እንዴት አታነባ
ሲገርፉት ሲያዳፉት ልጇን እንደሌባ

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 7
የዓለሙን ፈጣሪ የዓለሙን ዳኛ
ንፁሁን ጌታ መስሏቸው ቀማኛ
እጁና እግሮቹን በችንካር ወጥረው
በወንበዴ መሀል ሰቅለውት ብታየው

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 8
ድንግል አለቀሰች አልቻለች መጽናናት
እንባዋ ወረደ እንደ ክረምት ጅረት

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 9
ዮሴፍ ኒቆዲሞስ በአንድ ሲማከሩ
ቅዱስ ኃያል ብለው ገንዘው ሊቀብሩ
በአዲስ መቃብር በ11ኛው ሰዓት
ስጋውን አኑረው በድንጋይ ቢዘጉት

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 10
እያለች አነባች አንድ ልጄ እኮ ነው
ከሱ የሚቀድም ተከታይ የሌለው

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)',
        lyrics_transliteration = 'CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 1
Bememts’atu wer bearbagnaw qen
Simon aregawi taqefena getan
Tinbit tenagere tegelts’olet motu
Benefssh seyf yalfal anchim enatitu

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 2
Yihnn mekera sisema jorowa
Amrra aleqesech alqom ale enbawa

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 3
Be12 ametu lemakber bealn
Beiyerusalem bigegn Amanuel
Sit’eyq sisema bebete meqdesu
Yeorit kahnat sidenequ beersu

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 4
Eske sost qen dires bitat’aw felga
Libwa tegerefe behazen alenga

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 5
T’ewat bemaleda bep’ilat’os dej
Sits’enabet ayta yech’ekagnoch ej
Erqanun adrgew yaleandach t’fat
Kegnd gar asrew jerbaw sigerfut

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 6
Endets ataleqs endet ataneba
Sigerfut siyadafut lijwan endeleba

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 7
Yealemun fet’ari yealemun dagna
Nits’uhun Geta meslwachew qemagna
Ejuna egrochun bechnkar wet’rew
Bewenbede mehel seqlewt bitayew

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 8
Dingil aleqesech alchalech mets’nanat
Enbawa werede ende kiremt jiret

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 9
Yosef niqodimos beand simakeru
Kidus hayal bilew genzew liqebru
Beadis meqabr be11gnaw seat
Sigawn anurew bedngay bizegut

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)

VERSE 10
Eyalech anebach and lije eko new
Kesu yemiqedm teketay yelelew

CHORUS
Azenech Dingil aleqesech fits’um amrra
Beand lijwa miknyat dersobat mekera (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'f7cf6be0-42f0-4a5f-b710-83598e028d97'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 1
በመምጻቱ ወር በአርባኛው ቀን
ስምዖን አረጋዊ ታቀፈና ጌታን
ትንቢት ተናገረ ተገልፆለት ሞቱ
በነፍስሽ ሰይፍ ያልፋል አንቺም እናቲቱ

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 2
ይህንን መከራ ሲሰማ ጆሮዋ
አምርራ አለቀሰች አልቆም አለ እንባዋ

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 3
በ12 ዓመቱ ለማክበር በዓልን
በኢየሩሳሌም ቢገኝ አማኑኤል
ሲጠይቅ ሲሰማ በቤተ መቅደሱ
የኦሪት ካህናት ሲደነቁ በእርሱ

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 4
እስከ ሦስት ቀን ድረስ ብታጣው ፈልጋ
ልቧ ተገረፈ በኃዘን አለንጋ

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 5
ጠዋት በማለዳ በጲላጦስ ደጅ
ሲጸናበት አይታ የጨካኞች እጅ
እርቃኑን አድርገው ያለአንዳች ጥፋት
ከግንድ ጋር አስረው ጀርባው ሲገርፉት

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 6
እንዴትስ አታለቅስ እንዴት አታነባ
ሲገርፉት ሲያዳፉት ልጇን እንደሌባ

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 7
የዓለሙን ፈጣሪ የዓለሙን ዳኛ
ንፁሁን ጌታ መስሏቸው ቀማኛ
እጁና እግሮቹን በችንካር ወጥረው
በወንበዴ መሀል ሰቅለውት ብታየው

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 8
ድንግል አለቀሰች አልቻለች መጽናናት
እንባዋ ወረደ እንደ ክረምት ጅረት

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 9
ዮሴፍ ኒቆዲሞስ በአንድ ሲማከሩ
ቅዱስ ኃያል ብለው ገንዘው ሊቀብሩ
በአዲስ መቃብር በ11ኛው ሰዓት
ስጋውን አኑረው በድንጋይ ቢዘጉት

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)

VERSE 10
እያለች አነባች አንድ ልጄ እኮ ነው
ከሱ የሚቀድም ተከታይ የሌለው

CHORUS
አዘነች ድንግል አለቀሰች ፍጹም አምርራ
በአንድ ልጇ ምክንያት ደርሶባት መከራ(2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'f7cf6be0-42f0-4a5f-b710-83598e028d97'::uuid, 'amisitu-hazenat', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ygrem-aleku-bereket-tikue ("Ygrem aleku / Bereket tikue")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'faeae9fc-2656-4d5d-badc-f1fb75b15e3b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ሂወትካ ሂብካዮ ንባርያኻ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Hiwetka hibkayo nibaryaኻ'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'faeae9fc-2656-4d5d-badc-f1fb75b15e3b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ሂወትካ ሂብካዮ ንባርያኻ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'faeae9fc-2656-4d5d-badc-f1fb75b15e3b'::uuid, 'ygrem-aleku-bereket-tikue', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yemitebikegn-ayitegnam-2354 ("Yemitebikegn Ayitegnam")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'fec8de1a-3a57-439b-abab-d347ce5ef80a'::uuid
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
    WHERE import_id = 'fec8de1a-3a57-439b-abab-d347ce5ef80a'::uuid
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
        'fec8de1a-3a57-439b-abab-d347ce5ef80a'::uuid, 'yemitebikegn-ayitegnam-2354', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yene-mehari-hulun-merishaye ("Yene Mehari Hulun Merishaye")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ffd24ddc-7455-4786-ad9f-333f4bfdbdf3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ከእዳ ከፈታኝ በነፃ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Keeda kefetagn benets’a'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ffd24ddc-7455-4786-ad9f-333f4bfdbdf3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
ከእዳ ከፈታኝ በነፃ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ffd24ddc-7455-4786-ad9f-333f4bfdbdf3'::uuid, 'yene-mehari-hulun-merishaye', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tiwilid-hulu ("Tiwilid Hulu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c3bf7159-167c-4a64-b448-cdce00697601'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትውልድ ሁሉ ብፅዕናሽን ክብርሽን
ሁልጊዜ ያደንቃሉ መመኪያችን
መጠጊያችን ተስፋችን አንቺ ነሽ እያሉ/፪/
ያገኑሻል ያከብሩሻል ፍጥረታት በሙሉ/፬/

VERSE 1
ትውልድ ሁሉ ብፅዕናሽን ክብርሽን
ሁልጊዜ ያደንቃሉ መመኪያችን
መጠጊያችን ተስፋችን አንቺ ነሽ እያሉ/፪/
ያገኑሻል ያከብሩሻል ፍጥረታት በሙሉ/፬/

CHORUS
ትውልድ ሁሉ ብፅዕናሽን ክብርሽን
ሁልጊዜ ያደንቃሉ መመኪያችን
መጠጊያችን ተስፋችን አንቺ ነሽ እያሉ/፪/
ያገኑሻል ያከብሩሻል ፍጥረታት በሙሉ/፬/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Tiwld hulu bits’enashn kibrshn
Hulgize yadenqalu memekiyachn
Met’egiyachn tesfachn anchi nesh eyalu (2)
Yagenushal yakebrushal fit’retat bemulu (4)

VERSE 1
Tiwld hulu bits’enashn kibrshn
Hulgize yadenqalu memekiyachn
Met’egiyachn tesfachn anchi nesh eyalu (2)
Yagenushal yakebrushal fit’retat bemulu (4)

CHORUS
Tiwld hulu bits’enashn kibrshn
Hulgize yadenqalu memekiyachn
Met’egiyachn tesfachn anchi nesh eyalu (2)
Yagenushal yakebrushal fit’retat bemulu (4)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ትውልድ ሁሉ ብፅዕናሽን ክብርሽን
ሁልጊዜ ያደንቃሉ መመኪያችን
መጠጊያችን ተስፋችን አንቺ ነሽ እያሉ/፪/
ያገኑሻል ያከብሩሻል ፍጥረታት በሙሉ/፬/

VERSE 1
ትውልድ ሁሉ ብፅዕናሽን ክብርሽን
ሁልጊዜ ያደንቃሉ መመኪያችን
መጠጊያችን ተስፋችን አንቺ ነሽ እያሉ/፪/
ያገኑሻል ያከብሩሻል ፍጥረታት በሙሉ/፬/

CHORUS
ትውልድ ሁሉ ብፅዕናሽን ክብርሽን
ሁልጊዜ ያደንቃሉ መመኪያችን
መጠጊያችን ተስፋችን አንቺ ነሽ እያሉ/፪/
ያገኑሻል ያከብሩሻል ፍጥረታት በሙሉ/፬/',
        lyrics_transliteration = 'CHORUS
Tiwld hulu bits’enashn kibrshn
Hulgize yadenqalu memekiyachn
Met’egiyachn tesfachn anchi nesh eyalu (2)
Yagenushal yakebrushal fit’retat bemulu (4)

VERSE 1
Tiwld hulu bits’enashn kibrshn
Hulgize yadenqalu memekiyachn
Met’egiyachn tesfachn anchi nesh eyalu (2)
Yagenushal yakebrushal fit’retat bemulu (4)

CHORUS
Tiwld hulu bits’enashn kibrshn
Hulgize yadenqalu memekiyachn
Met’egiyachn tesfachn anchi nesh eyalu (2)
Yagenushal yakebrushal fit’retat bemulu (4)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c3bf7159-167c-4a64-b448-cdce00697601'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ትውልድ ሁሉ ብፅዕናሽን ክብርሽን
ሁልጊዜ ያደንቃሉ መመኪያችን
መጠጊያችን ተስፋችን አንቺ ነሽ እያሉ/፪/
ያገኑሻል ያከብሩሻል ፍጥረታት በሙሉ/፬/

VERSE 1
ትውልድ ሁሉ ብፅዕናሽን ክብርሽን
ሁልጊዜ ያደንቃሉ መመኪያችን
መጠጊያችን ተስፋችን አንቺ ነሽ እያሉ/፪/
ያገኑሻል ያከብሩሻል ፍጥረታት በሙሉ/፬/

CHORUS
ትውልድ ሁሉ ብፅዕናሽን ክብርሽን
ሁልጊዜ ያደንቃሉ መመኪያችን
መጠጊያችን ተስፋችን አንቺ ነሽ እያሉ/፪/
ያገኑሻል ያከብሩሻል ፍጥረታት በሙሉ/፬/'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c3bf7159-167c-4a64-b448-cdce00697601'::uuid, 'tiwilid-hulu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yekal-kidan-hager ("Yekal Kidan Hager")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'fb055dc3-31af-4c83-af2d-22b61aee5289'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 1
በከንቱ ምኞት ቃየል ተነሳሳ
በቁጣ በበቀል ድንጋዩን አነሳ
እርሱም ላይደሰት ላይቀር መቅበዝበዙ
በራሱም ይደርሳል ብዙ ነው መዘዙ

CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 2
ግፍና መከራ ተፈራርቆብናል
ሰው በሰው ሲታረድ ባይናችን አይቸናል
ይብቃ ሰቆቃችን አይችል ተከሻችን
በምህረት እጅህ አብሰው እንባችን

CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 3
የቀደመው ጠላት መከራን ያበዛል
በልጆቹ መሀል እንክርዳድ የዘራል
በመከር ሰብስቦ ላይቀር ማቃጠሉ
አንተ ግን ተስፋ ነህ ላመኑብህ ሁሉ

CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 4
የራቀውን ማቅረብ ትችልበቻለህ
የወደቀን ማንሳት አምላኬ ታውቃለህ
እጆቿን ዘርግታ ማረኝ ትልሀለች
እማማ ኢትዮጵያ አንትን ትጣራለች

CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 5
የመፅናናት አምላክ የቸርነት ጌታ
የበረከት ንጉስ ከቶ ማትረታ
መፍትሄው ካንተ ነው የሰላም አባት
እሩሩሁ ጌታ አንተው ታረቃት

CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ende qedmo hulu zarem asbat
Ityop’ya hegerachn antew t’ebqat
Yeqal kidan heger lijochh nenna
Selamh yibzaln yiqr belenna

VERSE 1
Bekentu mignot qayel tenesasa
Bequt’a bebeqel dingayun anesa
Ersum laydeset layqer meqbezbezu
Berasum yidersal bizu new mezezu

CHORUS
Ende qedmo hulu zarem asbat
Ityop’ya hegerachn antew t’ebqat
Yeqal kidan heger lijochh nenna
Selamh yibzaln yiqr belenna

VERSE 2
Gifna mekera teferarqobnal
Sew besew sitared baynachn aychenal
Yibqa seqoqachn aychl tekeshachn
Bemhret ejh absew enbachn

CHORUS
Ende qedmo hulu zarem asbat
Ityop’ya hegerachn antew t’ebqat
Yeqal kidan heger lijochh nenna
Selamh yibzaln yiqr belenna

VERSE 3
Yeqedemew t’elat mekeran yabezal
Beljochu mehel enkrdad yezeral
Bemeker sebsbo layqer maqat’elu
Ante gin tesfa neh lamenubh hulu

CHORUS
Ende qedmo hulu zarem asbat
Ityop’ya hegerachn antew t’ebqat
Yeqal kidan heger lijochh nenna
Selamh yibzaln yiqr belenna

VERSE 4
Yeraqewn maqreb tichlbechaleh
Yewedeqen mansat amlake tawqaleh
Ejochwan zergta maregn tilhelech
Emama ityop’ya antn tit’aralech

CHORUS
Ende qedmo hulu zarem asbat
Ityop’ya hegerachn antew t’ebqat
Yeqal kidan heger lijochh nenna
Selamh yibzaln yiqr belenna

VERSE 5
Yemets’nanat amlak yechernet Geta
Yebereket nigus keto matreta
Mefthew kante new yeselam abat
Eruruhu Geta antew tareqat

CHORUS
Ende qedmo hulu zarem asbat
Ityop’ya hegerachn antew t’ebqat
Yeqal kidan heger lijochh nenna
Selamh yibzaln yiqr belenna'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 1
በከንቱ ምኞት ቃየል ተነሳሳ
በቁጣ በበቀል ድንጋዩን አነሳ
እርሱም ላይደሰት ላይቀር መቅበዝበዙ
በራሱም ይደርሳል ብዙ ነው መዘዙ

CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 2
ግፍና መከራ ተፈራርቆብናል
ሰው በሰው ሲታረድ ባይናችን አይቸናል
ይብቃ ሰቆቃችን አይችል ተከሻችን
በምህረት እጅህ አብሰው እንባችን

CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 3
የቀደመው ጠላት መከራን ያበዛል
በልጆቹ መሀል እንክርዳድ የዘራል
በመከር ሰብስቦ ላይቀር ማቃጠሉ
አንተ ግን ተስፋ ነህ ላመኑብህ ሁሉ

CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 4
የራቀውን ማቅረብ ትችልበቻለህ
የወደቀን ማንሳት አምላኬ ታውቃለህ
እጆቿን ዘርግታ ማረኝ ትልሀለች
እማማ ኢትዮጵያ አንትን ትጣራለች

CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 5
የመፅናናት አምላክ የቸርነት ጌታ
የበረከት ንጉስ ከቶ ማትረታ
መፍትሄው ካንተ ነው የሰላም አባት
እሩሩሁ ጌታ አንተው ታረቃት

CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና',
        lyrics_transliteration = 'CHORUS
Ende qedmo hulu zarem asbat
Ityop’ya hegerachn antew t’ebqat
Yeqal kidan heger lijochh nenna
Selamh yibzaln yiqr belenna

VERSE 1
Bekentu mignot qayel tenesasa
Bequt’a bebeqel dingayun anesa
Ersum laydeset layqer meqbezbezu
Berasum yidersal bizu new mezezu

CHORUS
Ende qedmo hulu zarem asbat
Ityop’ya hegerachn antew t’ebqat
Yeqal kidan heger lijochh nenna
Selamh yibzaln yiqr belenna

VERSE 2
Gifna mekera teferarqobnal
Sew besew sitared baynachn aychenal
Yibqa seqoqachn aychl tekeshachn
Bemhret ejh absew enbachn

CHORUS
Ende qedmo hulu zarem asbat
Ityop’ya hegerachn antew t’ebqat
Yeqal kidan heger lijochh nenna
Selamh yibzaln yiqr belenna

VERSE 3
Yeqedemew t’elat mekeran yabezal
Beljochu mehel enkrdad yezeral
Bemeker sebsbo layqer maqat’elu
Ante gin tesfa neh lamenubh hulu

CHORUS
Ende qedmo hulu zarem asbat
Ityop’ya hegerachn antew t’ebqat
Yeqal kidan heger lijochh nenna
Selamh yibzaln yiqr belenna

VERSE 4
Yeraqewn maqreb tichlbechaleh
Yewedeqen mansat amlake tawqaleh
Ejochwan zergta maregn tilhelech
Emama ityop’ya antn tit’aralech

CHORUS
Ende qedmo hulu zarem asbat
Ityop’ya hegerachn antew t’ebqat
Yeqal kidan heger lijochh nenna
Selamh yibzaln yiqr belenna

VERSE 5
Yemets’nanat amlak yechernet Geta
Yebereket nigus keto matreta
Mefthew kante new yeselam abat
Eruruhu Geta antew tareqat

CHORUS
Ende qedmo hulu zarem asbat
Ityop’ya hegerachn antew t’ebqat
Yeqal kidan heger lijochh nenna
Selamh yibzaln yiqr belenna',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'fb055dc3-31af-4c83-af2d-22b61aee5289'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 1
በከንቱ ምኞት ቃየል ተነሳሳ
በቁጣ በበቀል ድንጋዩን አነሳ
እርሱም ላይደሰት ላይቀር መቅበዝበዙ
በራሱም ይደርሳል ብዙ ነው መዘዙ

CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 2
ግፍና መከራ ተፈራርቆብናል
ሰው በሰው ሲታረድ ባይናችን አይቸናል
ይብቃ ሰቆቃችን አይችል ተከሻችን
በምህረት እጅህ አብሰው እንባችን

CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 3
የቀደመው ጠላት መከራን ያበዛል
በልጆቹ መሀል እንክርዳድ የዘራል
በመከር ሰብስቦ ላይቀር ማቃጠሉ
አንተ ግን ተስፋ ነህ ላመኑብህ ሁሉ

CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 4
የራቀውን ማቅረብ ትችልበቻለህ
የወደቀን ማንሳት አምላኬ ታውቃለህ
እጆቿን ዘርግታ ማረኝ ትልሀለች
እማማ ኢትዮጵያ አንትን ትጣራለች

CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና

VERSE 5
የመፅናናት አምላክ የቸርነት ጌታ
የበረከት ንጉስ ከቶ ማትረታ
መፍትሄው ካንተ ነው የሰላም አባት
እሩሩሁ ጌታ አንተው ታረቃት

CHORUS
እንደ ቀድሞ ሁሉ ዛሬም አስባት
ኢትዮጵያ ሀገራችን አንተው ጠብቃት
የቃል ኪዳን ሀገር ልጆችህ ነንና
ሰላምህ ይብዛልን ይቅር በለንና'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'fb055dc3-31af-4c83-af2d-22b61aee5289'::uuid, 'yekal-kidan-hager', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- bemin-des-lasegnih-2675 ("Bemin Des Lasegnih")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'fdccbba6-823d-4154-89b4-72943ca4da3d'::uuid
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
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 6
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ
ኪሩቤል ሱራፌል ቅዱስ ሥሉስ ያሉህ
መላዕክት በራማ የሚያመሰኑህ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 7
ድንቅ መካር ኃያል ኤልሻዳይ ነህና
ትንቢያ ነኝ ምን ልስጥህ ምንስ አለኝና ፪
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና በአምላኬ ፊት ልስገድ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 8
ወደ ላይ በሰማይ ወደ ታች በጥልቀት
አምላኬ የት አለ የማትገኝበት
ጌታ ሆይ የት አለ የማትገኝበት
በኪዳን በፀሎት ቅዳሴ ሰዓታት

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 9
አንተ የሰጠኸኝ የመንፈስ ቅዱስ ሀብት
መልሰን ወደ አንተ ብንሰጥ ምን አለ
ተወው ጉዳችንን ስስታችን ይኸው ፪
ሀብትና ንብረቴስ ጉልበቴስ ምንድነው

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 10
ጤናዬ የሰጠኝ ከአንተ በቀር ማነው
በሰጠኸኝ እድሜ በሕይወት ዘመኔ
ከገላዬስ ቢሆን የትኛው ነው የኔ
ከአካላቴስ ቢሆን የትኛው ነው የኔ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 11
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 12
አ.ዝ //
በኢያሪኮ መንገድ ስለምን ቁጭ ብዬ
ብርሐን እጅግ ናፍቆኝ ከሰው ተገልዬ
የብርሐን ጌታ ወደ እኔ መጣና

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 13
ዓይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
ለብዙ ዘመናት አልጋ ላይ ተኝቼ
የሚረዳኝ አጣሁ ጠሉኝ ዘመዶቼ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 14
የእኔ ጌታ አምላኬ ወደእኔ መጣና
አይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
አሥራ ሁለት ዓመት ደም እየፈሰሰኝ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 15
ምራቅ እየተፉ ሁሉም ሲያንቋሽሹኝ
የጌታዬ ልብሱን ጫፉን ብዳስሰው
ሃይል ከእርሱ ወጣ ደሜን ቀጥ አረገው
አ.ዝ //

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 16
ሰካራም ዘማዊ ወንበዴ ነበርኩኝ
ያመፀኞች መሪ ደምን ያፈሰስኩኝ
ዛሬ ግን ታሪኬን ጌታ ቀይሮታል
ለሃያሉ ጌታ ምስጋና ይገባዋል

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
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 6
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey
Kirubel surafel Kidus silus yaluh
Melaekt berama yemiyamesenuh

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 7
Dinq mekar hayal elshaday nehna
Tinbiya negn min list’h mins alegnna 2
Qidusun meswaet liul silemiwed
Min yizhe limt’ana beamlake fit lisged

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 8
Wede lay besemay wede tach bet’lqet
Amlake yet ale yematgegnbet
Geta hoy yet ale yematgegnbet
Bekidan bets’elot qidase seatat

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 9
Ante yeset’eኸgn yemenfes Kidus hebt
Melsen wede ante binset’ min ale
Tewew gudachnn sistachn yiኸw 2
Hebtna nibretes gulbetes mindnew

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 10
T’enaye yeset’egn keante beqer manew
Beset’eኸgn edme behywet zemene
Kegelayes bihon yetgnaw new yene
Keakalates bihon yetgnaw new yene

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 11
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 12
A.z //
Beiyariko menged silemn quch’ biye
Birhen ejg nafqogn kesew tegelye
Yebrhen Geta wede ene met’ana

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 13
Aynen aberalgn beeju dasesena
A.z //
Lebzu zemenat alga lay tegnche
Yemiredagn at’ahu t’elugn zemedoche

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 14
Yeene Geta amlake wedeene met’ana
Aynen aberalgn beeju dasesena
A.z //
Asra hulet amet dem eyefesesegn

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 15
Miraq eyetefu hulum siyanqwashshugn
Yegetaye libsun ch’afun bidassew
Hayl keersu wet’a demen qet’ aregew
A.z //

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 16
Sekaram zemawi wenbede neberkugn
Yamets’egnoch meri demn yafeseskugn
Zare gin tariken Geta qeyrotal
Lehayalu Geta misgana yigebawal

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
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 6
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ
ኪሩቤል ሱራፌል ቅዱስ ሥሉስ ያሉህ
መላዕክት በራማ የሚያመሰኑህ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 7
ድንቅ መካር ኃያል ኤልሻዳይ ነህና
ትንቢያ ነኝ ምን ልስጥህ ምንስ አለኝና ፪
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና በአምላኬ ፊት ልስገድ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 8
ወደ ላይ በሰማይ ወደ ታች በጥልቀት
አምላኬ የት አለ የማትገኝበት
ጌታ ሆይ የት አለ የማትገኝበት
በኪዳን በፀሎት ቅዳሴ ሰዓታት

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 9
አንተ የሰጠኸኝ የመንፈስ ቅዱስ ሀብት
መልሰን ወደ አንተ ብንሰጥ ምን አለ
ተወው ጉዳችንን ስስታችን ይኸው ፪
ሀብትና ንብረቴስ ጉልበቴስ ምንድነው

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 10
ጤናዬ የሰጠኝ ከአንተ በቀር ማነው
በሰጠኸኝ እድሜ በሕይወት ዘመኔ
ከገላዬስ ቢሆን የትኛው ነው የኔ
ከአካላቴስ ቢሆን የትኛው ነው የኔ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 11
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 12
አ.ዝ //
በኢያሪኮ መንገድ ስለምን ቁጭ ብዬ
ብርሐን እጅግ ናፍቆኝ ከሰው ተገልዬ
የብርሐን ጌታ ወደ እኔ መጣና

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 13
ዓይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
ለብዙ ዘመናት አልጋ ላይ ተኝቼ
የሚረዳኝ አጣሁ ጠሉኝ ዘመዶቼ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 14
የእኔ ጌታ አምላኬ ወደእኔ መጣና
አይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
አሥራ ሁለት ዓመት ደም እየፈሰሰኝ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 15
ምራቅ እየተፉ ሁሉም ሲያንቋሽሹኝ
የጌታዬ ልብሱን ጫፉን ብዳስሰው
ሃይል ከእርሱ ወጣ ደሜን ቀጥ አረገው
አ.ዝ //

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 16
ሰካራም ዘማዊ ወንበዴ ነበርኩኝ
ያመፀኞች መሪ ደምን ያፈሰስኩኝ
ዛሬ ግን ታሪኬን ጌታ ቀይሮታል
ለሃያሉ ጌታ ምስጋና ይገባዋል

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
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 6
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey
Kirubel surafel Kidus silus yaluh
Melaekt berama yemiyamesenuh

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 7
Dinq mekar hayal elshaday nehna
Tinbiya negn min list’h mins alegnna 2
Qidusun meswaet liul silemiwed
Min yizhe limt’ana beamlake fit lisged

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 8
Wede lay besemay wede tach bet’lqet
Amlake yet ale yematgegnbet
Geta hoy yet ale yematgegnbet
Bekidan bets’elot qidase seatat

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 9
Ante yeset’eኸgn yemenfes Kidus hebt
Melsen wede ante binset’ min ale
Tewew gudachnn sistachn yiኸw 2
Hebtna nibretes gulbetes mindnew

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 10
T’enaye yeset’egn keante beqer manew
Beset’eኸgn edme behywet zemene
Kegelayes bihon yetgnaw new yene
Keakalates bihon yetgnaw new yene

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 11
Yewededegn Geta min adrgelet new
Bizemrletm yansbetal yiኽw
Kewdqete ansteh dikamen yagezኸgn
Sebarawn dildy get’meh yashagerkegn

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 12
A.z //
Beiyariko menged silemn quch’ biye
Birhen ejg nafqogn kesew tegelye
Yebrhen Geta wede ene met’ana

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 13
Aynen aberalgn beeju dasesena
A.z //
Lebzu zemenat alga lay tegnche
Yemiredagn at’ahu t’elugn zemedoche

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 14
Yeene Geta amlake wedeene met’ana
Aynen aberalgn beeju dasesena
A.z //
Asra hulet amet dem eyefesesegn

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 15
Miraq eyetefu hulum siyanqwashshugn
Yegetaye libsun ch’afun bidassew
Hayl keersu wet’a demen qet’ aregew
A.z //

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey

VERSE 16
Sekaram zemawi wenbede neberkugn
Yamets’egnoch meri demn yafeseskugn
Zare gin tariken Geta qeyrotal
Lehayalu Geta misgana yigebawal

CHORUS
Bemn des lasegnh Getaye hoy
Bemn des lasegnh amlake hoy
Alemna melaw yantew aydelem wey
Yefet’erkew hulu yantew aydelem wey',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'fdccbba6-823d-4154-89b4-72943ca4da3d'::uuid
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
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 6
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ
ኪሩቤል ሱራፌል ቅዱስ ሥሉስ ያሉህ
መላዕክት በራማ የሚያመሰኑህ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 7
ድንቅ መካር ኃያል ኤልሻዳይ ነህና
ትንቢያ ነኝ ምን ልስጥህ ምንስ አለኝና ፪
ቅዱሱን መስዋዕት ልዑል ስለሚወድ
ምን ይዤ ልምጣና በአምላኬ ፊት ልስገድ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 8
ወደ ላይ በሰማይ ወደ ታች በጥልቀት
አምላኬ የት አለ የማትገኝበት
ጌታ ሆይ የት አለ የማትገኝበት
በኪዳን በፀሎት ቅዳሴ ሰዓታት

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 9
አንተ የሰጠኸኝ የመንፈስ ቅዱስ ሀብት
መልሰን ወደ አንተ ብንሰጥ ምን አለ
ተወው ጉዳችንን ስስታችን ይኸው ፪
ሀብትና ንብረቴስ ጉልበቴስ ምንድነው

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 10
ጤናዬ የሰጠኝ ከአንተ በቀር ማነው
በሰጠኸኝ እድሜ በሕይወት ዘመኔ
ከገላዬስ ቢሆን የትኛው ነው የኔ
ከአካላቴስ ቢሆን የትኛው ነው የኔ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 11
የወደደኝ ጌታ ምን አድርጌለት ነው
ብዘምርለትም ያንስበታል ይኽው
ከውድቀቴ አንስተህ ድካሜን ያገዝኸኝ
ሰባራውን ድልድይ ገጥመህ ያሻገርከኝ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 12
አ.ዝ //
በኢያሪኮ መንገድ ስለምን ቁጭ ብዬ
ብርሐን እጅግ ናፍቆኝ ከሰው ተገልዬ
የብርሐን ጌታ ወደ እኔ መጣና

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 13
ዓይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
ለብዙ ዘመናት አልጋ ላይ ተኝቼ
የሚረዳኝ አጣሁ ጠሉኝ ዘመዶቼ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 14
የእኔ ጌታ አምላኬ ወደእኔ መጣና
አይኔን አበራልኝ በእጁ ዳሰሰና
አ.ዝ //
አሥራ ሁለት ዓመት ደም እየፈሰሰኝ

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 15
ምራቅ እየተፉ ሁሉም ሲያንቋሽሹኝ
የጌታዬ ልብሱን ጫፉን ብዳስሰው
ሃይል ከእርሱ ወጣ ደሜን ቀጥ አረገው
አ.ዝ //

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ

VERSE 16
ሰካራም ዘማዊ ወንበዴ ነበርኩኝ
ያመፀኞች መሪ ደምን ያፈሰስኩኝ
ዛሬ ግን ታሪኬን ጌታ ቀይሮታል
ለሃያሉ ጌታ ምስጋና ይገባዋል

CHORUS
በምን ደስ ላሰኝህ ጌታዬ ሆይ
በምን ደስ ላሰኝህ አምላኬ ሆይ
አለምና መላው ያንተው አይደለም ወይ
የፈጠርከው ሁሉ ያንተው አይደለም ወይ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'fdccbba6-823d-4154-89b4-72943ca4da3d'::uuid, 'bemin-des-lasegnih-2675', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- begena-anisiten ("Begena Anisiten")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'fd277b7a-ca3f-4788-b6ec-bbe7ad0c700e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 1
ክበር ተመስገን ለዘላለም [፪]

CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 2
ዓለም ሞኝነት ይመስለዋል
ላንተ መንበርከክ ይከብደዋል
ፍቅርህን ቀምሰን ዝም አንልም
እንዘምራለን ለዘላለም[፪]

CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 3
ፍውስን ስትሰጠን ስትባርከን
ፍቅርህን ልከህ ስትጎበኝን
ጉልበት ይጸናል ባንተ ጸጋ
ማነው የሚከፍልህ ያንተን ዋጋ[፪]

CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 4
ስንዘምርልህ የሚስቁ
ብዙ ሜልኮሉች ዛሬም አሉ
ከእኛ የሆነ ምንም የለም
አምላክ ስላንተ ዝም አንልም[፪]

CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 5
ሞኝነት ለኔ መች ሆነና
ፊትህ ያቆመኝ ለምስጋና
እንድቀኝልህ ግድ የሚለኝ
ፍቅርህ ብቻ ነው የማርከኝ[፪]

CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Begena ansten mesenqon
Begena ansten mesegqon
Enamesgnew simhn
Endante Geta manm yelem

VERSE 1
Kiber temesgen lezelalem [2]

CHORUS
Begena ansten mesenqon
Begena ansten mesegqon
Enamesgnew simhn
Endante Geta manm yelem

VERSE 2
Alem mognnet yimeslewal
Lante menberkek yikebdewal
Fiqrhn qemsen zim anlm
Enzemralen lezelalem[2]

CHORUS
Begena ansten mesenqon
Begena ansten mesegqon
Enamesgnew simhn
Endante Geta manm yelem

VERSE 3
Fiwsn sitset’en sitbarken
Fiqrhn likeh sitgobegnn
Gulbet yits’enal bante ts’ega
Manew yemikeflh yanten waga[2]

CHORUS
Begena ansten mesenqon
Begena ansten mesegqon
Enamesgnew simhn
Endante Geta manm yelem

VERSE 4
Sinzemrlh yemisqu
Bizu melkoluch zarem alu
Keegna yehone minm yelem
Amlak silante zim anlm[2]

CHORUS
Begena ansten mesenqon
Begena ansten mesegqon
Enamesgnew simhn
Endante Geta manm yelem

VERSE 5
Mognnet lene mech honena
Fith yaqomegn lemsgana
Endqegnlh gid yemilegn
Fiqrh bicha new yemarkegn[2]

CHORUS
Begena ansten mesenqon
Begena ansten mesegqon
Enamesgnew simhn
Endante Geta manm yelem'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 1
ክበር ተመስገን ለዘላለም [፪]

CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 2
ዓለም ሞኝነት ይመስለዋል
ላንተ መንበርከክ ይከብደዋል
ፍቅርህን ቀምሰን ዝም አንልም
እንዘምራለን ለዘላለም[፪]

CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 3
ፍውስን ስትሰጠን ስትባርከን
ፍቅርህን ልከህ ስትጎበኝን
ጉልበት ይጸናል ባንተ ጸጋ
ማነው የሚከፍልህ ያንተን ዋጋ[፪]

CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 4
ስንዘምርልህ የሚስቁ
ብዙ ሜልኮሉች ዛሬም አሉ
ከእኛ የሆነ ምንም የለም
አምላክ ስላንተ ዝም አንልም[፪]

CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 5
ሞኝነት ለኔ መች ሆነና
ፊትህ ያቆመኝ ለምስጋና
እንድቀኝልህ ግድ የሚለኝ
ፍቅርህ ብቻ ነው የማርከኝ[፪]

CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም',
        lyrics_transliteration = 'CHORUS
Begena ansten mesenqon
Begena ansten mesegqon
Enamesgnew simhn
Endante Geta manm yelem

VERSE 1
Kiber temesgen lezelalem [2]

CHORUS
Begena ansten mesenqon
Begena ansten mesegqon
Enamesgnew simhn
Endante Geta manm yelem

VERSE 2
Alem mognnet yimeslewal
Lante menberkek yikebdewal
Fiqrhn qemsen zim anlm
Enzemralen lezelalem[2]

CHORUS
Begena ansten mesenqon
Begena ansten mesegqon
Enamesgnew simhn
Endante Geta manm yelem

VERSE 3
Fiwsn sitset’en sitbarken
Fiqrhn likeh sitgobegnn
Gulbet yits’enal bante ts’ega
Manew yemikeflh yanten waga[2]

CHORUS
Begena ansten mesenqon
Begena ansten mesegqon
Enamesgnew simhn
Endante Geta manm yelem

VERSE 4
Sinzemrlh yemisqu
Bizu melkoluch zarem alu
Keegna yehone minm yelem
Amlak silante zim anlm[2]

CHORUS
Begena ansten mesenqon
Begena ansten mesegqon
Enamesgnew simhn
Endante Geta manm yelem

VERSE 5
Mognnet lene mech honena
Fith yaqomegn lemsgana
Endqegnlh gid yemilegn
Fiqrh bicha new yemarkegn[2]

CHORUS
Begena ansten mesenqon
Begena ansten mesegqon
Enamesgnew simhn
Endante Geta manm yelem',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'fd277b7a-ca3f-4788-b6ec-bbe7ad0c700e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 1
ክበር ተመስገን ለዘላለም [፪]

CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 2
ዓለም ሞኝነት ይመስለዋል
ላንተ መንበርከክ ይከብደዋል
ፍቅርህን ቀምሰን ዝም አንልም
እንዘምራለን ለዘላለም[፪]

CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 3
ፍውስን ስትሰጠን ስትባርከን
ፍቅርህን ልከህ ስትጎበኝን
ጉልበት ይጸናል ባንተ ጸጋ
ማነው የሚከፍልህ ያንተን ዋጋ[፪]

CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 4
ስንዘምርልህ የሚስቁ
ብዙ ሜልኮሉች ዛሬም አሉ
ከእኛ የሆነ ምንም የለም
አምላክ ስላንተ ዝም አንልም[፪]

CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም

VERSE 5
ሞኝነት ለኔ መች ሆነና
ፊትህ ያቆመኝ ለምስጋና
እንድቀኝልህ ግድ የሚለኝ
ፍቅርህ ብቻ ነው የማርከኝ[፪]

CHORUS
በገና አንስተን መሰንቆን
በገና አንስተን መሰግቆን
እናመስግነው ስምህን
እንዳንተ ጌታ ማንም የለም'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'fd277b7a-ca3f-4788-b6ec-bbe7ad0c700e'::uuid, 'begena-anisiten', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- sewoch-des-yibelen ("Sewoch Des Yibelen")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'fd9b68e0-e29f-421e-aeee-52604a2e9a7f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 1
አዝ….
በኃጢአት በሽታ ወድቄ ሳለሁኝ
መድሃኒት ክርስቶስ ከውድቀቴ አነሳኝ
ስጦታው ብዙ ነው ለኔ የሰጠኝ

CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 2
ተመስገን ብቻ ነው አምላክ ላንተ ያለኝ
አዝ….
እንደ በርጤምዮስ እውር የነበርኩኝ
ዛሬ ግን በአምላኬ ድህነት አገኘሁኝ

CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 3
ህጉም ለመንገዴ ብርሐን ሆኖኛል
የእርሱ ስለሆንኩኝ ሠላምን ሰጥቶኛል
አዝ….
በድንቅ አጠራርህ በፍቅር የጠራኽኝ

CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 4
ከአጋንንት እሥራት ነፃ ያወጣኽኝ
አልፋና ኦሜጋ ዘላለም የምትኖር
ኤልሻዳይ የሆንከው አማኑኤል ተመስገን
አዝ….

CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 5
የዕዳ ደብዳቤዬን ጌታዬ ቀደደው
የማዳኑን ሥራ በአይኔ አይቻለው
ቸርነቱ አያልቅም ድንቅ የሆነ ጌታ
ስሙን እናመስግን እንዘምር በእልልታ

CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 6
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

VERSE 1
ez….
behatiet beshta wedqe salehuny
medhanit krstos kewdqete enesany
stotaw bzu new lene yeseteny

CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

VERSE 2
temesgen bcha new emlak lante yaleny
ez….
nde bertemyos wr yeneberkuny
zare gn beemlake dhnet egenyehuny

CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

VERSE 3
hgum lemengede brhen hononyal
yersu slehonkuny selamn settonyal
ez….
bednq eterarh befqr yeterahny

CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

VERSE 4
keegannt srat netsa yawetahny
elfana omega zelalem yemtnor
elshaday yehonkew emanuel temesgen
ez….

CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

VERSE 5
yeda debdabeyen getaye qededew
yemadanun sra beeyne eychalew
chernetu eyalqm dnq yehone geta
smun namesgn nzemr bellta

CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

VERSE 6
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 1
አዝ….
በኃጢአት በሽታ ወድቄ ሳለሁኝ
መድሃኒት ክርስቶስ ከውድቀቴ አነሳኝ
ስጦታው ብዙ ነው ለኔ የሰጠኝ

CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 2
ተመስገን ብቻ ነው አምላክ ላንተ ያለኝ
አዝ….
እንደ በርጤምዮስ እውር የነበርኩኝ
ዛሬ ግን በአምላኬ ድህነት አገኘሁኝ

CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 3
ህጉም ለመንገዴ ብርሐን ሆኖኛል
የእርሱ ስለሆንኩኝ ሠላምን ሰጥቶኛል
አዝ….
በድንቅ አጠራርህ በፍቅር የጠራኽኝ

CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 4
ከአጋንንት እሥራት ነፃ ያወጣኽኝ
አልፋና ኦሜጋ ዘላለም የምትኖር
ኤልሻዳይ የሆንከው አማኑኤል ተመስገን
አዝ….

CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 5
የዕዳ ደብዳቤዬን ጌታዬ ቀደደው
የማዳኑን ሥራ በአይኔ አይቻለው
ቸርነቱ አያልቅም ድንቅ የሆነ ጌታ
ስሙን እናመስግን እንዘምር በእልልታ

CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 6
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው',
        lyrics_transliteration = 'CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

VERSE 1
ez….
behatiet beshta wedqe salehuny
medhanit krstos kewdqete enesany
stotaw bzu new lene yeseteny

CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

VERSE 2
temesgen bcha new emlak lante yaleny
ez….
nde bertemyos wr yeneberkuny
zare gn beemlake dhnet egenyehuny

CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

VERSE 3
hgum lemengede brhen hononyal
yersu slehonkuny selamn settonyal
ez….
bednq eterarh befqr yeterahny

CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

VERSE 4
keegannt srat netsa yawetahny
elfana omega zelalem yemtnor
elshaday yehonkew emanuel temesgen
ez….

CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

VERSE 5
yeda debdabeyen getaye qededew
yemadanun sra beeyne eychalew
chernetu eyalqm dnq yehone geta
smun namesgn nzemr bellta

CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

VERSE 6
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'fd9b68e0-e29f-421e-aeee-52604a2e9a7f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 1
አዝ….
በኃጢአት በሽታ ወድቄ ሳለሁኝ
መድሃኒት ክርስቶስ ከውድቀቴ አነሳኝ
ስጦታው ብዙ ነው ለኔ የሰጠኝ

CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 2
ተመስገን ብቻ ነው አምላክ ላንተ ያለኝ
አዝ….
እንደ በርጤምዮስ እውር የነበርኩኝ
ዛሬ ግን በአምላኬ ድህነት አገኘሁኝ

CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 3
ህጉም ለመንገዴ ብርሐን ሆኖኛል
የእርሱ ስለሆንኩኝ ሠላምን ሰጥቶኛል
አዝ….
በድንቅ አጠራርህ በፍቅር የጠራኽኝ

CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 4
ከአጋንንት እሥራት ነፃ ያወጣኽኝ
አልፋና ኦሜጋ ዘላለም የምትኖር
ኤልሻዳይ የሆንከው አማኑኤል ተመስገን
አዝ….

CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 5
የዕዳ ደብዳቤዬን ጌታዬ ቀደደው
የማዳኑን ሥራ በአይኔ አይቻለው
ቸርነቱ አያልቅም ድንቅ የሆነ ጌታ
ስሙን እናመስግን እንዘምር በእልልታ

CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

VERSE 6
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው

CHORUS
ሰዎች ደስ ይበለን በአምላካችን
ከኃጢአት ባርነት ነፃ ላወጣን
ተነሱ እናመስግን ውለታው ብዙ ነው
ምን ይከፈለዋል ተመስገን ብቻ ነው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

VERSE 1
ez….
behatiet beshta wedqe salehuny
medhanit krstos kewdqete enesany
stotaw bzu new lene yeseteny

CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

VERSE 2
temesgen bcha new emlak lante yaleny
ez….
nde bertemyos wr yeneberkuny
zare gn beemlake dhnet egenyehuny

CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

VERSE 3
hgum lemengede brhen hononyal
yersu slehonkuny selamn settonyal
ez….
bednq eterarh befqr yeterahny

CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

VERSE 4
keegannt srat netsa yawetahny
elfana omega zelalem yemtnor
elshaday yehonkew emanuel temesgen
ez….

CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

VERSE 5
yeda debdabeyen getaye qededew
yemadanun sra beeyne eychalew
chernetu eyalqm dnq yehone geta
smun namesgn nzemr bellta

CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

VERSE 6
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new

CHORUS
sewoch des ybelen beemlakachn
kehatiet barnet netsa lawetan
tenesu namesgn wletaw bzu new
mn ykefelewal temesgen bcha new';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'fd9b68e0-e29f-421e-aeee-52604a2e9a7f'::uuid, 'sewoch-des-yibelen', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yelem-yemisanew ("yelem yemisanew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'fdf841bb-83c7-4e08-afdd-7573a32deebb'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።

VERSE 1
አላስብም ነበር ፣ አልፈዋለሁ ብዬ
ጉንጭ አልፎ ትራሴን ፣ እያጠበ ዕንባዬ
እየተፈጸመ ፣ ኃይሉ በድካሜ
ማዕበሉን አለፍኩት ፣ ቀለልኝ ሸክሜ ።

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።

VERSE 2
የቤቴ ራስ ነው ፣ የእቅዴ መሪ
በክፉም በደጉም ፣ ነፍሴን አስተማሪ
ፈጥሮ የማይረሳኝ ፣ ቤዛዬ ደረሰ
ቤቴን ደስታ ሞላው ፣ ዕንባዬ ታበሰ።

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።

VERSE 3
ትናንት ባዶ ነበርኩ ፣ የለኝ የሚሰፈር
አንዳች አልነበረኝ ፣ የሚታይ የሚቆጠር
ከእርሱ የተነሳ ፣ ዛሬ ግን ሙሉ ነኝ
ክብር ለእርሱ ይሁን ፣ አለ የማይተወኝ።

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።

VERSE 4
እየከለከለ ፣ ለእኔ ማይጠቅመኝን
በጊዜ እየሰጠ ፣ ደግሞ ሚረባኝን
ሁሉ በእርሱ ሆኗል ፣ አልሆነም ያለ እርሱ
ውዳሴ ምስጋና ፣ ይድረስ ለንጉሡ ።

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew.

VERSE 1
Alasbm neber , alfewalehu biye
Gunch’ alfo tirasen , eyat’ebe enbaye
Eyetefets’eme , haylu bedkame
Maebelun alefkut , qelelgn shekme .

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew.

VERSE 2
Yebete ras new , yeeqde meri
Bekfum bedegum , nefsen astemari
Fet’ro yemayresagn , bezaye derese
Beten desta molaw , enbaye tabese.

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew.

VERSE 3
Tinant bado neberku , yelegn yemisefer
Andach alneberegn , yemitay yemiqot’er
Keersu yetenesa , zare gin mulu negn
Kibir leersu yihun , ale yemaytewegn.

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew.

VERSE 4
Eyekelekele , leene mayt’eqmegnn
Begize eyeset’e , degmo mirebagnn
Hulu beersu honwal , alhonem yale ersu
Widase misgana , yidres lengusu .

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew.'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።

VERSE 1
አላስብም ነበር ፣ አልፈዋለሁ ብዬ
ጉንጭ አልፎ ትራሴን ፣ እያጠበ ዕንባዬ
እየተፈጸመ ፣ ኃይሉ በድካሜ
ማዕበሉን አለፍኩት ፣ ቀለልኝ ሸክሜ ።

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።

VERSE 2
የቤቴ ራስ ነው ፣ የእቅዴ መሪ
በክፉም በደጉም ፣ ነፍሴን አስተማሪ
ፈጥሮ የማይረሳኝ ፣ ቤዛዬ ደረሰ
ቤቴን ደስታ ሞላው ፣ ዕንባዬ ታበሰ።

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።

VERSE 3
ትናንት ባዶ ነበርኩ ፣ የለኝ የሚሰፈር
አንዳች አልነበረኝ ፣ የሚታይ የሚቆጠር
ከእርሱ የተነሳ ፣ ዛሬ ግን ሙሉ ነኝ
ክብር ለእርሱ ይሁን ፣ አለ የማይተወኝ።

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።

VERSE 4
እየከለከለ ፣ ለእኔ ማይጠቅመኝን
በጊዜ እየሰጠ ፣ ደግሞ ሚረባኝን
ሁሉ በእርሱ ሆኗል ፣ አልሆነም ያለ እርሱ
ውዳሴ ምስጋና ፣ ይድረስ ለንጉሡ ።

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።',
        lyrics_transliteration = 'CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew.

VERSE 1
Alasbm neber , alfewalehu biye
Gunch’ alfo tirasen , eyat’ebe enbaye
Eyetefets’eme , haylu bedkame
Maebelun alefkut , qelelgn shekme .

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew.

VERSE 2
Yebete ras new , yeeqde meri
Bekfum bedegum , nefsen astemari
Fet’ro yemayresagn , bezaye derese
Beten desta molaw , enbaye tabese.

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew.

VERSE 3
Tinant bado neberku , yelegn yemisefer
Andach alneberegn , yemitay yemiqot’er
Keersu yetenesa , zare gin mulu negn
Kibir leersu yihun , ale yemaytewegn.

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew.

VERSE 4
Eyekelekele , leene mayt’eqmegnn
Begize eyeset’e , degmo mirebagnn
Hulu beersu honwal , alhonem yale ersu
Widase misgana , yidres lengusu .

CHORUS
Medhanealem yelem yemisanew
Amanuel yelem yemisanew
Ersu qal sinager teraraw meda new
Medhanealem yelem yemisanew.',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'fdf841bb-83c7-4e08-afdd-7573a32deebb'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።

VERSE 1
አላስብም ነበር ፣ አልፈዋለሁ ብዬ
ጉንጭ አልፎ ትራሴን ፣ እያጠበ ዕንባዬ
እየተፈጸመ ፣ ኃይሉ በድካሜ
ማዕበሉን አለፍኩት ፣ ቀለልኝ ሸክሜ ።

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።

VERSE 2
የቤቴ ራስ ነው ፣ የእቅዴ መሪ
በክፉም በደጉም ፣ ነፍሴን አስተማሪ
ፈጥሮ የማይረሳኝ ፣ ቤዛዬ ደረሰ
ቤቴን ደስታ ሞላው ፣ ዕንባዬ ታበሰ።

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።

VERSE 3
ትናንት ባዶ ነበርኩ ፣ የለኝ የሚሰፈር
አንዳች አልነበረኝ ፣ የሚታይ የሚቆጠር
ከእርሱ የተነሳ ፣ ዛሬ ግን ሙሉ ነኝ
ክብር ለእርሱ ይሁን ፣ አለ የማይተወኝ።

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።

VERSE 4
እየከለከለ ፣ ለእኔ ማይጠቅመኝን
በጊዜ እየሰጠ ፣ ደግሞ ሚረባኝን
ሁሉ በእርሱ ሆኗል ፣ አልሆነም ያለ እርሱ
ውዳሴ ምስጋና ፣ ይድረስ ለንጉሡ ።

CHORUS
መድኃኔዓለም የለም የሚሳነው
አማኑኤል የለም የሚሳነው
እርሱ ቃል ሲናገር ተራራው ሜዳ ነው
መድኃኔዓለም የለም የሚሳነው።'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'fdf841bb-83c7-4e08-afdd-7573a32deebb'::uuid, 'yelem-yemisanew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- gebirielin-lakew ("Gebirielin Lakew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'c63e06d6-a40b-47e4-959e-7105b8ec6f2a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 1
ሀይለልዑል ወልም ስጋሽን ይለብሳል
በተለየ አካሉ ወዳንች ይመጣል
ከስጋሽም ስጋን ከነስሽም ነፍስ ነስቶ ይዋሐዳል
ልክ እንደህፃናት ካንች ይወልዳል

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 2
ደንቆሮ ሊሰማ ድዶች ሊናገሩ
በጌታ ታምራት እውራን ሊበሩ
ሙታን ይነሱ ዘንድ በማህፀንሽ ፍሬ
ከእግዚአብሔር ወዳንች ተልኪያለሁ ዛሬ

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 3
ደስ አሰኛት አለው በልዩ ሰላምታ
ሐሴት እንድታደርግ ምስራቹን ሰምታ
ድዳ እንዳደረከው ካህን ዘካርያስን
እንዳታሳዝናት ከእርሷ ጋር ስትደርስ

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 4
ገብርኤል በደስታ ምስራቹን ይዞ
ከሰማይ ወረደ በአምላኩ ታዞ
በሊባኖስ መንደር እስኪሰማ ድረስ
ክንፋን እያማታ መጣ ሲገሰግስ

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 5
ደስ በልሽ አላት እየተሳለማት
ሀርን ከወርቅ ጋር ስትፈትል አግኝቷት
እውነተኛው ንጉስ ካንች ይወለዳል
ላንች ፍቅር እና አንድነት ይገባል

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 6
አዝማች (2)

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl

VERSE 1
Heylelul welm sigashn yilebsal
Beteleye akalu wedanch yimet’al
Kesgashm sigan kenesshm nefs nesto yiwahedal
Lik endehts’anat kanch yiweldal

CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl

VERSE 2
Denqoro lisema didoch linageru
Begeta tamrat ewran liberu
Mutan yinesu zend bemahts’ensh fire
Keegziabher wedanch telkiyalehu zare

CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl

VERSE 3
Des asegnat alew belyu selamta
Heset endtaderg misrachun semta
Dida endaderekew kahn zekaryasn
Endatasaznat keerswa gar sitders

CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl

VERSE 4
Gebriel bedesta misrachun yizo
Kesemay werede beamlaku tazo
Belibanos mender eskisema dires
Kinfan eyamata met’a sigesegs

CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl

VERSE 5
Des belsh alat eyetesalemat
Hern kewerq gar sitfetl aggntwat
Ewnetegnaw nigus kanch yiweledal
Lanch fiqr ena andnet yigebal

CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl

VERSE 6
CHORUS

CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 1
ሀይለልዑል ወልም ስጋሽን ይለብሳል
በተለየ አካሉ ወዳንች ይመጣል
ከስጋሽም ስጋን ከነስሽም ነፍስ ነስቶ ይዋሐዳል
ልክ እንደህፃናት ካንች ይወልዳል

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 2
ደንቆሮ ሊሰማ ድዶች ሊናገሩ
በጌታ ታምራት እውራን ሊበሩ
ሙታን ይነሱ ዘንድ በማህፀንሽ ፍሬ
ከእግዚአብሔር ወዳንች ተልኪያለሁ ዛሬ

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 3
ደስ አሰኛት አለው በልዩ ሰላምታ
ሐሴት እንድታደርግ ምስራቹን ሰምታ
ድዳ እንዳደረከው ካህን ዘካርያስን
እንዳታሳዝናት ከእርሷ ጋር ስትደርስ

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 4
ገብርኤል በደስታ ምስራቹን ይዞ
ከሰማይ ወረደ በአምላኩ ታዞ
በሊባኖስ መንደር እስኪሰማ ድረስ
ክንፋን እያማታ መጣ ሲገሰግስ

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 5
ደስ በልሽ አላት እየተሳለማት
ሀርን ከወርቅ ጋር ስትፈትል አግኝቷት
እውነተኛው ንጉስ ካንች ይወለዳል
ላንች ፍቅር እና አንድነት ይገባል

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 6
አዝማች (2)

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል',
        lyrics_transliteration = 'CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl

VERSE 1
Heylelul welm sigashn yilebsal
Beteleye akalu wedanch yimet’al
Kesgashm sigan kenesshm nefs nesto yiwahedal
Lik endehts’anat kanch yiweldal

CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl

VERSE 2
Denqoro lisema didoch linageru
Begeta tamrat ewran liberu
Mutan yinesu zend bemahts’ensh fire
Keegziabher wedanch telkiyalehu zare

CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl

VERSE 3
Des asegnat alew belyu selamta
Heset endtaderg misrachun semta
Dida endaderekew kahn zekaryasn
Endatasaznat keerswa gar sitders

CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl

VERSE 4
Gebriel bedesta misrachun yizo
Kesemay werede beamlaku tazo
Belibanos mender eskisema dires
Kinfan eyamata met’a sigesegs

CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl

VERSE 5
Des belsh alat eyetesalemat
Hern kewerq gar sitfetl aggntwat
Ewnetegnaw nigus kanch yiweledal
Lanch fiqr ena andnet yigebal

CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl

VERSE 6
CHORUS

CHORUS
Yemelakt aleqa gebreln lakew
Hayalu Egziabher besemayat yalew
Yebahri lije wedanch yimet’al
Bilh lets’yon lij nigerat ledngl',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'c63e06d6-a40b-47e4-959e-7105b8ec6f2a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 1
ሀይለልዑል ወልም ስጋሽን ይለብሳል
በተለየ አካሉ ወዳንች ይመጣል
ከስጋሽም ስጋን ከነስሽም ነፍስ ነስቶ ይዋሐዳል
ልክ እንደህፃናት ካንች ይወልዳል

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 2
ደንቆሮ ሊሰማ ድዶች ሊናገሩ
በጌታ ታምራት እውራን ሊበሩ
ሙታን ይነሱ ዘንድ በማህፀንሽ ፍሬ
ከእግዚአብሔር ወዳንች ተልኪያለሁ ዛሬ

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 3
ደስ አሰኛት አለው በልዩ ሰላምታ
ሐሴት እንድታደርግ ምስራቹን ሰምታ
ድዳ እንዳደረከው ካህን ዘካርያስን
እንዳታሳዝናት ከእርሷ ጋር ስትደርስ

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 4
ገብርኤል በደስታ ምስራቹን ይዞ
ከሰማይ ወረደ በአምላኩ ታዞ
በሊባኖስ መንደር እስኪሰማ ድረስ
ክንፋን እያማታ መጣ ሲገሰግስ

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 5
ደስ በልሽ አላት እየተሳለማት
ሀርን ከወርቅ ጋር ስትፈትል አግኝቷት
እውነተኛው ንጉስ ካንች ይወለዳል
ላንች ፍቅር እና አንድነት ይገባል

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል

VERSE 6
አዝማች (2)

CHORUS
የመላክት አለቃ ገብርኤልን ላከው
ኃያሉ እግዚአብሔር በሰማያት ያለው
የባህሪ ልጄ ወዳንች ይመጣል
ብልህ ለፅዮን ልጅ ንገራት ለድንግል'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'c63e06d6-a40b-47e4-959e-7105b8ec6f2a'::uuid, 'gebirielin-lakew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zemari-mikiyas-aregawi-bemecheresha-eninesalen-kemutan ("Zemari Mikiyas Aregawi Bemecheresha Eninesalen Kemutan")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ffccde6f-ee93-4993-b24b-a5e2ec4ac609'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
የሚናፈቅ ነው በልቦናቸው የሚኖር'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
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
Yeminafeq new belbonachew yeminor'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
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
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ffccde6f-ee93-4993-b24b-a5e2ec4ac609'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
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
የሚናፈቅ ነው በልቦናቸው የሚኖር'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ffccde6f-ee93-4993-b24b-a5e2ec4ac609'::uuid, 'zemari-mikiyas-aregawi-bemecheresha-eninesalen-kemutan', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
