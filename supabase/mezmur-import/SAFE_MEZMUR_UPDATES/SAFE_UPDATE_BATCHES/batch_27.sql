-- ============================================================================
-- TEWAHEDODAILY SAFE MEZMUR UPDATE - BATCH 27 OF 32
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
  -- ken-aleh ("Ken Aleh")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '75786a4a-39e4-43dc-b2da-9186fe4a5c4c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 1
አባቴ ሁሉን በየተራ
እንዳላየ ዓይተህ ጥለህ ምስኪኑን ማታልፍ
እርሱማ እንደዚህ ነው ሲሉህ የማትጸየፍ
ብለው ነበረ ይወድቃል ይህ ሰው

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 2
ዳግም አይቆምም ማንም አይረዳው
ጥሎታል እግዚአብሔር ትቶታል
ኃጢአቱ ለዚህ አብቅቶታል
ከእንግዲህ ሰው አይሆንም ሲሉኝ

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 3
አንተ ግን ፊታቸው አቆምከኝ
በዚህ ዘመንማ ከፋ ማን ሰውን ይወዳል?
መጻጉዕ ዳግም ቢታመም አልጋው ላይ ይሞታል
ወትሮም እንዲህ ነው ማን አስታወሰው

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 4
ሁሉ አልነበር ወይ ጥሎት ያለፈው
ከአልጋዬ ቀና ያደረከኝ
አባብለህ አቅፈህ ያስታመምከኝ
ባዶ ቤት ብቻዬን ቀርቼ

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 5
ስንቴ ዳንኩ ስንት ጊዜ ሞቼ
ተሰብሮ የሚማጸንን ልብ ቸል አትልምና
ደም ከፍለህ የተቤዥከውን አትረሳምና
ከቤትህ ርቆ ጠፍቶ የሄደን ሰው

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 6
እንዴት ደግሰህ አቅፈህ ተቀበልከው
አባክኗል ብዙ በድሎሃል
ይቅርብህ አስወጣው ይሉሃል
ላንተ ግን መጎስቆሌ ታየህ

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 7
እንባዬ ለቅሶዬ አስለቀሰህ
ጌታዬ ናልኝ ምትሉ እርሱን ምትጠብቁ
ዘግይቶም አይቀደምም ይህንን እወቁ
አንድ ቀን አለ ፀሐይ ትወጣለች

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 8
ትንሿ ጎጆ ብርሃን ትሞላለች
ይመጣል እግዚአብሔር ይመጣል
ቀጥሮማ መቼ ቀርቶ ያውቃል
አይዋሽም ታማኝ ነው በቃሉ

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 9
በገሃድ ይመጣል ኃያሉ
እንዳላየ ዓይተህ ጥለህ ምስኪኑን ማታልፍ
እርሱማ እንደዚህ ነው ሲሉህ የማትጸየፍ
ብለው ነበረ ይወድቃል ይህ ሰው

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 10
ዳግም አይቆምም ማንም አይረዳው
ጥሎታል እግዚአብሔር ትቶታል
ኃጢአቱ ለዚህ አብቅቶታል
ከእንግዲህ ሰው አይሆንም ሲሉኝ

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 11
አንተ ግን ፊታቸው አቆምከኝ

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 1
Abate hulun beyetera
Endalaye ayteh t’leh miskinun matalf
Ersuma endezih new siluh yematts’eyef
Bilew nebere yiwedqal yih sew

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 2
Dagm ayqomm manm ayredaw
T’lotal Egziabher titotal
Hat’iatu lezih abqtotal
Keengdih sew ayhonm silugn

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 3
Ante gin fitachew aqomkegn
Bezih zemenma kefa man sewn yiwedal?
Mets’ague dagm bitamem algaw lay yimotal
Wetrom endih new man astawesew

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 4
Hulu alneber wey t’lot yalefew
Kealgaye qena yaderekegn
Abableh aqfeh yastamemkegn
Bado bet bichayen qerche

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 5
Sinte danku sint gize moche
Tesebro yemimats’enn lib chel atlmna
Dem kefleh yetebezhkewn atresamna
Kebeth riqo t’efto yeheden sew

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 6
Endet degseh aqfeh teqebelkew
Abaknwal bizu bedlohal
Yiqrbh aswet’aw yiluhal
Lante gin megosqole tayeh

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 7
Enbaye leqsoye asleqeseh
Getaye nalgn mitlu ersun mitt’ebqu
Zegytom ayqedemm yihnn ewequ
And qen ale ts’ehey tiwet’alech

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 8
Tinshwa gojo birhan timolalech
Yimet’al Egziabher yimet’al
Qet’roma meche qerto yawqal
Aywashm tamagn new beqalu

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 9
Begehad yimet’al hayalu
Endalaye ayteh t’leh miskinun matalf
Ersuma endezih new siluh yematts’eyef
Bilew nebere yiwedqal yih sew

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 10
Dagm ayqomm manm ayredaw
T’lotal Egziabher titotal
Hat’iatu lezih abqtotal
Keengdih sew ayhonm silugn

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 11
Ante gin fitachew aqomkegn

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 1
አባቴ ሁሉን በየተራ
እንዳላየ ዓይተህ ጥለህ ምስኪኑን ማታልፍ
እርሱማ እንደዚህ ነው ሲሉህ የማትጸየፍ
ብለው ነበረ ይወድቃል ይህ ሰው

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 2
ዳግም አይቆምም ማንም አይረዳው
ጥሎታል እግዚአብሔር ትቶታል
ኃጢአቱ ለዚህ አብቅቶታል
ከእንግዲህ ሰው አይሆንም ሲሉኝ

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 3
አንተ ግን ፊታቸው አቆምከኝ
በዚህ ዘመንማ ከፋ ማን ሰውን ይወዳል?
መጻጉዕ ዳግም ቢታመም አልጋው ላይ ይሞታል
ወትሮም እንዲህ ነው ማን አስታወሰው

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 4
ሁሉ አልነበር ወይ ጥሎት ያለፈው
ከአልጋዬ ቀና ያደረከኝ
አባብለህ አቅፈህ ያስታመምከኝ
ባዶ ቤት ብቻዬን ቀርቼ

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 5
ስንቴ ዳንኩ ስንት ጊዜ ሞቼ
ተሰብሮ የሚማጸንን ልብ ቸል አትልምና
ደም ከፍለህ የተቤዥከውን አትረሳምና
ከቤትህ ርቆ ጠፍቶ የሄደን ሰው

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 6
እንዴት ደግሰህ አቅፈህ ተቀበልከው
አባክኗል ብዙ በድሎሃል
ይቅርብህ አስወጣው ይሉሃል
ላንተ ግን መጎስቆሌ ታየህ

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 7
እንባዬ ለቅሶዬ አስለቀሰህ
ጌታዬ ናልኝ ምትሉ እርሱን ምትጠብቁ
ዘግይቶም አይቀደምም ይህንን እወቁ
አንድ ቀን አለ ፀሐይ ትወጣለች

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 8
ትንሿ ጎጆ ብርሃን ትሞላለች
ይመጣል እግዚአብሔር ይመጣል
ቀጥሮማ መቼ ቀርቶ ያውቃል
አይዋሽም ታማኝ ነው በቃሉ

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 9
በገሃድ ይመጣል ኃያሉ
እንዳላየ ዓይተህ ጥለህ ምስኪኑን ማታልፍ
እርሱማ እንደዚህ ነው ሲሉህ የማትጸየፍ
ብለው ነበረ ይወድቃል ይህ ሰው

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 10
ዳግም አይቆምም ማንም አይረዳው
ጥሎታል እግዚአብሔር ትቶታል
ኃጢአቱ ለዚህ አብቅቶታል
ከእንግዲህ ሰው አይሆንም ሲሉኝ

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 11
አንተ ግን ፊታቸው አቆምከኝ

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው',
        lyrics_transliteration = 'CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 1
Abate hulun beyetera
Endalaye ayteh t’leh miskinun matalf
Ersuma endezih new siluh yematts’eyef
Bilew nebere yiwedqal yih sew

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 2
Dagm ayqomm manm ayredaw
T’lotal Egziabher titotal
Hat’iatu lezih abqtotal
Keengdih sew ayhonm silugn

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 3
Ante gin fitachew aqomkegn
Bezih zemenma kefa man sewn yiwedal?
Mets’ague dagm bitamem algaw lay yimotal
Wetrom endih new man astawesew

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 4
Hulu alneber wey t’lot yalefew
Kealgaye qena yaderekegn
Abableh aqfeh yastamemkegn
Bado bet bichayen qerche

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 5
Sinte danku sint gize moche
Tesebro yemimats’enn lib chel atlmna
Dem kefleh yetebezhkewn atresamna
Kebeth riqo t’efto yeheden sew

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 6
Endet degseh aqfeh teqebelkew
Abaknwal bizu bedlohal
Yiqrbh aswet’aw yiluhal
Lante gin megosqole tayeh

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 7
Enbaye leqsoye asleqeseh
Getaye nalgn mitlu ersun mitt’ebqu
Zegytom ayqedemm yihnn ewequ
And qen ale ts’ehey tiwet’alech

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 8
Tinshwa gojo birhan timolalech
Yimet’al Egziabher yimet’al
Qet’roma meche qerto yawqal
Aywashm tamagn new beqalu

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 9
Begehad yimet’al hayalu
Endalaye ayteh t’leh miskinun matalf
Ersuma endezih new siluh yematts’eyef
Bilew nebere yiwedqal yih sew

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 10
Dagm ayqomm manm ayredaw
T’lotal Egziabher titotal
Hat’iatu lezih abqtotal
Keengdih sew ayhonm silugn

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew

VERSE 11
Ante gin fitachew aqomkegn

CHORUS
Qen aleh
Egziabher qen aleh
Ante sitsera
Meshaten mignoten fets’emkew',
        updated_at = clock_timestamp()::text
    WHERE import_id = '75786a4a-39e4-43dc-b2da-9186fe4a5c4c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 1
አባቴ ሁሉን በየተራ
እንዳላየ ዓይተህ ጥለህ ምስኪኑን ማታልፍ
እርሱማ እንደዚህ ነው ሲሉህ የማትጸየፍ
ብለው ነበረ ይወድቃል ይህ ሰው

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 2
ዳግም አይቆምም ማንም አይረዳው
ጥሎታል እግዚአብሔር ትቶታል
ኃጢአቱ ለዚህ አብቅቶታል
ከእንግዲህ ሰው አይሆንም ሲሉኝ

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 3
አንተ ግን ፊታቸው አቆምከኝ
በዚህ ዘመንማ ከፋ ማን ሰውን ይወዳል?
መጻጉዕ ዳግም ቢታመም አልጋው ላይ ይሞታል
ወትሮም እንዲህ ነው ማን አስታወሰው

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 4
ሁሉ አልነበር ወይ ጥሎት ያለፈው
ከአልጋዬ ቀና ያደረከኝ
አባብለህ አቅፈህ ያስታመምከኝ
ባዶ ቤት ብቻዬን ቀርቼ

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 5
ስንቴ ዳንኩ ስንት ጊዜ ሞቼ
ተሰብሮ የሚማጸንን ልብ ቸል አትልምና
ደም ከፍለህ የተቤዥከውን አትረሳምና
ከቤትህ ርቆ ጠፍቶ የሄደን ሰው

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 6
እንዴት ደግሰህ አቅፈህ ተቀበልከው
አባክኗል ብዙ በድሎሃል
ይቅርብህ አስወጣው ይሉሃል
ላንተ ግን መጎስቆሌ ታየህ

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 7
እንባዬ ለቅሶዬ አስለቀሰህ
ጌታዬ ናልኝ ምትሉ እርሱን ምትጠብቁ
ዘግይቶም አይቀደምም ይህንን እወቁ
አንድ ቀን አለ ፀሐይ ትወጣለች

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 8
ትንሿ ጎጆ ብርሃን ትሞላለች
ይመጣል እግዚአብሔር ይመጣል
ቀጥሮማ መቼ ቀርቶ ያውቃል
አይዋሽም ታማኝ ነው በቃሉ

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 9
በገሃድ ይመጣል ኃያሉ
እንዳላየ ዓይተህ ጥለህ ምስኪኑን ማታልፍ
እርሱማ እንደዚህ ነው ሲሉህ የማትጸየፍ
ብለው ነበረ ይወድቃል ይህ ሰው

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 10
ዳግም አይቆምም ማንም አይረዳው
ጥሎታል እግዚአብሔር ትቶታል
ኃጢአቱ ለዚህ አብቅቶታል
ከእንግዲህ ሰው አይሆንም ሲሉኝ

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው

VERSE 11
አንተ ግን ፊታቸው አቆምከኝ

CHORUS
ቀን አለህ
እግዚአብሔር ቀን አለህ
አንተ ስትሠራ
መሻቴን ምኞቴን ፈጸምከው'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '75786a4a-39e4-43dc-b2da-9186fe4a5c4c'::uuid, 'ken-aleh', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yeramaw-liul ("Yeramaw Liul")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9df02b37-aa32-4064-ae43-bf4070bb989f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 1
‎
‎ለሰላስቱ ደቂቅ- ገብርኤል ስለው
እሳትን አጥፍቷል-ገብርኤል ስለው
ችግሬም በፊቱ-ገብርኤል ስለው

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 2
እንደ ሰም ይቀልጣል-ገብርኤል ስለው
ሕይወቴን በሙሉ ውብ አርገኽልኛል
ገብርኤል አባቴ ስልህ ደስ ይለኛል
መልካም ዜና ይዞ-ገብርኤል ስለው

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 3
ለምህረት የሚመጣ-ገብርኤል ስለው
የራማው ልዑል ነው-ገብርኤል ስለው
ከጭንቅ የሚያወጣ-ገብርኤል ስለው
‎ሕወቴን በሙሉ ውብ አረገኽልኛል

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 4
‎ገብርኤል አባቴ ስልህ ደስስ ይለኛል
‎

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 5
‎- ከደጁ አድጊያለሁ- ገብርኤል ስለው
‎ስሙን እየጠራው -ገብርኤል ስለው
‎- ሕይወቴን ባርኮልኝ-ገብርኤል ስለው
‎ዛሬም ዘምራለሁ-ገብርኤል ስለው

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 6
‎ሕወቴን በሙሉ ውብ አረገኽልኛል
‎ገብርኤል አባቴ ስልህ ደስስ ይለኛል
‎

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 7
‎የጎደላኝ የለም-ገብርኤል ስለው
‎ሰላም ሰፍኖልኛል-ገብርኤል ስለው
‎ከጌታ ፊት ሚቆም-ገብርኤል ስለው
‎ገብርኤል ደርሶርልኛል-ገብርኤል ስለው

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 8
‎ሕወቴን በሙሉ ውብ አረገኽልኛል
‎ገብርኤል አባቴ ስልህ ደስስ ይለኛል
‎

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 1
‎
‎leselastu deqiq- Gebriel silew
Esatn at’ftwal-Gebriel silew
Chgrem befitu-Gebriel silew

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 2
Ende sem yiqelt’al-Gebriel silew
Hiyweten bemulu wib argeኽlgnal
Gebriel abate silh des yilegnal
Melkam zena yizo-Gebriel silew

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 3
Lemhret yemimet’a-Gebriel silew
Yeramaw liul new-Gebriel silew
Kech’nq yemiyawet’a-Gebriel silew
‎hweten bemulu wib aregeኽlgnal

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 4
‎Gebriel abate silh dess yilegnal
‎

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 5
‎- kedeju adgiyalehu- Gebriel silew
‎smun eyet’eraw -Gebriel silew
‎- hiyweten barkolgn-Gebriel silew
‎zarem zemralehu-Gebriel silew

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 6
‎hweten bemulu wib aregeኽlgnal
‎Gebriel abate silh dess yilegnal
‎

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 7
‎yegodelagn yelem-Gebriel silew
‎selam sefnolgnal-Gebriel silew
‎kegeta fit miqom-Gebriel silew
‎Gebriel dersorlgnal-Gebriel silew

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 8
‎hweten bemulu wib aregeኽlgnal
‎Gebriel abate silh dess yilegnal
‎

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 1
‎
‎ለሰላስቱ ደቂቅ- ገብርኤል ስለው
እሳትን አጥፍቷል-ገብርኤል ስለው
ችግሬም በፊቱ-ገብርኤል ስለው

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 2
እንደ ሰም ይቀልጣል-ገብርኤል ስለው
ሕይወቴን በሙሉ ውብ አርገኽልኛል
ገብርኤል አባቴ ስልህ ደስ ይለኛል
መልካም ዜና ይዞ-ገብርኤል ስለው

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 3
ለምህረት የሚመጣ-ገብርኤል ስለው
የራማው ልዑል ነው-ገብርኤል ስለው
ከጭንቅ የሚያወጣ-ገብርኤል ስለው
‎ሕወቴን በሙሉ ውብ አረገኽልኛል

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 4
‎ገብርኤል አባቴ ስልህ ደስስ ይለኛል
‎

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 5
‎- ከደጁ አድጊያለሁ- ገብርኤል ስለው
‎ስሙን እየጠራው -ገብርኤል ስለው
‎- ሕይወቴን ባርኮልኝ-ገብርኤል ስለው
‎ዛሬም ዘምራለሁ-ገብርኤል ስለው

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 6
‎ሕወቴን በሙሉ ውብ አረገኽልኛል
‎ገብርኤል አባቴ ስልህ ደስስ ይለኛል
‎

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 7
‎የጎደላኝ የለም-ገብርኤል ስለው
‎ሰላም ሰፍኖልኛል-ገብርኤል ስለው
‎ከጌታ ፊት ሚቆም-ገብርኤል ስለው
‎ገብርኤል ደርሶርልኛል-ገብርኤል ስለው

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 8
‎ሕወቴን በሙሉ ውብ አረገኽልኛል
‎ገብርኤል አባቴ ስልህ ደስስ ይለኛል
‎

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ',
        lyrics_transliteration = 'CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 1
‎
‎leselastu deqiq- Gebriel silew
Esatn at’ftwal-Gebriel silew
Chgrem befitu-Gebriel silew

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 2
Ende sem yiqelt’al-Gebriel silew
Hiyweten bemulu wib argeኽlgnal
Gebriel abate silh des yilegnal
Melkam zena yizo-Gebriel silew

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 3
Lemhret yemimet’a-Gebriel silew
Yeramaw liul new-Gebriel silew
Kech’nq yemiyawet’a-Gebriel silew
‎hweten bemulu wib aregeኽlgnal

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 4
‎Gebriel abate silh dess yilegnal
‎

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 5
‎- kedeju adgiyalehu- Gebriel silew
‎smun eyet’eraw -Gebriel silew
‎- hiyweten barkolgn-Gebriel silew
‎zarem zemralehu-Gebriel silew

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 6
‎hweten bemulu wib aregeኽlgnal
‎Gebriel abate silh dess yilegnal
‎

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 7
‎yegodelagn yelem-Gebriel silew
‎selam sefnolgnal-Gebriel silew
‎kegeta fit miqom-Gebriel silew
‎Gebriel dersorlgnal-Gebriel silew

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn

VERSE 8
‎hweten bemulu wib aregeኽlgnal
‎Gebriel abate silh dess yilegnal
‎

CHORUS
Yeramaw liul megabe hedis
‎ch’nqeten liyaqel fet’no yemides
‎Gebriel silew dess yemilegn
‎fqres liyu new lesu yalegn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9df02b37-aa32-4064-ae43-bf4070bb989f'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 1
‎
‎ለሰላስቱ ደቂቅ- ገብርኤል ስለው
እሳትን አጥፍቷል-ገብርኤል ስለው
ችግሬም በፊቱ-ገብርኤል ስለው

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 2
እንደ ሰም ይቀልጣል-ገብርኤል ስለው
ሕይወቴን በሙሉ ውብ አርገኽልኛል
ገብርኤል አባቴ ስልህ ደስ ይለኛል
መልካም ዜና ይዞ-ገብርኤል ስለው

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 3
ለምህረት የሚመጣ-ገብርኤል ስለው
የራማው ልዑል ነው-ገብርኤል ስለው
ከጭንቅ የሚያወጣ-ገብርኤል ስለው
‎ሕወቴን በሙሉ ውብ አረገኽልኛል

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 4
‎ገብርኤል አባቴ ስልህ ደስስ ይለኛል
‎

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 5
‎- ከደጁ አድጊያለሁ- ገብርኤል ስለው
‎ስሙን እየጠራው -ገብርኤል ስለው
‎- ሕይወቴን ባርኮልኝ-ገብርኤል ስለው
‎ዛሬም ዘምራለሁ-ገብርኤል ስለው

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 6
‎ሕወቴን በሙሉ ውብ አረገኽልኛል
‎ገብርኤል አባቴ ስልህ ደስስ ይለኛል
‎

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 7
‎የጎደላኝ የለም-ገብርኤል ስለው
‎ሰላም ሰፍኖልኛል-ገብርኤል ስለው
‎ከጌታ ፊት ሚቆም-ገብርኤል ስለው
‎ገብርኤል ደርሶርልኛል-ገብርኤል ስለው

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ

VERSE 8
‎ሕወቴን በሙሉ ውብ አረገኽልኛል
‎ገብርኤል አባቴ ስልህ ደስስ ይለኛል
‎

CHORUS
የራማው ልዑል መጋቤ ሐዲስ
‎ጭንቀቴን ሊያቀል ፈጥኖ የሚደስ
‎ገብርኤል ስለው ደስስ የሚለኝ
‎ፍቅሬስ ልዩ ነው ለሱ ያለኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9df02b37-aa32-4064-ae43-bf4070bb989f'::uuid, 'yeramaw-liul', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yetewedede-ken ("Yetewedede Ken")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '84d3c52f-bf4e-4671-afc1-8576c96f96a1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 1
አምሽቶ የመጣ አይገባም አትበሉ
አባክኖ የመጣ አይገባም አትበሉ
ፍቅር ሰለሆነ እግዚአብሔር ለሁሉ
ልጅ ቤቱን ይወርሳል እንደተሰፋ ቃሉ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 2
ከናዝሬት መልካም ሰው አይወጣም እያሉ
ፊልጶስ ናትናኤል ይነጋገራሉ
አድርጎታልና ውሀውን ወይን
ዛሬም ለውጦኛል ወስዶታል ልቤን

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 3
እኔ ነኝ አላማው እኔ ነኝ ሀሳቡ
አባቴ ደግ ነው የሚራራ ልቡ
ዘጠና ዘጠኙን ታምነውት እያለ
አንዱን ይፈልጋል ወዴት ነህ እያለ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 4
ሁሉን አይቻለሁ ሁሉን መርምሬአለሁ
በዓለም ካንተ ሌላ እንደሌለ አውቃለሁ
እንደማይለወጥ አባትነትህ ወዳጅነትህ
ጠፍቼ ስመጣ አየሁት ልጅህ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 5
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት x2

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 1
Amshto yemet’a aygebam atbelu
Abakno yemet’a aygebam atbelu
Fiqr selehone Egziabher lehulu
Lij betun yiwersal endetesefa qalu

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 2
Kenazret melkam sew aywet’am eyalu
Filp’os natnael yinegageralu
Adrgotalna wihewn weyn
Zarem lewt’ognal wesdotal liben

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 3
Ene negn alamaw ene negn hesabu
Abate deg new yemirara libu
Zet’ena zet’egnun tamnewt eyale
Andun yifelgal wedet neh eyale

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 4
Hulun aychalehu hulun mermrealehu
Bealem kante lela endelele awqalehu
Endemaylewet’ abatneth wedajneth
T’efche simet’a ayehut lijh

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 5
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet x2

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 1
አምሽቶ የመጣ አይገባም አትበሉ
አባክኖ የመጣ አይገባም አትበሉ
ፍቅር ሰለሆነ እግዚአብሔር ለሁሉ
ልጅ ቤቱን ይወርሳል እንደተሰፋ ቃሉ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 2
ከናዝሬት መልካም ሰው አይወጣም እያሉ
ፊልጶስ ናትናኤል ይነጋገራሉ
አድርጎታልና ውሀውን ወይን
ዛሬም ለውጦኛል ወስዶታል ልቤን

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 3
እኔ ነኝ አላማው እኔ ነኝ ሀሳቡ
አባቴ ደግ ነው የሚራራ ልቡ
ዘጠና ዘጠኙን ታምነውት እያለ
አንዱን ይፈልጋል ወዴት ነህ እያለ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 4
ሁሉን አይቻለሁ ሁሉን መርምሬአለሁ
በዓለም ካንተ ሌላ እንደሌለ አውቃለሁ
እንደማይለወጥ አባትነትህ ወዳጅነትህ
ጠፍቼ ስመጣ አየሁት ልጅህ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 5
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት x2

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2',
        lyrics_transliteration = 'CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 1
Amshto yemet’a aygebam atbelu
Abakno yemet’a aygebam atbelu
Fiqr selehone Egziabher lehulu
Lij betun yiwersal endetesefa qalu

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 2
Kenazret melkam sew aywet’am eyalu
Filp’os natnael yinegageralu
Adrgotalna wihewn weyn
Zarem lewt’ognal wesdotal liben

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 3
Ene negn alamaw ene negn hesabu
Abate deg new yemirara libu
Zet’ena zet’egnun tamnewt eyale
Andun yifelgal wedet neh eyale

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 4
Hulun aychalehu hulun mermrealehu
Bealem kante lela endelele awqalehu
Endemaylewet’ abatneth wedajneth
T’efche simet’a ayehut lijh

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2

VERSE 5
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet x2

CHORUS
Yetewedede qen yetewedede amet
Wede abate fiqr yetemeleskubet
Anbar qelebetn yeteshelemkumebet
Yetewedede amet X2',
        updated_at = clock_timestamp()::text
    WHERE import_id = '84d3c52f-bf4e-4671-afc1-8576c96f96a1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 1
አምሽቶ የመጣ አይገባም አትበሉ
አባክኖ የመጣ አይገባም አትበሉ
ፍቅር ሰለሆነ እግዚአብሔር ለሁሉ
ልጅ ቤቱን ይወርሳል እንደተሰፋ ቃሉ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 2
ከናዝሬት መልካም ሰው አይወጣም እያሉ
ፊልጶስ ናትናኤል ይነጋገራሉ
አድርጎታልና ውሀውን ወይን
ዛሬም ለውጦኛል ወስዶታል ልቤን

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 3
እኔ ነኝ አላማው እኔ ነኝ ሀሳቡ
አባቴ ደግ ነው የሚራራ ልቡ
ዘጠና ዘጠኙን ታምነውት እያለ
አንዱን ይፈልጋል ወዴት ነህ እያለ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 4
ሁሉን አይቻለሁ ሁሉን መርምሬአለሁ
በዓለም ካንተ ሌላ እንደሌለ አውቃለሁ
እንደማይለወጥ አባትነትህ ወዳጅነትህ
ጠፍቼ ስመጣ አየሁት ልጅህ

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2

VERSE 5
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት x2

CHORUS
የተወደደ ቀን የተወደደ ዓመት
ወደ አባቴ ፍቅር የተመለስኩበት
አንባር ቀለበትን የተሸለምኩመበት
የተወደደ ዓመት X2'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '84d3c52f-bf4e-4671-afc1-8576c96f96a1'::uuid, 'yetewedede-ken', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- meliak ("Meliak")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7edcc640-5c36-4042-82e8-4d3f7570bcf1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 1
የታየህ አገልጋይ ይታየኝ
ሰልፉ ሲበረታ እንዳልፈራ
ያንን ቅዱስ መልኣክ ጌታ ሆይ አደራ
እኖራለሁ በሞገስ እኖራለሁ በፀጋ

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 2
በጨለመዉ ለሊት መልሶ እየነጋ
አባቴ መልአኩን አዘኸዉ ስለኔ
የመዉጣት የመዉረስ የምርኮ ነዉ ቀኔ
አዝ

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 3
ታላቁ ሚካኤል ያንተ ወዳጅ
ዘንዶዉን የጣለ በፀናች እጅ
ስለሙሴም ስጋ ሲከራከር
አየዉ በመንፈሴ ሰይጣንን ሲያሳፍር

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 4
እግሮቼ በድንጋይ ላይሰናከሉ
አለ ካጠገቤ በመንገዴ ሁሉ
ከደመናዉ በታች ይጓዛል እስራኤል
ምክሩን ይፈፅማል ታዛዡ ሚካኤል

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 5
አዝ
ወይኒዉ ወለል አለ ተከፈተ
ህመሜም ታመመ ሞቴም ሞተ
አምላክ ከኔ ጋራ ስለሆነ

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 6
በዉስጥም በዉጭም ሰላም ሆነ
ከእስረሮቹ መሀል አንዳች ነክቶት ጎኔ
ልክ እንደ ጴጥሮስ ማምለጥ ሆኗል ለኔ
አየሁት ጎጆዬን ቤቴ በእሳት ታጥሮ

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 7
የጌታዬን ማዳን የእረፍቴን ቀጥሮ
አዝ

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 1
Yetayeh agelgay yitayegn
Selfu sibereta endalfera
Yann Kidus melak Geta hoy adera
Enoralehu bemoges enoralehu bets’ega

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 2
Bech’elemewu lelit melso eyenega
Abate melakun azeኸwu silene
Yemewut’at yemewures yemrko newu qene
CHORUS

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 3
Talaqu Mikael yante wedaj
Zendowun yet’ale bets’enach ej
Silemusem siga sikeraker
Ayewu bemenfese seyt’ann siyasafr

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 4
Egroche bedngay laysenakelu
Ale kat’egebe bemengede hulu
Kedemenawu betach yigwazal esrael
Mikrun yifets’mal tazazhu Mikael

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 5
CHORUS
Weyniwu welel ale tekefete
Himemem tameme motem mote
Amlak kene gara silehone

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 6
Bewust’m bewuch’m selam hone
Keesrerochu mehel andach nektot gone
Lik ende p’et’ros mamlet’ honwal lene
Ayehut gojoyen bete beesat tat’ro

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 7
Yegetayen madan yeereften qet’ro
CHORUS

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 1
የታየህ አገልጋይ ይታየኝ
ሰልፉ ሲበረታ እንዳልፈራ
ያንን ቅዱስ መልኣክ ጌታ ሆይ አደራ
እኖራለሁ በሞገስ እኖራለሁ በፀጋ

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 2
በጨለመዉ ለሊት መልሶ እየነጋ
አባቴ መልአኩን አዘኸዉ ስለኔ
የመዉጣት የመዉረስ የምርኮ ነዉ ቀኔ
አዝ

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 3
ታላቁ ሚካኤል ያንተ ወዳጅ
ዘንዶዉን የጣለ በፀናች እጅ
ስለሙሴም ስጋ ሲከራከር
አየዉ በመንፈሴ ሰይጣንን ሲያሳፍር

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 4
እግሮቼ በድንጋይ ላይሰናከሉ
አለ ካጠገቤ በመንገዴ ሁሉ
ከደመናዉ በታች ይጓዛል እስራኤል
ምክሩን ይፈፅማል ታዛዡ ሚካኤል

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 5
አዝ
ወይኒዉ ወለል አለ ተከፈተ
ህመሜም ታመመ ሞቴም ሞተ
አምላክ ከኔ ጋራ ስለሆነ

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 6
በዉስጥም በዉጭም ሰላም ሆነ
ከእስረሮቹ መሀል አንዳች ነክቶት ጎኔ
ልክ እንደ ጴጥሮስ ማምለጥ ሆኗል ለኔ
አየሁት ጎጆዬን ቤቴ በእሳት ታጥሮ

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ

VERSE 7
የጌታዬን ማዳን የእረፍቴን ቀጥሮ
አዝ

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ',
        lyrics_transliteration = 'CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 1
Yetayeh agelgay yitayegn
Selfu sibereta endalfera
Yann Kidus melak Geta hoy adera
Enoralehu bemoges enoralehu bets’ega

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 2
Bech’elemewu lelit melso eyenega
Abate melakun azeኸwu silene
Yemewut’at yemewures yemrko newu qene
CHORUS

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 3
Talaqu Mikael yante wedaj
Zendowun yet’ale bets’enach ej
Silemusem siga sikeraker
Ayewu bemenfese seyt’ann siyasafr

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 4
Egroche bedngay laysenakelu
Ale kat’egebe bemengede hulu
Kedemenawu betach yigwazal esrael
Mikrun yifets’mal tazazhu Mikael

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 5
CHORUS
Weyniwu welel ale tekefete
Himemem tameme motem mote
Amlak kene gara silehone

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 6
Bewust’m bewuch’m selam hone
Keesrerochu mehel andach nektot gone
Lik ende p’et’ros mamlet’ honwal lene
Ayehut gojoyen bete beesat tat’ro

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn

VERSE 7
Yegetayen madan yeereften qet’ro
CHORUS

CHORUS
Yemiyaberetatawu yann melak asebkut abetu (2)
Gulbetem sizl libem sifera
Yann melak Geta hoy adera
Yabereta melak yabertagn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7edcc640-5c36-4042-82e8-4d3f7570bcf1'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ
የታየህ አገልጋይ ይታየኝ
ሰልፉ ሲበረታ እንዳልፈራ
ያንን ቅዱስ መልኣክ ጌታ ሆይ አደራ
እኖራለሁ በሞገስ እኖራለሁ በፀጋ
በጨለመዉ ለሊት መልሶ እየነጋ
አባቴ መልአኩን አዘኸዉ ስለኔ
የመዉጣት የመዉረስ የምርኮ ነዉ ቀኔ
አዝ❤
ታላቁ ሚካኤል ያንተ ወዳጅ
ዘንዶዉን የጣለ በፀናች እጅ
ስለሙሴም ስጋ ሲከራከር
አየዉ በመንፈሴ ሰይጣንን ሲያሳፍር
እግሮቼ በድንጋይ ላይሰናከሉ
አለ ካጠገቤ በመንገዴ ሁሉ
ከደመናዉ በታች ይጓዛል እስራኤል
ምክሩን ይፈፅማል ታዛዡ ሚካኤል
አዝ❤
ወይኒዉ ወለል አለ ተከፈተ
ህመሜም ታመመ ሞቴም ሞተ
አምላክ ከኔ ጋራ ስለሆነ
በዉስጥም በዉጭም ሰላም ሆነ
ከእስረሮቹ መሀል አንዳች ነክቶት ጎኔ
ልክ እንደ ጴጥሮስ ማምለጥ ሆኗል ለኔ
አየሁት ጎጆዬን ቤቴ በእሳት ታጥሮ
የጌታዬን ማዳን የእረፍቴን ቀጥሮ
አዝ❤

VERSE 1
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ
የታየህ አገልጋይ ይታየኝ
ሰልፉ ሲበረታ እንዳልፈራ
ያንን ቅዱስ መልኣክ ጌታ ሆይ አደራ
እኖራለሁ በሞገስ እኖራለሁ በፀጋ
በጨለመዉ ለሊት መልሶ እየነጋ
አባቴ መልአኩን አዘኸዉ ስለኔ
የመዉጣት የመዉረስ የምርኮ ነዉ ቀኔ
አዝ❤
ታላቁ ሚካኤል ያንተ ወዳጅ
ዘንዶዉን የጣለ በፀናች እጅ
ስለሙሴም ስጋ ሲከራከር
አየዉ በመንፈሴ ሰይጣንን ሲያሳፍር
እግሮቼ በድንጋይ ላይሰናከሉ
አለ ካጠገቤ በመንገዴ ሁሉ
ከደመናዉ በታች ይጓዛል እስራኤል
ምክሩን ይፈፅማል ታዛዡ ሚካኤል
አዝ❤
ወይኒዉ ወለል አለ ተከፈተ
ህመሜም ታመመ ሞቴም ሞተ
አምላክ ከኔ ጋራ ስለሆነ
በዉስጥም በዉጭም ሰላም ሆነ
ከእስረሮቹ መሀል አንዳች ነክቶት ጎኔ
ልክ እንደ ጴጥሮስ ማምለጥ ሆኗል ለኔ
አየሁት ጎጆዬን ቤቴ በእሳት ታጥሮ
የጌታዬን ማዳን የእረፍቴን ቀጥሮ
አዝ❤

CHORUS
የሚያበረታታዉ ያንን መልአክ አሰብኩት አቤቱ(2)
ጉልበቴም ሲዝል ልቤም ሲፈራ
ያንን መልኣክ ጌታ ሆይ አደራ
ያበረታ መልኣክ ያበርታኝ
የታየህ አገልጋይ ይታየኝ
ሰልፉ ሲበረታ እንዳልፈራ
ያንን ቅዱስ መልኣክ ጌታ ሆይ አደራ
እኖራለሁ በሞገስ እኖራለሁ በፀጋ
በጨለመዉ ለሊት መልሶ እየነጋ
አባቴ መልአኩን አዘኸዉ ስለኔ
የመዉጣት የመዉረስ የምርኮ ነዉ ቀኔ
አዝ❤
ታላቁ ሚካኤል ያንተ ወዳጅ
ዘንዶዉን የጣለ በፀናች እጅ
ስለሙሴም ስጋ ሲከራከር
አየዉ በመንፈሴ ሰይጣንን ሲያሳፍር
እግሮቼ በድንጋይ ላይሰናከሉ
አለ ካጠገቤ በመንገዴ ሁሉ
ከደመናዉ በታች ይጓዛል እስራኤል
ምክሩን ይፈፅማል ታዛዡ ሚካኤል
አዝ❤
ወይኒዉ ወለል አለ ተከፈተ
ህመሜም ታመመ ሞቴም ሞተ
አምላክ ከኔ ጋራ ስለሆነ
በዉስጥም በዉጭም ሰላም ሆነ
ከእስረሮቹ መሀል አንዳች ነክቶት ጎኔ
ልክ እንደ ጴጥሮስ ማምለጥ ሆኗል ለኔ
አየሁት ጎጆዬን ቤቴ በእሳት ታጥሮ
የጌታዬን ማዳን የእረፍቴን ቀጥሮ
አዝ❤'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7edcc640-5c36-4042-82e8-4d3f7570bcf1'::uuid, 'meliak', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- zeetan-antsere ("Ze’etan Antsere")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '7e0819fd-9352-43ff-9dca-d8801d1163d2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዘእጣን አንጸረ (፪)
በጎልጎታ ተረክበ ዕፀ መስቀል (፪)

VERSE 1
ዘእጣን አንጸረ (፪)
በጎልጎታ ተረክበ ዕፀ መስቀል (፪)

CHORUS
ዘእጣን አንጸረ (፪)
በጎልጎታ ተረክበ ዕፀ መስቀል (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ze’etan antsere (2)
BeGolgota terekbe etse meskel (2)

VERSE 1
Ze’etan antsere (2)
BeGolgota terekbe etse meskel (2)

CHORUS
Ze’etan antsere (2)
BeGolgota terekbe etse meskel (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዘእጣን አንጸረ (፪)
በጎልጎታ ተረክበ ዕፀ መስቀል (፪)

VERSE 1
ዘእጣን አንጸረ (፪)
በጎልጎታ ተረክበ ዕፀ መስቀል (፪)

CHORUS
ዘእጣን አንጸረ (፪)
በጎልጎታ ተረክበ ዕፀ መስቀል (፪)',
        lyrics_transliteration = 'CHORUS
Ze’etan antsere (2)
BeGolgota terekbe etse meskel (2)

VERSE 1
Ze’etan antsere (2)
BeGolgota terekbe etse meskel (2)

CHORUS
Ze’etan antsere (2)
BeGolgota terekbe etse meskel (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '7e0819fd-9352-43ff-9dca-d8801d1163d2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዘእጣን አንጸረ (፪)
በጎልጎታ ተረክበ ዕፀ መስቀል (፪)

VERSE 1
ዘእጣን አንጸረ (፪)
በጎልጎታ ተረክበ ዕፀ መስቀል (፪)

CHORUS
ዘእጣን አንጸረ (፪)
በጎልጎታ ተረክበ ዕፀ መስቀል (፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Ze’etan antsere (2)
BeGolgota terekbe etse meskel (2)

VERSE 1
Ze’etan antsere (2)
BeGolgota terekbe etse meskel (2)

CHORUS
Ze’etan antsere (2)
BeGolgota terekbe etse meskel (2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '7e0819fd-9352-43ff-9dca-d8801d1163d2'::uuid, 'zeetan-antsere', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- alemamenen-eridaw-getaye ("Alemamenen Eridaw Getaye")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '85ce60c0-3caf-4f4b-bb2b-2a1ab68a1530'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
رداي
دا نا ي
داتا
دا

VERSE 1
ناش دا
ري زلك
بهون را ر لا
يت قا قد نا ي نا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 2
ردا
ردا مشش دا
نات
رك ر بر ر زس زار نادان دا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 3
دا مش ش ما
لم ب
ر كب و زداني بفكر شف ما
منني نا مشش على ما

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 4
مني
ز ار
ر بدل ت رت يتس ين دا
داش ردا دا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 5
دا كتنا شنتي جمره استمر ين فكر
يت زس بما بمقد ان
ب

CHORUS
رداي
دا نا ي
داتا
دا'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
رداي
دا نا ي
داتا
دا

VERSE 1
ناش دا
ري زلك
بهون را ر لا
يت قا قد نا ي نا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 2
ردا
ردا مشش دا
نات
رك ر بر ر زس زار نادان دا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 3
دا مش ش ما
لم ب
ر كب و زداني بفكر شف ما
منني نا مشش على ما

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 4
مني
ز ار
ر بدل ت رت يتس ين دا
داش ردا دا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 5
دا كتنا شنتي جمره استمر ين فكر
يت زس بما بمقد ان
ب

CHORUS
رداي
دا نا ي
داتا
دا'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
رداي
دا نا ي
داتا
دا

VERSE 1
ناش دا
ري زلك
بهون را ر لا
يت قا قد نا ي نا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 2
ردا
ردا مشش دا
نات
رك ر بر ر زس زار نادان دا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 3
دا مش ش ما
لم ب
ر كب و زداني بفكر شف ما
منني نا مشش على ما

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 4
مني
ز ار
ر بدل ت رت يتس ين دا
داش ردا دا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 5
دا كتنا شنتي جمره استمر ين فكر
يت زس بما بمقد ان
ب

CHORUS
رداي
دا نا ي
داتا
دا',
        lyrics_transliteration = 'CHORUS
رداي
دا نا ي
داتا
دا

VERSE 1
ناش دا
ري زلك
بهون را ر لا
يت قا قد نا ي نا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 2
ردا
ردا مشش دا
نات
رك ر بر ر زس زار نادان دا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 3
دا مش ش ما
لم ب
ر كب و زداني بفكر شف ما
منني نا مشش على ما

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 4
مني
ز ار
ر بدل ت رت يتس ين دا
داش ردا دا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 5
دا كتنا شنتي جمره استمر ين فكر
يت زس بما بمقد ان
ب

CHORUS
رداي
دا نا ي
داتا
دا',
        updated_at = clock_timestamp()::text
    WHERE import_id = '85ce60c0-3caf-4f4b-bb2b-2a1ab68a1530'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
رداي
دا نا ي
داتا
دا

VERSE 1
ناش دا
ري زلك
بهون را ر لا
يت قا قد نا ي نا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 2
ردا
ردا مشش دا
نات
رك ر بر ر زس زار نادان دا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 3
دا مش ش ما
لم ب
ر كب و زداني بفكر شف ما
منني نا مشش على ما

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 4
مني
ز ار
ر بدل ت رت يتس ين دا
داش ردا دا

CHORUS
رداي
دا نا ي
داتا
دا

VERSE 5
دا كتنا شنتي جمره استمر ين فكر
يت زس بما بمقد ان
ب

CHORUS
رداي
دا نا ي
داتا
دا'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '85ce60c0-3caf-4f4b-bb2b-2a1ab68a1530'::uuid, 'alemamenen-eridaw-getaye', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- fikirih-marekegn-3806 ("Fikirih Marekegn")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8970594a-7247-4a25-8d55-2486ed7cfaa5'::uuid
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
    WHERE import_id = '8970594a-7247-4a25-8d55-2486ed7cfaa5'::uuid
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
        '8970594a-7247-4a25-8d55-2486ed7cfaa5'::uuid, 'fikirih-marekegn-3806', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- abiet-neaka-zemarit-merry-temelso-eritrean-orthodox-tewahdo-mezmur ("~Abiet Neaka ~Zemarit Merry Temelso~Eritrean Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8ecf269f-ebfa-4dfa-99c0-28313782dcd6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ

VERSE 1
ኣብዚ ዓቢ ጎቦ ሜዳ ጎልጎል ኮነ
ብግንቢ ዝተሃንጹ ብኣጽዋር ዝተኸቡ
ከተማታት ኣህዛብ ብመዝሙር ፈረሱ
ሸሞንተ ንፋሳት ትሕዞም ንስኻ

CHORUS
ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ

VERSE 2
ባሕርን ውቅያኖስን እዩ ዘሎ ቅድሜኻ
ውሽጥና ኣይከኣለን ቀልዓለም ክገብር
ንሃገር ጥበብ ንዓኻ እግዚኣብሄር
ብምጽንንዓኻ ሕይወትና መሊስካ

CHORUS
ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ

VERSE 3
ብጥዑም ቃላትካ ነብስና ኣርጊእኻ
ንዝና ኣይኮነን ወይስ ንሽመታ
ትንስምረልካ ነምልኾ እዩ ጎይታ
ኣብ ባሕሪ ጥብርያዶስ ድግስካ ሓሪፍና

CHORUS
ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ

VERSE 4
ካብ እንጌራ ፎርኦን ፍቅርኻ ናፊቅና
ናይ ቦኤዝ ሕርሻ ንሕና ኣይንቀርምን
መናኻ ንዓጽድ እግዚኣብሄር መድህን

CHORUS
ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Abet niaኻ nismka alo misgana
Kem natka yelen egziabher zihagezena
Kemaኻ yelen kab widqet zetenseana
Abet timdhanka abana fesese

VERSE 1
Abzi abi gobo meda golgol kone
Bignbi zitehants’u biats’war ziteኸbu
Ketematat ahzab bimezmur feresu
Shemonte nifasat tihzom nisኻ

CHORUS
Abet niaኻ nismka alo misgana
Kem natka yelen egziabher zihagezena
Kemaኻ yelen kab widqet zetenseana
Abet timdhanka abana fesese

VERSE 2
Bahrn wiqyanosn eyu zelo qidmeኻ
Wisht’na aykealen qelalem kigebr
Nihager t’beb niaኻ egziabher
Bimts’nnaኻ hiywetna meliska

CHORUS
Abet niaኻ nismka alo misgana
Kem natka yelen egziabher zihagezena
Kemaኻ yelen kab widqet zetenseana
Abet timdhanka abana fesese

VERSE 3
Bit’um qalatka nebsna argieኻ
Nizna aykonen weys nishmeta
Tinsmrelka nemlኾ eyu goyta
Ab bahri t’bryados digska harifna

CHORUS
Abet niaኻ nismka alo misgana
Kem natka yelen egziabher zihagezena
Kemaኻ yelen kab widqet zetenseana
Abet timdhanka abana fesese

VERSE 4
Kab engera foron fiqrኻ nafiqna
Nay boez hirsha nihna aynqermn
Menaኻ niats’d egziabher medhn

CHORUS
Abet niaኻ nismka alo misgana
Kem natka yelen egziabher zihagezena
Kemaኻ yelen kab widqet zetenseana
Abet timdhanka abana fesese'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ

VERSE 1
ኣብዚ ዓቢ ጎቦ ሜዳ ጎልጎል ኮነ
ብግንቢ ዝተሃንጹ ብኣጽዋር ዝተኸቡ
ከተማታት ኣህዛብ ብመዝሙር ፈረሱ
ሸሞንተ ንፋሳት ትሕዞም ንስኻ

CHORUS
ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ

VERSE 2
ባሕርን ውቅያኖስን እዩ ዘሎ ቅድሜኻ
ውሽጥና ኣይከኣለን ቀልዓለም ክገብር
ንሃገር ጥበብ ንዓኻ እግዚኣብሄር
ብምጽንንዓኻ ሕይወትና መሊስካ

CHORUS
ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ

VERSE 3
ብጥዑም ቃላትካ ነብስና ኣርጊእኻ
ንዝና ኣይኮነን ወይስ ንሽመታ
ትንስምረልካ ነምልኾ እዩ ጎይታ
ኣብ ባሕሪ ጥብርያዶስ ድግስካ ሓሪፍና

CHORUS
ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ

VERSE 4
ካብ እንጌራ ፎርኦን ፍቅርኻ ናፊቅና
ናይ ቦኤዝ ሕርሻ ንሕና ኣይንቀርምን
መናኻ ንዓጽድ እግዚኣብሄር መድህን

CHORUS
ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ',
        lyrics_transliteration = 'CHORUS
Abet niaኻ nismka alo misgana
Kem natka yelen egziabher zihagezena
Kemaኻ yelen kab widqet zetenseana
Abet timdhanka abana fesese

VERSE 1
Abzi abi gobo meda golgol kone
Bignbi zitehants’u biats’war ziteኸbu
Ketematat ahzab bimezmur feresu
Shemonte nifasat tihzom nisኻ

CHORUS
Abet niaኻ nismka alo misgana
Kem natka yelen egziabher zihagezena
Kemaኻ yelen kab widqet zetenseana
Abet timdhanka abana fesese

VERSE 2
Bahrn wiqyanosn eyu zelo qidmeኻ
Wisht’na aykealen qelalem kigebr
Nihager t’beb niaኻ egziabher
Bimts’nnaኻ hiywetna meliska

CHORUS
Abet niaኻ nismka alo misgana
Kem natka yelen egziabher zihagezena
Kemaኻ yelen kab widqet zetenseana
Abet timdhanka abana fesese

VERSE 3
Bit’um qalatka nebsna argieኻ
Nizna aykonen weys nishmeta
Tinsmrelka nemlኾ eyu goyta
Ab bahri t’bryados digska harifna

CHORUS
Abet niaኻ nismka alo misgana
Kem natka yelen egziabher zihagezena
Kemaኻ yelen kab widqet zetenseana
Abet timdhanka abana fesese

VERSE 4
Kab engera foron fiqrኻ nafiqna
Nay boez hirsha nihna aynqermn
Menaኻ niats’d egziabher medhn

CHORUS
Abet niaኻ nismka alo misgana
Kem natka yelen egziabher zihagezena
Kemaኻ yelen kab widqet zetenseana
Abet timdhanka abana fesese',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8ecf269f-ebfa-4dfa-99c0-28313782dcd6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ

VERSE 1
ኣብዚ ዓቢ ጎቦ ሜዳ ጎልጎል ኮነ
ብግንቢ ዝተሃንጹ ብኣጽዋር ዝተኸቡ
ከተማታት ኣህዛብ ብመዝሙር ፈረሱ
ሸሞንተ ንፋሳት ትሕዞም ንስኻ

CHORUS
ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ

VERSE 2
ባሕርን ውቅያኖስን እዩ ዘሎ ቅድሜኻ
ውሽጥና ኣይከኣለን ቀልዓለም ክገብር
ንሃገር ጥበብ ንዓኻ እግዚኣብሄር
ብምጽንንዓኻ ሕይወትና መሊስካ

CHORUS
ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ

VERSE 3
ብጥዑም ቃላትካ ነብስና ኣርጊእኻ
ንዝና ኣይኮነን ወይስ ንሽመታ
ትንስምረልካ ነምልኾ እዩ ጎይታ
ኣብ ባሕሪ ጥብርያዶስ ድግስካ ሓሪፍና

CHORUS
ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ

VERSE 4
ካብ እንጌራ ፎርኦን ፍቅርኻ ናፊቅና
ናይ ቦኤዝ ሕርሻ ንሕና ኣይንቀርምን
መናኻ ንዓጽድ እግዚኣብሄር መድህን

CHORUS
ኣቤት ንዓኻ ንስምካ ኣሎ ምስጋና
ከም ናትካ የለን እግዚኣብሄር ዝሓገዘና
ከማኻ የለን ካብ ውድቀት ዘተንሰኣና
ኣቤት ትምድሓንካ ኣባና ፈሰሰ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8ecf269f-ebfa-4dfa-99c0-28313782dcd6'::uuid, 'abiet-neaka-zemarit-merry-temelso-eritrean-orthodox-tewahdo-mezmur', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- min-semah-yohannes ("Min Semah Yohannes")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '95721efb-16f1-4ba1-844d-e6e421a6f4a9'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ህጻን ሆነህ ነብይ ለክብር የተጠራህ/2/',
        lyrics_transliteration = 'CHORUS
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
Hits’an honeh nebiy lekibir yetet’erah (x2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = '95721efb-16f1-4ba1-844d-e6e421a6f4a9'::uuid
      AND deleted_at IS NULL
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
Hits’an honeh nebiy lekibir yetet’erah (x2)';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '95721efb-16f1-4ba1-844d-e6e421a6f4a9'::uuid, 'min-semah-yohannes', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yasalefikut ("Yasalefikut")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8e3faecf-2e40-4066-8748-8abdb5902be4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን

VERSE 1
አንደበቴም በል ተፈታ ስለ ጽዮን ለመመስከር
ዘምርላት አመስግናት አውጅ ለዓለም ግለጥ ንገር
ትውልድ ይስማ ስለክብሯ ለምስጋና ይታደም
ማርያም(፪)የሚላትም ድንግል ፍጹም አትረሳም

CHORUS
ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን

VERSE 2
መልካሞችም ተሰብሰቡ ጽድቅን ማፍራት ያቃታችሁ
ማሰሮዋ ጨው ይዛለች ሊወገድ ነው መርገማችሁ
መረጋጋት ያቃታችሁ የዳዊት ልጅ ታጽናናችሁ
መሰንቆ ናት ድንግል ማርያም ድምጿ ፈውስን ያድላችሁ

CHORUS
ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን

VERSE 3
የሞትን ድምጽ ውስጤ ሰምቶ ተጨንቄ ግራ ገብቶኝ
ማምለጫውን መሸሸጊያ እንዴት እንደሆን እንኳጠፍቶኝ
ብቻየን ነኝ ድረሽልኝ ብየሽ ነበር በጭንቀቴ
አልተውሽኝም ፈጥነሽ ደርሰሽ አወጣሽኝ እመቤቴ

CHORUS
ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን

VERSE 4
ንግስቲቱ የወርቅ ልብስ ተጎናጽፋ ተሸልማ
በንጉሱ በልጇ ቀኝ የአምላክ እናት በክብርቆማ
ቃልኪዷኗን አሳስባለች ሀጥአንን ልታስምር
በጽናጽል በከበሮ እናመስግን እንዘምር።

CHORUS
ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yasalefkut bizu neger bene hiywet yeserashw
Mech tenegro mech tegelt’o ledekama yaderegshw
Letwldu egelt’alehu enate hoy wiletashn
Maryam (2) elshalehu enegralehu tamrshn

VERSE 1
Andebetem bel tefeta sile ts’yon lememesker
Zemrlat amesgnat awj lealem gilet’ niger
Tiwld yisma silekbrwa lemsgana yitadem
Maryam (2)yemilatm Dingil fits’um atresam

CHORUS
Yasalefkut bizu neger bene hiywet yeserashw
Mech tenegro mech tegelt’o ledekama yaderegshw
Letwldu egelt’alehu enate hoy wiletashn
Maryam (2) elshalehu enegralehu tamrshn

VERSE 2
Melkamochm tesebsebu ts’dqn mafrat yaqatachhu
Maserowa ch’ew yizalech liweged new mergemachhu
Meregagat yaqatachhu yedawit lij tats’nanachhu
Mesenqo nat Dingil Maryam dimts’wa fewsn yadlachhu

CHORUS
Yasalefkut bizu neger bene hiywet yeserashw
Mech tenegro mech tegelt’o ledekama yaderegshw
Letwldu egelt’alehu enate hoy wiletashn
Maryam (2) elshalehu enegralehu tamrshn

VERSE 3
Yemotn dimts’ wist’e semto tech’enqe gira gebtogn
Mamlech’awn mesheshegiya endet endehon enkwat’eftogn
Bichayen negn direshlgn biyesh neber bech’nqete
Altewshgnm fet’nesh dersesh awet’ashgn Emebete

CHORUS
Yasalefkut bizu neger bene hiywet yeserashw
Mech tenegro mech tegelt’o ledekama yaderegshw
Letwldu egelt’alehu enate hoy wiletashn
Maryam (2) elshalehu enegralehu tamrshn

VERSE 4
Nigstitu yewerq libs tegonats’fa teshelma
Bengusu beljwa qegn yeamlak enat bekbrqoma
Qalkidwanwan asasbalech het’ann litasmr
Bets’nats’l bekebero enamesgn enzemr.

CHORUS
Yasalefkut bizu neger bene hiywet yeserashw
Mech tenegro mech tegelt’o ledekama yaderegshw
Letwldu egelt’alehu enate hoy wiletashn
Maryam (2) elshalehu enegralehu tamrshn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን

VERSE 1
አንደበቴም በል ተፈታ ስለ ጽዮን ለመመስከር
ዘምርላት አመስግናት አውጅ ለዓለም ግለጥ ንገር
ትውልድ ይስማ ስለክብሯ ለምስጋና ይታደም
ማርያም(፪)የሚላትም ድንግል ፍጹም አትረሳም

CHORUS
ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን

VERSE 2
መልካሞችም ተሰብሰቡ ጽድቅን ማፍራት ያቃታችሁ
ማሰሮዋ ጨው ይዛለች ሊወገድ ነው መርገማችሁ
መረጋጋት ያቃታችሁ የዳዊት ልጅ ታጽናናችሁ
መሰንቆ ናት ድንግል ማርያም ድምጿ ፈውስን ያድላችሁ

CHORUS
ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን

VERSE 3
የሞትን ድምጽ ውስጤ ሰምቶ ተጨንቄ ግራ ገብቶኝ
ማምለጫውን መሸሸጊያ እንዴት እንደሆን እንኳጠፍቶኝ
ብቻየን ነኝ ድረሽልኝ ብየሽ ነበር በጭንቀቴ
አልተውሽኝም ፈጥነሽ ደርሰሽ አወጣሽኝ እመቤቴ

CHORUS
ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን

VERSE 4
ንግስቲቱ የወርቅ ልብስ ተጎናጽፋ ተሸልማ
በንጉሱ በልጇ ቀኝ የአምላክ እናት በክብርቆማ
ቃልኪዷኗን አሳስባለች ሀጥአንን ልታስምር
በጽናጽል በከበሮ እናመስግን እንዘምር።

CHORUS
ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን',
        lyrics_transliteration = 'CHORUS
Yasalefkut bizu neger bene hiywet yeserashw
Mech tenegro mech tegelt’o ledekama yaderegshw
Letwldu egelt’alehu enate hoy wiletashn
Maryam (2) elshalehu enegralehu tamrshn

VERSE 1
Andebetem bel tefeta sile ts’yon lememesker
Zemrlat amesgnat awj lealem gilet’ niger
Tiwld yisma silekbrwa lemsgana yitadem
Maryam (2)yemilatm Dingil fits’um atresam

CHORUS
Yasalefkut bizu neger bene hiywet yeserashw
Mech tenegro mech tegelt’o ledekama yaderegshw
Letwldu egelt’alehu enate hoy wiletashn
Maryam (2) elshalehu enegralehu tamrshn

VERSE 2
Melkamochm tesebsebu ts’dqn mafrat yaqatachhu
Maserowa ch’ew yizalech liweged new mergemachhu
Meregagat yaqatachhu yedawit lij tats’nanachhu
Mesenqo nat Dingil Maryam dimts’wa fewsn yadlachhu

CHORUS
Yasalefkut bizu neger bene hiywet yeserashw
Mech tenegro mech tegelt’o ledekama yaderegshw
Letwldu egelt’alehu enate hoy wiletashn
Maryam (2) elshalehu enegralehu tamrshn

VERSE 3
Yemotn dimts’ wist’e semto tech’enqe gira gebtogn
Mamlech’awn mesheshegiya endet endehon enkwat’eftogn
Bichayen negn direshlgn biyesh neber bech’nqete
Altewshgnm fet’nesh dersesh awet’ashgn Emebete

CHORUS
Yasalefkut bizu neger bene hiywet yeserashw
Mech tenegro mech tegelt’o ledekama yaderegshw
Letwldu egelt’alehu enate hoy wiletashn
Maryam (2) elshalehu enegralehu tamrshn

VERSE 4
Nigstitu yewerq libs tegonats’fa teshelma
Bengusu beljwa qegn yeamlak enat bekbrqoma
Qalkidwanwan asasbalech het’ann litasmr
Bets’nats’l bekebero enamesgn enzemr.

CHORUS
Yasalefkut bizu neger bene hiywet yeserashw
Mech tenegro mech tegelt’o ledekama yaderegshw
Letwldu egelt’alehu enate hoy wiletashn
Maryam (2) elshalehu enegralehu tamrshn',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8e3faecf-2e40-4066-8748-8abdb5902be4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን

VERSE 1
አንደበቴም በል ተፈታ ስለ ጽዮን ለመመስከር
ዘምርላት አመስግናት አውጅ ለዓለም ግለጥ ንገር
ትውልድ ይስማ ስለክብሯ ለምስጋና ይታደም
ማርያም(፪)የሚላትም ድንግል ፍጹም አትረሳም

CHORUS
ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን

VERSE 2
መልካሞችም ተሰብሰቡ ጽድቅን ማፍራት ያቃታችሁ
ማሰሮዋ ጨው ይዛለች ሊወገድ ነው መርገማችሁ
መረጋጋት ያቃታችሁ የዳዊት ልጅ ታጽናናችሁ
መሰንቆ ናት ድንግል ማርያም ድምጿ ፈውስን ያድላችሁ

CHORUS
ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን

VERSE 3
የሞትን ድምጽ ውስጤ ሰምቶ ተጨንቄ ግራ ገብቶኝ
ማምለጫውን መሸሸጊያ እንዴት እንደሆን እንኳጠፍቶኝ
ብቻየን ነኝ ድረሽልኝ ብየሽ ነበር በጭንቀቴ
አልተውሽኝም ፈጥነሽ ደርሰሽ አወጣሽኝ እመቤቴ

CHORUS
ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን

VERSE 4
ንግስቲቱ የወርቅ ልብስ ተጎናጽፋ ተሸልማ
በንጉሱ በልጇ ቀኝ የአምላክ እናት በክብርቆማ
ቃልኪዷኗን አሳስባለች ሀጥአንን ልታስምር
በጽናጽል በከበሮ እናመስግን እንዘምር።

CHORUS
ያሳለፍኩት ብዙ ነገር በኔ ህይወት የሰራሽው
መች ተነግሮ መች ተገልጦ ለደካማ ያደረግሽው
ለትውልዱ እገልጣለሁ እናቴ ሆይ ውለታሽን
ማርያም(፪) እልሻለሁ እነግራለሁ ታምርሽን'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8e3faecf-2e40-4066-8748-8abdb5902be4'::uuid, 'yasalefikut', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- o-the-archangel ("O the Archangel")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '8f94c50a-2f05-4ccb-8982-5535ca8edc71'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM 'O Michael liqe melaikt
Behatiyat endanwedk endanimot
Fetneh teradan atsnan bemnet'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_english = 'CHORUS
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
Deliver us all with faith you strengthen',
        lyrics_transliteration = 'O Michael liqe melaikt
Behatiyat endanwedk endanimot
Fetneh teradan atsnan bemnet',
        updated_at = clock_timestamp()::text
    WHERE import_id = '8f94c50a-2f05-4ccb-8982-5535ca8edc71'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM 'O Michael liqe melaikt
Behatiyat endanwedk endanimot
Fetneh teradan atsnan bemnet';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '8f94c50a-2f05-4ccb-8982-5535ca8edc71'::uuid, 'o-the-archangel', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- hosanna-in-ariyam ("Hosanna in Ariyam")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9b0ae893-996e-4c68-8ed3-cbabbe7a7a1e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሆሳዕና በአርያም / Hosanna be ariyam
እያሉ ዘመሩ / Eyalu zemeru
ሕጻናት በኢየሩሣሌም / Hitsanat be Eyerusalem

VERSE 1
ሆሳዕና በአርያም / Hosanna be ariyam
እያሉ ዘመሩ / Eyalu zemeru
ሕጻናት በኢየሩሣሌም / Hitsanat be Eyerusalem

CHORUS
ሆሳዕና በአርያም / Hosanna be ariyam
እያሉ ዘመሩ / Eyalu zemeru
ሕጻናት በኢየሩሣሌም / Hitsanat be Eyerusalem'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hosanna be ariyam
Eyalu zemeru
Hitsanat be Eyerusalem

VERSE 1
Hosanna be ariyam
Eyalu zemeru
Hitsanat be Eyerusalem

CHORUS
Hosanna be ariyam
Eyalu zemeru
Hitsanat be Eyerusalem'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ሆሳዕና በአርያም / Hosanna be ariyam
እያሉ ዘመሩ / Eyalu zemeru
ሕጻናት በኢየሩሣሌም / Hitsanat be Eyerusalem

VERSE 1
ሆሳዕና በአርያም / Hosanna be ariyam
እያሉ ዘመሩ / Eyalu zemeru
ሕጻናት በኢየሩሣሌም / Hitsanat be Eyerusalem

CHORUS
ሆሳዕና በአርያም / Hosanna be ariyam
እያሉ ዘመሩ / Eyalu zemeru
ሕጻናት በኢየሩሣሌም / Hitsanat be Eyerusalem',
        lyrics_transliteration = 'CHORUS
Hosanna be ariyam
Eyalu zemeru
Hitsanat be Eyerusalem

VERSE 1
Hosanna be ariyam
Eyalu zemeru
Hitsanat be Eyerusalem

CHORUS
Hosanna be ariyam
Eyalu zemeru
Hitsanat be Eyerusalem',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9b0ae893-996e-4c68-8ed3-cbabbe7a7a1e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ሆሳዕና በአርያም / Hosanna be ariyam
እያሉ ዘመሩ / Eyalu zemeru
ሕጻናት በኢየሩሣሌም / Hitsanat be Eyerusalem

VERSE 1
ሆሳዕና በአርያም / Hosanna be ariyam
እያሉ ዘመሩ / Eyalu zemeru
ሕጻናት በኢየሩሣሌም / Hitsanat be Eyerusalem

CHORUS
ሆሳዕና በአርያም / Hosanna be ariyam
እያሉ ዘመሩ / Eyalu zemeru
ሕጻናት በኢየሩሣሌም / Hitsanat be Eyerusalem'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Hosanna be ariyam
Eyalu zemeru
Hitsanat be Eyerusalem

VERSE 1
Hosanna be ariyam
Eyalu zemeru
Hitsanat be Eyerusalem

CHORUS
Hosanna be ariyam
Eyalu zemeru
Hitsanat be Eyerusalem';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9b0ae893-996e-4c68-8ed3-cbabbe7a7a1e'::uuid, 'hosanna-in-ariyam', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- betekristianin-antewim-keto ("Betekristianin Antewim Keto")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '921cf1f1-5460-425c-9a69-836fe37094e2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 1
ሁሉንም በሁሉ በሚሞላው ጌታ
ሙሽራው የሆነ ቤቱ ተሰኝታ
በክብር በሞገስ በጸጋ ተሞልታ
ደምቃ ትኖራለች ለዓለም አብርታ /፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 2
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 3
ዲያብሎስ ቢጨርስ ቀስቶቹን በሙሉ
ወጥመድ ቢዘረጋ በጉዞአችን ሁሉ
እንሻገራለን የአምላክን ስም ጠርተን
አንዳች አይነካንም እርሱን ተጠግተን /፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 4
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 5
በስሙ መሰብሰብ በስሙ መስራት
ስለ ስሙ መኖር ለስሙ መሞት
ጠላት ዲያብሎስን ምን ባያስደስት
ይህ ነው ክርስትና ይኼ ነው ሕይወት /፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 6
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 7
ከትውልድ ለትውልድ የምናስረክበው
ለልጅ ልጅ አውርሰን ደስ የምንሰኘው
አይደል ብርና ወርቅ አይደል ሌላ ሀብት
ሃይማኖታችን ነው የእኛ ርስት ጉልት /፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 8
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 1
Hullunim behullu bemimolaw Geta
Mushiraw yehonew betu tesegnyita
Bekibir bemoges betsega temolta
Demqa tinoralich le-alem abrita (2)

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 2
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 3
Diyablos bicherris qestochun bemullu
Wetmed bizeriga beguzoachin hullu
Inishagerallen Ye-Amlakin sim terten
Andach aynekanim Ersun tetigten (2)

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 4
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 5
Besimu meseseb besimu mesrat
Sile simu menor lesimu memot
Telat diyablosin min bayas-desit
Yihe new Kristinna yihe new hiywot (2)

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 6
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 7
Ketewlid letewlid yeminas-rekibew
Lelij lij awrisen des yeminsignyew
Aydel birina werq aydel lela habt
Haymanotachin new yegna rist gult (2)

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 8
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 1
ሁሉንም በሁሉ በሚሞላው ጌታ
ሙሽራው የሆነ ቤቱ ተሰኝታ
በክብር በሞገስ በጸጋ ተሞልታ
ደምቃ ትኖራለች ለዓለም አብርታ /፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 2
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 3
ዲያብሎስ ቢጨርስ ቀስቶቹን በሙሉ
ወጥመድ ቢዘረጋ በጉዞአችን ሁሉ
እንሻገራለን የአምላክን ስም ጠርተን
አንዳች አይነካንም እርሱን ተጠግተን /፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 4
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 5
በስሙ መሰብሰብ በስሙ መስራት
ስለ ስሙ መኖር ለስሙ መሞት
ጠላት ዲያብሎስን ምን ባያስደስት
ይህ ነው ክርስትና ይኼ ነው ሕይወት /፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 6
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 7
ከትውልድ ለትውልድ የምናስረክበው
ለልጅ ልጅ አውርሰን ደስ የምንሰኘው
አይደል ብርና ወርቅ አይደል ሌላ ሀብት
ሃይማኖታችን ነው የእኛ ርስት ጉልት /፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 8
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ',
        lyrics_transliteration = 'CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 1
Hullunim behullu bemimolaw Geta
Mushiraw yehonew betu tesegnyita
Bekibir bemoges betsega temolta
Demqa tinoralich le-alem abrita (2)

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 2
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 3
Diyablos bicherris qestochun bemullu
Wetmed bizeriga beguzoachin hullu
Inishagerallen Ye-Amlakin sim terten
Andach aynekanim Ersun tetigten (2)

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 4
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 5
Besimu meseseb besimu mesrat
Sile simu menor lesimu memot
Telat diyablosin min bayas-desit
Yihe new Kristinna yihe new hiywot (2)

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 6
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 7
Ketewlid letewlid yeminas-rekibew
Lelij lij awrisen des yeminsignyew
Aydel birina werq aydel lela habt
Haymanotachin new yegna rist gult (2)

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 8
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto',
        updated_at = clock_timestamp()::text
    WHERE import_id = '921cf1f1-5460-425c-9a69-836fe37094e2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 1
ሁሉንም በሁሉ በሚሞላው ጌታ
ሙሽራው የሆነ ቤቱ ተሰኝታ
በክብር በሞገስ በጸጋ ተሞልታ
ደምቃ ትኖራለች ለዓለም አብርታ /፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 2
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 3
ዲያብሎስ ቢጨርስ ቀስቶቹን በሙሉ
ወጥመድ ቢዘረጋ በጉዞአችን ሁሉ
እንሻገራለን የአምላክን ስም ጠርተን
አንዳች አይነካንም እርሱን ተጠግተን /፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 4
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 5
በስሙ መሰብሰብ በስሙ መስራት
ስለ ስሙ መኖር ለስሙ መሞት
ጠላት ዲያብሎስን ምን ባያስደስት
ይህ ነው ክርስትና ይኼ ነው ሕይወት /፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 6
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 7
ከትውልድ ለትውልድ የምናስረክበው
ለልጅ ልጅ አውርሰን ደስ የምንሰኘው
አይደል ብርና ወርቅ አይደል ሌላ ሀብት
ሃይማኖታችን ነው የእኛ ርስት ጉልት /፪/

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 8
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 1
Hullunim behullu bemimolaw Geta
Mushiraw yehonew betu tesegnyita
Bekibir bemoges betsega temolta
Demqa tinoralich le-alem abrita (2)

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 2
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 3
Diyablos bicherris qestochun bemullu
Wetmed bizeriga beguzoachin hullu
Inishagerallen Ye-Amlakin sim terten
Andach aynekanim Ersun tetigten (2)

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 4
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 5
Besimu meseseb besimu mesrat
Sile simu menor lesimu memot
Telat diyablosin min bayas-desit
Yihe new Kristinna yihe new hiywot (2)

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 6
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 7
Ketewlid letewlid yeminas-rekibew
Lelij lij awrisen des yeminsignyew
Aydel birina werq aydel lela habt
Haymanotachin new yegna rist gult (2)

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

VERSE 8
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto

CHORUS
Betekristianin antewim keto
Yesetennin Amlak bedemu mesirto
Yesetennin Geta bemesqelu moto
Ye-Amlakachinnin bet antewim keto';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '921cf1f1-5460-425c-9a69-836fe37094e2'::uuid, 'betekristianin-antewim-keto', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tebejawyey-new-eritrean-orthodox-mezmur-tebejawiyey-zemari-bereket-tikue ("#Tebejawyey_New_eritrean_orthodox_mezmur_tebejawiyey_zemari_bereket_tikue_zemarit_Hermela_yehsho_2022")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9caf2980-f7ab-41f1-9aac-efb877d27712'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

VERSE 1
> ነተን ፈጠርቲ ኣእዳዉ ንድሕሪት ኣሲሮም
ናብቲ ብርሃን ገጹ ትፋኦም ተፊኦም
ነቲ ብዝናብ ክረምቲ ንምድሪ ዘጥለለ
ሓሞት ኣስተይዎ ጸሚአ እና በለ

CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

VERSE 2
እዚ ኹሉ ዝወረዶ
ምእንታይ''ዪ ከፊልዎ
ንናይ ጎይታይ ሞት ባርይኡ እነኹ
ናይ ዘልኣለም ሕይወት እና ኣማዕደኹ

CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

VERSE 3
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

VERSE 4
> ንሕማመይ እንተ ዘይሓሞ
ንጾረይ እንተ ዘይጸረለይ
ንበደለይ እንተ ዘይሓድጎ
እየሱስ እንተ ዘይሞተለይ

CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

VERSE 5
እንታይ ምኾነ እዚ ናተይ ሕይወት
ብዘይ ናቱ ህላውነት
ንዋዛ ኣይኮነን ተበጅዪኒ
ብዋጋ''ዪ ዓዲጉኒ

CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

VERSE 6
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|

VERSE 1
> neten fet’erti aedawu nidhrit asirom
Nabti birhan gets’u tifaom tefiom
Neti biznab kiremti nimdri zet’lele
Hamot asteywo ts’emia ena bele

CHORUS
Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|

VERSE 2
Ezi ኹlu ziweredo
Mientay''yi kefilwo
Ninay goytay mot baryu eneኹ
Nay zelalem hiywet ena amaedeኹ

CHORUS
Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|

VERSE 3
Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|

CHORUS
Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|

VERSE 4
> nihmamey ente zeyhamo
Nits’orey ente zeyts’ereley
Nibedeley ente zeyhadgo
Eyesus ente zeymoteley

CHORUS
Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|

VERSE 5
Entay miኾne ezi natey hiywet
Bizey natu hilawnet
Niwaza aykonen tebejyini
Biwaga''yi adiguni

CHORUS
Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|

VERSE 6
Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|

CHORUS
Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

VERSE 1
> ነተን ፈጠርቲ ኣእዳዉ ንድሕሪት ኣሲሮም
ናብቲ ብርሃን ገጹ ትፋኦም ተፊኦም
ነቲ ብዝናብ ክረምቲ ንምድሪ ዘጥለለ
ሓሞት ኣስተይዎ ጸሚአ እና በለ

CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

VERSE 2
እዚ ኹሉ ዝወረዶ
ምእንታይ''ዪ ከፊልዎ
ንናይ ጎይታይ ሞት ባርይኡ እነኹ
ናይ ዘልኣለም ሕይወት እና ኣማዕደኹ

CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

VERSE 3
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

VERSE 4
> ንሕማመይ እንተ ዘይሓሞ
ንጾረይ እንተ ዘይጸረለይ
ንበደለይ እንተ ዘይሓድጎ
እየሱስ እንተ ዘይሞተለይ

CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

VERSE 5
እንታይ ምኾነ እዚ ናተይ ሕይወት
ብዘይ ናቱ ህላውነት
ንዋዛ ኣይኮነን ተበጅዪኒ
ብዋጋ''ዪ ዓዲጉኒ

CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

VERSE 6
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|',
        lyrics_transliteration = 'CHORUS
Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|

VERSE 1
> neten fet’erti aedawu nidhrit asirom
Nabti birhan gets’u tifaom tefiom
Neti biznab kiremti nimdri zet’lele
Hamot asteywo ts’emia ena bele

CHORUS
Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|

VERSE 2
Ezi ኹlu ziweredo
Mientay''yi kefilwo
Ninay goytay mot baryu eneኹ
Nay zelalem hiywet ena amaedeኹ

CHORUS
Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|

VERSE 3
Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|

CHORUS
Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|

VERSE 4
> nihmamey ente zeyhamo
Nits’orey ente zeyts’ereley
Nibedeley ente zeyhadgo
Eyesus ente zeymoteley

CHORUS
Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|

VERSE 5
Entay miኾne ezi natey hiywet
Bizey natu hilawnet
Niwaza aykonen tebejyini
Biwaga''yi adiguni

CHORUS
Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|

VERSE 6
Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|

CHORUS
Entay zibele tiegsti''yi gerimuni
Entay kon rieyiley zefqereni neza riesu zewarede
Eti niay zigbae meqts’aeti hat’iatey
Kulu teqebilu eyesus moteley |2|',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9caf2980-f7ab-41f1-9aac-efb877d27712'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

VERSE 1
> ነተን ፈጠርቲ ኣእዳዉ ንድሕሪት ኣሲሮም
ናብቲ ብርሃን ገጹ ትፋኦም ተፊኦም
ነቲ ብዝናብ ክረምቲ ንምድሪ ዘጥለለ
ሓሞት ኣስተይዎ ጸሚአ እና በለ

CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

VERSE 2
እዚ ኹሉ ዝወረዶ
ምእንታይ''ዪ ከፊልዎ
ንናይ ጎይታይ ሞት ባርይኡ እነኹ
ናይ ዘልኣለም ሕይወት እና ኣማዕደኹ

CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

VERSE 3
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

VERSE 4
> ንሕማመይ እንተ ዘይሓሞ
ንጾረይ እንተ ዘይጸረለይ
ንበደለይ እንተ ዘይሓድጎ
እየሱስ እንተ ዘይሞተለይ

CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

VERSE 5
እንታይ ምኾነ እዚ ናተይ ሕይወት
ብዘይ ናቱ ህላውነት
ንዋዛ ኣይኮነን ተበጅዪኒ
ብዋጋ''ዪ ዓዲጉኒ

CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

VERSE 6
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|

CHORUS
እንታይ ዝበለ ትዕግስቲ''ዪ ገሪሙኒ
እንታይ ኮን ርእዪለይ ዘፍቀረኒ ነዛ ርእሱ ዘዋረደ
እቲ ንዓይ ዝግባእ መቅጻዕቲ ሓጢኣተይ
ኩሉ ተቀቢሉ እየሱስ ሞተለይ |2|'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9caf2980-f7ab-41f1-9aac-efb877d27712'::uuid, 'tebejawyey-new-eritrean-orthodox-mezmur-tebejawiyey-zemari-bereket-tikue', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yene-mehari-hulun-merishaye-1840 ("Yene Mehari Hulun Merishaye")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'acbe0648-f344-463a-b9c6-fe0a09c668ef'::uuid
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
    WHERE import_id = 'acbe0648-f344-463a-b9c6-fe0a09c668ef'::uuid
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
        'acbe0648-f344-463a-b9c6-fe0a09c668ef'::uuid, 'yene-mehari-hulun-merishaye-1840', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kininet ("Kininet")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '94eadb23-7aef-4789-9ea0-fca8aa78423e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች

VERSE 1
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች
አቤሚሌክ ሳራን ቢወሰድም ቀምቶ
ለኅጢአት ቢቸኩል ለዉበቷ ጓጉቶ
የልቡ ቅንነት በእግዚአብሔር ዘንድ ታይቶ ታረቋል ከአምላኩ ምህረትን አግኝቶ(2)

CHORUS
ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች

VERSE 2
ተንኮል የሌለበት ልቡ ቅን የሆነ
ዳዊት ናትናኤልን ሙሴን የመሰለ
ይጠራዋል አምላክ ያነጋግረዋል
በመንገዱ ሁሉ በፍቱ ይቀድማል(2)

CHORUS
ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች

VERSE 3
ከያሁዳ እንራቅ እንሂድ ወደ ጴጥሮስ
ከዮሴፍ ጋር እንሁን እንንሽሽ ከሄሮድስ
ከቃየንም አቤል ከሳኦልም ዳዊት
ተመርጠዋልና በልብ ቅንነት (2)

CHORUS
ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች

VERSE 4
ቅን ፍርድን ፍረዱ በመልክ አትፍረዱ
እንደለ ጌታችን ለዓለም ለትዉልዱ
በእዉነትና በፍቅር ስራችንን እንስራ
ከፍርድ እንድናመልጥ ከጭንቅ ከመከራ (2)

CHORUS
ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Qinnet yeegziabhern fitun tayewalech
Beersum sim timekalech
Qinnet yeegziabhern fitun tayewalech (2)
Hat’yategnochnm tats’edqalech

VERSE 1
Qinnet yeegziabhern fitun tayewalech
Abemilek saran biwesedm qemto
Leht’iat bichekul lewubetwa gwaguto
Yelbu qinnet beEgziabher zend tayto tareqwal keamlaku mihretn aggnto (2)

CHORUS
Qinnet yeegziabhern fitun tayewalech
Beersum sim timekalech
Qinnet yeegziabhern fitun tayewalech (2)
Hat’yategnochnm tats’edqalech

VERSE 2
Tenkol yelelebet libu qin yehone
Dawit natnaeln musen yemesele
Yit’erawal amlak yanegagrewal
Bemengedu hulu beftu yiqedmal (2)

CHORUS
Qinnet yeegziabhern fitun tayewalech
Beersum sim timekalech
Qinnet yeegziabhern fitun tayewalech (2)
Hat’yategnochnm tats’edqalech

VERSE 3
Keyahuda enraq enhid wede p’et’ros
Keyosef gar enhun ennshsh keherods
Keqayenm abel kesaolm dawit
Temert’ewalna belb qinnet (2)

CHORUS
Qinnet yeegziabhern fitun tayewalech
Beersum sim timekalech
Qinnet yeegziabhern fitun tayewalech (2)
Hat’yategnochnm tats’edqalech

VERSE 4
Qin firdn firedu bemelk atfredu
Endele Getachen lealem letwuldu
Beewunetna befqr sirachnn ensra
Kefrd endnamelt’ kech’nq kemekera (2)

CHORUS
Qinnet yeegziabhern fitun tayewalech
Beersum sim timekalech
Qinnet yeegziabhern fitun tayewalech (2)
Hat’yategnochnm tats’edqalech'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች

VERSE 1
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች
አቤሚሌክ ሳራን ቢወሰድም ቀምቶ
ለኅጢአት ቢቸኩል ለዉበቷ ጓጉቶ
የልቡ ቅንነት በእግዚአብሔር ዘንድ ታይቶ ታረቋል ከአምላኩ ምህረትን አግኝቶ(2)

CHORUS
ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች

VERSE 2
ተንኮል የሌለበት ልቡ ቅን የሆነ
ዳዊት ናትናኤልን ሙሴን የመሰለ
ይጠራዋል አምላክ ያነጋግረዋል
በመንገዱ ሁሉ በፍቱ ይቀድማል(2)

CHORUS
ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች

VERSE 3
ከያሁዳ እንራቅ እንሂድ ወደ ጴጥሮስ
ከዮሴፍ ጋር እንሁን እንንሽሽ ከሄሮድስ
ከቃየንም አቤል ከሳኦልም ዳዊት
ተመርጠዋልና በልብ ቅንነት (2)

CHORUS
ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች

VERSE 4
ቅን ፍርድን ፍረዱ በመልክ አትፍረዱ
እንደለ ጌታችን ለዓለም ለትዉልዱ
በእዉነትና በፍቅር ስራችንን እንስራ
ከፍርድ እንድናመልጥ ከጭንቅ ከመከራ (2)

CHORUS
ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች',
        lyrics_transliteration = 'CHORUS
Qinnet yeegziabhern fitun tayewalech
Beersum sim timekalech
Qinnet yeegziabhern fitun tayewalech (2)
Hat’yategnochnm tats’edqalech

VERSE 1
Qinnet yeegziabhern fitun tayewalech
Abemilek saran biwesedm qemto
Leht’iat bichekul lewubetwa gwaguto
Yelbu qinnet beEgziabher zend tayto tareqwal keamlaku mihretn aggnto (2)

CHORUS
Qinnet yeegziabhern fitun tayewalech
Beersum sim timekalech
Qinnet yeegziabhern fitun tayewalech (2)
Hat’yategnochnm tats’edqalech

VERSE 2
Tenkol yelelebet libu qin yehone
Dawit natnaeln musen yemesele
Yit’erawal amlak yanegagrewal
Bemengedu hulu beftu yiqedmal (2)

CHORUS
Qinnet yeegziabhern fitun tayewalech
Beersum sim timekalech
Qinnet yeegziabhern fitun tayewalech (2)
Hat’yategnochnm tats’edqalech

VERSE 3
Keyahuda enraq enhid wede p’et’ros
Keyosef gar enhun ennshsh keherods
Keqayenm abel kesaolm dawit
Temert’ewalna belb qinnet (2)

CHORUS
Qinnet yeegziabhern fitun tayewalech
Beersum sim timekalech
Qinnet yeegziabhern fitun tayewalech (2)
Hat’yategnochnm tats’edqalech

VERSE 4
Qin firdn firedu bemelk atfredu
Endele Getachen lealem letwuldu
Beewunetna befqr sirachnn ensra
Kefrd endnamelt’ kech’nq kemekera (2)

CHORUS
Qinnet yeegziabhern fitun tayewalech
Beersum sim timekalech
Qinnet yeegziabhern fitun tayewalech (2)
Hat’yategnochnm tats’edqalech',
        updated_at = clock_timestamp()::text
    WHERE import_id = '94eadb23-7aef-4789-9ea0-fca8aa78423e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች

VERSE 1
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች
አቤሚሌክ ሳራን ቢወሰድም ቀምቶ
ለኅጢአት ቢቸኩል ለዉበቷ ጓጉቶ
የልቡ ቅንነት በእግዚአብሔር ዘንድ ታይቶ ታረቋል ከአምላኩ ምህረትን አግኝቶ(2)

CHORUS
ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች

VERSE 2
ተንኮል የሌለበት ልቡ ቅን የሆነ
ዳዊት ናትናኤልን ሙሴን የመሰለ
ይጠራዋል አምላክ ያነጋግረዋል
በመንገዱ ሁሉ በፍቱ ይቀድማል(2)

CHORUS
ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች

VERSE 3
ከያሁዳ እንራቅ እንሂድ ወደ ጴጥሮስ
ከዮሴፍ ጋር እንሁን እንንሽሽ ከሄሮድስ
ከቃየንም አቤል ከሳኦልም ዳዊት
ተመርጠዋልና በልብ ቅንነት (2)

CHORUS
ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች

VERSE 4
ቅን ፍርድን ፍረዱ በመልክ አትፍረዱ
እንደለ ጌታችን ለዓለም ለትዉልዱ
በእዉነትና በፍቅር ስራችንን እንስራ
ከፍርድ እንድናመልጥ ከጭንቅ ከመከራ (2)

CHORUS
ቅንነት የእግዚአብሔርን ፍቱን ታየዋለች
በእርሱም ስም ትመካለች
ቅንነት የእግዚአብሔርን ፊቱን ታየዋለች(2)
ኃጥያተኞችንም ታጸድቃለች'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '94eadb23-7aef-4789-9ea0-fca8aa78423e'::uuid, 'kininet', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-mezmur-1972 ("ERITREAN ORTHODOX MEZMUR")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9c5b5c2a-1a18-4b89-b039-2b7b384d3389'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የብለይን ካልእ ፈታውየይ ዝብሎ
ንጾረይ ዝጸውር አርዑተይ ዘቕልሎ
ሰኸመይ ዘራግፍ ውዒሉ አብ ቀራንዮ
ብዘይ ምእዛዘይ ምስ መረጽኩ ንሞት

VERSE 1
ንልቡ ኣሕዚነ ምስ ወጻኹ ካብ ቤት
መዓስ ገዲፉኒ አብ ጸልማት ክነብር
ንስጋይ ለበሰ ህይወት ክህበኒ ቃል
ስሙ ኢየሱስ’ዩ ናይ ቁስለይ መድሓኒት

CHORUS
የብለይን ካልእ ፈታውየይ ዝብሎ
ንጾረይ ዝጸውር አርዑተይ ዘቕልሎ
ሰኸመይ ዘራግፍ ውዒሉ አብ ቀራንዮ
ብዘይ ምእዛዘይ ምስ መረጽኩ ንሞት

VERSE 2
ብነጠብጣብ ደሙ ሓጥያተይ ዝሓጽብ (2)
ኣብ ክንዲ ይስሓቅ ዝተሓርደ ገንሸል
ክርስቶስ ጎይታ’ዩ እቲ ጽኑዕ ቃል
መስዋቲ ዘቅርብ መሊሱ ዝቅበል

CHORUS
የብለይን ካልእ ፈታውየይ ዝብሎ
ንጾረይ ዝጸውር አርዑተይ ዘቕልሎ
ሰኸመይ ዘራግፍ ውዒሉ አብ ቀራንዮ
ብዘይ ምእዛዘይ ምስ መረጽኩ ንሞት

VERSE 3
ፈታዉየይ ንሱ ናይዘልኣለም ካህን
ከም ናይ መልኬጸዴቅ ክህነቱ ዘልኣለም
ንሞት ዝሰዓረ ናይዛ ዓለም መድሕን(2)

CHORUS
የብለይን ካልእ ፈታውየይ ዝብሎ
ንጾረይ ዝጸውር አርዑተይ ዘቕልሎ
ሰኸመይ ዘራግፍ ውዒሉ አብ ቀራንዮ
ብዘይ ምእዛዘይ ምስ መረጽኩ ንሞት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yebleyn kale fetawyey ziblo
Nits’orey zits’ewr arutey zeቕllo
Seኸmey zeragf wiilu Ab qeranyo
Bizey miezazey mis merets’ku nimot

VERSE 1
Nilbu ahzine mis wets’aኹ kab bet
Meas gedifuni Ab ts’elmat kinebr
Nisgay lebese hiywet kihbeni qal
Simu Iyesus’yu nay qusley medhanit

CHORUS
Yebleyn kale fetawyey ziblo
Nits’orey zits’ewr arutey zeቕllo
Seኸmey zeragf wiilu Ab qeranyo
Bizey miezazey mis merets’ku nimot

VERSE 2
Binet’ebt’ab demu hat’yatey zihats’b (2)
Ab kindi yishaq ziteharde genshel
Kristos goyta’yu eti ts’nue qal
Meswati zeqrb melisu ziqbel

CHORUS
Yebleyn kale fetawyey ziblo
Nits’orey zits’ewr arutey zeቕllo
Seኸmey zeragf wiilu Ab qeranyo
Bizey miezazey mis merets’ku nimot

VERSE 3
Fetawuyey nisu nayzelalem kahn
Kem nay melkets’edeq kihnetu zelalem
Nimot ziseare nayza alem medhn (2)

CHORUS
Yebleyn kale fetawyey ziblo
Nits’orey zits’ewr arutey zeቕllo
Seኸmey zeragf wiilu Ab qeranyo
Bizey miezazey mis merets’ku nimot'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የብለይን ካልእ ፈታውየይ ዝብሎ
ንጾረይ ዝጸውር አርዑተይ ዘቕልሎ
ሰኸመይ ዘራግፍ ውዒሉ አብ ቀራንዮ
ብዘይ ምእዛዘይ ምስ መረጽኩ ንሞት

VERSE 1
ንልቡ ኣሕዚነ ምስ ወጻኹ ካብ ቤት
መዓስ ገዲፉኒ አብ ጸልማት ክነብር
ንስጋይ ለበሰ ህይወት ክህበኒ ቃል
ስሙ ኢየሱስ’ዩ ናይ ቁስለይ መድሓኒት

CHORUS
የብለይን ካልእ ፈታውየይ ዝብሎ
ንጾረይ ዝጸውር አርዑተይ ዘቕልሎ
ሰኸመይ ዘራግፍ ውዒሉ አብ ቀራንዮ
ብዘይ ምእዛዘይ ምስ መረጽኩ ንሞት

VERSE 2
ብነጠብጣብ ደሙ ሓጥያተይ ዝሓጽብ (2)
ኣብ ክንዲ ይስሓቅ ዝተሓርደ ገንሸል
ክርስቶስ ጎይታ’ዩ እቲ ጽኑዕ ቃል
መስዋቲ ዘቅርብ መሊሱ ዝቅበል

CHORUS
የብለይን ካልእ ፈታውየይ ዝብሎ
ንጾረይ ዝጸውር አርዑተይ ዘቕልሎ
ሰኸመይ ዘራግፍ ውዒሉ አብ ቀራንዮ
ብዘይ ምእዛዘይ ምስ መረጽኩ ንሞት

VERSE 3
ፈታዉየይ ንሱ ናይዘልኣለም ካህን
ከም ናይ መልኬጸዴቅ ክህነቱ ዘልኣለም
ንሞት ዝሰዓረ ናይዛ ዓለም መድሕን(2)

CHORUS
የብለይን ካልእ ፈታውየይ ዝብሎ
ንጾረይ ዝጸውር አርዑተይ ዘቕልሎ
ሰኸመይ ዘራግፍ ውዒሉ አብ ቀራንዮ
ብዘይ ምእዛዘይ ምስ መረጽኩ ንሞት',
        lyrics_transliteration = 'CHORUS
Yebleyn kale fetawyey ziblo
Nits’orey zits’ewr arutey zeቕllo
Seኸmey zeragf wiilu Ab qeranyo
Bizey miezazey mis merets’ku nimot

VERSE 1
Nilbu ahzine mis wets’aኹ kab bet
Meas gedifuni Ab ts’elmat kinebr
Nisgay lebese hiywet kihbeni qal
Simu Iyesus’yu nay qusley medhanit

CHORUS
Yebleyn kale fetawyey ziblo
Nits’orey zits’ewr arutey zeቕllo
Seኸmey zeragf wiilu Ab qeranyo
Bizey miezazey mis merets’ku nimot

VERSE 2
Binet’ebt’ab demu hat’yatey zihats’b (2)
Ab kindi yishaq ziteharde genshel
Kristos goyta’yu eti ts’nue qal
Meswati zeqrb melisu ziqbel

CHORUS
Yebleyn kale fetawyey ziblo
Nits’orey zits’ewr arutey zeቕllo
Seኸmey zeragf wiilu Ab qeranyo
Bizey miezazey mis merets’ku nimot

VERSE 3
Fetawuyey nisu nayzelalem kahn
Kem nay melkets’edeq kihnetu zelalem
Nimot ziseare nayza alem medhn (2)

CHORUS
Yebleyn kale fetawyey ziblo
Nits’orey zits’ewr arutey zeቕllo
Seኸmey zeragf wiilu Ab qeranyo
Bizey miezazey mis merets’ku nimot',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9c5b5c2a-1a18-4b89-b039-2b7b384d3389'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የብለይን ካልእ ፈታውየይ ዝብሎ
ንጾረይ ዝጸውር አርዑተይ ዘቕልሎ
ሰኸመይ ዘራግፍ ውዒሉ አብ ቀራንዮ
ብዘይ ምእዛዘይ ምስ መረጽኩ ንሞት

VERSE 1
ንልቡ ኣሕዚነ ምስ ወጻኹ ካብ ቤት
መዓስ ገዲፉኒ አብ ጸልማት ክነብር
ንስጋይ ለበሰ ህይወት ክህበኒ ቃል
ስሙ ኢየሱስ’ዩ ናይ ቁስለይ መድሓኒት

CHORUS
የብለይን ካልእ ፈታውየይ ዝብሎ
ንጾረይ ዝጸውር አርዑተይ ዘቕልሎ
ሰኸመይ ዘራግፍ ውዒሉ አብ ቀራንዮ
ብዘይ ምእዛዘይ ምስ መረጽኩ ንሞት

VERSE 2
ብነጠብጣብ ደሙ ሓጥያተይ ዝሓጽብ (2)
ኣብ ክንዲ ይስሓቅ ዝተሓርደ ገንሸል
ክርስቶስ ጎይታ’ዩ እቲ ጽኑዕ ቃል
መስዋቲ ዘቅርብ መሊሱ ዝቅበል

CHORUS
የብለይን ካልእ ፈታውየይ ዝብሎ
ንጾረይ ዝጸውር አርዑተይ ዘቕልሎ
ሰኸመይ ዘራግፍ ውዒሉ አብ ቀራንዮ
ብዘይ ምእዛዘይ ምስ መረጽኩ ንሞት

VERSE 3
ፈታዉየይ ንሱ ናይዘልኣለም ካህን
ከም ናይ መልኬጸዴቅ ክህነቱ ዘልኣለም
ንሞት ዝሰዓረ ናይዛ ዓለም መድሕን(2)

CHORUS
የብለይን ካልእ ፈታውየይ ዝብሎ
ንጾረይ ዝጸውር አርዑተይ ዘቕልሎ
ሰኸመይ ዘራግፍ ውዒሉ አብ ቀራንዮ
ብዘይ ምእዛዘይ ምስ መረጽኩ ንሞት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9c5b5c2a-1a18-4b89-b039-2b7b384d3389'::uuid, 'eritrean-orthodox-mezmur-1972', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- abetu-ebakih-ahun-adin ("Abetu Ebakih Ahun Adin")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a6a0a595-ace6-4e64-873c-edefe05cb320'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 1
የተሰበርው እንዲጠገን
ደዌው እንዲርቅ ተፈውሶ
አንተን እንዲያመልክ በህይወቱ
ከኃጥያት ከበደል ተመልሶ

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 2
የባዘነውን ሰበሰብከው
የጠፍውንስ መቼ ተውከው
በቀል የማታቅ ቅዱስ ጌታ
አንተ ብቻ ነው ያከበርከው

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 3
በጎች ቢምሉም በበርት ውስጥ
ዘጠነ ዘጠኝ ቢኖሩህም
አንዱ እንደውጣ ይቅር ብለህ
እኔን መፈለግ ችላ አላልክም

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 4
ለጆቼ አምባር ለእግሮቼ ጫማ
ለአካሌ አዲስ ልብስ አለበስከኝ
እድፌን አፅተ አድተህኝ
እንዳመሰግን አደርከኝ

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 5
ህፃን አዋቂው ያመልክሀል
ከቤቱ ነቅሎ ደጂ መቶ
ቅኔ መውድስ ተቀኘልህ
ይህው ለስምህ ክብርን ሰቶ

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 6
መሻቱን ብቻ ተመልክተህ
ልቡን አንቅተህ ብትፈውሰው
ጂማሬው ቢሆን ፍፃሜውም
ሁሉን አንተ ነህ ያደርከው

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana

VERSE 1
Yeteseberw endit’egen
Dewew endirq tefewso
Anten endiyamelk behywetu
Kehat’yat kebedel temelso

CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana

VERSE 2
Yebazenewn sebesebkew
Yet’efwns meche tewkew
Beqel yemataq Kidus Geta
Ante bicha new yakeberkew

CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana

VERSE 3
Begoch bimlum bebert wist’
Zet’ene zet’egn binoruhm
Andu endewt’a yiqr bileh
Enen mefeleg chla alalkm

CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana

VERSE 4
Lejoche ambar leegroche ch’ama
Leakale adis libs alebeskegn
Edfen ats’te adtehgn
Endamesegn aderkegn

CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana

VERSE 5
Hits’an awaqiw yamelkhel
Kebetu neqlo deji meto
Qine mewds teqegnelh
Yihw lesmh kibrn seto

CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana

VERSE 6
Meshatun bicha temelkteh
Libun anqteh bitfewsew
Jimarew bihon fits’amewm
Hulun ante neh yaderkew

CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 1
የተሰበርው እንዲጠገን
ደዌው እንዲርቅ ተፈውሶ
አንተን እንዲያመልክ በህይወቱ
ከኃጥያት ከበደል ተመልሶ

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 2
የባዘነውን ሰበሰብከው
የጠፍውንስ መቼ ተውከው
በቀል የማታቅ ቅዱስ ጌታ
አንተ ብቻ ነው ያከበርከው

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 3
በጎች ቢምሉም በበርት ውስጥ
ዘጠነ ዘጠኝ ቢኖሩህም
አንዱ እንደውጣ ይቅር ብለህ
እኔን መፈለግ ችላ አላልክም

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 4
ለጆቼ አምባር ለእግሮቼ ጫማ
ለአካሌ አዲስ ልብስ አለበስከኝ
እድፌን አፅተ አድተህኝ
እንዳመሰግን አደርከኝ

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 5
ህፃን አዋቂው ያመልክሀል
ከቤቱ ነቅሎ ደጂ መቶ
ቅኔ መውድስ ተቀኘልህ
ይህው ለስምህ ክብርን ሰቶ

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 6
መሻቱን ብቻ ተመልክተህ
ልቡን አንቅተህ ብትፈውሰው
ጂማሬው ቢሆን ፍፃሜውም
ሁሉን አንተ ነህ ያደርከው

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና',
        lyrics_transliteration = 'CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana

VERSE 1
Yeteseberw endit’egen
Dewew endirq tefewso
Anten endiyamelk behywetu
Kehat’yat kebedel temelso

CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana

VERSE 2
Yebazenewn sebesebkew
Yet’efwns meche tewkew
Beqel yemataq Kidus Geta
Ante bicha new yakeberkew

CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana

VERSE 3
Begoch bimlum bebert wist’
Zet’ene zet’egn binoruhm
Andu endewt’a yiqr bileh
Enen mefeleg chla alalkm

CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana

VERSE 4
Lejoche ambar leegroche ch’ama
Leakale adis libs alebeskegn
Edfen ats’te adtehgn
Endamesegn aderkegn

CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana

VERSE 5
Hits’an awaqiw yamelkhel
Kebetu neqlo deji meto
Qine mewds teqegnelh
Yihw lesmh kibrn seto

CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana

VERSE 6
Meshatun bicha temelkteh
Libun anqteh bitfewsew
Jimarew bihon fits’amewm
Hulun ante neh yaderkew

CHORUS
Abetu bakh ahun adn
Abetu bakh ahun aqna
Kets’ehey mewch’a eske megbiyaw dirs
Midr tikeden bemsgana',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a6a0a595-ace6-4e64-873c-edefe05cb320'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 1
የተሰበርው እንዲጠገን
ደዌው እንዲርቅ ተፈውሶ
አንተን እንዲያመልክ በህይወቱ
ከኃጥያት ከበደል ተመልሶ

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 2
የባዘነውን ሰበሰብከው
የጠፍውንስ መቼ ተውከው
በቀል የማታቅ ቅዱስ ጌታ
አንተ ብቻ ነው ያከበርከው

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 3
በጎች ቢምሉም በበርት ውስጥ
ዘጠነ ዘጠኝ ቢኖሩህም
አንዱ እንደውጣ ይቅር ብለህ
እኔን መፈለግ ችላ አላልክም

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 4
ለጆቼ አምባር ለእግሮቼ ጫማ
ለአካሌ አዲስ ልብስ አለበስከኝ
እድፌን አፅተ አድተህኝ
እንዳመሰግን አደርከኝ

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 5
ህፃን አዋቂው ያመልክሀል
ከቤቱ ነቅሎ ደጂ መቶ
ቅኔ መውድስ ተቀኘልህ
ይህው ለስምህ ክብርን ሰቶ

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና

VERSE 6
መሻቱን ብቻ ተመልክተህ
ልቡን አንቅተህ ብትፈውሰው
ጂማሬው ቢሆን ፍፃሜውም
ሁሉን አንተ ነህ ያደርከው

CHORUS
አቤቱ ባክህ አሁን አድን
አቤቱ ባክህ አሁን አቅና
ከፀሐይ መውጫ እስከ መግቢያው ድርስ
ምድር ትከደን በምስጋና'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a6a0a595-ace6-4e64-873c-edefe05cb320'::uuid, 'abetu-ebakih-ahun-adin', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- erdagn-zim-atbel ("Erdagn Zim Atbel")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '950c7f84-3563-4105-a66e-138a7505ba5e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 1
አንተን ለማመስገን የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 2
ጨንቆኝ እጣራለሁ ጸጋ አጣ ህይወቴ
እባክህ አርመኝ እርዳኝ መድሃኒቴ

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 3
ልቤ ድንጋይ ሆኖ ቃልህ አልሰበረው
የእጅህን ስራ ጌታዬ አስተካክለው

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 4
የክርስትና ኑሮ ስርዓቱን አፍርሼ
አለቅሳለሁ ጌታ በሃጢያት ተከስሼ

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 5
ሰላምና ፍቅር ነበር ክርስትና
እኔ ግን ተናወጽኩ አልጸናሁም ገና

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 6
ስራዬና ቃልህ አልገናኝ አሉኝ
በጠማማው ልቤ አንተን አሳዘንኩኝ

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 7
ጽኑ መሰረት ነው የህይወት አለት
እየተናወጽኩኝ አቃተኝ መጽናት

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 8
በእረፍት ውሃ ዘንድ በለመለመው ሳር
በጎችህን ሁሉ በፍቅር የምታኖር

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 9
በህይወቴ እንዲታይ የቸርነትህ ክብር
ከደጅህ ተጥዬ ለስምህ ልዘምር

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 1
Antén lemamesgen yeneberegn birtat
Zares tesonognal aqtoñal met’gat

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 2
Chenqoñ et’aralew tsegga ata hiywete
Ebakih armeny erdagn medhanite

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 3
Libe dingay hono qalih alseberew
Ye’ijjih sira getayé astekakilew

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 4
YeKristena nuro sir’atun afirshé
Alek’salew geta behatiyat tekes’shé

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 5
Selamna fiqir neber Kristena
Ené gin tenawets’ku alts’enahum gena

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 6
Sirayena qalih algenagn alugn
Bet’amamaw libe antén asazenkuñ

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 7
Ts’inu meseret new yehiywet alet
Eyetenawets’kuñ aqateñ mets’nat

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 8
Berefit wuha zend belemelemew sar
Begochihn hulu befiqir yemit’anor

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 9
Behiywete endet’ay yetchernetih kibir
Kedejih tet’eyé lesimih lizemir

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 1
አንተን ለማመስገን የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 2
ጨንቆኝ እጣራለሁ ጸጋ አጣ ህይወቴ
እባክህ አርመኝ እርዳኝ መድሃኒቴ

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 3
ልቤ ድንጋይ ሆኖ ቃልህ አልሰበረው
የእጅህን ስራ ጌታዬ አስተካክለው

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 4
የክርስትና ኑሮ ስርዓቱን አፍርሼ
አለቅሳለሁ ጌታ በሃጢያት ተከስሼ

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 5
ሰላምና ፍቅር ነበር ክርስትና
እኔ ግን ተናወጽኩ አልጸናሁም ገና

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 6
ስራዬና ቃልህ አልገናኝ አሉኝ
በጠማማው ልቤ አንተን አሳዘንኩኝ

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 7
ጽኑ መሰረት ነው የህይወት አለት
እየተናወጽኩኝ አቃተኝ መጽናት

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 8
በእረፍት ውሃ ዘንድ በለመለመው ሳር
በጎችህን ሁሉ በፍቅር የምታኖር

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 9
በህይወቴ እንዲታይ የቸርነትህ ክብር
ከደጅህ ተጥዬ ለስምህ ልዘምር

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ',
        lyrics_transliteration = 'CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 1
Antén lemamesgen yeneberegn birtat
Zares tesonognal aqtoñal met’gat

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 2
Chenqoñ et’aralew tsegga ata hiywete
Ebakih armeny erdagn medhanite

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 3
Libe dingay hono qalih alseberew
Ye’ijjih sira getayé astekakilew

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 4
YeKristena nuro sir’atun afirshé
Alek’salew geta behatiyat tekes’shé

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 5
Selamna fiqir neber Kristena
Ené gin tenawets’ku alts’enahum gena

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 6
Sirayena qalih algenagn alugn
Bet’amamaw libe antén asazenkuñ

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 7
Ts’inu meseret new yehiywet alet
Eyetenawets’kuñ aqateñ mets’nat

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 8
Berefit wuha zend belemelemew sar
Begochihn hulu befiqir yemit’anor

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 9
Behiywete endet’ay yetchernetih kibir
Kedejih tet’eyé lesimih lizemir

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta',
        updated_at = clock_timestamp()::text
    WHERE import_id = '950c7f84-3563-4105-a66e-138a7505ba5e'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 1
አንተን ለማመስገን የነበረኝ ብርታት
ዛሬስ ተስኖኛል አቅቶኛል መትጋት

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 2
ጨንቆኝ እጣራለሁ ጸጋ አጣ ህይወቴ
እባክህ አርመኝ እርዳኝ መድሃኒቴ

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 3
ልቤ ድንጋይ ሆኖ ቃልህ አልሰበረው
የእጅህን ስራ ጌታዬ አስተካክለው

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 4
የክርስትና ኑሮ ስርዓቱን አፍርሼ
አለቅሳለሁ ጌታ በሃጢያት ተከስሼ

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 5
ሰላምና ፍቅር ነበር ክርስትና
እኔ ግን ተናወጽኩ አልጸናሁም ገና

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 6
ስራዬና ቃልህ አልገናኝ አሉኝ
በጠማማው ልቤ አንተን አሳዘንኩኝ

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 7
ጽኑ መሰረት ነው የህይወት አለት
እየተናወጽኩኝ አቃተኝ መጽናት

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 8
በእረፍት ውሃ ዘንድ በለመለመው ሳር
በጎችህን ሁሉ በፍቅር የምታኖር

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ

VERSE 9
በህይወቴ እንዲታይ የቸርነትህ ክብር
ከደጅህ ተጥዬ ለስምህ ልዘምር

CHORUS
እርዳኝ ዝም አትበል የሰራዊት ጌታ
ተስፋ እንደሌለው ሰው ልቤ አያመንታ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 1
Antén lemamesgen yeneberegn birtat
Zares tesonognal aqtoñal met’gat

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 2
Chenqoñ et’aralew tsegga ata hiywete
Ebakih armeny erdagn medhanite

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 3
Libe dingay hono qalih alseberew
Ye’ijjih sira getayé astekakilew

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 4
YeKristena nuro sir’atun afirshé
Alek’salew geta behatiyat tekes’shé

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 5
Selamna fiqir neber Kristena
Ené gin tenawets’ku alts’enahum gena

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 6
Sirayena qalih algenagn alugn
Bet’amamaw libe antén asazenkuñ

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 7
Ts’inu meseret new yehiywet alet
Eyetenawets’kuñ aqateñ mets’nat

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 8
Berefit wuha zend belemelemew sar
Begochihn hulu befiqir yemit’anor

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta

VERSE 9
Behiywete endet’ay yetchernetih kibir
Kedejih tet’eyé lesimih lizemir

CHORUS
Erdagn zim atbel yeserawit geta
Tesfa endelelew sew libe ayamenta';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '950c7f84-3563-4105-a66e-138a7505ba5e'::uuid, 'erdagn-zim-atbel', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yesilasen-meniber-kidusan-kebewit ("Yesilasen Meniber Kidusan Kebewit")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '93bfa843-583c-4bb1-8367-86104dc3de5a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 1
እዩት ተመልከቱት የሰማዩን ድምቀት
እዩት ተመልከቱት የሰማዩን አባት
አዝ ።።።።።።። ።።።።።። ።።።።።።
የሥላሴን መንበር ቅዱሳን ከበውት

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 2
እያሸበሸቡ የሰማይ መላእክት
ካህናተ ሰመ ቅዱስ ቅዱስ ሲሉ
ይህን ልዩ ታምር ሊያዩ የታደሉ
በጽድቅ ስራቸው ደምቀው ይታያሉ

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 3
በጽድቅ ስራቸው ደምቀው ይታያሉ
አዝ ።።።።።።። ።።።።።። ።።።።።።
የቅዱሳን ህብረት የቅዱሳን ሀገር
ሲያወድስ ይኖራል የስላሴን ክብር

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 4
ጽድቅና ራዕይን የተሞላ ሰማይ
እግዚአብሔር ያድለን በተንሳኤ እንድናይ
አዝ ።።።።።። ።።።።።።። ።።።።።
የሥላሴን መንበር ቅዱሳን ከበውት

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 5
እያሸበሸቡ የሰማይ መላእክት
ካህናት ሰማይ ቅዱስ ቅዱስ ቅዱስ ሲሉ
ይህን ልዩ ታምር ሊያ የታደሉ
በጽድቅ ስራቸው በምድር ይታያሉ

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 6
በጽድቅ ስራቸው በምድር ይታያሉ

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat

VERSE 1
Eyut temelketut yesemayun dimqet
Eyut temelketut yesemayun abat
CHORUS
Yeslasen menber Kidusan kebewt

CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat

VERSE 2
Eyashebeshebu yesemay melaekt
Kahnate seme Kidus Kidus silu
Yihn liyu tamr liyayu yetadelu
Bets’dq sirachew demqew yitayalu

CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat

VERSE 3
Bets’dq sirachew demqew yitayalu
CHORUS
Yeqdusan hibret yeqdusan heger
Siyaweds yinoral yeslasen kibir

CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat

VERSE 4
Ts’dqna raeyn yetemola semay
Egziabher yadlen betensae endnay
CHORUS
Yeslasen menber Kidusan kebewt

CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat

VERSE 5
Eyashebeshebu yesemay melaekt
Kahnat semay Kidus Kidus Kidus silu
Yihn liyu tamr liya yetadelu
Bets’dq sirachew bemdr yitayalu

CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat

VERSE 6
Bets’dq sirachew bemdr yitayalu

CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 1
እዩት ተመልከቱት የሰማዩን ድምቀት
እዩት ተመልከቱት የሰማዩን አባት
አዝ ።።።።።።። ።።።።።። ።።።።።።
የሥላሴን መንበር ቅዱሳን ከበውት

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 2
እያሸበሸቡ የሰማይ መላእክት
ካህናተ ሰመ ቅዱስ ቅዱስ ሲሉ
ይህን ልዩ ታምር ሊያዩ የታደሉ
በጽድቅ ስራቸው ደምቀው ይታያሉ

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 3
በጽድቅ ስራቸው ደምቀው ይታያሉ
አዝ ።።።።።።። ።።።።።። ።።።።።።
የቅዱሳን ህብረት የቅዱሳን ሀገር
ሲያወድስ ይኖራል የስላሴን ክብር

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 4
ጽድቅና ራዕይን የተሞላ ሰማይ
እግዚአብሔር ያድለን በተንሳኤ እንድናይ
አዝ ።።።።።። ።።።።።።። ።።።።።
የሥላሴን መንበር ቅዱሳን ከበውት

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 5
እያሸበሸቡ የሰማይ መላእክት
ካህናት ሰማይ ቅዱስ ቅዱስ ቅዱስ ሲሉ
ይህን ልዩ ታምር ሊያ የታደሉ
በጽድቅ ስራቸው በምድር ይታያሉ

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 6
በጽድቅ ስራቸው በምድር ይታያሉ

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት',
        lyrics_transliteration = 'CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat

VERSE 1
Eyut temelketut yesemayun dimqet
Eyut temelketut yesemayun abat
CHORUS
Yeslasen menber Kidusan kebewt

CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat

VERSE 2
Eyashebeshebu yesemay melaekt
Kahnate seme Kidus Kidus silu
Yihn liyu tamr liyayu yetadelu
Bets’dq sirachew demqew yitayalu

CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat

VERSE 3
Bets’dq sirachew demqew yitayalu
CHORUS
Yeqdusan hibret yeqdusan heger
Siyaweds yinoral yeslasen kibir

CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat

VERSE 4
Ts’dqna raeyn yetemola semay
Egziabher yadlen betensae endnay
CHORUS
Yeslasen menber Kidusan kebewt

CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat

VERSE 5
Eyashebeshebu yesemay melaekt
Kahnat semay Kidus Kidus Kidus silu
Yihn liyu tamr liya yetadelu
Bets’dq sirachew bemdr yitayalu

CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat

VERSE 6
Bets’dq sirachew bemdr yitayalu

CHORUS
Yeslasen menber Kidusan kebewt
Kirobel bedemena zufanun yizewt
Dingln kemehel mikaeln kefit
Aelaf melaek melaekt sisegdu befrat',
        updated_at = clock_timestamp()::text
    WHERE import_id = '93bfa843-583c-4bb1-8367-86104dc3de5a'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 1
እዩት ተመልከቱት የሰማዩን ድምቀት
እዩት ተመልከቱት የሰማዩን አባት
አዝ ።።።።።።። ።።።።።። ።።።።።።
የሥላሴን መንበር ቅዱሳን ከበውት

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 2
እያሸበሸቡ የሰማይ መላእክት
ካህናተ ሰመ ቅዱስ ቅዱስ ሲሉ
ይህን ልዩ ታምር ሊያዩ የታደሉ
በጽድቅ ስራቸው ደምቀው ይታያሉ

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 3
በጽድቅ ስራቸው ደምቀው ይታያሉ
አዝ ።።።።።።። ።።።።።። ።።።።።።
የቅዱሳን ህብረት የቅዱሳን ሀገር
ሲያወድስ ይኖራል የስላሴን ክብር

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 4
ጽድቅና ራዕይን የተሞላ ሰማይ
እግዚአብሔር ያድለን በተንሳኤ እንድናይ
አዝ ።።።።።። ።።።።።።። ።።።።።
የሥላሴን መንበር ቅዱሳን ከበውት

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 5
እያሸበሸቡ የሰማይ መላእክት
ካህናት ሰማይ ቅዱስ ቅዱስ ቅዱስ ሲሉ
ይህን ልዩ ታምር ሊያ የታደሉ
በጽድቅ ስራቸው በምድር ይታያሉ

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት

VERSE 6
በጽድቅ ስራቸው በምድር ይታያሉ

CHORUS
የሥላሴን መንበር ቅዱሳን ከበውት
ኪሮቤል በደመና ዙፋኑን ይዘውት
ድንግልን ከመሀል ሚካኤልን ከፊት
አእላፍ መላእክ መላእክት ሲሰግዱ በፍራት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '93bfa843-583c-4bb1-8367-86104dc3de5a'::uuid, 'yesilasen-meniber-kidusan-kebewit', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- amanuel-yikir-bay-newu ("Amanuel Yikir Bay Newu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9f8909ea-7d43-43d1-8745-d327d42702e4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 1
(2×)
አይምረኝም አትበሉ ጨካኝ ንጉስ አይደለም
ደሙ ብቻ ያነፃናል ከኃጢአታችን ዘላለም
እንደሞላ ጅረት ፈሶ ምድራችን አጥለቅልቋል

CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 2
የርሱ ምህረት ሃይል ሆኖት ስንቱ ከሞት አፈትልኳል
የጨለመው እየነጋ የተሻለ ቀን ይመጣል
በፍቀሩ ጦር ሳይወጋ ማን ከሞት ፊት ሮጦ ያመልጣል
ያን ክፉ ቀን በድል አልፈን እንደዋርካ የሰፋ ነው

CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 3
ነውርን ሁሉ በሚከድን በሞተልን በኢየሱስ ነው
የርሱን ፍቅር የሚያሸንፍ አንዳች ኃጢአት የለምና
ወደ ጌታ ለመመለስ አንዳች እንኳን እንዳንፈራ
ሀገራችን በሰማይ ነው (የ)ሚወድቅ የለም የሚረሳ

CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 4
ሰማያትን እንወርሳለን ከበጉ ደም የተነሳ
ወዳጅ አለን አንድ ብቻ በሰማይም በምድር
ስሙ ኢየሱስ የተባለ ሰውን ሁሉ የሚያፈቅር
ከመቃብር በላይ ሆኖ ፍቅሩ ዓለምን አስገረመ

CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 5
ይህን ሁሉ ጎስቋላ ሰው በትከሻው ተሸከመ

CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amanuel yiqr bay new fiqr
Mihret kebot besemayat yeminor
Eyamemew abatun eyet’era
Aychalehu lemigedlut sirara

VERSE 1
(2×)
Aymregnm atbelu ch’ekagn nigus aydelem
Demu bicha yanets’anal kehat’iatachn zelalem
Endemola jiret feso midrachn at’leqlqwal

CHORUS
Amanuel yiqr bay new fiqr
Mihret kebot besemayat yeminor
Eyamemew abatun eyet’era
Aychalehu lemigedlut sirara

VERSE 2
Yersu mihret hayl honot sintu kemot afetlkwal
Yech’elemew eyenega yeteshale qen yimet’al
Befqeru t’or saywega man kemot fit rot’o yamelt’al
Yan kifu qen bedl alfen endewarka yesefa new

CHORUS
Amanuel yiqr bay new fiqr
Mihret kebot besemayat yeminor
Eyamemew abatun eyet’era
Aychalehu lemigedlut sirara

VERSE 3
Newrn hulu bemikedn bemoteln beiyesus new
Yersun fiqr yemiyashenf andach hat’iat yelemna
Wede Geta lememeles andach enkwan endanfera
Hegerachn besemay new (ye)miwedq yelem yemiresa

CHORUS
Amanuel yiqr bay new fiqr
Mihret kebot besemayat yeminor
Eyamemew abatun eyet’era
Aychalehu lemigedlut sirara

VERSE 4
Semayatn enwersalen kebegu dem yetenesa
Wedaj alen and bicha besemaym bemdr
Simu Iyesus yetebale sewn hulu yemiyafeqr
Kemeqabr belay hono fiqru alemn asgereme

CHORUS
Amanuel yiqr bay new fiqr
Mihret kebot besemayat yeminor
Eyamemew abatun eyet’era
Aychalehu lemigedlut sirara

VERSE 5
Yihn hulu gosqwala sew betkeshaw teshekeme

CHORUS
Amanuel yiqr bay new fiqr
Mihret kebot besemayat yeminor
Eyamemew abatun eyet’era
Aychalehu lemigedlut sirara'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 1
(2×)
አይምረኝም አትበሉ ጨካኝ ንጉስ አይደለም
ደሙ ብቻ ያነፃናል ከኃጢአታችን ዘላለም
እንደሞላ ጅረት ፈሶ ምድራችን አጥለቅልቋል

CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 2
የርሱ ምህረት ሃይል ሆኖት ስንቱ ከሞት አፈትልኳል
የጨለመው እየነጋ የተሻለ ቀን ይመጣል
በፍቀሩ ጦር ሳይወጋ ማን ከሞት ፊት ሮጦ ያመልጣል
ያን ክፉ ቀን በድል አልፈን እንደዋርካ የሰፋ ነው

CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 3
ነውርን ሁሉ በሚከድን በሞተልን በኢየሱስ ነው
የርሱን ፍቅር የሚያሸንፍ አንዳች ኃጢአት የለምና
ወደ ጌታ ለመመለስ አንዳች እንኳን እንዳንፈራ
ሀገራችን በሰማይ ነው (የ)ሚወድቅ የለም የሚረሳ

CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 4
ሰማያትን እንወርሳለን ከበጉ ደም የተነሳ
ወዳጅ አለን አንድ ብቻ በሰማይም በምድር
ስሙ ኢየሱስ የተባለ ሰውን ሁሉ የሚያፈቅር
ከመቃብር በላይ ሆኖ ፍቅሩ ዓለምን አስገረመ

CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 5
ይህን ሁሉ ጎስቋላ ሰው በትከሻው ተሸከመ

CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ',
        lyrics_transliteration = 'CHORUS
Amanuel yiqr bay new fiqr
Mihret kebot besemayat yeminor
Eyamemew abatun eyet’era
Aychalehu lemigedlut sirara

VERSE 1
(2×)
Aymregnm atbelu ch’ekagn nigus aydelem
Demu bicha yanets’anal kehat’iatachn zelalem
Endemola jiret feso midrachn at’leqlqwal

CHORUS
Amanuel yiqr bay new fiqr
Mihret kebot besemayat yeminor
Eyamemew abatun eyet’era
Aychalehu lemigedlut sirara

VERSE 2
Yersu mihret hayl honot sintu kemot afetlkwal
Yech’elemew eyenega yeteshale qen yimet’al
Befqeru t’or saywega man kemot fit rot’o yamelt’al
Yan kifu qen bedl alfen endewarka yesefa new

CHORUS
Amanuel yiqr bay new fiqr
Mihret kebot besemayat yeminor
Eyamemew abatun eyet’era
Aychalehu lemigedlut sirara

VERSE 3
Newrn hulu bemikedn bemoteln beiyesus new
Yersun fiqr yemiyashenf andach hat’iat yelemna
Wede Geta lememeles andach enkwan endanfera
Hegerachn besemay new (ye)miwedq yelem yemiresa

CHORUS
Amanuel yiqr bay new fiqr
Mihret kebot besemayat yeminor
Eyamemew abatun eyet’era
Aychalehu lemigedlut sirara

VERSE 4
Semayatn enwersalen kebegu dem yetenesa
Wedaj alen and bicha besemaym bemdr
Simu Iyesus yetebale sewn hulu yemiyafeqr
Kemeqabr belay hono fiqru alemn asgereme

CHORUS
Amanuel yiqr bay new fiqr
Mihret kebot besemayat yeminor
Eyamemew abatun eyet’era
Aychalehu lemigedlut sirara

VERSE 5
Yihn hulu gosqwala sew betkeshaw teshekeme

CHORUS
Amanuel yiqr bay new fiqr
Mihret kebot besemayat yeminor
Eyamemew abatun eyet’era
Aychalehu lemigedlut sirara',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9f8909ea-7d43-43d1-8745-d327d42702e4'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 1
(2×)
አይምረኝም አትበሉ ጨካኝ ንጉስ አይደለም
ደሙ ብቻ ያነፃናል ከኃጢአታችን ዘላለም
እንደሞላ ጅረት ፈሶ ምድራችን አጥለቅልቋል

CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 2
የርሱ ምህረት ሃይል ሆኖት ስንቱ ከሞት አፈትልኳል
የጨለመው እየነጋ የተሻለ ቀን ይመጣል
በፍቀሩ ጦር ሳይወጋ ማን ከሞት ፊት ሮጦ ያመልጣል
ያን ክፉ ቀን በድል አልፈን እንደዋርካ የሰፋ ነው

CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 3
ነውርን ሁሉ በሚከድን በሞተልን በኢየሱስ ነው
የርሱን ፍቅር የሚያሸንፍ አንዳች ኃጢአት የለምና
ወደ ጌታ ለመመለስ አንዳች እንኳን እንዳንፈራ
ሀገራችን በሰማይ ነው (የ)ሚወድቅ የለም የሚረሳ

CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 4
ሰማያትን እንወርሳለን ከበጉ ደም የተነሳ
ወዳጅ አለን አንድ ብቻ በሰማይም በምድር
ስሙ ኢየሱስ የተባለ ሰውን ሁሉ የሚያፈቅር
ከመቃብር በላይ ሆኖ ፍቅሩ ዓለምን አስገረመ

CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ

VERSE 5
ይህን ሁሉ ጎስቋላ ሰው በትከሻው ተሸከመ

CHORUS
አማኑኤል ይቅር ባይ ነው ፍቅር
ምህረት ከቦት በሰማያት የሚኖር
እያመመው አባቱን እየጠራ
አይቻለሁ ለሚገድሉት ሲራራ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9f8909ea-7d43-43d1-8745-d327d42702e4'::uuid, 'amanuel-yikir-bay-newu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- mariyam-aniti ("Mariyam Aniti")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a45c4bce-9f4c-4eee-a612-c4a326b5a484'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም አንቲ ደመና ሰማይ ዘአኃዝኪ ዝናመ(፪)
ተክላተ መሬት አዳም ወሔዋን ዘፈረዩ ብኪ ዳግመ(፪)
ከመሬት የተገኙ አዳምና ሔዋን ሕይወት ያገኙብሽ (፪)
ዝናምን የያዝሽ የሰማይ ደመና ማርያም አንቺ ነሽ( ፪)

VERSE 1
ማርያም አንቲ ደመና ሰማይ ዘአኃዝኪ ዝናመ(፪)
ተክላተ መሬት አዳም ወሔዋን ዘፈረዩ ብኪ ዳግመ(፪)
ከመሬት የተገኙ አዳምና ሔዋን ሕይወት ያገኙብሽ (፪)
ዝናምን የያዝሽ የሰማይ ደመና ማርያም አንቺ ነሽ( ፪)

CHORUS
ማርያም አንቲ ደመና ሰማይ ዘአኃዝኪ ዝናመ(፪)
ተክላተ መሬት አዳም ወሔዋን ዘፈረዩ ብኪ ዳግመ(፪)
ከመሬት የተገኙ አዳምና ሔዋን ሕይወት ያገኙብሽ (፪)
ዝናምን የያዝሽ የሰማይ ደመና ማርያም አንቺ ነሽ( ፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Maryam anti demena semay zeahazki ziname (2)
Teklate meret adam wehewan zefereyu biki dagme (2)
Kemeret yetegegnu adamna hewan hiywet yagegnubsh (2)
Zinamn yeyazsh yesemay demena Maryam anchi nesh (2)

VERSE 1
Maryam anti demena semay zeahazki ziname (2)
Teklate meret adam wehewan zefereyu biki dagme (2)
Kemeret yetegegnu adamna hewan hiywet yagegnubsh (2)
Zinamn yeyazsh yesemay demena Maryam anchi nesh (2)

CHORUS
Maryam anti demena semay zeahazki ziname (2)
Teklate meret adam wehewan zefereyu biki dagme (2)
Kemeret yetegegnu adamna hewan hiywet yagegnubsh (2)
Zinamn yeyazsh yesemay demena Maryam anchi nesh (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ማርያም አንቲ ደመና ሰማይ ዘአኃዝኪ ዝናመ(፪)
ተክላተ መሬት አዳም ወሔዋን ዘፈረዩ ብኪ ዳግመ(፪)
ከመሬት የተገኙ አዳምና ሔዋን ሕይወት ያገኙብሽ (፪)
ዝናምን የያዝሽ የሰማይ ደመና ማርያም አንቺ ነሽ( ፪)

VERSE 1
ማርያም አንቲ ደመና ሰማይ ዘአኃዝኪ ዝናመ(፪)
ተክላተ መሬት አዳም ወሔዋን ዘፈረዩ ብኪ ዳግመ(፪)
ከመሬት የተገኙ አዳምና ሔዋን ሕይወት ያገኙብሽ (፪)
ዝናምን የያዝሽ የሰማይ ደመና ማርያም አንቺ ነሽ( ፪)

CHORUS
ማርያም አንቲ ደመና ሰማይ ዘአኃዝኪ ዝናመ(፪)
ተክላተ መሬት አዳም ወሔዋን ዘፈረዩ ብኪ ዳግመ(፪)
ከመሬት የተገኙ አዳምና ሔዋን ሕይወት ያገኙብሽ (፪)
ዝናምን የያዝሽ የሰማይ ደመና ማርያም አንቺ ነሽ( ፪)',
        lyrics_transliteration = 'CHORUS
Maryam anti demena semay zeahazki ziname (2)
Teklate meret adam wehewan zefereyu biki dagme (2)
Kemeret yetegegnu adamna hewan hiywet yagegnubsh (2)
Zinamn yeyazsh yesemay demena Maryam anchi nesh (2)

VERSE 1
Maryam anti demena semay zeahazki ziname (2)
Teklate meret adam wehewan zefereyu biki dagme (2)
Kemeret yetegegnu adamna hewan hiywet yagegnubsh (2)
Zinamn yeyazsh yesemay demena Maryam anchi nesh (2)

CHORUS
Maryam anti demena semay zeahazki ziname (2)
Teklate meret adam wehewan zefereyu biki dagme (2)
Kemeret yetegegnu adamna hewan hiywet yagegnubsh (2)
Zinamn yeyazsh yesemay demena Maryam anchi nesh (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a45c4bce-9f4c-4eee-a612-c4a326b5a484'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ማርያም አንቲ ደመና ሰማይ ዘአኃዝኪ ዝናመ(፪)
ተክላተ መሬት አዳም ወሔዋን ዘፈረዩ ብኪ ዳግመ(፪)
ከመሬት የተገኙ አዳምና ሔዋን ሕይወት ያገኙብሽ (፪)
ዝናምን የያዝሽ የሰማይ ደመና ማርያም አንቺ ነሽ( ፪)

VERSE 1
ማርያም አንቲ ደመና ሰማይ ዘአኃዝኪ ዝናመ(፪)
ተክላተ መሬት አዳም ወሔዋን ዘፈረዩ ብኪ ዳግመ(፪)
ከመሬት የተገኙ አዳምና ሔዋን ሕይወት ያገኙብሽ (፪)
ዝናምን የያዝሽ የሰማይ ደመና ማርያም አንቺ ነሽ( ፪)

CHORUS
ማርያም አንቲ ደመና ሰማይ ዘአኃዝኪ ዝናመ(፪)
ተክላተ መሬት አዳም ወሔዋን ዘፈረዩ ብኪ ዳግመ(፪)
ከመሬት የተገኙ አዳምና ሔዋን ሕይወት ያገኙብሽ (፪)
ዝናምን የያዝሽ የሰማይ ደመና ማርያም አንቺ ነሽ( ፪)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a45c4bce-9f4c-4eee-a612-c4a326b5a484'::uuid, 'mariyam-aniti', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- betekirisitiyanin-anitewim-keto ("Betekirisitiyanin Anitewim Keto")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9265c9fc-33a3-4a24-b81e-87bf13405c48'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 1
አዝ▸▸▸▸▸▸▸▸▸▸►
ሁሉንም በሁሉ በሚሞላው ጌታ
ሙሽራው የሆነች ቤቱ ተሰኝታ
በክብር በሞገስ በጸጋ ተሞልታ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 2
ደምቃ ትኖራለች ለዓለም አብርታ ፪
አዝ▸▸▸▸▸▸▸▸▸▸►
ዲያብሎስ ቢጨርስ ቀስቶቹን በሙሉ
ወጥመድ ቢዘረጋ በጉዞአችን ሁሉ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 3
እንሻገራለን የአምላክን ስም ጠርተን
አንዳች አይነካንም እርሱን ተጠግተን ፪
አዝ▸▸▸▸▸▸▸▸▸▸►
በስሙ መሰብሰብ በስሙ መስራት

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 4
ስለ ስሙ መኖር ለስሙ መሞት
ጠላት ዲያብሎስን ምን ባያስደስት
ይህ ነው ክርስትና ይኼ ነው ሕይወት ፪
አዝ▸▸▸▸▸▸▸▸▸▸►

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 5
ከትውልድ ለትውልድ የምናስረክበው
ለልጅ ልጅ አውርሰን ደስ የምንሰኘው
አይደል ብርና ወርቅ አይደል ሌላ ሀብት
ሃይማኖታችን ነው የእኛ ርስት ጉልት

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 6
ቤተክርስቲያን ናት የእኛ ርስት ጉልት

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 1
CHORUS
Hulunm behulu bemimolaw Geta
Mushraw yehonech betu tesegnta
Bekbr bemoges bets’ega temolta

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 2
Demqa tinoralech lealem abrta 2
CHORUS
Diyablos bich’ers qestochun bemulu
Wet’med bizerega beguzoachn hulu

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 3
Enshageralen yeamlakn sim t’erten
Andach aynekanm ersun tet’egten 2
CHORUS
Besmu mesebseb besmu mesrat

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 4
Sile simu menor lesmu memot
T’elat diyablosn min bayasdest
Yih new kirstna yiኼ new hiywet 2
CHORUS

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 5
Ketwld letwld yemnasrekbew
Lelj lij awrsen des yemnsegnew
Aydel birna werq aydel lela hebt
Haymanotachn new yeegna rist gult

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 6
Bete Kristian nat yeegna rist gult

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 1
አዝ▸▸▸▸▸▸▸▸▸▸►
ሁሉንም በሁሉ በሚሞላው ጌታ
ሙሽራው የሆነች ቤቱ ተሰኝታ
በክብር በሞገስ በጸጋ ተሞልታ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 2
ደምቃ ትኖራለች ለዓለም አብርታ ፪
አዝ▸▸▸▸▸▸▸▸▸▸►
ዲያብሎስ ቢጨርስ ቀስቶቹን በሙሉ
ወጥመድ ቢዘረጋ በጉዞአችን ሁሉ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 3
እንሻገራለን የአምላክን ስም ጠርተን
አንዳች አይነካንም እርሱን ተጠግተን ፪
አዝ▸▸▸▸▸▸▸▸▸▸►
በስሙ መሰብሰብ በስሙ መስራት

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 4
ስለ ስሙ መኖር ለስሙ መሞት
ጠላት ዲያብሎስን ምን ባያስደስት
ይህ ነው ክርስትና ይኼ ነው ሕይወት ፪
አዝ▸▸▸▸▸▸▸▸▸▸►

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 5
ከትውልድ ለትውልድ የምናስረክበው
ለልጅ ልጅ አውርሰን ደስ የምንሰኘው
አይደል ብርና ወርቅ አይደል ሌላ ሀብት
ሃይማኖታችን ነው የእኛ ርስት ጉልት

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 6
ቤተክርስቲያን ናት የእኛ ርስት ጉልት

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ',
        lyrics_transliteration = 'CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 1
CHORUS
Hulunm behulu bemimolaw Geta
Mushraw yehonech betu tesegnta
Bekbr bemoges bets’ega temolta

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 2
Demqa tinoralech lealem abrta 2
CHORUS
Diyablos bich’ers qestochun bemulu
Wet’med bizerega beguzoachn hulu

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 3
Enshageralen yeamlakn sim t’erten
Andach aynekanm ersun tet’egten 2
CHORUS
Besmu mesebseb besmu mesrat

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 4
Sile simu menor lesmu memot
T’elat diyablosn min bayasdest
Yih new kirstna yiኼ new hiywet 2
CHORUS

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 5
Ketwld letwld yemnasrekbew
Lelj lij awrsen des yemnsegnew
Aydel birna werq aydel lela hebt
Haymanotachn new yeegna rist gult

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto

VERSE 6
Bete Kristian nat yeegna rist gult

CHORUS
Betekrstiyann antewm keto
Yeset’enn amlak bedemu mesrto
Yeset’enn Geta bemesqelu moto
Yeamlakachnn bet antewm keto',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9265c9fc-33a3-4a24-b81e-87bf13405c48'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 1
አዝ▸▸▸▸▸▸▸▸▸▸►
ሁሉንም በሁሉ በሚሞላው ጌታ
ሙሽራው የሆነች ቤቱ ተሰኝታ
በክብር በሞገስ በጸጋ ተሞልታ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 2
ደምቃ ትኖራለች ለዓለም አብርታ ፪
አዝ▸▸▸▸▸▸▸▸▸▸►
ዲያብሎስ ቢጨርስ ቀስቶቹን በሙሉ
ወጥመድ ቢዘረጋ በጉዞአችን ሁሉ

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 3
እንሻገራለን የአምላክን ስም ጠርተን
አንዳች አይነካንም እርሱን ተጠግተን ፪
አዝ▸▸▸▸▸▸▸▸▸▸►
በስሙ መሰብሰብ በስሙ መስራት

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 4
ስለ ስሙ መኖር ለስሙ መሞት
ጠላት ዲያብሎስን ምን ባያስደስት
ይህ ነው ክርስትና ይኼ ነው ሕይወት ፪
አዝ▸▸▸▸▸▸▸▸▸▸►

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 5
ከትውልድ ለትውልድ የምናስረክበው
ለልጅ ልጅ አውርሰን ደስ የምንሰኘው
አይደል ብርና ወርቅ አይደል ሌላ ሀብት
ሃይማኖታችን ነው የእኛ ርስት ጉልት

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ

VERSE 6
ቤተክርስቲያን ናት የእኛ ርስት ጉልት

CHORUS
ቤተክርስቲያንን አንተውም ከቶ
የሰጠንን አምላክ በደሙ መስርቶ
የሰጠንን ጌታ በመስቀሉ ሞቶ
የአምላካችንን ቤት አንተውም ከቶ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9265c9fc-33a3-4a24-b81e-87bf13405c48'::uuid, 'betekirisitiyanin-anitewim-keto', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- ethiopia-zemarit-fantu-welde-anedbti-yawta ("Ethiopia: Zemarit Fantu Welde Anedbti Yawta")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a99f7c39-bfc5-4b48-8ba8-4cd0e81a5cb5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 1
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከሃጢያት ፍላፃ ከሞት አተረፈ
የአናብስቱን አፍ በሃይሉ የዘጋ
የዳንኤል አምላክ ይኖራል ከእኛጋ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 2
በዳዊት ምስጋና በያሬድ ዝማሬ
ከቅዱሳን ጋር ልዘምር አብሬ
እርሱን ሳመሰግን ሜልኮል ብትስቅብኝ
ለጌታዬ ክብር እዘምራለሁኝ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 3
አስፈሪው ነበልባል እሳቱ ቢነድም
ለጣኦት እንድሰግድ ነገስታት ቢያውጁም
ሁሉም ቢተወኝም ቢጠላኝም ዓለም
ፅናት ይሆነኛል ጌታ መድሃኔዓለም

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 4
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከሃጢያት ፍላፃ ከሞት አተረፈ
የአናብስቱን አፍ በሃይሉ የዘጋ
የዳንኤል አምላክ ይኖራል ከእኛጋ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 1
Wet’med tesebere enem amelet’kugn
Kehat’iyat filats’a kemot aterefe
Yeanabstun af behaylu yezega
Yedanel amlak yinoral keegnaga

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 2
Bedawit misgana beyared zimare
Keqdusan gar lizemr abre
Ersun samesegn melkol bitsqbgn
Legetaye kibir ezemralehugn

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 3
Asferiw nebelbal esatu binedm
Let’aot endsegd negestat biyawjum
Hulum bitewegnm bit’elagnm alem
Ts’nat yihonegnal Geta medhanealem

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 4
Wet’med tesebere enem amelet’kugn
Kehat’iyat filats’a kemot aterefe
Yeanabstun af behaylu yezega
Yedanel amlak yinoral keegnaga

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 1
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከሃጢያት ፍላፃ ከሞት አተረፈ
የአናብስቱን አፍ በሃይሉ የዘጋ
የዳንኤል አምላክ ይኖራል ከእኛጋ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 2
በዳዊት ምስጋና በያሬድ ዝማሬ
ከቅዱሳን ጋር ልዘምር አብሬ
እርሱን ሳመሰግን ሜልኮል ብትስቅብኝ
ለጌታዬ ክብር እዘምራለሁኝ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 3
አስፈሪው ነበልባል እሳቱ ቢነድም
ለጣኦት እንድሰግድ ነገስታት ቢያውጁም
ሁሉም ቢተወኝም ቢጠላኝም ዓለም
ፅናት ይሆነኛል ጌታ መድሃኔዓለም

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 4
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከሃጢያት ፍላፃ ከሞት አተረፈ
የአናብስቱን አፍ በሃይሉ የዘጋ
የዳንኤል አምላክ ይኖራል ከእኛጋ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ',
        lyrics_transliteration = 'CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 1
Wet’med tesebere enem amelet’kugn
Kehat’iyat filats’a kemot aterefe
Yeanabstun af behaylu yezega
Yedanel amlak yinoral keegnaga

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 2
Bedawit misgana beyared zimare
Keqdusan gar lizemr abre
Ersun samesegn melkol bitsqbgn
Legetaye kibir ezemralehugn

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 3
Asferiw nebelbal esatu binedm
Let’aot endsegd negestat biyawjum
Hulum bitewegnm bit’elagnm alem
Ts’nat yihonegnal Geta medhanealem

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme

VERSE 4
Wet’med tesebere enem amelet’kugn
Kehat’iyat filats’a kemot aterefe
Yeanabstun af behaylu yezega
Yedanel amlak yinoral keegnaga

CHORUS
Andebetem yawt’a yemsgana qine
Yeamlaken madan aychalehu beayne
Begebaon semay ts’eheyn yaqome
Zarem gobgntognal eyedegageme',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a99f7c39-bfc5-4b48-8ba8-4cd0e81a5cb5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 1
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከሃጢያት ፍላፃ ከሞት አተረፈ
የአናብስቱን አፍ በሃይሉ የዘጋ
የዳንኤል አምላክ ይኖራል ከእኛጋ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 2
በዳዊት ምስጋና በያሬድ ዝማሬ
ከቅዱሳን ጋር ልዘምር አብሬ
እርሱን ሳመሰግን ሜልኮል ብትስቅብኝ
ለጌታዬ ክብር እዘምራለሁኝ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 3
አስፈሪው ነበልባል እሳቱ ቢነድም
ለጣኦት እንድሰግድ ነገስታት ቢያውጁም
ሁሉም ቢተወኝም ቢጠላኝም ዓለም
ፅናት ይሆነኛል ጌታ መድሃኔዓለም

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ

VERSE 4
ወጥመድ ተሰበረ እኔም አመለጥኩኝ
ከሃጢያት ፍላፃ ከሞት አተረፈ
የአናብስቱን አፍ በሃይሉ የዘጋ
የዳንኤል አምላክ ይኖራል ከእኛጋ

CHORUS
አንደበቴም ያውጣ የምስጋና ቅኔ
የአምላኬን ማዳን አይቻለሁ በዓይኔ
በገባዖን ሰማይ ፀሐይን ያቆመ
ዛሬም ጎብኝቶኛል እየደጋገመ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a99f7c39-bfc5-4b48-8ba8-4cd0e81a5cb5'::uuid, 'ethiopia-zemarit-fantu-welde-anedbti-yawta', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- emebete-mariam-elemneshalew ("Emebete Mariam Elemneshalew")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a674794d-6839-4253-b671-5ef7615f3258'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤቴ ማርያም እለምንሻለው
በለቅሶ በዋይታ ፊትሽ ወድቄአለው
እመቤቴ ስሚኝ ተማጽኬሻለው /2/

VERSE 1
ሐዘኔን ጭንቀቴን ለማን እነግራለው
ችግሬን ጉዳቴን ለማን አዋያለው
እመቤቴ ስሚኝ ተማጽኬሻለው /2/

CHORUS
እመቤቴ ማርያም እለምንሻለው
በለቅሶ በዋይታ ፊትሽ ወድቄአለው
እመቤቴ ስሚኝ ተማጽኬሻለው /2/

VERSE 2
ሐዘኑ በዛብኝ ፈተናው ከበደኝ
እንደምን ልቻለው እኔስ ብቻዬን ነኝ
የዐማኑኤል እናት ፈጥነሽ ድረሽልኝ /2/

CHORUS
እመቤቴ ማርያም እለምንሻለው
በለቅሶ በዋይታ ፊትሽ ወድቄአለው
እመቤቴ ስሚኝ ተማጽኬሻለው /2/

VERSE 3
በጣም ተንገዳገድከ ልወድቅ ነው እኔ
እመ አምላክ ደግፊኝ ቁሚልኝ ከጎኔ
ምንም አጋር የለኝ ከአንቺ በቀር ለእኔ /2/

CHORUS
እመቤቴ ማርያም እለምንሻለው
በለቅሶ በዋይታ ፊትሽ ወድቄአለው
እመቤቴ ስሚኝ ተማጽኬሻለው /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Embete Mariam Elemneshalew
Belekso bewayta fitesh wedkialew
Embete semign Tematsignalew /2/

VERSE 1
Hazenen Chinketen Leman Enegralehu
Chigren Gudaten Leman Awayalehu
Emebete semign Tematsegnalew /2/

CHORUS
Embete Mariam Elemneshalew
Belekso bewayta fitesh wedkialew
Embete semign Tematsignalew /2/

VERSE 2
Hazenu Bezabgn Fetanaw Kebedegn
Endemen Lichalew Enes bichayen negn
Yeamanuel Enat Fetinesh Dereshilegn /2/

CHORUS
Embete Mariam Elemneshalew
Belekso bewayta fitesh wedkialew
Embete semign Tematsignalew /2/

VERSE 3
Betam Tengedagedkugn Lewedik new ene
Eme Amlak Degefegn kumilegn keGone
Menem Ager Yelegnem Keanchi Beker lene /2/

CHORUS
Embete Mariam Elemneshalew
Belekso bewayta fitesh wedkialew
Embete semign Tematsignalew /2/'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
እመቤቴ ማርያም እለምንሻለው
በለቅሶ በዋይታ ፊትሽ ወድቄአለው
እመቤቴ ስሚኝ ተማጽኬሻለው /2/

VERSE 1
ሐዘኔን ጭንቀቴን ለማን እነግራለው
ችግሬን ጉዳቴን ለማን አዋያለው
እመቤቴ ስሚኝ ተማጽኬሻለው /2/

CHORUS
እመቤቴ ማርያም እለምንሻለው
በለቅሶ በዋይታ ፊትሽ ወድቄአለው
እመቤቴ ስሚኝ ተማጽኬሻለው /2/

VERSE 2
ሐዘኑ በዛብኝ ፈተናው ከበደኝ
እንደምን ልቻለው እኔስ ብቻዬን ነኝ
የዐማኑኤል እናት ፈጥነሽ ድረሽልኝ /2/

CHORUS
እመቤቴ ማርያም እለምንሻለው
በለቅሶ በዋይታ ፊትሽ ወድቄአለው
እመቤቴ ስሚኝ ተማጽኬሻለው /2/

VERSE 3
በጣም ተንገዳገድከ ልወድቅ ነው እኔ
እመ አምላክ ደግፊኝ ቁሚልኝ ከጎኔ
ምንም አጋር የለኝ ከአንቺ በቀር ለእኔ /2/

CHORUS
እመቤቴ ማርያም እለምንሻለው
በለቅሶ በዋይታ ፊትሽ ወድቄአለው
እመቤቴ ስሚኝ ተማጽኬሻለው /2/',
        lyrics_transliteration = 'CHORUS
Embete Mariam Elemneshalew
Belekso bewayta fitesh wedkialew
Embete semign Tematsignalew /2/

VERSE 1
Hazenen Chinketen Leman Enegralehu
Chigren Gudaten Leman Awayalehu
Emebete semign Tematsegnalew /2/

CHORUS
Embete Mariam Elemneshalew
Belekso bewayta fitesh wedkialew
Embete semign Tematsignalew /2/

VERSE 2
Hazenu Bezabgn Fetanaw Kebedegn
Endemen Lichalew Enes bichayen negn
Yeamanuel Enat Fetinesh Dereshilegn /2/

CHORUS
Embete Mariam Elemneshalew
Belekso bewayta fitesh wedkialew
Embete semign Tematsignalew /2/

VERSE 3
Betam Tengedagedkugn Lewedik new ene
Eme Amlak Degefegn kumilegn keGone
Menem Ager Yelegnem Keanchi Beker lene /2/

CHORUS
Embete Mariam Elemneshalew
Belekso bewayta fitesh wedkialew
Embete semign Tematsignalew /2/',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a674794d-6839-4253-b671-5ef7615f3258'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
እመቤቴ ማርያም እለምንሻለው
በለቅሶ በዋይታ ፊትሽ ወድቄአለው
እመቤቴ ስሚኝ ተማጽኬሻለው /2/

VERSE 1
ሐዘኔን ጭንቀቴን ለማን እነግራለው
ችግሬን ጉዳቴን ለማን አዋያለው
እመቤቴ ስሚኝ ተማጽኬሻለው /2/

CHORUS
እመቤቴ ማርያም እለምንሻለው
በለቅሶ በዋይታ ፊትሽ ወድቄአለው
እመቤቴ ስሚኝ ተማጽኬሻለው /2/

VERSE 2
ሐዘኑ በዛብኝ ፈተናው ከበደኝ
እንደምን ልቻለው እኔስ ብቻዬን ነኝ
የዐማኑኤል እናት ፈጥነሽ ድረሽልኝ /2/

CHORUS
እመቤቴ ማርያም እለምንሻለው
በለቅሶ በዋይታ ፊትሽ ወድቄአለው
እመቤቴ ስሚኝ ተማጽኬሻለው /2/

VERSE 3
በጣም ተንገዳገድከ ልወድቅ ነው እኔ
እመ አምላክ ደግፊኝ ቁሚልኝ ከጎኔ
ምንም አጋር የለኝ ከአንቺ በቀር ለእኔ /2/

CHORUS
እመቤቴ ማርያም እለምንሻለው
በለቅሶ በዋይታ ፊትሽ ወድቄአለው
እመቤቴ ስሚኝ ተማጽኬሻለው /2/'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Embete Mariam Elemneshalew
Belekso bewayta fitesh wedkialew
Embete semign Tematsignalew /2/

VERSE 1
Hazenen Chinketen Leman Enegralehu
Chigren Gudaten Leman Awayalehu
Emebete semign Tematsegnalew /2/

CHORUS
Embete Mariam Elemneshalew
Belekso bewayta fitesh wedkialew
Embete semign Tematsignalew /2/

VERSE 2
Hazenu Bezabgn Fetanaw Kebedegn
Endemen Lichalew Enes bichayen negn
Yeamanuel Enat Fetinesh Dereshilegn /2/

CHORUS
Embete Mariam Elemneshalew
Belekso bewayta fitesh wedkialew
Embete semign Tematsignalew /2/

VERSE 3
Betam Tengedagedkugn Lewedik new ene
Eme Amlak Degefegn kumilegn keGone
Menem Ager Yelegnem Keanchi Beker lene /2/

CHORUS
Embete Mariam Elemneshalew
Belekso bewayta fitesh wedkialew
Embete semign Tematsignalew /2/';
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a674794d-6839-4253-b671-5ef7615f3258'::uuid, 'emebete-mariam-elemneshalew', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yefelekegn-sitefa ("Yefelekegn Sitefa")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '99529977-bdfd-44a1-b6b1-43788c0b66c3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 1
ከብርልኝ ለኔስ እንዳንተ
ማንም የለኝም (2)
ካንተ ይልቅ የገዳዬን ደጅ መሻቴ
አስለቀሰኝ አንተ አሰኘኝ ሂወቴ

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 2
ይገረመኛል እንዲህ አሰቀይሜህ በድዬህ
በምህረትህ ደግሞ ማቅረብህ ሰቅዬህ
አባብዬ የኔ መካሪ የማተወኝ የኔ መሃሪ
በይቅርታህ ደግሞ አቀረብከኝ ልታኖረኝ እያፈቀርከኝ

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 3
እኔ በጦሪ ተጠራሪቼ ስወጋህ
አቀሪቅረህ ጨለማ አይኔ አነጋህ
የቤቴ እራስ መከበራያዬ ሆይ ግርማዬ
ማትረፈያዬ ሙላቴ አንተ ነህ መኩሪያዬ

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 4
ወደ ሞት ጫፍ ካንተ ኮብልዬ ከአባቴ
ስንከራተት ጸጋዬ ደርቆ ዘይቴ
መዳሃኒቴ አንተ ባትመጣ ወደኔ
የእንባ ነበር የእንክርት ሂወት ዘመኔ

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 5
በከንፈሬ ስምህ ተከትባል መድኔ
ካንተ በቀር ሌላ አያመልክም ልሳኔ
ካሁን በፊት ከዚህም በፊት ዘላለም
የማመልክህ አንተ ብቻ ነህ የኔ አለም

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 6
አባብዬ የኔ መካሪ የማተወኝ የኔ መሀሪ
በይቅርታህ ደግሞ አቀረብከኝ ልታኖረኝ እያፈቀርከኝ

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat

VERSE 1
Kebrlgn lenes endante
Manm yelegnm (2)
Kante yilq yegedayen dej meshate
Asleqesegn ante asegnegn hiwete

CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat

VERSE 2
Yigeremegnal endih aseqeymeh bedyeh
Bemhreth degmo maqrebh seqyeh
Ababye yene mekari yematewegn yene mehari
Beyqrtah degmo aqerebkegn litanoregn eyafeqerkegn

CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat

VERSE 3
Ene bet’ori tet’erariche siwegah
Aqeriqreh ch’elema ayne anegah
Yebete eras mekeberayaye hoy girmaye
Matrefeyaye mulate ante neh mekuriyaye

CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat

VERSE 4
Wede mot ch’af kante koblye keabate
Sinkeratet ts’egaye derqo zeyte
Medahanite ante batmet’a wedene
Yeenba neber yeenkrt hiwet zemene

CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat

VERSE 5
Bekenfere simh teketbal medne
Kante beqer lela ayamelkm lisane
Kahun befit kezihm befit zelalem
Yemamelkh ante bicha neh yene alem

CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat

VERSE 6
Ababye yene mekari yematewegn yene meheri
Beyqrtah degmo aqerebkegn litanoregn eyafeqerkegn

CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 1
ከብርልኝ ለኔስ እንዳንተ
ማንም የለኝም (2)
ካንተ ይልቅ የገዳዬን ደጅ መሻቴ
አስለቀሰኝ አንተ አሰኘኝ ሂወቴ

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 2
ይገረመኛል እንዲህ አሰቀይሜህ በድዬህ
በምህረትህ ደግሞ ማቅረብህ ሰቅዬህ
አባብዬ የኔ መካሪ የማተወኝ የኔ መሃሪ
በይቅርታህ ደግሞ አቀረብከኝ ልታኖረኝ እያፈቀርከኝ

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 3
እኔ በጦሪ ተጠራሪቼ ስወጋህ
አቀሪቅረህ ጨለማ አይኔ አነጋህ
የቤቴ እራስ መከበራያዬ ሆይ ግርማዬ
ማትረፈያዬ ሙላቴ አንተ ነህ መኩሪያዬ

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 4
ወደ ሞት ጫፍ ካንተ ኮብልዬ ከአባቴ
ስንከራተት ጸጋዬ ደርቆ ዘይቴ
መዳሃኒቴ አንተ ባትመጣ ወደኔ
የእንባ ነበር የእንክርት ሂወት ዘመኔ

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 5
በከንፈሬ ስምህ ተከትባል መድኔ
ካንተ በቀር ሌላ አያመልክም ልሳኔ
ካሁን በፊት ከዚህም በፊት ዘላለም
የማመልክህ አንተ ብቻ ነህ የኔ አለም

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 6
አባብዬ የኔ መካሪ የማተወኝ የኔ መሀሪ
በይቅርታህ ደግሞ አቀረብከኝ ልታኖረኝ እያፈቀርከኝ

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት',
        lyrics_transliteration = 'CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat

VERSE 1
Kebrlgn lenes endante
Manm yelegnm (2)
Kante yilq yegedayen dej meshate
Asleqesegn ante asegnegn hiwete

CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat

VERSE 2
Yigeremegnal endih aseqeymeh bedyeh
Bemhreth degmo maqrebh seqyeh
Ababye yene mekari yematewegn yene mehari
Beyqrtah degmo aqerebkegn litanoregn eyafeqerkegn

CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat

VERSE 3
Ene bet’ori tet’erariche siwegah
Aqeriqreh ch’elema ayne anegah
Yebete eras mekeberayaye hoy girmaye
Matrefeyaye mulate ante neh mekuriyaye

CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat

VERSE 4
Wede mot ch’af kante koblye keabate
Sinkeratet ts’egaye derqo zeyte
Medahanite ante batmet’a wedene
Yeenba neber yeenkrt hiwet zemene

CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat

VERSE 5
Bekenfere simh teketbal medne
Kante beqer lela ayamelkm lisane
Kahun befit kezihm befit zelalem
Yemamelkh ante bicha neh yene alem

CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat

VERSE 6
Ababye yene mekari yematewegn yene meheri
Beyqrtah degmo aqerebkegn litanoregn eyafeqerkegn

CHORUS
Yefelekegne sit’efa
Yet’eraኸgne befuch’et
Mitsasalgn cher Geta
Mitanoregn deg abat',
        updated_at = clock_timestamp()::text
    WHERE import_id = '99529977-bdfd-44a1-b6b1-43788c0b66c3'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 1
ከብርልኝ ለኔስ እንዳንተ
ማንም የለኝም (2)
ካንተ ይልቅ የገዳዬን ደጅ መሻቴ
አስለቀሰኝ አንተ አሰኘኝ ሂወቴ

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 2
ይገረመኛል እንዲህ አሰቀይሜህ በድዬህ
በምህረትህ ደግሞ ማቅረብህ ሰቅዬህ
አባብዬ የኔ መካሪ የማተወኝ የኔ መሃሪ
በይቅርታህ ደግሞ አቀረብከኝ ልታኖረኝ እያፈቀርከኝ

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 3
እኔ በጦሪ ተጠራሪቼ ስወጋህ
አቀሪቅረህ ጨለማ አይኔ አነጋህ
የቤቴ እራስ መከበራያዬ ሆይ ግርማዬ
ማትረፈያዬ ሙላቴ አንተ ነህ መኩሪያዬ

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 4
ወደ ሞት ጫፍ ካንተ ኮብልዬ ከአባቴ
ስንከራተት ጸጋዬ ደርቆ ዘይቴ
መዳሃኒቴ አንተ ባትመጣ ወደኔ
የእንባ ነበር የእንክርት ሂወት ዘመኔ

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 5
በከንፈሬ ስምህ ተከትባል መድኔ
ካንተ በቀር ሌላ አያመልክም ልሳኔ
ካሁን በፊት ከዚህም በፊት ዘላለም
የማመልክህ አንተ ብቻ ነህ የኔ አለም

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት

VERSE 6
አባብዬ የኔ መካሪ የማተወኝ የኔ መሀሪ
በይቅርታህ ደግሞ አቀረብከኝ ልታኖረኝ እያፈቀርከኝ

CHORUS
የፈለከኘ ስጠፋ
የጠራኸኘ በፉጨት
ምትሳሳልኝ ቸር ጌታ
ምታኖረኝ ደግ አባት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '99529977-bdfd-44a1-b6b1-43788c0b66c3'::uuid, 'yefelekegn-sitefa', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- tolo-na ("Tolo Na")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = '9bff80a6-d9c7-4098-b088-14a917f34a52'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 1
መጥፊ ዕድሌ አብቅቶ ልቤ እንዲረጋጋ
ከአይን ጥቅሻ ፈጥነህ ወደ እኔ ቤት ግባ
ቶሎ ና ገብርኤል አደራ
ላዘነ ብርታትን የምትሰብክበት

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 2
ለተጨነቀ ሰው የምትደርስበት
አርያማያዊው ካህን ይዘህ ሰናይ ዜና
ድረስ ገብርኤል ሆይ ከመቅፅበት ናና
ቶሎ ና ሩፋኤል አደራ

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 3
ፈታሄ ማህፀን ሩፋኤል አባቴ
ኃጥያት ነግሶበት ፈርሶብኛል ቤቴ
ደዌን የምታርቅ ከስራት የምትፈታ
ያሳደከኝ መልዓክ በምህረት ቶሎ ና

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 4
ቶሎ ና ራጉኤል አደራ
በፈጠነ ዘመን በተከዳ ዕድሜ
ስምህን እጠራለሁ ደግሜ ደግሜ
ሰላሜ ነህና የምትደግፈኝ

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 5
በሰርክ በነግህ ራጉኤል ናልኝ
ቶሎ ና ዑራኤል አደራ
የፍቅር ስንቅ ይዘህ የሰላምን ፅዋ
በቀኝህ መፅናናት በግራህ ፍስሃ

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 6
ድረስ ዑራኤል ሆይ ፈጥነህ ወደኛ ና
ፍቅር ከኛ ርቆ ተጨንቃለችና

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet

VERSE 1
Met’fi edle abqto libe endiregaga
Keayn t’qsha fet’neh wede ene bet giba
Tolo na Gebriel adera
Lazene birtatn yemtsebkbet

CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet

VERSE 2
Letech’eneqe sew yemtdersbet
Aryamayawiw kahn yizeh senay zena
Dires Gebriel hoy kemeqts’bet nana
Tolo na Rufael adera

CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet

VERSE 3
Fetahe mahts’en Rufael abate
Hat’yat negsobet fersobgnal bete
Dewen yemtarq kesrat yemtfeta
Yasadekegn melak bemhret tolo na

CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet

VERSE 4
Tolo na raguel adera
Befet’ene zemen betekeda edme
Simhn et’eralehu degme degme
Selame nehna yemtdegfegn

CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet

VERSE 5
Beserk benegh raguel nalgn
Tolo na urael adera
Yefqr sinq yizeh yeselamn ts’wa
Beqegnh mets’nanat begrah fisha

CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet

VERSE 6
Dires urael hoy fet’neh wedegna na
Fiqr kegna riqo tech’enqalechna

CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 1
መጥፊ ዕድሌ አብቅቶ ልቤ እንዲረጋጋ
ከአይን ጥቅሻ ፈጥነህ ወደ እኔ ቤት ግባ
ቶሎ ና ገብርኤል አደራ
ላዘነ ብርታትን የምትሰብክበት

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 2
ለተጨነቀ ሰው የምትደርስበት
አርያማያዊው ካህን ይዘህ ሰናይ ዜና
ድረስ ገብርኤል ሆይ ከመቅፅበት ናና
ቶሎ ና ሩፋኤል አደራ

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 3
ፈታሄ ማህፀን ሩፋኤል አባቴ
ኃጥያት ነግሶበት ፈርሶብኛል ቤቴ
ደዌን የምታርቅ ከስራት የምትፈታ
ያሳደከኝ መልዓክ በምህረት ቶሎ ና

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 4
ቶሎ ና ራጉኤል አደራ
በፈጠነ ዘመን በተከዳ ዕድሜ
ስምህን እጠራለሁ ደግሜ ደግሜ
ሰላሜ ነህና የምትደግፈኝ

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 5
በሰርክ በነግህ ራጉኤል ናልኝ
ቶሎ ና ዑራኤል አደራ
የፍቅር ስንቅ ይዘህ የሰላምን ፅዋ
በቀኝህ መፅናናት በግራህ ፍስሃ

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 6
ድረስ ዑራኤል ሆይ ፈጥነህ ወደኛ ና
ፍቅር ከኛ ርቆ ተጨንቃለችና

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት',
        lyrics_transliteration = 'CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet

VERSE 1
Met’fi edle abqto libe endiregaga
Keayn t’qsha fet’neh wede ene bet giba
Tolo na Gebriel adera
Lazene birtatn yemtsebkbet

CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet

VERSE 2
Letech’eneqe sew yemtdersbet
Aryamayawiw kahn yizeh senay zena
Dires Gebriel hoy kemeqts’bet nana
Tolo na Rufael adera

CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet

VERSE 3
Fetahe mahts’en Rufael abate
Hat’yat negsobet fersobgnal bete
Dewen yemtarq kesrat yemtfeta
Yasadekegn melak bemhret tolo na

CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet

VERSE 4
Tolo na raguel adera
Befet’ene zemen betekeda edme
Simhn et’eralehu degme degme
Selame nehna yemtdegfegn

CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet

VERSE 5
Beserk benegh raguel nalgn
Tolo na urael adera
Yefqr sinq yizeh yeselamn ts’wa
Beqegnh mets’nanat begrah fisha

CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet

VERSE 6
Dires urael hoy fet’neh wedegna na
Fiqr kegna riqo tech’enqalechna

CHORUS
Simh sit’era
Tolona Mikael adera
Beteset’eh silt’an bemt’ebqbet
Bebetre mesqelh dil selam balebet',
        updated_at = clock_timestamp()::text
    WHERE import_id = '9bff80a6-d9c7-4098-b088-14a917f34a52'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 1
መጥፊ ዕድሌ አብቅቶ ልቤ እንዲረጋጋ
ከአይን ጥቅሻ ፈጥነህ ወደ እኔ ቤት ግባ
ቶሎ ና ገብርኤል አደራ
ላዘነ ብርታትን የምትሰብክበት

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 2
ለተጨነቀ ሰው የምትደርስበት
አርያማያዊው ካህን ይዘህ ሰናይ ዜና
ድረስ ገብርኤል ሆይ ከመቅፅበት ናና
ቶሎ ና ሩፋኤል አደራ

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 3
ፈታሄ ማህፀን ሩፋኤል አባቴ
ኃጥያት ነግሶበት ፈርሶብኛል ቤቴ
ደዌን የምታርቅ ከስራት የምትፈታ
ያሳደከኝ መልዓክ በምህረት ቶሎ ና

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 4
ቶሎ ና ራጉኤል አደራ
በፈጠነ ዘመን በተከዳ ዕድሜ
ስምህን እጠራለሁ ደግሜ ደግሜ
ሰላሜ ነህና የምትደግፈኝ

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 5
በሰርክ በነግህ ራጉኤል ናልኝ
ቶሎ ና ዑራኤል አደራ
የፍቅር ስንቅ ይዘህ የሰላምን ፅዋ
በቀኝህ መፅናናት በግራህ ፍስሃ

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት

VERSE 6
ድረስ ዑራኤል ሆይ ፈጥነህ ወደኛ ና
ፍቅር ከኛ ርቆ ተጨንቃለችና

CHORUS
ስምህ ሲጠራ
ቶሎና ሚካኤል አደራ
በተሰጠህ ስልጣን በምጠብቅበት
በበትረ መስቀልህ ድል ሰላም ባለበት'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        '9bff80a6-d9c7-4098-b088-14a917f34a52'::uuid, 'tolo-na', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- kanesagn-kafer-ketbiya ("kanesagn kafer ketbiya")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a2eec0b8-729c-4ae0-90c5-95909804ab4c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካነሳኝ ካፈር ከትቢያ ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር በሞገስ ካጌጥኩበት
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ

VERSE 1
ስደተኛ ሰው ብሆን
አልተለየኝም ልጁን
ከቤቴ ግባ መምህሩ እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ካፈር ከትቢያ ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር በሞገስ ካጌጥኩበት
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ

VERSE 2
ተነዋወጠ ወይኒው
በመዝሙር ሳወደሰው
የእጄን ሰንሰለት የፈታ
ብዙ ነው ስራው የጌታ

CHORUS
ካነሳኝ ካፈር ከትቢያ ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር በሞገስ ካጌጥኩበት
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ

VERSE 3
ከቤቴ ግባ መምህሩ እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት የነፍሴ ክብር ነህና
አይቻለሁ እጁን
አብርቶኛል ፊቱን

CHORUS
ካነሳኝ ካፈር ከትቢያ ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር በሞገስ ካጌጥኩበት
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ

VERSE 4
በልዑል ጥላ ስኖር
ወሰን በሌለው ፍቅር
ከቤቴ ግባ መምህሩ እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ካፈር ከትቢያ ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር በሞገስ ካጌጥኩበት
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Kanesagn kafer ketbiya kaqomegn besegenet
Ezemralehu leEgziabher bemoges kaget’kubet
Yeanbesochn af yezega
Enen lemadan yetega

VERSE 1
Sidetegna sew bihon
Alteleyegnm lijun
Kebete giba memhru efewesalehu bet’ena
Yehywet ras medhanit yenefse kibir nehna

CHORUS
Kanesagn kafer ketbiya kaqomegn besegenet
Ezemralehu leEgziabher bemoges kaget’kubet
Yeanbesochn af yezega
Enen lemadan yetega

VERSE 2
Tenewawet’e weyniw
Bemezmur sawedesew
Yeejen senselet yefeta
Bizu new siraw yegeta

CHORUS
Kanesagn kafer ketbiya kaqomegn besegenet
Ezemralehu leEgziabher bemoges kaget’kubet
Yeanbesochn af yezega
Enen lemadan yetega

VERSE 3
Kebete giba memhru efewesalehu bet’ena
Yehywet ras medhanit yenefse kibir nehna
Aychalehu ejun
Abrtognal fitun

CHORUS
Kanesagn kafer ketbiya kaqomegn besegenet
Ezemralehu leEgziabher bemoges kaget’kubet
Yeanbesochn af yezega
Enen lemadan yetega

VERSE 4
Belul t’la sinor
Wesen belelew fiqr
Kebete giba memhru efewesalehu bet’ena
Yehywet ras medhanit yenefse kibir nehna

CHORUS
Kanesagn kafer ketbiya kaqomegn besegenet
Ezemralehu leEgziabher bemoges kaget’kubet
Yeanbesochn af yezega
Enen lemadan yetega'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ካነሳኝ ካፈር ከትቢያ ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር በሞገስ ካጌጥኩበት
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ

VERSE 1
ስደተኛ ሰው ብሆን
አልተለየኝም ልጁን
ከቤቴ ግባ መምህሩ እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ካፈር ከትቢያ ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር በሞገስ ካጌጥኩበት
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ

VERSE 2
ተነዋወጠ ወይኒው
በመዝሙር ሳወደሰው
የእጄን ሰንሰለት የፈታ
ብዙ ነው ስራው የጌታ

CHORUS
ካነሳኝ ካፈር ከትቢያ ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር በሞገስ ካጌጥኩበት
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ

VERSE 3
ከቤቴ ግባ መምህሩ እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት የነፍሴ ክብር ነህና
አይቻለሁ እጁን
አብርቶኛል ፊቱን

CHORUS
ካነሳኝ ካፈር ከትቢያ ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር በሞገስ ካጌጥኩበት
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ

VERSE 4
በልዑል ጥላ ስኖር
ወሰን በሌለው ፍቅር
ከቤቴ ግባ መምህሩ እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ካፈር ከትቢያ ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር በሞገስ ካጌጥኩበት
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ',
        lyrics_transliteration = 'CHORUS
Kanesagn kafer ketbiya kaqomegn besegenet
Ezemralehu leEgziabher bemoges kaget’kubet
Yeanbesochn af yezega
Enen lemadan yetega

VERSE 1
Sidetegna sew bihon
Alteleyegnm lijun
Kebete giba memhru efewesalehu bet’ena
Yehywet ras medhanit yenefse kibir nehna

CHORUS
Kanesagn kafer ketbiya kaqomegn besegenet
Ezemralehu leEgziabher bemoges kaget’kubet
Yeanbesochn af yezega
Enen lemadan yetega

VERSE 2
Tenewawet’e weyniw
Bemezmur sawedesew
Yeejen senselet yefeta
Bizu new siraw yegeta

CHORUS
Kanesagn kafer ketbiya kaqomegn besegenet
Ezemralehu leEgziabher bemoges kaget’kubet
Yeanbesochn af yezega
Enen lemadan yetega

VERSE 3
Kebete giba memhru efewesalehu bet’ena
Yehywet ras medhanit yenefse kibir nehna
Aychalehu ejun
Abrtognal fitun

CHORUS
Kanesagn kafer ketbiya kaqomegn besegenet
Ezemralehu leEgziabher bemoges kaget’kubet
Yeanbesochn af yezega
Enen lemadan yetega

VERSE 4
Belul t’la sinor
Wesen belelew fiqr
Kebete giba memhru efewesalehu bet’ena
Yehywet ras medhanit yenefse kibir nehna

CHORUS
Kanesagn kafer ketbiya kaqomegn besegenet
Ezemralehu leEgziabher bemoges kaget’kubet
Yeanbesochn af yezega
Enen lemadan yetega',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a2eec0b8-729c-4ae0-90c5-95909804ab4c'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ካነሳኝ ካፈር ከትቢያ ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር በሞገስ ካጌጥኩበት
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ

VERSE 1
ስደተኛ ሰው ብሆን
አልተለየኝም ልጁን
ከቤቴ ግባ መምህሩ እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ካፈር ከትቢያ ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር በሞገስ ካጌጥኩበት
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ

VERSE 2
ተነዋወጠ ወይኒው
በመዝሙር ሳወደሰው
የእጄን ሰንሰለት የፈታ
ብዙ ነው ስራው የጌታ

CHORUS
ካነሳኝ ካፈር ከትቢያ ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር በሞገስ ካጌጥኩበት
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ

VERSE 3
ከቤቴ ግባ መምህሩ እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት የነፍሴ ክብር ነህና
አይቻለሁ እጁን
አብርቶኛል ፊቱን

CHORUS
ካነሳኝ ካፈር ከትቢያ ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር በሞገስ ካጌጥኩበት
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ

VERSE 4
በልዑል ጥላ ስኖር
ወሰን በሌለው ፍቅር
ከቤቴ ግባ መምህሩ እፈወሳለሁ በጤና
የህይወት ራስ መድኃኒት የነፍሴ ክብር ነህና

CHORUS
ካነሳኝ ካፈር ከትቢያ ካቆመኝ በሰገነት
እዘምራለሁ ለእግዚአብሔር በሞገስ ካጌጥኩበት
የአንበሶችን አፍ የዘጋ
እኔን ለማዳን የተጋ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a2eec0b8-729c-4ae0-90c5-95909804ab4c'::uuid, 'kanesagn-kafer-ketbiya', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- eritrean-orthodox-tewahdo-mezmur-3182 ("Eritrean Orthodox Tewahdo Mezmur")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a4c64417-fb00-487d-98bb-37557c8ca55b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ

VERSE 1
ዓለማት ዝወሰንካ ዘይቅረብ ብርሃን ትነብር
ምድርን ሰማይን ናትካ ዝደለካዮ ትገብር
ሃብታም በዓለ ጸጋ ተሓቢነ እግዚኣብሄር
ጎይታይ ምሳይ ምኻንካ ከመስግነካ ይነብር

CHORUS
ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ

VERSE 2
ኣሕዋተይ ሽይጦሙኒ ካብ ኣዝማደይ ተፈሊየ
ኣብ ስደት ምድረ በዳ ኮይነ ዉን ኣይሕለልን የ
ተስፋ መንግስተ ሰማይ ሂብካኒ ኢንዲኻ ጎይታይ
ሞት እካ ኣይፈልየንን ንስካ ኢካ ዕላማይ

CHORUS
ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ

VERSE 3
ጽባሕ እንታ ክከዉን ኢለ ፈጺመ ኣይጭነቅን
ብዛዕባ ዝበልዖን ዝሰትዮን ትሓልን ትፈልጥን
ኢደ እግረይ ዓይነ ብርከይ ልቦናይ ቃላት ትንፋሰይ
ኩሉ በኣካዩ ዝኮነ ኣምላከይ ናትከየ ኣነ

CHORUS
ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ

VERSE 4
ከም ምዉት ተተረሳዕኩ ረዳኢ ተሰኣንኩ
ናባኻ ምስ ጸለኩ ኣጆካ ኢልካኒ ኣለኩ
ከመይ ኢሉ ክጽምወኒ ማርያመይ ከላትኒ
ቅዱስ ሚካኤል ገብሪኤል ምስ መላእክቲ የዕልል

CHORUS
ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amlake yosef temesgenka amanuel
Misay mikanka amanuel
Miluoy ika emntoy akilka titerfeni
Kindi ashhat wegeney konka tidgfeni

VERSE 1
Alemat ziwesenka zeyqreb birhan tinebr
Midrn semayn natka zidelekayo tigebr
Habtam beale ts’ega tehabine egziabher
Goytay misay miኻnka kemesgneka yinebr

CHORUS
Amlake yosef temesgenka amanuel
Misay mikanka amanuel
Miluoy ika emntoy akilka titerfeni
Kindi ashhat wegeney konka tidgfeni

VERSE 2
Ahwatey shyt’omuni kab azmadey tefeliye
Ab sidet midre beda koyne wun ayhleln ye
Tesfa mengste semay hibkani indiኻ goytay
Mot eka ayfelyenn niska ika elamay

CHORUS
Amlake yosef temesgenka amanuel
Misay mikanka amanuel
Miluoy ika emntoy akilka titerfeni
Kindi ashhat wegeney konka tidgfeni

VERSE 3
Ts’bah enta kikewun ile fets’ime aych’neqn
Bizaeba zibelon zisetyon tihaln tifelt’n
Ide egrey ayne birkey libonay qalat tinfasey
Kulu beakayu zikone amlakey natkeye ane

CHORUS
Amlake yosef temesgenka amanuel
Misay mikanka amanuel
Miluoy ika emntoy akilka titerfeni
Kindi ashhat wegeney konka tidgfeni

VERSE 4
Kem miwut teteresaeku redai teseanku
Nabaኻ mis ts’eleku ajoka ilkani aleku
Kemey ilu kits’mweni maryamey kelatni
Kidus Mikael gebriel mis melaekti yeell

CHORUS
Amlake yosef temesgenka amanuel
Misay mikanka amanuel
Miluoy ika emntoy akilka titerfeni
Kindi ashhat wegeney konka tidgfeni'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ

VERSE 1
ዓለማት ዝወሰንካ ዘይቅረብ ብርሃን ትነብር
ምድርን ሰማይን ናትካ ዝደለካዮ ትገብር
ሃብታም በዓለ ጸጋ ተሓቢነ እግዚኣብሄር
ጎይታይ ምሳይ ምኻንካ ከመስግነካ ይነብር

CHORUS
ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ

VERSE 2
ኣሕዋተይ ሽይጦሙኒ ካብ ኣዝማደይ ተፈሊየ
ኣብ ስደት ምድረ በዳ ኮይነ ዉን ኣይሕለልን የ
ተስፋ መንግስተ ሰማይ ሂብካኒ ኢንዲኻ ጎይታይ
ሞት እካ ኣይፈልየንን ንስካ ኢካ ዕላማይ

CHORUS
ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ

VERSE 3
ጽባሕ እንታ ክከዉን ኢለ ፈጺመ ኣይጭነቅን
ብዛዕባ ዝበልዖን ዝሰትዮን ትሓልን ትፈልጥን
ኢደ እግረይ ዓይነ ብርከይ ልቦናይ ቃላት ትንፋሰይ
ኩሉ በኣካዩ ዝኮነ ኣምላከይ ናትከየ ኣነ

CHORUS
ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ

VERSE 4
ከም ምዉት ተተረሳዕኩ ረዳኢ ተሰኣንኩ
ናባኻ ምስ ጸለኩ ኣጆካ ኢልካኒ ኣለኩ
ከመይ ኢሉ ክጽምወኒ ማርያመይ ከላትኒ
ቅዱስ ሚካኤል ገብሪኤል ምስ መላእክቲ የዕልል

CHORUS
ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ',
        lyrics_transliteration = 'CHORUS
Amlake yosef temesgenka amanuel
Misay mikanka amanuel
Miluoy ika emntoy akilka titerfeni
Kindi ashhat wegeney konka tidgfeni

VERSE 1
Alemat ziwesenka zeyqreb birhan tinebr
Midrn semayn natka zidelekayo tigebr
Habtam beale ts’ega tehabine egziabher
Goytay misay miኻnka kemesgneka yinebr

CHORUS
Amlake yosef temesgenka amanuel
Misay mikanka amanuel
Miluoy ika emntoy akilka titerfeni
Kindi ashhat wegeney konka tidgfeni

VERSE 2
Ahwatey shyt’omuni kab azmadey tefeliye
Ab sidet midre beda koyne wun ayhleln ye
Tesfa mengste semay hibkani indiኻ goytay
Mot eka ayfelyenn niska ika elamay

CHORUS
Amlake yosef temesgenka amanuel
Misay mikanka amanuel
Miluoy ika emntoy akilka titerfeni
Kindi ashhat wegeney konka tidgfeni

VERSE 3
Ts’bah enta kikewun ile fets’ime aych’neqn
Bizaeba zibelon zisetyon tihaln tifelt’n
Ide egrey ayne birkey libonay qalat tinfasey
Kulu beakayu zikone amlakey natkeye ane

CHORUS
Amlake yosef temesgenka amanuel
Misay mikanka amanuel
Miluoy ika emntoy akilka titerfeni
Kindi ashhat wegeney konka tidgfeni

VERSE 4
Kem miwut teteresaeku redai teseanku
Nabaኻ mis ts’eleku ajoka ilkani aleku
Kemey ilu kits’mweni maryamey kelatni
Kidus Mikael gebriel mis melaekti yeell

CHORUS
Amlake yosef temesgenka amanuel
Misay mikanka amanuel
Miluoy ika emntoy akilka titerfeni
Kindi ashhat wegeney konka tidgfeni',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a4c64417-fb00-487d-98bb-37557c8ca55b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ

VERSE 1
ዓለማት ዝወሰንካ ዘይቅረብ ብርሃን ትነብር
ምድርን ሰማይን ናትካ ዝደለካዮ ትገብር
ሃብታም በዓለ ጸጋ ተሓቢነ እግዚኣብሄር
ጎይታይ ምሳይ ምኻንካ ከመስግነካ ይነብር

CHORUS
ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ

VERSE 2
ኣሕዋተይ ሽይጦሙኒ ካብ ኣዝማደይ ተፈሊየ
ኣብ ስደት ምድረ በዳ ኮይነ ዉን ኣይሕለልን የ
ተስፋ መንግስተ ሰማይ ሂብካኒ ኢንዲኻ ጎይታይ
ሞት እካ ኣይፈልየንን ንስካ ኢካ ዕላማይ

CHORUS
ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ

VERSE 3
ጽባሕ እንታ ክከዉን ኢለ ፈጺመ ኣይጭነቅን
ብዛዕባ ዝበልዖን ዝሰትዮን ትሓልን ትፈልጥን
ኢደ እግረይ ዓይነ ብርከይ ልቦናይ ቃላት ትንፋሰይ
ኩሉ በኣካዩ ዝኮነ ኣምላከይ ናትከየ ኣነ

CHORUS
ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ

VERSE 4
ከም ምዉት ተተረሳዕኩ ረዳኢ ተሰኣንኩ
ናባኻ ምስ ጸለኩ ኣጆካ ኢልካኒ ኣለኩ
ከመይ ኢሉ ክጽምወኒ ማርያመይ ከላትኒ
ቅዱስ ሚካኤል ገብሪኤል ምስ መላእክቲ የዕልል

CHORUS
ኣምላከ ዮሴፍ ተመስገንካ ኣማኑኤል
ምሳይ ምካንካ ኣማኑኤል
ምሉኦይ ኢካ እምንቶይ ኣኪልካ ትተርፈኒ
ክንዲ ኣሽሓት ወገነይ ኮንካ ትድግፈኒ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a4c64417-fb00-487d-98bb-37557c8ca55b'::uuid, 'eritrean-orthodox-tewahdo-mezmur-3182', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- dinigil-hoy-sile-anichi-newina ("Dinigil Hoy Sile Anichi Newina")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a68df6b4-c5f8-4a8e-aad2-799952de16c2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ስሙን እንዳልጠራ አንደበትም የለኝ
ፊቱንም እንዳላይ ሥራዬ አስቸገረኝ

VERSE 1
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ታውቆኛል ጥፋቴ ብዙ እንደበደልኩኝ
ትእዛዙን እንደሻርኩ ህጉን እንደጣስኩኝ

CHORUS
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ስሙን እንዳልጠራ አንደበትም የለኝ
ፊቱንም እንዳላይ ሥራዬ አስቸገረኝ

VERSE 2
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
በፊቱ እንዳላፍር የተጠራሁ ለታ
እለምነዋለሁ ከአሁኑ ይቅርታ

CHORUS
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ስሙን እንዳልጠራ አንደበትም የለኝ
ፊቱንም እንዳላይ ሥራዬ አስቸገረኝ

VERSE 3
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
አንተ ክቡር መልአክ ልደቱን አብሣሪ
አማልደኝ ከጌታዬ ከፈጣሪ

CHORUS
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ስሙን እንዳልጠራ አንደበትም የለኝ
ፊቱንም እንዳላይ ሥራዬ አስቸገረኝ

VERSE 4
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ፃድቃን ሰማእታት እናንተም ሁላችሁ
አማልዱኝ ከአምላኬ ከአምላካችሁ

CHORUS
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ስሙን እንዳልጠራ አንደበትም የለኝ
ፊቱንም እንዳላይ ሥራዬ አስቸገረኝ

VERSE 5
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ

CHORUS
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ስሙን እንዳልጠራ አንደበትም የለኝ
ፊቱንም እንዳላይ ሥራዬ አስቸገረኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Simun endalt’era andebetm yelegn
Fitunm endalay siraye aschegeregn

VERSE 1
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Tawqognal t’fate bizu endebedelkugn
Tiezazun endesharku higun endet’askugn

CHORUS
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Simun endalt’era andebetm yelegn
Fitunm endalay siraye aschegeregn

VERSE 2
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Befitu endalafr yetet’erahu leta
Elemnewalehu keahunu yiqrta

CHORUS
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Simun endalt’era andebetm yelegn
Fitunm endalay siraye aschegeregn

VERSE 3
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Ante kibur melak lidetun absari
Amaldegn kegetaye kefet’ari

CHORUS
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Simun endalt’era andebetm yelegn
Fitunm endalay siraye aschegeregn

VERSE 4
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Ts’adqan semaetat enantem hulachhu
Amaldugn keamlake keamlakachhu

CHORUS
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Simun endalt’era andebetm yelegn
Fitunm endalay siraye aschegeregn

VERSE 5
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari

CHORUS
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Simun endalt’era andebetm yelegn
Fitunm endalay siraye aschegeregn'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ስሙን እንዳልጠራ አንደበትም የለኝ
ፊቱንም እንዳላይ ሥራዬ አስቸገረኝ

VERSE 1
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ታውቆኛል ጥፋቴ ብዙ እንደበደልኩኝ
ትእዛዙን እንደሻርኩ ህጉን እንደጣስኩኝ

CHORUS
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ስሙን እንዳልጠራ አንደበትም የለኝ
ፊቱንም እንዳላይ ሥራዬ አስቸገረኝ

VERSE 2
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
በፊቱ እንዳላፍር የተጠራሁ ለታ
እለምነዋለሁ ከአሁኑ ይቅርታ

CHORUS
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ስሙን እንዳልጠራ አንደበትም የለኝ
ፊቱንም እንዳላይ ሥራዬ አስቸገረኝ

VERSE 3
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
አንተ ክቡር መልአክ ልደቱን አብሣሪ
አማልደኝ ከጌታዬ ከፈጣሪ

CHORUS
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ስሙን እንዳልጠራ አንደበትም የለኝ
ፊቱንም እንዳላይ ሥራዬ አስቸገረኝ

VERSE 4
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ፃድቃን ሰማእታት እናንተም ሁላችሁ
አማልዱኝ ከአምላኬ ከአምላካችሁ

CHORUS
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ስሙን እንዳልጠራ አንደበትም የለኝ
ፊቱንም እንዳላይ ሥራዬ አስቸገረኝ

VERSE 5
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ

CHORUS
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ስሙን እንዳልጠራ አንደበትም የለኝ
ፊቱንም እንዳላይ ሥራዬ አስቸገረኝ',
        lyrics_transliteration = 'CHORUS
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Simun endalt’era andebetm yelegn
Fitunm endalay siraye aschegeregn

VERSE 1
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Tawqognal t’fate bizu endebedelkugn
Tiezazun endesharku higun endet’askugn

CHORUS
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Simun endalt’era andebetm yelegn
Fitunm endalay siraye aschegeregn

VERSE 2
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Befitu endalafr yetet’erahu leta
Elemnewalehu keahunu yiqrta

CHORUS
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Simun endalt’era andebetm yelegn
Fitunm endalay siraye aschegeregn

VERSE 3
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Ante kibur melak lidetun absari
Amaldegn kegetaye kefet’ari

CHORUS
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Simun endalt’era andebetm yelegn
Fitunm endalay siraye aschegeregn

VERSE 4
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Ts’adqan semaetat enantem hulachhu
Amaldugn keamlake keamlakachhu

CHORUS
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Simun endalt’era andebetm yelegn
Fitunm endalay siraye aschegeregn

VERSE 5
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari

CHORUS
Dingil hoy sile anchi newna meheri
Amaljign keand lijsh kefet’ari
Simun endalt’era andebetm yelegn
Fitunm endalay siraye aschegeregn',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a68df6b4-c5f8-4a8e-aad2-799952de16c2'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ስሙን እንዳልጠራ አንደበትም የለኝ
ፊቱንም እንዳላይ ሥራዬ አስቸገረኝ

VERSE 1
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ታውቆኛል ጥፋቴ ብዙ እንደበደልኩኝ
ትእዛዙን እንደሻርኩ ህጉን እንደጣስኩኝ

CHORUS
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ስሙን እንዳልጠራ አንደበትም የለኝ
ፊቱንም እንዳላይ ሥራዬ አስቸገረኝ

VERSE 2
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
በፊቱ እንዳላፍር የተጠራሁ ለታ
እለምነዋለሁ ከአሁኑ ይቅርታ

CHORUS
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ስሙን እንዳልጠራ አንደበትም የለኝ
ፊቱንም እንዳላይ ሥራዬ አስቸገረኝ

VERSE 3
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
አንተ ክቡር መልአክ ልደቱን አብሣሪ
አማልደኝ ከጌታዬ ከፈጣሪ

CHORUS
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ስሙን እንዳልጠራ አንደበትም የለኝ
ፊቱንም እንዳላይ ሥራዬ አስቸገረኝ

VERSE 4
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ፃድቃን ሰማእታት እናንተም ሁላችሁ
አማልዱኝ ከአምላኬ ከአምላካችሁ

CHORUS
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ስሙን እንዳልጠራ አንደበትም የለኝ
ፊቱንም እንዳላይ ሥራዬ አስቸገረኝ

VERSE 5
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ

CHORUS
ድንግል ሆይ ስለ አንቺ ነውና መሐሪ
አማልጂኝ ከአንድ ልጅሽ ከፈጣሪ
ስሙን እንዳልጠራ አንደበትም የለኝ
ፊቱንም እንዳላይ ሥራዬ አስቸገረኝ'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a68df6b4-c5f8-4a8e-aad2-799952de16c2'::uuid, 'dinigil-hoy-sile-anichi-newina', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- yom-semayawi ("Yom Semayawi")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'afb24efb-5aa9-4635-a464-8e3682f7e4e5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዮም ሰማያዊ በጎል ሰከበ
ለዘተወልደ እም ቅድስት ድንግል
ርእይዎ ኖሎት (2)
አእኰትዎ መላዕክት (2)

VERSE 1
ዛሬ ሰማያዊው በበረት ተኛ
የተወለደው ከቅድስት ድንግል
እረኞች አዩት (2)
አመሰገኑት መላዕክት (2)

CHORUS
ዮም ሰማያዊ በጎል ሰከበ
ለዘተወልደ እም ቅድስት ድንግል
ርእይዎ ኖሎት (2)
አእኰትዎ መላዕክት (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Yom semayawi begol sekebe
Lezetewelde em Kidist Dingil
Rieywo nolot (2)
Aekwetwo melaekt (2)

VERSE 1
Zare semayawiw beberet tegna
Yeteweledew keqdst Dingil
Eregnoch ayut (2)
Amesegenut melaekt (2)

CHORUS
Yom semayawi begol sekebe
Lezetewelde em Kidist Dingil
Rieywo nolot (2)
Aekwetwo melaekt (2)'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ዮም ሰማያዊ በጎል ሰከበ
ለዘተወልደ እም ቅድስት ድንግል
ርእይዎ ኖሎት (2)
አእኰትዎ መላዕክት (2)

VERSE 1
ዛሬ ሰማያዊው በበረት ተኛ
የተወለደው ከቅድስት ድንግል
እረኞች አዩት (2)
አመሰገኑት መላዕክት (2)

CHORUS
ዮም ሰማያዊ በጎል ሰከበ
ለዘተወልደ እም ቅድስት ድንግል
ርእይዎ ኖሎት (2)
አእኰትዎ መላዕክት (2)',
        lyrics_transliteration = 'CHORUS
Yom semayawi begol sekebe
Lezetewelde em Kidist Dingil
Rieywo nolot (2)
Aekwetwo melaekt (2)

VERSE 1
Zare semayawiw beberet tegna
Yeteweledew keqdst Dingil
Eregnoch ayut (2)
Amesegenut melaekt (2)

CHORUS
Yom semayawi begol sekebe
Lezetewelde em Kidist Dingil
Rieywo nolot (2)
Aekwetwo melaekt (2)',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'afb24efb-5aa9-4635-a464-8e3682f7e4e5'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ዮም ሰማያዊ በጎል ሰከበ
ለዘተወልደ እም ቅድስት ድንግል
ርእይዎ ኖሎት (2)
አእኰትዎ መላዕክት (2)

VERSE 1
ዛሬ ሰማያዊው በበረት ተኛ
የተወለደው ከቅድስት ድንግል
እረኞች አዩት (2)
አመሰገኑት መላዕክት (2)

CHORUS
ዮም ሰማያዊ በጎል ሰከበ
ለዘተወልደ እም ቅድስት ድንግል
ርእይዎ ኖሎት (2)
አእኰትዎ መላዕክት (2)'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'afb24efb-5aa9-4635-a464-8e3682f7e4e5'::uuid, 'yom-semayawi', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- aniferiatsu ("Aniferiatsu")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'ac606ed2-3a22-4df1-8dcb-08424e331ce6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አምኃሆሙ አምጽኡ መድምመ /*2
አንፈራዓፁ ሰብአ ሰገል /*4

VERSE 1
አምኃሆሙ አምጽኡ መድምመ /*2
አንፈራዓፁ ሰብአ ሰገል /*4

CHORUS
አምኃሆሙ አምጽኡ መድምመ /*2
አንፈራዓፁ ሰብአ ሰገል /*4'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Amhahomu amts’u medmme /*2
Anferaats’u seba segel /*4

VERSE 1
Amhahomu amts’u medmme /*2
Anferaats’u seba segel /*4

CHORUS
Amhahomu amts’u medmme /*2
Anferaats’u seba segel /*4'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
አምኃሆሙ አምጽኡ መድምመ /*2
አንፈራዓፁ ሰብአ ሰገል /*4

VERSE 1
አምኃሆሙ አምጽኡ መድምመ /*2
አንፈራዓፁ ሰብአ ሰገል /*4

CHORUS
አምኃሆሙ አምጽኡ መድምመ /*2
አንፈራዓፁ ሰብአ ሰገል /*4',
        lyrics_transliteration = 'CHORUS
Amhahomu amts’u medmme /*2
Anferaats’u seba segel /*4

VERSE 1
Amhahomu amts’u medmme /*2
Anferaats’u seba segel /*4

CHORUS
Amhahomu amts’u medmme /*2
Anferaats’u seba segel /*4',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'ac606ed2-3a22-4df1-8dcb-08424e331ce6'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
አምኃሆሙ አምጽኡ መድምመ /*2
አንፈራዓፁ ሰብአ ሰገል /*4

VERSE 1
አምኃሆሙ አምጽኡ መድምመ /*2
አንፈራዓፁ ሰብአ ሰገል /*4

CHORUS
አምኃሆሙ አምጽኡ መድምመ /*2
አንፈራዓፁ ሰብአ ሰገል /*4'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'ac606ed2-3a22-4df1-8dcb-08424e331ce6'::uuid, 'aniferiatsu', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- neweritreanorthodoxmezmur2025 ("NewEritreanOrthodoxMezmur2025")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'a537dd40-7a99-4d18-bcb4-733135b6b89d'::uuid
      AND deleted_at IS NULL
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
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
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
ሓንት''ስ ክውድሳ''የ ብዜማይ ከድምጻ',
        lyrics_transliteration = 'CHORUS
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
Hant''s kiwdsa''ye bizemay kedmts’a',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'a537dd40-7a99-4d18-bcb4-733135b6b89d'::uuid
      AND deleted_at IS NULL
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
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'a537dd40-7a99-4d18-bcb4-733135b6b89d'::uuid, 'neweritreanorthodoxmezmur2025', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

  -- leene-yaladerekew-min-ale ("Leene Yaladerekew Min Ale")
  IF EXISTS (
    SELECT 1 FROM public.mezmur_data_import
    WHERE import_id = 'b2262b81-41d7-48f3-8f63-aae3ec26cd2b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 1
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ከሰማይ ወረደ እንደ ነጠብጣብ
ጠለ በረከትህ ኑሮዬን ሊያጠግብ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 2
የዕለት እንጀራዬ ባትሆን ወዳጄ
ማን ይገባ ነበር በተዘጋው ደጄ
እንደ ቀላይ ይሰፋል
የሰጠኸኝ ስጦታ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 3
አያልቅም ለእኔ ያልከው
ለጋስ ነህ የኔ ጌታ
ምስጋናዬ ምስጋና
ውዳሴዬ ውዳሴ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 4
አንተ ነህ ከፍታዬ
ክብርና ሞገሴ
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 5
ውለታህ ነው ከፍ ያለ[2×]
ፍቅርህ ይመዝናል ነግሶ በልቤ ላይ
ከምዝምዝ ወርቅና ከቀይ ዕንቁ በላይ
ሃይልህ በድካሜ እየተገለጠ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 6
በልጅ ባርከኸኛል ከሁሉ የበለጠ
ደረቅ ዛፍ ነኝ አልልም
ባንተ ጸጋ አፍርቼ
በሕያዋን ምድር ላይ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 7
ልኑር ሰምህን ጠርቼ
ምስጋናዬ ምስጋና
ውዳሴዬ ውዳሴ
አንተ ነህ ከፍታዬ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 8
ክብርና ሞገሴ
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 9
በታላቅ ጉባኤ ጽድቅህን ሳወራ
ጨለማው ታዘዘ አይኔ እንዲበራ
ሁልጊዜ አይሃለው በብዙ ማዳን
ስወጣ ስገባ በሌት እና ቀን

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 10
ማዕበሉ ዝም አለ ክንድህን ተደግፌ
የማይታለፈውን ስንቱን ነገር አልፌ
ምስጋናዬ ምስጋና
ውዳሴዬ ውዳሴ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 11
አንተ ነህ ከፍታዬ
ክብርና ሞገሴ
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 12
ውለታህ ነው ከፍ ያለ[2×]
የደኅንነቴ ቀንድ መተማመኛዬ
በሰልፎቼ መሃል ገብተሃል ጌታዬ
እጄ ጋሻ ሳይዝ ከሳሼ ወደቀ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 13
የቃልህን ዝናር ወገቤ ታጠቀ
ምን አለ በዚህ አለም ያላደረከው ለእኔ
ምን ይደንቃል ከአፌ ቢወጣ የድል ቅኔ
ምስጋናዬ ምስጋና

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 14
ውዳሴዬ ውዳሴ
አንተ ነህ ከፍታዬ
ክብርና ሞገሴ
ለእኔ ያላደረከው ምን አለ? [4×]

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 15
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]'
      AND lyrics_transliteration IS NOT DISTINCT FROM 'CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 1
Kezemene qut’r belay
Wiletah new kef yale[2×]
Kesemay werede ende net’ebt’ab
T’ele bereketh nuroyen liyat’egb

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 2
Yeelet enjeraye bathon wedaje
Man yigeba neber betezegaw deje
Ende qelay yisefal
Yeset’eኸgn sit’ota

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 3
Ayalqm leene yalkew
Legas neh yene Geta
Misganaye misgana
Widaseye widase

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 4
Ante neh keftaye
Kibrna mogese
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 5
Wiletah new kef yale[2×]
Fiqrh yimeznal negso belbe lay
Kemzmz werqna keqey enqu belay
Haylh bedkame eyetegelet’e

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 6
Belj barkeኸgnal kehulu yebelet’e
Dereq zaf negn allm
Bante ts’ega afrche
Behyawan midr lay

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 7
Linur semhn t’erche
Misganaye misgana
Widaseye widase
Ante neh keftaye

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 8
Kibrna mogese
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 9
Betalaq gubae ts’dqhn sawera
Ch’elemaw tazeze ayne endibera
Hulgize ayhalew bebzu madan
Siwet’a sigeba belet ena qen

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 10
Maebelu zim ale kindhn tedegfe
Yemaytalefewn sintun neger alfe
Misganaye misgana
Widaseye widase

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 11
Ante neh keftaye
Kibrna mogese
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 12
Wiletah new kef yale[2×]
Yedehnnete qend metemamegnaye
Beselfoche mehal gebtehal Getaye
Eje gasha sayz kesashe wedeqe

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 13
Yeqalhn zinar wegebe tat’eqe
Min ale bezih alem yaladerekew leene
Min yidenqal keafe biwet’a yedl qine
Misganaye misgana

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 14
Widaseye widase
Ante neh keftaye
Kibrna mogese
Leene yaladerekew min ale? [4×]

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 15
Kezemene qut’r belay
Wiletah new kef yale[2×]

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]'
  ) THEN
    NULL; -- Already formatted, idempotent safe skip
  ELSE
    UPDATE public.mezmur_data_import
    SET lyrics_amharic = 'CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 1
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ከሰማይ ወረደ እንደ ነጠብጣብ
ጠለ በረከትህ ኑሮዬን ሊያጠግብ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 2
የዕለት እንጀራዬ ባትሆን ወዳጄ
ማን ይገባ ነበር በተዘጋው ደጄ
እንደ ቀላይ ይሰፋል
የሰጠኸኝ ስጦታ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 3
አያልቅም ለእኔ ያልከው
ለጋስ ነህ የኔ ጌታ
ምስጋናዬ ምስጋና
ውዳሴዬ ውዳሴ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 4
አንተ ነህ ከፍታዬ
ክብርና ሞገሴ
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 5
ውለታህ ነው ከፍ ያለ[2×]
ፍቅርህ ይመዝናል ነግሶ በልቤ ላይ
ከምዝምዝ ወርቅና ከቀይ ዕንቁ በላይ
ሃይልህ በድካሜ እየተገለጠ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 6
በልጅ ባርከኸኛል ከሁሉ የበለጠ
ደረቅ ዛፍ ነኝ አልልም
ባንተ ጸጋ አፍርቼ
በሕያዋን ምድር ላይ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 7
ልኑር ሰምህን ጠርቼ
ምስጋናዬ ምስጋና
ውዳሴዬ ውዳሴ
አንተ ነህ ከፍታዬ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 8
ክብርና ሞገሴ
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 9
በታላቅ ጉባኤ ጽድቅህን ሳወራ
ጨለማው ታዘዘ አይኔ እንዲበራ
ሁልጊዜ አይሃለው በብዙ ማዳን
ስወጣ ስገባ በሌት እና ቀን

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 10
ማዕበሉ ዝም አለ ክንድህን ተደግፌ
የማይታለፈውን ስንቱን ነገር አልፌ
ምስጋናዬ ምስጋና
ውዳሴዬ ውዳሴ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 11
አንተ ነህ ከፍታዬ
ክብርና ሞገሴ
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 12
ውለታህ ነው ከፍ ያለ[2×]
የደኅንነቴ ቀንድ መተማመኛዬ
በሰልፎቼ መሃል ገብተሃል ጌታዬ
እጄ ጋሻ ሳይዝ ከሳሼ ወደቀ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 13
የቃልህን ዝናር ወገቤ ታጠቀ
ምን አለ በዚህ አለም ያላደረከው ለእኔ
ምን ይደንቃል ከአፌ ቢወጣ የድል ቅኔ
ምስጋናዬ ምስጋና

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 14
ውዳሴዬ ውዳሴ
አንተ ነህ ከፍታዬ
ክብርና ሞገሴ
ለእኔ ያላደረከው ምን አለ? [4×]

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 15
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]',
        lyrics_transliteration = 'CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 1
Kezemene qut’r belay
Wiletah new kef yale[2×]
Kesemay werede ende net’ebt’ab
T’ele bereketh nuroyen liyat’egb

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 2
Yeelet enjeraye bathon wedaje
Man yigeba neber betezegaw deje
Ende qelay yisefal
Yeset’eኸgn sit’ota

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 3
Ayalqm leene yalkew
Legas neh yene Geta
Misganaye misgana
Widaseye widase

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 4
Ante neh keftaye
Kibrna mogese
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 5
Wiletah new kef yale[2×]
Fiqrh yimeznal negso belbe lay
Kemzmz werqna keqey enqu belay
Haylh bedkame eyetegelet’e

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 6
Belj barkeኸgnal kehulu yebelet’e
Dereq zaf negn allm
Bante ts’ega afrche
Behyawan midr lay

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 7
Linur semhn t’erche
Misganaye misgana
Widaseye widase
Ante neh keftaye

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 8
Kibrna mogese
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 9
Betalaq gubae ts’dqhn sawera
Ch’elemaw tazeze ayne endibera
Hulgize ayhalew bebzu madan
Siwet’a sigeba belet ena qen

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 10
Maebelu zim ale kindhn tedegfe
Yemaytalefewn sintun neger alfe
Misganaye misgana
Widaseye widase

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 11
Ante neh keftaye
Kibrna mogese
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 12
Wiletah new kef yale[2×]
Yedehnnete qend metemamegnaye
Beselfoche mehal gebtehal Getaye
Eje gasha sayz kesashe wedeqe

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 13
Yeqalhn zinar wegebe tat’eqe
Min ale bezih alem yaladerekew leene
Min yidenqal keafe biwet’a yedl qine
Misganaye misgana

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 14
Widaseye widase
Ante neh keftaye
Kibrna mogese
Leene yaladerekew min ale? [4×]

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]

VERSE 15
Kezemene qut’r belay
Wiletah new kef yale[2×]

CHORUS
Leene yaladerekew min ale? [4×]
Kezemene qut’r belay
Wiletah new kef yale[2×]
Leene yaladerekew min ale? [4×]',
        updated_at = clock_timestamp()::text
    WHERE import_id = 'b2262b81-41d7-48f3-8f63-aae3ec26cd2b'::uuid
      AND deleted_at IS NULL
      AND lyrics_amharic IS NOT DISTINCT FROM 'CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 1
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ከሰማይ ወረደ እንደ ነጠብጣብ
ጠለ በረከትህ ኑሮዬን ሊያጠግብ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 2
የዕለት እንጀራዬ ባትሆን ወዳጄ
ማን ይገባ ነበር በተዘጋው ደጄ
እንደ ቀላይ ይሰፋል
የሰጠኸኝ ስጦታ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 3
አያልቅም ለእኔ ያልከው
ለጋስ ነህ የኔ ጌታ
ምስጋናዬ ምስጋና
ውዳሴዬ ውዳሴ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 4
አንተ ነህ ከፍታዬ
ክብርና ሞገሴ
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 5
ውለታህ ነው ከፍ ያለ[2×]
ፍቅርህ ይመዝናል ነግሶ በልቤ ላይ
ከምዝምዝ ወርቅና ከቀይ ዕንቁ በላይ
ሃይልህ በድካሜ እየተገለጠ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 6
በልጅ ባርከኸኛል ከሁሉ የበለጠ
ደረቅ ዛፍ ነኝ አልልም
ባንተ ጸጋ አፍርቼ
በሕያዋን ምድር ላይ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 7
ልኑር ሰምህን ጠርቼ
ምስጋናዬ ምስጋና
ውዳሴዬ ውዳሴ
አንተ ነህ ከፍታዬ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 8
ክብርና ሞገሴ
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 9
በታላቅ ጉባኤ ጽድቅህን ሳወራ
ጨለማው ታዘዘ አይኔ እንዲበራ
ሁልጊዜ አይሃለው በብዙ ማዳን
ስወጣ ስገባ በሌት እና ቀን

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 10
ማዕበሉ ዝም አለ ክንድህን ተደግፌ
የማይታለፈውን ስንቱን ነገር አልፌ
ምስጋናዬ ምስጋና
ውዳሴዬ ውዳሴ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 11
አንተ ነህ ከፍታዬ
ክብርና ሞገሴ
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 12
ውለታህ ነው ከፍ ያለ[2×]
የደኅንነቴ ቀንድ መተማመኛዬ
በሰልፎቼ መሃል ገብተሃል ጌታዬ
እጄ ጋሻ ሳይዝ ከሳሼ ወደቀ

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 13
የቃልህን ዝናር ወገቤ ታጠቀ
ምን አለ በዚህ አለም ያላደረከው ለእኔ
ምን ይደንቃል ከአፌ ቢወጣ የድል ቅኔ
ምስጋናዬ ምስጋና

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 14
ውዳሴዬ ውዳሴ
አንተ ነህ ከፍታዬ
ክብርና ሞገሴ
ለእኔ ያላደረከው ምን አለ? [4×]

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]

VERSE 15
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]

CHORUS
ለእኔ ያላደረከው ምን አለ? [4×]
ከዘመኔ ቁጥር በላይ
ውለታህ ነው ከፍ ያለ[2×]
ለእኔ ያላደረከው ምን አለ? [4×]'
      AND lyrics_transliteration IS NOT DISTINCT FROM NULL;
    GET DIAGNOSTICS v_rows = ROW_COUNT;
    IF v_rows <> 1 THEN
      RAISE EXCEPTION 'Concurrency conflict on import_id % (slug: %): expected 1 row updated, got %',
        'b2262b81-41d7-48f3-8f63-aae3ec26cd2b'::uuid, 'leene-yaladerekew-min-ale', v_rows
        USING ERRCODE = '40001';
    END IF;
  END IF;

END $$;

NOTIFY pgrst, 'reload schema';

COMMIT;
